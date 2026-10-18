seg080		segment	byte public 'CODE' use16
		assume cs:seg080
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2CBA4	proc far		; CODE XREF: seg080:003Cp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_46F42
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	[bp+arg_2]
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_2CBA4	endp

; ���������������������������������������������������������������������������

loc_2CBC9:				; DATA XREF: dseg:1210o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_2CA87
		pop	cx
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_2CBA4
		add	sp, 4
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Range un rectangle dans un objet primitive (+2, +4, +8, +10 = arg_2,
; arg_4, arg_6, arg_8), la couleur dans byte_46F42 (arg_A), puis appelle sa méthode virtuelle
; +20 avec la surface arg_C (non lue). mid1 scène 23 : objet construit directement (tables
; dseg 4540 à 4604), rectangle du sous-titre, couleur 0.
; ==============================================================================================
Primitive_SetRectColorAndDraw_2CBE5	proc far		; CODE XREF: sub_5AA4E+70EP
					; sub_5AA4E+C64P ...

var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2],	ax
		mov	ax, [bp+var_4]
		mov	[si+4],	ax
		mov	ax, [bp+arg_6]
		mov	[si+8],	ax
		mov	ax, [bp+arg_8]
		mov	[si+0Ah], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_5], al
		mov	byte_46F42, al
		push	[bp+arg_C]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 4
		pop	si
		leave
		retf
Primitive_SetRectColorAndDraw_2CBE5	endp

seg080		ends
