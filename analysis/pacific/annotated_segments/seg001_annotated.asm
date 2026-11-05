seg001		segment	para public 'CODE' use16
		assume cs:seg001
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh, 9, 72h, 73h, 76h, 50h, 41h, 54h, 48h, 3Dh, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B4C		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	ds
		mov	ds, cs:1
		push	si
		push	di
		cld
		cmp	word ptr dword_767D0, 0
		jnz	short loc_3B65
		jmp	loc_3C71

loc_3B65:
		call	sub_3CFD
		jnb	short loc_3B96
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_3B7C
		mov	[bp+arg_0], 0D80h
		mov	[bp+arg_2], seg seg234

loc_3B7C:
		call	sub_3CF1
		jnb	short loc_3B96
		call	sub_3D42
		jnb	short loc_3B96
		mov	ax, 0FFFEh
		jmp	loc_3C73

loc_3B8C:
		mov	ah, 3Eh
		int	21h
		mov	ax, 0FFFFh
		jmp	loc_3C73

loc_3B96:
		mov	bx, ax
		mov	word_767E8, bx
		mov	cx, 14h
		call	sub_3DC7
		mov	cx, 0FFFDh
		jb	short loc_3B8C
		xor	ax, ax
		xor	dx, dx
		cmp	[bp+var_14], 5A4Dh
		jz	short loc_3BB7
		mov	cx, 0FFFCh
		jmp	short loc_3B8C

loc_3BB7:
		mov	ax, [bp+var_10]
		mov	cx, [bp+var_12]
		jcxz	short loc_3BC0
		dec	ax

loc_3BC0:
		mov	dx, 200h
		mul	dx
		add	ax, cx
		add	ax, 0Fh
		adc	dx, 0
		and	ax, 0FFF0h

loc_3BD0:
		push	dx
		push	ax
		mov	cx, dx
		mov	dx, ax
		mov	ax, 4200h
		int	21h
		mov	cx, 10h
		call	sub_3DC7
		pop	ax
		pop	dx
		mov	cx, 0FFFDh
		jb	short loc_3B8C
		add	ax, 10h
		adc	dx, 0
		cmp	[bp+var_14], 4246h
		mov	cx, 0FFFCh
		jz	short loc_3BFA
		jmp	short loc_3B8C

loc_3BFA:
		cmp	[bp+var_12], 564Fh
		jz	short loc_3C09
		add	ax, [bp+var_10]
		adc	dx, [bp+var_E]
		jmp	short loc_3BD0

loc_3C09:
		mov	word_767D4, ax
		mov	word_767D6, dx
		mov	es, cs:3
		mov	ax, [bp+var_10]
		mov	es:55BEh, ax
		mov	ax, [bp+var_E]
		mov	es:55C0h, ax
		mov	ah, 3Eh
		int	21h
		mov	word_767E8, 0
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_3C7C
		mov	ax, [bp+arg_6]
		inc	ax
		mov	word_767E4, ax
		mov	word_767E0, ax
		mov	bx, [bp+arg_4]
		mov	word_767E6, bx
		call	sub_3DD7
		mov	bx, word_767E6
		sub	bx, word_767E4
		cmp	bx, word_767DA
		jnb	short loc_3C5A
		mov	cx, 0FFFBh
		jmp	loc_3B8C

loc_3C5A:
		shr	bx, 1
		shr	bx, 1
		mov	word_767D8, bx
		call	sub_3E57
		jnb	short loc_3C71
		mov	bx, word_767E8
		mov	cx, 0FFFFh
		jmp	short loc_3C73
		nop

loc_3C71:
		xor	ax, ax

loc_3C73:
		pop	di
		pop	si
		pop	ds
		mov	sp, bp
		pop	bp
		retf	8
sub_3B4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_InstallIntHandler_3FBA8 (sub_3FBA8 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à VROOMM_InstallIntHandler_68384 (sub_68384 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_Helper_68384' (nom de notre base) ; renommee par la session musique (archive
; handoff 2026-10-06). far - installe le VECTEUR D'INTERRUPTION DOS propre a VROOMM (INT 21h
; fonction 25h SET INTERRUPT VECTOR, sauvegarde l'ancien via fonction 35h GET INTERRUPT
; VECTOR) - c'est le point d'ancrage qui permet au moteur d'intercepter des appels pour
; charger les overlays a la demande. Ouvre aussi (ou ferme) le fichier d'overlay lui-meme (DOS
; INT 21h AH=3Dh).
; ==============================================================================================
VROOMM_InstallIntHandler_3C7C		proc far
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:1
		mov	al, byte_767D1
		mov	ah, 35h
		int	21h
		push	es
		push	bx
		push	ds
		mov	al, byte_767D1
		mov	dx, word_76732
		mov	ds, word_76734
		mov	ah, 25h
		int	21h
		pop	ds
		pop	word_76732
		pop	word_76734
		cmp	word_767E8, 0
		jz	short loc_3CBE
		mov	bx, word_767E8
		mov	ah, 3Eh
		int	21h
		mov	word_767E8, 0
		jmp	short loc_3CCC

loc_3CBE:
		lea	dx, word_7674C
		mov	ah, 3Dh
		mov	al, byte ptr word_76736
		int	21h
		mov	word_767E8, ax

loc_3CCC:
		pop	ds
		pop	bp
		retf
VROOMM_InstallIntHandler_3C7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3CCF		proc far
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:1
		cmp	word_767E8, 0
		jz	short loc_3CE4
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_3C7C

loc_3CE4:
		push	cs
		call	word ptr word_76744
		push	cs
		call	word ptr word_76742
		pop	ds
		pop	bp
		retf
sub_3CCF		endp

; ----------------------------------------------------------------------

sub_3CF1		proc near
		push	ds
		lea	di, word_7674C
		push	ds
		pop	es
		call	sub_3D9F
		pop	ds
		ret
sub_3CF1		endp

; ----------------------------------------------------------------------

sub_3CFD		proc near
		mov	ah, 30h
		int	21h
		cmp	al, 3
		jb	short loc_3D41
		mov	byte ptr word_76736, 20h
		push	ds
		mov	ax, seg dseg
		mov	ds, ax
		mov	ds, word_76848
		xor	si, si
		cld

loc_3D17:
		lodsb
		or	al, al
		jnz	short loc_3D17
		lodsb
		or	al, al
		jnz	short loc_3D17
		lodsw
		lea	di, word_7674C
		mov	ax, seg seg232
		mov	es, ax
		mov	bx, di

loc_3D2D:
		lodsb
		stosb
		or	al, al
		jz	short loc_3D3B
		cmp	al, 5Ch
		jnz	short loc_3D2D
		mov	bx, di
		jmp	short loc_3D2D

loc_3D3B:
		mov	di, bx
		call	sub_3D9F
		pop	ds

loc_3D41:
		ret
sub_3CFD		endp

; ----------------------------------------------------------------------

sub_3D42		proc near
		push	ds
		mov	ax, seg dseg
		mov	ds, ax
		mov	ds, word_76848
		xor	si, si

loc_3D4E:
		mov	di, 5
		push	cs
		pop	es
		mov	cx, 5
		cld
		repe cmpsb
		jz	short loc_3D68
		dec	si

loc_3D5C:
		lodsb
		or	al, al
		jnz	short loc_3D5C
		cmp	al, [si]
		jnz	short loc_3D4E

loc_3D65:
		pop	ds
		stc
		ret

loc_3D68:
		cmp	byte ptr [si], 0
		jz	short loc_3D65
		lea	di, word_7674C
		mov	ax, seg seg232
		mov	es, ax
		xor	al, al

loc_3D78:
		mov	ah, al
		lodsb
		or	al, al
		jz	short loc_3D86
		cmp	al, 3Bh
		jz	short loc_3D87
		stosb
		jmp	short loc_3D78

loc_3D86:
		dec	si

loc_3D87:
		cmp	ah, 3Ah
		jz	short loc_3D94
		cmp	ah, 5Ch
		jz	short loc_3D94
		mov	al, 5Ch
		stosb

loc_3D94:
		push	ds
		push	si
		call	sub_3D9F
		pop	si
		pop	ds
		jb	short loc_3D68
		pop	ds
		ret
sub_3D42		endp

; ----------------------------------------------------------------------

sub_3D9F		proc near
		lds	si, [bp+6]
		mov	ax, ds
		or	ax, si
		jz	short loc_3DB6
		mov	cx, 0Ch

loc_3DAB:
		lodsb
		stosb
		or	al, al
		jz	short loc_3DB6
		loop	short loc_3DAB
		sub	al, al
		stosb

loc_3DB6:
		lea	dx, word_7674C
		mov	ax, seg seg232
		mov	ds, ax
		mov	ah, 3Dh
		mov	al, byte ptr word_76736
		int	21h
		ret
sub_3D9F		endp

; ----------------------------------------------------------------------

sub_3DC7		proc near
		push	ds
		lea	dx, [bp-14h]
		push	ss
		pop	ds
		mov	ah, 3Fh
		int	21h
		pop	ds
		jb	short loc_3DD6
		cmp	ax, cx

loc_3DD6:
		ret
sub_3DC7		endp

; ----------------------------------------------------------------------

sub_3DD7		proc near
		mov	ax, seg dseg
		mov	es, ax
		mov	ax, es:11Ch
		add	ax, 10h
		mov	cs:0Ah, ax
		mov	ax, seg seg233
		mov	es, ax
		xor	bx, bx
		xor	di, di
		lea	si, word_767F0

loc_3DF4:
		test	word ptr [si+4], 2
		jz	short loc_3E01
		cmp	word ptr [si+2], 0
		jnz	short loc_3E04

loc_3E01:
		jmp	short loc_3E42
		nop

loc_3E04:
		mov	ax, [si]
		push	es
		mov	es:12h, ax
		mov	es, ax
		cmp	byte ptr es:1Ah, 0FFh
		jnz	short loc_3E20
		pop	es
		mov	word ptr es:12h, 0
		jmp	short loc_3E42
		nop

loc_3E20:
		pop	ax
		mov	word ptr es:18h, 4C2h
		mov	ax, word_767D4
		mov	dx, word_767D6
		add	es:4, ax
		adc	es:6, dx
		call	near ptr sub_42E9
		cmp	bx, dx
		jnb	short loc_3E42
		xchg	dx, bx

loc_3E42:
		add	si, 8
		cmp	si, 0E40h
		jnb	short loc_3E4D
		jmp	short loc_3DF4

loc_3E4D:
		xor	ax, ax
		add	bx, 2
		mov	word_767DA, bx
		ret
sub_3DD7		endp

; ----------------------------------------------------------------------

sub_3E57		proc near
		mov	cx, word_767E2
		mov	word_767EC, cx
		mov	bx, cx
		mov	si, word_767E4
		mov	di, word_767E6
		push	ds

loc_3E6A:
		mov	ds, cx
		mov	cx, word_76742
		jcxz	short loc_3EA0
		mov	es, cx
		mov	ax, es:4
		mov	dx, es:6
		sub	ax, word_76734
		sbb	dx, word_76736
		mov	cx, 10h
		div	cx
		add	ax, si
		cmp	ax, di
		ja	short loc_3EA0
		mov	word_76740, si
		mov	si, ax
		mov	cx, es
		mov	word_7674C, cx
		mov	bx, ds
		jmp	short loc_3E6A

loc_3EA0:
		mov	ds, bx
		mov	word_7674C, 0
		pop	ds
		mov	word_767E0, si
		mov	ax, word_767E4
		sub	si, ax
		jnz	short loc_3EB7
		jmp	short loc_3F15
		nop

loc_3EB7:
		mov	cl, 4
		rol	si, cl
		mov	di, si
		and	di, 0Fh
		and	si, 0FFF0h
		mov	es, word_767EC
		mov	dx, es:4
		mov	cx, es:6
		call	sub_3F24
		jb	short loc_3F16
		mov	ax, word_767EC
		push	ds

loc_3EDA:
		mov	es, ax
		mov	cx, es:0Ah
		jcxz	short loc_3EE6
		call	sub_3F5D

loc_3EE6:
		cmp	word ptr es:0Ch, 0
		jz	short loc_3EF1
		call	sub_41CF

loc_3EF1:
		mov	ax, es:10h
		dec	ax
		mov	ds, ax
		mov	word_7673E, es
		push	es
		mov	ax, 0FFFFh
		mov	bx, ax
		mov	ds, cs:1
		call	dword ptr dword_76746
		pop	es
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_3EDA
		pop	ds

loc_3F15:
		clc

loc_3F16:
		ret
sub_3E57		endp

; START OF FUNCTION CHUNK FOR sub_3E57
		mov	cl, 4
		shr	ax, cl
		ror	dx, cl
		and	dx, 0F000h
		or	ax, dx
		ret
; END OF FUNCTION CHUNK FOR sub_3E57

; ----------------------------------------------------------------------

sub_3F24		proc near
		push	ax
		mov	bx, word_767E8
		mov	ax, 4200h
		int	21h
		pop	ax
		push	ds
		mov	ds, ax
		jmp	short loc_3F3B

loc_3F34:
		mov	ax, ds
		add	ax, 0FFFh
		mov	ds, ax

loc_3F3B:
		mov	cx, 0FFF0h
		or	di, di
		jnz	short loc_3F44
		mov	cx, si

loc_3F44:
		xor	dx, dx
		mov	ah, 3Fh
		int	21h
		jb	short loc_3F5B
		cmp	ax, cx
		jb	short loc_3F5B
		sub	si, ax
		sbb	di, 0
		mov	ax, si
		or	ax, di
		jnz	short loc_3F34

loc_3F5B:
		pop	ds
		ret
sub_3F24		endp

; ----------------------------------------------------------------------

sub_3F5D		proc near
		push	ds
		push	es
		mov	ax, es:8
		mov	si, ax
		and	si, 0Fh
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		mov	dx, es:10h
		add	ax, dx
		mov	ds, ax
		mov	es, dx
		shr	cx, 1
		cld

loc_3F7E:
		lodsw
		mov	bx, ax
		mov	di, es:[bx]
		push	ds
		mov	ax, seg seg234
		mov	ds, ax
		mov	ax, di
		and	di, 0FFF8h
		mov	dx, [di]
		mov	es:[bx], dx
		test	ax, 1
		jz	short loc_3F9C
		call	sub_3FA2

loc_3F9C:
		pop	ds
		loop	short loc_3F7E
		pop	es
		pop	ds
		ret
sub_3F5D		endp

; ----------------------------------------------------------------------

sub_3FA2		proc near
		push	cx
		mov	ds, dx
		mov	ah, es:[bx-1]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 0B8h
		jnz	short loc_3FFE
		mov	cx, ax
		mov	ah, es:[bx+2]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 50h
		jnz	short loc_3FFE
		cmp	al, cl
		jnz	short loc_3FFE
		mov	dx, ax
		mov	ah, es:[bx+3]
		mov	al, ah
		and	ax, 0F807h
		cmp	cx, ax
		jnz	short loc_3FFE
		mov	ah, es:[bx+6]
		mov	al, ah
		and	ax, 0F807h
		cmp	ax, dx
		jnz	short loc_3FFE
		mov	di, 20h
		mov	cx, word_7673C
		mov	ax, es:[bx+4]

loc_3FEE:
		cmp	ax, [di+2]
		jz	short loc_3FFA
		add	di, 5
		loop	short loc_3FEE
		jmp	short loc_4000

loc_3FFA:
		mov	es:[bx+4], di

loc_3FFE:
		pop	cx
		ret

loc_4000:
		pop	cx
		ret
sub_3FA2		endp

; START OF FUNCTION CHUNK FOR sub_3FA2
		mov	si, es:8
		xor	di, di
		add	si, es:0Ah
		adc	di, 0
		mov	dx, es:4
		mov	cx, es:6
		mov	ax, es:10h
		call	sub_3F24
		jb	short loc_402F
		mov	cx, es:0Ah
		jcxz	short loc_402E
		call	sub_3F5D

loc_402E:
		clc

loc_402F:
		ret
; END OF FUNCTION CHUNK FOR sub_3FA2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4030		proc far

var_6		= word ptr -6
saved_0		= word ptr  0
saved_2		= word ptr  2

		push	bp
		mov	bp, sp
		test	bp, 1
		jz	short loc_403E
		jmp	sub_359

loc_403E:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	ds
		push	es
		mov	ax, seg seg232
		mov	ds, ax
		sti
		les	bx, [bp+saved_2]
		push	word ptr es:[bx]
		sub	[bp+saved_2], 2
		jnz	short loc_405D
		call	sub_40E0
		jmp	short loc_4075

loc_405D:
		add	bp, 6
		mov	ax, [bp+saved_0]
		xchg	[bp+var_6], ax
		mov	[bp+saved_0], ax
		call	sub_40E0
		mov	ax, [bp+saved_0]
		xchg	[bp+var_6], ax
		mov	[bp+saved_0], ax

loc_4075:
		pop	bx
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:1
		call	dword ptr dword_76746
		pop	es
		pop	ds
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		pop	bp
		iret
sub_4030		endp

; ----------------------------------------------------------------------

sub_4096		proc near
		push	es
		inc	word_767EA
		call	near ptr sub_42E9
		jmp	short loc_40CE

loc_40A0:
		popf
		push	dx
		jnb	short loc_40A7
		call	sub_4173

loc_40A7:
		mov	es, word_767EC
		mov	ax, es:1Ch
		mov	word_767EC, ax
		cmp	byte ptr es:1Bh, 0
		jnz	short loc_40C2
		call	sub_415B
		call	sub_42DD
		jmp	short loc_40CD

loc_40C2:
		dec	byte ptr es:1Bh
		call	sub_4220
		call	sub_4271

loc_40CD:
		pop	dx

loc_40CE:
		call	sub_42C1
		pushf
		cmp	dx, ax
		ja	short loc_40A0
		popf
		pop	es
		mov	ax, word_767E0
		mov	es:10h, ax
		ret
sub_4096		endp

; ----------------------------------------------------------------------

sub_40E0		proc near
		inc	word_767DC
		cmp	word ptr es:10h, 0
		jz	short loc_40FB
		mov	byte ptr es:1Bh, 1
		or	byte ptr es:1Ah, 4
		jmp	short loc_4117
		nop

loc_40FB:
		or	byte ptr es:1Ah, 8
		call	sub_4096
		push	ds
		dec	ax
		mov	ds, ax
		mov	word_7673E, es
		pop	ds
		call	word ptr es:18h
		jb	short loc_4156
		call	sub_4271

loc_4117:
		call	sub_41AE
		mov	al, es:1Ah
		and	al, 3
		add	es:1Bh, al
		push	es
		call	sub_42C1
		mov	es, word_767EC

loc_412D:
		mov	cx, es:1Ch
		jcxz	short loc_4154
		cmp	ax, word_767D8
		jnb	short loc_4154
		push	cx
		push	ax
		cmp	byte ptr es:1Bh, 0
		jz	short loc_4148
		xor	ax, ax
		jmp	short loc_414E

loc_4148:
		call	sub_41ED
		call	sub_42DD

loc_414E:
		pop	cx
		pop	es
		add	ax, cx
		jmp	short loc_412D

loc_4154:
		pop	es
		ret

loc_4156:
		jmp	sub_359
sub_40E0		endp

; ----------------------------------------------------------------------

sub_415B		proc near
		call	sub_41ED
		cmp	word ptr es:18h, 4C2h
		jnz	short loc_416B
		call	word ptr word_76740

loc_416B:
		mov	word ptr es:10h, 0
		ret
sub_415B		endp

; ----------------------------------------------------------------------

sub_4173		proc near
		mov	ax, word_767EC
		xor	cx, cx

loc_4178:
		inc	cx
		push	ax
		mov	es, ax
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_4178
		mov	word_767EC, ax
		mov	ax, word_767E6
		mov	word_767E0, ax

loc_418D:
		pop	es
		push	cx
		mov	ax, word_767EC
		mov	es:1Ch, ax
		mov	word_767EC, es
		call	sub_42DD
		sub	word_767E0, ax
		call	sub_4220
		pop	cx
		loop	short loc_418D
		mov	ax, word_767E4
		mov	word_767E0, ax
		ret
sub_4173		endp

; ----------------------------------------------------------------------

sub_41AE		proc near
		cmp	word ptr es:0Ch, 0
		jnz	short loc_41B7
		ret

loc_41B7:
		cmp	byte ptr es:20h, 0EAh
		jz	short loc_41EC
		mov	cx, es:2
		jcxz	short sub_41CF
		mov	ax, es:10h
		mov	dx, es
		call	sub_428F
sub_41AE		endp

; ----------------------------------------------------------------------

sub_41CF		proc near
		mov	bx, es:10h
		mov	cx, es:0Ch
		mov	di, 20h
		cld

loc_41DD:
		mov	dx, es:[di+2]
		mov	al, 0EAh
		stosb
		mov	ax, dx
		stosw
		mov	ax, bx
		stosw
		loop	short loc_41DD

loc_41EC:
		ret
sub_41CF		endp

; ----------------------------------------------------------------------

sub_41ED		proc near
		cmp	byte ptr es:20h, 0CDh
		jz	short loc_421F
		mov	ax, es
		mov	dx, es:10h
		xor	cx, cx
		call	sub_428F
		mov	es:2, cx
		mov	cx, es:0Ch
		mov	di, 20h
		cld

loc_420F:
		mov	dx, es:[di+1]
		mov	ax, word ptr dword_767D0
		stosw
		mov	ax, dx
		stosw
		xor	al, al
		stosb
		loop	short loc_420F

loc_421F:
		ret
sub_41ED		endp

; ----------------------------------------------------------------------

sub_4220		proc near
		mov	ax, word_767E0
		mov	dx, es:10h
		mov	es:10h, ax
		mov	cx, es:8
		inc	cx
		shr	cx, 1
		xor	si, si
		cld
		cmp	ax, dx
		jb	short loc_4241
		mov	si, cx
		dec	si
		shl	si, 1
		std

loc_4241:
		mov	di, si
		push	ds
		push	es
		mov	ds, dx
		mov	es, ax
		rep movsw
		cld
		dec	ax
		mov	ds, ax
		pop	es
		mov	word_7673E, es
		inc	ax
		pop	ds
		cmp	byte ptr es:20h, 0CDh
		jz	short loc_4270
		call	sub_429B
		mov	cx, es:0Ch
		mov	di, 23h
		cld

loc_426A:
		stosw
		add	di, 3
		loop	short loc_426A

loc_4270:
		ret
sub_4220		endp

; ----------------------------------------------------------------------

sub_4271		proc near
		call	sub_42DD
		add	word_767E0, ax
		push	ds
		mov	ax, seg seg233

loc_427C:
		mov	ds, ax
		mov	ax, word_7674C
		or	ax, ax
		jnz	short loc_427C
		mov	word_7674C, es
		mov	es:1Ch, ax
		pop	ds
		ret
sub_4271		endp

; ----------------------------------------------------------------------

sub_428F		proc near
		call	sub_429B
		or	bx, bx
		jz	short loc_429A
		xchg	ss:[bx+2], cx

loc_429A:
		ret
sub_428F		endp

; ----------------------------------------------------------------------

sub_429B		proc near
		xor	bx, bx
		push	cx
		push	bp
		jmp	short loc_42A5

loc_42A1:
		shl	cx, 1
		mov	bp, cx

loc_42A5:
		mov	cx, [bp]
		shr	cx, 1
		jz	short loc_42BE
		jb	short loc_42A1
		cmp	dx, [bp+4]
		jnz	short loc_42A1
		mov	[bp+4], ax
		or	bx, bx
		jnz	short loc_42A1
		mov	bx, bp
		jmp	short loc_42A1

loc_42BE:
		pop	bp
		pop	cx
		ret
sub_429B		endp

; ----------------------------------------------------------------------

sub_42C1		proc near
		mov	ax, word_767EC
		or	ax, ax
		jz	short loc_42D4
		mov	es, ax
		mov	ax, es:10h
		sub	ax, word_767E0
		jnb	short loc_42DC

loc_42D4:
		mov	ax, word_767E6
		sub	ax, word_767E0
		stc

loc_42DC:
		ret
sub_42C1		endp

; ----------------------------------------------------------------------

sub_42DD		proc near
		mov	ax, es:8
		add	ax, 11h
		mov	cl, 4
		shr	ax, cl
		ret
sub_42DD		endp

; ----------------------------------------------------------------------

sub_42E9		proc far
		mov	cl, 4
		mov	ax, es:8
		add	ax, 11h
		shr	ax, cl
		mov	dx, es:0Ah
		add	dx, 0Fh
		shr	dx, cl
		add	dx, ax
		ret
sub_42E9		endp

; START OF FUNCTION CHUNK FOR sub_42E9
		push	ds
		push	es
		mov	ds, cs:1
		cmp	ax, word_767E4
		jb	short loc_4331
		cmp	ax, word_767E6
		jnb	short loc_4331
		dec	ax
		mov	es, ax
		mov	es, es:0Eh
		inc	ax
		mov	bx, word ptr dword_767D0
		cmp	bx, es:0
		jnz	short loc_4331
		cmp	ax, es:10h
		mov	ax, es
		jz	short loc_4334

loc_4331:
		xor	ax, ax
		stc

loc_4334:
		pop	es
		pop	ds
		retf
; END OF FUNCTION CHUNK FOR sub_42E9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4337		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_2], 0
		push	ds
		mov	ds, cs:1
		push	si
		push	di
		mov	bx, bp
		mov	ax, word ptr dword_767D0
		mov	dx, word_767E4
		jmp	short loc_4358

loc_4354:
		shl	si, 1
		mov	bx, si

loc_4358:
		cmp	bx, cx
		jnb	short loc_4386
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_4386
		jb	short loc_4354
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_4354
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jnz	short loc_4354
		cmp	es:[di], ax
		jnz	short loc_4354
		mov	[bp+var_2], 1
		mov	es:[di+2], di
		jmp	short loc_4354

loc_4386:
		cmp	[bp+var_2], 1
		jz	short loc_4393
		jmp	short loc_43C8
		nop

loc_438F:
		shl	si, 1
		mov	bx, si

loc_4393:
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_43C8
		jb	short loc_438F
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_438F
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jz	short loc_438F
		cmp	es:0, ax
		jnz	short loc_438F
		cmp	word ptr es:2, 0
		jnz	short loc_438F
		xchg	es:2, di
		mov	ss:[bx+2], di
		jmp	short loc_438F

loc_43C8:
		pop	di
		pop	si
		pop	ds
		mov	sp, bp
		pop	bp
		retf
sub_4337		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43CF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:1
		mov	es, [bp+arg_2]
		mov	cx, word ptr dword_767D0
		cmp	cx, es:0
		jnz	short loc_4424
		cmp	word ptr es:10h, 0
		jz	short loc_43F6
		cmp	byte ptr es:20h, 0CDh
		jnz	short loc_441D

loc_43F6:
		mov	[bp+arg_2], 0
		push	si
		push	di
		call	sub_40E0
		pop	di
		pop	si
		mov	bx, [bp+arg_0]
		push	es
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:1
		call	dword ptr dword_76746
		pop	es

loc_441D:
		mov	ax, es:10h
		mov	[bp+arg_2], ax

loc_4424:
		pop	ds
		pop	bp
		retf
sub_43CF		endp

; ----------------------------------------------------------------------

sub_4427		proc far
		push	ds
		push	si
		push	di
		mov	ax, seg seg232
		mov	ds, ax
		call	sub_3DD7
		mov	bx, word_767DA
		mov	ax, seg dseg
		mov	ds, ax
		mov	ax, seg dseg
		mov	es, ax
		cmp	bx, es:55C2h
		jnb	short loc_444E
		mov	bx, es:55C2h
		jmp	short loc_4450

loc_444E:
		shl	bx, 1

loc_4450:
		inc	bx
		push	bx
		mov	ax, 10h
		mul	bx
		push	dx
		push	ax
		call	sub_66323
		pop	bx
		pop	bx
		pop	bx
		mov	cx, ax
		or	cx, dx
		jcxz	short loc_447D
		inc	dx
		add	bx, dx
		push	dx
		push	bx
		xor	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_3B4C
		or	ax, ax
		jnz	short loc_447D
		pop	di
		pop	si
		pop	ds
		retf
sub_4427		endp

; START OF FUNCTION CHUNK FOR sub_4427

loc_447D:
		db 0EAh, 0F1h, 2
; END OF FUNCTION CHUNK FOR sub_4427
seg001		ends
