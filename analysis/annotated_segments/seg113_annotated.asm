seg113		segment	byte public 'CODE' use16
		assume cs:seg113
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 439 lignes, NON DÉTAILLÉE — utilise directement le segment mémoire VGA 0xA000 (via
; sub_60AEB) et des globales du même cluster UIScreen (word_7045C, word_6E343...). Probable
; rendu direct d'un graphe/jauge/carte pour cet écran. Référencée depuis seg014. Candidat pour
; session dédiée.
; ==============================================================================================
UIScreen_RenderGraphVGA_509EE	proc far		; CODE XREF: seg014:00C6P UIScreen_RenderGraphVGA_Wrapper_50E44+9p ...

var_76		= word ptr -76h
var_62		= word ptr -62h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 76h
		push	si
		push	di
		cmp	byte_70476, 0
		jnz	short loc_50A00
		jmp	loc_50E40
; ���������������������������������������������������������������������������

loc_50A00:				; CODE XREF: UIScreen_RenderGraphVGA_509EE+Dj
		mov	ax, word_70E60
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word_6E343
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	0
		push	word_6E343

loc_50A1C:
		call	Widget_Method_Dispatch8_6083F

loc_50A21:
		add	sp, 4

loc_50A24:
		push	large 0A0000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	word_7045C
		call	DisplayCache_ComputeChecksum_5D43F
		push	ax
		call	DisplayCache_Helper_5D76B
		push	dx
		push	ax
		push	word_6E1BD
		push	word_724AC
		push	3
		push	33A4h
		lea	ax, [bp+var_76]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3444h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 12h
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		pop	eax
		mov	edx, dword_72C38
		sub	edx, eax
		mov	[bp+var_6], edx
		push	0
		push	3
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		add	sp, 6
		push	dx
		push	ax
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		push	large [bp+var_6]
		push	3479h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 10h
		push	large 140000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	eax, dword_72B8E
		sub	eax, dword_72B8A
		push	eax
		mov	eax, dword_72B8A
		sub	eax, dword_72B86
		push	eax
		mov	eax, dword_72B86
		sub	eax, dword_72B82
		push	eax
		push	large [dword_704F0]
		push	large [dword_704EC]
		push	word ptr dword_704E8
		mov	eax, dword_72B82

loc_50B15:
		sub	eax, dword_72B7E
		push	eax

loc_50B1C:
		mov	eax, dword_72B7E

loc_50B20:
		sub	eax, dword_72B7A
		push	eax
		mov	eax, dword_72B8E
		sub	eax, dword_72B7A

loc_50B30:
		push	eax

loc_50B32:
		push	34A6h

loc_50B35:
		lea	ax, [bp+var_62]
		push	ax

loc_50B39:
		call	CRT_Msg_Sprintf1

loc_50B3E:
		add	sp, 26h

loc_50B41:
		push	large 1E0000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	eax, dword_72BA6
		sub	eax, dword_72BA2
		push	eax
		mov	eax, dword_72BA2
		sub	eax, dword_72B9E
		push	eax
		mov	eax, dword_72B9E
		sub	eax, dword_72B9A
		push	eax
		mov	eax, dword_72B9A
		sub	eax, dword_72B96
		push	eax
		mov	eax, dword_72BA6
		sub	eax, dword_72B96
		push	eax
		push	34E3h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	large 280000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	eax, dword_72B9E
		sub	eax, dword_72BB2
		push	eax
		mov	eax, dword_72BB2
		sub	eax, dword_72BAE
		push	eax
		mov	eax, dword_72BAE
		sub	eax, dword_72BAA
		push	eax
		mov	eax, dword_72BAA
		sub	eax, dword_72B9A
		push	eax
		mov	eax, dword_72B9E
		sub	eax, dword_72B9A
		push	eax
		push	350Dh
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h

loc_50C11:
		push	large 320000h
		push	word_6E343

loc_50C1B:
		call	Widget_ComputeBoundsExtent_60AEB

loc_50C20:
		add	sp, 6

loc_50C23:
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1

loc_50C30:
		add	sp, 4
		push	large [dword_72BC2]
		push	large [dword_72BBE]
		push	large [dword_72BBA]
		push	large [dword_72BB6]
		mov	eax, dword_72B9A
		sub	eax, dword_72B96
		push	eax
		push	3537h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	large 3C0000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	ax, word ptr dword_72C34
		sub	ax, word ptr dword_72C30
		push	ax
		mov	ax, word ptr dword_72C30

loc_50C8E:
		sub	ax, word ptr dword_72C2C
		push	ax

loc_50C93:
		mov	ax, word ptr dword_72C28

loc_50C96:
		sub	ax, word ptr dword_72C24
		push	ax
		mov	ax, word ptr dword_72BDA
		sub	ax, word ptr dword_72BD6
		push	ax
		push	3561h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		push	large 460000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	eax, dword_706AB
		sar	eax, 8
		mov	[bp+var_A], eax
		push	eax
		push	3581h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	large 500000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		xor	ax, ax
		mov	[bp+var_12], ax
		mov	[bp+var_10], ax
		mov	[bp+var_E], ax
		mov	dx, ax
		mov	ax, dx

loc_50D22:
		mov	[bp+var_C], ax
		mov	di, ax
		mov	cx, di
		xor	si, si
		jmp	short loc_50D6A
; ���������������������������������������������������������������������������

loc_50D2D:				; CODE XREF: UIScreen_RenderGraphVGA_509EE+37Fj
		mov	al, [si+5B2Eh]

loc_50D31:
		mov	ah, 0
		add	cx, ax
		mov	al, [si+5B38h]
		mov	ah, 0
		add	di, ax
		mov	al, [si+5B42h]
		mov	ah, 0

loc_50D43:
		add	[bp+var_C], ax
		mov	al, [si+5B4Ch]
		mov	ah, 0
		add	dx, ax
		mov	al, [si+5B56h]
		mov	ah, 0
		add	[bp+var_E], ax
		mov	al, [si+5B60h]
		mov	ah, 0
		add	[bp+var_10], ax
		mov	al, [si+5B6Ah]
		mov	ah, 0
		add	[bp+var_12], ax
		inc	si

loc_50D6A:				; CODE XREF: UIScreen_RenderGraphVGA_509EE+33Dj
		cmp	si, 0Ah
		jl	short loc_50D2D
		mov	ax, dx
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_C]
		cwd
		idiv	bx
		push	ax
		mov	ax, di
		cwd
		idiv	bx
		push	ax
		mov	ax, cx
		cwd
		idiv	bx
		push	ax
		push	358Ch
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch

loc_50D9A:
		push	large 5A0000h

loc_50DA0:
		push	word_6E343

loc_50DA4:
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	ax, [bp+var_12]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_10]
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_E]
		cwd
		idiv	bx
		push	ax
		push	35B9h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		push	large 640000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	ax, word_704E6
		inc	ax
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	word_704E6, dx
		mov	bx, word_704E6
		mov	al, 0
		mov	[bx+5B6Ah], al
		mov	[bx+5B60h], al
		mov	[bx+5B56h], al
		mov	[bx+5B4Ch], al
		mov	[bx+5B42h], al
		mov	[bx+5B38h], al

loc_50E31:
		mov	[bx+5B2Eh], al

loc_50E35:
		xor	eax, eax

loc_50E38:
		mov	dword_704EC, eax

loc_50E3C:
		mov	dword_704E8, eax

loc_50E40:				; CODE XREF: UIScreen_RenderGraphVGA_509EE+Fj
		pop	di
		pop	si
		leave

locret_50E43:
		retf
UIScreen_RenderGraphVGA_509EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe appelant UIScreen_RenderGraphVGA_509EE.
; ==============================================================================================
UIScreen_RenderGraphVGA_Wrapper_50E44	proc far		; CODE XREF: seg065:01EBP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr UIScreen_RenderGraphVGA_509EE
		pop	cx
		push	si
		push	59C3h
		call	Container_NotifyAllActive
		add	sp, 4
		pop	si
		pop	bp
		retf
UIScreen_RenderGraphVGA_Wrapper_50E44	endp

seg113		ends
