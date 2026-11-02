seg038		segment	para public 'CODE' use16
		assume cs:seg038
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16B52		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_16B6E
		push	0D1h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_16BE7

loc_16B6E:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_12431
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3559h
		mov	ax, si
		add	ax, 97h
		mov	ax, si
		add	ax, 9Bh
		mov	ax, si
		add	ax, 9Fh
		mov	ax, si
		add	ax, 0A3h
		mov	ax, si
		add	ax, 0ABh
		mov	ax, si
		add	ax, 0AFh
		mov	dword ptr [si+0B9h], 0
		mov	byte ptr [si+0BDh], 2
		mov	byte ptr [si+0BEh], 0
		mov	dword ptr [si+0BFh], 0
		mov	dword ptr [si+0C3h], 0
		mov	byte ptr [si+0C7h], 2
		mov	byte ptr [si+0C8h], 0
		mov	dword ptr [si+0C9h], 0
		push	si
		nop
		push	cs
		call	near ptr sub_16DFD
		add	sp, 2

loc_16BE7:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_16B52		endp

; START OF FUNCTION CHUNK FOR sub_16B52
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_16B52

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16BEF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_16C01
		jmp	loc_16D35

loc_16C01:
		mov	word ptr [si+0Eh], 3559h
		push	27Eh
		push	0
		call	sub_44A16
		add	sp, 4
		push	0C7h
		push	0
		call	sub_44A45
		add	sp, 4
		cmp	byte_4F289, 0
		jz	short loc_16C45
		cmp	dword_4F284, 0
		jz	short loc_16C45
		push	0
		mov	al, byte_4F288
		push	ax
		push	68A4h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_16C45

loc_16C45:
		mov	dword_4F284, 0
		mov	byte_4F289, 0
		mov	dword_4F28A, 0
		push	68AEh
		call	sub_4824B
		add	sp, 2
		call	sub_48468
		cmp	word ptr [si+0B7h], 0
		jz	short loc_16C86
		push	3
		push	word ptr [si+0B7h]
		mov	bx, [si+0B7h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_16C86

loc_16C86:
		push	0
		push	2
		mov	ax, si
		add	ax, 93h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		cmp	byte ptr [si+0C8h], 0
		jz	short loc_16CC4
		cmp	dword ptr [si+0C3h], 0
		jz	short loc_16CC4
		push	0
		mov	al, [si+0C7h]
		push	ax
		mov	ax, si
		add	ax, 0C3h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_16CC4

loc_16CC4:
		mov	dword ptr [si+0C3h], 0
		mov	byte ptr [si+0C8h], 0
		mov	dword ptr [si+0C9h], 0
		cmp	byte ptr [si+0BEh], 0
		jz	short loc_16D04
		cmp	dword ptr [si+0B9h], 0
		jz	short loc_16D04
		push	0
		mov	al, [si+0BDh]
		push	ax
		mov	ax, si
		add	ax, 0B9h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_16D04

loc_16D04:
		mov	dword ptr [si+0B9h], 0
		mov	byte ptr [si+0BEh], 0
		mov	dword ptr [si+0BFh], 0
		push	0
		push	si
		call	sub_125CF
		add	sp, 4
		test	di, 1
		jz	short loc_16D35
		push	si
		call	sub_39C
		add	sp, 2

loc_16D35:
		pop	di
		pop	si
		pop	bp
		retf
sub_16BEF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16D39		proc far

var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+95h]
		mov	dx, [si+93h]
		push	ax
		mov	ax, [si+8Fh]
		mov	bx, 21h
		push	dx
		imul	bx
		pop	dx
		add	dx, ax
		pop	ax
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	[bp+var_2]
		push	[bp+var_4]
		push	ds
		mov	ax, si
		add	ax, 74h
		push	ax
		call	sub_3628
		add	sp, 8
		mov	ax, [bp+var_4]
		add	ax, 9
		push	[bp+var_2]
		push	ax
		push	ds
		mov	ax, si
		add	ax, 7Dh
		push	ax
		call	sub_3628
		add	sp, 8
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Ah]
		mov	[si+8Eh], al
		les	bx, [bp+var_4]
		mov	ax, es:[bx+1Bh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[si+0ABh], eax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+1Dh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+0AFh], eax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+1Fh]
		mov	[si+0A7h], ax
		pop	si
		leave
		retf
sub_16D39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16DE7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+0B5h], 0
		mov	word ptr [si+0B3h], 3Ch
		pop	si
		pop	bp
		retf
sub_16DE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16DFD		proc far

var_266		= dword ptr -266h
var_262		= dword ptr -262h
var_25E		= dword ptr -25Eh
var_25A		= dword ptr -25Ah
var_256		= dword ptr -256h
var_252		= dword ptr -252h
var_24E		= dword ptr -24Eh
var_24A		= dword ptr -24Ah
var_246		= dword ptr -246h
var_242		= word ptr -242h
var_1CA		= dword ptr -1CAh
var_1C6		= dword ptr -1C6h
var_1C2		= dword ptr -1C2h
var_1BE		= word ptr -1BEh
var_161		= dword ptr -161h
var_15D		= dword ptr -15Dh
var_159		= dword ptr -159h
var_151		= dword ptr -151h
var_14C		= dword ptr -14Ch
var_144		= word ptr -144h
var_142		= word ptr -142h
var_116		= word ptr -116h
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_A4		= word ptr -0A4h
var_A1		= byte ptr -0A1h
var_A0		= dword ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_95		= byte ptr -95h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_89		= byte ptr -89h
var_88		= dword ptr -88h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7D		= byte ptr -7Dh
var_7C		= dword ptr -7Ch
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_71		= byte ptr -71h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_65		= byte ptr -65h
var_64		= dword ptr -64h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3D		= byte ptr -3Dh
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 266h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset aIff
		push	ds
		push	offset aObjworld
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_116]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_116]
		push	ax
		call	sub_48477
		add	sp, 2
		push	6947h
		call	sub_24A2E
		add	sp, 2
		mov	word ptr [si+91h], 0
		mov	word ptr [si+8Fh], 0
		push	ds
		push	offset aIff
		push	ds
		push	offset aObjview
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_116]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_1BE]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_1BE], 480h
		mov	[bp+var_15D], 100h
		mov	[bp+var_161], 0
		mov	[bp+var_1BE], 498h
		mov	[bp+var_142], 0
		xor	ax, ax
		mov	[bp+var_144], ax
		movsx	eax, ax
		mov	[bp+var_159], eax
		push	1
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		mov	bx, [bp+var_1BE]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	eax, [bp+var_151]
		cmp	eax, dword_4BE23
		jnz	short loc_16EC6
		mov	ax, 1
		jmp	short loc_16EC8

loc_16EC6:
		xor	ax, ax

loc_16EC8:
		or	ax, ax
		jz	short loc_16F42
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large dword_4BE28
		lea	ax, [bp+var_1BE]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_16F42
		mov	eax, [bp+var_14C]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_C6]
		mov	ebx, 21h
		cdq
		idiv	ebx
		mov	[si+91h], ax
		push	1
		push	0
		push	2
		push	large [bp+var_C6]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+95h], dx
		mov	[si+93h], ax
		push	word ptr [si+95h]
		push	word ptr [si+93h]
		lea	ax, [bp+var_1BE]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6

loc_16F42:
		cmp	word ptr [si+91h], 0
		jz	short loc_16F53
		push	si
		push	cs
		call	near ptr sub_16D39
		add	sp, 2
		jmp	short loc_16F60

loc_16F53:
		push	1
		push	3422h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_16F60:
		mov	ax, si
		add	ax, 74h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	1
		push	1
		push	[bp+var_2]
		push	[bp+var_4]
		push	692Eh
		call	sub_267CD
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_1CA], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_1C6], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_1C2], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_1CA]
		mov	[bx+12h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_1C6]
		mov	[bx+16h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_1C2]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	Matrix_BuildFromAngle_2A535
		add	sp, 2
		push	word ptr [si+72h]
		push	6947h
		call	sub_24B7F
		add	sp, 4
		call	sub_48481
		mov	[bp+var_14], 200h
		mov	eax, [bp+var_14]
		mov	[si+97h], eax
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Bh], eax
		mov	[bp+var_18], 180h
		mov	eax, [si+9Bh]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Bh], eax
		mov	eax, [si+9Bh]
		shl	eax, 4
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[si+9Fh], eax
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax
		mov	ax, [si+0A7h]
		mov	[bp+var_22], ax
		mov	ax, si
		add	ax, 97h
		mov	[bp+var_24], ax
		movsx	eax, [bp+var_22]
		mov	bx, [bp+var_24]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_28], edx
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[si+0A3h], eax
		push	si
		push	cs
		call	near ptr sub_16DE7
		add	sp, 2
		mov	word ptr [si+0CDh], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aObjview_1
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_116]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_242]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	2
		push	68A4h
		push	8
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	9
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[si+0B7h], ax
		mov	bx, [si+0B7h]
		mov	word ptr [bx+10h], 1
		mov	bx, [si+0B7h]
		mov	word ptr [bx+12h], 0
		push	2Dh
		push	word ptr [si+0B7h]
		mov	bx, [si+0B7h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [si+0B7h]
		mov	[bx+14h], ax
		push	word ptr [si+0B7h]
		push	word_4D36E
		call	sub_15DB7
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 0B9h
		push	ax
		push	0
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	ax, si
		add	ax, 0B9h
		mov	[bp+var_38], ax
		mov	bx, [bp+var_38]
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	bx, [bp+var_38]
		mov	al, [bx+4]
		mov	[bp+var_3D], al
		mov	eax, [bp+var_3C]
		mov	[si+50h], eax
		mov	al, [bp+var_3D]
		mov	[si+54h], al
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx+6]
		mov	[si+56h], eax
		mov	word ptr [si+5Ah], 0
		push	2
		mov	ax, si
		add	ax, 0C3h
		push	ax
		push	4
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_40], si
		mov	ax, si
		add	ax, 7Dh
		mov	[bp+var_44], ax
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_46], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_48], ax
		push	38h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_17221
		jmp	loc_172C1

loc_17221:
		push	0Ch
		push	4Dh
		push	0AAh
		push	0Eh
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 34BDh
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	word ptr [di+2Eh], 0
		push	[bp+var_44]
		push	di
		call	sub_15D22
		add	sp, 4
		mov	bx, [bp+var_46]
		mov	eax, [bx]
		mov	[bp+var_4C], eax
		mov	bx, [bp+var_46]
		mov	al, [bx+4]
		mov	[bp+var_4D], al
		mov	eax, [bp+var_4C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_46]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 34F1h
		mov	word ptr [di+34h], 1
		mov	ax, [bp+var_48]
		mov	[di+30h], ax
		mov	word ptr [di+32h], 0
		mov	word ptr [di+0Eh], 3525h
		mov	word ptr [di+36h], 1
		mov	ax, di
		jmp	short loc_172C3

loc_172C1:
		mov	ax, di

loc_172C3:
		mov	[si+0CFh], ax
		push	0
		push	word ptr [si+0CFh]
		push	si
		call	sub_12B45
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_50], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_52], ax
		push	32h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_54], ax
		or	ax, ax
		jnz	short loc_172F8
		jmp	loc_173BE

loc_172F8:
		push	0Ch
		push	16h
		push	0A1h
		push	0CAh
		push	[bp+var_54]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_54]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_54]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_54]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_54]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_54]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_50]
		mov	eax, [bx]
		mov	[bp+var_58], eax
		mov	bx, [bp+var_50]
		mov	al, [bx+4]
		mov	[bp+var_59], al
		mov	bx, [bp+var_54]
		mov	eax, [bp+var_58]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_54]
		mov	al, [bp+var_59]
		mov	[bx+22h], al
		mov	bx, [bp+var_54]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_54]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_50]
		mov	eax, [bx+6]
		mov	bx, [bp+var_54]
		mov	[bx+24h], eax
		mov	bx, [bp+var_54]
		mov	word ptr [bx+28h], 6
		mov	bx, [bp+var_54]
		mov	word ptr [bx+0Eh], 3455h
		mov	bx, [bp+var_54]
		mov	word ptr [bx+2Eh], 7
		mov	bx, [bp+var_54]
		mov	ax, [bp+var_52]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_54]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_54]
		mov	word ptr [bx+0Eh], 3489h
		mov	bx, [bp+var_54]
		mov	word ptr [bx+30h], 3
		mov	ax, [bp+var_54]
		jmp	short loc_173C1

loc_173BE:
		mov	ax, [bp+var_54]

loc_173C1:
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_12B45
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_5C], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_5E], ax
		push	32h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_60], ax
		or	ax, ax
		jnz	short loc_17403
		jmp	loc_174C9

loc_17403:
		push	0Ch
		push	16h
		push	0B3h
		push	0CAh
		push	[bp+var_60]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_60]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_60]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_60]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_60]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_60]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx]
		mov	[bp+var_64], eax
		mov	bx, [bp+var_5C]
		mov	al, [bx+4]
		mov	[bp+var_65], al
		mov	bx, [bp+var_60]
		mov	eax, [bp+var_64]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_60]
		mov	al, [bp+var_65]
		mov	[bx+22h], al
		mov	bx, [bp+var_60]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_60]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx+6]
		mov	bx, [bp+var_60]
		mov	[bx+24h], eax
		mov	bx, [bp+var_60]
		mov	word ptr [bx+28h], 8
		mov	bx, [bp+var_60]
		mov	word ptr [bx+0Eh], 3455h
		mov	bx, [bp+var_60]
		mov	word ptr [bx+2Eh], 9
		mov	bx, [bp+var_60]
		mov	ax, [bp+var_5E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_60]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_60]
		mov	word ptr [bx+0Eh], 3489h
		mov	bx, [bp+var_60]
		mov	word ptr [bx+30h], 5
		mov	ax, [bp+var_60]
		jmp	short loc_174CC

loc_174C9:
		mov	ax, [bp+var_60]

loc_174CC:
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_12B45
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_68], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_6A], ax
		push	32h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_6C], ax
		or	ax, ax
		jnz	short loc_1750E
		jmp	loc_175D4

loc_1750E:
		push	13h
		push	0Dh
		push	0A7h
		push	0B2h
		push	[bp+var_6C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_6C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_6C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_6C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_6C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[bp+var_70], eax
		mov	bx, [bp+var_68]
		mov	al, [bx+4]
		mov	[bp+var_71], al
		mov	bx, [bp+var_6C]
		mov	eax, [bp+var_70]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_6C]
		mov	al, [bp+var_71]
		mov	[bx+22h], al
		mov	bx, [bp+var_6C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_6C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_68]
		mov	eax, [bx+6]
		mov	bx, [bp+var_6C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+28h], 0Ah
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+0Eh], 3455h
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+2Eh], 0Bh
		mov	bx, [bp+var_6C]
		mov	ax, [bp+var_6A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+2Ch], 6
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+0Eh], 3489h
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+30h], 7
		mov	ax, [bp+var_6C]
		jmp	short loc_175D7

loc_175D4:
		mov	ax, [bp+var_6C]

loc_175D7:
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_12B45
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_74], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_76], ax
		push	32h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_78], ax
		or	ax, ax
		jnz	short loc_17619
		jmp	loc_176DF

loc_17619:
		push	13h
		push	0Dh
		push	0A7h
		push	0ECh
		push	[bp+var_78]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_74]
		mov	eax, [bx]
		mov	[bp+var_7C], eax
		mov	bx, [bp+var_74]
		mov	al, [bx+4]
		mov	[bp+var_7D], al
		mov	bx, [bp+var_78]
		mov	eax, [bp+var_7C]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_78]
		mov	al, [bp+var_7D]
		mov	[bx+22h], al
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_74]
		mov	eax, [bx+6]
		mov	bx, [bp+var_78]
		mov	[bx+24h], eax
		mov	bx, [bp+var_78]
		mov	word ptr [bx+28h], 0Ch
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 3455h
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Eh], 0Dh
		mov	bx, [bp+var_78]
		mov	ax, [bp+var_76]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Ch], 8
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 3489h
		mov	bx, [bp+var_78]
		mov	word ptr [bx+30h], 9
		mov	ax, [bp+var_78]
		jmp	short loc_176E2

loc_176DF:
		mov	ax, [bp+var_78]

loc_176E2:
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_80], ax
		mov	ax, si
		add	ax, 0CDh
		mov	[bp+var_82], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_84], ax
		or	ax, ax
		jnz	short loc_1772A
		jmp	loc_177FF

loc_1772A:
		push	0Dh
		push	21h
		push	0AAh
		push	110h
		push	[bp+var_84]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_84]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_84]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_84]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_84]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_84]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_80]
		mov	eax, [bx]
		mov	[bp+var_88], eax
		mov	bx, [bp+var_80]
		mov	al, [bx+4]
		mov	[bp+var_89], al
		mov	bx, [bp+var_84]
		mov	eax, [bp+var_88]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_84]
		mov	al, [bp+var_89]
		mov	[bx+22h], al
		mov	bx, [bp+var_84]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_84]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_80]
		mov	eax, [bx+6]
		mov	bx, [bp+var_84]
		mov	[bx+24h], eax
		mov	bx, [bp+var_84]
		mov	word ptr [bx+28h], 0Eh
		mov	bx, [bp+var_84]
		mov	word ptr [bx+0Eh], 738h
		mov	bx, [bp+var_84]
		mov	ax, [bp+var_82]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_84]
		mov	word ptr [bx+2Ch], 1
		mov	bx, [bp+var_84]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_84]
		mov	word ptr [bx+2Eh], 0Fh
		mov	ax, [bp+var_84]
		jmp	short loc_17803

loc_177FF:
		mov	ax, [bp+var_84]

loc_17803:
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_8C], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_8E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_90], ax
		or	ax, ax
		jnz	short loc_17832
		jmp	loc_17900

loc_17832:
		push	0Ah
		push	14h
		push	0A2h
		push	7Dh
		push	[bp+var_90]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_8C]
		mov	eax, [bx]
		mov	[bp+var_94], eax
		mov	bx, [bp+var_8C]
		mov	al, [bx+4]
		mov	[bp+var_95], al
		mov	bx, [bp+var_90]
		mov	eax, [bp+var_94]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_90]
		mov	al, [bp+var_95]
		mov	[bx+22h], al
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_8C]
		mov	eax, [bx+6]
		mov	bx, [bp+var_90]
		mov	[bx+24h], eax
		mov	bx, [bp+var_90]
		mov	word ptr [bx+28h], 2
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Eh], 3455h
		mov	bx, [bp+var_90]
		mov	word ptr [bx+2Eh], 3
		mov	bx, [bp+var_90]
		mov	ax, [bp+var_8E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_90]
		mov	word ptr [bx+2Ch], 0Ah
		mov	ax, [bp+var_90]
		jmp	short loc_17904

loc_17900:
		mov	ax, [bp+var_90]

loc_17904:
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_12B45
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h
		mov	[bp+var_98], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_9A], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_9C], ax
		or	ax, ax
		jnz	short loc_17949
		jmp	loc_17A17

loc_17949:
		push	0Ah
		push	14h
		push	0B4h
		push	7Eh
		push	[bp+var_9C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_9C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_9C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_9C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_9C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_98]
		mov	eax, [bx]
		mov	[bp+var_A0], eax
		mov	bx, [bp+var_98]
		mov	al, [bx+4]
		mov	[bp+var_A1], al
		mov	bx, [bp+var_9C]
		mov	eax, [bp+var_A0]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_9C]
		mov	al, [bp+var_A1]
		mov	[bx+22h], al
		mov	bx, [bp+var_9C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_9C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_98]
		mov	eax, [bx+6]
		mov	bx, [bp+var_9C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+28h], 4
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+0Eh], 3455h
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+2Eh], 5
		mov	bx, [bp+var_9C]
		mov	ax, [bp+var_9A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+2Ch], 0Bh
		mov	ax, [bp+var_9C]
		jmp	short loc_17A1B

loc_17A17:
		mov	ax, [bp+var_9C]

loc_17A1B:
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_12B45
		add	sp, 6
		push	0
		push	0
		mov	al, byte_4F288
		push	ax
		push	word_4F286
		push	word ptr dword_4F284
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		push	274h
		push	0Ah
		call	sub_44A16
		add	sp, 4
		push	0C4h
		push	9Ch
		call	sub_44A45
		add	sp, 4
		push	0B0h
		push	9Fh
		call	TextScrollDisplay_RegisterEntries_449DB
		add	sp, 4
		push	0B0h
		push	9Fh
		push	0
		push	0
		call	TextScrollDisplayB_ApplyHelperB_454C6
		add	sp, 8
		mov	ax, word_4F343
		mov	[bp+var_A4], ax
		mov	ax, [si+72h]
		add	ax, 12h
		mov	[bp+var_A6], ax
		mov	ax, [bp+var_A4]
		add	ax, 2Ch
		mov	[bp+var_A8], ax
		mov	ax, si
		add	ax, 0A3h
		mov	[bp+var_AA], ax
		mov	bx, [bp+var_A8]
		mov	eax, [bx]
		mov	bx, [bp+var_AA]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		mov	bx, [bp+var_A8]
		mov	eax, [bx+4]
		mov	bx, [bp+var_AA]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_BA], eax
		mov	bx, [bp+var_A8]
		mov	eax, [bx+8]
		mov	bx, [bp+var_AA]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_24E], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_246], eax
		mov	bx, [bp+var_A6]
		mov	eax, [bx]
		sub	eax, [bp+var_24E]
		mov	[bp+var_25A], eax
		mov	bx, [bp+var_A6]
		mov	eax, [bx+4]
		sub	eax, [bp+var_24A]
		mov	[bp+var_256], eax
		mov	bx, [bp+var_A6]
		mov	eax, [bx+8]
		sub	eax, [bp+var_246]
		mov	[bp+var_252], eax
		mov	eax, [bp+var_25A]
		mov	[bp+var_266], eax
		mov	eax, [bp+var_256]
		mov	[bp+var_262], eax
		mov	eax, [bp+var_252]
		mov	[bp+var_25E], eax
		mov	bx, [bp+var_A4]
		mov	eax, [bp+var_266]
		mov	[bx+14h], eax
		mov	bx, [bp+var_A4]
		mov	eax, [bp+var_262]
		mov	[bx+18h], eax
		mov	bx, [bp+var_A4]
		mov	eax, [bp+var_25E]
		mov	[bx+1Ch], eax
		cmp	[bp+var_31], 0
		jz	short loc_17BF5
		cmp	[bp+var_36], 0
		jz	short loc_17BF5
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_17BF5

loc_17BF5:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	[bp+var_1BE], 498h
		lea	ax, [bp+var_1BE]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_1BE]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_16DFD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17C3E		proc far

var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_4F343
		mov	ax, [si+0B3h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		mov	edx, dword_4C35D
		imul	edx, eax
		mov	[bp+var_A], edx
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	ax, [si+0B5h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		mov	edx, dword_4C35D
		imul	edx, eax
		mov	[bp+var_14], edx
		mov	eax, [bp+var_14]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_4]
		add	[si+0ABh], eax
		mov	eax, [bp+var_E]
		add	[si+0AFh], eax
		cmp	dword ptr [si+0ABh], 0
		jge	short loc_17CAE
		mov	ax, 1
		jmp	short loc_17CB0

loc_17CAE:
		xor	ax, ax

loc_17CB0:
		or	al, al
		jz	short loc_17CBF
		add	dword ptr [si+0ABh], 16800h
		jmp	short loc_17CDE

loc_17CBF:
		cmp	dword ptr [si+0ABh], 16800h
		jl	short loc_17CCF
		mov	ax, 1
		jmp	short loc_17CD1

loc_17CCF:
		xor	ax, ax

loc_17CD1:
		or	al, al
		jz	short loc_17CDE
		sub	dword ptr [si+0ABh], 16800h

loc_17CDE:
		cmp	dword ptr [si+0AFh], 0B400h
		jle	short loc_17CEE
		mov	ax, 1
		jmp	short loc_17CF0

loc_17CEE:
		xor	ax, ax

loc_17CF0:
		or	al, al
		jz	short loc_17CFF
		sub	dword ptr [si+0AFh], 16800h
		jmp	short loc_17D1E

loc_17CFF:
		cmp	dword ptr [si+0AFh], 0FFFF4C00h
		jg	short loc_17D0F
		mov	ax, 1
		jmp	short loc_17D11

loc_17D0F:
		xor	ax, ax

loc_17D11:
		or	al, al
		jz	short loc_17D1E
		add	dword ptr [si+0AFh], 16800h

loc_17D1E:
		test	byte ptr [si+8Eh], 1
		jz	short loc_17D72
		cmp	dword ptr [si+0AFh], 0
		jle	short loc_17D32
		mov	ax, 1
		jmp	short loc_17D34

loc_17D32:
		xor	ax, ax

loc_17D34:
		or	al, al
		jz	short loc_17D72
		cmp	dword ptr [si+0AFh], 5A00h
		jge	short loc_17D48
		mov	ax, 1
		jmp	short loc_17D4A

loc_17D48:
		xor	ax, ax

loc_17D4A:
		or	al, al
		jz	short loc_17D61
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[si+0AFh], eax
		jmp	short loc_17D72

loc_17D61:
		mov	[bp+var_1C], 0B400h
		mov	eax, [bp+var_1C]
		mov	[si+0AFh], eax

loc_17D72:
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	Matrix_BuildFromAngle_2A535
		add	sp, 2
		mov	ax, si
		add	ax, 0ABh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_28CEF
		add	sp, 4
		mov	ax, si
		add	ax, 0ABh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		push	ax
		call	sub_28CEF
		add	sp, 4
		mov	ax, si
		add	ax, 0ABh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 18h
		push	ax
		call	sub_28CEF
		add	sp, 4
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_2AEE8
		add	sp, 2
		mov	ax, si
		add	ax, 0AFh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_28B49
		add	sp, 4
		mov	ax, si
		add	ax, 0AFh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		push	ax
		call	sub_28B49
		add	sp, 4
		mov	ax, si
		add	ax, 0AFh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 18h
		push	ax
		call	sub_28B49
		add	sp, 4
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_2AEE8
		add	sp, 2
		mov	ax, [si+72h]
		add	ax, 12h
		mov	[bp+var_1E], ax
		mov	ax, di
		add	ax, 2Ch
		mov	[bp+var_20], ax
		mov	ax, si
		add	ax, 0A3h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	bx, [bp+var_22]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_20]
		mov	eax, [bx+4]
		mov	bx, [bp+var_22]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_20]
		mov	eax, [bx+8]
		mov	bx, [bp+var_22]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		sub	eax, [bp+var_46]
		mov	[bp+var_52], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+4]
		sub	eax, [bp+var_42]
		mov	[bp+var_4E], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+8]
		sub	eax, [bp+var_3E]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_5E]
		mov	[di+14h], eax
		mov	eax, [bp+var_5A]
		mov	[di+18h], eax
		mov	eax, [bp+var_56]
		mov	[di+1Ch], eax
		call	sub_270B2
		call	sub_273B5
		pop	di
		pop	si
		leave
		retf
sub_17C3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17F6E		proc far

var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 7Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	bx, 0Bh
		jbe	short loc_17F84
		jmp	loc_1831F

loc_17F84:
		shl	bx, 1
		jmp	cs:off_183E0[bx]	; switch jump

loc_17F8B:
		cmp	word ptr [si+91h], 0
		jnz	short loc_17F95
		jmp	loc_180EE

loc_17F95:
		push	word ptr [si+72h]
		push	6947h
		call	sub_24F92
		add	sp, 4
		inc	word ptr [si+8Fh]
		mov	ax, [si+8Fh]
		cmp	ax, [si+91h]
		jl	short loc_17FB7
		mov	word ptr [si+8Fh], 0

loc_17FB7:
		push	si
		push	cs
		call	near ptr sub_16D39
		add	sp, 2
		mov	ax, si
		add	ax, 74h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	1
		push	1
		push	[bp+var_2]
		push	[bp+var_4]
		push	692Eh
		call	sub_267CD
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_72], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_6E], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_6A], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_72]
		mov	[bx+12h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_6E]
		mov	[bx+16h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_6A]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Bh], eax
		mov	[bp+var_14], 180h
		mov	eax, [si+9Bh]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Bh], eax
		mov	eax, [si+9Bh]
		shl	eax, 4
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[si+9Fh], eax
		push	word ptr [si+72h]
		push	6947h
		call	sub_24B7F
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_16DE7
		add	sp, 2
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax
		mov	ax, [si+0A7h]
		mov	[bp+var_1E], ax
		mov	ax, si
		add	ax, 97h
		mov	di, ax
		movsx	eax, [bp+var_1E]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[si+0A3h], eax
		mov	ax, si
		add	ax, 7Dh
		push	ax
		push	word ptr [si+0CFh]
		call	sub_15D22
		add	sp, 4

loc_180EE:
		jmp	loc_18321

loc_180F1:
		cmp	word ptr [si+91h], 0
		jnz	short loc_180FB
		jmp	loc_18258

loc_180FB:
		push	word ptr [si+72h]
		push	6947h
		call	sub_24F92
		add	sp, 4
		dec	word ptr [si+8Fh]
		cmp	word ptr [si+8Fh], 0
		jge	short loc_1811D
		mov	ax, [si+91h]
		dec	ax
		mov	[si+8Fh], ax

loc_1811D:
		push	si
		push	cs
		call	near ptr sub_16D39
		add	sp, 2
		mov	ax, si
		add	ax, 74h
		mov	[bp+var_28], ds
		mov	[bp+var_2A], ax
		push	1
		push	1
		push	[bp+var_28]
		push	[bp+var_2A]
		push	692Eh
		call	sub_267CD
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		mov	[bp+var_7E], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_7A], eax
		mov	[bp+var_36], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_76], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_7E]
		mov	[bx+12h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_7A]
		mov	[bx+16h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_76]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Bh], eax
		mov	[bp+var_3A], 180h
		mov	eax, [si+9Bh]
		mov	edx, [bp+var_3A]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Bh], eax
		mov	eax, [si+9Bh]
		shl	eax, 4
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[si+9Fh], eax
		push	word ptr [si+72h]
		push	6947h
		call	sub_24B7F
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_16DE7
		add	sp, 2
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax
		mov	ax, [si+0A7h]
		mov	[bp+var_44], ax
		mov	ax, si
		add	ax, 97h
		mov	[bp+var_46], ax
		movsx	eax, [bp+var_44]
		mov	bx, [bp+var_46]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_4A], edx
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[si+0A3h], eax
		mov	ax, si
		add	ax, 7Dh
		push	ax
		push	word ptr [si+0CFh]
		call	sub_15D22
		add	sp, 4

loc_18258:
		jmp	loc_18321

loc_1825B:
		cmp	word ptr [si+0B5h], 0
		jz	short loc_1826A
		mov	word ptr [si+0B5h], 0
		jmp	short loc_18273

loc_1826A:
		sub	dword ptr [si+0AFh], 0A00h

loc_18273:
		jmp	loc_18321

loc_18276:
		mov	al, [si+8Eh]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jz	short loc_1828C
		mov	word ptr [si+0B5h], 0FFC4h

loc_1828C:
		jmp	loc_18321

loc_1828F:
		cmp	word ptr [si+0B5h], 0
		jz	short loc_1829E
		mov	word ptr [si+0B5h], 0
		jmp	short loc_182A7

loc_1829E:
		add	dword ptr [si+0AFh], 0A00h

loc_182A7:
		jmp	short loc_18321

loc_182A9:
		mov	al, [si+8Eh]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jz	short loc_182BF
		mov	word ptr [si+0B5h], 3Ch

loc_182BF:
		jmp	short loc_18321

loc_182C1:
		cmp	word ptr [si+0B3h], 0
		jz	short loc_182D0
		mov	word ptr [si+0B3h], 0
		jmp	short loc_182D9

loc_182D0:
		sub	dword ptr [si+0ABh], 0A00h

loc_182D9:
		jmp	short loc_18321

loc_182DB:
		mov	word ptr [si+0B3h], 0FFC4h
		jmp	short loc_18321

loc_182E3:
		cmp	word ptr [si+0B3h], 0
		jz	short loc_182F2
		mov	word ptr [si+0B3h], 0
		jmp	short loc_182FB

loc_182F2:
		add	dword ptr [si+0ABh], 0A00h

loc_182FB:
		jmp	short loc_18321

loc_182FD:
		mov	word ptr [si+0B3h], 3Ch
		jmp	short loc_18321

loc_18305:
		cmp	word ptr [si+0A7h], 64h
		jge	short loc_18310
		inc	word ptr [si+0A7h]

loc_18310:
		jmp	short loc_18321

loc_18312:
		cmp	word ptr [si+0A7h], 0
		jle	short loc_1831D
		dec	word ptr [si+0A7h]

loc_1831D:
		jmp	short loc_18321

loc_1831F:
		jmp	short loc_18321

loc_18321:
		mov	ax, [si+0A7h]
		cmp	ax, [si+0A9h]
		jnz	short loc_1832E
		jmp	loc_183D4

loc_1832E:
		mov	ax, [si+0A7h]
		mov	[bp+var_50], ax
		mov	ax, si
		add	ax, 97h
		mov	[bp+var_52], ax
		movsx	eax, [bp+var_50]
		mov	bx, [bp+var_52]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_56], edx
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[si+0A3h], eax
		mov	eax, [si+0A3h]
		cmp	eax, [si+9Fh]
		jle	short loc_18372
		mov	ax, 1
		jmp	short loc_18374

loc_18372:
		xor	ax, ax

loc_18374:
		or	al, al
		jnz	short loc_1838F
		mov	eax, [si+0A3h]
		cmp	eax, [si+9Bh]
		jge	short loc_18389
		mov	ax, 1
		jmp	short loc_1838B

loc_18389:
		xor	ax, ax

loc_1838B:
		or	al, al
		jz	short loc_183CC

loc_1838F:
		mov	ax, [si+0A9h]
		mov	[si+0A7h], ax
		mov	ax, [si+0A7h]
		mov	[bp+var_5C], ax
		mov	ax, si
		add	ax, 97h
		mov	[bp+var_5E], ax
		movsx	eax, [bp+var_5C]
		mov	bx, [bp+var_5E]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_62], edx
		mov	eax, [bp+var_62]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_66]
		mov	[si+0A3h], eax
		jmp	short loc_183D4

loc_183CC:
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax

loc_183D4:
		push	si
		push	cs
		call	near ptr sub_17C3E
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_17F6E		endp

; START OF FUNCTION CHUNK FOR sub_17F6E
off_183E0	dw offset loc_17F8B
		dw offset loc_180F1
		dw offset loc_1825B
		dw offset loc_18276
		dw offset loc_1828F
		dw offset loc_182A9
		dw offset loc_182C1
		dw offset loc_182DB
		dw offset loc_182E3
		dw offset loc_182FD
		dw offset loc_18305
		dw offset loc_18312
; END OF FUNCTION CHUNK FOR sub_17F6E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_183F8		proc far

var_124		= word ptr -124h
var_120		= word ptr -120h
var_11E		= word ptr -11Eh
var_116		= word ptr -116h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B4		= word ptr -0B4h
var_57		= byte ptr -57h
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 124h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte_4F156, 0
		mov	byte_4F157, 0
		mov	[bp+var_1], 0
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_18480
		shl	bx, 1
		jmp	cs:off_1856B[bx]	; switch jump

loc_18426:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_1], 1
		jmp	short loc_18480

loc_18444:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_1], 1
		jmp	short loc_18480

loc_18462:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_1], 1
		jmp	short loc_18480

loc_18480:
		cmp	[bp+var_1], 0
		jz	short loc_18494
		push	19h
		lea	ax, [bp+var_52]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4

loc_18494:
		cmp	dword_4F25C, 0
		jnz	short loc_184AA
		push	2BCh
		push	687Ah
		call	sub_2243C
		add	sp, 4

loc_184AA:
		push	0C7h
		push	13Fh
		push	0
		push	0
		lea	ax, [bp+var_124]
		push	ax
		push	cs
		call	near ptr sub_16B52
		add	sp, 0Ah
		mov	[bp+var_B6], 0
		mov	[bp+var_B4], 1
		lea	ax, [bp+var_124]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_1852E

loc_184DB:
		push	0
		push	1
		lea	ax, [bp+var_124]
		push	ax
		call	sub_12C6E
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_18522
		cmp	[bp+var_BA], 0
		jz	short loc_18522
		push	[bp+var_B8]
		push	[bp+var_BA]
		mov	ax, [bp+var_BC]
		sub	ax, [bp+var_11E]
		push	ax
		mov	ax, [bp+var_BE]
		sub	ax, [bp+var_120]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		mov	bx, [bp+var_116]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_18522:
		lea	ax, [bp+var_124]
		push	ax
		push	cs
		call	near ptr sub_17C3E
		add	sp, 2

loc_1852E:
		mov	al, [bp+var_57]
		mov	ah, 0
		or	ax, ax
		jz	short loc_184DB
		lea	ax, [bp+var_124]
		push	ax
		call	sub_12910
		add	sp, 2
		call	sub_2DA30
		call	TextScrollDisplayB_ApplyHelperD_4555C
		push	687Ah
		call	sub_22485
		add	sp, 2
		push	2
		lea	ax, [bp+var_124]
		push	ax
		push	cs
		call	near ptr sub_16BEF
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_183F8		endp

; START OF FUNCTION CHUNK FOR sub_183F8
off_1856B	dw offset loc_18426
		dw offset loc_18462
		dw offset loc_18444
		dw offset loc_18462
		dw offset loc_18462
; END OF FUNCTION CHUNK FOR sub_183F8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18575		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_185DA
		cmp	byte ptr [si+23h], 0
		jz	short loc_185AA
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_185AA
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_185AA

loc_185AA:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_185D8
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_185D8

loc_185D8:
		jmp	short loc_185DA

loc_185DA:
		pop	di
		pop	si
		pop	bp
		retf
sub_18575		endp

; START OF FUNCTION CHUNK FOR sub_18575
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_18575

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_185E2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_18647
		cmp	byte ptr [si+23h], 0
		jz	short loc_18617
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_18617
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_18617

loc_18617:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_18645
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_18645

loc_18645:
		jmp	short loc_18647

loc_18647:
		pop	di
		pop	si
		pop	bp
		retf
sub_185E2		endp

; START OF FUNCTION CHUNK FOR sub_185E2
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_185E2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1864F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_186C5
		mov	word ptr [si+0Eh], 34BDh
		push	word ptr [si+2Eh]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_18699
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_18699
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_18699

loc_18699:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_186C5
		push	si
		call	sub_39C
		add	sp, 2

loc_186C5:
		pop	di
		pop	si
		pop	bp
		retf
sub_1864F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_186C9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_18743
		mov	word ptr [si+0Eh], 34BDh
		push	word ptr [si+2Eh]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_18713
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_18713
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_18713

loc_18713:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_18741
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_18741

loc_18741:
		jmp	short loc_18743

loc_18743:
		pop	di
		pop	si
		pop	bp
		retf
sub_186C9		endp

; START OF FUNCTION CHUNK FOR sub_186C9
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_186C9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1874B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_187C5
		mov	word ptr [si+0Eh], 34BDh
		push	word ptr [si+2Eh]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_18795
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_18795
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_18795

loc_18795:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_187C3
		push	si
		call	sub_39C
sub_1874B		endp

; START OF FUNCTION CHUNK FOR sub_1874B
		db 83h, 0C4h
; END OF FUNCTION CHUNK FOR sub_1874B
seg038		ends
