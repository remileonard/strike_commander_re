ovr370		segment	para public 'OVERLAY' use16
		assume cs:ovr370
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE6F0		proc far

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
		jnz	short loc_CE70A
		push	0D2h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_CE781

loc_CE70A:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_74C99
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3E29h
		mov	ax, si
		add	ax, 98h
		mov	ax, si
		add	ax, 9Ch
		mov	ax, si
		add	ax, 0A0h
		mov	ax, si
		add	ax, 0A4h
		mov	ax, si
		add	ax, 0ACh
		mov	ax, si
		add	ax, 0B0h
		mov	dword ptr [si+0BAh], 0
		mov	byte ptr [si+0BEh], 2
		mov	byte ptr [si+0BFh], 0
		mov	dword ptr [si+0C0h], 0
		mov	dword ptr [si+0C4h], 0
		mov	byte ptr [si+0C8h], 2
		mov	byte ptr [si+0C9h], 0
		mov	dword ptr [si+0CAh], 0
		push	si
		nop
		push	cs
		call	near ptr sub_CE943
		pop	cx

loc_CE781:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_CE6F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE786		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_CE798
		jmp	loc_CE88E

loc_CE798:
		mov	word ptr [si+0Eh], 3E29h
		push	large 27E0000h
		call	sub_6F533
		add	sp, 4
		push	large 0C70000h
		call	sub_6F562
		add	sp, 4
		push	64DEh
		call	sub_73E7B
		pop	cx
		call	sub_7522C
		cmp	word ptr [si+0B8h], 0
		jz	short loc_CE7E1
		push	3
		push	word ptr [si+0B8h]
		mov	bx, [si+0B8h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_CE7E1

loc_CE7E1:
		push	0
		push	2
		mov	ax, si
		add	ax, 94h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		cmp	byte ptr [si+0C9h], 0
		jz	short loc_CE81F
		cmp	dword ptr [si+0C4h], 0
		jz	short loc_CE81F
		push	0
		mov	al, [si+0C8h]
		push	ax
		mov	ax, si
		add	ax, 0C4h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CE81F

loc_CE81F:
		mov	dword ptr [si+0C4h], 0
		mov	byte ptr [si+0C9h], 0
		mov	dword ptr [si+0CAh], 0
		cmp	byte ptr [si+0BFh], 0
		jz	short loc_CE85F
		cmp	dword ptr [si+0BAh], 0
		jz	short loc_CE85F
		push	0
		mov	al, [si+0BEh]
		push	ax
		mov	ax, si
		add	ax, 0BAh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CE85F

loc_CE85F:
		mov	dword ptr [si+0BAh], 0
		mov	byte ptr [si+0BFh], 0
		mov	dword ptr [si+0C0h], 0
		push	0
		push	si
		call	sub_74CA8
		add	sp, 4
		test	di, 1
		jz	short loc_CE88E
		push	si
		call	sub_3B2
		pop	cx

loc_CE88E:
		pop	di
		pop	si
		pop	bp
		retf
sub_CE786		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE892		proc far

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
		mov	ax, [si+96h]
		mov	dx, [si+94h]
		mov	bx, [si+90h]
		imul	bx, bx, 21h
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	ax
		push	dx
		push	ds
		mov	ax, si
		add	ax, 75h
		push	ax
		call	sub_38D6
		add	sp, 8
		mov	ax, [bp+var_4]
		add	ax, 9
		push	[bp+var_2]
		push	ax
		push	ds
		mov	ax, si
		add	ax, 7Eh
		push	ax
		call	sub_38D6
		add	sp, 8
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Ah]
		mov	[si+8Fh], al
		mov	ax, es:[bx+1Bh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[si+0ACh], eax
		mov	ax, es:[bx+1Dh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+0B0h], eax
		mov	ax, es:[bx+1Fh]
		mov	[si+0A8h], ax
		pop	si
		leave
		retf
sub_CE892		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE92D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+0B6h], 0
		mov	word ptr [si+0B4h], 3Ch
		pop	si
		pop	bp
		retf
sub_CE92D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE943		proc far

var_24C		= dword ptr -24Ch
var_248		= dword ptr -248h
var_244		= dword ptr -244h
var_240		= dword ptr -240h
var_23C		= dword ptr -23Ch
var_238		= dword ptr -238h
var_234		= dword ptr -234h
var_230		= dword ptr -230h
var_22C		= dword ptr -22Ch
var_228		= word ptr -228h
var_1B0		= dword ptr -1B0h
var_1AC		= dword ptr -1ACh
var_1A8		= dword ptr -1A8h
var_1A4		= word ptr -1A4h
var_147		= dword ptr -147h
var_143		= dword ptr -143h
var_13F		= dword ptr -13Fh
var_137		= dword ptr -137h
var_132		= dword ptr -132h
var_12A		= word ptr -12Ah
var_128		= word ptr -128h
var_FC		= word ptr -0FCh
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_8D		= byte ptr -8Dh
var_8C		= dword ptr -8Ch
var_88		= word ptr -88h
var_86		= word ptr -86h
var_83		= byte ptr -83h
var_82		= dword ptr -82h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_79		= byte ptr -79h
var_78		= dword ptr -78h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_6F		= byte ptr -6Fh
var_6E		= dword ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_65		= byte ptr -65h
var_64		= dword ptr -64h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5B		= byte ptr -5Bh
var_5A		= dword ptr -5Ah
var_56		= word ptr -56h
var_54		= word ptr -54h
var_51		= byte ptr -51h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_47		= byte ptr -47h
var_46		= dword ptr -46h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
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
		sub	sp, 24Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	large offset aObjworld
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_FC]
		push	ax
		call	sub_7523B
		pop	cx
		mov	word ptr [si+92h], 0
		mov	word ptr [si+90h], 0
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aObjview
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_1A4]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1A4], 508h
		mov	[bp+var_143], 100h
		mov	[bp+var_147], 0
		mov	[bp+var_1A4], 520h
		mov	[bp+var_128], 0
		xor	ax, ax
		mov	[bp+var_12A], ax
		movsx	eax, ax
		mov	[bp+var_13F], eax
		push	1
		lea	ax, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_1A4]
		push	ax
		mov	bx, [bp+var_1A4]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	eax, [bp+var_137]
		cmp	eax, dword_7A3A7
		jnz	short loc_CEA29
		mov	ax, 1
		jmp	short loc_CEA2B

loc_CEA29:
		xor	ax, ax

loc_CEA2B:
		or	ax, ax
		jz	short loc_CEA9B
		lea	ax, [bp+var_1A4]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large dword_7A3AC
		lea	ax, [bp+var_1A4]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_CEA9B
		mov	eax, [bp+var_132]
		mov	[bp+var_AC], eax
		mov	ebx, 21h
		cdq
		idiv	ebx
		mov	[si+92h], ax
		push	1
		push	0
		push	2
		push	large [bp+var_AC]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+96h], dx
		mov	[si+94h], ax
		push	large [si+94h]
		lea	ax, [bp+var_1A4]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_CEA9B:
		cmp	word ptr [si+92h], 0
		jz	short loc_CEAA9
		push	si
		push	cs
		call	near ptr sub_CE892
		jmp	short loc_CEAB1

loc_CEAA9:
		push	903Bh
		call	sub_1DDFE

loc_CEAB1:
		pop	cx
		mov	ax, si
		add	ax, 75h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	1
		push	1
		push	[bp+var_2]
		push	ax
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[si+73h], ax
		mov	bx, [si+73h]
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_CEAE8
		mov	ax, 1
		jmp	short loc_CEAEA

loc_CEAE8:
		xor	ax, ax

loc_CEAEA:
		or	al, al
		jz	short loc_CEAFD
		mov	bx, [si+73h]
		push	large [bx+5Fh]
		call	sub_3E140
		add	sp, 4

loc_CEAFD:
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_1B0], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_1AC], eax
		mov	[bp+var_10], 0A0000h
		mov	eax, [bp+var_10]
		mov	[bp+var_1A8], eax
		mov	bx, [si+73h]
		mov	eax, [bp+var_1B0]
		mov	[bx+12h], eax
		mov	eax, [bp+var_1AC]
		mov	[bx+16h], eax
		mov	eax, [bp+var_1A8]
		mov	[bx+1Ah], eax
		mov	ax, [si+73h]
		add	ax, 12h
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	word ptr [si+73h]
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		call	sub_7524A
		mov	[bp+var_14], 200h
		mov	eax, [bp+var_14]
		mov	[si+98h], eax
		mov	bx, [si+73h]
		mov	eax, [bx+20h]
		mov	[si+9Ch], eax
		mov	[bp+var_18], 180h
		mov	eax, [si+9Ch]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Ch], eax
		mov	eax, [si+9Ch]
		shl	eax, 4
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	[si+0A0h], eax
		mov	ax, [si+0A8h]
		mov	[si+0AAh], ax
		mov	[bp+var_22], ax
		mov	di, si
		add	di, 98h
		movsx	eax, [bp+var_22]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_26], edx
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	[si+0A4h], eax
		push	si
		push	cs
		call	near ptr sub_CE92D
		pop	cx
		mov	word ptr [si+0CEh], 0
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aObjview_1
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_228]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	2
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	9
		lea	ax, [bp+var_228]
		push	ax
		call	sub_75B60
		add	sp, 8
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[si+0B8h], ax
		mov	bx, [si+0B8h]
		mov	word ptr [bx+10h], 1
		mov	word ptr [bx+12h], 0
		push	2Dh
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [si+0B8h]
		mov	[bx+14h], ax
		push	bx
		push	word_7AF7E
		call	sub_74B90
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 0BAh
		push	ax
		push	0
		lea	ax, [bp+var_228]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	di, si
		add	di, 0BAh
		mov	eax, [di]
		mov	[bp+var_38], eax
		mov	al, [di+4]
		mov	[bp+var_39], al
		mov	eax, [bp+var_38]
		mov	[si+51h], eax
		mov	al, [bp+var_39]
		mov	[si+55h], al
		mov	byte ptr [si+56h], 0
		mov	dword ptr [si+57h], 0
		mov	eax, [di+6]
		mov	[si+57h], eax
		mov	word ptr [si+5Bh], 0
		push	2
		mov	ax, si
		add	ax, 0C4h
		push	ax
		push	4
		lea	ax, [bp+var_228]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_3C], si
		mov	ax, si
		add	ax, 7Eh
		mov	[bp+var_3E], ax
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_40], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_42], ax
		push	38h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CED4D
		jmp	loc_CEDEA

loc_CED4D:
		push	large 0C004Dh
		push	large 0AA000Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3D8Dh
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	word ptr [di+2Eh], 0
		push	[bp+var_3E]
		push	di
		call	sub_74B31
		add	sp, 4
		mov	bx, [bp+var_40]
		mov	eax, [bx]
		mov	[bp+var_46], eax
		mov	al, [bx+4]
		mov	[bp+var_47], al
		mov	eax, [bp+var_46]
		mov	[di+1Eh], eax
		mov	al, [bp+var_47]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 3DC1h
		mov	word ptr [di+34h], 1
		mov	ax, [bp+var_42]
		mov	[di+30h], ax
		mov	word ptr [di+32h], 0
		mov	word ptr [di+0Eh], 3DF5h
		mov	word ptr [di+36h], 1
		mov	ax, di
		jmp	short loc_CEDEC

loc_CEDEA:
		mov	ax, di

loc_CEDEC:
		mov	[si+0D0h], ax
		push	0
		push	word ptr [si+0D0h]
		push	si
		call	sub_74C8A
		add	sp, 6
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_4A], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_4C], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CEE1E
		jmp	loc_CEEAA

loc_CEE1E:
		push	large 0C0016h
		push	large 0A100CAh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_4A]
		mov	eax, [bx]
		mov	[bp+var_50], eax
		mov	al, [bx+4]
		mov	[bp+var_51], al
		mov	eax, [bp+var_50]
		mov	[di+1Eh], eax
		mov	al, [bp+var_51]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 6
		mov	word ptr [di+0Eh], 3D25h
		mov	word ptr [di+2Eh], 7
		mov	ax, [bp+var_4C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 3D59h
		mov	word ptr [di+30h], 3
		mov	ax, di
		jmp	short loc_CEEAC

loc_CEEAA:
		mov	ax, di

loc_CEEAC:
		mov	di, ax
		push	large 5
		push	ax
		call	sub_74A9B
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_74C8A
		add	sp, 6
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_54], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_56], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CEEE5
		jmp	loc_CEF71

loc_CEEE5:
		push	large 0C0016h
		push	large 0B300CAh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_54]
		mov	eax, [bx]
		mov	[bp+var_5A], eax
		mov	al, [bx+4]
		mov	[bp+var_5B], al
		mov	eax, [bp+var_5A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_5B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 8
		mov	word ptr [di+0Eh], 3D25h
		mov	word ptr [di+2Eh], 9
		mov	ax, [bp+var_56]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 3D59h
		mov	word ptr [di+30h], 5
		mov	ax, di
		jmp	short loc_CEF73

loc_CEF71:
		mov	ax, di

loc_CEF73:
		mov	di, ax
		push	large 5
		push	ax
		call	sub_74A9B
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_74C8A
		add	sp, 6
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_5E], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_60], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CEFAC
		jmp	loc_CF038

loc_CEFAC:
		push	large 13000Dh
		push	large 0A700B2h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_5E]
		mov	eax, [bx]
		mov	[bp+var_64], eax
		mov	al, [bx+4]
		mov	[bp+var_65], al
		mov	eax, [bp+var_64]
		mov	[di+1Eh], eax
		mov	al, [bp+var_65]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ah
		mov	word ptr [di+0Eh], 3D25h
		mov	word ptr [di+2Eh], 0Bh
		mov	ax, [bp+var_60]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 6
		mov	word ptr [di+0Eh], 3D59h
		mov	word ptr [di+30h], 7
		mov	ax, di
		jmp	short loc_CF03A

loc_CF038:
		mov	ax, di

loc_CF03A:
		mov	di, ax
		push	large 5
		push	ax
		call	sub_74A9B
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_74C8A
		add	sp, 6
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_68], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_6A], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CF073
		jmp	loc_CF0FF

loc_CF073:
		push	large 13000Dh
		push	large 0A700ECh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[bp+var_6E], eax
		mov	al, [bx+4]
		mov	[bp+var_6F], al
		mov	eax, [bp+var_6E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_6F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ch
		mov	word ptr [di+0Eh], 3D25h
		mov	word ptr [di+2Eh], 0Dh
		mov	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 8
		mov	word ptr [di+0Eh], 3D59h
		mov	word ptr [di+30h], 9
		mov	ax, di
		jmp	short loc_CF101

loc_CF0FF:
		mov	ax, di

loc_CF101:
		mov	di, ax
		push	large 5
		push	ax
		call	sub_74A9B
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_74C8A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_72], ax
		mov	ax, si
		add	ax, 0CEh
		mov	[bp+var_74], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CF13E
		jmp	loc_CF1C5

loc_CF13E:
		push	large 0D0021h
		push	large 0AA0110h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_72]
		mov	eax, [bx]
		mov	[bp+var_78], eax
		mov	al, [bx+4]
		mov	[bp+var_79], al
		mov	eax, [bp+var_78]
		mov	[di+1Eh], eax
		mov	al, [bp+var_79]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Eh
		mov	word ptr [di+0Eh], 3C89h
		mov	ax, [bp+var_74]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 3CBDh
		mov	word ptr [di+2Eh], 0Fh
		mov	ax, di
		jmp	short loc_CF1C7

loc_CF1C5:
		mov	ax, di

loc_CF1C7:
		push	ax
		push	si
		call	sub_74C8A
		add	sp, 6
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_7C], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_7E], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CF1F0
		jmp	loc_CF276

loc_CF1F0:
		push	large 0A0014h
		push	large 0A2007Dh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_7C]
		mov	eax, [bx]
		mov	[bp+var_82], eax
		mov	al, [bx+4]
		mov	[bp+var_83], al
		mov	eax, [bp+var_82]
		mov	[di+1Eh], eax
		mov	al, [bp+var_83]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 3D25h
		mov	word ptr [di+2Eh], 3
		mov	ax, [bp+var_7E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Ah
		mov	ax, di
		jmp	short loc_CF278

loc_CF276:
		mov	ax, di

loc_CF278:
		mov	di, ax
		push	large 5
		push	ax
		call	sub_74A9B
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_74C8A
		add	sp, 6
		mov	ax, si
		add	ax, 0C4h
		mov	[bp+var_86], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_88], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_CF2B3
		jmp	loc_CF33B

loc_CF2B3:
		push	large 0A0014h
		push	large 0B4007Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_86]
		mov	eax, [bx]
		mov	[bp+var_8C], eax
		mov	al, [bx+4]
		mov	[bp+var_8D], al
		mov	eax, [bp+var_8C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 3D25h
		mov	word ptr [di+2Eh], 5
		mov	ax, [bp+var_88]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Bh
		mov	ax, di
		jmp	short loc_CF33D

loc_CF33B:
		mov	ax, di

loc_CF33D:
		mov	di, ax
		push	large 5
		push	ax
		call	sub_74A9B
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_74C8A
		add	sp, 6
		push	large 0B0009Fh
		call	TextScrollDisplay_RegisterEntries_6F4F8
		add	sp, 4
		push	large 0B0009Fh
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_6FA5F
		add	sp, 8
		mov	di, word_7CEF9
		mov	cx, [si+73h]
		add	cx, 12h
		mov	ax, di
		add	ax, 2Ch
		mov	[bp+var_90], ax
		add	si, 0A4h
		mov	bx, [bp+var_90]
		mov	eax, [bx]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_98], eax
		mov	eax, [bx+4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_A0], eax
		mov	eax, [bx+8]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_234], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_230], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_22C], eax
		mov	bx, cx
		mov	eax, [bx]
		sub	eax, [bp+var_234]
		mov	[bp+var_240], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_230]
		mov	[bp+var_23C], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_22C]
		mov	[bp+var_238], eax
		mov	eax, [bp+var_240]
		mov	[bp+var_24C], eax
		mov	eax, [bp+var_23C]
		mov	[bp+var_248], eax
		mov	eax, [bp+var_238]
		mov	[bp+var_244], eax
		mov	eax, [bp+var_24C]
		mov	[di+14h], eax
		mov	eax, [bp+var_248]
		mov	[di+18h], eax
		mov	eax, [bp+var_244]
		mov	[di+1Ch], eax
		mov	byte_7D152, 1
		cmp	[bp+var_2F], 0
		jz	short loc_CF495
		cmp	[bp+var_34], 0
		jz	short loc_CF495
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CF495

loc_CF495:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	2
		lea	ax, [bp+var_228]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	[bp+var_1A4], 520h
		lea	ax, [bp+var_1A4]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_1A4]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_CE943		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CF4DC		proc far

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
		sub	sp, 5Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_7CEF9
		mov	ax, [si+0B4h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		mov	edx, dword_7976E
		imul	edx, eax
		mov	[bp+var_A], edx
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	ax, [si+0B6h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		mov	edx, dword_7976E
		imul	edx, eax
		mov	[bp+var_14], edx
		mov	eax, [bp+var_14]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_4]
		add	[si+0ACh], eax
		mov	eax, [bp+var_E]
		add	[si+0B0h], eax
		cmp	dword ptr [si+0ACh], 0
		jge	short loc_CF54C
		mov	ax, 1
		jmp	short loc_CF54E

loc_CF54C:
		xor	ax, ax

loc_CF54E:
		or	al, al
		jz	short loc_CF55D
		add	dword ptr [si+0ACh], 16800h
		jmp	short loc_CF57C

loc_CF55D:
		cmp	dword ptr [si+0ACh], 16800h
		jl	short loc_CF56D
		mov	ax, 1
		jmp	short loc_CF56F

loc_CF56D:
		xor	ax, ax

loc_CF56F:
		or	al, al
		jz	short loc_CF57C
		sub	dword ptr [si+0ACh], 16800h

loc_CF57C:
		cmp	dword ptr [si+0B0h], 0B400h
		jle	short loc_CF58C
		mov	ax, 1
		jmp	short loc_CF58E

loc_CF58C:
		xor	ax, ax

loc_CF58E:
		or	al, al
		jz	short loc_CF59D
		sub	dword ptr [si+0B0h], 16800h
		jmp	short loc_CF5BC

loc_CF59D:
		cmp	dword ptr [si+0B0h], 0FFFF4C00h
		jg	short loc_CF5AD
		mov	ax, 1
		jmp	short loc_CF5AF

loc_CF5AD:
		xor	ax, ax

loc_CF5AF:
		or	al, al
		jz	short loc_CF5BC
		add	dword ptr [si+0B0h], 16800h

loc_CF5BC:
		test	byte ptr [si+8Fh], 1
		jz	short loc_CF60B
		cmp	dword ptr [si+0B0h], 0
		jle	short loc_CF5D0
		mov	ax, 1
		jmp	short loc_CF5D2

loc_CF5D0:
		xor	ax, ax

loc_CF5D2:
		or	al, al
		jz	short loc_CF60B
		cmp	dword ptr [si+0B0h], 5A00h
		jge	short loc_CF5E6
		mov	ax, 1
		jmp	short loc_CF5E8

loc_CF5E6:
		xor	ax, ax

loc_CF5E8:
		or	al, al
		jz	short loc_CF5FA
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		jmp	short loc_CF606

loc_CF5FA:
		mov	[bp+var_1C], 0B400h
		mov	eax, [bp+var_1C]

loc_CF606:
		mov	[si+0B0h], eax

loc_CF60B:
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		mov	ax, si
		add	ax, 0ACh
		push	ax
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4
		mov	ax, si
		add	ax, 0ACh
		push	ax
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4
		mov	ax, si
		add	ax, 0ACh
		push	ax
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	ax, si
		add	ax, 0B0h
		push	ax
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Missile_ComputeDirectionVector2D_5738D
		add	sp, 4
		mov	ax, si
		add	ax, 0B0h
		push	ax
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	Missile_ComputeDirectionVector2D_5738D
		add	sp, 4
		mov	ax, si
		add	ax, 0B0h
		push	ax
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		push	ax
		call	Missile_ComputeDirectionVector2D_5738D
		add	sp, 4
		push	word ptr [si+73h]
		mov	bx, [si+73h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	cx, [si+73h]
		add	cx, 12h
		mov	ax, di
		add	ax, 2Ch
		mov	[bp+var_1E], ax
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_20], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	bx, [bp+var_20]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+4]
		mov	bx, [bp+var_20]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+8]
		mov	bx, [bp+var_20]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	bx, cx
		mov	eax, [bx]
		sub	eax, [bp+var_44]
		mov	[bp+var_50], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[di+14h], eax
		mov	eax, [bp+var_58]
		mov	[di+18h], eax
		mov	eax, [bp+var_54]
		mov	[di+1Ch], eax
		call	sub_50EA9
		push	si
		call	TextScrollDisplayB_TickHelper_511CC
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_CF4DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CF7E7		proc far

var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= word ptr -58h
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= word ptr -4Eh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
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
		sub	sp, 78h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	bx, 0Bh
		jbe	short loc_CF7FD
		jmp	loc_CFB7A

loc_CF7FD:
		shl	bx, 1
		jmp	cs:off_CFC21[bx]	; switch jump

loc_CF804:
		cmp	word ptr [si+92h], 0
		jnz	short loc_CF80E
		jmp	loc_CFB7A

loc_CF80E:
		push	word ptr [si+73h]
		push	67ADh
		call	sub_1E610
		add	sp, 4
		inc	word ptr [si+90h]
		mov	ax, [si+90h]
		cmp	ax, [si+92h]
		jl	short loc_CF830
		mov	word ptr [si+90h], 0

loc_CF830:
		push	si
		push	cs
		call	near ptr sub_CE892
		pop	cx
		mov	ax, si
		add	ax, 75h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	1
		push	1
		push	[bp+var_2]
		push	ax
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[si+73h], ax
		mov	bx, [si+73h]
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_CF86C
		mov	ax, 1
		jmp	short loc_CF86E

loc_CF86C:
		xor	ax, ax

loc_CF86E:
		or	al, al
		jz	short loc_CF881
		mov	bx, [si+73h]
		push	large [bx+5Fh]
		call	sub_3E140
		add	sp, 4

loc_CF881:
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_6C], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_68], eax
		mov	[bp+var_10], 0A0000h
		mov	eax, [bp+var_10]
		mov	[bp+var_64], eax
		mov	bx, [si+73h]
		mov	eax, [bp+var_6C]
		mov	[bx+12h], eax
		mov	eax, [bp+var_68]
		mov	[bx+16h], eax
		mov	eax, [bp+var_64]
		mov	[bx+1Ah], eax
		mov	ax, [si+73h]
		add	ax, 12h
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		mov	bx, [si+73h]
		mov	eax, [bx+20h]
		mov	[si+9Ch], eax
		mov	[bp+var_14], 180h
		mov	eax, [si+9Ch]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Ch], eax
		mov	eax, [si+9Ch]
		shl	eax, 4
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[si+0A0h], eax
		push	bx
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_CE92D
		pop	cx
		mov	ax, [si+0A8h]
		mov	[si+0AAh], ax
		mov	[bp+var_1E], ax
		mov	di, si
		add	di, 98h
		movsx	eax, [bp+var_1E]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax

loc_CF954:
		mov	[si+0A4h], eax
		mov	ax, si
		add	ax, 7Eh
		push	ax
		push	word ptr [si+0D0h]
		call	sub_74B31
		add	sp, 4
		jmp	loc_CFB7A

loc_CF96E:
		cmp	word ptr [si+92h], 0
		jnz	short loc_CF978
		jmp	loc_CFB7A

loc_CF978:
		push	word ptr [si+73h]
		push	67ADh
		call	sub_1E610
		add	sp, 4
		dec	word ptr [si+90h]
		cmp	word ptr [si+90h], 0
		jge	short loc_CF99A
		mov	ax, [si+92h]
		dec	ax
		mov	[si+90h], ax

loc_CF99A:
		push	si
		push	cs
		call	near ptr sub_CE892
		pop	cx
		mov	ax, si
		add	ax, 75h
		mov	[bp+var_28], ds
		mov	[bp+var_2A], ax
		push	1
		push	1
		push	[bp+var_28]
		push	ax
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[si+73h], ax
		mov	bx, [si+73h]
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_CF9D6
		mov	ax, 1
		jmp	short loc_CF9D8

loc_CF9D6:
		xor	ax, ax

loc_CF9D8:
		or	al, al
		jz	short loc_CF9EB
		mov	bx, [si+73h]
		push	large [bx+5Fh]
		call	sub_3E140
		add	sp, 4

loc_CF9EB:
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		mov	[bp+var_78], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_74], eax
		mov	[bp+var_36], 0A0000h
		mov	eax, [bp+var_36]
		mov	[bp+var_70], eax
		mov	bx, [si+73h]
		mov	eax, [bp+var_78]
		mov	[bx+12h], eax
		mov	eax, [bp+var_74]
		mov	[bx+16h], eax
		mov	eax, [bp+var_70]
		mov	[bx+1Ah], eax
		mov	ax, [si+73h]
		add	ax, 12h
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		mov	bx, [si+73h]
		mov	eax, [bx+20h]
		mov	[si+9Ch], eax
		mov	[bp+var_3A], 180h
		mov	eax, [si+9Ch]
		mov	edx, [bp+var_3A]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Ch], eax
		mov	eax, [si+9Ch]
		shl	eax, 4
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	[si+0A0h], eax
		push	bx
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_CE92D
		pop	cx
		mov	ax, [si+0A8h]
		mov	[si+0AAh], ax
		mov	[bp+var_44], ax
		mov	di, si
		add	di, 98h
		movsx	eax, [bp+var_44]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_48], edx
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		jmp	loc_CF954

loc_CFAC1:
		cmp	word ptr [si+0B6h], 0
		jz	short loc_CFACA
		jmp	short loc_CFAF9

loc_CFACA:
		sub	dword ptr [si+0B0h], 0A00h
		jmp	loc_CFB7A

loc_CFAD6:
		mov	al, [si+8Fh]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jnz	short loc_CFAE9
		jmp	loc_CFB7A

loc_CFAE9:
		mov	word ptr [si+0B6h], 0FFC4h
		jmp	loc_CFB7A

loc_CFAF2:
		cmp	word ptr [si+0B6h], 0
		jz	short loc_CFB01

loc_CFAF9:
		mov	word ptr [si+0B6h], 0
		jmp	short loc_CFB7A

loc_CFB01:
		add	dword ptr [si+0B0h], 0A00h
		jmp	short loc_CFB7A

loc_CFB0C:
		mov	al, [si+8Fh]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jz	short loc_CFB7A
		mov	word ptr [si+0B6h], 3Ch
		jmp	short loc_CFB7A

loc_CFB24:
		cmp	word ptr [si+0B4h], 0
		jz	short loc_CFB2D
		jmp	short loc_CFB47

loc_CFB2D:
		sub	dword ptr [si+0ACh], 0A00h
		jmp	short loc_CFB7A

loc_CFB38:
		mov	word ptr [si+0B4h], 0FFC4h
		jmp	short loc_CFB7A

loc_CFB40:
		cmp	word ptr [si+0B4h], 0
		jz	short loc_CFB4F

loc_CFB47:
		mov	word ptr [si+0B4h], 0
		jmp	short loc_CFB7A

loc_CFB4F:
		add	dword ptr [si+0ACh], 0A00h
		jmp	short loc_CFB7A

loc_CFB5A:
		mov	word ptr [si+0B4h], 3Ch
		jmp	short loc_CFB7A

loc_CFB62:
		cmp	word ptr [si+0A8h], 64h
		jge	short loc_CFB7A
		inc	word ptr [si+0A8h]
		jmp	short loc_CFB7A

loc_CFB6F:
		cmp	word ptr [si+0A8h], 0
		jle	short loc_CFB7A
		dec	word ptr [si+0A8h]

loc_CFB7A:
		mov	ax, [si+0A8h]
		cmp	ax, [si+0AAh]
		jnz	short loc_CFB87
		jmp	loc_CFC17

loc_CFB87:
		mov	[bp+var_4E], ax
		mov	di, si
		add	di, 98h
		movsx	eax, [bp+var_4E]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_52], edx
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	[si+0A4h], eax
		mov	eax, [si+0A4h]
		cmp	eax, [si+0A0h]
		jle	short loc_CFBBE
		mov	ax, 1
		jmp	short loc_CFBC0

loc_CFBBE:
		xor	ax, ax

loc_CFBC0:
		or	al, al
		jnz	short loc_CFBDB
		mov	eax, [si+0A4h]
		cmp	eax, [si+9Ch]
		jge	short loc_CFBD5
		mov	ax, 1
		jmp	short loc_CFBD7

loc_CFBD5:
		xor	ax, ax

loc_CFBD7:
		or	al, al
		jz	short loc_CFC0F

loc_CFBDB:
		mov	ax, [si+0AAh]
		mov	[si+0A8h], ax
		mov	ax, [si+0A8h]
		mov	[bp+var_58], ax
		mov	di, si
		add	di, 98h
		movsx	eax, [bp+var_58]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_5C], edx
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	[si+0A4h], eax
		jmp	short loc_CFC17

loc_CFC0F:
		mov	ax, [si+0A8h]
		mov	[si+0AAh], ax

loc_CFC17:
		push	si
		push	cs
		call	near ptr sub_CF4DC
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_CF7E7		endp

; START OF FUNCTION CHUNK FOR sub_CF7E7
off_CFC21	dw offset loc_CF804
		dw offset loc_CF96E
		dw offset loc_CFAC1
		dw offset loc_CFAD6
		dw offset loc_CFAF2
		dw offset loc_CFB0C
		dw offset loc_CFB24
		dw offset loc_CFB38
		dw offset loc_CFB40
		dw offset loc_CFB5A
		dw offset loc_CFB62
		dw offset loc_CFB6F
; END OF FUNCTION CHUNK FOR sub_CF7E7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CFC39		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	word ptr [si+6Dh], 0
		mov	word ptr [si+6Bh], 0
		xor	di, di
		push	si
		call	sub_74ADC
		pop	cx
		jmp	loc_CFD6E

loc_CFC5F:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_CFC8E
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CFC8E
		push	66DFh
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_CFC8E

loc_CFC8E:
		mov	al, byte_7CE08
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CFC9A
		jmp	loc_CFD2E

loc_CFC9A:
		mov	dx, [si+69h]
		mov	ax, word_7CE0A
		sar	ax, 1
		mov	[si+67h], ax
		mov	ax, word_7CE0C
		mov	[si+69h], ax
		sub	dx, [si+69h]
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_CFCBC
		or	dx, dx
		jz	short loc_CFD1C

loc_CFCBC:
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	[bp+var_4], ax
		cmp	[bp+var_4], di
		jz	short loc_CFCE1
		mov	ax, 1
		jmp	short loc_CFCE3

loc_CFCE1:
		xor	ax, ax

loc_CFCE3:
		mov	[bp+var_6], ax
		or	di, di
		jz	short loc_CFCF8
		cmp	[bp+var_6], 0
		jz	short loc_CFCF8
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+14h]
		pop	cx

loc_CFCF8:
		cmp	[bp+var_4], 0
		jz	short loc_CFD19
		push	[bp+var_6]
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8

loc_CFD19:
		mov	di, [bp+var_4]

loc_CFD1C:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_CFD2E
		mov	al, byte_7CE09
		mov	ah, 0
		mov	[si+6Bh], ax

loc_CFD2E:
		cmp	[bp+var_2], 0
		jnz	short loc_CFD65
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_CFD65
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_CFD65
		cmp	[bp+arg_4], 0
		jnz	short loc_CFD7D

loc_CFD65:
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_CFD6E
		dec	[bp+arg_2]

loc_CFD6E:
		cmp	[bp+var_2], 0
		jnz	short loc_CFD7D
		cmp	[bp+arg_2], 0
		jz	short loc_CFD7D
		jmp	loc_CFC5F

loc_CFD7D:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_CFC39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CFD84		proc far

var_D4		= word ptr -0D4h
var_D0		= word ptr -0D0h
var_CE		= word ptr -0CEh
var_C6		= word ptr -0C6h
var_6D		= word ptr -6Dh
var_6B		= word ptr -6Bh
var_69		= dword ptr -69h
var_65		= word ptr -65h
var_63		= word ptr -63h
var_6		= byte ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D4h
		mov	ax, [bp+arg_0]
		mov	byte_7D150, 0
		mov	byte_7D151, 0
		mov	byte_7CAFE, 0
		push	7
		call	Music_SetPendingTune_5ED30
		pop	cx
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_D4]
		push	ax
		push	cs
		call	near ptr sub_CE6F0
		add	sp, 0Ah
		mov	[bp+var_65], 0
		mov	[bp+var_63], 1
		lea	ax, [bp+var_D4]
		push	ax
		call	sub_74CC6
		pop	cx
		jmp	short loc_CFE2C

loc_CFDD1:
		lea	ax, [bp+var_D4]
		push	ax
		push	cs
		call	near ptr sub_CF4DC
		pop	cx
		lea	ax, [bp+var_D4]
		push	ax
		mov	bx, [bp+var_C6]
		call	dword ptr [bx+18h]
		pop	cx
		push	large 0C8h
		lea	ax, [bp+var_D4]
		push	ax
		push	cs
		call	near ptr sub_CFC39
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_CFE2C
		cmp	word ptr [bp+var_69], 0
		jz	short loc_CFE2C
		push	large [bp+var_69]
		mov	ax, [bp+var_6B]
		sub	ax, [bp+var_CE]
		push	ax
		mov	ax, [bp+var_6D]
		sub	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		mov	bx, [bp+var_C6]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_CFE2C:
		mov	al, [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jz	short loc_CFDD1
		lea	ax, [bp+var_D4]
		push	ax
		call	sub_74AD7
		pop	cx
		lea	ax, [bp+var_D4]
		push	ax
		call	sub_74CEE
		pop	cx
		push	0
		push	word_7AF7C
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		cmp	byte_7C9F0, 2
		jnz	short loc_CFE6F
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_CFE6F

loc_CFE6F:
		push	1
		call	Music_Stop_5ED8F
		pop	cx
		push	65D0h
		call	sub_741E8
		pop	cx
		mov	byte_7D152, 0
		push	2
		lea	ax, [bp+var_D4]
		push	ax
		push	cs
		call	near ptr sub_CE786
		add	sp, 4
		leave
		retf
sub_CFD84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_CFE95		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CFEF4
		cmp	byte ptr [si+23h], 0
		jz	short loc_CFECA
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_CFECA
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CFECA

loc_CFECA:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_CFEF4
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_CFEF4

loc_CFEF4:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_CFE95		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_CFEF8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CFF57
		cmp	byte ptr [si+23h], 0
		jz	short loc_CFF2D
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_CFF2D
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CFF2D

loc_CFF2D:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_CFF57
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_CFF57

loc_CFF57:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_CFEF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_CFF5B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CFFBA
		cmp	byte ptr [si+23h], 0
		jz	short loc_CFF90
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_CFF90
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CFF90

loc_CFF90:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_CFFBA
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_CFFBA

loc_CFFBA:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_CFF5B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_CFFBE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D001D
		cmp	byte ptr [si+23h], 0
		jz	short loc_CFFF3
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_CFFF3
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CFFF3

loc_CFFF3:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_D001D
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_D001D

loc_D001D:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_CFFBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_D0021		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D0080
		cmp	byte ptr [si+23h], 0
		jz	short loc_D0056
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_D0056
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D0056

loc_D0056:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_D0080
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_D0080

loc_D0080:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_D0021		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ReleaseAllResources_A44FA (sub_A44FA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère les ressources du widget (sub_338, Memory_TypedFree_5C7B6,
; TextFormat_ReleaseStyleList_5E526, sub_338) — destructeur complet.
; ==============================================================================================
GaugeWidget_ReleaseAllResources_D0084		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D00F4
		mov	word ptr [si+0Eh], 3D8Dh
		push	word ptr [si+2Eh]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_D00CC
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_D00CC
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D00CC

loc_D00CC:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_D00F4
		push	si
		call	sub_3B2
		pop	cx

loc_D00F4:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseAllResources_D0084		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D00F8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D016A
		mov	word ptr [si+0Eh], 3D8Dh
		push	word ptr [si+2Eh]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_D0140
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_D0140
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D0140

loc_D0140:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_D016A
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_D016A

loc_D016A:
		pop	di
		pop	si
		pop	bp
		retf
sub_D00F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D016E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D01E0
		mov	word ptr [si+0Eh], 3D8Dh
		push	word ptr [si+2Eh]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_D01B6
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_D01B6
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D01B6

loc_D01B6:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_D01E0
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_D01E0

loc_D01E0:
		pop	di
		pop	si
		pop	bp
		retf
sub_D016E		endp
ovr370		ends
