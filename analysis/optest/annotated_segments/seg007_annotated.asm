seg007		segment	byte public 'CODE' use16
		assume cs:seg007
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6734	proc far		; CODE XREF: sub_29C6B+9BP
					; Gameflow_WriteMissionOrder_4BBF7+7D5P ...

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

; FUNCTION CHUNK AT 004E SIZE 00000002 BYTES

		push	bp

loc_6735:				; DATA XREF: seg170:00F6o
		mov	bp, sp
		sub	sp, 50h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		lea	ax, [bp+var_50]
		push	ax
		call	StreamReader_ParseFormattedValueB_3BA22
		add	sp, 2
		or	ax, ax
		jz	short loc_6763
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short locret_677E
; ���������������������������������������������������������������������������

loc_6763:				; CODE XREF: sub_6734+27j
		push	0
		lea	ax, [bp+var_50]
		push	ax
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_677A
		mov	ax, 1
		jmp	short locret_677C
; ���������������������������������������������������������������������������

loc_677A:				; CODE XREF: sub_6734+3Fj
		xor	ax, ax

locret_677C:				; CODE XREF: sub_6734+44j
		leave
		retf
sub_6734	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_6734

locret_677E:				; CODE XREF: sub_6734+2Dj
		leave
		retf
; END OF FUNCTION CHUNK	FOR sub_6734
; ���������������������������������������������������������������������������

loc_6780:				; DATA XREF: dseg:11BCo dseg:11C0o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_6785:				; DATA XREF: sub_5D287+8F0o
		push	bp
		mov	bp, sp
		inc	dword_443B3
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_678F	proc far		; CODE XREF: sub_22487+DP
					; sub_22487+23AP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	byte_443BB, 0
		jz	short loc_67A0
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_67A0:				; CODE XREF: sub_678F+Bj
		mov	al, 1
		pop	bp
		retf
sub_678F	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_67A6	proc far		; CODE XREF: seg046:011CP seg046:0165P ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		pushf
		cli
		mov	eax, dword_443B3
		mov	[bp+var_4], eax
		mov	dx, 26D7h

loc_67B9:				; CODE XREF: sub_67A6+3Ej
		mov	al, 0C2h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		jmp	short $+2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	ch, al
		jmp	short $+2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bl, al
		jmp	short $+2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bh, al
		jmp	short $+2
		mov	al, 0Ah
		out	20h, al		; Interrupt controller,	8259A.
		jmp	short $+2
		in	al, 20h		; Interrupt controller,	8259A.
		test	al, 1
		jz	short loc_67E1
		mov	ax, dx
		jmp	short loc_67F8
; ���������������������������������������������������������������������������

loc_67E1:				; CODE XREF: sub_67A6+35j
		test	ch, 40h
		jnz	short loc_67B9
		xor	ax, ax
		shr	bx, 1
		shl	ch, 1
		jnb	short loc_67F2
		mov	ax, dx
		shr	ax, 1

loc_67F2:				; CODE XREF: sub_67A6+46j
		add	ax, bx
		neg	ax
		add	ax, dx

loc_67F8:				; CODE XREF: sub_67A6+39j
		popf
		movzx	eax, ax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		imul	eax, 26D7h
		add	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	ebx, 0C6h ; '�'
		cdq
		idiv	ebx
		shld	edx, eax, 10h
		leave
		retf
sub_67A6	endp

; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
byte_682C	db 50h,	53h, 51h, 52h, 6, 1Eh, 56h, 57h, 55h, 0BDh ; DATA XREF:	sub_6846+2Co
		dw seg dseg
		db 8Eh,	0DDh, 8Bh, 0ECh, 5Dh, 5Fh, 5Eh,	1Fh, 7,	5Ah, 59h
		db 5Bh,	58h, 0CFh

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6846	proc far		; CODE XREF: seg007:01DAp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6861
		push	12h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_6882

loc_6861:				; CODE XREF: sub_6846+9j
		push	si
		call	JoystickCallback_Construct_3DC46
		add	sp, 2
		push	0
		push	0
		push	si
		push	seg seg007
		push	offset byte_682C
		push	23h ; '#'
		push	66CCh
		call	JoystickCallback_RegisterInChain_3DD45
		add	sp, 0Eh

loc_6882:				; CODE XREF: sub_6846+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6846	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_688A:				; DATA XREF: dseg:58CEo
		push	bp
		mov	bp, sp
		mov	word_48E1E, 13A4h
		mov	ax, word_4703A
		mov	word_48E20, ax
		mov	word_4703A, 5DFEh
		mov	dword_48E23, 0
		mov	byte_48E27, 2
		mov	byte_48E28, 0
		mov	dword_48E29, 0
		mov	word_48E2D, 0
		mov	word_48E33, 0
		mov	word_48E39, 0
		mov	word_48E1E, 13A8h
		mov	byte_48E3B, 3
		mov	word_48E3C, 13A4h
		mov	ax, word_4703A
		mov	word_48E3E, ax
		mov	word_4703A, 5E1Ch
		mov	word_48E40, 139Ch
		mov	word_48E3C, 13A0h
		mov	byte_48E42, 1
		push	5E1Bh
		call	TextRenderer_EncodeCharA_2E94F
		add	sp, 2
		push	5E26h
		push	cs
		call	near ptr sub_6846
		add	sp, 2
		push	5E38h
		call	TextScrollDisplayB_ConstructAndReset_3F619
		add	sp, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_691D:				; DATA XREF: dseg:599Ao
		push	bp
		mov	bp, sp
		push	5E38h
		call	ResourceHandle_IsValid_3ED7F
		add	sp, 2
		push	2
		push	5E26h
		call	sub_3DC90
		add	sp, 4
		mov	word_48E1E, 13A8h
		push	5DFEh
		call	sub_42274
		add	sp, 2
		push	0
		push	5E03h
		call	sub_422D4
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_6958:				; DATA XREF: dseg:13A0o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFFh
		jmp	far ptr	loc_2ECF0
seg007		ends
