seg204		segment	byte public 'CODE' use16
		assume cs:seg204
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise via sub_674F5 puis TextScroll_ComputeParams_67048 —
; constructeur d'un objet de défilement de texte.
; ==============================================================================================
TextScroll_Construct_66FC4	proc far		; CODE XREF: InputSystem_InitAll_8F47A+B3P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_66FC8:				; DATA XREF: seg216:0726o
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66FDD
		push	2

loc_66FD1:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66FF3

loc_66FDD:				; CODE XREF: TextScroll_Construct_66FC4+9j
		push	si
		call	TextScroll_AllocateState_674F5
		pop	cx
		push	[bp+arg_4]

loc_66FE7:
		push	[bp+arg_2]
		push	si
		nop

loc_66FEC:
		push	cs
		call	near ptr TextScroll_ComputeParams_67048

loc_66FF0:
		add	sp, 6

loc_66FF3:				; CODE XREF: TextScroll_Construct_66FC4+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_Construct_66FC4	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]

loc_67003:
		or	si, si

loc_67005:
		jnz	short loc_67015
		push	2

loc_67009:
		call	CRT_Malloc16_Retry
		pop	cx

loc_6700F:
		mov	si, ax

loc_67011:
		or	ax, ax

loc_67013:
		jz	short loc_67042

loc_67015:				; CODE XREF: seg204:loc_67005j
		push	si

loc_67016:
		call	TextScroll_AllocateState_674F5
		pop	cx
		mov	ax, [bp+0Ah]
		mov	word_72E46, ax
		mov	word_711A0, di
		imul	word ptr [bp+0Ch]
		mov	dx, word_711A0
		add	dx, ax
		mov	word_711A2, dx
		mov	ax, di
		mov	word_711A6, ax

loc_67038:
		mov	word_711A4, ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_671CA
		pop	cx

loc_67042:				; CODE XREF: seg204:loc_67013j
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule les paramètres de défilement (word_72E46=7 pas fixe, multiplié par un facteur
; arg) et enregistre un gestionnaire (TextScroll_RegisterHandler_671CA).
; ==============================================================================================
TextScroll_ComputeParams_67048	proc far		; CODE XREF: TextScroll_Construct_66FC4+29p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_2]

loc_67051:
		mov	word_72E46, 7

loc_67057:
		mov	word_711A0, cx

loc_6705B:
		mov	ax, word_72E46

loc_6705E:
		imul	[bp+arg_4]
		mov	dx, word_711A0
		add	dx, ax
		mov	word_711A2, dx
		mov	ax, cx
		mov	word_711A6, ax
		mov	word_711A4, ax

loc_67073:
		push	bx
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_671CA
		pop	cx
		pop	bp
		retf
TextScroll_ComputeParams_67048	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_67118 (combine sub_229C).
; ==============================================================================================
TextScroll_Helper_6707C	proc far		; CODE XREF: TextScroll_ApplyHelperA_67118+17p
		push	bp
		mov	bp, sp
		mov	ax, word_72E46
		add	word_711A6, ax
		mov	ax, word_711A6
		cmp	ax, word_711A2
		jb	short loc_67095
		mov	ax, word_711A0

loc_67092:
		mov	word_711A6, ax

loc_67095:				; CODE XREF: TextScroll_Helper_6707C+11j
		mov	ax, word_711A6

loc_67098:
		cmp	ax, word_711A4
		jnz	short loc_670A3

loc_6709E:
		nop
		push	cs
		call	near ptr TextScroll_HelperB_670A5

loc_670A3:				; CODE XREF: TextScroll_Helper_6707C+20j
		pop	bp
		retf
TextScroll_Helper_6707C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_67134 (combine sub_229C).
; ==============================================================================================
TextScroll_HelperB_670A5	proc far		; CODE XREF: TextScroll_Helper_6707C+24p
					; TextScroll_ApplyHelperB_67134:loc_67151p
		push	bp
		mov	bp, sp
		mov	ax, word_72E46
		add	word_711A4, ax
		mov	ax, word_711A4

loc_670B2:
		cmp	ax, word_711A2
		jb	short loc_670BE
		mov	ax, word_711A0
		mov	word_711A4, ax

loc_670BE:				; CODE XREF: TextScroll_HelperB_670A5+11j
		pop	bp
		retf
TextScroll_HelperB_670A5	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp

loc_670C3:
		mov	dx, [bp+6]

loc_670C6:
		add	dx, word_72E46
		cmp	dx, word_711A2

loc_670CE:
		jb	short loc_670D5
		mov	ax, word_711A0

loc_670D3:
		jmp	short loc_670D7
; ���������������������������������������������������������������������������

loc_670D5:				; CODE XREF: seg204:loc_670CEj
		mov	ax, dx

loc_670D7:				; CODE XREF: seg204:loc_670D3j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, word_711A4

loc_670E2:
		cmp	ax, word_711A6
		jnz	short loc_670EC
		mov	al, 0
		jmp	short loc_67116
; ���������������������������������������������������������������������������

loc_670EC:				; CODE XREF: seg204:0126j
		mov	ax, word_711A4

loc_670EF:
		cmp	ax, word_711A6

loc_670F3:
		jnb	short loc_67108
		cmp	dx, word_711A4
		jb	short loc_67114
		cmp	dx, word_711A6
		jnb	short loc_67114

loc_67101:				; CODE XREF: seg204:014Cj seg204:0152j
		mov	ax, 1
		jmp	short loc_67116
; ���������������������������������������������������������������������������

loc_67106:
		jmp	short loc_67114
; ���������������������������������������������������������������������������

loc_67108:				; CODE XREF: seg204:loc_670F3j
		cmp	dx, word_711A4
		jnb	short loc_67101

loc_6710E:
		cmp	dx, word_711A6
		jb	short loc_67101

loc_67114:				; CODE XREF: seg204:0139j seg204:013Fj ...
		xor	ax, ax

loc_67116:				; CODE XREF: seg204:012Aj seg204:0144j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_229C et TextScroll_Helper_6707C.
; ==============================================================================================
TextScroll_ApplyHelperA_67118	proc far		; CODE XREF: seg204:0204p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	word_72E46
		push	[bp+arg_0]

loc_67122:
		push	word_711A6
		call	CRT_Memmove
		add	sp, 6
		push	cs
		call	near ptr TextScroll_Helper_6707C
		pop	bp
		retf
TextScroll_ApplyHelperA_67118	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_229C et TextScroll_HelperB_670A5.
; ==============================================================================================
TextScroll_ApplyHelperB_67134	proc far		; CODE XREF: TextScroll_ApplyHelperC_671E4+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_67137:
		mov	ax, word_711A4

loc_6713A:
		cmp	ax, word_711A6
		jz	short loc_67158

loc_67140:
		push	word_72E46
		push	ax

loc_67145:
		push	[bp+arg_0]

loc_67148:
		call	CRT_Memmove

loc_6714D:
		add	sp, 6
		push	cs

loc_67151:
		call	near ptr TextScroll_HelperB_670A5
		mov	al, 1
		jmp	short loc_6715A
; ���������������������������������������������������������������������������

loc_67158:				; CODE XREF: TextScroll_ApplyHelperB_67134+Aj
		mov	al, 0

loc_6715A:				; CODE XREF: TextScroll_ApplyHelperB_67134+22j
		pop	bp
		retf
TextScroll_ApplyHelperB_67134	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; ⚠️ far, 71 lignes, NON DÉTAILLÉE — référencée comme donnée (installée par
; TextScroll_RegisterHandler_671CA via sub_67517) — gestionnaire de tic périodique (teste des
; bits de flags 0x6/0x18) pour l'animation de défilement de texte, motif similaire au registre
; de modules temporisés (seg161).
; ==============================================================================================
TextScroll_TickHandler_6715C:				; DATA XREF: TextScroll_RegisterHandler_671CA+Co
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

loc_67178:
		mov	[bp-0Ah], ax
		mov	al, [bp-0Ah]
		mov	[bp-0Ch], al
		mov	al, [bp-0Ch]
		mov	[bp-2],	al
		test	dx, 6
		jz	short loc_67193
		mov	byte ptr [bp-7], 1

loc_67191:
		jmp	short loc_671A3
; ���������������������������������������������������������������������������

loc_67193:				; CODE XREF: seg204:01CBj
		test	dx, 18h

loc_67197:
		jz	short loc_6719F

loc_67199:
		mov	byte ptr [bp-7], 2
		jmp	short loc_671A3
; ���������������������������������������������������������������������������

loc_6719F:				; CODE XREF: seg204:loc_67197j
		mov	byte ptr [bp-7], 0

loc_671A3:				; CODE XREF: seg204:loc_67191j
					; seg204:01DDj
		test	dx, 2Ah
		jz	short loc_671AF
		mov	byte ptr [bp-8], 1
		jmp	short loc_671BF
; ���������������������������������������������������������������������������

loc_671AF:				; CODE XREF: seg204:01E7j
		test	dx, 54h
		jz	short loc_671BB
		mov	byte ptr [bp-8], 2
		jmp	short loc_671BF
; ���������������������������������������������������������������������������

loc_671BB:				; CODE XREF: seg204:01F3j
		mov	byte ptr [bp-8], 0

loc_671BF:				; CODE XREF: seg204:01EDj seg204:01F9j
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr TextScroll_ApplyHelperA_67118
		pop	cx
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enregistre TextScroll_TickHandler_6715C (tag 0xFE) via sub_67517 — probable
; enregistrement dans le registre de modules à créneaux temporisés (seg161) ou un système
; apparenté.
; ==============================================================================================
TextScroll_RegisterHandler_671CA	proc far		; CODE XREF: seg204:007Ep
					; TextScroll_ComputeParams_67048+2Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0FEh ; '�'
		push	seg seg204
		push	offset TextScroll_TickHandler_6715C
		push	ax
		call	HandlerRegistry4Slot_Register_67517
		add	sp, 8
		pop	bp
		retf
TextScroll_RegisterHandler_671CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_67204.
; ==============================================================================================
TextScroll_ApplyHelperC_671E4	proc far		; CODE XREF: Mouse_InitAndRead+11P
					; TextScroll_FormatAndApply_67204:loc_6720Cp	...
		push	bp
		mov	bp, sp
		mov	byte_72E48, 0
		push	5D98h
		push	cs
		call	near ptr TextScroll_ApplyHelperB_67134

loc_671F3:
		pop	cx
		mov	ah, 0

loc_671F6:
		or	ax, ax
		jnz	short loc_671FF
		nop
		push	cs

loc_671FC:
		call	near ptr TextScroll_ApplyHelperD_67222

loc_671FF:				; CODE XREF: TextScroll_ApplyHelperC_671E4+14j
		mov	ax, 5D98h

loc_67202:
		pop	bp

locret_67203:
		retf
TextScroll_ApplyHelperC_671E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TextScroll_ApplyHelperC_671E4 et sub_3FD (formatage).
; ==============================================================================================
TextScroll_FormatAndApply_67204	proc far		; CODE XREF: Player_MainUpdate+CFDP
					; Input_ReadAxis1Deadzone+EEP ...

arg_0		= word ptr  6

		push	bp

loc_67205:
		mov	bp, sp

loc_67207:
		push	si
		mov	si, [bp+arg_0]
		push	cs

loc_6720C:
		call	near ptr TextScroll_ApplyHelperC_671E4
		push	ds
		push	si
		push	ds

loc_67212:
		push	offset byte_72E48

loc_67215:
		mov	cx, 7

loc_67218:
		call	CRT_Fmemcpy

loc_6721D:
		mov	ax, si
		pop	si
		pop	bp

locret_67221:
		retf
TextScroll_FormatAndApply_67204	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_67481 et sub_67499 (×2 chacune).
; ==============================================================================================
TextScroll_ApplyHelperD_67222	proc far		; CODE XREF: TextScroll_ApplyHelperC_671E4:loc_671FCp
		push	bp

loc_67223:
		mov	bp, sp

loc_67225:
		call	Input_GetCalibratedXValue_67481

loc_6722A:
		cmp	ax, word_72E4A
		jnz	short loc_6723B

loc_67230:
		call	Input_GetCalibratedYValue_67499

loc_67235:
		cmp	ax, word_72E4C
		jz	short loc_67254

loc_6723B:				; CODE XREF: TextScroll_ApplyHelperD_67222+Cj
		mov	byte_72E48, 3
		call	Input_GetCalibratedXValue_67481
		mov	word_72E4A, ax
		call	Input_GetCalibratedYValue_67499
		mov	word_72E4C, ax
		mov	al, 1
		jmp	short loc_6725B
; ���������������������������������������������������������������������������

loc_67254:				; CODE XREF: TextScroll_ApplyHelperD_67222+17j
		mov	byte_72E48, 0

loc_67259:
		mov	al, 0

loc_6725B:				; CODE XREF: TextScroll_ApplyHelperD_67222+30j
		pop	bp
		retf
TextScroll_ApplyHelperD_67222	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — réinitialise un indicateur global
; (byte_72E48).
; ==============================================================================================
TextScroll_ResetFlag_6725D:				; DATA XREF: seg339:off_71F50o
		push	bp
		mov	bp, sp

loc_67260:
		mov	byte_72E48, 0
		pop	bp
		retf
seg204		ends
