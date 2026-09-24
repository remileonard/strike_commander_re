seg069		segment	byte public 'CODE' use16
		assume cs:seg069
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,2623 lignes — la plus grosse fonction de toute la base à ce jour, dépassant
; Player_MainUpdate. Transforme les sommets d'un objet 3D en espace caméra (soustraction de la
; position caméra dword_7220A/E/212), calcule les codes de clipping (bounding box
; dword_6EB14/18) avec cache 'déjà transformé cette frame' (bit 0x80), traite les données par
; lots de 3 sommets. Candidat très fort pour la fonction principale du pipeline de rendu
; d'objet 3D (transform + clip + soumission au rasterizer) — le cœur du moteur de rendu du
; jeu. Bien trop volumineuse pour une passe rapide ; priorité absolue pour une session
; d'analyse dédiée.
; ==============================================================================================
Render_ObjectPipelineMain	proc far		; CODE XREF: Model_ResetTransformCache+11EP
					; Model_RenderWithSubcomponents+150P

var_534		= dword	ptr -534h
var_530		= dword	ptr -530h
var_52C		= dword	ptr -52Ch
var_528		= dword	ptr -528h
var_524		= dword	ptr -524h
var_520		= dword	ptr -520h
var_51C		= dword	ptr -51Ch
var_518		= word ptr -518h
var_516		= word ptr -516h
var_514		= word ptr -514h
var_2D4		= dword	ptr -2D4h
var_2D0		= dword	ptr -2D0h
var_2B0		= dword	ptr -2B0h
var_2AC		= dword	ptr -2ACh
var_28C		= dword	ptr -28Ch
var_288		= dword	ptr -288h
var_94		= word ptr -94h
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_4C		= word ptr -4Ch
var_44		= word ptr -44h
var_42		= word ptr -42h
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		enter	534h, 0
		push	si
		push	di
		push	ds
		lgs	si, [bp+arg_0]
		movzx	eax, word_7223E
		shl	eax, 8
		mov	[bp+var_51C], eax
		movzx	eax, word_72240
		shl	eax, 8
		mov	[bp+var_520], eax
		movzx	eax, word_72242
		shl	eax, 8
		mov	[bp+var_524], eax
		movzx	eax, word_72244
		shl	eax, 8
		mov	[bp+var_528], eax

loc_2FF29:
		mov	ax, word ptr dword_6EB08

loc_2FF2C:
		add	ax, 4Bh	; 'K'

loc_2FF2F:
		cmp	ax, word_6EB10

loc_2FF33:
		jnb	loc_31BB0

loc_2FF37:
		mov	ax, gs:[si+14h]

loc_2FF3B:
		mov	word_6EA08, ax
		xor	ax, ax
		mov	al, gs:[si+1Dh]
		mov	byte_6EA0A, al
		cmp	byte_6EA14, 0
		jnz	short loc_2FF58
		cmp	byte_6EA0A, 1
		jnz	short loc_2FF58
		jmp	loc_31BB0
; ���������������������������������������������������������������������������

loc_2FF58:				; CODE XREF: Render_ObjectPipelineMain+6Aj
					; Render_ObjectPipelineMain+71j
		mov	ch, 0FFh
		mov	cl, 0
		lea	di, [bp+var_94]

loc_2FF60:				; CODE XREF: Render_ObjectPipelineMain+182j
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
		jnz	short loc_2FFF4
		mov	eax, gs:[bx+11h]
		sub	eax, dword_7220A
		mov	[bp+var_534], eax
		mov	eax, gs:[bx+15h]
		sub	eax, dword_7220E
		mov	[bp+var_530], eax

loc_2FFA0:
		mov	eax, gs:[bx+19h]

loc_2FFA5:
		sub	eax, dword_72212
		mov	[bp+var_52C], eax

loc_2FFAF:
		push	cx
		push	bx
		mov	ax, 5166h

loc_2FFB4:
		push	ax
		lea	ax, [bp+var_534]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		pop	bx
		pop	cx
		mov	eax, [bp+var_534]
		mov	gs:[bx], eax
		mov	[di+0Eh], eax

loc_2FFD1:
		mov	eax, [bp+var_52C]
		mov	gs:[bx+8], eax

loc_2FFDB:
		mov	[di+16h], eax
		mov	eax, [bp+var_530]
		mov	gs:[bx+4], eax
		mov	[di+12h], eax
		or	byte ptr gs:[bx+10h], 80h
		jmp	short loc_3000E
; ���������������������������������������������������������������������������

loc_2FFF4:				; CODE XREF: Render_ObjectPipelineMain+9Ej
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax

loc_3000E:				; CODE XREF: Render_ObjectPipelineMain+110j
		mov	dl, 0
		cmp	eax, dword_6EB14
		jge	short loc_3001A
		or	dl, 1

loc_3001A:				; CODE XREF: Render_ObjectPipelineMain+133j
		cmp	eax, dword_6EB18
		jle	short loc_30024

loc_30021:
		or	dl, 2

loc_30024:				; CODE XREF: Render_ObjectPipelineMain+13Dj
		and	ch, dl
		mov	al, 0
		test	byte ptr gs:[bx+10h], 40h

loc_3002D:
		jz	short loc_3004C

loc_3002F:
		mov	ax, gs:[bx+0Ch]

loc_30033:
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4],	eax
		mov	al, 1

loc_3004C:				; CODE XREF: Render_ObjectPipelineMain:loc_3002Dj
		mov	[di+20h], al
		mov	[di+21h], al
		mov	ah, gs:[bx+1Dh]
		xor	al, al
		mov	[di+0Ch], ax
		add	di, 24h	; '$'
		add	cl, 2
		cmp	cl, 6
		jl	loc_2FF60
		cmp	ch, 0
		jnz	loc_31BB0
		mov	al, 0
		mov	ah, gs:[si+16h]
		mov	[bp+var_8C], ax
		mov	ah, gs:[si+17h]
		mov	[bp+var_8A], ax
		mov	ah, gs:[si+18h]
		mov	[bp+var_68], ax
		mov	ah, gs:[si+19h]
		mov	[bp+var_66], ax
		mov	ah, gs:[si+1Ah]
		mov	[bp+var_44], ax
		mov	ah, gs:[si+1Bh]
		mov	[bp+var_42], ax

loc_3009D:
		mov	word_6EA0F, 0
		mov	[bp+var_516], 0
		lea	ax, [bp+var_94]
		mov	[bp+var_518], ax
		lea	di, [bp+var_2D4]
		lea	si, [bp+var_4C]

loc_300B8:				; CODE XREF: Render_ObjectPipelineMain+4A6j
		mov	bx, [bp+var_516]
		mov	ax, [bp+var_518]
		mov	dx, si
		mov	si, word ptr [bp+arg_0]
		mov	cx, gs:[bx+si+7]
		mov	si, dx
		cmp	cx, 0
		jz	loc_301FC
		mov	bx, cx
		mov	dx, 0

loc_300D7:
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_301FC
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4],	eax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_3012E
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_30158
; ���������������������������������������������������������������������������

loc_3012E:				; CODE XREF: Render_ObjectPipelineMain+23Dj
		mov	eax, [si+0Eh]

loc_30132:
		sub	eax, [bx+0Eh]
		jz	short loc_30145
		mov	ecx, eax
		mov	eax, [di+0Eh]
		sub	eax, [bx+0Eh]
		jmp	short loc_30158
; ���������������������������������������������������������������������������

loc_30145:				; CODE XREF: Render_ObjectPipelineMain+254j
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		mov	ecx, eax
		mov	eax, [di+16h]
		sub	eax, [bx+16h]

loc_30158:				; CODE XREF: Render_ObjectPipelineMain+24Aj
					; Render_ObjectPipelineMain+261j
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		cmp	word_6EA08, 0
		jz	short loc_301B6
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx

loc_301A0:
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]

loc_301B3:
		mov	[di+0Ah], ax

loc_301B6:				; CODE XREF: Render_ObjectPipelineMain+28Cj
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]

loc_301C0:
		sub	eax, edx

loc_301C3:
		imul	ecx

loc_301C6:
		add	eax, 0
		adc	edx, 0

loc_301CE:
		shrd	eax, edx, 10h

loc_301D3:
		add	ax, [bx+0Ch]

loc_301D6:
		mov	[di+0Ch], ax

loc_301D9:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 1

loc_301E1:
		mov	word ptr [di+1Eh], 0

loc_301E6:
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA0F
		mov	dx, 1
		jmp	short loc_301FE
; ���������������������������������������������������������������������������

loc_301FC:				; CODE XREF: Render_ObjectPipelineMain+1ECj
					; Render_ObjectPipelineMain+1FAj
		mov	bx, ax

loc_301FE:				; CODE XREF: Render_ObjectPipelineMain+318j
		mov	si, bx
		mov	ax, [bp+var_518]
		add	ax, 24h	; '$'
		mov	bx, [bp+var_516]
		cmp	bx, 4
		jnz	short loc_30214
		lea	ax, [bp+var_94]

loc_30214:				; CODE XREF: Render_ObjectPipelineMain+32Cj
		push	si
		mov	si, word ptr [bp+arg_0]
		mov	cx, gs:[bx+si+0Dh]
		pop	si
		cmp	cx, 0
		jz	loc_30364
		mov	bx, cx
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_30364

loc_3022F:
		cmp	dl, 1

loc_30232:
		jz	short loc_3024B
		mov	dx, si

loc_30236:
		mov	si, [bp+var_518]
		push	es
		mov	cx, ds
		mov	es, cx
		assume es:seg339
		mov	cx, 12h
		rep movsw
		mov	si, dx
		pop	es
		assume es:nothing
		inc	word_6EA0F

loc_3024B:				; CODE XREF: Render_ObjectPipelineMain:loc_30232j
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4],	eax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_30299
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_302C3
; ���������������������������������������������������������������������������

loc_30299:				; CODE XREF: Render_ObjectPipelineMain+3A8j
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		jz	short loc_302B0

loc_302A3:
		mov	ecx, eax

loc_302A6:
		mov	eax, [di+0Eh]
		sub	eax, [bx+0Eh]

loc_302AE:
		jmp	short loc_302C3
; ���������������������������������������������������������������������������

loc_302B0:				; CODE XREF: Render_ObjectPipelineMain+3BFj
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		mov	ecx, eax
		mov	eax, [di+16h]

loc_302BF:
		sub	eax, [bx+16h]

loc_302C3:				; CODE XREF: Render_ObjectPipelineMain+3B5j
					; Render_ObjectPipelineMain:loc_302AEj
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx

loc_302D1:
		mov	ecx, eax

loc_302D4:
		cmp	word_6EA08, 0
		jz	short loc_30321
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_30321:				; CODE XREF: Render_ObjectPipelineMain+3F7j
		movzx	eax, word ptr [si+0Ch]

loc_30326:
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx

loc_3032E:
		imul	ecx

loc_30331:
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h

loc_3033E:
		add	ax, [bx+0Ch]

loc_30341:
		mov	[di+0Ch], ax
		mov	byte ptr [di+20h], 1

loc_30348:
		mov	byte ptr [di+21h], 1
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA0F
		jmp	short loc_30379
; ���������������������������������������������������������������������������

loc_30364:				; CODE XREF: Render_ObjectPipelineMain+33Ej
					; Render_ObjectPipelineMain+349j
		mov	dx, si
		mov	si, [bp+var_518]
		mov	cx, ds
		mov	es, cx
		assume es:seg339
		mov	cx, 12h
		rep movsw
		mov	si, dx
		inc	word_6EA0F

loc_30379:				; CODE XREF: Render_ObjectPipelineMain+480j
		add	[bp+var_518], 24h ; '$'
		add	[bp+var_516], 2
		cmp	[bp+var_516], 6
		jl	loc_300B8
		mov	word_6EA11, 0
		mov	ax, word_6EA0F
		mov	[bp+var_516], ax
		mov	eax, dword_6EB18
		mov	dword_6EA0B, eax
		lea	si, [bp+var_2D4]
		mov	bx, si
		add	bx, 24h	; '$'
		mov	di, bx
		add	di, 24h	; '$'
		mov	eax, [di+12h]
		mov	edx, [si+12h]
		cmp	eax, edx
		jge	short loc_303BF
		mov	eax, edx

loc_303BF:				; CODE XREF: Render_ObjectPipelineMain+4D8j
		mov	edx, [bx+12h]
		cmp	eax, edx
		jge	short loc_303CB
		mov	eax, edx

loc_303CB:				; CODE XREF: Render_ObjectPipelineMain+4E4j
		add	eax, 7D00h

loc_303D1:
		xor	cx, cx

loc_303D3:
		mov	cl, byte_6EA0A
		cmp	cx, 1
		jnz	short loc_303E2
		sub	eax, 1900h

loc_303E2:				; CODE XREF: Render_ObjectPipelineMain+4F8j
		cmp	cx, 2
		jnz	short loc_303ED
		sub	eax, 4B00h

loc_303ED:				; CODE XREF: Render_ObjectPipelineMain+503j
		mov	[bp+var_4], eax
		lea	di, [bp+var_514]

loc_303F5:				; CODE XREF: Render_ObjectPipelineMain+799j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_3040A
		mov	eax, [si+12h]
		cmp	eax, dword_6EA0B
		jg	short loc_3040A
		or	dl, 1

loc_3040A:				; CODE XREF: Render_ObjectPipelineMain+518j
					; Render_ObjectPipelineMain+523j
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_30423
		mov	eax, [bx+12h]
		cmp	eax, dword_6EA0B
		jg	short loc_30423

loc_30420:
		or	dl, 2

loc_30423:				; CODE XREF: Render_ObjectPipelineMain+531j
					; Render_ObjectPipelineMain+53Cj
		mov	al, dl
		cmp	al, 1
		jl	loc_30664
		cmp	al, 2
		jz	loc_30544
		jg	loc_30650
		mov	eax, [si+12h]

loc_30439:
		cmp	eax, dword_6EA0B
		jz	loc_30664

loc_30442:
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EA0B
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

loc_304B3:
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h

loc_304C4:
		adc	edx, 0

loc_304C8:
		shrd	eax, edx, 10h

loc_304CD:
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax

loc_304D3:
		cmp	word_6EA08, 0
		jz	short loc_30524
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]

loc_304E4:
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]

loc_30521:
		mov	[di+0Ah], ax

loc_30524:				; CODE XREF: Render_ObjectPipelineMain+5F6j
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax

loc_30532:
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'

loc_3053D:
		inc	word_6EA11
		jmp	loc_30664
; ���������������������������������������������������������������������������

loc_30544:				; CODE XREF: Render_ObjectPipelineMain+54Bj
		mov	eax, [bx+12h]
		cmp	eax, dword_6EA0B
		jz	loc_30650
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EA0B
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

loc_305A3:
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

loc_305D3:
		adc	edx, 0

loc_305D7:
		shrd	eax, edx, 10h

loc_305DC:
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EA08, 0
		jz	short loc_30633
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h

loc_30624:
		adc	edx, 0

loc_30628:
		shrd	eax, edx, 10h

loc_3062D:
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_30633:				; CODE XREF: Render_ObjectPipelineMain+705j
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax

loc_30641:
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA11

loc_30650:				; CODE XREF: Render_ObjectPipelineMain+54Fj
					; Render_ObjectPipelineMain+66Bj
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EA11

loc_30664:				; CODE XREF: Render_ObjectPipelineMain+545j
					; Render_ObjectPipelineMain+55Cj ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_30677
		lea	bx, [bp+var_2D4]

loc_30677:				; CODE XREF: Render_ObjectPipelineMain+78Fj
		dec	[bp+var_516]
		jnz	loc_303F5
		cmp	word_6EA11, 2
		jle	loc_31BB0
		mov	ax, word_6EA11
		mov	word_6EA0F, ax
		mov	[bp+var_516], ax
		mov	word_6EA11, 0
		mov	eax, dword_6EB14
		mov	dword_6EA0B, eax
		lea	si, [bp+var_514]

loc_306A4:
		mov	bx, si
		add	bx, 24h	; '$'
		lea	di, [bp+var_2D4]

loc_306AD:				; CODE XREF: Render_ObjectPipelineMain+A51j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_306C2
		mov	eax, [si+12h]
		cmp	eax, dword_6EA0B
		jl	short loc_306C2
		or	dl, 1

loc_306C2:				; CODE XREF: Render_ObjectPipelineMain+7D0j
					; Render_ObjectPipelineMain+7DBj
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_306DB
		mov	eax, [bx+12h]

loc_306D1:
		cmp	eax, dword_6EA0B
		jl	short loc_306DB
		or	dl, 2

loc_306DB:				; CODE XREF: Render_ObjectPipelineMain+7E9j
					; Render_ObjectPipelineMain+7F4j
		mov	al, dl
		cmp	al, 1
		jl	loc_3091C
		cmp	al, 2
		jz	loc_307FC
		jg	loc_30908
		mov	eax, [si+12h]
		cmp	eax, dword_6EA0B
		jz	loc_3091C
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EA0B
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
		cmp	word_6EA08, 0
		jz	short loc_307DC
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx

loc_307C4:
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_307DC:				; CODE XREF: Render_ObjectPipelineMain+8AEj
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EA11
		jmp	loc_3091C
; ���������������������������������������������������������������������������

loc_307FC:				; CODE XREF: Render_ObjectPipelineMain+803j
		mov	eax, [bx+12h]
		cmp	eax, dword_6EA0B
		jz	loc_30908
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EA0B
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax

loc_30831:
		mov	eax, [si+0Eh]

loc_30835:
		sub	eax, [bx+0Eh]

loc_30839:
		imul	ecx

loc_3083C:
		add	eax, 8000h

loc_30842:
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
		cmp	word_6EA08, 0
		jz	short loc_308EB
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]

loc_308C3:
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]

loc_308D0:
		sub	eax, edx

loc_308D3:
		imul	ecx

loc_308D6:
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_308EB:				; CODE XREF: Render_ObjectPipelineMain+9BDj
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA11

loc_30908:				; CODE XREF: Render_ObjectPipelineMain+807j
					; Render_ObjectPipelineMain+923j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EA11

loc_3091C:				; CODE XREF: Render_ObjectPipelineMain+7FDj
					; Render_ObjectPipelineMain+814j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'

loc_30922:
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_3092F
		lea	bx, [bp+var_514]

loc_3092F:				; CODE XREF: Render_ObjectPipelineMain+A47j
		dec	[bp+var_516]
		jnz	loc_306AD
		cmp	word_6EA11, 2
		jle	loc_31BB0
		mov	cx, word_6EA11
		lea	si, [bp+var_2D4]
		mov	bl, 0FFh

loc_3094A:				; CODE XREF: Render_ObjectPipelineMain+AE8j
		cmp	byte ptr [si+20h], 1
		jz	short loc_30993
		mov	eax, [si+0Eh]
		imul	dword_72202
		idiv	dword ptr [si+12h]
		mov	edx, eax
		mov	ax, word_721FE
		cwde
		shl	eax, 8
		add	eax, edx
		mov	[si], eax
		mov	eax, [si+16h]
		imul	dword_72206
		idiv	dword ptr [si+12h]
		mov	edx, eax
		mov	ax, word_72200
		cwde
		shl	eax, 8
		sub	eax, edx
		mov	[si+4],	eax
		mov	byte ptr [si+20h], 1

loc_30993:				; CODE XREF: Render_ObjectPipelineMain+A6Cj
		xor	dl, dl
		mov	eax, [si]
		cmp	eax, [bp+var_51C]
		jge	short loc_309A2
		or	dl, 1

loc_309A2:				; CODE XREF: Render_ObjectPipelineMain+ABBj
		cmp	eax, [bp+var_524]
		jle	short loc_309AC
		or	dl, 4

loc_309AC:				; CODE XREF: Render_ObjectPipelineMain+AC5j
		mov	eax, [si+4]
		cmp	eax, [bp+var_520]
		jge	short loc_309BA
		or	dl, 2

loc_309BA:				; CODE XREF: Render_ObjectPipelineMain+AD3j
		cmp	eax, [bp+var_528]
		jle	short loc_309C4
		or	dl, 8

loc_309C4:				; CODE XREF: Render_ObjectPipelineMain+ADDj
		and	bl, dl
		add	si, 24h	; '$'
		dec	cx
		jnz	loc_3094A
		cmp	bl, 0
		jnz	loc_31BB0
		mov	ax, word_6EA11
		mov	word_6EA0F, ax
		mov	[bp+var_516], ax

loc_309DF:
		mov	word_6EA11, 0

loc_309E5:
		mov	eax, [bp+var_520]
		mov	dword_6EA0B, eax
		lea	si, [bp+var_2D4]
		mov	bx, si
		add	bx, 24h	; '$'
		lea	di, [bp+var_514]

loc_309FB:				; CODE XREF: Render_ObjectPipelineMain+E79j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_30A10
		mov	eax, [si+4]
		cmp	eax, dword_6EA0B
		jl	short loc_30A10
		or	dl, 1

loc_30A10:				; CODE XREF: Render_ObjectPipelineMain+B1Ej
					; Render_ObjectPipelineMain+B29j
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_30A29
		mov	eax, [bx+4]
		cmp	eax, dword_6EA0B

loc_30A24:
		jl	short loc_30A29
		or	dl, 2

loc_30A29:				; CODE XREF: Render_ObjectPipelineMain+B37j
					; Render_ObjectPipelineMain:loc_30A24j
		mov	al, dl
		cmp	al, 1
		jl	loc_30D44

loc_30A31:
		cmp	al, 2
		jz	loc_30BB7
		jg	loc_30D30
		mov	eax, [si+4]

loc_30A3F:
		cmp	eax, dword_6EA0B

loc_30A44:
		jz	loc_30D44
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_6EA0B
		mov	[di+4],	eax
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

loc_30A81:
		shrd	eax, edx, 10h

loc_30A86:
		add	eax, [bx]
		mov	[di], eax

loc_30A8C:
		mov	eax, [bx+12h]

loc_30A90:
		sub	eax, [si+12h]

loc_30A94:
		imul	ecx

loc_30A97:
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

loc_30AD9:
		mov	[di+12h], eax
		mov	eax, [si+0Eh]

loc_30AE1:
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

loc_30B31:
		add	eax, 8000h

loc_30B37:
		adc	edx, 0

loc_30B3B:
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]

loc_30B43:
		mov	[di+0Ch], ax
		cmp	word_6EA08, 0
		jz	short loc_30B97
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx

loc_30B82:
		add	eax, 8000h
		adc	edx, 0

loc_30B8C:
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_30B97:				; CODE XREF: Render_ObjectPipelineMain+C69j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EA11
		jmp	loc_30D44
; ���������������������������������������������������������������������������

loc_30BB7:				; CODE XREF: Render_ObjectPipelineMain+B51j
		mov	eax, [bx+4]
		cmp	eax, dword_6EA0B
		jz	loc_30D30
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax

loc_30BCF:
		mov	eax, dword_6EA0B

loc_30BD3:
		mov	[di+4],	eax
		sub	eax, [bx+4]
		cdq

loc_30BDD:
		shld	edx, eax, 10h

loc_30BE2:
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

loc_30C83:
		imul	ecx
		add	eax, 8000h

loc_30C8C:
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
		cmp	word_6EA08, 0
		jz	short loc_30D13
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0

loc_30CE3:
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_30D13:				; CODE XREF: Render_ObjectPipelineMain+DE5j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA11

loc_30D30:				; CODE XREF: Render_ObjectPipelineMain+B55j
					; Render_ObjectPipelineMain+CDEj
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx

loc_30D40:
		inc	word_6EA11

loc_30D44:				; CODE XREF: Render_ObjectPipelineMain+B4Bj
					; Render_ObjectPipelineMain:loc_30A44j	...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_30D57
		lea	bx, [bp+var_2D4]

loc_30D57:				; CODE XREF: Render_ObjectPipelineMain+E6Fj
		dec	[bp+var_516]
		jnz	loc_309FB
		cmp	word_6EA11, 2
		jle	loc_31BB0
		mov	ax, word_6EA11
		mov	word_6EA0F, ax
		mov	[bp+var_516], ax
		mov	word_6EA11, 0
		mov	eax, [bp+var_528]
		mov	dword_6EA0B, eax
		lea	si, [bp+var_514]
		mov	bx, si
		add	bx, 24h	; '$'

loc_30D8A:
		lea	di, [bp+var_2D4]

loc_30D8E:				; CODE XREF: Render_ObjectPipelineMain+120Cj
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_30DA3
		mov	eax, [si+4]
		cmp	eax, dword_6EA0B
		jg	short loc_30DA3
		or	dl, 1

loc_30DA3:				; CODE XREF: Render_ObjectPipelineMain+EB1j
					; Render_ObjectPipelineMain+EBCj
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_30DBC
		mov	eax, [bx+4]
		cmp	eax, dword_6EA0B
		jg	short loc_30DBC
		or	dl, 2

loc_30DBC:				; CODE XREF: Render_ObjectPipelineMain+ECAj
					; Render_ObjectPipelineMain+ED5j
		mov	al, dl
		cmp	al, 1
		jl	loc_310D7
		cmp	al, 2
		jz	loc_30F4A
		jg	loc_310C3
		mov	eax, [si+4]
		cmp	eax, dword_6EA0B
		jz	loc_310D7
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_6EA0B
		mov	[di+4],	eax
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

loc_30E34:
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

loc_30E81:
		adc	edx, 0

loc_30E85:
		shrd	eax, edx, 10h

loc_30E8A:
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax

loc_30E92:
		mov	eax, [si+16h]

loc_30E96:
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

loc_30ECE:
		shrd	eax, edx, 10h

loc_30ED3:
		add	ax, [bx+0Ch]

loc_30ED6:
		mov	[di+0Ch], ax

loc_30ED9:
		cmp	word_6EA08, 0

loc_30EDE:
		jz	short loc_30F2A

loc_30EE0:
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_30F2A:				; CODE XREF: Render_ObjectPipelineMain:loc_30EDEj
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0

loc_30F32:
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EA11
		jmp	loc_310D7
; ���������������������������������������������������������������������������

loc_30F4A:				; CODE XREF: Render_ObjectPipelineMain+EE4j
		mov	eax, [bx+4]
		cmp	eax, dword_6EA0B
		jz	loc_310C3
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_6EA0B
		mov	[di+4],	eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax

loc_30F7F:
		mov	eax, [si]
		sub	eax, [bx]

loc_30F85:
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

loc_30FD0:
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
		cmp	word_6EA08, 0
		jz	short loc_310A6
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax

loc_31081:
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_310A6:				; CODE XREF: Render_ObjectPipelineMain+1178j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA11

loc_310C3:				; CODE XREF: Render_ObjectPipelineMain+EE8j
					; Render_ObjectPipelineMain+1071j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd

loc_310D1:
		mov	si, dx
		inc	word_6EA11

loc_310D7:				; CODE XREF: Render_ObjectPipelineMain+EDEj
					; Render_ObjectPipelineMain+EF5j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_516]

loc_310E1:
		cmp	ax, 2

loc_310E4:
		jnz	short loc_310EA
		lea	bx, [bp+var_514]

loc_310EA:				; CODE XREF: Render_ObjectPipelineMain:loc_310E4j
		dec	[bp+var_516]
		jnz	loc_30D8E
		cmp	word_6EA11, 2
		jle	loc_31BB0
		mov	ax, word_6EA11
		mov	word_6EA0F, ax
		mov	[bp+var_516], ax
		mov	word_6EA11, 0
		mov	eax, [bp+var_51C]
		mov	dword_6EA0B, eax
		lea	si, [bp+var_2D4]
		mov	bx, si
		add	bx, 24h	; '$'
		lea	di, [bp+var_514]

loc_31121:				; CODE XREF: Render_ObjectPipelineMain+1595j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_31135
		mov	eax, [si]
		cmp	eax, dword_6EA0B
		jl	short loc_31135
		or	dl, 1

loc_31135:				; CODE XREF: Render_ObjectPipelineMain+1244j
					; Render_ObjectPipelineMain+124Ej
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_3114D
		mov	eax, [bx]
		cmp	eax, dword_6EA0B
		jl	short loc_3114D
		or	dl, 2

loc_3114D:				; CODE XREF: Render_ObjectPipelineMain+125Cj
					; Render_ObjectPipelineMain+1266j
		mov	al, dl
		cmp	al, 1
		jl	loc_31460
		cmp	al, 2
		jz	loc_312D7
		jg	loc_3144C
		mov	eax, [si]
		cmp	eax, dword_6EA0B
		jz	loc_31460
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EA0B
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h

loc_31182:
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]

loc_31194:
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4],	eax
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

loc_311D4:
		imul	edx

loc_311D7:
		idiv	ecx
		mov	ecx, eax

loc_311DD:
		mov	eax, [si+12h]

loc_311E1:
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
		cmp	word_6EA08, 0
		jz	short loc_312B7
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h

loc_31283:
		adc	edx, 0

loc_31287:
		shrd	eax, edx, 10h

loc_3128C:
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_312B7:				; CODE XREF: Render_ObjectPipelineMain+1389j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EA11
		jmp	loc_31460
; ���������������������������������������������������������������������������

loc_312D7:				; CODE XREF: Render_ObjectPipelineMain+1275j
		mov	eax, [bx]
		cmp	eax, dword_6EA0B
		jz	loc_3144C
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EA0B
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
		mov	[di+4],	eax
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
		cmp	word_6EA08, 0

loc_313E3:
		jz	short loc_3142F
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_3142F:				; CODE XREF: Render_ObjectPipelineMain:loc_313E3j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA11

loc_3144C:				; CODE XREF: Render_ObjectPipelineMain+1279j
					; Render_ObjectPipelineMain+13FDj
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EA11

loc_31460:				; CODE XREF: Render_ObjectPipelineMain+126Fj
					; Render_ObjectPipelineMain+1285j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_31473
		lea	bx, [bp+var_2D4]

loc_31473:				; CODE XREF: Render_ObjectPipelineMain+158Bj
		dec	[bp+var_516]
		jnz	loc_31121
		cmp	word_6EA11, 2
		jle	loc_31BB0
		mov	ax, word_6EA11
		mov	word_6EA0F, ax
		mov	[bp+var_516], ax
		mov	word_6EA11, 0
		mov	eax, [bp+var_524]
		mov	dword_6EA0B, eax
		lea	si, [bp+var_514]
		mov	bx, si
		add	bx, 24h	; '$'
		lea	di, [bp+var_2D4]

loc_314AA:				; CODE XREF: Render_ObjectPipelineMain+191Ej
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_314BE
		mov	eax, [si]
		cmp	eax, dword_6EA0B
		jg	short loc_314BE
		or	dl, 1

loc_314BE:				; CODE XREF: Render_ObjectPipelineMain+15CDj
					; Render_ObjectPipelineMain+15D7j
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_314D6
		mov	eax, [bx]
		cmp	eax, dword_6EA0B
		jg	short loc_314D6

loc_314D3:
		or	dl, 2

loc_314D6:				; CODE XREF: Render_ObjectPipelineMain+15E5j
					; Render_ObjectPipelineMain+15EFj
		mov	al, dl
		cmp	al, 1
		jl	loc_317E9
		cmp	al, 2
		jz	loc_31660
		jg	loc_317D5
		mov	eax, [si]
		cmp	eax, dword_6EA0B
		jz	loc_317E9
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EA0B
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
		mov	[di+4],	eax
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

loc_3157E:
		add	eax, [bx+12h]

loc_31582:
		mov	[di+12h], eax

loc_31586:
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

loc_315D4:
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EA08, 0
		jz	short loc_31640
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_31640:				; CODE XREF: Render_ObjectPipelineMain+1712j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EA11
		jmp	loc_317E9
; ���������������������������������������������������������������������������

loc_31660:				; CODE XREF: Render_ObjectPipelineMain+15FEj
		mov	eax, [bx]
		cmp	eax, dword_6EA0B
		jz	loc_317D5
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EA0B
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax

loc_3168D:
		mov	eax, [si+4]

loc_31691:
		sub	eax, [bx+4]
		imul	ecx

loc_31698:
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4],	eax
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
		cmp	word_6EA08, 0
		jz	short loc_317B8
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0

loc_31788:
		shrd	eax, edx, 10h
		add	ax, [bx+8]

loc_31790:
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_317B8:				; CODE XREF: Render_ObjectPipelineMain+188Aj
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EA11

loc_317D5:				; CODE XREF: Render_ObjectPipelineMain+1602j
					; Render_ObjectPipelineMain+1786j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EA11

loc_317E9:				; CODE XREF: Render_ObjectPipelineMain+15F8j
					; Render_ObjectPipelineMain+160Ej ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_516]
		cmp	ax, 2
		jnz	short loc_317FC
		lea	bx, [bp+var_514]

loc_317FC:				; CODE XREF: Render_ObjectPipelineMain+1914j
		dec	[bp+var_516]
		jnz	loc_314AA
		cmp	word_6EA11, 2
		jle	loc_31BB0
		mov	cx, word_6EA11
		lea	si, [bp+var_2D4]

loc_31815:				; CODE XREF: Render_ObjectPipelineMain+1986j
		mov	di, [si+1Ch]
		or	di, di
		jz	short loc_31865
		test	byte ptr gs:[di+10h], 40h
		jnz	short loc_31865
		or	byte ptr gs:[di+10h], 40h
		mov	eax, [si]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	gs:[di+0Ch], ax
		mov	eax, [si+4]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	gs:[di+0Eh], ax
		mov	eax, [si+0Eh]
		mov	gs:[di], eax
		mov	eax, [si+12h]
		mov	gs:[di+4], eax
		mov	eax, [si+16h]
		mov	gs:[di+8], eax

loc_31865:				; CODE XREF: Render_ObjectPipelineMain+1938j
					; Render_ObjectPipelineMain+193Fj
		add	si, 24h	; '$'
		loop	loc_31815
		mov	ecx, [bp+var_288]
		sub	ecx, [bp+var_2AC]
		mov	eax, [bp+var_2B0]
		sub	eax, [bp+var_2D4]
		imul	ecx

loc_31881:
		add	eax, 80h ; '�'
		adc	edx, 0

loc_3188B:
		shrd	eax, edx, 8

loc_31890:
		mov	ebx, eax

loc_31893:
		mov	ecx, [bp+var_28C]
		sub	ecx, [bp+var_2B0]
		mov	eax, [bp+var_2AC]
		sub	eax, [bp+var_2D0]
		imul	ecx
		add	eax, 80h ; '�'
		adc	edx, 0
		shrd	eax, edx, 8
		sub	ebx, eax
		js	loc_31BB0
		mov	si, word ptr [bp+arg_0]
		mov	al, gs:[si]
		mov	byte_6EA13, al
		mov	cx, 12h
		lea	di, [bp+var_28]
		lea	si, [bp+var_2D4]
		mov	ax, ds
		mov	es, ax
		rep movsw
		cmp	word_6EA08, 0
		jz	short loc_318E7
		cmp	byte_6EA14, 0
		jnz	short loc_3193F

loc_318E7:				; CODE XREF: Render_ObjectPipelineMain+19FCj
		push	0
		mov	eax, [bp+var_16]
		push	eax
		mov	ax, [bp+var_1C]
		xchg	ah, al
		xor	ah, ah
		push	ax
		mov	al, byte_6EA13
		xor	ah, ah
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	ah, al
		xor	al, al
		mov	[bp+var_1C], ax
		lea	si, [bp+var_2B0]
		push	0
		mov	eax, [si+12h]
		push	eax
		mov	ax, [si+0Ch]
		xchg	ah, al
		xor	ah, ah
		push	ax
		mov	al, byte_6EA13
		xor	ah, ah
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		lea	si, [bp+var_2B0]
		mov	ah, al
		xor	al, al
		mov	[si+0Ch], ax

loc_3193F:				; CODE XREF: Render_ObjectPipelineMain+1A03j
		mov	ax, word_6EA11
		sub	ax, 2
		mov	[bp+var_516], ax
		les	di, dword_6EB08
		assume es:nothing
		mov	bx, si
		add	bx, 24h	; '$'

loc_31952:				; CODE XREF: Render_ObjectPipelineMain+1CC6j
		cmp	word_6EA08, 0
		jz	short loc_31960
		cmp	byte_6EA14, 0
		jnz	short loc_31990

loc_31960:				; CODE XREF: Render_ObjectPipelineMain+1A75j
		push	bx
		push	si
		push	di
		push	es
		push	0
		mov	eax, [bx+12h]
		push	eax
		mov	ax, [bx+0Ch]
		xchg	ah, al
		xor	ah, ah
		push	ax
		mov	al, byte_6EA13
		xor	ah, ah
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		pop	es
		pop	di
		pop	si
		pop	bx
		mov	ah, al
		xor	al, al
		mov	[bx+0Ch], ax

loc_31990:				; CODE XREF: Render_ObjectPipelineMain+1A7Cj
		mov	eax, [bp+var_4]
		mov	es:[di+2], eax
		mov	eax, [bp+var_28]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+6], ax
		mov	eax, [bp+var_24]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+8], ax
		mov	ax, [bp+var_1C]
		mov	es:[di+0Ah], ax
		mov	eax, [si]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+0Ch], ax
		mov	eax, [si+4]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+0Eh], ax
		mov	ax, [si+0Ch]
		mov	es:[di+10h], ax
		mov	eax, [bx]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+12h], ax
		mov	eax, [bx+4]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+14h], ax
		mov	ax, [bx+0Ch]
		mov	es:[di+16h], ax
		mov	ax, word_726EE
		mov	dx, 18h
		cmp	byte_6EA14, 0
		jz	loc_31B6E
		mov	cx, word_6EA08
		cmp	cx, 0
		jz	loc_31B6E
		mov	es:[di+48h], cx
		mov	ax, [bp+var_20]
		mov	es:[di+18h], ax
		mov	ax, [bp+var_1E]
		mov	es:[di+1Ah], ax
		mov	eax, [bp+var_1A]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+1Ch], eax
		mov	eax, [bp+var_16]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+20h], eax
		mov	eax, [bp+var_12]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+24h], eax
		mov	ax, [si+8]

loc_31A80:
		mov	es:[di+28h], ax

loc_31A84:
		mov	ax, [si+0Ah]
		mov	es:[di+2Ah], ax

loc_31A8B:
		mov	eax, [si+0Eh]

loc_31A8F:
		add	eax, 80h ; '�'

loc_31A95:
		sar	eax, 8
		mov	es:[di+2Ch], eax
		mov	eax, [si+12h]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+30h], eax
		mov	eax, [si+16h]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+34h], eax
		mov	ax, [bx+8]
		mov	es:[di+38h], ax
		mov	ax, [bx+0Ah]
		mov	es:[di+3Ah], ax
		mov	eax, [bx+0Eh]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+3Ch], eax
		mov	eax, [bx+12h]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+40h], eax
		mov	eax, [bx+16h]
		add	eax, 80h ; '�'
		sar	eax, 8
		mov	es:[di+44h], eax
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
		push	bx
		push	si
		push	di
		push	es
		push	eax
		push	541Ah
		call	Texture_ResolveMipCached
		add	sp, 6
		pop	es
		pop	di
		pop	si
		pop	bx
		shl	edx, 10h
		mov	dx, ax
		mov	ax, word_7251C
		cwde
		imul	edx
		add	eax, dword_72538
		mov	cx, word_72532
		sar	eax, cl
		mov	al, 0
		mov	es:[di+4Ah], al
		mov	ax, word_72552
		mov	dx, 4Bh	; 'K'

loc_31B6E:				; CODE XREF: Render_ObjectPipelineMain+1B41j
					; Render_ObjectPipelineMain+1B4Cj
		mov	es:[di], ax
		mov	cx, word_724AC
		cmp	cx, word_724AA
		jge	short loc_31B97
		shl	cx, 2
		mov	ax, es

loc_31B80:
		shl	eax, 10h
		mov	ax, di

loc_31B86:
		lfs	di, dword_724AE
		add	di, cx

loc_31B8D:
		mov	fs:[di], eax
		mov	di, ax

loc_31B93:
		inc	word_724AC

loc_31B97:				; CODE XREF: Render_ObjectPipelineMain+1C97j
		add	di, dx
		cmp	di, word_6EB10
		jnb	short loc_31BAC
		mov	si, bx
		add	bx, 24h	; '$'
		dec	[bp+var_516]
		jnz	loc_31952

loc_31BAC:				; CODE XREF: Render_ObjectPipelineMain+1CBBj
		mov	word ptr dword_6EB08, di

loc_31BB0:				; CODE XREF: Render_ObjectPipelineMain:loc_2FF33j
					; Render_ObjectPipelineMain+73j ...
		pop	ds
		pop	di
		pop	si
		leave
		retf
Render_ObjectPipelineMain	endp

seg069		ends
