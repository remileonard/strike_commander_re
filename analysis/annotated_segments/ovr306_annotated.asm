ovr306		segment	para public 'OVERLAY' use16
		assume cs:ovr306
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 218 lignes, NON DÉTAILLÉE — combine CRT_MemFamily_Extra4 et Math_RandomScale_54DF4
; (seg115, répété) — calcul de forces aléatoires pour la dispersion de débris.
; ==============================================================================================
Debris_ComputeRandomizedForces_9C9A0	proc far		; CODE XREF: VROOMM_StubThunk_6C0E0J

var_54		= word ptr -54h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_6]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+84h]
		add	sp, 4
		mov	si, ax
		or	si, si
		jg	short loc_9C9CD
		jmp	loc_9CB28
; ���������������������������������������������������������������������������

loc_9C9CD:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+28j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		cmp	ax, word_722E6
		jnz	short loc_9C9E3
		sar	si, 1
		or	si, si
		jnz	short loc_9C9E3
		mov	si, 1

loc_9C9E3:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+38j
					; Debris_ComputeRandomizedForces_9C9A0+3Ej
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		xor	di, di
		push	large [bp+arg_6]
		push	ds
		push	offset aBigspher_1 ; "BIGSPHER"
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_9CA34
		mov	ax, 4
		call	Math_RandomScale_54DF4
		mov	dx, ax
		cmp	dx, 2
		jge	short loc_9CA1D
		mov	word ptr [bp+var_4+2], ds
		mov	word ptr [bp+var_4], 2387h
		jmp	short loc_9CA34
; ���������������������������������������������������������������������������

loc_9CA1D:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+71j
		cmp	dx, 2
		jnz	short loc_9CA2C
		mov	word ptr [bp+var_4+2], ds
		mov	word ptr [bp+var_4], 2390h
		jmp	short loc_9CA34
; ���������������������������������������������������������������������������

loc_9CA2C:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+80j
		mov	word ptr [bp+var_4+2], ds
		mov	word ptr [bp+var_4], 2396h

loc_9CA34:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+62j
					; Debris_ComputeRandomizedForces_9C9A0+7Bj ...
		mov	[bp+var_A], 0
		jmp	short loc_9CA77
; ���������������������������������������������������������������������������

loc_9CA3B:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+E1j
		push	large [bp+var_4]
		mov	ax, word ptr [bp+var_8]
		add	ax, 0Bh
		push	word ptr [bp+var_8+2]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_9CA70
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_54]
		add	bx, ax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		mov	[bx+2],	ax
		mov	[bx], dx
		inc	di
		cmp	di, 10h
		jg	short loc_9CA83

loc_9CA70:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+B3j
		inc	[bp+var_A]
		add	word ptr [bp+var_8], 14h

loc_9CA77:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+99j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		cmp	ax, [bp+var_A]
		jg	short loc_9CA3B

loc_9CA83:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+CEj
		mov	ax, di

loc_9CA85:
		call	Math_RandomScale_54DF4
		mov	cx, ax

loc_9CA8C:
		mov	[bp+var_C], di
		mov	[bp+var_E], si

loc_9CA92:
		jmp	loc_9CB19
; ���������������������������������������������������������������������������

loc_9CA95:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+185j
		mov	bx, cx
		shl	bx, 2
		lea	ax, [bp+var_54]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		les	bx, [bp+var_12]
		push	es
		mov	si, word ptr [bp+var_12]
		mov	dl, es:[si]
		pop	es
		sub	dl, es:[bx+1]
		mov	al, byte ptr [bp+var_E]
		mov	[bp+var_13], al
		mov	al, dl
		mov	ah, 0

loc_9CAC3:
		cmp	ax, [bp+var_E]
		jge	short loc_9CACB
		mov	[bp+var_13], dl

loc_9CACB:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+126j
		mov	al, [bp+var_13]
		mov	[bp+var_14], al
		les	bx, [bp+var_12]
		mov	al, es:[bx]
		mov	ah, 0
		mov	dl, es:[bx+1]
		mov	dh, 0
		sub	ax, dx
		mov	dl, [bp+var_14]

loc_9CAE4:
		mov	dh, 0
		cmp	ax, dx
		jge	short loc_9CAF8
		push	es
		mov	si, word ptr [bp+var_12]
		mov	al, es:[si]
		pop	es
		mov	es:[bx+1], al
		jmp	short loc_9CB02
; ���������������������������������������������������������������������������

loc_9CAF8:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+148j
		les	bx, [bp+var_12]
		mov	al, [bp+var_14]
		add	es:[bx+1], al

loc_9CB02:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+156j
		mov	al, [bp+var_13]
		mov	ah, 0
		sub	[bp+var_E], ax
		dec	[bp+var_C]
		mov	ax, di
		dec	ax
		cmp	ax, cx
		jnz	short loc_9CB18
		xor	cx, cx
		jmp	short loc_9CB19
; ���������������������������������������������������������������������������

loc_9CB18:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+172j
		inc	cx

loc_9CB19:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0:loc_9CA92j
					; Debris_ComputeRandomizedForces_9C9A0+176j
		cmp	[bp+var_E], 0
		jle	short loc_9CB28
		cmp	[bp+var_C], 0
		jz	short loc_9CB28
		jmp	loc_9CA95
; ���������������������������������������������������������������������������

loc_9CB28:				; CODE XREF: Debris_ComputeRandomizedForces_9C9A0+2Aj
					; Debris_ComputeRandomizedForces_9C9A0+17Dj ...
		pop	di
		pop	si
		leave
		retf
Debris_ComputeRandomizedForces_9C9A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_MemFamily_Extra4 (99 lignes).
; ==============================================================================================
Debris_AllocateFamily_9CB2C	proc far		; CODE XREF: VROOMM_StubThunk_6C0E5J

var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	[bp+var_4], 0
		mov	[bp+var_8], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		xor	si, si
		jmp	short loc_9CBA0
; ���������������������������������������������������������������������������

loc_9CB53:				; CODE XREF: Debris_AllocateFamily_9CB2C+7Bj
		les	bx, [bp+var_C]
		mov	al, es:[bx]
		mov	ah, 0
		mov	di, ax
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_1C], ax
		push	ds
		push	offset aPlayer_1 ; "PLAYER"
		mov	ax, word ptr [bp+var_C]
		add	ax, 2
		push	word ptr [bp+var_C+2]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_9CB8A

loc_9CB80:
		cmp	[bp+var_1C], di

loc_9CB83:
		jl	short loc_9CB8A

loc_9CB85:
		mov	ax, 64h	; 'd'
		jmp	short loc_9CBD9
; ���������������������������������������������������������������������������

loc_9CB8A:				; CODE XREF: Debris_AllocateFamily_9CB2C+52j
					; Debris_AllocateFamily_9CB2C:loc_9CB83j
		movsx	eax, di
		add	[bp+var_4], eax
		movsx	eax, [bp+var_1C]
		add	[bp+var_8], eax
		inc	si
		add	word ptr [bp+var_C], 14h

loc_9CBA0:				; CODE XREF: Debris_AllocateFamily_9CB2C+25j
		les	bx, [bp+arg_0]

loc_9CBA3:
		cmp	es:[bx+4], si
		jg	short loc_9CB53

loc_9CBA9:
		mov	eax, [bp+var_8]

loc_9CBAD:
		imul	eax, 64h

loc_9CBB1:
		mov	[bp+var_16], eax

loc_9CBB5:
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_12]
		cdq
		idiv	[bp+var_1A]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[bp+var_E], ax

loc_9CBD9:				; CODE XREF: Debris_AllocateFamily_9CB2C+5Cj
		pop	di
		pop	si
		leave
		retf
Debris_AllocateFamily_9CB2C	endp

ovr306		ends
