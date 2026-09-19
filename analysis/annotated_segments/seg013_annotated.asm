seg013		segment	byte public 'CODE' use16
		assume cs:seg013
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,25L — wrapper d'appel à sub_6AF02 avec position/dimensions d'un rectangle
; (structure+0x10) et 3 paramètres : primitive de dessin (rectangle/zone UI).
; ==============================================================================================
UI_DrawRect	proc far		; CODE XREF: Text_TypewriterFrame+B3p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp

loc_144E8:				; DATA XREF: seg216:0126o
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		call	VROOMM_StubThunk_6AF02
		add	sp, 0Ch
		pop	bp
		retf
UI_DrawRect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,195L — sélectionne une chaîne (structure+0/+2) selon un flag, effectue un rendu de texte
; multi-paramètres : routine de rendu de texte formaté (UI/briefing).
; ==============================================================================================
UI_RenderFormattedText	proc far		; CODE XREF: Audio_LoadSpeechClip+F6P
					; CombatTarget_WeaponActionSubsystem+21DP

var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh
arg_C		= byte ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	di, [bp+arg_6]
		cmp	[bp+arg_E], 0
		jnz	short loc_14524
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		jmp	short loc_1452B
; ���������������������������������������������������������������������������

loc_14524:				; CODE XREF: UI_RenderFormattedText+Fj
		les	bx, [bp+arg_0]
		mov	si, es:[bx+2]

loc_1452B:				; CODE XREF: UI_RenderFormattedText+17j
		or	si, si
		jnz	short loc_14532
		jmp	loc_146A4
; ���������������������������������������������������������������������������

loc_14532:				; CODE XREF: UI_RenderFormattedText+22j
		cmp	[bp+arg_C], 0
		jz	short loc_145AE
		push	large [bp+arg_8]
		push	si
		call	VROOMM_StubThunk_6AEFD
		add	sp, 6
		mov	[bp+var_4], ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AEE9
		add	sp, 6
		mov	[bp+var_6], ax
		mov	[bp+var_C], ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp+var_10]
		sub	ax, [bp+var_14]
		inc	ax
		mov	bx, word_70E62
		mov	dx, [bx+8]
		sub	dx, [bx+4]
		inc	dx
		sub	dx, ax
		shr	dx, 1
		mov	[bp+var_2], dx
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, [bp+var_4]
		sar	ax, 1
		jmp	short loc_145DF
; ���������������������������������������������������������������������������

loc_145AE:				; CODE XREF: UI_RenderFormattedText+2Bj
		mov	bx, word_70E62
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		mov	[bp+var_4], ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AEE9
		add	sp, 6
		mov	[bp+var_6], ax
		mov	[bp+var_2], 0
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_2]
		add	ax, es:[bx+98h]
		add	ax, 2

loc_145DF:				; CODE XREF: UI_RenderFormattedText+A1j
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_16], ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_16]
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	cx, [bp+var_18]
		sub	cx, [bp+var_1C]
		inc	cx
		mov	ax, di
		add	ax, cx
		dec	ax
		mov	bx, word_70E62
		cmp	ax, [bx+0Ah]
		jle	short loc_1462F
		mov	di, [bx+0Ah]
		inc	di
		sub	di, cx

loc_1462F:				; CODE XREF: UI_RenderFormattedText+11Cj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		shl	ax, 1
		mov	dx, cx
		sub	dx, ax
		sub	dx, [si+17h]
		shr	dx, 1
		mov	ax, di
		add	ax, es:[bx+9Ah]
		add	ax, dx
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_22], ax
		mov	[bp+var_24], di
		mov	ax, [bp+var_6]
		mov	[bp+var_26], ax
		push	ax
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_24]
		push	[bp+var_22]
		push	[bp+var_20]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	large [bp+arg_8]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+arg_4]
		push	si
		call	VROOMM_StubThunk_6AF02
		add	sp, 0Ch

loc_146A4:				; CODE XREF: UI_RenderFormattedText+24j
		pop	di
		pop	si
		leave
		retf
UI_RenderFormattedText	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,25L — timer d'animation : avance un compteur (+0xA5) de dword_70458 (delta-temps) ; si
; dépasse une limite (+0xA1), réinitialise et positionne un flag 'terminé' (+0xAD) : minuteur
; d'effet d'animation de texte (type machine à écrire).
; ==============================================================================================
Text_TypewriterTimer	proc far		; CODE XREF: CombatTarget_WeaponActionSubsystem+485P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_146E9
		mov	eax, dword_70458
		add	es:[bx+0A5h], eax
		mov	eax, es:[bx+0A5h]
		cmp	eax, es:[bx+0A1h]
		jle	short loc_146E9
		mov	byte ptr es:[bx+0A0h], 0
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		mov	es:[bx+0A5h], eax
		mov	byte ptr es:[bx+0ADh], 1

loc_146E9:				; CODE XREF: Text_TypewriterTimer+Cj
					; Text_TypewriterTimer+24j
		pop	bp
		retf
Text_TypewriterTimer	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,70L — met à jour la position d'affichage du texte (+0x9C/+0x94), recherche le glyphe via
; sub_5C832 (police), le dessine (sub_5E74E), avance le curseur : rendu caractère par
; caractère (moteur de texte 'machine à écrire').
; ==============================================================================================
Text_TypewriterDrawChar	proc far		; CODE XREF: TextScroll_DrawTypewriterFrame_87457+8DP
					; TextScroll_DrawTypewriterFrameB_8781A+21P ...

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+9Ch], ax
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_14707
		jmp	locret_14793
; ���������������������������������������������������������������������������

loc_14707:				; CODE XREF: Text_TypewriterDrawChar+17j
		mov	ax, es:[bx+9Ch]
		mov	es:[bx+94h], ax
		mov	bx, es:[bx+0A9h]
		mov	[bx+6],	ax
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_2], ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6],	ax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax

locret_14793:				; CODE XREF: Text_TypewriterDrawChar+19j
		leave
		retf
Text_TypewriterDrawChar	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,84L — si l'animation n'est pas terminée (+0xA0 et +0xAD), positionne le curseur texte
; (sub_5E329), recherche le glyphe (sub_5C832) et le dessine (sub_61F52) : frame de rendu du
; texte animé (briefing/dialogue), variante de sub_146EB.
; ==============================================================================================
Text_TypewriterFrame	proc far		; CODE XREF: seg015:01ABP seg015:01DFP ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_147A9
		jmp	loc_1484E
; ���������������������������������������������������������������������������

loc_147A9:				; CODE XREF: Text_TypewriterFrame+Fj
		mov	al, es:[bx+0ADh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_147B7
		jmp	loc_1484E
; ���������������������������������������������������������������������������

loc_147B7:				; CODE XREF: Text_TypewriterFrame+1Dj
		push	[bp+arg_4]
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0ABh]
		mov	[bp+var_2], ax
		mov	ax, es:[bx+92h]
		mov	[bp+var_4], ax
		mov	ax, es:[bx+94h]
		mov	[bp+var_6], ax
		mov	ax, es:[bx+96h]
		mov	[bp+var_8], ax
		push	ax
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	bx, word_70E62
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		les	bx, [bp+arg_0]
		sub	ax, es:[bx+90h]
		shr	ax, 1
		mov	[bp+var_A], ax
		mov	ax, es:[bx+94h]
		add	ax, es:[bx+9Eh]
		mov	[bp+var_C], ax
		push	ax
		push	[bp+var_A]
		push	word ptr es:[bx+0ABh]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr UI_DrawRect
		add	sp, 0Ah

loc_1484E:				; CODE XREF: Text_TypewriterFrame+11j
					; Text_TypewriterFrame+1Fj
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		leave
		retf
Text_TypewriterFrame	endp

seg013		ends
