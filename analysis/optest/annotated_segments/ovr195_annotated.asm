ovr195		segment	para public 'OVERLAY' use16
		assume cs:ovr195
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_RegisterTickModule_AA810 (sub_AA810 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far,
; enregistre le module auprès du minuteur matériel : référence explicitement
; Music_SequencerTickISR_5940B (seg121) via Stopwatch_RegisterTickModuleVariant_67662 (seg207,
; tag 5DC2h, cadence 0x14). Confirme le lien direct entre ce cluster et le registre de modules
; à créneaux temporisés (seg161) découvert plusieurs lots auparavant.
; ==============================================================================================
AudioQueue_RegisterTickModule_5EEB0	proc far		; CODE XREF: sub_42359J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 14h
		push	seg seg013
		push	offset loc_8B08
		push	67A2h
		call	Stopwatch_RegisterTickModuleVariant_3EE86
		add	sp, 0Ah
		mov	[si+4],	ax
		pop	si
		pop	bp
		retf
AudioQueue_RegisterTickModule_5EEB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EED1	proc far		; CODE XREF: sub_4235EJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	si
		nop
		push	cs
		call	near ptr sub_5F982
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_5EED1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5EEE6	proc far		; CODE XREF: sub_42363J

var_23C		= word ptr -23Ch
var_1C4		= word ptr -1C4h
var_163		= dword	ptr -163h
var_15F		= dword	ptr -15Fh
var_157		= word ptr -157h
var_153		= dword	ptr -153h
var_14C		= word ptr -14Ch
var_EF		= dword	ptr -0EFh
var_EB		= dword	ptr -0EBh
var_E6		= word ptr -0E6h
var_85		= dword	ptr -85h
var_81		= dword	ptr -81h
var_79		= word ptr -79h
var_75		= dword	ptr -75h
var_6E		= word ptr -6Eh
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 23Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	1
		push	di
		nop
		push	cs
		call	near ptr sub_5F982
		add	sp, 4
		mov	ax, [bp+arg_4]
		cmp	ax, word_44597
		jnz	short loc_5EF0F
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_5EF0F
		jmp	loc_5F39B
; ���������������������������������������������������������������������������

loc_5EF0F:				; CODE XREF: sub_5EEE6+1Ej
					; sub_5EEE6+24j
		push	di
		nop
		push	cs
		call	near ptr sub_5FA57
		add	sp, 2
		push	ds
		push	offset a_dat	; ".dat"
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_5EF5A
		push	0
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		jmp	short loc_5EF6C
; ���������������������������������������������������������������������������

loc_5EF5A:				; CODE XREF: sub_5EEE6+61j
		mov	ax, [bp+arg_4]
		dec	ax
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4

loc_5EF6C:				; CODE XREF: sub_5EEE6+72j
		mov	eax, [bp+var_81]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_79]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5EF87
		mov	eax, [bp+var_85]
		jmp	short loc_5EF8B
; ���������������������������������������������������������������������������

loc_5EF87:				; CODE XREF: sub_5EEE6+98j
		mov	eax, [bp+var_75]

loc_5EF8B:				; CODE XREF: sub_5EEE6+9Fj
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_14C], 556h
		mov	[bp+var_EB], 100h
		mov	[bp+var_EF], 0
		mov	[bp+var_14C], 693h
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		mov	al, byte_46848
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_5EFFF
		cmp	ax, 2
		jz	short loc_5EFEE
		jmp	short loc_5F010
; ���������������������������������������������������������������������������

loc_5EFEE:				; CODE XREF: sub_5EEE6+104j
		push	1581h
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_5F010
; ���������������������������������������������������������������������������

loc_5EFFF:				; CODE XREF: sub_5EEE6+FFj
		push	1586h
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short $+2

loc_5F010:				; CODE XREF: sub_5EEE6+106j
					; sub_5EEE6+117j
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	word_44597, 0FFFFh
		jz	short loc_5F046
		jmp	loc_5F0E6
; ���������������������������������������������������������������������������

loc_5F046:				; CODE XREF: sub_5EEE6+15Bj
		push	0
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	eax, [bp+var_15F]
		mov	[bp+var_1A], eax
		mov	ax, [bp+var_157]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5F071
		mov	eax, [bp+var_163]
		jmp	short loc_5F076
; ���������������������������������������������������������������������������

loc_5F071:				; CODE XREF: sub_5EEE6+182j
		mov	eax, [bp+var_153]

loc_5F076:				; CODE XREF: sub_5EEE6+189j
		mov	edx, [bp+var_1A]
		add	edx, eax
		mov	[bp+var_1E], edx
		mov	eax, [bp+var_1A]
		cmp	eax, [bp+var_1E]
		jz	short loc_5F0E4
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	0
		push	large [bp+var_1E]
		push	large [bp+var_1A]
		lea	ax, [bp+var_1C4]
		push	ax
		lea	ax, [bp+var_23C]
		push	ax
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_5F39F
		add	sp, 6
		lea	ax, [bp+var_23C]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_5F6FF
		add	sp, 4
		push	2
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_5F0E4:				; CODE XREF: sub_5EEE6+1A3j
		jmp	short loc_5F121
; ���������������������������������������������������������������������������

loc_5F0E6:				; CODE XREF: sub_5EEE6+15Dj
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		xor	si, si
		jmp	short loc_5F11B
; ���������������������������������������������������������������������������

loc_5F0FA:				; CODE XREF: sub_5EEE6+239j
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		inc	si

loc_5F11B:				; CODE XREF: sub_5EEE6+212j
		cmp	si, word_44599
		jl	short loc_5F0FA

loc_5F121:				; CODE XREF: sub_5EEE6:loc_5F0E4j
		mov	ax, word_44599
		cmp	ax, word_4457E
		jnz	short loc_5F12D
		jmp	loc_5F1BE
; ���������������������������������������������������������������������������

loc_5F12D:				; CODE XREF: sub_5EEE6+242j
		push	[bp+arg_4]
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	eax, [bp+var_15F]
		mov	[bp+var_1A], eax
		mov	ax, [bp+var_157]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5F159
		mov	eax, [bp+var_163]
		jmp	short loc_5F15E
; ���������������������������������������������������������������������������

loc_5F159:				; CODE XREF: sub_5EEE6+26Aj
		mov	eax, [bp+var_153]

loc_5F15E:				; CODE XREF: sub_5EEE6+271j
		mov	edx, [bp+var_1A]
		add	edx, eax
		mov	[bp+var_1E], edx
		mov	eax, [bp+var_1A]
		cmp	eax, [bp+var_1E]
		jz	short loc_5F1BE
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	0
		push	large [bp+var_1E]
		push	large [bp+var_1A]
		lea	ax, [bp+var_1C4]
		push	ax
		lea	ax, [bp+var_23C]
		push	ax
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_5F569
		add	sp, 6
		push	2
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_5F1BE:				; CODE XREF: sub_5EEE6+244j
					; sub_5EEE6+28Bj
		mov	ax, word_4457E
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	large [bp+var_12]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr dword_44593+2,	dx
		mov	word ptr dword_44593, ax
		mov	ax, word ptr dword_44593+2
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short $+2
		mov	[bp+var_16], 0
		jmp	short loc_5F270
; ���������������������������������������������������������������������������

loc_5F1FC:				; CODE XREF: sub_5EEE6+391j
		push	1
		push	0
		push	2
		movsx	eax, word_4457E
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	bx, [bp+var_16]
		shl	bx, 2
		les	si, dword_44593
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, dword_44593
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short $+2
		push	large 0FFFFFFFFh
		movsx	eax, word_4457E
		push	eax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, dword_44593
		add	bx, ax
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		inc	[bp+var_16]

loc_5F270:				; CODE XREF: sub_5EEE6+314j
		mov	ax, [bp+var_16]
		cmp	ax, word_4457E
		jl	short loc_5F1FC
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	ah, 0
		mov	word_44582, ax
		mov	ax, word_44582
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	large [bp+var_12]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr dword_4458F+2,	dx
		mov	word ptr dword_4458F, ax
		mov	ax, word ptr dword_4458F+2
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short $+2
		mov	[bp+var_16], 0
		jmp	loc_5F35C
; ���������������������������������������������������������������������������

loc_5F2CD:				; CODE XREF: sub_5EEE6+47Fj
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	byte ptr [bp+var_1A+3],	al
		push	1
		push	0
		push	2
		mov	al, byte ptr [bp+var_1A+3]
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	bx, [bp+var_16]
		shl	bx, 2
		les	si, dword_4458F
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, dword_4458F
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short $+2
		push	large 0FFFFFFFFh
		mov	al, byte ptr [bp+var_1A+3]
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, dword_4458F
		add	bx, ax
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		inc	[bp+var_16]

loc_5F35C:				; CODE XREF: sub_5EEE6+3E4j
		mov	ax, [bp+var_16]
		cmp	ax, word_44582
		jge	short loc_5F368
		jmp	loc_5F2CD
; ���������������������������������������������������������������������������

loc_5F368:				; CODE XREF: sub_5EEE6+47Dj
		mov	ax, [bp+arg_4]
		mov	word_44597, ax
		push	2
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		push	2
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_5F39B:				; CODE XREF: sub_5EEE6+26j
		pop	di
		pop	si
		leave
		retf
sub_5EEE6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5F39F	proc far		; CODE XREF: sub_4234AJ sub_5EEE6+1DBp

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	ah, 0
		mov	word_4457E, ax
		push	seg stub195
		push	offset sub_42345
		push	11h
		push	word_4457E
		push	0Ch
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word_44586, ax
		mov	[bp+var_1A], 0
		mov	[bp+var_16], 2
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_44584
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	bx, [bp+arg_4]
		mov	ax, [bx+5Dh]
		dec	ax
		mov	word_44599, ax
		mov	[bp+var_2], 0
		jmp	loc_5F515
; ���������������������������������������������������������������������������

loc_5F41C:				; CODE XREF: sub_5F39F+17Fj
		mov	ax, [bp+var_2]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_44586
		add	dx, ax
		mov	di, dx
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[di+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[di+0Bh], al
		push	[bp+var_4]
		push	[bp+arg_4]
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	bx, [bp+arg_4]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5F47A
		mov	bx, [bp+arg_4]
		mov	eax, [bx+61h]
		jmp	short loc_5F481
; ���������������������������������������������������������������������������

loc_5F47A:				; CODE XREF: sub_5F39F+D0j
		mov	bx, [bp+arg_4]
		mov	eax, [bx+71h]

loc_5F481:				; CODE XREF: sub_5F39F+D9j
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_5F48F
		jmp	loc_5F512
; ���������������������������������������������������������������������������

loc_5F48F:				; CODE XREF: sub_5F39F+EBj
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	large [bp+var_C]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_C]
		mov	[di+6],	eax
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+arg_4]
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		push	0
		push	di
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_5F512:				; CODE XREF: sub_5F39F+EDj
		inc	[bp+var_2]

loc_5F515:				; CODE XREF: sub_5F39F+7Aj
		mov	ax, [bp+var_2]
		cmp	ax, word_44599
		jge	short loc_5F521
		jmp	loc_5F41C
; ���������������������������������������������������������������������������

loc_5F521:				; CODE XREF: sub_5F39F+17Dj
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_15], 0
		jz	short loc_5F551
		cmp	[bp+var_1A], 0
		jz	short loc_5F551
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5F551:				; CODE XREF: sub_5F39F+192j
					; sub_5F39F+199j
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		pop	di
		pop	si
		leave
		retf
sub_5F39F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5F569	proc far		; CODE XREF: sub_4234FJ sub_5EEE6+2C3p

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1A], 0
		mov	[bp+var_16], 2
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_44584
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	ax, word_44599
		mov	[bp+var_2], ax
		jmp	loc_5F6AB
; ���������������������������������������������������������������������������

loc_5F5AF:				; CODE XREF: sub_5F569+14Bj
		mov	ax, [bp+var_2]
		sub	ax, word_44599
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_44586
		add	dx, ax
		mov	di, dx
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[di+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[di+0Bh], al
		push	[bp+var_4]
		push	[bp+arg_4]
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	bx, [bp+arg_4]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5F610
		mov	bx, [bp+arg_4]
		mov	eax, [bx+61h]
		jmp	short loc_5F617
; ���������������������������������������������������������������������������

loc_5F610:				; CODE XREF: sub_5F569+9Cj
		mov	bx, [bp+arg_4]
		mov	eax, [bx+71h]

loc_5F617:				; CODE XREF: sub_5F569+A5j
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_5F625
		jmp	loc_5F6A8
; ���������������������������������������������������������������������������

loc_5F625:				; CODE XREF: sub_5F569+B7j
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	large [bp+var_C]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_C]
		mov	[di+6],	eax
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+arg_4]
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		push	0
		push	di
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_5F6A8:				; CODE XREF: sub_5F569+B9j
		inc	[bp+var_2]

loc_5F6AB:				; CODE XREF: sub_5F569+43j
		mov	ax, [bp+var_2]
		cmp	ax, word_4457E
		jge	short loc_5F6B7
		jmp	loc_5F5AF
; ���������������������������������������������������������������������������

loc_5F6B7:				; CODE XREF: sub_5F569+149j
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_15], 0
		jz	short loc_5F6E7
		cmp	[bp+var_1A], 0
		jz	short loc_5F6E7
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5F6E7:				; CODE XREF: sub_5F569+15Ej
					; sub_5F569+165j
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		pop	di
		pop	si
		leave
		retf
sub_5F569	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5F6FF	proc far		; CODE XREF: sub_42354J sub_5EEE6+1E9p

var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= dword	ptr -98h
var_94		= byte ptr -94h
var_93		= byte ptr -93h
var_92		= dword	ptr -92h
var_8E		= word ptr -8Eh
var_31		= word ptr -31h
var_2D		= dword	ptr -2Dh
var_21		= word ptr -21h
var_1D		= dword	ptr -1Dh
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 9Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0
		push	[bp+arg_2]
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5F73A
		mov	bx, [bp+arg_2]
		mov	eax, [bx+61h]
		jmp	short loc_5F741
; ���������������������������������������������������������������������������

loc_5F73A:				; CODE XREF: sub_5F6FF+30j
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_5F741:				; CODE XREF: sub_5F6FF+39j
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_8E]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_3D2FA
		add	sp, 0Ch
		mov	ax, [bp+var_31]
		mov	word_44580, ax
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	11h
		push	word_44580
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word_44588, ax
		mov	[bp+var_98], 0
		mov	[bp+var_94], 2
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		mov	[bp+var_9C], 0
		mov	[bp+var_9A], 0FFFFh
		push	word_44584
		lea	ax, [bp+var_9C]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	[bp+var_A], 0
		jmp	loc_5F893
; ���������������������������������������������������������������������������

loc_5F7C6:				; CODE XREF: sub_5F6FF+19Dj
		mov	ax, [bp+var_A]
		mov	dx, 0Ah
		imul	dx
		mov	dx, word_44588
		add	dx, ax
		mov	di, dx
		push	[bp+var_A]
		lea	ax, [bp+var_8E]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp+var_21]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5F7F7
		mov	eax, [bp+var_2D]
		jmp	short loc_5F7FB
; ���������������������������������������������������������������������������

loc_5F7F7:				; CODE XREF: sub_5F6FF+F0j
		mov	eax, [bp+var_1D]

loc_5F7FB:				; CODE XREF: sub_5F6FF+F6j
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jnz	short loc_5F809
		jmp	loc_5F890
; ���������������������������������������������������������������������������

loc_5F809:				; CODE XREF: sub_5F6FF+105j
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		push	1
		push	0
		push	3
		push	large [bp+var_12]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_12]
		mov	[di+6],	eax
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_A]
		lea	ax, [bp+var_8E]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		push	0
		push	di
		lea	ax, [bp+var_9C]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_9C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_5F890:				; CODE XREF: sub_5F6FF+107j
		inc	[bp+var_A]

loc_5F893:				; CODE XREF: sub_5F6FF+C4j
		mov	ax, [bp+var_A]
		cmp	ax, word_44580
		jge	short loc_5F89F
		jmp	loc_5F7C6
; ���������������������������������������������������������������������������

loc_5F89F:				; CODE XREF: sub_5F6FF+19Bj
		lea	ax, [bp+var_9C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_93], 0
		jz	short loc_5F8D4
		cmp	[bp+var_98], 0
		jz	short loc_5F8D4
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5F8D4:				; CODE XREF: sub_5F6FF+1B2j
					; sub_5F6FF+1BAj
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5F6FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5F8FE	proc far		; CODE XREF: sub_42372J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_48E77, 0
		jz	short loc_5F921
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_5F921:				; CODE XREF: sub_5F8FE+Cj
		cmp	word_48E89, 0
		jz	short loc_5F93D
		push	word_48E8B
		mov	bx, word_48E89
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_5F93D:				; CODE XREF: sub_5F8FE+28j
		pop	si
		pop	bp
		retf
sub_5F8FE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5F940	proc far		; CODE XREF: sub_42377J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_48E77, 0
		jz	short loc_5F963
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C4E
		add	sp, 4
		jmp	short $+2

loc_5F963:				; CODE XREF: sub_5F940+Cj
		cmp	word_48E89, 0
		jz	short loc_5F97F
		push	word_48E8B
		mov	bx, word_48E89
		push	word ptr [bx+4]
		call	sub_30C4E
		add	sp, 4
		jmp	short $+2

loc_5F97F:				; CODE XREF: sub_5F940+28j
		pop	si
		pop	bp
		retf
sub_5F940	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5F982	proc far		; CODE XREF: sub_4237CJ sub_5EED1+Cp ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_4458B, 0FFFFh
		mov	byte_4458A, 0
		push	5E69h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+arg_2], 0
		jnz	short loc_5F9A8
		jmp	loc_5FA49
; ���������������������������������������������������������������������������

loc_5F9A8:				; CODE XREF: sub_5F982+21j
		cmp	word_48E77, 0
		jz	short loc_5F9D0
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5F9CC
		mov	ax, 1
		jmp	short loc_5F9CE
; ���������������������������������������������������������������������������

loc_5F9CC:				; CODE XREF: sub_5F982+43j
		xor	ax, ax

loc_5F9CE:				; CODE XREF: sub_5F982+48j
		jmp	short loc_5F9D2
; ���������������������������������������������������������������������������

loc_5F9D0:				; CODE XREF: sub_5F982+2Bj
		mov	al, 0

loc_5F9D2:				; CODE XREF: sub_5F982:loc_5F9CEj
		or	al, al
		jz	short loc_5FA49
		cmp	word_48E77, 0
		jz	short loc_5F9F7
		push	3E8h
		push	0
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_5F9F7:				; CODE XREF: sub_5F982+59j
		jmp	short $+2

loc_5F9F9:				; CODE XREF: sub_5F982+C5j
		cmp	word_48E77, 0
		jz	short loc_5FA21
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5FA1D
		mov	ax, 1
		jmp	short loc_5FA1F
; ���������������������������������������������������������������������������

loc_5FA1D:				; CODE XREF: sub_5F982+94j
		xor	ax, ax

loc_5FA1F:				; CODE XREF: sub_5F982+99j
		jmp	short loc_5FA23
; ���������������������������������������������������������������������������

loc_5FA21:				; CODE XREF: sub_5F982+7Cj
		mov	al, 0

loc_5FA23:				; CODE XREF: sub_5F982:loc_5FA1Fj
		or	al, al
		jz	short loc_5FA49
		cmp	word_48E77, 0
		jz	short loc_5FA43
		push	word_48E79
		mov	bx, word_48E77
		push	word ptr [bx+4]
		call	sub_30C5A
		add	sp, 4
		jmp	short loc_5FA45
; ���������������������������������������������������������������������������

loc_5FA43:				; CODE XREF: sub_5F982+AAj
		xor	ax, ax

loc_5FA45:				; CODE XREF: sub_5F982+BFj
		or	ax, ax
		jnz	short loc_5F9F9

loc_5FA49:				; CODE XREF: sub_5F982+23j
					; sub_5F982+52j ...
		push	5E57h
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_5F982	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5FA57	proc far		; CODE XREF: sub_42368J sub_5EEE6+2Cp	...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_5FAA8
; ���������������������������������������������������������������������������

loc_5FA66:				; CODE XREF: sub_5FA57+55j
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		les	bx, dword_44593
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	ax, di
		shl	ax, 2
		les	bx, dword_44593
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	di

loc_5FAA8:				; CODE XREF: sub_5FA57+Dj
		cmp	di, word_4457E
		jl	short loc_5FA66
		push	0
		push	2
		push	1573h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	dword_44593, 0
		xor	di, di
		jmp	short loc_5FB0F
; ���������������������������������������������������������������������������

loc_5FACD:				; CODE XREF: sub_5FA57+BCj
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		les	bx, dword_4458F
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		lea	ax, [bp+var_8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	ax, di
		shl	ax, 2
		les	bx, dword_4458F
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	di

loc_5FB0F:				; CODE XREF: sub_5FA57+74j
		cmp	di, word_44582
		jl	short loc_5FACD
		push	0
		push	2
		push	156Fh
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	dword_4458F, 0
		mov	di, word_44599
		jmp	loc_5FBED
; ���������������������������������������������������������������������������

loc_5FB37:				; CODE XREF: sub_5FA57+19Cj
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		cmp	byte ptr [bx+5], 0
		jz	short loc_5FB8C
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_5FB8C
		push	0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		mov	al, [bx+4]
		push	ax
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_44586
		add	dx, ax
		push	dx
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5FB8C:				; CODE XREF: sub_5FA57+F1j
					; sub_5FA57+105j
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		mov	al, 0
		mov	[bx+0Bh], al
		push	ax
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_44586
		add	bx, ax
		pop	ax
		mov	[bx+0Ah], al
		inc	di

loc_5FBED:				; CODE XREF: sub_5FA57+DDj
		cmp	di, word_4457E
		jge	short loc_5FBF6
		jmp	loc_5FB37
; ���������������������������������������������������������������������������

loc_5FBF6:				; CODE XREF: sub_5FA57+19Aj
		pop	di
		pop	si
		leave
		retf
sub_5FA57	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5FBFA	proc far		; CODE XREF: sub_4236DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_4457D, 0
		jz	short loc_5FC69
		mov	byte_4457D, 0
		push	1
		push	si
		push	cs
		call	near ptr sub_5F982
		add	sp, 4
		push	word ptr [si+4]
		push	67A2h
		call	Stopwatch_UnregisterTickModule_3EEC3
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_5FA57
		add	sp, 2
		push	seg stub195
		push	offset sub_42340
		push	19h
		push	0
		push	0Ch
		push	word_44586
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word_44586, 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	word_44588
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word_44588, 0

loc_5FC69:				; CODE XREF: sub_5FBFA+Cj
		pop	si
		pop	bp
		retf
sub_5FBFA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à AudioQueue_Helper_AB4BE
; (sub_AB4BE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (17 lignes).
; ==============================================================================================
AudioQueue_Helper_5FC6C	proc far		; CODE XREF: sub_42345J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		mov	ax, si
		pop	si
		pop	bp
		retf
AudioQueue_Helper_5FC6C	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5FC92	proc far		; CODE XREF: sub_42340J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5FCE7
		cmp	byte ptr [si+5], 0
		jz	short loc_5FCC1
		cmp	dword ptr [si],	0
		jz	short loc_5FCC1
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5FCC1:				; CODE XREF: sub_5FC92+13j
					; sub_5FC92+19j
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_5FCE5
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5FCE5:				; CODE XREF: sub_5FC92+46j
		jmp	short $+2

loc_5FCE7:				; CODE XREF: sub_5FC92+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_5FC92	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
ovr195		ends
