seg159		segment	para public 'CODE' use16
		assume cs:seg159
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 46h, 6, 50h, 0Eh, 0E8h, 0AAh, 0FBh, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; FileStream_Method_Read_6C5F5 (sub_6C5F5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à FileStream_Method_Read_3BBC3 (sub_3BBC3 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à FileStream_Method_Read_64353 (sub_64353 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée via vtable (DATA XREF seg339) — méthode « Read » de FileStream : délègue à
; File_ReadOrDelegateToPaged_630E7 (seg185) avec le handle interne (+2). Appelée par
; FileStream_ReadRaw_63747 (seg189).
; ==============================================================================================
FileStream_Method_Read_52AFB		proc far

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
		jz	short loc_52B2F
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	sub_442A
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_52B2F:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
FileStream_Method_Read_52AFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52B3B		proc far

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
		jz	short loc_52B73
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	sub_4570
		or	ax, dx
		jz	short loc_52B73
		mov	eax, [bp+arg_A]
		mov	[bp+var_4], eax

loc_52B73:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_52B3B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52B7F		proc far

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
		jz	short loc_52BAF
		push	word ptr [si+2]
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		push	ax
		call	sub_51C35
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_52BAF:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_52B7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52BBB		proc far

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
		jnz	short loc_52C24
		or	cl, cl
		jnz	short loc_52BE9
		push	ds
		mov	ax, [si+4]
		add	ax, 0Ah
		push	ax
		call	sub_51BAE
		jmp	short loc_52C07

loc_52BE9:
		mov	[bp+var_2], 2
		cmp	cl, 1
		jnz	short loc_52BF6
		mov	[bp+var_2], 0

loc_52BF6:
		push	ds
		mov	ax, [si+4]
		add	ax, 0Ah
		push	ax
		mov	al, [bp+var_2]
		push	ax
		call	File_OpenWithRetry_51BDA

loc_52C07:
		mov	[si+2], ax
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_52C15
		mov	ax, 1
		jmp	short loc_52C17

loc_52C15:
		xor	ax, ax

loc_52C17:
		mov	dl, al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52C24
		mov	word ptr [si+2], 0

loc_52C24:
		mov	al, dl
		pop	si
		leave
		retf
sub_52BBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52C29		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_52C43
		push	word ptr [si+2]
		call	sub_51C09
		mov	word ptr [si+2], 0

loc_52C43:
		mov	ax, [si+2]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	si
		pop	bp
		retf
sub_52C29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52C4E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_52C6C
		mov	word ptr [si], 490Ah
		test	ax, 1
		jz	short loc_52C6C
		push	si
		call	sub_33B
		pop	cx

loc_52C6C:
		pop	si
		pop	bp
		retf
sub_52C4E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52C6F		proc far

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
		jz	short loc_52CBF
		push	word ptr [si+2]
		push	large 0
		push	0
		call	sub_51C35
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		push	word ptr [si+2]
		push	large 0
		push	2
		call	sub_51C35
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		push	word ptr [si+2]
		push	large [bp+var_4]
		push	0
		call	sub_51C35

loc_52CBF:
		mov	eax, [bp+var_8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_52C6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52CCB		proc far

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
sub_52CCB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52CE3		proc far

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
		jz	short loc_52D04
		mov	word ptr [di], 490Ah
		mov	word ptr [di+2], 0
		jmp	short loc_52D06

loc_52D04:
		mov	ax, di

loc_52D06:
		mov	di, ax
		mov	ax, [si+2]
		mov	[di+2], ax
sub_52CE3		endp

; START OF FUNCTION CHUNK FOR sub_52CE3
		db 8Bh
		inc	sp
; END OF FUNCTION CHUNK FOR sub_52CE3
seg159		ends
