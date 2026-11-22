seg033		segment	byte public 'CODE' use16
		assume cs:seg033
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_17202	proc far		; CODE XREF: seg033:010Dp seg033:0779p

var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		enter	10h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es

loc_1720B:				; DATA XREF: seg170:01C6o
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_8]
		mov	ah, al
		mov	di, ax
		shl	eax, 10h
		mov	ax, di
		mov	[bp+var_10], eax
		mov	si, [bp+var_A]
		mov	es, [bp+var_C]
		mov	ax, [bp+arg_6]
		cmp	[bp+var_6], ax
		jg	short loc_1727D
		cmp	[bp+var_2], ax
		jl	short loc_1727D
		shl	ax, 1
		add	si, ax
		mov	ax, [bp+var_8]
		cmp	dx, ax
		jl	short loc_1727D
		cmp	bx, ax
		jge	short loc_17252
		mov	bx, ax

loc_17252:				; CODE XREF: sub_17202+4Cj
		mov	ax, [bp+var_4]
		cmp	dx, ax
		jle	short loc_1725B
		mov	dx, ax

loc_1725B:				; CODE XREF: sub_17202+55j
		cmp	bx, ax
		jg	short loc_1727D
		mov	cx, dx
		sub	cx, bx
		inc	cx
		mov	di, bx
		add	di, [si]
		mov	eax, [bp+var_10]
		movzx	ecx, cx
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb

loc_1727D:				; CODE XREF: sub_17202+38j
					; sub_17202+3Dj ...
		pop	di
		pop	si
		leave
		retf
sub_17202	endp

; ���������������������������������������������������������������������������
		enter	46h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+6]
		lea	di, [bp-0Ch]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+8]
		mov	ax, [bx]
		mov	[bp-18h], ax
		mov	ax, [bx+2]
		mov	[bp-16h], ax
		mov	bx, [bp+0Ah]
		mov	ax, [bx]
		mov	[bp-14h], ax
		mov	ax, [bx+2]
		mov	[bp-12h], ax
		mov	bx, [bp+0Ch]
		mov	ax, [bx]
		mov	[bp-10h], ax
		mov	ax, [bx+2]
		mov	[bp-0Eh], ax
		mov	bx, [bp+8]
		mov	ax, [bx+4]
		mov	ah, al
		mov	di, ax
		shl	eax, 10h
		mov	ax, di
		mov	[bp-1Ch], eax
		mov	ax, [bp-12h]
		cmp	[bp-16h], ax
		jnz	short loc_17316
		cmp	[bp-0Eh], ax
		jnz	short loc_17316
		mov	ax, [bp-18h]
		mov	bx, [bp-14h]
		mov	cx, [bp-10h]
		cmp	ax, bx
		jle	short loc_172F1
		nop
		nop
		xchg	ax, bx

loc_172F1:				; CODE XREF: seg033:00ECj
		cmp	bx, cx
		jle	short loc_17300
		nop
		nop
		xchg	bx, cx
		cmp	ax, bx
		jle	short loc_17300
		nop
		nop
		xchg	ax, bx

loc_17300:				; CODE XREF: seg033:00F3j seg033:00FBj
		push	large dword ptr	[bp-1Ch]
		push	word ptr [bp-16h]
		push	cx
		push	ax
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_17202
		add	sp, 0Ch
		jmp	loc_178FE
; ���������������������������������������������������������������������������

loc_17316:				; CODE XREF: seg033:00DAj seg033:00DFj
		mov	eax, [bp-18h]
		mov	ebx, [bp-14h]
		mov	ecx, [bp-10h]
		cmp	eax, ecx
		jle	short loc_17331
		cmp	ebx, ecx
		jl	short loc_17331
		xchg	eax, ecx
		jmp	short loc_17338
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17331:				; CODE XREF: seg033:0125j seg033:012Aj
		cmp	eax, ebx
		jle	short loc_17338
		xchg	eax, ebx

loc_17338:				; CODE XREF: seg033:012Ej seg033:0134j
		cmp	ebx, ecx
		jle	short loc_17340
		xchg	ebx, ecx

loc_17340:				; CODE XREF: seg033:013Bj
		mov	[bp-18h], eax
		mov	[bp-14h], ebx
		mov	[bp-10h], ecx
		mov	si, [bp-8]
		mov	di, [bp-4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_17363
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_17363
		nop
		nop
		inc	dx

loc_17363:				; CODE XREF: seg033:0157j seg033:015Ej
		mov	[bp-1Eh], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_17377
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_17377
		nop
		nop
		inc	dx

loc_17377:				; CODE XREF: seg033:016Bj seg033:0172j
		mov	[bp-20h], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_1738B
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_1738B
		nop
		nop
		inc	dx

loc_1738B:				; CODE XREF: seg033:017Fj seg033:0186j
		mov	[bp-22h], dx
		or	dx, [bp-20h]
		or	dx, [bp-1Eh]
		mov	[bp-24h], dx
		mov	ax, [bp-16h]
		cmp	[bp-2],	ax
		jl	short loc_173B9
		mov	ax, [bp-0Eh]
		cmp	[bp-6],	ax
		jg	short loc_173B9
		mov	ax, [bp-1Eh]
		cmp	ax, 0
		jz	short loc_173BC
		cmp	[bp-20h], ax
		jnz	short loc_173BC
		cmp	[bp-22h], ax
		jnz	short loc_173BC

loc_173B9:				; CODE XREF: seg033:019Dj seg033:01A5j
		jmp	loc_178FE
; ���������������������������������������������������������������������������

loc_173BC:				; CODE XREF: seg033:01ADj seg033:01B2j ...
		mov	ax, [bp-18h]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp-28h], eax
		mov	[bp-2Ch], eax
		xor	eax, eax
		mov	cx, [bp-1Eh]
		or	cx, cx
		jz	short loc_173E1
		nop
		nop
		cmp	[bp-22h], cx
		jz	short loc_173FA
		nop
		nop

loc_173E1:				; CODE XREF: seg033:01D6j
		mov	ax, [bp-10h]
		sub	ax, [bp-18h]
		shl	eax, 10h
		cdq
		mov	bx, [bp-0Eh]
		sub	bx, [bp-16h]
		movsx	ebx, bx
		idiv	ebx

loc_173FA:				; CODE XREF: seg033:01DDj
		mov	[bp-34h], eax
		xor	eax, eax
		mov	cx, [bp-12h]
		cmp	[bp-0Eh], cx
		jz	short loc_17433
		cmp	[bp-2],	cx
		jle	short loc_17433
		mov	cx, [bp-20h]
		or	cx, cx
		jz	short loc_1741A
		cmp	[bp-22h], cx
		jz	short loc_17433

loc_1741A:				; CODE XREF: seg033:0213j
		mov	ax, [bp-10h]
		sub	ax, [bp-14h]
		shl	eax, 10h
		cdq
		mov	bx, [bp-0Eh]
		sub	bx, [bp-12h]
		movsx	ebx, bx
		idiv	ebx

loc_17433:				; CODE XREF: seg033:0207j seg033:020Cj ...
		mov	[bp-38h], eax
		mov	cx, [bp-12h]
		cmp	[bp-16h], cx
		jnz	short loc_1745A
		nop
		nop
		mov	ax, [bp-14h]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp-28h], eax
		mov	eax, [bp-38h]
		mov	[bp-30h], eax
		jmp	short loc_17494
; ���������������������������������������������������������������������������
		align 2

loc_1745A:				; CODE XREF: seg033:023Dj
		xor	eax, eax
		mov	cx, [bp-12h]
		cmp	[bp-6],	cx
		jg	short loc_17490
		nop
		nop
		mov	cx, [bp-1Eh]
		or	cx, cx
		jz	short loc_17477
		nop
		nop
		cmp	[bp-20h], cx
		jz	short loc_17490
		nop
		nop

loc_17477:				; CODE XREF: seg033:026Cj
		mov	ax, [bp-14h]
		sub	ax, [bp-18h]
		shl	eax, 10h
		cdq
		mov	bx, [bp-12h]
		sub	bx, [bp-16h]
		movsx	ebx, bx
		idiv	ebx

loc_17490:				; CODE XREF: seg033:0263j seg033:0273j
		mov	[bp-30h], eax

loc_17494:				; CODE XREF: seg033:0257j
		mov	ax, [bp-16h]
		mov	[bp-3Ah], ax
		mov	ax, [bp-2]
		mov	[bp-3Ch], ax
		xor	ebx, ebx
		cmp	[bp-24h], bx
		jnz	short loc_174AD
		nop
		nop
		jmp	loc_175D6
; ���������������������������������������������������������������������������

loc_174AD:				; CODE XREF: seg033:02A6j
		cmp	[bp-1Eh], bx
		jl	short loc_174B7
		nop
		nop
		jmp	loc_17538
; ���������������������������������������������������������������������������

loc_174B7:				; CODE XREF: seg033:02B0j
		cmp	[bp-20h], bx
		jge	short loc_174F6
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_174EA
		nop
		nop
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_174EA
		nop
		nop
		mov	edx, [bp-34h]
		cmp	[bp-38h], edx
		jge	short loc_174EA
		nop
		nop
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]
		mov	[bp-3Ah], dx
		jmp	short loc_174F0
; ���������������������������������������������������������������������������
		align 2

loc_174EA:				; CODE XREF: seg033:02C4j seg033:02CEj ...
		mov	cx, [bp-18h]
		mov	dx, [bp-16h]

loc_174F0:				; CODE XREF: seg033:02E7j
		mov	ax, [bp-8]
		jmp	loc_1757E
; ���������������������������������������������������������������������������

loc_174F6:				; CODE XREF: seg033:02BAj
		mov	ax, [bp-16h]
		cmp	[bp-12h], ax
		jz	short loc_17538
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_17529
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jle	short loc_1751F
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_17532
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1751F:				; CODE XREF: seg033:0312j
		mov	ax, [bp-18h]
		cmp	[bp-10h], ax
		jnz	short loc_1752C
		nop
		nop

loc_17529:				; CODE XREF: seg033:0306j
		jmp	loc_175D6
; ���������������������������������������������������������������������������

loc_1752C:				; CODE XREF: seg033:0325j
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_17532:				; CODE XREF: seg033:031Cj
		mov	ax, [bp-8]
		jmp	loc_175CA
; ���������������������������������������������������������������������������

loc_17538:				; CODE XREF: seg033:02B4j seg033:02FCj
		cmp	[bp-1Eh], bx
		jg	short loc_17542
		nop
		nop
		jmp	loc_175D6
; ���������������������������������������������������������������������������

loc_17542:				; CODE XREF: seg033:033Bj
		cmp	[bp-20h], bx
		jle	short loc_17590
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_17575
		nop
		nop
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_17575
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-38h], eax
		jle	short loc_17575
		nop
		nop
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]
		mov	[bp-3Ah], dx
		jmp	short loc_1757B
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17575:				; CODE XREF: seg033:034Fj seg033:0359j ...
		mov	cx, [bp-18h]
		mov	dx, [bp-16h]

loc_1757B:				; CODE XREF: seg033:0372j
		mov	ax, [bp-4]

loc_1757E:				; CODE XREF: seg033:02F3j
		sub	ax, cx
		mov	bx, [bp-10h]
		sub	bx, cx
		mov	cx, [bp-0Eh]
		sub	cx, dx
		mov	[bp-42h], cx
		jmp	short loc_175D6
; ���������������������������������������������������������������������������
		align 2

loc_17590:				; CODE XREF: seg033:0345j
		mov	ax, [bp-16h]
		cmp	[bp-12h], ax
		jz	short loc_175D6
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_175D6
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jge	short loc_175B9
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_175C7
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_175B9:				; CODE XREF: seg033:03ACj
		cmp	word ptr [bp-22h], 1
		jz	short loc_175D6
		nop
		nop
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_175C7:				; CODE XREF: seg033:03B6j
		mov	ax, [bp-4]

loc_175CA:				; CODE XREF: seg033:0335j
		sub	ax, [bp-18h]
		sub	bx, [bp-18h]
		sub	cx, [bp-16h]
		mov	[bp-42h], cx

loc_175D6:				; CODE XREF: seg033:02AAj
					; seg033:loc_17529j ...
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_175EB
		mov	ax, [bp-6]
		cmp	[bp-3Ah], ax
		jge	short loc_1765E
		jmp	short loc_17614
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_175EB:				; CODE XREF: seg033:03DEj
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, word ptr [bp-42h]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		mov	cx, ax
		mov	dx, cx
		add	dx, [bp-3Ah]
		mov	ax, [bp-6]
		cmp	ax, dx
		jle	short loc_17619
		nop
		nop

loc_17614:				; CODE XREF: seg033:03E8j
		sub	ax, [bp-3Ah]
		mov	cx, ax

loc_17619:				; CODE XREF: seg033:0410j
		add	[bp-3Ah], cx
		mov	cx, [bp-3Ah]
		sub	cx, [bp-16h]
		movsx	ecx, cx
		mov	eax, [bp-34h]
		imul	ecx
		add	[bp-2Ch], eax
		mov	dx, [bp-3Ah]
		sub	dx, [bp-12h]
		jl	short loc_17653
		nop
		nop
		mov	cx, dx
		mov	eax, [bp-38h]
		mov	[bp-30h], eax
		mov	ax, [bp-14h]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp-28h], eax

loc_17653:				; CODE XREF: seg033:0437j
		mov	eax, [bp-30h]
		imul	ecx
		add	[bp-28h], eax

loc_1765E:				; CODE XREF: seg033:03E6j
		xor	ebx, ebx
		cmp	[bp-24h], bx
		jnz	short loc_1766B
		nop
		nop
		jmp	loc_177BF
; ���������������������������������������������������������������������������

loc_1766B:				; CODE XREF: seg033:0464j
		cmp	[bp-22h], bx
		jl	short loc_17675
		nop
		nop
		jmp	loc_17700
; ���������������������������������������������������������������������������

loc_17675:				; CODE XREF: seg033:046Ej
		cmp	[bp-20h], bx
		jge	short loc_176C3
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_176A5
		nop
		nop
		mov	ax, [bp-12h]
		cmp	[bp-16h], ax
		jz	short loc_176A5
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jle	short loc_176A5
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_176AB
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_176A5:				; CODE XREF: seg033:0482j seg033:048Cj ...
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_176AB:				; CODE XREF: seg033:04A2j
		mov	ax, [bp-8]

loc_176AE:				; CODE XREF: seg033:0543j
		sub	ax, [bp-18h]
		sub	bx, [bp-18h]
		sub	cx, [bp-16h]
		mov	[bp-42h], cx
		mov	dx, [bp-16h]
		mov	[bp-3Ch], dx

loc_176C0:				; CODE XREF: seg033:04D3j
		jmp	loc_17794
; ���������������������������������������������������������������������������

loc_176C3:				; CODE XREF: seg033:0478j
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_17700
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_176C0
		mov	ax, [bp-10h]
		cmp	[bp-18h], ax
		jz	short loc_176F4
		nop
		nop
		mov	eax, [bp-38h]
		cmp	[bp-34h], eax
		jge	short loc_176F4
		nop
		nop
		mov	cx, [bp-18h]
		mov	dx, [bp-16h]
		jmp	short loc_176FA
; ���������������������������������������������������������������������������
		align 2

loc_176F4:				; CODE XREF: seg033:04DBj seg033:04E7j
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]

loc_176FA:				; CODE XREF: seg033:04F1j
		mov	ax, [bp-8]
		jmp	loc_17782
; ���������������������������������������������������������������������������

loc_17700:				; CODE XREF: seg033:0472j seg033:04C9j
		cmp	[bp-22h], bx
		jg	short loc_1770A
		nop
		nop
		jmp	loc_17794
; ���������������������������������������������������������������������������

loc_1770A:				; CODE XREF: seg033:0503j
		cmp	[bp-20h], bx
		jle	short loc_17746
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_1773A
		nop
		nop
		mov	ax, [bp-12h]
		cmp	[bp-16h], ax
		jz	short loc_1773A
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jge	short loc_1773A
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_17740
; ���������������������������������������������������������������������������
		align 2

loc_1773A:				; CODE XREF: seg033:0517j seg033:0521j ...
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_17740:				; CODE XREF: seg033:0537j
		mov	ax, [bp-4]
		jmp	loc_176AE
; ���������������������������������������������������������������������������

loc_17746:				; CODE XREF: seg033:050Dj
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_17794
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_17794
		nop
		nop
		mov	ax, [bp-10h]
		cmp	[bp-18h], ax
		jz	short loc_17779
		nop
		nop
		mov	eax, [bp-38h]
		cmp	[bp-34h], eax
		jle	short loc_17779
		nop
		nop
		mov	cx, [bp-10h]
		mov	dx, [bp-0Eh]
		jmp	short loc_1777F
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17779:				; CODE XREF: seg033:0560j seg033:056Cj
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]

loc_1777F:				; CODE XREF: seg033:0576j
		mov	ax, [bp-4]

loc_17782:				; CODE XREF: seg033:04FDj
		sub	ax, cx
		mov	bx, [bp-10h]
		sub	bx, cx
		mov	cx, [bp-0Eh]
		sub	cx, dx
		mov	[bp-42h], cx
		mov	[bp-3Ch], dx

loc_17794:				; CODE XREF: seg033:loc_176C0j
					; seg033:0507j	...
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_177A3
		nop
		nop
		jmp	short loc_177BF
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_177A3:				; CODE XREF: seg033:059Cj
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, word ptr [bp-42h]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp-3Ch], ax

loc_177BF:				; CODE XREF: seg033:0468j seg033:05A0j
		mov	si, [bp-26h]
		mov	di, [bp-2Ah]
		mov	cx, [bp-0Eh]
		cmp	[bp-3Ch], cx
		jl	short loc_177D2
		nop
		nop
		mov	[bp-3Ch], cx

loc_177D2:				; CODE XREF: seg033:05CBj
		mov	ax, [bp-2]
		cmp	[bp-3Ch], ax
		jle	short loc_177DF
		nop
		nop
		mov	[bp-3Ch], ax

loc_177DF:				; CODE XREF: seg033:05D8j
		mov	di, [bp+6]
		mov	si, [di+2]
		mov	es, word ptr [di]
		mov	ax, [bp-3Ah]
		shl	ax, 1
		add	si, ax
		mov	ax, [bp-3Ch]
		sub	ax, [bp-3Ah]
		inc	ax
		mov	[bp-46h], ax
		mov	ax, [bp-12h]
		sub	ax, [bp-3Ah]
		inc	ax
		mov	[bp-44h], ax
		mov	ebx, [bp-28h]
		mov	edx, [bp-2Ch]
		mov	eax, [bp-30h]
		mov	ecx, [bp-34h]
		cmp	word ptr [bp-24h], 0
		jz	short loc_17869
		nop
		nop
		jmp	loc_178F9
; ���������������������������������������������������������������������������

loc_1781D:				; CODE XREF: seg033:066Cj
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_17835
		nop
		nop
		xchg	bx, dx

loc_17835:				; CODE XREF: seg033:062Fj
		mov	cx, dx
		sub	cx, bx
		inc	cx
		mov	di, bx
		add	di, [si]
		mov	eax, [bp-1Ch]
		movzx	ecx, cx
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	word ptr [bp-44h]
		jz	short loc_17871

loc_17863:				; CODE XREF: seg033:067Fj
		add	ebx, eax
		add	edx, ecx

loc_17869:				; CODE XREF: seg033:0616j
		dec	word ptr [bp-46h]
		jns	short loc_1781D
		jmp	loc_178FE
; ���������������������������������������������������������������������������

loc_17871:				; CODE XREF: seg033:0661j
		mov	eax, [bp-38h]
		mov	bx, [bp-14h]
		shl	ebx, 10h
		mov	bx, 8000h
		jmp	short loc_17863
; ���������������������������������������������������������������������������
		jmp	short loc_178FE
; ���������������������������������������������������������������������������
		align 2

loc_17884:				; CODE XREF: seg033:06FCj
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_1789C
		nop
		nop
		xchg	bx, dx

loc_1789C:				; CODE XREF: seg033:0696j
		mov	ax, [bp-8]
		cmp	dx, ax
		jl	short loc_178D4
		cmp	bx, ax
		jge	short loc_178A9
		mov	bx, ax

loc_178A9:				; CODE XREF: seg033:06A5j
		mov	ax, [bp-4]
		cmp	dx, ax
		jle	short loc_178B2
		mov	dx, ax

loc_178B2:				; CODE XREF: seg033:06AEj
		cmp	bx, ax
		jg	short loc_178D4
		mov	cx, dx
		sub	cx, bx
		inc	cx
		mov	di, bx
		add	di, [si]
		mov	eax, [bp-1Ch]
		movzx	ecx, cx
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb

loc_178D4:				; CODE XREF: seg033:06A1j seg033:06B4j
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	word ptr [bp-44h]
		jnz	short loc_178F3
		mov	eax, [bp-38h]
		mov	bx, [bp-14h]
		shl	ebx, 10h
		add	bx, 8000h

loc_178F3:				; CODE XREF: seg033:06E2j
		add	ebx, eax
		add	edx, ecx

loc_178F9:				; CODE XREF: seg033:061Aj
		dec	word ptr [bp-46h]
		jns	short loc_17884

loc_178FE:				; CODE XREF: seg033:0113j
					; seg033:loc_173B9j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		enter	46h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+6]
		lea	di, [bp-0Ch]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+8]
		mov	ax, [bx]
		mov	[bp-18h], ax
		mov	ax, [bx+2]
		mov	[bp-16h], ax
		mov	bx, [bp+0Ah]
		mov	ax, [bx]
		mov	[bp-14h], ax
		mov	ax, [bx+2]
		mov	[bp-12h], ax
		mov	bx, [bp+0Ch]
		mov	ax, [bx]
		mov	[bp-10h], ax
		mov	ax, [bx+2]
		mov	[bp-0Eh], ax
		mov	ax, [bp-12h]
		cmp	[bp-16h], ax
		jnz	short loc_17982
		cmp	[bp-0Eh], ax
		jnz	short loc_17982
		mov	ax, [bp-18h]
		mov	bx, [bp-14h]
		mov	cx, [bp-10h]
		cmp	ax, bx
		jle	short loc_1795E
		nop
		nop
		xchg	ax, bx

loc_1795E:				; CODE XREF: seg033:0759j
		cmp	bx, cx
		jle	short loc_1796D
		nop
		nop
		xchg	bx, cx
		cmp	ax, bx
		jle	short loc_1796D
		nop
		nop
		xchg	ax, bx

loc_1796D:				; CODE XREF: seg033:0760j seg033:0768j
		push	word ptr [bp+0Eh]
		push	word ptr [bp-16h]
		push	cx
		push	ax
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_17202
		add	sp, 0Ah
		jmp	loc_17F8D
; ���������������������������������������������������������������������������

loc_17982:				; CODE XREF: seg033:0747j seg033:074Cj
		mov	eax, [bp-18h]
		mov	ebx, [bp-14h]
		mov	ecx, [bp-10h]
		cmp	eax, ecx
		jle	short loc_1799D
		cmp	ebx, ecx
		jl	short loc_1799D
		xchg	eax, ecx
		jmp	short loc_179A4
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1799D:				; CODE XREF: seg033:0791j seg033:0796j
		cmp	eax, ebx
		jle	short loc_179A4
		xchg	eax, ebx

loc_179A4:				; CODE XREF: seg033:079Aj seg033:07A0j
		cmp	ebx, ecx
		jle	short loc_179AC
		xchg	ebx, ecx

loc_179AC:				; CODE XREF: seg033:07A7j
		mov	[bp-18h], eax
		mov	[bp-14h], ebx
		mov	[bp-10h], ecx
		mov	si, [bp-8]
		mov	di, [bp-4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_179CF
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_179CF
		nop
		nop
		inc	dx

loc_179CF:				; CODE XREF: seg033:07C3j seg033:07CAj
		mov	[bp-1Eh], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_179E3
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_179E3
		nop
		nop
		inc	dx

loc_179E3:				; CODE XREF: seg033:07D7j seg033:07DEj
		mov	[bp-20h], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_179F7
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_179F7
		nop
		nop
		inc	dx

loc_179F7:				; CODE XREF: seg033:07EBj seg033:07F2j
		mov	[bp-22h], dx
		or	dx, [bp-20h]
		or	dx, [bp-1Eh]
		mov	[bp-24h], dx
		mov	ax, [bp-16h]
		cmp	[bp-2],	ax
		jl	short loc_17A25
		mov	ax, [bp-0Eh]
		cmp	[bp-6],	ax
		jg	short loc_17A25
		mov	ax, [bp-1Eh]
		cmp	ax, 0
		jz	short loc_17A28
		cmp	[bp-20h], ax
		jnz	short loc_17A28
		cmp	[bp-22h], ax
		jnz	short loc_17A28

loc_17A25:				; CODE XREF: seg033:0809j seg033:0811j
		jmp	loc_17F8D
; ���������������������������������������������������������������������������

loc_17A28:				; CODE XREF: seg033:0819j seg033:081Ej ...
		mov	ax, [bp-18h]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp-28h], eax
		mov	[bp-2Ch], eax
		xor	eax, eax
		mov	cx, [bp-1Eh]
		or	cx, cx
		jz	short loc_17A4D
		nop
		nop
		cmp	[bp-22h], cx
		jz	short loc_17A66
		nop
		nop

loc_17A4D:				; CODE XREF: seg033:0842j
		mov	ax, [bp-10h]
		sub	ax, [bp-18h]
		shl	eax, 10h
		cdq
		mov	bx, [bp-0Eh]
		sub	bx, [bp-16h]
		movsx	ebx, bx
		idiv	ebx

loc_17A66:				; CODE XREF: seg033:0849j
		mov	[bp-34h], eax
		xor	eax, eax
		mov	cx, [bp-12h]
		cmp	[bp-0Eh], cx
		jz	short loc_17A9F
		cmp	[bp-2],	cx
		jle	short loc_17A9F
		mov	cx, [bp-20h]
		or	cx, cx
		jz	short loc_17A86
		cmp	[bp-22h], cx
		jz	short loc_17A9F

loc_17A86:				; CODE XREF: seg033:087Fj
		mov	ax, [bp-10h]
		sub	ax, [bp-14h]
		shl	eax, 10h
		cdq
		mov	bx, [bp-0Eh]
		sub	bx, [bp-12h]
		movsx	ebx, bx
		idiv	ebx

loc_17A9F:				; CODE XREF: seg033:0873j seg033:0878j ...
		mov	[bp-38h], eax
		mov	cx, [bp-12h]
		cmp	[bp-16h], cx
		jnz	short loc_17AC6
		nop
		nop
		mov	ax, [bp-14h]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp-28h], eax
		mov	eax, [bp-38h]
		mov	[bp-30h], eax
		jmp	short loc_17B00
; ���������������������������������������������������������������������������
		align 2

loc_17AC6:				; CODE XREF: seg033:08A9j
		xor	eax, eax
		mov	cx, [bp-12h]
		cmp	[bp-6],	cx
		jg	short loc_17AFC
		nop
		nop
		mov	cx, [bp-1Eh]
		or	cx, cx
		jz	short loc_17AE3
		nop
		nop
		cmp	[bp-20h], cx
		jz	short loc_17AFC
		nop
		nop

loc_17AE3:				; CODE XREF: seg033:08D8j
		mov	ax, [bp-14h]
		sub	ax, [bp-18h]
		shl	eax, 10h
		cdq
		mov	bx, [bp-12h]
		sub	bx, [bp-16h]
		movsx	ebx, bx
		idiv	ebx

loc_17AFC:				; CODE XREF: seg033:08CFj seg033:08DFj
		mov	[bp-30h], eax

loc_17B00:				; CODE XREF: seg033:08C3j
		mov	ax, [bp-16h]
		mov	[bp-3Ah], ax
		mov	ax, [bp-2]
		mov	[bp-3Ch], ax
		xor	ebx, ebx
		cmp	[bp-24h], bx
		jnz	short loc_17B19
		nop
		nop
		jmp	loc_17C42
; ���������������������������������������������������������������������������

loc_17B19:				; CODE XREF: seg033:0912j
		cmp	[bp-1Eh], bx
		jl	short loc_17B23
		nop
		nop
		jmp	loc_17BA4
; ���������������������������������������������������������������������������

loc_17B23:				; CODE XREF: seg033:091Cj
		cmp	[bp-20h], bx
		jge	short loc_17B62
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_17B56
		nop
		nop
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_17B56
		nop
		nop
		mov	edx, [bp-34h]
		cmp	[bp-38h], edx
		jge	short loc_17B56
		nop
		nop
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]
		mov	[bp-3Ah], dx
		jmp	short loc_17B5C
; ���������������������������������������������������������������������������
		align 2

loc_17B56:				; CODE XREF: seg033:0930j seg033:093Aj ...
		mov	cx, [bp-18h]
		mov	dx, [bp-16h]

loc_17B5C:				; CODE XREF: seg033:0953j
		mov	ax, [bp-8]
		jmp	loc_17BEA
; ���������������������������������������������������������������������������

loc_17B62:				; CODE XREF: seg033:0926j
		mov	ax, [bp-16h]
		cmp	[bp-12h], ax
		jz	short loc_17BA4
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_17B95
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jle	short loc_17B8B
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_17B9E
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17B8B:				; CODE XREF: seg033:097Ej
		mov	ax, [bp-18h]
		cmp	[bp-10h], ax
		jnz	short loc_17B98
		nop
		nop

loc_17B95:				; CODE XREF: seg033:0972j
		jmp	loc_17C42
; ���������������������������������������������������������������������������

loc_17B98:				; CODE XREF: seg033:0991j
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_17B9E:				; CODE XREF: seg033:0988j
		mov	ax, [bp-8]
		jmp	loc_17C36
; ���������������������������������������������������������������������������

loc_17BA4:				; CODE XREF: seg033:0920j seg033:0968j
		cmp	[bp-1Eh], bx
		jg	short loc_17BAE
		nop
		nop
		jmp	loc_17C42
; ���������������������������������������������������������������������������

loc_17BAE:				; CODE XREF: seg033:09A7j
		cmp	[bp-20h], bx
		jle	short loc_17BFC
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_17BE1
		nop
		nop
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_17BE1
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-38h], eax
		jle	short loc_17BE1
		nop
		nop
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]
		mov	[bp-3Ah], dx
		jmp	short loc_17BE7
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17BE1:				; CODE XREF: seg033:09BBj seg033:09C5j ...
		mov	cx, [bp-18h]
		mov	dx, [bp-16h]

loc_17BE7:				; CODE XREF: seg033:09DEj
		mov	ax, [bp-4]

loc_17BEA:				; CODE XREF: seg033:095Fj
		sub	ax, cx
		mov	bx, [bp-10h]
		sub	bx, cx
		mov	cx, [bp-0Eh]
		sub	cx, dx
		mov	[bp-42h], cx
		jmp	short loc_17C42
; ���������������������������������������������������������������������������
		align 2

loc_17BFC:				; CODE XREF: seg033:09B1j
		mov	ax, [bp-16h]
		cmp	[bp-12h], ax
		jz	short loc_17C42
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_17C42
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jge	short loc_17C25
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_17C33
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17C25:				; CODE XREF: seg033:0A18j
		cmp	word ptr [bp-22h], 1
		jz	short loc_17C42
		nop
		nop
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_17C33:				; CODE XREF: seg033:0A22j
		mov	ax, [bp-4]

loc_17C36:				; CODE XREF: seg033:09A1j
		sub	ax, [bp-18h]
		sub	bx, [bp-18h]
		sub	cx, [bp-16h]
		mov	[bp-42h], cx

loc_17C42:				; CODE XREF: seg033:0916j
					; seg033:loc_17B95j ...
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_17C57
		mov	ax, [bp-6]
		cmp	[bp-3Ah], ax
		jge	short loc_17CCA
		jmp	short loc_17C80
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17C57:				; CODE XREF: seg033:0A4Aj
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, word ptr [bp-42h]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		mov	cx, ax
		mov	dx, cx
		add	dx, [bp-3Ah]
		mov	ax, [bp-6]
		cmp	ax, dx
		jle	short loc_17C85
		nop
		nop

loc_17C80:				; CODE XREF: seg033:0A54j
		sub	ax, [bp-3Ah]
		mov	cx, ax

loc_17C85:				; CODE XREF: seg033:0A7Cj
		add	[bp-3Ah], cx
		mov	cx, [bp-3Ah]
		sub	cx, [bp-16h]
		movsx	ecx, cx
		mov	eax, [bp-34h]
		imul	ecx
		add	[bp-2Ch], eax
		mov	dx, [bp-3Ah]
		sub	dx, [bp-12h]
		jl	short loc_17CBF
		nop
		nop
		mov	cx, dx
		mov	eax, [bp-38h]
		mov	[bp-30h], eax
		mov	ax, [bp-14h]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp-28h], eax

loc_17CBF:				; CODE XREF: seg033:0AA3j
		mov	eax, [bp-30h]
		imul	ecx
		add	[bp-28h], eax

loc_17CCA:				; CODE XREF: seg033:0A52j
		xor	ebx, ebx
		cmp	[bp-24h], bx
		jnz	short loc_17CD7
		nop
		nop
		jmp	loc_17E2B
; ���������������������������������������������������������������������������

loc_17CD7:				; CODE XREF: seg033:0AD0j
		cmp	[bp-22h], bx
		jl	short loc_17CE1
		nop
		nop
		jmp	loc_17D6C
; ���������������������������������������������������������������������������

loc_17CE1:				; CODE XREF: seg033:0ADAj
		cmp	[bp-20h], bx
		jge	short loc_17D2F
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_17D11
		nop
		nop
		mov	ax, [bp-12h]
		cmp	[bp-16h], ax
		jz	short loc_17D11
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jle	short loc_17D11
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_17D17
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17D11:				; CODE XREF: seg033:0AEEj seg033:0AF8j ...
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_17D17:				; CODE XREF: seg033:0B0Ej
		mov	ax, [bp-8]

loc_17D1A:				; CODE XREF: seg033:0BAFj
		sub	ax, [bp-18h]
		sub	bx, [bp-18h]
		sub	cx, [bp-16h]
		mov	[bp-42h], cx
		mov	dx, [bp-16h]
		mov	[bp-3Ch], dx

loc_17D2C:				; CODE XREF: seg033:0B3Fj
		jmp	loc_17E00
; ���������������������������������������������������������������������������

loc_17D2F:				; CODE XREF: seg033:0AE4j
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_17D6C
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_17D2C
		mov	ax, [bp-10h]
		cmp	[bp-18h], ax
		jz	short loc_17D60
		nop
		nop
		mov	eax, [bp-38h]
		cmp	[bp-34h], eax
		jge	short loc_17D60
		nop
		nop
		mov	cx, [bp-18h]
		mov	dx, [bp-16h]
		jmp	short loc_17D66
; ���������������������������������������������������������������������������
		align 2

loc_17D60:				; CODE XREF: seg033:0B47j seg033:0B53j
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]

loc_17D66:				; CODE XREF: seg033:0B5Dj
		mov	ax, [bp-8]
		jmp	loc_17DEE
; ���������������������������������������������������������������������������

loc_17D6C:				; CODE XREF: seg033:0ADEj seg033:0B35j
		cmp	[bp-22h], bx
		jg	short loc_17D76
		nop
		nop
		jmp	loc_17E00
; ���������������������������������������������������������������������������

loc_17D76:				; CODE XREF: seg033:0B6Fj
		cmp	[bp-20h], bx
		jle	short loc_17DB2
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-12h], ax
		jl	short loc_17DA6
		nop
		nop
		mov	ax, [bp-12h]
		cmp	[bp-16h], ax
		jz	short loc_17DA6
		nop
		nop
		mov	eax, [bp-34h]
		cmp	[bp-30h], eax
		jge	short loc_17DA6
		nop
		nop
		mov	bx, [bp-14h]
		mov	cx, [bp-12h]
		jmp	short loc_17DAC
; ���������������������������������������������������������������������������
		align 2

loc_17DA6:				; CODE XREF: seg033:0B83j seg033:0B8Dj ...
		mov	bx, [bp-10h]
		mov	cx, [bp-0Eh]

loc_17DAC:				; CODE XREF: seg033:0BA3j
		mov	ax, [bp-4]
		jmp	loc_17D1A
; ���������������������������������������������������������������������������

loc_17DB2:				; CODE XREF: seg033:0B79j
		mov	ax, [bp-0Eh]
		cmp	[bp-12h], ax
		jz	short loc_17E00
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-12h], ax
		jg	short loc_17E00
		nop
		nop
		mov	ax, [bp-10h]
		cmp	[bp-18h], ax
		jz	short loc_17DE5
		nop
		nop
		mov	eax, [bp-38h]
		cmp	[bp-34h], eax
		jle	short loc_17DE5
		nop
		nop
		mov	cx, [bp-10h]
		mov	dx, [bp-0Eh]
		jmp	short loc_17DEB
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17DE5:				; CODE XREF: seg033:0BCCj seg033:0BD8j
		mov	cx, [bp-14h]
		mov	dx, [bp-12h]

loc_17DEB:				; CODE XREF: seg033:0BE2j
		mov	ax, [bp-4]

loc_17DEE:				; CODE XREF: seg033:0B69j
		sub	ax, cx
		mov	bx, [bp-10h]
		sub	bx, cx
		mov	cx, [bp-0Eh]
		sub	cx, dx
		mov	[bp-42h], cx
		mov	[bp-3Ch], dx

loc_17E00:				; CODE XREF: seg033:loc_17D2Cj
					; seg033:0B73j	...
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_17E0F
		nop
		nop
		jmp	short loc_17E2B
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_17E0F:				; CODE XREF: seg033:0C08j
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, word ptr [bp-42h]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp-3Ch], ax

loc_17E2B:				; CODE XREF: seg033:0AD4j seg033:0C0Cj
		mov	si, [bp-26h]
		mov	di, [bp-2Ah]
		mov	cx, [bp-0Eh]
		cmp	[bp-3Ch], cx
		jl	short loc_17E3E
		nop
		nop
		mov	[bp-3Ch], cx

loc_17E3E:				; CODE XREF: seg033:0C37j
		mov	ax, [bp-2]
		cmp	[bp-3Ch], ax
		jle	short loc_17E4B
		nop
		nop
		mov	[bp-3Ch], ax

loc_17E4B:				; CODE XREF: seg033:0C44j
		mov	di, [bp+6]
		mov	si, [di+2]
		mov	es, word ptr [di]
		mov	ax, [bp-3Ah]
		shl	ax, 1
		add	si, ax
		mov	ax, [bp-3Ch]
		sub	ax, [bp-3Ah]
		mov	[bp-46h], ax
		mov	ax, [bp-12h]
		sub	ax, [bp-3Ah]
		inc	ax
		mov	[bp-44h], ax
		mov	ebx, [bp-28h]
		mov	edx, [bp-2Ch]
		mov	eax, [bp-30h]
		mov	ecx, [bp-34h]
		cmp	word ptr [bp-24h], 0
		jz	short loc_17EE7
		nop
		nop
		jmp	loc_17F86
; ���������������������������������������������������������������������������

loc_17E88:				; CODE XREF: seg033:0CEAj
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_17EA0
		nop
		nop
		xchg	bx, dx

loc_17EA0:				; CODE XREF: seg033:0C9Aj
		mov	cx, dx
		sub	cx, bx
		jnz	short loc_17EA9
		nop
		nop
		inc	cx

loc_17EA9:				; CODE XREF: seg033:0CA4j
		mov	di, bx
		add	di, [si]
		push	ds
		lds	bx, [bp+0Eh]
		test	di, 1
		jz	short loc_17EBE
		mov	al, es:[di]
		xlat
		stosb
		jmp	short loc_17ECB
; ���������������������������������������������������������������������������

loc_17EBE:				; CODE XREF: seg033:0CB5j
					; seg033:loc_17ECBj
		mov	ax, es:[di]
		xlat
		xchg	ah, al
		xlat
		xchg	al, ah
		dec	cx
		jz	short loc_17ECF
		stosw

loc_17ECB:				; CODE XREF: seg033:0CBCj
		loop	loc_17EBE
		jmp	short loc_17ED0
; ���������������������������������������������������������������������������

loc_17ECF:				; CODE XREF: seg033:0CC8j
		stosb

loc_17ED0:				; CODE XREF: seg033:0CCDj
		pop	ds
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	word ptr [bp-44h]
		jz	short loc_17EEF

loc_17EE1:				; CODE XREF: seg033:0CFDj
		add	ebx, eax
		add	edx, ecx

loc_17EE7:				; CODE XREF: seg033:0C81j
		dec	word ptr [bp-46h]
		jns	short loc_17E88
		jmp	loc_17F8D
; ���������������������������������������������������������������������������

loc_17EEF:				; CODE XREF: seg033:0CDFj
		mov	eax, [bp-38h]
		mov	bx, [bp-14h]
		shl	ebx, 10h
		mov	bx, 8000h
		jmp	short loc_17EE1
; ���������������������������������������������������������������������������
		jmp	loc_17F8D
; ���������������������������������������������������������������������������

loc_17F02:				; CODE XREF: seg033:0D89j
		push	ebx
		push	edx
		push	ax
		push	cx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_17F18
		nop
		nop
		xchg	bx, dx

loc_17F18:				; CODE XREF: seg033:0D12j
		mov	ax, [bp-8]
		cmp	dx, ax
		jl	short loc_17F63
		cmp	bx, ax
		jge	short loc_17F25
		mov	bx, ax

loc_17F25:				; CODE XREF: seg033:0D21j
		mov	ax, [bp-4]
		cmp	dx, ax
		jle	short loc_17F2E
		mov	dx, ax

loc_17F2E:				; CODE XREF: seg033:0D2Aj
		cmp	bx, ax
		jg	short loc_17F63
		mov	cx, dx
		sub	cx, bx
		jnz	short loc_17F3B
		nop
		nop
		inc	cx

loc_17F3B:				; CODE XREF: seg033:0D36j
		mov	di, bx
		add	di, [si]
		push	ds
		lds	bx, [bp+0Eh]
		test	di, 1
		jz	short loc_17F50
		mov	al, es:[di]
		xlat
		stosb
		jmp	short loc_17F5D
; ���������������������������������������������������������������������������

loc_17F50:				; CODE XREF: seg033:0D47j
					; seg033:loc_17F5Dj
		mov	ax, es:[di]
		xlat
		xchg	ah, al
		xlat
		xchg	al, ah
		dec	cx
		jz	short loc_17F61
		stosw

loc_17F5D:				; CODE XREF: seg033:0D4Ej
		loop	loc_17F50
		jmp	short loc_17F62
; ���������������������������������������������������������������������������

loc_17F61:				; CODE XREF: seg033:0D5Aj
		stosb

loc_17F62:				; CODE XREF: seg033:0D5Fj
		pop	ds

loc_17F63:				; CODE XREF: seg033:0D1Dj seg033:0D30j
		add	si, 2
		pop	cx
		pop	ax
		pop	edx
		pop	ebx
		dec	word ptr [bp-44h]
		jnz	short loc_17F80
		mov	eax, [bp-38h]
		mov	bx, [bp-14h]
		shl	ebx, 10h
		add	bx, 8000h

loc_17F80:				; CODE XREF: seg033:0D6Fj
		add	ebx, eax
		add	edx, ecx

loc_17F86:				; CODE XREF: seg033:0C85j
		dec	word ptr [bp-46h]
		jns	loc_17F02

loc_17F8D:				; CODE XREF: seg033:077Fj
					; seg033:loc_17A25j ...
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_17F91	proc far		; CODE XREF: seg033:0F30p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		enter	18h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		mov	ax, [bp+arg_4]
		mov	cx, [bp+arg_8]
		mov	es, [bp+var_C]
		mov	si, [bp+arg_A]
		cmp	[bp+var_6], si
		jg	loc_1808C
		cmp	[bp+var_2], si
		jl	loc_1808C
		shl	si, 1
		add	si, [bp+var_A]
		mov	di, [bp+var_8]
		cmp	dx, di
		jl	loc_1808C
		cmp	bx, di
		jge	short loc_17FDC
		nop
		nop
		mov	bx, di

loc_17FDC:				; CODE XREF: sub_17F91+45j
		mov	di, [bp+var_4]
		cmp	dx, di
		jle	short loc_17FE7
		nop
		nop
		mov	dx, di

loc_17FE7:				; CODE XREF: sub_17F91+50j
		cmp	bx, di
		jg	loc_1808C
		mov	di, bx
		mov	bx, cx
		mov	cx, dx
		mov	dx, ax
		sub	cx, di
		inc	cx
		add	di, [si]
		push	si
		xor	bh, bh
		xor	dh, dh
		mov	si, bx
		sub	si, dx
		jnz	short loc_18014
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_1808B
; ���������������������������������������������������������������������������
		align 2

loc_18014:				; CODE XREF: sub_17F91+72j
		mov	ah, 1
		jns	short loc_1801E
		nop
		nop
		neg	ah
		neg	si

loc_1801E:				; CODE XREF: sub_17F91+85j
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_18050
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_18049
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1802F:				; CODE XREF: sub_17F91+B4j
					; sub_17F91+BAj
		add	al, ah
		sub	dx, bx
		js	short loc_18047
		add	al, ah
		sub	dx, bx
		js	short loc_18047
		add	al, ah
		sub	dx, bx
		js	short loc_18047
		add	al, ah
		sub	dx, bx
		jns	short loc_1802F

loc_18047:				; CODE XREF: sub_17F91+A2j
					; sub_17F91+A8j ...
		add	dx, si

loc_18049:				; CODE XREF: sub_17F91+9Bj
		stosb
		dec	cx
		jnz	short loc_1802F
		jmp	short loc_1808B
; ���������������������������������������������������������������������������
		align 2

loc_18050:				; CODE XREF: sub_17F91+92j
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_18057:				; CODE XREF: sub_17F91+E7j
		cmp	cx, 4
		jl	short loc_1807D
		stosb
		sub	dx, bx
		js	short loc_18073
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_18073
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_18073
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_18077

loc_18073:				; CODE XREF: sub_17F91+CEj
					; sub_17F91+D4j ...
		add	dx, si
		add	al, ah

loc_18077:				; CODE XREF: sub_17F91+E0j
		dec	cx
		jnz	short loc_18057
		jmp	short loc_1808B
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1807D:				; CODE XREF: sub_17F91+C9j
					; sub_17F91+F8j
		stosb
		sub	dx, bx
		jns	short loc_18088
		nop
		nop
		add	dx, si
		add	al, ah

loc_18088:				; CODE XREF: sub_17F91+EFj
		dec	cx
		jnz	short loc_1807D

loc_1808B:				; CODE XREF: sub_17F91+80j
					; sub_17F91+BCj ...
		pop	si

loc_1808C:				; CODE XREF: sub_17F91+2Aj
					; sub_17F91+31j ...
		pop	di
		pop	si
		leave
		retf
sub_17F91	endp

; ���������������������������������������������������������������������������
		enter	4Eh, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+6]
		lea	di, [bp-0Ch]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+8]
		mov	ax, [bx]
		mov	[bp-1Eh], ax
		mov	ax, [bx+2]
		mov	[bp-1Ch], ax
		mov	bx, [bp+0Ah]
		mov	ax, [bx]
		mov	[bp-1Ah], ax
		mov	ax, [bx+2]
		mov	[bp-18h], ax
		mov	bx, [bp+0Ch]
		mov	ax, [bx]
		mov	[bp-16h], ax
		mov	ax, [bx+2]
		mov	[bp-14h], ax
		mov	bx, [bp+8]
		mov	al, [bx+4]
		mov	[bp-12h], ax
		mov	bx, [bp+0Ah]
		mov	al, [bx+4]
		mov	[bp-10h], ax
		mov	bx, [bp+0Ch]
		mov	al, [bx+4]
		mov	[bp-0Eh], ax
		mov	ax, [bp-18h]
		cmp	[bp-1Ch], ax
		jnz	short loc_18139
		cmp	[bp-14h], ax
		jnz	short loc_18139
		mov	ax, [bp-1Eh]
		mov	si, [bp-12h]
		mov	bx, [bp-1Ah]
		mov	dx, [bp-10h]
		mov	cx, [bp-16h]
		mov	di, [bp-0Eh]
		cmp	ax, bx
		jle	short loc_18112
		nop
		nop
		xchg	ax, bx
		xchg	si, dx

loc_18112:				; CODE XREF: seg033:0F0Bj
		cmp	bx, cx
		jle	short loc_18125
		nop
		nop
		xchg	bx, cx
		xchg	dx, di
		cmp	ax, bx
		jle	short loc_18125
		nop
		nop
		xchg	ax, bx
		xchg	si, dx

loc_18125:				; CODE XREF: seg033:0F14j seg033:0F1Ej
		push	word ptr [bp-1Ch]
		push	di
		push	cx
		push	si
		push	ax
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_17F91
		add	sp, 0Ch
		jmp	loc_188D4
; ���������������������������������������������������������������������������

loc_18139:				; CODE XREF: seg033:0EF0j seg033:0EF5j
		mov	eax, [bp-1Eh]
		mov	ebx, [bp-1Ah]
		mov	ecx, [bp-16h]
		cmp	eax, ecx
		jle	short loc_1815D
		cmp	ebx, ecx
		jl	short loc_1815D
		xchg	eax, ecx
		mov	dx, [bp-0Eh]
		xchg	dx, [bp-12h]
		mov	[bp-0Eh], dx
		jmp	short loc_1816D
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1815D:				; CODE XREF: seg033:0F48j seg033:0F4Dj
		cmp	eax, ebx
		jle	short loc_1816D
		xchg	eax, ebx
		mov	dx, [bp-10h]
		xchg	dx, [bp-12h]
		mov	[bp-10h], dx

loc_1816D:				; CODE XREF: seg033:0F5Aj seg033:0F60j
		cmp	ebx, ecx
		jle	short loc_1817E
		xchg	ebx, ecx
		mov	dx, [bp-0Eh]
		xchg	dx, [bp-10h]
		mov	[bp-0Eh], dx

loc_1817E:				; CODE XREF: seg033:0F70j
		mov	[bp-1Eh], eax
		mov	[bp-1Ah], ebx
		mov	[bp-16h], ecx
		mov	si, [bp-8]
		mov	di, [bp-4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_181A1
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_181A1
		nop
		nop
		inc	dx

loc_181A1:				; CODE XREF: seg033:0F95j seg033:0F9Cj
		mov	[bp-42h], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_181B5
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_181B5
		nop
		nop
		inc	dx

loc_181B5:				; CODE XREF: seg033:0FA9j seg033:0FB0j
		mov	[bp-44h], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_181C9
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_181C9
		nop
		nop
		inc	dx

loc_181C9:				; CODE XREF: seg033:0FBDj seg033:0FC4j
		mov	[bp-46h], dx
		or	dx, [bp-44h]
		or	dx, [bp-42h]
		mov	[bp-48h], dx
		mov	ax, [bp-1Ch]
		cmp	[bp-2],	ax
		jl	short loc_181F7
		mov	ax, [bp-14h]
		cmp	[bp-6],	ax
		jg	short loc_181F7
		mov	ax, [bp-42h]
		cmp	ax, 0
		jz	short loc_181FA
		cmp	[bp-44h], ax
		jnz	short loc_181FA
		cmp	[bp-46h], ax
		jnz	short loc_181FA

loc_181F7:				; CODE XREF: seg033:0FDBj seg033:0FE3j
		jmp	loc_188D4
; ���������������������������������������������������������������������������

loc_181FA:				; CODE XREF: seg033:0FEBj seg033:0FF0j ...
		mov	ax, [bp-1Eh]
		shl	eax, 10h
		add	ax, 8000h
		mov	[bp-26h], eax
		mov	[bp-32h], eax
		mov	ax, [bp-12h]
		shl	ax, 8
		add	ax, 80h	; '�'
		mov	[bp-2Ch], ax
		mov	[bp-38h], ax
		xor	eax, eax
		mov	bx, [bp-14h]
		sub	bx, [bp-1Ch]
		mov	ax, [bp-0Eh]
		sub	ax, [bp-12h]
		cwd
		mov	ah, al
		xor	al, al
		idiv	bx
		mov	[bp-3Ah], ax
		mov	ax, [bp-16h]
		sub	ax, [bp-1Eh]
		shl	eax, 10h
		cdq
		mov	bx, [bp-14h]
		sub	bx, [bp-1Ch]
		movsx	ebx, bx
		idiv	ebx
		mov	[bp-36h], eax
		xor	eax, eax
		mov	bx, [bp-14h]
		mov	cx, [bp-18h]
		sub	bx, cx
		jz	short loc_1828A
		nop
		nop
		cmp	[bp-2],	cx
		jle	short loc_1828A
		nop
		nop
		mov	ax, [bp-0Eh]
		sub	ax, [bp-10h]
		cwd
		mov	ah, al
		xor	al, al
		idiv	bx
		mov	[bp-40h], ax
		mov	ax, [bp-16h]
		sub	ax, [bp-1Ah]
		shl	eax, 10h
		cdq
		movsx	ebx, bx
		idiv	ebx

loc_1828A:				; CODE XREF: seg033:105Cj seg033:1063j
		mov	[bp-3Eh], eax
		mov	bx, [bp-18h]
		sub	bx, [bp-1Ch]
		jnz	short loc_182C3
		nop
		nop
		mov	ax, [bp-1Ah]
		shl	eax, 10h
		add	ax, 8000h
		mov	[bp-26h], eax
		mov	eax, [bp-3Eh]
		mov	[bp-2Ah], eax
		mov	ax, [bp-10h]
		shl	ax, 8
		add	ax, 80h	; '�'
		mov	[bp-2Ch], ax
		mov	ax, [bp-40h]
		mov	[bp-2Eh], ax
		jmp	short loc_182F6
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_182C3:				; CODE XREF: seg033:1094j
		xor	eax, eax
		mov	cx, [bp-18h]
		cmp	[bp-6],	cx
		jg	short loc_182E3
		nop
		nop
		mov	ax, [bp-1Ah]
		sub	ax, [bp-1Eh]
		shl	eax, 10h
		cdq
		movsx	ebx, bx
		idiv	ebx

loc_182E3:				; CODE XREF: seg033:10CCj
		mov	[bp-2Ah], eax
		mov	ax, [bp-10h]
		sub	ax, [bp-12h]
		cwd
		shl	ax, 8
		idiv	bx
		mov	[bp-2Eh], ax

loc_182F6:				; CODE XREF: seg033:10C0j
		mov	ax, [bp-1Ch]
		mov	[bp-20h], ax
		mov	ax, [bp-2]
		mov	[bp-22h], ax
		xor	ebx, ebx
		cmp	[bp-48h], bx
		jnz	short loc_1830F
		nop
		nop
		jmp	loc_18438
; ���������������������������������������������������������������������������

loc_1830F:				; CODE XREF: seg033:1108j
		cmp	[bp-42h], bx
		jl	short loc_18319
		nop
		nop
		jmp	loc_1839A
; ���������������������������������������������������������������������������

loc_18319:				; CODE XREF: seg033:1112j
		cmp	[bp-44h], bx
		jge	short loc_18358
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-18h], ax
		jg	short loc_1834C
		nop
		nop
		mov	ax, [bp-14h]
		cmp	[bp-18h], ax
		jz	short loc_1834C
		nop
		nop
		mov	edx, [bp-36h]
		cmp	[bp-3Eh], edx
		jge	short loc_1834C
		nop
		nop
		mov	cx, [bp-1Ah]
		mov	dx, [bp-18h]
		mov	[bp-20h], dx
		jmp	short loc_18352
; ���������������������������������������������������������������������������
		align 2

loc_1834C:				; CODE XREF: seg033:1126j seg033:1130j ...
		mov	cx, [bp-1Eh]
		mov	dx, [bp-1Ch]

loc_18352:				; CODE XREF: seg033:1149j
		mov	ax, [bp-8]
		jmp	loc_183E0
; ���������������������������������������������������������������������������

loc_18358:				; CODE XREF: seg033:111Cj
		mov	ax, [bp-1Ch]
		cmp	[bp-18h], ax
		jz	short loc_1839A
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-18h], ax
		jl	short loc_1838B
		nop
		nop
		mov	eax, [bp-36h]
		cmp	[bp-2Ah], eax
		jle	short loc_18381
		nop
		nop
		mov	bx, [bp-1Ah]
		mov	cx, [bp-18h]
		jmp	short loc_18394
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_18381:				; CODE XREF: seg033:1174j
		mov	ax, [bp-1Eh]
		cmp	[bp-16h], ax
		jnz	short loc_1838E
		nop
		nop

loc_1838B:				; CODE XREF: seg033:1168j
		jmp	loc_18438
; ���������������������������������������������������������������������������

loc_1838E:				; CODE XREF: seg033:1187j
		mov	bx, [bp-16h]
		mov	cx, [bp-14h]

loc_18394:				; CODE XREF: seg033:117Ej
		mov	ax, [bp-8]
		jmp	loc_1842C
; ���������������������������������������������������������������������������

loc_1839A:				; CODE XREF: seg033:1116j seg033:115Ej
		cmp	[bp-42h], bx
		jg	short loc_183A4
		nop
		nop
		jmp	loc_18438
; ���������������������������������������������������������������������������

loc_183A4:				; CODE XREF: seg033:119Dj
		cmp	[bp-44h], bx
		jle	short loc_183F2
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-18h], ax
		jg	short loc_183D7
		nop
		nop
		mov	ax, [bp-14h]
		cmp	[bp-18h], ax
		jz	short loc_183D7
		nop
		nop
		mov	eax, [bp-36h]
		cmp	[bp-3Eh], eax
		jle	short loc_183D7
		nop
		nop
		mov	cx, [bp-1Ah]
		mov	dx, [bp-18h]
		mov	[bp-20h], dx
		jmp	short loc_183DD
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_183D7:				; CODE XREF: seg033:11B1j seg033:11BBj ...
		mov	cx, [bp-1Eh]
		mov	dx, [bp-1Ch]

loc_183DD:				; CODE XREF: seg033:11D4j
		mov	ax, [bp-4]

loc_183E0:				; CODE XREF: seg033:1155j
		sub	ax, cx
		mov	bx, [bp-16h]
		sub	bx, cx
		mov	cx, [bp-14h]
		sub	cx, dx
		mov	[bp-4Eh], cx
		jmp	short loc_18438
; ���������������������������������������������������������������������������
		align 2

loc_183F2:				; CODE XREF: seg033:11A7j
		mov	ax, [bp-1Ch]
		cmp	[bp-18h], ax
		jz	short loc_18438
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-18h], ax
		jl	short loc_18438
		nop
		nop
		mov	eax, [bp-36h]
		cmp	[bp-2Ah], eax
		jge	short loc_1841B
		nop
		nop
		mov	bx, [bp-1Ah]
		mov	cx, [bp-18h]
		jmp	short loc_18429
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1841B:				; CODE XREF: seg033:120Ej
		cmp	word ptr [bp-46h], 1
		jz	short loc_18438
		nop
		nop
		mov	bx, [bp-16h]
		mov	cx, [bp-14h]

loc_18429:				; CODE XREF: seg033:1218j
		mov	ax, [bp-4]

loc_1842C:				; CODE XREF: seg033:1197j
		sub	ax, [bp-1Eh]
		sub	bx, [bp-1Eh]
		sub	cx, [bp-1Ch]
		mov	[bp-4Eh], cx

loc_18438:				; CODE XREF: seg033:110Cj
					; seg033:loc_1838Bj ...
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_18451
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-20h], ax
		jge	loc_184E6
		jmp	short loc_1847A
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_18451:				; CODE XREF: seg033:1240j
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, word ptr [bp-4Eh]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		mov	cx, ax
		mov	dx, cx
		add	dx, [bp-20h]
		mov	ax, [bp-6]
		cmp	ax, dx
		jle	short loc_1847F
		nop
		nop

loc_1847A:				; CODE XREF: seg033:124Ej
		sub	ax, [bp-20h]
		mov	cx, ax

loc_1847F:				; CODE XREF: seg033:1276j
		add	[bp-20h], cx
		mov	cx, [bp-20h]
		sub	cx, [bp-1Ch]
		movsx	ecx, cx
		mov	ax, [bp-3Ah]
		imul	cx
		add	[bp-38h], ax
		mov	eax, [bp-36h]
		imul	ecx
		add	[bp-32h], eax
		mov	dx, [bp-20h]
		sub	dx, [bp-18h]
		jl	short loc_184D3
		nop
		nop
		mov	cx, dx
		mov	eax, [bp-3Eh]
		mov	[bp-2Ah], eax
		mov	ax, [bp-1Ah]
		shl	eax, 10h
		add	ax, 8000h
		mov	[bp-26h], eax
		mov	ax, [bp-40h]
		mov	[bp-2Eh], ax
		mov	ax, [bp-10h]
		shl	ax, 8
		add	ax, 80h	; '�'
		mov	[bp-2Ch], ax

loc_184D3:				; CODE XREF: seg033:12A5j
		mov	ax, [bp-2Eh]
		imul	cx
		add	[bp-2Ch], ax
		mov	eax, [bp-2Ah]
		imul	ecx
		add	[bp-26h], eax

loc_184E6:				; CODE XREF: seg033:124Aj
		xor	ebx, ebx
		cmp	[bp-48h], bx
		jnz	short loc_184F3
		nop
		nop
		jmp	loc_18647
; ���������������������������������������������������������������������������

loc_184F3:				; CODE XREF: seg033:12ECj
		cmp	[bp-46h], bx
		jl	short loc_184FD
		nop
		nop
		jmp	loc_18588
; ���������������������������������������������������������������������������

loc_184FD:				; CODE XREF: seg033:12F6j
		cmp	[bp-44h], bx
		jge	short loc_1854B
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-18h], ax
		jl	short loc_1852D
		nop
		nop
		mov	ax, [bp-18h]
		cmp	[bp-1Ch], ax
		jz	short loc_1852D
		nop
		nop
		mov	eax, [bp-36h]
		cmp	[bp-2Ah], eax
		jle	short loc_1852D
		nop
		nop
		mov	bx, [bp-1Ah]
		mov	cx, [bp-18h]
		jmp	short loc_18533
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1852D:				; CODE XREF: seg033:130Aj seg033:1314j ...
		mov	bx, [bp-16h]
		mov	cx, [bp-14h]

loc_18533:				; CODE XREF: seg033:132Aj
		mov	ax, [bp-8]

loc_18536:				; CODE XREF: seg033:13CBj
		sub	ax, [bp-1Eh]
		sub	bx, [bp-1Eh]
		sub	cx, [bp-1Ch]
		mov	[bp-4Eh], cx
		mov	dx, [bp-1Ch]
		mov	[bp-22h], dx

loc_18548:				; CODE XREF: seg033:135Bj
		jmp	loc_1861C
; ���������������������������������������������������������������������������

loc_1854B:				; CODE XREF: seg033:1300j
		mov	ax, [bp-14h]
		cmp	[bp-18h], ax
		jz	short loc_18588
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-18h], ax
		jg	short loc_18548
		mov	ax, [bp-16h]
		cmp	[bp-1Eh], ax
		jz	short loc_1857C
		nop
		nop
		mov	eax, [bp-3Eh]
		cmp	[bp-36h], eax
		jge	short loc_1857C
		nop
		nop
		mov	cx, [bp-1Eh]
		mov	dx, [bp-1Ch]
		jmp	short loc_18582
; ���������������������������������������������������������������������������
		align 2

loc_1857C:				; CODE XREF: seg033:1363j seg033:136Fj
		mov	cx, [bp-1Ah]
		mov	dx, [bp-18h]

loc_18582:				; CODE XREF: seg033:1379j
		mov	ax, [bp-8]
		jmp	loc_1860A
; ���������������������������������������������������������������������������

loc_18588:				; CODE XREF: seg033:12FAj seg033:1351j
		cmp	[bp-46h], bx
		jg	short loc_18592
		nop
		nop
		jmp	loc_1861C
; ���������������������������������������������������������������������������

loc_18592:				; CODE XREF: seg033:138Bj
		cmp	[bp-44h], bx
		jle	short loc_185CE
		nop
		nop
		mov	ax, [bp-6]
		cmp	[bp-18h], ax
		jl	short loc_185C2
		nop
		nop
		mov	ax, [bp-18h]
		cmp	[bp-1Ch], ax
		jz	short loc_185C2
		nop
		nop
		mov	eax, [bp-36h]
		cmp	[bp-2Ah], eax
		jge	short loc_185C2
		nop
		nop
		mov	bx, [bp-1Ah]
		mov	cx, [bp-18h]
		jmp	short loc_185C8
; ���������������������������������������������������������������������������
		align 2

loc_185C2:				; CODE XREF: seg033:139Fj seg033:13A9j ...
		mov	bx, [bp-16h]
		mov	cx, [bp-14h]

loc_185C8:				; CODE XREF: seg033:13BFj
		mov	ax, [bp-4]
		jmp	loc_18536
; ���������������������������������������������������������������������������

loc_185CE:				; CODE XREF: seg033:1395j
		mov	ax, [bp-14h]
		cmp	[bp-18h], ax
		jz	short loc_1861C
		nop
		nop
		mov	ax, [bp-2]
		cmp	[bp-18h], ax
		jg	short loc_1861C
		nop
		nop
		mov	ax, [bp-16h]
		cmp	[bp-1Eh], ax
		jz	short loc_18601
		nop
		nop
		mov	eax, [bp-3Eh]
		cmp	[bp-36h], eax
		jle	short loc_18601
		nop
		nop
		mov	cx, [bp-16h]
		mov	dx, [bp-14h]
		jmp	short loc_18607
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_18601:				; CODE XREF: seg033:13E8j seg033:13F4j
		mov	cx, [bp-1Ah]
		mov	dx, [bp-18h]

loc_18607:				; CODE XREF: seg033:13FEj
		mov	ax, [bp-4]

loc_1860A:				; CODE XREF: seg033:1385j
		sub	ax, cx
		mov	bx, [bp-16h]
		sub	bx, cx
		mov	cx, [bp-14h]
		sub	cx, dx
		mov	[bp-4Eh], cx
		mov	[bp-22h], dx

loc_1861C:				; CODE XREF: seg033:loc_18548j
					; seg033:138Fj	...
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_1862B
		nop
		nop
		jmp	short loc_18647
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1862B:				; CODE XREF: seg033:1424j
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, word ptr [bp-4Eh]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp-22h], ax

loc_18647:				; CODE XREF: seg033:12F0j seg033:1428j
		mov	si, [bp-24h]
		mov	di, [bp-30h]
		mov	cx, [bp-14h]
		cmp	[bp-22h], cx
		jl	short loc_1865A
		nop
		nop
		mov	[bp-22h], cx

loc_1865A:				; CODE XREF: seg033:1453j
		mov	ax, [bp-2]
		cmp	[bp-22h], ax
		jle	short loc_18667
		nop
		nop
		mov	[bp-22h], ax

loc_18667:				; CODE XREF: seg033:1460j
		mov	si, [bp-0Ah]
		mov	es, word ptr [bp-0Ch]
		mov	ax, [bp-20h]
		shl	ax, 1
		add	si, ax
		mov	ax, [bp-22h]
		sub	ax, [bp-20h]
		inc	ax
		mov	[bp-4Ah], ax
		mov	ax, [bp-18h]
		sub	ax, [bp-20h]
		inc	ax
		mov	[bp-4Ch], ax
		mov	ebx, [bp-26h]
		mov	edx, [bp-32h]
		mov	eax, [bp-2Ah]
		mov	ecx, [bp-36h]
		cmp	word ptr [bp-48h], 0
		jz	loc_187A2
		jmp	loc_188CD
; ���������������������������������������������������������������������������

loc_186A3:				; CODE XREF: seg033:15A5j
		push	ebx
		push	edx
		shr	ebx, 10h
		shr	edx, 10h
		mov	al, [bp-2Bh]
		mov	cl, [bp-37h]
		cmp	bx, dx
		jle	short loc_186BE
		nop
		nop
		xchg	bx, dx
		xchg	ax, cx

loc_186BE:				; CODE XREF: seg033:14B7j
		mov	di, bx
		mov	bx, cx
		mov	cx, dx
		mov	dx, ax
		sub	cx, di
		inc	cx
		add	di, [si]
		push	si
		xor	bh, bh
		xor	dh, dh
		mov	si, bx
		sub	si, dx
		jnz	short loc_186E5
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_1875C
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_186E5:				; CODE XREF: seg033:14D4j
		mov	ah, 1
		jns	short loc_186EF
		nop
		nop
		neg	ah
		neg	si

loc_186EF:				; CODE XREF: seg033:14E7j
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_18721
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_1871A
; ���������������������������������������������������������������������������
		align 2

loc_18700:				; CODE XREF: seg033:1516j seg033:151Cj
		add	al, ah
		sub	dx, bx
		js	short loc_18718
		add	al, ah
		sub	dx, bx
		js	short loc_18718
		add	al, ah
		sub	dx, bx
		js	short loc_18718
		add	al, ah
		sub	dx, bx
		jns	short loc_18700

loc_18718:				; CODE XREF: seg033:1504j seg033:150Aj ...
		add	dx, si

loc_1871A:				; CODE XREF: seg033:14FDj
		stosb
		dec	cx
		jnz	short loc_18700
		jmp	short loc_1875C
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_18721:				; CODE XREF: seg033:14F4j
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_18728:				; CODE XREF: seg033:1549j
		cmp	cx, 4
		jl	short loc_1874E
		stosb
		sub	dx, bx
		js	short loc_18744
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_18744
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_18744
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_18748

loc_18744:				; CODE XREF: seg033:1530j seg033:1536j ...
		add	dx, si
		add	al, ah

loc_18748:				; CODE XREF: seg033:1542j
		dec	cx
		jnz	short loc_18728
		jmp	short loc_1875C
; ���������������������������������������������������������������������������
		align 2

loc_1874E:				; CODE XREF: seg033:152Bj seg033:155Aj
		stosb
		sub	dx, bx
		jns	short loc_18759
		nop
		nop
		add	dx, si
		add	al, ah

loc_18759:				; CODE XREF: seg033:1551j
		dec	cx
		jnz	short loc_1874E

loc_1875C:				; CODE XREF: seg033:14E2j seg033:151Ej ...
		pop	si
		add	si, 2
		pop	edx
		pop	ebx
		dec	word ptr [bp-4Ch]
		jnz	short loc_1878E
		mov	eax, [bp-3Eh]
		mov	[bp-2Ah], eax
		mov	ax, [bp-40h]
		mov	[bp-2Eh], ax
		mov	bx, [bp-1Ah]
		shl	ebx, 10h
		add	bx, 8000h
		mov	ax, [bp-10h]
		shl	ax, 8
		add	ax, 80h	; '�'
		mov	[bp-2Ch], ax

loc_1878E:				; CODE XREF: seg033:1567j
		add	ebx, [bp-2Ah]
		mov	ax, [bp-2Eh]
		add	[bp-2Ch], ax
		add	edx, [bp-36h]
		mov	ax, [bp-3Ah]
		add	[bp-38h], ax

loc_187A2:				; CODE XREF: seg033:149Cj
		dec	word ptr [bp-4Ah]
		jns	loc_186A3
		jmp	loc_188D4
; ���������������������������������������������������������������������������

loc_187AC:				; CODE XREF: seg033:16D0j
		push	ebx
		push	edx
		shr	ebx, 10h
		shr	edx, 10h
		mov	al, [bp-2Bh]
		mov	cl, [bp-37h]
		cmp	bx, dx
		jle	short loc_187C7
		nop
		nop
		xchg	bx, dx
		xchg	ax, cx

loc_187C7:				; CODE XREF: seg033:15C0j
		mov	di, [bp-8]
		cmp	dx, di
		jl	loc_18888
		cmp	bx, di
		jge	short loc_187D8
		nop
		nop
		mov	bx, di

loc_187D8:				; CODE XREF: seg033:15D2j
		mov	di, [bp-4]
		cmp	dx, di
		jle	short loc_187E3
		nop
		nop
		mov	dx, di

loc_187E3:				; CODE XREF: seg033:15DDj
		cmp	bx, di
		jg	loc_18888
		mov	di, bx
		mov	bx, cx
		mov	cx, dx
		mov	dx, ax
		sub	cx, di
		inc	cx
		add	di, [si]
		push	si
		xor	bh, bh
		xor	dh, dh
		mov	si, bx
		sub	si, dx
		jnz	short loc_18810
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_18887
; ���������������������������������������������������������������������������
		align 2

loc_18810:				; CODE XREF: seg033:15FFj
		mov	ah, 1
		jns	short loc_1881A
		nop
		nop
		neg	ah
		neg	si

loc_1881A:				; CODE XREF: seg033:1612j
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_1884C
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_18845
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_1882B:				; CODE XREF: seg033:1641j seg033:1647j
		add	al, ah
		sub	dx, bx
		js	short loc_18843
		add	al, ah
		sub	dx, bx
		js	short loc_18843
		add	al, ah
		sub	dx, bx
		js	short loc_18843
		add	al, ah
		sub	dx, bx
		jns	short loc_1882B

loc_18843:				; CODE XREF: seg033:162Fj seg033:1635j ...
		add	dx, si

loc_18845:				; CODE XREF: seg033:1628j
		stosb
		dec	cx
		jnz	short loc_1882B
		jmp	short loc_18887
; ���������������������������������������������������������������������������
		align 2

loc_1884C:				; CODE XREF: seg033:161Fj
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_18853:				; CODE XREF: seg033:1674j
		cmp	cx, 4
		jl	short loc_18879
		stosb
		sub	dx, bx
		js	short loc_1886F
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1886F
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1886F
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_18873

loc_1886F:				; CODE XREF: seg033:165Bj seg033:1661j ...
		add	dx, si
		add	al, ah

loc_18873:				; CODE XREF: seg033:166Dj
		dec	cx
		jnz	short loc_18853
		jmp	short loc_18887
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_18879:				; CODE XREF: seg033:1656j seg033:1685j
		stosb
		sub	dx, bx
		jns	short loc_18884
		nop
		nop
		add	dx, si
		add	al, ah

loc_18884:				; CODE XREF: seg033:167Cj
		dec	cx
		jnz	short loc_18879

loc_18887:				; CODE XREF: seg033:160Dj seg033:1649j ...
		pop	si

loc_18888:				; CODE XREF: seg033:15CCj seg033:15E5j
		add	si, 2
		pop	edx
		pop	ebx
		dec	word ptr [bp-4Ch]
		jnz	short loc_188B9
		mov	eax, [bp-3Eh]
		mov	[bp-2Ah], eax
		mov	ax, [bp-40h]
		mov	[bp-2Eh], ax
		mov	bx, [bp-1Ah]
		shl	ebx, 10h
		add	bx, 8000h
		mov	ax, [bp-10h]
		shl	ax, 8
		add	ax, 80h	; '�'
		mov	[bp-2Ch], ax

loc_188B9:				; CODE XREF: seg033:1692j
		add	ebx, [bp-2Ah]
		mov	ax, [bp-2Eh]
		add	[bp-2Ch], ax
		add	edx, [bp-36h]
		mov	ax, [bp-3Ah]
		add	[bp-38h], ax

loc_188CD:				; CODE XREF: seg033:14A0j
		dec	word ptr [bp-4Ah]
		jns	loc_187AC

loc_188D4:				; CODE XREF: seg033:0F36j
					; seg033:loc_181F7j ...
		pop	di
		pop	si
		leave
		retf
seg033		ends
