seg099		segment	byte public 'CODE' use16
		assume cs:seg099
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_45CEA:				; DATA XREF: seg339:off_6F544o
		push	bp
		mov	bp, sp

loc_45CED:				; DATA XREF: seg216:03DEo
		sub	sp, 66h
		push	si
		push	di
		mov	si, [bp+10h]
		or	si, si
		jnz	short loc_45CFC
		jmp	loc_45F64
; ���������������������������������������������������������������������������

loc_45CFC:				; CODE XREF: seg099:0017j
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp-36h], eax
		mov	eax, [di+4]
		mov	[bp-32h], eax
		mov	eax, [di+8]
		mov	[bp-2Eh], eax
		mov	bx, [bp+12h]
		mov	eax, [bx]
		mov	[bp-4],	eax
		push	si
		push	ss
		lea	ax, [bp-4Eh]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-4Eh]
		mov	[bp-42h], eax
		mov	eax, [bp-4Ah]
		mov	[bp-3Eh], eax
		mov	eax, [bp-46h]
		mov	[bp-3Ah], eax
		lea	ax, [bp-42h]
		push	ax
		call	UI_ApplyVectorLength_55B04
		pop	cx
		lea	ax, [bp-42h]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		les	bx, [bp+0Ah]
		mov	ax, es:[bx+68h]
		mov	[bp-6],	ax
		movsx	eax, word ptr [bp-6]
		shl	eax, 8
		mov	[bp-0Ah], eax
		mov	eax, [bp-42h]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-42h], eax
		mov	eax, [bp-3Eh]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-3Eh], eax
		mov	eax, [bp-3Ah]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-3Ah], eax
		push	si
		push	ss
		lea	ax, [bp-5Ah]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-42h]
		add	eax, [bp-5Ah]
		mov	[bp-42h], eax
		mov	eax, [bp-3Eh]
		add	eax, [bp-56h]
		mov	[bp-3Eh], eax
		mov	eax, [bp-3Ah]
		add	eax, [bp-52h]
		mov	[bp-3Ah], eax
		mov	eax, [bp-42h]
		mov	[bp-66h], eax
		mov	eax, [bp-3Eh]
		mov	[bp-62h], eax
		mov	eax, [bp-3Ah]
		mov	[bp-5Eh], eax
		mov	eax, [bp-5Eh]
		mov	edx, [bp-5Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Eh], eax
		mov	eax, dword_6FFD7
		mov	edx, [bp-4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		shl	eax, 1
		mov	[bp-12h], eax
		mov	eax, [bp-0Eh]
		sub	eax, [bp-12h]
		mov	[bp-0Eh], eax
		mov	dword ptr [bp-16h], 0
		cmp	eax, [bp-16h]
		jl	short loc_45E4B
		mov	ax, 1
		jmp	short loc_45E4D
; ���������������������������������������������������������������������������

loc_45E4B:				; CODE XREF: seg099:0164j
		xor	ax, ax

loc_45E4D:				; CODE XREF: seg099:0169j
		or	al, al
		jz	short loc_45E75
		lea	ax, [bp-0Eh]
		push	ax
		push	ss
		lea	ax, [bp-1Ah]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp-1Ah]
		neg	eax
		mov	[bp-1Eh], eax
		mov	[bp-22h], eax
		mov	[bp-0Eh], eax

loc_45E75:				; CODE XREF: seg099:016Fj
		mov	eax, [bp-0Eh]
		sub	eax, [bp-5Eh]
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	edx, eax
		mov	ecx, dword_6FFD7
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-0Eh], eax
		mov	eax, [bp-42h]
		mov	edx, [bp-0Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-42h], eax
		mov	eax, [bp-3Eh]
		mov	edx, [bp-0Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-3Eh], eax
		mov	bx, [bp+12h]
		mov	eax, [bx]
		neg	eax
		mov	[bp-26h], eax
		mov	[bp-2Ah], eax
		mov	[bp-3Ah], eax
		cmp	word ptr [bp+14h], 2
		jz	short loc_45EE5
		cmp	word ptr [bp+14h], 5
		jnz	short loc_45F33

loc_45EE5:				; CODE XREF: seg099:01FDj
		mov	eax, [bp-36h]
		add	[bp-42h], eax
		mov	eax, [bp-32h]
		add	[bp-3Eh], eax
		mov	eax, [bp-2Eh]
		add	[bp-3Ah], eax
		mov	si, [bp+6]
		or	si, si
		jz	short loc_45F08
		mov	ax, si
		jmp	short loc_45F12
; ���������������������������������������������������������������������������

loc_45F08:				; CODE XREF: seg099:0222j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_45F12:				; CODE XREF: seg099:0226j
		or	ax, ax
		jz	short loc_45F92

loc_45F16:				; CODE XREF: seg099:0280j
		mov	eax, [bp-42h]
		mov	[si], eax
		mov	eax, [bp-3Eh]
		mov	[si+4],	eax
		mov	eax, [bp-3Ah]

loc_45F29:				; CODE XREF: seg099:02B0j
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_45F94
; ���������������������������������������������������������������������������
		jmp	short loc_45F92
; ���������������������������������������������������������������������������

loc_45F33:				; CODE XREF: seg099:0203j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp-42h]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	si, [bp+6]
		or	si, si
		jz	short loc_45F52
		mov	ax, si

loc_45F50:
		jmp	short loc_45F5C
; ���������������������������������������������������������������������������

loc_45F52:				; CODE XREF: seg099:026Cj
		push	0Ch

loc_45F54:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_45F5C:				; CODE XREF: seg099:loc_45F50j
		or	ax, ax
		jz	short loc_45F92
		jmp	short loc_45F16
; ���������������������������������������������������������������������������
		jmp	short loc_45F92
; ���������������������������������������������������������������������������

loc_45F64:				; CODE XREF: seg099:0019j
		mov	si, [bp+6]
		or	si, si
		jz	short loc_45F6F
		mov	ax, si
		jmp	short loc_45F79
; ���������������������������������������������������������������������������

loc_45F6F:				; CODE XREF: seg099:0289j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_45F79:				; CODE XREF: seg099:028Dj
		or	ax, ax
		jz	short loc_45F92
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		jmp	short loc_45F29
; ���������������������������������������������������������������������������

loc_45F92:				; CODE XREF: seg099:0234j seg099:0251j ...
		mov	ax, si

loc_45F94:				; CODE XREF: seg099:024Fj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_45F9E:				; DATA XREF: seg339:off_6FD8Co
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45FA8:				; DATA XREF: seg339:off_6FD68o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_45FB9
		mov	al, 1
		jmp	short loc_45FBB
; ���������������������������������������������������������������������������

loc_45FB9:				; CODE XREF: seg099:02D3j
		mov	al, 0

loc_45FBB:				; CODE XREF: seg099:02D7j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45FC3:				; DATA XREF: seg339:off_6F534o
		push	bp
		mov	bp, sp
		mov	al, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45FCA:				; DATA XREF: seg339:off_6F530o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	2Dh ; '-'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_46020
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	ax
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 2CA8h
		push	large dword ptr	[bp-4]
		push	si
		nop
		push	cs
		call	near ptr Camera_InitAttachedCopyFlag
		add	sp, 6
		mov	ax, si
		jmp	short loc_46022
; ���������������������������������������������������������������������������

loc_46020:				; CODE XREF: seg099:0305j
		mov	ax, si

loc_46022:				; CODE XREF: seg099:033Ej
		mov	si, ax
		push	ax
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_46036:				; DATA XREF: seg339:247Co
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4607E
		les	bx, [bp+6]
		mov	word ptr es:[bx], 247Ch
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Targeting_DestructComponent
		add	sp, 6

loc_4605D:
		test	si, 1
		jz	short loc_4607E

loc_46063:
		mov	eax, [bp+6]

loc_46067:
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4607E:				; CODE XREF: seg099:0365j seg099:0381j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,20L — copie un flag depuis la cible référencée (vtable[0], offset+0x5E→+0x2C) : copie de
; statut de la cible pour un composant caméra (variante).
; ==============================================================================================
Camera_CopyTargetFlag	proc far		; CODE XREF: Camera_InitAttachedCopyFlag+16p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+5Eh]
		mov	[si+2Ch], al
		pop	si
		pop	bp
		retf
Camera_CopyTargetFlag	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — attache une cible (sub_37C89) puis copie son flag (sub_46081) : initialisation
; d'un composant caméra externe attaché avec copie de statut (variante).
; ==============================================================================================
Camera_InitAttachedCopyFlag	proc far		; CODE XREF: seg099:0336p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		push	si
		push	cs
		call	near ptr Camera_CopyTargetFlag
		pop	cx
		pop	si
		pop	bp
		retf
Camera_InitAttachedCopyFlag	endp

; ���������������������������������������������������������������������������

loc_460B9:				; DATA XREF: seg339:off_6FD70o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_460E4
		mov	word ptr [si], 2CA8h
		push	0
		push	si
		call	VROOMM_StubThunk_6BFBA
		add	sp, 4
		test	di, 1
		jz	short loc_460E4
		push	si

loc_460DE:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_460E4:				; CODE XREF: seg099:03E6j seg099:03FBj
		pop	di
		pop	si
		pop	bp
		retf
seg099		ends
