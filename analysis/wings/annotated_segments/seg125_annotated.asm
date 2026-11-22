seg125		segment	para public 'CODE' use16
		assume cs:seg125
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E8h, 51h, 0FFh, 83h, 0C4h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48858		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, dx
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+2], eax
		mov	al, [bp+var_5]
		mov	[si+6], al
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	eax, [di+6]
		mov	[si+8], eax
		mov	bx, dx
		cmp	byte ptr [bx+5], 1
		jnz	short loc_488A9
		mov	di, dx
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+7], 1

loc_488A9:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		mov	[si+0Eh], ax
		mov	byte ptr [si+16h], 0FFh
		mov	word ptr [si+10h], 2
		mov	word ptr [si+12h], 0
		push	2Dh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		pop	di
		pop	si
		leave
		retf
sub_48858		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_AllocateBuffer_69123 (sub_69123 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_AllocateBuffer_31191 (sub_31191 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GlyphObject_AllocateBuffer_604C9 (sub_604C9 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (sub_658). Référencée par sub_60507.
; ==============================================================================================
GlyphObject_AllocateBuffer_488D3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_488EC
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4890C

loc_488EC:
		mov	word ptr [si], 4092h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 40BAh

loc_4890C:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_AllocateBuffer_488D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_1CE31 (sub_1CE31 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_311CF (sub_311CF de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_60507 (sub_60507 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) puis GlyphObject_AllocateBuffer_604C9 puis
; GlyphObject_ComputeMetrics_60456.
; ==============================================================================================
GlyphObject_ConstructWithBuffer_48911		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4892A
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_48955

loc_4892A:
		mov	word ptr [si], 4092h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 40BAh
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_48858
		add	sp, 4

loc_48955:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_ConstructWithBuffer_48911		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4895A		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		cmp	byte ptr [si+6], 3
		jnz	short loc_48989
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_4898F

loc_48989:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_4898F:
		push	dx
		push	ax
		push	41h
		call	sub_47C50
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf
sub_4895A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_489A7		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		cmp	byte ptr [si+6], 3
		jnz	short loc_489D6
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_489DC

loc_489D6:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_489DC:
		push	dx
		push	ax
		push	41h
		call	sub_47C50
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf
sub_489A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_489F4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dl, [bp+arg_4]
		cmp	byte ptr [si+16h], 0FFh
		jz	short loc_48A4B
		mov	al, [si+16h]
		push	ax
		mov	al, dl
		mov	ah, 0
		push	ax
		cmp	byte ptr [si+6], 3
		jnz	short loc_48A2E
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_48A34

loc_48A2E:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_48A34:
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	sub_49F14
		add	sp, 0Eh
		jmp	short loc_48A88

loc_48A4B:
		mov	al, dl
		mov	ah, 0
		push	ax
		cmp	byte ptr [si+6], 3
		jnz	short loc_48A6D
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_48A73

loc_48A6D:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_48A73:
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	sub_4A194
		add	sp, 0Ch

loc_48A88:
		pop	di
		pop	si
		pop	bp
		retf
sub_489F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48A8C		proc far

var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 20h
		jnz	short loc_48AA1
		mov	ax, [si+14h]
		jmp	short loc_48ADD

loc_48AA1:
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		cmp	byte ptr [si+6], 3
		jnz	short loc_48AC6
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_48ACC

loc_48AC6:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_48ACC:
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	sub_47C50
		mov	ax, [bp+var_4]
		inc	ax

loc_48ADD:
		pop	si
		leave
		retf
sub_48A8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48AE0		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		cmp	byte ptr [si+6], 3
		jnz	short loc_48B0F
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_48B15

loc_48B0F:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_48B15:
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	sub_47C50
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	si
		leave
		retf
sub_48AE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48B30		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[si+16h], al
		xor	ax, ax
		pop	si
		pop	bp
		retf
sub_48B30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48B42		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_48B42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48B4C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [di]
		mov	[si+16h], al
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_48B4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48B62		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_48B62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48B6C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_48BEB
		mov	word ptr [si], 40BAh
		cmp	byte ptr [si+6], 3
		jnz	short loc_48B9C
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_48BA2

loc_48B9C:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_48BA2:
		or	ax, dx
		cmp	byte ptr [si+7], 0
		jz	short loc_48BCA
		cmp	dword ptr [si+2], 0
		jz	short loc_48BCA
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_48BCA

loc_48BCA:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_48BEB
		push	si
		call	sub_33B
		pop	cx

loc_48BEB:
		pop	di
		pop	si
		pop	bp
		retf
sub_48B6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48BEF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_48C49
		mov	word ptr [si], 4092h
		cmp	byte ptr [si+7], 0
		jz	short loc_48C28
		cmp	dword ptr [si+2], 0
		jz	short loc_48C28
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_48C28

loc_48C28:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
sub_48BEF		endp
seg125		ends
