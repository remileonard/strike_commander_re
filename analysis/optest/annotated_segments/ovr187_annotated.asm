ovr187		segment	para public 'OVERLAY' use16
		assume cs:ovr187
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_50160	proc far		; CODE XREF: sub_42055J

var_AE		= word ptr -0AEh
var_51		= dword	ptr -51h
var_4D		= dword	ptr -4Dh
var_49		= dword	ptr -49h
var_3C		= word ptr -3Ch
var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0AEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_AE], 556h
		mov	[bp+var_4D], 100h
		mov	[bp+var_51], 0
		mov	[bp+var_AE], 56Eh
		mov	[bp+var_32], 0
		xor	ax, ax
		mov	[bp+var_34], ax
		movsx	eax, ax
		mov	[bp+var_49], eax
		push	1
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		mov	bx, [bp+var_AE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54415453h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		mov	[bp+var_1], 0
		jmp	short loc_50236
; ���������������������������������������������������������������������������

loc_501D9:				; CODE XREF: sub_50160+103j
		push	1
		push	large 474E4843h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		mov	al, [bp+var_2]
		cmp	al, [bp+arg_2]
		jnz	short loc_50221
		mov	[bp+var_1], 1
		jmp	short loc_50266
; ���������������������������������������������������������������������������

loc_50221:				; CODE XREF: sub_50160+B9j
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_50236:				; CODE XREF: sub_50160+77j
		cmp	[bp+var_32], 0
		jnz	short loc_5024B
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_5025F
; ���������������������������������������������������������������������������

loc_5024B:				; CODE XREF: sub_50160+DAj
		mov	bx, [bp+var_32]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_49]
		jg	short loc_5025D
		mov	ax, 1
		jmp	short loc_5025F
; ���������������������������������������������������������������������������

loc_5025D:				; CODE XREF: sub_50160+F6j
		xor	ax, ax

loc_5025F:				; CODE XREF: sub_50160+E9j
					; sub_50160+FBj
		or	ax, ax
		jnz	short loc_50266
		jmp	loc_501D9
; ���������������������������������������������������������������������������

loc_50266:				; CODE XREF: sub_50160+BFj
					; sub_50160+101j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5027C
		push	27h ; '''
		push	92Ah
		call	sub_310B
		add	sp, 4

loc_5027C:				; CODE XREF: sub_50160+10Dj
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax
		push	0
		push	large 48534143h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_50312
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_502DC
		cmp	ax, 1
		jz	short loc_502E7
		cmp	ax, 2
		jz	short loc_502F2
		jmp	short loc_502FD
; ���������������������������������������������������������������������������

loc_502DC:				; CODE XREF: sub_50160+16Ej
		mov	eax, [bp+var_6]
		add	[si+27Bh], eax
		jmp	short loc_5030A
; ���������������������������������������������������������������������������

loc_502E7:				; CODE XREF: sub_50160+173j
		mov	eax, [bp+var_6]
		sub	[si+27Bh], eax
		jmp	short loc_5030A
; ���������������������������������������������������������������������������

loc_502F2:				; CODE XREF: sub_50160+178j
		mov	eax, [bp+var_6]
		mov	[si+27Bh], eax
		jmp	short loc_5030A
; ���������������������������������������������������������������������������

loc_502FD:				; CODE XREF: sub_50160+17Aj
		push	28h ; '('
		push	92Ah
		call	sub_310B
		add	sp, 4

loc_5030A:				; CODE XREF: sub_50160+185j
					; sub_50160+190j ...
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax

loc_50312:				; CODE XREF: sub_50160+13Bj
		push	0
		push	large 5245564Fh
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_503A0
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_5036A
		cmp	ax, 1
		jz	short loc_50375
		cmp	ax, 2
		jz	short loc_50380
		jmp	short loc_5038B
; ���������������������������������������������������������������������������

loc_5036A:				; CODE XREF: sub_50160+1FCj
		mov	eax, [bp+var_6]
		add	[si+27Fh], eax
		jmp	short loc_50398
; ���������������������������������������������������������������������������

loc_50375:				; CODE XREF: sub_50160+201j
		mov	eax, [bp+var_6]
		sub	[si+27Fh], eax
		jmp	short loc_50398
; ���������������������������������������������������������������������������

loc_50380:				; CODE XREF: sub_50160+206j
		mov	eax, [bp+var_6]
		mov	[si+27Fh], eax
		jmp	short loc_50398
; ���������������������������������������������������������������������������

loc_5038B:				; CODE XREF: sub_50160+208j
		push	28h ; '('
		push	92Ah
		call	sub_310B
		add	sp, 4

loc_50398:				; CODE XREF: sub_50160+213j
					; sub_50160+21Ej ...
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax

loc_503A0:				; CODE XREF: sub_50160+1C9j
		push	0
		push	large 50414557h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_503BC
		jmp	loc_50490
; ���������������������������������������������������������������������������

loc_503BC:				; CODE XREF: sub_50160+257j
		jmp	loc_5045D
; ���������������������������������������������������������������������������

loc_503BF:				; CODE XREF: sub_50160+32Dj
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_6+3], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	di, ax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_50403
		cmp	ax, 1
		jz	short loc_50412
		cmp	ax, 2
		jz	short loc_50441
		jmp	short loc_50450
; ���������������������������������������������������������������������������

loc_50403:				; CODE XREF: sub_50160+295j
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		add	[bx+si+261h], di
		jmp	short loc_5045D
; ���������������������������������������������������������������������������

loc_50412:				; CODE XREF: sub_50160+29Aj
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	[bx+si+261h], di
		jnb	short loc_50432
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	word ptr [bx+si+261h], 0
		jmp	short loc_5043F
; ���������������������������������������������������������������������������

loc_50432:				; CODE XREF: sub_50160+2BFj
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		sub	[bx+si+261h], di

loc_5043F:				; CODE XREF: sub_50160+2D0j
		jmp	short loc_5045D
; ���������������������������������������������������������������������������

loc_50441:				; CODE XREF: sub_50160+29Fj
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	[bx+si+261h], di
		jmp	short loc_5045D
; ���������������������������������������������������������������������������

loc_50450:				; CODE XREF: sub_50160+2A1j
		push	29h ; ')'
		push	92Ah
		call	sub_310B
		add	sp, 4

loc_5045D:				; CODE XREF: sub_50160:loc_503BCj
					; sub_50160+2B0j ...
		test	[bp+var_3C], 1
		jz	short loc_50478
		mov	eax, [bp+var_38]
		dec	eax
		cmp	eax, [bp+var_49]
		jnz	short loc_50476
		inc	[bp+var_49]
		jmp	short $+2

loc_50476:				; CODE XREF: sub_50160+30Ej
		jmp	short $+2

loc_50478:				; CODE XREF: sub_50160+302j
		mov	eax, [bp+var_49]
		cmp	eax, [bp+var_38]
		jl	short loc_50487
		mov	ax, 1
		jmp	short loc_50489
; ���������������������������������������������������������������������������

loc_50487:				; CODE XREF: sub_50160+320j
		xor	ax, ax

loc_50489:				; CODE XREF: sub_50160+325j
		or	ax, ax
		jnz	short loc_50490
		jmp	loc_503BF
; ���������������������������������������������������������������������������

loc_50490:				; CODE XREF: sub_50160+259j
					; sub_50160+32Bj
		push	0
		push	large 544C4950h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_504AC
		jmp	loc_50612
; ���������������������������������������������������������������������������

loc_504AC:				; CODE XREF: sub_50160+347j
		jmp	loc_505DF
; ���������������������������������������������������������������������������

loc_504AF:				; CODE XREF: sub_50160+4AFj
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_6+3], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_6+2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	di, ax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_50507
		cmp	ax, 1
		jz	short loc_50532
		cmp	ax, 2
		jnz	short loc_50504
		jmp	loc_505A8
; ���������������������������������������������������������������������������

loc_50504:				; CODE XREF: sub_50160+39Fj
		jmp	loc_505D2
; ���������������������������������������������������������������������������

loc_50507:				; CODE XREF: sub_50160+395j
		cmp	byte ptr [bp+var_6+2], 0
		jnz	short loc_5051F
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		add	[bx+si+29Fh], di
		jmp	short loc_5052F
; ���������������������������������������������������������������������������

loc_5051F:				; CODE XREF: sub_50160+3ABj
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		add	[bx+si+2A1h], di

loc_5052F:				; CODE XREF: sub_50160+3BDj
		jmp	loc_505DF
; ���������������������������������������������������������������������������

loc_50532:				; CODE XREF: sub_50160+39Aj
		cmp	byte ptr [bp+var_6+2], 0
		jnz	short loc_50570
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		cmp	[bx+si+29Fh], di
		jnb	short loc_5055E
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+29Fh], 0
		jmp	short loc_5056E
; ���������������������������������������������������������������������������

loc_5055E:				; CODE XREF: sub_50160+3E8j
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		sub	[bx+si+29Fh], di

loc_5056E:				; CODE XREF: sub_50160+3FCj
		jmp	short loc_505A6
; ���������������������������������������������������������������������������

loc_50570:				; CODE XREF: sub_50160+3D6j
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		cmp	[bx+si+2A1h], di
		jnb	short loc_50596
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A1h], 0
		jmp	short loc_505A6
; ���������������������������������������������������������������������������

loc_50596:				; CODE XREF: sub_50160+420j
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		sub	[bx+si+2A1h], di

loc_505A6:				; CODE XREF: sub_50160:loc_5056Ej
					; sub_50160+434j
		jmp	short loc_505DF
; ���������������������������������������������������������������������������

loc_505A8:				; CODE XREF: sub_50160+3A1j
		cmp	byte ptr [bp+var_6+2], 0
		jnz	short loc_505C0
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	[bx+si+29Fh], di
		jmp	short loc_505D0
; ���������������������������������������������������������������������������

loc_505C0:				; CODE XREF: sub_50160+44Cj
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	[bx+si+2A1h], di

loc_505D0:				; CODE XREF: sub_50160+45Ej
		jmp	short loc_505DF
; ���������������������������������������������������������������������������

loc_505D2:				; CODE XREF: sub_50160:loc_50504j
		push	2Ah ; '*'
		push	92Ah
		call	sub_310B
		add	sp, 4

loc_505DF:				; CODE XREF: sub_50160:loc_504ACj
					; sub_50160:loc_5052Fj	...
		test	[bp+var_3C], 1
		jz	short loc_505FA
		mov	eax, [bp+var_38]
		dec	eax
		cmp	eax, [bp+var_49]
		jnz	short loc_505F8
		inc	[bp+var_49]
		jmp	short $+2

loc_505F8:				; CODE XREF: sub_50160+490j
		jmp	short $+2

loc_505FA:				; CODE XREF: sub_50160+484j
		mov	eax, [bp+var_49]
		cmp	eax, [bp+var_38]
		jl	short loc_50609
		mov	ax, 1
		jmp	short loc_5060B
; ���������������������������������������������������������������������������

loc_50609:				; CODE XREF: sub_50160+4A2j
		xor	ax, ax

loc_5060B:				; CODE XREF: sub_50160+4A7j
		or	ax, ax
		jnz	short loc_50612
		jmp	loc_504AF
; ���������������������������������������������������������������������������

loc_50612:				; CODE XREF: sub_50160+349j
					; sub_50160+4ADj
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_AE], 56Eh
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_50160	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_50645	proc far		; CODE XREF: sub_4205AJ

var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		cmp	word ptr [si+3D4h], 10h
		jbe	short loc_50664
		mov	[bp+var_2], 0FEh ; '�'
		jmp	short loc_50670
; ���������������������������������������������������������������������������

loc_50664:				; CODE XREF: sub_50645+17j
		cmp	dword ptr [si+27Bh], 0
		jge	short loc_50670
		mov	[bp+var_2], 0FFh

loc_50670:				; CODE XREF: sub_50645+1Dj
					; sub_50645+25j
		cmp	[bp+var_2], 0
		jz	short loc_5069B
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		push	ax
		push	si
		call	sub_41F33
		add	sp, 4
		push	1
		call	sub_4268A
		add	sp, 2
		mov	byte ptr [si+0E8h], 0
		mov	byte ptr [si+0E7h], 2

loc_5069B:				; CODE XREF: sub_50645+2Fj
		mov	al, [bp+var_1]
		mov	[bp+var_3], al
		mov	al, [bp+var_3]
		pop	si
		leave
		retf
sub_50645	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_506AA	proc far		; CODE XREF: sub_4205FJ

var_314		= word ptr -314h
var_29C		= word ptr -29Ch
var_224		= word ptr -224h
var_207		= word ptr -207h
var_205		= byte ptr -205h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1FE		= word ptr -1FEh
var_1FC		= word ptr -1FCh
var_1FA		= word ptr -1FAh
var_1F8		= word ptr -1F8h
var_1F4		= word ptr -1F4h
var_197		= dword	ptr -197h
var_193		= dword	ptr -193h
var_18F		= dword	ptr -18Fh
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_10C		= word ptr -10Ch
var_10A		= word ptr -10Ah
var_B4		= word ptr -0B4h
var_64		= word ptr -64h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= word ptr -50h
var_4E		= byte ptr -4Eh
var_4D		= word ptr -4Dh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= byte ptr -46h
var_42		= word ptr -42h
var_40		= byte ptr -40h
var_3F		= word ptr -3Fh
var_3C		= word ptr -3Ch
var_3A		= dword	ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 314h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	TextScrollDisplayB_ApplyHelperD_3F784
		call	Input_Flush_CDDC
		mov	byte_495FC, 0
		mov	ax, [si+29Fh]
		mov	[bp+var_2], ax
		mov	ax, [si+2A1h]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0BCh ; '�'
		jbe	short loc_506DF
		mov	[bp+var_2], 0BCh ; '�'

loc_506DF:				; CODE XREF: sub_506AA+2Ej
		cmp	[bp+var_4], 80h	; '�'
		jbe	short loc_506EB
		mov	[bp+var_4], 80h	; '�'

loc_506EB:				; CODE XREF: sub_506AA+3Aj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		cmp	byte_46848, 2
		jnz	short loc_50724
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh

loc_50724:				; CODE XREF: sub_506AA+5Fj
		push	1Bh
		lea	ax, [bp+var_B4]
		push	ax
		call	Speech_LoadBank_28D24
		add	sp, 4
		push	seg stub187
		push	offset sub_42050
		push	1
		push	16h
		push	4
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub187
		push	offset sub_42050
		push	1
		push	10h
		push	4
		lea	ax, [bp+var_14C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_1F4], 556h
		mov	[bp+var_193], 100h
		mov	[bp+var_197], 0
		mov	[bp+var_1F4], 56Eh
		mov	[bp+var_178], 0
		xor	ax, ax
		mov	[bp+var_17A], ax
		movsx	eax, ax
		mov	[bp+var_18F], eax
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aOptions	; "options"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_1F4]
		push	ax
		mov	bx, [bp+var_1F4]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4B52414Dh
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		xor	di, di
		jmp	short loc_50837
; ���������������������������������������������������������������������������

loc_50802:				; CODE XREF: sub_506AA+190j
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_10C]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_10A]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_50837:				; CODE XREF: sub_506AA+156j
		cmp	di, 16h
		jl	short loc_50802
		xor	di, di
		jmp	short loc_50875
; ���������������������������������������������������������������������������

loc_50840:				; CODE XREF: sub_506AA+1CEj
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_14C]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_14A]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_50875:				; CODE XREF: sub_506AA+194j
		cmp	di, 10h
		jl	short loc_50840
		mov	[bp+var_202], 0
		mov	[bp+var_200], 0
		mov	[bp+var_1FE], 0
		mov	[bp+var_1FC], 0
		mov	[bp+var_1FA], 13Fh
		mov	[bp+var_1F8], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_202]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_202]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	word_46F46
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_0 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_12], 0
		mov	[bp+var_E], 2
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	3
		lea	ax, [bp+var_12]
		push	ax
		push	8Dh ; '�'
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	3
		lea	ax, [bp+var_1C]
		push	ax
		push	8Eh ; '�'
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_26]
		push	ax
		push	13h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	3
		lea	ax, [bp+var_30]
		push	ax
		push	8Fh ; '�'
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	2
		lea	ax, [bp+var_3A]
		push	ax
		push	14h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_30]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp+var_3C], ax
		mov	[bp+var_3F], 0
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	[bp+var_42]
		mov	al, [bp+var_40]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_3C]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		jmp	short loc_50AD2
; ���������������������������������������������������������������������������

loc_50A9B:				; CODE XREF: sub_506AA+441j
		mov	ax, [bp+var_207]
		and	al, 3
		mov	[bp+var_61], al
		cmp	[bp+var_61], 3
		jnz	short loc_50AB4
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_50AC5
; ���������������������������������������������������������������������������

loc_50AB4:				; CODE XREF: sub_506AA+3FEj
		mov	al, [bp+var_61]
		mov	ah, 0
		mov	[bp+var_64], ax
		mov	bx, [bp+var_3C]
		mov	ax, [bp+var_64]
		mov	[bx+1Bh], ax

loc_50AC5:				; CODE XREF: sub_506AA+408j
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_50AD2:				; CODE XREF: sub_506AA+3EFj
		cmp	[bp+var_207], 14h
		jnb	short loc_50AE0
		cmp	[bp+var_205], 0
		jz	short loc_50AE5

loc_50AE0:				; CODE XREF: sub_506AA+42Dj
		mov	ax, 1
		jmp	short loc_50AE7
; ���������������������������������������������������������������������������

loc_50AE5:				; CODE XREF: sub_506AA+434j
		xor	ax, ax

loc_50AE7:				; CODE XREF: sub_506AA+439j
		mov	ah, 0
		or	ax, ax
		jz	short loc_50A9B
		push	[bp+var_3C]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	[bp+var_3C], 0
		jz	short loc_50B14
		push	3
		push	[bp+var_3C]
		mov	bx, [bp+var_3C]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_50B14:				; CODE XREF: sub_506AA+457j
		mov	[bp+var_207], 0
		push	0
		push	0
		push	0
		lea	ax, [bp+var_12]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_4A], ax
		mov	[bp+var_4D], 0
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_4A]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_50]
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+var_2]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_51], al
		mov	ax, [bp+var_4]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_54], al
		mov	ax, [bp+var_4]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_57], dl
		mov	ax, [bp+var_2]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_58], dl
		cmp	[bp+var_57], 5
		jb	short loc_50BB5
		mov	[bp+var_55], 1
		mov	al, [bp+var_57]
		add	al, 0FBh ; '�'
		mov	[bp+var_56], al
		jmp	short loc_50BBF
; ���������������������������������������������������������������������������

loc_50BB5:				; CODE XREF: sub_506AA+4FBj
		mov	[bp+var_55], 0
		mov	al, [bp+var_57]
		mov	[bp+var_56], al

loc_50BBF:				; CODE XREF: sub_506AA+509j
		cmp	[bp+var_58], 5
		jb	short loc_50BD3
		mov	[bp+var_52], 1
		mov	al, [bp+var_58]
		add	al, 0FBh ; '�'
		mov	[bp+var_53], al
		jmp	short loc_50BDD
; ���������������������������������������������������������������������������

loc_50BD3:				; CODE XREF: sub_506AA+519j
		mov	[bp+var_52], 0
		mov	al, [bp+var_58]
		mov	[bp+var_53], al

loc_50BDD:				; CODE XREF: sub_506AA+527j
		xor	di, di
		jmp	short loc_50C1F
; ���������������������������������������������������������������������������

loc_50BE1:				; CODE XREF: sub_506AA+57Cj
		push	2
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-62h], ax
		push	word ptr [bp-62h]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	di

loc_50C1F:				; CODE XREF: sub_506AA+535j
		mov	al, [bp+var_51]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_50BE1
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_50C6F
; ���������������������������������������������������������������������������

loc_50C31:				; CODE XREF: sub_506AA+5D3j
		push	1
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-62h], ax
		push	word ptr [bp-62h]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	di

loc_50C6F:				; CODE XREF: sub_506AA+585j
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_50C31
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		mov	di, ax
		jmp	short loc_50CCD
; ���������������������������������������������������������������������������

loc_50C8F:				; CODE XREF: sub_506AA+638j
		push	0
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-62h], ax
		push	word ptr [bp-62h]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	di

loc_50CCD:				; CODE XREF: sub_506AA+5E3j
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		mov	dl, [bp+var_53]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_50C8F
		xor	di, di
		jmp	short loc_50D26
; ���������������������������������������������������������������������������

loc_50CE8:				; CODE XREF: sub_506AA+683j
		push	5
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-62h], ax
		push	word ptr [bp-62h]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	di

loc_50D26:				; CODE XREF: sub_506AA+63Cj
		mov	al, [bp+var_54]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_50CE8
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_50D76
; ���������������������������������������������������������������������������

loc_50D38:				; CODE XREF: sub_506AA+6DAj
		push	4
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-62h], ax
		push	word ptr [bp-62h]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	di

loc_50D76:				; CODE XREF: sub_506AA+68Cj
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_50D38
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		mov	di, ax
		jmp	short loc_50DD4
; ���������������������������������������������������������������������������

loc_50D96:				; CODE XREF: sub_506AA+73Fj
		push	3
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-62h], ax
		push	word ptr [bp-62h]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	di

loc_50DD4:				; CODE XREF: sub_506AA+6EAj
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		mov	dl, [bp+var_56]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_50D96
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		xor	eax, eax
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_5C], 12Ch
		mov	eax, dword_47ABB
		mov	[bp+var_60], eax
		jmp	short loc_50E43
; ���������������������������������������������������������������������������

loc_50E38:				; CODE XREF: sub_506AA+7B3j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_50E43
		jmp	short loc_50E5F
; ���������������������������������������������������������������������������

loc_50E43:				; CODE XREF: sub_506AA+78Cj
					; sub_506AA+795j
		mov	eax, [bp+var_60]
		add	eax, [bp+var_5C]
		cmp	eax, dword_47ABB
		ja	short loc_50E57
		mov	ax, 1
		jmp	short loc_50E59
; ���������������������������������������������������������������������������

loc_50E57:				; CODE XREF: sub_506AA+7A6j
		xor	ax, ax

loc_50E59:				; CODE XREF: sub_506AA+7ABj
		mov	ah, 0
		or	ax, ax
		jz	short loc_50E38

loc_50E5F:				; CODE XREF: sub_506AA+797j
		lea	ax, [bp+var_314]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		lea	ax, [bp+var_29C]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		call	sub_28D49
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_50EE7
		cmp	[bp+var_3A], 0
		jz	short loc_50EE7
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_50EE7:				; CODE XREF: sub_506AA+81Dj
					; sub_506AA+824j
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		cmp	[bp+var_2B], 0
		jz	short loc_50F1F
		cmp	[bp+var_30], 0
		jz	short loc_50F1F
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_50F1F:				; CODE XREF: sub_506AA+855j
					; sub_506AA+85Cj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_50F57
		cmp	[bp+var_26], 0
		jz	short loc_50F57
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_50F57:				; CODE XREF: sub_506AA+88Dj
					; sub_506AA+894j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_50F8F
		cmp	[bp+var_1C], 0
		jz	short loc_50F8F
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_50F8F:				; CODE XREF: sub_506AA+8C5j
					; sub_506AA+8CCj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		cmp	[bp+var_D], 0
		jz	short loc_50FC7
		cmp	[bp+var_12], 0
		jz	short loc_50FC7
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_50FC7:				; CODE XREF: sub_506AA+8FDj
					; sub_506AA+904j
		mov	[bp+var_12], 0
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_202]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		mov	[bp+var_1F4], 56Eh
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_506AA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_51049	proc far		; CODE XREF: sub_42064J

var_276		= word ptr -276h
var_258		= word ptr -258h
var_244		= word ptr -244h
var_21C		= word ptr -21Ch
var_21A		= word ptr -21Ah
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1EC		= byte ptr -1ECh
var_1E8		= word ptr -1E8h
var_1D8		= word ptr -1D8h
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1CA		= word ptr -1CAh
var_1C8		= word ptr -1C8h
var_1C6		= word ptr -1C6h
var_1C2		= word ptr -1C2h
var_1A2		= word ptr -1A2h
var_12A		= word ptr -12Ah
var_B2		= word ptr -0B2h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_2F		= byte ptr -2Fh
var_2E		= word ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_19		= word ptr -19h
var_16		= dword	ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 276h
		push	si
		push	di
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	si, 93Ch
		lea	di, [bp+var_62]
		push	ss
		pop	es
		mov	cx, 8
		rep movsw
		mov	[bp+var_2], 0
		jmp	loc_5112D
; ���������������������������������������������������������������������������

loc_51075:				; CODE XREF: sub_51049+EAj
		xor	cx, cx
		jmp	loc_5111D
; ���������������������������������������������������������������������������

loc_5107A:				; CODE XREF: sub_51049+DEj
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bx+29Fh]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_62]
		add	bx, dx
		push	ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		pop	ax
		add	ax, [bx+2A1h]
		mov	si, ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_60]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bx+29Fh]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_60]
		add	bx, dx
		push	ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		pop	ax
		add	ax, [bx+2A1h]
		mov	di, ax
		cmp	di, si
		jle	short loc_5111C
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_44], ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_60]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_62]
		add	bx, dx
		mov	[bx], ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_60]
		add	bx, ax
		mov	ax, [bp+var_44]
		mov	[bx], ax

loc_5111C:				; CODE XREF: sub_51049+9Fj
		inc	cx

loc_5111D:				; CODE XREF: sub_51049+2Ej
		mov	ax, 7
		sub	ax, [bp+var_2]
		cmp	ax, cx
		jle	short loc_5112A
		jmp	loc_5107A
; ���������������������������������������������������������������������������

loc_5112A:				; CODE XREF: sub_51049+DCj
		inc	[bp+var_2]

loc_5112D:				; CODE XREF: sub_51049+29j
		cmp	[bp+var_2], 7
		jge	short loc_51136
		jmp	loc_51075
; ���������������������������������������������������������������������������

loc_51136:				; CODE XREF: sub_51049+E8j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_12A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_0 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_1A2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	3
		lea	ax, [bp+var_C]
		push	ax
		push	7Bh ; '{'
		lea	ax, [bp+var_12A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_1C2]
		push	ax
		call	sub_2D260
		add	sp, 4
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_16]
		push	ax
		push	16h
		lea	ax, [bp+var_1A2]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_1C], 0
		mov	[bp+var_19], 0
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_LoadAndUpload_2D077
		add	sp, 4
		mov	[bp+var_1D0], 0
		mov	[bp+var_1CE], 0
		mov	[bp+var_1CC], 0
		mov	[bp+var_1CA], 0
		mov	[bp+var_1C8], 13Fh
		mov	[bp+var_1C6], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_1D0]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aBoardfnt ; "boardfnt"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_2A+2],	dx
		mov	word ptr [bp+var_2A], ax
		mov	eax, [bp+var_2A]
		mov	[bp+var_26], eax
		mov	[bp+var_22], 2
		mov	[bp+var_21], 1
		mov	[bp+var_20], 0
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_1E8]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_1D8], 0
		mov	[bp+var_1D6], 0
		push	2Dh ; '-'
		lea	ax, [bp+var_1E8]
		push	ax
		mov	bx, [bp+var_1E8]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_1D4], ax
		lea	ax, [bp+var_1E8]
		push	ax
		lea	ax, [bp+var_1D0]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		lea	ax, [bp+var_1D0]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	word_46F46
		call	TextScrollDisplayB_ApplyHelperA_3F6C0
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_3F74A
		mov	bx, [bp+arg_0]
		push	word ptr [bx+0E4h]
		lea	ax, [bp+var_1D0]
		push	ax
		lea	ax, [bp+var_21C]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx+0FCh], 0Dh
		jnz	short loc_51345
		push	955h
		lea	ax, [bp+var_244]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_51355
; ���������������������������������������������������������������������������

loc_51345:				; CODE XREF: sub_51049+2E8j
		push	966h
		lea	ax, [bp+var_244]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_51355:				; CODE XREF: sub_51049+2FAj
		mov	[bp+var_2F], 0
		mov	[bp+var_1EC], 4
		mov	[bp+var_32], 975h
		mov	[bp+var_34], 97Ch
		push	[bp+var_32]
		lea	ax, [bp+var_202]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	[bp+var_36], ax
		push	[bp+var_34]
		lea	ax, [bp+var_202]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	[bp+var_38], ax
		mov	ax, [bp+arg_0]
		add	ax, 3C0h
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_258]
		push	ax
		call	CRT_Strupr
		add	sp, 2
		jmp	short loc_513CA
; ���������������������������������������������������������������������������

loc_513B1:				; CODE XREF: sub_51049+39Dj
		lea	ax, [bp+var_258]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_258]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_513CA:				; CODE XREF: sub_51049+366j
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		cmp	ax, 8Ch	; '�'
		jle	short loc_513E8
		cmp	byte ptr [bp+var_258], 0
		jnz	short loc_513B1

loc_513E8:				; CODE XREF: sub_51049+396j
		xor	eax, eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[bp+var_3C], 3
		mov	eax, dword_47ABB
		mov	[bp+var_40], eax
		mov	[bp+var_41], 0

loc_51407:				; CODE XREF: sub_51049:loc_516C8j
		mov	eax, [bp+var_40]
		add	eax, [bp+var_3C]
		cmp	eax, dword_47ABB
		ja	short loc_5141B
		mov	ax, 1
		jmp	short loc_5141D
; ���������������������������������������������������������������������������

loc_5141B:				; CODE XREF: sub_51049+3CBj
		xor	ax, ax

loc_5141D:				; CODE XREF: sub_51049+3D0j
		or	al, al
		jnz	short loc_51424
		jmp	loc_5160E
; ���������������������������������������������������������������������������

loc_51424:				; CODE XREF: sub_51049+3D6j
		call	sub_D157
		mov	[bp+var_3C], 3
		mov	eax, dword_47ABB
		mov	[bp+var_40], eax
		mov	[bp+var_44], 0Fh
		mov	si, 3Ch	; '<'
		lea	ax, [bp+var_1C2]
		push	ax
		call	sub_2D7AD
		add	sp, 2
		push	[bp+var_32]
		push	2Dh ; '-'
		mov	ax, 0FAh ; '�'
		sub	ax, [bp+var_36]
		push	ax
		push	980h
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		push	[bp+var_34]
		push	2Dh ; '-'
		mov	ax, 122h
		sub	ax, [bp+var_38]
		push	ax
		push	987h
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		mov	[bp+var_2], 0
		jmp	loc_515BC
; ���������������������������������������������������������������������������

loc_5148E:				; CODE XREF: sub_51049+579j
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	word ptr [bx+2A3h], 0
		jnz	short loc_514AE
		jmp	loc_515B9
; ���������������������������������������������������������������������������

loc_514AE:				; CODE XREF: sub_51049+460j
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_514D1
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_276]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_514F0
; ���������������������������������������������������������������������������

loc_514D1:				; CODE XREF: sub_51049+472j
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	bx, [bx]
		shl	bx, 1
		push	word ptr [bx+2FEh]
		lea	ax, [bp+var_276]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_514F0:				; CODE XREF: sub_51049+486j
		lea	ax, [bp+var_276]
		push	ax
		push	si
		push	53h ; 'S'
		push	98Eh
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		push	0Ah
		lea	ax, [bp+var_4A]
		push	ax
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx+2A1h]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0Ah
		lea	ax, [bp+var_50]
		push	ax
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx+29Fh]
		call	CRT_Itoa_Signed10
		add	sp, 6
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	di, ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	[bp+var_52], ax
		lea	ax, [bp+var_4A]
		push	ax
		push	si
		mov	ax, 0FAh ; '�'
		sub	ax, di
		push	ax
		push	995h
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_50]
		push	ax
		push	si
		mov	ax, 122h
		sub	ax, [bp+var_52]
		push	ax
		push	99Ch
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		add	si, [bp+var_44]

loc_515B9:				; CODE XREF: sub_51049+462j
		inc	[bp+var_2]

loc_515BC:				; CODE XREF: sub_51049+442j
		cmp	[bp+var_2], 8
		jge	short loc_515C5
		jmp	loc_5148E
; ���������������������������������������������������������������������������

loc_515C5:				; CODE XREF: sub_51049+577j
		cmp	[bp+var_2F], 0
		jz	short loc_515E5
		lea	ax, [bp+var_244]
		push	ax
		push	0AFh ; '�'
		push	2
		push	9A3h
		lea	ax, [bp+var_21C]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah

loc_515E5:				; CODE XREF: sub_51049+580j
		push	word_46F44
		call	sub_3F8CC
		add	sp, 2
		lea	ax, [bp+var_1D0]
		push	ax
		push	word_46F46
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		push	word_46F44
		call	sub_3F8DE
		add	sp, 2

loc_5160E:				; CODE XREF: sub_51049+3D8j
		mov	byte ptr [bp+var_48], 0
		lea	ax, [bp+var_48]
		push	ax
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte ptr [bp+var_48], 0
		jnz	short loc_5164A
		lea	ax, [bp+var_48]
		push	ax
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_51648
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_51648:				; CODE XREF: sub_51049+5EBj
		jmp	short $+2

loc_5164A:				; CODE XREF: sub_51049+5D9j
		cmp	byte ptr [bp+var_48], 0
		jz	short loc_51676
		mov	dx, [bp+var_46]
		mov	bx, [bp+var_44]
		or	dx, dx
		jle	short loc_51672
		cmp	dx, 280h
		jge	short loc_51672
		cmp	bx, 96h	; '�'
		jle	short loc_51672
		cmp	bx, 0C8h ; '�'
		jge	short loc_51672
		mov	[bp+var_2F], 1
		jmp	short loc_51676
; ���������������������������������������������������������������������������

loc_51672:				; CODE XREF: sub_51049+60Fj
					; sub_51049+615j ...
		mov	[bp+var_2F], 0

loc_51676:				; CODE XREF: sub_51049+605j
					; sub_51049+627j
		cmp	[bp+var_2F], 0
		jz	short loc_51695
		cmp	word_49818, 1
		jnz	short loc_51693
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	word_49818, 0
		call	TextScrollDisplayB_ApplyHelperC_3F74A

loc_51693:				; CODE XREF: sub_51049+638j
		jmp	short loc_516AC
; ���������������������������������������������������������������������������

loc_51695:				; CODE XREF: sub_51049+631j
		cmp	word_49818, 0
		jnz	short loc_516AC
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	word_49818, 1
		call	TextScrollDisplayB_ApplyHelperC_3F74A

loc_516AC:				; CODE XREF: sub_51049:loc_51693j
					; sub_51049+651j
		cmp	byte ptr [bp+var_48], 2
		jnz	short loc_516BA
		cmp	[bp+var_2F], 0
		jz	short loc_516BA
		jmp	short loc_516CB
; ���������������������������������������������������������������������������

loc_516BA:				; CODE XREF: sub_51049+667j
					; sub_51049+66Dj
		cmp	byte ptr [bp+var_4C], 2
		jnz	short loc_516C8
		cmp	byte ptr [bp+var_4C+1],	1
		jnz	short loc_516C8
		jmp	short loc_516CB
; ���������������������������������������������������������������������������

loc_516C8:				; CODE XREF: sub_51049+675j
					; sub_51049+67Bj
		jmp	loc_51407
; ���������������������������������������������������������������������������

loc_516CB:				; CODE XREF: sub_51049+66Fj
					; sub_51049+67Dj
		call	TextScrollDisplayB_ApplyHelperD_3F784
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		lea	ax, [bp+var_21A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_200]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1E8]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_51739
		cmp	[bp+var_26], 0
		jz	short loc_51739
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_51739:				; CODE XREF: sub_51049+6D0j
					; sub_51049+6D7j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		lea	ax, [bp+var_1D0]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_5178C
		cmp	[bp+var_16], 0
		jz	short loc_5178C
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5178C:				; CODE XREF: sub_51049+723j
					; sub_51049+72Aj
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_1C2]
		push	ax
		call	CachedObject_Destruct_2D440
		add	sp, 4
		cmp	[bp+var_7], 0
		jz	short loc_517D3
		cmp	[bp+var_C], 0
		jz	short loc_517D3
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_517D3:				; CODE XREF: sub_51049+76Aj
					; sub_51049+771j
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_1A2]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_12A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_51049	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_51809	proc far		; CODE XREF: sub_42050J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_51824
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short $+2

loc_51824:				; CODE XREF: sub_51809+9j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_51809	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
ovr187		ends
