seg176		segment	byte public 'CODE' use16
		assume cs:seg176
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far (ex-Struct_GetElementCountMinusOne_625CC). Nombre d'images d'une forme (sprite
; RealSpace) : 1er décalage de la table d'images (mot à +4) ÷ 4 − 1 (shr ax, 1 ×2 / dec ax),
; la table commençant à +4. Particle_UpdateLifeSizeShadeFrame_4C413 retire encore 1 pour le
; numéro de la dernière image.
; ==============================================================================================
Shape_GetImageCount_625CC	proc far		; CODE XREF: Particle_UpdateLifeSizeShadeFrame_4C413+145P
					; CachedObject_BuildAndTransform_5DEC9+3FP ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	ds

loc_625D1:
		lds	si, [bp+arg_0]

loc_625D4:
		mov	ax, [si+4]
		shr	ax, 1
		shr	ax, 1
		dec	ax
		pop	ds
		pop	si
		pop	bp

locret_625DF:
		retf	4
Shape_GetImageCount_625CC	endp

seg176		ends
