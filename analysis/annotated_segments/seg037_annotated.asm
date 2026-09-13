seg037		segment	byte public 'CODE' use16
		assume cs:seg037
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,566L — stub d'alignement pile (auto-réappel après alignement 4 octets, pattern généré
; par le compilateur pour arguments 32-bit), puis rasterisation avec clipping style Cohen-
; Sutherland (codes de sortie par bits, comparaison à un rectangle de clip, structure de 22
; octets/sommet, recherche de min/max Y) : primitive de rendu graphique — remplissage/tracé de
; polygone avec clipping. Trop volumineuse pour une passe détaillée.
; ==============================================================================================
Render_PolygonPrimitive_20848	proc far		; CODE XREF: Render_PolygonPrimitive_20848+32p
					; seg055:06EEP	...

var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		enter	38h, 0
		push	ds
		push	si

loc_2084E:				; DATA XREF: seg216:01E6o
		push	di
		cld
		test	sp, 3
		jz	short loc_20884
		mov	cx, 8
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs
		call	near ptr Render_PolygonPrimitive_20848
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_20884:				; CODE XREF: Render_PolygonPrimitive_20848+Cj
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax

loc_20893:
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]

loc_2089C:
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, word ptr [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_12], bx
		mov	[bp+var_14], ax
		mov	[bp+var_10], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_208D1:				; CODE XREF: Render_PolygonPrimitive_20848+CDj
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		shl	ax, 1
		rcl	cl, 1
		or	byte ptr [bp+var_10], cl
		mov	ax, [bx+2]
		sub	ax, [bp+var_4]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_8]
		sub	ax, [bx+2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_20907
		mov	si, ax
		mov	dx, bx

loc_20907:				; CODE XREF: Render_PolygonPrimitive_20848+B9j
		cmp	ax, di
		jl	short loc_2090D
		mov	di, ax

loc_2090D:				; CODE XREF: Render_PolygonPrimitive_20848+C1j
		and	ch, cl
		add	bx, 16h

loc_20912:
		cmp	bx, [bp+var_14]
		jnz	short loc_208D1
		or	ch, ch
		jnz	loc_20B16
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_24], si
		cmp	di, si
		jnz	short loc_2098D
		mov	bx, [bp+var_1A]

loc_2092D:				; CODE XREF: Render_PolygonPrimitive_20848+FDj
		mov	si, bx
		mov	ax, [si]

loc_20931:				; CODE XREF: Render_PolygonPrimitive_20848:loc_20943j
		cmp	bx, [bp+var_12]
		ja	short loc_20939
		mov	bx, [bp+var_14]

loc_20939:				; CODE XREF: Render_PolygonPrimitive_20848+ECj
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_20947
		cmp	ax, [bx]

loc_20943:
		jle	short loc_20931
		jmp	short loc_2092D
; ���������������������������������������������������������������������������

loc_20947:				; CODE XREF: Render_PolygonPrimitive_20848+F7j
		mov	bx, [bp+var_1C]

loc_2094A:				; CODE XREF: Render_PolygonPrimitive_20848+11Aj
		mov	di, bx
		mov	ax, [di]

loc_2094E:				; CODE XREF: Render_PolygonPrimitive_20848+118j
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_20959
		mov	bx, [bp+var_12]

loc_20959:				; CODE XREF: Render_PolygonPrimitive_20848+10Cj
		cmp	bx, [bp+var_1C]
		jz	short loc_20964
		cmp	ax, [bx]
		jge	short loc_2094E
		jmp	short loc_2094A
; ���������������������������������������������������������������������������

loc_20964:				; CODE XREF: Render_PolygonPrimitive_20848+114j
		movsx	edx, word ptr [si]
		shl	edx, 10h
		mov	[bp+var_28], edx
		movsx	edx, word ptr [di]
		shl	edx, 10h
		mov	[bp+var_2C], edx
		xor	eax, eax
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	[bp+var_22], ax
		jmp	loc_20A93
; ���������������������������������������������������������������������������

loc_2098D:				; CODE XREF: Render_PolygonPrimitive_20848+E0j
					; Render_PolygonPrimitive_20848+169j ...
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_2099D

loc_2099A:
		mov	si, [bp+var_14]

loc_2099D:				; CODE XREF: Render_PolygonPrimitive_20848+150j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_209B3
		cmp	cx, [bp+var_4]
		jle	short loc_2098D

loc_209B3:				; CODE XREF: Render_PolygonPrimitive_20848+164j
		sub	cx, dx
		jz	short loc_2098D
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_30], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_28], 8000h
		mov	word ptr [bp+var_28+2],	dx

loc_209E1:				; CODE XREF: Render_PolygonPrimitive_20848+1BDj
					; Render_PolygonPrimitive_20848+1C1j
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_209F4
		mov	si, [bp+var_12]

loc_209F4:				; CODE XREF: Render_PolygonPrimitive_20848+1A7j
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_20A07
		cmp	cx, [bp+var_4]
		jle	short loc_209E1

loc_20A07:				; CODE XREF: Render_PolygonPrimitive_20848+1B8j
		sub	cx, dx
		jz	short loc_209E1
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h

loc_20A20:
		sar	edx, 10h

loc_20A24:
		idiv	ecx
		mov	[bp+var_34], eax

loc_20A2B:
		mov	dx, [bx]

loc_20A2D:
		mov	word ptr [bp+var_2C], 8000h

loc_20A32:
		mov	word ptr [bp+var_2C+2],	dx

loc_20A35:
		mov	ax, [bp+var_8]

loc_20A38:
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]

loc_20A3E:
		jg	short loc_20A42
		add	ax, di

loc_20A42:				; CODE XREF: Render_PolygonPrimitive_20848:loc_20A3Ej
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	short loc_20A93
		sub	[bp+var_22], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_24], cx
		mov	bx, [bp+var_16]
		sub	cx, [bx+2]
		sub	[bp+var_1E], cx
		shl	ecx, 10h
		mov	eax, [bp+var_30]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_28], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h
		mov	eax, [bp+var_34]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_2C], eax

loc_20A93:				; CODE XREF: Render_PolygonPrimitive_20848+142j
					; Render_PolygonPrimitive_20848+203j
		mov	bx, [bp+var_12]

loc_20A96:
		mov	ax, [bx+4]

loc_20A99:
		mov	ah, al
		mov	dx, ax
		shl	eax, 10h

loc_20AA1:
		mov	ax, dx

loc_20AA3:
		mov	[bp+var_38], eax

loc_20AA7:
		mov	di, [bp+var_C]
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_28]
		mov	ebx, [bp+var_2C]
		cmp	[bp+var_10], 0
		jnz	short loc_20B26

loc_20AC0:				; CODE XREF: Render_PolygonPrimitive_20848:loc_20B14j
					; Render_PolygonPrimitive_20848+2DBj ...
		push	eax
		push	edi
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_20ACE
		xchg	eax, edx

loc_20ACE:				; CODE XREF: Render_PolygonPrimitive_20848+282j
		shr	eax, 10h
		shr	edx, 10h
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	di, ax
		mov	eax, [bp+var_38]
		mov	dx, cx
		and	cx, 3
		rep stosb
		mov	cx, dx
		shr	cx, 2
		rep stosd
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_20B16
		jz	short loc_20B1B
		dec	[bp+var_1E]

loc_20B01:
		jz	loc_20BA1

loc_20B05:
		add	eax, [bp+var_30]

loc_20B09:				; CODE XREF: Render_PolygonPrimitive_20848+3AEj
		dec	[bp+var_20]

loc_20B0C:
		jz	loc_20BFC
		add	ebx, [bp+var_34]

loc_20B14:
		jmp	short loc_20AC0
; ���������������������������������������������������������������������������

loc_20B16:				; CODE XREF: Render_PolygonPrimitive_20848+D1j
					; Render_PolygonPrimitive_20848+2B2j ...
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_20B1B:				; CODE XREF: Render_PolygonPrimitive_20848+2B4j
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_20AC0
; ���������������������������������������������������������������������������
		align 2

loc_20B26:				; CODE XREF: Render_PolygonPrimitive_20848+276j
					; Render_PolygonPrimitive_20848+343j ...
		push	eax
		push	edi
		mov	edx, ebx

loc_20B2D:
		cmp	edx, eax
		jg	short loc_20B34
		xchg	eax, edx

loc_20B34:				; CODE XREF: Render_PolygonPrimitive_20848+2E8j
		shr	eax, 10h
		shr	edx, 10h
		cmp	ax, [bp+var_6]
		jg	short loc_20B6B
		cmp	dx, [bp+var_2]
		jl	short loc_20B6B
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	edi, eax
		sub	ax, [bp+var_2]
		jl	short loc_20B97

loc_20B53:				; CODE XREF: Render_PolygonPrimitive_20848+353j
		sub	dx, [bp+var_6]
		jg	short loc_20B9D

loc_20B58:				; CODE XREF: Render_PolygonPrimitive_20848+357j
		mov	eax, [bp+var_38]
		mov	dx, cx
		and	cx, 3
		rep stosb
		mov	cx, dx
		shr	cx, 2
		rep stosd

loc_20B6B:				; CODE XREF: Render_PolygonPrimitive_20848+2F7j
					; Render_PolygonPrimitive_20848+2FCj
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_20B16
		jz	short loc_20B8D
		dec	[bp+var_1E]
		jz	short loc_20BA1
		add	eax, [bp+var_30]

loc_20B82:				; CODE XREF: Render_PolygonPrimitive_20848+3B2j
		dec	[bp+var_20]
		jz	short loc_20BFC
		add	ebx, [bp+var_34]
		jmp	short loc_20B26
; ���������������������������������������������������������������������������

loc_20B8D:				; CODE XREF: Render_PolygonPrimitive_20848+32Fj
		add	eax, [bp+var_30]

loc_20B91:
		add	ebx, [bp+var_34]
		jmp	short loc_20B26
; ���������������������������������������������������������������������������

loc_20B97:				; CODE XREF: Render_PolygonPrimitive_20848+309j
		sub	di, ax
		add	cx, ax
		jmp	short loc_20B53
; ���������������������������������������������������������������������������

loc_20B9D:				; CODE XREF: Render_PolygonPrimitive_20848+30Ej
		sub	cx, dx
		jmp	short loc_20B58
; ���������������������������������������������������������������������������

loc_20BA1:				; CODE XREF: Render_PolygonPrimitive_20848:loc_20B01j
					; Render_PolygonPrimitive_20848+334j
		push	ebx
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_20BB3
		mov	si, [bp+var_14]

loc_20BB3:				; CODE XREF: Render_PolygonPrimitive_20848+366j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_30], eax
		mov	ax, [bx]
		shl	eax, 10h
		mov	ax, 8000h
		pop	ebx
		cmp	[bp+var_10], 0
		jz	loc_20B09
		jmp	short loc_20B82
; ���������������������������������������������������������������������������

loc_20BFC:				; CODE XREF: Render_PolygonPrimitive_20848:loc_20B0Cj
					; Render_PolygonPrimitive_20848+33Dj
		push	eax
		mov	bx, [bp+var_1C]

loc_20C01:
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_20C11
		mov	si, [bp+var_12]

loc_20C11:				; CODE XREF: Render_PolygonPrimitive_20848+3C4j
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0

loc_20C22:
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]

loc_20C2B:
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax

loc_20C42:
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bx, 8000h
		pop	eax
		cmp	[bp+var_10], 0
		jz	loc_20AC0
		jmp	loc_20B26
Render_PolygonPrimitive_20848	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,588L — même stub d'alignement pile, structure similaire à sub_20848 avec 2 arguments
; supplémentaires : variante de la primitive de rendu polygonal (probable version avec
; texture/couleur additionnelle). À approfondir.
; ==============================================================================================
Render_PolygonPrimitive_20C58	proc far		; CODE XREF: Render_PolygonPrimitive_20C58+32p
					; seg055:loc_299E3P

var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		enter	38h, 0
		push	ds
		push	si
		push	di
		cld
		test	sp, 3
		jz	short loc_20C94
		mov	cx, 0Ch
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs
		call	near ptr Render_PolygonPrimitive_20C58
		mov	sp, si
		pop	di
		pop	si

loc_20C91:
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_20C94:				; CODE XREF: Render_PolygonPrimitive_20C58+Cj
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, word ptr [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_12], bx
		mov	[bp+var_14], ax
		mov	[bp+var_10], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_20CE1:				; CODE XREF: Render_PolygonPrimitive_20C58+CDj
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		shl	ax, 1
		rcl	cl, 1
		or	byte ptr [bp+var_10], cl
		mov	ax, [bx+2]
		sub	ax, [bp+var_4]
		shl	ax, 1

loc_20D00:
		rcl	cl, 1
		mov	ax, [bp+var_8]
		sub	ax, [bx+2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_20D17

loc_20D13:
		mov	si, ax
		mov	dx, bx

loc_20D17:				; CODE XREF: Render_PolygonPrimitive_20C58+B9j
		cmp	ax, di
		jl	short loc_20D1D
		mov	di, ax

loc_20D1D:				; CODE XREF: Render_PolygonPrimitive_20C58+C1j
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_20CE1
		or	ch, ch

loc_20D29:
		jnz	loc_20F2C
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx

loc_20D33:
		mov	[bp+var_24], si
		cmp	di, si
		jnz	short loc_20D9D
		mov	bx, [bp+var_1A]

loc_20D3D:				; CODE XREF: Render_PolygonPrimitive_20C58+FDj
		mov	si, bx
		mov	ax, [si]

loc_20D41:				; CODE XREF: Render_PolygonPrimitive_20C58+FBj
		cmp	bx, [bp+var_12]
		ja	short loc_20D49
		mov	bx, [bp+var_14]

loc_20D49:				; CODE XREF: Render_PolygonPrimitive_20C58+ECj
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_20D57
		cmp	ax, [bx]
		jle	short loc_20D41
		jmp	short loc_20D3D
; ���������������������������������������������������������������������������

loc_20D57:				; CODE XREF: Render_PolygonPrimitive_20C58+F7j
		mov	bx, [bp+var_1C]

loc_20D5A:				; CODE XREF: Render_PolygonPrimitive_20C58+11Aj
		mov	di, bx
		mov	ax, [di]

loc_20D5E:				; CODE XREF: Render_PolygonPrimitive_20C58+118j
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_20D69
		mov	bx, [bp+var_12]

loc_20D69:				; CODE XREF: Render_PolygonPrimitive_20C58+10Cj
		cmp	bx, [bp+var_1C]
		jz	short loc_20D74
		cmp	ax, [bx]
		jge	short loc_20D5E
		jmp	short loc_20D5A
; ���������������������������������������������������������������������������

loc_20D74:				; CODE XREF: Render_PolygonPrimitive_20C58+114j
		movsx	edx, word ptr [si]
		shl	edx, 10h
		mov	[bp+var_28], edx
		movsx	edx, word ptr [di]
		shl	edx, 10h
		mov	[bp+var_2C], edx
		xor	eax, eax
		mov	[bp+var_30], eax

loc_20D93:
		mov	[bp+var_34], eax
		mov	[bp+var_22], ax
		jmp	loc_20EA3
; ���������������������������������������������������������������������������

loc_20D9D:				; CODE XREF: Render_PolygonPrimitive_20C58+E0j
					; Render_PolygonPrimitive_20C58+169j ...
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx

loc_20DA3:
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_20DAD
		mov	si, [bp+var_14]

loc_20DAD:				; CODE XREF: Render_PolygonPrimitive_20C58+150j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_20DC3
		cmp	cx, [bp+var_4]
		jle	short loc_20D9D

loc_20DC3:				; CODE XREF: Render_PolygonPrimitive_20C58+164j
		sub	cx, dx
		jz	short loc_20D9D
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_30], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_28], 8000h
		mov	word ptr [bp+var_28+2],	dx

loc_20DF1:				; CODE XREF: Render_PolygonPrimitive_20C58+1BDj
					; Render_PolygonPrimitive_20C58+1C1j
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_20E04
		mov	si, [bp+var_12]

loc_20E04:				; CODE XREF: Render_PolygonPrimitive_20C58+1A7j
		mov	[bp+var_1C], si

loc_20E07:
		mov	cx, [si+2]
		mov	dx, [bx+2]

loc_20E0D:
		cmp	dx, [bp+var_4]
		jge	short loc_20E17

loc_20E12:
		cmp	cx, [bp+var_4]
		jle	short loc_20DF1

loc_20E17:				; CODE XREF: Render_PolygonPrimitive_20C58+1B8j
		sub	cx, dx
		jz	short loc_20DF1
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]

loc_20E24:
		sub	dx, [bx]

loc_20E26:
		shl	edx, 10h

loc_20E2A:
		mov	ax, dx
		shl	eax, 10h

loc_20E30:
		sar	edx, 10h

loc_20E34:
		idiv	ecx

loc_20E37:
		mov	[bp+var_34], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_2C], 8000h
		mov	word ptr [bp+var_2C+2],	dx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]
		jg	short loc_20E52
		add	ax, di

loc_20E52:				; CODE XREF: Render_PolygonPrimitive_20C58+1F6j
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	short loc_20EA3
		sub	[bp+var_22], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_24], cx
		mov	bx, [bp+var_16]
		sub	cx, [bx+2]
		sub	[bp+var_1E], cx
		shl	ecx, 10h
		mov	eax, [bp+var_30]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_28], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h

loc_20E93:
		mov	eax, [bp+var_34]

loc_20E97:
		imul	ecx

loc_20E9A:
		shrd	eax, edx, 10h
		add	[bp+var_2C], eax

loc_20EA3:				; CODE XREF: Render_PolygonPrimitive_20C58+142j
					; Render_PolygonPrimitive_20C58+203j
		mov	fs, [bp+arg_A]
		mov	di, [bp+var_C]
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_28]
		mov	ebx, [bp+var_2C]
		cmp	[bp+var_10], 0
		jnz	short loc_20F3C
		nop

loc_20EC0:				; CODE XREF: Render_PolygonPrimitive_20C58+2D2j
					; Render_PolygonPrimitive_20C58+2E1j ...
		push	eax
		push	edi
		push	ebx
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_20ED0
		xchg	eax, edx

loc_20ED0:				; CODE XREF: Render_PolygonPrimitive_20C58+274j
		shr	eax, 10h
		shr	edx, 10h
		mov	cx, dx
		sub	cx, ax
		add	edi, eax
		mov	si, [bp+arg_8]
		xor	bx, bx
		shr	cx, 1
		jz	short loc_20F04
		jnb	short loc_20EF3
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		stosb
		jcxz	short loc_20F04

loc_20EF3:				; CODE XREF: Render_PolygonPrimitive_20C58+290j
					; Render_PolygonPrimitive_20C58+2AAj
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		mov	bl, es:[di+1]
		mov	ah, fs:[bx+si]
		stosw
		dec	cx
		jnz	short loc_20EF3

loc_20F04:				; CODE XREF: Render_PolygonPrimitive_20C58+28Ej
					; Render_PolygonPrimitive_20C58+299j
		pop	ebx
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_20F2C
		jz	short loc_20F31
		dec	[bp+var_1E]
		jz	loc_20FCE
		add	eax, [bp+var_30]

loc_20F1F:				; CODE XREF: Render_PolygonPrimitive_20C58+3CBj
		dec	[bp+var_20]
		jz	loc_21029

loc_20F26:
		add	ebx, [bp+var_34]
		jmp	short loc_20EC0
; ���������������������������������������������������������������������������

loc_20F2C:				; CODE XREF: Render_PolygonPrimitive_20C58:loc_20D29j
					; Render_PolygonPrimitive_20C58+2B8j ...
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_20F31:				; CODE XREF: Render_PolygonPrimitive_20C58+2BAj
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_20EC0
; ���������������������������������������������������������������������������
		align 2

loc_20F3C:				; CODE XREF: Render_PolygonPrimitive_20C58+265j
					; Render_PolygonPrimitive_20C58+35Fj ...
		push	eax
		push	edi
		push	ebx
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_20F4C
		xchg	eax, edx

loc_20F4C:				; CODE XREF: Render_PolygonPrimitive_20C58+2F0j
		shr	eax, 10h
		shr	edx, 10h
		cmp	ax, [bp+var_6]
		jg	short loc_20F95
		cmp	dx, [bp+var_2]
		jl	short loc_20F95
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	edi, eax
		sub	ax, [bp+var_2]
		jl	short loc_20FC4

loc_20F6B:				; CODE XREF: Render_PolygonPrimitive_20C58+370j
		sub	dx, [bp+var_6]
		jg	short loc_20FCA

loc_20F70:				; CODE XREF: Render_PolygonPrimitive_20C58+374j
		mov	si, [bp+arg_8]
		xor	bx, bx
		shr	cx, 1
		jnb	short loc_20F84
		jz	short loc_20F95
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		stosb
		jcxz	short loc_20F95

loc_20F84:				; CODE XREF: Render_PolygonPrimitive_20C58+31Fj
					; Render_PolygonPrimitive_20C58+33Bj
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		mov	bl, es:[di+1]
		mov	ah, fs:[bx+si]
		stosw
		dec	cx
		jnz	short loc_20F84

loc_20F95:				; CODE XREF: Render_PolygonPrimitive_20C58+2FFj
					; Render_PolygonPrimitive_20C58+304j ...
		pop	ebx
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_20F2C
		jz	short loc_20FB9
		dec	[bp+var_1E]
		jz	short loc_20FCE
		add	eax, [bp+var_30]

loc_20FAE:				; CODE XREF: Render_PolygonPrimitive_20C58+3CFj
		dec	[bp+var_20]
		jz	short loc_21029
		add	ebx, [bp+var_34]
		jmp	short loc_20F3C
; ���������������������������������������������������������������������������

loc_20FB9:				; CODE XREF: Render_PolygonPrimitive_20C58+34Bj
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	loc_20F3C
; ���������������������������������������������������������������������������

loc_20FC4:				; CODE XREF: Render_PolygonPrimitive_20C58+311j
		sub	di, ax
		add	cx, ax
		jmp	short loc_20F6B
; ���������������������������������������������������������������������������

loc_20FCA:				; CODE XREF: Render_PolygonPrimitive_20C58+316j
		sub	cx, dx
		jmp	short loc_20F70
; ���������������������������������������������������������������������������

loc_20FCE:				; CODE XREF: Render_PolygonPrimitive_20C58+2BFj
					; Render_PolygonPrimitive_20C58+350j
		push	ebx
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_20FE0
		mov	si, [bp+var_14]

loc_20FE0:				; CODE XREF: Render_PolygonPrimitive_20C58+383j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx

loc_21010:
		mov	[bp+var_30], eax
		mov	ax, [bx]
		shl	eax, 10h
		mov	ax, 8000h
		pop	ebx

loc_2101F:
		cmp	[bp+var_10], 0
		jz	loc_20F1F
		jmp	short loc_20FAE
; ���������������������������������������������������������������������������

loc_21029:				; CODE XREF: Render_PolygonPrimitive_20C58+2CAj
					; Render_PolygonPrimitive_20C58+359j
		push	eax
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2103E
		mov	si, [bp+var_12]

loc_2103E:				; CODE XREF: Render_PolygonPrimitive_20C58+3E1j
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_20], cx

loc_21052:
		shl	ecx, 10h

loc_21056:
		mov	dx, [si]
		sub	dx, [bx]

loc_2105A:
		shl	edx, 10h
		mov	ax, dx

loc_21060:
		shl	eax, 10h

loc_21064:
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bx, 8000h
		pop	eax
		cmp	[bp+var_10], 0
		jz	loc_20EC0
		jmp	loc_20F3C
Render_PolygonPrimitive_20C58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,815L — même famille (stub d'alignement + gros buffer local 0x54) : primitive de rendu
; graphique majeure (candidat : tracé de terrain/mesh 3D du jeu), très volumineuse, à
; approfondir en session dédiée.
; ==============================================================================================
Render_MeshPrimitive_21085	proc far		; CODE XREF: Render_MeshPrimitive_21085+32p
					; seg042:0D4DP	...

var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
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
var_14		= word ptr -14h
var_12		= word ptr -12h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		enter	54h, 0
		push	ds
		push	si
		push	di
		cld
		test	sp, 3
		jz	short loc_210C1
		mov	cx, 8
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs
		call	near ptr Render_MeshPrimitive_21085
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_210C1:				; CODE XREF: Render_MeshPrimitive_21085+Cj
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, word ptr [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_12], bx
		mov	[bp+var_14], ax

loc_21101:
		mov	[bp+var_2E], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_2110E:				; CODE XREF: Render_MeshPrimitive_21085+CDj
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		shl	ax, 1
		rcl	cl, 1

loc_21122:
		or	byte ptr [bp+var_2E], cl
		mov	ax, [bx+2]
		sub	ax, [bp+var_4]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_8]

loc_21132:
		sub	ax, [bx+2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_21144
		mov	si, ax
		mov	dx, bx

loc_21144:				; CODE XREF: Render_MeshPrimitive_21085+B9j
		cmp	ax, di
		jl	short loc_2114A
		mov	di, ax

loc_2114A:				; CODE XREF: Render_MeshPrimitive_21085+C1j
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_2110E
		or	ch, ch

loc_21156:
		jnz	loc_2147C
		mov	[bp+var_1C], dx

loc_2115D:
		mov	[bp+var_1E], dx
		mov	[bp+var_26], si
		cmp	di, si
		jnz	loc_211EE
		mov	bx, [bp+var_1C]

loc_2116C:				; CODE XREF: Render_MeshPrimitive_21085+FFj
		mov	si, bx
		mov	ax, [si]

loc_21170:				; CODE XREF: Render_MeshPrimitive_21085+FDj
		cmp	bx, [bp+var_12]
		ja	short loc_21178
		mov	bx, [bp+var_14]

loc_21178:				; CODE XREF: Render_MeshPrimitive_21085+EEj
		sub	bx, 16h
		cmp	bx, [bp+var_1C]
		jz	short loc_21186
		cmp	ax, [bx]
		jle	short loc_21170
		jmp	short loc_2116C
; ���������������������������������������������������������������������������

loc_21186:				; CODE XREF: Render_MeshPrimitive_21085+F9j
		mov	bx, [bp+var_1E]

loc_21189:				; CODE XREF: Render_MeshPrimitive_21085+11Cj
		mov	di, bx
		mov	ax, [di]

loc_2118D:				; CODE XREF: Render_MeshPrimitive_21085+11Aj
		add	bx, 16h

loc_21190:
		cmp	bx, [bp+var_14]

loc_21193:
		jb	short loc_21198

loc_21195:
		mov	bx, [bp+var_12]

loc_21198:				; CODE XREF: Render_MeshPrimitive_21085:loc_21193j
		cmp	bx, [bp+var_1E]
		jz	short loc_211A3
		cmp	ax, [bx]
		jge	short loc_2118D
		jmp	short loc_21189
; ���������������������������������������������������������������������������

loc_211A3:				; CODE XREF: Render_MeshPrimitive_21085+116j
		movsx	edx, word ptr [si]
		shl	edx, 10h
		mov	[bp+var_32], edx
		movsx	edx, word ptr [si+4]
		shl	edx, 8
		mov	[bp+var_3A], edx
		movsx	edx, word ptr [di]
		shl	edx, 10h
		mov	[bp+var_36], edx
		movsx	edx, word ptr [di+4]
		shl	edx, 8
		mov	[bp+var_3E], edx
		xor	eax, eax
		mov	[bp+var_42], eax
		mov	[bp+var_4A], eax
		mov	[bp+var_46], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_24], ax
		jmp	loc_21372
; ���������������������������������������������������������������������������

loc_211EE:				; CODE XREF: Render_MeshPrimitive_21085+E0j
					; Render_MeshPrimitive_21085+18Dj ...
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_211FE
		mov	si, [bp+var_14]

loc_211FE:				; CODE XREF: Render_MeshPrimitive_21085+174j
		sub	si, 16h
		mov	[bp+var_1C], si

loc_21204:
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_21214
		cmp	cx, [bp+var_4]
		jle	short loc_211EE

loc_21214:				; CODE XREF: Render_MeshPrimitive_21085+188j
		sub	cx, dx
		jz	short loc_211EE
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]

loc_21223:
		shl	edx, 10h

loc_21227:
		mov	ax, dx
		shl	eax, 10h

loc_2122D:
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_42], eax
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h

loc_21253:
		idiv	ecx
		mov	[bp+var_4A], eax
		mov	dx, [bx]

loc_2125C:
		mov	word ptr [bp+var_32], 8000h
		mov	word ptr [bp+var_32+2],	dx
		movzx	edx, word ptr [bx+4]
		shl	edx, 8
		mov	[bp+var_3A], edx

loc_21271:				; CODE XREF: Render_MeshPrimitive_21085+210j
					; Render_MeshPrimitive_21085+214j
		mov	bx, [bp+var_1E]
		mov	[bp+var_1A], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_21284
		mov	si, [bp+var_12]

loc_21284:				; CODE XREF: Render_MeshPrimitive_21085+1FAj
		mov	[bp+var_1E], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_21297
		cmp	cx, [bp+var_4]
		jle	short loc_21271

loc_21297:				; CODE XREF: Render_MeshPrimitive_21085+20Bj
		sub	cx, dx
		jz	short loc_21271
		mov	[bp+var_22], cx

loc_2129E:
		shl	ecx, 10h

loc_212A2:
		mov	dx, [si]
		sub	dx, [bx]

loc_212A6:
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_36], 8000h
		mov	word ptr [bp+var_36+2],	dx
		movzx	edx, word ptr [bx+4]
		shl	edx, 8
		mov	[bp+var_3E], edx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_26]
		sub	di, [bp+var_8]
		jg	short loc_21301
		add	ax, di

loc_21301:				; CODE XREF: Render_MeshPrimitive_21085+278j
		mov	[bp+var_24], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_26]
		jle	short loc_21372
		sub	[bp+var_24], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_26], cx
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h
		mov	eax, [bp+var_42]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_32], eax
		mov	eax, [bp+var_4A]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3A], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_1A]
		sub	cx, [bx+2]
		sub	[bp+var_22], cx
		shl	ecx, 10h
		mov	eax, [bp+var_46]
		imul	ecx

loc_21359:
		shrd	eax, edx, 10h
		add	[bp+var_36], eax
		mov	eax, [bp+var_4E]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3E], eax

loc_21372:				; CODE XREF: Render_MeshPrimitive_21085+166j
					; Render_MeshPrimitive_21085+285j
		mov	di, [bp+var_C]
		mov	ax, [bp+var_26]
		mov	ss:10DEh, ax
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_32]
		mov	ebx, [bp+var_36]
		mov	ecx, [bp+var_3A]
		mov	edx, [bp+var_3E]
		cmp	[bp+var_2E], 0
		jnz	loc_21494

loc_21399:
		nop

loc_2139A:				; CODE XREF: Render_MeshPrimitive_21085+3F4j
					; Render_MeshPrimitive_21085:loc_21491j	...
		push	eax

loc_2139C:
		push	ebx
		push	ecx
		push	edx

loc_213A2:
		push	edi
		cmp	ebx, eax
		jg	short loc_213AE
		xchg	eax, ebx
		xchg	ecx, edx

loc_213AE:				; CODE XREF: Render_MeshPrimitive_21085+322j
		shr	eax, 10h
		shr	ebx, 10h
		mov	ss:10E0h, ax
		add	di, ax
		sub	bx, ax
		mov	si, bx
		jz	short loc_213DD
		sub	edx, ecx
		shl	ebx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		shld	edx, eax, 10h
		mov	bx, si

loc_213DD:				; CODE XREF: Render_MeshPrimitive_21085+33Bj
		add	bx, di
		mov	[bp+var_2C], bx
		inc	si
		mov	bx, cx
		shr	ecx, 10h
		push	bp
		mov	bp, bx
		mov	ch, cl
		push	ax
		mov	ax, ss:10E0h
		xor	ax, ss:10DEh
		shl	ax, 0Fh
		add	bp, ax
		adc	ch, al
		xor	ah, 80h
		add	bx, ax
		adc	cl, al
		pop	ax
		test	di, 1
		jz	short loc_21420
		mov	es:[di], cl
		inc	di
		dec	si
		jz	short loc_21441
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		xchg	bx, bp
		xchg	cl, ch

loc_21420:				; CODE XREF: Render_MeshPrimitive_21085+386j
		add	ax, ax
		adc	dl, dl
		shr	si, 1
		jz	short loc_2143E
		pushf
		nop

loc_2142A:				; CODE XREF: Render_MeshPrimitive_21085+3B4j
		mov	es:[di], cx
		add	di, 2
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		dec	si
		jnz	short loc_2142A
		popf
		jnb	short loc_21441

loc_2143E:				; CODE XREF: Render_MeshPrimitive_21085+3A1j
		mov	es:[di], cl

loc_21441:				; CODE XREF: Render_MeshPrimitive_21085+38Dj
					; Render_MeshPrimitive_21085+3B7j
		pop	bp
		pop	edi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		add	di, [bp+var_A]
		inc	word ptr ss:10DEh

loc_21454:
		dec	[bp+var_24]

loc_21457:
		js	short loc_2147C

loc_21459:
		jz	short loc_21481
		dec	[bp+var_20]
		jz	loc_215E0

loc_21462:
		add	eax, [bp+var_42]

loc_21466:
		add	ecx, [bp+var_4A]

loc_2146A:				; CODE XREF: Render_MeshPrimitive_21085+5DFj
		dec	[bp+var_22]
		jz	loc_2166B
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_2139A
; ���������������������������������������������������������������������������

loc_2147C:				; CODE XREF: Render_MeshPrimitive_21085:loc_21156j
					; Render_MeshPrimitive_21085:loc_21457j	...
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_21481:				; CODE XREF: Render_MeshPrimitive_21085:loc_21459j
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]

loc_21491:
		jmp	loc_2139A
; ���������������������������������������������������������������������������

loc_21494:				; CODE XREF: Render_MeshPrimitive_21085+310j
					; Render_MeshPrimitive_21085:loc_215A3j	...
		push	eax
		push	ebx
		push	ecx
		push	edx

loc_2149C:
		push	edi

loc_2149E:
		cmp	ebx, eax
		jg	short loc_214A8

loc_214A3:
		xchg	eax, ebx
		xchg	ecx, edx

loc_214A8:				; CODE XREF: Render_MeshPrimitive_21085+41Cj
		shr	eax, 10h
		cmp	ax, [bp+var_6]
		jg	loc_2156C
		shr	ebx, 10h
		cmp	bx, [bp+var_2]
		jl	loc_2156C
		mov	ss:10E0h, ax
		mov	[bp+var_28], ax
		mov	[bp+var_2A], bx
		add	di, ax
		sub	bx, ax
		mov	si, bx
		inc	si
		cmp	si, 1
		jz	short loc_214EC
		sub	edx, ecx
		shl	ebx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_52], eax

loc_214EC:				; CODE XREF: Render_MeshPrimitive_21085+44Dj
		mov	bx, cx
		shr	ecx, 10h
		mov	ax, [bp+var_2]
		sub	ax, [bp+var_28]
		jg	loc_215B9

loc_214FC:				; CODE XREF: Render_MeshPrimitive_21085+553j
		mov	ax, [bp+var_2A]
		sub	ax, [bp+var_6]
		jg	loc_215DB

loc_21506:				; CODE XREF: Render_MeshPrimitive_21085+558j
		mov	ax, di
		add	ax, si
		dec	ax
		mov	[bp+var_2C], ax
		mov	ax, word ptr [bp+var_52]
		mov	dx, word ptr [bp+var_52+2]
		push	bp
		mov	bp, bx
		mov	ch, cl
		push	ax
		mov	ax, ss:10E0h

loc_2151E:
		xor	ax, ss:10DEh

loc_21523:
		shl	ax, 0Fh

loc_21526:
		add	bp, ax
		adc	ch, al
		xor	ah, 80h
		add	bx, ax
		adc	cl, al
		pop	ax
		test	di, 1
		jz	short loc_2154B
		mov	es:[di], cl
		inc	di
		dec	si
		jz	short loc_2156B
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		xchg	bx, bp
		xchg	cl, ch

loc_2154B:				; CODE XREF: Render_MeshPrimitive_21085+4B1j
		add	ax, ax
		adc	dl, dl
		shr	si, 1

loc_21551:
		jz	short loc_21568
		pushf

loc_21554:				; CODE XREF: Render_MeshPrimitive_21085+4DEj
		mov	es:[di], cx

loc_21557:
		add	di, 2
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		dec	si
		jg	short loc_21554
		popf
		jnb	short loc_2156B

loc_21568:				; CODE XREF: Render_MeshPrimitive_21085:loc_21551j
		mov	es:[di], cl

loc_2156B:				; CODE XREF: Render_MeshPrimitive_21085+4B8j
					; Render_MeshPrimitive_21085+4E1j
		pop	bp

loc_2156C:				; CODE XREF: Render_MeshPrimitive_21085+42Aj
					; Render_MeshPrimitive_21085+435j
		pop	edi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		add	di, [bp+var_A]
		inc	word ptr ss:10DEh
		dec	[bp+var_24]
		js	loc_2147C
		jz	short loc_215A6
		dec	[bp+var_20]
		jz	short loc_215E0
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]

loc_21594:				; CODE XREF: Render_MeshPrimitive_21085+5E3j
		dec	[bp+var_22]
		jz	loc_2166B
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]

loc_215A3:
		jmp	loc_21494
; ���������������������������������������������������������������������������

loc_215A6:				; CODE XREF: Render_MeshPrimitive_21085+500j
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_21494
; ���������������������������������������������������������������������������

loc_215B9:				; CODE XREF: Render_MeshPrimitive_21085+473j
		add	di, ax
		sub	si, ax
		add	ss:10E0h, ax
		shl	eax, 10h
		imul	[bp+var_52]
		shrd	eax, edx, 10h
		shld	edx, eax, 10h
		add	bx, ax
		adc	cx, dx
		jmp	loc_214FC
; ���������������������������������������������������������������������������

loc_215DB:				; CODE XREF: Render_MeshPrimitive_21085+47Dj
		sub	si, ax
		jmp	loc_21506
; ���������������������������������������������������������������������������

loc_215E0:				; CODE XREF: Render_MeshPrimitive_21085+3D9j
					; Render_MeshPrimitive_21085+505j
		push	ebx
		push	edx
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_215F4
		mov	si, [bp+var_14]

loc_215F4:				; CODE XREF: Render_MeshPrimitive_21085+56Aj
		sub	si, 16h
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_20], cx
		shl	ecx, 10h
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx

loc_2162D:
		mov	[bp+var_4A], eax
		mov	dx, [si]

loc_21633:
		sub	dx, [bx]

loc_21635:
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_42], eax
		movzx	ecx, word ptr [bx+4]

loc_2164F:
		shl	ecx, 8
		mov	ax, [bx]
		shl	eax, 10h
		mov	ax, 8000h
		pop	edx
		pop	ebx
		cmp	[bp+var_2E], 0
		jz	loc_2146A
		jmp	loc_21594
; ���������������������������������������������������������������������������

loc_2166B:				; CODE XREF: Render_MeshPrimitive_21085+3E8j
					; Render_MeshPrimitive_21085+512j
		push	eax
		push	ecx
		mov	bx, [bp+var_1E]
		mov	[bp+var_1A], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_21682
		mov	si, [bp+var_12]

loc_21682:				; CODE XREF: Render_MeshPrimitive_21085+5F8j
		mov	[bp+var_1E], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_22], cx
		shl	ecx, 10h
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [bx+4]
		shl	edx, 8
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bx, 8000h
		pop	ecx
		pop	eax
		cmp	[bp+var_2E], 0
		jz	loc_2139A
		jmp	loc_21494
Render_MeshPrimitive_21085	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,849L — même famille avec 7 arguments (buffer local 0x68) : primitive de rendu graphique
; la plus paramétrée du cluster (candidat : rendu de mesh 3D texturé/ombré), la plus grosse
; fonction identifiée à ce jour avec sub_13100, à approfondir en session dédiée.
; ==============================================================================================
Render_MeshPrimitive_216F6	proc far		; CODE XREF: Render_MeshPrimitive_216F6:loc_21728p
					; Mesh_SubdivideRecursive+D0P ...

var_68		= word ptr -68h
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
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
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= dword	ptr  14h

		enter	68h, 0
		push	ds
		push	si
		push	di
		cld
		test	sp, 3
		jz	short loc_21732
		mov	cx, 12h
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs

loc_21728:
		call	near ptr Render_MeshPrimitive_216F6

loc_2172B:
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_21732:				; CODE XREF: Render_MeshPrimitive_216F6+Cj
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]

loc_21753:
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, word ptr [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]

loc_21762:
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_10], bx
		mov	[bp+var_12], ax
		mov	word ptr [bp+var_2E], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_2177F:				; CODE XREF: Render_MeshPrimitive_216F6+CDj
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		shl	ax, 1

loc_21791:
		rcl	cl, 1

loc_21793:
		or	byte ptr [bp+var_2E], cl

loc_21796:
		mov	ax, [bx+2]

loc_21799:
		sub	ax, [bp+var_4]
		shl	ax, 1

loc_2179E:
		rcl	cl, 1
		mov	ax, [bp+var_8]

loc_217A3:
		sub	ax, [bx+2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_217B5
		mov	si, ax
		mov	dx, bx

loc_217B5:				; CODE XREF: Render_MeshPrimitive_216F6+B9j
		cmp	ax, di
		jl	short loc_217BB
		mov	di, ax

loc_217BB:				; CODE XREF: Render_MeshPrimitive_216F6+C1j
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_12]
		jnz	short loc_2177F
		or	ch, ch
		jnz	loc_21C71
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_68], ds
		mov	[bp+var_24], si
		cmp	di, si
		jnz	loc_21880
		mov	bx, [bp+var_1A]

loc_217E0:				; CODE XREF: Render_MeshPrimitive_216F6+102j
		mov	si, bx
		mov	ax, [si]

loc_217E4:				; CODE XREF: Render_MeshPrimitive_216F6+100j
		cmp	bx, [bp+var_10]
		ja	short loc_217EC
		mov	bx, [bp+var_12]

loc_217EC:				; CODE XREF: Render_MeshPrimitive_216F6+F1j
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_217FA
		cmp	ax, [bx]
		jle	short loc_217E4
		jmp	short loc_217E0
; ���������������������������������������������������������������������������

loc_217FA:				; CODE XREF: Render_MeshPrimitive_216F6+FCj
		mov	bx, [bp+var_1C]

loc_217FD:				; CODE XREF: Render_MeshPrimitive_216F6+11Fj
		mov	di, bx
		mov	ax, [di]

loc_21801:				; CODE XREF: Render_MeshPrimitive_216F6+11Dj
		add	bx, 16h
		cmp	bx, [bp+var_12]
		jb	short loc_2180C
		mov	bx, [bp+var_10]

loc_2180C:				; CODE XREF: Render_MeshPrimitive_216F6+111j
		cmp	bx, [bp+var_1C]
		jz	short loc_21817
		cmp	ax, [bx]
		jge	short loc_21801
		jmp	short loc_217FD
; ���������������������������������������������������������������������������

loc_21817:				; CODE XREF: Render_MeshPrimitive_216F6+119j
		mov	dx, [si]
		shl	edx, 10h
		mov	[bp+var_2E], edx

loc_21821:
		movzx	edx, word ptr [si+6]
		shl	edx, 8

loc_2182A:
		mov	[bp+var_36], edx

loc_2182E:
		movzx	edx, word ptr [si+8]

loc_21833:
		shl	edx, 8
		mov	[bp+var_3E], edx
		mov	dx, [di]
		shl	edx, 10h
		mov	[bp+var_32], edx
		movzx	edx, word ptr [di+6]
		shl	edx, 8
		mov	[bp+var_3A], edx

loc_21852:
		movzx	edx, word ptr [di+8]

loc_21857:
		shl	edx, 8

loc_2185B:
		mov	[bp+var_42], edx
		xor	eax, eax
		mov	[bp+var_46], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_56], eax
		mov	[bp+var_4A], eax
		mov	[bp+var_52], eax
		mov	[bp+var_5A], eax
		mov	[bp+var_22], ax
		jmp	loc_21A84
; ���������������������������������������������������������������������������

loc_21880:				; CODE XREF: Render_MeshPrimitive_216F6+E3j
					; Render_MeshPrimitive_216F6+1AEj ...
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_10]
		ja	short loc_21890
		mov	si, [bp+var_12]

loc_21890:				; CODE XREF: Render_MeshPrimitive_216F6+195j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_218A6
		cmp	cx, [bp+var_4]
		jle	short loc_21880

loc_218A6:				; CODE XREF: Render_MeshPrimitive_216F6+1A9j
		sub	cx, dx
		jz	short loc_21880
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		movzx	edx, word ptr [si+8]
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_56], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_2E], 8000h
		mov	word ptr [bp+var_2E+2],	dx
		movzx	edx, word ptr [bx+6]
		shl	edx, 8
		mov	[bp+var_36], edx
		movzx	edx, word ptr [bx+8]
		shl	edx, 8
		mov	[bp+var_3E], edx

loc_21932:				; CODE XREF: Render_MeshPrimitive_216F6+260j
					; Render_MeshPrimitive_216F6+264j
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_12]
		jb	short loc_21945
		mov	si, [bp+var_10]

loc_21945:				; CODE XREF: Render_MeshPrimitive_216F6+24Aj
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_21958
		cmp	cx, [bp+var_4]
		jle	short loc_21932

loc_21958:				; CODE XREF: Render_MeshPrimitive_216F6+25Bj
		sub	cx, dx
		jz	short loc_21932
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4A], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx

loc_2198F:
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_52], eax
		movzx	edx, word ptr [si+8]

loc_219A3:
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_5A], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_32], 8000h
		mov	word ptr [bp+var_32+2],	dx
		movzx	edx, word ptr [bx+6]
		shl	edx, 8
		mov	[bp+var_3A], edx
		movzx	edx, word ptr [bx+8]
		shl	edx, 8
		mov	[bp+var_42], edx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]
		jg	short loc_219F1
		add	ax, di

loc_219F1:				; CODE XREF: Render_MeshPrimitive_216F6+2F7j
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	loc_21A84
		sub	[bp+var_22], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_24], cx
		mov	bx, [bp+var_16]
		sub	cx, [bx+2]
		sub	[bp+var_1E], cx
		shl	ecx, 10h
		mov	eax, [bp+var_46]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_2E], eax
		mov	eax, [bp+var_4E]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_36], eax
		mov	eax, [bp+var_56]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3E], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h
		mov	eax, [bp+var_4A]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_32], eax
		mov	eax, [bp+var_52]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3A], eax
		mov	eax, [bp+var_5A]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_42], eax

loc_21A84:				; CODE XREF: Render_MeshPrimitive_216F6+187j
					; Render_MeshPrimitive_216F6+304j
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	ax, [bp+var_C]
		mov	[bp+var_2A], ax
		mov	ax, 13CCh

loc_21A93:
		cmp	[bp+arg_E], 0

loc_21A98:
		jz	short loc_21AA6
		lfs	bx, [bp+arg_E]

loc_21A9E:
		mov	ss:10E2h, bx

loc_21AA3:
		mov	ax, 13A0h

loc_21AA6:				; CODE XREF: Render_MeshPrimitive_216F6:loc_21A98j
		mov	ss:10D4h, ax
		mov	eax, [bp+var_2E]
		mov	ebx, [bp+var_32]
		mov	ecx, [bp+var_36]
		mov	edx, [bp+var_3A]
		mov	esi, [bp+var_3E]
		mov	edi, [bp+var_42]
		mov	ds, [bp+arg_A]

loc_21AC5:				; CODE XREF: Render_MeshPrimitive_216F6+578j
					; Render_MeshPrimitive_216F6+598j ...
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	esi
		push	edi
		cmp	ebx, eax
		jg	short loc_21ADE
		xchg	eax, ebx
		xchg	ecx, edx
		xchg	esi, edi

loc_21ADE:				; CODE XREF: Render_MeshPrimitive_216F6+3DEj
		shr	eax, 10h
		cmp	ax, [bp+var_6]
		jg	loc_21C31
		shr	ebx, 10h
		cmp	bx, [bp+var_2]
		jl	loc_21C31
		mov	[bp+var_26], ax
		mov	[bp+var_28], bx
		mov	[bp+var_66], ecx
		sub	bx, ax
		jz	loc_21B96
		shl	ebx, 10h
		sub	edx, ecx
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_5E], eax
		shld	edx, eax, 10h

loc_21B21:
		mov	cx, 1
		or	dx, dx

loc_21B26:
		jns	short loc_21B30

loc_21B28:
		neg	cx
		cmp	ax, 1

loc_21B2D:
		sbb	dx, 0FFFFh

loc_21B30:				; CODE XREF: Render_MeshPrimitive_216F6:loc_21B26j
		add	cx, dx
		push	cx
		push	dx

loc_21B34:
		sub	edi, esi
		mov	edx, edi
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_62], eax
		shld	edx, eax, 10h

loc_21B50:
		mov	cx, [bp+arg_C]

loc_21B53:
		or	dx, dx

loc_21B55:
		jns	short loc_21B5F
		neg	cx
		cmp	ax, 1
		sbb	dx, 0FFFFh

loc_21B5F:				; CODE XREF: Render_MeshPrimitive_216F6:loc_21B55j
		mov	ax, [bp+arg_C]
		imul	dx
		pop	dx
		pop	bx
		add	dx, ax
		mov	ss:10D6h, dx
		add	dx, cx
		mov	ss:10D8h, dx
		add	bx, ax
		mov	ss:10DAh, bx
		add	bx, cx
		mov	ss:10DCh, bx
		mov	cx, [bp+var_2]
		sub	cx, [bp+var_26]
		jg	loc_21C91

loc_21B8C:				; CODE XREF: Render_MeshPrimitive_216F6+5C1j
		mov	ax, [bp+var_28]
		sub	ax, [bp+var_6]
		jg	loc_21CBA

loc_21B96:				; CODE XREF: Render_MeshPrimitive_216F6+40Aj
					; Render_MeshPrimitive_216F6+5C7j
		mov	ecx, esi
		shr	esi, 10h
		mov	ax, si
		mul	[bp+arg_C]
		add	ax, [bp+arg_8]
		add	ax, word ptr [bp+var_66+2]
		mov	si, ax
		mov	ax, [bp+var_26]
		mov	di, [bp+var_2A]
		add	di, ax
		mov	bx, [bp+var_28]
		sub	bx, ax
		push	ebp
		mov	edx, [bp+var_66]
		mov	eax, [bp+var_5E]
		or	eax, eax
		jns	short loc_21BCA
		neg	ax
		not	dx

loc_21BCA:				; CODE XREF: Render_MeshPrimitive_216F6+4CEj
		mov	ebp, [bp+var_62]
		or	ebp, ebp
		jns	short loc_21BD7
		neg	bp
		not	cx

loc_21BD7:				; CODE XREF: Render_MeshPrimitive_216F6+4DBj
		inc	bx
		push	bx
		xor	bx, bx
		jmp	word ptr ss:10D4h
; ���������������������������������������������������������������������������

loc_21BE0:				; CODE XREF: Render_MeshPrimitive_216F6+512j
		mov	bl, [si]
		cmp	bl, 0FFh
		jz	short loc_21BF2
		add	bx, ss:10E2h
		mov	bl, fs:[bx]
		mov	es:[di], bl

loc_21BF2:				; CODE XREF: Render_MeshPrimitive_216F6+4EFj
		inc	di
		xor	bx, bx
		add	dx, ax
		adc	bx, bx
		add	cx, bp
		adc	bx, bx
		add	bx, bx
		add	si, ss:[bx+10D6h]
		dec	word ptr [esp]
		jg	short loc_21BE0
		jmp	short loc_21C2E
; ���������������������������������������������������������������������������

loc_21C0C:				; CODE XREF: Render_MeshPrimitive_216F6+536j
		mov	bl, [si]
		cmp	bl, 0FFh
		jz	short loc_21C16
		mov	es:[di], bl

loc_21C16:				; CODE XREF: Render_MeshPrimitive_216F6+51Bj
		inc	di
		xor	bx, bx
		add	dx, ax
		adc	bx, bx
		add	cx, bp
		adc	bx, bx

loc_21C21:
		add	bx, bx
		add	si, ss:[bx+10D6h]
		dec	word ptr [esp]
		jg	short loc_21C0C

loc_21C2E:				; CODE XREF: Render_MeshPrimitive_216F6+514j
		pop	di
		pop	ebp

loc_21C31:				; CODE XREF: Render_MeshPrimitive_216F6+3EFj
					; Render_MeshPrimitive_216F6+3FAj
		mov	di, [bp+var_A]
		add	[bp+var_2A], di
		pop	edi
		pop	esi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		dec	[bp+var_22]
		js	short loc_21C71
		jz	short loc_21C76
		dec	[bp+var_1E]
		jz	short loc_21CC0
		add	eax, [bp+var_46]
		add	ecx, [bp+var_4E]
		add	esi, [bp+var_56]

loc_21C5B:				; CODE XREF: Render_MeshPrimitive_216F6+67Bj
		dec	[bp+var_20]

loc_21C5E:
		jz	loc_21D74

loc_21C62:
		add	ebx, [bp+var_4A]

loc_21C66:
		add	edx, [bp+var_52]
		add	edi, [bp+var_5A]
		jmp	loc_21AC5
; ���������������������������������������������������������������������������

loc_21C71:				; CODE XREF: Render_MeshPrimitive_216F6+D1j
					; Render_MeshPrimitive_216F6+550j
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_21C76:				; CODE XREF: Render_MeshPrimitive_216F6+552j
		add	eax, [bp+var_46]
		add	ecx, [bp+var_4E]
		add	esi, [bp+var_56]
		add	ebx, [bp+var_4A]
		add	edx, [bp+var_52]
		add	edi, [bp+var_5A]
		jmp	loc_21AC5
; ���������������������������������������������������������������������������

loc_21C91:				; CODE XREF: Render_MeshPrimitive_216F6+492j
		add	[bp+var_26], cx
		shl	ecx, 10h
		mov	eax, [bp+var_5E]
		imul	ecx

loc_21C9F:
		shrd	eax, edx, 10h
		add	[bp+var_66], eax
		mov	eax, [bp+var_62]
		imul	ecx
		shrd	eax, edx, 10h
		add	esi, eax
		jmp	loc_21B8C
; ���������������������������������������������������������������������������

loc_21CBA:				; CODE XREF: Render_MeshPrimitive_216F6+49Cj
		sub	[bp+var_28], ax
		jmp	loc_21B96
; ���������������������������������������������������������������������������

loc_21CC0:				; CODE XREF: Render_MeshPrimitive_216F6+557j
		push	ebx
		push	edx
		mov	ds, [bp+var_68]
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_10]
		ja	short loc_21CD7
		mov	si, [bp+var_12]

loc_21CD7:				; CODE XREF: Render_MeshPrimitive_216F6+5DCj
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx

loc_21D1E:
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		movzx	edx, word ptr [si+8]

loc_21D32:
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_56], eax
		mov	ax, [bx]
		shl	eax, 10h
		mov	ax, 8000h

loc_21D58:
		movzx	ecx, word ptr [bx+6]
		shl	ecx, 8

loc_21D61:
		movzx	esi, word ptr [bx+8]
		shl	esi, 8
		mov	ds, [bp+arg_A]
		pop	edx
		pop	ebx
		jmp	loc_21C5B
; ���������������������������������������������������������������������������

loc_21D74:				; CODE XREF: Render_MeshPrimitive_216F6:loc_21C5Ej
		push	eax
		push	ecx
		push	esi
		mov	ds, [bp+var_68]
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_12]
		jb	short loc_21D90
		mov	si, [bp+var_10]

loc_21D90:				; CODE XREF: Render_MeshPrimitive_216F6+695j
		mov	[bp+var_1C], si

loc_21D93:
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4A], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_52], eax
		movzx	edx, word ptr [si+8]
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_5A], eax
		movzx	edx, word ptr [bx+6]
		shl	edx, 8
		movzx	edi, word ptr [bx+8]
		shl	edi, 8
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bx, 8000h

loc_21E20:
		mov	ds, [bp+arg_A]

loc_21E23:
		pop	esi

loc_21E25:
		pop	ecx

loc_21E27:
		pop	eax
		jmp	loc_21AC5
Render_MeshPrimitive_216F6	endp

seg037		ends
