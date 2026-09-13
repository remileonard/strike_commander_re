seg052		segment	byte public 'CODE' use16
		assume cs:seg052
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,42L — destructeur d'objet (type 0x1588) libérant conditionnellement la mémoire (flag
; bit0, sub_5C7B6) : destructeur générique C++ (pattern standard avec libération
; conditionnelle).
; ==============================================================================================
Object_DestructGeneric_29036	proc far		; CODE XREF: Widget_DestructWithLabel+6CP
					; seg107:11D6P	...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_29037:
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]

loc_2903F:
		cmp	[bp+arg_0], 0
		jz	short locret_2906E
		les	bx, [bp+arg_0]

loc_29049:
		mov	word ptr es:[bx], 1588h

loc_2904E:
		test	ax, 1
		jz	short locret_2906E

loc_29053:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

locret_2906E:				; CODE XREF: Object_DestructGeneric_29036+Ej
					; Object_DestructGeneric_29036+1Bj
		leave
		retf
Object_DestructGeneric_29036	endp

; ���������������������������������������������������������������������������

loc_29070:				; DATA XREF: seg339:158Co
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+6]
		mov	[bp-8],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-0Ah], ax
		push	1
		push	0
		push	2
		push	large 9
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-0Ch], dx
		mov	[bp-0Eh], ax
		or	ax, dx
		jz	short loc_290C3
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx], 155Ch
		push	word ptr [bp-0Ah]
		push	large dword ptr	[bp-8]
		push	dx
		push	bx
		call	Descriptor_Construct
		add	sp, 0Ah
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]
		jmp	short loc_290C9
; ���������������������������������������������������������������������������

loc_290C3:				; CODE XREF: seg052:0070j
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]

loc_290C9:				; CODE XREF: seg052:0091j
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		leave
		retf
; ���������������������������������������������������������������������������

loc_290D1:				; DATA XREF: seg339:1590o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_290D8:				; DATA XREF: seg339:155Co
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_290DD:				; DATA XREF: seg339:off_6E610o
					; seg339:186Ao	...
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_290E2:				; DATA XREF: seg339:1564o seg339:186Eo ...
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_290E9:				; DATA XREF: seg339:1568o
					; seg339:off_6E922o ...
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_290F0:				; DATA XREF: seg339:156Co seg339:1876o ...
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 5BB0h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_290FA:				; DATA XREF: seg339:off_6E620o
					; seg339:184Eo	...
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 5BB0h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29104:				; DATA XREF: seg339:off_6E624o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2910B:				; DATA XREF: seg339:1578o seg339:1856o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29110:				; DATA XREF: seg339:157Co seg339:1886o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
seg052		ends
