seg033		segment	para public 'CODE' use16
		assume cs:seg033
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17924		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_17924		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. Méthode +24 des instruments : vue 0 → centre (+3Ch) = premier point
; (+34h), cadre (+8, +16h) = premier cadre (+2Ch…), actif (+20h) = 1 ; vue 1 → si le second
; cadre existe (+24h ≠ 65 535) : centre = second point (+38h), cadre = second cadre, actif = 1
; ; sinon actif = 0.
; ==============================================================================================
CockpitInstrument_SelectView_1792C		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
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
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	al, al
		jnz	short loc_179AB
		mov	eax, [si+34h]
		mov	[si+3Ch], eax
		mov	ax, [si+2Ch]
		mov	[bp+var_2], ax
		mov	ax, [si+2Eh]
		mov	[bp+var_4], ax
		mov	ax, [si+30h]
		mov	[bp+var_6], ax
		mov	ax, [si+32h]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+8], ax
		mov	ax, [bp+var_4]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_6]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_8]
		mov	[si+0Eh], ax
		mov	ax, [si+2Ch]
		mov	[bp+var_A], ax
		mov	ax, [si+2Eh]
		mov	[bp+var_C], ax
		mov	ax, [si+30h]
		mov	[bp+var_E], ax
		mov	ax, [si+32h]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+16h], ax
		mov	ax, [bp+var_C]
		mov	[si+18h], ax
		mov	ax, [bp+var_E]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_10]

loc_179A2:
		mov	[si+1Ch], ax
		mov	byte ptr [si+20h], 1
		jmp	short loc_17A20

loc_179AB:
		cmp	al, 1
		jnz	short loc_17A1C
		cmp	word ptr [si+24h], 0FFFFh
		jz	short loc_17A1C
		mov	eax, [si+38h]
		mov	[si+3Ch], eax
		mov	ax, [si+24h]
		mov	[bp+var_12], ax
		mov	ax, [si+26h]
		mov	[bp+var_14], ax
		mov	ax, [si+28h]
		mov	[bp+var_16], ax
		mov	ax, [si+2Ah]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_12]
		mov	[si+8], ax
		mov	ax, [bp+var_14]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_16]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_18]
		mov	[si+0Eh], ax
		mov	ax, [si+24h]
		mov	[bp+var_1A], ax
		mov	ax, [si+26h]
		mov	[bp+var_1C], ax
		mov	ax, [si+28h]
		mov	[bp+var_1E], ax
		mov	ax, [si+2Ah]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_1A]
		mov	[si+16h], ax
		mov	ax, [bp+var_1C]
		mov	[si+18h], ax
		mov	ax, [bp+var_1E]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_20]
		jmp	short loc_179A2

loc_17A1C:
		mov	byte ptr [si+20h], 0

loc_17A20:
		pop	si
		leave
		retf
CockpitInstrument_SelectView_1792C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à UI_UpdateWidgetPair
; (sub_16898 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,26L — si flag +0x20 actif, appelle sub_5E576 sur deux sous-champs (+4,+0x12) :
; mise à jour conditionnelle d'un widget UI (2 sous-composants, ex: curseur + valeur).
; ==============================================================================================
UI_UpdateWidgetPair		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_17A44
		mov	ax, si
		add	ax, 4
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_17A44:
		pop	si
		pop	bp
		retf
UI_UpdateWidgetPair		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à UI_PositionListLabels
; (sub_168BC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,29L — positionne deux éléments de texte (sub_5E329) à des décalages dérivés de +2
; : positionnement de deux libellés d'un widget de liste/menu.
; ==============================================================================================
UI_PositionListLabels		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	TextFormat_ApplyStyleAttributeB_67C9A
		add	sp, 4
		mov	ax, [si+2]
		add	ax, 2
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	TextFormat_ApplyStyleAttributeB_67C9A
		add	sp, 4
		pop	si
		pop	bp
		retf
UI_PositionListLabels		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17A7B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_7CADA
		cmp	dword ptr [bx+5Ah], 0
		jz	short loc_17AA2
		push	large [bx+5Ah]
		les	bx, [bx+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_17AA6

loc_17AA2:
		xor	dx, dx
		xor	ax, ax

loc_17AA6:
		mov	word_7C886, dx
		mov	word_7C884, ax
		mov	[bp+var_2], 0
		jmp	short loc_17AC3

loc_17AB4:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_17AC3:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_17AB4
		pop	si
		leave
		retf
sub_17A7B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17AD7		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_17B0F
		mov	ax, word_7AF7C
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	0EFh
		push	word_77535
		call	sub_75D09
		add	sp, 4

loc_17B0F:
		mov	[bp+var_4], 0
		jmp	short loc_17B25

loc_17B16:
		mov	bx, [bp+var_4]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		pop	cx

loc_17B25:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_17B16
		pop	si
		leave
		retf
sub_17AD7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17B39		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_17B55

loc_17B4A:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		push	cs
		call	near ptr UI_UpdateWidgetPair
		pop	cx

loc_17B55:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_17B4A
		pop	si
		leave
		retf
sub_17B39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17B69		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_17B92

loc_17B7A:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	ax
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 4

loc_17B92:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_17B7A
		pop	si
		leave
		retf
sub_17B69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17BA6		proc far

var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_17BCF

loc_17BB7:
		mov	al, [bp+arg_2]
		mov	[bp+var_4], al
		push	ax
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4

loc_17BCF:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_17BB7
sub_17BA6		endp
seg033		ends
