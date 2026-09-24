seg019		segment	byte public 'CODE' use16
		assume cs:seg019
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,84L — calcule sin/cos d'un angle (+0x38, via sub_54876/sub_5483F) et projette un point à
; distance (di) du centre (+0x2A/+0x2C) : dessin d'une aiguille/marqueur sur un cadran
; circulaire (instrument analogique du cockpit).
; ==============================================================================================
Gauge_DrawNeedle	proc far		; CODE XREF: seg019:02A5p

var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h

loc_17248:				; DATA XREF: seg216:0156o
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+38h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+2Ch]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+2Ah]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
Gauge_DrawNeedle	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,116L — variante de sub_17242 (offset -2 sur le rayon) : dessin d'un second élément du
; même cadran circulaire (probable trait/graduation à côté de l'aiguille).
; ==============================================================================================
Gauge_DrawTick	proc far		; CODE XREF: seg019:0373p

var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+38h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	Math_CosDeg_5483F

loc_17333:
		add	sp, 6
		mov	ax, di
		add	ax, 0FFFEh

loc_1733B:
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, [si+2Ah]
		add	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, di
		add	ax, 0FFFEh
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, [si+2Ch]
		add	ax, word ptr [bp+var_26+1]
		mov	[bp+var_1C], ax
		mov	[bp+var_2A], di
		movsx	eax, [bp+var_2A]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_2E], edx
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	ax, [si+2Ah]
		add	ax, word ptr [bp+var_32+1]
		mov	[bp+var_28], ax
		mov	[bp+var_36], di
		movsx	eax, [bp+var_36]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_3A], edx
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	ax, [si+2Ch]
		add	ax, word ptr [bp+var_3E+1]
		mov	[bp+var_34], ax
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+var_34]
		push	[bp+var_28]
		push	[bp+var_1C]
		push	[bp+var_10]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
Gauge_DrawTick	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — si flag +0x20 actif, dessine du texte (sub_5C832+sub_61F52) à une position stockée
; : rendu conditionnel d'une étiquette de widget UI.
; ==============================================================================================
UI_DrawWidgetLabel	proc far		; CODE XREF: seg019:0299p seg019:0367p
					; DATA XREF: ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_1742F
		push	large 0
		mov	al, [si+32h]
		push	ax
		push	large dword ptr	[si+2Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si

loc_17423:
		add	ax, 12h
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_1742F:				; CODE XREF: UI_DrawWidgetLabel+Bj
		pop	si
		pop	bp
		retf
UI_DrawWidgetLabel	endp

; ���������������������������������������������������������������������������

loc_17432:				; DATA XREF: seg339:091Ao
		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di

loc_1743A:
		mov	si, [bp+6]
		mov	bx, [si+2]

loc_17440:
		push	word ptr [bx+1Eh]

loc_17443:
		mov	bx, [bx+1Eh]

loc_17446:
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	[bp-6],	ax
		mov	di, [bp-6]
		add	di, 12h
		add	di, 8
		mov	eax, [di]
		mov	edx, dword_70485
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		mov	[bp-4],	eax
		sar	eax, 8
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[bp-12h], edx
		mov	eax, [bp-12h]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	ebx, 64h ; 'd'
		cdq
		idiv	ebx
		mov	[bp-0Eh], eax
		imul	eax, 24h
		mov	[bp-16h], eax
		mov	[bp-1Ah], eax
		mov	ax, [bp-19h]
		mov	[si+38h], ax
		mov	bx, [si+2]
		mov	al, [bx+140h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[si+20h], al
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_174CA:				; DATA XREF: seg339:091Eo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+20h], 0
		jz	short loc_174EB
		push	si
		push	cs
		call	near ptr UI_DrawWidgetLabel
		pop	cx
		push	large 1D0008h
		push	si
		push	cs
		call	near ptr Gauge_DrawNeedle
		add	sp, 6

loc_174EB:				; CODE XREF: seg019:0295j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_174EE:				; DATA XREF: seg339:08FAo
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+6]
		mov	bx, [si+2]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, ax
		push	ax
		push	ss
		lea	ax, [bp-24h]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large dword ptr	[bp-1Ch]
		push	large dword ptr	[bp-20h]

loc_17521:
		push	large dword ptr	[bp-24h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch

loc_17531:
		mov	[bp-8],	eax

loc_17535:
		mov	[bp-4],	eax

loc_17539:
		mov	eax, [bp-4]
		mov	edx, dword_7048D

loc_17542:
		imul	edx

loc_17545:
		shrd	eax, edx, 8
		mov	[bp-4],	eax

loc_1754E:
		mov	eax, [bp-4]

loc_17552:
		imul	eax, 24h

loc_17556:
		mov	[bp-0Ch], eax
		mov	[bp-10h], eax
		mov	ebx, 55h ; 'U'
		cdq
		idiv	ebx
		mov	[bp-14h], eax
		mov	[bp-18h], eax
		mov	ax, [bp-17h]
		mov	[si+38h], ax
		cmp	word ptr [si+38h], 167h
		jle	short loc_17583
		mov	word ptr [si+38h], 167h

loc_17583:				; CODE XREF: seg019:033Cj
		mov	bx, [si+2]
		mov	al, [bx+140h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[si+20h], al
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_17598:				; DATA XREF: seg339:08FEo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+20h], 0
		jz	short loc_175B9
		push	si
		push	cs
		call	near ptr UI_DrawWidgetLabel
		pop	cx

loc_175AB:
		push	large 0E90008h
		push	si
		push	cs
		call	near ptr Gauge_DrawTick
		add	sp, 6

loc_175B9:				; CODE XREF: seg019:0363j
		pop	si
		pop	bp
		retf
seg019		ends
