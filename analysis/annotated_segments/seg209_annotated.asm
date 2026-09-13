seg209		segment	byte public 'CODE' use16
		assume cs:seg209
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658, 2 octets), initialise via TextScrollDisplayB_Construct_675B4 (seg206)
; puis remet à zéro les compteurs d'animation (word_72ECE/72ED0/711FC/711C6/711C8). Référencée
; depuis seg047/seg049 (proches de TextRenderer_Main).
; ==============================================================================================
TextScrollDisplayB_ConstructAndReset_67DF5	proc far		; CODE XREF: seg047:037DP seg049:062DP
					; DATA XREF: ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_67DF8:
		push	si
		mov	si, [bp+arg_0]

loc_67DFC:
		or	si, si

loc_67DFE:
		jnz	short loc_67E0E
		push	2

loc_67E02:
		call	CRT_Malloc16_Retry
		pop	cx

loc_67E08:
		mov	si, ax
		or	ax, ax

loc_67E0C:
		jz	short loc_67E2F

loc_67E0E:				; CODE XREF: TextScrollDisplayB_ConstructAndReset_67DF5:loc_67DFEj
		push	si

loc_67E0F:
		call	TextScrollDisplayB_Construct_675B4

loc_67E14:
		pop	cx
		mov	word_72ECE, 0
		mov	word_72ED0, 0

loc_67E21:
		mov	word_711FC, 0
		xor	ax, ax
		mov	word_711C8, ax
		mov	word_711C6, ax

loc_67E2F:				; CODE XREF: TextScrollDisplayB_ConstructAndReset_67DF5:loc_67E0Cj
		mov	ax, si

loc_67E31:
		pop	si
		pop	bp

locret_67E33:
		retf
TextScrollDisplayB_ConstructAndReset_67DF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise (TextFormat_InitAttributeTable_5E45D, seg143) et
; enregistre via HandlerRegistry4Slot_Register_67517 (seg205).
; ==============================================================================================
TextScrollDisplayB_InitAndRegister_67E34	proc far		; CODE XREF: InputSystem_InitAll_8F47A+10AP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_67E37:
		push	si

loc_67E38:
		push	di

loc_67E39:
		mov	si, [bp+arg_0]

loc_67E3C:
		cmp	word_711FC, 0

loc_67E41:
		jnz	short loc_67E87

loc_67E43:
		push	0Eh

loc_67E45:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_67E60
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0
		mov	byte ptr [di+0Dh], 0
		jmp	short loc_67E62
; ���������������������������������������������������������������������������

loc_67E60:				; CODE XREF: TextScrollDisplayB_InitAndRegister_67E34+1Bj
		mov	ax, di

loc_67E62:				; CODE XREF: TextScrollDisplayB_InitAndRegister_67E34+2Aj
		mov	word_711FE, ax
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 0A000h
		push	ax
		call	TextFormat_InitAttributeTable_5E45D
		add	sp, 12h
		mov	ax, word_70E62
		mov	word_711FC, ax

loc_67E87:				; CODE XREF: TextScrollDisplayB_InitAndRegister_67E34:loc_67E41j
		push	1
		push	seg seg209
		push	offset TextScrollDisplayB_ApplyHelperB_67EE0
		push	si
		call	HandlerRegistry4Slot_Register_67517
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplayB_InitAndRegister_67E34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_67F60 et sub_67F26.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperA_67E9C	proc far		; CODE XREF: InputSystem_InitAll_8F47A+116P

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte_72E70, 0
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67ED4
		mov	al, byte_711CA
		mov	[bp+var_1], al
		or	al, al
		jz	short loc_67EC3
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperD_67F60

loc_67EC3:				; CODE XREF: TextScrollDisplayB_ApplyHelperA_67E9C+20j
		mov	word_711FC, si
		cmp	[bp+var_1], 0
		jz	short loc_67ED8
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperC_67F26
		jmp	short loc_67ED8
; ���������������������������������������������������������������������������

loc_67ED4:				; CODE XREF: TextScrollDisplayB_ApplyHelperA_67E9C+16j
		mov	word_711FC, si

loc_67ED8:				; CODE XREF: TextScrollDisplayB_ApplyHelperA_67E9C+2Fj
					; TextScrollDisplayB_ApplyHelperA_67E9C+36j
		mov	byte_72E70, 1
		pop	si
		leave
		retf
TextScrollDisplayB_ApplyHelperA_67E9C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Cached-cluster helper sub_67FF8 et sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperB_67EE0	proc far		; CODE XREF: Input_ReadAxis2Deadzone+192P
					; Input_ReadCombinedAxes+1DEP
					; DATA XREF: ...

arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp

loc_67EE3:
		cmp	byte_711CA, 0

loc_67EE8:
		jz	short loc_67F11

loc_67EEA:
		cmp	byte_72E70, 0
		jz	short loc_67F11
		mov	byte_72E70, 0
		nop
		push	cs

loc_67EF8:
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_67FF8

loc_67EFB:
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]

loc_67F01:
		sar	ax, 1
		push	ax

loc_67F04:
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectState_67F8A
		add	sp, 4
		mov	byte_72E70, 1

loc_67F11:				; CODE XREF: TextScrollDisplayB_ApplyHelperB_67EE0:loc_67EE8j
					; TextScrollDisplayB_ApplyHelperB_67EE0+Fj
		pop	bp
		retf
TextScrollDisplayB_ApplyHelperB_67EE0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A
; (même appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_67F13	proc far		; CODE XREF: InputSystem_InitAll_8F47A+101P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	5DFEh
		call	CachedObject_DestructHelper_5DE34
		add	sp, 4

loc_67F24:
		pop	bp
		retf
TextScrollDisplayB_TickHelper_67F13	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_67FF8 et sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperC_67F26	proc far		; CODE XREF: TextScrollDisplayB_ApplyHelperA_67E9C+33p
					; InputSystem_InitAll_8F47A+11EP ...

var_2		= byte ptr -2

		push	bp
		mov	bp, sp

loc_67F29:
		sub	sp, 2

loc_67F2C:
		mov	al, byte_72E70

loc_67F2F:
		mov	[bp+var_2], al

loc_67F32:
		mov	byte_72E70, 0

loc_67F37:
		cmp	byte_711CA, 0
		jz	short loc_67F43
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_67FF8

loc_67F43:				; CODE XREF: TextScrollDisplayB_ApplyHelperC_67F26+16j
		push	word_711C8
		push	word_711C6
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectState_67F8A
		add	sp, 4

loc_67F53:
		mov	byte_711CA, 1
		mov	al, [bp+var_2]
		mov	byte_72E70, al
		leave
		retf
TextScrollDisplayB_ApplyHelperC_67F26	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_67FF8.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperD_67F60	proc far		; CODE XREF: Input_CalibrationHandler+397P
					; TextScrollDisplayB_ApplyHelperA_67E9C+24p ...

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_72E70
		mov	[bp+var_2], al
		mov	byte_72E70, 0

loc_67F71:
		cmp	byte_711CA, 0

loc_67F76:
		jz	short loc_67F7D
		nop

loc_67F79:
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_67FF8

loc_67F7D:				; CODE XREF: TextScrollDisplayB_ApplyHelperD_67F60:loc_67F76j
		mov	byte_711CA, 0

loc_67F82:
		mov	al, [bp+var_2]
		mov	byte_72E70, al
		leave
		retf
TextScrollDisplayB_ApplyHelperD_67F60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine SmallObject_RegisterInList_5D999, CachedObject_BuildComposite_5E00C (seg141),
; CachedObject_AllocateAndInit_5DFBE, SmallObject_UnregisterFromList_5D9D3 (seg139) — met à
; jour l'état d'un objet mis en cache lié au défilement de texte.
; ==============================================================================================
TextScrollDisplayB_UpdateObjectState_67F8A	proc far		; CODE XREF: TextScrollDisplayB_ApplyHelperB_67EE0+26p
					; TextScrollDisplayB_ApplyHelperC_67F26+27p ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word_72ED2, 0
		jz	short loc_67FA5
		mov	dx, word_711FE
		jmp	short loc_67FA9
; ���������������������������������������������������������������������������

loc_67FA5:				; CODE XREF: TextScrollDisplayB_UpdateObjectState_67F8A+13j
		mov	dx, word_711FC

loc_67FA9:				; CODE XREF: TextScrollDisplayB_UpdateObjectState_67F8A+19j
		push	dx
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		mov	[bp+var_6], si
		mov	[bp+var_8], di
		mov	ax, [bp+var_6]
		mov	word_72EB0, ax
		mov	ax, [bp+var_8]
		mov	word_72EB2, ax
		push	5DFEh
		call	CachedObject_BuildComposite_5E00C
		pop	cx
		push	di
		push	si
		push	5DFEh
		call	CachedObject_AllocateAndInit_5DFBE
		add	sp, 6
		mov	word_711C6, si
		mov	word_711C8, di
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3

loc_67FF1:
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
TextScrollDisplayB_UpdateObjectState_67F8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de TextScrollDisplayB_UpdateObjectState_67F8A
; (SmallObject_RegisterInList_5D999, CachedObject_BuildVariant_5E12A,
; SmallObject_UnregisterFromList_5D9D3).
; ==============================================================================================
TextScrollDisplayB_UpdateObjectStateB_67FF8	proc far		; CODE XREF: TextScrollDisplayB_ApplyHelperB_67EE0:loc_67EF8p
					; TextScrollDisplayB_ApplyHelperC_67F26+1Ap ...

var_4		= word ptr -4

		push	bp
		mov	bp, sp

loc_67FFB:
		sub	sp, 4

loc_67FFE:
		cmp	word_72ED2, 0

loc_68003:
		jz	short loc_6800B
		mov	dx, word_711FE
		jmp	short loc_6800F
; ���������������������������������������������������������������������������

loc_6800B:				; CODE XREF: TextScrollDisplayB_UpdateObjectStateB_67FF8:loc_68003j
		mov	dx, word_711FC

loc_6800F:				; CODE XREF: TextScrollDisplayB_UpdateObjectStateB_67FF8+11j
		push	dx
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		push	word_711C8

loc_68020:
		push	word_711C6
		push	5DFEh
		call	CachedObject_BuildVariant_5E12A

loc_6802C:
		add	sp, 6

loc_6802F:
		push	2

loc_68031:
		lea	ax, [bp+var_4]

loc_68034:
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4
		leave
		retf
TextScrollDisplayB_UpdateObjectStateB_67FF8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextScrollDisplayB_UpdateObjectState_67F8A — arrête l'animation de défilement
; (associé au flag byte_72E70=0 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StopAnimation_6803F	proc far		; CODE XREF: seg209:02C4p

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_68042:
		sub	sp, 4

loc_68045:
		mov	al, byte_72E70
		mov	[bp+var_2], al
		mov	byte_72E70, 0

loc_68050:
		mov	ax, word_711FC

loc_68053:
		mov	[bp+var_4], ax

loc_68056:
		mov	ax, [bp+arg_0]

loc_68059:
		mov	word_711FC, ax

loc_6805C:
		push	word_711C8
		push	word_711C6

loc_68064:
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectState_67F8A
		add	sp, 4
		mov	ax, [bp+var_4]
		mov	word_711FC, ax

loc_68071:
		mov	al, [bp+var_2]

loc_68074:
		mov	byte_72E70, al
		leave
		retf
TextScrollDisplayB_StopAnimation_6803F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextScrollDisplayB_UpdateObjectStateB_67FF8 — démarre l'animation de défilement
; (associé au flag byte_72E70=1 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StartAnimation_68079	proc far		; CODE XREF: seg209:loc_680C1p

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_72E70
		mov	[bp+var_2], al
		mov	byte_72E70, 0
		mov	ax, word_711FC
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_711FC, ax
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_67FF8
		mov	ax, [bp+var_4]
		mov	word_711FC, ax
		mov	al, [bp+var_2]
		mov	byte_72E70, al
		leave
		retf
TextScrollDisplayB_StartAnimation_68079	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	byte_72E70, 0
		push	word ptr [bp+6]
		push	cs
		call	near ptr TextScrollDisplayB_StopAnimation_6803F
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	cs

loc_680C1:
		call	near ptr TextScrollDisplayB_StartAnimation_68079
		pop	cx

loc_680C5:
		mov	byte_72E70, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant CachedObject_Allocate_5DA48
; (seg141, tag 5DFEh).
; ==============================================================================================
TextScrollDisplayB_Method_AllocateThunk_680CC:				; DATA XREF: seg339:off_71F5Co
		push	bp
		mov	bp, sp
		push	5DFEh
		call	CachedObject_Allocate_5DA48
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant CachedObject_Destruct_5DC87
; (seg141, tag 5DFEh, mode 2).
; ==============================================================================================
TextScrollDisplayB_Method_DestructThunk_680DA:				; DATA XREF: seg339:4F5Ao
		push	bp
		mov	bp, sp
		push	2

loc_680DF:
		push	5DFEh
		call	CachedObject_Destruct_5DC87
		add	sp, 4
		pop	bp
		retf
seg209		ends
