ovr186		segment	para public 'OVERLAY' use16
		assume cs:ovr186
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66770		proc far

var_10		= word ptr -10h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0FFh], 1
		mov	byte ptr [si+100h], 0
		mov	byte ptr [si+101h], 0
		mov	byte ptr [si+36Ah], 0
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		push	ds
		push	offset unk_5A778
		mov	cx, 10h
		call	CRT_Fmemcpy
		xor	di, di
		jmp	short loc_667E2

loc_667A4:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+827h]
		mov	ax, di
		imul	ax, ax, 1Ah
		mov	dx, si
		add	dx, ax
		add	dx, 29Ah
		push	dx
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_10]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, di
		imul	bx, bx, 1Ah
		mov	[bx+si+2AEh], ax
		mov	bx, di
		imul	bx, bx, 1Ah
		mov	word ptr [bx+si+2B2h], 0
		inc	di

loc_667E2:
		cmp	di, 8
		jl	short loc_667A4
		mov	word ptr [si+2B2h], 1
		mov	byte ptr [si+10Dh], 0
		mov	word ptr [si+110h], 0FFFFh
		mov	dword ptr [si+112h], 0
		mov	dword ptr [si+116h], 0
		mov	byte ptr [si+10Ch], 0FFh
		mov	byte ptr [si+10Eh], 0FFh
		mov	byte ptr [si+10Fh], 0FFh
		xor	di, di
		jmp	short loc_66825

loc_6681D:
		mov	bx, di
		mov	byte ptr [bx+si+11Ch], 0
		inc	di

loc_66825:
		cmp	di, 0FFh
		jl	short loc_6681D
		xor	di, di
		jmp	short loc_66837

loc_6682F:
		mov	bx, di
		mov	byte ptr [bx+si+21Ch], 0
		inc	di

loc_66837:
		cmp	di, 64h
		jl	short loc_6682F
		xor	di, di
		jmp	short loc_6684B

loc_66840:
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+280h], 0
		inc	di

loc_6684B:
		cmp	di, 9
		jl	short loc_66840
		xor	di, di
		jmp	short loc_66867

loc_66854:
		mov	bx, di
		shl	bx, 1
		mov	byte ptr [bx+si+293h], 0
		mov	bx, di
		shl	bx, 1
		mov	byte ptr [bx+si+292h], 0FFh
		inc	di

loc_66867:
		cmp	di, 4
		jl	short loc_66854
		mov	dword ptr [si+3D8h], 0
		mov	word ptr [si+3D4h], 0
		mov	word ptr [si+0FDh], 0
		pop	di
		pop	si
		leave
		retf
sub_66770		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66885		proc far

var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_66770
		pop	cx
		mov	byte_5FD5E, 0
		mov	ax, [bp+arg_2]
		mov	[si+0F8h], ax
		mov	al, [bp+arg_8]
		mov	[si+10Dh], al
		mov	byte ptr [si+0FBh], 0
		mov	byte ptr [si+0FCh], 0
		push	ds
		push	offset aIFF
		push	ds
		push	offset aGameflow
		push	ds
		push	offset aDataGameflow_3
		mov	ax, si
		add	ax, 57h
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	0AADh
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0AB4h
		mov	ax, si
		add	ax, 3A7h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0ABBh
		mov	ax, si
		add	ax, 3C5h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		xor	di, di
		jmp	loc_66A51

loc_66905:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx], 2Dh
		jz	short loc_66918
		jmp	loc_66A50

loc_66918:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx+1], 2Eh
		jz	short loc_6692C
		jmp	loc_66A50

loc_6692C:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		push	word ptr [bx]
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_2], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		mov	al, [bx+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		sub	ax, 43h
		mov	bx, ax
		cmp	bx, 13h
		jbe	short loc_66963
		jmp	loc_66A47

loc_66963:
		shl	bx, 1
		jmp	cs:off_66A5D[bx]	; switch jump

loc_6696A:
		mov	byte ptr [si+0FBh], 1
		jmp	loc_66A47

loc_66972:
		mov	byte ptr [si+0FBh], 2
		jmp	loc_66A47

loc_6697A:
		mov	byte ptr [si+0FCh], 1
		jmp	loc_66A47

loc_66982:
		mov	byte ptr [si+0FFh], 0
		jmp	loc_66A47

loc_6698A:
		mov	ax, [bp+var_2]
		add	ax, 3
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2Eh
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0
		jnz	short loc_669C3
		push	3500h
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_669C3:
		push	ds
		push	offset unk_5A7E4
		push	ss
		lea	ax, [bp+var_5A]
		push	ax
		push	ds
		push	offset unk_5A7E3
		mov	ax, si
		add	ax, 57h
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		jmp	short loc_66A47

loc_669E0:
		mov	ax, [bp+var_2]
		add	ax, 3
		mov	[bp+var_4], ax
		push	ax
		call	sub_22B1
		pop	cx
		mov	[si+10Dh], al
		jmp	short loc_66A47

loc_669F6:
		push	0
		call	sub_58CB0
		jmp	short loc_66A3F

loc_669FF:
		push	0
		mov	ax, [bp+var_2]
		add	ax, 3
		mov	[bp+var_6], ax
		push	ax
		call	sub_22B1
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Gameflow_PlayMidgame_6741E
		add	sp, 6
		jmp	short loc_66A47

loc_66A1D:
		mov	ax, [bp+var_2]
		add	ax, 3
		mov	[bp+var_8], ax
		push	ax
		call	sub_22B1
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Gameflow_PlayConversation_6719B
		add	sp, 4
		push	0AC5h
		call	sub_9D78

loc_66A3F:
		pop	cx
		jmp	short loc_66A47

loc_66A42:
		mov	byte_5FD5E, 1

loc_66A47:
		push	[bp+var_2]
		call	sub_45058
		pop	cx

loc_66A50:
		inc	di

loc_66A51:
		cmp	di, [bp+arg_4]
		jge	short loc_66A59
		jmp	loc_66905

loc_66A59:
		pop	di
		pop	si
		leave
		retf
sub_66885		endp

; START OF FUNCTION CHUNK FOR sub_66885
off_66A5D	dw offset loc_669F6
		dw offset loc_669FF
		dw offset loc_66A47
		dw offset loc_6698A
		dw offset loc_66A47
		dw offset loc_66A47
		dw offset loc_66A47
		dw offset loc_66A47
		dw offset loc_66A47
		dw offset loc_66982
		dw offset loc_6697A
		dw offset loc_66972
		dw offset loc_66A47
		dw offset loc_66A47
		dw offset loc_6696A
		dw offset loc_66A42
		dw offset loc_669E0
		dw offset loc_66A47
		dw offset loc_66A47
		dw offset loc_66A1D
; END OF FUNCTION CHUNK FOR sub_66885

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66A85		proc far

var_AE		= word ptr -0AEh
var_51		= dword ptr -51h
var_4D		= dword ptr -4Dh
var_49		= dword ptr -49h
var_41		= dword ptr -41h
var_3C		= byte ptr -3Ch
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0AEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_AE], 9B5h
		mov	[bp+var_4D], 100h
		mov	[bp+var_51], 0
		mov	[bp+var_AE], 9CDh
		mov	[bp+var_32], 0
		xor	ax, ax
		mov	[bp+var_34], ax
		movsx	eax, ax
		mov	[bp+var_49], eax
		push	1
		mov	ax, si
		add	ax, 57h
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		mov	bx, [bp+var_AE]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_541A0
		pop	cx
		mov	[bp+var_1], 0
		jmp	loc_66C02

loc_66AF3:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_53C5A
		pop	cx
		or	ax, ax
		jnz	short loc_66B05
		jmp	loc_66BF5

loc_66B05:
		mov	eax, [bp+var_41]
		cmp	eax, dword_5A7EA
		jnz	short loc_66B15
		mov	ax, 1
		jmp	short loc_66B17

loc_66B15:
		xor	ax, ax

loc_66B17:
		or	ax, ax
		jnz	short loc_66B1E
		jmp	loc_66BF5

loc_66B1E:
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_541A0
		pop	cx
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_66B45
		jmp	loc_66BDB

loc_66B45:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_4], ax
		mov	al, [si+10Dh]
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_6]
		jnz	short loc_66BD1
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax
		push	0
		push	large 54434645h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_66BBE
		mov	al, [bp+var_3C]
		mov	[si+6], al
		cmp	byte ptr [si+6], 50h
		jbe	short loc_66B9E
		push	26h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66B9E:
		xor	di, di
		jmp	short loc_66BB3

loc_66BA2:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	bx, di
		mov	[bx+si+7], al
		inc	di

loc_66BB3:
		mov	al, [si+6]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_66BA2
		jmp	short loc_66BCB

loc_66BBE:
		push	1
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66BCB:
		mov	[bp+var_1], 1
		jmp	short loc_66C30

loc_66BD1:
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax
		jmp	short loc_66BE8

loc_66BDB:
		push	2
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66BE8:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		jmp	short loc_66C02

loc_66BF5:
		push	3
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66C02:
		cmp	[bp+var_32], 0
		jnz	short loc_66C15
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_66C29

loc_66C15:
		mov	bx, [bp+var_32]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_49]
		jg	short loc_66C27
		mov	ax, 1
		jmp	short loc_66C29

loc_66C27:
		xor	ax, ax

loc_66C29:
		or	ax, ax
		jnz	short loc_66C30
		jmp	loc_66AF3

loc_66C30:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_66C46
		push	4
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66C46:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		mov	[bp+var_AE], 9CDh
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_66A85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66C75		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		lea	si, word ptr [bp+var_4]
		mov	dl, [si]
		mov	al, [si+3]
		mov	[si], al
		mov	[si+3], dl
		mov	dl, [si+1]
		mov	al, [si+2]
		mov	[si+1], al
		mov	[si+2], dl
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_66C75		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66CAC		proc far

var_C4		= word ptr -0C4h
var_67		= dword ptr -67h
var_63		= dword ptr -63h
var_5F		= dword ptr -5Fh
var_57		= dword ptr -57h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0C4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_A8A2
		pop	cx
		mov	[bp+var_1], 0
		lea	ax, [bp+var_C4]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_C4], 9B5h
		mov	[bp+var_63], 100h
		mov	[bp+var_67], 0
		mov	[bp+var_C4], 9CDh
		mov	[bp+var_48], 0
		xor	ax, ax
		mov	[bp+var_4A], ax
		movsx	eax, ax
		mov	[bp+var_5F], eax
		mov	al, [si+10Dh]
		mov	ah, 0
		cmp	ax, [si+110h]
		jnz	short loc_66D0B
		jmp	loc_66E69

loc_66D0B:
		push	1
		mov	ax, si
		add	ax, 57h
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		mov	bx, [bp+var_C4]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_C4]
		push	ax
		call	sub_541A0

loc_66D2C:
		pop	cx
		jmp	loc_66E39

loc_66D30:
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_53C5A
		pop	cx
		or	ax, ax
		jnz	short loc_66D42
		jmp	loc_66E2C

loc_66D42:
		mov	eax, [bp+var_57]
		cmp	eax, dword_5A7EF
		jnz	short loc_66D52
		mov	ax, 1
		jmp	short loc_66D54

loc_66D52:
		xor	ax, ax

loc_66D54:
		or	ax, ax
		jnz	short loc_66D5B
		jmp	loc_66E2C

loc_66D5B:
		lea	ax, [bp+var_C4]
		push	ax
		call	sub_541A0
		pop	cx
		mov	eax, [bp+var_52]
		mov	[si+116h], eax
		sub	dword ptr [si+116h], 0Eh
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_66D91
		jmp	loc_66E12

loc_66D91:
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	dl, [si+10Dh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_66E08
		mov	[bp+var_1], 1
		mov	eax, [bp+var_4E]
		mov	[bp+var_5F], eax
		push	0
		push	2
		mov	ax, si
		add	ax, 112h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		push	1
		push	0
		push	2
		push	large [si+116h]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+114h], dx
		mov	[si+112h], ax
		push	large [si+116h]
		push	large [si+112h]
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	al, [si+10Dh]
		mov	ah, 0
		mov	[si+110h], ax
		jmp	short loc_66E6D

loc_66E08:
		mov	eax, [bp+var_4E]
		mov	[bp+var_5F], eax
		jmp	short loc_66E1F

loc_66E12:
		push	5
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66E1F:
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		jmp	loc_66D2C

loc_66E2C:
		push	6
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66E39:
		cmp	[bp+var_48], 0
		jnz	short loc_66E4C
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_66E60

loc_66E4C:
		mov	bx, [bp+var_48]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_5F]
		jg	short loc_66E5E
		mov	ax, 1
		jmp	short loc_66E60

loc_66E5E:
		xor	ax, ax

loc_66E60:
		or	ax, ax
		jnz	short loc_66E67
		jmp	loc_66D30

loc_66E67:
		jmp	short loc_66E6D

loc_66E69:
		mov	[bp+var_1], 1

loc_66E6D:
		cmp	[bp+var_1], 0
		jnz	short loc_66E76
		jmp	loc_6715F

loc_66E76:
		mov	[bp+var_2], 0
		mov	[bp+var_A], 0
		les	bx, [si+112h]
		add	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx], 54434645h
		jz	short loc_66E96
		jmp	loc_66F67

loc_66E96:
		add	[bp+var_A], 4
		mov	ax, [si+112h]
		add	ax, word ptr [bp+var_A]
		push	word ptr [si+114h]
		push	ax
		push	cs
		call	near ptr sub_66C75
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6], eax
		test	[bp+var_6], 1
		jz	short loc_66EC4
		inc	[bp+var_6]

loc_66EC4:
		add	[bp+var_A], 4
		mov	eax, [bp+var_6]
		add	[bp+var_A], eax
		jmp	loc_66F67

loc_66ED4:
		les	bx, [si+112h]
		add	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx], 4D524F46h
		jnz	short loc_66F5A
		add	[bp+var_A], 4
		mov	ax, [si+112h]
		add	ax, word ptr [bp+var_A]
		push	word ptr [si+114h]
		push	ax
		push	cs
		call	near ptr sub_66C75
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6], eax
		test	[bp+var_6], 1
		jz	short loc_66F13
		inc	[bp+var_6]

loc_66F13:
		sub	[bp+var_6], 4
		add	[bp+var_A], 4
		les	bx, [si+112h]
		add	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx], 4E454353h
		jnz	short loc_66F56
		mov	al, [si+10Fh]
		mov	ah, 0
		mov	bx, [si+112h]
		add	bx, word ptr [bp+var_A]
		cmp	ax, es:[bx+0Ch]
		jnz	short loc_66F47
		mov	[bp+var_2], 1
		jmp	short loc_66F75

loc_66F47:
		add	[bp+var_A], 4
		mov	eax, [bp+var_6]
		add	[bp+var_A], eax
		jmp	short loc_66F67

loc_66F56:
		push	7
		jmp	short loc_66F5C

loc_66F5A:
		push	0Ah

loc_66F5C:
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66F67:
		mov	eax, [si+116h]
		cmp	eax, [bp+var_A]
		jle	short loc_66F75
		jmp	loc_66ED4

loc_66F75:
		cmp	[bp+var_2], 0
		jnz	short loc_66F7E
		jmp	loc_6715B

loc_66F7E:
		mov	ax, [si+114h]
		mov	dx, [si+112h]
		add	dx, word ptr [bp+var_A]
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	[bp+var_A], 0Eh
		jmp	loc_6714C

loc_66F9A:
		mov	[bp+var_10], 0
		mov	[bp+var_14], 0
		les	bx, [bp+var_E]
		add	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx+8], 54525053h
		jnz	short loc_66FCB
		mov	bx, [bp+var_E]
		add	bx, word ptr [bp+var_A]
		mov	al, es:[bx+14h]
		mov	[bp+var_F], al
		add	[bp+var_A], 16h
		jmp	short loc_66FD8

loc_66FCB:
		push	8
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_66FD8:
		les	bx, [bp+var_E]
		add	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx], 54434645h
		jnz	short loc_6701D
		mov	ax, [bp+var_E]
		add	ax, word ptr [bp+var_A]
		add	ax, 4
		push	[bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_66C75
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		test	[bp+var_18], 1
		jz	short loc_67016
		inc	[bp+var_18]

loc_67016:
		add	[bp+var_18], 8
		jmp	short loc_6702A

loc_6701D:
		push	9
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_6702A:
		les	bx, [bp+var_E]
		add	bx, word ptr [bp+var_18]
		add	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx], 55514552h
		jz	short loc_67040
		jmp	loc_670C1

loc_67040:
		mov	ax, [bp+var_E]
		add	ax, word ptr [bp+var_18]
		add	ax, word ptr [bp+var_A]
		add	ax, 4
		push	[bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_66C75
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_14], eax
		push	word ptr [bp+var_14]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		push	word ptr [bp+var_14]
		mov	ax, [bp+var_E]
		add	ax, word ptr [bp+var_18]
		add	ax, word ptr [bp+var_A]
		add	ax, 8
		push	[bp+var_C]
		push	ax
		push	ds
		push	di
		call	sub_3609
		add	sp, 0Ah
		push	di
		mov	al, byte ptr [bp+var_14]
		push	ax
		push	si
		call	Gameflow_TestRequ_A911
		add	sp, 6
		or	al, al
		jz	short loc_670AA
		mov	al, [bp+var_F]
		push	ax
		push	si
		call	sub_A812
		add	sp, 4
		mov	[bp+var_10], 1

loc_670AA:
		test	[bp+var_14], 1
		jz	short loc_670B8
		inc	[bp+var_14]

loc_670B8:
		push	di
		call	sub_33B
		pop	cx
		jmp	short loc_670D2

loc_670C1:
		mov	al, [bp+var_F]
		push	ax
		push	si
		call	sub_A812
		add	sp, 4
		mov	[bp+var_10], 1

loc_670D2:
		cmp	[bp+var_10], 0
		jz	short loc_67130
		add	[bp+var_A], 8
		sub	[bp+var_18], 8
		mov	al, [bp+var_F]
		push	ax
		push	si
		call	sub_A8DA
		add	sp, 4
		mov	di, ax
		mov	al, byte ptr [bp+var_1C]
		mov	[di+7], al
		push	word ptr [bp+var_1C]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+5], ax
		cmp	[bp+var_1C], 3Ch
		jle	short loc_67117
		push	26h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67117:
		push	word ptr [bp+var_1C]
		mov	ax, [bp+var_E]
		add	ax, word ptr [bp+var_A]
		push	[bp+var_C]
		push	ax
		push	ds
		push	word ptr [di+5]
		call	sub_3609
		add	sp, 0Ah

loc_67130:
		mov	eax, [bp+var_18]
		add	[bp+var_A], eax
		cmp	[bp+var_14], 0
		jz	short loc_6714C
		add	[bp+var_A], 8
		mov	eax, [bp+var_14]
		add	[bp+var_A], eax

loc_6714C:
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_6]
		jge	short loc_67159
		jmp	loc_66F9A

loc_67159:
		jmp	short loc_6716C

loc_6715B:
		push	0Bh
		jmp	short loc_67161

loc_6715F:
		push	0Ch

loc_67161:
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_6716C:
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		mov	[bp+var_C4], 9CDh
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_C4]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_66CAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (partie, n) : prépare la conversation n (sub_14085) et la joue (Conv_PlayScript_14F62) ;
; commande EFCT 0.
; ==============================================================================================
Gameflow_PlayConversation_6719B		proc far

var_8C		= word ptr -8Ch
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= word ptr -0Fh
var_D		= word ptr -0Dh
var_B		= word ptr -0Bh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8Ch
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_5F8E2, dx
		mov	ax, si
		add	ax, 3A7h
		mov	[bp+var_16], ax
		mov	ax, si
		add	ax, 3B6h
		mov	[bp+var_14], ax
		mov	ax, si
		add	ax, 3C5h
		mov	[bp+var_12], ax
		mov	[bp+var_10], 0
		mov	ax, [si+0FDh]
		mov	[bp+var_F], ax
		mov	ax, [si+3D4h]
		mov	[bp+var_D], ax
		mov	ax, [si+2AEh]
		mov	[bp+var_B], ax
		mov	ax, si
		add	ax, 36Ah
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		push	dx
		lea	ax, [bp+var_8C]
		push	ax
		call	sub_14085
		add	sp, 8
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_8C]
		push	ax
		call	Conv_PlayScript_14F62
		pop	cx
		xor	eax, eax
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[bp+var_4], 32h
		mov	eax, dword_5E7D3
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	sub_141F1
		add	sp, 4
		pop	si
		leave
		retf
Gameflow_PlayConversation_6719B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67259		proc far

var_14		= word ptr -14h
var_D		= byte ptr -0Dh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	large 0FFFFFFFFh
		push	large 7
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	[bp+arg_0]
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		mov	[bp+var_D], 0
		lea	ax, [bp+var_14]
		push	ax
		push	34EBh
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_67290
		mov	al, 1
		jmp	short loc_67292

loc_67290:
		mov	al, 0

loc_67292:
		leave
		retf
sub_67259		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67294		proc far

var_14		= word ptr -14h
var_D		= byte ptr -0Dh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_14], 0
		mov	eax, [si+6Dh]
		cmp	eax, dword_5A7F4
		jnz	short loc_672B2
		mov	ax, 1
		jmp	short loc_672B4

loc_672B2:
		xor	ax, ax

loc_672B4:
		or	ax, ax
		jz	short loc_67300
		push	si
		call	sub_541A0
		pop	cx
		push	0
		push	large 52455654h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_672E5
		push	large 7
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah

loc_672E5:
		mov	[bp+var_D], 0
		lea	ax, [bp+var_14]
		push	ax
		push	34F3h
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_67300
		mov	al, 1
		jmp	short loc_67302

loc_67300:
		mov	al, 0

loc_67302:
		pop	si
		leave
		retf
sub_67294		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67305		proc far

var_AC		= word ptr -0ACh
var_6A		= word ptr -6Ah
var_4F		= dword ptr -4Fh
var_4B		= dword ptr -4Bh
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0ACh
		push	si
		mov	si, [bp+arg_0]
		push	ds
		push	offset aSAV
		push	ds
		push	si
		call	CRT_Strlen
		pop	cx
		sub	ax, 4
		mov	dx, si
		add	dx, ax
		push	dx
		call	sub_3715
		add	sp, 8
		or	ax, ax
		jnz	short loc_67389
		mov	[bp+var_2], si
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_6A], 9B5h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 0B2Ch
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_67259
		pop	cx
		mov	[bp+var_3], al
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	al, [bp+var_3]
		jmp	loc_6741B

loc_67389:
		push	ds
		push	offset aTAP
		push	ds
		push	si
		call	CRT_Strlen
		pop	cx
		sub	ax, 4
		mov	dx, si
		add	dx, ax
		push	dx
		call	sub_3715
		add	sp, 8
		or	ax, ax
		jnz	short loc_67419
		mov	[bp+var_2], si
		lea	ax, [bp+var_AC]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_AC], 9B5h
		mov	[bp+var_4B], 100h
		mov	[bp+var_4F], 0
		mov	[bp+var_AC], 9CDh
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_AC]
		push	ax
		mov	bx, [bp+var_AC]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_AC]
		push	ax
		push	cs
		call	near ptr sub_67294
		pop	cx
		mov	[bp+var_3], al
		mov	[bp+var_AC], 9CDh
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_AC]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	al, [bp+var_3]
		jmp	short loc_6741B

loc_67419:
		mov	al, 0

loc_6741B:
		pop	si
		leave
		retf
sub_67305		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (partie, n, registre) : coupe la musique (Music_Stop_3D1D6) puis n = 1 à 14 →
; cinématique MIDGAMnn (14 rejoue MIDGAM03), 15 → générique (sub_6DC70, mycredit) ; autre :
; erreur OPTHAN-O.CPP. Commandes EFCT 2 et 15.
; ==============================================================================================
Gameflow_PlayMidgame_6741E		proc far

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 1
		mov	[bp+var_2], 1
		push	1
		call	Music_Stop_3D1D6
		pop	cx
		mov	al, [bp+arg_2]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 0Eh
		jbe	short loc_6744C
		jmp	loc_67535

loc_6744C:
		shl	bx, 1
		jmp	cs:off_67573[bx]	; switch jump

loc_67453:
		call	sub_595A0
		jmp	loc_67546

loc_6745B:
		call	sub_595D5
		jmp	loc_67546

loc_67463:
		mov	ax, si
		add	ax, 3C5h
		push	ax
		mov	ax, si
		add	ax, 3A7h
		push	ax
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	sub_59600
		jmp	short loc_674D2

loc_6747C:
		push	di
		mov	ax, si
		add	ax, 3C5h
		push	ax
		mov	ax, si
		add	ax, 3A7h
		push	ax
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	sub_59630
		add	sp, 8
		jmp	loc_67546

loc_6749A:
		call	sub_59660
		jmp	loc_67546

loc_674A2:
		mov	ax, si
		add	ax, 3C5h
		push	ax
		mov	ax, si
		add	ax, 3A7h
		push	ax
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	sub_59690
		jmp	short loc_6751E

loc_674BB:
		mov	ax, si
		add	ax, 3C5h
		push	ax
		mov	ax, si
		add	ax, 3A7h
		push	ax
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	sub_596C0

loc_674D2:
		add	sp, 6
		jmp	short loc_67546

loc_674D7:
		push	di
		call	sub_596F0
		pop	cx
		jmp	short loc_67546

loc_674E0:
		call	sub_59720
		jmp	short loc_67546

loc_674E7:
		call	sub_59750
		jmp	short loc_67521

loc_674EE:
		call	sub_59785
		mov	[bp+var_1], 0
		jmp	short loc_67546

loc_674F9:
		call	sub_597B0
		jmp	short loc_67546

loc_67500:
		call	sub_597E0
		jmp	short loc_67546

loc_67507:
		mov	ax, si
		add	ax, 3C5h
		push	ax
		mov	ax, si
		add	ax, 3A7h
		push	ax
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	sub_59810

loc_6751E:
		add	sp, 6

loc_67521:
		push	0
		call	sub_58CB0
		pop	cx
		mov	byte ptr [si+0FCh], 0
		mov	byte ptr [si+0FBh], 2
		jmp	short loc_67546

loc_67535:
		mov	[bp+var_2], 0
		push	15h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67546:
		cmp	[bp+var_2], 0
		jz	short loc_6755B
		mov	dx, word_5CF9F
		or	dx, dx
		jz	short loc_6755B
		push	dx
		call	sub_4160F
		pop	cx

loc_6755B:
		cmp	[bp+var_1], 0
		jz	short loc_6756F
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4

loc_6756F:
		pop	di
		pop	si
		leave
		retf
Gameflow_PlayMidgame_6741E		endp

; START OF FUNCTION CHUNK FOR Gameflow_PlayMidgame_6741E
off_67573	dw offset loc_67453
		dw offset loc_6745B
		dw offset loc_67463
		dw offset loc_6747C
		dw offset loc_6749A
		dw offset loc_674A2
		dw offset loc_674BB
		dw offset loc_674D7
		dw offset loc_674E0
		dw offset loc_674E7
		dw offset loc_674EE
		dw offset loc_674F9
		dw offset loc_67500
		dw offset loc_67507
		dw offset loc_67521
; END OF FUNCTION CHUNK FOR Gameflow_PlayMidgame_6741E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67591		proc far

var_250		= word ptr -250h
var_24E		= word ptr -24Eh
var_24C		= word ptr -24Ch
var_24A		= word ptr -24Ah
var_248		= word ptr -248h
var_246		= word ptr -246h
var_242		= word ptr -242h
var_220		= word ptr -220h
var_1C3		= dword ptr -1C3h
var_1BF		= dword ptr -1BFh
var_1BB		= dword ptr -1BBh
var_1B3		= dword ptr -1B3h
var_1AA		= dword ptr -1AAh
var_1A6		= word ptr -1A6h
var_1A4		= word ptr -1A4h
var_178		= word ptr -178h
var_176		= word ptr -176h
var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16A		= word ptr -16Ah
var_F2		= word ptr -0F2h
var_7A		= word ptr -7Ah
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_27		= word ptr -27h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 250h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	al, byte_603DE
		mov	ah, 0
		or	ax, ax
		jz	short loc_675A9
		jmp	loc_67CC7

loc_675A9:
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		mov	ax, word_5DD44
		mov	[bp+var_6], ax
		mov	[bp+var_178], 0
		mov	[bp+var_176], 0
		push	ax
		lea	ax, [bp+var_178]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_174], 0
		mov	[bp+var_172], 18h
		mov	[bp+var_170], 13Fh
		mov	[bp+var_16E], 97h
		lea	ax, [bp+var_220]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_220], 9B5h
		mov	[bp+var_1BF], 100h
		mov	[bp+var_1C3], 0
		mov	[bp+var_220], 9CDh
		mov	[bp+var_1A4], 0
		xor	ax, ax
		mov	[bp+var_1A6], ax
		movsx	eax, ax
		mov	[bp+var_1BB], eax
		push	ds
		push	offset aIFF
		push	ds
		push	offset aWwiopts
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_220]
		push	ax
		mov	bx, [bp+var_220]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 42545345h
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		mov	[bp+var_7], 0
		jmp	short loc_676F6

loc_676BD:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_1A], al
		cmp	al, [bp+arg_2]
		jnz	short loc_676EB
		mov	[bp+var_7], 1
		jmp	short loc_6770F

loc_676EB:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_676F6:
		push	1
		push	large 544F4853h
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_676BD

loc_6770F:
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67725
		push	64h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67725:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_1], al
		mov	eax, [bp+var_1AA]
		mov	[bp+var_1BB], eax
		lea	ax, [bp+var_178]
		push	ax
		push	0
		push	0Fh
		lea	ax, [bp+var_242]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		mov	[bp+var_A], 0
		push	0
		push	large 53504853h
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_67774
		jmp	loc_6797A

loc_67774:
		jmp	loc_67947

loc_67777:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_54140
		pop	cx
		mov	eax, [bp+var_1B3]
		cmp	eax, dword_5A7F9
		jnz	short loc_67793
		mov	ax, 1
		jmp	short loc_67795

loc_67793:
		xor	ax, ax

loc_67795:
		or	ax, ax
		jnz	short loc_6779C
		jmp	loc_67855

loc_6779C:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	si, ax
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	di, ax
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_4], ax
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_22+2], 2
		mov	byte ptr [bp+var_22+3], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	si
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	[bp+var_4]
		push	di
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	0
		call	Layer_Construct_45F57
		add	sp, 8
		mov	si, ax
		mov	byte ptr [bp+var_22+3], 0
		mov	byte ptr [si+16h], 1
		push	ax
		lea	ax, [bp+var_242]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		cmp	byte ptr [bp+var_22+3], 0
		jz	short loc_6783E
		cmp	[bp+var_24], 0
		jz	short loc_6783E
		push	0
		mov	al, byte ptr [bp+var_22+2]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6783E

loc_6783E:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_22+3], 0
		mov	[bp+var_1E], 0
		jmp	loc_6793D

loc_67855:
		mov	eax, [bp+var_1B3]
		cmp	eax, dword_5A7FE
		jnz	short loc_67866
		mov	ax, 1
		jmp	short loc_67868

loc_67866:
		xor	ax, ax

loc_67868:
		or	ax, ax
		jnz	short loc_6786F
		jmp	loc_67930

loc_6786F:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	si, ax
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	di, ax
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_4], ax
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_22+2], 2
		mov	byte ptr [bp+var_22+3], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	si
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		push	[bp+var_4]
		push	di
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	0
		call	sub_1DA1A
		add	sp, 0Ah
		mov	si, ax
		mov	byte ptr [bp+var_22+3], 0
		mov	byte ptr [si+16h], 1
		push	ax
		lea	ax, [bp+var_242]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		mov	byte ptr [si+1Dh], 1
		mov	[bp+var_A], si
		cmp	byte ptr [bp+var_22+3], 0
		jz	short loc_6791A
		cmp	[bp+var_24], 0
		jz	short loc_6791A
		push	0
		mov	al, byte ptr [bp+var_22+2]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6791A

loc_6791A:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_22+3], 0
		mov	[bp+var_1E], 0
		jmp	short loc_6793D

loc_67930:
		push	0Dh
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_6793D:
		mov	eax, [bp+var_1AA]
		mov	[bp+var_1BB], eax

loc_67947:
		cmp	[bp+var_1A4], 0
		jnz	short loc_6795B
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_67971

loc_6795B:
		mov	bx, [bp+var_1A4]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BB]
		jg	short loc_6796F
		mov	ax, 1
		jmp	short loc_67971

loc_6796F:
		xor	ax, ax

loc_67971:
		or	ax, ax
		jnz	short loc_67978
		jmp	loc_67777

loc_67978:
		jmp	short loc_67987

loc_6797A:
		push	0Eh
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67987:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_E], 0
		mov	byte ptr [bp+var_E+1], 0
		mov	[bp+var_C], 0
		push	100h
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		push	large 534C4150h
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_67A05
		jmp	loc_67B20

loc_67A05:
		jmp	loc_67AED

loc_67A08:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_54140
		pop	cx
		mov	eax, [bp+var_1B3]
		cmp	eax, dword_5A803
		jnz	short loc_67A24
		mov	ax, 1
		jmp	short loc_67A26

loc_67A24:
		xor	ax, ax

loc_67A26:
		or	ax, ax
		jnz	short loc_67A2D
		jmp	loc_67AD6

loc_67A2D:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	si, ax
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_22+2], 2
		mov	byte ptr [bp+var_22+3], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	si
		lea	ax, [bp+var_16A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_27], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	[bp+var_2A]
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	byte ptr [bp+var_22+3], 0
		jz	short loc_67AC0
		cmp	[bp+var_24], 0
		jz	short loc_67AC0
		push	0
		mov	al, byte ptr [bp+var_22+2]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_67AC0

loc_67AC0:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_22+3], 0
		mov	[bp+var_1E], 0
		jmp	short loc_67AE3

loc_67AD6:
		push	0Fh
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67AE3:
		mov	eax, [bp+var_1AA]
		mov	[bp+var_1BB], eax

loc_67AED:
		cmp	[bp+var_1A4], 0
		jnz	short loc_67B01
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_67B17

loc_67B01:
		mov	bx, [bp+var_1A4]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BB]
		jg	short loc_67B15
		mov	ax, 1
		jmp	short loc_67B17

loc_67B15:
		xor	ax, ax

loc_67B17:
		or	ax, ax
		jnz	short loc_67B1E
		jmp	loc_67A08

loc_67B1E:
		jmp	short loc_67B2D

loc_67B20:
		push	10h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67B2D:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		mov	[bp+var_250], 0
		mov	[bp+var_24E], 0
		mov	[bp+var_24C], 0
		mov	[bp+var_24A], 0
		mov	[bp+var_248], 13Fh
		mov	[bp+var_246], 0C7h
		push	0
		lea	ax, [bp+var_250]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_250]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	0
		lea	ax, [bp+var_250]
		push	ax
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		call	sub_1F377
		lea	ax, [bp+var_242]
		push	ax
		call	sub_1EED1
		pop	cx
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		cmp	[bp+var_A], 0
		jnz	short loc_67BC5
		push	11h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67BC5:
		mov	[bp+var_19], 0
		jmp	short loc_67BE8

loc_67BCB:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_67BDD
		mov	[bp+var_19], 1
		jmp	short loc_67BF7

loc_67BDD:
		lea	ax, [bp+var_242]
		push	ax
		call	sub_1EED1
		pop	cx

loc_67BE8:
		push	[bp+var_A]
		call	sub_1DAAA
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_67BCB

loc_67BF7:
		mov	al, [bp+var_19]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67C45
		xor	eax, eax
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	al, [bp+var_1]
		mov	ah, 0
		movsx	eax, ax
		mov	[bp+var_26], eax
		mov	[bp+var_1E], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_22], eax
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_46E45
		add	sp, 0Ah

loc_67C45:
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		lea	ax, [bp+var_18]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_250]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		call	sub_46E08
		pop	cx
		push	0
		lea	ax, [bp+var_242]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		mov	[bp+var_220], 9CDh
		lea	ax, [bp+var_220]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_220]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		lea	ax, [bp+var_178]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_67CC7:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_67591		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far : lit misn2op.iff au retour du vol (MLST, EXIT, INVN, JETS, KILL).
; ==============================================================================================
Gameflow_ReadMisn2Op_67CD9		proc far

var_122		= word ptr -122h
var_C5		= dword ptr -0C5h
var_C1		= dword ptr -0C1h
var_BD		= dword ptr -0BDh
var_B0		= word ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_7A		= word ptr -7Ah
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_C		= word ptr -0Ch
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 122h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 1
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_16]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	[bp+var_18], 0FFFFh
		cmp	byte ptr [si+0FFh], 0
		jnz	short loc_67D0C
		jmp	loc_6815C

loc_67D0C:
		lea	ax, [bp+var_122]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_122], 9B5h
		mov	[bp+var_C1], 100h
		mov	[bp+var_C5], 0
		mov	[bp+var_122], 9CDh
		mov	[bp+var_A6], 0
		xor	ax, ax
		mov	[bp+var_A8], ax
		movsx	eax, ax
		mov	[bp+var_BD], eax
		push	ds
		push	offset aIFF
		push	ds
		push	offset aMisn2op
		push	ds
		push	offset a__2
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		mov	bx, [bp+var_122]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4E564E49h
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		lea	ax, [bp+var_122]
		push	ax
		call	sub_541A0
		pop	cx
		push	0
		push	large 54495845h
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_67DC8
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_2], al
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax

loc_67DC8:
		cmp	[bp+var_2], 7
		jnz	short loc_67DD1
		jmp	loc_6813C

loc_67DD1:
		push	ds
		push	offset aTMP
		push	ds
		push	offset aTmpsav
		push	ds
		push	offset a__2
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_7A]
		push	ax
		push	si
		call	sub_BFE1
		add	sp, 4
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_67E36
		lea	ax, [bp+var_122]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_StrUpr_2F35
		pop	cx
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax
		jmp	short loc_67E43

loc_67E36:
		push	18h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67E43:
		mov	word ptr [si+0FDh], 0
		push	0
		push	large 5354454Ah
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_67E85
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+0FDh], ax
		mov	ax, [si+0FDh]
		add	[si+3D4h], ax
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax
		jmp	short loc_67E92

loc_67E85:
		push	1Bh
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67E92:
		push	0
		push	large 4C4C494Bh
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_67EAE
		jmp	loc_67FD3

loc_67EAE:
		mov	[bp+var_1C], 0
		jmp	loc_67F45

loc_67EB6:
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_1E], ax
		lea	ax, [bp+var_28]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_122]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_28]
		push	ax
		call	CRT_StrUpr_2F35
		pop	cx
		xor	di, di
		mov	[bp+var_2A], 1
		jmp	short loc_67F40

loc_67EF2:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+0A48h]
		call	CRT_Strlen
		pop	cx
		push	ax
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+0A48h]
		lea	ax, [bp+var_28]
		push	ax
		call	sub_2DF3
		add	sp, 6
		or	ax, ax
		jnz	short loc_67F3C
		or	di, di
		jnz	short loc_67F28
		cmp	[bp+var_1E], 0
		jz	short loc_67F28
		mov	byte ptr [si+100h], 1

loc_67F28:
		mov	bx, di
		imul	bx, bx, 1Ah
		mov	ax, [bp+var_1E]
		add	[bx+si+2AEh], ax
		mov	ax, [bp+var_2A]
		or	[bp+var_1C], ax
		jmp	short loc_67F45

loc_67F3C:
		inc	di
		shl	[bp+var_2A], 1

loc_67F40:
		cmp	di, 8
		jl	short loc_67EF2

loc_67F45:
		test	[bp+var_B0], 1
		jz	short loc_67F62
		mov	eax, [bp+var_AC]
		dec	eax
		cmp	eax, [bp+var_BD]
		jnz	short loc_67F62
		inc	[bp+var_BD]
		jmp	short loc_67F62

loc_67F62:
		mov	eax, [bp+var_BD]
		cmp	eax, [bp+var_AC]
		jl	short loc_67F73
		mov	ax, 1
		jmp	short loc_67F75

loc_67F73:
		xor	ax, ax

loc_67F75:
		or	ax, ax
		jnz	short loc_67F7C
		jmp	loc_67EB6

loc_67F7C:
		cmp	[bp+var_1C], 0
		jz	short loc_67FC7
		xor	di, di
		mov	[bp+var_1E], 1
		jmp	short loc_67FC2

loc_67F8B:
		mov	ax, [bp+var_1E]
		test	[bp+var_1C], ax
		jnz	short loc_67FBE
		mov	bx, di
		imul	bx, bx, 1Ah
		cmp	word ptr [bx+si+2B2h], 0
		jz	short loc_67FBE
		mov	ax, 64h
		call	Math_RandomScale_39596
		cmp	ax, 32h
		jge	short loc_67FBE
		mov	ax, 1
		call	Math_RandomScale_39596
		inc	ax
		mov	bx, di
		imul	bx, bx, 1Ah
		add	[bx+si+2AEh], ax

loc_67FBE:
		inc	di
		shl	[bp+var_1E], 1

loc_67FC2:
		cmp	di, 8
		jl	short loc_67F8B

loc_67FC7:
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax
		jmp	short loc_67FE0

loc_67FD3:
		push	1Eh
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_67FE0:
		lea	ax, [bp+var_122]
		push	ax
		call	sub_A642
		pop	cx
		or	ax, ax
		jnz	short loc_67FF8
		push	0AE8h
		call	sub_9D78
		pop	cx

loc_67FF8:
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	1
		mov	ax, si
		add	ax, 57h
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		mov	bx, [bp+var_122]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_68040
		push	1Fh
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_68040:
		push	0
		push	large 41544144h
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_68066
		push	20h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_68066:
		lea	ax, [bp+var_24]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		xor	di, di
		lea	ax, [bp+var_C]
		mov	[bp+var_26], ax
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		mov	dx, ax
		mov	bx, [bp+var_26]
		add	bx, dx
		cmp	byte ptr [bx], 41h
		jnz	short loc_680CB
		mov	bx, [bp+var_26]
		add	bx, dx
		mov	byte ptr [bx], 0
		jmp	short loc_680CB

loc_68096:
		lea	ax, [bp+var_122]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_StrUpr_2F35
		pop	cx
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_680CA
		mov	[bp+var_18], di
		jmp	short loc_680FF

loc_680CA:
		inc	di

loc_680CB:
		test	[bp+var_B0], 1
		jz	short loc_680E8
		mov	eax, [bp+var_AC]
		dec	eax
		cmp	eax, [bp+var_BD]
		jnz	short loc_680E8
		inc	[bp+var_BD]
		jmp	short loc_680E8

loc_680E8:
		mov	eax, [bp+var_BD]
		cmp	eax, [bp+var_AC]
		jl	short loc_680F9
		mov	ax, 1
		jmp	short loc_680FB

loc_680F9:
		xor	ax, ax

loc_680FB:
		or	ax, ax
		jz	short loc_68096

loc_680FF:
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		cmp	[bp+var_18], 0FFFFh
		jnz	short loc_6811D
		push	21h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_6811D:
		push	100h
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_68134
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+si+21Ch], 1
		jmp	short loc_6813C

loc_68134:
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+si+21Ch], 2

loc_6813C:
		mov	[bp+var_122], 9CDh
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_122]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_6815C:
		mov	byte ptr [si+10Ch], 0FFh
		mov	al, [bp+var_2]
		mov	[bp+var_1A], al
		pop	di
		pop	si
		leave
		retf
Gameflow_ReadMisn2Op_67CD9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6816B		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10Eh]
		mov	[si+10Dh], al
		mov	byte ptr [si+10Eh], 0FFh
		push	ds
		push	offset aTMP
		push	ds
		push	offset aTmpsav
		push	ds
		push	offset a__2
		lea	ax, [bp+var_50]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_50]
		push	ax
		push	si
		call	sub_BBDF
		add	sp, 4
		pop	si
		leave
		retf
sub_6816B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far : écrit op2misn.iff (MLST, NAME, SNAM, RANK, INVN) avant le vol ; appelée par la boucle
; du déroulement quand [partie+252] = 1.
; ==============================================================================================
Gameflow_WriteOp2Misn_681AA		proc far

var_1C2		= word ptr -1C2h
var_165		= dword ptr -165h
var_161		= dword ptr -161h
var_15D		= dword ptr -15Dh
var_14C		= dword ptr -14Ch
var_148		= word ptr -148h
var_146		= word ptr -146h
var_11A		= word ptr -11Ah
var_BD		= dword ptr -0BDh
var_B9		= dword ptr -0B9h
var_B5		= dword ptr -0B5h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_72		= word ptr -72h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1C2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+10Ch], 0FEh
		jnz	short loc_681C0
		jmp	loc_682F8

loc_681C0:
		cmp	byte ptr [si+10Ch], 96h
		jbe	short loc_681D4
		push	24h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_681D4:
		lea	ax, [bp+var_1C2]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_1C2], 9B5h
		mov	[bp+var_161], 100h
		mov	[bp+var_165], 0
		mov	[bp+var_1C2], 9CDh
		mov	[bp+var_146], 0
		xor	ax, ax
		mov	[bp+var_148], ax
		movsx	eax, ax
		mov	[bp+var_15D], eax
		push	1
		mov	ax, si
		add	ax, 57h
		push	ax
		lea	ax, [bp+var_1C2]
		push	ax
		mov	bx, [bp+var_1C2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp+var_1C2]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_6824F
		push	22h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_6824F:
		push	0
		push	large 41544144h
		lea	ax, [bp+var_1C2]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_68275
		push	23h
		push	0A36h
		call	sub_9D78
		add	sp, 4

loc_68275:
		xor	di, di
		jmp	short loc_6828F

loc_68279:
		push	large 8
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_1C2]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		inc	di

loc_6828F:
		mov	al, [si+10Ch]
		mov	ah, 0
		cmp	ax, di
		jge	short loc_68279
		push	103h
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_682C4
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 8
		jz	short loc_682C4
		push	34E9h
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_682C4:
		mov	eax, [bp+var_14C]
		mov	[bp+var_15D], eax
		lea	ax, [bp+var_1C2]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		mov	[bp+var_1C2], 9CDh
		lea	ax, [bp+var_1C2]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_1C2]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		jmp	short loc_68320

loc_682F8:
		push	2Eh
		mov	ax, si
		add	ax, 0A7h
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	ax, ax
		jz	short loc_68311
		mov	byte ptr [di], 0

loc_68311:
		mov	ax, si
		add	ax, 0A7h
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy

loc_68320:
		add	sp, 4
		push	ds
		push	offset aIFF
		push	ds
		push	offset aOp2misn
		push	ds
		push	offset a__2
		lea	ax, [bp+var_72]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_11A], 9B5h
		mov	[bp+var_B9], 100h
		mov	[bp+var_BD], 0
		mov	[bp+var_11A], 9CDh
		mov	[bp+var_9E], 0
		xor	ax, ax
		mov	[bp+var_A0], ax
		movsx	eax, ax
		mov	[bp+var_B5], eax
		mov	[bp+var_11A], 0B14h
		push	0
		lea	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ReadDispatch_5274A
		add	sp, 6
		mov	al, 0
		push	large 0
		push	large dword_5A81B
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C4A
		add	sp, 0Ah
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C4F
		pop	cx
		push	large 0
		push	large dword_5A820
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		push	large [bp+var_B5]
		push	large 8
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_B5], 8
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C63
		pop	cx
		push	large 0
		push	large dword_5A825
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		mov	ax, si
		add	ax, 3B6h
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], ax
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	CRT_Strlen
		pop	cx
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	large [bp+var_B5]
		push	eax
		push	large [bp+var_E]
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		mov	eax, [bp+var_12]
		add	[bp+var_B5], eax
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C63
		pop	cx
		push	large 0
		push	large dword_5A82A
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		mov	ax, si
		add	ax, 3A7h
		mov	word ptr [bp+var_16+2], ds
		mov	word ptr [bp+var_16], ax
		mov	ax, si
		add	ax, 3A7h
		push	ax
		call	CRT_Strlen
		pop	cx
		movzx	eax, ax
		mov	[bp+var_1A], eax
		push	large [bp+var_B5]
		push	eax
		push	large [bp+var_16]
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		mov	eax, [bp+var_1A]
		add	[bp+var_B5], eax
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C63
		pop	cx
		push	large 0
		push	large dword_5A82F
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		mov	ax, si
		add	ax, 3C5h
		mov	word ptr [bp+var_1E+2], ds
		mov	word ptr [bp+var_1E], ax
		mov	ax, si
		add	ax, 3C5h
		push	ax
		call	CRT_Strlen
		pop	cx
		movzx	eax, ax
		mov	[bp+var_22], eax
		push	large [bp+var_B5]
		push	eax
		push	large [bp+var_1E]
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		mov	eax, [bp+var_22]
		add	[bp+var_B5], eax
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C63
		pop	cx
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_A5CE
		pop	cx
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C59
		pop	cx
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_59C68
		pop	cx
		mov	[bp+var_11A], 9CDh
		lea	ax, [bp+var_11A]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_WriteOp2Misn_681AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68559		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_68559		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68561		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_68595
		mov	word ptr [si], 9CDh
		push	si
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		test	di, 1
		jz	short loc_68595
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_68595

loc_68595:
		pop	di
		pop	si
		pop	bp
		retf
sub_68561		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_2CA33 (sub_2CA33 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à StreamReader_DestructWrapper_659C1
; (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_68599		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_5482F
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_68599		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_685A8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_685D3
		mov	word ptr [si], 0B2Ch
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		test	di, 1
		jz	short loc_685D3
		push	si
		call	sub_33B
		pop	cx

loc_685D3:
		pop	di
		pop	si
		pop	bp
		retf
sub_685A8		endp
ovr186		ends
