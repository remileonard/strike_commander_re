seg117		segment	byte public 'CODE' use16
		assume cs:seg117
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_FillClippedRect_61960 (sub_61960 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 342 lignes, NON DÉTAILLÉE EN PROFONDEUR —
; remplit un rectangle (arg_2/arg_4 → arg_6/arg_8, couleur arg_A) clippé contre les bornes
; d'une structure de contexte graphique (si, champs +2 → tableau de bornes). Appelée en cas
; dégénéré par Render_DrawFilledEllipse_6106E et Render_DrawEllipseOutline_61612 (seg167/169).
; Référencée directement par sub_17242 et sub_172F3 — probable primitive de remplissage de
; base du moteur de rendu 2D (HUD/UI). Candidat pour session dédiée si la précision doit être
; vérifiée.
; ==============================================================================================
Render_FillClippedRect_326E6	proc far		; CODE XREF: sub_DE60+5EP sub_DE60+78P ...

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		enter	0Ah, 0
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]
		mov	bx, [si+2]
		mov	ax, [bx]
		add	bx, 2
		mov	bx, [bx]
		sub	bx, ax
		mov	[bp+var_4], bx
		mov	[bp+var_2], bx
		mov	ax, [si]
		mov	es, ax
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]
		cmp	bx, ax
		jge	short loc_32719
		xchg	ax, bx
		xchg	cx, dx

loc_32719:				; CODE XREF: Render_FillClippedRect_326E6+2Ej
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx
		jge	short loc_32735
		xchg	cx, dx
		neg	[bp+var_2]
		mov	[bp+var_A], 1
		jmp	short loc_3273A
; ���������������������������������������������������������������������������

loc_32735:				; CODE XREF: Render_FillClippedRect_326E6+41j
		mov	[bp+var_A], 0

loc_3273A:				; CODE XREF: Render_FillClippedRect_326E6+4Dj
		cmp	bx, [si+4]
		jl	loc_328DA
		cmp	ax, [si+8]
		jg	loc_328DA
		cmp	dx, [si+6]
		jl	loc_328DA
		cmp	cx, [si+0Ah]
		jg	loc_328DA
		cmp	bx, [si+8]
		jle	short loc_3277D
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+8]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_8], ax
		mov	ax, [si+8]
		mov	[bp+arg_6], ax

loc_3277D:				; CODE XREF: Render_FillClippedRect_326E6+73j
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_327A7
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+4]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_4], ax
		mov	ax, [si+4]
		mov	[bp+arg_2], ax

loc_327A7:				; CODE XREF: Render_FillClippedRect_326E6+9Dj
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		test	[bp+var_A], 0FFh
		jz	short loc_327C9
		xchg	ax, bx
		xchg	cx, dx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_327C9:				; CODE XREF: Render_FillClippedRect_326E6+D2j
		cmp	bx, [si+6]
		jl	loc_328DA
		cmp	ax, [si+0Ah]
		jg	loc_328DA
		cmp	bx, [si+0Ah]
		jle	short loc_327FA
		sub	bx, ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+0Ah]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+arg_8], ax

loc_327FA:				; CODE XREF: Render_FillClippedRect_326E6+F4j
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_32827
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+6]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_2], ax
		mov	ax, [si+6]
		mov	[bp+arg_4], ax

loc_32827:				; CODE XREF: Render_FillClippedRect_326E6+11Dj
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_8], bx
		test	[bp+var_A], 0FFh
		jz	short loc_32852
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		xchg	ax, bx
		xchg	cx, dx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_32852:				; CODE XREF: Render_FillClippedRect_326E6+14Fj
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	[bp+var_6], bx
		mov	ax, [bp+arg_4]
		imul	ax, [bp+var_4]
		add	ax, [bp+arg_2]
		mov	bx, [si+2]
		mov	di, [bx]
		add	di, ax
		mov	al, [bp+arg_A]
		xor	cx, cx
		mov	bx, [bp+arg_2]
		cmp	bx, [bp+arg_6]
		jz	short loc_328BE
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jz	short loc_328CC
		mov	bx, [bp+var_6]
		mov	dx, [bp+var_8]
		cmp	dx, bx
		jg	short loc_328A3
		mov	si, bx
		inc	si
		mov	cx, bx
		shr	cx, 1

loc_32892:				; CODE XREF: Render_FillClippedRect_326E6+1B4j
					; Render_FillClippedRect_326E6+1BBj
		stosb
		dec	si
		jz	short loc_328DA
		add	cx, dx
		cmp	cx, bx
		jl	short loc_32892
		add	di, [bp+var_2]
		sub	cx, bx
		jmp	short loc_32892
; ���������������������������������������������������������������������������

loc_328A3:				; CODE XREF: Render_FillClippedRect_326E6+1A3j
		mov	si, dx
		inc	si
		mov	cx, dx
		shr	cx, 1

loc_328AA:				; CODE XREF: Render_FillClippedRect_326E6+1D1j
					; Render_FillClippedRect_326E6+1D6j
		mov	es:[di], al
		add	di, [bp+var_2]
		dec	si
		jz	short loc_328DA
		add	cx, bx
		cmp	cx, dx
		jl	short loc_328AA
		inc	di
		sub	cx, dx
		jmp	short loc_328AA
; ���������������������������������������������������������������������������

loc_328BE:				; CODE XREF: Render_FillClippedRect_326E6+191j
		mov	cx, [bp+var_8]
		inc	cx

loc_328C2:				; CODE XREF: Render_FillClippedRect_326E6+1E2j
		mov	es:[di], al
		add	di, [bp+var_2]
		loop	loc_328C2
		jmp	short loc_328DA
; ���������������������������������������������������������������������������

loc_328CC:				; CODE XREF: Render_FillClippedRect_326E6+199j
		mov	cx, [bp+var_6]
		inc	cx
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_328DA:				; CODE XREF: Render_FillClippedRect_326E6+57j
					; Render_FillClippedRect_326E6+5Ej ...
		pop	di
		pop	si
		leave
		retf
Render_FillClippedRect_326E6	endp

seg117		ends
