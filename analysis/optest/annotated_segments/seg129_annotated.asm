seg129		segment	byte public 'CODE' use16
		assume cs:seg129
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_33B9C	proc far		; CODE XREF: seg014:26E4P seg014:2713P
					; DATA XREF: ...

var_156		= word ptr -156h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 156h
		push	si
		push	di
		push	ds
		cld
		mov	[bp+var_156], ds
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_12]
		mov	cx, 6
		rep movsw
		mov	es, [bp+var_12]
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4],	bx
		jb	short loc_33BCD
		jnz	short loc_33BD0

loc_33BCD:				; CODE XREF: sub_33B9C+2Dj
		jmp	loc_33CB4
; ���������������������������������������������������������������������������

loc_33BD0:				; CODE XREF: sub_33B9C+2Fj
		mov	ax, ds
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		mov	[bp+var_154], ax
		mov	ax, [si]
		add	ax, [bp+arg_2]
		cmp	ax, [bp+var_A]
		jg	short loc_33C36
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_33C28
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		cmp	ax, [bp+var_C]

loc_33C28:				; CODE XREF: sub_33B9C+81j
		jge	short loc_33C2D
		jmp	loc_33CBB
; ���������������������������������������������������������������������������

loc_33C2D:				; CODE XREF: sub_33B9C:loc_33C28j
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_8]

loc_33C36:				; CODE XREF: sub_33B9C+76j
		jle	short loc_33C3B
		jmp	loc_33CBB
; ���������������������������������������������������������������������������

loc_33C3B:				; CODE XREF: sub_33B9C:loc_33C36j
		mov	dx, ds
		add	si, 8

loc_33C40:				; CODE XREF: sub_33B9C+D6j
					; sub_33B9C+FBj ...
		lodsw
		or	ax, ax
		jz	short loc_33CC1
		mov	cx, ax
		lodsw
		add	ax, [bp+arg_2]
		mov	di, ax
		lodsw
		add	ax, [bp+arg_4]
		shl	ax, 1
		mov	bx, [bp+var_10]
		add	bx, ax
		add	di, ss:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_33C74
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33C68:				; CODE XREF: sub_33B9C+D2j
		inc	si
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33C68
		mov	ds, dx
		jmp	short loc_33C40
; ���������������������������������������������������������������������������

loc_33C74:				; CODE XREF: sub_33B9C+C3j
		mov	bx, cx

loc_33C76:				; CODE XREF: sub_33B9C+F9j
					; sub_33B9C+114j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_33C99
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33C87:				; CODE XREF: sub_33B9C+F1j
		inc	si
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33C87
		mov	ds, dx
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_33C76
		jmp	short loc_33C40
; ���������������������������������������������������������������������������

loc_33C99:				; CODE XREF: sub_33B9C+E0j
		sub	bx, ax
		lodsb
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33CA4:				; CODE XREF: sub_33B9C+10Dj
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33CA4
		mov	ds, dx
		pop	bx
		or	bx, bx
		jnz	short loc_33C76
		jmp	short loc_33C40
; ���������������������������������������������������������������������������

loc_33CB4:				; CODE XREF: sub_33B9C:loc_33BCDj
					; sub_33B9C:loc_33CC1j
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_33CBB:				; CODE XREF: sub_33B9C+8Ej
					; sub_33B9C+9Cj
		add	si, 8

loc_33CBE:				; CODE XREF: sub_33B9C+191j
					; sub_33B9C+1A6j ...
		lodsw
		shr	ax, 1

loc_33CC1:				; CODE XREF: sub_33B9C+A7j
		jz	short loc_33CB4
		mov	cx, ax
		jnb	short loc_33CCA
		jmp	loc_33D4A
; ���������������������������������������������������������������������������

loc_33CCA:				; CODE XREF: sub_33B9C+129j
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_33D45
		cmp	ax, [bp+var_8]
		jg	short loc_33D45
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_33D45
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_33D45
		shl	bx, 1
		push	ds
		mov	ax, [bp+var_10]
		add	bx, ax
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		mov	ax, [bp+var_E]
		mov	bx, [bp+var_A]
		sub	ax, dx
		jle	short loc_33D0F
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_33D0F:				; CODE XREF: sub_33B9C+169j
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_33D2F
		sub	cx, dx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33D1F:				; CODE XREF: sub_33B9C+189j
		inc	si
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33D1F
		mov	ds, [bp+var_154]
		add	si, dx
		jmp	short loc_33CBE
; ���������������������������������������������������������������������������

loc_33D2F:				; CODE XREF: sub_33B9C+178j
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33D36:				; CODE XREF: sub_33B9C+1A0j
		inc	si
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33D36
		mov	ds, [bp+var_154]
		jmp	loc_33CBE
; ���������������������������������������������������������������������������

loc_33D45:				; CODE XREF: sub_33B9C+13Bj
					; sub_33B9C+140j ...
		add	si, cx
		jmp	loc_33CBE
; ���������������������������������������������������������������������������

loc_33D4A:				; CODE XREF: sub_33B9C+12Bj
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_33DD2
		cmp	ax, [bp+var_8]
		jg	short loc_33DD2
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_33DD2
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_33DD2
		shl	bx, 1
		push	ds
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]
		sub	dx, [bp+var_E]
		jl	short loc_33DE5
		cmp	ax, 0
		jg	short loc_33DE5
		mov	bx, cx

loc_33D8C:				; CODE XREF: sub_33B9C+211j
					; sub_33B9C+231j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_33DB2
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33D9D:				; CODE XREF: sub_33B9C+207j
		inc	si
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33D9D
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_33D8C
		jmp	loc_33CBE
; ���������������������������������������������������������������������������

loc_33DB2:				; CODE XREF: sub_33B9C+1F6j
		sub	bx, ax
		lodsb
		mov	ah, al
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33DBF:				; CODE XREF: sub_33B9C+228j
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33DBF
		mov	ds, [bp+var_154]
		pop	bx
		or	bx, bx
		jnz	short loc_33D8C
		jmp	loc_33CBE
; ���������������������������������������������������������������������������

loc_33DD2:				; CODE XREF: sub_33B9C+1BBj
					; sub_33B9C+1C0j ...
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_33DDE
		add	si, ax
		dec	si

loc_33DDE:				; CODE XREF: sub_33B9C+23Dj
		sub	cx, ax
		jnz	short loc_33DD2
		jmp	loc_33CBE
; ���������������������������������������������������������������������������

loc_33DE5:				; CODE XREF: sub_33B9C+1E7j
					; sub_33B9C+1ECj
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_33DF3:				; CODE XREF: sub_33B9C+278j
					; sub_33B9C+297j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_33E18
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33E04:				; CODE XREF: sub_33B9C+26Ej
		lodsb
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33E04
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_33DF3
		jmp	short loc_33E35
; ���������������������������������������������������������������������������

loc_33E18:				; CODE XREF: sub_33B9C+25Dj
		sub	bx, ax
		lodsb
		mov	ah, al
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33E25:				; CODE XREF: sub_33B9C+28Ej
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33E25
		mov	ds, [bp+var_154]
		pop	bx
		or	bx, bx
		jnz	short loc_33DF3

loc_33E35:				; CODE XREF: sub_33B9C+27Aj
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_152]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_33E4E
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_33E4E:				; CODE XREF: sub_33B9C+2AAj
		cmp	[bp+var_2], 0
		jle	short loc_33E5A
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_33E5A:				; CODE XREF: sub_33B9C+2B6j
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_33E63:				; CODE XREF: sub_33B9C+2CDj
		lodsb
		mov	al, es:[di]
		xlat
		stosb
		loop	loc_33E63
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		add	si, ax
		pop	si
		pop	ds
		jmp	loc_33CBE
sub_33B9C	endp

seg129		ends
