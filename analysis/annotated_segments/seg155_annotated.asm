seg155		segment	byte public 'CODE' use16
		assume cs:seg155
		;org 3
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216) — parcourt une chaîne terminée par zéro et
; envoie chaque caractère via sub_1811 (encodage, seg120/142), avec conversion LF→CRLF (0x0A
; injecte un 0x0D avant). Référencée par Video_SetModeIfChanged_5E7EA (seg150) et seg158.
; ==============================================================================================
Video_PrintString_5EFD3	proc far		; CODE XREF: Video_SetModeIfChanged_5E7EA:loc_5E811P
					; seg158:0076P	...

var_22		= word ptr -22h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si

loc_5EFDA:				; DATA XREF: seg216:059Eo
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_12+1],	0Eh
		mov	[bp+var_10], 0
		jmp	short loc_5F00B
; ���������������������������������������������������������������������������

loc_5EFE7:				; CODE XREF: Video_PrintString_5EFD3+36j
					; Video_PrintString_5EFD3+42j
		mov	al, [bp+var_1]
		mov	byte ptr [bp+var_12], al
		lea	ax, [bp+var_22]
		push	ax

loc_5EFF1:
		lea	ax, [bp+var_12]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		cmp	[bp+var_1], 0Ah
		jnz	short loc_5F00B
		mov	[bp+var_1], 0Dh
		jmp	short loc_5EFE7
; ���������������������������������������������������������������������������

loc_5F00B:				; CODE XREF: Video_PrintString_5EFD3+12j
					; Video_PrintString_5EFD3+30j
		mov	bx, si
		inc	si
		mov	al, [bx]
		mov	[bp+var_1], al
		or	al, al
		jnz	short loc_5EFE7
		pop	si
		leave
		retf
Video_PrintString_5EFD3	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	byte ptr [bp-0Fh], 0
		lea	ax, [bp-10h]
		push	ax
		push	ax
		push	16h
		call	CRT_InstallProtectedHandler

loc_5F030:
		add	sp, 6

loc_5F033:
		mov	al, [bp-10h]
		mov	ah, 0
		mov	dx, ax
		or	dx, dx

loc_5F03C:
		jnz	short loc_5F048

loc_5F03E:
		mov	al, [bp-0Fh]
		mov	ah, 0

loc_5F043:
		or	ax, 100h
		mov	dx, ax

loc_5F048:				; CODE XREF: seg155:loc_5F03Cj
		mov	ax, dx
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_1811 — impression d'un caractère unique.
; ==============================================================================================
Video_PrintChar_5F04C	proc far		; CODE XREF: seg155:00F5p seg155:0117p ...

var_20		= word ptr -20h
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_F		= byte ptr -0Fh
var_D		= byte ptr -0Dh
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_F], 3
		mov	al, [bp+arg_2]
		mov	[bp+var_D], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, [bp+var_19]
		mov	[si], al
		mov	al, [bp+var_1A]
		mov	[si+1],	al
		pop	si
		leave
		retf
Video_PrintChar_5F04C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_1811 — variante d'impression de caractère.
; ==============================================================================================
Video_PrintCharVariant_5F080	proc far		; CODE XREF: seg155:010Ap seg155:0132p ...

var_20		= word ptr -20h
var_F		= byte ptr -0Fh
var_D		= byte ptr -0Dh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_F], 2
		mov	al, [bp+arg_2]
		mov	[bp+var_D], al
		mov	al, [si]

loc_5F096:
		mov	[bp+var_9], al
		mov	al, [si+1]
		mov	[bp+var_A], al

loc_5F09F:
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		pop	si
		leave
		retf
Video_PrintCharVariant_5F080	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	byte ptr [bp-6], 2
		push	0
		lea	ax, [bp-2]

loc_5F0C3:
		push	ax
		push	cs
		call	near ptr Video_PrintChar_5F04C
		add	sp, 4
		mov	byte ptr [bp-3], 0
		mov	byte ptr [bp-4], 31h ; '1'

loc_5F0D3:
		push	0
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Video_PrintCharVariant_5F080
		add	sp, 4
		push	0
		lea	ax, [bp-4]

loc_5F0E5:
		push	ax
		push	cs
		call	near ptr Video_PrintChar_5F04C
		add	sp, 4
		cmp	byte ptr [bp-4], 31h ; '1'
		jz	short loc_5F11F
		mov	byte ptr [bp-6], 1
		mov	byte ptr [bp-4], 27h ; '''
		push	0
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Video_PrintCharVariant_5F080
		add	sp, 4
		push	0
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Video_PrintChar_5F04C
		add	sp, 4
		cmp	byte ptr [bp-4], 31h ; '1'
		jz	short loc_5F11F
		mov	byte ptr [bp-6], 0

loc_5F11F:				; CODE XREF: seg155:0121j seg155:0149j
		push	0
		lea	ax, [bp-2]
		push	ax
		push	cs
		call	near ptr Video_PrintCharVariant_5F080
		add	sp, 4
		mov	al, [bp-6]
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		mov	byte ptr [bp-0Fh], 12h
		mov	byte ptr [bp-0Eh], 30h ; '0'
		mov	al, [bp+6]

loc_5F142:
		mov	[bp-10h], al
		lea	ax, [bp-20h]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	10h

loc_5F14F:
		call	CRT_InstallProtectedHandler
		add	sp, 6

locret_5F157:
		leave
		retf
; ���������������������������������������������������������������������������

loc_5F159:
		push	bp
		mov	bp, sp
		sub	sp, 22h

loc_5F15F:
		push	si
		mov	si, [bp+6]

loc_5F163:
		mov	byte ptr [bp-11h], 2
		jmp	short loc_5F18D
; ���������������������������������������������������������������������������

loc_5F169:				; CODE XREF: seg155:01BBj seg155:01C7j
		mov	al, [bp-1]
		mov	[bp-0Ch], al
		lea	ax, [bp-22h]
		push	ax
		lea	ax, [bp-12h]
		push	ax
		push	21h ; '!'
		call	CRT_InstallProtectedHandler
		add	sp, 6
		cmp	byte ptr [bp-1], 0Ah
		jnz	short loc_5F18D
		mov	byte ptr [bp-1], 0Dh
		jmp	short loc_5F169
; ���������������������������������������������������������������������������

loc_5F18D:				; CODE XREF: seg155:0197j seg155:01B5j
		mov	bx, si
		inc	si

loc_5F190:
		mov	al, [bx]

loc_5F192:
		mov	[bp-1],	al
		or	al, al
		jnz	short loc_5F169
		pop	si
		leave
		retf
seg155		ends
