seg028		segment	byte public 'CODE' use16
		assume cs:seg028
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_13D22	proc far		; CODE XREF: sub_14913+1Cp
					; sub_149E9+1Cp ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp

loc_13D23:				; DATA XREF: seg170:019Eo
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+1], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+5], eax
		les	bx, [bp+arg_C]
		mov	al, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+9], al
		pop	bp
		retf
sub_13D22	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_13D4D	proc far		; CODE XREF: sub_14A2C+1Fp
					; sub_C4A60+20FP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_C]
		mov	es:[bx+0Eh], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+6], eax
		pop	bp
		retf
sub_13D4D	endp

; ���������������������������������������������������������������������������

loc_13D76:				; DATA XREF: dseg:2DDCo dseg:2E00o ...
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_13DA7
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_13DA7
		mov	al, 1
		jmp	short loc_13DA9
; ���������������������������������������������������������������������������

loc_13DA7:				; CODE XREF: seg028:006Cj seg028:0081j
		mov	al, 0

loc_13DA9:				; CODE XREF: seg028:0085j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13DAD:				; DATA XREF: dseg:2DE0o dseg:2E04o ...
		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-2Ch], eax
		mov	eax, es:[si+4]
		mov	[bp-28h], eax
		mov	eax, es:[si+8]
		mov	[bp-24h], eax
		lea	ax, [bp-2Ch]
		add	ax, 4
		mov	[bp-6],	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 5
		mov	[bp-8],	ax
		mov	[bp-0Ah], dx
		les	di, [bp-0Ah]
		mov	eax, es:[di]
		mov	[bp-38h], eax
		mov	eax, es:[di+4]
		mov	[bp-34h], eax
		mov	eax, es:[di+8]
		mov	[bp-30h], eax
		lea	ax, [bp-38h]
		add	ax, 4
		mov	[bp-0Ch], ax
		mov	bx, [bp-6]
		mov	eax, [bx]
		mov	bx, [bp-0Ch]
		add	eax, [bx]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		sar	eax, 1
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		les	bx, [bp+6]
		mov	es:[bx+2], eax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_13E6C:				; DATA XREF: dseg:2DE4o dseg:2E08o ...
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13E75:				; DATA XREF: dseg:2E18o dseg:2E64o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13E7A:				; DATA XREF: dseg:2DF0o dseg:2E14o ...
		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		les	si, [bp+6]
		mov	es:[si+0Ch], dx
		mov	es:[si+0Ah], bx
		les	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		les	si, [bp+6]
		mov	es:[si+10h], dx
		mov	es:[si+0Eh], bx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13EF7:				; DATA XREF: dseg:2DECo dseg:2E10o ...
		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	byte ptr [bp-1], 0
		mov	al, [bp-1]
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 16Eh
		push	si
		push	di
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		xor	si, si
		jmp	loc_141E3
; ���������������������������������������������������������������������������

loc_13F22:				; CODE XREF: seg028:04C8j
		mov	ax, si
		shl	ax, 2
		les	bx, [bp-4]
		add	bx, ax
		mov	ax, es:[bx+3]
		mov	dx, es:[bx+1]
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_13F5A
		jmp	loc_141E2
; ���������������������������������������������������������������������������

loc_13F5A:				; CODE XREF: seg028:0235j
		les	di, [bp-8]
		mov	eax, es:[di]
		mov	[bp-126h], eax
		mov	eax, es:[di+4]
		mov	[bp-122h], eax
		mov	eax, es:[di+8]
		mov	[bp-11Eh], eax
		mov	eax, dword_4909A
		sub	[bp-126h], eax
		mov	eax, dword_4909E
		sub	[bp-122h], eax
		mov	eax, dword_490A2
		sub	[bp-11Eh], eax
		push	6086h
		lea	ax, [bp-126h]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	eax, [bp-126h]
		mov	es:[bx+5], eax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	eax, [bp-122h]
		mov	es:[bx+9], eax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	eax, [bp-11Eh]
		mov	es:[bx+0Dh], eax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 2
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_14021
		jmp	loc_141E0
; ���������������������������������������������������������������������������

loc_14021:				; CODE XREF: seg028:02FCj
		cmp	byte_46014, 0
		jnz	short loc_1402B
		jmp	loc_140DC
; ���������������������������������������������������������������������������

loc_1402B:				; CODE XREF: seg028:0306j
		push	large dword ptr	[bp-122h]
		push	large [dword_49092]
		push	large dword ptr	[bp-126h]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	ax, word_4908E
		add	ax, [bp-0Fh]
		mov	dx, si
		shl	dx, 2
		les	bx, [bp+6]
		add	bx, dx
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-122h]
		push	large [dword_49096]
		push	large dword ptr	[bp-11Eh]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	ax, word_49090
		sub	ax, [bp-17h]
		mov	dx, si
		shl	dx, 2
		les	bx, [bp+6]
		add	bx, dx
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 4
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_141DE
; ���������������������������������������������������������������������������

loc_140DC:				; CODE XREF: seg028:0308j
		mov	eax, [bp-122h]
		cmp	eax, dword_46254
		jl	short loc_140ED
		mov	ax, 1
		jmp	short loc_140EF
; ���������������������������������������������������������������������������

loc_140ED:				; CODE XREF: seg028:03C6j
		xor	ax, ax

loc_140EF:				; CODE XREF: seg028:03CBj
		or	al, al
		jnz	short loc_140F6
		jmp	loc_141CB
; ���������������������������������������������������������������������������

loc_140F6:				; CODE XREF: seg028:03D1j
		mov	eax, dword_49366
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		shl	eax, 8
		cmp	eax, [bp-122h]
		jl	short loc_14112
		mov	ax, 1
		jmp	short loc_14114
; ���������������������������������������������������������������������������

loc_14112:				; CODE XREF: seg028:03EBj
		xor	ax, ax

loc_14114:				; CODE XREF: seg028:03F0j
		or	al, al
		jnz	short loc_1411B
		jmp	loc_141CB
; ���������������������������������������������������������������������������

loc_1411B:				; CODE XREF: seg028:03F6j
		push	large dword ptr	[bp-122h]
		push	large [dword_49092]
		push	large dword ptr	[bp-126h]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	[bp-24h], eax
		mov	ax, word_4908E
		add	ax, [bp-23h]
		mov	dx, si
		shl	dx, 2
		les	bx, [bp+6]
		add	bx, dx
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-122h]
		push	large [dword_49096]
		push	large dword ptr	[bp-11Eh]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-28h], eax
		mov	eax, [bp-28h]
		mov	[bp-2Ch], eax
		mov	ax, word_49090
		sub	ax, [bp-2Bh]
		mov	dx, si
		shl	dx, 2
		les	bx, [bp+6]
		add	bx, dx
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 4
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	short loc_141DE
; ���������������������������������������������������������������������������

loc_141CB:				; CODE XREF: seg028:03D3j seg028:03F8j
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+6]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 8

loc_141DE:				; CODE XREF: seg028:03B9j seg028:04A9j
		jmp	short $+2

loc_141E0:				; CODE XREF: seg028:02FEj
		jmp	short $+2

loc_141E2:				; CODE XREF: seg028:0237j
		inc	si

loc_141E3:				; CODE XREF: seg028:01FFj
		cmp	si, 2
		jge	short loc_141EB
		jmp	loc_13F22
; ���������������������������������������������������������������������������

loc_141EB:				; CODE XREF: seg028:04C6j
		mov	byte ptr [bp-2Dh], 0
		cmp	byte_46014, 0
		jnz	short loc_141F9
		jmp	loc_142D3
; ���������������������������������������������������������������������������

loc_141F9:				; CODE XREF: seg028:04D4j
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-30h], ax
		mov	[bp-32h], dx
		les	ax, [bp-32h]
		mov	[bp-34h], ax
		mov	bx, [bp-34h]
		mov	eax, es:[bx]
		mov	[bp-132h], eax
		mov	bx, [bp-34h]
		mov	eax, es:[bx+4]
		mov	[bp-12Eh], eax
		mov	bx, [bp-34h]
		mov	eax, es:[bx+8]
		mov	[bp-12Ah], eax
		lea	ax, [bp-132h]
		add	ax, 4
		mov	[bp-36h], ax
		les	bx, [bp+6]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 5
		mov	[bp-38h], ax
		mov	[bp-3Ah], dx
		les	ax, [bp-3Ah]
		mov	[bp-3Ch], ax
		mov	bx, [bp-3Ch]
		mov	eax, es:[bx]
		mov	[bp-13Eh], eax
		mov	bx, [bp-3Ch]
		mov	eax, es:[bx+4]
		mov	[bp-13Ah], eax
		mov	bx, [bp-3Ch]
		mov	eax, es:[bx+8]
		mov	[bp-136h], eax
		lea	ax, [bp-13Eh]
		add	ax, 4
		mov	[bp-3Eh], ax
		mov	bx, [bp-36h]
		mov	eax, [bx]
		mov	bx, [bp-3Eh]
		add	eax, [bx]
		mov	[bp-42h], eax
		mov	eax, [bp-42h]
		mov	[bp-46h], eax
		mov	eax, [bp-46h]
		sar	eax, 1
		mov	[bp-4Ah], eax
		mov	eax, [bp-4Ah]
		mov	[bp-4Eh], eax
		mov	eax, [bp-4Eh]
		mov	[bp-52h], eax
		mov	eax, [bp-52h]
		les	bx, [bp+6]
		mov	es:[bx+2], eax
		mov	byte ptr [bp-2Dh], 1
		jmp	loc_14908
; ���������������������������������������������������������������������������

loc_142D3:				; CODE XREF: seg028:04D6j
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_14301
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_14301
		mov	al, 1
		jmp	short loc_14303
; ���������������������������������������������������������������������������

loc_14301:				; CODE XREF: seg028:05C6j seg028:05DBj
		mov	al, 0

loc_14303:				; CODE XREF: seg028:05DFj
		mov	ah, 0
		or	ax, ax
		jz	short loc_1430C
		jmp	loc_14908
; ���������������������������������������������������������������������������

loc_1430C:				; CODE XREF: seg028:05E7j
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_14326
		jmp	loc_14580
; ���������������������������������������������������������������������������

loc_14326:				; CODE XREF: seg028:0601j
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-54h], ax
		mov	[bp-56h], dx
		les	ax, [bp-56h]
		mov	[bp-58h], ax
		mov	bx, [bp-58h]
		mov	eax, es:[bx]
		mov	[bp-14Ah], eax
		mov	bx, [bp-58h]
		mov	eax, es:[bx+4]
		mov	[bp-146h], eax
		mov	bx, [bp-58h]
		mov	eax, es:[bx+8]
		mov	[bp-142h], eax
		mov	eax, [bp-146h]
		cmp	eax, dword_46254
		jge	short loc_14377
		mov	ax, 1
		jmp	short loc_14379
; ���������������������������������������������������������������������������

loc_14377:				; CODE XREF: seg028:0650j
		xor	ax, ax

loc_14379:				; CODE XREF: seg028:0655j
		or	al, al
		jnz	short loc_14380
		jmp	loc_144E4
; ���������������������������������������������������������������������������

loc_14380:				; CODE XREF: seg028:065Bj
		mov	eax, [bp-14Ah]
		mov	[bp-5Ch], eax
		mov	eax, dword_46254
		mov	[bp-60h], eax
		mov	ax, word_4908E
		mov	[bp-62h], ax
		push	large dword ptr	[bp-60h]
		push	large [dword_49092]
		push	large dword ptr	[bp-5Ch]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-66h], eax
		mov	eax, [bp-66h]
		mov	[bp-6Ah], eax
		movsx	eax, word ptr [bp-62h]
		shl	eax, 8
		mov	edx, [bp-6Ah]
		add	edx, eax
		mov	[bp-6Eh], edx
		mov	eax, [bp-6Eh]
		mov	[bp-72h], eax
		mov	eax, [bp-72h]
		sar	eax, 8
		mov	[bp-76h], eax
		cmp	dword ptr [bp-76h], 7D00h
		jle	short loc_143FD
		mov	dword ptr [bp-76h], 7D00h
		jmp	short loc_14411
; ���������������������������������������������������������������������������

loc_143FD:				; CODE XREF: seg028:06D1j
		cmp	dword ptr [bp-76h], 0FFFF8300h
		jge	short loc_14411
		mov	dword ptr [bp-76h], 0FFFF8300h
		jmp	short $+2

loc_14411:				; CODE XREF: seg028:06DBj seg028:06E5j
		mov	ax, [bp-76h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		mov	eax, [bp-142h]
		mov	[bp-7Ah], eax
		mov	eax, dword_46254
		mov	[bp-7Eh], eax
		mov	ax, word_49090
		mov	[bp-80h], ax
		push	large dword ptr	[bp-7Eh]
		push	large [dword_49096]
		push	large dword ptr	[bp-7Ah]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-84h], eax
		mov	eax, [bp-84h]
		mov	[bp-88h], eax
		movsx	eax, word ptr [bp-80h]
		shl	eax, 8
		sub	eax, [bp-88h]
		mov	[bp-8Ch], eax
		mov	eax, [bp-8Ch]
		mov	[bp-90h], eax
		mov	eax, [bp-90h]
		sar	eax, 8
		mov	[bp-94h], eax
		cmp	dword ptr [bp-94h], 7D00h
		jle	short loc_144A4
		mov	dword ptr [bp-94h], 7D00h
		jmp	short loc_144BA
; ���������������������������������������������������������������������������

loc_144A4:				; CODE XREF: seg028:0777j
		cmp	dword ptr [bp-94h], 0FFFF8300h
		jge	short loc_144BA
		mov	dword ptr [bp-94h], 0FFFF8300h
		jmp	short $+2

loc_144BA:				; CODE XREF: seg028:0782j seg028:078Dj
		mov	ax, [bp-94h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 8
		jmp	loc_1457E
; ���������������������������������������������������������������������������

loc_144E4:				; CODE XREF: seg028:065Dj
		push	large dword ptr	[bp-146h]
		push	large [dword_49092]
		push	large dword ptr	[bp-14Ah]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-98h], eax
		mov	eax, [bp-98h]
		mov	[bp-9Ch], eax
		mov	ax, word_4908E
		add	ax, [bp-9Bh]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-146h]
		push	large [dword_49096]
		push	large dword ptr	[bp-142h]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0A0h], eax
		mov	eax, [bp-0A0h]
		mov	[bp-0A4h], eax
		mov	ax, word_49090
		sub	ax, [bp-0A3h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 8

loc_1457E:				; CODE XREF: seg028:07C1j
		jmp	short $+2

loc_14580:				; CODE XREF: seg028:0603j
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_1459A
		jmp	loc_14815
; ���������������������������������������������������������������������������

loc_1459A:				; CODE XREF: seg028:0875j
		les	bx, [bp+6]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 5
		mov	[bp-0A6h], ax
		mov	[bp-0A8h], dx
		les	ax, [bp-0A8h]
		mov	[bp-0AAh], ax
		mov	bx, [bp-0AAh]
		mov	eax, es:[bx]
		mov	[bp-156h], eax
		mov	bx, [bp-0AAh]
		mov	eax, es:[bx+4]
		mov	[bp-152h], eax
		mov	bx, [bp-0AAh]
		mov	eax, es:[bx+8]
		mov	[bp-14Eh], eax
		mov	eax, [bp-152h]
		cmp	eax, dword_46254
		jge	short loc_145F2
		mov	ax, 1
		jmp	short loc_145F4
; ���������������������������������������������������������������������������

loc_145F2:				; CODE XREF: seg028:08CBj
		xor	ax, ax

loc_145F4:				; CODE XREF: seg028:08D0j
		or	al, al
		jnz	short loc_145FB
		jmp	loc_14779
; ���������������������������������������������������������������������������

loc_145FB:				; CODE XREF: seg028:08D6j
		mov	eax, [bp-156h]
		mov	[bp-0AEh], eax
		mov	eax, dword_46254
		mov	[bp-0B2h], eax
		mov	ax, word_4908E
		mov	[bp-0B4h], ax
		push	large dword ptr	[bp-0B2h]
		push	large [dword_49092]
		push	large dword ptr	[bp-0AEh]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0B8h], eax
		mov	eax, [bp-0B8h]
		mov	[bp-0BCh], eax
		movsx	eax, word ptr [bp-0B4h]
		shl	eax, 8
		mov	edx, [bp-0BCh]
		add	edx, eax
		mov	[bp-0C0h], edx
		mov	eax, [bp-0C0h]
		mov	[bp-0C4h], eax
		mov	eax, [bp-0C4h]
		sar	eax, 8
		mov	[bp-0C8h], eax
		cmp	dword ptr [bp-0C8h], 7D00h
		jle	short loc_14689
		mov	dword ptr [bp-0C8h], 7D00h
		jmp	short loc_1469F
; ���������������������������������������������������������������������������

loc_14689:				; CODE XREF: seg028:095Cj
		cmp	dword ptr [bp-0C8h], 0FFFF8300h
		jge	short loc_1469F
		mov	dword ptr [bp-0C8h], 0FFFF8300h
		jmp	short $+2

loc_1469F:				; CODE XREF: seg028:0967j seg028:0972j
		mov	ax, [bp-0C8h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+1], ax
		mov	eax, [bp-14Eh]
		mov	[bp-0CCh], eax
		mov	eax, dword_46254
		mov	[bp-0D0h], eax
		mov	ax, word_49090
		mov	[bp-0D2h], ax
		push	large dword ptr	[bp-0D0h]
		push	large [dword_49096]
		push	large dword ptr	[bp-0CCh]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0D6h], eax
		mov	eax, [bp-0D6h]
		mov	[bp-0DAh], eax
		movsx	eax, word ptr [bp-0D2h]
		shl	eax, 8
		sub	eax, [bp-0DAh]
		mov	[bp-0DEh], eax
		mov	eax, [bp-0DEh]
		mov	[bp-0E2h], eax
		mov	eax, [bp-0E2h]
		sar	eax, 8
		mov	[bp-0E6h], eax
		cmp	dword ptr [bp-0E6h], 7D00h
		jle	short loc_14739
		mov	dword ptr [bp-0E6h], 7D00h
		jmp	short loc_1474F
; ���������������������������������������������������������������������������

loc_14739:				; CODE XREF: seg028:0A0Cj
		cmp	dword ptr [bp-0E6h], 0FFFF8300h
		jge	short loc_1474F
		mov	dword ptr [bp-0E6h], 0FFFF8300h
		jmp	short $+2

loc_1474F:				; CODE XREF: seg028:0A17j seg028:0A22j
		mov	ax, [bp-0E6h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+3], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 8
		jmp	loc_14813
; ���������������������������������������������������������������������������

loc_14779:				; CODE XREF: seg028:08D8j
		push	large dword ptr	[bp-152h]
		push	large [dword_49092]
		push	large dword ptr	[bp-156h]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0EAh], eax
		mov	eax, [bp-0EAh]
		mov	[bp-0EEh], eax
		mov	ax, word_4908E
		add	ax, [bp-0EDh]
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-152h]
		push	large [dword_49096]
		push	large dword ptr	[bp-14Eh]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0F2h], eax
		mov	eax, [bp-0F2h]
		mov	[bp-0F6h], eax
		mov	ax, word_49090
		sub	ax, [bp-0F5h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+3], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 8

loc_14813:				; CODE XREF: seg028:0A56j
		jmp	short $+2

loc_14815:				; CODE XREF: seg028:0877j
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-0F8h], ax
		mov	[bp-0FAh], dx
		les	ax, [bp-0FAh]
		mov	[bp-0FCh], ax
		mov	bx, [bp-0FCh]
		mov	eax, es:[bx]
		mov	[bp-162h], eax
		mov	bx, [bp-0FCh]
		mov	eax, es:[bx+4]
		mov	[bp-15Eh], eax
		mov	bx, [bp-0FCh]
		mov	eax, es:[bx+8]
		mov	[bp-15Ah], eax
		lea	ax, [bp-162h]
		add	ax, 4
		mov	[bp-0FEh], ax
		les	bx, [bp+6]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 5
		mov	[bp-100h], ax
		mov	[bp-102h], dx
		les	ax, [bp-102h]
		mov	[bp-104h], ax
		mov	bx, [bp-104h]
		mov	eax, es:[bx]
		mov	[bp-16Eh], eax
		mov	bx, [bp-104h]
		mov	eax, es:[bx+4]
		mov	[bp-16Ah], eax
		mov	bx, [bp-104h]
		mov	eax, es:[bx+8]
		mov	[bp-166h], eax
		lea	ax, [bp-16Eh]
		add	ax, 4
		mov	[bp-106h], ax
		mov	bx, [bp-0FEh]
		mov	eax, [bx]
		mov	bx, [bp-106h]
		add	eax, [bx]
		mov	[bp-10Ah], eax
		mov	eax, [bp-10Ah]
		mov	[bp-10Eh], eax
		mov	eax, [bp-10Eh]
		sar	eax, 1
		mov	[bp-112h], eax
		mov	eax, [bp-112h]
		mov	[bp-116h], eax
		mov	eax, [bp-116h]
		mov	[bp-11Ah], eax
		mov	eax, [bp-11Ah]
		les	bx, [bp+6]
		mov	es:[bx+2], eax
		mov	byte ptr [bp-2Dh], 1

loc_14908:				; CODE XREF: seg028:05B0j seg028:05E9j
		mov	al, [bp-2Dh]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_14913	proc far		; CODE XREF: sub_C4A60+1D5P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_C+2]
		push	word ptr [bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_13D22
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], al
		pop	bp
		retf
sub_14913	endp

; ���������������������������������������������������������������������������

loc_14945:				; DATA XREF: dseg:2E88o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		cmp	byte ptr es:[bx+9], 0
		jz	short loc_14980
		les	bx, [bp-4]
		mov	al, es:[bx+0Ah]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_1B4C0
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+12h], al
		jmp	short locret_1498E
; ���������������������������������������������������������������������������

loc_14980:				; CODE XREF: seg028:0C3Fj
		les	bx, [bp-4]
		mov	al, es:[bx+0Ah]
		les	bx, [bp+6]
		mov	es:[bx+12h], al

locret_1498E:				; CODE XREF: seg028:0C5Ej
		leave
		retf
; ���������������������������������������������������������������������������

loc_14990:				; DATA XREF: dseg:2E68o
		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ah]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+0Eh]
		mov	[bp-8],	eax
		les	bx, [bp+6]
		mov	al, es:[bx+12h]
		push	ax
		les	bx, [bp-8]
		push	word ptr es:[bx+3]
		les	bx, [bp-8]
		push	word ptr es:[bx+1]
		les	bx, [bp-4]
		push	word ptr es:[bx+3]
		les	bx, [bp-4]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		leave
		retf
; ���������������������������������������������������������������������������

loc_149E0:				; DATA XREF: dseg:2E7Co
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_149E9	proc far		; CODE XREF: sub_C4A60+23EP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_C+2]
		push	word ptr [bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_13D22
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		cbw
		push	ax
		push	62D0h
		call	sub_1ECF9
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], dx
		mov	es:[bx+0Ah], ax
		pop	bp
		retf
sub_149E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_14A2C	proc far		; CODE XREF: sub_C4A60+278P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_13D4D
		add	sp, 10h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], eax
		leave
		retf
sub_14A2C	endp

; ���������������������������������������������������������������������������

loc_14A6B:				; DATA XREF: dseg:2DF8o
		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ah]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+0Eh]
		mov	[bp-8],	eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_14A8B:				; DATA XREF: dseg:2E0Co
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_14A94	proc far		; CODE XREF: sub_C4A60+2A6P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_C+2]
		push	word ptr [bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_13D22
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], al
		les	bx, [bp+arg_C]
		mov	al, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], al
		pop	bp
		retf
sub_14A94	endp

; ���������������������������������������������������������������������������

loc_14AD4:				; DATA XREF: dseg:2DF4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		cmp	byte ptr es:[bx+9], 0
		jz	short loc_14B2C
		les	bx, [bp-4]
		mov	al, es:[bx+0Ah]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_1B4C0
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+12h], al
		les	bx, [bp-4]
		mov	al, es:[bx+0Bh]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_1B4C0
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+13h], al
		jmp	short locret_14B48
; ���������������������������������������������������������������������������

loc_14B2C:				; CODE XREF: seg028:0DCEj
		les	bx, [bp-4]
		mov	al, es:[bx+0Ah]
		les	bx, [bp+6]
		mov	es:[bx+12h], al
		les	bx, [bp-4]
		mov	al, es:[bx+0Bh]
		les	bx, [bp+6]
		mov	es:[bx+13h], al

locret_14B48:				; CODE XREF: seg028:0E0Aj
		leave
		retf
; ���������������������������������������������������������������������������

loc_14B4A:				; DATA XREF: dseg:2DD4o
		push	bp
		mov	bp, sp
		sub	sp, 8Eh
		push	si
		push	di
		mov	eax, dword_49086
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		shl	eax, 1
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ah]
		mov	[bp-8],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+0Eh]
		mov	[bp-0Ch], eax
		mov	ax, [bp-6]
		mov	dx, [bp-8]
		add	dx, 5
		mov	[bp-12h], ax
		mov	[bp-14h], dx
		les	si, [bp-14h]
		mov	eax, es:[si]
		mov	[bp-40h], eax
		mov	eax, es:[si+4]
		mov	[bp-3Ch], eax
		mov	eax, es:[si+8]
		mov	[bp-38h], eax
		mov	eax, [bp-3Ch]
		mov	[bp-10h], eax
		mov	ax, [bp-0Ah]
		mov	dx, [bp-0Ch]
		add	dx, 5
		mov	[bp-1Ah], ax
		mov	[bp-1Ch], dx
		les	di, [bp-1Ch]
		mov	eax, es:[di]
		mov	[bp-4Ch], eax
		mov	eax, es:[di+4]
		mov	[bp-48h], eax
		mov	eax, es:[di+8]
		mov	[bp-44h], eax
		mov	eax, [bp-48h]
		mov	[bp-18h], eax
		mov	eax, [bp-10h]
		or	eax, eax
		jge	short loc_14BF2
		neg	eax

loc_14BF2:				; CODE XREF: seg028:0ECDj
		mov	[bp-28h], eax
		mov	eax, [bp-28h]
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		mov	[bp-20h], eax
		mov	eax, [bp-18h]
		or	eax, eax
		jge	short loc_14C12
		neg	eax

loc_14C12:				; CODE XREF: seg028:0EEDj
		mov	[bp-30h], eax
		mov	eax, [bp-30h]
		mov	[bp-34h], eax
		mov	eax, [bp-34h]
		mov	[bp-24h], eax
		mov	eax, [bp-20h]
		cmp	eax, [bp-4]
		jge	short loc_14C35
		mov	ax, 1
		jmp	short loc_14C37
; ���������������������������������������������������������������������������

loc_14C35:				; CODE XREF: seg028:0F0Ej
		xor	ax, ax

loc_14C37:				; CODE XREF: seg028:0F13j
		or	al, al
		jnz	short loc_14C53
		mov	eax, [bp-24h]
		cmp	eax, [bp-4]
		jge	short loc_14C4A
		mov	ax, 1
		jmp	short loc_14C4C
; ���������������������������������������������������������������������������

loc_14C4A:				; CODE XREF: seg028:0F23j
		xor	ax, ax

loc_14C4C:				; CODE XREF: seg028:0F28j
		or	al, al
		jnz	short loc_14C53
		jmp	loc_14D1D
; ���������������������������������������������������������������������������

loc_14C53:				; CODE XREF: seg028:0F19j seg028:0F2Ej
		les	bx, [bp-8]
		mov	ax, es:[bx+1]
		mov	[bp-8Eh], ax
		les	bx, [bp-8]
		mov	ax, es:[bx+3]
		mov	[bp-8Ch], ax
		les	bx, [bp+6]
		mov	al, es:[bx+12h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-8Ah], ax
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+1]
		mov	[bp-78h], ax
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+3]
		mov	[bp-76h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+13h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-74h], ax
		mov	eax, [bp-10h]
		cmp	eax, [bp-18h]
		jge	short loc_14CAB
		mov	ax, 1
		jmp	short loc_14CAD
; ���������������������������������������������������������������������������

loc_14CAB:				; CODE XREF: seg028:0F84j
		xor	ax, ax

loc_14CAD:				; CODE XREF: seg028:0F89j
		or	al, al
		jz	short loc_14CDC
		les	bx, [bp-8]
		mov	ax, es:[bx+1]
		add	ax, 0FFFCh
		mov	[bp-62h], ax
		les	bx, [bp-8]
		mov	ax, es:[bx+3]
		add	ax, 0FFFCh
		mov	[bp-60h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+12h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-5Eh], ax
		jmp	short loc_14D05
; ���������������������������������������������������������������������������

loc_14CDC:				; CODE XREF: seg028:0F8Fj
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+1]
		add	ax, 0FFFCh
		mov	[bp-62h], ax
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+3]
		add	ax, 0FFFCh
		mov	[bp-60h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+13h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-5Eh], ax

loc_14D05:				; CODE XREF: seg028:0FBAj
		push	ss
		lea	ax, [bp-8Eh]
		push	ax
		push	3
		push	word_46F44
		call	Render_MeshPrimitive_27D5F
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_14D1D:				; CODE XREF: seg028:0F30j
		les	bx, [bp+6]
		mov	al, es:[bx+13h]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+12h]
		mov	ah, 0
		push	ax
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+3]
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+1]
		les	bx, [bp-8]
		push	word ptr es:[bx+3]
		les	bx, [bp-8]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	Render_LineClipped
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_14D5D:				; DATA XREF: dseg:2DE8o
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_14D66:				; DATA XREF: dseg:58ECo
		push	bp
		mov	bp, sp
		mov	word_490E4, 2E1Ch
		mov	word_490E4, 2E20h
		mov	word_490E4, 2E44h
		mov	word_490E4, 2E68h
		mov	word_490F7, 2E1Ch
		mov	word_490F7, 2E20h
		mov	word_490F7, 2E44h
		mov	word_490F7, 2DF8h
		mov	word_4910D, 2E1Ch
		mov	word_4910D, 2E20h
		mov	word_4910D, 2E44h
		mov	word_4910D, 2DD4h
		pop	bp
		retf
seg028		ends
