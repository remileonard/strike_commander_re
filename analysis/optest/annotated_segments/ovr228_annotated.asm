ovr228		segment	para public 'OVERLAY' use16
		assume cs:ovr228
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C4A60	proc far		; CODE XREF: sub_42BF0J

var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [di+72h]
		mov	ebx, 7
		cdq
		idiv	ebx
		mov	[bp+var_12], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_12]
		add	es:[bx+26h], ax
		mov	eax, [di+72h]
		mov	[bp+var_20], eax
		push	1
		push	0
		push	2
		push	large [bp+var_20]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_24+2],	dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 2
		mov	[bp+var_17], 1
		mov	[bp+var_16], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_16], eax
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_28+2],	dx
		mov	word ptr [bp+var_28], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_30], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		sub	ax, [bp+var_12]
		mov	si, ax
		jmp	loc_C4D59
; ���������������������������������������������������������������������������

loc_C4B70:				; CODE XREF: sub_C4A60+302j
		les	bx, [bp+var_28]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_30+2]
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		les	bx, [bp+var_28]
		mov	al, es:[bx+2]
		cbw
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_30+2]
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		les	bx, [bp+var_28]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_2A]
		mov	bx, [bp+var_2C]
		add	bx, ax
		mov	[bp+var_A], dx
		mov	[bp+var_C], bx
		les	bx, [bp+var_28]
		mov	al, es:[bx+2]
		cbw
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_2A]
		mov	bx, [bp+var_2C]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		mov	ax, word_4600C
		xor	dx, dx
		sub	ax, [bp+var_34]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_28]
		mov	al, es:[bx]
		cbw
		cmp	ax, 1
		jz	short loc_C4C1B
		cmp	ax, 2
		jz	short loc_C4C84
		cmp	ax, 3
		jnz	short loc_C4C19
		jmp	loc_C4CEC
; ���������������������������������������������������������������������������

loc_C4C19:				; CODE XREF: sub_C4A60+1B4j
		jmp	short $+2

loc_C4C1B:				; CODE XREF: sub_C4A60+1AAj
		push	word ptr [bp+var_28+2]
		push	word ptr [bp+var_28]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_14913
		add	sp, 10h
		push	13h
		push	ds
		push	offset word_490E4
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_A]
		push	[bp+var_C]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_13D4D
		add	sp, 10h
		add	word_4600C, 13h
		add	word_46010, 0Bh
		jmp	loc_C4D54
; ���������������������������������������������������������������������������

loc_C4C84:				; CODE XREF: sub_C4A60+1AFj
		push	word ptr [bp+var_28+2]
		push	word ptr [bp+var_28]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_149E9
		add	sp, 10h
		push	16h
		push	ds
		push	offset word_490F7
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_A]
		push	[bp+var_C]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_14A2C
		add	sp, 10h
		add	word_4600C, 16h
		add	word_46010, 0Eh
		jmp	short loc_C4D54
; ���������������������������������������������������������������������������

loc_C4CEC:				; CODE XREF: sub_C4A60+1B6j
		push	word ptr [bp+var_28+2]
		push	word ptr [bp+var_28]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_14A94
		add	sp, 10h
		push	14h
		push	ds
		push	offset word_4910D
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_A]
		push	[bp+var_C]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_13D4D
		add	sp, 10h
		add	word_4600C, 14h
		add	word_46010, 0Ch
		jmp	short $+2

loc_C4D54:				; CODE XREF: sub_C4A60+221j
					; sub_C4A60+28Aj
		inc	si
		add	word ptr [bp+var_28], 7

loc_C4D59:				; CODE XREF: sub_C4A60+10Dj
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_C4D65
		jmp	loc_C4B70
; ���������������������������������������������������������������������������

loc_C4D65:				; CODE XREF: sub_C4A60+300j
		cmp	[bp+var_17], 0
		jz	short loc_C4D89
		cmp	[bp+var_1C], 0
		jz	short loc_C4D89
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C4D89:				; CODE XREF: sub_C4A60+309j
					; sub_C4A60+310j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
sub_C4A60	endp

ovr228		ends
