seg188		segment	byte public 'CODE' use16
		assume cs:seg188
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp
		mov	bp, sp

loc_634BD:
		mov	dx, [bp+6]
		push	large dword ptr	[bp+0Ah]

loc_634C4:
		push	large 2
		push	ss
		lea	ax, [bp+8]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_6568F

loc_634D2:
		add	sp, 0Eh
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp

loc_634DA:
		mov	dx, [bp+6]
		push	large dword ptr	[bp+0Ah]
		push	large 1
		push	ss
		lea	ax, [bp+8]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp

loc_634F7:
		mov	dx, [bp+6]

loc_634FA:
		push	large dword ptr	[bp+0Ch]
		push	large 4
		push	ss

loc_63502:
		lea	ax, [bp+8]
		push	ax
		push	dx
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un champ 16 bits typé (tag 2) via sub_63FA1. Référencée par
; TextObject_Allocate_5A577 (seg124).
; ==============================================================================================
Handle_ReadWordField_63511	proc far		; CODE XREF: TextObject_Allocate_5A577+55P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_63512:
		mov	bp, sp

loc_63514:
		sub	sp, 2

loc_63517:
		mov	dx, [bp+arg_0]

loc_6351A:
		push	large [bp+arg_2]

loc_6351E:
		push	large 2
		push	ss

loc_63522:
		lea	ax, [bp+var_2]
		push	ax

loc_63526:
		push	dx

loc_63527:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_6352F:
		mov	ax, [bp+var_2]
		leave

locret_63533:
		retf
Handle_ReadWordField_63511	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un champ 8 bits typé (tag 1) via sub_63FA1. Référencée par sub_AA84E.
; ==============================================================================================
Handle_ReadByteField_63534	proc far		; CODE XREF: AudioQueue_ProcessMain_AA84E+1E6P
					; AudioQueue_ProcessMain_AA84E:loc_AAA48P	...

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp

loc_63537:
		sub	sp, 2
		mov	dx, [bp+arg_0]
		push	large [bp+arg_2]
		push	large 1
		push	ss
		lea	ax, [bp-1]
		push	ax

loc_63549:
		push	dx

loc_6354A:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_63552:
		mov	al, [bp+var_1]
		leave
		retf
Handle_ReadByteField_63534	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4

loc_6355D:
		mov	dx, [bp+6]

loc_63560:
		push	large dword ptr	[bp+8]

loc_63564:
		push	large 4
		push	ss

loc_63568:
		lea	ax, [bp-4]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_63FA1

loc_63572:
		add	sp, 0Eh
		mov	eax, [bp-4]

loc_63579:
		shld	edx, eax, 10h
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_64062 (résolution de handle) et sub_63FA1 (lecture typée) — accesseur
; composé. Référencée par sub_A4BE1.
; ==============================================================================================
Handle_ReadAndOffsetField_63580	proc far		; CODE XREF: AircraftDynamics_ReadAtmoChunk_A4BE1+100P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp

loc_63583:
		sub	sp, 4
		push	si

loc_63587:
		mov	si, [bp+arg_0]
		push	si

loc_6358B:
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax

loc_63592:
		pop	eax
		pop	cx

loc_63595:
		mov	[bp+var_4], eax
		push	large 0

loc_6359C:
		push	eax

loc_6359E:
		push	large [bp+arg_2]

loc_635A2:
		push	si

loc_635A3:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		pop	si
		leave
		retf
Handle_ReadAndOffsetField_63580	endp

seg188		ends
