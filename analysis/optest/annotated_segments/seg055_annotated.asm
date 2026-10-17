seg055		segment	byte public 'CODE' use16
		assume cs:seg055
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22487	proc far		; CODE XREF: sub_13040+322P

var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 26h
		mov	[bp+var_1], 0
		push	5DFEh
		call	sub_678F
		add	sp, 2
		or	al, al
		jnz	short loc_224A3
		jmp	loc_2277E
; ���������������������������������������������������������������������������

loc_224A3:				; CODE XREF: sub_22487+17j
		mov	al, byte_48E5D
		mov	ah, 0
		cmp	ax, 0Fh
		jz	short loc_224FF
		cmp	ax, 19h
		jnz	short loc_224B5
		jmp	loc_2261B
; ���������������������������������������������������������������������������

loc_224B5:				; CODE XREF: sub_22487+29j
		cmp	ax, 20h	; ' '
		jz	short loc_224BD
		jmp	loc_226EB
; ���������������������������������������������������������������������������

loc_224BD:				; CODE XREF: sub_22487+31j
		cmp	byte_48E5C, 1
		jnz	short loc_224D4
		test	byte_48E5F, 0Ch
		jz	short loc_224D0
		mov	ax, 1
		jmp	short loc_224D2
; ���������������������������������������������������������������������������

loc_224D0:				; CODE XREF: sub_22487+42j
		xor	ax, ax

loc_224D2:				; CODE XREF: sub_22487+47j
		jmp	short loc_224E9
; ���������������������������������������������������������������������������

loc_224D4:				; CODE XREF: sub_22487+3Bj
		cmp	byte_49742, 1
		jz	short loc_224E2
		cmp	byte_4974E, 1
		jnz	short loc_224E7

loc_224E2:				; CODE XREF: sub_22487+52j
		mov	ax, 1
		jmp	short loc_224E9
; ���������������������������������������������������������������������������

loc_224E7:				; CODE XREF: sub_22487+59j
		xor	ax, ax

loc_224E9:				; CODE XREF: sub_22487:loc_224D2j
					; sub_22487+5Ej
		or	al, al
		jz	short loc_224FC
		cmp	byte_443B2, 0
		jz	short loc_224FC
		mov	al, byte_46478
		xor	al, 1
		mov	byte_46478, al

loc_224FC:				; CODE XREF: sub_22487+64j
					; sub_22487+6Bj
		jmp	loc_226EB
; ���������������������������������������������������������������������������

loc_224FF:				; CODE XREF: sub_22487+24j
		mov	byte_46473, 1
		cmp	byte_48E5C, 1
		jnz	short loc_2251B
		test	byte_48E5F, 0Ch
		jz	short loc_22517
		mov	ax, 1
		jmp	short loc_22519
; ���������������������������������������������������������������������������

loc_22517:				; CODE XREF: sub_22487+89j
		xor	ax, ax

loc_22519:				; CODE XREF: sub_22487+8Ej
		jmp	short loc_22530
; ���������������������������������������������������������������������������

loc_2251B:				; CODE XREF: sub_22487+82j
		cmp	byte_49742, 1
		jz	short loc_22529
		cmp	byte_4974E, 1
		jnz	short loc_2252E

loc_22529:				; CODE XREF: sub_22487+99j
		mov	ax, 1
		jmp	short loc_22530
; ���������������������������������������������������������������������������

loc_2252E:				; CODE XREF: sub_22487+A0j
		xor	ax, ax

loc_22530:				; CODE XREF: sub_22487:loc_22519j
					; sub_22487+A5j
		or	al, al
		jnz	short loc_22537
		jmp	loc_225D4
; ���������������������������������������������������������������������������

loc_22537:				; CODE XREF: sub_22487+ABj
		mov	byte_46472, 0
		mov	byte_46473, 0
		cmp	word_46474, 1
		jnz	short loc_22550
		mov	word_46474, 2
		jmp	short loc_2256C
; ���������������������������������������������������������������������������

loc_22550:				; CODE XREF: sub_22487+BFj
		cmp	word_46474, 2
		jnz	short loc_2255F
		mov	word_46474, 4
		jmp	short loc_2256C
; ���������������������������������������������������������������������������

loc_2255F:				; CODE XREF: sub_22487+CEj
		cmp	word_46474, 4
		jnz	short loc_2256C
		mov	word_46474, 1

loc_2256C:				; CODE XREF: sub_22487+C7j
					; sub_22487+D6j ...
		mov	ax, word_46474
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_4646E, eax
		cmp	dword_4646E, 100h
		jle	short loc_22597
		mov	ax, 1
		jmp	short loc_22599
; ���������������������������������������������������������������������������

loc_22597:				; CODE XREF: sub_22487+109j
		xor	ax, ax

loc_22599:				; CODE XREF: sub_22487+10Ej
		or	al, al
		jz	short loc_225A3
		mov	word_46489, 0

loc_225A3:				; CODE XREF: sub_22487+114j
		push	word_46474
		push	346Ch
		lea	ax, [bp+var_26]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_2A], 200h
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		push	ds
		push	offset unk_493A7
		call	sub_42EC3
		add	sp, 0Ch
		jmp	short loc_22618
; ���������������������������������������������������������������������������

loc_225D4:				; CODE XREF: sub_22487+ADj
		cmp	byte_48E5C, 1
		jnz	short loc_225EB
		test	byte_48E5F, 0Ch
		jz	short loc_225E7
		mov	ax, 1
		jmp	short loc_225E9
; ���������������������������������������������������������������������������

loc_225E7:				; CODE XREF: sub_22487+159j
		xor	ax, ax

loc_225E9:				; CODE XREF: sub_22487+15Ej
		jmp	short loc_22600
; ���������������������������������������������������������������������������

loc_225EB:				; CODE XREF: sub_22487+152j
		cmp	byte_49742, 1
		jz	short loc_225F9
		cmp	byte_4974E, 1
		jnz	short loc_225FE

loc_225F9:				; CODE XREF: sub_22487+169j
		mov	ax, 1
		jmp	short loc_22600
; ���������������������������������������������������������������������������

loc_225FE:				; CODE XREF: sub_22487+170j
		xor	ax, ax

loc_22600:				; CODE XREF: sub_22487:loc_225E9j
					; sub_22487+175j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22618
		mov	dword_4937B, 500h
		mov	dword_4937F, 0FFFFFF00h

loc_22618:				; CODE XREF: sub_22487+14Bj
					; sub_22487+17Dj
		jmp	loc_226EB
; ���������������������������������������������������������������������������

loc_2261B:				; CODE XREF: sub_22487+2Bj
		cmp	byte_48E5C, 1
		jnz	short loc_22632
		test	byte_48E5F, 0C0h
		jz	short loc_2262E
		mov	ax, 1
		jmp	short loc_22630
; ���������������������������������������������������������������������������

loc_2262E:				; CODE XREF: sub_22487+1A0j
		xor	ax, ax

loc_22630:				; CODE XREF: sub_22487+1A5j
		jmp	short loc_22647
; ���������������������������������������������������������������������������

loc_22632:				; CODE XREF: sub_22487+199j
		cmp	byte_49750, 1
		jz	short loc_22640
		cmp	byte_49771, 1
		jnz	short loc_22645

loc_22640:				; CODE XREF: sub_22487+1B0j
		mov	ax, 1
		jmp	short loc_22647
; ���������������������������������������������������������������������������

loc_22645:				; CODE XREF: sub_22487+1B7j
		xor	ax, ax

loc_22647:				; CODE XREF: sub_22487:loc_22630j
					; sub_22487+1BCj
		or	al, al
		jnz	short loc_2264E
		jmp	loc_226E9
; ���������������������������������������������������������������������������

loc_2264E:				; CODE XREF: sub_22487+1C2j
		mov	byte_4644D, 0
		mov	[bp+var_9], 0
		xor	eax, eax
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	[bp+var_E], 0
		mov	eax, dword_47ABB
		mov	[bp+var_12], eax
		push	0
		push	1
		push	ds
		push	offset aGamePaused ; "game paused"
		push	word_49443
		push	word_46F46
		push	ds
		push	offset unk_493A7
		call	sub_42E65
		add	sp, 10h
		jmp	short loc_226D5
; ���������������������������������������������������������������������������

loc_22690:				; CODE XREF: sub_22487+255j
		mov	eax, [bp+var_12]
		add	eax, [bp+var_E]
		cmp	eax, dword_47ABB
		ja	short loc_226A4
		mov	ax, 1
		jmp	short loc_226A6
; ���������������������������������������������������������������������������

loc_226A4:				; CODE XREF: sub_22487+216j
		xor	ax, ax

loc_226A6:				; CODE XREF: sub_22487+21Bj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_226AE
		jmp	short loc_226D5
; ���������������������������������������������������������������������������

loc_226AE:				; CODE XREF: sub_22487+223j
		mov	[bp+var_E], 6
		mov	eax, dword_47ABB
		mov	[bp+var_12], eax
		push	5DFEh
		call	sub_678F
		add	sp, 2
		mov	al, byte_48E5D
		mov	ah, 0
		or	ax, ax
		jz	short loc_226D5
		inc	[bp+var_9]

loc_226D5:				; CODE XREF: sub_22487+207j
					; sub_22487+225j ...
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jz	short loc_22690
		push	5DFEh
		call	sub_678F
		add	sp, 2

loc_226E9:				; CODE XREF: sub_22487+1C4j
		jmp	short $+2

loc_226EB:				; CODE XREF: sub_22487+33j
					; sub_22487:loc_224FCj	...
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4947E, eax
		push	6369h
		call	sub_20165
		add	sp, 2
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_49482, eax
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_49486, eax
		push	6369h
		call	sub_202E5
		add	sp, 2
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4948A, eax
		inc	word_4646C
		push	ds
		push	offset unk_493A7
		call	sub_42E6A
		add	sp, 4
		push	6373h
		call	sub_13BC8
		add	sp, 2
		or	al, al
		jz	short loc_2277E
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4948E, eax
		mov	[bp+var_1], 1

loc_2277E:				; CODE XREF: sub_22487+19j
					; sub_22487+2DFj
		mov	al, [bp+var_1]
		leave
		retf
sub_22487	endp

; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2278A	proc far		; CODE XREF: sub_13040+327P

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
var_48		= word ptr -48h
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
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
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		push	6373h
		call	sub_13B83
		add	sp, 2
		cmp	byte_4644D, 0
		jnz	short loc_227A8
		jmp	loc_22A91
; ���������������������������������������������������������������������������

loc_227A8:				; CODE XREF: sub_2278A+19j
					; sub_2278A+91j
		call	sub_67A6
		mov	si, ax
		cmp	si, 1
		jge	short loc_227B9
		mov	ax, 1
		jmp	short loc_227BB
; ���������������������������������������������������������������������������

loc_227B9:				; CODE XREF: sub_2278A+28j
		mov	ax, si

loc_227BB:				; CODE XREF: sub_2278A+2Dj
		mov	word_46462, ax
		mov	[bp+var_8], 177000h
		mov	di, word_46462
		movsx	eax, di
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		mov	[bp+var_18], 1900h
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_18]
		jle	short loc_22817
		mov	ax, 1
		jmp	short loc_22819
; ���������������������������������������������������������������������������

loc_22817:				; CODE XREF: sub_2278A+86j
		xor	ax, ax

loc_22819:				; CODE XREF: sub_2278A+8Bj
		or	al, al
		jnz	short loc_227A8
		mov	eax, dword_4937F
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_2286E
		mov	[bp+var_1C], 100h
		mov	eax, [bp+var_1C]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	dword_4645E, eax
		mov	eax, dword_4645E
		sub	dword_4937F, eax
		mov	eax, dword_4937F
		sar	eax, 1Fh
		inc	ax

loc_2286E:				; CODE XREF: sub_2278A+9Ej
		cmp	dword_4646E, 100h
		jnz	short loc_2287E
		mov	ax, 1
		jmp	short loc_22880
; ���������������������������������������������������������������������������

loc_2287E:				; CODE XREF: sub_2278A+EDj
		xor	ax, ax

loc_22880:				; CODE XREF: sub_2278A+F2j
		or	al, al
		jz	short loc_22894
		mov	al, byte_46472
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22894
		cmp	word_46474, 1
		jz	short loc_2289B

loc_22894:				; CODE XREF: sub_2278A+F8j
					; sub_2278A+101j
		cmp	byte_4648B, 0
		jz	short loc_228E0

loc_2289B:				; CODE XREF: sub_2278A+108j
		mov	[bp+var_28], 400h
		mov	eax, [bp+var_4]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_28]
		cmp	eax, [bp+var_2C]
		jle	short loc_228BA
		mov	ax, 1
		jmp	short loc_228BC
; ���������������������������������������������������������������������������

loc_228BA:				; CODE XREF: sub_2278A+129j
		xor	ax, ax

loc_228BC:				; CODE XREF: sub_2278A+12Ej
		or	al, al
		jz	short loc_228C5
		lea	ax, [bp+var_28]
		jmp	short loc_228C8
; ���������������������������������������������������������������������������

loc_228C5:				; CODE XREF: sub_2278A+134j
		lea	ax, [bp+var_2C]

loc_228C8:				; CODE XREF: sub_2278A+139j
		mov	[bp+var_2E], ax
		mov	bx, [bp+var_2E]
		mov	eax, [bx]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	dword_4645A, eax
		jmp	loc_22A12
; ���������������������������������������������������������������������������

loc_228E0:				; CODE XREF: sub_2278A+10Fj
		mov	[bp+var_36], 100h
		mov	eax, [bp+var_36]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	dword_4645E, eax
		mov	eax, dword_4645E
		sub	dword_4937B, eax
		mov	eax, dword_4937B
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_22938
		mov	[bp+var_42], 4Ch ; 'L'
		mov	eax, [bp+var_42]
		mov	dword_4937F, eax

loc_22938:				; CODE XREF: sub_2278A+19Cj
		cmp	word_46474, 0
		jz	short loc_2298D
		mov	al, byte_46472
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2298D
		inc	word_46489
		cmp	word_46489, 0Ch
		jle	short loc_22959
		mov	word_46489, 0

loc_22959:				; CODE XREF: sub_2278A+1C7j
		cmp	word_46489, 0Ah
		jle	short loc_22972
		mov	[bp+var_46], 100h
		mov	eax, [bp+var_46]
		mov	dword_4646E, eax
		jmp	short loc_2298D
; ���������������������������������������������������������������������������

loc_22972:				; CODE XREF: sub_2278A+1D4j
		mov	ax, word_46474
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	dword_4646E, eax

loc_2298D:				; CODE XREF: sub_2278A+1B3j
					; sub_2278A+1BCj ...
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, dword_4646E
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	dword_4645A, eax
		mov	[bp+var_58], 200h
		mov	eax, dword_4645A
		cmp	eax, [bp+var_58]
		jge	short loc_229CF
		mov	ax, 1
		jmp	short loc_229D1
; ���������������������������������������������������������������������������

loc_229CF:				; CODE XREF: sub_2278A+23Ej
		xor	ax, ax

loc_229D1:				; CODE XREF: sub_2278A+243j
		or	al, al
		jz	short loc_229E5
		mov	[bp+var_5C], 200h
		mov	eax, [bp+var_5C]
		mov	dword_4645A, eax

loc_229E5:				; CODE XREF: sub_2278A+249j
		mov	[bp+var_60], 1900h
		mov	eax, dword_4645A
		cmp	eax, [bp+var_60]
		jle	short loc_229FC
		mov	ax, 1
		jmp	short loc_229FE
; ���������������������������������������������������������������������������

loc_229FC:				; CODE XREF: sub_2278A+26Bj
		xor	ax, ax

loc_229FE:				; CODE XREF: sub_2278A+270j
		or	al, al
		jz	short loc_22A12
		mov	[bp+var_64], 1900h
		mov	eax, [bp+var_64]
		mov	dword_4645A, eax

loc_22A12:				; CODE XREF: sub_2278A+153j
					; sub_2278A+276j
		mov	[bp+var_68], 100h
		mov	eax, [bp+var_68]
		mov	edx, eax
		mov	ecx, dword_4645A
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	dword_4645E, eax
		mov	eax, dword_46452
		mov	edx, dword_4645A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	dword_46468, eax
		mov	eax, dword_4644E
		mov	edx, dword_4645E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	dword_46464, eax
		jmp	short loc_22A96
; ���������������������������������������������������������������������������

loc_22A91:				; CODE XREF: sub_2278A+1Bj
		mov	byte_4644D, 1

loc_22A96:				; CODE XREF: sub_2278A+305j
		mov	dword_443B3, 0
		pop	di
		pop	si
		leave
		retf
sub_2278A	endp

; ���������������������������������������������������������������������������

loc_22AA3:				; DATA XREF: dseg:5916o
		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		mov	dword_4644E, eax
		mov	dword ptr [bp-8], 100h
		mov	eax, [bp-8]
		mov	dword_46452, eax
		mov	dword ptr [bp-0Ch], 347h
		mov	dword ptr [bp-10h], 100h
		mov	eax, [bp-0Ch]
		mov	edx, eax
		mov	ecx, [bp-10h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	dword_46456, eax
		mov	dword ptr [bp-18h], 0F00h
		mov	eax, [bp-18h]
		mov	dword_4645A, eax
		mov	dword ptr [bp-1Ch], 0F00h
		mov	dword ptr [bp-20h], 100h
		mov	eax, [bp-20h]
		mov	edx, eax
		mov	ecx, [bp-1Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		mov	[bp-28h], eax
		mov	eax, [bp-28h]
		shl	eax, 8
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		mov	[bp-30h], eax
		mov	eax, [bp-30h]
		sar	eax, 8
		mov	[bp-34h], eax
		mov	eax, [bp-34h]
		mov	[bp-38h], eax
		mov	eax, [bp-38h]
		mov	dword_4645E, eax
		mov	dword ptr [bp-3Ch], 100h
		mov	dword ptr [bp-40h], 0F00h
		mov	dword ptr [bp-44h], 100h
		mov	eax, [bp-44h]
		mov	edx, eax
		mov	ecx, [bp-40h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-48h], eax
		mov	eax, [bp-48h]
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]
		shl	eax, 8
		mov	[bp-50h], eax
		mov	eax, [bp-50h]
		mov	[bp-54h], eax
		mov	eax, [bp-54h]
		sar	eax, 8
		mov	[bp-58h], eax
		mov	eax, [bp-58h]
		mov	[bp-5Ch], eax
		mov	eax, [bp-3Ch]
		mov	edx, [bp-5Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-60h], eax
		mov	eax, [bp-60h]
		mov	dword_46464, eax
		mov	dword ptr [bp-64h], 100h
		mov	dword ptr [bp-68h], 0F00h
		mov	dword ptr [bp-6Ch], 100h
		mov	eax, [bp-6Ch]
		mov	edx, eax
		mov	ecx, [bp-68h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-70h], eax
		mov	eax, [bp-70h]
		mov	[bp-74h], eax
		mov	eax, [bp-74h]
		shl	eax, 8
		mov	[bp-78h], eax
		mov	eax, [bp-78h]
		mov	[bp-7Ch], eax
		mov	eax, [bp-7Ch]
		sar	eax, 8
		mov	[bp-80h], eax
		mov	eax, [bp-80h]
		mov	[bp-84h], eax
		mov	eax, [bp-64h]
		mov	edx, [bp-84h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-88h], eax
		mov	eax, [bp-88h]
		mov	[bp-8Ch], eax
		mov	dword ptr [bp-90h], 100h
		mov	eax, [bp-90h]
		mov	edx, eax
		mov	ecx, [bp-8Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-94h], eax
		mov	eax, [bp-94h]
		mov	dword_46468, eax
		mov	dword ptr [bp-98h], 100h
		mov	eax, [bp-98h]
		mov	dword_4646E, eax
		mov	dword ptr [bp-9Ch], 0
		mov	eax, [bp-9Ch]
		mov	dword_49376, eax
		mov	dword_4937B, 0
		mov	dword_4937F, 0
		mov	word_49383, 0
		push	6369h
		call	sub_1FE2E
		add	sp, 2
		push	6373h
		call	sub_42768
		add	sp, 2
		push	ds
		push	offset unk_493A7
		call	sub_42EA5
		add	sp, 4
		mov	word_49455, 2BDh
		xor	ax, ax
		mov	word_49459, ax
		mov	word_49457, ax
		mov	word_49455, 31A0h
		push	6435h
		call	LightSet_Init_1D72E
		add	sp, 2
		mov	dword ptr [bp-0A0h], 347h
		mov	eax, [bp-0A0h]
		mov	dword_46479, eax
		mov	dword_4647D, 73C00h
		mov	dword ptr [bp-0A4h], 1F1h
		mov	eax, [bp-0A4h]
		mov	dword_46481, eax
		mov	dword_46485, 15700h
		leave
		retf
; ���������������������������������������������������������������������������

loc_22D53:				; DATA XREF: dseg:59C4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	2
		push	6435h
		call	sub_1D792
		add	sp, 4
		push	ds
		push	offset unk_493A7
		call	sub_42EAA
		add	sp, 4
		cmp	byte_493B2, 0
		jz	short loc_22DA0
		cmp	dword_493AD, 0
		jz	short loc_22DA0
		push	0
		mov	al, byte_493B1
		push	ax
		mov	eax, dword_493AD
		mov	[bp-4],	eax
		lea	ax, [bp-4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_22DA0:				; CODE XREF: seg055:08F7j seg055:08FFj
		mov	dword_493AD, 0
		mov	byte_493B2, 0
		mov	dword_493B3, 0
		push	2
		push	6373h
		call	sub_42772
		add	sp, 4
		push	2
		push	6369h
		call	sub_1FE59
		add	sp, 4
		leave
		retf
seg055		ends
