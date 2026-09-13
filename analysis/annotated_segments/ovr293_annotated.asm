ovr293		segment	para public 'OVERLAY' use16
		assume cs:ovr293
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (78 lignes).
; ==============================================================================================
Terrain_Helper_999F0	proc far		; CODE XREF: VROOMM_StubThunk_6BD90J

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [di], 0
		jz	short loc_99A72
		mov	[si+1],	di
		mov	bx, [si+1]
		mov	ax, [bx+7]
		mov	[si+3],	ax

loc_99A0F:
		mov	eax, [bx+8Ah]
		mov	[si+5],	eax
		mov	ax, [bx+8Eh]
		mov	[si+0Bh], ax
		xor	cx, cx
		jmp	short loc_99A64
; ���������������������������������������������������������������������������

loc_99A23:				; CODE XREF: Terrain_Helper_999F0+77j
		mov	ax, cx
		shl	ax, 2
		mov	bx, [si+1]
		add	bx, ax
		mov	eax, [bx+0A0h]
		mov	bx, cx
		shl	bx, 2

loc_99A37:
		mov	[bx+si+2Dh], eax

loc_99A3B:
		mov	ax, cx
		shl	ax, 2

loc_99A40:
		mov	bx, [si+1]
		add	bx, ax

loc_99A45:
		mov	eax, [bx+90h]
		mov	[bp+var_4], eax

loc_99A4E:
		mov	bx, cx

loc_99A50:
		shl	bx, 2
		mov	[bx+si+0Dh], eax
		sar	eax, 1
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+1Dh], eax
		inc	cx

loc_99A64:				; CODE XREF: Terrain_Helper_999F0+31j
		cmp	[si+0Bh], cx
		jg	short loc_99A23
		mov	ax, [si+0Bh]
		mov	[si+9],	ax
		mov	byte ptr [si], 1

loc_99A72:				; CODE XREF: Terrain_Helper_999F0+11j
		pop	di
		pop	si
		leave
		retf
Terrain_Helper_999F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_FreeNear_Wrap (24 lignes).
; ==============================================================================================
Terrain_ReleaseFree_99A76	proc far		; CODE XREF: VROOMM_StubThunk_6BD95J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_99A90
		test	dx, 1
		jz	short loc_99A90
		push	ax
		call	CRT_FreeNear_Wrap

loc_99A8F:
		pop	cx

loc_99A90:				; CODE XREF: Terrain_ReleaseFree_99A76+Bj
					; Terrain_ReleaseFree_99A76+11j
		pop	bp
		retf
Terrain_ReleaseFree_99A76	endp

ovr293		ends
