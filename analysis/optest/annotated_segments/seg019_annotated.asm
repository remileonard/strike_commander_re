seg019		segment	byte public 'CODE' use16
		assume cs:seg019
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_CC36	proc far		; CODE XREF: seg004:0A6AP seg004:0A9FP

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

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		cmp	ax, [si]
		jge	short loc_CC57
		mov	ax, [di]
		cmp	ax, [si+8]
		jge	short loc_CC57
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CC57:				; CODE XREF: sub_CC36+12j sub_CC36+19j
		mov	ax, [di]
		cmp	ax, [si+4]
		jle	short loc_CC6B
		mov	ax, [di]
		cmp	ax, [si+0Ch]
		jle	short loc_CC6B
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CC6B:				; CODE XREF: sub_CC36+26j sub_CC36+2Dj
		mov	ax, [di+2]
		cmp	ax, [si+2]
		jle	short loc_CC81
		mov	ax, [di+2]
		cmp	ax, [si+6]
		jle	short loc_CC81
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CC81:				; CODE XREF: sub_CC36+3Bj sub_CC36+43j
		mov	ax, [di+2]
		cmp	ax, [si+0Ah]
		jge	short loc_CC97
		mov	ax, [di+2]
		cmp	ax, [si+0Eh]
		jge	short loc_CC97
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CC97:				; CODE XREF: sub_CC36+51j sub_CC36+59j
		mov	ax, [si]
		sub	ax, [si+8]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_CCD8
		mov	ax, [si+2]
		sub	ax, [si+0Ah]
		imul	word ptr [si]
		cwd
		idiv	[bp+var_2]
		mov	dx, [si+2]
		sub	dx, ax
		mov	[bp+var_4], dx
		mov	ax, [si]
		sub	ax, [si+8]
		push	ax
		mov	ax, [di+2]
		sub	ax, [bp+var_4]
		pop	dx
		imul	dx
		mov	dx, [si+2]
		sub	dx, [si+0Ah]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	[bp+var_6], ax
		jmp	short loc_CCDD
; ���������������������������������������������������������������������������

loc_CCD8:				; CODE XREF: sub_CC36+6Dj
		mov	ax, [si]
		mov	[bp+var_6], ax

loc_CCDD:				; CODE XREF: sub_CC36+A0j
		mov	ax, [di]
		cmp	ax, [bp+var_6]
		jge	short loc_CCEA
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CCEA:				; CODE XREF: sub_CC36+ACj
		mov	ax, [si+4]
		sub	ax, [si+0Ch]
		mov	[bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_CD2E
		mov	ax, [si+6]
		sub	ax, [si+0Eh]
		imul	word ptr [si+4]
		cwd
		idiv	[bp+var_8]
		mov	dx, [si+6]
		sub	dx, ax
		mov	[bp+var_A], dx
		mov	ax, [si+4]
		sub	ax, [si+0Ch]
		push	ax
		mov	ax, [di+2]
		sub	ax, [bp+var_A]
		pop	dx
		imul	dx
		mov	dx, [si+6]
		sub	dx, [si+0Eh]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	[bp+var_C], ax
		jmp	short loc_CD34
; ���������������������������������������������������������������������������

loc_CD2E:				; CODE XREF: sub_CC36+C1j
		mov	ax, [si+4]
		mov	[bp+var_C], ax

loc_CD34:				; CODE XREF: sub_CC36+F6j
		mov	ax, [di]
		cmp	ax, [bp+var_C]
		jle	short loc_CD41
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CD41:				; CODE XREF: sub_CC36+103j
		mov	ax, [si+4]
		sub	ax, [si]
		mov	cx, ax
		or	cx, cx
		jz	short loc_CD72
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [si]
		cwd
		idiv	cx
		mov	dx, [si+2]
		sub	dx, ax
		mov	[bp+var_E], dx
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [di]
		cwd
		idiv	cx
		add	ax, [bp+var_E]
		mov	[bp+var_10], ax
		jmp	short loc_CD78
; ���������������������������������������������������������������������������

loc_CD72:				; CODE XREF: sub_CC36+114j
		mov	ax, [si+6]
		mov	[bp+var_10], ax

loc_CD78:				; CODE XREF: sub_CC36+13Aj
		mov	ax, [di+2]
		cmp	ax, [bp+var_10]
		jle	short loc_CD86
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CD86:				; CODE XREF: sub_CC36+148j
		mov	ax, [si+0Ch]
		sub	ax, [si+8]
		mov	[bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_CDBE
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [si+8]
		cwd
		idiv	[bp+var_12]
		mov	dx, [si+0Ah]
		sub	dx, ax
		mov	[bp+var_14], dx
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [di]
		cwd
		idiv	[bp+var_12]
		add	ax, [bp+var_14]
		mov	[bp+var_16], ax
		jmp	short loc_CDC4
; ���������������������������������������������������������������������������

loc_CDBE:				; CODE XREF: sub_CC36+15Dj
		mov	ax, [si+0Eh]
		mov	[bp+var_16], ax

loc_CDC4:				; CODE XREF: sub_CC36+186j
		mov	ax, [di+2]
		cmp	ax, [bp+var_16]
		jge	short loc_CDD2
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_CDD2:				; CODE XREF: sub_CC36+194j
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_CC36	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
seg019		ends
