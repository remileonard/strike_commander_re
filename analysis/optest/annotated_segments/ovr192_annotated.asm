ovr192		segment	para public 'OVERLAY' use16
		assume cs:ovr192
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5D0C0	proc far		; CODE XREF: sub_42283J sub_5D287+9Cp

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
		jnz	short loc_5D0E0
		push	107h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_5D12B

loc_5D0E0:				; CODE XREF: sub_5D0C0+Dj
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[si], ax
		mov	ax, [bp+arg_4]
		mov	[si+2],	ax
		mov	word ptr [si+4], 1
		or	di, di
		jz	short loc_5D122
		push	ds
		push	di
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_5D122
		push	1
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		mov	bx, [si+6]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_5D122:				; CODE XREF: sub_5D0C0+40j
					; sub_5D0C0+4Ej
		mov	dword ptr [si+103h], 0

loc_5D12B:				; CODE XREF: sub_5D0C0+1Ej
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_5D0C0	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5D135	proc far		; CODE XREF: sub_42288J sub_5D287+2D8p

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
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
		jge	short loc_5D161
		mov	ax, [si+4]
		inc	word ptr [si+4]
		shl	ax, 1
		mov	bx, [si+2]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_2], ax
		jmp	loc_5D27C
; ���������������������������������������������������������������������������

loc_5D161:				; CODE XREF: sub_5D135+15j
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ValidateState_3B625
		add	sp, 2
		or	al, al
		jnz	short loc_5D176
		jmp	loc_5D27C
; ���������������������������������������������������������������������������

loc_5D176:				; CODE XREF: sub_5D135+3Cj
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		mov	eax, [si+103h]
		cmp	eax, [bp+var_6]
		jl	short loc_5D19F
		jmp	loc_5D27C
; ���������������������������������������������������������������������������

loc_5D19F:				; CODE XREF: sub_5D135+65j
		push	large dword ptr	[si+103h]
		push	large 0A0h ; '�'
		push	ds
		mov	ax, si
		add	ax, 63h	; 'c'
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ReadTyped_3B811
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Eh
		mov	[bp+var_A], eax
		mov	ax, si
		add	ax, 63h	; 'c'
		mov	[bp+var_2], ax
		mov	[bp+var_C], 0
		mov	[bp+var_E], 0
		xor	di, di

loc_5D1E0:				; CODE XREF: sub_5D135+13Bj
		mov	bx, di
		mov	al, [bx+si+63h]
		cbw
		mov	dx, ax
		or	dx, dx
		jz	short loc_5D1F1
		cmp	dx, 1Bh
		jnz	short loc_5D210

loc_5D1F1:				; CODE XREF: sub_5D135+B5j
		mov	bx, di
		mov	byte ptr [bx+si+63h], 0
		or	di, di
		jnz	short loc_5D200
		mov	[bp+var_2], 0

loc_5D200:				; CODE XREF: sub_5D135+C4j
		mov	eax, [bp+var_6]
		mov	[si+103h], eax
		mov	[bp+var_C], 1
		jmp	short loc_5D260
; ���������������������������������������������������������������������������

loc_5D210:				; CODE XREF: sub_5D135+BAj
		cmp	dx, 0Dh
		jz	short loc_5D21A
		cmp	dx, 0Ah
		jnz	short loc_5D230

loc_5D21A:				; CODE XREF: sub_5D135+DEj
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx], 0
		jz	short loc_5D227
		mov	[bp+var_E], 1

loc_5D227:				; CODE XREF: sub_5D135+EBj
		mov	bx, di
		mov	byte ptr [bx+si+63h], 0
		inc	di
		jmp	short loc_5D260
; ���������������������������������������������������������������������������

loc_5D230:				; CODE XREF: sub_5D135+E3j
		cmp	[bp+var_E], 0
		jz	short loc_5D23D
		mov	[bp+var_C], 1
		jmp	short loc_5D260
; ���������������������������������������������������������������������������

loc_5D23D:				; CODE XREF: sub_5D135+FFj
		cmp	[bp+var_2], 0
		jnz	short loc_5D24D
		mov	ax, si
		add	ax, di
		add	ax, 63h	; 'c'
		mov	[bp+var_2], ax

loc_5D24D:				; CODE XREF: sub_5D135+10Cj
		inc	di
		mov	ax, di
		movsx	eax, ax
		cmp	eax, [bp+var_A]
		jnz	short loc_5D260
		mov	bx, di
		mov	byte ptr [bx+si+63h], 0

loc_5D260:				; CODE XREF: sub_5D135+D9j
					; sub_5D135+F9j ...
		cmp	[bp+var_C], 0
		jnz	short loc_5D273
		movsx	eax, di
		cmp	eax, [bp+var_A]
		jge	short loc_5D273
		jmp	loc_5D1E0
; ���������������������������������������������������������������������������

loc_5D273:				; CODE XREF: sub_5D135+12Fj
					; sub_5D135+139j
		movsx	eax, di
		add	[si+103h], eax

loc_5D27C:				; CODE XREF: sub_5D135+29j
					; sub_5D135+3Ej ...
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_5D135	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5D287	proc far		; CODE XREF: sub_4226FJ

var_15A		= word ptr -15Ah
var_154		= word ptr -154h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= dword	ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
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
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 15Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_443AE
		mov	ah, 0
		or	ax, ax
		jz	short loc_5D29F
		jmp	loc_5DBAB
; ���������������������������������������������������������������������������

loc_5D29F:				; CODE XREF: sub_5D287+13j
		mov	byte ptr [si+25h], 1
		mov	byte ptr [si+1Dh], 3
		mov	byte ptr [bp+var_2], 3
		lea	ax, [bp+var_2]
		push	ax
		call	TextRenderer_EncodeCharA_2E94F
		add	sp, 2
		cmp	byte ptr [bp+var_2], 13h
		jz	short loc_5D2CF
		mov	byte ptr [bp+var_2], 13h
		lea	ax, [bp+var_2]
		push	ax
		call	TextRenderer_EncodeCharB_2E977
		add	sp, 2
		jmp	short loc_5D2D4
; ���������������������������������������������������������������������������

loc_5D2CF:				; CODE XREF: sub_5D287+34j
		call	sub_2EFEE

loc_5D2D4:				; CODE XREF: sub_5D287+46j
		push	0
		mov	ax, si
		add	ax, 4
		push	ax
		call	TextRenderer_GetOrInitFormatState_2CC2B
		add	sp, 4
		mov	[bp+var_3], 0
		mov	[bp+var_6], 0FFFFh
		mov	[bp+var_8], 0FFFFh
		mov	[bp+var_A], 0FFFFh
		mov	[bp+var_C], 0FFFFh
		mov	[bp+var_D], 0
		mov	[bp+var_10], 0FFFFh
		mov	[bp+var_12], 0FFFFh
		mov	[bp+var_14], 0FFFFh
		mov	[bp+var_16], 0FFFFh
		push	13ACh
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_15A]
		push	ax
		push	cs
		call	near ptr sub_5D0C0
		add	sp, 8
		or	byte_496C4, 2
		push	6640h
		call	FontStyle_CombineFlags_2F487
		add	sp, 2
		jmp	loc_5D559
; ���������������������������������������������������������������������������

loc_5D33C:				; CODE XREF: sub_5D287+2E4j
		mov	al, [di]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		cmp	ax, 2Bh	; '+'
		jnz	short loc_5D350
		jmp	loc_5D47D
; ���������������������������������������������������������������������������

loc_5D350:				; CODE XREF: sub_5D287+C4j
		cmp	ax, 2Dh	; '-'
		jz	short loc_5D360
		cmp	ax, 3Dh	; '='
		jnz	short loc_5D35D
		jmp	loc_5D4CE
; ���������������������������������������������������������������������������

loc_5D35D:				; CODE XREF: sub_5D287+D1j
		jmp	loc_5D559
; ���������������������������������������������������������������������������

loc_5D360:				; CODE XREF: sub_5D287+CCj
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		sub	ax, 44h	; 'D'
		mov	bx, ax
		cmp	bx, 13h		; switch 20 cases
		jbe	short loc_5D37A
		jmp	loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D37A:				; CODE XREF: sub_5D287+EEj
		shl	bx, 1
		jmp	cs:off_5DBAF[bx] ; switch jump

loc_5D381:				; DATA XREF: ovr192:off_5DBAFo
		mov	byte_46853, 1	; case 0xE
		jmp	loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D389:				; CODE XREF: sub_5D287+F5j
					; DATA XREF: ovr192:off_5DBAFo
		mov	al, [di+2]	; case 0x9
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		mov	[bp+var_3], al
		cmp	byte ptr [di+3], 0
		jz	short loc_5D3E3
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	dx, ax
		mov	ax, dx
		shl	ax, 4
		add	ax, 208h
		mov	[bp+var_6], ax
		cmp	byte ptr [di+4], 0
		jz	short loc_5D3E3
		mov	al, [di+4]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_8], ax
		cmp	byte ptr [di+5], 0
		jz	short loc_5D3E3
		mov	al, [di+5]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_A], ax
		cmp	byte ptr [di+6], 0
		jz	short loc_5D3E3
		mov	al, [di+6]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_C], ax

loc_5D3E3:				; CODE XREF: sub_5D287+116j
					; sub_5D287+130j ...
		jmp	loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D3E6:				; CODE XREF: sub_5D287+F5j
					; DATA XREF: ovr192:off_5DBAFo
		mov	al, [di+2]	; case 0x0
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		mov	[bp+var_D], al
		cmp	byte ptr [di+3], 0
		jz	short loc_5D44B
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	dx, ax
		mov	ax, dx
		shl	ax, 4
		add	ax, 200h
		mov	[bp+var_10], ax
		cmp	byte ptr [di+4], 0
		jz	short loc_5D44B
		mov	al, [di+4]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_12], ax
		cmp	[bp+var_12], 0
		jnz	short loc_5D42B
		mov	[bp+var_12], 0Ah

loc_5D42B:				; CODE XREF: sub_5D287+19Dj
		cmp	byte ptr [di+5], 0
		jz	short loc_5D44B
		mov	al, [di+5]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_14], ax
		cmp	byte ptr [di+6], 0
		jz	short loc_5D44B
		mov	al, [di+6]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_16], ax

loc_5D44B:				; CODE XREF: sub_5D287+173j
					; sub_5D287+18Dj ...
		jmp	short loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D44D:				; CODE XREF: sub_5D287+F5j
					; DATA XREF: ovr192:off_5DBAFo
		mov	byte_443AF, 0	; case 0x1
		jmp	short loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D454:				; CODE XREF: sub_5D287+F5j
					; DATA XREF: ovr192:off_5DBAFo
		mov	byte_443B0, 0	; case 0x10
		jmp	short loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D45B:				; CODE XREF: sub_5D287+F5j
					; DATA XREF: ovr192:off_5DBAFo
		mov	byte ptr [si+25h], 0 ; case 0x12
		jmp	short loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D461:				; CODE XREF: sub_5D287+F5j
					; DATA XREF: ovr192:off_5DBAFo
		or	byte_496C4, 2	; case 0x13
		push	6640h
		call	FontStyle_CombineFlags_2F487
		add	sp, 2
		jmp	short loc_5D47A	; default
; ���������������������������������������������������������������������������

loc_5D473:				; CODE XREF: sub_5D287+F5j
					; DATA XREF: ovr192:off_5DBAFo
		mov	byte_47038, 0	; case 0xB
		jmp	short $+2

loc_5D47A:				; CODE XREF: sub_5D287+F0j
					; sub_5D287+F5j ...
		jmp	loc_5D559	; default
; ���������������������������������������������������������������������������

loc_5D47D:				; CODE XREF: sub_5D287+C6j
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		cmp	ax, 54h	; 'T'
		jz	short loc_5D4AB
		jg	short loc_5D49D
		cmp	ax, 45h	; 'E'
		jz	short loc_5D4A4
		cmp	ax, 4Fh	; 'O'
		jz	short loc_5D4B2
		jmp	short loc_5D4CB
; ���������������������������������������������������������������������������

loc_5D49D:				; CODE XREF: sub_5D287+208j
		cmp	ax, 57h	; 'W'
		jz	short loc_5D4B9
		jmp	short loc_5D4CB
; ���������������������������������������������������������������������������

loc_5D4A4:				; CODE XREF: sub_5D287+20Dj
		mov	byte_443AF, 1
		jmp	short loc_5D4CB
; ���������������������������������������������������������������������������

loc_5D4AB:				; CODE XREF: sub_5D287+206j
		mov	byte_443B0, 1
		jmp	short loc_5D4CB
; ���������������������������������������������������������������������������

loc_5D4B2:				; CODE XREF: sub_5D287+212j
		mov	byte_47038, 1
		jmp	short loc_5D4CB
; ���������������������������������������������������������������������������

loc_5D4B9:				; CODE XREF: sub_5D287+219j
		and	byte_496C4, 0FDh
		push	6640h
		call	FontStyle_CombineFlags_2F487
		add	sp, 2
		jmp	short $+2

loc_5D4CB:				; CODE XREF: sub_5D287+214j
					; sub_5D287+21Bj ...
		jmp	loc_5D559
; ���������������������������������������������������������������������������

loc_5D4CE:				; CODE XREF: sub_5D287+D3j
		mov	ax, di
		inc	ax
		mov	[bp+var_4E], ax
		push	ds
		push	[bp+var_4E]
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_5D557
		push	12Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_52], ax
		or	ax, ax
		jz	short loc_5D525
		push	[bp+var_52]
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	bx, [bp+var_52]
		mov	word ptr [bx], 13E9h
		mov	bx, [bp+var_52]
		mov	dword ptr [bx+0DDh], 0
		mov	bx, [bp+var_52]
		mov	dword ptr [bx+0E1h], 0
		mov	ax, [bp+var_52]
		jmp	short loc_5D528
; ���������������������������������������������������������������������������

loc_5D525:				; CODE XREF: sub_5D287+26Dj
		mov	ax, [bp+var_52]

loc_5D528:				; CODE XREF: sub_5D287+29Cj
		mov	[bp+var_50], ax
		push	[bp+var_4E]
		push	[bp+var_50]
		call	StreamReader_OpenAndRegister_3BB91
		add	sp, 4
		or	al, al
		jz	short loc_5D53F
		jmp	short loc_5D557
; ���������������������������������������������������������������������������

loc_5D53F:				; CODE XREF: sub_5D287+2B4j
		cmp	[bp+var_50], 0
		jz	short loc_5D557
		push	3
		push	[bp+var_50]
		mov	bx, [bp+var_50]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_5D557:				; CODE XREF: sub_5D287+25Bj
					; sub_5D287+2B6j ...
		jmp	short $+2

loc_5D559:				; CODE XREF: sub_5D287+B2j
					; sub_5D287:loc_5D35Dj	...
		lea	ax, [bp+var_15A]
		push	ax
		push	cs
		call	near ptr sub_5D135
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_5D56E
		jmp	loc_5D33C
; ���������������������������������������������������������������������������

loc_5D56E:				; CODE XREF: sub_5D287+2E2j
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_422CA
		add	sp, 2
		cmp	byte_443AF, 0
		jz	short loc_5D59B
		push	0
		push	0
		call	PagedMemory_ReadTextResource_2B23C
		add	sp, 2
		push	ax
		push	661Ah
		call	Memory_TypedFreeVariant_2B731
		add	sp, 6

loc_5D59B:				; CODE XREF: sub_5D287+2FAj
		push	661Ah
		call	TextRenderer_ReleaseCachedGlyph_2BB8C
		add	sp, 2
		call	Registry_LookupForTextRenderer_2A6C7
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_49520, eax
		cmp	dword_49520, 1D5780h
		jle	short loc_5D5C8
		mov	ax, 1
		jmp	short loc_5D5CA
; ���������������������������������������������������������������������������

loc_5D5C8:				; CODE XREF: sub_5D287+33Aj
		xor	ax, ax

loc_5D5CA:				; CODE XREF: sub_5D287+33Fj
		mov	[bp+var_17], al
		cmp	dword_49520, 1A9860h
		jle	short loc_5D5DD
		mov	ax, 1
		jmp	short loc_5D5DF
; ���������������������������������������������������������������������������

loc_5D5DD:				; CODE XREF: sub_5D287+34Fj
		xor	ax, ax

loc_5D5DF:				; CODE XREF: sub_5D287+354j
		mov	[bp+var_18], al
		cmp	[bp+var_17], 0
		jnz	short loc_5D5EB
		jmp	loc_5D7CA
; ���������������������������������������������������������������������������

loc_5D5EB:				; CODE XREF: sub_5D287+35Fj
		mov	al, [bp+var_3]
		cbw
		cmp	ax, 41h	; 'A'
		jnz	short loc_5D5F7
		jmp	loc_5D6D7
; ���������������������������������������������������������������������������

loc_5D5F7:				; CODE XREF: sub_5D287+36Bj
		cmp	ax, 52h	; 'R'
		jz	short loc_5D5FF
		jmp	loc_5D7CA
; ���������������������������������������������������������������������������

loc_5D5FF:				; CODE XREF: sub_5D287+373j
		mov	byte_46848, 1
		push	84h ; '�'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1A], ax
		or	ax, ax
		jnz	short loc_5D619
		jmp	loc_5D6CE
; ���������������������������������������������������������������������������

loc_5D619:				; CODE XREF: sub_5D287+38Dj
		mov	bx, [bp+var_1A]
		mov	word ptr [bx], 13A4h
		mov	bx, [bp+var_1A]
		mov	ax, word_4703A
		mov	[bx+2],	ax
		mov	ax, [bp+var_1A]
		mov	word_4703A, ax
		mov	bx, [bp+var_1A]
		mov	word ptr [bx], 13E5h
		mov	bx, [bp+var_1A]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_1A]
		mov	byte ptr [bx+0Eh], 2
		mov	bx, [bp+var_1A]
		mov	byte ptr [bx+0Fh], 0
		mov	bx, [bp+var_1A]
		mov	dword ptr [bx+10h], 0
		mov	bx, [bp+var_1A]
		mov	dword ptr [bx+14h], 0
		mov	bx, [bp+var_1A]
		mov	byte ptr [bx+18h], 2
		mov	bx, [bp+var_1A]
		mov	byte ptr [bx+19h], 0
		mov	bx, [bp+var_1A]
		mov	dword ptr [bx+1Ah], 0
		mov	ax, [bp+var_1A]
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	bx, [bp+var_1A]
		mov	word ptr [bx+1Eh], 556h
		mov	bx, [bp+var_1A]
		mov	dword ptr [bx+7Fh], 100h
		mov	bx, [bp+var_1A]
		mov	dword ptr [bx+7Bh], 0
		mov	bx, [bp+var_1A]
		mov	word ptr [bx+1Eh], 693h
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	0FFFFh
		push	13B3h
		push	[bp+var_1A]
		call	sub_702F
		add	sp, 0Ch
		mov	ax, [bp+var_1A]
		jmp	short loc_5D6D1
; ���������������������������������������������������������������������������

loc_5D6CE:				; CODE XREF: sub_5D287+38Fj
		mov	ax, [bp+var_1A]

loc_5D6D1:				; CODE XREF: sub_5D287+445j
		mov	word_46849, ax
		jmp	loc_5D7CA
; ���������������������������������������������������������������������������

loc_5D6D7:				; CODE XREF: sub_5D287+36Dj
		mov	byte_46848, 2
		mov	ax, [bp+var_6]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_22], ax
		push	84h ; '�'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_24], ax
		or	ax, ax
		jnz	short loc_5D709
		jmp	loc_5D7C2
; ���������������������������������������������������������������������������

loc_5D709:				; CODE XREF: sub_5D287+47Dj
		mov	bx, [bp+var_24]
		mov	word ptr [bx], 13A4h
		mov	bx, [bp+var_24]
		mov	ax, word_4703A
		mov	[bx+2],	ax
		mov	ax, [bp+var_24]
		mov	word_4703A, ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx], 13E5h
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+0Eh], 2
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+0Fh], 0
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+10h], 0
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+14h], 0
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+18h], 2
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+19h], 0
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+1Ah], 0
		mov	ax, [bp+var_24]
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	bx, [bp+var_24]
		mov	word ptr [bx+1Eh], 556h
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+7Fh], 100h
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+7Bh], 0
		mov	bx, [bp+var_24]
		mov	word ptr [bx+1Eh], 693h
		push	[bp+var_22]
		push	[bp+var_20]
		push	[bp+var_1E]
		push	[bp+var_1C]
		push	13BAh
		push	[bp+var_24]
		call	sub_702F
		add	sp, 0Ch
		mov	ax, [bp+var_24]
		jmp	short loc_5D7C5
; ���������������������������������������������������������������������������

loc_5D7C2:				; CODE XREF: sub_5D287+47Fj
		mov	ax, [bp+var_24]

loc_5D7C5:				; CODE XREF: sub_5D287+539j
		mov	word_46849, ax
		jmp	short $+2

loc_5D7CA:				; CODE XREF: sub_5D287+361j
					; sub_5D287+375j ...
		cmp	word_46849, 0
		jz	short loc_5D7DB
		mov	byte_495F5, 1
		mov	byte_495F6, 1

loc_5D7DB:				; CODE XREF: sub_5D287+548j
		cmp	[bp+var_18], 0
		jnz	short loc_5D7E4
		jmp	loc_5D9D5
; ���������������������������������������������������������������������������

loc_5D7E4:				; CODE XREF: sub_5D287+558j
		mov	al, [bp+var_D]
		cbw
		cmp	ax, 50h	; 'P'
		jnz	short loc_5D7F0
		jmp	loc_5D8E7
; ���������������������������������������������������������������������������

loc_5D7F0:				; CODE XREF: sub_5D287+564j
		cmp	ax, 53h	; 'S'
		jz	short loc_5D7F8
		jmp	loc_5D9D5
; ���������������������������������������������������������������������������

loc_5D7F8:				; CODE XREF: sub_5D287+56Cj
		mov	ax, [bp+var_10]
		mov	[bp+var_26], ax
		mov	ax, [bp+var_12]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_2A], ax
		mov	ax, [bp+var_16]
		mov	[bp+var_2C], ax
		push	84h ; '�'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2E], ax
		or	ax, ax
		jnz	short loc_5D825
		jmp	loc_5D8DE
; ���������������������������������������������������������������������������

loc_5D825:				; CODE XREF: sub_5D287+599j
		mov	bx, [bp+var_2E]
		mov	word ptr [bx], 13A4h
		mov	bx, [bp+var_2E]
		mov	ax, word_4703A
		mov	[bx+2],	ax
		mov	ax, [bp+var_2E]
		mov	word_4703A, ax
		mov	bx, [bp+var_2E]
		mov	word ptr [bx], 13E5h
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_2E]
		mov	byte ptr [bx+0Eh], 2
		mov	bx, [bp+var_2E]
		mov	byte ptr [bx+0Fh], 0
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+10h], 0
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+14h], 0
		mov	bx, [bp+var_2E]
		mov	byte ptr [bx+18h], 2
		mov	bx, [bp+var_2E]
		mov	byte ptr [bx+19h], 0
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+1Ah], 0
		mov	ax, [bp+var_2E]
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+1Eh], 556h
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+7Fh], 100h
		mov	bx, [bp+var_2E]
		mov	dword ptr [bx+7Bh], 0
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+1Eh], 693h
		push	[bp+var_2C]
		push	[bp+var_2A]
		push	[bp+var_28]
		push	[bp+var_26]
		push	13C0h
		push	[bp+var_2E]
		call	sub_702F
		add	sp, 0Ch
		mov	ax, [bp+var_2E]
		jmp	short loc_5D8E1
; ���������������������������������������������������������������������������

loc_5D8DE:				; CODE XREF: sub_5D287+59Bj
		mov	ax, [bp+var_2E]

loc_5D8E1:				; CODE XREF: sub_5D287+655j
		mov	word_4684B, ax
		jmp	loc_5D9D5
; ���������������������������������������������������������������������������

loc_5D8E7:				; CODE XREF: sub_5D287+566j
		mov	ax, [bp+var_10]
		mov	[bp+var_30], ax
		mov	ax, [bp+var_12]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_34], ax
		mov	ax, [bp+var_16]
		mov	[bp+var_36], ax
		push	84h ; '�'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_38], ax
		or	ax, ax
		jnz	short loc_5D914
		jmp	loc_5D9CD
; ���������������������������������������������������������������������������

loc_5D914:				; CODE XREF: sub_5D287+688j
		mov	bx, [bp+var_38]
		mov	word ptr [bx], 13A4h
		mov	bx, [bp+var_38]
		mov	ax, word_4703A
		mov	[bx+2],	ax
		mov	ax, [bp+var_38]
		mov	word_4703A, ax
		mov	bx, [bp+var_38]
		mov	word ptr [bx], 13E5h
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_38]
		mov	byte ptr [bx+0Eh], 2
		mov	bx, [bp+var_38]
		mov	byte ptr [bx+0Fh], 0
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+10h], 0
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+14h], 0
		mov	bx, [bp+var_38]
		mov	byte ptr [bx+18h], 2
		mov	bx, [bp+var_38]
		mov	byte ptr [bx+19h], 0
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+1Ah], 0
		mov	ax, [bp+var_38]
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	bx, [bp+var_38]
		mov	word ptr [bx+1Eh], 556h
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+7Fh], 100h
		mov	bx, [bp+var_38]
		mov	dword ptr [bx+7Bh], 0
		mov	bx, [bp+var_38]
		mov	word ptr [bx+1Eh], 693h
		push	[bp+var_36]
		push	[bp+var_34]
		push	[bp+var_32]
		push	[bp+var_30]
		push	13C3h
		push	[bp+var_38]
		call	sub_702F
		add	sp, 0Ch
		mov	ax, [bp+var_38]
		jmp	short loc_5D9D0
; ���������������������������������������������������������������������������

loc_5D9CD:				; CODE XREF: sub_5D287+68Aj
		mov	ax, [bp+var_38]

loc_5D9D0:				; CODE XREF: sub_5D287+744j
		mov	word_4684B, ax
		jmp	short $+2

loc_5D9D5:				; CODE XREF: sub_5D287+55Aj
					; sub_5D287+56Ej ...
		cmp	word_4684B, 0
		jz	short loc_5D9E1
		mov	byte_495F7, 1

loc_5D9E1:				; CODE XREF: sub_5D287+753j
		cmp	[bp+arg_6], 0
		jnz	short loc_5D9EA
		jmp	loc_5DAB2
; ���������������������������������������������������������������������������

loc_5D9EA:				; CODE XREF: sub_5D287+75Ej
		push	2
		push	[bp+arg_6]
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_3C+2],	dx
		mov	word ptr [bp+var_3C], ax
		mov	eax, [bp+var_3C]
		mov	[bp+var_46], eax
		mov	[bp+var_42], 2
		mov	[bp+var_41], 1
		mov	[bp+var_40], 0
		lea	ax, [bp+var_46]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	word_443B7, ax
		cmp	[bp+var_41], 0
		jz	short loc_5DA4A
		cmp	[bp+var_46], 0
		jz	short loc_5DA4A
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5DA4A:				; CODE XREF: sub_5D287+7A3j
					; sub_5D287+7AAj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		mov	bx, word_443B7
		mov	word ptr [bx+10h], 1
		mov	bx, word_443B7
		mov	word ptr [bx+12h], 0
		push	2Dh ; '-'
		push	word_443B7
		mov	bx, word_443B7
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, word_443B7
		mov	[bx+14h], ax
		push	word_443B7
		push	word_46F46
		push	0
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	word_443B9, ax
		push	0Fh
		push	word_443B9
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	ax, word_443B9
		mov	word_45B54, ax

loc_5DAB2:				; CODE XREF: sub_5D287+760j
		mov	[bp+var_48], 0
		jmp	short loc_5DADF
; ���������������������������������������������������������������������������

loc_5DAB9:				; CODE XREF: sub_5D287+85Cj
		mov	al, byte ptr [bp+var_48]
		push	ax
		call	sub_3F3A6
		add	sp, 2
		or	al, al
		jz	short loc_5DADC
		push	0
		push	[bp+var_48]
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_422C5
		add	sp, 6

loc_5DADC:				; CODE XREF: sub_5D287+840j
		inc	[bp+var_48]

loc_5DADF:				; CODE XREF: sub_5D287+830j
		cmp	[bp+var_48], 1
		jl	short loc_5DAB9
		mov	byte_47038, 1
		cmp	byte_495F5, 0
		jz	short loc_5DB6A
		mov	ax, word_46849
		mov	[bp+var_4A], ax
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_4C], ax
		or	ax, ax
		jz	short loc_5DB64
		mov	bx, [bp+var_4C]
		mov	word ptr [bx], 13A4h
		mov	bx, [bp+var_4C]
		mov	ax, word_4703A
		mov	[bx+2],	ax
		mov	ax, [bp+var_4C]
		mov	word_4703A, ax
		mov	bx, [bp+var_4C]
		mov	word ptr [bx], 13E1h
		mov	byte_4457D, 1
		mov	word_4457E, 0
		mov	ax, [bp+var_4A]
		mov	word_44584, ax
		push	word_44584
		push	5E57h
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	word_44584
		push	5E69h
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	[bp+var_4C]
		call	sub_42359
		add	sp, 2
		mov	ax, [bp+var_4C]
		jmp	short loc_5DB67
; ���������������������������������������������������������������������������

loc_5DB64:				; CODE XREF: sub_5D287+87Fj
		mov	ax, [bp+var_4C]

loc_5DB67:				; CODE XREF: sub_5D287+8DBj
		mov	word_4684F, ax

loc_5DB6A:				; CODE XREF: sub_5D287+868j
		cmp	byte_443B0, 0
		jz	short loc_5DB88
		push	large 78h ; 'x'
		push	seg seg007
		push	offset loc_6785
		push	67A2h
		call	Stopwatch_RegisterTickModuleVariant_3EE86
		add	sp, 0Ah
		mov	[si+26h], ax

loc_5DB88:				; CODE XREF: sub_5D287+8E8j
		push	ds
		push	offset aCrackthe_nut ; "crackthe.nut"
		call	sub_6734
		add	sp, 4
		mov	byte_443B2, al
		mov	byte_443AE, 1
		push	2
		lea	ax, [bp+var_154]
		push	ax
		call	StreamReader_Close_3B445
		add	sp, 4

loc_5DBAB:				; CODE XREF: sub_5D287+15j
		pop	di
		pop	si
		leave
		retf
sub_5D287	endp

; ���������������������������������������������������������������������������
off_5DBAF	dw offset loc_5D3E6	; DATA XREF: sub_5D287+F5r
		dw offset loc_5D44D	; jump table for switch	statement
		dw offset loc_5D47A
		dw offset loc_5D47A
		dw offset loc_5D47A
		dw offset loc_5D47A
		dw offset loc_5D47A
		dw offset loc_5D47A
		dw offset loc_5D47A
		dw offset loc_5D389
		dw offset loc_5D47A
		dw offset loc_5D473
		dw offset loc_5D47A
		dw offset loc_5D47A
		dw offset loc_5D381
		dw offset loc_5D47A
		dw offset loc_5D454
		dw offset loc_5D47A
		dw offset loc_5D45B
		dw offset loc_5D461

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5DBD7	proc far		; CODE XREF: sub_4227EJ

var_10		= byte ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
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
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_6], eax
		xor	di, di
		jmp	short loc_5DC22
; ���������������������������������������������������������������������������

loc_5DC03:				; CODE XREF: sub_5DBD7+4Ej
		xor	ax, ax
		xor	bx, bx
		xor	dx, dx
		xor	si, si
		mov	ax, 0A000h
		mov	ds, ax
		assume ds:nothing
		xor	si, si
		mov	cx, 4000h

loc_5DC15:				; CODE XREF: sub_5DBD7+48j
		lodsd
		imul	ecx
		shrd	eax, edx, 10h
		loop	loc_5DC15
		inc	di

loc_5DC22:				; CODE XREF: sub_5DBD7+2Aj
		cmp	di, 5
		jl	short loc_5DC03
		cmp	[bp+var_1], 0
		jz	short loc_5DC35
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h

loc_5DC35:				; CODE XREF: sub_5DBD7+54j
		pop	ds
		assume ds:dseg
		popf
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		sub	eax, [bp+var_6]
		imul	eax, 3E8h
		mov	ebx, 1770h
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0D7h ; '�'
		jg	short loc_5DC77
		mov	[bp+var_10], 0
		jmp	short loc_5DC8B
; ���������������������������������������������������������������������������

loc_5DC77:				; CODE XREF: sub_5DBD7+98j
		cmp	[bp+var_E], 0FAh ; '�'
		jg	short loc_5DC87
		mov	[bp+var_10], 1
		jmp	short loc_5DC8B
; ���������������������������������������������������������������������������

loc_5DC87:				; CODE XREF: sub_5DBD7+A8j
		mov	[bp+var_10], 2

loc_5DC8B:				; CODE XREF: sub_5DBD7+9Ej
					; sub_5DBD7+AEj
		mov	al, [bp+var_10]
		pop	di
		pop	si
		leave
		retf
sub_5DBD7	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5DC96	proc far		; CODE XREF: sub_42274J sub_5DD1E+9p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_443AE, 0
		jz	short loc_5DD1B
		cmp	word_443B9, 0
		jz	short loc_5DCC8
		mov	ax, word_443B9
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	word_443B9
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5DCC8:				; CODE XREF: sub_5DC96+13j
		mov	word_443B9, 0
		cmp	word_443B7, 0
		jz	short loc_5DCE8
		push	3
		push	word_443B7
		mov	bx, word_443B7
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5DCE8:				; CODE XREF: sub_5DC96+3Dj
		mov	word_443B7, 0
		cmp	byte_443B0, 0
		jz	short loc_5DD03
		push	word ptr [si+26h]
		push	67A2h
		call	Stopwatch_UnregisterTickModule_3EEC3
		add	sp, 4

loc_5DD03:				; CODE XREF: sub_5DC96+5Dj
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_422CF
		add	sp, 2
		call	StreamReader_DispatchWrite_3B9E5
		mov	byte_443AE, 0

loc_5DD1B:				; CODE XREF: sub_5DC96+Cj
		pop	si
		pop	bp
		retf
sub_5DC96	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5DD1E	proc far		; CODE XREF: sub_42279J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_5DC96
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_5DD1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5DD30	proc far		; CODE XREF: sub_4228DJ

var_150		= word ptr -150h
var_F3		= dword	ptr -0F3h
var_EF		= dword	ptr -0EFh
var_EA		= word ptr -0EAh
var_9A		= word ptr -9Ah
var_74		= word ptr -74h
var_65		= word ptr -65h
var_4B		= byte ptr -4Bh
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword	ptr -1Ah
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 150h
		push	si
		push	di
		mov	[bp+var_4], 100h
		lea	ax, [bp+var_4]
		push	ax
		push	62D0h
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	60B6h
		push	word_46F46
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		push	ds
		push	offset a_shp_0	; ".shp"
		push	ds
		push	offset aChkexit	; "chkexit"
		push	ds
		push	offset aFonts	; "FONTS"
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_150], 556h
		mov	[bp+var_EF], 100h
		mov	[bp+var_F3], 0
		mov	[bp+var_150], 693h
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
		call	StreamReader_GetCapacity_3B8D2
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
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_28+2],	dx
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
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	byte_495CA, 1
		push	word ptr dword_492F3+2
		push	word ptr dword_492F3
		push	0
		call	sub_FBE7
		add	sp, 6
		mov	[bp+var_10], 0FFFFh
		push	0C7h ; '�'
		push	13Fh
		push	0
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		cmp	[bp+var_65], 0
		jnz	short loc_5DEB6
		mov	[bp+var_4B], 0
		jmp	short $+2

loc_5DEB6:				; CODE XREF: sub_5DD30+17Ej
		push	0
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_5DECB
		jmp	loc_5DF4D
; ���������������������������������������������������������������������������

loc_5DECB:				; CODE XREF: sub_5DD30+196j
		push	0Bh
		push	31h ; '1'
		push	0AFh ; '�'
		push	5Bh ; '['
		push	si
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 7A8h
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
		mov	word ptr [si+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 1
		mov	word ptr [si+0Eh], 810h
		mov	word ptr [si+2Eh], 2
		mov	ax, si
		jmp	short loc_5DF4F
; ���������������������������������������������������������������������������

loc_5DF4D:				; CODE XREF: sub_5DD30+198j
		mov	ax, si

loc_5DF4F:				; CODE XREF: sub_5DD30+21Bj
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	[bp+var_74]
		push	15h
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_E0DF
		add	sp, 6
		push	0
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5DF84
		jmp	loc_5E007
; ���������������������������������������������������������������������������

loc_5DF84:				; CODE XREF: sub_5DD30+24Fj
		push	0Bh
		push	31h ; '1'
		push	0AFh ; '�'
		push	0A4h ; '�'
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
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
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 4
		mov	ax, di
		jmp	short loc_5E009
; ���������������������������������������������������������������������������

loc_5E007:				; CODE XREF: sub_5DD30+251j
		mov	ax, di

loc_5E009:				; CODE XREF: sub_5DD30+2D5j
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	[bp+var_74]
		push	31h ; '1'
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_E0DF
		add	sp, 6
		push	[bp+var_74]
		push	1
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_E0DF
		add	sp, 6
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_DF9F
		add	sp, 2
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_F859
		add	sp, 2
		push	0
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	word ptr [bp+var_E+2]
		push	word ptr [bp+var_E]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	87h ; '�'
		push	5
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_F878
		add	sp, 2
		jmp	short loc_5E09F
; ���������������������������������������������������������������������������

loc_5E090:				; CODE XREF: sub_5DD30+373j
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_5E09F:				; CODE XREF: sub_5DD30+35Ej
		cmp	[bp+var_10], 0FFFFh
		jz	short loc_5E090
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_DFCA
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_3F784
		push	word_46F46
		push	60B6h
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		mov	al, byte ptr [bp+var_10]
		mov	[bp+var_1C], al
		push	2
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_9], 0
		jz	short loc_5E0FF
		cmp	[bp+var_E], 0
		jz	short loc_5E0FF
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5E0FF:				; CODE XREF: sub_5DD30+3AFj
					; sub_5DD30+3B6j
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		mov	al, [bp+var_1C]
		pop	di
		pop	si
		leave
		retf
sub_5DD30	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5E11E	proc far		; CODE XREF: sub_4226AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_4236D
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_5E11E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5E131	proc far		; CODE XREF: sub_42265J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_77FF
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_5E131	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5E144	proc far		; CODE XREF: sub_42260J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5E17A
		mov	word ptr [si], 13E9h
		push	si
		call	StreamReader_CloseAndUnregister_3BB6F
		add	sp, 2
		push	0
		push	si
		call	StreamReader_Close_3B445
		add	sp, 4
		test	di, 1
		jz	short loc_5E17A
		push	si
		call	sub_308
		add	sp, 2

loc_5E17A:				; CODE XREF: sub_5E144+Dj
					; sub_5E144+2Bj
		pop	di
		pop	si
		pop	bp
		retf
sub_5E144	endp

ovr192		ends
