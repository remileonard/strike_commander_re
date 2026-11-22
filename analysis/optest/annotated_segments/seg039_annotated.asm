seg039		segment	byte public 'CODE' use16
		assume cs:seg039
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_1A4CB:				; DATA XREF: dseg:2FE6o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A4D4	proc far		; CODE XREF: seg039:0AF8p

var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 22h
		mov	[bp+var_8], 0B33Ah
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, dword_49092
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		mov	[bp+var_1E], 8
		jmp	short loc_1A592
; ���������������������������������������������������������������������������

loc_1A53C:				; CODE XREF: sub_1A4D4+C1j
		mov	ax, [bp+var_1E]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		cmp	dword ptr es:[bx+64h], 0
		jz	short loc_1A592
		mov	ax, [bp+var_1E]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+64h]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_1A576
		mov	ax, 1
		jmp	short loc_1A578
; ���������������������������������������������������������������������������

loc_1A576:				; CODE XREF: sub_1A4D4+9Bj
		xor	ax, ax

loc_1A578:				; CODE XREF: sub_1A4D4+A0j
		or	al, al
		jz	short loc_1A583
		mov	al, byte ptr [bp+var_1E]
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_1A592
; ���������������������������������������������������������������������������

loc_1A583:				; CODE XREF: sub_1A4D4+A6j
		mov	al, byte_4600A
		mov	ah, 0
		cmp	ax, [bp+var_1E]
		jl	short loc_1A592
		mov	al, byte ptr [bp+var_1E]
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A592:				; CODE XREF: sub_1A4D4+66j
					; sub_1A4D4+79j ...
		dec	[bp+var_1E]
		jg	short loc_1A53C
		mov	al, 0
		leave
		retf
sub_1A4D4	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A59D	proc far		; CODE XREF: seg039:0E10p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+98h]
		cmp	ax, word_4646C
		jz	short loc_1A612
		les	bx, [bp+arg_0]
		mov	ax, word_4646C
		mov	es:[bx+98h], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+92h]
		sub	eax, dword_4645E
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jg	short loc_1A5FD
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_22454
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8Eh]
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], eax
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A5FD:				; CODE XREF: sub_1A59D+36j
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], eax

loc_1A612:				; CODE XREF: sub_1A59D+12j
		mov	al, 0
		leave
		retf
sub_1A59D	endp

; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A618:				; DATA XREF: dseg:37BEo
		push	bp
		mov	bp, sp
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		add	ax, 2Dh	; '-'
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A628:				; DATA XREF: dseg:37B2o
		push	bp
		mov	bp, sp
		mov	al, [bp+0Ah]
		and	ax, 1
		les	bx, [bp+6]
		and	byte ptr es:[bx+9Fh], 0FEh
		or	es:[bx+9Fh], al
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A641:				; DATA XREF: dseg:37B6o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	al, es:[bx+9Fh]
		and	ax, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A653:				; DATA XREF: dseg:37BAo
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	al, es:[bx+9Fh]
		shr	ax, 1
		and	ax, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A667	proc far		; CODE XREF: seg039:01EAp
					; sub_C658C+13EP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		add	ax, 12h
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_255FD
		add	sp, 8
		pop	bp
		retf
sub_1A667	endp

; ���������������������������������������������������������������������������

loc_1A6A0:				; DATA XREF: dseg:37CEo
		push	bp
		mov	bp, sp
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_1A667
		add	sp, 4
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		nop
		push	cs
		call	near ptr sub_1A6CE
		add	sp, 4
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		nop
		push	cs
		call	near ptr sub_1A778
		add	sp, 4
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A6CE	proc far		; CODE XREF: seg039:01F8p
					; sub_C658C+8BCP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
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
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		xor	si, si
		jmp	short loc_1A70C
; ���������������������������������������������������������������������������

loc_1A6FF:				; CODE XREF: sub_1A6CE+45j
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+11h], 0FEh
		inc	si
		add	word ptr [bp+var_4], 12h

loc_1A70C:				; CODE XREF: sub_1A6CE+2Fj
		les	bx, [bp+arg_0]
		cmp	es:[bx+9], si
		jg	short loc_1A6FF
		pop	si
		leave
		retf
sub_1A6CE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A718	proc far		; CODE XREF: seg039:0DDBp
					; sub_C658C+8AEP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
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
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		xor	si, si
		jmp	short loc_1A76C
; ���������������������������������������������������������������������������

loc_1A74F:				; CODE XREF: sub_1A718+5Bj
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+11h], 0FDh
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+11h], 0FBh
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+11h], 0F7h
		inc	si
		add	word ptr [bp+var_4], 12h

loc_1A76C:				; CODE XREF: sub_1A718+35j
		les	bx, [bp+arg_0]
		cmp	es:[bx+9], si
		jg	short loc_1A74F
		pop	si
		leave
		retf
sub_1A718	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A778	proc far		; CODE XREF: seg039:0206p
					; sub_C658C+8CAP

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+2Ah]
		mov	dx, es:[bx+28h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
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
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		xor	si, si
		jmp	short loc_1A7EA
; ���������������������������������������������������������������������������

loc_1A7BE:				; CODE XREF: sub_1A778+79j
		les	bx, [bp+var_4]
		mov	ax, word ptr [bp+var_8]
		add	ax, es:[bx]
		push	word ptr [bp+var_8+2]
		push	ax
		les	bx, [bp+var_4]
		push	es
		les	ax, [bp+var_8]
		mov	dx, es
		pop	es
		add	ax, es:[bx]
		mov	bx, ax
		mov	es, dx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		inc	si
		add	word ptr [bp+var_4], 2

loc_1A7EA:				; CODE XREF: sub_1A778+44j
		les	bx, [bp+arg_0]
		cmp	es:[bx+15h], si
		jg	short loc_1A7BE
		pop	si
		leave
		retf
sub_1A778	endp

; ���������������������������������������������������������������������������

loc_1A7F6:				; DATA XREF: dseg:37AEo
		push	bp
		mov	bp, sp
		sub	sp, 14Eh
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	bx, word_49457
		mov	ax, [bx+4]
		inc	ax
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		mov	eax, [bx]
		mov	[bp-0D6h], eax
		mov	bx, [bp-2]
		mov	eax, [bx+4]
		mov	[bp-0D2h], eax
		mov	bx, [bp-2]
		mov	eax, [bx+8]
		mov	[bp-0CEh], eax
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+2], 0
		jnz	short loc_1A846
		push	600Ch
		call	sub_30D3
		add	sp, 2

loc_1A846:				; CODE XREF: seg039:0379j
		les	bx, [bp+6]
		mov	al, es:[bx+9Fh]
		and	ax, 1
		or	al, al
		jnz	short loc_1A858
		jmp	loc_1B2AB
; ���������������������������������������������������������������������������

loc_1A858:				; CODE XREF: seg039:0393j
		les	bx, [bp+6]
		and	byte ptr es:[bx+9Fh], 0FDh
		lea	ax, [bp-11Eh]
		push	ax
		call	sub_25718
		add	sp, 2
		mov	dword ptr [bp-0Ch], 0
		les	bx, [bp+6]
		mov	byte ptr es:[bx+8], 0
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		cmp	word ptr [bx+26h], 0
		jz	short loc_1A890
		mov	ax, 1
		jmp	short loc_1A892
; ���������������������������������������������������������������������������

loc_1A890:				; CODE XREF: seg039:03C9j
		xor	ax, ax

loc_1A892:				; CODE XREF: seg039:03CEj
		mov	[bp-7],	al
		cmp	byte ptr [bp-7], 0
		jz	short loc_1A8F6
		les	bx, [bp+6]
		push	word ptr es:[bx+6]
		call	sub_21381
		add	sp, 2
		mov	[bp-0Eh], ax
		mov	bx, [bp-0Eh]
		mov	eax, [bx]
		mov	[bp-0FAh], eax
		mov	bx, [bp-0Eh]
		mov	eax, [bx+4]
		mov	[bp-0F6h], eax
		mov	bx, [bp-0Eh]
		mov	eax, [bx+8]
		mov	[bp-0F2h], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+6]
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		lea	ax, [bp-11Eh]
		push	ax
		call	sub_2581F
		add	sp, 4
		jmp	short loc_1A94A
; ���������������������������������������������������������������������������

loc_1A8F6:				; CODE XREF: seg039:03D9j
		les	bx, [bp+6]
		mov	ax, es:[bx+6]
		add	ax, 12h
		mov	[bp-10h], ax
		mov	bx, [bp-10h]
		mov	eax, [bx]
		mov	[bp-0FAh], eax
		mov	bx, [bp-10h]
		mov	eax, [bx+4]
		mov	[bp-0F6h], eax
		mov	bx, [bp-10h]
		mov	eax, [bx+8]
		mov	[bp-0F2h], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+6]
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		lea	ax, [bp-11Eh]
		push	ax
		call	sub_2581F
		add	sp, 4

loc_1A94A:				; CODE XREF: seg039:0434j
		cmp	byte ptr [bp-7], 0
		jnz	short loc_1A953
		jmp	loc_1A9D8
; ���������������������������������������������������������������������������

loc_1A953:				; CODE XREF: seg039:048Ej
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		cmp	dword ptr [bx+1Ah], 0
		jge	short loc_1A9D8
		mov	eax, [bp-0FAh]
		sub	eax, [si+14h]
		mov	[bp-12Ah], eax
		mov	eax, [bp-0F6h]
		sub	eax, [si+18h]
		mov	[bp-126h], eax
		mov	eax, [bp-0F2h]
		sub	eax, [si+1Ch]
		mov	[bp-122h], eax
		lea	ax, [bp-12Ah]
		push	ax
		lea	ax, [bp-106h]
		push	ax
		push	ss
		lea	ax, [bp-30h]
		push	ax
		call	Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-30h]
		mov	[bp-2Ch], eax
		mov	dword ptr [bp-34h], 0
		cmp	dword ptr [bp-2Ch], 0
		jge	short loc_1A9C1
		mov	dword ptr [bp-34h], 400h

loc_1A9C1:				; CODE XREF: seg039:04F7j
		cmp	dword ptr [bp-2Ch], 0
		jle	short loc_1A9D0
		mov	dword ptr [bp-34h], 0FFFFFC00h

loc_1A9D0:				; CODE XREF: seg039:0506j
		mov	eax, [bp-34h]
		add	[bp-0Ch], eax

loc_1A9D8:				; CODE XREF: seg039:0490j seg039:049Fj
		mov	eax, [bp-0FAh]
		sub	eax, [si+14h]
		mov	[bp-0E2h], eax
		mov	[bp-0EEh], eax
		mov	eax, [bp-0F6h]
		sub	eax, [si+18h]
		mov	[bp-0DEh], eax
		mov	[bp-0EAh], eax
		mov	eax, [bp-0F2h]
		sub	eax, [si+1Ch]
		mov	[bp-0DAh], eax
		mov	[bp-0E6h], eax
		push	6086h
		lea	ax, [bp-0EEh]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		mov	eax, [bp-0EAh]
		mov	[bp-6],	eax
		les	bx, [bp+6]
		mov	ax, es:[bx+6]
		add	ax, 20h	; ' '
		mov	[bp-16h], ax
		mov	bx, [bp-16h]
		mov	eax, [bx]
		mov	[bp-14h], eax
		push	large dword ptr	[bp-0E6h]
		push	large dword ptr	[bp-0EAh]
		push	large dword ptr	[bp-0EEh]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-1Eh], eax
		mov	eax, [bp-1Eh]
		mov	[bp-1Ah], eax
		mov	eax, [bp-1Ah]
		cmp	eax, [bp-14h]
		jge	short loc_1AA95
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		mov	al, es:[bx+84h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1AA8D
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1AA8D:				; CODE XREF: seg039:05C7j
		mov	byte_46014, 0
		jmp	loc_1AFA2
; ���������������������������������������������������������������������������

loc_1AA95:				; CODE XREF: seg039:05B5j
		mov	eax, dword_49366
		mov	[bp-30h], eax
		mov	eax, [bp-30h]
		shl	eax, 8
		mov	[bp-34h], eax
		mov	eax, [bp-34h]
		mov	[bp-2Ch], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+6]
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp-36h], dx
		mov	[bp-38h], ax
		cmp	dword ptr [bp-38h], 0
		jnz	short loc_1AAD6
		jmp	loc_1AB6D
; ���������������������������������������������������������������������������

loc_1AAD6:				; CODE XREF: seg039:0611j
		les	bx, [bp-38h]
		cmp	byte ptr es:[bx+11h], 1
		jz	short loc_1AAE3
		jmp	loc_1AB6D
; ���������������������������������������������������������������������������

loc_1AAE3:				; CODE XREF: seg039:061Ej
		mov	eax, [bp-2Ch]
		shl	eax, 1
		mov	[bp-2Ch], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+6]
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		add	sp, 2
		cmp	al, 6
		jnz	short loc_1AB6D
		les	bx, [bp+6]
		push	word ptr es:[bx+6]
		push	ss
		lea	ax, [bp-12Ah]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large dword ptr	[bp-122h]
		push	large dword ptr	[bp-126h]
		push	large dword ptr	[bp-12Ah]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-3Ch], eax
		mov	eax, [bp-3Ch]
		mov	[bp-40h], eax
		cmp	dword ptr [bp-40h], 0
		jnz	short loc_1AB5C
		mov	ax, 1
		jmp	short loc_1AB5E
; ���������������������������������������������������������������������������

loc_1AB5C:				; CODE XREF: seg039:0695j
		xor	ax, ax

loc_1AB5E:				; CODE XREF: seg039:069Aj
		or	al, al
		jz	short loc_1AB6D
		mov	eax, [bp-2Ch]
		sar	eax, 1
		mov	[bp-2Ch], eax

loc_1AB6D:				; CODE XREF: seg039:0613j seg039:0620j ...
		mov	eax, [bp-2Ch]
		add	eax, [bp-14h]
		mov	[bp-44h], eax
		mov	eax, [bp-44h]
		mov	[bp-48h], eax
		mov	eax, [bp-6]
		cmp	eax, [bp-48h]
		jle	short loc_1AB90
		mov	ax, 1
		jmp	short loc_1AB92
; ���������������������������������������������������������������������������

loc_1AB90:				; CODE XREF: seg039:06C9j
		xor	ax, ax

loc_1AB92:				; CODE XREF: seg039:06CEj
		or	al, al
		jnz	short loc_1ABBF
		mov	eax, dword_46254
		sub	eax, [bp-14h]
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]
		mov	[bp-50h], eax
		mov	eax, [bp-6]
		cmp	eax, [bp-50h]
		jge	short loc_1ABB9
		mov	ax, 1
		jmp	short loc_1ABBB
; ���������������������������������������������������������������������������

loc_1ABB9:				; CODE XREF: seg039:06F2j
		xor	ax, ax

loc_1ABBB:				; CODE XREF: seg039:06F7j
		or	al, al
		jz	short loc_1ABCC

loc_1ABBF:				; CODE XREF: seg039:06D4j
		les	bx, [bp+6]
		or	byte ptr es:[bx+9Fh], 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1ABCC:				; CODE XREF: seg039:06FDj
		mov	eax, [bp-14h]
		mov	[bp-54h], eax
		mov	ax, si
		add	ax, 66h	; 'f'
		mov	di, ax
		mov	eax, [bp-54h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-54h], eax
		mov	ax, si
		add	ax, 6Eh	; 'n'
		mov	[bp-56h], ax
		mov	eax, [bp-6]
		mov	bx, [bp-56h]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Ah], eax
		mov	eax, [bp-5Ah]
		mov	[bp-5Eh], eax
		mov	eax, [bp-5Eh]
		add	[bp-54h], eax
		mov	eax, [bp-0E6h]
		or	eax, eax
		jge	short loc_1AC29
		neg	eax

loc_1AC29:				; CODE XREF: seg039:0764j
		mov	[bp-62h], eax
		mov	eax, [bp-62h]
		mov	[bp-66h], eax
		mov	eax, [bp-66h]
		cmp	eax, [bp-54h]
		jle	short loc_1AC44
		mov	ax, 1
		jmp	short loc_1AC46
; ���������������������������������������������������������������������������

loc_1AC44:				; CODE XREF: seg039:077Dj
		xor	ax, ax

loc_1AC46:				; CODE XREF: seg039:0782j
		or	al, al
		jz	short loc_1AC5A
		les	bx, [bp+6]
		or	byte ptr es:[bx+9Fh], 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_1ACF3
; ���������������������������������������������������������������������������

loc_1AC5A:				; CODE XREF: seg039:0788j
		mov	eax, [bp-14h]
		mov	[bp-7Eh], eax
		mov	ax, si
		add	ax, 6Ah	; 'j'
		mov	[bp-80h], ax
		mov	eax, [bp-7Eh]
		mov	bx, [bp-80h]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-7Eh], eax
		mov	ax, si
		add	ax, 72h	; 'r'
		mov	[bp-82h], ax
		mov	eax, [bp-6]
		mov	bx, [bp-82h]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-86h], eax
		mov	eax, [bp-86h]
		mov	[bp-8Ah], eax
		mov	eax, [bp-8Ah]
		add	[bp-7Eh], eax
		mov	eax, [bp-0EEh]
		or	eax, eax
		jge	short loc_1ACC1
		neg	eax

loc_1ACC1:				; CODE XREF: seg039:07FCj
		mov	[bp-8Eh], eax
		mov	eax, [bp-8Eh]
		mov	[bp-92h], eax
		mov	eax, [bp-92h]
		cmp	eax, [bp-7Eh]
		jle	short loc_1ACE0
		mov	ax, 1
		jmp	short loc_1ACE2
; ���������������������������������������������������������������������������

loc_1ACE0:				; CODE XREF: seg039:0819j
		xor	ax, ax

loc_1ACE2:				; CODE XREF: seg039:081Ej
		or	al, al
		jz	short loc_1ACF3
		les	bx, [bp+6]
		or	byte ptr es:[bx+9Fh], 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1ACF3:				; CODE XREF: seg039:0797j seg039:0824j
		mov	eax, [bp-6]
		cmp	eax, [bp-14h]
		jg	short loc_1AD00
		jmp	loc_1AF38
; ���������������������������������������������������������������������������

loc_1AD00:				; CODE XREF: seg039:083Bj
		push	large dword ptr	[bp-6]
		push	large [dword_49092]
		push	large dword ptr	[bp-14h]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-82h], eax
		mov	eax, [bp-82h]
		mov	[bp-86h], eax
		mov	eax, [bp-86h]
		mov	[bp-7Eh], eax
		cmp	dword ptr [bp-7Eh], 19h
		jg	short loc_1AD4D
		les	bx, [bp+6]
		or	byte ptr es:[bx+9Fh], 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_1AF38
; ���������������������������������������������������������������������������

loc_1AD4D:				; CODE XREF: seg039:087Bj
		cmp	dword ptr [bp-7Eh], 133h
		jle	short loc_1AD5A
		jmp	loc_1AF38
; ���������������������������������������������������������������������������

loc_1AD5A:				; CODE XREF: seg039:0895j
		cmp	byte ptr [bp-7], 0
		jz	short loc_1AD64
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1AD64:				; CODE XREF: seg039:089Ej
		mov	eax, [bp-6]
		mov	[bp-8Ah], eax
		mov	eax, [bp-8Ah]
		les	bx, [bp+6]
		mov	es:[bx+23h], eax
		mov	eax, [bp-0EEh]
		mov	[bp-8Eh], eax
		mov	eax, [bp-6]
		mov	[bp-92h], eax
		mov	ax, word_4908E
		mov	[bp-94h], ax
		push	large dword ptr	[bp-92h]
		push	large [dword_49092]
		push	large dword ptr	[bp-8Eh]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-98h], eax
		mov	eax, [bp-98h]
		mov	[bp-9Ch], eax
		movsx	eax, word ptr [bp-94h]
		shl	eax, 8
		mov	edx, [bp-9Ch]
		add	edx, eax
		mov	[bp-0A0h], edx
		mov	eax, [bp-0A0h]
		mov	[bp-0A4h], eax
		mov	eax, [bp-0A4h]
		sar	eax, 8
		mov	[bp-0A8h], eax
		cmp	dword ptr [bp-0A8h], 7D00h
		jle	short loc_1AE08
		mov	dword ptr [bp-0A8h], 7D00h
		jmp	short loc_1AE1E
; ���������������������������������������������������������������������������

loc_1AE08:				; CODE XREF: seg039:093Bj
		cmp	dword ptr [bp-0A8h], 0FFFF8300h
		jge	short loc_1AE1E
		mov	dword ptr [bp-0A8h], 0FFFF8300h
		jmp	short $+2

loc_1AE1E:				; CODE XREF: seg039:0946j seg039:0951j
		mov	ax, [bp-0A8h]
		les	bx, [bp+6]
		mov	es:[bx+28h], ax
		mov	eax, [bp-0E6h]
		mov	[bp-0ACh], eax
		mov	eax, [bp-6]
		mov	[bp-0B0h], eax
		mov	ax, word_49090
		mov	[bp-0B2h], ax
		push	large dword ptr	[bp-0B0h]
		push	large [dword_49096]
		push	large dword ptr	[bp-0ACh]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0B6h], eax
		mov	eax, [bp-0B6h]
		mov	[bp-0BAh], eax
		movsx	eax, word ptr [bp-0B2h]
		shl	eax, 8
		sub	eax, [bp-0BAh]
		mov	[bp-0BEh], eax
		mov	eax, [bp-0BEh]
		mov	[bp-0C2h], eax
		mov	eax, [bp-0C2h]
		sar	eax, 8
		mov	[bp-0C6h], eax
		cmp	dword ptr [bp-0C6h], 7D00h
		jle	short loc_1AEB4
		mov	dword ptr [bp-0C6h], 7D00h
		jmp	short loc_1AECA
; ���������������������������������������������������������������������������

loc_1AEB4:				; CODE XREF: seg039:09E7j
		cmp	dword ptr [bp-0C6h], 0FFFF8300h
		jge	short loc_1AECA
		mov	dword ptr [bp-0C6h], 0FFFF8300h
		jmp	short $+2

loc_1AECA:				; CODE XREF: seg039:09F2j seg039:09FDj
		mov	ax, [bp-0C6h]
		les	bx, [bp+6]
		mov	es:[bx+2Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		mov	al, es:[bx+85h]
		les	bx, [bp+6]
		mov	es:[bx+27h], al
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 21h	; '!'
		mov	[bp-0C8h], ax
		mov	[bp-0CAh], dx
		mov	ax, word_492C8
		cmp	ax, word_492C6
		jge	short loc_1AF23
		mov	ax, word_492C8
		inc	word_492C8
		shl	ax, 2
		les	bx, dword_492CA
		add	bx, ax
		mov	ax, [bp-0C8h]
		mov	dx, [bp-0CAh]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short $+2

loc_1AF23:				; CODE XREF: seg039:0A40j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+8], 1
		les	bx, [bp+6]
		or	byte ptr es:[bx+9Fh], 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1AF38:				; CODE XREF: seg039:083Dj seg039:088Aj ...
		mov	eax, dword_49366
		mov	[bp-6Ah], eax
		mov	eax, [bp-6Ah]
		shl	eax, 8
		sub	eax, [bp-14h]
		mov	[bp-6Eh], eax
		mov	eax, [bp-6Eh]
		mov	[bp-72h], eax
		mov	eax, [bp-6]
		cmp	eax, [bp-72h]
		jge	short loc_1AF67
		mov	ax, 1
		jmp	short loc_1AF69
; ���������������������������������������������������������������������������

loc_1AF67:				; CODE XREF: seg039:0AA0j
		xor	ax, ax

loc_1AF69:				; CODE XREF: seg039:0AA5j
		or	al, al
		jz	short loc_1AF9D
		mov	eax, dword_46254
		add	eax, [bp-14h]
		mov	[bp-76h], eax
		mov	eax, [bp-76h]
		mov	[bp-7Ah], eax
		mov	eax, [bp-6]
		cmp	eax, [bp-7Ah]
		jle	short loc_1AF90
		mov	ax, 1
		jmp	short loc_1AF92
; ���������������������������������������������������������������������������

loc_1AF90:				; CODE XREF: seg039:0AC9j
		xor	ax, ax

loc_1AF92:				; CODE XREF: seg039:0ACEj
		or	al, al
		jz	short loc_1AF9D
		mov	byte_46014, 1
		jmp	short loc_1AFA2
; ���������������������������������������������������������������������������

loc_1AF9D:				; CODE XREF: seg039:0AABj seg039:0AD4j
		mov	byte_46014, 0

loc_1AFA2:				; CODE XREF: seg039:05D2j seg039:0ADBj
		mov	eax, [bp-6]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		push	word ptr es:[bx+4]
		push	word ptr es:[bx+2]
		push	cs
		call	near ptr sub_1A4D4
		add	sp, 8
		les	bx, [bp+6]
		mov	es:[bx+2Ch], al
		push	0
		les	bx, [bp+6]
		mov	al, es:[bx+1Bh]
		push	ax
		les	bx, [bp+6]
		push	word ptr es:[bx+19h]
		push	word ptr es:[bx+17h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp-20h], dx
		mov	[bp-22h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+2Ch]
		mov	ah, 0
		shl	ax, 2
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	[bp-24h], ax
		mov	[bp-26h], dx
		les	bx, [bp+6]
		mov	al, es:[bx+2Ch]
		mov	ah, 0
		shl	ax, 1
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+4Ch]
		mov	[bp-28h], ax
		cmp	dword ptr [bp-26h], 0
		jnz	short loc_1B033
		jmp	loc_1B2A9
; ���������������������������������������������������������������������������

loc_1B033:				; CODE XREF: seg039:0B6Ej
		lea	ax, [bp-14Eh]
		push	ax
		call	Damage_ComputeHelperA_24DD7
		add	sp, 2
		cmp	byte ptr [bp-7], 0
		jz	short loc_1B087
		mov	ax, [bp+6]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+8]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		push	word ptr [bx+0Ch]
		push	word ptr [bx+0Ah]
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp-14Eh]
		push	ax
		call	sub_24EBC
		add	sp, 0Ah
		jmp	short loc_1B0A1
; ���������������������������������������������������������������������������

loc_1B087:				; CODE XREF: seg039:0B84j
		lea	ax, [bp-0E2h]
		push	ax
		push	6086h
		lea	ax, [bp-11Eh]
		push	ax
		lea	ax, [bp-14Eh]
		push	ax
		call	sub_24E2B
		add	sp, 8

loc_1B0A1:				; CODE XREF: seg039:0BC5j
		mov	eax, [bp-14Eh]
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		les	bx, [bp+6]
		mov	es:[bx+2Dh], eax
		mov	eax, [bp-14Ah]
		mov	[bp-30h], eax
		mov	eax, [bp-30h]
		les	bx, [bp+6]
		mov	es:[bx+31h], eax
		mov	eax, [bp-146h]
		mov	[bp-34h], eax
		mov	eax, [bp-34h]
		les	bx, [bp+6]
		mov	es:[bx+35h], eax
		mov	eax, [bp-142h]
		mov	[bp-38h], eax
		mov	eax, [bp-38h]
		les	bx, [bp+6]
		mov	es:[bx+39h], eax
		mov	eax, [bp-13Eh]
		mov	[bp-3Ch], eax
		mov	eax, [bp-3Ch]
		les	bx, [bp+6]
		mov	es:[bx+3Dh], eax
		mov	eax, [bp-13Ah]
		mov	[bp-40h], eax
		mov	eax, [bp-40h]
		les	bx, [bp+6]
		mov	es:[bx+41h], eax
		mov	eax, [bp-136h]
		mov	[bp-44h], eax
		mov	eax, [bp-44h]
		les	bx, [bp+6]
		mov	es:[bx+45h], eax
		mov	eax, [bp-132h]
		mov	[bp-48h], eax
		mov	eax, [bp-48h]
		les	bx, [bp+6]
		mov	es:[bx+49h], eax
		mov	eax, [bp-12Eh]
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]
		les	bx, [bp+6]
		mov	es:[bx+4Dh], eax
		mov	eax, [bp-12Ah]
		mov	[bp-50h], eax
		mov	eax, [bp-50h]
		les	bx, [bp+6]
		mov	es:[bx+51h], eax
		mov	eax, [bp-126h]
		mov	[bp-54h], eax
		mov	eax, [bp-54h]
		les	bx, [bp+6]
		mov	es:[bx+55h], eax
		mov	eax, [bp-122h]
		mov	[bp-58h], eax
		mov	eax, [bp-58h]
		les	bx, [bp+6]
		mov	es:[bx+59h], eax
		lea	ax, [bp-11Eh]
		push	ax
		lea	ax, [bp-0E2h]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		push	0
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		lea	ax, [bp-11Eh]
		push	ax
		lea	ax, [bp-0D6h]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		lea	ax, [bp-0D6h]
		push	ax
		call	Vector_Normalize3D_241B4
		add	sp, 2
		xor	di, di
		jmp	loc_1B28C
; ���������������������������������������������������������������������������

loc_1B1FB:				; CODE XREF: seg039:0DD1j
		les	bx, [bp-26h]
		mov	ax, [bp-20h]
		mov	dx, [bp-22h]
		add	dx, es:[bx]
		mov	[bp-5Ah], ax
		mov	[bp-5Ch], dx
		cmp	dword ptr [bp-5Ch], 0
		jz	short loc_1B287
		lea	ax, [bp-0E2h]
		push	ax
		lea	ax, [bp-14Eh]
		push	ax
		push	word ptr [bp-5Ah]
		push	word ptr [bp-5Ch]
		les	bx, [bp-5Ch]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 8
		or	al, al
		jz	short loc_1B287
		lea	ax, [bp-0D6h]
		push	ax
		push	word ptr [bp-5Ah]
		push	word ptr [bp-5Ch]
		les	bx, [bp-5Ch]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 6
		les	bx, [bp-5Ch]
		mov	eax, [bp-0Ch]
		add	es:[bx+2], eax
		mov	eax, [bp-5Ch]
		mov	[bp-60h], eax
		mov	ax, word_492C8
		cmp	ax, word_492C6
		jge	short loc_1B287
		mov	ax, word_492C8
		inc	word_492C8
		shl	ax, 2
		les	bx, dword_492CA
		add	bx, ax
		mov	ax, [bp-5Eh]
		mov	dx, [bp-60h]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short $+2

loc_1B287:				; CODE XREF: seg039:0D52j seg039:0D72j ...
		inc	di
		add	word ptr [bp-26h], 2

loc_1B28C:				; CODE XREF: seg039:0D38j
		cmp	di, [bp-28h]
		jge	short loc_1B294
		jmp	loc_1B1FB
; ���������������������������������������������������������������������������

loc_1B294:				; CODE XREF: seg039:0DCFj
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_1A718
		add	sp, 4
		les	bx, [bp+6]
		mov	byte ptr es:[bx+8], 1

loc_1B2A9:				; CODE XREF: seg039:0B70j
		jmp	short loc_1B2B4
; ���������������������������������������������������������������������������

loc_1B2AB:				; CODE XREF: seg039:0395j
		les	bx, [bp+6]
		or	byte ptr es:[bx+9Fh], 2

loc_1B2B4:				; CODE XREF: seg039:loc_1B2A9j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1B2B8:				; DATA XREF: dseg:37D2o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B2C1:				; DATA XREF: dseg:37C6o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		push	word ptr es:[bx+4]
		push	word ptr es:[bx+2]
		push	cs
		call	near ptr sub_1A59D
		add	sp, 4
		or	al, al
		jz	short loc_1B308
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		cmp	word ptr es:[bx+96h], 0
		jz	short loc_1B308
		les	bx, [bp+6]
		inc	word ptr es:[bx+9Dh]
		mov	ax, es:[bx+9Dh]
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		cmp	ax, es:[bx+96h]
		jl	short loc_1B308
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B308:				; CODE XREF: seg039:0E18j seg039:0E27j ...
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B30E:				; DATA XREF: dseg:2FE2o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	0
		push	0
		call	sub_42E35
		add	sp, 0Ah
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf
seg039		ends
