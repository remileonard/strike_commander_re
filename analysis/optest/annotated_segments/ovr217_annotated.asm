ovr217		segment	para public 'OVERLAY' use16
		assume cs:ovr217
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C17F0	proc far		; CODE XREF: sub_428D5J sub_C1EFF+62p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_C180F
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C1854

loc_C180F:				; CODE XREF: sub_C17F0+Dj
		mov	ax, si
		add	ax, 8
		mov	ax, [di]
		mov	[si+6],	ax
		mov	ax, [di+2]
		mov	[si+0Bh], ax
		mov	ax, [di+4]
		mov	[si+0Dh], ax
		mov	al, [di+6]
		mov	[si+8],	al
		mov	al, [di+7]
		mov	[si+9],	al
		mov	al, [di+8]
		mov	[si+0Ah], al
		mov	al, [di+9]
		mov	[si+2],	al
		mov	al, [di+0Ah]
		mov	[si+3],	al
		mov	al, [di+0Bh]
		mov	[si+4],	al
		mov	al, [di+0Ch]
		mov	[si+5],	al
		mov	ax, [bp+arg_4]
		mov	[si], ax

loc_C1854:				; CODE XREF: sub_C17F0+1Dj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_C17F0	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C185E	proc far		; CODE XREF: sub_428DAJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h
arg_12		= byte ptr  18h
arg_14		= byte ptr  1Ah
arg_16		= byte ptr  1Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C1879
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C18BF

loc_C1879:				; CODE XREF: sub_C185E+9j
		mov	ax, si
		add	ax, 8
		mov	ax, [bp+arg_2]
		mov	[si+6],	ax
		mov	al, [bp+arg_4]
		mov	[si+8],	al
		mov	al, [bp+arg_6]
		mov	[si+9],	al
		mov	al, [bp+arg_8]
		mov	[si+0Ah], al
		mov	ax, [bp+arg_A]
		mov	[si+0Bh], ax
		mov	ax, [bp+arg_C]
		mov	[si+0Dh], ax
		mov	ax, [bp+arg_E]
		mov	[si], ax
		mov	al, [bp+arg_10]
		mov	[si+2],	al
		mov	al, [bp+arg_12]
		mov	[si+3],	al
		mov	al, [bp+arg_14]
		mov	[si+4],	al
		mov	al, [bp+arg_16]
		mov	[si+5],	al

loc_C18BF:				; CODE XREF: sub_C185E+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C185E	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C18C7	proc far		; CODE XREF: sub_42907J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_C18C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C18CF	proc far		; CODE XREF: sub_42911J

var_F8		= word ptr -0F8h
var_9B		= dword	ptr -9Bh
var_97		= dword	ptr -97h
var_93		= dword	ptr -93h
var_8B		= dword	ptr -8Bh
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg168
		push	offset a_iff_0	; ".IFF"
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPalette	; "PALETTE"
		lea	ax, [bp+var_50]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_F8], 556h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 56Eh
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_C1998
		cmp	[bp+var_8B], 544C4150h
		jnz	short loc_C195B
		mov	ax, 1
		jmp	short loc_C195D
; ���������������������������������������������������������������������������

loc_C195B:				; CODE XREF: sub_C18CF+85j
		xor	ax, ax

loc_C195D:				; CODE XREF: sub_C18CF+8Aj
		or	ax, ax
		jz	short loc_C198B
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_3C491
		add	sp, 2
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C19C8
		add	sp, 4
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_C1996
; ���������������������������������������������������������������������������

loc_C198B:				; CODE XREF: sub_C18CF+90j
		push	9003h
		call	sub_30D3
		add	sp, 2

loc_C1996:				; CODE XREF: sub_C18CF+BAj
		jmp	short loc_C19A3
; ���������������������������������������������������������������������������

loc_C1998:				; CODE XREF: sub_C18CF+7Aj
		push	9004h
		call	sub_30D3
		add	sp, 2

loc_C19A3:				; CODE XREF: sub_C18CF:loc_C1996j
		mov	[bp+var_F8], 56Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	si
		leave
		retf
sub_C18CF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C19C8	proc far		; CODE XREF: sub_4290CJ sub_C18CF+A7p

var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		lea	ax, [bp+var_A]
		push	ax
		call	sub_C7A3
		add	sp, 2
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_C1CDD
		add	sp, 4
		push	0
		push	large 4C424154h
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C1A1B
		push	di
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C1F7B
		add	sp, 4

loc_C1A1B:				; CODE XREF: sub_C19C8+37j
		push	large 0
		push	si
		call	sub_1EEBD
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_C19C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1A2B	proc far		; CODE XREF: sub_42916J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_C1A3D
		jmp	loc_C1B77
; ���������������������������������������������������������������������������

loc_C1A3D:				; CODE XREF: sub_C1A2B+Dj
		push	si
		nop
		push	cs
		call	near ptr sub_C1B7B
		add	sp, 2
		cmp	byte ptr [si+63h], 0
		jz	short loc_C1A6C
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_C1A6C
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1A6C:				; CODE XREF: sub_C1A2B+1Fj
					; sub_C1A2B+26j
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_C1AA6
		cmp	dword ptr [si+27h], 0
		jz	short loc_C1AA6
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h	; '''
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1AA6:				; CODE XREF: sub_C1A2B+59j
					; sub_C1A2B+60j
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_C1AE0
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_C1AE0
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1AE0:				; CODE XREF: sub_C1A2B+93j
					; sub_C1A2B+9Aj
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_C1B1A
		cmp	dword ptr [si+13h], 0
		jz	short loc_C1B1A
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1B1A:				; CODE XREF: sub_C1A2B+CDj
					; sub_C1A2B+D4j
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_C1B54
		cmp	dword ptr [si+9], 0
		jz	short loc_C1B54
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1B54:				; CODE XREF: sub_C1A2B+107j
					; sub_C1A2B+10Ej
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		test	di, 1
		jz	short loc_C1B77
		push	si
		call	sub_308
		add	sp, 2

loc_C1B77:				; CODE XREF: sub_C1A2B+Fj
					; sub_C1A2B+141j
		pop	di
		pop	si
		pop	bp
		retf
sub_C1A2B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1B7B	proc far		; CODE XREF: sub_4291BJ sub_C1A2B+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_C1BA8
		cmp	dword ptr [si+9], 0
		jz	short loc_C1BA8
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1BA8:				; CODE XREF: sub_C1B7B+Bj
					; sub_C1B7B+12j
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_C1BE2
		cmp	dword ptr [si+13h], 0
		jz	short loc_C1BE2
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1BE2:				; CODE XREF: sub_C1B7B+45j
					; sub_C1B7B+4Cj
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_C1C1C
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_C1C1C
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1C1C:				; CODE XREF: sub_C1B7B+7Fj
					; sub_C1B7B+86j
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_C1C56
		cmp	dword ptr [si+27h], 0
		jz	short loc_C1C56
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h	; '''
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1C56:				; CODE XREF: sub_C1B7B+B9j
					; sub_C1B7B+C0j
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+63h], 0
		jz	short loc_C1C90
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_C1C90
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C1C90:				; CODE XREF: sub_C1B7B+F3j
					; sub_C1B7B+FAj
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 42h	; 'B'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	dword ptr [si+42h], 0
		push	word ptr [si+5Ah]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+5Ah], 0
		push	si
		call	Palette_DestructResource
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C1B7B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1CDD	proc far		; CODE XREF: sub_428DFJ sub_C19C8+1Ep

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1D00
		jmp	loc_C1D8E
; ���������������������������������������������������������������������������

loc_C1D00:				; CODE XREF: sub_C1CDD+1Ej
		push	di
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		add	sp, 2
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+68h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+52h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+4Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+46h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+7Ah], ax
		mov	cl, [si+68h]
		mov	eax, 1
		shl	eax, cl
		mov	[si+6Ah], eax
		mov	eax, [si+6Ah]
		sar	eax, 1
		mov	[si+6Eh], eax
		mov	word ptr [si+54h], 0
		mov	ax, [si+52h]
		mov	[si+56h], ax
		mov	ax, [si+56h]
		shl	ax, 8
		mov	[si+50h], ax
		mov	cl, [si+4Eh]
		mov	ax, 1
		shl	ax, cl
		mov	[si+4Ch], ax
		movsx	eax, word ptr [si+46h]
		mov	cl, [si+7Ah]
		shl	eax, cl
		mov	[si+7Ch], eax

loc_C1D8E:				; CODE XREF: sub_C1CDD+20j
		push	0
		push	large 544C4150h
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C1DAD
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_C209D
		add	sp, 4

loc_C1DAD:				; CODE XREF: sub_C1CDD+C4j
		push	0
		push	large 43594B53h
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C1DCC
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_C1E15
		add	sp, 4

loc_C1DCC:				; CODE XREF: sub_C1CDD+E3j
		push	0
		push	large 48574C42h
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C1DEB
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_C21EA
		add	sp, 4

loc_C1DEB:				; CODE XREF: sub_C1CDD+102j
		push	0
		push	large 474E4152h
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C1E0C
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_C1EFF
		add	sp, 4
		jmp	short loc_C1E11
; ���������������������������������������������������������������������������

loc_C1E0C:				; CODE XREF: sub_C1CDD+121j
		mov	word ptr [si+58h], 0

loc_C1E11:				; CODE XREF: sub_C1CDD+12Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_C1CDD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1E15	proc far		; CODE XREF: sub_42902J sub_C1CDD+E9p

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+33h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+35h], ax
		mov	ax, [si+33h]
		imul	word ptr [si+35h]
		mov	dx, ax
		shl	dx, 1
		add	dx, ax
		movsx	eax, dx
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	large [bp+var_8]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+27h], eax
		mov	byte ptr [si+2Bh], 2
		mov	byte ptr [si+2Ch], 1
		mov	dword ptr [si+2Dh], 0
		mov	eax, [bp+var_8]
		mov	[si+2Dh], eax
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	large [bp+var_4]
		push	[bp+var_E]
		push	[bp+var_10]
		push	di
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	word ptr [si+31h], 0
		mov	[bp+var_14], 4D6400h
		mov	ax, [si+33h]
		mov	[bp+var_16], ax
		movsx	ebx, [bp+var_16]
		mov	eax, [bp+var_14]
		cdq
		idiv	ebx
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[si+37h], eax
		mov	byte ptr [si+3Bh], 0
		pop	di
		pop	si
		leave
		retf
sub_C1E15	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1EFF	proc far		; CODE XREF: sub_428EEJ sub_C1CDD+127p

var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+58h], ax
		push	seg stub217
		push	offset sub_428D0
		push	1
		push	word ptr [si+58h]
		push	0Fh
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+5Ah], ax
		xor	di, di
		jmp	short loc_C1F72
; ���������������������������������������������������������������������������

loc_C1F36:				; CODE XREF: sub_C1EFF+76j
		push	large 0Dh
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	dx, [si+5Ah]
		add	dx, ax
		push	ds
		push	dx
		push	si
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	cs
		call	near ptr sub_C17F0
		add	sp, 6
		push	ds
		push	ax
		mov	cx, 0Fh
		call	CRT_Fmemcpy
		inc	di

loc_C1F72:				; CODE XREF: sub_C1EFF+35j
		cmp	[si+58h], di
		jg	short loc_C1F36
		pop	di
		pop	si
		leave
		retf
sub_C1EFF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1F7B	proc far		; CODE XREF: sub_428F3J sub_C19C8+4Dp

var_F8		= word ptr -0F8h
var_9B		= dword	ptr -9Bh
var_97		= dword	ptr -97h
var_93		= dword	ptr -93h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg168
		push	offset a_iff_0	; ".IFF"
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPalette	; "PALETTE"
		lea	ax, [bp+var_50]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_F8], 556h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 56Eh
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_C206D
		push	0
		push	large 4C425446h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_C2060
		push	0
		push	large 5A485F44h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C2037
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C228F
		add	sp, 4

loc_C2037:				; CODE XREF: sub_C1F7B+ACj
		push	0
		push	large 45444146h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C205E
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C22F7
		add	sp, 4

loc_C205E:				; CODE XREF: sub_C1F7B+D3j
		jmp	short loc_C206B
; ���������������������������������������������������������������������������

loc_C2060:				; CODE XREF: sub_C1F7B+93j
		push	9005h
		call	sub_30D3
		add	sp, 2

loc_C206B:				; CODE XREF: sub_C1F7B:loc_C205Ej
		jmp	short loc_C2078
; ���������������������������������������������������������������������������

loc_C206D:				; CODE XREF: sub_C1F7B+7Aj
		push	9006h
		call	sub_30D3
		add	sp, 2

loc_C2078:				; CODE XREF: sub_C1F7B:loc_C206Bj
		mov	[bp+var_F8], 56Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	si
		leave
		retf
sub_C1F7B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C209D	proc far		; CODE XREF: sub_428E4J sub_C1CDD+CAp

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	large [bp+var_8]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+9],	eax
		mov	byte ptr [si+0Dh], 2
		mov	byte ptr [si+0Eh], 1
		mov	dword ptr [si+0Fh], 0
		mov	eax, [bp+var_8]
		mov	[si+0Fh], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_C211C
		push	9007h
		call	sub_30D3
		add	sp, 2

loc_C211C:				; CODE XREF: sub_C209D+72j
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	sub_1EC4C
		add	sp, 6
		mov	byte ptr [si+3Dh], 0
		mov	byte ptr [si+3Eh], 0FFh
		mov	al, 0
		mov	[si+41h], al
		mov	[si+40h], al
		mov	[si+3Fh], al
		mov	ax, word ptr [bp+var_4]
		add	ax, 0FFFCh
		mov	[si+7],	ax
		movsx	eax, word ptr [si+7]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	large [bp+var_10]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[si+1Dh], eax
		mov	byte ptr [si+21h], 2
		mov	byte ptr [si+22h], 1
		mov	dword ptr [si+23h], 0
		mov	eax, [bp+var_10]
		mov	[si+23h], eax
		push	0
		mov	al, [si+21h]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_C21E6
		push	9030h
		call	sub_30D3
		add	sp, 2

loc_C21E6:				; CODE XREF: sub_C209D+13Cj
		pop	di
		pop	si
		leave
		retf
sub_C209D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C21EA	proc far		; CODE XREF: sub_428E9J sub_C1CDD+108p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	large [bp+var_8]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+13h], eax
		mov	byte ptr [si+17h], 2
		mov	byte ptr [si+18h], 1
		mov	dword ptr [si+19h], 0
		mov	eax, [bp+var_8]
		mov	[si+19h], eax
		push	0
		mov	al, [si+17h]
		push	ax
		push	word ptr [si+15h]
		push	word ptr [si+13h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_C2269
		push	9009h
		call	sub_30D3
		add	sp, 2

loc_C2269:				; CODE XREF: sub_C21EA+72j
		push	0
		mov	al, [si+17h]
		push	ax
		push	word ptr [si+15h]
		push	word ptr [si+13h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_C21EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C228F	proc far		; CODE XREF: sub_428F8J sub_C1F7B+B6p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+46h]
		mov	cl, [si+4Eh]
		shl	ax, cl
		shl	ax, 2
		movzx	eax, ax
		cmp	eax, [di+72h]
		jz	short loc_C22BA
		push	900Ah
		call	sub_30D3
		add	sp, 2

loc_C22BA:				; CODE XREF: sub_C228F+1Ej
		push	1
		push	0
		push	2
		push	large dword ptr	[di+72h]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+44h], dx
		mov	[si+42h], ax
		or	ax, dx
		jnz	short loc_C22E4
		push	900Bh
		call	sub_30D3
		add	sp, 2

loc_C22E4:				; CODE XREF: sub_C228F+48j
		push	word ptr [si+44h]
		push	word ptr [si+42h]
		push	di
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_C228F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C22F7	proc far		; CODE XREF: sub_428FDJ sub_C1F7B+DDp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+72h]
		mov	[si+5Ch], ax
		movsx	eax, word ptr [si+5Ch]
		mov	[bp+var_4], eax
		push	3280h
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+5Eh], eax
		mov	byte ptr [si+62h], 2
		mov	byte ptr [si+63h], 1
		mov	dword ptr [si+64h], 0
		mov	eax, [bp+var_4]
		mov	[si+64h], eax
		mov	ax, [si+5Ch]
		shr	ax, 8
		mov	[si+5Ch], ax
		push	0
		mov	al, [si+62h]
		push	ax
		push	word ptr [si+60h]
		push	word ptr [si+5Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_C22F7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2381	proc far		; CODE XREF: sub_428D0J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C239C
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C23A1

loc_C239C:				; CODE XREF: sub_C2381+9j
		mov	ax, si
		add	ax, 8

loc_C23A1:				; CODE XREF: sub_C2381+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C2381	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
ovr217		ends
