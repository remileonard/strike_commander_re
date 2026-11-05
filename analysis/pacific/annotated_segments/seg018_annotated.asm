seg018		segment	para public 'CODE' use16
		assume cs:seg018
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C2h, 5, 8, 0

loc_9554:
		db 8Bh, 0C2h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9558		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	dx, 0FF4Ch
		jge	short loc_956A
		add	dx, 168h
		jmp	short loc_9574

loc_956A:
		cmp	dx, 0B4h
		jle	short loc_9574
		sub	dx, 168h

loc_9574:
		mov	ax, dx
		pop	bp
		retf
sub_9558		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9578		proc far

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
var_14		= word ptr -14h
var_13		= word ptr -13h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0
		mov	word ptr es:[bx+21h], 0
		mov	word ptr es:[bx+23h], 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 1
		and	ax, 1
		and	ax, 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		and	ax, 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		mov	byte_7C810, 0FFh
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	dword_7C81D, eax
		mov	eax, [si+4]
		mov	dword_7C821, eax
		mov	eax, [si+8]
		mov	dword_7C825, eax
		mov	eax, dword_7C81D
		mov	dword_7C811, eax
		mov	eax, dword_7C821
		mov	dword_7C815, eax
		mov	eax, dword_7C825
		mov	dword_7C819, eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	si, [bx]
		add	si, 2
		mov	eax, [si]
		mov	[bp+var_30], eax
		mov	eax, [si+4]
		mov	[bp+var_2C], eax
		mov	eax, [si+8]
		mov	[bp+var_28], eax
		push	eax
		push	large [bp+var_2C]
		push	large [bp+var_30]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_C+1]
		mov	word_7C82B, ax
		mov	word_7C829, ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0B400h
		jle	short loc_96B5
		sub	[bp+var_4], 16800h
		jmp	short loc_96C9

loc_96B5:
		cmp	[bp+var_4], 0FFFF4C00h
		jge	short loc_96C9
		add	[bp+var_4], 16800h
		jmp	short loc_96C9

loc_96C9:
		mov	ax, word ptr [bp+var_4+1]
		mov	word_7C833, ax
		mov	word_7C831, ax
		push	60EDh
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	ax, [bp+var_13]
		mov	word_7C82F, ax
		mov	word_7C82D, ax
		mov	word_7C835, 0
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		mov	dword_7C83B, eax
		mov	eax, [si+4]
		mov	dword_7C83F, eax
		mov	eax, [si+8]
		mov	dword_7C843, eax
		sar	eax, 8
		mov	dword_7C837, eax
		push	0
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_3C], eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_38], eax
		mov	[bp+var_20], 100h
		mov	eax, [bp+var_20]
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	610Bh
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_24]
		sar	eax, 8
		sub	dword_7C837, eax
		mov	byte_7C847, 0
		mov	byte_7C848, 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		pop	si
		leave
		retf
sub_9578		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_978B		proc far

var_4		= word ptr -4
var_3		= word ptr -3

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	word_7C835, 0
		jnz	short loc_97D1
		mov	ax, word_7C82F
		cmp	ax, word_7C82D
		jnz	short loc_97D1
		mov	ax, word_7C831
		cmp	ax, word_7C833
		jnz	short loc_97D1
		push	60E1h
		push	60EDh
		call	sub_A41D
		add	sp, 4
		mov	word_7C835, ax
		push	60E1h
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	ax, [bp+var_3]
		mov	word_7C82F, ax

loc_97D1:
		leave
		retf
sub_978B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_97D3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cl, bl
		mov	al, bl
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 6
		ja	short loc_9852
		shl	bx, 1
		jmp	cs:off_9882[bx]	; switch jump

loc_97F0:
		mov	cl, dl
		jmp	short loc_9852

loc_97F4:
		mov	al, dl
		mov	ah, 0
		sub	ax, 2
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_9852
		shl	bx, 1
		jmp	cs:off_9878[bx]	; switch jump

loc_9809:
		mov	cl, 3
		jmp	short loc_9852

loc_980D:
		jmp	short loc_97F0

loc_980F:
		mov	al, dl
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 5
		ja	short loc_9852
		shl	bx, 1
		jmp	cs:off_986C[bx]	; switch jump

loc_9822:
		mov	cl, 4
		jmp	short loc_9852

loc_9826:
		jmp	short loc_97F0

loc_9828:
		mov	al, dl
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 5
		ja	short loc_9852
		shl	bx, 1
		jmp	cs:off_9860[bx]	; switch jump

loc_983B:
		jmp	short loc_97F0

loc_983D:
		mov	al, dl
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_9852
		shl	bx, 1
		jmp	cs:off_9856[bx]	; switch jump

loc_9850:
		jmp	short loc_97F0

loc_9852:
		mov	al, cl
		pop	bp
		retf
sub_97D3		endp

; START OF FUNCTION CHUNK FOR sub_97D3
off_9856	dw offset loc_9850
		dw offset loc_9850
		dw offset loc_9850
		dw offset loc_9852
		dw offset loc_9850
off_9860	dw offset loc_983B
		dw offset loc_983B
		dw offset loc_9852
		dw offset loc_983B
		dw offset loc_9852
		dw offset loc_983B
off_986C	dw offset loc_9826
		dw offset loc_9852
		dw offset loc_9826
		dw offset loc_9852
		dw offset loc_9826
		dw offset loc_9822
off_9878	dw offset loc_980D
		dw offset loc_9852
		dw offset loc_980D
		dw offset loc_9809
		dw offset loc_980D
off_9882	dw offset loc_97F0
		dw offset loc_97F4
		dw offset loc_980F
		dw offset loc_9828
		dw offset loc_983D
		dw offset loc_97F0
		dw offset loc_97F0
; END OF FUNCTION CHUNK FOR sub_97D3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9890		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_978B
		cmp	word_7C835, 0
		jz	short loc_98A9
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_98E7
		jmp	short loc_98CF

loc_98A9:
		mov	ax, word_7C82F
		cmp	ax, word_7C82D
		jz	short loc_98BD
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9AC0
		jmp	short loc_98CF

loc_98BD:
		mov	ax, word_7C833
		cmp	ax, word_7C831
		jz	short loc_98D2
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9BCD

loc_98CF:
		add	sp, 4

loc_98D2:
		cmp	word_7C82B, 0
		jz	short loc_98E5
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9C3D
		add	sp, 4

loc_98E5:
		pop	bp
		retf
sub_9890		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_98E7		proc far

var_2		= byte ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_7C835, 14h
		jle	short loc_98FA
		mov	[bp+var_2], 2
		jmp	short loc_9932

loc_98FA:
		cmp	word_7C835, 1
		jle	short loc_9907
		mov	[bp+var_2], 4
		jmp	short loc_9932

loc_9907:
		cmp	word_7C835, 0
		jl	short loc_9914
		mov	[bp+var_2], 6
		jmp	short loc_9932

loc_9914:
		cmp	word_7C835, 0FFFEh
		jle	short loc_9921
		mov	[bp+var_2], 5
		jmp	short loc_9932

loc_9921:
		cmp	word_7C835, 0FFEBh
		jle	short loc_992E
		mov	[bp+var_2], 3
		jmp	short loc_9932

loc_992E:
		mov	[bp+var_2], 1

loc_9932:
		mov	al, [bp+var_2]
		push	ax
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0F9h]
		push	ax
		push	cs
		call	near ptr sub_97D3
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0F9h], al
		mov	[bp+var_2], al
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 5
		ja	short loc_99A4
		shl	bx, 1
		jmp	cs:off_99A6[bx]	; switch jump

loc_9962:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_99B2
		jmp	short loc_99A1

loc_996D:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9AC0
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0F8h]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_99A4
		cmp	ax, 2
		jz	short loc_99A4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9A4D
		jmp	short loc_99A1

loc_9998:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9AC0

loc_99A1:
		add	sp, 4

loc_99A4:
		leave
		retf
sub_98E7		endp

; START OF FUNCTION CHUNK FOR sub_98E7
off_99A6	dw offset loc_9962
		dw offset loc_9962
		dw offset loc_996D
		dw offset loc_996D
		dw offset loc_9998
		dw offset loc_9998
; END OF FUNCTION CHUNK FOR sub_98E7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99B2		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	bx, word_7C82F
		sub	bx, word_7C82D
		cmp	bx, 1Eh
		jle	short loc_99CD
		mov	word_7C833, 32h
		jmp	short loc_9A02

loc_99CD:
		cmp	bx, 0FFE2h
		jl	short loc_99E6
		mov	ax, word_7C831
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jle	short loc_99EE
		or	bx, bx
		jge	short loc_99EE

loc_99E6:
		mov	word_7C833, 8Ch
		jmp	short loc_9A02

loc_99EE:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0B2h]
		cbw
		mov	bx, ax
		mov	al, [bx+60D1h]
		mov	ah, 0
		mov	word_7C833, ax

loc_9A02:
		cmp	word_7C835, 0
		jge	short loc_9A11
		mov	ax, word_7C833
		neg	ax
		mov	word_7C833, ax

loc_9A11:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9BCD
		add	sp, 4
		cmp	byte_7C847, 0
		jnz	short loc_9A3E
		mov	ax, word_7C833
		sub	ax, word_7C831
		push	ax
		push	cs
		call	near ptr sub_9558
		pop	cx
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0Fh
		jge	short loc_9A4B

loc_9A3E:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 10h

loc_9A4B:
		leave
		retf
sub_99B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9A4D		proc far

var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	word_7C833, 0Fh
		cmp	word_7C835, 0
		jge	short loc_9A68
		mov	ax, word_7C833
		neg	ax
		mov	word_7C833, ax

loc_9A68:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9BCD
		add	sp, 4
		mov	ax, word_7C833
		sub	ax, word_7C831
		push	ax
		push	cs
		call	near ptr sub_9558
		pop	cx
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0Fh
		jge	short loc_9ABE
		cmp	word_7C835, 0
		jge	short loc_9AA4
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0FFF0h
		jmp	short loc_9AB1

loc_9AA4:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 10h

loc_9AB1:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 2

loc_9ABE:
		leave
		retf
sub_9A4D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9AC0		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	dx, word_7C82F
		sub	dx, word_7C82D
		cmp	dx, 0Fh
		jle	short loc_9ADA
		mov	[bp+var_2], 2
		jmp	short loc_9B09

loc_9ADA:
		cmp	dx, 3
		jle	short loc_9AE5
		mov	[bp+var_2], 4
		jmp	short loc_9B09

loc_9AE5:
		or	dx, dx
		jl	short loc_9AEF
		mov	[bp+var_2], 6
		jmp	short loc_9B09

loc_9AEF:
		cmp	dx, 0FFFCh
		jle	short loc_9AFA
		mov	[bp+var_2], 5
		jmp	short loc_9B09

loc_9AFA:
		cmp	dx, 0FFF0h
		jle	short loc_9B05
		mov	[bp+var_2], 3
		jmp	short loc_9B09

loc_9B05:
		mov	[bp+var_2], 1

loc_9B09:
		mov	al, [bp+var_2]
		push	ax
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0F8h]
		push	ax
		push	cs
		call	near ptr sub_97D3
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0F8h], al
		mov	[bp+var_2], al
		cmp	[bp+var_2], 1
		jnz	short loc_9B36
		mov	word_7C833, 0B4h
		jmp	short loc_9B3C

loc_9B36:
		mov	word_7C833, 0

loc_9B3C:
		cmp	byte_7C847, 0
		jz	short loc_9B62
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, 5
		jz	short loc_9B82
		cmp	ax, 6
		jz	short loc_9B82
		jmp	short loc_9B56
		jmp	short loc_9B82

loc_9B56:
		cmp	byte_7C848, 0

loc_9B5B:
		mov	si, 10h
		jmp	short loc_9B84
		jmp	short loc_9B5B

loc_9B62:
		mov	al, [bp+var_2]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_9B82
		shl	bx, 1
		jmp	cs:off_9BC5[bx]	; switch jump

loc_9B76:
		jmp	short loc_9B5B

loc_9B78:
		mov	si, 0FFFAh
		jmp	short loc_9B84

loc_9B7D:
		mov	si, 6
		jmp	short loc_9B84

loc_9B82:
		xor	si, si

loc_9B84:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_9BCD
		add	sp, 4
		cmp	byte_7C847, 0
		jnz	short loc_9BB1
		mov	ax, word_7C833
		sub	ax, word_7C831
		push	ax
		push	cs
		call	near ptr sub_9558
		pop	cx
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0Fh
		jge	short loc_9BC2

loc_9BB1:
		mov	[bp+var_6], si
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, [bp+var_6]
		mov	es:[bx+1Fh], ax

loc_9BC2:
		pop	si
		leave
		retf
sub_9AC0		endp

; START OF FUNCTION CHUNK FOR sub_9AC0
off_9BC5	dw offset loc_9B76
		dw offset loc_9B76
		dw offset loc_9B78
		dw offset loc_9B7D
; END OF FUNCTION CHUNK FOR sub_9AC0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9BCD		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	ax, word_7C833
		sub	ax, word_7C831
		push	ax
		push	cs
		call	near ptr sub_9558
		pop	cx
		mov	dx, ax
		cmp	dx, 1Eh
		jle	short loc_9C04
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B2h]
		cbw
		mov	bx, ax
		mov	al, [bx+60CEh]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		jmp	short loc_9C37

loc_9C04:
		cmp	dx, 0FFE2h
		jle	short loc_9C1A
		mov	ax, dx
		sar	ax, 2
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		jmp	short loc_9C37

loc_9C1A:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B2h]
		cbw
		mov	bx, ax
		mov	al, [bx+60CEh]
		mov	ah, 0
		neg	ax
		mov	[bp+var_6], ax
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]

loc_9C37:
		mov	es:[bx+21h], ax
		leave
		retf
sub_9BCD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9C3D		proc far

var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	dx, word_7C82B
		sub	dx, word_7C829
		cmp	dx, 14h
		jle	short loc_9C56
		mov	[bp+var_2], 2
		jmp	short loc_9C85

loc_9C56:
		cmp	dx, 1
		jle	short loc_9C61
		mov	[bp+var_2], 4
		jmp	short loc_9C85

loc_9C61:
		or	dx, dx
		jl	short loc_9C6B
		mov	[bp+var_2], 6
		jmp	short loc_9C85

loc_9C6B:
		cmp	dx, 0FFFEh
		jle	short loc_9C76
		mov	[bp+var_2], 5
		jmp	short loc_9C85

loc_9C76:
		cmp	dx, 0FFEBh
		jle	short loc_9C81
		mov	[bp+var_2], 3
		jmp	short loc_9C85

loc_9C81:
		mov	[bp+var_2], 1

loc_9C85:
		mov	al, [bp+var_2]
		push	ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0FAh]
		push	ax
		push	cs
		call	near ptr sub_97D3
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+0FAh], al
		mov	[bp+var_2], al
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 5
		ja	short loc_9CEB
		shl	bx, 1
		jmp	cs:off_9CFE[bx]	; switch jump

loc_9CB5:
		mov	[bp+var_4], 8
		jmp	short loc_9CEB

loc_9CBB:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		xor	al, 1
		and	ax, 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al

loc_9CE1:
		mov	[bp+var_4], 1
		jmp	short loc_9CEB

loc_9CE7:
		mov	[bp+var_4], 0Ah

loc_9CEB:
		mov	al, [bp+var_4]
		mov	[bp+var_6], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Eh], al
		leave
		retf
sub_9C3D		endp

; START OF FUNCTION CHUNK FOR sub_9C3D
off_9CFE	dw offset loc_9CBB
		dw offset loc_9CE7
		dw offset loc_9CE1
		dw offset loc_9CE7
		dw offset loc_9CB5
		dw offset loc_9CB5
; END OF FUNCTION CHUNK FOR sub_9C3D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9D0A		proc far

var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_9D1C
		jmp	loc_9EC5

loc_9D1C:
		mov	[bp+var_2], di
		push	[bp+var_2]
		push	6090h
		call	SetReference16
		add	sp, 4
		push	word_7C7C0
		mov	bx, word_7C7C0
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_9D4E
		push	word_7C7C0
		mov	bx, word_7C7C0
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_9D50

loc_9D4E:
		mov	al, 1Ch

loc_9D50:
		mov	byte_7C7C2, al
		mov	si, word_7C7C0
		add	si, 12h
		mov	eax, [si]
		mov	dword_7C7C3, eax
		mov	eax, [si+4]
		mov	dword_7C7C7, eax
		mov	eax, [si+8]
		mov	dword_7C7CB, eax
		sar	eax, 8
		mov	dword_7C7CF, eax
		push	0
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_3C], eax
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		mov	[bp+var_38], eax
		mov	[bp+var_E], 100h
		mov	eax, [bp+var_E]
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6093h
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_12]
		sar	eax, 8
		sub	dword_7C7CF, eax
		mov	eax, dword_7C83B
		sub	dword_7C7C3, eax
		mov	eax, dword_7C83F
		sub	dword_7C7C7, eax
		mov	eax, dword_7C843
		sub	dword_7C7CB, eax
		push	6093h
		push	60EDh
		call	sub_A41D
		add	sp, 4
		mov	word_7C7D3, ax
		push	word_7C7C0
		mov	bx, word_7C7C0
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	60EDh
		call	sub_A41D
		add	sp, 4
		mov	word_7C7D5, ax
		push	large dword_7C7CB
		push	large dword_7C7C7
		push	large dword_7C7C3
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		sar	eax, 8
		mov	dword_7C7D9, eax
		push	word_7C7C0
		push	ss
		lea	ax, word ptr [bp+var_48]
		push	ax
		mov	bx, word_7C7C0
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_40]
		push	large [bp+var_44]
		push	large [bp+var_48]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	ax, word ptr [bp+var_22+1]
		mov	word_7C7DD, ax
		mov	eax, dword_7C7C3
		neg	eax
		mov	[bp+var_30], eax
		mov	eax, dword_7C7C7
		neg	eax
		mov	[bp+var_2C], eax
		mov	eax, dword_7C7CB
		neg	eax
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_24], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	word_7C7D7, ax

loc_9EC5:
		pop	di
		pop	si
		leave
		retf
sub_9D0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9EC9		proc far
		push	bp
		mov	bp, sp
		mov	word_7C7C0, 0
		pop	bp
		retf
sub_9EC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9ED4		proc far
		push	bp
		mov	bp, sp
		push	6090h
		call	WeakRef_InvalidateIfSet
		pop	cx
sub_9ED4		endp
seg018		ends
