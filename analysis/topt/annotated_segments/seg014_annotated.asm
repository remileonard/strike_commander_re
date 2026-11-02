seg014		segment	para public 'CODE' use16
		assume cs:seg014
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 0A1h, 33h, 8Bh, 0DCh, 36h, 83h, 47h, 4, 0F6h, 0EAh, 3Eh, 8, 0A1h, 33h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à ConvRec_ReadName_6305
; (sub_6305 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-22. Lit un nom de 9 octets du script dans [rec+3] (commande 00h :
; décor de la scène de groupe).
; ==============================================================================================
ConvRec_ReadName_93FF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_2]
		xor	cx, cx
		jmp	short loc_941F

loc_940E:
		les	bx, [di+4]
		inc	word ptr [di+4]
		mov	al, es:[bx]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3], al
		inc	cx

loc_941F:
		cmp	cx, 9
		jl	short loc_940E
		pop	di
		pop	si
		pop	bp
		retf
ConvRec_ReadName_93FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9428		proc far

var_8		= byte ptr -8
var_7		= byte ptr -7
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
		mov	di, [bp+arg_0]
		mov	al, [di+1Fh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_943F
		jmp	loc_94E4

loc_943F:
		xor	cx, cx
		jmp	short loc_9455

loc_9443:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, cx
		mov	[bx+di+3], al
		inc	cx

loc_9455:
		cmp	cx, 9
		jl	short loc_9443
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+0Ch], al
		xor	cx, cx
		jmp	short loc_947F

loc_946D:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, cx
		mov	[bx+di+0Dh], al
		inc	cx

loc_947F:
		cmp	cx, 9
		jl	short loc_946D
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_7], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_8], al
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dl, [bp+var_8]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+16h], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_7], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_8], al
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dl, [bp+var_8]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+18h], ax

loc_94E4:
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	sub_3651
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+1Ch]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_2]
		call	sub_32FCF
		add	sp, 2
		mov	[di+1Ch], ax
		mov	ax, [di+1Ch]
		mov	[bp+var_6], ax
		mov	[bp+var_4], 0
		jmp	short loc_9536

loc_951F:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_6]
		mov	[bx], al
		inc	[bp+var_6]
		inc	[bp+var_4]

loc_9536:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jl	short loc_951F
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	sub_3651
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+1Ah]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_2]
		call	sub_32FCF
		add	sp, 2
		mov	[di+1Ah], ax
		mov	ax, [di+1Ah]
		mov	[bp+var_6], ax
		mov	[bp+var_4], 0
		jmp	short loc_9590

loc_9579:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_6]
		mov	[bx], al
		inc	[bp+var_6]
		inc	[bp+var_4]

loc_9590:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jl	short loc_9579
		mov	al, [di+1Fh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_95B0
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+1Eh], al

loc_95B0:
		mov	byte ptr [di+1Fh], 1
		pop	di
		pop	si
		leave
		retf
sub_9428		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à ConvRec_ReadExtra_6464
; (sub_6464 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-22. Commande 01h : nom de figure (9 octets) +3, x (mot LE) +0Ch, y
; +0Eh.
; ==============================================================================================
ConvRec_ReadExtra_95B8		proc far

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
		xor	cx, cx
		jmp	short loc_95D9

loc_95C7:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, cx
		mov	[bx+di+3], al
		inc	cx

loc_95D9:
		cmp	cx, 9
		jl	short loc_95C7
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Ch], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Eh], ax
		pop	di
		pop	si
		leave
		retf
ConvRec_ReadExtra_95B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9642		proc far

var_8		= byte ptr -8
var_7		= byte ptr -7
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
		mov	di, [bp+arg_0]
		mov	[bp+var_6], 0
		jmp	short loc_9669

loc_9654:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_6]
		mov	[bx+di+3], al
		inc	[bp+var_6]

loc_9669:
		cmp	[bp+var_6], 9
		jl	short loc_9654
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_7], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_8], al
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dl, [bp+var_8]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Ch], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_7], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_8], al
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dl, [bp+var_8]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Eh], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+10h], al
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	sub_3651
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+11h]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_2]
		call	sub_32FCF
		add	sp, 2
		mov	[di+11h], ax
		mov	ax, [di+11h]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_9730

loc_9719:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_4]
		mov	[bx], al
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_9730:
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jl	short loc_9719
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	sub_3651
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+13h]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_2]
		call	sub_32FCF
		add	sp, 2
		mov	[di+13h], ax
		mov	ax, [di+13h]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_978A

loc_9773:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_4]
		mov	[bx], al
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_978A:
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jl	short loc_9773
		pop	di
		pop	si
		leave
		retf
sub_9642		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9796		proc far

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
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	sub_3651
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+6]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_2]
		call	sub_32FCF
		add	sp, 2
		mov	[di+6], ax
		mov	ax, [di+6]
		mov	[bp+var_6], ax
		mov	[bp+var_4], 0
		jmp	short loc_9802

loc_97EB:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_6]
		mov	[bx], al
		inc	[bp+var_6]
		inc	[bp+var_4]

loc_9802:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jl	short loc_97EB
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	sub_3651
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+4]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_2]
		call	sub_32FCF
		add	sp, 2
		mov	[di+4], ax
		mov	ax, [di+4]
		mov	[bp+var_6], ax
		mov	[bp+var_4], 0
		jmp	short loc_985C

loc_9845:
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_6]
		mov	[bx], al
		inc	[bp+var_6]
		inc	[bp+var_4]

loc_985C:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jl	short loc_9845
		pop	di
		pop	si
		leave
		retf
sub_9796		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9868		proc far

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
		mov	cx, [bp+arg_2]
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, cx
		les	si, [bx+4]
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
sub_9868		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_98A8		proc far

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
		mov	cx, [bp+arg_2]
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, cx
		les	si, [bx+4]
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
sub_98A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à ConvRec_ReadWing_66E0
; (sub_66E0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-22. Commande 0Eh : octet écran +3 (0 = décor s_wing pour 0Fh, sinon
; w_wing), octet escadre +4 (INFO de la FORM WING de GAMEFLOW.IFF).
; ==============================================================================================
ConvRec_ReadWing_98E8		proc far

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
		mov	bx, dx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+4], al
		pop	di
		pop	si
		pop	bp
		retf
ConvRec_ReadWing_98E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9913		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_2]
		xor	cx, cx
		jmp	short loc_9933
sub_9913		endp

; START OF FUNCTION CHUNK FOR sub_9913
		db 0C4h, 5Dh, 4, 0FFh, 45h, 4, 26h, 8Ah, 7, 8Bh, 0DAh, 3, 0D9h, 88h
; END OF FUNCTION CHUNK FOR sub_9913
seg014		ends
