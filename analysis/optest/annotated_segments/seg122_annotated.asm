seg122		segment	byte public 'CODE' use16
		assume cs:seg122
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawScaledSprite_621A2 (sub_621A2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 675 lignes, NON DÉTAILLÉE — la plus grosse
; fonction de ce lot, aucun appel externe (calcul entièrement inline), immense frame locale
; (0x2DA octets ≈ 730 octets, 10 arguments dont deux pointeurs far). Référencée depuis seg032
; (zoom carte/radar) ET seg106 (émetteur de particules) — probable primitive de rendu de
; sprite/icône avec mise à l'échelle et/ou rotation, partagée entre plusieurs sous-systèmes.
; Candidat prioritaire pour session dédiée (aucune lecture de détail effectuée). | LU EN
; PARTIE 2026-10-12 (arguments et boucle de pixels). Args : (surface, x, y, forme far, n°
; d'image, largeur, hauteur, table de remappage far, A, B). Forme = format de sprite RealSpace
; : dword en +0, table de dwords d'offsets d'images à partir de +4, chaque image commence par
; 4 int16 d'étendue (droite, gauche, haut, bas). Pixel de couleur c : c < A ou c ≥ A + B →
; couleur c dessinée telle quelle ; A ≤ c < A + B → pixel TRANSLUCIDE : nouvelle couleur =
; table[(c − A) × 256 + couleur déjà à l'écran] (xlat). Appelé par le rendu des particules en
; mode 2 (A, B = octets +0x19/+0x1A du modèle de fumée ; table = remappage de la teinte
; courante).
; ==============================================================================================
Render_DrawScaledSprite_32F28	proc far		; CODE XREF: sub_BDDC0+45P
					; DATA XREF: seg170:04A6o

var_2DA		= word ptr -2DAh
var_2D8		= word ptr -2D8h
var_2D6		= word ptr -2D6h
var_2D4		= word ptr -2D4h
var_2D2		= dword	ptr -2D2h
var_2CE		= word ptr -2CEh
var_2CC		= word ptr -2CCh
var_2CA		= word ptr -2CAh
var_2C8		= word ptr -2C8h
var_2C6		= word ptr -2C6h
var_2C4		= word ptr -2C4h
var_2C2		= word ptr -2C2h
var_2C0		= word ptr -2C0h
var_2BE		= dword	ptr -2BEh
var_2BA		= dword	ptr -2BAh
var_2B2		= word ptr -2B2h
var_2B0		= dword	ptr -2B0h
var_2AC		= word ptr -2ACh
var_2AA		= word ptr -2AAh
var_2A8		= word ptr -2A8h
var_2A6		= word ptr -2A6h
var_2A4		= dword	ptr -2A4h
var_2A0		= dword	ptr -2A0h
var_29C		= dword	ptr -29Ch
var_298		= dword	ptr -298h
var_294		= word ptr -294h
var_154		= word ptr -154h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h
arg_14		= word ptr  1Ah
arg_16		= word ptr  1Ch

		enter	2DAh, 0
		push	si
		push	di
		push	ds
		movsx	esi, [bp+arg_C]
		movsx	edi, [bp+arg_E]
		or	esi, esi
		jz	short loc_32F43
		or	edi, edi
		jnz	short loc_32F46

loc_32F43:				; CODE XREF: Render_DrawScaledSprite_32F28+14j
		jmp	loc_3334D
; ���������������������������������������������������������������������������

loc_32F46:				; CODE XREF: Render_DrawScaledSprite_32F28+19j
		mov	eax, 8000h
		jns	short loc_32F50
		dec	eax

loc_32F50:				; CODE XREF: Render_DrawScaledSprite_32F28+24j
		mov	[bp+var_2D2], eax
		mov	eax, 1000000h
		cdq
		idiv	esi
		mov	[bp+var_298], eax
		or	eax, eax
		jns	short loc_32F6D
		neg	eax

loc_32F6D:				; CODE XREF: Render_DrawScaledSprite_32F28+40j
		mov	[bp+var_2A0], eax
		shr	eax, 10h
		cmp	ax, 1
		jle	short loc_32F8B
		test	[bp+arg_C], 0FFFFh
		jnz	short loc_32F8B
		mov	dx, [bp+arg_2]
		add	dx, ax
		dec	dx
		mov	[bp+arg_2], dx

loc_32F8B:				; CODE XREF: Render_DrawScaledSprite_32F28+51j
					; Render_DrawScaledSprite_32F28+58j
		mov	eax, 1000000h
		cdq
		idiv	edi
		mov	[bp+var_29C], eax
		or	eax, eax
		jns	short loc_32FA3
		neg	eax

loc_32FA3:				; CODE XREF: Render_DrawScaledSprite_32F28+76j
		mov	[bp+var_2A4], eax
		xor	ax, ax
		shl	si, 1
		setnbe	al
		sbb	ax, 0
		mov	[bp+var_2CC], ax
		xor	ax, ax
		shl	di, 1
		setnbe	al
		sbb	ax, 0
		mov	[bp+var_2CE], ax
		movsx	eax, [bp+arg_E]
		shl	eax, 8
		mov	[bp+var_2B0], eax
		mov	ax, [bp+arg_14]
		add	ax, [bp+arg_16]
		mov	[bp+var_2], ax
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_14]
		mov	cx, 6
		rep movsw
		mov	bx, [bp+var_12]
		mov	ax, [bx+2]
		sub	ax, [bx]
		imul	[bp+var_2CE]
		mov	[bp+var_2A6], ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	bx, [si+4]
		jb	short loc_3300B
		jmp	loc_3334D
; ���������������������������������������������������������������������������

loc_3300B:				; CODE XREF: Render_DrawScaledSprite_32F28+DEj
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		add	ax, si
		add	eax, [bx+si]
		mov	si, ax
		and	si, 0Fh
		shr	eax, 4
		mov	ds, ax
		mov	bx, [bp+arg_C]
		mov	cx, [bp+arg_2]
		mov	ax, [si+2]
		mov	dx, [si]
		or	bx, bx
		jns	short loc_33037
		xchg	ax, dx
		neg	bx

loc_33037:				; CODE XREF: Render_DrawScaledSprite_32F28+10Aj
		mov	[bp+var_2D4], ax
		mov	[bp+var_2D6], dx
		mov	ax, [bp+var_2D4]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		cmp	ax, [bp+var_C]
		jg	short loc_330CF
		mov	ax, [si]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		cmp	ax, [bp+var_10]
		jl	short loc_330CF
		mov	bx, [bp+arg_E]
		mov	cx, [bp+arg_4]
		mov	ax, [si+4]
		mov	dx, [si+6]
		or	bx, bx
		jns	short loc_33076
		xchg	ax, dx
		neg	bx

loc_33076:				; CODE XREF: Render_DrawScaledSprite_32F28+149j
		mov	[bp+var_2D8], ax
		mov	[bp+var_2DA], dx
		movsx	eax, word ptr [si+4]
		neg	eax
		mov	[bp+var_2C2], ax
		dec	[bp+var_2C2]
		shl	eax, 10h
		sub	eax, [bp+var_2A4]
		add	eax, [bp+var_2D2]
		mov	[bp+var_2BE], eax
		mov	ax, [bp+var_2D8]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		mov	[bp+var_2D8], ax
		cmp	ax, [bp+var_A]
		jg	short loc_330CF
		mov	ax, [bp+var_2DA]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		mov	[bp+var_2DA], ax
		cmp	ax, [bp+var_E]
		jge	short loc_330D2

loc_330CF:				; CODE XREF: Render_DrawScaledSprite_32F28+128j
					; Render_DrawScaledSprite_32F28+139j ...
		jmp	loc_3334D
; ���������������������������������������������������������������������������

loc_330D2:				; CODE XREF: Render_DrawScaledSprite_32F28+1A5j
		mov	ax, [bp+var_2D8]
		test	[bp+var_2CE], 0FFFFh
		jns	short loc_330E2
		mov	ax, [bp+var_2DA]

loc_330E2:				; CODE XREF: Render_DrawScaledSprite_32F28+1B4j
		shl	eax, 10h
		add	eax, [bp+var_2D2]
		sub	eax, [bp+var_2B0]
		mov	[bp+var_2BA], eax
		xor	ecx, ecx
		lea	si, [si+8]

loc_330FB:				; CODE XREF: Render_DrawScaledSprite_32F28:loc_3315Cj
					; Render_DrawScaledSprite_32F28+422j
		lodsw
		or	ax, ax
		jz	loc_3334D
		mov	cx, ax
		lodsw
		mov	bx, ax
		lodsw
		cmp	ax, [bp+var_2C2]
		jz	short loc_3315E
		cmp	ax, word ptr [bp+var_2BE+2]
		jl	short loc_3313D
		mov	edi, [bp+var_2B0]
		mov	dx, ax
		sub	dx, [bp+var_2C2]

loc_3311F:				; CODE XREF: Render_DrawScaledSprite_32F28+1FDj
		add	[bp+var_2BA], edi
		dec	dx
		jnz	short loc_3311F
		mov	edi, [bp+var_2A4]

loc_3312C:				; CODE XREF: Render_DrawScaledSprite_32F28+20Dj
		add	[bp+var_2BE], edi
		cmp	ax, word ptr [bp+var_2BE+2]
		jge	short loc_3312C
		mov	[bp+var_2C2], ax
		jmp	short loc_3315E
; ���������������������������������������������������������������������������

loc_3313D:				; CODE XREF: Render_DrawScaledSprite_32F28+1EAj
		shr	cx, 1
		jb	short loc_33145
		add	si, cx
		jmp	short loc_3315C
; ���������������������������������������������������������������������������

loc_33145:				; CODE XREF: Render_DrawScaledSprite_32F28+217j
		mov	bx, cx

loc_33147:				; CODE XREF: Render_DrawScaledSprite_32F28+229j
					; Render_DrawScaledSprite_32F28+232j
		lodsb
		shr	al, 1
		cbw
		jb	short loc_33155
		add	si, ax
		sub	bx, ax
		jnz	short loc_33147
		jmp	short loc_3315C
; ���������������������������������������������������������������������������

loc_33155:				; CODE XREF: Render_DrawScaledSprite_32F28+223j
		sub	bx, ax
		lodsb
		or	bx, bx
		jnz	short loc_33147

loc_3315C:				; CODE XREF: Render_DrawScaledSprite_32F28+21Bj
					; Render_DrawScaledSprite_32F28+22Bj
		jmp	short loc_330FB
; ���������������������������������������������������������������������������

loc_3315E:				; CODE XREF: Render_DrawScaledSprite_32F28+1E4j
					; Render_DrawScaledSprite_32F28+213j
		mov	ax, bx
		imul	[bp+arg_C]
		mov	al, ah
		mov	ah, dl
		add	ax, [bp+arg_2]
		mov	[bp+var_2B2], ax
		push	ss
		pop	es
		lea	di, [bp+var_154]
		shr	cx, 1
		mov	[bp+var_2AC], cx
		jb	short loc_3318B
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		jmp	short loc_331C4
; ���������������������������������������������������������������������������

loc_3318B:				; CODE XREF: Render_DrawScaledSprite_32F28+252j
		mov	bx, cx

loc_3318D:				; CODE XREF: Render_DrawScaledSprite_32F28+27Cj
					; Render_DrawScaledSprite_32F28+29Aj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_331A8
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		sub	bx, ax
		jnz	short loc_3318D
		jmp	short loc_331C4
; ���������������������������������������������������������������������������

loc_331A8:				; CODE XREF: Render_DrawScaledSprite_32F28+26Bj
		sub	bx, cx
		lodsb
		mov	ah, al
		push	ax
		shl	eax, 10h
		pop	ax
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb
		or	bx, bx
		jnz	short loc_3318D

loc_331C4:				; CODE XREF: Render_DrawScaledSprite_32F28+261j
					; Render_DrawScaledSprite_32F28+27Ej
		push	ds
		push	si
		push	large [bp+var_2BA]
		push	large [bp+var_2BE]
		push	ss
		pop	ds
		mov	ax, 1
		cmp	word ptr [bp+var_2A4+2], 0
		jnz	short loc_331F2
		mov	eax, [bp+var_2BA]
		add	eax, [bp+var_2B0]
		shr	eax, 10h
		sub	ax, word ptr [bp+var_2BA+2]
		jns	short loc_331F2
		neg	ax

loc_331F2:				; CODE XREF: Render_DrawScaledSprite_32F28+2B2j
					; Render_DrawScaledSprite_32F28+2C6j
		mov	[bp+var_2C0], ax
		mov	ax, [bp+arg_C]
		or	ax, ax
		jns	short loc_33200
		std
		neg	ax

loc_33200:				; CODE XREF: Render_DrawScaledSprite_32F28+2D3j
		mul	[bp+var_2AC]
		add	ax, 80h	; '�'
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	[bp+var_2C4], ax
		or	ax, ax
		jz	loc_3333D
		mov	es, [bp+var_14]
		mov	[bp+var_2C6], 0

loc_33221:				; CODE XREF: Render_DrawScaledSprite_32F28+411j
		mov	ax, word ptr [bp+var_2BA+2]
		cmp	ax, [bp+var_E]
		jl	loc_3332D
		cmp	ax, [bp+var_A]
		jg	loc_3332D
		cmp	[bp+var_2C6], 0
		jz	short loc_33277

loc_3323A:				; CODE XREF: Render_DrawScaledSprite_32F28+402j
		mov	si, [bp+var_2AA]
		mov	di, [bp+var_2A8]
		mov	ah, byte ptr [bp+arg_14]
		mov	cx, [bp+var_2CA]

loc_33249:				; CODE XREF: Render_DrawScaledSprite_32F28+327j
		lodsb
		cmp	al, ah
		jnb	short loc_3325C

loc_3324E:				; CODE XREF: Render_DrawScaledSprite_32F28+337j
					; Render_DrawScaledSprite_32F28+34Dj
		stosb
		loop	loc_33249
		mov	di, [bp+var_2A6]
		add	[bp+var_2A8], di
		jmp	loc_3332D
; ���������������������������������������������������������������������������

loc_3325C:				; CODE XREF: Render_DrawScaledSprite_32F28+324j
		cmp	al, byte ptr [bp+var_2]
		jnb	short loc_3324E
		mov	dl, al
		sub	dl, ah
		shl	dx, 8
		mov	al, es:[di]
		lds	bx, [bp+arg_10]
		add	bx, dx
		xlat
		mov	dx, ss
		mov	ds, dx
		jmp	short loc_3324E
; ���������������������������������������������������������������������������

loc_33277:				; CODE XREF: Render_DrawScaledSprite_32F28+310j
		mov	bx, word ptr [bp+var_2BA+2]
		shl	bx, 1
		add	bx, [bp+var_12]
		mov	di, [bx]
		mov	[bp+var_2A8], di
		mov	bx, [bp+var_2B2]
		mov	edx, [bp+var_2A0]
		lea	si, [bp+var_154]
		shl	esi, 10h
		mov	cx, [bp+var_2C4]
		test	[bp+arg_C], 0FFFFh
		jns	short loc_332D2
		mov	ax, bx
		sub	ax, [bp+var_C]
		jle	short loc_332BA
		sub	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_2A0]

loc_332BA:				; CODE XREF: Render_DrawScaledSprite_32F28+37Fj
		mov	[bp+var_2C8], bx
		add	[bp+var_2A8], bx
		mov	ax, bx
		sub	ax, cx
		inc	ax
		neg	ax
		add	ax, [bp+var_10]
		jle	short loc_332D0
		sub	cx, ax

loc_332D0:				; CODE XREF: Render_DrawScaledSprite_32F28+3A4j
		jmp	short loc_332FE
; ���������������������������������������������������������������������������

loc_332D2:				; CODE XREF: Render_DrawScaledSprite_32F28+378j
		mov	ax, [bp+var_10]
		sub	ax, bx
		jle	short loc_332EA
		add	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_2A0]

loc_332EA:				; CODE XREF: Render_DrawScaledSprite_32F28+3AFj
		mov	[bp+var_2C8], bx
		add	[bp+var_2A8], bx
		mov	ax, bx
		add	ax, cx
		dec	ax
		sub	ax, [bp+var_C]
		jle	short loc_332FE
		sub	cx, ax

loc_332FE:				; CODE XREF: Render_DrawScaledSprite_32F28:loc_332D0j
					; Render_DrawScaledSprite_32F28+3D2j
		or	cx, cx
		jle	short loc_3333D
		lea	di, [bp+var_294]
		add	di, bx
		mov	[bp+var_2AA], di
		mov	[bp+var_2CA], cx

loc_33310:				; CODE XREF: Render_DrawScaledSprite_32F28+3FCj
		ror	esi, 10h
		mov	al, [si]
		mov	[di], al
		rol	esi, 10h
		add	di, [bp+var_2CC]
		add	esi, edx
		dec	cx
		jnz	short loc_33310
		inc	[bp+var_2C6]
		jmp	loc_3323A
; ���������������������������������������������������������������������������

loc_3332D:				; CODE XREF: Render_DrawScaledSprite_32F28+300j
					; Render_DrawScaledSprite_32F28+307j ...
		mov	ax, [bp+var_2CE]
		add	word ptr [bp+var_2BA+2], ax
		dec	[bp+var_2C0]
		jnz	loc_33221

loc_3333D:				; CODE XREF: Render_DrawScaledSprite_32F28+2ECj
					; Render_DrawScaledSprite_32F28+3D8j
		cld
		pop	large [bp+var_2BE]
		pop	large [bp+var_2BA]
		pop	si
		pop	ds
		jmp	loc_330FB
; ���������������������������������������������������������������������������

loc_3334D:				; CODE XREF: Render_DrawScaledSprite_32F28:loc_32F43j
					; Render_DrawScaledSprite_32F28+E0j ...
		pop	ds
		pop	di
		pop	si
		leave
		retf
Render_DrawScaledSprite_32F28	endp

seg122		ends
