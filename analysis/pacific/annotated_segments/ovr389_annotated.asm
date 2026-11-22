ovr389		segment	para public 'OVERLAY' use16
		assume cs:ovr389
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAFB0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DAFCA
		push	472h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DAFFC

loc_DAFCA:
		push	si
		call	sub_7594F
		pop	cx
		mov	ax, si
		add	ax, 299h
		push	ax
		call	sub_760A0
		pop	cx
		mov	ax, si
		add	ax, 3C5h
		push	ax
		call	sub_76070
		pop	cx
		mov	ax, si
		add	ax, 401h
		push	ax
		call	sub_76120
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_DB001
		pop	cx

loc_DAFFC:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DAFB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB001		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_DB04D

loc_DB00F:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+440h], 0Ah
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+446h], 0
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+46Ah], 0
		xor	cx, cx
		jmp	short loc_DB047

loc_DB031:
		mov	ax, dx
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+44Ch], 0
		inc	cx

loc_DB047:
		cmp	cx, 5
		jl	short loc_DB031
		inc	dx

loc_DB04D:
		cmp	dx, 3
		jl	short loc_DB00F
		mov	word ptr [si+470h], 0
		push	seg seg008
		push	offset loc_5F55
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_50]
		push	ax
		push	si
		call	CRT_Strcpy
		add	sp, 4
		pop	si
		leave
		retf
sub_DB001		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB07A		proc far

var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+440h]
		mov	ax, si
		add	ax, 401h
		push	ax
		call	sub_76139
		add	sp, 4
		xor	dx, dx
		jmp	short loc_DB0AE

loc_DB0A0:
		mov	bx, dx
		shl	bx, 1
		lea	ax, [bp+var_6]
		add	bx, ax
		mov	word ptr [bx], 0
		inc	dx

loc_DB0AE:
		cmp	dx, 3
		jl	short loc_DB0A0
		xor	dx, dx
		jmp	short loc_DB0D4

loc_DB0B7:
		mov	bx, dx
		shl	bx, 1
		cmp	word ptr [bx+si+446h], 0
		jle	short loc_DB0D3
		mov	bx, dx
		shl	bx, 1
		mov	bx, [bx+si+46Ah]
		shl	bx, 1
		lea	ax, [bp+var_6]
		add	bx, ax
		inc	word ptr [bx]

loc_DB0D3:
		inc	dx

loc_DB0D4:
		cmp	dx, 3
		jl	short loc_DB0B7
		cmp	[bp+var_6], 1
		jl	short loc_DB0E4
		mov	byte ptr [si+43Dh], 0

loc_DB0E4:
		cmp	[bp+var_4], 2
		jl	short loc_DB0EF
		mov	byte ptr [si+43Eh], 0

loc_DB0EF:
		mov	bx, [si+470h]
		shl	bx, 1
		mov	bx, [bx+si+46Ah]
		mov	al, [bx+si+43Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DB11D
		push	0FFFFh
		mov	ax, si
		add	ax, 401h
		push	ax
		call	sub_76125
		add	sp, 4
		mov	bx, [si+470h]
		shl	bx, 1
		mov	[bx+si+46Ah], ax

loc_DB11D:
		pop	si
		leave
		retf
sub_DB07A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB120		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	seg seg008
		push	offset loc_5F5A
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0A00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5F65
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [si+28Bh]
		inc	ax
		push	ax
		push	large 1200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5F6C
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 1A00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+si+24Ch], 0Ah
		jl	short loc_DB1DD
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0FFF6h
		imul	ax, ax, 14h
		push	ax
		mov	ax, si
		pop	dx
		add	ax, dx
		add	ax, 299h
		jmp	short loc_DB1F3

loc_DB1DD:
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		imul	ax, ax, 14h
		push	ax
		mov	ax, si
		pop	dx
		add	ax, dx
		add	ax, 0D2h

loc_DB1F3:
		push	ax
		push	large 2200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5F76
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2A00F1h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5F65
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+27Fh]
		push	large 3200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+si+27Fh], 0
		jg	short loc_DB26B
		jmp	loc_DB45E

loc_DB26B:
		push	seg seg008
		push	offset loc_5F84
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 3A00F5h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+285h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 1A4h
		push	dx
		push	large 4200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 6400F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+254h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 6E00D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+27Fh]
		cmp	ax, 2
		jnz	short loc_DB33A
		jmp	loc_DB401

loc_DB33A:
		cmp	ax, 3
		jz	short loc_DB3A4
		cmp	ax, 4
		jz	short loc_DB347
		jmp	loc_DB45E

loc_DB347:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0AF00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+25Ah]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 0B900D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_DB3A4:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 9600F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+258h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 0A000D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_DB401:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 7D00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+256h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 8700D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_DB45E:
		pop	di
		pop	si
		leave
		retf
sub_DB120		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB462		proc far

var_300		= word ptr -300h
var_2EA		= word ptr -2EAh
var_2E8		= word ptr -2E8h
var_2D4		= byte ptr -2D4h
var_2D0		= word ptr -2D0h
var_2C0		= word ptr -2C0h
var_2BE		= word ptr -2BEh
var_2BC		= word ptr -2BCh
var_2B8		= word ptr -2B8h
var_268		= word ptr -268h
var_264		= word ptr -264h
var_262		= word ptr -262h
var_201		= word ptr -201h
var_1FF		= word ptr -1FFh
var_1FD		= dword ptr -1FDh
var_1F4		= word ptr -1F4h
var_1F2		= word ptr -1F2h
var_1F0		= word ptr -1F0h
var_1EE		= word ptr -1EEh
var_1EC		= word ptr -1ECh
var_1EA		= word ptr -1EAh
var_1E6		= word ptr -1E6h
var_16E		= word ptr -16Eh
var_F6		= word ptr -0F6h
var_A6		= word ptr -0A6h
var_54		= word ptr -54h
var_51		= byte ptr -51h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= byte ptr -48h
var_47		= byte ptr -47h
var_46		= dword ptr -46h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 300h
		push	si
		push	di
		mov	di, [bp+arg_0]
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_75EC5
		pop	cx
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMedit
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	0
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	5
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DB512
		mov	word ptr [si+3], 0
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	si
		call	sub_7624F
		add	sp, 4
		mov	ax, si
		jmp	short loc_DB514

loc_DB512:
		mov	ax, si

loc_DB514:
		mov	[bp+var_C], ax
		push	1
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	3
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	2
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		push	3
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	3
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	3
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	1
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+var_C]
		push	word ptr [bx]
		mov	al, [bx+2]
		push	ax
		push	bx
		call	sub_76259
		add	sp, 8
		push	846h
		call	GameVar_Get_56414
		pop	cx
		mov	[bp+var_2B], al
		push	846h
		call	GameVar_SetFlag_5646D
		pop	cx
		push	104h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	[bp+var_2C], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_30], 14h
		push	0
		push	cs
		call	near ptr sub_DAFB0
		pop	cx
		mov	[bp+var_34], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_38], ax
		push	0F0h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_DB625
		jmp	loc_DB6D1

loc_DB625:
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	sub_75332
		pop	cx
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_75341
		pop	cx
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_75350
		pop	cx
		mov	ax, si
		add	ax, 28h
		push	ax
		call	sub_7535F
		pop	cx
		mov	word ptr [si+2Eh], 0
		mov	dword ptr [si+30h], 0
		mov	ax, si
		add	ax, 34h
		push	ax
		call	sub_75391
		pop	cx
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	sub_753AF
		pop	cx
		mov	ax, si
		add	ax, 40h
		push	ax
		call	sub_7530A
		pop	cx
		mov	word ptr [si+79h], 0
		mov	byte ptr [si+7Fh], 0
		push	seg seg067
		push	offset String_ConstructEmpty
		push	large 10003h
		push	9
		mov	ax, si
		add	ax, 9Fh
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word ptr [si+0CAh], 0
		mov	dword ptr [si+0ECh], 0
		push	[bp+var_38]
		push	si
		call	sub_752A8
		add	sp, 4
		mov	ax, si
		jmp	short loc_DB6D3

loc_DB6D1:
		mov	ax, si

loc_DB6D3:
		mov	[bp+var_36], ax
		mov	[bp+var_1F4], 0
		mov	[bp+var_1F2], 0
		mov	[bp+var_1F0], 0
		mov	[bp+var_1EE], 0
		mov	[bp+var_1EC], 13Fh
		mov	[bp+var_1EA], 0C7h
		push	0
		lea	ax, [bp+var_1F4]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		lea	ax, [bp+var_1F4]
		push	ax
		lea	ax, [bp+var_268]
		push	ax
		call	sub_74C9E
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_3A], ax
		push	8
		push	ax
		mov	ax, [bp+var_34]
		add	ax, 290h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_34]
		mov	byte ptr [bx+298h], 0
		push	bx
		call	sub_75CAA
		pop	cx
		mov	ax, [bp+var_34]
		add	ax, 0D2h
		push	ax
		call	sub_75C34
		pop	cx
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+24Ch]
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		push	[bp+var_34]
		push	cs
		call	near ptr sub_DB07A
		pop	cx
		lea	ax, [bp+var_30]
		mov	[bp+var_3C], ss
		mov	[bp+var_3E], ax
		lea	ax, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_268]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_75ECA
		add	sp, 0Ah
		lea	ax, [bp+var_30]
		mov	[bp+var_40], ss
		mov	[bp+var_42], ax
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_268]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_75ECF
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5F92
		lea	ax, [bp+var_2B8]
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
		lea	ax, [bp+var_2B8]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_F6]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_50+2], dx
		mov	word ptr [bp+var_50], ax
		mov	eax, [bp+var_50]
		mov	[bp+var_4C], eax
		mov	[bp+var_48], 2
		mov	[bp+var_47], 1
		mov	[bp+var_46], 0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, [bp+var_2D0]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		push	0Fh
		lea	ax, [bp+var_2D0]
		push	ax
		call	sub_6932C
		add	sp, 4
		mov	[bp+var_2C0], 1
		mov	[bp+var_2BE], 0
		push	2Dh
		lea	ax, [bp+var_2D0]
		push	ax
		mov	bx, [bp+var_2D0]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_2BC], ax
		push	1
		push	0
		call	sub_73263
		add	sp, 4
		mov	[bp+var_32], ax
		lea	ax, [bp+var_2D0]
		push	ax
		lea	ax, [bp+var_1F4]
		push	ax
		lea	ax, [bp+var_2EA]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	large 0
		lea	ax, [bp+var_2EA]
		push	ax
		lea	ax, [bp+var_300]
		push	ax
		call	sub_62958
		add	sp, 8
		mov	[bp+var_2D4], 4
		lea	ax, [bp+var_268]
		push	ax
		call	sub_74CC6
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		jmp	loc_DC1CD

loc_DB8C8:
		push	0
		lea	ax, [bp+var_1F4]
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0FFF2FFE4h
		lea	ax, [bp+var_1F4]
		push	ax
		push	[bp+var_32]
		call	sub_7329A
		add	sp, 8
		push	large 0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_1F4]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		mov	al, [bp+var_2D]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	[bp+var_34]
		call	sub_75986
		add	sp, 6
		mov	al, [bp+var_2D]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	[bp+var_34]
		call	sub_7598B
		add	sp, 6
		cmp	[bp+var_2D], 0
		jz	short loc_DB952
		push	[bp+var_34]
		lea	ax, [bp+var_2EA]
		push	ax
		call	sub_75981
		jmp	short loc_DB95E

loc_DB952:
		push	[bp+var_34]
		lea	ax, [bp+var_2EA]
		push	ax
		push	cs
		call	near ptr sub_DB120

loc_DB95E:
		add	sp, 4
		lea	ax, [bp+var_1F4]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		call	sub_6735D
		add	sp, 4
		lea	ax, [bp+var_268]
		push	ax
		call	sub_74CD5
		pop	cx
		lea	ax, [bp+var_54]
		push	ax
		call	sub_67383
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		lea	ax, [bp+var_1F4]
		push	ax
		push	word_7AF7C
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		jmp	short loc_DB9EF

loc_DB9A4:
		push	large 1
		lea	ax, [bp+var_268]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_54], ax
		cmp	[bp+var_54], 0
		jz	short loc_DB9EF
		cmp	word ptr [bp+var_1FD], 0
		jnz	short loc_DB9CB
		cmp	word ptr [bp+var_1FD+2], 0
		jz	short loc_DB9EF

loc_DB9CB:
		push	large [bp+var_1FD]
		mov	ax, [bp+var_1FF]
		sub	ax, [bp+var_262]
		push	ax
		mov	ax, [bp+var_201]
		sub	ax, [bp+var_264]
		push	ax
		lea	ax, [bp+var_268]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_DB9EF:
		cmp	[bp+var_30], 14h
		jz	short loc_DB9A4
		mov	bx, [bp+var_30]
		cmp	bx, 28h
		jbe	short loc_DBA00
		jmp	loc_DC1C8

loc_DBA00:
		shl	bx, 1
		jmp	cs:off_DC40A[bx]	; switch jump

loc_DBA07:
		mov	[bp+var_2E], 0

loc_DBA0B:
		mov	[bp+var_2C], 1
		jmp	loc_DC1C8

loc_DBA12:
		mov	bx, [bp+var_34]
		inc	word ptr [bx+28Bh]
		cmp	word ptr [bx+28Bh], 2
		jle	short loc_DBA28
		mov	word ptr [bx+28Bh], 2
		jmp	short loc_DBA28

loc_DBA28:
		push	[bp+var_34]
		call	sub_7595E
		pop	cx
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+24Ch]
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		jmp	loc_DC1C8

loc_DBA52:
		mov	bx, [bp+var_34]
		dec	word ptr [bx+28Bh]
		cmp	word ptr [bx+28Bh], 0
		jge	short loc_DBA68
		mov	word ptr [bx+28Bh], 0
		jmp	short loc_DBA68

loc_DBA68:
		push	[bp+var_34]
		call	sub_7595E
		pop	cx
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+24Ch]
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		jmp	loc_DC1C8

loc_DBA92:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		inc	word ptr [bx+24Ch]
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+24Ch], 18h
		jl	short loc_DBAC6
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+24Ch], 0
		jmp	short loc_DBAC6

loc_DBAC6:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+24Ch]
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		push	0FFFFh
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C65
		add	sp, 4
		mov	bx, [bp+var_34]
		mov	dx, [bx+28Bh]
		shl	dx, 1
		add	bx, dx
		mov	[bx+285h], ax
		jmp	loc_DC1C8

loc_DBB07:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		dec	word ptr [bx+24Ch]
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+24Ch], 0
		jge	short loc_DBB3B
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+24Ch], 17h
		jmp	short loc_DBB3B

loc_DBB3B:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+24Ch]
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		push	0FFFFh
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C65
		add	sp, 4
		mov	bx, [bp+var_34]
		mov	dx, [bx+28Bh]
		shl	dx, 1
		add	bx, dx
		mov	[bx+285h], ax
		jmp	loc_DC1C8

loc_DBB7C:
		mov	bx, [bp+var_34]
		mov	ax, [bx+27Fh]
		add	ax, [bx+281h]
		add	ax, [bx+283h]
		cmp	ax, 6
		jl	short loc_DBB93
		jmp	loc_DC1C8

loc_DBB93:
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		inc	word ptr [bx+27Fh]
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+27Fh], 4
		jle	short loc_DBBC6
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+27Fh], 4
		mov	al, 0
		jmp	short loc_DBBC8

loc_DBBC6:
		mov	al, 1

loc_DBBC8:
		or	al, al
		jz	short loc_DBBD5
		push	[bp+var_34]
		call	sub_7595E
		pop	cx

loc_DBBD5:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+27Fh], 1
		jz	short loc_DBBEA
		jmp	loc_DC1C8

loc_DBBEA:
		mov	bx, [bp+var_34]
		mov	al, [bx+28Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_DBBFA
		jmp	loc_DC1C8

loc_DBBFA:
		mov	byte ptr [bx+28Dh], 1
		mov	ax, [bx+28Bh]
		mov	[bx+28Eh], ax
		imul	ax, ax, 5
		add	bx, ax
		mov	byte ptr [bx+271h], 1
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	word ptr [bx+254h], 0
		jmp	loc_DC1C8

loc_DBC26:
		mov	bx, [bp+var_34]
		mov	ax, [bx+27Fh]
		add	ax, [bx+281h]
		add	ax, [bx+283h]
		jg	short loc_DBC3A
		jmp	loc_DC1C8

loc_DBC3A:
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	dx, [bx+27Fh]
		or	dx, dx
		jle	short loc_DBC64
		cmp	dx, 5
		jge	short loc_DBC64
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 5
		add	bx, ax
		add	bx, dx
		mov	byte ptr [bx+270h], 0
		jmp	short loc_DBC64

loc_DBC64:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		dec	word ptr [bx+27Fh]
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+27Fh], 0
		jge	short loc_DBC9A
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+27Fh], 0
		mov	al, 0
		jmp	short loc_DBC9C

loc_DBC9A:
		mov	al, 1

loc_DBC9C:
		or	al, al
		jnz	short loc_DBCA3
		jmp	loc_DBD3B

loc_DBCA3:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+27Fh]
		inc	ax
		jle	short loc_DBCF0
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+27Fh]
		inc	ax
		cmp	ax, 5
		jge	short loc_DBCF0
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	si, [bp+var_34]
		mov	ax, [si+28Bh]
		shl	ax, 1
		add	si, ax
		mov	ax, [si+27Fh]
		inc	ax
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_DBCF3

loc_DBCF0:
		mov	ax, 1

loc_DBCF3:
		push	ax
		push	[bp+var_34]
		call	sub_75CB9
		add	sp, 4
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		mov	dx, [bx+27Fh]
		inc	dx
		or	dx, dx
		jle	short loc_DBD32
		cmp	dx, 5
		jge	short loc_DBD32
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+252h], 1
		jmp	short loc_DBD32

loc_DBD32:
		push	[bp+var_34]
		call	sub_7595E
		pop	cx

loc_DBD3B:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+27Fh], 0
		jz	short loc_DBD50
		jmp	loc_DC1C8

loc_DBD50:
		mov	bx, [bp+var_34]
		cmp	byte ptr [bx+28Dh], 0
		jnz	short loc_DBD5D
		jmp	loc_DC1C8

loc_DBD5D:
		mov	ax, [bx+28Eh]
		cmp	ax, [bx+28Bh]
		jz	short loc_DBD6A
		jmp	loc_DC1C8

loc_DBD6A:
		mov	ax, [bx+28Bh]
		imul	ax, ax, 5
		add	bx, ax
		mov	byte ptr [bx+271h], 0
		mov	bx, [bp+var_34]
		mov	byte ptr [bx+28Dh], 0
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	word ptr [bx+254h], 1
		push	0
		push	[bp+var_34]
		call	sub_75CB9
		add	sp, 4
		jmp	loc_DC1C8

loc_DBD9F:
		mov	si, [bp+var_30]
		add	si, 0FFFAh
		or	si, si
		jle	short loc_DBDC6
		cmp	si, 5
		jge	short loc_DBDC6
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, si
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_DBDC9

loc_DBDC6:
		mov	ax, 1

loc_DBDC9:
		mov	[bp+var_54], ax
		push	ax
		push	[bp+var_34]
		call	sub_75CB9
		add	sp, 4
		push	[bp+var_54]
		push	[bp+var_34]
		call	sub_75CAF
		add	sp, 4
		mov	[bp+var_54], ax
		mov	dx, si
		mov	cx, [bp+var_54]
		or	dx, dx
		jle	short loc_DBE20
		cmp	dx, 5
		jge	short loc_DBE20
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	[bx+252h], cx
		cmp	cx, 2
		jl	short loc_DBE20
		push	cx
		push	[bp+var_34]
		call	sub_75CB9
		add	sp, 4
		jmp	short loc_DBE20

loc_DBE20:
		push	[bp+var_34]
		call	sub_7595E
		jmp	loc_DC1AA

loc_DBE2B:
		mov	si, [bp+var_30]
		add	si, 0FFF6h
		or	si, si
		jle	short loc_DBE52
		cmp	si, 5
		jge	short loc_DBE52
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, si
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_DBE55

loc_DBE52:
		mov	ax, 1

loc_DBE55:
		mov	[bp+var_54], ax
		push	ax
		push	[bp+var_34]
		call	sub_75CB9
		add	sp, 4
		push	[bp+var_54]
		push	[bp+var_34]
		call	sub_75CB4
		add	sp, 4
		mov	[bp+var_54], ax
		mov	dx, si
		mov	cx, [bp+var_54]
		or	dx, dx
		jle	short loc_DBEAD
		cmp	dx, 5
		jge	short loc_DBEAD
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	[bx+252h], cx
		cmp	cx, 2
		jl	short loc_DBEAD
		push	cx
		push	[bp+var_34]
		call	sub_75CB9
		add	sp, 4
		jmp	loc_DBE20

loc_DBEAD:
		jmp	loc_DBE20
		jmp	loc_DBE20

loc_DBEB3:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+285h]
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C65
		add	sp, 4
		mov	bx, [bp+var_34]
		mov	dx, [bx+28Bh]
		shl	dx, 1
		add	bx, dx
		mov	[bx+285h], ax
		jmp	loc_DC1C8

loc_DBEE3:
		mov	bx, [bp+var_34]
		mov	ax, [bx+28Bh]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+285h]
		mov	ax, [bp+var_34]
		add	ax, 1A4h
		push	ax
		call	sub_75C6A
		add	sp, 4
		mov	bx, [bp+var_34]
		mov	dx, [bx+28Bh]
		shl	dx, 1
		add	bx, dx
		mov	[bx+285h], ax
		jmp	loc_DC1C8

loc_DBF13:
		mov	bx, [bp+var_34]
		inc	word ptr [bx+470h]
		cmp	word ptr [bx+470h], 2
		jg	short loc_DBF24
		jmp	loc_DC17D

loc_DBF24:
		mov	word ptr [bx+470h], 2
		jmp	loc_DC1C8
		jmp	loc_DC17D

loc_DBF30:
		mov	bx, [bp+var_34]
		dec	word ptr [bx+470h]
		cmp	word ptr [bx+470h], 0
		jl	short loc_DBF41
		jmp	loc_DC17D

loc_DBF41:
		mov	word ptr [bx+470h], 0
		jmp	loc_DC1C8
		jmp	loc_DC17D

loc_DBF4D:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		inc	word ptr [bx+440h]
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+440h], 18h
		jl	short loc_DBF82
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+440h], 0
		jmp	loc_DC1A3

loc_DBF82:
		jmp	loc_DC1A3
		jmp	loc_DC1A3

loc_DBF88:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		dec	word ptr [bx+440h]
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+440h], 0
		jge	short loc_DBFBD
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+440h], 17h
		jmp	loc_DC1A3

loc_DBFBD:
		jmp	loc_DC1A3
		jmp	loc_DC1A3

loc_DBFC3:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+46Ah]
		mov	ax, [bp+var_34]
		add	ax, 401h
		push	ax
		call	sub_76125
		add	sp, 4
		mov	bx, [bp+var_34]
		mov	dx, [bx+470h]
		shl	dx, 1
		add	bx, dx
		mov	[bx+46Ah], ax
		jmp	loc_DC1C8

loc_DBFF3:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		push	word ptr [bx+46Ah]
		mov	ax, [bp+var_34]
		add	ax, 401h
		push	ax
		call	sub_7612A
		add	sp, 4
		mov	bx, [bp+var_34]
		mov	dx, [bx+470h]
		shl	dx, 1
		add	bx, dx
		mov	[bx+46Ah], ax
		jmp	loc_DC1C8

loc_DC023:
		mov	bx, [bp+var_34]
		mov	ax, [bx+446h]
		add	ax, [bx+448h]
		add	ax, [bx+44Ah]
		cmp	ax, 6
		jl	short loc_DC03A
		jmp	loc_DC1C8

loc_DC03A:
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		inc	word ptr [bx+446h]
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+446h], 4
		jg	short loc_DC05B
		jmp	loc_DC17D

loc_DC05B:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+446h], 4
		jmp	loc_DC1C8
		jmp	loc_DC17D

loc_DC072:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		dec	word ptr [bx+446h]
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		cmp	word ptr [bx+446h], 0
		jl	short loc_DC096
		jmp	loc_DC17D

loc_DC096:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+446h], 0
		jmp	loc_DC1C8
		jmp	loc_DC17D

loc_DC0AD:
		mov	si, [bp+var_30]
		add	si, 0FFE8h
		or	si, si
		jle	short loc_DC0D4
		cmp	si, 5
		jge	short loc_DC0D4
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, si
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+44Ch]
		jmp	short loc_DC0D6

loc_DC0D4:
		xor	ax, ax

loc_DC0D6:
		mov	dx, ax
		push	ax
		mov	ax, [bp+var_34]
		add	ax, 3C5h
		push	ax
		call	sub_76075
		add	sp, 4
		mov	dx, ax
		mov	cx, si
		mov	[bp+var_54], dx
		or	cx, cx
		jg	short loc_DC0F6
		jmp	loc_DC17D

loc_DC0F6:
		cmp	cx, 5
		jl	short loc_DC0FE
		jmp	loc_DC17D

loc_DC0FE:
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_54]
		jmp	short loc_DC177
		jmp	short loc_DC17D

loc_DC117:
		mov	si, [bp+var_30]
		add	si, 0FFE4h
		or	si, si
		jle	short loc_DC13E
		cmp	si, 5
		jge	short loc_DC13E
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, si
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+44Ch]
		jmp	short loc_DC140

loc_DC13E:
		xor	ax, ax

loc_DC140:
		mov	dx, ax
		push	ax
		mov	ax, [bp+var_34]
		add	ax, 3C5h
		push	ax
		call	sub_7607A
		add	sp, 4
		mov	dx, ax
		mov	cx, si
		mov	[bp+var_54], dx
		or	cx, cx
		jle	short loc_DC17D
		cmp	cx, 5
		jge	short loc_DC17D
		mov	bx, [bp+var_34]
		mov	ax, [bx+470h]
		imul	ax, ax, 0Ah
		add	bx, ax
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_54]

loc_DC177:
		mov	[bx+44Ch], ax
		jmp	short loc_DC1C8

loc_DC17D:
		jmp	short loc_DC1C8

loc_DC17F:
		cmp	[bp+var_2D], 0
		jz	short loc_DC18E
		push	[bp+var_34]
		push	cs
		call	near ptr sub_DB001
		jmp	short loc_DC196

loc_DC18E:
		push	[bp+var_34]
		call	sub_75954

loc_DC196:
		pop	cx
		jmp	short loc_DC1A3

loc_DC199:
		mov	[bp+var_2D], 0
		jmp	short loc_DC1C8

loc_DC19F:
		mov	[bp+var_2D], 1

loc_DC1A3:
		push	[bp+var_34]
		push	cs
		call	near ptr sub_DB07A

loc_DC1AA:
		pop	cx
		jmp	short loc_DC1C8

loc_DC1AD:
		mov	bx, [bp+var_34]
		mov	al, [bx+28Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DC1C1
		call	sub_75990
		jmp	short loc_DC1C8

loc_DC1C1:
		mov	[bp+var_2E], 1
		jmp	loc_DBA0B

loc_DC1C8:
		mov	[bp+var_30], 14h

loc_DC1CD:
		mov	al, [bp+var_2C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DC1D9
		jmp	loc_DB8C8

loc_DC1D9:
		push	104h
		call	GameVar_ClearFlag_56520
		pop	cx
		cmp	[bp+var_2B], 0
		jz	short loc_DC1F2
		push	846h
		call	GameVar_SetFlag_5646D
		jmp	short loc_DC1FA

loc_DC1F2:
		push	846h
		call	GameVar_ClearFlag_56520

loc_DC1FA:
		pop	cx
		lea	ax, [bp+var_268]
		push	ax
		call	sub_74CEE
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		cmp	[bp+var_C], 0
		jz	short loc_DC22E
		push	[bp+var_C]
		call	sub_7627C
		pop	cx
		push	[bp+var_C]
		call	sub_3B2
		pop	cx
		jmp	short loc_DC22E

loc_DC22E:
		cmp	[bp+var_32], 0
		jz	short loc_DC241
		push	3
		push	[bp+var_32]
		call	sub_73268
		add	sp, 4

loc_DC241:
		push	[bp+var_36]
		call	sub_752B2
		pop	cx
		call	sub_7522C
		cmp	[bp+var_36], 0
		jz	short loc_DC262
		push	3
		push	[bp+var_36]
		call	sub_752AD
		add	sp, 4

loc_DC262:
		cmp	[bp+var_2E], 0
		jz	short loc_DC27B
		push	[bp+arg_4]
		push	[bp+var_34]
		nop
		push	cs
		call	near ptr sub_DC99A
		add	sp, 4
		mov	byte ptr [di+4ECh], 0

loc_DC27B:
		push	[bp+var_34]
		call	sub_3B2
		pop	cx
		mov	al, [bp+var_2E]
		mov	[bp+var_51], al
		push	2
		lea	ax, [bp+var_300]
		push	ax
		call	sub_629D1
		add	sp, 4
		lea	ax, [bp+var_2E8]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_2D0]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_47], 0
		jz	short loc_DC2D7
		cmp	[bp+var_4C], 0
		jz	short loc_DC2D7
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DC2D7

loc_DC2D7:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		push	2
		lea	ax, [bp+var_268]
		push	ax
		call	sub_74CA8
		add	sp, 4
		lea	ax, [bp+var_1F4]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		cmp	[bp+var_25], 0
		jz	short loc_DC329
		cmp	[bp+var_2A], 0
		jz	short loc_DC329
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DC329

loc_DC329:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		cmp	[bp+var_1B], 0
		jz	short loc_DC361
		cmp	[bp+var_20], 0
		jz	short loc_DC361
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DC361

loc_DC361:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	[bp+var_11], 0
		jz	short loc_DC399
		cmp	[bp+var_16], 0
		jz	short loc_DC399
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DC399

loc_DC399:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_1E6]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		cmp	[bp+var_5], 0
		jz	short loc_DC3E0
		cmp	[bp+var_A], 0
		jz	short loc_DC3E0
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DC3E0

loc_DC3E0:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, [bp+var_16E]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	al, [bp+var_51]
		pop	di
		pop	si
		leave
		retf
sub_DB462		endp

; START OF FUNCTION CHUNK FOR sub_DB462
off_DC40A	dw offset loc_DBA07
		dw offset loc_DBA92
		dw offset loc_DBB07
		dw offset loc_DBB7C
		dw offset loc_DBC26
		dw offset loc_DBEB3
		dw offset loc_DBEE3
		dw offset loc_DBD9F
		dw offset loc_DBD9F
		dw offset loc_DBD9F
		dw offset loc_DBD9F
		dw offset loc_DBE2B
		dw offset loc_DBE2B
		dw offset loc_DBE2B
		dw offset loc_DBE2B
		dw offset loc_DBA12
		dw offset loc_DBA52
		dw offset loc_DC1C8
		dw offset loc_DC1C8
		dw offset loc_DC1C8
		dw offset loc_DC1C8
		dw offset loc_DBF4D
		dw offset loc_DBF88
		dw offset loc_DC023
		dw offset loc_DC072
		dw offset loc_DC0AD
		dw offset loc_DC0AD
		dw offset loc_DC0AD
		dw offset loc_DC0AD
		dw offset loc_DC117
		dw offset loc_DC117
		dw offset loc_DC117
		dw offset loc_DC117
		dw offset loc_DBF13
		dw offset loc_DBF30
		dw offset loc_DBFC3
		dw offset loc_DBFF3
		dw offset loc_DC17F
		dw offset loc_DC199
		dw offset loc_DC19F
		dw offset loc_DC1AD
; END OF FUNCTION CHUNK FOR sub_DB462

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DC45C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	si, [bp+arg_6]
		inc	si
		mov	bx, [bp+arg_4]
		sub	bx, 0Ah
		cmp	bx, 0Dh
		jbe	short loc_DC478
		jmp	loc_DC605

loc_DC478:
		shl	bx, 1
		jmp	cs:off_DC611[bx]	; switch jump

loc_DC47F:
		push	8
		push	cx

loc_DC482:
		push	dx
		call	CRT_Strncpy_Pad
		add	sp, 6
		jmp	loc_DC60E

loc_DC48E:
		mov	ax, si
		cmp	ax, 1
		jz	short loc_DC47F
		cmp	ax, 2
		jz	short loc_DC4A4
		cmp	ax, 4
		jz	short loc_DC4AE
		jmp	loc_DC60E
		jmp	short loc_DC47F

loc_DC4A4:
		push	8
		mov	ax, cx
		add	ax, 28h
		jmp	loc_DC601

loc_DC4AE:
		push	8
		mov	ax, cx
		add	ax, 30h
		jmp	loc_DC601

loc_DC4B8:
		mov	ax, si
		cmp	ax, 1
		jz	short loc_DC47F
		cmp	ax, 2
		jz	short loc_DC4C9
		jmp	loc_DC60E
		jmp	short loc_DC47F

loc_DC4C9:
		push	8
		mov	ax, cx
		add	ax, 0A0h
		jmp	loc_DC601

loc_DC4D3:
		mov	ax, si
		cmp	ax, 1
		jz	short loc_DC4E7
		cmp	ax, 3
		jz	short loc_DC4F1
		cmp	ax, 4
		jz	short loc_DC4FB
		jmp	loc_DC60E

loc_DC4E7:
		push	8
		mov	ax, cx
		add	ax, 0B0h
		jmp	loc_DC601

loc_DC4F1:
		push	8
		mov	ax, cx
		add	ax, 0A8h
		jmp	loc_DC601

loc_DC4FB:
		push	8
		mov	ax, cx
		add	ax, 0B8h
		jmp	loc_DC601

loc_DC505:
		mov	ax, si
		cmp	ax, 1
		jz	short loc_DC519
		cmp	ax, 2
		jz	short loc_DC523
		cmp	ax, 3
		jz	short loc_DC52D
		jmp	loc_DC60E

loc_DC519:
		push	8
		mov	ax, cx
		add	ax, 18h
		jmp	loc_DC601

loc_DC523:
		push	8
		mov	ax, cx
		add	ax, 0C0h
		jmp	loc_DC601

loc_DC52D:
		push	8
		mov	ax, cx
		add	ax, 40h
		jmp	loc_DC601

loc_DC537:
		push	8
		mov	ax, cx
		add	ax, 0C8h
		jmp	loc_DC601

loc_DC541:
		mov	ax, si
		cmp	ax, 4
		jz	short loc_DC54A
		jmp	short loc_DC554

loc_DC54A:
		push	8
		mov	ax, cx
		add	ax, 50h
		jmp	loc_DC601

loc_DC554:
		push	8
		mov	ax, cx
		add	ax, 48h
		jmp	loc_DC601

loc_DC55E:
		mov	ax, si
		cmp	ax, 1
		jnz	short loc_DC568
		jmp	loc_DC47F

loc_DC568:
		cmp	ax, 2
		jz	short loc_DC5BF
		jmp	loc_DC60E
		jmp	loc_DC47F
		jmp	short loc_DC5BF

loc_DC575:
		mov	ax, si
		cmp	ax, 3
		jz	short loc_DC57E
		jmp	short loc_DC587

loc_DC57E:
		push	8
		mov	ax, cx
		add	ax, 60h
		jmp	short loc_DC601

loc_DC587:
		push	8
		mov	ax, cx
		add	ax, 58h
		jmp	short loc_DC601

loc_DC590:
		mov	ax, si
		cmp	ax, 4
		jz	short loc_DC599
		jmp	short loc_DC5A2

loc_DC599:
		push	8
		mov	ax, cx
		add	ax, 70h
		jmp	short loc_DC601

loc_DC5A2:
		push	8
		mov	ax, cx
		add	ax, 68h
		jmp	short loc_DC601

loc_DC5AB:
		mov	ax, si
		cmp	ax, 1
		jnz	short loc_DC5B5
		jmp	loc_DC47F

loc_DC5B5:
		cmp	ax, 2
		jz	short loc_DC5BF
		jmp	short loc_DC60E
		jmp	loc_DC47F

loc_DC5BF:
		push	8
		mov	ax, cx
		add	ax, 90h
		jmp	short loc_DC601

loc_DC5C8:
		mov	ax, si
		cmp	ax, 1
		jz	short loc_DC5F1
		cmp	ax, 2
		jz	short loc_DC5D8
		jmp	short loc_DC60E
		jmp	short loc_DC5F1

loc_DC5D8:
		push	8
		mov	ax, cx
		add	ax, 0D0h
		jmp	short loc_DC601

loc_DC5E1:
		jmp	short loc_DC5F1

loc_DC5E3:
		mov	ax, si
		cmp	ax, 1
		jz	short loc_DC5F1
		cmp	ax, 2
		jz	short loc_DC5FA
		jmp	short loc_DC60E

loc_DC5F1:
		push	8
		mov	ax, cx
		add	ax, 8
		jmp	short loc_DC601

loc_DC5FA:
		push	8
		mov	ax, cx
		add	ax, 0D8h

loc_DC601:
		push	ax
		jmp	loc_DC482

loc_DC605:
		push	428Eh
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_DC60E:
		pop	si
		pop	bp
		retf
sub_DC45C		endp

; START OF FUNCTION CHUNK FOR sub_DC45C
off_DC611	dw offset loc_DC47F
		dw offset loc_DC48E
		dw offset loc_DC4B8
		dw offset loc_DC4D3
		dw offset loc_DC505
		dw offset loc_DC537
		dw offset loc_DC541
		dw offset loc_DC55E
		dw offset loc_DC575
		dw offset loc_DC590
		dw offset loc_DC5AB
		dw offset loc_DC5C8
		dw offset loc_DC5E1
		dw offset loc_DC5E3
; END OF FUNCTION CHUNK FOR sub_DC45C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DC62D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_8]
		mov	bx, [bp+arg_4]
		sub	bx, 0Ah
		cmp	bx, 0Dh
		jbe	short loc_DC64C
		jmp	loc_DC7E8

loc_DC64C:
		shl	bx, 1
		jmp	cs:off_DC7F5[bx]	; switch jump

loc_DC653:
		push	8
		push	cx

loc_DC656:
		push	dx
		call	CRT_Strncpy_Pad
		add	sp, 6
		jmp	loc_DC7F1

loc_DC662:
		mov	ax, si
		or	ax, ax
		jz	short loc_DC653
		cmp	ax, 1
		jz	short loc_DC677
		cmp	ax, 2
		jz	short loc_DC653
		jmp	loc_DC7F1
		jmp	short loc_DC653

loc_DC677:
		cmp	di, 1
		jnz	short loc_DC686
		push	8
		mov	ax, cx
		add	ax, 28h
		jmp	loc_DC7E4

loc_DC686:
		push	8
		mov	ax, cx
		add	ax, 30h
		jmp	loc_DC7E4

loc_DC690:
		mov	ax, si
		or	ax, ax
		jz	short loc_DC653
		cmp	ax, 1
		jz	short loc_DC6A5
		cmp	ax, 2
		jz	short loc_DC653
		jmp	loc_DC7F1
		jmp	short loc_DC653

loc_DC6A5:
		cmp	di, 1
		jz	short loc_DC6AD
		jmp	loc_DC7F1

loc_DC6AD:
		push	8
		mov	ax, cx
		add	ax, 0A0h
		jmp	loc_DC7E4

loc_DC6B7:
		mov	ax, si
		or	ax, ax
		jz	short loc_DC6CA
		cmp	ax, 1
		jz	short loc_DC6D4
		cmp	ax, 2
		jz	short loc_DC6CA
		jmp	loc_DC7F1

loc_DC6CA:
		push	8
		mov	ax, cx
		add	ax, 0B0h
		jmp	loc_DC7E4

loc_DC6D4:
		cmp	di, 1
		jnz	short loc_DC6E3
		push	8
		mov	ax, cx
		add	ax, 0A8h
		jmp	loc_DC7E4

loc_DC6E3:
		push	8
		mov	ax, cx
		add	ax, 0B8h
		jmp	loc_DC7E4

loc_DC6ED:
		mov	ax, si
		or	ax, ax
		jz	short loc_DC700
		cmp	ax, 1
		jz	short loc_DC70A
		cmp	ax, 2
		jz	short loc_DC700
		jmp	loc_DC7F1

loc_DC700:
		push	8
		mov	ax, cx
		add	ax, 18h
		jmp	loc_DC7E4

loc_DC70A:
		push	8
		mov	ax, cx
		add	ax, 40h
		jmp	loc_DC7E4

loc_DC714:
		mov	ax, si
		or	ax, ax
		jz	short loc_DC722
		cmp	ax, 2
		jz	short loc_DC722
		jmp	loc_DC7F1

loc_DC722:
		push	8
		mov	ax, cx
		add	ax, 0C8h
		jmp	loc_DC7E4

loc_DC72C:
		cmp	di, 1
		jnz	short loc_DC73B
		push	8
		mov	ax, cx
		add	ax, 48h
		jmp	loc_DC7E4

loc_DC73B:
		push	8
		mov	ax, cx
		add	ax, 50h
		jmp	loc_DC7E4

loc_DC745:
		jmp	short loc_DC79A

loc_DC747:
		mov	ax, si
		or	ax, ax
		jnz	short loc_DC750
		jmp	loc_DC7D4

loc_DC750:
		cmp	ax, 1
		jz	short loc_DC75F
		cmp	ax, 2
		jz	short loc_DC7D4
		jmp	loc_DC7F1
		jmp	short loc_DC7D4

loc_DC75F:
		push	8
		mov	ax, cx
		add	ax, 58h
		jmp	short loc_DC7E4

loc_DC768:
		cmp	di, 1
		jnz	short loc_DC776
		push	8
		mov	ax, cx
		add	ax, 68h
		jmp	short loc_DC7E4

loc_DC776:
		push	8
		mov	ax, cx
		add	ax, 70h
		jmp	short loc_DC7E4

loc_DC77F:
		mov	ax, si
		or	ax, ax
		jnz	short loc_DC788
		jmp	loc_DC653

loc_DC788:
		cmp	ax, 1
		jz	short loc_DC79A
		cmp	ax, 2
		jnz	short loc_DC795
		jmp	loc_DC653

loc_DC795:
		jmp	short loc_DC7F1
		jmp	loc_DC653

loc_DC79A:
		push	8
		mov	ax, cx
		add	ax, 90h
		jmp	short loc_DC7E4

loc_DC7A3:
		mov	ax, si
		or	ax, ax
		jz	short loc_DC7D4
		cmp	ax, 1
		jz	short loc_DC7B7
		cmp	ax, 2
		jz	short loc_DC7D4
		jmp	short loc_DC7F1
		jmp	short loc_DC7D4

loc_DC7B7:
		push	8
		mov	ax, cx
		add	ax, 0D0h
		jmp	short loc_DC7E4

loc_DC7C0:
		jmp	short loc_DC7D4

loc_DC7C2:
		mov	ax, si
		or	ax, ax
		jz	short loc_DC7D4
		cmp	ax, 1
		jz	short loc_DC7DD
		cmp	ax, 2
		jz	short loc_DC7D4
		jmp	short loc_DC7F1

loc_DC7D4:
		push	8
		mov	ax, cx
		add	ax, 8
		jmp	short loc_DC7E4

loc_DC7DD:
		push	8
		mov	ax, cx
		add	ax, 0D8h

loc_DC7E4:
		push	ax
		jmp	loc_DC656

loc_DC7E8:
		push	4294h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_DC7F1:
		pop	di
		pop	si
		pop	bp
		retf
sub_DC62D		endp

; START OF FUNCTION CHUNK FOR sub_DC62D
off_DC7F5	dw offset loc_DC653
		dw offset loc_DC662
		dw offset loc_DC690
		dw offset loc_DC6B7
		dw offset loc_DC6ED
		dw offset loc_DC714
		dw offset loc_DC72C
		dw offset loc_DC745
		dw offset loc_DC747
		dw offset loc_DC768
		dw offset loc_DC77F
		dw offset loc_DC7A3
		dw offset loc_DC7C0
		dw offset loc_DC7C2
; END OF FUNCTION CHUNK FOR sub_DC62D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DC811		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_2]
		mov	ax, [bp+arg_0]
		or	ax, ax
		jz	short loc_DC82D
		cmp	ax, 1
		jz	short loc_DC885
		cmp	ax, 2
		jz	short loc_DC82D
		jmp	loc_DC976

loc_DC82D:
		mov	ax, [bp+arg_6]
		or	ax, ax
		jz	short loc_DC841
		cmp	ax, 1
		jz	short loc_DC847
		cmp	ax, 2
		jz	short loc_DC847
		jmp	loc_DC976

loc_DC841:
		mov	si, 1
		jmp	loc_DC976

loc_DC847:
		cmp	[bp+arg_6], 1
		jnz	short loc_DC872
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		cmp	ax, 32h
		jle	short loc_DC86F
		mov	si, 1
		jmp	short loc_DC872

loc_DC86F:
		mov	si, 5

loc_DC872:
		mov	bx, di
		cmp	bx, 9
		jbe	short loc_DC87C
		jmp	loc_DC976

loc_DC87C:
		shl	bx, 1
		jmp	cs:off_DC986[bx]	; switch jump

loc_DC883:
		jmp	short loc_DC841

loc_DC885:
		mov	ax, [bp+arg_4]
		cmp	ax, 1
		jz	short loc_DC898
		cmp	ax, 2
		jnz	short loc_DC895
		jmp	loc_DC919

loc_DC895:
		jmp	loc_DC976

loc_DC898:
		mov	ax, [bp+arg_6]
		or	ax, ax
		jz	short loc_DC8AB
		cmp	ax, 1
		jz	short loc_DC8BC
		cmp	ax, 2
		jz	short loc_DC8BC
		jmp	short loc_DC919

loc_DC8AB:
		cmp	di, 2
		jz	short loc_DC8B5
		cmp	di, 3
		jnz	short loc_DC916

loc_DC8B5:
		mov	si, 2
		jmp	short loc_DC919
		jmp	short loc_DC916

loc_DC8BC:
		cmp	[bp+arg_6], 1
		jnz	short loc_DC8F3
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		cmp	ax, 32h
		jle	short loc_DC905
		cmp	di, 2
		jz	short loc_DC8E9
		cmp	di, 3
		jnz	short loc_DC8EE

loc_DC8E9:
		mov	si, 2
		jmp	short loc_DC905

loc_DC8EE:
		mov	si, 3
		jmp	short loc_DC905

loc_DC8F3:
		cmp	di, 2
		jz	short loc_DC8FD
		cmp	di, 3
		jnz	short loc_DC902

loc_DC8FD:
		mov	si, 6
		jmp	short loc_DC905

loc_DC902:
		mov	si, 7

loc_DC905:
		mov	bx, di
		sub	bx, 5
		cmp	bx, 4
		ja	short loc_DC919
		shl	bx, 1
		jmp	cs:off_DC97C[bx]	; switch jump

loc_DC916:
		mov	si, 3

loc_DC919:
		mov	ax, [bp+arg_6]
		or	ax, ax
		jz	short loc_DC92C
		cmp	ax, 1
		jz	short loc_DC938
		cmp	ax, 2
		jz	short loc_DC938
		jmp	short loc_DC976

loc_DC92C:
		cmp	di, 6
		jnz	short loc_DC973
		mov	si, 3
		jmp	short loc_DC976
		jmp	short loc_DC973

loc_DC938:
		mov	si, 8
		cmp	[bp+arg_6], 1
		jnz	short loc_DC961
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		cmp	ax, 32h
		jle	short loc_DC961
		mov	si, 4

loc_DC961:
		cmp	di, 6
		jnz	short loc_DC969
		mov	si, 3

loc_DC969:
		cmp	di, 5
		jz	short loc_DC973
		cmp	di, 8
		jnz	short loc_DC976

loc_DC973:
		mov	si, 4

loc_DC976:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_DC811		endp

; START OF FUNCTION CHUNK FOR sub_DC811
off_DC97C	dw offset loc_DC916
		dw offset loc_DC916
		dw offset loc_DC919
		dw offset loc_DC916
		dw offset loc_DC916
off_DC986	dw offset loc_DC883
		dw offset loc_DC883
		dw offset loc_DC976
		dw offset loc_DC976
		dw offset loc_DC976
		dw offset loc_DC883
		dw offset loc_DC883
		dw offset loc_DC976
		dw offset loc_DC883
		dw offset loc_DC883
; END OF FUNCTION CHUNK FOR sub_DC811

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DC99A		proc far

var_58C		= word ptr -58Ch
var_53C		= word ptr -53Ch
var_49C		= word ptr -49Ch
var_3BC		= word ptr -3BCh
var_36C		= word ptr -36Ch
var_31C		= word ptr -31Ch
var_31A		= word ptr -31Ah
var_30A		= word ptr -30Ah
var_2DE		= word ptr -2DEh
var_281		= dword ptr -281h
var_27D		= dword ptr -27Dh
var_279		= dword ptr -279h
var_271		= byte ptr -271h
var_268		= dword ptr -268h
var_236		= word ptr -236h
var_1E6		= word ptr -1E6h
var_189		= dword ptr -189h
var_185		= dword ptr -185h
var_181		= dword ptr -181h
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_13E		= word ptr -13Eh
var_EE		= word ptr -0EEh
var_9E		= word ptr -9Eh
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 53Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_DC9AF

loc_DC9AA:
		mov	byte ptr [bp+di+var_6], 0
		inc	di

loc_DC9AF:
		cmp	di, 3
		jl	short loc_DC9AA
		push	seg seg008
		push	offset loc_5F9D
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_5FA1
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_EE]
		push	ax
		push	ss
		lea	ax, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		cmp	byte ptr [si+290h], 0
		jz	short loc_DCA16
		mov	ax, si
		add	ax, 290h
		jmp	short loc_DCA2D

loc_DCA16:
		push	seg seg008
		push	offset loc_5FA9
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_9E]

loc_DCA2D:
		push	ax
		mov	ax, word_7D14D
		add	ax, 7BAh
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1E6], 508h
		mov	[bp+var_185], 100h
		mov	[bp+var_189], 0
		mov	[bp+var_1E6], 520h
		mov	[bp+var_16A], 0
		xor	ax, ax
		mov	[bp+var_16C], ax
		movsx	eax, ax
		mov	[bp+var_181], eax
		mov	[bp+var_1E6], 15AEh
		push	0
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		mov	al, 0
		push	5
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	ax, word_7D14D
		add	ax, 7BAh
		mov	word ptr [bp+var_12+2], ds
		mov	word ptr [bp+var_12], ax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		push	dx
		push	ax
		push	large [bp+var_12]
		push	large [bp+var_E]
		lea	ax, [bp+var_236]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_2DE]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_2DE], 508h
		mov	[bp+var_27D], 100h
		mov	[bp+var_281], 0
		mov	[bp+var_2DE], 520h
		push	1
		lea	ax, [bp+var_236]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		mov	bx, [bp+var_2DE]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_2DE]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	large 0
		push	large 4E53494Dh
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766BF
		pop	cx
		lea	ax, [bp+var_2DE]
		push	ax
		push	large 54534143h
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_7670A
		add	sp, 8
		push	large 0
		push	large 54534143h
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 54534143h
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		push	large 9
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_RecordCount_6DDDF
		add	sp, 6
		mov	di, ax
		sub	di, 24h
		mov	[bp+var_22], 0
		jmp	short loc_DCBE2

loc_DCBAA:
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_181]
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 9
		inc	[bp+var_22]

loc_DCBE2:
		cmp	[bp+var_22], di
		jl	short loc_DCBAA
		push	large 0E6h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 0E7h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 0E8h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 0E9h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 0EAh
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 0EBh
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 47h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 96h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 97h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 98h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 3Ch
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 3Dh
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 3Eh
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 3Fh
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 40h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 41h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 42h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 43h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 44h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 45h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 46h
		call	GameVar_Set_564BB
		add	sp, 4
		push	seg seg008
		push	offset loc_5FB1
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_9E]
		mov	[bp+var_24], ax
		push	8
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_30], 0
		mov	[bp+var_34], 0
		jmp	loc_DCEEF

loc_DCD1F:
		xor	di, di
		jmp	loc_DCE5D

loc_DCD24:
		mov	dx, di
		or	dx, dx
		jl	short loc_DCD35
		cmp	dx, 3
		jge	short loc_DCD35
		mov	[si+470h], dx
		jmp	short loc_DCD35

loc_DCD35:
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+46Ah]
		cmp	ax, [bp+var_34]
		jz	short loc_DCD47
		jmp	loc_DCE5C

loc_DCD47:
		mov	bx, [si+470h]
		shl	bx, 1
		cmp	word ptr [bx+si+446h], 0
		jnz	short loc_DCD57
		jmp	loc_DCE5C

loc_DCD57:
		inc	[bp+var_30]
		mov	[bp+var_42], 1
		jmp	loc_DCDFF

loc_DCD62:
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+446h]
		cmp	ax, [bp+var_42]
		jl	short loc_DCDDC
		cmp	[bp+var_42], 0
		jle	short loc_DCDAA
		cmp	[bp+var_42], 5
		jge	short loc_DCDAA
		mov	ax, [si+470h]
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, [bp+var_42]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+44Ch]
		jmp	short loc_DCDAC

loc_DCDAA:
		xor	ax, ax

loc_DCDAC:
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_75977
		add	sp, 4
		push	8
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_20]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	8
		push	[bp+var_24]
		lea	ax, [bp+var_2E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_DCDDC:
		push	large [bp+var_181]
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 9
		inc	[bp+var_42]

loc_DCDFF:
		cmp	[bp+var_42], 4
		jg	short loc_DCE08
		jmp	loc_DCD62

loc_DCE08:
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+46Ah]
		or	ax, ax
		jz	short loc_DCE22
		cmp	ax, 1
		jz	short loc_DCE31
		cmp	ax, 2
		jz	short loc_DCE43
		jmp	short loc_DCE5C

loc_DCE22:
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+446h]
		push	0EBh
		jmp	short loc_DCE54

loc_DCE31:
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+446h]
		mov	ax, [bp+var_30]
		add	ax, 0E5h
		jmp	short loc_DCE53

loc_DCE43:
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+446h]
		mov	ax, [bp+var_30]
		add	ax, 0E7h

loc_DCE53:
		push	ax

loc_DCE54:
		call	GameVar_Set_564BB
		add	sp, 4

loc_DCE5C:
		inc	di

loc_DCE5D:
		cmp	di, 3
		jge	short loc_DCE65
		jmp	loc_DCD24

loc_DCE65:
		mov	ax, [bp+var_34]
		or	ax, ax
		jz	short loc_DCE78
		cmp	ax, 1
		jz	short loc_DCE83
		cmp	ax, 2
		jz	short loc_DCE88
		jmp	short loc_DCE8D

loc_DCE78:
		mov	ax, 1

loc_DCE7B:
		sub	ax, [bp+var_30]
		mov	[bp+var_32], ax
		jmp	short loc_DCE92

loc_DCE83:
		mov	ax, 2
		jmp	short loc_DCE7B

loc_DCE88:
		mov	ax, 3
		jmp	short loc_DCE7B

loc_DCE8D:
		mov	[bp+var_32], 0

loc_DCE92:
		cmp	[bp+var_32], 0
		jle	short loc_DCEE7
		xor	di, di
		jmp	short loc_DCEE2

loc_DCE9C:
		mov	[bp+var_42], 0
		jmp	short loc_DCEDB

loc_DCEA3:
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_181]
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 9
		inc	[bp+var_42]

loc_DCEDB:
		cmp	[bp+var_42], 4
		jl	short loc_DCEA3
		inc	di

loc_DCEE2:
		cmp	di, [bp+var_32]
		jl	short loc_DCE9C

loc_DCEE7:
		mov	[bp+var_30], 0
		inc	[bp+var_34]

loc_DCEEF:
		cmp	[bp+var_34], 3
		jge	short loc_DCEF8
		jmp	loc_DCD1F

loc_DCEF8:
		lea	ax, [bp+var_3E]
		push	ss
		push	ax
		push	ds
		push	offset unk_7A9AE
		mov	cx, 0Ah
		call	CRT_Fmemcpy
		xor	di, di
		jmp	loc_DD134

loc_DCF0E:
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+24Ch]
		mov	ax, di
		add	ax, 96h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4
		or	di, di
		jnz	short loc_DCF46
		mov	dx, [si+28Eh]
		or	dx, dx
		jl	short loc_DCF3D
		cmp	dx, 3
		jge	short loc_DCF3D
		mov	[si+28Bh], dx
		jmp	short loc_DCF3D

loc_DCF3D:
		mov	bx, [si+28Eh]
		lea	ax, [bp+var_6]
		jmp	short loc_DCF8A

loc_DCF46:
		mov	[bp+var_42], 0
		jmp	short loc_DCF50

loc_DCF4D:
		inc	[bp+var_42]

loc_DCF50:
		lea	ax, [bp+var_6]
		mov	bx, [bp+var_42]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_DCF63
		cmp	[bp+var_42], 3
		jl	short loc_DCF4D

loc_DCF63:
		cmp	[bp+var_42], 3
		jl	short loc_DCF72
		push	0B0B0h
		call	sub_1DDFE
		pop	cx

loc_DCF72:
		mov	dx, [bp+var_42]
		or	dx, dx
		jl	short loc_DCF84
		cmp	dx, 3
		jge	short loc_DCF84
		mov	[si+28Bh], dx
		jmp	short loc_DCF84

loc_DCF84:
		lea	ax, [bp+var_6]
		mov	bx, [bp+var_42]

loc_DCF8A:
		add	bx, ax
		mov	byte ptr [bx], 1
		mov	[bp+var_2], 1
		jmp	loc_DD12A

loc_DCF97:
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		or	di, di
		jnz	short loc_DCFB9
		cmp	[bp+var_2], 1
		jnz	short loc_DCFB9
		jmp	loc_DD107

loc_DCFB9:
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+27Fh]
		cmp	ax, [bp+var_2]
		jge	short loc_DCFCB
		jmp	loc_DD107

loc_DCFCB:
		or	di, di
		jnz	short loc_DCFD8
		cmp	[bp+var_2], 1
		jnz	short loc_DCFD8
		jmp	loc_DD0FB

loc_DCFD8:
		cmp	[bp+var_2], 0
		jle	short loc_DCFFC
		cmp	[bp+var_2], 5
		jge	short loc_DCFFC
		mov	ax, [si+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_DCFFF

loc_DCFFC:
		mov	ax, 1

loc_DCFFF:
		cmp	ax, 1
		jz	short loc_DD007
		jmp	loc_DD087

loc_DD007:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 0Ah
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_42], ax
		lea	ax, [bp+var_3E]
		mov	bx, [bp+var_42]
		add	bx, ax
		cmp	byte ptr [bx], 1
		jnz	short loc_DD04A
		xor	dx, dx
		jmp	short loc_DD045

loc_DD033:
		lea	ax, [bp+var_3E]
		mov	bx, dx
		add	bx, ax
		cmp	byte ptr [bx], 0
		jnz	short loc_DD044
		mov	[bp+var_42], dx
		jmp	short loc_DD04A

loc_DD044:
		inc	dx

loc_DD045:
		cmp	dx, 0Ah
		jl	short loc_DD033

loc_DD04A:
		lea	ax, [bp+var_3E]
		mov	bx, [bp+var_42]
		add	bx, ax
		mov	byte ptr [bx], 1
		inc	[bp+var_42]
		push	429Ah
		lea	ax, [bp+var_20]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0Ah
		lea	ax, [bp+var_4C]
		push	ax
		push	[bp+var_42]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	ax
		lea	ax, [bp+var_20]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_DD0B3

loc_DD087:
		push	8
		mov	ax, [si+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		lea	ax, [bp+var_20]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_DD0B3:
		xor	dx, dx
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	bx, [bx+si+285h]
		inc	bx
		dec	bx
		cmp	bx, 7
		ja	short loc_DD0DA
		shl	bx, 1
		jmp	cs:off_DD81F[bx]	; switch jump

loc_DD0CD:
		mov	dx, 1
		jmp	short loc_DD0DA

loc_DD0D2:
		mov	dx, 3
		jmp	short loc_DD0DA

loc_DD0D7:
		mov	dx, 2

loc_DD0DA:
		push	dx
		mov	ax, di
		shl	ax, 2
		add	ax, [bp+var_2]
		add	ax, 3Ah
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4
		push	47h
		call	GameVar_Get_56414
		pop	cx
		inc	ax
		push	ax
		jmp	short loc_DD0FD

loc_DD0FB:
		push	1

loc_DD0FD:
		push	47h
		call	GameVar_Set_564BB
		add	sp, 4

loc_DD107:
		push	large [bp+var_181]
		push	large 9
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 9
		inc	[bp+var_2]

loc_DD12A:
		cmp	[bp+var_2], 4
		jg	short loc_DD133
		jmp	loc_DCF97

loc_DD133:
		inc	di

loc_DD134:
		cmp	di, 3
		jge	short loc_DD13C
		jmp	loc_DCF0E

loc_DD13C:
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_268]
		mov	[bp+var_279], eax
		mov	[bp+var_271], 0
		push	large 0
		push	large 474F5250h
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 474F5250h
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_2DE]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766E7
		add	sp, 4
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_268]
		mov	[bp+var_279], eax
		mov	[bp+var_271], 0
		xor	di, di
		jmp	short loc_DD1B6

loc_DD1B1:
		mov	byte ptr [bp+di+var_6], 0
		inc	di

loc_DD1B6:
		cmp	di, 3
		jl	short loc_DD1B1
		push	large 0
		push	large 54524150h
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 54524150h
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		push	large 3Eh
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_RecordCount_6DDDF
		add	sp, 6
		mov	di, ax
		sub	di, 24h
		mov	[bp+var_40], 1
		jmp	short loc_DD23C

loc_DD202:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_181]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 3Eh
		inc	[bp+var_40]

loc_DD23C:
		cmp	[bp+var_40], di
		jle	short loc_DD202
		lea	ax, [bp+var_3BC]
		push	ax
		push	large 4E4C5046h
		call	sub_75910
		add	sp, 6
		lea	ax, [bp+var_36C]
		push	ax
		push	large 50414557h
		call	sub_75910
		add	sp, 6
		lea	ax, [bp+var_49C]
		push	ax
		push	large 4E50574Ah
		call	sub_75910
		add	sp, 6
		lea	ax, [bp+var_53C]
		push	ax
		push	large 4E46504Ah
		call	sub_75910
		add	sp, 6
		mov	[bp+var_30], 0
		mov	[bp+var_32], 0
		mov	[bp+var_34], 0
		jmp	loc_DD4D3

loc_DD29F:
		xor	di, di
		jmp	loc_DD446

loc_DD2A4:
		mov	dx, di
		or	dx, dx
		jl	short loc_DD2B5
		cmp	dx, 3
		jge	short loc_DD2B5
		mov	[si+470h], dx
		jmp	short loc_DD2B5

loc_DD2B5:
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+46Ah]
		cmp	ax, [bp+var_34]
		jz	short loc_DD2C7
		jmp	loc_DD445

loc_DD2C7:
		mov	bx, [si+470h]
		shl	bx, 1
		cmp	word ptr [bx+si+446h], 0
		jnz	short loc_DD2D7
		jmp	loc_DD445

loc_DD2D7:
		inc	[bp+var_30]
		mov	[bp+var_42], 1
		jmp	loc_DD43C

loc_DD2E2:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+446h]
		cmp	ax, [bp+var_42]
		jge	short loc_DD30A
		jmp	loc_DD418

loc_DD30A:
		mov	bx, [si+470h]
		shl	bx, 1
		cmp	word ptr [bx+si+440h], 0Ah
		jl	short loc_DD364
		push	[bp+arg_2]
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+46Ah]
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+440h]
		lea	ax, [bp+var_49C]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	cs
		call	near ptr sub_DC62D
		add	sp, 0Ah
		push	8
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+440h]
		shl	ax, 3
		lea	dx, [bp+var_58C]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_31A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		jmp	loc_DD405

loc_DD364:
		push	8
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+440h]
		shl	ax, 3
		lea	dx, [bp+var_3BC]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_31A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	8
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+440h]
		shl	ax, 3
		lea	dx, [bp+var_36C]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		cmp	[bp+var_42], 0
		jle	short loc_DD3CD
		cmp	[bp+var_42], 5
		jge	short loc_DD3CD
		mov	ax, [si+470h]
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, [bp+var_42]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+44Ch]
		jmp	short loc_DD3CF

loc_DD3CD:
		xor	ax, ax

loc_DD3CF:
		push	ax
		push	[bp+arg_2]
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+440h]
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+46Ah]
		push	cs
		call	near ptr sub_DC811
		add	sp, 8
		mov	[bp+var_4C], ax
		dec	ax
		push	ax
		lea	ax, [bp+var_4A]
		mov	[bp+var_4E], ax
		lea	ax, [bp+var_4E]
		push	ax
		call	sub_75972
		add	sp, 4

loc_DD405:
		push	8
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_30A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_DD418:
		push	large [bp+var_181]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 3Eh
		inc	[bp+var_42]

loc_DD43C:
		cmp	[bp+var_42], 4
		jg	short loc_DD445
		jmp	loc_DD2E2

loc_DD445:
		inc	di

loc_DD446:
		cmp	di, 3
		jge	short loc_DD44E
		jmp	loc_DD2A4

loc_DD44E:
		mov	ax, [bp+var_34]
		or	ax, ax
		jz	short loc_DD461
		cmp	ax, 1
		jz	short loc_DD466
		cmp	ax, 2
		jz	short loc_DD46B
		jmp	short loc_DD474

loc_DD461:
		mov	ax, 1
		jmp	short loc_DD46E

loc_DD466:
		mov	ax, 2
		jmp	short loc_DD46E

loc_DD46B:
		mov	ax, 3

loc_DD46E:
		sub	ax, [bp+var_30]
		mov	[bp+var_32], ax

loc_DD474:
		cmp	[bp+var_32], 0
		jle	short loc_DD4CB
		xor	di, di
		jmp	short loc_DD4C6

loc_DD47E:
		mov	[bp+var_42], 0
		jmp	short loc_DD4BF

loc_DD485:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_181]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 3Eh
		inc	[bp+var_42]

loc_DD4BF:
		cmp	[bp+var_42], 4
		jl	short loc_DD485
		inc	di

loc_DD4C6:
		cmp	di, [bp+var_32]
		jl	short loc_DD47E

loc_DD4CB:
		mov	[bp+var_30], 0
		inc	[bp+var_34]

loc_DD4D3:
		cmp	[bp+var_34], 3
		jge	short loc_DD4DC
		jmp	loc_DD29F

loc_DD4DC:
		xor	di, di
		jmp	loc_DD67B

loc_DD4E1:
		or	di, di
		jnz	short loc_DD501
		mov	dx, [si+28Eh]
		or	dx, dx
		jl	short loc_DD4F8
		cmp	dx, 3
		jge	short loc_DD4F8
		mov	[si+28Bh], dx
		jmp	short loc_DD4F8

loc_DD4F8:
		mov	bx, [si+28Eh]
		lea	ax, [bp+var_6]
		jmp	short loc_DD545

loc_DD501:
		mov	[bp+var_42], 0
		jmp	short loc_DD50B

loc_DD508:
		inc	[bp+var_42]

loc_DD50B:
		lea	ax, [bp+var_6]
		mov	bx, [bp+var_42]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_DD51E
		cmp	[bp+var_42], 3
		jl	short loc_DD508

loc_DD51E:
		cmp	[bp+var_42], 3
		jl	short loc_DD52D
		push	0B0B0h
		call	sub_1DDFE
		pop	cx

loc_DD52D:
		mov	dx, [bp+var_42]
		or	dx, dx
		jl	short loc_DD53F
		cmp	dx, 3
		jge	short loc_DD53F
		mov	[si+28Bh], dx
		jmp	short loc_DD53F

loc_DD53F:
		lea	ax, [bp+var_6]
		mov	bx, [bp+var_42]

loc_DD545:
		add	bx, ax
		mov	byte ptr [bx], 1
		mov	[bp+var_42], 0
		jmp	loc_DD671

loc_DD552:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+27Fh]
		cmp	ax, [bp+var_42]
		jg	short loc_DD57A
		jmp	loc_DD64D

loc_DD57A:
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+si+24Ch], 0Ah
		jl	short loc_DD5D9
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0FFF6h
		mov	[bp+var_4E], ax
		push	8
		shl	ax, 3
		lea	dx, [bp+var_53C]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_31A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	[bp+arg_2]
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+285h]
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+24Ch]
		lea	ax, [bp+var_49C]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	cs
		call	near ptr sub_DC45C
		add	sp, 0Ah
		jmp	short loc_DD63A

loc_DD5D9:
		push	8
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		shl	ax, 3
		lea	dx, [bp+var_3BC]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_31A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	8
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		shl	ax, 3
		lea	dx, [bp+var_36C]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+285h]
		lea	ax, [bp+var_4A]
		mov	[bp+var_4C], ax
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_75972
		add	sp, 4

loc_DD63A:
		push	8
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_30A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_DD64D:
		push	large [bp+var_181]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_31C]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_181], 3Eh
		inc	[bp+var_42]

loc_DD671:
		cmp	[bp+var_42], 4
		jge	short loc_DD67A
		jmp	loc_DD552

loc_DD67A:
		inc	di

loc_DD67B:
		cmp	di, 3
		jge	short loc_DD683
		jmp	loc_DD4E1

loc_DD683:
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_268]
		mov	[bp+var_279], eax
		mov	[bp+var_271], 0
		push	large 0
		push	large 4D414554h
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 4D414554h
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_2DE]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766E7
		add	sp, 4
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_268]
		mov	[bp+var_279], eax
		mov	[bp+var_271], 0
		push	large 0
		push	large 59414C50h
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766BF
		pop	cx
		push	0
		push	large 59414C50h
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		lea	ax, [bp+var_2DE]
		push	ax
		push	large 44414F4Ch
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_7670A
		add	sp, 8
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766C9
		pop	cx
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		push	large 0
		push	large 44414F4Ch
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_2DE]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766E7
		add	sp, 4
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_268]
		mov	[bp+var_279], eax
		mov	[bp+var_271], 0
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766C9
		pop	cx
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_766D8
		pop	cx
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_2DE], 520h
		lea	ax, [bp+var_2DE]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_2DE]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	[bp+var_1E6], 520h
		lea	ax, [bp+var_1E6]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_1E6]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_DC99A		endp

; START OF FUNCTION CHUNK FOR sub_DC99A
off_DD81F	dw offset loc_DD0CD
		dw offset loc_DD0D2
		dw offset loc_DD0D2
		dw offset loc_DD0D7
		dw offset loc_DD0CD
		dw offset loc_DD0D2
		dw offset loc_DD0D2
		dw offset loc_DD0D7
; END OF FUNCTION CHUNK FOR sub_DC99A
ovr389		ends
