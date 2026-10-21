seg018		segment	byte public 'CODE' use16
		assume cs:seg018
		;org 5
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8F5	proc far		; CODE XREF: seg018:01B1p seg018:01DDp ...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		push	[bp+arg_2]
		call	CRT_Strdup
		add	sp, 2
		mov	[bp+var_2], ax
		mov	di, [bp+var_2]
		mov	[bp+var_4], 4
		jmp	short loc_C954
; ���������������������������������������������������������������������������

loc_C915:				; CODE XREF: sub_C8F5+6Dj
		cmp	[bp+var_6], 28h	; '('
		jle	short loc_C92F
		mov	si, 28h	; '('
		jmp	short loc_C921
; ���������������������������������������������������������������������������

loc_C920:				; CODE XREF: sub_C8F5+31j
		dec	si

loc_C921:				; CODE XREF: sub_C8F5+29j
		mov	bx, si
		cmp	byte ptr [bx+di], 20h ;	' '
		jnz	short loc_C920
		mov	bx, si
		mov	byte ptr [bx+di], 0
		jmp	short loc_C935
; ���������������������������������������������������������������������������

loc_C92F:				; CODE XREF: sub_C8F5+24j
		mov	ax, [bp+var_6]
		dec	ax
		mov	si, ax

loc_C935:				; CODE XREF: sub_C8F5+38j
		push	di
		push	2
		push	[bp+var_4]
		push	1AC8h
		push	[bp+arg_0]
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		add	[bp+var_4], 0Fh
		mov	ax, si
		add	ax, di
		inc	ax
		mov	di, ax

loc_C954:				; CODE XREF: sub_C8F5+1Ej
		push	di
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_C915
		push	[bp+var_2]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_C8F5	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	di, [bp+22h]
		mov	si, [bp+28h]
		push	word ptr [bp+26h]
		push	0FFh
		push	0Ah
		lea	ax, [bp-32h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-2],	ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+10h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-4],	ax
		push	word ptr [bp+1Ah]
		push	word ptr [bp-4]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	word ptr [bp+1Ch]
		push	word ptr [bp-4]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4
		push	word ptr [bp-2]
		lea	ax, [bp-32h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-4]
		lea	ax, [bp-32h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp-0Ah]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	ax, [bp+2Ah]
		mov	[bp-0Ch], ax
		mov	bx, [bp-0Ch]
		push	word ptr [bx]
		mov	bx, [bp-0Ch]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp-0Ch]
		lea	ax, [bp-0Ah]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+2Ch]
		mov	[bp-0Eh], ax
		mov	bx, [bp-0Eh]
		push	word ptr [bx]
		mov	bx, [bp-0Eh]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp-0Eh]
		lea	ax, [bp-0Ah]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-0Ah]
		mov	al, [bp-8]
		push	ax
		lea	ax, [bp-0Ah]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	al, [bp+2Eh]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		push	word ptr [bp+1Eh]
		push	si
		push	cs
		call	near ptr sub_C8F5
		add	sp, 4
		jmp	short loc_CB00
; ���������������������������������������������������������������������������

loc_CAA9:				; CODE XREF: seg018:0229j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_CAB4
		jmp	short loc_CB1B
; ���������������������������������������������������������������������������

loc_CAB4:				; CODE XREF: seg018:01C0j
		or	di, di
		jle	short loc_CAF4
		cmp	[bp-15h], di
		jnz	short loc_CAD3
		push	0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	word ptr [bp+20h]
		push	si
		push	cs
		call	near ptr sub_C8F5
		add	sp, 4

loc_CAD3:				; CODE XREF: seg018:01CBj
		mov	al, byte_48E5D
		mov	ah, 0
		mov	[bp-0Fh], al
		cmp	byte ptr [bp-0Fh], 10h
		jnz	short loc_CAEC
		push	1ACFh
		call	sub_310B
		add	sp, 2

loc_CAEC:				; CODE XREF: seg018:01EFj
		cmp	byte ptr [bp-0Fh], 31h ; '1'
		jnz	short loc_CAF4
		jmp	short loc_CB1B
; ���������������������������������������������������������������������������

loc_CAF4:				; CODE XREF: seg018:01C6j seg018:0200j
		lea	ax, [bp-32h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_CB00:				; CODE XREF: seg018:01B7j
		mov	ax, [bp-15h]
		cmp	ax, [bp+24h]
		jnb	short loc_CB0E
		cmp	byte ptr [bp-13h], 0
		jz	short loc_CB13

loc_CB0E:				; CODE XREF: seg018:0216j
		mov	ax, 1
		jmp	short loc_CB15
; ���������������������������������������������������������������������������

loc_CB13:				; CODE XREF: seg018:021Cj
		xor	ax, ax

loc_CB15:				; CODE XREF: seg018:0221j
		mov	ah, 0
		or	ax, ax
		jz	short loc_CAA9

loc_CB1B:				; CODE XREF: seg018:01C2j seg018:0202j
		push	0
		lea	ax, [bp-0Ah]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	0
		lea	ax, [bp-32h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+15h], 0
		jz	short loc_CB5B
		cmp	dword ptr [bp+10h], 0
		jz	short loc_CB5B
		push	0
		mov	al, [bp+14h]
		push	ax
		lea	ax, [bp+10h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_CB5B:				; CODE XREF: seg018:024Bj seg018:0252j
		mov	dword ptr [bp+10h], 0
		mov	byte ptr [bp+15h], 0
		mov	dword ptr [bp+16h], 0
		cmp	byte ptr [bp+0Bh], 0
		jz	short loc_CB93
		cmp	dword ptr [bp+6], 0
		jz	short loc_CB93
		push	0
		mov	al, [bp+0Ah]
		push	ax
		lea	ax, [bp+6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_CB93:				; CODE XREF: seg018:0283j seg018:028Aj
		mov	dword ptr [bp+6], 0
		mov	byte ptr [bp+0Bh], 0
		mov	dword ptr [bp+0Ch], 0
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Reçoit une palette par valeur (6 octets sur la pile : mot +0, octet +2,
; …), l'envoie à la carte (Palette_Upload_2CDE1(&arg, octet +2, mot +0, 0)) puis détruit la
; copie (Palette_Destruct_2D048). Après TextFormat_ReleaseAttribute_2EC80(word_46F46, 0).
; mid33, scène 6 : l'appelant construit la palette directement dans la zone d'arguments (sub
; sp, 6 ; Palette_Alloc sur cette zone, var_D4A ; Palette_CopyInto_2CF80 de midgames 40), puis
; appelle sans autre empilement.
; ==============================================================================================
Palette_UploadByValue_CBAB	proc far		; CODE XREF: sub_A3C30+7ED0P

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		lea	ax, [bp+arg_0]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		pop	bp
		retf
Palette_UploadByValue_CBAB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Initialise un tableau de textes de taille fixe : +0 = longueur d'un
; élément (arg_4), +2 = tampon de arg_2 × arg_4 octets (alloué par sub_2C319). Ex.
; Midgame1_PlayPart1 : 8 textes de 300 octets (SPOK), 4 de 60 et 3 de 60 (MG01). Le texte n
; est à tampon + n × longueur.
; ==============================================================================================
TextArray_Init_CBE1	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+17P
					; Midgame1_PlayPart1_5FCF0+2CP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[si], di
		mov	ax, di
		imul	[bp+arg_2]
		push	ax
		call	Runtime_StackOverflowCheck_2C319
		add	sp, 2
		mov	[si+2],	ax
		pop	di
		pop	si
		pop	bp
		retf
TextArray_Init_CBE1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Libère le tampon d'un tableau de TextArray_Init_CBE1
; (Heap_FreeAndCoalesce_2C3FC), puis l'objet si bit 1 de l'argument.
; ==============================================================================================
TextArray_Destruct_CC03	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+1784P
					; Midgame1_PlayPart1_5FCF0+1792P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CC32
		cmp	word ptr [si+2], 0
		jz	short loc_CC23
		push	word ptr [si+2]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2

loc_CC23:				; CODE XREF: TextArray_Destruct_CC03+13j
		test	di, 1
		jz	short loc_CC32
		push	si
		call	sub_308
		add	sp, 2

loc_CC32:				; CODE XREF: TextArray_Destruct_CC03+Dj TextArray_Destruct_CC03+24j
		pop	di
		pop	si
		pop	bp
		retf
TextArray_Destruct_CC03	endp

seg018		ends
