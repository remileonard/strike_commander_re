ovr241		segment	para public 'OVERLAY' use16
		assume cs:ovr241
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à UI_DrawRect (sub_144E5
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; far,25L — wrapper d'appel à sub_6AF02 avec position/dimensions d'un rectangle
; (structure+0x10) et 3 paramètres : primitive de dessin (rectangle/zone UI).
; ==============================================================================================
UI_DrawRect	proc far		; CODE XREF: sub_42E60J sub_C72E4+DEp

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		call	sub_42ED2
		add	sp, 0Ch
		pop	bp
		retf
UI_DrawRect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C6FD6	proc far		; CODE XREF: sub_42E65J

var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	di, [bp+arg_6]
		cmp	[bp+arg_E], 0
		jnz	short loc_C6FEF
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		jmp	short loc_C6FF6
; ���������������������������������������������������������������������������

loc_C6FEF:				; CODE XREF: sub_C6FD6+Fj
		les	bx, [bp+arg_0]
		mov	si, es:[bx+2]

loc_C6FF6:				; CODE XREF: sub_C6FD6+17j
		or	si, si
		jnz	short loc_C6FFE
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_C6FFE:				; CODE XREF: sub_C6FD6+22j
		cmp	[bp+arg_C], 0
		jnz	short loc_C7007
		jmp	loc_C709C
; ���������������������������������������������������������������������������

loc_C7007:				; CODE XREF: sub_C6FD6+2Cj
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	si
		call	sub_42ECD
		add	sp, 6
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_42EB9
		add	sp, 6
		mov	[bp+var_6], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_C], ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_10]
		sub	ax, [bp+var_14]
		inc	ax
		mov	bx, word_46F46
		mov	dx, [bx+8]
		mov	bx, word_46F46
		sub	dx, [bx+4]
		inc	dx
		sub	dx, ax
		shr	dx, 1
		mov	[bp+var_2], dx
		mov	bx, word_46F46
		mov	ax, [bx+8]
		mov	bx, word_46F46
		sub	ax, [bx+4]
		inc	ax
		sub	ax, [bp+var_4]
		sar	ax, 1
		mov	[bp+var_8], ax
		jmp	short loc_C70D8
; ���������������������������������������������������������������������������

loc_C709C:				; CODE XREF: sub_C6FD6+2Ej
		mov	bx, word_46F46
		mov	ax, [bx+8]
		mov	bx, word_46F46
		sub	ax, [bx+4]
		inc	ax
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_42EB9
		add	sp, 6
		mov	[bp+var_6], ax
		mov	[bp+var_2], 0
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_2]
		add	ax, es:[bx+98h]
		add	ax, 2
		mov	[bp+var_8], ax

loc_C70D8:				; CODE XREF: sub_C6FD6+C4j
		mov	ax, [bp+var_6]
		mov	[bp+var_18], ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_18]
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_1A]
		sub	ax, [bp+var_1E]
		inc	ax
		mov	[bp+var_16], ax
		mov	ax, di
		add	ax, [bp+var_16]
		dec	ax
		mov	bx, word_46F46
		cmp	ax, [bx+0Ah]
		jle	short loc_C7137
		mov	bx, word_46F46
		mov	ax, [bx+0Ah]
		inc	ax
		sub	ax, [bp+var_16]
		mov	di, ax

loc_C7137:				; CODE XREF: sub_C6FD6+152j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		shl	ax, 1
		mov	dx, [bp+var_16]
		sub	dx, ax
		sub	dx, [si+17h]
		shr	dx, 1
		les	bx, [bp+arg_0]
		mov	ax, di
		add	ax, es:[bx+9Ah]
		add	ax, dx
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_24], ax
		mov	[bp+var_26], di
		mov	ax, [bp+var_6]
		mov	[bp+var_28], ax
		push	[bp+var_28]
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_26]
		push	[bp+var_24]
		push	[bp+var_22]
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+arg_4]
		push	si
		call	sub_42ED2
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_C6FD6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C71C1	proc far		; CODE XREF: sub_42E6AJ

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_C7217
		les	bx, [bp+arg_0]
		mov	eax, dword_4645E
		add	es:[bx+0A5h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0A5h]
		les	bx, [bp+arg_0]
		cmp	eax, es:[bx+0A1h]
		jle	short loc_C7217
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 0
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0A5h], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 1

loc_C7217:				; CODE XREF: sub_C71C1+Cj
					; sub_C71C1+2Dj
		pop	bp
		retf
sub_C71C1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7219	proc far		; CODE XREF: sub_42E74J

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+9Ch], ax
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_C7238
		jmp	locret_C72E2
; ���������������������������������������������������������������������������

loc_C7238:				; CODE XREF: sub_C7219+1Aj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+94h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+6],	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_2], ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6],	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax

locret_C72E2:				; CODE XREF: sub_C7219+1Cj
		leave
		retf
sub_C7219	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C72E4	proc far		; CODE XREF: sub_42E6FJ

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_C72F8
		jmp	loc_C73C8
; ���������������������������������������������������������������������������

loc_C72F8:				; CODE XREF: sub_C72E4+Fj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0ADh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_C7309
		jmp	loc_C73C8
; ���������������������������������������������������������������������������

loc_C7309:				; CODE XREF: sub_C72E4+20j
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ApplyStyleAttributeB_2E9FD
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0ABh]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+92h]
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+94h]
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	bx, word_46F46
		mov	ax, [bx+8]
		mov	bx, word_46F46
		sub	ax, [bx+4]
		inc	ax
		les	bx, [bp+arg_0]
		sub	ax, es:[bx+90h]
		shr	ax, 1
		mov	[bp+var_A], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+94h]
		les	bx, [bp+arg_0]
		add	ax, es:[bx+9Eh]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_A]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr UI_DrawRect
		add	sp, 0Ah

loc_C73C8:				; CODE XREF: sub_C72E4+11j
					; sub_C72E4+22j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		leave
		retf
sub_C72E4	endp

ovr241		ends
