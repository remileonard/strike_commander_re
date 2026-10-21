seg155		segment	byte public 'CODE' use16
		assume cs:seg155
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		push	si

loc_3DF55:				; DATA XREF: seg170:05AEo
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_3DF6A
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3DF81

loc_3DF6A:				; CODE XREF: seg155:000Aj
		push	si
		call	OptionCounter_Construct_3F5C8
		pop	cx
		push	word ptr [bp+0Ch]
		push	large dword ptr	[bp+8]
		push	si
		nop
		push	cs
		call	near ptr ConfigOption_ConstructFull_3DF86
		add	sp, 8

loc_3DF81:				; CODE XREF: seg155:0018j
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_ConstructFull_66762 (sub_66762 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67DEA, sub_67662 et Runtime_FatalErrorHandlerWithTag (sub_5F700, seg160) —
; finalise la construction d'une option de configuration.
; ==============================================================================================
ConfigOption_ConstructFull_3DF86	proc far		; CODE XREF: seg155:002Bp

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_47A24
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3DFDE
		cmp	[bp+arg_2], 0
		jz	short loc_3DFD9
		mov	eax, [bp+arg_2]
		mov	dword_47A25, eax
		mov	ax, [bp+arg_6]
		mov	word_47A29, ax
		push	0FFFFh
		call	OptionCounter_Set_3F60E
		pop	cx
		push	large 14h
		push	seg seg155
		push	offset loc_3E02D
		push	67A2h
		call	Stopwatch_RegisterTickModuleVariant_3EE86
		add	sp, 0Ah
		mov	word_47A2E, ax
		cmp	word_47A2E, 0FFFFh
		jnz	short loc_3DFD9
		push	4A13h
		call	sub_310B
		pop	cx

loc_3DFD9:				; CODE XREF: ConfigOption_ConstructFull_3DF86+14j
					; ConfigOption_ConstructFull_3DF86+48j
		mov	byte_47A24, 1

loc_3DFDE:				; CODE XREF: ConfigOption_ConstructFull_3DF86+Dj
		pop	bp
		retf
ConfigOption_ConstructFull_3DF86	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3E029
		cmp	byte_47A24, 0
		jz	short loc_3E011
		cmp	word_47A2E, 0FFFFh
		jz	short loc_3E00C
		push	word_47A2E
		push	67A2h
		call	Stopwatch_UnregisterTickModule_3EEC3
		add	sp, 4

loc_3E00C:				; CODE XREF: seg155:00ABj
		mov	byte_47A24, 0

loc_3E011:				; CODE XREF: seg155:00A4j
		push	0
		push	si
		call	sub_3F5EA
		add	sp, 4
		test	di, 1
		jz	short loc_3E029
		push	si
		call	sub_308
		pop	cx

loc_3E029:				; CODE XREF: seg155:009Dj seg155:00D0j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3E02D:				; DATA XREF: ConfigOption_ConstructFull_3DF86+32o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		call	Joystick_ReadButtonsWrapper_3F12A
		mov	si, ax
		cmp	si, word_47A30
		jz	short loc_3E0BF
		mov	ax, word_47A30
		xor	ax, si
		mov	[bp-2],	ax
		cmp	byte_47A32, 0
		jnz	short loc_3E064
		inc	byte_47A32
		mov	word_49708, 0
		mov	byte_4970A, 0
		mov	byte_4970B, 0

loc_3E064:				; CODE XREF: seg155:00FEj
		push	66ECh
		call	Joystick_FormatCalibrationDisplay_3F35E
		pop	cx
		mov	dl, 0
		mov	bl, 1
		jmp	short loc_3E0A8
; ���������������������������������������������������������������������������

loc_3E073:				; CODE XREF: seg155:015Bj
		mov	al, bl
		mov	ah, 0
		test	[bp-2],	ax
		jz	short loc_3E0A4
		mov	word_49708, 1
		mov	al, bl
		mov	ah, 0
		test	word_47A30, ax
		jz	short loc_3E092
		mov	word_49708, 2

loc_3E092:				; CODE XREF: seg155:013Aj
		mov	al, dl
		mov	ah, 0
		sar	ax, 1
		mov	byte_4970A, al
		mov	al, dl
		and	al, 1
		mov	byte_4970B, al
		jmp	short loc_3E0AD
; ���������������������������������������������������������������������������

loc_3E0A4:				; CODE XREF: seg155:012Aj
		inc	dl
		shl	bl, 1

loc_3E0A8:				; CODE XREF: seg155:0121j
		cmp	dl, 4
		jb	short loc_3E073

loc_3E0AD:				; CODE XREF: seg155:0152j
		mov	ax, word_497D2
		test	word_49708, ax
		jz	short loc_3E0BF
		push	66E8h
		nop
		push	cs
		call	near ptr ConfigOption_FormatValue_3E0C6
		pop	cx

loc_3E0BF:				; CODE XREF: seg155:00EFj seg155:0164j
		mov	word_47A30, si
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ConfigOption_FormatValue_668A2 (sub_668A2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, formate une valeur (sub_3FD). Appelée par
; ConfigOption_ApplyAndDisplay_66809.
; ==============================================================================================
ConfigOption_FormatValue_3E0C6	proc far		; CODE XREF: seg155:016Bp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_47A2D
		mov	ah, 0
		cmp	ax, word_47A29
		jnb	short loc_3E11E
		mov	ax, word_497D2
		test	[si], ax
		jz	short loc_3E11E
		mov	al, byte_47A2D
		inc	al
		mov	byte_47A2D, al
		mov	al, byte_47A2C
		mov	ah, 0
		shl	ax, 4
		mov	dx, word ptr dword_47A25+2
		push	ax
		mov	ax, word ptr dword_47A25
		pop	bx
		add	ax, bx
		push	dx
		push	ax
		push	ds
		push	si
		mov	cx, 10h
		call	CRT_Fmemcpy
		inc	byte_47A2C
		mov	al, byte_47A2C
		mov	ah, 0
		cmp	ax, word_47A29
		jb	short loc_3E11A
		mov	byte_47A2C, 0

loc_3E11A:				; CODE XREF: ConfigOption_FormatValue_3E0C6+4Dj
		mov	al, 1
		jmp	short loc_3E120
; ���������������������������������������������������������������������������

loc_3E11E:				; CODE XREF: ConfigOption_FormatValue_3E0C6+10j
					; ConfigOption_FormatValue_3E0C6+17j
		mov	al, 0

loc_3E120:				; CODE XREF: ConfigOption_FormatValue_3E0C6+56j
		pop	si
		pop	bp
		retf
ConfigOption_FormatValue_3E0C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ConfigOption_FormatValueB_668FF (sub_668FF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, formate une valeur (sub_3FD). Appelée par
; loc_66A4F (thunk d'ajustement).
; ==============================================================================================
ConfigOption_FormatValueB_3E123	proc far		; CODE XREF: ConfigOption_Dispatch_3E273+11p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	byte_47A2D, 0
		jz	short loc_3E16D
		mov	al, byte_47A2D
		add	al, 0FFh
		mov	byte_47A2D, al
		push	ds
		push	bx
		mov	al, byte_47A2B
		mov	ah, 0
		shl	ax, 4
		mov	dx, word ptr dword_47A25
		add	dx, ax
		push	word ptr dword_47A25+2
		push	dx
		mov	cx, 10h
		call	CRT_Fmemcpy
		inc	byte_47A2B
		mov	al, byte_47A2B
		mov	ah, 0
		cmp	ax, word_47A29
		jb	short loc_3E169
		mov	byte_47A2B, 0

loc_3E169:				; CODE XREF: ConfigOption_FormatValueB_3E123+3Fj
		mov	al, 1
		jmp	short loc_3E16F
; ���������������������������������������������������������������������������

loc_3E16D:				; CODE XREF: ConfigOption_FormatValueB_3E123+Bj
		mov	al, 0

loc_3E16F:				; CODE XREF: ConfigOption_FormatValueB_3E123+48j
		pop	bp
		retf
ConfigOption_FormatValueB_3E123	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_3E18A
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3E197

loc_3E18A:				; CODE XREF: seg155:022Aj
		push	si
		call	Joystick_ReadAndScaleAxes_3F059
		pop	cx
		mov	word_49706, 0Ah

loc_3E197:				; CODE XREF: seg155:0238j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		or	dx, dx
		jge	short loc_3E1AF
		mov	ax, dx
		neg	ax
		jmp	short loc_3E1B1
; ���������������������������������������������������������������������������

loc_3E1AF:				; CODE XREF: seg155:0257j
		mov	ax, dx

loc_3E1B1:				; CODE XREF: seg155:025Dj
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_ApplyAndDisplayB_6698F (sub_6698F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 131 lignes, NON DÉTAILLÉE — combine sub_67B3A, sub_2FD (×2) et sub_3FD (×2). Appelée par
; sub_66A4F.
; ==============================================================================================
ConfigOption_ApplyAndDisplayB_3E1B3	proc far		; CODE XREF: ConfigOption_Dispatch_3E273+22p

var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 12h
		lea	ax, [bp+var_12]
		push	ax
		call	Joystick_FormatCalibrationDisplay_3F35E
		pop	cx
		mov	[bp+var_2], 0
		jmp	loc_3E25A
; ���������������������������������������������������������������������������

loc_3E1CB:				; CODE XREF: ConfigOption_ApplyAndDisplayB_3E1B3+ADj
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, 6
		mov	bx, [bp+var_2]
		imul	bx, 6
		lea	dx, [bp+var_12]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+66DAh]
		push	dx
		call	CRT_Abs16_2CD
		pop	cx
		mov	[bp+var_4], ax
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, 6
		mov	bx, [bp+var_2]
		imul	bx, 6
		lea	dx, [bp+var_10]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+66DCh]
		push	dx
		call	CRT_Abs16_2CD
		pop	cx
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		cmp	ax, word_49706
		ja	short loc_3E227
		mov	ax, [bp+var_6]
		cmp	ax, word_49706
		jbe	short loc_3E257

loc_3E227:				; CODE XREF: ConfigOption_ApplyAndDisplayB_3E1B3+69j
		mov	word_496F6, 4
		mov	al, byte ptr [bp+var_2]
		mov	byte_496F8, al
		push	ds
		push	offset unk_496FA
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		mov	cx, 6
		call	CRT_Fmemcpy
		push	ds
		push	offset unk_49700
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		mov	cx, 6
		call	CRT_Fmemcpy
		jmp	short loc_3E263
; ���������������������������������������������������������������������������

loc_3E257:				; CODE XREF: ConfigOption_ApplyAndDisplayB_3E1B3+72j
		inc	[bp+var_2]

loc_3E25A:				; CODE XREF: ConfigOption_ApplyAndDisplayB_3E1B3+15j
		cmp	[bp+var_2], 2
		jge	short loc_3E263
		jmp	loc_3E1CB
; ���������������������������������������������������������������������������

loc_3E263:				; CODE XREF: ConfigOption_ApplyAndDisplayB_3E1B3+A2j
					; ConfigOption_ApplyAndDisplayB_3E1B3+ABj
		cmp	word_496F6, 4
		jnz	short loc_3E26F
		mov	ax, 1
		jmp	short locret_3E271
; ���������������������������������������������������������������������������

loc_3E26F:				; CODE XREF: ConfigOption_ApplyAndDisplayB_3E1B3+B5j
		xor	ax, ax

locret_3E271:				; CODE XREF: ConfigOption_ApplyAndDisplayB_3E1B3+BAj
		leave
		retf
ConfigOption_ApplyAndDisplayB_3E1B3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_Dispatch_66A4F (sub_66A4F de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; ConfigOption_FormatValueB_668FF et ConfigOption_ApplyAndDisplayB_6698F. Appelée par le thunk
; suivant.
; ==============================================================================================
ConfigOption_Dispatch_3E273	proc far		; CODE XREF: seg155:0361p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_496F6, 0

loc_3E280:				; CODE XREF: ConfigOption_Dispatch_3E273+2Bj
		push	66D6h
		push	cs
		call	near ptr ConfigOption_FormatValueB_3E123
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E29A
		test	si, 4
		jz	short loc_3E2A0
		push	cs
		call	near ptr ConfigOption_ApplyAndDisplayB_3E1B3
		jmp	short loc_3E2A0
; ���������������������������������������������������������������������������

loc_3E29A:				; CODE XREF: ConfigOption_Dispatch_3E273+19j
		test	word_496F6, si
		jz	short loc_3E280

loc_3E2A0:				; CODE XREF: ConfigOption_Dispatch_3E273+1Fj
					; ConfigOption_Dispatch_3E273+25j
		mov	ax, 66D6h
		pop	si
		pop	bp
		retf
ConfigOption_Dispatch_3E273	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	cs
		call	near ptr ConfigOption_Dispatch_3E273
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset word_496F6
		mov	cx, 10h
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 66D6h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3E2D3:				; DATA XREF: dseg:5952o
		push	bp
		mov	bp, sp
		mov	word_496F6, 0
		mov	byte_496F8, 0
		mov	byte_496F9, 0
		pop	bp
		retf
seg155		ends
