seg052		segment	para public 'CODE' use16
		assume cs:seg052
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23D51		proc far

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
		jnz	short loc_23D6E
		push	12Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_23D6E
		jmp	loc_23EE1

loc_23D6E:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 23E7h
		mov	ax, si
		add	ax, 9Ah
		mov	ax, si
		add	ax, 9Eh
		mov	ax, si
		add	ax, 0A2h
		mov	ax, si
		add	ax, 0A6h
		mov	ax, si
		add	ax, 0AEh
		mov	ax, si
		add	ax, 0B2h
		mov	dword ptr [si+0BCh], 0
		mov	byte ptr [si+0C0h], 2
		mov	byte ptr [si+0C1h], 0
		mov	dword ptr [si+0C2h], 0
		mov	dword ptr [si+0C6h], 0
		mov	byte ptr [si+0CAh], 2
		mov	byte ptr [si+0CBh], 0
		mov	dword ptr [si+0CCh], 0
		mov	dword ptr [si+0D0h], 0
		mov	byte ptr [si+0D4h], 2
		mov	byte ptr [si+0D5h], 0
		mov	dword ptr [si+0D6h], 0
		mov	dword ptr [si+0DAh], 0
		mov	byte ptr [si+0DEh], 2
		mov	byte ptr [si+0DFh], 0
		mov	dword ptr [si+0E0h], 0
		mov	dword ptr [si+0E4h], 0
		mov	byte ptr [si+0E8h], 2
		mov	byte ptr [si+0E9h], 0
		mov	dword ptr [si+0EAh], 0
		mov	dword ptr [si+0EEh], 0
		mov	byte ptr [si+0F2h], 2
		mov	byte ptr [si+0F3h], 0
		mov	dword ptr [si+0F4h], 0
		mov	dword ptr [si+0F8h], 0
		mov	byte ptr [si+0FCh], 2
		mov	byte ptr [si+0FDh], 0
		mov	dword ptr [si+0FEh], 0
		mov	dword ptr [si+102h], 0
		mov	byte ptr [si+106h], 2
		mov	byte ptr [si+107h], 0
		mov	dword ptr [si+108h], 0
		mov	dword ptr [si+10Ch], 0
		mov	byte ptr [si+110h], 2
		mov	byte ptr [si+111h], 0
		mov	dword ptr [si+112h], 0
		mov	dword ptr [si+116h], 0
		mov	byte ptr [si+11Ah], 2
		mov	byte ptr [si+11Bh], 0
		mov	dword ptr [si+11Ch], 0
		mov	dword ptr [si+120h], 0
		mov	byte ptr [si+124h], 2
		mov	byte ptr [si+125h], 0
		mov	dword ptr [si+126h], 0
		push	si
		nop
		push	cs
		call	near ptr sub_2430E
		pop	cx

loc_23EE1:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_23D51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23EE6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_23EF8
		jmp	loc_24247

loc_23EF8:
		mov	word ptr [si+0Eh], 23E7h
		push	large 27F0000h
		call	sub_55F6F
		add	sp, 4
		push	large 0C70000h
		call	sub_55F9E
		add	sp, 4
		cmp	byte_600BF, 0
		jz	short loc_23F3E
		cmp	dword_600BA, 0
		jz	short loc_23F3E
		push	0
		mov	al, byte_600BE
		push	ax
		push	639Ah
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_23F3E

loc_23F3E:
		mov	dword_600BA, 0
		mov	byte_600BF, 0
		mov	dword_600C0, 0
		call	sub_59191
		push	0
		push	2
		mov	ax, si
		add	ax, 96h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		cmp	byte ptr [si+125h], 0
		jz	short loc_23F98
		cmp	dword ptr [si+120h], 0
		jz	short loc_23F98
		push	0
		mov	al, [si+124h]
		push	ax
		mov	ax, si
		add	ax, 120h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_23F98

loc_23F98:
		mov	dword ptr [si+120h], 0
		mov	byte ptr [si+125h], 0
		mov	dword ptr [si+126h], 0
		cmp	byte ptr [si+11Bh], 0
		jz	short loc_23FD8
		cmp	dword ptr [si+116h], 0
		jz	short loc_23FD8
		push	0
		mov	al, [si+11Ah]
		push	ax
		mov	ax, si
		add	ax, 116h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_23FD8

loc_23FD8:
		mov	dword ptr [si+116h], 0
		mov	byte ptr [si+11Bh], 0
		mov	dword ptr [si+11Ch], 0
		cmp	byte ptr [si+111h], 0
		jz	short loc_24018
		cmp	dword ptr [si+10Ch], 0
		jz	short loc_24018
		push	0
		mov	al, [si+110h]
		push	ax
		mov	ax, si
		add	ax, 10Ch
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_24018

loc_24018:
		mov	dword ptr [si+10Ch], 0
		mov	byte ptr [si+111h], 0
		mov	dword ptr [si+112h], 0
		cmp	byte ptr [si+107h], 0
		jz	short loc_24058
		cmp	dword ptr [si+102h], 0
		jz	short loc_24058
		push	0
		mov	al, [si+106h]
		push	ax
		mov	ax, si
		add	ax, 102h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_24058

loc_24058:
		mov	dword ptr [si+102h], 0
		mov	byte ptr [si+107h], 0
		mov	dword ptr [si+108h], 0
		cmp	byte ptr [si+0FDh], 0
		jz	short loc_24098
		cmp	dword ptr [si+0F8h], 0
		jz	short loc_24098
		push	0
		mov	al, [si+0FCh]
		push	ax
		mov	ax, si
		add	ax, 0F8h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_24098

loc_24098:
		mov	dword ptr [si+0F8h], 0
		mov	byte ptr [si+0FDh], 0
		mov	dword ptr [si+0FEh], 0
		cmp	byte ptr [si+0F3h], 0
		jz	short loc_240D8
		cmp	dword ptr [si+0EEh], 0
		jz	short loc_240D8
		push	0
		mov	al, [si+0F2h]
		push	ax
		mov	ax, si
		add	ax, 0EEh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_240D8

loc_240D8:
		mov	dword ptr [si+0EEh], 0
		mov	byte ptr [si+0F3h], 0
		mov	dword ptr [si+0F4h], 0
		cmp	byte ptr [si+0E9h], 0
		jz	short loc_24118
		cmp	dword ptr [si+0E4h], 0
		jz	short loc_24118
		push	0
		mov	al, [si+0E8h]
		push	ax
		mov	ax, si
		add	ax, 0E4h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_24118

loc_24118:
		mov	dword ptr [si+0E4h], 0
		mov	byte ptr [si+0E9h], 0
		mov	dword ptr [si+0EAh], 0
		cmp	byte ptr [si+0DFh], 0
		jz	short loc_24158
		cmp	dword ptr [si+0DAh], 0
		jz	short loc_24158
		push	0
		mov	al, [si+0DEh]
		push	ax
		mov	ax, si
		add	ax, 0DAh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_24158

loc_24158:
		mov	dword ptr [si+0DAh], 0
		mov	byte ptr [si+0DFh], 0
		mov	dword ptr [si+0E0h], 0
		cmp	byte ptr [si+0D5h], 0
		jz	short loc_24198
		cmp	dword ptr [si+0D0h], 0
		jz	short loc_24198
		push	0
		mov	al, [si+0D4h]
		push	ax
		mov	ax, si
		add	ax, 0D0h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_24198

loc_24198:
		mov	dword ptr [si+0D0h], 0
		mov	byte ptr [si+0D5h], 0
		mov	dword ptr [si+0D6h], 0
		cmp	byte ptr [si+0CBh], 0
		jz	short loc_241D8
		cmp	dword ptr [si+0C6h], 0
		jz	short loc_241D8
		push	0
		mov	al, [si+0CAh]
		push	ax
		mov	ax, si
		add	ax, 0C6h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_241D8

loc_241D8:
		mov	dword ptr [si+0C6h], 0
		mov	byte ptr [si+0CBh], 0
		mov	dword ptr [si+0CCh], 0
		cmp	byte ptr [si+0C1h], 0
		jz	short loc_24218
		cmp	dword ptr [si+0BCh], 0
		jz	short loc_24218
		push	0
		mov	al, [si+0C0h]
		push	ax
		mov	ax, si
		add	ax, 0BCh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_24218

loc_24218:
		mov	dword ptr [si+0BCh], 0
		mov	byte ptr [si+0C1h], 0
		mov	dword ptr [si+0C2h], 0
		push	0
		push	si
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		test	di, 1
		jz	short loc_24247
		push	si
		call	sub_33B
		pop	cx

loc_24247:
		pop	di
		pop	si
		pop	bp
		retf
sub_23EE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2424B		proc far

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
		mov	ax, [si+98h]
		mov	dx, [si+96h]
		mov	bx, [si+92h]
		imul	bx, bx, 21h
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	9
		push	ax
		push	dx
		push	ds
		mov	ax, si
		add	ax, 74h
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		push	11h
		mov	ax, [bp+var_4]
		add	ax, 9
		push	[bp+var_2]
		push	ax
		push	ds
		mov	ax, si
		add	ax, 7Eh
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		mov	byte ptr [si+7Dh], 0
		mov	byte ptr [si+8Fh], 0
		mov	byte ptr [si+90h], 1
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Ah]
		mov	[si+91h], al
		mov	ax, es:[bx+1Bh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[si+0AEh], eax
		mov	ax, es:[bx+1Dh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+0B2h], eax
		mov	ax, es:[bx+1Fh]
		mov	[si+0AAh], ax
		pop	si
		leave
		retf
sub_2424B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_242F8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+0B8h], 0
		mov	word ptr [si+0B6h], 3Ch
		pop	si
		pop	bp
		retf
sub_242F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2430E		proc far

var_240		= dword ptr -240h
var_23C		= dword ptr -23Ch
var_238		= dword ptr -238h
var_234		= dword ptr -234h
var_230		= dword ptr -230h
var_22C		= dword ptr -22Ch
var_228		= dword ptr -228h
var_224		= dword ptr -224h
var_220		= dword ptr -220h
var_21C		= word ptr -21Ch
var_1A4		= dword ptr -1A4h
var_1A0		= dword ptr -1A0h
var_19C		= dword ptr -19Ch
var_198		= word ptr -198h
var_13B		= dword ptr -13Bh
var_137		= dword ptr -137h
var_133		= dword ptr -133h
var_12B		= dword ptr -12Bh
var_126		= dword ptr -126h
var_11E		= word ptr -11Eh
var_11C		= word ptr -11Ch
var_F0		= word ptr -0F0h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= word ptr -84h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_77		= byte ptr -77h
var_76		= dword ptr -76h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6D		= byte ptr -6Dh
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_63		= byte ptr -63h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
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
		sub	sp, 240h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	word ptr [si+94h], 0
		mov	word ptr [si+92h], 0
		push	ds
		push	offset aIFF
		push	ds
		push	offset aObjview
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_198], 9B5h
		mov	[bp+var_137], 100h
		mov	[bp+var_13B], 0
		mov	[bp+var_198], 9CDh
		mov	[bp+var_11C], 0
		xor	ax, ax
		mov	[bp+var_11E], ax
		movsx	eax, ax
		mov	[bp+var_133], eax
		push	1
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_198]
		push	ax
		mov	bx, [bp+var_198]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	eax, [bp+var_12B]
		cmp	eax, dword_5C08C
		jnz	short loc_243A4
		mov	ax, 1
		jmp	short loc_243A6

loc_243A4:
		xor	ax, ax

loc_243A6:
		or	ax, ax
		jz	short loc_24416
		lea	ax, [bp+var_198]
		push	ax
		call	sub_541A0
		pop	cx
		push	0
		push	large dword_5C091
		lea	ax, [bp+var_198]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_24416
		mov	eax, [bp+var_126]
		mov	[bp+var_A0], eax
		mov	ebx, 21h
		cdq
		idiv	ebx
		mov	[si+94h], ax
		push	1
		push	0
		push	2
		push	large [bp+var_A0]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+98h], dx
		mov	[si+96h], ax
		push	large [si+96h]
		lea	ax, [bp+var_198]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6

loc_24416:
		cmp	word ptr [si+94h], 0
		jz	short loc_24425
		push	si
		push	cs
		call	near ptr sub_2424B
		pop	cx
		jmp	short loc_24432

loc_24425:
		push	1
		push	2354h
		call	sub_9D78
		add	sp, 4

loc_24432:
		mov	ax, si
		add	ax, 74h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	1
		push	1
		push	[bp+var_2]
		push	ax
		push	6482h
		call	sub_37E34
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_1A4], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_1A0], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_19C], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_1A4]
		mov	[bx+12h], eax
		mov	eax, [bp+var_1A0]
		mov	[bx+16h], eax
		mov	eax, [bp+var_19C]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_BuildFromAngle_3B551
		pop	cx
		push	word ptr [si+72h]
		push	649Bh
		call	List_AppendIfNonNull_363E4
		add	sp, 4
		call	sub_591AA
		mov	[bp+var_14], 200h
		mov	eax, [bp+var_14]
		mov	[si+9Ah], eax
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Eh], eax
		mov	[bp+var_18], 180h
		mov	eax, [si+9Eh]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Eh], eax
		mov	eax, [si+9Eh]
		shl	eax, 4
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	[si+0A2h], eax
		mov	ax, [si+0AAh]
		mov	[si+0ACh], ax
		mov	[bp+var_22], ax
		mov	di, si
		add	di, 9Ah
		movsx	eax, [bp+var_22]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_26], edx
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	[si+0A6h], eax
		push	si
		push	cs
		call	near ptr sub_242F8
		pop	cx
		mov	word ptr [si+12Ah], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aObjview_1
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_21C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	2
		push	639Ah
		push	0
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 0BCh
		push	ax
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 0C6h
		push	ax
		push	0Bh
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	di, si
		add	di, 0C6h
		mov	eax, [di]
		mov	[bp+var_2E], eax
		mov	al, [di+4]
		mov	[bp+var_2F], al
		mov	eax, [bp+var_2E]
		mov	[si+50h], eax
		mov	al, [bp+var_2F]
		mov	[si+54h], al
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		mov	eax, [di+6]
		mov	[si+56h], eax
		mov	word ptr [si+5Ah], 0
		push	2
		mov	ax, si
		add	ax, 0D0h
		push	ax
		push	4
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 0DAh
		push	ax
		push	5
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 0E4h
		push	ax
		push	6
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 0EEh
		push	ax
		push	7
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 0F8h
		push	ax
		push	8
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 102h
		push	ax
		push	9
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 10Ch
		push	ax
		push	3
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 116h
		push	ax
		push	2
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 120h
		push	ax
		push	0Ah
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_32], si
		mov	ax, si
		add	ax, 120h
		mov	[bp+var_34], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_36], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_246FC
		jmp	loc_24788

loc_246FC:
		push	large 10009Bh
		push	large 140055h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_34]
		mov	eax, [bx]
		mov	[bp+var_3A], eax
		mov	al, [bx+4]
		mov	[bp+var_3B], al
		mov	eax, [bp+var_3A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_3B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 237Fh
		mov	word ptr [di+2Eh], 0
		mov	ax, [bp+var_36]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0
		mov	word ptr [di+0Eh], 23B3h
		mov	word ptr [di+30h], 1
		mov	ax, di
		jmp	short loc_2478A

loc_24788:
		mov	ax, di

loc_2478A:
		mov	di, ax
		push	0
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		mov	ax, si
		add	ax, 0D0h
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_40], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_247B7
		jmp	loc_24843

loc_247B7:
		push	large 9000Fh
		push	large 70020h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_3E]
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	al, [bx+4]
		mov	[bp+var_45], al
		mov	eax, [bp+var_44]
		mov	[di+1Eh], eax
		mov	al, [bp+var_45]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 237Fh
		mov	word ptr [di+2Eh], 1
		mov	ax, [bp+var_40]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 23B3h
		mov	word ptr [di+30h], 3
		mov	ax, di
		jmp	short loc_24845

loc_24843:
		mov	ax, di

loc_24845:
		mov	di, ax
		push	large 5
		push	ax
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_208FD
		add	sp, 6
		mov	ax, si
		add	ax, 0DAh
		mov	[bp+var_48], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_4A], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_2487E
		jmp	loc_2490A

loc_2487E:
		push	large 9000Fh
		push	large 230020h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx]
		mov	[bp+var_4E], eax
		mov	al, [bx+4]
		mov	[bp+var_4F], al
		mov	eax, [bp+var_4E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 237Fh
		mov	word ptr [di+2Eh], 1
		mov	ax, [bp+var_4A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 23B3h
		mov	word ptr [di+30h], 5
		mov	ax, di
		jmp	short loc_2490C

loc_2490A:
		mov	ax, di

loc_2490C:
		mov	di, ax
		push	large 5
		push	ax
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_208FD
		add	sp, 6
		mov	ax, si
		add	ax, 0E4h
		mov	[bp+var_52], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_54], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_24945
		jmp	loc_249D1

loc_24945:
		push	large 0F000Ah
		push	large 120006h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_52]
		mov	eax, [bx]
		mov	[bp+var_58], eax
		mov	al, [bx+4]
		mov	[bp+var_59], al
		mov	eax, [bp+var_58]
		mov	[di+1Eh], eax
		mov	al, [bp+var_59]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 237Fh
		mov	word ptr [di+2Eh], 1
		mov	ax, [bp+var_54]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 6
		mov	word ptr [di+0Eh], 23B3h
		mov	word ptr [di+30h], 7
		mov	ax, di
		jmp	short loc_249D3

loc_249D1:
		mov	ax, di

loc_249D3:
		mov	di, ax
		push	large 5
		push	ax
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_208FD
		add	sp, 6
		mov	ax, si
		add	ax, 0EEh
		mov	[bp+var_5C], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_5E], ax
		push	32h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_24A0C
		jmp	loc_24A98

loc_24A0C:
		push	large 0F000Ah
		push	large 12003Fh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx]
		mov	[bp+var_62], eax
		mov	al, [bx+4]
		mov	[bp+var_63], al
		mov	eax, [bp+var_62]
		mov	[di+1Eh], eax
		mov	al, [bp+var_63]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 237Fh
		mov	word ptr [di+2Eh], 1
		mov	ax, [bp+var_5E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 8
		mov	word ptr [di+0Eh], 23B3h
		mov	word ptr [di+30h], 9
		mov	ax, di
		jmp	short loc_24A9A

loc_24A98:
		mov	ax, di

loc_24A9A:
		mov	di, ax
		push	large 5
		push	ax
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_208FD
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 10Ch
		mov	[bp+var_66], ax
		mov	ax, si
		add	ax, 12Ah
		mov	[bp+var_68], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_24AD7
		jmp	loc_24B5E

loc_24AD7:
		push	large 0C0049h
		push	large 2D007Eh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_66]
		mov	eax, [bx]
		mov	[bp+var_6C], eax
		mov	al, [bx+4]
		mov	[bp+var_6D], al
		mov	eax, [bp+var_6C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_6D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		mov	ax, [bp+var_68]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_24B60

loc_24B5E:
		mov	ax, di

loc_24B60:
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		push	word ptr [si+26h]
		push	1
		push	si
		call	GaugeWidget_AllocateExtra_207F4
		add	sp, 6
		mov	ax, si
		add	ax, 0F8h
		mov	[bp+var_70], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_72], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_24B97
		jmp	loc_24C19

loc_24B97:
		push	large 9000Fh
		push	large 70113h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_70]
		mov	eax, [bx]
		mov	[bp+var_76], eax
		mov	al, [bx+4]
		mov	[bp+var_77], al
		mov	eax, [bp+var_76]
		mov	[di+1Eh], eax
		mov	al, [bp+var_77]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 237Fh
		mov	word ptr [di+2Eh], 1
		mov	ax, [bp+var_72]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Ah
		mov	ax, di
		jmp	short loc_24C1B

loc_24C19:
		mov	ax, di

loc_24C1B:
		mov	di, ax
		push	large 5
		push	ax
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_208FD
		add	sp, 6
		mov	ax, si
		add	ax, 102h
		mov	[bp+var_7A], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_7C], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_24C54
		jmp	loc_24CD8

loc_24C54:
		push	large 9000Fh
		push	large 230113h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_7A]
		mov	eax, [bx]
		mov	[bp+var_80], eax
		mov	al, [bx+4]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[di+1Eh], eax
		mov	al, [bp+var_81]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 237Fh
		mov	word ptr [di+2Eh], 1
		mov	ax, [bp+var_7C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Bh
		mov	ax, di
		jmp	short loc_24CDA

loc_24CD8:
		mov	ax, di

loc_24CDA:
		mov	di, ax
		push	large 5
		push	ax
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		push	di
		push	si
		call	sub_208FD
		add	sp, 6
		push	large 27F0000h
		call	sub_55F6F
		add	sp, 4
		push	large 0C7008Eh
		call	sub_55F9E
		add	sp, 4
		push	large 0B0009Fh
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		push	large 0B0009Fh
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		mov	di, word_601D7
		mov	cx, [si+72h]
		add	cx, 12h
		mov	ax, di
		add	ax, 2Ch
		mov	[bp+var_84], ax
		add	si, 0A6h
		mov	bx, [bp+var_84]
		mov	eax, [bx]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		mov	eax, [bx+4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_94], eax
		mov	eax, [bx+8]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_228], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_224], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_220], eax
		mov	bx, cx
		mov	eax, [bx]
		sub	eax, [bp+var_228]
		mov	[bp+var_234], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_224]
		mov	[bp+var_230], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_220]
		mov	[bp+var_22C], eax
		mov	eax, [bp+var_234]
		mov	[bp+var_240], eax
		mov	eax, [bp+var_230]
		mov	[bp+var_23C], eax
		mov	eax, [bp+var_22C]
		mov	[bp+var_238], eax
		mov	eax, [bp+var_240]
		mov	[di+14h], eax
		mov	eax, [bp+var_23C]
		mov	[di+18h], eax
		mov	eax, [bp+var_238]
		mov	[di+1Ch], eax
		push	2
		lea	ax, [bp+var_21C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	[bp+var_198], 9CDh
		lea	ax, [bp+var_198]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_2430E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24E58		proc far

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
var_22		= dword ptr -22h
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
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_601D7
		mov	ax, [si+0B6h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		mov	edx, dword_5C59E
		imul	edx, eax
		mov	[bp+var_A], edx
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	ax, [si+0B8h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		mov	edx, dword_5C59E
		imul	edx, eax
		mov	[bp+var_14], edx
		mov	eax, [bp+var_14]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_4]
		add	[si+0AEh], eax
		mov	eax, [bp+var_E]
		add	[si+0B2h], eax
		cmp	dword ptr [si+0AEh], 0
		jge	short loc_24EC8
		mov	ax, 1
		jmp	short loc_24ECA

loc_24EC8:
		xor	ax, ax

loc_24ECA:
		or	al, al
		jz	short loc_24ED9
		add	dword ptr [si+0AEh], 16800h
		jmp	short loc_24EF8

loc_24ED9:
		cmp	dword ptr [si+0AEh], 16800h
		jl	short loc_24EE9
		mov	ax, 1
		jmp	short loc_24EEB

loc_24EE9:
		xor	ax, ax

loc_24EEB:
		or	al, al
		jz	short loc_24EF8
		sub	dword ptr [si+0AEh], 16800h

loc_24EF8:
		cmp	dword ptr [si+0B2h], 0B400h
		jle	short loc_24F08
		mov	ax, 1
		jmp	short loc_24F0A

loc_24F08:
		xor	ax, ax

loc_24F0A:
		or	al, al
		jz	short loc_24F19
		sub	dword ptr [si+0B2h], 16800h
		jmp	short loc_24F38

loc_24F19:
		cmp	dword ptr [si+0B2h], 0FFFF4C00h
		jg	short loc_24F29
		mov	ax, 1
		jmp	short loc_24F2B

loc_24F29:
		xor	ax, ax

loc_24F2B:
		or	al, al
		jz	short loc_24F38
		add	dword ptr [si+0B2h], 16800h

loc_24F38:
		test	byte ptr [si+91h], 1
		jz	short loc_24F87
		cmp	dword ptr [si+0B2h], 0
		jle	short loc_24F4C
		mov	ax, 1
		jmp	short loc_24F4E

loc_24F4C:
		xor	ax, ax

loc_24F4E:
		or	al, al
		jz	short loc_24F87
		cmp	dword ptr [si+0B2h], 5A00h
		jge	short loc_24F62
		mov	ax, 1
		jmp	short loc_24F64

loc_24F62:
		xor	ax, ax

loc_24F64:
		or	al, al
		jz	short loc_24F76
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		jmp	short loc_24F82

loc_24F76:
		mov	[bp+var_1C], 0B400h
		mov	eax, [bp+var_1C]

loc_24F82:
		mov	[si+0B2h], eax

loc_24F87:
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_BuildFromAngle_3B551
		pop	cx
		mov	ax, si
		add	ax, 0AEh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Vector_RotateHeading2D_39E76
		add	sp, 4
		mov	ax, si
		add	ax, 0AEh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	Vector_RotateHeading2D_39E76
		add	sp, 4
		mov	ax, si
		add	ax, 0AEh
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		push	ax
		call	Vector_RotateHeading2D_39E76
		add	sp, 4
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_3BE3F
		pop	cx
		mov	ax, si
		add	ax, 0B2h
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Missile_ComputeDirectionVector2D_39CF0
		add	sp, 4
		mov	ax, si
		add	ax, 0B2h
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	Missile_ComputeDirectionVector2D_39CF0
		add	sp, 4
		mov	ax, si
		add	ax, 0B2h
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		push	ax
		call	Missile_ComputeDirectionVector2D_39CF0
		add	sp, 4
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_3BE3F
		pop	cx
		mov	cx, [si+72h]
		add	cx, 12h
		mov	ax, di
		add	ax, 2Ch
		mov	[bp+var_1E], ax
		add	si, 0A6h
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	eax, [bx+4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bx+8]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	bx, cx
		mov	eax, [bx]
		sub	eax, [bp+var_42]
		mov	[bp+var_4E], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_3E]
		mov	[bp+var_4A], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_3A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_5A]
		mov	[di+14h], eax
		mov	eax, [bp+var_56]
		mov	[di+18h], eax
		mov	eax, [bp+var_52]
		mov	[di+1Ch], eax
		call	sub_38694
		call	sub_38A00
		pop	di
		pop	si
		leave
		retf
sub_24E58		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2514E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	0
		cmp	byte ptr [si+11Ah], 3
		jnz	short loc_2517E
		push	0
		mov	al, [si+11Ah]
		push	ax
		push	large [si+116h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_25186

loc_2517E:
		mov	dx, [si+118h]
		mov	ax, [si+116h]

loc_25186:
		push	dx
		push	ax
		push	large 0A5006Fh
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	word_5DD44
		mov	ax, si
		add	ax, 0BCh
		push	ax
		mov	ax, si
		add	ax, 7Eh
		push	ax
		push	large 0AC00ACh
		push	1
		call	sub_1391A
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_2514E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_251C4		proc far

var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= word ptr -6Ah
var_69		= dword ptr -69h
var_65		= dword ptr -65h
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
		sub	sp, 82h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	bx, 0Bh
		jbe	short loc_251DB
		jmp	loc_2575E

loc_251DB:
		shl	bx, 1
		jmp	cs:off_2585B[bx]	; switch jump

loc_251E2:
		cmp	word ptr [si+94h], 0
		jnz	short loc_251EC
		jmp	loc_2575E

loc_251EC:
		push	word ptr [si+72h]
		push	649Bh
		call	WorldObjects_RemoveAndDelete_3683C
		add	sp, 4
		inc	word ptr [si+92h]
		mov	ax, [si+92h]
		cmp	ax, [si+94h]
		jl	short loc_2520E
		mov	word ptr [si+92h], 0

loc_2520E:
		push	si
		push	cs
		call	near ptr sub_2424B
		pop	cx
		mov	ax, si
		add	ax, 74h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	1
		push	1
		push	[bp+var_2]
		push	ax
		push	6482h
		call	sub_37E34
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_76], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_72], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_6E], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_76]
		mov	[bx+12h], eax
		mov	eax, [bp+var_72]
		mov	[bx+16h], eax
		mov	eax, [bp+var_6E]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Eh], eax
		mov	[bp+var_14], 180h
		mov	eax, [si+9Eh]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Eh], eax
		mov	eax, [si+9Eh]
		shl	eax, 4
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[si+0A2h], eax
		push	bx
		push	649Bh
		call	List_AppendIfNonNull_363E4
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_242F8
		pop	cx
		mov	ax, [si+0AAh]
		mov	[si+0ACh], ax
		mov	[bp+var_1E], ax
		mov	di, si
		add	di, 9Ah
		movsx	eax, [bp+var_1E]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	[si+0A6h], eax
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		xor	eax, eax
		mov	[bp+var_69], eax
		mov	[bp+var_65], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_69], eax
		mov	byte ptr [bp+var_6A], 1
		push	1
		cmp	byte ptr [si+124h], 3
		jnz	short loc_2534D
		push	0
		mov	al, [si+124h]
		push	ax
		push	large [si+120h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_25355

loc_2534D:
		mov	dx, [si+122h]
		mov	ax, [si+120h]

loc_25355:
		push	dx
		push	ax
		push	large 0A20055h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_25369:
		lea	ax, [bp+var_6A]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 5
		jb	short loc_25369
		mov	eax, dword_5E7D3
		mov	[bp+var_69], eax
		mov	byte ptr [bp+var_6A], 1
		push	2
		cmp	byte ptr [si+124h], 3
		jnz	short loc_253AB
		push	0
		mov	al, [si+124h]
		push	ax
		push	large [si+120h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_253B3

loc_253AB:
		mov	dx, [si+122h]
		mov	ax, [si+120h]

loc_253B3:
		push	dx
		push	ax
		push	large 0A20055h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_253C7:
		lea	ax, [bp+var_6A]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 5
		jb	short loc_253C7
		mov	eax, dword_5E7D3
		mov	[bp+var_69], eax
		mov	byte ptr [bp+var_6A], 1
		push	1
		cmp	byte ptr [si+124h], 3
		jnz	short loc_25409
		push	0
		mov	al, [si+124h]
		push	ax
		push	large [si+120h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_25411

loc_25409:
		mov	dx, [si+122h]
		mov	ax, [si+120h]

loc_25411:
		push	dx
		push	ax
		push	large 0A20055h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_25425:
		lea	ax, [bp+var_6A]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 5
		jb	short loc_25425

loc_25439:
		push	si
		push	cs
		call	near ptr sub_2514E
		pop	cx
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		jmp	loc_2575E

loc_25449:
		cmp	word ptr [si+94h], 0
		jnz	short loc_25453
		jmp	loc_2575E

loc_25453:
		push	word ptr [si+72h]
		push	649Bh
		call	WorldObjects_RemoveAndDelete_3683C
		add	sp, 4
		dec	word ptr [si+92h]
		cmp	word ptr [si+92h], 0
		jge	short loc_25475
		mov	ax, [si+94h]
		dec	ax
		mov	[si+92h], ax

loc_25475:
		push	si
		push	cs
		call	near ptr sub_2424B
		pop	cx
		mov	ax, si
		add	ax, 74h
		mov	[bp+var_28], ds
		mov	[bp+var_2A], ax
		push	1
		push	1
		push	[bp+var_28]
		push	ax
		push	6482h
		call	sub_37E34
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		mov	[bp+var_82], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_7E], eax
		mov	[bp+var_36], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_7A], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_82]
		mov	[bx+12h], eax
		mov	eax, [bp+var_7E]
		mov	[bx+16h], eax
		mov	eax, [bp+var_7A]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Eh], eax
		mov	[bp+var_3A], 180h
		mov	eax, [si+9Eh]
		mov	edx, [bp+var_3A]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Eh], eax
		mov	eax, [si+9Eh]
		shl	eax, 4
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	[si+0A2h], eax
		push	bx
		push	649Bh
		call	List_AppendIfNonNull_363E4
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_242F8
		pop	cx
		mov	ax, [si+0AAh]
		mov	[si+0ACh], ax
		mov	[bp+var_44], ax
		mov	di, si
		add	di, 9Ah
		movsx	eax, [bp+var_44]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_48], edx
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	[si+0A6h], eax
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		xor	eax, eax
		mov	[bp+var_69], eax
		mov	[bp+var_65], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_69], eax
		mov	byte ptr [bp+var_6A], 1
		push	3
		cmp	byte ptr [si+124h], 3
		jnz	short loc_255B6
		push	0
		mov	al, [si+124h]
		push	ax
		push	large [si+120h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_255BE

loc_255B6:
		mov	dx, [si+122h]
		mov	ax, [si+120h]

loc_255BE:
		push	dx
		push	ax
		push	large 0A20055h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_255D2:
		lea	ax, [bp+var_6A]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 5
		jb	short loc_255D2
		mov	eax, dword_5E7D3
		mov	[bp+var_69], eax
		mov	byte ptr [bp+var_6A], 1
		push	4
		cmp	byte ptr [si+124h], 3
		jnz	short loc_25614
		push	0
		mov	al, [si+124h]
		push	ax
		push	large [si+120h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_2561C

loc_25614:
		mov	dx, [si+122h]
		mov	ax, [si+120h]

loc_2561C:
		push	dx
		push	ax
		push	large 0A20055h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_25630:
		lea	ax, [bp+var_6A]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 5
		jb	short loc_25630
		mov	eax, dword_5E7D3
		mov	[bp+var_69], eax
		mov	byte ptr [bp+var_6A], 1
		push	3
		cmp	byte ptr [si+124h], 3
		jnz	short loc_25672
		push	0
		mov	al, [si+124h]
		push	ax
		push	large [si+120h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_2567A

loc_25672:
		mov	dx, [si+122h]
		mov	ax, [si+120h]

loc_2567A:
		push	dx
		push	ax
		push	large 0A20055h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_2568E:
		lea	ax, [bp+var_6A]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 5
		jb	short loc_2568E
		jmp	loc_25439

loc_256A5:
		cmp	word ptr [si+0B8h], 0
		jz	short loc_256AE
		jmp	short loc_256DD

loc_256AE:
		sub	dword ptr [si+0B2h], 0A00h
		jmp	loc_2575E

loc_256BA:
		mov	al, [si+91h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jnz	short loc_256CD
		jmp	loc_2575E

loc_256CD:
		mov	word ptr [si+0B8h], 0FFC4h
		jmp	loc_2575E

loc_256D6:
		cmp	word ptr [si+0B8h], 0
		jz	short loc_256E5

loc_256DD:
		mov	word ptr [si+0B8h], 0
		jmp	short loc_2575E

loc_256E5:
		add	dword ptr [si+0B2h], 0A00h
		jmp	short loc_2575E

loc_256F0:
		mov	al, [si+91h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jz	short loc_2575E
		mov	word ptr [si+0B8h], 3Ch
		jmp	short loc_2575E

loc_25708:
		cmp	word ptr [si+0B6h], 0
		jz	short loc_25711
		jmp	short loc_2572B

loc_25711:
		sub	dword ptr [si+0AEh], 0A00h
		jmp	short loc_2575E

loc_2571C:
		mov	word ptr [si+0B6h], 0FFC4h
		jmp	short loc_2575E

loc_25724:
		cmp	word ptr [si+0B6h], 0
		jz	short loc_25733

loc_2572B:
		mov	word ptr [si+0B6h], 0
		jmp	short loc_2575E

loc_25733:
		add	dword ptr [si+0AEh], 0A00h
		jmp	short loc_2575E

loc_2573E:
		mov	word ptr [si+0B6h], 3Ch
		jmp	short loc_2575E

loc_25746:
		cmp	word ptr [si+0AAh], 64h
		jge	short loc_2575E
		inc	word ptr [si+0AAh]
		jmp	short loc_2575E

loc_25753:
		cmp	word ptr [si+0AAh], 0
		jle	short loc_2575E
		dec	word ptr [si+0AAh]

loc_2575E:
		mov	ax, [si+0AAh]
		cmp	ax, [si+0ACh]
		jnz	short loc_2576B
		jmp	loc_257FB

loc_2576B:
		mov	[bp+var_4E], ax
		mov	di, si
		add	di, 9Ah
		movsx	eax, [bp+var_4E]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_52], edx
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	[si+0A6h], eax
		mov	eax, [si+0A6h]
		cmp	eax, [si+0A2h]
		jle	short loc_257A2
		mov	ax, 1
		jmp	short loc_257A4

loc_257A2:
		xor	ax, ax

loc_257A4:
		or	al, al
		jnz	short loc_257BF
		mov	eax, [si+0A6h]
		cmp	eax, [si+9Eh]
		jge	short loc_257B9
		mov	ax, 1
		jmp	short loc_257BB

loc_257B9:
		xor	ax, ax

loc_257BB:
		or	al, al
		jz	short loc_257F3

loc_257BF:
		mov	ax, [si+0ACh]
		mov	[si+0AAh], ax
		mov	ax, [si+0AAh]
		mov	[bp+var_58], ax
		mov	di, si
		add	di, 9Ah
		movsx	eax, [bp+var_58]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_5C], edx
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	[si+0A6h], eax
		jmp	short loc_257FB

loc_257F3:
		mov	ax, [si+0AAh]
		mov	[si+0ACh], ax

loc_257FB:
		push	word_5FF52
		push	5822h
		call	sub_595C
		add	sp, 4
		push	0
		cmp	byte_600BE, 3
		jnz	short loc_2582B
		push	0
		mov	al, byte_600BE
		push	ax
		push	large dword_600BA
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_25833

loc_2582B:
		mov	edx, dword_600BC
		mov	ax, word ptr dword_600BA

loc_25833:
		push	dx
		push	ax
		push	large 0
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_24E58
		pop	cx
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_251C4		endp

; START OF FUNCTION CHUNK FOR sub_251C4
off_2585B	dw offset loc_251E2
		dw offset loc_25449
		dw offset loc_256A5
		dw offset loc_256BA
		dw offset loc_256D6
		dw offset loc_256F0
		dw offset loc_25708
		dw offset loc_2571C
		dw offset loc_25724
		dw offset loc_2573E
		dw offset loc_25746
		dw offset loc_25753
; END OF FUNCTION CHUNK FOR sub_251C4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25873		proc far

var_186		= word ptr -186h
var_182		= word ptr -182h
var_180		= word ptr -180h
var_178		= word ptr -178h
var_120		= word ptr -120h
var_11E		= word ptr -11Eh
var_11C		= dword ptr -11Ch
var_118		= word ptr -118h
var_116		= word ptr -116h
var_5C		= byte ptr -5Ch
var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 186h
		push	si
		mov	si, [bp+arg_0]
		mov	byte_603DE, 0
		mov	byte_5FF54, 0
		mov	byte_5FF55, 0
		push	6
		push	6040h
		call	sub_13AF4
		add	sp, 4
		push	6040h
		call	sub_13BB6
		pop	cx
		push	ds
		push	offset aIFF
		push	ds
		push	offset aObjworld
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		call	sub_591A0
		pop	cx
		push	649Bh
		call	sub_362C6
		pop	cx
		call	sub_591AA
		push	large 3A013Fh
		push	large 8E0000h
		lea	ax, [bp+var_186]
		push	ax
		push	cs
		call	near ptr sub_23D51
		add	sp, 0Ah
		mov	[bp+var_118], 0
		mov	[bp+var_116], 1
		lea	ax, [bp+var_186]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		push	large 27E0000h
		call	sub_55F6F
		add	sp, 4
		push	large 0C7008Eh
		call	sub_55F9E
		add	sp, 4
		mov	word_5B4DF, 0
		mov	word_5B4E1, 8Eh
		mov	word_5B4E3, 13Fh
		mov	word_5B4E5, 0C7h
		push	large 0AA013Fh
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		push	large 0AA013Fh
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		mov	ax, word_5F553
		mov	[bp+var_2], ax
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		lea	ax, [bp+var_186]
		push	ax
		mov	bx, [bp+var_178]
		call	dword ptr [bx+18h]
		pop	cx
		lea	ax, [bp+var_186]
		push	ax
		push	cs
		call	near ptr sub_2514E
		pop	cx
		push	[bp+var_2]
		push	5822h
		call	sub_595C
		add	sp, 4
		mov	word_5F557, 1
		mov	ax, 0C00h
		int	21h
		mov	ax, word_5F553
		mov	word_5FF52, ax
		jmp	loc_25ACD

loc_259A1:
		cmp	byte_60597, 1
		jnz	short loc_259AB
		jmp	loc_25AE6

loc_259AB:
		cmp	byte_5FDDE, 1
		jnz	short loc_259C2
		test	byte_5FDE1, 30h
		jz	short loc_259BE
		mov	ax, 1
		jmp	short loc_259C0

loc_259BE:
		xor	ax, ax

loc_259C0:
		jmp	short loc_259D7

loc_259C2:
		cmp	byte_605B3, 1
		jz	short loc_259D0
		cmp	byte_605EB, 1
		jnz	short loc_259D5

loc_259D0:
		mov	ax, 1
		jmp	short loc_259D7

loc_259D5:
		xor	ax, ax

loc_259D7:
		mov	byte ptr [bp+var_2+1], al
		cmp	byte ptr [bp+var_2+1], 0
		jz	short loc_25A2F
		cmp	byte_605C8, 1
		jnz	short loc_25A2F
		mov	al, byte_603B1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_603B1, al
		cmp	word_5A542, 200h
		jnz	short loc_25A04
		mov	word_5A542, 0
		jmp	short loc_25A0A

loc_25A04:
		mov	word_5A542, 200h

loc_25A0A:
		mov	ax, word_5A542
		mov	[bp+var_4], ax
		cmp	word_5FD4F, 0
		jz	short loc_25A2F
		push	0
		push	ax
		push	word_5FD51
		mov	bx, word_5FD4F
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_25A2F

loc_25A2F:
		push	large 0C8h
		lea	ax, [bp+var_186]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_25A7A
		cmp	word ptr [bp+var_11C], 0
		jz	short loc_25A7A
		push	large [bp+var_11C]
		mov	ax, [bp+var_11E]
		sub	ax, [bp+var_180]
		push	ax
		mov	ax, [bp+var_120]
		sub	ax, [bp+var_182]
		push	ax
		lea	ax, [bp+var_186]
		push	ax
		mov	bx, [bp+var_178]
		call	dword ptr [bx+28h]
		add	sp, 0Ah
		jmp	short loc_25ADA

loc_25A7A:
		push	word_5FF52
		push	5822h
		call	sub_595C
		add	sp, 4
		push	0
		cmp	byte_600BE, 3
		jnz	short loc_25AAA
		push	0
		mov	al, byte_600BE
		push	ax
		push	large dword_600BA
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_25AB2

loc_25AAA:
		mov	edx, dword_600BC
		mov	ax, word ptr dword_600BA

loc_25AB2:
		push	dx
		push	ax
		push	large 0
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		lea	ax, [bp+var_186]
		push	ax
		push	cs
		call	near ptr sub_24E58
		pop	cx

loc_25ACD:
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4

loc_25ADA:
		mov	al, [bp+var_5C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25AE6
		jmp	loc_259A1

loc_25AE6:
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	byte ptr [bp+var_A], 0
		mov	byte ptr [bp+var_A+1], 0
		mov	[bp+var_8], 0
		push	[bp+var_6]
		mov	al, byte ptr [bp+var_4]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_6]
		mov	al, byte ptr [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_6]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_186]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		push	large 27E0000h
		call	sub_55F6F
		add	sp, 4
		push	large 0C70000h
		call	sub_55F9E
		add	sp, 4
		mov	word_5B4DF, 0
		mov	word_5B4E1, 0
		mov	word_5B4E3, 13Fh
		mov	word_5B4E5, 0C7h
		push	large 63013Fh
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		push	large 63013Fh
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		push	3E8h
		push	6040h
		call	sub_13C38
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		push	2
		lea	ax, [bp+var_186]
		push	ax
		push	cs
		call	near ptr sub_23EE6
		add	sp, 4
		pop	si
		leave
		retf
sub_25873		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25BD6		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_5DD44
		mov	word_5C072, ax
		pop	bp
		retf
sub_25BD6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_CFE95 (sub_CFE95 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_25BE1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_25C40
		cmp	byte ptr [si+23h], 0
		jz	short loc_25C16
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_25C16
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_25C16

loc_25C16:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_25C40
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_25C40

loc_25C40:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_25BE1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25C44		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_25CA3
		cmp	byte ptr [si+23h], 0
		jz	short loc_25C79
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_25C79
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_25C79

loc_25C79:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_25CA3
		push	si
		call	sub_33B
sub_25C44		endp
seg052		ends
