/* VE ELF support for BFD.
   Copyright (C) 2014-2016 NEC Corporation.

   This file is part of BFD, the Binary File Descriptor library.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
   MA 02110-1301, USA.
*/

/* This file holds definitions specifiec to the VE ELF ABI. Note
   that most of this is not actually implemented by BFD. */

#ifndef __ELF_VE_H__
#define __ELF_VE_H__

#include "elf/reloc-macros.h"

/* VE relocs. */
START_RELOC_NUMBERS (elf_ve_reloc_type)
  RELOC_NUMBER (R_VE_NONE, 0)	/* No reloc */
  RELOC_NUMBER (R_VE_REFLONG, 1)	/* Direct 32 bit */
  RELOC_NUMBER (R_VE_REFQUAD, 2)	/* Direct 64 bit */
  RELOC_NUMBER (R_VE_SREL32, 3)	/* PC relative 32 bit */
  RELOC_NUMBER (R_VE_HI32, 4)
  RELOC_NUMBER (R_VE_LO32, 5)
  RELOC_NUMBER (R_VE_PC_HI32, 6)
  RELOC_NUMBER (R_VE_PC_LO32, 7)
  RELOC_NUMBER (R_VE_GOT32, 8)
  RELOC_NUMBER (R_VE_GOT_HI32, 9)
  RELOC_NUMBER (R_VE_GOT_LO32, 10)
  RELOC_NUMBER (R_VE_GOTOFF32, 11)
  RELOC_NUMBER (R_VE_GOTOFF_HI32, 12)
  RELOC_NUMBER (R_VE_GOTOFF_LO32, 13)
  RELOC_NUMBER (R_VE_PLT32, 14)
  RELOC_NUMBER (R_VE_PLT_HI32, 15)
  RELOC_NUMBER (R_VE_PLT_LO32, 16)
  RELOC_NUMBER (R_VE_RELATIVE, 17)
  RELOC_NUMBER (R_VE_GLOB_DAT, 18)
  RELOC_NUMBER (R_VE_JUMP_SLOT, 19)
  RELOC_NUMBER (R_VE_COPY, 20)
  RELOC_NUMBER (R_VE_IRELATIVE, 21)
  RELOC_NUMBER (R_VE_DTPMOD64, 22)
  RELOC_NUMBER (R_VE_DTPOFF64, 23)
  RELOC_NUMBER (R_VE_TPOFF64, 24)
  RELOC_NUMBER (R_VE_TLS_GD_HI32, 25)
  RELOC_NUMBER (R_VE_TLS_GD_LO32, 26)
  RELOC_NUMBER (R_VE_TLS_LD_HI32, 27)
  RELOC_NUMBER (R_VE_TLS_LD_LO32, 28)
  RELOC_NUMBER (R_VE_DTPOFF32, 29)
  RELOC_NUMBER (R_VE_TLS_IE_HI32, 30)
  RELOC_NUMBER (R_VE_TLS_IE_LO32, 31)
  RELOC_NUMBER (R_VE_TPOFF_HI32, 32)
  RELOC_NUMBER (R_VE_TPOFF_LO32, 33)
  RELOC_NUMBER (R_VE_TPOFF32, 34)
  RELOC_NUMBER (R_VE_CALL_HI32, 35)
  RELOC_NUMBER (R_VE_CALL_LO32, 36)

END_RELOC_NUMBERS (R_VE_max)

/* Processor specific flags for the ELF header e_flags field.  */
/* VE architecture field.  */
#define EF_VE_ARCH_MASK		0x0000000f
#define EF_VE_ARCH_VE1		0x00000000
#define EF_VE_ARCH_VE3		0x00000001

/* VE ABI version field.  */
#define EF_VE_ABI_MASK		0x000f0000
#define EF_VE_ABI_VER1		0x00000000
#define EF_VE_ABI_VER2		0x00010000

/* VE Half-precision floating point number format field.  */
#define EF_VE_FP16_MASK		0xC0000000
#define EF_VE_FP16_NONE		0x00000000
#define EF_VE_FP16_IEEE		0x80000000
#define EF_VE_FP16_BFLOAT	0x40000000
#define EF_VE_FP16_MIXED	0xC0000000

#ifdef	VE3_CODE_MOD
#define EF_VE_DYNAMIC_CD	0x00000000
#define EF_VE_NO_DYNAMIC_CD	0x00000100

#define EF_VE_ARCH(flags) 	((flags) & EF_VE_ARCH_MASK)
#define EF_VE_ABI_VERSION(flags) ((flags) & EF_VE_ABI_MASK)
#define EF_VE_FP16_MODEL(flags) ((flags) & EF_VE_FP16_MASK)
#define EF_VE_DYNAMIC_CD_FLAG(flags)	((flags) & EF_VE_NO_DYNAMIC_CD)
#endif	/* VE3_CODE_MOD */

#endif /* !__ELF_VE_H__ */
