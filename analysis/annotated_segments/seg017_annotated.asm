seg017		segment	byte public 'CODE' use16
		assume cs:seg017
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,26L — si flag +0x20 actif, appelle sub_5E576 sur deux sous-champs (+4,+0x12) : mise à
; jour conditionnelle d'un widget UI (2 sous-composants, ex: curseur + valeur).
; ==============================================================================================
UI_UpdateWidgetPair	proc far		; CODE XREF: seg017:00E0p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_1689B:				; DATA XREF: seg216:off_69F26o
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_168B9
		mov	ax, si
		add	ax, 4
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4

loc_168B9:				; CODE XREF: UI_UpdateWidgetPair+Bj
		pop	si
		pop	bp
		retf
UI_UpdateWidgetPair	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — positionne deux éléments de texte (sub_5E329) à des décalages dérivés de +2 :
; positionnement de deux libellés d'un widget de liste/menu.
; ==============================================================================================
UI_PositionListLabels	proc far		; CODE XREF: Subtitle_WidgetInit+1CP
					; UI_PositionListLabelsWrapper_85DB3+7P	...

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
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		mov	ax, [si+2]
		add	ax, 2
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		pop	si
		pop	bp
		retf
UI_PositionListLabels	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,34L — itère une collection via sub_5F6A9, appelle vtable[8] sur chaque élément :
; notification/rafraîchissement de tous les éléments d'une liste UI (ex: repaint).
; ==============================================================================================
UI_NotifyListRepaint	proc far		; CODE XREF: seg015:0AF4P

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_16910
; ���������������������������������������������������������������������������

loc_16901:				; CODE XREF: UI_NotifyListRepaint+2Fj
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx

loc_16910:				; CODE XREF: UI_NotifyListRepaint+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_16901
		pop	si
		leave
		retf
UI_NotifyListRepaint	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — identique à sub_168F0 mais appelle vtable[0xC] : variante de notification de liste
; UI (autre événement, ex: sélection/fermeture).
; ==============================================================================================
UI_NotifyListEvent	proc far		; CODE XREF: seg015:0181P

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]

loc_1692E:
		mov	[bp+var_2], 0

loc_16933:
		jmp	short loc_16944
; ���������������������������������������������������������������������������

loc_16935:				; CODE XREF: UI_NotifyListEvent:loc_16953j
		mov	bx, [bp+var_2]

loc_16938:
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]

loc_16943:
		pop	cx

loc_16944:				; CODE XREF: UI_NotifyListEvent:loc_16933j
		lea	ax, [bp+var_2]
		push	ax
		push	si

loc_16949:
		call	LinkedListB_Helper_5F6A9

loc_1694E:
		add	sp, 4

loc_16951:
		or	ax, ax

loc_16953:
		jnz	short loc_16935
		pop	si
		leave

locret_16957:
		retf
UI_NotifyListEvent	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_16974
; ���������������������������������������������������������������������������

loc_16969:				; CODE XREF: seg017:00F3j
		mov	bx, [bp-2]
		push	word ptr [bx+4]
		push	cs
		call	near ptr UI_UpdateWidgetPair
		pop	cx

loc_16974:				; CODE XREF: seg017:00D7j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9

loc_1697E:
		add	sp, 4
		or	ax, ax
		jnz	short loc_16969
		pop	si
		leave
		retf
seg017		ends
