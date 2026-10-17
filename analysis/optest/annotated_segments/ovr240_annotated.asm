ovr240		segment	para public 'OVERLAY' use16
		assume cs:ovr240
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C6390	proc far		; CODE XREF: sub_42E30J

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_C63A5
		jmp	loc_C6588
; ���������������������������������������������������������������������������

loc_C63A5:				; CODE XREF: sub_C6390+10j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2FDEh
		xor	di, di
		jmp	short loc_C63FF
; ���������������������������������������������������������������������������

loc_C63B1:				; CODE XREF: sub_C6390+72j
		les	bx, [bp+arg_0]
		add	bx, di
		cmp	byte ptr es:[bx+5Ch], 0
		jz	short loc_C63E8
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_C63E8:				; CODE XREF: sub_C6390+2Bj
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	word ptr es:[bx+2Eh], 0
		mov	word ptr es:[bx+2Ch], 0
		inc	di

loc_C63FF:				; CODE XREF: sub_C6390+1Fj
		cmp	di, 8
		jl	short loc_C63B1
		push	0
		push	2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+28h]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+28h], 0
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42AD6
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+21h], 0
		jz	short loc_C647F
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1Ch], 0
		jz	short loc_C647F
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C647F:				; CODE XREF: sub_C6390+BBj
					; sub_C6390+C6j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1Ch], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+21h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+22h], 0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+17h], 0
		jz	short loc_C64DB
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+12h], 0
		jz	short loc_C64DB
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+12h]
		mov	[bp+var_10], eax
		lea	ax, [bp+var_10]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C64DB:				; CODE XREF: sub_C6390+117j
					; sub_C6390+122j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+12h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+17h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+18h], 0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Dh], 0
		jz	short loc_C6537
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_C6537
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_14], eax
		lea	ax, [bp+var_14]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C6537:				; CODE XREF: sub_C6390+173j
					; sub_C6390+17Ej
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Eh], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1A0D0
		add	sp, 6
		test	si, 1
		jz	short loc_C6588
		mov	eax, [bp+arg_0]
		mov	[bp+var_18], eax
		push	0
		push	2
		lea	ax, [bp+var_18]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_C6588:				; CODE XREF: sub_C6390+12j
					; sub_C6390+1DBj
		pop	di
		pop	si
		leave
		retf
sub_C6390	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C658C	proc far		; CODE XREF: sub_42E35J

var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_57		= byte ptr -57h
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3D		= byte ptr -3Dh
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_33		= byte ptr -33h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		cmp	[bp+arg_0], 0
		jnz	short loc_C65BE
		push	1
		push	0
		push	2
		push	large 0A0h ; '�'
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_C65BE
		jmp	loc_C6E5E
; ���������������������������������������������������������������������������

loc_C65BE:				; CODE XREF: sub_C658C+Cj
					; sub_C658C+2Dj
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2FA6h
		push	[bp+var_6]
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1A49F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 37AEh
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Bh], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Fh], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+10h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+11h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+17h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Bh], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Ch], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1Dh], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+21h], 2E1Ch
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+21h], 37AAh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Dh	; '-'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_25699
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_25699
		add	sp, 4
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+8Fh], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+8Dh], ax
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+93h], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+91h], ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 95h	; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 99h	; '�'
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+9Fh], 1
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9Dh], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+27h], 0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1A667
		add	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		les	bx, [bp+var_A]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+9], ax
		les	bx, [bp+var_A]
		mov	ax, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], ax
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx+9Ah], 0
		jz	short loc_C6705
		jmp	loc_C67D1
; ���������������������������������������������������������������������������

loc_C6705:				; CODE XREF: sub_C658C+174j
		les	bx, [bp+var_A]
		mov	eax, [bp+arg_0]
		mov	es:[bx+9Ah], eax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 1Ch
		mov	word ptr [bp+var_E+2], ax
		mov	word ptr [bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		les	bx, [bp+var_E]
		mov	al, es:[bx+4]
		mov	[bp+var_13], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+17h], eax
		les	bx, [bp+arg_0]
		mov	al, [bp+var_13]
		mov	es:[bx+1Bh], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Ch], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1Dh], 0
		les	bx, [bp+var_E]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Dh], eax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 8
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		les	bx, [bp+var_18]
		mov	al, es:[bx+4]
		mov	[bp+var_1D], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Bh], eax
		les	bx, [bp+arg_0]
		mov	al, [bp+var_1D]
		mov	es:[bx+0Fh], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+10h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+11h], 0
		les	bx, [bp+var_18]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+11h], eax
		jmp	loc_C6E34
; ���������������������������������������������������������������������������

loc_C67D1:				; CODE XREF: sub_C658C+176j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 17h
		mov	word ptr [bp+var_22+2],	ax
		mov	word ptr [bp+var_22], dx
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx+1Ch], 0
		jnz	short loc_C67EE
		jmp	loc_C6AAB
; ���������������������������������������������������������������������������

loc_C67EE:				; CODE XREF: sub_C658C+25Dj
		les	bx, [bp+var_A]
		cmp	byte ptr es:[bx+20h], 3
		jz	short loc_C67FB
		jmp	loc_C69C2
; ���������������������������������������������������������������������������

loc_C67FB:				; CODE XREF: sub_C658C+26Aj
		les	bx, [bp+var_22]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C6812
		les	bx, [bp+var_22]
		cmp	byte ptr es:[bx+4], 3
		jz	short loc_C6812
		jmp	loc_C69C2
; ���������������������������������������������������������������������������

loc_C6812:				; CODE XREF: sub_C658C+277j
					; sub_C658C+281j
		push	1
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+20h]
		push	ax
		les	bx, [bp+var_A]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_2A+2],	dx
		mov	word ptr [bp+var_2A], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		push	word ptr [bp+var_2A+2]
		push	word ptr [bp+var_2A]
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h
		les	bx, [bp+var_22]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C6899
		les	bx, [bp+var_22]
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+22h]
		jl	short loc_C6899
		jmp	loc_C695C
; ���������������������������������������������������������������������������

loc_C6899:				; CODE XREF: sub_C658C+2F6j
					; sub_C658C+308j
		les	bx, [bp+var_22]
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_C68D3
		les	bx, [bp+var_22]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C68D3
		push	0
		les	bx, [bp+var_22]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_2E], eax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C68D3:				; CODE XREF: sub_C658C+315j
					; sub_C658C+31Fj
		les	bx, [bp+var_22]
		mov	dword ptr es:[bx], 0
		les	bx, [bp+var_22]
		mov	byte ptr es:[bx+5], 0
		les	bx, [bp+var_22]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_A]
		mov	eax, es:[bx+22h]
		mov	[bp+var_32], eax
		les	bx, [bp+var_A]
		mov	al, es:[bx+20h]
		mov	[bp+var_33], al
		push	1
		push	0
		mov	al, [bp+var_33]
		push	ax
		push	large [bp+var_32]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_38+2],	dx
		mov	word ptr [bp+var_38], ax
		les	bx, [bp+var_22]
		mov	eax, [bp+var_38]
		mov	es:[bx], eax
		les	bx, [bp+var_22]
		mov	al, [bp+var_33]
		mov	es:[bx+4], al
		les	bx, [bp+var_22]
		mov	byte ptr es:[bx+5], 1
		les	bx, [bp+var_22]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_22]
		mov	eax, [bp+var_32]
		mov	es:[bx+6], eax
		jmp	short $+2

loc_C695C:				; CODE XREF: sub_C658C+30Aj
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		push	0
		les	bx, [bp+var_22]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+var_22]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		push	word ptr [bp+var_2A+2]
		push	word ptr [bp+var_2A]
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h
		push	0
		push	2
		lea	ax, [bp+var_2A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	loc_C6AA9
; ���������������������������������������������������������������������������

loc_C69C2:				; CODE XREF: sub_C658C+26Cj
					; sub_C658C+283j
		les	bx, [bp+var_22]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C6A0F
		les	bx, [bp+var_22]
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+22h]
		jl	short loc_C6A0C
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		les	bx, [bp+var_A]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		les	bx, [bp+var_22]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h
		jmp	short $+2

loc_C6A0C:				; CODE XREF: sub_C658C+450j
		jmp	loc_C6AA9
; ���������������������������������������������������������������������������

loc_C6A0F:				; CODE XREF: sub_C658C+43Ej
		les	bx, [bp+var_A]
		mov	eax, es:[bx+22h]
		mov	[bp+var_3C], eax
		les	bx, [bp+var_A]
		mov	al, es:[bx+20h]
		mov	[bp+var_3D], al
		push	1
		push	0
		mov	al, [bp+var_3D]
		push	ax
		push	large [bp+var_3C]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_42+2],	dx
		mov	word ptr [bp+var_42], ax
		les	bx, [bp+var_22]
		mov	eax, [bp+var_42]
		mov	es:[bx], eax
		les	bx, [bp+var_22]
		mov	al, [bp+var_3D]
		mov	es:[bx+4], al
		les	bx, [bp+var_22]
		mov	byte ptr es:[bx+5], 1
		les	bx, [bp+var_22]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_22]
		mov	eax, [bp+var_3C]
		mov	es:[bx+6], eax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+20h]
		push	ax
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		les	bx, [bp+var_A]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		les	bx, [bp+var_22]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h

loc_C6AA9:				; CODE XREF: sub_C658C+433j
					; sub_C658C:loc_C6A0Cj
		jmp	short $+2

loc_C6AAB:				; CODE XREF: sub_C658C+25Fj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Bh
		mov	word ptr [bp+var_46+2],	ax
		mov	word ptr [bp+var_46], dx
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx+8], 0
		jnz	short loc_C6AC8
		jmp	loc_C6D85
; ���������������������������������������������������������������������������

loc_C6AC8:				; CODE XREF: sub_C658C+537j
		les	bx, [bp+var_A]
		cmp	byte ptr es:[bx+0Ch], 3
		jz	short loc_C6AD5
		jmp	loc_C6C9C
; ���������������������������������������������������������������������������

loc_C6AD5:				; CODE XREF: sub_C658C+544j
		les	bx, [bp+var_46]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C6AEC
		les	bx, [bp+var_46]
		cmp	byte ptr es:[bx+4], 3
		jz	short loc_C6AEC
		jmp	loc_C6C9C
; ���������������������������������������������������������������������������

loc_C6AEC:				; CODE XREF: sub_C658C+551j
					; sub_C658C+55Bj
		push	1
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2],	dx
		mov	word ptr [bp+var_4A], ax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+var_A]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4E+2],	dx
		mov	word ptr [bp+var_4E], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		push	word ptr [bp+var_4E+2]
		push	word ptr [bp+var_4E]
		push	word ptr [bp+var_4A+2]
		push	word ptr [bp+var_4A]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h
		les	bx, [bp+var_46]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C6B73
		les	bx, [bp+var_46]
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+0Eh]
		jl	short loc_C6B73
		jmp	loc_C6C36
; ���������������������������������������������������������������������������

loc_C6B73:				; CODE XREF: sub_C658C+5D0j
					; sub_C658C+5E2j
		les	bx, [bp+var_46]
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_C6BAD
		les	bx, [bp+var_46]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C6BAD
		push	0
		les	bx, [bp+var_46]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+var_46]
		mov	eax, es:[bx]
		mov	[bp+var_52], eax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C6BAD:				; CODE XREF: sub_C658C+5EFj
					; sub_C658C+5F9j
		les	bx, [bp+var_46]
		mov	dword ptr es:[bx], 0
		les	bx, [bp+var_46]
		mov	byte ptr es:[bx+5], 0
		les	bx, [bp+var_46]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_A]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_56], eax
		les	bx, [bp+var_A]
		mov	al, es:[bx+0Ch]
		mov	[bp+var_57], al
		push	1
		push	0
		mov	al, [bp+var_57]
		push	ax
		push	large [bp+var_56]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_5C+2],	dx
		mov	word ptr [bp+var_5C], ax
		les	bx, [bp+var_46]
		mov	eax, [bp+var_5C]
		mov	es:[bx], eax
		les	bx, [bp+var_46]
		mov	al, [bp+var_57]
		mov	es:[bx+4], al
		les	bx, [bp+var_46]
		mov	byte ptr es:[bx+5], 1
		les	bx, [bp+var_46]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_46]
		mov	eax, [bp+var_56]
		mov	es:[bx+6], eax
		jmp	short $+2

loc_C6C36:				; CODE XREF: sub_C658C+5E4j
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		push	0
		les	bx, [bp+var_46]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+var_46]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4A+2],	dx
		mov	word ptr [bp+var_4A], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		push	word ptr [bp+var_4E+2]
		push	word ptr [bp+var_4E]
		push	word ptr [bp+var_4A+2]
		push	word ptr [bp+var_4A]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h
		push	0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	loc_C6D83
; ���������������������������������������������������������������������������

loc_C6C9C:				; CODE XREF: sub_C658C+546j
					; sub_C658C+55Dj
		les	bx, [bp+var_46]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C6CE9
		les	bx, [bp+var_46]
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+0Eh]
		jl	short loc_C6CE6
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		les	bx, [bp+var_A]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		les	bx, [bp+var_46]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h
		jmp	short $+2

loc_C6CE6:				; CODE XREF: sub_C658C+72Aj
		jmp	loc_C6D83
; ���������������������������������������������������������������������������

loc_C6CE9:				; CODE XREF: sub_C658C+718j
		les	bx, [bp+var_A]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_60], eax
		les	bx, [bp+var_A]
		mov	al, es:[bx+0Ch]
		mov	[bp+var_61], al
		push	1
		push	0
		mov	al, [bp+var_61]
		push	ax
		push	large [bp+var_60]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_66+2],	dx
		mov	word ptr [bp+var_66], ax
		les	bx, [bp+var_46]
		mov	eax, [bp+var_66]
		mov	es:[bx], eax
		les	bx, [bp+var_46]
		mov	al, [bp+var_61]
		mov	es:[bx+4], al
		les	bx, [bp+var_46]
		mov	byte ptr es:[bx+5], 1
		les	bx, [bp+var_46]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_46]
		mov	eax, [bp+var_60]
		mov	es:[bx+6], eax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		les	bx, [bp+var_A]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		les	bx, [bp+var_46]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	661Ah
		call	Memory_TypedAllocDispatch_2B8DE
		add	sp, 12h

loc_C6D83:				; CODE XREF: sub_C658C+70Dj
					; sub_C658C:loc_C6CE6j
		jmp	short $+2

loc_C6D85:				; CODE XREF: sub_C658C+539j
		les	bx, [bp+var_A]
		mov	eax, es:[bx+28h]
		mov	[bp+var_6A], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1Bh]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+19h]
		push	word ptr es:[bx+17h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_6E+2],	dx
		mov	word ptr [bp+var_6E], ax
		xor	si, si
		jmp	short loc_C6E2B
; ���������������������������������������������������������������������������

loc_C6DBB:				; CODE XREF: sub_C658C+8A6j
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+0Bh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+var_A]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		les	bx, [bp+var_6A]
		mov	ax, word ptr [bp+var_6E]
		add	ax, es:[bx]
		push	word ptr [bp+var_6E+2]
		push	ax
		les	bx, [bp+var_6A]
		push	es
		les	ax, [bp+var_6E]
		mov	dx, es
		pop	es
		add	ax, es:[bx]
		mov	bx, ax
		mov	es, dx
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 0Ch
		inc	si
		add	word ptr [bp+var_6A], 2

loc_C6E2B:				; CODE XREF: sub_C658C+82Dj
		les	bx, [bp+arg_0]
		cmp	es:[bx+15h], si
		jg	short loc_C6DBB

loc_C6E34:				; CODE XREF: sub_C658C+242j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1A718
		add	sp, 4
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1A6CE
		add	sp, 4
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1A778
		add	sp, 4

loc_C6E5E:				; CODE XREF: sub_C658C+2Fj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_C658C	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C6E6A	proc far		; CODE XREF: sub_42E3AJ

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_C6E7E
		jmp	loc_C6FAB
; ���������������������������������������������������������������������������

loc_C6E7E:				; CODE XREF: sub_C6E6A+Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 37AEh
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+9Ah]
		cmp	eax, [bp+arg_0]
		jnz	short loc_C6EAE
		les	bx, [bp+var_4]
		mov	dword ptr es:[bx+9Ah], 0

loc_C6EAE:				; CODE XREF: sub_C6E6A+35j
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 8Dh	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42AD6
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1Ch], 0
		jz	short loc_C6EFE
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+17h], 0
		jz	short loc_C6EFE
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1Bh]
		push	ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+17h]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C6EFE:				; CODE XREF: sub_C6E6A+60j
					; sub_C6E6A+6Bj
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+17h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Ch], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1Dh], 0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+10h], 0
		jz	short loc_C6F5A
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Bh], 0
		jz	short loc_C6F5A
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		push	ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Bh]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C6F5A:				; CODE XREF: sub_C6E6A+BCj
					; sub_C6E6A+C7j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Bh], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+10h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+11h], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1A440
		add	sp, 6
		test	si, 1
		jz	short loc_C6FAB
		mov	eax, [bp+arg_0]
		mov	[bp+var_10], eax
		push	0
		push	2
		lea	ax, [bp+var_10]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_C6FAB:				; CODE XREF: sub_C6E6A+11j
					; sub_C6E6A+124j
		pop	si
		leave
		retf
sub_C6E6A	endp

ovr240		ends
