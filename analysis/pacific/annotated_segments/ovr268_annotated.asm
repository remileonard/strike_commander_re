ovr268		segment	para public 'OVERLAY' use16
		assume cs:ovr268
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2030		proc far

var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= byte ptr -3Eh
var_3D		= byte ptr -3Dh
var_3C		= dword ptr -3Ch
var_37		= byte ptr -37h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		xor	eax, eax
		mov	[bp+var_12], eax
		mov	[bp+var_E], eax
		mov	[bp+var_16], eax
		mov	[bp+var_A], eax
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A208A
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax

loc_A208A:
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A20A2
		jmp	loc_A2310

loc_A20A2:
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A20BA
		jmp	loc_A21D7

loc_A20BA:
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		mov	eax, [si+72h]
		mov	[bp+var_46], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_A2198

loc_A214B:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9
		ja	short loc_A2160
		shl	bx, 1
		jmp	cs:off_A284F[bx]	; switch jump

loc_A2160:
		add	[bp+var_A], 1Eh
		jmp	short loc_A2193

loc_A2167:
		jmp	short loc_A2160

loc_A2169:
		add	[bp+var_A], 20h
		jmp	short loc_A2193

loc_A2170:
		add	[bp+var_A], 24h
		jmp	short loc_A2193

loc_A2177:
		jmp	short loc_A2160

loc_A2179:
		add	[bp+var_A], 2Ch
		jmp	short loc_A2193

loc_A2180:
		add	[bp+var_A], 34h
		jmp	short loc_A2193

loc_A2187:
		add	[bp+var_A], 2Eh
		jmp	short loc_A2193

loc_A218E:
		add	[bp+var_A], 36h

loc_A2193:
		inc	dx
		add	[bp+var_4E], 8

loc_A2198:
		cmp	dx, di
		jb	short loc_A214B
		cmp	[bp+var_3D], 0
		jz	short loc_A21C0
		cmp	[bp+var_42], 0
		jz	short loc_A21C0
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A21C0

loc_A21C0:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		jmp	loc_A2309

loc_A21D7:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A21EF
		jmp	loc_A2309

loc_A21EF:
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		mov	eax, [si+72h]
		mov	[bp+var_46], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_A22CD

loc_A2280:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9
		ja	short loc_A2295
		shl	bx, 1
		jmp	cs:off_A283B[bx]	; switch jump

loc_A2295:
		add	[bp+var_A], 1Eh
		jmp	short loc_A22C8

loc_A229C:
		jmp	short loc_A2295

loc_A229E:
		add	[bp+var_A], 20h
		jmp	short loc_A22C8

loc_A22A5:
		add	[bp+var_A], 24h
		jmp	short loc_A22C8

loc_A22AC:
		jmp	short loc_A2295

loc_A22AE:
		add	[bp+var_A], 2Ch
		jmp	short loc_A22C8

loc_A22B5:
		add	[bp+var_A], 34h
		jmp	short loc_A22C8

loc_A22BC:
		add	[bp+var_A], 2Eh
		jmp	short loc_A22C8

loc_A22C3:
		add	[bp+var_A], 36h

loc_A22C8:
		inc	dx
		add	[bp+var_4E], 8

loc_A22CD:
		cmp	dx, di
		jb	short loc_A2280
		cmp	[bp+var_3D], 0
		jz	short loc_A22F5
		cmp	[bp+var_42], 0
		jz	short loc_A22F5
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A22F5

loc_A22F5:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0

loc_A2309:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A2310:
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A2328
		jmp	loc_A245F

loc_A2328:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A2340
		jmp	loc_A2458

loc_A2340:
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_6], ax
		mov	eax, [si+72h]
		mov	[bp+var_46], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_A241B

loc_A23D2:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 9
		ja	short loc_A23E8
		shl	bx, 1
		jmp	cs:off_A2827[bx]	; switch jump

loc_A23E8:
		add	[bp+var_16], 22h
		jmp	short loc_A2416

loc_A23EF:
		jmp	short loc_A23E8

loc_A23F1:
		add	[bp+var_16], 24h
		jmp	short loc_A2416

loc_A23F8:
		add	[bp+var_16], 28h
		jmp	short loc_A2416

loc_A23FF:
		jmp	short loc_A23E8

loc_A2401:
		add	[bp+var_16], 34h
		jmp	short loc_A2416

loc_A2408:
		jmp	short loc_A2411

loc_A240A:
		add	[bp+var_16], 36h
		jmp	short loc_A2416

loc_A2411:
		add	[bp+var_16], 3Ch

loc_A2416:
		inc	dx
		add	[bp+var_4E], 0Ah

loc_A241B:
		cmp	dx, [bp+var_6]
		jb	short loc_A23D2
		cmp	[bp+var_3D], 0
		jz	short loc_A2444
		cmp	[bp+var_42], 0
		jz	short loc_A2444
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A2444

loc_A2444:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0

loc_A2458:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A245F:
		push	0
		push	large 454E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A2477
		jmp	loc_A258F

loc_A2477:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A248F
		jmp	loc_A2588

loc_A248F:
		mov	eax, [si+72h]
		mov	ebx, 6
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		mov	eax, [si+72h]
		mov	[bp+var_46], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_A254B

loc_A2521:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_A253A
		cmp	ax, 3
		jz	short loc_A2541
		add	[bp+var_E], 0Fh
		jmp	short loc_A2546

loc_A253A:
		add	[bp+var_E], 12h
		jmp	short loc_A2546

loc_A2541:
		add	[bp+var_E], 11h

loc_A2546:
		inc	dx
		add	[bp+var_4E], 6

loc_A254B:
		cmp	dx, [bp+var_2]
		jb	short loc_A2521
		cmp	[bp+var_3D], 0
		jz	short loc_A2574
		cmp	[bp+var_42], 0
		jz	short loc_A2574
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A2574

loc_A2574:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0

loc_A2588:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A258F:
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A25A7
		jmp	loc_A26BD

loc_A25A7:
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A25BF
		jmp	loc_A26B6

loc_A25BF:
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	eax, [si+72h]
		mov	[bp+var_46], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_3E]
		push	ax
		push	large [bp+var_42]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_A2679

loc_A2651:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jz	short loc_A2666
		cmp	ax, 2
		jz	short loc_A266F
		cmp	ax, 3
		jz	short loc_A2674

loc_A2666:
		add	[bp+var_12], 10h
		jmp	short loc_A2674
		jmp	short loc_A2666

loc_A266F:
		add	[bp+var_12], 12h

loc_A2674:
		inc	dx
		add	[bp+var_4E], 8

loc_A2679:
		cmp	dx, [bp+var_4]
		jb	short loc_A2651
		cmp	[bp+var_3D], 0
		jz	short loc_A26A2
		cmp	[bp+var_42], 0
		jz	short loc_A26A2
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A26A2

loc_A26A2:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0

loc_A26B6:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A26BD:
		mov	[bp+var_17], 2
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_1C], eax
		push	0
		push	2
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_20], eax
		cmp	[bp+var_20], 30D40h
		jge	short loc_A2707
		cmp	[bp+var_1C], 6DDD0h
		jg	short loc_A2703
		cmp	[bp+var_20], 17318h
		jge	short loc_A2707

loc_A2703:
		mov	[bp+var_17], 3

loc_A2707:
		mov	eax, [bp+var_A]
		add	eax, [bp+var_E]
		add	eax, [bp+var_12]
		add	eax, [bp+var_16]
		mov	[bp+var_24], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		imul	ax, ax, 2Ah
		movzx	eax, ax
		mov	edx, [bp+var_24]
		add	edx, eax
		mov	[bp+var_28], edx
		mov	al, [bp+var_17]
		mov	[bp+var_29], al
		push	1
		push	0
		push	ax
		push	edx
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_2E+2], dx
		mov	word ptr [bp+var_2E], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_2E]
		mov	es:[bx+8], eax
		mov	al, [bp+var_29]
		mov	es:[bx+0Ch], al
		mov	byte ptr es:[bx+0Dh], 1
		mov	dword ptr es:[bx+0Eh], 0
		mov	eax, [bp+var_28]
		mov	es:[bx+0Eh], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 8
		mov	[bp+var_30], ax
		mov	[bp+var_32], dx
		les	bx, [bp+var_32]
		mov	eax, es:[bx]
		mov	[bp+var_36], eax
		mov	al, es:[bx+4]
		mov	[bp+var_37], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+12h], eax
		mov	al, [bp+var_37]
		mov	es:[bx+16h], al
		mov	byte ptr es:[bx+17h], 0
		mov	dword ptr es:[bx+18h], 0
		les	bx, [bp+var_32]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], eax
		push	1
		push	0
		push	2
		mov	ax, di
		add	ax, [bp+var_2]
		add	ax, [bp+var_4]
		add	ax, [bp+var_6]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], dx
		mov	es:[bx+1Eh], ax
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		add	ax, word ptr [bp+var_24]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		pop	di
		pop	si
		leave
		retf
sub_A2030		endp

; START OF FUNCTION CHUNK FOR sub_A2030
off_A2827	dw offset loc_A23E8
		dw offset loc_A23EF
		dw offset loc_A23F1
		dw offset loc_A23FF
		dw offset loc_A23F8
		dw offset loc_A23FF
		dw offset loc_A2401
		dw offset loc_A2408
		dw offset loc_A240A
		dw offset loc_A2411
off_A283B	dw offset loc_A2295
		dw offset loc_A229C
		dw offset loc_A229E
		dw offset loc_A22AC
		dw offset loc_A22A5
		dw offset loc_A22AC
		dw offset loc_A22AE
		dw offset loc_A22B5
		dw offset loc_A22BC
		dw offset loc_A22C3
off_A284F	dw offset loc_A2160
		dw offset loc_A2167
		dw offset loc_A2169
		dw offset loc_A2177
		dw offset loc_A2170
		dw offset loc_A2177
		dw offset loc_A2179
		dw offset loc_A2180
		dw offset loc_A2187
		dw offset loc_A218E
; END OF FUNCTION CHUNK FOR sub_A2030
ovr268		ends
