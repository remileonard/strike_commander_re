seg199		segment	para public 'CODE' use16
		assume cs:seg199
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0D0h, 0F9h

loc_6B473:
		db 5Fh, 5Eh, 5Dh, 0CAh, 8, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B479		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	large [bp+arg_4]
		push	large 2
		push	ss
		lea	ax, [bp+arg_2]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		pop	bp
		retf
sub_6B479		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B496		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	large [bp+arg_4]
		push	large 1
		push	ss
		lea	ax, [bp+arg_2]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		pop	bp
		retf
sub_6B496		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B4B3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	large [bp+arg_6]
		push	large 4
		push	ss
		lea	ax, [bp+arg_2]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		pop	bp
		retf
sub_6B4B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Handle_ReadWordField_3AD81 (sub_3AD81 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Handle_ReadWordField_63511 (sub_63511 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lit un champ 16 bits typé (tag
; 2) via sub_63FA1. Référencée par Music_LoadTimbreFromLibrary_5A577 (seg124).
; ==============================================================================================
Handle_ReadWordField_6B4D0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		push	large [bp+arg_2]
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	ax, [bp+var_2]
		leave
		retf
Handle_ReadWordField_6B4D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Handle_ReadByteField_3ADA4 (sub_3ADA4 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Handle_ReadByteField_63534
; (sub_63534 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, lit un champ 8 bits typé (tag 1) via sub_63FA1. Référencée par sub_AA84E.
; ==============================================================================================
Handle_ReadByteField_6B4F3		proc far

var_1		= word ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		push	large [bp+arg_2]
		push	large 1
		push	ss
		lea	ax, [bp+var_1]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_1]
		leave
		retf
Handle_ReadByteField_6B4F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B516		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		push	large [bp+arg_2]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_6B516		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B53F		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		push	large 0
		push	eax
sub_6B53F		endp

; START OF FUNCTION CHUNK FOR sub_6B53F
		db 66h, 0FFh, 76h
; END OF FUNCTION CHUNK FOR sub_6B53F
seg199		ends
