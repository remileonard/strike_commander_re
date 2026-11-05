seg084		segment	para public 'CODE' use16
		assume cs:seg084
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E7h

loc_38691:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38694		proc far

var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_1], 0
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602B0, eax
		push	0
		push	605Ah
		call	sub_19409
		add	sp, 4
		or	al, al
		jnz	short loc_386BF
		jmp	loc_389F6

loc_386BF:
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602B4, eax
		mov	al, byte_5FDDF
		mov	ah, 0
		cmp	ax, 0Fh
		jz	short loc_38724
		cmp	ax, 19h
		jnz	short loc_386DE
		jmp	loc_38831

loc_386DE:
		cmp	ax, 20h
		jz	short loc_386E6
		jmp	loc_3896A

loc_386E6:
		cmp	byte_5FDDE, 1
		jnz	short loc_386FD
		test	byte_5FDE1, 0Ch
		jz	short loc_386F9
		mov	ax, 1
		jmp	short loc_386FB

loc_386F9:
		xor	ax, ax

loc_386FB:
		jmp	short loc_38712

loc_386FD:
		cmp	byte_605C0, 1
		jz	short loc_3870B
		cmp	byte_605CC, 1
		jnz	short loc_38710

loc_3870B:
		mov	ax, 1
		jmp	short loc_38712

loc_38710:
		xor	ax, ax

loc_38712:
		or	al, al
		jnz	short loc_38719
		jmp	loc_3896A

loc_38719:
		mov	al, byte_5C5B7
		xor	al, 1
		mov	byte_5C5B7, al
		jmp	loc_3896A

loc_38724:
		mov	eax, dword_601B1
		sar	eax, 1Fh
		and	ax, 1
		or	ax, ax
		jnz	short loc_38736
		jmp	loc_3896A

loc_38736:
		mov	byte_5C5B3, 1
		cmp	byte_5FDDE, 1
		jnz	short loc_38752
		test	byte_5FDE1, 0Ch
		jz	short loc_3874E
		mov	ax, 1
		jmp	short loc_38750

loc_3874E:
		xor	ax, ax

loc_38750:
		jmp	short loc_38767

loc_38752:
		cmp	byte_605C0, 1
		jz	short loc_38760
		cmp	byte_605CC, 1
		jnz	short loc_38765

loc_38760:
		mov	ax, 1
		jmp	short loc_38767

loc_38765:
		xor	ax, ax

loc_38767:
		or	al, al
		jnz	short loc_3876E
		jmp	loc_387F0

loc_3876E:
		mov	byte_5C5B2, 0
		mov	byte_5C5B3, 0
		cmp	word_5C5B4, 1
		jnz	short loc_38787
		mov	word_5C5B4, 2
		jmp	short loc_387A3

loc_38787:
		cmp	word_5C5B4, 2
		jnz	short loc_38796
		mov	word_5C5B4, 4
		jmp	short loc_387A3

loc_38796:
		cmp	word_5C5B4, 4
		jnz	short loc_387A3
		mov	word_5C5B4, 1

loc_387A3:
		mov	ax, word_5C5B4
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_5C5AE, eax
		push	word_5C5B4
		push	28A9h
		lea	ax, [bp+var_28]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_2C], 200h
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		push	ds
		push	offset unk_601D9
		call	sub_59533
		add	sp, 0Ch
		jmp	loc_3896A

loc_387F0:
		cmp	byte_5FDDE, 1
		jnz	short loc_38807
		test	byte_5FDE1, 0Ch
		jz	short loc_38803
		mov	ax, 1
		jmp	short loc_38805

loc_38803:
		xor	ax, ax

loc_38805:
		jmp	short loc_3881C

loc_38807:
		cmp	byte_605C0, 1
		jz	short loc_38815
		cmp	byte_605CC, 1
		jnz	short loc_3881A

loc_38815:
		mov	ax, 1
		jmp	short loc_3881C

loc_3881A:
		xor	ax, ax

loc_3881C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_38825
		jmp	loc_3896A

loc_38825:
		mov	dword_601AD, 0F00h
		jmp	loc_3896A

loc_38831:
		call	SoundFX_StopAll_3D2B7
		call	Keyboard_ReportErrorIfActive_3D1AA
		cmp	byte_5FDDE, 1
		jnz	short loc_38852
		test	byte_5FDE1, 0C0h
		jz	short loc_3884E
		mov	ax, 1
		jmp	short loc_38850

loc_3884E:
		xor	ax, ax

loc_38850:
		jmp	short loc_38867

loc_38852:
		cmp	byte_605CE, 1
		jz	short loc_38860
		cmp	byte_605EF, 1
		jnz	short loc_38865

loc_38860:
		mov	ax, 1
		jmp	short loc_38867

loc_38865:
		xor	ax, ax

loc_38867:
		or	al, al
		jnz	short loc_3886E
		jmp	loc_38965

loc_3886E:
		mov	byte_5C58D, 0
		mov	[bp+var_9], 0
		xor	eax, eax
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	[bp+var_E], 0
		mov	eax, dword_5E7D3
		mov	[bp+var_12], eax
		cmp	byte_5F552, 2
		jnz	short loc_388A8
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		jmp	short loc_388A8

loc_388A8:
		push	0
		push	1
		push	ds
		push	offset aGamePaused
		push	word_60275
		push	word_5DD44
		push	ds
		push	offset unk_601D9
		call	sub_594D5
		add	sp, 10h
		jmp	short loc_3890B

loc_388C6:
		mov	eax, [bp+var_12]
		add	eax, [bp+var_E]
		cmp	eax, dword_5E7D3
		ja	short loc_388DA
		mov	ax, 1
		jmp	short loc_388DC

loc_388DA:
		xor	ax, ax

loc_388DC:
		mov	ah, 0
		or	ax, ax
		jz	short loc_3890B
		mov	[bp+var_E], 6
		mov	eax, dword_5E7D3
		mov	[bp+var_12], eax
		push	1
		push	605Ah
		call	sub_19409
		add	sp, 4
		mov	al, byte_5FDDF
		mov	ah, 0
		or	ax, ax
		jz	short loc_3890B
		inc	[bp+var_9]

loc_3890B:
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jz	short loc_388C6
		push	0
		push	605Ah
		call	sub_19409
		add	sp, 4
		cmp	byte_5F552, 2
		jnz	short loc_38965
		push	5822h
		call	sub_5830
		pop	cx
		mov	[bp+var_14], ax
		push	1
		push	5822h
		call	sub_595C
		add	sp, 4
		push	large 20000h
		push	5822h
		call	sub_5856
		add	sp, 6
		cmp	[bp+var_14], 0
		jnz	short loc_38963
		push	5822h
		call	sub_5844
		pop	cx
		jmp	short loc_38965

loc_38963:
		jmp	short loc_38965

loc_38965:
		call	Keyboard_ReportErrorIfActive_3D1C0

loc_3896A:
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602B8, eax
		xor	dx, dx
		jmp	short loc_3898A

loc_3897B:
		mov	bx, dx
		shl	bx, 2
		mov	dword ptr [bx+5BDCh], 0
		inc	dx

loc_3898A:
		cmp	dx, 0Ah
		jl	short loc_3897B
		push	649Bh
		call	WorldObjects_UpdateFrame_ResetCounters_36639
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602BC, eax
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602C0, eax
		push	649Bh
		call	WorldObjects_IntegrateAllMotion_36797
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602C4, eax
		inc	word_5C5AC
		push	ds
		push	offset unk_601D9
		call	sub_594DA
		add	sp, 4
		push	64A5h
		call	sub_25CEA
		pop	cx
		or	al, al
		jz	short loc_389F6
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602C8, eax
		mov	[bp+var_1], 1

loc_389F6:
		mov	al, [bp+var_1]
		leave
		retf
sub_38694		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_389FB		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_389FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38A00		proc far

var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	64A5h
		call	TrackedObjects_CallSlot18OnActive_25CA7
		pop	cx
		cmp	byte_5C58D, 0
		jnz	short loc_38A1A
		jmp	loc_38C9F

loc_38A1A:
		call	PIT_ReadHighPrecision
		mov	bx, ax
		cmp	bx, 1
		jge	short loc_38A2B
		mov	ax, 1
		jmp	short loc_38A2D

loc_38A2B:
		mov	ax, bx

loc_38A2D:
		mov	word_5C5A2, ax
		mov	[bp+var_8], 177000h
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		mov	[bp+var_4], eax
		mov	[bp+var_1A], 1900h
		cmp	eax, [bp+var_1A]
		jle	short loc_38A81
		mov	ax, 1
		jmp	short loc_38A83

loc_38A81:
		xor	ax, ax

loc_38A83:
		or	al, al
		jnz	short loc_38A1A
		mov	eax, dword_601B1
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_38AD0
		mov	[bp+var_1E], 100h
		mov	eax, [bp+var_1E]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	dword_5C59E, eax
		sub	dword_601B1, eax
		mov	eax, dword_601B1
		sar	eax, 1Fh
		inc	ax

loc_38AD0:
		cmp	dword_5C5AE, 100h
		jnz	short loc_38AE0
		mov	ax, 1
		jmp	short loc_38AE2

loc_38AE0:
		xor	ax, ax

loc_38AE2:
		or	al, al
		jz	short loc_38AEF
		mov	al, byte_5C5B2
		mov	ah, 0
		or	ax, ax
		jz	short loc_38AF6

loc_38AEF:
		cmp	byte_5C5C8, 0
		jz	short loc_38B3B

loc_38AF6:
		mov	[bp+var_2A], 400h
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_2E]
		cmp	eax, [bp+var_32]
		jle	short loc_38B1D
		mov	ax, 1
		jmp	short loc_38B1F

loc_38B1D:
		xor	ax, ax

loc_38B1F:
		or	al, al
		jz	short loc_38B28
		lea	ax, word ptr [bp+var_2E]
		jmp	short loc_38B2B

loc_38B28:
		lea	ax, word ptr [bp+var_32]

loc_38B2B:
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_36], eax
		mov	dword_5C59A, eax
		jmp	loc_38C2C

loc_38B3B:
		mov	[bp+var_3A], 100h
		mov	eax, [bp+var_3A]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	dword_5C59E, eax
		sub	dword_601AD, eax
		mov	eax, dword_601AD
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_38B84
		mov	dword_601B1, 300h

loc_38B84:
		cmp	word_5C5B4, 0
		jz	short loc_38BAF
		mov	al, byte_5C5B2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_38BAF
		mov	ax, word_5C5B4
		mov	[bp+var_44], ax
		movsx	eax, [bp+var_44]
		shl	eax, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	dword_5C5AE, eax

loc_38BAF:
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, dword_5C5AE
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		mov	dword_5C59A, eax
		mov	[bp+var_54], 400h
		cmp	eax, [bp+var_54]
		jge	short loc_38BE9
		mov	ax, 1
		jmp	short loc_38BEB

loc_38BE9:
		xor	ax, ax

loc_38BEB:
		or	al, al
		jz	short loc_38BFF
		mov	[bp+var_58], 400h
		mov	eax, [bp+var_58]
		mov	dword_5C59A, eax

loc_38BFF:
		mov	[bp+var_5C], 1900h
		mov	eax, dword_5C59A
		cmp	eax, [bp+var_5C]
		jle	short loc_38C16
		mov	ax, 1
		jmp	short loc_38C18

loc_38C16:
		xor	ax, ax

loc_38C18:
		or	al, al
		jz	short loc_38C2C
		mov	[bp+var_60], 1900h
		mov	eax, [bp+var_60]
		mov	dword_5C59A, eax

loc_38C2C:
		mov	[bp+var_64], 100h
		mov	eax, [bp+var_64]
		mov	edx, eax
		mov	ecx, dword_5C59A
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	dword_5C59E, eax
		mov	eax, dword_5C592
		mov	edx, dword_5C59A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	dword_5C5A8, eax
		mov	eax, dword_5C58E
		mov	edx, dword_5C59E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_7C], eax
		mov	dword_5C5A4, eax
		jmp	short loc_38CA4

loc_38C9F:
		mov	byte_5C58D, 1

loc_38CA4:
		mov	dword_5B3DD, 0
		pop	si
		leave
		retf
sub_38A00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38CB0		proc far

var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_5C58E, eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		mov	dword_5C592, eax
		mov	[bp+var_C], 347h
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	dword_5C596, eax
		mov	[bp+var_18], 0F00h
		mov	eax, [bp+var_18]
		mov	dword_5C59A, eax
		mov	[bp+var_1C], 0F00h
		mov	[bp+var_20], 100h
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [bp+var_1C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		shl	eax, 8
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		sar	eax, 8
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	dword_5C59E, eax
		mov	[bp+var_3C], 100h
		mov	[bp+var_40], 0F00h
		mov	[bp+var_44], 100h
		mov	eax, [bp+var_44]
		mov	edx, eax
		mov	ecx, [bp+var_40]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		shl	eax, 8
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		sar	eax, 8
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	dword_5C5A4, eax
		mov	[bp+var_64], 100h
		mov	[bp+var_68], 0F00h
		mov	[bp+var_6C], 100h
		mov	eax, [bp+var_6C]
		mov	edx, eax
		mov	ecx, [bp+var_68]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		shl	eax, 8
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		sar	eax, 8
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	eax, [bp+var_64]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		mov	[bp+var_90], 100h
		mov	eax, [bp+var_90]
		mov	edx, eax
		mov	ecx, [bp+var_8C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	dword_5C5A8, eax
		mov	[bp+var_98], 100h
		mov	eax, [bp+var_98]
		mov	dword_5C5AE, eax
		mov	[bp+var_9C], 0
		mov	eax, [bp+var_9C]
		mov	dword_601A8, eax
		mov	dword_601AD, 0
		mov	dword_601B1, 0
		mov	word_601B5, 0
		push	649Bh
		call	sub_36353
		pop	cx
		push	64A5h
		call	sub_58D98
		pop	cx
		push	ds
		push	offset unk_601D9
		call	sub_59515
		add	sp, 4
		mov	word_60287, 492h
		xor	ax, ax
		mov	word_6028B, ax
		mov	word_60289, ax
		mov	word_60287, 265Eh
		push	6567h
		call	LightSet_Init_34058
		pop	cx
		mov	[bp+var_A0], 347h
		mov	eax, [bp+var_A0]
		mov	dword_5C5B8, eax
		mov	dword_5C5BC, 73C00h
		mov	[bp+var_A4], 1F1h
		mov	eax, [bp+var_A4]
		mov	dword_5C5C0, eax
		mov	dword_5C5C4, 15700h
		leave
		retf
sub_38CB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38F26		proc far

var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	2
		push	6567h
		call	Collection_Destruct
		add	sp, 4
		push	ds
		push	offset unk_601D9
		call	sub_5951A
		add	sp, 4
		cmp	byte_601E4, 0
		jz	short loc_38F73
		cmp	dword_601DF, 0
		jz	short loc_38F73
		push	0
		mov	al, byte_601E3
		push	ax
		mov	eax, dword_601DF
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_38F73

loc_38F73:
		mov	dword_601DF, 0
		mov	byte_601E4, 0
		mov	dword_601E5, 0
		push	2
		push	64A5h
		call	sub_58DA2
		add	sp, 4
		push	2
		push	649Bh
sub_38F26		endp

; START OF FUNCTION CHUNK FOR sub_38F26
		db 9Ah
		mov	ax, 2C00h
; END OF FUNCTION CHUNK FOR sub_38F26
seg084		ends
