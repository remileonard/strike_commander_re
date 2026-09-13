seg046		segment	byte public 'CODE' use16
		assume cs:seg046
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near,75L — échantillonne une texture (dword_6E30C base, word_6E310 stride) selon un pas
; Bresenham (delta X/Y, remplissage ligne par ligne d'un buffer di) : primitive
; d'échantillonnage de texture pour le rasterizer de triangles (texture mapping).
; ==============================================================================================
Render_SampleTexture	proc near		; CODE XREF: seg046:00A2p seg046:024Dp ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4

		enter	8, 0
		push	ax
		push	dx
		les	si, dword_6E30C
		add	si, ax
		mov	ax, word_6E310
		mul	bx
		add	si, ax
		pop	dx
		sub	dx, bx
		mov	bx, dx
		mov	dx, word_6E310
		jns	short loc_25E1C
		neg	dx
		neg	bx

loc_25E1C:				; CODE XREF: Render_SampleTexture+1Cj
		inc	bx
		pop	ax
		sub	cx, ax
		mov	ax, cx
		mov	cx, 1
		jns	short loc_25E2B
		neg	cx
		neg	ax

loc_25E2B:				; CODE XREF: Render_SampleTexture+2Bj
		inc	ax
		cmp	ax, bx
		jle	short loc_25E33
		xchg	ax, bx
		xchg	cx, dx

loc_25E33:				; CODE XREF: Render_SampleTexture+34j
		mov	[bp+var_4], bx
		mov	[bp+var_6], cx
		mov	[bp+var_8], dx
		mov	cx, bx
		mov	dx, bx
		mov	bx, ax
		push	di
		and	cx, 0FFh
		or	cx, cx
		jz	short loc_25E63

loc_25E4B:				; CODE XREF: Render_SampleTexture+5Fj
					; Render_SampleTexture+67j
		mov	al, es:[si]
		mov	[di], al
		inc	di
		dec	cx
		jz	short loc_25E63

loc_25E54:
		add	si, [bp+var_8]
		sub	dx, bx
		jg	short loc_25E4B
		add	dx, [bp+var_4]
		add	si, [bp+var_6]
		jmp	short loc_25E4B
; ���������������������������������������������������������������������������

loc_25E63:				; CODE XREF: Render_SampleTexture+4Fj
					; Render_SampleTexture+58j
		pop	bx
		sub	di, bx
		leave
		retn
Render_SampleTexture	endp

; ���������������������������������������������������������������������������
		enter	162h, 0
		push	si
		push	di
		mov	ax, word_6E32E
		sub	ax, word_6E326
		jge	short loc_25E7A
		jmp	loc_25FFE
; ���������������������������������������������������������������������������

loc_25E7A:				; CODE XREF: seg046:0085j
		inc	ax
		mov	[bp-162h], ax
		mov	ax, word_6E32A
		mov	bx, word_6E32C
		mov	cx, word_6E332
		mov	dx, word_6E334
		lea	di, [bp-15Eh]
		call	Render_SampleTexture
		mov	[bp-160h], di
		lea	di, [bp-1Eh]
		movzx	ecx, word ptr [bp-162h]
		movzx	eax, word ptr [bp-160h]
		xor	edx, edx
		dec	eax
		shl	eax, 10h
		div	ecx

loc_25EB4:
		mov	ecx, eax
		les	si, off_6E308
		mov	bx, word_6E324
		shl	bx, 1
		add	si, bx
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4],	eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8],	eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_6E324
		cmp	bx, 100h
		jl	short loc_25F27
		jmp	loc_25FFE
; ���������������������������������������������������������������������������

loc_25F27:				; CODE XREF: seg046:0132j
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]
		movzx	ecx, word ptr [bp-162h]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	ax, [bp-162h]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax

loc_25F54:
		mov	[di], eax
		mov	[di+14h], ax
		mov	di, word_6E328
		shl	di, 1

loc_25F60:
		add	di, word_6E316
		mov	di, [di]

loc_25F66:
		add	di, word_6E326

loc_25F6A:
		mov	es, word_6E314
		assume es:seg000

loc_25F6E:
		lea	si, [bp-1Eh]

loc_25F71:
		lea	bx, [bp-15Eh]
		push	bp

loc_25F76:
		push	word ptr [bp-162h]
		mov	dx, [si+6]
		mov	ah, [si+16h]
		or	ah, ah
		jle	short loc_25F99
		mov	bp, [si+4]

loc_25F87:				; CODE XREF: seg046:01A7j
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_25F90
		mov	es:[di], al

loc_25F90:				; CODE XREF: seg046:019Bj
		inc	di
		add	cx, bp

loc_25F93:
		adc	bx, dx
		dec	ah
		jnz	short loc_25F87

loc_25F99:				; CODE XREF: seg046:0192j
		mov	dx, [si+0Ah]
		mov	ax, [si+18h]
		sub	ax, [si+16h]
		jle	short loc_25FBB
		mov	ah, al
		mov	bp, [si+4]

loc_25FA9:				; CODE XREF: seg046:01C9j
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_25FB2
		mov	es:[di], al

loc_25FB2:				; CODE XREF: seg046:01BDj
		inc	di

loc_25FB3:
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_25FA9

loc_25FBB:				; CODE XREF: seg046:01B2j
		mov	dx, [si+0Eh]
		mov	ax, [si+1Ah]
		sub	ax, [si+18h]
		jle	short loc_25FDD
		mov	ah, al
		mov	bp, [si+0Ch]

loc_25FCB:				; CODE XREF: seg046:loc_25FDBj
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_25FD4

loc_25FD1:
		mov	es:[di], al

loc_25FD4:				; CODE XREF: seg046:01DFj
		inc	di

loc_25FD5:
		add	cx, bp
		adc	bx, dx
		dec	ah

loc_25FDB:
		jnz	short loc_25FCB

loc_25FDD:				; CODE XREF: seg046:01D4j
		mov	dx, [si+12h]

loc_25FE0:
		pop	ax

loc_25FE1:
		sub	ax, [si+1Ah]

loc_25FE4:
		jle	short loc_25FFD

loc_25FE6:
		mov	ah, al
		mov	bp, [si+10h]

loc_25FEB:				; CODE XREF: seg046:020Bj
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_25FF4
		mov	es:[di], al

loc_25FF4:				; CODE XREF: seg046:01FFj
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_25FEB

loc_25FFD:				; CODE XREF: seg046:loc_25FE4j
		pop	bp

loc_25FFE:				; CODE XREF: seg046:0087j seg046:0134j
		pop	di
		pop	si
		leave
		retn
; ���������������������������������������������������������������������������
		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_6E326
		cmp	ax, word_6E31C
		jg	short loc_2601B
		mov	cx, word_6E32E
		cmp	cx, word_6E318
		jge	short loc_2601E

loc_2601B:				; CODE XREF: seg046:021Fj
		jmp	loc_26298
; ���������������������������������������������������������������������������

loc_2601E:				; CODE XREF: seg046:0229j
		mov	ax, word_6E32E
		sub	ax, word_6E326
		inc	ax
		mov	[bp-166h], ax
		mov	ax, word_6E32A
		mov	bx, word_6E32C
		mov	cx, word_6E332
		mov	dx, word_6E334
		lea	di, [bp-162h]
		call	Render_SampleTexture
		mov	[bp-164h], di
		lea	di, [bp-1Eh]
		movzx	ecx, word ptr [bp-166h]
		movzx	eax, word ptr [bp-164h]
		xor	edx, edx
		dec	eax
		shl	eax, 10h
		div	ecx
		mov	ecx, eax
		les	si, off_6E308
		assume es:nothing

loc_26066:
		mov	bx, word_6E324
		shl	bx, 1
		add	si, bx

loc_2606E:
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4],	eax

loc_26082:
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8],	eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_6E324
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]
		movzx	ecx, word ptr [bp-166h]

loc_260D7:
		mul	ecx
		shr	eax, 0Ch

loc_260DE:
		mov	[di+18h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	ax, [bp-166h]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax
		mov	[di], eax
		mov	[di+14h], ax
		lea	si, [bp-1Eh]
		mov	ax, [si+16h]
		mov	bx, [si+18h]
		mov	cx, [si+1Ah]
		mov	dx, [bp-166h]
		sub	dx, cx
		mov	[bp-16Eh], dx
		sub	cx, bx
		mov	[bp-16Ch], cx
		sub	bx, ax
		mov	[bp-16Ah], bx
		mov	[bp-168h], ax
		mov	ax, word_6E318
		sub	ax, word_6E326
		jle	short loc_261A7
		add	word_6E326, ax
		movsx	ebx, ax
		movzx	ecx, word ptr [bp-168h]
		cmp	ebx, ecx
		jg	short loc_26141
		mov	ecx, ebx

loc_26141:				; CODE XREF: seg046:034Cj
		mov	eax, [si+4]
		imul	ecx
		add	[si], eax
		sub	[bp-168h], cx
		sub	ebx, ecx
		jle	short loc_261A7
		movzx	ecx, word ptr [bp-16Ah]
		cmp	ebx, ecx
		jg	short loc_26162
		mov	ecx, ebx

loc_26162:				; CODE XREF: seg046:036Dj
		mov	eax, [si+8]
		imul	ecx
		add	[si], eax

loc_2616C:
		sub	[bp-16Ah], cx
		sub	ebx, ecx
		jle	short loc_261A7
		movzx	ecx, word ptr [bp-16Ch]
		cmp	ebx, ecx
		jg	short loc_26183
		mov	ecx, ebx

loc_26183:				; CODE XREF: seg046:038Ej
		mov	eax, [si+0Ch]
		imul	ecx
		add	[si], eax
		sub	[bp-16Ch], cx
		sub	ebx, ecx
		jle	short loc_261A7
		mov	ecx, ebx
		mov	eax, [si+10h]
		imul	ecx
		add	[si], eax
		sub	[bp-16Eh], cx

loc_261A7:				; CODE XREF: seg046:0339j seg046:0362j ...
		mov	ax, word_6E32E
		sub	ax, word_6E31C
		jle	short loc_261EA
		mov	cx, [bp-16Eh]
		cmp	ax, cx
		jg	short loc_261BA
		mov	cx, ax

loc_261BA:				; CODE XREF: seg046:03C6j
		sub	[bp-16Eh], cx
		sub	ax, cx
		jle	short loc_261EA
		mov	cx, [bp-16Ch]
		cmp	ax, cx
		jg	short loc_261CC
		mov	cx, ax

loc_261CC:				; CODE XREF: seg046:03D8j
		sub	[bp-16Ch], cx
		sub	ax, cx

loc_261D2:
		jle	short loc_261EA
		mov	cx, [bp-16Ah]
		cmp	ax, cx
		jg	short loc_261DE

loc_261DC:
		mov	cx, ax

loc_261DE:				; CODE XREF: seg046:03EAj
		sub	[bp-16Ah], cx
		sub	ax, cx
		jle	short loc_261EA
		sub	[bp-168h], ax

loc_261EA:				; CODE XREF: seg046:03BEj seg046:03D0j ...
		mov	di, word_6E328
		shl	di, 1
		add	di, word_6E316
		mov	di, [di]
		add	di, word_6E326
		mov	es, word_6E314
		assume es:seg000
		lea	bx, [bp-1Eh]
		lea	si, [bp-162h]
		mov	cx, [bx]
		add	si, [bx+2]
		push	bp
		push	word ptr [bp-16Eh]
		push	word ptr [bp-16Ch]
		push	word ptr [bp-16Ah]
		push	word ptr [bp-168h]
		mov	dx, [bx+6]
		pop	ax
		or	ax, ax
		jle	short loc_2623A
		mov	ah, al
		mov	bp, [bx+4]

loc_26228:				; CODE XREF: seg046:0448j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_26231
		mov	es:[di], al

loc_26231:				; CODE XREF: seg046:043Cj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_26228

loc_2623A:				; CODE XREF: seg046:0431j
		mov	dx, [bx+0Ah]
		pop	ax
		or	ax, ax
		jle	short loc_26259
		mov	ah, al
		mov	bp, [bx+8]

loc_26247:				; CODE XREF: seg046:0467j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_26250
		mov	es:[di], al

loc_26250:				; CODE XREF: seg046:045Bj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_26247

loc_26259:				; CODE XREF: seg046:0450j
		mov	dx, [bx+0Eh]
		pop	ax
		or	ax, ax
		jle	short loc_26278
		mov	ah, al
		mov	bp, [bx+0Ch]

loc_26266:				; CODE XREF: seg046:0486j
		mov	al, [si]
		cmp	al, 0FFh

loc_2626A:
		jz	short loc_2626F
		mov	es:[di], al

loc_2626F:				; CODE XREF: seg046:loc_2626Aj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_26266

loc_26278:				; CODE XREF: seg046:046Fj
		mov	dx, [bx+12h]
		pop	ax
		or	ax, ax
		jle	short loc_26297
		mov	ah, al
		mov	bp, [bx+10h]

loc_26285:				; CODE XREF: seg046:04A5j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_2628E
		mov	es:[di], al

loc_2628E:				; CODE XREF: seg046:0499j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_26285

loc_26297:				; CODE XREF: seg046:048Ej
		pop	bp

loc_26298:				; CODE XREF: seg046:loc_2601Bj
		pop	di
		pop	si
		leave
		retn
; ���������������������������������������������������������������������������
		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_6E32E
		sub	ax, word_6E326
		jge	short loc_262AE
		jmp	loc_26477
; ���������������������������������������������������������������������������

loc_262AE:				; CODE XREF: seg046:04B9j
		inc	ax
		mov	[bp-166h], ax
		mov	ax, word_6E32A
		mov	bx, word_6E32C
		mov	cx, word_6E332
		mov	dx, word_6E334
		lea	di, [bp-162h]
		call	Render_SampleTexture
		mov	[bp-164h], di
		lea	di, [bp-1Eh]
		movzx	ecx, word ptr [bp-166h]

loc_262D6:
		movzx	eax, word ptr [bp-164h]
		xor	edx, edx
		dec	eax
		shl	eax, 10h
		div	ecx
		mov	ecx, eax
		les	si, off_6E308
		assume es:nothing
		mov	bx, word_6E324
		shl	bx, 1
		add	si, bx
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4],	eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8],	eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_6E324
		cmp	bx, 100h
		jl	short loc_2635B
		jmp	loc_26477
; ���������������������������������������������������������������������������

loc_2635B:				; CODE XREF: seg046:0566j
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]

loc_26363:
		movzx	ecx, word ptr [bp-166h]

loc_26369:
		mul	ecx
		shr	eax, 0Ch

loc_26370:
		mov	[di+18h], ax
		mov	cx, ax

loc_26375:
		shr	ax, 1

loc_26377:
		mov	[di+16h], ax
		mov	ax, [bp-166h]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax
		mov	[di], eax
		mov	[di+14h], ax
		lea	si, [bp-1Eh]
		mov	ax, [si+16h]
		mov	bx, [si+18h]
		mov	cx, [si+1Ah]
		mov	dx, [bp-166h]
		sub	dx, cx
		mov	[bp-16Eh], dx
		sub	cx, bx
		mov	[bp-16Ch], cx
		sub	bx, ax
		mov	[bp-16Ah], bx
		mov	[bp-168h], ax
		push	bp
		push	dx
		push	cx
		push	bx
		push	ax
		mov	di, word_6E328
		shl	di, 1
		add	di, word_6E316
		mov	di, [di]
		add	di, word_6E326
		mov	es, word_6E314
		assume es:seg000
		lea	bx, [bp-1Eh]
		lea	si, [bp-162h]

loc_263D4:
		xor	cx, cx
		pop	ax

loc_263D7:
		or	ax, ax

loc_263D9:
		jle	short loc_263FE
		mov	ah, al
		mov	bp, [bx+4]

loc_263E0:
		mov	dx, [bx+6]
		push	bx

loc_263E4:
		lfs	bx, dword_6E320

loc_263E9:				; CODE XREF: seg046:060Bj
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_263F4
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_263F4:				; CODE XREF: seg046:05FDj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_263E9
		pop	bx

loc_263FE:				; CODE XREF: seg046:loc_263D9j
		pop	ax
		or	ax, ax
		jle	short loc_26426
		mov	ah, al
		mov	bp, [bx+8]
		mov	dx, [bx+0Ah]
		push	bx
		lfs	bx, dword_6E320

loc_26411:				; CODE XREF: seg046:0633j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_2641C
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_2641C:				; CODE XREF: seg046:0625j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_26411
		pop	bx

loc_26426:				; CODE XREF: seg046:0611j
		pop	ax
		or	ax, ax
		jle	short loc_2644E
		mov	ah, al
		mov	bp, [bx+0Ch]
		mov	dx, [bx+0Eh]
		push	bx
		lfs	bx, dword_6E320

loc_26439:				; CODE XREF: seg046:065Bj
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_26444
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_26444:				; CODE XREF: seg046:064Dj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_26439
		pop	bx

loc_2644E:				; CODE XREF: seg046:0639j
		pop	ax
		or	ax, ax
		jle	short loc_26476
		mov	ah, al
		mov	bp, [bx+10h]
		mov	dx, [bx+12h]
		push	bx
		lfs	bx, dword_6E320

loc_26461:				; CODE XREF: seg046:0683j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_2646C

loc_26467:
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_2646C:				; CODE XREF: seg046:0675j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_26461
		pop	bx

loc_26476:				; CODE XREF: seg046:0661j
		pop	bp

loc_26477:				; CODE XREF: seg046:04BBj seg046:0568j
		pop	di
		pop	si
		leave
		retn
; ���������������������������������������������������������������������������
		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_6E326
		cmp	ax, word_6E31C
		jg	short loc_26494
		mov	cx, word_6E32E
		cmp	cx, word_6E318
		jge	short loc_26497

loc_26494:				; CODE XREF: seg046:0698j
		jmp	loc_26735
; ���������������������������������������������������������������������������

loc_26497:				; CODE XREF: seg046:06A2j
		mov	ax, word_6E32E
		sub	ax, word_6E326
		inc	ax
		mov	[bp-166h], ax
		mov	ax, word_6E32A
		mov	bx, word_6E32C
		mov	cx, word_6E332
		mov	dx, word_6E334
		lea	di, [bp-162h]
		call	Render_SampleTexture
		mov	[bp-164h], di
		lea	di, [bp-1Eh]
		movzx	ecx, word ptr [bp-166h]
		movzx	eax, word ptr [bp-164h]
		xor	edx, edx
		dec	eax

loc_264D1:
		shl	eax, 10h

loc_264D5:
		div	ecx
		mov	ecx, eax
		les	si, off_6E308
		assume es:nothing
		mov	bx, word_6E324
		shl	bx, 1
		add	si, bx
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4],	eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8],	eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_6E324
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]
		movzx	ecx, word ptr [bp-166h]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax

loc_26561:
		mov	ax, [bp-166h]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax
		mov	[di], eax
		mov	[di+14h], ax
		lea	si, [bp-1Eh]
		mov	ax, [si+16h]
		mov	bx, [si+18h]
		mov	cx, [si+1Ah]
		mov	dx, [bp-166h]
		sub	dx, cx
		mov	[bp-16Eh], dx
		sub	cx, bx
		mov	[bp-16Ch], cx
		sub	bx, ax
		mov	[bp-16Ah], bx
		mov	[bp-168h], ax
		mov	ax, word_6E318
		sub	ax, word_6E326
		jle	short loc_26620
		add	word_6E326, ax
		movzx	ebx, ax
		movzx	ecx, word ptr [bp-168h]
		cmp	ebx, ecx
		jg	short loc_265BA
		mov	ecx, ebx

loc_265BA:				; CODE XREF: seg046:07C5j
		mov	eax, [si+4]
		imul	ecx
		add	[si], eax
		sub	[bp-168h], cx
		sub	ebx, ecx
		jle	short loc_26620

loc_265CD:
		movzx	ecx, word ptr [bp-16Ah]
		cmp	ebx, ecx
		jg	short loc_265DB
		mov	ecx, ebx

loc_265DB:				; CODE XREF: seg046:07E6j
		mov	eax, [si+8]
		imul	ecx
		add	[si], eax
		sub	[bp-16Ah], cx
		sub	ebx, ecx
		jle	short loc_26620
		movzx	ecx, word ptr [bp-16Ch]
		cmp	ebx, ecx
		jg	short loc_265FC
		mov	ecx, ebx

loc_265FC:				; CODE XREF: seg046:0807j
		mov	eax, [si+0Ch]
		imul	ecx
		add	[si], eax
		sub	[bp-16Ch], cx
		sub	ebx, ecx
		jle	short loc_26620
		mov	ecx, ebx
		mov	eax, [si+10h]
		imul	ecx
		add	[si], eax
		sub	[bp-16Eh], cx

loc_26620:				; CODE XREF: seg046:07B2j seg046:07DBj ...
		mov	ax, word_6E32E
		sub	ax, word_6E31C
		jle	short loc_26663
		mov	cx, [bp-16Eh]
		cmp	ax, cx
		jg	short loc_26633
		mov	cx, ax

loc_26633:				; CODE XREF: seg046:083Fj
		sub	[bp-16Eh], cx
		sub	ax, cx
		jle	short loc_26663
		mov	cx, [bp-16Ch]
		cmp	ax, cx
		jg	short loc_26645
		mov	cx, ax

loc_26645:				; CODE XREF: seg046:0851j
		sub	[bp-16Ch], cx
		sub	ax, cx
		jle	short loc_26663
		mov	cx, [bp-16Ah]
		cmp	ax, cx
		jg	short loc_26657
		mov	cx, ax

loc_26657:				; CODE XREF: seg046:0863j
		sub	[bp-16Ah], cx
		sub	ax, cx
		jle	short loc_26663
		sub	[bp-168h], ax

loc_26663:				; CODE XREF: seg046:0837j seg046:0849j ...
		mov	di, word_6E328
		shl	di, 1
		add	di, word_6E316
		mov	di, [di]
		add	di, word_6E326

loc_26673:
		mov	es, word_6E314
		assume es:seg000
		lea	bx, [bp-1Eh]
		lea	si, [bp-162h]
		mov	cx, [bx]
		add	si, [bx+2]
		push	bp
		push	word ptr [bp-16Eh]
		push	word ptr [bp-16Ch]
		push	word ptr [bp-16Ah]
		push	word ptr [bp-168h]
		pop	ax
		or	ax, ax
		jle	short loc_266BC
		mov	ah, al
		mov	dx, [bx+6]
		mov	bp, [bx+4]
		push	bx
		lfs	bx, dword_6E320

loc_266A7:				; CODE XREF: seg046:08C9j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_266B2
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_266B2:				; CODE XREF: seg046:08BBj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_266A7
		pop	bx

loc_266BC:				; CODE XREF: seg046:08A7j
		pop	ax
		or	ax, ax
		jle	short loc_266E4
		mov	ah, al
		mov	dx, [bx+0Ah]
		mov	bp, [bx+8]
		push	bx
		lfs	bx, dword_6E320

loc_266CF:				; CODE XREF: seg046:08F1j
		mov	al, [si]
		cmp	al, 0FFh

loc_266D3:
		jz	short loc_266DA
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_266DA:				; CODE XREF: seg046:loc_266D3j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_266CF
		pop	bx

loc_266E4:				; CODE XREF: seg046:08CFj
		pop	ax
		or	ax, ax
		jle	short loc_2670C
		mov	ah, al
		mov	dx, [bx+0Eh]
		mov	bp, [bx+0Ch]
		push	bx
		lfs	bx, dword_6E320

loc_266F7:				; CODE XREF: seg046:0919j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_26702
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_26702:				; CODE XREF: seg046:090Bj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_266F7
		pop	bx

loc_2670C:				; CODE XREF: seg046:08F7j
		pop	ax
		or	ax, ax
		jle	short loc_26734
		mov	ah, al
		mov	dx, [bx+12h]
		mov	bp, [bx+10h]
		push	bx
		lfs	bx, dword_6E320

loc_2671F:				; CODE XREF: seg046:0941j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_2672A
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_2672A:				; CODE XREF: seg046:0933j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_2671F
		pop	bx

loc_26734:				; CODE XREF: seg046:091Fj
		pop	bp

loc_26735:				; CODE XREF: seg046:loc_26494j
		pop	di
		pop	si
		leave
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near,206L — initialise une structure d'arête de polygone (bornes Y, position X en fixed-
; point 16.16, deltas de couleur/profondeur R,G,B/Z) à partir de deux sommets : initialisation
; d'arête pour le rasterizer de triangle Gouraud/texturé (edge setup).
; ==============================================================================================
Render_TriangleEdgeSetup	proc near		; CODE XREF: Render_TriangleRasterizer+10Ap
					; Render_TriangleRasterizer+11Fp ...

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		enter	2, 0
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	byte ptr [bx], 0
		mov	ax, [si+2]
		mov	[bx+0Dh], ax
		mov	cx, [di+2]
		mov	[bx+0Fh], cx
		mov	word ptr [bx+13h], 0
		movsx	eax, word ptr [si]

loc_26760:
		shl	eax, 10h
		mov	ax, 8000h

loc_26767:
		mov	[bx+5],	eax

loc_2676B:
		mov	ax, [di+2]
		sub	ax, [si+2]
		jle	short loc_26791
		mov	[bp+var_2], ax
		inc	ax
		mov	[bx+11h], ax
		mov	ax, [si+2]
		cmp	ax, word_6E31E
		jg	short loc_2678C
		mov	ax, [di+2]
		cmp	ax, word_6E31A
		jge	short loc_26794

loc_2678C:				; CODE XREF: Render_TriangleEdgeSetup+48j
		mov	word ptr [bx+13h], 1

loc_26791:				; CODE XREF: Render_TriangleEdgeSetup+38j
		jmp	loc_26951
; ���������������������������������������������������������������������������

loc_26794:				; CODE XREF: Render_TriangleEdgeSetup+51j
		mov	byte ptr [bx], 1
		movzx	eax, word ptr [di+6]
		movzx	ecx, word ptr [si+6]
		sub	eax, ecx
		mov	[bx+17h], eax
		movzx	eax, word ptr [di+8]
		movzx	ecx, word ptr [si+8]
		sub	eax, ecx
		mov	[bx+1Dh], eax
		mov	si, [bp+arg_0]
		lea	di, [si+21h]
		movsx	ecx, [bp+var_2]
		mov	eax, [si+1Dh]
		cdq
		shld	edx, eax, 8
		shl	eax, 8

loc_267D3:
		idiv	ecx
		push	eax

loc_267D8:
		mov	eax, [si+17h]

loc_267DC:
		cdq
		shld	edx, eax, 8
		shl	eax, 8
		idiv	ecx
		pop	ebx
		mov	ecx, eax
		les	si, off_6E308
		assume es:nothing
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	si, ax
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4],	eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+22h], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8],	eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+26h], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+2Ah], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+2Eh], eax
		add	si, 200h
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	si, ax
		mov	eax, es:[si]
		movzx	ecx, [bp+var_2]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	[di+36h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	[di+34h], ax
		mov	ax, [bp+var_2]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		mov	[di+38h], ax
		mov	ax, [bp+var_2]
		inc	ax
		mov	[di+1Ch], ax
		mov	[di+3Ah], ax
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx+6]
		shl	eax, 8
		mov	[di], eax
		movzx	eax, word ptr [bx+8]
		shl	eax, 8
		mov	[di+1Eh], eax
		xor	ax, ax
		mov	[di+14h], ax
		mov	[di+32h], ax
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		mov	cx, [di]
		mov	di, [bp+arg_4]
		mov	ax, [di]
		sub	cx, ax
		movsx	eax, cx
		shl	eax, 10h
		movzx	ecx, [bp+var_2]
		cdq
		idiv	ecx
		mov	[si+9],	eax
		mov	cx, word_6E31A
		mov	ax, [si+0Dh]
		cmp	ax, cx
		jge	short loc_26944
		mov	[si+0Dh], cx
		sub	cx, ax
		mov	ax, cx
		mov	[si+13h], ax
		cwde
		push	ax
		imul	dword ptr [si+9]
		add	[si+5],	eax
		pop	cx
		push	cx
		lea	bx, [si+21h]
		call	Render_EdgeInterpolateAttrib
		pop	cx
		lea	bx, [si+3Fh]
		call	Render_EdgeInterpolateAttrib

loc_26944:				; CODE XREF: Render_TriangleEdgeSetup+1E5j
		mov	ax, word_6E31E
		mov	cx, [si+0Fh]
		cmp	ax, cx
		jge	short loc_26951
		mov	[si+0Fh], ax

loc_26951:				; CODE XREF: Render_TriangleEdgeSetup:loc_26791j
					; Render_TriangleEdgeSetup+213j
		pop	di
		pop	si
		leave
		retn
Render_TriangleEdgeSetup	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near,86L — interpolation incrémentale de plusieurs canaux (couleur/profondeur) le long d'une
; arête, avec bornage entre segments : interpolateur d'attributs (couleur/Z) le long d'une
; arête de polygone.
; ==============================================================================================
Render_EdgeInterpolateAttrib	proc near		; CODE XREF: Render_TriangleEdgeSetup+201p
					; Render_TriangleEdgeSetup+208p
		mov	ax, [bx+14h]
		add	cx, ax
		cmp	ax, [bx+16h]
		jge	short loc_26980
		cmp	cx, ax
		jle	short loc_26980
		mov	dx, [bx+16h]
		cmp	cx, dx
		jg	short loc_2696C
		mov	dx, cx

loc_2696C:				; CODE XREF: Render_EdgeInterpolateAttrib+13j
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+4]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_26980:				; CODE XREF: Render_EdgeInterpolateAttrib+8j Render_EdgeInterpolateAttrib+Cj
		cmp	ax, [bx+18h]
		jge	short loc_269A6
		cmp	cx, ax
		jle	short loc_269A6
		mov	dx, [bx+18h]
		cmp	cx, dx
		jg	short loc_26992
		mov	dx, cx

loc_26992:				; CODE XREF: Render_EdgeInterpolateAttrib+39j
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+8]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_269A6:				; CODE XREF: Render_EdgeInterpolateAttrib+2Ej
					; Render_EdgeInterpolateAttrib+32j
		cmp	ax, [bx+1Ah]
		jge	short loc_269CC
		cmp	cx, ax
		jle	short loc_269CC
		mov	dx, [bx+1Ah]
		cmp	cx, dx
		jg	short loc_269B8
		mov	dx, cx

loc_269B8:				; CODE XREF: Render_EdgeInterpolateAttrib+5Fj
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+0Ch]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_269CC:				; CODE XREF: Render_EdgeInterpolateAttrib+54j
					; Render_EdgeInterpolateAttrib+58j
		cmp	cx, ax
		jle	short locret_269ED
		mov	dx, [bx+1Ch]
		cmp	cx, dx
		jg	short loc_269D9
		mov	dx, cx

loc_269D9:				; CODE XREF: Render_EdgeInterpolateAttrib+80j
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+10h]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

locret_269ED:				; CODE XREF: Render_EdgeInterpolateAttrib+79j
		retn
Render_EdgeInterpolateAttrib	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near,20L — sélectionne un delta d'incrément parmi 4 selon la position Y courante (table de
; gradient par bande) : sélecteur de pas d'interpolation par bande verticale.
; ==============================================================================================
Render_GradientStepSelect	proc near		; CODE XREF: Render_ScanlineAdvance+Cp
					; Render_ScanlineAdvance+14p
		mov	ax, [bx+14h]
		mov	ecx, [bx+4]
		cmp	ax, [bx+16h]
		jl	short loc_26A10
		mov	ecx, [bx+8]
		cmp	ax, [bx+18h]
		jl	short loc_26A10
		mov	ecx, [bx+0Ch]
		cmp	ax, [bx+1Ah]
		jl	short loc_26A10
		mov	ecx, [bx+10h]

loc_26A10:				; CODE XREF: Render_GradientStepSelect+Aj
					; Render_GradientStepSelect+13j ...
		add	[bx], ecx
		inc	word ptr [bx+14h]
		retn
Render_GradientStepSelect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near,18L — avance deux arêtes du triangle (sub_269EE) et un compteur de ligne : avance d'une
; ligne de balayage (scanline) dans le rasterizer.
; ==============================================================================================
Render_ScanlineAdvance	proc near		; CODE XREF: Render_TriangleRasterizer+496p
					; Render_TriangleRasterizer+4ADp
		mov	eax, [bx+9]
		add	[bx+5],	eax
		push	bx
		lea	bx, [bx+21h]
		call	Render_GradientStepSelect
		pop	bx
		push	bx
		lea	bx, [bx+3Fh]
		call	Render_GradientStepSelect
		pop	bx
		mov	ax, [bx+0Dh]
		inc	word ptr [bx+0Dh]
		cmp	ax, [bx+0Fh]
		cmc
		retn
Render_ScanlineAdvance	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near,24L — calcule un ratio 8-bit (division fixed-point), le borne entre 0x18 et 0xE7 :
; calcul d'intensité lumineuse bornée (Gouraud shading clamp).
; ==============================================================================================
Render_ShadeIntensityClamp	proc near		; CODE XREF: Render_TriangleRasterizer+D7p
					; Render_TriangleRasterizer+E6p ...
		mov	dx, 80h	; '�'
		add	ecx, eax
		jz	short loc_26A4D
		shl	eax, 8
		cdq
		idiv	ecx
		mov	dx, ax

loc_26A4D:				; CODE XREF: Render_ShadeIntensityClamp+6j
		mov	ax, dx
		cmp	ax, 18h
		jge	short loc_26A57
		mov	ax, 18h

loc_26A57:				; CODE XREF: Render_ShadeIntensityClamp+18j
		cmp	ax, 0E7h ; '�'
		jle	short locret_26A5F
		mov	ax, 0E7h ; '�'

locret_26A5F:				; CODE XREF: Render_ShadeIntensityClamp+20j
		retn
Render_ShadeIntensityClamp	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,570L — rasterizer de triangle texturé/ombré complet : trie les 3 sommets par Y puis X,
; configure les paramètres de texture (base/stride), copie une table de paramètres (0xC octets
; vers 0x1264h) : point d'entrée principal du moteur de rendu de triangle (même famille que
; seg037/044/045), à approfondir en détail dans une session dédiée graphique.
; ==============================================================================================
Render_TriangleRasterizer	proc far		; CODE XREF: Mesh_SubdivideRecursive+B8P

var_131		= word ptr -131h
var_12F		= word ptr -12Fh
var_12D		= word ptr -12Dh
var_12B		= word ptr -12Bh
var_129		= word ptr -129h
var_127		= word ptr -127h
var_125		= word ptr -125h
var_123		= word ptr -123h
var_121		= word ptr -121h
var_11F		= word ptr -11Fh
var_11D		= word ptr -11Dh
var_11B		= word ptr -11Bh
var_119		= word ptr -119h
var_117		= word ptr -117h
var_106		= word ptr -106h
var_104		= word ptr -104h
var_BA		= word ptr -0BAh
var_AB		= word ptr -0ABh
var_A9		= word ptr -0A9h
var_A7		= word ptr -0A7h
var_A5		= word ptr -0A5h
var_9F		= word ptr -9Fh
var_5D		= word ptr -5Dh
var_58		= dword	ptr -58h
var_3C		= dword	ptr -3Ch
var_1E		= dword	ptr -1Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		enter	131h, 0
		push	si
		push	di

loc_26A66:
		cld
		mov	si, [bp+arg_0]
		push	ds
		pop	es
		assume es:seg339
		mov	di, 1264h
		mov	cx, 0Ch
		rep movsb
		mov	eax, [bp+arg_10]
		mov	dword_6E320, eax
		mov	eax, [bp+arg_8]
		mov	dword_6E30C, eax
		mov	ax, [bp+arg_C]
		mov	word_6E310, ax
		mov	ax, [bp+arg_E]
		mov	word_6E312, ax
		mov	bx, [bp+arg_2]
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, [bx+2]
		cmp	ax, [di+2]
		jg	short loc_26AA9
		jl	short loc_26AAB
		mov	ax, [bx]
		cmp	ax, [di]
		jle	short loc_26AAB

loc_26AA9:				; CODE XREF: Render_TriangleRasterizer+3Fj
		xchg	bx, di

loc_26AAB:				; CODE XREF: Render_TriangleRasterizer+41j
					; Render_TriangleRasterizer+47j
		mov	ax, [si+2]
		cmp	ax, [di+2]
		jg	short loc_26ABB
		jl	short loc_26ABD
		mov	ax, [si]
		cmp	ax, [di]
		jle	short loc_26ABD

loc_26ABB:				; CODE XREF: Render_TriangleRasterizer+51j
		xchg	si, di

loc_26ABD:				; CODE XREF: Render_TriangleRasterizer+53j
					; Render_TriangleRasterizer+59j
		mov	ax, [bx+2]
		cmp	ax, [si+2]
		jg	short loc_26ACD
		jl	short loc_26ACF
		mov	ax, [bx]
		cmp	ax, [si]
		jle	short loc_26ACF

loc_26ACD:				; CODE XREF: Render_TriangleRasterizer+63j
		xchg	bx, si

loc_26ACF:				; CODE XREF: Render_TriangleRasterizer+65j
					; Render_TriangleRasterizer+6Bj
		mov	[bp+arg_2], bx

loc_26AD2:
		mov	[bp+arg_4], si

loc_26AD5:
		mov	[bp+arg_6], di
		xor	cx, cx
		mov	ax, word_6E318
		cmp	ax, [bx]
		jle	short loc_26AE3
		inc	cl

loc_26AE3:				; CODE XREF: Render_TriangleRasterizer+7Fj
		cmp	ax, [si]
		jle	short loc_26AE9
		inc	cl

loc_26AE9:				; CODE XREF: Render_TriangleRasterizer+85j
		cmp	ax, [di]
		jle	short loc_26AEF
		inc	cl

loc_26AEF:				; CODE XREF: Render_TriangleRasterizer+8Bj
		mov	ax, word_6E31C
		cmp	ax, [bx]
		jge	short loc_26AF8
		inc	ch

loc_26AF8:				; CODE XREF: Render_TriangleRasterizer+94j
		cmp	ax, [si]
		jge	short loc_26AFE
		inc	ch

loc_26AFE:				; CODE XREF: Render_TriangleRasterizer+9Aj
		cmp	ax, [di]
		jge	short loc_26B04
		inc	ch

loc_26B04:				; CODE XREF: Render_TriangleRasterizer+A0j
		mov	[bp+var_12F], cx
		cmp	cl, 3
		jz	short loc_26B14
		cmp	ch, 3
		jz	short loc_26B14
		jmp	short loc_26B17
; ���������������������������������������������������������������������������

loc_26B14:				; CODE XREF: Render_TriangleRasterizer+ABj
					; Render_TriangleRasterizer+B0j
		jmp	loc_26F27
; ���������������������������������������������������������������������������

loc_26B17:				; CODE XREF: Render_TriangleRasterizer+B2j
		mov	ax, [bx+2]
		cmp	ax, word_6E31E
		jle	short loc_26B23
		jmp	loc_26F27
; ���������������������������������������������������������������������������

loc_26B23:				; CODE XREF: Render_TriangleRasterizer+BEj
		mov	ax, [di+2]
		cmp	ax, word_6E31A
		jge	short loc_26B2F
		jmp	loc_26F27
; ���������������������������������������������������������������������������

loc_26B2F:				; CODE XREF: Render_TriangleRasterizer+CAj
		mov	eax, [si+0Eh]
		mov	ecx, [bx+0Eh]
		call	Render_ShadeIntensityClamp
		mov	[bp+var_121], ax
		mov	eax, [di+0Eh]
		mov	ecx, [si+0Eh]
		call	Render_ShadeIntensityClamp
		mov	[bp+var_123], ax
		mov	eax, [di+0Eh]
		mov	ecx, [bx+0Eh]
		call	Render_ShadeIntensityClamp
		mov	[bp+var_125], ax
		lea	si, [bp+var_5D]
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	[bp+var_125]
		push	si
		call	Render_TriangleEdgeSetup

loc_26B6D:
		add	sp, 8

loc_26B70:
		lea	si, [bp+var_BA]
		push	[bp+arg_4]

loc_26B77:
		push	[bp+arg_2]
		push	[bp+var_121]
		push	si
		call	Render_TriangleEdgeSetup
		add	sp, 8
		lea	si, [bp+var_117]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+var_123]
		push	si
		call	Render_TriangleEdgeSetup
		add	sp, 8
		cmp	byte ptr [bp+var_BA], 0
		jz	short loc_26BBD
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_26BBD
		mov	ax, [bp+var_AB]
		cmp	ax, word_6E31A
		jg	short loc_26BB9
		mov	byte ptr [bp+var_BA], 0
		jmp	short loc_26BBD
; ���������������������������������������������������������������������������

loc_26BB9:				; CODE XREF: Render_TriangleRasterizer+150j
		dec	[bp+var_AB]

loc_26BBD:				; CODE XREF: Render_TriangleRasterizer+13Fj
					; Render_TriangleRasterizer+146j ...
		cmp	byte ptr [bp+var_5D], 0
		jnz	short loc_26C41
		mov	byte ptr [bp+var_BA], 1
		mov	byte ptr [bp+var_5D], 1
		mov	bx, [bp+arg_6]
		movsx	eax, word ptr [bx]
		shl	eax, 10h
		mov	[bp+var_58], eax

loc_26BDB:
		movzx	eax, word ptr [bx+6]

loc_26BE0:
		shl	eax, 8
		mov	[bp+var_3C], eax

loc_26BE8:
		movzx	eax, word ptr [bx+8]
		shl	eax, 8
		mov	[bp+var_1E], eax
		lea	si, [bp+var_BA]
		mov	[bp+var_119], si
		mov	[bp+var_11D], 0
		lea	bx, [si+21h]
		movzx	eax, [bp+var_A5]
		shl	eax, 8
		mov	[bx], eax
		lea	bx, [si+3Fh]
		movzx	eax, [bp+var_9F]
		shl	eax, 8
		mov	[bx], eax
		lea	di, [bp+var_5D]
		mov	[bp+var_11B], di
		mov	[bp+var_11F], 0
		mov	ax, [bp+var_125]
		mov	[bp+var_127], ax
		mov	[bp+var_129], 0
		jmp	loc_26E47
; ���������������������������������������������������������������������������

loc_26C41:				; CODE XREF: Render_TriangleRasterizer+161j
		lea	bx, [bp+var_5D]
		lea	si, [bp+var_BA]
		lea	di, [bp+var_117]
		cmp	byte ptr [si], 0
		jz	short loc_26C83
		mov	edx, [si+9]
		cmp	edx, [bx+9]
		jg	short loc_26C6F
		mov	[bp+var_119], si
		mov	[bp+var_11D], di
		mov	[bp+var_11B], bx

loc_26C67:
		mov	[bp+var_11F], 0
		jmp	short loc_26CB7
; ���������������������������������������������������������������������������

loc_26C6F:				; CODE XREF: Render_TriangleRasterizer+1F9j
		mov	[bp+var_119], bx
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], si
		mov	[bp+var_11F], di
		jmp	short loc_26CB7
; ���������������������������������������������������������������������������

loc_26C83:				; CODE XREF: Render_TriangleRasterizer+1EFj
		mov	edx, [di+9]
		cmp	edx, [bx+9]
		jl	short loc_26CA3
		mov	[bp+var_119], di
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], bx
		mov	[bp+var_11F], 0
		jmp	short loc_26CB7
; ���������������������������������������������������������������������������

loc_26CA3:				; CODE XREF: Render_TriangleRasterizer+22Bj
		mov	[bp+var_119], bx
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], di
		mov	[bp+var_11F], 0

loc_26CB7:				; CODE XREF: Render_TriangleRasterizer+20Dj
					; Render_TriangleRasterizer+221j ...
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]
		cmp	byte ptr [bp+var_BA], 0
		jnz	short loc_26D09
		cmp	[bp+var_A7], 0
		jnz	short loc_26D09
		mov	ax, [bp+var_121]
		shl	ax, 7
		mov	[bp+var_127], ax

loc_26CD8:
		mov	ax, 4000h

loc_26CDB:
		mov	[bp+var_12B], ax
		mov	cx, [si+11h]

loc_26CE2:
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	cx
		mov	[bp+var_129], ax
		mov	[bp+var_12D], 0
		mov	cx, [bp+var_A7]
		or	cx, cx
		jz	short loc_26D06
		mov	ax, [bp+var_129]
		imul	cx
		add	[bp+var_127], ax

loc_26D06:				; CODE XREF: Render_TriangleRasterizer+29Aj
		jmp	loc_26E47
; ���������������������������������������������������������������������������

loc_26D09:				; CODE XREF: Render_TriangleRasterizer+264j
					; Render_TriangleRasterizer+26Bj
		cmp	byte ptr [bp+var_117], 0
		jnz	short loc_26D53
		cmp	[bp+var_104], 0
		jnz	short loc_26D53
		mov	ax, 4000h
		mov	[bp+var_127], ax
		mov	ax, [bp+var_123]
		shl	ax, 7
		mov	[bp+var_12B], ax
		mov	cx, [si+11h]
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	cx
		mov	[bp+var_129], ax
		mov	[bp+var_12D], 0
		mov	cx, [bp+var_104]
		or	cx, cx
		jz	short loc_26D50
		mov	ax, [bp+var_129]
		imul	cx
		add	[bp+var_127], ax

loc_26D50:				; CODE XREF: Render_TriangleRasterizer+2E4j
		jmp	loc_26E47
; ���������������������������������������������������������������������������

loc_26D53:				; CODE XREF: Render_TriangleRasterizer+2AEj
					; Render_TriangleRasterizer+2B5j
		mov	ax, 4000h
		mov	[bp+var_127], ax
		mov	bx, [bp+arg_2]
		mov	si, [bp+arg_4]

loc_26D60:
		mov	di, [bp+arg_6]

loc_26D63:
		mov	cx, [di+2]
		sub	cx, [bx+2]
		movsx	ecx, cx

loc_26D6D:
		mov	ax, [si+2]

loc_26D70:
		sub	ax, [bx+2]

loc_26D73:
		movsx	eax, ax
		mov	edx, [bx+0Eh]
		sub	edx, [si+0Eh]
		imul	edx
		idiv	ecx
		add	eax, [si+0Eh]
		imul	dword ptr [di+0Eh]
		push	eax
		mov	ecx, eax
		mov	eax, [bx+0Eh]
		imul	eax, [si+0Eh]
		add	ecx, eax
		pop	edx
		mov	ax, 4000h
		jmp	short loc_26DBB
; ���������������������������������������������������������������������������
		align 4
		jz	short loc_26DBB
		mov	eax, edx
		cdq
		shld	edx, eax, 0Fh
		shl	eax, 0Fh
		idiv	ecx

loc_26DBB:				; CODE XREF: Render_TriangleRasterizer+343j
					; Render_TriangleRasterizer+348j
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]
		lea	cx, [bp+var_5D]
		cmp	cx, si
		jz	short loc_26DCF
		neg	ax
		add	ax, 8000h

loc_26DCF:				; CODE XREF: Render_TriangleRasterizer+368j
		cmp	ax, 0C00h

loc_26DD2:
		jge	short loc_26DD7
		mov	ax, 0C00h

loc_26DD7:				; CODE XREF: Render_TriangleRasterizer:loc_26DD2j
		cmp	ax, 7380h
		jle	short loc_26DDF

loc_26DDC:
		mov	ax, 7380h

loc_26DDF:				; CODE XREF: Render_TriangleRasterizer+37Aj
		mov	[bp+var_12B], ax

loc_26DE3:
		cmp	byte ptr [bp+var_BA], 0
		jz	short loc_26E0A
		mov	ax, [bp+var_12B]
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	[bp+var_A9]
		mov	[bp+var_129], ax
		mov	cx, [bp+var_A7]
		or	cx, cx
		jz	short loc_26E0A
		imul	cx
		add	[bp+var_127], ax

loc_26E0A:				; CODE XREF: Render_TriangleRasterizer+388j
					; Render_TriangleRasterizer+3A2j
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_26E30
		mov	ax, 4000h
		sub	ax, [bp+var_12B]
		sbb	dx, dx
		idiv	[bp+var_106]
		mov	[bp+var_12D], ax
		mov	cx, [bp+var_104]
		or	cx, cx
		jz	short loc_26E30
		imul	cx
		add	[bp+var_12B], ax

loc_26E30:				; CODE XREF: Render_TriangleRasterizer+3AFj
					; Render_TriangleRasterizer+3C8j
		cmp	byte ptr [bp+var_BA], 0
		jnz	short loc_26E47
		mov	ax, [bp+var_12B]
		mov	[bp+var_127], ax
		mov	ax, [bp+var_12D]
		mov	[bp+var_129], ax

loc_26E47:				; CODE XREF: Render_TriangleRasterizer+1DEj
					; Render_TriangleRasterizer:loc_26D06j	...
		mov	ax, 78h	; 'x'
		mov	cx, 212h
		cmp	dword_6E320, 0
		jz	short loc_26E5B
		mov	ax, 4ACh
		mov	cx, 68Bh

loc_26E5B:				; CODE XREF: Render_TriangleRasterizer+3F3j
		cmp	[bp+var_12F], 0
		jz	short loc_26E64
		mov	ax, cx

loc_26E64:				; CODE XREF: Render_TriangleRasterizer+400j
		mov	[bp+var_131], ax
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]

loc_26E70:				; CODE XREF: Render_TriangleRasterizer+4B0j
					; Render_TriangleRasterizer+4C4j
		mov	eax, [si+5]
		shr	eax, 10h
		mov	word_6E326, ax
		mov	ax, [si+0Dh]
		mov	word_6E328, ax
		lea	bx, [si+21h]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_6E32A, ax
		lea	bx, [si+3Fh]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_6E32C, ax
		mov	eax, [di+5]
		shr	eax, 10h
		mov	word_6E32E, ax
		mov	ax, [di+0Dh]
		mov	word_6E330, ax
		lea	bx, [di+21h]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_6E332, ax
		lea	bx, [di+3Fh]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_6E334, ax
		mov	ax, [bp+var_127]

loc_26EE2:
		shr	ax, 7
		mov	word_6E324, ax
		call	[bp+var_131]
		mov	ax, [bp+var_129]
		add	[bp+var_127], ax
		mov	bx, si
		call	Render_ScanlineAdvance
		jnb	short loc_26F0B
		mov	si, [bp+var_11D]
		or	si, si
		jz	short loc_26F27
		mov	ax, [bp+var_12D]
		mov	[bp+var_129], ax

loc_26F0B:				; CODE XREF: Render_TriangleRasterizer+499j
		mov	bx, di
		call	Render_ScanlineAdvance
		jnb	loc_26E70
		mov	di, [bp+var_11F]
		or	di, di
		jz	short loc_26F27
		mov	ax, [bp+var_12D]

loc_26F20:
		mov	[bp+var_129], ax
		jmp	loc_26E70
; ���������������������������������������������������������������������������

loc_26F27:				; CODE XREF: Render_TriangleRasterizer:loc_26B14j
					; Render_TriangleRasterizer+C0j ...
		pop	di
		pop	si
		leave
		retf
Render_TriangleRasterizer	endp

seg046		ends
