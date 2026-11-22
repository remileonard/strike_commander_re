seg013		segment	byte public 'CODE' use16
		assume cs:seg013
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_8B08:				; DATA XREF: AudioQueue_RegisterTickModule_5EEB0+Do
		push	bp
		mov	bp, sp

loc_8B0B:				; DATA XREF: seg170:0126o
		sub	sp, 2
		push	si
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		cmp	word_4458B, 0FFFFh
		jnz	short loc_8B1D
		jmp	loc_8CCB
; ���������������������������������������������������������������������������

loc_8B1D:				; CODE XREF: seg013:0018j
		mov	al, byte_4458A
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		jbe	short loc_8B2C
		jmp	loc_8CC4	; default
; ���������������������������������������������������������������������������

loc_8B2C:				; CODE XREF: seg013:0027j
		shl	bx, 1
		jmp	cs:off_8CCE[bx]	; switch jump

loc_8B33:				; DATA XREF: seg013:off_8CCEo
		mov	ax, 4700h	; case 0x0
		mov	dx, word_46AB2
		int	67h		;  - LIM EMS - SAVE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		mov	al, byte ptr word_4458B
		mov	byte_48E74, al
		mov	ah, 0
		mov	[bp-2],	ax
		mov	si, 5E57h
		push	0
		mov	ax, [bp-2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_44586
		add	dx, ax
		push	dx
		push	si
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_8B7B
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_8B7B:				; CODE XREF: seg013:0067j
		mov	byte_48E85, 1
		mov	byte_4458A, 1
		mov	ax, 4800h
		mov	dx, word_46AB2
		int	67h		;  - LIM EMS - RESTORE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		jmp	loc_8CCB
; ���������������������������������������������������������������������������

loc_8B91:				; CODE XREF: seg013:002Ej
					; DATA XREF: seg013:off_8CCEo
		mov	al, byte_48E74	; case 0x1
		mov	ah, 0
		cmp	ax, word_4458B
		jz	short loc_8BC4
		cmp	word_48E77, 0
		jz	short loc_8BB8
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C78
		add	sp, 4
		jmp	short loc_8BBA
; ���������������������������������������������������������������������������

loc_8BB8:				; CODE XREF: seg013:00A1j
		xor	ax, ax

loc_8BBA:				; CODE XREF: seg013:00B6j
		mov	word_48E75, ax
		mov	byte_4458A, 2
		jmp	short loc_8BF8
; ���������������������������������������������������������������������������

loc_8BC4:				; CODE XREF: seg013:009Aj
		cmp	word_48E77, 0
		jz	short loc_8BEC
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_8BE8
		mov	ax, 1
		jmp	short loc_8BEA
; ���������������������������������������������������������������������������

loc_8BE8:				; CODE XREF: seg013:00E1j
		xor	ax, ax

loc_8BEA:				; CODE XREF: seg013:00E6j
		jmp	short loc_8BEE
; ���������������������������������������������������������������������������

loc_8BEC:				; CODE XREF: seg013:00C9j
		mov	al, 1

loc_8BEE:				; CODE XREF: seg013:loc_8BEAj
		or	al, al
		jz	short loc_8BF8
		mov	ax, word_4458D
		mov	word_4458B, ax

loc_8BF8:				; CODE XREF: seg013:00C2j seg013:00F0j
		jmp	loc_8CCB
; ���������������������������������������������������������������������������

loc_8BFB:				; CODE XREF: seg013:002Ej
					; DATA XREF: seg013:off_8CCEo
		mov	al, byte_48E74	; case 0x2
		mov	ah, 0
		cmp	ax, word_4458B
		jnz	short loc_8C0D
		mov	byte_4458A, 1
		jmp	short loc_8C76
; ���������������������������������������������������������������������������

loc_8C0D:				; CODE XREF: seg013:0104j
		cmp	word_48E77, 0
		jz	short loc_8C29
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C78
		add	sp, 4
		jmp	short loc_8C2B
; ���������������������������������������������������������������������������

loc_8C29:				; CODE XREF: seg013:0112j
		xor	ax, ax

loc_8C2B:				; CODE XREF: seg013:0127j
		cmp	ax, word_48E75
		jnz	short loc_8C5F
		cmp	word_48E77, 0
		jz	short loc_8C59
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_8C55
		mov	ax, 1
		jmp	short loc_8C57
; ���������������������������������������������������������������������������

loc_8C55:				; CODE XREF: seg013:014Ej
		xor	ax, ax

loc_8C57:				; CODE XREF: seg013:0153j
		jmp	short loc_8C5B
; ���������������������������������������������������������������������������

loc_8C59:				; CODE XREF: seg013:0136j
		mov	al, 1

loc_8C5B:				; CODE XREF: seg013:loc_8C57j
		or	al, al
		jz	short loc_8C76

loc_8C5F:				; CODE XREF: seg013:012Fj
		mov	ax, 4700h
		mov	dx, word_46AB2
		int	67h		;  - LIM EMS - SAVE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		nop
		push	cs
		call	near ptr sub_8CD6
		mov	ax, 4800h
		mov	dx, word_46AB2
		int	67h		;  - LIM EMS - RESTORE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status

loc_8C76:				; CODE XREF: seg013:010Bj seg013:015Dj
		jmp	short loc_8CCB
; ���������������������������������������������������������������������������

loc_8C78:				; CODE XREF: seg013:002Ej
					; DATA XREF: seg013:off_8CCEo
		cmp	word_48E89, 0	; case 0x3
		jz	short loc_8CA0
		push	word_48E8B
		mov	bx, word_48E89
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_8C9C
		mov	ax, 1
		jmp	short loc_8C9E
; ���������������������������������������������������������������������������

loc_8C9C:				; CODE XREF: seg013:0195j
		xor	ax, ax

loc_8C9E:				; CODE XREF: seg013:019Aj
		jmp	short loc_8CA2
; ���������������������������������������������������������������������������

loc_8CA0:				; CODE XREF: seg013:017Dj
		mov	al, 1

loc_8CA2:				; CODE XREF: seg013:loc_8C9Ej
		or	al, al
		jz	short loc_8CC2
		mov	ax, 4700h
		mov	dx, word_46AB2
		int	67h		;  - LIM EMS - SAVE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		nop
		push	cs
		call	near ptr sub_8E3D
		mov	byte_4458A, 1
		mov	ax, 4800h
		mov	dx, word_46AB2
		int	67h		;  - LIM EMS - RESTORE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status

loc_8CC2:				; CODE XREF: seg013:01A4j
		jmp	short loc_8CCB
; ���������������������������������������������������������������������������

loc_8CC4:				; CODE XREF: seg013:0029j
		mov	byte_4457C, 1	; default
		jmp	short $+2

loc_8CCB:				; CODE XREF: seg013:001Aj seg013:008Ej ...
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_8CCE	dw offset loc_8B33	; DATA XREF: seg013:002Er
		dw offset loc_8B91	; jump table for switch	statement
		dw offset loc_8BFB
		dw offset loc_8C78

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8CD6	proc far		; CODE XREF: seg013:016Ap

var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	al, byte_48E74
		mov	ah, 0
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_44586
		add	dx, ax
		mov	[bp+var_2], dx
		mov	bx, [bp+var_2]
		mov	al, [bx+0Ah]
		mov	ah, 0
		push	ax
		mov	ax, word_48E75
		cwd
		pop	bx
		idiv	bx
		mov	word_48E75, dx
		cmp	word_48E75, 0
		jz	short loc_8D12
		inc	word_48E75
		jmp	short loc_8D1D
; ���������������������������������������������������������������������������

loc_8D12:				; CODE XREF: sub_8CD6+34j
		mov	bx, [bp+var_2]
		mov	al, [bx+0Bh]
		mov	ah, 0
		mov	word_48E75, ax

loc_8D1D:				; CODE XREF: sub_8CD6+3Aj
		mov	al, byte_48E74
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_44593
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_4458B
		mov	al, es:[bx]
		mov	[bp+var_4], al
		cmp	[bp+var_4], 0FFh
		jnz	short loc_8D44
		mov	[bp+var_3], 0
		jmp	short loc_8D5F
; ���������������������������������������������������������������������������

loc_8D44:				; CODE XREF: sub_8CD6+66j
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_4458F
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_48E75
		mov	al, es:[bx]
		mov	[bp+var_3], al

loc_8D5F:				; CODE XREF: sub_8CD6+6Cj
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8DC0
		push	5E57h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	al, byte ptr word_4458B
		mov	byte_48E74, al
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	di, 5E57h
		push	0
		mov	ax, [bp+var_6]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_44586
		add	dx, ax
		push	dx
		push	di
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	word ptr [di], 0
		jz	short loc_8DB2
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_8DB2:				; CODE XREF: sub_8CD6+C8j
		mov	byte_48E85, 1
		mov	byte_4458A, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_8DC0:				; CODE XREF: sub_8CD6+90j
		test	[bp+var_3], 80h
		jz	short loc_8DCC
		and	[bp+var_3], 7Fh
		jmp	short loc_8DDC
; ���������������������������������������������������������������������������

loc_8DCC:				; CODE XREF: sub_8CD6+EEj
		push	5E57h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	byte_48E85, 0

loc_8DDC:				; CODE XREF: sub_8CD6+F4j
		mov	al, [bp+var_3]
		mov	ah, 0
		cmp	ax, word_44580
		jle	short loc_8DFD
		mov	byte_4457C, 2
		mov	byte_4458A, 1
		mov	al, byte_48E74
		mov	ah, 0
		mov	word_4458B, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_8DFD:				; CODE XREF: sub_8CD6+10Fj
		mov	si, 5E69h
		push	0
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		add	ax, word_44588
		add	ax, 0FFF6h
		push	ax
		push	si
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_8E34
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_8E34:				; CODE XREF: sub_8CD6+14Aj
		mov	byte_4458A, 3
		pop	di
		pop	si
		leave
		retf
sub_8CD6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8E3D	proc far		; CODE XREF: seg013:01B1p

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	5E69h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	byte_48E97, 0
		cmp	byte_48E85, 1
		jnz	short loc_8E66
		push	5E57h
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_8E66:				; CODE XREF: sub_8E3D+1Cj
		mov	al, byte ptr word_4458B
		mov	byte_48E74, al
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	si, 5E57h
		push	0
		mov	ax, [bp+var_2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_44586
		add	dx, ax
		push	dx
		push	si
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_8EA5
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_8EA5:				; CODE XREF: sub_8E3D+54j
		mov	byte_48E85, 1
		pop	si
		leave
		retf
sub_8E3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8EAD	proc far		; CODE XREF: Speech_LoadBank_28D24+1BP

var_86		= word ptr -86h
var_74		= word ptr -74h
var_25		= dword	ptr -25h
var_19		= word ptr -19h
var_17		= dword	ptr -17h
var_13		= dword	ptr -13h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	1
		push	si
		call	sub_4237C
		add	sp, 4
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_8ECD
		jmp	loc_8FDE
; ���������������������������������������������������������������������������

loc_8ECD:				; CODE XREF: sub_8EAD+1Bj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_74], 556h
		mov	[bp+var_13], 100h
		mov	[bp+var_17], 0
		mov	[bp+var_74], 693h
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_74]
		push	ax
		mov	bx, [bp+var_74]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		cmp	byte_48E9D, 0
		jz	short loc_8F49
		cmp	dword_48E98, 0
		jz	short loc_8F49
		push	0
		mov	al, byte_48E9C
		push	ax
		push	5E78h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8F49:				; CODE XREF: sub_8EAD+7Cj sub_8EAD+84j
		mov	dword_48E98, 0
		mov	byte_48E9D, 0
		mov	dword_48E9E, 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	large [bp+var_A]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	dword_48E98, eax
		mov	byte_48E9C, 3
		mov	byte_48E9D, 1
		mov	dword_48E9E, 0
		mov	eax, [bp+var_A]
		mov	dword_48E9E, eax
		push	0
		mov	al, byte_48E9C
		push	ax
		push	word ptr dword_48E98+2
		push	word ptr dword_48E98
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		call	Handle_ReadAndOffsetField_3ADF0
		add	sp, 6
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	loc_90DF
; ���������������������������������������������������������������������������

loc_8FDE:				; CODE XREF: sub_8EAD+1Dj
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp+var_19]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_9011
		mov	eax, [bp+var_25]
		jmp	short loc_9015
; ���������������������������������������������������������������������������

loc_9011:				; CODE XREF: sub_8EAD+15Cj
		mov	eax, [bp+var_17+2]

loc_9015:				; CODE XREF: sub_8EAD+162j
		mov	[bp+var_6+2], eax
		cmp	[bp+var_6+2], 0
		jnz	short loc_9023
		jmp	loc_90D0
; ���������������������������������������������������������������������������

loc_9023:				; CODE XREF: sub_8EAD+171j
		cmp	byte_48E9D, 0
		jz	short loc_9048
		cmp	dword_48E98, 0
		jz	short loc_9048
		push	0
		mov	al, byte_48E9C
		push	ax
		push	5E78h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9048:				; CODE XREF: sub_8EAD+17Bj
					; sub_8EAD+183j
		mov	dword_48E98, 0
		mov	byte_48E9D, 0
		mov	dword_48E9E, 0
		mov	eax, [bp+var_6+2]
		mov	[bp+var_A+2], eax
		push	1
		push	0
		push	3
		push	large [bp+var_A+2]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_A], dx
		mov	word ptr [bp+var_E+2], ax
		mov	eax, [bp+var_E+2]
		mov	dword_48E98, eax
		mov	byte_48E9C, 3
		mov	byte_48E9D, 1
		mov	dword_48E9E, 0
		mov	eax, [bp+var_A+2]
		mov	dword_48E9E, eax
		push	0
		mov	al, byte_48E9C
		push	ax
		push	word ptr dword_48E98+2
		push	word ptr dword_48E98
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8

loc_90D0:				; CODE XREF: sub_8EAD+173j
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_90DF:				; CODE XREF: sub_8EAD+12Ej
		push	0
		mov	al, byte_48E9C
		push	ax
		push	word ptr dword_48E98+2
		push	word ptr dword_48E98
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_9124
		mov	di, 5E57h
		push	0
		push	5E78h
		push	di
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	word ptr [di], 0
		jz	short loc_9124
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_9124:				; CODE XREF: sub_8EAD+24Dj
					; sub_8EAD+263j
		pop	di
		pop	si
		leave
		retf
sub_8EAD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_9128	proc far		; CODE XREF: sub_28D49+15P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_48E77, 0
		jz	short loc_9157
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_9153
		mov	ax, 1
		jmp	short loc_9155
; ���������������������������������������������������������������������������

loc_9153:				; CODE XREF: sub_9128+24j
		xor	ax, ax

loc_9155:				; CODE XREF: sub_9128+29j
		jmp	short loc_9159
; ���������������������������������������������������������������������������

loc_9157:				; CODE XREF: sub_9128+Cj
		mov	al, 0

loc_9159:				; CODE XREF: sub_9128:loc_9155j
		or	al, al
		jz	short loc_91D0
		cmp	word_48E77, 0
		jz	short loc_917E
		push	3E8h
		push	0
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_917E:				; CODE XREF: sub_9128+3Aj
		jmp	short $+2

loc_9180:				; CODE XREF: sub_9128+A6j
		cmp	word_48E77, 0
		jz	short loc_91A8
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_91A4
		mov	ax, 1
		jmp	short loc_91A6
; ���������������������������������������������������������������������������

loc_91A4:				; CODE XREF: sub_9128+75j
		xor	ax, ax

loc_91A6:				; CODE XREF: sub_9128+7Aj
		jmp	short loc_91AA
; ���������������������������������������������������������������������������

loc_91A8:				; CODE XREF: sub_9128+5Dj
		mov	al, 0

loc_91AA:				; CODE XREF: sub_9128:loc_91A6j
		or	al, al
		jz	short loc_91D0
		cmp	word_48E77, 0
		jz	short loc_91CA
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C5A
		add	sp, 4
		jmp	short loc_91CC
; ���������������������������������������������������������������������������

loc_91CA:				; CODE XREF: sub_9128+8Bj
		xor	ax, ax

loc_91CC:				; CODE XREF: sub_9128+A0j
		or	ax, ax
		jnz	short loc_9180

loc_91D0:				; CODE XREF: sub_9128+33j sub_9128+84j
		push	5E57h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte_48E9D, 0
		jz	short loc_9200
		cmp	dword_48E98, 0
		jz	short loc_9200
		push	0
		mov	al, byte_48E9C
		push	ax
		push	5E78h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9200:				; CODE XREF: sub_9128+B8j sub_9128+C0j
		mov	dword_48E98, 0
		mov	byte_48E9D, 0
		mov	dword_48E9E, 0
		pop	si
		pop	bp
		retf
sub_9128	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_921A	proc far		; CODE XREF: sub_28D68+1CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_48E77, 0
		jz	short loc_9249
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_9245
		mov	ax, 1
		jmp	short loc_9247
; ���������������������������������������������������������������������������

loc_9245:				; CODE XREF: sub_921A+24j
		xor	ax, ax

loc_9247:				; CODE XREF: sub_921A+29j
		jmp	short loc_924B
; ���������������������������������������������������������������������������

loc_9249:				; CODE XREF: sub_921A+Cj
		mov	al, 0

loc_924B:				; CODE XREF: sub_921A:loc_9247j
		pop	si
		pop	bp
		retf
sub_921A	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_9251:				; DATA XREF: dseg:58DAo
		push	bp
		mov	bp, sp
		mov	dword_48E7B, 0
		mov	byte_48E7F, 2
		mov	byte_48E80, 0
		mov	dword_48E81, 0
		mov	word_48E77, 0
		mov	word_48E79, 0FFFFh
		mov	dword_48E8D, 0
		mov	byte_48E91, 2
		mov	byte_48E92, 0
		mov	dword_48E93, 0
		mov	word_48E89, 0
		mov	word_48E8B, 0FFFFh
		mov	dword_48E98, 0
		mov	byte_48E9C, 2
		mov	byte_48E9D, 0
		mov	dword_48E9E, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_92C2:				; DATA XREF: dseg:59A6o
		push	bp
		mov	bp, sp
		cmp	byte_48E9D, 0
		jz	short loc_92EA
		cmp	dword_48E98, 0
		jz	short loc_92EA
		push	0
		mov	al, byte_48E9C
		push	ax
		push	5E78h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_92EA:				; CODE XREF: seg013:07CAj seg013:07D2j
		mov	dword_48E98, 0
		mov	byte_48E9D, 0
		mov	dword_48E9E, 0
		push	5E69h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte_48E92, 0
		jz	short loc_9331
		cmp	dword_48E8D, 0
		jz	short loc_9331
		push	0
		mov	al, byte_48E91
		push	ax
		push	5E6Dh
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9331:				; CODE XREF: seg013:0811j seg013:0819j
		mov	dword_48E8D, 0
		mov	byte_48E92, 0
		mov	dword_48E93, 0
		push	5E57h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte_48E80, 0
		jz	short loc_9378
		cmp	dword_48E7B, 0
		jz	short loc_9378
		push	0
		mov	al, byte_48E7F
		push	ax
		push	5E5Bh
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9378:				; CODE XREF: seg013:0858j seg013:0860j
		mov	dword_48E7B, 0
		mov	byte_48E80, 0
		mov	dword_48E81, 0
		pop	bp
		retf
seg013		ends
