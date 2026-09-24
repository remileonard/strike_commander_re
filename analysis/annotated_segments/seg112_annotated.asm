seg112		segment	byte public 'CODE' use16
		assume cs:seg112
		;org 1
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 645 lignes, PARTIELLEMENT LUE (session gestion de mission avec Remi). RENOMMEE (echange
; avec sub_536F7) : ce n'est PAS le tick principal du jeu — c'est un SOUS-SYSTEME appele
; DEPUIS MAIN_GAME_TICK_536F7 (et aussi UIScript_ParseAndEvaluate_7A054), dedie aux actions de
; combat liees a la cible verrouillee (word_722E6) : mode 'Time Burst' (post-combustion,
; message radio 'aTimeBurst'), calcul de portee/distance vers la cible (cible->+0x51, compare
; a 0x400), operation sur tag d'objet (0x59C3). Dispatch riche sur byte_722D1 (plusieurs
; valeurs). Lecture complete non terminee — les anciens noms de ses callees
; ('Config_ReadCalibration', 'WorldObjects_PeriodicGC', 'Physics_ApplyGroundHeightConstraint')
; sont eux-memes probablement faux, a revoir.
; ==============================================================================================
CombatTarget_WeaponActionSubsystem	proc far		; CODE XREF: MAIN_GAME_TICK+180P
					; UIScript_ParseAndEvaluate_7A054:loc_7A4C0P	...

var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp

loc_4FBF4:				; DATA XREF: seg216:0446o
		sub	sp, 34h
		mov	[bp+var_1], 0
		push	51E2h
		call	Config_ReadCalibration
		pop	cx
		or	al, al
		jnz	short loc_4FC0B
		jmp	loc_500A1
; ���������������������������������������������������������������������������

loc_4FC0B:				; CODE XREF: CombatTarget_WeaponActionSubsystem+15j
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 0Fh
		jz	short loc_4FC6D
		cmp	ax, 19h
		jnz	short loc_4FC1D
		jmp	loc_4FD8D
; ���������������������������������������������������������������������������

loc_4FC1D:				; CODE XREF: CombatTarget_WeaponActionSubsystem+27j
		cmp	ax, 20h	; ' '
		jz	short loc_4FC25
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FC25:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2Fj
		cmp	byte_722D0, 1
		jnz	short loc_4FC3C
		test	byte_722D3, 0Ch
		jz	short loc_4FC38

loc_4FC33:
		mov	ax, 1
		jmp	short loc_4FC3A
; ���������������������������������������������������������������������������

loc_4FC38:				; CODE XREF: CombatTarget_WeaponActionSubsystem+40j
		xor	ax, ax

loc_4FC3A:				; CODE XREF: CombatTarget_WeaponActionSubsystem+45j
		jmp	short loc_4FC51
; ���������������������������������������������������������������������������

loc_4FC3C:				; CODE XREF: CombatTarget_WeaponActionSubsystem+39j
		cmp	byte_72DF2, 1
		jz	short loc_4FC4A
		cmp	byte_72DFE, 1
		jnz	short loc_4FC4F

loc_4FC4A:				; CODE XREF: CombatTarget_WeaponActionSubsystem+50j
		mov	ax, 1
		jmp	short loc_4FC51
; ���������������������������������������������������������������������������

loc_4FC4F:				; CODE XREF: CombatTarget_WeaponActionSubsystem+57j
		xor	ax, ax

loc_4FC51:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FC3Aj
					; CombatTarget_WeaponActionSubsystem+5Cj
		or	al, al
		jnz	short loc_4FC58
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FC58:				; CODE XREF: CombatTarget_WeaponActionSubsystem+62j
		cmp	byte_6E33C, 0
		jnz	short loc_4FC62
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FC62:				; CODE XREF: CombatTarget_WeaponActionSubsystem+6Cj
		mov	al, byte_70476
		xor	al, 1
		mov	byte_70476, al
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FC6D:				; CODE XREF: CombatTarget_WeaponActionSubsystem+22j
		mov	byte_7046D, 1
		cmp	byte_722D0, 1
		jnz	short loc_4FC89
		test	byte_722D3, 0Ch
		jz	short loc_4FC85
		mov	ax, 1
		jmp	short loc_4FC87
; ���������������������������������������������������������������������������

loc_4FC85:				; CODE XREF: CombatTarget_WeaponActionSubsystem+8Dj
		xor	ax, ax

loc_4FC87:				; CODE XREF: CombatTarget_WeaponActionSubsystem+92j
		jmp	short loc_4FC9E
; ���������������������������������������������������������������������������

loc_4FC89:				; CODE XREF: CombatTarget_WeaponActionSubsystem+86j
		cmp	byte_72DF2, 1
		jz	short loc_4FC97
		cmp	byte_72DFE, 1
		jnz	short loc_4FC9C

loc_4FC97:				; CODE XREF: CombatTarget_WeaponActionSubsystem+9Dj
		mov	ax, 1
		jmp	short loc_4FC9E
; ���������������������������������������������������������������������������

loc_4FC9C:				; CODE XREF: CombatTarget_WeaponActionSubsystem+A4j
		xor	ax, ax

loc_4FC9E:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FC87j
					; CombatTarget_WeaponActionSubsystem+A9j
		or	al, al
		jnz	short loc_4FCA5
		jmp	loc_4FD43
; ���������������������������������������������������������������������������

loc_4FCA5:				; CODE XREF: CombatTarget_WeaponActionSubsystem+AFj
		mov	byte_7046C, 0
		mov	byte_7046D, 0
		cmp	word_7046E, 1
		jnz	short loc_4FCBE
		mov	word_7046E, 2
		jmp	short loc_4FCDA
; ���������������������������������������������������������������������������

loc_4FCBE:				; CODE XREF: CombatTarget_WeaponActionSubsystem+C3j
		cmp	word_7046E, 2
		jnz	short loc_4FCCD
		mov	word_7046E, 4
		jmp	short loc_4FCDA
; ���������������������������������������������������������������������������

loc_4FCCD:				; CODE XREF: CombatTarget_WeaponActionSubsystem+D2j
		cmp	word_7046E, 4
		jnz	short loc_4FCDA
		mov	word_7046E, 1

loc_4FCDA:				; CODE XREF: CombatTarget_WeaponActionSubsystem+CBj
					; CombatTarget_WeaponActionSubsystem+DAj ...
		mov	ax, word_7046E
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_70468, eax
		cmp	dword_70468, 100h
		jle	short loc_4FD05
		mov	ax, 1
		jmp	short loc_4FD07
; ���������������������������������������������������������������������������

loc_4FD05:				; CODE XREF: CombatTarget_WeaponActionSubsystem+10Dj
		xor	ax, ax

loc_4FD07:				; CODE XREF: CombatTarget_WeaponActionSubsystem+112j
		or	al, al
		jz	short loc_4FD11
		mov	word_70495, 0

loc_4FD11:				; CODE XREF: CombatTarget_WeaponActionSubsystem+118j
		push	word_7046E
		push	33E8h
		lea	ax, [bp+var_34]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_38], 200h
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		push	ds
		push	offset word_72A94

loc_4FD38:
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FD43:				; CODE XREF: CombatTarget_WeaponActionSubsystem+B1j
		cmp	byte_722D0, 1
		jnz	short loc_4FD5A
		test	byte_722D3, 0Ch
		jz	short loc_4FD56
		mov	ax, 1
		jmp	short loc_4FD58
; ���������������������������������������������������������������������������

loc_4FD56:				; CODE XREF: CombatTarget_WeaponActionSubsystem+15Ej
		xor	ax, ax

loc_4FD58:				; CODE XREF: CombatTarget_WeaponActionSubsystem+163j
		jmp	short loc_4FD6F
; ���������������������������������������������������������������������������

loc_4FD5A:				; CODE XREF: CombatTarget_WeaponActionSubsystem+157j
		cmp	byte_72DF2, 1
		jz	short loc_4FD68
		cmp	byte_72DFE, 1
		jnz	short loc_4FD6D

loc_4FD68:				; CODE XREF: CombatTarget_WeaponActionSubsystem+16Ej
		mov	ax, 1
		jmp	short loc_4FD6F
; ���������������������������������������������������������������������������

loc_4FD6D:				; CODE XREF: CombatTarget_WeaponActionSubsystem+175j
		xor	ax, ax

loc_4FD6F:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FD58j
					; CombatTarget_WeaponActionSubsystem+17Aj
		mov	ah, 0
		or	ax, ax
		jz	short loc_4FD78
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FD78:				; CODE XREF: CombatTarget_WeaponActionSubsystem+182j
		mov	dword_72A65, 500h
		mov	dword_72A69, 0FFFFFF00h
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FD8D:				; CODE XREF: CombatTarget_WeaponActionSubsystem+29j
		cmp	byte_722D0, 1
		jnz	short loc_4FDA4
		test	byte_722D3, 0C0h
		jz	short loc_4FDA0
		mov	ax, 1
		jmp	short loc_4FDA2
; ���������������������������������������������������������������������������

loc_4FDA0:				; CODE XREF: CombatTarget_WeaponActionSubsystem+1A8j
		xor	ax, ax

loc_4FDA2:				; CODE XREF: CombatTarget_WeaponActionSubsystem+1ADj
		jmp	short loc_4FDB9
; ���������������������������������������������������������������������������

loc_4FDA4:				; CODE XREF: CombatTarget_WeaponActionSubsystem+1A1j
		cmp	byte_72E00, 1
		jz	short loc_4FDB2
		cmp	byte_72E21, 1
		jnz	short loc_4FDB7

loc_4FDB2:				; CODE XREF: CombatTarget_WeaponActionSubsystem+1B8j
		mov	ax, 1
		jmp	short loc_4FDB9
; ���������������������������������������������������������������������������

loc_4FDB7:				; CODE XREF: CombatTarget_WeaponActionSubsystem+1BFj
		xor	ax, ax

loc_4FDB9:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FDA2j
					; CombatTarget_WeaponActionSubsystem+1C4j
		or	al, al
		jnz	short loc_4FDC0
		jmp	loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FDC0:				; CODE XREF: CombatTarget_WeaponActionSubsystem+1CAj
		mov	byte_70447, 0
		mov	[bp+var_15], 0
		xor	eax, eax
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], 0
		mov	eax, dword_711CD
		mov	[bp+var_1E], eax
		cmp	byte_721F0, 2
		jnz	short loc_4FDFA
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_4FDFA:				; CODE XREF: CombatTarget_WeaponActionSubsystem+1F8j
		push	0
		push	1
		push	ds
		push	offset aGamePaused ; "game paused"
		push	word_72B30
		push	word_70E62
		push	ds
		push	offset word_72A94
		call	UI_RenderFormattedText

loc_4FE13:
		add	sp, 10h

loc_4FE16:
		jmp	short loc_4FE59
; ���������������������������������������������������������������������������

loc_4FE18:				; CODE XREF: CombatTarget_WeaponActionSubsystem+26Fj
		mov	eax, [bp+var_1E]

loc_4FE1C:
		add	eax, [bp+var_1A]

loc_4FE20:
		cmp	eax, dword_711CD
		ja	short loc_4FE2C

loc_4FE27:
		mov	ax, 1
		jmp	short loc_4FE2E
; ���������������������������������������������������������������������������

loc_4FE2C:				; CODE XREF: CombatTarget_WeaponActionSubsystem+234j
		xor	ax, ax

loc_4FE2E:				; CODE XREF: CombatTarget_WeaponActionSubsystem+239j
		mov	ah, 0
		or	ax, ax
		jz	short loc_4FE59

loc_4FE34:
		mov	[bp+var_1A], 6
		mov	eax, dword_711CD

loc_4FE40:
		mov	[bp+var_1E], eax

loc_4FE44:
		push	51E2h

loc_4FE47:
		call	Config_ReadCalibration
		pop	cx
		mov	al, byte_722D1
		mov	ah, 0
		or	ax, ax
		jz	short loc_4FE59
		inc	[bp+var_15]

loc_4FE59:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FE16j
					; CombatTarget_WeaponActionSubsystem+241j ...
		mov	al, [bp+var_15]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4FE18
		push	51E2h
		call	Config_ReadCalibration
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_4FEAE
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_20], bx
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
		cmp	[bp+var_20], 0
		jnz	short loc_4FEAC
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short loc_4FEAE
; ���������������������������������������������������������������������������

loc_4FEAC:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2ADj
		jmp	short $+2

loc_4FEAE:				; CODE XREF: CombatTarget_WeaponActionSubsystem+31j
					; CombatTarget_WeaponActionSubsystem+64j ...
		cmp	byte_72DD7, 1
		jnz	short loc_4FEB9
		mov	al, 1
		jmp	short loc_4FEBB
; ���������������������������������������������������������������������������

loc_4FEB9:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2C2j
		mov	al, 0

loc_4FEBB:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2C6j
		or	al, al
		jz	short loc_4FF22
		cmp	byte_722D0, 1
		jnz	short loc_4FED6
		test	byte_722D3, 0Ch
		jz	short loc_4FED2
		mov	ax, 1
		jmp	short loc_4FED4
; ���������������������������������������������������������������������������

loc_4FED2:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2DAj
		xor	ax, ax

loc_4FED4:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2DFj
		jmp	short loc_4FEEB
; ���������������������������������������������������������������������������

loc_4FED6:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2D3j
		cmp	byte_72DF2, 1
		jz	short loc_4FEE4
		cmp	byte_72DFE, 1
		jnz	short loc_4FEE9

loc_4FEE4:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2EAj
		mov	ax, 1
		jmp	short loc_4FEEB
; ���������������������������������������������������������������������������

loc_4FEE9:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2F1j
		xor	ax, ax

loc_4FEEB:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FED4j
					; CombatTarget_WeaponActionSubsystem+2F6j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4FF22
		mov	eax, dword_72A69
		sar	eax, 1Fh
		and	ax, 1
		or	ax, ax
		jz	short loc_4FF22
		mov	[bp+var_C], 600h
		mov	eax, [bp+var_C]
		mov	dword_70468, eax
		mov	byte_7046C, 1
		push	2

loc_4FF17:
		push	59B0h
		call	Timer_SetRelativeFrames_4F9BB

loc_4FF1F:
		add	sp, 4

loc_4FF22:				; CODE XREF: CombatTarget_WeaponActionSubsystem+2CCj
					; CombatTarget_WeaponActionSubsystem+2FEj ...
		cmp	byte_72DD7, 1
		jnz	short loc_4FF2D
		mov	al, 1
		jmp	short loc_4FF2F
; ���������������������������������������������������������������������������

loc_4FF2D:				; CODE XREF: CombatTarget_WeaponActionSubsystem+336j
		mov	al, 0

loc_4FF2F:				; CODE XREF: CombatTarget_WeaponActionSubsystem+33Aj
		or	al, al

loc_4FF31:
		jz	short loc_4FF80

loc_4FF33:
		cmp	byte_722D0, 1
		jnz	short loc_4FF4A
		test	byte_722D3, 0Ch
		jz	short loc_4FF46
		mov	ax, 1
		jmp	short loc_4FF48
; ���������������������������������������������������������������������������

loc_4FF46:				; CODE XREF: CombatTarget_WeaponActionSubsystem+34Ej
		xor	ax, ax

loc_4FF48:				; CODE XREF: CombatTarget_WeaponActionSubsystem+353j
		jmp	short loc_4FF5F
; ���������������������������������������������������������������������������

loc_4FF4A:				; CODE XREF: CombatTarget_WeaponActionSubsystem+347j
		cmp	byte_72DF2, 1
		jz	short loc_4FF58
		cmp	byte_72DFE, 1
		jnz	short loc_4FF5D

loc_4FF58:				; CODE XREF: CombatTarget_WeaponActionSubsystem+35Ej
		mov	ax, 1
		jmp	short loc_4FF5F
; ���������������������������������������������������������������������������

loc_4FF5D:				; CODE XREF: CombatTarget_WeaponActionSubsystem+365j
		xor	ax, ax

loc_4FF5F:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FF48j
					; CombatTarget_WeaponActionSubsystem+36Aj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4FF80
		mov	eax, dword_72A69
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_4FF80
		mov	dword_72A65, 500h
		mov	byte_7046D, 1

loc_4FF80:				; CODE XREF: CombatTarget_WeaponActionSubsystem:loc_4FF31j
					; CombatTarget_WeaponActionSubsystem+372j ...
		cmp	byte_7046D, 0
		jz	short loc_4FFAE
		cmp	byte_7046C, 0
		jz	short loc_4FFAE
		sub	sp, 4
		mov	[bp+var_38], 0E1000h
		push	ds
		push	offset aTimeBurst ; "Time Burst"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		mov	byte_7046D, 0

loc_4FFAE:				; CODE XREF: CombatTarget_WeaponActionSubsystem+394j
					; CombatTarget_WeaponActionSubsystem+39Bj
		cmp	word_70466, 1
		jbe	short loc_5001C
		cmp	word_722E6, 0
		jz	short loc_5001C
		cmp	byte_6E4CF, 0
		jnz	short loc_4FFEC
		mov	bx, word_722E6
		push	word ptr [bx+51h]
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Physics_ApplyGroundHeightConstraint
		add	sp, 6
		cmp	[bp+var_10], 400h
		jle	short loc_4FFE6
		mov	ax, 1
		jmp	short loc_4FFE8
; ���������������������������������������������������������������������������

loc_4FFE6:				; CODE XREF: CombatTarget_WeaponActionSubsystem+3EEj
		xor	ax, ax

loc_4FFE8:				; CODE XREF: CombatTarget_WeaponActionSubsystem+3F3j
		or	al, al
		jz	short loc_5001C

loc_4FFEC:				; CODE XREF: CombatTarget_WeaponActionSubsystem+3D0j
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	dword_70468, eax
		mov	byte_7046C, 0
		mov	word_7046E, 1
		mov	byte_72B34, 0
		xor	eax, eax
		mov	dword_72B35, eax

loc_50013:
		mov	dword_72B39, eax
		mov	byte_72B41, 1

loc_5001C:				; CODE XREF: CombatTarget_WeaponActionSubsystem+3C2j
					; CombatTarget_WeaponActionSubsystem+3C9j ...
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72B96, eax
		push	59C3h
		call	WorldObjects_UpdateFrame_ResetCounters_221C2

loc_50031:
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72B9A, eax
		cmp	word_70466, 0
		jbe	short loc_5004B
		nop
		push	cs
		call	near ptr UIScreen_ReadNumericFields_500A6

loc_5004B:				; CODE XREF: CombatTarget_WeaponActionSubsystem+453j
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72B9E, eax
		push	59C3h
		call	Container_Op_22320
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72BA2, eax
		inc	word_70466
		push	ds
		push	offset word_72A94
		call	Text_TypewriterTimer
		add	sp, 4
		push	59CDh
		call	Mission_TriggerEvaluator
		pop	cx
		or	al, al
		jz	short loc_5009C
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72BA6, eax
		mov	[bp+var_1], 1

loc_5009C:				; CODE XREF: CombatTarget_WeaponActionSubsystem+498j
		call	RadioFlags_ShiftHistory

loc_500A1:				; CODE XREF: CombatTarget_WeaponActionSubsystem+17j
		mov	al, [bp+var_1]
		leave
		retf
CombatTarget_WeaponActionSubsystem	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit 3 champs numériques d'un widget (id 5A92h) via sub_27144 et les stocke dans
; dword_72BAA/72BAE/72BB2. Appelée uniquement par UIScreen_StateMachineMain. Hypothèse :
; formulaire de saisie de coordonnées — non vérifié.
; ==============================================================================================
UIScreen_ReadNumericFields_500A6	proc far		; CODE XREF: CombatTarget_WeaponActionSubsystem+457p
		push	bp
		mov	bp, sp
		push	5A92h
		call	Collision_ResetLinkPool
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72BAA, eax
		push	5A92h
		call	Collision_SelectCandidates
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72BAE, eax
		push	5A92h
		call	CollisionGrid_InitAroundPlayer
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72BB2, eax
		push	5A92h
		call	Collision_MainLoop
		pop	cx
		pop	bp
		retf
UIScreen_ReadNumericFields_500A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelée directement par STRIKE_EXE_MAIN_LOOP. Appelle d'abord
; TrackedObjects_CallSlot18OnActive_22F10 (liste 0x59CD), puis calcule le delta de temps de la
; frame (dword_70458), le plafonne (0x1900) et met à jour la variable de vitesse de jeu
; (dword_70468/70454/7045E). Anciennement UIScreen_ApplyFormFields (aucun formulaire dans ce
; corps).
; ==============================================================================================
Frame_UpdateTimingAndNotifyTrackedObjects_500F6	proc far		; CODE XREF: STRIKE_EXE_MAIN_LOOP:loc_538BAP
					; UIScript_ParseAndEvaluate_7A054+467P ...

var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= word ptr -4Ch
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 74h
		push	si
		push	59CDh
		call	TrackedObjects_CallSlot18OnActive_22F10
		pop	cx
		cmp	byte_70447, 0
		jnz	short loc_50110
		jmp	loc_503DA
; ���������������������������������������������������������������������������

loc_50110:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+15j
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+85j
		call	PIT_ReadHighPrecision
		mov	bx, ax
		cmp	bx, 1

loc_5011A:
		jge	short loc_50121
		mov	ax, 1
		jmp	short loc_50123
; ���������������������������������������������������������������������������

loc_50121:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6:loc_5011Aj
		mov	ax, bx

loc_50123:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+29j
		mov	word_7045C, ax
		mov	[bp+var_8], 177000h
		mov	[bp+var_A], ax

loc_50131:
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]

loc_50142:
		mov	edx, eax
		mov	ecx, [bp+var_E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		mov	[bp+var_4], eax
		mov	[bp+var_1A], 1900h
		cmp	eax, [bp+var_1A]
		jle	short loc_50177
		mov	ax, 1
		jmp	short loc_50179
; ���������������������������������������������������������������������������

loc_50177:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+7Aj
		xor	ax, ax

loc_50179:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+7Fj
		or	al, al
		jnz	short loc_50110
		mov	eax, dword_72A69
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_501C6
		mov	[bp+var_1E], 100h

loc_50192:
		mov	eax, [bp+var_1E]

loc_50196:
		mov	edx, eax

loc_50199:
		mov	ecx, [bp+var_4]

loc_5019D:
		sar	edx, 18h

loc_501A1:
		shl	eax, 8

loc_501A5:
		idiv	ecx
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	dword_70458, eax
		sub	dword_72A69, eax
		mov	eax, dword_72A69
		sar	eax, 1Fh
		inc	ax

loc_501C6:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+92j
		cmp	dword_70468, 100h
		jnz	short loc_501D6
		mov	ax, 1
		jmp	short loc_501D8
; ���������������������������������������������������������������������������

loc_501D6:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+D9j
		xor	ax, ax

loc_501D8:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+DEj
		or	al, al
		jz	short loc_501EC
		mov	al, byte_7046C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_501EC
		cmp	word_7046E, 1
		jz	short loc_501F3

loc_501EC:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+E4j
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+EDj
		cmp	byte_70497, 0
		jz	short loc_50230

loc_501F3:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+F4j
		mov	[bp+var_2A], 400h
		mov	eax, [bp+var_4]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2A]
		cmp	eax, [bp+var_2E]
		jle	short loc_50212
		mov	ax, 1
		jmp	short loc_50214
; ���������������������������������������������������������������������������

loc_50212:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+115j
		xor	ax, ax

loc_50214:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+11Aj
		or	al, al
		jz	short loc_5021D

loc_50218:
		lea	ax, [bp+var_2A]
		jmp	short loc_50220
; ���������������������������������������������������������������������������

loc_5021D:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+120j
		lea	ax, [bp+var_2E]

loc_50220:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+125j
		mov	si, ax

loc_50222:
		mov	eax, [si]

loc_50225:
		mov	[bp+var_32], eax
		mov	dword_70454, eax
		jmp	loc_50399
; ���������������������������������������������������������������������������

loc_50230:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+FBj
		cmp	byte_7046C, 0
		jz	short loc_50256

loc_50237:
		push	59B0h

loc_5023A:
		call	Timer_Tick_4F9E6
		pop	cx
		or	al, al
		jz	short loc_50256
		mov	[bp+var_36], 600h
		mov	eax, [bp+var_36]
		mov	dword_70468, eax
		jmp	short loc_50277
; ���������������������������������������������������������������������������

loc_50256:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+13Fj
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+14Cj
		cmp	byte_7046C, 0
		jz	short loc_50277
		mov	byte_7046C, 0
		mov	byte_72B34, 0
		xor	eax, eax
		mov	dword_72B35, eax
		mov	dword_72B39, eax
		mov	byte_72B41, 1

loc_50277:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+15Ej
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+165j
		mov	[bp+var_3A], 100h
		mov	eax, [bp+var_3A]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_50295:
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]

loc_5029D:
		mov	[bp+var_42], eax
		mov	dword_70458, eax
		sub	dword_72A65, eax
		mov	eax, dword_72A65
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_502C7
		mov	[bp+var_46], 4Ch ; 'L'
		mov	eax, [bp+var_46]
		mov	dword_72A69, eax

loc_502C7:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+1BFj
		cmp	word_7046E, 0
		jz	short loc_5031C
		mov	al, byte_7046C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5031C
		inc	word_70495
		cmp	word_70495, 0Ch
		jle	short loc_502E8
		mov	word_70495, 0

loc_502E8:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+1EAj
		cmp	word_70495, 0Ah
		jle	short loc_50301
		mov	[bp+var_4A], 100h
		mov	eax, [bp+var_4A]
		mov	dword_70468, eax
		jmp	short loc_5031C
; ���������������������������������������������������������������������������

loc_50301:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+1F7j
		mov	ax, word_7046E
		mov	[bp+var_4C], ax
		movsx	eax, [bp+var_4C]
		shl	eax, 8

loc_50310:
		mov	[bp+var_50], eax

loc_50314:
		mov	eax, [bp+var_50]
		mov	dword_70468, eax

loc_5031C:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+1D6j
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+1DFj ...
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, dword_70468
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	dword_70454, eax
		mov	[bp+var_5C], 200h
		cmp	eax, [bp+var_5C]
		jge	short loc_50356
		mov	ax, 1
		jmp	short loc_50358
; ���������������������������������������������������������������������������

loc_50356:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+259j
		xor	ax, ax

loc_50358:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+25Ej
		or	al, al
		jz	short loc_5036C
		mov	[bp+var_60], 200h
		mov	eax, [bp+var_60]
		mov	dword_70454, eax

loc_5036C:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+264j
		mov	[bp+var_64], 1900h
		mov	eax, dword_70454
		cmp	eax, [bp+var_64]
		jle	short loc_50383
		mov	ax, 1
		jmp	short loc_50385
; ���������������������������������������������������������������������������

loc_50383:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+286j
		xor	ax, ax

loc_50385:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+28Bj
		or	al, al
		jz	short loc_50399
		mov	[bp+var_68], 1900h

loc_50391:
		mov	eax, [bp+var_68]
		mov	dword_70454, eax

loc_50399:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+137j
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+291j
		mov	[bp+var_6C], 100h
		mov	eax, [bp+var_6C]
		mov	edx, eax
		mov	ecx, dword_70454
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	dword_70458, eax
		mov	eax, dword_70454
		mov	dword_70462, eax
		mov	eax, dword_70458
		mov	dword_7045E, eax
		jmp	short loc_503DF
; ���������������������������������������������������������������������������

loc_503DA:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+17j
		mov	byte_70447, 1

loc_503DF:				; CODE XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6+2E2j
		mov	dword_6E33D, 0
		pop	si
		leave
		retf
Frame_UpdateTimingAndNotifyTrackedObjects_500F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 294 lignes, NON DÉTAILLÉE — dépend de word_722E6 (même cluster de globales que
; UIScreen_StateMachineMain), gros calcul multi-champs (frame locale ~0x7A octets). Candidat
; pour session dédiée.
; ==============================================================================================
UIScreen_ComputeDerivedFields_503EB	proc far		; CODE XREF: WorldObjects_CallSlot4OnAllThenRecompute_2214F:loc_22163P

var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= word ptr -42h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 7Ah
		push	si
		push	di
		mov	dx, word_722E6
		or	dx, dx
		jnz	short loc_503FE
		jmp	loc_5064B
; ���������������������������������������������������������������������������

loc_503FE:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+Ej
		cmp	byte_70478, 0
		jnz	short loc_50408
		jmp	loc_5064B
; ���������������������������������������������������������������������������

loc_50408:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+18j
		cmp	dword_72B6F, 0
		jz	short loc_50415

loc_50410:
		mov	ax, 1
		jmp	short loc_50417
; ���������������������������������������������������������������������������

loc_50415:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+23j
		xor	ax, ax

loc_50417:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+28j
		or	ax, ax
		jnz	short loc_5041E
		jmp	loc_5064B
; ���������������������������������������������������������������������������

loc_5041E:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+2Ej
		mov	bx, dx
		les	bx, [bx+5Ah]
		mov	di, es:[bx+0Dh]
		or	di, di
		jnz	short loc_5042E
		jmp	loc_5064B
; ���������������������������������������������������������������������������

loc_5042E:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+3Ej
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		sub	eax, dword_7220A
		mov	[bp+var_6E], eax
		mov	eax, [si+4]
		sub	eax, dword_7220E
		mov	[bp+var_6A], eax
		mov	eax, [si+8]
		sub	eax, dword_72212
		mov	[bp+var_66], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_5A], eax
		mov	ax, word_70466
		mov	bx, 6
		xor	dx, dx
		div	bx
		mov	[bp+var_2], dx
		mov	ax, [bp+var_2]

loc_50499:
		mov	word_72B69, ax
		push	5166h
		lea	ax, [bp+var_62]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	eax, [bp+var_5E]
		cmp	eax, dword_721F6
		jle	short loc_504BB
		mov	ax, 1
		jmp	short loc_504BD
; ���������������������������������������������������������������������������

loc_504BB:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+C9j
		xor	ax, ax

loc_504BD:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+CEj
		or	al, al
		jnz	short loc_504C4
		jmp	loc_5064B
; ���������������������������������������������������������������������������

loc_504C4:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+D4j
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		mov	si, di
		add	si, 20h	; ' '
		mov	eax, [bp+var_5E]
		sub	eax, [si]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_12]
		jle	short loc_504F7
		mov	ax, 1
		jmp	short loc_504F9
; ���������������������������������������������������������������������������

loc_504F7:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+105j
		xor	ax, ax

loc_504F9:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+10Aj
		or	al, al
		jz	short loc_50502
		lea	ax, [bp+var_A]
		jmp	short loc_50505
; ���������������������������������������������������������������������������

loc_50502:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+110j
		lea	ax, [bp+var_12]

loc_50505:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+115j
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax

loc_50512:
		mov	eax, [bp+var_1A]
		mov	dword_72B65, eax
		mov	eax, [bp+var_62]
		mov	[bp+var_1E], eax

loc_50522:
		mov	eax, [bp+var_5E]
		mov	[bp+var_22], eax
		mov	ax, word_721FE
		mov	[bp+var_24], ax

loc_50530:
		push	large [bp+var_22]

loc_50534:
		push	large [dword_72202]
		push	large [bp+var_1E]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		movsx	eax, [bp+var_24]
		shl	eax, 8
		mov	edx, [bp+var_2C]
		add	edx, eax
		mov	[bp+var_30], edx
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		sar	eax, 8
		mov	[bp+var_38], eax
		cmp	[bp+var_38], 7D00h
		jle	short loc_50589
		mov	[bp+var_38], 7D00h
		jmp	short loc_5059D
; ���������������������������������������������������������������������������

loc_50589:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+192j
		cmp	[bp+var_38], 0FFFF8300h
		jge	short loc_5059D

loc_50593:
		mov	[bp+var_38], 0FFFF8300h
		jmp	short $+2

loc_5059D:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+19Cj
					; UIScreen_ComputeDerivedFields_503EB+1A6j
		mov	ax, word ptr [bp+var_38]
		dec	ax

loc_505A1:
		mov	word_72B6B, ax

loc_505A4:
		mov	eax, [bp+var_5A]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_40], eax
		mov	ax, word_72200
		mov	[bp+var_42], ax
		push	large [bp+var_40]
		push	large [dword_72206]
		push	large [bp+var_3C]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		movsx	eax, [bp+var_42]
		shl	eax, 8
		sub	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		sar	eax, 8
		mov	[bp+var_56], eax
		cmp	[bp+var_56], 7D00h
		jle	short loc_5060C
		mov	[bp+var_56], 7D00h
		jmp	short loc_50620
; ���������������������������������������������������������������������������

loc_5060C:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+215j
		cmp	[bp+var_56], 0FFFF8300h
		jge	short loc_50620

loc_50616:
		mov	[bp+var_56], 0FFFF8300h
		jmp	short $+2

loc_50620:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+21Fj
					; UIScreen_ComputeDerivedFields_503EB+229j
		mov	ax, word ptr [bp+var_56]
		dec	ax
		mov	word_72B6D, ax
		mov	ax, word_724AC
		cmp	ax, word_724AA
		jge	short loc_5064B
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE

loc_5063E:
		add	bx, ax

loc_50640:
		mov	word ptr es:[bx+2], ds

loc_50644:
		mov	word ptr es:[bx], 5AB3h
		jmp	short $+2

loc_5064B:				; CODE XREF: UIScreen_ComputeDerivedFields_503EB+10j
					; UIScreen_ComputeDerivedFields_503EB+1Aj ...
		mov	byte_70478, 1
		pop	di
		pop	si
		leave
		retf
UIScreen_ComputeDerivedFields_503EB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe fine transmettant 2 arguments + id widget 59CDh à sub_23241 (probable setter
; générique de valeur de widget).
; ==============================================================================================
UIScreen_SetWidgetValue_50654	proc far		; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+2DEP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	59CDh
		call	Radar_TargetTypeFilter
		add	sp, 6
		pop	bp
		retf
UIScreen_SetWidgetValue_50654	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), initialise une quinzaine de globales du
; cluster (dword_70448 et suivantes) avec des valeurs par défaut en virgule fixe 8.8 —
; probable constructeur/reset de l'écran.
; ==============================================================================================
UIScreen_InitDefaultParams_5066A:				; DATA XREF: seg339:off_71F02o
		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		mov	dword_70448, eax
		mov	dword ptr [bp-8], 100h
		mov	eax, [bp-8]
		mov	dword_7044C, eax

loc_50691:
		mov	dword ptr [bp-0Ch], 347h
		mov	dword ptr [bp-10h], 100h
		mov	eax, [bp-0Ch]
		mov	edx, eax
		mov	ecx, [bp-10h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	dword_70450, eax
		mov	dword ptr [bp-18h], 0F00h
		mov	eax, [bp-18h]
		mov	dword_70454, eax
		mov	dword ptr [bp-1Ch], 0F00h
		mov	dword ptr [bp-20h], 100h
		mov	eax, [bp-20h]
		mov	edx, eax
		mov	ecx, [bp-1Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		mov	[bp-28h], eax
		shl	eax, 8
		mov	[bp-2Ch], eax
		mov	[bp-30h], eax
		sar	eax, 8
		mov	[bp-34h], eax
		mov	[bp-38h], eax
		mov	dword_70458, eax
		mov	dword ptr [bp-3Ch], 100h
		mov	dword ptr [bp-40h], 0F00h
		mov	dword ptr [bp-44h], 100h

loc_50739:
		mov	eax, [bp-44h]
		mov	edx, eax

loc_50740:
		mov	ecx, [bp-40h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-48h], eax
		mov	eax, [bp-48h]
		mov	[bp-4Ch], eax
		shl	eax, 8
		mov	[bp-50h], eax
		mov	[bp-54h], eax
		sar	eax, 8
		mov	[bp-58h], eax
		mov	[bp-5Ch], eax
		mov	eax, [bp-3Ch]
		mov	edx, [bp-5Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-60h], eax
		mov	eax, [bp-60h]
		mov	dword_7045E, eax

loc_5078F:
		mov	dword ptr [bp-64h], 100h
		mov	dword ptr [bp-68h], 0F00h
		mov	dword ptr [bp-6Ch], 100h
		mov	eax, [bp-6Ch]
		mov	edx, eax
		mov	ecx, [bp-68h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-70h], eax
		mov	eax, [bp-70h]
		mov	[bp-74h], eax
		shl	eax, 8
		mov	[bp-78h], eax
		mov	[bp-7Ch], eax
		sar	eax, 8
		mov	[bp-80h], eax
		mov	[bp-84h], eax
		mov	eax, [bp-64h]
		mov	edx, [bp-84h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-88h], eax
		mov	eax, [bp-88h]
		mov	[bp-8Ch], eax
		mov	dword ptr [bp-90h], 100h
		mov	eax, [bp-90h]
		mov	edx, eax
		mov	ecx, [bp-8Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-94h], eax
		mov	eax, [bp-94h]
		mov	dword_70462, eax

loc_50831:
		mov	dword ptr [bp-98h], 100h

loc_5083A:
		mov	eax, [bp-98h]

loc_5083F:
		mov	dword_70468, eax

loc_50843:
		mov	dword ptr [bp-9Ch], 0
		mov	eax, [bp-9Ch]
		mov	dword_72A60, eax
		mov	dword_72A65, 0
		mov	dword_72A69, 0
		mov	word_72A6D, 0
		push	59C3h
		call	Container_ConstructAlloc
		pop	cx
		push	59CDh
		call	EntityTracker_Construct
		pop	cx
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AED5
		add	sp, 4
		push	5A92h
		call	Collision_InstallExceptionHandler

loc_50893:
		pop	cx
		push	5A92h
		call	Collision_ResetLinkPool
		pop	cx
		mov	word_72B4A, 75Ch

loc_508A3:
		xor	ax, ax
		mov	word_72B4E, ax
		mov	word_72B4C, ax
		mov	word_72B4A, 178Ah
		push	5A9Ah
		call	ProgressBar_InitFull
		pop	cx
		mov	word_72B63, 11E8h
		mov	word_72B63, 1892h
		mov	dword_72B6F, 0
		mov	byte_72B73, 2
		mov	byte_72B74, 0
		mov	dword_72B75, 0
		mov	word_72B69, 0
		mov	dword ptr [bp-0A0h], 347h
		mov	eax, [bp-0A0h]
		mov	dword_70485, eax
		mov	dword_70489, 73C00h
		mov	dword ptr [bp-0A4h], 1F1h
		mov	eax, [bp-0A4h]

loc_50911:
		mov	dword_7048D, eax

loc_50915:
		mov	dword_70491, 15700h
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), nettoie/ferme l'écran : libère un bloc alloué
; (dword_72B6F via sub_5C7B6), réinitialise les globales du cluster, cache/réinitialise les
; widgets 5A9Ah/5A92h.
; ==============================================================================================
UIScreen_Close_50920:				; DATA XREF: seg339:off_71FD4o
		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	byte_72B74, 0
		jz	short loc_50954
		cmp	dword_72B6F, 0
		jz	short loc_50954
		push	0
		mov	al, byte_72B73
		push	ax
		mov	eax, dword_72B6F
		mov	[bp-4],	eax

loc_50943:
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_50954:				; CODE XREF: seg112:0D3Bj seg112:0D43j
		mov	dword_72B6F, 0
		mov	byte_72B74, 0
		mov	dword_72B75, 0
		push	2
		push	5A9Ah
		call	Collection_Destruct
		add	sp, 4
		push	5A92h
		call	Collision_DestructDescriptor
		pop	cx
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEDA
		add	sp, 4
		cmp	byte_72A9F, 0

loc_50992:
		jz	short loc_509BB

loc_50994:
		cmp	dword_72A9A, 0
		jz	short loc_509BB

loc_5099C:
		push	0
		mov	al, byte_72A9E
		push	ax
		mov	eax, dword_72A9A
		mov	[bp-8],	eax
		lea	ax, [bp-8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_509BB:				; CODE XREF: seg112:loc_50992j
					; seg112:0DAAj
		mov	dword_72A9A, 0
		mov	byte_72A9F, 0
		mov	dword_72AA0, 0
		push	2
		push	59CDh
		call	EntityTracker_Destruct
		add	sp, 4

loc_509DF:
		push	2
		push	59C3h
		call	Container_Destruct
		add	sp, 4
		leave
		retf
seg112		ends
