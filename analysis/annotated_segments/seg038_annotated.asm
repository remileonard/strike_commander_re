seg038		segment	byte public 'CODE' use16
		assume cs:seg038
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_21E2C:				; DATA XREF: seg339:10E4o seg339:1AA8o ...
		push	bp

loc_21E2D:
		mov	bp, sp
		mov	ax, [bp+6]

loc_21E32:
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21E38:				; DATA XREF: seg339:10E8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21E40:				; DATA XREF: seg339:10ECo
					; seg339:off_70172o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21E48:				; DATA XREF: seg339:10F0o seg339:1AB4o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21E50:				; DATA XREF: seg339:10F4o
		push	bp

loc_21E51:
		mov	bp, sp

loc_21E53:
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21E5A:				; DATA XREF: seg339:10F8o seg339:1ABCo
		push	bp
		mov	bp, sp

loc_21E5D:
		mov	ax, [bp+6]

loc_21E60:
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — initialise un objet (type 0x10E4, marqueur 0xFFFF), libère la mémoire near
; associée si demandé (flag bit0 → sub_338/free) : destructeur de handle/ressource générique
; (pattern C++ destructeur avec libération conditionnelle).
; ==============================================================================================
Handle_Destructor	proc far		; CODE XREF: seg106:0EE8P
					; Terrain_FormatAndReleaseReader_9B1FC:loc_9B2DBP	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_21E63:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_21E85
		mov	word ptr [si], 10E4h
		mov	word ptr [si+2], 0FFFFh
		test	ax, 1
		jz	short loc_21E85
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_21E85:				; CODE XREF: Handle_Destructor+Cj
					; Handle_Destructor+1Aj
		pop	si
		pop	bp
		retf
Handle_Destructor	endp

; ���������������������������������������������������������������������������

loc_21E88:				; DATA XREF: seg339:1100o seg339:1AC4o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
seg038		ends
