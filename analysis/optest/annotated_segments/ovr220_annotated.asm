ovr220		segment	para public 'OVERLAY' use16
		assume cs:ovr220
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2740	proc far		; CODE XREF: sub_429E4J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_C2754
		jmp	loc_C27E5
; ���������������������������������������������������������������������������

loc_C2754:				; CODE XREF: sub_C2740+Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 3364h
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_C279B
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		call	sub_15021
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C279B:				; CODE XREF: sub_C2740+25j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_C27C4
		push	3
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+17h]
		push	word ptr es:[bx+15h]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_C27C4:				; CODE XREF: sub_C2740+64j
		test	si, 1
		jz	short loc_C27E5
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, [bp+var_8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_C27E5:				; CODE XREF: sub_C2740+11j
					; sub_C2740+88j
		pop	si
		leave
		retf
sub_C2740	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C27E8	proc far		; CODE XREF: sub_429E9J

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		or	si, si
		jz	short loc_C280D
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 19h
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[si+6],	eax

loc_C280D:				; CODE XREF: sub_C27E8+Cj
		pop	si
		leave
		retf
sub_C27E8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2810	proc far		; CODE XREF: sub_429D5J sub_C2869+26p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0Fh], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0Dh], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2], 1
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+3], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+4], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+15h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		pop	bp
		retf
sub_C2810	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2869	proc far		; CODE XREF: sub_429DAJ

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		mov	byte_4644D, 0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_C2810
		add	sp, 4
		push	1
		push	0
		push	2
		push	large 17h
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_C2905
		mov	[bp+var_8], 5DC00h
		mov	eax, [bp+var_8]
		les	bx, [bp+var_4]
		mov	es:[bx+10h], eax
		les	bx, [bp+var_4]
		xor	eax, eax
		mov	es:[bx+4], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax
		les	bx, [bp+var_4]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_4]
		mov	es:[bx+8], eax
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+14h], 0
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx+16h], 0
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_C290B
; ���������������������������������������������������������������������������

loc_C2905:				; CODE XREF: sub_C2869+48j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_C290B:				; CODE XREF: sub_C2869+9Aj
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		push	0
		push	large 474D4144h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C294F
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+6], 0FFFFh
		jnz	short loc_C294D
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+3], 1

loc_C294D:				; CODE XREF: sub_C2869+DAj
		jmp	short loc_C2958
; ���������������������������������������������������������������������������

loc_C294F:				; CODE XREF: sub_C2869+C0j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0Ah

loc_C2958:				; CODE XREF: sub_C2869:loc_C294Dj
		pop	si
		leave
		retf
sub_C2869	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C295B	proc far		; CODE XREF: sub_429DFJ

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		push	0
		push	large 45545845h
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C298E
		jmp	loc_C2A6E
; ���������������������������������������������������������������������������

loc_C298E:				; CODE XREF: sub_C295B+2Ej
		push	di
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+10h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2], ax
		push	di
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+16h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	word ptr es:[bx+14h], 0
		xor	si, si
		jmp	loc_C2A66
; ���������������������������������������������������������������������������

loc_C29DE:				; CODE XREF: sub_C295B+110j
		push	di
		call	sub_4280F
		add	sp, 2
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_C2A65
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		inc	word ptr es:[bx+14h]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+4]
		or	ax, es:[bx+6]
		jnz	short loc_C2A35
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_C2A63
; ���������������������������������������������������������������������������

loc_C2A35:				; CODE XREF: sub_C295B+B3j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+4]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx

loc_C2A63:				; CODE XREF: sub_C295B+D8j
		jmp	short $+2

loc_C2A65:				; CODE XREF: sub_C295B+97j
		inc	si

loc_C2A66:				; CODE XREF: sub_C295B+80j
		cmp	si, [bp+var_2]
		jge	short loc_C2A6E
		jmp	loc_C29DE
; ���������������������������������������������������������������������������

loc_C2A6E:				; CODE XREF: sub_C295B+30j
					; sub_C295B+10Ej
		pop	di
		pop	si
		leave
		retf
sub_C295B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2A72	proc far		; CODE XREF: sub_429F3J

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_C2ABB
; ���������������������������������������������������������������������������

loc_C2A83:				; CODE XREF: sub_C2A72+58j
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+4], 0
		jz	short loc_C2AA8
		push	3
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		mov	bx, [bp+var_2]
		les	bx, [bx+4]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_C2AA8:				; CODE XREF: sub_C2A72+19j
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		mov	[bp+var_2], 0

loc_C2ABB:				; CODE XREF: sub_C2A72+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_C2A83
		pop	si
		leave
		retf
sub_C2A72	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2ACF	proc far		; CODE XREF: sub_429EEJ

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_6], eax
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_C2B0B
		mov	word ptr [di], 5CEh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 3360h
		mov	eax, [bp+var_6]
		mov	[di+4],	eax
		mov	ax, di
		jmp	short loc_C2B0D
; ���������������������������������������������������������������������������

loc_C2B0B:				; CODE XREF: sub_C2ACF+21j
		mov	ax, di

loc_C2B0D:				; CODE XREF: sub_C2ACF+3Aj
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C2ACF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2B20	proc far		; CODE XREF: sub_429F8J
		push	bp
		mov	bp, sp
		push	si
		mov	si, 0Ah
		jmp	short loc_C2B3F
; ���������������������������������������������������������������������������

loc_C2B29:				; CODE XREF: sub_C2B20+23j
		push	si
		call	PC_SoundOn
		add	sp, 2
		push	5
		call	PIT_DelayLoop
		add	sp, 2
		add	si, 1Eh

loc_C2B3F:				; CODE XREF: sub_C2B20+7j
		cmp	si, 1388h
		jl	short loc_C2B29
		call	sub_1C83
		pop	si
		pop	bp
		retf
sub_C2B20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2B4D	proc far		; CODE XREF: sub_429FDJ

arg_0		= word ptr  6

; FUNCTION CHUNK AT 0447 SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 4D524F46h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C2B82
		push	si
		call	ResourceRecord_ReadDwordAdvance_3C40B
		add	sp, 2
		push	si
		call	sub_3C491
		add	sp, 2
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_C2B87
; ���������������������������������������������������������������������������

loc_C2B82:				; CODE XREF: sub_C2B4D+1Aj
		mov	al, 0
		pop	si
		pop	bp
		retf
sub_C2B4D	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_C2B4D

loc_C2B87:				; CODE XREF: sub_C2B4D+33j
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR sub_C2B4D

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2B8A	proc far		; CODE XREF: sub_429D0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C2BAC
		test	di, 1
		jz	short loc_C2BAA
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C2BAA:				; CODE XREF: sub_C2B8A+13j
		jmp	short $+2

loc_C2BAC:				; CODE XREF: sub_C2B8A+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_C2B8A	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
ovr220		ends
