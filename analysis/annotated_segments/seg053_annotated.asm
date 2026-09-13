seg053		segment	byte public 'CODE' use16
		assume cs:seg053
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — destructeur d'objet (type 0x155C) avec libération conditionnelle : destructeur
; générique C++ (même pattern que sub_29036).
; ==============================================================================================
Object_DestructGeneric_29115	proc far		; CODE XREF: Widget_DestructComposite+49P
					; seg107:14B8P	...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_29116:				; DATA XREF: seg216:0266o
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_2914D

loc_29125:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 155Ch

loc_2912D:
		test	ax, 1
		jz	short locret_2914D
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

locret_2914D:				; CODE XREF: Object_DestructGeneric_29115+Ej
					; Object_DestructGeneric_29115+1Bj
		leave
		retf
Object_DestructGeneric_29115	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,16L — remet à zéro 3 champs (pointeur/référence/flag) d'une petite structure : reset
; d'un descripteur générique (probable référence faible/cache invalidé).
; ==============================================================================================
Descriptor_Reset	proc far		; CODE XREF: seg061:loc_2D262P
					; seg061:loc_2D485P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_29152:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0
		mov	dword ptr es:[bx+2], 0
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf
Descriptor_Reset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,20L — initialise un descripteur avec une référence (+2) et une valeur (+6), flag à 0 :
; constructeur d'un descripteur générique (référence + valeur).
; ==============================================================================================
Descriptor_Construct	proc far		; CODE XREF: seg052:0083P
					; Widget_ConstructComposite+1CP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		mov	ax, [bp+arg_8]

loc_2917D:
		mov	es:[bx+6], ax
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf
Descriptor_Construct	endp

; ���������������������������������������������������������������������������

loc_29188:				; DATA XREF: seg339:1580o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
seg053		ends
