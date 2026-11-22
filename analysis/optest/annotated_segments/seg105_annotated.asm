seg105		segment	byte public 'CODE' use16
		assume cs:seg105
		;org 5
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Runtime_FatalErrorHandler_5F700 (sub_5F700 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far,
; référencée via vtable (DATA XREF seg216) et par des dizaines de fonctions dans toute la
; base, notamment Render_TerrainPipelineMain (sub_345D6, seg074) — gestionnaire d'erreur
; fatale/assertion : garde de réentrance (byte_70EEE), formate un message (sub_2962), résout
; le nom de la classe fautive via Memory_AllocatorTable_PopulateSlots_5CB99 (tag 5C44h, le
; gestionnaire de mémoire typée), imprime le diagnostic à l'écran (Video_PrintString_5EFD3,
; plusieurs fois, avec un tag fixe 3DFAh), puis appelle sub_3C2(1) — probable
; terminaison/abandon du programme. CONFIRMÉ par le seg339 : le dialogue d'erreur fatale
; affiché est exactement « Strike Commander has encountered an Error that it cannot recover
; from... » avec un code « Error Code: %X-%X » et une invite à contacter le support Origin —
; texte utilisateur final retrouvé tel quel.
; ==============================================================================================
Runtime_FatalErrorHandler_2FF75	proc far		; CODE XREF: seg105:009Cp seg105:00B1p

var_202		= word ptr -202h
var_102		= word ptr -102h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 202h

loc_2FF7C:				; DATA XREF: seg170:041Eo
		push	si
		mov	dx, [bp+arg_0]
		cmp	byte_47080, 0
		jnz	short loc_2FFFF
		mov	byte_47080, 1
		lea	ax, [bp+var_102]
		cmp	ax, dx
		jz	short loc_2FFA9
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		lea	ax, [bp+var_102]
		push	ax
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_2FFA9:				; CODE XREF: Runtime_FatalErrorHandler_2FF75+1Dj
		push	661Ah
		call	Memory_AllocatorTable_PopulateSlots_2BC87
		pop	cx
		mov	si, ax
		or	si, si
		jz	short loc_2FFCF
		push	661Ah
		call	Memory_AllocatorTable_PopulateSlots_2BC87
		pop	cx
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_2FFCF:				; CODE XREF: Runtime_FatalErrorHandler_2FF75+41j
		call	PagedResourceC_RefreshAllInstances_2FD55
		or	si, si
		jz	short loc_2FFE3
		lea	ax, [bp+var_202]
		push	ax
		call	Video_PrintString_2F848
		pop	cx

loc_2FFE3:				; CODE XREF: Runtime_FatalErrorHandler_2FF75+61j
		lea	ax, [bp+var_102]
		push	ax
		call	Video_PrintString_2F848
		pop	cx
		push	401Ch
		call	Video_PrintString_2F848
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx

loc_2FFFF:				; CODE XREF: Runtime_FatalErrorHandler_2FF75+10j
		pop	si
		leave
		retf
Runtime_FatalErrorHandler_2FF75	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	4035h
		push	cs
		call	near ptr Runtime_FatalErrorHandler_2FF75
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	4043h
		push	cs
		call	near ptr Runtime_FatalErrorHandler_2FF75
		add	sp, 6
		pop	bp
		retf
seg105		ends
