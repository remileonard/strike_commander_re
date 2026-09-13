seg167		segment	byte public 'CODE' use16
		assume cs:seg167
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 481 lignes, NON DÉTAILLÉE EN PROFONDEUR — algorithme de tracé d'ellipse/cercle
; rempli façon Bresenham : calcule les carrés des rayons (arg_6²/arg_8²) et les termes
; d'erreur incrémentaux dans des globales dédiées (word_70F40-70F62), dessine dans une
; structure de contexte graphique (es:[si]). Cas dégénéré (rayons nuls) délégué à sub_61960
; (remplissage rectangulaire). Référencée depuis seg059. Candidat pour session dédiée si la
; précision géométrique doit être vérifiée.
; ==============================================================================================
Render_DrawFilledEllipse_6106E	proc far		; CODE XREF: seg059:0569P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	[bp+arg_6], 0
		jz	short loc_6107F
		cmp	[bp+arg_8], 0
		jnz	short loc_610AC

loc_6107F:				; CODE XREF: Render_DrawFilledEllipse_6106E+9j
		push	[bp+arg_A]
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+arg_6]
		push	ax
		push	[bp+arg_0]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		jmp	loc_613AB
; ���������������������������������������������������������������������������

loc_610AC:				; CODE XREF: Render_DrawFilledEllipse_6106E+Fj
		mov	si, [bp+arg_0]
		mov	es, word ptr [si]
		mov	ax, [si+8]
		mov	word_70F4C, ax
		mov	ax, [si+4]
		mov	word_70F48, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_70F46, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_70F4A, ax
		mov	ax, [bp+arg_A]

loc_610D0:
		mov	ah, al

loc_610D2:
		mov	word_70F40, ax

loc_610D5:
		mov	ax, [bp+arg_2]

loc_610D8:
		mov	word_70F4E, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1

loc_610E0:
		mov	word_70F50, ax

loc_610E3:
		mov	word_70F42, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_70F44, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_70F56, ax

loc_610F9:
		mov	word_70F58, dx
		shl	ax, 1
		rcl	dx, 1

loc_61101:
		mov	word_70F5A, ax
		mov	word_70F5C, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_70F5E, ax
		mov	word_70F60, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_70F62, ax
		mov	word_70F64, dx
		mov	word_70F66, 0
		mov	word_70F68, 0
		mov	ax, word_70F5A
		mov	dx, word_70F5C

loc_61132:
		mov	cx, [bp+arg_8]
		push	ax

loc_61136:
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx

loc_6113C:
		mul	dx
		add	dx, cx

loc_61140:
		mov	word_70F6A, ax

loc_61143:
		mov	word_70F6C, dx

loc_61147:
		mov	ax, word_70F56

loc_6114A:
		mov	dx, word_70F58
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_70F5E
		add	dx, word_70F60
		mov	word_70F6E, ax
		mov	word_70F70, dx
		mov	ax, word_70F56
		mov	dx, word_70F58
		mov	cx, [bp+arg_8]

loc_6116F:
		push	ax
		mov	ax, dx

loc_61172:
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx

loc_61178:
		add	dx, cx
		sub	word_70F6E, ax
		sbb	word_70F70, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_61188:				; CODE XREF: Render_DrawFilledEllipse_6106E:loc_61283j
		mov	ax, word_70F66
		mov	dx, word_70F68
		sub	ax, word_70F6A
		sbb	dx, word_70F6C
		js	short loc_6119C
		jmp	loc_61286
; ���������������������������������������������������������������������������

loc_6119C:				; CODE XREF: Render_DrawFilledEllipse_6106E+129j
		push	bx
		mov	ax, word_70F4E
		add	ax, word_70F42
		cmp	ax, word_70F4C
		jle	short loc_611AD
		mov	ax, word_70F4C

loc_611AD:				; CODE XREF: Render_DrawFilledEllipse_6106E+13Aj
		cmp	ax, word_70F48
		jge	short loc_611B5

loc_611B3:				; CODE XREF: Render_DrawFilledEllipse_6106E+15Ej
					; Render_DrawFilledEllipse_6106E+16Fj
		jmp	short loc_6122D
; ���������������������������������������������������������������������������

loc_611B5:				; CODE XREF: Render_DrawFilledEllipse_6106E+143j
		mov	word_70F54, ax
		mov	ax, word_70F4E
		sub	ax, word_70F42
		cmp	ax, word_70F48
		jge	short loc_611C8
		mov	ax, word_70F48

loc_611C8:				; CODE XREF: Render_DrawFilledEllipse_6106E+155j
		cmp	ax, word_70F4C
		jg	short loc_611B3
		mov	word_70F52, ax

loc_611D1:
		mov	si, word_70F50

loc_611D5:
		add	si, word_70F44
		cmp	si, word_70F46
		jl	short loc_611B3
		cmp	si, word_70F4A
		jg	short loc_611FF
		mov	di, word_70F52
		mov	cx, word_70F54
		sub	cx, di
		inc	cx
		add	di, [bp+si]

loc_611F2:
		mov	ax, word_70F40
		mov	ah, al

loc_611F7:
		shr	cx, 1

loc_611F9:
		rep stosw
		rcl	cx, 1

loc_611FD:
		rep stosb

loc_611FF:				; CODE XREF: Render_DrawFilledEllipse_6106E+175j
		mov	si, word_70F50

loc_61203:
		sub	si, word_70F44

loc_61207:
		cmp	si, word_70F4A
		jg	short loc_6122D
		cmp	si, word_70F46
		jl	short loc_6122D
		mov	di, word_70F52
		mov	cx, word_70F54
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_70F40
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_6122D:				; CODE XREF: Render_DrawFilledEllipse_6106E:loc_611B3j
					; Render_DrawFilledEllipse_6106E+19Dj ...
		pop	bx
		cmp	word_70F70, 0
		js	short loc_61259

loc_61235:
		sub	word_70F44, 2
		dec	bx
		mov	ax, word_70F6A

loc_6123E:
		mov	dx, word_70F6C

loc_61242:
		sub	ax, word_70F5A

loc_61246:
		sbb	dx, word_70F5C

loc_6124A:
		mov	word_70F6A, ax

loc_6124D:
		mov	word_70F6C, dx

loc_61251:
		sub	word_70F6E, ax

loc_61255:
		sbb	word_70F70, dx

loc_61259:				; CODE XREF: Render_DrawFilledEllipse_6106E+1C5j
		inc	word_70F42
		mov	ax, word_70F66
		mov	dx, word_70F68
		add	ax, word_70F62

loc_61268:
		adc	dx, word_70F64

loc_6126C:
		mov	word_70F66, ax

loc_6126F:
		mov	word_70F68, dx
		add	ax, word_70F5E
		adc	dx, word_70F60
		add	word_70F6E, ax

loc_6127F:
		adc	word_70F70, dx

loc_61283:
		jmp	loc_61188
; ���������������������������������������������������������������������������

loc_61286:				; CODE XREF: Render_DrawFilledEllipse_6106E+12Bj
		push	bx
		mov	ax, word_70F56
		mov	dx, word_70F58
		sub	ax, word_70F5E
		sbb	dx, word_70F60
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_70F66
		sbb	dx, word_70F68
		sub	ax, word_70F6A
		sbb	dx, word_70F6C
		sar	dx, 1
		rcr	ax, 1
		add	word_70F6E, ax
		adc	word_70F70, dx
		pop	bx

loc_612BF:				; CODE XREF: Render_DrawFilledEllipse_6106E+33Aj
		push	bx

loc_612C0:
		mov	ax, word_70F4E

loc_612C3:
		add	ax, word_70F42

loc_612C7:
		cmp	ax, word_70F4C
		jle	short loc_612D0

loc_612CD:
		mov	ax, word_70F4C

loc_612D0:				; CODE XREF: Render_DrawFilledEllipse_6106E+25Dj
		cmp	ax, word_70F48

loc_612D4:
		jge	short loc_612D8

loc_612D6:				; CODE XREF: Render_DrawFilledEllipse_6106E+281j
					; Render_DrawFilledEllipse_6106E+292j
		jmp	short loc_61350
; ���������������������������������������������������������������������������

loc_612D8:				; CODE XREF: Render_DrawFilledEllipse_6106E:loc_612D4j
		mov	word_70F54, ax
		mov	ax, word_70F4E
		sub	ax, word_70F42

loc_612E2:
		cmp	ax, word_70F48
		jge	short loc_612EB
		mov	ax, word_70F48

loc_612EB:				; CODE XREF: Render_DrawFilledEllipse_6106E+278j
		cmp	ax, word_70F4C
		jg	short loc_612D6

loc_612F1:
		mov	word_70F52, ax

loc_612F4:
		mov	si, word_70F50
		add	si, word_70F44
		cmp	si, word_70F46
		jl	short loc_612D6

loc_61302:
		cmp	si, word_70F4A
		jg	short loc_61322
		mov	di, word_70F52
		mov	cx, word_70F54
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_70F40
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_61322:				; CODE XREF: Render_DrawFilledEllipse_6106E+298j
		mov	si, word_70F50
		sub	si, word_70F44
		cmp	si, word_70F4A
		jg	short loc_61350

loc_61330:
		cmp	si, word_70F46
		jl	short loc_61350
		mov	di, word_70F52

loc_6133A:
		mov	cx, word_70F54
		sub	cx, di
		inc	cx
		add	di, [bp+si]

loc_61343:
		mov	ax, word_70F40

loc_61346:
		mov	ah, al

loc_61348:
		shr	cx, 1

loc_6134A:
		rep stosw
		rcl	cx, 1

loc_6134E:
		rep stosb

loc_61350:				; CODE XREF: Render_DrawFilledEllipse_6106E:loc_612D6j
					; Render_DrawFilledEllipse_6106E+2C0j ...
		pop	bx

loc_61351:
		cmp	word_70F70, 0

loc_61356:
		jns	short loc_6137A
		inc	word_70F42
		mov	ax, word_70F66

loc_6135F:
		mov	dx, word_70F68

loc_61363:
		add	ax, word_70F62
		adc	dx, word_70F64

loc_6136B:
		mov	word_70F66, ax

loc_6136E:
		mov	word_70F68, dx

loc_61372:
		add	word_70F6E, ax
		adc	word_70F70, dx

loc_6137A:				; CODE XREF: Render_DrawFilledEllipse_6106E:loc_61356j
		sub	word_70F44, 2
		mov	ax, word_70F6A
		mov	dx, word_70F6C
		sub	ax, word_70F5A
		sbb	dx, word_70F5C

loc_6138E:
		mov	word_70F6A, ax

loc_61391:
		mov	word_70F6C, dx

loc_61395:
		sub	ax, word_70F56
		sbb	dx, word_70F58
		sub	word_70F6E, ax
		sbb	word_70F70, dx
		dec	bx
		js	short loc_613AB
		jmp	loc_612BF
; ���������������������������������������������������������������������������

loc_613AB:				; CODE XREF: Render_DrawFilledEllipse_6106E+3Bj
					; Render_DrawFilledEllipse_6106E+338j
		pop	di
		pop	si
		pop	bp
		retf
Render_DrawFilledEllipse_6106E	endp

seg167		ends
