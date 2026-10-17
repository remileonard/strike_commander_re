seg142		segment	byte public 'CODE' use16
		assume cs:seg142
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3AD2A	proc far		; CODE XREF: sub_4DAE8+10FP
					; sub_4DAE8+1BFP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	large [bp+arg_4]
		push	large 2
		push	ss
		lea	ax, [bp+arg_2]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		pop	bp
		retf
sub_3AD2A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3AD47	proc far		; CODE XREF: sub_4DAE8+77P
					; sub_4DAE8+8BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	large [bp+arg_4]
		push	large 1
		push	ss
		lea	ax, [bp+arg_2]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		pop	bp
		retf
sub_3AD47	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3AD64	proc far		; CODE XREF: sub_4DAE8+163P
					; sub_4DAE8+177P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	large [bp+arg_6]
		push	large 4
		push	ss
		lea	ax, [bp+arg_2]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		pop	bp
		retf
sub_3AD64	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Handle_ReadWordField_63511 (sub_63511 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit un champ 16 bits typé (tag 2) via
; sub_63FA1. Référencée par Music_LoadTimbreFromLibrary_5A577 (seg124).
; ==============================================================================================
Handle_ReadWordField_3AD81	proc far		; CODE XREF: sub_74F1+58P
					; sub_4DF4B+10BP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

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
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	ax, [bp+var_2]
		leave
		retf
Handle_ReadWordField_3AD81	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Handle_ReadByteField_63534 (sub_63534 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit un champ 8 bits typé (tag 1) via
; sub_63FA1. Référencée par sub_AA84E.
; ==============================================================================================
Handle_ReadByteField_3ADA4	proc far		; CODE XREF: sub_4DF4B+7CP
					; sub_4DF4B+8FP ...

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		push	large [bp+arg_2]
		push	large 1
		push	ss
		lea	ax, [bp-1]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	al, [bp+var_1]
		leave
		retf
Handle_ReadByteField_3ADA4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3ADC7	proc far		; CODE XREF: sub_4DF4B+160P
					; sub_4DF4B+17DP ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		push	large [bp+arg_2]
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_3ADC7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Handle_ReadAndOffsetField_63580 (sub_63580 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_64062 (résolution de handle) et
; sub_63FA1 (lecture typée) — accesseur composé. Référencée par sub_A4BE1.
; ==============================================================================================
Handle_ReadAndOffsetField_3ADF0	proc far		; CODE XREF: sub_7A4D+CBP sub_8256+C0P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_GetCapacity_3B8D2
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		push	large 0
		push	eax
		push	large [bp+arg_2]
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		pop	si
		leave
		retf
Handle_ReadAndOffsetField_3ADF0	endp

seg142		ends
