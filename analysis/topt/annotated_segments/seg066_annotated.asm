seg066		segment	para public 'CODE' use16
		assume cs:seg066
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 57h, 57h, 9Ah, 8Ah, 2Ch, 3Bh, 28h, 83h, 0C4h, 4, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26DCE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		shl	ax, 2
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		movzx	eax, [bp+var_2]
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+4], dx
		mov	[si+2], ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_26E11
		push	0C017h
		call	sub_13451
		add	sp, 2

loc_26E11:
		pop	si
		leave
		retf
sub_26DCE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26E14		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_26F69
		add	sp, 2
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_26E14		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26E44		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di], 12Ch
		jge	short loc_26E6D
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_26E78

loc_26E6D:
		push	0C018h
		call	sub_13451
		add	sp, 2

loc_26E78:
		pop	di
		pop	si
		pop	bp
		retf
sub_26E44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26E7C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_26EEB
		xor	cx, cx
		jmp	short loc_26EE7

loc_26E96:
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	ax, es:[bx]
		cmp	ax, [bp+arg_2]
		jnz	short loc_26EE6
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		les	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		inc	[bp+var_2]
		jmp	short loc_26EE7

loc_26EE6:
		inc	cx

loc_26EE7:
		cmp	[di], cx
		jg	short loc_26E96

loc_26EEB:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_26E7C		endp

; START OF FUNCTION CHUNK FOR sub_26E7C
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_26E7C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26EF6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_26F5B

loc_26F02:
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		cmp	ax, [bp+arg_4]
		jnz	short loc_26F5A
		cmp	dx, [bp+arg_2]
		jnz	short loc_26F5A
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		les	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		mov	ax, 1
		pop	di
		pop	si
		pop	bp
		retf

loc_26F5A:
		inc	cx

loc_26F5B:
		cmp	[di], cx
		jg	short loc_26F02
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_26EF6		endp

; START OF FUNCTION CHUNK FOR sub_26EF6
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26EF6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26F69		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_26F9A

loc_26F74:
		les	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_26F99
		les	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0

loc_26F99:
		inc	dx

loc_26F9A:
		cmp	[si], dx
		jg	short loc_26F74
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
sub_26F69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_InvalidateIfSet (sub_2237A de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à WeakRef_InvalidateIfSet (sub_3A3EC de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,23L — si le champ référencé
; est non nul, l'invalide via sub_3A343 : wrapper d'invalidation conditionnelle d'une
; référence faible.
; ==============================================================================================
WeakRef_InvalidateIfSet		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_26FC1
		push	ds
		push	si
		push	6941h
		push	cs
		call	near ptr sub_26EF6
		add	sp, 6
		mov	word ptr [si], 0

loc_26FC1:
		pop	si
		pop	bp
		retf
WeakRef_InvalidateIfSet		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26FC4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr WeakRef_InvalidateIfSet
		add	sp, 2
		mov	[si], di
		or	di, di
		jz	short loc_26FE9
		push	ds
		push	si
		push	6941h
		push	cs
		call	near ptr sub_26E44
		add	sp, 6

loc_26FE9:
		pop	di
		pop	si
		pop	bp
		retf
sub_26FC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26FED		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_27009
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	6941h
		push	cs
		call	near ptr sub_26EF6
		add	sp, 6

loc_27009:
		pop	bp
		retf
sub_26FED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2700B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_26FED
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx], si
		or	si, si
		jz	short loc_27039
		push	[bp+arg_2]
		push	[bp+arg_0]
sub_2700B		endp

; START OF FUNCTION CHUNK FOR sub_2700B
		db 68h
; END OF FUNCTION CHUNK FOR sub_2700B
seg066		ends
