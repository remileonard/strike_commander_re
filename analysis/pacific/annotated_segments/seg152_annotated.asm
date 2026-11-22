seg152		segment	para public 'CODE' use16
		assume cs:seg152
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FEh

loc_65841:
		db 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

sub_65846		proc near
		mov	bx, word_76858
		add	bx, 4
		and	bx, 0FFFEh
		mov	di, 0FFF6h
		sub	di, word_76D41
		and	di, 0FFFEh
		mov	cx, di
		sub	cx, bx
		mov	[bx], cx
		mov	word ptr [bx+2], 0
		mov	word ptr [di], 1
		mov	word ptr [di+4], 1209h
		mov	[di+2], bx
		mov	word_7AE72, bx
		mov	word_7AE74, di
		cmp	word_7AE70, 0
		jnz	short loc_6588C
		mov	word_7AE70, bx
		mov	[bx+4], bx
		mov	[bx+6], bx
		jmp	short loc_658BE

loc_6588C:
		mov	di, word_7AE70
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_6589E
		mov	word_7AE70, bx
		jmp	short loc_658A9

loc_6589E:
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_658A9
		cmp	cx, [di]
		ja	short loc_6589E

loc_658A9:
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6], ax
		mov	[bx+4], di
		mov	[di+6], bx
		mov	di, [bx+6]
		mov	[di+4], bx

loc_658BE:
		mov	ax, 1
		mov	byte_7AE76, al
		ret
sub_65846		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_658C5		proc near

arg_0		= word ptr  4

		enter	0, 0
		mov	dx, word_7AE70
		mov	bx, [bp+arg_0]
		mov	cx, [bx]
		mov	di, [bx+6]
		cmp	di, [bx+4]
		jnz	short loc_658F0
		cmp	di, bx
		jz	loc_6596B
		mov	word_7AE70, bx
		cmp	cx, [di]
		jbe	loc_6596B
		mov	word_7AE70, di
		jmp	short loc_6596B

loc_658F0:
		cmp	cx, [di]
		jbe	short loc_658F8
		cmp	di, dx
		jnz	short loc_65903

loc_658F8:
		mov	di, [bx+4]
		cmp	cx, [di]
		jnb	short loc_6596B
		cmp	bx, dx
		jz	short loc_6596B

loc_65903:
		push	di
		push	bx
		cmp	[bx+6], bx
		jnz	short loc_65912
		mov	word_7AE70, 0
		jmp	short loc_6592C

loc_65912:
		mov	dx, word_7AE70
		cmp	bx, dx
		jnz	short loc_65920
		mov	ax, [bx+6]
		mov	word_7AE70, ax

loc_65920:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_6592C:
		pop	bx
		pop	di
		mov	dx, word_7AE70
		cmp	[bx+4], di
		jz	short loc_65946

loc_65937:
		mov	si, di
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_65955
		cmp	[di], cx
		jnb	short loc_65955
		jmp	short loc_65937

loc_65946:
		mov	si, di
		mov	di, [di+4]
		cmp	si, dx
		jz	short loc_65953
		cmp	[di], cx
		ja	short loc_65946

loc_65953:
		xchg	di, si

loc_65955:
		mov	[bx+4], si
		mov	[bx+6], di
		mov	[si+6], bx
		mov	[di+4], bx
		mov	di, dx
		cmp	cx, [di]
		jnb	short loc_6596B
		mov	word_7AE70, bx

loc_6596B:
		leave
		ret
sub_658C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6596D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		enter	2, 0
		push	si
		push	di
		cmp	byte_7AE76, 0
		jnz	short loc_6597D
		call	sub_65846

loc_6597D:
		pushf

loc_6597E:
		cmp	byte_7AE79, 0
		jnz	short loc_6597E
		cli
		cmp	byte_7AE79, 0
		jz	short loc_65990
		popf
		jmp	short loc_6597D

loc_65990:
		mov	byte_7AE79, 1
		popf
		cmp	byte_7AE77, 0
		jnz	loc_65A77
		cmp	byte_7AFE8, 0
		jnz	short loc_659CB
		cmp	byte_7AE78, 0
		jz	short loc_659CB
		cmp	sp, word_7AE74
		jnb	short loc_659CB
		inc	byte_7AE77
		mov	ax, 1308h
		mov	byte_7AE79, 0
		push	ax
		call	sub_1DDFE
		add	sp, 2
		jmp	loc_65A77

loc_659CB:
		mov	ax, [bp+arg_0]
		or	ax, ax
		jz	loc_65A58
		add	ax, 5
		and	al, 0FEh
		cmp	ax, 8
		jnb	short loc_659E1
		mov	ax, 8

loc_659E1:
		cmp	ax, [bp+arg_0]
		jb	short loc_65A62
		mov	bx, word_7AE70
		or	bx, bx
		jz	short loc_65A5D
		mov	dx, bx

loc_659F0:
		mov	cx, [bx]
		sub	cx, ax
		jnb	short loc_65A02
		mov	bx, [bx+6]
		cmp	dx, bx
		jnz	short loc_659F0
		mov	ax, 1303h
		jmp	short loc_65A65

loc_65A02:
		mov	[bp+var_2], bx
		cmp	cx, 0Ah
		jnb	short loc_65A39
		or	word ptr [bx], 1
		cmp	[bx+6], bx
		jnz	short loc_65A1A
		mov	word_7AE70, 0
		jmp	short loc_65A34

loc_65A1A:
		mov	dx, word_7AE70
		cmp	bx, dx
		jnz	short loc_65A28
		mov	ax, [bx+6]
		mov	word_7AE70, ax

loc_65A28:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_65A34:
		mov	ax, [bp+var_2]
		jmp	short loc_65A7A

loc_65A39:
		mov	di, bx
		add	di, [bx]
		add	[di+2], cx
		mov	[bx], cx
		mov	di, bx
		add	di, cx
		or	al, 1
		mov	[di], ax
		mov	[di+2], bx
		push	di
		push	bx
		call	sub_658C5
		pop	bx
		pop	di
		mov	ax, di
		jmp	short loc_65A7A

loc_65A58:
		mov	ax, 1304h
		jmp	short loc_65A65

loc_65A5D:
		mov	ax, 1306h
		jmp	short loc_65A65

loc_65A62:
		mov	ax, 1305h

loc_65A65:
		inc	byte_7AE77
		mov	byte_7AE79, 0
		push	ax
		call	sub_1DDFE
		add	sp, 2

loc_65A77:
		mov	ax, 0FFFCh

loc_65A7A:
		add	ax, 4
		mov	byte_7AE79, 0
		pop	di
		pop	si
		leave
		retf
sub_6596D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65A86		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		push	di

loc_65A8C:
		pushf

loc_65A8D:
		cmp	byte_7AE79, 0
		jnz	short loc_65A8D
		cli
		cmp	byte_7AE79, 0
		jz	short loc_65A9F
		popf
		jmp	short loc_65A8C

loc_65A9F:
		mov	byte_7AE79, 1
		popf
		cmp	[bp+arg_0], 0
		jz	loc_65B37
		cmp	byte_7AE77, 0
		jnz	loc_65B37
		sub	[bp+arg_0], 4
		push	[bp+arg_0]
		call	sub_65B40
		add	sp, 2
		or	ax, ax
		jz	short loc_65B37
		mov	bx, [bp+arg_0]
		mov	di, [bx+2]
		or	di, di
		jz	short loc_65AEC
		test	word ptr [di], 1
		jnz	short loc_65AEC
		mov	ax, [bx]
		and	ax, 0FFFEh
		add	[di], ax
		mov	bx, di
		add	bx, [di]
		mov	[bx+2], di
		push	di
		call	sub_658C5
		pop	di
		jmp	short loc_65B37

loc_65AEC:
		mov	bx, [bp+arg_0]
		and	word ptr [bx], 0FFFEh
		cmp	word_7AE70, 0
		jnz	short loc_65B05
		mov	word_7AE70, bx
		mov	[bx+4], bx
		mov	[bx+6], bx
		jmp	short loc_65B37

loc_65B05:
		mov	di, word_7AE70
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_65B17
		mov	word_7AE70, bx
		jmp	short loc_65B22

loc_65B17:
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_65B22
		cmp	cx, [di]
		ja	short loc_65B17

loc_65B22:
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6], ax
		mov	[bx+4], di
		mov	[di+6], bx
		mov	di, [bx+6]
		mov	[di+4], bx

loc_65B37:
		mov	byte_7AE79, 0
		pop	di
		pop	si
		leave
		retf
sub_65A86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65B40		proc near

arg_0		= word ptr  4

		enter	0, 0
		mov	di, [bp+arg_0]
		mov	bx, [di]
		test	bx, 1
		jz	short loc_65B8D
		cmp	[bx+di+1], di
		jnz	short loc_65B8D
		mov	si, [di+2]
		or	si, si
		jz	short loc_65B64
		add	si, [si]
		and	si, 0FFFEh
		cmp	si, di
		jnz	short loc_65B8D

loc_65B64:
		cmp	byte_7AFE8, 0
		jnz	short loc_65BB2
		cmp	byte_7AE78, 0
		jz	short loc_65BB2
		cmp	sp, word_7AE74
		jnb	short loc_65BB2
		mov	byte_7AE79, 0
		mov	ax, 1308h
		push	ax
		call	sub_1DDFE
		add	sp, 2
		xor	ax, ax
		jmp	short loc_65BFB

loc_65B8D:
		xor	ax, ax
		push	ax
		push	ax
		call	sub_6571E
		add	sp, 4
		inc	byte_7AE77
		mov	byte_7AE79, 0
		mov	ax, 1309h
		push	ax
		call	sub_1DDFE
		add	sp, 2
		xor	ax, ax
		jmp	short loc_65BFB

loc_65BB2:
		and	bx, 0FFFEh
		mov	si, bx
		add	si, di
		mov	cx, [si]
		test	cx, 1
		jnz	short loc_65BF8
		add	bx, cx
		mov	[di], bx
		or	word ptr [di], 1
		mov	ax, di
		add	bx, ax
		mov	[bx+2], di
		mov	bx, si
		cmp	[bx+6], bx
		jnz	short loc_65BDE
		mov	word_7AE70, 0
		jmp	short loc_65BF8

loc_65BDE:
		mov	dx, word_7AE70
		cmp	bx, dx
		jnz	short loc_65BEC
		mov	ax, [bx+6]
		mov	word_7AE70, ax

loc_65BEC:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_65BF8:
		mov	ax, 1

loc_65BFB:
		leave
		ret
sub_65B40		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplayCache_ComputeChecksum_2C52D (sub_2C52D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à DisplayCache_ComputeChecksum_5D43F (sub_5D43F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, parcourt une petite
; liste chaînée (word_70E20, max 4 nœuds) et accumule une somme de contrôle. Référencée par
; sub_3844F, HUD_RenderSymbologyMain (sub_3E744) et UIScreen_RenderGraphVGA (sub_509EE,
; seg113) — probable cache/liste de zones à rafraîchir pour l'affichage.
; ==============================================================================================
DisplayCache_ComputeChecksum_65BFD		proc far
		push	di
		cmp	byte_7AE77, 0
		jnz	short loc_65C23
		xor	ax, ax
		mov	di, 3E8h
		mov	cx, 4
		mov	bx, word_7AE70
		mov	dx, bx

loc_65C13:
		mov	bx, [bx+6]
		add	ax, [bx]
		sub	ax, cx
		dec	di
		jz	short loc_65C23
		cmp	bx, dx
		jnz	short loc_65C13
		jmp	short loc_65C25

loc_65C23:
		xor	ax, ax

loc_65C25:
		pop	di
		retf
DisplayCache_ComputeChecksum_65BFD		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplayCache_GetHeadValue_2C557 (sub_2C557 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à DisplayCache_GetHeadValue_5D469 (sub_5D469 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lit la valeur en tête de la
; même liste chaînée (word_70E20) que DisplayCache_ComputeChecksum_5D43F. Référencée par
; PagedResourceC_Method_GetValue_5CD0C (seg134) et sub_5E89E.
; ==============================================================================================
DisplayCache_GetHeadValue_65C27		proc far
		push	di
		xor	ax, ax
		cmp	byte_7AE77, 0
		jnz	short loc_65C3E
		mov	bx, word_7AE70
		or	bx, bx
		jz	short loc_65C3E
		mov	bx, [bx+4]
		mov	ax, [bx]

loc_65C3E:
		pop	di
		retf
DisplayCache_GetHeadValue_65C27		endp
seg152		ends
