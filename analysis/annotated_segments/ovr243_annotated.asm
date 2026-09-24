ovr243		segment	para public 'OVERLAY' use16
		assume cs:ovr243
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry), combine Formation_ComputeGeometryHelper_56D43 (seg116) et
; String_ConstructEmpty — premier d'une famille de constructeurs de symboles HUD très
; similaires (voir aussi ovr244).
; ==============================================================================================
HUDSymbol_ConstructVariantA_804F0	proc far		; CODE XREF: VROOMM_StubThunk_6AF62J

var_84		= word ptr -84h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_80511
		push	142h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_80511
		jmp	loc_805F3
; ���������������������������������������������������������������������������

loc_80511:				; CODE XREF: HUDSymbol_ConstructVariantA_804F0+Dj
					; HUDSymbol_ConstructVariantA_804F0+1Cj
		mov	ax, si

loc_80513:
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 6A2h
		mov	word ptr [si+98h], 0
		mov	word ptr [si+50h], 65Ah
		mov	word ptr [si+9Fh], 0
		mov	word ptr [si+0A1h], 0
		mov	ax, si
		add	ax, 0A4h ; '�'
		mov	ax, si
		add	ax, 0B0h ; '�'
		mov	ax, si
		add	ax, 0BCh ; '�'
		mov	ax, si
		add	ax, 0C0h ; '�'
		mov	ax, si
		add	ax, 0C4h ; '�'
		mov	ax, si
		add	ax, 0D0h ; '�'
		mov	ax, si
		add	ax, 0DCh ; '�'
		mov	ax, si
		add	ax, 0E8h ; '�'
		mov	ax, si
		add	ax, 0F4h ; '�'
		mov	ax, si
		add	ax, 100h
		mov	ax, si
		add	ax, 104h
		mov	ax, si
		add	ax, 108h
		mov	ax, si
		add	ax, 10Dh
		mov	ax, si
		add	ax, 119h
		mov	ax, si
		add	ax, 125h

loc_805B3:
		mov	ax, si
		add	ax, 129h
		mov	ax, si
		add	ax, 12Dh
		mov	ax, si
		add	ax, 131h
		mov	ax, si
		add	ax, 135h
		mov	ax, si
		add	ax, 139h
		mov	ax, si
		add	ax, 13Dh
		push	large 24h ; '$'
		push	ss
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngle_80701
		add	sp, 4

loc_805F3:				; CODE XREF: HUDSymbol_ConstructVariantA_804F0+1Ej
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantA_804F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0 (variante de symbole HUD).
; ==============================================================================================
HUDSymbol_ConstructVariantB_805F8	proc far		; CODE XREF: VROOMM_StubThunk_6AF6CJ

var_84		= word ptr -84h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_80619
		push	142h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax

loc_80614:
		jnz	short loc_80619
		jmp	loc_806FC
; ���������������������������������������������������������������������������

loc_80619:				; CODE XREF: HUDSymbol_ConstructVariantB_805F8+Dj
					; HUDSymbol_ConstructVariantB_805F8:loc_80614j
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax

loc_80630:
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 6A2h
		mov	word ptr [si+98h], 0
		mov	word ptr [si+50h], 65Ah
		mov	word ptr [si+9Fh], 0
		mov	word ptr [si+0A1h], 0
		mov	ax, si
		add	ax, 0A4h ; '�'
		mov	ax, si
		add	ax, 0B0h ; '�'
		mov	ax, si
		add	ax, 0BCh ; '�'
		mov	ax, si
		add	ax, 0C0h ; '�'
		mov	ax, si
		add	ax, 0C4h ; '�'
		mov	ax, si
		add	ax, 0D0h ; '�'
		mov	ax, si
		add	ax, 0DCh ; '�'
		mov	ax, si
		add	ax, 0E8h ; '�'
		mov	ax, si
		add	ax, 0F4h ; '�'
		mov	ax, si
		add	ax, 100h
		mov	ax, si
		add	ax, 104h
		mov	ax, si
		add	ax, 108h
		mov	ax, si
		add	ax, 10Dh
		mov	ax, si
		add	ax, 119h
		mov	ax, si
		add	ax, 125h
		mov	ax, si
		add	ax, 129h
		mov	ax, si
		add	ax, 12Dh
		mov	ax, si
		add	ax, 131h
		mov	ax, si
		add	ax, 135h
		mov	ax, si
		add	ax, 139h
		mov	ax, si
		add	ax, 13Dh
		push	84h ; '�'
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngle_80701
		add	sp, 4

loc_806FC:				; CODE XREF: HUDSymbol_ConstructVariantB_805F8+1Ej
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantB_805F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 191 lignes, NON DÉTAILLÉE — combine allocation, copie de chaîne, Math_Tan_548AD
; (seg115).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngle_80701	proc far		; CODE XREF: VROOMM_StubThunk_6AF67J HUDSymbol_ConstructVariantA_804F0+FDp	...

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [di+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [di+20h]
		mov	[bp+var_6], ax
		mov	ax, [di+22h]

loc_80724:
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_80773
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 44Ch
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	VROOMM_StubThunk_6BBE0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_80776
; ���������������������������������������������������������������������������

loc_80773:				; CODE XREF: HUDSymbol_ConstructAndInitAngle_80701+33j
		mov	ax, [bp+var_A]

loc_80776:				; CODE XREF: HUDSymbol_ConstructAndInitAngle_80701+70j
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 18h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_24], eax
		push	large dword ptr	[di+12h]
		mov	ax, di
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	VROOMM_StubThunk_6B0EE
		add	sp, 12h
		mov	[bp+var_10], di
		push	8
		push	[bp+var_10]
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	al, [di+8]
		mov	[bp+var_11], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		mov	cx, di
		add	cx, 24h	; '$'
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0A4h], eax
		mov	eax, [bx+4]
		mov	[si+0A8h], eax
		mov	eax, [bx+8]
		mov	[si+0ACh], eax
		mov	cx, di
		add	cx, 30h	; '0'
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0B0h], eax
		mov	eax, [bx+4]
		mov	[si+0B4h], eax
		mov	eax, [bx+8]

loc_80823:
		mov	[si+0B8h], eax
		mov	eax, [di+3Ch]
		mov	[si+0BCh], eax
		mov	cx, di
		add	cx, 40h	; '@'
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0C4h], eax
		mov	eax, [bx+4]
		mov	[si+0C8h], eax
		mov	eax, [bx+8]
		mov	[si+0CCh], eax
		mov	cx, di
		add	cx, 4Ch	; 'L'
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0D0h], eax
		mov	eax, [bx+4]
		mov	[si+0D4h], eax
		mov	eax, [bx+8]
		mov	[si+0D8h], eax
		mov	eax, [di+58h]
		mov	[si+125h], eax
		mov	eax, [di+5Ch]
		mov	[si+129h], eax
		mov	eax, [di+60h]
		mov	[si+12Dh], eax
		mov	eax, [di+64h]
		mov	[si+131h], eax
		mov	ax, si
		add	ax, 60h	; '`'
		mov	[bp+var_14], ax
		mov	eax, [si+131h]
		mov	bx, [bp+var_14]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+131h], eax
		mov	ax, si
		add	ax, 131h
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		call	Math_Tan_548AD
		add	sp, 6
		mov	eax, [bp+var_18]
		mov	[si+135h], eax
		mov	eax, [di+68h]
		mov	[si+100h], eax
		mov	eax, [di+6Ch]
		mov	[si+104h], eax
		mov	eax, [di+70h]
		mov	[si+108h], eax
		mov	cx, di
		add	cx, 74h	; 't'
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0DCh], eax
		mov	eax, [bx+4]
		mov	[si+0E0h], eax
		mov	eax, [bx+8]
		mov	[si+0E4h], eax
		mov	eax, [di+80h]
		mov	[si+139h], eax
		mov	byte ptr [si+0A3h], 7
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngle_80701	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (28 lignes).
; ==============================================================================================
HUDSymbol_Helper_80922	proc far		; CODE XREF: VROOMM_StubThunk_6AF71J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+9Fh], 0
		jz	short loc_80946
		cmp	word ptr [si+89h], 0
		jz	short loc_80946
		push	si
		call	VROOMM_StubThunk_6BC26
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx

loc_80946:				; CODE XREF: HUDSymbol_Helper_80922+Cj
					; HUDSymbol_Helper_80922+13j
		mov	al, [si+52h]
		and	ax, 1
		pop	si
		pop	bp
		retf
HUDSymbol_Helper_80922	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (18 lignes).
; ==============================================================================================
HUDSymbol_Helper2_8094F	proc far		; CODE XREF: VROOMM_StubThunk_6AF76J

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_70468, eax
		push	dx
		call	VROOMM_StubThunk_6BC2B
		pop	cx
		leave
		retf
HUDSymbol_Helper2_8094F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 190 lignes, NON DÉTAILLÉE — combine Matrix_LocalToWorld_58828 (seg117),
; UI_ApplyLineOfSightAndTransform_57DAE (seg116), TextObject_AllocateVariantA_5A984 (×2,
; seg125).
; ==============================================================================================
HUDSymbol_DrawWithLineOfSight_80971	proc far		; CODE XREF: VROOMM_StubThunk_6AF44J HUDSymbol_ConstructWithViewMatrix_82693+A6p

var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+9Fh]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 0E8h ; '�'
		mov	eax, [di]
		mov	[bp+var_30], eax
		mov	eax, [di+4]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	[bp+var_28], eax
		push	word ptr [si+9Fh]
		mov	bx, [si+9Fh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	eax, [bp+var_30]
		add	[si+14h], eax
		mov	eax, [bp+var_2C]
		add	[si+18h], eax
		mov	eax, [bp+var_28]
		add	[si+1Ch], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	cx, si
		add	cx, 14h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_3C], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_38], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_1C], eax
		cmp	dword ptr [si+0C0h], 0
		jle	short loc_80A57
		mov	ax, 1
		jmp	short loc_80A59
; ���������������������������������������������������������������������������

loc_80A57:				; CODE XREF: HUDSymbol_DrawWithLineOfSight_80971+DFj
		xor	ax, ax

loc_80A59:				; CODE XREF: HUDSymbol_DrawWithLineOfSight_80971+E4j
		or	al, al
		jz	short loc_80A7B
		lea	ax, [bp+var_24]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	eax, dword_70458
		sub	[si+0C0h], eax
		jmp	loc_80B70
; ���������������������������������������������������������������������������

loc_80A7B:				; CODE XREF: HUDSymbol_DrawWithLineOfSight_80971+EAj
		mov	al, [si+9Eh]
		mov	ah, 0
		cmp	ax, 9
		jnz	short loc_80AF3
		mov	di, si
		add	di, 0D0h ; '�'
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		shl	eax, 3
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[si+8Ch], eax
		mov	eax, [bp+var_24]
		mov	[si+0F4h], eax
		mov	eax, [bp+var_20]
		mov	[si+0F8h], eax
		mov	eax, [bp+var_1C]
		mov	[si+0FCh], eax
		mov	byte ptr [si+0A3h], 2
		cmp	word_70859, 13h
		jz	short loc_80AE9
		jmp	loc_80B70
; ���������������������������������������������������������������������������

loc_80AE9:				; CODE XREF: HUDSymbol_DrawWithLineOfSight_80971+173j
		push	15h
		call	TextObject_AllocateVariantA_5A984
		pop	cx
		jmp	short loc_80B70
; ���������������������������������������������������������������������������

loc_80AF3:				; CODE XREF: HUDSymbol_DrawWithLineOfSight_80971+113j
		mov	di, si
		add	di, 0C4h ; '�'
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax
		mov	di, si
		add	di, 100h
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 104h
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	[si+90h], eax
		mov	byte ptr [si+0A3h], 1
		push	8
		call	TextObject_AllocateVariantA_5A984
		pop	cx

loc_80B70:				; CODE XREF: HUDSymbol_DrawWithLineOfSight_80971+107j
					; HUDSymbol_DrawWithLineOfSight_80971+175j ...
		pop	di
		pop	si
		leave
		retf
HUDSymbol_DrawWithLineOfSight_80971	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 774 lignes, NON DÉTAILLÉE — combine Formation_ComputeGeometryHelper_56D43,
; UI_ApplyLineOfSightAndTransform_57DAE, Camera_ClipTestWrapper, longueur vectorielle — rendu
; d'un symbole HUD avec test de clipping caméra. Motif répété identiquement pour plusieurs
; symboles (voir ovr244). Candidat prioritaire pour session dédiée.
; ==============================================================================================
HUDSymbol_RenderWithClipTest_80B74	proc far		; CODE XREF: VROOMM_StubThunk_6AF49J HUDSymbol_ConstructWithViewMatrix_82693+AFp

var_1CC		= dword	ptr -1CCh
var_1C8		= dword	ptr -1C8h
var_1C4		= dword	ptr -1C4h
var_1C0		= dword	ptr -1C0h
var_1BC		= dword	ptr -1BCh
var_1B8		= dword	ptr -1B8h
var_1B4		= dword	ptr -1B4h
var_1B0		= dword	ptr -1B0h
var_1AC		= dword	ptr -1ACh
var_1A8		= dword	ptr -1A8h
var_1A4		= dword	ptr -1A4h
var_1A0		= dword	ptr -1A0h
var_19C		= dword	ptr -19Ch
var_198		= dword	ptr -198h
var_194		= dword	ptr -194h
var_190		= dword	ptr -190h
var_18C		= dword	ptr -18Ch
var_188		= dword	ptr -188h
var_184		= dword	ptr -184h
var_180		= dword	ptr -180h
var_17C		= dword	ptr -17Ch
var_178		= dword	ptr -178h
var_174		= dword	ptr -174h
var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= word ptr -0E8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= word ptr -94h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= word ptr -7Ah
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= word ptr -70h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1CCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0C4h ; '�'
		mov	eax, [di]
		mov	[bp+var_B8], eax
		mov	eax, [di+4]
		mov	[bp+var_B4], eax
		mov	eax, [di+8]
		mov	[bp+var_B0], eax
		mov	di, si
		add	di, 8Ch	; '�'
		mov	eax, [bp+var_B8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B0]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B0], eax
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C4], eax
		mov	eax, [di+4]
		mov	[bp+var_C0], eax
		mov	eax, [di+8]
		mov	[bp+var_BC], eax
		lea	ax, [bp+var_E8]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		lea	ax, [bp+var_B8]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_B8], eax
		mov	eax, [di+4]
		add	[bp+var_B4], eax
		mov	eax, [di+8]
		add	[bp+var_B0], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_B8]
		sub	eax, [di]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_B4]
		sub	eax, [di+4]
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_B0]
		sub	eax, [di+8]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_100]
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_F8]
		mov	[bp+var_EC], eax
		mov	di, si
		add	di, 125h
		mov	eax, [bp+var_F4]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_F0]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_EC]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_F4]
		add	[si+14h], eax
		mov	eax, [bp+var_F0]
		add	[si+18h], eax
		mov	eax, [bp+var_EC]
		add	[si+1Ch], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	ax, si
		add	ax, 119h
		mov	[bp+var_2], ax
		mov	eax, [di]
		mov	bx, [bp+var_2]
		add	eax, [bx]
		mov	[bp+var_118], eax
		mov	eax, [di+4]
		add	eax, [bx+4]
		mov	[bp+var_114], eax
		mov	eax, [di+8]
		add	eax, [bx+8]
		mov	[bp+var_110], eax
		mov	eax, [bp+var_118]
		mov	[bp+var_124], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_120], eax
		mov	eax, [bp+var_110]
		mov	[bp+var_11C], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_124]
		sub	eax, [di]
		mov	[bp+var_130], eax
		mov	eax, [bp+var_120]
		sub	eax, [di+4]
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_11C]
		sub	eax, [di+8]
		mov	[bp+var_128], eax
		mov	eax, [bp+var_130]
		mov	[bp+var_10C], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_104], eax
		mov	di, si
		add	di, 2Ch	; ','
		push	eax
		push	large [bp+var_108]
		push	large [bp+var_10C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	eax, [di]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_140], eax
		mov	di, si
		add	di, 12Dh
		mov	eax, [bp+var_10C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_108]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_104]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_154], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_148]
		add	eax, [bp+var_154]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_144]
		add	eax, [bp+var_150]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_140]
		add	eax, [bp+var_14C]
		mov	[bp+var_158], eax
		mov	eax, [bp+var_160]
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_15C]
		mov	[bp+var_138], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_134], eax
		lea	ax, [bp+var_10C]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		push	ss
		lea	ax, [bp+var_3E]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	eax, [si+131h]
		cmp	eax, [bp+var_3E]
		jge	short loc_80F5F
		mov	ax, 1
		jmp	short loc_80F61
; ���������������������������������������������������������������������������

loc_80F5F:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+3E4j
		xor	ax, ax

loc_80F61:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+3E9j
		or	al, al
		jnz	short loc_80F68
		jmp	loc_8103C
; ���������������������������������������������������������������������������

loc_80F68:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+3EFj
		mov	eax, [bp+var_13C]
		sub	eax, [bp+var_10C]
		mov	[bp+var_178], eax
		mov	eax, [bp+var_138]
		sub	eax, [bp+var_108]
		mov	[bp+var_174], eax
		mov	eax, [bp+var_134]
		sub	eax, [bp+var_104]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_178]
		mov	[bp+var_16C], eax
		mov	eax, [bp+var_174]
		mov	[bp+var_168], eax
		mov	eax, [bp+var_170]
		mov	[bp+var_164], eax
		push	large [bp+var_104]
		push	large [bp+var_108]
		push	large [bp+var_10C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_46], eax
		mov	[bp+var_42], eax
		mov	di, si
		add	di, 135h
		mov	eax, [bp+var_42]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_16C]
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_168]
		mov	[bp+var_138], eax
		mov	eax, [bp+var_164]
		mov	[bp+var_134], eax
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_10C]
		add	[bp+var_13C], eax
		mov	eax, [bp+var_108]
		add	[bp+var_138], eax
		mov	eax, [bp+var_104]
		add	[bp+var_134], eax

loc_8103C:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+3F1j
		lea	ax, [bp+var_13C]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_81059
		jmp	loc_81463
; ���������������������������������������������������������������������������

loc_81059:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+4E0j
		mov	di, [si+0A1h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_16C], eax
		mov	eax, [di+4]
		mov	[bp+var_168], eax
		mov	eax, [di+8]
		mov	[bp+var_164], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_178], eax
		mov	eax, [di+4]
		mov	[bp+var_174], eax
		mov	eax, [di+8]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_16C]
		sub	[bp+var_178], eax
		mov	eax, [bp+var_168]
		sub	[bp+var_174], eax
		mov	eax, [bp+var_164]
		sub	[bp+var_170], eax
		push	word ptr [si+0A1h]
		push	ss
		lea	ax, [bp+var_184]
		push	ax
		mov	bx, [si+0A1h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp+var_178]
		push	ax
		lea	ax, [bp+var_184]
		push	ax
		push	ss
		lea	ax, [bp+var_190]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_190]
		mov	[bp+var_184], eax
		mov	eax, [bp+var_18C]
		mov	[bp+var_180], eax
		mov	eax, [bp+var_188]
		mov	[bp+var_17C], eax
		lea	ax, [bp+var_178]
		push	ax
		mov	ax, si
		add	ax, 119h
		push	ax
		push	ss
		lea	ax, [bp+var_19C]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_19C]
		sub	[bp+var_184], eax
		mov	eax, [bp+var_198]
		sub	[bp+var_180], eax
		mov	eax, [bp+var_194]
		sub	[bp+var_17C], eax
		push	large [bp+var_17C]
		push	large [bp+var_180]
		push	large [bp+var_184]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_46], eax
		mov	[bp+var_42], eax
		push	large [bp+var_170]
		push	large [bp+var_174]
		push	large [bp+var_178]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], eax
		mov	di, si
		add	di, 104h
		mov	bx, [si+0A1h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_56], eax
		cmp	[bp+var_42], 0
		jle	short loc_811B3
		mov	ax, 1
		jmp	short loc_811B5
; ���������������������������������������������������������������������������

loc_811B3:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+638j
		xor	ax, ax

loc_811B5:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+63Dj
		or	al, al
		jz	short loc_811E1
		mov	eax, [bp+var_4A]
		mov	edx, eax
		mov	ecx, [bp+var_42]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	[bp+var_52], eax
		jmp	short loc_811F1
; ���������������������������������������������������������������������������

loc_811E1:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+643j
		mov	[bp+var_66], 138800h
		mov	eax, [bp+var_66]
		mov	[bp+var_52], eax

loc_811F1:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+66Bj
		mov	eax, [si+108h]
		cmp	eax, [bp+var_52]
		jl	short loc_81201
		mov	ax, 1
		jmp	short loc_81203
; ���������������������������������������������������������������������������

loc_81201:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+686j
		xor	ax, ax

loc_81203:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+68Bj
		or	al, al
		jnz	short loc_8121F
		mov	eax, [bp+var_4A]
		cmp	eax, [bp+var_56]
		jge	short loc_81216
		mov	ax, 1
		jmp	short loc_81218
; ���������������������������������������������������������������������������

loc_81216:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+69Bj
		xor	ax, ax

loc_81218:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+6A0j
		or	al, al
		jnz	short loc_8121F
		jmp	loc_81463
; ���������������������������������������������������������������������������

loc_8121F:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+691j
					; HUDSymbol_RenderWithClipTest_80B74+6A6j
		push	large 80h ; '�'
		lea	ax, [bp+var_184]
		push	ax
		call	Math_VectorLengthUnscaled_55920
		add	sp, 6
		lea	ax, [bp+var_178]
		push	ax
		lea	ax, [bp+var_184]
		push	ax
		push	ss
		lea	ax, [bp+var_6A]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		cmp	[bp+var_6A], 0
		jle	short loc_81255
		mov	ax, 1
		jmp	short loc_81257
; ���������������������������������������������������������������������������

loc_81255:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+6DAj
		xor	ax, ax

loc_81257:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+6DFj
		or	al, al
		jnz	short loc_8125E
		jmp	loc_81463
; ���������������������������������������������������������������������������

loc_8125E:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+6E5j
		mov	byte ptr [si+0A3h], 3
		mov	[bp+var_6E], 80h ; '�'
		mov	eax, [bp+var_6E]
		mov	dword_70468, eax
		mov	di, si
		add	di, 14h
		mov	ax, [si+0A1h]
		add	ax, 12h
		mov	[bp+var_70], ax
		mov	eax, [di]
		mov	bx, [bp+var_70]
		sub	eax, [bx]
		mov	[bp+var_1A8], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_1A4], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_1A0], eax
		mov	eax, [bp+var_1A8]
		mov	[bp+var_1B4], eax
		mov	eax, [bp+var_1A4]
		mov	[bp+var_1B0], eax
		mov	eax, [bp+var_1A0]
		mov	[bp+var_1AC], eax
		mov	eax, [bp+var_1B4]
		mov	[si+0F4h], eax
		mov	eax, [bp+var_1B0]
		mov	[si+0F8h], eax
		mov	eax, [bp+var_1AC]
		mov	[si+0FCh], eax
		mov	di, si
		add	di, 100h
		mov	bx, [si+0A1h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	[si+8Ch], eax
		mov	eax, [bp+var_56]
		mov	[si+90h], eax
		mov	di, si
		add	di, 38h	; '8'
		mov	ax, si
		add	ax, 8Ch	; '�'
		mov	[bp+var_7A], ax
		mov	eax, [di]
		mov	bx, [bp+var_7A]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_82], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_86], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_8A], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_1C0], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_1BC], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_1B8], eax
		mov	eax, [bp+var_1C0]
		add	[si+0F4h], eax
		mov	eax, [bp+var_1BC]
		add	[si+0F8h], eax
		mov	eax, [bp+var_1B8]
		add	[si+0FCh], eax
		mov	di, si
		add	di, 20h	; ' '
		mov	ax, si
		add	ax, 8Ch	; '�'
		mov	[bp+var_94], ax
		mov	eax, [di]
		mov	bx, [bp+var_94]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_1CC], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_1C8], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_1C4], eax
		mov	eax, [bp+var_1CC]
		sub	[si+0F4h], eax

loc_8144F:
		mov	eax, [bp+var_1C8]

loc_81454:
		sub	[si+0F8h], eax

loc_81459:
		mov	eax, [bp+var_1C4]

loc_8145E:
		sub	[si+0FCh], eax

loc_81463:				; CODE XREF: HUDSymbol_RenderWithClipTest_80B74+4E2j
					; HUDSymbol_RenderWithClipTest_80B74+6A8j ...
		pop	di

loc_81464:
		pop	si
		leave
		retf
HUDSymbol_RenderWithClipTest_80B74	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 392 lignes, NON DÉTAILLÉE — variante de HUDSymbol_RenderWithClipTest_80B74, ajoute
; UI_ApplyLineOfSightCheck_55A9E (seg116).
; ==============================================================================================
HUDSymbol_RenderWithClipTestB_81467	proc far		; CODE XREF: VROOMM_StubThunk_6AF4EJ HUDSymbol_ConstructWithViewMatrix_82693+B8p

var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0DEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_8147D
		jmp	loc_81849
; ���������������������������������������������������������������������������

loc_8147D:				; CODE XREF: HUDSymbol_RenderWithClipTestB_81467+11j
		mov	di, si
		add	di, 0F4h ; '�'
		mov	eax, [di]
		mov	[bp+var_66], eax
		mov	eax, [di+4]
		mov	[bp+var_62], eax
		mov	eax, [di+8]
		mov	[bp+var_5E], eax
		lea	ax, [bp+var_66]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	di, [si+0A1h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_66], eax
		mov	eax, [di+4]
		add	[bp+var_62], eax
		mov	eax, [di+8]
		add	[bp+var_5E], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_66]
		sub	eax, [di]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_62]
		sub	eax, [di+4]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_5E]
		sub	eax, [di+8]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_6A], eax
		mov	eax, [si+125h]
		shl	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_72]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_72], eax
		mov	eax, [bp+var_6E]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6A]
		mov	edx, eax

loc_81554:
		mov	ecx, [bp+var_18]
		sar	edx, 18h

loc_8155C:
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6A], eax
		push	large [bp+var_6A]
		push	large [bp+var_6E]
		push	large [bp+var_72]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	eax, [si+90h]
		cmp	eax, [bp+var_20]
		jge	short loc_81597
		mov	ax, 1
		jmp	short loc_81599
; ���������������������������������������������������������������������������

loc_81597:				; CODE XREF: HUDSymbol_RenderWithClipTestB_81467+129j
		xor	ax, ax

loc_81599:				; CODE XREF: HUDSymbol_RenderWithClipTestB_81467+12Ej
		or	al, al
		jz	short loc_81611
		mov	ax, si
		add	ax, 90h	; '�'
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_66]
		sub	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_62]
		sub	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_5E]
		sub	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[si+14h], eax
		mov	eax, [bp+var_92]
		mov	[si+18h], eax
		mov	eax, [bp+var_8E]
		mov	[si+1Ch], eax
		jmp	short loc_8167A
; ���������������������������������������������������������������������������

loc_81611:				; CODE XREF: HUDSymbol_RenderWithClipTestB_81467+134j
		mov	di, si
		add	di, 125h
		mov	eax, [bp+var_72]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_72], eax
		mov	eax, [bp+var_6E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6A]
		mov	edx, eax
		mov	ecx, [di]

loc_81653:
		sar	edx, 18h
		shl	eax, 8

loc_8165B:
		idiv	ecx
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_72]
		add	[si+14h], eax
		mov	eax, [bp+var_6E]
		add	[si+18h], eax
		mov	eax, [bp+var_6A]
		add	[si+1Ch], eax

loc_8167A:				; CODE XREF: HUDSymbol_RenderWithClipTestB_81467+1A8j
		mov	di, [si+89h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_22], ax
		mov	eax, [di]
		mov	bx, [bp+var_22]
		sub	eax, [bx]
		mov	[bp+var_AE], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_AA], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_9A], eax
		mov	di, si
		add	di, 2Ch	; ','
		push	eax
		push	large [bp+var_9E]
		push	large [bp+var_A2]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	eax, [di]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_C2], eax

loc_81759:
		mov	eax, [bp+var_42]
		mov	[bp+var_BE], eax
		mov	di, si
		add	di, 12Dh
		mov	eax, [bp+var_A2]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_9E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_9A]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_C6]
		add	eax, [bp+var_D2]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_C2]
		add	eax, [bp+var_CE]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_BE]
		add	eax, [bp+var_CA]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_DE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_DA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_B2], eax
		lea	ax, [bp+var_BA]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		jmp	short loc_8189E
; ���������������������������������������������������������������������������

loc_81849:				; CODE XREF: HUDSymbol_RenderWithClipTestB_81467+13j
		mov	di, si
		add	di, 100h
		mov	bx, [si+89h]

loc_81853:
		mov	eax, [bx+20h]

loc_81857:
		mov	edx, [di]

loc_8185A:
		imul	edx
		shrd	eax, edx, 8

loc_81862:
		mov	[bp+var_4], eax

loc_81866:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 104h
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	[si+90h], eax
		mov	byte ptr [si+0A3h], 1

loc_8189E:				; CODE XREF: HUDSymbol_RenderWithClipTestB_81467+3E0j
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithClipTestB_81467	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 323 lignes, NON DÉTAILLÉE — combine Vector_NormalizeInPlace_5593A (seg116, ×2),
; Camera_TransformPoint.
; ==============================================================================================
HUDSymbol_RenderWithLOSCheck_818A2	proc far		; CODE XREF: VROOMM_StubThunk_6AF58J HUDSymbol_ConstructWithViewMatrix_82693+C1p

var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	[bp+var_78], eax
		mov	eax, [di+4]
		mov	[bp+var_74], eax
		mov	eax, [di+8]
		mov	[bp+var_70], eax
		lea	ax, [bp+var_78]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [si+8Ch]
		sar	eax, 1
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_70]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_20]

loc_8194E:
		mov	[bp+var_7C], eax
		mov	di, si

loc_81954:
		add	di, 0E8h ; '�'
		mov	eax, [di]
		mov	[bp+var_78], eax
		mov	eax, [di+4]
		mov	[bp+var_74], eax
		mov	eax, [di+8]
		mov	[bp+var_70], eax
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [si+8Ch]
		sar	eax, 1
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		neg	eax
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_70]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_90]
		add	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		add	[bp+var_80], eax
		mov	eax, [bp+var_88]
		add	[bp+var_7C], eax
		mov	di, si
		add	di, 0F4h ; '�'
		mov	eax, [bp+var_84]
		sub	eax, [di]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_80]

loc_81A51:
		sub	eax, [di+4]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_7C]
		sub	eax, [di+8]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_94], eax
		mov	di, si
		add	di, 129h
		mov	eax, [bp+var_9C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_98]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_98], eax
		mov	eax, [bp+var_94]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	eax, [bp+var_9C]
		add	[si+0F4h], eax
		mov	eax, [bp+var_98]
		add	[si+0F8h], eax
		mov	eax, [bp+var_94]
		add	[si+0FCh], eax
		mov	di, si
		add	di, 0F4h ; '�'
		mov	eax, [di]
		mov	[bp+var_B4], eax
		mov	eax, [di+4]
		mov	[bp+var_B0], eax
		mov	eax, [di+8]
		mov	[bp+var_AC], eax
		lea	ax, [bp+var_B4]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 0F4h ; '�'

loc_81B51:
		mov	eax, [di]
		sub	[si+14h], eax
		mov	eax, [di+4]
		sub	[si+18h], eax
		mov	eax, [di+8]

loc_81B64:
		sub	[si+1Ch], eax
		cmp	dword ptr [si+121h], 0
		jge	short loc_81B75
		mov	ax, 1
		jmp	short loc_81B77
; ���������������������������������������������������������������������������

loc_81B75:				; CODE XREF: HUDSymbol_RenderWithLOSCheck_818A2+2CCj
		xor	ax, ax

loc_81B77:				; CODE XREF: HUDSymbol_RenderWithLOSCheck_818A2+2D1j
		or	al, al
		jnz	short loc_81B7E
		jmp	loc_81C22
; ���������������������������������������������������������������������������

loc_81B7E:				; CODE XREF: HUDSymbol_RenderWithLOSCheck_818A2+2D7j
		push	si
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_50], eax
		shl	eax, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_4C], eax
		mov	eax, [si+115h]
		sub	eax, [bp+var_4C]
		mov	[bp+var_5C], eax
		mov	[bp+var_58], eax
		mov	eax, [si+121h]
		neg	eax
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	eax, [bp+var_58]
		mov	edx, eax
		mov	ecx, [bp+var_64]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_58], eax
		mov	eax, [si+108h]
		sar	eax, 1
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_58]
		cmp	eax, [bp+var_6C]
		jg	short loc_81BF7
		mov	ax, 1
		jmp	short loc_81BF9
; ���������������������������������������������������������������������������

loc_81BF7:				; CODE XREF: HUDSymbol_RenderWithLOSCheck_818A2+34Ej
		xor	ax, ax

loc_81BF9:				; CODE XREF: HUDSymbol_RenderWithLOSCheck_818A2+353j
		or	al, al
		jz	short loc_81C22
		mov	byte ptr [si+0A3h], 4
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	[si+0F4h], eax
		mov	eax, [di+4]
		mov	[si+0F8h], eax
		mov	eax, [di+8]
		mov	[si+0FCh], eax

loc_81C22:				; CODE XREF: HUDSymbol_RenderWithLOSCheck_818A2+2D9j
					; HUDSymbol_RenderWithLOSCheck_818A2+359j
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithLOSCheck_818A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 379 lignes, NON DÉTAILLÉE — variante de HUDSymbol_RenderWithClipTest_80B74.
; ==============================================================================================
HUDSymbol_RenderWithClipTestC_81C26	proc far		; CODE XREF: VROOMM_StubThunk_6AF53J HUDSymbol_ConstructWithViewMatrix_82693+18Dp

var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= dword	ptr -0F2h
var_EE		= dword	ptr -0EEh
var_EA		= dword	ptr -0EAh
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= word ptr -82h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0FAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_81C3C
		jmp	loc_82034
; ���������������������������������������������������������������������������

loc_81C3C:				; CODE XREF: HUDSymbol_RenderWithClipTestC_81C26+11j
		mov	di, si
		add	di, 0DCh ; '�'
		mov	eax, [di]
		mov	[bp+var_52], eax
		mov	eax, [di+4]
		mov	[bp+var_4E], eax

loc_81C51:
		mov	eax, [di+8]

loc_81C55:
		mov	[bp+var_4A], eax
		mov	di, si

loc_81C5B:
		add	di, 8Ch	; '�'
		mov	eax, [bp+var_52]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_4E]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4A]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		push	word ptr [si+0A1h]
		mov	bx, [si+0A1h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_5E], eax
		mov	eax, [di+4]
		mov	[bp+var_5A], eax
		mov	eax, [di+8]
		mov	[bp+var_56], eax
		lea	ax, [bp+var_82]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		lea	ax, [bp+var_52]
		push	ax
		push	word ptr [si+0A1h]
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	di, [si+0A1h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_52], eax
		mov	eax, [di+4]
		add	[bp+var_4E], eax
		mov	eax, [di+8]
		add	[bp+var_4A], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_52]
		sub	eax, [di]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_4E]
		sub	eax, [di+4]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_4A]
		sub	eax, [di+8]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		push	eax
		push	large [bp+var_8A]
		push	large [bp+var_8E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [si+90h]
		cmp	eax, [bp+var_8]
		jge	short loc_81D97
		mov	ax, 1
		jmp	short loc_81D99
; ���������������������������������������������������������������������������

loc_81D97:				; CODE XREF: HUDSymbol_RenderWithClipTestC_81C26+16Aj
		xor	ax, ax

loc_81D99:				; CODE XREF: HUDSymbol_RenderWithClipTestC_81C26+16Fj
		or	al, al
		jz	short loc_81E15
		mov	ax, si
		add	ax, 90h	; '�'
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_52]
		sub	eax, [bp+var_8E]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_4E]
		sub	eax, [bp+var_8A]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_4A]
		sub	eax, [bp+var_86]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		mov	[si+14h], eax
		mov	eax, [bp+var_AE]
		mov	[si+18h], eax
		mov	eax, [bp+var_AA]
		mov	[si+1Ch], eax
		jmp	short loc_81E8C
; ���������������������������������������������������������������������������

loc_81E15:				; CODE XREF: HUDSymbol_RenderWithClipTestC_81C26+175j
		mov	[bp+var_C], 400h
		mov	eax, [bp+var_8E]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8A]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		add	[si+14h], eax
		mov	eax, [bp+var_8A]
		add	[si+18h], eax
		mov	eax, [bp+var_86]
		add	[si+1Ch], eax

loc_81E8C:				; CODE XREF: HUDSymbol_RenderWithClipTestC_81C26+1EDj
		mov	di, [si+0A1h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_E], ax
		mov	eax, [di]
		mov	bx, [bp+var_E]
		sub	eax, [bx]
		mov	[bp+var_CA], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_C6], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_CA]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_C6]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_B6], eax
		mov	di, si
		add	di, 2Ch	; ','
		push	eax
		push	large [bp+var_BA]
		push	large [bp+var_BE]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	eax, [di]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax

loc_81F51:
		mov	eax, [bp+var_2A]

loc_81F55:
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_BE]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	eax, [bp+var_BA]
		cdq
		idiv	ebx
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_B6]
		cdq
		idiv	ebx
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_E2]

loc_81FD0:
		add	eax, [bp+var_EE]

loc_81FD5:
		mov	[bp+var_FA], eax

loc_81FDA:
		mov	eax, [bp+var_DE]

loc_81FDF:
		add	eax, [bp+var_EA]

loc_81FE4:
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_DA]
		add	eax, [bp+var_E6]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_FA]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_F6]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_F2]
		mov	[bp+var_CE], eax
		lea	ax, [bp+var_D6]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	eax, dword_70458
		sub	[si+13Dh], eax
		jmp	short loc_82039
; ���������������������������������������������������������������������������

loc_82034:				; CODE XREF: HUDSymbol_RenderWithClipTestC_81C26+13j
		mov	byte ptr [si+0A3h], 5

loc_82039:				; CODE XREF: HUDSymbol_RenderWithClipTestC_81C26+40Cj
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithClipTestC_81C26	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine longueur vectorielle et UI_ApplyLineOfSightAndTransform_57DAE (127 lignes).
; ==============================================================================================
HUDSymbol_ComputeTransform_8203D	proc far		; CODE XREF: VROOMM_StubThunk_6AF5DJ HUDSymbol_ConstructWithViewMatrix_82693+CAp

var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	eax, [di+4]
		mov	[bp+var_1C], eax

loc_8205D:
		mov	eax, [di+8]

loc_82061:
		mov	[bp+var_18], eax

loc_82065:
		mov	eax, [bp+var_20]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	[bp+var_4], 66h	; 'f'
		mov	eax, [bp+var_4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [si+0FCh]
		mov	edx, [bp+var_C]
		imul	edx

loc_820D5:
		shrd	eax, edx, 8
		mov	[si+0FCh], eax

loc_820DF:
		mov	eax, [si+0FCh]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		add	[si+14h], eax
		mov	eax, [bp+var_1C]
		add	[si+18h], eax
		mov	eax, [bp+var_18]
		add	[si+1Ch], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	cx, si
		add	cx, 14h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_38], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_34], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		push	eax
		push	large [bp+var_28]
		push	large [bp+var_2C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax

loc_82159:
		pop	eax

loc_8215B:
		add	sp, 0Ch
		mov	[bp+var_10], eax

loc_82162:
		mov	[bp+var_14], eax
		mov	[si+90h], eax
		lea	ax, [bp+var_2C]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ComputeTransform_8203D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 474 lignes, NON DÉTAILLÉE — combine Vector_NormalizeInPlace_5593A, Math_CosDeg_5483F
; (seg115), Camera_TransformPoint. ⚠️ (2026-09-24) Math_Sin_5483F / Math_Cos_54876 et leurs
; versions brutes sont INVERSEES (voir Math_CosDeg_5483F) : toute mention de sinus/cosinus
; tiree de ces noms dans ce resume est a relire.
; ==============================================================================================
HUDSymbol_RenderWithLOSCheckB_82181	proc far		; CODE XREF: VROOMM_StubThunk_6AF3FJ HUDSymbol_ConstructWithViewMatrix_82693+195p

var_112		= dword	ptr -112h
var_10E		= dword	ptr -10Eh
var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= dword	ptr -102h
var_FE		= dword	ptr -0FEh
var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= dword	ptr -0F2h
var_EE		= dword	ptr -0EEh
var_EA		= dword	ptr -0EAh
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= word ptr -56h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 112h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+10Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_82200
		mov	[bp+var_4], 7800h
		mov	eax, [bp+var_4]
		mov	[si+121h], eax
		mov	byte ptr [si+10Ch], 1
		mov	di, si
		add	di, 14h
		mov	eax, [di]
		mov	[si+0F4h], eax
		mov	eax, [di+4]
		mov	[si+0F8h], eax
		mov	eax, [di+8]
		mov	[si+0FCh], eax
		mov	eax, [si+11Dh]

loc_821D1:
		mov	[si+0E8h], eax
		mov	eax, [si+119h]

loc_821DB:
		mov	[si+0ECh], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+0F0h], eax
		mov	ax, si
		add	ax, 0E8h ; '�'
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		jmp	loc_82686
; ���������������������������������������������������������������������������

loc_82200:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+14j
		mov	di, si
		add	di, 119h
		mov	[bp+var_C], 80h	; '�'
		mov	eax, [di]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_C]
		imul	edx

loc_82250:
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]

loc_8225D:
		mov	[bp+var_24], eax

loc_82261:
		mov	eax, [bp+var_14]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_A2]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_9E]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_2C]

loc_822DA:
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		sub	[si+119h], eax
		mov	eax, [bp+var_AE]
		sub	[si+11Dh], eax
		mov	eax, [bp+var_AA]
		sub	[si+121h], eax
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [di+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [di+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax

loc_82363:
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_BE]
		add	[si+0F4h], eax
		mov	eax, [bp+var_BA]
		add	[si+0F8h], eax
		mov	eax, [bp+var_B6]
		add	[si+0FCh], eax
		mov	di, si
		add	di, 0F4h ; '�'
		mov	ax, si
		add	ax, 10Dh
		mov	[bp+var_56], ax
		mov	eax, [di]
		mov	bx, [bp+var_56]
		sub	eax, [bx]
		mov	[bp+var_D6], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_D2], eax
		mov	eax, [di+8]

loc_823D1:
		sub	eax, [bx+8]

loc_823D5:
		mov	[bp+var_CE], eax

loc_823DA:
		mov	eax, [bp+var_D6]

loc_823DF:
		mov	[bp+var_CA], eax

loc_823E4:
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_CE]
		mov	[bp+var_C2], eax
		push	eax
		push	large [bp+var_C6]
		push	large [bp+var_CA]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5E], eax
		mov	[bp+var_5A], eax
		mov	eax, [si+90h]
		cmp	eax, [bp+var_5A]
		jle	short loc_82428
		mov	ax, 1
		jmp	short loc_8242A
; ���������������������������������������������������������������������������

loc_82428:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+2A0j
		xor	ax, ax

loc_8242A:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+2A5j
		or	al, al
		jnz	short loc_82431
		jmp	loc_825C5
; ���������������������������������������������������������������������������

loc_82431:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+2ABj
		mov	di, si
		add	di, 0E8h ; '�'
		mov	ax, si
		add	ax, 90h	; '�'
		mov	[bp+var_6A], ax
		mov	eax, [di]
		mov	bx, [bp+var_6A]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_72], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_7A], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_F2], eax
		mov	[bp+var_86], 5A00h
		mov	eax, [bp+var_5A]
		mov	edx, [bp+var_86]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8A], eax

loc_824CE:
		mov	eax, [bp+var_8A]

loc_824D3:
		mov	[bp+var_8E], eax
		mov	di, si
		add	di, 90h	; '�'
		mov	eax, [bp+var_8E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_92], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_96], eax
		lea	ax, [bp+var_96]
		push	ax
		push	ss
		lea	ax, [bp+var_9A]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_FA]
		mov	edx, [bp+var_9A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_F6]
		mov	edx, [bp+var_9A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_F2]
		mov	edx, [bp+var_9A]
		imul	edx

loc_82551:
		shrd	eax, edx, 8

loc_82556:
		mov	[bp+var_F2], eax
		mov	di, si

loc_8255D:
		add	di, 0F4h ; '�'
		mov	eax, [di]

loc_82564:
		add	eax, [bp+var_FA]
		mov	[bp+var_106], eax
		mov	eax, [di+4]
		add	eax, [bp+var_F6]
		mov	[bp+var_102], eax
		mov	eax, [di+8]
		add	eax, [bp+var_F2]
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_106]
		mov	[bp+var_112], eax
		mov	eax, [bp+var_102]
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_FE]
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_112]
		mov	[si+14h], eax
		mov	eax, [bp+var_10E]
		mov	[si+18h], eax
		mov	eax, [bp+var_10A]
		mov	[si+1Ch], eax
		jmp	short loc_825E2
; ���������������������������������������������������������������������������

loc_825C5:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+2ADj
		mov	di, si
		add	di, 0F4h ; '�'
		mov	eax, [di]

loc_825CE:
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax

loc_825E2:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+442j
		push	si
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		add	eax, 14h
		mov	[bp+var_66], eax
		shl	eax, 8
		mov	[bp+var_62], eax
		mov	eax, [si+1Ch]
		cmp	eax, [bp+var_62]
		jge	short loc_8260C
		mov	ax, 1
		jmp	short loc_8260E
; ���������������������������������������������������������������������������

loc_8260C:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+484j
		xor	ax, ax

loc_8260E:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+489j
		or	al, al
		jz	short loc_8261F
		mov	eax, [bp+var_62]
		mov	[si+0FCh], eax
		mov	[si+1Ch], eax

loc_8261F:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+48Fj
		mov	di, si
		add	di, 10Dh
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_68], ax
		mov	eax, [di]
		mov	bx, [bp+var_68]
		sub	eax, [bx]
		mov	[bp+var_EE], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_EA], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]

loc_82650:
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_EE]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_EA]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_DA], eax
		lea	ax, [bp+var_E2]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4

loc_82686:				; CODE XREF: HUDSymbol_RenderWithLOSCheckB_82181+7Cj
		mov	eax, dword_70458
		sub	[si+13Dh], eax
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithLOSCheckB_82181	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 245 lignes, NON DÉTAILLÉE — combine SetReference16 et Camera_ComputeViewMatrix.
; ==============================================================================================
HUDSymbol_ConstructWithViewMatrix_82693	proc far		; CODE XREF: VROOMM_StubThunk_6AF7BJ

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_826A8
		jmp	loc_82764
; ���������������������������������������������������������������������������

loc_826A8:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+10j
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+10Dh], eax
		mov	eax, [di+4]
		mov	[si+111h], eax
		mov	eax, [di+8]
		mov	[si+115h], eax
		push	word ptr [si+89h]
		push	ss
		lea	ax, [bp+var_1E]
		push	ax

loc_826D2:
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_1E]

loc_826E2:
		mov	[si+119h], eax
		mov	eax, [bp+var_1A]
		mov	[si+11Dh], eax
		mov	eax, [bp+var_16]
		mov	[si+121h], eax
		cmp	byte ptr [si+9Eh], 9
		jz	short loc_82707
		cmp	byte ptr [si+9Eh], 8
		jnz	short loc_82720

loc_82707:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+6Bj
		mov	bx, [si+89h]
		mov	ax, [bx+55h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 0A1h ; '�'
		push	ax
		call	SetReference16
		add	sp, 4

loc_82720:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+72j
		mov	al, [si+0A3h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		jbe	short loc_82730
		jmp	loc_82839	; default
; ���������������������������������������������������������������������������

loc_82730:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+98j
		shl	bx, 1
		jmp	cs:off_82846[bx] ; switch jump

loc_82737:				; DATA XREF: ovr243:off_82846o
		push	si		; case 0x0
		push	cs
		call	near ptr HUDSymbol_DrawWithLineOfSight_80971
		pop	cx
		jmp	loc_82839	; default
; ���������������������������������������������������������������������������

loc_82740:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+9Fj
					; DATA XREF: ovr243:off_82846o
		push	si		; case 0x1
		push	cs
		call	near ptr HUDSymbol_RenderWithClipTest_80B74
		pop	cx
		jmp	loc_82839	; default
; ���������������������������������������������������������������������������

loc_82749:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+9Fj
					; DATA XREF: ovr243:off_82846o
		push	si		; case 0x3
		push	cs
		call	near ptr HUDSymbol_RenderWithClipTestB_81467
		pop	cx

loc_8274F:				; default
		jmp	loc_82839
; ���������������������������������������������������������������������������

loc_82752:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+9Fj
					; DATA XREF: ovr243:off_82846o
		push	si		; case 0x2
		push	cs
		call	near ptr HUDSymbol_RenderWithLOSCheck_818A2
		pop	cx
		jmp	loc_82839	; default
; ���������������������������������������������������������������������������

loc_8275B:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+9Fj
					; DATA XREF: ovr243:off_82846o
		push	si		; case 0x4
		push	cs
		call	near ptr HUDSymbol_ComputeTransform_8203D
		pop	cx

loc_82761:				; default
		jmp	loc_82839
; ���������������������������������������������������������������������������

loc_82764:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+12j
		cmp	dword ptr [si+13Dh], 0
		jle	short loc_82771
		mov	ax, 1
		jmp	short loc_82773
; ���������������������������������������������������������������������������

loc_82771:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+D7j
		xor	ax, ax

loc_82773:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+DCj
		or	al, al
		jnz	short loc_8277A
		jmp	loc_8282E
; ���������������������������������������������������������������������������

loc_8277A:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+E2j
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_82784
		jmp	loc_82811
; ���������������������������������������������������������������������������

loc_82784:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+ECj
		push	word ptr [si+0A1h]
		mov	bx, [si+0A1h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_82811
		mov	di, [si+0A1h]
		push	word ptr [di+51h]
		mov	bx, [di+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_82811
		cmp	byte ptr [si+0A3h], 6
		jz	short loc_82811
		mov	di, si
		add	di, 100h
		mov	bx, [si+0A1h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx

loc_827D0:
		shrd	eax, edx, 8

loc_827D5:
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]

loc_827DD:
		mov	[bp+var_A], eax
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 104h
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	[si+90h], eax
		mov	byte ptr [si+0A3h], 6

loc_82811:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+EEj
					; HUDSymbol_ConstructWithViewMatrix_82693+101j ...
		mov	al, [si+0A3h]
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_8281E
		jmp	short loc_82826
; ���������������������������������������������������������������������������

loc_8281E:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+187j
		push	si
		push	cs
		call	near ptr HUDSymbol_RenderWithClipTestC_81C26
		pop	cx
		jmp	short loc_82839	; default
; ���������������������������������������������������������������������������

loc_82826:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+189j
		push	si
		push	cs
		call	near ptr HUDSymbol_RenderWithLOSCheckB_82181
		pop	cx
		jmp	short loc_82839	; default
; ���������������������������������������������������������������������������

loc_8282E:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+E4j
		mov	al, [si+141h]
		mov	byte_72A8E, al
		mov	al, 0
		jmp	short loc_82842
; ���������������������������������������������������������������������������

loc_82839:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+9Aj
					; HUDSymbol_ConstructWithViewMatrix_82693+AAj ...
		push	si		; default
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1

loc_82842:				; CODE XREF: HUDSymbol_ConstructWithViewMatrix_82693+1A4j
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructWithViewMatrix_82693	endp

; ���������������������������������������������������������������������������
off_82846	dw offset loc_82737	; DATA XREF: HUDSymbol_ConstructWithViewMatrix_82693+9Fr
		dw offset loc_82740	; jump table for switch	statement
		dw offset loc_82752
		dw offset loc_82749
		dw offset loc_8275B

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (17 lignes).
; ==============================================================================================
HUDSymbol_Helper3_82850	proc far		; CODE XREF: VROOMM_StubThunk_6AF80J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_82853:
		mov	ax, [bp+arg_0]

loc_82856:
		mov	al, 0Bh

loc_82858:
		pop	bp
		retf
HUDSymbol_Helper3_82850	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 219 lignes, NON DÉTAILLÉE — combine SetReference16 (×3),
; AI_ComputeGeometryHelper_56E29 (seg116), Matrix_LocalToWorld_58828.
; ==============================================================================================
HUDSymbol_ConstructWithGeometry_8285A	proc far		; CODE XREF: VROOMM_StubThunk_6AF85J

var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp

loc_8285D:
		sub	sp, 42h
		push	si
		push	di

loc_82862:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		push	[bp+var_2]
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, si
		add	ax, 9Fh	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 0A1h ; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[si+9Eh], al
		mov	al, [bp+arg_8]
		mov	[si+141h], al
		cmp	byte ptr [si+141h], 3
		jz	short loc_828C9
		cmp	byte ptr [si+141h], 8
		jz	short loc_828C9
		jmp	loc_82969
; ���������������������������������������������������������������������������

loc_828C9:				; CODE XREF: HUDSymbol_ConstructWithGeometry_8285A+63j
					; HUDSymbol_ConstructWithGeometry_8285A+6Aj
		mov	di, [bp+arg_A]
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		push	[bp+arg_C]
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	di, si
		add	di, 14h
		mov	dx, [si+9Fh]
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_12], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1E]
		mov	[si+0E8h], eax
		mov	eax, [bp+var_1A]
		mov	[si+0ECh], eax
		mov	eax, [bp+var_16]
		mov	[si+0F0h], eax
		mov	eax, [si+0BCh]
		mov	[si+0C0h], eax
		mov	byte ptr [si+0A3h], 0
		jmp	loc_82A7E
; ���������������������������������������������������������������������������

loc_82969:				; CODE XREF: HUDSymbol_ConstructWithGeometry_8285A+6Cj
		mov	al, [si+9Eh]
		mov	ah, 0
		cmp	ax, 9
		jnz	short loc_82996
		mov	di, si
		add	di, 0B0h ; '�'
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax
		jmp	short loc_829B6
; ���������������������������������������������������������������������������

loc_82996:				; CODE XREF: HUDSymbol_ConstructWithGeometry_8285A+118j
		mov	di, si
		add	di, 0A4h ; '�'
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax

loc_829B6:				; CODE XREF: HUDSymbol_ConstructWithGeometry_8285A+13Aj
		mov	di, si
		add	di, 0E8h ; '�'
		mov	eax, [di]
		mov	[bp+var_2A], eax
		mov	eax, [di+4]
		mov	[bp+var_26], eax
		mov	eax, [di+8]
		mov	[bp+var_22], eax
		push	word ptr [si+9Fh]
		mov	bx, [si+9Fh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	eax, [bp+var_2A]
		mov	[si+14h], eax
		mov	eax, [bp+var_26]
		mov	[si+18h], eax
		mov	eax, [bp+var_22]
		mov	[si+1Ch], eax
		mov	di, [si+9Fh]
		add	di, 12h
		mov	eax, [di]
		add	[si+14h], eax
		mov	eax, [di+4]
		add	[si+18h], eax
		mov	eax, [di+8]
		add	[si+1Ch], eax
		mov	eax, [bp+var_2A]
		neg	eax
		mov	[bp+var_36], eax
		mov	eax, [bp+var_26]
		neg	eax
		mov	[bp+var_32], eax
		mov	eax, [bp+var_22]
		neg	eax
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_3A], eax
		lea	ax, [bp+var_42]
		push	ax
		mov	ax, si

loc_82A63:
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	eax, [si+0BCh]
		mov	[si+0C0h], eax
		mov	byte ptr [si+0A3h], 0

loc_82A7E:				; CODE XREF: HUDSymbol_ConstructWithGeometry_8285A+10Cj
		mov	byte ptr [si+10Ch], 0
		mov	eax, [si+139h]
		mov	[si+13Dh], eax
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructWithGeometry_8285A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide 4 références faibles (WeakRef_InvalidateIfSet ×4).
; ==============================================================================================
HUDSymbol_ReleaseAllRefs_82A91	proc far		; CODE XREF: VROOMM_StubThunk_6AF3AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_82AEC
		mov	ax, si
		add	ax, 0A1h ; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 9Fh	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 98h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx

loc_82AD0:
		push	0
		push	si

loc_82AD3:
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_82AEA
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_82AEC
; ���������������������������������������������������������������������������

loc_82AEA:				; CODE XREF: HUDSymbol_ReleaseAllRefs_82A91+4Ej
		jmp	short $+2

loc_82AEC:				; CODE XREF: HUDSymbol_ReleaseAllRefs_82A91+Dj
					; HUDSymbol_ReleaseAllRefs_82A91+57j
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseAllRefs_82A91	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide une référence faible (WeakRef_InvalidateIfSet).
; ==============================================================================================
HUDSymbol_ReleaseSingleRef_82AF0	proc far		; CODE XREF: VROOMM_StubThunk_6AF35J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_82B27
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_82B25
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_82B27
; ���������������������������������������������������������������������������

loc_82B25:				; CODE XREF: HUDSymbol_ReleaseSingleRef_82AF0+2Aj
		jmp	short $+2

loc_82B27:				; CODE XREF: HUDSymbol_ReleaseSingleRef_82AF0+Dj
					; HUDSymbol_ReleaseSingleRef_82AF0+33j
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseSingleRef_82AF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide 2 références faibles (WeakRef_InvalidateIfSet ×2).
; ==============================================================================================
HUDSymbol_ReleaseTwoRefs_82B2B	proc far		; CODE XREF: VROOMM_StubThunk_6AF30J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_82B6E
		mov	ax, si
		add	ax, 98h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si

loc_82B55:
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_82B6C
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_82B6E
; ���������������������������������������������������������������������������

loc_82B6C:				; CODE XREF: HUDSymbol_ReleaseTwoRefs_82B2B+36j
		jmp	short $+2

loc_82B6E:				; CODE XREF: HUDSymbol_ReleaseTwoRefs_82B2B+Dj
					; HUDSymbol_ReleaseTwoRefs_82B2B+3Fj
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseTwoRefs_82B2B	endp

ovr243		ends
