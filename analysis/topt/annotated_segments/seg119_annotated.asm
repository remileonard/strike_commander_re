seg119		segment	para public 'CODE' use16
		assume cs:seg119
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 88h, 2Fh, 59h, 6Ah, 0, 9Ah, 50h, 4, 0, 0, 59h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; FontStyle_ClearFlag_2F362 (sub_2F362 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à FontStyle_ClearFlag_5EAED (sub_5EAED de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible —
; modifie un champ de flags sur l'objet police/style. Appelée massivement par sub_5EDEC et les
; blocs voisins.
; ==============================================================================================
FontStyle_ClearFlag_35E5E		proc far

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
FontStyle_ClearFlag_35E5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; FontStyle_Construct_2F38D (sub_2F38D de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à FontStyle_Construct_5EB18 (sub_5EB18 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658). Référencée via
; le thunk loc_5EEBE (tag 5C60h) — constructeur de la classe police/style de texte.
; ==============================================================================================
FontStyle_Construct_35E89		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_35EA2
		push	79h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_35F0A

loc_35EA2:
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
		jmp	short loc_35EE9

loc_35EE2:
		mov	bx, dx
		mov	byte ptr [bx+si+69h], 0
		inc	dx

loc_35EE9:
		cmp	dx, 7
		jl	short loc_35EE2
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_35F06
		cmp	bx, 1209h
		jnz	short loc_35F06
		or	byte ptr [si+64h], 1
		jmp	short loc_35F0A

loc_35F06:
		and	byte ptr [si+64h], 0FEh

loc_35F0A:
		mov	ax, si
		pop	si
		pop	bp
		retf
FontStyle_Construct_35E89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35F0F		proc far

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
		jz	short loc_35F6D
		mov	[bp+var_8], ds
		mov	[bp+var_C], si
		mov	[bp+var_18], 0DE09h
		mov	dword ptr [si+1Ch], 33330000h
		lea	ax, [bp+var_18]
		push	ax
		push	67h
		call	sub_1F03
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

loc_35F6D:
		pop	di
		pop	si
		leave
		retf
sub_35F0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35F71		proc far

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
		jnz	short loc_35F89
		jmp	loc_36066

loc_35F89:
		mov	[bp+var_4], ds
		mov	[bp+var_6], si
		mov	dword ptr [si+1Ch], 0
		test	byte ptr [si+65h], 80h
		jz	short loc_35FA5
		or	dword ptr [si+1Ch], 303h

loc_35FA5:
		test	byte ptr [si+66h], 80h
		jz	short loc_35FB3
		or	dword ptr [si+1Ch], 30Ch

loc_35FB3:
		test	byte ptr [si+67h], 80h
		jz	short loc_35FC1
		or	dword ptr [si+1Ch], 330h

loc_35FC1:
		test	byte ptr [si+68h], 80h
		jz	short loc_35FCF
		or	dword ptr [si+1Ch], 3C0h

loc_35FCF:
		mov	[bp+var_2], 0
		jmp	short loc_35FFA

loc_35FD6:
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

loc_35FFA:
		cmp	[bp+var_2], 4
		jl	short loc_35FD6
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
		jnz	short loc_3604B
		mov	[bp+var_2], 7
		jmp	short loc_36045

loc_36025:
		shl	byte ptr [si+20h], 1
		shl	byte ptr [si+21h], 1
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_36042
		or	byte ptr [si+20h], 1
		cmp	byte ptr [bx+si+71h], 0
		jz	short loc_36042
		or	byte ptr [si+21h], 1

loc_36042:
		dec	[bp+var_2]

loc_36045:
		cmp	[bp+var_2], 0
		jge	short loc_36025

loc_3604B:
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

loc_36066:
		pop	di
		pop	si
		leave
		retf
sub_35F71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3606A		proc far

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
		call	near ptr FontStyle_ClearFlag_35E5E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6], eax
		mov	di, si
		xor	dx, dx
		jmp	short loc_360E0

loc_36093:
		mov	bx, dx
		mov	al, [bx+si+65h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_360DC
		mov	al, [bp+arg_6]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_360C2
		cmp	ax, 2
		jz	short loc_360BA
		cmp	ax, 3
		jnz	short loc_360CA
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 80h
		jmp	short loc_360D0

loc_360BA:
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 81h
		jmp	short loc_360D0

loc_360C2:
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 82h
		jmp	short loc_360D0

loc_360CA:
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 83h

loc_360D0:
		mov	eax, [bp+var_6]
		mov	[di], eax
		mov	[bp+var_2], dx
		jmp	short loc_360E5

loc_360DC:
		inc	dx
		add	di, 4

loc_360E0:
		cmp	dx, 4
		jl	short loc_36093

loc_360E5:
		push	si
		push	cs
		call	near ptr sub_35F71
		pop	cx
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_3606A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_360F2		proc far

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
		call	near ptr FontStyle_ClearFlag_35E5E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_5], 0
		mov	di, si
		xor	dx, dx
		jmp	short loc_36139

loc_3611A:
		mov	bx, dx
		cmp	byte ptr [bx+si+65h], 0
		jz	short loc_36135
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jnz	short loc_36135
		mov	byte ptr [bx+si+65h], 0
		mov	[bp+var_5], 1
		jmp	short loc_3613E

loc_36135:
		inc	dx
		add	di, 4

loc_36139:
		cmp	dx, 4
		jl	short loc_3611A

loc_3613E:
		push	si
		push	cs
		call	near ptr sub_35F71
		pop	cx
		mov	al, [bp+var_5]
		pop	di
		pop	si
		leave
		retf
sub_360F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; FontStyle_ApplyVariantB_2F661 (sub_2F661 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à FontStyle_ApplyVariantB_5EDEC (sub_5EDEC de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; FontStyle_ClearFlag_5EAED et FontStyle_CombineFlags_5EC12.
; ==============================================================================================
FontStyle_ApplyVariantB_3614B		proc far

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
		call	near ptr FontStyle_ClearFlag_35E5E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0FFFFh
		mov	di, si
		add	di, 24h
		cmp	[bp+arg_6], 0
		jle	short loc_361B4
		xor	dx, dx
		jmp	short loc_361AF

loc_3617E:
		mov	bx, dx
		mov	al, [bx+si+69h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_361AB
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
		jmp	short loc_361B4

loc_361AB:
		add	di, 8
		inc	dx

loc_361AF:
		cmp	dx, 8
		jl	short loc_3617E

loc_361B4:
		push	si
		push	cs
		call	near ptr sub_35F71
		pop	cx
		mov	ax, [bp+var_6]
		pop	di
		pop	si
		leave
		retf
FontStyle_ApplyVariantB_3614B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_361C1		proc far

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
		call	near ptr FontStyle_ClearFlag_35E5E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_5], 0
		mov	di, si
		add	di, 24h
		xor	dx, dx
		jmp	short loc_3620B

loc_361EC:
		mov	bx, dx
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_36207
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jnz	short loc_36207
		mov	byte ptr [bx+si+69h], 0
		mov	[bp+var_5], 1
		jmp	short loc_36210

loc_36207:
		add	di, 8
		inc	dx

loc_3620B:
		cmp	dx, 8
		jl	short loc_361EC

loc_36210:
		push	si
		push	cs
		call	near ptr sub_35F71
		pop	cx
		mov	al, [bp+var_5]
		pop	di
		pop	si
		leave
		retf
sub_361C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3621D		proc far
		push	bp
		mov	bp, sp
		push	6C30h
		push	cs
		call	near ptr FontStyle_Construct_35E89
		pop	cx
		pop	bp
		retf
sub_3621D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3622A		proc far
		push	bp
		mov	bp, sp
		push	6C30h
sub_3622A		endp
seg119		ends
