ovr265		segment	para public 'OVERLAY' use16
		assume cs:ovr265
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Joystick_GetAxisMax_67BD8 (seg208, 18 lignes).
; ==============================================================================================
Joystick_GetAxisMaxWrapper_8EEA0	proc far		; CODE XREF: VROOMM_StubThunk_6B759J

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	1
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		mov	[bp+var_2], ax
		mov	bx, 5
		cwd
		idiv	bx
		mov	word_6E475, ax
		leave
		retf
Joystick_GetAxisMaxWrapper_8EEA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 610 lignes, NON DÉTAILLÉE — construit un StreamReader, appelle Config_LoadOrCreate,
; StreamReader_ReadTyped_63FA1, CRT_Fmemcpy — chargement et application des paramètres de
; configuration du jeu (fichier sc.cfg confirmé dans le seg339). Candidat prioritaire pour
; session dédiée.
; ==============================================================================================
Config_LoadAndApplySettings_8EEBC	proc far		; CODE XREF: VROOMM_StubThunk_6B745J

var_158		= word ptr -158h
var_FB		= dword	ptr -0FBh
var_F7		= dword	ptr -0F7h
var_F2		= word ptr -0F2h
var_A2		= word ptr -0A2h
var_80		= word ptr -80h
var_23		= dword	ptr -23h
var_1F		= dword	ptr -1Fh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 158h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_80]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_80], 2C8h
		mov	[bp+var_1F], 100h
		mov	[bp+var_23], 0
		mov	[bp+var_80], 138Ah
		mov	al, byte ptr [bp+arg_2]
		add	al, 41h	; 'A'
		mov	byte_6E48B, al
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8EF4B
		push	ds
		push	offset unk_6E488
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_8EF4B
		push	1
		push	13D8h
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, [bp+var_80]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h ; '"'
		push	ss
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		push	ds
		push	offset word_72E84
		lea	ax, [bp+var_A2]
		push	ss
		push	ax
		mov	cx, 22h	; '"'
		call	CRT_Fmemcpy
		jmp	loc_8F469
; ���������������������������������������������������������������������������

loc_8EF4B:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+3Ej
					; Config_LoadAndApplySettings_8EEBC+4Ej
		call	Widget_Helper_5A9BA
		cmp	byte_721F0, 2
		jnz	short loc_8EF5C
		mov	ax, 1
		jmp	short loc_8EF5E
; ���������������������������������������������������������������������������

loc_8EF5C:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+99j
		xor	ax, ax

loc_8EF5E:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+9Ej
		or	ax, ax
		jz	short loc_8EF78
		cmp	byte_721F0, 2
		jnz	short loc_8EF78
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_8EF78:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+A4j
					; Config_LoadAndApplySettings_8EEBC+ABj
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	13E1h
		push	541Ah
		call	VROOMM_StubThunk_6BCA1
		add	sp, 4
		push	541Ah

loc_8EFA1:
		call	VGA_LoadPalette
		pop	cx
		push	ds
		push	offset a_shp_2	; ".shp"
		push	ds
		push	offset aJoycalib ; "joycalib"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_F2]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_158]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_158], 2C8h
		mov	[bp+var_F7], 100h
		mov	[bp+var_FB], 0
		mov	[bp+var_158], 138Ah
		push	1
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		mov	bx, [bp+var_158]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_158]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_4], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_12]
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_158]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_158]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4

loc_8F094:
		mov	[bp+var_B], 1
		jmp	loc_8F3B1
; ���������������������������������������������������������������������������

loc_8F09B:				; CODE XREF: Config_LoadAndApplySettings_8EEBC:loc_8F3B7j
		call	Joystick_InitCalibrationDefaults_67B92
		push	large 0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 870005h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	large 80000h
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		imul	ax, 3
		inc	ax
		push	ax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0A20032h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_8F12F
; ���������������������������������������������������������������������������

loc_8F12A:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+283j
		call	Joystick_SampleAxesToTable_67910

loc_8F12F:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+26Cj
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_8F12A
		jmp	short loc_8F148
; ���������������������������������������������������������������������������

loc_8F143:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+29Ej
		call	Joystick_SampleAxesToTable_67910

loc_8F148:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+285j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_8F143
		push	[bp+arg_2]
		call	Joystick_LoadCalibrationSample_67C03
		pop	cx
		jmp	short loc_8F16C
; ���������������������������������������������������������������������������

loc_8F167:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+2C0j
		call	Joystick_SampleAxesToTable_67910

loc_8F16C:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+2A9j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_8F167
		push	large 80000h
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_8F194:
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		imul	ax, 3
		add	ax, 2
		push	ax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0A2002Dh
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_8F1E5
; ���������������������������������������������������������������������������

loc_8F1E0:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+33Bj
		call	Joystick_SampleAxesToTable_67910

loc_8F1E5:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+322j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_8F1E0
		push	[bp+arg_2]
		call	Joystick_ComputeCalibrationRatio_67C3F
		pop	cx
		jmp	short loc_8F209
; ���������������������������������������������������������������������������

loc_8F204:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+35Dj
		call	Joystick_SampleAxesToTable_67910

loc_8F209:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+346j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_8F204
		push	large 80000h
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		imul	ax, 3
		add	ax, 3
		push	ax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0A2003Bh
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_8F282
; ���������������������������������������������������������������������������

loc_8F27D:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+3D8j
		call	Joystick_SampleAxesToTable_67910

loc_8F282:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+3BFj
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_8F27D
		push	[bp+arg_2]
		call	Joystick_LoadCalibrationExtremes_67C21
		pop	cx
		jmp	short loc_8F2A6
; ���������������������������������������������������������������������������

loc_8F2A1:				; CODE XREF: Config_LoadAndApplySettings_8EEBC:loc_8F2B6j
		call	Joystick_SampleAxesToTable_67910

loc_8F2A6:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+3E3j
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C

loc_8F2B1:
		add	sp, 4
		or	al, al

loc_8F2B6:
		jnz	short loc_8F2A1

loc_8F2B8:
		push	large 1E0020h
		push	20h ; ' '

loc_8F2C0:
		call	Joystick_InterpolateCalibrationPercent_67CB8

loc_8F2C5:
		add	sp, 6
		cmp	word_72E94, 0
		jz	short loc_8F2E8
		cmp	word_72E98, 0
		jz	short loc_8F2E8
		cmp	word_72E96, 0
		jz	short loc_8F2E8
		cmp	word_72E9A, 0
		jz	short loc_8F2E8
		mov	[bp+var_B], 0

loc_8F2E8:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+411j
					; Config_LoadAndApplySettings_8EEBC+418j ...
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F326
		push	0
		push	13D8h
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, [bp+var_80]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h ; '"'
		push	ds
		push	offset word_72E84
		lea	ax, [bp+var_80]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		lea	ax, [bp+var_80]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		jmp	loc_8F3B1
; ���������������������������������������������������������������������������

loc_8F326:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+433j
		push	large 80000h
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 9F0011h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	large 70000h
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0A2001Fh
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		pop	cx
		push	7
		call	PIT_DelayLoop
		pop	cx
		call	PC_SoundOff
		jmp	short loc_8F39D
; ���������������������������������������������������������������������������

loc_8F398:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+4F3j
		call	Joystick_SampleAxesToTable_67910

loc_8F39D:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+4DAj
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_8F398

loc_8F3B1:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+1DCj
					; Config_LoadAndApplySettings_8EEBC+467j
		cmp	[bp+var_B], 0
		jz	short loc_8F3BA

loc_8F3B7:
		jmp	loc_8F09B
; ���������������������������������������������������������������������������

loc_8F3BA:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+4F9j
		push	0

loc_8F3BC:
		call	Joystick_UpdateCalibration_67B0D
		pop	cx
		mov	al, byte_6E338
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F3D9
		push	0
		push	word_70E62
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4

loc_8F3D9:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+50Dj
		cmp	byte_721F0, 2
		jnz	short loc_8F3E5
		mov	ax, 1
		jmp	short loc_8F3E7
; ���������������������������������������������������������������������������

loc_8F3E5:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+522j
		xor	ax, ax

loc_8F3E7:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+527j
		or	ax, ax
		jz	short loc_8F42C
		cmp	byte_721F0, 2
		jnz	short loc_8F42C
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_E], bx
		push	1
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		xor	dx, dx
		mov	cl, 0
		mov	ch, 2
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		cmp	[bp+var_E], 0
		jnz	short loc_8F42C
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short $+2

loc_8F42C:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+52Dj
					; Config_LoadAndApplySettings_8EEBC+534j ...
		call	Widget_Helper_5A9D0
		cmp	[bp+var_5], 0
		jz	short loc_8F455
		cmp	[bp+var_A], 0
		jz	short loc_8F455
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8F455:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+579j
					; Config_LoadAndApplySettings_8EEBC+580j
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0

loc_8F469:				; CODE XREF: Config_LoadAndApplySettings_8EEBC+8Cj
		push	0
		lea	ax, [bp+var_80]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
Config_LoadAndApplySettings_8EEBC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, 164 lignes — initialise plusieurs sous-systèmes d'entrée en une fonction :
; Stopwatch_RegisterTickModule_67611 (seg207), InputBinding_Construct_66DBA (seg203),
; Keyboard_RegisterOrInitHandlerTable_66BBA (seg202) — point d'initialisation central des
; systèmes clavier/joystick/chronomètre.
; ==============================================================================================
InputSystem_InitAll_8F47A	proc far		; CODE XREF: VROOMM_StubThunk_6B74AJ

var_56		= word ptr -56h
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 56h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_6E46E
		mov	ah, 0
		or	ax, ax
		jz	short loc_8F491
		jmp	loc_8F5DC
; ���������������������������������������������������������������������������

loc_8F491:				; CODE XREF: InputSystem_InitAll_8F47A+12j
		push	5DC2h
		call	Stopwatch_RegisterTickModule_67611
		pop	cx
		mov	byte_722D1, 0
		mov	byte_722D0, 0
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_8F4BD
		push	ax

loc_8F4B3:
		call	InputBinding_Construct_66DBA
		pop	cx
		mov	ax, di

loc_8F4BB:
		jmp	short loc_8F4BF
; ���������������������������������������������������������������������������

loc_8F4BD:				; CODE XREF: InputSystem_InitAll_8F47A+36j
		mov	ax, di

loc_8F4BF:				; CODE XREF: InputSystem_InitAll_8F47A:loc_8F4BBj
		mov	[si+0Ah], ax
		push	50h ; 'P'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+0Ch], ax
		push	14h
		push	ds
		push	word ptr [si+0Ch]
		push	0
		call	Keyboard_RegisterOrInitHandlerTable_66BBA
		add	sp, 8
		mov	[si+0Eh], ax
		push	0
		call	Joystick_ReadAndScaleAxes_67835
		pop	cx
		mov	[si+10h], ax
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_8F504
		push	ax
		call	TextScrollDisplay_Construct_67267
		pop	cx
		mov	ax, di
		jmp	short loc_8F506
; ���������������������������������������������������������������������������

loc_8F504:				; CODE XREF: InputSystem_InitAll_8F47A+7Dj
		mov	ax, di

loc_8F506:				; CODE XREF: InputSystem_InitAll_8F47A+88j
		mov	[si+16h], ax
		push	seg stub265
		push	offset VROOMM_StubThunk_6B740
		push	large 10014h
		push	large 70000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+12h], ax
		push	14h
		push	word ptr [si+12h]
		push	0
		call	TextScroll_Construct_66FC4
		add	sp, 6
		mov	[si+14h], ax
		push	ds
		push	offset a_shp_3	; ".shp"
		push	ds
		push	offset aMouse	; "mouse"
		push	large 0
		lea	ax, [bp+var_56]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	TextRenderer_LoadResourceFile_661AF
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+var_4]
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		push	si
		call	TextScrollDisplayB_TickHelper_67F13
		pop	cx
		push	521Eh
		call	TextScrollDisplayB_InitAndRegister_67E34
		pop	cx
		push	0
		push	word_70E62
		call	TextScrollDisplayB_ApplyHelperA_67E9C
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_67F26
		call	TextScrollDisplayB_ApplyHelperD_67F60
		mov	[bp+var_6], 0
		jmp	short loc_8F5CC
; ���������������������������������������������������������������������������

loc_8F5A9:				; CODE XREF: InputSystem_InitAll_8F47A+156j
		mov	al, byte ptr [bp+var_6]
		push	ax
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jz	short loc_8F5C1
		mov	bx, [bp+var_6]

loc_8F5BA:
		mov	byte ptr [bx+5224h], 1
		jmp	short loc_8F5C9
; ���������������������������������������������������������������������������

loc_8F5C1:				; CODE XREF: InputSystem_InitAll_8F47A+13Bj
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+5224h], 0

loc_8F5C9:				; CODE XREF: InputSystem_InitAll_8F47A+145j
		inc	[bp+var_6]

loc_8F5CC:				; CODE XREF: InputSystem_InitAll_8F47A+12Dj
		cmp	[bp+var_6], 2
		jl	short loc_8F5A9
		mov	byte_6E46E, 1
		call	Mouse_InitAndRead

loc_8F5DC:				; CODE XREF: InputSystem_InitAll_8F47A+14j
		pop	di
		pop	si
		leave
		retf
InputSystem_InitAll_8F47A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceHandle_IsValid_6755B (seg205), TextScrollDisplay_Destruct_6728A
; (seg206) — nettoyage symétrique de InputSystem_InitAll_8F47A.
; ==============================================================================================
InputSystem_ReleaseAll_8F5E0	proc far		; CODE XREF: VROOMM_StubThunk_6B74FJ InputSystem_ReleaseBlock_8F69E+11p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_6E46E, 0
		jnz	short loc_8F5F1
		jmp	loc_8F69B
; ���������������������������������������������������������������������������

loc_8F5F1:				; CODE XREF: InputSystem_ReleaseAll_8F5E0+Cj
		push	word ptr [si+12h]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+12h], 0
		cmp	word ptr [si+14h], 0
		jz	short loc_8F619
		push	word ptr [si+14h]
		call	ResourceHandle_IsValid_6755B
		pop	cx
		push	word ptr [si+14h]
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_8F619:				; CODE XREF: InputSystem_ReleaseAll_8F5E0+23j
		mov	word ptr [si+14h], 0
		cmp	word ptr [si+16h], 0
		jz	short loc_8F63C
		push	0
		push	word ptr [si+16h]
		call	TextScrollDisplay_Destruct_6728A
		add	sp, 4
		push	word ptr [si+16h]
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_8F63C:				; CODE XREF: InputSystem_ReleaseAll_8F5E0+42j
		mov	word ptr [si+16h], 0
		push	3
		push	word ptr [si+10h]
		call	Joystick_ReleaseCalibration_678EA
		add	sp, 4
		mov	word ptr [si+10h], 0
		push	3
		push	word ptr [si+0Eh]
		call	Keyboard_UnregisterHandlerTable_66C62
		add	sp, 4
		mov	word ptr [si+0Eh], 0
		push	word ptr [si+0Ch]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+0Ch], 0
		cmp	word ptr [si+0Ah], 0
		jz	short loc_8F691
		push	0
		push	word ptr [si+0Ah]
		call	InputBinding_Destruct_66DDD
		add	sp, 4
		push	word ptr [si+0Ah]
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_8F691:				; CODE XREF: InputSystem_ReleaseAll_8F5E0+97j
		mov	word ptr [si+0Ah], 0
		mov	byte_6E46E, 0

loc_8F69B:				; CODE XREF: InputSystem_ReleaseAll_8F5E0+Ej
		pop	si
		pop	bp
		retf
InputSystem_ReleaseAll_8F5E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un bloc typé (Memory_TypedFree_5C7B6).
; ==============================================================================================
InputSystem_ReleaseBlock_8F69E	proc far		; CODE XREF: VROOMM_StubThunk_6B754J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8F6F3
		push	si
		push	cs
		call	near ptr InputSystem_ReleaseAll_8F5E0
		pop	cx

loc_8F6B3:
		cmp	byte ptr [si+5], 0

loc_8F6B7:
		jz	short loc_8F6D3

loc_8F6B9:
		cmp	dword ptr [si],	0
		jz	short loc_8F6D3
		push	0

loc_8F6C1:
		mov	al, [si+4]
		push	ax
		push	si

loc_8F6C6:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8F6D3:				; CODE XREF: InputSystem_ReleaseBlock_8F69E:loc_8F6B7j
					; InputSystem_ReleaseBlock_8F69E+1Fj
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_8F6F3
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_8F6F3:				; CODE XREF: InputSystem_ReleaseBlock_8F69E+Dj
					; InputSystem_ReleaseBlock_8F69E+4Cj
		pop	di
		pop	si
		pop	bp
		retf
InputSystem_ReleaseBlock_8F69E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry, 28 lignes).
; ==============================================================================================
InputSystem_Allocate_8F6F7	proc far		; CODE XREF: VROOMM_StubThunk_6B740J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8F710
		push	7
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8F718

loc_8F710:				; CODE XREF: InputSystem_Allocate_8F6F7+9j
		mov	ax, si
		add	ax, 6
		mov	byte ptr [si], 0

loc_8F718:				; CODE XREF: InputSystem_Allocate_8F6F7+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
InputSystem_Allocate_8F6F7	endp

ovr265		ends
