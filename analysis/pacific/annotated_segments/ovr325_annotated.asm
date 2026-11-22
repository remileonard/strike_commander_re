ovr325		segment	para public 'OVERLAY' use16
		assume cs:ovr325
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1EC0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 59h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_74269
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_747A0
		add	sp, 6
		push	0
		push	large 44504853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B1EFF
		jmp	loc_B1FD5

loc_B1EFF:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+5Dh], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+5Fh], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+63h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+67h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Bh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Fh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+73h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+77h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Bh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Fh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+83h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+61h], ax

loc_B1FD5:
		pop	si
		pop	bp
		retf
sub_B1EC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1FD8		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	121h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B2055
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	word ptr [si], 2658h
		mov	word ptr [si+5Ch], 0
		push	si
		call	Widget_SetFlagBit0_4352E
		pop	cx
		mov	dword ptr [si+6Ah], 0
		mov	word ptr [si], 2845h
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	sub_736DA
		add	sp, 4
		mov	word ptr [si+11Ch], 0
		mov	word ptr [si+11Eh], 0
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperP_B2204
		add	sp, 6
		mov	ax, si
		jmp	short loc_B2057

loc_B2055:
		mov	ax, si

loc_B2057:
		mov	si, ax
		or	si, si
		jz	short loc_B20B2
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+49h], 0
		jz	short loc_B208B
		push	si
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+52h], ax

loc_B208B:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+59h], 0
		jz	short loc_B20B2
		push	si
		push	large es:[bx+59h]
		call	sub_7425F
		add	sp, 6
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si+6Ah], eax

loc_B20B2:
		mov	ax, si
		pop	si
		leave
		retf
sub_B1FD8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B20B7		proc far

var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	si, [bp+arg_4]
		push	8
		push	ds
		push	offset aTERRAIN
		push	large [di+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_B20E0
		mov	ax, 1
		jmp	short loc_B20E2

loc_B20E0:
		xor	ax, ax

loc_B20E2:
		or	al, al
		jnz	short loc_B213F
		mov	[bp+var_2], di
		push	[bp+var_2]
		mov	ax, si
		add	ax, 11Eh
		push	ax
		call	SetReference16
		add	sp, 4
		mov	al, [bp+arg_8]
		push	ax
		push	di
		push	large [si+6Ah]
		call	sub_3A6E6
		add	sp, 8
		push	si
		mov	bx, [si]
		call	dword ptr [bx+94h]
		pop	cx
		or	al, al
		jz	short loc_B213F
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+23h]
		sar	ax, 1
		call	Math_RandomScale_56C2F
		mov	dx, ax
		or	dx, dx
		jz	short loc_B213B
		push	ax
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	sub_370D5
		add	sp, 8

loc_B213B:
		mov	al, 1
		jmp	short loc_B2141

loc_B213F:
		mov	al, 0

loc_B2141:
		pop	di
		pop	si
		leave
		retf
sub_B20B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2145		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_4]
		mov	si, dx
		cmp	byte ptr [si+116h], 0
		jnz	short loc_B215C
		cmp	byte ptr [si+117h], 0
		jz	short loc_B2168

loc_B215C:
		cmp	byte ptr [si+118h], 0
		jz	short loc_B2168
		mov	byte ptr [si+118h], 1

loc_B2168:
		push	[bp+arg_6]
		push	dx
		push	large [bp+arg_0]
		call	sub_372E4
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_B2145		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B217B		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	Widget_SetFlagBit0_4352E
		pop	cx
		mov	dword ptr [si+6Ah], 0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+106h], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+112h], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[si+10Eh], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[si+10Ah], eax
		mov	byte ptr [si+116h], 0
		mov	byte ptr [si+117h], 0
		mov	byte ptr [si+118h], 0
		mov	byte ptr [si+11Ah], 0
		mov	byte ptr [si+119h], 0
		push	0
		mov	ax, si
		add	ax, 11Eh
		push	ax
		call	SetReference16
		add	sp, 4
		pop	si
		leave
		retf
sub_B217B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_SubHelperP_A0488 (sub_A0488 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_4338E,
; PlayerComponent_InitPulseTimer_A0455, sub_3D566.
; ==============================================================================================
PlayerComponent_SubHelperP_B2204		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	sub_4353C
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_B217B
		pop	cx
		push	si
		call	SmokeTrail_EnableIfModelHasSmok_3BD75
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperP_B2204		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2228		proc far

var_58		= dword ptr -58h
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
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		xor	eax, eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		jmp	short loc_B2284

loc_B224C:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_B2284
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 0Bh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	di, [bp+var_8]
		mov	eax, es:[di]
		mov	[bp+var_28], eax
		mov	eax, es:[di+4]
		mov	[bp+var_24], eax
		mov	eax, es:[di+8]
		mov	[bp+var_20], eax

loc_B2284:
		cmp	[bp+var_4], 0
		jnz	short loc_B22AF
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		xor	ax, ax
		xor	dx, dx
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		jmp	short loc_B22AF

loc_B22AF:
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jnz	short loc_B22DF
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		jmp	short loc_B231F

loc_B22DF:
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_B231F:
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jz	short loc_B2349
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	al, 1
		jmp	short loc_B2353

loc_B2349:
		mov	[bp+var_4], 0
		mov	al, 0

loc_B2353:
		or	al, al
		jz	short loc_B235A
		jmp	loc_B224C

loc_B235A:
		mov	[bp+var_4], 0
		jmp	short loc_B237A

loc_B2364:
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+6], 0Eh
		jnz	short loc_B237A
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_20], eax
		jmp	loc_B2450

loc_B237A:
		cmp	[bp+var_4], 0
		jnz	short loc_B23A5
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		xor	ax, ax
		xor	dx, dx
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		jmp	short loc_B23A5

loc_B23A5:
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jnz	short loc_B23D5
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		jmp	short loc_B2415

loc_B23D5:
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_B2415:
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jz	short loc_B243F
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	al, 1
		jmp	short loc_B2449

loc_B243F:
		mov	[bp+var_4], 0
		mov	al, 0

loc_B2449:
		or	al, al
		jz	short loc_B2450
		jmp	loc_B2364

loc_B2450:
		cmp	[bp+var_4], 0
		jnz	short loc_B245A
		jmp	loc_B25EE

loc_B245A:
		mov	ax, si
		add	ax, 2Dh
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_28], eax
		mov	eax, [di+4]
		add	[bp+var_24], eax
		mov	eax, [di+8]
		add	[bp+var_20], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+1Bh]
		or	ax, es:[bx+1Dh]
		jnz	short loc_B2498
		jmp	loc_B2537

loc_B2498:
		mov	ax, es:[bx+1Dh]
		mov	dx, es:[bx+1Bh]
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		push	1
		push	1
		push	ax
		push	dx
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jz	short loc_B2537
		mov	eax, [bp+var_28]
		mov	[di+12h], eax
		mov	eax, [bp+var_24]
		mov	[di+16h], eax
		mov	eax, [bp+var_20]
		mov	[di+1Ah], eax
		push	large 640000h
		sub	sp, 4
		les	bx, [si+0Eh]
		les	bx, es:[bx+1Bh]
		mov	ax, es:[bx+8]
		mov	[bp+var_1A], ax
		movsx	eax, [bp+var_1A]
		shl	eax, 8
		mov	[bp+var_58], eax
		push	di
		call	sub_4BD5F
		add	sp, 0Ah
		mov	[bp+var_1C], si
		push	[bp+var_1C]
		mov	ax, di
		add	ax, 5Bh
		push	ax
		call	SetReference16
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	byte ptr [di+5Dh], 0
		push	di
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_B2537:
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_40], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_3C], eax
		mov	[bp+var_14], 6400h
		mov	eax, [bp+var_14]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		add	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_24]
		add	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_20]
		add	eax, [bp+var_38]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_2C], eax
		push	1
		push	1
		push	ds
		push	offset aSmokegen
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	di, ax
		mov	eax, [bp+var_28]
		mov	[di+12h], eax
		mov	eax, [bp+var_24]
		mov	[di+16h], eax
		mov	eax, [bp+var_20]
		mov	[di+1Ah], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		push	67ADh
		push	di
		push	si
		call	sub_74149
		add	sp, 6

loc_B25EE:
		pop	di
		pop	si
		leave
		retf
sub_B2228		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B25F2		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_B2656
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1E1Ch
		mov	eax, es:[bx+59h]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	large [bp+arg_0]
		call	sub_42DE1
		add	sp, 6
		test	si, 1
		jz	short loc_B2656
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_B2656:
		pop	si
		leave
		retf
sub_B25F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2659		proc far

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
		or	si, si
		jnz	short loc_B266E
		jmp	loc_B271F

loc_B266E:
		mov	word ptr [si], 2845h
		mov	ax, si
		add	ax, 11Eh
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 11Ch
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 6Eh
		mov	dx, ds
		or	ax, dx
		jz	short loc_B26F2
		mov	word ptr [si+6Eh], 5BEh
		push	dx
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_RemoveByPos
		add	sp, 4
		cmp	byte ptr [si+75h], 0
		jz	short loc_B26DA
		mov	ax, [si+70h]
		or	ax, [si+72h]
		jz	short loc_B26DA
		push	0
		mov	al, [si+74h]
		push	ax
		mov	ax, [si+72h]
		mov	dx, [si+70h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_B26DA

loc_B26DA:
		mov	word ptr [si+72h], 0
		mov	word ptr [si+70h], 0
		mov	byte ptr [si+75h], 0
		mov	dword ptr [si+76h], 0
		jmp	short loc_B26F2

loc_B26F2:
		push	0
		push	2
		mov	ax, si
		add	ax, 6Ah
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	si
		call	sub_43559
		add	sp, 4
		test	di, 1
		jz	short loc_B271F
		push	si
		call	sub_3B2
		pop	cx

loc_B271F:
		pop	di
		pop	si
		leave
		retf
sub_B2659		endp
ovr325		ends
