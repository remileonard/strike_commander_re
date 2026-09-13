seg147		segment	byte public 'CODE' use16
		assume cs:seg147
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216) — variante de Text_ComputeMaxLineWidth_5E6BF
; (seg146) utilisant des champs différents du résultat de sub_5E74E (probable dimension
; verticale au lieu d'horizontale). Mêmes appelants (sub_97215, sub_A60AC).
; ==============================================================================================
Text_ComputeMaxLineHeight_5E706	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsD_97215+A9P
					; TextLabel_MeasureAndAllocate_A60AC+9BP

var_A		= word ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di

loc_5E70E:				; DATA XREF: seg216:055Eo
		xor	di, di
		push	large [bp+arg_0]

loc_5E714:
		call	Struct_GetElementCountMinusOne_625CC
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_5E740
; ���������������������������������������������������������������������������

loc_5E720:				; CODE XREF: Text_ComputeMaxLineHeight_5E706+3Dj
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 0
		push	large [bp+arg_0]
		push	si

loc_5E72D:
		call	Font_ComputeGlyphBoundingBox_5E74E

loc_5E732:
		mov	dx, [bp+var_6]

loc_5E735:
		sub	dx, [bp+var_A]
		inc	dx
		cmp	dx, di
		jle	short loc_5E73F
		mov	di, dx

loc_5E73F:				; CODE XREF: Text_ComputeMaxLineHeight_5E706+35j
		inc	si

loc_5E740:				; CODE XREF: Text_ComputeMaxLineHeight_5E706+18j
		cmp	si, [bp+var_2]
		jl	short loc_5E720
		mov	ax, di
		pop	di
		pop	si
		leave
		retf	4
Text_ComputeMaxLineHeight_5E706	endp

seg147		ends
