ovr231		segment	para public 'OVERLAY' use16
		assume cs:ovr231
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C5780	proc far		; CODE XREF: sub_42C80J

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
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
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C57D7
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2], ax
		cmp	dword ptr [si+72h], 2
		jle	short loc_C57C9
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_4], ax

loc_C57C9:				; CODE XREF: sub_C5780+3Bj
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_C57E2
; ���������������������������������������������������������������������������

loc_C57D7:				; CODE XREF: sub_C5780+28j
		push	6006h
		call	sub_30D3
		add	sp, 2

loc_C57E2:				; CODE XREF: sub_C5780+55j
		push	[bp+var_4]
		push	[bp+var_2]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42AC2
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	di, es:[bx+8Ah]
		mov	[bp+var_6], 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8Ch]
		mov	[bp+var_8], ax
		mov	[bp+var_A], 0
		jmp	loc_C591B
; ���������������������������������������������������������������������������

loc_C581A:				; CODE XREF: sub_C5780+1C4j
		push	si
		call	ResourceRecord_ComputeAlignedBounds_3C431
		add	sp, 2
		cmp	dword ptr [si+6Dh], 504D5854h
		jnz	short loc_C5832
		mov	ax, 1
		jmp	short loc_C5834
; ���������������������������������������������������������������������������

loc_C5832:				; CODE XREF: sub_C5780+ABj
		xor	ax, ax

loc_C5834:				; CODE XREF: sub_C5780+B0j
		or	ax, ax
		jz	short loc_C58B1
		push	large 0Ch
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+86h]
		cmp	ax, [bp+var_6]
		ja	short loc_C5861
		push	6007h
		call	sub_30D3
		add	sp, 2

loc_C5861:				; CODE XREF: sub_C5780+D4j
		mov	ax, [bp+var_12]
		imul	[bp+var_10]
		movzx	eax, ax
		mov	[bp+var_E], eax
		push	2
		push	[bp+var_10]
		push	[bp+var_12]
		lea	ax, [bp+var_1A]
		push	ax
		push	di
		call	sub_42A9A
		add	sp, 0Ah
		push	large [bp+var_E]
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		add	di, 6
		inc	[bp+var_6]
		jmp	short loc_C590F
; ���������������������������������������������������������������������������

loc_C58B1:				; CODE XREF: sub_C5780+B6j
		cmp	dword ptr [si+6Dh], 414D5854h
		jnz	short loc_C58C0
		mov	ax, 1
		jmp	short loc_C58C2
; ���������������������������������������������������������������������������

loc_C58C0:				; CODE XREF: sub_C5780+139j
		xor	ax, ax

loc_C58C2:				; CODE XREF: sub_C5780+13Ej
		or	ax, ax
		jz	short loc_C590F
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+88h]
		cmp	ax, [bp+var_A]
		ja	short loc_C58EF
		push	6008h
		call	sub_30D3
		add	sp, 2

loc_C58EF:				; CODE XREF: sub_C5780+162j
		push	[bp+var_10]
		push	[bp+var_12]
		push	[bp+var_14]
		lea	ax, [bp+var_1C]
		push	ax
		push	si
		push	[bp+var_8]
		call	sub_42AB3
		add	sp, 0Ch
		add	[bp+var_8], 0Ch
		inc	[bp+var_A]

loc_C590F:				; CODE XREF: sub_C5780+12Fj
					; sub_C5780+144j
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_C591B:				; CODE XREF: sub_C5780+97j
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_C592C
		push	si
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_C5940
; ���������������������������������������������������������������������������

loc_C592C:				; CODE XREF: sub_C5780+19Fj
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_C593E
		mov	ax, 1
		jmp	short loc_C5940
; ���������������������������������������������������������������������������

loc_C593E:				; CODE XREF: sub_C5780+1B7j
		xor	ax, ax

loc_C5940:				; CODE XREF: sub_C5780+1AAj
					; sub_C5780+1BCj
		or	ax, ax
		jnz	short loc_C5947
		jmp	loc_C581A
; ���������������������������������������������������������������������������

loc_C5947:				; CODE XREF: sub_C5780+1C2j
		pop	di
		pop	si
		leave
		retf
sub_C5780	endp

ovr231		ends
