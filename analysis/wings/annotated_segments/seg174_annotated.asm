seg174		segment	para public 'CODE' use16
		assume cs:seg174
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_563B0		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_563D0
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_563D0
		jmp	loc_56494

loc_563D0:
		mov	al, byte_5E800
		mov	ah, 0
		or	ax, ax
		jz	short loc_563DC
		jmp	loc_56494

loc_563DC:
		mov	[bp+var_1], 0
		push	large 0C0000h
		push	693Eh
		call	CRT_Memset_Public
		add	sp, 6
		xor	di, di
		jmp	short loc_563FD

loc_563F5:
		push	di
		nop
		push	cs
		call	near ptr sub_56B4C
		pop	cx
		inc	di

loc_563FD:
		cmp	di, 2
		jl	short loc_563F5
		push	693Eh
		push	word_60692
		call	Joystick_ReadAxesAndButtons_54EF1
		xor	di, di
		jmp	short loc_5646B

loc_56412:
		mov	bx, di
		imul	bx, bx, 6
		mov	ax, [bx+693Eh]
		cmp	ax, word_60692
		jnb	short loc_5642C
		mov	byte ptr [di+694Ch], 1
		mov	[bp+var_1], 1
		jmp	short loc_56431

loc_5642C:
		mov	byte ptr [di+694Ch], 0

loc_56431:
		mov	bx, di
		imul	bx, bx, 6
		mov	ax, [bx+6940h]
		cmp	ax, word_60692
		jnb	short loc_5644B
		mov	byte ptr [di+694Eh], 1
		mov	[bp+var_1], 1
		jmp	short loc_56450

loc_5644B:
		mov	byte ptr [di+694Eh], 0

loc_56450:
		cmp	byte ptr [di+694Ch], 0
		jz	short loc_56465
		cmp	byte ptr [di+694Eh], 0
		jz	short loc_56465
		mov	byte ptr [di+694Ah], 1
		jmp	short loc_5646A

loc_56465:
		mov	byte ptr [di+694Ah], 0

loc_5646A:
		inc	di

loc_5646B:
		cmp	di, 2
		jl	short loc_56412
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_56481
		nop
		push	cs
		call	near ptr sub_564B6
		mov	[bp+var_1], al

loc_56481:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5648F
		nop
		push	cs
		call	near ptr sub_56554

loc_5648F:
		mov	byte_5E800, 1

loc_56494:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_563B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5649A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_564B4
		test	dx, 1
		jz	short loc_564B4
		push	ax
		call	sub_33B
		pop	cx

loc_564B4:
		pop	bp
		retf
sub_5649A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_564B6		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	ah, 84h
		mov	dx, 0F0h
		int	15h
		mov	[bp+var_2], ax
		mov	[bp+var_4], bx
		mov	ax, [bp+var_4]
		mov	word_5E802, ax
		cmp	[bp+var_2], 5347h
		jnz	short loc_564E2
		cmp	[bp+var_4], 0
		jbe	short loc_564E2
		mov	byte_5E801, 1

loc_564E2:
		mov	al, byte_5E801
		mov	ah, 0
		or	ax, ax
		jnz	short loc_564EF
		mov	al, 0
		jmp	short loc_56551

loc_564EF:
		push	1
		nop
		push	cs
		call	near ptr sub_565FF
		pop	cx
		mov	cl, 0
		xor	si, si
		jmp	short loc_5654A

loc_564FD:
		mov	bx, si
		imul	bx, bx, 6
		cmp	word ptr [bx+693Eh], 0
		jle	short loc_56510
		mov	byte ptr [si+694Ch], 1
		jmp	short loc_56515

loc_56510:
		mov	byte ptr [si+694Ch], 0

loc_56515:
		mov	bx, si
		imul	bx, bx, 6
		cmp	word ptr [bx+6940h], 0
		jle	short loc_56528
		mov	byte ptr [si+694Eh], 1
		jmp	short loc_5652D

loc_56528:
		mov	byte ptr [si+694Eh], 0

loc_5652D:
		cmp	byte ptr [si+694Ch], 0
		jz	short loc_56544
		cmp	byte ptr [si+694Eh], 0
		jz	short loc_56544
		mov	cl, 1
		mov	byte ptr [si+694Ah], 1
		jmp	short loc_56549

loc_56544:
		mov	byte ptr [si+694Ah], 0

loc_56549:
		inc	si

loc_5654A:
		cmp	si, 2
		jl	short loc_564FD
		mov	al, cl

loc_56551:
		pop	si
		leave
		retf
sub_564B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56554		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	[bp+var_1], 0
		xor	ax, ax
		mov	ah, 84h
		mov	dx, 1
		int	15h
		mov	[bp+var_4], ax
		mov	[bp+var_8], bx
		mov	[bp+var_6], cx
		mov	[bp+var_A], dx
		mov	ax, [bp+var_4]
		mov	word_6065E, ax
		mov	ax, [bp+var_8]
		mov	word_60660, ax
		mov	ax, [bp+var_6]
		mov	word_60664, ax
		mov	ax, [bp+var_A]
		mov	word_60666, ax
		xor	si, si
		jmp	short loc_565DF

loc_56590:
		mov	bx, si
		imul	bx, bx, 6
		cmp	word ptr [bx+693Eh], 0
		jle	short loc_565A3
		mov	byte ptr [si+694Ch], 1
		jmp	short loc_565A8

loc_565A3:
		mov	byte ptr [si+694Ch], 0

loc_565A8:
		mov	bx, si
		imul	bx, bx, 6
		cmp	word ptr [bx+6940h], 0
		jle	short loc_565BB
		mov	byte ptr [si+694Eh], 1
		jmp	short loc_565C0

loc_565BB:
		mov	byte ptr [si+694Eh], 0

loc_565C0:
		cmp	byte ptr [si+694Ch], 0
		jz	short loc_565D9
		cmp	byte ptr [si+694Eh], 0
		jz	short loc_565D9
		mov	[bp+var_1], 1
		mov	byte ptr [si+694Ah], 1
		jmp	short loc_565DE

loc_565D9:
		mov	byte ptr [si+694Ah], 0

loc_565DE:
		inc	si

loc_565DF:
		cmp	si, 2
		jl	short loc_56590
		cmp	[bp+var_1], 0
		jz	short loc_565EF
		mov	byte_5E804, 1

loc_565EF:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_56554		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Joystick_ReadButtonsWrapper_500B (sub_500B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Joystick_ReadButtonsWrapper_3F12A (sub_3F12A de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Joystick_ReadButtonsWrapper_67906 (sub_67906 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant Joystick_ReadButtonsOnly_663BD (seg199). Référencée depuis seg201.
; ==============================================================================================
Joystick_ReadButtonsWrapper_565F5		proc far
		push	bp
		mov	bp, sp
		call	Joystick_ReadButtonsOnly_54F61
		pop	bp
		retf
Joystick_ReadButtonsWrapper_565F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_565FF		proc far

var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		push	large 0C0000h
		push	693Eh
		call	CRT_Memset_Public
		add	sp, 6
		mov	al, byte_5E801
		mov	ah, 0
		or	ax, ax
		jnz	short loc_56699
		mov	al, byte_5E804
		mov	ah, 0
		or	ax, ax
		jnz	short loc_56699
		cmp	[bp+arg_0], 0
		jz	short loc_56638
		call	sub_54F7A
		jmp	loc_567E7

loc_56638:
		xor	si, si
		jmp	short loc_56691

loc_5663C:
		cmp	byte ptr [si+694Ch], 0
		jnz	short loc_5664A
		cmp	byte ptr [si+694Eh], 0
		jz	short loc_56690

loc_5664A:
		mov	bx, si
		imul	bx, bx, 22h
		cmp	word ptr [bx+6972h], 0
		jz	short loc_56690
		push	si
		mov	ax, si
		imul	ax, ax, 6
		add	ax, 693Eh
		push	ax
		mov	bx, si
		imul	bx, bx, 22h
		push	word ptr [bx+6972h]
		call	sub_54F23
		mov	bx, si
		imul	bx, bx, 6
		mov	ax, [bx+693Eh]
		mov	bx, si
		shl	bx, 1
		mov	[bx+6996h], ax
		mov	bx, si
		imul	bx, bx, 6
		mov	ax, [bx+6940h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+699Ah], ax

loc_56690:
		inc	si

loc_56691:
		cmp	si, 2
		jl	short loc_5663C
		jmp	loc_567E7

loc_56699:
		cmp	byte_5E801, 0
		jz	short loc_56714
		mov	ax, word_5E802
		mov	[bp+var_10], ax
		xor	ax, ax
		mov	ah, 84h
		mov	dx, 0
		mov	bx, [bp+var_10]
		int	15h
		mov	[bp+var_D], al
		mov	al, [bp+var_D]
		xor	al, 0FFh
		mov	[bp+var_D], al
		mov	ah, 0
		and	ax, 30h
		sar	ax, 4
		mov	[bp+var_A], ax
		mov	al, [bp+var_D]
		mov	ah, 0
		and	ax, 0C0h
		sar	ax, 6
		mov	[bp+var_C], ax
		xor	ax, ax
		mov	ah, 84h
		mov	dx, 1
		mov	bx, [bp+var_10]
		mov	al, 4
		int	15h
		mov	[bp+var_2], ax
		mov	[bp+var_4], bx
		mov	[bp+var_6], cx
		mov	[bp+var_8], dx
		mov	ax, [bp+var_2]
		mov	word_6065E, ax
		mov	ax, [bp+var_4]
		mov	word_60660, ax
		mov	ax, [bp+var_6]
		mov	word_60664, ax
		mov	ax, [bp+var_8]
		mov	word_60666, ax
		mov	ax, [bp+var_A]
		mov	word_60662, ax
		mov	ax, [bp+var_C]
		mov	word_60668, ax

loc_56714:
		cmp	byte_5E804, 0
		jnz	short loc_5671E
		jmp	loc_567BB

loc_5671E:
		xor	ax, ax
		mov	ah, 84h
		mov	dx, 0
		int	15h
		mov	byte ptr [bp+var_4+1], al
		mov	al, byte ptr [bp+var_4+1]
		xor	al, 0FFh
		mov	byte ptr [bp+var_4+1], al
		mov	ah, 0
		and	ax, 30h
		sar	ax, 4
		mov	[bp+var_6], ax
		mov	al, byte ptr [bp+var_4+1]
		mov	ah, 0
		and	ax, 0C0h
		sar	ax, 6
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	word_60662, ax
		mov	ax, [bp+var_8]
		mov	word_60668, ax
		cmp	byte_6066C, 0
		jz	short loc_56770
		mov	ah, 84h
		mov	al, 0
		mov	dx, 6
		int	15h
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	word_6065E, ax

loc_56770:
		cmp	byte_6066E, 0
		jz	short loc_56789
		mov	ah, 84h
		mov	al, 1
		mov	dx, 6
		int	15h
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	word_60660, ax

loc_56789:
		cmp	byte_6066D, 0
		jz	short loc_567A2
		mov	ah, 84h
		mov	al, 2
		mov	dx, 6
		int	15h
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	word_60664, ax

loc_567A2:
		cmp	byte_6066F, 0
		jz	short loc_567BB
		mov	ah, 84h
		mov	al, 3
		mov	dx, 6
		int	15h
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	word_60666, ax

loc_567BB:
		xor	di, di
		jmp	short loc_567E2

loc_567BF:
		mov	bx, di
		imul	bx, bx, 6
		mov	ax, [bx+693Eh]
		mov	bx, di
		shl	bx, 1
		mov	[bx+6996h], ax
		mov	bx, di
		imul	bx, bx, 6
		mov	ax, [bx+6940h]
		mov	bx, di
		shl	bx, 1
		mov	[bx+699Ah], ax
		inc	di

loc_567E2:
		cmp	di, 2
		jl	short loc_567BF

loc_567E7:
		pop	di
		pop	si
		leave
		retf
sub_565FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_567EB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	bx, si
		imul	bx, bx, 22h
		cmp	word ptr [bx+696Eh], 0
		jnz	short loc_56847
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+6952h]
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6962h]
		mov	bx, si
		imul	bx, bx, 22h
		cmp	ax, [bx+695Eh]
		jle	short loc_5682D
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+695Eh]
		jmp	short loc_56842

loc_5682D:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+6952h]
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6962h]

loc_56842:
		mov	cx, ax
		jmp	loc_568E9

loc_56847:
		mov	bx, si
		imul	bx, bx, 22h
		cmp	[bx+696Eh], cx
		jle	short loc_56899
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+696Eh]
		mov	di, ax
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6964h]
		mov	cx, ax
		mov	bx, si
		imul	bx, bx, 22h
		imul	word ptr [bx+6964h]
		cmp	ax, di
		jle	short loc_56879
		dec	cx

loc_56879:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+695Eh]
		neg	ax
		cmp	ax, cx
		jle	short loc_56895
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+695Eh]
		neg	ax
		jmp	short loc_56842

loc_56895:
		mov	ax, cx
		jmp	short loc_56842

loc_56899:
		mov	bx, si
		imul	bx, bx, 22h
		cmp	[bx+696Ah], cx
		jge	short loc_568E7
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+696Ah]
		mov	di, ax
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6962h]
		mov	cx, ax
		mov	bx, si
		imul	bx, bx, 22h
		imul	word ptr [bx+6964h]
		cmp	ax, di
		jge	short loc_568CB
		inc	cx

loc_568CB:
		mov	bx, si
		imul	bx, bx, 22h
		cmp	[bx+695Eh], cx
		jge	short loc_568E2
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+695Eh]
		jmp	loc_56842

loc_568E2:
		mov	ax, cx
		jmp	loc_56842

loc_568E7:
		xor	cx, cx

loc_568E9:
		mov	ax, cx
		pop	di
		pop	si
		pop	bp
		retf
sub_567EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_568EF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	bx, si
		imul	bx, bx, 22h
		cmp	word ptr [bx+6970h], 0
		jnz	short loc_5694B
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+6954h]
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6966h]
		mov	bx, si
		imul	bx, bx, 22h
		cmp	ax, [bx+6960h]
		jle	short loc_56931
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+6960h]
		jmp	short loc_56946

loc_56931:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+6954h]
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6966h]

loc_56946:
		mov	cx, ax
		jmp	loc_569ED

loc_5694B:
		mov	bx, si
		imul	bx, bx, 22h
		cmp	[bx+6970h], cx
		jle	short loc_5699D
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+6970h]
		mov	di, ax
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6968h]
		mov	cx, ax
		mov	bx, si
		imul	bx, bx, 22h
		imul	word ptr [bx+6968h]
		cmp	ax, di
		jle	short loc_5697D
		dec	cx

loc_5697D:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+6960h]
		neg	ax
		cmp	ax, cx
		jle	short loc_56999
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+6960h]
		neg	ax
		jmp	short loc_56946

loc_56999:
		mov	ax, cx
		jmp	short loc_56946

loc_5699D:
		mov	bx, si
		imul	bx, bx, 22h
		cmp	[bx+696Ch], cx
		jge	short loc_569EB
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, cx
		sub	ax, [bx+696Ch]
		mov	di, ax
		mov	bx, si
		imul	bx, bx, 22h
		cwd
		idiv	word ptr [bx+6966h]
		mov	cx, ax
		mov	bx, si
		imul	bx, bx, 22h
		imul	word ptr [bx+6968h]
		cmp	ax, di
		jge	short loc_569CF
		inc	cx

loc_569CF:
		mov	bx, si
		imul	bx, bx, 22h
		cmp	[bx+6960h], cx
		jge	short loc_569E6
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+6960h]
		jmp	loc_56946

loc_569E6:
		mov	ax, cx
		jmp	loc_56946

loc_569EB:
		xor	cx, cx

loc_569ED:
		mov	ax, cx
		pop	di
		pop	si
		pop	bp
		retf
sub_568EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_569F3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, si
		imul	bx, bx, 6
		push	word ptr [bx+693Eh]
		push	si
		push	cs
		call	near ptr sub_567EB
		add	sp, 4
		mov	bx, si
		imul	bx, bx, 6
		mov	[bx+693Eh], ax
		mov	bx, si
		imul	bx, bx, 6
		push	word ptr [bx+6940h]
		push	si
		push	cs
		call	near ptr sub_568EF
		add	sp, 4
		mov	bx, si
		imul	bx, bx, 6
		mov	[bx+6940h], ax
		pop	si
		pop	bp
		retf
sub_569F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56A31		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+694Ah], 0
		jz	short loc_56A5C
		mov	al, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_56A8F
		pop	cx
		mov	al, [bp+arg_0]
		mov	ah, 0
		imul	ax, ax, 6
		mov	bx, ax
		mov	ax, [bx+693Eh]
		jmp	short loc_56A5E

loc_56A5C:
		xor	ax, ax

loc_56A5E:
		pop	bp
		retf
sub_56A31		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56A60		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+694Ah], 0
		jz	short loc_56A8B
		mov	al, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_56A8F
		pop	cx
		mov	al, [bp+arg_0]
		mov	ah, 0
		imul	ax, ax, 6
		mov	bx, ax
		mov	ax, [bx+6940h]
		jmp	short loc_56A8D

loc_56A8B:
		xor	ax, ax

loc_56A8D:
		pop	bp
		retf
sub_56A60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56A8F		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	1
		push	cs
		call	near ptr sub_565FF
		pop	cx
		xor	si, si
		jmp	short loc_56AE1

loc_56A9E:
		cmp	byte ptr [si+694Ch], 0
		jz	short loc_56ABF
		mov	bx, si
		imul	bx, bx, 6
		push	word ptr [bx+693Eh]
		push	si
		push	cs
		call	near ptr sub_567EB
		add	sp, 4
		mov	bx, si
		imul	bx, bx, 6
		mov	[bx+693Eh], ax

loc_56ABF:
		cmp	byte ptr [si+694Eh], 0
		jz	short loc_56AE0
		mov	bx, si
		imul	bx, bx, 6
		push	word ptr [bx+6940h]
		push	si
		push	cs
		call	near ptr sub_568EF
		add	sp, 4
		mov	bx, si
		imul	bx, bx, 6
		mov	[bx+6940h], ax

loc_56AE0:
		inc	si

loc_56AE1:
		cmp	si, 2
		jl	short loc_56A9E
		mov	al, [bp+arg_0]
		mov	ah, 0
		imul	ax, ax, 6
		add	ax, 693Eh
		pop	si
		pop	bp
		retf
sub_56A8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_FormatCalibrationDisplay_5203 (sub_5203 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_FormatCalibrationDisplay_3F35E (sub_3F35E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Joystick_FormatCalibrationDisplay_67B3A (sub_67B3A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Joystick_UpdateCalibration_67B0D et sub_3FD (formatage) ×2. Référencée par les clusters
; ConfigOption (seg201) et TextScroll (seg204).
; ==============================================================================================
Joystick_FormatCalibrationDisplay_56AF4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	cs
		call	near ptr sub_56A8F
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset word_6065E
		mov	cx, 6
		call	CRT_Fmemcpy
		mov	ax, si
		add	ax, 6
		push	ds
		push	ax
		push	ds
		push	offset word_60664
		mov	cx, 6
		call	CRT_Fmemcpy
		pop	si
		pop	bp
		retf
Joystick_FormatCalibrationDisplay_56AF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_TestButtonMasked_67B6C (sub_67B6C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far,
; teste un bit de bouton (table 0x5DC8, indexée par arg_0, masquée par arg_2). Référencée
; directement par Player_MainUpdate (sub_13100).
; ==============================================================================================
Joystick_TestButtonMasked_56B26		proc far

arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		imul	ax, ax, 6
		mov	bx, ax
		mov	al, [bx+6942h]
		and	al, [bp+arg_2]
		pop	bp
		retf
Joystick_TestButtonMasked_56B26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56B3C		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+694Ah]
		pop	bp
		retf
sub_56B3C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56B4C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	word ptr [bx+6952h], 0
		mov	bx, dx
		imul	bx, bx, 22h
		mov	word ptr [bx+6954h], 0
		mov	bx, dx
		imul	bx, bx, 22h
		mov	word ptr [bx+6972h], 3FFFh
		mov	bx, dx
		imul	bx, bx, 22h
		mov	ax, [bx+6972h]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+695Ah], ax
		mov	bx, dx
		imul	bx, bx, 22h
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+695Ch], ax
		mov	bx, dx
		imul	bx, bx, 22h
		xor	ax, ax
		mov	[bx+6970h], ax
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+696Eh], ax
		mov	bx, dx
		imul	bx, bx, 22h
		mov	word ptr [bx+6962h], 1
		mov	bx, dx
		imul	bx, bx, 22h
		mov	word ptr [bx+6966h], 1
		pop	bp
		retf
sub_56B4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56BBF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		imul	bx, bx, 6
		mov	ax, [bx+693Eh]
		pop	bp
		retf
sub_56BBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56BCE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		imul	bx, bx, 6
		mov	ax, [bx+6940h]
		pop	bp
		retf
sub_56BCE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56BDD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+6996h]
		pop	bp
		retf
sub_56BDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56BEB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+699Ah]
		pop	bp
		retf
sub_56BEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56BF9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+699Ah]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6954h], ax
		pop	bp
		retf
sub_56BF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56C12		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+699Ah]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+695Ch], ax
		pop	bp
		retf
sub_56C12		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56C2B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+699Ah]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6958h], ax
		pop	bp
		retf
sub_56C2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56C44		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6996h]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6956h], ax
		pop	bp
		retf
sub_56C44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56C5D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6996h]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6952h], ax
		pop	bp
		retf
sub_56C5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56C76		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6996h]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+695Ah], ax
		pop	bp
		retf
sub_56C76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56C8F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6996h]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6952h], ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+699Ah]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6954h], ax
		pop	bp
		retf
sub_56C8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56CB9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6996h]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6956h], ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+699Ah]
		mov	bx, dx
		imul	bx, bx, 22h
		mov	[bx+6958h], ax
		pop	bp
		retf
sub_56CB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56CE3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_0]
		mov	bx, cx
		shl	bx, 1
		mov	ax, [bx+6996h]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+695Ah], ax
		mov	bx, cx
		shl	bx, 1
		mov	ax, [bx+699Ah]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+695Ch], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ah]
		mov	bx, cx
		imul	bx, bx, 22h
		cmp	ax, [bx+6952h]
		jle	short loc_56D26
		mov	bx, cx
		imul	bx, bx, 22h
		jmp	short loc_56D2F

loc_56D26:
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6952h]

loc_56D2F:
		push	ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ch]
		mov	bx, cx
		imul	bx, bx, 22h
		cmp	ax, [bx+6954h]
		jle	short loc_56D4B
		mov	bx, cx
		imul	bx, bx, 22h
		jmp	short loc_56D54

loc_56D4B:
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6954h]

loc_56D54:
		pop	dx
		cmp	dx, ax
		jle	short loc_56D7F
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ah]
		mov	bx, cx
		imul	bx, bx, 22h
		cmp	ax, [bx+6952h]
		jle	short loc_56D74
		mov	bx, cx
		imul	bx, bx, 22h
		jmp	short loc_56D7D

loc_56D74:
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6952h]

loc_56D7D:
		jmp	short loc_56DA3

loc_56D7F:
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ch]
		mov	bx, cx
		imul	bx, bx, 22h
		cmp	ax, [bx+6954h]
		jle	short loc_56D9A
		mov	bx, cx
		imul	bx, bx, 22h
		jmp	short loc_56DA3

loc_56D9A:
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6954h]

loc_56DA3:
		movsx	eax, ax
		imul	eax, eax, 0Bh
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6972h], ax
		pop	bp
		retf
sub_56CE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56DC1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+695Eh], si
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6960h], di
		mov	bx, cx
		imul	bx, bx, 22h
		xor	ax, ax
		mov	[bx+6970h], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+696Eh], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ah]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+6952h]
		xor	dx, dx
		div	si
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6962h], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ch]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+6954h]
		xor	dx, dx
		div	di
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6966h], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_56DC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56E37		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	si, [bp+arg_6]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+695Eh], di
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bp+arg_4]
		mov	[bx+6960h], ax
		movsx	eax, si
		mov	bx, cx
		imul	bx, bx, 22h
		mov	dx, [bx+695Ah]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	dx, [bx+6956h]
		movsx	edx, dx
		imul	eax, edx
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+696Ah], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6956h]
		mov	bx, cx
		imul	bx, bx, 22h
		add	ax, [bx+696Ah]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+696Ah], ax
		movsx	eax, si
		mov	bx, cx
		imul	bx, bx, 22h
		mov	dx, [bx+695Ch]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	dx, [bx+6958h]
		movsx	edx, dx
		imul	eax, edx
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+696Ch], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6958h]
		mov	bx, cx
		imul	bx, bx, 22h
		add	ax, [bx+696Ch]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+696Ch], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ah]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+696Ah]
		cwd
		idiv	di
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6962h], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+695Ch]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+696Ch]
		cwd
		idiv	[bp+arg_4]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6966h], ax
		movsx	eax, si
		mov	bx, cx
		imul	bx, bx, 22h
		mov	dx, [bx+6956h]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	dx, [bx+6952h]
		movsx	edx, dx
		imul	eax, edx
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+696Eh], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6956h]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+696Eh]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+696Eh], ax
		movsx	eax, si
		mov	bx, cx
		imul	bx, bx, 22h
		mov	dx, [bx+6958h]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	dx, [bx+6954h]
		movsx	edx, dx
		imul	eax, edx
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6970h], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6958h]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+6970h]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6970h], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+696Eh]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+6952h]
		cwd
		idiv	di
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6964h], ax
		mov	bx, cx
		imul	bx, bx, 22h
		mov	ax, [bx+6970h]
		mov	bx, cx
		imul	bx, bx, 22h
		sub	ax, [bx+6954h]
		cwd
		idiv	[bp+arg_4]
		mov	bx, cx
		imul	bx, bx, 22h
		mov	[bx+6968h], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_56E37		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; OptionCounter_Construct_546D (sub_546D de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à OptionCounter_Construct_3F5C8 (sub_3F5C8 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à OptionCounter_Construct_67DA4 (sub_67DA4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658, 1 octet) et réinitialise un compteur d'options (word_72E82). Référencée
; depuis seg201.
; ==============================================================================================
OptionCounter_Construct_5700C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_57024
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_5702A

loc_57024:
		mov	word_60670, 0

loc_5702A:
		mov	ax, dx
		pop	bp
		retf
OptionCounter_Construct_5700C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5702E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_57048
		test	dx, 1
		jz	short loc_57048
		push	ax
		call	sub_33B
		pop	cx

loc_57048:
		pop	bp
		retf
sub_5702E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5704A		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_60670
sub_5704A		endp
seg174		ends
