seg110		segment	byte public 'CODE' use16
		assume cs:seg110
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit une valeur dword (copiée depuis un pointeur far arg) dans un objet minuteur
; générique et pose son mode à 0 (absolu).
; ==============================================================================================
Timer_SetAbsolute_4F9A2	proc far		; CODE XREF: seg087:0275P Timer_SetAbsoluteAndResetPulses_4FAFC+Cp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_4F9AA:				; DATA XREF: seg216:0436o
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si], eax
		mov	byte ptr [si+4], 0
		pop	di
		pop	si
		pop	bp
		retf
Timer_SetAbsolute_4F9A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, convertit un nombre de frames (word) en valeur fixe 8.8 (<<8), l'écrit dans l'objet
; minuteur, pose le mode à 1 (relatif/frames).
; ==============================================================================================
Timer_SetRelativeFrames_4F9BB	proc far		; CODE XREF: seg104:00FBP seg110:018Dp ...

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[si], eax
		mov	byte ptr [si+4], 1
		pop	si
		leave
		retf
Timer_SetRelativeFrames_4F9BB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, décrémente le minuteur selon son mode (dword_70458 = temps global si mode0, 0x100 = 1
; frame fixe si mode1, sinon force à 0), retourne si le minuteur est encore actif (valeur>0).
; Utilisé par Trigger_TimedRangedSpawnOnce_4F351 (même sémantique de champ +0x55).
; ==============================================================================================
Timer_Tick_4F9E6	proc far		; CODE XREF: seg087:02A0P seg089:0762P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4FA00
		cmp	ax, 1
		jz	short loc_4FA09
		jmp	short loc_4FA12
; ���������������������������������������������������������������������������

loc_4FA00:				; CODE XREF: Timer_Tick_4F9E6+11j
		mov	eax, dword_70458
		sub	[si], eax
		jmp	short loc_4FA21
; ���������������������������������������������������������������������������

loc_4FA09:				; CODE XREF: Timer_Tick_4F9E6+16j
		sub	dword ptr [si],	100h
		jmp	short loc_4FA21
; ���������������������������������������������������������������������������

loc_4FA12:				; CODE XREF: Timer_Tick_4F9E6+18j
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si], eax

loc_4FA21:				; CODE XREF: Timer_Tick_4F9E6+21j
					; Timer_Tick_4F9E6+2Aj
		cmp	dword ptr [si],	0
		jle	short loc_4FA2C
		mov	ax, 1
		jmp	short loc_4FA2E
; ���������������������������������������������������������������������������

loc_4FA2C:				; CODE XREF: Timer_Tick_4F9E6+3Fj
		xor	ax, ax

loc_4FA2E:				; CODE XREF: Timer_Tick_4F9E6+44j
		pop	si
		leave
		retf
Timer_Tick_4F9E6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Timer_SetAbsolute écrivant via un pointeur far (es:bx) au lieu de si
; direct.
; ==============================================================================================
Timer_SetAbsoluteFarPtr_4FA31	proc far		; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+2D6P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_4FA32:
		mov	bp, sp

loc_4FA34:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]

loc_4FA3B:
		mov	eax, [si]

loc_4FA3E:
		mov	[bp+var_4], eax

loc_4FA42:
		mov	eax, [bp+var_4]

loc_4FA46:
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 0
		pop	si
		leave
		retf
Timer_SetAbsoluteFarPtr_4FA31	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		shl	eax, 8
		mov	[bp-6],	eax
		mov	eax, [bp-6]
		les	bx, [bp+6]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 1
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante far-pointeur (es:bx) de Timer_Tick.
; ==============================================================================================
Timer_TickFarPtr_4FA80	proc far		; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+3BAP

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4FAB5
		cmp	ax, 1
		jz	short loc_4FABF
		jmp	short loc_4FAC9
; ���������������������������������������������������������������������������

loc_4FAB5:				; CODE XREF: Timer_TickFarPtr_4FA80+2Cj
		mov	eax, dword_70458
		sub	[bp+var_4], eax
		jmp	short loc_4FAD9
; ���������������������������������������������������������������������������

loc_4FABF:				; CODE XREF: Timer_TickFarPtr_4FA80+31j
		sub	[bp+var_4], 100h
		jmp	short loc_4FAD9
; ���������������������������������������������������������������������������

loc_4FAC9:				; CODE XREF: Timer_TickFarPtr_4FA80+33j
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_4FAD9:				; CODE XREF: Timer_TickFarPtr_4FA80+3Dj
					; Timer_TickFarPtr_4FA80+47j
		mov	eax, [bp+var_4]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		cmp	[bp+var_4], 0
		jle	short loc_4FAF8
		mov	ax, 1
		jmp	short locret_4FAFA
; ���������������������������������������������������������������������������

loc_4FAF8:				; CODE XREF: Timer_TickFarPtr_4FA80+71j
		xor	ax, ax

locret_4FAFA:				; CODE XREF: Timer_TickFarPtr_4FA80+76j
		leave
		retf
Timer_TickFarPtr_4FA80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Timer_SetAbsolute puis remet à zéro 4 octets de compteurs/flags de pulsation
; (+5..+8) de l'objet.
; ==============================================================================================
Timer_SetAbsoluteAndResetPulses_4FAFC	proc far		; CODE XREF: PlayerComponent_InitPulseTimer_A0455+29P
					; PlayerComponent_RegisterAndInitPulses_A0B40+3CP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Timer_SetAbsolute_4F9A2
		add	sp, 4
		mov	byte ptr [si+5], 0
		mov	byte ptr [si+6], 0
		mov	byte ptr [si+7], 0
		mov	byte ptr [si+8], 0
		pop	si
		pop	bp
		retf
Timer_SetAbsoluteAndResetPulses_4FAFC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr Timer_SetRelativeFrames_4F9BB
		add	sp, 4
		mov	byte ptr [si+5], 0

loc_4FB37:
		mov	byte ptr [si+6], 0
		mov	byte ptr [si+7], 0

loc_4FB3F:
		mov	byte ptr [si+8], 0
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, incrémente 2 compteurs modulo (5 et 10) posant des flags de pulsation (+7 tous les 5,
; +8 tous les 10), puis appelle Timer_Tick. Référencé par seg090/seg092 (HUD/armement) —
; probable minuteur de clignotement d'alerte.
; ==============================================================================================
Timer_TickWithBlinkPulses_4FB46	proc far		; CODE XREF: seg090:0049P seg092:00B2P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		inc	byte ptr [si+5]
		inc	byte ptr [si+6]
		cmp	byte ptr [si+5], 5
		jnz	short loc_4FB63
		mov	byte ptr [si+7], 1
		mov	byte ptr [si+5], 0
		jmp	short loc_4FB67
; ���������������������������������������������������������������������������

loc_4FB63:				; CODE XREF: Timer_TickWithBlinkPulses_4FB46+11j
		mov	byte ptr [si+7], 0

loc_4FB67:				; CODE XREF: Timer_TickWithBlinkPulses_4FB46+1Bj
		cmp	byte ptr [si+6], 0Ah
		jnz	short loc_4FB77
		mov	byte ptr [si+8], 1
		mov	byte ptr [si+6], 0
		jmp	short loc_4FB7B
; ���������������������������������������������������������������������������

loc_4FB77:				; CODE XREF: Timer_TickWithBlinkPulses_4FB46+25j
		mov	byte ptr [si+8], 0

loc_4FB7B:				; CODE XREF: Timer_TickWithBlinkPulses_4FB46+2Fj
		push	si
		push	cs
		call	near ptr Timer_Tick_4F9E6

loc_4FB80:
		pop	cx
		pop	si
		pop	bp
		retf
Timer_TickWithBlinkPulses_4FB46	endp

seg110		ends
