ovr196		segment	para public 'OVERLAY' use16
		assume cs:ovr196
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65E10		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		or	si, si
		jnz	short loc_65E30
		push	107h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_65E9E

loc_65E30:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[si], ax
		mov	ax, [bp+arg_4]
		mov	[si+2], ax
		mov	word ptr [si+4], 1
		or	di, di
		jnz	short loc_65E71
		cmp	word ptr [si], 2
		jle	short loc_65E6E
		mov	bx, [si+2]
		mov	bx, [bx+2]
		cmp	dword ptr [bx], 69677546h
		jnz	short loc_65E6E
		mov	bx, [si+2]
		mov	di, [bx+4]
		jmp	short loc_65E71

loc_65E6E:
		mov	di, 1472h

loc_65E71:
		or	di, di
		jz	short loc_65E95
		push	ds
		push	di
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_65E95
		push	1
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		mov	bx, [si+6]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_65E95:
		mov	dword ptr [si+103h], 0

loc_65E9E:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_65E10		endp

; START OF FUNCTION CHUNK FOR sub_65E10
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_65E10

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65EA8		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [si+4]
		cmp	ax, [si]
		jge	short loc_65ED4
		mov	ax, [si+4]
		inc	word ptr [si+4]
		shl	ax, 1
		mov	bx, [si+2]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_2], ax
		jmp	loc_65FEF

loc_65ED4:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ValidateState_412A1
		add	sp, 2
		or	al, al
		jnz	short loc_65EE9
		jmp	loc_65FEF

loc_65EE9:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		mov	eax, [si+103h]
		cmp	eax, [bp+var_6]
		jl	short loc_65F12
		jmp	loc_65FEF

loc_65F12:
		push	large [si+103h]
		push	large 0A0h
		push	ds
		mov	ax, si
		add	ax, 63h
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ReadTyped_4148D
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Eh
		mov	[bp+var_A], eax
		mov	ax, si
		add	ax, 63h
		mov	[bp+var_2], ax
		mov	[bp+var_C], 0
		mov	[bp+var_E], 0
		xor	di, di

loc_65F53:
		mov	bx, di
		mov	al, [bx+si+63h]
		cbw
		mov	dx, ax
		or	dx, dx
		jz	short loc_65F64
		cmp	dx, 1Bh
		jnz	short loc_65F83

loc_65F64:
		mov	bx, di
		mov	byte ptr [bx+si+63h], 0
		or	di, di
		jnz	short loc_65F73
		mov	[bp+var_2], 0

loc_65F73:
		mov	eax, [bp+var_6]
		mov	[si+103h], eax
		mov	[bp+var_C], 1
		jmp	short loc_65FD3

loc_65F83:
		cmp	dx, 0Dh
		jz	short loc_65F8D
		cmp	dx, 0Ah
		jnz	short loc_65FA3

loc_65F8D:
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx], 0
		jz	short loc_65F9A
		mov	[bp+var_E], 1

loc_65F9A:
		mov	bx, di
		mov	byte ptr [bx+si+63h], 0
		inc	di
		jmp	short loc_65FD3

loc_65FA3:
		cmp	[bp+var_E], 0
		jz	short loc_65FB0
		mov	[bp+var_C], 1
		jmp	short loc_65FD3

loc_65FB0:
		cmp	[bp+var_2], 0
		jnz	short loc_65FC0
		mov	ax, si
		add	ax, di
		add	ax, 63h
		mov	[bp+var_2], ax

loc_65FC0:
		inc	di
		mov	ax, di
		movsx	eax, ax
		cmp	eax, [bp+var_A]
		jnz	short loc_65FD3
		mov	bx, di
		mov	byte ptr [bx+si+63h], 0

loc_65FD3:
		cmp	[bp+var_C], 0
		jnz	short loc_65FE6
		movsx	eax, di
		cmp	eax, [bp+var_A]
		jge	short loc_65FE6
		jmp	loc_65F53

loc_65FE6:
		movsx	eax, di
		add	[si+103h], eax

loc_65FEF:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_65EA8		endp

; START OF FUNCTION CHUNK FOR sub_65EA8
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_65EA8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65FFA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	bx, bx
		mov	ax, 1500h
		int	2Fh
		mov	di, bx
		mov	ax, di
		inc	ax
		mov	[bp+var_2], ax
		call	sub_4CD
		mov	[si], al
		or	di, di
		jz	short loc_6602D
		mov	ax, ds
		mov	es, ax
		mov	ax, si
		inc	ax
		mov	bx, ax
		mov	ax, 150Dh
		int	2Fh

loc_6602D:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_65FFA		endp

; START OF FUNCTION CHUNK FOR sub_65FFA
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_65FFA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66038		proc far

var_1E		= word ptr -1Eh
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_1], 0
		push	5Ch
		push	[bp+arg_2]
		call	CRT_Strchr_WordAligned
		add	sp, 4
		or	ax, ax
		jnz	short loc_66069
		push	3Ah
		push	[bp+arg_2]
		call	CRT_Strchr_WordAligned
		add	sp, 4
		or	ax, ax
		jz	short loc_6609C

loc_66069:
		push	ds
		push	[bp+arg_2]
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_66085
		cmp	byte_49DF3, 0
		jnz	short loc_66085
		mov	ax, 1
		jmp	short loc_66087

loc_66085:
		xor	ax, ax

loc_66087:
		mov	[bp+var_1], al
		or	al, al
		jz	short loc_6609A
		push	[bp+arg_2]
		push	di
		call	CRT_Strcpy
		add	sp, 4

loc_6609A:
		jmp	short loc_66106

loc_6609C:
		xor	si, si
		lea	ax, [bp+var_1E]
		push	ax
		push	cs
		call	near ptr sub_65FFA
		add	sp, 2
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 1Ah
		jle	short loc_660B7
		mov	[bp+var_4], 1Ah

loc_660B7:
		push	[bp+arg_2]
		mov	ax, di
		add	ax, 2
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [di+1], 3Ah

loc_660CC:
		mov	byte_49DF3, 0
		mov	al, byte ptr [bp+si+var_1E]
		add	al, 41h
		mov	[di], al
		inc	si
		push	ds
		push	di
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_660F3
		cmp	byte_49DF3, 0
		jnz	short loc_660F3
		mov	ax, 1
		jmp	short loc_660F5

loc_660F3:
		xor	ax, ax

loc_660F5:
		mov	[bp+var_1], al
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_66106
		cmp	si, [bp+var_4]
		jl	short loc_660CC

loc_66106:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_66038		endp

; START OF FUNCTION CHUNK FOR sub_66038
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_66038

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66111		proc far

var_1B2		= word ptr -1B2h
var_162		= word ptr -162h
var_15C		= word ptr -15Ch
var_5A		= dword ptr -5Ah
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
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
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1B2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_49DEC
		mov	ah, 0
		or	ax, ax
		jz	short loc_66129
		jmp	loc_66F24

loc_66129:
		mov	byte ptr [si+2Fh], 1
		mov	byte ptr [si+27h], 3
		mov	byte ptr [bp+var_2], 3
		lea	ax, [bp+var_2]
		push	ax
		call	sub_2F3A2
		add	sp, 2
		cmp	byte ptr [bp+var_2], 13h
		jz	short loc_66159
		mov	byte ptr [bp+var_2], 13h
		lea	ax, [bp+var_2]
		push	ax
		call	sub_2F3CA
		add	sp, 2
		jmp	short loc_66165

loc_66159:
		cmp	word_49E50, 0
		jnz	short loc_66165
		call	sub_35C96

loc_66165:
		cmp	word_49E50, 0
		jnz	short loc_66176
		push	0
		call	sub_349D7
		add	sp, 2

loc_66176:
		mov	[bp+var_3], 1
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0FFFFh
		mov	[bp+var_7], 0
		mov	[bp+var_A], 0FFFFh
		mov	[bp+var_C], 0FFFFh
		mov	[bp+var_E], 0FFFFh
		mov	[bp+var_10], 0FFFFh
		mov	[bp+var_11], 0
		push	0
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_162]
		push	ax
		push	cs
		call	near ptr sub_65E10
		add	sp, 8
		mov	[bp+var_12], 0
		or	byte_4F674, 2
		push	6C30h
		call	sub_35F71
		add	sp, 2
		jmp	loc_66444

loc_661CA:
		mov	al, [di]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		cmp	ax, 2Bh
		jnz	short loc_661DE
		jmp	loc_66322

loc_661DE:
		cmp	ax, 2Dh
		jz	short loc_661EE
		cmp	ax, 3Dh
		jnz	short loc_661EB
		jmp	loc_66390

loc_661EB:
		jmp	loc_66444

loc_661EE:
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		sub	ax, 44h
		mov	bx, ax
		cmp	bx, 15h
		jbe	short loc_66208
		jmp	loc_6631F

loc_66208:
		shl	bx, 1
		jmp	cs:off_66F28[bx]	; switch jump

loc_6620F:
		mov	byte_4CA67, 1
		jmp	loc_6631F

loc_66217:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		cmp	ax, 41h
		jz	short loc_6622B
		jmp	short loc_6623D

loc_6622B:
		mov	[bp+var_11], 1
		mov	al, [bp+var_4]
		cbw
		or	ax, ax
		jnz	short loc_6623B
		mov	[bp+var_4], 41h

loc_6623B:
		jmp	short loc_6626C

loc_6623D:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		mov	[bp+var_4], al
		cmp	byte ptr [di+3], 0
		jz	short loc_6626A
		push	10h
		lea	ax, word ptr [bp+var_5A+2]
		push	ax
		mov	ax, di
		add	ax, 3
		push	ax
		call	sub_2D9C
		add	sp, 6
		mov	[bp+var_6], ax

loc_6626A:
		jmp	short loc_6626C

loc_6626C:
		jmp	loc_6631F

loc_6626F:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		mov	[bp+var_7], al
		cmp	byte ptr [di+3], 0
		jz	short loc_662D4
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	dx, ax
		mov	ax, dx
		shl	ax, 4
		add	ax, 200h
		mov	[bp+var_A], ax
		cmp	byte ptr [di+4], 0
		jz	short loc_662D4
		mov	al, [di+4]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_662B4
		mov	[bp+var_C], 0Ah

loc_662B4:
		cmp	byte ptr [di+5], 0
		jz	short loc_662D4
		mov	al, [di+5]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_E], ax
		cmp	byte ptr [di+6], 0
		jz	short loc_662D4
		mov	al, [di+6]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_10], ax

loc_662D4:
		jmp	short loc_6631F

loc_662D6:
		mov	byte_49DED, 0
		jmp	short loc_6631F

loc_662DD:
		mov	byte_49DEE, 0
		jmp	short loc_6631F

loc_662E4:
		mov	byte ptr [si+2Fh], 0
		jmp	short loc_6631F

loc_662EA:
		or	byte_4F674, 2
		push	6C30h
		call	sub_35F71
		add	sp, 2
		jmp	short loc_6631F

loc_662FC:
		mov	byte_4D394, 0
		jmp	short loc_6631F

loc_66303:
		mov	eax, [di+1]
		or	eax, 20202020h
		mov	[bp+var_5A], eax
		cmp	[bp+var_5A], 6E726179h
		jnz	short loc_6631F
		mov	[bp+var_3], 0

loc_6631F:
		jmp	loc_66444

loc_66322:
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		cmp	ax, 4Fh
		jz	short loc_66374
		jg	short loc_66342
		cmp	ax, 45h
		jz	short loc_66366
		cmp	ax, 4Ch
		jz	short loc_6634E
		jmp	short loc_6638D

loc_66342:
		cmp	ax, 54h
		jz	short loc_6636D
		cmp	ax, 57h
		jz	short loc_6637B
		jmp	short loc_6638D

loc_6634E:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		cmp	ax, 42h
		jnz	short loc_66364
		mov	[bp+var_12], 1

loc_66364:
		jmp	short loc_6638D

loc_66366:
		mov	byte_49DED, 1
		jmp	short loc_6638D

loc_6636D:
		mov	byte_49DEE, 1
		jmp	short loc_6638D

loc_66374:
		mov	byte_4D394, 1
		jmp	short loc_6638D

loc_6637B:
		and	byte_4F674, 0FDh
		push	6C30h
		call	sub_35F71
		add	sp, 2
		jmp	short loc_6638D

loc_6638D:
		jmp	loc_66444

loc_66390:
		mov	ax, di
		inc	ax
		push	ax
		lea	ax, [bp+var_1B2]
		push	ax
		push	cs
		call	near ptr sub_66038
		add	sp, 4
		or	al, al
		jz	short loc_6641B
		push	12Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_5A], ax
		or	ax, ax
		jz	short loc_663E5
		push	word ptr [bp+var_5A]
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	bx, word ptr [bp+var_5A]
		mov	word ptr [bx], 152Ah
		mov	bx, word ptr [bp+var_5A]
		mov	dword ptr [bx+0DDh], 0
		mov	bx, word ptr [bp+var_5A]
		mov	dword ptr [bx+0E1h], 0
		mov	ax, word ptr [bp+var_5A]
		jmp	short loc_663E8

loc_663E5:
		mov	ax, word ptr [bp+var_5A]

loc_663E8:
		mov	word ptr [bp+var_5A+2], ax
		lea	ax, [bp+var_1B2]
		push	ax
		push	word ptr [bp+var_5A+2]
		call	sub_40D68
		add	sp, 4
		or	al, al
		jz	short loc_66401
		jmp	short loc_66419

loc_66401:
		cmp	word ptr [bp+var_5A+2], 0
		jz	short loc_66419
		push	3
		push	word ptr [bp+var_5A+2]
		mov	bx, word ptr [bp+var_5A+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_66419

loc_66419:
		jmp	short loc_66442

loc_6641B:
		call	sub_35DEB
		mov	ax, di
		inc	ax
		push	ax
		call	CRT_Strupr_2E71
		add	sp, 2
		push	ax
		push	1479h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		push	1
		call	CRT_Exit
		add	sp, 2

loc_66442:
		jmp	short loc_66444

loc_66444:
		lea	ax, [bp+var_162]
		push	ax
		push	cs
		call	near ptr sub_65EA8
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_66459
		jmp	loc_661CA

loc_66459:
		cmp	word_49E50, 0
		jz	short loc_66473
		push	0
		push	word_49E50
		push	6C14h
		call	Memory_TypedFreeVariant_327C3
		add	sp, 6
		jmp	short loc_66492

loc_66473:
		cmp	byte_49DED, 0
		jz	short loc_66492
		push	0
		push	0
		call	PagedMemory_ReadTextResource_52D8
		add	sp, 2
		push	ax
		push	6C14h
		call	Memory_TypedFreeVariant_327C3
		add	sp, 6

loc_66492:
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_47BFA
		add	sp, 2
		push	6C14h
		call	TextRenderer_ReleaseCachedGlyph_2EE54
		add	sp, 2
		call	sub_32170
		shl	eax, 10h
		shrd	eax, edx, 10h
		push	eax
		call	sub_42181
		shl	eax, 10h
		shrd	eax, edx, 10h
		pop	edx
		add	edx, eax
		mov	dword_4F47C, edx
		push	14h
		call	sub_41FAE
		add	sp, 2
		push	large 7A120h
		call	sub_42169
		add	sp, 4
		mov	al, [bp+var_4]
		cbw
		cmp	ax, 52h
		jz	short loc_6651C
		jg	short loc_66509
		cmp	ax, 41h
		jnz	short loc_664FE
		jmp	loc_665FC

loc_664FE:
		cmp	ax, 47h
		jnz	short loc_66506
		jmp	loc_666D5

loc_66506:
		jmp	loc_66962

loc_66509:
		cmp	ax, 55h
		jnz	short loc_66511
		jmp	loc_66889

loc_66511:
		cmp	ax, 57h
		jnz	short loc_66519
		jmp	loc_667AF

loc_66519:
		jmp	loc_66962

loc_6651C:
		mov	byte_4CA58, 1
		mov	ax, [bp+var_6]
		mov	[bp+var_14], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_16], ax
		or	ax, ax
		jnz	short loc_6653B
		jmp	loc_665ED

loc_6653B:
		mov	bx, [bp+var_16]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_16]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_16]
		mov	word_4D392, ax
		mov	bx, [bp+var_16]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_16]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_16]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_16]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_16]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_16]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_16]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_16]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_16]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_16]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_16]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_16]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_16]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_16]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	[bp+var_14]
		push	14D0h
		push	[bp+var_16]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_16]
		jmp	short loc_665F0

loc_665ED:
		mov	ax, [bp+var_16]

loc_665F0:
		mov	word_4CA59, ax
		mov	ax, word_4CA59
		mov	word_4CA5D, ax
		jmp	loc_66962

loc_665FC:
		mov	byte_4CA58, 3
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18], ax
		or	ax, ax
		jnz	short loc_66615
		jmp	loc_666C6

loc_66615:
		mov	bx, [bp+var_18]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_18]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_18]
		mov	word_4D392, ax
		mov	bx, [bp+var_18]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_18]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_18]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_18]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_18]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_18]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_18]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_18]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	14D7h
		push	[bp+var_18]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_18]
		jmp	short loc_666C9

loc_666C6:
		mov	ax, [bp+var_18]

loc_666C9:
		mov	word_4CA59, ax
		mov	ax, word_4CA59
		mov	word_4CA5D, ax
		jmp	loc_66962

loc_666D5:
		mov	byte_4CA58, 2
		mov	ax, [bp+var_6]
		mov	[bp+var_1A], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1C], ax
		or	ax, ax
		jnz	short loc_666F4
		jmp	loc_667A6

loc_666F4:
		mov	bx, [bp+var_1C]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_1C]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_1C]
		mov	word_4D392, ax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_1C]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_1C]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_1C]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_1C]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_1C]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	[bp+var_1A]
		push	14DDh
		push	[bp+var_1C]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_1C]
		jmp	short loc_667A9

loc_667A6:
		mov	ax, [bp+var_1C]

loc_667A9:
		mov	word_4CA59, ax
		jmp	loc_66962

loc_667AF:
		mov	byte_4CA58, 4
		mov	ax, [bp+var_6]
		mov	[bp+var_1E], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_20], ax
		or	ax, ax
		jnz	short loc_667CE
		jmp	loc_66880

loc_667CE:
		mov	bx, [bp+var_20]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_20]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_20]
		mov	word_4D392, ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_20]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_20]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_20]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_20]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_20]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_20]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_20]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	[bp+var_1E]
		push	14E2h
		push	[bp+var_20]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_20]
		jmp	short loc_66883

loc_66880:
		mov	ax, [bp+var_20]

loc_66883:
		mov	word_4CA59, ax
		jmp	loc_66962

loc_66889:
		mov	byte_4CA58, 5
		mov	ax, [bp+var_6]
		mov	[bp+var_22], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_24], ax
		or	ax, ax
		jnz	short loc_668A8
		jmp	loc_6695A

loc_668A8:
		mov	bx, [bp+var_24]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_24]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_24]
		mov	word_4D392, ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_24]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_24]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_24]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_24]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_24]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_24]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_24]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	[bp+var_22]
		push	14E7h
		push	[bp+var_24]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_24]
		jmp	short loc_6695D

loc_6695A:
		mov	ax, [bp+var_24]

loc_6695D:
		mov	word_4CA59, ax
		jmp	short loc_66962

loc_66962:
		cmp	word_4CA59, 0
		jz	short loc_6696E
		mov	byte_4F554, 1

loc_6696E:
		mov	al, [bp+var_7]
		cbw
		cmp	ax, 50h
		jnz	short loc_6697A
		jmp	loc_66A74

loc_6697A:
		cmp	ax, 53h
		jz	short loc_6698A
		cmp	ax, 55h
		jnz	short loc_66987
		jmp	loc_66B5E

loc_66987:
		jmp	loc_66C47

loc_6698A:
		mov	ax, [bp+var_A]
		mov	[bp+var_26], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_E]
		mov	[bp+var_2A], ax
		mov	ax, [bp+var_10]
		mov	[bp+var_2C], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2E], ax
		or	ax, ax
		jnz	short loc_669B6
		jmp	loc_66A6B

loc_669B6:
		mov	bx, [bp+var_2E]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_2E]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_2E]
		mov	word_4D392, ax
		mov	bx, [bp+var_2E]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_2E]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_2E]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_2E]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_2E]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_2E]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_2E]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_2E]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	[bp+var_2C]
		push	[bp+var_2A]
		push	[bp+var_28]
		push	[bp+var_26]
		push	14EDh
		push	[bp+var_2E]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_2E]
		jmp	short loc_66A6E

loc_66A6B:
		mov	ax, [bp+var_2E]

loc_66A6E:
		mov	word_4CA5B, ax
		jmp	loc_66C47

loc_66A74:
		mov	ax, [bp+var_A]
		mov	[bp+var_30], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_E]
		mov	[bp+var_34], ax
		mov	ax, [bp+var_10]
		mov	[bp+var_36], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_38], ax
		or	ax, ax
		jnz	short loc_66AA0
		jmp	loc_66B55

loc_66AA0:
		mov	bx, [bp+var_38]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_38]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_38]
		mov	word_4D392, ax
		mov	bx, [bp+var_38]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_38]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_38]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_38]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_38]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_38]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_38]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_38]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_38]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_38]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_38]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_38]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	[bp+var_36]
		push	[bp+var_34]
		push	[bp+var_32]
		push	[bp+var_30]
		push	14F0h
		push	[bp+var_38]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_38]
		jmp	short loc_66B58

loc_66B55:
		mov	ax, [bp+var_38]

loc_66B58:
		mov	word_4CA5B, ax
		jmp	loc_66C47

loc_66B5E:
		mov	ax, [bp+var_A]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_E]
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_10]
		mov	[bp+var_40], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_42], ax
		or	ax, ax
		jnz	short loc_66B8A
		jmp	loc_66C3F

loc_66B8A:
		mov	bx, [bp+var_42]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_42]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_42]
		mov	word_4D392, ax
		mov	bx, [bp+var_42]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_42]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_42]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_42]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_42]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_42]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_42]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_42]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_42]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_42]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_42]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_42]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_42]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_42]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	1
		push	[bp+var_40]
		push	[bp+var_3E]
		push	[bp+var_3C]
		push	[bp+var_3A]
		push	14F4h
		push	[bp+var_42]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_42]
		jmp	short loc_66C42

loc_66C3F:
		mov	ax, [bp+var_42]

loc_66C42:
		mov	word_4CA5B, ax
		jmp	short loc_66C47

loc_66C47:
		cmp	word_4CA5B, 0
		jz	short loc_66C56
		mov	al, 1
		mov	byte_4F557, al
		mov	byte_4F556, al

loc_66C56:
		cmp	word_4CA5D, 0
		jz	short loc_66C60
		jmp	loc_66D34

loc_66C60:
		cmp	[bp+var_11], 0
		jnz	short loc_66C69
		jmp	loc_66D34

loc_66C69:
		push	7Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_44], ax
		or	ax, ax
		jnz	short loc_66C7D
		jmp	loc_66D2E

loc_66C7D:
		mov	bx, [bp+var_44]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_44]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_44]
		mov	word_4D392, ax
		mov	bx, [bp+var_44]
		mov	word ptr [bx], 1522h
		mov	bx, [bp+var_44]
		mov	word ptr [bx+8], 1B4h
		mov	bx, [bp+var_44]
		mov	ax, word_4D392
		mov	[bx+0Ah], ax
		mov	ax, [bp+var_44]
		add	ax, 8
		mov	word_4D392, ax
		mov	bx, [bp+var_44]
		mov	word ptr [bx+8], 1BCh
		mov	bx, [bp+var_44]
		mov	dword ptr [bx+0Ch], 0
		mov	bx, [bp+var_44]
		mov	byte ptr [bx+10h], 0
		mov	bx, [bp+var_44]
		mov	word ptr [bx+12h], 1B4h
		mov	bx, [bp+var_44]
		mov	ax, word_4D392
		mov	[bx+14h], ax
		mov	ax, [bp+var_44]
		add	ax, 12h
		mov	word_4D392, ax
		mov	bx, [bp+var_44]
		mov	word ptr [bx+12h], 1BCh
		mov	bx, [bp+var_44]
		mov	dword ptr [bx+16h], 0
		mov	bx, [bp+var_44]
		mov	byte ptr [bx+1Ah], 0
		mov	ax, [bp+var_44]
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		push	0
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	14FAh
		push	[bp+var_44]
		call	sub_ADCA
		add	sp, 0Eh
		mov	ax, [bp+var_44]
		jmp	short loc_66D31

loc_66D2E:
		mov	ax, [bp+var_44]

loc_66D31:
		mov	word_4CA5D, ax

loc_66D34:
		cmp	word_4CA5D, 0
		jz	short loc_66D40
		mov	byte_4F555, 1

loc_66D40:
		cmp	[bp+arg_6], 0
		jnz	short loc_66D49
		jmp	loc_66E11

loc_66D49:
		push	2
		push	[bp+arg_6]
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_48+2], dx
		mov	word ptr [bp+var_48], ax
		mov	eax, [bp+var_48]
		mov	[bp+var_52], eax
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 1
		mov	[bp+var_4C], 0
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	word_49DF8, ax
		cmp	[bp+var_4D], 0
		jz	short loc_66DA9
		cmp	[bp+var_52], 0
		jz	short loc_66DA9
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_66DA9

loc_66DA9:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		mov	bx, word_49DF8
		mov	word ptr [bx+10h], 1
		mov	bx, word_49DF8
		mov	word ptr [bx+12h], 0
		push	2Dh
		push	word_49DF8
		mov	bx, word_49DF8
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, word_49DF8
		mov	[bx+14h], ax
		push	word_49DF8
		push	word_4D36E
		push	0
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	word_49DFA, ax
		push	0Fh
		push	word_49DFA
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	ax, word_49DFA
		mov	word_4BD04, ax

loc_66E11:
		push	0
		call	sub_45168
		add	sp, 2
		or	al, al
		jz	short loc_66E31
		push	0
		push	0
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_47BF5
		add	sp, 6

loc_66E31:
		push	1
		call	sub_45168
		add	sp, 2
		or	al, al
		jz	short loc_66E59
		push	1
		call	sub_451CD
		add	sp, 2
		mov	word_4A51D, ax
		cmp	word_4A51D, 0
		jnz	short loc_66E59
		mov	word_4A51D, 118h

loc_66E59:
		mov	byte_4D394, 1
		cmp	byte_4F554, 0
		jz	short loc_66EDE
		mov	ax, word_4CA59
		mov	[bp+var_54], ax
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_56], ax
		or	ax, ax
		jz	short loc_66ED8
		mov	bx, [bp+var_56]
		mov	word ptr [bx], 1B4h
		mov	bx, [bp+var_56]
		mov	ax, word_4D392
		mov	[bx+2], ax
		mov	ax, [bp+var_56]
		mov	word_4D392, ax
		mov	bx, [bp+var_56]
		mov	word ptr [bx], 151Ah
		mov	byte_4A67F, 1
		mov	word_4A680, 0
		mov	ax, [bp+var_54]
		mov	word_4A686, ax
		push	word_4A686
		push	6569h
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	word_4A686
		push	657Bh
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	[bp+var_56]
		call	sub_47C89
		add	sp, 2
		mov	ax, [bp+var_56]
		jmp	short loc_66EDB

loc_66ED8:
		mov	ax, [bp+var_56]

loc_66EDB:
		mov	word_4CA61, ax

loc_66EDE:
		cmp	byte_49DEE, 0
		jz	short loc_66EFC
		push	large 78h
		push	seg seg015
		push	offset sub_9997
		push	6D9Ch
		call	Stopwatch_RegisterTickModuleVariant_44C84
		add	sp, 0Ah
		mov	[si+30h], ax

loc_66EFC:
		mov	byte_49DF2, 1
		push	ds
		push	offset aCracktheNut
		call	sub_993C
		add	sp, 4
		mov	byte_49DF1, al
		mov	byte_49DEC, 1
		push	2
		lea	ax, [bp+var_15C]
		push	ax
		call	StreamReader_Close_410AA
		add	sp, 4

loc_66F24:
		pop	di
		pop	si
		leave
		retf
sub_66111		endp

; START OF FUNCTION CHUNK FOR sub_66111
off_66F28	dw offset loc_6626F
		dw offset loc_662D6
		dw offset loc_6631F
		dw offset loc_6631F
		dw offset loc_6631F
		dw offset loc_6631F
		dw offset loc_6631F
		dw offset loc_6631F
		dw offset loc_6631F
		dw offset loc_66217
		dw offset loc_6631F
		dw offset loc_662FC
		dw offset loc_6631F
		dw offset loc_6631F
		dw offset loc_6620F
		dw offset loc_6631F
		dw offset loc_662DD
		dw offset loc_6631F
		dw offset loc_662E4
		dw offset loc_662EA
		dw offset loc_6631F
		dw offset loc_66303
; END OF FUNCTION CHUNK FOR sub_66111

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66F54		proc far

var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		push	ds
		int	15h
		sti
		mov	[bp+var_1], bl
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_6], eax
		xor	di, di
		jmp	short loc_66F9F

loc_66F80:
		xor	ax, ax
		xor	bx, bx
		xor	dx, dx
		xor	si, si
		mov	ax, 0A000h
		mov	ds, ax
		xor	si, si
		mov	cx, 4000h

loc_66F92:
		lodsd
		imul	ecx
		shrd	eax, edx, 10h
		loop	short loc_66F92
		inc	di

loc_66F9F:
		cmp	di, 5
		jl	short loc_66F80
		cmp	[bp+var_1], 0
		jz	short loc_66FB2
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h

loc_66FB2:
		pop	ds
		popf
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		sub	eax, [bp+var_6]
		imul	eax, eax, 3E8h
		mov	ebx, 1770h
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0D7h
		jg	short loc_66FF4
		mov	[bp+var_10], 0
		jmp	short loc_67008

loc_66FF4:
		cmp	[bp+var_E], 0FAh
		jg	short loc_67004
		mov	[bp+var_10], 1
		jmp	short loc_67008

loc_67004:
		mov	[bp+var_10], 2

loc_67008:
		mov	al, [bp+var_10]
		pop	di
		pop	si
		leave
		retf
sub_66F54		endp

; START OF FUNCTION CHUNK FOR sub_66F54
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_66F54

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67013		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_49DEC, 0
		jz	short loc_67098
		cmp	word_49DFA, 0
		jz	short loc_67045
		mov	ax, word_49DFA
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	word_49DFA
		call	sub_39C
		add	sp, 2
		jmp	short loc_67045

loc_67045:
		mov	word_49DFA, 0
		cmp	word_49DF8, 0
		jz	short loc_67065
		push	3
		push	word_49DF8
		mov	bx, word_49DF8
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_67065

loc_67065:
		mov	word_49DF8, 0
		cmp	byte_49DEE, 0
		jz	short loc_67080
		push	word ptr [si+30h]
		push	6D9Ch
		call	Stopwatch_UnregisterTickModule_44CC1
		add	sp, 4

loc_67080:
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_47BFF
		add	sp, 2
		call	StreamReader_DispatchWrite_40BBC
		mov	byte_49DEC, 0

loc_67098:
		pop	si
		pop	bp
		retf
sub_67013		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6709B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_67013
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_6709B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_670AD		proc far

var_150		= word ptr -150h
var_F3		= dword ptr -0F3h
var_EF		= dword ptr -0EFh
var_EA		= word ptr -0EAh
var_9A		= word ptr -9Ah
var_74		= word ptr -74h
var_65		= word ptr -65h
var_4B		= byte ptr -4Bh
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 150h
		push	si
		push	di
		mov	[bp+var_4], 100h
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	68AEh
		call	Cockpit_PanAzimuthUpdate_2415A
		add	sp, 4
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	67C8h
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		push	ds
		push	offset aShp_1
		push	ds
		push	offset aChkexit
		push	ds
		push	offset aFONTS
		lea	ax, [bp+var_EA]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_150], 480h
		mov	[bp+var_EF], 100h
		mov	[bp+var_F3], 0
		mov	[bp+var_150], 5BDh
		push	1
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		mov	bx, [bp+var_150]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		push	1
		push	0
		push	3
		push	large [bp+var_24]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		mov	eax, [bp+var_28]
		mov	[bp+var_E], eax
		mov	[bp+var_A], 3
		mov	[bp+var_9], 1
		mov	[bp+var_8], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_8], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_20]
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	word ptr [bp+var_E+2]
		push	word ptr [bp+var_E]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		lea	ax, [bp+var_150]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	byte_4F526, 1
		push	word_4F293
		push	word_4F291
		push	0
		call	sub_1476B
		add	sp, 6
		mov	[bp+var_10], 0FFFFh
		push	0C7h
		push	13Fh
		push	0
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_12431
		add	sp, 0Ah
		cmp	[bp+var_65], 0
		jnz	short loc_67233
		mov	[bp+var_4B], 0
		jmp	short loc_67233

loc_67233:
		push	0
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_67248
		jmp	loc_672CA

loc_67248:
		push	0Bh
		push	31h
		push	0AFh
		push	5Bh
		push	si
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 704h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_14], eax
		mov	al, [bp+var_A]
		mov	[bp+var_15], al
		mov	eax, [bp+var_14]
		mov	[si+1Eh], eax
		mov	al, [bp+var_15]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_8]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 1
		mov	word ptr [si+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 1
		mov	word ptr [si+0Eh], 76Ch
		mov	word ptr [si+2Eh], 2
		mov	ax, si
		jmp	short loc_672CC

loc_672CA:
		mov	ax, si

loc_672CC:
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	[bp+var_74]
		push	15h
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_12A25
		add	sp, 6
		push	0
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_67301
		jmp	loc_67384

loc_67301:
		push	0Bh
		push	31h
		push	0AFh
		push	0A4h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_1A], eax
		mov	al, [bp+var_A]
		mov	[bp+var_1B], al
		mov	eax, [bp+var_1A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_1B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_8]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 3
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 4
		mov	ax, di
		jmp	short loc_67386

loc_67384:
		mov	ax, di

loc_67386:
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	[bp+var_74]
		push	31h
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_12A25
		add	sp, 6
		push	[bp+var_74]
		push	1
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_12A25
		add	sp, 6
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_128E5
		add	sp, 2
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_143DD
		add	sp, 2
		push	0
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	word ptr [bp+var_E+2]
		push	word ptr [bp+var_E]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	87h
		push	5
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_143FC
		add	sp, 2
		jmp	short loc_6741C

loc_6740D:
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_6741C:
		cmp	[bp+var_10], 0FFFFh
		jz	short loc_6740D
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_12910
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_4555C
		push	word_4D36E
		push	67C8h
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		mov	al, byte ptr [bp+var_10]
		mov	[bp+var_1C], al
		push	2
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_9], 0
		jz	short loc_6747C
		cmp	[bp+var_E], 0
		jz	short loc_6747C
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6747C

loc_6747C:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		mov	al, [bp+var_1C]
		pop	di
		pop	si
		leave
		retf
sub_670AD		endp

; START OF FUNCTION CHUNK FOR sub_670AD
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_670AD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6749B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_674D1
		mov	word ptr [si], 151Ah
		push	si
		call	sub_47C9D
		add	sp, 2
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_674D1
		push	si
		call	sub_39C
		add	sp, 2

loc_674D1:
		pop	di
		pop	si
		pop	bp
		retf
sub_6749B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_674D5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_47C9D
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_674D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_674E8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6754E
		mov	word ptr [si], 1522h
		push	si
		call	sub_B657
		add	sp, 2
		push	2
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_Close_410AA
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_6754E
		push	si
		call	sub_39C
		add	sp, 2

loc_6754E:
		pop	di
		pop	si
		pop	bp
		retf
sub_674E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67552		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_B657
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_67552		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67565		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6759B
		mov	word ptr [si], 152Ah
		push	si
		call	StreamReader_CloseAndUnregister_40D46
		add	sp, 2
		push	0
		push	si
		call	StreamReader_Close_410AA
		add	sp, 4
		test	di, 1
		jz	short loc_6759B
		push	si
		call	sub_39C
		add	sp, 2

loc_6759B:
		pop	di
		pop	si
		pop	bp
		retf
sub_67565		endp
ovr196		ends
