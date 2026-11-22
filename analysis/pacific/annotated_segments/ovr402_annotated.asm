ovr402		segment	para public 'OVERLAY' use16
		assume cs:ovr402
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E54C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7AB78
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	[bp+arg_2]
		call	sub_69728
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_E54C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E54E5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_76490
		pop	cx
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_E54C0
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_E54E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Primitive_SetRectColorAndDraw_2CBE5 (sub_2CBE5 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Range un rectangle dans un
; objet primitive (+2, +4, +8, +10 = arg_2, arg_4, arg_6, arg_8), la couleur dans byte_46F42
; (arg_A), puis appelle sa méthode virtuelle +20 avec la surface arg_C (non lue). mid1 scène
; 23 : objet construit directement (tables dseg 4540 à 4604), rectangle du sous-titre, couleur
; 0.
; ==============================================================================================
Primitive_SetRectColorAndDraw_E5501		proc far

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
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax
		mov	ax, [bp+arg_6]
		mov	[si+8], ax
		mov	ax, [bp+arg_8]
		mov	[si+0Ah], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_5], al
		mov	byte_7AB78, al
		push	[bp+arg_C]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 4
		pop	si
		leave
		retf
Primitive_SetRectColorAndDraw_E5501		endp
ovr402		ends
