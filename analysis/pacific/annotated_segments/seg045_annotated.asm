seg045		segment	para public 'CODE' use16
		assume cs:seg045
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C2h, 10h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CA55		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 5801h
		int	21h
		jb	short loc_1CA64
		xor	ax, ax

loc_1CA64:
		pop	bp
		retf
sub_1CA55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CA66		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 5803h
		int	21h
		jb	short loc_1CA75
		xor	ax, ax

loc_1CA75:
		pop	bp
		retf
sub_1CA66		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CA77		proc far

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
		jnz	short loc_1CA93
		mov	ax, 1
		jmp	short loc_1CA95

loc_1CA93:
		xor	ax, ax

loc_1CA95:
		or	al, al
		jz	short loc_1CAC4
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
		jnz	short loc_1CAC4
		mov	word ptr [bp+var_4+2], bx
		mov	word ptr [bp+var_4], 0

loc_1CAC4:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_1CA77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CACC		proc far

var_4		= dword ptr -4
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, 1
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		jnz	short loc_1CAE3
		mov	ax, 1
		jmp	short loc_1CAE5

loc_1CAE3:
		xor	ax, ax

loc_1CAE5:
		or	al, al
		jz	short loc_1CB03
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

loc_1CB03:
		mov	ax, cx
		leave
		retf
sub_1CACC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CB07		proc far

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
		call	near ptr sub_1CA66
		pop	cx
		or	ax, ax
		jnz	short loc_1CB5A
		push	81h
		push	cs
		call	near ptr sub_1CA55
		pop	cx
		or	ax, ax
		jnz	short loc_1CB5A
		mov	eax, [bp+arg_0]
		add	eax, 0Fh
		shr	eax, 4
		mov	bx, ax
		mov	ah, 48h
		int	21h
		jb	short loc_1CB5A
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], 0

loc_1CB5A:
		push	[bp+var_6]
		push	cs
		call	near ptr sub_1CA66
		pop	cx
		push	[bp+var_8]
		push	cs
		call	near ptr sub_1CA55
		pop	cx
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_1CB07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CB72		proc far

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
		call	near ptr sub_1CA66
		pop	cx
		or	ax, ax
		jnz	short loc_1CBA4
		mov	es, [bp+arg_2]
		mov	ah, 49h
		int	21h
		jb	short loc_1CB9C
		xor	si, si

loc_1CB9C:
		push	[bp+var_2]
		push	cs
		call	near ptr sub_1CA66
		pop	cx

loc_1CBA4:
		mov	ax, si
		pop	si
		leave
		retf
sub_1CB72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CBA9		proc far

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
		les	bx, word_7AB7E
		mov	al, es:[bx]
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_1CBD0
		call	PagedMemory_DetectDriverSignatureA_63627

loc_1CBD0:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_1CA77
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_1CBEA
		mov	byte ptr [si], 2
		jmp	short loc_1CC2D

loc_1CBEA:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_1CB07
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_1CC04
		mov	byte ptr [si], 1
		jmp	short loc_1CC2D

loc_1CC04:
		call	PagedMemory_DetectDriverSignatureB_63638
		push	large 0FFFF0000h
		push	large [bp+arg_0]
		call	sub_65D77
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_1CC28
		mov	byte ptr [si], 0

loc_1CC28:
		call	PagedMemory_DetectDriverSignatureA_63627

loc_1CC2D:
		cmp	[bp+var_5], 0
		jz	short loc_1CC38
		call	PagedMemory_DetectDriverSignatureB_63638

loc_1CC38:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_1CBA9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CC41		proc far

arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, 0FFFFh
		les	bx, word_7AB7E
		mov	al, es:[bx]
		cbw
		mov	di, ax
		or	di, di
		jz	short loc_1CC5C
		call	PagedMemory_DetectDriverSignatureA_63627

loc_1CC5C:
		cmp	[bp+arg_4], 0
		jnz	short loc_1CC83
		call	PagedMemory_DetectDriverSignatureB_63638
		push	0
		push	2
		lea	ax, word ptr [bp+arg_0]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		call	PagedMemory_DetectDriverSignatureA_63627
		xor	si, si
		jmp	short loc_1CCA6

loc_1CC83:
		cmp	[bp+arg_4], 2
		jnz	short loc_1CC93
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_1CACC
		jmp	short loc_1CCA1

loc_1CC93:
		cmp	[bp+arg_4], 1
		jnz	short loc_1CCA6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_1CB72

loc_1CCA1:
		add	sp, 4
		mov	si, ax

loc_1CCA6:
		or	di, di
		jz	short loc_1CCAF
		call	PagedMemory_DetectDriverSignatureB_63638

loc_1CCAF:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_1CC41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CCB5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+9], 0
		jz	short loc_1CCEA
		cmp	dword ptr [si+4], 0
		jz	short loc_1CCEA
		mov	al, [si+8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1CE74
		pop	cx
		push	dx
		push	ax
		push	cs
		call	near ptr sub_1CC41
		add	sp, 6
		or	ax, ax
		jz	short loc_1CCEA
		push	1600h
		call	sub_1DDFE
		pop	cx

loc_1CCEA:
		mov	dword ptr [si+4], 0
		pop	si
		pop	bp
		retf
sub_1CCB5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CCF5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_1CCB5
		pop	cx
		pop	bp
		retf
sub_1CCF5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CD03		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1CD34
		mov	word ptr [si], 0D84h
		push	si
		push	cs
		call	near ptr sub_1CCB5
		pop	cx
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_1CD34
		push	si
		call	sub_3B2
		pop	cx

loc_1CD34:
		pop	di
		pop	si
		pop	bp
		retf
sub_1CD03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CD38		proc far

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
		call	near ptr sub_1CCB5
		pop	cx
		lea	ax, [bp+var_2]
		push	ax
		push	large [bp+arg_2]
		push	cs
		call	near ptr sub_1CBA9
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_1CD88
		cmp	[bp+arg_6], 0
		jz	short loc_1CD88
		call	PagedMemory_DetectDriverSignatureB_63638
		or	di, di
		jz	short loc_1CD7F
		push	di
		call	Runtime_FatalErrorHandler_68BA2
		jmp	short loc_1CD87

loc_1CD7F:
		push	1601h
		call	sub_1DDFE

loc_1CD87:
		pop	cx

loc_1CD88:
		cmp	[bp+var_6], 0
		jz	short loc_1CDA1
		mov	byte ptr [si+9], 1
		mov	al, byte ptr [bp+var_2]
		mov	[si+8], al
		mov	eax, [bp+var_6]
		mov	[si+4], eax

loc_1CDA1:
		pop	di
		pop	si
		leave
		retf
sub_1CD38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CDA5		proc far

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
		call	near ptr sub_1CCB5
		pop	cx
		mov	eax, [di]
		mov	[si+4], eax
		cmp	byte ptr [di+4], 3
		jnz	short loc_1CDC9
		mov	byte ptr [si+8], 4
		jmp	short loc_1CDE3

loc_1CDC9:
		cmp	word ptr [si+6], 9FFFh
		ja	short loc_1CDD9
		mov	ax, [si+6]
		cmp	ax, word_7684C
		jnb	short loc_1CDDF

loc_1CDD9:
		mov	byte ptr [si+8], 3
		jmp	short loc_1CDE3

loc_1CDDF:
		mov	byte ptr [si+8], 0

loc_1CDE3:
		mov	byte ptr [si+9], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_1CDA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CDEB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_1CCB5
		pop	cx
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		mov	[si+4], eax
		cmp	byte ptr es:[bx+4], 3
		jnz	short loc_1CE10
		mov	byte ptr [si+8], 4
		jmp	short loc_1CE2A

loc_1CE10:
		cmp	word ptr [si+6], 9FFFh
		ja	short loc_1CE20
		mov	ax, [si+6]
		cmp	ax, word_7684C
		jnb	short loc_1CE26

loc_1CE20:
		mov	byte ptr [si+8], 3
		jmp	short loc_1CE2A

loc_1CE26:
		mov	byte ptr [si+8], 0

loc_1CE2A:
		mov	byte ptr [si+9], 0
		pop	si
		pop	bp
		retf
sub_1CDEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_311CF (sub_311CF de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_60507 (sub_60507 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) puis GlyphObject_AllocateBuffer_604C9 puis
; GlyphObject_ComputeMetrics_60456.
; ==============================================================================================
GlyphObject_ConstructWithBuffer_1CE31		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CE4A
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CE6F

loc_1CE4A:
		mov	word ptr [si], 0D7Ch
		mov	ax, word_7AFA2
		mov	[si+2], ax
		mov	word_7AFA2, si
		mov	word ptr [si], 0D84h
		mov	dword ptr [si+4], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1CDA5
		add	sp, 4

loc_1CE6F:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_ConstructWithBuffer_1CE31		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CE74		proc far

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
		ja	short loc_1CE99
		shl	bx, 1
		jmp	cs:off_1CF12[bx]	; switch jump

loc_1CE91:
		mov	dx, [si+6]
		mov	ax, [si+4]
		jmp	short loc_1CF0F

loc_1CE99:
		push	120Bh
		call	sub_1DDFE
		pop	cx

loc_1CEA2:
		les	bx, word_7AB7E
		mov	al, es:[bx]
		mov	[bp+var_5], al
		cmp	byte ptr [si+8], 4
		jnz	short loc_1CECC
		call	PagedMemory_DetectDriverSignatureA_63627
		push	0
		push	3
		push	large [si+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		jmp	short loc_1CEF8

loc_1CECC:
		call	PagedMemory_DetectDriverSignatureB_63638
		push	large [si+4]
		call	sub_63D74
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_A], eax
		call	PagedMemory_DetectDriverSignatureA_63627
		push	1
		push	large [bp+var_A]
		call	sub_63C15
		add	sp, 6

loc_1CEF8:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	[bp+var_5], 0
		jz	short loc_1CF09
		call	PagedMemory_DetectDriverSignatureB_63638

loc_1CF09:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_1CF0F:
		pop	si
		leave
		retf
sub_1CE74		endp

; START OF FUNCTION CHUNK FOR sub_1CE74
off_1CF12	dw offset loc_1CE91
		dw offset loc_1CE91
		dw offset loc_1CE91
		dw offset loc_1CEA2
		dw offset loc_1CEA2
; END OF FUNCTION CHUNK FOR sub_1CE74

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CF1C		proc far

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
		jz	short loc_1CF8E
		cmp	byte ptr [si+8], 4
		jnz	short loc_1CF57
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		and	eax, 0FFFFFEh
		add	eax, 10h
		mov	[bp+var_4], eax
		jmp	short loc_1CF8E

loc_1CF57:
		cmp	byte ptr [si+8], 3
		jnz	short loc_1CF8E
		les	bx, word_7AB7E
		mov	al, es:[bx]
		mov	byte ptr [bp+var_8+3], al
		call	PagedMemory_DetectDriverSignatureB_63638
		push	large [si+4]
		call	sub_63D74
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	al, byte ptr [bp+var_8+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1CF8E
		call	PagedMemory_DetectDriverSignatureA_63627
sub_1CF1C		endp

; START OF FUNCTION CHUNK FOR sub_1CF1C

loc_1CF8E:
		db 66h, 8Bh
; END OF FUNCTION CHUNK FOR sub_1CF1C
seg045		ends
