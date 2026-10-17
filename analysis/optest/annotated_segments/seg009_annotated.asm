seg009		segment	byte public 'CODE' use16
		assume cs:seg009
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_702F	proc far		; CODE XREF: sub_5D287+43AP
					; sub_5D287+52EP ...

var_176		= word ptr -176h
var_174		= word ptr -174h
var_172		= dword	ptr -172h
var_16E		= byte ptr -16Eh
var_16D		= byte ptr -16Dh
var_16C		= dword	ptr -16Ch
var_168		= word ptr -168h
var_118		= word ptr -118h
var_C8		= word ptr -0C8h
var_BA		= word ptr -0BAh
var_59		= dword	ptr -59h
var_4D		= word ptr -4Dh
var_49		= dword	ptr -49h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_26		= word ptr -26h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 176h
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_BA]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	[bp+arg_2]
		lea	ax, [bp+var_C8]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	14D8h
		lea	ax, [bp+var_C8]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	0
		push	0
		push	ss
		lea	ax, [bp+var_C8]
		push	ax
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_118]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_118]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		mov	bx, [bp+var_BA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp+var_4D]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_70B9
		mov	eax, [bp+var_59]
		jmp	short loc_70BD
; ���������������������������������������������������������������������������

loc_70B9:				; CODE XREF: sub_702F+82j
		mov	eax, [bp+var_49]

loc_70BD:				; CODE XREF: sub_702F+88j
		add	eax, 10h
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	14DDh
		push	1
		push	2
		push	2
		push	large [bp+var_8]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+0Ah], eax
		mov	byte ptr [si+0Eh], 2
		mov	byte ptr [si+0Fh], 1
		mov	dword ptr [si+10h], 0
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		push	0
		mov	al, [si+0Eh]
		push	ax
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_E], dx
		cmp	[bp+var_E], 9FFFh
		jbe	short $+2
		mov	ax, [bp+var_E]
		inc	ax
		mov	[bp+var_10], ax
		mov	[bp+var_12], 0
		push	[bp+var_10]
		push	[bp+var_12]
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		push	[bp+var_10]
		push	[bp+var_12]
		call	AIL_register_driver_309D0
		add	sp, 4
		mov	[si+4],	ax
		cmp	word ptr [si+4], 0FFFFh
		jnz	short $+2
		push	word ptr [si+4]
		call	AIL_describe_driver_30A9E
		add	sp, 2
		mov	[si+8],	dx
		mov	[si+6],	ax
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_7185
		les	bx, [si+6]
		mov	ax, es:[bx+0Ch]
		mov	[bp+arg_4], ax

loc_7185:				; CODE XREF: sub_702F+14Aj
		cmp	[bp+arg_6], 0FFFFh
		jnz	short loc_7195
		les	bx, [si+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp+arg_6], ax

loc_7195:				; CODE XREF: sub_702F+15Aj
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_71A5
		les	bx, [si+6]
		mov	ax, es:[bx+10h]
		mov	[bp+arg_8], ax

loc_71A5:				; CODE XREF: sub_702F+16Aj
		cmp	[bp+arg_A], 0FFFFh
		jnz	short loc_71B5
		les	bx, [si+6]
		mov	ax, es:[bx+12h]
		mov	[bp+arg_A], ax

loc_71B5:				; CODE XREF: sub_702F+17Aj
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [si+4]
		call	sub_30AC4
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_71EA
		call	PagedResourceC_RefreshAllInstances_2FD55
		push	144Ch
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	1
		call	CRT_Exit
		add	sp, 2

loc_71EA:				; CODE XREF: sub_702F+19Fj
		mov	al, 1
		mov	byte_46853, al
		mov	ah, 0
		mov	[bp+var_14], ax
		push	[bp+var_14]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [si+4]
		call	AIL_init_driver_30ACA
		add	sp, 0Ch
		mov	byte ptr [si+83h], 1
		les	bx, [si+6]
		cmp	word ptr es:[bx+2], 3
		jz	short loc_7220
		jmp	loc_74DE
; ���������������������������������������������������������������������������

loc_7220:				; CODE XREF: sub_702F+1ECj
		push	word ptr [si+4]
		call	sub_30C18
		add	sp, 2
		mov	di, ax
		or	di, di
		jz	short loc_72A5
		mov	dx, 2
		mov	ax, di
		imul	dx
		mov	di, ax
		movzx	eax, di
		mov	[bp+var_18], eax
		push	14FAh
		push	1
		push	0
		push	2
		push	large [bp+var_18]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[si+14h], eax
		mov	byte ptr [si+18h], 2
		mov	byte ptr [si+19h], 1
		mov	dword ptr [si+1Ah], 0
		mov	eax, [bp+var_18]
		mov	[si+1Ah], eax
		push	di
		push	0
		mov	al, [si+18h]
		push	ax
		push	word ptr [si+16h]
		push	word ptr [si+14h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+4]
		call	sub_30C1E
		add	sp, 8

loc_72A5:				; CODE XREF: sub_702F+200j
		push	1517h
		lea	ax, [bp+var_26]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_2C], 2Eh ; '.'
		mov	byte ptr [bp+var_2C+1],	0
		mov	ax, [si+6]
		add	ax, 4
		push	word ptr [si+8]
		push	ax
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_168]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_168]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		mov	bx, [si+1Eh]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	1
		lea	ax, [bp+var_BA]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp+var_4D]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7324
		mov	eax, [bp+var_59]
		jmp	short loc_7328
; ���������������������������������������������������������������������������

loc_7324:				; CODE XREF: sub_702F+2EDj
		mov	eax, [bp+var_49]

loc_7328:				; CODE XREF: sub_702F+2F3j
		mov	[bp+var_30], eax
		cmp	[bp+var_30], 0
		jnz	short loc_7336
		jmp	loc_74DE
; ���������������������������������������������������������������������������

loc_7336:				; CODE XREF: sub_702F+302j
		cmp	byte_46853, 0
		jnz	short loc_7340
		jmp	loc_74DE
; ���������������������������������������������������������������������������

loc_7340:				; CODE XREF: sub_702F+30Cj
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	eax, [bp+var_30]
		mov	[bp+var_3E], eax
		push	1
		push	0
		push	2
		push	large [bp+var_3E]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_42+2],	dx
		mov	word ptr [bp+var_42], ax
		mov	eax, [bp+var_42]
		mov	[bp+var_3A], eax
		mov	[bp+var_36], 2
		mov	[bp+var_35], 1
		mov	[bp+var_34], 0
		mov	eax, [bp+var_3E]
		mov	[bp+var_34], eax
		push	0
		mov	al, [bp+var_36]
		push	ax
		push	word ptr [bp+var_3A+2]
		push	word ptr [bp+var_3A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	1
		lea	ax, [bp+var_BA]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		mov	[bp+var_172], 0
		mov	[bp+var_16E], 2
		mov	[bp+var_16D], 0
		mov	[bp+var_16C], 0
		mov	[bp+var_176], 0
		mov	[bp+var_174], 0FFFFh
		push	si
		lea	ax, [bp+var_176]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_176]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	[bp+var_176], 0
		jz	short loc_7428
		push	[bp+var_174]
		mov	bx, [bp+var_176]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_7428:				; CODE XREF: sub_702F+3E2j
		jmp	short $+2

loc_742A:				; CODE XREF: sub_702F+429j
		cmp	[bp+var_176], 0
		jz	short loc_7452
		push	[bp+var_174]
		mov	bx, [bp+var_176]
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_744E
		mov	ax, 1
		jmp	short loc_7450
; ���������������������������������������������������������������������������

loc_744E:				; CODE XREF: sub_702F+418j
		xor	ax, ax

loc_7450:				; CODE XREF: sub_702F+41Dj
		jmp	short loc_7454
; ���������������������������������������������������������������������������

loc_7452:				; CODE XREF: sub_702F+400j
		mov	al, 1

loc_7454:				; CODE XREF: sub_702F:loc_7450j
		mov	ah, 0
		or	ax, ax
		jz	short loc_742A
		lea	ax, [bp+var_176]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_16D], 0
		jz	short loc_748F
		cmp	[bp+var_172], 0
		jz	short loc_748F
		push	0
		mov	al, [bp+var_16E]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_748F:				; CODE XREF: sub_702F+43Dj
					; sub_702F+445j
		mov	[bp+var_172], 0
		mov	[bp+var_16D], 0
		mov	[bp+var_16C], 0
		cmp	[bp+var_35], 0
		jz	short loc_74CA
		cmp	[bp+var_3A], 0
		jz	short loc_74CA
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74CA:				; CODE XREF: sub_702F+47Bj
					; sub_702F+482j
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0

loc_74DE:				; CODE XREF: sub_702F+1EEj
					; sub_702F+304j ...
		push	2
		lea	ax, [bp+var_BA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_702F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_74F1	proc far		; CODE XREF: sub_75AF+28p

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_3		= byte ptr  9

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	StreamReader_PrepareForRead_3B7B6
		add	sp, 2

loc_7509:				; CODE XREF: sub_74F1+44j sub_74F1+4Cj
		push	large 0FFFFFFFFh
		push	large 6
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		cmp	byte ptr [bp+var_6+1], 0FFh
		jnz	short loc_752F
		xor	dx, dx
		xor	ax, ax
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_752F:				; CODE XREF: sub_74F1+35j
		mov	al, byte ptr [bp+var_6+1]
		cmp	al, [bp+arg_3]
		jnz	short loc_7509
		mov	al, byte ptr [bp+var_6]
		cmp	al, [bp+arg_2]
		jnz	short loc_7509
		push	large [bp+var_4]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	Handle_ReadWordField_3AD81
		add	sp, 6
		mov	word_48E72, ax
		push	1
		push	0
		push	2
		movzx	eax, word_48E72
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		les	bx, [bp+var_A]
		mov	ax, word_48E72
		mov	es:[bx], ax
		push	large 0FFFFFFFFh
		mov	ax, word_48E72
		sub	ax, 2
		movzx	eax, ax
		push	eax
		mov	ax, word ptr [bp+var_A]
		add	ax, 2
		push	word ptr [bp+var_A+2]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	dx, word ptr [bp+var_A+2]
		mov	ax, word ptr [bp+var_A]
		pop	si
		leave
		retf
sub_74F1	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_75AF	proc far		; CODE XREF: seg009:076Cp
					; MusicChannel_RegisterSequence_7918+113P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte ptr [bp+arg_2]
		cbw
		push	ax
		mov	al, byte ptr [bp+arg_2+1]
		cbw
		push	ax
		push	word ptr [si+4]
		call	sub_30C3C
		add	sp, 6
		or	ax, ax
		jnz	short loc_7645
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_74F1
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_7629
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		mov	al, byte ptr [bp+arg_2]
		cbw
		push	ax
		mov	al, byte ptr [bp+arg_2+1]
		cbw
		push	ax
		push	word ptr [si+4]
		call	sub_30C2A
		add	sp, 0Ah
		cmp	[bp+var_4], 0
		jz	short loc_7627
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	[bp+var_4], 0

loc_7627:				; CODE XREF: sub_75AF+5Bj
		jmp	short loc_7645
; ���������������������������������������������������������������������������

loc_7629:				; CODE XREF: sub_75AF+39j
		les	bx, dword_46AAE
		cmp	byte ptr es:[bx], 0
		jz	short loc_7640
		push	0D003h
		call	sub_30D3
		add	sp, 2
		jmp	short loc_7645
; ���������������������������������������������������������������������������

loc_7640:				; CODE XREF: sub_75AF+82j
		mov	byte_4457C, 4

loc_7645:				; CODE XREF: sub_75AF+21j
					; sub_75AF:loc_7627j ...
		pop	si
		leave
		retf
sub_75AF	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0ACh
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, 1
		lea	ax, [bp-0ACh]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	word ptr [bp-0ACh], 556h
		mov	dword ptr [bp-4Bh], 100h
		mov	dword ptr [bp-4Fh], 0
		mov	word ptr [bp-0ACh], 56Eh
		mov	word ptr [bp-30h], 0
		xor	ax, ax
		mov	[bp-32h], ax
		movsx	eax, ax
		mov	[bp-47h], eax
		push	1
		push	word ptr [bp+8]
		lea	ax, [bp-0ACh]
		push	ax
		mov	bx, [bp-0ACh]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 52494458h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_76F4
		push	0
		push	large 4F464E49h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_76E7
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	di, ax

loc_76E7:				; CODE XREF: seg009:06B6j
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_76F4:				; CODE XREF: seg009:069Dj
		push	large 44494D58h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndReadC_3C09B
		add	sp, 6
		or	ax, ax
		jnz	short loc_770E
		jmp	loc_77D9
; ���������������������������������������������������������������������������

loc_770E:				; CODE XREF: seg009:06E9j
		jmp	loc_77C5
; ���������������������������������������������������������������������������

loc_7711:				; CODE XREF: seg009:07A9j
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		add	sp, 2
		or	ax, ax
		jnz	short loc_7725
		jmp	loc_77AA
; ���������������������������������������������������������������������������

loc_7725:				; CODE XREF: seg009:0700j
		cmp	dword ptr [bp-3Fh], 44494D58h
		jnz	short loc_7734
		mov	ax, 1
		jmp	short loc_7736
; ���������������������������������������������������������������������������

loc_7734:				; CODE XREF: seg009:070Dj
		xor	ax, ax

loc_7736:				; CODE XREF: seg009:0712j
		or	ax, ax
		jz	short loc_77AA
		lea	ax, [bp-0ACh]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large 424D4954h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_779C
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp-4],	ax
		jmp	short loc_7792
; ���������������������������������������������������������������������������

loc_7772:				; CODE XREF: seg009:077Aj
		push	large 2
		push	ss
		lea	ax, [bp-2]
		push	ax
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_75AF
		add	sp, 4

loc_7792:				; CODE XREF: seg009:0750j
		mov	ax, [bp-4]
		dec	word ptr [bp-4]
		or	ax, ax
		jnz	short loc_7772

loc_779C:				; CODE XREF: seg009:073Ej
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		dec	di

loc_77AA:				; CODE XREF: seg009:0702j seg009:0718j
		mov	eax, [bp-36h]
		mov	[bp-47h], eax
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		or	ax, ax
		jz	short loc_77C5
		jmp	short loc_77CC
; ���������������������������������������������������������������������������

loc_77C5:				; CODE XREF: seg009:loc_770Ej
					; seg009:07A1j
		or	di, di
		jz	short loc_77CC
		jmp	loc_7711
; ���������������������������������������������������������������������������

loc_77CC:				; CODE XREF: seg009:07A3j seg009:07A7j
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ResetIfSet_3C5C8
		add	sp, 2

loc_77D9:				; CODE XREF: seg009:06EBj
		mov	word ptr [bp-0ACh], 56Eh
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp-0ACh]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_77FF	proc far		; CODE XREF: sub_28EDF+B1P
					; sub_28EDF+19AP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+83h], 0
		jz	short loc_7837
		mov	al, byte_46853
		mov	ah, 0
		push	ax
		push	ds
		push	offset aScscscfy ; "SCSCSCFY!"
		push	word ptr [si+4]
		call	AIL_shutdown_driver_30B79
		add	sp, 8
		push	word ptr [si+4]
		call	AIL_release_driver_handle_30A76
		add	sp, 2
		mov	word ptr [si+4], 0FFFFh
		mov	byte ptr [si+83h], 0

loc_7837:				; CODE XREF: sub_77FF+Cj
		pop	si
		pop	bp
		retf
sub_77FF	endp

seg009		ends
