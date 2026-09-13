seg160		segment	byte public 'CODE' use16
		assume cs:seg160
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, référencée via vtable (DATA XREF seg216) et par des dizaines de fonctions dans toute
; la base, notamment Render_TerrainPipelineMain (sub_345D6, seg074) — gestionnaire d'erreur
; fatale/assertion : garde de réentrance (byte_70EEE), formate un message (sub_2962), résout
; le nom de la classe fautive via Memory_AllocatorTable_PopulateSlots_5CB99 (tag 5C44h, le
; gestionnaire de mémoire typée), imprime le diagnostic à l'écran (Video_PrintString_5EFD3,
; plusieurs fois, avec un tag fixe 3DFAh), puis appelle sub_3C2(1) — probable
; terminaison/abandon du programme. CONFIRMÉ par le seg339 : le dialogue d'erreur fatale
; affiché est exactement « Strike Commander has encountered an Error that it cannot recover
; from... » avec un code « Error Code: %X-%X » et une invite à contacter le support Origin —
; texte utilisateur final retrouvé tel quel.
; ==============================================================================================
Runtime_FatalErrorHandler_5F700	proc far		; CODE XREF: Render_TerrainPipelineMain+215BP
					; TextObject_AllocateVariantA_5A984+2AP ...

var_202		= word ptr -202h
var_102		= word ptr -102h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 202h

loc_5F707:				; DATA XREF: seg216:05C6o
		push	si
		mov	dx, [bp+arg_0]
		cmp	byte_70EEE, 0
		jnz	short loc_5F78A
		mov	byte_70EEE, 1
		lea	ax, [bp+var_102]
		cmp	ax, dx
		jz	short loc_5F734
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		lea	ax, [bp+var_102]
		push	ax
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_5F734:				; CODE XREF: Runtime_FatalErrorHandler_5F700+1Dj
		push	5C44h
		call	Memory_AllocatorTable_PopulateSlots_5CB99
		pop	cx
		mov	si, ax
		or	si, si
		jz	short loc_5F75A
		push	5C44h
		call	Memory_AllocatorTable_PopulateSlots_5CB99
		pop	cx
		push	ax
		lea	ax, [bp+var_202]
		push	ax

loc_5F752:
		call	CRT_Strcpy
		add	sp, 4

loc_5F75A:				; CODE XREF: Runtime_FatalErrorHandler_5F700+41j
		call	PagedResourceC_RefreshAllInstances_5F4E0
		or	si, si
		jz	short loc_5F76E
		lea	ax, [bp+var_202]
		push	ax
		call	Video_PrintString_5EFD3
		pop	cx

loc_5F76E:				; CODE XREF: Runtime_FatalErrorHandler_5F700+61j
		lea	ax, [bp+var_102]
		push	ax
		call	Video_PrintString_5EFD3
		pop	cx
		push	3DFAh
		call	Video_PrintString_5EFD3
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx

loc_5F78A:				; CODE XREF: Runtime_FatalErrorHandler_5F700+10j
		pop	si
		leave
		retf
Runtime_FatalErrorHandler_5F700	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]

loc_5F793:
		push	3E13h
		push	cs

loc_5F797:
		call	near ptr Runtime_FatalErrorHandler_5F700
		add	sp, 4

loc_5F79D:
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	3E21h
		push	cs
		call	near ptr Runtime_FatalErrorHandler_5F700

loc_5F7AF:
		add	sp, 6
		pop	bp
		retf
seg160		ends
