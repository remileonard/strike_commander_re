seg098		segment	byte public 'CODE' use16
		assume cs:seg098
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_45AAF:				; DATA XREF: seg339:off_6FD00o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 15h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45AB9:				; DATA XREF: seg339:off_6FCDCo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	al, [si+5Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_45ADC
		push	si
		push	ds
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	VROOMM_StubThunk_6B63A
		add	sp, 6

loc_45ADC:				; CODE XREF: seg098:002Aj
		cmp	byte ptr [si+5Dh], 0
		jz	short loc_45AF3
		push	ds
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	RadioQueue_RegisterMessage
		add	sp, 4
		jmp	short loc_45B01
; ���������������������������������������������������������������������������

loc_45AF3:				; CODE XREF: seg098:0040j
		mov	word ptr [si+0D5h], 0
		mov	word ptr [si+0D3h], 0
		mov	al, 0FFh

loc_45B01:				; CODE XREF: seg098:0051j
		mov	[bp-2],	al
		xor	dx, dx
		cmp	byte ptr [bp-2], 0FFh
		jz	short loc_45B14
		les	bx, [si+0D3h]
		mov	dx, es:[bx+0Dh]

loc_45B14:				; CODE XREF: seg098:006Aj
		mov	al, [bp-2]
		cbw
		cmp	ax, 64h	; 'd'
		jz	short loc_45B29
		cmp	ax, 65h	; 'e'
		jz	short loc_45B4A
		cmp	ax, 66h	; 'f'
		jz	short loc_45B5C
		jmp	short loc_45B6C
; ���������������������������������������������������������������������������

loc_45B29:				; CODE XREF: seg098:007Bj
		mov	[bp-4],	dx
		cmp	byte ptr [si+5Dh], 0
		jz	short loc_45B6C
		push	2
		push	word ptr [bp-4]

loc_45B37:				; CODE XREF: seg098:00B8j seg098:00CAj
		push	ds
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_45B6C
; ���������������������������������������������������������������������������
		jmp	short loc_45B6C
; ���������������������������������������������������������������������������

loc_45B4A:				; CODE XREF: seg098:0080j
		mov	[bp-6],	dx
		cmp	byte ptr [si+5Dh], 0
		jz	short loc_45B6C

loc_45B53:
		push	1Dh
		push	word ptr [bp-6]
		jmp	short loc_45B37
; ���������������������������������������������������������������������������
		jmp	short loc_45B6C
; ���������������������������������������������������������������������������

loc_45B5C:				; CODE XREF: seg098:0085j
		mov	[bp-8],	dx
		cmp	byte ptr [si+5Dh], 0

loc_45B63:
		jz	short loc_45B6C
		push	1Eh
		push	word ptr [bp-8]
		jmp	short loc_45B37
; ���������������������������������������������������������������������������

loc_45B6C:				; CODE XREF: seg098:0087j seg098:0090j ...
		push	si
		call	WorldObject_IsDestroyed
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_45B76:				; DATA XREF: seg339:off_6FD54o
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	dx, [bp+6]
		mov	ax, [bp+8]
		cmp	ax, 0ABh ; '�'
		jnz	short loc_45BB6
		mov	al, [bp+0Eh]
		mov	[bp-2],	al
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	al, [bp-2]
		mov	[bp-6],	al
		mov	bx, dx
		cmp	byte ptr [bx+5Dh], 0
		jz	short loc_45BB6
		push	ax
		push	word ptr [bp-4]
		push	ds
		mov	ax, dx
		add	ax, 51h	; 'Q'
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short $+2

loc_45BB6:				; CODE XREF: seg098:00E5j seg098:00FFj
		mov	ax, 1
		leave
		retf
; ���������������������������������������������������������������������������

loc_45BBB:				; DATA XREF: seg339:24BCo
		push	bp
		mov	bp, sp
		mov	al, 15h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45BC2:				; DATA XREF: seg339:24B4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_45C0A
		les	bx, [bp+6]
		mov	word ptr es:[bx], 24B4h
		push	0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_45C0A
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_45C0A:				; CODE XREF: seg098:0131j seg098:014Dj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — identique à sub_3DC3D (seg085) : attache un sous-composant (sub_37C89), copie un
; identifiant de cible, reset UI, copie un flag depuis la cible référencée : duplicat overlay
; de l'initialisation de caméra externe attachée (VROOMM).
; ==============================================================================================
Camera_InitAttachedWithTarget_Dup1	proc far		; CODE XREF: PlayerComponentVariantS_ConstructAndInit_A1054+3DP

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]
		mov	[si+50h], al
		pop	si
		leave
		retf
Camera_InitAttachedWithTarget_Dup1	endp

; ���������������������������������������������������������������������������

loc_45C4D:				; DATA XREF: seg339:off_6FCE4o
		push	bp
		mov	bp, sp
		sub	sp, 4

loc_45C53:
		push	si
		push	di
		mov	si, [bp+6]

loc_45C58:
		mov	di, [bp+8]
		or	si, si

loc_45C5D:
		jnz	short loc_45C62
		jmp	loc_45CE6
; ���������������������������������������������������������������������������

loc_45C62:				; CODE XREF: seg098:loc_45C5Dj
		mov	word ptr [si], 2C1Ch
		mov	ax, si
		add	ax, 51h	; 'Q'
		mov	dx, ds
		or	ax, dx
		jz	short loc_45CCE
		mov	word ptr [si+51h], 38Ch
		push	dx
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	RadioQueue_RemoveByPos
		add	sp, 4
		cmp	byte ptr [si+58h], 0
		jz	short loc_45CB6
		mov	ax, [si+53h]
		or	ax, [si+55h]
		jz	short loc_45CB6
		push	0
		mov	al, [si+57h]
		push	ax
		mov	ax, [si+55h]
		mov	dx, [si+53h]
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_45CB6:				; CODE XREF: seg098:01E9j seg098:01F1j
		mov	word ptr [si+55h], 0
		mov	word ptr [si+53h], 0
		mov	byte ptr [si+58h], 0
		mov	dword ptr [si+59h], 0
		jmp	short $+2

loc_45CCE:				; CODE XREF: seg098:01CFj
		push	0
		push	si
		call	WorldObject_BaseDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_45CE6
		push	si

loc_45CE0:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_45CE6:				; CODE XREF: seg098:01BFj seg098:023Dj
		pop	di
		pop	si
		leave
		retf
seg098		ends
