seg201		segment	byte public 'CODE' use16
		assume cs:seg201
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216) — constructeur : alloue (sub_658, 1 octet),
; initialise via sub_67DA4 puis délègue à ConfigOption_ConstructFull_66762.
; ==============================================================================================
ConfigOption_Construct_6672D:
		push	bp
		mov	bp, sp

loc_66730:
		push	si

loc_66731:
		mov	si, [bp+6]

loc_66734:
		or	si, si

loc_66736:
		jnz	short loc_66746
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax

loc_66744:
		jz	short loc_6675D

loc_66746:				; CODE XREF: seg201:loc_66736j
		push	si
		call	OptionCounter_Construct_67DA4
		pop	cx
		push	word ptr [bp+0Ch]
		push	large dword ptr	[bp+8]
		push	si
		nop
		push	cs
		call	near ptr ConfigOption_ConstructFull_66762
		add	sp, 8

loc_6675D:				; CODE XREF: seg201:loc_66744j
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_67DEA, sub_67662 et Runtime_FatalErrorHandlerWithTag (sub_5F700, seg160) —
; finalise la construction d'une option de configuration.
; ==============================================================================================
ConfigOption_ConstructFull_66762	proc far		; CODE XREF: seg201:0037p

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_71136
		mov	ah, 0
		or	ax, ax
		jnz	short loc_667BA
		cmp	[bp+arg_2], 0
		jz	short loc_667B5
		mov	eax, [bp+arg_2]
		mov	dword_71137, eax
		mov	ax, [bp+arg_6]
		mov	word_7113B, ax
		push	0FFFFh
		call	OptionCounter_Set_67DEA
		pop	cx
		push	large 14h

loc_66791:
		push	seg seg201

loc_66794:
		push	offset ConfigOption_ApplyAndDisplay_66809
		push	5DC2h
		call	Stopwatch_RegisterTickModuleVariant_67662
		add	sp, 0Ah

loc_667A2:
		mov	word_71140, ax

loc_667A5:
		cmp	word_71140, 0FFFFh
		jnz	short loc_667B5

loc_667AC:
		push	4095h

loc_667AF:
		call	Runtime_FatalErrorHandler_5F700
		pop	cx

loc_667B5:				; CODE XREF: ConfigOption_ConstructFull_66762+14j
					; ConfigOption_ConstructFull_66762+48j
		mov	byte_71136, 1

loc_667BA:				; CODE XREF: ConfigOption_ConstructFull_66762+Dj
		pop	bp
		retf
ConfigOption_ConstructFull_66762	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di

loc_667C1:
		mov	si, [bp+6]

loc_667C4:
		mov	di, [bp+8]
		or	si, si
		jz	short loc_66805
		cmp	byte_71136, 0
		jz	short loc_667ED

loc_667D2:
		cmp	word_71140, 0FFFFh
		jz	short loc_667E8
		push	word_71140
		push	5DC2h

loc_667E0:
		call	Stopwatch_UnregisterTickModule_6769F

loc_667E5:
		add	sp, 4

loc_667E8:				; CODE XREF: seg201:00B7j
		mov	byte_71136, 0

loc_667ED:				; CODE XREF: seg201:00B0j
		push	0
		push	si

loc_667F0:
		call	OptionCounter_Destruct_67DC6
		add	sp, 4
		test	di, 1
		jz	short loc_66805
		push	si

loc_667FF:
		call	CRT_FreeNear_Wrap

loc_66804:
		pop	cx

loc_66805:				; CODE XREF: seg201:00A9j seg201:00DCj
		pop	di
		pop	si

loc_66807:
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; ⚠️ far, 109 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216), combine
; sub_67906, sub_67B3A et ConfigOption_FormatValue_668A2.
; ==============================================================================================
ConfigOption_ApplyAndDisplay_66809:				; DATA XREF: ConfigOption_ConstructFull_66762:loc_66794o
		push	bp
		mov	bp, sp
		sub	sp, 2

loc_6680F:
		push	si
		call	Joystick_ReadButtonsWrapper_67906
		mov	si, ax
		cmp	si, word_71142
		jz	short loc_6689B
		mov	ax, word_71142
		xor	ax, si
		mov	[bp-2],	ax

loc_66825:
		cmp	byte_71144, 0
		jnz	short loc_66840

loc_6682C:
		inc	byte_71144
		mov	word_72DB8, 0
		mov	byte_72DBA, 0
		mov	byte_72DBB, 0

loc_66840:				; CODE XREF: seg201:010Aj
		push	5D0Ch

loc_66843:
		call	Joystick_FormatCalibrationDisplay_67B3A
		pop	cx
		mov	dl, 0
		mov	bl, 1
		jmp	short loc_66884
; ���������������������������������������������������������������������������

loc_6684F:				; CODE XREF: seg201:0167j
		mov	al, bl

loc_66851:
		mov	ah, 0

loc_66853:
		test	[bp-2],	ax

loc_66856:
		jz	short loc_66880

loc_66858:
		mov	word_72DB8, 1

loc_6685E:
		mov	al, bl

loc_66860:
		mov	ah, 0

loc_66862:
		test	word_71142, ax

loc_66866:
		jz	short loc_6686E
		mov	word_72DB8, 2

loc_6686E:				; CODE XREF: seg201:loc_66866j
		mov	al, dl
		mov	ah, 0
		sar	ax, 1
		mov	byte_72DBA, al
		mov	al, dl
		and	al, 1
		mov	byte_72DBB, al
		jmp	short loc_66889
; ���������������������������������������������������������������������������

loc_66880:				; CODE XREF: seg201:loc_66856j
		inc	dl
		shl	bl, 1

loc_66884:				; CODE XREF: seg201:012Dj
		cmp	dl, 4
		jb	short loc_6684F

loc_66889:				; CODE XREF: seg201:015Ej
		mov	ax, word_72E82
		test	word_72DB8, ax
		jz	short loc_6689B

loc_66892:
		push	5D08h
		nop
		push	cs

loc_66897:
		call	near ptr ConfigOption_FormatValue_668A2
		pop	cx

loc_6689B:				; CODE XREF: seg201:00FBj seg201:0170j
		mov	word_71142, si

loc_6689F:
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, formate une valeur (sub_3FD). Appelée par ConfigOption_ApplyAndDisplay_66809.
; ==============================================================================================
ConfigOption_FormatValue_668A2	proc far		; CODE XREF: seg201:loc_66897p

arg_0		= word ptr  6

		push	bp

loc_668A3:
		mov	bp, sp

loc_668A5:
		push	si

loc_668A6:
		mov	si, [bp+arg_0]
		mov	al, byte_7113F

loc_668AC:
		mov	ah, 0

loc_668AE:
		cmp	ax, word_7113B
		jnb	short loc_668FA

loc_668B4:
		mov	ax, word_72E82
		test	[si], ax
		jz	short loc_668FA
		mov	al, byte_7113F
		inc	al
		mov	byte_7113F, al
		mov	al, byte_7113E
		mov	ah, 0
		shl	ax, 4
		mov	dx, word ptr dword_71137+2

loc_668CF:
		push	ax
		mov	ax, word ptr dword_71137

loc_668D3:
		pop	bx

loc_668D4:
		add	ax, bx
		push	dx
		push	ax

loc_668D8:
		push	ds
		push	si
		mov	cx, 10h

loc_668DD:
		call	CRT_Fmemcpy
		inc	byte_7113E
		mov	al, byte_7113E
		mov	ah, 0
		cmp	ax, word_7113B
		jb	short loc_668F6

loc_668F1:
		mov	byte_7113E, 0

loc_668F6:				; CODE XREF: ConfigOption_FormatValue_668A2+4Dj
		mov	al, 1

loc_668F8:
		jmp	short loc_668FC
; ���������������������������������������������������������������������������

loc_668FA:				; CODE XREF: ConfigOption_FormatValue_668A2+10j
					; ConfigOption_FormatValue_668A2+17j
		mov	al, 0

loc_668FC:				; CODE XREF: ConfigOption_FormatValue_668A2:loc_668F8j
		pop	si
		pop	bp

locret_668FE:
		retf
ConfigOption_FormatValue_668A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, formate une valeur (sub_3FD). Appelée par loc_66A4F (thunk d'ajustement).
; ==============================================================================================
ConfigOption_FormatValueB_668FF	proc far		; CODE XREF: ConfigOption_Dispatch_66A4F+11p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_66902:
		mov	bx, [bp+arg_0]
		cmp	byte_7113F, 0
		jz	short loc_66949

loc_6690C:
		mov	al, byte_7113F
		add	al, 0FFh

loc_66911:
		mov	byte_7113F, al
		push	ds
		push	bx

loc_66916:
		mov	al, byte_7113D
		mov	ah, 0
		shl	ax, 4
		mov	dx, word ptr dword_71137

loc_66922:
		add	dx, ax

loc_66924:
		push	word ptr dword_71137+2
		push	dx
		mov	cx, 10h

loc_6692C:
		call	CRT_Fmemcpy
		inc	byte_7113D
		mov	al, byte_7113D
		mov	ah, 0
		cmp	ax, word_7113B
		jb	short loc_66945

loc_66940:
		mov	byte_7113D, 0

loc_66945:				; CODE XREF: ConfigOption_FormatValueB_668FF+3Fj
		mov	al, 1
		jmp	short loc_6694B
; ���������������������������������������������������������������������������

loc_66949:				; CODE XREF: ConfigOption_FormatValueB_668FF+Bj
		mov	al, 0

loc_6694B:				; CODE XREF: ConfigOption_FormatValueB_668FF+48j
		pop	bp

locret_6694C:
		retf
ConfigOption_FormatValueB_668FF	endp

; ���������������������������������������������������������������������������

loc_6694D:
		push	bp
		mov	bp, sp

loc_66950:
		push	si

loc_66951:
		mov	si, [bp+6]

loc_66954:
		or	si, si

loc_66956:
		jnz	short loc_66966
		push	1
		call	CRT_Malloc16_Retry

loc_6695F:
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66973

loc_66966:				; CODE XREF: seg201:loc_66956j
		push	si
		call	Joystick_ReadAndScaleAxes_67835
		pop	cx
		mov	word_72DB6, 0Ah

loc_66973:				; CODE XREF: seg201:0244j
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
		jge	short loc_6698B
		mov	ax, dx
		neg	ax
		jmp	short loc_6698D
; ���������������������������������������������������������������������������

loc_6698B:				; CODE XREF: seg201:0263j
		mov	ax, dx

loc_6698D:				; CODE XREF: seg201:0269j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 131 lignes, NON DÉTAILLÉE — combine sub_67B3A, sub_2FD (×2) et sub_3FD (×2). Appelée
; par sub_66A4F.
; ==============================================================================================
ConfigOption_ApplyAndDisplayB_6698F	proc far		; CODE XREF: ConfigOption_Dispatch_66A4F+22p

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

loc_66999:
		call	Joystick_FormatCalibrationDisplay_67B3A
		pop	cx

loc_6699F:
		mov	[bp+var_2], 0

loc_669A4:
		jmp	loc_66A36
; ���������������������������������������������������������������������������

loc_669A7:				; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F+ADj
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, 6
		mov	bx, [bp+var_2]

loc_669B2:
		imul	bx, 6
		lea	dx, [bp+var_12]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+5CFAh]
		push	dx
		call	CRT_Abs16
		pop	cx

loc_669C9:
		mov	[bp+var_4], ax

loc_669CC:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0

loc_669D1:
		imul	ax, 6
		mov	bx, [bp+var_2]
		imul	bx, 6
		lea	dx, [bp+var_10]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax

loc_669E3:
		sub	dx, [bx+5CFCh]
		push	dx
		call	CRT_Abs16
		pop	cx
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]

loc_669F4:
		cmp	ax, word_72DB6
		ja	short loc_66A03
		mov	ax, [bp+var_6]
		cmp	ax, word_72DB6
		jbe	short loc_66A33

loc_66A03:				; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F+69j
		mov	word_72DA6, 4

loc_66A09:
		mov	al, byte ptr [bp+var_2]
		mov	byte_72DA8, al
		push	ds
		push	offset unk_72DAA
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		mov	cx, 6

loc_66A1B:
		call	CRT_Fmemcpy
		push	ds

loc_66A21:
		push	offset unk_72DB0
		lea	ax, [bp+var_C]
		push	ss

loc_66A28:
		push	ax

loc_66A29:
		mov	cx, 6
		call	CRT_Fmemcpy
		jmp	short loc_66A3F
; ���������������������������������������������������������������������������

loc_66A33:				; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F+72j
		inc	[bp+var_2]

loc_66A36:				; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F:loc_669A4j
		cmp	[bp+var_2], 2
		jge	short loc_66A3F
		jmp	loc_669A7
; ���������������������������������������������������������������������������

loc_66A3F:				; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F+A2j
					; ConfigOption_ApplyAndDisplayB_6698F+ABj
		cmp	word_72DA6, 4
		jnz	short loc_66A4B

loc_66A46:
		mov	ax, 1
		jmp	short locret_66A4D
; ���������������������������������������������������������������������������

loc_66A4B:				; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F+B5j
		xor	ax, ax

locret_66A4D:				; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F+BAj
		leave
		retf
ConfigOption_ApplyAndDisplayB_6698F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ConfigOption_FormatValueB_668FF et ConfigOption_ApplyAndDisplayB_6698F. Appelée
; par le thunk suivant.
; ==============================================================================================
ConfigOption_Dispatch_66A4F	proc far		; CODE XREF: seg201:036Dp

arg_0		= word ptr  6

		push	bp

loc_66A50:
		mov	bp, sp
		push	si

loc_66A53:
		mov	si, [bp+arg_0]
		mov	word_72DA6, 0

loc_66A5C:				; CODE XREF: ConfigOption_Dispatch_66A4F+2Bj
		push	5CF6h
		push	cs
		call	near ptr ConfigOption_FormatValueB_668FF

loc_66A63:
		pop	cx

loc_66A64:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_66A76
		test	si, 4
		jz	short loc_66A7C
		push	cs
		call	near ptr ConfigOption_ApplyAndDisplayB_6698F
		jmp	short loc_66A7C
; ���������������������������������������������������������������������������

loc_66A76:				; CODE XREF: ConfigOption_Dispatch_66A4F+19j
		test	word_72DA6, si
		jz	short loc_66A5C

loc_66A7C:				; CODE XREF: ConfigOption_Dispatch_66A4F+1Fj
					; ConfigOption_Dispatch_66A4F+25j
		mov	ax, 5CF6h
		pop	si
		pop	bp
		retf
ConfigOption_Dispatch_66A4F	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	cs
		call	near ptr ConfigOption_Dispatch_66A4F
		pop	cx
		push	ds

loc_66A92:
		push	si

loc_66A93:
		push	ds
		push	offset word_72DA6
		mov	cx, 10h

loc_66A9A:
		call	CRT_Fmemcpy

loc_66A9F:
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant une constante de type (5CF6h).
; ==============================================================================================
ConfigOption_Method_ReturnTypeTag_66AA4:
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 5CF6h
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — initialise les globales du module
; (word_72DA6, byte_72DA8/72DA9 à zéro).
; ==============================================================================================
ConfigOption_InitGlobalState_66AAF:				; DATA XREF: seg339:off_71F44o
		push	bp
		mov	bp, sp
		mov	word_72DA6, 0
		mov	byte_72DA8, 0

loc_66ABD:
		mov	byte_72DA9, 0

loc_66AC2:
		pop	bp

locret_66AC3:
		retf
seg201		ends
