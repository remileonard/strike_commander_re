seg158		segment	byte public 'CODE' use16
		assume cs:seg158
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_Construct_66FC4 (sub_66FC4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (sub_658), initialise via sub_674F5
; puis TextScroll_ComputeParams_67048 — constructeur d'un objet de défilement de texte.
; ==============================================================================================
TextScroll_Construct_3E7E8	proc far		; CODE XREF: sub_5E851+C2P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_3E7EC:				; DATA XREF: seg170:05C6o
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3E801
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3E817

loc_3E801:				; CODE XREF: TextScroll_Construct_3E7E8+9j
		push	si
		call	sub_3ED19
		pop	cx
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextScroll_ComputeParams_3E86C
		add	sp, 6

loc_3E817:				; CODE XREF: TextScroll_Construct_3E7E8+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_Construct_3E7E8	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jnz	short loc_3E839
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3E866

loc_3E839:				; CODE XREF: seg158:0049j
		push	si
		call	sub_3ED19
		pop	cx
		mov	ax, [bp+0Ah]
		mov	word_49796, ax
		mov	word_47A8E, di
		imul	word ptr [bp+0Ch]
		mov	dx, word_47A8E
		add	dx, ax
		mov	word_47A90, dx
		mov	ax, di
		mov	word_47A94, ax
		mov	word_47A92, ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_3E9EE
		pop	cx

loc_3E866:				; CODE XREF: seg158:0057j
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_ComputeParams_67048 (sub_67048 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, calcule les paramètres de défilement
; (word_72E46=7 pas fixe, multiplié par un facteur arg) et enregistre un gestionnaire
; (TextScroll_RegisterHandler_671CA).
; ==============================================================================================
TextScroll_ComputeParams_3E86C	proc far		; CODE XREF: TextScroll_Construct_3E7E8+29p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word_49796, 7
		mov	word_47A8E, cx
		mov	ax, word_49796
		imul	[bp+arg_4]
		mov	dx, word_47A8E
		add	dx, ax
		mov	word_47A90, dx
		mov	ax, cx
		mov	word_47A94, ax
		mov	word_47A92, ax
		push	bx
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_3E9EE
		pop	cx
		pop	bp
		retf
TextScroll_ComputeParams_3E86C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à TextScroll_Helper_6707C
; (sub_6707C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_67118 (combine sub_229C).
; ==============================================================================================
TextScroll_Helper_3E8A0	proc far		; CODE XREF: TextScroll_ApplyHelperA_3E93C+17p
		push	bp
		mov	bp, sp
		mov	ax, word_49796
		add	word_47A94, ax
		mov	ax, word_47A94
		cmp	ax, word_47A90
		jb	short loc_3E8B9
		mov	ax, word_47A8E
		mov	word_47A94, ax

loc_3E8B9:				; CODE XREF: TextScroll_Helper_3E8A0+11j
		mov	ax, word_47A94
		cmp	ax, word_47A92
		jnz	short loc_3E8C7
		nop
		push	cs
		call	near ptr TextScroll_HelperB_3E8C9

loc_3E8C7:				; CODE XREF: TextScroll_Helper_3E8A0+20j
		pop	bp
		retf
TextScroll_Helper_3E8A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_HelperB_670A5 (sub_670A5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, référencée par sub_67134 (combine sub_229C).
; ==============================================================================================
TextScroll_HelperB_3E8C9	proc far		; CODE XREF: TextScroll_Helper_3E8A0+24p
					; TextScroll_ApplyHelperB_3E958+1Dp
		push	bp
		mov	bp, sp
		mov	ax, word_49796
		add	word_47A92, ax
		mov	ax, word_47A92
		cmp	ax, word_47A90
		jb	short loc_3E8E2
		mov	ax, word_47A8E
		mov	word_47A92, ax

loc_3E8E2:				; CODE XREF: TextScroll_HelperB_3E8C9+11j
		pop	bp
		retf
TextScroll_HelperB_3E8C9	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		add	dx, word_49796
		cmp	dx, word_47A90
		jb	short loc_3E8F9
		mov	ax, word_47A8E
		jmp	short loc_3E8FB
; ���������������������������������������������������������������������������

loc_3E8F9:				; CODE XREF: seg158:0112j
		mov	ax, dx

loc_3E8FB:				; CODE XREF: seg158:0117j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, word_47A92
		cmp	ax, word_47A94
		jnz	short loc_3E910
		mov	al, 0
		jmp	short loc_3E93A
; ���������������������������������������������������������������������������

loc_3E910:				; CODE XREF: seg158:012Aj
		mov	ax, word_47A92
		cmp	ax, word_47A94
		jnb	short loc_3E92C
		cmp	dx, word_47A92
		jb	short loc_3E938
		cmp	dx, word_47A94
		jnb	short loc_3E938

loc_3E925:				; CODE XREF: seg158:0150j seg158:0156j
		mov	ax, 1
		jmp	short loc_3E93A
; ���������������������������������������������������������������������������
		jmp	short loc_3E938
; ���������������������������������������������������������������������������

loc_3E92C:				; CODE XREF: seg158:0137j
		cmp	dx, word_47A92
		jnb	short loc_3E925
		cmp	dx, word_47A94
		jb	short loc_3E925

loc_3E938:				; CODE XREF: seg158:013Dj seg158:0143j ...
		xor	ax, ax

loc_3E93A:				; CODE XREF: seg158:012Ej seg158:0148j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_ApplyHelperA_67118 (sub_67118 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_229C et TextScroll_Helper_6707C.
; ==============================================================================================
TextScroll_ApplyHelperA_3E93C	proc far		; CODE XREF: seg158:0208p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	word_49796
		push	[bp+arg_0]
		push	word_47A94
		call	CRT_Memmove
		add	sp, 6
		push	cs
		call	near ptr TextScroll_Helper_3E8A0
		pop	bp
		retf
TextScroll_ApplyHelperA_3E93C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_ApplyHelperB_67134 (sub_67134 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_229C et TextScroll_HelperB_670A5.
; ==============================================================================================
TextScroll_ApplyHelperB_3E958	proc far		; CODE XREF: TextScroll_ApplyHelperC_3EA08+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, word_47A92
		cmp	ax, word_47A94
		jz	short loc_3E97C
		push	word_49796
		push	ax
		push	[bp+arg_0]
		call	CRT_Memmove
		add	sp, 6
		push	cs
		call	near ptr TextScroll_HelperB_3E8C9
		mov	al, 1
		jmp	short loc_3E97E
; ���������������������������������������������������������������������������

loc_3E97C:				; CODE XREF: TextScroll_ApplyHelperB_3E958+Aj
		mov	al, 0

loc_3E97E:				; CODE XREF: TextScroll_ApplyHelperB_3E958+22j
		pop	bp
		retf
TextScroll_ApplyHelperB_3E958	endp

; ���������������������������������������������������������������������������

loc_3E980:				; DATA XREF: TextScroll_RegisterHandler_3E9EE+Co
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dx, [bp+6]
		mov	byte ptr [bp-8], 0
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax
		mov	ax, [bp+8]
		mov	[bp-0Ah], ax
		mov	al, [bp-0Ah]
		mov	[bp-0Ch], al
		mov	al, [bp-0Ch]
		mov	[bp-2],	al
		test	dx, 6
		jz	short loc_3E9B7
		mov	byte ptr [bp-7], 1
		jmp	short loc_3E9C7
; ���������������������������������������������������������������������������

loc_3E9B7:				; CODE XREF: seg158:01CFj
		test	dx, 18h
		jz	short loc_3E9C3
		mov	byte ptr [bp-7], 2
		jmp	short loc_3E9C7
; ���������������������������������������������������������������������������

loc_3E9C3:				; CODE XREF: seg158:01DBj
		mov	byte ptr [bp-7], 0

loc_3E9C7:				; CODE XREF: seg158:01D5j seg158:01E1j
		test	dx, 2Ah
		jz	short loc_3E9D3
		mov	byte ptr [bp-8], 1
		jmp	short loc_3E9E3
; ���������������������������������������������������������������������������

loc_3E9D3:				; CODE XREF: seg158:01EBj
		test	dx, 54h
		jz	short loc_3E9DF
		mov	byte ptr [bp-8], 2
		jmp	short loc_3E9E3
; ���������������������������������������������������������������������������

loc_3E9DF:				; CODE XREF: seg158:01F7j
		mov	byte ptr [bp-8], 0

loc_3E9E3:				; CODE XREF: seg158:01F1j seg158:01FDj
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr TextScroll_ApplyHelperA_3E93C
		pop	cx
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_RegisterHandler_671CA (sub_671CA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, enregistre TextScroll_TickHandler_6715C (tag
; 0xFE) via sub_67517 — probable enregistrement dans le registre de modules à créneaux
; temporisés (seg161) ou un système apparenté.
; ==============================================================================================
TextScroll_RegisterHandler_3E9EE	proc far		; CODE XREF: seg158:0082p
					; TextScroll_ComputeParams_3E86C+2Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0FEh ; '�'
		push	seg seg158
		push	offset loc_3E980
		push	ax
		call	HandlerRegistry4Slot_Register_3ED3B
		add	sp, 8
		pop	bp
		retf
TextScroll_RegisterHandler_3E9EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScroll_ApplyHelperC_671E4 (sub_671E4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée par sub_67204.
; ==============================================================================================
TextScroll_ApplyHelperC_3EA08	proc far		; CODE XREF: sub_69B8+10P TextScroll_FormatAndApply_3EA28+8p
		push	bp
		mov	bp, sp
		mov	byte_49798, 0
		push	6778h
		push	cs
		call	near ptr TextScroll_ApplyHelperB_3E958
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3EA23
		nop
		push	cs
		call	near ptr TextScroll_ApplyHelperD_3EA46

loc_3EA23:				; CODE XREF: TextScroll_ApplyHelperC_3EA08+14j
		mov	ax, 6778h
		pop	bp
		retf
TextScroll_ApplyHelperC_3EA08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_FormatAndApply_67204 (sub_67204 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine TextScroll_ApplyHelperC_671E4 et
; sub_3FD (formatage).
; ==============================================================================================
TextScroll_FormatAndApply_3EA28	proc far		; CODE XREF: sub_502B+245P
					; seg008:0214P	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr TextScroll_ApplyHelperC_3EA08
		push	ds
		push	si
		push	ds
		push	offset byte_49798
		mov	cx, 7
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_FormatAndApply_3EA28	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_ApplyHelperD_67222 (sub_67222 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_67481 et sub_67499 (×2 chacune).
; ==============================================================================================
TextScroll_ApplyHelperD_3EA46	proc far		; CODE XREF: TextScroll_ApplyHelperC_3EA08+18p
		push	bp
		mov	bp, sp
		call	sub_3ECA5
		cmp	ax, word_4979A
		jnz	short loc_3EA5F
		call	sub_3ECBD
		cmp	ax, word_4979C
		jz	short loc_3EA78

loc_3EA5F:				; CODE XREF: TextScroll_ApplyHelperD_3EA46+Cj
		mov	byte_49798, 3
		call	sub_3ECA5
		mov	word_4979A, ax
		call	sub_3ECBD
		mov	word_4979C, ax
		mov	al, 1
		jmp	short loc_3EA7F
; ���������������������������������������������������������������������������

loc_3EA78:				; CODE XREF: TextScroll_ApplyHelperD_3EA46+17j
		mov	byte_49798, 0
		mov	al, 0

loc_3EA7F:				; CODE XREF: TextScroll_ApplyHelperD_3EA46+30j
		pop	bp
		retf
TextScroll_ApplyHelperD_3EA46	endp

; ���������������������������������������������������������������������������

loc_3EA81:				; DATA XREF: dseg:595Eo
		push	bp
		mov	bp, sp
		mov	byte_49798, 0
		pop	bp
		retf
seg158		ends
