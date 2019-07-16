	.text
	.ident	"Cray Fortran : Version 8.6.1"
	.file	"The Cpu Module"
                                        # Start of file scope inline assembly
	.pushsection	.note.ftn_module_data
	.balign	4
	.4byte	10, 1f-0f, 8
	.asciz	"Cray Inc."
	.balign	4
0:
	.ascii	"\220\306\074\133\216\165\001\000\001\000\001\000\024\000"
	.ascii	"\000\000\026\000\000\000\057\164\155\160\057\160\145\137"
	.ascii	"\071\065\066\063\060\057\057\160\154\144\151\162\000\146"
	.ascii	"\141\163\164\055\164\162\141\143\153\055\144\145\142\165"
	.ascii	"\147\147\151\156\147\056\163\000"
	.balign	4
1:	.popsection

                                        # End of file scope inline assembly
	.globl	recursive_subroutine_
	.p2align	5, 0x90
	.type	recursive_subroutine_,@function
recursive_subroutine_:                  # @recursive_subroutine_
	.cfi_startproc
..TxtBeg_F1:
	.file	1  "fast-track-debugging.f90"
	.loc	1  16  0
# BB#0:                                 # %", bb1:file fast-track-debugging.f90, line 16, bb18"
	.loc	1  19  0
	movl	(%rdi), %eax            # fast-track-debugging.f90:19
	cmpl	(%rsi), %eax            # fast-track-debugging.f90:19
	jge	.LBBrecursive_subroutine__2
# BB#1:                                 # %"file fast-track-debugging.f90, line 20, bb4"
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	.loc	1  20  0
	incl	%eax                    # fast-track-debugging.f90:20
	movl	%eax, (%rdi)            # fast-track-debugging.f90:20
	.loc	1  21  0
	callq	recursive_subroutine_   # fast-track-debugging.f90:21
	popq	%rbp
.LBBrecursive_subroutine__2:            # %"l$00001"
	.loc	1  23  0
	retq                            # fast-track-debugging.f90:23
..TxtEnd_F1:
.Lfunc_end0:
	.size	recursive_subroutine_, .Lfunc_end0-recursive_subroutine_
	.cfi_endproc

	.globl	dbg$recursive_subroutine_
	.p2align	5, 0x90
	.type	dbg$recursive_subroutine_,@function
dbg$recursive_subroutine_:              # @"dbg$recursive_subroutine_"
	.cfi_startproc
..TxtBeg_F2:
	.loc	1  16  0
# BB#0:                                 # %recursive_subroutine_
	subq	$24, %rsp               # fast-track-debugging.f90:16
.Ltmp3:
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)           # fast-track-debugging.f90:16
	movq	%rsi, (%rsp)            # fast-track-debugging.f90:16
	movl	(%rdi), %eax            # fast-track-debugging.f90:16
	movl	%eax, 20(%rsp)          # fast-track-debugging.f90:16
	.loc	1  19  0
	movl	(%rdi), %eax            # fast-track-debugging.f90:19
	cmpl	(%rsi), %eax            # fast-track-debugging.f90:19
	jge	.LBBdbg$recursive_subroutine__2
# BB#1:                                 # %"z$00003"
	.loc	1  20  0
	incl	(%rdi)                  # fast-track-debugging.f90:20
	.loc	1  21  0
	callq	dbg$recursive_subroutine_ # fast-track-debugging.f90:21
.LBBdbg$recursive_subroutine__2:        # %"l$00001"
	.loc	1  23  0
	addq	$24, %rsp               # fast-track-debugging.f90:23
	retq                            # fast-track-debugging.f90:23
..TxtEnd_F2:
.Lfunc_end1:
	.size	dbg$recursive_subroutine_, .Lfunc_end1-dbg$recursive_subroutine_
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI2_0:
	.long	1065353216              # float 1
.LCPI2_1:
	.long	1080452710              # float 3.5999999
	.text
	.globl	logistic_map_
	.p2align	5, 0x90
	.type	logistic_map_,@function
logistic_map_:                          # @logistic_map_
	.cfi_startproc
..TxtBeg_F3:
	.loc	1  25  0
# BB#0:                                 # %", bb1:file fast-track-debugging.f90, line 25, bb13"
	xorl	%eax, %eax
	.loc	1  30  0
	vmovss	($data_init$logistic_map_)+16(%rip), %xmm2 # fast-track-debugging.f90:30
                                        # xmm2 = mem[0],zero,zero,zero
	vmovss	.LCPI2_0(%rip), %xmm0   # fast-track-debugging.f90:30
                                        # xmm0 = mem[0],zero,zero,zero
	vmovss	.LCPI2_1(%rip), %xmm1   # fast-track-debugging.f90:30
                                        # xmm1 = mem[0],zero,zero,zero
	.p2align	5, 0x90
.LBBlogistic_map__1:                    # %", in inner loop at depth 0, bb19:file fast-track-debugging.f90, line 29, in inner loop at depth 0, bb21"
                                        # =>This Inner Loop Header: Depth=1
	vsubss	%xmm2, %xmm0, %xmm3     # fast-track-debugging.f90:30
	vmulss	%xmm3, %xmm2, %xmm2     # fast-track-debugging.f90:30
	vmulss	%xmm1, %xmm2, %xmm2     # fast-track-debugging.f90:30
	vsubss	%xmm2, %xmm0, %xmm3     # fast-track-debugging.f90:30
	vmulss	%xmm3, %xmm2, %xmm2     # fast-track-debugging.f90:30
	vmulss	%xmm1, %xmm2, %xmm2     # fast-track-debugging.f90:30
	vsubss	%xmm2, %xmm0, %xmm3     # fast-track-debugging.f90:30
	vmulss	%xmm3, %xmm2, %xmm2     # fast-track-debugging.f90:30
	vmulss	%xmm1, %xmm2, %xmm2     # fast-track-debugging.f90:30
	vsubss	%xmm2, %xmm0, %xmm3     # fast-track-debugging.f90:30
	vmulss	%xmm3, %xmm2, %xmm2     # fast-track-debugging.f90:30
	vmulss	%xmm1, %xmm2, %xmm2     # fast-track-debugging.f90:30
	.loc	1  31  0
	addq	$4, %rax                # fast-track-debugging.f90:31
	.loc	1  29  0
	cmpq	$200000, %rax           # fast-track-debugging.f90:29
                                        # imm = 0x30D40
	jl	.LBBlogistic_map__1     # fast-track-debugging.f90:29
# BB#2:                                 # %"file fast-track-debugging.f90, line 29, bb5"
	.loc	1  30  0
	vmovss	.LCPI2_0(%rip), %xmm0   # fast-track-debugging.f90:30
                                        # xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm2, %xmm0, %xmm0     # fast-track-debugging.f90:30
	vmulss	%xmm0, %xmm2, %xmm0     # fast-track-debugging.f90:30
	vmulss	.LCPI2_1(%rip), %xmm0, %xmm0 # fast-track-debugging.f90:30
	vmovss	%xmm0, ($data_init$logistic_map_)+16(%rip) # fast-track-debugging.f90:30
	.loc	1  31  0
	movl	$200001, ($data_init$logistic_map_)+8(%rip) # fast-track-debugging.f90:31
                                        # imm = 0x30D41
	.loc	1  32  0
	retq                            # fast-track-debugging.f90:32
..TxtEnd_F3:
.Lfunc_end2:
	.size	logistic_map_, .Lfunc_end2-logistic_map_
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI3_0:
	.long	1065353216              # float 1
	.text
	.globl	dbg$logistic_map_
	.p2align	5, 0x90
	.type	dbg$logistic_map_,@function
dbg$logistic_map_:                      # @"dbg$logistic_map_"
	.cfi_startproc
..TxtBeg_F4:
	.loc	1  25  0
# BB#0:                                 # %logistic_map_
	.loc	1  29  0
	movl	$0, ($data_init$logistic_map_)+8(%rip) # fast-track-debugging.f90:29
	movl	$0, -4(%rsp)            # fast-track-debugging.f90:29
	.loc	1  30  0
	vmovss	.LCPI3_0(%rip), %xmm0   # fast-track-debugging.f90:30
                                        # xmm0 = mem[0],zero,zero,zero
	.p2align	5, 0x90
.LBBdbg$logistic_map__1:                # %"z$00003"
                                        # =>This Inner Loop Header: Depth=1
	.loc	1  29  0
	movl	-4(%rsp), %eax          # fast-track-debugging.f90:29
	movl	%eax, ($data_init$logistic_map_)+8(%rip) # fast-track-debugging.f90:29
	.loc	1  30  0
	vmovss	($data_init$logistic_map_)+16(%rip), %xmm1 # fast-track-debugging.f90:30
                                        # xmm1 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm0, %xmm2     # fast-track-debugging.f90:30
	vmulss	($data_init$logistic_map_)(%rip), %xmm1, %xmm1 # fast-track-debugging.f90:30
	vmulss	%xmm2, %xmm1, %xmm1     # fast-track-debugging.f90:30
	vmovss	%xmm1, ($data_init$logistic_map_)+16(%rip) # fast-track-debugging.f90:30
	.loc	1  31  0
	movl	-4(%rsp), %eax          # fast-track-debugging.f90:31
	incl	%eax                    # fast-track-debugging.f90:31
	movl	%eax, -4(%rsp)          # fast-track-debugging.f90:31
	cmpl	$200001, %eax           # fast-track-debugging.f90:31
                                        # imm = 0x30D41
	jl	.LBBdbg$logistic_map__1 # fast-track-debugging.f90:31
# BB#2:                                 # %"29ubot1"
	movl	$200001, ($data_init$logistic_map_)+8(%rip) # fast-track-debugging.f90:31
                                        # imm = 0x30D41
	.loc	1  32  0
	retq                            # fast-track-debugging.f90:32
..TxtEnd_F4:
.Lfunc_end3:
	.size	dbg$logistic_map_, .Lfunc_end3-dbg$logistic_map_
	.cfi_endproc

	.globl	main
	.p2align	5, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
..TxtBeg_F5:
	.loc	1  34  0
# BB#0:                                 # %", bb1:file fast-track-debugging.f90, line 34, bb12"
	pushq	%rbp
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	.loc	1  37  0
	callq	logistic_map_           # fast-track-debugging.f90:37
	.loc	1  38  0
	prefetcht0	($data_init$main_)+8(%rip) # fast-track-debugging.f90:38
	prefetcht0	($data_init$main_)(%rip) # fast-track-debugging.f90:38
	movl	$($data_init$main_)+8, %edi # fast-track-debugging.f90:38
	movl	$($data_init$main_), %esi # fast-track-debugging.f90:38
	callq	recursive_subroutine_   # fast-track-debugging.f90:38
	.loc	1  39  0
	xorb	%al, %al                # fast-track-debugging.f90:39
	nop                             # fast-track-debugging.f90:39
	popq	%rbp                    # fast-track-debugging.f90:39
	retq                            # fast-track-debugging.f90:39
..TxtEnd_F5:
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc

	.type	$data_init$logistic_map_,@object # @"$data_init$logistic_map_"
	.data
	.globl	$data_init$logistic_map_
	.p2align	6
$data_init$logistic_map_:
	.quad	1080452710              # 0x40666666
	.quad	0                       # 0x0
	.quad	1056964608              # 0x3f000000
	.size	$data_init$logistic_map_, 24

	.type	$data_init$main_,@object # @"$data_init$main_"
	.globl	$data_init$main_
	.p2align	6
$data_init$main_:
	.quad	5                       # 0x5
	.quad	0                       # 0x0
	.size	$data_init$main_, 16


	.globl	main_
main_ = main
	.section	".note.GNU-stack","",@progbits


# Start of Compiler Generated Dwarf Information


	.section	.debug_line,"",@progbits
..debug_line:

	.section	.debug_info,"",@progbits
..debug_info:
	.byte	0x37,0x01,0x00,0x00,0x02,0x00
	.long	.debug_abbrev+0x00000000
	.byte	0x08,0x01
	.long	.debug_str+0x00000000
	.long	.debug_str+0x00000019
	.long	.debug_str+0x0000003e
	.byte	0x08,0x01
	.quad	..TxtBeg_F1+0x0000000000000000
	.quad	..TxtEnd_F5+0x0000000000000000
	.long	.debug_line+0x00000000
	.byte	0x02
	.long	.debug_str+0x0000005b
	.byte	0x01
	.long	.debug_str+0x00000070
	.byte	0x01,0x10
	.quad	..TxtBeg_F1+0x0000000000000000
	.quad	..TxtEnd_F1+0x0000000000000000
	.byte	0x01,0x57,0x61,0x00,0x00,0x00,0x03,0x78
	.byte	0x00,0x01,0x61,0x00,0x00,0x00,0x03,0x6e
	.byte	0x00,0x01,0x61,0x00,0x00,0x00,0x00,0x04
	.long	.debug_str+0x00000086
	.byte	0x05,0x04,0x02
	.long	.debug_str+0x0000005b
	.byte	0x01
	.long	.debug_str+0x00000090
	.byte	0x01,0x10
	.quad	..TxtBeg_F2+0x0000000000000000
	.quad	..TxtEnd_F2+0x0000000000000000
	.byte	0x01,0x57,0xa3,0x00,0x00,0x00,0x05,0x78
	.byte	0x00,0x01,0x03,0x91,0x08,0x06,0x61,0x00
	.byte	0x00,0x00,0x05,0x6e,0x00,0x01,0x03,0x91
	.byte	0x00,0x06,0x61,0x00,0x00,0x00,0x00,0x06
	.long	.debug_str+0x000000aa
	.byte	0x01
	.long	.debug_str+0x000000b7
	.byte	0x01,0x19
	.quad	..TxtBeg_F3+0x0000000000000000
	.quad	..TxtEnd_F3+0x0000000000000000
	.byte	0x01,0x57,0x02
	.long	.debug_str+0x000000aa
	.byte	0x01
	.long	.debug_str+0x000000c5
	.byte	0x01,0x19
	.quad	..TxtBeg_F4+0x0000000000000000
	.quad	..TxtEnd_F4+0x0000000000000000
	.byte	0x01,0x57,0x17,0x01,0x00,0x00,0x07,0x61
	.byte	0x00,0x17,0x01,0x00,0x00,0x09,0x03
	.quad	$data_init$logistic_map_+0x0000000000000000
	.byte	0x07,0x69,0x00,0x61,0x00,0x00,0x00,0x09
	.byte	0x03
	.quad	$data_init$logistic_map_+0x0000000000000008
	.byte	0x07,0x78,0x00,0x17,0x01,0x00,0x00,0x09
	.byte	0x03
	.quad	$data_init$logistic_map_+0x0000000000000010
	.byte	0x00,0x04
	.long	.debug_str+0x000000d7
	.byte	0x04,0x04,0x08
	.long	.debug_str+0x000000de
	.byte	0x01,0x02,0x01,0x22
	.quad	..TxtBeg_F5+0x0000000000000000
	.quad	..TxtEnd_F5+0x0000000000000000
	.byte	0x01,0x57,0x00,0x00

	.section	.debug_abbrev,"",@progbits
..debug_abbrev:
	.byte	0x01,0x11,0x01,0x03,0x0e,0x1b,0x0e,0x25
	.byte	0x0e,0x13,0x0b,0x42,0x0b,0x11,0x01,0x12
	.byte	0x01,0x10,0x06,0x00,0x00,0x02,0x2e,0x01
	.byte	0x03,0x0e,0x3f,0x0c,0x87,0x40,0x0e,0x3a
	.byte	0x0b,0x3b,0x0b,0x11,0x01,0x12,0x01,0x40
	.byte	0x0a,0x01,0x13,0x00,0x00,0x03,0x05,0x00
	.byte	0x03,0x08,0x4b,0x0c,0x49,0x13,0x00,0x00
	.byte	0x04,0x24,0x00,0x03,0x0e,0x3e,0x0b,0x0b
	.byte	0x0b,0x00,0x00,0x05,0x05,0x00,0x03,0x08
	.byte	0x4b,0x0c,0x02,0x0a,0x49,0x13,0x00,0x00
	.byte	0x06,0x2e,0x00,0x03,0x0e,0x3f,0x0c,0x87
	.byte	0x40,0x0e,0x3a,0x0b,0x3b,0x0b,0x11,0x01
	.byte	0x12,0x01,0x40,0x0a,0x00,0x00,0x07,0x34
	.byte	0x00,0x03,0x08,0x49,0x13,0x02,0x0a,0x00
	.byte	0x00,0x08,0x2e,0x00,0x03,0x0e,0x3f,0x0c
	.byte	0x36,0x0b,0x3a,0x0b,0x3b,0x0b,0x11,0x01
	.byte	0x12,0x01,0x40,0x0a,0x00,0x00,0x00

	.section	.debug_pubnames,"",@progbits
..debug_pubnames:
	.byte	0x6b,0x00,0x00,0x00,0x02,0x00
	.long	.debug_info+0x00000000
	.byte	0x3b,0x01,0x00,0x00,0x2e,0x00,0x00,0x00
	.byte	0x72,0x65,0x63,0x75,0x72,0x73,0x69,0x76
	.byte	0x65,0x5f,0x73,0x75,0x62,0x72,0x6f,0x75
	.byte	0x74,0x69,0x6e,0x65,0x00,0x68,0x00,0x00
	.byte	0x00,0x72,0x65,0x63,0x75,0x72,0x73,0x69
	.byte	0x76,0x65,0x5f,0x73,0x75,0x62,0x72,0x6f
	.byte	0x75,0x74,0x69,0x6e,0x65,0x00,0xa3,0x00
	.byte	0x00,0x00,0x6c,0x6f,0x67,0x69,0x73,0x74
	.byte	0x69,0x63,0x5f,0x6d,0x61,0x70,0x00,0xc1
	.byte	0x00,0x00,0x00,0x6c,0x6f,0x67,0x69,0x73
	.byte	0x74,0x69,0x63,0x5f,0x6d,0x61,0x70,0x00
	.byte	0x1e,0x01,0x00,0x00,0x6d,0x61,0x69,0x6e
	.byte	0x00,0x00,0x00,0x00,0x00

	.section	.debug_str,"MS",@progbits,1
..debug_str:
	.byte	0x66,0x61,0x73,0x74,0x2d,0x74,0x72,0x61
	.byte	0x63,0x6b,0x2d,0x64,0x65,0x62,0x75,0x67
	.byte	0x67,0x69,0x6e,0x67,0x2e,0x66,0x39,0x30
	.byte	0x00,0x2f,0x70,0x72,0x6f,0x6a,0x65,0x63
	.byte	0x74,0x2f,0x74,0x65,0x73,0x74,0x2f,0x64
	.byte	0x64,0x74,0x2f,0x72,0x69,0x63,0x68,0x2f
	.byte	0x41,0x4c,0x4c,0x2d,0x34,0x39,0x30,0x35
	.byte	0x2f,0x63,0x6f,0x64,0x65,0x00,0x43,0x72
	.byte	0x61,0x79,0x20,0x46,0x6f,0x72,0x74,0x72
	.byte	0x61,0x6e,0x20,0x3a,0x20,0x56,0x65,0x72
	.byte	0x73,0x69,0x6f,0x6e,0x20,0x38,0x2e,0x36
	.byte	0x2e,0x31,0x00,0x72,0x65,0x63,0x75,0x72
	.byte	0x73,0x69,0x76,0x65,0x5f,0x73,0x75,0x62
	.byte	0x72,0x6f,0x75,0x74,0x69,0x6e,0x65,0x00
	.byte	0x72,0x65,0x63,0x75,0x72,0x73,0x69,0x76
	.byte	0x65,0x5f,0x73,0x75,0x62,0x72,0x6f,0x75
	.byte	0x74,0x69,0x6e,0x65,0x5f,0x00,0x49,0x4e
	.byte	0x54,0x45,0x47,0x45,0x52,0x2a,0x34,0x00
	.byte	0x64,0x62,0x67,0x24,0x72,0x65,0x63,0x75
	.byte	0x72,0x73,0x69,0x76,0x65,0x5f,0x73,0x75
	.byte	0x62,0x72,0x6f,0x75,0x74,0x69,0x6e,0x65
	.byte	0x5f,0x00,0x6c,0x6f,0x67,0x69,0x73,0x74
	.byte	0x69,0x63,0x5f,0x6d,0x61,0x70,0x00,0x6c
	.byte	0x6f,0x67,0x69,0x73,0x74,0x69,0x63,0x5f
	.byte	0x6d,0x61,0x70,0x5f,0x00,0x64,0x62,0x67
	.byte	0x24,0x6c,0x6f,0x67,0x69,0x73,0x74,0x69
	.byte	0x63,0x5f,0x6d,0x61,0x70,0x5f,0x00,0x52
	.byte	0x45,0x41,0x4c,0x2a,0x34,0x00,0x6d,0x61
	.byte	0x69,0x6e,0x00

# End of Compiler Generated Dwarf Information

