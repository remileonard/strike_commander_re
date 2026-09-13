seg158		segment	byte public 'CODE' use16
		assume cs:seg158
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216/seg339) — stub transmettant simplement son
; argument.
; ==============================================================================================
PagedResourceC_Method_PassThrough_5F4D8:				; DATA XREF: seg216:05B6o seg339:129Eo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, pose un flag global (byte_72D74 bit1), recombine les flags de style
; (FontStyle_CombineFlags_5EC12, tag 5C60h) puis parcourt la liste globale des instances
; PagedResourceC (word_70EA8, seg134) en invoquant leur méthode de rafraîchissement virtuelle
; sur chacune. Référencée par sub_14279 et TextRenderer_InputFieldHandler (sub_5A0F3, seg124).
; ==============================================================================================
PagedResourceC_RefreshAllInstances_5F4E0	proc far		; CODE XREF: Program_InitVideoFontArgs+23EP
					; TextRenderer_InputFieldHandler_5A0F3+186P ...
		push	bp
		mov	bp, sp
		push	si
		or	byte_72D74, 2
		push	5C60h
		call	FontStyle_CombineFlags_5EC12
		pop	cx
		mov	si, word_70EA8
		jmp	short loc_5F501
; ���������������������������������������������������������������������������

loc_5F4F8:				; CODE XREF: PagedResourceC_RefreshAllInstances_5F4E0+23j
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	si, [si+2]

loc_5F501:				; CODE XREF: PagedResourceC_RefreshAllInstances_5F4E0+16j
		or	si, si
		jnz	short loc_5F4F8
		pop	si
		pop	bp
		retf
PagedResourceC_RefreshAllInstances_5F4E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PagedResourceC_RefreshAllInstances_5F4E0 puis sub_3C2. Référencée par sub_14279
; et sub_67517.
; ==============================================================================================
PagedResourceC_RefreshAndFinalize_5F508	proc far		; CODE XREF: Program_InitVideoFontArgs+262P
					; HandlerRegistry4Slot_Register_67517:loc_67527P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr PagedResourceC_RefreshAllInstances_5F4E0
		push	[bp+arg_0]
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
PagedResourceC_RefreshAndFinalize_5F508	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		push	cs
		call	near ptr PagedResourceC_RefreshAllInstances_5F4E0
		cmp	si, word_70EA2
		jz	short loc_5F542
		lea	ax, [bp+8]

loc_5F531:
		mov	[bp-2],	ax
		push	ax
		push	si
		push	word_70EA2
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_5F542:				; CODE XREF: seg158:005Cj
		push	word_70EA2
		call	Video_PrintString_5EFD3
		pop	cx
		push	0

loc_5F54E:
		call	CRT_Exit
		pop	cx
		pop	si
		leave
		retf
seg158		ends
