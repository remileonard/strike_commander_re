seg012		segment	byte public 'CODE' use16
		assume cs:seg012
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_859B	proc far		; CODE XREF: sub_8609+Dp

arg_0		= word ptr  6

		push	bp

loc_859C:				; DATA XREF: seg170:011Eo
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_85F9
; ���������������������������������������������������������������������������

loc_85A7:				; CODE XREF: sub_859B+61j
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		cmp	word ptr [bx+si+92h], 0
		jz	short loc_85EA
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+94h]
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		mov	bx, [bx+si+92h]
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_85E6
		mov	ax, 1
		jmp	short loc_85E8
; ���������������������������������������������������������������������������

loc_85E6:				; CODE XREF: sub_859B+44j
		xor	ax, ax

loc_85E8:				; CODE XREF: sub_859B+49j
		jmp	short loc_85EC
; ���������������������������������������������������������������������������

loc_85EA:				; CODE XREF: sub_859B+1Aj
		mov	al, 0

loc_85EC:				; CODE XREF: sub_859B:loc_85E8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_85F8
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_85F8:				; CODE XREF: sub_859B+55j
		inc	di

loc_85F9:				; CODE XREF: sub_859B+Aj
		cmp	di, 5
		jl	short loc_85A7
		mov	ax, 0FFFFh
		pop	di
		pop	si
		pop	bp
		retf
sub_859B	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8609	proc far		; CODE XREF: sub_8867+1F9p
					; seg062:0078P	...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_859B
		add	sp, 2
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_8628
		jmp	loc_8701
; ���������������������������������������������������������������������������

loc_8628:				; CODE XREF: sub_8609+1Aj
		mov	ax, [bp+var_2]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		mov	[bp+var_4], dx
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	eax, [bx+si+0Ch]
		mov	[bp+var_6], ax
		cmp	[bp+arg_4], 3E8h
		jge	short loc_8671
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	dx, 64h	; 'd'
		sub	dx, ax
		mov	[bp+var_8], dx
		jmp	short loc_8680
; ���������������������������������������������������������������������������

loc_8671:				; CODE XREF: sub_8609+4Dj
		cmp	[bp+arg_4], 1388h
		jge	short loc_8680
		mov	[bp+var_8], 5

loc_8680:				; CODE XREF: sub_8609+66j sub_8609+70j
		cmp	[bp+var_8], 0
		jge	short loc_868A
		xor	ax, ax
		jmp	short loc_868D
; ���������������������������������������������������������������������������

loc_868A:				; CODE XREF: sub_8609+7Bj
		mov	ax, [bp+var_8]

loc_868D:				; CODE XREF: sub_8609+7Fj
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_8701
		mov	di, [bp+var_4]
		push	0
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	di
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_C], ax
		cmp	word ptr [di], 0
		jz	short loc_86D8
		push	0
		push	[bp+var_C]
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_30C66
		add	sp, 8
		jmp	short $+2

loc_86D8:				; CODE XREF: sub_8609+B6j
		cmp	word ptr [di], 0
		jz	short loc_86EF
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_86EF:				; CODE XREF: sub_8609+D2j
		mov	bx, [bp+var_4]
		mov	al, [bp+arg_2]
		mov	[bx+0Eh], al
		mov	bx, [bp+var_4]
		mov	ax, [bp+arg_8]
		mov	[bx+0Fh], ax

loc_8701:				; CODE XREF: sub_8609+1Cj sub_8609+8Bj
		pop	di
		pop	si
		leave
		retf
sub_8609	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8705	proc far		; CODE XREF: seg062:00D2P

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	loc_87C0
; ���������������������������������������������������������������������������

loc_871A:				; CODE XREF: sub_8705+C1j
		mov	ax, [bp+var_2]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		mov	di, dx
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jz	short loc_8737
		jmp	loc_87BD
; ���������������������������������������������������������������������������

loc_8737:				; CODE XREF: sub_8705+2Dj
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_8]
		jnz	short loc_87BD
		cmp	[bp+arg_4], 3E8h
		jge	short loc_8762
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	dx, 64h	; 'd'
		sub	dx, ax
		mov	[bp+var_4], dx
		jmp	short loc_8771
; ���������������������������������������������������������������������������

loc_8762:				; CODE XREF: sub_8705+42j
		cmp	[bp+arg_4], 1388h
		jge	short loc_8771
		mov	[bp+var_4], 5

loc_8771:				; CODE XREF: sub_8705+5Bj sub_8705+65j
		cmp	[bp+var_4], 0
		jge	short loc_877B
		xor	ax, ax
		jmp	short loc_877E
; ���������������������������������������������������������������������������

loc_877B:				; CODE XREF: sub_8705+70j
		mov	ax, [bp+var_4]

loc_877E:				; CODE XREF: sub_8705+74j
		mov	[bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_87AB
		mov	ax, [bp+var_6]
		mov	[bp+var_8], ax
		cmp	word ptr [di], 0
		jz	short loc_87A9
		push	0
		push	[bp+var_8]
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_30C66
		add	sp, 8
		jmp	short $+2

loc_87A9:				; CODE XREF: sub_8705+8Bj
		jmp	short loc_87BD
; ���������������������������������������������������������������������������

loc_87AB:				; CODE XREF: sub_8705+80j
		push	di
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	byte ptr [di+0Eh], 0Fh
		mov	word ptr [di+0Fh], 0

loc_87BD:				; CODE XREF: sub_8705+2Fj sub_8705+38j ...
		inc	[bp+var_2]

loc_87C0:				; CODE XREF: sub_8705+12j
		cmp	[bp+var_2], 5
		jge	short loc_87C9
		jmp	loc_871A
; ���������������������������������������������������������������������������

loc_87C9:				; CODE XREF: sub_8705+BFj
		pop	di
		pop	si
		leave
		retf
sub_8705	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_87CD	proc far		; CODE XREF: seg062:00F9P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	short loc_8818
; ���������������������������������������������������������������������������

loc_87E1:				; CODE XREF: sub_87CD+4Fj
		mov	ax, [bp+var_2]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		mov	di, dx
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_8815
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_8815
		push	di
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	byte ptr [di+0Eh], 0Fh
		mov	word ptr [di+0Fh], 0

loc_8815:				; CODE XREF: sub_87CD+2Cj sub_87CD+34j
		inc	[bp+var_2]

loc_8818:				; CODE XREF: sub_87CD+12j
		cmp	[bp+var_2], 5
		jl	short loc_87E1
		pop	di
		pop	si
		leave
		retf
sub_87CD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8822	proc far		; CODE XREF: sub_8867+1E3p
					; seg062:00A0P

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [bp+arg_0]
		xor	si, si
		xor	di, di
		jmp	short loc_8858
; ���������������������������������������������������������������������������

loc_8830:				; CODE XREF: sub_8822+39j
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	dx, cx
		add	dx, ax
		add	dx, 92h	; '�'
		mov	si, dx
		mov	al, [si+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_8857
		mov	ax, [si+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_8857
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_8857:				; CODE XREF: sub_8822+25j sub_8822+2Dj
		inc	di

loc_8858:				; CODE XREF: sub_8822+Cj
		cmp	di, 5
		jl	short loc_8830
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
sub_8822	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8867	proc far		; CODE XREF: sub_8A80+7Ep

var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, word_493A5
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		cmp	ax, word_44567
		jz	short loc_888A
		mov	ax, [bp+var_2]
		mov	word_44567, ax
		jmp	loc_8A7C
; ���������������������������������������������������������������������������

loc_888A:				; CODE XREF: sub_8867+18j
		cmp	[bp+var_2], 0
		jnz	short loc_8893
		jmp	loc_8A7C
; ���������������������������������������������������������������������������

loc_8893:				; CODE XREF: sub_8867+27j
		mov	[bp+var_4], 0
		jmp	loc_8A66
; ���������������������������������������������������������������������������

loc_889B:				; CODE XREF: sub_8867+212j
		mov	di, [bp+var_4]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_88B6
		jmp	loc_8A66
; ���������������������������������������������������������������������������

loc_88B6:				; CODE XREF: sub_8867+4Aj
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		les	bx, [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jz	short loc_88CF
		jmp	loc_8A66
; ���������������������������������������������������������������������������

loc_88CF:				; CODE XREF: sub_8867+63j
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		cmp	ax, di
		jnz	short loc_88E5
		jmp	loc_8A66
; ���������������������������������������������������������������������������

loc_88E5:				; CODE XREF: sub_8867+79j
		les	bx, [di+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_88F2
		jmp	loc_8A66
; ���������������������������������������������������������������������������

loc_88F2:				; CODE XREF: sub_8867+86j
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+4]
		mov	[bp+var_26], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+8]
		mov	[bp+var_22], eax
		mov	ax, [bp+var_2]
		add	ax, 14h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_36], eax
		mov	bx, [bp+var_C]
		mov	eax, [bx+4]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_C]
		mov	eax, [bx+8]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_36]
		sub	[bp+var_42], eax
		mov	eax, [bp+var_32]
		sub	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		sub	[bp+var_3A], eax
		push	large [bp+var_3A]
		push	large [bp+var_3E]
		push	large [bp+var_42]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0C8h ; '�'
		jl	short loc_89B5
		jmp	loc_8A66
; ���������������������������������������������������������������������������

loc_89B5:				; CODE XREF: sub_8867+149j
		mov	eax, [bp+var_2A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_46], eax
		push	di
		push	ss
		lea	ax, [bp+var_5A]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_5A]
		add	[bp+var_4E], eax
		mov	eax, [bp+var_56]
		add	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		add	[bp+var_46], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_36]
		sub	[bp+var_66], eax
		mov	eax, [bp+var_32]
		sub	[bp+var_62], eax
		mov	eax, [bp+var_2E]
		sub	[bp+var_5E], eax
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_2432A
		add	sp, 8
		mov	ax, [bp+var_1E+1]
		mov	[bp+var_1A], ax
		cmp	[bp+var_1A], 1Eh
		jle	short loc_8A66
		push	0
		push	0Bh
		push	si
		push	cs
		call	near ptr sub_8822
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A66
		push	0
		push	large [bp+var_10]
		push	0Bh
		push	si
		push	cs
		call	near ptr sub_8609
		add	sp, 0Ah

loc_8A66:				; CODE XREF: sub_8867+31j sub_8867+4Cj ...
		lea	ax, [bp+var_4]
		push	ax
		push	6369h
		call	sub_204D0
		add	sp, 4
		or	ax, ax
		jz	short loc_8A7C
		jmp	loc_889B
; ���������������������������������������������������������������������������

loc_8A7C:				; CODE XREF: sub_8867+20j sub_8867+29j ...
		pop	di
		pop	si
		leave
		retf
sub_8867	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8A80	proc far		; CODE XREF: seg062:0364P

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_8AF6
; ���������������������������������������������������������������������������

loc_8A99:				; CODE XREF: sub_8A80+7Aj
		mov	ax, [bp+var_4]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		mov	[bp+var_2], dx
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0Eh], 0Fh
		jz	short loc_8AF3
		mov	di, [bp+var_2]
		cmp	word ptr [di], 0
		jz	short loc_8ADB
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_8AD7
		mov	ax, 1
		jmp	short loc_8AD9
; ���������������������������������������������������������������������������

loc_8AD7:				; CODE XREF: sub_8A80+50j
		xor	ax, ax

loc_8AD9:				; CODE XREF: sub_8A80+55j
		jmp	short loc_8ADD
; ���������������������������������������������������������������������������

loc_8ADB:				; CODE XREF: sub_8A80+3Bj
		mov	al, 1

loc_8ADD:				; CODE XREF: sub_8A80:loc_8AD9j
		or	al, al
		jz	short loc_8AF3
		push	[bp+var_2]
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+0Eh], 0Fh

loc_8AF3:				; CODE XREF: sub_8A80+33j sub_8A80+5Fj
		inc	[bp+var_4]

loc_8AF6:				; CODE XREF: sub_8A80+17j
		cmp	[bp+var_4], 5
		jl	short loc_8A99
		push	si
		push	cs
		call	near ptr sub_8867
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_8A80	endp

seg012		ends
