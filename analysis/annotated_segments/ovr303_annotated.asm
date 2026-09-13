ovr303		segment	para public 'OVERLAY' use16
		assume cs:ovr303
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 541 lignes, NON DÉTAILLÉE — combine ReadFinalField_64B51,
; String_ConstructFromFarPtrLen, ReadFieldGroupC_64A7E répété.
; ==============================================================================================
Debris_LoadFieldMixC_9BFB0	proc far		; CODE XREF: VROOMM_StubThunk_6C04AJ

var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B2		= word ptr -0B2h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= word ptr -90h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= word ptr -86h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= word ptr -7Ch
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= word ptr -72h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_66		= word ptr -66h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp

loc_9BFB1:
		mov	bp, sp

loc_9BFB3:
		sub	sp, 0CCh
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	[bp+var_6], 0
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_8], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx

loc_9BFE8:
		mov	[bp+var_1], al
		cbw

loc_9BFEC:
		cmp	ax, 42h	; 'B'
		jnz	short loc_9BFF4

loc_9BFF1:
		jmp	loc_9C155
; ���������������������������������������������������������������������������

loc_9BFF4:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+3Fj
		cmp	ax, 4Ch	; 'L'
		jnz	short loc_9BFFC
		jmp	loc_9C384
; ���������������������������������������������������������������������������

loc_9BFFC:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+47j
		cmp	ax, 53h	; 'S'
		jz	short loc_9C004
		jmp	loc_9C41D
; ���������������������������������������������������������������������������

loc_9C004:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+4Fj
		mov	[bp+var_16], si
		push	[bp+var_16]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	String_ConstructFromFarPtrLen
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		mov	[bp+var_22], si
		push	[bp+var_22]
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_26], eax
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_CC], eax
		sar	eax, 8
		mov	[bp+var_CC], eax
		mov	[bp+var_2C], si
		push	[bp+var_2C]
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_30], eax
		shl	eax, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_C8], eax
		sar	eax, 8

loc_9C082:
		mov	[bp+var_C8], eax
		mov	[bp+var_36], si

loc_9C08A:
		push	[bp+var_36]

loc_9C08D:
		call	ResourceRecord_ReadFieldGroupC_64A7E

loc_9C092:
		push	dx
		push	ax

loc_9C094:
		pop	eax
		pop	cx

loc_9C097:
		mov	[bp+var_3A], eax
		shl	eax, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_C4], eax
		sar	eax, 8
		mov	[bp+var_C4], eax
		mov	[bp+var_40], si
		push	[bp+var_40]

loc_9C0BB:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax

loc_9C0C2:
		pop	eax
		pop	cx

loc_9C0C5:
		mov	[bp+var_44], eax
		shl	eax, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_14], eax
		sar	eax, 8
		mov	[bp+var_14], eax

loc_9C0E1:
		push	1

loc_9C0E3:
		push	0
		push	2
		push	large 1Fh
		push	5C44h

loc_9C0ED:
		call	Memory_TypedFreeWrapper_5C6F3

loc_9C0F2:
		add	sp, 0Ch
		mov	word ptr [bp+var_4C+2],	dx
		mov	word ptr [bp+var_4C], ax
		or	ax, dx
		jz	short loc_9C146
		les	bx, [bp+var_4C]
		mov	word ptr es:[bx], 1B8Eh
		xor	eax, eax
		mov	es:[bx+0Ah], eax
		mov	es:[bx+6], eax
		mov	es:[bx+0Eh], al
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 1BA2h
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		push	dx
		push	bx
		call	Particle_Init
		add	sp, 0Ch
		mov	dx, word ptr [bp+var_4C+2]
		mov	ax, word ptr [bp+var_4C]
		jmp	short loc_9C14C
; ���������������������������������������������������������������������������

loc_9C146:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+14Dj
		mov	dx, word ptr [bp+var_4C+2]
		mov	ax, word ptr [bp+var_4C]

loc_9C14C:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+194j
					; Debris_LoadFieldMixC_9BFB0+3C6j ...
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	loc_9C426
; ���������������������������������������������������������������������������

loc_9C155:				; CODE XREF: Debris_LoadFieldMixC_9BFB0:loc_9BFF1j
		mov	[bp+var_66], si
		push	[bp+var_66]
		lea	ax, [bp+var_70]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	eax, [bp+var_70]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		mov	[bp+var_72], si
		push	[bp+var_72]

loc_9C181:
		call	ResourceRecord_ReadFieldGroupC_64A7E

loc_9C186:
		push	dx

loc_9C187:
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_76], eax

loc_9C18F:
		shl	eax, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_50], eax
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	[bp+var_7C], si
		push	[bp+var_7C]
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx

loc_9C1B7:
		mov	[bp+var_80], eax

loc_9C1BB:
		shl	eax, 8

loc_9C1BF:
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_54], eax
		sar	eax, 8
		mov	[bp+var_54], eax
		mov	[bp+var_86], si
		push	[bp+var_86]
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8A], eax
		shl	eax, 8

loc_9C1F0:
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_58], eax
		sar	eax, 8
		mov	[bp+var_58], eax
		mov	[bp+var_90], si
		push	[bp+var_90]
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_94], eax
		shl	eax, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_5C], eax
		sar	eax, 8
		mov	[bp+var_5C], eax
		mov	[bp+var_9A], si
		push	[bp+var_9A]
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_9E], eax
		shl	eax, 8
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_60], eax
		sar	eax, 8
		mov	[bp+var_60], eax
		mov	[bp+var_A4], si
		push	[bp+var_A4]
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_A8], eax
		shl	eax, 8

loc_9C283:
		mov	[bp+var_AC], eax

loc_9C288:
		mov	eax, [bp+var_AC]

loc_9C28D:
		mov	[bp+var_64], eax

loc_9C291:
		sar	eax, 8

loc_9C295:
		mov	[bp+var_64], eax
		push	1
		push	0
		push	2
		push	large 37h ; '7'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_B0+2],	dx

loc_9C2B1:
		mov	word ptr [bp+var_B0], ax
		or	ax, dx
		jnz	short loc_9C2BC
		jmp	loc_9C379
; ���������������������������������������������������������������������������

loc_9C2BC:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+307j
		les	bx, [bp+var_B0]

loc_9C2C0:
		mov	word ptr es:[bx], 1B8Eh
		xor	eax, eax
		mov	es:[bx+0Ah], eax
		mov	es:[bx+6], eax
		mov	es:[bx+0Eh], al
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 1BCAh
		push	seg stub303
		push	offset VROOMM_StubThunk_6C045
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 1Fh
		push	dx
		push	ax
		call	CRT_Doscan_Core
		add	sp, 10h
		push	seg stub303
		push	offset VROOMM_StubThunk_6C045
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 27h	; '''
		push	word ptr [bp+var_B0+2]
		push	ax
		call	CRT_Doscan_Core
		add	sp, 10h
		push	seg stub303
		push	offset VROOMM_StubThunk_6C045
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 2Fh	; '/'
		push	word ptr [bp+var_B0+2]
		push	ax
		call	CRT_Doscan_Core
		add	sp, 10h
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	large [bp+var_B0]
		nop
		push	cs
		call	near ptr Debris_ComputeScaledPhysics_9C42F
		add	sp, 14h
		mov	dx, word ptr [bp+var_B0+2]
		mov	ax, word ptr [bp+var_B0]
		jmp	loc_9C14C
; ���������������������������������������������������������������������������

loc_9C379:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+309j
		mov	dx, word ptr [bp+var_B0+2]
		mov	ax, word ptr [bp+var_B0]
		jmp	loc_9C14C
; ���������������������������������������������������������������������������

loc_9C384:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+49j
		mov	[bp+var_B2], si

loc_9C388:
		push	[bp+var_B2]

loc_9C38C:
		push	ss
		lea	ax, [bp+var_BC]
		push	ax

loc_9C392:
		call	String_ConstructFromFarPtrLen
		add	sp, 6
		mov	eax, [bp+var_BC]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		push	1
		push	0
		push	2
		push	large 2Bh ; '+'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_9C3C1:
		add	sp, 0Ch
		mov	word ptr [bp+var_C0+2],	dx
		mov	word ptr [bp+var_C0], ax
		or	ax, dx
		jz	short loc_9C412
		les	bx, [bp+var_C0]
		mov	word ptr es:[bx], 1B8Eh
		xor	eax, eax
		mov	es:[bx+0Ah], eax

loc_9C3E1:
		mov	es:[bx+6], eax

loc_9C3E6:
		mov	es:[bx+0Eh], al

loc_9C3EA:
		mov	dword ptr es:[bx+2], 0

loc_9C3F3:
		mov	word ptr es:[bx], 1BB6h
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	dx
		push	bx
		call	Effect_InitZeroPosition
		add	sp, 8
		mov	dx, word ptr [bp+var_C0+2]
		mov	ax, word ptr [bp+var_C0]
		jmp	loc_9C14C
; ���������������������������������������������������������������������������

loc_9C412:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+41Ej
		mov	dx, word ptr [bp+var_C0+2]
		mov	ax, word ptr [bp+var_C0]
		jmp	loc_9C14C
; ���������������������������������������������������������������������������

loc_9C41D:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+51j
		push	0C008h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9C426:				; CODE XREF: Debris_LoadFieldMixC_9BFB0+1A2j
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		pop	si
		leave
		retf
Debris_LoadFieldMixC_9BFB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 399 lignes, NON DÉTAILLÉE — appelle Math_VectorLength3D_Scaled_54F57 (seg116) —
; calcul physique de débris avec mise à l'échelle anti-débordement.
; ==============================================================================================
Debris_ComputeScaledPhysics_9C42F	proc far		; CODE XREF: VROOMM_StubThunk_6C04FJ Debris_LoadFieldMixC_9BFB0+3B8p

var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		cmp	eax, [si]
		jle	short loc_9C44B
		mov	ax, 1
		jmp	short loc_9C44D
; ���������������������������������������������������������������������������

loc_9C44B:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+15j
		xor	ax, ax

loc_9C44D:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+1Aj
		or	al, al
		jz	short loc_9C471
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		jmp	short loc_9C491
; ���������������������������������������������������������������������������

loc_9C471:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+20j
		mov	eax, [si]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]

loc_9C47F:
		mov	es:[bx+1Fh], eax

loc_9C484:
		mov	si, di

loc_9C486:
		mov	eax, [si]

loc_9C489:
		mov	[bp+var_10], eax

loc_9C48D:
		mov	eax, [bp+var_10]

loc_9C491:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+40j
		les	bx, [bp+arg_0]

loc_9C494:
		mov	es:[bx+23h], eax
		mov	bx, [bp+arg_A]
		mov	eax, [bx]
		mov	bx, [bp+arg_8]
		cmp	eax, [bx]
		jle	short loc_9C4AC
		mov	ax, 1
		jmp	short loc_9C4AE
; ���������������������������������������������������������������������������

loc_9C4AC:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+76j
		xor	ax, ax

loc_9C4AE:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+7Bj
		or	al, al
		jz	short loc_9C4D8
		mov	si, [bp+arg_A]
		mov	eax, [si]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	si, [bp+arg_8]
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		jmp	short loc_9C4FC
; ���������������������������������������������������������������������������

loc_9C4D8:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+81j
		mov	si, [bp+arg_8]
		mov	eax, [si]

loc_9C4DE:
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	si, [bp+arg_A]
		mov	eax, [si]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]

loc_9C4FC:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+A7j
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax
		mov	bx, [bp+arg_E]
		mov	eax, [bx]
		mov	bx, [bp+arg_C]
		cmp	eax, [bx]
		jle	short loc_9C517
		mov	ax, 1
		jmp	short loc_9C519
; ���������������������������������������������������������������������������

loc_9C517:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+E1j
		xor	ax, ax

loc_9C519:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+E6j
		or	al, al
		jz	short loc_9C543
		mov	si, [bp+arg_E]
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	si, [bp+arg_C]
		mov	eax, [si]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		jmp	short loc_9C567
; ���������������������������������������������������������������������������

loc_9C543:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+ECj
		mov	si, [bp+arg_C]
		mov	eax, [si]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	si, [bp+arg_E]
		mov	eax, [si]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]

loc_9C567:				; CODE XREF: Debris_ComputeScaledPhysics_9C42F+112j
		les	bx, [bp+arg_0]
		mov	es:[bx+33h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 23h	; '#'
		mov	word ptr [bp+var_4C+2],	ax
		mov	word ptr [bp+var_4C], dx
		les	bx, [bp+var_4C]

loc_9C581:
		mov	eax, es:[bx]

loc_9C585:
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_34], eax

loc_9C591:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1Fh
		mov	word ptr [bp+var_54+2],	ax
		mov	word ptr [bp+var_54], dx
		les	bx, [bp+var_54]
		mov	eax, es:[bx]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]

loc_9C5AF:
		mov	[bp+var_38], eax

loc_9C5B3:
		mov	ax, word ptr [bp+arg_0+2]

loc_9C5B6:
		mov	dx, word ptr [bp+arg_0]

loc_9C5B9:
		add	dx, 27h	; '''
		mov	word ptr [bp+var_5C+2],	ax

loc_9C5BF:
		mov	word ptr [bp+var_5C], dx

loc_9C5C2:
		les	bx, [bp+var_5C]
		mov	eax, es:[bx]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_3C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_64+2],	ax

loc_9C5E1:
		mov	word ptr [bp+var_64], dx
		les	bx, [bp+var_64]
		mov	eax, es:[bx]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]

loc_9C5F3:
		mov	[bp+var_40], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Fh	; '/'
		mov	word ptr [bp+var_6C+2],	ax
		mov	word ptr [bp+var_6C], dx
		les	bx, [bp+var_6C]
		mov	eax, es:[bx]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_44], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 33h	; '3'
		mov	word ptr [bp+var_74+2],	ax
		mov	word ptr [bp+var_74], dx
		les	bx, [bp+var_74]
		mov	eax, es:[bx]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		sub	eax, [bp+var_34]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_3C]
		sub	eax, [bp+var_40]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_44]
		sub	eax, [bp+var_48]
		mov	[bp+var_90], eax
		mov	[bp+var_7C], 200h
		mov	eax, [bp+var_98]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_9C681:
		mov	[bp+var_98], eax
		mov	eax, [bp+var_94]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	eax, [bp+var_90]
		mov	edx, eax
		mov	ecx, [bp+var_7C]

loc_9C6AE:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_90], eax
		mov	eax, [bp+var_34]
		add	eax, [bp+var_38]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_3C]
		add	eax, [bp+var_40]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_44]
		add	eax, [bp+var_48]

loc_9C6E0:
		mov	[bp+var_9C], eax

loc_9C6E5:
		mov	[bp+var_80], 200h

loc_9C6ED:
		mov	eax, [bp+var_A4]

loc_9C6F2:
		mov	edx, eax
		mov	ecx, [bp+var_80]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A0]
		mov	edx, eax
		mov	ecx, [bp+var_80]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		mov	edx, eax
		mov	ecx, [bp+var_80]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_9C], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_A4]
		mov	es:[bx+13h], eax
		mov	eax, [bp+var_A0]
		mov	es:[bx+17h], eax
		mov	eax, [bp+var_9C]
		mov	es:[bx+1Bh], eax
		lea	ax, [bp+var_98]
		push	ax
		push	ss
		lea	ax, [bp+var_84]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax

loc_9C77F:
		mov	eax, [bp+var_88]
		les	bx, [bp+arg_0]

loc_9C787:
		mov	es:[bx+0Fh], eax

loc_9C78C:
		mov	eax, [bp+arg_10]

loc_9C790:
		mov	[bp+var_8C], eax
		push	8
		push	large [bp+var_8C]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]

loc_9C7B1:
		mov	byte ptr es:[bx+0Eh], 0
		pop	di
		pop	si
		leave
		retf
Debris_ComputeScaledPhysics_9C42F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue via CRT_Malloc32_Retry.
; ==============================================================================================
Debris_AllocateExtended_9C7BA	proc far		; CODE XREF: VROOMM_StubThunk_6C045J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0

loc_9C7C2:
		jnz	short loc_9C7D7

loc_9C7C4:
		push	large 4
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_9C7D7:				; CODE XREF: Debris_AllocateExtended_9C7BA:loc_9C7C2j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
Debris_AllocateExtended_9C7BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (20 lignes).
; ==============================================================================================
Debris_Helper4_9C7DF	proc far		; CODE XREF: VROOMM_StubThunk_6C040J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	eax, [si+4]
		mov	es:[bx+23h], eax
		mov	eax, [si+8]
		mov	es:[bx+27h], eax
		pop	si
		pop	bp
		retf
Debris_Helper4_9C7DF	endp

ovr303		ends
