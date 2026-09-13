seg143		segment	byte public 'CODE' use16
		assume cs:seg143
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextFormat_ReleaseStyleList_5E526. Référencée depuis seg025 (framework UI).
; ==============================================================================================
TextFormat_ApplyStyleAttribute_5E2D0	proc far		; CODE XREF: seg025:00C3P
					; seg025:loc_1A9D3P ...

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

loc_5E2DB:				; DATA XREF: seg216:053Eo
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	ax, [di]
		mov	[si], ax
		mov	ax, [di+2]
		mov	[si+2],	ax
		mov	ax, [di+4]

loc_5E2F2:
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

loc_5E310:
		mov	[si+6],	ax
		mov	ax, [bp+var_6]
		mov	[si+8],	ax
		mov	ax, [bp+var_8]
		mov	[si+0Ah], ax
		mov	byte ptr [si+0Dh], 0

loc_5E323:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
TextFormat_ApplyStyleAttribute_5E2D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextFormat_ReleaseStyleList_5E526. Référencée par sub_14795.
; ==============================================================================================
TextFormat_ApplyStyleAttributeB_5E329	proc far		; CODE XREF: Text_TypewriterFrame+2AP
					; UI_PositionListLabels+14P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_5E334:
		push	si
		nop

loc_5E336:
		push	cs

loc_5E337:
		call	near ptr TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	ax, [di]

loc_5E33D:
		mov	[si], ax

loc_5E33F:
		mov	ax, [di+2]

loc_5E342:
		mov	[si+2],	ax
		mov	byte ptr [si+0Dh], 0
		pop	di
		pop	si
		pop	bp
		retf
TextFormat_ApplyStyleAttributeB_5E329	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 110 lignes, NON DÉTAILLÉE — combine Memory_TypedFreeWrapper_5C6F3,
; Memory_TypedFree_5C7B6 ×2, sub_5E4C8. Référencée directement par TextRenderer_Main
; (sub_27477, seg048).
; ==============================================================================================
TextRenderer_ApplyFormatChange_5E34D	proc far		; CODE XREF: TextRenderer_Main+346P
					; Font_ApplyStyleAndMeasure_87718+E8P ...

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

loc_5E357:
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
		jl	short loc_5E38B
		jmp	loc_5E40C
; ���������������������������������������������������������������������������

loc_5E38B:				; CODE XREF: TextRenderer_ApplyFormatChange_5E34D+39j
		push	0
		push	2
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_5E40C
		cmp	word ptr [si+2], 0
		jz	short loc_5E3CF
		cmp	[bp+arg_2], 0
		jz	short loc_5E3CF
		test	byte ptr [si+0Dh], 1
		jz	short loc_5E3FC
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_5E3FC
; ���������������������������������������������������������������������������

loc_5E3CF:				; CODE XREF: TextRenderer_ApplyFormatChange_5E34D+5Fj
					; TextRenderer_ApplyFormatChange_5E34D+65j
		push	word ptr [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_5E4C8
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5E3FC
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	[bp+var_4], 0

loc_5E3FC:				; CODE XREF: TextRenderer_ApplyFormatChange_5E34D+6Bj
					; TextRenderer_ApplyFormatChange_5E34D+80j ...
		cmp	[bp+var_4], 0
		jz	short loc_5E40C
		mov	ax, word ptr [bp+var_4+2]
		mov	[si], ax
		or	byte ptr [si+0Dh], 1

loc_5E40C:				; CODE XREF: TextRenderer_ApplyFormatChange_5E34D+3Bj
					; TextRenderer_ApplyFormatChange_5E34D+59j ...
		cmp	[bp+var_4], 0
		jz	short loc_5E418

loc_5E413:
		mov	ax, 1

loc_5E416:
		jmp	short loc_5E41A
; ���������������������������������������������������������������������������

loc_5E418:				; CODE XREF: TextRenderer_ApplyFormatChange_5E34D+C4j
		xor	ax, ax

loc_5E41A:				; CODE XREF: TextRenderer_ApplyFormatChange_5E34D:loc_5E416j
		pop	si
		leave
		retf
TextRenderer_ApplyFormatChange_5E34D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_5E4C8 et sub_5E5AC. Référencée par TextRenderer_GetOrInitFormatState_5D9FD
; (seg140).
; ==============================================================================================
TextFormat_SetAttribute_5E41D	proc far		; CODE XREF: TextRenderer_GetOrInitFormatState_5D9FD+3AP

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp

loc_5E41E:
		mov	bp, sp
		push	si

loc_5E421:
		mov	si, [bp+arg_0]
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh

loc_5E433:
		mov	word ptr [si+0Ah], 0C7h	; '�'
		mov	word ptr [si], 0A000h

loc_5E43C:
		push	0
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_5E4C8
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_5E45A
		mov	al, [bp+arg_2]
		push	ax
		push	si
		nop
		push	cs

loc_5E454:
		call	near ptr TextFormat_ReleaseAttribute_5E5AC

loc_5E457:
		add	sp, 4

loc_5E45A:				; CODE XREF: TextFormat_SetAttribute_5E41D+2Ej
		pop	si
		pop	bp
		retf
TextFormat_SetAttribute_5E41D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TextFormat_ReleaseStyleList_5E526, sub_5E4C8, sub_5E5AC. Référencée par
; PagedMemory_InitSubsystem_5BB0D (seg127).
; ==============================================================================================
TextFormat_InitAttributeTable_5E45D	proc far		; CODE XREF: PagedMemory_InitSubsystem_5BB0D+B3P
					; TextScrollDisplayB_InitAndRegister_67E34+45P

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

loc_5E460:
		sub	sp, 0Ah
		push	si

loc_5E464:
		mov	si, [bp+arg_0]

loc_5E467:
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_5E526
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
		call	near ptr TextFormat_ResolveStyleEntry_5E4C8
		add	sp, 4
		cmp	[bp+arg_10], 0
		jz	short loc_5E4C5
		mov	al, [bp+arg_E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4

loc_5E4C5:				; CODE XREF: TextFormat_InitAttributeTable_5E45D+59j
		pop	si
		leave
		retf
TextFormat_InitAttributeTable_5E45D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_5E66E. Utilisée par TextRenderer_ApplyFormatChange_5E34D,
; TextFormat_SetAttribute_5E41D et TextFormat_InitAttributeTable_5E45D.
; ==============================================================================================
TextFormat_ResolveStyleEntry_5E4C8	proc far		; CODE XREF: TextRenderer_ApplyFormatChange_5E34D+88p
					; TextFormat_SetAttribute_5E41D+24p ...

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
		jz	short loc_5E4EE
		mov	al, [si+0Dh]

loc_5E4E1:
		and	al, 2

loc_5E4E3:
		mov	ah, 0

loc_5E4E5:
		or	ax, ax
		jnz	short loc_5E4EE
		mov	word ptr [si+2], 0

loc_5E4EE:				; CODE XREF: TextFormat_ResolveStyleEntry_5E4C8+14j
					; TextFormat_ResolveStyleEntry_5E4C8+1Fj
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
		call	TextFormat_RebuildLinearTable_5E66E
		add	sp, 8
		mov	dl, al
		or	dl, dl
		jz	short loc_5E51B
		or	byte ptr [si+0Dh], 2
		jmp	short loc_5E521
; ���������������������������������������������������������������������������

loc_5E51B:				; CODE XREF: TextFormat_ResolveStyleEntry_5E4C8+4Bj
		mov	ax, [bp+var_2]
		mov	[si+2],	ax

loc_5E521:				; CODE XREF: TextFormat_ResolveStyleEntry_5E4C8+51j
		mov	al, dl
		pop	si
		leave
		retf
TextFormat_ResolveStyleEntry_5E4C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère une liste d'attributs de style (sub_338, Memory_TypedFree_5C7B6). Référencée
; depuis seg025.
; ==============================================================================================
TextFormat_ReleaseStyleList_5E526	proc far		; CODE XREF: seg025:loc_1AAC7P
					; seg025:loc_1AAD1P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		test	byte ptr [si+0Dh], 2
		jz	short loc_5E54C
		cmp	word ptr [si+2], 0

loc_5E53A:
		jz	short loc_5E54C
		push	word ptr [si+2]

loc_5E53F:
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+2], 0
		jmp	short $+2

loc_5E54C:				; CODE XREF: TextFormat_ReleaseStyleList_5E526+Ej
					; TextFormat_ReleaseStyleList_5E526:loc_5E53Aj
		test	byte ptr [si+0Dh], 1

loc_5E550:
		jz	short loc_5E56F
		push	0
		push	2

loc_5E556:
		mov	ax, [si]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_5E56F:				; CODE XREF: TextFormat_ReleaseStyleList_5E526:loc_5E550j
		mov	byte ptr [si+0Dh], 0
		pop	si
		leave
		retf
TextFormat_ReleaseStyleList_5E526	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_60FE2. Référencée par sub_16898 (segment framework UI).
; ==============================================================================================
UI_ApplyEncodingHelper_5E576	proc far		; CODE XREF: UI_UpdateWidgetPair+19P
					; seg028:loc_1C8D2P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_5E58E
		push	[bp+arg_2]
		push	si
		call	Rect_BlitOverlapRegion_60FE2
		add	sp, 4

loc_5E58E:				; CODE XREF: UI_ApplyEncodingHelper_5E576+Aj
		pop	si
		pop	bp
		retf
UI_ApplyEncodingHelper_5E576	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si], 0
		jz	short loc_5E5A9
		push	si
		push	word ptr [bp+8]
		call	Rect_BlitOverlapRegion_60FE2
		add	sp, 4

loc_5E5A9:				; CODE XREF: seg143:02CBj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_60F94. Référencée par sub_1C5D8 (proche de
; SmallObject_RegisterInList_5D999, seg139).
; ==============================================================================================
TextFormat_ReleaseAttribute_5E5AC	proc far		; CODE XREF: Widget_DrawTooltip:loc_1C601P
					; seg032:06F4P	...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_5E5C5
		mov	al, [bp+arg_2]
		push	ax
		push	si
		call	Rect_FillRegion_60F94
		add	sp, 4

loc_5E5C5:				; CODE XREF: TextFormat_ReleaseAttribute_5E5AC+Aj
		pop	si
		pop	bp
		retf
TextFormat_ReleaseAttribute_5E5AC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	word ptr [si], 0
		jz	short loc_5E5F0
		mov	al, [bp+0Ah]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	word ptr [di+2]
		push	word ptr [di]
		push	si
		call	Rect_ComputeIntersection_60F02

loc_5E5ED:
		add	sp, 0Ch

loc_5E5F0:				; CODE XREF: seg143:0306j
		pop	di
		pop	si
		pop	bp

locret_5E5F3:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_60F02. Référencée par sub_60933.
; ==============================================================================================
UI_Helper_5E5F4	proc far		; CODE XREF: Widget_RenderWithAttributes_60933+7DP
					; seg163:loc_60A32P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si

loc_5E5F8:
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_5E619
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]

loc_5E610:
		push	si
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch

loc_5E619:				; CODE XREF: UI_Helper_5E5F4+Aj
		pop	si
		pop	bp
		retf
UI_Helper_5E5F4	endp

seg143		ends
