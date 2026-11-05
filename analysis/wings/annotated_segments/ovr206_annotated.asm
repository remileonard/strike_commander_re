ovr206		segment	para public 'OVERLAY' use16
		assume cs:ovr206
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74650		proc far

var_72		= word ptr -72h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		push	di
		cmp	byte_5C5B7, 0
		jnz	short loc_74662
		jmp	loc_74A19

loc_74662:
		mov	ax, word_5DD42
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word_5B3E3
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	0
		push	word_5B3E3
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4
		push	large 0A0000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		push	word_5C5A2
		call	DisplayCache_ComputeChecksum_451CF
		push	ax
		call	DisplayCache_Helper_4573C
		push	dx
		push	ax
		push	word_5C3F3
		push	word_6009C
		push	3
		push	287Ah
		lea	ax, [bp+var_72]
		push	ax
		call	UIScreen_BuildFormattedText_3946B
		add	sp, 6
		push	ax
		push	2DCAh
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 12h
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		call	sub_440E0
		push	dx
		push	ax
		pop	eax
		mov	edx, dword_60352
		sub	edx, eax
		mov	[bp+var_6], edx
		push	0
		push	3
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		add	sp, 6
		push	dx
		push	ax
		call	sub_440E0
		push	dx
		push	ax
		push	large [bp+var_6]
		push	2DFFh
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 10h
		push	large 140000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		call	DisplayCache_ComputeChecksum_451CF
		push	ax
		push	2E2Ch
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	large 1E0005h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		mov	eax, dword_602C0
		sub	eax, dword_602BC
		push	eax
		mov	eax, dword_602BC
		sub	eax, dword_602B8
		push	eax
		mov	eax, dword_602B8
		sub	eax, dword_602B4
		push	eax
		mov	eax, dword_602B4
		sub	eax, dword_602B0
		push	eax
		mov	eax, dword_602C0
		sub	eax, dword_602B0
		push	eax
		push	2E39h
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	large 280000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		mov	eax, dword_602B8
		sub	eax, dword_602CC
		push	eax
		mov	eax, dword_602CC
		sub	eax, dword_602C8
		push	eax
		mov	eax, dword_602C8
		sub	eax, dword_602C4
		push	eax
		mov	eax, dword_602C4
		sub	eax, dword_602B4
		push	eax
		mov	eax, dword_602B8
		sub	eax, dword_602B4
		push	eax
		push	2E63h
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	large 320000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		push	large dword_602DC
		push	large dword_602D8
		push	large dword_602D4
		push	large dword_602D0
		mov	eax, dword_602B4
		sub	eax, dword_602B0
		push	eax
		push	2E8Dh
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	large 3C0000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		mov	ax, word_6034E
		sub	ax, word_6034A
		push	ax
		mov	ax, word_6034A
		sub	ax, word_60346
		push	ax
		mov	ax, word_60342
		sub	ax, word_6033E
		push	ax
		mov	ax, word_602F4
		sub	ax, word_602F0
		push	ax
		push	2EB7h
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		push	large 460000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		xor	ax, ax
		mov	[bp+var_E], ax
		mov	[bp+var_C], ax
		mov	[bp+var_A], ax
		mov	dx, ax
		mov	ax, dx
		mov	[bp+var_8], ax
		mov	di, ax
		mov	cx, di
		xor	si, si
		jmp	short loc_74943

loc_74906:
		mov	al, [si+65D8h]
		mov	ah, 0
		add	cx, ax
		mov	al, [si+65E2h]
		mov	ah, 0
		add	di, ax
		mov	al, [si+65ECh]
		mov	ah, 0
		add	[bp+var_8], ax
		mov	al, [si+65F6h]
		mov	ah, 0
		add	dx, ax
		mov	al, [si+6600h]
		mov	ah, 0
		add	[bp+var_A], ax
		mov	al, [si+660Ah]
		mov	ah, 0
		add	[bp+var_C], ax
		mov	al, [si+6614h]
		mov	ah, 0
		add	[bp+var_E], ax
		inc	si

loc_74943:
		cmp	si, 0Ah
		jl	short loc_74906
		mov	ax, dx
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_8]
		cwd
		idiv	bx
		push	ax
		mov	ax, di
		cwd
		idiv	bx
		push	ax
		mov	ax, cx
		cwd
		idiv	bx
		push	ax
		push	2ED7h
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		push	large 5A0000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		mov	ax, [bp+var_E]
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_C]
		cwd
		idiv	bx
		push	ax
		mov	ax, [bp+var_A]
		cwd
		idiv	bx
		push	ax
		push	2F04h
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		push	large 640000h
		push	word_5B3E3
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		mov	ax, word_5CADC
		inc	ax
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	word_5CADC, dx
		mov	bx, word_5CADC
		mov	al, 0
		mov	[bx+6614h], al
		mov	[bx+660Ah], al
		mov	[bx+6600h], al
		mov	[bx+65F6h], al
		mov	[bx+65ECh], al
		mov	[bx+65E2h], al
		mov	[bx+65D8h], al
		xor	eax, eax
		mov	dword_5CAE2, eax
		mov	dword_5CADE, eax

loc_74A19:
		pop	di
		pop	si
		leave
		retf
sub_74650		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_RenderGraphVGA_Wrapper_51B77 (sub_51B77 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_RenderGraphVGA_Wrapper_50E44 (sub_50E44 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant UIScreen_RenderGraphVGA_509EE.
; ==============================================================================================
UIScreen_RenderGraphVGA_Wrapper_74A1D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_74650
		pop	cx
		push	si
		push	649Bh
		call	WorldObjects_CallSlot1COnActive_365F4
		add	sp, 4
		pop	si
		pop	bp
		retf
UIScreen_RenderGraphVGA_Wrapper_74A1D		endp
ovr206		ends
