ovr194		segment	para public 'OVERLAY' use16
		assume cs:ovr194
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EB20	proc far		; CODE XREF: sub_42305J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_5EE7C
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[si+4],	ax
		push	si
		nop
		push	cs
		call	near ptr sub_5EB7C
		add	sp, 2
		xor	di, di
		jmp	short loc_5EB60
; ���������������������������������������������������������������������������

loc_5EB44:				; CODE XREF: sub_5EB20+43j
		push	word ptr [si+4]
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		push	dx
		call	MusicChannel_Init_78A4
		add	sp, 4
		inc	di

loc_5EB60:				; CODE XREF: sub_5EB20+22j
		cmp	di, 5
		jl	short loc_5EB44
		pop	di
		pop	si
		pop	bp
		retf
sub_5EB20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EB69	proc far		; CODE XREF: sub_4230AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_5ED94
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_5EB69	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EB7C	proc far		; CODE XREF: sub_4230FJ sub_5EB20+1Ap

var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= dword	ptr -0E0h
var_DC		= byte ptr -0DCh
var_DB		= byte ptr -0DBh
var_DA		= dword	ptr -0DAh
var_D6		= word ptr -0D6h
var_75		= dword	ptr -75h
var_69		= word ptr -69h
var_65		= dword	ptr -65h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0E4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_46848
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_5EBAA
		cmp	ax, 2
		jz	short loc_5EB99
		jmp	short loc_5EBBB
; ���������������������������������������������������������������������������

loc_5EB99:				; CODE XREF: sub_5EB7C+19j
		push	154Ah
		lea	ax, [bp+var_6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_5EBBB
; ���������������������������������������������������������������������������

loc_5EBAA:				; CODE XREF: sub_5EB7C+14j
		push	154Fh
		lea	ax, [bp+var_6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short $+2

loc_5EBBB:				; CODE XREF: sub_5EB7C+1Bj
					; sub_5EB7C+2Cj
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		push	ds
		push	offset aSoundfx	; "soundfx"
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_5E]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	1
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		mov	bx, [bp+var_D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_E0], 0
		mov	[bp+var_DC], 2
		mov	[bp+var_DB], 0
		mov	[bp+var_DA], 0
		mov	[bp+var_E4], 0
		mov	[bp+var_E2], 0FFFFh
		push	word ptr [si+4]
		lea	ax, [bp+var_E4]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		xor	di, di
		jmp	loc_5ED2D
; ���������������������������������������������������������������������������

loc_5EC33:				; CODE XREF: sub_5EB7C+1B6j
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5EC52
		mov	eax, [bp+var_75]
		jmp	short loc_5EC56
; ���������������������������������������������������������������������������

loc_5EC52:				; CODE XREF: sub_5EB7C+CEj
		mov	eax, [bp+var_65]

loc_5EC56:				; CODE XREF: sub_5EB7C+D4j
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	large [bp+var_A]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_C]
		mov	bx, [bp+var_E]
		push	bx
		mov	bx, ax
		mov	[bx+si+8], dx
		pop	ax
		mov	[bx+si+6], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0Ah], 3
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0Bh], 1
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	dword ptr [bx+si+0Ch], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	edx, [bp+var_A]
		mov	bx, ax
		mov	[bx+si+0Ch], edx
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	al, [bx+si+0Ah]
		push	ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+8]
		push	word ptr [bx+si+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		lea	ax, [bp+var_E4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		inc	di

loc_5ED2D:				; CODE XREF: sub_5EB7C+B4j
		cmp	di, 0Eh
		jge	short loc_5ED35
		jmp	loc_5EC33
; ���������������������������������������������������������������������������

loc_5ED35:				; CODE XREF: sub_5EB7C+1B4j
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DB], 0
		jz	short loc_5ED6A
		cmp	[bp+var_E0], 0
		jz	short loc_5ED6A
		push	0
		mov	al, [bp+var_DC]
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5ED6A:				; CODE XREF: sub_5EB7C+1CBj
					; sub_5EB7C+1D3j
		mov	[bp+var_E0], 0
		mov	[bp+var_DB], 0
		mov	[bp+var_DA], 0
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5EB7C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5ED94	proc far		; CODE XREF: sub_42319J sub_5EB69+Ap ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_5EDC7
; ���������������������������������������������������������������������������

loc_5EDA0:				; CODE XREF: sub_5ED94+36j
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		push	dx
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0A0h], 0Fh
		inc	di

loc_5EDC7:				; CODE XREF: sub_5ED94+Aj
		cmp	di, 5
		jl	short loc_5EDA0
		pop	di
		pop	si
		pop	bp
		retf
sub_5ED94	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EDD0	proc far		; CODE XREF: sub_42314J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_44566, 0
		jnz	short loc_5EDE2
		jmp	loc_5EE78
; ���������������������������������������������������������������������������

loc_5EDE2:				; CODE XREF: sub_5EDD0+Dj
		mov	byte_44566, 0
		push	si
		push	cs
		call	near ptr sub_5ED94
		add	sp, 2
		xor	di, di
		jmp	short loc_5EE70
; ���������������������������������������������������������������������������

loc_5EDF3:				; CODE XREF: sub_5EDD0+A5j
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+si+0Bh], 0
		jz	short loc_5EE3E
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	ax, [bx+si+6]
		or	ax, [bx+si+8]
		jz	short loc_5EE3E
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	al, [bx+si+0Ah]
		push	ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5EE3E:				; CODE XREF: sub_5EDD0+30j
					; sub_5EDD0+41j
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+8], 0
		mov	word ptr [bx+si+6], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0Bh], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	dword ptr [bx+si+0Ch], 0
		inc	di

loc_5EE70:				; CODE XREF: sub_5EDD0+21j
		cmp	di, 0Eh
		jge	short loc_5EE78
		jmp	loc_5EDF3
; ���������������������������������������������������������������������������

loc_5EE78:				; CODE XREF: sub_5EDD0+Fj
					; sub_5EDD0+A3j
		pop	di
		pop	si
		pop	bp
		retf
sub_5EDD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EE7C	proc far		; CODE XREF: sub_42300J sub_5EB20+Bp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_44566, 1
		mov	word ptr [si+4], 0
		xor	cx, cx
		jmp	short loc_5EEA0
; ���������������������������������������������������������������������������

loc_5EE91:				; CODE XREF: sub_5EE7C+27j
		mov	ax, cx
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0A0h], 0Fh
		inc	cx

loc_5EEA0:				; CODE XREF: sub_5EE7C+13j
		cmp	cx, 5
		jl	short loc_5EE91
		pop	si
		pop	bp
		retf
sub_5EE7C	endp

ovr194		ends
