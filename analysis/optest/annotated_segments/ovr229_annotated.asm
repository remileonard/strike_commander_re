ovr229		segment	para public 'OVERLAY' use16
		assume cs:ovr229
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C4DB0	proc far		; CODE XREF: sub_42C20J

var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [di+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_A], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_A]
		add	es:[bx+26h], ax
		mov	eax, [di+72h]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	2
		push	large [bp+var_18]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax
		mov	[bp+var_10], 2
		mov	[bp+var_F], 1
		mov	[bp+var_E], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_20+2],	dx
		mov	word ptr [bp+var_20], ax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_20+2],	dx
		mov	word ptr [bp+var_20], ax
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
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_28], eax
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
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		sub	ax, [bp+var_A]
		mov	si, ax
		jmp	loc_C5068
; ���������������������������������������������������������������������������

loc_C4EDD:				; CODE XREF: sub_C4DB0+2C1j
		les	bx, [bp+var_20]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_28+2]
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		les	bx, [bp+var_20]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_22]
		mov	bx, [bp+var_24]
		add	bx, ax
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		mov	ax, word_4600C
		xor	dx, dx
		sub	ax, [bp+var_2C]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_20]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_C4FA9	; default
		shl	bx, 1
		jmp	cs:off_C50B0[bx] ; switch jump

loc_C4F4C:				; DATA XREF: ovr229:off_C50B0o
		push	word ptr [bp+var_20+2] ; case 0x0
		push	word ptr [bp+var_20]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1E12F
		add	sp, 0Ch
		push	11h
		push	ds
		push	offset word_492A4
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_6]
		push	[bp+var_8]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1DC01
		add	sp, 0Ch
		add	word_4600C, 11h
		add	word_46010, 0Ah
		jmp	loc_C5063
; ���������������������������������������������������������������������������

loc_C4FA9:				; CODE XREF: sub_C4DB0+193j
					; sub_C4DB0+197j
					; DATA XREF: ...
		push	word ptr [bp+var_20+2] ; default
		push	word ptr [bp+var_20]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1E12F
		add	sp, 0Ch
		push	11h
		push	ds
		push	offset word_492B5
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_6]
		push	[bp+var_8]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1DC01
		add	sp, 0Ch
		add	word_4600C, 11h
		add	word_46010, 0Ah
		jmp	short loc_C5063
; ���������������������������������������������������������������������������

loc_C5005:				; CODE XREF: sub_C4DB0+197j
					; DATA XREF: ovr229:off_C50B0o
		push	word ptr [bp+var_20+2] ; case 0x2
		push	word ptr [bp+var_20]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1E25E
		add	sp, 0Ch
		push	14h
		push	ds
		push	offset word_49290
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_6]
		push	[bp+var_8]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1E2BD
		add	sp, 0Ch
		add	word_4600C, 14h
		add	word_46010, 0Dh
		jmp	short loc_C5063
; ���������������������������������������������������������������������������

loc_C5061:				; CODE XREF: sub_C4DB0+197j
					; DATA XREF: ovr229:off_C50B0o
		jmp	short $+2	; case 0x3

loc_C5063:				; CODE XREF: sub_C4DB0+1F6j
					; sub_C4DB0+253j ...
		inc	si
		add	word ptr [bp+var_20], 8

loc_C5068:				; CODE XREF: sub_C4DB0+12Aj
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_C5074
		jmp	loc_C4EDD
; ���������������������������������������������������������������������������

loc_C5074:				; CODE XREF: sub_C4DB0+2BFj
		cmp	[bp+var_F], 0
		jz	short loc_C5098
		cmp	[bp+var_14], 0
		jz	short loc_C5098
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C5098:				; CODE XREF: sub_C4DB0+2C8j
					; sub_C4DB0+2CFj
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		pop	di
		pop	si
		leave
		retf
sub_C4DB0	endp

; ���������������������������������������������������������������������������
off_C50B0	dw offset loc_C4F4C	; DATA XREF: sub_C4DB0+197r
		dw offset loc_C4FA9	; jump table for switch	statement
		dw offset loc_C5005
		dw offset loc_C5061
ovr229		ends
