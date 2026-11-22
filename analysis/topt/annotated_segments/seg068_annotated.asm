seg068		segment	para public 'CODE' use16
		assume cs:seg068
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_270B2		proc far

var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 26h
		mov	[bp+var_1], 0
		push	64C6h
		call	sub_99A1
		add	sp, 2
		or	al, al
		jnz	short loc_270CE
		jmp	loc_273A9

loc_270CE:
		mov	al, byte_4EF07
		mov	ah, 0
		cmp	ax, 0Fh
		jz	short loc_2712A
		cmp	ax, 19h
		jnz	short loc_270E0
		jmp	loc_27246

loc_270E0:
		cmp	ax, 20h
		jz	short loc_270E8
		jmp	loc_27316

loc_270E8:
		cmp	byte_4EF06, 1
		jnz	short loc_270FF
		test	byte_4EF09, 0Ch
		jz	short loc_270FB
		mov	ax, 1
		jmp	short loc_270FD

loc_270FB:
		xor	ax, ax

loc_270FD:
		jmp	short loc_27114

loc_270FF:
		cmp	byte_4F6FC, 1
		jz	short loc_2710D
		cmp	byte_4F708, 1
		jnz	short loc_27112

loc_2710D:
		mov	ax, 1
		jmp	short loc_27114

loc_27112:
		xor	ax, ax

loc_27114:
		or	al, al
		jz	short loc_27127
		cmp	byte_49DF1, 0
		jz	short loc_27127
		mov	al, byte_4C377
		xor	al, 1
		mov	byte_4C377, al

loc_27127:
		jmp	loc_27316

loc_2712A:
		mov	byte_4C372, 1
		cmp	byte_4EF06, 1
		jnz	short loc_27146
		test	byte_4EF09, 0Ch
		jz	short loc_27142
		mov	ax, 1
		jmp	short loc_27144

loc_27142:
		xor	ax, ax

loc_27144:
		jmp	short loc_2715B

loc_27146:
		cmp	byte_4F6FC, 1
		jz	short loc_27154
		cmp	byte_4F708, 1
		jnz	short loc_27159

loc_27154:
		mov	ax, 1
		jmp	short loc_2715B

loc_27159:
		xor	ax, ax

loc_2715B:
		or	al, al
		jnz	short loc_27162
		jmp	loc_271FF

loc_27162:
		mov	byte_4C371, 0
		mov	byte_4C372, 0
		cmp	word_4C373, 1
		jnz	short loc_2717B
		mov	word_4C373, 2
		jmp	short loc_27197

loc_2717B:
		cmp	word_4C373, 2
		jnz	short loc_2718A
		mov	word_4C373, 4
		jmp	short loc_27197

loc_2718A:
		cmp	word_4C373, 4
		jnz	short loc_27197
		mov	word_4C373, 1

loc_27197:
		mov	ax, word_4C373
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_4C36D, eax
		cmp	dword_4C36D, 100h
		jle	short loc_271C2
		mov	ax, 1
		jmp	short loc_271C4

loc_271C2:
		xor	ax, ax

loc_271C4:
		or	al, al
		jz	short loc_271CE
		mov	word_4C388, 0

loc_271CE:
		push	word_4C373
		push	39ABh
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
		push	offset unk_4F345
		call	sub_48883
		add	sp, 0Ch
		jmp	short loc_27243

loc_271FF:
		cmp	byte_4EF06, 1
		jnz	short loc_27216
		test	byte_4EF09, 0Ch
		jz	short loc_27212
		mov	ax, 1
		jmp	short loc_27214

loc_27212:
		xor	ax, ax

loc_27214:
		jmp	short loc_2722B

loc_27216:
		cmp	byte_4F6FC, 1
		jz	short loc_27224
		cmp	byte_4F708, 1
		jnz	short loc_27229

loc_27224:
		mov	ax, 1
		jmp	short loc_2722B

loc_27229:
		xor	ax, ax

loc_2722B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_27243
		mov	dword_4F319, 500h
		mov	dword_4F31D, 0FFFFFF00h

loc_27243:
		jmp	loc_27316

loc_27246:
		cmp	byte_4EF06, 1
		jnz	short loc_2725D
		test	byte_4EF09, 0C0h
		jz	short loc_27259
		mov	ax, 1
		jmp	short loc_2725B

loc_27259:
		xor	ax, ax

loc_2725B:
		jmp	short loc_27272

loc_2725D:
		cmp	byte_4F70A, 1
		jz	short loc_2726B
		cmp	byte_4F72B, 1
		jnz	short loc_27270

loc_2726B:
		mov	ax, 1
		jmp	short loc_27272

loc_27270:
		xor	ax, ax

loc_27272:
		or	al, al
		jnz	short loc_27279
		jmp	loc_27314

loc_27279:
		mov	byte_4C34C, 0
		mov	[bp+var_9], 0
		xor	eax, eax
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	[bp+var_E], 0
		mov	eax, dword_4DE15
		mov	[bp+var_12], eax
		push	0
		push	1
		push	ds
		push	offset aGamePaused
		push	word_4F3E1
		push	word_4D36E
		push	ds
		push	offset unk_4F345
		call	sub_48825
		add	sp, 10h
		jmp	short loc_27300

loc_272BB:
		mov	eax, [bp+var_12]
		add	eax, [bp+var_E]
		cmp	eax, dword_4DE15
		ja	short loc_272CF
		mov	ax, 1
		jmp	short loc_272D1

loc_272CF:
		xor	ax, ax

loc_272D1:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_272D9
		jmp	short loc_27300

loc_272D9:
		mov	[bp+var_E], 6
		mov	eax, dword_4DE15
		mov	[bp+var_12], eax
		push	64C6h
		call	sub_99A1
		add	sp, 2
		mov	al, byte_4EF07
		mov	ah, 0
		or	ax, ax
		jz	short loc_27300
		inc	[bp+var_9]

loc_27300:
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jz	short loc_272BB
		push	64C6h
		call	sub_99A1
		add	sp, 2

loc_27314:
		jmp	short loc_27316

loc_27316:
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F41C, eax
		push	6947h
		call	sub_24DF7
		add	sp, 2
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F420, eax
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F424, eax
		push	6947h
		call	sub_24EDD
		add	sp, 2
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F428, eax
		inc	word_4C36B
		push	ds
		push	offset unk_4F345
		call	sub_4882A
		add	sp, 4
		push	6951h
		call	sub_18812
		add	sp, 2
		or	al, al
		jz	short loc_273A9
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F42C, eax
		mov	[bp+var_1], 1

loc_273A9:
		mov	al, [bp+var_1]
		leave
		retf
sub_270B2		endp

; START OF FUNCTION CHUNK FOR sub_270B2
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_270B2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_273B0		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_273B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_273B5		proc far

var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		push	6951h
		call	sub_187CD
		add	sp, 2
		cmp	byte_4C34C, 0
		jnz	short loc_273D3
		jmp	loc_276BC

loc_273D3:
		call	sub_99B8
		mov	si, ax
		cmp	si, 1
		jge	short loc_273E4
		mov	ax, 1
		jmp	short loc_273E6

loc_273E4:
		mov	ax, si

loc_273E6:
		mov	word_4C361, ax
		mov	[bp+var_8], 177000h
		mov	di, word_4C361
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
		jle	short loc_27442
		mov	ax, 1
		jmp	short loc_27444

loc_27442:
		xor	ax, ax

loc_27444:
		or	al, al
		jnz	short loc_273D3
		mov	eax, dword_4F31D
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_27499
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
		mov	dword_4C35D, eax
		mov	eax, dword_4C35D
		sub	dword_4F31D, eax
		mov	eax, dword_4F31D
		sar	eax, 1Fh
		inc	ax

loc_27499:
		cmp	dword_4C36D, 100h
		jnz	short loc_274A9
		mov	ax, 1
		jmp	short loc_274AB

loc_274A9:
		xor	ax, ax

loc_274AB:
		or	al, al
		jz	short loc_274BF
		mov	al, byte_4C371
		mov	ah, 0
		or	ax, ax
		jnz	short loc_274BF
		cmp	word_4C373, 1
		jz	short loc_274C6

loc_274BF:
		cmp	byte_4C38A, 0
		jz	short loc_2750B

loc_274C6:
		mov	[bp+var_28], 400h
		mov	eax, [bp+var_4]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_28]
		cmp	eax, [bp+var_2C]
		jle	short loc_274E5
		mov	ax, 1
		jmp	short loc_274E7

loc_274E5:
		xor	ax, ax

loc_274E7:
		or	al, al
		jz	short loc_274F0
		lea	ax, word ptr [bp+var_28]
		jmp	short loc_274F3

loc_274F0:
		lea	ax, word ptr [bp+var_2C]

loc_274F3:
		mov	[bp+var_2E], ax
		mov	bx, [bp+var_2E]
		mov	eax, [bx]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	dword_4C359, eax
		jmp	loc_2763D

loc_2750B:
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
		mov	dword_4C35D, eax
		mov	eax, dword_4C35D
		sub	dword_4F319, eax
		mov	eax, dword_4F319
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_27563
		mov	[bp+var_42], 4Ch
		mov	eax, [bp+var_42]
		mov	dword_4F31D, eax

loc_27563:
		cmp	word_4C373, 0
		jz	short loc_275B8
		mov	al, byte_4C371
		mov	ah, 0
		or	ax, ax
		jnz	short loc_275B8
		inc	word_4C388
		cmp	word_4C388, 0Ch
		jle	short loc_27584
		mov	word_4C388, 0

loc_27584:
		cmp	word_4C388, 0Ah
		jle	short loc_2759D
		mov	[bp+var_46], 100h
		mov	eax, [bp+var_46]
		mov	dword_4C36D, eax
		jmp	short loc_275B8

loc_2759D:
		mov	ax, word_4C373
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	dword_4C36D, eax

loc_275B8:
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, dword_4C36D
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	dword_4C359, eax
		mov	[bp+var_58], 200h
		mov	eax, dword_4C359
		cmp	eax, [bp+var_58]
		jge	short loc_275FA
		mov	ax, 1
		jmp	short loc_275FC

loc_275FA:
		xor	ax, ax

loc_275FC:
		or	al, al
		jz	short loc_27610
		mov	[bp+var_5C], 200h
		mov	eax, [bp+var_5C]
		mov	dword_4C359, eax

loc_27610:
		mov	[bp+var_60], 1900h
		mov	eax, dword_4C359
		cmp	eax, [bp+var_60]
		jle	short loc_27627
		mov	ax, 1
		jmp	short loc_27629

loc_27627:
		xor	ax, ax

loc_27629:
		or	al, al
		jz	short loc_2763D
		mov	[bp+var_64], 1900h
		mov	eax, [bp+var_64]
		mov	dword_4C359, eax

loc_2763D:
		mov	[bp+var_68], 100h
		mov	eax, [bp+var_68]
		mov	edx, eax
		mov	ecx, dword_4C359
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	dword_4C35D, eax
		mov	eax, dword_4C351
		mov	edx, dword_4C359
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	dword_4C367, eax
		mov	eax, dword_4C34D
		mov	edx, dword_4C35D
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	dword_4C363, eax
		jmp	short loc_276C1

loc_276BC:
		mov	byte_4C34C, 1

loc_276C1:
		mov	dword_49DF4, 0
		pop	di
		pop	si
		leave
		retf
sub_273B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_276CE		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	large 0FFFFFFFFh
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	di
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	di
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		mov	al, [bp+arg_2]
		mov	[bp+var_B], al
		push	1
		push	0
		mov	al, [bp+var_B]
		push	ax
		push	large [bp+var_A]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	al, [bp+var_B]
		mov	[si+4], al
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_A]
		mov	[si+6], eax
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_277A5
		cmp	[bp+var_2], 5A4Ch
		jnz	short loc_2778F
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	large [di+4Dh]
		push	di
		call	sub_43468
		add	sp, 0Ah
		jmp	short loc_277A5

loc_2778F:
		push	large 0FFFFFFFFh
		push	large [bp+var_6]
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	di
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_277A5:
		mov	dx, word ptr [bp+var_14+2]
		mov	ax, word ptr [bp+var_14]
		pop	di
		pop	si
		leave
		retf
sub_276CE		endp

; START OF FUNCTION CHUNK FOR sub_276CE
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_276CE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_277B3		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_6]
		push	large 0FFFFFFFFh
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		mov	al, [bp+arg_4]
		mov	[bp+var_B], al
		push	1
		push	0
		mov	al, [bp+var_B]
		push	ax
		push	large [bp+var_A]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		mov	al, [bp+var_B]
		mov	es:[bx+4], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+5], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_A]
		mov	es:[bx+6], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_278A3
		cmp	[bp+var_2], 5A4Ch
		jnz	short loc_2788D
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	large [si+4Dh]
		push	si
		call	sub_43468
		add	sp, 0Ah
		jmp	short loc_278A3

loc_2788D:
		push	large 0FFFFFFFFh
		push	large [bp+var_6]
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_278A3:
		mov	dx, word ptr [bp+var_14+2]
		mov	ax, word ptr [bp+var_14]
		pop	si
		leave
		retf
sub_277B3		endp

; START OF FUNCTION CHUNK FOR sub_277B3
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_277B3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_278AF		proc far

var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_4C34D, eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		mov	dword_4C351, eax
		mov	[bp+var_C], 347h
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	dword_4C355, eax
		mov	[bp+var_18], 0F00h
		mov	eax, [bp+var_18]
		mov	dword_4C359, eax
		mov	[bp+var_1C], 0F00h
		mov	[bp+var_20], 100h
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [bp+var_1C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		shl	eax, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		sar	eax, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	dword_4C35D, eax
		mov	[bp+var_3C], 100h
		mov	[bp+var_40], 0F00h
		mov	[bp+var_44], 100h
		mov	eax, [bp+var_44]
		mov	edx, eax
		mov	ecx, [bp+var_40]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		shl	eax, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		sar	eax, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	dword_4C363, eax
		mov	[bp+var_64], 100h
		mov	[bp+var_68], 0F00h
		mov	[bp+var_6C], 100h
		mov	eax, [bp+var_6C]
		mov	edx, eax
		mov	ecx, [bp+var_68]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		shl	eax, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		sar	eax, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_64]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		mov	[bp+var_90], 100h
		mov	eax, [bp+var_90]
		mov	edx, eax
		mov	ecx, [bp+var_8C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	dword_4C367, eax
		mov	[bp+var_98], 100h
		mov	eax, [bp+var_98]
		mov	dword_4C36D, eax
		mov	[bp+var_9C], 0
		mov	eax, [bp+var_9C]
		mov	dword_4F314, eax
		mov	dword_4F319, 0
		mov	dword_4F31D, 0
		mov	word_4F321, 0
		push	6947h
		call	sub_24AC0
		add	sp, 2
		push	6951h
		call	sub_48098
		add	sp, 2
		push	ds
		push	offset unk_4F345
		call	sub_48865
		add	sp, 4
		mov	word_4F3F3, 1E4h
		xor	ax, ax
		mov	word_4F3F7, ax
		mov	word_4F3F5, ax
		mov	word_4F3F3, 3772h
		push	6A13h
		call	LightSet_Init_227FA
		add	sp, 2
		mov	[bp+var_A0], 347h
		mov	eax, [bp+var_A0]
		mov	dword_4C378, eax
		mov	dword_4C37C, 73C00h
		mov	[bp+var_A4], 1F1h
		mov	eax, [bp+var_A4]
		mov	dword_4C380, eax
		mov	dword_4C384, 15700h
		leave
		retf
sub_278AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27B5F		proc far

var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	2
		push	6A13h
		call	sub_2285E
		add	sp, 4
		push	ds
		push	offset unk_4F345
		call	sub_4886A
		add	sp, 4
		cmp	byte_4F350, 0
		jz	short loc_27BAC
		cmp	dword_4F34B, 0
		jz	short loc_27BAC
		push	0
		mov	al, byte_4F34F
		push	ax
		mov	eax, dword_4F34B
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_27BAC

loc_27BAC:
		mov	dword_4F34B, 0
		mov	byte_4F350, 0
		mov	dword_4F351, 0
		push	2
		push	6951h
		call	sub_480A2
		add	sp, 4
sub_27B5F		endp
seg068		ends
