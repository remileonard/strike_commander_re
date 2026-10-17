ovr225		segment	para public 'OVERLAY' use16
		assume cs:ovr225
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3AD0	proc far		; CODE XREF: sub_42B65J sub_C3F07+9p

var_76		= word ptr -76h
var_62		= word ptr -62h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 76h
		push	si
		push	di
		cmp	byte_46478, 0
		jnz	short loc_C3AE2
		jmp	loc_C3F03
; ���������������������������������������������������������������������������

loc_C3AE2:				; CODE XREF: sub_C3AD0+Dj
		mov	ax, word_46F44
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, word_443B9
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	0
		push	word_443B9
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		push	0Ah
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		push	word_46462
		call	DisplayCache_ComputeChecksum_2C52D
		push	ax
		call	DisplayCache_Helper_2C859
		push	dx
		push	ax
		push	word_462C5
		push	word_492C8
		push	3
		push	343Ah
		lea	ax, [bp+var_76]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	34BEh
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 12h
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		call	Registry_LookupForTextRenderer_2A6C7
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	edx, dword_49520
		sub	edx, eax
		mov	[bp+var_6], edx
		push	0
		push	3
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		add	sp, 6
		push	dx
		push	ax
		call	Registry_LookupForTextRenderer_2A6C7
		push	dx
		push	ax
		push	large [bp+var_6]
		push	34F3h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 10h
		push	14h
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		mov	eax, dword_49476
		sub	eax, dword_49472
		push	eax
		mov	eax, dword_49472
		sub	eax, dword_4946E
		push	eax
		mov	eax, dword_4946E
		sub	eax, dword_4946A
		push	eax
		push	large [dword_464DA]
		push	large [dword_464D6]
		push	word ptr dword_464D2
		mov	eax, dword_4946A
		sub	eax, dword_49466
		push	eax
		mov	eax, dword_49466
		sub	eax, dword_49462
		push	eax
		mov	eax, dword_49476
		sub	eax, dword_49462
		push	eax
		push	3520h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 26h
		push	1Eh
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		mov	eax, dword_4948E
		sub	eax, dword_4948A
		push	eax
		mov	eax, dword_4948A
		sub	eax, dword_49486
		push	eax
		mov	eax, dword_49486
		sub	eax, dword_49482
		push	eax
		mov	eax, dword_49482
		sub	eax, dword_4947E
		push	eax
		mov	eax, dword_4948E
		sub	eax, dword_4947E
		push	eax
		push	355Dh
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	28h ; '('
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		mov	eax, dword_49486
		sub	eax, dword_4949A
		push	eax
		mov	eax, dword_4949A
		sub	eax, dword_49496
		push	eax
		mov	eax, dword_49496
		sub	eax, dword_49492
		push	eax
		mov	eax, dword_49492
		sub	eax, dword_49482
		push	eax
		mov	eax, dword_49486
		sub	eax, dword_49482
		push	eax
		push	3587h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	32h ; '2'
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		push	large [dword_494AA]
		push	large [dword_494A6]
		push	large [dword_494A2]
		push	large [dword_4949E]
		mov	eax, dword_49482
		sub	eax, dword_4947E
		push	eax
		push	35B1h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	3Ch ; '<'
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		mov	ax, word_4951C
		sub	ax, word_49518
		push	ax
		mov	ax, word_49518
		sub	ax, word_49514
		push	ax
		mov	ax, word_49510
		sub	ax, word_4950C
		push	ax
		mov	ax, word_494C2
		sub	ax, word_494BE
		push	ax
		push	35DBh
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		push	46h ; 'F'
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		xor	ax, ax
		mov	[bp+var_12], ax
		mov	[bp+var_10], ax
		mov	[bp+var_E], ax
		mov	[bp+var_C], ax
		mov	[bp+var_A], ax
		mov	[bp+var_8], ax
		mov	di, ax
		xor	si, si
		jmp	short loc_C3E08
; ���������������������������������������������������������������������������

loc_C3DC9:				; CODE XREF: sub_C3AD0+33Bj
		mov	al, [si+64A6h]
		mov	ah, 0
		add	di, ax
		mov	al, [si+64B0h]
		mov	ah, 0
		add	[bp+var_8], ax
		mov	al, [si+64BAh]
		mov	ah, 0
		add	[bp+var_A], ax
		mov	al, [si+64C4h]
		mov	ah, 0
		add	[bp+var_C], ax
		mov	al, [si+64CEh]
		mov	ah, 0
		add	[bp+var_E], ax
		mov	al, [si+64D8h]
		mov	ah, 0
		add	[bp+var_10], ax
		mov	al, [si+64E2h]
		mov	ah, 0
		add	[bp+var_12], ax
		inc	si

loc_C3E08:				; CODE XREF: sub_C3AD0+2F7j
		cmp	si, 0Ah
		jl	short loc_C3DC9
		mov	ax, [bp+var_C]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_A]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_8]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, di
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		push	35FBh
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		push	5Ah ; 'Z'
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		mov	ax, [bp+var_12]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_10]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_E]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		push	3628h
		lea	ax, [bp+var_62]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		push	64h ; 'd'
		push	0
		push	word_443B9
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		lea	ax, [bp+var_62]
		push	ax
		push	word_443B9
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		mov	ax, word_464D0
		inc	ax
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	word_464D0, dx
		mov	bx, word_464D0
		mov	al, 0
		mov	[bx+64E2h], al
		mov	bx, word_464D0
		mov	[bx+64D8h], al
		mov	bx, word_464D0
		mov	[bx+64CEh], al
		mov	bx, word_464D0
		mov	[bx+64C4h], al
		mov	bx, word_464D0
		mov	[bx+64BAh], al
		mov	bx, word_464D0
		mov	[bx+64B0h], al
		mov	bx, word_464D0
		mov	[bx+64A6h], al
		xor	eax, eax
		mov	dword_464D6, eax
		mov	dword_464D2, eax

loc_C3F03:				; CODE XREF: sub_C3AD0+Fj
		pop	di
		pop	si
		leave
		retf
sub_C3AD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3F07	proc far		; CODE XREF: sub_42B60J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_C3AD0
		add	sp, 2
		push	si
		push	6369h
		call	sub_20115
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_C3F07	endp

ovr225		ends
