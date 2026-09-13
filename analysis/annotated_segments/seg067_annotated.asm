seg067		segment	byte public 'CODE' use16
		assume cs:seg067
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,233L — variante de résolution d'interpolation par table (recherche par intervalle avec
; cache dword_6E9BA/BE/C2) précédée d'un test de borne (+0x58) : résolution d'interpolation
; cachée avec garde de limite (utilisée par le setup de face du seg055).
; ==============================================================================================
Interp_ResolveCachedGuarded	proc far		; CODE XREF: seg055:0B18P seg055:0E87P ...

var_14		= byte ptr -14h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h

		enter	14h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, [si+58h]
		jnb	loc_2F3FE
		mov	eax, [bp+arg_6]
		sar	eax, 8
		mov	[bp+arg_6], eax
		cmp	dword_6E9BA, 0FFFFFFFFh
		jz	short loc_2F298
		cmp	eax, dword_6E9BA
		jl	short loc_2F298
		mov	eax, [si+76h]
		cmp	eax, dword_6E9BA
		jg	short loc_2F28A
		jmp	loc_2F397
; ���������������������������������������������������������������������������

loc_2F28A:				; CODE XREF: Interp_ResolveCachedGuarded+37j
		mov	eax, [bp+arg_6]
		cmp	eax, dword_6E9BE
		jge	short loc_2F298
		jmp	loc_2F397
; ���������������������������������������������������������������������������

loc_2F298:				; CODE XREF: Interp_ResolveCachedGuarded+25j
					; Interp_ResolveCachedGuarded+2Cj ...
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_6]
		jle	short loc_2F2B9

loc_2F2A2:
		mov	dword_6E9BA, 0
		mov	dword_6E9BE, eax
		xor	eax, eax

loc_2F2B2:				; CODE XREF: Interp_ResolveCachedGuarded+81j
					; Interp_ResolveCachedGuarded+146j
		mov	dword_6E9C2, eax

loc_2F2B6:
		jmp	loc_2F39B
; ���������������������������������������������������������������������������

loc_2F2B9:				; CODE XREF: Interp_ResolveCachedGuarded+52j
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_6]
		jg	short loc_2F2D1

loc_2F2C3:
		mov	dword_6E9BA, eax
		mov	dword_6E9BE, eax

loc_2F2CB:
		mov	eax, [si+6Ah]
		jmp	short loc_2F2B2
; ���������������������������������������������������������������������������

loc_2F2D1:				; CODE XREF: Interp_ResolveCachedGuarded+73j
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_A], al
		mov	[bp+var_14], 0
		jmp	loc_2F378
; ���������������������������������������������������������������������������

loc_2F2E5:				; CODE XREF: Interp_ResolveCachedGuarded+133j
		dec	[bp+var_A]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_E], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_12], eax
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_E]
		jl	short loc_2F32C
		cmp	eax, [bp+var_12]
		jge	short loc_2F32C
		mov	eax, [bp+var_E]
		mov	dword_6E9BA, eax

loc_2F326:
		mov	eax, [bp+var_12]
		jmp	short loc_2F34E
; ���������������������������������������������������������������������������

loc_2F32C:				; CODE XREF: Interp_ResolveCachedGuarded+C8j
					; Interp_ResolveCachedGuarded+CEj
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_12]
		jnz	short loc_2F358
		inc	dx
		mov	eax, [bp+var_12]
		mov	dword_6E9BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2F34E:				; CODE XREF: Interp_ResolveCachedGuarded+DCj
		mov	dword_6E9BE, eax
		mov	[bp+var_14], 1
		jmp	short loc_2F378
; ���������������������������������������������������������������������������

loc_2F358:				; CODE XREF: Interp_ResolveCachedGuarded+E6j
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_E]
		jge	short loc_2F36E
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2F378
; ���������������������������������������������������������������������������

loc_2F36E:				; CODE XREF: Interp_ResolveCachedGuarded+112j
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		add	dx, ax

loc_2F378:				; CODE XREF: Interp_ResolveCachedGuarded+94j
					; Interp_ResolveCachedGuarded+108j ...
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F384
		jmp	loc_2F2E5
; ���������������������������������������������������������������������������

loc_2F384:				; CODE XREF: Interp_ResolveCachedGuarded+131j
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_2F2B2
; ���������������������������������������������������������������������������

loc_2F397:				; CODE XREF: Interp_ResolveCachedGuarded+39j
					; Interp_ResolveCachedGuarded+47j
		mov	eax, dword_6E9C2

loc_2F39B:				; CODE XREF: Interp_ResolveCachedGuarded:loc_2F2B6j
		mov	[bp+var_4], eax

loc_2F39F:
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax

loc_2F3A5:
		mov	ax, [bp+arg_2]
		mov	dx, 0Fh
		imul	dx
		mov	di, [si+5Ah]
		add	di, ax
		mov	ax, [bp+arg_A]
		or	ax, ax
		jnz	short loc_2F3BC
		mov	ax, [di+0Bh]

loc_2F3BC:				; CODE XREF: Interp_ResolveCachedGuarded+169j
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		imul	[bp+var_8]
		add	ax, 80h	; '�'

loc_2F3C8:
		sar	ax, 8
		mov	[bp+var_6], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2F3DD
		mov	ax, [di+6]
		add	ax, [bp+var_6]
		jmp	short loc_2F3FC
; ���������������������������������������������������������������������������

loc_2F3DD:				; CODE XREF: Interp_ResolveCachedGuarded+185j
		mov	ax, [di+0Dh]
		sub	ax, [bp+var_6]
		cwde
		imul	eax, [bp+var_4]
		mov	bx, [di]
		add	eax, [bx+6Eh]
		mov	cl, [bx+68h]
		sar	eax, cl
		add	ax, [di+6]
		add	ax, [bp+var_6]

loc_2F3FC:				; CODE XREF: Interp_ResolveCachedGuarded+18Dj
		jmp	short loc_2F400
; ���������������������������������������������������������������������������

loc_2F3FE:				; CODE XREF: Interp_ResolveCachedGuarded+Fj
		xor	ax, ax

loc_2F400:				; CODE XREF: Interp_ResolveCachedGuarded:loc_2F3FCj
		pop	di
		pop	si
		leave
		retf
Interp_ResolveCachedGuarded	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,185L — même algorithme de recherche par intervalle avec cache (utilisé par le système
; d'easing des keyframes, sub_29194) : résolution générique d'interpolation par table triée
; avec cache — moteur commun aux systèmes d'easing (keyframe) et de texture mapping (mipmap).
; ==============================================================================================
Interp_ResolveCached	proc far		; CODE XREF: Keyframe_ResolveEasingValue+17P
					; seg055:109EP	...

var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sar	eax, 8
		mov	[bp+arg_2], eax
		cmp	dword_6E9BA, 0FFFFFFFFh
		jz	short loc_2F444

loc_2F421:
		cmp	eax, dword_6E9BA
		jl	short loc_2F444
		mov	eax, [si+76h]

loc_2F42C:
		cmp	eax, dword_6E9BA
		jg	short loc_2F436
		jmp	loc_2F543
; ���������������������������������������������������������������������������

loc_2F436:				; CODE XREF: Interp_ResolveCached+2Dj
		mov	eax, [bp+arg_2]
		cmp	eax, dword_6E9BE
		jge	short loc_2F444
		jmp	loc_2F543
; ���������������������������������������������������������������������������

loc_2F444:				; CODE XREF: Interp_ResolveCached+1Bj
					; Interp_ResolveCached+22j ...
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_2F465
		mov	dword_6E9BA, 0
		mov	dword_6E9BE, eax
		xor	eax, eax

loc_2F45E:				; CODE XREF: Interp_ResolveCached+77j
					; Interp_ResolveCached+13Cj
		mov	dword_6E9C2, eax
		jmp	loc_2F547
; ���������������������������������������������������������������������������

loc_2F465:				; CODE XREF: Interp_ResolveCached+48j
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_2F47D
		mov	dword_6E9BA, eax
		mov	dword_6E9BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2F45E
; ���������������������������������������������������������������������������

loc_2F47D:				; CODE XREF: Interp_ResolveCached+69j
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_2F524
; ���������������������������������������������������������������������������

loc_2F491:				; CODE XREF: Interp_ResolveCached+129j
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax

loc_2F4A0:
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jl	short loc_2F4D8

loc_2F4C4:
		cmp	eax, [bp+var_A]

loc_2F4C8:
		jge	short loc_2F4D8

loc_2F4CA:
		mov	eax, [bp+var_6]
		mov	dword_6E9BA, eax

loc_2F4D2:
		mov	eax, [bp+var_A]

loc_2F4D6:
		jmp	short loc_2F4FA
; ���������������������������������������������������������������������������

loc_2F4D8:				; CODE XREF: Interp_ResolveCached+BEj
					; Interp_ResolveCached:loc_2F4C8j
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_2F504
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_6E9BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2F4FA:				; CODE XREF: Interp_ResolveCached:loc_2F4D6j
		mov	dword_6E9BE, eax
		mov	[bp+var_C], 1
		jmp	short loc_2F524
; ���������������������������������������������������������������������������

loc_2F504:				; CODE XREF: Interp_ResolveCached+DCj
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_2F51A
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2F524
; ���������������������������������������������������������������������������

loc_2F51A:				; CODE XREF: Interp_ResolveCached+108j
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_2F524:				; CODE XREF: Interp_ResolveCached+8Aj
					; Interp_ResolveCached+FEj ...
		mov	al, [bp+var_C]
		mov	ah, 0

loc_2F529:
		or	ax, ax
		jnz	short loc_2F530
		jmp	loc_2F491
; ���������������������������������������������������������������������������

loc_2F530:				; CODE XREF: Interp_ResolveCached+127j
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_2F45E
; ���������������������������������������������������������������������������

loc_2F543:				; CODE XREF: Interp_ResolveCached+2Fj
					; Interp_ResolveCached+3Dj
		mov	eax, dword_6E9C2

loc_2F547:				; CODE XREF: Interp_ResolveCached+5Ej
		movsx	edx, word ptr [si+52h]
		imul	eax, edx
		add	eax, [si+6Eh]
		mov	cx, [si+68h]
		sar	eax, cl
		pop	di
		pop	si
		leave
		retf
Interp_ResolveCached	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,216L — variante avec normalisation d'index (multiplication par le nombre d'entrées
; +0x52, arrondi) avant la recherche par intervalle cachée : résolution d'interpolation avec
; normalisation d'index (jauge/gradient proportionnel).
; ==============================================================================================
Interp_ResolveNormalizedIndex	proc far		; CODE XREF: Gauge_ResolveAndApplyLabel+FP

var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	bx, [si+52h]
		inc	bx
		imul	ax, bx
		add	ax, 80h	; '�'
		sar	ax, 8
		dec	ax
		mov	[bp+arg_2], ax
		mov	eax, [bp+arg_4]
		sar	eax, 8
		mov	[bp+arg_4], eax
		cmp	dword_6E9BA, 0FFFFFFFFh
		jz	short loc_2F5B2
		cmp	eax, dword_6E9BA
		jl	short loc_2F5B2
		mov	eax, [si+76h]
		cmp	eax, dword_6E9BA
		jg	short loc_2F5A4

loc_2F5A1:
		jmp	loc_2F6B1
; ���������������������������������������������������������������������������

loc_2F5A4:				; CODE XREF: Interp_ResolveNormalizedIndex+41j
		mov	eax, [bp+arg_4]
		cmp	eax, dword_6E9BE
		jge	short loc_2F5B2
		jmp	loc_2F6B1
; ���������������������������������������������������������������������������

loc_2F5B2:				; CODE XREF: Interp_ResolveNormalizedIndex+2Fj
					; Interp_ResolveNormalizedIndex+36j ...
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_2F5D3

loc_2F5BC:
		mov	dword_6E9BA, 0

loc_2F5C5:
		mov	dword_6E9BE, eax
		xor	eax, eax

loc_2F5CC:				; CODE XREF: Interp_ResolveNormalizedIndex+8Bj
					; Interp_ResolveNormalizedIndex+150j
		mov	dword_6E9C2, eax
		jmp	loc_2F6B5
; ���������������������������������������������������������������������������

loc_2F5D3:				; CODE XREF: Interp_ResolveNormalizedIndex+5Cj
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_2F5EB
		mov	dword_6E9BA, eax
		mov	dword_6E9BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2F5CC
; ���������������������������������������������������������������������������

loc_2F5EB:				; CODE XREF: Interp_ResolveNormalizedIndex+7Dj
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_2F692
; ���������������������������������������������������������������������������

loc_2F5FF:				; CODE XREF: Interp_ResolveNormalizedIndex+13Dj
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2F624:
		mov	[bp+var_A], eax

loc_2F628:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jl	short loc_2F646

loc_2F632:
		cmp	eax, [bp+var_A]

loc_2F636:
		jge	short loc_2F646
		mov	eax, [bp+var_6]
		mov	dword_6E9BA, eax
		mov	eax, [bp+var_A]
		jmp	short loc_2F668
; ���������������������������������������������������������������������������

loc_2F646:				; CODE XREF: Interp_ResolveNormalizedIndex+D2j
					; Interp_ResolveNormalizedIndex:loc_2F636j
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_2F672
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_6E9BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2F668:				; CODE XREF: Interp_ResolveNormalizedIndex+E6j
		mov	dword_6E9BE, eax
		mov	[bp+var_C], 1
		jmp	short loc_2F692
; ���������������������������������������������������������������������������

loc_2F672:				; CODE XREF: Interp_ResolveNormalizedIndex+F0j
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_2F688
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2F692
; ���������������������������������������������������������������������������

loc_2F688:				; CODE XREF: Interp_ResolveNormalizedIndex+11Cj
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_2F692:				; CODE XREF: Interp_ResolveNormalizedIndex+9Ej
					; Interp_ResolveNormalizedIndex+112j ...
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F69E
		jmp	loc_2F5FF
; ���������������������������������������������������������������������������

loc_2F69E:				; CODE XREF: Interp_ResolveNormalizedIndex+13Bj
		mov	ax, dx
		inc	ax

loc_2F6A1:
		movsx	eax, ax
		mov	cx, [si+68h]

loc_2F6A8:
		sub	cx, [si+4Eh]

loc_2F6AB:
		shl	eax, cl
		jmp	loc_2F5CC
; ���������������������������������������������������������������������������

loc_2F6B1:				; CODE XREF: Interp_ResolveNormalizedIndex:loc_2F5A1j
					; Interp_ResolveNormalizedIndex+51j
		mov	eax, dword_6E9C2

loc_2F6B5:				; CODE XREF: Interp_ResolveNormalizedIndex+72j
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_2F6C0
		mov	bx, 0

loc_2F6C0:				; CODE XREF: Interp_ResolveNormalizedIndex+15Dj
		cmp	eax, 0
		jnz	short loc_2F6CF
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_2F6F1
; ���������������������������������������������������������������������������

loc_2F6CF:				; CODE XREF: Interp_ResolveNormalizedIndex+166j
		movsx	edx, word ptr [si+52h]
		shl	edx, 1
		sub	edx, ebx
		imul	edx, eax
		add	edx, [si+6Eh]
		mov	cx, [si+68h]
		sar	edx, cl
		sub	cx, [si+52h]
		movsx	eax, bx
		add	ax, cx

loc_2F6F1:				; CODE XREF: Interp_ResolveNormalizedIndex+16Fj
		pop	di
		pop	si
		leave
		retf
Interp_ResolveNormalizedIndex	endp

; ���������������������������������������������������������������������������
		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+6]
		mov	eax, [bp+0Ah]
		sar	eax, 8
		mov	[bp+0Ah], eax
		cmp	dword_6E9BA, 0FFFFFFFFh
		jz	short loc_2F735
		cmp	eax, dword_6E9BA
		jl	short loc_2F735
		mov	eax, [si+76h]

loc_2F71D:
		cmp	eax, dword_6E9BA
		jg	short loc_2F727
		jmp	loc_2F834
; ���������������������������������������������������������������������������

loc_2F727:				; CODE XREF: seg067:04E2j
		mov	eax, [bp+0Ah]
		cmp	eax, dword_6E9BE
		jge	short loc_2F735

loc_2F732:
		jmp	loc_2F834
; ���������������������������������������������������������������������������

loc_2F735:				; CODE XREF: seg067:04D0j seg067:04D7j ...
		mov	eax, [si+72h]

loc_2F739:
		cmp	eax, [bp+0Ah]

loc_2F73D:
		jle	short loc_2F756

loc_2F73F:
		mov	dword_6E9BA, 0
		mov	dword_6E9BE, eax
		xor	eax, eax

loc_2F74F:				; CODE XREF: seg067:052Cj seg067:05F1j
		mov	dword_6E9C2, eax
		jmp	loc_2F838
; ���������������������������������������������������������������������������

loc_2F756:				; CODE XREF: seg067:loc_2F73Dj
		mov	eax, [si+76h]
		cmp	eax, [bp+0Ah]
		jg	short loc_2F76E
		mov	dword_6E9BA, eax
		mov	dword_6E9BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2F74F
; ���������������������������������������������������������������������������

loc_2F76E:				; CODE XREF: seg067:051Ej
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp-2],	al
		mov	byte ptr [bp-0Ch], 0
		jmp	loc_2F815
; ���������������������������������������������������������������������������

loc_2F782:				; CODE XREF: seg067:05DEj
		dec	byte ptr [bp-2]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp-6],	eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp-0Ah], eax
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-6]
		jl	short loc_2F7C9
		cmp	eax, [bp-0Ah]
		jge	short loc_2F7C9
		mov	eax, [bp-6]
		mov	dword_6E9BA, eax

loc_2F7C3:
		mov	eax, [bp-0Ah]
		jmp	short loc_2F7EB
; ���������������������������������������������������������������������������

loc_2F7C9:				; CODE XREF: seg067:0573j seg067:0579j
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-0Ah]
		jnz	short loc_2F7F5
		inc	dx

loc_2F7D4:
		mov	eax, [bp-0Ah]
		mov	dword_6E9BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2F7EB:				; CODE XREF: seg067:0587j
		mov	dword_6E9BE, eax
		mov	byte ptr [bp-0Ch], 1
		jmp	short loc_2F815
; ���������������������������������������������������������������������������

loc_2F7F5:				; CODE XREF: seg067:0591j
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-6]
		jge	short loc_2F80B
		mov	ax, 1
		mov	cl, [bp-2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2F815
; ���������������������������������������������������������������������������

loc_2F80B:				; CODE XREF: seg067:05BDj
		mov	ax, 1
		mov	cl, [bp-2]
		shl	ax, cl
		add	dx, ax

loc_2F815:				; CODE XREF: seg067:053Fj seg067:05B3j ...
		mov	al, [bp-0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F821
		jmp	loc_2F782
; ���������������������������������������������������������������������������

loc_2F821:				; CODE XREF: seg067:05DCj
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_2F74F
; ���������������������������������������������������������������������������

loc_2F834:				; CODE XREF: seg067:04E4j
					; seg067:loc_2F732j
		mov	eax, dword_6E9C2

loc_2F838:				; CODE XREF: seg067:0513j
		mov	bx, [bp+8]
		cmp	bx, 0

loc_2F83E:
		jge	short loc_2F843
		mov	bx, 0

loc_2F843:				; CODE XREF: seg067:loc_2F83Ej
		cmp	eax, 0
		jnz	short loc_2F852
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_2F874
; ���������������������������������������������������������������������������

loc_2F852:				; CODE XREF: seg067:0607j
		movsx	edx, word ptr [si+52h]
		shl	edx, 1
		sub	edx, ebx
		imul	edx, eax
		add	edx, [si+6Eh]
		mov	cx, [si+68h]
		sar	edx, cl
		sub	cx, [si+52h]
		movsx	eax, bx
		add	ax, cx

loc_2F874:				; CODE XREF: seg067:0610j
		cmp	ax, 0
		jnz	short loc_2F87E
		mov	ax, 0FFFFh
		jmp	short loc_2F88C
; ���������������������������������������������������������������������������

loc_2F87E:				; CODE XREF: seg067:0637j
		cmp	ax, 0
		jl	short loc_2F885
		jmp	short loc_2F88C
; ���������������������������������������������������������������������������

loc_2F885:				; CODE XREF: seg067:0641j
		mov	bx, [si+52h]
		sub	bx, ax
		mov	ax, bx

loc_2F88C:				; CODE XREF: seg067:063Cj seg067:0643j
		pop	di
		pop	si
		leave
		retf
seg067		ends
