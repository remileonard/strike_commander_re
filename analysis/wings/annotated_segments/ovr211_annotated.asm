ovr211		segment	para public 'OVERLAY' use16
		assume cs:ovr211
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_75E20		proc far

var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_40		= dword ptr -40h
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
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_75E7A
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax

loc_75E7A:
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_75E92
		jmp	loc_76136

loc_75E92:
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_75EAA
		jmp	loc_75FE2

loc_75EAA:
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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	byte ptr [bp+var_40+2], 2
		mov	byte ptr [bp+var_40+3], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_75F19
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_75F20

loc_75F19:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_75F20:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_75F48
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_75F4F

loc_75F48:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_75F4F:
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_75FA3

loc_75F59:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 0Ah
		ja	short loc_75F6E
		shl	bx, 1
		jmp	cs:off_766D5[bx]	; switch jump

loc_75F6E:
		add	[bp+var_A], 1Eh
		jmp	short loc_75F9E

loc_75F75:
		jmp	short loc_75F6E

loc_75F77:
		add	[bp+var_A], 20h
		jmp	short loc_75F9E

loc_75F7E:
		add	[bp+var_A], 24h
		jmp	short loc_75F9E

loc_75F85:
		jmp	short loc_75F6E

loc_75F87:
		add	[bp+var_A], 2Ch
		jmp	short loc_75F9E

loc_75F8E:
		jmp	short loc_75F92

loc_75F90:
		jmp	short loc_75F99

loc_75F92:
		add	[bp+var_A], 34h
		jmp	short loc_75F9E

loc_75F99:
		add	[bp+var_A], 2Eh

loc_75F9E:
		inc	dx
		add	[bp+var_4E], 8

loc_75FA3:
		cmp	dx, di
		jb	short loc_75F59
		cmp	byte ptr [bp+var_40+3], 0
		jz	short loc_75FCB
		cmp	[bp+var_42], 0
		jz	short loc_75FCB
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_75FCB

loc_75FCB:
		mov	[bp+var_42], 0
		mov	byte ptr [bp+var_40+3], 0
		mov	[bp+var_3C], 0
		jmp	loc_7612F

loc_75FE2:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_75FFA
		jmp	loc_7612F

loc_75FFA:
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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	byte ptr [bp+var_40+2], 2
		mov	byte ptr [bp+var_40+3], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_76069
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_76070

loc_76069:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_76070:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_76098
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7609F

loc_76098:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_7609F:
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_760F3

loc_760A9:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 0Ah
		ja	short loc_760BE
		shl	bx, 1
		jmp	cs:off_766BF[bx]	; switch jump

loc_760BE:
		add	[bp+var_A], 1Eh
		jmp	short loc_760EE

loc_760C5:
		jmp	short loc_760BE

loc_760C7:
		add	[bp+var_A], 20h
		jmp	short loc_760EE

loc_760CE:
		add	[bp+var_A], 24h
		jmp	short loc_760EE

loc_760D5:
		jmp	short loc_760BE

loc_760D7:
		add	[bp+var_A], 2Ch
		jmp	short loc_760EE

loc_760DE:
		jmp	short loc_760E2

loc_760E0:
		jmp	short loc_760E9

loc_760E2:
		add	[bp+var_A], 34h
		jmp	short loc_760EE

loc_760E9:
		add	[bp+var_A], 2Eh

loc_760EE:
		inc	dx
		add	[bp+var_4E], 8

loc_760F3:
		cmp	dx, di
		jb	short loc_760A9
		cmp	byte ptr [bp+var_40+3], 0
		jz	short loc_7611B
		cmp	[bp+var_42], 0
		jz	short loc_7611B
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7611B

loc_7611B:
		mov	[bp+var_42], 0
		mov	byte ptr [bp+var_40+3], 0
		mov	[bp+var_3C], 0

loc_7612F:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_76136:
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_7614E
		jmp	loc_762A5

loc_7614E:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_76166
		jmp	loc_7629E

loc_76166:
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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	byte ptr [bp+var_40+2], 2
		mov	byte ptr [bp+var_40+3], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_761D6
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_761DD

loc_761D6:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_761DD:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_76205
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7620C

loc_76205:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_7620C:
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_76261

loc_76216:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 0Ah
		ja	short loc_7622C
		shl	bx, 1
		jmp	cs:off_766A9[bx]	; switch jump

loc_7622C:
		add	[bp+var_16], 22h
		jmp	short loc_7625C

loc_76233:
		jmp	short loc_7622C

loc_76235:
		add	[bp+var_16], 24h
		jmp	short loc_7625C

loc_7623C:
		add	[bp+var_16], 28h
		jmp	short loc_7625C

loc_76243:
		jmp	short loc_7622C

loc_76245:
		add	[bp+var_16], 34h
		jmp	short loc_7625C

loc_7624C:
		jmp	short loc_76250

loc_7624E:
		jmp	short loc_76257

loc_76250:
		add	[bp+var_16], 3Ch
		jmp	short loc_7625C

loc_76257:
		add	[bp+var_16], 36h

loc_7625C:
		inc	dx
		add	[bp+var_4E], 0Ah

loc_76261:
		cmp	dx, [bp+var_6]
		jb	short loc_76216
		cmp	byte ptr [bp+var_40+3], 0
		jz	short loc_7628A
		cmp	[bp+var_42], 0
		jz	short loc_7628A
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7628A

loc_7628A:
		mov	[bp+var_42], 0
		mov	byte ptr [bp+var_40+3], 0
		mov	[bp+var_3C], 0

loc_7629E:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_762A5:
		push	0
		push	large 454E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_762BD
		jmp	loc_763F3

loc_762BD:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_762D5
		jmp	loc_763EC

loc_762D5:
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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	byte ptr [bp+var_40+2], 2
		mov	byte ptr [bp+var_40+3], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_76345
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7634C

loc_76345:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_7634C:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_76374
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7637B

loc_76374:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_7637B:
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_763AF

loc_76385:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_7639E
		cmp	ax, 3
		jz	short loc_763A5
		add	[bp+var_E], 0Fh
		jmp	short loc_763AA

loc_7639E:
		add	[bp+var_E], 12h
		jmp	short loc_763AA

loc_763A5:
		add	[bp+var_E], 11h

loc_763AA:
		inc	dx
		add	[bp+var_4E], 6

loc_763AF:
		cmp	dx, [bp+var_2]
		jb	short loc_76385
		cmp	byte ptr [bp+var_40+3], 0
		jz	short loc_763D8
		cmp	[bp+var_42], 0
		jz	short loc_763D8
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_763D8

loc_763D8:
		mov	[bp+var_42], 0
		mov	byte ptr [bp+var_40+3], 0
		mov	[bp+var_3C], 0

loc_763EC:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_763F3:
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_7640B
		jmp	loc_7653F

loc_7640B:
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_76423
		jmp	loc_76538

loc_76423:
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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		mov	byte ptr [bp+var_40+2], 2
		mov	byte ptr [bp+var_40+3], 1
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_46]
		mov	[bp+var_3C], eax
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_76493
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7649A

loc_76493:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_7649A:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_40+2], 3
		jnz	short loc_764C2
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		push	large [bp+var_42]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_764C9

loc_764C2:
		mov	edx, [bp+var_40]
		mov	ax, word ptr [bp+var_42]

loc_764C9:
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		xor	dx, dx
		jmp	short loc_764FB

loc_764D3:
		les	bx, [bp+var_4E]
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jz	short loc_764E8
		cmp	ax, 2
		jz	short loc_764F1
		cmp	ax, 3
		jz	short loc_764F6

loc_764E8:
		add	[bp+var_12], 10h
		jmp	short loc_764F6
		jmp	short loc_764E8

loc_764F1:
		add	[bp+var_12], 12h

loc_764F6:
		inc	dx
		add	[bp+var_4E], 8

loc_764FB:
		cmp	dx, [bp+var_4]
		jb	short loc_764D3
		cmp	byte ptr [bp+var_40+3], 0
		jz	short loc_76524
		cmp	[bp+var_42], 0
		jz	short loc_76524
		push	0
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_76524

loc_76524:
		mov	[bp+var_42], 0
		mov	byte ptr [bp+var_40+3], 0
		mov	[bp+var_3C], 0

loc_76538:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_7653F:
		mov	[bp+var_17], 2
		call	sub_440E0
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_1C], eax
		push	0
		push	2
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_20], eax
		cmp	[bp+var_20], 30D40h
		jge	short loc_76589
		cmp	[bp+var_1C], 6DDD0h
		jg	short loc_76585
		cmp	[bp+var_20], 17318h
		jge	short loc_76589

loc_76585:
		mov	[bp+var_17], 3

loc_76589:
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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_2E+2], dx
		mov	word ptr [bp+var_2E], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_2E]
		mov	es:[bx+12h], eax
		mov	al, [bp+var_29]
		mov	es:[bx+16h], al
		mov	byte ptr es:[bx+17h], 1
		mov	dword ptr es:[bx+18h], 0
		mov	eax, [bp+var_28]
		mov	es:[bx+18h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 12h
		mov	[bp+var_30], ax
		mov	[bp+var_32], dx
		les	bx, [bp+var_32]
		mov	eax, es:[bx]
		mov	[bp+var_36], eax
		mov	al, es:[bx+4]
		mov	[bp+var_37], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+1Ch], eax
		mov	al, [bp+var_37]
		mov	es:[bx+20h], al
		mov	byte ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+22h], 0
		les	bx, [bp+var_32]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], eax
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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ah], dx
		mov	es:[bx+28h], ax
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		add	ax, word ptr [bp+var_24]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		pop	di
		pop	si
		leave
		retf
sub_75E20		endp

; START OF FUNCTION CHUNK FOR sub_75E20
off_766A9	dw offset loc_7622C
		dw offset loc_76233
		dw offset loc_76235
		dw offset loc_76243
		dw offset loc_7623C
		dw offset loc_76243
		dw offset loc_76245
		dw offset loc_7624C
		dw offset loc_7624E
		dw offset loc_76250
		dw offset loc_76257
off_766BF	dw offset loc_760BE
		dw offset loc_760C5
		dw offset loc_760C7
		dw offset loc_760D5
		dw offset loc_760CE
		dw offset loc_760D5
		dw offset loc_760D7
		dw offset loc_760DE
		dw offset loc_760E0
		dw offset loc_760E2
		dw offset loc_760E9
off_766D5	dw offset loc_75F6E
		dw offset loc_75F75
		dw offset loc_75F77
		dw offset loc_75F85
		dw offset loc_75F7E
		dw offset loc_75F85
		dw offset loc_75F87
		dw offset loc_75F8E
		dw offset loc_75F90
		dw offset loc_75F92
		dw offset loc_75F99
; END OF FUNCTION CHUNK FOR sub_75E20
ovr211		ends
