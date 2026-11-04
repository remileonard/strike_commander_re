seg103		segment	para public 'CODE' use16
		assume cs:seg103
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 0FDh, 0FEh

loc_32EA3:
		db 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

sub_32EA8		proc near
		mov	bx, word_48B50
		add	bx, 4
		and	bx, 0FFFEh
		mov	di, 0FFF6h
		sub	di, word_48BA4
		and	di, 0FFFEh
		mov	cx, di
		sub	cx, bx
		mov	[bx], cx
		mov	word ptr [bx+2], 0
		mov	word ptr [di], 1
		mov	word ptr [di+4], 1209h
		mov	[di+2], bx
		mov	word_4D292, bx
		mov	word_4D294, di
		cmp	word_4D290, 0
		jnz	short loc_32EEE
		mov	word_4D290, bx
		mov	[bx+4], bx
		mov	[bx+6], bx
		jmp	short loc_32F20

loc_32EEE:
		mov	di, word_4D290
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_32F00
		mov	word_4D290, bx
		jmp	short loc_32F0B

loc_32F00:
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_32F0B
		cmp	cx, [di]
		ja	short loc_32F00

loc_32F0B:
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6], ax
		mov	[bx+4], di
		mov	[di+6], bx
		mov	di, [bx+6]
		mov	[di+4], bx

loc_32F20:
		mov	ax, 1
		mov	byte_4D296, al
		ret
sub_32EA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32F27		proc near

arg_0		= word ptr  4

		enter	0, 0
		mov	dx, word_4D290
		mov	bx, [bp+arg_0]
		mov	cx, [bx]
		mov	di, [bx+6]
		cmp	di, [bx+4]
		jnz	short loc_32F52
		cmp	di, bx
		jz	loc_32FCD
		mov	word_4D290, bx
		cmp	cx, [di]
		jbe	loc_32FCD
		mov	word_4D290, di
		jmp	short loc_32FCD

loc_32F52:
		cmp	cx, [di]
		jbe	short loc_32F5A
		cmp	di, dx
		jnz	short loc_32F65

loc_32F5A:
		mov	di, [bx+4]
		cmp	cx, [di]
		jnb	short loc_32FCD
		cmp	bx, dx
		jz	short loc_32FCD

loc_32F65:
		push	di
		push	bx
		cmp	[bx+6], bx
		jnz	short loc_32F74
		mov	word_4D290, 0
		jmp	short loc_32F8E

loc_32F74:
		mov	dx, word_4D290
		cmp	bx, dx
		jnz	short loc_32F82
		mov	ax, [bx+6]
		mov	word_4D290, ax

loc_32F82:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_32F8E:
		pop	bx
		pop	di
		mov	dx, word_4D290
		cmp	[bx+4], di
		jz	short loc_32FA8

loc_32F99:
		mov	si, di
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_32FB7
		cmp	[di], cx
		jnb	short loc_32FB7
		jmp	short loc_32F99

loc_32FA8:
		mov	si, di
		mov	di, [di+4]
		cmp	si, dx
		jz	short loc_32FB5
		cmp	[di], cx
		ja	short loc_32FA8

loc_32FB5:
		xchg	di, si

loc_32FB7:
		mov	[bx+4], si
		mov	[bx+6], di
		mov	[si+6], bx
		mov	[di+4], bx
		mov	di, dx
		cmp	cx, [di]
		jnb	short loc_32FCD
		mov	word_4D290, bx

loc_32FCD:
		leave
		ret
sub_32F27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32FCF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		enter	2, 0
		push	si
		push	di
		cmp	byte_4D296, 0
		jnz	short loc_32FDF
		call	sub_32EA8

loc_32FDF:
		pushf

loc_32FE0:
		cmp	byte_4D299, 0
		jnz	short loc_32FE0
		cli
		cmp	byte_4D299, 0
		jz	short loc_32FF2
		popf
		jmp	short loc_32FDF

loc_32FF2:
		mov	byte_4D299, 1
		popf
		cmp	byte_4D297, 0
		jnz	loc_330D9
		cmp	byte_4D3DA, 0
		jnz	short loc_3302D
		cmp	byte_4D298, 0
		jz	short loc_3302D
		cmp	sp, word_4D294
		jnb	short loc_3302D
		inc	byte_4D297
		mov	ax, 1308h
		mov	byte_4D299, 0
		push	ax
		call	sub_13451
		add	sp, 2
		jmp	loc_330D9

loc_3302D:
		mov	ax, [bp+arg_0]
		or	ax, ax
		jz	loc_330BA
		add	ax, 5
		and	al, 0FEh
		cmp	ax, 8
		jnb	short loc_33043
		mov	ax, 8

loc_33043:
		cmp	ax, [bp+arg_0]
		jb	short loc_330C4
		mov	bx, word_4D290
		or	bx, bx
		jz	short loc_330BF
		mov	dx, bx

loc_33052:
		mov	cx, [bx]
		sub	cx, ax
		jnb	short loc_33064
		mov	bx, [bx+6]
		cmp	dx, bx
		jnz	short loc_33052
		mov	ax, 1303h
		jmp	short loc_330C7

loc_33064:
		mov	[bp+var_2], bx
		cmp	cx, 0Ah
		jnb	short loc_3309B
		or	word ptr [bx], 1
		cmp	[bx+6], bx
		jnz	short loc_3307C
		mov	word_4D290, 0
		jmp	short loc_33096

loc_3307C:
		mov	dx, word_4D290
		cmp	bx, dx
		jnz	short loc_3308A
		mov	ax, [bx+6]
		mov	word_4D290, ax

loc_3308A:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_33096:
		mov	ax, [bp+var_2]
		jmp	short loc_330DC

loc_3309B:
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
		call	sub_32F27
		pop	bx
		pop	di
		mov	ax, di
		jmp	short loc_330DC

loc_330BA:
		mov	ax, 1304h
		jmp	short loc_330C7

loc_330BF:
		mov	ax, 1306h
		jmp	short loc_330C7

loc_330C4:
		mov	ax, 1305h

loc_330C7:
		inc	byte_4D297
		mov	byte_4D299, 0
		push	ax
		call	sub_13451
		add	sp, 2

loc_330D9:
		mov	ax, 0FFFCh

loc_330DC:
		add	ax, 4
		mov	byte_4D299, 0
		pop	di
		pop	si
		leave
		retf
sub_32FCF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_330E8		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		push	di

loc_330EE:
		pushf

loc_330EF:
		cmp	byte_4D299, 0
		jnz	short loc_330EF
		cli
		cmp	byte_4D299, 0
		jz	short loc_33101
		popf
		jmp	short loc_330EE

loc_33101:
		mov	byte_4D299, 1
		popf
		cmp	[bp+arg_0], 0
		jz	loc_33199
		cmp	byte_4D297, 0
		jnz	loc_33199
		sub	[bp+arg_0], 4
		push	[bp+arg_0]
		call	sub_331A2
		add	sp, 2
		or	ax, ax
		jz	short loc_33199
		mov	bx, [bp+arg_0]
		mov	di, [bx+2]
		or	di, di
		jz	short loc_3314E
		test	word ptr [di], 1
		jnz	short loc_3314E
		mov	ax, [bx]
		and	ax, 0FFFEh
		add	[di], ax
		mov	bx, di
		add	bx, [di]
		mov	[bx+2], di
		push	di
		call	sub_32F27
		pop	di
		jmp	short loc_33199

loc_3314E:
		mov	bx, [bp+arg_0]
		and	word ptr [bx], 0FFFEh
		cmp	word_4D290, 0
		jnz	short loc_33167
		mov	word_4D290, bx
		mov	[bx+4], bx
		mov	[bx+6], bx
		jmp	short loc_33199

loc_33167:
		mov	di, word_4D290
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_33179
		mov	word_4D290, bx
		jmp	short loc_33184

loc_33179:
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_33184
		cmp	cx, [di]
		ja	short loc_33179

loc_33184:
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6], ax
		mov	[bx+4], di
		mov	[di+6], bx
		mov	di, [bx+6]
		mov	[di+4], bx

loc_33199:
		mov	byte_4D299, 0
		pop	di
		pop	si
		leave
		retf
sub_330E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_331A2		proc near

arg_0		= word ptr  4

		enter	0, 0
		mov	di, [bp+arg_0]
		mov	bx, [di]
		test	bx, 1
		jz	short loc_331EF
		cmp	[bx+di+1], di
		jnz	short loc_331EF
		mov	si, [di+2]
		or	si, si
		jz	short loc_331C6
		add	si, [si]
		and	si, 0FFFEh
		cmp	si, di
		jnz	short loc_331EF

loc_331C6:
		cmp	byte_4D3DA, 0
		jnz	short loc_33214
		cmp	byte_4D298, 0
		jz	short loc_33214
		cmp	sp, word_4D294
		jnb	short loc_33214
		mov	byte_4D299, 0
		mov	ax, 1308h
		push	ax
		call	sub_13451
		add	sp, 2
		xor	ax, ax
		jmp	short loc_3325D

loc_331EF:
		xor	ax, ax
		push	ax
		push	ax
		call	sub_32D80
		add	sp, 4
		inc	byte_4D297
		mov	byte_4D299, 0
		mov	ax, 1309h
		push	ax
		call	sub_13451
		add	sp, 2
		xor	ax, ax
		jmp	short loc_3325D

loc_33214:
		and	bx, 0FFFEh
		mov	si, bx
		add	si, di
		mov	cx, [si]
		test	cx, 1
		jnz	short loc_3325A
		add	bx, cx
		mov	[di], bx
		or	word ptr [di], 1
		mov	ax, di
		add	bx, ax
		mov	[bx+2], di
		mov	bx, si
		cmp	[bx+6], bx
		jnz	short loc_33240
		mov	word_4D290, 0
		jmp	short loc_3325A

loc_33240:
		mov	dx, word_4D290
		cmp	bx, dx
		jnz	short loc_3324E
		mov	ax, [bx+6]
		mov	word_4D290, ax

loc_3324E:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_3325A:
		mov	ax, 1

loc_3325D:
		leave
		ret
sub_331A2		endp

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
DisplayCache_ComputeChecksum_3325F		proc far
		push	di
		cmp	byte_4D297, 0
		jnz	short loc_33285
		xor	ax, ax
		mov	di, 3E8h
		mov	cx, 4
		mov	bx, word_4D290
		mov	dx, bx

loc_33275:
		mov	bx, [bx+6]
		add	ax, [bx]
		sub	ax, cx
		dec	di
		jz	short loc_33285
		cmp	bx, dx
		jnz	short loc_33275
		jmp	short loc_33287

loc_33285:
		xor	ax, ax

loc_33287:
		pop	di
		retf
DisplayCache_ComputeChecksum_3325F		endp

; ----------------------------------------------------------------------

sub_33289		proc far
		push	di
		xor	ax, ax
		cmp	byte_4D297, 0
		jnz	short loc_332A0
		mov	bx, word_4D290
		or	bx, bx
		jz	short loc_332A0
		mov	bx, [bx+4]
		mov	ax, [bx]
sub_33289		endp
seg103		ends
