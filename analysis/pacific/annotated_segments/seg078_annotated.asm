seg078		segment	para public 'CODE' use16
		assume cs:seg078
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 14h, 75h, 83h, 0C4h, 6, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, 2307 lignes. LUE EN PARTIE 2026-11-05 (champs de la face seulement). Dessine une face :
; image = dword +14h de la face (-> dword_77B78 ; 0 = sans image), double face = octet +25h
; (-> byte_77B7C) ; sommets transformés dans le repère de l'observateur
; (Matrix_WorldToLocal_5A569) avec cache (bit 80h de +10h du sommet) ; u, v des 3 sommets
; (+18h à +22h) passés en 8.8 (shl ax, 8) : coordonnées en POINTS de l'image. Clé de tri :
; profondeur du sommet le plus loin + 7D00h, moins 1900h si l'octet +25h vaut 1, moins 4B00h
; s'il vaut 2 (rôle exact non lu). Découpage et envoi (sub_2E656, sub_634A4) non lus.
; ==============================================================================================
Render_FacePipeline_2EEB8		proc far

var_534		= dword ptr -534h
var_530		= dword ptr -530h
var_52C		= dword ptr -52Ch
var_528		= dword ptr -528h
var_524		= dword ptr -524h
var_520		= dword ptr -520h
var_51C		= dword ptr -51Ch
var_518		= word ptr -518h
var_516		= word ptr -516h
var_514		= word ptr -514h
var_2D4		= dword ptr -2D4h
var_2D0		= dword ptr -2D0h
var_2B0		= dword ptr -2B0h
var_2AC		= dword ptr -2ACh
var_28C		= dword ptr -28Ch
var_288		= dword ptr -288h
var_94		= word ptr -94h
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_4C		= word ptr -4Ch
var_44		= word ptr -44h
var_42		= word ptr -42h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_16		= dword ptr -16h
var_4		= dword ptr -4
arg_0		= word ptr  6

		enter	534h, 0
		push	si
		push	di
		push	ds
		push	es
		lgs	si, [bp+arg_0]
		movzx	eax, word_7CA4C
		shl	eax, 8
		mov	[bp+var_51C], eax
		movzx	eax, word_7CA4E
		shl	eax, 8
		mov	[bp+var_520], eax
		movzx	eax, word_7CA50
		shl	eax, 8
		mov	[bp+var_524], eax
		movzx	eax, word_7CA52
		shl	eax, 8
		mov	[bp+var_528], eax
		mov	ax, word_77C16
		add	ax, 60h
		cmp	ax, word_77C1E
		jnb	loc_30C12
		mov	eax, gs:[si+14h]
		mov	dword_77B78, eax
		xor	ax, ax
		mov	al, gs:[si+25h]
		mov	byte_77B7C, al
		cmp	byte_77B8A, 0
		jnz	short loc_2EF2E
		cmp	byte_77B7C, 1
		jnz	short loc_2EF2E

loc_2EF2E:
		mov	ch, 0FFh
		mov	cl, 0
		lea	di, [bp+var_94]

loc_2EF36:
		mov	bl, cl
		mov	bh, 0
		mov	ax, gs:[bx+si+7]
		mov	[di+1Ah], ax
		mov	ax, gs:[bx+si+0Dh]
		mov	[di+1Eh], ax
		mov	ax, gs:[bx+si+1]
		mov	[di+1Ch], ax
		mov	bx, ax
		test	byte ptr gs:[bx+10h], 80h
		jnz	short loc_2EFCA
		mov	eax, gs:[bx+11h]
		sub	eax, dword_7CA18
		mov	[bp+var_534], eax
		mov	eax, gs:[bx+15h]
		sub	eax, dword_7CA1C
		mov	[bp+var_530], eax
		mov	eax, gs:[bx+19h]
		sub	eax, dword_7CA20
		mov	[bp+var_52C], eax
		push	cx
		push	bx
		mov	ax, 62F4h
		push	ax
		lea	ax, word ptr [bp+var_534]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		pop	bx
		pop	cx
		mov	eax, [bp+var_534]
		mov	gs:[bx], eax
		mov	[di+0Eh], eax
		mov	eax, [bp+var_52C]
		mov	gs:[bx+8], eax
		mov	[di+16h], eax
		mov	eax, [bp+var_530]
		mov	gs:[bx+4], eax
		mov	[di+12h], eax
		or	byte ptr gs:[bx+10h], 80h
		jmp	short loc_2EFE4

loc_2EFCA:
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax

loc_2EFE4:
		mov	dl, 0
		cmp	eax, dword_77C22
		jge	short loc_2EFF0
		or	dl, 1

loc_2EFF0:
		cmp	eax, dword_77C26
		jle	short loc_2EFFA
		or	dl, 2

loc_2EFFA:
		and	ch, dl
		mov	al, 0
		test	byte ptr gs:[bx+10h], 40h
		jz	short loc_2F022
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4], eax
		mov	al, 1

loc_2F022:
		mov	[di+20h], al
		mov	[di+21h], al
		mov	ah, gs:[bx+1Dh]
		xor	al, al
		mov	[di+0Ch], ax
		add	di, 24h
		add	cl, 2
		cmp	cl, 6
		jl	loc_2EF36
		cmp	ch, 0
		jnz	loc_30C12
		mov	ax, gs:[si+18h]
		shl	ax, 8
		mov	[bp+var_8C], ax
		mov	ax, gs:[si+1Ah]
		shl	ax, 8
		mov	[bp+var_8A], ax
		mov	ax, gs:[si+1Ch]
		shl	ax, 8
		mov	[bp+var_68], ax
		mov	ax, gs:[si+1Eh]
		shl	ax, 8
		mov	[bp+var_66], ax
		mov	ax, gs:[si+20h]
		shl	ax, 8
		mov	[bp+var_44], ax
		mov	ax, gs:[si+22h]
		shl	ax, 8
		mov	[bp+var_42], ax
		mov	word_77B85, 0
		mov	[bp+var_516], 0
		lea	ax, [bp+var_94]
		mov	[bp+var_518], ax
		lea	di, word ptr [bp+var_2D4]
		lea	si, [bp+var_4C]

loc_2F09E:
		mov	bx, [bp+var_516]
		mov	ax, [bp+var_518]
		mov	dx, si
		mov	si, [bp+arg_0]
		mov	cx, gs:[bx+si+7]
		mov	si, dx
		cmp	cx, 0
		jz	loc_2F1E7
		mov	bx, cx
		mov	dx, 0
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_2F1E7
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4], eax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_2F116
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_2F142

loc_2F116:
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		jz	short loc_2F12F
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+0Eh]
		sub	eax, [bx+0Eh]
		jmp	short loc_2F142

loc_2F12F:
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		mov	ecx, eax
		mov	eax, [di+16h]
		sub	eax, [bx+16h]

loc_2F142:
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		cmp	dword_77B78, 0
		jz	short loc_2F1A1
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2F1A1:
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 1
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B85
		mov	dx, 1
		jmp	short loc_2F1E9

loc_2F1E7:
		mov	bx, ax

loc_2F1E9:
		mov	si, bx
		mov	ax, [bp+var_518]
		add	ax, 24h
		mov	bx, [bp+var_516]
		cmp	bx, 4
		jnz	short loc_2F1FF
		lea	ax, [bp+var_94]

loc_2F1FF:
		push	si
		mov	si, [bp+arg_0]
		mov	cx, gs:[bx+si+0Dh]
		pop	si
		cmp	cx, 0
		jz	loc_2F354
		mov	bx, cx
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_2F354
		cmp	dl, 1
		jz	short loc_2F236
		mov	dx, si
		mov	si, [bp+var_518]
		push	es
		mov	cx, ds
		mov	es, cx
		mov	cx, 12h
		rep movsw
		mov	si, dx
		pop	es
		inc	word_77B85

loc_2F236:
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4], eax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_2F286
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_2F2B2

loc_2F286:
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		jz	short loc_2F29F
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+0Eh]
		sub	eax, [bx+0Eh]
		jmp	short loc_2F2B2

loc_2F29F:
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		mov	ecx, eax
		mov	eax, [di+16h]
		sub	eax, [bx+16h]

loc_2F2B2:
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		cmp	dword_77B78, 0
		jz	short loc_2F311
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2F311:
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 1
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B85
		jmp	short loc_2F369

loc_2F354:
		mov	dx, si
		mov	si, [bp+var_518]
		mov	cx, ds
		mov	es, cx
		mov	cx, 12h
		rep movsw
		mov	si, dx
		inc	word_77B85

loc_2F369:
		add	[bp+var_518], 24h
		add	[bp+var_516], 2
		cmp	[bp+var_516], 6
		jl	loc_2F09E
		mov	word_77B87, 0
		mov	ax, word_77B85
		mov	[bp+var_516], ax
		mov	eax, dword_77C26
		mov	dword_77B7D, eax
		lea	si, word ptr [bp+var_2D4]
		mov	bx, si
		add	bx, 24h
		mov	di, bx
		add	di, 24h
		mov	eax, [di+12h]
		mov	edx, [si+12h]
		cmp	eax, edx
		jge	short loc_2F3AF
		mov	eax, edx

loc_2F3AF:
		mov	edx, [bx+12h]
		cmp	eax, edx
		jge	short loc_2F3BB
		mov	eax, edx

loc_2F3BB:
		add	eax, 7D00h
		xor	cx, cx
		mov	cl, byte_77B7C
		cmp	cx, 1
		jnz	short loc_2F3D4
		nop
		nop
		sub	eax, 1900h

loc_2F3D4:
		cmp	cx, 2
		jnz	short loc_2F3E1
		nop
		nop
		sub	eax, 4B00h

loc_2F3E1:
		mov	[bp+var_4], eax
		lea	di, [bp+var_514]

loc_2F3E9:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_2F3FE
		mov	eax, [si+12h]
		cmp	eax, dword_77B7D
		jg	short loc_2F3FE
		or	dl, 1

loc_2F3FE:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_2F417
		mov	eax, [bx+12h]
		cmp	eax, dword_77B7D
		jg	short loc_2F417
		or	dl, 2

loc_2F417:
		mov	al, dl
		cmp	al, 1
		jl	loc_2F65A
		cmp	al, 2
		jz	loc_2F539
		jg	loc_2F646
		mov	eax, [si+12h]
		cmp	eax, dword_77B7D
		jz	loc_2F65A
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_2F519
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2F519:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77B87
		jmp	loc_2F65A

loc_2F539:
		mov	eax, [bx+12h]
		cmp	eax, dword_77B7D
		jz	loc_2F646
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_2F629
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2F629:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B87

loc_2F646:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77B87

loc_2F65A:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_2F66D
		lea	bx, word ptr [bp+var_2D4]

loc_2F66D:
		dec	[bp+var_516]
		jnz	loc_2F3E9
		cmp	word_77B87, 2
		jle	loc_30C12
		mov	ax, word_77B87
		mov	word_77B85, ax
		mov	[bp+var_516], ax
		mov	word_77B87, 0
		mov	eax, dword_77C22
		mov	dword_77B7D, eax
		lea	si, [bp+var_514]
		mov	bx, si
		add	bx, 24h
		lea	di, word ptr [bp+var_2D4]

loc_2F6A3:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_2F6B8
		mov	eax, [si+12h]
		cmp	eax, dword_77B7D
		jl	short loc_2F6B8
		or	dl, 1

loc_2F6B8:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_2F6D1
		mov	eax, [bx+12h]
		cmp	eax, dword_77B7D
		jl	short loc_2F6D1
		or	dl, 2

loc_2F6D1:
		mov	al, dl
		cmp	al, 1
		jl	loc_2F914
		cmp	al, 2
		jz	loc_2F7F3
		jg	loc_2F900
		mov	eax, [si+12h]
		cmp	eax, dword_77B7D
		jz	loc_2F914
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_2F7D3
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2F7D3:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77B87
		jmp	loc_2F914

loc_2F7F3:
		mov	eax, [bx+12h]
		cmp	eax, dword_77B7D
		jz	loc_2F900
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_2F8E3
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2F8E3:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B87

loc_2F900:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77B87

loc_2F914:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_2F927
		lea	bx, [bp+var_514]

loc_2F927:
		dec	[bp+var_516]
		jnz	loc_2F6A3
		cmp	word_77B87, 2
		jle	loc_30C12
		mov	cx, word_77B87
		lea	si, word ptr [bp+var_2D4]
		mov	bl, 0FFh

loc_2F942:
		cmp	byte ptr [si+20h], 1
		jz	short loc_2F98F
		mov	eax, [si+0Eh]
		mov	edx, [si+12h]
		imul	dword_7CA10
		idiv	dword ptr [si+12h]
		mov	edx, eax
		mov	ax, word_7CA0C
		cwde
		shl	eax, 8
		add	eax, edx
		mov	[si], eax
		mov	eax, [si+16h]
		imul	dword_7CA14
		idiv	dword ptr [si+12h]
		mov	edx, eax
		mov	ax, word_7CA0E
		cwde
		shl	eax, 8
		sub	eax, edx
		mov	[si+4], eax
		mov	byte ptr [si+20h], 1

loc_2F98F:
		xor	dl, dl
		mov	eax, [si]
		cmp	eax, [bp+var_51C]
		jge	short loc_2F99E
		or	dl, 1

loc_2F99E:
		cmp	eax, [bp+var_524]
		jle	short loc_2F9A8
		or	dl, 4

loc_2F9A8:
		mov	eax, [si+4]
		cmp	eax, [bp+var_520]
		jge	short loc_2F9B6
		or	dl, 2

loc_2F9B6:
		cmp	eax, [bp+var_528]
		jle	short loc_2F9C0
		or	dl, 8

loc_2F9C0:
		and	bl, dl
		add	si, 24h
		dec	cx
		jnz	loc_2F942
		cmp	bl, 0
		jnz	loc_30C12
		mov	ax, word_77B87
		mov	word_77B85, ax
		mov	[bp+var_516], ax
		mov	word_77B87, 0
		mov	eax, [bp+var_520]
		mov	dword_77B7D, eax
		lea	si, word ptr [bp+var_2D4]
		mov	bx, si
		add	bx, 24h
		lea	di, [bp+var_514]

loc_2F9F7:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_2FA0C
		mov	eax, [si+4]
		cmp	eax, dword_77B7D
		jl	short loc_2FA0C
		or	dl, 1

loc_2FA0C:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_2FA25
		mov	eax, [bx+4]
		cmp	eax, dword_77B7D
		jl	short loc_2FA25
		or	dl, 2

loc_2FA25:
		mov	al, dl
		cmp	al, 1
		jl	loc_2FD42
		cmp	al, 2
		jz	loc_2FBB4
		jg	loc_2FD2E
		mov	eax, [si+4]
		cmp	eax, dword_77B7D
		jz	loc_2FD42
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_2FB94
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2FB94:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77B87
		jmp	loc_2FD42

loc_2FBB4:
		mov	eax, [bx+4]
		cmp	eax, dword_77B7D
		jz	loc_2FD2E
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_2FD11
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2FD11:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B87

loc_2FD2E:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77B87

loc_2FD42:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_2FD55
		lea	bx, word ptr [bp+var_2D4]

loc_2FD55:
		dec	[bp+var_516]
		jnz	loc_2F9F7
		cmp	word_77B87, 2
		jle	loc_30C12
		mov	ax, word_77B87
		mov	word_77B85, ax
		mov	[bp+var_516], ax
		mov	word_77B87, 0
		mov	eax, [bp+var_528]
		mov	dword_77B7D, eax
		lea	si, [bp+var_514]
		mov	bx, si
		add	bx, 24h
		lea	di, word ptr [bp+var_2D4]

loc_2FD8C:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_2FDA1
		mov	eax, [si+4]
		cmp	eax, dword_77B7D
		jg	short loc_2FDA1
		or	dl, 1

loc_2FDA1:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_2FDBA
		mov	eax, [bx+4]
		cmp	eax, dword_77B7D
		jg	short loc_2FDBA
		or	dl, 2

loc_2FDBA:
		mov	al, dl
		cmp	al, 1
		jl	loc_300D7
		cmp	al, 2
		jz	loc_2FF49
		jg	loc_300C3
		mov	eax, [si+4]
		cmp	eax, dword_77B7D
		jz	loc_300D7
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_2FF29
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_2FF29:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77B87
		jmp	loc_300D7

loc_2FF49:
		mov	eax, [bx+4]
		cmp	eax, dword_77B7D
		jz	loc_300C3
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77B7D
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_300A6
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_300A6:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B87

loc_300C3:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77B87

loc_300D7:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_300EA
		lea	bx, [bp+var_514]

loc_300EA:
		dec	[bp+var_516]
		jnz	loc_2FD8C
		cmp	word_77B87, 2
		jle	loc_30C12
		mov	ax, word_77B87
		mov	word_77B85, ax
		mov	[bp+var_516], ax
		mov	word_77B87, 0
		mov	eax, [bp+var_51C]
		mov	dword_77B7D, eax
		lea	si, word ptr [bp+var_2D4]
		mov	bx, si
		add	bx, 24h
		lea	di, [bp+var_514]

loc_30121:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_30135
		mov	eax, [si]
		cmp	eax, dword_77B7D
		jl	short loc_30135
		or	dl, 1

loc_30135:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_3014D
		mov	eax, [bx]
		cmp	eax, dword_77B7D
		jl	short loc_3014D
		or	dl, 2

loc_3014D:
		mov	al, dl
		cmp	al, 1
		jl	loc_30462
		cmp	al, 2
		jz	loc_302D8
		jg	loc_3044E
		mov	eax, [si]
		cmp	eax, dword_77B7D
		jz	loc_30462
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77B7D
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_302B8
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_302B8:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77B87
		jmp	loc_30462

loc_302D8:
		mov	eax, [bx]
		cmp	eax, dword_77B7D
		jz	loc_3044E
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77B7D
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_30431
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_30431:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B87

loc_3044E:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77B87

loc_30462:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_30475
		lea	bx, word ptr [bp+var_2D4]

loc_30475:
		dec	[bp+var_516]
		jnz	loc_30121
		cmp	word_77B87, 2
		jle	loc_30C12
		mov	ax, word_77B87
		mov	word_77B85, ax
		mov	[bp+var_516], ax
		mov	word_77B87, 0
		mov	eax, [bp+var_524]
		mov	dword_77B7D, eax
		lea	si, [bp+var_514]
		mov	bx, si
		add	bx, 24h
		lea	di, word ptr [bp+var_2D4]

loc_304AC:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_304C0
		mov	eax, [si]
		cmp	eax, dword_77B7D
		jg	short loc_304C0
		or	dl, 1

loc_304C0:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_304D8
		mov	eax, [bx]
		cmp	eax, dword_77B7D
		jg	short loc_304D8
		or	dl, 2

loc_304D8:
		mov	al, dl
		cmp	al, 1
		jl	loc_307ED
		cmp	al, 2
		jz	loc_30663
		jg	loc_307D9
		mov	eax, [si]
		cmp	eax, dword_77B7D
		jz	loc_307ED
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77B7D
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_30643
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_30643:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77B87
		jmp	loc_307ED

loc_30663:
		mov	eax, [bx]
		cmp	eax, dword_77B7D
		jz	loc_307D9
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77B7D
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77B78, 0
		jz	short loc_307BC
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_307BC:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77B87

loc_307D9:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77B87

loc_307ED:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_30800
		lea	bx, [bp+var_514]

loc_30800:
		dec	[bp+var_516]
		jnz	loc_304AC
		cmp	word_77B87, 2
		jle	loc_30C12
		mov	cx, word_77B87
		lea	si, word ptr [bp+var_2D4]

loc_30819:
		mov	di, [si+1Ch]
		or	di, di
		jz	short loc_3085D
		test	byte ptr gs:[di+10h], 40h
		jnz	short loc_3085D
		or	byte ptr gs:[di+10h], 40h
		mov	eax, [si]
		sar	eax, 8
		mov	gs:[di+0Ch], ax
		mov	eax, [si+4]
		sar	eax, 8
		mov	gs:[di+0Eh], ax
		mov	eax, [si+0Eh]
		mov	gs:[di], eax
		mov	eax, [si+12h]
		mov	gs:[di+4], eax
		mov	eax, [si+16h]
		mov	gs:[di+8], eax

loc_3085D:
		add	si, 24h
		loop	short loc_30819
		mov	ecx, [bp+var_288]
		sub	ecx, [bp+var_2AC]
		mov	eax, [bp+var_2B0]
		sub	eax, [bp+var_2D4]
		imul	ecx
		add	eax, 80h
		adc	edx, 0
		shrd	eax, edx, 8
		mov	ebx, eax
		mov	ecx, [bp+var_28C]
		sub	ecx, [bp+var_2B0]
		mov	eax, [bp+var_2AC]
		sub	eax, [bp+var_2D0]
		imul	ecx
		add	eax, 80h
		adc	edx, 0
		shrd	eax, edx, 8
		sub	ebx, eax
		js	loc_30C12
		mov	si, [bp+arg_0]
		mov	al, gs:[si]
		mov	byte_77B89, al
		lea	ax, word ptr [bp+var_28]
		lea	dx, word ptr [bp+var_2D4]
		push	di
		push	si
		push	cx
		push	es
		push	dx
		push	ax
		pop	di
		pop	si
		mov	cx, ds
		mov	es, cx
		mov	cx, 9
		rep movsd
		pop	es
		pop	cx
		pop	si
		pop	di
		cmp	byte_77B8A, 0
		jnz	short loc_3093F
		jmp	short loc_3093F
		push	0
		mov	eax, [bp+var_16]
		push	eax
		mov	ax, [bp+var_1C]
		xchg	al, ah
		xor	ah, ah
		push	ax
		mov	al, byte_77B89
		xor	ah, ah
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		mov	ah, al
		xor	al, al
		mov	[bp+var_1C], ax
		lea	si, word ptr [bp+var_2B0]
		push	0
		mov	eax, [si+12h]
		push	eax
		mov	ax, [si+0Ch]
		xchg	al, ah
		xor	ah, ah
		push	ax
		mov	al, byte_77B89
		xor	ah, ah
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		lea	si, word ptr [bp+var_2B0]
		mov	ah, al
		xor	al, al
		mov	[si+0Ch], ax

loc_3093F:
		mov	ax, word_77B87
		sub	ax, 2
		mov	[bp+var_516], ax
		les	di, word_77C16
		lea	si, word ptr [bp+var_2D4]
		movzx	ecx, si
		add	si, 24h
		mov	bx, si
		add	bx, 24h

loc_3095D:
		cmp	dword_77B78, 0
		jz	short loc_3096E
		cmp	byte_77B8A, 0
		jnz	short loc_3099E
		jmp	short loc_3099E

loc_3096E:
		push	bx
		push	si
		push	di
		push	es
		push	0
		mov	eax, [bx+12h]
		push	eax
		mov	ax, [bx+0Ch]
		xchg	al, ah
		xor	ah, ah
		push	ax
		mov	al, byte_77B89
		xor	ah, ah
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		pop	es
		pop	di
		pop	si
		pop	bx
		mov	ah, al
		xor	al, al
		mov	[bx+0Ch], ax

loc_3099E:
		mov	eax, [bp+var_4]
		mov	es:[di+2], eax
		mov	eax, 3
		mov	es:[di+14h], eax
		push	ecx
		push	edx
		mov	eax, [bp+var_28]
		sar	eax, 8
		mov	es:[di+18h], eax
		mov	eax, [bp+var_24]
		sar	eax, 8
		mov	es:[di+1Ch], eax
		movzx	eax, [bp+var_1C]
		shl	eax, 8
		xor	eax, eax
		mov	es:[di+20h], eax
		mov	eax, 40000000h
		xor	edx, edx
		mov	ecx, [bp+var_16]
		sar	ecx, 8
		idiv	ecx
		mov	es:[di+2Ch], eax
		mov	eax, [si]
		sar	eax, 8
		mov	es:[di+30h], eax
		mov	eax, [si+4]
		sar	eax, 8
		mov	es:[di+34h], eax
		movzx	eax, word ptr [si+0Ch]
		shl	eax, 8
		mov	es:[di+38h], eax
		mov	eax, 40000000h
		xor	edx, edx
		mov	ecx, [si+12h]
		sar	ecx, 8
		idiv	ecx
		mov	es:[di+44h], eax
		mov	eax, [bx]
		sar	eax, 8
		mov	es:[di+48h], eax
		mov	eax, [bx+4]
		sar	eax, 8
		mov	es:[di+4Ch], eax
		movzx	eax, word ptr [bx+0Ch]
		shl	eax, 8
		mov	es:[di+50h], eax
		mov	eax, 40000000h
		xor	edx, edx
		mov	ecx, [bx+12h]
		sar	ecx, 8
		idiv	ecx
		mov	es:[di+5Ch], eax
		pop	edx
		pop	ecx
		push	ebx
		push	es
		mov	bx, 1
		push	bx
		mov	ax, di
		add	ax, 18h
		push	es
		push	ax
		push	ss
		pop	ds
		call	sub_634A4
		add	sp, 6
		pop	es
		pop	ebx
		mov	es:[di+8], ax
		mov	es:[di+0Ah], dx
		mov	ax, 6
		mov	es:[di+6], ax
		mov	dx, 60h
		mov	ecx, dword_77B78
		cmp	ecx, 0
		jz	loc_30B92
		mov	es:[di+10h], ecx
		push	edx
		push	ecx
		movzx	eax, [bp+var_20]
		shl	eax, 10h
		mov	ecx, [bp+var_16]
		xor	edx, edx
		idiv	ecx
		mov	es:[di+24h], eax
		movzx	eax, [bp+var_1E]
		shl	eax, 10h
		mov	ecx, [bp+var_16]
		xor	edx, edx
		idiv	ecx
		mov	es:[di+28h], eax
		movzx	eax, word ptr [si+8]
		shl	eax, 10h
		mov	ecx, [si+12h]
		xor	edx, edx
		idiv	ecx
		mov	es:[di+3Ch], eax
		movzx	eax, word ptr [si+0Ah]
		shl	eax, 10h
		mov	ecx, [si+12h]
		xor	edx, edx
		idiv	ecx
		mov	es:[di+40h], eax
		movzx	eax, word ptr [bx+8]
		shl	eax, 10h
		mov	ecx, [bx+12h]
		xor	edx, edx
		idiv	ecx
		mov	es:[di+54h], eax
		movzx	eax, word ptr [bx+0Ah]
		shl	eax, 10h
		mov	ecx, [bx+12h]
		xor	edx, edx
		idiv	ecx
		mov	es:[di+58h], eax
		pop	edx
		pop	ecx
		push	ebx
		push	edx
		xor	edx, edx
		mov	eax, [bp+var_16]
		add	eax, [si+12h]
		adc	edx, 0
		add	eax, [bx+12h]
		adc	edx, 0
		mov	ebx, 3
		idiv	ebx
		pop	edx
		pop	ebx
		mov	eax, 0
		mov	es:[di+0Ch], eax
		mov	ax, 1
		mov	es:[di+6], ax
		mov	dx, 60h

loc_30B92:
		mov	cx, word_7CBC8
		cmp	cx, word_7CBC6
		jge	short loc_30BF7
		nop
		nop
		shl	cx, 2
		mov	ax, es
		shl	eax, 10h
		mov	ax, di
		lfs	di, word_7CBCA
		add	di, cx
		push	eax
		push	edx
		push	ecx
		push	ebx
		push	esi
		push	edi
		push	ds
		push	es
		push	fs
		push	gs
		mov	bx, 2
		push	bx
		push	eax
		push	ss
		pop	ds
		call	sub_634A4
		add	sp, 6
		pop	gs
		pop	fs
		pop	es
		pop	ds
		pop	edi
		pop	esi
		pop	ebx
		pop	ecx
		mov	fs:[di], ax
		mov	fs:[di+2], dx
		pop	edx
		pop	eax
		mov	di, ax
		inc	word_7CBC8
		add	dword_7CBDE, 4

loc_30BF7:
		add	di, dx
		cmp	di, word_77C1E
		jnb	short loc_30C0E
		nop
		nop
		mov	si, bx
		add	bx, 24h
		dec	[bp+var_516]
		jnz	loc_3095D
Render_FacePipeline_2EEB8		endp

; START OF FUNCTION CHUNK FOR Render_FacePipeline_2EEB8

loc_30C0E:
		db 89h, 3Eh
; END OF FUNCTION CHUNK FOR Render_FacePipeline_2EEB8
seg078		ends
