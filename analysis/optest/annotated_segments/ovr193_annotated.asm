ovr193		segment	para public 'OVERLAY' use16
		assume cs:ovr193
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5E180	proc far		; CODE XREF: sub_422D9J

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	1
		call	sub_3F3FC
		add	sp, 2
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	bx, 5
		cwd
		idiv	bx
		mov	word_44429, ax
		leave
		retf
sub_5E180	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5E1A1	proc far		; CODE XREF: sub_422C5J

var_172		= word ptr -172h
var_115		= dword	ptr -115h
var_111		= dword	ptr -111h
var_10C		= word ptr -10Ch
var_BC		= word ptr -0BCh
var_9A		= word ptr -9Ah
var_3D		= dword	ptr -3Dh
var_39		= dword	ptr -39h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_27		= byte ptr -27h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 172h
		push	si
		push	di
		lea	ax, [bp+var_9A]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_9A], 556h
		mov	[bp+var_39], 100h
		mov	[bp+var_3D], 0
		mov	[bp+var_9A], 693h
		mov	al, byte ptr [bp+arg_2]
		add	al, 41h	; 'A'
		mov	byte_4443F, al
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5E238
		push	ds
		push	offset unk_4443C
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_5E238
		push	1
		push	141Ch
		lea	ax, [bp+var_9A]
		push	ax
		mov	bx, [bp+var_9A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h ; '"'
		push	ss
		lea	ax, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		lea	si, [bp+var_BC]
		mov	ax, ss
		mov	di, 67B4h
		push	ds
		pop	es
		assume es:dseg
		push	ds
		mov	ds, ax
		mov	cx, 11h
		rep movsw
		pop	ds
		jmp	loc_5E83E
; ���������������������������������������������������������������������������

loc_5E238:				; CODE XREF: sub_5E1A1+41j
					; sub_5E1A1+51j
		call	sub_28CAB
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	100h
		push	0
		lea	ax, [bp+var_10]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		lea	ax, [bp+var_10]
		push	ax
		call	sub_2CDC3
		add	sp, 2
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		mov	[bp+var_14], 13Fh
		mov	[bp+var_12], 0C7h ; '�'
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		mov	eax, [bp+var_26]
		mov	[bp+var_22], eax
		mov	[bp+var_1E], 3
		mov	[bp+var_1D], 1
		mov	[bp+var_1C], 0
		mov	[bp+var_1C], 0FA00h
		lea	ax, [bp+var_18]
		push	ax
		push	0
		mov	al, [bp+var_1E]
		push	ax
		push	word ptr [bp+var_22+2]
		push	word ptr [bp+var_22]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegionVariant_33ABC
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	1425h
		push	62D0h
		call	sub_42911
		add	sp, 4
		push	62D0h
		call	VGA_LoadPalette
		add	sp, 2
		push	ds
		push	offset a_shp_1	; ".shp"
		push	ds
		push	offset aJoycalib ; "joycalib"
		push	ds
		push	offset aFonts	; "FONTS"
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		lea	ax, [bp+var_172]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_172], 556h
		mov	[bp+var_111], 100h
		mov	[bp+var_115], 0
		mov	[bp+var_172], 693h
		push	1
		lea	ax, [bp+var_10C]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		mov	bx, [bp+var_172]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_172]
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		push	1
		push	0
		push	3
		push	large [bp+var_30]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_34+2],	dx
		mov	word ptr [bp+var_34], ax
		mov	eax, [bp+var_34]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_30]
		mov	[bp+var_4], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_2C]
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		lea	ax, [bp+var_172]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		lea	ax, [bp+var_172]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	[bp+var_27], 1
		jmp	loc_5E75C
; ���������������������������������������������������������������������������

loc_5E432:				; CODE XREF: sub_5E1A1+5C1j
		call	Joystick_InitCalibrationDefaults_3F3B6
		push	0
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	87h ; '�'
		push	5
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	8
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	ax, [bp+arg_2]
		inc	ax
		push	ax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h ; '�'
		push	32h ; '2'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short loc_5E4CA
; ���������������������������������������������������������������������������

loc_5E4C5:				; CODE XREF: sub_5E1A1+339j
		call	Joystick_SampleAxesToTable_3F134

loc_5E4CA:				; CODE XREF: sub_5E1A1+322j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_5E4C5
		jmp	short loc_5E4E3
; ���������������������������������������������������������������������������

loc_5E4DE:				; CODE XREF: sub_5E1A1+354j
		call	Joystick_SampleAxesToTable_3F134

loc_5E4E3:				; CODE XREF: sub_5E1A1+33Bj
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_5E4DE
		push	[bp+arg_2]
		call	sub_3F427
		add	sp, 2
		jmp	short loc_5E509
; ���������������������������������������������������������������������������

loc_5E504:				; CODE XREF: sub_5E1A1+378j
		call	Joystick_SampleAxesToTable_3F134

loc_5E509:				; CODE XREF: sub_5E1A1+361j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_5E504
		push	8
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	ax, [bp+arg_2]
		add	ax, 2
		push	ax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h ; '�'
		push	2Dh ; '-'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short loc_5E584
; ���������������������������������������������������������������������������

loc_5E57F:				; CODE XREF: sub_5E1A1+3F5j
		call	Joystick_SampleAxesToTable_3F134

loc_5E584:				; CODE XREF: sub_5E1A1+3DCj
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_5E57F
		push	[bp+arg_2]
		call	Joystick_ComputeCalibrationRatio_3F463
		add	sp, 2
		jmp	short loc_5E5AA
; ���������������������������������������������������������������������������

loc_5E5A5:				; CODE XREF: sub_5E1A1+419j
		call	Joystick_SampleAxesToTable_3F134

loc_5E5AA:				; CODE XREF: sub_5E1A1+402j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_5E5A5
		push	8
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	ax, [bp+arg_2]
		add	ax, 3
		push	ax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h ; '�'
		push	3Bh ; ';'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short loc_5E625
; ���������������������������������������������������������������������������

loc_5E620:				; CODE XREF: sub_5E1A1+496j
		call	Joystick_SampleAxesToTable_3F134

loc_5E625:				; CODE XREF: sub_5E1A1+47Dj
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_5E620
		push	[bp+arg_2]
		call	sub_3F445
		add	sp, 2
		jmp	short loc_5E64B
; ���������������������������������������������������������������������������

loc_5E646:				; CODE XREF: sub_5E1A1+4BAj
		call	Joystick_SampleAxesToTable_3F134

loc_5E64B:				; CODE XREF: sub_5E1A1+4A3j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_5E646
		push	1Eh
		push	20h ; ' '
		push	20h ; ' '
		call	Joystick_InterpolateCalibrationPercent_3F4DC
		add	sp, 6
		cmp	word_497E4, 0
		jz	short loc_5E68B
		cmp	word_497E8, 0
		jz	short loc_5E68B
		cmp	word_497E6, 0
		jz	short loc_5E68B
		cmp	word_497EA, 0
		jz	short loc_5E68B
		mov	[bp+var_27], 0

loc_5E68B:				; CODE XREF: sub_5E1A1+4CFj
					; sub_5E1A1+4D6j ...
		mov	al, [bp+var_27]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5E6CF
		push	0
		push	141Ch
		lea	ax, [bp+var_9A]
		push	ax
		mov	bx, [bp+var_9A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h ; '"'
		push	ds
		push	offset word_497D4
		lea	ax, [bp+var_9A]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		lea	ax, [bp+var_9A]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		jmp	loc_5E75C
; ���������������������������������������������������������������������������

loc_5E6CF:				; CODE XREF: sub_5E1A1+4F1j
		push	8
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	7
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h ; '�'
		push	1Fh
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		add	sp, 2
		push	7
		call	PIT_DelayLoop
		add	sp, 2
		call	sub_1C83
		jmp	short loc_5E748
; ���������������������������������������������������������������������������

loc_5E743:				; CODE XREF: sub_5E1A1+5B9j
		call	Joystick_SampleAxesToTable_3F134

loc_5E748:				; CODE XREF: sub_5E1A1+5A0j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_5E743

loc_5E75C:				; CODE XREF: sub_5E1A1+28Ej
					; sub_5E1A1+52Bj
		cmp	[bp+var_27], 0
		jz	short loc_5E765
		jmp	loc_5E432
; ���������������������������������������������������������������������������

loc_5E765:				; CODE XREF: sub_5E1A1+5BFj
		push	0
		call	Joystick_UpdateCalibration_3F331
		add	sp, 2
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_10]
		mov	al, [bp+var_E]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		lea	ax, [bp+var_18]
		push	ax
		push	0
		mov	al, [bp+var_1E]
		push	ax
		push	word ptr [bp+var_22+2]
		push	word ptr [bp+var_22]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegion_334A0
		add	sp, 8
		call	sub_28CC3
		cmp	[bp+var_1D], 0
		jz	short loc_5E7E4
		cmp	[bp+var_22], 0
		jz	short loc_5E7E4
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5E7E4:				; CODE XREF: sub_5E1A1+623j
					; sub_5E1A1+62Aj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	2
		lea	ax, [bp+var_10]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5], 0
		jz	short loc_5E82A
		cmp	[bp+var_A], 0
		jz	short loc_5E82A
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5E82A:				; CODE XREF: sub_5E1A1+669j
					; sub_5E1A1+670j
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0

loc_5E83E:				; CODE XREF: sub_5E1A1+94j
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5E1A1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5E851	proc far		; CODE XREF: sub_422CAJ

var_58		= word ptr -58h
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_44422
		mov	ah, 0
		or	ax, ax
		jz	short loc_5E868
		jmp	loc_5E9C9
; ���������������������������������������������������������������������������

loc_5E868:				; CODE XREF: sub_5E851+12j
		push	67A2h
		call	Stopwatch_RegisterTickModule_3EE35
		add	sp, 2
		mov	byte_48E5D, 0
		mov	byte_48E5C, 0
		push	1
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_5E89A
		push	di
		call	InputBinding_Construct_3E5DE
		add	sp, 2
		mov	ax, di
		jmp	short loc_5E89C
; ���������������������������������������������������������������������������

loc_5E89A:				; CODE XREF: sub_5E851+3Aj
		mov	ax, di

loc_5E89C:				; CODE XREF: sub_5E851+47j
		mov	[si+0Ah], ax
		push	50h ; 'P'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+0Ch], ax
		push	14h
		push	ds
		push	word ptr [si+0Ch]
		push	0
		call	Keyboard_RegisterOrInitHandlerTable_3E3DE
		add	sp, 8
		mov	[si+0Eh], ax
		push	0
		call	Joystick_ReadAndScaleAxes_3F059
		add	sp, 2
		mov	[si+10h], ax
		push	1
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_5E8ED
		push	[bp+var_2]
		call	TextScrollDisplay_Construct_3EA8B
		add	sp, 2
		mov	ax, [bp+var_2]
		jmp	short loc_5E8F0
; ���������������������������������������������������������������������������

loc_5E8ED:				; CODE XREF: sub_5E851+8Aj
		mov	ax, [bp+var_2]

loc_5E8F0:				; CODE XREF: sub_5E851+9Aj
		mov	[si+16h], ax
		push	seg stub193
		push	offset sub_422C0
		push	1
		push	14h
		push	7
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+12h], ax
		push	14h
		push	word ptr [si+12h]
		push	0
		call	TextScroll_Construct_3E7E8
		add	sp, 6
		mov	[si+14h], ax
		push	ds
		push	offset a_shp_2	; ".shp"
		push	ds
		push	offset aMouse	; "mouse"
		push	0
		push	0
		lea	ax, [bp+var_58]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_58]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		mov	eax, [bp+var_6]
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		push	si
		call	TextScrollDisplayB_TickHelper_3F737
		add	sp, 2
		push	5E3Ah
		call	TextScrollDisplayB_InitAndRegister_3F658
		add	sp, 2
		push	0
		push	word_46F46
		call	TextScrollDisplayB_ApplyHelperA_3F6C0
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_3F74A
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	[bp+var_8], 0
		jmp	short loc_5E9B9
; ���������������������������������������������������������������������������

loc_5E994:				; CODE XREF: sub_5E851+16Cj
		mov	al, byte ptr [bp+var_8]
		push	ax
		call	sub_3F3A6
		add	sp, 2
		or	al, al
		jz	short loc_5E9AE
		mov	bx, [bp+var_8]
		mov	byte ptr [bx+5E40h], 1
		jmp	short loc_5E9B6
; ���������������������������������������������������������������������������

loc_5E9AE:				; CODE XREF: sub_5E851+151j
		mov	bx, [bp+var_8]
		mov	byte ptr [bx+5E40h], 0

loc_5E9B6:				; CODE XREF: sub_5E851+15Bj
		inc	[bp+var_8]

loc_5E9B9:				; CODE XREF: sub_5E851+141j
		cmp	[bp+var_8], 2
		jl	short loc_5E994
		mov	byte_44422, 1
		call	sub_69B8

loc_5E9C9:				; CODE XREF: sub_5E851+14j
		pop	di
		pop	si
		leave
		retf
sub_5E851	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5E9CD	proc far		; CODE XREF: sub_422CFJ sub_5EA97+11p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_44422, 0
		jnz	short loc_5E9DE
		jmp	loc_5EA94
; ���������������������������������������������������������������������������

loc_5E9DE:				; CODE XREF: sub_5E9CD+Cj
		push	word ptr [si+12h]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+12h], 0
		cmp	word ptr [si+14h], 0
		jz	short loc_5EA0C
		push	word ptr [si+14h]
		call	ResourceHandle_IsValid_3ED7F
		add	sp, 2
		push	word ptr [si+14h]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5EA0C:				; CODE XREF: sub_5E9CD+25j
		mov	word ptr [si+14h], 0
		cmp	word ptr [si+16h], 0
		jz	short loc_5EA31
		push	0
		push	word ptr [si+16h]
		call	TextScrollDisplay_Destruct_3EAAE
		add	sp, 4
		push	word ptr [si+16h]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5EA31:				; CODE XREF: sub_5E9CD+48j
		mov	word ptr [si+16h], 0
		push	3
		push	word ptr [si+10h]
		call	sub_3F10E
		add	sp, 4
		mov	word ptr [si+10h], 0
		push	3
		push	word ptr [si+0Eh]
		call	Keyboard_UnregisterHandlerTable_3E486
		add	sp, 4
		mov	word ptr [si+0Eh], 0
		push	word ptr [si+0Ch]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+0Ch], 0
		cmp	word ptr [si+0Ah], 0
		jz	short loc_5EA8A
		push	0
		push	word ptr [si+0Ah]
		call	InputBinding_Destruct_3E601
		add	sp, 4
		push	word ptr [si+0Ah]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5EA8A:				; CODE XREF: sub_5E9CD+A1j
		mov	word ptr [si+0Ah], 0
		mov	byte_44422, 0

loc_5EA94:				; CODE XREF: sub_5E9CD+Ej
		pop	si
		pop	bp
		retf
sub_5E9CD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EA97	proc far		; CODE XREF: sub_422D4J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5EAF0
		push	si
		push	cs
		call	near ptr sub_5E9CD
		add	sp, 2
		cmp	byte ptr [si+5], 0
		jz	short loc_5EACE
		cmp	dword ptr [si],	0
		jz	short loc_5EACE
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5EACE:				; CODE XREF: sub_5EA97+1Bj
					; sub_5EA97+21j
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_5EAF0
		push	si
		call	sub_308
		add	sp, 2

loc_5EAF0:				; CODE XREF: sub_5EA97+Dj
					; sub_5EA97+4Ej
		pop	di
		pop	si
		pop	bp
		retf
sub_5EA97	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EAF4	proc far		; CODE XREF: sub_422C0J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5EB0F
		push	7
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_5EB17

loc_5EB0F:				; CODE XREF: sub_5EAF4+9j
		mov	ax, si
		add	ax, 6
		mov	byte ptr [si], 0

loc_5EB17:				; CODE XREF: sub_5EAF4+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5EAF4	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
ovr193		ends
