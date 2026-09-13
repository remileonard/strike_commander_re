seg026		segment	byte public 'CODE' use16
		assume cs:seg026
		;org 7
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,59L — constructeur d'objet chaîne (type 0xD76, allocation via sub_5C6F3 si besoin),
; copie le contenu (sub_2DF4=memcpy) et enregistre la longueur : constructeur de classe String
; C++ (avec source=pointeur+longueur).
; ==============================================================================================
String_ConstructFromPtr	proc far		; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+461P
					; MissionRecord_LoadWithDwordFieldsB_89F00+4B4P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_1B4FE:				; DATA XREF: seg216:018Eo
		cmp	[bp+arg_0], 0
		jnz	short loc_1B523
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_1B56A

loc_1B523:				; CODE XREF: String_ConstructFromPtr+Cj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D76h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2
		mov	byte ptr es:[bx+1Ah], 1
		push	ds
		push	[bp+arg_4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		mov	si, [bp+arg_6]
		mov	ax, [si]
		mov	word ptr [bp+var_4], ax
		mov	ax, [si+2]
		mov	word ptr [bp+var_4+2], ax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], eax
		dec	word ptr es:[bx+4]

loc_1B56A:				; CODE XREF: String_ConstructFromPtr+2Aj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
String_ConstructFromPtr	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,62L — variante du constructeur String, calcule la longueur via sub_64A54 (strlen) sur
; une chaîne C source : constructeur de classe String depuis une chaîne ASCIIZ.
; ==============================================================================================
String_ConstructFromCStr	proc far		; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+53P
					; MissionRecord_LoadWithStringConstruct_88CAD+C3P ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_1B59F
		push	1

loc_1B583:
		push	0
		push	2
		push	large 1Bh

loc_1B58A:
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_1B5D6

loc_1B59F:				; CODE XREF: String_ConstructFromCStr+Cj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D76h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2
		mov	byte ptr es:[bx+1Ah], 1
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_1B5C0:
		les	bx, [bp+arg_0]

loc_1B5C3:
		mov	es:[bx+2], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		dec	ax
		les	bx, [bp+arg_0]

loc_1B5D2:
		mov	es:[bx+4], ax

loc_1B5D6:				; CODE XREF: String_ConstructFromCStr+2Aj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		pop	bp
		retf
String_ConstructFromCStr	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — copie conditionnelle (si non-null) du contenu source dans le buffer interne
; (sub_2DF4) : opérateur d'assignation de classe String.
; ==============================================================================================
String_Assign	proc far		; CODE XREF: seg026:loc_1B8BFp
					; DATA XREF: seg339:095Eo ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_1B5E2:
		mov	ax, [bp+arg_4]
		or	ax, ax

loc_1B5E7:
		jz	short loc_1B5FD
		push	ds
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8

loc_1B5FD:				; CODE XREF: String_Assign:loc_1B5E7j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		add	ax, 6
		pop	bp
		retf
String_Assign	endp

; ���������������������������������������������������������������������������

loc_1B608:				; DATA XREF: seg339:off_6DA12o
					; seg339:0976o	...
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	0Ah
		lea	ax, [bp-0Ah]
		push	ax
		push	word ptr [bp+0Ah]
		call	CRT_Itoa_Signed10
		add	sp, 6
		lea	ax, [bp-0Ah]
		push	ax
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		add	ax, 6
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		mov	ax, [di]
		mov	es:[bx+2], ax
		mov	ax, [di+2]
		mov	es:[bx+4], ax
		dec	word ptr es:[bx+4]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+0Ah]
		mov	ax, es:[bx+2]
		mov	[bp-4],	ax
		mov	ax, es:[bx+4]
		mov	[bp-2],	ax
		inc	word ptr [bp-2]
		mov	bx, [bp+6]
		mov	ax, [bp-4]
		mov	[bx], ax
		mov	ax, [bp-2]
		mov	[bx+2],	ax

loc_1B68A:
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		leave
		retf
; ���������������������������������������������������������������������������

loc_1B692:				; DATA XREF: seg339:096Ao seg339:097Eo ...
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+1Ah], 0
		jz	short loc_1B6ED
		cmp	word ptr [bp+0Ch], 0
		jz	short loc_1B6ED
		mov	ax, [di+2]
		add	ax, es:[bx+4]
		push	ax
		mov	ax, [di]
		add	ax, es:[bx+2]
		push	ax
		push	word ptr [bp+0Ch]
		call	Widget_ComputeBoundsExtent_60AEB

loc_1B6C4:
		add	sp, 6

loc_1B6C7:
		mov	ax, [bp+6]
		add	ax, 6

loc_1B6CD:
		push	word ptr [bp+8]
		push	ax
		push	ss

loc_1B6D2:
		lea	ax, [bp-14h]
		push	ax

loc_1B6D6:
		call	CRT_MemFamily_Extra5

loc_1B6DB:
		add	sp, 8
		lea	ax, [bp-14h]
		push	ax

loc_1B6E2:
		push	word ptr [bp+0Ch]
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4

loc_1B6ED:				; CODE XREF: seg026:01B5j seg026:01BBj
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — si arg_4 diffère d'une valeur par défaut (word_70EA2), formate un message
; (sub_2962=sprintf) sinon copie le texte par défaut : construction de String avec valeur de
; repli (fallback) si code invalide.
; ==============================================================================================
String_ConstructWithFallback	proc far		; CODE XREF: seg024:006DP seg024:00F7P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp

loc_1B6F2:
		mov	bp, sp

loc_1B6F4:
		sub	sp, 2
		mov	dx, [bp+arg_4]

loc_1B6FA:
		cmp	dx, word_70EA2
		jz	short loc_1B714

loc_1B700:
		lea	ax, [bp+arg_6]

loc_1B703:
		mov	[bp+var_2], ax
		push	ax

loc_1B707:
		push	dx
		push	word_70EA2
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_1B714:				; CODE XREF: String_ConstructWithFallback+Dj
		push	ds
		push	word_70EA2
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		leave
		retf
String_ConstructWithFallback	endp

; ���������������������������������������������������������������������������

loc_1B72D:				; DATA XREF: seg339:0D42o
		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+1Ah], 0
		jz	short loc_1B7A0
		cmp	word ptr [bp+0Ch], 0
		jz	short loc_1B7A0
		mov	ax, [bp+6]
		add	ax, 6
		push	word ptr [bp+8]
		push	ax
		push	ss
		lea	ax, [bp-16h]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		lea	ax, [bp-16h]
		push	ax
		push	word ptr [bp+0Ch]
		call	GlyphObject_RenderToWidget_60DFE
		add	sp, 4
		mov	[bp-2],	ax
		les	bx, [bp+6]
		mov	ax, [di+2]
		add	ax, es:[bx+4]
		push	ax
		mov	ax, [di]
		add	ax, es:[bx+2]

loc_1B782:
		sub	ax, [bp-2]
		push	ax

loc_1B786:
		push	word ptr [bp+0Ch]

loc_1B789:
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6

loc_1B791:
		lea	ax, [bp-16h]
		push	ax

loc_1B795:
		push	word ptr [bp+0Ch]
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4

loc_1B7A0:				; CODE XREF: seg026:0250j seg026:0256j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1B7A4:				; DATA XREF: seg339:off_6DDE2o
		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+1Ah], 0
		jz	short loc_1B819
		cmp	word ptr [bp+0Ch], 0
		jz	short loc_1B819
		mov	ax, [bp+6]
		add	ax, 6
		push	word ptr [bp+8]
		push	ax

loc_1B7C9:
		push	ss

loc_1B7CA:
		lea	ax, [bp-16h]
		push	ax

loc_1B7CE:
		call	CRT_MemFamily_Extra5

loc_1B7D3:
		add	sp, 8
		lea	ax, [bp-16h]
		push	ax
		push	word ptr [bp+0Ch]

loc_1B7DD:
		call	GlyphObject_RenderToWidget_60DFE

loc_1B7E2:
		add	sp, 4
		sar	ax, 1
		mov	[bp-2],	ax
		les	bx, [bp+6]
		mov	ax, [di+2]
		add	ax, es:[bx+4]
		push	ax
		mov	ax, [di]

loc_1B7F7:
		add	ax, es:[bx+2]
		sub	ax, [bp-2]
		push	ax

loc_1B7FF:
		push	word ptr [bp+0Ch]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp-16h]
		push	ax
		push	word ptr [bp+0Ch]
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4

loc_1B819:				; CODE XREF: seg026:02C7j seg026:02CDj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1B81D:				; DATA XREF: seg339:0AF3o
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+0Ah]
		mov	[bp-0Ch], si
		mov	ax, [bp-0Ch]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp-0Ah], ax
		push	0Ah
		lea	ax, [bp-6]
		push	ax
		movsx	eax, word ptr [bp-0Ah]
		push	eax
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		lea	ax, [bp-6]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	[bp-8],	ax
		mov	byte ptr [bp-2], 0
		cmp	ax, 1
		jz	short loc_1B86C
		cmp	ax, 2
		jz	short loc_1B880
		cmp	ax, 3
		jz	short loc_1B892
		jmp	short loc_1B8AA
; ���������������������������������������������������������������������������

loc_1B86C:				; CODE XREF: seg026:036Ej
		mov	al, [bp-6]
		mov	[bp-3],	al
		mov	byte ptr [bp-4], 2Ch ; ','
		mov	byte ptr [bp-5], 30h ; '0'

loc_1B87A:				; CODE XREF: seg026:03A0j
		mov	byte ptr [bp-6], 30h ; '0'
		jmp	short loc_1B8AE
; ���������������������������������������������������������������������������

loc_1B880:				; CODE XREF: seg026:0373j
		mov	al, [bp-5]
		mov	[bp-3],	al

loc_1B886:
		mov	byte ptr [bp-4], 2Ch ; ','
		mov	al, [bp-6]
		mov	[bp-5],	al
		jmp	short loc_1B87A
; ���������������������������������������������������������������������������

loc_1B892:				; CODE XREF: seg026:0378j
		mov	al, [bp-4]
		mov	[bp-3],	al
		mov	byte ptr [bp-4], 2Ch ; ','
		mov	al, [bp-5]
		mov	[bp-5],	al
		mov	al, [bp-6]
		mov	[bp-6],	al
		jmp	short loc_1B8AE
; ���������������������������������������������������������������������������

loc_1B8AA:				; CODE XREF: seg026:037Aj
		mov	byte ptr [bp-6], 58h ; 'X'

loc_1B8AE:				; CODE XREF: seg026:038Ej seg026:03B8j
		or	si, si
		jge	short loc_1B8B6
		mov	byte ptr [bp-6], 2Dh ; '-'

loc_1B8B6:				; CODE XREF: seg026:03C0j
		lea	ax, [bp-6]
		push	ax
		push	large dword ptr	[bp+6]
		push	cs

loc_1B8BF:
		call	near ptr String_Assign

loc_1B8C2:
		add	sp, 6
		pop	si
		leave
		retf
seg026		ends
