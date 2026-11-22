ovr316		segment	para public 'OVERLAY' use16
		assume cs:ovr316
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0710		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	si, [bp+arg_4]
		xor	eax, eax
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	[bp+var_2], al
		push	si
		push	large [bp+arg_0]
		call	sub_3B14C
		add	sp, 6
		push	0
		push	large 41544144h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B074D
		jmp	loc_B07E1

loc_B074D:
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+49h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Dh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+51h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+55h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+57h], eax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+5Bh], al
		push	si
		push	large 0
		call	sub_744E4
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+5Eh], dx
		mov	es:[bx+5Ch], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+60h], eax
		jmp	short loc_B07EA

loc_B07E1:
		push	0C01Dh
		call	sub_1DDFE
		pop	cx

loc_B07EA:
		push	0
		push	large 43524147h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B0837
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+64h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+66h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+68h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Ah], ax

loc_B0837:
		push	0
		push	large 4C524258h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B08A1
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+70h], ax
		push	seg seg024
		push	offset sub_FBB4
		push	5
		movsx	eax, word ptr es:[bx+70h]
		push	eax
		push	large 0C0000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+74h], dx
		mov	es:[bx+72h], ax
		push	large [si+72h]
		push	large es:[bx+72h]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		jmp	short loc_B08B3

loc_B08A1:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+70h], 0
		mov	dword ptr es:[bx+72h], 0

loc_B08B3:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+5Eh]
		mov	dx, es:[bx+5Ch]
		add	dx, 4
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_A], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_6], eax
		mov	[bp+var_2], 0
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	65D0h
		call	Debris_FindModelByID
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Eh], dx
		mov	es:[bx+6Ch], ax
		cmp	dword ptr es:[bx+6Ch], 0
		jnz	short loc_B091F
		push	0
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	65D0h
		call	sub_742E8
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Eh], dx
		mov	es:[bx+6Ch], ax

loc_B091F:
		pop	si
		leave
		retf
sub_B0710		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0922		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	74h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B0960
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si], 25B2h
		mov	word ptr [si+52h], 0
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_B09C1
		add	sp, 6
		mov	ax, si
		jmp	short loc_B0962

loc_B0960:
		mov	ax, si

loc_B0962:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
sub_B0922		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0976		proc far

var_14		= dword ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	ax, si
		add	ax, 52h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[si+58h], eax
		or	byte ptr [si+2], 40h
		push	1
		push	0
		push	2
		push	large 24h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+72h], dx
		mov	[si+70h], ax
		pop	si
		leave
		retf
sub_B0976		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B09C1		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	sub_36985
		add	sp, 6
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	0
		push	si
		call	sub_7434A
		add	sp, 4
		or	byte ptr [si+2], 10h
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+48h]
		push	ax
		push	si
		call	sub_7434A
		add	sp, 4
		les	bx, word ptr [bp+arg_2]
		mov	eax, es:[bx+49h]
		mov	[si+54h], eax
		push	si
		push	cs
		call	near ptr sub_B0976
		pop	cx
		pop	si
		leave
		retf
sub_B09C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0A21		proc far

var_54		= word ptr -54h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1B		= word ptr -1Bh
var_18		= word ptr -18h
var_16		= word ptr -16h
var_15		= word ptr -15h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		push	di
		lea	ax, [bp+var_54]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+0Ch]
		mov	[bp+var_8], eax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+10h]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+10h]
		mov	[bp+var_10], eax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+14h]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	ax, [bp+var_15]
		mov	[bp+var_12], ax
		cmp	[bp+var_4], 0
		jge	short loc_B0AD3
		mov	ax, 1
		jmp	short loc_B0AD5

loc_B0AD3:
		xor	ax, ax

loc_B0AD5:
		or	al, al
		jz	short loc_B0AE2
		mov	ax, 0B4h
		sub	ax, [bp+var_12]
		mov	[bp+var_12], ax

loc_B0AE2:
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	ax, [bp+var_1B]
		mov	[bp+var_18], ax
		mov	bx, [bp+arg_0]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+68h]
		mov	bx, [bp+arg_0]
		mov	[bx+60h], ax
		mov	bx, [bx+0Eh]
		mov	ax, es:[bx+6Ah]
		mov	bx, [bp+arg_0]
		mov	[bx+62h], ax
		mov	bx, [bx+0Eh]
		mov	ax, es:[bx+64h]
		mov	bx, [bp+arg_0]
		mov	[bx+5Ch], ax
		mov	bx, [bx+0Eh]
		mov	ax, es:[bx+66h]
		mov	bx, [bp+arg_0]
		mov	[bx+5Eh], ax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	bx, [bp+arg_0]
		mov	[bx+64h], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[bx+68h], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bx+6Ch], eax
		lea	ax, [bp+var_54]
		mov	[bp+var_2C], ax
		mov	eax, [bx+70h]
		mov	[bp+var_30], eax
		mov	[bp+var_2A], 24h
		mov	cx, [bp+var_2A]
		shr	cx, 2
		mov	si, [bp+var_2C]
		les	di, word ptr [bp+var_30]
		rep movsd
		pop	di
		pop	si
		leave
		retf
sub_B0A21		endp
ovr316		ends
