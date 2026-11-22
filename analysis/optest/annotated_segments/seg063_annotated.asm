seg063		segment	byte public 'CODE' use16
		assume cs:seg063
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_291F4	proc far		; CODE XREF: sub_292FC+69p
					; sub_29453+95p

arg_0		= word ptr  6

		push	bp

loc_291F5:				; DATA XREF: seg170:02BEo
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_291F4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_291FC	proc far		; CODE XREF: seg063:01B5p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_291FC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		call	sub_F859
		add	sp, 2
		push	word_46F46
		push	60B6h
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		cmp	byte ptr [bp+10h], 0
		jz	short loc_29245
		push	0
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	4
		push	5
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch

loc_29245:				; CODE XREF: seg063:003Bj
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	27h ; '''
		push	5
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	di
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word_46F46
		push	60B6h
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+6]
		lea	ax, [bp-66h]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	word ptr [bp-66h], 556h
		mov	dword ptr [bp-5], 100h
		mov	dword ptr [bp-9], 0
		mov	word ptr [bp-66h], 693h
		push	0
		push	385Eh
		lea	ax, [bp-66h]
		push	ax
		mov	bx, [bp-66h]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh ; '.'
		push	ds
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		lea	ax, [bp-66h]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		lea	ax, [bp-66h]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		lea	ax, [bp-66h]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_292FC	proc far		; CODE XREF: seg063:01E2p

var_66		= word ptr -66h
var_9		= dword	ptr -9
var_5		= dword	ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_66], 556h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 693h
		push	1
		push	385Eh
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh ; '.'
		push	ds
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_291F4
		add	sp, 2
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	si
		leave
		retf
sub_292FC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		push	0
		push	386Ah
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_293B4
		call	sub_4227E
		mov	[bp-2],	al
		mov	al, [bp-2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_291FC
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_293DB
		add	sp, 2

loc_293B4:				; CODE XREF: seg063:01A5j
		push	0
		push	385Eh
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_293D0
		push	si
		nop
		push	cs
		call	near ptr sub_29453
		add	sp, 2
		jmp	short loc_293D8
; ���������������������������������������������������������������������������

loc_293D0:				; CODE XREF: seg063:01D3j
		push	si
		push	cs
		call	near ptr sub_292FC
		add	sp, 2

loc_293D8:				; CODE XREF: seg063:01DEj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_293DB	proc far		; CODE XREF: seg063:01BEp

var_66		= word ptr -66h
var_9		= dword	ptr -9
var_5		= dword	ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_66], 556h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 693h
		push	0
		push	386Ah
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh ; '.'
		push	ds
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	si
		leave
		retf
sub_293DB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_29453	proc far		; CODE XREF: seg063:01D8p

var_66		= word ptr -66h
var_9		= dword	ptr -9
var_5		= dword	ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	386Ah
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_294DB
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_66], 556h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 693h
		push	1
		push	386Ah
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh ; '.'
		push	ds
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	short loc_294E6
; ���������������������������������������������������������������������������

loc_294DB:				; CODE XREF: sub_29453+19j
		push	9025h
		call	sub_30D3
		add	sp, 2

loc_294E6:				; CODE XREF: sub_29453+86j
		push	si
		push	cs
		call	near ptr sub_291F4
		add	sp, 2
		pop	si
		leave
		retf
sub_29453	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	0
		call	Music_Stop_28CDB
		add	sp, 2
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	word ptr [bp-6Ah], 556h
		mov	dword ptr [bp-9], 100h
		mov	dword ptr [bp-0Dh], 0
		mov	word ptr [bp-6Ah], 693h
		mov	word ptr [bp-2], 0
		jmp	loc_297C0
; ���������������������������������������������������������������������������

loc_2952F:				; CODE XREF: seg063:05D6j
		mov	al, [bp-2]
		push	ax
		call	sub_3F3A6
		add	sp, 2
		or	al, al
		jnz	short loc_29542
		jmp	loc_297BD
; ���������������������������������������������������������������������������

loc_29542:				; CODE XREF: seg063:034Dj
		mov	byte ptr [bp-3], 1
		jmp	loc_297B4
; ���������������������������������������������������������������������������

loc_29549:				; CODE XREF: seg063:05CAj
		mov	al, [bp-2]
		add	al, 41h	; 'A'
		mov	byte_4443F, al
		call	Joystick_InitCalibrationDefaults_3F3B6
		push	32h ; '2'
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	ax, [bp-2]
		shl	ax, 1
		add	ax, [bp-2]
		add	ax, 2Bh	; '+'
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	0A2h ; '�'
		push	32h ; '2'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short loc_29599
; ���������������������������������������������������������������������������

loc_29594:				; CODE XREF: seg063:03B9j
		call	Joystick_SampleAxesToTable_3F134

loc_29599:				; CODE XREF: seg063:03A2j
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_29594
		jmp	short loc_295B2
; ���������������������������������������������������������������������������

loc_295AD:				; CODE XREF: seg063:03D4j
		call	Joystick_SampleAxesToTable_3F134

loc_295B2:				; CODE XREF: seg063:03BBj
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_295AD
		push	word ptr [bp-2]
		call	sub_3F427
		add	sp, 2
		jmp	short loc_295D8
; ���������������������������������������������������������������������������

loc_295D3:				; CODE XREF: seg063:03F8j
		call	Joystick_SampleAxesToTable_3F134

loc_295D8:				; CODE XREF: seg063:03E1j
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_295D3
		push	32h ; '2'
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	ax, [bp-2]
		shl	ax, 1
		add	ax, [bp-2]
		add	ax, 2Ch	; ','
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	0A2h ; '�'
		push	2Dh ; '-'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short loc_2962D
; ���������������������������������������������������������������������������

loc_29628:				; CODE XREF: seg063:044Fj
		call	Joystick_SampleAxesToTable_3F134

loc_2962D:				; CODE XREF: seg063:0436j
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_29628
		push	word ptr [bp-2]
		call	Joystick_ComputeCalibrationRatio_3F463
		add	sp, 2
		jmp	short loc_29653
; ���������������������������������������������������������������������������

loc_2964E:				; CODE XREF: seg063:0473j
		call	Joystick_SampleAxesToTable_3F134

loc_29653:				; CODE XREF: seg063:045Cj
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_2964E
		push	32h ; '2'
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	ax, [bp-2]
		shl	ax, 1
		add	ax, [bp-2]
		add	ax, 2Dh	; '-'
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	0A2h ; '�'
		push	3Bh ; ';'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short loc_296A8
; ���������������������������������������������������������������������������

loc_296A3:				; CODE XREF: seg063:04CAj
		call	Joystick_SampleAxesToTable_3F134

loc_296A8:				; CODE XREF: seg063:04B1j
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_296A3
		push	word ptr [bp-2]
		call	sub_3F445
		add	sp, 2
		jmp	short loc_296CE
; ���������������������������������������������������������������������������

loc_296C9:				; CODE XREF: seg063:04EEj
		call	Joystick_SampleAxesToTable_3F134

loc_296CE:				; CODE XREF: seg063:04D7j
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		or	al, al
		jnz	short loc_296C9
		push	1Eh
		push	20h ; ' '
		push	20h ; ' '
		call	Joystick_InterpolateCalibrationPercent_3F4DC
		add	sp, 6
		cmp	word_497E4, 0
		jz	short loc_2970E
		cmp	word_497E8, 0
		jz	short loc_2970E
		cmp	word_497E6, 0
		jz	short loc_2970E
		cmp	word_497EA, 0
		jz	short loc_2970E
		mov	byte ptr [bp-3], 0

loc_2970E:				; CODE XREF: seg063:0503j seg063:050Aj ...
		mov	al, [bp-3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2974D
		push	0
		push	141Ch
		lea	ax, [bp-6Ah]
		push	ax
		mov	bx, [bp-6Ah]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h ; '"'
		push	ds
		push	offset word_497D4
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		jmp	short loc_297B4
; ���������������������������������������������������������������������������

loc_2974D:				; CODE XREF: seg063:0525j
		push	32h ; '2'
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	9Fh ; '�'
		push	11h
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	31h ; '1'
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	0A2h ; '�'
		push	1Fh
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		add	sp, 2
		push	32h ; '2'
		call	PIT_DelayLoop
		add	sp, 2
		call	sub_1C83
		jmp	short loc_297A0
; ���������������������������������������������������������������������������

loc_2979B:				; CODE XREF: seg063:05C2j
		call	Joystick_SampleAxesToTable_3F134

loc_297A0:				; CODE XREF: seg063:05A9j
		push	3
		mov	al, [bp-2]
		push	ax
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_2979B

loc_297B4:				; CODE XREF: seg063:0356j seg063:055Bj
		cmp	byte ptr [bp-3], 0
		jz	short loc_297BD
		jmp	loc_29549
; ���������������������������������������������������������������������������

loc_297BD:				; CODE XREF: seg063:034Fj seg063:05C8j
		inc	word ptr [bp-2]

loc_297C0:				; CODE XREF: seg063:033Cj
		cmp	word ptr [bp-2], 1
		jge	short loc_297C9
		jmp	loc_2952F
; ���������������������������������������������������������������������������

loc_297C9:				; CODE XREF: seg063:05D4j
		push	0
		call	Joystick_UpdateCalibration_3F331
		add	sp, 2
		call	sub_28CF7
		push	0
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_297F0:				; DATA XREF: dseg:5934o
		push	bp
		mov	bp, sp
		mov	dword_4957A, 0
		mov	byte_4957E, 2
		mov	byte_4957F, 0
		mov	dword_49580, 0
		mov	dword_49584, 0
		mov	byte_49588, 2
		mov	byte_49589, 0
		mov	dword_4958A, 0
		mov	dword_4958E, 0
		mov	byte_49592, 2
		mov	byte_49593, 0
		mov	dword_49594, 0
		mov	dword_49598, 0
		mov	byte_4959C, 2
		mov	byte_4959D, 0
		mov	dword_4959E, 0
		mov	dword_495A2, 0
		mov	byte_495A6, 2
		mov	byte_495A7, 0
		mov	dword_495A8, 0
		mov	dword_495AC, 0
		mov	byte_495B0, 2
		mov	byte_495B1, 0
		mov	dword_495B2, 0
		mov	dword_495B6, 0
		mov	byte_495BA, 2
		mov	byte_495BB, 0
		mov	dword_495BC, 0
		mov	dword_495C0, 0
		mov	byte_495C4, 2
		mov	byte_495C5, 0
		mov	dword_495C6, 0
		mov	word_495CD, 0
		mov	byte_495CB, 1
		mov	byte_495CC, 1
		mov	byte_495CF, 1
		mov	byte_495D0, 1
		mov	byte_495D1, 1
		mov	byte_495D2, 1
		mov	byte_495D3, 1
		mov	byte_495D4, 1
		mov	byte_495D5, 1
		mov	word_495D6, 4
		mov	word_495D8, 2
		mov	word_495DA, 2
		mov	word_495DC, 2
		mov	byte_495DE, 1
		mov	byte_495DF, 0
		mov	byte_495E0, 1
		mov	byte_495E1, 0
		mov	byte_495E2, 0
		mov	byte_495E3, 0
		mov	byte_495E4, 0
		mov	byte_495E7, 0
		mov	byte_495E5, 0
		mov	byte_495E6, 0
		mov	byte_495E8, 0
		mov	word_495E9, 0
		mov	byte_495EB, 1
		mov	byte_495EC, 1
		mov	byte_495ED, 0
		mov	byte_495EE, 1
		mov	byte_495EF, 1
		mov	byte_495F0, 0
		mov	byte_495F1, 0
		mov	byte_495F2, 0
		mov	byte_495F3, 1
		mov	byte_495F4, 1
		mov	byte_495F5, 0
		mov	byte_495F6, 0
		mov	byte_495F7, 0
		mov	byte_495F8, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_299A3:				; DATA XREF: dseg:59D0o
		push	bp
		mov	bp, sp
		cmp	byte_495C5, 0
		jz	short loc_299CB
		cmp	dword_495C0, 0
		jz	short loc_299CB
		push	0
		mov	al, byte_495C4
		push	ax
		push	65A0h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_299CB:				; CODE XREF: seg063:07BBj seg063:07C3j
		mov	dword_495C0, 0
		mov	byte_495C5, 0
		mov	dword_495C6, 0
		cmp	byte_495BB, 0
		jz	short loc_29A07
		cmp	dword_495B6, 0
		jz	short loc_29A07
		push	0
		mov	al, byte_495BA
		push	ax
		push	6596h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29A07:				; CODE XREF: seg063:07F7j seg063:07FFj
		mov	dword_495B6, 0
		mov	byte_495BB, 0
		mov	dword_495BC, 0
		cmp	byte_495B1, 0
		jz	short loc_29A43
		cmp	dword_495AC, 0
		jz	short loc_29A43
		push	0
		mov	al, byte_495B0
		push	ax
		push	658Ch
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29A43:				; CODE XREF: seg063:0833j seg063:083Bj
		mov	dword_495AC, 0
		mov	byte_495B1, 0
		mov	dword_495B2, 0
		cmp	byte_495A7, 0
		jz	short loc_29A7F
		cmp	dword_495A2, 0
		jz	short loc_29A7F
		push	0
		mov	al, byte_495A6
		push	ax
		push	6582h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29A7F:				; CODE XREF: seg063:086Fj seg063:0877j
		mov	dword_495A2, 0
		mov	byte_495A7, 0
		mov	dword_495A8, 0
		cmp	byte_4959D, 0
		jz	short loc_29ABB
		cmp	dword_49598, 0
		jz	short loc_29ABB
		push	0
		mov	al, byte_4959C
		push	ax
		push	6578h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29ABB:				; CODE XREF: seg063:08ABj seg063:08B3j
		mov	dword_49598, 0
		mov	byte_4959D, 0
		mov	dword_4959E, 0
		cmp	byte_49593, 0
		jz	short loc_29AF7
		cmp	dword_4958E, 0
		jz	short loc_29AF7
		push	0
		mov	al, byte_49592
		push	ax
		push	656Eh
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29AF7:				; CODE XREF: seg063:08E7j seg063:08EFj
		mov	dword_4958E, 0
		mov	byte_49593, 0
		mov	dword_49594, 0
		cmp	byte_49589, 0
		jz	short loc_29B33
		cmp	dword_49584, 0
		jz	short loc_29B33
		push	0
		mov	al, byte_49588
		push	ax
		push	6564h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29B33:				; CODE XREF: seg063:0923j seg063:092Bj
		mov	dword_49584, 0
		mov	byte_49589, 0
		mov	dword_4958A, 0
		cmp	byte_4957F, 0
		jz	short loc_29B6F
		cmp	dword_4957A, 0
		jz	short loc_29B6F
		push	0
		mov	al, byte_4957E
		push	ax
		push	655Ah
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29B6F:				; CODE XREF: seg063:095Fj seg063:0967j
		mov	dword_4957A, 0
		mov	byte_4957F, 0
		mov	dword_49580, 0
		pop	bp
		retf
seg063		ends
