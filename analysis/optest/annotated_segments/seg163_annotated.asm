seg163		segment	byte public 'CODE' use16
		assume cs:seg163
		;org 9
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ConstructAndReset_67DF5 (sub_67DF5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658, 2 octets),
; initialise via TextScrollDisplayB_Construct_675B4 (seg206) puis remet à zéro les compteurs
; d'animation (word_72ECE/72ED0/711FC/711C6/711C8). Référencée depuis seg047/seg049 (proches
; de TextRenderer_Main).
; ==============================================================================================
TextScrollDisplayB_ConstructAndReset_3F619	proc far		; CODE XREF: seg007:01E3P seg008:069FP
					; DATA XREF: ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3F632
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3F653

loc_3F632:				; CODE XREF: TextScrollDisplayB_ConstructAndReset_3F619+9j
		push	si
		call	TextScrollDisplayB_Construct_3EDD8
		pop	cx
		mov	word_4981E, 0
		mov	word_49820, 0
		mov	word_47AEA, 0
		xor	ax, ax
		mov	word_47AB6, ax
		mov	word_47AB4, ax

loc_3F653:				; CODE XREF: TextScrollDisplayB_ConstructAndReset_3F619+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplayB_ConstructAndReset_3F619	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_InitAndRegister_67E34 (sub_67E34 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658), initialise
; (TextFormat_InitAttributeTable_5E45D, seg143) et enregistre via
; HandlerRegistry4Slot_Register_67517 (seg205).
; ==============================================================================================
TextScrollDisplayB_InitAndRegister_3F658	proc far		; CODE XREF: sub_5E851+11CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word_47AEA, 0
		jnz	short loc_3F6AB
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_3F684
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0
		mov	byte ptr [di+0Dh], 0
		jmp	short loc_3F686
; ���������������������������������������������������������������������������

loc_3F684:				; CODE XREF: TextScrollDisplayB_InitAndRegister_3F658+1Bj
		mov	ax, di

loc_3F686:				; CODE XREF: TextScrollDisplayB_InitAndRegister_3F658+2Aj
		mov	word_47AEC, ax
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 0A000h
		push	ax
		call	TextFormat_InitAttributeTable_2EB31
		add	sp, 12h
		mov	ax, word_46F46
		mov	word_47AEA, ax

loc_3F6AB:				; CODE XREF: TextScrollDisplayB_InitAndRegister_3F658+Dj
		push	1
		push	seg seg163
		push	offset TextScrollDisplayB_ApplyHelperB_3F704
		push	si
		call	HandlerRegistry4Slot_Register_3ED3B
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplayB_InitAndRegister_3F658	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperA_67E9C (sub_67E9C de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_67F60 et sub_67F26.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperA_3F6C0	proc far		; CODE XREF: sub_502B+23P
					; sub_51049+2BAP ...

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte_497C0, 0
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3F6F8
		mov	al, byte_47AB8
		mov	[bp+var_1], al
		or	al, al
		jz	short loc_3F6E7
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperD_3F784

loc_3F6E7:				; CODE XREF: TextScrollDisplayB_ApplyHelperA_3F6C0+20j
		mov	word_47AEA, si
		cmp	[bp+var_1], 0
		jz	short loc_3F6FC
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperC_3F74A
		jmp	short loc_3F6FC
; ���������������������������������������������������������������������������

loc_3F6F8:				; CODE XREF: TextScrollDisplayB_ApplyHelperA_3F6C0+16j
		mov	word_47AEA, si

loc_3F6FC:				; CODE XREF: TextScrollDisplayB_ApplyHelperA_3F6C0+2Fj
					; TextScrollDisplayB_ApplyHelperA_3F6C0+36j
		mov	byte_497C0, 1
		pop	si
		leave
		retf
TextScrollDisplayB_ApplyHelperA_3F6C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperB_67EE0 (sub_67EE0 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine Cached-cluster helper sub_67FF8 et
; sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperB_3F704	proc far		; CODE XREF: sub_6BFB+195P
					; sub_6DBF+210P ...

arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		cmp	byte_47AB8, 0
		jz	short loc_3F735
		cmp	byte_497C0, 0
		jz	short loc_3F735
		mov	byte_497C0, 0
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_3F81C
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		sar	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectState_3F7AE
		add	sp, 4
		mov	byte_497C0, 1

loc_3F735:				; CODE XREF: TextScrollDisplayB_ApplyHelperB_3F704+8j TextScrollDisplayB_ApplyHelperB_3F704+Fj
		pop	bp
		retf
TextScrollDisplayB_ApplyHelperB_3F704	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_67F13 (sub_67F13 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A
; (même appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_3F737	proc far		; CODE XREF: sub_5E851+111P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	67DEh
		call	CachedObject_DestructHelper_2D5ED
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_3F737	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperC_67F26 (sub_67F26 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_67FF8 et sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperC_3F74A	proc far		; CODE XREF: sub_4F0F+81P sub_4F0F+9AP ...

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_497C0
		mov	[bp+var_2], al
		mov	byte_497C0, 0
		cmp	byte_47AB8, 0
		jz	short loc_3F767
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_3F81C

loc_3F767:				; CODE XREF: TextScrollDisplayB_ApplyHelperC_3F74A+16j
		push	word_47AB6
		push	word_47AB4
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectState_3F7AE
		add	sp, 4
		mov	byte_47AB8, 1
		mov	al, [bp+var_2]
		mov	byte_497C0, al
		leave
		retf
TextScrollDisplayB_ApplyHelperC_3F74A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperD_67F60 (sub_67F60 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_67FF8.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperD_3F784	proc far		; CODE XREF: sub_3B0B+169P
					; seg002:0CB6P	...

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_497C0
		mov	[bp+var_2], al
		mov	byte_497C0, 0
		cmp	byte_47AB8, 0
		jz	short loc_3F7A1
		nop
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_3F81C

loc_3F7A1:				; CODE XREF: TextScrollDisplayB_ApplyHelperD_3F784+16j
		mov	byte_47AB8, 0
		mov	al, [bp+var_2]
		mov	byte_497C0, al
		leave
		retf
TextScrollDisplayB_ApplyHelperD_3F784	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_UpdateObjectState_67F8A (sub_67F8A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine SmallObject_RegisterInList_5D999, CachedObject_BuildComposite_5E00C (seg141),
; CachedObject_AllocateAndInit_5DFBE, SmallObject_UnregisterFromList_5D9D3 (seg139) — met à
; jour l'état d'un objet mis en cache lié au défilement de texte.
; ==============================================================================================
TextScrollDisplayB_UpdateObjectState_3F7AE	proc far		; CODE XREF: TextScrollDisplayB_ApplyHelperB_3F704+26p
					; TextScrollDisplayB_ApplyHelperC_3F74A+27p ...

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
		cmp	word_49822, 0
		jz	short loc_3F7C9
		mov	dx, word_47AEC
		jmp	short loc_3F7CD
; ���������������������������������������������������������������������������

loc_3F7C9:				; CODE XREF: TextScrollDisplayB_UpdateObjectState_3F7AE+13j
		mov	dx, word_47AEA

loc_3F7CD:				; CODE XREF: TextScrollDisplayB_UpdateObjectState_3F7AE+19j
		push	dx
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		mov	[bp+var_6], si
		mov	[bp+var_8], di
		mov	ax, [bp+var_6]
		mov	word_49800, ax
		mov	ax, [bp+var_8]
		mov	word_49802, ax
		push	67DEh
		call	CachedObject_BuildComposite_2D7C5
		pop	cx
		push	di
		push	si
		push	67DEh
		call	CachedObject_AllocateAndInit_2D777
		add	sp, 6
		mov	word_47AB4, si
		mov	word_47AB6, di
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
TextScrollDisplayB_UpdateObjectState_3F7AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_UpdateObjectStateB_67FF8 (sub_67FF8
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; variante de TextScrollDisplayB_UpdateObjectState_67F8A (SmallObject_RegisterInList_5D999,
; CachedObject_BuildVariant_5E12A, SmallObject_UnregisterFromList_5D9D3).
; ==============================================================================================
TextScrollDisplayB_UpdateObjectStateB_3F81C	proc far		; CODE XREF: TextScrollDisplayB_ApplyHelperB_3F704+18p
					; TextScrollDisplayB_ApplyHelperC_3F74A+1Ap ...

var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	word_49822, 0
		jz	short loc_3F82F
		mov	dx, word_47AEC
		jmp	short loc_3F833
; ���������������������������������������������������������������������������

loc_3F82F:				; CODE XREF: TextScrollDisplayB_UpdateObjectStateB_3F81C+Bj
		mov	dx, word_47AEA

loc_3F833:				; CODE XREF: TextScrollDisplayB_UpdateObjectStateB_3F81C+11j
		push	dx
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	word_47AB6
		push	word_47AB4
		push	67DEh
		call	CachedObject_BuildVariant_2D8E3
		add	sp, 6
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		leave
		retf
TextScrollDisplayB_UpdateObjectStateB_3F81C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StopAnimation_6803F (sub_6803F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; TextScrollDisplayB_UpdateObjectState_67F8A — arrête l'animation de défilement (associé au
; flag byte_72E70=0 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StopAnimation_3F863	proc far		; CODE XREF: sub_3F8CC+Cp

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_497C0
		mov	[bp+var_2], al
		mov	byte_497C0, 0
		mov	ax, word_47AEA
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_47AEA, ax
		push	word_47AB6
		push	word_47AB4
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectState_3F7AE
		add	sp, 4
		mov	ax, [bp+var_4]
		mov	word_47AEA, ax
		mov	al, [bp+var_2]
		mov	byte_497C0, al
		leave
		retf
TextScrollDisplayB_StopAnimation_3F863	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StartAnimation_68079 (sub_68079 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; TextScrollDisplayB_UpdateObjectStateB_67FF8 — démarre l'animation de défilement (associé au
; flag byte_72E70=1 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StartAnimation_3F89D	proc far		; CODE XREF: sub_3F8DE+7p

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_497C0
		mov	[bp+var_2], al
		mov	byte_497C0, 0
		mov	ax, word_47AEA
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_47AEA, ax
		push	cs
		call	near ptr TextScrollDisplayB_UpdateObjectStateB_3F81C
		mov	ax, [bp+var_4]
		mov	word_47AEA, ax
		mov	al, [bp+var_2]
		mov	byte_497C0, al
		leave
		retf
TextScrollDisplayB_StartAnimation_3F89D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F8CC	proc far		; CODE XREF: sub_502B+1A1P
					; sub_51049+5A0P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	byte_497C0, 0
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StopAnimation_3F863
		pop	cx
		pop	bp
		retf
sub_3F8CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F8DE	proc far		; CODE XREF: sub_502B+1BCP
					; sub_51049+5BDP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StartAnimation_3F89D
		pop	cx
		mov	byte_497C0, 1
		pop	bp
		retf
sub_3F8DE	endp

; ���������������������������������������������������������������������������

loc_3F8F0:				; DATA XREF: dseg:596Ao
		push	bp
		mov	bp, sp
		push	67DEh
		call	CachedObject_Allocate_2D201
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3F8FE:				; DATA XREF: dseg:59FAo
		push	bp
		mov	bp, sp
		push	2
		push	67DEh
		call	CachedObject_Destruct_2D440
		add	sp, 4
		pop	bp
		retf
seg163		ends
