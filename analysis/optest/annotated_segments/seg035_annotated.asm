seg035		segment	byte public 'CODE' use16
		assume cs:seg035
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Render_SampleTexture
; (sub_25DFA de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near,75L — échantillonne une texture (dword_6E30C base, word_6E310 stride) selon un
; pas Bresenham (delta X/Y, remplissage ligne par ligne d'un buffer di) : primitive
; d'échantillonnage de texture pour le rasterizer de triangles (texture mapping).
; ==============================================================================================
Render_SampleTexture	proc near		; CODE XREF: seg035:00A2p seg035:024Fp ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4

		enter	8, 0
		push	ax
		push	dx
		les	si, dword_45F9A
		add	si, ax
		mov	ax, word_45F9E
		mul	bx
		add	si, ax
		pop	dx
		sub	dx, bx
		mov	bx, dx
		mov	dx, word_45F9E
		jns	short loc_18FBC
		neg	dx
		neg	bx

loc_18FBC:				; CODE XREF: Render_SampleTexture+1Cj
		inc	bx
		pop	ax
		sub	cx, ax
		mov	ax, cx
		mov	cx, 1
		jns	short loc_18FCB
		neg	cx
		neg	ax

loc_18FCB:				; CODE XREF: Render_SampleTexture+2Bj
		inc	ax
		cmp	ax, bx
		jle	short loc_18FD3
		xchg	ax, bx
		xchg	cx, dx

loc_18FD3:				; CODE XREF: Render_SampleTexture+34j
		mov	[bp+var_4], bx
		mov	[bp+var_6], cx
		mov	[bp+var_8], dx
		mov	cx, bx
		mov	dx, bx
		mov	bx, ax
		push	di
		and	cx, 0FFh
		or	cx, cx
		jz	short loc_19003

loc_18FEB:				; CODE XREF: Render_SampleTexture+5Fj
					; Render_SampleTexture+67j
		mov	al, es:[si]
		mov	[di], al
		inc	di
		dec	cx
		jz	short loc_19003
		add	si, [bp+var_8]
		sub	dx, bx
		jg	short loc_18FEB
		add	dx, [bp+var_4]
		add	si, [bp+var_6]
		jmp	short loc_18FEB
; ���������������������������������������������������������������������������

loc_19003:				; CODE XREF: Render_SampleTexture+4Fj
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
		mov	ax, word_45FBC
		sub	ax, word_45FB4
		jge	short loc_1901A
		jmp	loc_191A0
; ���������������������������������������������������������������������������

loc_1901A:				; CODE XREF: seg035:0085j
		inc	ax
		mov	[bp-162h], ax
		mov	ax, word_45FB8
		mov	bx, word_45FBA
		mov	cx, word_45FC0
		mov	dx, word_45FC2
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
		mov	ecx, eax
		les	si, off_45F96
		mov	bx, word_45FB2
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
		mov	bx, word_45FB2
		cmp	bx, 100h
		jl	short loc_190C9
		nop
		nop
		jmp	loc_191A0
; ���������������������������������������������������������������������������

loc_190C9:				; CODE XREF: seg035:0132j
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
		mov	[di], eax
		mov	[di+14h], ax
		mov	di, word_45FB6
		shl	di, 1
		add	di, word_45FA4
		mov	di, [di]
		add	di, word_45FB4
		mov	es, word_45FA2
		assume es:seg000
		lea	si, [bp-1Eh]
		lea	bx, [bp-15Eh]
		push	bp
		push	word ptr [bp-162h]
		mov	dx, [si+6]
		mov	ah, [si+16h]
		or	ah, ah
		jle	short loc_1913B
		mov	bp, [si+4]

loc_19129:				; CODE XREF: seg035:01A9j
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_19132
		mov	es:[di], al

loc_19132:				; CODE XREF: seg035:019Dj
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_19129

loc_1913B:				; CODE XREF: seg035:0194j
		mov	dx, [si+0Ah]
		mov	ax, [si+18h]
		sub	ax, [si+16h]
		jle	short loc_1915D
		mov	ah, al
		mov	bp, [si+4]

loc_1914B:				; CODE XREF: seg035:01CBj
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_19154
		mov	es:[di], al

loc_19154:				; CODE XREF: seg035:01BFj
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_1914B

loc_1915D:				; CODE XREF: seg035:01B4j
		mov	dx, [si+0Eh]
		mov	ax, [si+1Ah]
		sub	ax, [si+18h]
		jle	short loc_1917F
		mov	ah, al
		mov	bp, [si+0Ch]

loc_1916D:				; CODE XREF: seg035:01EDj
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_19176
		mov	es:[di], al

loc_19176:				; CODE XREF: seg035:01E1j
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_1916D

loc_1917F:				; CODE XREF: seg035:01D6j
		mov	dx, [si+12h]
		pop	ax
		sub	ax, [si+1Ah]
		jle	short loc_1919F
		mov	ah, al
		mov	bp, [si+10h]

loc_1918D:				; CODE XREF: seg035:020Dj
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_19196
		mov	es:[di], al

loc_19196:				; CODE XREF: seg035:0201j
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_1918D

loc_1919F:				; CODE XREF: seg035:01F6j
		pop	bp

loc_191A0:				; CODE XREF: seg035:0087j seg035:0136j
		pop	di
		pop	si
		leave
		retn
; ���������������������������������������������������������������������������
		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_45FB4
		cmp	ax, word_45FAA
		jg	short loc_191BD
		mov	cx, word_45FBC
		cmp	cx, word_45FA6
		jge	short loc_191C0

loc_191BD:				; CODE XREF: seg035:0221j
		jmp	loc_1943A
; ���������������������������������������������������������������������������

loc_191C0:				; CODE XREF: seg035:022Bj
		mov	ax, word_45FBC
		sub	ax, word_45FB4
		inc	ax
		mov	[bp-166h], ax
		mov	ax, word_45FB8
		mov	bx, word_45FBA
		mov	cx, word_45FC0
		mov	dx, word_45FC2
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
		les	si, off_45F96
		assume es:nothing
		mov	bx, word_45FB2
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
		mov	bx, word_45FB2
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
		mov	ax, word_45FA6
		sub	ax, word_45FB4
		jle	short loc_19349
		add	word_45FB4, ax
		movsx	ebx, ax
		movzx	ecx, word ptr [bp-168h]
		cmp	ebx, ecx
		jg	short loc_192E3
		mov	ecx, ebx

loc_192E3:				; CODE XREF: seg035:034Ej
		mov	eax, [si+4]
		imul	ecx
		add	[si], eax
		sub	[bp-168h], cx
		sub	ebx, ecx
		jle	short loc_19349
		movzx	ecx, word ptr [bp-16Ah]
		cmp	ebx, ecx
		jg	short loc_19304
		mov	ecx, ebx

loc_19304:				; CODE XREF: seg035:036Fj
		mov	eax, [si+8]
		imul	ecx
		add	[si], eax
		sub	[bp-16Ah], cx
		sub	ebx, ecx
		jle	short loc_19349
		movzx	ecx, word ptr [bp-16Ch]
		cmp	ebx, ecx
		jg	short loc_19325
		mov	ecx, ebx

loc_19325:				; CODE XREF: seg035:0390j
		mov	eax, [si+0Ch]
		imul	ecx
		add	[si], eax
		sub	[bp-16Ch], cx
		sub	ebx, ecx
		jle	short loc_19349
		mov	ecx, ebx
		mov	eax, [si+10h]
		imul	ecx
		add	[si], eax
		sub	[bp-16Eh], cx

loc_19349:				; CODE XREF: seg035:033Bj seg035:0364j ...
		mov	ax, word_45FBC
		sub	ax, word_45FAA
		jle	short loc_1938C
		mov	cx, [bp-16Eh]
		cmp	ax, cx
		jg	short loc_1935C
		mov	cx, ax

loc_1935C:				; CODE XREF: seg035:03C8j
		sub	[bp-16Eh], cx
		sub	ax, cx
		jle	short loc_1938C
		mov	cx, [bp-16Ch]
		cmp	ax, cx
		jg	short loc_1936E
		mov	cx, ax

loc_1936E:				; CODE XREF: seg035:03DAj
		sub	[bp-16Ch], cx
		sub	ax, cx
		jle	short loc_1938C
		mov	cx, [bp-16Ah]
		cmp	ax, cx
		jg	short loc_19380
		mov	cx, ax

loc_19380:				; CODE XREF: seg035:03ECj
		sub	[bp-16Ah], cx
		sub	ax, cx
		jle	short loc_1938C
		sub	[bp-168h], ax

loc_1938C:				; CODE XREF: seg035:03C0j seg035:03D2j ...
		mov	di, word_45FB6
		shl	di, 1
		add	di, word_45FA4
		mov	di, [di]
		add	di, word_45FB4
		mov	es, word_45FA2
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
		jle	short loc_193DC
		mov	ah, al
		mov	bp, [bx+4]

loc_193CA:				; CODE XREF: seg035:044Aj
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_193D3
		mov	es:[di], al

loc_193D3:				; CODE XREF: seg035:043Ej
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_193CA

loc_193DC:				; CODE XREF: seg035:0433j
		mov	dx, [bx+0Ah]
		pop	ax
		or	ax, ax
		jle	short loc_193FB
		mov	ah, al
		mov	bp, [bx+8]

loc_193E9:				; CODE XREF: seg035:0469j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_193F2
		mov	es:[di], al

loc_193F2:				; CODE XREF: seg035:045Dj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_193E9

loc_193FB:				; CODE XREF: seg035:0452j
		mov	dx, [bx+0Eh]
		pop	ax
		or	ax, ax
		jle	short loc_1941A
		mov	ah, al
		mov	bp, [bx+0Ch]

loc_19408:				; CODE XREF: seg035:0488j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_19411
		mov	es:[di], al

loc_19411:				; CODE XREF: seg035:047Cj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_19408

loc_1941A:				; CODE XREF: seg035:0471j
		mov	dx, [bx+12h]
		pop	ax
		or	ax, ax
		jle	short loc_19439
		mov	ah, al
		mov	bp, [bx+10h]

loc_19427:				; CODE XREF: seg035:04A7j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_19430
		mov	es:[di], al

loc_19430:				; CODE XREF: seg035:049Bj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_19427

loc_19439:				; CODE XREF: seg035:0490j
		pop	bp

loc_1943A:				; CODE XREF: seg035:loc_191BDj
		pop	di
		pop	si
		leave
		retn
; ���������������������������������������������������������������������������
		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_45FBC
		sub	ax, word_45FB4
		jge	short loc_19450
		jmp	loc_19619
; ���������������������������������������������������������������������������

loc_19450:				; CODE XREF: seg035:04BBj
		inc	ax
		mov	[bp-166h], ax
		mov	ax, word_45FB8
		mov	bx, word_45FBA
		mov	cx, word_45FC0
		mov	dx, word_45FC2
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
		les	si, off_45F96
		assume es:nothing
		mov	bx, word_45FB2
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
		mov	bx, word_45FB2
		cmp	bx, 100h
		jl	short loc_194FD
		jmp	loc_19619
; ���������������������������������������������������������������������������

loc_194FD:				; CODE XREF: seg035:0568j
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
		mov	di, word_45FB6
		shl	di, 1
		add	di, word_45FA4
		mov	di, [di]
		add	di, word_45FB4
		mov	es, word_45FA2
		assume es:seg000
		lea	bx, [bp-1Eh]
		lea	si, [bp-162h]
		xor	cx, cx
		pop	ax
		or	ax, ax
		jle	short loc_195A0
		mov	ah, al
		mov	bp, [bx+4]
		mov	dx, [bx+6]
		push	bx
		lfs	bx, dword_45FAE

loc_1958B:				; CODE XREF: seg035:060Dj
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_19596
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_19596:				; CODE XREF: seg035:05FFj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1958B
		pop	bx

loc_195A0:				; CODE XREF: seg035:05EBj
		pop	ax
		or	ax, ax
		jle	short loc_195C8
		mov	ah, al
		mov	bp, [bx+8]
		mov	dx, [bx+0Ah]
		push	bx
		lfs	bx, dword_45FAE

loc_195B3:				; CODE XREF: seg035:0635j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_195BE
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_195BE:				; CODE XREF: seg035:0627j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_195B3
		pop	bx

loc_195C8:				; CODE XREF: seg035:0613j
		pop	ax
		or	ax, ax
		jle	short loc_195F0
		mov	ah, al
		mov	bp, [bx+0Ch]
		mov	dx, [bx+0Eh]
		push	bx
		lfs	bx, dword_45FAE

loc_195DB:				; CODE XREF: seg035:065Dj
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_195E6
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_195E6:				; CODE XREF: seg035:064Fj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_195DB
		pop	bx

loc_195F0:				; CODE XREF: seg035:063Bj
		pop	ax
		or	ax, ax
		jle	short loc_19618
		mov	ah, al
		mov	bp, [bx+10h]
		mov	dx, [bx+12h]
		push	bx
		lfs	bx, dword_45FAE

loc_19603:				; CODE XREF: seg035:0685j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1960E
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_1960E:				; CODE XREF: seg035:0677j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_19603
		pop	bx

loc_19618:				; CODE XREF: seg035:0663j
		pop	bp

loc_19619:				; CODE XREF: seg035:04BDj seg035:056Aj
		pop	di
		pop	si
		leave
		retn
; ���������������������������������������������������������������������������
		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_45FB4
		cmp	ax, word_45FAA
		jg	short loc_19636
		mov	cx, word_45FBC
		cmp	cx, word_45FA6
		jge	short loc_19639

loc_19636:				; CODE XREF: seg035:069Aj
		jmp	loc_198D7
; ���������������������������������������������������������������������������

loc_19639:				; CODE XREF: seg035:06A4j
		mov	ax, word_45FBC
		sub	ax, word_45FB4
		inc	ax
		mov	[bp-166h], ax
		mov	ax, word_45FB8
		mov	bx, word_45FBA
		mov	cx, word_45FC0
		mov	dx, word_45FC2
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
		les	si, off_45F96
		assume es:nothing
		mov	bx, word_45FB2
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
		mov	bx, word_45FB2
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
		mov	ax, word_45FA6
		sub	ax, word_45FB4
		jle	short loc_197C2
		add	word_45FB4, ax
		movzx	ebx, ax
		movzx	ecx, word ptr [bp-168h]
		cmp	ebx, ecx
		jg	short loc_1975C
		mov	ecx, ebx

loc_1975C:				; CODE XREF: seg035:07C7j
		mov	eax, [si+4]
		imul	ecx
		add	[si], eax
		sub	[bp-168h], cx
		sub	ebx, ecx
		jle	short loc_197C2
		movzx	ecx, word ptr [bp-16Ah]
		cmp	ebx, ecx
		jg	short loc_1977D
		mov	ecx, ebx

loc_1977D:				; CODE XREF: seg035:07E8j
		mov	eax, [si+8]
		imul	ecx
		add	[si], eax
		sub	[bp-16Ah], cx
		sub	ebx, ecx
		jle	short loc_197C2
		movzx	ecx, word ptr [bp-16Ch]
		cmp	ebx, ecx
		jg	short loc_1979E
		mov	ecx, ebx

loc_1979E:				; CODE XREF: seg035:0809j
		mov	eax, [si+0Ch]
		imul	ecx
		add	[si], eax
		sub	[bp-16Ch], cx
		sub	ebx, ecx
		jle	short loc_197C2
		mov	ecx, ebx
		mov	eax, [si+10h]
		imul	ecx
		add	[si], eax
		sub	[bp-16Eh], cx

loc_197C2:				; CODE XREF: seg035:07B4j seg035:07DDj ...
		mov	ax, word_45FBC
		sub	ax, word_45FAA
		jle	short loc_19805
		mov	cx, [bp-16Eh]
		cmp	ax, cx
		jg	short loc_197D5
		mov	cx, ax

loc_197D5:				; CODE XREF: seg035:0841j
		sub	[bp-16Eh], cx
		sub	ax, cx
		jle	short loc_19805
		mov	cx, [bp-16Ch]
		cmp	ax, cx
		jg	short loc_197E7
		mov	cx, ax

loc_197E7:				; CODE XREF: seg035:0853j
		sub	[bp-16Ch], cx
		sub	ax, cx
		jle	short loc_19805
		mov	cx, [bp-16Ah]
		cmp	ax, cx
		jg	short loc_197F9
		mov	cx, ax

loc_197F9:				; CODE XREF: seg035:0865j
		sub	[bp-16Ah], cx
		sub	ax, cx
		jle	short loc_19805
		sub	[bp-168h], ax

loc_19805:				; CODE XREF: seg035:0839j seg035:084Bj ...
		mov	di, word_45FB6
		shl	di, 1
		add	di, word_45FA4
		mov	di, [di]
		add	di, word_45FB4
		mov	es, word_45FA2
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
		jle	short loc_1985E
		mov	ah, al
		mov	dx, [bx+6]
		mov	bp, [bx+4]
		push	bx
		lfs	bx, dword_45FAE

loc_19849:				; CODE XREF: seg035:08CBj
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_19854
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_19854:				; CODE XREF: seg035:08BDj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_19849
		pop	bx

loc_1985E:				; CODE XREF: seg035:08A9j
		pop	ax
		or	ax, ax
		jle	short loc_19886
		mov	ah, al
		mov	dx, [bx+0Ah]
		mov	bp, [bx+8]
		push	bx
		lfs	bx, dword_45FAE

loc_19871:				; CODE XREF: seg035:08F3j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1987C
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_1987C:				; CODE XREF: seg035:08E5j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_19871
		pop	bx

loc_19886:				; CODE XREF: seg035:08D1j
		pop	ax
		or	ax, ax
		jle	short loc_198AE
		mov	ah, al
		mov	dx, [bx+0Eh]
		mov	bp, [bx+0Ch]
		push	bx
		lfs	bx, dword_45FAE

loc_19899:				; CODE XREF: seg035:091Bj
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_198A4
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_198A4:				; CODE XREF: seg035:090Dj
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_19899
		pop	bx

loc_198AE:				; CODE XREF: seg035:08F9j
		pop	ax
		or	ax, ax
		jle	short loc_198D6
		mov	ah, al
		mov	dx, [bx+12h]
		mov	bp, [bx+10h]
		push	bx
		lfs	bx, dword_45FAE

loc_198C1:				; CODE XREF: seg035:0943j
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_198CC
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_198CC:				; CODE XREF: seg035:0935j
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_198C1
		pop	bx

loc_198D6:				; CODE XREF: seg035:0921j
		pop	bp

loc_198D7:				; CODE XREF: seg035:loc_19636j
		pop	di
		pop	si
		leave
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_TriangleEdgeSetup (sub_26739 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — near,206L — initialise une structure d'arête de polygone
; (bornes Y, position X en fixed-point 16.16, deltas de couleur/profondeur R,G,B/Z) à partir
; de deux sommets : initialisation d'arête pour le rasterizer de triangle Gouraud/texturé
; (edge setup).
; ==============================================================================================
Render_TriangleEdgeSetup	proc near		; CODE XREF: sub_19C02+10Ap
					; sub_19C02+11Fp ...

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
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bx+5],	eax
		mov	ax, [di+2]
		sub	ax, [si+2]
		jle	short loc_19933
		mov	[bp+var_2], ax
		inc	ax
		mov	[bx+11h], ax
		mov	ax, [si+2]
		cmp	ax, word_45FAC
		jg	short loc_1992E
		mov	ax, [di+2]
		cmp	ax, word_45FA8
		jge	short loc_19936

loc_1992E:				; CODE XREF: Render_TriangleEdgeSetup+48j
		mov	word ptr [bx+13h], 1

loc_19933:				; CODE XREF: Render_TriangleEdgeSetup+38j
		jmp	loc_19AF3
; ���������������������������������������������������������������������������

loc_19936:				; CODE XREF: Render_TriangleEdgeSetup+51j
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
		idiv	ecx
		push	eax
		mov	eax, [si+17h]
		cdq
		shld	edx, eax, 8
		shl	eax, 8
		idiv	ecx
		pop	ebx
		mov	ecx, eax
		les	si, off_45F96
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
		mov	cx, word_45FA8
		mov	ax, [si+0Dh]
		cmp	ax, cx
		jge	short loc_19AE6
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

loc_19AE6:				; CODE XREF: Render_TriangleEdgeSetup+1E5j
		mov	ax, word_45FAC
		mov	cx, [si+0Fh]
		cmp	ax, cx
		jge	short loc_19AF3
		mov	[si+0Fh], ax

loc_19AF3:				; CODE XREF: Render_TriangleEdgeSetup:loc_19933j
					; Render_TriangleEdgeSetup+213j
		pop	di
		pop	si
		leave
		retn
Render_TriangleEdgeSetup	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_EdgeInterpolateAttrib (sub_26955 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — near,86L — interpolation incrémentale de plusieurs
; canaux (couleur/profondeur) le long d'une arête, avec bornage entre segments : interpolateur
; d'attributs (couleur/Z) le long d'une arête de polygone.
; ==============================================================================================
Render_EdgeInterpolateAttrib	proc near		; CODE XREF: Render_TriangleEdgeSetup+201p
					; Render_TriangleEdgeSetup+208p
		mov	ax, [bx+14h]
		add	cx, ax
		cmp	ax, [bx+16h]
		jge	short loc_19B22
		cmp	cx, ax
		jle	short loc_19B22
		mov	dx, [bx+16h]
		cmp	cx, dx
		jg	short loc_19B0E
		mov	dx, cx

loc_19B0E:				; CODE XREF: Render_EdgeInterpolateAttrib+13j
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+4]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_19B22:				; CODE XREF: Render_EdgeInterpolateAttrib+8j Render_EdgeInterpolateAttrib+Cj
		cmp	ax, [bx+18h]
		jge	short loc_19B48
		cmp	cx, ax
		jle	short loc_19B48
		mov	dx, [bx+18h]
		cmp	cx, dx
		jg	short loc_19B34
		mov	dx, cx

loc_19B34:				; CODE XREF: Render_EdgeInterpolateAttrib+39j
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+8]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_19B48:				; CODE XREF: Render_EdgeInterpolateAttrib+2Ej
					; Render_EdgeInterpolateAttrib+32j
		cmp	ax, [bx+1Ah]
		jge	short loc_19B6E
		cmp	cx, ax
		jle	short loc_19B6E
		mov	dx, [bx+1Ah]
		cmp	cx, dx
		jg	short loc_19B5A
		mov	dx, cx

loc_19B5A:				; CODE XREF: Render_EdgeInterpolateAttrib+5Fj
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+0Ch]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_19B6E:				; CODE XREF: Render_EdgeInterpolateAttrib+54j
					; Render_EdgeInterpolateAttrib+58j
		cmp	cx, ax
		jle	short locret_19B8F
		mov	dx, [bx+1Ch]
		cmp	cx, dx
		jg	short loc_19B7B
		mov	dx, cx

loc_19B7B:				; CODE XREF: Render_EdgeInterpolateAttrib+80j
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+10h]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

locret_19B8F:				; CODE XREF: Render_EdgeInterpolateAttrib+79j
		retn
Render_EdgeInterpolateAttrib	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_GradientStepSelect (sub_269EE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — near,20L — sélectionne un delta d'incrément parmi 4 selon la
; position Y courante (table de gradient par bande) : sélecteur de pas d'interpolation par
; bande verticale.
; ==============================================================================================
Render_GradientStepSelect	proc near		; CODE XREF: Render_ScanlineAdvance+Cp
					; Render_ScanlineAdvance+14p
		mov	ax, [bx+14h]
		mov	ecx, [bx+4]
		cmp	ax, [bx+16h]
		jl	short loc_19BB2
		mov	ecx, [bx+8]
		cmp	ax, [bx+18h]
		jl	short loc_19BB2
		mov	ecx, [bx+0Ch]
		cmp	ax, [bx+1Ah]
		jl	short loc_19BB2
		mov	ecx, [bx+10h]

loc_19BB2:				; CODE XREF: Render_GradientStepSelect+Aj
					; Render_GradientStepSelect+13j ...
		add	[bx], ecx
		inc	word ptr [bx+14h]
		retn
Render_GradientStepSelect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Render_ScanlineAdvance
; (sub_26A17 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near,18L — avance deux arêtes du triangle (sub_269EE) et un compteur de ligne :
; avance d'une ligne de balayage (scanline) dans le rasterizer.
; ==============================================================================================
Render_ScanlineAdvance	proc near		; CODE XREF: sub_19C02+499p
					; sub_19C02+4B0p
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
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_ShadeIntensityClamp (sub_26A3A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — near,24L — calcule un ratio 8-bit (division fixed-
; point), le borne entre 0x18 et 0xE7 : calcul d'intensité lumineuse bornée (Gouraud shading
; clamp).
; ==============================================================================================
Render_ShadeIntensityClamp	proc near		; CODE XREF: sub_19C02+D7p
					; sub_19C02+E6p ...
		mov	dx, 80h	; '�'
		add	ecx, eax
		jz	short loc_19BEF
		shl	eax, 8
		cdq
		idiv	ecx
		mov	dx, ax

loc_19BEF:				; CODE XREF: Render_ShadeIntensityClamp+6j
		mov	ax, dx
		cmp	ax, 18h
		jge	short loc_19BF9
		mov	ax, 18h

loc_19BF9:				; CODE XREF: Render_ShadeIntensityClamp+18j
		cmp	ax, 0E7h ; '�'
		jle	short locret_19C01
		mov	ax, 0E7h ; '�'

locret_19C01:				; CODE XREF: Render_ShadeIntensityClamp+20j
		retn
Render_ShadeIntensityClamp	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_19C02	proc far		; CODE XREF: seg042:00D6P

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
		cld
		mov	si, [bp+arg_0]
		push	ds
		pop	es
		assume es:dseg
		mov	di, 2F82h
		mov	cx, 0Ch
		rep movsb
		mov	eax, [bp+arg_10]
		mov	dword_45FAE, eax
		mov	eax, [bp+arg_8]
		mov	dword_45F9A, eax
		mov	ax, [bp+arg_C]
		mov	word_45F9E, ax
		mov	ax, [bp+arg_E]
		mov	word_45FA0, ax
		mov	bx, [bp+arg_2]
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, [bx+2]
		cmp	ax, [di+2]
		jg	short loc_19C4B
		jl	short loc_19C4D
		mov	ax, [bx]
		cmp	ax, [di]
		jle	short loc_19C4D

loc_19C4B:				; CODE XREF: sub_19C02+3Fj
		xchg	bx, di

loc_19C4D:				; CODE XREF: sub_19C02+41j
					; sub_19C02+47j
		mov	ax, [si+2]
		cmp	ax, [di+2]
		jg	short loc_19C5D
		jl	short loc_19C5F
		mov	ax, [si]
		cmp	ax, [di]
		jle	short loc_19C5F

loc_19C5D:				; CODE XREF: sub_19C02+51j
		xchg	si, di

loc_19C5F:				; CODE XREF: sub_19C02+53j
					; sub_19C02+59j
		mov	ax, [bx+2]
		cmp	ax, [si+2]
		jg	short loc_19C6F
		jl	short loc_19C71
		mov	ax, [bx]
		cmp	ax, [si]
		jle	short loc_19C71

loc_19C6F:				; CODE XREF: sub_19C02+63j
		xchg	bx, si

loc_19C71:				; CODE XREF: sub_19C02+65j
					; sub_19C02+6Bj
		mov	[bp+arg_2], bx
		mov	[bp+arg_4], si
		mov	[bp+arg_6], di
		xor	cx, cx
		mov	ax, word_45FA6
		cmp	ax, [bx]
		jle	short loc_19C85
		inc	cl

loc_19C85:				; CODE XREF: sub_19C02+7Fj
		cmp	ax, [si]
		jle	short loc_19C8B
		inc	cl

loc_19C8B:				; CODE XREF: sub_19C02+85j
		cmp	ax, [di]
		jle	short loc_19C91
		inc	cl

loc_19C91:				; CODE XREF: sub_19C02+8Bj
		mov	ax, word_45FAA
		cmp	ax, [bx]
		jge	short loc_19C9A
		inc	ch

loc_19C9A:				; CODE XREF: sub_19C02+94j
		cmp	ax, [si]
		jge	short loc_19CA0
		inc	ch

loc_19CA0:				; CODE XREF: sub_19C02+9Aj
		cmp	ax, [di]
		jge	short loc_19CA6
		inc	ch

loc_19CA6:				; CODE XREF: sub_19C02+A0j
		mov	[bp+var_12F], cx
		cmp	cl, 3
		jz	short loc_19CB6
		cmp	ch, 3
		jz	short loc_19CB6
		jmp	short loc_19CB9
; ���������������������������������������������������������������������������

loc_19CB6:				; CODE XREF: sub_19C02+ABj
					; sub_19C02+B0j
		jmp	loc_1A0CC
; ���������������������������������������������������������������������������

loc_19CB9:				; CODE XREF: sub_19C02+B2j
		mov	ax, [bx+2]
		cmp	ax, word_45FAC
		jle	short loc_19CC5
		jmp	loc_1A0CC
; ���������������������������������������������������������������������������

loc_19CC5:				; CODE XREF: sub_19C02+BEj
		mov	ax, [di+2]
		cmp	ax, word_45FA8
		jge	short loc_19CD1
		jmp	loc_1A0CC
; ���������������������������������������������������������������������������

loc_19CD1:				; CODE XREF: sub_19C02+CAj
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
		add	sp, 8
		lea	si, [bp+var_BA]
		push	[bp+arg_4]
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
		jz	short loc_19D5F
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_19D5F
		mov	ax, [bp+var_AB]
		cmp	ax, word_45FA8
		jg	short loc_19D5B
		mov	byte ptr [bp+var_BA], 0
		jmp	short loc_19D5F
; ���������������������������������������������������������������������������

loc_19D5B:				; CODE XREF: sub_19C02+150j
		dec	[bp+var_AB]

loc_19D5F:				; CODE XREF: sub_19C02+13Fj
					; sub_19C02+146j ...
		cmp	byte ptr [bp+var_5D], 0
		jnz	short loc_19DE3
		mov	byte ptr [bp+var_BA], 1
		mov	byte ptr [bp+var_5D], 1
		mov	bx, [bp+arg_6]
		movsx	eax, word ptr [bx]
		shl	eax, 10h
		mov	[bp+var_58], eax
		movzx	eax, word ptr [bx+6]
		shl	eax, 8
		mov	[bp+var_3C], eax
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
		jmp	loc_19FEC
; ���������������������������������������������������������������������������

loc_19DE3:				; CODE XREF: sub_19C02+161j
		lea	bx, [bp+var_5D]
		lea	si, [bp+var_BA]
		lea	di, [bp+var_117]
		cmp	byte ptr [si], 0
		jz	short loc_19E27
		mov	edx, [si+9]
		cmp	edx, [bx+9]
		jg	short loc_19E12
		mov	[bp+var_119], si
		mov	[bp+var_11D], di
		mov	[bp+var_11B], bx
		mov	[bp+var_11F], 0
		jmp	short loc_19E5C
; ���������������������������������������������������������������������������
		align 2

loc_19E12:				; CODE XREF: sub_19C02+1F9j
		mov	[bp+var_119], bx
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], si
		mov	[bp+var_11F], di
		jmp	short loc_19E5C
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_19E27:				; CODE XREF: sub_19C02+1EFj
		mov	edx, [di+9]
		cmp	edx, [bx+9]
		jl	short loc_19E48
		mov	[bp+var_119], di
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], bx
		mov	[bp+var_11F], 0
		jmp	short loc_19E5C
; ���������������������������������������������������������������������������
		align 2

loc_19E48:				; CODE XREF: sub_19C02+22Dj
		mov	[bp+var_119], bx
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], di
		mov	[bp+var_11F], 0

loc_19E5C:				; CODE XREF: sub_19C02+20Dj
					; sub_19C02+222j ...
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]
		cmp	byte ptr [bp+var_BA], 0
		jnz	short loc_19EAE
		cmp	[bp+var_A7], 0
		jnz	short loc_19EAE
		mov	ax, [bp+var_121]
		shl	ax, 7
		mov	[bp+var_127], ax
		mov	ax, 4000h
		mov	[bp+var_12B], ax
		mov	cx, [si+11h]
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	cx
		mov	[bp+var_129], ax
		mov	[bp+var_12D], 0
		mov	cx, [bp+var_A7]
		or	cx, cx
		jz	short loc_19EAB
		mov	ax, [bp+var_129]
		imul	cx
		add	[bp+var_127], ax

loc_19EAB:				; CODE XREF: sub_19C02+29Dj
		jmp	loc_19FEC
; ���������������������������������������������������������������������������

loc_19EAE:				; CODE XREF: sub_19C02+267j
					; sub_19C02+26Ej
		cmp	byte ptr [bp+var_117], 0
		jnz	short loc_19EF8
		cmp	[bp+var_104], 0
		jnz	short loc_19EF8
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
		jz	short loc_19EF5
		mov	ax, [bp+var_129]
		imul	cx
		add	[bp+var_127], ax

loc_19EF5:				; CODE XREF: sub_19C02+2E7j
		jmp	loc_19FEC
; ���������������������������������������������������������������������������

loc_19EF8:				; CODE XREF: sub_19C02+2B1j
					; sub_19C02+2B8j
		mov	ax, 4000h
		mov	[bp+var_127], ax
		mov	bx, [bp+arg_2]
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	cx, [di+2]
		sub	cx, [bx+2]
		movsx	ecx, cx
		mov	ax, [si+2]
		sub	ax, [bx+2]
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
		jmp	short loc_19F60
; ���������������������������������������������������������������������������
		or	ecx, ecx
		jz	short loc_19F60
		mov	eax, edx
		cdq
		shld	edx, eax, 0Fh
		shl	eax, 0Fh
		idiv	ecx

loc_19F60:				; CODE XREF: sub_19C02+346j
					; sub_19C02+34Bj
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]
		lea	cx, [bp+var_5D]
		cmp	cx, si
		jz	short loc_19F74
		neg	ax
		add	ax, 8000h

loc_19F74:				; CODE XREF: sub_19C02+36Bj
		cmp	ax, 0C00h
		jge	short loc_19F7C
		mov	ax, 0C00h

loc_19F7C:				; CODE XREF: sub_19C02+375j
		cmp	ax, 7380h
		jle	short loc_19F84
		mov	ax, 7380h

loc_19F84:				; CODE XREF: sub_19C02+37Dj
		mov	[bp+var_12B], ax
		cmp	byte ptr [bp+var_BA], 0
		jz	short loc_19FAF
		mov	ax, [bp+var_12B]
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	[bp+var_A9]
		mov	[bp+var_129], ax
		mov	cx, [bp+var_A7]
		or	cx, cx
		jz	short loc_19FAF
		imul	cx
		add	[bp+var_127], ax

loc_19FAF:				; CODE XREF: sub_19C02+38Bj
					; sub_19C02+3A5j
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_19FD5
		mov	ax, 4000h
		sub	ax, [bp+var_12B]
		sbb	dx, dx
		idiv	[bp+var_106]
		mov	[bp+var_12D], ax
		mov	cx, [bp+var_104]
		or	cx, cx
		jz	short loc_19FD5
		imul	cx
		add	[bp+var_12B], ax

loc_19FD5:				; CODE XREF: sub_19C02+3B2j
					; sub_19C02+3CBj
		cmp	byte ptr [bp+var_BA], 0
		jnz	short loc_19FEC
		mov	ax, [bp+var_12B]
		mov	[bp+var_127], ax
		mov	ax, [bp+var_12D]
		mov	[bp+var_129], ax

loc_19FEC:				; CODE XREF: sub_19C02+1DEj
					; sub_19C02:loc_19EABj	...
		mov	ax, 78h	; 'x'
		mov	cx, 214h
		cmp	dword_45FAE, 0
		jz	short loc_1A000
		mov	ax, 4AEh
		mov	cx, 68Dh

loc_1A000:				; CODE XREF: sub_19C02+3F6j
		cmp	[bp+var_12F], 0
		jz	short loc_1A009
		mov	ax, cx

loc_1A009:				; CODE XREF: sub_19C02+403j
		mov	[bp+var_131], ax
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]

loc_1A015:				; CODE XREF: sub_19C02+4B3j
					; sub_19C02+4C7j
		mov	eax, [si+5]
		shr	eax, 10h
		mov	word_45FB4, ax
		mov	ax, [si+0Dh]
		mov	word_45FB6, ax
		lea	bx, [si+21h]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_45FB8, ax
		lea	bx, [si+3Fh]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_45FBA, ax
		mov	eax, [di+5]
		shr	eax, 10h
		mov	word_45FBC, ax
		mov	ax, [di+0Dh]
		mov	word_45FBE, ax
		lea	bx, [di+21h]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_45FC0, ax
		lea	bx, [di+3Fh]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_45FC2, ax
		mov	ax, [bp+var_127]
		shr	ax, 7
		mov	word_45FB2, ax
		call	[bp+var_131]
		mov	ax, [bp+var_129]
		add	[bp+var_127], ax
		mov	bx, si
		call	Render_ScanlineAdvance
		jnb	short loc_1A0B0
		mov	si, [bp+var_11D]
		or	si, si
		jz	short loc_1A0CC
		mov	ax, [bp+var_12D]
		mov	[bp+var_129], ax

loc_1A0B0:				; CODE XREF: sub_19C02+49Cj
		mov	bx, di
		call	Render_ScanlineAdvance
		jnb	loc_1A015
		mov	di, [bp+var_11F]
		or	di, di
		jz	short loc_1A0CC
		mov	ax, [bp+var_12D]
		mov	[bp+var_129], ax
		jmp	loc_1A015
; ���������������������������������������������������������������������������

loc_1A0CC:				; CODE XREF: sub_19C02:loc_19CB6j
					; sub_19C02+C0j ...
		pop	di
		pop	si
		leave
		retf
sub_19C02	endp

seg035		ends
