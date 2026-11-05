seg105		segment	para public 'CODE' use16
		assume cs:seg105
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 0FDh, 0FEh

loc_44E13:
		db 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

sub_44E18		proc near
		mov	bx, word_59E49
		add	bx, 4
		and	bx, 0FFFEh
		mov	di, 0FFF6h
		sub	di, word_5A3B8
		and	di, 0FFFEh
		mov	cx, di
		sub	cx, bx
		mov	[bx], cx
		mov	word ptr [bx+2], 0
		mov	word ptr [di], 1
		mov	word ptr [di+4], 1209h
		mov	[di+2], bx
		mov	word_5DC68, bx
		mov	word_5DC6A, di
		cmp	word_5DC66, 0
		jnz	short loc_44E5E
		mov	word_5DC66, bx
		mov	[bx+4], bx
		mov	[bx+6], bx
		jmp	short loc_44E90

loc_44E5E:
		mov	di, word_5DC66
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_44E70
		mov	word_5DC66, bx
		jmp	short loc_44E7B

loc_44E70:
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_44E7B
		cmp	cx, [di]
		ja	short loc_44E70

loc_44E7B:
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6], ax
		mov	[bx+4], di
		mov	[di+6], bx
		mov	di, [bx+6]
		mov	[di+4], bx

loc_44E90:
		mov	ax, 1
		mov	byte_5DC6C, al
		ret
sub_44E18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E97		proc near

arg_0		= word ptr  4

		enter	0, 0
		mov	dx, word_5DC66
		mov	bx, [bp+arg_0]
		mov	cx, [bx]
		mov	di, [bx+6]
		cmp	di, [bx+4]
		jnz	short loc_44EC2
		cmp	di, bx
		jz	loc_44F3D
		mov	word_5DC66, bx
		cmp	cx, [di]
		jbe	loc_44F3D
		mov	word_5DC66, di
		jmp	short loc_44F3D

loc_44EC2:
		cmp	cx, [di]
		jbe	short loc_44ECA
		cmp	di, dx
		jnz	short loc_44ED5

loc_44ECA:
		mov	di, [bx+4]
		cmp	cx, [di]
		jnb	short loc_44F3D
		cmp	bx, dx
		jz	short loc_44F3D

loc_44ED5:
		push	di
		push	bx
		cmp	[bx+6], bx
		jnz	short loc_44EE4
		mov	word_5DC66, 0
		jmp	short loc_44EFE

loc_44EE4:
		mov	dx, word_5DC66
		cmp	bx, dx
		jnz	short loc_44EF2
		mov	ax, [bx+6]
		mov	word_5DC66, ax

loc_44EF2:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_44EFE:
		pop	bx
		pop	di
		mov	dx, word_5DC66
		cmp	[bx+4], di
		jz	short loc_44F18

loc_44F09:
		mov	si, di
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_44F27
		cmp	[di], cx
		jnb	short loc_44F27
		jmp	short loc_44F09

loc_44F18:
		mov	si, di
		mov	di, [di+4]
		cmp	si, dx
		jz	short loc_44F25
		cmp	[di], cx
		ja	short loc_44F18

loc_44F25:
		xchg	di, si

loc_44F27:
		mov	[bx+4], si
		mov	[bx+6], di
		mov	[si+6], bx
		mov	[di+4], bx
		mov	di, dx
		cmp	cx, [di]
		jnb	short loc_44F3D
		mov	word_5DC66, bx

loc_44F3D:
		leave
		ret
sub_44E97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44F3F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		enter	2, 0
		push	si
		push	di
		cmp	byte_5DC6C, 0
		jnz	short loc_44F4F
		call	sub_44E18

loc_44F4F:
		pushf

loc_44F50:
		cmp	byte_5DC6F, 0
		jnz	short loc_44F50
		cli
		cmp	byte_5DC6F, 0
		jz	short loc_44F62
		popf
		jmp	short loc_44F4F

loc_44F62:
		mov	byte_5DC6F, 1
		popf
		cmp	byte_5DC6D, 0
		jnz	loc_45049
		cmp	byte_5DDB0, 0
		jnz	short loc_44F9D
		cmp	byte_5DC6E, 0
		jz	short loc_44F9D
		cmp	sp, word_5DC6A
		jnb	short loc_44F9D
		inc	byte_5DC6D
		mov	ax, 1308h
		mov	byte_5DC6F, 0
		push	ax
		call	sub_9D47
		add	sp, 2
		jmp	loc_45049

loc_44F9D:
		mov	ax, [bp+arg_0]
		or	ax, ax
		jz	loc_4502A
		add	ax, 5
		and	al, 0FEh
		cmp	ax, 8
		jnb	short loc_44FB3
		mov	ax, 8

loc_44FB3:
		cmp	ax, [bp+arg_0]
		jb	short loc_45034
		mov	bx, word_5DC66
		or	bx, bx
		jz	short loc_4502F
		mov	dx, bx

loc_44FC2:
		mov	cx, [bx]
		sub	cx, ax
		jnb	short loc_44FD4
		mov	bx, [bx+6]
		cmp	dx, bx
		jnz	short loc_44FC2
		mov	ax, 1303h
		jmp	short loc_45037

loc_44FD4:
		mov	[bp+var_2], bx
		cmp	cx, 0Ah
		jnb	short loc_4500B
		or	word ptr [bx], 1
		cmp	[bx+6], bx
		jnz	short loc_44FEC
		mov	word_5DC66, 0
		jmp	short loc_45006

loc_44FEC:
		mov	dx, word_5DC66
		cmp	bx, dx
		jnz	short loc_44FFA
		mov	ax, [bx+6]
		mov	word_5DC66, ax

loc_44FFA:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_45006:
		mov	ax, [bp+var_2]
		jmp	short loc_4504C

loc_4500B:
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
		call	sub_44E97
		pop	bx
		pop	di
		mov	ax, di
		jmp	short loc_4504C

loc_4502A:
		mov	ax, 1304h
		jmp	short loc_45037

loc_4502F:
		mov	ax, 1306h
		jmp	short loc_45037

loc_45034:
		mov	ax, 1305h

loc_45037:
		inc	byte_5DC6D
		mov	byte_5DC6F, 0
		push	ax
		call	sub_9D47
		add	sp, 2

loc_45049:
		mov	ax, 0FFFCh

loc_4504C:
		add	ax, 4
		mov	byte_5DC6F, 0
		pop	di
		pop	si
		leave
		retf
sub_44F3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45058		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		push	di

loc_4505E:
		pushf

loc_4505F:
		cmp	byte_5DC6F, 0
		jnz	short loc_4505F
		cli
		cmp	byte_5DC6F, 0
		jz	short loc_45071
		popf
		jmp	short loc_4505E

loc_45071:
		mov	byte_5DC6F, 1
		popf
		cmp	[bp+arg_0], 0
		jz	loc_45109
		cmp	byte_5DC6D, 0
		jnz	loc_45109
		sub	[bp+arg_0], 4
		push	[bp+arg_0]
		call	sub_45112
		add	sp, 2
		or	ax, ax
		jz	short loc_45109
		mov	bx, [bp+arg_0]
		mov	di, [bx+2]
		or	di, di
		jz	short loc_450BE
		test	word ptr [di], 1
		jnz	short loc_450BE
		mov	ax, [bx]
		and	ax, 0FFFEh
		add	[di], ax
		mov	bx, di
		add	bx, [di]
		mov	[bx+2], di
		push	di
		call	sub_44E97
		pop	di
		jmp	short loc_45109

loc_450BE:
		mov	bx, [bp+arg_0]
		and	word ptr [bx], 0FFFEh
		cmp	word_5DC66, 0
		jnz	short loc_450D7
		mov	word_5DC66, bx
		mov	[bx+4], bx
		mov	[bx+6], bx
		jmp	short loc_45109

loc_450D7:
		mov	di, word_5DC66
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_450E9
		mov	word_5DC66, bx
		jmp	short loc_450F4

loc_450E9:
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_450F4
		cmp	cx, [di]
		ja	short loc_450E9

loc_450F4:
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6], ax
		mov	[bx+4], di
		mov	[di+6], bx
		mov	di, [bx+6]
		mov	[di+4], bx

loc_45109:
		mov	byte_5DC6F, 0
		pop	di
		pop	si
		leave
		retf
sub_45058		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45112		proc near

arg_0		= word ptr  4

		enter	0, 0
		mov	di, [bp+arg_0]
		mov	bx, [di]
		test	bx, 1
		jz	short loc_4515F
		cmp	[bx+di+1], di
		jnz	short loc_4515F
		mov	si, [di+2]
		or	si, si
		jz	short loc_45136
		add	si, [si]
		and	si, 0FFFEh
		cmp	si, di
		jnz	short loc_4515F

loc_45136:
		cmp	byte_5DDB0, 0
		jnz	short loc_45184
		cmp	byte_5DC6E, 0
		jz	short loc_45184
		cmp	sp, word_5DC6A
		jnb	short loc_45184
		mov	byte_5DC6F, 0
		mov	ax, 1308h
		push	ax
		call	sub_9D47
		add	sp, 2
		xor	ax, ax
		jmp	short loc_451CD

loc_4515F:
		xor	ax, ax
		push	ax
		push	ax
		call	sub_44CF0
		add	sp, 4
		inc	byte_5DC6D
		mov	byte_5DC6F, 0
		mov	ax, 1309h
		push	ax
		call	sub_9D47
		add	sp, 2
		xor	ax, ax
		jmp	short loc_451CD

loc_45184:
		and	bx, 0FFFEh
		mov	si, bx
		add	si, di
		mov	cx, [si]
		test	cx, 1
		jnz	short loc_451CA
		add	bx, cx
		mov	[di], bx
		or	word ptr [di], 1
		mov	ax, di
		add	bx, ax
		mov	[bx+2], di
		mov	bx, si
		cmp	[bx+6], bx
		jnz	short loc_451B0
		mov	word_5DC66, 0
		jmp	short loc_451CA

loc_451B0:
		mov	dx, word_5DC66
		cmp	bx, dx
		jnz	short loc_451BE
		mov	ax, [bx+6]
		mov	word_5DC66, ax

loc_451BE:
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4], bx
		mov	[bx+6], di

loc_451CA:
		mov	ax, 1

loc_451CD:
		leave
		ret
sub_45112		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; DisplayCache_ComputeChecksum_65BFD (sub_65BFD de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à DisplayCache_ComputeChecksum_2C52D (sub_2C52D de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à DisplayCache_ComputeChecksum_5D43F
; (sub_5D43F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, parcourt une petite liste chaînée (word_70E20, max 4 nœuds) et accumule une
; somme de contrôle. Référencée par sub_3844F, HUD_RenderSymbologyMain (sub_3E744) et
; UIScreen_RenderGraphVGA (sub_509EE, seg113) — probable cache/liste de zones à rafraîchir
; pour l'affichage.
; ==============================================================================================
DisplayCache_ComputeChecksum_451CF		proc far
		push	di
		cmp	byte_5DC6D, 0
		jnz	short loc_451F5
		xor	ax, ax
		mov	di, 3E8h
		mov	cx, 4
		mov	bx, word_5DC66
		mov	dx, bx

loc_451E5:
		mov	bx, [bx+6]
		add	ax, [bx]
		sub	ax, cx
		dec	di
		jz	short loc_451F5
		cmp	bx, dx
		jnz	short loc_451E5
		jmp	short loc_451F7

loc_451F5:
		xor	ax, ax

loc_451F7:
		pop	di
		retf
DisplayCache_ComputeChecksum_451CF		endp

; ----------------------------------------------------------------------

sub_451F9		proc far
		push	di
		xor	ax, ax
		cmp	byte_5DC6D, 0
		jnz	short loc_45210
		mov	bx, word_5DC66
		or	bx, bx
		jz	short loc_45210
		mov	bx, [bx+4]
		mov	ax, [bx]
sub_451F9		endp
seg105		ends
