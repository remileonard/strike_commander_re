ovr230		segment	para public 'OVERLAY' use16
		assume cs:ovr230
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C50C0	proc far		; CODE XREF: sub_42C50J

var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= byte ptr -4Ch
var_4B		= byte ptr -4Bh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_1F		= byte ptr -1Fh
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		xor	eax, eax
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], eax
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C5120
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax

loc_C5120:				; CODE XREF: sub_C50C0+48j
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C5138
		jmp	loc_C52B8
; ���������������������������������������������������������������������������

loc_C5138:				; CODE XREF: sub_C50C0+73j
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C5150
		jmp	loc_C52AF
; ���������������������������������������������������������������������������

loc_C5150:				; CODE XREF: sub_C50C0+8Bj
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		mov	eax, [si+72h]
		mov	[bp+var_54], eax
		push	1
		push	0
		push	2
		push	large [bp+var_54]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_58+2],	dx
		mov	word ptr [bp+var_58], ax
		mov	eax, [bp+var_58]
		mov	[bp+var_50], eax
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 1
		mov	[bp+var_4A], 0
		mov	eax, [bp+var_54]
		mov	[bp+var_4A], eax
		push	0
		mov	al, [bp+var_4C]
		push	ax
		push	word ptr [bp+var_50+2]
		push	word ptr [bp+var_50]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		push	0
		mov	al, [bp+var_4C]
		push	ax
		push	word ptr [bp+var_50+2]
		push	word ptr [bp+var_50]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_5C+2],	dx
		mov	word ptr [bp+var_5C], ax
		xor	di, di
		jmp	loc_C526F
; ���������������������������������������������������������������������������

loc_C51E9:				; CODE XREF: sub_C50C0+1B4j
		les	bx, [bp+var_5C]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9		; switch 10 cases
		ja	short loc_C520A	; default
		shl	bx, 1
		jmp	cs:off_C5760[bx] ; switch jump

loc_C51FE:				; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 27h	; ''' ; case 0x0
		add	[bp+var_A], 17h
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C520A:				; CODE XREF: sub_C50C0+135j
					; sub_C50C0+139j
					; DATA XREF: ...
		add	[bp+var_E], 27h	; ''' ; default
		add	[bp+var_A], 17h
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C5216:				; CODE XREF: sub_C50C0+139j
					; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 2Ah	; '*' ; case 0x2
		add	[bp+var_A], 1Ah
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C5222:				; CODE XREF: sub_C50C0+139j
					; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 29h	; ')' ; case 0x4
		add	[bp+var_A], 1Ch
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C522E:				; CODE XREF: sub_C50C0+139j
					; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 28h	; '(' ; case 0x3
		add	[bp+var_A], 18h
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C523A:				; CODE XREF: sub_C50C0+139j
					; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 26h	; '&' ; case 0x6
		add	[bp+var_A], 1Eh
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C5246:				; CODE XREF: sub_C50C0+139j
					; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 29h	; ')' ; case 0x7
		add	[bp+var_A], 24h	; '$'
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C5252:				; CODE XREF: sub_C50C0+139j
					; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 28h	; '(' ; case 0x8
		add	[bp+var_A], 20h	; ' '
		jmp	short loc_C526A
; ���������������������������������������������������������������������������

loc_C525E:				; CODE XREF: sub_C50C0+139j
					; DATA XREF: ovr230:off_C5760o
		add	[bp+var_E], 26h	; '&' ; case 0x9
		add	[bp+var_A], 24h	; '$'
		jmp	short $+2

loc_C526A:				; CODE XREF: sub_C50C0+148j
					; sub_C50C0+154j ...
		inc	di
		add	word ptr [bp+var_5C], 8

loc_C526F:				; CODE XREF: sub_C50C0+126j
		cmp	di, [bp+var_2]
		jge	short loc_C5277
		jmp	loc_C51E9
; ���������������������������������������������������������������������������

loc_C5277:				; CODE XREF: sub_C50C0+1B2j
		cmp	[bp+var_4B], 0
		jz	short loc_C529B
		cmp	[bp+var_50], 0
		jz	short loc_C529B
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C529B:				; CODE XREF: sub_C50C0+1BBj
					; sub_C50C0+1C2j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0

loc_C52AF:				; CODE XREF: sub_C50C0+8Dj
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_C52B8:				; CODE XREF: sub_C50C0+75j
		push	0
		push	large 534E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C52D0
		jmp	loc_C5407
; ���������������������������������������������������������������������������

loc_C52D0:				; CODE XREF: sub_C50C0+20Bj
		push	0
		push	large 4E494C56h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C52E8
		jmp	loc_C53FE
; ���������������������������������������������������������������������������

loc_C52E8:				; CODE XREF: sub_C50C0+223j
		mov	eax, [si+72h]
		mov	ebx, 7
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	eax, [si+72h]
		mov	[bp+var_54], eax
		push	1
		push	0
		push	2
		push	large [bp+var_54]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_58+2],	dx
		mov	word ptr [bp+var_58], ax
		mov	eax, [bp+var_58]
		mov	[bp+var_50], eax
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 1
		mov	[bp+var_4A], 0
		mov	eax, [bp+var_54]
		mov	[bp+var_4A], eax
		push	0
		mov	al, [bp+var_4C]
		push	ax
		push	word ptr [bp+var_50+2]
		push	word ptr [bp+var_50]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		push	0
		mov	al, [bp+var_4C]
		push	ax
		push	word ptr [bp+var_50+2]
		push	word ptr [bp+var_50]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_5C+2],	dx
		mov	word ptr [bp+var_5C], ax
		xor	di, di
		jmp	short loc_C53C1
; ���������������������������������������������������������������������������

loc_C5380:				; CODE XREF: sub_C50C0+304j
		les	bx, [bp+var_5C]
		mov	al, es:[bx]
		cbw
		cmp	ax, 1
		jz	short loc_C5398
		cmp	ax, 2
		jz	short loc_C53A4
		cmp	ax, 3
		jz	short loc_C53B0
		jmp	short $+2

loc_C5398:				; CODE XREF: sub_C50C0+2CAj
		add	[bp+var_12], 0Bh
		add	[bp+var_16], 13h
		jmp	short loc_C53BC
; ���������������������������������������������������������������������������

loc_C53A4:				; CODE XREF: sub_C50C0+2CFj
		add	[bp+var_12], 0Eh
		add	[bp+var_16], 16h
		jmp	short loc_C53BC
; ���������������������������������������������������������������������������

loc_C53B0:				; CODE XREF: sub_C50C0+2D4j
		add	[bp+var_12], 0Ch
		add	[bp+var_16], 14h
		jmp	short $+2

loc_C53BC:				; CODE XREF: sub_C50C0+2E2j
					; sub_C50C0+2EEj
		inc	di
		add	word ptr [bp+var_5C], 7

loc_C53C1:				; CODE XREF: sub_C50C0+2BEj
		cmp	di, [bp+var_4]
		jl	short loc_C5380
		cmp	[bp+var_4B], 0
		jz	short loc_C53EA
		cmp	[bp+var_50], 0
		jz	short loc_C53EA
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C53EA:				; CODE XREF: sub_C50C0+30Aj
					; sub_C50C0+311j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0

loc_C53FE:				; CODE XREF: sub_C50C0+225j
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_C5407:				; CODE XREF: sub_C50C0+20Dj
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C541F
		jmp	loc_C5555
; ���������������������������������������������������������������������������

loc_C541F:				; CODE XREF: sub_C50C0+35Aj
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C5437
		jmp	loc_C554C
; ���������������������������������������������������������������������������

loc_C5437:				; CODE XREF: sub_C50C0+372j
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_6], ax
		mov	eax, [si+72h]
		mov	[bp+var_54], eax
		push	1
		push	0
		push	2
		push	large [bp+var_54]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_58+2],	dx
		mov	word ptr [bp+var_58], ax
		mov	eax, [bp+var_58]
		mov	[bp+var_50], eax
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 1
		mov	[bp+var_4A], 0
		mov	eax, [bp+var_54]
		mov	[bp+var_4A], eax
		push	0
		mov	al, [bp+var_4C]
		push	ax
		push	word ptr [bp+var_50+2]
		push	word ptr [bp+var_50]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		push	0
		mov	al, [bp+var_4C]
		push	ax
		push	word ptr [bp+var_50+2]
		push	word ptr [bp+var_50]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_5C+2],	dx
		mov	word ptr [bp+var_5C], ax
		xor	di, di
		jmp	short loc_C550F
; ���������������������������������������������������������������������������

loc_C54CF:				; CODE XREF: sub_C50C0+452j
		les	bx, [bp+var_5C]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_C54F0	; default
		shl	bx, 1
		jmp	cs:off_C5758[bx] ; switch jump

loc_C54E4:				; DATA XREF: ovr230:off_C5758o
		add	[bp+var_1A], 0Ah ; case	0x0
		add	[bp+var_1E], 11h
		jmp	short loc_C550A
; ���������������������������������������������������������������������������

loc_C54F0:				; CODE XREF: sub_C50C0+41Bj
					; sub_C50C0+41Fj
					; DATA XREF: ...
		add	[bp+var_1A], 0Ah ; default
		add	[bp+var_1E], 11h
		jmp	short loc_C550A
; ���������������������������������������������������������������������������

loc_C54FC:				; CODE XREF: sub_C50C0+41Fj
					; DATA XREF: ovr230:off_C5758o
		add	[bp+var_1A], 0Dh ; case	0x2
		add	[bp+var_1E], 14h
		jmp	short loc_C550A
; ���������������������������������������������������������������������������

loc_C5508:				; CODE XREF: sub_C50C0+41Fj
					; DATA XREF: ovr230:off_C5758o
		jmp	short $+2	; case 0x3

loc_C550A:				; CODE XREF: sub_C50C0+42Ej
					; sub_C50C0+43Aj ...
		inc	di
		add	word ptr [bp+var_5C], 8

loc_C550F:				; CODE XREF: sub_C50C0+40Dj
		cmp	di, [bp+var_6]
		jl	short loc_C54CF
		cmp	[bp+var_4B], 0
		jz	short loc_C5538
		cmp	[bp+var_50], 0
		jz	short loc_C5538
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C5538:				; CODE XREF: sub_C50C0+458j
					; sub_C50C0+45Fj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0

loc_C554C:				; CODE XREF: sub_C50C0+374j
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_C5555:				; CODE XREF: sub_C50C0+35Cj
		mov	[bp+var_1F], 2
		call	Registry_LookupForTextRenderer_2A6C7
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_24], eax
		push	0
		push	2
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_28], eax
		cmp	[bp+var_28], 30D40h
		jge	short loc_C55A9
		cmp	[bp+var_24], 6DDD0h
		jg	short loc_C55A5
		cmp	[bp+var_28], 17318h
		jge	short loc_C55A9

loc_C55A5:				; CODE XREF: sub_C50C0+4D9j
		mov	[bp+var_1F], 3

loc_C55A9:				; CODE XREF: sub_C50C0+4CFj
					; sub_C50C0+4E3j
		mov	eax, [bp+var_E]
		add	eax, [bp+var_12]
		add	eax, [bp+var_1A]
		mov	[bp+var_2C], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	dx, 18h
		imul	dx
		movzx	eax, ax
		mov	edx, [bp+var_2C]
		add	edx, eax
		mov	[bp+var_30], edx
		mov	al, [bp+var_1F]
		mov	[bp+var_31], al
		push	36E6h
		push	1
		push	0
		mov	al, [bp+var_31]
		push	ax
		push	large [bp+var_30]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_36+2],	dx
		mov	word ptr [bp+var_36], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+12h], eax
		les	bx, [bp+arg_0]
		mov	al, [bp+var_31]
		mov	es:[bx+16h], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+17h], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+18h], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_30]
		mov	es:[bx+18h], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		add	ax, word ptr [bp+var_2C]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	dx, 12h
		imul	dx
		movzx	eax, ax
		mov	[bp+var_3A], eax
		push	36E6h
		push	1
		push	0
		push	2
		push	large [bp+var_3A]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_3E+2],	dx
		mov	word ptr [bp+var_3E], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_3E]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Eh], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_3A]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_A]
		add	eax, [bp+var_16]
		add	eax, [bp+var_1E]
		mov	[bp+var_42], eax
		push	36E6h
		push	1
		push	0
		push	2
		push	large [bp+var_42]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_46+2],	dx
		mov	word ptr [bp+var_46], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_46]
		mov	es:[bx+1Ch], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+20h], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+21h], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+22h], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_42]
		mov	es:[bx+22h], eax
		push	1
		push	0
		push	2
		mov	ax, [bp+var_2]
		add	ax, [bp+var_4]
		add	ax, [bp+var_6]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ah], dx
		mov	es:[bx+28h], ax
		pop	di
		pop	si
		leave
		retf
sub_C50C0	endp

; ���������������������������������������������������������������������������
off_C5758	dw offset loc_C54E4	; DATA XREF: sub_C50C0+41Fr
		dw offset loc_C54F0	; jump table for switch	statement
		dw offset loc_C54FC
		dw offset loc_C5508
off_C5760	dw offset loc_C51FE	; DATA XREF: sub_C50C0+139r
		dw offset loc_C520A	; jump table for switch	statement
		dw offset loc_C5216
		dw offset loc_C522E
		dw offset loc_C5222
		dw offset loc_C522E
		dw offset loc_C523A
		dw offset loc_C5246
		dw offset loc_C5252
		dw offset loc_C525E
ovr230		ends
