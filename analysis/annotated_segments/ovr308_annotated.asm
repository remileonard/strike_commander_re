ovr308		segment	para public 'OVERLAY' use16
		assume cs:ovr308
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine libération typée et gestion d'erreur (thunks voisins).
; ==============================================================================================
Debris_ReleaseWithErrorCheck_9CE90	proc far		; CODE XREF: VROOMM_StubThunk_6C160J

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp

loc_9CE93:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_9CEA7
		jmp	loc_9CF49
; ���������������������������������������������������������������������������

loc_9CEA7:				; CODE XREF: Debris_ReleaseWithErrorCheck_9CE90+12j
		push	1

loc_9CEA9:
		push	0
		push	2
		push	large 0BDh ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_9CF3C
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 0AAh ; '�'
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx
		push	bx
		call	VROOMM_StubThunk_6AA43
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 390h
		mov	ax, word ptr [bp+var_4]
		add	ax, 1Ah
		push	word ptr [bp+var_4+2]
		push	ax
		call	VROOMM_StubThunk_6B630
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+1Ah], 368h
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	dx, word ptr [bp+var_4+2]

loc_9CF37:
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_9CF42
; ���������������������������������������������������������������������������

loc_9CF3C:				; CODE XREF: Debris_ReleaseWithErrorCheck_9CE90+36j
		mov	dx, word ptr [bp+var_4+2]

loc_9CF3F:
		mov	ax, word ptr [bp+var_4]

loc_9CF42:				; CODE XREF: Debris_ReleaseWithErrorCheck_9CE90+AAj
		mov	[si+2],	dx
		mov	[si], ax
		jmp	short loc_9CF52
; ���������������������������������������������������������������������������

loc_9CF49:				; CODE XREF: Debris_ReleaseWithErrorCheck_9CE90+14j
		push	0C012h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9CF52:				; CODE XREF: Debris_ReleaseWithErrorCheck_9CE90+B7j
		pop	si
		leave
		retf
Debris_ReleaseWithErrorCheck_9CE90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Debris_ReleaseWithErrorCheck_9CE90.
; ==============================================================================================
Debris_ReleaseWithErrorCheckB_9CF55	proc far		; CODE XREF: VROOMM_StubThunk_6C165J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_9CF68
		jmp	loc_9D00F
; ���������������������������������������������������������������������������

loc_9CF68:				; CODE XREF: Debris_ReleaseWithErrorCheckB_9CF55+Ej
		push	1
		push	0
		push	2
		push	large 0BDh ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_9CFFD
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 0AAh ; '�'

loc_9CF91:
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx
		push	bx
		call	VROOMM_StubThunk_6AA43

loc_9CFA3:
		add	sp, 4

loc_9CFA6:
		les	bx, [bp+var_4]

loc_9CFA9:
		mov	word ptr es:[bx], 390h
		mov	ax, word ptr [bp+var_4]

loc_9CFB1:
		add	ax, 1Ah

loc_9CFB4:
		push	word ptr [bp+var_4+2]

loc_9CFB7:
		push	ax
		call	VROOMM_StubThunk_6B630
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+1Ah], 368h
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_9D003
; ���������������������������������������������������������������������������

loc_9CFFD:				; CODE XREF: Debris_ReleaseWithErrorCheckB_9CF55+32j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_9D003:				; CODE XREF: Debris_ReleaseWithErrorCheckB_9CF55+A6j
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		jmp	short locret_9D018
; ���������������������������������������������������������������������������

loc_9D00F:				; CODE XREF: Debris_ReleaseWithErrorCheckB_9CF55+10j
		push	0C013h
		call	VROOMM_StubThunk_6B70F
		pop	cx

locret_9D018:				; CODE XREF: Debris_ReleaseWithErrorCheckB_9CF55+B8j
		leave
		retf
Debris_ReleaseWithErrorCheckB_9CF55	endp

ovr308		ends
