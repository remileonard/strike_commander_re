seg445		segment	para public 'OVERLAY' use16
		assume cs:seg445
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 123 lignes, NON DÉTAILLÉE — alloue (sub_658 ×2), initialise via
; GaugeWidget_Construct_A2DF0-style (sub_6C76C, stub voisin) — constructeur de variante
; supplémentaire du widget jauge.
; ==============================================================================================
GaugeWidgetVariantD_ConstructAndInit_A4270	proc far		; CODE XREF: VROOMM_StubThunk_6C9F0J

var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A4290
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_A4290
		jmp	loc_A4382
; ���������������������������������������������������������������������������

loc_A4290:				; CODE XREF: GaugeWidgetVariantD_ConstructAndInit_A4270+Dj
					; GaugeWidgetVariantD_ConstructAndInit_A4270+1Bj
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2EB6h
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+28h], 2
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		mov	ax, [bp+arg_E]
		mov	[si+20h], ax
		mov	ax, [bp+arg_C]
		mov	[si+1Eh], ax
		mov	di, [bp+arg_A]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+24h], eax
		mov	al, [bp+var_5]
		mov	[si+28h], al
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		mov	eax, [di+6]
		mov	[si+2Ah], eax
		mov	ax, [si+20h]
		imul	ax, 0Eh
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+22h], ax
		mov	di, [si+22h]

loc_A4313:
		lea	ax, [bp+arg_10]
		mov	[bp+var_8], ax
		jmp	short loc_A4378
; ���������������������������������������������������������������������������

loc_A431B:				; CODE XREF: GaugeWidgetVariantD_ConstructAndInit_A4270+110j
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]

loc_A4322:
		mov	ax, [bx-2]
		mov	[di], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+2],	ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+4],	ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+6],	ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+8],	ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+0Ah], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+0Ch], ax
		add	di, 0Eh

loc_A4378:				; CODE XREF: GaugeWidgetVariantD_ConstructAndInit_A4270+A9j
		mov	ax, [bp+arg_E]
		dec	[bp+arg_E]
		or	ax, ax
		jnz	short loc_A431B

loc_A4382:				; CODE XREF: GaugeWidgetVariantD_ConstructAndInit_A4270+1Dj
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
GaugeWidgetVariantD_ConstructAndInit_A4270	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 155 lignes, NON DÉTAILLÉE — combine le verrou d'ownership (seg442),
; Memory_TypedAllocDispatchB_5C832, Render_MeasureOrDrawTextString_61F52 (seg174),
; TextFormat_ApplyStyleAttribute_5E2D0 (×3), TextFormat_ReleaseStyleList_5E526 — dessin du
; widget avec étiquette de texte.
; ==============================================================================================
GaugeWidget_DrawWithLabel_A4388	proc far		; CODE XREF: VROOMM_StubThunk_6C9FAJ

var_16		= word ptr -16h
var_14		= word ptr -14h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	ax, [si+20h]
		mov	[bp+var_2], ax
		jmp	loc_A4487
; ���������������������������������������������������������������������������

loc_A43A3:				; CODE XREF: GaugeWidget_DrawWithLabel_A4388:loc_A4491j
		mov	ax, [bp+var_2]
		imul	ax, 0Eh
		mov	di, [si+22h]
		add	di, ax
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_A43BD
		push	word ptr [di+0Ah]
		jmp	short loc_A43C0
; ���������������������������������������������������������������������������

loc_A43BD:				; CODE XREF: GaugeWidget_DrawWithLabel_A4388+2Ej
		push	word ptr [di+8]

loc_A43C0:				; CODE XREF: GaugeWidget_DrawWithLabel_A4388+33j
		push	0
		mov	al, [si+28h]
		push	ax
		push	large dword ptr	[si+24h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+6]
		add	ax, [di+2]
		push	ax
		mov	ax, [si+4]
		add	ax, [di]
		push	ax
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	word ptr [di+0Ch], 0
		jnz	short loc_A43F9
		jmp	loc_A4487
; ���������������������������������������������������������������������������

loc_A43F9:				; CODE XREF: GaugeWidget_DrawWithLabel_A4388+6Cj
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di+2]
		mov	[bp+var_6], ax

loc_A4411:
		mov	bx, [si+1Eh]
		mov	ax, [bx]

loc_A4416:
		cmp	ax, [bp+var_2]
		jnz	short loc_A4421

loc_A441B:
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_A4421:				; CODE XREF: GaugeWidget_DrawWithLabel_A4388+91j
		mov	ax, word_6FEDC
		add	ax, 2
		mov	[bp+var_8], ax
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	si
		mov	ax, word_6FEDC
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	word_6FEDC
		push	word_6FE96
		push	word ptr [di+0Ch]
		push	[bp+var_6]
		push	[bp+var_4]
		call	VROOMM_StubThunk_6C884
		add	sp, 0Ah
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, word_6FEDC
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax

loc_A4481:
		call	TextFormat_ReleaseStyleList_5E526

loc_A4486:
		pop	cx

loc_A4487:				; CODE XREF: GaugeWidget_DrawWithLabel_A4388+18j
					; GaugeWidget_DrawWithLabel_A4388+6Ej
		mov	ax, [bp+var_2]

loc_A448A:
		dec	[bp+var_2]

loc_A448D:
		or	ax, ax

loc_A448F:
		jz	short loc_A4494

loc_A4491:
		jmp	loc_A43A3
; ���������������������������������������������������������������������������

loc_A4494:				; CODE XREF: GaugeWidget_DrawWithLabel_A4388:loc_A448Fj
		push	si

loc_A4495:
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawWithLabel_A4388	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, parcourt un tableau d'entrées (stride 14 octets, base +0x22, compteur +0x20) et teste
; si des coordonnées (arg_2,arg_4) tombent dans les bornes de chaque entrée — probable
; détection de survol/clic sur un élément du widget jauge (liste de zones cliquables).
; ==============================================================================================
GaugeWidget_HitTestEntries_A449F	proc far		; CODE XREF: VROOMM_StubThunk_6C9FFJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [si+20h]
		jmp	short loc_A44EF
; ���������������������������������������������������������������������������

loc_A44AC:				; CODE XREF: GaugeWidget_HitTestEntries_A449F+55j
		mov	ax, cx
		imul	ax, 0Eh
		mov	di, [si+22h]
		add	di, ax
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jge	short loc_A44DA
		add	ax, [di+4]
		cmp	ax, [bp+arg_2]
		jle	short loc_A44DA
		mov	ax, [di+2]
		cmp	ax, [bp+arg_4]
		jge	short loc_A44DA
		add	ax, [di+6]
		cmp	ax, [bp+arg_4]
		jle	short loc_A44DA
		mov	ax, 1
		jmp	short loc_A44DC
; ���������������������������������������������������������������������������

loc_A44DA:				; CODE XREF: GaugeWidget_HitTestEntries_A449F+1Cj
					; GaugeWidget_HitTestEntries_A449F+24j ...
		xor	ax, ax

loc_A44DC:				; CODE XREF: GaugeWidget_HitTestEntries_A449F+39j
		or	al, al
		jz	short loc_A44EF
		mov	ax, [di+0Ah]
		cmp	ax, [di+8]
		jz	short loc_A44EF
		mov	bx, [si+1Eh]
		mov	[bx], cx
		jmp	short loc_A44F6
; ���������������������������������������������������������������������������

loc_A44EF:				; CODE XREF: GaugeWidget_HitTestEntries_A449F+Bj
					; GaugeWidget_HitTestEntries_A449F+3Fj ...
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_A44AC

loc_A44F6:				; CODE XREF: GaugeWidget_HitTestEntries_A449F+4Ej
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_HitTestEntries_A449F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère les ressources du widget (sub_338, Memory_TypedFree_5C7B6,
; TextFormat_ReleaseStyleList_5E526, sub_338) — destructeur complet.
; ==============================================================================================
GaugeWidget_ReleaseAllResources_A44FA	proc far		; CODE XREF: VROOMM_StubThunk_6C9F5J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A456A
		mov	word ptr [si+0Eh], 2EB6h
		push	word ptr [si+22h]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+22h], 0
		cmp	byte ptr [si+29h], 0
		jz	short loc_A4542
		cmp	dword ptr [si+24h], 0
		jz	short loc_A4542
		push	0
		mov	al, [si+28h]
		push	ax
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_A4542:				; CODE XREF: GaugeWidget_ReleaseAllResources_A44FA+26j
					; GaugeWidget_ReleaseAllResources_A44FA+2Dj
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		push	si
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_A456A
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A456A:				; CODE XREF: GaugeWidget_ReleaseAllResources_A44FA+Dj
					; GaugeWidget_ReleaseAllResources_A44FA+67j
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseAllResources_A44FA	endp

seg445		ends
