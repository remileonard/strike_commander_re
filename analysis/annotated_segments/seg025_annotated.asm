seg025		segment	byte public 'CODE' use16
		assume cs:seg025
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_1A88F:				; DATA XREF: seg339:off_6DDCEo
					; seg339:0D46o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		mov	es:[bx+6], eax
		mov	ax, [di]
		add	es:[bx+6], ax
		mov	ax, [di+2]
		add	es:[bx+8], ax
		mov	ax, [bp+0Ch]
		mov	es:[bx+28h], ax
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,17L — remet à zéro plusieurs champs (+0x12/0x16/0x18/0x1A) : destructeur/reset d'une
; structure de sous-liste (probable inventaire d'un widget UI).
; ==============================================================================================
UI_ResetSublist	proc far		; CODE XREF: seg027:00DFP
					; UISublist_ResetAndCopy_8C930+43P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_1A8BF:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+16h], 0
		mov	word ptr es:[bx+18h], 0
		mov	dword ptr es:[bx+1Ah], 0
		mov	dword ptr es:[bx+12h], 0
		pop	bp
		retf
UI_ResetSublist	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — itère un tableau de pointeurs (+0x1A, compteur +0x18) appelant vtable[0xC] avec 2
; arguments : notification des enfants d'un second groupe (variante de sub_1A7CD).
; ==============================================================================================
UI_NotifyGroup2	proc far		; CODE XREF: seg025:023Dp seg025:0503p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Ah]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_1A917
; ���������������������������������������������������������������������������

loc_1A8F9:				; CODE XREF: UI_NotifyGroup2+3Cj
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		inc	si
		add	word ptr [bp+var_4], 4

loc_1A917:				; CODE XREF: UI_NotifyGroup2+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+18h], si
		jg	short loc_1A8F9
		pop	si
		leave
		retf
UI_NotifyGroup2	endp

; ���������������������������������������������������������������������������

loc_1A923:				; DATA XREF: seg339:0D0Ao seg339:0D16o ...
		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+0Ch]
		mov	word ptr [bp-32h], 0
		mov	word ptr [bp-30h], 0
		mov	byte ptr [bp-25h], 0
		push	word ptr [bp+0Ah]
		lea	ax, [bp-32h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		add	ax, [si]
		mov	[bp-2],	ax
		mov	ax, es:[bx+0Ch]
		add	ax, [si+2]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		mov	ax, es:[bx+0Eh]
		add	ax, [si]
		mov	[bp-0Ah], ax
		mov	ax, es:[bx+10h]
		add	ax, [si+2]
		mov	[bp-0Ch], ax
		mov	ax, [bp-6]
		mov	[bp-2Eh], ax
		mov	ax, [bp-8]
		mov	[bp-2Ch], ax
		mov	ax, [bp-0Ah]
		mov	[bp-2Ah], ax
		mov	ax, [bp-0Ch]
		mov	[bp-28h], ax
		mov	di, [bp+0Eh]
		lea	ax, [bp-4Ah]
		mov	[bp-0Eh], ax
		mov	ax, di
		add	ax, 2
		mov	[bp-10h], ax
		cmp	word ptr [bp-0Eh], 0
		jz	short loc_1A9B4
		mov	ax, [bp-0Eh]
		jmp	short loc_1A9BF
; ���������������������������������������������������������������������������

loc_1A9B4:				; CODE XREF: seg025:012Dj
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-0Eh], ax

loc_1A9BF:				; CODE XREF: seg025:0132j
		or	ax, ax
		jz	short loc_1A9DD

loc_1A9C3:
		mov	bx, [bp-0Eh]
		mov	word ptr [bx], 0
		mov	word ptr [bx+2], 0
		push	word ptr [bp-10h]
		push	bx

loc_1A9D3:
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4

loc_1A9DB:
		jmp	short $+2

loc_1A9DD:				; CODE XREF: seg025:0141j
		mov	dx, di

loc_1A9DF:
		add	dx, 10h

loc_1A9E2:
		mov	bx, dx

loc_1A9E4:
		mov	ax, [bx]

loc_1A9E6:
		mov	[bp-3Ch], ax
		mov	ax, [bx+2]
		mov	[bp-3Ah], ax
		mov	ax, [di+14h]
		mov	[bp-38h], ax
		mov	al, [di+16h]
		mov	[bp-36h], al
		mov	al, [di+17h]
		mov	[bp-35h], al
		mov	al, [di+18h]
		mov	[bp-34h], al
		mov	word ptr [bp-4Ch], 0D56h
		lea	ax, [bp-32h]
		push	ax
		lea	ax, [bp-4Ah]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 6
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	bx, [bp-18h]
		mov	ax, es:[bx]
		mov	[bp-1Ch], ax
		mov	ax, es:[bx+2]
		mov	[bp-1Ah], ax
		mov	eax, [bp-1Ch]
		mov	[bp-14h], eax
		mov	al, [bp+10h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1AA71
		mov	ax, [si]
		add	ax, [bp-14h]
		mov	[bp-1Eh], ax
		mov	ax, [si+2]
		add	ax, [bp-12h]
		mov	[bp-20h], ax
		mov	ax, [bp-1Eh]
		mov	[bp-24h], ax
		mov	ax, [bp-20h]
		mov	[bp-22h], ax
		mov	eax, [bp-24h]
		mov	[bp-14h], eax

loc_1AA71:				; CODE XREF: seg025:01CAj
		push	large 0
		les	bx, [bp+6]
		mov	al, es:[bx+22h]
		push	ax
		push	large dword ptr	es:[bx+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large dword ptr	[bp-14h]
		lea	ax, [bp-32h]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	ax, [bp-14h]
		sub	ax, [bp-2]
		mov	[bp-14h], ax
		mov	ax, [bp-12h]
		sub	ax, [bp-4]
		mov	[bp-12h], ax
		lea	ax, [bp-4Ch]
		push	ax
		lea	ax, [bp-14h]
		push	ax
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr UI_NotifyGroup2
		add	sp, 8

loc_1AAC3:
		lea	ax, [bp-4Ah]

loc_1AAC6:
		push	ax

loc_1AAC7:
		call	TextFormat_ReleaseStyleList_5E526

loc_1AACC:
		pop	cx

loc_1AACD:
		lea	ax, [bp-32h]

loc_1AAD0:
		push	ax

loc_1AAD1:
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx

loc_1AAD7:
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,24L — positionne un bit dans un bitfield (+0x2A) à l'index arg_4, avec contrôle de borne
; (+0x30) : setter de bit dans un tableau de booléens (états de checkbox/case à cocher).
; ==============================================================================================
Bitset_SetBit	proc far		; CODE XREF: seg020:0048P seg020:00DAP ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_1AADF:
		mov	dx, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	es:[bx+30h], dx
		jle	short loc_1AAF6
		mov	si, 1
		mov	cl, dl
		shl	si, cl
		or	es:[bx+2Ah], si

loc_1AAF6:				; CODE XREF: Bitset_SetBit+Ej
		pop	si
		pop	bp
		retf
Bitset_SetBit	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — teste le bit correspondant à arg_4 dans le bitfield (+0x2A) : getter de bit (état
; d'une checkbox/case).
; ==============================================================================================
Bitset_TestBit	proc far		; CODE XREF: seg025:loc_1ACCBp
					; seg025:0490p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_4]
		mov	cl, 0
		les	bx, [bp+arg_0]
		cmp	es:[bx+30h], dx
		jle	short loc_1AB21
		mov	si, 1
		mov	cl, dl
		shl	si, cl
		test	es:[bx+2Ah], si
		jz	short loc_1AB1D
		mov	ax, 1
		jmp	short loc_1AB1F
; ���������������������������������������������������������������������������

loc_1AB1D:				; CODE XREF: Bitset_TestBit+1Dj
		xor	ax, ax

loc_1AB1F:				; CODE XREF: Bitset_TestBit+22j
		mov	cl, al

loc_1AB21:				; CODE XREF: Bitset_TestBit+10j
		mov	al, cl
		pop	si
		pop	bp
		retf
Bitset_TestBit	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	ax, es:[bx+30h]
		cmp	ax, [bp+0Ah]
		jle	short loc_1AB43
		mov	dx, 1
		mov	cl, [bp+0Ah]
		shl	dx, cl
		not	dx
		and	es:[bx+2Ah], dx

loc_1AB43:				; CODE XREF: seg025:02B3j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — écrit une paire de coordonnées 2D dans un tableau indexé (+0x2C) : setter de
; position d'un élément dans une liste (grille de widgets).
; ==============================================================================================
Grid_SetElementPos	proc far		; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+211P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	di, [bp+arg_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx+30h], dx
		jle	short loc_1AB7E
		shl	dx, 1
		les	bx, es:[bx+2Ch]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, [di]
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2Ch]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, [di+2]
		mov	es:[bx+2], ax

loc_1AB7E:				; CODE XREF: Grid_SetElementPos+12j
		pop	di
		pop	si
		pop	bp
		retf
Grid_SetElementPos	endp

; ���������������������������������������������������������������������������

loc_1AB82:				; DATA XREF: seg339:off_6DDD2o
		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+0Ch]
		mov	word ptr [bp-2Eh], 0
		mov	word ptr [bp-2Ch], 0
		mov	byte ptr [bp-21h], 0
		push	word ptr [bp+0Ah]
		lea	ax, [bp-2Eh]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		add	ax, [si]
		mov	[bp-2],	ax
		mov	ax, es:[bx+0Ch]
		add	ax, [si+2]
		mov	[bp-4],	ax
		mov	ax, es:[bx+0Eh]
		add	ax, [si]

loc_1ABC6:
		mov	[bp-6],	ax
		mov	ax, es:[bx+10h]

loc_1ABCD:
		add	ax, [si+2]
		mov	[bp-8],	ax

loc_1ABD3:
		mov	ax, [bp-2]
		mov	[bp-2Ah], ax
		mov	ax, [bp-4]

loc_1ABDC:
		mov	[bp-28h], ax
		mov	ax, [bp-6]
		mov	[bp-26h], ax
		mov	ax, [bp-8]
		mov	[bp-24h], ax
		mov	di, [bp+0Eh]
		lea	ax, [bp-46h]
		mov	[bp-0Ah], ax
		mov	ax, di
		add	ax, 2
		mov	[bp-0Ch], ax
		cmp	word ptr [bp-0Ah], 0
		jz	short loc_1AC07
		mov	ax, [bp-0Ah]
		jmp	short loc_1AC12
; ���������������������������������������������������������������������������

loc_1AC07:				; CODE XREF: seg025:0380j
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-0Ah], ax

loc_1AC12:				; CODE XREF: seg025:0385j
		or	ax, ax
		jz	short loc_1AC30
		mov	bx, [bp-0Ah]
		mov	word ptr [bx], 0
		mov	word ptr [bx+2], 0
		push	word ptr [bp-0Ch]
		push	bx
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		jmp	short $+2

loc_1AC30:				; CODE XREF: seg025:0394j
		mov	dx, di
		add	dx, 10h
		mov	bx, dx
		mov	ax, [bx]
		mov	[bp-38h], ax
		mov	ax, [bx+2]
		mov	[bp-36h], ax
		mov	ax, [di+14h]
		mov	[bp-34h], ax
		mov	al, [di+16h]
		mov	[bp-32h], al
		mov	al, [di+17h]
		mov	[bp-31h], al
		mov	al, [di+18h]
		mov	[bp-30h], al
		mov	word ptr [bp-48h], 0D56h
		lea	ax, [bp-2Eh]
		push	ax
		lea	ax, [bp-46h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 6
		mov	[bp-12h], ax
		mov	[bp-14h], dx
		les	bx, [bp-14h]
		mov	ax, es:[bx]
		mov	[bp-18h], ax
		mov	ax, es:[bx+2]
		mov	[bp-16h], ax
		mov	eax, [bp-18h]
		mov	[bp-10h], eax
		mov	al, [bp+10h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1ACC4
		mov	ax, [si]
		add	ax, [bp-10h]
		mov	[bp-1Ah], ax
		mov	ax, [si+2]
		add	ax, [bp-0Eh]
		mov	[bp-1Ch], ax
		mov	ax, [bp-1Ah]
		mov	[bp-20h], ax
		mov	ax, [bp-1Ch]
		mov	[bp-1Eh], ax
		mov	eax, [bp-20h]

loc_1ACC0:
		mov	[bp-10h], eax

loc_1ACC4:				; CODE XREF: seg025:041Dj
		push	0
		push	large dword ptr	[bp+6]
		push	cs

loc_1ACCB:
		call	near ptr Bitset_TestBit
		add	sp, 6
		or	al, al
		jz	short loc_1AD02
		push	large 0

loc_1ACD8:
		les	bx, [bp+6]
		mov	al, es:[bx+22h]
		push	ax
		push	large dword ptr	es:[bx+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large dword ptr	[bp-10h]
		lea	ax, [bp-2Eh]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_1AD02:				; CODE XREF: seg025:0453j
		xor	si, si
		jmp	short loc_1AD6D
; ���������������������������������������������������������������������������

loc_1AD06:				; CODE XREF: seg025:04F4j
		mov	di, si
		shl	di, 1
		push	si
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Bitset_TestBit
		add	sp, 6
		or	al, al
		jz	short loc_1AD6C
		push	si
		push	0
		les	bx, [bp+6]
		mov	al, es:[bx+22h]
		push	ax
		push	large dword ptr	es:[bx+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+2Ch]
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp-0Eh]
		add	ax, es:[bx+2]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+2Ch]
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp-10h]
		add	ax, es:[bx]
		push	ax
		lea	ax, [bp-2Eh]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_1AD6C:				; CODE XREF: seg025:0498j
		inc	si

loc_1AD6D:				; CODE XREF: seg025:0484j
		les	bx, [bp+6]
		cmp	es:[bx+30h], si
		jg	short loc_1AD06
		lea	ax, [bp-48h]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	word ptr [bp+8]
		push	bx
		push	cs
		call	near ptr UI_NotifyGroup2
		add	sp, 8
		lea	ax, [bp-46h]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		lea	ax, [bp-2Eh]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jnz	short loc_1ADB5
		jmp	loc_1AE5E
; ���������������������������������������������������������������������������

loc_1ADB5:				; CODE XREF: seg025:0530j
		les	bx, [bp+6]
		mov	word ptr es:[bx], 0D1Eh
		push	0
		push	2

loc_1ADC1:
		mov	eax, es:[bx+2Ch]

loc_1ADC6:
		mov	[bp-4],	eax

loc_1ADCA:
		lea	ax, [bp-4]
		push	ax
		push	5C44h

loc_1ADD1:
		call	Memory_TypedFree_5C7B6

loc_1ADD6:
		add	sp, 8

loc_1ADD9:
		les	bx, [bp+6]

loc_1ADDC:
		mov	dword ptr es:[bx+2Ch], 0

loc_1ADE5:
		cmp	byte ptr es:[bx+23h], 0
		jz	short loc_1AE15
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_1AE15
		push	0
		mov	al, es:[bx+22h]
		push	ax
		mov	eax, es:[bx+1Eh]
		mov	[bp-8],	eax
		lea	ax, [bp-8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_1AE15:				; CODE XREF: seg025:056Aj seg025:0572j
		les	bx, [bp+6]
		mov	dword ptr es:[bx+1Eh], 0
		mov	byte ptr es:[bx+23h], 0
		mov	dword ptr es:[bx+24h], 0
		push	0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6B4E4
		add	sp, 6
		test	si, 1
		jz	short loc_1AE5E
		mov	eax, [bp+6]
		mov	[bp-0Ch], eax
		push	0
		push	2
		lea	ax, [bp-0Ch]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_1AE5E:				; CODE XREF: seg025:0532j seg025:05C1j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1AE61:				; DATA XREF: seg339:0D12o
		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+12h]
		les	bx, es:[bx+12h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-4],	eax
		les	bx, [bp+6]
		movsx	ebx, word ptr es:[bx+32h]
		cdq
		idiv	ebx
		mov	bx, [bp+6]
		movsx	edx, word ptr es:[bx+32h]
		imul	eax, edx
		mov	cx, [bp-4]
		sub	cx, ax
		movsx	eax, cx
		sub	[bp-4],	eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 38h	; '8'
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]

loc_1AEC2:
		mov	eax, es:[bx]

loc_1AEC6:
		mov	[bp-8],	eax

loc_1AECA:
		mov	[bp-0Eh], cx

loc_1AECD:
		movsx	eax, word ptr [bp-0Eh]

loc_1AED2:
		mov	edx, [bp-8]

loc_1AED6:
		imul	edx, eax
		mov	[bp-12h], edx
		mov	eax, [bp-12h]
		mov	[bp-16h], eax
		mov	ax, [bp-15h]
		mov	[di+2],	ax
		mov	word ptr [di], 0
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		mov	es:[bx+6], eax
		mov	ax, [di]
		add	es:[bx+6], ax
		mov	ax, [di+2]
		add	es:[bx+8], ax
		push	large dword ptr	[bp-4]
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1AF1F:				; DATA XREF: seg339:0D1Ao
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+6]
		mov	ax, es:[bx+34h]
		imul	word ptr es:[bx+32h]
		movsx	eax, ax
		mov	edx, [bp+0Ah]
		add	edx, eax
		mov	[bp-4],	edx
		mov	eax, es:[bx+2Ah]
		cmp	eax, [bp-4]
		jle	short loc_1AF4D
		jmp	short loc_1AF5B
; ���������������������������������������������������������������������������

loc_1AF4D:				; CODE XREF: seg025:06C9j
		les	bx, [bp+6]
		mov	eax, es:[bx+2Eh]
		cmp	eax, [bp-4]
		jge	short loc_1AF5F

loc_1AF5B:				; CODE XREF: seg025:06CBj
		mov	[bp-4],	eax

loc_1AF5F:				; CODE XREF: seg025:06D9j
		les	bx, [bp+6]
		mov	eax, es:[bx+1Ah]
		mov	[bp-8],	eax
		xor	si, si
		jmp	short loc_1AFB6
; ���������������������������������������������������������������������������

loc_1AF6F:				; CODE XREF: seg025:073Dj
		les	bx, [bp+6]
		movsx	ebx, word ptr es:[bx+36h]
		mov	eax, [bp-4]
		cdq
		idiv	ebx
		push	ax
		les	bx, [bp-8]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		les	bx, [bp+6]
		movsx	eax, word ptr es:[bx+32h]
		sub	[bp-4],	eax
		mov	eax, es:[bx+2Eh]
		cmp	eax, [bp-4]
		jge	short loc_1AFB1
		mov	[bp-4],	eax

loc_1AFB1:				; CODE XREF: seg025:072Bj
		inc	si
		add	word ptr [bp-8], 4

loc_1AFB6:				; CODE XREF: seg025:06EDj
		les	bx, [bp+6]
		cmp	es:[bx+18h], si
		jg	short loc_1AF6F
		pop	si
		leave

locret_1AFC1:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,24L — setter simple du champ +0x2A (probable délégué/callback) : accesseur trivial de
; classe UI.
; ==============================================================================================
UI_SetCallback	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+357P
					; MissionRecord_LoadWithDwordFieldsB_89F00+388P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp

loc_1AFC5:
		les	bx, [bp+arg_0]

loc_1AFC8:
		mov	eax, [bp+arg_4]

loc_1AFCC:
		mov	es:[bx+2Ah], eax

loc_1AFD1:
		pop	bp

locret_1AFD2:
		retf
UI_SetCallback	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — setter simple du champ +0x2E : accesseur trivial de classe UI.
; ==============================================================================================
UI_SetField2E	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+36DP
					; MissionRecord_LoadWithDwordFieldsB_89F00+39EP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2Eh], eax
		pop	bp
		retf
UI_SetField2E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — setter simple du champ +0x32 : accesseur trivial de classe UI.
; ==============================================================================================
UI_SetField32	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+37EP
					; MissionRecord_LoadWithDwordFieldsB_89F00+3AFP ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+32h], ax
		pop	bp
		retf
UI_SetField32	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — setter du champ +0x38 depuis un pointeur déréférencé : accesseur trivial de classe
; UI.
; ==============================================================================================
UI_SetField38	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+3D7P
					; MissionRecord_LoadWithDwordFieldsB_89F00+408P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+38h], eax
		pop	si
		leave
		retf
UI_SetField38	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — setter simple du champ +0x34 : accesseur trivial de classe UI.
; ==============================================================================================
UI_SetField34	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+3EAP
					; MissionRecord_LoadWithDwordFieldsB_89F00+41BP ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+34h], ax
		pop	bp
		retf
UI_SetField34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — setter simple du champ +0x36 : accesseur trivial de classe UI.
; ==============================================================================================
UI_SetField36	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+3FDP
					; MissionRecord_LoadWithDwordFieldsB_89F00:loc_8A32EP	...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+36h], ax
		pop	bp
		retf
UI_SetField36	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	eax, es:[bx+2Ah]
		shld	edx, eax, 10h
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	eax, es:[bx+2Eh]
		shld	edx, eax, 10h
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	ax, es:[bx+32h]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 38h	; '8'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		or	si, si
		jz	short loc_1B082
		mov	ax, si
		jmp	short loc_1B08C
; ���������������������������������������������������������������������������

loc_1B082:				; CODE XREF: seg025:07FCj
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_1B08C:				; CODE XREF: seg025:0800j
		or	ax, ax
		jz	short loc_1B09E
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[si], eax
		mov	ax, si
		jmp	short loc_1B0A0
; ���������������������������������������������������������������������������

loc_1B09E:				; CODE XREF: seg025:080Ej
		mov	ax, si

loc_1B0A0:				; CODE XREF: seg025:081Cj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	ax, es:[bx+34h]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B0B5:				; DATA XREF: seg339:0D06o
		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	di, [bp+0Ah]

loc_1B0C0:
		les	bx, [bp+6]

loc_1B0C3:
		push	large dword ptr	es:[bx+12h]
		les	bx, es:[bx+12h]

loc_1B0CC:
		mov	bx, es:[bx]

loc_1B0CF:
		call	dword ptr [bx]
		push	dx
		push	ax

loc_1B0D3:
		pop	eax
		add	sp, 4
		mov	[bp-4],	eax
		les	bx, [bp+6]

loc_1B0DF:
		movsx	ebx, word ptr es:[bx+32h]
		cdq
		idiv	ebx
		mov	bx, [bp+6]
		movsx	edx, word ptr es:[bx+32h]
		imul	eax, edx
		mov	cx, [bp-4]
		sub	cx, ax
		movsx	eax, cx
		sub	[bp-4],	eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 38h	; '8'
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	[bp-0Eh], cx
		movsx	eax, word ptr [bp-0Eh]
		mov	edx, [bp-8]
		imul	edx, eax
		mov	[bp-12h], edx
		mov	eax, [bp-12h]
		mov	[bp-16h], eax
		neg	eax
		mov	[bp-1Ah], eax
		mov	[bp-1Eh], eax
		mov	ax, [bp-1Dh]
		mov	[di], ax
		mov	word ptr [di+2], 0
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		mov	es:[bx+6], eax
		mov	ax, [di]
		add	es:[bx+6], ax
		mov	ax, [di+2]
		add	es:[bx+8], ax
		push	large dword ptr	[bp-4]
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1B17E:				; DATA XREF: seg339:0D0Eo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+6]
		mov	ax, es:[bx+34h]
		imul	word ptr es:[bx+32h]
		movsx	eax, ax
		mov	edx, [bp+0Ah]
		sub	edx, eax
		mov	[bp-4],	edx
		mov	eax, es:[bx+2Ah]
		cmp	eax, [bp-4]
		jle	short loc_1B1BC
		mov	eax, es:[bx+2Eh]
		sub	eax, es:[bx+2Ah]
		inc	eax
		add	[bp-4],	eax
		jmp	short loc_1B1D5
; ���������������������������������������������������������������������������

loc_1B1BC:				; CODE XREF: seg025:0928j
		les	bx, [bp+6]

loc_1B1BF:
		mov	eax, es:[bx+2Eh]
		cmp	eax, [bp-4]
		jge	short loc_1B1D5
		sub	eax, es:[bx+2Ah]
		inc	eax

loc_1B1D1:
		sub	[bp-4],	eax

loc_1B1D5:				; CODE XREF: seg025:093Aj seg025:0948j
		les	bx, [bp+6]

loc_1B1D8:
		mov	eax, es:[bx+1Ah]

loc_1B1DD:
		mov	[bp-8],	eax
		xor	si, si
		jmp	short loc_1B233
; ���������������������������������������������������������������������������

loc_1B1E5:				; CODE XREF: seg025:09BAj
		les	bx, [bp+6]
		movsx	ebx, word ptr es:[bx+36h]
		mov	eax, [bp-4]
		cdq
		idiv	ebx
		push	ax
		les	bx, [bp-8]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		les	bx, [bp+6]
		movsx	eax, word ptr es:[bx+32h]
		add	[bp-4],	eax
		mov	eax, es:[bx+2Eh]
		cmp	eax, [bp-4]
		jge	short loc_1B22E
		sub	eax, es:[bx+2Ah]
		inc	eax
		sub	[bp-4],	eax

loc_1B22E:				; CODE XREF: seg025:09A1j
		inc	si
		add	word ptr [bp-8], 4

loc_1B233:				; CODE XREF: seg025:0963j
		les	bx, [bp+6]
		cmp	es:[bx+18h], si
		jg	short loc_1B1E5
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,93L — combine une position (+2) et une dimension (+0x1E), avec ajustement optionnel via
; sub_58344 (probable conversion d'unité/échelle écran) : calcul de rectangle d'affichage d'un
; widget avec échelle.
; ==============================================================================================
UI_ComputeScaledRect	proc far		; CODE XREF: seg027:08A3P seg027:08F8P ...

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		les	bx, [bp+var_C]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_10], ax
		mov	ax, es:[bx+2]
		mov	word ptr [bp+var_10+2],	ax
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1Eh
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx
		les	bx, [bp+var_14]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_18], ax
		mov	ax, es:[bx+2]
		mov	word ptr [bp+var_18+2],	ax
		mov	eax, [bp+var_18]
		mov	[bp+var_8], eax
		or	si, si
		jz	short loc_1B2B9
		push	si
		lea	ax, [bp+var_4]
		push	ax
		call	Math_ComputeSinCosPair_58344
		add	sp, 4
		push	si
		lea	ax, [bp+var_8]
		push	ax
		call	Math_ComputeSinCosPair_58344
		add	sp, 4

loc_1B2B9:				; CODE XREF: UI_ComputeScaledRect+5Ej
		mov	si, di
		mov	ax, [si]
		add	word ptr [bp+var_4], ax
		mov	ax, [si+2]

loc_1B2C3:
		add	word ptr [bp+var_4+2], ax
		mov	si, di

loc_1B2C8:
		mov	ax, [si]
		add	word ptr [bp+var_8], ax

loc_1B2CD:
		mov	ax, [si+2]
		add	word ptr [bp+var_8+2], ax
		mov	ax, word ptr [bp+var_4]
		mov	word ptr [bp+var_1C], ax
		mov	ax, word ptr [bp+var_4+2]
		mov	word ptr [bp+var_1C+2],	ax
		mov	eax, [bp+var_1C]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], eax
		mov	ax, word ptr [bp+var_8]
		mov	word ptr [bp+var_20], ax
		mov	ax, word ptr [bp+var_8+2]
		mov	word ptr [bp+var_20+2],	ax
		mov	eax, [bp+var_20]
		mov	es:[bx+22h], eax
		pop	di
		pop	si
		leave
		retf
UI_ComputeScaledRect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,133L — variante de sub_1B23F sur des offsets différents (+6/+0x22) avec branche selon un
; flag (arg_A) : calcul de rectangle d'affichage avec positionnement relatif optionnel
; (ancrage).
; ==============================================================================================
UI_ComputeAnchoredRect	proc far		; CODE XREF: seg027:loc_1C181P
					; seg027:0916P	...

var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	cx, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 6
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		les	bx, [bp+var_C]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_10], ax
		mov	ax, es:[bx+2]
		mov	word ptr [bp+var_10+2],	ax
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx
		les	bx, [bp+var_14]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_18], ax
		mov	ax, es:[bx+2]
		mov	word ptr [bp+var_18+2],	ax
		mov	eax, [bp+var_18]
		mov	[bp+var_8], eax
		mov	al, [bp+arg_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1B3B2
		mov	ax, [si]
		add	ax, word ptr [bp+var_4]
		mov	[bp+var_1A], ax
		mov	ax, [si+2]
		add	ax, word ptr [bp+var_4+2]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_20], ax
		mov	ax, [bp+var_1C]

loc_1B382:
		mov	word ptr [bp+var_20+2],	ax

loc_1B385:
		mov	eax, [bp+var_20]

loc_1B389:
		mov	[bp+var_4], eax

loc_1B38D:
		mov	ax, [si]

loc_1B38F:
		add	ax, word ptr [bp+var_8]

loc_1B392:
		mov	[bp+var_22], ax

loc_1B395:
		mov	ax, [si+2]
		add	ax, word ptr [bp+var_8+2]
		mov	[bp+var_24], ax
		mov	ax, [bp+var_22]
		mov	word ptr [bp+var_28], ax
		mov	ax, [bp+var_24]
		mov	word ptr [bp+var_28+2],	ax
		mov	eax, [bp+var_28]
		mov	[bp+var_8], eax

loc_1B3B2:				; CODE XREF: UI_ComputeAnchoredRect+62j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_1B3D6
		push	2

loc_1B3BE:
		mov	al, es:[bx+27h]
		push	ax

loc_1B3C3:
		push	large [bp+var_8]

loc_1B3C7:
		push	large [bp+var_4]
		push	cx

loc_1B3CC:
		call	Render_ClipAndDrawLine_613B0
		add	sp, 0Eh

loc_1B3D4:
		jmp	short loc_1B3EF
; ���������������������������������������������������������������������������

loc_1B3D6:				; CODE XREF: UI_ComputeAnchoredRect+B6j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+27h]
		push	ax
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	cx
		call	Render_FillClippedRect_61960
		add	sp, 0Ch

loc_1B3EF:				; CODE XREF: UI_ComputeAnchoredRect:loc_1B3D4j
		pop	si
		leave
		retf
UI_ComputeAnchoredRect	endp

; ���������������������������������������������������������������������������

loc_1B3F2:				; DATA XREF: seg339:0BD4o
		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		mov	si, [bp+0Ch]
		mov	word ptr [bp-1Ah], 0
		mov	word ptr [bp-18h], 0
		mov	byte ptr [bp-0Dh], 0
		push	word ptr [bp+0Ah]
		lea	ax, [bp-1Ah]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		add	ax, [si]
		mov	[bp-2],	ax
		mov	ax, es:[bx+0Ch]
		add	ax, [si+2]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		mov	ax, es:[bx+0Eh]
		add	ax, [si]
		mov	[bp-0Ah], ax
		mov	ax, es:[bx+10h]
		add	ax, [si+2]
		mov	[bp-0Ch], ax
		mov	ax, [bp-6]
		mov	[bp-16h], ax
		mov	ax, [bp-8]
		mov	[bp-14h], ax
		mov	ax, [bp-0Ah]
		mov	[bp-12h], ax
		mov	ax, [bp-0Ch]
		mov	[bp-10h], ax
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_1B492
		push	2
		mov	al, es:[bx+27h]
		push	ax
		push	word ptr es:[bx+24h]
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		lea	ax, [bp-1Ah]

loc_1B487:
		push	ax
		call	Render_ClipAndDrawLine_613B0

loc_1B48D:
		add	sp, 0Eh
		jmp	short loc_1B4B6
; ���������������������������������������������������������������������������

loc_1B492:				; CODE XREF: seg025:0BEBj
		les	bx, [bp+6]
		mov	al, es:[bx+27h]
		push	ax
		push	word ptr es:[bx+24h]
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		lea	ax, [bp-1Ah]
		push	ax
		call	Render_FillClippedRect_61960
		add	sp, 0Ch

loc_1B4B6:				; CODE XREF: seg025:0C10j
		lea	ax, [bp-1Ah]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	si

locret_1B4C1:
		leave
		retf
; ���������������������������������������������������������������������������

loc_1B4C3:				; DATA XREF: seg339:0D56o seg339:0DB6o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B4D0:				; DATA XREF: seg339:0D5Ao seg339:0DBAo
		push	bp

loc_1B4D1:
		mov	bp, sp

loc_1B4D3:
		push	si

loc_1B4D4:
		mov	si, [bp+6]
		mov	ax, [si+8]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B4DD:				; DATA XREF: seg339:off_6DE0Eo
					; seg339:0DBEo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+0Ah]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B4EA:				; DATA XREF: seg339:off_6DE12o
					; seg339:0DC2o
		push	bp
		mov	bp, sp
		push	si

loc_1B4EE:
		mov	si, [bp+6]
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
seg025		ends
