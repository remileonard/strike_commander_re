seg020		segment	byte public 'CODE' use16
		assume cs:seg020
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Vide les événements en attente : boucle sur sub_3EA28, sub_6DBF et
; sub_6BFB jusqu'à ce qu'aucun événement ne soit renvoyé.
; ==============================================================================================
Input_Flush_CDDC	proc far		; CODE XREF: sub_502B+BP sub_502B+34AP ...

var_C		= word ptr -0Ch
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	byte ptr [bp+var_C], 0

loc_CDE6:				; CODE XREF: Input_Flush_CDDC+46j Input_Flush_CDDC+4Cj
		lea	ax, [bp+var_C]
		push	ax
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_CE1E
		lea	ax, [bp+var_C]
		push	ax
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CE1C
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_CE1C:				; CODE XREF: Input_Flush_CDDC+2Cj
		jmp	short $+2

loc_CE1E:				; CODE XREF: Input_Flush_CDDC+1Aj
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_CDE6
		cmp	byte ptr [bp+var_4], 0
		jnz	short loc_CDE6
		leave
		retf
Input_Flush_CDDC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_CE2C	proc far		; CODE XREF: sub_D157+C2p

var_6C		= word ptr -6Ch
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3F		= word ptr -3Fh
var_3C		= word ptr -3Ch
var_38		= word ptr -38h
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	di
		push	100h
		push	0
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		lea	ax, [bp+var_42]
		push	ax
		call	sub_2CDC3
		add	sp, 2
		mov	ax, [bp+var_3F]
		mov	[bp+var_44], ax
		push	32h ; '2'
		push	32h ; '2'
		push	32h ; '2'
		push	ds
		push	[bp+var_44]
		call	sub_FA5F
		add	sp, 0Ah
		mov	[bp+var_2], ax
		push	0
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		mov	bx, word_443B7
		mov	al, [bx+16h]
		mov	ah, 0
		mov	[bp+var_3], al
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_443B7
		mov	bx, word_443B7
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		mov	ax, word_46F46
		mov	[bp+var_18], ax
		push	[bp+var_18]
		mov	ax, word_443B9
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	byte ptr [bp+var_6C], 0
		cmp	[bp+arg_0], 56h	; 'V'
		jnz	short loc_CEE9
		push	138h
		push	28ECh
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	loc_CF83
; ���������������������������������������������������������������������������

loc_CEE9:				; CODE XREF: sub_CE2C+A6j
		cmp	[bp+arg_0], 50h	; 'P'
		jnz	short loc_CF01
		push	28F7h
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		jmp	loc_CF83
; ���������������������������������������������������������������������������

loc_CF01:				; CODE XREF: sub_CE2C+C1j
		cmp	[bp+arg_0], 49h	; 'I'
		jnz	short loc_CF2D
		mov	al, byte_48B3A
		mov	ah, 0
		push	ax
		mov	al, byte_48A28
		mov	ah, 0
		push	ax
		mov	al, byte_48A29
		mov	ah, 0
		push	ax
		push	2903h
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		mov	si, 78h	; 'x'
		jmp	short loc_CF83
; ���������������������������������������������������������������������������

loc_CF2D:				; CODE XREF: sub_CE2C+D9j
		cmp	[bp+arg_0], 4Dh	; 'M'
		jnz	short loc_CF52
		add	dword_48CBC, 1388h
		push	large [dword_48CBC]
		push	2915h
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_CF83
; ���������������������������������������������������������������������������

loc_CF52:				; CODE XREF: sub_CE2C+105j
		cmp	[bp+arg_0], 58h	; 'X'
		jnz	short loc_CF69
		push	291Bh
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_CF83
; ���������������������������������������������������������������������������

loc_CF69:				; CODE XREF: sub_CE2C+12Aj
		cmp	[bp+arg_0], 53h	; 'S'
		jnz	short loc_CF83
		push	large [dword_48E19]
		push	292Eh
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8

loc_CF83:				; CODE XREF: sub_CE2C+BAj sub_CE2C+D2j ...
		lea	ax, [bp+var_6C]
		push	ax
		push	word_443B9
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_1A]
		add	ax, 14h
		mov	si, ax
		mov	[bp+var_6], 14h
		mov	ax, si
		sar	ax, 1
		mov	dx, 0A0h ; '�'
		sub	dx, ax
		mov	[bp+var_8], dx
		mov	ax, [bp+var_6]
		sar	ax, 1
		mov	dx, 64h	; 'd'
		sub	dx, ax
		mov	di, dx
		mov	ax, [bp+var_8]
		add	ax, si
		dec	ax
		mov	[bp+var_A], ax
		mov	ax, di
		add	ax, [bp+var_6]
		dec	ax
		mov	[bp+var_C], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_24], ax
		mov	[bp+var_26], di
		mov	ax, [bp+var_A]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_2A], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_28]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_2A]
		mov	[bp+var_1C], ax
		mov	ax, si
		imul	[bp+var_6]
		movsx	eax, ax
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		push	1
		push	0
		push	2
		push	large [bp+var_32]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_36+2],	dx
		mov	word ptr [bp+var_36], ax
		mov	eax, [bp+var_36]
		mov	[bp+var_16], eax
		mov	[bp+var_12], 2
		mov	[bp+var_11], 1
		mov	[bp+var_10], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_10], eax
		lea	ax, [bp+var_22]
		push	ax
		push	0
		mov	al, [bp+var_12]
		push	ax
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegionVariant_33ABC
		add	sp, 8
		push	0
		push	[bp+var_C]
		push	[bp+var_A]
		push	di
		push	[bp+var_8]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	ax, [bp+var_1A]
		sar	ax, 1
		mov	dx, 0A0h ; '�'
		sub	dx, ax
		mov	[bp+var_38], dx
		lea	ax, [bp+var_6C]
		push	ax
		mov	ax, di
		add	ax, 5
		push	ax
		push	[bp+var_38]
		push	293Eh
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		push	cs
		call	near ptr Input_Flush_CDDC

loc_D0B8:				; CODE XREF: sub_CE2C+29Fj
		push	0FFh
		lea	ax, [bp+var_3C]
		push	ax
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		cmp	byte ptr [bp+var_3C], 1
		jnz	short loc_D0B8
		cmp	[bp+arg_0], 58h	; 'X'
		jnz	short loc_D0DE
		cmp	byte ptr [bp+var_3C+1],	15h
		jnz	short loc_D0DE
		nop
		push	cs
		call	near ptr sub_D221

loc_D0DE:				; CODE XREF: sub_CE2C+2A5j
					; sub_CE2C+2ABj
		lea	ax, [bp+var_22]
		push	ax
		push	0
		mov	al, [bp+var_12]
		push	ax
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegion_334A0
		add	sp, 8
		mov	al, [bp+var_3]
		push	ax
		push	word_443B7
		mov	bx, word_443B7
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_D13F
		cmp	[bp+var_16], 0
		jz	short loc_D13F
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_D13F:				; CODE XREF: sub_CE2C+2F3j
					; sub_CE2C+2FAj
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		pop	di
		pop	si
		leave
		retf
sub_CE2C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D157	proc far		; CODE XREF: sub_502B:loc_5073P
					; Scene_PollKeys_C5AF+AP ...

var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_49750, 1
		jz	short loc_D16B
		cmp	byte_49771, 1
		jnz	short loc_D170

loc_D16B:				; CODE XREF: sub_D157+Bj
		mov	ax, 1
		jmp	short loc_D172
; ���������������������������������������������������������������������������

loc_D170:				; CODE XREF: sub_D157+12j
		xor	ax, ax

loc_D172:				; CODE XREF: sub_D157+17j
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_D17E
		jmp	locret_D21F
; ���������������������������������������������������������������������������

loc_D17E:				; CODE XREF: sub_D157+22j
		mov	[bp+var_2], 0
		cmp	byte_4973C, 1
		jnz	short loc_D1BB
		mov	[bp+var_4], 0
		jmp	short loc_D1B3
; ���������������������������������������������������������������������������

loc_D190:				; CODE XREF: sub_D157+60j
		mov	al, byte ptr [bp+var_4]
		push	ax
		call	sub_3F3A6
		add	sp, 2
		or	al, al
		jz	short loc_D1B0
		push	1
		push	[bp+var_4]
		push	5E03h
		call	sub_422C5
		add	sp, 6

loc_D1B0:				; CODE XREF: sub_D157+47j
		inc	[bp+var_4]

loc_D1B3:				; CODE XREF: sub_D157+37j
		cmp	[bp+var_4], 2
		jl	short loc_D190
		jmp	short locret_D21F
; ���������������������������������������������������������������������������

loc_D1BB:				; CODE XREF: sub_D157+30j
		cmp	byte_49747, 1
		jnz	short loc_D1C8
		mov	[bp+var_2], 56h	; 'V'
		jmp	short loc_D20E
; ���������������������������������������������������������������������������

loc_D1C8:				; CODE XREF: sub_D157+69j
		cmp	byte_49731, 1
		jnz	short loc_D1D5
		mov	[bp+var_2], 50h	; 'P'
		jmp	short loc_D20E
; ���������������������������������������������������������������������������

loc_D1D5:				; CODE XREF: sub_D157+76j
		cmp	byte_49745, 1
		jnz	short loc_D1E2
		mov	[bp+var_2], 58h	; 'X'
		jmp	short loc_D20E
; ���������������������������������������������������������������������������

loc_D1E2:				; CODE XREF: sub_D157+83j
		cmp	byte_49737, 1
		jnz	short loc_D1EF
		mov	[bp+var_2], 53h	; 'S'
		jmp	short loc_D20E
; ���������������������������������������������������������������������������

loc_D1EF:				; CODE XREF: sub_D157+90j
		cmp	byte_443B2, 0
		jz	short loc_D20E
		cmp	byte_4972F, 1
		jnz	short loc_D203
		mov	[bp+var_2], 49h	; 'I'
		jmp	short loc_D20E
; ���������������������������������������������������������������������������

loc_D203:				; CODE XREF: sub_D157+A4j
		cmp	byte_4974A, 1
		jnz	short loc_D20E
		mov	[bp+var_2], 4Dh	; 'M'

loc_D20E:				; CODE XREF: sub_D157+6Fj sub_D157+7Cj ...
		cmp	[bp+var_2], 0
		jz	short locret_D21F
		mov	al, [bp+var_2]
		push	ax
		push	cs
		call	near ptr sub_CE2C
		add	sp, 2

locret_D21F:				; CODE XREF: sub_D157+24j sub_D157+62j ...
		leave
		retf
sub_D157	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D221	proc far		; CODE XREF: sub_CE2C+2AFp
		push	bp
		mov	bp, sp
		mov	byte_46853, 1
		call	Keyboard_DrainBufferBIOS_3FA5E
		call	PagedResourceC_RefreshAllInstances_2FD55
		push	2945h
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	1
		call	CRT_Exit
		add	sp, 2
		pop	bp
		retf
sub_D221	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Renvoie 1 si la séquence en cours doit être passée : byte_495FC déjà
; posé ; touche Échap (code 1, pose byte_495FC = 1) ; touche Espace (code 57) ; ou événement
; de type 2 renvoyé par sub_3EA28 (rôle non établi). Appelle d'abord sub_D157 (pas lue).
; ==============================================================================================
Input_CheckSkip_D24A	proc far		; CODE XREF: seg018:loc_CAA9P
					; sub_4AD86:loc_4B41FP	...

var_C		= word ptr -0Ch
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	cs
		call	near ptr sub_D157
		cmp	byte_495FC, 0
		jz	short loc_D25F
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������

loc_D25F:				; CODE XREF: Input_CheckSkip_D24A+Fj
		mov	byte ptr [bp+var_C], 0
		lea	ax, [bp+var_C]
		push	ax
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_D29B
		lea	ax, [bp+var_C]
		push	ax
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D299
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_D299:				; CODE XREF: Input_CheckSkip_D24A+3Bj
		jmp	short $+2

loc_D29B:				; CODE XREF: Input_CheckSkip_D24A+29j
		cmp	byte ptr [bp+var_4], 2
		jnz	short loc_D2BC
		cmp	byte ptr [bp+var_4+1], 1
		jnz	short loc_D2B2
		mov	byte_495FC, 1
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_D2BC
; ���������������������������������������������������������������������������

loc_D2B2:				; CODE XREF: Input_CheckSkip_D24A+5Bj
		cmp	byte ptr [bp+var_4+1], 39h ; '9'
		jnz	short loc_D2BC
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������

loc_D2BC:				; CODE XREF: Input_CheckSkip_D24A+55j Input_CheckSkip_D24A+66j ...
		cmp	byte ptr [bp+var_C], 2
		jnz	short loc_D2C6
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������

loc_D2C6:				; CODE XREF: Input_CheckSkip_D24A+76j
		mov	al, 0
		leave
		retf
Input_CheckSkip_D24A	endp

; ���������������������������������������������������������������������������
		leave
		retf
seg020		ends
