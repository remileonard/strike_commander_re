seg047		segment	byte public 'CODE' use16
		assume cs:seg047
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à VGA_LoadPalette
; (sub_2E801 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,54L — programme le DAC de palette VGA (port 0x3C8/0x3C9, synchronisation retrace
; via word_70EA0) avec une plage de triplets RGB : chargement de palette couleur VGA (bas
; niveau matériel).
; ==============================================================================================
VGA_LoadPalette	proc far		; CODE XREF: sub_1F0C9+232p
					; seg047:0955p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [si+3]
		mov	ah, [si+2]
		mov	cx, [si]
		mov	dx, 3C8h

loc_1EC11:				; CODE XREF: VGA_LoadPalette+48j
		test	cl, 7Fh
		jnz	short loc_1EC24
		mov	dx, word_47032

loc_1EC1A:				; CODE XREF: VGA_LoadPalette+1Ej
		in	al, dx
		test	al, 8
		jnz	short loc_1EC1A

loc_1EC1F:				; CODE XREF: VGA_LoadPalette+23j
		in	al, dx
		test	al, 8
		jz	short loc_1EC1F

loc_1EC24:				; CODE XREF: VGA_LoadPalette+15j
		mov	dx, 3C8h
		mov	al, ah
		inc	ah
		out	dx, al
		jmp	short $+2
		inc	dx
		mov	al, es:[bx]
		out	dx, al
		jmp	short $+2
		mov	al, es:[bx+1]
		out	dx, al
		jmp	short $+2
		mov	al, es:[bx+2]
		out	dx, al
		jmp	short $+2
		add	bx, 3
		dec	dx
		loop	loc_1EC11
		pop	si
		pop	bp
		retf
VGA_LoadPalette	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1EC4C	proc far		; CODE XREF: sub_C209D+BBP

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[si+2],	al
		add	word ptr [bp+arg_2], 2
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		mov	[si], ax
		add	word ptr [bp+arg_2], 2
		mov	ax, [si]
		shl	ax, 1
		add	ax, [si]
		mov	di, ax
		push	1
		push	0
		push	2
		movzx	eax, di
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+5],	dx
		mov	[si+3],	ax
		push	di
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		push	word ptr [si+5]
		push	word ptr [si+3]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_1EC4C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_DestructResource (sub_2E8A6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,21L — libère une
; chaîne (+3 via sub_5C7B6) et réinitialise le pointeur : destructeur de ressource palette.
; ==============================================================================================
Palette_DestructResource	proc far		; CODE XREF: sub_C1B7B+157P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		mov	ax, si
		add	ax, 3
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	dword ptr [si+3], 0
		pop	si
		pop	bp
		retf
Palette_DestructResource	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_ShadeTableFor_2E8CD (sub_2E8CD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des objets,
; OBJECT_RENDER.md). TABLE D'OMBRE ET DE BROUILLARD d'une couleur hors gamme (ex-
; Gauge_ResolveAndApplyLabel). Args (541Ah, intensité, profondeur 24.8) →
; Interp_ResolveNormalizedIndex_2F55E puis Text_ResolveTruncated_2E8F1 : pointeur de table de
; 256 o, ou 0 (couleur inchangée).
; ==============================================================================================
Palette_ShadeTableFor_1ECD2	proc far		; CODE XREF: seg042:0C3AP seg042:14C3P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_1FA62
		add	sp, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1ECF9
		add	sp, 4
		pop	si
		pop	bp
		retf
Palette_ShadeTableFor_1ECD2	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1ECF9	proc far		; CODE XREF: sub_149E9+2EP
					; sub_1B4C0+23P ...

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jnz	short loc_1ED15
		mov	[bp+var_4], 0
		jmp	short loc_1ED85
; ���������������������������������������������������������������������������

loc_1ED15:				; CODE XREF: sub_1ECF9+10j
		or	di, di
		jle	short loc_1ED48
		cmp	[si+52h], di
		jge	short loc_1ED21
		mov	di, [si+52h]

loc_1ED21:				; CODE XREF: sub_1ECF9+23j
		push	0
		mov	al, [si+62h]
		push	ax
		push	word ptr [si+60h]
		push	word ptr [si+5Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	bx, di
		dec	bx
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_1ED85
; ���������������������������������������������������������������������������

loc_1ED48:				; CODE XREF: sub_1ECF9+1Ej
		mov	[bp+var_6], di
		mov	ax, [bp+var_6]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	di, ax
		cmp	[si+52h], di
		jge	short loc_1ED5D
		mov	di, [si+52h]

loc_1ED5D:				; CODE XREF: sub_1ECF9+5Fj
		push	0
		mov	al, [si+62h]
		push	ax
		push	word ptr [si+60h]
		push	word ptr [si+5Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		add	ax, [si+50h]
		mov	bx, di
		dec	bx
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_1ED85:				; CODE XREF: sub_1ECF9+1Aj
					; sub_1ECF9+4Dj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_1ECF9	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1ED93	proc far		; CODE XREF: sub_1BE4D+22P
					; sub_1C289+24P ...

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_3], 0
		xor	cx, cx
		jmp	short loc_1EDF6
; ���������������������������������������������������������������������������

loc_1EDAE:				; CODE XREF: sub_1ED93+6Fj
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6],	di
		jg	short loc_1EDE8
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		push	ax
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		pop	ax
		add	ax, [bx+0Dh]
		cmp	ax, di
		jl	short loc_1EDE8
		mov	ax, 1
		jmp	short loc_1EDEA
; ���������������������������������������������������������������������������

loc_1EDE8:				; CODE XREF: sub_1ED93+2Aj
					; sub_1ED93+4Ej
		xor	ax, ax

loc_1EDEA:				; CODE XREF: sub_1ED93+53j
		or	al, al
		jz	short loc_1EDF5
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_1EDF5:				; CODE XREF: sub_1ED93+59j
		inc	cx

loc_1EDF6:				; CODE XREF: sub_1ED93+19j
		cmp	[si+58h], cx
		jle	short loc_1EE04
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1EDAE

loc_1EE04:				; CODE XREF: sub_1ED93+66j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_1ED93	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	word ptr [bp-2], 0FFFFh
		mov	byte ptr [bp-3], 0
		xor	cx, cx
		jmp	short loc_1EEA1
; ���������������������������������������������������������������������������

loc_1EE2A:				; CODE XREF: seg047:02BFj
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6],	di
		jg	short loc_1EE64
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		push	ax
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		pop	ax
		add	ax, [bx+0Dh]
		cmp	ax, di
		jl	short loc_1EE64
		mov	ax, 1
		jmp	short loc_1EE66
; ���������������������������������������������������������������������������

loc_1EE64:				; CODE XREF: seg047:0249j seg047:026Dj
		xor	ax, ax

loc_1EE66:				; CODE XREF: seg047:0272j
		or	al, al
		jz	short loc_1EEA0
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+2], 0
		jz	short loc_1EE93
		mov	ax, cx
		mov	dx, 0Fh
		imul	dx
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+3], 0
		jz	short loc_1EE93
		mov	ax, 1
		jmp	short loc_1EE95
; ���������������������������������������������������������������������������

loc_1EE93:				; CODE XREF: seg047:028Aj seg047:029Cj
		xor	ax, ax

loc_1EE95:				; CODE XREF: seg047:02A1j
		or	al, al
		jz	short loc_1EEA0
		mov	[bp-2],	cx
		mov	byte ptr [bp-3], 1

loc_1EEA0:				; CODE XREF: seg047:0278j seg047:02A7j
		inc	cx

loc_1EEA1:				; CODE XREF: seg047:0238j
		cmp	[si+58h], cx
		jle	short loc_1EEB2
		mov	al, [bp-3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1EEB2
		jmp	loc_1EE2A
; ���������������������������������������������������������������������������

loc_1EEB2:				; CODE XREF: seg047:02B4j seg047:02BDj
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1EEBD	proc far		; CODE XREF: sub_C19C8+57P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	eax, [di+7Ch]
		cmp	eax, [bp+arg_2]
		jg	short loc_1EEEB
		mov	ax, [di+44h]
		mov	dx, [di+42h]
		mov	bx, [di+46h]
		dec	bx
		mov	cl, [di+4Eh]
		shl	bx, cl
		shl	bx, 2
		add	dx, bx
		mov	[di+4Ah], ax
		mov	[di+48h], dx
		jmp	short loc_1EF0B
; ���������������������������������������������������������������������������

loc_1EEEB:				; CODE XREF: sub_1EEBD+10j
		mov	cl, [di+7Ah]
		mov	eax, [bp+arg_2]
		sar	eax, cl
		mov	cl, [di+4Eh]
		shl	ax, cl
		shl	ax, 2
		mov	dx, [di+44h]
		mov	bx, [di+42h]
		add	bx, ax
		mov	[di+4Ah], dx
		mov	[di+48h], bx

loc_1EF0B:				; CODE XREF: sub_1EEBD+2Cj
		les	bx, [di+48h]
		mov	eax, es:[bx]
		mov	[di+72h], eax
		les	bx, [di+48h]
		mov	ax, [di+4Ch]
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx-4]
		mov	[di+76h], eax
		mov	dword_4628C, 0FFFFFFFFh
		pop	di
		pop	si
		pop	bp
		retf
sub_1EEBD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	eax, [bp+8]
		sar	eax, 8
		mov	[bp+8],	eax
		cmp	dword_4628C, 0FFFFFFFFh
		jz	short loc_1EF7D
		mov	eax, [bp+8]
		cmp	eax, dword_4628C
		jl	short loc_1EF7D
		mov	eax, [si+76h]
		cmp	eax, dword_4628C
		jg	short loc_1EF6F
		jmp	loc_1F0B8
; ���������������������������������������������������������������������������

loc_1EF6F:				; CODE XREF: seg047:037Aj
		mov	eax, [bp+8]
		cmp	eax, dword_46290
		jge	short loc_1EF7D
		jmp	loc_1F0B8
; ���������������������������������������������������������������������������

loc_1EF7D:				; CODE XREF: seg047:0364j seg047:036Fj ...
		mov	eax, [si+72h]
		cmp	eax, [bp+8]
		jle	short loc_1EFAB
		mov	dword_4628C, 0
		mov	eax, [si+72h]
		mov	dword_46290, eax
		xor	eax, eax
		mov	dword_46294, eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_1F0B6
; ���������������������������������������������������������������������������

loc_1EFAB:				; CODE XREF: seg047:0395j
		mov	eax, [si+76h]
		cmp	eax, [bp+8]
		jg	short loc_1EFD9
		mov	eax, [si+76h]
		mov	dword_4628C, eax
		mov	eax, [si+76h]
		mov	dword_46290, eax
		mov	eax, [si+6Ah]
		mov	dword_46294, eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_1F0B6
; ���������������������������������������������������������������������������

loc_1EFD9:				; CODE XREF: seg047:03C3j
		mov	ax, [si+4Ch]
		sar	ax, 1
		dec	ax
		mov	di, ax
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp-2],	ax
		mov	byte ptr [bp-0Bh], 0
		jmp	loc_1F08D
; ���������������������������������������������������������������������������

loc_1EFEF:				; CODE XREF: seg047:04A6j
		dec	word ptr [bp-2]
		les	bx, [si+48h]
		mov	ax, di
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp-6],	eax
		les	bx, [si+48h]
		mov	ax, di
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp-0Ah], eax
		mov	eax, [bp+8]
		cmp	eax, [bp-6]
		jl	short loc_1F041
		mov	eax, [bp+8]
		cmp	eax, [bp-0Ah]
		jge	short loc_1F041
		mov	eax, [bp-6]
		mov	dword_4628C, eax
		mov	eax, [bp-0Ah]
		mov	dword_46290, eax
		mov	byte ptr [bp-0Bh], 1
		jmp	short loc_1F08D
; ���������������������������������������������������������������������������

loc_1F041:				; CODE XREF: seg047:042Fj seg047:0439j
		mov	eax, [bp+8]
		cmp	eax, [bp-0Ah]
		jnz	short loc_1F06D
		inc	di
		mov	eax, [bp-0Ah]
		mov	dword_4628C, eax
		les	bx, [si+48h]
		mov	ax, di
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	dword_46290, eax
		mov	byte ptr [bp-0Bh], 1
		jmp	short loc_1F08D
; ���������������������������������������������������������������������������

loc_1F06D:				; CODE XREF: seg047:0459j
		mov	eax, [bp+8]
		cmp	eax, [bp-6]
		jge	short loc_1F083
		mov	ax, 1
		mov	cl, [bp-2]
		shl	ax, cl
		sub	di, ax
		jmp	short loc_1F08D
; ���������������������������������������������������������������������������

loc_1F083:				; CODE XREF: seg047:0485j
		mov	ax, 1
		mov	cl, [bp-2]
		shl	ax, cl
		add	di, ax

loc_1F08D:				; CODE XREF: seg047:03FCj seg047:044Fj ...
		mov	al, [bp-0Bh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F099
		jmp	loc_1EFEF
; ���������������������������������������������������������������������������

loc_1F099:				; CODE XREF: seg047:04A4j
		mov	ax, di
		inc	ax
		movsx	eax, ax
		mov	cl, [si+68h]
		sub	cl, [si+4Eh]
		shl	eax, cl
		mov	dword_46294, eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1F0B6:				; CODE XREF: seg047:03B8j seg047:03E6j
		jmp	short loc_1F0C5
; ���������������������������������������������������������������������������

loc_1F0B8:				; CODE XREF: seg047:037Cj seg047:038Aj
		mov	eax, dword_46294
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1F0C5:				; CODE XREF: seg047:loc_1F0B6j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1F0C9	proc far		; CODE XREF: Cockpit_PanAzimuthUpdate+20p
					; seg047:09A8p

var_36		= dword	ptr -36h
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_21		= byte ptr -21h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	100h
		jle	short loc_1F0E5
		mov	ax, 1
		jmp	short loc_1F0E7
; ���������������������������������������������������������������������������

loc_1F0E5:				; CODE XREF: sub_1F0C9+15j
		xor	ax, ax

loc_1F0E7:				; CODE XREF: sub_1F0C9+1Aj
		or	al, al
		jz	short loc_1F0FD
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	bx, [bp+arg_2]
		mov	[bx], eax

loc_1F0FD:				; CODE XREF: sub_1F0C9+20j
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	0
		jz	short loc_1F10B
		mov	ax, 1
		jmp	short loc_1F10D
; ���������������������������������������������������������������������������

loc_1F10B:				; CODE XREF: sub_1F0C9+3Bj
		xor	ax, ax

loc_1F10D:				; CODE XREF: sub_1F0C9+40j
		or	al, al
		jz	short loc_1F117
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_1F11B
; ���������������������������������������������������������������������������

loc_1F117:				; CODE XREF: sub_1F0C9+46j
		mov	byte ptr [si+3Bh], 0

loc_1F11B:				; CODE XREF: sub_1F0C9+4Cj
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	100h
		jnz	short loc_1F12C
		mov	ax, 1
		jmp	short loc_1F12E
; ���������������������������������������������������������������������������

loc_1F12C:				; CODE XREF: sub_1F0C9+5Cj
		xor	ax, ax

loc_1F12E:				; CODE XREF: sub_1F0C9+61j
		or	al, al
		jz	short loc_1F13C
		cmp	byte ptr [si+3Eh], 0
		jnz	short loc_1F13C
		mov	byte ptr [si+3Bh], 0

loc_1F13C:				; CODE XREF: sub_1F0C9+67j
					; sub_1F0C9+6Dj
		push	1
		sub	sp, 4
		mov	eax, dword_490A2
		mov	[bp+var_36], eax
		push	si
		nop
		push	cs
		call	near ptr sub_1F5A1
		add	sp, 8
		push	0
		mov	bx, [bp+arg_4]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_4]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		add	word ptr [bp+var_8], 4
		push	0
		mov	al, [si+21h]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		add	word ptr [bp+var_14], 4
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F22A
		mov	byte ptr [si+3Ch], 0
		xor	di, di
		jmp	short loc_1F221
; ���������������������������������������������������������������������������

loc_1F1DF:				; CODE XREF: sub_1F0C9+15Bj
		les	bx, [bp+var_18]
		mov	al, es:[bx]
		les	bx, [bp+var_14]
		sub	al, es:[bx]
		mov	[bp+var_1D], al
		les	bx, [bp+var_1C]
		mov	al, [bp+var_1D]
		mov	es:[bx], al
		mov	al, [bp+var_1D]
		cbw
		mov	[bp+var_20], ax
		mov	ax, [bp+var_20]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_1D], al
		mov	al, [si+3Ch]
		cmp	al, [bp+var_1D]
		jge	short loc_1F217
		mov	al, [bp+var_1D]
		mov	[si+3Ch], al

loc_1F217:				; CODE XREF: sub_1F0C9+146j
		inc	di
		inc	word ptr [bp+var_1C]
		inc	word ptr [bp+var_18]
		inc	word ptr [bp+var_14]

loc_1F221:				; CODE XREF: sub_1F0C9+114j
		cmp	[si+7],	di
		jg	short loc_1F1DF
		mov	byte ptr [si+3Dh], 1

loc_1F22A:				; CODE XREF: sub_1F0C9+10Cj
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	0
		jle	short loc_1F238
		mov	ax, 1
		jmp	short loc_1F23A
; ���������������������������������������������������������������������������

loc_1F238:				; CODE XREF: sub_1F0C9+168j
		xor	ax, ax

loc_1F23A:				; CODE XREF: sub_1F0C9+16Dj
		or	al, al
		jnz	short loc_1F241
		jmp	loc_1F301
; ���������������������������������������������������������������������������

loc_1F241:				; CODE XREF: sub_1F0C9+173j
		mov	al, [si+3Ch]
		cbw
		mov	[bp+var_28], ax
		movsx	eax, [bp+var_28]
		mov	bx, [bp+arg_2]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_2C], edx
		mov	eax, [bp+var_2C]
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 0
		jg	short loc_1F26F
		mov	ax, 1
		jmp	short loc_1F271
; ���������������������������������������������������������������������������

loc_1F26F:				; CODE XREF: sub_1F0C9+19Fj
		xor	ax, ax

loc_1F271:				; CODE XREF: sub_1F0C9+1A4j
		or	al, al
		jz	short loc_1F27B
		mov	[bp+var_21], 0
		jmp	short loc_1F290
; ���������������������������������������������������������������������������

loc_1F27B:				; CODE XREF: sub_1F0C9+1AAj
		mov	eax, [bp+var_26]
		sar	eax, 8
		mov	[bp+var_21], al
		cmp	[bp+var_21], 0
		jnz	short loc_1F290
		mov	[bp+var_21], 1

loc_1F290:				; CODE XREF: sub_1F0C9+1B0j
					; sub_1F0C9+1C1j
		xor	di, di
		jmp	short loc_1F2F4
; ���������������������������������������������������������������������������

loc_1F294:				; CODE XREF: sub_1F0C9+22Ej
		les	bx, [bp+var_C]
		mov	al, es:[bx]
		mov	[bp+var_1D], al
		cmp	[bp+var_1D], 0
		jle	short loc_1F2B9
		mov	al, [bp+var_1D]
		cmp	al, [bp+var_21]
		jle	short loc_1F2B3
		mov	al, [bp+var_21]
		sub	[bp+var_1D], al
		jmp	short loc_1F2B7
; ���������������������������������������������������������������������������

loc_1F2B3:				; CODE XREF: sub_1F0C9+1E0j
		mov	[bp+var_1D], 0

loc_1F2B7:				; CODE XREF: sub_1F0C9+1E8j
		jmp	short loc_1F2DB
; ���������������������������������������������������������������������������

loc_1F2B9:				; CODE XREF: sub_1F0C9+1D8j
		cmp	[bp+var_1D], 0
		jge	short loc_1F2DB
		mov	al, [bp+var_1D]
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_21]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_1F2D7
		mov	al, [bp+var_21]
		add	[bp+var_1D], al
		jmp	short loc_1F2DB
; ���������������������������������������������������������������������������

loc_1F2D7:				; CODE XREF: sub_1F0C9+204j
		mov	[bp+var_1D], 0

loc_1F2DB:				; CODE XREF: sub_1F0C9:loc_1F2B7j
					; sub_1F0C9+1F4j ...
		les	bx, [bp+var_8]
		mov	al, es:[bx]
		sub	al, [bp+var_1D]
		les	bx, [bp+var_10]
		mov	es:[bx], al
		inc	di
		inc	word ptr [bp+var_C]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_10]

loc_1F2F4:				; CODE XREF: sub_1F0C9+1C9j
		cmp	[si+7],	di
		jg	short loc_1F294
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		add	sp, 2

loc_1F301:				; CODE XREF: sub_1F0C9+175j
		pop	di
		pop	si
		leave
		retf
sub_1F0C9	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+6]
		mov	bx, [bp+8]
		cmp	dword ptr [bx],	100h
		jle	short loc_1F321
		mov	ax, 1
		jmp	short loc_1F323
; ���������������������������������������������������������������������������

loc_1F321:				; CODE XREF: seg047:072Aj
		xor	ax, ax

loc_1F323:				; CODE XREF: seg047:072Fj
		or	al, al
		jz	short loc_1F339
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		mov	bx, [bp+8]
		mov	[bx], eax

loc_1F339:				; CODE XREF: seg047:0735j
		mov	bx, [bp+8]
		cmp	dword ptr [bx],	0
		jz	short loc_1F347
		mov	ax, 1
		jmp	short loc_1F349
; ���������������������������������������������������������������������������

loc_1F347:				; CODE XREF: seg047:0750j
		xor	ax, ax

loc_1F349:				; CODE XREF: seg047:0755j
		or	al, al
		jz	short loc_1F353
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_1F357
; ���������������������������������������������������������������������������

loc_1F353:				; CODE XREF: seg047:075Bj
		mov	byte ptr [si+3Bh], 0

loc_1F357:				; CODE XREF: seg047:0761j
		push	1
		sub	sp, 4
		mov	eax, dword_490A2
		mov	[bp-32h], eax
		push	si
		nop
		push	cs
		call	near ptr sub_1F5A1
		add	sp, 8
		cmp	byte ptr [si+3Eh], 2
		jnz	short loc_1F38B
		mov	al, [si+3Fh]
		cmp	al, [bp+0Ah]
		jz	short loc_1F3A5
		mov	al, [si+40h]
		cmp	al, [bp+0Ch]
		jz	short loc_1F3A5
		mov	al, [si+41h]
		cmp	al, [bp+0Eh]
		jz	short loc_1F3A5

loc_1F38B:				; CODE XREF: seg047:0781j
		mov	byte ptr [si+3Eh], 2
		mov	byte ptr [si+3Dh], 0
		mov	al, [bp+0Ah]
		mov	[si+3Fh], al
		mov	al, [bp+0Ch]
		mov	[si+40h], al
		mov	al, [bp+0Eh]
		mov	[si+41h], al

loc_1F3A5:				; CODE XREF: seg047:0789j seg047:0791j ...
		push	0
		mov	al, [si+21h]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp-6],	dx
		mov	[bp-8],	ax
		mov	eax, [si+3]
		mov	[bp-0Ch], eax
		mov	eax, [bp-8]
		mov	[bp-10h], eax
		mov	eax, [bp-0Ch]
		mov	[bp-14h], eax
		mov	ax, si
		add	ax, 3Fh	; '?'
		mov	di, ax
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F455
		mov	byte ptr [si+3Ch], 0
		mov	word ptr [bp-16h], 0
		jmp	short loc_1F44A
; ���������������������������������������������������������������������������

loc_1F3F5:				; CODE XREF: seg047:085Fj
		mov	word ptr [bp-18h], 0
		jmp	short loc_1F43A
; ���������������������������������������������������������������������������

loc_1F3FC:				; CODE XREF: seg047:084Ej
		mov	al, [di]
		les	bx, [bp-14h]
		sub	al, es:[bx]
		mov	[bp-19h], al
		les	bx, [bp-10h]
		mov	al, [bp-19h]
		mov	es:[bx], al
		mov	al, [bp-19h]
		cbw
		mov	[bp-1Ch], ax
		mov	ax, [bp-1Ch]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp-19h], al
		mov	al, [si+3Ch]
		cmp	al, [bp-19h]
		jge	short loc_1F430
		mov	al, [bp-19h]
		mov	[si+3Ch], al

loc_1F430:				; CODE XREF: seg047:0838j
		inc	word ptr [bp-18h]
		inc	word ptr [bp-10h]
		inc	word ptr [bp-14h]
		inc	di

loc_1F43A:				; CODE XREF: seg047:080Aj
		cmp	word ptr [bp-18h], 3
		jl	short loc_1F3FC
		mov	ax, si
		add	ax, 3Fh	; '?'
		mov	di, ax
		inc	word ptr [bp-16h]

loc_1F44A:				; CODE XREF: seg047:0803j
		mov	ax, [si]
		cmp	ax, [bp-16h]
		ja	short loc_1F3F5
		mov	byte ptr [si+3Dh], 1

loc_1F455:				; CODE XREF: seg047:07F8j
		mov	bx, [bp+8]
		cmp	dword ptr [bx],	0
		jle	short loc_1F463
		mov	ax, 1
		jmp	short loc_1F465
; ���������������������������������������������������������������������������

loc_1F463:				; CODE XREF: seg047:086Cj
		xor	ax, ax

loc_1F465:				; CODE XREF: seg047:0871j
		or	al, al
		jnz	short loc_1F46C
		jmp	loc_1F54B
; ���������������������������������������������������������������������������

loc_1F46C:				; CODE XREF: seg047:0877j
		mov	al, [si+3Ch]
		cbw
		mov	[bp-24h], ax
		movsx	eax, word ptr [bp-24h]
		mov	bx, [bp+8]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp-28h], edx
		mov	eax, [bp-28h]
		mov	[bp-22h], eax
		cmp	dword ptr [bp-22h], 0
		jg	short loc_1F49A
		mov	ax, 1
		jmp	short loc_1F49C
; ���������������������������������������������������������������������������

loc_1F49A:				; CODE XREF: seg047:08A3j
		xor	ax, ax

loc_1F49C:				; CODE XREF: seg047:08A8j
		or	al, al
		jz	short loc_1F4A6
		mov	byte ptr [bp-1Dh], 0
		jmp	short loc_1F4BB
; ���������������������������������������������������������������������������

loc_1F4A6:				; CODE XREF: seg047:08AEj
		mov	eax, [bp-22h]
		sar	eax, 8
		mov	[bp-1Dh], al
		cmp	byte ptr [bp-1Dh], 0
		jnz	short loc_1F4BB
		mov	byte ptr [bp-1Dh], 1

loc_1F4BB:				; CODE XREF: seg047:08B4j seg047:08C5j
		mov	ax, si
		add	ax, 3Fh	; '?'
		mov	di, ax
		mov	word ptr [bp-16h], 0
		jmp	short loc_1F53C
; ���������������������������������������������������������������������������

loc_1F4C9:				; CODE XREF: seg047:0951j
		mov	word ptr [bp-18h], 0
		jmp	short loc_1F52C
; ���������������������������������������������������������������������������

loc_1F4D0:				; CODE XREF: seg047:0940j
		les	bx, [bp-8]
		mov	al, es:[bx]
		mov	[bp-19h], al
		cmp	byte ptr [bp-19h], 0
		jle	short loc_1F4F5
		mov	al, [bp-19h]
		cmp	al, [bp-1Dh]
		jle	short loc_1F4EF
		mov	al, [bp-1Dh]
		sub	[bp-19h], al
		jmp	short loc_1F4F3
; ���������������������������������������������������������������������������

loc_1F4EF:				; CODE XREF: seg047:08F5j
		mov	byte ptr [bp-19h], 0

loc_1F4F3:				; CODE XREF: seg047:08FDj
		jmp	short loc_1F517
; ���������������������������������������������������������������������������

loc_1F4F5:				; CODE XREF: seg047:08EDj
		cmp	byte ptr [bp-19h], 0
		jge	short loc_1F517
		mov	al, [bp-19h]
		cbw
		neg	ax
		push	ax
		mov	al, [bp-1Dh]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_1F513
		mov	al, [bp-1Dh]
		add	[bp-19h], al
		jmp	short loc_1F517
; ���������������������������������������������������������������������������

loc_1F513:				; CODE XREF: seg047:0919j
		mov	byte ptr [bp-19h], 0

loc_1F517:				; CODE XREF: seg047:loc_1F4F3j
					; seg047:0909j	...
		mov	al, [di]
		sub	al, [bp-19h]
		les	bx, [bp-0Ch]
		mov	es:[bx], al
		inc	word ptr [bp-18h]
		inc	word ptr [bp-8]
		inc	word ptr [bp-0Ch]
		inc	di

loc_1F52C:				; CODE XREF: seg047:08DEj
		cmp	word ptr [bp-18h], 3
		jl	short loc_1F4D0
		mov	ax, si
		add	ax, 3Fh	; '?'
		mov	di, ax
		inc	word ptr [bp-16h]

loc_1F53C:				; CODE XREF: seg047:08D7j
		mov	ax, [si]
		cmp	ax, [bp-16h]
		ja	short loc_1F4C9
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		add	sp, 2

loc_1F54B:				; CODE XREF: seg047:0879j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Cockpit_PanAzimuthUpdate (sub_2F064 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,28L — reset optionnel d'état (+0x3D/0x3E) puis appelle
; sub_2EC42 sur le champ +9 : pilotage de la transition d'azimut/pan de la caméra du cockpit
; (appelé par Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate	proc far		; CODE XREF: sub_5DD30+18P
					; sub_C01FB+35P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 0
		jz	short loc_1F564
		mov	byte ptr [si+3Eh], 0
		mov	byte ptr [si+3Dh], 0

loc_1F564:				; CODE XREF: Cockpit_PanAzimuthUpdate+Bj
		mov	ax, si
		add	ax, 9
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1F0C9
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+3Eh], 1
		jz	short loc_1F58D
		mov	byte ptr [si+3Eh], 1
		mov	byte ptr [si+3Dh], 0

loc_1F58D:				; CODE XREF: seg047:0993j
		mov	ax, si
		add	ax, 13h
		push	ax
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_1F0C9
		add	sp, 6
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1F5A1	proc far		; CODE XREF: sub_1F0C9+83p
					; seg047:0777p

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 37h	; '7'
		mov	[bp+var_6], ax
		mov	eax, [bp+arg_2]
		mov	edx, eax
		mov	bx, [bp+var_6]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	di, word ptr [bp+var_4+1]
		or	di, di
		jnz	short loc_1F5E2
		mov	di, 1

loc_1F5E2:				; CODE XREF: sub_1F5A1+3Cj
		mov	ax, [si+33h]
		sub	ax, di
		mov	di, ax
		or	di, di
		jge	short loc_1F5EF
		xor	di, di

loc_1F5EF:				; CODE XREF: sub_1F5A1+4Aj
		cmp	[bp+arg_6], 0
		jnz	short loc_1F5FD
		cmp	[si+31h], di
		jnz	short loc_1F5FD
		jmp	loc_1F691
; ���������������������������������������������������������������������������

loc_1F5FD:				; CODE XREF: sub_1F5A1+52j
					; sub_1F5A1+57j
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F610
		mov	eax, [si+3]
		mov	[bp+var_E], eax
		jmp	short loc_1F631
; ���������������������������������������������������������������������������

loc_1F610:				; CODE XREF: sub_1F5A1+63j
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		add	word ptr [bp+var_E], 4

loc_1F631:				; CODE XREF: sub_1F5A1+6Dj
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		add	word ptr [bp+var_E], 2D0h
		mov	ax, [si+35h]
		shl	ax, 1
		add	ax, [si+35h]
		mov	[bp+var_14], ax
		mov	ax, di
		imul	[bp+var_14]
		add	[bp+var_12], ax
		push	[bp+var_14]
		push	[bp+var_10]
		push	[bp+var_12]
		push	word ptr [bp+var_E+2]
		push	word ptr [bp+var_E]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F68E
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		add	sp, 2

loc_1F68E:				; CODE XREF: sub_1F5A1+E3j
		mov	[si+31h], di

loc_1F691:				; CODE XREF: sub_1F5A1+59j
		pop	di
		pop	si
		leave
		retf
sub_1F5A1	endp

; ���������������������������������������������������������������������������

loc_1F695:				; DATA XREF: dseg:590Ao
		push	bp
		mov	bp, sp
		mov	word_492F0, 0
		mov	dword_492F3, 0
		mov	dword_492F9, 0
		mov	byte_492FD, 2
		mov	byte_492FE, 0
		mov	dword_492FF, 0
		mov	dword_49303, 0
		mov	byte_49307, 2
		mov	byte_49308, 0
		mov	dword_49309, 0
		mov	dword_4930D, 0
		mov	byte_49311, 2
		mov	byte_49312, 0
		mov	dword_49313, 0
		mov	dword_49317, 0
		mov	byte_4931B, 2
		mov	byte_4931C, 0
		mov	dword_4931D, 0
		mov	dword_4934E, 0
		mov	byte_49352, 2
		mov	byte_49353, 0
		mov	dword_49354, 0
		push	62D0h
		call	sub_42907
		add	sp, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1F740:				; DATA XREF: dseg:59B8o
		push	bp
		mov	bp, sp
		push	2
		push	62D0h
		call	sub_42916
		add	sp, 4
		pop	bp
		retf
seg047		ends
