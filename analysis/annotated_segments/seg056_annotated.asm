seg056		segment	byte public 'CODE' use16
		assume cs:seg056
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — parcourt un tableau de pointeurs (+4, compteur +2), appelle vtable[0] sur chacun :
; notification en masse (destruction/reset) des éléments d'une collection.
; ==============================================================================================
Collection_NotifyAllDestroy	proc far		; CODE XREF: seg065:0197P
					; Camera_UpdateAndNotify_7AFCA+54P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+4]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_2AD93
; ���������������������������������������������������������������������������

loc_2AD7C:				; CODE XREF: Collection_NotifyAllDestroy+31j
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 4
		add	word ptr [bp+var_4], 4
		inc	di

loc_2AD93:				; CODE XREF: Collection_NotifyAllDestroy+15j
		cmp	[si+2],	di
		jg	short loc_2AD7C
		pop	di
		pop	si
		leave
		retf
Collection_NotifyAllDestroy	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,98L — construit une chaîne formatée (sub_5C774, format 0x174E) indexée par di*4,
; initialise un descripteur d'objet UI (type 2, sous-type 1) : constructeur d'élément de liste
; UI avec libellé numéroté généré.
; ==============================================================================================
ListItem_ConstructNumberedLabel	proc far		; CODE XREF: seg056:019Cp
					; World_ParseWrldForm_A767F+CCP

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0
		jz	short loc_2ADB2
		jmp	loc_2AE78
; ���������������������������������������������������������������������������

loc_2ADB2:				; CODE XREF: ListItem_ConstructNumberedLabel+11j
		mov	ax, di
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_4], eax
		push	174Eh
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]

loc_2ADDF:
		mov	[si+0Ch], eax

loc_2ADE3:
		mov	byte ptr [si+10h], 2

loc_2ADE7:
		mov	byte ptr [si+11h], 1

loc_2ADEB:
		mov	dword ptr [si+12h], 0

loc_2ADF3:
		mov	eax, [bp+var_4]
		mov	[si+12h], eax
		push	0
		mov	al, [si+10h]
		push	ax
		push	large dword ptr	[si+0Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[si+6],	dx
		mov	[si+4],	ax
		mov	[si], di
		mov	word ptr [si+2], 0
		push	176Ch
		push	1
		push	0
		push	3
		push	large 0FFFCh
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]

loc_2AE41:
		mov	[si+16h], eax
		mov	byte ptr [si+1Ah], 3
		mov	byte ptr [si+1Bh], 1
		mov	dword ptr [si+1Ch], 0
		mov	dword ptr [si+1Ch], 0FFFCh
		push	0
		mov	al, [si+1Ah]
		push	ax
		push	large dword ptr	[si+16h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8],	ax

loc_2AE78:				; CODE XREF: ListItem_ConstructNumberedLabel+13j
		pop	di
		pop	si
		leave
		retf
ListItem_ConstructNumberedLabel	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — si actif (+2), résout le texte (sub_5C832) et notifie l'affichage (sub_588E8) :
; rafraîchissement conditionnel du texte d'un widget.
; ==============================================================================================
Widget_RefreshTextConditional	proc far		; CODE XREF: seg065:loc_2DF81P
					; Camera_UpdateAndNotify_7AFCA+4BP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_2AEAB
		push	0
		mov	al, [si+1Ah]
		push	ax
		push	large dword ptr	[si+16h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8],	ax
		push	si
		call	Parser_BuildHashIndex_588E8
		pop	cx

loc_2AEAB:				; CODE XREF: Widget_RefreshTextConditional+Bj
		pop	si
		pop	bp
		retf
Widget_RefreshTextConditional	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_2AEC7
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2AF02

loc_2AEC7:				; CODE XREF: seg056:0157j
		mov	dword ptr [si+0Ch], 0
		mov	byte ptr [si+10h], 2
		mov	byte ptr [si+11h], 0
		mov	dword ptr [si+12h], 0

loc_2AEDF:
		mov	dword ptr [si+16h], 0
		mov	byte ptr [si+1Ah], 2
		mov	byte ptr [si+1Bh], 0
		mov	dword ptr [si+1Ch], 0
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr ListItem_ConstructNumberedLabel
		add	sp, 4

loc_2AF02:				; CODE XREF: seg056:0165j
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,56L — libère deux chaînes conditionnelles (offsets +0xC et +0x16 via sub_5C7B6) puis
; réinitialise leurs champs : destructeur de widget avec libération de deux libellés associés.
; ==============================================================================================
Widget_DestructTwoLabels	proc far		; CODE XREF: seg065:loc_2E781P
					; MissionLoader_AssignUnitRoster_A7D46+1CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+11h], 0
		jz	short loc_2AF34
		cmp	dword ptr [si+0Ch], 0
		jz	short loc_2AF34
		push	0
		mov	al, [si+10h]
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2AF34:				; CODE XREF: Widget_DestructTwoLabels+Bj
					; Widget_DestructTwoLabels+12j
		mov	dword ptr [si+0Ch], 0
		mov	byte ptr [si+11h], 0
		mov	dword ptr [si+12h], 0
		cmp	byte ptr [si+1Bh], 0
		jz	short loc_2AF6E
		cmp	dword ptr [si+16h], 0
		jz	short loc_2AF6E
		push	0
		mov	al, [si+1Ah]
		push	ax
		mov	ax, si
		add	ax, 16h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2AF6E:				; CODE XREF: Widget_DestructTwoLabels+45j
					; Widget_DestructTwoLabels+4Cj
		mov	dword ptr [si+16h], 0
		mov	byte ptr [si+1Bh], 0

loc_2AF7A:
		mov	dword ptr [si+1Ch], 0
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
Widget_DestructTwoLabels	endp

seg056		ends
