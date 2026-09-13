seg028		segment	byte public 'CODE' use16
		assume cs:seg028
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,16L — accesseur chaîné (+4→+0x19→+0x20→+2) : getter d'une propriété imbriquée
; (largeur/valeur d'un widget).
; ==============================================================================================
Widget_GetNestedPropA	proc far		; CODE XREF: seg016:04BCP seg030:00A8P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+4]
		mov	bx, [bx+19h]
		mov	bx, [bx+20h]
		mov	ax, [bx+2]
		pop	si
		pop	bp
		retf
Widget_GetNestedPropA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,17L — accesseur chaîné (+4→+0x19→+0x1E) : getter d'une propriété imbriquée (variante).
; ==============================================================================================
Widget_GetNestedPropB	proc far		; CODE XREF: seg030:0B8BP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+4]
		mov	bx, [bx+19h]
		mov	ax, [bx+1Eh]
		pop	si
		pop	bp

locret_1C581:
		retf
Widget_GetNestedPropB	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	bx, [si+4]
		mov	ax, [bx+19h]
		add	ax, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+37h], 0
		jz	short loc_1C5BF
		push	0D9h ; '�'
		push	word ptr [si+41h]
		push	word ptr [si+3Fh]
		push	word ptr [si+3Dh]
		push	word ptr [si+3Bh]
		mov	ax, si
		add	ax, 29h	; ')'
		push	ax
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch

loc_1C5BF:				; CODE XREF: seg028:0050j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,19L — appelle vtable[0xC] sur un objet référencé (+0x43) : notification (draw) d'un
; composant délégué.
; ==============================================================================================
Widget_NotifyDelegate	proc far		; CODE XREF: Widget_MainHandler+196p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+43h]
		mov	bx, [si+43h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		pop	si
		pop	bp

locret_1C5D7:
		retf
Widget_NotifyDelegate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — si le flag +0x37 est actif, formate une valeur (sub_5D999/sub_5D9D3, style
; tooltip), notifie l'affichage (vtable[0x10]/[0xC] sur +0x43/+0x39) : rendu conditionnel
; d'une info-bulle/tooltip sur un widget.
; ==============================================================================================
Widget_DrawTooltip	proc far		; CODE XREF: List_RefreshAllTooltips+1Fp

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_1C5DF:
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+37h], 0
		jz	short loc_1C637
		mov	ax, si
		add	ax, 29h	; ')'
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		push	0D9h ; '�'
		push	word_70E60

loc_1C601:
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		push	word ptr [si+43h]
		mov	bx, [si+43h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		pop	cx
		push	word ptr [si+2Fh]
		push	word ptr [si+2Dh]
		push	word ptr [si+39h]
		mov	bx, [si+39h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 6
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4

loc_1C637:				; CODE XREF: Widget_DrawTooltip+Ej
		pop	si
		leave
		retf
Widget_DrawTooltip	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,26L — formate un message via sub_2945 (sprintf, format fixe 0xDEA) puis l'assigne à un
; widget (sub_60DD1) : mise à jour du libellé d'un widget avec un message formaté.
; ==============================================================================================
Widget_SetLabelFormatted	proc far		; CODE XREF: seg030:1083P seg034:0103P ...

var_14		= word ptr -14h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	0DEAh
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_14]
		push	ax
		push	si
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		pop	si
		leave
		retf
Widget_SetLabelFormatted	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — copie une chaîne (sub_2DF4) puis l'assigne à un widget (sub_60DD1) : mise à jour
; du libellé d'un widget avec une chaîne brute.
; ==============================================================================================
Widget_SetLabelRaw	proc far		; CODE XREF: seg016:05E7P seg016:0631P ...

var_80		= word ptr -80h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		call	CRT_MemFamily_Extra5

loc_1C680:
		add	sp, 8
		lea	ax, [bp+var_80]
		push	ax
		push	si
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		pop	si
		leave
		retf
Widget_SetLabelRaw	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — parcourt un tableau de descripteurs de 0x48 octets (+0x20, compteur +0xB0),
; cherche celui dont le code (+0x38) correspond et dont le flag (+0x37) est actif : recherche
; d'un élément actif dans une liste par code (menu/onglet).
; ==============================================================================================
List_FindActiveByCode	proc far		; CODE XREF: UIWidget_FindActiveByCode_8D284+29P

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp

loc_1C694:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 20h	; ' '
		xor	dx, dx
		jmp	short loc_1C6BA
; ���������������������������������������������������������������������������

loc_1C6A4:				; CODE XREF: List_FindActiveByCode+2Bj
		mov	al, [di+38h]
		cmp	al, [bp+arg_2]
		jnz	short loc_1C6B6
		cmp	byte ptr [di+37h], 0
		jz	short loc_1C6B6
		mov	ax, di
		jmp	short loc_1C6C2
; ���������������������������������������������������������������������������

loc_1C6B6:				; CODE XREF: List_FindActiveByCode+17j
					; List_FindActiveByCode+1Dj
		inc	dx
		add	di, 48h	; 'H'

loc_1C6BA:				; CODE XREF: List_FindActiveByCode+Fj
		cmp	[si+0B0h], dx
		jg	short loc_1C6A4
		xor	ax, ax

loc_1C6C2:				; CODE XREF: List_FindActiveByCode+21j
		pop	di
		pop	si
		pop	bp
		retf
List_FindActiveByCode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,297L — grosse fonction du même cluster de widgets (tableau +0x20/0x48 octets par entrée)
; — candidat pour le gestionnaire principal d'un widget composite (liste déroulante/menu à
; onglets), à approfondir.
; ==============================================================================================
Widget_MainHandler	proc far		; CODE XREF: seg015:0B00P

var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_1C6D1:
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, word_6E46F
		jz	short loc_1C6E3

loc_1C6DC:
		mov	al, byte_722D1
		mov	ah, 0
		jmp	short loc_1C6E5
; ���������������������������������������������������������������������������

loc_1C6E3:				; CODE XREF: Widget_MainHandler+14j
		xor	ax, ax

loc_1C6E5:				; CODE XREF: Widget_MainHandler+1Bj
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_1C6F1
		jmp	loc_1C848
; ���������������������������������������������������������������������������

loc_1C6F1:				; CODE XREF: Widget_MainHandler+26j
		cmp	byte_722D0, 1
		jnz	short loc_1C737
		test	byte_722D3, 0C0h
		jz	short loc_1C704
		mov	ax, 1
		jmp	short loc_1C706
; ���������������������������������������������������������������������������

loc_1C704:				; CODE XREF: Widget_MainHandler+37j
		xor	ax, ax

loc_1C706:				; CODE XREF: Widget_MainHandler+3Cj
		or	al, al
		jnz	short loc_1C72E
		test	byte_722D3, 30h
		jz	short loc_1C716
		mov	ax, 1
		jmp	short loc_1C718
; ���������������������������������������������������������������������������

loc_1C716:				; CODE XREF: Widget_MainHandler+49j
		xor	ax, ax

loc_1C718:				; CODE XREF: Widget_MainHandler+4Ej
		or	al, al
		jnz	short loc_1C72E
		test	byte_722D3, 0Ch
		jz	short loc_1C728
		mov	ax, 1
		jmp	short loc_1C72A
; ���������������������������������������������������������������������������

loc_1C728:				; CODE XREF: Widget_MainHandler+5Bj
		xor	ax, ax

loc_1C72A:				; CODE XREF: Widget_MainHandler+60j
		or	al, al
		jz	short loc_1C733

loc_1C72E:				; CODE XREF: Widget_MainHandler+42j
					; Widget_MainHandler+54j
		mov	ax, 1
		jmp	short loc_1C735
; ���������������������������������������������������������������������������

loc_1C733:				; CODE XREF: Widget_MainHandler+66j
		xor	ax, ax

loc_1C735:				; CODE XREF: Widget_MainHandler+6Bj
		jmp	short loc_1C789
; ���������������������������������������������������������������������������

loc_1C737:				; CODE XREF: Widget_MainHandler+30j
		cmp	byte_72DE5, 1
		jz	short loc_1C745
		cmp	byte_72E1D, 1
		jnz	short loc_1C74A

loc_1C745:				; CODE XREF: Widget_MainHandler+76j
		mov	ax, 1
		jmp	short loc_1C74C
; ���������������������������������������������������������������������������

loc_1C74A:				; CODE XREF: Widget_MainHandler+7Dj
		xor	ax, ax

loc_1C74C:				; CODE XREF: Widget_MainHandler+82j
		or	al, al
		jnz	short loc_1C782
		cmp	byte_72E00, 1
		jz	short loc_1C75E
		cmp	byte_72E21, 1
		jnz	short loc_1C763

loc_1C75E:				; CODE XREF: Widget_MainHandler+8Fj
		mov	ax, 1
		jmp	short loc_1C765
; ���������������������������������������������������������������������������

loc_1C763:				; CODE XREF: Widget_MainHandler+96j
		xor	ax, ax

loc_1C765:				; CODE XREF: Widget_MainHandler+9Bj
		or	al, al
		jnz	short loc_1C782
		cmp	byte_72DF2, 1
		jz	short loc_1C777
		cmp	byte_72DFE, 1
		jnz	short loc_1C77C

loc_1C777:				; CODE XREF: Widget_MainHandler+A8j
		mov	ax, 1
		jmp	short loc_1C77E
; ���������������������������������������������������������������������������

loc_1C77C:				; CODE XREF: Widget_MainHandler+AFj
		xor	ax, ax

loc_1C77E:				; CODE XREF: Widget_MainHandler+B4j
		or	al, al
		jz	short loc_1C787

loc_1C782:				; CODE XREF: Widget_MainHandler+88j
					; Widget_MainHandler+A1j
		mov	ax, 1

loc_1C785:
		jmp	short loc_1C789
; ���������������������������������������������������������������������������

loc_1C787:				; CODE XREF: Widget_MainHandler+BAj
		xor	ax, ax

loc_1C789:				; CODE XREF: Widget_MainHandler:loc_1C735j
					; Widget_MainHandler:loc_1C785j
		mov	ah, 0
		or	ax, ax

loc_1C78D:
		jz	short loc_1C792
		jmp	loc_1C848
; ���������������������������������������������������������������������������

loc_1C792:				; CODE XREF: Widget_MainHandler:loc_1C78Dj
		mov	bx, [si+0C4h]
		mov	bx, [bx+20h]
		mov	bx, [bx+2]
		les	bx, [bx+5Ah]
		mov	al, es:[bx+13h]
		mov	[bp+var_2], al
		mov	[bp+var_4], 0
		jmp	loc_1C83C
; ���������������������������������������������������������������������������

loc_1C7AE:				; CODE XREF: Widget_MainHandler+17Fj
		mov	bx, [bp+var_4]
		shl	bx, 1
		mov	di, [bx+si+0B2h]
		mov	al, [di+6]
		cmp	al, [bp+var_1]
		jnz	short loc_1C7F7
		cmp	byte ptr [di+2], 0
		jz	short loc_1C7D4
		cmp	byte ptr [di+8], 0
		jz	short loc_1C7D4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+8]
		pop	cx
		jmp	short loc_1C848
; ���������������������������������������������������������������������������

loc_1C7D4:				; CODE XREF: Widget_MainHandler+FDj
					; Widget_MainHandler+103j
		mov	al, [di+7]
		cmp	al, [bp+var_2]

loc_1C7DA:
		jz	short loc_1C7E2
		cmp	byte ptr [di+7], 0FFh
		jnz	short loc_1C7F7

loc_1C7E2:				; CODE XREF: Widget_MainHandler:loc_1C7DAj
		mov	al, [di+2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C7F7
		push	di
		push	si

loc_1C7ED:
		call	VROOMM_StubThunk_6B5CA

loc_1C7F2:
		add	sp, 4
		jmp	short loc_1C848
; ���������������������������������������������������������������������������

loc_1C7F7:				; CODE XREF: Widget_MainHandler+F7j
					; Widget_MainHandler+11Aj ...
		mov	al, [di+7]
		cmp	al, [bp+var_2]
		jz	short loc_1C839

loc_1C7FF:
		cmp	byte ptr [di+2], 0

loc_1C803:
		jz	short loc_1C839
		cmp	byte ptr [di+7], 0FFh
		jz	short loc_1C839
		push	di
		mov	bx, [di]
		call	dword ptr [bx+8]
		pop	cx
		xor	dx, dx
		jmp	short loc_1C833
; ���������������������������������������������������������������������������

loc_1C816:				; CODE XREF: Widget_MainHandler+171j
		mov	bx, dx
		shl	bx, 1
		mov	di, [bx+si+0B2h]
		mov	al, [di+7]
		cmp	al, [bp+var_2]
		jnz	short loc_1C832
		push	di
		push	si
		call	VROOMM_StubThunk_6B5CA
		add	sp, 4
		jmp	short loc_1C839
; ���������������������������������������������������������������������������

loc_1C832:				; CODE XREF: Widget_MainHandler+15Ej
		inc	dx

loc_1C833:				; CODE XREF: Widget_MainHandler+14Ej
		cmp	[si+0C2h], dx
		jg	short loc_1C816

loc_1C839:				; CODE XREF: Widget_MainHandler+137j
					; Widget_MainHandler:loc_1C803j	...
		inc	[bp+var_4]

loc_1C83C:				; CODE XREF: Widget_MainHandler+E5j
		mov	ax, [si+0C2h]
		cmp	ax, [bp+var_4]
		jle	short loc_1C848
		jmp	loc_1C7AE
; ���������������������������������������������������������������������������

loc_1C848:				; CODE XREF: Widget_MainHandler+28j
					; Widget_MainHandler+C9j ...
		mov	di, si
		add	di, 20h	; ' '
		mov	[bp+var_4], 0
		jmp	short loc_1C866
; ���������������������������������������������������������������������������

loc_1C854:				; CODE XREF: Widget_MainHandler+1A7j
		cmp	byte ptr [di+37h], 1
		jnz	short loc_1C860
		push	di
		push	cs
		call	near ptr Widget_NotifyDelegate
		pop	cx

loc_1C860:				; CODE XREF: Widget_MainHandler+192j
		inc	[bp+var_4]
		add	di, 48h	; 'H'

loc_1C866:				; CODE XREF: Widget_MainHandler+18Cj
		mov	ax, [si+0B0h]
		cmp	ax, [bp+var_4]
		jg	short loc_1C854
		pop	di
		pop	si
		leave
		retf
Widget_MainHandler	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — parcourt le tableau (+0x20, pas 0x48, compteur +0xB0) et appelle sub_1C5D8
; (tooltip) pour chaque élément actif (+0x37) : rafraîchissement des info-bulles de tous les
; éléments d'une liste.
; ==============================================================================================
List_RefreshAllTooltips	proc far		; CODE XREF: seg015:018DP

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 20h	; ' '
		mov	[bp+var_2], 0
		jmp	short loc_1C89C
; ���������������������������������������������������������������������������

loc_1C88A:				; CODE XREF: List_RefreshAllTooltips+30j
		cmp	byte ptr [di+37h], 0
		jz	short loc_1C896
		push	di
		push	cs
		call	near ptr Widget_DrawTooltip
		pop	cx

loc_1C896:				; CODE XREF: List_RefreshAllTooltips+1Bj
		inc	[bp+var_2]
		add	di, 48h	; 'H'

loc_1C89C:				; CODE XREF: List_RefreshAllTooltips+15j
		mov	ax, [si+0B0h]
		cmp	ax, [bp+var_2]
		jg	short loc_1C88A
		pop	di
		pop	si
		leave
		retf
List_RefreshAllTooltips	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, si
		add	di, 20h	; ' '
		mov	word ptr [bp-2], 0
		jmp	short loc_1C8E0
; ���������������������������������������������������������������������������

loc_1C8C0:				; CODE XREF: seg028:loc_1C8E7j
		cmp	byte ptr [di+37h], 0
		jz	short loc_1C8DA
		mov	ax, di
		add	ax, 1Bh
		push	ax
		mov	ax, di
		add	ax, 29h	; ')'
		push	ax

loc_1C8D2:
		call	UI_ApplyEncodingHelper_5E576

loc_1C8D7:
		add	sp, 4

loc_1C8DA:				; CODE XREF: seg028:0374j
		inc	word ptr [bp-2]
		add	di, 48h	; 'H'

loc_1C8E0:				; CODE XREF: seg028:036Ej
		mov	ax, [si+0B0h]

loc_1C8E4:
		cmp	ax, [bp-2]

loc_1C8E7:
		jg	short loc_1C8C0
		pop	di
		pop	si
		leave
		retf
seg028		ends
