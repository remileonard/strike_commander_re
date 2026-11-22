seg152		segment	byte public 'CODE' use16
		assume cs:seg152
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextRenderer_LoadResourceFile_661AF (sub_661AF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 126 lignes, NON DÉTAILLÉE — construit un StreamReader temporaire
; (StreamReader_ConstructVariantA_63A39, seg190), l'ouvre en lecture
; (StreamReader_ReadDispatch_63D0E, seg190), et si succès lit son contenu
; (StreamReader_GetCapacity_64062, Memory_TypedFreeWrapperC_5C6F3). Référencée directement par
; TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
TextRenderer_LoadResourceFile_3DA1F	proc far		; CODE XREF: sub_3166+E7P
					; sub_3166+153P ...

var_6A		= word ptr -6Ah
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	[bp+var_4], 0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		pop	cx
		push	1
		push	[bp+arg_0]
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadDispatch_3B57E
		add	sp, 6
		cmp	al, 1
		jnz	short loc_3DAB2
		push	1
		push	0
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		pop	cx
		push	dx
		push	ax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_3DAB2
		push	0
		mov	al, [bp+arg_2]
		push	ax
		push	dx
		push	word ptr [bp+var_4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		pop	cx
		push	dx
		push	ax
		push	large [bp+var_C]
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh

loc_3DAB2:				; CODE XREF: TextRenderer_LoadResourceFile_3DA1F+2Bj
					; TextRenderer_LoadResourceFile_3DA1F+57j
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	2
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_Close_3B445
		add	sp, 4
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		leave
		retf
TextRenderer_LoadResourceFile_3DA1F	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	byte ptr [bp-2], 1
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		pop	cx
		mov	word ptr [bp-6Ah], 556h
		mov	dword ptr [bp-9], 100h
		mov	dword ptr [bp-0Dh], 0
		push	0
		push	word ptr [bp+6]
		lea	ax, [bp-6Ah]
		push	ax
		mov	bx, [bp-6Ah]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp-2],	al
		cmp	byte ptr [bp-2], 1
		jnz	short loc_3DB39
		push	large 0FFFFFFFFh
		push	large dword ptr	[bp+0Ch]
		push	large dword ptr	[bp+8]
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		cmp	eax, [bp+0Ch]
		jz	short loc_3DB39
		mov	byte ptr [bp-2], 0

loc_3DB39:				; CODE XREF: seg152:0102j seg152:0123j
		mov	al, [bp-2]
		mov	[bp-4],	al
		push	2
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	al, [bp-4]
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3DB80
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		jmp	short loc_3DB82
; ���������������������������������������������������������������������������

loc_3DB80:				; CODE XREF: seg152:0155j
		mov	ax, si

loc_3DB82:				; CODE XREF: seg152:016Ej
		mov	si, ax
		mov	al, [bp+8]
		push	ax
		push	word ptr [bp+6]
		push	cs
		call	near ptr TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		mov	al, [bp+8]
		mov	[bp-5],	al
		mov	eax, [bp-4]
		mov	[si], eax
		mov	al, [bp-5]
		mov	[si+4],	al
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	ax, si
		pop	si
		leave
		retf
seg152		ends
