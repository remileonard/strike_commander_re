seg001		segment	para public 'CODE' use16
		assume cs:seg001
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0F4h, 39h, 0FFh, 39h, 1, 3Ah, 3, 3Ah, 9, 58h, 0D2h, 59h, 50h, 41h, 54h, 48h
		db 3Dh, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3AE3		proc far

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
		mov	ds, cs:8
		push	si
		push	di
		cld
		cmp	word_59DC0, 0
		jnz	short loc_3AFC
		jmp	loc_3C08

loc_3AFC:
		call	sub_3C94
		jnb	short loc_3B2D
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_3B13
		mov	[bp+arg_0], 8B8h
		mov	[bp+arg_2], seg seg184

loc_3B13:
		call	sub_3C88
		jnb	short loc_3B2D
		call	sub_3CD9
		jnb	short loc_3B2D
		mov	ax, 0FFFEh
		jmp	loc_3C0A

loc_3B23:
		mov	ah, 3Eh
		int	21h
		mov	ax, 0FFFFh
		jmp	loc_3C0A

loc_3B2D:
		mov	bx, ax
		mov	word_59DD8, bx
		mov	cx, 14h
		call	sub_3D5E
		mov	cx, 0FFFDh
		jb	short loc_3B23
		xor	ax, ax
		xor	dx, dx
		cmp	[bp+var_14], 5A4Dh
		jz	short loc_3B4E
		mov	cx, 0FFFCh
		jmp	short loc_3B23

loc_3B4E:
		mov	ax, [bp+var_10]
		mov	cx, [bp+var_12]
		jcxz	short loc_3B57
		dec	ax

loc_3B57:
		mov	dx, 200h
		mul	dx
		add	ax, cx
		add	ax, 0Fh
		adc	dx, 0
		and	ax, 0FFF0h

loc_3B67:
		push	dx
		push	ax
		mov	cx, dx
		mov	dx, ax
		mov	ax, 4200h
		int	21h
		mov	cx, 10h
		call	sub_3D5E
		pop	ax
		pop	dx
		mov	cx, 0FFFDh
		jb	short loc_3B23
		add	ax, 10h
		adc	dx, 0
		cmp	[bp+var_14], 4246h
		mov	cx, 0FFFCh
		jz	short loc_3B91
		jmp	short loc_3B23

loc_3B91:
		cmp	[bp+var_12], 564Fh
		jz	short loc_3BA0
		add	ax, [bp+var_10]
		adc	dx, [bp+var_E]
		jmp	short loc_3B67

loc_3BA0:
		mov	word_59DC4, ax
		mov	word_59DC6, dx
		mov	es, cs:0Ah
		mov	ax, [bp+var_10]
		mov	es:4CF2h, ax
		mov	ax, [bp+var_E]
		mov	es:4CF4h, ax
		mov	ah, 3Eh
		int	21h
		mov	word_59DD8, 0
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_3C13
		mov	ax, [bp+arg_6]
		inc	ax
		mov	word_59DD4, ax
		mov	word_59DD0, ax
		mov	bx, [bp+arg_4]
		mov	word_59DD6, bx
		call	sub_3D6E
		mov	bx, word_59DD6
		sub	bx, word_59DD4
		cmp	bx, word_59DCA
		jnb	short loc_3BF1
		mov	cx, 0FFFBh
		jmp	loc_3B23

loc_3BF1:
		shr	bx, 1
		shr	bx, 1
		mov	word_59DC8, bx
		call	sub_3DEE
		jnb	short loc_3C08
		mov	bx, word_59DD8
		mov	cx, 0FFFFh
		jmp	short loc_3C0A
		nop

loc_3C08:
		xor	ax, ax

loc_3C0A:
		pop	di
		pop	si
		pop	ds
		mov	sp, bp
		pop	bp
		retf	8
sub_3AE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_InstallIntHandler_3C7C (sub_3C7C de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
VROOMM_InstallIntHandler_3C13		proc far
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:8
		mov	al, byte_59DC1
		mov	ah, 35h
		int	21h
		push	es
		push	bx
		push	ds
		mov	al, byte_59DC1
		mov	dx, word_59D22
		mov	ds, word_59D24
		mov	ah, 25h
		int	21h
		pop	ds
		pop	word_59D22
		pop	word_59D24
		cmp	word_59DD8, 0
		jz	short loc_3C55
		mov	bx, word_59DD8
		mov	ah, 3Eh
		int	21h
		mov	word_59DD8, 0
		jmp	short loc_3C63

loc_3C55:
		lea	dx, word_59D3C
		mov	ah, 3Dh
		mov	al, byte ptr word_59D26
		int	21h
		mov	word_59DD8, ax

loc_3C63:
		pop	ds
		pop	bp
		retf
VROOMM_InstallIntHandler_3C13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C66		proc far
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:8
		cmp	word_59DD8, 0
		jz	short loc_3C7B
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_3C13

loc_3C7B:
		push	cs
		call	word ptr word_59D34
		push	cs
		call	word ptr word_59D32
		pop	ds
		pop	bp
		retf
sub_3C66		endp

; ----------------------------------------------------------------------

sub_3C88		proc near
		push	ds
		lea	di, word_59D3C
		push	ds
		pop	es
		call	sub_3D36
		pop	ds
		ret
sub_3C88		endp

; ----------------------------------------------------------------------

sub_3C94		proc near
		mov	ah, 30h
		int	21h
		cmp	al, 3
		jb	short loc_3CD8
		mov	byte ptr word_59D26, 20h
		push	ds
		mov	ax, seg dseg
		mov	ds, ax
		mov	ds, word_59E39
		xor	si, si
		cld

loc_3CAE:
		lodsb
		or	al, al
		jnz	short loc_3CAE
		lodsb
		or	al, al
		jnz	short loc_3CAE
		lodsw
		lea	di, word_59D3C
		mov	ax, seg seg182
		mov	es, ax
		mov	bx, di

loc_3CC4:
		lodsb
		stosb
		or	al, al
		jz	short loc_3CD2
		cmp	al, 5Ch
		jnz	short loc_3CC4
		mov	bx, di
		jmp	short loc_3CC4

loc_3CD2:
		mov	di, bx
		call	sub_3D36
		pop	ds

loc_3CD8:
		ret
sub_3C94		endp

; ----------------------------------------------------------------------

sub_3CD9		proc near
		push	ds
		mov	ax, seg dseg
		mov	ds, ax
		mov	ds, word_59E39
		xor	si, si

loc_3CE5:
		mov	di, 0Ch
		push	cs
		pop	es
		mov	cx, 5
		cld
		repe cmpsb
		jz	short loc_3CFF
		dec	si

loc_3CF3:
		lodsb
		or	al, al
		jnz	short loc_3CF3
		cmp	al, [si]
		jnz	short loc_3CE5

loc_3CFC:
		pop	ds
		stc
		ret

loc_3CFF:
		cmp	byte ptr [si], 0
		jz	short loc_3CFC
		lea	di, word_59D3C
		mov	ax, seg seg182
		mov	es, ax
		xor	al, al

loc_3D0F:
		mov	ah, al
		lodsb
		or	al, al
		jz	short loc_3D1D
		cmp	al, 3Bh
		jz	short loc_3D1E
		stosb
		jmp	short loc_3D0F

loc_3D1D:
		dec	si

loc_3D1E:
		cmp	ah, 3Ah
		jz	short loc_3D2B
		cmp	ah, 5Ch
		jz	short loc_3D2B
		mov	al, 5Ch
		stosb

loc_3D2B:
		push	ds
		push	si
		call	sub_3D36
		pop	si
		pop	ds
		jb	short loc_3CFF
		pop	ds
		ret
sub_3CD9		endp

; ----------------------------------------------------------------------

sub_3D36		proc near
		lds	si, [bp+6]
		mov	ax, ds
		or	ax, si
		jz	short loc_3D4D
		mov	cx, 0Ch

loc_3D42:
		lodsb
		stosb
		or	al, al
		jz	short loc_3D4D
		loop	short loc_3D42
		sub	al, al
		stosb

loc_3D4D:
		lea	dx, word_59D3C
		mov	ax, seg seg182
		mov	ds, ax
		mov	ah, 3Dh
		mov	al, byte ptr word_59D26
		int	21h
		ret
sub_3D36		endp

; ----------------------------------------------------------------------

sub_3D5E		proc near
		push	ds
		lea	dx, [bp-14h]
		push	ss
		pop	ds
		mov	ah, 3Fh
		int	21h
		pop	ds
		jb	short loc_3D6D
		cmp	ax, cx

loc_3D6D:
		ret
sub_3D5E		endp

; ----------------------------------------------------------------------

sub_3D6E		proc near
		mov	ax, seg dseg
		mov	es, ax
		mov	ax, es:11Dh
		add	ax, 10h
		mov	cs:11h, ax
		mov	ax, seg seg183
		mov	es, ax
		xor	bx, bx
		xor	di, di
		lea	si, word_59DE0

loc_3D8B:
		test	word ptr [si+4], 2
		jz	short loc_3D98
		cmp	word ptr [si+2], 0
		jnz	short loc_3D9B

loc_3D98:
		jmp	short loc_3DD9
		nop

loc_3D9B:
		mov	ax, [si]
		push	es
		mov	es:12h, ax
		mov	es, ax
		cmp	byte ptr es:1Ah, 0FFh
		jnz	short loc_3DB7
		pop	es
		mov	word ptr es:12h, 0
		jmp	short loc_3DD9
		nop

loc_3DB7:
		pop	ax
		mov	word ptr es:18h, 4C9h
		mov	ax, word_59DC4
		mov	dx, word_59DC6
		add	es:4, ax
		adc	es:6, dx
		call	near ptr sub_4280
		cmp	bx, dx
		jnb	short loc_3DD9
		xchg	dx, bx

loc_3DD9:
		add	si, 8
		cmp	si, 978h
		jnb	short loc_3DE4
		jmp	short loc_3D8B

loc_3DE4:
		xor	ax, ax
		add	bx, 2
		mov	word_59DCA, bx
		ret
sub_3D6E		endp

; ----------------------------------------------------------------------

sub_3DEE		proc near
		mov	cx, word_59DD2
		mov	word_59DDC, cx
		mov	bx, cx
		mov	si, word_59DD4
		mov	di, word_59DD6
		push	ds

loc_3E01:
		mov	ds, cx
		mov	cx, word_59D32
		jcxz	short loc_3E37
		mov	es, cx
		mov	ax, es:4
		mov	dx, es:6
		sub	ax, word_59D24
		sbb	dx, word_59D26
		mov	cx, 10h
		div	cx
		add	ax, si
		cmp	ax, di
		ja	short loc_3E37
		mov	word_59D30, si
		mov	si, ax
		mov	cx, es
		mov	word_59D3C, cx
		mov	bx, ds
		jmp	short loc_3E01

loc_3E37:
		mov	ds, bx
		mov	word_59D3C, 0
		pop	ds
		mov	word_59DD0, si
		mov	ax, word_59DD4
		sub	si, ax
		jnz	short loc_3E4E
		jmp	short loc_3EAC
		nop

loc_3E4E:
		mov	cl, 4
		rol	si, cl
		mov	di, si
		and	di, 0Fh
		and	si, 0FFF0h
		mov	es, word_59DDC
		mov	dx, es:4
		mov	cx, es:6
		call	sub_3EBB
		jb	short loc_3EAD
		mov	ax, word_59DDC
		push	ds

loc_3E71:
		mov	es, ax
		mov	cx, es:0Ah
		jcxz	short loc_3E7D
		call	sub_3EF4

loc_3E7D:
		cmp	word ptr es:0Ch, 0
		jz	short loc_3E88
		call	sub_4166

loc_3E88:
		mov	ax, es:10h
		dec	ax
		mov	ds, ax
		mov	word_59D2E, es
		push	es
		mov	ax, 0FFFFh
		mov	bx, ax
		mov	ds, cs:8
		call	dword ptr dword_59D36
		pop	es
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_3E71
		pop	ds

loc_3EAC:
		clc

loc_3EAD:
		ret
sub_3DEE		endp

; START OF FUNCTION CHUNK FOR sub_3DEE
		mov	cl, 4
		shr	ax, cl
		ror	dx, cl
		and	dx, 0F000h
		or	ax, dx
		ret
; END OF FUNCTION CHUNK FOR sub_3DEE

; ----------------------------------------------------------------------

sub_3EBB		proc near
		push	ax
		mov	bx, word_59DD8
		mov	ax, 4200h
		int	21h
		pop	ax
		push	ds
		mov	ds, ax
		jmp	short loc_3ED2

loc_3ECB:
		mov	ax, ds
		add	ax, 0FFFh
		mov	ds, ax

loc_3ED2:
		mov	cx, 0FFF0h
		or	di, di
		jnz	short loc_3EDB
		mov	cx, si

loc_3EDB:
		xor	dx, dx
		mov	ah, 3Fh
		int	21h
		jb	short loc_3EF2
		cmp	ax, cx
		jb	short loc_3EF2
		sub	si, ax
		sbb	di, 0
		mov	ax, si
		or	ax, di
		jnz	short loc_3ECB

loc_3EF2:
		pop	ds
		ret
sub_3EBB		endp

; ----------------------------------------------------------------------

sub_3EF4		proc near
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

loc_3F15:
		lodsw
		mov	bx, ax
		mov	di, es:[bx]
		push	ds
		mov	ax, seg seg184
		mov	ds, ax
		mov	ax, di
		and	di, 0FFF8h
		mov	dx, [di]
		mov	es:[bx], dx
		test	ax, 1
		jz	short loc_3F33
		call	sub_3F39

loc_3F33:
		pop	ds
		loop	short loc_3F15
		pop	es
		pop	ds
		ret
sub_3EF4		endp

; ----------------------------------------------------------------------

sub_3F39		proc near
		push	cx
		mov	ds, dx
		mov	ah, es:[bx-1]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 0B8h
		jnz	short loc_3F95
		mov	cx, ax
		mov	ah, es:[bx+2]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 50h
		jnz	short loc_3F95
		cmp	al, cl
		jnz	short loc_3F95
		mov	dx, ax
		mov	ah, es:[bx+3]
		mov	al, ah
		and	ax, 0F807h
		cmp	cx, ax
		jnz	short loc_3F95
		mov	ah, es:[bx+6]
		mov	al, ah
		and	ax, 0F807h
		cmp	ax, dx
		jnz	short loc_3F95
		mov	di, 20h
		mov	cx, word_59D2C
		mov	ax, es:[bx+4]

loc_3F85:
		cmp	ax, [di+2]
		jz	short loc_3F91
		add	di, 5
		loop	short loc_3F85
		jmp	short loc_3F97

loc_3F91:
		mov	es:[bx+4], di

loc_3F95:
		pop	cx
		ret

loc_3F97:
		pop	cx
		ret
sub_3F39		endp

; START OF FUNCTION CHUNK FOR sub_3F39
		mov	si, es:8
		xor	di, di
		add	si, es:0Ah
		adc	di, 0
		mov	dx, es:4
		mov	cx, es:6
		mov	ax, es:10h
		call	sub_3EBB
		jb	short loc_3FC6
		mov	cx, es:0Ah
		jcxz	short loc_3FC5
		call	sub_3EF4

loc_3FC5:
		clc

loc_3FC6:
		ret
; END OF FUNCTION CHUNK FOR sub_3F39

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FC7		proc far

var_6		= word ptr -6
saved_0		= word ptr  0
saved_2		= word ptr  2

		push	bp
		mov	bp, sp
		test	bp, 1
		jz	short loc_3FD5
		jmp	sub_2E2

loc_3FD5:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	ds
		push	es
		mov	ax, seg seg182
		mov	ds, ax
		sti
		les	bx, [bp+saved_2]
		push	word ptr es:[bx]
		sub	[bp+saved_2], 2
		jnz	short loc_3FF4
		call	sub_4077
		jmp	short loc_400C

loc_3FF4:
		add	bp, 6
		mov	ax, [bp+saved_0]
		xchg	[bp+var_6], ax
		mov	[bp+saved_0], ax
		call	sub_4077
		mov	ax, [bp+saved_0]
		xchg	[bp+var_6], ax
		mov	[bp+saved_0], ax

loc_400C:
		pop	bx
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:8
		call	dword ptr dword_59D36
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
sub_3FC7		endp

; ----------------------------------------------------------------------

sub_402D		proc near
		push	es
		inc	word_59DDA
		call	near ptr sub_4280
		jmp	short loc_4065

loc_4037:
		popf
		push	dx
		jnb	short loc_403E
		call	sub_410A

loc_403E:
		mov	es, word_59DDC
		mov	ax, es:1Ch
		mov	word_59DDC, ax
		cmp	byte ptr es:1Bh, 0
		jnz	short loc_4059
		call	sub_40F2
		call	sub_4274
		jmp	short loc_4064

loc_4059:
		dec	byte ptr es:1Bh
		call	sub_41B7
		call	sub_4208

loc_4064:
		pop	dx

loc_4065:
		call	sub_4258
		pushf
		cmp	dx, ax
		ja	short loc_4037
		popf
		pop	es
		mov	ax, word_59DD0
		mov	es:10h, ax
		ret
sub_402D		endp

; ----------------------------------------------------------------------

sub_4077		proc near
		inc	word_59DCC
		cmp	word ptr es:10h, 0
		jz	short loc_4092
		mov	byte ptr es:1Bh, 1
		or	byte ptr es:1Ah, 4
		jmp	short loc_40AE
		nop

loc_4092:
		or	byte ptr es:1Ah, 8
		call	sub_402D
		push	ds
		dec	ax
		mov	ds, ax
		mov	word_59D2E, es
		pop	ds
		call	word ptr es:18h
		jb	short loc_40ED
		call	sub_4208

loc_40AE:
		call	sub_4145
		mov	al, es:1Ah
		and	al, 3
		add	es:1Bh, al
		push	es
		call	sub_4258
		mov	es, word_59DDC

loc_40C4:
		mov	cx, es:1Ch
		jcxz	short loc_40EB
		cmp	ax, word_59DC8
		jnb	short loc_40EB
		push	cx
		push	ax
		cmp	byte ptr es:1Bh, 0
		jz	short loc_40DF
		xor	ax, ax
		jmp	short loc_40E5

loc_40DF:
		call	sub_4184
		call	sub_4274

loc_40E5:
		pop	cx
		pop	es
		add	ax, cx
		jmp	short loc_40C4

loc_40EB:
		pop	es
		ret

loc_40ED:
		jmp	sub_2E2
sub_4077		endp

; ----------------------------------------------------------------------

sub_40F2		proc near
		call	sub_4184
		cmp	word ptr es:18h, 4C9h
		jnz	short loc_4102
		call	word ptr word_59D30

loc_4102:
		mov	word ptr es:10h, 0
		ret
sub_40F2		endp

; ----------------------------------------------------------------------

sub_410A		proc near
		mov	ax, word_59DDC
		xor	cx, cx

loc_410F:
		inc	cx
		push	ax
		mov	es, ax
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_410F
		mov	word_59DDC, ax
		mov	ax, word_59DD6
		mov	word_59DD0, ax

loc_4124:
		pop	es
		push	cx
		mov	ax, word_59DDC
		mov	es:1Ch, ax
		mov	word_59DDC, es
		call	sub_4274
		sub	word_59DD0, ax
		call	sub_41B7
		pop	cx
		loop	short loc_4124
		mov	ax, word_59DD4
		mov	word_59DD0, ax
		ret
sub_410A		endp

; ----------------------------------------------------------------------

sub_4145		proc near
		cmp	word ptr es:0Ch, 0
		jnz	short loc_414E
		ret

loc_414E:
		cmp	byte ptr es:20h, 0EAh
		jz	short loc_4183
		mov	cx, es:2
		jcxz	short sub_4166
		mov	ax, es:10h
		mov	dx, es
		call	sub_4226
sub_4145		endp

; ----------------------------------------------------------------------

sub_4166		proc near
		mov	bx, es:10h
		mov	cx, es:0Ch
		mov	di, 20h
		cld

loc_4174:
		mov	dx, es:[di+2]
		mov	al, 0EAh
		stosb
		mov	ax, dx
		stosw
		mov	ax, bx
		stosw
		loop	short loc_4174

loc_4183:
		ret
sub_4166		endp

; ----------------------------------------------------------------------

sub_4184		proc near
		cmp	byte ptr es:20h, 0CDh
		jz	short loc_41B6
		mov	ax, es
		mov	dx, es:10h
		xor	cx, cx
		call	sub_4226
		mov	es:2, cx
		mov	cx, es:0Ch
		mov	di, 20h
		cld

loc_41A6:
		mov	dx, es:[di+1]
		mov	ax, word_59DC0
		stosw
		mov	ax, dx
		stosw
		xor	al, al
		stosb
		loop	short loc_41A6

loc_41B6:
		ret
sub_4184		endp

; ----------------------------------------------------------------------

sub_41B7		proc near
		mov	ax, word_59DD0
		mov	dx, es:10h
		mov	es:10h, ax
		mov	cx, es:8
		inc	cx
		shr	cx, 1
		xor	si, si
		cld
		cmp	ax, dx
		jb	short loc_41D8
		mov	si, cx
		dec	si
		shl	si, 1
		std

loc_41D8:
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
		mov	word_59D2E, es
		inc	ax
		pop	ds
		cmp	byte ptr es:20h, 0CDh
		jz	short loc_4207
		call	sub_4232
		mov	cx, es:0Ch
		mov	di, 23h
		cld

loc_4201:
		stosw
		add	di, 3
		loop	short loc_4201

loc_4207:
		ret
sub_41B7		endp

; ----------------------------------------------------------------------

sub_4208		proc near
		call	sub_4274
		add	word_59DD0, ax
		push	ds
		mov	ax, seg seg183

loc_4213:
		mov	ds, ax
		mov	ax, word_59D3C
		or	ax, ax
		jnz	short loc_4213
		mov	word_59D3C, es
		mov	es:1Ch, ax
		pop	ds
		ret
sub_4208		endp

; ----------------------------------------------------------------------

sub_4226		proc near
		call	sub_4232
		or	bx, bx
		jz	short loc_4231
		xchg	ss:[bx+2], cx

loc_4231:
		ret
sub_4226		endp

; ----------------------------------------------------------------------

sub_4232		proc near
		xor	bx, bx
		push	cx
		push	bp
		jmp	short loc_423C

loc_4238:
		shl	cx, 1
		mov	bp, cx

loc_423C:
		mov	cx, [bp]
		shr	cx, 1
		jz	short loc_4255
		jb	short loc_4238
		cmp	dx, [bp+4]
		jnz	short loc_4238
		mov	[bp+4], ax
		or	bx, bx
		jnz	short loc_4238
		mov	bx, bp
		jmp	short loc_4238

loc_4255:
		pop	bp
		pop	cx
		ret
sub_4232		endp

; ----------------------------------------------------------------------

sub_4258		proc near
		mov	ax, word_59DDC
		or	ax, ax
		jz	short loc_426B
		mov	es, ax
		mov	ax, es:10h
		sub	ax, word_59DD0
		jnb	short loc_4273

loc_426B:
		mov	ax, word_59DD6
		sub	ax, word_59DD0
		stc

loc_4273:
		ret
sub_4258		endp

; ----------------------------------------------------------------------

sub_4274		proc near
		mov	ax, es:8
		add	ax, 11h
		mov	cl, 4
		shr	ax, cl
		ret
sub_4274		endp

; ----------------------------------------------------------------------

sub_4280		proc far
		mov	cl, 4
		mov	ax, es:8
		add	ax, 11h
		shr	ax, cl
		mov	dx, es:0Ah
		add	dx, 0Fh
		shr	dx, cl
		add	dx, ax
		ret
sub_4280		endp

; START OF FUNCTION CHUNK FOR sub_4280
		push	ds
		push	es
		mov	ds, cs:8
		cmp	ax, word_59DD4
		jb	short loc_42C8
		cmp	ax, word_59DD6
		jnb	short loc_42C8
		dec	ax
		mov	es, ax
		mov	es, es:0Eh
		inc	ax
		mov	bx, word_59DC0
		cmp	bx, es:0
		jnz	short loc_42C8
		cmp	ax, es:10h
		mov	ax, es
		jz	short loc_42CB

loc_42C8:
		xor	ax, ax
		stc

loc_42CB:
		pop	es
		pop	ds
		retf
; END OF FUNCTION CHUNK FOR sub_4280

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42CE		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_2], 0
		push	ds
		mov	ds, cs:8
		push	si
		push	di
		mov	bx, bp
		mov	ax, word_59DC0
		mov	dx, word_59DD4
		jmp	short loc_42EF

loc_42EB:
		shl	si, 1
		mov	bx, si

loc_42EF:
		cmp	bx, cx
		jnb	short loc_431D
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_431D
		jb	short loc_42EB
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_42EB
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jnz	short loc_42EB
		cmp	es:[di], ax
		jnz	short loc_42EB
		mov	[bp+var_2], 1
		mov	es:[di+2], di
		jmp	short loc_42EB

loc_431D:
		cmp	[bp+var_2], 1
		jz	short loc_432A
		jmp	short loc_435F
		nop

loc_4326:
		shl	si, 1
		mov	bx, si

loc_432A:
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_435F
		jb	short loc_4326
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_4326
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jz	short loc_4326
		cmp	es:0, ax
		jnz	short loc_4326
		cmp	word ptr es:2, 0
		jnz	short loc_4326
		xchg	es:2, di
		mov	ss:[bx+2], di
		jmp	short loc_4326

loc_435F:
		pop	di
		pop	si
		pop	ds
		mov	sp, bp
		pop	bp
		retf
sub_42CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4366		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:8
		mov	es, [bp+arg_2]
		mov	cx, word_59DC0
		cmp	cx, es:0
		jnz	short loc_43BB
		cmp	word ptr es:10h, 0
		jz	short loc_438D
		cmp	byte ptr es:20h, 0CDh
		jnz	short loc_43B4

loc_438D:
		mov	[bp+arg_2], 0
		push	si
		push	di
		call	sub_4077
		pop	di
		pop	si
		mov	bx, [bp+arg_0]
		push	es
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:8
		call	dword ptr dword_59D36
		pop	es

loc_43B4:
		mov	ax, es:10h
		mov	[bp+arg_2], ax

loc_43BB:
		pop	ds
		pop	bp
		retf
sub_4366		endp

; ----------------------------------------------------------------------

sub_43BE		proc far
		push	ds
		push	si
		push	di
		mov	ax, seg seg182
		mov	ds, ax
		call	sub_3D6E
		mov	bx, word_59DCA
		mov	ax, seg dseg
		mov	ds, ax
		mov	ax, seg dseg
		mov	es, ax
		cmp	bx, es:4CF6h
		jnb	short loc_43E5
		mov	bx, es:4CF6h
		jmp	short loc_43E7

loc_43E5:
		shl	bx, 1

loc_43E7:
		inc	bx
		push	bx
		mov	ax, 10h
		mul	bx
		push	dx
		push	ax
		call	sub_458F5
		pop	bx
		pop	bx
		pop	bx
		mov	cx, ax
		or	cx, dx
		jcxz	short loc_4414
		inc	dx
		add	bx, dx
		push	dx
		push	bx
		xor	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_3AE3
		or	ax, ax
		jnz	short loc_4414
sub_43BE		endp
seg001		ends
