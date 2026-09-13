seg146		segment	byte public 'CODE' use16
		assume cs:seg146
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, itère sur les lignes d'un texte (compte via sub_625CC), calcule la largeur de chaque
; ligne (sub_5E74E) et retourne le maximum — probable calcul de largeur de boîte de texte
; multi-lignes. Référencée par sub_97215 et sub_A60AC.
; ==============================================================================================
Text_ComputeMaxLineWidth_5E6BF	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsD_97215+CEP
					; TextLabel_MeasureAndAllocate_A60AC+B9P

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		xor	di, di
		push	large [bp+arg_0]
		call	Struct_GetElementCountMinusOne_625CC
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_5E6F9
; ���������������������������������������������������������������������������

loc_5E6D9:				; CODE XREF: Text_ComputeMaxLineWidth_5E6BF+3Dj
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 0
		push	large [bp+arg_0]
		push	si

loc_5E6E6:
		call	Font_ComputeGlyphBoundingBox_5E74E

loc_5E6EB:
		mov	dx, [bp+var_4]
		sub	dx, [bp+var_8]
		inc	dx

loc_5E6F2:
		cmp	dx, di
		jle	short loc_5E6F8
		mov	di, dx

loc_5E6F8:				; CODE XREF: Text_ComputeMaxLineWidth_5E6BF+35j
		inc	si

loc_5E6F9:				; CODE XREF: Text_ComputeMaxLineWidth_5E6BF+18j
		cmp	si, [bp+var_2]
		jl	short loc_5E6D9
		mov	ax, di

loc_5E700:
		pop	di
		pop	si
		leave
		retf	4
Text_ComputeMaxLineWidth_5E6BF	endp

seg146		ends
