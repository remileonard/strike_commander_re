seg173		segment	byte public 'CODE' use16
		assume cs:seg173
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 496 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216), gros buffer
; local (0x158 octets), copie un descripteur de contexte (6 mots) et prend un pointeur far
; vers une chaîne (arg_6) et une couleur (arg_C). Référencée par
; GlyphObject_ResolveAndCache_605CE (seg162) et depuis seg034 — probable rendu d'une chaîne de
; caractères complète avec clipping (rasterisation de texte). Candidat pour session dédiée.
; ==============================================================================================
Render_DrawTextString_61CD2	proc far		; CODE XREF: seg034:05D4P
					; GlyphObject_ResolveAndCache_605CE+3FP

var_158		= word ptr -158h
var_156		= word ptr -156h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_150		= word ptr -150h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		enter	158h, 0
		push	si

loc_61CD7:
		push	di
		push	ds

loc_61CD9:
		cld
		push	ss
		pop	es

loc_61CDC:				; DATA XREF: seg216:062Eo
		mov	si, [bp+arg_0]

loc_61CDF:
		lea	di, [bp+var_10]

loc_61CE2:
		mov	cx, 6
		rep movsw
		mov	ax, [bp+arg_2]
		mov	[bp+var_154], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_156], ax
		mov	ax, [bp+arg_C]
		mov	ah, al
		mov	[bp+var_158], ax
		mov	es, [bp+var_10]

loc_61D01:
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	[si+4],	bx
		jb	short loc_61D12
		jnz	short loc_61D15

loc_61D12:				; CODE XREF: Render_DrawTextString_61CD2+3Cj
		jmp	loc_61DCD
; ���������������������������������������������������������������������������

loc_61D15:				; CODE XREF: Render_DrawTextString_61CD2+3Ej
		xor	eax, eax
		mov	ax, ds
		shl	eax, 4
		add	ax, si
		add	eax, [bx+si]
		mov	si, ax
		and	si, 0Fh
		shr	eax, 4
		mov	ds, ax
		mov	ax, [si]

loc_61D30:
		add	ax, [bp+var_154]
		cmp	ax, [bp+var_8]
		jg	short loc_61D5D

loc_61D39:
		mov	ax, [bp+var_154]

loc_61D3D:
		sub	ax, [si+2]

loc_61D40:
		cmp	ax, [bp+var_C]

loc_61D43:
		jl	short loc_61D4F

loc_61D45:
		mov	ax, [bp+var_156]
		sub	ax, [si+4]

loc_61D4C:
		cmp	ax, [bp+var_A]

loc_61D4F:				; CODE XREF: Render_DrawTextString_61CD2:loc_61D43j
		jge	short loc_61D53
		jmp	short loc_61DD2
; ���������������������������������������������������������������������������

loc_61D53:				; CODE XREF: Render_DrawTextString_61CD2:loc_61D4Fj
		mov	ax, [si+6]
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_6]

loc_61D5D:				; CODE XREF: Render_DrawTextString_61CD2+65j
		jg	short loc_61DD2
		mov	dx, ds
		add	si, 8

loc_61D64:				; CODE XREF: Render_DrawTextString_61CD2+C3j
					; Render_DrawTextString_61CD2+E3j ...
		lodsw
		or	ax, ax
		jz	short loc_61DD8
		mov	cx, ax
		lodsw
		add	ax, [bp+var_154]
		mov	di, ax
		lodsw
		add	ax, [bp+var_156]
		shl	ax, 1
		mov	bx, [bp+var_E]
		add	bx, ax
		add	di, ss:[bx]
		mov	ds, dx

loc_61D83:
		shr	cx, 1
		jb	short loc_61D97
		add	si, cx

loc_61D89:
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx

loc_61D93:
		rep stosb
		jmp	short loc_61D64
; ���������������������������������������������������������������������������

loc_61D97:				; CODE XREF: Render_DrawTextString_61CD2+B3j
		mov	bx, cx

loc_61D99:				; CODE XREF: Render_DrawTextString_61CD2+E1j
					; Render_DrawTextString_61CD2+F7j
		lodsb
		shr	al, 1
		cbw
		push	ax
		mov	cx, ax
		jb	short loc_61DB7
		mov	ax, [bp+var_158]
		add	si, cx
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_61D99
		jmp	short loc_61D64
; ���������������������������������������������������������������������������

loc_61DB7:				; CODE XREF: Render_DrawTextString_61CD2+CEj
		pop	ax
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw

loc_61DC3:
		adc	cx, cx
		rep stosb

loc_61DC7:
		or	bx, bx
		jnz	short loc_61D99
		jmp	short loc_61D64
; ���������������������������������������������������������������������������

loc_61DCD:				; CODE XREF: Render_DrawTextString_61CD2:loc_61D12j
					; Render_DrawTextString_61CD2:loc_61DD8j
		pop	ds
		pop	di
		pop	si
		leave

locret_61DD1:
		retf
; ���������������������������������������������������������������������������

loc_61DD2:				; CODE XREF: Render_DrawTextString_61CD2+7Fj
					; Render_DrawTextString_61CD2:loc_61D5Dj
		add	si, 8

loc_61DD5:				; CODE XREF: Render_DrawTextString_61CD2:loc_61E3Cj
					; Render_DrawTextString_61CD2:loc_61E4Ej	...
		lodsw

loc_61DD6:
		shr	ax, 1

loc_61DD8:				; CODE XREF: Render_DrawTextString_61CD2+95j
		jz	short loc_61DCD

loc_61DDA:
		mov	cx, ax
		jnb	short loc_61DE0

loc_61DDE:
		jmp	short loc_61E54
; ���������������������������������������������������������������������������

loc_61DE0:				; CODE XREF: Render_DrawTextString_61CD2+10Aj
		lodsw

loc_61DE1:
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_61E50
		cmp	ax, [bp+var_6]
		jg	short loc_61E50
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_61E50
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_61E50
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		mov	ax, [bp+var_C]
		mov	bx, [bp+var_8]
		sub	ax, dx
		jle	short loc_61E23
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_61E23:				; CODE XREF: Render_DrawTextString_61CD2+147j
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_61E3E
		add	si, cx
		sub	cx, dx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx

loc_61E39:
		rep stosb
		pop	ax

loc_61E3C:
		jmp	short loc_61DD5
; ���������������������������������������������������������������������������

loc_61E3E:				; CODE XREF: Render_DrawTextString_61CD2+156j
		add	si, cx
		push	ax

loc_61E41:
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax

loc_61E4E:
		jmp	short loc_61DD5
; ���������������������������������������������������������������������������

loc_61E50:				; CODE XREF: Render_DrawTextString_61CD2+11Dj
					; Render_DrawTextString_61CD2+122j ...
		add	si, cx

loc_61E52:
		jmp	short loc_61DD5
; ���������������������������������������������������������������������������

loc_61E54:				; CODE XREF: Render_DrawTextString_61CD2:loc_61DDEj
		lodsw

loc_61E55:
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_61EC6
		cmp	ax, [bp+var_6]
		jg	short loc_61EC6
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_61EC6
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_61EC6
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx

loc_61E85:
		sub	ax, [bp+var_8]
		jg	short loc_61ED9

loc_61E8A:
		sub	dx, [bp+var_C]
		jl	short loc_61ED9
		mov	bx, cx

loc_61E91:				; CODE XREF: Render_DrawTextString_61CD2+1D9j
					; Render_DrawTextString_61CD2+1EFj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_61EB0
		push	ax
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_61E91
		jmp	loc_61DD5
; ���������������������������������������������������������������������������

loc_61EB0:				; CODE XREF: Render_DrawTextString_61CD2+1C5j
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_61E91
		jmp	loc_61DD5
; ���������������������������������������������������������������������������

loc_61EC6:				; CODE XREF: Render_DrawTextString_61CD2+191j
					; Render_DrawTextString_61CD2+196j ...
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_61ED2
		add	si, ax

loc_61ED1:
		dec	si

loc_61ED2:				; CODE XREF: Render_DrawTextString_61CD2+1FBj
		sub	cx, ax

loc_61ED4:
		jnz	short loc_61EC6

loc_61ED6:
		jmp	loc_61DD5
; ���������������������������������������������������������������������������

loc_61ED9:				; CODE XREF: Render_DrawTextString_61CD2+1B6j
					; Render_DrawTextString_61CD2+1BBj
		mov	[bp+var_152], ax
		mov	bx, cx
		push	cx
		push	es
		push	di

loc_61EE2:
		push	ss

loc_61EE3:
		pop	es

loc_61EE4:
		lea	di, [bp+var_150]

loc_61EE8:				; CODE XREF: Render_DrawTextString_61CD2+230j
					; Render_DrawTextString_61CD2+245j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_61F06

loc_61EF0:
		add	si, cx

loc_61EF2:
		sub	bx, ax

loc_61EF4:
		mov	ax, [bp+var_158]

loc_61EF8:
		shr	cx, 1
		rep stosw
		adc	cx, cx

loc_61EFE:
		rep stosb
		or	bx, bx
		jnz	short loc_61EE8

loc_61F04:
		jmp	short loc_61F19
; ���������������������������������������������������������������������������

loc_61F06:				; CODE XREF: Render_DrawTextString_61CD2+21Cj
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_61EE8

loc_61F19:				; CODE XREF: Render_DrawTextString_61CD2:loc_61F04j
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_150]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_61F32
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_61F32:				; CODE XREF: Render_DrawTextString_61CD2+258j
		cmp	[bp+var_152], 0

loc_61F37:
		jle	short loc_61F41

loc_61F39:
		sub	cx, [bp+var_152]

loc_61F3D:
		mov	ax, [bp+var_152]

loc_61F41:				; CODE XREF: Render_DrawTextString_61CD2:loc_61F37j
		mov	ax, [bp+var_158]

loc_61F45:
		shr	cx, 1

loc_61F47:
		rep movsw

loc_61F49:
		adc	cx, cx

loc_61F4B:
		rep movsb
		pop	si
		pop	ds

loc_61F4F:
		jmp	loc_61DD5
Render_DrawTextString_61CD2	endp

seg173		ends
