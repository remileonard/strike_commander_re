ovr241		segment	para public 'OVERLAY' use16
		assume cs:ovr241
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 105 lignes, NON DÉTAILLÉE — combine allocateurs typés, ReadFieldGroupA_64A19,
; GlyphObject_ComputeMetrics_60456 (seg162) — chargement de métriques de glyphe depuis IFF.
; ==============================================================================================
GlyphObject_LoadMetricsFromIFF_7DE90	proc far		; CODE XREF: VROOMM_StubThunk_6AE8EJ Font_LoadDefinitionFromIFF_7E1B4+148p

var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	byte ptr [si+1Ah], 0
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	eax, [di+72h]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]

loc_7DEE3:
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2

loc_7DEEB:
		mov	[bp+var_5], 1

loc_7DEEF:
		mov	[bp+var_4], 0

loc_7DEF7:
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		push	large [bp+var_E]
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_A]
		push	ax
		push	si
		call	GlyphObject_ComputeMetrics_60456
		add	sp, 4
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 0
		push	2Dh ; '-'
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		push	41h ; 'A'
		push	si
		nop
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocate_7DF7F
		add	sp, 4
		mov	byte ptr [si+19h], 0C7h	; '�'
		cmp	[bp+var_5], 0
		jz	short loc_7DF7B
		cmp	[bp+var_A], 0
		jz	short loc_7DF7B
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7DF7B:				; CODE XREF: GlyphObject_LoadMetricsFromIFF_7DE90+CBj
					; GlyphObject_LoadMetricsFromIFF_7DE90+D2j
		pop	di
		pop	si
		leave
		retf
GlyphObject_LoadMetricsFromIFF_7DE90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et Font_ComputeGlyphBoundingBox_5E74E (seg148).
; ==============================================================================================
GlyphObject_MeasureAndAllocate_7DF7F	proc far		; CODE XREF: VROOMM_StubThunk_6AE98J GlyphObject_LoadMetricsFromIFF_7DE90+BDp	...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+17h], ax
		mov	ax, [si+17h]
		mov	[bp+var_C], ax
		mov	[si+0Eh], ax
		pop	si
		leave
		retf
GlyphObject_MeasureAndAllocate_7DF7F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GlyphObject_MeasureChar_6064A (seg162).
; ==============================================================================================
GlyphObject_MeasureWrapper_7DFCA	proc far		; CODE XREF: VROOMM_StubThunk_6AE93J GlyphObject_Helper8_7EC45+26p

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_7DFF6
; ���������������������������������������������������������������������������

loc_7DFDE:				; CODE XREF: GlyphObject_MeasureWrapper_7DFCA+3Bj
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	al, byte ptr [bp+var_6]

loc_7DFE7:
		push	ax
		push	si
		call	GlyphObject_MeasureChar_6064A

loc_7DFEE:
		add	sp, 4
		add	di, ax
		inc	[bp+var_4]

loc_7DFF6:				; CODE XREF: GlyphObject_MeasureWrapper_7DFCA+12j
		les	bx, [bp+arg_2]
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_7DFDE
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureWrapper_7DFCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine GlyphObject_ResolveAndCache_605CE et GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_ResolveAndMeasure_7E00D	proc far		; CODE XREF: VROOMM_StubThunk_6AE9DJ GlyphObject_Helper2_7E708+1Ap

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	short loc_7E0A3
; ���������������������������������������������������������������������������

loc_7E02C:				; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+A7j
		mov	dx, [bp+var_6]
		cmp	byte ptr [si+1Ah], 0
		jz	short loc_7E063
		mov	cx, 61h	; 'a'
		cmp	dx, cx
		jge	short loc_7E041
		mov	cx, 41h	; 'A'
		jmp	short $+2

loc_7E041:				; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+2Dj
		mov	ax, dx
		sub	ax, cx
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 1Ah
		jnb	short loc_7E063
		mov	al, [si+1Ah]
		mov	ah, 0
		cmp	ax, cx
		jz	short loc_7E063
		mov	al, [si+1Ah]
		mov	ah, 0
		add	ax, [bp+var_A]
		mov	dx, ax
		jmp	short $+2

loc_7E063:				; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+26j
					; GlyphObject_ResolveAndMeasure_7E00D+3Fj ...
		mov	[bp+var_6], dx
		cmp	[bp+var_6], 0Ah
		jnz	short loc_7E077
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_7E0A0
; ���������������������������������������������������������������������������

loc_7E077:				; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+5Dj
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	GlyphObject_ResolveAndCache_605CE
		add	sp, 0Ah
		mov	ax, [bp+var_6]
		mov	[bp+var_C], ax
		mov	al, byte ptr [bp+var_C]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_6064A
		add	sp, 4
		add	di, ax

loc_7E0A0:				; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+68j
		inc	[bp+var_8]

loc_7E0A3:				; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+1Dj
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jz	short loc_7E0B7
		jmp	loc_7E02C
; ���������������������������������������������������������������������������

loc_7E0B7:				; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+A5j
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_ResolveAndMeasure_7E00D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 143 lignes, NON DÉTAILLÉE — combine Render_DrawScaledSprite_621A2 (seg175) et
; GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_DrawScaled_7E0BD	proc far		; CODE XREF: VROOMM_StubThunk_6AEA2J GlyphObject_Helper_7E6E1+1Ep

var_10C		= word ptr -10Ch
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh
arg_C		= byte ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 10Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		xor	dx, dx
		jmp	short loc_7E0DE
; ���������������������������������������������������������������������������

loc_7E0D0:				; CODE XREF: GlyphObject_DrawScaled_7E0BD:loc_7E0E2j
		lea	ax, [bp+var_10C]
		mov	bx, dx
		add	bx, ax
		mov	al, [bp+arg_C]
		mov	[bx], al
		inc	dx

loc_7E0DE:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+11j
		cmp	dx, 100h

loc_7E0E2:
		jl	short loc_7E0D0
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax

loc_7E0EB:
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	loc_7E19A
; ���������������������������������������������������������������������������

loc_7E0F6:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+EEj
		mov	dx, [bp+var_6]
		cmp	byte ptr [si+1Ah], 0
		jz	short loc_7E12D
		mov	cx, 61h	; 'a'
		cmp	dx, cx
		jge	short loc_7E10B
		mov	cx, 41h	; 'A'
		jmp	short $+2

loc_7E10B:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+47j
		mov	ax, dx
		sub	ax, cx
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 1Ah
		jnb	short loc_7E12D
		mov	al, [si+1Ah]
		mov	ah, 0
		cmp	ax, cx
		jz	short loc_7E12D
		mov	al, [si+1Ah]
		mov	ah, 0
		add	ax, [bp+var_A]
		mov	dx, ax
		jmp	short $+2

loc_7E12D:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+40j
					; GlyphObject_DrawScaled_7E0BD+59j ...
		mov	[bp+var_6], dx
		cmp	[bp+var_6], 0Ah
		jnz	short loc_7E141
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_7E197
; ���������������������������������������������������������������������������

loc_7E141:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+77j
		push	1
		mov	al, [si+19h]
		mov	ah, 0
		push	ax
		push	ss
		lea	ax, [bp+var_10C]
		push	ax
		push	large 1000100h
		push	[bp+var_6]
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_6]
		add	ax, [si+0Eh]
		push	ax
		push	di
		push	[bp+arg_2]
		call	Render_DrawScaledSprite_621A2
		add	sp, 18h
		mov	ax, [bp+var_6]
		mov	[bp+var_C], ax
		mov	al, byte ptr [bp+var_C]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_6064A
		add	sp, 4
		add	di, ax

loc_7E197:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+82j
		inc	[bp+var_8]

loc_7E19A:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+36j
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jz	short loc_7E1AE
		jmp	loc_7E0F6
; ���������������������������������������������������������������������������

loc_7E1AE:				; CODE XREF: GlyphObject_DrawScaled_7E0BD+ECj
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_DrawScaled_7E0BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 482 lignes, NON DÉTAILLÉE — construit un StreamReader, valide un enregistrement
; IFF, lit de nombreux champs — référencée directement par
; ResourceRecord_ReadDwordField_64AAE/64AFF (seg193) dans des sessions précédentes sans être
; documentée. Probable chargeur complet de définition de police. Candidat pour session dédiée.
; ==============================================================================================
Font_LoadDefinitionFromIFF_7E1B4	proc far		; CODE XREF: VROOMM_StubThunk_6AE4DJ Lexer_LoadScriptFile_7F90F+84p

var_E6		= word ptr -0E6h
var_89		= dword	ptr -89h
var_85		= dword	ptr -85h
var_81		= dword	ptr -81h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0E6h
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, [bp+var_E6]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_E6], 2C8h
		mov	[bp+var_85], 100h
		mov	[bp+var_89], 0
		mov	[bp+var_E6], 2E0h

loc_7E1E9:
		mov	[bp+var_6A], 0
		xor	ax, ax
		mov	[bp+var_6C], ax
		movsx	eax, ax
		mov	[bp+var_81], eax
		push	large 50414D4Eh
		push	[bp+arg_2]
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jnz	short loc_7E219
		jmp	loc_7E5C5
; ���������������������������������������������������������������������������

loc_7E219:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+60j
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_7E235
		jmp	loc_7E2C3
; ���������������������������������������������������������������������������

loc_7E235:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+7Cj
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di], ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+2],	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+4],	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+6],	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[di+14h], eax
		mov	ax, [di+4]
		sar	ax, 1
		mov	[bp+var_2], ax
		movsx	ebx, [bp+var_2]
		mov	eax, [di+14h]
		cdq
		idiv	ebx
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	[di+18h], eax
		mov	ax, [di+6]
		sar	ax, 1
		mov	[bp+var_C], ax
		movsx	ebx, [bp+var_C]
		mov	eax, [di+14h]
		cdq
		idiv	ebx
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[di+1Ch], eax

loc_7E2C3:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+7Ej
		push	0
		push	large 544E4F46h
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_7E30D
		push	1Bh
		call	CRT_Malloc16_Retry
		pop	cx

loc_7E2E4:
		mov	si, ax
		or	ax, ax

loc_7E2E8:
		jz	short loc_7E306

loc_7E2EA:
		push	ax
		call	GlyphObject_AllocateBuffer_604C9
		pop	cx

loc_7E2F1:
		mov	word ptr [si], 5F4h

loc_7E2F5:
		lea	ax, [bp+var_E6]
		push	ax
		push	si
		push	cs
		call	near ptr GlyphObject_LoadMetricsFromIFF_7DE90
		add	sp, 4
		mov	ax, si
		jmp	short loc_7E308
; ���������������������������������������������������������������������������

loc_7E306:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4:loc_7E2E8j
		mov	ax, si

loc_7E308:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+150j
		mov	[di+34h], ax
		jmp	short loc_7E316
; ���������������������������������������������������������������������������

loc_7E30D:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+126j
		push	700Eh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_7E316:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+157j
		push	0
		push	large 54584554h
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_7E332
		jmp	loc_7E3E4
; ���������������������������������������������������������������������������

loc_7E332:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+179j
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	si, ax
		cmp	si, 1
		jl	short loc_7E376
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+8],	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+0Ah], ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_7E376:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+18Ej
		cmp	si, 2
		jl	short loc_7E3AD
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+0Ch], ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+0Eh], ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_7E3AD:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+1C5j
		cmp	si, 3
		jl	short loc_7E3E4
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+10h], ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[di+12h], ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		lea	ax, [bp+var_E6]
		push	ax

loc_7E3DE:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_7E3E4:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+17Bj
					; Font_LoadDefinitionFromIFF_7E1B4+1FCj
		push	0

loc_7E3E6:
		push	large 50414853h
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_7E462
		mov	eax, [bp+var_74]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[di+20h], eax
		mov	byte ptr [di+24h], 3
		mov	byte ptr [di+25h], 1
		mov	dword ptr [di+26h], 0
		mov	eax, [bp+var_18]
		mov	[di+26h], eax
		push	0
		mov	al, [di+24h]
		push	ax
		push	large dword ptr	[di+20h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_7E462:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+247j
		push	0
		push	large 5350414Dh
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_7E47E
		jmp	loc_7E5CE
; ���������������������������������������������������������������������������

loc_7E47E:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+2C5j
		mov	[bp+var_20], 0
		mov	ax, word_70474
		add	ax, 27Fh
		mov	word ptr [bp+var_24+2],	ds
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		lea	ax, [bp+var_20]
		push	ax
		call	Path_NormalizeUppercase8
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		jmp	loc_7E58F
; ���������������������������������������������������������������������������

loc_7E4B1:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+40Cj
		lea	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_2E]
		push	ax
		call	CRT_Strupr
		pop	cx
		cmp	[bp+var_20], 0
		jz	short loc_7E4FD
		lea	ax, [bp+var_2E]
		mov	[bp+var_30], ds
		mov	[bp+var_32], ax
		push	8
		push	[bp+var_30]

loc_7E4E1:
		push	ax
		push	large [bp+var_20]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_7E4F7
		mov	ax, 1
		jmp	short loc_7E4F9
; ���������������������������������������������������������������������������

loc_7E4F7:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+33Cj
		xor	ax, ax

loc_7E4F9:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+341j
		or	al, al
		jz	short loc_7E577

loc_7E4FD:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+31Dj
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadDwordField_64AAE
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_3E+2],	dx
		mov	word ptr [bp+var_3E], ax
		mov	eax, [bp+var_3E]
		mov	[di+2Ah], eax
		mov	byte ptr [di+2Eh], 3
		mov	byte ptr [di+2Fh], 1
		mov	dword ptr [di+30h], 0
		mov	eax, [bp+var_3A]
		mov	[di+30h], eax
		push	large [bp+var_36]
		push	0
		mov	al, [di+2Eh]
		push	ax
		push	large dword ptr	[di+2Ah]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		jmp	short loc_7E5CE
; ���������������������������������������������������������������������������

loc_7E577:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+347j
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_ReadDwordField_64AAE
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_36], eax
		add	[bp+var_81], eax

loc_7E58F:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+2FAj
		test	word ptr [bp+var_74], 1
		jz	short loc_7E5AA
		mov	eax, [bp+var_70]
		dec	eax
		cmp	eax, [bp+var_81]
		jnz	short loc_7E5AA
		inc	[bp+var_81]
		jmp	short $+2

loc_7E5AA:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+3E0j
					; Font_LoadDefinitionFromIFF_7E1B4+3EDj
		mov	eax, [bp+var_81]
		cmp	eax, [bp+var_70]
		jl	short loc_7E5BA
		mov	ax, 1
		jmp	short loc_7E5BC
; ���������������������������������������������������������������������������

loc_7E5BA:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+3FFj
		xor	ax, ax

loc_7E5BC:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+404j
		or	ax, ax
		jnz	short loc_7E5C3
		jmp	loc_7E4B1
; ���������������������������������������������������������������������������

loc_7E5C3:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+40Aj
		jmp	short loc_7E5CE
; ���������������������������������������������������������������������������

loc_7E5C5:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+62j
		push	700Fh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_7E5CE:				; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+2C7j
					; Font_LoadDefinitionFromIFF_7E1B4+3C1j ...
		mov	[bp+var_E6], 2E0h
		lea	ax, [bp+var_E6]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0

loc_7E5E1:
		lea	ax, [bp+var_E6]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Font_LoadDefinitionFromIFF_7E1B4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GeomNode_SumOffsetsUpChain_50EEB (seg114).
; ==============================================================================================
GlyphObject_ResolveHierarchyOffset_7E5F2	proc far		; CODE XREF: VROOMM_StubThunk_6AE39J GlyphObject_StoreComputedPosition_7E690+10p

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_7E5F3:
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		mov	bx, [si+138h]
		mov	al, [bx+6]
		mov	ah, 0
		mov	dx, ax
		xor	eax, eax
		mov	[di+8],	eax
		mov	[di+4],	eax
		mov	[di], eax
		cmp	dx, 0A5h ; '�'
		jz	short loc_7E62F
		cmp	dx, 0A4h ; '�'
		jz	short loc_7E62F
		cmp	dx, 0A6h ; '�'
		jnz	short loc_7E689

loc_7E62F:				; CODE XREF: GlyphObject_ResolveHierarchyOffset_7E5F2+2Fj
					; GlyphObject_ResolveHierarchyOffset_7E5F2+35j
		mov	bx, [si+138h]
		mov	al, [bx+7]
		mov	ah, 0
		mov	cx, ax
		mov	bx, word_706A0
		cmp	[bx+1Eh], cx
		jbe	short loc_7E652
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_7E656
; ���������������������������������������������������������������������������

loc_7E652:				; CODE XREF: GlyphObject_ResolveHierarchyOffset_7E5F2+4Fj
		xor	dx, dx
		xor	ax, ax

loc_7E656:				; CODE XREF: GlyphObject_ResolveHierarchyOffset_7E5F2+5Ej
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_7E689
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	GeomNode_SumOffsetsUpChain_50EEB
		add	sp, 8
		mov	eax, [bp+var_12]
		mov	[di], eax
		mov	eax, [bp+var_E]
		mov	[di+4],	eax
		mov	eax, [bp+var_A]
		mov	[di+8],	eax

loc_7E689:				; CODE XREF: GlyphObject_ResolveHierarchyOffset_7E5F2+3Bj
					; GlyphObject_ResolveHierarchyOffset_7E5F2+6Fj
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
GlyphObject_ResolveHierarchyOffset_7E5F2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Expr_Node_StoreResultVector_52C9C (seg114).
; ==============================================================================================
GlyphObject_StoreComputedPosition_7E690	proc far		; CODE XREF: VROOMM_StubThunk_6AE3EJ

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		push	ax
		push	cs
		call	near ptr GlyphObject_ResolveHierarchyOffset_7E5F2
		add	sp, 4
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_7E6DB
		mov	bx, word_706A0
		push	large dword ptr	[bx+54h]
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_E]
		sub	[si], eax
		mov	eax, [bp+var_A]
		sub	[si+4],	eax
		mov	eax, [bp+var_6]
		sub	[si+8],	eax

loc_7E6DB:				; CODE XREF: GlyphObject_StoreComputedPosition_7E690+1Dj
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
GlyphObject_StoreComputedPosition_7E690	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (35 lignes).
; ==============================================================================================
GlyphObject_Helper_7E6E1	proc far		; CODE XREF: VROOMM_StubThunk_6AE52J GlyphObject_Helper8_7EC45+16Ap

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh
arg_C		= byte ptr  12h

		push	bp

loc_7E6E2:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_7E6E8:
		mov	al, [bp+arg_C]
		push	ax

loc_7E6EC:
		push	large [bp+arg_8]
		mov	ax, [bp+arg_6]
		inc	ax
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [si+34h]
		push	cs
		call	near ptr GlyphObject_DrawScaled_7E0BD
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
GlyphObject_Helper_7E6E1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (26 lignes).
; ==============================================================================================
GlyphObject_Helper2_7E708	proc far		; CODE XREF: VROOMM_StubThunk_6AE57J Expr_ResolveBuiltinCallSite_7E81D+3Bp	...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_8]
		mov	ax, [bp+arg_6]
		inc	ax
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [si+34h]
		push	cs
		call	near ptr GlyphObject_ResolveAndMeasure_7E00D
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
GlyphObject_Helper2_7E708	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (70 lignes).
; ==============================================================================================
GlyphObject_Helper3_7E72B	proc far		; CODE XREF: VROOMM_StubThunk_6AE5CJ Render_DrawComplexShape_7EDCA+B8p	...

var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_6], di
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		add	[bp+var_4], eax
		mov	ax, si
		add	ax, 18h
		mov	[bp+var_A], ax
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	bx, [bp+var_A]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		mov	ax, [si]
		add	ax, word ptr [bp+var_4+1]
		mov	bx, [bp+arg_4]
		mov	[bx], ax
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	di, si
		add	di, 14h
		mov	eax, [di]
		add	[bp+var_E], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [bp+var_E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_E], eax
		mov	ax, [si+2]
		add	ax, [si+6]
		sub	ax, word ptr [bp+var_E+1]
		mov	bx, [bp+arg_6]
		mov	[bx], ax
		pop	di
		pop	si
		leave
		retf
GlyphObject_Helper3_7E72B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé, Render_MeasureOrDrawTextString_61F52 (seg174),
; TextFormat_ReleaseAttribute_5E5AC (seg143).
; ==============================================================================================
GlyphObject_MeasureAndRelease_7E7CC	proc far		; CODE XREF: VROOMM_StubThunk_6AE61J GlyphObject_MeasureAndDraw_7F587+Ep

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		mov	al, [si+2Eh]
		push	ax
		push	large dword ptr	[si+2Ah]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_7E80E
		push	0
		push	dx
		push	ax
		push	large 0
		push	di
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_7E819
; ���������������������������������������������������������������������������

loc_7E80E:				; CODE XREF: GlyphObject_MeasureAndRelease_7E7CC+2Ej
		push	0
		push	di
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4

loc_7E819:				; CODE XREF: GlyphObject_MeasureAndRelease_7E7CC+40j
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureAndRelease_7E7CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 205 lignes, NON DÉTAILLÉE — combine Expr_LookupBuiltinFuncDesc_52C5F (seg114, ×2) —
; résolution de site d'appel de fonction native pour la VM d'expression.
; ==============================================================================================
Expr_ResolveBuiltinCallSite_7E81D	proc far		; CODE XREF: VROOMM_StubThunk_6AE6BJ GlyphObject_MeasureAndDraw_7F587+44p

var_22		= word ptr -22h
var_19		= byte ptr -19h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+34h]
		mov	al, 61h	; 'a'
		mov	[bx+1Ah], al
		mov	ah, 0
		push	ax
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocate_7DF7F
		add	sp, 4
		mov	bx, [si+34h]
		mov	ax, [bx+17h]
		inc	ax
		mov	[bp+var_2], ax
		mov	di, [si+0Ah]
		add	di, 6
		push	ds
		push	offset aMission	; "Mission:"
		push	di
		push	word ptr [si+8]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		add	di, [bp+var_2]
		mov	ax, word_706A0
		add	ax, 9
		mov	[bp+var_4], ds
		mov	[bp+var_6], ax
		push	[bp+var_4]
		push	ax
		push	di
		mov	ax, [si+8]
		add	ax, 8
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		add	di, [bp+var_2]
		add	di, 2
		push	ds
		push	offset aLeader	; "Leader:"
		push	di
		push	word ptr [si+8]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		add	di, [bp+var_2]
		mov	word ptr [bp+var_A+2], ds
		mov	word ptr [bp+var_A], 1449h
		push	word_706A0
		call	VROOMM_StubThunk_6CE29
		pop	cx
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_7E8DF
		mov	bx, word_706A0
		mov	eax, [bx+54h]
		cmp	eax, [bp+var_12]
		jz	short loc_7E8DF
		push	dx
		push	word ptr [bp+var_12]
		call	Expr_LookupBuiltinFuncDesc_52C5F
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax

loc_7E8DF:				; CODE XREF: Expr_ResolveBuiltinCallSite_7E81D+A0j
					; Expr_ResolveBuiltinCallSite_7E81D+AEj
		push	10h
		push	large [bp+var_A]
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_19], 0
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	di
		mov	ax, [si+8]
		add	ax, 8
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		add	di, [bp+var_2]
		add	di, 2
		push	ds
		push	offset aWingman	; "Wingman:"
		push	di
		push	word ptr [si+8]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		add	di, [bp+var_2]
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], 549h
		push	word_706A0
		call	VROOMM_StubThunk_6CE2E
		pop	cx
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax

loc_7E942:
		cmp	[bp+var_12], 0
		jz	short loc_7E98A
		les	bx, [bp+var_12]

loc_7E94C:
		mov	dx, es:[bx+52h]

loc_7E950:
		or	dx, dx

loc_7E952:
		jz	short loc_7E978

loc_7E954:
		cmp	dx, word_722E6
		jnz	short loc_7E964
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], 1449h
		jmp	short loc_7E98A
; ���������������������������������������������������������������������������

loc_7E964:				; CODE XREF: Expr_ResolveBuiltinCallSite_7E81D+13Bj
		mov	bx, dx
		mov	ax, [bx+57h]
		mov	dx, [bx+55h]
		add	dx, 8Ch	; '�'
		mov	word ptr [bp+var_E+2], ax
		mov	word ptr [bp+var_E], dx
		jmp	short loc_7E98A
; ���������������������������������������������������������������������������

loc_7E978:				; CODE XREF: Expr_ResolveBuiltinCallSite_7E81D:loc_7E952j
		push	large [bp+var_12]
		call	Expr_LookupBuiltinFuncDesc_52C5F
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax

loc_7E98A:				; CODE XREF: Expr_ResolveBuiltinCallSite_7E81D+12Aj
					; Expr_ResolveBuiltinCallSite_7E81D+145j ...
		push	10h
		push	large [bp+var_E]
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_19], 0
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	di
		mov	ax, [si+8]
		add	ax, 8
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr GlyphObject_ComputeClipRegion_7E9C9
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Expr_ResolveBuiltinCallSite_7E81D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 176 lignes, NON DÉTAILLÉE — appelle Rect_ComputeIntersection_60F02 (seg164, ×2).
; ==============================================================================================
GlyphObject_ComputeClipRegion_7E9C9	proc far		; CODE XREF: VROOMM_StubThunk_6AE70J Expr_ResolveBuiltinCallSite_7E81D+1A2p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+34h]
		mov	al, 61h	; 'a'
		mov	[bx+1Ah], al
		mov	ah, 0
		push	ax
		push	bx
		push	cs

loc_7E9E1:
		call	near ptr GlyphObject_MeasureAndAllocate_7DF7F

loc_7E9E4:
		add	sp, 4
		mov	bx, [si+34h]
		mov	ax, [bx+17h]
		inc	ax
		mov	[bp+var_2], ax
		mov	di, [si+0Eh]
		mov	[bp+var_4], 54Eh
		mov	bx, [si+138h]
		mov	al, [bx+6]
		mov	ah, 0
		sub	ax, 0A1h ; '�'
		mov	bx, ax
		cmp	bx, 9		; switch 10 cases
		ja	short loc_7EA50	; default
		shl	bx, 1
		jmp	cs:off_7EAF9[bx] ; switch jump

loc_7EA13:				; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 557h ; case	0x0
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA1A:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 560h ; case	0x1
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA21:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 568h ; case	0x3
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA28:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 57Bh ; case	0x4
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA2F:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 58Ch ; case	0x5
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA36:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 59Ch ; case	0x6
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA3D:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 5ABh ; case	0x7
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA44:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 5B7h ; case	0x8
		jmp	short loc_7EA50	; default
; ���������������������������������������������������������������������������

loc_7EA4B:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+45j
					; DATA XREF: ovr241:off_7EAF9o
		mov	[bp+var_4], 5C4h ; case	0x9

loc_7EA50:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+41j
					; GlyphObject_ComputeClipRegion_7E9C9+45j ...
		push	ds		; default
		push	offset aObjective ; "Objective:"
		push	di
		push	word ptr [si+0Ch]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		add	di, [bp+var_2]
		push	0C3h ; '�'
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	dx, di
		add	dx, ax
		push	dx
		mov	ax, [si+0Ch]
		add	ax, 2Fh	; '/'
		push	ax
		push	di
		push	word ptr [si+0Ch]
		push	[bp+arg_2]
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	ds
		push	[bp+var_4]
		push	di
		push	word ptr [si+0Ch]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		mov	di, [si+12h]
		push	ds
		push	offset aNotes	; "Notes:"
		push	di
		push	word ptr [si+10h]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_7E708
		add	sp, 0Ch
		add	di, [bp+var_2]
		push	0C3h ; '�'
		mov	ax, [bp+var_2]
		imul	ax, 3
		mov	dx, di
		add	dx, ax
		push	dx
		mov	ax, [si+10h]
		add	ax, 37h	; '7'
		push	ax
		push	di
		push	word ptr [si+10h]
		push	[bp+arg_2]
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		cmp	dword ptr [si+142h], 0
		jz	short loc_7EAF5
		push	large dword ptr	[si+142h]
		push	di
		push	word ptr [si+10h]
		push	[bp+arg_2]
		push	si
		push	cs

loc_7EAEF:
		call	near ptr GlyphObject_Helper2_7E708

loc_7EAF2:
		add	sp, 0Ch

loc_7EAF5:				; CODE XREF: GlyphObject_ComputeClipRegion_7E9C9+116j
		pop	di
		pop	si
		leave

locret_7EAF8:
		retf
GlyphObject_ComputeClipRegion_7E9C9	endp

; ���������������������������������������������������������������������������
off_7EAF9	dw offset loc_7EA13	; DATA XREF: GlyphObject_ComputeClipRegion_7E9C9+45r
		dw offset loc_7EA1A	; jump table for switch	statement
		dw offset loc_7EA50
		dw offset loc_7EA21
		dw offset loc_7EA28
		dw offset loc_7EA2F
		dw offset loc_7EA36
		dw offset loc_7EA3D
		dw offset loc_7EA44
		dw offset loc_7EA4B

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (13 lignes).
; ==============================================================================================
GlyphObject_Helper4_7EB0D	proc far		; CODE XREF: VROOMM_StubThunk_6AE25J Render_DrawComplexShape_7EDCA+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+36h], 0
		pop	si
		pop	bp
		retf
GlyphObject_Helper4_7EB0D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (64 lignes).
; ==============================================================================================
GlyphObject_Helper5_7EB1C	proc far		; CODE XREF: VROOMM_StubThunk_6AE2AJ GlyphObject_Helper8_7EC45+135p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_7EB23:
		mov	si, [bp+arg_0]

loc_7EB26:
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]

loc_7EB2C:
		mov	ax, dx

loc_7EB2E:
		add	ax, [bp+arg_6]
		dec	ax

loc_7EB32:
		mov	[bp+var_2], ax
		mov	ax, cx

loc_7EB37:
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_4], ax
		cmp	word ptr [si+36h], 20h ; ' '

loc_7EB42:
		jge	short loc_7EB6F
		mov	bx, [si+36h]
		shl	bx, 1
		mov	[bx+si+38h], dx

loc_7EB4C:
		mov	bx, [si+36h]
		shl	bx, 1
		mov	[bx+si+78h], cx
		mov	bx, [si+36h]
		shl	bx, 1
		mov	ax, [bp+var_2]
		mov	[bx+si+0B8h], ax
		mov	bx, [si+36h]
		shl	bx, 1
		mov	ax, [bp+var_4]
		mov	[bx+si+0F8h], ax
		inc	word ptr [si+36h]

loc_7EB6F:				; CODE XREF: GlyphObject_Helper5_7EB1C:loc_7EB42j
		pop	si
		leave
		retf
GlyphObject_Helper5_7EB1C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (58 lignes).
; ==============================================================================================
GlyphObject_Helper6_7EB72	proc far		; CODE XREF: VROOMM_StubThunk_6AEA7J
					; GlyphObject_Helper8_7EC45:loc_7ED52p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cx, [bp+arg_6]
		mov	ax, [si]
		add	ax, dx
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [di]
		add	ax, cx
		dec	ax
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0F1h ; '�'
		jle	short loc_7EBA5
		mov	ax, 0F1h ; '�'
		sub	ax, dx
		inc	ax
		mov	[si], ax

loc_7EBA5:				; CODE XREF: GlyphObject_Helper6_7EB72+29j
		cmp	[bp+var_4], 0B1h ; '�'
		jle	short loc_7EBB4
		mov	ax, 0B1h ; '�'
		sub	ax, cx
		inc	ax
		mov	[di], ax

loc_7EBB4:				; CODE XREF: GlyphObject_Helper6_7EB72+38j
		cmp	word ptr [si], 19h
		jge	short loc_7EBBD
		mov	word ptr [si], 19h

loc_7EBBD:				; CODE XREF: GlyphObject_Helper6_7EB72+45j
		cmp	word ptr [di], 17h
		jge	short loc_7EBC6
		mov	word ptr [di], 17h

loc_7EBC6:				; CODE XREF: GlyphObject_Helper6_7EB72+4Ej
		pop	di
		pop	si
		leave
		retf
GlyphObject_Helper6_7EB72	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (103 lignes).
; ==============================================================================================
GlyphObject_Helper7_7EBCA	proc far		; CODE XREF: VROOMM_StubThunk_6AE2FJ GlyphObject_Helper8_7EC45+11Fp

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	ax, cx
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, di
		add	ax, [bp+arg_8]

loc_7EBE9:
		dec	ax

loc_7EBEA:
		mov	[bp+var_4], ax
		cmp	cx, 19h
		jl	short loc_7EC05

loc_7EBF2:
		cmp	[bp+var_2], 0F1h ; '�'
		jg	short loc_7EC05
		cmp	di, 17h
		jl	short loc_7EC05
		cmp	[bp+var_4], 0B1h ; '�'
		jle	short loc_7EC09

loc_7EC05:				; CODE XREF: GlyphObject_Helper7_7EBCA+26j
					; GlyphObject_Helper7_7EBCA+2Dj ...
		mov	al, 0
		jmp	short loc_7EC41
; ���������������������������������������������������������������������������

loc_7EC09:				; CODE XREF: GlyphObject_Helper7_7EBCA+39j
		xor	dx, dx
		jmp	short loc_7EC3A
; ���������������������������������������������������������������������������

loc_7EC0D:				; CODE XREF: GlyphObject_Helper7_7EBCA:loc_7EC3Dj
		mov	bx, dx
		shl	bx, 1
		cmp	[bx+si+0B8h], cx
		jl	short loc_7EC39
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+si+38h]
		cmp	ax, [bp+var_2]
		jg	short loc_7EC39
		mov	bx, dx
		shl	bx, 1

loc_7EC27:
		cmp	[bx+si+0F8h], di
		jl	short loc_7EC39
		mov	bx, dx

loc_7EC2F:
		shl	bx, 1

loc_7EC31:
		mov	ax, [bx+si+78h]

loc_7EC34:
		cmp	ax, [bp+var_4]
		jle	short loc_7EC05

loc_7EC39:				; CODE XREF: GlyphObject_Helper7_7EBCA+4Bj
					; GlyphObject_Helper7_7EBCA+57j ...
		inc	dx

loc_7EC3A:				; CODE XREF: GlyphObject_Helper7_7EBCA+41j
		cmp	[si+36h], dx

loc_7EC3D:
		jg	short loc_7EC0D

loc_7EC3F:
		mov	al, 1

loc_7EC41:				; CODE XREF: GlyphObject_Helper7_7EBCA+3Dj
		pop	di

loc_7EC42:
		pop	si
		leave

locret_7EC44:
		retf
GlyphObject_Helper7_7EBCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 256 lignes, NON DÉTAILLÉE — aucun appel externe visible (calcul entièrement inline).
; ==============================================================================================
GlyphObject_Helper8_7EC45	proc far		; CODE XREF: VROOMM_StubThunk_6AE34J Render_DrawComplexShape_7EDCA+61Bp ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh
arg_C		= byte ptr  12h

		push	bp

loc_7EC46:
		mov	bp, sp

loc_7EC48:
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+34h]
		mov	al, 41h	; 'A'
		mov	[bx+1Ah], al
		mov	ah, 0
		push	ax
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocate_7DF7F
		add	sp, 4
		push	large [bp+arg_8]
		push	word ptr [si+34h]
		push	cs
		call	near ptr GlyphObject_MeasureWrapper_7DFCA
		add	sp, 6
		mov	[bp+var_2], ax
		mov	bx, [si+34h]
		mov	di, [bx+17h]
		inc	di
		sar	ax, 1
		mov	[bp+var_4], ax
		mov	[bp+var_5], 0
		mov	[bp+var_8], 0
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_C], ax
		jmp	loc_7ED90
; ���������������������������������������������������������������������������

loc_7EC98:				; CODE XREF: GlyphObject_Helper8_7EC45+154j
		mov	bx, [bp+var_8]
		cmp	bx, 5		; switch 6 cases
		jbe	short loc_7ECA3
		jmp	loc_7ED23	; default
; ���������������������������������������������������������������������������

loc_7ECA3:				; CODE XREF: GlyphObject_Helper8_7EC45+59j
		shl	bx, 1
		jmp	cs:off_7EDBE[bx] ; switch jump

loc_7ECAA:				; DATA XREF: ovr241:off_7EDBEo
		mov	ax, [bp+arg_4]	; case 0x0
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, di
		sar	ax, 1
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	dx, [bp+arg_6]
		add	dx, ax

loc_7ECC1:				; CODE XREF: GlyphObject_Helper8_7EC45+B7j
		mov	[bp+var_C], dx
		jmp	short loc_7ED3C
; ���������������������������������������������������������������������������

loc_7ECC6:				; CODE XREF: GlyphObject_Helper8_7EC45+60j
					; DATA XREF: ovr241:off_7EDBEo
		mov	ax, [bp+arg_4]	; case 0x1
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, di
		sar	ax, 1
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	dx, [bp+arg_6]
		sub	dx, di
		jmp	short loc_7ECFA
; ���������������������������������������������������������������������������

loc_7ECDF:				; CODE XREF: GlyphObject_Helper8_7EC45+60j
					; DATA XREF: ovr241:off_7EDBEo
		mov	ax, [bp+arg_4]	; case 0x2

loc_7ECE2:
		add	ax, 3
		jmp	short loc_7ECF0
; ���������������������������������������������������������������������������

loc_7ECE7:				; CODE XREF: GlyphObject_Helper8_7EC45+60j
					; DATA XREF: ovr241:off_7EDBEo
		mov	ax, [bp+arg_4]	; case 0x3
		sub	ax, [bp+var_2]

loc_7ECED:
		add	ax, 0FFFDh

loc_7ECF0:				; CODE XREF: GlyphObject_Helper8_7EC45+A0j
		mov	[bp+var_A], ax

loc_7ECF3:
		mov	ax, di
		sar	ax, 1
		mov	dx, [bp+arg_6]

loc_7ECFA:				; CODE XREF: GlyphObject_Helper8_7EC45+98j
		sub	dx, ax
		jmp	short loc_7ECC1
; ���������������������������������������������������������������������������

loc_7ECFE:				; CODE XREF: GlyphObject_Helper8_7EC45+60j
					; DATA XREF: ovr241:off_7EDBEo
		mov	ax, [bp+arg_4]	; case 0x4
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_6]
		add	ax, di
		jmp	short loc_7ED1E
; ���������������������������������������������������������������������������

loc_7ED0E:				; CODE XREF: GlyphObject_Helper8_7EC45+60j
					; DATA XREF: ovr241:off_7EDBEo
		mov	ax, [bp+arg_4]	; case 0x5
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_6]
		sub	ax, di
		sub	ax, di

loc_7ED1E:				; CODE XREF: GlyphObject_Helper8_7EC45+C7j
		mov	[bp+var_C], ax
		jmp	short loc_7ED3C
; ���������������������������������������������������������������������������

loc_7ED23:				; CODE XREF: GlyphObject_Helper8_7EC45+5Bj
		mov	ax, [bp+arg_4]	; default
		add	ax, 3
		mov	[bp+var_A], ax

loc_7ED2C:
		mov	ax, di
		sar	ax, 1
		mov	dx, [bp+arg_6]
		sub	dx, ax

loc_7ED35:
		mov	[bp+var_C], dx
		mov	[bp+var_5], 1

loc_7ED3C:				; CODE XREF: GlyphObject_Helper8_7EC45+7Fj
					; GlyphObject_Helper8_7EC45+DCj
		mov	al, [bp+var_5]

loc_7ED3F:
		mov	ah, 0
		or	ax, ax

loc_7ED43:
		jnz	short loc_7ED90
		push	di

loc_7ED46:
		push	[bp+var_2]

loc_7ED49:
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	cs

loc_7ED52:
		call	near ptr GlyphObject_Helper6_7EB72

loc_7ED55:
		add	sp, 8
		push	di
		push	[bp+var_2]
		push	[bp+var_C]
		push	[bp+var_A]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper7_7EBCA
		add	sp, 0Ah
		or	al, al
		jz	short loc_7ED86
		push	di
		push	[bp+var_2]
		push	[bp+var_C]
		push	[bp+var_A]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper5_7EB1C
		add	sp, 0Ah
		mov	[bp+var_5], 1
		jmp	short loc_7ED90
; ���������������������������������������������������������������������������

loc_7ED86:				; CODE XREF: GlyphObject_Helper8_7EC45+127j
		cmp	byte_6D5DE, 0
		jnz	short loc_7EDBA
		inc	[bp+var_8]

loc_7ED90:				; CODE XREF: GlyphObject_Helper8_7EC45+50j
					; GlyphObject_Helper8_7EC45:loc_7ED43j	...
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7ED9C
		jmp	loc_7EC98
; ���������������������������������������������������������������������������

loc_7ED9C:				; CODE XREF: GlyphObject_Helper8_7EC45+152j
		mov	al, [bp+arg_C]
		push	ax
		push	large [bp+arg_8]
		push	[bp+var_C]
		push	[bp+var_A]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper_7E6E1

loc_7EDB2:
		add	sp, 0Eh

loc_7EDB5:
		mov	byte_6D5DE, 0

loc_7EDBA:				; CODE XREF: GlyphObject_Helper8_7EC45+146j
		pop	di
		pop	si

locret_7EDBC:
		leave

locret_7EDBD:
		retf
GlyphObject_Helper8_7EC45	endp

; ���������������������������������������������������������������������������
off_7EDBE	dw offset loc_7ECAA	; DATA XREF: GlyphObject_Helper8_7EC45+60r
		dw offset loc_7ECC6	; jump table for switch	statement
		dw offset loc_7ECDF
		dw offset loc_7ECE7
		dw offset loc_7ECFE
		dw offset loc_7ED0E

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 1080 lignes, NON DÉTAILLÉE — combine Render_SetPixelClipped_61B58 (seg171),
; Render_DrawEllipseOutline_61612 (seg169), Render_FillClippedRect_61960 (seg170, répété) —
; grosse fonction de dessin combinant plusieurs primitives 2D. Candidat prioritaire pour
; session dédiée.
; ==============================================================================================
Render_DrawComplexShape_7EDCA	proc far		; CODE XREF: VROOMM_StubThunk_6AE66J GlyphObject_MeasureAndDraw_7F587+17p

var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= word ptr -50h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= byte ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper4_7EB0D
		pop	cx
		mov	ax, word_706A0
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		cmp	[bp+var_2], 0
		jnz	short loc_7EDEF
		jmp	loc_7F214
; ���������������������������������������������������������������������������

loc_7EDEF:				; CODE XREF: Render_DrawComplexShape_7EDCA+20j
		jmp	loc_7F1EF
; ���������������������������������������������������������������������������

loc_7EDF2:				; CODE XREF: Render_DrawComplexShape_7EDCA+447j
		mov	eax, [di+4]
		mov	[bp+var_A+2], eax
		cmp	[bp+var_A+2], 0
		jnz	short loc_7EE04
		jmp	loc_7F1EC
; ���������������������������������������������������������������������������

loc_7EE04:				; CODE XREF: Render_DrawComplexShape_7EDCA+35j
		cmp	byte ptr [di], 0
		jz	short loc_7EE2A
		cmp	dword ptr [di+4], 0
		jz	short loc_7EE2A
		les	bx, [di+4]

loc_7EE13:
		cmp	byte ptr es:[bx+2], 2Eh	; '.'
		jz	short loc_7EE1F

loc_7EE1A:
		mov	ax, 1

loc_7EE1D:
		jmp	short loc_7EE21
; ���������������������������������������������������������������������������

loc_7EE1F:				; CODE XREF: Render_DrawComplexShape_7EDCA+4Ej
		xor	ax, ax

loc_7EE21:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7EE1Dj
		or	al, al

loc_7EE23:
		jz	short loc_7EE2A

loc_7EE25:
		mov	ax, 1
		jmp	short loc_7EE2C
; ���������������������������������������������������������������������������

loc_7EE2A:				; CODE XREF: Render_DrawComplexShape_7EDCA+3Dj
					; Render_DrawComplexShape_7EDCA+44j ...
		xor	ax, ax

loc_7EE2C:				; CODE XREF: Render_DrawComplexShape_7EDCA+5Ej
		or	al, al
		jnz	short loc_7EE33
		jmp	loc_7F1EC
; ���������������������������������������������������������������������������

loc_7EE33:				; CODE XREF: Render_DrawComplexShape_7EDCA+64j
		mov	word ptr [bp+var_A], 0D7h ; '�'

loc_7EE38:
		mov	eax, [si+13Ah]
		cmp	eax, [bp+var_A+2]

loc_7EE41:
		jnz	short loc_7EE48

loc_7EE43:
		mov	word ptr [bp+var_A], 0EEh ; '�'

loc_7EE48:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7EE41j
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, [bp+var_6]
		mov	dx, word ptr [bp+var_A+2]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		les	di, [bp+var_12]
		mov	eax, es:[di]
		mov	[bp+var_6E], eax
		mov	eax, es:[di+4]
		mov	[bp+var_6A], eax
		mov	eax, es:[di+8]
		mov	[bp+var_66], eax
		lea	ax, [bp+var_6E]
		push	ax
		push	si
		push	cs
		call	near ptr GlyphObject_Helper3_7E72B
		add	sp, 8
		mov	al, byte ptr [bp+var_A]
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_2]
		call	Render_SetPixelClipped_61B58
		add	sp, 8
		push	large [bp+var_A+2]
		les	bx, [bp+var_A+2]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 4
		cbw
		cmp	ax, 42h	; 'B'
		jnz	short loc_7EEB5
		jmp	loc_7F015
; ���������������������������������������������������������������������������

loc_7EEB5:				; CODE XREF: Render_DrawComplexShape_7EDCA+E6j
		cmp	ax, 43h	; 'C'
		jnz	short loc_7EEBD
		jmp	loc_7EF74
; ���������������������������������������������������������������������������

loc_7EEBD:				; CODE XREF: Render_DrawComplexShape_7EDCA+EEj
		cmp	ax, 53h	; 'S'
		jz	short loc_7EEC5
		jmp	loc_7F1EC
; ���������������������������������������������������������������������������

loc_7EEC5:				; CODE XREF: Render_DrawComplexShape_7EDCA+F6j
		mov	eax, [bp+var_A+2]
		mov	[bp+var_18+2], eax
		mov	ax, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_18+2]
		add	dx, 2Eh	; '.'
		mov	word ptr [bp+var_1C+2],	ax
		mov	word ptr [bp+var_1C], dx
		les	bx, [bp+var_1C]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_28+1]
		mov	word ptr [bp+var_18], ax
		mov	ax, word ptr [bp+var_14]

loc_7EF16:
		mov	dx, word ptr [bp+var_18+2]
		add	dx, 2Eh	; '.'
		mov	word ptr [bp+var_2E+2],	ax

loc_7EF1F:
		mov	word ptr [bp+var_2E], dx

loc_7EF22:
		les	bx, [bp+var_2E]

loc_7EF25:
		mov	eax, es:[bx]

loc_7EF29:
		mov	[bp+var_32], eax
		mov	di, si
		add	di, 1Ch

loc_7EF32:
		mov	eax, [bp+var_32]

loc_7EF36:
		mov	edx, eax

loc_7EF39:
		mov	ecx, [di]
		sar	edx, 18h

loc_7EF40:
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	ax, word ptr [bp+var_3A+1]
		mov	[bp+var_2A], ax
		mov	al, byte ptr [bp+var_A]
		push	ax
		push	[bp+var_2A]
		push	word ptr [bp+var_18]

loc_7EF63:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7F012j
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_2]
		call	Render_DrawEllipseOutline_61612
		jmp	loc_7F1E9
; ���������������������������������������������������������������������������

loc_7EF74:				; CODE XREF: Render_DrawComplexShape_7EDCA+F0j
		mov	eax, [bp+var_A+2]
		mov	[bp+var_18+2], eax
		mov	ax, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_18+2]
		add	dx, 32h	; '2'
		mov	word ptr [bp+var_1C+2],	ax
		mov	word ptr [bp+var_1C], dx
		les	bx, [bp+var_1C]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_7EFB0:
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax

loc_7EFBC:
		mov	ax, word ptr [bp+var_28+1]
		mov	word ptr [bp+var_18], ax
		mov	ax, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_18+2]
		add	dx, 32h	; '2'
		mov	word ptr [bp+var_2E+2],	ax
		mov	word ptr [bp+var_2E], dx
		les	bx, [bp+var_2E]
		mov	eax, es:[bx]
		mov	[bp+var_32], eax
		mov	di, si
		add	di, 1Ch

loc_7EFE1:
		mov	eax, [bp+var_32]

loc_7EFE5:
		mov	edx, eax

loc_7EFE8:
		mov	ecx, [di]
		sar	edx, 18h

loc_7EFEF:
		shl	eax, 8

loc_7EFF3:
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	ax, word ptr [bp+var_3A+1]
		mov	[bp+var_2A], ax
		mov	al, byte ptr [bp+var_A]
		push	ax
		push	[bp+var_2A]
		push	word ptr [bp+var_18]

loc_7F012:
		jmp	loc_7EF63
; ���������������������������������������������������������������������������

loc_7F015:				; CODE XREF: Render_DrawComplexShape_7EDCA+E8j
		mov	eax, [bp+var_A+2]

loc_7F019:
		mov	[bp+var_18+2], eax
		mov	ax, word ptr [bp+var_14]

loc_7F020:
		mov	dx, word ptr [bp+var_18+2]

loc_7F023:
		add	dx, 32h	; '2'

loc_7F026:
		mov	word ptr [bp+var_18], ax
		mov	word ptr [bp+var_1C+2],	dx

loc_7F02C:
		les	bx, [bp+var_1C+2]

loc_7F02F:
		mov	eax, es:[bx]

loc_7F033:
		mov	[bp+var_20+2], eax

loc_7F037:
		mov	di, si

loc_7F039:
		add	di, 18h
		mov	eax, [bp+var_20+2]

loc_7F040:
		mov	edx, eax

loc_7F043:
		mov	ecx, [di]

loc_7F046:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_7F051:
		mov	[bp+var_24+2], eax
		mov	eax, [bp+var_24+2]
		mov	[bp+var_28+2], eax
		mov	di, word ptr [bp+var_28+3]
		mov	ax, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_18+2]
		add	dx, 2Eh	; '.'
		mov	[bp+var_2A], ax
		mov	word ptr [bp+var_2E+2],	dx
		les	bx, [bp+var_2E+2]
		mov	eax, es:[bx]
		mov	[bp+var_32+2], eax
		mov	ax, si
		add	ax, 18h
		mov	word ptr [bp+var_32], ax
		mov	eax, [bp+var_32+2]
		mov	edx, eax
		mov	bx, word ptr [bp+var_32]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	ax, word ptr [bp+var_3A+1]
		mov	word ptr [bp+var_28], ax
		mov	ax, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_18+2]
		add	dx, 36h	; '6'
		mov	word ptr [bp+var_40+2],	ax

loc_7F0B8:
		mov	word ptr [bp+var_40], dx
		les	bx, [bp+var_40]
		mov	eax, es:[bx]
		mov	[bp+var_44], eax
		mov	ax, si
		add	ax, 1Ch
		mov	[bp+var_46], ax
		mov	eax, [bp+var_44]
		mov	edx, eax
		mov	bx, [bp+var_46]
		mov	ecx, [bx]
		sar	edx, 18h

loc_7F0DF:
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	ax, word ptr [bp+var_4E+1]
		mov	[bp+var_3C], ax
		mov	ax, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_18+2]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_54+2],	ax
		mov	word ptr [bp+var_54], dx
		les	bx, [bp+var_54]
		mov	eax, es:[bx]
		mov	[bp+var_58], eax
		mov	ax, si
		add	ax, 1Ch
		mov	[bp+var_5A], ax

loc_7F11A:
		mov	eax, [bp+var_58]
		mov	edx, eax

loc_7F121:
		mov	bx, [bp+var_5A]
		mov	ecx, [bx]

loc_7F127:
		sar	edx, 18h
		shl	eax, 8

loc_7F12F:
		idiv	ecx
		mov	[bp+var_5E], eax

loc_7F136:
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	ax, word ptr [bp+var_62+1]

loc_7F141:
		mov	[bp+var_50], ax
		mov	al, byte ptr [bp+var_A]
		push	ax

loc_7F148:
		mov	ax, [bp+var_E]

loc_7F14B:
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]
		sub	ax, di
		push	ax
		push	[bp+arg_2]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		sub	ax, di
		push	ax
		push	[bp+arg_2]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		sub	ax, di
		push	ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]

loc_7F1B3:
		sub	ax, di
		push	ax

loc_7F1B6:
		push	[bp+arg_2]

loc_7F1B9:
		call	Render_FillClippedRect_61960
		add	sp, 0Ch

loc_7F1C1:
		mov	al, byte ptr [bp+var_A]
		push	ax

loc_7F1C5:
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax

loc_7F1E1:
		push	[bp+arg_2]
		call	Render_FillClippedRect_61960

loc_7F1E9:				; CODE XREF: Render_DrawComplexShape_7EDCA+1A7j
		add	sp, 0Ch

loc_7F1EC:				; CODE XREF: Render_DrawComplexShape_7EDCA+37j
					; Render_DrawComplexShape_7EDCA+66j ...
		inc	[bp+var_4]

loc_7F1EF:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7EDEFj
		mov	bx, [bp+var_2]

loc_7F1F2:
		mov	ax, [bx+3Ah]
		cmp	ax, [bp+var_4]
		jbe	short loc_7F209
		mov	ax, [bp+var_4]
		imul	ax, 27h
		push	ax
		mov	ax, [bx+3Ch]
		pop	dx
		add	ax, dx
		jmp	short loc_7F20B
; ���������������������������������������������������������������������������

loc_7F209:				; CODE XREF: Render_DrawComplexShape_7EDCA+42Ej
		xor	ax, ax

loc_7F20B:				; CODE XREF: Render_DrawComplexShape_7EDCA+43Dj
		mov	di, ax
		or	ax, ax
		jz	short loc_7F214
		jmp	loc_7EDF2
; ���������������������������������������������������������������������������

loc_7F214:				; CODE XREF: Render_DrawComplexShape_7EDCA+22j
					; Render_DrawComplexShape_7EDCA+445j
		mov	[bp+var_6], 0

loc_7F219:				; CODE XREF: Render_DrawComplexShape_7EDCA+628j
		mov	ax, [bp+var_6]
		inc	[bp+var_6]
		push	ax

loc_7F220:
		mov	ax, word_706A0

loc_7F223:
		add	ax, 34h	; '4'

loc_7F226:
		push	ax

loc_7F227:
		call	Expr_LookupTableEntry85B_52D45

loc_7F22C:
		add	sp, 4

loc_7F22F:
		mov	word ptr [bp+var_A+2], dx

loc_7F232:
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jnz	short loc_7F23F
		jmp	loc_7F3EB
; ���������������������������������������������������������������������������

loc_7F23F:				; CODE XREF: Render_DrawComplexShape_7EDCA+470j
		les	bx, [bp+var_A]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_7F24E
		mov	ax, 1
		jmp	short loc_7F250
; ���������������������������������������������������������������������������

loc_7F24E:				; CODE XREF: Render_DrawComplexShape_7EDCA+47Dj
		xor	ax, ax

loc_7F250:				; CODE XREF: Render_DrawComplexShape_7EDCA+482j
		or	ax, ax
		jnz	short loc_7F257
		jmp	loc_7F3EB
; ���������������������������������������������������������������������������

loc_7F257:				; CODE XREF: Render_DrawComplexShape_7EDCA+488j
		les	bx, [bp+var_A]
		mov	al, es:[bx+39h]
		shl	ax, 0Bh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_7F26B
		jmp	loc_7F3EB
; ���������������������������������������������������������������������������

loc_7F26B:				; CODE XREF: Render_DrawComplexShape_7EDCA+49Cj
		mov	di, es:[bx+52h]
		mov	[bp+var_C], 0
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_7F287
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_7F289
; ���������������������������������������������������������������������������

loc_7F287:				; CODE XREF: Render_DrawComplexShape_7EDCA+4B2j
		mov	al, 17h

loc_7F289:				; CODE XREF: Render_DrawComplexShape_7EDCA+4BBj
		cmp	al, 6
		jnz	short loc_7F290
		mov	[bp+var_C], di

loc_7F290:				; CODE XREF: Render_DrawComplexShape_7EDCA+4C1j
		lea	ax, [bp+var_12+2]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	si
		push	cs
		call	near ptr GlyphObject_Helper3_7E72B
		add	sp, 8
		les	bx, [bp+var_A]
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_7F2B7

loc_7F2B0:
		mov	word ptr [bp+var_12], 0E6h ; '�'
		jmp	short loc_7F2C9
; ���������������������������������������������������������������������������

loc_7F2B7:				; CODE XREF: Render_DrawComplexShape_7EDCA+4E4j
		cmp	di, word_722E6
		jnz	short loc_7F2C4
		mov	word ptr [bp+var_12], 0C7h ; '�'
		jmp	short loc_7F2C9
; ���������������������������������������������������������������������������

loc_7F2C4:				; CODE XREF: Render_DrawComplexShape_7EDCA+4F1j
		mov	word ptr [bp+var_12], 1Fh

loc_7F2C9:				; CODE XREF: Render_DrawComplexShape_7EDCA+4EBj
					; Render_DrawComplexShape_7EDCA+4F8j
		cmp	word ptr [bp+var_12], 0FFFFh
		jnz	short loc_7F2D2
		jmp	loc_7F39A
; ���������������������������������������������������������������������������

loc_7F2D2:				; CODE XREF: Render_DrawComplexShape_7EDCA+503j
		mov	al, byte ptr [bp+var_12]
		push	ax
		push	word ptr [bp+var_12+2]
		push	[bp+var_E]
		push	[bp+arg_2]
		call	Render_SetPixelClipped_61B58

loc_7F2E4:
		add	sp, 8

loc_7F2E7:
		push	large 30003h

loc_7F2ED:
		mov	ax, word ptr [bp+var_12+2]
		dec	ax
		push	ax

loc_7F2F2:
		mov	ax, [bp+var_E]
		dec	ax
		push	ax
		push	si
		push	cs
		call	near ptr GlyphObject_Helper5_7EB1C
		add	sp, 0Ah
		mov	word ptr [bp+var_1C+2],	1
		mov	word ptr [bp+var_1C], 0
		test	byte ptr [di+4], 4
		jz	short loc_7F37D
		push	di

loc_7F310:
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx

loc_7F316:
		add	ax, 0Ch
		mov	word ptr [bp+var_20+2],	ax
		mov	bx, word ptr [bp+var_20+2]
		mov	eax, [bx]

loc_7F322:
		mov	[bp+var_6E], eax

loc_7F326:
		mov	eax, [bx+4]

loc_7F32A:
		mov	[bp+var_6A], eax
		mov	eax, [bx+8]

loc_7F332:
		mov	[bp+var_66], eax
		cmp	[bp+var_6E], 40h ; '@'
		jle	short loc_7F344
		mov	word ptr [bp+var_1C+2],	0FFFFh
		jmp	short loc_7F357
; ���������������������������������������������������������������������������

loc_7F344:				; CODE XREF: Render_DrawComplexShape_7EDCA+571j
		cmp	[bp+var_6E], 0FFFFFFC0h
		jge	short loc_7F352
		mov	word ptr [bp+var_1C+2],	1
		jmp	short loc_7F357
; ���������������������������������������������������������������������������

loc_7F352:				; CODE XREF: Render_DrawComplexShape_7EDCA+57Fj
		mov	word ptr [bp+var_1C+2],	0

loc_7F357:				; CODE XREF: Render_DrawComplexShape_7EDCA+578j
					; Render_DrawComplexShape_7EDCA+586j
		cmp	[bp+var_6A], 40h ; '@'
		jle	short loc_7F365
		mov	word ptr [bp+var_1C], 1
		jmp	short loc_7F378
; ���������������������������������������������������������������������������

loc_7F365:				; CODE XREF: Render_DrawComplexShape_7EDCA+592j
		cmp	[bp+var_6A], 0FFFFFFC0h
		jge	short loc_7F373
		mov	word ptr [bp+var_1C], 0FFFFh
		jmp	short loc_7F378
; ���������������������������������������������������������������������������

loc_7F373:				; CODE XREF: Render_DrawComplexShape_7EDCA+5A0j
		mov	word ptr [bp+var_1C], 0

loc_7F378:				; CODE XREF: Render_DrawComplexShape_7EDCA+599j
					; Render_DrawComplexShape_7EDCA+5A7j
		mov	word ptr [bp+var_12], 0

loc_7F37D:				; CODE XREF: Render_DrawComplexShape_7EDCA+543j
		mov	al, byte ptr [bp+var_12]
		push	ax
		mov	ax, word ptr [bp+var_12+2]
		add	ax, word ptr [bp+var_1C]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, word ptr [bp+var_1C+2]
		push	ax
		push	[bp+arg_2]
		call	Render_SetPixelClipped_61B58
		add	sp, 8

loc_7F39A:				; CODE XREF: Render_DrawComplexShape_7EDCA+505j
		mov	word ptr [bp+var_14], 1Fh
		cmp	[bp+var_C], 0
		jz	short loc_7F3CA
		cmp	di, word_722E6
		jnz	short loc_7F3B5
		mov	word ptr [bp+var_18+2],	ds

loc_7F3AE:
		mov	word ptr [bp+var_18], 1449h
		jmp	short loc_7F3D2
; ���������������������������������������������������������������������������

loc_7F3B5:				; CODE XREF: Render_DrawComplexShape_7EDCA+5DFj
		mov	bx, [bp+var_C]
		mov	ax, [bx+57h]
		mov	dx, [bx+55h]
		add	dx, 8Ch	; '�'
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		jmp	short loc_7F3D2
; ���������������������������������������������������������������������������

loc_7F3CA:				; CODE XREF: Render_DrawComplexShape_7EDCA+5D9j
		mov	eax, [di+6]
		mov	[bp+var_18], eax

loc_7F3D2:				; CODE XREF: Render_DrawComplexShape_7EDCA+5E9j
					; Render_DrawComplexShape_7EDCA+5FEj
		mov	al, [bp+var_14]
		push	ax
		push	large [bp+var_18]
		push	word ptr [bp+var_12+2]
		push	[bp+var_E]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper8_7EC45
		add	sp, 0Eh

loc_7F3EB:				; CODE XREF: Render_DrawComplexShape_7EDCA+472j
					; Render_DrawComplexShape_7EDCA+48Aj ...
		cmp	[bp+var_A], 0
		jz	short loc_7F3F5
		jmp	loc_7F219
; ���������������������������������������������������������������������������

loc_7F3F5:				; CODE XREF: Render_DrawComplexShape_7EDCA+626j
		mov	[bp+var_4], 0
		cmp	[bp+var_2], 0
		jnz	short loc_7F403
		jmp	loc_7F583
; ���������������������������������������������������������������������������

loc_7F403:				; CODE XREF: Render_DrawComplexShape_7EDCA+634j
		jmp	loc_7F55E
; ���������������������������������������������������������������������������

loc_7F406:				; CODE XREF: Render_DrawComplexShape_7EDCA+7B6j
		mov	eax, [di+4]
		mov	[bp+var_A+2], eax

loc_7F40E:
		cmp	[bp+var_A+2], 0
		jnz	short loc_7F418
		jmp	loc_7F55B
; ���������������������������������������������������������������������������

loc_7F418:				; CODE XREF: Render_DrawComplexShape_7EDCA+649j
		cmp	byte ptr [di], 0
		jz	short loc_7F43E
		cmp	dword ptr [di+4], 0
		jz	short loc_7F43E

loc_7F424:
		les	bx, [di+4]

loc_7F427:
		cmp	byte ptr es:[bx+2], 2Eh	; '.'
		jz	short loc_7F433
		mov	ax, 1

loc_7F431:
		jmp	short loc_7F435
; ���������������������������������������������������������������������������

loc_7F433:				; CODE XREF: Render_DrawComplexShape_7EDCA+662j
		xor	ax, ax

loc_7F435:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7F431j
		or	al, al

loc_7F437:
		jz	short loc_7F43E
		mov	ax, 1

loc_7F43C:
		jmp	short loc_7F440
; ���������������������������������������������������������������������������

loc_7F43E:				; CODE XREF: Render_DrawComplexShape_7EDCA+651j
					; Render_DrawComplexShape_7EDCA+658j ...
		xor	ax, ax

loc_7F440:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7F43Cj
		or	al, al

loc_7F442:
		jnz	short loc_7F447

loc_7F444:
		jmp	loc_7F55B
; ���������������������������������������������������������������������������

loc_7F447:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7F442j
		mov	word ptr [bp+var_A], 0DFh ; '�'
		push	large [bp+var_A+2]
		mov	ax, [bp+var_2]
		add	ax, 68h	; 'h'
		push	ax
		call	Parser_FindDuplicateSymbol
		add	sp, 6
		or	al, al
		jz	short loc_7F468
		mov	word ptr [bp+var_A], 0EDh ; '�'

loc_7F468:				; CODE XREF: Render_DrawComplexShape_7EDCA+697j
		mov	eax, [si+13Ah]
		cmp	eax, [bp+var_A+2]
		jnz	short loc_7F478
		mov	word ptr [bp+var_A], 0C7h ; '�'

loc_7F478:				; CODE XREF: Render_DrawComplexShape_7EDCA+6A7j
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, [bp+var_6]
		mov	dx, word ptr [bp+var_A+2]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		les	di, [bp+var_12]
		mov	eax, es:[di]
		mov	[bp+var_6E], eax
		mov	eax, es:[di+4]
		mov	[bp+var_6A], eax
		mov	eax, es:[di+8]
		mov	[bp+var_66], eax
		lea	ax, [bp+var_6E]
		push	ax
		push	si
		push	cs

loc_7F4B2:
		call	near ptr GlyphObject_Helper3_7E72B
		add	sp, 8
		mov	byte_6D5DE, 1
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+var_A+2]

loc_7F4C4:
		add	ax, 2
		push	[bp+var_6]
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper8_7EC45
		add	sp, 0Eh
		cmp	byte_6D5DE, 0
		jz	short loc_7F506
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+var_A+2]
		add	ax, 2
		push	[bp+var_6]
		push	ax

loc_7F4F1:
		mov	ax, [bp+var_E]
		add	ax, 0Ah
		push	ax
		push	[bp+var_C]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper8_7EC45
		add	sp, 0Eh

loc_7F506:				; CODE XREF: Render_DrawComplexShape_7EDCA+717j
		cmp	byte_6D5DE, 0
		jz	short loc_7F530
		mov	al, byte ptr [bp+var_A]
		push	ax

loc_7F511:
		mov	ax, word ptr [bp+var_A+2]
		add	ax, 2
		push	[bp+var_6]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, 0FFF6h

loc_7F521:
		push	ax

loc_7F522:
		push	[bp+var_C]

loc_7F525:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper8_7EC45
		add	sp, 0Eh

loc_7F530:				; CODE XREF: Render_DrawComplexShape_7EDCA+741j
		cmp	byte_6D5DE, 0
		jz	short loc_7F55B
		mov	byte_6D5DE, 0
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+var_A+2]
		add	ax, 2
		push	[bp+var_6]
		push	ax
		push	[bp+var_E]

loc_7F54D:
		push	[bp+var_C]
		push	[bp+arg_2]

loc_7F553:
		push	si
		push	cs
		call	near ptr GlyphObject_Helper8_7EC45

loc_7F558:
		add	sp, 0Eh

loc_7F55B:				; CODE XREF: Render_DrawComplexShape_7EDCA+64Bj
					; Render_DrawComplexShape_7EDCA:loc_7F444j	...
		inc	[bp+var_4]

loc_7F55E:				; CODE XREF: Render_DrawComplexShape_7EDCA:loc_7F403j
		mov	bx, [bp+var_2]
		mov	ax, [bx+3Ah]
		cmp	ax, [bp+var_4]
		jbe	short loc_7F578
		mov	ax, [bp+var_4]
		imul	ax, 27h
		push	ax
		mov	ax, [bx+3Ch]
		pop	dx
		add	ax, dx
		jmp	short loc_7F57A
; ���������������������������������������������������������������������������

loc_7F578:				; CODE XREF: Render_DrawComplexShape_7EDCA+79Dj
		xor	ax, ax

loc_7F57A:				; CODE XREF: Render_DrawComplexShape_7EDCA+7ACj
		mov	di, ax
		or	ax, ax
		jz	short loc_7F583
		jmp	loc_7F406
; ���������������������������������������������������������������������������

loc_7F583:				; CODE XREF: Render_DrawComplexShape_7EDCA+636j
					; Render_DrawComplexShape_7EDCA+7B4j
		pop	di
		pop	si
		leave
		retf
Render_DrawComplexShape_7EDCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et Render_MeasureOrDrawTextString_61F52.
; ==============================================================================================
GlyphObject_MeasureAndDraw_7F587	proc far		; CODE XREF: VROOMM_StubThunk_6AE75J Cockpit_ProcessInputFrame_7F6EE+38p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr GlyphObject_MeasureAndRelease_7E7CC
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr Render_DrawComplexShape_7EDCA
		add	sp, 4
		push	large 0
		mov	al, [si+24h]
		push	ax
		push	large dword ptr	[si+20h]
		push	5C44h

loc_7F5B2:
		call	Memory_TypedAllocDispatchB_5C832

loc_7F5B7:
		add	sp, 0Ah
		push	dx
		push	ax

loc_7F5BC:
		push	large 0
		push	di
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	di
		push	si
		push	cs
		call	near ptr Expr_ResolveBuiltinCallSite_7E81D
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_MeasureAndDraw_7F587	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Str_GetNthEntry_50EC8 (seg114) et Expr_LookupNamedValue_52DDB (seg114).
; ==============================================================================================
Expr_ResolveStringEntry_7F5D5	proc far		; CODE XREF: VROOMM_StubThunk_6AE84J Lexer_AdvanceWrapper_7F69C+1Fp	...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+138h]

loc_7F5E4:
		mov	al, [bx+6]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	al, [bx+7]
		mov	ah, 0
		mov	di, ax
		mov	dword ptr [si+13Ah], 0
		mov	dword ptr [si+13Eh], 0
		mov	dword ptr [si+142h], 0
		mov	dx, [bx+8]

loc_7F611:
		cmp	dx, 0FFFFh
		jz	short loc_7F62E
		push	dx

loc_7F617:
		mov	ax, word_706A0
		add	ax, 28h	; '('

loc_7F61D:
		push	ax

loc_7F61E:
		call	Str_GetNthEntry_50EC8

loc_7F623:
		add	sp, 4

loc_7F626:
		mov	[si+144h], dx
		mov	[si+142h], ax

loc_7F62E:				; CODE XREF: Expr_ResolveStringEntry_7F5D5+3Fj
		mov	bx, [bp+var_2]
		sub	bx, 0A4h	; switch 7 cases
		cmp	bx, 6
		ja	short loc_7F68A	; default
		shl	bx, 1
		jmp	cs:off_7F68E[bx] ; switch jump

loc_7F641:				; DATA XREF: ovr241:off_7F68Eo
		mov	bx, word_706A0	; case 0xA4
		cmp	[bx+1Eh], di

loc_7F648:
		jbe	short loc_7F659

loc_7F64A:
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, di

loc_7F652:
		shl	bx, 4
		add	ax, bx
		jmp	short loc_7F65D
; ���������������������������������������������������������������������������

loc_7F659:				; CODE XREF: Expr_ResolveStringEntry_7F5D5:loc_7F648j
		xor	dx, dx
		xor	ax, ax

loc_7F65D:				; CODE XREF: Expr_ResolveStringEntry_7F5D5+82j
		mov	bx, ax
		mov	es, dx
		assume es:seg000
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[si+13Ch], ax
		mov	[si+13Ah], dx
		jmp	short loc_7F68A	; default
; ���������������������������������������������������������������������������

loc_7F672:				; CODE XREF: Expr_ResolveStringEntry_7F5D5+67j
					; DATA XREF: ovr241:off_7F68Eo
		push	di		; case 0xA7
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	[si+140h], dx
		mov	[si+13Eh], ax

loc_7F68A:				; CODE XREF: Expr_ResolveStringEntry_7F5D5+63j
					; Expr_ResolveStringEntry_7F5D5+9Bj
		pop	di		; default
		pop	si
		leave
		retf
Expr_ResolveStringEntry_7F5D5	endp

; ���������������������������������������������������������������������������
off_7F68E	dw offset loc_7F641	; DATA XREF: Expr_ResolveStringEntry_7F5D5+67r
		dw offset loc_7F641	; jump table for switch	statement
		dw offset loc_7F641
		dw offset loc_7F672
		dw offset loc_7F672
		dw offset loc_7F672
		dw offset loc_7F672

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Lexer_Advance.
; ==============================================================================================
Lexer_AdvanceWrapper_7F69C	proc far		; CODE XREF: VROOMM_StubThunk_6AE7AJ Cockpit_ProcessInputFrame_7F6EE+17Ep

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+138h]
		call	Lexer_Advance
		pop	cx
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_7F6BF
		push	si
		push	cs
		call	near ptr Expr_ResolveStringEntry_7F5D5
		pop	cx

loc_7F6BF:				; CODE XREF: Lexer_AdvanceWrapper_7F69C+1Bj
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_AdvanceWrapper_7F69C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Lexer_Rewind.
; ==============================================================================================
Lexer_RewindWrapper_7F6C5	proc far		; CODE XREF: VROOMM_StubThunk_6AE7FJ Cockpit_ProcessInputFrame_7F6EE+15Fp

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+138h]
		call	Lexer_Rewind
		pop	cx
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_7F6E8
		push	si
		push	cs

loc_7F6E4:
		call	near ptr Expr_ResolveStringEntry_7F5D5
		pop	cx

loc_7F6E8:				; CODE XREF: Lexer_RewindWrapper_7F6C5+1Bj
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_RewindWrapper_7F6C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 301 lignes, NON DÉTAILLÉE — combine Cockpit_PanAzimuthUpdate,
; Resource_AccessUnified, Mouse_InitAndRead, Config_ReadCalibration,
; Joystick_TestButtonMasked_67B6C — traitement combiné des entrées cockpit
; (souris/joystick/calibration).
; ==============================================================================================
Cockpit_ProcessInputFrame_7F6EE	proc far		; CODE XREF: VROOMM_StubThunk_6AE89J Lexer_LoadScriptFile_7F90F+A6p

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		mov	[bp+var_5], 0
		cmp	byte_721F0, 1
		jnz	short loc_7F720
		mov	ax, 5132h
		jmp	short loc_7F723
; ���������������������������������������������������������������������������

loc_7F720:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+2Bj
		mov	ax, word_721E0

loc_7F723:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+30j
		push	ax
		push	si
		push	cs
		call	near ptr GlyphObject_MeasureAndDraw_7F587
		add	sp, 4
		push	5130h

loc_7F72F:
		call	Resource_AccessUnified

loc_7F734:
		pop	cx

loc_7F735:
		xor	eax, eax

loc_7F738:
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax

loc_7F740:
		mov	[bp+var_A], 0
		mov	eax, dword_711CD

loc_7F74C:
		mov	[bp+var_E], eax

loc_7F750:
		call	Mouse_InitAndRead
		mov	[bp+var_F], 1
		jmp	loc_7F898	; default
; ���������������������������������������������������������������������������

loc_7F75C:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+1B9j
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_711CD
		ja	short loc_7F770
		mov	ax, 1
		jmp	short loc_7F772
; ���������������������������������������������������������������������������

loc_7F770:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+7Bj
		xor	ax, ax

loc_7F772:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+80j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F77B
		jmp	loc_7F898	; default
; ���������������������������������������������������������������������������

loc_7F77B:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+88j
		mov	[bp+var_A], 6
		mov	eax, dword_711CD
		mov	[bp+var_E], eax
		push	51E2h
		call	Config_ReadCalibration
		pop	cx
		mov	[bp+var_F], al
		cmp	word_72350, 4
		jnz	short loc_7F7B8
		push	1
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jz	short loc_7F7B8
		push	si
		push	cs
		call	near ptr Expr_ResolveStringEntry_7F5D5
		pop	cx
		mov	[bp+var_5], 1

loc_7F7B8:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+AEj
					; Cockpit_ProcessInputFrame_7F6EE+BEj
		cmp	word_72350, 3
		jnz	short loc_7F818
		push	1
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		mov	di, ax
		push	2
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		add	di, ax
		push	1
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	di, ax
		push	2
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	di, ax
		mov	[bp+var_14], di
		cmp	[bp+var_14], 4
		jnz	short loc_7F818
		push	si
		push	cs
		call	near ptr Expr_ResolveStringEntry_7F5D5
		pop	cx
		mov	[bp+var_5], 1

loc_7F818:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+CFj
					; Cockpit_ProcessInputFrame_7F6EE+11Ej
		call	Input_ReadAxis1Deadzone
		mov	dx, ax
		or	dx, dx
		jz	short loc_7F898	; default

loc_7F823:
		mov	[bp+var_12], dx

loc_7F826:				; switch 9 cases
		mov	cx, 9

loc_7F829:
		mov	bx, offset word_7F8EB

loc_7F82C:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+149j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_12]

loc_7F832:
		jz	short loc_7F83B
		add	bx, 2
		loop	loc_7F82C
		jmp	short loc_7F898	; default
; ���������������������������������������������������������������������������

loc_7F83B:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE:loc_7F832j
		jmp	word ptr cs:[bx+12h] ; switch jump

loc_7F83F:				; DATA XREF: ovr241:1A6Do
		push	si		; case 0x1
		push	cs

loc_7F841:
		call	near ptr Expr_ResolveStringEntry_7F5D5
		pop	cx

loc_7F845:
		mov	[bp+var_5], 1
		jmp	short loc_7F898	; default
; ���������������������������������������������������������������������������

loc_7F84B:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE:loc_7F83Bj
					; DATA XREF: ovr241:1A6Do
		push	si		; case 0x48
		push	cs
		call	near ptr Lexer_RewindWrapper_7F6C5
		pop	cx
		or	al, al

loc_7F853:				; default
		jz	short loc_7F898
		cmp	byte_721F0, 1
		jnz	short loc_7F861
		mov	ax, 5132h
		jmp	short loc_7F864
; ���������������������������������������������������������������������������

loc_7F861:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+16Cj
		mov	ax, word_721E0

loc_7F864:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+171j
		mov	[bp+var_14], ax
		push	ax
		jmp	short loc_7F887
; ���������������������������������������������������������������������������

loc_7F86A:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE:loc_7F83Bj
					; DATA XREF: ovr241:1A6Do
		push	si		; case 0x4D
		push	cs
		call	near ptr Lexer_AdvanceWrapper_7F69C
		pop	cx
		or	al, al
		jz	short loc_7F898	; default
		cmp	byte_721F0, 1
		jnz	short loc_7F880
		mov	ax, 5132h
		jmp	short loc_7F883
; ���������������������������������������������������������������������������

loc_7F880:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+18Bj
		mov	ax, word_721E0

loc_7F883:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+190j
		mov	[bp+var_16], ax
		push	ax

loc_7F887:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+17Aj
		push	si
		push	cs
		call	near ptr GlyphObject_MeasureAndDraw_7F587
		add	sp, 4
		push	5130h
		call	Resource_AccessUnified
		pop	cx

loc_7F898:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+6Bj
					; Cockpit_ProcessInputFrame_7F6EE+8Aj ...
		mov	al, [bp+var_5]	; default
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F8AA
		cmp	[bp+var_F], 0
		jz	short loc_7F8AA
		jmp	loc_7F75C
; ���������������������������������������������������������������������������

loc_7F8AA:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+1B1j
					; Cockpit_ProcessInputFrame_7F6EE+1B7j
		push	0
		cmp	byte_721F0, 1

loc_7F8B1:
		jnz	short loc_7F8B8

loc_7F8B3:
		mov	ax, 5132h

loc_7F8B6:
		jmp	short loc_7F8BB
; ���������������������������������������������������������������������������

loc_7F8B8:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE:loc_7F8B1j
		mov	ax, word_721E0

loc_7F8BB:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE:loc_7F8B6j
		push	ax
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		push	0
		cmp	byte_721F0, 1
		jnz	short loc_7F8DB
		mov	ax, 5132h
		jmp	short loc_7F8DE
; ���������������������������������������������������������������������������

loc_7F8DB:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+1E6j
		mov	ax, word_721E0

loc_7F8DE:				; CODE XREF: Cockpit_ProcessInputFrame_7F6EE+1EBj
		push	ax
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Cockpit_ProcessInputFrame_7F6EE	endp

; ���������������������������������������������������������������������������
word_7F8EB	dw	1,   1Ch,   31h,   39h ; DATA XREF: Cockpit_ProcessInputFrame_7F6EE:loc_7F829o
		dw    3Bh,   48h,   4Bh,   4Dh ; value table for switch	statement
		dw    50h
		dw offset loc_7F83F	; jump table for switch	statement
		dw offset loc_7F83F
		dw offset loc_7F83F
		dw offset loc_7F83F
		dw offset loc_7F83F
		dw offset loc_7F84B
		dw offset loc_7F84B
		dw offset loc_7F86A
		dw offset loc_7F86A

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 141 lignes, NON DÉTAILLÉE — combine Path_ResolveDataFile (seg057) et Lexer_NextToken
; — chargement d'un fichier script résolu par chemin.
; ==============================================================================================
Lexer_LoadScriptFile_7F90F	proc far		; CODE XREF: VROOMM_StubThunk_6AE43J

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp

loc_7F910:
		mov	bp, sp

loc_7F912:
		sub	sp, 50h
		push	si

loc_7F916:
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_7F92F
		push	146h

loc_7F920:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_7F92F

loc_7F92C:
		jmp	loc_7FA2D
; ���������������������������������������������������������������������������

loc_7F92F:				; CODE XREF: Lexer_LoadScriptFile_7F90F+Cj
					; Lexer_LoadScriptFile_7F90F+1Bj
		mov	ax, si
		add	ax, 14h

loc_7F934:
		mov	ax, si
		add	ax, 18h

loc_7F939:
		mov	ax, si

loc_7F93B:
		add	ax, 1Ch

loc_7F93E:
		mov	dword ptr [si+20h], 0
		mov	byte ptr [si+24h], 2
		mov	byte ptr [si+25h], 0
		mov	dword ptr [si+26h], 0
		mov	dword ptr [si+2Ah], 0
		mov	byte ptr [si+2Eh], 2
		mov	byte ptr [si+2Fh], 0
		mov	dword ptr [si+30h], 0
		mov	word ptr [si+34h], 0
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	offset aNavmap	; "NAVMAP"
		push	ds
		push	offset aCockpits ; "COCKPITS"
		lea	ax, [bp+var_50]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_50]
		push	ax
		push	si
		push	cs
		call	near ptr Font_LoadDefinitionFromIFF_7E1B4
		add	sp, 4
		mov	ax, word_706A0
		add	ax, 68h	; 'h'
		mov	[si+138h], ax
		push	word ptr [si+138h]
		call	Lexer_NextToken
		pop	cx
		push	si
		push	cs
		call	near ptr Expr_ResolveStringEntry_7F5D5
		pop	cx
		push	si
		push	cs
		call	near ptr Cockpit_ProcessInputFrame_7F6EE
		pop	cx
		cmp	byte ptr [si+25h], 0
		jz	short loc_7F9DF

loc_7F9BF:
		cmp	dword ptr [si+20h], 0
		jz	short loc_7F9DF
		push	0

loc_7F9C8:
		mov	al, [si+24h]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7F9DF:				; CODE XREF: Lexer_LoadScriptFile_7F90F+AEj
					; Lexer_LoadScriptFile_7F90F+B5j
		mov	dword ptr [si+20h], 0
		mov	byte ptr [si+25h], 0
		mov	dword ptr [si+26h], 0
		cmp	byte ptr [si+2Fh], 0
		jz	short loc_7FA19
		cmp	dword ptr [si+2Ah], 0
		jz	short loc_7FA19
		push	0
		mov	al, [si+2Eh]
		push	ax
		mov	ax, si
		add	ax, 2Ah	; '*'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7FA19:				; CODE XREF: Lexer_LoadScriptFile_7F90F+E8j
					; Lexer_LoadScriptFile_7F90F+EFj
		mov	dword ptr [si+2Ah], 0

loc_7FA21:
		mov	byte ptr [si+2Fh], 0

loc_7FA25:
		mov	dword ptr [si+30h], 0

loc_7FA2D:				; CODE XREF: Lexer_LoadScriptFile_7F90F:loc_7F92Cj
		mov	ax, si
		pop	si
		leave
		retf
Lexer_LoadScriptFile_7F90F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère 2 blocs typés (Memory_TypedFree_5C7B6 ×2, CRT_FreeNear_Wrap).
; ==============================================================================================
GlyphObject_ReleaseMultiple_7FA32	proc far		; CODE XREF: VROOMM_StubThunk_6AE48J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_7FA33:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_7FA3D:
		or	si, si

loc_7FA3F:
		jnz	short loc_7FA44

loc_7FA41:
		jmp	loc_7FADC
; ���������������������������������������������������������������������������

loc_7FA44:				; CODE XREF: GlyphObject_ReleaseMultiple_7FA32:loc_7FA3Fj
		cmp	word ptr [si+34h], 0

loc_7FA48:
		jz	short loc_7FA5B
		push	3
		push	word ptr [si+34h]

loc_7FA4F:
		mov	bx, [si+34h]
		mov	bx, [bx]

loc_7FA54:
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_7FA5B:				; CODE XREF: GlyphObject_ReleaseMultiple_7FA32:loc_7FA48j
		cmp	byte ptr [si+2Fh], 0
		jz	short loc_7FA81
		cmp	dword ptr [si+2Ah], 0
		jz	short loc_7FA81
		push	0
		mov	al, [si+2Eh]
		push	ax
		mov	ax, si
		add	ax, 2Ah	; '*'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7FA81:				; CODE XREF: GlyphObject_ReleaseMultiple_7FA32+2Dj
					; GlyphObject_ReleaseMultiple_7FA32+34j
		mov	dword ptr [si+2Ah], 0
		mov	byte ptr [si+2Fh], 0
		mov	dword ptr [si+30h], 0
		cmp	byte ptr [si+25h], 0
		jz	short loc_7FABB
		cmp	dword ptr [si+20h], 0
		jz	short loc_7FABB
		push	0
		mov	al, [si+24h]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_7FAB9:
		jmp	short $+2

loc_7FABB:				; CODE XREF: GlyphObject_ReleaseMultiple_7FA32+67j
					; GlyphObject_ReleaseMultiple_7FA32+6Ej
		mov	dword ptr [si+20h], 0
		mov	byte ptr [si+25h], 0
		mov	dword ptr [si+26h], 0
		test	di, 1
		jz	short loc_7FADC
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_7FADC:				; CODE XREF: GlyphObject_ReleaseMultiple_7FA32:loc_7FA41j
					; GlyphObject_ReleaseMultiple_7FA32+A1j
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ReleaseMultiple_7FA32	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GlyphObject_ScalarDeletingDtorA_6070E (seg162).
; ==============================================================================================
GlyphObject_DestructWrapper_7FAE0	proc far		; CODE XREF: VROOMM_StubThunk_6AE20J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7FB09
		push	0
		push	si
		call	GlyphObject_ScalarDeletingDtorA_6070E
		add	sp, 4
		test	di, 1
		jz	short loc_7FB09
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_7FB09:				; CODE XREF: GlyphObject_DestructWrapper_7FAE0+Dj
					; GlyphObject_DestructWrapper_7FAE0+1Ej
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_DestructWrapper_7FAE0	endp

ovr241		ends
