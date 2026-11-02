seg162		segment	para public 'CODE' use16
		assume cs:seg162
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41581		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_51136
		pop	cx
		pop	bp
		retf
sub_41581		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; FileStream_Method_Read_3BBC3 (sub_3BBC3 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à FileStream_Method_Read_64353 (sub_64353 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable (DATA XREF
; seg339) — méthode « Read » de FileStream : délègue à File_ReadOrDelegateToPaged_630E7
; (seg185) avec le handle interne (+2). Appelée par FileStream_ReadRaw_63747 (seg189).
; ==============================================================================================
FileStream_Method_Read_4158F		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_415C3
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	sub_40A4
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_415C3:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
FileStream_Method_Read_4158F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_415CF		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_41607
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	sub_41EA
		or	ax, dx
		jz	short loc_41607
		mov	eax, [bp+arg_A]
		mov	[bp+var_4], eax

loc_41607:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_415CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41613		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_41643
		push	word ptr [si+2]
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		push	ax
		call	sub_403DB
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_41643:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_41613		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4164F		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dl, 0
		mov	ax, [bp+arg_2]
		mov	[si+4], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_416B8
		or	cl, cl
		jnz	short loc_4167D
		push	ds
		mov	ax, [si+4]
		add	ax, 0Ah
		push	ax
		call	File_CreateWithRetry_40354
		jmp	short loc_4169B

loc_4167D:
		mov	[bp+var_2], 2
		cmp	cl, 1
		jnz	short loc_4168A
		mov	[bp+var_2], 0

loc_4168A:
		push	ds
		mov	ax, [si+4]
		add	ax, 0Ah
		push	ax
		mov	al, [bp+var_2]
		push	ax
		call	File_OpenWithRetry_40380

loc_4169B:
		mov	[si+2], ax
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_416A9
		mov	ax, 1
		jmp	short loc_416AB

loc_416A9:
		xor	ax, ax

loc_416AB:
		mov	dl, al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_416B8
		mov	word ptr [si+2], 0

loc_416B8:
		mov	al, dl
		pop	si
		leave
		retf
sub_4164F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_416BD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_416D7
		push	word ptr [si+2]
		call	sub_403AF
		mov	word ptr [si+2], 0

loc_416D7:
		mov	ax, [si+2]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	si
		pop	bp
		retf
sub_416BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_416E2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_41700
		mov	word ptr [si], 526Eh
		test	ax, 1
		jz	short loc_41700
		push	si
		call	sub_39C
		pop	cx

loc_41700:
		pop	si
		pop	bp
		retf
sub_416E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41703		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_8], 0
		cmp	word ptr [si+2], 0
		jz	short loc_41753
		push	word ptr [si+2]
		push	large 0
		push	0
		call	sub_403DB
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		push	word ptr [si+2]
		push	large 0
		push	2
		call	sub_403DB
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		push	word ptr [si+2]
		push	large [bp+var_4]
		push	0
		call	sub_403DB

loc_41753:
		mov	eax, [bp+var_8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_41703		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4175F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	large 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_4175F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41777		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_41798
		mov	word ptr [di], 526Eh
		mov	word ptr [di+2], 0
		jmp	short loc_4179A

loc_41798:
		mov	ax, di

loc_4179A:
		mov	di, ax
		mov	ax, [si+2]
sub_41777		endp

; START OF FUNCTION CHUNK FOR sub_41777
		db 89h
; END OF FUNCTION CHUNK FOR sub_41777
seg162		ends
