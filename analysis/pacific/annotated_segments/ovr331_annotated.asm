ovr331		segment	para public 'OVERLAY' use16
		assume cs:ovr331
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantD_ConstructAndInit_A4270 (sub_A4270
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 123 lignes, NON DÉTAILLÉE — alloue (sub_658 ×2), initialise via
; GaugeWidget_Construct_A2DF0-style (sub_6C76C, stub voisin) — constructeur de variante
; supplémentaire du widget jauge.
; ==============================================================================================
GaugeWidgetVariantD_ConstructAndInit_B6700		proc far

var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= dword ptr -4
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
		jnz	short loc_B6720
		push	2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B6720
		jmp	loc_B6812

loc_B6720:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2BBCh
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
		imul	ax, ax, 0Eh
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+22h], ax
		mov	di, [si+22h]
		lea	ax, [bp+arg_10]
		mov	[bp+var_8], ax
		jmp	short loc_B6808

loc_B67AB:
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+2], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+4], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+6], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+8], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+0Ah], ax
		add	[bp+var_8], 2
		mov	bx, [bp+var_8]
		mov	ax, [bx-2]
		mov	[di+0Ch], ax
		add	di, 0Eh

loc_B6808:
		mov	ax, [bp+arg_E]
		dec	[bp+arg_E]
		or	ax, ax
		jnz	short loc_B67AB

loc_B6812:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
GaugeWidgetVariantD_ConstructAndInit_B6700		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_DrawWithLabel_A4388 (sub_A4388 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 155 lignes, NON DÉTAILLÉE — combine le verrou d'ownership (seg442),
; Memory_TypedAllocDispatchB_5C832, Shape_DrawSpans_61F52 (seg174),
; TextFormat_ApplyStyleAttribute_5E2D0 (×3), TextFormat_ReleaseStyleList_5E526 — dessin du
; widget avec étiquette de texte.
; ==============================================================================================
GaugeWidget_DrawWithLabel_B6818		proc far

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
		call	sub_74AD7
		pop	cx
		mov	ax, [si+20h]
		mov	[bp+var_2], ax
		jmp	loc_B6917

loc_B6833:
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Eh
		mov	di, [si+22h]
		add	di, ax
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_B684D
		push	word ptr [di+0Ah]
		jmp	short loc_B6850

loc_B684D:
		push	word ptr [di+8]

loc_B6850:
		push	0
		mov	al, [si+28h]
		push	ax
		push	large [si+24h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+6]
		add	ax, [di+2]
		push	ax
		mov	ax, [si+4]
		add	ax, [di]
		push	ax
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		cmp	word ptr [di+0Ch], 0
		jnz	short loc_B6889
		jmp	loc_B6917

loc_B6889:
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di+2]
		mov	[bp+var_6], ax
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_B68B1
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_B68B1:
		mov	ax, word_79260
		add	ax, 2
		mov	[bp+var_8], ax
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	word_79260
		push	word_7921A
		push	word ptr [di+0Ch]
		push	[bp+var_6]
		push	[bp+var_4]
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx

loc_B6917:
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jz	short loc_B6924
		jmp	loc_B6833

loc_B6924:
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawWithLabel_B6818		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_HitTestEntries_A449F (sub_A449F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; parcourt un tableau d'entrées (stride 14 octets, base +0x22, compteur +0x20) et teste si des
; coordonnées (arg_2,arg_4) tombent dans les bornes de chaque entrée — probable détection de
; survol/clic sur un élément du widget jauge (liste de zones cliquables).
; ==============================================================================================
GaugeWidget_HitTestEntries_B692F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [si+20h]
		jmp	short loc_B697F

loc_B693C:
		mov	ax, cx
		imul	ax, ax, 0Eh
		mov	di, [si+22h]
		add	di, ax
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jge	short loc_B696A
		add	ax, [di+4]
		cmp	ax, [bp+arg_2]
		jle	short loc_B696A
		mov	ax, [di+2]
		cmp	ax, [bp+arg_4]
		jge	short loc_B696A
		add	ax, [di+6]
		cmp	ax, [bp+arg_4]
		jle	short loc_B696A
		mov	ax, 1
		jmp	short loc_B696C

loc_B696A:
		xor	ax, ax

loc_B696C:
		or	al, al
		jz	short loc_B697F
		mov	ax, [di+0Ah]
		cmp	ax, [di+8]
		jz	short loc_B697F
		mov	bx, [si+1Eh]
		mov	[bx], cx
		jmp	short loc_B6986

loc_B697F:
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_B693C

loc_B6986:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_HitTestEntries_B692F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ReleaseAllResources_A44FA (sub_A44FA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère les ressources du widget (sub_338, Memory_TypedFree_5C7B6,
; TextFormat_ReleaseStyleList_5E526, sub_338) — destructeur complet.
; ==============================================================================================
GaugeWidget_ReleaseAllResources_B698A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B69FA
		mov	word ptr [si+0Eh], 2BBCh
		push	word ptr [si+22h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+22h], 0
		cmp	byte ptr [si+29h], 0
		jz	short loc_B69D2
		cmp	dword ptr [si+24h], 0
		jz	short loc_B69D2
		push	0
		mov	al, [si+28h]
		push	ax
		mov	ax, si
		add	ax, 24h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_B69D2

loc_B69D2:
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_B69FA
		push	si
		call	sub_3B2
		pop	cx

loc_B69FA:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseAllResources_B698A		endp
ovr331		ends
