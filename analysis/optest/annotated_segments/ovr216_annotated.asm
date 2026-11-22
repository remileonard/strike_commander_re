ovr216		segment	para public 'OVERLAY' use16
		assume cs:ovr216
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionText_ApplyDualStyle_97540 (sub_97540 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, applique deux styles de texte
; (TextFormat_ApplyStyleAttribute_5E2D0 ×2).
; ==============================================================================================
MissionText_ApplyDualStyle_C0F30	proc far		; CODE XREF: sub_4284AJ sub_C1056+4Bp	...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word_46F46
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+14h], ax
		mov	ax, [bp+var_4]
		mov	[si+16h], ax
		mov	ax, [bp+var_6]
		mov	[si+18h], ax
		mov	ax, [bp+var_8]
		mov	[si+1Ah], ax
		mov	ax, si
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, [bp+arg_6]
		sub	ax, di
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_8]
		sub	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	ax, [bp+var_A]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_C]
		mov	[si+0Ch], ax
		pop	di
		pop	si
		leave
		retf
MissionText_ApplyDualStyle_C0F30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0FBC	proc far		; CODE XREF: sub_4284FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_45DC6, 0
		jnz	short loc_C0FDF
		push	60B6h
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttributeB_2E9FD
		add	sp, 4
		mov	word_45DC6, si

loc_C0FDF:				; CODE XREF: sub_C0FBC+Cj
		pop	si
		pop	bp
		retf
sub_C0FBC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0FE2	proc far		; CODE XREF: sub_42854J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_45DC6, si
		jnz	short loc_C0FF7
		mov	word_45DC6, 0
		jmp	short loc_C1005
; ���������������������������������������������������������������������������

loc_C0FF7:				; CODE XREF: sub_C0FE2+Bj
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2

loc_C1005:				; CODE XREF: sub_C0FE2+13j
		pop	si
		pop	bp
		retf
sub_C0FE2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1008	proc far		; CODE XREF: sub_42859J sub_C17B8+14p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C1052
		mov	word ptr [si], 3257h
		cmp	word_45DC6, si
		jnz	short loc_C1027
		mov	word_45DC6, 0

loc_C1027:				; CODE XREF: sub_C1008+17j
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_C1052
		push	si
		call	sub_308
		add	sp, 2

loc_C1052:				; CODE XREF: sub_C1008+Dj
					; sub_C1008+3Fj
		pop	di
		pop	si
		pop	bp
		retf
sub_C1008	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1056	proc far		; CODE XREF: sub_4285EJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C1071
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C10A7

loc_C1071:				; CODE XREF: sub_C1056+9j
		mov	word ptr [si], 3257h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+0Fh], 0
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 0
		mov	byte ptr [si+1Dh], 0
		mov	word ptr [si], 3243h
		push	0C7h ; '�'
		push	13Fh
		push	0
		push	0
		push	si
		push	cs
		call	near ptr MissionText_ApplyDualStyle_C0F30
		add	sp, 0Ah

loc_C10A7:				; CODE XREF: sub_C1056+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C1056	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C10AF	proc far		; CODE XREF: sub_4287CJ sub_C110F+Cp

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	8
		push	323Ch
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	[bp+var_4], 4E2000h
		mov	eax, [bp+var_4]
		mov	[si+44h], eax
		mov	[bp+var_8], 2D00h
		mov	eax, [bp+var_8]
		mov	[si+5Eh], eax
		mov	[bp+var_C], 2800h
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	word ptr [si+5Ch], 0
		and	byte ptr [si+52h], 0FDh
		and	byte ptr [si+52h], 0FEh
		pop	si
		leave
		retf
sub_C10AF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C110F	proc far		; CODE XREF: sub_42881J sub_C1213+12Ep

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_C10AF
		add	sp, 2
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+44h], eax
		mov	eax, [bp+arg_8]
		mov	[si+5Eh], eax
		mov	eax, [bp+arg_C]
		mov	[si], eax
		mov	ax, [bp+arg_2]
		mov	[si+5Ch], ax
		pop	si
		leave
		retf
sub_C110F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1155	proc far		; CODE XREF: sub_42886J

var_2E		= word ptr -2Eh
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C1173
		push	7Eh ; '~'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C11DC

loc_C1173:				; CODE XREF: sub_C1155+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	sub_25718
		add	sp, 2
		mov	word ptr [si+50h], 2DACh
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	sub_C7A3
		add	sp, 2
		mov	ax, si
		add	ax, 5Eh	; '^'
		mov	ax, si
		add	ax, 62h	; 'b'
		mov	ax, si
		add	ax, 66h	; 'f'
		mov	ax, si
		add	ax, 6Ah	; 'j'
		mov	ax, si
		add	ax, 6Eh	; 'n'
		mov	ax, si
		add	ax, 72h	; 'r'
		mov	ax, si
		add	ax, 76h	; 'v'
		mov	ax, si
		add	ax, 7Ah	; 'z'
		push	large 2Eh ; '.'
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		lea	ax, [bp+var_2E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C1213
		add	sp, 4

loc_C11DC:				; CODE XREF: sub_C1155+1Cj
		mov	ax, si
		pop	si
		leave
		retf
sub_C1155	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C11E4	proc far		; CODE XREF: sub_42890J

var_2E		= word ptr -2Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		mov	si, [bp+arg_0]
		push	2Eh ; '.'
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_2E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C1213
		add	sp, 4
		pop	si
		leave
		retf
sub_C11E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1213	proc far		; CODE XREF: sub_4288BJ sub_C1155+81p	...

var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+18h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, [di+1Ah]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFullOrientation_26047
		add	sp, 8
		push	large dword ptr	[di+12h]
		push	large dword ptr	[di+0Eh]
		push	large dword ptr	[di+0Ah]
		mov	ax, si
		add	ax, 14h
		push	ax
		call	sub_24690
		add	sp, 0Eh
		mov	ax, [di+26h]
		mov	[bp+var_14], ax
		mov	ax, [di+28h]
		mov	[bp+var_16], ax
		mov	ax, [di+2Ah]
		mov	[bp+var_18], ax
		mov	ax, [di+2Ch]
		mov	[bp+var_1A], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1C], ax
		or	ax, ax
		jz	short loc_C1307
		mov	bx, [bp+var_1C]
		mov	word ptr [bx], 3257h
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2], 0
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+4], 0
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+0Fh], 0
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+10h], 0
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+12h], 0
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_1A]
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+var_14]
		push	[bp+var_1C]
		push	cs
		call	near ptr MissionText_ApplyDualStyle_C0F30
		add	sp, 0Ah
		mov	ax, [bp+var_1C]
		jmp	short loc_C130A
; ���������������������������������������������������������������������������

loc_C1307:				; CODE XREF: sub_C1213+A2j
		mov	ax, [bp+var_1C]

loc_C130A:				; CODE XREF: sub_C1213+F2j
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 22h	; '"'
		mov	[bp+var_1E], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		sub	sp, 4
		mov	ax, [di+20h]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_2E], eax
		push	large dword ptr	[di+1Ch]
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr sub_C110F
		add	sp, 10h
		mov	[bp+var_22], di
		push	8
		push	[bp+var_22]
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		pop	di
		pop	si
		leave
		retf
sub_C1213	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1365	proc far		; CODE XREF: sub_4289FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_C1380
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2

loc_C1380:				; CODE XREF: sub_C1365+Bj
		and	byte ptr [si+52h], 0FEh
		pop	si
		pop	bp
		retf
sub_C1365	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1387	proc far		; CODE XREF: sub_428A4J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C13D1
		mov	word ptr [si+50h], 2DACh
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+4]
		add	sp, 2
		cmp	word ptr [si+5Ch], 0
		jz	short loc_C13BD
		push	3
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short $+2

loc_C13BD:				; CODE XREF: sub_C1387+22j
		mov	word ptr [si+5Ch], 0
		test	di, 1
		jz	short loc_C13D1
		push	si
		call	sub_308
		add	sp, 2

loc_C13D1:				; CODE XREF: sub_C1387+Dj
					; sub_C1387+3Fj
		pop	di
		pop	si
		pop	bp
		retf
sub_C1387	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C13D5	proc far		; CODE XREF: sub_42895J

var_A		= dword	ptr -0Ah
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	bx, [bp+arg_0]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_C144F
		mov	bx, [bp+arg_0]
		push	word ptr [bx+5Ch]
		mov	bx, [bp+arg_0]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		sub	sp, 4
		mov	ax, [bp+arg_0]
		add	ax, 5Eh	; '^'
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_A], eax
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_C1537
		add	sp, 6
		mov	bx, [bp+arg_0]
		or	byte ptr [bx+52h], 1
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Ch]
		add	ax, 2
		jz	short loc_C1437
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Ch]
		add	ax, 6
		jmp	short loc_C1440
; ���������������������������������������������������������������������������

loc_C1437:				; CODE XREF: sub_C13D5+55j
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Ch]
		add	ax, 2

loc_C1440:				; CODE XREF: sub_C13D5+60j
		mov	di, [bp+arg_0]
		add	di, 48h	; 'H'
		push	ds
		pop	es
		assume es:dseg
		mov	si, ax
		mov	cx, 4
		rep movsw

loc_C144F:				; CODE XREF: sub_C13D5+Fj
		mov	bx, [bp+arg_0]
		mov	al, [bx+52h]
		and	ax, 1
		pop	di
		pop	si
		leave
		retf
sub_C13D5	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1460	proc far		; CODE XREF: sub_4289AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+52h]
		and	ax, 1
		or	al, al
		jz	short loc_C147B
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+8]
		add	sp, 2

loc_C147B:				; CODE XREF: sub_C1460+Fj
		pop	si
		pop	bp
		retf
sub_C1460	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C147E	proc far		; CODE XREF: sub_42863J MissionText_Helper4_C14F9+10p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	bx, [bp+arg_2]
		mov	ax, [bx+8]
		mov	bx, [bp+arg_2]
		sub	ax, [bx+4]
		inc	ax
		mov	bx, [bp+arg_0]
		mov	[bx+4],	ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+0Ah]
		mov	bx, [bp+arg_2]
		sub	ax, [bx+6]
		inc	ax
		mov	bx, [bp+arg_0]
		mov	[bx+6],	ax
		mov	bx, [bp+arg_0]
		mov	ax, [bx+4]
		sar	ax, 1
		mov	bx, [bp+arg_2]
		mov	dx, [bx+4]
		add	dx, ax
		mov	bx, [bp+arg_0]
		mov	[bx+8],	dx
		mov	bx, [bp+arg_0]
		mov	ax, [bx+6]
		sar	ax, 1
		mov	bx, [bp+arg_2]
		mov	dx, [bx+6]
		add	dx, ax
		mov	bx, [bp+arg_0]
		mov	[bx+0Ah], dx
		cmp	[bp+arg_2], 0
		jz	short loc_C14E3
		mov	ax, [bp+arg_2]
		add	ax, 4
		jmp	short loc_C14E6
; ���������������������������������������������������������������������������

loc_C14E3:				; CODE XREF: sub_C147E+5Bj
		mov	ax, [bp+arg_2]

loc_C14E6:				; CODE XREF: sub_C147E+63j
		mov	di, [bp+arg_0]
		add	di, 48h	; 'H'
		push	ds
		pop	es
		mov	si, ax
		mov	cx, 4
		rep movsw
		pop	di
		pop	si
		pop	bp
		retf
sub_C147E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionText_Helper4_97CB7 (sub_97CB7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (19 lignes).
; ==============================================================================================
MissionText_Helper4_C14F9	proc far		; CODE XREF: sub_42868J sub_C1537+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		push	si
		push	cs
		call	near ptr sub_C147E
		add	sp, 4
		pop	si
		pop	bp
		retf
MissionText_Helper4_C14F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionText_Helper5_97CD0 (sub_97CD0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (25 lignes).
; ==============================================================================================
MissionText_Helper5_C1512	proc far		; CODE XREF: sub_42877J

var_6		= dword	ptr -6
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_6]
		mov	[si], eax
		sub	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_6], eax
		push	si
		nop
		push	cs
		call	near ptr sub_C1537
		add	sp, 6
		pop	si
		pop	bp
		retf
MissionText_Helper5_C1512	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C1537	proc far		; CODE XREF: sub_42872J sub_C13D5+3Fp	...

var_C		= dword	ptr -0Ch
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr MissionText_Helper4_C14F9
		add	sp, 2
		cmp	[bp+arg_2], 0
		jg	short loc_C1555
		mov	ax, 1
		jmp	short loc_C1557
; ���������������������������������������������������������������������������

loc_C1555:				; CODE XREF: sub_C1537+17j
		xor	ax, ax

loc_C1557:				; CODE XREF: sub_C1537+1Cj
		or	al, al
		jz	short loc_C156B
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+arg_2], eax

loc_C156B:				; CODE XREF: sub_C1537+22j
		mov	eax, [bp+arg_2]
		mov	[si+5Eh], eax
		push	si
		nop
		push	cs
		call	near ptr sub_C157F
		add	sp, 2
		pop	si
		leave
		retf
sub_C1537	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C157F	proc far		; CODE XREF: sub_4286DJ sub_C1537+3Fp

var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= word ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= word ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	sub_22E2A
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	[si+62h], eax
		mov	ax, [si+4]
		sar	ax, 1
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax
		mov	ax, [si+6]
		sar	ax, 1
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_8], eax
		push	large 0
		push	large [bp+var_8]
		push	large [bp+var_C]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		call	sub_22EAE
		add	sp, 6
		mov	di, si
		mov	eax, [bp+var_28]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_1C], eax
		mov	[bp+var_36], si
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	bx, [bp+var_36]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[si+6Eh], eax
		mov	[bp+var_40], si
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	bx, [bp+var_40]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[si+72h], eax
		mov	ax, si
		add	ax, 6Eh	; 'n'
		push	ax
		push	ss
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_2313C
		add	sp, 6
		lea	ax, [bp+var_4C]
		push	ax
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		call	sub_22E2A
		add	sp, 6
		mov	[bp+var_54], 100h
		mov	eax, [bp+var_54]
		mov	edx, eax
		mov	ecx, [bp+var_50]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[si+66h], eax
		mov	ax, si
		add	ax, 72h	; 'r'
		push	ax
		push	ss
		lea	ax, [bp+var_60]
		push	ax
		call	sub_2313C
		add	sp, 6
		lea	ax, [bp+var_60]
		push	ax
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		call	sub_22E2A
		add	sp, 6
		mov	[bp+var_68], 100h
		mov	eax, [bp+var_68]
		mov	edx, eax
		mov	ecx, [bp+var_64]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[si+6Ah], eax
		mov	eax, [si]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[si+0Ch], eax
		mov	eax, [si+0Ch]
		mov	edx, dword_46258
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	[si+10h], eax
		pop	di
		pop	si
		leave
		retf
sub_C157F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C17B0	proc far		; CODE XREF: sub_42845J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_C17B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C17B8	proc far		; CODE XREF: sub_42840J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C17E5
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_C1008
		add	sp, 4
		test	di, 1
		jz	short loc_C17E3
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C17E3:				; CODE XREF: sub_C17B8+1Ej
		jmp	short $+2

loc_C17E5:				; CODE XREF: sub_C17B8+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_C17B8	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
ovr216		ends
