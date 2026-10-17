ovr224		segment	para public 'OVERLAY' use16
		assume cs:ovr224
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3640	proc far		; CODE XREF: sub_42B28J

var_F8		= word ptr -0F8h
var_A8		= word ptr -0A8h
var_4B		= dword	ptr -4Bh
var_47		= dword	ptr -47h
var_43		= dword	ptr -43h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_A8], 556h
		mov	[bp+var_47], 100h
		mov	[bp+var_4B], 0
		mov	[bp+var_A8], 56Eh
		mov	[bp+var_2C], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		movsx	eax, ax
		mov	[bp+var_43], eax
		push	seg seg168
		push	offset a_iff_0	; ".IFF"
		push	ds
		push	[bp+arg_0]
		push	ds
		push	offset aMissions ; "MISSIONS"
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	large 444C5257h
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_InitAndValidate_3BE3D
		add	sp, 8
		or	ax, ax
		jz	short loc_C36D3
		lea	ax, [bp+var_A8]
		push	ax
		nop
		push	cs
		call	near ptr sub_C36F7
		add	sp, 2
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_C36D3:				; CODE XREF: sub_C3640+77j
		mov	[bp+var_A8], 56Eh
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		leave
		retf
sub_C3640	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C36F7	proc far		; CODE XREF: sub_42B23J sub_C3640+80p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_4644C, 0
		jz	short loc_C373F
		mov	byte_4644D, 1
		mov	byte_46477, 0
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_4646E, eax
		mov	byte_46472, 0
		mov	byte_46473, 0
		mov	word_46474, 1
		push	si
		nop
		push	cs
		call	near ptr sub_C39DE
		add	sp, 2
		jmp	loc_C3870
; ���������������������������������������������������������������������������

loc_C373F:				; CODE XREF: sub_C36F7+10j
		mov	di, 320h
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C376A
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	di, ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_C376A:				; CODE XREF: sub_C36F7+5Ej
		push	0
		push	large 5A524F48h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C37B3
		push	si
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dword_464C7, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dword_464CB, eax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_C37B3:				; CODE XREF: sub_C36F7+86j
		push	di
		push	62A6h
		call	sub_1D483
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_C39E3
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_C3874
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_C38BE
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_C39DE
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_C38C3
		add	sp, 2
		push	ds
		push	offset unk_493A7
		call	sub_42EAF
		add	sp, 4
		push	0
		push	large 4C414353h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C386B
		push	si
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dword_46452, eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, dword_46452
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	dword_4644E, eax
		mov	eax, dword_46456
		mov	edx, dword_46452
		imul	edx
		shrd	eax, edx, 8
		mov	dword_46456, eax

loc_C386B:				; CODE XREF: sub_C36F7+114j
		mov	byte_4644C, 1

loc_C3870:				; CODE XREF: sub_C36F7+45j
		pop	di
		pop	si
		leave
		retf
sub_C36F7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3874	proc far		; CODE XREF: sub_42B00J sub_C36F7+D4p

var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_A]
		push	ax
		call	sub_C7A3
		add	sp, 2
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C38BB
		push	si
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	62D0h
		call	sub_42911
		add	sp, 4

loc_C38BB:				; CODE XREF: sub_C3874+29j
		pop	si
		leave
		retf
sub_C3874	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C38BE	proc far		; CODE XREF: sub_42B0AJ sub_C36F7+DDp
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_C38BE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C38C3	proc far		; CODE XREF: sub_42B14J sub_C36F7+EFp

var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	large 5448474Ch
		push	di
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C38E6
		jmp	loc_C39DA
; ���������������������������������������������������������������������������

loc_C38E6:				; CODE XREF: sub_C38C3+1Ej
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	6435h
		call	sub_1D7F4
		add	sp, 4
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 64h	; 'd'
		jge	short loc_C3917
		mov	ax, [bp+var_E]
		jmp	short loc_C391A
; ���������������������������������������������������������������������������

loc_C3917:				; CODE XREF: sub_C38C3+4Dj
		mov	ax, 64h	; 'd'

loc_C391A:				; CODE XREF: sub_C38C3+52j
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		imul	eax, 0FFh
		mov	ebx, 64h ; 'd'
		cdq
		idiv	ebx
		push	ax
		push	6435h
		call	LightSet_SetIntensityPercent_1D7CD
		add	sp, 4
		jmp	short loc_C39A7
; ���������������������������������������������������������������������������

loc_C3942:				; CODE XREF: sub_C38C3+114j
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	al, [bp+var_2]
		push	ax
		sub	sp, 4
		mov	ax, [bp+var_4]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_1E], eax
		sub	sp, 4
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_22], eax
		sub	sp, 4
		mov	ax, [bp+var_8]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_26], eax
		push	[bp+var_A]
		push	6435h
		call	sub_1D88F
		add	sp, 12h

loc_C39A7:				; CODE XREF: sub_C38C3+7Dj
		test	word ptr [di+72h], 1
		jz	short loc_C39C2
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_C39C0
		inc	dword ptr [di+65h]
		jmp	short $+2

loc_C39C0:				; CODE XREF: sub_C38C3+F5j
		jmp	short $+2

loc_C39C2:				; CODE XREF: sub_C38C3+E9j
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_C39D1
		mov	ax, 1
		jmp	short loc_C39D3
; ���������������������������������������������������������������������������

loc_C39D1:				; CODE XREF: sub_C38C3+107j
		xor	ax, ax

loc_C39D3:				; CODE XREF: sub_C38C3+10Cj
		or	ax, ax
		jnz	short loc_C39DA
		jmp	loc_C3942
; ���������������������������������������������������������������������������

loc_C39DA:				; CODE XREF: sub_C38C3+20j
					; sub_C38C3+112j
		pop	di
		pop	si
		leave
		retf
sub_C38C3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C39DE	proc far		; CODE XREF: sub_42B05J sub_C36F7+3Fp	...
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_C39DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C39E3	proc far		; CODE XREF: sub_42B0FJ sub_C36F7+CBp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	6373h
		call	sub_4276D
		add	sp, 4
		pop	bp
		retf
sub_C39E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C39F6	proc far		; CODE XREF: sub_42B19J sub_C3A4F+10p
		push	bp
		mov	bp, sp
		cmp	byte_4644C, 0
		jz	short loc_C3A48
		push	6363h
		call	sub_221E9
		add	sp, 2
		push	62A6h
		call	Widget_DestructTwoLabels
		add	sp, 2
		push	6373h
		call	sub_427CC
		add	sp, 2
		push	6435h
		call	sub_1D74C
		add	sp, 2
		push	6369h
		call	sub_2036D
		add	sp, 2
		push	ds
		push	offset unk_493A7
		call	sub_42EAA
		add	sp, 4
		mov	byte_4644C, 0

loc_C3A48:				; CODE XREF: sub_C39F6+8j
		pop	bp
		retf
sub_C39F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3A4A	proc far		; CODE XREF: sub_42B1EJ
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_C3A4A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3A4F	proc far		; CODE XREF: sub_42B2DJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C3A71
		push	cs
		call	near ptr sub_C39F6
		test	di, 1
		jz	short loc_C3A71
		push	si
		call	sub_308
		add	sp, 2

loc_C3A71:				; CODE XREF: sub_C3A4F+Dj
					; sub_C3A4F+17j
		pop	di
		pop	si
		pop	bp
		retf
sub_C3A4F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3A75	proc far		; CODE XREF: sub_42B32J

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	6373h
		call	sub_42790
		add	sp, 2
		mov	[bp+var_2], ax
		mov	dword_443B3, 0
		mov	word_4646C, 0
		push	62D0h
		call	VGA_LoadPalette
		add	sp, 2
		mov	ax, [bp+var_2]
		leave
		retf
sub_C3A75	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3AB8	proc far		; CODE XREF: sub_42B37J
		push	bp
		mov	bp, sp
		mov	dword_464C7, 4E2000h
		mov	dword_464CB, 0FA000h
		pop	bp
		retf
sub_C3AB8	endp

ovr224		ends
