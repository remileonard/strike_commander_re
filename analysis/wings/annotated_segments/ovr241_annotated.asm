ovr241		segment	para public 'OVERLAY' use16
		assume cs:ovr241
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantD_ConstructAndInit_B6700 (sub_B6700
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantD_ConstructAndInit_A4270 (sub_A4270
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 123 lignes, NON DÉTAILLÉE — alloue (sub_658 ×2), initialise via
; GaugeWidget_Construct_A2DF0-style (sub_6C76C, stub voisin) — constructeur de variante
; supplémentaire du widget jauge.
; ==============================================================================================
GaugeWidgetVariantD_ConstructAndInit_886A0		proc far

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
		jnz	short loc_886C0
		push	2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_886C0
		jmp	loc_887B2

loc_886C0:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 32D6h
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
		jmp	short loc_887A8

loc_8874B:
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

loc_887A8:
		mov	ax, [bp+arg_E]
		dec	[bp+arg_E]
		or	ax, ax
		jnz	short loc_8874B

loc_887B2:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
GaugeWidgetVariantD_ConstructAndInit_886A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_887B8		proc far

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
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	ax, [si+20h]
		mov	[bp+var_2], ax
		jmp	loc_888CB

loc_887D3:
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Eh
		mov	di, [si+22h]
		add	di, ax
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_8880A
		push	word ptr [di+0Ah]
		cmp	byte ptr [si+28h], 3
		jnz	short loc_88813

loc_887F1:
		push	0
		mov	al, [si+28h]
		push	ax
		push	large [si+24h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_88819
		jmp	short loc_88813

loc_8880A:
		push	word ptr [di+8]
		cmp	byte ptr [si+28h], 3
		jz	short loc_887F1

loc_88813:
		mov	dx, [si+26h]
		mov	ax, [si+24h]

loc_88819:
		push	dx
		push	ax
		mov	ax, [si+6]
		add	ax, [di+2]
		push	ax
		mov	ax, [si+4]
		add	ax, [di]
		push	ax
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		cmp	word ptr [di+0Ch], 0
		jnz	short loc_8883D
		jmp	loc_888CB

loc_8883D:
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
		jnz	short loc_88865
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_88865:
		mov	ax, word_5BF74
		add	ax, 2
		mov	[bp+var_8], ax
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	si
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	word_5BF74
		push	word_5BF22
		push	word ptr [di+0Ch]
		push	[bp+var_6]
		push	[bp+var_4]
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx

loc_888CB:
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jz	short loc_888D8
		jmp	loc_887D3

loc_888D8:
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_887B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_HitTestEntries_B692F (sub_B692F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; GaugeWidget_HitTestEntries_A449F (sub_A449F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, parcourt un tableau d'entrées (stride 14
; octets, base +0x22, compteur +0x20) et teste si des coordonnées (arg_2,arg_4) tombent dans
; les bornes de chaque entrée — probable détection de survol/clic sur un élément du widget
; jauge (liste de zones cliquables).
; ==============================================================================================
GaugeWidget_HitTestEntries_888E3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [si+20h]
		jmp	short loc_88933

loc_888F0:
		mov	ax, cx
		imul	ax, ax, 0Eh
		mov	di, [si+22h]
		add	di, ax
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jge	short loc_8891E
		add	ax, [di+4]
		cmp	ax, [bp+arg_2]
		jle	short loc_8891E
		mov	ax, [di+2]
		cmp	ax, [bp+arg_4]
		jge	short loc_8891E
		add	ax, [di+6]
		cmp	ax, [bp+arg_4]
		jle	short loc_8891E
		mov	ax, 1
		jmp	short loc_88920

loc_8891E:
		xor	ax, ax

loc_88920:
		or	al, al
		jz	short loc_88933
		mov	ax, [di+0Ah]
		cmp	ax, [di+8]
		jz	short loc_88933
		mov	bx, [si+1Eh]
		mov	[bx], cx
		jmp	short loc_8893A

loc_88933:
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_888F0

loc_8893A:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_HitTestEntries_888E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ReleaseAllResources_B698A (sub_B698A de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ReleaseAllResources_A44FA (sub_A44FA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère les ressources du widget (sub_338, Memory_TypedFree_5C7B6,
; TextFormat_ReleaseStyleList_5E526, sub_338) — destructeur complet.
; ==============================================================================================
GaugeWidget_ReleaseAllResources_8893E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_889AE
		mov	word ptr [si+0Eh], 32D6h
		push	word ptr [si+22h]
		call	sub_33B
		pop	cx
		mov	word ptr [si+22h], 0
		cmp	byte ptr [si+29h], 0
		jz	short loc_88986
		cmp	dword ptr [si+24h], 0
		jz	short loc_88986
		push	0
		mov	al, [si+28h]
		push	ax
		mov	ax, si
		add	ax, 24h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_88986

loc_88986:
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_889AE
		push	si
		call	sub_33B
		pop	cx

loc_889AE:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseAllResources_8893E		endp
ovr241		ends
