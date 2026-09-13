ovr254		segment	para public 'OVERLAY' use16
		assume cs:ovr254
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 541 lignes, NON DÉTAILLÉE — combine allocateurs typés et
; ResourceRecord_ReadDwordFieldB_64AFF (seg193, répété). Candidat pour session dédiée.
; ==============================================================================================
MissionRecord_LoadWithDwordFields_89850	proc far		; CODE XREF: VROOMM_StubThunk_6B3DDJ

var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 76h
		push	si
		push	di
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_89883
		push	1
		push	0
		push	2
		push	large 1Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_89883
		jmp	loc_89D43
; ���������������������������������������������������������������������������

loc_89883:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+10j
					; MissionRecord_LoadWithDwordFields_89850+2Ej
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B3Fh
		mov	word ptr es:[bx], 0B1Fh
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0

loc_898EF:
		mov	[bp+var_E], 0

loc_898F7:
		mov	ax, [bp+arg_4]

loc_898FA:
		mov	es:[bx+2], ax
		push	0

loc_89900:
		push	large 50414853h

loc_89906:
		push	si

loc_89907:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_89974
		mov	eax, [si+72h]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_4], eax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_89974:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+C1j
		push	0
		push	large 32504853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_899EA
		mov	eax, [si+72h]
		mov	[bp+var_20], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_24+2],	dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_14], eax
		mov	[bp+var_10], 3
		mov	[bp+var_F], 1
		mov	[bp+var_E], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_E], eax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_899EA:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+137j
		push	0

loc_899EC:
		push	large 4F464E49h
		push	si

loc_899F3:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_89A02
		jmp	loc_89CD7
; ���������������������������������������������������������������������������

loc_89A02:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+1ADj
		cmp	[bp+var_A], 0
		jz	short loc_89A0E
		mov	ax, 1
		jmp	short loc_89A10
; ���������������������������������������������������������������������������

loc_89A0E:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+1B7j
		xor	ax, ax

loc_89A10:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+1BCj
		or	ax, ax
		jnz	short loc_89A17
		jmp	loc_89CD7
; ���������������������������������������������������������������������������

loc_89A17:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+1C2j
		mov	[bp+var_56], 0
		mov	[bp+var_54], 0
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_34], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_32], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_30], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_38], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_36], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	di, ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_3E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_40], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_42], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_46], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_44], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_4A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_48], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_4E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_4C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_52], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_50], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_5A], ax
		mov	ax, [bp+var_3A]

loc_89AF1:
		mov	[bp+var_58], ax
		sub	[bp+var_58], 3
		mov	ax, [bp+var_34]
		add	ax, 0FFFBh
		mov	[bp+var_62], ax

loc_89B01:
		mov	[bp+var_60], 0

loc_89B06:
		mov	ax, [bp+var_30]
		add	ax, 5
		mov	[bp+var_5E], ax
		mov	[bp+var_5C], 0C8h ; '�'
		push	3
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B46B
		add	sp, 6
		or	ax, dx
		jnz	short loc_89B29
		jmp	loc_89CCF
; ���������������������������������������������������������������������������

loc_89B29:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+2D4j
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B44D
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], dx
		mov	es:[bx+16h], ax
		push	ss
		lea	ax, [bp+var_62]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B452
		add	sp, 0Eh
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], dx
		mov	es:[bx+1Ah], ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B45C
		add	sp, 0Eh
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], dx
		mov	es:[bx+12h], ax
		push	large 0
		push	large dword ptr	es:[bx+12h]
		call	UI_SetCallback
		add	sp, 8
		push	large 167h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField2E
		add	sp, 8
		push	di
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField32
		add	sp, 6
		mov	ax, [bp+var_40]
		mov	[bp+var_64], ax
		mov	[bp+var_66], di
		movsx	eax, [bp+var_66]
		shl	eax, 8
		mov	[bp+var_6A], eax
		movsx	eax, [bp+var_64]

loc_89BF1:
		shl	eax, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	edx, eax
		mov	ecx, [bp+var_6A]

loc_89C04:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_89C0F:
		mov	[bp+var_72], eax

loc_89C13:
		mov	eax, [bp+var_72]

loc_89C17:
		mov	[bp+var_76], eax
		lea	ax, [bp+var_76]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField38
		add	sp, 6
		push	[bp+var_3E]
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField34
		add	sp, 6
		push	[bp+var_42]
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField36
		add	sp, 6
		push	4
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4D5
		add	sp, 6
		or	ax, dx
		jz	short loc_89CCF
		push	2
		lea	ax, [bp+var_46]
		push	ax
		push	0A8Ah
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		push	0A8Dh
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		push	0A90h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah
		push	2
		lea	ax, [bp+var_52]
		push	ax
		push	0A93h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah

loc_89CCF:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+2D6j
					; MissionRecord_LoadWithDwordFields_89850+419j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_89CD7:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+1AFj
					; MissionRecord_LoadWithDwordFields_89850+1C4j
		cmp	[bp+var_F], 0
		jz	short loc_89D03
		cmp	[bp+var_14], 0
		jz	short loc_89D03
		push	0
		mov	al, [bp+var_10]
		push	ax
		mov	eax, [bp+var_14]
		mov	[bp+var_28], eax

loc_89CF2:
		lea	ax, [bp+var_28]
		push	ax

loc_89CF6:
		push	5C44h

loc_89CF9:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_89D03:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+48Bj
					; MissionRecord_LoadWithDwordFields_89850+492j
		mov	[bp+var_14], 0

loc_89D0B:
		mov	[bp+var_F], 0

loc_89D0F:
		mov	[bp+var_E], 0
		cmp	[bp+var_5], 0
		jz	short loc_89D43
		cmp	[bp+var_A], 0
		jz	short loc_89D43
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_2C], eax
		lea	ax, [bp+var_2C]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_89D43:				; CODE XREF: MissionRecord_LoadWithDwordFields_89850+30j
					; MissionRecord_LoadWithDwordFields_89850+4CBj ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFields_89850	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 182 lignes, NON DÉTAILLÉE — combine ResourceRecord_AllocateAndDecode_64C21 et
; lectures IFF répétées.
; ==============================================================================================
MissionRecord_LoadAndDecodeSub_89D4D	proc far		; CODE XREF: VROOMM_StubThunk_6B3E2J

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_89D7F
		push	1
		push	0
		push	2
		push	large 0Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_89D7F
		jmp	loc_89EF7
; ���������������������������������������������������������������������������

loc_89D7F:				; CODE XREF: MissionRecord_LoadAndDecodeSub_89D4D+Fj
					; MissionRecord_LoadAndDecodeSub_89D4D+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B0Fh
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	si
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		push	0
		push	large 50414853h
		push	si

loc_89E00:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_89E6D

loc_89E0C:
		mov	eax, [si+72h]

loc_89E10:
		mov	[bp+var_E], eax

loc_89E14:
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_89E6D:				; CODE XREF: MissionRecord_LoadAndDecodeSub_89D4D+BDj
		cmp	[bp+var_A], 0
		jz	short loc_89E79
		mov	ax, 1
		jmp	short loc_89E7B
; ���������������������������������������������������������������������������

loc_89E79:				; CODE XREF: MissionRecord_LoadAndDecodeSub_89D4D+125j
		xor	ax, ax

loc_89E7B:				; CODE XREF: MissionRecord_LoadAndDecodeSub_89D4D+12Aj
		or	ax, ax
		jz	short loc_89EC4
		mov	[bp+var_1A], 0
		mov	[bp+var_18], 0
		push	1
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B46B
		add	sp, 6
		or	ax, dx
		jz	short loc_89EBC
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B452
		add	sp, 0Eh

loc_89EBC:				; CODE XREF: MissionRecord_LoadAndDecodeSub_89D4D+14Cj
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_89EC4:				; CODE XREF: MissionRecord_LoadAndDecodeSub_89D4D+130j
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		cmp	[bp+var_5], 0
		jz	short loc_89EF7
		cmp	[bp+var_A], 0
		jz	short loc_89EF7
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_89EF7:				; CODE XREF: MissionRecord_LoadAndDecodeSub_89D4D+2Fj
					; MissionRecord_LoadAndDecodeSub_89D4D+182j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadAndDecodeSub_89D4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 762 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadWithDwordFields_89850.
; Candidat pour session dédiée.
; ==============================================================================================
MissionRecord_LoadWithDwordFieldsB_89F00	proc far		; CODE XREF: VROOMM_StubThunk_6B3E7J

var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0A2h
		push	si
		push	di
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_89F34

loc_89F13:
		push	1
		push	0
		push	2
		push	large 1Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_89F34
		jmp	loc_8A5D6
; ���������������������������������������������������������������������������

loc_89F34:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+11j
					; MissionRecord_LoadWithDwordFieldsB_89F00+2Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B3Fh
		mov	word ptr es:[bx], 0AFFh
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8A025
		mov	eax, [si+72h]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3

loc_89FF1:
		mov	[bp+var_5], 1

loc_89FF5:
		mov	[bp+var_4], 0

loc_89FFD:
		mov	eax, [bp+var_18]

loc_8A001:
		mov	[bp+var_4], eax
		push	0

loc_8A007:
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8A025:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+C2j
		push	0
		push	large 32504853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8A09B
		mov	eax, [si+72h]
		mov	[bp+var_20], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_24+2],	dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_14], eax
		mov	[bp+var_10], 3
		mov	[bp+var_F], 1
		mov	[bp+var_E], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_E], eax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8A09B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+138j
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8A0B3
		jmp	loc_8A56A
; ���������������������������������������������������������������������������

loc_8A0B3:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+1AEj
		cmp	[bp+var_A], 0
		jz	short loc_8A0BF
		mov	ax, 1
		jmp	short loc_8A0C1
; ���������������������������������������������������������������������������

loc_8A0BF:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+1B8j
		xor	ax, ax

loc_8A0C1:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+1BDj
		or	ax, ax
		jnz	short loc_8A0C8
		jmp	loc_8A56A
; ���������������������������������������������������������������������������

loc_8A0C8:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+1C3j
		mov	[bp+var_5A], 0
		mov	[bp+var_58], 0
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_34], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_32], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_30], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8A0F7:
		mov	[bp+var_2E], ax
		push	si

loc_8A0FB:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8A101:
		mov	[bp+var_38], ax
		push	si

loc_8A105:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_36], ax
		push	si

loc_8A10F:
		call	ResourceRecord_ReadFieldGroupB_64A54

loc_8A114:
		pop	cx
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	di, ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_3E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_40], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_42], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_46], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_44], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_4A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_48], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_4E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_4C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_52], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_50], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_56], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_54], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_5E], ax
		mov	ax, [bp+var_3A]
		mov	[bp+var_5C], ax
		push	41h ; 'A'
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		push	word ptr [bx+11h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	dx, [bp+var_5E]
		sub	dx, ax
		mov	[bp+var_5E], dx
		mov	[bp+var_66], 0
		mov	ax, [bp+var_32]
		mov	[bp+var_64], ax
		mov	[bp+var_62], 140h
		mov	ax, [bp+var_2E]

loc_8A1F2:
		mov	[bp+var_60], ax
		push	3

loc_8A1F7:
		push	large [bp+arg_0]

loc_8A1FB:
		call	VROOMM_StubThunk_6B46B

loc_8A200:
		add	sp, 6
		or	ax, dx
		jnz	short loc_8A20A
		jmp	loc_8A562
; ���������������������������������������������������������������������������

loc_8A20A:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+305j
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B44D
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], dx
		mov	es:[bx+16h], ax
		push	ss
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B452
		add	sp, 0Eh
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], dx
		mov	es:[bx+1Ah], ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B457
		add	sp, 0Eh
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], dx
		mov	es:[bx+12h], ax
		push	large 0
		push	large dword ptr	es:[bx+12h]
		call	UI_SetCallback
		add	sp, 8
		push	large 182B8h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField2E
		add	sp, 8
		push	di
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField32
		add	sp, 6
		mov	ax, [bp+var_40]
		mov	[bp+var_68], ax
		mov	[bp+var_6A], di
		movsx	eax, [bp+var_6A]
		shl	eax, 8
		mov	[bp+var_6E], eax
		movsx	eax, [bp+var_68]
		shl	eax, 8
		mov	[bp+var_72], eax
		mov	eax, [bp+var_72]
		mov	edx, eax
		mov	ecx, [bp+var_6E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_8A2F0:
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]

loc_8A2F8:
		mov	[bp+var_7A], eax

loc_8A2FC:
		lea	ax, [bp+var_7A]
		push	ax

loc_8A300:
		les	bx, [bp+arg_0]

loc_8A303:
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField38
		add	sp, 6
		push	[bp+var_3E]

loc_8A313:
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	UI_SetField34
		add	sp, 6

loc_8A323:
		push	[bp+var_42]

loc_8A326:
		les	bx, [bp+arg_0]

loc_8A329:
		push	large dword ptr	es:[bx+12h]

loc_8A32E:
		call	UI_SetField36

loc_8A333:
		add	sp, 6

loc_8A336:
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_82+2],	dx
		mov	word ptr [bp+var_82], ax
		or	ax, dx
		jz	short loc_8A37B
		lea	ax, [bp+var_46]
		push	ax
		push	0A96h
		push	dx
		push	word ptr [bp+var_82]
		call	String_ConstructFromPtr
		add	sp, 8
		les	bx, [bp+var_82]
		mov	word ptr es:[bx], 0AEFh
		mov	dx, word ptr [bp+var_82+2]
		mov	ax, word ptr [bp+var_82]
		jmp	short loc_8A382
; ���������������������������������������������������������������������������

loc_8A37B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+453j
		mov	dx, word ptr [bp+var_82+2]
		mov	ax, word ptr [bp+var_82]

loc_8A382:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+479j
		mov	word ptr [bp+var_7E+2],	dx
		mov	word ptr [bp+var_7E], ax
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8A+2],	dx
		mov	word ptr [bp+var_8A], ax
		or	ax, dx
		jz	short loc_8A3CF
		lea	ax, [bp+var_4A]
		push	ax
		push	0A98h
		push	dx
		push	word ptr [bp+var_8A]
		call	String_ConstructFromPtr
		add	sp, 8
		les	bx, [bp+var_8A]
		mov	word ptr es:[bx], 0AEFh
		mov	dx, word ptr [bp+var_8A+2]
		mov	ax, word ptr [bp+var_8A]
		jmp	short loc_8A3D7
; ���������������������������������������������������������������������������

loc_8A3CF:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+4A6j
		mov	dx, word ptr [bp+var_8A+2]
		mov	ax, word ptr [bp+var_8A]

loc_8A3D7:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+4CDj
		mov	word ptr [bp+var_86+2],	dx
		mov	word ptr [bp+var_86], ax
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_8A3F3:
		mov	word ptr [bp+var_92+2],	dx

loc_8A3F7:
		mov	word ptr [bp+var_92], ax
		or	ax, dx
		jz	short loc_8A426
		lea	ax, [bp+var_4E]

loc_8A402:
		push	ax

loc_8A403:
		push	0A9Ah

loc_8A406:
		push	dx

loc_8A407:
		push	word ptr [bp+var_92]

loc_8A40B:
		call	String_ConstructFromPtr
		add	sp, 8

loc_8A413:
		les	bx, [bp+var_92]
		mov	word ptr es:[bx], 0AEFh
		mov	dx, word ptr [bp+var_92+2]
		mov	ax, word ptr [bp+var_92]
		jmp	short loc_8A42E
; ���������������������������������������������������������������������������

loc_8A426:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+4FDj
		mov	dx, word ptr [bp+var_92+2]
		mov	ax, word ptr [bp+var_92]

loc_8A42E:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+524j
		mov	word ptr [bp+var_8E+2],	dx
		mov	word ptr [bp+var_8E], ax
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_9A+2],	dx
		mov	word ptr [bp+var_9A], ax
		or	ax, dx
		jz	short loc_8A47D
		lea	ax, [bp+var_52]
		push	ax
		push	0A9Ch
		push	dx
		push	word ptr [bp+var_9A]
		call	String_ConstructFromPtr
		add	sp, 8
		les	bx, [bp+var_9A]
		mov	word ptr es:[bx], 0AEFh
		mov	dx, word ptr [bp+var_9A+2]
		mov	ax, word ptr [bp+var_9A]
		jmp	short loc_8A485
; ���������������������������������������������������������������������������

loc_8A47D:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+554j
		mov	dx, word ptr [bp+var_9A+2]
		mov	ax, word ptr [bp+var_9A]

loc_8A485:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+57Bj
		mov	word ptr [bp+var_96+2],	dx
		mov	word ptr [bp+var_96], ax
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_A2+2],	dx
		mov	word ptr [bp+var_A2], ax
		or	ax, dx
		jz	short loc_8A4D4
		lea	ax, [bp+var_56]
		push	ax
		push	0A9Eh
		push	dx
		push	word ptr [bp+var_A2]
		call	String_ConstructFromPtr
		add	sp, 8
		les	bx, [bp+var_A2]
		mov	word ptr es:[bx], 0AEFh
		mov	dx, word ptr [bp+var_A2+2]
		mov	ax, word ptr [bp+var_A2]
		jmp	short loc_8A4DC
; ���������������������������������������������������������������������������

loc_8A4D4:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+5ABj
		mov	dx, word ptr [bp+var_A2+2]
		mov	ax, word ptr [bp+var_A2]

loc_8A4DC:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+5D2j
		mov	word ptr [bp+var_9E+2],	dx
		mov	word ptr [bp+var_9E], ax
		push	5
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]

loc_8A4EE:
		call	VROOMM_StubThunk_6B4D5
		add	sp, 6

loc_8A4F6:
		or	ax, dx
		jz	short loc_8A562
		push	large [bp+var_7E]
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DF
		add	sp, 8
		push	large [bp+var_86]
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DF
		add	sp, 8

loc_8A523:
		push	large [bp+var_8E]
		les	bx, [bp+arg_0]

loc_8A52B:
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DF
		add	sp, 8
		push	large [bp+var_96]
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DF
		add	sp, 8
		push	large [bp+var_9E]
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+12h]
		call	VROOMM_StubThunk_6B4DF
		add	sp, 8

loc_8A562:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+307j
					; MissionRecord_LoadWithDwordFieldsB_89F00+5F8j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8A56A:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+1B0j
					; MissionRecord_LoadWithDwordFieldsB_89F00+1C5j
		cmp	[bp+var_F], 0
		jz	short loc_8A596
		cmp	[bp+var_14], 0
		jz	short loc_8A596
		push	0
		mov	al, [bp+var_10]
		push	ax
		mov	eax, [bp+var_14]
		mov	[bp+var_28], eax
		lea	ax, [bp+var_28]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8A596:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+66Ej
					; MissionRecord_LoadWithDwordFieldsB_89F00+675j
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		cmp	[bp+var_5], 0
		jz	short loc_8A5D6
		cmp	[bp+var_A], 0
		jz	short loc_8A5D6
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_2C], eax
		lea	ax, [bp+var_2C]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8A5D6:				; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+31j
					; MissionRecord_LoadWithDwordFieldsB_89F00+6AEj ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFieldsB_89F00	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 461 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadWithDwordFields_89850.
; ==============================================================================================
MissionRecord_LoadWithDwordFieldsC_8A5E0	proc far		; CODE XREF: VROOMM_StubThunk_6B3ECJ

var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0

loc_8A5F0:
		jnz	short loc_8A613

loc_8A5F2:
		push	1
		push	0

loc_8A5F6:
		push	2

loc_8A5F8:
		push	large 12h
		push	5C44h

loc_8A5FE:
		call	Memory_TypedFreeWrapper_5C6F3

loc_8A603:
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8A613
		jmp	loc_8A9CA
; ���������������������������������������������������������������������������

loc_8A613:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0:loc_8A5F0j
					; MissionRecord_LoadWithDwordFieldsC_8A5E0+2Ej
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0

loc_8A627:
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B3Fh
		mov	word ptr es:[bx], 0ADFh
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8A6EC
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8A6EC:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+A9j
		push	0

loc_8A6EE:
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8A704
		jmp	loc_8A99E
; ���������������������������������������������������������������������������

loc_8A704:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+11Fj
		cmp	[bp+var_A], 0
		jz	short loc_8A710
		mov	ax, 1
		jmp	short loc_8A712
; ���������������������������������������������������������������������������

loc_8A710:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+129j
		xor	ax, ax

loc_8A712:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+12Ej
		or	ax, ax
		jnz	short loc_8A719
		jmp	loc_8A99E
; ���������������������������������������������������������������������������

loc_8A719:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+134j
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_1E], ax
		push	si

loc_8A724:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8A72A:
		mov	[bp+var_1C], ax
		push	si

loc_8A72E:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8A734:
		mov	[bp+var_1A], ax

loc_8A737:
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_18], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_22], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_20], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_26], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_24], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	di, ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_28], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_30], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_34], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_32], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_38], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_36], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_40], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8A7F1:
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_26]

loc_8A7F7:
		mov	[bp+var_44], ax
		mov	ax, [bp+var_24]

loc_8A7FD:
		mov	[bp+var_42], ax
		push	41h ; 'A'

loc_8A802:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		push	word ptr [bx+11h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	dx, [bp+var_44]

loc_8A821:
		add	dx, ax
		mov	[bp+var_44], dx

loc_8A826:
		push	2
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B46B
		add	sp, 6
		or	ax, dx
		jnz	short loc_8A83B
		jmp	loc_8A996
; ���������������������������������������������������������������������������

loc_8A83B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+256j
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B44D
		add	sp, 0Ch
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B457
		add	sp, 0Eh
		mov	word ptr [bp+var_48+2],	dx
		mov	word ptr [bp+var_48], ax
		push	large 0
		push	dx
		push	ax
		call	UI_SetCallback
		add	sp, 8
		push	large 7D0h
		push	large [bp+var_48]
		call	UI_SetField2E
		add	sp, 8
		push	di
		push	large [bp+var_48]
		call	UI_SetField32
		add	sp, 6
		mov	ax, [bp+var_2A]
		mov	[bp+var_4A], ax
		mov	[bp+var_4C], di
		movsx	eax, [bp+var_4C]
		shl	eax, 8
		mov	[bp+var_50], eax
		movsx	eax, [bp+var_4A]
		shl	eax, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	edx, eax
		mov	ecx, [bp+var_50]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		lea	ax, [bp+var_5C]
		push	ax

loc_8A8F1:
		push	large [bp+var_48]

loc_8A8F5:
		call	UI_SetField38
		add	sp, 6

loc_8A8FD:
		push	[bp+var_28]

loc_8A900:
		push	large [bp+var_48]
		call	UI_SetField34
		add	sp, 6
		push	[bp+var_2C]
		push	large [bp+var_48]
		call	UI_SetField36
		add	sp, 6
		push	5
		push	large [bp+var_48]

loc_8A921:
		call	VROOMM_StubThunk_6B4D5
		add	sp, 6
		or	ax, dx
		jz	short loc_8A996
		push	1
		lea	ax, [bp+var_30]
		push	ax
		push	0AA0h
		push	large [bp+var_48]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah
		push	1
		lea	ax, [bp+var_34]
		push	ax
		push	0AA3h
		push	large [bp+var_48]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah
		push	1
		lea	ax, [bp+var_38]
		push	ax
		push	0AA6h
		push	large [bp+var_48]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah
		push	1
		lea	ax, [bp+var_3C]
		push	ax
		push	0AA9h
		push	large [bp+var_48]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah
		push	1
		lea	ax, [bp+var_40]
		push	ax
		push	0AACh
		push	large [bp+var_48]
		call	VROOMM_StubThunk_6B4DA
		add	sp, 0Ah

loc_8A996:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+258j
					; MissionRecord_LoadWithDwordFieldsC_8A5E0+34Bj
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8A99E:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+121j
					; MissionRecord_LoadWithDwordFieldsC_8A5E0+136j
		cmp	[bp+var_5], 0
		jz	short loc_8A9CA
		cmp	[bp+var_A], 0
		jz	short loc_8A9CA
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8A9CA:				; CODE XREF: MissionRecord_LoadWithDwordFieldsC_8A5E0+30j
					; MissionRecord_LoadWithDwordFieldsC_8A5E0+3C2j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFieldsC_8A5E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 202 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadWithDwordFields_89850.
; ==============================================================================================
MissionRecord_LoadWithDwordFieldsD_8A9D4	proc far		; CODE XREF: VROOMM_StubThunk_6B3F1J

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8AA06
		push	1
		push	0
		push	2
		push	large 0Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8AA06
		jmp	loc_8AB89
; ���������������������������������������������������������������������������

loc_8AA06:				; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+Fj
					; MissionRecord_LoadWithDwordFieldsD_8A9D4+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0

loc_8AA23:
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0ACFh
		mov	ax, 1209h
		mov	bx, 5650h

loc_8AA33:
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8AA8F
		jmp	loc_8AB5D
; ���������������������������������������������������������������������������

loc_8AA8F:				; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+B6j
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		cmp	[bp+var_A], 0
		jz	short loc_8AADC
		mov	ax, 1
		jmp	short loc_8AADE
; ���������������������������������������������������������������������������

loc_8AADC:				; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+101j
		xor	ax, ax

loc_8AADE:				; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+106j
		or	ax, ax
		jz	short loc_8AB5D
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h

loc_8AAEF:
		call	Memory_TypedAllocDispatchB_5C832

loc_8AAF4:
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8AB02:
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0

loc_8AB0C:
		push	1

loc_8AB0E:
		push	large [bp+arg_0]

loc_8AB12:
		call	VROOMM_StubThunk_6B46B

loc_8AB17:
		add	sp, 6
		or	ax, dx
		jz	short loc_8AB45
		push	ds
		les	bx, [bp+arg_0]

loc_8AB22:
		mov	ax, es:[bx+2]

loc_8AB26:
		add	ax, 5
		push	ax
		lea	ax, [bp+var_1E]

loc_8AB2D:
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B461
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax

loc_8AB45:				; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+148j
		cmp	[bp+var_1A], 0
		jz	short loc_8AB5D
		les	bx, [bp+var_1A]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8AB5D:				; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+B8j
					; MissionRecord_LoadWithDwordFieldsD_8A9D4+10Cj ...
		cmp	[bp+var_5], 0
		jz	short loc_8AB89
		cmp	[bp+var_A], 0
		jz	short loc_8AB89
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8AB89:				; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+2Fj
					; MissionRecord_LoadWithDwordFieldsD_8A9D4+18Dj ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFieldsD_8A9D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 196 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadWithDwordFields_89850.
; ==============================================================================================
MissionRecord_LoadWithDwordFieldsE_8AB92	proc far		; CODE XREF: VROOMM_StubThunk_6B3F6J

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8ABC4
		push	1
		push	0
		push	2
		push	large 0Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8ABC4
		jmp	loc_8AD47
; ���������������������������������������������������������������������������

loc_8ABC4:				; CODE XREF: MissionRecord_LoadWithDwordFieldsE_8AB92+Fj
					; MissionRecord_LoadWithDwordFieldsE_8AB92+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0ABFh
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h

loc_8ABF5:
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]

loc_8ABFE:
		mov	byte ptr es:[bx+0Dh], 0

loc_8AC03:
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2

loc_8AC0F:
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8AC4D
		jmp	loc_8AD1B
; ���������������������������������������������������������������������������

loc_8AC4D:				; CODE XREF: MissionRecord_LoadWithDwordFieldsE_8AB92+B6j
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		cmp	[bp+var_A], 0
		jz	short loc_8AC9A
		mov	ax, 1
		jmp	short loc_8AC9C
; ���������������������������������������������������������������������������

loc_8AC9A:				; CODE XREF: MissionRecord_LoadWithDwordFieldsE_8AB92+101j
		xor	ax, ax

loc_8AC9C:				; CODE XREF: MissionRecord_LoadWithDwordFieldsE_8AB92+106j
		or	ax, ax
		jz	short loc_8AD1B
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		push	1
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B46B
		add	sp, 6
		or	ax, dx
		jz	short loc_8AD03
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]

loc_8ACF4:
		push	bx

loc_8ACF5:
		call	VROOMM_StubThunk_6B461

loc_8ACFA:
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx

loc_8AD00:
		mov	word ptr [bp+var_1A], ax

loc_8AD03:				; CODE XREF: MissionRecord_LoadWithDwordFieldsE_8AB92+148j
		cmp	[bp+var_1A], 0
		jz	short loc_8AD1B

loc_8AD0A:
		les	bx, [bp+var_1A]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8AD1B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsE_8AB92+B8j
					; MissionRecord_LoadWithDwordFieldsE_8AB92+10Cj ...
		cmp	[bp+var_5], 0
		jz	short loc_8AD47
		cmp	[bp+var_A], 0
		jz	short loc_8AD47
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8AD47:				; CODE XREF: MissionRecord_LoadWithDwordFieldsE_8AB92+2Fj
					; MissionRecord_LoadWithDwordFieldsE_8AB92+18Dj ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFieldsE_8AB92	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 198 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadWithDwordFields_89850.
; ==============================================================================================
MissionRecord_LoadWithDwordFieldsF_8AD50	proc far		; CODE XREF: VROOMM_StubThunk_6B3FBJ

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8AD82
		push	1
		push	0
		push	2
		push	large 0Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8AD82
		jmp	loc_8AF05
; ���������������������������������������������������������������������������

loc_8AD82:				; CODE XREF: MissionRecord_LoadWithDwordFieldsF_8AD50+Fj
					; MissionRecord_LoadWithDwordFieldsF_8AD50+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0AAFh
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_8ADF1:
		or	ax, ax

loc_8ADF3:
		push	0
		push	large 50414853h
		push	si

loc_8ADFC:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_8AE04:
		or	ax, ax
		jnz	short loc_8AE0B

loc_8AE08:
		jmp	loc_8AED9
; ���������������������������������������������������������������������������

loc_8AE0B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsF_8AD50+B6j
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h

loc_8AE1E:
		call	Memory_TypedFreeWrapper_5C6F3

loc_8AE23:
		add	sp, 0Ch

loc_8AE26:
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		cmp	[bp+var_A], 0
		jz	short loc_8AE58
		mov	ax, 1
		jmp	short loc_8AE5A
; ���������������������������������������������������������������������������

loc_8AE58:				; CODE XREF: MissionRecord_LoadWithDwordFieldsF_8AD50+101j
		xor	ax, ax

loc_8AE5A:				; CODE XREF: MissionRecord_LoadWithDwordFieldsF_8AD50+106j
		or	ax, ax
		jz	short loc_8AED9
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		push	1
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B46B
		add	sp, 6
		or	ax, dx
		jz	short loc_8AEC1
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B461
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax

loc_8AEC1:				; CODE XREF: MissionRecord_LoadWithDwordFieldsF_8AD50+148j
		cmp	[bp+var_1A], 0
		jz	short loc_8AED9
		les	bx, [bp+var_1A]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8AED9:				; CODE XREF: MissionRecord_LoadWithDwordFieldsF_8AD50:loc_8AE08j
					; MissionRecord_LoadWithDwordFieldsF_8AD50+10Cj ...
		cmp	[bp+var_5], 0
		jz	short loc_8AF05
		cmp	[bp+var_A], 0
		jz	short loc_8AF05
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8AF03:
		jmp	short $+2

loc_8AF05:				; CODE XREF: MissionRecord_LoadWithDwordFieldsF_8AD50+2Fj
					; MissionRecord_LoadWithDwordFieldsF_8AD50+18Dj ...
		mov	dx, word ptr [bp+arg_0+2]

loc_8AF08:
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFieldsF_8AD50	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin puis Memory_TypedFree_5C7B6 — premier d'une famille de 8 fonctions
; similaires de libération de champ.
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8AF0E	proc far		; CODE XREF: VROOMM_StubThunk_6B3D8J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_8AF11:
		sub	sp, 4
		push	si

loc_8AF15:
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8AF56
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0AAFh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx

loc_8AF2D:
		call	VROOMM_StubThunk_6B470

loc_8AF32:
		add	sp, 6

loc_8AF35:
		test	si, 1
		jz	short loc_8AF56
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8AF56:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8AF0E+Fj
					; MissionRecordField_ReleaseViaThunk_8AF0E+2Bj
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8AF0E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseViaThunk_8AF0E.
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8AF59	proc far		; CODE XREF: VROOMM_StubThunk_6B3D3J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8AFA1
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0ABFh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B470
		add	sp, 6
		test	si, 1
		jz	short loc_8AFA1
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8AFA1:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8AF59+Fj
					; MissionRecordField_ReleaseViaThunk_8AF59+2Bj
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8AF59	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseViaThunk_8AF0E.
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8AFA4	proc far		; CODE XREF: VROOMM_StubThunk_6B3CEJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8AFEC
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0ACFh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B470
		add	sp, 6
		test	si, 1
		jz	short loc_8AFEC
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8AFEC:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8AFA4+Fj
					; MissionRecordField_ReleaseViaThunk_8AFA4+2Bj
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8AFA4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseViaThunk_8AF0E.
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8AFEF	proc far		; CODE XREF: VROOMM_StubThunk_6B3C9J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8B037

loc_8B000:
		les	bx, [bp+arg_0]

loc_8B003:
		mov	word ptr es:[bx], 0ADFh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B470
		add	sp, 6
		test	si, 1
		jz	short loc_8B037
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2

loc_8B028:
		lea	ax, [bp+var_4]
		push	ax

loc_8B02C:
		push	5C44h

loc_8B02F:
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8B037:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8AFEF+Fj
					; MissionRecordField_ReleaseViaThunk_8AFEF+2Bj
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8AFEF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (6 lignes).
; ==============================================================================================
MissionRecordField_Helper_8B03A	proc far		; CODE XREF: VROOMM_StubThunk_6B3C4J
		push	bp
		mov	bp, sp
		pop	bp
		retf
MissionRecordField_Helper_8B03A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseViaThunk_8AF0E.
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8B03F	proc far		; CODE XREF: VROOMM_StubThunk_6B3BFJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8B087
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0AFFh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B470
		add	sp, 6
		test	si, 1
		jz	short loc_8B087
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8B087:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8B03F+Fj
					; MissionRecordField_ReleaseViaThunk_8B03F+2Bj
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8B03F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseViaThunk_8AF0E.
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8B08A	proc far		; CODE XREF: VROOMM_StubThunk_6B3BAJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8B0D2
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B0Fh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B470
		add	sp, 6
		test	si, 1
		jz	short loc_8B0D2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8B0D2:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8B08A+Fj
					; MissionRecordField_ReleaseViaThunk_8B08A+2Bj
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8B08A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseViaThunk_8AF0E.
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8B0D5	proc far		; CODE XREF: VROOMM_StubThunk_6B3B5J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8B11D
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B1Fh
		push	0

loc_8B0F0:
		push	word ptr [bp+arg_0+2]

loc_8B0F3:
		push	bx

loc_8B0F4:
		call	VROOMM_StubThunk_6B470

loc_8B0F9:
		add	sp, 6

loc_8B0FC:
		test	si, 1

loc_8B100:
		jz	short loc_8B11D

loc_8B102:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8B11D:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8B0D5+Fj
					; MissionRecordField_ReleaseViaThunk_8B0D5:loc_8B100j
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8B0D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseViaThunk_8AF0E (dernier de la série).
; ==============================================================================================
MissionRecordField_ReleaseViaThunk_8B120	proc far		; CODE XREF: VROOMM_StubThunk_6B3B0J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_8B121:
		mov	bp, sp

loc_8B123:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]

loc_8B12A:
		cmp	[bp+arg_0], 0

loc_8B12F:
		jz	short loc_8B162
		push	0

loc_8B133:
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B470
		add	sp, 6
		test	si, 1
		jz	short loc_8B162
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8B162:				; CODE XREF: MissionRecordField_ReleaseViaThunk_8B120:loc_8B12Fj
					; MissionRecordField_ReleaseViaThunk_8B120+23j
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunk_8B120	endp

ovr254		ends
