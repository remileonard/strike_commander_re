seg004		segment	byte public 'CODE' use16
		assume cs:seg004
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_49BC	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+19BP
					; seg002:0CEAP	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4A19
		mov	word ptr [si], 130Bh
		mov	[bp+var_2], 0
		jmp	short loc_49EC
; ���������������������������������������������������������������������������

loc_49D9:				; CODE XREF: sub_49BC+3Fj
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		mov	[bp+var_2], 0

loc_49EC:				; CODE XREF: sub_49BC+1Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_49D9
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_4A19
		push	si
		call	sub_308
		add	sp, 2

loc_4A19:				; CODE XREF: sub_49BC+10j sub_49BC+52j
		pop	di
		pop	si
		leave
		retf
sub_49BC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4A1D	proc far		; CODE XREF: sub_5803+43FP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		mov	[si+20h], ax
		cmp	word ptr [si+20h], 1
		jle	short loc_4A56
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_4A5A
; ���������������������������������������������������������������������������

loc_4A56:				; CODE XREF: sub_4A1D+2Cj
		mov	byte ptr [si+1Dh], 0

loc_4A5A:				; CODE XREF: sub_4A1D+37j
		mov	byte ptr [si+2Ch], 0
		mov	byte ptr [si+1Eh], 0
		mov	ax, [si+20h]
		mov	[si+24h], ax
		mov	[si+22h], ax
		mov	word ptr [si+26h], 0
		mov	word ptr [si+2Ah], 0
		mov	word ptr [si+28h], 0
		mov	byte ptr [si+2Dh], 0FFh
		pop	si
		pop	bp
		retf
sub_4A1D	endp

; ���������������������������������������������������������������������������

loc_4A81:				; DATA XREF: dseg:1342o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+16h], 0
		jz	short loc_4AAE
		cmp	dword ptr [si+11h], 0
		jz	short loc_4AAE
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4AAE:				; CODE XREF: seg004:00DCj seg004:00E3j
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	byte ptr [si+1Dh], 0
		mov	ax, [bp+8]
		mov	[si+1Bh], ax
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4AD9	proc far		; CODE XREF: sub_5803+48DP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+22h], ax
		mov	ax, [bp+arg_4]
		mov	[si+24h], ax
		pop	si
		pop	bp
		retf
sub_4AD9	endp

; ���������������������������������������������������������������������������

loc_4AEF:				; CODE XREF: seg005:0C94J
					; DATA XREF: dseg:133Eo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word_46F44
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_2E202
		add	sp, 2
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4B56	proc far		; CODE XREF: sub_502B+FAp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 1
		pop	si
		pop	bp
		retf
sub_4B56	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	byte ptr [si+2Ch], 0
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4B72:				; DATA XREF: dseg:134Ao
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+1Dh], 0
		jnz	short loc_4B82
		jmp	loc_4C13
; ���������������������������������������������������������������������������

loc_4B82:				; CODE XREF: seg004:01CDj
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_4BB6
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		jb	short loc_4B98
		mov	ax, [si+1Bh]
		cmp	ax, [si+24h]
		jbe	short loc_4BA0

loc_4B98:				; CODE XREF: seg004:01DEj
		mov	ax, [si+22h]
		mov	[si+1Bh], ax
		jmp	short loc_4BAB
; ���������������������������������������������������������������������������

loc_4BA0:				; CODE XREF: seg004:01E6j
		mov	ax, [si+1Bh]
		cmp	ax, [si+24h]
		jz	short loc_4BAB
		inc	word ptr [si+1Bh]

loc_4BAB:				; CODE XREF: seg004:01EEj seg004:01F6j
		mov	word ptr [si+28h], 0
		mov	byte ptr [si+2Ch], 0
		jmp	short loc_4C13
; ���������������������������������������������������������������������������

loc_4BB6:				; CODE XREF: seg004:01D6j
		cmp	word ptr [si+2Ah], 0
		jz	short loc_4BFA
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		ja	short loc_4BE5
		mov	ax, [si+28h]
		shl	ax, 1
		mov	bx, [si+26h]
		add	bx, ax
		mov	ax, [bx]
		mov	[si+1Bh], ax
		inc	word ptr [si+28h]
		mov	ax, [si+28h]
		cmp	ax, [si+2Ah]
		jl	short loc_4BE3
		mov	word ptr [si+28h], 0

loc_4BE3:				; CODE XREF: seg004:022Cj
		jmp	short loc_4BF8
; ���������������������������������������������������������������������������

loc_4BE5:				; CODE XREF: seg004:0212j
		inc	word ptr [si+1Bh]
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_4BF8
		mov	bx, [si+26h]
		mov	ax, [bx]
		mov	[si+1Bh], ax

loc_4BF8:				; CODE XREF: seg004:loc_4BE3j
					; seg004:023Ej
		jmp	short loc_4C13
; ���������������������������������������������������������������������������

loc_4BFA:				; CODE XREF: seg004:020Aj
		inc	word ptr [si+1Bh]
		mov	ax, [si+22h]
		inc	ax
		cmp	ax, [si+1Bh]
		jz	short loc_4C0E
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_4C13

loc_4C0E:				; CODE XREF: seg004:0254j
		mov	word ptr [si+1Bh], 1

loc_4C13:				; CODE XREF: seg004:01CFj seg004:0204j ...
		push	si
		call	LayerGroup_AdvanceAll_2DC2D
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C1F	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+8EP
					; Gameflow_WeaponLoadout_51AB3+259P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		or	si, si
		jnz	short loc_4C44
		push	3Fh ; '?'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_4C44
		jmp	loc_4CD5
; ���������������������������������������������������������������������������

loc_4C44:				; CODE XREF: sub_4C1F+10j sub_4C1F+20j
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_2DC66
		add	sp, 8
		mov	word ptr [si], 522h
		mov	word ptr [si+0Ah], 542h
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si+21h], 0
		mov	byte ptr [si+2Ch], 0
		mov	word ptr [si+39h], 2BDh
		xor	ax, ax
		mov	[si+3Dh], ax
		mov	[si+3Bh], ax
		mov	word ptr [si+39h], 130Bh
		mov	word ptr [si+23h], 0
		mov	word ptr [si+25h], 0
		mov	word ptr [si+27h], 13Fh
		mov	word ptr [si+29h], 0C7h	; '�'
		push	0
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 1Fh
		push	ax
		push	0
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[si+2Dh], ax
		mov	[bp+var_2], di
		mov	bx, [si+2Dh]
		mov	ax, [bp+var_2]
		mov	[bx+14h], ax
		mov	word ptr [si+37h], 0
		mov	byte ptr [si+30h], 0
		mov	byte ptr [si+31h], 0
		mov	byte ptr [si+32h], 0FFh

loc_4CD5:				; CODE XREF: sub_4C1F+22j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_4C1F	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4CDF	proc far		; CODE XREF: sub_5803+60AP

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx+2]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx+4]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx+6]
		mov	[bp+var_6], ax
		mov	al, [bp+arg_4]
		mov	[bp+var_D], al
		mov	ax, [bp+arg_6]
		mov	[bp+var_10], ax
		push	16h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_4DA5
		mov	ax, [bp+var_C]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		mov	word ptr [di], 5CEh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 12DFh
		mov	ax, [bp+var_18]
		mov	[di+6],	ax
		mov	ax, [bp+var_16]
		mov	[di+8],	ax
		mov	ax, [bp+var_14]
		mov	[di+0Ah], ax
		mov	ax, [bp+var_12]
		mov	[di+0Ch], ax
		push	[bp+var_10]
		call	CRT_Strdup
		add	sp, 2
		mov	[di+4],	ax
		mov	word ptr [di+0Eh], 5CEh
		mov	word ptr [di+10h], 0
		mov	word ptr [di+0Eh], 12CBh
		mov	word ptr [di], 12E3h
		mov	word ptr [di+0Eh], 12F7h
		mov	byte ptr [di+15h], 0
		mov	word ptr [di+12h], 0
		mov	al, [bp+var_D]
		mov	[di+14h], al
		mov	ax, di
		jmp	short loc_4DA7
; ���������������������������������������������������������������������������

loc_4DA5:				; CODE XREF: sub_4CDF+4Ej
		mov	ax, di

loc_4DA7:				; CODE XREF: sub_4CDF+C4j
		mov	[bp+var_1A], ax
		cmp	[bp+var_1A], 0
		jz	short loc_4DB8
		mov	ax, [bp+var_1A]
		add	ax, 0Eh
		jmp	short loc_4DBB
; ���������������������������������������������������������������������������

loc_4DB8:				; CODE XREF: sub_4CDF+CFj
		mov	ax, [bp+var_1A]

loc_4DBB:				; CODE XREF: sub_4CDF+D7j
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 39h	; '9'
		push	ax
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_4CDF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4DD3	proc far		; CODE XREF: sub_5803+6C5P

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
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
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_B], al
		mov	ax, [bp+arg_C]
		mov	[bp+var_E], ax
		push	1Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_4E73
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[di+4],	eax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[di+8],	eax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[di+0Ch], eax
		mov	word ptr [di+10h], 5CEh
		mov	word ptr [di+12h], 0
		mov	word ptr [di+10h], 12CBh
		mov	word ptr [di+18h], 12A3h
		mov	word ptr [di+10h], 12B7h
		mov	byte ptr [di+17h], 0
		mov	word ptr [di+14h], 0
		push	[bp+var_E]
		call	CRT_Strdup
		add	sp, 2
		mov	[di+1Ah], ax
		mov	al, [bp+var_B]
		mov	[di+16h], al
		mov	ax, di
		jmp	short loc_4E75
; ���������������������������������������������������������������������������

loc_4E73:				; CODE XREF: sub_4DD3+3Dj
		mov	ax, di

loc_4E75:				; CODE XREF: sub_4DD3+9Ej
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0
		jz	short loc_4E86
		mov	ax, [bp+var_10]
		add	ax, 10h
		jmp	short loc_4E89
; ���������������������������������������������������������������������������

loc_4E86:				; CODE XREF: sub_4DD3+A9j
		mov	ax, [bp+var_10]

loc_4E89:				; CODE XREF: sub_4DD3+B1j
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 39h	; '9'
		push	ax
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_4DD3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4EA1	proc far		; CODE XREF: sub_5803+61DP
					; sub_5803+6D8P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_4ECB
; ���������������������������������������������������������������������������

loc_4EB6:				; CODE XREF: sub_4EA1+3Ej
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_4]
		jnz	short loc_4ECB
		mov	bx, [bp+var_2]
		mov	[bx+4],	di
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4ECB:				; CODE XREF: sub_4EA1+13j sub_4EA1+1Ej
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 39h	; '9'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_4EB6
		push	0
		push	word_4429C
		call	Fatal_Error_310B
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_4EA1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4EF3	proc far		; CODE XREF: sub_4FB2+30p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		mov	[si+33h], ax
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		mov	[si+35h], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_4EF3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4F0F	proc far		; CODE XREF: sub_4FB2+38p
					; sub_502B+1D8p

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_49818
		mov	[bp+var_1], 0
		mov	word ptr [si+37h], 0
		mov	[bp+var_4], 0
		jmp	short loc_4F59
; ���������������������������������������������������������������������������

loc_4F2E:				; CODE XREF: sub_4F0F+5Ej
		push	word ptr [si+35h]
		push	word ptr [si+33h]
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_4F59
		mov	bx, [bp+var_4]
		cmp	byte ptr [bx+7], 0
		jz	short loc_4F59
		mov	[bp+var_1], 1
		mov	ax, [bp+var_4]
		mov	[si+37h], ax

loc_4F59:				; CODE XREF: sub_4F0F+1Dj sub_4F0F+35j ...
		lea	ax, [bp+var_4]
		push	ax
		mov	ax, si
		add	ax, 39h	; '9'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_4F2E
		cmp	[bp+var_1], 0
		jz	short loc_4F99
		push	word ptr [si+37h]
		push	si
		nop
		push	cs
		call	near ptr sub_4FFF
		add	sp, 4
		or	di, di
		jz	short loc_4F95
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	word_49818, 0
		call	TextScrollDisplayB_ApplyHelperC_3F74A

loc_4F95:				; CODE XREF: sub_4F0F+74j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4F99:				; CODE XREF: sub_4F0F+64j
		cmp	di, 1
		jz	short loc_4FAE
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	word_49818, 1
		call	TextScrollDisplayB_ApplyHelperC_3F74A

loc_4FAE:				; CODE XREF: sub_4F0F+8Dj
		pop	di
		pop	si
		leave
		retf
sub_4F0F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4FB2	proc far		; CODE XREF: sub_502B+42p
					; sub_502B+2A5p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

; FUNCTION CHUNK AT 064C SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_47AB4
		mov	[bp+var_2], ax
		mov	ax, word_47AB6
		mov	[bp+var_4], ax
		mov	ax, [si+33h]
		cmp	ax, [bp+var_2]
		jnz	short loc_4FD8
		mov	ax, [si+35h]
		cmp	ax, [bp+var_4]
		jz	short loc_4FF7

loc_4FD8:				; CODE XREF: sub_4FB2+1Cj
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_4EF3
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_4F0F
		add	sp, 2
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_4FFC
; ���������������������������������������������������������������������������

loc_4FF7:				; CODE XREF: sub_4FB2+24j
		mov	al, 0
		pop	si
		leave
		retf
sub_4FB2	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_4FB2

loc_4FFC:				; CODE XREF: sub_4FB2+43j
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK	FOR sub_4FB2

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4FFF	proc far		; CODE XREF: sub_4F0F+6Cp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0AFh ; '�'
		push	di
		mov	bx, [di]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	ax
		push	2
		push	1295h
		push	word ptr [si+2Dh]
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_4FFF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_502B	proc far		; CODE XREF: sub_6162+AEP

var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_8		= word ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	Input_Flush_CDDC
		mov	byte ptr [bp+var_8], 0
		mov	[bp+var_D], 0
		mov	[bp+var_10], 0
		push	0
		push	word_46F46
		call	TextScrollDisplayB_ApplyHelperA_3F6C0
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_3F74A
		mov	dword ptr [si+19h], 0
		mov	eax, dword_47ABB
		mov	[si+15h], eax
		push	si
		push	cs
		call	near ptr sub_4FB2
		add	sp, 2

loc_5073:				; CODE XREF: sub_502B:loc_5386j
		call	sub_D157
		mov	eax, [si+15h]
		add	eax, [si+19h]
		cmp	eax, dword_47ABB
		ja	short loc_508C
		mov	ax, 1
		jmp	short loc_508E
; ���������������������������������������������������������������������������

loc_508C:				; CODE XREF: sub_502B+5Aj
		xor	ax, ax

loc_508E:				; CODE XREF: sub_502B+5Fj
		or	al, al
		jnz	short loc_5095
		jmp	loc_526C
; ���������������������������������������������������������������������������

loc_5095:				; CODE XREF: sub_502B+65j
		mov	ax, si
		add	ax, 1Fh
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[si+19h], eax
		mov	eax, dword_47ABB
		mov	[si+15h], eax
		mov	[bp+var_1A], 0
		jmp	short loc_50E1
; ���������������������������������������������������������������������������

loc_50C7:				; CODE XREF: sub_502B+CAj
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1A]
		push	word ptr [bx+6]
		mov	bx, [bp+var_1A]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_50E1:				; CODE XREF: sub_502B+9Aj
		lea	ax, [bp+var_1A]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_50C7
		mov	[bp+var_1C], 0
		xor	di, di
		jmp	loc_5197
; ���������������������������������������������������������������������������

loc_5101:				; CODE XREF: sub_502B+182j
		mov	bx, [bp+var_1C]
		cmp	byte ptr [bx+7], 0
		jnz	short loc_510D
		jmp	loc_5197
; ���������������������������������������������������������������������������

loc_510D:				; CODE XREF: sub_502B+DDj
		mov	ax, [si+37h]
		cmp	ax, [bp+var_1C]
		jnz	short loc_5157
		mov	bx, [bp+var_1C]
		cmp	word ptr [bx+4], 0
		jz	short loc_5145
		mov	bx, [bp+var_1C]
		push	word ptr [bx+4]
		push	cs
		call	near ptr sub_4B56
		add	sp, 2
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1C]
		push	word ptr [bx+4]
		mov	bx, [bp+var_1C]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_5145:				; CODE XREF: sub_502B+F1j
		push	[bp+var_1C]
		mov	bx, [bp+var_1C]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	di, ax
		jmp	short loc_517A
; ���������������������������������������������������������������������������

loc_5157:				; CODE XREF: sub_502B+E8j
		mov	bx, [bp+var_1C]
		cmp	word ptr [bx+4], 0
		jz	short loc_517A
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1C]
		push	word ptr [bx+4]
		mov	bx, [bp+var_1C]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_517A:				; CODE XREF: sub_502B+12Aj
					; sub_502B+133j
		mov	bx, [bp+var_1C]
		cmp	word ptr [bx+4], 0
		jz	short loc_5197
		mov	bx, [bp+var_1C]
		push	word ptr [bx+4]
		mov	bx, [bp+var_1C]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 2

loc_5197:				; CODE XREF: sub_502B+D3j sub_502B+DFj ...
		lea	ax, [bp+var_1C]
		push	ax
		mov	ax, si
		add	ax, 39h	; '9'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_51B0
		jmp	loc_5101
; ���������������������������������������������������������������������������

loc_51B0:				; CODE XREF: sub_502B+180j
		or	di, di
		jz	short loc_51C8
		push	0AFh ; '�'
		push	di
		push	2
		push	129Ch
		push	word ptr [si+2Dh]
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah

loc_51C8:				; CODE XREF: sub_502B+187j
		push	word_46F44
		call	sub_3F8CC
		add	sp, 2
		push	word_46F44
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		push	word_46F44
		call	sub_3F8DE
		add	sp, 2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5209
		push	si
		push	cs
		call	near ptr sub_4F0F
		add	sp, 2

loc_5209:				; CODE XREF: sub_502B+1D4j
		cmp	[bp+var_D], 0
		jz	short loc_525E
		cmp	word ptr [si+37h], 0
		jz	short loc_525E
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	ax, [bx+20h]
		dec	ax
		cmp	ax, [bp+var_10]
		jnz	short loc_5249
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	bx, [si+37h]
		mov	al, [bx+6]
		mov	[bp+var_1D], al
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	al, [bp+var_1D]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_525E
; ���������������������������������������������������������������������������

loc_5249:				; CODE XREF: sub_502B+1F7j
		inc	[bp+var_10]
		mov	ax, [bp+var_10]
		mov	[bp+var_20], ax
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	ax, [bp+var_20]
		mov	[bx+1Bh], ax

loc_525E:				; CODE XREF: sub_502B+1E2j
					; sub_502B+1E8j ...
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4

loc_526C:				; CODE XREF: sub_502B+67j
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_52A4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52A2
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_52A2:				; CODE XREF: sub_502B+263j
		jmp	short $+2

loc_52A4:				; CODE XREF: sub_502B+251j
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_52AD
		jmp	loc_5358
; ���������������������������������������������������������������������������

loc_52AD:				; CODE XREF: sub_502B+27Dj
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_52B9
		jmp	loc_5358
; ���������������������������������������������������������������������������

loc_52B9:				; CODE XREF: sub_502B+289j
		mov	al, byte ptr [bp+var_8]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_52CE
		cmp	ax, 3
		jnz	short loc_52CB
		jmp	loc_534A
; ���������������������������������������������������������������������������

loc_52CB:				; CODE XREF: sub_502B+29Bj
		jmp	loc_5358
; ���������������������������������������������������������������������������

loc_52CE:				; CODE XREF: sub_502B+296j
		push	si
		push	cs
		call	near ptr sub_4FB2
		add	sp, 2
		cmp	byte ptr [bp+var_8+1], 2
		jnz	short loc_52E1
		mov	ax, 1
		jmp	short loc_52E3
; ���������������������������������������������������������������������������

loc_52E1:				; CODE XREF: sub_502B+2AFj
		xor	ax, ax

loc_52E3:				; CODE XREF: sub_502B+2B4j
		mov	[si+30h], al
		cmp	word ptr [si+37h], 0
		jz	short loc_534A
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	al, [bx+2Dh]
		mov	[bp+var_11], al
		mov	bx, [si+37h]
		cmp	word ptr [bx+4], 0
		jz	short loc_5327
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		cmp	byte ptr [bx+1Eh], 0
		jz	short loc_5327
		mov	[bp+var_D], 1
		cmp	[bp+var_11], 0FFh
		jz	short loc_5325
		mov	al, [bp+var_11]
		mov	ah, 0
		push	ax
		call	Music_SetGameflowMood_28C73
		add	sp, 2

loc_5325:				; CODE XREF: sub_502B+2EAj
		jmp	short loc_534A
; ���������������������������������������������������������������������������

loc_5327:				; CODE XREF: sub_502B+2D4j
					; sub_502B+2E0j
		call	TextScrollDisplayB_ApplyHelperD_3F784
		cmp	[bp+var_11], 0FFh
		jz	short loc_5340
		mov	al, [bp+var_11]
		mov	ah, 0
		push	ax
		call	Music_SetGameflowMood_28C73
		add	sp, 2

loc_5340:				; CODE XREF: sub_502B+305j
		mov	bx, [si+37h]
		mov	al, [bx+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_534A:				; CODE XREF: sub_502B+29Dj
					; sub_502B+2BFj ...
		push	si
		push	cs
		call	near ptr sub_4FB2
		add	sp, 2
		or	al, al
		jz	short loc_5358
		jmp	short $+2

loc_5358:				; CODE XREF: sub_502B+27Fj
					; sub_502B+28Bj ...
		cmp	byte ptr [bp+var_C], 0
		jz	short loc_5386
		cmp	byte ptr [bp+var_C], 2
		jnz	short loc_5386
		cmp	byte ptr [bp+var_C+1], 1
		jnz	short loc_5386
		cmp	byte ptr [si+32h], 0FFh
		jz	short loc_5386
		call	TextScrollDisplayB_ApplyHelperD_3F784
		call	Input_Flush_CDDC
		call	Keyboard_DrainBufferBIOS_3FA5E
		mov	al, [si+32h]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_5386:				; CODE XREF: sub_502B+331j
					; sub_502B+337j ...
		jmp	loc_5073
sub_502B	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_538D:				; CODE XREF: seg004:0AE6j
					; DATA XREF: dseg:12A3o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_53EB
		mov	word ptr [si+18h], 12A3h
		mov	word ptr [si+10h], 12B7h
		cmp	word ptr [si+14h], 0
		jz	short loc_53D1
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2
		cmp	word ptr [si+14h], 0
		jz	short loc_53D1
		push	3
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_53D1:				; CODE XREF: seg004:09FAj seg004:0A0Ej
		push	word ptr [si+1Ah]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		test	di, 1
		jz	short loc_53EB
		push	si
		call	sub_308
		add	sp, 2

loc_53EB:				; CODE XREF: seg004:09EAj seg004:0A30j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_53EF:				; CODE XREF: seg004:0AC2j
					; DATA XREF: dseg:12A7o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+1Ah]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_53FF:				; CODE XREF: seg004:0AB6j
					; DATA XREF: dseg:12ABo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+1Ah], ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_540F:				; CODE XREF: seg004:0ADAj
					; DATA XREF: dseg:12AFo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	si
		call	sub_CC36
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_5428:				; CODE XREF: seg004:0ACEj
					; DATA XREF: dseg:12B3o
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-8],	ax
		mov	ax, [bp-4]
		mov	[bp-6],	ax
		lea	ax, [bp-8]
		push	ax
		push	si
		call	sub_CC36
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_545D:				; DATA XREF: dseg:12C7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	loc_53FF
; ���������������������������������������������������������������������������

loc_5469:				; DATA XREF: dseg:12C3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	loc_53EF
; ���������������������������������������������������������������������������

loc_5475:				; DATA XREF: dseg:12BFo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	loc_5428
; ���������������������������������������������������������������������������

loc_5481:				; DATA XREF: dseg:12BBo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	loc_540F
; ���������������������������������������������������������������������������

loc_548D:				; DATA XREF: dseg:12B7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	loc_538D
; ���������������������������������������������������������������������������

loc_5499:				; DATA XREF: dseg:12CBo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_54BB
		mov	word ptr [si], 12CBh
		test	di, 1
		jz	short loc_54BB
		push	si
		call	sub_308
		add	sp, 2

loc_54BB:				; CODE XREF: seg004:0AF6j seg004:0B00j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_54BF:				; DATA XREF: dseg:12DFo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_54EC
		mov	word ptr [si], 12DFh
		push	word ptr [si+4]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		test	di, 1
		jz	short loc_54EC
		push	si
		call	sub_308
		add	sp, 2

loc_54EC:				; CODE XREF: seg004:0B1Cj seg004:0B31j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_54F0:				; CODE XREF: seg004:0C88j
					; DATA XREF: dseg:12E3o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_5551
		mov	word ptr [si], 12E3h
		mov	word ptr [si+0Eh], 12F7h
		cmp	word ptr [si+12h], 0
		jz	short loc_5533
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2
		cmp	word ptr [si+12h], 0
		jz	short loc_5533
		push	3
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5533:				; CODE XREF: seg004:0B5Cj seg004:0B70j
		mov	word ptr [si], 12DFh
		push	word ptr [si+4]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		test	di, 1
		jz	short loc_5551
		push	si
		call	sub_308
		add	sp, 2

loc_5551:				; CODE XREF: seg004:0B4Dj seg004:0B96j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_5555:				; CODE XREF: seg004:0C7Cj
					; DATA XREF: dseg:12E7o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	cx, [di]
		mov	ax, [di+2]
		mov	[bp-2],	ax
		cmp	[si+0Ah], cx
		jl	short loc_5575
		cmp	[si+6],	cx
		jle	short loc_5579

loc_5575:				; CODE XREF: seg004:0BBEj
		mov	dl, 0
		jmp	short loc_557B
; ���������������������������������������������������������������������������

loc_5579:				; CODE XREF: seg004:0BC3j
		mov	dl, 1

loc_557B:				; CODE XREF: seg004:0BC7j
		or	dl, dl
		jz	short loc_5597
		mov	ax, [si+0Ch]
		cmp	ax, [bp-2]
		jle	short loc_5593
		mov	ax, [si+8]
		cmp	ax, [bp-2]
		jge	short loc_5593
		mov	dl, 1
		jmp	short loc_5595
; ���������������������������������������������������������������������������

loc_5593:				; CODE XREF: seg004:0BD5j seg004:0BDDj
		mov	dl, 0

loc_5595:				; CODE XREF: seg004:0BE1j
		jmp	short $+2

loc_5597:				; CODE XREF: seg004:0BCDj
		mov	al, dl
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_55A1:				; CODE XREF: seg004:0C70j
					; DATA XREF: dseg:12EBo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	cx, [bp+8]
		mov	di, [bp+0Ah]
		cmp	[si+0Ah], cx
		jl	short loc_55B9
		cmp	[si+6],	cx
		jle	short loc_55BD

loc_55B9:				; CODE XREF: seg004:0C02j
		mov	dl, 0
		jmp	short loc_55BF
; ���������������������������������������������������������������������������

loc_55BD:				; CODE XREF: seg004:0C07j
		mov	dl, 1

loc_55BF:				; CODE XREF: seg004:0C0Bj
		or	dl, dl
		jz	short loc_55D5
		cmp	[si+0Ch], di
		jle	short loc_55D1
		cmp	[si+8],	di
		jge	short loc_55D1
		mov	dl, 1
		jmp	short loc_55D3
; ���������������������������������������������������������������������������

loc_55D1:				; CODE XREF: seg004:0C16j seg004:0C1Bj
		mov	dl, 0

loc_55D3:				; CODE XREF: seg004:0C1Fj
		jmp	short $+2

loc_55D5:				; CODE XREF: seg004:0C11j
		mov	al, dl
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_55DF:				; CODE XREF: seg004:0C64j
					; DATA XREF: dseg:12EFo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+4]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_55EF:				; CODE XREF: seg004:0C58j
					; DATA XREF: dseg:12F3o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+4],	ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_55FF:				; DATA XREF: dseg:1307o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	loc_55EF
; ���������������������������������������������������������������������������

loc_560B:				; DATA XREF: dseg:1303o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	loc_55DF
; ���������������������������������������������������������������������������

loc_5617:				; DATA XREF: dseg:12FFo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	loc_55A1
; ���������������������������������������������������������������������������

loc_5623:				; DATA XREF: dseg:12FBo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	loc_5555
; ���������������������������������������������������������������������������

loc_562F:				; DATA XREF: dseg:12F7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	loc_54F0
seg004		ends
