seg029		segment	byte public 'CODE' use16
		assume cs:seg029
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_14DB3	proc far		; CODE XREF: sub_C0550+1DDP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [di]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], eax
		mov	eax, [si+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Bh], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax
		push	8
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		pop	di
		pop	si
		leave
		retf
sub_14DB3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_14E1D	proc far		; CODE XREF: seg029:00FFp seg029:0179p

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		dec	word ptr es:[bx+14h]
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_8]
		jnz	short loc_14E43
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax

loc_14E43:				; CODE XREF: sub_14E1D+15j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+arg_8]
		jnz	short loc_14E5D
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax

loc_14E5D:				; CODE XREF: sub_14E1D+32j
		cmp	[bp+arg_4], 0
		jz	short loc_14E74
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_4]
		mov	es:[bx+2], eax

loc_14E74:				; CODE XREF: sub_14E1D+45j
		pop	bp
		retf
sub_14E1D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+0Ah]
		mov	dword ptr [bp-4], 0
		les	bx, [bp+6]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		jmp	short loc_14EE7
; ���������������������������������������������������������������������������

loc_14E95:				; CODE XREF: seg029:013Cj
		mov	ax, si
		dec	si
		or	ax, ax
		jnz	short loc_14ED3
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_14E1D
		add	sp, 0Ch
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		push	0
		push	2
		lea	ax, [bp-0Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_14ED3:				; CODE XREF: seg029:00EAj
		mov	eax, [bp-8]
		mov	[bp-4],	eax
		les	bx, [bp-8]
		mov	eax, es:[bx+2]
		mov	[bp-8],	eax

loc_14EE7:				; CODE XREF: seg029:00E3j
		cmp	dword ptr [bp-8], 0
		jnz	short loc_14E95
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dword ptr [bp-4], 0
		les	bx, [bp+6]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		jmp	short loc_14F60
; ���������������������������������������������������������������������������

loc_14F0C:				; CODE XREF: seg029:01B5j
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-8]
		jnz	short loc_14F4C
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_14E1D
		add	sp, 0Ch
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		push	0
		push	2
		lea	ax, [bp-0Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_14F4C:				; CODE XREF: seg029:0164j
		mov	eax, [bp-8]
		mov	[bp-4],	eax
		les	bx, [bp-8]
		mov	eax, es:[bx+2]
		mov	[bp-8],	eax

loc_14F60:				; CODE XREF: seg029:015Aj
		cmp	dword ptr [bp-8], 0
		jnz	short loc_14F0C
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, [bp+0Ah]
		mov	dword ptr [bp-4], 0
		jmp	short loc_14F8B
; ���������������������������������������������������������������������������

loc_14F7C:				; CODE XREF: seg029:0266j
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_14F8B
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		leave
		retf
; ���������������������������������������������������������������������������

loc_14F8B:				; CODE XREF: seg029:01CAj seg029:01D1j
		cmp	dword ptr [bp-4], 0
		jnz	short loc_14FA7
		les	bx, [bp+6]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		les	bx, [bp+6]
		mov	es:[bx+8], eax
		jmp	short $+2

loc_14FA7:				; CODE XREF: seg029:01E0j
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_14FC3
		les	bx, [bp+6]
		mov	eax, es:[bx]
		les	bx, [bp+6]
		mov	es:[bx+0Ch], eax
		jmp	short loc_14FED
; ���������������������������������������������������������������������������

loc_14FC3:				; CODE XREF: seg029:0200j
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ch]
		les	bx, [bp+6]
		mov	es:[bx+8], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+6]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_14FED:				; CODE XREF: seg029:0211j
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_15008
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ch]
		mov	[bp-4],	eax
		mov	al, 1
		jmp	short loc_15012
; ���������������������������������������������������������������������������

loc_15008:				; CODE XREF: seg029:0246j
		mov	dword ptr [bp-4], 0
		mov	al, 0

loc_15012:				; CODE XREF: seg029:0256j
		or	al, al
		jz	short loc_15019
		jmp	loc_14F7C
; ���������������������������������������������������������������������������

loc_15019:				; CODE XREF: seg029:0264j
		xor	dx, dx
		xor	ax, ax
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_15021	proc far		; CODE XREF: sub_C2740+32P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		jmp	short loc_15063
; ���������������������������������������������������������������������������

loc_15034:				; CODE XREF: sub_15021+47j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, [bp+var_C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_15063:				; CODE XREF: sub_15021+11j
		cmp	[bp+var_4], 0
		jnz	short loc_15034
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+14h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+16h], 0
		leave
		retf
sub_15021	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		mov	dword ptr [bp-4], 0
		jmp	short loc_150B6
; ���������������������������������������������������������������������������

loc_150A3:				; CODE XREF: seg029:0391j
		push	si
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		les	bx, [bp-4]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_150B6:				; CODE XREF: seg029:02F1j
		cmp	dword ptr [bp-4], 0
		jnz	short loc_150D2
		les	bx, [bp+6]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		les	bx, [bp+6]
		mov	es:[bx+8], eax
		jmp	short $+2

loc_150D2:				; CODE XREF: seg029:030Bj
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_150EE
		les	bx, [bp+6]
		mov	eax, es:[bx]
		les	bx, [bp+6]
		mov	es:[bx+0Ch], eax
		jmp	short loc_15118
; ���������������������������������������������������������������������������

loc_150EE:				; CODE XREF: seg029:032Bj
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ch]
		les	bx, [bp+6]
		mov	es:[bx+8], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+6]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_15118:				; CODE XREF: seg029:033Cj
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_15133
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ch]
		mov	[bp-4],	eax
		mov	al, 1
		jmp	short loc_1513D
; ���������������������������������������������������������������������������

loc_15133:				; CODE XREF: seg029:0371j
		mov	dword ptr [bp-4], 0
		mov	al, 0

loc_1513D:				; CODE XREF: seg029:0381j
		or	al, al
		jz	short loc_15144
		jmp	loc_150A3
; ���������������������������������������������������������������������������

loc_15144:				; CODE XREF: seg029:038Fj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_15147	proc far		; CODE XREF: sub_C0550+53DP

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		push	8
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Bh], eax
		leave
		retf
sub_15147	endp

; ���������������������������������������������������������������������������

loc_151C9:				; DATA XREF: dseg:2E8Eo
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_151FC
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_15200
; ���������������������������������������������������������������������������

loc_151FC:				; CODE XREF: seg029:0421j
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_15200:				; CODE XREF: seg029:044Aj
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_15202:				; DATA XREF: dseg:2E92o
		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jnz	short loc_15213
		jmp	loc_15347
; ���������������������������������������������������������������������������

loc_15213:				; CODE XREF: seg029:045Ej
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 1Fh
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-38h], eax
		mov	eax, es:[si+4]
		mov	[bp-34h], eax
		mov	eax, es:[si+8]
		mov	[bp-30h], eax
		cmp	byte_45EAC, 0
		jz	short loc_1529E
		mov	eax, dword_4916A
		neg	eax
		mov	[bp-44h], eax
		mov	eax, dword_4916E
		neg	eax
		mov	[bp-40h], eax
		mov	eax, dword_49172
		neg	eax
		mov	[bp-3Ch], eax
		mov	eax, [bp-44h]
		mov	[bp-50h], eax
		mov	eax, [bp-40h]
		mov	[bp-4Ch], eax
		mov	eax, [bp-3Ch]
		mov	[bp-48h], eax
		lea	ax, [bp-50h]
		push	ax
		lea	ax, [bp-38h]
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		call	sub_2432A
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-8],	eax
		jmp	short loc_152BA
; ���������������������������������������������������������������������������

loc_1529E:				; CODE XREF: seg029:0494j
		push	614Ah
		lea	ax, [bp-38h]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	sub_2432A
		add	sp, 8
		mov	eax, [bp-10h]
		mov	[bp-8],	eax

loc_152BA:				; CODE XREF: seg029:04ECj
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 0Fh
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	bx, [bp-18h]
		mov	eax, es:[bx]
		mov	[bp-14h], eax
		push	large [dword_49172]
		push	large [dword_4916E]
		push	large [dword_4916A]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	[bp-1Ch], eax
		lea	ax, [bp-8]
		push	ax
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	sub_22E6C
		add	sp, 6
		mov	eax, [bp-1Ch]
		mov	edx, [bp-24h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-28h], eax
		mov	eax, [bp-28h]
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		cmp	eax, [bp-14h]
		jge	short loc_1533C
		mov	ax, 1
		jmp	short loc_1533E
; ���������������������������������������������������������������������������

loc_1533C:				; CODE XREF: seg029:0585j
		xor	ax, ax

loc_1533E:				; CODE XREF: seg029:058Aj
		or	al, al
		jz	short loc_15347
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_15347:				; CODE XREF: seg029:0460j seg029:0590j
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1534F:				; DATA XREF: dseg:2E96o
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_15382
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_15386
; ���������������������������������������������������������������������������

loc_15382:				; CODE XREF: seg029:05A7j
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_15386:				; CODE XREF: seg029:05D0j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_15388:				; DATA XREF: dseg:2E9Ao
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_15391:				; DATA XREF: dseg:2ECAo
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_153C4
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_153C8
; ���������������������������������������������������������������������������

loc_153C4:				; CODE XREF: seg029:05E9j
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_153C8:				; CODE XREF: seg029:0612j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_153CA:				; DATA XREF: dseg:2ECEo
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_153D3:				; DATA XREF: dseg:2ED2o
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_15406
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_1540A
; ���������������������������������������������������������������������������

loc_15406:				; CODE XREF: seg029:062Bj
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1540A:				; CODE XREF: seg029:0654j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1540C:				; DATA XREF: dseg:2ED6o
		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jnz	short loc_1541D
		jmp	loc_1550C
; ���������������������������������������������������������������������������

loc_1541D:				; CODE XREF: seg029:0668j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 13h
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-10h], eax
		mov	eax, es:[si+4]
		mov	[bp-0Ch], eax
		mov	eax, es:[si+8]
		mov	[bp-8],	eax
		cmp	byte_45EAC, 0
		jz	short loc_1547C
		push	6126h
		lea	ax, [bp-10h]
		push	ax
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		mov	eax, [bp-10h]
		add	dword_4916A, eax
		mov	eax, [bp-0Ch]
		add	dword_4916E, eax
		mov	eax, [bp-8]
		add	dword_49172, eax
		jmp	short loc_154E2
; ���������������������������������������������������������������������������

loc_1547C:				; CODE XREF: seg029:069Ej
		push	6102h
		lea	ax, [bp-10h]
		push	ax
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		mov	eax, [bp-10h]
		sub	eax, dword_4916A
		mov	[bp-1Ch], eax
		mov	eax, [bp-0Ch]
		sub	eax, dword_4916E
		mov	[bp-18h], eax
		mov	eax, [bp-8]
		sub	eax, dword_49172
		mov	[bp-14h], eax
		mov	eax, [bp-1Ch]
		mov	[bp-28h], eax
		mov	eax, [bp-18h]
		mov	[bp-24h], eax
		mov	eax, [bp-14h]
		mov	[bp-20h], eax
		mov	eax, [bp-28h]
		mov	dword_4916A, eax
		mov	eax, [bp-24h]
		mov	dword_4916E, eax
		mov	eax, [bp-20h]
		mov	dword_49172, eax

loc_154E2:				; CODE XREF: seg029:06CAj
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_15511
; ���������������������������������������������������������������������������

loc_1550C:				; CODE XREF: seg029:066Aj
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_15511:				; CODE XREF: seg029:075Aj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_15514:				; DATA XREF: dseg:2EA2o
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_15547
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_1554B
; ���������������������������������������������������������������������������

loc_15547:				; CODE XREF: seg029:076Cj
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1554B:				; CODE XREF: seg029:0795j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1554D:				; DATA XREF: dseg:2EA6o
		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jnz	short loc_1555E
		jmp	loc_156C2
; ���������������������������������������������������������������������������

loc_1555E:				; CODE XREF: seg029:07A9j
		les	bx, [bp+0Ah]
		mov	eax, es:[bx+13h]
		mov	[bp-28h], eax
		les	bx, [bp+0Ah]
		mov	eax, es:[bx+17h]
		mov	[bp-24h], eax
		les	bx, [bp+0Ah]
		mov	eax, es:[bx+1Bh]
		mov	[bp-20h], eax
		cmp	byte_45EAC, 0
		jz	short loc_155C1
		push	6102h
		lea	ax, [bp-28h]
		push	ax
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		mov	eax, dword_4916A
		sub	[bp-28h], eax
		mov	eax, dword_4916E
		sub	[bp-24h], eax
		mov	eax, dword_49172
		sub	[bp-20h], eax
		push	6126h
		lea	ax, [bp-28h]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		jmp	short loc_155F7
; ���������������������������������������������������������������������������

loc_155C1:				; CODE XREF: seg029:07D7j
		push	6126h
		lea	ax, [bp-28h]
		push	ax
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		mov	eax, dword_4916A
		add	[bp-28h], eax
		mov	eax, dword_4916E
		add	[bp-24h], eax
		mov	eax, dword_49172
		add	[bp-20h], eax
		push	6102h
		lea	ax, [bp-28h]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4

loc_155F7:				; CODE XREF: seg029:080Fj
		les	bx, [bp+6]
		mov	eax, es:[bx+23h]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+1Fh]
		mov	[bp-8],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+27h]
		mov	[bp-0Ch], eax
		les	bx, [bp+6]
		mov	eax, es:[bx+2Bh]
		mov	[bp-10h], eax
		les	bx, [bp+6]
		mov	eax, es:[bx+2Fh]
		mov	[bp-14h], eax
		les	bx, [bp+6]
		mov	eax, es:[bx+33h]
		mov	[bp-18h], eax
		les	bx, [bp+0Ah]
		mov	eax, es:[bx+0Fh]
		mov	[bp-1Ch], eax
		lea	ax, [bp-28h]
		mov	si, ax
		mov	eax, [si]
		sub	eax, [bp-1Ch]
		cmp	eax, [bp-8]
		jg	short loc_1566A
		mov	eax, [si]
		add	eax, [bp-1Ch]
		cmp	eax, [bp-4]
		jge	short loc_1566F

loc_1566A:				; CODE XREF: seg029:08ABj
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1566F:				; CODE XREF: seg029:08B8j
		mov	eax, [bp-24h]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp-1Ch]
		cmp	eax, [bp-0Ch]
		jg	short loc_15690
		mov	eax, [si]
		add	eax, [bp-1Ch]
		cmp	eax, [bp-10h]
		jge	short loc_15695

loc_15690:				; CODE XREF: seg029:08D1j
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_15695:				; CODE XREF: seg029:08DEj
		mov	eax, [bp-20h]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp-1Ch]
		cmp	eax, [bp-14h]
		jg	short loc_156B6
		mov	eax, [si]
		add	eax, [bp-1Ch]
		cmp	eax, [bp-18h]
		jge	short loc_156BB

loc_156B6:				; CODE XREF: seg029:08F7j
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_156BB:				; CODE XREF: seg029:0904j
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_156C7
; ���������������������������������������������������������������������������

loc_156C2:				; CODE XREF: seg029:07ABj
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_156C7:				; CODE XREF: seg029:0910j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_156CA:				; DATA XREF: dseg:2EAAo
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	byte ptr [bp-1], 0
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_15731
		mov	eax, [bp+0Ah]
		mov	[bp-6],	eax
		push	word ptr [bp-4]
		push	word ptr [bp-6]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		nop
		push	cs
		call	near ptr sub_1582D
		add	sp, 8
		or	al, al
		jz	short loc_156FF
		mov	byte ptr [bp-1], 1

loc_156FF:				; CODE XREF: seg029:0949j
		mov	al, [bp-1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15731
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp-4]
		push	word ptr [bp-6]
		nop
		push	cs
		call	near ptr sub_1582D
		add	sp, 8
		or	al, al
		jz	short loc_15731
		mov	byte ptr [bp-1], 1

loc_15731:				; CODE XREF: seg029:0929j seg029:0956j ...
		mov	al, [bp-1]
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������

loc_15738:				; DATA XREF: dseg:2EAEo
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_157B9
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-4]
		mov	dword_49176, eax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	dword_4917A, eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	dword_4917E, eax
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 1Fh
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		les	si, [bp-10h]
		mov	eax, es:[si]
		mov	dword_49182, eax
		mov	eax, es:[si+4]
		mov	dword_49186, eax
		mov	eax, es:[si+8]
		mov	dword_4918A, eax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		nop
		push	cs
		call	near ptr sub_15A43
		add	sp, 4
		or	al, al
		jz	short loc_157B9
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_157B9:				; CODE XREF: seg029:0994j seg029:0A02j
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Effect_BBoxClipTest
; (sub_398CB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,47L — calcule un code de sortie combiné (Cohen-Sutherland, 3 axes) pour une
; bounding box vs un point : test de clipping bounding-box pour le rendu de débris/particules.
; ==============================================================================================
Effect_BBoxClipTest	proc far		; CODE XREF: sub_15A43+119p
					; sub_15A43+12Cp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	cx, cx
		mov	di, [bp+arg_0]
		mov	es, [bp+arg_2]
		mov	eax, es:[di+1Fh]
		sub	eax, [si]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si]
		sub	eax, es:[di+23h]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+27h]
		sub	eax, [si+4]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+4]
		sub	eax, es:[di+2Bh]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+2Fh]
		sub	eax, [si+8]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+8]
		sub	eax, es:[di+33h]
		shl	eax, 1
		rcl	cx, 1
		mov	al, cl
		pop	di
		pop	si
		pop	bp
		retf
Effect_BBoxClipTest	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1582D	proc far		; CODE XREF: seg029:0941p seg029:0973p

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+33h]
		mov	[bp+var_10], eax
		xor	di, di
		jmp	loc_158D9
; ���������������������������������������������������������������������������

loc_15852:				; CODE XREF: sub_1582D+B1j
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	si, si
		jmp	short loc_158D3
; ���������������������������������������������������������������������������

loc_1586D:				; CODE XREF: sub_1582D+A9j
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_49176, eax
		mov	eax, [bp+var_8]
		mov	dword_4917A, eax
		mov	eax, [bp+var_4]
		mov	dword_4917E, eax
		mov	eax, [bp+var_18]
		mov	dword_49182, eax
		mov	eax, [bp+var_14]
		mov	dword_49186, eax
		mov	eax, [bp+var_10]
		mov	dword_4918A, eax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_16222
		add	sp, 8
		or	al, al
		jz	short loc_158D2
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_158D2:				; CODE XREF: sub_1582D+9Dj
		inc	si

loc_158D3:				; CODE XREF: sub_1582D+3Ej
		cmp	si, 2
		jl	short loc_1586D
		inc	di

loc_158D9:				; CODE XREF: sub_1582D+22j
		cmp	di, 2
		jge	short loc_158E1
		jmp	loc_15852
; ���������������������������������������������������������������������������

loc_158E1:				; CODE XREF: sub_1582D+AFj
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_14], eax
		xor	di, di
		jmp	loc_15985
; ���������������������������������������������������������������������������

loc_158FE:				; CODE XREF: sub_1582D+15Dj
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	si, si
		jmp	short loc_1597F
; ���������������������������������������������������������������������������

loc_15919:				; CODE XREF: sub_1582D+155j
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_49176, eax
		mov	eax, [bp+var_8]
		mov	dword_4917A, eax
		mov	eax, [bp+var_4]
		mov	dword_4917E, eax
		mov	eax, [bp+var_18]
		mov	dword_49182, eax
		mov	eax, [bp+var_14]
		mov	dword_49186, eax
		mov	eax, [bp+var_10]
		mov	dword_4918A, eax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_16222
		add	sp, 8
		or	al, al
		jz	short loc_1597E
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1597E:				; CODE XREF: sub_1582D+149j
		inc	si

loc_1597F:				; CODE XREF: sub_1582D+EAj
		cmp	si, 2
		jl	short loc_15919
		inc	di

loc_15985:				; CODE XREF: sub_1582D+CEj
		cmp	di, 2
		jge	short loc_1598D
		jmp	loc_158FE
; ���������������������������������������������������������������������������

loc_1598D:				; CODE XREF: sub_1582D+15Bj
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_18], eax
		xor	di, di
		jmp	loc_15A31
; ���������������������������������������������������������������������������

loc_159AA:				; CODE XREF: sub_1582D+209j
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_15A2B
; ���������������������������������������������������������������������������

loc_159C5:				; CODE XREF: sub_1582D+201j
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_49176, eax
		mov	eax, [bp+var_8]
		mov	dword_4917A, eax
		mov	eax, [bp+var_4]
		mov	dword_4917E, eax
		mov	eax, [bp+var_18]
		mov	dword_49182, eax
		mov	eax, [bp+var_14]
		mov	dword_49186, eax
		mov	eax, [bp+var_10]
		mov	dword_4918A, eax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_16222
		add	sp, 8
		or	al, al
		jz	short loc_15A2A
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_15A2A:				; CODE XREF: sub_1582D+1F5j
		inc	si

loc_15A2B:				; CODE XREF: sub_1582D+196j
		cmp	si, 2
		jl	short loc_159C5
		inc	di

loc_15A31:				; CODE XREF: sub_1582D+17Aj
		cmp	di, 2
		jge	short loc_15A39
		jmp	loc_159AA
; ���������������������������������������������������������������������������

loc_15A39:				; CODE XREF: sub_1582D+207j
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_1582D	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_15A43	proc far		; CODE XREF: seg029:09FAp
					; sub_16222+5Fp

var_1A0		= dword	ptr -1A0h
var_19C		= dword	ptr -19Ch
var_198		= dword	ptr -198h
var_194		= dword	ptr -194h
var_190		= dword	ptr -190h
var_18C		= dword	ptr -18Ch
var_188		= dword	ptr -188h
var_184		= dword	ptr -184h
var_180		= dword	ptr -180h
var_17C		= dword	ptr -17Ch
var_178		= dword	ptr -178h
var_174		= dword	ptr -174h
var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1ACh
		mov	[bp+var_3], 0
		mov	[bp+var_4], 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		cmp	byte_45EAC, 0
		jz	short loc_15AB5
		mov	eax, dword_4916A
		sub	dword_49176, eax
		mov	eax, dword_4916E
		sub	dword_4917A, eax
		mov	eax, dword_49172
		sub	dword_4917E, eax
		mov	eax, dword_4916A
		sub	dword_49182, eax
		mov	eax, dword_4916E
		sub	dword_49186, eax
		mov	eax, dword_49172
		sub	dword_4918A, eax
		push	6126h
		push	6156h
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		push	6126h
		push	6162h
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		jmp	short loc_15B07
; ���������������������������������������������������������������������������

loc_15AB5:				; CODE XREF: sub_15A43+1Cj
		mov	eax, dword_4916A
		add	dword_49176, eax
		mov	eax, dword_4916E
		add	dword_4917A, eax
		mov	eax, dword_49172
		add	dword_4917E, eax
		mov	eax, dword_4916A
		add	dword_49182, eax
		mov	eax, dword_4916E
		add	dword_49186, eax
		mov	eax, dword_49172
		add	dword_4918A, eax
		push	6102h
		push	6156h
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		push	6102h
		push	6162h
		call	Matrix_WorldToLocal_272D3
		add	sp, 4

loc_15B07:				; CODE XREF: sub_15A43+70j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_1C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+33h]
		mov	[bp+var_20], eax
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_15B52:				; CODE XREF: sub_15A43+7D5j
		push	6156h
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	[bp+var_1], al
		push	6162h
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		cbw
		or	ax, ax
		jz	short loc_15B88
		mov	al, [bp+var_2]
		cbw
		or	ax, ax
		jnz	short loc_15B93

loc_15B88:				; CODE XREF: sub_15A43+13Bj
		mov	[bp+var_3], 1
		mov	[bp+var_4], 1
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_15B93:				; CODE XREF: sub_15A43+143j
		mov	al, [bp+var_2]
		test	[bp+var_1], al
		jz	short loc_15BA6
		mov	[bp+var_3], 1
		mov	[bp+var_4], 0
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_15BA6:				; CODE XREF: sub_15A43+156j
		test	[bp+var_1], 20h
		jnz	short loc_15BAF
		jmp	loc_15CA0
; ���������������������������������������������������������������������������

loc_15BAF:				; CODE XREF: sub_15A43+167j
		mov	eax, [bp+var_10]
		sub	eax, dword_49176
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_8], eax
		mov	eax, dword_49182
		sub	eax, dword_49176
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	dword_49176, eax
		mov	eax, dword_49186
		sub	eax, dword_4917A
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, dword_4917A
		add	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	dword_4917A, eax
		mov	eax, dword_4918A
		sub	eax, dword_4917E
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	eax, dword_4917E
		add	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	dword_4917E, eax
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_15CA0:				; CODE XREF: sub_15A43+169j
		test	[bp+var_1], 10h
		jnz	short loc_15CA9
		jmp	loc_15DAA
; ���������������������������������������������������������������������������

loc_15CA9:				; CODE XREF: sub_15A43+261j
		mov	eax, [bp+var_C]
		sub	eax, dword_49176
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_8], eax
		mov	eax, dword_49182
		sub	eax, dword_49176
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_49176, eax
		mov	eax, dword_49186
		sub	eax, dword_4917A
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_78]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, dword_4917A
		add	eax, [bp+var_80]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	dword_4917A, eax
		mov	eax, dword_4918A
		sub	eax, dword_4917E
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_90]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_98], eax
		mov	eax, dword_4917E
		add	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		mov	dword_4917E, eax
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_15DAA:				; CODE XREF: sub_15A43+263j
		test	[bp+var_1], 8
		jnz	short loc_15DB3
		jmp	loc_15EC4
; ���������������������������������������������������������������������������

loc_15DB3:				; CODE XREF: sub_15A43+36Bj
		mov	eax, [bp+var_14]
		sub	eax, dword_4917A
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_8], eax
		mov	eax, dword_49186
		sub	eax, dword_4917A
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_B0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_49182
		sub	eax, dword_49176
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	eax, dword_49176
		add	eax, [bp+var_C0]
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_C8]
		mov	dword_49176, eax
		mov	eax, [bp+var_14]
		mov	dword_4917A, eax
		mov	eax, dword_4918A
		sub	eax, dword_4917E
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_D0]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		mov	eax, dword_4917E
		add	eax, [bp+var_D8]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E0]
		mov	dword_4917E, eax
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_15EC4:				; CODE XREF: sub_15A43+36Dj
		test	[bp+var_1], 4
		jnz	short loc_15ECD
		jmp	loc_15FDE
; ���������������������������������������������������������������������������

loc_15ECD:				; CODE XREF: sub_15A43+485j
		mov	eax, [bp+var_18]
		sub	eax, dword_4917A
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_8], eax
		mov	eax, dword_49186
		sub	eax, dword_4917A
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_F0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_49182
		sub	eax, dword_49176
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_F4]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_F8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_100], eax
		mov	eax, dword_49176
		add	eax, [bp+var_100]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_104]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_108]
		mov	dword_49176, eax
		mov	eax, [bp+var_18]
		mov	dword_4917A, eax
		mov	eax, dword_4918A
		sub	eax, dword_4917E
		mov	[bp+var_10C], eax
		mov	eax, [bp+var_10C]
		mov	[bp+var_110], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_110]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_118], eax
		mov	eax, dword_4917E
		add	eax, [bp+var_118]
		mov	[bp+var_11C], eax
		mov	eax, [bp+var_11C]
		mov	[bp+var_120], eax
		mov	eax, [bp+var_120]
		mov	dword_4917E, eax
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_15FDE:				; CODE XREF: sub_15A43+487j
		test	[bp+var_1], 2
		jnz	short loc_15FE7
		jmp	loc_160F8
; ���������������������������������������������������������������������������

loc_15FE7:				; CODE XREF: sub_15A43+59Fj
		mov	eax, [bp+var_1C]
		sub	eax, dword_4917E
		mov	[bp+var_124], eax
		mov	eax, [bp+var_124]
		mov	[bp+var_128], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_8], eax
		mov	eax, dword_4918A
		sub	eax, dword_4917E
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_130], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_130]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_49182
		sub	eax, dword_49176
		mov	[bp+var_134], eax
		mov	eax, [bp+var_134]
		mov	[bp+var_138], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_138]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_140], eax
		mov	eax, dword_49176
		add	eax, [bp+var_140]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_144]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_148]
		mov	dword_49176, eax
		mov	eax, dword_49186
		sub	eax, dword_4917A
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_14C]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_150]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_154], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_158], eax
		mov	eax, dword_4917A
		add	eax, [bp+var_158]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_15C]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_160]
		mov	dword_4917A, eax
		mov	eax, [bp+var_1C]
		mov	dword_4917E, eax
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_160F8:				; CODE XREF: sub_15A43+5A1j
		test	[bp+var_1], 1
		jnz	short loc_16101
		jmp	loc_1620F
; ���������������������������������������������������������������������������

loc_16101:				; CODE XREF: sub_15A43+6B9j
		mov	eax, [bp+var_20]
		sub	eax, dword_4917E
		mov	[bp+var_164], eax
		mov	eax, [bp+var_164]
		mov	[bp+var_168], eax
		mov	eax, [bp+var_168]
		mov	[bp+var_8], eax
		mov	eax, dword_4918A
		sub	eax, dword_4917E
		mov	[bp+var_16C], eax
		mov	eax, [bp+var_16C]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_170]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_49182
		sub	eax, dword_49176
		mov	[bp+var_174], eax
		mov	eax, [bp+var_174]
		mov	[bp+var_178], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_178]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_17C]
		mov	[bp+var_180], eax
		mov	eax, dword_49176
		add	eax, [bp+var_180]
		mov	[bp+var_184], eax
		mov	eax, [bp+var_184]
		mov	[bp+var_188], eax
		mov	eax, [bp+var_188]
		mov	dword_49176, eax
		mov	eax, dword_49186
		sub	eax, dword_4917A
		mov	[bp+var_18C], eax
		mov	eax, [bp+var_18C]
		mov	[bp+var_190], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_190]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_194], eax
		mov	eax, [bp+var_194]
		mov	[bp+var_198], eax
		mov	eax, dword_4917A
		add	eax, [bp+var_198]
		mov	[bp+var_19C], eax
		mov	eax, [bp+var_19C]
		mov	[bp+var_1A0], eax
		mov	eax, [bp+var_1A0]
		mov	dword_4917A, eax
		mov	eax, [bp+var_20]
		mov	dword_4917E, eax

loc_1620F:				; CODE XREF: sub_15A43+10Cj
					; sub_15A43+14Dj ...
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1621B
		jmp	loc_15B52
; ���������������������������������������������������������������������������

loc_1621B:				; CODE XREF: sub_15A43+7D3j
		mov	al, [bp+var_4]
		leave
		retf
sub_15A43	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_16222	proc far		; CODE XREF: sub_1582D+95p
					; sub_1582D+141p ...

arg_4		= dword	ptr  0Ah

; FUNCTION CHUNK AT 14DF SIZE 00000002 BYTES

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_1628B
		cmp	byte_45EAC, 0
		jz	short loc_16251
		push	6126h
		push	6156h
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		push	6126h
		push	6162h
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		jmp	short loc_1626D
; ���������������������������������������������������������������������������

loc_16251:				; CODE XREF: sub_16222+Fj
		push	6102h
		push	6156h
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		push	6102h
		push	6162h
		call	Matrix_LocalToWorld_27393
		add	sp, 4

loc_1626D:				; CODE XREF: sub_16222+2Dj
		mov	al, byte_45EAC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_45EAC, al
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	cs
		call	near ptr sub_15A43
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_1628F
; ���������������������������������������������������������������������������

loc_1628B:				; CODE XREF: sub_16222+8j
		mov	al, 0
		pop	bp
		retf
sub_16222	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_16222

loc_1628F:				; CODE XREF: sub_16222+67j
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR sub_16222
; ���������������������������������������������������������������������������

loc_16291:				; DATA XREF: dseg:58F2o
		push	bp
		mov	bp, sp
		push	6102h
		call	sub_25718
		add	sp, 2
		push	6126h
		call	sub_25718
		add	sp, 2
		pop	bp
		retf
seg029		ends
