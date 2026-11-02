seg061		segment	para public 'CODE' use16
		assume cs:seg061
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 68h, 0AEh, 68h, 9Ah, 66h, 0, 1Eh, 48h, 83h, 0C4h, 4, 5Dh, 0CBh, 0, 0
		db 2Eh, 8Bh, 3Eh, 0Eh, 0, 8Ah, 65h, 2, 8Bh, 0Dh, 0BAh, 0C8h, 3, 8Bh, 36h, 0B0h
		db 49h, 8Bh, 5Dh, 3, 6, 1Fh, 0F6h, 0C1h, 7Fh, 75h, 0Fh, 90h, 90h, 8Bh, 0D6h, 0ECh
		db 0A8h, 8, 75h, 0FBh, 0ECh, 0A8h, 8, 74h, 0FBh, 90h, 0BAh, 0C8h, 3, 8Ah, 0C4h, 0FEh
		db 0C4h, 0EEh, 0EBh, 2, 90h, 90h, 42h, 8Ah, 7, 0EEh, 0EBh, 2, 90h, 90h, 8Ah, 47h
		db 1, 0EEh, 0EBh, 2, 90h, 90h, 8Ah, 47h, 2, 0EEh, 83h, 0C3h, 3, 4Ah, 0E2h, 0C6h
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_243B1		proc far

arg_0		= word ptr  6

		enter	0, 0
		mov	bx, [bp+arg_0]
		mov	cs:0Eh, bx
		mov	es, [bx+5]
		lea	edx, dword_489F0
		xor	cx, cx
		mov	bx, 5350h
		mov	ax, 1209h
		int	15h
		leave
		retf
sub_243B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_243D1		proc far

var_14		= byte ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= word ptr  10h

		enter	14h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	eax, eax
		cmp	byte_4C19A, al
		jz	loc_24533
		mov	ax, [bp+arg_2]
		cmp	ax, [si+58h]
		jnb	loc_24594
		mov	eax, [bp+arg_6]
		sar	eax, 8
		mov	edx, eax
		sar	edx, 2
		sub	eax, edx
		mov	[bp+arg_6], eax
		cmp	dword_4C18E, 0FFFFFFFFh
		jz	short loc_24430
		cmp	eax, dword_4C18E
		jl	short loc_24430
		mov	eax, [si+76h]
		cmp	eax, dword_4C18E
		jg	short loc_24422
		jmp	loc_2452F

loc_24422:
		mov	eax, [bp+arg_6]
		cmp	eax, dword_4C192
		jge	short loc_24430
		jmp	loc_2452F

loc_24430:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_6]
		jle	short loc_24451
		mov	dword_4C18E, 0
		mov	dword_4C192, eax
		xor	eax, eax

loc_2444A:
		mov	dword_4C196, eax
		jmp	loc_24533

loc_24451:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_6]
		jg	short loc_24469
		mov	dword_4C18E, eax
		mov	dword_4C192, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2444A

loc_24469:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_A], al
		mov	[bp+var_14], 0
		jmp	loc_24510

loc_2447D:
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
		jl	short loc_244C4
		cmp	eax, [bp+var_12]
		jge	short loc_244C4
		mov	eax, [bp+var_E]
		mov	dword_4C18E, eax
		mov	eax, [bp+var_12]
		jmp	short loc_244E6

loc_244C4:
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_12]
		jnz	short loc_244F0
		inc	dx
		mov	eax, [bp+var_12]
		mov	dword_4C18E, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_244E6:
		mov	dword_4C192, eax
		mov	[bp+var_14], 1
		jmp	short loc_24510

loc_244F0:
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_E]
		jge	short loc_24506
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_24510

loc_24506:
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		add	dx, ax

loc_24510:
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2451C
		jmp	loc_2447D

loc_2451C:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_2444A

loc_2452F:
		mov	eax, dword_4C196

loc_24533:
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_2]
		shl	ax, 4
		mov	di, [si+5Ah]
		add	di, ax
		mov	ax, [bp+arg_A]
		or	ax, ax
		jnz	short loc_24552
		mov	ax, [di+0Ch]

loc_24552:
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		imul	[bp+var_8]
		add	ax, 80h
		sar	ax, 8
		mov	[bp+var_6], ax
		cmp	[bp+var_4], 0
		jnz	short loc_24573
		mov	ax, [di+6]
		add	ax, [bp+var_6]
		jmp	short loc_24592

loc_24573:
		mov	ax, [di+0Eh]
		sub	ax, [bp+var_6]
		cwde
		imul	eax, [bp+var_4]
		mov	bx, [di]
		add	eax, [bx+6Eh]
		mov	cl, [bx+68h]
		sar	eax, cl
		add	ax, [di+6]
		add	ax, [bp+var_6]

loc_24592:
		jmp	short loc_24596

loc_24594:
		xor	ax, ax

loc_24596:
		pop	di
		pop	si
		leave
		retf
sub_243D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_FogTableIndex_1F908 (sub_1F908 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_FogTableIndex_2F404 (sub_2F404 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des
; objets, OBJECT_RENDER.md). N° de table de brouillard pour une profondeur (ex-
; Interp_ResolveCached) : même recherche de seuils que Palette_ShadeIndexWithFog_2F24E (cache
; dword_6E9BA/BE/C2).
; ==============================================================================================
Palette_FogTableIndex_2459A		proc far

var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sar	eax, 8
		mov	[bp+arg_2], eax
		cmp	dword_4C18E, 0FFFFFFFFh
		jz	short loc_245DA
		cmp	eax, dword_4C18E
		jl	short loc_245DA
		mov	eax, [si+76h]
		cmp	eax, dword_4C18E
		jg	short loc_245CC
		jmp	loc_246D9

loc_245CC:
		mov	eax, [bp+arg_2]
		cmp	eax, dword_4C192
		jge	short loc_245DA
		jmp	loc_246D9

loc_245DA:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_245FB
		mov	dword_4C18E, 0
		mov	dword_4C192, eax
		xor	eax, eax

loc_245F4:
		mov	dword_4C196, eax
		jmp	loc_246DD

loc_245FB:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_24613
		mov	dword_4C18E, eax
		mov	dword_4C192, eax
		mov	eax, [si+6Ah]
		jmp	short loc_245F4

loc_24613:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_246BA

loc_24627:
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
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jl	short loc_2466E
		cmp	eax, [bp+var_A]
		jge	short loc_2466E
		mov	eax, [bp+var_6]
		mov	dword_4C18E, eax
		mov	eax, [bp+var_A]
		jmp	short loc_24690

loc_2466E:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_2469A
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_4C18E, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_24690:
		mov	dword_4C192, eax
		mov	[bp+var_C], 1
		jmp	short loc_246BA

loc_2469A:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_246B0
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_246BA

loc_246B0:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_246BA:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_246C6
		jmp	loc_24627

loc_246C6:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_245F4

loc_246D9:
		mov	eax, dword_4C196

loc_246DD:
		movsx	edx, word ptr [si+52h]
		imul	eax, edx
		add	eax, [si+6Eh]
		mov	cx, [si+68h]
		sar	eax, cl
		pop	di
		pop	si
		leave
		retf
Palette_FogTableIndex_2459A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_246F4		proc far

var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	bx, [si+52h]
		inc	bx
		imul	ax, bx
		add	ax, 80h
		sar	ax, 8
		dec	ax
		mov	[bp+arg_2], ax
		mov	eax, [bp+arg_4]
		sar	eax, 8
		mov	[bp+arg_4], eax
		cmp	dword_4C18E, 0FFFFFFFFh
		jz	short loc_24748
		cmp	eax, dword_4C18E
		jl	short loc_24748
		mov	eax, [si+76h]
		cmp	eax, dword_4C18E
		jg	short loc_2473A
		jmp	loc_24847

loc_2473A:
		mov	eax, [bp+arg_4]
		cmp	eax, dword_4C192
		jge	short loc_24748
		jmp	loc_24847

loc_24748:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_24769
		mov	dword_4C18E, 0
		mov	dword_4C192, eax
		xor	eax, eax

loc_24762:
		mov	dword_4C196, eax
		jmp	loc_2484B

loc_24769:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_24781
		mov	dword_4C18E, eax
		mov	dword_4C192, eax
		mov	eax, [si+6Ah]
		jmp	short loc_24762

loc_24781:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_24828

loc_24795:
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
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jl	short loc_247DC
		cmp	eax, [bp+var_A]
		jge	short loc_247DC
		mov	eax, [bp+var_6]
		mov	dword_4C18E, eax
		mov	eax, [bp+var_A]
		jmp	short loc_247FE

loc_247DC:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_24808
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_4C18E, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_247FE:
		mov	dword_4C192, eax
		mov	[bp+var_C], 1
		jmp	short loc_24828

loc_24808:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_2481E
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_24828

loc_2481E:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_24828:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_24834
		jmp	loc_24795

loc_24834:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_24762

loc_24847:
		mov	eax, dword_4C196

loc_2484B:
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_24858
		nop
		nop
		mov	bx, 0

loc_24858:
		cmp	eax, 0
		jnz	short loc_24867
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_24889

loc_24867:
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

loc_24889:
		pop	di
		pop	si
		leave
		retf
sub_246F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2488D		proc far

var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_4]
		sar	eax, 8
		mov	[bp+arg_4], eax
		cmp	dword_4C18E, 0FFFFFFFFh
		jz	short loc_248CD
		cmp	eax, dword_4C18E
		jl	short loc_248CD
		mov	eax, [si+76h]
		cmp	eax, dword_4C18E
		jg	short loc_248BF
		jmp	loc_249CC

loc_248BF:
		mov	eax, [bp+arg_4]
		cmp	eax, dword_4C192
		jge	short loc_248CD
		jmp	loc_249CC

loc_248CD:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_248EE
		mov	dword_4C18E, 0
		mov	dword_4C192, eax
		xor	eax, eax

loc_248E7:
		mov	dword_4C196, eax
		jmp	loc_249D0

loc_248EE:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_24906
		mov	dword_4C18E, eax
		mov	dword_4C192, eax
		mov	eax, [si+6Ah]
		jmp	short loc_248E7

loc_24906:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_249AD

loc_2491A:
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
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jl	short loc_24961
		cmp	eax, [bp+var_A]
		jge	short loc_24961
		mov	eax, [bp+var_6]
		mov	dword_4C18E, eax
		mov	eax, [bp+var_A]
		jmp	short loc_24983

loc_24961:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_2498D
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_4C18E, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_24983:
		mov	dword_4C192, eax
		mov	[bp+var_C], 1
		jmp	short loc_249AD

loc_2498D:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_249A3
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_249AD

loc_249A3:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_249AD:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_249B9
		jmp	loc_2491A

loc_249B9:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_248E7

loc_249CC:
		mov	eax, dword_4C196

loc_249D0:
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_249DD
		nop
		nop
		mov	bx, 0

loc_249DD:
		cmp	eax, 0
		jnz	short loc_249EC
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_24A0E

loc_249EC:
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

loc_24A0E:
		cmp	ax, 0
		jnz	short loc_24A1A
		nop
		nop
		mov	ax, 0FFFFh
		jmp	short loc_24A2A

loc_24A1A:
		cmp	ax, 0
		jl	short loc_24A23
		nop
sub_2488D		endp
seg061		ends
