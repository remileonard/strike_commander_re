seg032		segment	para public 'CODE' use16
		assume cs:seg032
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0F9h, 9, 7Ch, 0E7h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E68		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 5801h
		int	21h
		jb	short loc_18E77
		xor	ax, ax

loc_18E77:
		pop	bp
		retf
sub_18E68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E79		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 5803h
		int	21h
		jb	short loc_18E88
		xor	ax, ax

loc_18E88:
		pop	bp
		retf
sub_18E79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E8A		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 0
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		jnz	short loc_18EA6
		mov	ax, 1
		jmp	short loc_18EA8

loc_18EA6:
		xor	ax, ax

loc_18EA8:
		or	al, al
		jz	short loc_18ED7
		mov	ax, 4310h
		int	2Fh
		mov	word ptr [bp+var_8+2], es
		mov	word ptr [bp+var_8], bx
		mov	eax, [bp+arg_0]
		add	eax, 0Fh
		shr	eax, 4
		mov	dx, ax
		mov	ah, 10h
		call	dword ptr [bp+var_8]
		cmp	ax, 1
		jnz	short loc_18ED7
		mov	word ptr [bp+var_4+2], bx
		mov	word ptr [bp+var_4], 0

loc_18ED7:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_18E8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18EDF		proc far

var_4		= dword ptr -4
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, 1
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		jnz	short loc_18EF6
		mov	ax, 1
		jmp	short loc_18EF8

loc_18EF6:
		xor	ax, ax

loc_18EF8:
		or	al, al
		jz	short loc_18F16
		mov	ax, 4310h
		int	2Fh
		mov	word ptr [bp+var_4+2], es
		mov	word ptr [bp+var_4], bx
		mov	dx, [bp+arg_2]
		mov	ah, 11h
		call	dword ptr [bp+var_4]
		mov	cx, ax
		neg	cx
		sbb	cx, cx
		inc	cx

loc_18F16:
		mov	ax, cx
		leave
		retf
sub_18EDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18F1A		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 0
		mov	ax, 5802h
		int	21h
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	ax, 5800h
		int	21h
		mov	[bp+var_8], ax
		push	1
		push	cs
		call	near ptr sub_18E79
		pop	cx
		or	ax, ax
		jnz	short loc_18F6D
		push	81h
		push	cs
		call	near ptr sub_18E68
		pop	cx
		or	ax, ax
		jnz	short loc_18F6D
		mov	eax, [bp+arg_0]
		add	eax, 0Fh
		shr	eax, 4
		mov	bx, ax
		mov	ah, 48h
		int	21h
		jb	short loc_18F6D
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], 0

loc_18F6D:
		push	[bp+var_6]
		push	cs
		call	near ptr sub_18E79
		pop	cx
		push	[bp+var_8]
		push	cs
		call	near ptr sub_18E68
		pop	cx
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_18F1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18F85		proc far

var_2		= word ptr -2
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, 1
		mov	ax, 5802h
		int	21h
		mov	ah, 0
		mov	[bp+var_2], ax
		push	1
		push	cs
		call	near ptr sub_18E79
		pop	cx
		or	ax, ax
		jnz	short loc_18FB7
		mov	es, [bp+arg_2]
		mov	ah, 49h
		int	21h
		jb	short loc_18FAF
		xor	si, si

loc_18FAF:
		push	[bp+var_2]
		push	cs
		call	near ptr sub_18E79
		pop	cx

loc_18FB7:
		mov	ax, si
		pop	si
		leave
		retf
sub_18F85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18FBC		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		les	bx, word_5D974
		mov	al, es:[bx]
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_18FE3
		call	PagedMemory_DetectDriverSignatureA_42BF9

loc_18FE3:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_18E8A
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_18FFD
		mov	byte ptr [si], 2
		jmp	short loc_19040

loc_18FFD:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_18F1A
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_19017
		mov	byte ptr [si], 1
		jmp	short loc_19040

loc_19017:
		call	PagedMemory_DetectDriverSignatureB_42C0A
		push	large 0FFFF0000h
		push	large [bp+arg_0]
		call	sub_45349
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_1903B
		mov	byte ptr [si], 0

loc_1903B:
		call	PagedMemory_DetectDriverSignatureA_42BF9

loc_19040:
		cmp	[bp+var_5], 0
		jz	short loc_1904B
		call	PagedMemory_DetectDriverSignatureB_42C0A

loc_1904B:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_18FBC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19054		proc far

arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, 0FFFFh
		les	bx, word_5D974
		mov	al, es:[bx]
		cbw
		mov	di, ax
		or	di, di
		jz	short loc_1906F
		call	PagedMemory_DetectDriverSignatureA_42BF9

loc_1906F:
		cmp	[bp+arg_4], 0
		jnz	short loc_19096
		call	PagedMemory_DetectDriverSignatureB_42C0A
		push	0
		push	2
		lea	ax, word ptr [bp+arg_0]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		call	PagedMemory_DetectDriverSignatureA_42BF9
		xor	si, si
		jmp	short loc_190B9

loc_19096:
		cmp	[bp+arg_4], 2
		jnz	short loc_190A6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_18EDF
		jmp	short loc_190B4

loc_190A6:
		cmp	[bp+arg_4], 1
		jnz	short loc_190B9
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_18F85

loc_190B4:
		add	sp, 4
		mov	si, ax

loc_190B9:
		or	di, di
		jz	short loc_190C2
		call	PagedMemory_DetectDriverSignatureB_42C0A

loc_190C2:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_19054		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_190C8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+9], 0
		jz	short loc_190FD
		cmp	dword ptr [si+4], 0
		jz	short loc_190FD
		mov	al, [si+8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_19287
		pop	cx
		push	dx
		push	ax
		push	cs
		call	near ptr sub_19054
		add	sp, 6
		or	ax, ax
		jz	short loc_190FD
		push	1600h
		call	sub_9D47
		pop	cx

loc_190FD:
		mov	dword ptr [si+4], 0
		pop	si
		pop	bp
		retf
sub_190C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19108		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_190C8
		pop	cx
		pop	bp
		retf
sub_19108		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19116		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_19147
		mov	word ptr [si], 975h
		push	si
		push	cs
		call	near ptr sub_190C8
		pop	cx
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_19147
		push	si
		call	sub_33B
		pop	cx

loc_19147:
		pop	di
		pop	si
		pop	bp
		retf
sub_19116		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1914B		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		push	si
		push	cs
		call	near ptr sub_190C8
		pop	cx
		lea	ax, [bp+var_2]
		push	ax
		push	large [bp+arg_2]
		push	cs
		call	near ptr sub_18FBC
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_1919B
		cmp	[bp+arg_6], 0
		jz	short loc_1919B
		call	PagedMemory_DetectDriverSignatureB_42C0A
		or	di, di
		jz	short loc_19192
		push	di
		call	sub_9D78
		jmp	short loc_1919A

loc_19192:
		push	1601h
		call	sub_9D47

loc_1919A:
		pop	cx

loc_1919B:
		cmp	[bp+var_6], 0
		jz	short loc_191B4
		mov	byte ptr [si+9], 1
		mov	al, byte ptr [bp+var_2]
		mov	[si+8], al
		mov	eax, [bp+var_6]
		mov	[si+4], eax

loc_191B4:
		pop	di
		pop	si
		leave
		retf
sub_1914B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_191B8		proc far

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
		call	near ptr sub_190C8
		pop	cx
		mov	eax, [di]
		mov	[si+4], eax
		cmp	byte ptr [di+4], 3
		jnz	short loc_191DC
		mov	byte ptr [si+8], 4
		jmp	short loc_191F6

loc_191DC:
		cmp	word ptr [si+6], 9FFFh
		ja	short loc_191EC
		mov	ax, [si+6]
		cmp	ax, word_59E3D
		jnb	short loc_191F2

loc_191EC:
		mov	byte ptr [si+8], 3
		jmp	short loc_191F6

loc_191F2:
		mov	byte ptr [si+8], 0

loc_191F6:
		mov	byte ptr [si+9], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_191B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_191FE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_190C8
		pop	cx
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		mov	[si+4], eax
		cmp	byte ptr es:[bx+4], 3
		jnz	short loc_19223
		mov	byte ptr [si+8], 4
		jmp	short loc_1923D

loc_19223:
		cmp	word ptr [si+6], 9FFFh
		ja	short loc_19233
		mov	ax, [si+6]
		cmp	ax, word_59E3D
		jnb	short loc_19239

loc_19233:
		mov	byte ptr [si+8], 3
		jmp	short loc_1923D

loc_19239:
		mov	byte ptr [si+8], 0

loc_1923D:
		mov	byte ptr [si+9], 0
		pop	si
		pop	bp
		retf
sub_191FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
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
GlyphObject_ConstructWithBuffer_19244		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1925D
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_19282

loc_1925D:
		mov	word ptr [si], 96Dh
		mov	ax, word_5DD68
		mov	[si+2], ax
		mov	word_5DD68, si
		mov	word ptr [si], 975h
		mov	dword ptr [si+4], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_191B8
		add	sp, 4

loc_19282:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_ConstructWithBuffer_19244		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19287		proc far

var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+8]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_192AC
		shl	bx, 1
		jmp	cs:off_19325[bx]	; switch jump

loc_192A4:
		mov	dx, [si+6]
		mov	ax, [si+4]
		jmp	short loc_19322

loc_192AC:
		push	120Bh
		call	sub_9D47
		pop	cx

loc_192B5:
		les	bx, word_5D974
		mov	al, es:[bx]
		mov	[bp+var_5], al
		cmp	byte ptr [si+8], 4
		jnz	short loc_192DF
		call	PagedMemory_DetectDriverSignatureA_42BF9
		push	0
		push	3
		push	large [si+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1930B

loc_192DF:
		call	PagedMemory_DetectDriverSignatureB_42C0A
		push	large [si+4]
		call	sub_43346
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_A], eax
		call	PagedMemory_DetectDriverSignatureA_42BF9
		push	1
		push	large [bp+var_A]
		call	sub_431E7
		add	sp, 6

loc_1930B:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	[bp+var_5], 0
		jz	short loc_1931C
		call	PagedMemory_DetectDriverSignatureB_42C0A

loc_1931C:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_19322:
		pop	si
		leave
		retf
sub_19287		endp

; START OF FUNCTION CHUNK FOR sub_19287
off_19325	dw offset loc_192A4
		dw offset loc_192A4
		dw offset loc_192A4
		dw offset loc_192B5
		dw offset loc_192B5
; END OF FUNCTION CHUNK FOR sub_19287

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1932F		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		cmp	dword ptr [si+4], 0
		jz	short loc_193A1
		cmp	byte ptr [si+8], 4
		jnz	short loc_1936A
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		and	eax, 0FFFFFEh
		add	eax, 10h
		mov	[bp+var_4], eax
		jmp	short loc_193A1

loc_1936A:
		cmp	byte ptr [si+8], 3
		jnz	short loc_193A1
		les	bx, word_5D974
		mov	al, es:[bx]
		mov	byte ptr [bp+var_8+3], al
		call	PagedMemory_DetectDriverSignatureB_42C0A
		push	large [si+4]
		call	sub_43346
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	al, byte ptr [bp+var_8+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_193A1
sub_1932F		endp

; START OF FUNCTION CHUNK FOR sub_1932F
		db 9Ah
		mov	[bx+di], ax
		cmpsw
; END OF FUNCTION CHUNK FOR sub_1932F
seg032		ends
