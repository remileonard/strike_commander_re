seg124		segment	para public 'CODE' use16
		assume cs:seg124
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 68h, 0ADh, 67h, 9Ah, 0A0h, 0, 14h, 1Eh, 83h, 0C4h, 4, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_519BE		proc far

var_BA		= word ptr -0BAh
var_A6		= word ptr -0A6h
var_56		= word ptr -56h
var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		cmp	byte_7978A, 0
		jnz	short loc_519CF
		jmp	loc_51B75

loc_519CF:
		mov	ax, word_7AF7C
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	0
		push	word_77535
		call	sub_75D09
		add	sp, 4
		push	0EFh
		push	word_77535
		call	sub_75D09
		add	sp, 4
		push	large 0A0000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	seg seg008
		push	offset loc_5678
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79772
		call	DisplayCache_ComputeChecksum_65BFD
		push	ax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		push	word_77507
		push	word_7CBC8
		push	3
		push	303Ah
		lea	ax, [bp+var_BA]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 12h
		lea	ax, [bp+var_56]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	dx, seg seg230
		mov	es, dx
		mov	edx, es:0
		sub	edx, eax
		mov	[bp+var_6], edx
		push	seg seg008
		push	offset loc_56AD
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	0
		push	3
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		add	sp, 6
		push	dx
		push	ax
		call	sub_64B0E
		push	dx
		push	ax
		push	large [bp+var_6]
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 10h
		push	large 140000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4
		push	seg seg008
		push	offset loc_56DA
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_54BE
		add	sp, 6
		call	DisplayCache_ComputeChecksum_65BFD
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	large 1E0005h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4
		call	sub_66372
		push	dx
		push	ax
		push	3435h
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	large 280005h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_51B75:
		leave
		retf
sub_519BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_RenderGraphVGA_Wrapper_50E44 (sub_50E44 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant UIScreen_RenderGraphVGA_509EE.
; ==============================================================================================
UIScreen_RenderGraphVGA_Wrapper_51B77		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_519BE
		pop	cx
		push	si
		push	67ADh
		call	WorldObjects_CallSlot1COnActive_1E461
		add	sp, 4
		pop	si
		pop	bp
		retf
UIScreen_RenderGraphVGA_Wrapper_51B77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51B93		proc far

var_5C		= word ptr -5Ch
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		mov	[bp+var_4], 0
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_C], eax
		push	seg seg008
		push	offset loc_56E7
		lea	ax, [bp+var_5C]
		push	ax
		call	sub_54BE
		add	sp, 6
		cmp	byte_79B64, 0
		jz	short loc_51C0C
		push	[bp+arg_0]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
sub_51B93		endp
seg124		ends
