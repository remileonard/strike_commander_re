seg103		segment	byte public 'CODE' use16
		assume cs:seg103
		;org 0Dh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_2FD4D:				; DATA XREF: seg170:040Eo dseg:13A4o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedResourceC_RefreshAllInstances_5F4E0 (sub_5F4E0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; pose un flag global (byte_72D74 bit1), recombine les flags de style
; (FontStyle_CombineFlags_5EC12, tag 5C60h) puis parcourt la liste globale des instances
; PagedResourceC (word_70EA8, seg134) en invoquant leur méthode de rafraîchissement virtuelle
; sur chacune. Référencée par sub_14279 et TextRenderer_InputFieldHandler (sub_5A0F3, seg124).
; ==============================================================================================
PagedResourceC_RefreshAllInstances_2FD55	proc far		; CODE XREF: sub_30D3+DP
					; Fatal_Error_310B:loc_3144P ...
		push	bp
		mov	bp, sp
		push	si
		or	byte_496C4, 2
		push	6640h
		call	FontStyle_CombineFlags_2F487
		pop	cx
		mov	si, word_4703A
		jmp	short loc_2FD76
; ���������������������������������������������������������������������������

loc_2FD6D:				; CODE XREF: PagedResourceC_RefreshAllInstances_2FD55+23j
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	si, [si+2]

loc_2FD76:				; CODE XREF: PagedResourceC_RefreshAllInstances_2FD55+16j
		or	si, si
		jnz	short loc_2FD6D
		pop	si
		pop	bp
		retf
PagedResourceC_RefreshAllInstances_2FD55	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceC_RefreshAndFinalize_5F508 (sub_5F508 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; PagedResourceC_RefreshAllInstances_5F4E0 puis sub_3C2. Référencée par sub_14279 et
; sub_67517.
; ==============================================================================================
PagedResourceC_RefreshAndFinalize_2FD7D	proc far		; CODE XREF: sub_3166+1B7P
					; HandlerRegistry4Slot_Register_3ED3B+10P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr PagedResourceC_RefreshAllInstances_2FD55
		push	[bp+arg_0]
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
PagedResourceC_RefreshAndFinalize_2FD7D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		push	cs
		call	near ptr PagedResourceC_RefreshAllInstances_2FD55
		cmp	si, word_47034
		jz	short loc_2FDB7
		lea	ax, [bp+8]
		mov	[bp-2],	ax
		push	ax
		push	si
		push	word_47034
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_2FDB7:				; CODE XREF: seg103:0061j
		push	word_47034
		call	Video_PrintString_2F848
		pop	cx
		push	0
		call	CRT_Exit
		pop	cx
		pop	si
		leave
		retf
seg103		ends
