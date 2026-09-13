seg107		segment	byte public 'CODE' use16
		assume cs:seg107
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_4D6A5:				; DATA XREF: seg339:off_6F60Co
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4D6ED
		les	bx, [bp+6]
		mov	word ptr es:[bx], 255Ch
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Targeting_DestructComponent
		add	sp, 6
		test	si, 1
		jz	short loc_4D6ED
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4D6ED:				; CODE XREF: seg107:0014j seg107:0030j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4D6F0:				; DATA XREF: seg339:off_6F610o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	46h ; 'F'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4D753
		mov	word ptr [si], 10E4h

loc_4D711:
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	ax
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 31A6h
		mov	dword ptr [si+3Ch], 0
		mov	word ptr [si+44h], 0
		push	large dword ptr	[bp-4]
		push	si
		nop
		push	cs
		call	near ptr ParticleEmitter_InitAttached
		add	sp, 6
		mov	ax, si
		jmp	short loc_4D755
; ���������������������������������������������������������������������������

loc_4D753:				; CODE XREF: seg107:006Bj
		mov	ax, si

loc_4D755:				; CODE XREF: seg107:00B1j
		mov	si, ax
		push	ax
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4D769:				; DATA XREF: seg339:off_6F614o
		push	bp
		mov	bp, sp
		mov	al, 0Dh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4D770:				; DATA XREF: seg339:off_6F624o
		push	bp
		mov	bp, sp
		sub	sp, 0C6h
		push	si
		push	di
		mov	di, [bp+0Eh]
		mov	si, [bp+10h]
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 6Ah	; 'j'
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 76h	; 'v'
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		les	bx, [bp-10h]
		mov	eax, es:[bx]
		mov	[bp-0Ch], eax
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 7Ch	; '|'
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	bx, [bp-18h]
		mov	eax, es:[bx]
		mov	[bp-14h], eax
		cmp	word ptr [bp+14h], 0
		jz	short loc_4D7D6
		jmp	loc_4DC8E
; ���������������������������������������������������������������������������

loc_4D7D6:				; CODE XREF: seg107:0131j
		or	si, si
		jnz	short loc_4D7DD
		jmp	loc_4DC6C
; ���������������������������������������������������������������������������

loc_4D7DD:				; CODE XREF: seg107:0138j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp-1Ah], ax
		push	ax
		lea	ax, [bp-7Eh]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp-72h]
		mov	[bp-8Ah], eax
		mov	eax, [bp-6Eh]

loc_4D801:
		mov	[bp-86h], eax
		mov	eax, [bp-6Ah]
		mov	[bp-82h], eax
		lea	ax, [bp-8Ah]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		mov	eax, [bp-8Ah]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8Ah], eax
		mov	eax, [bp-86h]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-86h], eax
		mov	eax, [bp-82h]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-82h], eax
		push	si
		push	ss
		lea	ax, [bp-96h]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-8Ah]
		add	eax, [bp-96h]
		mov	[bp-8Ah], eax
		mov	eax, [bp-86h]
		add	eax, [bp-92h]
		mov	[bp-86h], eax
		mov	eax, [bp-82h]
		add	eax, [bp-8Eh]
		mov	[bp-82h], eax
		or	di, di
		jnz	short loc_4D89F
		jmp	loc_4DC4A
; ���������������������������������������������������������������������������

loc_4D89F:				; CODE XREF: seg107:01FAj
		push	di
		push	ss
		lea	ax, [bp-0A2h]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-8Ah]
		sub	eax, [bp-0A2h]
		mov	[bp-8Ah], eax
		mov	eax, [bp-86h]
		sub	eax, [bp-9Eh]
		mov	[bp-86h], eax
		mov	eax, [bp-82h]
		sub	eax, [bp-9Ah]
		mov	[bp-82h], eax
		lea	ax, [bp-7Eh]
		push	ax
		lea	ax, [bp-8Ah]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	dword ptr [bp-1Eh], 0
		mov	dword ptr [bp-22h], 0
		mov	eax, [bp-1Eh]

loc_4D900:
		mov	[bp-0AEh], eax
		mov	eax, [bp-22h]
		mov	[bp-0AAh], eax
		mov	eax, dword_6FFD7
		mov	[bp-0A6h], eax
		lea	ax, [bp-7Eh]
		push	ax
		lea	ax, [bp-0AEh]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		add	di, 12h
		add	si, 12h
		mov	eax, [di]
		sub	eax, [si]
		mov	[bp-0BAh], eax
		mov	eax, [di+4]
		sub	eax, [si+4]
		mov	[bp-0B6h], eax
		mov	eax, [di+8]
		sub	eax, [si+8]
		mov	[bp-0B2h], eax
		lea	ax, [bp-7Eh]
		push	ax
		lea	ax, [bp-0BAh]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		cmp	dword ptr [bp-0AAh], 0
		jnz	short loc_4D971
		mov	ax, 1
		jmp	short loc_4D973
; ���������������������������������������������������������������������������

loc_4D971:				; CODE XREF: seg107:02CAj
		xor	ax, ax

loc_4D973:				; CODE XREF: seg107:02CFj
		or	al, al
		jz	short loc_4D9E3
		mov	eax, [bp-0B6h]
		mov	edx, eax
		mov	ecx, [bp-86h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-26h], eax
		cmp	dword ptr [bp-26h], 0
		jge	short loc_4D99F
		mov	ax, 1
		jmp	short loc_4D9A1
; ���������������������������������������������������������������������������

loc_4D99F:				; CODE XREF: seg107:02F8j
		xor	ax, ax

loc_4D9A1:				; CODE XREF: seg107:02FDj
		or	al, al
		jnz	short loc_4D9A8
		jmp	loc_4DB82
; ���������������������������������������������������������������������������

loc_4D9A8:				; CODE XREF: seg107:0303j
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4D9B3
		mov	ax, si
		jmp	short loc_4D9BD
; ���������������������������������������������������������������������������

loc_4D9B3:				; CODE XREF: seg107:030Dj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4D9BD:				; CODE XREF: seg107:0311j
		or	ax, ax
		jnz	short loc_4D9C4
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4D9C4:				; CODE XREF: seg107:031Fj
					; seg107:loc_4DA54j ...
		mov	eax, dword_707E0
		mov	[si], eax
		mov	eax, dword_707E4
		mov	[si+4],	eax
		mov	eax, dword_707E8

loc_4D9D7:				; CODE XREF: seg107:05A4j seg107:07D2j ...
		mov	[si+8],	eax
		mov	ax, si
		jmp	loc_4DEA8
; ���������������������������������������������������������������������������
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4D9E3:				; CODE XREF: seg107:02D5j
		mov	eax, [bp-86h]
		mov	edx, [bp-86h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-26h], eax
		mov	eax, [bp-0AAh]
		mov	edx, [bp-0B6h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-2Ah], eax
		mov	eax, [bp-2Ah]
		shl	eax, 1
		mov	[bp-2Ah], eax
		mov	eax, [bp-26h]
		add	eax, [bp-2Ah]
		mov	[bp-26h], eax
		cmp	dword ptr [bp-26h], 0
		jge	short loc_4DA32
		mov	ax, 1
		jmp	short loc_4DA34
; ���������������������������������������������������������������������������

loc_4DA32:				; CODE XREF: seg107:038Bj
		xor	ax, ax

loc_4DA34:				; CODE XREF: seg107:0390j
		or	al, al
		jz	short loc_4DA5A
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4DA43
		mov	ax, si
		jmp	short loc_4DA4D
; ���������������������������������������������������������������������������

loc_4DA43:				; CODE XREF: seg107:039Dj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DA4D:				; CODE XREF: seg107:03A1j
		or	ax, ax
		jnz	short loc_4DA54
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DA54:				; CODE XREF: seg107:03AFj
		jmp	loc_4D9C4
; ���������������������������������������������������������������������������
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DA5A:				; CODE XREF: seg107:0396j
		lea	ax, [bp-26h]
		push	ax
		push	ss
		lea	ax, [bp-2Eh]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp-2Eh]
		mov	[bp-26h], eax
		sub	eax, [bp-86h]
		mov	[bp-32h], eax
		mov	eax, [bp-26h]
		add	eax, [bp-86h]
		mov	[bp-3Ah], eax
		neg	eax
		mov	[bp-3Eh], eax
		mov	[bp-42h], eax
		mov	[bp-36h], eax
		cmp	dword ptr [bp-0AAh], 0
		jge	short loc_4DAA5
		mov	ax, 1
		jmp	short loc_4DAA7
; ���������������������������������������������������������������������������

loc_4DAA5:				; CODE XREF: seg107:03FEj
		xor	ax, ax

loc_4DAA7:				; CODE XREF: seg107:0403j
		or	al, al
		jz	short loc_4DAE6
		mov	eax, [bp-32h]
		neg	eax
		mov	[bp-46h], eax
		mov	[bp-4Ah], eax
		mov	[bp-32h], eax
		mov	eax, [bp-36h]
		neg	eax
		mov	[bp-4Eh], eax
		mov	[bp-52h], eax
		mov	[bp-36h], eax
		mov	eax, [bp-0AAh]
		neg	eax
		mov	[bp-56h], eax
		mov	[bp-5Ah], eax
		mov	[bp-0AAh], eax

loc_4DAE6:				; CODE XREF: seg107:0409j
		cmp	dword ptr [bp-32h], 0
		jle	short loc_4DAF2
		mov	ax, 1
		jmp	short loc_4DAF4
; ���������������������������������������������������������������������������

loc_4DAF2:				; CODE XREF: seg107:044Bj
		xor	ax, ax

loc_4DAF4:				; CODE XREF: seg107:0450j
		or	al, al
		jz	short loc_4DB2D
		cmp	dword ptr [bp-36h], 0
		jle	short loc_4DB04
		mov	ax, 1
		jmp	short loc_4DB06
; ���������������������������������������������������������������������������

loc_4DB04:				; CODE XREF: seg107:045Dj
		xor	ax, ax

loc_4DB06:				; CODE XREF: seg107:0462j
		or	al, al
		jz	short loc_4DB1F
		mov	eax, [bp-36h]
		cmp	eax, [bp-32h]
		jle	short loc_4DB19
		mov	ax, 1
		jmp	short loc_4DB1B
; ���������������������������������������������������������������������������

loc_4DB19:				; CODE XREF: seg107:0472j
		xor	ax, ax

loc_4DB1B:				; CODE XREF: seg107:0477j
		or	al, al
		jz	short loc_4DB3F

loc_4DB1F:				; CODE XREF: seg107:0468j seg107:048Bj
		mov	eax, [bp-32h]

loc_4DB23:				; CODE XREF: seg107:04A3j
		mov	[bp-26h], eax
		jmp	short loc_4DB67
; ���������������������������������������������������������������������������
		jmp	short loc_4DB3F
; ���������������������������������������������������������������������������
		jmp	short loc_4DB1F
; ���������������������������������������������������������������������������

loc_4DB2D:				; CODE XREF: seg107:0456j
		cmp	dword ptr [bp-36h], 0
		jle	short loc_4DB39
		mov	ax, 1
		jmp	short loc_4DB3B
; ���������������������������������������������������������������������������

loc_4DB39:				; CODE XREF: seg107:0492j
		xor	ax, ax

loc_4DB3B:				; CODE XREF: seg107:0497j
		or	al, al
		jz	short loc_4DB45

loc_4DB3F:				; CODE XREF: seg107:047Dj seg107:0489j
		mov	eax, [bp-36h]
		jmp	short loc_4DB23
; ���������������������������������������������������������������������������

loc_4DB45:				; CODE XREF: seg107:049Dj
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4DB50
		mov	ax, si
		jmp	short loc_4DB5A
; ���������������������������������������������������������������������������

loc_4DB50:				; CODE XREF: seg107:04AAj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DB5A:				; CODE XREF: seg107:04AEj
		or	ax, ax
		jnz	short loc_4DB61
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DB61:				; CODE XREF: seg107:04BCj
		jmp	loc_4D9C4
; ���������������������������������������������������������������������������
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DB67:				; CODE XREF: seg107:0487j
		mov	eax, [bp-26h]
		mov	edx, eax
		mov	ecx, [bp-0AAh]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-26h], eax

loc_4DB82:				; CODE XREF: seg107:0305j
		mov	eax, [bp-0B6h]
		mov	[bp-0C2h], eax
		mov	eax, [bp-0AEh]
		mov	edx, [bp-26h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0C6h], eax
		mov	eax, [bp-0C6h]
		sar	eax, 1
		mov	[bp-0C6h], eax
		add	eax, [bp-8Ah]
		mov	[bp-0C6h], eax
		mov	eax, [bp-0C6h]
		mov	edx, [bp-26h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0C6h], eax
		mov	eax, [bp-0A6h]
		mov	edx, [bp-26h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0BEh], eax
		mov	eax, [bp-0BEh]
		sar	eax, 1
		mov	[bp-0BEh], eax
		add	eax, [bp-82h]
		mov	[bp-0BEh], eax
		mov	eax, [bp-0BEh]
		mov	edx, [bp-26h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0BEh], eax
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4DC1D
		mov	ax, si
		jmp	short loc_4DC27
; ���������������������������������������������������������������������������

loc_4DC1D:				; CODE XREF: seg107:0577j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DC27:				; CODE XREF: seg107:057Bj
		or	ax, ax
		jnz	short loc_4DC2E
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DC2E:				; CODE XREF: seg107:0589j
		mov	eax, [bp-0C6h]
		mov	[si], eax
		mov	eax, [bp-0C2h]
		mov	[si+4],	eax
		mov	eax, [bp-0BEh]
		jmp	loc_4D9D7
; ���������������������������������������������������������������������������
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DC4A:				; CODE XREF: seg107:01FCj
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4DC55
		mov	ax, si
		jmp	short loc_4DC5F
; ���������������������������������������������������������������������������

loc_4DC55:				; CODE XREF: seg107:05AFj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DC5F:				; CODE XREF: seg107:05B3j
		or	ax, ax
		jnz	short loc_4DC66
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DC66:				; CODE XREF: seg107:05C1j
		jmp	loc_4D9C4
; ���������������������������������������������������������������������������
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DC6C:				; CODE XREF: seg107:013Aj
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4DC77
		mov	ax, si
		jmp	short loc_4DC81
; ���������������������������������������������������������������������������

loc_4DC77:				; CODE XREF: seg107:05D1j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DC81:				; CODE XREF: seg107:05D5j
		or	ax, ax
		jnz	short loc_4DC88
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DC88:				; CODE XREF: seg107:05E3j
		jmp	loc_4D9C4
; ���������������������������������������������������������������������������
		jmp	loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DC8E:				; CODE XREF: seg107:0133j
		or	si, si
		jnz	short loc_4DC95
		jmp	loc_4DE77
; ���������������������������������������������������������������������������

loc_4DC95:				; CODE XREF: seg107:05F0j
		mov	bx, [bp+12h]
		mov	eax, [bx]
		mov	[bp-1Ch], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp-66h], eax
		mov	eax, [di+4]
		mov	[bp-62h], eax
		mov	eax, [di+8]
		mov	[bp-5Eh], eax
		lea	ax, [bp-66h]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		mov	eax, [bp-66h]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-66h], eax
		mov	eax, [bp-62h]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-62h], eax
		mov	eax, [bp-5Eh]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Eh], eax
		push	si
		push	ss
		lea	ax, [bp-72h]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-66h]
		add	eax, [bp-72h]
		mov	[bp-66h], eax
		mov	eax, [bp-62h]
		add	eax, [bp-6Eh]
		mov	[bp-62h], eax
		mov	eax, [bp-5Eh]
		add	eax, [bp-6Ah]
		mov	[bp-5Eh], eax
		mov	eax, [bp-66h]
		mov	[bp-7Eh], eax
		mov	eax, [bp-62h]
		mov	[bp-7Ah], eax
		mov	eax, [bp-5Eh]
		mov	[bp-76h], eax
		mov	eax, [bp-76h]
		mov	edx, [bp-76h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-20h], eax
		mov	eax, dword_6FFD7
		mov	edx, [bp-1Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		shl	eax, 1
		mov	[bp-24h], eax
		mov	eax, [bp-20h]
		sub	eax, [bp-24h]
		mov	[bp-20h], eax
		mov	dword ptr [bp-28h], 0
		cmp	eax, [bp-28h]
		jl	short loc_4DDA4
		mov	ax, 1
		jmp	short loc_4DDA6
; ���������������������������������������������������������������������������

loc_4DDA4:				; CODE XREF: seg107:06FDj
		xor	ax, ax

loc_4DDA6:				; CODE XREF: seg107:0702j
		or	al, al
		jz	short loc_4DDCE
		lea	ax, [bp-20h]
		push	ax
		push	ss
		lea	ax, [bp-2Ch]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp-2Ch]
		neg	eax
		mov	[bp-30h], eax
		mov	[bp-34h], eax
		mov	[bp-20h], eax

loc_4DDCE:				; CODE XREF: seg107:0708j
		mov	eax, [bp-20h]
		sub	eax, [bp-76h]
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	edx, eax
		mov	ecx, dword_6FFD7
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-20h], eax
		mov	eax, [bp-66h]
		mov	edx, [bp-20h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-66h], eax
		mov	eax, [bp-62h]
		mov	edx, [bp-20h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-62h], eax
		mov	bx, [bp+12h]
		mov	eax, [bx]
		neg	eax
		mov	[bp-38h], eax
		mov	[bp-3Ch], eax
		mov	[bp-5Eh], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp-66h]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4DE51
		mov	ax, si
		jmp	short loc_4DE5B
; ���������������������������������������������������������������������������

loc_4DE51:				; CODE XREF: seg107:07ABj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DE5B:				; CODE XREF: seg107:07AFj
		or	ax, ax
		jz	short loc_4DEA6
		mov	eax, [bp-66h]
		mov	[si], eax
		mov	eax, [bp-62h]
		mov	[si+4],	eax
		mov	eax, [bp-5Eh]
		jmp	loc_4D9D7
; ���������������������������������������������������������������������������
		jmp	short loc_4DEA6
; ���������������������������������������������������������������������������

loc_4DE77:				; CODE XREF: seg107:05F2j
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4DE82
		mov	ax, si
		jmp	short loc_4DE8C
; ���������������������������������������������������������������������������

loc_4DE82:				; CODE XREF: seg107:07DCj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DE8C:				; CODE XREF: seg107:07E0j
		or	ax, ax
		jz	short loc_4DEA6
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		jmp	loc_4D9D7
; ���������������������������������������������������������������������������

loc_4DEA6:				; CODE XREF: seg107:0321j seg107:0340j ...
		mov	ax, si

loc_4DEA8:				; CODE XREF: seg107:033Dj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4DEB2:				; DATA XREF: seg339:off_6F618o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jz	short loc_4DECA
		dec	word_7047B

loc_4DECA:				; CODE XREF: seg107:0824j
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4DECF:				; DATA XREF: seg339:256Co
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+19h], 0
		jnz	short loc_4DEE8
		jmp	loc_4DF8E
; ���������������������������������������������������������������������������

loc_4DEE8:				; CODE XREF: seg107:0843j
		mov	eax, es:[bx+19h]
		mov	[bp-4],	eax
		push	1
		push	1
		push	large dword ptr	[bp-4]
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_4DF0D
		jmp	loc_4DF8E
; ���������������������������������������������������������������������������

loc_4DF0D:				; CODE XREF: seg107:0868j
		mov	dx, di
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+12h], eax
		mov	eax, [bx+4]
		mov	[si+16h], eax
		mov	eax, [bx+8]
		mov	[si+1Ah], eax
		push	64h ; 'd'
		les	bx, [bp+6]
		les	bx, es:[bx+19h]
		push	word ptr es:[bx+0Ah]
		sub	sp, 4
		mov	ax, es:[bx+8]
		mov	[bp-6],	ax
		movsx	eax, word ptr [bp-6]
		shl	eax, 8
		mov	[bp-30h], eax
		push	si
		call	Debris_ConfigureByTargetType
		add	sp, 0Ah
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp-8],	ax
		push	ax
		mov	ax, si
		add	ax, 5Ah	; 'Z'
		push	ax
		call	SetReference16
		add	sp, 4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		push	si
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4

loc_4DF8E:				; CODE XREF: seg107:0845j seg107:086Aj
		push	word ptr [bp+0Ch]
		mov	bx, [bp+0Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jnz	short loc_4DFA0
		jmp	loc_4E03B
; ���������������������������������������������������������������������������

loc_4DFA0:				; CODE XREF: seg107:08FBj
		mov	ax, [bp+0Ch]
		cmp	ax, word_722E6
		jnz	short loc_4DFC1
		cmp	byte_72A8E, 4
		jnz	short loc_4DFC1
		push	0
		push	large 0
		push	9
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8
		jmp	short loc_4E03B
; ���������������������������������������������������������������������������

loc_4DFC1:				; CODE XREF: seg107:0907j seg107:090Ej
		mov	si, di
		add	si, 12h
		mov	di, word_72A8F
		add	di, 14h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp-24h], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp-20h], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp-1Ch], eax
		mov	eax, [bp-24h]
		mov	[bp-18h], eax
		mov	eax, [bp-20h]
		mov	[bp-14h], eax
		mov	eax, [bp-1Ch]
		mov	[bp-10h], eax
		push	eax
		push	large dword ptr	[bp-14h]
		push	large dword ptr	[bp-18h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-0Ch], eax
		sar	eax, 8
		mov	[bp-4],	eax
		push	0
		push	eax
		push	0Ah
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8

loc_4E03B:				; CODE XREF: seg107:08FDj seg107:091Fj
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,26L — remet à zéro 4 champs de compteur/timer (+0x2C/0x30/0x34/0x38), positionne des
; flags (+4 bits 0/3/5/2) : reset d'un émetteur de particules (compteurs de génération + flags
; de mode).
; ==============================================================================================
ParticleEmitter_Reset	proc far		; CODE XREF: ParticleEmitter_InitAttached+19p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+34h], eax
		mov	[si+30h], eax
		mov	[si+2Ch], eax
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+38h], eax
		mov	dword ptr [si+3Ch], 0
		or	byte ptr [si+4], 1
		or	byte ptr [si+4], 8
		or	byte ptr [si+4], 20h
		or	byte ptr [si+4], 4
		pop	si
		leave
		retf
ParticleEmitter_Reset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,16L — copie un champ (+0x62 depuis une source référencée) vers +0x40 : copie d'un
; paramètre de configuration (probable taux d'émission) depuis une source.
; ==============================================================================================
ParticleEmitter_CopyRateParam	proc far		; CODE XREF: ParticleEmitter_InitAttached+23p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+62h]
		mov	[si+40h], eax
		pop	si
		pop	bp
		retf
ParticleEmitter_CopyRateParam	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,37L — attache une cible (sub_37C89), reset (sub_4E041), copie un paramètre (sub_4E085),
; résout un point d'attache (+0x0E+0x6A) : initialisation complète d'un émetteur de particules
; attaché à un point du modèle.
; ==============================================================================================
ParticleEmitter_InitAttached	proc far		; CODE XREF: seg107:00A9p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		push	si
		push	cs
		call	near ptr ParticleEmitter_Reset
		pop	cx
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr ParticleEmitter_CopyRateParam
		add	sp, 6
		or	byte ptr [si+4], 4
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 6Ah	; 'j'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[si+3Ch], eax
		pop	si
		leave
		retf
ParticleEmitter_InitAttached	endp

; ���������������������������������������������������������������������������

loc_4E0E5:				; DATA XREF: seg339:off_702DAo
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+6]
		les	bx, [si+0Eh]
		mov	ax, es:[bx+46h]
		mov	[bp-6],	ax
		movsx	eax, word ptr [bp-6]
		shl	eax, 8
		mov	[bp-4],	eax
		mov	ax, es:[bx+80h]
		mov	[bp-8],	ax
		movsx	eax, word ptr [bp-8]
		mov	edx, [bp-4]
		imul	edx, eax
		mov	[bp-4],	edx
		mov	di, si
		add	di, 3Ch	; '<'
		mov	eax, [di]
		mov	[bp-0Ch], eax
		sar	eax, 1
		mov	[bp-0Ch], eax
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 6Ah	; 'j'
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		les	bx, [bp-10h]
		mov	eax, es:[bx]
		mov	[bp-14h], eax
		mov	eax, [bp-0Ch]
		mov	edx, eax
		mov	ecx, [bp-14h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-0Ch], eax
		mov	dword ptr [bp-18h], 80h	; '�'
		mov	eax, [bp-18h]
		add	[bp-0Ch], eax
		mov	eax, [bp-4]
		mov	edx, [bp-0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4],	eax
		mov	ax, [bp-3]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,217L — calcule une position de spawn de particule avec jitter aléatoire (table via
; sub_54DF4), applique un facteur d'échelle temporel : calcul de la position de génération
; d'une particule avec dispersion aléatoire (jitter).
; ==============================================================================================
Particle_ComputeSpawnJitter	proc far		; CODE XREF: Effect_SpawnPeriodicAtAttach+312P
					; Particle_ComputeSpawnAtAttachPoint+3Fp

var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_6]
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		push	di
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_4E212
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 7Ch	; '|'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		les	bx, [si+0Eh]
		mov	eax, es:[bx+72h]
		mov	[bp+var_20], eax
		mov	ax, word ptr [bp+var_20]
		shl	ax, 1
		call	Math_RandomScale_54DF4
		movsx	eax, ax
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		sub	[bp+var_24], eax
		mov	eax, [bp+var_4]
		add	eax, [bp+var_24]
		mov	[bp+var_4], eax

loc_4E212:				; CODE XREF: Particle_ComputeSpawnJitter+2Aj
		mov	cx, [bp+arg_6]
		mov	ax, [bp+arg_6]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	bx, cx
		mov	[bx], eax
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	bx, cx
		mov	[bx+4],	eax
		mov	bx, [bp+var_E]
		mov	eax, [bx+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	bx, cx
		mov	[bx+8],	eax
		mov	cx, [bp+arg_6]
		mov	ax, [bp+arg_6]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		add	eax, [bp+var_30]
		mov	bx, cx
		mov	[bx], eax
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		add	eax, [bp+var_2C]
		mov	bx, cx
		mov	[bx+4],	eax
		mov	bx, [bp+var_10]
		mov	eax, [bx+8]
		add	eax, [bp+var_28]
		mov	bx, cx
		mov	[bx+8],	eax
		mov	cx, [bp+arg_6]
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+2Ch], eax
		mov	eax, [bx+4]
		mov	[si+30h], eax
		mov	eax, [bx+8]
		mov	[si+34h], eax
		mov	cx, si
		add	cx, 12h
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_14], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	bx, [bp+var_14]
		add	eax, [bx]
		mov	bx, cx
		mov	[bx], eax
		mov	bx, [bp+var_12]
		mov	eax, [bx+4]
		mov	bx, [bp+var_14]
		add	eax, [bx+4]
		mov	bx, cx
		mov	[bx+4],	eax
		mov	bx, [bp+var_12]
		mov	eax, [bx+8]
		mov	bx, [bp+var_14]
		add	eax, [bx+8]
		mov	bx, cx
		mov	[bx+8],	eax
		push	di
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+44h]
		add	sp, 6
		mov	eax, [bp+var_3C]
		add	[si+12h], eax
		mov	eax, [bp+var_38]
		add	[si+16h], eax
		mov	eax, [bp+var_34]
		add	[si+1Ah], eax
		mov	di, si
		add	di, 2Ch	; ','
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 76h	; 'v'
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [di]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_44]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	di, si
		add	di, 12h
		add	si, 12h
		mov	eax, [si]
		add	eax, [bp+var_48]
		mov	[di], eax
		mov	eax, [si+4]
		add	eax, [bp+var_44]
		mov	[di+4],	eax
		mov	eax, [si+8]
		add	eax, [bp+var_40]
		mov	[di+8],	eax
		pop	di
		pop	si
		leave
		retf
Particle_ComputeSpawnJitter	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,41L — résout la position d'un point d'attache (vtable[0x3C]) puis calcule le spawn
; (sub_4E192) : wrapper de calcul de position de particule à un point d'attache — appelé par
; HUD_RenderSymbologyMain (probable effet de fumée/étincelle du réticule ou d'un composant
; endommagé affiché au HUD).
; ==============================================================================================
Particle_ComputeSpawnAtAttachPoint	proc far		; CODE XREF: HUD_RenderSymbologyMain+F0DP

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Particle_ComputeSpawnJitter
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
Particle_ComputeSpawnAtAttachPoint	endp

; ���������������������������������������������������������������������������

loc_4E43C:				; DATA XREF: seg339:off_7028Ao
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 0Dh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4E446:				; DATA XREF: seg339:off_7028Eo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+44h]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4E453:				; DATA XREF: seg339:off_7026Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_4E48A
		mov	word ptr [si], 31A6h
		mov	ax, si
		add	ax, 44h	; 'D'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6BFBA
		add	sp, 4
		test	di, 1
		jz	short loc_4E48A
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_4E48A:				; CODE XREF: seg107:0DC0j seg107:0DE1j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,94L — intègre un vecteur de vitesse globale (dword_6FFD7) mis à l'échelle du delta-temps
; physique (dword_70458), avec une constante négative (-7) : intégration de la dérive du vent
; sur les particules émises.
; ==============================================================================================
Particle_IntegrateWindDrift	proc far		; CODE XREF: seg107:0F53p

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	eax, dword_6FFD7
		mov	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	[bp+var_10], 0FFFFFFF9h
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	si, cx
		add	si, 2Ch	; ','
		mov	eax, [si]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	si, cx
		add	si, 2Ch	; ','
		mov	di, cx
		add	di, 2Ch	; ','
		mov	eax, [di]
		add	eax, [bp+var_1C]
		mov	[si], eax
		mov	eax, [di+4]
		add	eax, [bp+var_18]
		mov	[si+4],	eax
		mov	eax, [di+8]
		add	eax, [bp+var_14]
		mov	[si+8],	eax
		mov	si, cx
		add	si, 2Ch	; ','
		mov	di, cx
		add	di, 2Ch	; ','
		mov	eax, [di]
		add	eax, [bp+var_28]
		mov	[si], eax
		mov	eax, [di+4]
		add	eax, [bp+var_24]
		mov	[si+4],	eax
		mov	eax, [di+8]
		add	eax, [bp+var_20]
		mov	[si+8],	eax
		pop	di
		pop	si
		leave
		retf
Particle_IntegrateWindDrift	endp

; ���������������������������������������������������������������������������

loc_4E5AC:				; DATA XREF: seg339:off_70266o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	byte ptr [bp-1], 0
		push	si
		call	Debris_TestDestroyedState
		pop	cx
		or	al, al
		jz	short loc_4E5FB
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_4E5FB
		mov	eax, dword_70458
		sub	[si+3Ch], eax
		mov	eax, [si+3Ch]
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_4E5E5
		mov	al, 0
		jmp	short loc_4E5FE
; ���������������������������������������������������������������������������

loc_4E5E5:				; CODE XREF: seg107:0F3Fj
		les	bx, [si+0Eh]
		mov	eax, es:[bx+6Eh]
		add	[si+40h], eax
		push	si
		push	cs
		call	near ptr Particle_IntegrateWindDrift
		pop	cx
		mov	byte ptr [bp-1], 1

loc_4E5FB:				; CODE XREF: seg107:0F23j seg107:0F2Aj
		mov	al, [bp-1]

loc_4E5FE:				; CODE XREF: seg107:0F43j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4E601:				; DATA XREF: seg339:off_7029Ao
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bx, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	si, bx
		add	si, 2Ch	; ','
		mov	eax, [si]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		mov	eax, [si+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [si+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		cmp	word ptr [bp-4], 0
		jz	short loc_4E679
		mov	ax, [bp-4]
		jmp	short loc_4E684
; ���������������������������������������������������������������������������

loc_4E679:				; CODE XREF: seg107:0FD2j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_4E684:				; CODE XREF: seg107:0FD7j
		or	ax, ax
		jz	short loc_4E6A4
		mov	bx, [bp-4]
		mov	eax, [bp-0Ch]
		mov	[bx], eax
		mov	eax, [bp-14h]
		mov	[bx+4],	eax
		mov	eax, [bp-1Ch]
		mov	[bx+8],	eax
		jmp	short $+2

loc_4E6A4:				; CODE XREF: seg107:0FE6j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4E6AD:				; DATA XREF: seg339:off_7029Eo
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	eax, [di]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		mov	[bp-8],	eax
		mov	eax, [di+4]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [di+8]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	eax, [bp-8]
		mov	[bp-24h], eax
		mov	eax, [bp-10h]
		mov	[bp-20h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		mov	eax, [bp-24h]
		mov	[si+2Ch], eax
		mov	eax, [bp-20h]
		mov	[si+30h], eax
		mov	eax, [bp-1Ch]
		mov	[si+34h], eax
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_4E754
		push	large dword ptr	[si+0Ah]
		nop
		push	cs
		call	near ptr ParticleEmitter_SyncAttachTransform
		add	sp, 4

loc_4E754:				; CODE XREF: seg107:10A6j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4E758:				; DATA XREF: seg339:off_7026Ao
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, si
		add	di, 2Ch	; ','
		mov	eax, [di]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [di+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-10h], eax
		mov	eax, [di+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ch], eax
		mov	ax, [si+40h]
		shl	ax, 1
		call	Math_RandomScale_54DF4
		movsx	eax, ax
		sub	eax, [si+40h]
		mov	[bp-20h], eax
		mov	ax, [si+40h]
		shl	ax, 1
		call	Math_RandomScale_54DF4
		movsx	eax, ax
		sub	eax, [si+40h]
		mov	[bp-1Ch], eax
		mov	ax, [si+40h]
		shl	ax, 1
		call	Math_RandomScale_54DF4
		movsx	eax, ax
		sub	eax, [si+40h]
		mov	[bp-18h], eax
		mov	eax, [bp-14h]
		add	eax, [bp-20h]
		mov	[bp-14h], eax
		mov	eax, [bp-10h]
		add	eax, [bp-1Ch]
		mov	[bp-10h], eax
		mov	eax, [bp-0Ch]
		add	eax, [bp-18h]
		mov	[bp-0Ch], eax
		lea	ax, [bp-0Ch]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		lea	ax, [bp-14h]
		push	ax
		push	si
		call	Debris_BodyIntegrateForces
		add	sp, 8
		mov	di, si
		add	di, 38h	; '8'
		add	si, 38h	; '8'
		push	large dword ptr	[bp-0Ch]
		push	large dword ptr	[bp-10h]
		push	large dword ptr	[bp-14h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-4],	eax
		mov	[bp-8],	eax
		mov	eax, [si]
		add	eax, [bp-8]
		mov	[di], eax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4E857:				; DATA XREF: seg339:1594o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4E89F
		les	bx, [bp+6]
		mov	word ptr es:[bx], 1594h
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Object_DestructGeneric_29036
		add	sp, 6
		test	si, 1
		jz	short loc_4E89F
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4E89F:				; CODE XREF: seg107:11C6j seg107:11E2j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4E8A2:				; DATA XREF: seg339:1598o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		push	large 0
		nop
		push	cs
		call	near ptr ParticleEmitter_ConstructFull
		add	sp, 0Ah
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		leave
		retf
; ���������������������������������������������������������������������������

loc_4E8C2:				; DATA XREF: seg339:159Co
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,121L — construit une chaîne par défaut si absente (sub_5C6F3), initialise un objet
; composite (type 0x155C→0x317A), efface plusieurs bits de flags (+0x4A) : constructeur d'un
; émetteur de particules complet avec libellé par défaut.
; ==============================================================================================
ParticleEmitter_ConstructFull	proc far		; CODE XREF: seg107:1214p

var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_E		= byte ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 12h
		cmp	[bp+arg_0], 0
		jnz	short loc_4E8F7
		push	1
		push	0
		push	2
		push	large 7Dh ; '}'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_4E8F7
		jmp	loc_4E9FA
; ���������������������������������������������������������������������������

loc_4E8F7:				; CODE XREF: ParticleEmitter_ConstructFull+Bj
					; ParticleEmitter_ConstructFull+29j
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 155Ch
		push	ax
		push	large [bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Descriptor_Construct
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 317Ah
		mov	ax, word ptr [bp+arg_0]
		add	ax, 9
		mov	ax, word ptr [bp+arg_0]
		add	ax, 21h	; '!'
		and	byte ptr es:[bx+4Ah], 0FDh
		and	byte ptr es:[bx+4Ah], 0FBh
		and	byte ptr es:[bx+4Ah], 0F7h
		and	byte ptr es:[bx+4Ah], 0FEh
		and	byte ptr es:[bx+5Ch], 0FDh
		and	byte ptr es:[bx+5Ch], 0FBh
		and	byte ptr es:[bx+5Ch], 0F7h
		and	byte ptr es:[bx+5Ch], 0FEh
		mov	word ptr es:[bx+69h], 11E8h
		mov	word ptr es:[bx+69h], 11ECh
		mov	word ptr es:[bx+69h], 1210h
		mov	word ptr es:[bx+69h], 11A0h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr ParticleEmitter_SyncAttachTransform
		add	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		mov	byte ptr [bp+var_12], 2
		les	bx, [bp+var_A]
		mov	al, es:[bx+2]
		mov	[bp+var_F], al
		mov	al, es:[bx+3]
		mov	[bp+var_E], al
		mov	[bp+var_C], 0
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 21h	; '!'
		push	word ptr [bp+arg_0+2]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 9
		push	word ptr [bp+arg_0+2]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Keyframe_InitWithTwoParams
		add	sp, 10h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4Bh	; 'K'
		push	word ptr [bp+arg_0+2]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 39h	; '9'
		push	word ptr [bp+arg_0+2]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+arg_0+2]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 69h	; 'i'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Keyframe_InitVector
		add	sp, 10h

loc_4E9FA:				; CODE XREF: ParticleEmitter_ConstructFull+2Bj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
ParticleEmitter_ConstructFull	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,111L — copie la position d'un point d'attache résolu (+0x12) vers l'objet, résout une
; transformation (vtable[0x44]), lit un paramètre additionnel (+0x76) : synchronisation de la
; position et de l'orientation d'un émetteur avec son point d'attache sur le modèle.
; ==============================================================================================
ParticleEmitter_SyncAttachTransform	proc far		; CODE XREF: seg107:10AEp
					; ParticleEmitter_ConstructFull+AFp

var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		les	bx, [bp+arg_0]
		mov	si, es:[bx+6]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+9], eax
		mov	eax, [si+4]
		mov	es:[bx+0Dh], eax
		mov	eax, [si+8]
		mov	es:[bx+11h], eax
		mov	si, es:[bx+6]
		add	si, 12h
		push	word ptr es:[bx+6]
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+44h]
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	ax, [bx+10h]
		mov	dx, [bx+0Eh]
		add	dx, 76h	; 'v'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_2C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_28]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_24]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_30], eax
		mov	eax, [si]
		sub	eax, [bp+var_38]
		mov	[bp+var_44], eax
		mov	eax, [si+4]
		sub	eax, [bp+var_34]
		mov	[bp+var_40], eax
		mov	eax, [si+8]
		sub	eax, [bp+var_30]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_50]
		mov	es:[bx+21h], eax
		mov	eax, [bp+var_4C]
		mov	es:[bx+25h], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+29h], eax
		pop	si
		leave
		retf
ParticleEmitter_SyncAttachTransform	endp

; ���������������������������������������������������������������������������

loc_4EB32:				; DATA XREF: seg339:off_7024Eo
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4EB39:				; DATA XREF: seg339:off_70252o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4EB81
		les	bx, [bp+6]
		mov	word ptr es:[bx], 317Ah
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Object_DestructGeneric_29115
		add	sp, 6
		test	si, 1
		jz	short loc_4EB81
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4EB81:				; CODE XREF: seg107:14A8j seg107:14C4j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4EB84:				; DATA XREF: seg339:off_7022Ao
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	byte_6E680, 0
		mov	ax, [bp+6]
		add	ax, 69h	; 'i'
		push	word ptr [bp+8]
		push	ax
		call	Cinematic_SplineCompute
		add	sp, 4
		or	al, al
		jz	short loc_4EBF3
		push	3748h
		mov	ax, [bp+6]
		add	ax, 69h	; 'i'
		push	word ptr [bp+8]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+69h]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 69h	; 'i'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		mov	ax, word_724AC
		cmp	ax, word_724AA
		jge	short loc_4EBF3
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE
		add	bx, ax
		mov	ax, [bp-2]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short $+2

loc_4EBF3:				; CODE XREF: seg107:1503j seg107:1535j
		les	bx, [bp+6]
		and	byte ptr es:[bx+4Ah], 0FDh
		and	byte ptr es:[bx+4Ah], 0FBh
		and	byte ptr es:[bx+4Ah], 0F7h
		and	byte ptr es:[bx+5Ch], 0FDh
		and	byte ptr es:[bx+5Ch], 0FBh
		and	byte ptr es:[bx+5Ch], 0F7h
		leave
		retf
; ���������������������������������������������������������������������������

loc_4EC16:				; DATA XREF: seg339:off_70242o
		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		les	bx, [bp+6]
		mov	si, es:[bx+6]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+9], eax
		mov	eax, [si+4]
		mov	es:[bx+0Dh], eax
		mov	eax, [si+8]
		mov	es:[bx+11h], eax
		mov	si, es:[bx+6]
		add	si, 12h
		push	word ptr es:[bx+6]
		push	ss
		lea	ax, [bp-2Ch]
		push	ax
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+44h]
		add	sp, 6
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	ax, [bx+10h]
		mov	dx, [bx+0Eh]
		add	dx, 76h	; 'v'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	eax, [bp-2Ch]
		mov	edx, [bp-8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [bp-28h]
		mov	edx, [bp-8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	eax, [bp-24h]
		mov	edx, [bp-8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		mov	[bp-20h], eax
		mov	eax, [bp-10h]
		mov	[bp-38h], eax
		mov	eax, [bp-18h]
		mov	[bp-34h], eax
		mov	eax, [bp-20h]
		mov	[bp-30h], eax
		mov	eax, [si]
		sub	eax, [bp-38h]
		mov	[bp-44h], eax
		mov	eax, [si+4]
		sub	eax, [bp-34h]
		mov	[bp-40h], eax
		mov	eax, [si+8]
		sub	eax, [bp-30h]
		mov	[bp-3Ch], eax
		mov	eax, [bp-44h]
		mov	[bp-50h], eax
		mov	eax, [bp-40h]
		mov	[bp-4Ch], eax
		mov	eax, [bp-3Ch]
		mov	[bp-48h], eax
		les	bx, [bp+6]
		mov	eax, [bp-50h]
		mov	es:[bx+21h], eax
		mov	eax, [bp-4Ch]
		mov	es:[bx+25h], eax
		mov	eax, [bp-48h]
		mov	es:[bx+29h], eax
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4ED48:				; DATA XREF: seg339:off_702A2o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+0Ah]
		mov	si, [bp+6]
		mov	di, dx
		add	di, 2Ch	; ','
		or	si, si
		jz	short loc_4ED60
		mov	ax, si
		jmp	short loc_4ED6A
; ���������������������������������������������������������������������������

loc_4ED60:				; CODE XREF: seg107:16BAj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4ED6A:				; CODE XREF: seg107:16BEj
		or	ax, ax
		jz	short loc_4ED88
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_4ED8A
; ���������������������������������������������������������������������������

loc_4ED88:				; CODE XREF: seg107:16CCj
		mov	ax, si

loc_4ED8A:				; CODE XREF: seg107:16E6j
		mov	dx, [bp+8]
		mov	ax, [bp+6]

loc_4ED90:
		pop	di
		pop	si
		pop	bp
		retf
seg107		ends
