	.text
	.ident	"Cray C : Version 8.6.1"
	.file	"The Cpu Module"
                                        # Start of file scope inline assembly
	.pushsection	.note.ftn_module_data
	.balign	4
	.4byte	10, 1f-0f, 8
	.asciz	"Cray Inc."
	.balign	4
0:
	.ascii	"\132\355\073\133\235\151\001\000\001\000\001\000\024\000"
	.ascii	"\000\000\026\000\000\000\057\164\155\160\057\160\145\137"
	.ascii	"\071\062\065\067\063\057\057\160\154\144\151\162\000\146"
	.ascii	"\141\163\164\055\164\162\141\143\153\055\144\145\142\165"
	.ascii	"\147\147\151\156\147\056\163\000"
	.balign	4
1:	.popsection

                                        # End of file scope inline assembly
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_0:
	.quad	4686111960511545344     # double 2.0E+5
.LCPI0_1:
	.quad	4607182418800017408     # double 1
	.text
	.globl	do_3
	.p2align	5, 0x90
	.type	do_3,@function
do_3:                                   # @do_3
	.cfi_startproc
..TxtBeg_F1:
	.file	1  "fast-track-debugging.c"
	.loc	1  25  0
# BB#0:                                 # %", bb1:file fast-track-debugging.c, line 25, bb11"
	xorl	%eax, %eax
	vmovsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	vmovsd	.LCPI0_1(%rip), %xmm1   # xmm1 = mem[0],zero
	.p2align	5, 0x90
.LBBdo_3_1:                             # %"@CFE_12_1$do_3:file fast-track-debugging.c, line 29, in inner loop at depth 0, bb12"
                                        # =>This Inner Loop Header: Depth=1
	.loc	1  30  0
	vsqrtsd	%xmm0, %xmm0, %xmm0     # fast-track-debugging.c:30
	vaddsd	%xmm1, %xmm0, %xmm0     # fast-track-debugging.c:30
	.loc	1  29  0
	incq	%rax                    # fast-track-debugging.c:29
	cmpq	$19999, %rax            # fast-track-debugging.c:29
                                        # imm = 0x4E1F
	jl	.LBBdo_3_1              # fast-track-debugging.c:29
# BB#2:                                 # %"@CFE_12_2$do_3"
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	.loc	1  31  0
	movl	$initialized$$$CFE_id_d784a84c_do_3, %edi # fast-track-debugging.c:31
	movb	$1, %al                 # fast-track-debugging.c:31
	callq	printf                  # fast-track-debugging.c:31
	.loc	1  32  0
	popq	%rbp                    # fast-track-debugging.c:32
	retq                            # fast-track-debugging.c:32
..TxtEnd_F1:
.Lfunc_end0:
	.size	do_3, .Lfunc_end0-do_3
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	dbg$do_3
	.p2align	5, 0x90
	.type	dbg$do_3,@function
dbg$do_3:                               # @"dbg$do_3"
	.cfi_startproc
..TxtBeg_F2:
	.loc	1  25  0
# BB#0:                                 # %"@CFE_debug_label_22"
	.loc	1  27  0
	subq	$24, %rsp               # fast-track-debugging.c:27
.Ltmp3:
	.cfi_def_cfa_offset 32
	movl	$20000, 12(%rsp)        # fast-track-debugging.c:27
                                        # imm = 0x4E20
	.loc	1  28  0
	movabsq	$4686111960511545344, %rax # fast-track-debugging.c:28
                                        # imm = 0x41086A0000000000
	movq	%rax, 16(%rsp)          # fast-track-debugging.c:28
	.loc	1  29  0
	decl	12(%rsp)                # fast-track-debugging.c:29
	je	.LBBdbg$do_3_5
# BB#1:                                 # %", bb6"
	vmovsd	.LCPI1_0(%rip), %xmm2   # xmm2 = mem[0],zero
	.p2align	5, 0x90
.LBBdbg$do_3_2:                         # %"@CFE_debug_label_23"
                                        # =>This Inner Loop Header: Depth=1
	.loc	1  30  0
	vmovsd	16(%rsp), %xmm1         # fast-track-debugging.c:30
                                        # xmm1 = mem[0],zero
	vxorps	%xmm0, %xmm0, %xmm0     # fast-track-debugging.c:30
	vsqrtsd	%xmm1, %xmm0, %xmm0     # fast-track-debugging.c:30
	vucomisd	%xmm0, %xmm0    # fast-track-debugging.c:30
	jnp	.LBBdbg$do_3_4
# BB#3:                                 # %call.sqrt
                                        #   in Loop: Header=BB1_2 Depth=1
	vmovaps	%xmm1, %xmm0            # fast-track-debugging.c:30
	callq	sqrt                    # fast-track-debugging.c:30
	vmovsd	.LCPI1_0(%rip), %xmm2   # Remat: depth 1
                                        # xmm2 = mem[0],zero
.LBBdbg$do_3_4:                         # %"@CFE_debug_label_24"
                                        #   in Loop: Header=BB1_2 Depth=1
	vaddsd	%xmm2, %xmm0, %xmm0     # fast-track-debugging.c:30
	vmovsd	%xmm0, 16(%rsp)         # fast-track-debugging.c:30
	.loc	1  29  0
	decl	12(%rsp)                # fast-track-debugging.c:29
	jne	.LBBdbg$do_3_2
.LBBdbg$do_3_5:                         # %"@CFE_debug_label_26"
	.loc	1  31  0
	vmovsd	16(%rsp), %xmm0         # fast-track-debugging.c:31
                                        # xmm0 = mem[0],zero
	movl	$initialized$$$CFE_id_d784a84c_do_3, %edi # fast-track-debugging.c:31
	movb	$1, %al                 # fast-track-debugging.c:31
	callq	printf                  # fast-track-debugging.c:31
	.loc	1  32  0
	addq	$24, %rsp               # fast-track-debugging.c:32
	retq                            # fast-track-debugging.c:32
..TxtEnd_F2:
.Lfunc_end1:
	.size	dbg$do_3, .Lfunc_end1-dbg$do_3
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_0:
	.quad	4686111960511545344     # double 2.0E+5
.LCPI2_1:
	.quad	4607182418800017408     # double 1
	.text
	.globl	do_2
	.p2align	5, 0x90
	.type	do_2,@function
do_2:                                   # @do_2
	.cfi_startproc
..TxtBeg_F3:
	.loc	1  34  0
# BB#0:                                 # %", bb1:file fast-track-debugging.c, line 34, bb11"
	xorl	%eax, %eax
	vmovsd	.LCPI2_0(%rip), %xmm1   # xmm1 = mem[0],zero
	vmovsd	.LCPI2_1(%rip), %xmm0   # xmm0 = mem[0],zero
	.p2align	5, 0x90
.LBBdo_2_1:                             # %"@CFE_12_4$do_2:file fast-track-debugging.c, line 38, in inner loop at depth 0, bb12"
                                        # =>This Inner Loop Header: Depth=1
	.loc	1  39  0
	vsqrtsd	%xmm1, %xmm0, %xmm1     # fast-track-debugging.c:39
	vaddsd	%xmm0, %xmm1, %xmm1     # fast-track-debugging.c:39
	.loc	1  38  0
	incq	%rax                    # fast-track-debugging.c:38
	cmpq	$19999, %rax            # fast-track-debugging.c:38
                                        # imm = 0x4E1F
	jl	.LBBdo_2_1              # fast-track-debugging.c:38
# BB#2:                                 # %"@CFE_12_5$do_2"
	pushq	%rbp
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	vmovsd	%xmm1, -8(%rbp)         # 8-byte Spill: depth 0
	.loc	1  40  0
	callq	do_3                    # fast-track-debugging.c:40
	.loc	1  41  0
	movl	$initialized$$$CFE_id_d784a84c_do_3, %edi # fast-track-debugging.c:41
	movb	$1, %al                 # fast-track-debugging.c:41
	vmovsd	-8(%rbp), %xmm0         # fast-track-debugging.c:41 8-byte Reload: depth 0
                                        # xmm0 = mem[0],zero
	callq	printf                  # fast-track-debugging.c:41
	.loc	1  42  0
	addq	$16, %rsp               # fast-track-debugging.c:42
	popq	%rbp                    # fast-track-debugging.c:42
	retq                            # fast-track-debugging.c:42
..TxtEnd_F3:
.Lfunc_end2:
	.size	do_2, .Lfunc_end2-do_2
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI3_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	dbg$do_2
	.p2align	5, 0x90
	.type	dbg$do_2,@function
dbg$do_2:                               # @"dbg$do_2"
	.cfi_startproc
..TxtBeg_F4:
	.loc	1  34  0
# BB#0:                                 # %"@CFE_debug_label_30"
	.loc	1  36  0
	subq	$24, %rsp               # fast-track-debugging.c:36
.Ltmp7:
	.cfi_def_cfa_offset 32
	movl	$20000, 12(%rsp)        # fast-track-debugging.c:36
                                        # imm = 0x4E20
	.loc	1  37  0
	movabsq	$4686111960511545344, %rax # fast-track-debugging.c:37
                                        # imm = 0x41086A0000000000
	movq	%rax, 16(%rsp)          # fast-track-debugging.c:37
	.loc	1  38  0
	decl	12(%rsp)                # fast-track-debugging.c:38
	je	.LBBdbg$do_2_5
# BB#1:                                 # %", bb6"
	vmovsd	.LCPI3_0(%rip), %xmm2   # xmm2 = mem[0],zero
	.p2align	5, 0x90
.LBBdbg$do_2_2:                         # %"@CFE_debug_label_31"
                                        # =>This Inner Loop Header: Depth=1
	.loc	1  39  0
	vmovsd	16(%rsp), %xmm1         # fast-track-debugging.c:39
                                        # xmm1 = mem[0],zero
	vxorps	%xmm0, %xmm0, %xmm0     # fast-track-debugging.c:39
	vsqrtsd	%xmm1, %xmm0, %xmm0     # fast-track-debugging.c:39
	vucomisd	%xmm0, %xmm0    # fast-track-debugging.c:39
	jnp	.LBBdbg$do_2_4
# BB#3:                                 # %call.sqrt
                                        #   in Loop: Header=BB3_2 Depth=1
	vmovaps	%xmm1, %xmm0            # fast-track-debugging.c:39
	callq	sqrt                    # fast-track-debugging.c:39
	vmovsd	.LCPI3_0(%rip), %xmm2   # Remat: depth 1
                                        # xmm2 = mem[0],zero
.LBBdbg$do_2_4:                         # %"@CFE_debug_label_32"
                                        #   in Loop: Header=BB3_2 Depth=1
	vaddsd	%xmm2, %xmm0, %xmm0     # fast-track-debugging.c:39
	vmovsd	%xmm0, 16(%rsp)         # fast-track-debugging.c:39
	.loc	1  38  0
	decl	12(%rsp)                # fast-track-debugging.c:38
	jne	.LBBdbg$do_2_2
.LBBdbg$do_2_5:                         # %"@CFE_debug_label_35"
	.loc	1  40  0
	callq	do_3                    # fast-track-debugging.c:40
	.loc	1  41  0
	vmovsd	16(%rsp), %xmm0         # fast-track-debugging.c:41
                                        # xmm0 = mem[0],zero
	movl	$initialized$$$CFE_id_d784a84c_do_3, %edi # fast-track-debugging.c:41
	movb	$1, %al                 # fast-track-debugging.c:41
	callq	printf                  # fast-track-debugging.c:41
	.loc	1  42  0
	addq	$24, %rsp               # fast-track-debugging.c:42
	retq                            # fast-track-debugging.c:42
..TxtEnd_F4:
.Lfunc_end3:
	.size	dbg$do_2, .Lfunc_end3-dbg$do_2
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI4_0:
	.quad	4686111960511545344     # double 2.0E+5
.LCPI4_1:
	.quad	4607182418800017408     # double 1
	.text
	.globl	do_1
	.p2align	5, 0x90
	.type	do_1,@function
do_1:                                   # @do_1
	.cfi_startproc
..TxtBeg_F5:
	.loc	1  44  0
# BB#0:                                 # %", bb1:file fast-track-debugging.c, line 44, bb11"
	xorl	%eax, %eax
	vmovsd	.LCPI4_0(%rip), %xmm1   # xmm1 = mem[0],zero
	vmovsd	.LCPI4_1(%rip), %xmm0   # xmm0 = mem[0],zero
	.p2align	5, 0x90
.LBBdo_1_1:                             # %"@CFE_12_7$do_1:file fast-track-debugging.c, line 48, in inner loop at depth 0, bb12"
                                        # =>This Inner Loop Header: Depth=1
	.loc	1  49  0
	vsqrtsd	%xmm1, %xmm0, %xmm1     # fast-track-debugging.c:49
	vaddsd	%xmm0, %xmm1, %xmm1     # fast-track-debugging.c:49
	.loc	1  48  0
	incq	%rax                    # fast-track-debugging.c:48
	cmpq	$19999, %rax            # fast-track-debugging.c:48
                                        # imm = 0x4E1F
	jl	.LBBdo_1_1              # fast-track-debugging.c:48
# BB#2:                                 # %"@CFE_12_8$do_1"
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	vmovsd	%xmm1, -8(%rbp)         # 8-byte Spill: depth 0
	.loc	1  50  0
	callq	do_2                    # fast-track-debugging.c:50
	.loc	1  51  0
	movl	$initialized$$$CFE_id_d784a84c_do_3, %edi # fast-track-debugging.c:51
	movb	$1, %al                 # fast-track-debugging.c:51
	vmovsd	-8(%rbp), %xmm0         # fast-track-debugging.c:51 8-byte Reload: depth 0
                                        # xmm0 = mem[0],zero
	callq	printf                  # fast-track-debugging.c:51
	.loc	1  52  0
	addq	$16, %rsp               # fast-track-debugging.c:52
	popq	%rbp                    # fast-track-debugging.c:52
	retq                            # fast-track-debugging.c:52
..TxtEnd_F5:
.Lfunc_end4:
	.size	do_1, .Lfunc_end4-do_1
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI5_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	dbg$do_1
	.p2align	5, 0x90
	.type	dbg$do_1,@function
dbg$do_1:                               # @"dbg$do_1"
	.cfi_startproc
..TxtBeg_F6:
	.loc	1  44  0
# BB#0:                                 # %"@CFE_debug_label_39"
	.loc	1  46  0
	subq	$24, %rsp               # fast-track-debugging.c:46
.Ltmp11:
	.cfi_def_cfa_offset 32
	movl	$20000, 12(%rsp)        # fast-track-debugging.c:46
                                        # imm = 0x4E20
	.loc	1  47  0
	movabsq	$4686111960511545344, %rax # fast-track-debugging.c:47
                                        # imm = 0x41086A0000000000
	movq	%rax, 16(%rsp)          # fast-track-debugging.c:47
	.loc	1  48  0
	decl	12(%rsp)                # fast-track-debugging.c:48
	je	.LBBdbg$do_1_5
# BB#1:                                 # %", bb6"
	vmovsd	.LCPI5_0(%rip), %xmm2   # xmm2 = mem[0],zero
	.p2align	5, 0x90
.LBBdbg$do_1_2:                         # %"@CFE_debug_label_40"
                                        # =>This Inner Loop Header: Depth=1
	.loc	1  49  0
	vmovsd	16(%rsp), %xmm1         # fast-track-debugging.c:49
                                        # xmm1 = mem[0],zero
	vxorps	%xmm0, %xmm0, %xmm0     # fast-track-debugging.c:49
	vsqrtsd	%xmm1, %xmm0, %xmm0     # fast-track-debugging.c:49
	vucomisd	%xmm0, %xmm0    # fast-track-debugging.c:49
	jnp	.LBBdbg$do_1_4
# BB#3:                                 # %call.sqrt
                                        #   in Loop: Header=BB5_2 Depth=1
	vmovaps	%xmm1, %xmm0            # fast-track-debugging.c:49
	callq	sqrt                    # fast-track-debugging.c:49
	vmovsd	.LCPI5_0(%rip), %xmm2   # Remat: depth 1
                                        # xmm2 = mem[0],zero
.LBBdbg$do_1_4:                         # %"@CFE_debug_label_41"
                                        #   in Loop: Header=BB5_2 Depth=1
	vaddsd	%xmm2, %xmm0, %xmm0     # fast-track-debugging.c:49
	vmovsd	%xmm0, 16(%rsp)         # fast-track-debugging.c:49
	.loc	1  48  0
	decl	12(%rsp)                # fast-track-debugging.c:48
	jne	.LBBdbg$do_1_2
.LBBdbg$do_1_5:                         # %"@CFE_debug_label_44"
	.loc	1  50  0
	callq	do_2                    # fast-track-debugging.c:50
	.loc	1  51  0
	vmovsd	16(%rsp), %xmm0         # fast-track-debugging.c:51
                                        # xmm0 = mem[0],zero
	movl	$initialized$$$CFE_id_d784a84c_do_3, %edi # fast-track-debugging.c:51
	movb	$1, %al                 # fast-track-debugging.c:51
	callq	printf                  # fast-track-debugging.c:51
	.loc	1  52  0
	addq	$24, %rsp               # fast-track-debugging.c:52
	retq                            # fast-track-debugging.c:52
..TxtEnd_F6:
.Lfunc_end5:
	.size	dbg$do_1, .Lfunc_end5-dbg$do_1
	.cfi_endproc

	.globl	main
	.p2align	5, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
..TxtBeg_F7:
	.loc	1  54  0
# BB#0:                                 # %", bb1:file fast-track-debugging.c, line 54, bb12"
	pushq	%rbp
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	.loc	1  57  0
	callq	do_1                    # fast-track-debugging.c:57
	.loc	1  59  0
	callq	do_3                    # fast-track-debugging.c:59
	.loc	1  61  0
	xorl	%eax, %eax              # fast-track-debugging.c:61
	popq	%rbp                    # fast-track-debugging.c:61
	retq                            # fast-track-debugging.c:61
..TxtEnd_F7:
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc

	.type	initialized$$$CFE_id_d784a84c_do_3,@object # @"initialized$$$CFE_id_d784a84c_do_3"
	.data
	.p2align	6
initialized$$$CFE_id_d784a84c_do_3:
	.quad	4404648444744131954     # 0x3d20746c75736572
	.quad	44668036384             # 0xa666c2520
	.size	initialized$$$CFE_id_d784a84c_do_3, 16


	.section	".note.GNU-stack","",@progbits


# Start of Compiler Generated Dwarf Information

	.file	2  "/usr/include/stdio.h"

	.section	.debug_line,"",@progbits
..debug_line:

	.section	.debug_info,"",@progbits
..debug_info:
	.byte	0x45,0x01,0x00,0x00,0x02,0x00
	.long	.debug_abbrev+0x00000000
	.byte	0x08,0x01
	.long	.debug_str+0x00000000
	.long	.debug_str+0x00000017
	.long	.debug_str+0x0000003c
	.byte	0x01,0x00
	.quad	..TxtBeg_F1+0x0000000000000000
	.quad	..TxtEnd_F7+0x0000000000000000
	.long	.debug_line+0x00000000
	.byte	0x02
	.long	.debug_str+0x00000053
	.byte	0x01,0x01,0x19
	.quad	..TxtBeg_F1+0x0000000000000000
	.quad	..TxtEnd_F1+0x0000000000000000
	.byte	0x01,0x57,0x03
	.long	.debug_str+0x00000058
	.byte	0x01,0x01,0x19
	.quad	..TxtBeg_F2+0x0000000000000000
	.quad	..TxtEnd_F2+0x0000000000000000
	.byte	0x01,0x57,0x7d,0x00,0x00,0x00,0x04,0x69
	.byte	0x00,0x7d,0x00,0x00,0x00,0x02,0x91,0x0c
	.byte	0x05
	.long	.debug_str+0x00000061
	.byte	0x84,0x00,0x00,0x00,0x02,0x91,0x10,0x00
	.byte	0x06,0x69,0x6e,0x74,0x00,0x05,0x04,0x07
	.long	.debug_str+0x00000069
	.byte	0x04,0x08,0x02
	.long	.debug_str+0x00000070
	.byte	0x01,0x01,0x22
	.quad	..TxtBeg_F3+0x0000000000000000
	.quad	..TxtEnd_F3+0x0000000000000000
	.byte	0x01,0x56,0x03
	.long	.debug_str+0x00000075
	.byte	0x01,0x01,0x22
	.quad	..TxtBeg_F4+0x0000000000000000
	.quad	..TxtEnd_F4+0x0000000000000000
	.byte	0x01,0x57,0xda,0x00,0x00,0x00,0x04,0x69
	.byte	0x00,0x7d,0x00,0x00,0x00,0x02,0x91,0x0c
	.byte	0x05
	.long	.debug_str+0x00000061
	.byte	0x84,0x00,0x00,0x00,0x02,0x91,0x10,0x00
	.byte	0x02
	.long	.debug_str+0x0000007e
	.byte	0x01,0x01,0x2c
	.quad	..TxtBeg_F5+0x0000000000000000
	.quad	..TxtEnd_F5+0x0000000000000000
	.byte	0x01,0x56,0x03
	.long	.debug_str+0x00000083
	.byte	0x01,0x01,0x2c
	.quad	..TxtBeg_F6+0x0000000000000000
	.quad	..TxtEnd_F6+0x0000000000000000
	.byte	0x01,0x57,0x29,0x01,0x00,0x00,0x04,0x69
	.byte	0x00,0x7d,0x00,0x00,0x00,0x02,0x91,0x0c
	.byte	0x05
	.long	.debug_str+0x00000061
	.byte	0x84,0x00,0x00,0x00,0x02,0x91,0x10,0x00
	.byte	0x08
	.long	.debug_str+0x0000008c
	.byte	0x01,0x01,0x36,0x7d,0x00,0x00,0x00
	.quad	..TxtBeg_F7+0x0000000000000000
	.quad	..TxtEnd_F7+0x0000000000000000
	.byte	0x01,0x57,0x00,0x00

	.section	.debug_abbrev,"",@progbits
..debug_abbrev:
	.byte	0x01,0x11,0x01,0x03,0x0e,0x1b,0x0e,0x25
	.byte	0x0e,0x13,0x0b,0x42,0x0b,0x11,0x01,0x12
	.byte	0x01,0x10,0x06,0x00,0x00,0x02,0x2e,0x00
	.byte	0x03,0x0e,0x3f,0x0c,0x3a,0x0b,0x3b,0x0b
	.byte	0x11,0x01,0x12,0x01,0x40,0x0a,0x00,0x00
	.byte	0x03,0x2e,0x01,0x03,0x0e,0x3f,0x0c,0x3a
	.byte	0x0b,0x3b,0x0b,0x11,0x01,0x12,0x01,0x40
	.byte	0x0a,0x01,0x13,0x00,0x00,0x04,0x34,0x00
	.byte	0x03,0x08,0x49,0x13,0x02,0x0a,0x00,0x00
	.byte	0x05,0x34,0x00,0x03,0x0e,0x49,0x13,0x02
	.byte	0x0a,0x00,0x00,0x06,0x24,0x00,0x03,0x08
	.byte	0x3e,0x0b,0x0b,0x0b,0x00,0x00,0x07,0x24
	.byte	0x00,0x03,0x0e,0x3e,0x0b,0x0b,0x0b,0x00
	.byte	0x00,0x08,0x2e,0x00,0x03,0x0e,0x3f,0x0c
	.byte	0x3a,0x0b,0x3b,0x0b,0x49,0x13,0x11,0x01
	.byte	0x12,0x01,0x40,0x0a,0x00,0x00,0x00

	.section	.debug_pubnames,"",@progbits
..debug_pubnames:
	.byte	0x59,0x00,0x00,0x00,0x02,0x00
	.long	.debug_info+0x00000000
	.byte	0x49,0x01,0x00,0x00,0x2e,0x00,0x00,0x00
	.byte	0x64,0x6f,0x5f,0x33,0x00,0x48,0x00,0x00
	.byte	0x00,0x64,0x62,0x67,0x24,0x64,0x6f,0x5f
	.byte	0x33,0x00,0x8b,0x00,0x00,0x00,0x64,0x6f
	.byte	0x5f,0x32,0x00,0xa5,0x00,0x00,0x00,0x64
	.byte	0x62,0x67,0x24,0x64,0x6f,0x5f,0x32,0x00
	.byte	0xda,0x00,0x00,0x00,0x64,0x6f,0x5f,0x31
	.byte	0x00,0xf4,0x00,0x00,0x00,0x64,0x62,0x67
	.byte	0x24,0x64,0x6f,0x5f,0x31,0x00,0x29,0x01
	.byte	0x00,0x00,0x6d,0x61,0x69,0x6e,0x00,0x00
	.byte	0x00,0x00,0x00

	.section	.debug_str,"MS",@progbits,1
..debug_str:
	.byte	0x66,0x61,0x73,0x74,0x2d,0x74,0x72,0x61
	.byte	0x63,0x6b,0x2d,0x64,0x65,0x62,0x75,0x67
	.byte	0x67,0x69,0x6e,0x67,0x2e,0x63,0x00,0x2f
	.byte	0x70,0x72,0x6f,0x6a,0x65,0x63,0x74,0x2f
	.byte	0x74,0x65,0x73,0x74,0x2f,0x64,0x64,0x74
	.byte	0x2f,0x72,0x69,0x63,0x68,0x2f,0x41,0x4c
	.byte	0x4c,0x2d,0x34,0x39,0x30,0x35,0x2f,0x63
	.byte	0x6f,0x64,0x65,0x00,0x43,0x72,0x61,0x79
	.byte	0x20,0x43,0x20,0x3a,0x20,0x56,0x65,0x72
	.byte	0x73,0x69,0x6f,0x6e,0x20,0x38,0x2e,0x36
	.byte	0x2e,0x31,0x00,0x64,0x6f,0x5f,0x33,0x00
	.byte	0x64,0x62,0x67,0x24,0x64,0x6f,0x5f,0x33
	.byte	0x00,0x66,0x6c,0x6f,0x61,0x74,0x5f,0x61
	.byte	0x00,0x64,0x6f,0x75,0x62,0x6c,0x65,0x00
	.byte	0x64,0x6f,0x5f,0x32,0x00,0x64,0x62,0x67
	.byte	0x24,0x64,0x6f,0x5f,0x32,0x00,0x64,0x6f
	.byte	0x5f,0x31,0x00,0x64,0x62,0x67,0x24,0x64
	.byte	0x6f,0x5f,0x31,0x00,0x6d,0x61,0x69,0x6e
	.byte	0x00

# End of Compiler Generated Dwarf Information

