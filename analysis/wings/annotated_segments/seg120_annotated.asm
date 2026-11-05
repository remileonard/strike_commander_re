seg120		segment	para public 'CODE' use16
		assume cs:seg120
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 0C5h, 3, 0, 0, 59h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; FontStyle_ClearFlag_68364 (sub_68364 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à FontStyle_ClearFlag_2F362 (sub_2F362 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à FontStyle_ClearFlag_5EAED (sub_5EAED de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible — modifie un champ de flags sur l'objet police/style. Appelée massivement
; par sub_5EDEC et les blocs voisins.
; ==============================================================================================
FontStyle_ClearFlag_47E79		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		movzx	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		movzx	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		shl	eax, 4
		add	eax, [bp+var_8]
		shld	edx, eax, 10h
		leave
		retf
FontStyle_ClearFlag_47E79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; FontStyle_Construct_6838F (sub_6838F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à FontStyle_Construct_2F38D (sub_2F38D de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à FontStyle_Construct_5EB18 (sub_5EB18 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (sub_658). Référencée via le thunk loc_5EEBE (tag 5C60h) — constructeur de la classe
; police/style de texte.
; ==============================================================================================
FontStyle_Construct_47EA4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_47EBD
		push	79h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_47F25

loc_47EBD:
		xor	eax, eax
		mov	[si+18h], eax
		mov	[si+14h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+1Ch], 33330000h
		mov	byte ptr [si+20h], 0
		and	byte ptr [si+64h], 0FDh
		xor	ax, ax
		mov	[si+68h], al
		mov	[si+67h], al
		mov	[si+66h], al
		mov	[si+65h], al
		xor	dx, dx
		jmp	short loc_47F04

loc_47EFD:
		mov	bx, dx
		mov	byte ptr [bx+si+69h], 0
		inc	dx

loc_47F04:
		cmp	dx, 7
		jl	short loc_47EFD
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_47F21
		cmp	bx, 1209h
		jnz	short loc_47F21
		or	byte ptr [si+64h], 1
		jmp	short loc_47F25

loc_47F21:
		and	byte ptr [si+64h], 0FEh

loc_47F25:
		mov	ax, si
		pop	si
		pop	bp
		retf
FontStyle_Construct_47EA4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47F2A		proc far

var_18		= word ptr -18h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+64h]
		and	ax, 1
		or	al, al
		jz	short loc_47F88
		mov	[bp+var_8], ds
		mov	[bp+var_C], si
		mov	[bp+var_18], 0DE09h
		mov	dword ptr [si+1Ch], 33330000h
		lea	ax, [bp+var_18]
		push	ax
		push	67h
		call	sub_1BFA
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		mov	[bp+var_2], ds
		mov	ax, si
		add	ax, 20h
		mov	[bp+var_4], ax
		mov	byte ptr [si+20h], 0
		and	byte ptr [si+64h], 0FEh
		mov	ax, [bp+var_2]
		mov	es, ax
		mov	ax, 1209h
		mov	bx, 5352h
		mov	di, [bp+var_4]
		int	15h

loc_47F88:
		pop	di
		pop	si
		leave
		retf
sub_47F2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47F8C		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+64h]
		and	ax, 1
		or	al, al
		jnz	short loc_47FA4
		jmp	loc_48081

loc_47FA4:
		mov	[bp+var_4], ds
		mov	[bp+var_6], si
		mov	dword ptr [si+1Ch], 0
		test	byte ptr [si+65h], 80h
		jz	short loc_47FC0
		or	dword ptr [si+1Ch], 303h

loc_47FC0:
		test	byte ptr [si+66h], 80h
		jz	short loc_47FCE
		or	dword ptr [si+1Ch], 30Ch

loc_47FCE:
		test	byte ptr [si+67h], 80h
		jz	short loc_47FDC
		or	dword ptr [si+1Ch], 330h

loc_47FDC:
		test	byte ptr [si+68h], 80h
		jz	short loc_47FEA
		or	dword ptr [si+1Ch], 3C0h

loc_47FEA:
		mov	[bp+var_2], 0
		jmp	short loc_48015

loc_47FF1:
		mov	bx, [bp+var_2]
		mov	al, [bx+si+65h]
		mov	ah, 0
		and	ax, 3
		movsx	eax, ax
		mov	dl, byte ptr [bp+var_2]
		shl	dl, 2
		add	dl, 10h
		mov	cl, dl
		shl	eax, cl
		or	[si+1Ch], eax
		inc	[bp+var_2]

loc_48015:
		cmp	[bp+var_2], 4
		jl	short loc_47FF1
		les	di, [bp+var_6]
		mov	ax, 0DE09h
		int	67h
		mov	byte ptr [si+20h], 0
		mov	byte ptr [si+21h], 0
		mov	al, [si+64h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_48066
		mov	[bp+var_2], 7
		jmp	short loc_48060

loc_48040:
		shl	byte ptr [si+20h], 1
		shl	byte ptr [si+21h], 1
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_4805D
		or	byte ptr [si+20h], 1
		cmp	byte ptr [bx+si+71h], 0
		jz	short loc_4805D
		or	byte ptr [si+21h], 1

loc_4805D:
		dec	[bp+var_2]

loc_48060:
		cmp	[bp+var_2], 0
		jge	short loc_48040

loc_48066:
		mov	ax, si
		add	ax, 20h
		mov	ax, si
		add	ax, 20h
		mov	[bp+var_4], ds
		mov	[bp+var_6], ax
		les	di, [bp+var_6]
		mov	ax, 1209h
		mov	bx, 5352h
		int	15h

loc_48081:
		pop	di
		pop	si
		leave
		retf
sub_47F8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48085		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0FFFFh
		push	large [bp+arg_2]
		push	cs
		call	near ptr FontStyle_ClearFlag_47E79
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6], eax
		mov	di, si
		xor	dx, dx
		jmp	short loc_480FB

loc_480AE:
		mov	bx, dx
		mov	al, [bx+si+65h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_480F7
		mov	al, [bp+arg_6]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_480DD
		cmp	ax, 2
		jz	short loc_480D5
		cmp	ax, 3
		jnz	short loc_480E5
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 80h
		jmp	short loc_480EB

loc_480D5:
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 81h
		jmp	short loc_480EB

loc_480DD:
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 82h
		jmp	short loc_480EB

loc_480E5:
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 83h

loc_480EB:
		mov	eax, [bp+var_6]
		mov	[di], eax
		mov	[bp+var_2], dx
		jmp	short loc_48100

loc_480F7:
		inc	dx
		add	di, 4

loc_480FB:
		cmp	dx, 4
		jl	short loc_480AE

loc_48100:
		push	si
		push	cs
		call	near ptr sub_47F8C
		pop	cx
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_48085		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4810D		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	cs
		call	near ptr FontStyle_ClearFlag_47E79
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_5], 0
		mov	di, si
		xor	dx, dx
		jmp	short loc_48154

loc_48135:
		mov	bx, dx
		cmp	byte ptr [bx+si+65h], 0
		jz	short loc_48150
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jnz	short loc_48150
		mov	byte ptr [bx+si+65h], 0
		mov	[bp+var_5], 1
		jmp	short loc_48159

loc_48150:
		inc	dx
		add	di, 4

loc_48154:
		cmp	dx, 4
		jl	short loc_48135

loc_48159:
		push	si
		push	cs
		call	near ptr sub_47F8C
		pop	cx
		mov	al, [bp+var_5]
		pop	di
		pop	si
		leave
		retf
sub_4810D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; FontStyle_ApplyVariantB_68651 (sub_68651 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à FontStyle_ApplyVariantB_2F661 (sub_2F661 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à FontStyle_ApplyVariantB_5EDEC (sub_5EDEC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine FontStyle_ClearFlag_5EAED et FontStyle_CombineFlags_5EC12.
; ==============================================================================================
FontStyle_ApplyVariantB_48166		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	cs
		call	near ptr FontStyle_ClearFlag_47E79
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0FFFFh
		mov	di, si
		add	di, 24h
		cmp	[bp+arg_6], 0
		jle	short loc_481CF
		xor	dx, dx
		jmp	short loc_481CA

loc_48199:
		mov	bx, dx
		mov	al, [bx+si+69h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_481C6
		mov	byte ptr [bx+si+69h], 1
		mov	al, [bp+arg_A]
		mov	[bx+si+71h], al
		mov	eax, [bp+var_4]
		mov	[di], eax
		add	di, 4
		add	eax, [bp+arg_6]
		dec	eax
		mov	[di], eax
		mov	[bp+var_6], dx
		jmp	short loc_481CF

loc_481C6:
		add	di, 8
		inc	dx

loc_481CA:
		cmp	dx, 8
		jl	short loc_48199

loc_481CF:
		push	si
		push	cs
		call	near ptr sub_47F8C
		pop	cx
		mov	ax, [bp+var_6]
		pop	di
		pop	si
		leave
		retf
FontStyle_ApplyVariantB_48166		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_481DC		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	cs
		call	near ptr FontStyle_ClearFlag_47E79
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_5], 0
		mov	di, si
		add	di, 24h
		xor	dx, dx
		jmp	short loc_48226

loc_48207:
		mov	bx, dx
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_48222
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jnz	short loc_48222
		mov	byte ptr [bx+si+69h], 0
		mov	[bp+var_5], 1
		jmp	short loc_4822B

loc_48222:
		add	di, 8
		inc	dx

loc_48226:
		cmp	dx, 8
		jl	short loc_48207

loc_4822B:
		push	si
		push	cs
		call	near ptr sub_47F8C
		pop	cx
		mov	al, [bp+var_5]
		pop	di
		pop	si
		leave
		retf
sub_481DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48238		proc far
		push	bp
		mov	bp, sp
		push	67CCh
		push	cs
		call	near ptr FontStyle_Construct_47EA4
		pop	cx
		pop	bp
		retf
sub_48238		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48245		proc far
		push	bp
		mov	bp, sp
		push	67CCh
		push	cs
		call	near ptr sub_47F2A
		pop	cx
sub_48245		endp
seg120		ends
