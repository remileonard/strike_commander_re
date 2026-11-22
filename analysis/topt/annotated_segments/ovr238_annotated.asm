ovr238		segment	para public 'OVERLAY' use16
		assume cs:ovr238
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BDB50		proc far

var_3E		= word ptr -3Eh
var_2A		= word ptr -2Ah
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		cmp	byte_4F157, 0
		jnz	short loc_BDB60
		jmp	loc_BDD0B

loc_BDB60:
		mov	ax, word_4D36C
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, word_49DFA
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		cmp	byte_4C124, 0
		jnz	short loc_BDB82
		jmp	loc_BDC12

loc_BDB82:
		push	18h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	3F26h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		push	20h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	3F38h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		push	28h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	3F4Dh
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		jmp	loc_BDCC0

loc_BDC12:
		push	20h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		cmp	byte_4C122, 0
		jz	short loc_BDC4A
		push	3F62h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		jmp	short loc_BDC69

loc_BDC4A:
		push	3F76h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4

loc_BDC69:
		push	28h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		cmp	byte_4C123, 0
		jz	short loc_BDCA1
		push	3F8Bh
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		jmp	short loc_BDCC0

loc_BDCA1:
		push	3F9Fh
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4

loc_BDCC0:
		push	38h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		mov	al, byte_4C116
		mov	ah, 0
		push	ax
		push	3
		mov	ax, [bp+arg_0]
		add	ax, 5Eh
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3FB4h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_2A]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4

loc_BDD0B:
		leave
		retf
sub_BDB50		endp
ovr238		ends
