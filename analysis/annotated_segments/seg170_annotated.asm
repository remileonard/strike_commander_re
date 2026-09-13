seg170		segment	byte public 'CODE' use16
		assume cs:seg170
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 342 lignes, NON DÉTAILLÉE EN PROFONDEUR — remplit un rectangle (arg_2/arg_4 →
; arg_6/arg_8, couleur arg_A) clippé contre les bornes d'une structure de contexte graphique
; (si, champs +2 → tableau de bornes). Appelée en cas dégénéré par
; Render_DrawFilledEllipse_6106E et Render_DrawEllipseOutline_61612 (seg167/169). Référencée
; directement par sub_17242 et sub_172F3 — probable primitive de remplissage de base du moteur
; de rendu 2D (HUD/UI). Candidat pour session dédiée si la précision doit être vérifiée.
; ==============================================================================================
Render_FillClippedRect_61960	proc far		; CODE XREF: Gauge_DrawNeedle+A5P
					; Gauge_DrawTick+F7P ...

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

loc_61964:
		push	si
		push	di

loc_61966:
		cld

loc_61967:
		mov	si, [bp+arg_0]
		mov	bx, [si+2]

loc_6196D:
		mov	ax, [bx]
		add	bx, 2

loc_61972:
		mov	bx, [bx]
		sub	bx, ax
		mov	[bp+var_4], bx
		mov	[bp+var_2], bx
		mov	ax, [si]
		mov	es, ax

loc_61980:
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]
		cmp	bx, ax
		jge	short loc_61993
		xchg	ax, bx
		xchg	cx, dx

loc_61993:				; CODE XREF: Render_FillClippedRect_61960+2Ej
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx
		jge	short loc_619AF
		xchg	cx, dx
		neg	[bp+var_2]
		mov	[bp+var_A], 1
		jmp	short loc_619B4
; ���������������������������������������������������������������������������

loc_619AF:				; CODE XREF: Render_FillClippedRect_61960+41j
		mov	[bp+var_A], 0

loc_619B4:				; CODE XREF: Render_FillClippedRect_61960+4Dj
		cmp	bx, [si+4]
		jl	loc_61B54
		cmp	ax, [si+8]
		jg	loc_61B54

loc_619C2:
		cmp	dx, [si+6]

loc_619C5:
		jl	loc_61B54

loc_619C9:
		cmp	cx, [si+0Ah]
		jg	loc_61B54

loc_619D0:
		cmp	bx, [si+8]

loc_619D3:
		jle	short loc_619F7

loc_619D5:
		mov	bx, [bp+arg_6]

loc_619D8:
		sub	bx, [bp+arg_2]

loc_619DB:
		mov	dx, [bp+arg_8]

loc_619DE:
		sub	dx, [bp+arg_4]

loc_619E1:
		mov	ax, [si+8]

loc_619E4:
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_8], ax
		mov	ax, [si+8]
		mov	[bp+arg_6], ax

loc_619F7:				; CODE XREF: Render_FillClippedRect_61960:loc_619D3j
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_61A21

loc_619FF:
		mov	bx, [bp+arg_6]

loc_61A02:
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]

loc_61A08:
		sub	dx, [bp+arg_4]
		mov	ax, [si+4]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_4], ax
		mov	ax, [si+4]
		mov	[bp+arg_2], ax

loc_61A21:				; CODE XREF: Render_FillClippedRect_61960+9Dj
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		test	[bp+var_A], 0FFh
		jz	short loc_61A43
		xchg	ax, bx
		xchg	cx, dx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx

loc_61A40:
		mov	[bp+arg_6], dx

loc_61A43:				; CODE XREF: Render_FillClippedRect_61960+D2j
		cmp	bx, [si+6]

loc_61A46:
		jl	loc_61B54
		cmp	ax, [si+0Ah]

loc_61A4D:
		jg	loc_61B54
		cmp	bx, [si+0Ah]
		jle	short loc_61A74
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

loc_61A74:				; CODE XREF: Render_FillClippedRect_61960+F4j
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_61AA1

loc_61A7F:
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+6]
		sub	ax, [bp+arg_4]
		imul	dx

loc_61A93:
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_2], ax
		mov	ax, [si+6]
		mov	[bp+arg_4], ax

loc_61AA1:				; CODE XREF: Render_FillClippedRect_61960+11Dj
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_8], bx
		test	[bp+var_A], 0FFh
		jz	short loc_61ACC
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		xchg	ax, bx
		xchg	cx, dx

loc_61AC0:
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx

loc_61AC6:
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_61ACC:				; CODE XREF: Render_FillClippedRect_61960+14Fj
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]

loc_61AD2:
		mov	[bp+var_6], bx

loc_61AD5:
		mov	ax, [bp+arg_4]
		imul	ax, [bp+var_4]

loc_61ADC:
		add	ax, [bp+arg_2]

loc_61ADF:
		mov	bx, [si+2]

loc_61AE2:
		mov	di, [bx]

loc_61AE4:
		add	di, ax

loc_61AE6:
		mov	al, [bp+arg_A]
		xor	cx, cx
		mov	bx, [bp+arg_2]
		cmp	bx, [bp+arg_6]
		jz	short loc_61B38

loc_61AF3:
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]

loc_61AF9:
		jz	short loc_61B46

loc_61AFB:
		mov	bx, [bp+var_6]
		mov	dx, [bp+var_8]

loc_61B01:
		cmp	dx, bx
		jg	short loc_61B1D
		mov	si, bx
		inc	si
		mov	cx, bx
		shr	cx, 1

loc_61B0C:				; CODE XREF: Render_FillClippedRect_61960+1B4j
					; Render_FillClippedRect_61960+1BBj
		stosb
		dec	si
		jz	short loc_61B54
		add	cx, dx
		cmp	cx, bx
		jl	short loc_61B0C
		add	di, [bp+var_2]
		sub	cx, bx
		jmp	short loc_61B0C
; ���������������������������������������������������������������������������

loc_61B1D:				; CODE XREF: Render_FillClippedRect_61960+1A3j
		mov	si, dx
		inc	si
		mov	cx, dx
		shr	cx, 1

loc_61B24:				; CODE XREF: Render_FillClippedRect_61960+1D1j
					; Render_FillClippedRect_61960:loc_61B36j
		mov	es:[di], al
		add	di, [bp+var_2]
		dec	si
		jz	short loc_61B54
		add	cx, bx
		cmp	cx, dx
		jl	short loc_61B24

loc_61B33:
		inc	di
		sub	cx, dx

loc_61B36:
		jmp	short loc_61B24
; ���������������������������������������������������������������������������

loc_61B38:				; CODE XREF: Render_FillClippedRect_61960+191j
		mov	cx, [bp+var_8]
		inc	cx

loc_61B3C:				; CODE XREF: Render_FillClippedRect_61960:loc_61B42j
		mov	es:[di], al

loc_61B3F:
		add	di, [bp+var_2]

loc_61B42:
		loop	loc_61B3C

loc_61B44:
		jmp	short loc_61B54
; ���������������������������������������������������������������������������

loc_61B46:				; CODE XREF: Render_FillClippedRect_61960:loc_61AF9j
		mov	cx, [bp+var_6]
		inc	cx
		mov	ah, al
		shr	cx, 1

loc_61B4E:
		rep stosw

loc_61B50:
		adc	cx, cx

loc_61B52:
		rep stosb

loc_61B54:				; CODE XREF: Render_FillClippedRect_61960+57j
					; Render_FillClippedRect_61960+5Ej ...
		pop	di
		pop	si
		leave
		retf
Render_FillClippedRect_61960	endp

seg170		ends
