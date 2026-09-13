seg047		segment	byte public 'CODE' use16
		assume cs:seg047
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — copie une structure (sub_2DF4), tente une résolution (sub_641B2) sinon parse un
; fichier de config (sub_1F4B) : chargeur de configuration/calibration (fichier .cfg),
; probable réglages joystick/contrôleur.
; ==============================================================================================
Config_LoadOrCreate	proc far		; CODE XREF: TextObj_Construct+40P
					; TextRenderer_Main+265P ...

var_50		= word ptr -50h
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		lea	ax, [bp+var_50]
		push	ax
		call	StreamReader_ParseFormattedValueB_641B2
		pop	cx
		or	ax, ax
		jz	short loc_26F54
		mov	al, 1
		jmp	short locret_26F6D
; ���������������������������������������������������������������������������

loc_26F54:				; CODE XREF: Config_LoadOrCreate+23j
		push	0
		lea	ax, [bp+var_50]
		push	ax
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_26F6B
		mov	ax, 1
		jmp	short locret_26F6D
; ���������������������������������������������������������������������������

loc_26F6B:				; CODE XREF: Config_LoadOrCreate+39j
		xor	ax, ax

locret_26F6D:				; CODE XREF: Config_LoadOrCreate+27j
					; Config_LoadOrCreate+3Ej
		leave
		retf
Config_LoadOrCreate	endp

; ���������������������������������������������������������������������������

loc_26F6F:				; DATA XREF: seg339:02ACo seg339:0304o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_26F74:				; DATA XREF: TextRenderer_Main+976o
		push	bp
		mov	bp, sp
		inc	dword_6E33D
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,292L — vérifie l'état d'initialisation (byte_6E345), lit une valeur de config
; (sub_286D2, byte_722D1) selon plusieurs flags de mode (byte_722D0/D3) : lecture de
; paramètres de configuration/calibration selon le mode d'affichage/contrôleur actif.
; ==============================================================================================
Config_ReadCalibration	proc far		; CODE XREF: UIScreen_StateMachineMain_4FBF1+DP
					; UIScreen_StateMachineMain_4FBF1:loc_4FE47P	...

var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_6E345, 0
		jz	short loc_26F94

loc_26F8F:				; CODE XREF: Config_ReadCalibration+FCj
		mov	al, 0
		jmp	loc_2712D
; ���������������������������������������������������������������������������

loc_26F94:				; CODE XREF: Config_ReadCalibration+Fj
		mov	ax, si
		add	ax, 5
		push	ax
		call	Input_PointerConfigDispatch
		pop	cx
		mov	al, byte_722D1
		mov	ah, 0
		mov	[bp+var_2], ax
		cmp	byte_722D0, 1
		jnz	short loc_26FBF
		test	byte_722D3, 0C0h
		jz	short loc_26FBB
		mov	ax, 1
		jmp	short loc_26FBD
; ���������������������������������������������������������������������������

loc_26FBB:				; CODE XREF: Config_ReadCalibration+36j
		xor	ax, ax

loc_26FBD:				; CODE XREF: Config_ReadCalibration+3Bj
		jmp	short loc_26FD4
; ���������������������������������������������������������������������������

loc_26FBF:				; CODE XREF: Config_ReadCalibration+2Fj
		cmp	byte_72E00, 1
		jz	short loc_26FCD
		cmp	byte_72E21, 1
		jnz	short loc_26FD2

loc_26FCD:				; CODE XREF: Config_ReadCalibration+46j
		mov	ax, 1
		jmp	short loc_26FD4
; ���������������������������������������������������������������������������

loc_26FD2:				; CODE XREF: Config_ReadCalibration+4Dj
		xor	ax, ax

loc_26FD4:				; CODE XREF: Config_ReadCalibration:loc_26FBDj
					; Config_ReadCalibration+52j
		or	al, al
		jnz	short loc_26FDB
		jmp	loc_27122	; default
; ���������������������������������������������������������������������������

loc_26FDB:				; CODE XREF: Config_ReadCalibration+58j
		cmp	byte_722D0, 1
		jnz	short loc_26FF2
		test	byte_722D3, 0Ch
		jz	short loc_26FEE
		mov	ax, 1
		jmp	short loc_26FF0
; ���������������������������������������������������������������������������

loc_26FEE:				; CODE XREF: Config_ReadCalibration+69j
		xor	ax, ax

loc_26FF0:				; CODE XREF: Config_ReadCalibration+6Ej
		jmp	short loc_27007
; ���������������������������������������������������������������������������

loc_26FF2:				; CODE XREF: Config_ReadCalibration+62j
		cmp	byte_72DF2, 1
		jz	short loc_27000
		cmp	byte_72DFE, 1
		jnz	short loc_27005

loc_27000:				; CODE XREF: Config_ReadCalibration+79j
		mov	ax, 1
		jmp	short loc_27007
; ���������������������������������������������������������������������������

loc_27005:				; CODE XREF: Config_ReadCalibration+80j
		xor	ax, ax

loc_27007:				; CODE XREF: Config_ReadCalibration:loc_26FF0j
					; Config_ReadCalibration+85j
		mov	ah, 0
		or	ax, ax
		jz	short loc_27010
		jmp	loc_27122	; default
; ���������������������������������������������������������������������������

loc_27010:				; CODE XREF: Config_ReadCalibration+8Dj
		cmp	byte_722D0, 1
		jnz	short loc_27027
		test	byte_722D3, 30h
		jz	short loc_27023
		mov	ax, 1
		jmp	short loc_27025
; ���������������������������������������������������������������������������

loc_27023:				; CODE XREF: Config_ReadCalibration+9Ej
		xor	ax, ax

loc_27025:				; CODE XREF: Config_ReadCalibration+A3j
		jmp	short loc_2703C
; ���������������������������������������������������������������������������

loc_27027:				; CODE XREF: Config_ReadCalibration+97j
		cmp	byte_72DE5, 1
		jz	short loc_27035
		cmp	byte_72E1D, 1
		jnz	short loc_2703A

loc_27035:				; CODE XREF: Config_ReadCalibration+AEj
		mov	ax, 1
		jmp	short loc_2703C
; ���������������������������������������������������������������������������

loc_2703A:				; CODE XREF: Config_ReadCalibration+B5j
		xor	ax, ax

loc_2703C:				; CODE XREF: Config_ReadCalibration:loc_27025j
					; Config_ReadCalibration+BAj
		mov	ah, 0
		or	ax, ax
		jz	short loc_27045
		jmp	loc_27122	; default
; ���������������������������������������������������������������������������

loc_27045:				; CODE XREF: Config_ReadCalibration+C2j
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	cx, 5		; switch 5 cases
		mov	bx, offset word_27130

loc_27051:				; CODE XREF: Config_ReadCalibration:loc_2705Cj
		mov	ax, cs:[bx]

loc_27054:
		cmp	ax, [bp+var_4]
		jz	short loc_27061
		add	bx, 2

loc_2705C:
		loop	loc_27051

loc_2705E:				; default
		jmp	loc_27122
; ���������������������������������������������������������������������������

loc_27061:				; CODE XREF: Config_ReadCalibration+D9j
		jmp	word ptr cs:[bx+0Ah] ; switch jump

loc_27065:				; DATA XREF: seg047:021Ao
		call	Input_CalibrationHandler	; case 0x2D
		or	al, al
		jnz	short loc_27071

loc_2706E:				; default
		jmp	loc_27122
; ���������������������������������������������������������������������������

loc_27071:				; CODE XREF: Config_ReadCalibration+EEj
		mov	byte ptr [si+24h], 1
		mov	byte_6E345, 1
		jmp	loc_26F8F
; ���������������������������������������������������������������������������

loc_2707D:				; CODE XREF: Config_ReadCalibration:loc_27061j
					; DATA XREF: seg047:021Ao
		mov	[bp+var_6], 0	; case 0x24
		jmp	short loc_270A8
; ���������������������������������������������������������������������������

loc_27084:				; CODE XREF: Config_ReadCalibration+12Ej
		mov	al, byte ptr [bp+var_6]
		push	ax
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jz	short loc_270A5
		push	1
		push	[bp+var_6]
		mov	ax, si
		add	ax, 5
		push	ax
		call	VROOMM_StubThunk_6B745
		add	sp, 6

loc_270A5:				; CODE XREF: Config_ReadCalibration+112j
		inc	[bp+var_6]

loc_270A8:				; CODE XREF: Config_ReadCalibration+104j
		cmp	[bp+var_6], 2
		jl	short loc_27084
		jmp	short loc_27122	; default
; ���������������������������������������������������������������������������

loc_270B0:				; CODE XREF: Config_ReadCalibration:loc_27061j
					; DATA XREF: seg047:021Ao
		mov	al, byte_7236B	; case 0x18
		mov	[bp+var_7], al
		call	Widget_Helper_5AA95
		push	5240h
		call	VROOMM_StubThunk_6B7F0
		pop	cx
		cmp	[bp+var_7], 0
		jz	short loc_270DD
		mov	al, byte_7236B
		mov	ah, 0
		or	ax, ax

loc_270D1:				; default
		jnz	short loc_27122

loc_270D3:
		push	1

loc_270D5:				; CODE XREF: Config_ReadCalibration+180j
		call	Widget_Helper_5A9E6
		pop	cx
		jmp	short loc_27122	; default
; ���������������������������������������������������������������������������

loc_270DD:				; CODE XREF: Config_ReadCalibration+14Aj
		cmp	byte_7236B, 0
		jz	short loc_27122	; default

loc_270E4:
		jmp	short loc_27100
; ���������������������������������������������������������������������������

loc_270E6:				; CODE XREF: Config_ReadCalibration:loc_27061j
					; DATA XREF: seg047:021Ao
		mov	al, byte_7236B	; case 0x32
		mov	[bp+var_7], al
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_7236B, al
		cmp	[bp+var_7], 0
		jz	short loc_27100
		push	0
		jmp	short loc_270D5
; ���������������������������������������������������������������������������

loc_27100:				; CODE XREF: Config_ReadCalibration:loc_270E4j
					; Config_ReadCalibration+17Cj
		call	Weapon_HUDBox_InstantiateInstance_5AA02
		jmp	short loc_27122	; default
; ���������������������������������������������������������������������������

loc_27107:				; CODE XREF: Config_ReadCalibration:loc_27061j
					; DATA XREF: seg047:021Ao
		mov	al, byte_7236C	; case 0x1F
		mov	[bp+var_7], al
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_7236C, al
		cmp	[bp+var_7], 0
		jz	short loc_27122	; default
		call	Widget_Helper_5AA73

loc_27122:				; CODE XREF: Config_ReadCalibration+5Aj
					; Config_ReadCalibration+8Fj ...
		push	5C06h		; default
		call	Weapon_HUDBox_FullUpdateCycle_5AB79
		pop	cx
		mov	al, 1

loc_2712D:				; CODE XREF: Config_ReadCalibration+13j
		pop	si
		leave
		retf
Config_ReadCalibration	endp

; ���������������������������������������������������������������������������
word_27130	dw    18h,   1Fh,   24h,   2Dh ; DATA XREF: Config_ReadCalibration+D0o
		dw    32h		; value	table for switch statement
		dw offset loc_270B0	; jump table for switch	statement
		dw offset loc_27107
		dw offset loc_2707D
		dw offset loc_27065
		dw offset loc_270E6

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — lecture haute précision du timer PIT (canal 0, latch, accumulateur dword_6E33D)
; avec acquittement IRQ (port 0x20) : appelée directement par le tick physique de vol
; (sub_3314/Flight_PhysicsTick_JDYN) — source du delta-temps du moteur physique.
; ==============================================================================================
PIT_ReadHighPrecision	proc far		; CODE XREF: Targeting_AcquireBestThreat+12P
					; Targeting_AcquireBestThreat:loc_3E73P ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		pushf
		cli
		mov	eax, dword_6E33D
		mov	[bp+var_4], eax
		mov	dx, 26D7h

loc_27157:				; CODE XREF: PIT_ReadHighPrecision+3Ej
		mov	al, 0C2h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		jmp	short $+2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).

loc_2715F:
		mov	ch, al

loc_27161:
		jmp	short $+2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bl, al
		jmp	short $+2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bh, al
		jmp	short $+2
		mov	al, 0Ah
		out	20h, al		; Interrupt controller,	8259A.
		jmp	short $+2
		in	al, 20h		; Interrupt controller,	8259A.
		test	al, 1
		jz	short loc_2717F
		mov	ax, dx
		jmp	short loc_27196
; ���������������������������������������������������������������������������

loc_2717F:				; CODE XREF: PIT_ReadHighPrecision+35j
		test	ch, 40h
		jnz	short loc_27157
		xor	ax, ax
		shr	bx, 1
		shl	ch, 1
		jnb	short loc_27190
		mov	ax, dx
		shr	ax, 1

loc_27190:				; CODE XREF: PIT_ReadHighPrecision+46j
		add	ax, bx
		neg	ax
		add	ax, dx

loc_27196:				; CODE XREF: PIT_ReadHighPrecision+39j
		popf
		movzx	eax, ax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		imul	eax, 26D7h
		add	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ebx, 0C6h ; '�'
		cdq
		idiv	ebx
		shld	edx, eax, 10h
		leave
		retf
PIT_ReadHighPrecision	endp

; ���������������������������������������������������������������������������
byte_271C4	db 50h,	53h, 51h, 52h, 6, 1Eh, 56h, 57h, 55h, 0BDh
					; DATA XREF: DOS_InstallCtrlBreakHandler+27o
		dw seg seg339
byte_271D0	db 8Eh,	0DDh, 5Dh, 5Fh,	5Eh, 1Fh, 7, 5Ah, 59h, 5Bh, 58h
		db 0CFh

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — alloue un objet (18 octets) et installe un handler d'interruption (sub_664D5,
; vecteur INT 23h) : installation du handler Ctrl-Break DOS.
; ==============================================================================================
DOS_InstallCtrlBreakHandler	proc far		; CODE XREF: seg047:0376p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_271F5
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_27213

loc_271F5:				; CODE XREF: DOS_InstallCtrlBreakHandler+9j
		push	si
		call	JoystickCallback_Construct_663D6
		pop	cx
		push	large 0
		push	si
		push	seg seg047
		push	offset byte_271C4
		push	23h ; '#'
		push	5CECh
		call	JoystickCallback_RegisterInChain_664D5
		add	sp, 0Eh

loc_27213:				; CODE XREF: DOS_InstallCtrlBreakHandler+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
DOS_InstallCtrlBreakHandler	endp

; ���������������������������������������������������������������������������

loc_27218:				; DATA XREF: seg339:4DC2o
		push	bp
		mov	bp, sp
		mov	word_72292, 129Eh
		mov	ax, word_70EA8
		mov	word_72294, ax
		mov	word_70EA8, 51E2h
		mov	dword_72297, 0
		mov	byte_7229B, 2
		mov	byte_7229C, 0
		mov	dword_7229D, 0
		mov	word_722A1, 0

loc_2724F:
		mov	word_722A7, 0
		mov	word_722AD, 0

loc_2725B:
		mov	word_72292, 12A2h

loc_27261:
		mov	byte_722AF, 3
		mov	word_722B0, 129Eh
		mov	ax, word_70EA8
		mov	word_722B2, ax

loc_27272:
		mov	word_70EA8, 5200h
		mov	word_722B4, 1296h
		mov	word_722B0, 129Ah
		mov	byte_722B6, 1
		push	51FFh
		call	TextRenderer_EncodeCharA_5E27B
		pop	cx
		push	520Ah
		push	cs
		call	near ptr DOS_InstallCtrlBreakHandler
		pop	cx
		push	521Ch
		call	TextScrollDisplayB_ConstructAndReset_67DF5
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_272A5:				; DATA XREF: seg339:4EDCo
		push	bp
		mov	bp, sp
		push	521Ch
		call	ResourceHandle_IsValid_6755B
		pop	cx
		push	2
		push	520Ah
		call	JoystickCallback_Destruct_66420
		add	sp, 4
		mov	word_72292, 12A2h
		push	51E2h
		call	Dialog_Close
		pop	cx
		push	0

loc_272CF:
		push	51E7h
		call	VROOMM_StubThunk_6B754
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_272DC:				; DATA XREF: seg339:129Ao
		mov	bx, sp

loc_272DE:
		add	word ptr ss:[bx+4], 0FFFFh

loc_272E3:
		jmp	far ptr	TextRenderer_EncodeCharIfFlagged_5E61C
seg047		ends
