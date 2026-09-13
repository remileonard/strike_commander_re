ovr266		segment	para public 'OVERLAY' use16
		assume cs:ovr266
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 232 lignes, NON DÉTAILLÉE — combine Joystick_GetButtonRawByte_67B82 (×2, seg208),
; allocateur typé, Mouse_InitAndRead — lecture combinée des contrôles cockpit.
; ==============================================================================================
Cockpit_ReadControlsFrame_8F720	proc far		; CODE XREF: VROOMM_StubThunk_6B7ADJ Config_ReadSettingsField_8FBE7+65p	...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+60h], 1
		jnz	short loc_8F73E
		mov	al, byte_72E6C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F73E
		mov	word ptr [si+60h], 0

loc_8F73E:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+Ej
					; Cockpit_ReadControlsFrame_8F720+17j
		cmp	word ptr [si+60h], 2
		jz	short loc_8F750
		cmp	word ptr [si+60h], 4
		jz	short loc_8F750
		cmp	word ptr [si+60h], 3
		jnz	short loc_8F763

loc_8F750:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+22j
					; Cockpit_ReadControlsFrame_8F720+28j
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F763
		mov	word ptr [si+60h], 0

loc_8F763:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+2Ej
					; Cockpit_ReadControlsFrame_8F720+3Cj
		cmp	word ptr [si+62h], 1
		jnz	short loc_8F777
		mov	al, byte_72E6C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F777
		mov	word ptr [si+62h], 0

loc_8F777:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+47j
					; Cockpit_ReadControlsFrame_8F720+50j
		cmp	word ptr [si+62h], 2
		jnz	short loc_8F790
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F790
		mov	word ptr [si+62h], 0

loc_8F790:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+5Bj
					; Cockpit_ReadControlsFrame_8F720+69j
		cmp	byte ptr [si+79h], 0
		jz	short loc_8F7B5
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, 0A000h
		jge	short loc_8F7B5

loc_8F7B1:
		mov	byte ptr [si+79h], 0

loc_8F7B5:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+74j
					; Cockpit_ReadControlsFrame_8F720+8Fj
		cmp	word ptr [si+62h], 4
		jnz	short loc_8F7C0
		call	VROOMM_StubThunk_6B759

loc_8F7C0:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+99j
		cmp	word ptr [si+60h], 1
		jz	short loc_8F7CC
		cmp	word ptr [si+62h], 1
		jnz	short loc_8F7D1

loc_8F7CC:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+A4j
		call	Mouse_InitAndRead

loc_8F7D1:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+AAj
		mov	al, [si+51h]
		mov	byte_6E682, al
		mov	al, [si+52h]
		mov	byte_6E683, al
		mov	al, [si+53h]
		mov	byte_6E8CE, al
		cmp	byte_6EA6C, 0
		jz	short loc_8F7F2
		mov	al, [si+56h]
		mov	byte_6EB1C, al
		jmp	short loc_8F7F7
; ���������������������������������������������������������������������������

loc_8F7F2:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+C8j
		mov	byte_6EB1C, 0

loc_8F7F7:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+D0j
		mov	al, [si+5Ah]
		mov	byte_6EB21, al
		mov	al, [si+55h]
		mov	byte_6EB1D, al
		mov	al, [si+57h]
		mov	byte_6EB1F, al
		mov	al, [si+58h]
		mov	byte_6EB20, al
		mov	al, [si+59h]
		mov	byte_6EB1E, al
		mov	al, [si+5Bh]
		mov	byte_6EA14, al
		mov	ax, [si+5Ch]
		add	ax, 0Bh
		push	ax
		push	word_70474
		call	Terrain_NotifyAdjacentPatches
		add	sp, 4
		mov	bx, [si+60h]
		cmp	bx, 4		; switch 5 cases
		ja	short loc_8F869	; default
		shl	bx, 1
		jmp	cs:off_8F8F6[bx] ; switch jump

loc_8F83D:				; DATA XREF: ovr266:off_8F8F6o
		mov	byte_6D460, 0	; case 0x1
		mov	byte_6D461, 1
		jmp	short loc_8F864
; ���������������������������������������������������������������������������

loc_8F849:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+118j
					; DATA XREF: ovr266:off_8F8F6o
		mov	byte_6D460, 0	; case 0x0
		mov	byte_6D461, 0
		mov	byte_6D462, 1
		jmp	short loc_8F869	; default
; ���������������������������������������������������������������������������

loc_8F85A:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+118j
					; DATA XREF: ovr266:off_8F8F6o
		mov	byte_6D460, 1	; case 0x2
		mov	byte_6D461, 0

loc_8F864:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+127j
		mov	byte_6D462, 0

loc_8F869:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+114j
					; Cockpit_ReadControlsFrame_8F720+138j
		cmp	byte ptr [si+6Bh], 0 ; default
		jz	short loc_8F87C
		mov	al, [si+6Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F87C
		mov	byte ptr [si+6Ch], 1

loc_8F87C:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+14Dj
					; Cockpit_ReadControlsFrame_8F720+156j
		mov	al, [si+77h]
		mov	byte_72A93, al
		mov	al, [si+78h]
		mov	byte_72A92, al
		cmp	word_722E6, 0
		jz	short loc_8F89F
		mov	bx, word_722E6
		push	large dword ptr	[bx+5Ah]
		call	VROOMM_StubThunk_6C42A
		add	sp, 4

loc_8F89F:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+16Dj
		mov	[bp+var_2], 0
		jmp	short loc_8F8E0
; ���������������������������������������������������������������������������

loc_8F8A6:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+1D1j
		mov	si, [bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx

loc_8F8B1:
		jz	short loc_8F8BC
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_8F8BE
; ���������������������������������������������������������������������������

loc_8F8BC:				; CODE XREF: Cockpit_ReadControlsFrame_8F720:loc_8F8B1j
		mov	al, 17h

loc_8F8BE:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+19Aj
		cmp	al, 6
		jnz	short loc_8F8E0
		cmp	byte ptr [si+50h], 0FFh
		jnz	short loc_8F8E0
		mov	[bp+var_4], si
		mov	bx, [bp+var_4]
		mov	ax, [bx+55h]
		add	ax, 1Ah
		push	word ptr [bx+57h]
		push	ax
		call	PilotProfile_RescaleSkillByDifficulty_12FC9
		add	sp, 4

loc_8F8E0:				; CODE XREF: Cockpit_ReadControlsFrame_8F720+184j
					; Cockpit_ReadControlsFrame_8F720+1A0j ...
		lea	ax, [bp+var_2]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_8F8A6
		pop	si
		leave
		retf
Cockpit_ReadControlsFrame_8F720	endp

; ���������������������������������������������������������������������������
off_8F8F6	dw offset loc_8F849	; DATA XREF: Cockpit_ReadControlsFrame_8F720+118r
		dw offset loc_8F83D	; jump table for switch	statement
		dw offset loc_8F85A
		dw offset loc_8F85A
		dw offset loc_8F85A

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 150 lignes, NON DÉTAILLÉE — variante de Cockpit_ReadControlsFrame_8F720 (3 lectures
; de bouton).
; ==============================================================================================
Cockpit_ReadControlsFrameB_8F900	proc far		; CODE XREF: VROOMM_StubThunk_6B7A8J CRT_DisplayCalibrationMessage_8FC61+26p

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+60h], 1
		jnz	short loc_8F91B
		mov	al, byte_72E6C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F91B
		mov	word ptr [si+60h], 0

loc_8F91B:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+Bj
					; Cockpit_ReadControlsFrameB_8F900+14j
		cmp	word ptr [si+60h], 2
		jz	short loc_8F927
		cmp	word ptr [si+60h], 4
		jnz	short loc_8F93A

loc_8F927:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+1Fj
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F93A
		mov	word ptr [si+60h], 0

loc_8F93A:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+25j
					; Cockpit_ReadControlsFrameB_8F900+33j
		cmp	word ptr [si+62h], 1
		jnz	short loc_8F94E
		mov	al, byte_72E6C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F94E
		mov	word ptr [si+62h], 0

loc_8F94E:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+3Ej
					; Cockpit_ReadControlsFrameB_8F900+47j
		cmp	word ptr [si+62h], 2
		jnz	short loc_8F967
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F967
		mov	word ptr [si+62h], 0

loc_8F967:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+52j
					; Cockpit_ReadControlsFrameB_8F900+60j
		cmp	word ptr [si+62h], 4
		jz	short loc_8F973
		cmp	word ptr [si+62h], 3
		jnz	short loc_8F986

loc_8F973:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+6Bj
		push	1
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F986
		mov	word ptr [si+62h], 0

loc_8F986:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+71j
					; Cockpit_ReadControlsFrameB_8F900+7Fj
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8F9ED
		cmp	ax, 1
		jz	short loc_8F9C5
		cmp	ax, 2
		jnz	short loc_8FA17
		mov	byte ptr [si+55h], 0
		mov	byte ptr [si+56h], 0
		mov	byte ptr [si+57h], 0
		mov	byte ptr [si+58h], 0
		mov	byte ptr [si+59h], 0
		mov	byte ptr [si+5Ah], 0

loc_8F9B1:
		mov	byte ptr [si+5Bh], 0
		mov	word ptr [si+5Ch], 0
		mov	word ptr [si+5Eh], 0

loc_8F9BF:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+EBj
		mov	byte ptr [si+79h], 0

loc_8F9C3:
		jmp	short loc_8FA17
; ���������������������������������������������������������������������������

loc_8F9C5:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+92j
		mov	byte ptr [si+55h], 1
		mov	byte ptr [si+56h], 0
		mov	byte ptr [si+57h], 0
		mov	byte ptr [si+58h], 1
		mov	byte ptr [si+59h], 0
		mov	byte ptr [si+5Ah], 1
		mov	byte ptr [si+5Bh], 0
		mov	word ptr [si+5Ch], 2
		mov	word ptr [si+5Eh], 1
		jmp	short loc_8F9BF
; ���������������������������������������������������������������������������

loc_8F9ED:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+8Dj
		mov	byte ptr [si+55h], 1
		mov	byte ptr [si+56h], 1
		mov	byte ptr [si+57h], 1
		mov	byte ptr [si+58h], 1
		mov	byte ptr [si+59h], 1
		mov	byte ptr [si+5Ah], 1
		mov	byte ptr [si+5Bh], 1
		mov	word ptr [si+5Ch], 4
		mov	word ptr [si+5Eh], 2
		mov	byte ptr [si+79h], 1

loc_8FA17:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+97j
					; Cockpit_ReadControlsFrameB_8F900:loc_8F9C3j
		mov	byte ptr [si+51h], 1
		mov	byte ptr [si+52h], 1
		mov	word ptr [si+53h], 0
		cmp	byte ptr [si+79h], 0
		jz	short loc_8FA49
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, 0A000h
		jge	short loc_8FA49
		mov	byte ptr [si+79h], 0

loc_8FA49:				; CODE XREF: Cockpit_ReadControlsFrameB_8F900+128j
					; Cockpit_ReadControlsFrameB_8F900+143j
		pop	si
		pop	bp
		retf
Cockpit_ReadControlsFrameB_8F900	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 118 lignes, NON DÉTAILLÉE — combine UI_ApplyEncodingHelper_5E576 (seg143),
; Render_MeasureOrDrawTextString_61F52 (seg174, ×2).
; ==============================================================================================
Cockpit_DrawEncodedText_8FA4C	proc far		; CODE XREF: VROOMM_StubThunk_6B785J ResourceFile_LoadTypeA_90097+77Fp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_8FA69
		mov	ax, 1
		jmp	short loc_8FA6B
; ���������������������������������������������������������������������������

loc_8FA69:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+16j
		xor	ax, ax

loc_8FA6B:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+1Bj
		or	ax, ax
		jz	short loc_8FA9D
		xor	dx, dx
		mov	cl, 2
		mov	ch, 1
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		mov	dx, word_721F3
		mov	cx, 1
		mov	bx, 4D55h
		mov	ax, 1209h
		int	15h
		or	ax, ax
		jz	short loc_8FA9B
		push	0EEE2h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short loc_8FAAC
; ���������������������������������������������������������������������������

loc_8FA9B:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+42j
		jmp	short loc_8FAAC
; ���������������������������������������������������������������������������

loc_8FA9D:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+21j
		push	word_70E62
		push	5196h
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4

loc_8FAAC:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+4Dj
					; Cockpit_DrawEncodedText_8FA4C:loc_8FA9Bj
		cmp	[bp+arg_A], 0
		jz	short loc_8FACA

loc_8FAB2:
		push	0
		push	large [bp+arg_4]

loc_8FAB8:
		push	large 40005h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_8FACA:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+64j
		push	[bp+arg_8]
		push	large [bp+arg_4]
		push	large 270005h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	byte_721F0, 2
		jnz	short loc_8FAEF
		mov	ax, 1
		jmp	short loc_8FAF1
; ���������������������������������������������������������������������������

loc_8FAEF:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+9Cj
		xor	ax, ax

loc_8FAF1:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+A1j
		or	ax, ax
		jz	short loc_8FB20
		xor	dx, dx
		mov	cl, 1
		mov	ch, 0
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		mov	dx, word_721F3
		xor	cx, cx
		mov	bx, 4D55h
		mov	ax, 1209h
		int	15h
		or	ax, ax
		jz	short loc_8FB20
		push	0EEE2h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short $+2

loc_8FB20:				; CODE XREF: Cockpit_DrawEncodedText_8FA4C+A7j
					; Cockpit_DrawEncodedText_8FA4C+C7j
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	si
		pop	bp
		retf
Cockpit_DrawEncodedText_8FA4C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle UI_ApplyEncodingHelper_5E576.
; ==============================================================================================
Cockpit_ApplyEncodingWrapper_8FB2A	proc far		; CODE XREF: VROOMM_StubThunk_6B78AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_721F0, 2
		jnz	short loc_8FB3D
		mov	ax, 1
		jmp	short loc_8FB3F
; ���������������������������������������������������������������������������

loc_8FB3D:				; CODE XREF: Cockpit_ApplyEncodingWrapper_8FB2A+Cj
		xor	ax, ax

loc_8FB3F:				; CODE XREF: Cockpit_ApplyEncodingWrapper_8FB2A+11j
		or	ax, ax
		jz	short loc_8FB61
		xor	dx, dx
		mov	cl, 2
		mov	ch, 0
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		xor	dx, dx
		mov	cl, 2
		mov	ch, 1
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		jmp	short loc_8FB70
; ���������������������������������������������������������������������������

loc_8FB61:				; CODE XREF: Cockpit_ApplyEncodingWrapper_8FB2A+17j
		push	word_70E62
		push	5196h
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4

loc_8FB70:				; CODE XREF: Cockpit_ApplyEncodingWrapper_8FB2A+35j
		pop	si
		pop	bp
		retf
Cockpit_ApplyEncodingWrapper_8FB2A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, construit un StreamReader et écrit un champ typé (StreamReader_WriteTyped_6568F,
; seg195).
; ==============================================================================================
Config_WriteSettingsField_8FB73	proc far		; CODE XREF: VROOMM_StubThunk_6B78FJ

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
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_66], 2C8h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 138Ah
		push	0
		push	145Ah
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
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
Config_WriteSettingsField_8FB73	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, construit un StreamReader et lit un champ typé (StreamReader_ReadTyped_63FA1, seg190).
; ==============================================================================================
Config_ReadSettingsField_8FBE7	proc far		; CODE XREF: VROOMM_StubThunk_6B799J CRT_DisplayCalibrationMessage_8FC61+4Ep

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
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_66], 2C8h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 138Ah
		push	1
		push	145Ah
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
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	si
		push	cs
		call	near ptr Cockpit_ReadControlsFrame_8F720
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
Config_ReadSettingsField_8FBE7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine CRT_Write_TextMode et CPU_SpeedCalibration — affichage lié à la calibration de
; vitesse CPU (cf. joystick, seg199).
; ==============================================================================================
CRT_DisplayCalibrationMessage_8FC61	proc far		; CODE XREF: VROOMM_StubThunk_6B7A3J

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	1466h
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_8FC94
		call	CPU_SpeedCalibration
		mov	[bp+var_2], al
		push	ax
		push	si
		push	cs
		call	near ptr Cockpit_ReadControlsFrameB_8F900
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr Config_WriteSettingsFieldB_8FCB6
		pop	cx

loc_8FC94:				; CODE XREF: CRT_DisplayCalibrationMessage_8FC61+19j
		push	0
		push	145Ah
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_8FCAD
		push	si
		nop
		push	cs
		call	near ptr Config_ReadSettingsFieldWithMessage_8FD2A
		jmp	short loc_8FCB2
; ���������������������������������������������������������������������������

loc_8FCAD:				; CODE XREF: CRT_DisplayCalibrationMessage_8FC61+42j
		push	si
		push	cs
		call	near ptr Config_ReadSettingsField_8FBE7

loc_8FCB2:				; CODE XREF: CRT_DisplayCalibrationMessage_8FC61+4Aj
		pop	cx
		pop	si
		leave
		retf
CRT_DisplayCalibrationMessage_8FC61	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Config_WriteSettingsField_8FB73.
; ==============================================================================================
Config_WriteSettingsFieldB_8FCB6	proc far		; CODE XREF: VROOMM_StubThunk_6B794J CRT_DisplayCalibrationMessage_8FC61+2Fp

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
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_66], 2C8h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 138Ah
		push	0
		push	1466h
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
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
Config_WriteSettingsFieldB_8FCB6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine CRT_Write_TextMode et lecture de champ typé.
; ==============================================================================================
Config_ReadSettingsFieldWithMessage_8FD2A	proc far		; CODE XREF: VROOMM_StubThunk_6B79EJ CRT_DisplayCalibrationMessage_8FC61+47p

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
		push	1466h
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_8FDAE
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_66], 2C8h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 138Ah
		push	1
		push	1466h
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
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		jmp	short loc_8FDB7
; ���������������������������������������������������������������������������

loc_8FDAE:				; CODE XREF: Config_ReadSettingsFieldWithMessage_8FD2A+19j
		push	9025h

loc_8FDB1:
		call	VROOMM_StubThunk_6B70F

loc_8FDB6:
		pop	cx

loc_8FDB7:				; CODE XREF: Config_ReadSettingsFieldWithMessage_8FD2A+82j
		push	si
		push	cs
		call	near ptr Cockpit_ReadControlsFrame_8F720
		pop	cx
		pop	si
		leave
		retf
Config_ReadSettingsFieldWithMessage_8FD2A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 322 lignes, NON DÉTAILLÉE — combine Widget_Helper_5A9E6 (seg125), StreamReader,
; Joystick_GetButtonRawByte_67B82/InitCalibrationDefaults_67B92 (seg208),
; Render_MeasureOrDrawTextString_61F52.
; ==============================================================================================
Cockpit_LoadAndDrawCalibration_8FDC0	proc far		; CODE XREF: VROOMM_StubThunk_6B7B7J ResourceFile_LoadTypeA_90097+7C8p

var_6A		= word ptr -6Ah
var_D		= dword	ptr -0Dh
var_9		= dword	ptr -9
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	0
		call	Widget_Helper_5A9E6
		pop	cx
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_6A], 2C8h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 138Ah
		mov	[bp+var_2], 0
		jmp	loc_90071
; ���������������������������������������������������������������������������

loc_8FDFA:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+2B7j
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jnz	short loc_8FE0B
		jmp	loc_9006E
; ���������������������������������������������������������������������������

loc_8FE0B:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+46j
		mov	[bp+var_3], 1
		jmp	loc_90065
; ���������������������������������������������������������������������������

loc_8FE12:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+2ABj
		mov	al, byte ptr [bp+var_2]
		add	al, 41h	; 'A'
		mov	byte_6E48B, al
		call	Joystick_InitCalibrationDefaults_67B92
		push	32h ; '2'
		push	large [bp+arg_0]
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	ax, [bp+var_2]
		imul	ax, 3
		add	ax, 2Bh	; '+'
		push	ax
		push	large [bp+arg_0]
		push	large 0A20032h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_8FE5E
; ���������������������������������������������������������������������������

loc_8FE59:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+AEj
		call	Joystick_SampleAxesToTable_67910

loc_8FE5E:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+97j
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_8FE59
		jmp	short loc_8FE77
; ���������������������������������������������������������������������������

loc_8FE72:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+C9j
		call	Joystick_SampleAxesToTable_67910

loc_8FE77:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+B0j
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_8FE72
		push	[bp+var_2]
		call	Joystick_LoadCalibrationSample_67C03
		pop	cx
		jmp	short loc_8FE9B
; ���������������������������������������������������������������������������

loc_8FE96:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+EBj
		call	Joystick_SampleAxesToTable_67910

loc_8FE9B:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+D4j
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_8FE96
		push	32h ; '2'
		push	large [bp+arg_0]
		push	large 9F0011h
		push	word_70E62

loc_8FEBD:
		call	Render_MeasureOrDrawTextString_61F52

loc_8FEC2:
		add	sp, 0Ch
		mov	ax, [bp+var_2]

loc_8FEC8:
		imul	ax, 3
		add	ax, 2Ch	; ','
		push	ax
		push	large [bp+arg_0]
		push	large 0A2002Dh
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_8FEEC
; ���������������������������������������������������������������������������

loc_8FEE7:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+13Ej
		call	Joystick_SampleAxesToTable_67910

loc_8FEEC:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+125j
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_8FEE7
		push	[bp+var_2]
		call	Joystick_ComputeCalibrationRatio_67C3F
		pop	cx
		jmp	short loc_8FF10
; ���������������������������������������������������������������������������

loc_8FF0B:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+160j
		call	Joystick_SampleAxesToTable_67910

loc_8FF10:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+149j
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_8FF0B
		push	32h ; '2'
		push	large [bp+arg_0]
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	ax, [bp+var_2]
		imul	ax, 3
		add	ax, 2Dh	; '-'
		push	ax
		push	large [bp+arg_0]
		push	large 0A2003Bh
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_8FF61
; ���������������������������������������������������������������������������

loc_8FF5C:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+1B3j
		call	Joystick_SampleAxesToTable_67910

loc_8FF61:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+19Aj
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_8FF5C
		push	[bp+var_2]
		call	Joystick_LoadCalibrationExtremes_67C21
		pop	cx
		jmp	short loc_8FF85
; ���������������������������������������������������������������������������

loc_8FF80:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+1D5j
		call	Joystick_SampleAxesToTable_67910

loc_8FF85:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+1BEj
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_8FF80
		push	large 1E0020h
		push	20h ; ' '
		call	Joystick_InterpolateCalibrationPercent_67CB8
		add	sp, 6
		cmp	word_72E94, 0
		jz	short loc_8FFC7
		cmp	word_72E98, 0
		jz	short loc_8FFC7

loc_8FFB5:
		cmp	word_72E96, 0
		jz	short loc_8FFC7

loc_8FFBC:
		cmp	word_72E9A, 0

loc_8FFC1:
		jz	short loc_8FFC7
		mov	[bp+var_3], 0

loc_8FFC7:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+1ECj
					; Cockpit_LoadAndDrawCalibration_8FDC0+1F3j ...
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90004
		push	0
		push	13D8h
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h ; '"'
		push	ds
		push	offset word_72E84
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		jmp	short loc_90065
; ���������������������������������������������������������������������������

loc_90004:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+20Ej
		push	32h ; '2'
		push	large [bp+arg_0]
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	31h ; '1'
		push	large [bp+arg_0]
		push	large 0A2001Fh
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		pop	cx
		push	32h ; '2'
		call	PIT_DelayLoop
		pop	cx
		call	PC_SoundOff
		jmp	short loc_90051
; ���������������������������������������������������������������������������

loc_9004C:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+2A3j
		call	Joystick_SampleAxesToTable_67910

loc_90051:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+28Aj
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_9004C

loc_90065:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+4Fj
					; Cockpit_LoadAndDrawCalibration_8FDC0+242j
		cmp	[bp+var_3], 0
		jz	short loc_9006E
		jmp	loc_8FE12
; ���������������������������������������������������������������������������

loc_9006E:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+48j
					; Cockpit_LoadAndDrawCalibration_8FDC0+2A9j
		inc	[bp+var_2]

loc_90071:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+37j
		cmp	[bp+var_2], 1
		jge	short loc_9007A
		jmp	loc_8FDFA
; ���������������������������������������������������������������������������

loc_9007A:				; CODE XREF: Cockpit_LoadAndDrawCalibration_8FDC0+2B5j
		push	0
		call	Joystick_UpdateCalibration_67B0D
		pop	cx
		call	Weapon_HUDBox_InstantiateInstance_5AA02
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		leave
		retf
Cockpit_LoadAndDrawCalibration_8FDC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 809 lignes, NON DÉTAILLÉE — premier d'une famille de grosses fonctions de
; chargement de fichier ressource quasi identiques dans leur ouverture (Path_ResolveDataFile,
; StreamReader_ConstructVariantA_63A39, GetCapacity_64062) — voir aussi ovr267-269. Candidat
; pour session dédiée.
; ==============================================================================================
ResourceFile_LoadTypeA_90097	proc far		; CODE XREF: VROOMM_StubThunk_6B7B2J

var_19A		= word ptr -19Ah
var_13D		= dword	ptr -13Dh
var_139		= dword	ptr -139h
var_134		= word ptr -134h
var_E4		= word ptr -0E4h
var_BE		= word ptr -0BEh
var_AF		= word ptr -0AFh
var_95		= byte ptr -95h
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_69		= byte ptr -69h
var_68		= dword	ptr -68h
var_64		= word ptr -64h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_53		= byte ptr -53h
var_52		= dword	ptr -52h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_47		= byte ptr -47h
var_46		= dword	ptr -46h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3D		= byte ptr -3Dh
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_33		= byte ptr -33h
var_32		= dword	ptr -32h
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

		push	bp
		mov	bp, sp
		sub	sp, 19Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_shp_4	; ".shp"
		push	ds
		push	offset aFlitopt	; "flitopt"
		push	ds
		push	offset aFonts_0	; "FONTS"

loc_900AF:
		lea	ax, [bp+var_134]

loc_900B3:
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh

loc_900BC:
		lea	ax, [bp+var_19A]

loc_900C0:
		push	ax

loc_900C1:
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_19A], 2C8h
		mov	[bp+var_139], 100h
		mov	[bp+var_13D], 0
		mov	[bp+var_19A], 138Ah
		push	1
		lea	ax, [bp+var_134]
		push	ax
		lea	ax, [bp+var_19A]
		push	ax
		mov	bx, [bp+var_19A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_19A]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6E], eax
		mov	[bp+var_72], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_76+2],	dx
		mov	word ptr [bp+var_76], ax
		mov	eax, [bp+var_76]
		mov	[si+14h], eax
		mov	byte ptr [si+18h], 3
		mov	byte ptr [si+19h], 1
		mov	dword ptr [si+1Ah], 0
		mov	eax, [bp+var_72]
		mov	[si+1Ah], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_6E]
		push	0
		mov	al, [si+18h]
		push	ax
		push	large dword ptr	[si+14h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_19A]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_19A]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_19A]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	di, 4
		mov	[bp+var_6], 5
		mov	[bp+var_8], 7
		mov	[bp+var_A], 8
		mov	[bp+var_C], 0Ah
		mov	[bp+var_E], 0Bh
		mov	[bp+var_10], 0Fh
		mov	[bp+var_12], 10h

loc_901C0:
		mov	[bp+var_14], 12h
		mov	[bp+var_16], 13h
		mov	[bp+var_18], 15h
		mov	[bp+var_1A], 16h
		mov	[bp+var_1C], 18h
		mov	[bp+var_1E], 19h
		mov	[bp+var_20], 21h ; '!'
		mov	[bp+var_22], 22h ; '"'
		mov	[bp+var_24], 28h ; '('
		mov	[bp+var_26], 29h ; ')'
		mov	[bp+var_28], 33h ; '3'
		mov	[bp+var_2A], 34h ; '4'
		mov	al, byte_72E6C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90216
		mov	ax, 11h
		mov	[bp+var_12], ax
		mov	[bp+var_10], ax
		mov	ax, 6
		mov	[bp+var_6], ax
		mov	di, ax

loc_90216:				; CODE XREF: ResourceFile_LoadTypeA_90097+16Cj
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90263
		mov	ax, 9
		mov	[bp+var_A], ax
		mov	[bp+var_8], ax
		mov	ax, 0Ch
		mov	[bp+var_E], ax
		mov	[bp+var_C], ax
		mov	ax, 35h	; '5'
		mov	[bp+var_2A], ax
		mov	[bp+var_28], ax
		mov	ax, 14h
		mov	[bp+var_16], ax
		mov	[bp+var_14], ax
		mov	ax, 17h
		mov	[bp+var_1A], ax
		mov	[bp+var_18], ax
		mov	ax, 2Ah	; '*'
		mov	[bp+var_26], ax
		mov	[bp+var_24], ax
		mov	ax, 1Ah
		mov	[bp+var_1E], ax
		mov	[bp+var_1C], ax

loc_90263:				; CODE XREF: ResourceFile_LoadTypeA_90097+18Bj
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_AF], 0
		jnz	short loc_90287
		mov	[bp+var_95], 0
		jmp	short $+2

loc_90287:				; CODE XREF: ResourceFile_LoadTypeA_90097+1E7j
		push	large 0
		push	[bp+var_E]
		push	[bp+var_C]
		push	large 0B0059h
		push	large 340000h
		push	0
		push	[bp+var_2A]
		push	[bp+var_28]
		push	large 0B0059h
		push	large 270000h
		push	0
		push	[bp+var_A]
		push	[bp+var_8]
		push	large 0B0059h
		push	large 1A0000h
		push	0
		push	[bp+var_6]
		push	di
		push	large 0B0059h
		push	large 0D0000h
		push	large 3
		push	large 2000Bh
		push	large 590000h
		push	large 5
		mov	ax, si
		add	ax, 60h	; '`'
		push	ax
		mov	ax, si
		add	ax, 14h
		push	ax
		push	large 410059h
		push	large 420011h
		push	0
		call	VROOMM_StubThunk_6C9F0
		add	sp, 56h
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_2C], ax
		mov	ax, si
		add	ax, 64h	; 'd'
		mov	[bp+var_2E], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_903B0
		push	large 0B004Ch
		push	large 770079h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[bp+var_32], eax
		mov	al, [bx+4]
		mov	[bp+var_33], al
		mov	eax, [bp+var_32]
		mov	[di+20h], eax
		mov	al, [bp+var_33]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 24h ; '$'
		mov	word ptr [di+2Ch], 25h ; '%'
		mov	ax, [bp+var_2E]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_903B2
; ���������������������������������������������������������������������������

loc_903B0:				; CODE XREF: ResourceFile_LoadTypeA_90097+29Fj
		mov	ax, di

loc_903B2:				; CODE XREF: ResourceFile_LoadTypeA_90097+317j
		push	ax

loc_903B3:
		lea	ax, [bp+var_E4]

loc_903B7:
		push	ax

loc_903B8:
		call	VROOMM_StubThunk_6C95A

loc_903BD:
		add	sp, 6
		push	0
		mov	ax, si

loc_903C4:
		add	ax, 14h
		mov	[bp+var_36], ax
		mov	ax, si
		add	ax, 65h	; 'e'
		mov	[bp+var_38], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_90458
		push	large 11004Ch
		push	large 510079h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_36]
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	al, [bx+4]
		mov	[bp+var_3D], al
		mov	eax, [bp+var_3C]
		mov	[di+20h], eax
		mov	al, [bp+var_3D]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 1Fh
		mov	word ptr [di+2Ch], 20h ; ' '
		mov	ax, [bp+var_38]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_9045A
; ���������������������������������������������������������������������������

loc_90458:				; CODE XREF: ResourceFile_LoadTypeA_90097+347j
		mov	ax, di

loc_9045A:				; CODE XREF: ResourceFile_LoadTypeA_90097+3BFj
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_40], ax
		mov	ax, si
		add	ax, 66h	; 'f'
		mov	[bp+var_42], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_90500
		push	large 11004Ch
		push	large 3E0079h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2

loc_904AE:
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_40]
		mov	eax, [bx]
		mov	[bp+var_46], eax
		mov	al, [bx+4]
		mov	[bp+var_47], al
		mov	eax, [bp+var_46]
		mov	[di+20h], eax
		mov	al, [bp+var_47]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 1Dh
		mov	word ptr [di+2Ch], 1Eh
		mov	ax, [bp+var_42]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_90502
; ���������������������������������������������������������������������������

loc_90500:				; CODE XREF: ResourceFile_LoadTypeA_90097+3EFj
		mov	ax, di

loc_90502:				; CODE XREF: ResourceFile_LoadTypeA_90097+467j
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_4A], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_4C], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_4E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_90537
		jmp	loc_905C0
; ���������������������������������������������������������������������������

loc_90537:				; CODE XREF: ResourceFile_LoadTypeA_90097+49Bj
		push	large 0B0088h
		push	large 92005Dh
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_4A]
		mov	eax, [bx]
		mov	[bp+var_52], eax
		mov	al, [bx+4]
		mov	[bp+var_53], al
		mov	eax, [bp+var_52]
		mov	[di+1Eh], eax
		mov	al, [bp+var_53]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_4C]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_4]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1

loc_905B1:
		mov	word ptr [di+0Eh], 134Ah
		mov	ax, [bp+var_4E]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_905C2
; ���������������������������������������������������������������������������

loc_905C0:				; CODE XREF: ResourceFile_LoadTypeA_90097+49Dj
		mov	ax, di

loc_905C2:				; CODE XREF: ResourceFile_LoadTypeA_90097+527j
		push	ax

loc_905C3:
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_56], ax
		mov	ax, [bp+var_20]
		mov	[bp+var_58], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_5A], ax
		mov	ax, si
		add	ax, 67h	; 'g'
		mov	[bp+var_5C], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_90676
		push	large 11004Ch
		push	large 640079h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_56]
		mov	eax, [bx]
		mov	[bp+var_60], eax
		mov	al, [bx+4]
		mov	[bp+var_61], al
		mov	eax, [bp+var_60]
		mov	[di+20h], eax
		mov	al, [bp+var_61]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	ax, [bp+var_58]
		mov	[di+2Ah], ax
		mov	ax, [bp+var_5A]
		mov	[di+2Ch], ax
		mov	ax, [bp+var_5C]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_90678
; ���������������������������������������������������������������������������

loc_90676:				; CODE XREF: ResourceFile_LoadTypeA_90097+563j
		mov	ax, di

loc_90678:				; CODE XREF: ResourceFile_LoadTypeA_90097+5DDj
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	large 0
		push	large 1C001Bh
		push	large 0B0059h
		push	large 410000h
		push	0
		push	[bp+var_1E]
		push	[bp+var_1C]
		push	large 0B0059h
		push	large 340000h
		push	0
		push	[bp+var_1A]

loc_906B4:
		push	[bp+var_18]

loc_906B7:
		push	large 0B0059h

loc_906BD:
		push	large 270000h

loc_906C3:
		push	0
		push	[bp+var_16]
		push	[bp+var_14]
		push	large 0B0059h
		push	large 1A0000h
		push	0
		push	[bp+var_12]
		push	[bp+var_10]
		push	large 0B0059h
		push	large 0D0000h
		push	large 0Eh
		push	large 0D000Bh
		push	large 590000h
		push	large 6
		mov	ax, si
		add	ax, 62h	; 'b'
		push	ax
		mov	ax, si
		add	ax, 14h
		push	ax
		push	large 4E0059h
		push	large 4200D4h
		push	0
		call	VROOMM_StubThunk_6C9F0
		add	sp, 64h
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_64], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_90748
		jmp	loc_907CF
; ���������������������������������������������������������������������������

loc_90748:				; CODE XREF: ResourceFile_LoadTypeA_90097+6ACj
		push	large 0B003Bh
		push	large 0B00083h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_64]
		mov	eax, [bx]
		mov	[bp+var_68], eax
		mov	al, [bx+4]
		mov	[bp+var_69], al
		mov	eax, [bp+var_68]
		mov	[di+1Eh], eax
		mov	al, [bp+var_69]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 26h ; '&'
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 27h ; '''
		mov	ax, di
		jmp	short loc_907D1
; ���������������������������������������������������������������������������

loc_907CF:				; CODE XREF: ResourceFile_LoadTypeA_90097+6AEj
		mov	ax, di

loc_907D1:				; CODE XREF: ResourceFile_LoadTypeA_90097+736j
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_BE]
		push	1
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		lea	di, [bp+var_E4]
		push	1
		push	large 10000h
		mov	al, [si+18h]
		push	ax
		push	large dword ptr	[si+14h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr Cockpit_DrawEncodedText_8FA4C
		add	sp, 0Ch
		push	di
		call	VROOMM_StubThunk_6C996
		jmp	loc_908C5
; ���������������������������������������������������������������������������

loc_90825:				; CODE XREF: ResourceFile_LoadTypeA_90097+835j
		push	0
		push	di
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4
		cmp	[bp+var_4], 0
		jz	short loc_9089C
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jz	short loc_9089C
		call	TextScrollDisplayB_ApplyHelperD_67F60
		push	0
		mov	al, [si+18h]
		push	ax
		push	large dword ptr	[si+14h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	cs
		call	near ptr Cockpit_LoadAndDrawCalibration_8FDC0
		add	sp, 4
		mov	[bp+var_4], 0
		push	large 320000h
		mov	al, [si+18h]
		push	ax
		push	large dword ptr	[si+14h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		call	TextScrollDisplayB_ApplyHelperC_67F26

loc_9089C:				; CODE XREF: ResourceFile_LoadTypeA_90097+79Dj
					; ResourceFile_LoadTypeA_90097+7A9j
		cmp	word ptr [si+62h], 1
		jnz	short loc_908AD
		cmp	word ptr [si+60h], 1
		jnz	short loc_908AD
		mov	word ptr [si+62h], 0

loc_908AD:				; CODE XREF: ResourceFile_LoadTypeA_90097+809j
					; ResourceFile_LoadTypeA_90097+80Fj
		cmp	word ptr [si+62h], 0
		jnz	short loc_908BE
		cmp	word ptr [si+60h], 0
		jnz	short loc_908BE
		mov	word ptr [si+62h], 5

loc_908BE:				; CODE XREF: ResourceFile_LoadTypeA_90097+81Aj
					; ResourceFile_LoadTypeA_90097+820j
		push	di
		mov	bx, [di+0Eh]

loc_908C2:
		call	dword ptr [bx+18h]

loc_908C5:				; CODE XREF: ResourceFile_LoadTypeA_90097+78Bj
		pop	cx
		cmp	[bp+var_2], 0
		jnz	short loc_908CF
		jmp	loc_90825
; ���������������������������������������������������������������������������

loc_908CF:				; CODE XREF: ResourceFile_LoadTypeA_90097+833j
		push	di
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	byte ptr [si+19h], 0
		jz	short loc_908FC
		cmp	dword ptr [si+14h], 0
		jz	short loc_908FC
		push	0
		mov	al, [si+18h]
		push	ax
		mov	ax, si
		add	ax, 14h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_908FC:				; CODE XREF: ResourceFile_LoadTypeA_90097+843j
					; ResourceFile_LoadTypeA_90097+84Aj
		mov	dword ptr [si+14h], 0
		mov	byte ptr [si+19h], 0
		mov	dword ptr [si+1Ah], 0
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceFile_LoadTypeA_90097	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (92 lignes).
; ==============================================================================================
ResourceFile_Helper_90923	proc far		; CODE XREF: VROOMM_StubThunk_6B7BCJ
		push	bp
		mov	bp, sp
		mov	dword_722F0, 0
		mov	byte_722F4, 2
		mov	byte_722F5, 0
		mov	dword_722F6, 0
		mov	dword_722FA, 0
		mov	byte_722FE, 2
		mov	byte_722FF, 0
		mov	dword_72300, 0
		mov	dword_72304, 0
		mov	byte_72308, 2
		mov	byte_72309, 0
		mov	dword_7230A, 0
		mov	dword_7230E, 0
		mov	byte_72312, 2
		mov	byte_72313, 0
		mov	dword_72314, 0
		mov	dword_72318, 0
		mov	byte_7231C, 2
		mov	byte_7231D, 0
		mov	dword_7231E, 0

loc_909B2:
		mov	dword_72322, 0
		mov	byte_72326, 2
		mov	byte_72327, 0
		mov	dword_72328, 0
		mov	dword_7232C, 0
		mov	byte_72330, 2
		mov	byte_72331, 0
		mov	dword_72332, 0
		mov	dword_72336, 0
		mov	byte_7233A, 2
		mov	byte_7233B, 0
		mov	dword_7233C, 0
		mov	word_72343, 0
		mov	byte_72341, 1
		mov	byte_72342, 1
		mov	byte_72345, 1
		mov	byte_72346, 1
		mov	byte_72347, 1
		mov	byte_72348, 1
		mov	byte_72349, 1
		mov	byte_7234A, 1
		mov	byte_7234B, 1
		mov	word_7234C, 4
		mov	word_7234E, 2
		mov	word_72350, 2
		mov	word_72352, 2
		mov	byte_72354, 1
		mov	byte_72355, 0
		mov	byte_72356, 1
		mov	byte_72357, 0
		mov	byte_72358, 0
		mov	byte_72359, 0

loc_90A6F:
		mov	byte_7235A, 0

loc_90A74:
		mov	byte_7235D, 0

loc_90A79:
		mov	byte_7235B, 0

loc_90A7E:
		mov	byte_7235C, 0

loc_90A83:
		mov	byte_7235E, 0
		mov	word_7235F, 0
		mov	byte_72361, 1
		mov	byte_72362, 1
		mov	byte_72363, 0
		mov	byte_72364, 1
		mov	byte_72365, 1
		mov	byte_72366, 0
		mov	byte_72367, 0

loc_90AB1:
		mov	byte_72368, 0
		mov	byte_72369, 1
		mov	byte_7236A, 1
		mov	byte_7236B, 0
		mov	byte_7236C, 0
		mov	byte_7236D, 0
		mov	byte_7236E, 0
		pop	bp
		retf
ResourceFile_Helper_90923	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 156 lignes, NON DÉTAILLÉE — libère 5 blocs typés (Memory_TypedFree_5C7B6 ×5).
; ==============================================================================================
ResourceFile_ReleaseMultipleBlocks_90AD6	proc far		; CODE XREF: VROOMM_StubThunk_6B7C1J
		push	bp
		mov	bp, sp
		cmp	byte_7233B, 0
		jz	short loc_90AFE
		cmp	dword_72336, 0
		jz	short loc_90AFE
		push	0
		mov	al, byte_7233A
		push	ax
		push	5286h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90AFE:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+8j
					; ResourceFile_ReleaseMultipleBlocks_90AD6+10j
		mov	dword_72336, 0
		mov	byte_7233B, 0
		mov	dword_7233C, 0
		cmp	byte_72331, 0
		jz	short loc_90B3A
		cmp	dword_7232C, 0
		jz	short loc_90B3A
		push	0
		mov	al, byte_72330
		push	ax
		push	527Ch
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90B3A:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+44j
					; ResourceFile_ReleaseMultipleBlocks_90AD6+4Cj
		mov	dword_7232C, 0
		mov	byte_72331, 0
		mov	dword_72332, 0
		cmp	byte_72327, 0
		jz	short loc_90B76
		cmp	dword_72322, 0
		jz	short loc_90B76
		push	0
		mov	al, byte_72326
		push	ax
		push	5272h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90B76:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+80j
					; ResourceFile_ReleaseMultipleBlocks_90AD6+88j
		mov	dword_72322, 0

loc_90B7F:
		mov	byte_72327, 0
		mov	dword_72328, 0
		cmp	byte_7231D, 0
		jz	short loc_90BB2
		cmp	dword_72318, 0
		jz	short loc_90BB2
		push	0
		mov	al, byte_7231C
		push	ax
		push	5268h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90BB2:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+BCj
					; ResourceFile_ReleaseMultipleBlocks_90AD6+C4j
		mov	dword_72318, 0
		mov	byte_7231D, 0
		mov	dword_7231E, 0
		cmp	byte_72313, 0
		jz	short loc_90BEE
		cmp	dword_7230E, 0
		jz	short loc_90BEE
		push	0
		mov	al, byte_72312
		push	ax
		push	525Eh
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90BEE:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+F8j
					; ResourceFile_ReleaseMultipleBlocks_90AD6+100j
		mov	dword_7230E, 0
		mov	byte_72313, 0
		mov	dword_72314, 0
		cmp	byte_72309, 0
		jz	short loc_90C2A
		cmp	dword_72304, 0
		jz	short loc_90C2A
		push	0
		mov	al, byte_72308
		push	ax
		push	5254h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90C2A:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+134j
					; ResourceFile_ReleaseMultipleBlocks_90AD6+13Cj
		mov	dword_72304, 0
		mov	byte_72309, 0
		mov	dword_7230A, 0
		cmp	byte_722FF, 0
		jz	short loc_90C66
		cmp	dword_722FA, 0
		jz	short loc_90C66
		push	0
		mov	al, byte_722FE
		push	ax
		push	524Ah
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90C66:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+170j
					; ResourceFile_ReleaseMultipleBlocks_90AD6+178j
		mov	dword_722FA, 0

loc_90C6F:
		mov	byte_722FF, 0

loc_90C74:
		mov	dword_72300, 0
		cmp	byte_722F5, 0
		jz	short loc_90CA2
		cmp	dword_722F0, 0
		jz	short loc_90CA2
		push	0
		mov	al, byte_722F4
		push	ax
		push	5240h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90CA2:				; CODE XREF: ResourceFile_ReleaseMultipleBlocks_90AD6+1ACj
					; ResourceFile_ReleaseMultipleBlocks_90AD6+1B4j
		mov	dword_722F0, 0
		mov	byte_722F5, 0
		mov	dword_722F6, 0
		pop	bp
		retf
ResourceFile_ReleaseMultipleBlocks_90AD6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_90CBB	proc far		; CODE XREF: VROOMM_StubThunk_6B780J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_90D1A
		cmp	byte ptr [si+25h], 0
		jz	short loc_90CF0
		cmp	dword ptr [si+20h], 0
		jz	short loc_90CF0
		push	0
		mov	al, [si+24h]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_90CF0:				; CODE XREF: ResourceFile_ReleaseAndStyle_90CBB+13j
					; ResourceFile_ReleaseAndStyle_90CBB+1Aj
		mov	dword ptr [si+20h], 0
		mov	byte ptr [si+25h], 0
		mov	dword ptr [si+26h], 0
		push	si
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_90D1A
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_90D1A:				; CODE XREF: ResourceFile_ReleaseAndStyle_90CBB+Dj
					; ResourceFile_ReleaseAndStyle_90CBB+54j
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_90CBB	endp

ovr266		ends
