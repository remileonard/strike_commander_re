seg043		segment	byte public 'CODE' use16
		assume cs:seg043
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_24EE2:				; DATA XREF: seg339:15EDo seg339:1615o ...
		enter	0Eh, 0
		push	si
		push	di
		push	ds
		lds	si, [bp+6]
		les	si, [si+6]
		mov	[bp-0Eh], si
		test	byte ptr es:[si+25h], 1
		jnz	short loc_24F43
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
		jns	loc_2589F

loc_24F43:				; CODE XREF: seg043:0017j
		push	ds
		pop	gs
		assume gs:seg339
		push	es
		pop	fs
		mov	bx, si
		mov	si, [bp+6]
		lds	si, [si+0Ah]

loc_24F51:
		les	bx, es:[bx+19h]
		mov	di, [bp+0Ah]

loc_24F58:
		test	byte ptr [si+11h], 2

loc_24F5C:
		jnz	loc_25139
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+4]
		add	esi, eax
		adc	ecx, edx

loc_24F7F:
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

loc_24FB3:
		imul	dword ptr ss:[di+14h]

loc_24FB8:
		add	esi, eax

loc_24FBB:
		adc	ecx, edx

loc_24FBE:
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

loc_24FE2:
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
		cmp	byte ptr ss:15D0h, 0
		jz	short loc_250A1
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_25052
		mov	eax, ecx

loc_25052:				; CODE XREF: seg043:016Dj
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2505D
		mov	eax, ecx

loc_2505D:				; CODE XREF: seg043:0178j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h

loc_25082:
		cmp	edx, ecx
		jle	short loc_2508A
		mov	edx, ecx

loc_2508A:				; CODE XREF: seg043:01A5j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_25095

loc_25092:
		mov	edx, ecx

loc_25095:				; CODE XREF: seg043:01B0j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_25133
; ���������������������������������������������������������������������������

loc_250A1:				; CODE XREF: seg043:0146j
		mov	cl, 1
		mov	eax, [si+9]
		cmp	eax, ss:18F6h
		jl	loc_25133
		sar	eax, 8
		cmp	eax, ss:5490h
		jg	short loc_25133
		mov	eax, [si+5]

loc_250C1:
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8

loc_250CF:
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_250E7
		mov	eax, ecx

loc_250E7:				; CODE XREF: seg043:0202j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_250F2
		mov	eax, ecx

loc_250F2:				; CODE XREF: seg043:020Dj
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2511F
		mov	edx, ecx

loc_2511F:				; CODE XREF: seg043:023Aj
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2512A
		mov	edx, ecx

loc_2512A:				; CODE XREF: seg043:0245j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_25133:				; CODE XREF: seg043:01BEj seg043:01CDj ...
		rol	cl, 3
		or	[si+11h], cl

loc_25139:				; CODE XREF: seg043:loc_24F5Cj
		mov	eax, [si+9]
		mov	[bp-4],	eax
		mov	si, [bp+6]
		mov	si, gs:[si+0Eh]
		mov	bx, [bp-0Eh]
		mov	bx, fs:[bx+1Dh]
		test	byte ptr [si+11h], 2
		jnz	loc_25330
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

loc_25183:
		adc	edx, ecx

loc_25186:
		shrd	eax, edx, 8

loc_2518B:
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

loc_251C2:
		adc	edx, ecx

loc_251C5:
		shrd	eax, edx, 8

loc_251CA:
		add	eax, ss:[di+1Ch]
		pop	si

loc_251D0:
		mov	[si+9],	eax
		push	si

loc_251D5:
		mov	eax, es:[bx]

loc_251D9:
		imul	dword ptr ss:[di+20h]

loc_251DE:
		mov	esi, eax
		mov	ecx, edx

loc_251E4:
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
		cmp	byte ptr ss:15D0h, 0
		jz	short loc_25298
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_25249
		mov	eax, ecx

loc_25249:				; CODE XREF: seg043:0364j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_25254

loc_25251:
		mov	eax, ecx

loc_25254:				; CODE XREF: seg043:036Fj
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_25281
		mov	edx, ecx

loc_25281:				; CODE XREF: seg043:039Cj
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2528C
		mov	edx, ecx

loc_2528C:				; CODE XREF: seg043:03A7j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_2532A
; ���������������������������������������������������������������������������

loc_25298:				; CODE XREF: seg043:033Dj
		mov	cl, 1
		mov	eax, [si+9]
		cmp	eax, ss:18F6h
		jl	loc_2532A
		sar	eax, 8

loc_252AC:
		cmp	eax, ss:5490h

loc_252B2:
		jg	short loc_2532A

loc_252B4:
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:514Eh
		add	eax, edx

loc_252D0:
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_252DE
		mov	eax, ecx

loc_252DE:				; CODE XREF: seg043:03F9j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_252E9
		mov	eax, ecx

loc_252E9:				; CODE XREF: seg043:0404j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_25316
		mov	edx, ecx

loc_25316:				; CODE XREF: seg043:0431j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_25321
		mov	edx, ecx

loc_25321:				; CODE XREF: seg043:043Cj
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_2532A:				; CODE XREF: seg043:03B5j seg043:03C4j ...
		rol	cl, 3
		or	[si+11h], cl

loc_25330:				; CODE XREF: seg043:0273j
		mov	eax, [si+9]
		mov	[bp-8],	eax
		mov	si, [bp+6]
		mov	si, gs:[si+12h]
		mov	bx, [bp-0Eh]
		mov	bx, fs:[bx+21h]
		test	byte ptr [si+11h], 2
		jnz	loc_25527
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx

loc_2535D:
		mov	eax, es:[bx+4]

loc_25362:
		imul	dword ptr ss:[di+4]

loc_25367:
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

loc_253BC:
		shrd	eax, edx, 8

loc_253C1:
		add	eax, ss:[di+1Ch]
		pop	si

loc_253C7:
		mov	[si+9],	eax
		push	si
		mov	eax, es:[bx]

loc_253D0:
		imul	dword ptr ss:[di+20h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]

loc_253E0:
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
		cmp	byte ptr ss:15D0h, 0
		jz	short loc_2548F
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_25440
		mov	eax, ecx

loc_25440:				; CODE XREF: seg043:055Bj
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2544B
		mov	eax, ecx

loc_2544B:				; CODE XREF: seg043:0566j
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h

loc_25458:
		idiv	dword ptr [si+9]

loc_2545C:
		sar	eax, 8

loc_25460:
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_25478
		mov	edx, ecx

loc_25478:				; CODE XREF: seg043:0593j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_25483

loc_25480:
		mov	edx, ecx

loc_25483:				; CODE XREF: seg043:059Ej
		mov	[si+3],	dx

loc_25486:
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_25521
; ���������������������������������������������������������������������������

loc_2548F:				; CODE XREF: seg043:0534j
		mov	cl, 1
		mov	eax, [si+9]
		cmp	eax, ss:18F6h
		jl	loc_25521
		sar	eax, 8
		cmp	eax, ss:5490h
		jg	short loc_25521
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]

loc_254B9:
		sar	eax, 8

loc_254BD:
		movsx	edx, word ptr ss:514Eh

loc_254C4:
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_254D5

loc_254D2:
		mov	eax, ecx

loc_254D5:				; CODE XREF: seg043:05F0j
		neg	ecx

loc_254D8:
		cmp	eax, ecx
		jge	short loc_254E0

loc_254DD:
		mov	eax, ecx

loc_254E0:				; CODE XREF: seg043:05FBj
		mov	[si+1],	ax

loc_254E3:
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2550D
		mov	edx, ecx

loc_2550D:				; CODE XREF: seg043:0628j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_25518
		mov	edx, ecx

loc_25518:				; CODE XREF: seg043:0633j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_25521:				; CODE XREF: seg043:05ACj seg043:05BBj ...
		rol	cl, 3
		or	[si+11h], cl

loc_25527:				; CODE XREF: seg043:046Aj
		mov	eax, [si+9]
		mov	[bp-0Ch], eax
		mov	di, [bp+6]
		cmp	byte ptr ss:15D0h, 0
		jz	short loc_25563
		mov	eax, [bp-4]
		add	eax, [bp-8]
		add	eax, [bp-0Ch]
		jns	short loc_2554B
		xor	eax, eax

loc_2554B:				; CODE XREF: seg043:0666j
		cdq

loc_2554D:
		mov	ecx, 3

loc_25553:
		idiv	ecx
		mov	gs:[di+2], eax

loc_2555B:
		mov	ax, 1
		pop	ds
		pop	di

loc_25560:
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_25563:				; CODE XREF: seg043:0658j
		mov	al, [si+11h]
		mov	si, gs:[di+0Eh]
		and	al, [si+11h]
		mov	si, gs:[di+0Ah]
		and	al, [si+11h]
		test	al, 8
		jnz	loc_2589F
		test	byte ptr [si+11h], 4
		jnz	loc_25676
		mov	eax, [si+9]
		cmp	eax, ss:18F6h
		jge	short loc_255FE

loc_2558E:
		mov	eax, [si+5]

loc_25592:
		imul	dword ptr ss:5152h

loc_25598:
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_255B5

loc_255B2:
		mov	eax, ecx

loc_255B5:				; CODE XREF: seg043:06D0j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_255C0

loc_255BD:
		mov	eax, ecx

loc_255C0:				; CODE XREF: seg043:06DBj
		mov	[si+1],	ax

loc_255C3:
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_255EA
		mov	edx, ecx

loc_255EA:				; CODE XREF: seg043:0705j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_255F5
		mov	edx, ecx

loc_255F5:				; CODE XREF: seg043:0710j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		jmp	short loc_25672
; ���������������������������������������������������������������������������

loc_255FE:				; CODE XREF: seg043:06ACj
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_25628
		mov	eax, ecx

loc_25628:				; CODE XREF: seg043:0743j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_25633
		mov	eax, ecx

loc_25633:				; CODE XREF: seg043:074Ej
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_25660
		mov	edx, ecx

loc_25660:				; CODE XREF: seg043:077Bj
		neg	ecx

loc_25663:
		cmp	edx, ecx
		jge	short loc_2566B
		mov	edx, ecx

loc_2566B:				; CODE XREF: seg043:0786j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4

loc_25672:				; CODE XREF: seg043:071Cj
		or	byte ptr [si+11h], 8

loc_25676:				; CODE XREF: seg043:069Ej
		mov	si, gs:[di+0Eh]
		test	byte ptr [si+11h], 4
		jnz	loc_25776
		mov	eax, [si+9]

loc_25686:
		cmp	eax, ss:18F6h

loc_2568C:
		jge	short loc_256FE
		mov	eax, [si+5]

loc_25692:
		imul	dword ptr ss:5152h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_256B5
		mov	eax, ecx

loc_256B5:				; CODE XREF: seg043:07D0j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_256C0
		mov	eax, ecx

loc_256C0:				; CODE XREF: seg043:07DBj
		mov	[si+1],	ax

loc_256C3:
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h

loc_256E2:
		cmp	edx, ecx
		jle	short loc_256EA
		mov	edx, ecx

loc_256EA:				; CODE XREF: seg043:0805j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_256F5
		mov	edx, ecx

loc_256F5:				; CODE XREF: seg043:0810j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		jmp	short loc_25772
; ���������������������������������������������������������������������������

loc_256FE:				; CODE XREF: seg043:loc_2568Cj
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_25728
		mov	eax, ecx

loc_25728:				; CODE XREF: seg043:0843j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_25733
		mov	eax, ecx

loc_25733:				; CODE XREF: seg043:084Ej
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_25760
		mov	edx, ecx

loc_25760:				; CODE XREF: seg043:087Bj
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2576B
		mov	edx, ecx

loc_2576B:				; CODE XREF: seg043:0886j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4

loc_25772:				; CODE XREF: seg043:081Cj
		or	byte ptr [si+11h], 8

loc_25776:				; CODE XREF: seg043:079Ej
		mov	si, gs:[di+12h]
		test	byte ptr [si+11h], 4
		jnz	loc_25876

loc_25782:
		mov	eax, [si+9]
		cmp	eax, ss:18F6h

loc_2578C:
		jge	short loc_257FE

loc_2578E:
		mov	eax, [si+5]

loc_25792:
		imul	dword ptr ss:5152h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_257B5
		mov	eax, ecx

loc_257B5:				; CODE XREF: seg043:08D0j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_257C0
		mov	eax, ecx

loc_257C0:				; CODE XREF: seg043:08DBj
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		shrd	eax, edx, 10h

loc_257D2:
		movsx	edx, word ptr ss:5150h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_257EA
		mov	edx, ecx

loc_257EA:				; CODE XREF: seg043:0905j
		neg	ecx
		cmp	edx, ecx
		jge	short loc_257F5
		mov	edx, ecx

loc_257F5:				; CODE XREF: seg043:0910j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4
		jmp	short loc_25872
; ���������������������������������������������������������������������������

loc_257FE:				; CODE XREF: seg043:loc_2578Cj
		mov	eax, [si+5]
		imul	dword ptr ss:5152h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:514Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_25828
		mov	eax, ecx

loc_25828:				; CODE XREF: seg043:0943j
		neg	ecx
		cmp	eax, ecx
		jge	short loc_25833
		mov	eax, ecx

loc_25833:				; CODE XREF: seg043:094Ej
		mov	[si+1],	ax
		mov	eax, [si+0Dh]
		imul	dword ptr ss:5156h
		idiv	dword ptr [si+9]
		sar	eax, 8
		movsx	edx, word ptr ss:5150h

loc_2584F:
		sub	edx, eax

loc_25852:
		mov	ecx, 7D00h

loc_25858:
		cmp	edx, ecx
		jle	short loc_25860

loc_2585D:
		mov	edx, ecx

loc_25860:				; CODE XREF: seg043:097Bj
		neg	ecx

loc_25863:
		cmp	edx, ecx
		jge	short loc_2586B
		mov	edx, ecx

loc_2586B:				; CODE XREF: seg043:0986j
		mov	[si+3],	dx
		or	byte ptr [si+11h], 4

loc_25872:				; CODE XREF: seg043:091Cj
		or	byte ptr [si+11h], 8

loc_25876:				; CODE XREF: seg043:089Ej
		mov	eax, [bp-4]
		add	eax, [bp-8]
		add	eax, [bp-0Ch]
		jns	short loc_25887
		xor	eax, eax

loc_25887:				; CODE XREF: seg043:09A2j
		cdq
		mov	ecx, 3
		idiv	ecx

loc_25892:
		mov	gs:[di+2], eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2589F:				; CODE XREF: seg043:005Fj seg043:0696j
		mov	ax, 0
		pop	ds
		pop	di
		pop	si
		leave
		retf
seg043		ends
