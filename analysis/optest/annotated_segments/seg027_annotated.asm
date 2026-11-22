seg027		segment	byte public 'CODE' use16
		assume cs:seg027
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_13B83	proc far		; CODE XREF: sub_2278A+CP

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_13BB3
; ���������������������������������������������������������������������������

loc_13B95:				; CODE XREF: sub_13B83+3Fj
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_13BB3
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_13BB3
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_13BB3:				; CODE XREF: sub_13B83+10j
					; sub_13B83+1Aj ...
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_13B95
		pop	di
		pop	si
		leave
		retf
sub_13B83	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_13BC8	proc far		; CODE XREF: sub_22487+2D5P

var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	loc_13C9F
; ���������������������������������������������������������������������������

loc_13BDB:				; CODE XREF: sub_13BC8+E8j
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_13BED
		jmp	loc_13C9F
; ���������������������������������������������������������������������������

loc_13BED:				; CODE XREF: sub_13BC8+20j
		mov	bx, [bp+var_4]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jnz	short loc_13BFD
		jmp	loc_13C9F
; ���������������������������������������������������������������������������

loc_13BFD:				; CODE XREF: sub_13BC8+30j
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_13C15
		jmp	loc_13C9F
; ���������������������������������������������������������������������������

loc_13C15:				; CODE XREF: sub_13BC8+48j
		push	[bp+var_2]
		call	sub_42759
		add	sp, 2
		mov	ax, [si+12h]
		cmp	ax, [bp+var_4]
		jnz	short loc_13C9F
		cmp	word ptr [si+0Fh], 0
		jz	short loc_13C83
		mov	bx, [si+0Fh]
		cmp	byte ptr [bx+4], 7
		jz	short loc_13C83
		mov	bx, [si+0Fh]
		cmp	byte ptr [bx+4], 0Bh
		jz	short loc_13C83
		push	word ptr [si+0Fh]
		call	sub_42754
		add	sp, 2
		mov	bx, [si+0Fh]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_13C83
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		add	sp, 2
		or	al, al
		jz	short loc_13C83
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[si+11h], al
		mov	[si+12h], di
		mov	word ptr [si+0Fh], 0
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		add	sp, 2
		jmp	short loc_13C9F
; ���������������������������������������������������������������������������

loc_13C83:				; CODE XREF: sub_13BC8+64j
					; sub_13BC8+6Dj ...
		push	4
		push	si
		call	sub_427BD
		add	sp, 4
		or	al, al
		jz	short loc_13C99
		mov	word ptr [si+0Fh], 0
		jmp	short loc_13C9F
; ���������������������������������������������������������������������������

loc_13C99:				; CODE XREF: sub_13BC8+C8j
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_13C9F:				; CODE XREF: sub_13BC8+10j
					; sub_13BC8+22j ...
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_13CB3
		jmp	loc_13BDB
; ���������������������������������������������������������������������������

loc_13CB3:				; CODE XREF: sub_13BC8+E6j
		mov	al, byte_46477
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13CD7
		mov	al, byte_48E5D
		mov	ah, 0
		cmp	ax, word_44423
		jz	short loc_13CCE
		mov	al, byte_48E5D
		mov	ah, 0
		jmp	short loc_13CD0
; ���������������������������������������������������������������������������

loc_13CCE:				; CODE XREF: sub_13BC8+FDj
		xor	ax, ax

loc_13CD0:				; CODE XREF: sub_13BC8+104j
		mov	[bp+var_5], al
		mov	al, 0
		jmp	short $+2

loc_13CD7:				; CODE XREF: sub_13BC8+F2j
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_13BC8	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13CF1:				; DATA XREF: dseg:58E6o
		push	bp
		mov	bp, sp
		push	6086h
		call	sub_25718
		add	sp, 2
		mov	word_490D6, 0
		mov	word_490D8, 0
		mov	byte_490E3, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13D12:				; DATA XREF: dseg:59ACo
		push	bp
		mov	bp, sp
		push	60B6h
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	bp
		retf
seg027		ends
