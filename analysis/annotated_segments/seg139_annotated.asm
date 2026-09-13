seg139		segment	byte public 'CODE' use16
		assume cs:seg139
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, construit un petit objet (3 octets, sub_658) et le chaîne dans une liste globale
; (word_70E60), uniquement si un indicateur de validité (di) est non nul. Référencée par
; sub_1C5D8 et seg032 (zoom carte/radar).
; ==============================================================================================
SmallObject_RegisterInList_5D999	proc far		; CODE XREF: Widget_DrawTooltip+1AP
					; seg032:06E4P	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_5D9B9
		push	3
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5D9CD

loc_5D9B9:				; CODE XREF: SmallObject_RegisterInList_5D999+10j
		cmp	word ptr [di], 0
		jz	short loc_5D9CD
		mov	ax, word_70E60
		mov	[si+1],	ax
		mov	[bp+var_2], di
		mov	ax, [bp+var_2]
		mov	word_70E60, ax

loc_5D9CD:				; CODE XREF: SmallObject_RegisterInList_5D999+1Ej
					; SmallObject_RegisterInList_5D999+23j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
SmallObject_RegisterInList_5D999	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, retire/libère (sub_338) un objet de la liste globale gérée par
; SmallObject_RegisterInList_5D999. Référencée par sub_1C5D8.
; ==============================================================================================
SmallObject_UnregisterFromList_5D9D3	proc far		; CODE XREF: Widget_DrawTooltip+57P
					; seg032:0791P	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	si, si

loc_5D9E2:
		jz	short loc_5D9FA

loc_5D9E4:
		mov	ax, [si+1]
		mov	[bp+var_2], ax

loc_5D9EA:
		mov	word_70E60, ax

loc_5D9ED:
		test	dx, 1

loc_5D9F1:
		jz	short loc_5D9FA
		push	si

loc_5D9F4:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5D9FA:				; CODE XREF: SmallObject_UnregisterFromList_5D9D3:loc_5D9E2j
					; SmallObject_UnregisterFromList_5D9D3:loc_5D9F1j
		pop	si
		leave
		retf
SmallObject_UnregisterFromList_5D9D3	endp

seg139		ends
