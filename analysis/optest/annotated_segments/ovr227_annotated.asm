ovr227		segment	para public 'OVERLAY' use16
		assume cs:ovr227
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C4390	proc far		; CODE XREF: sub_42BC0J

var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
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
		sub	sp, 3Eh
		push	si
		push	di
		mov	[bp+var_19], 0
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_1C], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_1C]
		add	es:[bx+26h], ax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	[bp+var_2A], eax
		push	1
		push	0
		push	2
		push	large [bp+var_2A]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_2E+2],	dx
		mov	word ptr [bp+var_2E], ax
		mov	eax, [bp+var_2E]
		mov	[bp+var_26], eax
		mov	[bp+var_22], 2
		mov	[bp+var_21], 1
		mov	[bp+var_20], 0
		mov	eax, [bp+var_2A]
		mov	[bp+var_20], eax
		push	0
		mov	al, [bp+var_22]
		push	ax
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		push	0
		mov	al, [bp+var_22]
		push	ax
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_32+2],	dx
		mov	word ptr [bp+var_32], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_36], eax
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
		mov	[bp+var_38], dx
		mov	[bp+var_3A], ax
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
		mov	[bp+var_3C], dx
		mov	[bp+var_3E], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		sub	ax, [bp+var_1C]
		mov	si, ax
		jmp	loc_C49F9
; ���������������������������������������������������������������������������

loc_C44A9:				; CODE XREF: sub_C4390+672j
		les	bx, [bp+var_32]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_38]
		mov	bx, [bp+var_3A]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_38]
		mov	bx, [bp+var_3A]
		add	bx, ax
		mov	[bp+var_12], dx
		mov	[bp+var_14], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+3]
		mov	ah, 0
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_38]
		mov	bx, [bp+var_3A]
		add	bx, ax
		mov	[bp+var_16], dx
		mov	[bp+var_18], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_36+2]
		mov	bx, word ptr [bp+var_36]
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_36+2]
		mov	bx, word ptr [bp+var_36]
		add	bx, ax
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+3]
		mov	ah, 0
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_36+2]
		mov	bx, word ptr [bp+var_36]
		add	bx, ax
		mov	[bp+var_A], dx
		mov	[bp+var_C], bx
		mov	ax, word_4600C
		xor	dx, dx
		sub	ax, [bp+var_3E]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_32]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9		; switch 10 cases
		ja	short loc_C45FF	; default
		shl	bx, 1
		jmp	cs:off_C4A41[bx] ; switch jump

loc_C458A:				; DATA XREF: ovr227:off_C4A41o
		push	word ptr [bp+var_32+2] ; case 0x0
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1BAF8
		add	sp, 14h
		push	17h
		push	ds
		push	offset word_4918E
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1B94E
		add	sp, 14h
		add	word_4600C, 17h
		add	word_46010, 27h	; '''
		jmp	loc_C49F4
; ���������������������������������������������������������������������������

loc_C45FF:				; CODE XREF: sub_C4390+1F1j
					; sub_C4390+1F5j
					; DATA XREF: ...
		push	word ptr [bp+var_32+2] ; default
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1BC26
		add	sp, 14h
		push	17h
		push	ds
		push	offset word_491BF
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1B94E
		add	sp, 14h
		add	word_4600C, 17h
		add	word_46010, 27h	; '''
		jmp	loc_C49F4
; ���������������������������������������������������������������������������

loc_C4674:				; CODE XREF: sub_C4390+1F5j
					; DATA XREF: ovr227:off_C4A41o
		push	word ptr [bp+var_32+2] ; case 0x2
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1BD0E
		add	sp, 14h
		push	1Ah
		push	ds
		push	offset word_491A5
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1B94E
		add	sp, 14h
		add	word_4600C, 1Ah
		add	word_46010, 2Ah	; '*'
		jmp	loc_C49F4
; ���������������������������������������������������������������������������

loc_C46E9:				; CODE XREF: sub_C4390+1F5j
					; DATA XREF: ovr227:off_C4A41o
		push	word ptr [bp+var_32+2] ; case 0x4
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1C069
		add	sp, 14h
		push	1Ch
		push	ds
		push	offset word_491D6
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1C0AC
		add	sp, 14h
		add	word_4600C, 1Ch
		add	word_46010, 29h	; ')'
		jmp	loc_C49F4
; ���������������������������������������������������������������������������

loc_C475E:				; CODE XREF: sub_C4390+1F5j
					; DATA XREF: ovr227:off_C4A41o
		mov	al, [bp+var_19]	; case 0x3
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C47AD
		les	bx, [bp+var_32]
		mov	al, es:[bx+4]
		cbw
		push	ax
		push	62D0h
		call	sub_1ED93
		add	sp, 4
		mov	di, ax
		cmp	di, 0FFFFh
		jz	short loc_C47A0
		push	0
		push	large 0
		push	0C8h ; '�'
		push	di
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+85h], al
		jmp	short loc_C47A9
; ���������������������������������������������������������������������������

loc_C47A0:				; CODE XREF: sub_C4390+3F0j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+85h], 0

loc_C47A9:				; CODE XREF: sub_C4390+40Ej
		mov	[bp+var_19], 1

loc_C47AD:				; CODE XREF: sub_C4390+3D5j
		push	word ptr [bp+var_32+2]
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1C2FE
		add	sp, 14h
		push	18h
		push	ds
		push	offset word_491F2
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1C33D
		add	sp, 14h
		add	word_4600C, 18h
		add	word_46010, 28h	; '('
		jmp	loc_C49F4
; ���������������������������������������������������������������������������

loc_C4822:				; CODE XREF: sub_C4390+1F5j
					; DATA XREF: ovr227:off_C4A41o
		push	word ptr [bp+var_32+2] ; case 0x6
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1B829
		add	sp, 14h
		push	1Eh
		push	ds
		push	offset word_4920A
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1B94E
		add	sp, 14h
		add	word_4600C, 1Eh
		add	word_46010, 26h	; '&'
		jmp	loc_C49F4
; ���������������������������������������������������������������������������

loc_C4897:				; CODE XREF: sub_C4390+1F5j
					; DATA XREF: ovr227:off_C4A41o
		push	word ptr [bp+var_32+2] ; case 0x7
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1C8E6
		add	sp, 14h
		push	24h ; '$'
		push	ds
		push	offset word_49228
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1C929
		add	sp, 14h
		add	word_4600C, 24h	; '$'
		add	word_46010, 29h	; ')'
		jmp	loc_C49F4
; ���������������������������������������������������������������������������

loc_C490C:				; CODE XREF: sub_C4390+1F5j
					; DATA XREF: ovr227:off_C4A41o
		push	word ptr [bp+var_32+2] ; case 0x8
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1CC38
		add	sp, 14h
		push	20h ; ' '
		push	ds
		push	offset word_4924C
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1CC77
		add	sp, 14h
		add	word_4600C, 20h	; ' '
		add	word_46010, 28h	; '('
		jmp	short loc_C49F4
; ���������������������������������������������������������������������������

loc_C4980:				; CODE XREF: sub_C4390+1F5j
					; DATA XREF: ovr227:off_C4A41o
		push	word ptr [bp+var_32+2] ; case 0x9
		push	word ptr [bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_46012
		push	word_46010
		call	sub_1B829
		add	sp, 14h
		push	24h ; '$'
		push	ds
		push	offset word_4926C
		push	word_4600E
		push	word_4600C
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_46012
		push	word_46010
		push	word_4600E
		push	word_4600C
		call	sub_1B94E
		add	sp, 14h
		add	word_4600C, 24h	; '$'
		add	word_46010, 26h	; '&'
		jmp	short $+2

loc_C49F4:				; CODE XREF: sub_C4390+26Cj
					; sub_C4390+2E1j ...
		inc	si
		add	word ptr [bp+var_32], 8

loc_C49F9:				; CODE XREF: sub_C4390+116j
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_C4A05
		jmp	loc_C44A9
; ���������������������������������������������������������������������������

loc_C4A05:				; CODE XREF: sub_C4390+670j
		cmp	[bp+var_21], 0
		jz	short loc_C4A29
		cmp	[bp+var_26], 0
		jz	short loc_C4A29
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C4A29:				; CODE XREF: sub_C4390+679j
					; sub_C4390+680j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		pop	di
		pop	si
		leave
		retf
sub_C4390	endp

; ���������������������������������������������������������������������������
off_C4A41	dw offset loc_C458A	; DATA XREF: sub_C4390+1F5r
		dw offset loc_C45FF	; jump table for switch	statement
		dw offset loc_C4674
		dw offset loc_C475E
		dw offset loc_C46E9
		dw offset loc_C475E
		dw offset loc_C4822
		dw offset loc_C4897
		dw offset loc_C490C
		dw offset loc_C4980
ovr227		ends
