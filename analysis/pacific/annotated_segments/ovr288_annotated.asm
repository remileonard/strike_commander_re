ovr288		segment	para public 'OVERLAY' use16
		assume cs:ovr288
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Terrain_Helper_999F0
; (sub_999F0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (78 lignes).
; ==============================================================================================
Terrain_Helper_A8040		proc far

var_4		= dword ptr -4
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
		jz	short loc_A80C2
		mov	[si+1], di
		mov	bx, [si+1]
		mov	ax, [bx+7]
		mov	[si+3], ax
		mov	eax, [bx+8Ah]
		mov	[si+5], eax
		mov	ax, [bx+8Eh]
		mov	[si+0Bh], ax
		xor	cx, cx
		jmp	short loc_A80B4

loc_A8073:
		mov	ax, cx
		shl	ax, 2
		mov	bx, [si+1]
		add	bx, ax
		mov	eax, [bx+0A0h]
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+2Dh], eax
		mov	ax, cx
		shl	ax, 2
		mov	bx, [si+1]
		add	bx, ax
		mov	eax, [bx+90h]
		mov	[bp+var_4], eax
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+0Dh], eax
		sar	eax, 1
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+1Dh], eax
		inc	cx

loc_A80B4:
		cmp	[si+0Bh], cx
		jg	short loc_A8073
		mov	ax, [si+0Bh]
		mov	[si+9], ax
		mov	byte ptr [si], 1

loc_A80C2:
		pop	di
		pop	si
		leave
		retf
Terrain_Helper_A8040		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A80C6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_A80E0
		test	dx, 1
		jz	short loc_A80E0
		push	ax
		call	sub_3B2
		pop	cx

loc_A80E0:
		pop	bp
		retf
sub_A80C6		endp
ovr288		ends
