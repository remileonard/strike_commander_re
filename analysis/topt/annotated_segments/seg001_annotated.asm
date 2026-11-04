seg001		segment	para public 'CODE' use16
		assume cs:seg001
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CDh, 0CBh, 0EEh, 46h, 9Eh, 48h, 50h, 41h, 54h, 48h, 3Dh, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_375D		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	ds
		mov	ds, cs:2
		push	si
		push	di
		cld
		cmp	word ptr dword_48A80, 0
		jnz	short loc_3776
		jmp	loc_3882

loc_3776:
		call	sub_390E
		jnb	short loc_37A7
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_378D
		mov	[bp+arg_0], 888h
		mov	[bp+arg_2], seg seg187

loc_378D:
		call	sub_3902
		jnb	short loc_37A7
		call	sub_3953
		jnb	short loc_37A7
		mov	ax, 0FFFEh
		jmp	loc_3884

loc_379D:
		mov	ah, 3Eh
		int	21h
		mov	ax, 0FFFFh
		jmp	loc_3884

loc_37A7:
		mov	bx, ax
		mov	word_48A98, bx
		mov	cx, 14h
		call	sub_39D8
		mov	cx, 0FFFDh
		jb	short loc_379D
		xor	ax, ax
		xor	dx, dx
		cmp	[bp+var_14], 5A4Dh
		jz	short loc_37C8
		mov	cx, 0FFFCh
		jmp	short loc_379D

loc_37C8:
		mov	ax, [bp+var_10]
		mov	cx, [bp+var_12]
		jcxz	short loc_37D1
		dec	ax

loc_37D1:
		mov	dx, 200h
		mul	dx
		add	ax, cx
		add	ax, 0Fh
		adc	dx, 0
		and	ax, 0FFF0h

loc_37E1:
		push	dx
		push	ax
		mov	cx, dx
		mov	dx, ax
		mov	ax, 4200h
		int	21h
		mov	cx, 10h
		call	sub_39D8
		pop	ax
		pop	dx
		mov	cx, 0FFFDh
		jb	short loc_379D
		add	ax, 10h
		adc	dx, 0
		cmp	[bp+var_14], 4246h
		mov	cx, 0FFFCh
		jz	short loc_380B
		jmp	short loc_379D

loc_380B:
		cmp	[bp+var_12], 564Fh
		jz	short loc_381A
		add	ax, [bp+var_10]
		adc	dx, [bp+var_E]
		jmp	short loc_37E1

loc_381A:
		mov	word_48A84, ax
		mov	word_48A86, dx
		mov	es, cs:4
		mov	ax, [bp+var_10]
		mov	es:5EC4h, ax
		mov	ax, [bp+var_E]
		mov	es:5EC6h, ax
		mov	ah, 3Eh
		int	21h
		mov	word_48A98, 0
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_388D
		mov	ax, [bp+arg_6]
		inc	ax
		mov	word_48A94, ax
		mov	word_48A90, ax
		mov	bx, [bp+arg_4]
		mov	word_48A96, bx
		call	sub_39E8
		mov	bx, word_48A96
		sub	bx, word_48A94
		cmp	bx, word_48A8A
		jnb	short loc_386B
		mov	cx, 0FFFBh
		jmp	loc_379D

loc_386B:
		shr	bx, 1
		shr	bx, 1
		mov	word_48A88, bx
		call	sub_3A68
		jnb	short loc_3882
		mov	bx, word_48A98
		mov	cx, 0FFFFh
		jmp	short loc_3884
		nop

loc_3882:
		xor	ax, ax

loc_3884:
		pop	di
		pop	si
		pop	ds
		mov	sp, bp
		pop	bp
		retf	8
sub_375D		endp

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
VROOMM_InstallIntHandler_388D		proc far
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:2
		mov	al, byte_48A81
		mov	ah, 35h
		int	21h
		push	es
		push	bx
		push	ds
		mov	al, byte_48A81
		mov	dx, word_489E2
		mov	ds, word_489E4
		mov	ah, 25h
		int	21h
		pop	ds
		pop	word_489E2
		pop	word_489E4
		cmp	word_48A98, 0
		jz	short loc_38CF
		mov	bx, word_48A98
		mov	ah, 3Eh
		int	21h
		mov	word_48A98, 0
		jmp	short loc_38DD

loc_38CF:
		lea	dx, word_489FC
		mov	ah, 3Dh
		mov	al, byte ptr word_489E6
		int	21h
		mov	word_48A98, ax

loc_38DD:
		pop	ds
		pop	bp
		retf
VROOMM_InstallIntHandler_388D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38E0		proc far
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:2
		cmp	word_48A98, 0
		jz	short loc_38F5
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_388D

loc_38F5:
		push	cs
		call	word ptr word_489F4
		push	cs
		call	word ptr word_489F2
		pop	ds
		pop	bp
		retf
sub_38E0		endp

; ----------------------------------------------------------------------

sub_3902		proc near
		push	ds
		lea	di, word_489FC
		push	ds
		pop	es
		call	sub_39B0
		pop	ds
		ret
sub_3902		endp

; ----------------------------------------------------------------------

sub_390E		proc near
		mov	ah, 30h
		int	21h
		cmp	al, 3
		jb	short loc_3952
		mov	byte ptr word_489E6, 20h
		push	ds
		mov	ax, seg dseg
		mov	ds, ax
		mov	ds, word_48B40
		xor	si, si
		cld

loc_3928:
		lodsb
		or	al, al
		jnz	short loc_3928
		lodsb
		or	al, al
		jnz	short loc_3928
		lodsw
		lea	di, word_489FC
		mov	ax, seg seg185
		mov	es, ax
		mov	bx, di

loc_393E:
		lodsb
		stosb
		or	al, al
		jz	short loc_394C
		cmp	al, 5Ch
		jnz	short loc_393E
		mov	bx, di
		jmp	short loc_393E

loc_394C:
		mov	di, bx
		call	sub_39B0
		pop	ds

loc_3952:
		ret
sub_390E		endp

; ----------------------------------------------------------------------

sub_3953		proc near
		push	ds
		mov	ax, seg dseg
		mov	ds, ax
		mov	ds, word_48B40
		xor	si, si

loc_395F:
		mov	di, 6
		push	cs
		pop	es
		mov	cx, 5
		cld
		repe cmpsb
		jz	short loc_3979
		dec	si

loc_396D:
		lodsb
		or	al, al
		jnz	short loc_396D
		cmp	al, [si]
		jnz	short loc_395F

loc_3976:
		pop	ds
		stc
		ret

loc_3979:
		cmp	byte ptr [si], 0
		jz	short loc_3976
		lea	di, word_489FC
		mov	ax, seg seg185
		mov	es, ax
		xor	al, al

loc_3989:
		mov	ah, al
		lodsb
		or	al, al
		jz	short loc_3997
		cmp	al, 3Bh
		jz	short loc_3998
		stosb
		jmp	short loc_3989

loc_3997:
		dec	si

loc_3998:
		cmp	ah, 3Ah
		jz	short loc_39A5
		cmp	ah, 5Ch
		jz	short loc_39A5
		mov	al, 5Ch
		stosb

loc_39A5:
		push	ds
		push	si
		call	sub_39B0
		pop	si
		pop	ds
		jb	short loc_3979
		pop	ds
		ret
sub_3953		endp

; ----------------------------------------------------------------------

sub_39B0		proc near
		lds	si, [bp+6]
		mov	ax, ds
		or	ax, si
		jz	short loc_39C7
		mov	cx, 0Ch

loc_39BC:
		lodsb
		stosb
		or	al, al
		jz	short loc_39C7
		loop	short loc_39BC
		sub	al, al
		stosb

loc_39C7:
		lea	dx, word_489FC
		mov	ax, seg seg185
		mov	ds, ax
		mov	ah, 3Dh
		mov	al, byte ptr word_489E6
		int	21h
		ret
sub_39B0		endp

; ----------------------------------------------------------------------

sub_39D8		proc near
		push	ds
		lea	dx, [bp-14h]
		push	ss
		pop	ds
		mov	ah, 3Fh
		int	21h
		pop	ds
		jb	short loc_39E7
		cmp	ax, cx

loc_39E7:
		ret
sub_39D8		endp

; ----------------------------------------------------------------------

sub_39E8		proc near
		mov	ax, seg dseg
		mov	es, ax
		mov	ax, es:164h
		add	ax, 10h
		mov	cs:0Bh, ax
		mov	ax, seg seg186
		mov	es, ax
		xor	bx, bx
		xor	di, di
		lea	si, word_48AA0

loc_3A05:
		test	word ptr [si+4], 2
		jz	short loc_3A12
		cmp	word ptr [si+2], 0
		jnz	short loc_3A15

loc_3A12:
		jmp	short loc_3A53
		nop

loc_3A15:
		mov	ax, [si]
		push	es
		mov	es:12h, ax
		mov	es, ax
		cmp	byte ptr es:1Ah, 0FFh
		jnz	short loc_3A31
		pop	es
		mov	word ptr es:12h, 0
		jmp	short loc_3A53
		nop

loc_3A31:
		pop	ax
		mov	word ptr es:18h, 4C3h
		mov	ax, word_48A84
		mov	dx, word_48A86
		add	es:4, ax
		adc	es:6, dx
		call	near ptr sub_3EFA
		cmp	bx, dx
		jnb	short loc_3A53
		xchg	dx, bx

loc_3A53:
		add	si, 8
		cmp	si, 948h
		jnb	short loc_3A5E
		jmp	short loc_3A05

loc_3A5E:
		xor	ax, ax
		add	bx, 2
		mov	word_48A8A, bx
		ret
sub_39E8		endp

; ----------------------------------------------------------------------

sub_3A68		proc near
		mov	cx, word_48A92
		mov	word_48A9C, cx
		mov	bx, cx
		mov	si, word_48A94
		mov	di, word_48A96
		push	ds

loc_3A7B:
		mov	ds, cx
		mov	cx, word_489F2
		jcxz	short loc_3AB1
		mov	es, cx
		mov	ax, es:4
		mov	dx, es:6
		sub	ax, word_489E4
		sbb	dx, word_489E6
		mov	cx, 10h
		div	cx
		add	ax, si
		cmp	ax, di
		ja	short loc_3AB1
		mov	word ptr dword_489F0, si
		mov	si, ax
		mov	cx, es
		mov	word_489FC, cx
		mov	bx, ds
		jmp	short loc_3A7B

loc_3AB1:
		mov	ds, bx
		mov	word_489FC, 0
		pop	ds
		mov	word_48A90, si
		mov	ax, word_48A94
		sub	si, ax
		jnz	short loc_3AC8
		jmp	short loc_3B26
		nop

loc_3AC8:
		mov	cl, 4
		rol	si, cl
		mov	di, si
		and	di, 0Fh
		and	si, 0FFF0h
		mov	es, word_48A9C
		mov	dx, es:4
		mov	cx, es:6
		call	sub_3B35
		jb	short loc_3B27
		mov	ax, word_48A9C
		push	ds

loc_3AEB:
		mov	es, ax
		mov	cx, es:0Ah
		jcxz	short loc_3AF7
		call	sub_3B6E

loc_3AF7:
		cmp	word ptr es:0Ch, 0
		jz	short loc_3B02
		call	sub_3DE0

loc_3B02:
		mov	ax, es:10h
		dec	ax
		mov	ds, ax
		mov	word_489EE, es
		push	es
		mov	ax, 0FFFFh
		mov	bx, ax
		mov	ds, cs:2
		call	dword ptr dword_489F6
		pop	es
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_3AEB
		pop	ds

loc_3B26:
		clc

loc_3B27:
		ret
sub_3A68		endp

; START OF FUNCTION CHUNK FOR sub_3A68
		mov	cl, 4
		shr	ax, cl
		ror	dx, cl
		and	dx, 0F000h
		or	ax, dx
		ret
; END OF FUNCTION CHUNK FOR sub_3A68

; ----------------------------------------------------------------------

sub_3B35		proc near
		push	ax
		mov	bx, word_48A98
		mov	ax, 4200h
		int	21h
		pop	ax
		push	ds
		mov	ds, ax
		jmp	short loc_3B4C

loc_3B45:
		mov	ax, ds
		add	ax, 0FFFh
		mov	ds, ax

loc_3B4C:
		mov	cx, 0FFF0h
		or	di, di
		jnz	short loc_3B55
		mov	cx, si

loc_3B55:
		xor	dx, dx
		mov	ah, 3Fh
		int	21h
		jb	short loc_3B6C
		cmp	ax, cx
		jb	short loc_3B6C
		sub	si, ax
		sbb	di, 0
		mov	ax, si
		or	ax, di
		jnz	short loc_3B45

loc_3B6C:
		pop	ds
		ret
sub_3B35		endp

; ----------------------------------------------------------------------

sub_3B6E		proc near
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

loc_3B8F:
		lodsw
		mov	bx, ax
		mov	di, es:[bx]
		push	ds
		mov	ax, seg seg187
		mov	ds, ax
		mov	ax, di
		and	di, 0FFF8h
		mov	dx, [di]
		mov	es:[bx], dx
		test	ax, 1
		jz	short loc_3BAD
		call	sub_3BB3

loc_3BAD:
		pop	ds
		loop	short loc_3B8F
		pop	es
		pop	ds
		ret
sub_3B6E		endp

; ----------------------------------------------------------------------

sub_3BB3		proc near
		push	cx
		mov	ds, dx
		mov	ah, es:[bx-1]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 0B8h
		jnz	short loc_3C0F
		mov	cx, ax
		mov	ah, es:[bx+2]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 50h
		jnz	short loc_3C0F
		cmp	al, cl
		jnz	short loc_3C0F
		mov	dx, ax
		mov	ah, es:[bx+3]
		mov	al, ah
		and	ax, 0F807h
		cmp	cx, ax
		jnz	short loc_3C0F
		mov	ah, es:[bx+6]
		mov	al, ah
		and	ax, 0F807h
		cmp	ax, dx
		jnz	short loc_3C0F
		mov	di, 20h
		mov	cx, word_489EC
		mov	ax, es:[bx+4]

loc_3BFF:
		cmp	ax, [di+2]
		jz	short loc_3C0B
		add	di, 5
		loop	short loc_3BFF
		jmp	short loc_3C11

loc_3C0B:
		mov	es:[bx+4], di

loc_3C0F:
		pop	cx
		ret

loc_3C11:
		pop	cx
		ret
sub_3BB3		endp

; START OF FUNCTION CHUNK FOR sub_3BB3
		mov	si, es:8
		xor	di, di
		add	si, es:0Ah
		adc	di, 0
		mov	dx, es:4
		mov	cx, es:6
		mov	ax, es:10h
		call	sub_3B35
		jb	short loc_3C40
		mov	cx, es:0Ah
		jcxz	short loc_3C3F
		call	sub_3B6E

loc_3C3F:
		clc

loc_3C40:
		ret
; END OF FUNCTION CHUNK FOR sub_3BB3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C41		proc far

var_6		= word ptr -6
saved_0		= word ptr  0
saved_2		= word ptr  2

		push	bp
		mov	bp, sp
		test	bp, 1
		jz	short loc_3C4F
		jmp	sub_3734

loc_3C4F:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	ds
		push	es
		mov	ax, seg seg185
		mov	ds, ax
		sti
		les	bx, [bp+saved_2]
		push	word ptr es:[bx]
		sub	[bp+saved_2], 2
		jnz	short loc_3C6E
		call	sub_3CF1
		jmp	short loc_3C86

loc_3C6E:
		add	bp, 6
		mov	ax, [bp+saved_0]
		xchg	[bp+var_6], ax
		mov	[bp+saved_0], ax
		call	sub_3CF1
		mov	ax, [bp+saved_0]
		xchg	[bp+var_6], ax
		mov	[bp+saved_0], ax

loc_3C86:
		pop	bx
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:2
		call	dword ptr dword_489F6
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
sub_3C41		endp

; ----------------------------------------------------------------------

sub_3CA7		proc near
		push	es
		inc	word_48A9A
		call	near ptr sub_3EFA
		jmp	short loc_3CDF

loc_3CB1:
		popf
		push	dx
		jnb	short loc_3CB8
		call	sub_3D84

loc_3CB8:
		mov	es, word_48A9C
		mov	ax, es:1Ch
		mov	word_48A9C, ax
		cmp	byte ptr es:1Bh, 0
		jnz	short loc_3CD3
		call	sub_3D6C
		call	sub_3EEE
		jmp	short loc_3CDE

loc_3CD3:
		dec	byte ptr es:1Bh
		call	sub_3E31
		call	sub_3E82

loc_3CDE:
		pop	dx

loc_3CDF:
		call	sub_3ED2
		pushf
		cmp	dx, ax
		ja	short loc_3CB1
		popf
		pop	es
		mov	ax, word_48A90
		mov	es:10h, ax
		ret
sub_3CA7		endp

; ----------------------------------------------------------------------

sub_3CF1		proc near
		inc	word_48A8C
		cmp	word ptr es:10h, 0
		jz	short loc_3D0C
		mov	byte ptr es:1Bh, 1
		or	byte ptr es:1Ah, 4
		jmp	short loc_3D28
		nop

loc_3D0C:
		or	byte ptr es:1Ah, 8
		call	sub_3CA7
		push	ds
		dec	ax
		mov	ds, ax
		mov	word_489EE, es
		pop	ds
		call	word ptr es:18h
		jb	short loc_3D67
		call	sub_3E82

loc_3D28:
		call	sub_3DBF
		mov	al, es:1Ah
		and	al, 3
		add	es:1Bh, al
		push	es
		call	sub_3ED2
		mov	es, word_48A9C

loc_3D3E:
		mov	cx, es:1Ch
		jcxz	short loc_3D65
		cmp	ax, word_48A88
		jnb	short loc_3D65
		push	cx
		push	ax
		cmp	byte ptr es:1Bh, 0
		jz	short loc_3D59
		xor	ax, ax
		jmp	short loc_3D5F

loc_3D59:
		call	sub_3DFE
		call	sub_3EEE

loc_3D5F:
		pop	cx
		pop	es
		add	ax, cx
		jmp	short loc_3D3E

loc_3D65:
		pop	es
		ret

loc_3D67:
		jmp	sub_3734
sub_3CF1		endp

; ----------------------------------------------------------------------

sub_3D6C		proc near
		call	sub_3DFE
		cmp	word ptr es:18h, 4C3h
		jnz	short loc_3D7C
		call	word ptr dword_489F0

loc_3D7C:
		mov	word ptr es:10h, 0
		ret
sub_3D6C		endp

; ----------------------------------------------------------------------

sub_3D84		proc near
		mov	ax, word_48A9C
		xor	cx, cx

loc_3D89:
		inc	cx
		push	ax
		mov	es, ax
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_3D89
		mov	word_48A9C, ax
		mov	ax, word_48A96
		mov	word_48A90, ax

loc_3D9E:
		pop	es
		push	cx
		mov	ax, word_48A9C
		mov	es:1Ch, ax
		mov	word_48A9C, es
		call	sub_3EEE
		sub	word_48A90, ax
		call	sub_3E31
		pop	cx
		loop	short loc_3D9E
		mov	ax, word_48A94
		mov	word_48A90, ax
		ret
sub_3D84		endp

; ----------------------------------------------------------------------

sub_3DBF		proc near
		cmp	word ptr es:0Ch, 0
		jnz	short loc_3DC8
		ret

loc_3DC8:
		cmp	byte ptr es:20h, 0EAh
		jz	short loc_3DFD
		mov	cx, es:2
		jcxz	short sub_3DE0
		mov	ax, es:10h
		mov	dx, es
		call	sub_3EA0
sub_3DBF		endp

; ----------------------------------------------------------------------

sub_3DE0		proc near
		mov	bx, es:10h
		mov	cx, es:0Ch
		mov	di, 20h
		cld

loc_3DEE:
		mov	dx, es:[di+2]
		mov	al, 0EAh
		stosb
		mov	ax, dx
		stosw
		mov	ax, bx
		stosw
		loop	short loc_3DEE

loc_3DFD:
		ret
sub_3DE0		endp

; ----------------------------------------------------------------------

sub_3DFE		proc near
		cmp	byte ptr es:20h, 0CDh
		jz	short loc_3E30
		mov	ax, es
		mov	dx, es:10h
		xor	cx, cx
		call	sub_3EA0
		mov	es:2, cx
		mov	cx, es:0Ch
		mov	di, 20h
		cld

loc_3E20:
		mov	dx, es:[di+1]
		mov	ax, word ptr dword_48A80
		stosw
		mov	ax, dx
		stosw
		xor	al, al
		stosb
		loop	short loc_3E20

loc_3E30:
		ret
sub_3DFE		endp

; ----------------------------------------------------------------------

sub_3E31		proc near
		mov	ax, word_48A90
		mov	dx, es:10h
		mov	es:10h, ax
		mov	cx, es:8
		inc	cx
		shr	cx, 1
		xor	si, si
		cld
		cmp	ax, dx
		jb	short loc_3E52
		mov	si, cx
		dec	si
		shl	si, 1
		std

loc_3E52:
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
		mov	word_489EE, es
		inc	ax
		pop	ds
		cmp	byte ptr es:20h, 0CDh
		jz	short loc_3E81
		call	sub_3EAC
		mov	cx, es:0Ch
		mov	di, 23h
		cld

loc_3E7B:
		stosw
		add	di, 3
		loop	short loc_3E7B

loc_3E81:
		ret
sub_3E31		endp

; ----------------------------------------------------------------------

sub_3E82		proc near
		call	sub_3EEE
		add	word_48A90, ax
		push	ds
		mov	ax, seg seg186

loc_3E8D:
		mov	ds, ax
		mov	ax, word_489FC
		or	ax, ax
		jnz	short loc_3E8D
		mov	word_489FC, es
		mov	es:1Ch, ax
		pop	ds
		ret
sub_3E82		endp

; ----------------------------------------------------------------------

sub_3EA0		proc near
		call	sub_3EAC
		or	bx, bx
		jz	short loc_3EAB
		xchg	ss:[bx+2], cx

loc_3EAB:
		ret
sub_3EA0		endp

; ----------------------------------------------------------------------

sub_3EAC		proc near
		xor	bx, bx
		push	cx
		push	bp
		jmp	short loc_3EB6

loc_3EB2:
		shl	cx, 1
		mov	bp, cx

loc_3EB6:
		mov	cx, [bp]
		shr	cx, 1
		jz	short loc_3ECF
		jb	short loc_3EB2
		cmp	dx, [bp+4]
		jnz	short loc_3EB2
		mov	[bp+4], ax
		or	bx, bx
		jnz	short loc_3EB2
		mov	bx, bp
		jmp	short loc_3EB2

loc_3ECF:
		pop	bp
		pop	cx
		ret
sub_3EAC		endp

; ----------------------------------------------------------------------

sub_3ED2		proc near
		mov	ax, word_48A9C
		or	ax, ax
		jz	short loc_3EE5
		mov	es, ax
		mov	ax, es:10h
		sub	ax, word_48A90
		jnb	short loc_3EED

loc_3EE5:
		mov	ax, word_48A96
		sub	ax, word_48A90
		stc

loc_3EED:
		ret
sub_3ED2		endp

; ----------------------------------------------------------------------

sub_3EEE		proc near
		mov	ax, es:8
		add	ax, 11h
		mov	cl, 4
		shr	ax, cl
		ret
sub_3EEE		endp

; ----------------------------------------------------------------------

sub_3EFA		proc far
		mov	cl, 4
		mov	ax, es:8
		add	ax, 11h
		shr	ax, cl
		mov	dx, es:0Ah
		add	dx, 0Fh
		shr	dx, cl
		add	dx, ax
		ret
sub_3EFA		endp

; START OF FUNCTION CHUNK FOR sub_3EFA
		push	ds
		push	es
		mov	ds, cs:2
		cmp	ax, word_48A94
		jb	short loc_3F42
		cmp	ax, word_48A96
		jnb	short loc_3F42
		dec	ax
		mov	es, ax
		mov	es, es:0Eh
		inc	ax
		mov	bx, word ptr dword_48A80
		cmp	bx, es:0
		jnz	short loc_3F42
		cmp	ax, es:10h
		mov	ax, es
		jz	short loc_3F45

loc_3F42:
		xor	ax, ax
		stc

loc_3F45:
		pop	es
		pop	ds
		retf
; END OF FUNCTION CHUNK FOR sub_3EFA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F48		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_2], 0
		push	ds
		mov	ds, cs:2
		push	si
		push	di
		mov	bx, bp
		mov	ax, word ptr dword_48A80
		mov	dx, word_48A94
		jmp	short loc_3F69

loc_3F65:
		shl	si, 1
		mov	bx, si

loc_3F69:
		cmp	bx, cx
		jnb	short loc_3F97
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_3F97
		jb	short loc_3F65
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_3F65
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jnz	short loc_3F65
		cmp	es:[di], ax
		jnz	short loc_3F65
		mov	[bp+var_2], 1
		mov	es:[di+2], di
		jmp	short loc_3F65

loc_3F97:
		cmp	[bp+var_2], 1
		jz	short loc_3FA4
		jmp	short loc_3FD9
		nop

loc_3FA0:
		shl	si, 1
		mov	bx, si

loc_3FA4:
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_3FD9
		jb	short loc_3FA0
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_3FA0
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jz	short loc_3FA0
		cmp	es:0, ax
		jnz	short loc_3FA0
		cmp	word ptr es:2, 0
		jnz	short loc_3FA0
		xchg	es:2, di
		mov	ss:[bx+2], di
		jmp	short loc_3FA0

loc_3FD9:
		pop	di
		pop	si
		pop	ds
		mov	sp, bp
		pop	bp
		retf
sub_3F48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FE0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:2
		mov	es, [bp+arg_2]
		mov	cx, word ptr dword_48A80
		cmp	cx, es:0
		jnz	short loc_4035
		cmp	word ptr es:10h, 0
		jz	short loc_4007
		cmp	byte ptr es:20h, 0CDh
		jnz	short loc_402E

loc_4007:
		mov	[bp+arg_2], 0
		push	si
		push	di
		call	sub_3CF1
		pop	di
		pop	si
		mov	bx, [bp+arg_0]
		push	es
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:2
		call	dword ptr dword_489F6
		pop	es

loc_402E:
		mov	ax, es:10h
		mov	[bp+arg_2], ax

loc_4035:
		pop	ds
		pop	bp
		retf
sub_3FE0		endp

; ----------------------------------------------------------------------

sub_4038		proc far
		push	ds
		push	si
		push	di
		mov	ax, seg seg185
		mov	ds, ax
		call	sub_39E8
		mov	bx, word_48A8A
		mov	ax, seg dseg
		mov	ds, ax
		mov	ax, seg dseg
		mov	es, ax
		cmp	bx, es:5EC8h
		jnb	short loc_405F
		mov	bx, es:5EC8h
		jmp	short loc_4061

loc_405F:
		shl	bx, 1

loc_4061:
		inc	bx
		push	bx
		mov	ax, 10h
		mul	bx
		push	dx
		push	ax
		call	sub_33985
		pop	bx
		pop	bx
		pop	bx
		mov	cx, ax
		or	cx, dx
		jcxz	short loc_408E
		inc	dx
		add	bx, dx
		push	dx
		push	bx
		xor	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_375D
		or	ax, ax
		jnz	short loc_408E
		pop	di
		pop	si
		pop	ds
		retf
sub_4038		endp

; START OF FUNCTION CHUNK FOR sub_4038

loc_408E:
		db 0EAh, 15h
; END OF FUNCTION CHUNK FOR sub_4038
seg001		ends
