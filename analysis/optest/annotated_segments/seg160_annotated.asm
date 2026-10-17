seg160		segment	byte public 'CODE' use16
		assume cs:seg160
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_Construct_675B4 (sub_675B4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (sub_658, 2 octets), initialise l'état
; de défilement (TextScroll_AllocateState_674F5, seg205) et remet à zéro les compteurs
; d'animation (byte_711CA, word_711C6/711C8, byte_72E70=1). Référencée par sub_67DF5 —
; probable variante/classe sœur de TextScrollDisplay (seg205).
; ==============================================================================================
TextScrollDisplayB_Construct_3EDD8	proc far		; CODE XREF: TextScrollDisplayB_ConstructAndReset_3F619+1AP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_3EDDB:				; DATA XREF: seg170:05D6o
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3EDF1
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3EE0E

loc_3EDF1:				; CODE XREF: TextScrollDisplayB_Construct_3EDD8+9j
		push	si
		call	sub_3ED19
		pop	cx
		mov	byte_47AB8, 0
		mov	word_47AB4, 0
		mov	word_47AB6, 0
		mov	byte_497C0, 1

loc_3EE0E:				; CODE XREF: TextScrollDisplayB_Construct_3EDD8+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplayB_Construct_3EDD8	endp

seg160		ends
