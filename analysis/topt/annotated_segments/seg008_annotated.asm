seg008		segment	para public 'CODE' use16
		assume cs:seg008
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 66h, 0C7h, 6, 0B6h, 60h, 0, 0, 0, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_593C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 5801h
		int	21h
		jb	short loc_594B
		xor	ax, ax

loc_594B:
		pop	bp
		retf
sub_593C		endp

; START OF FUNCTION CHUNK FOR sub_593C
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_593C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_594F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 5803h
		int	21h
		jb	short loc_595E
		xor	ax, ax

loc_595E:
		pop	bp
		retf
sub_594F		endp

; START OF FUNCTION CHUNK FOR sub_594F
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_594F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5962		proc far

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
		jnz	short loc_597E
		mov	ax, 1
		jmp	short loc_5980

loc_597E:
		xor	ax, ax

loc_5980:
		or	al, al
		jz	short loc_59AF
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
		jnz	short loc_59AF
		mov	word ptr [bp+var_4+2], bx
		mov	word ptr [bp+var_4], 0

loc_59AF:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_5962		endp

; START OF FUNCTION CHUNK FOR sub_5962
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5962

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59B9		proc far

var_4		= dword ptr -4
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, 1
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		jnz	short loc_59D1
		mov	ax, 1
		jmp	short loc_59D3

loc_59D1:
		xor	ax, ax

loc_59D3:
		or	al, al
		jz	short loc_59F1
		mov	ax, 4310h
		int	2Fh
		mov	word ptr [bp+var_4+2], es
		mov	word ptr [bp+var_4], bx
		mov	dx, [bp+arg_2]
		mov	ah, 11h
		call	dword ptr [bp+var_4]
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	si, ax

loc_59F1:
		mov	ax, si
		pop	si
		leave
		retf
sub_59B9		endp

; START OF FUNCTION CHUNK FOR sub_59B9
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_59B9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59F9		proc far

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
		call	near ptr sub_594F
		add	sp, 2
		or	ax, ax
		jnz	short loc_5A50
		push	81h
		push	cs
		call	near ptr sub_593C
		add	sp, 2
		or	ax, ax
		jnz	short loc_5A50
		mov	eax, [bp+arg_0]
		add	eax, 0Fh
		shr	eax, 4
		mov	bx, ax
		mov	ah, 48h
		int	21h
		jb	short loc_5A50
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], 0

loc_5A50:
		push	[bp+var_6]
		push	cs
		call	near ptr sub_594F
		add	sp, 2
		push	[bp+var_8]
		push	cs
		call	near ptr sub_593C
		add	sp, 2
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_59F9		endp

; START OF FUNCTION CHUNK FOR sub_59F9
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_59F9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A6E		proc far

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
		call	near ptr sub_594F
		add	sp, 2
		or	ax, ax
		jnz	short loc_5AA4
		mov	es, [bp+arg_2]
		mov	ah, 49h
		int	21h
		jb	short loc_5A9A
		xor	si, si

loc_5A9A:
		push	[bp+var_2]
		push	cs
		call	near ptr sub_594F
		add	sp, 2

loc_5AA4:
		mov	ax, si
		pop	si
		leave
		retf
sub_5A6E		endp

; START OF FUNCTION CHUNK FOR sub_5A6E
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5A6E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5AAC		proc far

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
		les	bx, word_4CF9E
		mov	al, es:[bx]
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_5AD3
		call	PagedMemory_DetectDriverSignatureA_30BB4

loc_5AD3:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_5962
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_5AED
		mov	byte ptr [si], 2
		jmp	short loc_5B2E

loc_5AED:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_59F9
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_5B07
		mov	byte ptr [si], 1
		jmp	short loc_5B2E

loc_5B07:
		call	PagedMemory_DetectDriverSignatureB_30BC5
		push	0FFFFh
		push	0
		push	large [bp+arg_0]
		call	sub_333D9
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_5B29
		mov	byte ptr [si], 0

loc_5B29:
		call	PagedMemory_DetectDriverSignatureA_30BB4

loc_5B2E:
		cmp	[bp+var_5], 0
		jz	short loc_5B39
		call	PagedMemory_DetectDriverSignatureB_30BC5

loc_5B39:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_5AAC		endp

; START OF FUNCTION CHUNK FOR sub_5AAC
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5AAC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B45		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, 0FFFFh
		les	bx, word_4CF9E
		mov	al, es:[bx]
		cbw
		mov	di, ax
		or	di, di
		jz	short loc_5B60
		call	PagedMemory_DetectDriverSignatureA_30BB4

loc_5B60:
		cmp	[bp+arg_4], 0
		jnz	short loc_5B87
		call	PagedMemory_DetectDriverSignatureB_30BC5
		push	0
		push	2
		lea	ax, [bp+arg_0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		call	PagedMemory_DetectDriverSignatureA_30BB4
		xor	si, si
		jmp	short loc_5BB3

loc_5B87:
		cmp	[bp+arg_4], 2
		jnz	short loc_5B9E
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_59B9
		add	sp, 4
		mov	si, ax
		jmp	short loc_5BB3

loc_5B9E:
		cmp	[bp+arg_4], 1
		jnz	short loc_5BB3
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_5A6E
		add	sp, 4
		mov	si, ax

loc_5BB3:
		or	di, di
		jz	short loc_5BBC
		call	PagedMemory_DetectDriverSignatureB_30BC5

loc_5BBC:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_5B45		endp

; START OF FUNCTION CHUNK FOR sub_5B45
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_5B45

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5BC6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+9], 0
		jz	short loc_5BFF
		cmp	dword ptr [si+4], 0
		jz	short loc_5BFF
		mov	al, [si+8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_5D59
		add	sp, 2
		push	dx
		push	ax
		push	cs
		call	near ptr sub_5B45
		add	sp, 6
		or	ax, ax
		jz	short loc_5BFF
		push	1600h
		call	sub_13451
		add	sp, 2

loc_5BFF:
		mov	dword ptr [si+4], 0
		pop	si
		pop	bp
		retf
sub_5BC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C0A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_5BC6
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_5C0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C1C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5C51
		mov	word ptr [si], 1BCh
		push	si
		push	cs
		call	near ptr sub_5BC6
		add	sp, 2
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_5C51
		push	si
		call	sub_39C
		add	sp, 2

loc_5C51:
		pop	di
		pop	si
		pop	bp
		retf
sub_5C1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C55		proc far

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
		call	near ptr sub_5BC6
		add	sp, 2
		lea	ax, [bp+var_2]
		push	ax
		push	large [bp+arg_2]
		push	cs
		call	near ptr sub_5AAC
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_5CAC
		cmp	[bp+arg_6], 0
		jz	short loc_5CAC
		call	PagedMemory_DetectDriverSignatureB_30BC5
		or	di, di
		jz	short loc_5CA1
		push	di
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2
		jmp	short loc_5CAC

loc_5CA1:
		push	1601h
		call	sub_13451
		add	sp, 2

loc_5CAC:
		cmp	[bp+var_6], 0
		jz	short loc_5CC5
		mov	byte ptr [si+9], 1
		mov	al, byte ptr [bp+var_2]
		mov	[si+8], al
		mov	eax, [bp+var_6]
		mov	[si+4], eax

loc_5CC5:
		pop	di
		pop	si
		leave
		retf
sub_5C55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CC9		proc far

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
		call	near ptr sub_5BC6
		add	sp, 2
		mov	eax, [di]
		mov	[si+4], eax
		cmp	byte ptr [di+4], 3
		jnz	short loc_5CEF
		mov	byte ptr [si+8], 4
		jmp	short loc_5D09

loc_5CEF:
		cmp	word ptr [si+6], 9FFFh
		ja	short loc_5CFF
		mov	ax, [si+6]
		cmp	ax, word_48B44
		jnb	short loc_5D05

loc_5CFF:
		mov	byte ptr [si+8], 3
		jmp	short loc_5D09

loc_5D05:
		mov	byte ptr [si+8], 0

loc_5D09:
		mov	byte ptr [si+9], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_5CC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D11		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5D2C
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_5D51

loc_5D2C:
		mov	word ptr [si], 1B4h
		mov	ax, word_4D392
		mov	[si+2], ax
		mov	word_4D392, si
		mov	word ptr [si], 1BCh
		mov	dword ptr [si+4], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_5CC9
		add	sp, 4

loc_5D51:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5D11		endp

; START OF FUNCTION CHUNK FOR sub_5D11
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_5D11

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D59		proc far

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
		ja	short loc_5D81
		shl	bx, 1
		jmp	cs:off_5E0E[bx]	; switch jump

loc_5D76:
		mov	dx, [si+6]
		mov	ax, [si+4]
		pop	si
		leave
		retf

loc_5D7F:
		jmp	short loc_5D8C

loc_5D81:
		push	120Bh
		call	sub_13451
		add	sp, 2

loc_5D8C:
		les	bx, word_4CF9E
		mov	al, es:[bx]
		mov	[bp+var_5], al
		cmp	byte ptr [si+8], 4
		jnz	short loc_5DBE
		call	PagedMemory_DetectDriverSignatureA_30BB4
		push	0
		push	3
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		jmp	short loc_5DF7

loc_5DBE:
		call	PagedMemory_DetectDriverSignatureB_30BC5
		push	word ptr [si+6]
		push	word ptr [si+4]
		call	sub_312CC
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_A], eax
		call	PagedMemory_DetectDriverSignatureA_30BB4
		push	1
		push	large [bp+var_A]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax

loc_5DF7:
		cmp	[bp+var_5], 0
		jz	short loc_5E02
		call	PagedMemory_DetectDriverSignatureB_30BC5

loc_5E02:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	si
		leave
		retf
sub_5D59		endp

; START OF FUNCTION CHUNK FOR sub_5D59
		pop	si
		leave
		retf
off_5E0E	dw offset loc_5D76
		dw offset loc_5D76
		dw offset loc_5D76
		dw offset loc_5D7F
		dw offset loc_5D7F
; END OF FUNCTION CHUNK FOR sub_5D59

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E18		proc far

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
		jz	short loc_5E99
		cmp	byte ptr [si+8], 4
		jnz	short loc_5E5B
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		and	eax, 0FFFFFEh
		add	eax, 10h
		mov	[bp+var_4], eax
		jmp	short loc_5E99

loc_5E5B:
		cmp	byte ptr [si+8], 3
		jnz	short loc_5E99
		les	bx, word_4CF9E
		mov	al, es:[bx]
		mov	byte ptr [bp+var_8+3], al
		call	PagedMemory_DetectDriverSignatureB_30BC5
		push	word ptr [si+6]
		push	word ptr [si+4]
		call	sub_312CC
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	al, byte ptr [bp+var_8+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5E99
		call	PagedMemory_DetectDriverSignatureA_30BB4

loc_5E99:
		mov	eax, [bp+var_4]
sub_5E18		endp

; START OF FUNCTION CHUNK FOR sub_5E18
		db 66h, 0Fh
		movsb
; END OF FUNCTION CHUNK FOR sub_5E18
seg008		ends
