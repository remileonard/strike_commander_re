seg086		segment	byte public 'CODE' use16
		assume cs:seg086
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_ApplyStyleAttribute_5E2D0 (sub_5E2D0 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle TextFormat_ReleaseStyleList_5E526.
; Référencée depuis seg025 (framework UI).
; ==============================================================================================
TextFormat_ApplyStyleAttribute_2E9A4	proc far		; CODE XREF: ClippedLayer_DrawAt_B4CD+21P sub_CE2C+96P ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_2E9AF:				; DATA XREF: seg170:0386o
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_2EBFA
		pop	cx
		mov	ax, [di]
		mov	[si], ax
		mov	ax, [di+2]
		mov	[si+2],	ax
		mov	ax, [di+4]
		mov	[bp+var_2], ax
		mov	ax, [di+6]
		mov	[bp+var_4], ax
		mov	ax, [di+8]
		mov	[bp+var_6], ax
		mov	ax, [di+0Ah]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+4],	ax
		mov	ax, [bp+var_4]
		mov	[si+6],	ax
		mov	ax, [bp+var_6]
		mov	[si+8],	ax
		mov	ax, [bp+var_8]
		mov	[si+0Ah], ax
		mov	byte ptr [si+0Dh], 0
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
TextFormat_ApplyStyleAttribute_2E9A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_ApplyStyleAttributeB_5E329 (sub_5E329 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle TextFormat_ReleaseStyleList_5E526.
; Référencée par sub_14795.
; ==============================================================================================
TextFormat_ApplyStyleAttributeB_2E9FD	proc far		; CODE XREF: sub_C0FBC+17P
					; sub_C72E4+30P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_2EBFA
		pop	cx
		mov	ax, [di]
		mov	[si], ax
		mov	ax, [di+2]
		mov	[si+2],	ax
		mov	byte ptr [si+0Dh], 0
		pop	di
		pop	si
		pop	bp
		retf
TextFormat_ApplyStyleAttributeB_2E9FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextRenderer_ApplyFormatChange_5E34D (sub_5E34D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 110 lignes, NON DÉTAILLÉE — combine Memory_TypedFreeWrapper_5C6F3, Memory_TypedFree_5C7B6
; ×2, sub_5E4C8. Référencée directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
TextRenderer_ApplyFormatChange_2EA21	proc far		; CODE XREF: sub_4C1F+7DP
					; Gameflow_PlayShot_4AD86+642P ...

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		mov	[bp+var_8], ax
		imul	[bp+var_6]
		movzx	eax, ax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0FFF0h
		jl	short loc_2EA5F
		jmp	loc_2EAE0
; ���������������������������������������������������������������������������

loc_2EA5F:				; CODE XREF: TextRenderer_ApplyFormatChange_2EA21+39j
		push	0
		push	2
		push	2
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_2EAE0
		cmp	word ptr [si+2], 0
		jz	short loc_2EAA3
		cmp	[bp+arg_2], 0
		jz	short loc_2EAA3
		test	byte ptr [si+0Dh], 1
		jz	short loc_2EAD0
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short loc_2EAD0
; ���������������������������������������������������������������������������

loc_2EAA3:				; CODE XREF: TextRenderer_ApplyFormatChange_2EA21+5Fj
					; TextRenderer_ApplyFormatChange_2EA21+65j
		push	word ptr [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_2EB9C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2EAD0
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	[bp+var_4], 0

loc_2EAD0:				; CODE XREF: TextRenderer_ApplyFormatChange_2EA21+6Bj
					; TextRenderer_ApplyFormatChange_2EA21+80j ...
		cmp	[bp+var_4], 0
		jz	short loc_2EAE0
		mov	ax, word ptr [bp+var_4+2]
		mov	[si], ax
		or	byte ptr [si+0Dh], 1

loc_2EAE0:				; CODE XREF: TextRenderer_ApplyFormatChange_2EA21+3Bj
					; TextRenderer_ApplyFormatChange_2EA21+59j ...
		cmp	[bp+var_4], 0
		jz	short loc_2EAEC
		mov	ax, 1
		jmp	short loc_2EAEE
; ���������������������������������������������������������������������������

loc_2EAEC:				; CODE XREF: TextRenderer_ApplyFormatChange_2EA21+C4j
		xor	ax, ax

loc_2EAEE:				; CODE XREF: TextRenderer_ApplyFormatChange_2EA21+C9j
		pop	si
		leave
		retf
TextRenderer_ApplyFormatChange_2EA21	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_SetAttribute_5E41D (sub_5E41D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_5E4C8 et sub_5E5AC. Référencée
; par TextRenderer_GetOrInitFormatState_5D9FD (seg140).
; ==============================================================================================
TextFormat_SetAttribute_2EAF1	proc far		; CODE XREF: TextRenderer_GetOrInitFormatState_2CC2B+3AP

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 0C7h	; '�'
		mov	word ptr [si], 0A000h
		push	0
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_2EB9C
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_2EB2E
		mov	al, [bp+arg_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseAttribute_2EC80
		add	sp, 4

loc_2EB2E:				; CODE XREF: TextFormat_SetAttribute_2EAF1+2Ej
		pop	si
		pop	bp
		retf
TextFormat_SetAttribute_2EAF1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_InitAttributeTable_5E45D (sub_5E45D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine TextFormat_ReleaseStyleList_5E526,
; sub_5E4C8, sub_5E5AC. Référencée par PagedMemory_InitSubsystem_5BB0D (seg127).
; ==============================================================================================
TextFormat_InitAttributeTable_2EB31	proc far		; CODE XREF: PagedMemory_InitSubsystem_2ABFB+B3P
					; TextScrollDisplayB_InitAndRegister_3F658+45P

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_2EBFA
		pop	cx
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+4],	ax
		mov	ax, [bp+var_4]
		mov	[si+6],	ax
		mov	ax, [bp+var_6]
		mov	[si+8],	ax
		mov	ax, [bp+var_8]
		mov	[si+0Ah], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_A], ax
		mov	[si], ax
		push	[bp+arg_4]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_2EB9C
		add	sp, 4
		cmp	[bp+arg_10], 0
		jz	short loc_2EB99
		mov	al, [bp+arg_E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseAttribute_2EC80
		add	sp, 4

loc_2EB99:				; CODE XREF: TextFormat_InitAttributeTable_2EB31+59j
		pop	si
		leave
		retf
TextFormat_InitAttributeTable_2EB31	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_ResolveStyleEntry_5E4C8 (sub_5E4C8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_5E66E. Utilisée par
; TextRenderer_ApplyFormatChange_5E34D, TextFormat_SetAttribute_5E41D et
; TextFormat_InitAttributeTable_5E45D.
; ==============================================================================================
TextFormat_ResolveStyleEntry_2EB9C	proc far		; CODE XREF: TextRenderer_ApplyFormatChange_2EA21+88p
					; TextFormat_SetAttribute_2EAF1+24p ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_2EBC2
		mov	al, [si+0Dh]
		and	al, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2EBC2
		mov	word ptr [si+2], 0

loc_2EBC2:				; CODE XREF: TextFormat_ResolveStyleEntry_2EB9C+14j
					; TextFormat_ResolveStyleEntry_2EB9C+1Fj
		push	[bp+arg_2]
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		push	ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_RebuildLinearTable_2ED42
		add	sp, 8
		mov	dl, al
		or	dl, dl
		jz	short loc_2EBEF
		or	byte ptr [si+0Dh], 2
		jmp	short loc_2EBF5
; ���������������������������������������������������������������������������

loc_2EBEF:				; CODE XREF: TextFormat_ResolveStyleEntry_2EB9C+4Bj
		mov	ax, [bp+var_2]
		mov	[si+2],	ax

loc_2EBF5:				; CODE XREF: TextFormat_ResolveStyleEntry_2EB9C+51j
		mov	al, dl
		pop	si
		leave
		retf
TextFormat_ResolveStyleEntry_2EB9C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextFormat_ReleaseStyleList_5E526 (sub_5E526 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère une liste d'attributs de style (sub_338, Memory_TypedFree_5C7B6). Référencée depuis
; seg025.
; ==============================================================================================
TextFormat_ReleaseStyleList_2EBFA	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+180P
					; Gameflow_PlayScene_3B0B+1A7P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		test	byte ptr [si+0Dh], 2
		jz	short loc_2EC20
		cmp	word ptr [si+2], 0
		jz	short loc_2EC20
		push	word ptr [si+2]
		call	sub_308
		pop	cx
		mov	word ptr [si+2], 0
		jmp	short $+2

loc_2EC20:				; CODE XREF: TextFormat_ReleaseStyleList_2EBFA+Ej
					; TextFormat_ReleaseStyleList_2EBFA+14j
		test	byte ptr [si+0Dh], 1
		jz	short loc_2EC43
		push	0
		push	2
		mov	ax, [si]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_2EC43:				; CODE XREF: TextFormat_ReleaseStyleList_2EBFA+2Aj
		mov	byte ptr [si+0Dh], 0
		pop	si
		leave
		retf
TextFormat_ReleaseStyleList_2EBFA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; UI_ApplyEncodingHelper_5E576 (sub_5E576 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_60FE2. Référencée par sub_16898
; (segment framework UI).
; ==============================================================================================
UI_ApplyEncodingHelper_2EC4A	proc far		; CODE XREF: seg046:0032P seg063:002FP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2EC62
		push	[bp+arg_2]
		push	si
		call	Rect_BlitOverlapRegion_31FCA
		add	sp, 4

loc_2EC62:				; CODE XREF: UI_ApplyEncodingHelper_2EC4A+Aj
		pop	si
		pop	bp
		retf
UI_ApplyEncodingHelper_2EC4A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UI_ApplyEncodingHelper_5E576 (sub_5E576 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_60FE2. Référencée par sub_16898 (segment framework UI).
; ==============================================================================================
UI_ApplyEncodingHelper_2EC65	proc far		; CODE XREF: sub_502B+1B0P
					; Scene_Tick_C652+98P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2EC7D
		push	si
		push	[bp+arg_2]
		call	Rect_BlitOverlapRegion_31FCA
		add	sp, 4

loc_2EC7D:				; CODE XREF: UI_ApplyEncodingHelper_2EC65+Aj
		pop	si
		pop	bp
		retf
UI_ApplyEncodingHelper_2EC65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_ReleaseAttribute_5E5AC (sub_5E5AC de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_60F94. Référencée par sub_1C5D8
; (proche de SmallObject_RegisterInList_5D999, seg139).
; ==============================================================================================
TextFormat_ReleaseAttribute_2EC80	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+217P
					; Gameflow_MainLoop_3D2E+63P	...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2EC99
		mov	al, [bp+arg_2]
		push	ax
		push	si
		call	Rect_FillRegion_31F7C
		add	sp, 4

loc_2EC99:				; CODE XREF: TextFormat_ReleaseAttribute_2EC80+Aj
		pop	si
		pop	bp
		retf
TextFormat_ReleaseAttribute_2EC80	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	word ptr [si], 0
		jz	short loc_2ECC4
		mov	al, [bp+0Ah]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	word ptr [di+2]
		push	word ptr [di]
		push	si
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch

loc_2ECC4:				; CODE XREF: seg086:030Aj
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à UI_Helper_5E5F4
; (sub_5E5F4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle sub_60F02. Référencée par sub_60933.
; ==============================================================================================
UI_Helper_2ECC8	proc far		; CODE XREF: Widget_RenderWithAttributes_3159D+7DP
					; seg109:025CP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2ECED
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch

loc_2ECED:				; CODE XREF: UI_Helper_2ECC8+Aj
		pop	si
		pop	bp
		retf
UI_Helper_2ECC8	endp

seg086		ends
