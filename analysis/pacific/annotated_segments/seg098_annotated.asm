seg098		segment	para public 'CODE' use16
		assume cs:seg098
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D263		proc far

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
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+0Eh]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx+82h], 0
		jnz	short loc_3D28E
		jmp	loc_3D42C

loc_3D28E:
		cmp	word_7CD74, 0
		jz	short loc_3D299
		push	0
		jmp	short loc_3D2A1

loc_3D299:
		mov	al, [si+68h]
		cbw
		mov	[bp+var_A], ax
		push	ax

loc_3D2A1:
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+82h]
		call	WorldObject_GetNthChild_1F208
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_3D2BA
		jmp	loc_3D423

loc_3D2BA:
		mov	al, [si+68h]
		cbw
		imul	ax, ax, 39h
		les	bx, word ptr [bp+var_4]
		mov	dx, es:[bx+80h]
		mov	bx, es:[bx+7Eh]
		add	bx, ax
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		mov	[di+24h], si
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		add	dx, 9
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	si, [bp+var_E]
		mov	eax, es:[si]
		mov	[bp+var_4A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_46], eax
		mov	eax, es:[si+8]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_4A]
		mov	[di+12h], eax
		mov	eax, [bp+var_46]
		mov	[di+16h], eax
		mov	eax, [bp+var_42]
		mov	[di+1Ah], eax
		mov	ax, di
		add	ax, 12h
		push	di
		mov	bx, [di]
		call	dword ptr [bx+8]
		pop	cx
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		add	dx, 15h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	si, [bp+var_12]
		mov	eax, es:[si]
		mov	[bp+var_3E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_3A], eax
		mov	eax, es:[si+8]
		mov	[bp+var_36], eax
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		add	dx, 21h
		mov	[bp+var_14], ax
		mov	[bp+var_16], dx
		les	si, [bp+var_16]
		mov	eax, es:[si]
		mov	[bp+var_32], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2E], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2A], eax
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		add	dx, 2Dh
		mov	[bp+var_18], ax
		mov	[bp+var_1A], dx
		les	si, [bp+var_1A]
		mov	eax, es:[si]
		mov	[bp+var_26], eax
		mov	eax, es:[si+4]
		mov	[bp+var_22], eax
		mov	eax, es:[si+8]
		mov	[bp+var_1E], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+44h]
		add	sp, 4
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		mov	bx, [di+26h]
		mov	[bx+24h], eax
		mov	eax, [si+4]
		mov	[bx+28h], eax
		mov	eax, [si+8]
		mov	[bx+2Ch], eax
		or	byte ptr [bx+30h], 1
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	bx
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	bx, [di+26h]
		or	byte ptr [bx+30h], 2
		cmp	dword ptr [di+0Ah], 0
		jz	short loc_3D407
		push	large [di+0Ah]
		les	bx, [di+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_3D407:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+0Ch]
		pop	cx
		push	di
		mov	bx, [di]
		call	dword ptr [bx+8]
		pop	cx
		push	[bp+arg_2]
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_3D42C

loc_3D423:
		push	0B00Bh
		call	sub_1DDFE
		pop	cx

loc_3D42C:
		pop	di
		pop	si
		leave
		retf
sub_3D263		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D430		proc far

var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 56h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+86h], 0FFFFh
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	ebx, 20h
		cdq
		idiv	ebx
		mov	di, ax
		mov	bx, [bp+arg_0]
		cmp	es:[bx+69h], di
		jz	short loc_3D468
		push	0B00Ch
		call	sub_1DDFE
		pop	cx

loc_3D468:
		push	seg stub297
		push	offset sub_741C5
		push	5
		movsx	eax, di
		push	eax
		push	large 390000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+80h], dx
		mov	es:[bx+7Eh], ax
		mov	eax, es:[bx+7Eh]
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0
		jmp	loc_3D5ED

loc_3D4A3:
		push	large 20h
		push	ss
		lea	ax, [bp+var_32]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	8
		push	ss
		lea	ax, [bp+var_32]
		push	ax
		push	large [bp+var_4]
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+var_4]
		mov	byte ptr es:[bx+8], 0
		mov	eax, [bp+var_2A]
		mov	es:[bx+9], eax
		mov	eax, [bp+var_26]
		mov	es:[bx+0Dh], eax
		mov	eax, [bp+var_22]
		mov	es:[bx+11h], eax
		lea	ax, word ptr [bp+var_56]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 15h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		les	si, [bp+var_A]
		mov	eax, es:[si]
		mov	[bp+var_56], eax
		mov	eax, es:[si+4]
		mov	[bp+var_52], eax
		mov	eax, es:[si+8]
		mov	[bp+var_4E], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 21h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	si, [bp+var_E]
		mov	eax, es:[si]
		mov	[bp+var_4A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_46], eax
		mov	eax, es:[si+8]
		mov	[bp+var_42], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 2Dh
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	si, [bp+var_12]
		mov	eax, es:[si]
		mov	[bp+var_3E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_3A], eax
		mov	eax, es:[si+8]
		mov	[bp+var_36], eax
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		call	Matrix_BuildFullOrientation_5937B
		add	sp, 8
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_56]
		mov	es:[bx+15h], eax
		mov	eax, [bp+var_52]
		mov	es:[bx+19h], eax
		mov	eax, [bp+var_4E]
		mov	es:[bx+1Dh], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+21h], eax
		mov	eax, [bp+var_46]
		mov	es:[bx+25h], eax
		mov	eax, [bp+var_42]
		mov	es:[bx+29h], eax
		mov	eax, [bp+var_3E]
		mov	es:[bx+2Dh], eax
		mov	eax, [bp+var_3A]
		mov	es:[bx+31h], eax
		mov	eax, [bp+var_36]
		mov	es:[bx+35h], eax
		add	word ptr [bp+var_4], 39h
		inc	[bp+var_6]

loc_3D5ED:
		cmp	[bp+var_6], di
		jge	short loc_3D5F5
		jmp	loc_3D4A3

loc_3D5F5:
		or	di, di
		pop	di
		pop	si
		leave
		retf
sub_3D430		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D5FB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+86h], 0FFFFh
		jnz	short loc_3D621
		push	[bp+arg_2]
		push	bx
		nop
		push	cs
		call	near ptr sub_3D653
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+86h], 1
		jmp	short loc_3D629

loc_3D621:
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+86h]

loc_3D629:
		pop	bp
		retf
sub_3D5FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D62B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		dec	word ptr es:[bx+86h]
		cmp	word ptr es:[bx+86h], 0
		jnz	short loc_3D651
		mov	word ptr es:[bx+86h], 0FFFFh
		push	[bp+arg_2]
		push	bx
		nop
		push	cs
		call	near ptr sub_3D75B
		add	sp, 4

loc_3D651:
		pop	bp
		retf
sub_3D62B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D653		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+7Eh]
		mov	[bp+var_4], eax
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3D68D
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+9], 0
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		mov	ax, si
		jmp	short loc_3D68F

loc_3D68D:
		mov	ax, si

loc_3D68F:
		les	bx, [bp+arg_0]
		mov	es:[bx+82h], ax
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		cmp	eax, 7A120h
		ja	short loc_3D6AD
		mov	ax, 1
		jmp	short loc_3D6AF

loc_3D6AD:
		xor	ax, ax

loc_3D6AF:
		mov	word_7CD74, ax
		xor	di, di
		jmp	loc_3D74B

loc_3D6B7:
		cmp	word_7CD74, 0
		jz	short loc_3D6CA
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+69h]
		dec	ax
		cmp	ax, di
		jnz	short loc_3D746

loc_3D6CA:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	1
		push	large [bp+var_8]
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jz	short loc_3D71A
		push	ax
		push	67ADh
		call	sub_1E610
		add	sp, 4
		push	31h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_3D712
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, [bp+var_A]
		jmp	short loc_3D715

loc_3D712:
		mov	ax, [bp+var_A]

loc_3D715:
		mov	[si+26h], ax
		jmp	short loc_3D723

loc_3D71A:
		push	0C027h
		call	sub_1DDFE
		pop	cx

loc_3D723:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+82h], 0
		jz	short loc_3D746
		mov	word ptr [si+24h], 0
		mov	[bp+var_C], si
		push	[bp+var_C]
		push	word ptr es:[bx+82h]
		call	sub_1EFF9
		add	sp, 4

loc_3D746:
		inc	di
		add	word ptr [bp+var_4], 39h

loc_3D74B:
		les	bx, [bp+arg_0]
		cmp	es:[bx+69h], di
		jle	short loc_3D757
		jmp	loc_3D6B7

loc_3D757:
		pop	di
		pop	si
		leave
		retf
sub_3D653		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D75B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	3
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+82h]
		call	Container_Op_1EFD2
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+82h], 0
		pop	bp
		retf
sub_3D75B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D77C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	sub_36CAA
		add	sp, 4
		mov	al, [si+67h]
		and	ax, 1
		or	al, al
		jz	short loc_3D7AA
		cmp	byte ptr [si+68h], 0FFh
		jz	short loc_3D7AA
		push	di
		push	si
		push	cs
		call	near ptr sub_3D263
		add	sp, 4

loc_3D7AA:
		pop	di
		pop	si
		pop	bp
		retf
sub_3D77C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D7AE		proc far

var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	Camera_ResolvePositionVelocity_3C647
		pop	cx
		mov	[bp+var_1], al
		push	large [si+63h]
		call	sub_414D4
		add	sp, 4
		mov	al, [si+77h]
		and	ax, 1
		or	al, al
		jz	short loc_3D7DD
		mov	al, 0
		jmp	loc_3D9F7

loc_3D7DD:
		mov	al, [si+67h]
		and	ax, 1
		or	al, al
		jnz	short loc_3D7EA
		jmp	loc_3D9AF

loc_3D7EA:
		mov	al, [si+77h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jnz	short loc_3D7FA
		jmp	loc_3D943

loc_3D7FA:
		mov	ax, [si+75h]
		cmp	ax, word_78A64
		jge	short loc_3D806
		jmp	loc_3D937

loc_3D806:
		mov	ax, word_78A64
		sub	[si+75h], ax
		mov	al, [si+77h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_3D81B
		jmp	loc_3D8AF

loc_3D81B:
		cmp	byte ptr [si+68h], 0
		jl	short loc_3D882
		mov	al, [si+68h]
		cbw
		les	bx, [si+0Eh]
		mov	dx, es:[bx+69h]
		dec	dx
		cmp	ax, dx
		jnz	short loc_3D87C
		cmp	word_7977C, 5
		jbe	short loc_3D87C
		cmp	si, word_7CADA
		jnz	short loc_3D87C
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		cmp	ax, word_7CADA
		jz	short loc_3D86D
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	bx, ax
		mov	ax, [bx+24h]
		cmp	ax, word_7CADA
		jnz	short loc_3D87C

loc_3D86D:
		push	0
		push	large 0
		push	5
		call	sub_5EB62
		add	sp, 8

loc_3D87C:
		dec	byte ptr [si+68h]
		jmp	loc_3D9AF

loc_3D882:
		and	byte ptr [si+77h], 0FBh
		mov	al, [si+77h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+77h], 0FDh
		shl	al, 1
		or	[si+77h], al
		push	large [si+0Eh]
		push	cs
		call	near ptr sub_3D62B
		add	sp, 4
		jmp	loc_3D9AF

loc_3D8AF:
		mov	al, [si+68h]
		cbw
		les	bx, [si+0Eh]
		mov	dx, es:[bx+69h]
		dec	dx
		cmp	ax, dx
		jge	short loc_3D916
		cmp	byte ptr [si+68h], 0
		jnz	short loc_3D910
		cmp	word_7977C, 5
		jbe	short loc_3D910
		cmp	si, word_7CADA
		jnz	short loc_3D910
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		cmp	ax, word_7CADA
		jz	short loc_3D901
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	bx, ax
		mov	ax, [bx+24h]
		cmp	ax, word_7CADA
		jnz	short loc_3D910

loc_3D901:
		push	0
		push	large 0
		push	6
		call	sub_5EB62
		add	sp, 8

loc_3D910:
		inc	byte ptr [si+68h]
		jmp	loc_3D9AF

loc_3D916:
		and	byte ptr [si+77h], 0FBh
		mov	al, [si+77h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+77h], 0FDh
		shl	al, 1
		or	[si+77h], al
		jmp	short loc_3D9AF

loc_3D937:
		mov	ax, [si+75h]
		add	ax, word ptr dword_7976E
		mov	[si+75h], ax
		jmp	short loc_3D9AF

loc_3D943:
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0
		jz	short loc_3D97D
		mov	al, [si+77h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D97D
		push	large [si+0Eh]
		push	cs
		call	near ptr sub_3D5FB
		add	sp, 4

loc_3D97D:
		cmp	[bp+var_2], 0
		jz	short loc_3D991
		mov	al, [si+77h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_3D9A6

loc_3D991:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D9AF
		mov	al, [si+77h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_3D9AF

loc_3D9A6:
		or	byte ptr [si+77h], 4
		mov	word ptr [si+75h], 0

loc_3D9AF:
		cmp	word ptr [si+6Ah], 0
		jz	short loc_3D9F4
		mov	bx, [si+6Ah]
		mov	ax, [bx+0Ch]
		mov	dx, [bx+0Ah]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	ax
		push	dx
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		or	al, al
		jz	short loc_3D9F4
		mov	al, [si+69h]
		inc	al
		mov	[si+69h], al
		cmp	al, 3
		jb	short loc_3D9F4
		push	0
		push	large [bp+var_6]
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_3D9F4:
		mov	al, [bp+var_1]

loc_3D9F7:
		pop	si
		leave
		retf
sub_3D7AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D9FA		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+77h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_3DA14
		jmp	loc_3DB71

loc_3DA14:
		push	si
		call	WorldObject_IntegrateBodyMotion_3BB2C
		pop	cx
		cmp	word_7CD76, 0
		jz	short loc_3DA65
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	di, ax
		mov	bx, [di]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_3DA65
		push	word_7CD76
		push	ss
		lea	ax, word ptr [bp+var_26]
		push	ax
		mov	bx, word_7CD76
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_26]
		add	[si+12h], eax
		mov	eax, [bp+var_22]
		add	[si+16h], eax
		mov	eax, [bp+var_1E]
		add	[si+1Ah], eax

loc_3DA65:
		cmp	word_7CADA, si
		jnz	short loc_3DA8C
		cmp	byte_776BB, 0
		jz	short loc_3DA8C
		mov	[bp+var_4], 100h
		lea	ax, word ptr [bp+var_4]
		push	ax
		mov	ax, si
		add	ax, 6Ch
		push	ax
		call	Timer_SetAbsolute_50699
		add	sp, 4

loc_3DA8C:
		cmp	word_7CADA, si
		jnz	short loc_3DADB
		mov	di, si
		add	di, 6Ch
		mov	eax, [di]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jg	short loc_3DADB
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_3DADB
		mov	[bp+var_C], 100h
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 6Ch
		push	ax
		call	Timer_SetAbsolute_50699
		add	sp, 4

loc_3DADB:
		mov	di, si
		add	di, 6Ch
		mov	eax, [di]
		mov	[bp+var_12], eax
		cmp	[bp+var_12], 0
		jle	short loc_3DAF3
		mov	ax, 1
		jmp	short loc_3DAF5

loc_3DAF3:
		xor	ax, ax

loc_3DAF5:
		mov	[bp+var_D], al
		mov	ax, si
		add	ax, 6Ch
		push	ax
		call	Timer_Tick_506DD
		pop	cx
		or	al, al
		jz	short loc_3DB63
		movsx	eax, word ptr [si+71h]
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	di, si
		add	di, 6Ch
		mov	eax, [di]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_16]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16], eax
		lea	ax, word ptr [bp+var_16]
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildAxisX_ApplyToObject_5927C
		add	sp, 4
		lea	ax, word ptr [bp+var_16]
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildAxisZ_ApplyToObject_59326
		add	sp, 4
		mov	ax, [si+71h]
		neg	ax
		mov	[si+71h], ax
		jmp	short loc_3DB71

loc_3DB63:
		cmp	[bp+var_D], 0
		jz	short loc_3DB71
		push	0
		call	sub_1B9E8
		pop	cx

loc_3DB71:
		pop	di
		pop	si
		leave
		retf
sub_3D9FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DB75		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 6
		pop	bp
		retf
sub_3DB75		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DB7F		proc far

var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	[bp+var_4], 2D00h
		or	bx, bx
		jnz	short loc_3DB9C
		jmp	loc_3DC69

loc_3DB9C:
		cmp	bx, si
		jnz	short loc_3DBA3
		jmp	loc_3DC69

loc_3DBA3:
		mov	di, bx
		add	di, 12h
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_6], ax
		mov	eax, [di]
		mov	bx, [bp+var_6]
		sub	eax, [bx]
		mov	[bp+var_2E], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_2A], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_1A], eax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_1E]
		mov	[bp+var_A], eax
		push	large [bp+var_1A]
		push	eax
		push	large [bp+var_22]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	ecx, [bp+var_12]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_16]
		jl	short loc_3DC5F
		mov	ax, 1
		jmp	short loc_3DC61

loc_3DC5F:
		xor	ax, ax

loc_3DC61:
		or	al, al
		jz	short loc_3DC69
		mov	al, 1
		jmp	short loc_3DC6B

loc_3DC69:
		mov	al, 0

loc_3DC6B:
		pop	di
		pop	si
		leave
		retf
sub_3DB7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DC6F		proc far

var_36		= word ptr -36h
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jnz	short loc_3DC84
		jmp	loc_3DD8C

loc_3DC84:
		push	si
		push	ss
		lea	ax, word ptr [bp+var_2A]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_22]
		push	large [bp+var_26]
		push	large [bp+var_2A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	[bp+var_C], 25A00h
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	[bp+var_16], 0
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_16]
		jle	short loc_3DD0E
		mov	ax, 1
		jmp	short loc_3DD10

loc_3DD0E:
		xor	ax, ax

loc_3DD10:
		mov	[bp+var_11], al
		cmp	[bp+var_11], 0
		jz	short loc_3DD23
		mov	eax, [bp+var_4]
		imul	eax, eax, 64h
		jmp	short loc_3DD2B

loc_3DD23:
		mov	eax, [bp+var_4]
		imul	eax, eax, 32h

loc_3DD2B:
		mov	[bp+var_4], eax
		add	[bp+var_4], 0A00h
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		les	bx, [bp+var_1C]
		cmp	byte ptr es:[bx+1Eh], 5
		jle	short loc_3DD5C
		mov	ax, 1
		jmp	short loc_3DD5E

loc_3DD5C:
		xor	ax, ax

loc_3DD5E:
		mov	[bp+var_17], al
		cmp	[bp+var_17], 0
		jz	short loc_3DD7F
		cmp	[bp+var_11], 0
		jz	short loc_3DD77
		add	[bp+var_4], 6400h
		jmp	short loc_3DD7F

loc_3DD77:
		add	[bp+var_4], 3200h

loc_3DD7F:
		mov	eax, [bp+var_4]
		sar	eax, 8
		mov	[bp+var_1D], al
		jmp	short loc_3DD93

loc_3DD8C:
		les	bx, [si+0Eh]
		mov	al, es:[bx+18h]

loc_3DD93:
		pop	di
		pop	si
		leave
		retf
sub_3DC6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DD97		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
sub_3DD97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Pilot_NotifySubcomponentDestroy (sub_3E440 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,24L
; — si un composant référencé (+0x65) existe, notifie sa destruction (vtable+0xA, vtable[4])
; et efface un flag (+0x67) : nettoyage/notification de destruction d'un sous-composant lié au
; pilotage.
; ==============================================================================================
Pilot_NotifySubcomponentDestroy		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+6Ah], 0
		jz	short loc_3DDE4
		push	1
		mov	bx, [si+6Ah]
		push	large [bx+0Ah]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	byte ptr [si+69h], 0

loc_3DDE4:
		pop	si
		pop	bp
		retf
Pilot_NotifySubcomponentDestroy		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Pilot_LowLevelControlCommand (sub_3E469 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,37L
; — récupère l'orientation via vtable[0x48], appelle sub_49242 (chaîne PhysicsTick/calibration
; déjà documentée dans le projet) avec les angles, puis réinitialise l'état neutre
; (Goal_ResetNeutralState) sur une cible référencée (+0x55) : commande de pilotage bas niveau
; reliant orientation caméra/vue et tick physique — point de jonction avec la chaîne sub_49242
; déjà en cours d'investigation.
; ==============================================================================================
Pilot_LowLevelControlCommand		proc far

var_6		= dword ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		sub	sp, 4
		mov	eax, [bp+arg_6]
		mov	[bp+var_6], eax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		push	ax
		call	JDYN_JumpToPoint_4936E
		add	sp, 0Ah
		push	large [si+5Ah]
		call	sub_11C42
		add	sp, 4
		pop	si
		pop	bp
		retf
Pilot_LowLevelControlCommand		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DE23		proc far
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
sub_3DE23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DE2A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3DE76
		mov	word ptr [si], 2210h
		mov	ax, si
		add	ax, 73h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	2
		mov	ax, si
		add	ax, 63h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	si
		call	sub_3C725
		add	sp, 4
		test	di, 1
		jz	short loc_3DE76
		push	si
		call	sub_3B2
		pop	cx

loc_3DE76:
		pop	di
		pop	si
		pop	bp
		retf
sub_3DE2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DE7A		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_3DE8E
		jmp	loc_3DF86

loc_3DE8E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1E64h
		cmp	word ptr es:[bx+82h], 0
		jz	short loc_3DEB7
		push	3
		push	word ptr es:[bx+82h]
		call	Container_Op_1EFD2
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+82h], 0

loc_3DEB7:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+7Eh], 0
		jz	short loc_3DEEA
		mov	eax, es:[bx+7Eh]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+7Eh], 0

loc_3DEEA:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+88h], 0
		jz	short loc_3DF11
		push	large es:[bx+88h]
		call	sub_3C0
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+88h], 0

loc_3DF11:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+8Ch], 0
		jz	short loc_3DF38
		push	large es:[bx+8Ch]
		call	sub_3C0
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+8Ch], 0

loc_3DF38:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+61h]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	large [bp+arg_0]
		call	Camera_DestructCompoundA
		add	sp, 6
		test	si, 1
		jz	short loc_3DF86
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_3DF86:
		pop	si
		leave
		retf
sub_3DE7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Aircraft_GroundClearance_3E5A6 (sub_3E5A6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-09-26 (ex-'Gauge_ComputeNeedlePosition' : rien a voir avec une jauge). GARDE AU SOL
; de l'avion : hauteur de l'origine de l'objet (arg_4, matrice +0x2C) au-dessus du terrain
; selon son attitude, sur trois points de contact a constantes fixes communes a tous les
; avions. r = -Matrix_RollAngle_57C67, p = Matrix_NosePitchAngle_57C3A ; A = 6,17 (62Ch) *
; cos(p + 34,27 deg (2245h)) ; h1 = A * cos(r - 39,43 deg (D892h)) ; h2 = A * cos(r + 39,43
; deg (276Eh)) ; h3 = 6,85 (6D9h) * cos(p - 45,37 deg (D2A1h)) ; renvoie max(h1, h2, h3) (4,81
; m a plat). Utilisee par PhysicsTicks (drapeau 'au sol' efface si altitude > terrain + garde
; + 10 m), Collision_SelectCandidates et Landing_Phase5_Stop_76E67 (altitude de l'avion
; arrete).
; ==============================================================================================
Aircraft_GroundClearance_3DF89		proc far

var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
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
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 74h
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 6D9h
		mov	[bp+var_8], 62Ch
		mov	[bp+var_C], 0
		mov	[bp+var_10], 0FFFFD2A1h
		mov	[bp+var_14], 0FFFFD892h
		mov	[bp+var_18], 276Eh
		mov	[bp+var_1C], 2245h
		mov	ax, si
		add	ax, 2Dh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_24]
		neg	eax
		mov	[bp+var_28], eax
		mov	[bp+var_20], eax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2C]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	eax, [bp+var_1C]
		add	eax, [bp+var_2C]
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_44]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_44]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_14]
		add	eax, [bp+var_20]
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_50]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_18]
		add	eax, [bp+var_20]
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_5C]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_34]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_10]
		add	eax, [bp+var_2C]
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_68]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_68]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_74]
		jle	short loc_3E106
		mov	[bp+var_74], eax

loc_3E106:
		mov	eax, [bp+var_38]
		cmp	eax, [bp+var_74]
		jle	short loc_3E114
		mov	[bp+var_74], eax

loc_3E114:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_74]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aircraft_GroundClearance_3DF89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E127		proc far
		push	bp
		mov	bp, sp
		mov	word_7CD76, 0
		pop	bp
		retf
sub_3E127		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E132		proc far
		push	bp
		mov	bp, sp
		push	6646h
		call	WeakRef_InvalidateIfSet
		pop	cx
		pop	bp
		retf
sub_3E132		endp
seg098		ends
