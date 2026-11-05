ovr391		segment	para public 'OVERLAY' use16
		assume cs:ovr391
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD9D0		proc far

var_48		= word ptr -48h
var_2A		= word ptr -2Ah
var_1C		= word ptr -1Ch
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_DD9D3:
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	seg seg008
		push	offset loc_5E68
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	0
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_22A2
		add	sp, 6
		or	ax, ax
		jz	short loc_DDA06
		jmp	loc_DDB0A

loc_DDA06:
		push	2Eh
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_DDA1D
		mov	byte ptr [di], 0

loc_DDA1D:
		push	2Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		push	ds
		push	ax
		lea	ax, [bp+var_48]
		push	ss
		push	ax
		mov	cx, 2Bh
		call	CRT_Fmemcpy
		jmp	loc_DDAEF

loc_DDA39:
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		push	2Eh
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_DDA59
		mov	byte ptr [di], 0

loc_DDA59:
		push	2Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		push	ds
		push	ax
		lea	ax, [bp+var_48]
		push	ss
		push	ax
		mov	cx, 2Bh
		call	CRT_Fmemcpy
		movzx	eax, word ptr [di+18h]
		shl	eax, 10h
		movzx	edx, word ptr [di+16h]
		add	eax, edx
		mov	[bp+var_8], eax
		jmp	short loc_DDAD5

loc_DDA89:
		mov	bx, [bp+var_4]
		mov	bx, [bx+4]
		movzx	eax, word ptr [bx+18h]
		shl	eax, 10h
		mov	bx, [bp+var_4]
		mov	bx, [bx+4]
		movzx	edx, word ptr [bx+16h]
		add	eax, edx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_C]
		jbe	short loc_DDAD5
		push	di
		push	0
		nop
		push	cs
		call	near ptr sub_DF5BD
		add	sp, 4
		mov	[bp+var_E], ax
		push	ax
		push	[bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_DF310
		add	sp, 6
		mov	[bp+var_1], 1
		jmp	short loc_DDAE6

loc_DDAD5:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jnz	short loc_DDA89

loc_DDAE6:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DDAF9

loc_DDAEF:
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_DF3DD
		add	sp, 4

loc_DDAF9:
		lea	ax, [bp+var_48]
		push	ax
		call	sub_22D5
		pop	cx
		or	ax, ax
		jnz	short loc_DDB0A
		jmp	loc_DDA39

loc_DDB0A:
		push	si
		nop
		push	cs
		call	near ptr sub_DF586
		pop	cx
		mov	[si+6], ax
		pop	di
		pop	si
		leave
		retf
sub_DD9D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DDB18		proc far

var_52		= word ptr -52h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	seg seg008
		push	offset loc_5E6E
		lea	ax, [bp+var_52]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [si+6]
		mov	[bp+var_2], ax
		cmp	word ptr [si+6], 0
		jz	short loc_DDB63
		push	4
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		add	ax, 1Eh
		push	ax
		push	large 32001Eh
		lea	ax, [bp+var_52]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ch

loc_DDB63:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jnz	short loc_DDB77
		jmp	loc_DDC29

loc_DDB77:
		push	4
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		add	ax, 1Eh
		push	ax
		push	large 3C001Eh
		lea	ax, [bp+var_52]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ch
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jnz	short loc_DDBAA
		jmp	loc_DDC29

loc_DDBAA:
		push	4
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		add	ax, 1Eh
		push	ax
		push	large 46001Eh
		lea	ax, [bp+var_52]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ch
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jz	short loc_DDC29
		push	4
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		add	ax, 1Eh
		push	ax
		push	large 50001Eh
		lea	ax, [bp+var_52]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ch
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jz	short loc_DDC29
		push	4
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		add	ax, 1Eh
		push	ax
		push	large 5A001Eh
		lea	ax, [bp+var_52]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ch

loc_DDC29:
		pop	di
		pop	si
		leave
		retf
sub_DDB18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DDC2D		proc far

var_1C8		= word ptr -1C8h
var_144		= word ptr -144h
var_F4		= word ptr -0F4h
var_E6		= word ptr -0E6h
var_BA		= word ptr -0BAh
var_B8		= word ptr -0B8h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_92		= word ptr -92h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_2B		= word ptr -2Bh
var_29		= word ptr -29h
var_27		= dword ptr -27h
var_1E		= word ptr -1Eh
var_16		= word ptr -16h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1C8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	[bp+var_2], 0Eh
		mov	al, [si+8]
		mov	ah, 0
		mov	[bp+var_4], ax
		push	large 9400F8h
		push	large 460046h
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_A0], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_9C], 0
		mov	[bp+var_9A], 0
		mov	[bp+var_98], 0B2h
		mov	[bp+var_96], 4Eh
		push	0
		lea	ax, [bp+var_A0]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75D04
		add	sp, 6
		mov	[bp+var_6], 28h
		mov	[bp+var_8], 14h
		mov	[bp+var_A], 55h
		mov	[bp+var_C], 14h
		push	seg seg008
		push	offset loc_5E69
		lea	ax, [bp+var_144]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	[bp+arg_6]
		lea	ax, [bp+var_F4]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	0
		lea	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		call	sub_22A2
		add	sp, 6
		mov	[bp+var_E], ax
		cmp	byte ptr [si+8], 1
		jnz	short loc_DDD6A
		cmp	[bp+var_E], 0
		jnz	short loc_DDD36
		mov	[bp+var_4], 2
		mov	[bp+var_6], 1Eh
		mov	[bp+var_8], 14h
		mov	[bp+var_A], 5Fh
		mov	[bp+var_C], 14h
		jmp	short loc_DDD6A

loc_DDD36:
		push	word_7D14D
		nop
		push	cs
		call	near ptr sub_DEE62
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 7D0h
		jge	short loc_DDD6A
		push	seg seg008
		push	offset loc_5EBA
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_1C8]
		push	ax
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_DDD6A:
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_A0]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		cmp	[bp+var_E], 0
		jnz	short loc_DDD9A
		jmp	loc_DDE4C

loc_DDD9A:
		cmp	byte ptr [si+8], 0
		jz	short loc_DDDA3
		jmp	loc_DDE4C

loc_DDDA3:
		push	seg seg008
		push	offset loc_5F24
		lea	ax, [bp+var_144]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 140023h
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75D4A
		add	sp, 8
		push	large 10024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DDE0C
		push	large 140028h
		push	large 2D003Ch
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[si+20h], ds
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0Bh
		mov	ax, si
		jmp	short loc_DDE0E

loc_DDE0C:
		mov	ax, si

loc_DDE0E:
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	seg seg008
		push	offset loc_5F38
		lea	ax, [bp+var_144]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 4002Dh
		push	3Ch
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		jmp	loc_DDFD3

loc_DDE4C:
		push	large 150024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_DDE8A
		push	large 140028h
		push	large 2D0035h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[di+20h], ds
		mov	[di+1Eh], ax
		mov	word ptr [di+22h], 9
		mov	ax, di
		jmp	short loc_DDE8C

loc_DDE8A:
		mov	ax, di

loc_DDE8C:
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 310024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_DDED8
		push	large 140028h
		push	large 2D0067h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[di+20h], ds
		mov	[di+1Eh], ax
		mov	word ptr [di+22h], 0Ah
		mov	ax, di
		jmp	short loc_DDEDA

loc_DDED8:
		mov	ax, di

loc_DDEDA:
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	seg seg008
		push	offset loc_5E6E
		lea	ax, [bp+var_144]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_5917
		lea	ax, [bp+var_16]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_591B
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_5E6E
		lea	ax, [bp+var_144]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	4
		mov	bx, [bp+var_4]
		shl	bx, 1
		push	word ptr [bx+si+0Bh]
		push	[bp+var_8]
		push	[bp+var_6]
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5E77
		lea	ax, [bp+var_144]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	4
		push	[bp+arg_6]
		push	[bp+var_C]
		push	[bp+var_A]
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5E6E
		lea	ax, [bp+var_144]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	4
		lea	ax, [bp+var_16]
		push	ax
		push	large 2D0035h
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	4
		lea	ax, [bp+var_1E]
		push	ax
		push	large 2D0067h
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch

loc_DDFD3:
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74AD7
		pop	cx
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74CD5
		pop	cx
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_DE059

loc_DE013:
		push	large 1
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0
		jz	short loc_DE059
		cmp	word ptr [bp+var_27], 0
		jnz	short loc_DE038
		cmp	word ptr [bp+var_27+2], 0
		jz	short loc_DE059

loc_DE038:
		push	large [bp+var_27]
		mov	ax, [bp+var_29]
		sub	ax, [bp+var_8C]
		push	ax
		mov	ax, [bp+var_2B]
		sub	ax, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_DE059:
		cmp	[bp+var_2], 0Eh
		jz	short loc_DE013
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		cmp	[bp+var_2], 9
		jnz	short loc_DE093
		lea	ax, [bp+var_B8]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_A0]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74CA8
		add	sp, 4
		mov	al, 1
		jmp	short loc_DE0BA

loc_DE093:
		lea	ax, [bp+var_B8]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_A0]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_92]
		push	ax
		call	sub_74CA8
		add	sp, 4
		mov	al, 0

loc_DE0BA:
		pop	di
		pop	si
		leave
		retf
sub_DDC2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DE0BE		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_DF056
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	byte ptr [si+9], 0
		mov	byte ptr [si+0Ah], 0
		cmp	[bp+var_4], 5
		jbe	short loc_DE11C
		mov	bx, [si+6]
		push	word ptr [bx+4]
		push	si
		nop
		push	cs
		call	near ptr sub_DF4AF
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 1
		jbe	short loc_DE108
		mov	byte ptr [si+9], 1

loc_DE108:
		mov	eax, [bp+var_8]
		add	eax, 5
		dec	eax
		cmp	eax, [bp+var_4]
		jnb	short loc_DE11C
		mov	byte ptr [si+0Ah], 1

loc_DE11C:
		pop	si
		leave
		retf
sub_DE0BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DE11F		proc far

var_332		= word ptr -332h
var_31E		= word ptr -31Eh
var_2CE		= word ptr -2CEh
var_2CC		= word ptr -2CCh
var_2B8		= byte ptr -2B8h
var_2B4		= word ptr -2B4h
var_23C		= dword ptr -23Ch
var_238		= byte ptr -238h
var_236		= dword ptr -236h
var_232		= dword ptr -232h
var_22E		= byte ptr -22Eh
var_22C		= dword ptr -22Ch
var_228		= word ptr -228h
var_218		= word ptr -218h
var_216		= word ptr -216h
var_214		= word ptr -214h
var_210		= word ptr -210h
var_1C0		= word ptr -1C0h
var_148		= word ptr -148h
var_F8		= word ptr -0F8h
var_F6		= word ptr -0F6h
var_F4		= word ptr -0F4h
var_F2		= word ptr -0F2h
var_F0		= word ptr -0F0h
var_EE		= word ptr -0EEh
var_EA		= word ptr -0EAh
var_E6		= word ptr -0E6h
var_E4		= word ptr -0E4h
var_83		= word ptr -83h
var_81		= word ptr -81h
var_7F		= dword ptr -7Fh
var_76		= word ptr -76h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6B		= byte ptr -6Bh
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= dword ptr -56h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= dword ptr -46h
var_42		= word ptr -42h
var_3F		= byte ptr -3Fh
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_D		= word ptr -0Dh
var_C		= word ptr -0Ch
var_B		= word ptr -0Bh
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 332h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_3], 0
		mov	byte ptr [bp+var_C], 0
		push	large 0A90103h
		push	large 1E003Ch
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_F8], 0
		mov	[bp+var_F6], 0
		mov	[bp+var_F4], 0
		mov	[bp+var_F2], 0
		mov	[bp+var_F0], 0C7h
		mov	[bp+var_EE], 8Bh
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	37h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_148]
		push	ax
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	42h
		lea	ax, [bp+var_1C0]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	seg seg008
		push	offset loc_5E81
		lea	ax, [bp+var_210]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_210]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_148]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 1
		mov	[bp+var_1A], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, [bp+var_228]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_218], 1
		mov	[bp+var_216], 0
		push	2Dh
		lea	ax, [bp+var_228]
		push	ax
		mov	bx, [bp+var_228]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_214], ax
		push	seg seg008
		push	offset loc_5E86
		lea	ax, [bp+var_210]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg stub253
		push	offset sub_735A5
		push	large 10002h
		push	0Ah
		lea	ax, word ptr [bp+var_23C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_210]
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_148]
		push	ax
		lea	ax, [bp+var_2B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_26], 0
		jmp	short loc_DE339

loc_DE317:
		push	2
		mov	ax, [bp+var_26]
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_23C]
		add	ax, dx
		push	ax
		push	[bp+var_26]
		lea	ax, [bp+var_2B4]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	[bp+var_26]

loc_DE339:
		cmp	[bp+var_26], 2
		jl	short loc_DE317
		push	seg seg008
		push	offset loc_5E8F
		lea	ax, [bp+var_210]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_210]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_148]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_34+2], dx
		mov	word ptr [bp+var_34], ax
		mov	eax, [bp+var_34]
		mov	[bp+var_30], eax
		mov	[bp+var_2C], 3
		mov	[bp+var_2B], 1
		mov	[bp+var_2A], 0
		lea	ax, [bp+var_228]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D04
		add	sp, 6
		mov	[bp+var_2B8], 4
		push	word_7AF7E
		lea	ax, [bp+var_F8]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_2]
		mov	word ptr [bp+var_3A+2], ss
		mov	word ptr [bp+var_3A], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_DE3F7
		jmp	loc_DE486

loc_DE3F7:
		push	large 0A000Fh
		push	large 2A0008h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_232]
		mov	[bp+var_3E], eax
		mov	al, [bp+var_22E]
		mov	[bp+var_3F], al
		mov	eax, [bp+var_3E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_3F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_22C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	eax, [bp+var_3A]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 44h
		mov	word ptr [di+34h], 48h
		mov	ax, di
		jmp	short loc_DE488

loc_DE486:
		mov	ax, di

loc_DE488:
		mov	[bp+var_36], ax
		lea	ax, [bp+var_2]
		mov	word ptr [bp+var_46+2], ss
		mov	word ptr [bp+var_46], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_48], ax
		or	ax, ax
		jnz	short loc_DE4A6
		jmp	loc_DE539

loc_DE4A6:
		push	large 0A000Fh
		push	large 620008h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_48]
		mov	word ptr [bx+0Eh], 3CF1h
		mov	dword ptr [bx+1Eh], 0
		mov	byte ptr [bx+22h], 2
		mov	byte ptr [bx+23h], 0
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_23C]
		mov	[bp+var_4C], eax
		mov	al, [bp+var_238]
		mov	[bp+var_4D], al
		mov	eax, [bp+var_4C]
		mov	[bx+1Eh], eax
		mov	al, [bp+var_4D]
		mov	[bx+22h], al
		mov	byte ptr [bx+23h], 0
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_236]
		mov	[bx+24h], eax
		mov	word ptr [bx+28h], 0
		mov	word ptr [bx+0Eh], 41B8h
		mov	eax, [bp+var_46]
		mov	[bx+2Ah], eax
		mov	word ptr [bx+2Eh], 1
		mov	word ptr [bx+30h], 1
		mov	word ptr [bx+32h], 44h
		mov	word ptr [bx+34h], 80h
		mov	ax, [bp+var_48]
		jmp	short loc_DE53C

loc_DE539:
		mov	ax, [bp+var_48]

loc_DE53C:
		mov	[bp+var_42], ax
		push	large 10024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_50], ax
		or	ax, ax
		jz	short loc_DE582
		push	large 140028h
		push	large 6E0050h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 2
		mov	ax, [bp+var_50]
		jmp	short loc_DE585

loc_DE582:
		mov	ax, [bp+var_50]

loc_DE585:
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 1C0024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_52], ax
		or	ax, ax
		jz	short loc_DE5D6
		push	large 140028h
		push	large 1E0032h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_52]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 3
		mov	ax, [bp+var_52]
		jmp	short loc_DE5D9

loc_DE5D6:
		mov	ax, [bp+var_52]

loc_DE5D9:
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	si
		nop
		push	cs
		call	near ptr sub_DF056
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_56], eax
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_5A], ax
		or	ax, ax
		jz	short loc_DE635
		push	large 140096h
		push	large 32001Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 4
		mov	ax, [bp+var_5A]
		jmp	short loc_DE638

loc_DE635:
		mov	ax, [bp+var_5A]

loc_DE638:
		mov	[bp+var_58], ax
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_5E], ax
		or	ax, ax
		jz	short loc_DE67A
		push	large 140096h
		push	large 3C001Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 5
		mov	ax, [bp+var_5E]
		jmp	short loc_DE67D

loc_DE67A:
		mov	ax, [bp+var_5E]

loc_DE67D:
		mov	[bp+var_5C], ax
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_62], ax
		or	ax, ax
		jz	short loc_DE6BF
		push	large 140096h
		push	large 46001Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_62]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 6
		mov	ax, [bp+var_62]
		jmp	short loc_DE6C2

loc_DE6BF:
		mov	ax, [bp+var_62]

loc_DE6C2:
		mov	[bp+var_60], ax
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_66], ax
		or	ax, ax
		jz	short loc_DE704
		push	large 140096h
		push	large 50001Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_66]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 7
		mov	ax, [bp+var_66]
		jmp	short loc_DE707

loc_DE704:
		mov	ax, [bp+var_66]

loc_DE707:
		mov	[bp+var_64], ax
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_6A], ax
		or	ax, ax
		jz	short loc_DE749
		push	large 140096h
		push	large 5A001Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_6A]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 8
		mov	ax, [bp+var_6A]
		jmp	short loc_DE74C

loc_DE749:
		mov	ax, [bp+var_6A]

loc_DE74C:
		mov	[bp+var_68], ax
		push	0
		push	[bp+var_58]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		push	[bp+var_5C]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		push	[bp+var_60]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		push	[bp+var_64]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		push	[bp+var_68]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	5Bh
		push	[bp+var_36]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	63h
		push	[bp+var_42]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		cmp	[bp+var_56], 5
		jb	short loc_DE7D7
		jmp	loc_DE8CC

loc_DE7D7:
		push	[bp+var_68]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CF3
		add	sp, 4
		cmp	[bp+var_68], 0
		jz	short loc_DE800
		push	3
		push	[bp+var_68]
		mov	bx, [bp+var_68]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_DE800

loc_DE800:
		mov	eax, [bp+var_56]
		mov	[bp+var_70], eax
		mov	cx, 4
		mov	bx, offset word_DEE4A

loc_DE80E:
		mov	eax, cs:[bx]
		cmp	eax, [bp+var_70]
		jz	short loc_DE820
		add	bx, 4
		loop	short loc_DE80E
		jmp	loc_DE8CC

loc_DE820:
		add	cx, cx
		add	bx, cx
		jmp	word ptr cs:[bx+8] ; switch jump
		push	[bp+var_58]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CF3
		add	sp, 4
		cmp	[bp+var_58], 0
		jz	short loc_DE851
		push	3
		push	[bp+var_58]
		mov	bx, [bp+var_58]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_DE851

loc_DE851:
		push	[bp+var_5C]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CF3
		add	sp, 4
		cmp	[bp+var_5C], 0
		jz	short loc_DE87A
		push	3
		push	[bp+var_5C]
		mov	bx, [bp+var_5C]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_DE87A

loc_DE87A:
		push	[bp+var_60]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CF3
		add	sp, 4
		cmp	[bp+var_60], 0
		jz	short loc_DE8A3
		push	3
		push	[bp+var_60]
		mov	bx, [bp+var_60]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_DE8A3

loc_DE8A3:
		push	[bp+var_64]
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CF3
		add	sp, 4
		cmp	[bp+var_64], 0
		jz	short loc_DE8CC
		push	3
		push	[bp+var_64]
		mov	bx, [bp+var_64]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_DE8CC

loc_DE8CC:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CC6
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	[bp+var_2], 0Eh
		mov	[bp+var_6B], 0
		push	si
		push	cs
		call	near ptr sub_DE0BE
		pop	cx
		jmp	loc_DECFF

loc_DE8F3:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	large 0
		mov	al, [bp+var_12]
		push	ax
		push	large [bp+var_16]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	0Fh
		push	large 1400BDh
		push	large 14000Ah
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		push	0Fh
		push	large 2800BDh
		push	large 1D0064h
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_6A150
		add	sp, 0Ch
		push	0Fh
		push	large 6400BDh
		push	large 31001Bh
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_6A150
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5E97
		lea	ax, [bp+var_31E]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	2
		mov	al, [si+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+si+0Bh]
		push	large 0A0037h
		lea	ax, [bp+var_31E]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5EA5
		lea	ax, [bp+var_31E]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	4
		mov	al, [si+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+si+0Bh]
		push	large 1E0032h
		lea	ax, [bp+var_31E]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5E6E
		lea	ax, [bp+var_31E]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_5EB0
		lea	ax, [bp+var_332]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	4
		lea	ax, [bp+var_C]
		push	ax
		push	large 1E0069h
		lea	ax, [bp+var_31E]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	4
		lea	ax, [bp+var_332]
		push	ax
		push	large 6E0050h
		lea	ax, [bp+var_31E]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		lea	ax, [bp+var_2CE]
		push	ax
		push	si
		push	cs
		call	near ptr sub_DDB18
		add	sp, 4
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		cmp	byte ptr [si+9], 0
		jz	short loc_DEA78
		push	[bp+var_36]
		mov	bx, [bp+var_36]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		jmp	short loc_DEA84

loc_DEA78:
		push	[bp+var_36]
		mov	bx, [bp+var_36]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]

loc_DEA84:
		pop	cx
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_DEA98
		push	[bp+var_42]
		mov	bx, [bp+var_42]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		jmp	short loc_DEAA4

loc_DEA98:
		push	[bp+var_42]
		mov	bx, [bp+var_42]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]

loc_DEAA4:
		pop	cx
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CD5
		pop	cx
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		mov	ax, 0C00h
		int	21h
		mov	byte_7CE0F, 0
		jmp	loc_DEB81

loc_DEAC2:
		push	large 1
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	word ptr [bp+var_74+2], ax
		cmp	word ptr [bp+var_74+2], 0
		jz	short loc_DEB0A
		cmp	word ptr [bp+var_7F], 0
		jnz	short loc_DEAE7
		cmp	word ptr [bp+var_7F+2], 0
		jz	short loc_DEB0A

loc_DEAE7:
		push	large [bp+var_7F]
		mov	ax, [bp+var_81]
		sub	ax, [bp+var_E4]
		push	ax
		mov	ax, [bp+var_83]
		sub	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_DEB0A:
		mov	bx, [bp+var_2]
		sub	bx, 4
		cmp	bx, 4
		ja	short loc_DEB27
		shl	bx, 1
		jmp	cs:off_DEE40[bx]	; switch jump

loc_DEB1C:
		cmp	[bp+var_6B], 1
		jnz	short loc_DEB27
		mov	[bp+var_2], 3

loc_DEB27:
		cmp	[bp+var_2], 0Eh
		jnz	short loc_DEB7D
		cmp	word ptr [bp+var_7F+2], 0
		jz	short loc_DEB81
		cmp	word ptr [bp+var_7F+2], 10h
		jl	short loc_DEB3F
		cmp	word ptr [bp+var_7F+2], 19h
		jle	short loc_DEB63

loc_DEB3F:
		cmp	word ptr [bp+var_7F+2], 1Eh
		jl	short loc_DEB4B
		cmp	word ptr [bp+var_7F+2], 26h
		jle	short loc_DEB63

loc_DEB4B:
		cmp	word ptr [bp+var_7F+2], 2Ch
		jl	short loc_DEB57
		cmp	word ptr [bp+var_7F+2], 32h
		jle	short loc_DEB63

loc_DEB57:
		cmp	word ptr [bp+var_7F+2], 2
		jl	short loc_DEB6C
		cmp	word ptr [bp+var_7F+2], 0Ch
		jg	short loc_DEB6C

loc_DEB63:
		mov	[bp+var_2], 0Ch
		mov	[bp+var_6B], 1

loc_DEB6C:
		cmp	word ptr [bp+var_7F+2], 0Eh
		jnz	short loc_DEB81
		mov	[bp+var_2], 0Dh
		mov	[bp+var_6B], 1
		jmp	short loc_DEB81

loc_DEB7D:
		mov	[bp+var_6B], 0

loc_DEB81:
		cmp	[bp+var_2], 0Eh
		jnz	short loc_DEB8A
		jmp	loc_DEAC2

loc_DEB8A:
		mov	bx, [bp+var_2]
		cmp	bx, 0Dh
		jbe	short loc_DEB95
		jmp	loc_DECFA

loc_DEB95:
		shl	bx, 1
		jmp	cs:off_DEE24[bx]	; switch jump

loc_DEB9C:
		mov	ax, si
		add	ax, 6
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF083

loc_DEBA8:
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_DE0BE
		pop	cx
		jmp	loc_DECFA

loc_DEBB4:
		mov	ax, si
		add	ax, 6
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		jmp	short loc_DEBA8

loc_DEBC2:
		mov	bx, [si+6]
		mov	ax, [bx+4]
		add	ax, 1Eh
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_DEBFB
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_228]
		push	ax
		push	si
		push	cs
		call	near ptr sub_DDC2D
		add	sp, 8
		or	al, al
		jnz	short loc_DEBF8
		jmp	loc_DECFA

loc_DEBF8:
		jmp	loc_DEC92

loc_DEBFB:
		mov	bx, [si+6]
		mov	ax, [bx+4]

loc_DEC01:
		add	ax, 1Eh
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		jmp	loc_DEC9D

loc_DEC0C:
		mov	bx, [si+6]
		push	word ptr [bx+4]
		push	si
		nop
		push	cs
		call	near ptr sub_DF4AF
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_74], eax
		mov	ax, word ptr [bp+var_74]
		add	ax, [bp+var_2]
		add	ax, 0FFFBh
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_DF48C
		add	sp, 4
		mov	[bp+var_76], ax
		add	ax, 1Eh
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_DEC6B
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_228]
		push	ax
		push	si
		push	cs
		call	near ptr sub_DDC2D
		add	sp, 8
		or	al, al
		jnz	short loc_DEC69
		jmp	loc_DECFA

loc_DEC69:
		jmp	short loc_DEC92

loc_DEC6B:
		mov	ax, [bp+var_76]
		jmp	short loc_DEC01

loc_DEC70:
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_DEC79
		jmp	loc_DECFA

loc_DEC79:
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_228]
		push	ax
		push	si
		push	cs
		call	near ptr sub_DDC2D
		add	sp, 8
		or	al, al
		jz	short loc_DECFA

loc_DEC92:
		mov	[bp+var_3], 1
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+arg_2]

loc_DEC9D:
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_DECFA

loc_DECA7:
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	word ptr [bp+var_74+2], ax
		cmp	word ptr [bp+var_74+2], 8
		jge	short loc_DECCB
		mov	bx, word ptr [bp+var_7F+2]
		mov	al, [bx+4B9Eh]
		lea	dx, [bp+var_C]
		mov	bx, word ptr [bp+var_74+2]
		add	bx, dx
		mov	[bx], al

loc_DECCB:
		lea	ax, [bp+var_B]
		mov	bx, word ptr [bp+var_74+2]

loc_DECD1:
		add	bx, ax
		jmp	short loc_DECF7

loc_DECD5:
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	word ptr [bp+var_74+2], ax
		cmp	word ptr [bp+var_74+2], 0
		jz	short loc_DECFA
		lea	ax, [bp+var_D]
		mov	bx, word ptr [bp+var_74+2]
		jmp	short loc_DECD1

loc_DECF0:
		mov	[bp+var_3], 1
		mov	bx, [bp+arg_2]

loc_DECF7:
		mov	byte ptr [bx], 0

loc_DECFA:
		mov	[bp+var_2], 0Eh

loc_DECFF:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DED0B
		jmp	loc_DE8F3

loc_DED0B:
		lea	ax, [bp+var_2CC]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		cmp	[bp+var_2B], 0
		jz	short loc_DED3A
		cmp	[bp+var_30], 0
		jz	short loc_DED3A
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DED3A

loc_DED3A:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_2B4]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	seg stub253
		push	offset sub_735A0
		push	large 10002h
		push	0Ah
		lea	ax, word ptr [bp+var_23C]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_228]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_1B], 0
		jz	short loc_DEDAB
		cmp	[bp+var_20], 0
		jz	short loc_DEDAB
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DEDAB

loc_DEDAB:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	[bp+var_11], 0
		jz	short loc_DEDE3
		cmp	[bp+var_16], 0
		jz	short loc_DEDE3
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DEDE3

loc_DEDE3:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_F8]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_74CA8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_DE11F		endp

; START OF FUNCTION CHUNK FOR sub_DE11F
off_DEE24	dw offset loc_DEB9C
		dw offset loc_DEBB4
		dw offset loc_DECF0
		dw offset loc_DEC70
		dw offset loc_DEBC2
		dw offset loc_DEC0C
		dw offset loc_DEC0C
		dw offset loc_DEC0C
		dw offset loc_DEC0C
		dw offset loc_DECFA
		dw offset loc_DECFA
		dw offset loc_DECFA
		dw offset loc_DECA7
		dw offset loc_DECD5
off_DEE40	dw offset loc_DEB1C
		dw offset loc_DEB1C
		dw offset loc_DEB1C
		dw offset loc_DEB1C
		dw offset loc_DEB1C
word_DEE4A	dw 0
		dw 0
		dw 1
		dw 0
off_DEE52	dw offset loc_DD9D2
		dw offset sub_DD9D0
		dw offset loc_DD9D3
		dw offset sub_DD9D0
		pop	ax
		push	cs
		or	word_775DA, 0ED3h
; END OF FUNCTION CHUNK FOR sub_DE11F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DEE62		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	ax, [bp+arg_0]
		lea	ax, [bp+var_8]
		push	ax
		push	0
		call	sub_3E4
		add	sp, 4
		or	ax, ax
		jnz	short loc_DEE9A
		movzx	eax, [bp+var_6]
		movzx	edx, [bp+var_2]
		imul	eax, edx
		movzx	edx, [bp+var_4]
		imul	eax, edx
		mov	[bp+var_C], eax
		jmp	short loc_DEEA2

loc_DEE9A:
		mov	[bp+var_C], 0

loc_DEEA2:
		mov	eax, [bp+var_C]
		shld	edx, eax, 10h
		leave
		retf
sub_DEE62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DEEAD		proc far

var_26		= word ptr -26h
var_12		= word ptr -12h
var_A		= byte ptr -0Ah
var_7		= word ptr -7
var_5		= word ptr -5
var_3		= word ptr -3
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_DF593
		pop	cx
		mov	[bp+var_A], 0
		push	42A0h
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_7], ax
		push	42A5h
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_5], ax
		push	42AAh
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_3], ax
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	si
		call	sub_60DA5
		pop	cx
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_DD9D0
		pop	cx
		mov	ax, si
		add	ax, 490h
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_DE11F
		add	sp, 4
		push	seg seg008
		push	offset loc_5EB5
		lea	ax, [bp+var_26]
		push	ax
		call	sub_54BE
		add	sp, 6
		cmp	byte ptr [si+490h], 0
		jz	short loc_DEF3A
		lea	ax, [bp+var_26]
		push	ax
		mov	ax, si
		add	ax, 490h
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_DEF3A:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	si
		call	sub_60ED7
		pop	cx
		push	[bp+var_7]
		call	sub_3B2
		pop	cx
		push	[bp+var_5]
		call	sub_3B2
		pop	cx
		push	[bp+var_3]
		call	sub_3B2
		pop	cx
		push	2
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_DF02B
		add	sp, 4
		pop	si
		leave
		retf
sub_DEEAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DEF72		proc far

var_26		= word ptr -26h
var_12		= word ptr -12h
var_A		= byte ptr -0Ah
var_7		= word ptr -7
var_5		= word ptr -5
var_3		= word ptr -3
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_DF593
		pop	cx
		mov	[bp+var_A], 1
		push	42B2h
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_7], ax
		push	42B7h
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_5], ax
		push	42BCh
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_3], ax
		push	si
		call	sub_60DA5
		pop	cx
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_DD9D0
		pop	cx
		push	di
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_DE11F
		add	sp, 4
		push	seg seg008
		push	offset loc_5EB5
		lea	ax, [bp+var_26]
		push	ax
		call	sub_54BE
		add	sp, 6
		cmp	byte ptr [di], 0
		jz	short loc_DEFF2
		lea	ax, [bp+var_26]
		push	ax
		push	di
		call	CRT_Strcat
		add	sp, 4

loc_DEFF2:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	si
		call	sub_60ED7
		pop	cx
		push	[bp+var_7]
		call	sub_3B2
		pop	cx
		push	[bp+var_5]
		call	sub_3B2
		pop	cx
		push	[bp+var_3]
		call	sub_3B2
		pop	cx
		push	2
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_DF02B
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_DEF72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF02B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_DF052
		mov	word ptr [si], 42C4h
		push	si
		nop
		push	cs
		call	near ptr sub_DF111
		pop	cx
		test	di, 1
		jz	short loc_DF052
		push	si
		call	sub_3B2
		pop	cx

loc_DF052:
		pop	di
		pop	si
		pop	bp
		retf
sub_DF02B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF056		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	si, [si+2]
		jmp	short loc_DF073

loc_DF06D:
		inc	[bp+var_4]
		mov	si, [si]

loc_DF073:
		or	si, si
		jnz	short loc_DF06D
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_DF056		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LinkedList_Helper_2FC76 (sub_2FC76 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à LinkedList_Helper_5F401 (sub_5F401
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; aucun appel externe visible (rôle exact non détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_DF083		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_DF098
		mov	ax, [si+4]
		jmp	short loc_DF09D

loc_DF098:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_DF09D:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_DF0A9
		mov	ax, 1
		jmp	short loc_DF0AB

loc_DF0A9:
		xor	ax, ax

loc_DF0AB:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_DF083		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LinkedList_Helper_2FC76 (sub_2FC76 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à LinkedList_Helper_5F401 (sub_5F401
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; aucun appel externe visible (rôle exact non détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_DF0AF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_DF0C4
		mov	ax, [si+2]
		jmp	short loc_DF0C8

loc_DF0C4:
		mov	bx, [di]
		mov	ax, [bx]

loc_DF0C8:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_DF0D4
		mov	ax, 1
		jmp	short loc_DF0D6

loc_DF0D4:
		xor	ax, ax

loc_DF0D6:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_DF0AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF0DA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_DF100

loc_DF0E6:
		mov	bx, [si+2]
		mov	ax, [bx]
		mov	[bp+var_2], ax
		mov	word ptr [bx+4], 0
		push	bx
		call	sub_3B2
		pop	cx
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_DF100:
		cmp	word ptr [si+2], 0
		jnz	short loc_DF0E6
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_DF0DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF111		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_DF143

loc_DF11D:
		mov	bx, [si+2]
		mov	ax, [bx]
		mov	[bp+var_2], ax
		push	word ptr [bx+4]
		call	sub_3B2
		pop	cx
		mov	bx, [si+2]
		mov	word ptr [bx+4], 0
		push	bx
		call	sub_3B2
		pop	cx
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_DF143:
		cmp	word ptr [si+2], 0
		jnz	short loc_DF11D
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_DF111		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF154		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		or	si, si
		jnz	short loc_DF169
		xor	ax, ax
		jmp	short loc_DF183

loc_DF169:
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		push	si
		push	dx
		nop
		push	cs
		call	near ptr sub_DF22A
		add	sp, 4
		push	si
		call	sub_3B2
		pop	cx
		mov	ax, [bp+var_2]

loc_DF183:
		pop	si
		leave
		retf
sub_DF154		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF186		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_DF1AE

loc_DF197:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		cmp	ax, [bp+arg_2]
		jnz	short loc_DF1AE
		push	bx
		push	si
		nop
		push	cs
		call	near ptr sub_DF154
		add	sp, 4
		jmp	short loc_DF1BF

loc_DF1AE:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jnz	short loc_DF197

loc_DF1BF:
		pop	si
		leave
		retf
sub_DF186		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF1C2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr sub_DF22A
		add	sp, 4
		push	word ptr [si+4]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+4], 0
		push	si
		call	sub_3B2
		pop	cx
		pop	si
		pop	bp
		retf
sub_DF1C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF1EE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_DF216

loc_DF1FF:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		cmp	ax, [bp+arg_2]
		jnz	short loc_DF216
		push	bx
		push	si
		nop
		push	cs
		call	near ptr sub_DF1C2
		add	sp, 4
		jmp	short loc_DF227

loc_DF216:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jnz	short loc_DF1FF

loc_DF227:
		pop	si
		leave
		retf
sub_DF1EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF22A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_DF276
		cmp	word ptr [di+2], 0
		jz	short loc_DF248
		mov	ax, [di]
		mov	bx, [di+2]
		mov	[bx], ax
		jmp	short loc_DF24D

loc_DF248:
		mov	ax, [di]
		mov	[si+2], ax

loc_DF24D:
		cmp	word ptr [di], 0
		jz	short loc_DF25C
		mov	ax, [di+2]
		mov	bx, [di]
		mov	[bx+2], ax
		jmp	short loc_DF276

loc_DF25C:
		cmp	word ptr [di+2], 0
		jz	short loc_DF26B
		mov	bx, [di+2]
		mov	word ptr [bx], 0
		jmp	short loc_DF270

loc_DF26B:
		mov	word ptr [si+2], 0

loc_DF270:
		mov	ax, [di+2]
		mov	[si+4], ax

loc_DF276:
		pop	di
		pop	si
		pop	bp
		retf
sub_DF22A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF27A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_DF22A
		add	sp, 4
		push	di
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_DF310
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_DF27A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF29F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_DF22A
		add	sp, 4
		push	di
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_DF394
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_DF29F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF2C4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_DF22A
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_DF310
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_DF2C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF2EA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_DF22A
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_DF394
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_DF2EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF310		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_DF357
		or	dx, dx
		jnz	short loc_DF332
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_DF404
		add	sp, 4
		jmp	short loc_DF357

loc_DF332:
		cmp	[si+2], dx
		jz	short loc_DF348
		mov	[di], dx
		mov	bx, dx
		mov	ax, [bx+2]
		mov	[di+2], ax
		mov	bx, [bx+2]
		mov	[bx], di
		jmp	short loc_DF352

loc_DF348:
		mov	[si+2], di
		mov	word ptr [di+2], 0
		mov	[di], dx

loc_DF352:
		mov	bx, dx
		mov	[bx+2], di

loc_DF357:
		pop	di
		pop	si
		pop	bp
		retf
sub_DF310		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF35B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_DF4F9
		add	sp, 4
		mov	[bp+var_2], ax
		push	[bp+arg_4]
		push	0
		nop
		push	cs
		call	near ptr sub_DF5BD
		add	sp, 4
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr sub_DF310
		add	sp, 6
		pop	si
		leave
		retf
sub_DF35B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF394		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_DF3D9
		or	dx, dx
		jnz	short loc_DF3B6
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_DF45B
		add	sp, 4
		jmp	short loc_DF3D9

loc_DF3B6:
		cmp	[si+4], dx
		jz	short loc_DF3CB
		mov	bx, dx
		mov	ax, [bx]
		mov	[di], ax
		mov	[di+2], dx
		mov	bx, [bx]
		mov	[bx+2], di
		jmp	short loc_DF3D5

loc_DF3CB:
		mov	[si+4], di
		mov	word ptr [di], 0
		mov	[di+2], dx

loc_DF3D5:
		mov	bx, dx
		mov	[bx], di

loc_DF3D9:
		pop	di
		pop	si
		pop	bp
		retf
sub_DF394		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF3DD		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	0
		nop
		push	cs
		call	near ptr sub_DF5BD
		add	sp, 4
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_DF404
		add	sp, 4
		pop	si
		leave
		retf
sub_DF3DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF404		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_DF430
		mov	ax, [si+4]
		mov	[di+2], ax
		mov	word ptr [di], 0
		cmp	word ptr [si+4], 0
		jz	short loc_DF42A
		mov	bx, [si+4]
		mov	[bx], di
		jmp	short loc_DF42D

loc_DF42A:
		mov	[si+2], di

loc_DF42D:
		mov	[si+4], di

loc_DF430:
		pop	di
		pop	si
		pop	bp
		retf
sub_DF404		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF434		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	0
		nop
		push	cs
		call	near ptr sub_DF5BD
		add	sp, 4
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_DF45B
		add	sp, 4
		pop	si
		leave
		retf
sub_DF434		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF45B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_DF488
		mov	word ptr [di+2], 0
		mov	ax, [si+2]
		mov	[di], ax
		cmp	word ptr [si+2], 0
		jz	short loc_DF482
		mov	bx, [si+2]
		mov	[bx+2], di
		jmp	short loc_DF485

loc_DF482:
		mov	[si+4], di

loc_DF485:
		mov	[si+2], di

loc_DF488:
		pop	di
		pop	si
		pop	bp
		retf
sub_DF45B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF48C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		nop
		push	cs
		call	near ptr sub_DF530
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_DF4AA
		mov	ax, [si+4]
		jmp	short loc_DF4AC

loc_DF4AA:
		xor	ax, ax

loc_DF4AC:
		pop	si
		pop	bp
		retf
sub_DF48C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF4AF		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_6], 0
		jmp	short loc_DF4DD

loc_DF4C8:
		inc	[bp+var_6]
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		cmp	ax, [bp+arg_2]
		jnz	short loc_DF4DD
		mov	eax, [bp+var_6]
		jmp	short loc_DF4F1

loc_DF4DD:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jnz	short loc_DF4C8
		xor	eax, eax

loc_DF4F1:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_DF4AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF4F9		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_DF51A

loc_DF50A:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		cmp	ax, [bp+arg_2]
		jnz	short loc_DF51A
		mov	ax, [bp+var_2]
		jmp	short loc_DF52D

loc_DF51A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		or	ax, ax
		jnz	short loc_DF50A
		xor	ax, ax

loc_DF52D:
		pop	si
		leave
		retf
sub_DF4F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF530		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	dx, 1
		mov	[bp+var_4], 0
		jmp	short loc_DF55C

loc_DF54D:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Helper_DF0AF
		add	sp, 4
		mov	dx, ax

loc_DF55C:
		mov	ax, [bp+var_2]
		inc	[bp+var_2]
		cmp	ax, di
		jg	short loc_DF56A
		or	dx, dx
		jnz	short loc_DF54D

loc_DF56A:
		or	di, di
		jge	short loc_DF572
		xor	ax, ax
		jmp	short loc_DF575

loc_DF572:
		mov	ax, [bp+var_4]

loc_DF575:
		pop	di
		pop	si
		leave
		retf
sub_DF530		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF579		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		pop	si
		pop	bp
		retf
sub_DF579		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF586		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		pop	si
		pop	bp
		retf
sub_DF586		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF593		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DF5AC
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DF5B8

loc_DF5AC:
		mov	word ptr [si], 42C4h
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax

loc_DF5B8:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DF593		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF5BD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DF5D6
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DF5E3

loc_DF5D6:
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		mov	ax, [bp+arg_2]
		mov	[si+4], ax

loc_DF5E3:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DF5BD		endp
ovr391		ends
