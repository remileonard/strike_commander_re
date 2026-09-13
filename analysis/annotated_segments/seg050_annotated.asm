seg050		segment	byte public 'CODE' use16
		assume cs:seg050
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — remplit une zone mémoire (0x19 octets) de zéros et pré-remplit une sous-zone
; (offset+0x19) avec la constante 0x7D00000 (memset via sub_22E1) : initialisation d'une
; structure de contrôleur/axe avec valeur de calibration par défaut.
; ==============================================================================================
Controller_InitStructDefault	proc far		; CODE XREF: seg050:01E6p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 7D00000h
		mov	ax, si
		add	ax, 19h
		push	ax
		call	CRT_Memset_Public
		add	sp, 6
		xor	ax, ax
		jmp	short loc_28CBE
; ���������������������������������������������������������������������������

loc_28CB8:				; CODE XREF: Controller_InitStructDefault+28j
		mov	bx, ax
		mov	byte ptr [bx+si], 0
		inc	ax

loc_28CBE:				; CODE XREF: Controller_InitStructDefault+1Dj
		cmp	ax, 19h
		jl	short loc_28CB8
		pop	si
		pop	bp
		retf
Controller_InitStructDefault	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	di, 19h
		jnb	short loc_28CF6
		push	large 500000h
		mov	ax, di
		imul	ax, 50h
		mov	dx, si
		add	dx, ax
		add	dx, 19h
		push	dx
		call	CRT_Memset_Public
		add	sp, 6
		mov	bx, di
		mov	byte ptr [bx+si], 0

loc_28CF6:				; CODE XREF: seg050:0044j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ch]
		cmp	word_6E343, 0
		jz	short loc_28D59
		or	di, di
		jz	short loc_28D59
		cmp	byte ptr [di], 0
		jz	short loc_28D59
		cmp	word ptr [bp+0Ah], 19h
		jnb	short loc_28D59
		cmp	word ptr [bp+8], 50h ; 'P'
		jnb	short loc_28D59
		push	di
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		mov	bx, 50h	; 'P'
		sub	bx, [bp+8]
		cmp	dx, bx
		jle	short loc_28D36
		mov	dx, bx

loc_28D36:				; CODE XREF: seg050:00A2j
		push	dx
		push	di
		mov	ax, [bp+0Ah]
		imul	ax, 50h
		add	ax, [bp+8]

loc_28D41:
		mov	dx, si

loc_28D43:
		add	dx, ax

loc_28D45:
		add	dx, 19h
		push	dx
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, si

loc_28D53:
		add	bx, [bp+0Ah]
		mov	byte ptr [bx], 1

loc_28D59:				; CODE XREF: seg050:007Aj seg050:007Ej ...
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 70h
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-1Eh], 0
		mov	word ptr [bp-1Ch], 0
		mov	byte ptr [bp-11h], 0
		cmp	word ptr [bp+8], 0
		jz	short loc_28DBF
		mov	ax, word_6E343
		add	ax, 2
		push	ax
		lea	ax, [bp-1Eh]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	bx, word_6E343
		mov	al, [bx+17h]
		mov	ah, 0
		mov	[bp-2],	ax
		mov	ax, [bp+8]
		mov	[bp-4],	ax
		push	ax
		mov	ax, word_6E343
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	0
		push	word_6E343
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4

loc_28DBF:				; CODE XREF: seg050:00EAj
		mov	word ptr [bp-6], 0
		mov	ax, si
		add	ax, 19h
		mov	[bp-8],	ax
		mov	word ptr [bp-0Ah], 0
		jmp	loc_28E6B
; ���������������������������������������������������������������������������

loc_28DD4:				; CODE XREF: seg050:01E1j
		mov	bx, [bp-0Ah]
		cmp	byte ptr [bx+si], 0
		jnz	short loc_28DDF
		jmp	loc_28E60
; ���������������������������������������������������������������������������

loc_28DDF:				; CODE XREF: seg050:014Aj
		mov	di, [bp-8]
		mov	word ptr [bp-0Ch], 0
		jmp	short loc_28E5A
; ���������������������������������������������������������������������������

loc_28DE9:				; CODE XREF: seg050:01CEj
		cmp	byte ptr [di], 0
		jz	short loc_28E56
		mov	ax, [bp-0Ch]
		shl	ax, 2
		mov	[bp-0Eh], ax
		mov	word ptr [bp-10h], 0
		inc	word ptr [bp-0Ch]
		jmp	short loc_28E0C
; ���������������������������������������������������������������������������

loc_28E01:				; CODE XREF: seg050:0185j
		inc	word ptr [bp-0Ch]
		mov	ax, [bp-0Ch]
		cmp	ax, 50h	; 'P'
		jz	short loc_28E17

loc_28E0C:				; CODE XREF: seg050:016Fj
		inc	word ptr [bp-10h]
		mov	bx, [bp-10h]
		cmp	byte ptr [bx+di], 0
		jnz	short loc_28E01

loc_28E17:				; CODE XREF: seg050:017Aj
		push	word ptr [bp-6]
		push	word ptr [bp-0Eh]
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	word ptr [bp-10h]
		push	di
		lea	ax, [bp-70h]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		add	di, [bp-10h]
		lea	ax, [bp-70h]
		mov	bx, [bp-10h]
		add	bx, ax
		mov	byte ptr [bx], 0
		push	ax
		push	word_6E343

loc_28E4C:
		call	Widget_RenderComplexLayoutWrapper_60DD1

loc_28E51:
		add	sp, 4
		jmp	short loc_28E5A
; ���������������������������������������������������������������������������

loc_28E56:				; CODE XREF: seg050:015Cj
		inc	word ptr [bp-0Ch]
		inc	di

loc_28E5A:				; CODE XREF: seg050:0157j seg050:01C4j
		cmp	word ptr [bp-0Ch], 50h ; 'P'
		jl	short loc_28DE9

loc_28E60:				; CODE XREF: seg050:014Cj
		inc	word ptr [bp-0Ah]
		add	word ptr [bp-6], 8
		add	word ptr [bp-8], 50h ; 'P'

loc_28E6B:				; CODE XREF: seg050:0141j
		cmp	word ptr [bp-0Ah], 19h
		jge	short loc_28E74
		jmp	loc_28DD4
; ���������������������������������������������������������������������������

loc_28E74:				; CODE XREF: seg050:01DFj
		push	si
		push	cs
		call	near ptr Controller_InitStructDefault
		pop	cx
		cmp	word ptr [bp+8], 0
		jz	short loc_28EA3
		lea	ax, [bp-1Eh]
		push	ax
		mov	ax, word_6E343
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	al, [bp-2]
		push	ax
		push	word_6E343
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4

loc_28EA3:				; CODE XREF: seg050:01EEj
		lea	ax, [bp-1Eh]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	di
		pop	si
		leave

locret_28EB0:
		retf
seg050		ends
