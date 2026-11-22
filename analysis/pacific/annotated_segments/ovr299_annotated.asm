ovr299		segment	para public 'OVERLAY' use16
		assume cs:ovr299
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ABD50		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], seg seg228
		mov	[bp+var_4], 0
		xor	dx, dx
		jmp	short loc_ABD8F

loc_ABD64:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		les	bx, [bp+var_4]
		cmp	eax, es:[bx]
		jnz	short loc_ABD8A
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		les	bx, [bp+var_4]
		cmp	eax, es:[bx+4]
		jnz	short loc_ABD8A
		mov	al, dl
		jmp	short loc_ABD96

loc_ABD8A:
		inc	dx
		add	[bp+var_4], 8

loc_ABD8F:
		cmp	dx, 3Bh
		jl	short loc_ABD64
		mov	al, 0

loc_ABD96:
		leave
		retf
sub_ABD50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ABD98		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Bh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	dx, word ptr [bp+arg_0]
		add	dx, 76h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0B1h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		mov	ax, 3Bh
		jmp	short loc_ABDFC

loc_ABDD3:
		les	bx, word ptr [bp+var_4]
		mov	byte ptr es:[bx], 0
		inc	word ptr [bp+var_4]
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0
		inc	[bp+var_8]
		les	bx, [bp+var_C]
		mov	byte ptr es:[bx], 0
		inc	[bp+var_C]
		les	bx, [bp+var_10]
		mov	byte ptr es:[bx], 0
		inc	[bp+var_10]
		dec	ax

loc_ABDFC:
		or	ax, ax
		jnz	short loc_ABDD3
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0EEh], 0
		leave
		retf
sub_ABD98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ABE0B		proc far

var_1A		= byte ptr -1Ah
var_18		= word ptr -18h
var_E		= word ptr -0Eh
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_ABD98
		add	sp, 4
		push	0
		push	large 474D4144h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_ABE39
		jmp	loc_ABF3B

loc_ABE39:
		push	0
		push	large 4D535953h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_ABE51
		jmp	loc_ABF2A

loc_ABE51:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	eax, [si+72h]
		add	eax, 0FFFFFFFEh
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		push	large 0EC0000h
		push	large [bp+arg_0]
		call	sub_380B
		add	sp, 8
		lea	ax, [bp+var_E]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_18]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		xor	di, di
		jmp	loc_ABF20

loc_ABE99:
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_3], al
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_4], al
		push	si
		lea	ax, [bp+var_E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	si
		lea	ax, [bp+var_18]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	ds
		lea	ax, [bp+var_E]
		push	ax
		push	cs
		call	near ptr sub_ABD50
		add	sp, 4
		mov	[bp+var_1A], al
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, [bp+var_3]
		mov	es:[bx], al
		mov	al, [bp+var_1A]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, [bp+var_4]
		mov	es:[bx+3Bh], al
		push	ds
		lea	ax, [bp+var_18]
		push	ax
		call	sub_74215
		add	sp, 4
		mov	dl, [bp+var_1A]
		mov	dh, 0
		les	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+76h], al
		mov	al, [bp+var_1A]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	byte ptr es:[bx+0B1h], 0
		inc	di

loc_ABF20:
		cmp	di, [bp+var_2]
		jge	short loc_ABF28
		jmp	loc_ABE99

loc_ABF28:
		jmp	short loc_ABF33

loc_ABF2A:
		push	0C00Ch
		call	sub_1DDFE
		pop	cx

loc_ABF33:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_ABF43

loc_ABF3B:
		push	0C00Dh
		call	sub_1DDFE

loc_ABF43:
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_ABE0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ReleaseWrapperC_9CE11 (sub_9CE11 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Memory_TypedFreeWrapper_5C6F3 (20 lignes).
; ==============================================================================================
Debris_ReleaseWrapperC_ABF48		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 0EFh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Debris_ReleaseWrapperC_ABF48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ABF6D		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	1
		push	0
		push	2
		push	large 0EFh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	eax, [bp+arg_0]
		mov	[bp+var_A], eax
		les	bx, word ptr [bp+var_4]
		mov	ax, [bp+var_6]
		mov	es:[bx+0ECh], ax
		push	dx
		push	bx
		push	cs
		call	near ptr sub_ABD98
		add	sp, 4
		push	0ECh
		push	large [bp+var_A]
		push	large [bp+var_4]
		call	sub_37C3
		add	sp, 0Ah
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_ABF6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ABFCD		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	1
		push	0
		push	2
		push	large 0EFh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		push	[bp+arg_4]
		push	large es:[bx]
		push	cs
		call	near ptr sub_ABE0B
		add	sp, 6
		pop	bp
		retf
sub_ABFCD		endp
ovr299		ends
