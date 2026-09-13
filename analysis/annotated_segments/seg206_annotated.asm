seg206		segment	byte public 'CODE' use16
		assume cs:seg206
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658, 2 octets), initialise l'état de défilement
; (TextScroll_AllocateState_674F5, seg205) et remet à zéro les compteurs d'animation
; (byte_711CA, word_711C6/711C8, byte_72E70=1). Référencée par sub_67DF5 — probable
; variante/classe sœur de TextScrollDisplay (seg205).
; ==============================================================================================
TextScrollDisplayB_Construct_675B4	proc far		; CODE XREF: TextScrollDisplayB_ConstructAndReset_67DF5:loc_67E0FP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_675B7:				; DATA XREF: seg216:off_6A516o
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_675CD
		push	2

loc_675C1:
		call	CRT_Malloc16_Retry

loc_675C6:
		pop	cx
		mov	si, ax
		or	ax, ax

loc_675CB:
		jz	short loc_675EA

loc_675CD:				; CODE XREF: TextScrollDisplayB_Construct_675B4+9j
		push	si

loc_675CE:
		call	TextScroll_AllocateState_674F5
		pop	cx

loc_675D4:
		mov	byte_711CA, 0
		mov	word_711C6, 0

loc_675DF:
		mov	word_711C8, 0
		mov	byte_72E70, 1

loc_675EA:				; CODE XREF: TextScrollDisplayB_Construct_675B4:loc_675CBj
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplayB_Construct_675B4	endp

seg206		ends
