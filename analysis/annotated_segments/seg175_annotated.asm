seg175		segment	byte public 'CODE' use16
		assume cs:seg175
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 675 lignes, NON DÉTAILLÉE — la plus grosse fonction de ce lot, aucun appel externe
; (calcul entièrement inline), immense frame locale (0x2DA octets ≈ 730 octets, 10 arguments
; dont deux pointeurs far). Référencée depuis seg032 (zoom carte/radar) ET seg106 (émetteur de
; particules) — probable primitive de rendu de sprite/icône avec mise à l'échelle et/ou
; rotation, partagée entre plusieurs sous-systèmes. Candidat prioritaire pour session dédiée
; (aucune lecture de détail effectuée).
; ==============================================================================================
Render_DrawScaledSprite_621A2	proc far		; CODE XREF: seg032:0783P seg106:0C30P ...

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
		jz	short loc_621BD
		or	edi, edi
		jnz	short loc_621C0

loc_621BD:				; CODE XREF: Render_DrawScaledSprite_621A2+14j
		jmp	loc_625C7
; ���������������������������������������������������������������������������

loc_621C0:				; CODE XREF: Render_DrawScaledSprite_621A2+19j
		mov	eax, 8000h
		jns	short loc_621CA
		dec	eax

loc_621CA:				; CODE XREF: Render_DrawScaledSprite_621A2+24j
		mov	[bp+var_2D2], eax

loc_621CF:
		mov	eax, 1000000h
		cdq

loc_621D7:
		idiv	esi
		mov	[bp+var_298], eax
		or	eax, eax

loc_621E2:
		jns	short loc_621E7

loc_621E4:
		neg	eax

loc_621E7:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_621E2j
		mov	[bp+var_2A0], eax
		shr	eax, 10h
		cmp	ax, 1

loc_621F3:
		jle	short loc_62205

loc_621F5:
		test	[bp+arg_C], 0FFFFh
		jnz	short loc_62205

loc_621FC:
		mov	dx, [bp+arg_2]
		add	dx, ax
		dec	dx

loc_62202:
		mov	[bp+arg_2], dx

loc_62205:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_621F3j
					; Render_DrawScaledSprite_621A2+58j
		mov	eax, 1000000h
		cdq
		idiv	edi
		mov	[bp+var_29C], eax
		or	eax, eax
		jns	short loc_6221D
		neg	eax

loc_6221D:				; CODE XREF: Render_DrawScaledSprite_621A2+76j
		mov	[bp+var_2A4], eax
		xor	ax, ax
		shl	si, 1
		setnbe	al
		sbb	ax, 0
		mov	[bp+var_2CC], ax

loc_62230:
		xor	ax, ax

loc_62232:
		shl	di, 1
		setnbe	al

loc_62237:
		sbb	ax, 0
		mov	[bp+var_2CE], ax

loc_6223E:
		movsx	eax, [bp+arg_E]

loc_62243:
		shl	eax, 8
		mov	[bp+var_2B0], eax
		mov	ax, [bp+arg_14]
		add	ax, [bp+arg_16]

loc_62252:
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
		jb	short loc_62285

loc_62282:
		jmp	loc_625C7
; ���������������������������������������������������������������������������

loc_62285:				; CODE XREF: Render_DrawScaledSprite_621A2+DEj
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		add	ax, si
		add	eax, [bx+si]

loc_62294:
		mov	si, ax
		and	si, 0Fh
		shr	eax, 4
		mov	ds, ax
		mov	bx, [bp+arg_C]
		mov	cx, [bp+arg_2]
		mov	ax, [si+2]
		mov	dx, [si]
		or	bx, bx
		jns	short loc_622B1
		xchg	ax, dx
		neg	bx

loc_622B1:				; CODE XREF: Render_DrawScaledSprite_621A2+10Aj
		mov	[bp+var_2D4], ax
		mov	[bp+var_2D6], dx
		mov	ax, [bp+var_2D4]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx

loc_622C7:
		cmp	ax, [bp+var_C]
		jg	short loc_62349

loc_622CC:
		mov	ax, [si]
		inc	ax
		imul	bx

loc_622D1:
		mov	al, ah

loc_622D3:
		mov	ah, dl

loc_622D5:
		dec	ax
		add	ax, cx

loc_622D8:
		cmp	ax, [bp+var_10]
		jl	short loc_62349

loc_622DD:
		mov	bx, [bp+arg_E]
		mov	cx, [bp+arg_4]

loc_622E3:
		mov	ax, [si+4]
		mov	dx, [si+6]
		or	bx, bx
		jns	short loc_622F0
		xchg	ax, dx
		neg	bx

loc_622F0:				; CODE XREF: Render_DrawScaledSprite_621A2+149j
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

loc_62330:
		jg	short loc_62349

loc_62332:
		mov	ax, [bp+var_2DA]
		inc	ax

loc_62337:
		imul	bx
		mov	al, ah
		mov	ah, dl

loc_6233D:
		dec	ax
		add	ax, cx

loc_62340:
		mov	[bp+var_2DA], ax

loc_62344:
		cmp	ax, [bp+var_E]

loc_62347:
		jge	short loc_6234C

loc_62349:				; CODE XREF: Render_DrawScaledSprite_621A2+128j
					; Render_DrawScaledSprite_621A2+139j ...
		jmp	loc_625C7
; ���������������������������������������������������������������������������

loc_6234C:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_62347j
		mov	ax, [bp+var_2D8]

loc_62350:
		test	[bp+var_2CE], 0FFFFh
		jns	short loc_6235C
		mov	ax, [bp+var_2DA]

loc_6235C:				; CODE XREF: Render_DrawScaledSprite_621A2+1B4j
		shl	eax, 10h
		add	eax, [bp+var_2D2]
		sub	eax, [bp+var_2B0]
		mov	[bp+var_2BA], eax
		xor	ecx, ecx
		lea	si, [si+8]

loc_62375:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_623D6j
					; Render_DrawScaledSprite_621A2+422j
		lodsw
		or	ax, ax
		jz	loc_625C7
		mov	cx, ax
		lodsw
		mov	bx, ax
		lodsw

loc_62382:
		cmp	ax, [bp+var_2C2]
		jz	short loc_623D8

loc_62388:
		cmp	ax, word ptr [bp+var_2BE+2]

loc_6238C:
		jl	short loc_623B7
		mov	edi, [bp+var_2B0]
		mov	dx, ax
		sub	dx, [bp+var_2C2]

loc_62399:				; CODE XREF: Render_DrawScaledSprite_621A2+1FDj
		add	[bp+var_2BA], edi
		dec	dx
		jnz	short loc_62399
		mov	edi, [bp+var_2A4]

loc_623A6:				; CODE XREF: Render_DrawScaledSprite_621A2+20Dj
		add	[bp+var_2BE], edi
		cmp	ax, word ptr [bp+var_2BE+2]
		jge	short loc_623A6

loc_623B1:
		mov	[bp+var_2C2], ax

loc_623B5:
		jmp	short loc_623D8
; ���������������������������������������������������������������������������

loc_623B7:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_6238Cj
		shr	cx, 1
		jb	short loc_623BF

loc_623BB:
		add	si, cx

loc_623BD:
		jmp	short loc_623D6
; ���������������������������������������������������������������������������

loc_623BF:				; CODE XREF: Render_DrawScaledSprite_621A2+217j
		mov	bx, cx

loc_623C1:				; CODE XREF: Render_DrawScaledSprite_621A2+229j
					; Render_DrawScaledSprite_621A2:loc_623D4j
		lodsb

loc_623C2:
		shr	al, 1

loc_623C4:
		cbw
		jb	short loc_623CF

loc_623C7:
		add	si, ax
		sub	bx, ax
		jnz	short loc_623C1

loc_623CD:
		jmp	short loc_623D6
; ���������������������������������������������������������������������������

loc_623CF:				; CODE XREF: Render_DrawScaledSprite_621A2+223j
		sub	bx, ax
		lodsb
		or	bx, bx

loc_623D4:
		jnz	short loc_623C1

loc_623D6:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_623BDj
					; Render_DrawScaledSprite_621A2:loc_623CDj
		jmp	short loc_62375
; ���������������������������������������������������������������������������

loc_623D8:				; CODE XREF: Render_DrawScaledSprite_621A2+1E4j
					; Render_DrawScaledSprite_621A2:loc_623B5j
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
		jb	short loc_62405
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb

loc_62403:
		jmp	short loc_6243E
; ���������������������������������������������������������������������������

loc_62405:				; CODE XREF: Render_DrawScaledSprite_621A2+252j
		mov	bx, cx

loc_62407:				; CODE XREF: Render_DrawScaledSprite_621A2+27Cj
					; Render_DrawScaledSprite_621A2+29Aj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_62422
		ror	ecx, 2

loc_62413:
		rep movsd

loc_62416:
		shr	ecx, 1Eh
		rep movsb

loc_6241C:
		sub	bx, ax
		jnz	short loc_62407

loc_62420:
		jmp	short loc_6243E
; ���������������������������������������������������������������������������

loc_62422:				; CODE XREF: Render_DrawScaledSprite_621A2+26Bj
		sub	bx, cx

loc_62424:
		lodsb
		mov	ah, al

loc_62427:
		push	ax
		shl	eax, 10h
		pop	ax
		ror	ecx, 2

loc_62431:
		rep stosd
		shr	ecx, 1Eh
		rep stosb
		or	bx, bx
		jnz	short loc_62407

loc_6243E:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_62403j
					; Render_DrawScaledSprite_621A2:loc_62420j
		push	ds
		push	si

loc_62440:
		push	large [bp+var_2BA]
		push	large [bp+var_2BE]
		push	ss
		pop	ds
		mov	ax, 1
		cmp	word ptr [bp+var_2A4+2], 0
		jnz	short loc_6246C
		mov	eax, [bp+var_2BA]
		add	eax, [bp+var_2B0]
		shr	eax, 10h
		sub	ax, word ptr [bp+var_2BA+2]
		jns	short loc_6246C
		neg	ax

loc_6246C:				; CODE XREF: Render_DrawScaledSprite_621A2+2B2j
					; Render_DrawScaledSprite_621A2+2C6j
		mov	[bp+var_2C0], ax
		mov	ax, [bp+arg_C]
		or	ax, ax
		jns	short loc_6247A
		std
		neg	ax

loc_6247A:				; CODE XREF: Render_DrawScaledSprite_621A2+2D3j
		mul	[bp+var_2AC]
		add	ax, 80h	; '�'
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	[bp+var_2C4], ax
		or	ax, ax
		jz	loc_625B7
		mov	es, [bp+var_14]
		mov	[bp+var_2C6], 0

loc_6249B:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_625B3j
		mov	ax, word ptr [bp+var_2BA+2]
		cmp	ax, [bp+var_E]
		jl	loc_625A7
		cmp	ax, [bp+var_A]
		jg	loc_625A7
		cmp	[bp+var_2C6], 0
		jz	short loc_624F1

loc_624B4:				; CODE XREF: Render_DrawScaledSprite_621A2+402j
		mov	si, [bp+var_2AA]
		mov	di, [bp+var_2A8]
		mov	ah, byte ptr [bp+arg_14]

loc_624BF:
		mov	cx, [bp+var_2CA]

loc_624C3:				; CODE XREF: Render_DrawScaledSprite_621A2+327j
		lodsb
		cmp	al, ah
		jnb	short loc_624D6

loc_624C8:				; CODE XREF: Render_DrawScaledSprite_621A2+337j
					; Render_DrawScaledSprite_621A2+34Dj
		stosb
		loop	loc_624C3
		mov	di, [bp+var_2A6]
		add	[bp+var_2A8], di

loc_624D3:
		jmp	loc_625A7
; ���������������������������������������������������������������������������

loc_624D6:				; CODE XREF: Render_DrawScaledSprite_621A2+324j
		cmp	al, byte ptr [bp+var_2]
		jnb	short loc_624C8
		mov	dl, al
		sub	dl, ah
		shl	dx, 8
		mov	al, es:[di]
		lds	bx, [bp+arg_10]
		add	bx, dx
		xlat
		mov	dx, ss
		mov	ds, dx
		jmp	short loc_624C8
; ���������������������������������������������������������������������������

loc_624F1:				; CODE XREF: Render_DrawScaledSprite_621A2+310j
		mov	bx, word ptr [bp+var_2BA+2]

loc_624F5:
		shl	bx, 1
		add	bx, [bp+var_12]
		mov	di, [bx]
		mov	[bp+var_2A8], di
		mov	bx, [bp+var_2B2]
		mov	edx, [bp+var_2A0]
		lea	si, [bp+var_154]
		shl	esi, 10h
		mov	cx, [bp+var_2C4]

loc_62515:
		test	[bp+arg_C], 0FFFFh
		jns	short loc_6254C
		mov	ax, bx

loc_6251E:
		sub	ax, [bp+var_C]
		jle	short loc_62534
		sub	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_2A0]

loc_62534:				; CODE XREF: Render_DrawScaledSprite_621A2+37Fj
		mov	[bp+var_2C8], bx

loc_62538:
		add	[bp+var_2A8], bx
		mov	ax, bx

loc_6253E:
		sub	ax, cx
		inc	ax

loc_62541:
		neg	ax

loc_62543:
		add	ax, [bp+var_10]
		jle	short loc_6254A
		sub	cx, ax

loc_6254A:				; CODE XREF: Render_DrawScaledSprite_621A2+3A4j
		jmp	short loc_62578
; ���������������������������������������������������������������������������

loc_6254C:				; CODE XREF: Render_DrawScaledSprite_621A2+378j
		mov	ax, [bp+var_10]
		sub	ax, bx
		jle	short loc_62564

loc_62553:
		add	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_2A0]

loc_62564:				; CODE XREF: Render_DrawScaledSprite_621A2+3AFj
		mov	[bp+var_2C8], bx
		add	[bp+var_2A8], bx
		mov	ax, bx
		add	ax, cx
		dec	ax
		sub	ax, [bp+var_C]
		jle	short loc_62578
		sub	cx, ax

loc_62578:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_6254Aj
					; Render_DrawScaledSprite_621A2+3D2j
		or	cx, cx
		jle	short loc_625B7
		lea	di, [bp+var_294]
		add	di, bx
		mov	[bp+var_2AA], di
		mov	[bp+var_2CA], cx

loc_6258A:				; CODE XREF: Render_DrawScaledSprite_621A2+3FCj
		ror	esi, 10h
		mov	al, [si]
		mov	[di], al
		rol	esi, 10h
		add	di, [bp+var_2CC]
		add	esi, edx
		dec	cx
		jnz	short loc_6258A
		inc	[bp+var_2C6]
		jmp	loc_624B4
; ���������������������������������������������������������������������������

loc_625A7:				; CODE XREF: Render_DrawScaledSprite_621A2+300j
					; Render_DrawScaledSprite_621A2+307j ...
		mov	ax, [bp+var_2CE]
		add	word ptr [bp+var_2BA+2], ax
		dec	[bp+var_2C0]

loc_625B3:
		jnz	loc_6249B

loc_625B7:				; CODE XREF: Render_DrawScaledSprite_621A2+2ECj
					; Render_DrawScaledSprite_621A2+3D8j
		cld

loc_625B8:
		pop	large [bp+var_2BE]

loc_625BD:
		pop	large [bp+var_2BA]
		pop	si
		pop	ds
		jmp	loc_62375
; ���������������������������������������������������������������������������

loc_625C7:				; CODE XREF: Render_DrawScaledSprite_621A2:loc_621BDj
					; Render_DrawScaledSprite_621A2:loc_62282j	...
		pop	ds
		pop	di
		pop	si
		leave
		retf
Render_DrawScaledSprite_621A2	endp

seg175		ends
