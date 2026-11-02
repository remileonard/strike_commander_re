ovr188		segment	para public 'OVERLAY' use16
		assume cs:ovr188
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 23 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Gameflow_InitNewGame_4A140 (sub_4A140 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE en surface
; 2026-10-22. Remet la partie à zéro (argent, pertes, pilotes [+2A3h] = 1, drapeaux [+1FDh] =
; 0, [+0EDh] = [+0EEh] = 0…).
; ==============================================================================================
Gameflow_InitNewGame_4F900		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0EDh], 1
		mov	byte ptr [si+0EEh], 0
		mov	byte ptr [si+0EFh], 0
		mov	byte ptr [si+35Ch], 0
		xor	di, di
		jmp	short loc_4F950

loc_4F920:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+214h]
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 28Ch
		push	dx
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A4h], 1
		inc	di

loc_4F950:
		cmp	di, 8
		jl	short loc_4F920
		mov	byte ptr [si+0FBh], 0
		mov	byte ptr [si+0FAh], 0FFh
		mov	byte ptr [si+0FCh], 0FFh
		mov	byte ptr [si+0FDh], 0FFh
		xor	di, di
		jmp	short loc_4F975

loc_4F96D:
		mov	bx, di
		mov	byte ptr [bx+si+0FEh], 0
		inc	di

loc_4F975:
		cmp	di, 0FFh
		jl	short loc_4F96D
		xor	di, di
		jmp	short loc_4F987

loc_4F97F:
		mov	bx, di
		mov	byte ptr [bx+si+1FEh], 0
		inc	di

loc_4F987:
		cmp	di, 64h
		jl	short loc_4F97F
		xor	di, di
		jmp	short loc_4F99B

loc_4F990:
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+262h], 0
		inc	di

loc_4F99B:
		cmp	di, 9
		jl	short loc_4F990
		xor	di, di
		jmp	short loc_4F9B7

loc_4F9A4:
		mov	bx, di
		shl	bx, 1
		mov	byte ptr [bx+si+275h], 0
		mov	bx, di
		shl	bx, 1
		mov	byte ptr [bx+si+274h], 0FFh
		inc	di

loc_4F9B7:
		cmp	di, 4
		jl	short loc_4F9A4
		mov	dword ptr [si+27Ch], 0
		mov	dword ptr [si+280h], 0
		mov	dword ptr [si+284h], 0
		mov	dword ptr [si+288h], 0
		mov	dword ptr [si+3DDh], 0
		mov	word ptr [si+3D5h], 0
		mov	word ptr [si+0EBh], 0
		pop	di
		pop	si
		pop	bp
		retf
Gameflow_InitNewGame_4F900		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F9F9		proc far

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
		call	near ptr Gameflow_InitNewGame_4F900
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[si+0E5h], ax
		mov	al, [bp+arg_8]
		mov	[si+0FBh], al
		mov	byte ptr [si+0E8h], 0
		mov	byte ptr [si+0E9h], 0
		push	ds
		push	offset aIff
		push	ds
		push	offset aGameflo2
		push	ds
		push	offset aDataGameflow
		mov	ax, si
		add	ax, 44h
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	51Bh
		mov	ax, si
		add	ax, 3C1h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	524h
		mov	ax, si
		add	ax, 399h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	52Ch
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_2], 0
		xor	di, di
		jmp	loc_4FBCC

loc_4FA7B:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx], 2Dh
		jz	short loc_4FA8E
		jmp	loc_4FBCB

loc_4FA8E:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx+1], 2Eh
		jz	short loc_4FAA2
		jmp	loc_4FBCB

loc_4FAA2:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		push	word ptr [bx]
		call	CRT_Strdup
		add	sp, 2
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
		add	sp, 2
		sub	ax, 43h
		mov	bx, ax
		cmp	bx, 13h
		jbe	short loc_4FADD
		jmp	loc_4FBC0

loc_4FADD:
		shl	bx, 1
		jmp	cs:off_4FBD8[bx]	; switch jump

loc_4FAE4:
		mov	byte ptr [si+0E8h], 1
		jmp	loc_4FBC0

loc_4FAEC:
		mov	byte ptr [si+0E8h], 2
		jmp	loc_4FBC0

loc_4FAF4:
		mov	byte ptr [si+0E9h], 1
		jmp	loc_4FBC0

loc_4FAFC:
		mov	byte ptr [si+0EDh], 0
		jmp	loc_4FBC0

loc_4FB04:
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
		jnz	short loc_4FB3D
		push	42ABh
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_4FB3D:
		push	ds
		push	offset unk_48F15
		push	ss
		lea	ax, [bp+var_5A]
		push	ax
		push	ds
		push	offset unk_48F14
		mov	ax, si
		add	ax, 44h
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_4FBC0

loc_4FB5A:
		mov	ax, [bp+var_2]
		add	ax, 3
		mov	[bp+var_4], ax
		push	[bp+var_4]
		call	sub_2193
		add	sp, 2
		mov	[si+0FBh], al
		jmp	short loc_4FBC0

loc_4FB74:
		push	0
		call	sub_47FBA
		add	sp, 2
		jmp	short loc_4FBC0

loc_4FB80:
		mov	ax, [bp+var_2]
		add	ax, 3
		mov	[bp+var_6], ax
		push	[bp+var_6]
		call	sub_2193
		add	sp, 2
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_503A5
		add	sp, 4
		jmp	short loc_4FBC0

loc_4FBA0:
		mov	ax, [bp+var_2]
		add	ax, 3
		mov	[bp+var_8], ax
		push	[bp+var_8]
		call	sub_2193
		add	sp, 2
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_5026B
		add	sp, 4
		jmp	short loc_4FBC0

loc_4FBC0:
		push	[bp+var_2]
		call	sub_330E8
		add	sp, 2

loc_4FBCB:
		inc	di

loc_4FBCC:
		cmp	di, [bp+arg_4]
		jge	short loc_4FBD4
		jmp	loc_4FA7B

loc_4FBD4:
		pop	di
		pop	si
		leave
		retf
sub_4F9F9		endp

; START OF FUNCTION CHUNK FOR sub_4F9F9
off_4FBD8	dw offset loc_4FB74
		dw offset loc_4FB80
		dw offset loc_4FBC0
		dw offset loc_4FB04
		dw offset loc_4FBC0
		dw offset loc_4FBC0
		dw offset loc_4FBC0
		dw offset loc_4FBC0
		dw offset loc_4FBC0
		dw offset loc_4FAFC
		dw offset loc_4FAF4
		dw offset loc_4FAEC
		dw offset loc_4FBC0
		dw offset loc_4FBC0
		dw offset loc_4FAE4
		dw offset loc_4FBC0
		dw offset loc_4FB5A
		dw offset loc_4FBC0
		dw offset loc_4FBC0
		dw offset loc_4FBA0
; END OF FUNCTION CHUNK FOR sub_4F9F9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4FC00		proc far

var_AA		= word ptr -0AAh
var_4D		= dword ptr -4Dh
var_49		= dword ptr -49h
var_45		= dword ptr -45h
var_3D		= dword ptr -3Dh
var_38		= byte ptr -38h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0AAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_AA], 480h
		mov	[bp+var_49], 100h
		mov	[bp+var_4D], 0
		mov	[bp+var_AA], 498h
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_30], ax
		movsx	eax, ax
		mov	[bp+var_45], eax
		push	1
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_42C34
		add	sp, 2
		mov	[bp+var_1], 0
		jmp	loc_4FD68

loc_4FC72:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_426EE
		add	sp, 2
		or	ax, ax
		jnz	short loc_4FC86
		jmp	loc_4FD5B

loc_4FC86:
		mov	eax, [bp+var_3D]
		cmp	eax, dword_48F16
		jnz	short loc_4FC96
		mov	ax, 1
		jmp	short loc_4FC98

loc_4FC96:
		xor	ax, ax

loc_4FC98:
		or	ax, ax
		jnz	short loc_4FC9F
		jmp	loc_4FD5B

loc_4FC9F:
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_4FD3F
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	dl, [si+0FBh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_4FD35
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		push	0
		push	large 54434645h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_4FD2F
		mov	al, [bp+var_38]
		mov	[si+7], al
		cmp	byte ptr [si+7], 3Ch
		jbe	short loc_4FD0D
		mov	byte ptr [si+7], 3Ch

loc_4FD0D:
		xor	di, di
		jmp	short loc_4FD24

loc_4FD11:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	bx, di
		mov	[bx+si+8], al
		inc	di

loc_4FD24:
		mov	al, [si+7]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_4FD11
		jmp	short loc_4FD2F

loc_4FD2F:
		mov	[bp+var_1], 1
		jmp	short loc_4FD98

loc_4FD35:
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		jmp	short loc_4FD4C

loc_4FD3F:
		push	2
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_4FD4C:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_4FD68

loc_4FD5B:
		push	3
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_4FD68:
		cmp	[bp+var_2E], 0
		jnz	short loc_4FD7D
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_4FD91

loc_4FD7D:
		mov	bx, [bp+var_2E]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_45]
		jg	short loc_4FD8F
		mov	ax, 1
		jmp	short loc_4FD91

loc_4FD8F:
		xor	ax, ax

loc_4FD91:
		or	ax, ax
		jnz	short loc_4FD98
		jmp	loc_4FC72

loc_4FD98:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_AA], 498h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_4FC00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4FDCB		proc far

var_B0		= word ptr -0B0h
var_53		= dword ptr -53h
var_4F		= dword ptr -4Fh
var_4B		= dword ptr -4Bh
var_43		= dword ptr -43h
var_3E		= byte ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0EAh], 0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_B0], 480h
		mov	[bp+var_4F], 100h
		mov	[bp+var_53], 0
		mov	[bp+var_B0], 498h
		mov	[bp+var_34], 0
		xor	ax, ax
		mov	[bp+var_36], ax
		movsx	eax, ax
		mov	[bp+var_4B], eax
		push	si
		call	sub_6276
		add	sp, 2
		push	1
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		mov	bx, [bp+var_B0]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_42C34
		add	sp, 2
		mov	[bp+var_1], 0
		jmp	loc_4FEF3

loc_4FE4B:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_426EE
		add	sp, 2
		or	ax, ax
		jnz	short loc_4FE5F
		jmp	loc_4FEE6

loc_4FE5F:
		mov	eax, [bp+var_43]
		cmp	eax, dword_48F1B
		jnz	short loc_4FE6F
		mov	ax, 1
		jmp	short loc_4FE71

loc_4FE6F:
		xor	ax, ax

loc_4FE71:
		or	ax, ax
		jz	short loc_4FEE6
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_4FECA
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	dl, [si+0FBh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_4FEC0
		mov	[bp+var_1], 1
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4FF23

loc_4FEC0:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4FED7

loc_4FECA:
		push	5
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_4FED7:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_4FEF3

loc_4FEE6:
		push	6
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_4FEF3:
		cmp	[bp+var_34], 0
		jnz	short loc_4FF08
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_4FF1C

loc_4FF08:
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_4FF1A
		mov	ax, 1
		jmp	short loc_4FF1C

loc_4FF1A:
		xor	ax, ax

loc_4FF1C:
		or	ax, ax
		jnz	short loc_4FF23
		jmp	loc_4FE4B

loc_4FF23:
		cmp	[bp+var_1], 0
		jnz	short loc_4FF2C
		jmp	loc_50238

loc_4FF2C:
		mov	[bp+var_2], 0
		jmp	loc_4FFD6

loc_4FF33:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_426EE
		add	sp, 2
		or	ax, ax
		jnz	short loc_4FF47
		jmp	loc_4FFCE

loc_4FF47:
		mov	eax, [bp+var_43]
		cmp	eax, dword_48F20
		jnz	short loc_4FF57
		mov	ax, 1
		jmp	short loc_4FF59

loc_4FF57:
		xor	ax, ax

loc_4FF59:
		or	ax, ax
		jz	short loc_4FFCE
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_4FFB2
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	dl, [si+0FDh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_4FFA8
		mov	[bp+var_2], 1
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_50006

loc_4FFA8:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4FFBF

loc_4FFB2:
		push	7
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_4FFBF:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_4FFD6

loc_4FFCE:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax

loc_4FFD6:
		cmp	[bp+var_34], 0
		jnz	short loc_4FFEB
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_4FFFF

loc_4FFEB:
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_4FFFD
		mov	ax, 1
		jmp	short loc_4FFFF

loc_4FFFD:
		xor	ax, ax

loc_4FFFF:
		or	ax, ax
		jnz	short loc_50006
		jmp	loc_4FF33

loc_50006:
		cmp	[bp+var_2], 0
		jnz	short loc_5000F
		jmp	loc_50238

loc_5000F:
		jmp	loc_50208

loc_50012:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_426EE
		add	sp, 2
		or	ax, ax
		jnz	short loc_50026
		jmp	loc_501CA

loc_50026:
		mov	eax, [bp+var_43]
		cmp	eax, dword_48F25
		jnz	short loc_50036
		mov	ax, 1
		jmp	short loc_50038

loc_50036:
		xor	ax, ax

loc_50038:
		or	ax, ax
		jnz	short loc_5003F
		jmp	loc_501CA

loc_5003F:
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_42C34
		add	sp, 2
		mov	[bp+var_4], 0
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_50083
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_3], al
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_50090

loc_50083:
		push	8
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_50090:
		push	0
		push	large 55514552h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_5011C
		mov	al, [bp+var_3E]
		mov	byte ptr [bp+var_6+1], al
		mov	al, byte ptr [bp+var_6+1]
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_8], ax
		xor	di, di
		jmp	short loc_500D9

loc_500C4:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	bx, [bp+var_8]
		add	bx, di
		mov	[bx], al
		inc	di

loc_500D9:
		mov	al, byte ptr [bp+var_6+1]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_500C4
		push	[bp+var_8]
		mov	al, byte ptr [bp+var_6+1]
		push	ax
		push	si
		call	Gameflow_CheckSpriteRequirements_62EE
		add	sp, 6
		or	al, al
		jz	short loc_50107
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_61E0
		add	sp, 4
		mov	[bp+var_4], 1

loc_50107:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		push	[bp+var_8]
		call	sub_39C
		add	sp, 2
		jmp	short loc_5012D

loc_5011C:
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_61E0
		add	sp, 4
		mov	[bp+var_4], 1

loc_5012D:
		cmp	[bp+var_4], 0
		jnz	short loc_50136
		jmp	loc_501BB

loc_50136:
		push	0
		push	large 54434645h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_501AE
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_62B3
		add	sp, 4
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	al, [bp+var_3E]
		mov	[bx+7], al
		mov	byte ptr [bp+var_8+1], al
		mov	al, byte ptr [bp+var_8+1]
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	bx, [bp+var_6]
		mov	[bx+5], ax
		xor	di, di
		jmp	short loc_5019B

loc_50183:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	bx, [bp+var_6]
		mov	bx, [bx+5]
		add	bx, di
		mov	[bx], al
		inc	di

loc_5019B:
		mov	al, byte ptr [bp+var_8+1]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_50183
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_501BB

loc_501AE:
		push	9
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_501BB:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_50208

loc_501CA:
		mov	eax, [bp+var_43]
		cmp	eax, dword_48F2A
		jnz	short loc_501DA
		mov	ax, 1
		jmp	short loc_501DC

loc_501DA:
		xor	ax, ax

loc_501DC:
		or	ax, ax
		jz	short loc_501FB
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[si+0EAh], al
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_50208

loc_501FB:
		push	0Ah
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_50208:
		cmp	[bp+var_34], 0
		jnz	short loc_5021D
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_50231

loc_5021D:
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_5022F
		mov	ax, 1
		jmp	short loc_50231

loc_5022F:
		xor	ax, ax

loc_50231:
		or	ax, ax
		jnz	short loc_50238
		jmp	loc_50012

loc_50238:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_B0], 498h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_4FDCB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5026B		proc far

var_78		= word ptr -78h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	byte_4EAAA, al
		mov	ax, si
		add	ax, 399h
		mov	[bp+var_A], ax
		mov	ax, si
		add	ax, 3ADh
		mov	[bp+var_8], ax
		mov	ax, si
		add	ax, 3C1h
		mov	[bp+var_6], ax
		mov	ax, [si+0EBh]
		mov	[bp+var_4], ax
		mov	ax, [si+3D5h]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 35Ch
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	sub_47B4A
		add	sp, 8
		call	TextScrollDisplayB_ApplyHelperD_4555C
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	sub_47B54
		add	sp, 2
		call	sub_11721
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_78]
		push	ax
		call	sub_47B4F
		add	sp, 4
		pop	si
		leave
		retf
sub_5026B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_502FE		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	[bp+var_D], 0
		lea	ax, [bp+var_14]
		push	ax
		push	word_48CD8
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_50338
		mov	al, 1
		leave
		retf
		jmp	short loc_5033C

loc_50338:
		mov	al, 0
		leave
		retf
sub_502FE		endp

; START OF FUNCTION CHUNK FOR sub_502FE

loc_5033C:
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_502FE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5033E		proc far

var_6A		= word ptr -6Ah
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_6A], 480h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 5BDh
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
		call	near ptr sub_502FE
		add	sp, 2
		mov	[bp+var_3], al
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	al, [bp+var_3]
		leave
		retf
sub_5033E		endp

; START OF FUNCTION CHUNK FOR sub_5033E
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5033E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_503A5		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		call	Music_Stop_2D9C2
		add	sp, 2
		mov	al, [bp+arg_2]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 23h
		jbe	short loc_503C6
		jmp	loc_504F9

loc_503C6:
		shl	bx, 1
		jmp	cs:off_5050C[bx]	; switch jump

loc_503CD:
		call	sub_47CE5
		jmp	loc_504FB

loc_503D5:
		mov	ax, si
		add	ax, 3C1h
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	sub_47D40
		add	sp, 6
		push	0
		call	sub_47FBA
		add	sp, 2
		mov	byte ptr [si+0E9h], 0
		mov	byte ptr [si+0E8h], 2
		jmp	loc_504FB

loc_50406:
		call	sub_47D70
		mov	byte ptr [si+0E9h], 0
		mov	byte ptr [si+0E8h], 2
		jmp	loc_504FB

loc_50418:
		call	sub_47DA0
		jmp	loc_504FB

loc_50420:
		mov	ax, si
		add	ax, 3C1h
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	sub_47DD0
		add	sp, 6
		jmp	loc_504FB

loc_5043D:
		call	sub_47E00
		jmp	loc_504FB

loc_50445:
		mov	ax, si
		add	ax, 3C1h
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	sub_47E30
		add	sp, 6
		jmp	loc_504FB

loc_50462:
		call	sub_47E60
		jmp	loc_504FB

loc_5046A:
		mov	ax, si
		add	ax, 3C1h
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	sub_47E90
		add	sp, 6
		jmp	short loc_504FB

loc_50486:
		mov	ax, si
		add	ax, 3C1h
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	sub_47EC0
		add	sp, 6
		jmp	short loc_504FB

loc_504A2:
		jmp	short loc_504FB

loc_504A4:
		jmp	short loc_504FB

loc_504A6:
		mov	ax, si
		add	ax, 3C1h
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	sub_47EF0
		add	sp, 6
		jmp	short loc_504FB

loc_504C2:
		call	sub_47F20
		jmp	short loc_504FB

loc_504C9:
		mov	ax, si
		add	ax, 3C1h
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	sub_47F50
		add	sp, 6
		push	0
		call	sub_47FBA
		add	sp, 2
		mov	byte ptr [si+0E9h], 0
		mov	byte ptr [si+0E8h], 2
		jmp	short loc_504FB

loc_504F9:
		jmp	short loc_504FB

loc_504FB:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_503A5		endp

; START OF FUNCTION CHUNK FOR sub_503A5
off_5050C	dw offset loc_503CD
		dw offset loc_503D5
		dw offset loc_50406
		dw offset loc_504F9
		dw offset loc_50418
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_50420
		dw offset loc_504F9
		dw offset loc_5043D
		dw offset loc_50445
		dw offset loc_50462
		dw offset loc_5046A
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_50486
		dw offset loc_504A2
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504F9
		dw offset loc_504A4
		dw offset loc_504F9
		dw offset loc_504A6
		dw offset loc_504C2
		dw offset loc_504F9
		dw offset loc_504C9
; END OF FUNCTION CHUNK FOR sub_503A5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50554		proc far

var_2CA		= word ptr -2CAh
var_252		= word ptr -252h
var_250		= word ptr -250h
var_24E		= word ptr -24Eh
var_24C		= word ptr -24Ch
var_24A		= word ptr -24Ah
var_248		= word ptr -248h
var_244		= word ptr -244h
var_222		= word ptr -222h
var_1C5		= dword ptr -1C5h
var_1C1		= dword ptr -1C1h
var_1BD		= dword ptr -1BDh
var_1B5		= dword ptr -1B5h
var_1AC		= dword ptr -1ACh
var_1A8		= word ptr -1A8h
var_1A6		= word ptr -1A6h
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= word ptr -176h
var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16C		= word ptr -16Ch
var_F4		= word ptr -0F4h
var_7C		= word ptr -7Ch
var_2C		= word ptr -2Ch
var_2A		= byte ptr -2Ah
var_29		= word ptr -29h
var_28		= dword ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2CAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_4F55C
		mov	ah, 0
		or	ax, ax
		jz	short loc_5056C
		jmp	loc_50D73

loc_5056C:
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_7C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_7C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_F4]
		push	ax
		call	sub_435F1
		add	sp, 2
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_435F1
		add	sp, 2
		mov	ax, word_4D36E
		mov	[bp+var_8], ax
		mov	[bp+var_17A], 0
		mov	[bp+var_178], 0
		push	[bp+var_8]
		lea	ax, [bp+var_17A]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_176], 0
		mov	[bp+var_174], 18h
		mov	[bp+var_172], 13Fh
		mov	[bp+var_170], 97h
		lea	ax, [bp+var_222]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_222], 480h
		mov	[bp+var_1C1], 100h
		mov	[bp+var_1C5], 0
		mov	[bp+var_222], 498h
		mov	[bp+var_1A6], 0
		xor	ax, ax
		mov	[bp+var_1A8], ax
		movsx	eax, ax
		mov	[bp+var_1BD], eax
		push	ds
		push	offset aIff
		push	ds
		push	offset aOptions2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_7C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_222]
		push	ax
		mov	bx, [bp+var_222]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 42545345h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		mov	[bp+var_9], 0
		jmp	short loc_506E0

loc_5069E:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_1C], al
		mov	al, [bp+var_1C]
		cmp	al, [bp+arg_2]
		jnz	short loc_506D3
		mov	[bp+var_9], 1
		jmp	short loc_506F9
		jmp	short loc_506E0

loc_506D3:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_506E0:
		push	1
		push	large 544F4853h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_5069E

loc_506F9:
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5070F
		push	64h
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_5070F:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_1], al
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax
		lea	ax, [bp+var_17A]
		push	ax
		push	0
		push	0Fh
		lea	ax, [bp+var_244]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_C], 0
		push	0
		push	large 454E5554h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_50787
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[si+0EAh], al
		mov	al, [si+0EAh]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax

loc_50787:
		push	0
		push	large 53504853h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_507A3
		jmp	loc_50A18

loc_507A3:
		jmp	loc_509E3

loc_507A6:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_42BD4
		add	sp, 2
		mov	eax, [bp+var_1B5]
		cmp	eax, dword_48F2F
		jnz	short loc_507C4
		mov	ax, 1
		jmp	short loc_507C6

loc_507C4:
		xor	ax, ax

loc_507C6:
		or	ax, ax
		jnz	short loc_507CD
		jmp	loc_50895

loc_507CD:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_4], ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_6], ax
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		lea	ax, [bp+var_F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	[bp+var_6]
		push	[bp+var_4]
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_28], ax
		mov	byte ptr [bp+var_24+3], 0
		mov	bx, word ptr [bp+var_28]
		mov	byte ptr [bx+16h], 1
		push	word ptr [bp+var_28]
		lea	ax, [bp+var_244]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_5087E
		cmp	[bp+var_26], 0
		jz	short loc_5087E
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5087E

loc_5087E:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		jmp	loc_509D9

loc_50895:
		mov	eax, [bp+var_1B5]
		cmp	eax, dword_48F34
		jnz	short loc_508A6
		mov	ax, 1
		jmp	short loc_508A8

loc_508A6:
		xor	ax, ax

loc_508A8:
		or	ax, ax
		jnz	short loc_508AF
		jmp	loc_509D9

loc_508AF:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_4], ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_6], ax
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		cmp	di, 0FEh
		jnz	short loc_5094C
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_7C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_2CA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, [bp+var_2CA]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		jmp	short loc_50960

loc_5094C:
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		lea	ax, [bp+var_F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8

loc_50960:
		push	0
		push	[bp+var_6]
		push	[bp+var_4]
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	0
		call	TriggeredAnimLayer_Construct_F8B9
		add	sp, 0Ah
		mov	word ptr [bp+var_28], ax
		mov	byte ptr [bp+var_24+3], 0
		mov	bx, word ptr [bp+var_28]
		mov	byte ptr [bx+16h], 1
		push	word ptr [bp+var_28]
		lea	ax, [bp+var_244]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	bx, word ptr [bp+var_28]
		mov	byte ptr [bx+1Dh], 1
		mov	ax, word ptr [bp+var_28]
		mov	[bp+var_C], ax
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_509C5
		cmp	[bp+var_26], 0
		jz	short loc_509C5
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_509C5

loc_509C5:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0

loc_509D9:
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax

loc_509E3:
		cmp	[bp+var_1A6], 0
		jnz	short loc_509F9
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_50A0F

loc_509F9:
		mov	bx, [bp+var_1A6]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BD]
		jg	short loc_50A0D
		mov	ax, 1
		jmp	short loc_50A0F

loc_50A0D:
		xor	ax, ax

loc_50A0F:
		or	ax, ax
		jnz	short loc_50A16
		jmp	loc_507A6

loc_50A16:
		jmp	short loc_50A25

loc_50A18:
		push	0Eh
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_50A25:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	byte ptr [bp+var_10], 0
		mov	byte ptr [bp+var_10+1], 0
		mov	[bp+var_E], 0
		push	100h
		push	0
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	large 534C4150h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_50AA5
		jmp	loc_50BC8

loc_50AA5:
		jmp	loc_50B93

loc_50AA8:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_42BD4
		add	sp, 2
		mov	eax, [bp+var_1B5]
		cmp	eax, dword_48F39
		jnz	short loc_50AC6
		mov	ax, 1
		jmp	short loc_50AC8

loc_50AC6:
		xor	ax, ax

loc_50AC8:
		or	ax, ax
		jnz	short loc_50ACF
		jmp	loc_50B7C

loc_50ACF:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		lea	ax, [bp+var_16C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_29], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_50B66
		cmp	[bp+var_26], 0
		jz	short loc_50B66
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_50B66

loc_50B66:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		jmp	short loc_50B89

loc_50B7C:
		push	0Fh
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_50B89:
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax

loc_50B93:
		cmp	[bp+var_1A6], 0
		jnz	short loc_50BA9
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_50BBF

loc_50BA9:
		mov	bx, [bp+var_1A6]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BD]
		jg	short loc_50BBD
		mov	ax, 1
		jmp	short loc_50BBF

loc_50BBD:
		xor	ax, ax

loc_50BBF:
		or	ax, ax
		jnz	short loc_50BC6
		jmp	loc_50AA8

loc_50BC6:
		jmp	short loc_50BD5

loc_50BC8:
		push	10h
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_50BD5:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		mov	[bp+var_252], 0
		mov	[bp+var_250], 0
		mov	[bp+var_24E], 0
		mov	[bp+var_24C], 0
		mov	[bp+var_24A], 13Fh
		mov	[bp+var_248], 0C7h
		push	0
		lea	ax, [bp+var_252]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	0
		lea	ax, [bp+var_252]
		push	ax
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		call	Input_Flush_116D1
		lea	ax, [bp+var_244]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		mov	[bp+var_1B], 0
		jmp	short loc_50C80

loc_50C64:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_50C73
		mov	[bp+var_1B], 1
		jmp	short loc_50C91

loc_50C73:
		lea	ax, [bp+var_244]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_50C80:
		push	[bp+var_C]
		call	sub_F947
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_50C64

loc_50C91:
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_50CE5
		xor	eax, eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	al, [bp+var_1]
		mov	ah, 0
		movsx	eax, ax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_20], eax
		mov	eax, dword_4DE15
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah

loc_50CE5:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		lea	ax, [bp+var_1A]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_252]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	0
		lea	ax, [bp+var_244]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_222], 498h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_222]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		lea	ax, [bp+var_17A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_F4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_50D73:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_50554		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50D85		proc far

var_132		= word ptr -132h
var_D5		= dword ptr -0D5h
var_D1		= dword ptr -0D1h
var_CD		= dword ptr -0CDh
var_C0		= word ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_8A		= word ptr -8Ah
var_3A		= word ptr -3Ah
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_20		= word ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_C		= word ptr -0Ch
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 132h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 1
		lea	ax, [bp+var_C]
		push	ax
		call	sub_1109C
		add	sp, 2
		lea	ax, [bp+var_16]
		push	ax
		call	sub_1109C
		add	sp, 2
		mov	[bp+var_1A], 0FFFFh
		cmp	byte ptr [si+0EDh], 0
		jnz	short loc_50DBC
		jmp	loc_513F4

loc_50DBC:
		lea	ax, [bp+var_132]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_132], 480h
		mov	[bp+var_D1], 100h
		mov	[bp+var_D5], 0
		mov	[bp+var_132], 498h
		mov	[bp+var_B6], 0
		xor	ax, ax
		mov	[bp+var_B8], ax
		movsx	eax, ax
		mov	[bp+var_CD], eax
		push	ds
		push	offset aIff
		push	ds
		push	offset aMisn2op
		push	ds
		push	offset a_
		lea	ax, [bp+var_8A]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		mov	bx, [bp+var_132]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4E564E49h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		lea	ax, [bp+var_132]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large 54495845h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_50E80
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_50E80:
		cmp	[bp+var_2], 5
		jnz	short loc_50E89
		jmp	loc_513D2

loc_50E89:
		push	ds
		push	offset aTm1
		push	ds
		push	offset aTmpsav
		push	ds
		push	offset a_
		lea	ax, [bp+var_8A]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_8A]
		push	ax
		push	si
		call	sub_47902
		add	sp, 4
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_50EF0
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strupr_2E71
		add	sp, 2
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_50EF0:
		mov	[bp+var_20], 0
		jmp	short loc_50F05

loc_50EF7:
		mov	bx, [bp+var_20]
		shl	bx, 1
		mov	word ptr [bx+si+262h], 0
		inc	[bp+var_20]

loc_50F05:
		cmp	[bp+var_20], 9
		jl	short loc_50EF7
		push	0
		push	large 534E5057h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_50F27
		jmp	loc_50FCA

loc_50F27:
		jmp	short loc_50F87

loc_50F29:
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2E], ax
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	byte ptr [bp+var_30+1], 0
		xor	di, di
		jmp	short loc_50F71

loc_50F52:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+1EEh]
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_50F70
		mov	byte ptr [bp+var_30+1], 1
		jmp	short loc_50F76

loc_50F70:
		inc	di

loc_50F71:
		cmp	di, 9
		jl	short loc_50F52

loc_50F76:
		cmp	byte ptr [bp+var_30+1], 0
		jz	short loc_50F87
		mov	bx, di
		shl	bx, 1
		mov	ax, [bp+var_2E]
		mov	[bx+si+262h], ax

loc_50F87:
		test	[bp+var_C0], 1
		jz	short loc_50FA6
		mov	eax, [bp+var_BC]
		dec	eax
		cmp	eax, [bp+var_CD]
		jnz	short loc_50FA4
		inc	[bp+var_CD]
		jmp	short loc_50FA4

loc_50FA4:
		jmp	short loc_50FA6

loc_50FA6:
		mov	eax, [bp+var_CD]
		cmp	eax, [bp+var_BC]
		jl	short loc_50FB7
		mov	ax, 1
		jmp	short loc_50FB9

loc_50FB7:
		xor	ax, ax

loc_50FB9:
		or	ax, ax
		jnz	short loc_50FC0
		jmp	loc_50F29

loc_50FC0:
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_50FCA:
		mov	word ptr [si+0EBh], 0
		push	0
		push	large 5354454Ah
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_5101E
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+0EBh], ax
		mov	ax, [si+0EBh]
		add	[si+3D5h], ax
		mov	ax, [si+0EBh]
		mov	dx, 1F4h
		imul	dx
		movzx	eax, ax
		mov	[si+288h], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_5101E:
		push	0
		push	large 54415453h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_5103A
		jmp	loc_510BB

loc_5103A:
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_18], ax
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_1C], ax
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+3D8h], al
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+3D9h], al
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+3DAh], al
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+3DBh], al
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+3D7h], al
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax
		jmp	short loc_510C8

loc_510BB:
		push	1Ch
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_510C8:
		movzx	eax, [bp+var_1C]
		add	[si+27Ch], eax
		push	0
		push	large 4C4C494Bh
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_510EE
		jmp	loc_511E0

loc_510EE:
		jmp	loc_5119D

loc_510F1:
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2E], ax
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_30], ax
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_1109C
		add	sp, 2
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_3A]
		push	ax
		call	CRT_Strupr_2E71
sub_50D85		endp

; ----------------------------------------------------------------------

sub_51136		proc far
		add	[bp+di+2C4h], al
		xor	di, di
		jmp	short loc_51198

loc_5113E:
		push	8
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 28Ch
		push	dx
		lea	ax, [bp-3Ah]
		push	ax
		call	sub_2D0F
		add	sp, 6
		or	ax, ax
		jnz	short loc_51197
		or	di, di
		jnz	short loc_51175
		cmp	word ptr [bp-2Eh], 0
		jnz	short loc_51170
		cmp	word ptr [bp-30h], 0
		jz	short loc_51175

loc_51170:
		mov	byte ptr [si+0EEh], 1

loc_51175:
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, [bp-2Eh]
		mov	bx, ax
		add	[bx+si+2A0h], dx
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, [bp-30h]
		mov	bx, ax
		add	[bx+si+2A2h], dx
		jmp	short loc_5119D

loc_51197:
		inc	di

loc_51198:
		cmp	di, 8
		jl	short loc_5113E

loc_5119D:
		test	word ptr [bp-0C0h], 1
		jz	short loc_511BC
		mov	eax, [bp-0BCh]
		dec	eax
		cmp	eax, [bp-0CDh]
		jnz	short loc_511BA
		inc	dword ptr [bp-0CDh]
		jmp	short loc_511BA

loc_511BA:
		jmp	short loc_511BC

loc_511BC:
		mov	eax, [bp-0CDh]
		cmp	eax, [bp-0BCh]
		jl	short loc_511CD
		mov	ax, 1
		jmp	short loc_511CF

loc_511CD:
		xor	ax, ax

loc_511CF:
		or	ax, ax
		jnz	short loc_511D6
		jmp	loc_510F1

loc_511D6:
		mov	eax, [bp-0BCh]
		mov	[bp-0CDh], eax

loc_511E0:
		push	55Eh
		mov	ax, si
		add	ax, 0F0h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0
		push	large 44454944h
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_5125D
		mov	eax, [bp-0C0h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp-2Dh], al
		mov	word ptr [bp-30h], 0
		jmp	short loc_51249

loc_51224:
		lea	ax, [bp-132h]
		push	ax
		mov	ax, si
		add	ax, 0F0h
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		xor	di, di
		jmp	short loc_51241

loc_5123B:
		mov	byte ptr [di+0EB6h], 0
		inc	di

loc_51241:
		cmp	di, 8
		jl	short loc_5123B
		inc	word ptr [bp-30h]

loc_51249:
		mov	al, [bp-2Dh]
		mov	ah, 0
		cmp	ax, [bp-30h]
		jg	short loc_51224
		mov	eax, [bp-0BCh]
		mov	[bp-0CDh], eax

loc_5125D:
		push	0
		push	large 524F4353h
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_5129B
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		add	[si+3DDh], eax
		mov	eax, [bp-0BCh]
		mov	[bp-0CDh], eax

loc_5129B:
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	1
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, [bp-132h]
		push	ax
		mov	bx, [bp-132h]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_512E5
		push	1Fh
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_512E5:
		push	0
		push	large 41544144h
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_5130B
		push	20h
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_5130B:
		lea	ax, [bp-2Ah]
		push	ax
		call	sub_1109C
		add	sp, 2
		mov	word ptr [bp-2Ch], 0
		jmp	short loc_5135A

loc_5131E:
		lea	ax, [bp-132h]
		push	ax
		lea	ax, [bp-2Ah]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp-2Ah]
		push	ax
		call	CRT_Strupr_2E71
		add	sp, 2
		lea	ax, [bp-2Ah]
		push	ax
		lea	ax, [bp-0Ch]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_51357
		mov	ax, [bp-2Ch]
		mov	[bp-1Ah], ax
		jmp	short loc_51390

loc_51357:
		inc	word ptr [bp-2Ch]

loc_5135A:
		test	word ptr [bp-0C0h], 1
		jz	short loc_51379
		mov	eax, [bp-0BCh]
		dec	eax
		cmp	eax, [bp-0CDh]
		jnz	short loc_51377
		inc	dword ptr [bp-0CDh]
		jmp	short loc_51377

loc_51377:
		jmp	short loc_51379

loc_51379:
		mov	eax, [bp-0CDh]
		cmp	eax, [bp-0BCh]
		jl	short loc_5138A
		mov	ax, 1
		jmp	short loc_5138C

loc_5138A:
		xor	ax, ax

loc_5138C:
		or	ax, ax
		jz	short loc_5131E

loc_51390:
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		cmp	word ptr [bp-1Ah], 0FFFFh
		jnz	short loc_513B0
		push	21h
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_513B0:
		cmp	word ptr [bp-18h], 0
		jz	short loc_513C0
		mov	bx, [bp-1Ah]
		mov	byte ptr [bx+si+1FEh], 1
		jmp	short loc_513C8

loc_513C0:
		mov	bx, [bp-1Ah]
		mov	byte ptr [bx+si+1FEh], 2

loc_513C8:
		mov	eax, [si+288h]
		sub	[si+27Ch], eax

loc_513D2:
		mov	word ptr [bp-132h], 498h
		lea	ax, [bp-132h]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp-132h]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_513F4:
		mov	byte ptr [si+0FAh], 0FFh
		mov	al, [bp-2]
		mov	[bp-1Eh], al
		mov	al, [bp-1Eh]
		pop	di
		pop	si
		leave
		retf
sub_51136		endp

; START OF FUNCTION CHUNK FOR sub_51136
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_51136

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Gameflow_SaveTmpState_4BBA0 (sub_4BBA0 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-22.
; Départ en vol (appelée par Gameflow_MainLoop_3D2E si [partie+0F9h] ≠ FEh) : passe à la
; mission suivante ([+0FAh] = [+0FBh], posé par la commande 0Dh ; [+0FBh] = FFh), retire de
; l'argent [+27Bh] les frais généraux [+27Fh] et les achats du catalogue [+283h] (ajoutés par
; Gameflow_Catalog_52662), remet [+283h] à 0, puis sauvegarde la partie dans tmpsav.tmp
; (Gameflow_SaveGameFile_4DAE8). GAMEFLOW_SYSTEM.md § 3.
; ==============================================================================================
Gameflow_SaveTmpState_5140A		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+0FCh]
		mov	[si+0FBh], al
		mov	byte ptr [si+0FCh], 0FFh
		mov	eax, [si+280h]
		add	eax, [si+284h]
		sub	[si+27Ch], eax
		mov	dword ptr [si+284h], 0
		push	ds
		push	offset aTm1
		push	ds
		push	offset aTmpsav
		push	ds
		push	offset a_
		lea	ax, [bp+var_50]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_50]
		push	ax
		push	si
		call	sub_47907
		add	sp, 4
		pop	si
		leave
		retf
Gameflow_SaveTmpState_5140A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51461		proc far

var_1F4		= word ptr -1F4h
var_197		= dword ptr -197h
var_193		= dword ptr -193h
var_18F		= dword ptr -18Fh
var_17E		= dword ptr -17Eh
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_14C		= word ptr -14Ch
var_EF		= dword ptr -0EFh
var_EB		= dword ptr -0EBh
var_E7		= dword ptr -0E7h
var_D2		= word ptr -0D2h
var_D0		= word ptr -0D0h
var_A4		= word ptr -0A4h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_E		= byte ptr -0Eh
var_C		= word ptr -0Ch
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1F4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	byte ptr [si+0FAh], 0FEh
		jnz	short loc_5147B
		jmp	loc_515E8

loc_5147B:
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_1F4], 480h
		mov	[bp+var_193], 100h
		mov	[bp+var_197], 0
		mov	[bp+var_1F4], 498h
		mov	[bp+var_178], 0
		xor	ax, ax
		mov	[bp+var_17A], ax
		movsx	eax, ax
		mov	[bp+var_18F], eax
		push	1
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, [bp+var_1F4]
		push	ax
		mov	bx, [bp+var_1F4]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_514F8
		push	22h
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_514F8:
		push	0
		push	large 41544144h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_5151E
		push	23h
		push	500h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_5151E:
		mov	[bp+var_36], 0
		jmp	short loc_5153D

loc_51525:
		push	large 8
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		inc	[bp+var_36]

loc_5153D:
		mov	al, [si+0FAh]
		mov	ah, 0
		cmp	ax, [bp+var_36]
		jge	short loc_51525
		mov	eax, [bp+var_17E]
		mov	[bp+var_18F], eax
		push	0
		push	large 4C545250h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_515B7
		mov	[bp+var_2], 1
		mov	[bp+var_36], 0
		jmp	short loc_5159E

loc_51576:
		push	large 8
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_1], al
		inc	[bp+var_36]

loc_5159E:
		mov	al, [si+0FAh]
		mov	ah, 0
		cmp	ax, [bp+var_36]
		jge	short loc_51576
		mov	[bp+var_E], 0
		mov	eax, [bp+var_17E]
		mov	[bp+var_18F], eax

loc_515B7:
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_1F4], 498h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	short loc_5160E

loc_515E8:
		push	55Fh
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_2], 1
		push	567h
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_1], 10h

loc_5160E:
		push	ds
		push	offset aIff
		push	ds
		push	offset aOp2misn
		push	ds
		push	offset a_
		lea	ax, [bp+var_A4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_14C], 480h
		mov	[bp+var_EB], 100h
		mov	[bp+var_EF], 0
		mov	[bp+var_14C], 498h
		mov	[bp+var_D0], 0
		xor	ax, ax
		mov	[bp+var_D2], ax
		movsx	eax, ax
		mov	[bp+var_E7], eax
		mov	[bp+var_14C], 5A5h
		push	0
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReadDispatch_411DE
		add	sp, 6
		mov	al, 0
		push	large 0
		push	large dword_48F4D
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_30193
		add	sp, 0Ah
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_30229
		add	sp, 2
		push	large 0
		push	large dword_48F52
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	large [bp+var_E7]
		push	large 8
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 8
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		push	large 0
		push	large dword_48F57
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_51766

loc_51700:
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+si+262h], 0
		jz	short loc_51765
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+262h]
		mov	[bp+var_18], ax
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+1EEh]
		mov	[bp+var_1A], ds
		mov	[bp+var_1C], ax
		push	large [bp+var_E7]
		push	large 8
		push	[bp+var_1A]
		push	[bp+var_1C]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 8

loc_51765:
		inc	di

loc_51766:
		cmp	di, 9
		jl	short loc_51700
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		cmp	byte ptr [si+0EFh], 0
		jnz	short loc_51782
		jmp	loc_51A4C

loc_51782:
		push	large 0
		push	large dword_48F5C
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_30193
		add	sp, 0Ah
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_30229
		add	sp, 2
		push	large 0
		push	large dword_48F61
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_30193
		add	sp, 0Ah
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_30229
		add	sp, 2
		push	large 0
		push	large dword_48F66
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_517E4

loc_517DF:
		mov	byte ptr [bp+di+var_38], 0
		inc	di

loc_517E4:
		cmp	di, 4
		jl	short loc_517DF
		xor	di, di
		jmp	loc_518B6

loc_517EE:
		mov	bx, di
		shl	bx, 1
		cmp	byte ptr [bx+si+274h], 0FFh
		jnz	short loc_517FC
		jmp	loc_518B5

loc_517FC:
		mov	al, byte ptr [bp+di+var_38]
		mov	ah, 0
		or	ax, ax
		jz	short loc_51808
		jmp	loc_518B5

loc_51808:
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+275h]
		mov	ah, 0
		shl	ax, 1
		mov	[bp+var_4C], ax
		mov	ax, di
		inc	ax
		mov	[bp+var_4E], ax
		jmp	short loc_51850

loc_5181F:
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+274h]
		mov	bx, [bp+var_4E]
		shl	bx, 1
		cmp	al, [bx+si+274h]
		jnz	short loc_5184D
		mov	bx, [bp+var_4E]
		shl	bx, 1
		mov	al, [bx+si+275h]
		mov	ah, 0
		shl	ax, 1
		add	[bp+var_4C], ax
		lea	ax, [bp+var_38]
		mov	bx, [bp+var_4E]
		add	bx, ax
		mov	byte ptr [bx], 1

loc_5184D:
		inc	[bp+var_4E]

loc_51850:
		cmp	[bp+var_4E], 4
		jl	short loc_5181F
		mov	ax, [bp+var_4C]
		mov	[bp+var_50], ax
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+274h]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	ax, [bx+1EEh]
		mov	[bp+var_52], ds
		mov	[bp+var_54], ax
		push	large [bp+var_E7]
		push	large 8
		push	[bp+var_52]
		push	[bp+var_54]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 8

loc_518B5:
		inc	di

loc_518B6:
		cmp	di, 4
		jge	short loc_518BE
		jmp	loc_517EE

loc_518BE:
		mov	[bp+var_3A], 3E8h
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		mov	ax, word_48BE0
		mov	[bp+var_3C], ds
		mov	[bp+var_3E], ax
		push	large [bp+var_E7]
		push	large 8
		push	[bp+var_3C]
		push	[bp+var_3E]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 8
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		push	large 0
		push	large dword_48F6B
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		mov	al, [si+6]
		mov	ah, 0
		or	ax, ax
		jz	short loc_51940
		cmp	ax, 1
		jz	short loc_5198D
		jmp	loc_519D9

loc_51940:
		mov	[bp+var_40], 1Eh
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		mov	[bp+var_42], 1Eh
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		jmp	loc_51A25

loc_5198D:
		mov	[bp+var_44], 3Ch
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		mov	[bp+var_46], 3Ch
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_46]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		jmp	short loc_51A25

loc_519D9:
		mov	[bp+var_48], 1Eh
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		mov	[bp+var_4A], 1Eh
		push	large [bp+var_E7]
		push	large 2
		push	ss
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 2
		jmp	short loc_51A25

loc_51A25:
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_SeekAndRelease_302BA
		add	sp, 2
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_SeekAndRelease_302BA
		add	sp, 2

loc_51A4C:
		push	large 0
		push	large dword_48F70
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		mov	ax, si
		add	ax, 3ADh
		mov	[bp+var_1E], ds
		mov	[bp+var_20], ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	CRT_Strlen
		add	sp, 2
		movzx	eax, ax
		mov	[bp+var_24], eax
		push	large [bp+var_E7]
		push	large [bp+var_24]
		push	[bp+var_1E]
		push	[bp+var_20]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		mov	eax, [bp+var_24]
		add	[bp+var_E7], eax
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		push	large 0
		push	large dword_48F75
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		mov	ax, si
		add	ax, 399h
		mov	[bp+var_26], ds
		mov	[bp+var_28], ax
		mov	ax, si
		add	ax, 399h
		push	ax
		call	CRT_Strlen
		add	sp, 2
		movzx	eax, ax
		mov	[bp+var_2C], eax
		push	large [bp+var_E7]
		push	large [bp+var_2C]
		push	[bp+var_26]
		push	[bp+var_28]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		mov	eax, [bp+var_2C]
		add	[bp+var_E7], eax
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		push	large 0
		push	large dword_48F7A
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		mov	ax, si
		add	ax, 3C1h
		mov	[bp+var_2E], ds
		mov	[bp+var_30], ax
		mov	ax, si
		add	ax, 3C1h
		push	ax
		call	CRT_Strlen
		add	sp, 2
		movzx	eax, ax
		mov	[bp+var_34], eax
		push	large [bp+var_E7]
		push	large [bp+var_34]
		push	[bp+var_2E]
		push	[bp+var_30]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		mov	eax, [bp+var_34]
		add	[bp+var_E7], eax
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		push	large 0
		push	large dword_48F7F
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		cmp	byte ptr [si+35Dh], 0
		jz	short loc_51BED
		mov	ax, si
		add	ax, 35Dh
		mov	[bp+var_40], ax
		push	8
		push	[bp+var_40]
		lea	ax, [bp+var_3E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_36], 0
		lea	ax, [bp+var_3E]
		mov	[bp+var_42], ax
		mov	ax, [bp+var_42]
		mov	[bp+var_44], ds
		mov	[bp+var_46], ax
		push	large [bp+var_E7]
		push	large 8
		push	[bp+var_44]
		push	[bp+var_46]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 8

loc_51BED:
		cmp	byte ptr [si+371h], 0
		jz	short loc_51C41
		mov	ax, si
		add	ax, 371h
		mov	[bp+var_40], ax
		push	8
		push	[bp+var_40]
		lea	ax, [bp+var_3E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_36], 0
		lea	ax, [bp+var_3E]
		mov	[bp+var_42], ax
		mov	ax, [bp+var_42]
		mov	[bp+var_44], ds
		mov	[bp+var_46], ax
		push	large [bp+var_E7]
		push	large 8
		push	[bp+var_44]
		push	[bp+var_46]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 8

loc_51C41:
		cmp	byte ptr [si+385h], 0
		jz	short loc_51C95
		mov	ax, si
		add	ax, 385h
		mov	[bp+var_40], ax
		push	8
		push	[bp+var_40]
		lea	ax, [bp+var_3E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_36], 0
		lea	ax, [bp+var_3E]
		mov	[bp+var_42], ax
		mov	ax, [bp+var_42]
		mov	[bp+var_44], ds
		mov	[bp+var_46], ax
		push	large [bp+var_E7]
		push	large 8
		push	[bp+var_44]
		push	[bp+var_46]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_E7], 8

loc_51C95:
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_SeekAndRelease_302BA
		add	sp, 2
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_302D2
		add	sp, 2
		cmp	[bp+var_2], 0
		jz	short loc_51CFE
		push	ds
		push	offset aPak
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	ds
		push	offset unk_48F84
		lea	ax, [bp+var_A4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_993C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_51CFE
		mov	al, [bp+var_1]
		mov	ah, 0
		push	ax
		call	PagedResourceC_RefreshAndFinalize_35E0F
		add	sp, 2

loc_51CFE:
		mov	[bp+var_14C], 498h
		lea	ax, [bp+var_14C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_51461		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51D24		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_51D5E
		mov	word ptr [si], 498h
		push	si
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		test	di, 1
		jz	short loc_51D5C
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_51D5C

loc_51D5C:
		jmp	short loc_51D5E

loc_51D5E:
		pop	di
		pop	si
		pop	bp
		retf
sub_51D24		endp

; START OF FUNCTION CHUNK FOR sub_51D24
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_51D24

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51D66		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_432C3
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_51D66		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51D79		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_51DA6
		mov	word ptr [si], 5BDh
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		test	di, 1
		jz	short loc_51DA6
		push	si
		call	sub_39C
		add	sp, 2

loc_51DA6:
		pop	di
		pop	si
		pop	bp
		retf
sub_51D79		endp
ovr188		ends
