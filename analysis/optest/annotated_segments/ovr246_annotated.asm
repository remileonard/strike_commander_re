ovr246		segment	para public 'OVERLAY' use16
		assume cs:ovr246
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C87E0	proc far		; CODE XREF: sub_43000J

var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C8802
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_C8802
		jmp	loc_C8904
; ���������������������������������������������������������������������������

loc_C8802:				; CODE XREF: sub_C87E0+Dj
					; sub_C87E0+1Dj
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3878h
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+28h], 2
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		mov	ax, [bp+arg_E]
		mov	[si+20h], ax
		mov	ax, [bp+arg_C]
		mov	[si+1Eh], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_6], eax
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		mov	[bp+var_7], al
		mov	eax, [bp+var_6]
		mov	[si+24h], eax
		mov	al, [bp+var_7]
		mov	[si+28h], al
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx+6]
		mov	[si+2Ah], eax
		mov	ax, [si+20h]
		mov	dx, 0Eh
		imul	dx
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+22h], ax
		mov	di, [si+22h]
		lea	ax, [bp+arg_10]
		mov	[bp+var_A], ax
		jmp	short loc_C88FA
; ���������������������������������������������������������������������������

loc_C889D:				; CODE XREF: sub_C87E0+122j
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+2],	ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+4],	ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+6],	ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+8],	ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+0Ah], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+0Ch], ax
		add	di, 0Eh

loc_C88FA:				; CODE XREF: sub_C87E0+BBj
		mov	ax, [bp+arg_E]
		dec	[bp+arg_E]
		or	ax, ax
		jnz	short loc_C889D

loc_C8904:				; CODE XREF: sub_C87E0+1Fj
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_C87E0	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C890E	proc far		; CODE XREF: sub_4300AJ

var_16		= word ptr -16h
var_14		= word ptr -14h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_F859
		add	sp, 2
		mov	ax, [si+20h]
		mov	[bp+var_2], ax
		jmp	loc_C8A4B
; ���������������������������������������������������������������������������

loc_C892B:				; CODE XREF: sub_C890E+147j
		mov	ax, [bp+var_2]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [si+22h]
		add	dx, ax
		mov	di, dx
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_C897B
		push	word ptr [di+0Ah]
		push	0
		mov	al, [si+28h]
		push	ax
		push	word ptr [si+26h]
		push	word ptr [si+24h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+6]
		add	ax, [di+2]
		push	ax
		mov	ax, [si+4]
		add	ax, [di]
		push	ax
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		jmp	short loc_C89B0
; ���������������������������������������������������������������������������

loc_C897B:				; CODE XREF: sub_C890E+34j
		push	word ptr [di+8]
		push	0
		mov	al, [si+28h]
		push	ax
		push	word ptr [si+26h]
		push	word ptr [si+24h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+6]
		add	ax, [di+2]
		push	ax
		mov	ax, [si+4]
		add	ax, [di]
		push	ax
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_C89B0:				; CODE XREF: sub_C890E+6Bj
		cmp	word ptr [di+0Ch], 0
		jnz	short loc_C89B9
		jmp	loc_C8A4B
; ���������������������������������������������������������������������������

loc_C89B9:				; CODE XREF: sub_C890E+A6j
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di+2]
		mov	[bp+var_6], ax
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_C89E1
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_C89E1:				; CODE XREF: sub_C890E+CBj
		mov	ax, word_45B54
		add	ax, 2
		mov	[bp+var_8], ax
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		push	[bp+var_8]
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	si
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	word_45B54
		push	word_45B02
		push	word ptr [di+0Ch]
		push	[bp+var_6]
		push	[bp+var_4]
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2

loc_C8A4B:				; CODE XREF: sub_C890E+1Aj
					; sub_C890E+A8j
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jz	short loc_C8A58
		jmp	loc_C892B
; ���������������������������������������������������������������������������

loc_C8A58:				; CODE XREF: sub_C890E+145j
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_C890E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8A65	proc far		; CODE XREF: sub_4300FJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [si+20h]
		jmp	short loc_C8ABE
; ���������������������������������������������������������������������������

loc_C8A72:				; CODE XREF: sub_C8A65+5Ej
		mov	ax, cx
		mov	dx, 0Eh
		imul	dx
		mov	dx, [si+22h]
		add	dx, ax
		mov	di, dx
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jge	short loc_C8AA9
		mov	ax, [di]
		add	ax, [di+4]
		cmp	ax, [bp+arg_2]
		jle	short loc_C8AA9
		mov	ax, [di+2]
		cmp	ax, [bp+arg_4]
		jge	short loc_C8AA9
		mov	ax, [di+2]
		add	ax, [di+6]
		cmp	ax, [bp+arg_4]
		jle	short loc_C8AA9
		mov	ax, 1
		jmp	short loc_C8AAB
; ���������������������������������������������������������������������������

loc_C8AA9:				; CODE XREF: sub_C8A65+20j
					; sub_C8A65+2Aj ...
		xor	ax, ax

loc_C8AAB:				; CODE XREF: sub_C8A65+42j
		or	al, al
		jz	short loc_C8ABE
		mov	ax, [di+0Ah]
		cmp	ax, [di+8]
		jz	short loc_C8ABE
		mov	bx, [si+1Eh]
		mov	[bx], cx
		jmp	short loc_C8AC5
; ���������������������������������������������������������������������������

loc_C8ABE:				; CODE XREF: sub_C8A65+Bj
					; sub_C8A65+48j ...
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_C8A72

loc_C8AC5:				; CODE XREF: sub_C8A65+57j
		pop	di
		pop	si
		pop	bp
		retf
sub_C8A65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8AC9	proc far		; CODE XREF: sub_43005J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C8B3F
		mov	word ptr [si+0Eh], 3878h
		push	word ptr [si+22h]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+22h], 0
		cmp	byte ptr [si+29h], 0
		jz	short loc_C8B13
		cmp	dword ptr [si+24h], 0
		jz	short loc_C8B13
		push	0
		mov	al, [si+28h]
		push	ax
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C8B13:				; CODE XREF: sub_C8AC9+28j
					; sub_C8AC9+2Fj
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_C8B3F
		push	si
		call	sub_308
		add	sp, 2

loc_C8B3F:				; CODE XREF: sub_C8AC9+Dj
					; sub_C8AC9+6Bj
		pop	di
		pop	si
		pop	bp
		retf
sub_C8AC9	endp

ovr246		ends
