seg031		segment	para public 'CODE' use16
		assume cs:seg031
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 98h, 45h, 8Bh, 0DCh, 36h, 83h, 47h, 4, 0F6h, 0EAh, 4Ch, 8, 98h, 45h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à ConvRec_ReadName_C5800
; (sub_C5800 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — far. LUE 2026-11-05. Conversation : lit un nom de 9 octets dans [rec+3]
; (décor de GROUP_SHOT).
; ==============================================================================================
ConvRec_ReadName_18AAF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_18ACE

loc_18ABA:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3], al
		inc	cx

loc_18ACE:
		cmp	cx, 9
		jl	short loc_18ABA
		pop	si
		pop	bp
		retf
ConvRec_ReadName_18AAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un CLOSEUP : 1er appel (rec+1Dh = 0) visage (9), image (1), décor (9), x, y (mots),
; texte, couleur (1) ; appels suivants (CONT 4, SAME 19) : texte seul.
; ==============================================================================================
ConvRec_ReadCloseup_18AD6		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_18AED
		jmp	loc_18B80

loc_18AED:
		xor	dx, dx
		jmp	short loc_18B05

loc_18AF1:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+3], al
		inc	dx

loc_18B05:
		cmp	dx, 9
		jl	short loc_18AF1
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+0Ch], al
		xor	dx, dx
		jmp	short loc_18B31

loc_18B1D:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+0Dh], al
		inc	dx

loc_18B31:
		cmp	dx, 9
		jl	short loc_18B1D
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	dl, es:[si]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	bl, es:[si]
		mov	al, dl
		mov	ah, 0
		mov	dl, bl
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+16h], ax
		mov	bx, [bp+arg_2]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	dl, es:[si]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	bl, es:[si]
		mov	al, dl
		mov	ah, 0
		mov	dl, bl
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+18h], ax

loc_18B80:
		mov	bx, [bp+arg_2]
		push	large [bx+4]
		call	sub_3756
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		cmp	word ptr [di+1Ah], 0
		jz	short loc_18BA2
		push	word ptr [di+1Ah]
		call	sub_45058
		pop	cx

loc_18BA2:
		push	[bp+var_2]
		call	sub_44F3F
		pop	cx
		mov	[di+1Ah], ax
		cmp	word ptr [di+1Ah], 0
		jz	short loc_18BD4
		mov	cx, [di+1Ah]
		xor	dx, dx
		jmp	short loc_18BCD

loc_18BBB:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, cx
		mov	[bx], al
		inc	cx
		inc	dx

loc_18BCD:
		cmp	dx, [bp+var_2]
		jl	short loc_18BBB
		jmp	short loc_18BE4

loc_18BD4:
		push	77h
		push	16A2h
		push	1696h
		call	sub_9D78
		add	sp, 6

loc_18BE4:
		mov	al, [di+1Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_18BFC
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+1Ch], al

loc_18BFC:
		mov	byte ptr [di+1Dh], 1
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadCloseup_18AD6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ConvRec_ReadFigure_C59CE (sub_C59CE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — far. LUE 2026-11-05. Conversation,
; GROUP_SHOT_ADD_CHARACTER : nom (9) → +3, x (mot) → +12, y (mot) → +14.
; ==============================================================================================
ConvRec_ReadFigure_18C04		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	cx, [bp+arg_2]
		xor	dx, dx
		jmp	short loc_18C26

loc_18C13:
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+3], al
		inc	dx

loc_18C26:
		cmp	dx, 9
		jl	short loc_18C13
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	dl, es:[si]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	bl, es:[si]
		mov	al, dl
		mov	ah, 0
		mov	dl, bl
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Ch], ax
		mov	bx, cx
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	dl, es:[si]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	bl, es:[si]
		mov	al, dl
		mov	ah, 0
		mov	dl, bl
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Eh], ax
		pop	di
		pop	si
		pop	bp
		retf
ConvRec_ReadFigure_18C04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, lit nom (9), x, y (mots), un octet, puis un texte ; appelant non relevé.
; ==============================================================================================
ConvRec_ReadFigureText_18C77		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_18C9A

loc_18C86:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+3], al
		inc	dx

loc_18C9A:
		cmp	dx, 9
		jl	short loc_18C86
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	dl, es:[si]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	bl, es:[si]
		mov	al, dl
		mov	ah, 0
		mov	dl, bl
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Ch], ax
		mov	bx, [bp+arg_2]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	dl, es:[si]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	bl, es:[si]
		mov	al, dl
		mov	ah, 0
		mov	dl, bl
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Eh], ax
		mov	bx, [bp+arg_2]
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+10h], al
		push	large [bx+4]
		call	sub_3756
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+11h]
		call	sub_45058
		pop	cx
		push	[bp+var_2]
		call	sub_44F3F
		pop	cx
		mov	[di+11h], ax
		mov	di, [di+11h]
		xor	dx, dx
		jmp	short loc_18D34

loc_18D24:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di], al
		inc	di
		inc	dx

loc_18D34:
		cmp	dx, [bp+var_2]
		jl	short loc_18D24
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadFigureText_18C77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, lit SHOW_TEXT : couleur (1) puis texte terminé par 0 (copie allouée).
; ==============================================================================================
ConvRec_ReadText_18D3D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+3], al
		push	large [bx+4]
		call	sub_3756
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+4]
		call	sub_45058
		pop	cx
		push	[bp+var_2]
		call	sub_44F3F
		pop	cx
		mov	[di+4], ax
		mov	di, [di+4]
		xor	dx, dx
		jmp	short loc_18D93

loc_18D83:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di], al
		inc	di
		inc	dx

loc_18D93:
		cmp	dx, [bp+var_2]
		jl	short loc_18D83
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadText_18D3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ConvRec_ReadNumber_C5BAE (sub_C5BAE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — far. LUE 2026-11-05. Conversation, commande 5 :
; numéro de drapeau (mot) → +3.
; ==============================================================================================
ConvRec_ReadNumber_18D9C		proc far

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	bx, dx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+3], ax
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadNumber_18D9C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ConvRec_ReadNumber_C5BAE (sub_C5BAE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — far. LUE 2026-11-05. Conversation, commande 5 :
; numéro de drapeau (mot) → +3.
; ==============================================================================================
ConvRec_ReadNumber_18DDA		proc far

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	bx, dx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+3], ax
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadNumber_18DDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E18		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	bx, dx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+3], al
		mov	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+4], al
		pop	di
		pop	si
		pop	bp
		retf
sub_18E18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E41		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_18E60
sub_18E41		endp

; START OF FUNCTION CHUNK FOR sub_18E41
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3], al
		inc	cx
; END OF FUNCTION CHUNK FOR sub_18E41
seg031		ends
