seg179		segment	byte public 'CODE' use16
		assume cs:seg179
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 736 lignes, NON DÉTAILLÉE — la plus grosse fonction rencontrée dans ce cluster de
; primitives 2D, structure de frame locale très similaire à Render_DrawScaledSprite_621A2
; (seg175, ~0x2D8 octets), utilise des extensions de signe 32 bits (movsx esi) suggérant un
; traitement d'angle de rotation. Référencée depuis seg063 et seg106 (émetteur de particules)
; — probable variante « avec rotation » de la primitive de rendu de sprite/icône. Candidat
; prioritaire pour session dédiée (aucune lecture de détail effectuée, fonction volumineuse).
; ==============================================================================================
Render_DrawRotatedScaledSprite_62800	proc far		; CODE XREF: seg063:loc_2DDE0P
					; seg106:0A5FP

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

loc_62804:
		push	si
		push	di
		push	ds

loc_62807:				; DATA XREF: seg216:065Eo
		movsx	esi, [bp+arg_C]
		movsx	edi, [bp+arg_E]
		or	esi, esi

loc_62814:
		jz	short loc_6281B

loc_62816:
		or	edi, edi

loc_62819:
		jnz	short loc_6281E

loc_6281B:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62814j
		jmp	loc_62BF8
; ���������������������������������������������������������������������������

loc_6281E:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62819j
		mov	eax, 8000h
		jns	short loc_62828

loc_62826:
		dec	eax

loc_62828:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+24j
		mov	[bp+var_2D0], eax
		mov	eax, 1000000h
		cdq

loc_62835:
		idiv	esi

loc_62838:
		mov	[bp+var_296], eax
		or	eax, eax
		jns	short loc_62845

loc_62842:
		neg	eax

loc_62845:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+40j
		mov	[bp+var_29E], eax

loc_6284A:
		shr	eax, 10h

loc_6284E:
		cmp	ax, 1

loc_62851:
		jle	short loc_62863

loc_62853:
		test	[bp+arg_C], 0FFFFh
		jnz	short loc_62863
		mov	dx, [bp+arg_2]
		add	dx, ax

loc_6285F:
		dec	dx
		mov	[bp+arg_2], dx

loc_62863:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62851j
					; Render_DrawRotatedScaledSprite_62800+58j
		mov	eax, 1000000h
		cdq
		idiv	edi
		mov	[bp+var_29A], eax
		or	eax, eax

loc_62876:
		jns	short loc_6287B
		neg	eax

loc_6287B:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62876j
		mov	[bp+var_2A2], eax
		xor	ax, ax

loc_62882:
		shl	si, 1

loc_62884:
		setnbe	al

loc_62887:
		sbb	ax, 0

loc_6288A:
		mov	[bp+var_2CA], ax
		xor	ax, ax

loc_62890:
		shl	di, 1

loc_62892:
		setnbe	al

loc_62895:
		sbb	ax, 0
		mov	[bp+var_2CC], ax
		movsx	eax, [bp+arg_E]
		shl	eax, 8
		mov	[bp+var_2AE], eax
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]

loc_628B0:
		lea	di, [bp+var_12]
		mov	cx, 6

loc_628B6:
		rep movsw
		mov	bx, [bp+var_10]
		mov	ax, [bx+2]
		sub	ax, [bx]

loc_628C0:
		imul	[bp+var_2CC]
		mov	[bp+var_2A4], ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2

loc_628D2:
		cmp	bx, [si+4]
		jb	short loc_628DA
		jmp	loc_62BF8
; ���������������������������������������������������������������������������

loc_628DA:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+D5j
		mov	ax, ds

loc_628DC:
		movzx	eax, ax

loc_628E0:
		shl	eax, 4

loc_628E4:
		add	ax, si
		add	eax, [bx+si]
		mov	si, ax
		and	si, 0Fh
		shr	eax, 4
		mov	ds, ax
		mov	bx, [bp+arg_C]

loc_628F7:
		mov	cx, [bp+arg_2]
		mov	ax, [si+2]
		mov	dx, [si]

loc_628FF:
		or	bx, bx
		jns	short loc_62906
		xchg	ax, dx
		neg	bx

loc_62906:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+101j
		mov	[bp+var_2D2], ax
		mov	[bp+var_2D4], dx

loc_6290E:
		mov	ax, [bp+var_2D2]

loc_62912:
		imul	bx
		mov	al, ah

loc_62916:
		mov	ah, dl
		neg	ax
		add	ax, cx

loc_6291C:
		cmp	ax, [bp+var_A]

loc_6291F:
		jg	short loc_6299E

loc_62921:
		mov	ax, [si]

loc_62923:
		inc	ax

loc_62924:
		imul	bx

loc_62926:
		mov	al, ah
		mov	ah, dl
		dec	ax

loc_6292B:
		add	ax, cx

loc_6292D:
		cmp	ax, [bp+var_E]

loc_62930:
		jl	short loc_6299E

loc_62932:
		mov	bx, [bp+arg_E]

loc_62935:
		mov	cx, [bp+arg_4]
		mov	ax, [si+4]

loc_6293B:
		mov	dx, [si+6]
		or	bx, bx

loc_62940:
		jns	short loc_62945
		xchg	ax, dx

loc_62943:
		neg	bx

loc_62945:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62940j
		mov	[bp+var_2D6], ax
		mov	[bp+var_2D8], dx

loc_6294D:
		movsx	eax, word ptr [si+4]

loc_62952:
		neg	eax

loc_62955:
		mov	[bp+var_2C0], ax

loc_62959:
		dec	[bp+var_2C0]

loc_6295D:
		shl	eax, 10h

loc_62961:
		sub	eax, [bp+var_2A2]

loc_62966:
		add	eax, [bp+var_2D0]
		mov	[bp+var_2BC], eax

loc_62970:
		mov	ax, [bp+var_2D6]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax

loc_6297C:
		add	ax, cx
		mov	[bp+var_2D6], ax

loc_62982:
		cmp	ax, [bp+var_8]
		jg	short loc_6299E

loc_62987:
		mov	ax, [bp+var_2D8]
		inc	ax

loc_6298C:
		imul	bx

loc_6298E:
		mov	al, ah

loc_62990:
		mov	ah, dl
		dec	ax

loc_62993:
		add	ax, cx
		mov	[bp+var_2D8], ax
		cmp	ax, [bp+var_C]
		jge	short loc_629A1

loc_6299E:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_6291Fj
					; Render_DrawRotatedScaledSprite_62800:loc_62930j	...
		jmp	loc_62BF8
; ���������������������������������������������������������������������������

loc_629A1:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+19Cj
		mov	ax, [bp+var_2D6]
		test	[bp+var_2CC], 0FFFFh
		jns	short loc_629B1
		mov	ax, [bp+var_2D8]

loc_629B1:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+1ABj
		shl	eax, 10h
		add	eax, [bp+var_2D0]
		sub	eax, [bp+var_2AE]
		mov	[bp+var_2B8], eax

loc_629C4:
		xor	ecx, ecx

loc_629C7:
		lea	si, [si+8]

loc_629CA:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62A2Bj
					; Render_DrawRotatedScaledSprite_62800+3F5j
		lodsw
		or	ax, ax

loc_629CD:
		jz	loc_62BF8
		mov	cx, ax

loc_629D3:
		lodsw
		mov	bx, ax
		lodsw
		cmp	ax, [bp+var_2C0]
		jz	short loc_62A2D
		cmp	ax, word ptr [bp+var_2BC+2]
		jl	short loc_62A0C

loc_629E3:
		mov	edi, [bp+var_2AE]
		mov	dx, ax
		sub	dx, [bp+var_2C0]

loc_629EE:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+1F4j
		add	[bp+var_2B8], edi

loc_629F3:
		dec	dx
		jnz	short loc_629EE
		mov	edi, [bp+var_2A2]

loc_629FB:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+204j
		add	[bp+var_2BC], edi
		cmp	ax, word ptr [bp+var_2BC+2]
		jg	short loc_629FB
		mov	[bp+var_2C0], ax
		jmp	short loc_62A2D
; ���������������������������������������������������������������������������

loc_62A0C:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+1E1j
		shr	cx, 1
		jb	short loc_62A14

loc_62A10:
		add	si, cx
		jmp	short loc_62A2B
; ���������������������������������������������������������������������������

loc_62A14:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+20Ej
		mov	bx, cx

loc_62A16:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+220j
					; Render_DrawRotatedScaledSprite_62800+229j
		lodsb

loc_62A17:
		shr	al, 1
		cbw
		jb	short loc_62A24
		add	si, ax

loc_62A1E:
		sub	bx, ax
		jnz	short loc_62A16
		jmp	short loc_62A2B
; ���������������������������������������������������������������������������

loc_62A24:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+21Aj
		sub	bx, ax
		lodsb

loc_62A27:
		or	bx, bx
		jnz	short loc_62A16

loc_62A2B:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+212j
					; Render_DrawRotatedScaledSprite_62800+222j
		jmp	short loc_629CA
; ���������������������������������������������������������������������������

loc_62A2D:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+1DBj
					; Render_DrawRotatedScaledSprite_62800+20Aj
		mov	ax, bx

loc_62A2F:
		imul	[bp+arg_C]
		mov	al, ah
		mov	ah, dl
		add	ax, [bp+arg_2]
		mov	[bp+var_2B0], ax
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_62A43:
		shr	cx, 1
		mov	[bp+var_2AA], cx
		jb	short loc_62A5A

loc_62A4B:
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh

loc_62A56:
		rep movsb
		jmp	short loc_62A93
; ���������������������������������������������������������������������������

loc_62A5A:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+249j
		mov	bx, cx

loc_62A5C:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+273j
					; Render_DrawRotatedScaledSprite_62800+291j
		lodsb
		shr	al, 1

loc_62A5F:
		cbw
		mov	cx, ax
		jb	short loc_62A77
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		sub	bx, ax
		jnz	short loc_62A5C
		jmp	short loc_62A93
; ���������������������������������������������������������������������������

loc_62A77:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+262j
		sub	bx, cx
		lodsb

loc_62A7A:
		mov	ah, al
		push	ax
		shl	eax, 10h
		pop	ax

loc_62A82:
		ror	ecx, 2
		rep stosd

loc_62A89:
		shr	ecx, 1Eh
		rep stosb
		or	bx, bx
		jnz	short loc_62A5C

loc_62A93:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+258j
					; Render_DrawRotatedScaledSprite_62800+275j
		push	ds
		push	si
		push	large [bp+var_2B8]
		push	large [bp+var_2BC]
		push	ss
		pop	ds
		mov	ax, 1
		cmp	word ptr [bp+var_2A2+2], 0
		jnz	short loc_62AC1
		mov	eax, [bp+var_2B8]

loc_62AB0:
		add	eax, [bp+var_2AE]
		shr	eax, 10h
		sub	ax, word ptr [bp+var_2B8+2]
		jns	short loc_62AC1
		neg	ax

loc_62AC1:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+2A9j
					; Render_DrawRotatedScaledSprite_62800+2BDj
		mov	[bp+var_2BE], ax
		mov	ax, [bp+arg_C]
		or	ax, ax
		jns	short loc_62ACF
		std
		neg	ax

loc_62ACF:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+2CAj
		mul	[bp+var_2AA]
		add	ax, 80h	; '�'
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	[bp+var_2C2], ax
		or	ax, ax
		jz	loc_62BE8
		mov	es, [bp+var_12]
		mov	[bp+var_2C4], 0

loc_62AF0:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62BE4j
		mov	ax, word ptr [bp+var_2B8+2]
		cmp	ax, [bp+var_C]

loc_62AF7:
		jl	loc_62BD8
		cmp	ax, [bp+var_8]
		jg	loc_62BD8
		cmp	[bp+var_2C4], 0
		jz	short loc_62B22

loc_62B09:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62BD5j
		mov	si, [bp+var_2A8]
		mov	di, [bp+var_2A6]

loc_62B11:
		mov	cx, [bp+var_2C8]
		rep movsb
		mov	di, [bp+var_2A4]

loc_62B1B:
		add	[bp+var_2A6], di
		jmp	loc_62BD8
; ���������������������������������������������������������������������������

loc_62B22:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+307j
		mov	bx, word ptr [bp+var_2B8+2]
		shl	bx, 1
		add	bx, [bp+var_10]

loc_62B2B:
		mov	di, [bx]
		mov	[bp+var_2A6], di
		mov	bx, [bp+var_2B0]
		mov	edx, [bp+var_29E]
		lea	si, [bp+var_152]
		shl	esi, 10h

loc_62B42:
		mov	cx, [bp+var_2C2]

loc_62B46:
		test	[bp+arg_C], 0FFFFh

loc_62B4B:
		jns	short loc_62B7D

loc_62B4D:
		mov	ax, bx

loc_62B4F:
		sub	ax, [bp+var_A]

loc_62B52:
		jle	short loc_62B65

loc_62B54:
		sub	bx, ax

loc_62B56:
		sub	cx, ax

loc_62B58:
		cwde

loc_62B5A:
		mul	edx
		add	esi, eax

loc_62B60:
		mov	edx, [bp+var_29E]

loc_62B65:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62B52j
		mov	[bp+var_2C6], bx
		add	[bp+var_2A6], bx
		mov	ax, bx
		sub	ax, cx
		inc	ax
		neg	ax

loc_62B74:
		add	ax, [bp+var_E]

loc_62B77:
		jle	short loc_62B7B

loc_62B79:
		sub	cx, ax

loc_62B7B:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62B77j
		jmp	short loc_62BA9
; ���������������������������������������������������������������������������

loc_62B7D:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62B4Bj
		mov	ax, [bp+var_E]
		sub	ax, bx

loc_62B82:
		jle	short loc_62B95
		add	bx, ax

loc_62B86:
		sub	cx, ax
		cwde

loc_62B8A:
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_29E]

loc_62B95:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62B82j
		mov	[bp+var_2C6], bx
		add	[bp+var_2A6], bx
		mov	ax, bx
		add	ax, cx
		dec	ax
		sub	ax, [bp+var_A]
		jle	short loc_62BA9
		sub	cx, ax

loc_62BA9:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62B7Bj
					; Render_DrawRotatedScaledSprite_62800+3A5j
		or	cx, cx
		jle	short loc_62BE8
		lea	di, [bp+var_292]
		add	di, bx

loc_62BB3:
		mov	[bp+var_2A8], di

loc_62BB7:
		mov	[bp+var_2C8], cx

loc_62BBB:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+3CFj
		ror	esi, 10h
		mov	al, [si]
		mov	[di], al
		rol	esi, 10h
		add	di, [bp+var_2CA]
		add	esi, edx
		dec	cx
		jnz	short loc_62BBB

loc_62BD1:
		inc	[bp+var_2C4]

loc_62BD5:
		jmp	loc_62B09
; ���������������������������������������������������������������������������

loc_62BD8:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_62AF7j
					; Render_DrawRotatedScaledSprite_62800+2FEj ...
		mov	ax, [bp+var_2CC]

loc_62BDC:
		add	word ptr [bp+var_2B8+2], ax
		dec	[bp+var_2BE]

loc_62BE4:
		jnz	loc_62AF0

loc_62BE8:				; CODE XREF: Render_DrawRotatedScaledSprite_62800+2E3j
					; Render_DrawRotatedScaledSprite_62800+3ABj
		cld
		pop	large [bp+var_2BC]

loc_62BEE:
		pop	large [bp+var_2B8]
		pop	si

loc_62BF4:
		pop	ds
		jmp	loc_629CA
; ���������������������������������������������������������������������������

loc_62BF8:				; CODE XREF: Render_DrawRotatedScaledSprite_62800:loc_6281Bj
					; Render_DrawRotatedScaledSprite_62800+D7j ...
		pop	ds
		pop	di

loc_62BFA:
		pop	si
		leave
		retf
Render_DrawRotatedScaledSprite_62800	endp

seg179		ends
