seg060		segment	byte public 'CODE' use16
		assume cs:seg060
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_PolygonPrimitive_20848 (sub_20848 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,566L — stub d'alignement pile (auto-réappel
; après alignement 4 octets, pattern généré par le compilateur pour arguments 32-bit), puis
; rasterisation avec clipping style Cohen-Sutherland (codes de sortie par bits, comparaison à
; un rectangle de clip, structure de 22 octets/sommet, recherche de min/max Y) : primitive de
; rendu graphique — remplissage/tracé de polygone avec clipping. Trop volumineuse pour une
; passe détaillée.
; ==============================================================================================
Render_PolygonPrimitive_2751E	proc far		; CODE XREF: seg042:07D2P seg042:0D21P ...

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
		push	di
		cld
		test	sp, 3
		jz	short loc_2755A
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
		call	near ptr Render_PolygonPrimitive_2751E
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_2755A:				; CODE XREF: Render_PolygonPrimitive_2751E+Cj
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

loc_275A7:				; CODE XREF: Render_PolygonPrimitive_2751E+CDj
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
		jg	short loc_275DD
		mov	si, ax
		mov	dx, bx

loc_275DD:				; CODE XREF: Render_PolygonPrimitive_2751E+B9j
		cmp	ax, di
		jl	short loc_275E3
		mov	di, ax

loc_275E3:				; CODE XREF: Render_PolygonPrimitive_2751E+C1j
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_275A7
		or	ch, ch
		jnz	loc_277EC
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_24], si
		cmp	di, si
		jnz	short loc_27663
		mov	bx, [bp+var_1A]

loc_27603:				; CODE XREF: Render_PolygonPrimitive_2751E+FDj
		mov	si, bx
		mov	ax, [si]

loc_27607:				; CODE XREF: Render_PolygonPrimitive_2751E+FBj
		cmp	bx, [bp+var_12]
		ja	short loc_2760F
		mov	bx, [bp+var_14]

loc_2760F:				; CODE XREF: Render_PolygonPrimitive_2751E+ECj
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_2761D
		cmp	ax, [bx]
		jle	short loc_27607
		jmp	short loc_27603
; ���������������������������������������������������������������������������

loc_2761D:				; CODE XREF: Render_PolygonPrimitive_2751E+F7j
		mov	bx, [bp+var_1C]

loc_27620:				; CODE XREF: Render_PolygonPrimitive_2751E+11Aj
		mov	di, bx
		mov	ax, [di]

loc_27624:				; CODE XREF: Render_PolygonPrimitive_2751E+118j
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_2762F
		mov	bx, [bp+var_12]

loc_2762F:				; CODE XREF: Render_PolygonPrimitive_2751E+10Cj
		cmp	bx, [bp+var_1C]
		jz	short loc_2763A
		cmp	ax, [bx]
		jge	short loc_27624
		jmp	short loc_27620
; ���������������������������������������������������������������������������

loc_2763A:				; CODE XREF: Render_PolygonPrimitive_2751E+114j
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
		jmp	loc_27769
; ���������������������������������������������������������������������������

loc_27663:				; CODE XREF: Render_PolygonPrimitive_2751E+E0j
					; Render_PolygonPrimitive_2751E+169j ...
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_27673
		mov	si, [bp+var_14]

loc_27673:				; CODE XREF: Render_PolygonPrimitive_2751E+150j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_27689
		cmp	cx, [bp+var_4]
		jle	short loc_27663

loc_27689:				; CODE XREF: Render_PolygonPrimitive_2751E+164j
		sub	cx, dx
		jz	short loc_27663
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

loc_276B7:				; CODE XREF: Render_PolygonPrimitive_2751E+1BDj
					; Render_PolygonPrimitive_2751E+1C1j
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_276CA
		mov	si, [bp+var_12]

loc_276CA:				; CODE XREF: Render_PolygonPrimitive_2751E+1A7j
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_276DD
		cmp	cx, [bp+var_4]
		jle	short loc_276B7

loc_276DD:				; CODE XREF: Render_PolygonPrimitive_2751E+1B8j
		sub	cx, dx
		jz	short loc_276B7
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_2C], 8000h
		mov	word ptr [bp+var_2C+2],	dx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]
		jg	short loc_27718
		add	ax, di

loc_27718:				; CODE XREF: Render_PolygonPrimitive_2751E+1F6j
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	short loc_27769
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

loc_27769:				; CODE XREF: Render_PolygonPrimitive_2751E+142j
					; Render_PolygonPrimitive_2751E+203j
		mov	bx, [bp+var_12]
		mov	ax, [bx+4]
		mov	ah, al
		mov	dx, ax
		shl	eax, 10h
		mov	ax, dx
		mov	[bp+var_38], eax
		mov	di, [bp+var_C]
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_28]
		mov	ebx, [bp+var_2C]
		cmp	[bp+var_10], 0
		jnz	short loc_277FC

loc_27796:				; CODE XREF: Render_PolygonPrimitive_2751E+2CCj
					; Render_PolygonPrimitive_2751E+2DBj ...
		push	eax
		push	edi
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_277A4
		xchg	eax, edx

loc_277A4:				; CODE XREF: Render_PolygonPrimitive_2751E+282j
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
		js	short loc_277EC
		jz	short loc_277F1
		dec	[bp+var_1E]
		jz	loc_27877
		add	eax, [bp+var_30]

loc_277DF:				; CODE XREF: Render_PolygonPrimitive_2751E+3AEj
		dec	[bp+var_20]
		jz	loc_278D2
		add	ebx, [bp+var_34]
		jmp	short loc_27796
; ���������������������������������������������������������������������������

loc_277EC:				; CODE XREF: Render_PolygonPrimitive_2751E+D1j
					; Render_PolygonPrimitive_2751E+2B2j ...
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_277F1:				; CODE XREF: Render_PolygonPrimitive_2751E+2B4j
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_27796
; ���������������������������������������������������������������������������
		align 2

loc_277FC:				; CODE XREF: Render_PolygonPrimitive_2751E+276j
					; Render_PolygonPrimitive_2751E+343j ...
		push	eax
		push	edi
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_2780A
		xchg	eax, edx

loc_2780A:				; CODE XREF: Render_PolygonPrimitive_2751E+2E8j
		shr	eax, 10h
		shr	edx, 10h
		cmp	ax, [bp+var_6]
		jg	short loc_27841
		cmp	dx, [bp+var_2]
		jl	short loc_27841
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	edi, eax
		sub	ax, [bp+var_2]
		jl	short loc_2786D

loc_27829:				; CODE XREF: Render_PolygonPrimitive_2751E+353j
		sub	dx, [bp+var_6]
		jg	short loc_27873

loc_2782E:				; CODE XREF: Render_PolygonPrimitive_2751E+357j
		mov	eax, [bp+var_38]
		mov	dx, cx
		and	cx, 3
		rep stosb
		mov	cx, dx
		shr	cx, 2
		rep stosd

loc_27841:				; CODE XREF: Render_PolygonPrimitive_2751E+2F7j
					; Render_PolygonPrimitive_2751E+2FCj
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_277EC
		jz	short loc_27863
		dec	[bp+var_1E]
		jz	short loc_27877
		add	eax, [bp+var_30]

loc_27858:				; CODE XREF: Render_PolygonPrimitive_2751E+3B2j
		dec	[bp+var_20]
		jz	short loc_278D2
		add	ebx, [bp+var_34]
		jmp	short loc_277FC
; ���������������������������������������������������������������������������

loc_27863:				; CODE XREF: Render_PolygonPrimitive_2751E+32Fj
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_277FC
; ���������������������������������������������������������������������������

loc_2786D:				; CODE XREF: Render_PolygonPrimitive_2751E+309j
		sub	di, ax
		add	cx, ax
		jmp	short loc_27829
; ���������������������������������������������������������������������������

loc_27873:				; CODE XREF: Render_PolygonPrimitive_2751E+30Ej
		sub	cx, dx
		jmp	short loc_2782E
; ���������������������������������������������������������������������������

loc_27877:				; CODE XREF: Render_PolygonPrimitive_2751E+2B9j
					; Render_PolygonPrimitive_2751E+334j
		push	ebx
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_27889
		mov	si, [bp+var_14]

loc_27889:				; CODE XREF: Render_PolygonPrimitive_2751E+366j
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
		jz	loc_277DF
		jmp	short loc_27858
; ���������������������������������������������������������������������������

loc_278D2:				; CODE XREF: Render_PolygonPrimitive_2751E+2C4j
					; Render_PolygonPrimitive_2751E+33Dj
		push	eax
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_278E7
		mov	si, [bp+var_12]

loc_278E7:				; CODE XREF: Render_PolygonPrimitive_2751E+3C4j
		mov	[bp+var_1C], si
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
		mov	[bp+var_34], eax
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bx, 8000h
		pop	eax
		cmp	[bp+var_10], 0
		jz	loc_27796
		jmp	loc_277FC
Render_PolygonPrimitive_2751E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2792E	proc far		; CODE XREF: seg042:0911P
					; sub_2792E+32p

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
		jz	short loc_2796A
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
		call	near ptr sub_2792E
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_2796A:				; CODE XREF: sub_2792E+Cj
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

loc_279B7:				; CODE XREF: sub_2792E+CDj
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
		jg	short loc_279ED
		mov	si, ax
		mov	dx, bx

loc_279ED:				; CODE XREF: sub_2792E+B9j
		cmp	ax, di
		jl	short loc_279F3
		mov	di, ax

loc_279F3:				; CODE XREF: sub_2792E+C1j
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_279B7
		or	ch, ch
		jnz	loc_27C04
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_24], si
		cmp	di, si
		jnz	short loc_27A73
		mov	bx, [bp+var_1A]

loc_27A13:				; CODE XREF: sub_2792E+FDj
		mov	si, bx
		mov	ax, [si]

loc_27A17:				; CODE XREF: sub_2792E+FBj
		cmp	bx, [bp+var_12]
		ja	short loc_27A1F
		mov	bx, [bp+var_14]

loc_27A1F:				; CODE XREF: sub_2792E+ECj
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_27A2D
		cmp	ax, [bx]
		jle	short loc_27A17
		jmp	short loc_27A13
; ���������������������������������������������������������������������������

loc_27A2D:				; CODE XREF: sub_2792E+F7j
		mov	bx, [bp+var_1C]

loc_27A30:				; CODE XREF: sub_2792E+11Aj
		mov	di, bx
		mov	ax, [di]

loc_27A34:				; CODE XREF: sub_2792E+118j
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_27A3F
		mov	bx, [bp+var_12]

loc_27A3F:				; CODE XREF: sub_2792E+10Cj
		cmp	bx, [bp+var_1C]
		jz	short loc_27A4A
		cmp	ax, [bx]
		jge	short loc_27A34
		jmp	short loc_27A30
; ���������������������������������������������������������������������������

loc_27A4A:				; CODE XREF: sub_2792E+114j
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
		jmp	loc_27B79
; ���������������������������������������������������������������������������

loc_27A73:				; CODE XREF: sub_2792E+E0j
					; sub_2792E+169j ...
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_27A83
		mov	si, [bp+var_14]

loc_27A83:				; CODE XREF: sub_2792E+150j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_27A99
		cmp	cx, [bp+var_4]
		jle	short loc_27A73

loc_27A99:				; CODE XREF: sub_2792E+164j
		sub	cx, dx
		jz	short loc_27A73
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

loc_27AC7:				; CODE XREF: sub_2792E+1BDj
					; sub_2792E+1C1j
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_27ADA
		mov	si, [bp+var_12]

loc_27ADA:				; CODE XREF: sub_2792E+1A7j
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_27AED
		cmp	cx, [bp+var_4]
		jle	short loc_27AC7

loc_27AED:				; CODE XREF: sub_2792E+1B8j
		sub	cx, dx
		jz	short loc_27AC7
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_2C], 8000h
		mov	word ptr [bp+var_2C+2],	dx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]
		jg	short loc_27B28
		add	ax, di

loc_27B28:				; CODE XREF: sub_2792E+1F6j
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	short loc_27B79
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

loc_27B79:				; CODE XREF: sub_2792E+142j
					; sub_2792E+203j
		mov	fs, [bp+arg_A]
		mov	di, [bp+var_C]
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_28]
		mov	ebx, [bp+var_2C]
		cmp	[bp+var_10], 0
		jnz	short loc_27C14
		nop
		nop
		nop

loc_27B98:				; CODE XREF: sub_2792E+2D4j
					; sub_2792E+2E3j ...
		push	eax
		push	edi
		push	ebx
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_27BA8
		xchg	eax, edx

loc_27BA8:				; CODE XREF: sub_2792E+276j
		shr	eax, 10h
		shr	edx, 10h
		mov	cx, dx
		sub	cx, ax
		add	edi, eax
		mov	si, [bp+arg_8]
		xor	bx, bx
		shr	cx, 1
		jz	short loc_27BDC
		jnb	short loc_27BCB
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		stosb
		jcxz	short loc_27BDC

loc_27BCB:				; CODE XREF: sub_2792E+292j
					; sub_2792E+2ACj
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		mov	bl, es:[di+1]
		mov	ah, fs:[bx+si]
		stosw
		dec	cx
		jnz	short loc_27BCB

loc_27BDC:				; CODE XREF: sub_2792E+290j
					; sub_2792E+29Bj
		pop	ebx
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_27C04
		jz	short loc_27C09
		dec	[bp+var_1E]
		jz	loc_27CA8
		add	eax, [bp+var_30]

loc_27BF7:				; CODE XREF: sub_2792E+3CFj
		dec	[bp+var_20]
		jz	loc_27D03
		add	ebx, [bp+var_34]
		jmp	short loc_27B98
; ���������������������������������������������������������������������������

loc_27C04:				; CODE XREF: sub_2792E+D1j
					; sub_2792E+2BAj ...
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_27C09:				; CODE XREF: sub_2792E+2BCj
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_27B98
; ���������������������������������������������������������������������������
		align 2

loc_27C14:				; CODE XREF: sub_2792E+265j
					; sub_2792E+363j ...
		push	eax
		push	edi
		push	ebx
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_27C24
		xchg	eax, edx

loc_27C24:				; CODE XREF: sub_2792E+2F2j
		shr	eax, 10h
		shr	edx, 10h
		cmp	ax, [bp+var_6]
		jg	short loc_27C6D
		cmp	dx, [bp+var_2]
		jl	short loc_27C6D
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	edi, eax
		sub	ax, [bp+var_2]
		jl	short loc_27C9E

loc_27C43:				; CODE XREF: sub_2792E+374j
		sub	dx, [bp+var_6]
		jg	short loc_27CA4

loc_27C48:				; CODE XREF: sub_2792E+378j
		mov	si, [bp+arg_8]
		xor	bx, bx
		shr	cx, 1
		jnb	short loc_27C5C
		jz	short loc_27C6D
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		stosb
		jcxz	short loc_27C6D

loc_27C5C:				; CODE XREF: sub_2792E+321j
					; sub_2792E+33Dj
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		mov	bl, es:[di+1]
		mov	ah, fs:[bx+si]
		stosw
		dec	cx
		jnz	short loc_27C5C

loc_27C6D:				; CODE XREF: sub_2792E+301j
					; sub_2792E+306j ...
		pop	ebx
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_27C04
		jz	short loc_27C93
		nop
		nop
		dec	[bp+var_1E]
		jz	short loc_27CA8
		add	eax, [bp+var_30]

loc_27C88:				; CODE XREF: sub_2792E+3D3j
		dec	[bp+var_20]
		jz	short loc_27D03
		add	ebx, [bp+var_34]
		jmp	short loc_27C14
; ���������������������������������������������������������������������������

loc_27C93:				; CODE XREF: sub_2792E+34Dj
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	loc_27C14
; ���������������������������������������������������������������������������

loc_27C9E:				; CODE XREF: sub_2792E+313j
		sub	di, ax
		add	cx, ax
		jmp	short loc_27C43
; ���������������������������������������������������������������������������

loc_27CA4:				; CODE XREF: sub_2792E+318j
		sub	cx, dx
		jmp	short loc_27C48
; ���������������������������������������������������������������������������

loc_27CA8:				; CODE XREF: sub_2792E+2C1j
					; sub_2792E+354j
		push	ebx
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_27CBA
		mov	si, [bp+var_14]

loc_27CBA:				; CODE XREF: sub_2792E+387j
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
		jz	loc_27BF7
		jmp	short loc_27C88
; ���������������������������������������������������������������������������

loc_27D03:				; CODE XREF: sub_2792E+2CCj
					; sub_2792E+35Dj
		push	eax
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_27D18
		mov	si, [bp+var_12]

loc_27D18:				; CODE XREF: sub_2792E+3E5j
		mov	[bp+var_1C], si
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
		mov	[bp+var_34], eax
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bx, 8000h
		pop	eax
		cmp	[bp+var_10], 0
		jz	loc_27B98
		jmp	loc_27C14
sub_2792E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Render_MeshPrimitive_21085 (sub_21085 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 815 L, LUE
; 2026-10-14 (boucle de remplissage). RASTÉRISEUR DE GOURAUD sur INDEX DE PALETTE, avec
; tramage en damier. Sommets de 22 octets (x, y, teinte 8.8). Parcours par lignes : chaque
; bord avance x et teinte en 16.16 (idiv par la hauteur du bord) ; par ligne, pente de teinte
; = (teinte droite − teinte gauche) ÷ largeur (var_52). Boucle de pixels : deux accumulateurs
; (bx/cl et bp/ch) décalés d'une demi-teinte selon la parité (x de début XOR numéro de ligne
; ss:10DEh) : mov ax,ss:10E0h / xor ax,ss:10DEh / shl ax,0Fh (0x8000 ou 0), puis xor ah,80h
; pour l'autre ; les pixels sont écrits par paires (mov es:[di],cx), l'octet écrit = partie
; entière de l'accumulateur. Effet : index = partie entière (teinte + 0 ou ½ selon un damier)
; → tramage 2 niveaux entre teintes voisines. Ancien résumé : 'primitive de rendu graphique
; majeure, candidat terrain/mesh'.
; ==============================================================================================
Render_MeshPrimitive_27D5F	proc far		; CODE XREF: seg028:0FF1P seg042:11BBP ...

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
		jz	short loc_27D9B
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
		call	near ptr Render_MeshPrimitive_27D5F
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_27D9B:				; CODE XREF: Render_MeshPrimitive_27D5F+Cj
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
		mov	[bp+var_2E], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_27DE8:				; CODE XREF: Render_MeshPrimitive_27D5F+CDj
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		shl	ax, 1
		rcl	cl, 1
		or	byte ptr [bp+var_2E], cl
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
		jg	short loc_27E1E
		mov	si, ax
		mov	dx, bx

loc_27E1E:				; CODE XREF: Render_MeshPrimitive_27D5F+B9j
		cmp	ax, di
		jl	short loc_27E24
		mov	di, ax

loc_27E24:				; CODE XREF: Render_MeshPrimitive_27D5F+C1j
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_27DE8
		or	ch, ch
		jnz	loc_28156
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], dx
		mov	[bp+var_26], si
		cmp	di, si
		jnz	loc_27EC8
		mov	bx, [bp+var_1C]

loc_27E46:				; CODE XREF: Render_MeshPrimitive_27D5F+FFj
		mov	si, bx
		mov	ax, [si]

loc_27E4A:				; CODE XREF: Render_MeshPrimitive_27D5F+FDj
		cmp	bx, [bp+var_12]
		ja	short loc_27E52
		mov	bx, [bp+var_14]

loc_27E52:				; CODE XREF: Render_MeshPrimitive_27D5F+EEj
		sub	bx, 16h
		cmp	bx, [bp+var_1C]
		jz	short loc_27E60
		cmp	ax, [bx]
		jle	short loc_27E4A
		jmp	short loc_27E46
; ���������������������������������������������������������������������������

loc_27E60:				; CODE XREF: Render_MeshPrimitive_27D5F+F9j
		mov	bx, [bp+var_1E]

loc_27E63:				; CODE XREF: Render_MeshPrimitive_27D5F+11Cj
		mov	di, bx
		mov	ax, [di]

loc_27E67:				; CODE XREF: Render_MeshPrimitive_27D5F+11Aj
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_27E72
		mov	bx, [bp+var_12]

loc_27E72:				; CODE XREF: Render_MeshPrimitive_27D5F+10Ej
		cmp	bx, [bp+var_1E]
		jz	short loc_27E7D
		cmp	ax, [bx]
		jge	short loc_27E67
		jmp	short loc_27E63
; ���������������������������������������������������������������������������

loc_27E7D:				; CODE XREF: Render_MeshPrimitive_27D5F+116j
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
		jmp	loc_2804C
; ���������������������������������������������������������������������������

loc_27EC8:				; CODE XREF: Render_MeshPrimitive_27D5F+E0j
					; Render_MeshPrimitive_27D5F+18Dj ...
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_27ED8
		mov	si, [bp+var_14]

loc_27ED8:				; CODE XREF: Render_MeshPrimitive_27D5F+174j
		sub	si, 16h
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_27EEE
		cmp	cx, [bp+var_4]
		jle	short loc_27EC8

loc_27EEE:				; CODE XREF: Render_MeshPrimitive_27D5F+188j
		sub	cx, dx
		jz	short loc_27EC8
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
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
		idiv	ecx
		mov	[bp+var_4A], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_32], 8000h
		mov	word ptr [bp+var_32+2],	dx
		movzx	edx, word ptr [bx+4]
		shl	edx, 8
		mov	[bp+var_3A], edx

loc_27F4B:				; CODE XREF: Render_MeshPrimitive_27D5F+210j
					; Render_MeshPrimitive_27D5F+214j
		mov	bx, [bp+var_1E]
		mov	[bp+var_1A], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_27F5E
		mov	si, [bp+var_12]

loc_27F5E:				; CODE XREF: Render_MeshPrimitive_27D5F+1FAj
		mov	[bp+var_1E], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_27F71
		cmp	cx, [bp+var_4]
		jle	short loc_27F4B

loc_27F71:				; CODE XREF: Render_MeshPrimitive_27D5F+20Bj
		sub	cx, dx
		jz	short loc_27F4B
		mov	[bp+var_22], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
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
		jg	short loc_27FDB
		add	ax, di

loc_27FDB:				; CODE XREF: Render_MeshPrimitive_27D5F+278j
		mov	[bp+var_24], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_26]
		jle	short loc_2804C
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
		shrd	eax, edx, 10h
		add	[bp+var_36], eax
		mov	eax, [bp+var_4E]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3E], eax

loc_2804C:				; CODE XREF: Render_MeshPrimitive_27D5F+166j
					; Render_MeshPrimitive_27D5F+285j
		mov	di, [bp+var_C]
		mov	ax, [bp+var_26]
		mov	ss:37E4h, ax
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_32]
		mov	ebx, [bp+var_36]
		mov	ecx, [bp+var_3A]
		mov	edx, [bp+var_3E]
		cmp	[bp+var_2E], 0
		jnz	loc_2816E
		nop

loc_28074:				; CODE XREF: Render_MeshPrimitive_27D5F+3F4j
					; Render_MeshPrimitive_27D5F+40Cj ...
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	edi
		cmp	ebx, eax
		jg	short loc_28088
		xchg	eax, ebx
		xchg	ecx, edx

loc_28088:				; CODE XREF: Render_MeshPrimitive_27D5F+322j
		shr	eax, 10h
		shr	ebx, 10h
		mov	ss:37E6h, ax
		add	di, ax
		sub	bx, ax
		mov	si, bx
		jz	short loc_280B7
		sub	edx, ecx
		shl	ebx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		shld	edx, eax, 10h
		mov	bx, si

loc_280B7:				; CODE XREF: Render_MeshPrimitive_27D5F+33Bj
		add	bx, di
		mov	[bp+var_2C], bx
		inc	si
		mov	bx, cx
		shr	ecx, 10h
		push	bp
		mov	bp, bx
		mov	ch, cl
		push	ax
		mov	ax, ss:37E6h
		xor	ax, ss:37E4h
		shl	ax, 0Fh
		add	bp, ax
		adc	ch, al
		xor	ah, 80h
		add	bx, ax
		adc	cl, al
		pop	ax
		test	di, 1
		jz	short loc_280FA
		mov	es:[di], cl
		inc	di
		dec	si
		jz	short loc_2811B
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		xchg	bx, bp
		xchg	cl, ch

loc_280FA:				; CODE XREF: Render_MeshPrimitive_27D5F+386j
		add	ax, ax
		adc	dl, dl
		shr	si, 1
		jz	short loc_28118
		pushf
		nop

loc_28104:				; CODE XREF: Render_MeshPrimitive_27D5F+3B4j
		mov	es:[di], cx
		add	di, 2
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		dec	si
		jnz	short loc_28104
		popf
		jnb	short loc_2811B

loc_28118:				; CODE XREF: Render_MeshPrimitive_27D5F+3A1j
		mov	es:[di], cl

loc_2811B:				; CODE XREF: Render_MeshPrimitive_27D5F+38Dj
					; Render_MeshPrimitive_27D5F+3B7j
		pop	bp
		pop	edi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		add	di, [bp+var_A]
		inc	word ptr ss:37E4h
		dec	[bp+var_24]
		js	short loc_28156
		jz	short loc_2815B
		dec	[bp+var_20]
		jz	loc_282BA
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]

loc_28144:				; CODE XREF: Render_MeshPrimitive_27D5F+5DFj
		dec	[bp+var_22]
		jz	loc_28345
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_28074
; ���������������������������������������������������������������������������

loc_28156:				; CODE XREF: Render_MeshPrimitive_27D5F+D1j
					; Render_MeshPrimitive_27D5F+3D2j ...
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_2815B:				; CODE XREF: Render_MeshPrimitive_27D5F+3D4j
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_28074
; ���������������������������������������������������������������������������

loc_2816E:				; CODE XREF: Render_MeshPrimitive_27D5F+310j
					; Render_MeshPrimitive_27D5F+51Ej ...
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	edi
		cmp	ebx, eax
		jg	short loc_28182
		xchg	eax, ebx
		xchg	ecx, edx

loc_28182:				; CODE XREF: Render_MeshPrimitive_27D5F+41Cj
		shr	eax, 10h
		cmp	ax, [bp+var_6]
		jg	loc_28246
		shr	ebx, 10h
		cmp	bx, [bp+var_2]
		jl	loc_28246
		mov	ss:37E6h, ax
		mov	[bp+var_28], ax
		mov	[bp+var_2A], bx
		add	di, ax
		sub	bx, ax
		mov	si, bx
		inc	si
		cmp	si, 1
		jz	short loc_281C6
		sub	edx, ecx
		shl	ebx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_52], eax

loc_281C6:				; CODE XREF: Render_MeshPrimitive_27D5F+44Dj
		mov	bx, cx
		shr	ecx, 10h
		mov	ax, [bp+var_2]
		sub	ax, [bp+var_28]
		jg	loc_28293

loc_281D6:				; CODE XREF: Render_MeshPrimitive_27D5F+553j
		mov	ax, [bp+var_2A]
		sub	ax, [bp+var_6]
		jg	loc_282B5

loc_281E0:				; CODE XREF: Render_MeshPrimitive_27D5F+558j
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
		mov	ax, ss:37E6h
		xor	ax, ss:37E4h
		shl	ax, 0Fh
		add	bp, ax
		adc	ch, al
		xor	ah, 80h
		add	bx, ax
		adc	cl, al
		pop	ax
		test	di, 1
		jz	short loc_28225
		mov	es:[di], cl
		inc	di
		dec	si
		jz	short loc_28245
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		xchg	bx, bp
		xchg	cl, ch

loc_28225:				; CODE XREF: Render_MeshPrimitive_27D5F+4B1j
		add	ax, ax
		adc	dl, dl
		shr	si, 1
		jz	short loc_28242
		pushf

loc_2822E:				; CODE XREF: Render_MeshPrimitive_27D5F+4DEj
		mov	es:[di], cx
		add	di, 2
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		dec	si
		jg	short loc_2822E
		popf
		jnb	short loc_28245

loc_28242:				; CODE XREF: Render_MeshPrimitive_27D5F+4CCj
		mov	es:[di], cl

loc_28245:				; CODE XREF: Render_MeshPrimitive_27D5F+4B8j
					; Render_MeshPrimitive_27D5F+4E1j
		pop	bp

loc_28246:				; CODE XREF: Render_MeshPrimitive_27D5F+42Aj
					; Render_MeshPrimitive_27D5F+435j
		pop	edi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		add	di, [bp+var_A]
		inc	word ptr ss:37E4h
		dec	[bp+var_24]
		js	loc_28156
		jz	short loc_28280
		dec	[bp+var_20]
		jz	short loc_282BA
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]

loc_2826E:				; CODE XREF: Render_MeshPrimitive_27D5F+5E3j
		dec	[bp+var_22]
		jz	loc_28345
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_2816E
; ���������������������������������������������������������������������������

loc_28280:				; CODE XREF: Render_MeshPrimitive_27D5F+500j
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_2816E
; ���������������������������������������������������������������������������

loc_28293:				; CODE XREF: Render_MeshPrimitive_27D5F+473j
		add	di, ax
		sub	si, ax
		add	ss:37E6h, ax
		shl	eax, 10h
		imul	[bp+var_52]
		shrd	eax, edx, 10h
		shld	edx, eax, 10h
		add	bx, ax
		adc	cx, dx
		jmp	loc_281D6
; ���������������������������������������������������������������������������

loc_282B5:				; CODE XREF: Render_MeshPrimitive_27D5F+47Dj
		sub	si, ax
		jmp	loc_281E0
; ���������������������������������������������������������������������������

loc_282BA:				; CODE XREF: Render_MeshPrimitive_27D5F+3D9j
					; Render_MeshPrimitive_27D5F+505j
		push	ebx
		push	edx
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_282CE
		mov	si, [bp+var_14]

loc_282CE:				; CODE XREF: Render_MeshPrimitive_27D5F+56Aj
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
		mov	[bp+var_4A], eax
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_42], eax
		movzx	ecx, word ptr [bx+4]
		shl	ecx, 8
		mov	ax, [bx]
		shl	eax, 10h
		mov	ax, 8000h
		pop	edx
		pop	ebx
		cmp	[bp+var_2E], 0
		jz	loc_28144
		jmp	loc_2826E
; ���������������������������������������������������������������������������

loc_28345:				; CODE XREF: Render_MeshPrimitive_27D5F+3E8j
					; Render_MeshPrimitive_27D5F+512j
		push	eax
		push	ecx
		mov	bx, [bp+var_1E]
		mov	[bp+var_1A], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2835C
		mov	si, [bp+var_12]

loc_2835C:				; CODE XREF: Render_MeshPrimitive_27D5F+5F8j
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
		jz	loc_28074
		jmp	loc_2816E
Render_MeshPrimitive_27D5F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Render_MeshPrimitive_216F6 (sub_216F6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,849L — même
; famille avec 7 arguments (buffer local 0x68) : primitive de rendu graphique la plus
; paramétrée du cluster (candidat : rendu de mesh 3D texturé/ombré), la plus grosse fonction
; identifiée à ce jour avec sub_13100, à approfondir en session dédiée.
; ==============================================================================================
Render_MeshPrimitive_283D0	proc far		; CODE XREF: seg042:00F4P seg042:1358P ...

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
		jz	short loc_2840C
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
		call	near ptr Render_MeshPrimitive_283D0
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_2840C:				; CODE XREF: Render_MeshPrimitive_283D0+Cj
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
		mov	[bp+var_10], bx
		mov	[bp+var_12], ax
		mov	word ptr [bp+var_2E], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_28459:				; CODE XREF: Render_MeshPrimitive_283D0+CDj
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		shl	ax, 1
		rcl	cl, 1
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		shl	ax, 1
		rcl	cl, 1
		or	byte ptr [bp+var_2E], cl
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
		jg	short loc_2848F
		mov	si, ax
		mov	dx, bx

loc_2848F:				; CODE XREF: Render_MeshPrimitive_283D0+B9j
		cmp	ax, di
		jl	short loc_28495
		mov	di, ax

loc_28495:				; CODE XREF: Render_MeshPrimitive_283D0+C1j
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_12]
		jnz	short loc_28459
		or	ch, ch
		jnz	loc_2894D
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_68], ds
		mov	[bp+var_24], si
		cmp	di, si
		jnz	loc_2855A
		mov	bx, [bp+var_1A]

loc_284BA:				; CODE XREF: Render_MeshPrimitive_283D0+102j
		mov	si, bx
		mov	ax, [si]

loc_284BE:				; CODE XREF: Render_MeshPrimitive_283D0+100j
		cmp	bx, [bp+var_10]
		ja	short loc_284C6
		mov	bx, [bp+var_12]

loc_284C6:				; CODE XREF: Render_MeshPrimitive_283D0+F1j
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_284D4
		cmp	ax, [bx]
		jle	short loc_284BE
		jmp	short loc_284BA
; ���������������������������������������������������������������������������

loc_284D4:				; CODE XREF: Render_MeshPrimitive_283D0+FCj
		mov	bx, [bp+var_1C]

loc_284D7:				; CODE XREF: Render_MeshPrimitive_283D0+11Fj
		mov	di, bx
		mov	ax, [di]

loc_284DB:				; CODE XREF: Render_MeshPrimitive_283D0+11Dj
		add	bx, 16h
		cmp	bx, [bp+var_12]
		jb	short loc_284E6
		mov	bx, [bp+var_10]

loc_284E6:				; CODE XREF: Render_MeshPrimitive_283D0+111j
		cmp	bx, [bp+var_1C]
		jz	short loc_284F1
		cmp	ax, [bx]
		jge	short loc_284DB
		jmp	short loc_284D7
; ���������������������������������������������������������������������������

loc_284F1:				; CODE XREF: Render_MeshPrimitive_283D0+119j
		mov	dx, [si]
		shl	edx, 10h
		mov	[bp+var_2E], edx
		movzx	edx, word ptr [si+6]
		shl	edx, 8
		mov	[bp+var_36], edx
		movzx	edx, word ptr [si+8]
		shl	edx, 8
		mov	[bp+var_3E], edx
		mov	dx, [di]
		shl	edx, 10h
		mov	[bp+var_32], edx
		movzx	edx, word ptr [di+6]
		shl	edx, 8
		mov	[bp+var_3A], edx
		movzx	edx, word ptr [di+8]
		shl	edx, 8
		mov	[bp+var_42], edx
		xor	eax, eax
		mov	[bp+var_46], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_56], eax
		mov	[bp+var_4A], eax
		mov	[bp+var_52], eax
		mov	[bp+var_5A], eax
		mov	[bp+var_22], ax
		jmp	loc_2875E
; ���������������������������������������������������������������������������

loc_2855A:				; CODE XREF: Render_MeshPrimitive_283D0+E3j
					; Render_MeshPrimitive_283D0+1AEj ...
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_10]
		ja	short loc_2856A
		mov	si, [bp+var_12]

loc_2856A:				; CODE XREF: Render_MeshPrimitive_283D0+195j
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_28580
		cmp	cx, [bp+var_4]
		jle	short loc_2855A

loc_28580:				; CODE XREF: Render_MeshPrimitive_283D0+1A9j
		sub	cx, dx
		jz	short loc_2855A
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

loc_2860C:				; CODE XREF: Render_MeshPrimitive_283D0+260j
					; Render_MeshPrimitive_283D0+264j
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_12]
		jb	short loc_2861F
		mov	si, [bp+var_10]

loc_2861F:				; CODE XREF: Render_MeshPrimitive_283D0+24Aj
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_28632
		cmp	cx, [bp+var_4]
		jle	short loc_2860C

loc_28632:				; CODE XREF: Render_MeshPrimitive_283D0+25Bj
		sub	cx, dx
		jz	short loc_2860C
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
		jg	short loc_286CB
		add	ax, di

loc_286CB:				; CODE XREF: Render_MeshPrimitive_283D0+2F7j
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	loc_2875E
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

loc_2875E:				; CODE XREF: Render_MeshPrimitive_283D0+187j
					; Render_MeshPrimitive_283D0+304j
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	ax, [bp+var_C]
		mov	[bp+var_2A], ax
		mov	ax, 13D8h
		cmp	[bp+arg_E], 0
		jz	short loc_28780
		lfs	bx, [bp+arg_E]
		mov	ss:37E8h, bx
		mov	ax, 13AAh

loc_28780:				; CODE XREF: Render_MeshPrimitive_283D0+3A2j
		mov	ss:37DAh, ax
		mov	eax, [bp+var_2E]
		mov	ebx, [bp+var_32]
		mov	ecx, [bp+var_36]
		mov	edx, [bp+var_3A]
		mov	esi, [bp+var_3E]
		mov	edi, [bp+var_42]
		mov	ds, [bp+arg_A]

loc_2879F:				; CODE XREF: Render_MeshPrimitive_283D0+57Aj
					; Render_MeshPrimitive_283D0+59Aj ...
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	esi
		push	edi
		cmp	ebx, eax
		jg	short loc_287B8
		xchg	eax, ebx
		xchg	ecx, edx
		xchg	esi, edi

loc_287B8:				; CODE XREF: Render_MeshPrimitive_283D0+3DEj
		shr	eax, 10h
		cmp	ax, [bp+var_6]
		jg	loc_2890D
		shr	ebx, 10h
		cmp	bx, [bp+var_2]
		jl	loc_2890D
		mov	[bp+var_26], ax
		mov	[bp+var_28], bx
		mov	[bp+var_66], ecx
		sub	bx, ax
		jz	loc_28870
		shl	ebx, 10h
		sub	edx, ecx
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_5E], eax
		shld	edx, eax, 10h
		mov	cx, 1
		or	dx, dx
		jns	short loc_2880A
		neg	cx
		cmp	ax, 1
		sbb	dx, 0FFFFh

loc_2880A:				; CODE XREF: Render_MeshPrimitive_283D0+430j
		add	cx, dx
		push	cx
		push	dx
		sub	edi, esi
		mov	edx, edi
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_62], eax
		shld	edx, eax, 10h
		mov	cx, [bp+arg_C]
		or	dx, dx
		jns	short loc_28839
		neg	cx
		cmp	ax, 1
		sbb	dx, 0FFFFh

loc_28839:				; CODE XREF: Render_MeshPrimitive_283D0+45Fj
		mov	ax, [bp+arg_C]
		imul	dx
		pop	dx
		pop	bx
		add	dx, ax
		mov	ss:37DCh, dx
		add	dx, cx
		mov	ss:37DEh, dx
		add	bx, ax
		mov	ss:37E0h, bx
		add	bx, cx
		mov	ss:37E2h, bx
		mov	cx, [bp+var_2]
		sub	cx, [bp+var_26]
		jg	loc_2896D

loc_28866:				; CODE XREF: Render_MeshPrimitive_283D0+5C3j
		mov	ax, [bp+var_28]
		sub	ax, [bp+var_6]
		jg	loc_28996

loc_28870:				; CODE XREF: Render_MeshPrimitive_283D0+40Aj
					; Render_MeshPrimitive_283D0+5C9j
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
		jns	short loc_288A4
		neg	ax
		not	dx

loc_288A4:				; CODE XREF: Render_MeshPrimitive_283D0+4CEj
		mov	ebp, [bp+var_62]
		or	ebp, ebp
		jns	short loc_288B1
		neg	bp
		not	cx

loc_288B1:				; CODE XREF: Render_MeshPrimitive_283D0+4DBj
		inc	bx
		push	bx
		xor	bx, bx
		jmp	word ptr ss:37DAh
; ���������������������������������������������������������������������������

loc_288BA:				; CODE XREF: Render_MeshPrimitive_283D0+512j
		mov	bl, [si]
		cmp	bl, 0FFh
		jz	short loc_288CC
		add	bx, ss:37E8h
		mov	bl, fs:[bx]
		mov	es:[di], bl

loc_288CC:				; CODE XREF: Render_MeshPrimitive_283D0+4EFj
		inc	di
		xor	bx, bx
		add	dx, ax
		adc	bx, bx
		add	cx, bp
		adc	bx, bx
		add	bx, bx
		add	si, ss:[bx+37DCh]
		dec	word ptr [esp]
		jg	short loc_288BA
		jmp	short loc_2890A
; ���������������������������������������������������������������������������
		align 4

loc_288E8:				; CODE XREF: Render_MeshPrimitive_283D0+538j
		mov	bl, [si]
		cmp	bl, 0FFh
		jz	short loc_288F2
		mov	es:[di], bl

loc_288F2:				; CODE XREF: Render_MeshPrimitive_283D0+51Dj
		inc	di
		xor	bx, bx
		add	dx, ax
		adc	bx, bx
		add	cx, bp
		adc	bx, bx
		add	bx, bx
		add	si, ss:[bx+37DCh]
		dec	word ptr [esp]
		jg	short loc_288E8

loc_2890A:				; CODE XREF: Render_MeshPrimitive_283D0+514j
		pop	di
		pop	ebp

loc_2890D:				; CODE XREF: Render_MeshPrimitive_283D0+3EFj
					; Render_MeshPrimitive_283D0+3FAj
		mov	di, [bp+var_A]
		add	[bp+var_2A], di
		pop	edi
		pop	esi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		dec	[bp+var_22]
		js	short loc_2894D
		jz	short loc_28952
		dec	[bp+var_1E]
		jz	short loc_2899C
		add	eax, [bp+var_46]
		add	ecx, [bp+var_4E]
		add	esi, [bp+var_56]

loc_28937:				; CODE XREF: Render_MeshPrimitive_283D0+67Dj
		dec	[bp+var_20]
		jz	loc_28A50
		add	ebx, [bp+var_4A]
		add	edx, [bp+var_52]
		add	edi, [bp+var_5A]
		jmp	loc_2879F
; ���������������������������������������������������������������������������

loc_2894D:				; CODE XREF: Render_MeshPrimitive_283D0+D1j
					; Render_MeshPrimitive_283D0+552j
		pop	di
		pop	si
		pop	ds
		leave
		retf
; ���������������������������������������������������������������������������

loc_28952:				; CODE XREF: Render_MeshPrimitive_283D0+554j
		add	eax, [bp+var_46]
		add	ecx, [bp+var_4E]
		add	esi, [bp+var_56]
		add	ebx, [bp+var_4A]
		add	edx, [bp+var_52]
		add	edi, [bp+var_5A]
		jmp	loc_2879F
; ���������������������������������������������������������������������������

loc_2896D:				; CODE XREF: Render_MeshPrimitive_283D0+492j
		add	[bp+var_26], cx
		shl	ecx, 10h
		mov	eax, [bp+var_5E]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_66], eax
		mov	eax, [bp+var_62]
		imul	ecx
		shrd	eax, edx, 10h
		add	esi, eax
		jmp	loc_28866
; ���������������������������������������������������������������������������

loc_28996:				; CODE XREF: Render_MeshPrimitive_283D0+49Cj
		sub	[bp+var_28], ax
		jmp	loc_28870
; ���������������������������������������������������������������������������

loc_2899C:				; CODE XREF: Render_MeshPrimitive_283D0+559j
		push	ebx
		push	edx
		mov	ds, [bp+var_68]
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_10]
		ja	short loc_289B3
		mov	si, [bp+var_12]

loc_289B3:				; CODE XREF: Render_MeshPrimitive_283D0+5DEj
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
		mov	ax, [bx]
		shl	eax, 10h
		mov	ax, 8000h
		movzx	ecx, word ptr [bx+6]
		shl	ecx, 8
		movzx	esi, word ptr [bx+8]
		shl	esi, 8
		mov	ds, [bp+arg_A]
		pop	edx
		pop	ebx
		jmp	loc_28937
; ���������������������������������������������������������������������������

loc_28A50:				; CODE XREF: Render_MeshPrimitive_283D0+56Aj
		push	eax
		push	ecx
		push	esi
		mov	ds, [bp+var_68]
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_12]
		jb	short loc_28A6C
		mov	si, [bp+var_10]

loc_28A6C:				; CODE XREF: Render_MeshPrimitive_283D0+697j
		mov	[bp+var_1C], si
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
		mov	ds, [bp+arg_A]
		pop	esi
		pop	ecx
		pop	eax
		jmp	loc_2879F
Render_MeshPrimitive_283D0	endp

seg060		ends
