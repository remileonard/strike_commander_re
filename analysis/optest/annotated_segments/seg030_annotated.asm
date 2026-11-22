seg030		segment	byte public 'CODE' use16
		assume cs:seg030
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_162AC:				; DATA XREF: dseg:3011o dseg:3039o ...
		enter	0Eh, 0
		push	si
		push	di
		push	ds
		lds	si, [bp+6]
		les	si, [si+6]
		mov	[bp-0Eh], si
		test	byte ptr es:[si+25h], 1
		jnz	short loc_1630D
		mov	di, [bp+0Ch]
		mov	eax, es:[si+0Dh]
		add	eax, ss:[di]
		imul	dword ptr es:[si+1]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, es:[si+11h]
		add	eax, ss:[di+4]
		imul	dword ptr es:[si+5]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, es:[si+15h]
		add	eax, ss:[di+8]
		imul	dword ptr es:[si+9]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		jns	loc_16C72

loc_1630D:				; CODE XREF: seg030:0021j
		push	ds
		pop	gs
		assume gs:dseg
		push	es
		pop	fs
		mov	bx, si
		mov	si, [bp+6]
		lds	si, [si+0Ah]
		les	bx, es:[bx+19h]
		mov	di, [bp+0Ah]
		test	byte ptr [si+11h], 2
		jnz	loc_16503
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+4]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+8]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		pop	si
		mov	[si+5],	eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+10h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+14h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+18h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		pop	si
		mov	[si+9],	eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+20h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+24h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+28h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		pop	si
		mov	[si+0Dh], eax
		or	byte ptr [si+11h], 2
		cmp	byte ptr ss:2FF4h, 0
		jz	short loc_1646B
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1641C
		mov	eax, ecx

loc_1641C:				; CODE XREF: seg030:0177j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_16427
		mov	eax, ecx

loc_16427:				; CODE XREF: seg030:0182j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_16454
		mov	edx, ecx

loc_16454:				; CODE XREF: seg030:01AFj
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1645F
		mov	edx, ecx

loc_1645F:				; CODE XREF: seg030:01BAj
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_164FD
; ���������������������������������������������������������������������������

loc_1646B:				; CODE XREF: seg030:0150j
		mov	cl, 1
		mov	eax, [si+9]
		cmp	eax, ss:3234h
		jl	loc_164FD
		sar	eax, 8
		cmp	eax, ss:6346h
		jg	short loc_164FD
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_164B1
		mov	eax, ecx

loc_164B1:				; CODE XREF: seg030:020Cj
		neg	ecx
		cmp	eax, ecx
		jge	short loc_164BC
		mov	eax, ecx

loc_164BC:				; CODE XREF: seg030:0217j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_164E9
		mov	edx, ecx

loc_164E9:				; CODE XREF: seg030:0244j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_164F4
		mov	edx, ecx

loc_164F4:				; CODE XREF: seg030:024Fj
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_164FD:				; CODE XREF: seg030:01C8j seg030:01D7j ...
		rol	cl, 3
		or	[si+11h], cl

loc_16503:				; CODE XREF: seg030:0086j
		mov	eax, [si+9]
		mov	[bp-4],	eax
		mov	si, [bp+6]
		mov	si, gs:[si+0Eh]
		mov	bx, [bp-0Eh]
		mov	bx, fs:[bx+1Dh]
		test	byte ptr [si+11h], 2
		jnz	loc_166FA
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+4]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+8]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		pop	si
		mov	[si+5],	eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+10h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+14h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+18h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		pop	si
		mov	[si+9],	eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+20h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+24h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+28h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		pop	si
		mov	[si+0Dh], eax
		or	byte ptr [si+11h], 2
		cmp	byte ptr ss:2FF4h, 0
		jz	short loc_16662
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_16613
		mov	eax, ecx

loc_16613:				; CODE XREF: seg030:036Ej
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1661E
		mov	eax, ecx

loc_1661E:				; CODE XREF: seg030:0379j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1664B
		mov	edx, ecx

loc_1664B:				; CODE XREF: seg030:03A6j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_16656
		mov	edx, ecx

loc_16656:				; CODE XREF: seg030:03B1j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_166F4
; ���������������������������������������������������������������������������

loc_16662:				; CODE XREF: seg030:0347j
		mov	cl, 1
		mov	eax, [si+9]
		cmp	eax, ss:3234h
		jl	loc_166F4
		sar	eax, 8
		cmp	eax, ss:6346h
		jg	short loc_166F4
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_166A8
		mov	eax, ecx

loc_166A8:				; CODE XREF: seg030:0403j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_166B3
		mov	eax, ecx

loc_166B3:				; CODE XREF: seg030:040Ej
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_166E0
		mov	edx, ecx

loc_166E0:				; CODE XREF: seg030:043Bj
		neg	ecx
		cmp	edx, ecx
		jge	short loc_166EB
		mov	edx, ecx

loc_166EB:				; CODE XREF: seg030:0446j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_166F4:				; CODE XREF: seg030:03BFj seg030:03CEj ...
		rol	cl, 3
		or	[si+11h], cl

loc_166FA:				; CODE XREF: seg030:027Dj
		mov	eax, [si+9]
		mov	[bp-8],	eax
		mov	si, [bp+6]
		mov	si, gs:[si+12h]
		mov	bx, [bp-0Eh]
		mov	bx, fs:[bx+21h]
		test	byte ptr [si+11h], 2
		jnz	loc_168F1
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+4]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+8]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		pop	si
		mov	[si+5],	eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+10h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+14h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+18h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		pop	si
		mov	[si+9],	eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+20h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+24h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+28h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		pop	si
		mov	[si+0Dh], eax
		or	byte ptr [si+11h], 2
		cmp	byte ptr ss:2FF4h, 0
		jz	short loc_16859
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1680A
		mov	eax, ecx

loc_1680A:				; CODE XREF: seg030:0565j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_16815
		mov	eax, ecx

loc_16815:				; CODE XREF: seg030:0570j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_16842
		mov	edx, ecx

loc_16842:				; CODE XREF: seg030:059Dj
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1684D
		mov	edx, ecx

loc_1684D:				; CODE XREF: seg030:05A8j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_168EB
; ���������������������������������������������������������������������������

loc_16859:				; CODE XREF: seg030:053Ej
		mov	cl, 1
		mov	eax, [si+9]
		cmp	eax, ss:3234h
		jl	loc_168EB
		sar	eax, 8
		cmp	eax, ss:6346h
		jg	short loc_168EB
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1689F
		mov	eax, ecx

loc_1689F:				; CODE XREF: seg030:05FAj
		neg	ecx
		cmp	eax, ecx
		jge	short loc_168AA
		mov	eax, ecx

loc_168AA:				; CODE XREF: seg030:0605j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_168D7
		mov	edx, ecx

loc_168D7:				; CODE XREF: seg030:0632j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_168E2
		mov	edx, ecx

loc_168E2:				; CODE XREF: seg030:063Dj
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_168EB:				; CODE XREF: seg030:05B6j seg030:05C5j ...
		rol	cl, 3
		or	[si+11h], cl

loc_168F1:				; CODE XREF: seg030:0474j
		mov	eax, [si+9]
		mov	[bp-0Ch], eax
		mov	di, [bp+6]
		cmp	byte ptr ss:2FF4h, 0
		jz	short loc_1692D
		mov	eax, [bp-4]
		add	eax, [bp-8]
		add	eax, [bp-0Ch]
		jns	short loc_16915
		xor	eax, eax

loc_16915:				; CODE XREF: seg030:0670j
		cdq
		mov	ecx, 3
		idiv	ecx
		mov	gs:[di+2], eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1692D:				; CODE XREF: seg030:0662j
		mov	al, [si+11h]
		mov	si, gs:[di+0Eh]
		and	al, [si+11h]
		mov	si, gs:[di+0Ah]
		and	al, [si+11h]
		test	al, 8
		jnz	loc_16C72
		test	byte ptr [si+11h], 4
		jnz	loc_16A43
		mov	eax, [si+9]
		cmp	eax, ss:3234h
		jge	short loc_169CB
		nop
		nop
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_16981
		mov	eax, ecx

loc_16981:				; CODE XREF: seg030:06DCj
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1698C
		mov	eax, ecx

loc_1698C:				; CODE XREF: seg030:06E7j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_169B6
		mov	edx, ecx

loc_169B6:				; CODE XREF: seg030:0711j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_169C1
		mov	edx, ecx

loc_169C1:				; CODE XREF: seg030:071Cj
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		jmp	short loc_16A3F
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_169CB:				; CODE XREF: seg030:06B6j
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_169F5
		mov	eax, ecx

loc_169F5:				; CODE XREF: seg030:0750j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_16A00
		mov	eax, ecx

loc_16A00:				; CODE XREF: seg030:075Bj
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_16A2D
		mov	edx, ecx

loc_16A2D:				; CODE XREF: seg030:0788j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_16A38
		mov	edx, ecx

loc_16A38:				; CODE XREF: seg030:0793j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4

loc_16A3F:				; CODE XREF: seg030:0728j
		or	byte ptr [si+11h], 8

loc_16A43:				; CODE XREF: seg030:06A8j
		mov	si, gs:[di+0Eh]
		test	byte ptr [si+11h], 4
		jnz	loc_16B46
		mov	eax, [si+9]
		cmp	eax, ss:3234h
		jge	short loc_16ACE
		nop
		nop
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_16A84
		mov	eax, ecx

loc_16A84:				; CODE XREF: seg030:07DFj
		neg	ecx
		cmp	eax, ecx
		jge	short loc_16A8F
		mov	eax, ecx

loc_16A8F:				; CODE XREF: seg030:07EAj
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_16AB9
		mov	edx, ecx

loc_16AB9:				; CODE XREF: seg030:0814j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_16AC4
		mov	edx, ecx

loc_16AC4:				; CODE XREF: seg030:081Fj
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		jmp	short loc_16B42
; ���������������������������������������������������������������������������
		align 2

loc_16ACE:				; CODE XREF: seg030:07B9j
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_16AF8
		mov	eax, ecx

loc_16AF8:				; CODE XREF: seg030:0853j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_16B03
		mov	eax, ecx

loc_16B03:				; CODE XREF: seg030:085Ej
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_16B30
		mov	edx, ecx

loc_16B30:				; CODE XREF: seg030:088Bj
		neg	ecx
		cmp	edx, ecx
		jge	short loc_16B3B
		mov	edx, ecx

loc_16B3B:				; CODE XREF: seg030:0896j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4

loc_16B42:				; CODE XREF: seg030:082Bj
		or	byte ptr [si+11h], 8

loc_16B46:				; CODE XREF: seg030:07ABj
		mov	si, gs:[di+12h]
		test	byte ptr [si+11h], 4
		jnz	loc_16C49
		mov	eax, [si+9]
		cmp	eax, ss:3234h
		jge	short loc_16BD1
		nop
		nop
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_16B87
		mov	eax, ecx

loc_16B87:				; CODE XREF: seg030:08E2j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_16B92
		mov	eax, ecx

loc_16B92:				; CODE XREF: seg030:08EDj
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_16BBC
		mov	edx, ecx

loc_16BBC:				; CODE XREF: seg030:0917j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_16BC7
		mov	edx, ecx

loc_16BC7:				; CODE XREF: seg030:0922j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		jmp	short loc_16C45
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_16BD1:				; CODE XREF: seg030:08BCj
		mov	eax, [si+5]
		imul	dword ptr ss:6072h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:606Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_16BFB
		mov	eax, ecx

loc_16BFB:				; CODE XREF: seg030:0956j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_16C06
		mov	eax, ecx

loc_16C06:				; CODE XREF: seg030:0961j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:6076h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:6070h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_16C33
		mov	edx, ecx

loc_16C33:				; CODE XREF: seg030:098Ej
		neg	ecx
		cmp	edx, ecx
		jge	short loc_16C3E
		mov	edx, ecx

loc_16C3E:				; CODE XREF: seg030:0999j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4

loc_16C45:				; CODE XREF: seg030:092Ej
		or	byte ptr [si+11h], 8

loc_16C49:				; CODE XREF: seg030:08AEj
		mov	eax, [bp-4]
		add	eax, [bp-8]
		add	eax, [bp-0Ch]
		jns	short loc_16C5A
		xor	eax, eax

loc_16C5A:				; CODE XREF: seg030:09B5j
		cdq
		mov	ecx, 3
		idiv	ecx
		mov	gs:[di+2], eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_16C72:				; CODE XREF: seg030:0069j seg030:06A0j
		mov	ax, 0
		pop	ds
		pop	di
		pop	si
		leave
		retf
seg030		ends
