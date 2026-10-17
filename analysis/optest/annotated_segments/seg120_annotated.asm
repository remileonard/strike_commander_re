seg120		segment	byte public 'CODE' use16
		assume cs:seg120
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawTextString_61CD2 (sub_61CD2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 496 lignes, NON DÉTAILLÉE — référencée via
; vtable (DATA XREF seg216), gros buffer local (0x158 octets), copie un descripteur de
; contexte (6 mots) et prend un pointeur far vers une chaîne (arg_6) et une couleur (arg_C).
; Référencée par GlyphObject_ResolveAndCache_605CE (seg162) et depuis seg034 — probable rendu
; d'une chaîne de caractères complète avec clipping (rasterisation de texte). Candidat pour
; session dédiée.
; ==============================================================================================
Render_DrawTextString_32A58	proc far		; CODE XREF: GlyphObject_ResolveAndCache_31296+3FP

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
		push	di
		push	ds
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_10]
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
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	[si+4],	bx
		jb	short loc_32A98
		jnz	short loc_32A9B

loc_32A98:				; CODE XREF: Render_DrawTextString_32A58+3Cj
		jmp	loc_32B53
; ���������������������������������������������������������������������������

loc_32A9B:				; CODE XREF: Render_DrawTextString_32A58+3Ej
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
		add	ax, [bp+var_154]
		cmp	ax, [bp+var_8]
		jg	short loc_32AE3
		mov	ax, [bp+var_154]
		sub	ax, [si+2]
		cmp	ax, [bp+var_C]
		jl	short loc_32AD5
		mov	ax, [bp+var_156]
		sub	ax, [si+4]
		cmp	ax, [bp+var_A]

loc_32AD5:				; CODE XREF: Render_DrawTextString_32A58+71j
		jge	short loc_32AD9
		jmp	short loc_32B58
; ���������������������������������������������������������������������������

loc_32AD9:				; CODE XREF: Render_DrawTextString_32A58:loc_32AD5j
		mov	ax, [si+6]
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_6]

loc_32AE3:				; CODE XREF: Render_DrawTextString_32A58+65j
		jg	short loc_32B58
		mov	dx, ds
		add	si, 8

loc_32AEA:				; CODE XREF: Render_DrawTextString_32A58+C3j
					; Render_DrawTextString_32A58+E3j ...
		lodsw
		or	ax, ax
		jz	short loc_32B5E
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
		shr	cx, 1
		jb	short loc_32B1D
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_32AEA
; ���������������������������������������������������������������������������

loc_32B1D:				; CODE XREF: Render_DrawTextString_32A58+B3j
		mov	bx, cx

loc_32B1F:				; CODE XREF: Render_DrawTextString_32A58+E1j
					; Render_DrawTextString_32A58+F7j
		lodsb
		shr	al, 1
		cbw
		push	ax
		mov	cx, ax
		jb	short loc_32B3D
		mov	ax, [bp+var_158]
		add	si, cx
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_32B1F
		jmp	short loc_32AEA
; ���������������������������������������������������������������������������

loc_32B3D:				; CODE XREF: Render_DrawTextString_32A58+CEj
		pop	ax
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_32B1F
		jmp	short loc_32AEA
; ���������������������������������������������������������������������������

loc_32B53:				; CODE XREF: Render_DrawTextString_32A58:loc_32A98j
					; Render_DrawTextString_32A58:loc_32B5Ej
		pop	ds
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_32B58:				; CODE XREF: Render_DrawTextString_32A58+7Fj
					; Render_DrawTextString_32A58:loc_32AE3j
		add	si, 8

loc_32B5B:				; CODE XREF: Render_DrawTextString_32A58+16Aj
					; Render_DrawTextString_32A58+17Cj ...
		lodsw
		shr	ax, 1

loc_32B5E:				; CODE XREF: Render_DrawTextString_32A58+95j
		jz	short loc_32B53
		mov	cx, ax
		jnb	short loc_32B66
		jmp	short loc_32BDA
; ���������������������������������������������������������������������������

loc_32B66:				; CODE XREF: Render_DrawTextString_32A58+10Aj
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_32BD6
		cmp	ax, [bp+var_6]
		jg	short loc_32BD6
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_32BD6
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_32BD6
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		mov	ax, [bp+var_C]
		mov	bx, [bp+var_8]
		sub	ax, dx
		jle	short loc_32BA9
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_32BA9:				; CODE XREF: Render_DrawTextString_32A58+147j
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_32BC4
		add	si, cx
		sub	cx, dx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_32B5B
; ���������������������������������������������������������������������������

loc_32BC4:				; CODE XREF: Render_DrawTextString_32A58+156j
		add	si, cx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_32B5B
; ���������������������������������������������������������������������������

loc_32BD6:				; CODE XREF: Render_DrawTextString_32A58+11Dj
					; Render_DrawTextString_32A58+122j ...
		add	si, cx
		jmp	short loc_32B5B
; ���������������������������������������������������������������������������

loc_32BDA:				; CODE XREF: Render_DrawTextString_32A58+10Cj
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_32C4C
		cmp	ax, [bp+var_6]
		jg	short loc_32C4C
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_32C4C
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_32C4C
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		sub	ax, [bp+var_8]
		jg	short loc_32C5F
		sub	dx, [bp+var_C]
		jl	short loc_32C5F
		mov	bx, cx

loc_32C17:				; CODE XREF: Render_DrawTextString_32A58+1D9j
					; Render_DrawTextString_32A58+1EFj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_32C36
		push	ax
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_32C17
		jmp	loc_32B5B
; ���������������������������������������������������������������������������

loc_32C36:				; CODE XREF: Render_DrawTextString_32A58+1C5j
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_32C17
		jmp	loc_32B5B
; ���������������������������������������������������������������������������

loc_32C4C:				; CODE XREF: Render_DrawTextString_32A58+191j
					; Render_DrawTextString_32A58+196j ...
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_32C58
		add	si, ax
		dec	si

loc_32C58:				; CODE XREF: Render_DrawTextString_32A58+1FBj
		sub	cx, ax
		jnz	short loc_32C4C
		jmp	loc_32B5B
; ���������������������������������������������������������������������������

loc_32C5F:				; CODE XREF: Render_DrawTextString_32A58+1B6j
					; Render_DrawTextString_32A58+1BBj
		mov	[bp+var_152], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_150]

loc_32C6E:				; CODE XREF: Render_DrawTextString_32A58+230j
					; Render_DrawTextString_32A58+245j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_32C8C
		add	si, cx
		sub	bx, ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_32C6E
		jmp	short loc_32C9F
; ���������������������������������������������������������������������������

loc_32C8C:				; CODE XREF: Render_DrawTextString_32A58+21Cj
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_32C6E

loc_32C9F:				; CODE XREF: Render_DrawTextString_32A58+232j
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
		jge	short loc_32CB8
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_32CB8:				; CODE XREF: Render_DrawTextString_32A58+258j
		cmp	[bp+var_152], 0
		jle	short loc_32CC7
		sub	cx, [bp+var_152]
		mov	ax, [bp+var_152]

loc_32CC7:				; CODE XREF: Render_DrawTextString_32A58+265j
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		pop	si
		pop	ds
		jmp	loc_32B5B
Render_DrawTextString_32A58	endp

seg120		ends
