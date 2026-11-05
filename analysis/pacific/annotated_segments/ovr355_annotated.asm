ovr355		segment	para public 'OVERLAY' use16
		assume cs:ovr355
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Conversation : lit un nom de 9 octets dans [rec+3] (décor de
; GROUP_SHOT).
; ==============================================================================================
ConvRec_ReadName_C5800		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_C581F

loc_C580B:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3], al
		inc	cx

loc_C581F:
		cmp	cx, 9
		jl	short loc_C580B
		pop	si
		pop	bp
		retf
ConvRec_ReadName_C5800		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Conversation, CLOSEUP : si [rec+20] = 0 lit visage (9) → +25, image (1)
; → +3, décor (9) → +4, x (mot) → +13, y (mot) → +15 ; puis le texte terminé par 0 (copie
; allouée → +17) ; si [rec+20] = 0, couleur (1) → +19 ; puis deux mots → +21 (voix, 65535 =
; aucune) et +23 ; [rec+20] = 1.
; ==============================================================================================
ConvRec_ReadCloseup_C5827		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+14h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_C583E
		jmp	loc_C58D1

loc_C583E:
		xor	dx, dx
		jmp	short loc_C5856

loc_C5842:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+19h], al
		inc	dx

loc_C5856:
		cmp	dx, 9
		jl	short loc_C5842
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+3], al
		xor	dx, dx
		jmp	short loc_C5882

loc_C586E:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+4], al
		inc	dx

loc_C5882:
		cmp	dx, 9
		jl	short loc_C586E
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
		mov	[di+0Dh], ax
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
		mov	[di+0Fh], ax

loc_C58D1:
		mov	bx, [bp+arg_2]
		push	large [bx+4]
		call	sub_398A
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+11h]
		call	sub_65A86
		pop	cx
		push	[bp+var_2]
		call	sub_6596D
		pop	cx
		mov	[di+11h], ax
		mov	dx, [di+11h]
		xor	cx, cx
		jmp	short loc_C5912

loc_C5900:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, dx
		mov	[bx], al
		inc	dx
		inc	cx

loc_C5912:
		cmp	cx, [bp+var_2]
		jl	short loc_C5900
		mov	al, [di+14h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C592F
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+13h], al

loc_C592F:
		mov	bx, [bp+arg_2]
		les	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_2]
		add	word ptr [bx+4], 2
		mov	[di+15h], ax
		mov	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_6], ax
		mov	bx, [bp+arg_2]
		add	word ptr [bx+4], 2
		mov	[di+17h], ax
		mov	byte ptr [di+14h], 1
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadCloseup_C5827		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Conversation, commande 17 (repères de la scène de groupe) : n (mot) →
; +87, n mots → +7…, x (mot) → +3, y (mot) → +5.
; ==============================================================================================
ConvRec_ReadMarks_C5960		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	bx, cx
		les	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_2], ax
		mov	bx, cx
		add	word ptr [bx+4], 2
		mov	[si+57h], ax
		xor	di, di
		jmp	short loc_C599F

loc_C5986:
		mov	bx, cx
		les	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_4], ax
		mov	bx, cx
		add	word ptr [bx+4], 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+7], ax
		inc	di

loc_C599F:
		cmp	[si+57h], di
		jg	short loc_C5986
		mov	bx, cx
		les	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_6], ax
		mov	bx, cx
		add	word ptr [bx+4], 2
		mov	[si+3], ax
		mov	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_8], ax
		mov	bx, cx
		add	word ptr [bx+4], 2
		mov	[si+5], ax
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadMarks_C5960		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Conversation, GROUP_SHOT_ADD_CHARACTER : nom (9) → +3, x (mot) → +12, y
; (mot) → +14.
; ==============================================================================================
ConvRec_ReadFigure_C59CE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	cx, [bp+arg_2]
		xor	dx, dx
		jmp	short loc_C59F0

loc_C59DD:
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+3], al
		inc	dx

loc_C59F0:
		cmp	dx, 9
		jl	short loc_C59DD
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
ConvRec_ReadFigure_C59CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5A41		proc far

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
		jmp	short loc_C5A64

loc_C5A50:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, di
		add	bx, dx
		mov	[bx+3], al
		inc	dx

loc_C5A64:
		cmp	dx, 9
		jl	short loc_C5A50
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
		call	sub_398A
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+11h]
		call	sub_65A86
		pop	cx
		push	[bp+var_2]
		call	sub_6596D
		pop	cx
		mov	[di+11h], ax
		mov	di, [di+11h]
		xor	dx, dx
		jmp	short loc_C5AFE

loc_C5AEE:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di], al
		inc	di
		inc	dx

loc_C5AFE:
		cmp	dx, [bp+var_2]
		jl	short loc_C5AEE
		pop	di
		pop	si
		leave
		retf
sub_C5A41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Conversation, SHOW_TEXT : couleur (1) → +3, texte terminé par 0 (copie
; allouée → +4), deux mots → +6 (voix) et +8.
; ==============================================================================================
ConvRec_ReadText_C5B07		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+3], al
		push	large [bx+4]
		call	sub_398A
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+4]
		call	sub_65A86
		pop	cx
		push	[bp+var_2]
		call	sub_6596D
		pop	cx
		mov	[di+4], ax
		mov	dx, [di+4]
		xor	cx, cx
		jmp	short loc_C5B5F

loc_C5B4D:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, dx
		mov	[bx], al
		inc	dx
		inc	cx

loc_C5B5F:
		cmp	cx, [bp+var_2]
		jl	short loc_C5B4D
		mov	bx, [bp+arg_2]
		les	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_2]
		add	word ptr [bx+4], 2
		mov	[di+6], ax
		mov	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_6], ax
		mov	bx, [bp+arg_2]
		add	word ptr [bx+4], 2
		mov	[di+8], ax
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadText_C5B07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Conversation, commande 5 : rend 1 si GameVar_Get_56414([rec+3]) = 0,
; sinon 0.
; ==============================================================================================
ConvRec_FlagNotSet_C5B91		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+3]
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C5BA9
		mov	al, 0
		jmp	short loc_C5BAB

loc_C5BA9:
		mov	al, 1

loc_C5BAB:
		pop	si
		pop	bp
		retf
ConvRec_FlagNotSet_C5B91		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Conversation, commande 5 : numéro de drapeau (mot) → +3.
; ==============================================================================================
ConvRec_ReadNumber_C5BAE		proc far

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
ConvRec_ReadNumber_C5BAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5BEC		proc far

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
sub_C5BEC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5C2A		proc far

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
sub_C5C2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5C68		proc far

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
sub_C5C68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5C91		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_C5CB0

loc_C5C9C:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3], al
		inc	cx

loc_C5CB0:
		cmp	cx, 9
		jl	short loc_C5C9C
		pop	si
		pop	bp
		retf
sub_C5C91		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5CB8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C5CD1
		push	7
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_C5CE2

loc_C5CD1:
		mov	word ptr [si], 390Fh
		mov	byte ptr [si+2], 12h
		mov	word ptr [si], 39D0h
		mov	word ptr [si+3], 0

loc_C5CE2:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C5CB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5CE7		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		push	large [bx+4]
		call	sub_398A
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		cmp	word ptr [di+3], 0
		jz	short loc_C5D14
		push	word ptr [di+3]
		call	sub_3B2
		pop	cx

loc_C5D14:
		push	[bp+var_2]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+3], ax
		cmp	word ptr [di+3], 0
		jnz	short loc_C5D2F
		push	9034h
		call	sub_1DDFE
		pop	cx

loc_C5D2F:
		mov	dx, [di+3]
		xor	cx, cx
		jmp	short loc_C5D48

loc_C5D36:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, dx
		mov	[bx], al
		inc	dx
		inc	cx

loc_C5D48:
		cmp	cx, [bp+var_2]
		jl	short loc_C5D36
		mov	bx, [bp+arg_2]
		les	bx, [bx+4]
		mov	ax, es:[bx]
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_2]
		add	word ptr [bx+4], 2
		mov	[di+5], ax
		pop	di
		pop	si
		leave
		retf
sub_C5CE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5D67		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		les	si, [bx]
		inc	word ptr [bx]
		mov	byte ptr es:[si], 12h
		push	word ptr [di+3]
		call	CRT_Strlen
		pop	cx
		inc	ax
		mov	si, ax
		push	ax
		push	ds
		push	word ptr [di+3]
		mov	bx, [bp+arg_2]
		push	large [bx]
		call	sub_39E1
		add	sp, 0Ah
		mov	bx, [bp+arg_2]
		add	[bx], si
		pop	di
		pop	si
		pop	bp
		retf
sub_C5D67		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5DA2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+3]
		pop	si
		pop	bp
		retf
sub_C5DA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_85DCA (sub_85DCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle LinkedListB_Helper_5F66B (seg159).
; ==============================================================================================
HUDSymbol_ReleaseListEntry_C5DAF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C5DD8
		mov	word ptr [si], 39D0h
		push	word ptr [si+3]
		call	sub_3B2
		pop	cx
		test	di, 1
		jz	short loc_C5DD8
		push	si
		call	sub_3B2
		pop	cx

loc_C5DD8:
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntry_C5DAF		endp
ovr355		ends
