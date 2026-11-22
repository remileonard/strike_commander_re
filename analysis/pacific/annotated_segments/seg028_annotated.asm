seg028		segment	para public 'CODE' use16
		assume cs:seg028
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 26h, 0C6h, 87h, 98h, 0, 0

loc_11ED6:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11ED8		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_11ED8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11EDD		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+4], 0FFFFh
		jnz	short loc_11EF9
		call	Cursor_SlotAllocate
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax

loc_11EF9:
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	1
		push	0
		push	2
		push	large 25h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_11F4F
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3C8h
		push	dx
		push	bx
		call	WorldObjectA_ResetPositionVector_9EE7
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 440h
		push	[bp+var_2]
		push	bx
		call	sub_1180E
		add	sp, 4
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_11F55

loc_11F4F:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_11F55:
		les	bx, [bp+arg_0]
		mov	es:[bx+9], dx
		mov	es:[bx+7], ax
		mov	word ptr es:[bx+0Bh], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	byte ptr es:[bx+6], 2
		leave
		retf
sub_11EDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11F7F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_11FD9
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 59Eh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Cursor_SlotFree
		add	sp, 4
		push	0
		push	large [bp+arg_0]
		call	SubObject_NotifyEvent
		add	sp, 6
		test	si, 1
		jz	short loc_11FD9
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_11FD9:
		pop	si
		leave
		retf
sub_11F7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11FDC		proc far

var_C0		= dword ptr -0C0h
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= word ptr -88h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= dword ptr -6Ah
var_66		= byte ptr -66h
var_64		= word ptr -64h
var_3C		= byte ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_30		= dword ptr -30h
var_2E		= dword ptr -2Eh
var_2C		= dword ptr -2Ch
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_10		= dword ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B8h
		push	si
		push	di
		mov	[bp+var_1], 0
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+7]
		call	sub_116E0
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_12013
		jmp	loc_13689

loc_12013:
		push	large [bp+arg_0]
		call	Input_JoyTimestampValid
		add	sp, 4
		sub	ax, 2
		mov	bx, ax
		cmp	bx, 30h
		jbe	short loc_1202C
		jmp	loc_12C64

loc_1202C:
		shl	bx, 1
		jmp	cs:off_1368D[bx]	; switch jump

loc_12033:
		cmp	byte_7CAC2, 1
		jnz	short loc_1204A
		test	byte_7CAC5, 0C0h
		jz	short loc_12046
		mov	ax, 1
		jmp	short loc_12048

loc_12046:
		xor	ax, ax

loc_12048:
		jmp	short loc_1205F

loc_1204A:
		cmp	byte_7D348, 1
		jz	short loc_12058
		cmp	byte_7D369, 1
		jnz	short loc_1205D

loc_12058:
		mov	ax, 1
		jmp	short loc_1205F

loc_1205D:
		xor	ax, ax

loc_1205F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_12068
		jmp	loc_12C64

loc_12068:
		mov	ax, word_77696
		add	ax, 86h
		push	ax
		call	sub_73720
		pop	cx
		jmp	loc_12C64
		jmp	loc_12C64

loc_1207B:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0
		jmp	loc_12C64

loc_1208A:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 1
		jmp	loc_12C64

loc_12099:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 2
		jmp	loc_12C64

loc_120A8:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 3
		jmp	loc_12C64

loc_120B7:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 4
		jmp	loc_12C64

loc_120C6:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 5
		jmp	loc_12C64

loc_120D5:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 6
		jmp	loc_12C64

loc_120E4:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 7
		jmp	loc_12C64

loc_120F3:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 8
		jmp	loc_12C64

loc_12102:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 9
		jmp	loc_12C64

loc_12111:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		jmp	loc_12C64

loc_12120:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Eh], 0Ah
		jl	short loc_12131
		jmp	loc_12C64

loc_12131:
		inc	byte ptr es:[bx+1Eh]
		jmp	loc_12C64
		jmp	loc_12C64

loc_1213B:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Eh], 0
		jg	short loc_1214C
		jmp	loc_12C64

loc_1214C:
		dec	byte ptr es:[bx+1Eh]
		jmp	loc_12C64
		jmp	loc_12C64

loc_12156:
		cmp	byte_7CAC2, 1
		jnz	short loc_1216D
		test	byte_7CAC5, 0C0h
		jz	short loc_12169
		mov	ax, 1
		jmp	short loc_1216B

loc_12169:
		xor	ax, ax

loc_1216B:
		jmp	short loc_12182

loc_1216D:
		cmp	byte_7D348, 1
		jz	short loc_1217B
		cmp	byte_7D369, 1
		jnz	short loc_12180

loc_1217B:
		mov	ax, 1
		jmp	short loc_12182

loc_12180:
		xor	ax, ax

loc_12182:
		or	al, al
		jz	short loc_121A1
		xor	byte_7CB0B, 1
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		push	large [bx+5Fh]
		call	sub_3E140
		add	sp, 4
		jmp	loc_12C64

loc_121A1:
		cmp	byte_7CAC2, 1
		jnz	short loc_121B8
		test	byte_7CAC5, 30h
		jz	short loc_121B4
		mov	ax, 1
		jmp	short loc_121B6

loc_121B4:
		xor	ax, ax

loc_121B6:
		jmp	short loc_121CD

loc_121B8:
		cmp	byte_7D32D, 1
		jz	short loc_121C6
		cmp	byte_7D365, 1
		jnz	short loc_121CB

loc_121C6:
		mov	ax, 1
		jmp	short loc_121CD

loc_121CB:
		xor	ax, ax

loc_121CD:
		or	al, al
		jz	short loc_121E0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 10h
		jmp	loc_12C64

loc_121E0:
		cmp	byte_7CAC2, 1
		jnz	short loc_121F7
		test	byte_7CAC5, 0Ch
		jz	short loc_121F3
		mov	ax, 1
		jmp	short loc_121F5

loc_121F3:
		xor	ax, ax

loc_121F5:
		jmp	short loc_1220C

loc_121F7:
		cmp	byte_7D33A, 1
		jz	short loc_12205
		cmp	byte_7D346, 1
		jnz	short loc_1220A

loc_12205:
		mov	ax, 1
		jmp	short loc_1220C

loc_1220A:
		xor	ax, ax

loc_1220C:
		or	al, al
		jz	short loc_1221F
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 20h
		jmp	loc_12C64

loc_1221F:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 4
		jmp	loc_12C64
		jmp	loc_12C64

loc_12231:
		cmp	byte_7CAC2, 1
		jnz	short loc_12248
		test	byte_7CAC5, 0C0h
		jz	short loc_12244
		mov	ax, 1
		jmp	short loc_12246

loc_12244:
		xor	ax, ax

loc_12246:
		jmp	short loc_1225D

loc_12248:
		cmp	byte_7D348, 1
		jz	short loc_12256
		cmp	byte_7D369, 1
		jnz	short loc_1225B

loc_12256:
		mov	ax, 1
		jmp	short loc_1225D

loc_1225B:
		xor	ax, ax

loc_1225D:
		or	al, al
		jz	short loc_1226F
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 1
		jmp	short loc_1227B

loc_1226F:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0FEh

loc_1227B:
		cmp	byte_7CAC2, 1
		jnz	short loc_12292
		test	byte_7CAC5, 0Ch
		jz	short loc_1228E
		mov	ax, 1
		jmp	short loc_12290

loc_1228E:
		xor	ax, ax

loc_12290:
		jmp	short loc_122A7

loc_12292:
		cmp	byte_7D33A, 1
		jz	short loc_122A0
		cmp	byte_7D346, 1
		jnz	short loc_122A5

loc_122A0:
		mov	ax, 1
		jmp	short loc_122A7

loc_122A5:
		xor	ax, ax

loc_122A7:
		or	al, al
		jz	short loc_122BA
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 2
		jmp	loc_12C64

loc_122BA:
		cmp	byte_7CAC2, 1
		jnz	short loc_122D1
		test	byte_7CAC5, 30h
		jz	short loc_122CD
		mov	ax, 1
		jmp	short loc_122CF

loc_122CD:
		xor	ax, ax

loc_122CF:
		jmp	short loc_122E6

loc_122D1:
		cmp	byte_7D32D, 1
		jz	short loc_122DF
		cmp	byte_7D365, 1
		jnz	short loc_122E4

loc_122DF:
		mov	ax, 1
		jmp	short loc_122E6

loc_122E4:
		xor	ax, ax

loc_122E6:
		or	al, al
		jz	short loc_122F9
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 80h
		jmp	loc_12C64

loc_122F9:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 40h
		jmp	loc_12C64
		jmp	loc_12C64

loc_1230B:
		push	0
		push	large 3E8h
		push	13h
		call	sub_5EB62
		add	sp, 8
		cmp	byte_7CAC2, 1
		jnz	short loc_12334
		test	byte_7CAC5, 0Ch
		jz	short loc_12330
		mov	ax, 1
		jmp	short loc_12332

loc_12330:
		xor	ax, ax

loc_12332:
		jmp	short loc_12349

loc_12334:
		cmp	byte_7D33A, 1
		jz	short loc_12342
		cmp	byte_7D346, 1
		jnz	short loc_12347

loc_12342:
		mov	ax, 1
		jmp	short loc_12349

loc_12347:
		xor	ax, ax

loc_12349:
		or	al, al
		jz	short loc_1235C
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 4
		jmp	loc_12C64

loc_1235C:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 8
		jmp	loc_12C64
		jmp	loc_12C64

loc_1236E:
		cmp	byte_7CAC2, 1
		jnz	short loc_12385
		test	byte_7CAC5, 30h
		jz	short loc_12381
		mov	ax, 1
		jmp	short loc_12383

loc_12381:
		xor	ax, ax

loc_12383:
		jmp	short loc_1239A

loc_12385:
		cmp	byte_7D32D, 1
		jz	short loc_12393
		cmp	byte_7D365, 1
		jnz	short loc_12398

loc_12393:
		mov	ax, 1
		jmp	short loc_1239A

loc_12398:
		xor	ax, ax

loc_1239A:
		or	al, al
		jnz	short loc_123A1
		jmp	loc_12C64

loc_123A1:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Dh], 1
		sub	sp, 4
		mov	[bp+var_C0], 200h
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 4
		and	ax, 1
		or	al, al
		jz	short loc_123D6
		mov	dx, seg seg008
		mov	ax, 0BE8h
		jmp	short loc_123DC

loc_123D6:
		mov	dx, seg seg008
		mov	ax, 0BDCh

loc_123DC:
		push	dx
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_12C64
		jmp	loc_12C64

loc_123F0:
		cmp	byte_7CAC2, 1
		jnz	short loc_12407
		test	byte_7CAC5, 0Ch
		jz	short loc_12403
		mov	ax, 1
		jmp	short loc_12405

loc_12403:
		xor	ax, ax

loc_12405:
		jmp	short loc_1241C

loc_12407:
		cmp	byte_7D33A, 1
		jz	short loc_12415
		cmp	byte_7D346, 1
		jnz	short loc_1241A

loc_12415:
		mov	ax, 1
		jmp	short loc_1241C

loc_1241A:
		xor	ax, ax

loc_1241C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_12425
		jmp	loc_12C64

loc_12425:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		cmp	byte ptr es:[bx+43h], 0
		jz	short loc_1243B
		mov	ax, 1
		jmp	short loc_1243D

loc_1243B:
		xor	ax, ax

loc_1243D:
		or	al, al
		jz	short loc_12464
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		mov	al, es:[bx+43h]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		cmp	al, es:[bx+8]
		jb	short loc_12464
		mov	ax, 1
		jmp	short loc_12466

loc_12464:
		xor	ax, ax

loc_12466:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_124AA
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 20h
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_12494
		mov	dx, seg seg008
		mov	ax, 0B51h
		jmp	short loc_1249A

loc_12494:
		mov	dx, seg seg008
		mov	ax, 0B42h

loc_1249A:
		push	dx
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6
		jmp	short loc_124BC

loc_124AA:
		push	seg seg008
		push	offset loc_6051
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6

loc_124BC:
		sub	sp, 4
		mov	[bp+var_C0], 200h
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_12C64
		jmp	loc_12C64

loc_124DF:
		cmp	byte_7CAC2, 1
		jnz	short loc_124F6
		test	byte_7CAC5, 30h
		jz	short loc_124F2
		mov	ax, 1
		jmp	short loc_124F4

loc_124F2:
		xor	ax, ax

loc_124F4:
		jmp	short loc_1250B

loc_124F6:
		cmp	byte_7D32D, 1
		jz	short loc_12504
		cmp	byte_7D365, 1
		jnz	short loc_12509

loc_12504:
		mov	ax, 1
		jmp	short loc_1250B

loc_12509:
		xor	ax, ax

loc_1250B:
		or	al, al
		jz	short loc_12573
		mov	byte_7769E, 1
		push	892h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_12543
		mov	bx, word_7CADA
		les	bx, [bx+63h]
		cmp	byte ptr es:[bx+3Bh], 0
		jz	short loc_12534
		mov	ax, 1
		jmp	short loc_12536

loc_12534:
		xor	ax, ax

loc_12536:
		or	al, al
		jz	short loc_12543
		push	87Eh
		call	GameVar_SetFlag_5646D
		pop	cx

loc_12543:
		push	word_7CADA
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_12558
		jmp	loc_12C64

loc_12558:
		mov	bx, word_7CADA
		mov	bx, [bx+52h]
		cmp	byte ptr [bx+20h], 0
		jnz	short loc_12568
		jmp	loc_12C64

loc_12568:
		mov	byte_7769E, 0
		jmp	loc_12C64
		jmp	loc_12C64

loc_12573:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_125DC
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 40h
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		or	al, al
		jz	short loc_125A8
		mov	dx, seg seg008
		mov	ax, 0B7Dh
		jmp	short loc_125AE

loc_125A8:
		mov	dx, seg seg008
		mov	ax, 0B73h

loc_125AE:
		push	dx
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_C0], 200h
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_12C64

loc_125DC:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		cmp	dword ptr [bx+48h], 0
		jnz	short loc_125ED
		jmp	loc_12C64

loc_125ED:
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		cmp	byte ptr es:[bx+44h], 0
		jz	short loc_12603
		mov	ax, 1
		jmp	short loc_12605

loc_12603:
		xor	ax, ax

loc_12605:
		or	al, al
		jz	short loc_1262C
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		mov	al, es:[bx+44h]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		cmp	al, es:[bx+9]
		jb	short loc_1262C
		mov	ax, 1
		jmp	short loc_1262E

loc_1262C:
		xor	ax, ax

loc_1262E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12670
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 40h
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		or	al, al
		jz	short loc_1265A
		mov	dx, seg seg008
		mov	ax, 0B99h
		jmp	short loc_12660

loc_1265A:
		mov	dx, seg seg008
		mov	ax, 0B88h

loc_12660:
		push	dx
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6
		jmp	short loc_12682

loc_12670:
		push	seg seg008
		push	offset loc_609C
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6

loc_12682:
		sub	sp, 4
		mov	[bp+var_C0], 200h
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_12C64
		jmp	loc_12C64

loc_126A5:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_126BA
		jmp	loc_12C64

loc_126BA:
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		cmp	byte ptr es:[bx+42h], 0
		jz	short loc_126D0
		mov	ax, 1
		jmp	short loc_126D2

loc_126D0:
		xor	ax, ax

loc_126D2:
		or	al, al
		jz	short loc_126F9
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		mov	al, es:[bx+42h]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+63h]
		cmp	al, es:[bx+7]
		jb	short loc_126F9
		mov	ax, 1
		jmp	short loc_126FB

loc_126F9:
		xor	ax, ax

loc_126FB:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12740
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 80h
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_1272A
		mov	dx, seg seg008
		mov	ax, 0BC9h
		jmp	short loc_12730

loc_1272A:
		mov	dx, seg seg008
		mov	ax, 0BBFh

loc_12730:
		push	dx
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6
		jmp	short loc_12752

loc_12740:
		push	seg seg008
		push	offset loc_60B9
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6

loc_12752:
		sub	sp, 4
		mov	[bp+var_C0], 200h
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_12C64
		jmp	loc_12C64

loc_12775:
		cmp	word_7977C, 3
		ja	short loc_1277F
		jmp	loc_12C64

loc_1277F:
		mov	bx, word_79B8C
		mov	al, [bx+7Fh]
		mov	ah, 0
		mov	word ptr [bp+var_E+2], ax
		mov	al, [bx+80h]
		mov	ah, 0
		mov	word ptr [bp+var_E], ax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_127A9
		jmp	loc_12AD0

loc_127A9:
		cmp	word ptr [bp+var_E+2], 0A2h
		jz	short loc_127BA
		cmp	word ptr [bp+var_E+2], 0C1h
		jz	short loc_127BA
		jmp	loc_12AD0

loc_127BA:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_127C8
		jmp	loc_12AD0

loc_127C8:
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 7Fh
		mov	[bp+var_70], 0
		xor	ax, ax
		mov	[bp+var_6C], ax
		mov	[bp+var_6E], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_6A], eax
		mov	[bp+var_66], 0
		cmp	word ptr [bp+var_E+2], 0A2h
		jnz	short loc_12848
		mov	bx, word_79B8C
		mov	al, [bx+80h]
		mov	ah, 0
		mov	si, ax
		push	ax
		mov	ax, word_79B8C
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		lea	ax, word ptr [bp+var_7C]
		mov	[bp+var_6C], ax
		mov	bx, word_79B8C
		mov	si, [bx+83h]
		push	si
		mov	ax, word_79B8C
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_88]
		push	ax
		call	Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		lea	ax, [bp+var_88]
		mov	[bp+var_6E], ax
		jmp	loc_12A4A

loc_12848:
		cmp	word ptr [bp+var_E+2], 0C1h
		jz	short loc_12852
		jmp	loc_12A4A

loc_12852:
		mov	bx, word_79B8C
		mov	al, [bx+80h]
		mov	ah, 0
		mov	word ptr [bp+var_1C], ax
		mov	ax, [bx+83h]
		mov	word ptr [bp+var_20+2], ax
		push	word ptr [bp+var_1C]
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_20], dx
		mov	word ptr [bp+var_24+2], ax
		les	bx, word ptr [bp+var_24+2]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	al, al
		jz	short loc_12892
		jmp	loc_12C64

loc_12892:
		cmp	word ptr es:[bx+56h], 0
		jnz	short loc_1289C
		jmp	loc_12C64

loc_1289C:
		les	bx, word ptr [bp+var_24+2]
		mov	si, es:[bx+56h]
		push	large 0FFFFh
		push	0
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_24], ax
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_7C]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_8C], eax
		push	large 0
		push	0FFFFh
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_7C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_98], eax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_B8], eax
		mov	[bp+var_2C], 0FFF44800h
		mov	eax, [bp+var_2C]
		mov	[bp+var_B4], eax
		mov	[bp+var_30], 3E800h
		mov	eax, [bp+var_30]
		mov	[bp+var_B0], eax
		push	large 1FFF15h
		push	0
		lea	ax, word ptr [bp+var_AC]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	ax, si
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	dword_7C870, eax
		mov	eax, [di+4]
		mov	dword_7C874, eax
		mov	eax, [di+8]
		mov	dword_7C878, eax
		mov	eax, dword_7C870
		mov	dword_7C864, eax
		mov	eax, dword_7C874
		mov	dword_7C868, eax
		mov	eax, dword_7C878
		mov	dword_7C86C, eax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, word ptr [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_B8]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_AC]
		add	dword_7C864, eax
		mov	eax, [bp+var_A8]
		add	dword_7C868, eax
		mov	eax, [bp+var_A4]
		add	dword_7C86C, eax
		mov	eax, [bp+var_AC]
		add	dword_7C870, eax
		mov	eax, [bp+var_A8]
		add	dword_7C874, eax
		mov	eax, [bp+var_A4]
		add	dword_7C878, eax
		mov	eax, [bp+var_B8]
		add	dword_7C870, eax
		mov	eax, [bp+var_B4]
		add	dword_7C874, eax
		mov	eax, [bp+var_B0]
		add	dword_7C878, eax
		mov	[bp+var_6C], 6140h
		mov	[bp+var_6E], 6134h

loc_12A4A:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+11h], 0
		jnz	short loc_12AB4
		mov	eax, [bp+arg_0]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	large 98h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		or	ax, dx
		jz	short loc_12AA3
		push	large [bp+var_16]
		push	dx
		push	word ptr [bp+var_1A]
		call	sub_10323
		add	sp, 8
		les	bx, word ptr [bp+var_1A]
		mov	word ptr es:[bx], 54Eh
		mov	byte ptr es:[bx+0Ch], 12h
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		jmp	short loc_12AA9

loc_12AA3:
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]

loc_12AA9:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+13h], dx
		mov	es:[bx+11h], ax

loc_12AB4:
		lea	ax, [bp+var_70]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+11h]
		les	bx, es:[bx+11h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_12C64

loc_12AD0:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12B17
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 7Fh
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_12B0F
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+92h], 0FBh

loc_12B0F:
		mov	byte_7769F, 1
		jmp	loc_12C64

loc_12B17:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_12B25
		jmp	loc_12C64

loc_12B25:
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 7Fh
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12B51
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+92h], 4

loc_12B51:
		mov	[bp+var_70], 0
		xor	ax, ax
		mov	[bp+var_6C], ax
		mov	[bp+var_6E], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_6A], eax
		mov	[bp+var_66], 0
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_7C], eax
		mov	eax, [si+4]
		mov	[bp+var_78], eax
		mov	eax, [si+8]
		mov	[bp+var_74], eax
		lea	ax, word ptr [bp+var_7C]
		mov	[bp+var_6C], ax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 12h
		mov	[bp+var_6E], ax
		cmp	dword ptr es:[bx+15h], 0
		jnz	short loc_12C16
		mov	eax, [bp+arg_0]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	large 45h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		or	ax, dx
		jz	short loc_12C05
		push	large [bp+var_16]
		push	dx
		push	word ptr [bp+var_1A]
		call	sub_10323
		add	sp, 8
		les	bx, word ptr [bp+var_1A]
		mov	word ptr es:[bx], 53Eh
		mov	byte ptr es:[bx+0Ch], 11h
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		jmp	short loc_12C0B

loc_12C05:
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]

loc_12C0B:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax

loc_12C16:
		lea	ax, [bp+var_70]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+15h]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	short loc_12C64
		jmp	short loc_12C64

loc_12C33:
		mov	byte_7975D, 0
		push	0
		push	0
		call	sub_73263
		add	sp, 4
		mov	word ptr [bp+var_E+2], ax
		push	3
		push	ax
		call	sub_73268
		add	sp, 4
		cmp	word_77696, 0
		jz	short loc_12C64
		mov	bx, word_77696
		mov	byte ptr [bx+1E0h], 1
		jmp	short loc_12C64

loc_12C64:
		cmp	byte_7D349, 1
		jnz	short loc_12C6F
		mov	al, 1
		jmp	short loc_12C71

loc_12C6F:
		mov	al, 0

loc_12C71:
		or	al, al
		jz	short loc_12C86
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		mov	byte_776B0, 1

loc_12C86:
		cmp	byte_7D344, 1
		jnz	short loc_12C91
		mov	al, 1
		jmp	short loc_12C93

loc_12C91:
		mov	al, 0

loc_12C93:
		or	al, al
		jnz	short loc_12CA7
		cmp	byte_7CB0C, 0
		jz	short loc_12CD3
		call	sub_22FD7
		or	ax, ax
		jle	short loc_12CD3

loc_12CA7:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	word ptr es:[bx+23h], 0
		jge	short loc_12CBD
		mov	word ptr es:[bx+23h], 0
		jmp	short loc_12CCF

loc_12CBD:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	word ptr es:[bx+23h], 10h
		jge	short loc_12CCF
		inc	word ptr es:[bx+23h]

loc_12CCF:
		mov	[bp+var_1], 1

loc_12CD3:
		cmp	byte_7D343, 1
		jnz	short loc_12CDE
		mov	al, 1
		jmp	short loc_12CE0

loc_12CDE:
		mov	al, 0

loc_12CE0:
		or	al, al
		jnz	short loc_12CF4
		cmp	byte_7CB0C, 0
		jz	short loc_12D20
		call	sub_22FD7
		or	ax, ax
		jge	short loc_12D20

loc_12CF4:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	word ptr es:[bx+23h], 0
		jle	short loc_12D0A
		mov	word ptr es:[bx+23h], 0
		jmp	short loc_12D1C

loc_12D0A:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	word ptr es:[bx+23h], 0FFF0h
		jle	short loc_12D1C
		dec	word ptr es:[bx+23h]

loc_12D1C:
		mov	[bp+var_1], 1

loc_12D20:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12D36
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0

loc_12D36:
		mov	al, byte_7769C
		mov	ah, 0
		or	ax, ax
		jz	short loc_12D42
		jmp	loc_13689

loc_12D42:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+4], 0FFFFh
		jnz	short loc_12D4F
		jmp	loc_1337B

loc_12D4F:
		cmp	byte_76D12, 0
		jnz	short loc_12D59
		jmp	loc_1337B

loc_12D59:
		mov	al, byte_7769C
		mov	ah, 0
		or	ax, ax
		jz	short loc_12D65
		jmp	loc_1337B

loc_12D65:
		cmp	byte_775F5, 0
		jz	short loc_12D9E
		push	1
		call	sub_52BE
		pop	cx
		mov	si, ax
		mov	ax, word_775F6
		sub	ax, word_775F8
		mov	di, ax
		sub	si, word_775F8
		sub	ax, si
		mov	si, ax
		imul	ax, ax, 0Ah
		cwd
		idiv	di
		mov	word ptr [bp+var_E+2], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, byte ptr [bp+var_E+2]
		mov	es:[bx+1Eh], al

loc_12D9E:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	[bp+var_4], ax
		push	2
		mov	al, byte ptr [bp+var_4]
		push	ax
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_12DBF
		jmp	loc_12E55

loc_12DBF:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	word ptr [bp+var_10], ax
		push	ax
		call	sub_52A1
		pop	cx
		mov	word ptr [bp+var_12], ax
		movsx	eax, word ptr [bp+var_12]
		shl	eax, 8
		mov	[bp+var_E], eax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	word ptr [bp+var_1A+2], ax
		push	ax
		call	sub_5292
		pop	cx
		mov	word ptr [bp+var_1A], ax
		movsx	eax, word ptr [bp+var_1A]
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_E]
		imul	eax, eax, 10h
		mov	[bp+var_E], eax
		mov	ebx, 20h
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, word ptr [bp+var_E+1]
		mov	es:[bx+1Fh], ax
		mov	eax, [bp+var_16]
		imul	eax, eax, 10h
		mov	[bp+var_16], eax
		mov	ebx, 20h
		cdq
		idiv	ebx
		mov	[bp+var_16], eax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, word ptr [bp+var_16+1]
		mov	es:[bx+21h], ax
		jmp	short loc_12E68

loc_12E55:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0
		mov	word ptr es:[bx+21h], 0

loc_12E68:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	[bp+var_6], ax
		push	1
		mov	al, byte ptr [bp+var_6]
		push	ax
		call	sub_5235
		add	sp, 4
		or	al, al
		jz	short loc_12EBB
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	[bp+var_8], ax
		push	2
		mov	al, byte ptr [bp+var_8]
		push	ax
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12EBB
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_12EBB
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		mov	byte_776B0, 1

loc_12EBB:
		cmp	word_7CB03, 4
		jz	short loc_12EC5
		jmp	loc_1323F

loc_12EC5:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	[bp+var_A], ax
		push	2
		mov	al, byte ptr [bp+var_A]
		push	ax
		call	sub_5235
		add	sp, 4
		or	al, al
		jz	short loc_12F32
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jnz	short loc_12F3E
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12F3E
		push	0
		push	large 3E8h
		push	13h
		call	sub_5EB62
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 8
		or	byte ptr es:[bx+1Dh], 8
		jmp	short loc_12F3E
		jmp	short loc_12F3E

loc_12F32:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0F7h

loc_12F3E:
		push	1
		push	1
		call	sub_5235
		add	sp, 4
		or	al, al
		jz	short loc_12F9D
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 4
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12FA9
		mov	byte_7975D, 0
		or	byte ptr es:[bx+1Dh], 10h
		push	0
		push	0
		call	sub_73263
		add	sp, 4
		mov	word ptr [bp+var_E+2], ax
		push	3
		push	ax
		call	sub_73268
		add	sp, 4
		cmp	word_77696, 0
		jz	short loc_12FA9
		mov	bx, word_77696
		mov	byte ptr [bx+1E0h], 1
		jmp	short loc_12FA9
		jmp	short loc_12FA9

loc_12F9D:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0EFh

loc_12FA9:
		push	2
		push	1
		call	sub_5235
		add	sp, 4
		or	al, al
		jnz	short loc_12FBC
		jmp	loc_13233

loc_12FBC:
		cmp	word_7977C, 3
		ja	short loc_12FC6
		jmp	loc_1323F

loc_12FC6:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_12FE0
		jmp	loc_1323F

loc_12FE0:
		or	byte ptr es:[bx+1Dh], 20h
		mov	bx, word_79B8C
		mov	al, [bx+7Fh]
		mov	ah, 0
		mov	word ptr [bp+var_E+2], ax
		mov	al, [bx+80h]
		mov	ah, 0
		mov	word ptr [bp+var_E], ax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1300F
		jmp	loc_1311A

loc_1300F:
		cmp	word ptr [bp+var_E+2], 0A2h
		jz	short loc_13019
		jmp	loc_1311A

loc_13019:
		mov	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_13027
		jmp	loc_1311A

loc_13027:
		mov	[bp+var_70], 0
		xor	ax, ax
		mov	[bp+var_6C], ax
		mov	[bp+var_6E], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_6A], eax
		mov	[bp+var_66], 0
		mov	bx, word_79B8C
		mov	al, [bx+80h]
		mov	ah, 0
		mov	si, ax
		push	ax
		mov	ax, word_79B8C
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		lea	ax, word ptr [bp+var_7C]
		mov	[bp+var_6C], ax
		mov	bx, word_79B8C
		mov	si, [bx+83h]
		push	si
		mov	ax, word_79B8C
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_88]
		push	ax
		call	Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		lea	ax, [bp+var_88]
		mov	[bp+var_6E], ax
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+11h], 0
		jnz	short loc_130FE
		mov	eax, [bp+arg_0]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	large 98h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		or	ax, dx
		jz	short loc_130ED
		push	large [bp+var_16]
		push	dx
		push	word ptr [bp+var_1A]
		call	sub_10323
		add	sp, 8
		les	bx, word ptr [bp+var_1A]
		mov	word ptr es:[bx], 54Eh
		mov	byte ptr es:[bx+0Ch], 12h
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		jmp	short loc_130F3

loc_130ED:
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]

loc_130F3:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+13h], dx
		mov	es:[bx+11h], ax

loc_130FE:
		lea	ax, [bp+var_70]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+11h]
		les	bx, es:[bx+11h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_1323F

loc_1311A:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13146
		cmp	byte_7752D, 0
		jz	short loc_1313B
		mov	byte_7769E, 1
		jmp	loc_1323F

loc_1313B:
		mov	byte_7769F, 1
		jmp	loc_1323F
		jmp	loc_1323F

loc_13146:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_13154
		jmp	loc_1323F

loc_13154:
		mov	[bp+var_70], 0
		xor	ax, ax
		mov	[bp+var_6C], ax
		mov	[bp+var_6E], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_6A], eax
		mov	[bp+var_66], 0
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_7C], eax
		mov	eax, [si+4]
		mov	[bp+var_78], eax
		mov	eax, [si+8]
		mov	[bp+var_74], eax
		lea	ax, word ptr [bp+var_7C]
		mov	[bp+var_6C], ax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 12h
		mov	[bp+var_6E], ax
		cmp	dword ptr es:[bx+15h], 0
		jnz	short loc_13216
		mov	eax, [bp+arg_0]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	large 45h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		or	ax, dx
		jz	short loc_13205
		push	large [bp+var_16]
		push	dx
		push	word ptr [bp+var_1A]
		call	sub_10323
		add	sp, 8
		les	bx, word ptr [bp+var_1A]
		mov	word ptr es:[bx], 53Eh
		mov	byte ptr es:[bx+0Ch], 11h
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		jmp	short loc_1320B

loc_13205:
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]

loc_1320B:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax

loc_13216:
		lea	ax, [bp+var_70]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+15h]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	short loc_1323F
		jmp	short loc_1323F

loc_13233:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0DFh

loc_1323F:
		cmp	word_7CB03, 3
		jz	short loc_13249
		jmp	loc_13689

loc_13249:
		push	1
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		mov	si, ax
		push	2
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		add	si, ax
		push	1
		push	1
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	si, ax
		push	2
		push	1
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	si, ax
		mov	di, si
		cmp	di, 2
		jnz	short loc_132CE
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jnz	short loc_132DA
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_132DA
		or	byte ptr es:[bx+1Dh], 8
		or	byte ptr es:[bx+1Bh], 4
		jmp	short loc_132DA
		jmp	short loc_132DA

loc_132CE:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0F7h

loc_132DA:
		cmp	di, 4
		jnz	short loc_132FF
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 4
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1330B
		or	byte ptr es:[bx+1Bh], 40h
		jmp	short loc_1330B
		jmp	short loc_1330B

loc_132FF:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0EFh

loc_1330B:
		cmp	di, 8
		jnz	short loc_13369
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jz	short loc_13326
		jmp	loc_13689

loc_13326:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_13340
		jmp	loc_13689

loc_13340:
		or	byte ptr es:[bx+1Dh], 8
		push	0
		push	large 3E8h
		push	13h
		call	sub_5EB62
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 8
		jmp	loc_13689
		jmp	loc_13689

loc_13369:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0DFh
		jmp	loc_13689
		jmp	loc_13689

loc_1337B:
		cmp	byte_76D13, 0
		jnz	short loc_13385
		jmp	loc_134A3

loc_13385:
		mov	byte ptr [bp+var_12], 0
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_12], 0
		jnz	short loc_133BF
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_133BB
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_133BF

loc_133BB:
		jmp	short loc_133BF
		jmp	short loc_133BF

loc_133BF:
		call	sub_6F5D8
		sub	ax, word_775E7
		mov	bx, 3
		cwd
		idiv	bx
		shl	ax, 4
		mov	word ptr [bp+var_1A+2], ax
		movsx	eax, word ptr [bp+var_1A+2]
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	[bp+var_20], 2000h
		mov	eax, [bp+var_1C]
		mov	edx, eax
		mov	ecx, [bp+var_20]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_28+1]
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], ax
		call	sub_6F5C0
		sub	ax, word_775E5
		mov	bx, 0Ah
		cwd
		idiv	bx
		shl	ax, 4
		mov	word ptr [bp+var_2A], ax
		movsx	eax, word ptr [bp+var_2A]
		shl	eax, 8
		mov	[bp+var_2E], eax
		mov	[bp+var_32], 2000h
		mov	eax, [bp+var_2E]
		mov	edx, eax
		mov	ecx, [bp+var_32]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	ax, word ptr [bp+var_3A+1]
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+21h], ax
		mov	al, byte ptr [bp+var_E+2]
		mov	[bp+var_3C], al
		test	[bp+var_3C], 1
		jz	short loc_13491
		or	byte ptr es:[bx+1Bh], 2
		mov	byte_776B0, 1
		or	byte ptr es:[bx+1Dh], 40h
		jmp	loc_13689

loc_13491:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0BFh
		jmp	loc_13689
		jmp	loc_13689

loc_134A3:
		cmp	byte_76D14, 0
		jnz	short loc_134AD
		jmp	loc_13689

loc_134AD:
		mov	byte ptr [bp+var_E+3], 0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, es:[bx+21h]
		mov	word ptr [bp+var_12], ax
		movsx	eax, word ptr [bp+var_12]
		shl	eax, 8
		mov	[bp+var_10], eax
		cmp	byte_7D35D, 1
		jnz	short loc_134D7
		mov	al, 1
		jmp	short loc_134D9

loc_134D7:
		mov	al, 0

loc_134D9:
		or	al, al
		jz	short loc_13522
		cmp	[bp+var_10], 0
		jge	short loc_134E9
		mov	ax, 1
		jmp	short loc_134EB

loc_134E9:
		xor	ax, ax

loc_134EB:
		or	al, al
		jz	short loc_13501
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_10], eax
		jmp	short loc_1351E

loc_13501:
		cmp	[bp+var_10], 1000h
		jge	short loc_13510
		mov	ax, 1
		jmp	short loc_13512

loc_13510:
		xor	ax, ax

loc_13512:
		or	al, al
		jz	short loc_1351E
		add	[bp+var_10], 100h

loc_1351E:
		mov	byte ptr [bp+var_E+3], 1

loc_13522:
		cmp	byte_7D35B, 1
		jnz	short loc_1352D
		mov	al, 1
		jmp	short loc_1352F

loc_1352D:
		mov	al, 0

loc_1352F:
		or	al, al
		jz	short loc_13578
		cmp	[bp+var_10], 0
		jle	short loc_1353F
		mov	ax, 1
		jmp	short loc_13541

loc_1353F:
		xor	ax, ax

loc_13541:
		or	al, al
		jz	short loc_13557
		mov	[bp+var_1A], 0
		mov	eax, [bp+var_1A]
		mov	[bp+var_10], eax
		jmp	short loc_13574

loc_13557:
		cmp	[bp+var_10], 0FFFFF000h
		jle	short loc_13566
		mov	ax, 1
		jmp	short loc_13568

loc_13566:
		xor	ax, ax

loc_13568:
		or	al, al
		jz	short loc_13574
		sub	[bp+var_10], 100h

loc_13574:
		mov	byte ptr [bp+var_E+3], 1

loc_13578:
		cmp	byte ptr [bp+var_E+3], 0
		jz	short loc_1358E
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, word ptr [bp+var_10+1]
		mov	es:[bx+21h], ax
		jmp	short loc_1359B

loc_1358E:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+21h], 0

loc_1359B:
		mov	byte ptr [bp+var_1C+1], 0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, es:[bx+1Fh]
		mov	word ptr [bp+var_24+2], ax
		movsx	eax, word ptr [bp+var_24+2]
		shl	eax, 8
		mov	[bp+var_20], eax
		cmp	byte_7D360, 1
		jnz	short loc_135C5
		mov	al, 1
		jmp	short loc_135C7

loc_135C5:
		mov	al, 0

loc_135C7:
		or	al, al
		jz	short loc_13610
		cmp	[bp+var_20], 0
		jge	short loc_135D7
		mov	ax, 1
		jmp	short loc_135D9

loc_135D7:
		xor	ax, ax

loc_135D9:
		or	al, al
		jz	short loc_135EF
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	[bp+var_20], eax
		jmp	short loc_1360C

loc_135EF:
		cmp	[bp+var_20], 1000h
		jge	short loc_135FE
		mov	ax, 1
		jmp	short loc_13600

loc_135FE:
		xor	ax, ax

loc_13600:
		or	al, al
		jz	short loc_1360C
		add	[bp+var_20], 100h

loc_1360C:
		mov	byte ptr [bp+var_1C+1], 1

loc_13610:
		cmp	byte_7D358, 1
		jnz	short loc_1361B
		mov	al, 1
		jmp	short loc_1361D

loc_1361B:
		mov	al, 0

loc_1361D:
		or	al, al
		jz	short loc_13666
		cmp	[bp+var_20], 0
		jle	short loc_1362D
		mov	ax, 1
		jmp	short loc_1362F

loc_1362D:
		xor	ax, ax

loc_1362F:
		or	al, al
		jz	short loc_13645
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_2A]
		mov	[bp+var_20], eax
		jmp	short loc_13662

loc_13645:
		cmp	[bp+var_20], 0FFFFF000h
		jle	short loc_13654
		mov	ax, 1
		jmp	short loc_13656

loc_13654:
		xor	ax, ax

loc_13656:
		or	al, al
		jz	short loc_13662
		sub	[bp+var_20], 100h

loc_13662:
		mov	byte ptr [bp+var_1C+1], 1

loc_13666:
		cmp	byte ptr [bp+var_1C+1], 0
		jz	short loc_1367C
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, word ptr [bp+var_20+1]
		mov	es:[bx+1Fh], ax
		jmp	short loc_13689

loc_1367C:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0

loc_13689:
		pop	di
		pop	si
		leave
		retf
sub_11FDC		endp

; START OF FUNCTION CHUNK FOR sub_11FDC
off_1368D	dw offset loc_1208A
		dw offset loc_12099
		dw offset loc_120A8
		dw offset loc_120B7
		dw offset loc_120C6
		dw offset loc_120D5
		dw offset loc_120E4
		dw offset loc_120F3
		dw offset loc_12102
		dw offset loc_12111
		dw offset loc_1213B
		dw offset loc_12120
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12156
		dw offset loc_12C64
		dw offset loc_12033
		dw offset loc_12231
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12775
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_123F0
		dw offset loc_1230B
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_126A5
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_1207B
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_12C64
		dw offset loc_124DF
		dw offset loc_12C33
		dw offset loc_1236E
; END OF FUNCTION CHUNK FOR sub_11FDC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_136EF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+27h], 0
		jz	short loc_13704
		mov	ax, 1
		jmp	short loc_13706

loc_13704:
		xor	ax, ax

loc_13706:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1374A
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 1Ah
		push	[bp+arg_2]
		push	ax
		call	sub_736E4
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		push	word ptr [bx+52h]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], ax

loc_1374A:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_1377E
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_11FDC
		add	sp, 4
		cmp	byte_7752D, 0
		jz	short loc_13793
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Eh], 0
		jz	short loc_13793
		mov	byte ptr es:[bx+1Eh], 2
		jmp	short loc_13793
		jmp	short loc_13793

loc_1377E:
		les	bx, [bp+arg_0]
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
sub_136EF		endp
seg028		ends
