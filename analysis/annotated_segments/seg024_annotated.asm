seg024		segment	byte public 'CODE' use16
		assume cs:seg024
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_1A06A:				; DATA XREF: seg339:0AAFo seg339:0ABFo ...
		push	bp
		mov	bp, sp

loc_1A06D:				; DATA XREF: seg216:017Eo
		xor	eax, eax
		shld	edx, eax, 10h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A077:				; DATA XREF: seg339:off_6DBE3o
					; seg339:0B43o
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0
		mov	word ptr [bp-6], 0
		push	word ptr [bp-6]
		lea	ax, [bp-4]
		push	ax

loc_1A093:
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr UI_NotifyChildrenMove
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A0A1:				; DATA XREF: seg339:0A7Eo
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+0Ah]
		mov	bx, [si]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_1A0DF
		cmp	byte ptr [si+4], 1
		jnz	short loc_1A0DF
		mov	ax, [bx+89h]
		mov	[bp-2],	ax
		mov	bx, [si]
		push	word ptr [bx+89h]
		push	0C30h
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 8
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		jmp	short loc_1A0E7
; ���������������������������������������������������������������������������

loc_1A0DF:				; CODE XREF: seg024:0051j seg024:0057j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0

loc_1A0E7:				; CODE XREF: seg024:007Dj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A0EA:				; DATA XREF: seg339:off_6DB1Ao
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	bx, [si]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_1A169
		cmp	byte ptr [si+4], 1
		jz	short loc_1A109
		cmp	byte ptr [si+4], 2
		jnz	short loc_1A169

loc_1A109:				; CODE XREF: seg024:00A1j
		mov	di, [si]
		add	di, 8Bh	; '�'
		mov	eax, [di]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 6300h
		jle	short loc_1A125
		mov	ax, 1
		jmp	short loc_1A127
; ���������������������������������������������������������������������������

loc_1A125:				; CODE XREF: seg024:00BEj
		xor	ax, ax

loc_1A127:				; CODE XREF: seg024:00C3j
		or	al, al
		jz	short loc_1A13B

loc_1A12B:
		mov	dword ptr [bp-8], 6300h

loc_1A133:
		mov	eax, [bp-8]

loc_1A137:
		mov	[bp-4],	eax

loc_1A13B:				; CODE XREF: seg024:00C9j
		push	2
		mov	ax, [si]

loc_1A13F:
		add	ax, 8Bh	; '�'
		push	ax

loc_1A143:
		lea	ax, [bp-1Ch]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	0C35h
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 8
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		jmp	short loc_1A171
; ���������������������������������������������������������������������������

loc_1A169:				; CODE XREF: seg024:009Bj seg024:00A7j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0

loc_1A171:				; CODE XREF: seg024:0107j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A175:				; DATA XREF: seg339:0A56o
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+0Ah]
		cmp	byte ptr [si+4], 2
		jz	short loc_1A18E
		cmp	byte ptr [si+4], 1
		jz	short loc_1A18E
		jmp	loc_1A253
; ���������������������������������������������������������������������������

loc_1A18E:				; CODE XREF: seg024:0123j seg024:0129j
		mov	bx, [si]
		mov	ax, [bx+93h]

loc_1A194:
		mov	dx, [bx+91h]
		mov	[bp-4],	ax
		mov	[bp-6],	dx
		cmp	dword ptr [bp-6], 0
		jnz	short loc_1A1A8
		jmp	loc_1A253
; ���������������������������������������������������������������������������

loc_1A1A8:				; CODE XREF: seg024:0143j
		mov	dx, [bx+8Fh]
		cmp	dx, 3E7h
		jle	short loc_1A1B5
		mov	dx, 3E7h

loc_1A1B5:				; CODE XREF: seg024:0150j
		les	bx, [bp-6]
		cmp	dword ptr es:[bx], 0
		jz	short loc_1A1C8
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_1A1CA
; ���������������������������������������������������������������������������

loc_1A1C8:				; CODE XREF: seg024:015Dj
		xor	ax, ax

loc_1A1CA:				; CODE XREF: seg024:0166j
		mov	[bp-2],	ax
		mov	cx, 0Ah		; switch 10 cases
		mov	bx, offset word_1A25E

loc_1A1D3:				; CODE XREF: seg024:017Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp-2]
		jz	short loc_1A1E2
		add	bx, 2
		loop	loc_1A1D3
		jmp	short loc_1A1E6	; default
; ���������������������������������������������������������������������������

loc_1A1E2:				; CODE XREF: seg024:0179j
		jmp	word ptr cs:[bx+14h] ; switch jump
; ���������������������������������������������������������������������������

loc_1A1E6:				; CODE XREF: seg024:0180j
		push	0C3Ah		; default
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 6
		jmp	short loc_1A249
; ���������������������������������������������������������������������������

loc_1A1F7:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x1
		push	0C43h
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A1FD:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x2
		push	0C4Dh
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A203:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x100
		push	0C57h
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A209:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x4
		push	0C62h
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A20F:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		mov	bx, [si]	; case 0x8
		mov	bx, [bx+2]
		les	bx, [bx+5Ah]
		mov	dx, es:[bx+1Eh]
		push	dx
		push	0C6Dh
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A221:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x10
		push	0C75h
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A227:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x20
		push	0C7Dh
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A22D:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x40
		push	0C85h

loc_1A231:
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A233:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x80
		push	0C91h
		jmp	short loc_1A23D
; ���������������������������������������������������������������������������

loc_1A239:				; CODE XREF: seg024:loc_1A1E2j
					; DATA XREF: seg024:0212o
		push	dx		; case 0x800
		push	0C9Bh

loc_1A23D:				; CODE XREF: seg024:019Bj seg024:01A1j ...
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 8

loc_1A249:				; CODE XREF: seg024:0195j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		jmp	short loc_1A25B
; ���������������������������������������������������������������������������

loc_1A253:				; CODE XREF: seg024:012Bj seg024:0145j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0

loc_1A25B:				; CODE XREF: seg024:01F1j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
word_1A25E	dw	1,     2,     4,     8 ; DATA XREF: seg024:0170o
		dw    10h,   20h,   40h,   80h ; value table for switch	statement
		dw   100h,  800h
		dw offset loc_1A1F7	; jump table for switch	statement
		dw offset loc_1A1FD
		dw offset loc_1A209
		dw offset loc_1A20F
		dw offset loc_1A221
		dw offset loc_1A227
		dw offset loc_1A22D
		dw offset loc_1A233
		dw offset loc_1A203
		dw offset loc_1A239
; ���������������������������������������������������������������������������

loc_1A286:				; DATA XREF: seg339:off_6DAF2o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		cmp	byte ptr [si+4], 0
		jnz	short loc_1A2B0
		push	0CA5h

loc_1A2A1:				; CODE XREF: seg024:02A0j seg024:02A5j ...
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 6
		jmp	loc_1A357
; ���������������������������������������������������������������������������

loc_1A2B0:				; CODE XREF: seg024:023Cj
		mov	bx, [si]
		mov	ax, [bx+93h]
		mov	dx, [bx+91h]
		mov	[bp-2],	ax
		mov	[bp-4],	dx

loc_1A2C0:
		cmp	dword ptr [bp-4], 0

loc_1A2C5:
		jnz	short loc_1A2CA
		jmp	loc_1A34F	; default
; ���������������������������������������������������������������������������

loc_1A2CA:				; CODE XREF: seg024:loc_1A2C5j
		mov	al, [si+4]

loc_1A2CD:
		mov	ah, 0

loc_1A2CF:
		cmp	ax, 2

loc_1A2D2:
		jz	short loc_1A2D6

loc_1A2D4:
		jmp	short loc_1A316
; ���������������������������������������������������������������������������

loc_1A2D6:				; CODE XREF: seg024:loc_1A2D2j
		les	bx, [bp-4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_1A2E9
		les	bx, es:[bx]
		mov	al, es:[bx+4Dh]
		jmp	short loc_1A2EB
; ���������������������������������������������������������������������������

loc_1A2E9:				; CODE XREF: seg024:027Ej
		mov	al, 8

loc_1A2EB:				; CODE XREF: seg024:0287j
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 7		; switch 8 cases
		ja	short loc_1A34F	; default
		shl	bx, 1
		jmp	cs:off_1A35A[bx] ; switch jump

loc_1A2FB:				; DATA XREF: seg024:off_1A35Ao
		jmp	short loc_1A34F	; case 0x1
; ���������������������������������������������������������������������������

loc_1A2FD:				; CODE XREF: seg024:0296j
					; DATA XREF: seg024:off_1A35Ao
		push	0CA9h		; case 0x3
		jmp	short loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A302:				; CODE XREF: seg024:0296j
					; DATA XREF: seg024:off_1A35Ao
		push	0CADh		; case 0x4
		jmp	short loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A307:				; CODE XREF: seg024:0296j
					; DATA XREF: seg024:off_1A35Ao
		push	0CB2h		; case 0x5
		jmp	short loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A30C:				; CODE XREF: seg024:0296j
					; DATA XREF: seg024:off_1A35Ao
		push	0CB7h		; case 0x6
		jmp	short loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A311:				; CODE XREF: seg024:0296j
					; DATA XREF: seg024:off_1A35Ao
		push	0CBBh		; case 0x0
		jmp	short loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A316:				; CODE XREF: seg024:loc_1A2D4j
		les	bx, [bp-4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_1A329
		les	bx, es:[bx]
		mov	al, es:[bx+4Dh]
		jmp	short loc_1A32B
; ���������������������������������������������������������������������������

loc_1A329:				; CODE XREF: seg024:02BEj
		mov	al, 8

loc_1A32B:				; CODE XREF: seg024:02C7j
		mov	ah, 0
		or	ax, ax
		jz	short loc_1A349

loc_1A331:
		cmp	ax, 1
		jz	short loc_1A33D
		cmp	ax, 2
		jz	short loc_1A343
		jmp	short loc_1A34F	; default
; ���������������������������������������������������������������������������

loc_1A33D:				; CODE XREF: seg024:02D4j
		push	0CC0h
		jmp	loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A343:				; CODE XREF: seg024:02D9j
		push	0CC4h
		jmp	loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A349:				; CODE XREF: seg024:02CFj
		push	0CC8h
		jmp	loc_1A2A1
; ���������������������������������������������������������������������������

loc_1A34F:				; CODE XREF: seg024:0267j seg024:0292j ...
		les	bx, [bp+6]	; default
		mov	byte ptr es:[bx+1Ah], 0

loc_1A357:				; CODE XREF: seg024:024Dj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_1A35A	dw offset loc_1A311	; DATA XREF: seg024:0296r
		dw offset loc_1A2FB	; jump table for switch	statement
		dw offset loc_1A2FB
		dw offset loc_1A2FD
		dw offset loc_1A302
		dw offset loc_1A307
		dw offset loc_1A30C
		dw offset loc_1A311
; ���������������������������������������������������������������������������

loc_1A36A:				; DATA XREF: seg339:off_6DADEo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		mov	bx, [si]
		mov	ax, [bx+5Ch]
		mov	[bp-2],	ax
		mov	ax, [bx+2]
		mov	[bp-4],	ax
		les	bx, [bx+91h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_1A3BB
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		mov	bx, [si]
		mov	bx, [bx+91h]
		push	large dword ptr	es:[bx]
		mov	bx, [si]
		mov	bx, [bx+91h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+14h]
		add	sp, 8
		jmp	short loc_1A3BD
; ���������������������������������������������������������������������������

loc_1A3BB:				; CODE XREF: seg024:0335j
		mov	al, 0

loc_1A3BD:				; CODE XREF: seg024:0359j
		or	al, al
		jz	short loc_1A3C6
		push	0CCDh
		jmp	short loc_1A3C9
; ���������������������������������������������������������������������������

loc_1A3C6:				; CODE XREF: seg024:035Fj
		push	0CD4h

loc_1A3C9:				; CODE XREF: seg024:0364j
		push	large dword ptr	[bp+6]

loc_1A3CD:
		call	String_ConstructWithFallback
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A3D8:				; DATA XREF: seg339:0A1Ao
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		mov	si, [si]
		add	si, 34h	; '4'
		mov	eax, [si]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 900h
		jl	short loc_1A408
		mov	dword ptr [bp-4], 900h

loc_1A408:				; CODE XREF: seg024:039Ej
		push	1
		lea	ax, [bp-4]
		push	ax
		lea	ax, [bp-18h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	0CDBh
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 8
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A42D:				; DATA XREF: seg339:0A06o
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si

loc_1A434:
		mov	si, [bp+0Ah]

loc_1A437:
		les	bx, [bp+6]

loc_1A43A:
		mov	byte ptr es:[bx+1Ah], 1
		mov	si, [si]

loc_1A441:
		add	si, 38h	; '8'
		mov	eax, [si]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0A00h
		jl	short loc_1A45D
		mov	dword ptr [bp-4], 9E6h

loc_1A45D:				; CODE XREF: seg024:03F3j
		push	1
		lea	ax, [bp-4]
		push	ax
		lea	ax, [bp-18h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	0CDFh
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 8
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A482:				; DATA XREF: seg339:09F2o
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		mov	si, [si]
		add	si, 58h	; 'X'
		mov	eax, [si]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0A00h
		jl	short loc_1A4B2
		mov	dword ptr [bp-4], 9E6h

loc_1A4B2:				; CODE XREF: seg024:0448j
		push	2
		lea	ax, [bp-4]
		push	ax
		lea	ax, [bp-18h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9

loc_1A4C1:
		add	sp, 6
		push	ax
		push	0CE3h
		push	large dword ptr	[bp+6]

loc_1A4CC:
		call	String_ConstructWithFallback
		add	sp, 8
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A4D7:				; DATA XREF: seg339:09DEo
		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		mov	si, [bp+0Ah]
		lea	ax, [bp-30h]
		push	ax
		mov	ax, word_706A0
		add	ax, 68h	; 'h'
		push	ax
		call	Lexer_ResolveConstantAlt
		add	sp, 4
		or	al, al
		jnz	short loc_1A4FB
		jmp	loc_1A5CE
; ���������������������������������������������������������������������������

loc_1A4FB:				; CODE XREF: seg024:0496j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		mov	si, [si]
		add	si, 4
		mov	eax, [bp-30h]
		sub	eax, [si]
		mov	[bp-3Ch], eax
		mov	eax, [bp-2Ch]
		sub	eax, [si+4]
		mov	[bp-38h], eax
		mov	eax, [bp-28h]
		sub	eax, [si+8]
		mov	[bp-34h], eax
		mov	eax, [bp-3Ch]
		mov	[bp-48h], eax
		mov	eax, [bp-38h]
		mov	[bp-44h], eax
		mov	eax, [bp-34h]
		mov	[bp-40h], eax
		push	eax
		push	large dword ptr	[bp-44h]
		push	large dword ptr	[bp-48h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		mov	edx, eax
		mov	ecx, dword_70489
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		sar	eax, 8
		mov	[bp-0Ch], eax
		mov	[bp-14h], eax
		shl	eax, 8
		mov	edx, [bp-4]
		sub	edx, eax
		mov	[bp-18h], edx
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		imul	eax, 0Ah
		mov	[bp-20h], eax
		mov	[bp-24h], eax
		sar	eax, 8
		mov	[bp-10h], eax
		push	eax
		push	large dword ptr	[bp-0Ch]
		push	0CE7h
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback

loc_1A5C9:
		add	sp, 0Eh
		jmp	short loc_1A5D6
; ���������������������������������������������������������������������������

loc_1A5CE:				; CODE XREF: seg024:0498j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0

loc_1A5D6:				; CODE XREF: seg024:056Cj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A5D9:				; DATA XREF: seg339:09CAo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		mov	bx, [si]
		mov	bx, [bx+2]
		push	word ptr [bx+51h]
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_1A60F
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		jmp	short loc_1A617
; ���������������������������������������������������������������������������

loc_1A60F:				; CODE XREF: seg024:05A3j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0

loc_1A617:				; CODE XREF: seg024:05ADj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A61A:				; DATA XREF: seg339:09B6o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		mov	bx, [si]
		mov	bx, [bx+2]
		push	word ptr [bx+51h]
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 1
		and	ax, 1
		or	al, al

loc_1A643:
		jz	short loc_1A64F
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		jmp	short loc_1A657
; ���������������������������������������������������������������������������

loc_1A64F:				; CODE XREF: seg024:loc_1A643j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0

loc_1A657:				; CODE XREF: seg024:05EDj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A65A:				; DATA XREF: seg339:09A2o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		mov	bx, [si]
		mov	bx, [bx+2]
		push	word ptr [bx+51h]
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		and	ax, 1
		or	al, al
		jz	short loc_1A68D
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		jmp	short loc_1A695
; ���������������������������������������������������������������������������

loc_1A68D:				; CODE XREF: seg024:0621j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0

loc_1A695:				; CODE XREF: seg024:062Bj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A698:				; DATA XREF: seg339:098Eo
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		mov	bx, [si]
		mov	eax, [bx+40h]
		mov	edx, dword_70485
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8],	eax

loc_1A6C1:
		mov	eax, [bp-8]

loc_1A6C5:
		mov	[bp-0Ch], eax

loc_1A6C9:
		sar	eax, 8
		mov	[bp-4],	eax

loc_1A6D1:
		mov	ebx, 3E8h

loc_1A6D7:
		cdq
		idiv	ebx
		mov	[bp-10h], eax
		imul	eax, 3E8h
		push	eax
		mov	eax, [bp-4]
		pop	edx
		sub	eax, edx
		mov	ebx, 64h ; 'd'
		cdq
		idiv	ebx
		mov	[bp-14h], eax
		push	eax
		push	large dword ptr	[bp-10h]
		push	0CF2h
		push	large dword ptr	[bp+6]
		call	String_ConstructWithFallback
		add	sp, 0Eh
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A719:				; DATA XREF: seg339:097Ao
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 1
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	ax, [bx+55h]

loc_1A733:
		or	ax, [bx+57h]
		jz	short loc_1A754
		mov	bx, [si]
		mov	bx, [bx+2]
		push	large dword ptr	[bx+55h]
		mov	bx, [si]
		mov	bx, [bx+2]
		les	bx, [bx+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_1A758
; ���������������������������������������������������������������������������

loc_1A754:				; CODE XREF: seg024:06D6j
		xor	dx, dx
		xor	ax, ax

loc_1A758:				; CODE XREF: seg024:06F2j
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		les	bx, [bp-4]
		mov	al, es:[bx+1Eh]
		cbw
		mov	dx, ax
		or	dx, dx
		jge	short loc_1A770
		xor	dx, dx
		jmp	short loc_1A778
; ���������������������������������������������������������������������������

loc_1A770:				; CODE XREF: seg024:070Aj
		cmp	dx, 0Ah
		jle	short loc_1A778
		mov	dx, 0Ah

loc_1A778:				; CODE XREF: seg024:070Ej seg024:0713j
		push	ds
		mov	bx, dx
		shl	bx, 1
		push	word ptr [bx+0BD8h]
		mov	ax, [bp+6]
		add	ax, 6
		push	word ptr [bp+8]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A796:				; DATA XREF: seg339:0966o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	al, byte_72362
		mov	es:[bx+1Ah], al
		mov	dl, 54h	; 'T'
		cmp	byte_72366, 0
		jz	short loc_1A7AE
		mov	dl, 43h	; 'C'

loc_1A7AE:				; CODE XREF: seg024:074Aj
		les	bx, [bp+6]
		mov	es:[bx+6], dl
		mov	byte ptr es:[bx+7], 0
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,18L — wrapper trivial vers sub_1A80D : notification de rafraîchissement d'un conteneur
; UI (widget parent).
; ==============================================================================================
UI_NotifyRefresh	proc far		; CODE XREF: seg020:0D24P seg021:0252P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_1A7BF:
		push	large [bp+arg_0]
		nop
		push	cs

loc_1A7C5:
		call	near ptr UI_NotifyChildrenDrawClipped
		add	sp, 4
		pop	bp
		retf
UI_NotifyRefresh	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — itère les enfants (+8, compteur +4) appelant vtable[0] avec 2 arguments :
; notification (init/move) des enfants d'un conteneur UI, même famille que seg017/023.
; ==============================================================================================
UI_NotifyChildrenMove	proc far		; CODE XREF: seg020:0266P seg020:0338P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_1A801
; ���������������������������������������������������������������������������

loc_1A7E4:				; CODE XREF: UI_NotifyChildrenMove+3Bj
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 8
		inc	si
		add	word ptr [bp+var_4], 4

loc_1A801:				; CODE XREF: UI_NotifyChildrenMove+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_1A7E4
		pop	si
		leave
		retf
UI_NotifyChildrenMove	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,56L — itère les enfants (+8, compteur +4) appelant vtable[4] avec 4 arguments (rectangle
; + flag) : notification (draw avec zone de clipping) des enfants d'un conteneur UI.
; ==============================================================================================
UI_NotifyChildrenDrawClipped	proc far		; CODE XREF: UI_NotifyRefresh:loc_1A7C5p

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		mov	bx, es:[bx+2]
		mov	ax, [bx+2]
		add	ax, 2
		mov	[bp+var_6], ax
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+2]

loc_1A834:
		add	ax, 0Dh
		mov	[bp+var_8], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+13h]
		mov	[bp+var_A], ax
		xor	si, si
		jmp	short loc_1A871
; ���������������������������������������������������������������������������

loc_1A848:				; CODE XREF: UI_NotifyChildrenDrawClipped+6Bj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Dh]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_6]
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 0Ch
		inc	si
		add	word ptr [bp+var_4], 4

loc_1A871:				; CODE XREF: UI_NotifyChildrenDrawClipped+39j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_1A848
		pop	si
		leave
		retf
UI_NotifyChildrenDrawClipped	endp

; ���������������������������������������������������������������������������

loc_1A87D:				; DATA XREF: seg339:0ADFo seg339:0AFFo ...
		push	bp
		mov	bp, sp

loc_1A880:
		les	bx, [bp+6]
		mov	eax, es:[bx+0Eh]
		shld	edx, eax, 10h
		pop	bp
		retf
seg024		ends
