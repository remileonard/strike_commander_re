seg126		segment	byte public 'CODE' use16
		assume cs:seg126
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawRotatedScaledSprite_62800 (sub_62800 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 736 lignes, NON DÉTAILLÉE — la plus
; grosse fonction rencontrée dans ce cluster de primitives 2D, structure de frame locale très
; similaire à Render_DrawScaledSprite_621A2 (seg175, ~0x2D8 octets), utilise des extensions de
; signe 32 bits (movsx esi) suggérant un traitement d'angle de rotation. Référencée depuis
; seg063 et seg106 (émetteur de particules) — probable variante « avec rotation » de la
; primitive de rendu de sprite/icône. Candidat prioritaire pour session dédiée (aucune lecture
; de détail effectuée, fonction volumineuse). | PRÉCISÉ 2026-10-12 : appelé par le rendu des
; particules en MODE 1 avec (surface, x, y, forme, n° d'image, largeur, hauteur) — 16 octets
; d'arguments, PAS de table de remappage ni de A/B : sprite dessiné opaque, la teinte ne
; s'applique pas.
; ==============================================================================================
Render_DrawRotatedScaledSprite_33586	proc far		; CODE XREF: seg014:2C61P seg014:2D00P

var_2D8		= word ptr -2D8h
var_2D6		= word ptr -2D6h
var_2D4		= word ptr -2D4h
var_2D2		= word ptr -2D2h
var_2D0		= dword	ptr -2D0h
var_2CC		= word ptr -2CCh
var_2CA		= word ptr -2CAh
var_2C8		= word ptr -2C8h
var_2C6		= word ptr -2C6h
var_2C4		= word ptr -2C4h
var_2C2		= word ptr -2C2h
var_2C0		= word ptr -2C0h
var_2BE		= word ptr -2BEh
var_2BC		= dword	ptr -2BCh
var_2B8		= dword	ptr -2B8h
var_2B0		= word ptr -2B0h
var_2AE		= dword	ptr -2AEh
var_2AA		= word ptr -2AAh
var_2A8		= word ptr -2A8h
var_2A6		= word ptr -2A6h
var_2A4		= word ptr -2A4h
var_2A2		= dword	ptr -2A2h
var_29E		= dword	ptr -29Eh
var_29A		= dword	ptr -29Ah
var_296		= dword	ptr -296h
var_292		= word ptr -292h
var_152		= word ptr -152h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		enter	2D8h, 0
		push	si
		push	di
		push	ds
		movsx	esi, [bp+arg_C]
		movsx	edi, [bp+arg_E]
		or	esi, esi
		jz	short loc_335A1
		or	edi, edi
		jnz	short loc_335A4

loc_335A1:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+14j
		jmp	loc_3397E
; ���������������������������������������������������������������������������

loc_335A4:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+19j
		mov	eax, 8000h
		jns	short loc_335AE
		dec	eax

loc_335AE:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+24j
		mov	[bp+var_2D0], eax
		mov	eax, 1000000h
		cdq
		idiv	esi
		mov	[bp+var_296], eax
		or	eax, eax
		jns	short loc_335CB
		neg	eax

loc_335CB:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+40j
		mov	[bp+var_29E], eax
		shr	eax, 10h
		cmp	ax, 1
		jle	short loc_335E9
		test	[bp+arg_C], 0FFFFh
		jnz	short loc_335E9
		mov	dx, [bp+arg_2]
		add	dx, ax
		dec	dx
		mov	[bp+arg_2], dx

loc_335E9:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+51j
					; Render_DrawRotatedScaledSprite_33586+58j
		mov	eax, 1000000h
		cdq
		idiv	edi
		mov	[bp+var_29A], eax
		or	eax, eax
		jns	short loc_33601
		neg	eax

loc_33601:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+76j
		mov	[bp+var_2A2], eax
		xor	ax, ax
		shl	si, 1
		setnbe	al
		sbb	ax, 0
		mov	[bp+var_2CA], ax
		xor	ax, ax
		shl	di, 1
		setnbe	al
		sbb	ax, 0
		mov	[bp+var_2CC], ax
		movsx	eax, [bp+arg_E]
		shl	eax, 8
		mov	[bp+var_2AE], eax
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_12]
		mov	cx, 6
		rep movsw
		mov	bx, [bp+var_10]
		mov	ax, [bx+2]
		sub	ax, [bx]
		imul	[bp+var_2CC]
		mov	[bp+var_2A4], ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	bx, [si+4]
		jb	short loc_33660
		jmp	loc_3397E
; ���������������������������������������������������������������������������

loc_33660:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+D5j
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
		jns	short loc_3368C
		xchg	ax, dx
		neg	bx

loc_3368C:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+101j
		mov	[bp+var_2D2], ax
		mov	[bp+var_2D4], dx
		mov	ax, [bp+var_2D2]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		cmp	ax, [bp+var_A]
		jg	short loc_33724
		mov	ax, [si]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		cmp	ax, [bp+var_E]
		jl	short loc_33724
		mov	bx, [bp+arg_E]
		mov	cx, [bp+arg_4]
		mov	ax, [si+4]
		mov	dx, [si+6]
		or	bx, bx
		jns	short loc_336CB
		xchg	ax, dx
		neg	bx

loc_336CB:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+140j
		mov	[bp+var_2D6], ax
		mov	[bp+var_2D8], dx
		movsx	eax, word ptr [si+4]
		neg	eax
		mov	[bp+var_2C0], ax
		dec	[bp+var_2C0]
		shl	eax, 10h
		sub	eax, [bp+var_2A2]
		add	eax, [bp+var_2D0]
		mov	[bp+var_2BC], eax
		mov	ax, [bp+var_2D6]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		mov	[bp+var_2D6], ax
		cmp	ax, [bp+var_8]
		jg	short loc_33724
		mov	ax, [bp+var_2D8]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		mov	[bp+var_2D8], ax
		cmp	ax, [bp+var_C]
		jge	short loc_33727

loc_33724:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+11Fj
					; Render_DrawRotatedScaledSprite_33586+130j ...
		jmp	loc_3397E
; ���������������������������������������������������������������������������

loc_33727:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+19Cj
		mov	ax, [bp+var_2D6]
		test	[bp+var_2CC], 0FFFFh
		jns	short loc_33737
		mov	ax, [bp+var_2D8]

loc_33737:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+1ABj
		shl	eax, 10h
		add	eax, [bp+var_2D0]
		sub	eax, [bp+var_2AE]
		mov	[bp+var_2B8], eax
		xor	ecx, ecx
		lea	si, [si+8]

loc_33750:				; CODE XREF: Render_DrawRotatedScaledSprite_33586:loc_337B1j
					; Render_DrawRotatedScaledSprite_33586+3F5j
		lodsw
		or	ax, ax
		jz	loc_3397E
		mov	cx, ax
		lodsw
		mov	bx, ax
		lodsw
		cmp	ax, [bp+var_2C0]
		jz	short loc_337B3
		cmp	ax, word ptr [bp+var_2BC+2]
		jl	short loc_33792
		mov	edi, [bp+var_2AE]
		mov	dx, ax
		sub	dx, [bp+var_2C0]

loc_33774:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+1F4j
		add	[bp+var_2B8], edi
		dec	dx
		jnz	short loc_33774
		mov	edi, [bp+var_2A2]

loc_33781:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+204j
		add	[bp+var_2BC], edi
		cmp	ax, word ptr [bp+var_2BC+2]
		jg	short loc_33781
		mov	[bp+var_2C0], ax
		jmp	short loc_337B3
; ���������������������������������������������������������������������������

loc_33792:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+1E1j
		shr	cx, 1
		jb	short loc_3379A
		add	si, cx
		jmp	short loc_337B1
; ���������������������������������������������������������������������������

loc_3379A:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+20Ej
		mov	bx, cx

loc_3379C:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+220j
					; Render_DrawRotatedScaledSprite_33586+229j
		lodsb
		shr	al, 1
		cbw
		jb	short loc_337AA
		add	si, ax
		sub	bx, ax
		jnz	short loc_3379C
		jmp	short loc_337B1
; ���������������������������������������������������������������������������

loc_337AA:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+21Aj
		sub	bx, ax
		lodsb
		or	bx, bx
		jnz	short loc_3379C

loc_337B1:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+212j
					; Render_DrawRotatedScaledSprite_33586+222j
		jmp	short loc_33750
; ���������������������������������������������������������������������������

loc_337B3:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+1DBj
					; Render_DrawRotatedScaledSprite_33586+20Aj
		mov	ax, bx
		imul	[bp+arg_C]
		mov	al, ah
		mov	ah, dl
		add	ax, [bp+arg_2]
		mov	[bp+var_2B0], ax
		push	ss
		pop	es
		lea	di, [bp+var_152]
		shr	cx, 1
		mov	[bp+var_2AA], cx
		jb	short loc_337E0
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		jmp	short loc_33819
; ���������������������������������������������������������������������������

loc_337E0:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+249j
		mov	bx, cx

loc_337E2:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+273j
					; Render_DrawRotatedScaledSprite_33586+291j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_337FD
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		sub	bx, ax
		jnz	short loc_337E2
		jmp	short loc_33819
; ���������������������������������������������������������������������������

loc_337FD:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+262j
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
		jnz	short loc_337E2

loc_33819:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+258j
					; Render_DrawRotatedScaledSprite_33586+275j
		push	ds
		push	si
		push	large [bp+var_2B8]
		push	large [bp+var_2BC]
		push	ss
		pop	ds
		mov	ax, 1
		cmp	word ptr [bp+var_2A2+2], 0
		jnz	short loc_33847
		mov	eax, [bp+var_2B8]
		add	eax, [bp+var_2AE]
		shr	eax, 10h
		sub	ax, word ptr [bp+var_2B8+2]
		jns	short loc_33847
		neg	ax

loc_33847:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+2A9j
					; Render_DrawRotatedScaledSprite_33586+2BDj
		mov	[bp+var_2BE], ax
		mov	ax, [bp+arg_C]
		or	ax, ax
		jns	short loc_33855
		std
		neg	ax

loc_33855:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+2CAj
		mul	[bp+var_2AA]
		add	ax, 80h	; '�'
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	[bp+var_2C2], ax
		or	ax, ax
		jz	loc_3396E
		mov	es, [bp+var_12]
		mov	[bp+var_2C4], 0

loc_33876:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+3E4j
		mov	ax, word ptr [bp+var_2B8+2]
		cmp	ax, [bp+var_C]
		jl	loc_3395E
		cmp	ax, [bp+var_8]
		jg	loc_3395E
		cmp	[bp+var_2C4], 0
		jz	short loc_338A8

loc_3388F:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+3D5j
		mov	si, [bp+var_2A8]
		mov	di, [bp+var_2A6]
		mov	cx, [bp+var_2C8]
		rep movsb
		mov	di, [bp+var_2A4]
		add	[bp+var_2A6], di
		jmp	loc_3395E
; ���������������������������������������������������������������������������

loc_338A8:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+307j
		mov	bx, word ptr [bp+var_2B8+2]
		shl	bx, 1
		add	bx, [bp+var_10]
		mov	di, [bx]
		mov	[bp+var_2A6], di
		mov	bx, [bp+var_2B0]
		mov	edx, [bp+var_29E]
		lea	si, [bp+var_152]
		shl	esi, 10h
		mov	cx, [bp+var_2C2]
		test	[bp+arg_C], 0FFFFh
		jns	short loc_33903
		mov	ax, bx
		sub	ax, [bp+var_A]
		jle	short loc_338EB
		sub	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_29E]

loc_338EB:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+352j
		mov	[bp+var_2C6], bx
		add	[bp+var_2A6], bx
		mov	ax, bx
		sub	ax, cx
		inc	ax
		neg	ax
		add	ax, [bp+var_E]
		jle	short loc_33901
		sub	cx, ax

loc_33901:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+377j
		jmp	short loc_3392F
; ���������������������������������������������������������������������������

loc_33903:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+34Bj
		mov	ax, [bp+var_E]
		sub	ax, bx
		jle	short loc_3391B
		add	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_29E]

loc_3391B:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+382j
		mov	[bp+var_2C6], bx
		add	[bp+var_2A6], bx
		mov	ax, bx
		add	ax, cx
		dec	ax
		sub	ax, [bp+var_A]
		jle	short loc_3392F
		sub	cx, ax

loc_3392F:				; CODE XREF: Render_DrawRotatedScaledSprite_33586:loc_33901j
					; Render_DrawRotatedScaledSprite_33586+3A5j
		or	cx, cx
		jle	short loc_3396E
		lea	di, [bp+var_292]
		add	di, bx
		mov	[bp+var_2A8], di
		mov	[bp+var_2C8], cx

loc_33941:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+3CFj
		ror	esi, 10h
		mov	al, [si]
		mov	[di], al
		rol	esi, 10h
		add	di, [bp+var_2CA]
		add	esi, edx
		dec	cx
		jnz	short loc_33941
		inc	[bp+var_2C4]
		jmp	loc_3388F
; ���������������������������������������������������������������������������

loc_3395E:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+2F7j
					; Render_DrawRotatedScaledSprite_33586+2FEj ...
		mov	ax, [bp+var_2CC]
		add	word ptr [bp+var_2B8+2], ax
		dec	[bp+var_2BE]
		jnz	loc_33876

loc_3396E:				; CODE XREF: Render_DrawRotatedScaledSprite_33586+2E3j
					; Render_DrawRotatedScaledSprite_33586+3ABj
		cld
		pop	large [bp+var_2BC]
		pop	large [bp+var_2B8]
		pop	si
		pop	ds
		jmp	loc_33750
; ���������������������������������������������������������������������������

loc_3397E:				; CODE XREF: Render_DrawRotatedScaledSprite_33586:loc_335A1j
					; Render_DrawRotatedScaledSprite_33586+D7j ...
		pop	ds
		pop	di
		pop	si
		leave
		retf
Render_DrawRotatedScaledSprite_33586	endp

seg126		ends
