seg203		segment	para public 'CODE' use16
		assume cs:seg203
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0AAh, 0FBh, 59h, 5Dh, 0CBh

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
FileStream_Method_Read_6C5F5		proc far

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
		jz	short loc_6C629
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	sub_4492
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_6C629:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
FileStream_Method_Read_6C5F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C635		proc far

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
		jz	short loc_6C66D
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	sub_45D8
		or	ax, dx
		jz	short loc_6C66D
		mov	eax, [bp+arg_A]
		mov	[bp+var_4], eax

loc_6C66D:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_6C635		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C679		proc far

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
		jz	short loc_6C6A9
		push	word ptr [si+2]
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		push	ax
		call	sub_6B441
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_6C6A9:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_6C679		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C6B5		proc far

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
		jnz	short loc_6C71E
		or	cl, cl
		jnz	short loc_6C6E3
		push	ds
		mov	ax, [si+4]
		add	ax, 0Ah
		push	ax
		call	sub_6B3BA
		jmp	short loc_6C701

loc_6C6E3:
		mov	[bp+var_2], 2
		cmp	cl, 1
		jnz	short loc_6C6F0
		mov	[bp+var_2], 0

loc_6C6F0:
		push	ds
		mov	ax, [si+4]
		add	ax, 0Ah
		push	ax
		mov	al, [bp+var_2]
		push	ax
		call	File_OpenWithRetry_6B3E6

loc_6C701:
		mov	[si+2], ax
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_6C70F
		mov	ax, 1
		jmp	short loc_6C711

loc_6C70F:
		xor	ax, ax

loc_6C711:
		mov	dl, al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C71E
		mov	word ptr [si+2], 0

loc_6C71E:
		mov	al, dl
		pop	si
		leave
		retf
sub_6C6B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C723		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_6C73D
		push	word ptr [si+2]
		call	sub_6B415
		mov	word ptr [si+2], 0

loc_6C73D:
		mov	ax, [si+2]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	si
		pop	bp
		retf
sub_6C723		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C748		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_6C766
		mov	word ptr [si], 4A1Eh
		test	ax, 1
		jz	short loc_6C766
		push	si
		call	sub_3B2
		pop	cx

loc_6C766:
		pop	si
		pop	bp
		retf
sub_6C748		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C769		proc far

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
		jz	short loc_6C7B9
		push	word ptr [si+2]
		push	large 0
		push	0
		call	sub_6B441
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		push	word ptr [si+2]
		push	large 0
		push	2
		call	sub_6B441
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		push	word ptr [si+2]
		push	large [bp+var_4]
		push	0
		call	sub_6B441

loc_6C7B9:
		mov	eax, [bp+var_8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_6C769		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C7C5		proc far

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
sub_6C7C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C7DD		proc far

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
		jz	short loc_6C7FE
		mov	word ptr [di], 4A1Eh
		mov	word ptr [di+2], 0
		jmp	short loc_6C800

loc_6C7FE:
		mov	ax, di

loc_6C800:
		mov	di, ax
		mov	ax, [si+2]
		mov	[di+2], ax
		mov	ax, [si+4]
		mov	[di+4], ax
		mov	ax, di
sub_6C7DD		endp
seg203		ends
