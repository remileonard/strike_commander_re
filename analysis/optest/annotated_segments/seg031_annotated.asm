seg031		segment	byte public 'CODE' use16
		assume cs:seg031
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_16C7A	proc far		; CODE XREF: seg045:076FP
					; DATA XREF: seg170:01B6o

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
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		enter	36h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		lea	di, [bp+var_14]
		mov	cx, 6
		rep movsw
		mov	es, [bp+var_14]
		shl	[bp+var_E], 1
		shl	[bp+var_A], 1
		shl	[bp+arg_4], 1
		mov	ax, [bp+arg_8]
		mov	[bp+var_32], ax
		lfs	bx, [bp+arg_A]
		cmp	[bp+arg_6], 0
		jz	short loc_16CB4
		nop
		nop
		cmp	ax, 0
		jnz	short loc_16CEB
		nop
		nop

loc_16CB4:				; CODE XREF: sub_16C7A+2Fj
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_A]
		jg	short loc_16CE7
		nop
		nop
		cmp	ax, [bp+var_E]
		jl	short loc_16CE7
		nop
		nop
		mov	di, [bp+var_12]
		add	di, ax
		mov	di, [di]
		mov	ax, [bp+arg_2]
		cmp	ax, [bp+var_C]
		jg	short loc_16CE7
		nop
		nop
		cmp	ax, [bp+var_10]
		jl	short loc_16CE7
		nop
		nop
		add	di, ax
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_16CE7:				; CODE XREF: sub_16C7A+40j
					; sub_16C7A+47j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_16CEB:				; CODE XREF: sub_16C7A+36j
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	[bp+var_4], ax
		mov	[bp+var_36], 1
		mov	ax, [bp+arg_6]
		mul	ax
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	[bp+var_20], ax
		mov	[bp+var_1E], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_24], ax
		mov	[bp+var_22], dx
		mov	[bp+var_28], 0
		mov	[bp+var_26], 0
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, [bp+var_20]
		add	dx, [bp+var_1E]
		mov	[bp+var_30], ax
		mov	[bp+var_2E], dx
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx

loc_16D7F:				; CODE XREF: sub_16C7A+216j
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		js	short loc_16D92
		nop
		nop
		jmp	loc_16E93
; ���������������������������������������������������������������������������

loc_16D92:				; CODE XREF: sub_16C7A+111j
		cmp	[bp+var_36], 1
		jnz	short loc_16DB1
		nop
		nop
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_2]
		cmp	ax, [bp+var_C]
		jle	short loc_16DAA
		nop
		nop
		mov	ax, [bp+var_C]

loc_16DAA:				; CODE XREF: sub_16C7A+129j
		cmp	ax, [bp+var_10]
		jge	short loc_16DB4
		nop
		nop

loc_16DB1:				; CODE XREF: sub_16C7A+11Cj
					; sub_16C7A+150j ...
		jmp	loc_16E33
; ���������������������������������������������������������������������������

loc_16DB4:				; CODE XREF: sub_16C7A+133j
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+var_2]
		cmp	ax, [bp+var_10]
		jge	short loc_16DC7
		nop
		nop
		mov	ax, [bp+var_10]

loc_16DC7:				; CODE XREF: sub_16C7A+146j
		cmp	ax, [bp+var_C]
		jg	short loc_16DB1
		mov	[bp+var_6], ax
		mov	si, [bp+arg_4]
		add	si, [bp+var_4]
		cmp	si, [bp+var_E]
		jl	short loc_16DB1
		cmp	si, [bp+var_A]
		jg	short loc_16DFA
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_16DF2:				; CODE XREF: sub_16C7A+17Ej
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_16DF2

loc_16DFA:				; CODE XREF: sub_16C7A+163j
		mov	ax, [bp+var_4]
		or	ax, ax
		jz	short loc_16E33
		nop
		nop
		mov	si, [bp+arg_4]
		sub	si, ax
		jz	short loc_16E33
		nop
		nop
		cmp	si, [bp+var_A]
		jg	short loc_16E33
		nop
		nop
		cmp	si, [bp+var_E]
		jl	short loc_16E33
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_16E2B:				; CODE XREF: sub_16C7A+1B7j
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_16E2B

loc_16E33:				; CODE XREF: sub_16C7A:loc_16DB1j
					; sub_16C7A+185j ...
		mov	cx, 0
		cmp	[bp+var_2E], 0
		js	short loc_16E60
		nop
		nop
		sub	[bp+var_4], 2
		mov	cx, 1
		dec	[bp+var_32]
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		sub	ax, [bp+var_1C]
		sbb	dx, [bp+var_1A]
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx

loc_16E60:				; CODE XREF: sub_16C7A+1C0j
		mov	[bp+var_36], cx
		inc	[bp+var_2]
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		add	ax, [bp+var_24]
		adc	dx, [bp+var_22]
		mov	[bp+var_28], ax
		mov	[bp+var_26], dx
		add	ax, [bp+var_20]
		adc	dx, [bp+var_1E]
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		jmp	loc_16D7F
; ���������������������������������������������������������������������������

loc_16E93:				; CODE XREF: sub_16C7A+115j
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sub	ax, [bp+var_20]
		sbb	dx, [bp+var_1E]
		mov	[bp+var_34], ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, [bp+var_34]
		adc	dx, cx
		sub	ax, [bp+var_28]
		sbb	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		sar	dx, 1
		rcr	ax, 1
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx

loc_16EC3:				; CODE XREF: sub_16C7A+32Aj
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_2]
		cmp	ax, [bp+var_C]
		jle	short loc_16ED3
		nop
		nop
		mov	ax, [bp+var_C]

loc_16ED3:				; CODE XREF: sub_16C7A+252j
		cmp	ax, [bp+var_10]
		jge	short loc_16EDD
		nop
		nop

loc_16EDA:				; CODE XREF: sub_16C7A+279j
					; sub_16C7A+287j
		jmp	short loc_16F58
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_16EDD:				; CODE XREF: sub_16C7A+25Cj
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+var_2]
		cmp	ax, [bp+var_10]
		jge	short loc_16EF0
		nop
		nop
		mov	ax, [bp+var_10]

loc_16EF0:				; CODE XREF: sub_16C7A+26Fj
		cmp	ax, [bp+var_C]
		jg	short loc_16EDA
		mov	[bp+var_6], ax
		mov	si, [bp+arg_4]
		add	si, [bp+var_4]
		cmp	si, [bp+var_E]
		jl	short loc_16EDA
		cmp	si, [bp+var_A]
		jg	short loc_16F23
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_16F1B:				; CODE XREF: sub_16C7A+2A7j
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_16F1B

loc_16F23:				; CODE XREF: sub_16C7A+28Cj
		mov	ax, [bp+var_4]
		or	ax, ax
		jz	short loc_16F58
		nop
		nop
		mov	si, [bp+arg_4]
		sub	si, ax
		cmp	si, [bp+var_A]
		jg	short loc_16F58
		nop
		nop
		cmp	si, [bp+var_E]
		jl	short loc_16F58
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_16F50:				; CODE XREF: sub_16C7A+2DCj
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_16F50

loc_16F58:				; CODE XREF: sub_16C7A:loc_16EDAj
					; sub_16C7A+2AEj ...
		cmp	[bp+var_2E], 0
		jns	short loc_16F7B
		nop
		nop
		inc	[bp+var_2]
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		add	ax, [bp+var_24]
		adc	dx, [bp+var_22]
		mov	[bp+var_28], ax
		mov	[bp+var_26], dx
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx

loc_16F7B:				; CODE XREF: sub_16C7A+2E2j
		sub	[bp+var_4], 2
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		sub	ax, [bp+var_1C]
		sbb	dx, [bp+var_1A]
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		sub	ax, [bp+var_18]
		sbb	dx, [bp+var_16]
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx
		dec	[bp+var_32]
		js	short loc_16FA7
		nop
		nop
		jmp	loc_16EC3
; ���������������������������������������������������������������������������

loc_16FA7:				; CODE XREF: sub_16C7A+326j
		pop	di
		pop	si
		leave
		retf
sub_16C7A	endp

seg031		ends
