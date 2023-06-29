/* Common target dependent code for GDB on ARM systems.
   Copyright (C) 2002-2016 Free Software Foundation, Inc.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
/* Changes by NEC Corporation for the VE port, 2017-2021 */

#ifndef VE_TDEP_H
#define VE_TDEP_H

/* Instruction size */
#define	VE_INSN_SIZE	8

/* Forward declarations.  */
struct gdbarch;
struct regset;
struct address_space;

#include "arch/ve.h"

#ifdef	VE3_CODE_MOD
#include "target.h"
#endif

/* Say how long Vector Mask registers are.  Used for documentation
   purposes and code readability.  These are fixed at 64 * 4 bits.  */
#define VM_REGISTER_SIZE        32

/* Say how long Vector registers are.  Used for documentation
   purposes and code readability.  These are fixed at 64 * 256 bits.  */
#define VEC_REGISTER_SIZE       2048

/* Number of machine registers.  The only define actually required 
   is gdbarch_num_regs.  The other definitions are used for documentation
   purposes and code readability.  */
/* For 26 bit ARM code, a fake copy of the PC is placed in register 25 (PS)
   (and called PS for processor status) so the status bits can be cleared
   from the PC (register 15).  For 32 bit ARM code, a copy of CPSR is placed
   in PS.  */
#define NUM_FREGS	8	/* Number of floating point registers.  */
#define NUM_SREGS	2	/* Number of status registers.  */
#define NUM_GREGS	18	/* Number of general purpose scalar registers %s45 to%s63.  */



/* Type of floating-point code in use by inferior.  There are really 3 models
   that are traditionally supported (plus the endianness issue), but gcc can
   only generate 2 of those.  The third is APCS_FLOAT, where arguments to
   functions are passed in floating-point registers.  

   In addition to the traditional models, VFP adds two more. 

   If you update this enum, don't forget to update fp_model_strings in 
   ve-tdep.c.  */

enum ve_float_model
{
  VE_FLOAT_AUTO,	/* Automatic detection.  Do not set in tdep.  */
  VE_FLOAT_LAST		/* Keep at end.  */
};

enum ve_float_16_model
{
  VE_FLOAT_16_NONE,	/* Half-precision floating point number unused.  */
  VE_FLOAT_16_IEEE,	/* binary16 available only on VE3 or later.  */
  VE_FLOAT_16_BFLOAT,	/* bfloat16 available only on VE3 or later.  */
};

/* ABI used by the inferior.  */
enum ve_abi_kind
{
  VE_ABI_AUTO,
  VE_ABI_VER0,	/* The intial ABI document 
		System V Application Binary Interface */
  VE_ABI_VER1,
  VE_ABI_VER2,
  VE_ABI_LAST
};

/* Convention for returning structures.  */

enum struct_return
{
  pcc_struct_return,		/* Return "short" structures in memory.  */
  reg_struct_return		/* Return "short" structures in registers.  */
};

/* Target-dependent structure in gdbarch.  */
struct gdbarch_tdep
{
  /* The ABI for this architecture.  It should never be set to
     VE_ABI_AUTO.  */
  enum ve_abi_kind ve_abi;

  enum ve_float_model fp_model; /* Floating point calling conventions.  */
  enum ve_float_16_model fp16_model;

  int have_pvl_registers;	/* Does the target report the Packed Vector Length  registers?  */
  int have_vec_registers;	/* Does the target report the Vector registers?  */
  CORE_ADDR lowest_pc;		/* Lowest address at which instructions 
				   will appear.  */

  const gdb_byte *ve_breakpoint;	/* Breakpoint pattern for an VE insn.  */
  int ve_breakpoint_size;	/* And its size.  */

  int jb_pc;			/* Offset to PC value in jump buffer.
				   If this is negative, longjmp support
				   will be disabled.  */
  size_t jb_elt_size;		/* And the size of each entry in the buf.  */

  /* Convention for returning structures.  */
  enum struct_return struct_return;

  /* Cached core file helpers.  */
  struct regset *gregset, *fpregset, *vfpregset;

  /* ISA-specific data types.  */
  struct type *ve_vm_type;
  struct type *ve_vec_type;

  /* Return the expected next PC if FRAME is stopped at a syscall
     instruction.  */
  CORE_ADDR (*syscall_next_pc) (struct frame_info *frame);

   /* Parse swi insn args, sycall record.  */
  int (*ve_swi_record) (struct regcache *regcache);
};

/* The maximum number of modified instructions generated for one single-stepped
   instruction, including the breakpoint (usually at the end of the instruction
   sequence) and any scratch words, etc.  */
#define DISPLACED_MODIFIED_INSNS	8

CORE_ADDR ve_skip_stub (struct frame_info *, CORE_ADDR);

extern pid_t ve_gdb_waitpid(pid_t , int *, int );
extern char *ve_exec_file;

/* ve_exec launcher path */
#define VE_EXEC		"ve_exec"
#define VE_EXEC_PATH "/opt/nec/ve/bin/" VE_EXEC

/* traceme option */
#define	VE_OPT_TRACEME	"--traceme"

/* check 16bit Floating-Point mode */
extern int ve_fp16_none(struct gdbarch * );
extern int ve_fp16_ieee(struct gdbarch * );
extern int ve_fp16_bfloat(struct gdbarch * );

/* Get VE arch number */
extern int get_ve_arch_number(void);
extern int ve_arch_number_sysfs(void);
extern int ve_arch_number_hwcap(void);
#define CLASS_VE	"/sys/class/ve"		/* Part #1 of ve_arch_class */
#define ARCH_FILE	"ve_arch_class"		/* Part #2 of ve_arch_class */
#define ARCH_FILE_BSIZE	16			/* buffer of contents in ve_arch_class */
#define ARCH_PATH_BSIZE	64			/* buffer of "/sys/class/ve/ve#/ve_arch_class" */
#define IS_VE1()	(get_ve_arch_number() == 1)
#define IS_VE3()	(get_ve_arch_number() == 3)

#define HWCAP_VE_MASK (0xFFFFFFFF)
#define HWCAP_VE_VE1 (0x0)
#define HWCAP_VE_VE3 (0x1)

extern int ve_ignore_registers(int );
extern int ve_reg_consistency(void);

#ifdef	VE3_CODE_MOD
extern enum target_xfer_status ve_memory_xfer_auxv(struct target_ops *,
                  enum target_object , const char *, gdb_byte *,
                  const gdb_byte *, ULONGEST , ULONGEST , ULONGEST *);

/* double booking */

#define		SIZE_2MB	(2*1024*1024)
/* Caution: REVISIT
 * 	Change the definitions of 'struct ve_xtbl_adr' and
 * 	'struct ve_xtbl_adr_hdr' to comments.
 * 	No changes to included files are required, because
 * 	"ve-tdep.h" includes the file defines them.
 */

/*
 * address xform table
 * (member)
 *	org:		start address of text section in original code
 *	xtbl:		address of address xform table
 *	xtbl_size:	sizeo of address xform table
 * (range)
 *   original address
 * 	org <= [address] <= org + xtbl_size - sizeof(uint64_t)
 *   modified address
 *	xtbl[0] <= [address] <= xtbl[xtbl_size/sizeof(uint64_t) - 1]
 */
struct ve_xtbl_adr {
	uint64_t	org;
	uint64_t *	xtbl;
	uint64_t	xtbl_size;
};

struct ve_xtbl_range {
	uint64_t	start;
	uint64_t	end;
};

struct ve_xtbl_adr_e {
	uint64_t	org;
	uint64_t *	xtbl;
	uint64_t	xtbl_size;
	ve_xtbl_range	range_o;	/* original address range */
	ve_xtbl_range	range_x;	/* translated address range */
};

/*
 * header of address xform table
 * (member)
 * 	num:	number of address xform table
 * 	tbl:	array of address xform table
 */
struct ve_xtbl_adr_hdr {
	uint64_t		num;
	struct ve_xtbl_adr 	tbl[(SIZE_2MB-sizeof(uint64_t))/sizeof(struct ve_xtbl_adr)];
};

struct ve_xtbl_adr_hdr_e {
	struct ve_xtbl_adr_hdr	hd;	/* original X header */
	uint64_t		num;
	struct ve_xtbl_adr_e *	tbl;
};

extern int ve_xtbl_org2mod(uint64_t , uint64_t *);
extern int ve_xtbl_mod2org(uint64_t , uint64_t *);
extern int ve3_debug_code_mod;
#endif	/* VE3_CODE_MOD */

#endif /* ve-tdep.h */
