seg077		segment	para public 'CODE' use16
		assume cs:seg077
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EB62		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2EB62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EB67		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_1], 0Fh
		xor	cx, cx
		jmp	short loc_2EBDD

loc_2EB79:
		mov	ax, cx
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+1]
		mov	dx, word_77BF2
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		mov	dl, 0
		les	bx, [bp+var_6]
		mov	eax, es:[bx+11h]
		cmp	eax, [si+8]
		jle	short loc_2EBA5
		or	dl, 4
		jmp	short loc_2EBB5

loc_2EBA5:
		les	bx, [bp+var_6]
		mov	eax, es:[bx+11h]
		cmp	eax, [si]
		jge	short loc_2EBB5
		or	dl, 1

loc_2EBB5:
		les	bx, [bp+var_6]
		mov	eax, es:[bx+15h]
		cmp	eax, [si+4]
		jle	short loc_2EBC8
		or	dl, 2
		jmp	short loc_2EBD9

loc_2EBC8:
		les	bx, [bp+var_6]
		mov	eax, es:[bx+15h]
		cmp	eax, [si+0Ch]
		jge	short loc_2EBD9
		or	dl, 8

loc_2EBD9:
		and	[bp+var_1], dl
		inc	cx

loc_2EBDD:
		cmp	cx, 3
		jl	short loc_2EB79
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_2EB67		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Render_SignedAreaScreen
; (sub_2FA29 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,78L — calcule le produit vectoriel 2D (aire signée) de 3 points projetés à
; l'écran, divise par 2 : calcul de l'aire signée d'un triangle projeté (test
; d'orientation/backface en espace écran).
; ==============================================================================================
Render_SignedAreaScreen		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	bx, cx
		mov	eax, [bx]
		sub	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [di]
		sub	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bx+4]
		sub	eax, [si+4]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		sub	eax, [si+4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		sub	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		or	eax, eax
		jge	short loc_2EC67
		neg	eax

loc_2EC67:
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		sar	eax, 8
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_20], eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
Render_SignedAreaScreen		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EC8B		proc far

var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1]
		mov	dx, word_77BF2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, 11h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_3C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_38], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+3]
		mov	dx, word_77BF2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, 11h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	bx, [bp+var_C]
		mov	eax, es:[bx]
		mov	[bp+var_48], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_44], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_40], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+5]
		mov	dx, word_77BF2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, 11h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_54], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_50], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_48]
		cmp	eax, [bp+var_14]
		jge	short loc_2ED62
		mov	[bp+var_14], eax

loc_2ED62:
		mov	eax, [bp+var_54]
		cmp	eax, [bp+var_14]
		jge	short loc_2ED70
		mov	[bp+var_14], eax

loc_2ED70:
		mov	eax, [bp+var_3C]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_48]
		cmp	eax, [bp+var_18]
		jle	short loc_2ED86
		mov	[bp+var_18], eax

loc_2ED86:
		mov	eax, [bp+var_54]
		cmp	eax, [bp+var_18]
		jle	short loc_2ED94
		mov	[bp+var_18], eax

loc_2ED94:
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_44]
		cmp	eax, [bp+var_1C]
		jge	short loc_2EDAA
		mov	[bp+var_1C], eax

loc_2EDAA:
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_1C]
		jge	short loc_2EDB8
		mov	[bp+var_1C], eax

loc_2EDB8:
		mov	eax, [bp+var_38]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_44]
		cmp	eax, [bp+var_20]
		jle	short loc_2EDCE
		mov	[bp+var_20], eax

loc_2EDCE:
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_20]
		jle	short loc_2EDDC
		mov	[bp+var_20], eax

loc_2EDDC:
		mov	eax, [si]
		cmp	eax, [bp+var_14]
		jge	short loc_2EDE8
		jmp	loc_2EE82

loc_2EDE8:
		cmp	eax, [bp+var_18]
		jle	short loc_2EDF1
		jmp	loc_2EE82

loc_2EDF1:
		mov	eax, [si+4]
		cmp	eax, [bp+var_1C]
		jge	short loc_2EDFE
		jmp	loc_2EE82

loc_2EDFE:
		cmp	eax, [bp+var_20]
		jg	short loc_2EE82
		lea	ax, word ptr [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	si
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	si
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	si
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_2C], eax
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_30], eax
		mov	eax, [bp+var_24]
		add	eax, [bp+var_28]
		add	eax, [bp+var_2C]
		mov	edx, [bp+var_30]
		inc	edx
		cmp	eax, edx
		jg	short loc_2EE82
		mov	al, 1
		jmp	short loc_2EE84

loc_2EE82:
		mov	al, 0

loc_2EE84:
		pop	si
		leave
		retf
sub_2EC8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EE87		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2EE87		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EE8C		proc far
		push	bp
		mov	bp, sp
		xor	ax, ax
		mov	word_7CC90, ax
		mov	word_7CC8E, ax
		xor	eax, eax
		mov	dword ptr word_7CC96, eax
		mov	dword ptr word_7CC92, eax
		pop	bp
		retf
sub_2EE8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EEA4		proc far
		push	bp
		mov	bp, sp
		push	0
		push	ds
		push	offset word_7CC8E
sub_2EEA4		endp

; START OF FUNCTION CHUNK FOR sub_2EEA4
		db 9Ah
		test	[bx+si], al
; END OF FUNCTION CHUNK FOR sub_2EEA4
seg077		ends
