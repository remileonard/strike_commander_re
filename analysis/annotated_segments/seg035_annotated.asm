seg035		segment	byte public 'CODE' use16
		assume cs:seg035
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,22L — remplit de zéros une zone mémoire (0x280 mots = écran texte 80x25) via
; segment/offset lu dans une table (word_70E62) : effacement de la page vidéo texte.
; ==============================================================================================
Video_ClearTextPage	proc far		; CODE XREF: UIScreen_ClearAndLoadResource_869C0+AFP
		push	bp
		mov	bp, sp

loc_20613:
		push	di

loc_20614:				; DATA XREF: seg216:01D6o
		mov	bx, word_70E62

loc_20618:
		mov	es, word ptr [bx]
		mov	bx, [bx+2]
		mov	di, [bx]
		add	di, 0FA00h
		mov	cx, 280h
		xor	ax, ax
		rep stosw
		pop	di
		pop	bp
		retf
Video_ClearTextPage	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,48L — borne une valeur 0-4, programme les registres CRT du contrôleur vidéo (port 0x3D4,
; horizontal total) via calcul d'offset ×0x50 : réglage matériel du décalage horizontal de
; l'affichage (scroll fin/registre CRTC), utilisé pour l'effet de tremblement d'écran (shake).
; ==============================================================================================
Video_SetHorizontalShake	proc far		; CODE XREF: seg015:0232P seg087:030DP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jge	short loc_2063B
		mov	[bp+arg_0], 0

loc_2063B:				; CODE XREF: Video_SetHorizontalShake+7j
		cmp	[bp+arg_0], 4
		jle	short loc_20646
		mov	[bp+arg_0], 4

loc_20646:				; CODE XREF: Video_SetHorizontalShake+12j
		mov	ax, [bp+arg_0]
		cmp	ax, word_6DFF0
		jz	short loc_2067C
		mov	ax, [bp+arg_0]
		mov	word_6DFF0, ax
		mov	dx, 50h	; 'P'
		mov	ax, [bp+arg_0]
		imul	dx
		mov	[bp+arg_0], ax
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	dx, 3D4h
		add	dl, 6
		sub	dl, 6

loc_2066E:
		mov	bx, [bp+arg_0]
		mov	ah, bh
		mov	al, 0Ch
		out	dx, ax		; Video: CRT cntrlr addr
					; horizontal total
		mov	ah, bl
		inc	al
		out	dx, ax		; Video: CRT cntrlr addr
					; horizontal total
		sti

loc_2067C:				; CODE XREF: Video_SetHorizontalShake+20j
		pop	bp
		retf
Video_SetHorizontalShake	endp

seg035		ends
