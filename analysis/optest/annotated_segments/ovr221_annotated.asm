ovr221		segment	para public 'OVERLAY' use16
		assume cs:ovr221
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2BC0	proc far		; CODE XREF: sub_42A35J

var_11E		= word ptr -11Eh
var_CE		= word ptr -0CEh
var_71		= dword	ptr -71h
var_6D		= dword	ptr -6Dh
var_69		= dword	ptr -69h
var_61		= dword	ptr -61h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 11Eh
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		lea	ax, [bp+var_CE]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_CE], 556h
		mov	[bp+var_6D], 100h
		mov	[bp+var_71], 0
		mov	[bp+var_CE], 56Eh
		mov	[bp+var_52], 0
		xor	ax, ax
		mov	[bp+var_54], ax
		movsx	eax, ax
		mov	[bp+var_69], eax
		mov	eax, [bp+arg_2]
		mov	[bp+var_12], eax
		push	8
		push	word ptr [bp+var_12+2]
		push	word ptr [bp+var_12]
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_6], 0
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	si
		call	sub_21A98
		add	sp, 6
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0
		jz	short loc_C2C55
		jmp	loc_C2F41
; ���������������������������������������������������������������������������

loc_C2C55:				; CODE XREF: sub_C2BC0+90j
		mov	byte_4644D, 0
		push	seg seg168
		push	offset a_iff_0	; ".IFF"
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	offset aObjects	; "OBJECTS"
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_11E]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		mov	bx, [bp+var_CE]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+var_61], 4C414552h
		jnz	short loc_C2C9B
		mov	ax, 1
		jmp	short loc_C2C9D
; ���������������������������������������������������������������������������

loc_C2C9B:				; CODE XREF: sub_C2BC0+D4j
		xor	ax, ax

loc_C2C9D:				; CODE XREF: sub_C2BC0+D9j
		or	ax, ax
		jnz	short loc_C2CA4
		jmp	loc_C2F36
; ���������������������������������������������������������������������������

loc_C2CA4:				; CODE XREF: sub_C2BC0+DFj
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large 544A424Fh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C2CCD
		jmp	loc_C2F08
; ���������������������������������������������������������������������������

loc_C2CCD:				; CODE XREF: sub_C2BC0+108j
		push	0
		push	large 4A424F42h
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_C2D5D
		push	1
		push	0
		push	2
		push	large 23h ; '#'
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], ax
		or	ax, dx
		jz	short loc_C2D41
		les	bx, [bp+var_1E]
		mov	word ptr es:[bx], 3364h
		xor	eax, eax
		les	bx, [bp+var_1E]
		mov	es:[bx+1Dh], eax
		les	bx, [bp+var_1E]
		mov	es:[bx+19h], eax
		les	bx, [bp+var_1E]
		mov	es:[bx+21h], al
		lea	ax, [bp+var_CE]
		push	ax
		push	word ptr [bp+var_1E+2]
		push	word ptr [bp+var_1E]
		call	sub_429DA
		add	sp, 6
		mov	dx, word ptr [bp+var_1E+2]
		mov	ax, word ptr [bp+var_1E]
		jmp	short loc_C2D47
; ���������������������������������������������������������������������������

loc_C2D41:				; CODE XREF: sub_C2BC0+142j
		mov	dx, word ptr [bp+var_1E+2]
		mov	ax, word ptr [bp+var_1E]

loc_C2D47:				; CODE XREF: sub_C2BC0+17Fj
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	loc_C2EB1
; ���������������������������������������������������������������������������

loc_C2D5D:				; CODE XREF: sub_C2BC0+124j
		push	0
		push	large 544E524Fh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C2D79
		jmp	loc_C2E06
; ���������������������������������������������������������������������������

loc_C2D79:				; CODE XREF: sub_C2BC0+1B4j
		push	1
		push	0
		push	2
		push	large 24h ; '$'
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		or	ax, dx
		jz	short loc_C2DEA
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 3364h
		xor	eax, eax
		les	bx, [bp+var_22]
		mov	es:[bx+1Dh], eax
		les	bx, [bp+var_22]
		mov	es:[bx+19h], eax
		les	bx, [bp+var_22]
		mov	es:[bx+21h], al
		push	word ptr [bp+var_22+2]
		push	word ptr [bp+var_22]
		call	sub_429D5
		add	sp, 4
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 3378h
		lea	ax, [bp+var_CE]
		push	ax
		push	word ptr [bp+var_22+2]
		push	word ptr [bp+var_22]
		call	sub_21E33
		add	sp, 6
		mov	dx, word ptr [bp+var_22+2]
		mov	ax, word ptr [bp+var_22]
		jmp	short loc_C2DF0
; ���������������������������������������������������������������������������

loc_C2DEA:				; CODE XREF: sub_C2BC0+1D5j
		mov	dx, word ptr [bp+var_22+2]
		mov	ax, word ptr [bp+var_22]

loc_C2DF0:				; CODE XREF: sub_C2BC0+228j
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	loc_C2EB1
; ���������������������������������������������������������������������������

loc_C2E06:				; CODE XREF: sub_C2BC0+1B6j
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_429FD
		add	sp, 2
		or	al, al
		jnz	short loc_C2E1A
		jmp	loc_C2EA6
; ���������������������������������������������������������������������������

loc_C2E1A:				; CODE XREF: sub_C2BC0+255j
		push	1
		push	0
		push	2
		push	large 24h ; '$'
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		or	ax, dx
		jz	short loc_C2E8B
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 3364h
		xor	eax, eax
		les	bx, [bp+var_26]
		mov	es:[bx+1Dh], eax
		les	bx, [bp+var_26]
		mov	es:[bx+19h], eax
		les	bx, [bp+var_26]
		mov	es:[bx+21h], al
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		call	sub_429D5
		add	sp, 4
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 3378h
		lea	ax, [bp+var_CE]
		push	ax
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		call	sub_21E33
		add	sp, 6
		mov	dx, word ptr [bp+var_26+2]
		mov	ax, word ptr [bp+var_26]
		jmp	short loc_C2E91
; ���������������������������������������������������������������������������

loc_C2E8B:				; CODE XREF: sub_C2BC0+276j
		mov	dx, word ptr [bp+var_26+2]
		mov	ax, word ptr [bp+var_26]

loc_C2E91:				; CODE XREF: sub_C2BC0+2C9j
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_C2EB1
; ���������������������������������������������������������������������������

loc_C2EA6:				; CODE XREF: sub_C2BC0+257j
		push	0C015h
		call	sub_30D3
		add	sp, 2

loc_C2EB1:				; CODE XREF: sub_C2BC0+19Aj
					; sub_C2BC0+243j ...
		cmp	[bp+var_16], 0
		jz	short loc_C2EFD
		lea	ax, [bp+var_CE]
		push	ax
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		call	sub_429DF
		add	sp, 6
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		push	si
		call	sub_429EE
		add	sp, 6
		push	8
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, word ptr [bp+var_16]
		add	ax, 19h
		push	word ptr [bp+var_16+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+var_16]
		mov	byte ptr es:[bx+21h], 0
		jmp	short loc_C2F08
; ���������������������������������������������������������������������������

loc_C2EFD:				; CODE XREF: sub_C2BC0+2F6j
		push	0C014h
		call	sub_30D3
		add	sp, 2

loc_C2F08:				; CODE XREF: sub_C2BC0+10Aj
					; sub_C2BC0+33Bj
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		cmp	[bp+var_16], 0
		jz	short loc_C2F34
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_1A317
		add	sp, 2
		les	bx, [bp+var_16]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax

loc_C2F34:				; CODE XREF: sub_C2BC0+35Aj
		jmp	short loc_C2F41
; ���������������������������������������������������������������������������

loc_C2F36:				; CODE XREF: sub_C2BC0+E1j
		push	0C016h
		call	sub_30D3
		add	sp, 2

loc_C2F41:				; CODE XREF: sub_C2BC0+92j
					; sub_C2BC0:loc_C2F34j
		les	bx, [bp+var_16]
		mov	al, [bp+arg_6]
		mov	es:[bx+2], al
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_CE], 56Eh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_CE]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		pop	si
		leave
		retf
sub_C2BC0	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2F81	proc far		; CODE XREF: sub_42A30J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_C2FC7
		push	0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_429E4
		add	sp, 6
		test	si, 1
		jz	short loc_C2FC5
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C2FC5:				; CODE XREF: sub_C2F81+25j
		jmp	short $+2

loc_C2FC7:				; CODE XREF: sub_C2F81+Fj
		pop	si
		leave
		retf
sub_C2F81	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
ovr221		ends
