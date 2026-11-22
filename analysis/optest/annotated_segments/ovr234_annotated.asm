ovr234		segment	para public 'OVERLAY' use16
		assume cs:ovr234
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C5CA0	proc far		; CODE XREF: sub_42D10J

var_3E		= word ptr -3Eh
var_2A		= word ptr -2Ah
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		cmp	byte_49085, 0
		jnz	short loc_C5CB0
		jmp	locret_C5E5B
; ���������������������������������������������������������������������������

loc_C5CB0:				; CODE XREF: sub_C5CA0+Bj
		mov	ax, word_46F44
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, word_443B9
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		cmp	byte_46018, 0
		jnz	short loc_C5CD2
		jmp	loc_C5D62
; ���������������������������������������������������������������������������

loc_C5CD2:				; CODE XREF: sub_C5CA0+2Dj
		push	18h
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		push	36F4h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		push	20h ; ' '
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		push	3706h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		push	28h ; '('
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		push	371Bh
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		jmp	loc_C5E10
; ���������������������������������������������������������������������������

loc_C5D62:				; CODE XREF: sub_C5CA0+2Fj
		push	20h ; ' '
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		cmp	byte_46016, 0
		jz	short loc_C5D9A
		push	3730h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		jmp	short loc_C5DB9
; ���������������������������������������������������������������������������

loc_C5D9A:				; CODE XREF: sub_C5CA0+D7j
		push	3744h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4

loc_C5DB9:				; CODE XREF: sub_C5CA0+F8j
		push	28h ; '('
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		cmp	byte_46017, 0
		jz	short loc_C5DF1
		push	3759h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		jmp	short loc_C5E10
; ���������������������������������������������������������������������������

loc_C5DF1:				; CODE XREF: sub_C5CA0+12Ej
		push	376Dh
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4

loc_C5E10:				; CODE XREF: sub_C5CA0+BFj
					; sub_C5CA0+14Fj
		push	38h ; '8'
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		mov	al, byte_4600A
		mov	ah, 0
		push	ax
		push	3
		mov	ax, [bp+arg_0]
		add	ax, 5Eh	; '^'
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3782h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_2A]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4

locret_C5E5B:				; CODE XREF: sub_C5CA0+Dj
		leave
		retf
sub_C5CA0	endp

ovr234		ends
