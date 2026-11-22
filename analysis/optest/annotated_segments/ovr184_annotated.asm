ovr184		segment	para public 'OVERLAY' use16
		assume cs:ovr184
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Remet la partie à zéro (argent, pertes, pilotes [+2A3h] = 1,
; drapeaux [+1FDh] = 0, [+0EDh] = [+0EEh] = 0…).
; ==============================================================================================
Gameflow_InitNewGame_4A140	proc far		; CODE XREF: sub_41F1FJ sub_4A239+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0ECh], 1
		mov	byte ptr [si+0EDh], 0
		mov	byte ptr [si+0EEh], 0
		mov	byte ptr [si+35Bh], 0
		xor	di, di
		jmp	short loc_4A190
; ���������������������������������������������������������������������������

loc_4A160:				; CODE XREF: Gameflow_InitNewGame_4A140+53j
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+2EEh]
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 28Bh
		push	dx
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A3h], 1
		inc	di

loc_4A190:				; CODE XREF: Gameflow_InitNewGame_4A140+1Ej
		cmp	di, 8
		jl	short loc_4A160
		mov	byte ptr [si+0FAh], 0
		mov	byte ptr [si+0F9h], 0FFh
		mov	byte ptr [si+0FBh], 0FFh
		mov	byte ptr [si+0FCh], 0FFh
		xor	di, di
		jmp	short loc_4A1B5
; ���������������������������������������������������������������������������

loc_4A1AD:				; CODE XREF: Gameflow_InitNewGame_4A140+79j
		mov	bx, di
		mov	byte ptr [bx+si+0FDh], 0
		inc	di

loc_4A1B5:				; CODE XREF: Gameflow_InitNewGame_4A140+6Bj
		cmp	di, 0FFh
		jl	short loc_4A1AD
		xor	di, di
		jmp	short loc_4A1C7
; ���������������������������������������������������������������������������

loc_4A1BF:				; CODE XREF: Gameflow_InitNewGame_4A140+8Aj
		mov	bx, di
		mov	byte ptr [bx+si+1FDh], 0
		inc	di

loc_4A1C7:				; CODE XREF: Gameflow_InitNewGame_4A140+7Dj
		cmp	di, 64h	; 'd'
		jl	short loc_4A1BF
		xor	di, di
		jmp	short loc_4A1DB
; ���������������������������������������������������������������������������

loc_4A1D0:				; CODE XREF: Gameflow_InitNewGame_4A140+9Ej
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+261h], 0
		inc	di

loc_4A1DB:				; CODE XREF: Gameflow_InitNewGame_4A140+8Ej
		cmp	di, 9
		jl	short loc_4A1D0
		xor	di, di
		jmp	short loc_4A1F7
; ���������������������������������������������������������������������������

loc_4A1E4:				; CODE XREF: Gameflow_InitNewGame_4A140+BAj
		mov	bx, di
		shl	bx, 1
		mov	byte ptr [bx+si+274h], 0
		mov	bx, di
		shl	bx, 1
		mov	byte ptr [bx+si+273h], 0FFh
		inc	di

loc_4A1F7:				; CODE XREF: Gameflow_InitNewGame_4A140+A2j
		cmp	di, 4
		jl	short loc_4A1E4
		mov	dword ptr [si+27Bh], 0
		mov	dword ptr [si+27Fh], 0
		mov	dword ptr [si+283h], 0
		mov	dword ptr [si+287h], 0
		mov	dword ptr [si+3D8h], 0
		mov	word ptr [si+3D4h], 0
		mov	word ptr [si+0EAh], 0
		pop	di
		pop	si
		pop	bp
		retf
Gameflow_InitNewGame_4A140	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4A239	proc far		; CODE XREF: sub_41F24J

var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Gameflow_InitNewGame_4A140
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[si+0E4h], ax
		mov	al, [bp+arg_8]
		mov	[si+0FAh], al
		mov	byte ptr [si+0E7h], 0
		mov	byte ptr [si+0E8h], 0
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aGameflow ; "gameflow"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	5F1h
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	5FAh
		mov	ax, si
		add	ax, 398h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	602h
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_2], 0
		xor	di, di
		jmp	loc_4A40C
; ���������������������������������������������������������������������������

loc_4A2BB:				; CODE XREF: sub_4A239+1D8j
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx], 2Dh ; '-'
		jz	short loc_4A2CE
		jmp	loc_4A40B
; ���������������������������������������������������������������������������

loc_4A2CE:				; CODE XREF: sub_4A239+90j
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx+1], 2Eh ; '.'
		jz	short loc_4A2E2
		jmp	loc_4A40B
; ���������������������������������������������������������������������������

loc_4A2E2:				; CODE XREF: sub_4A239+A4j
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		push	word ptr [bx]
		call	CRT_Strdup
		add	sp, 2
		mov	[bp+var_2], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		mov	al, [bx+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		sub	ax, 43h	; 'C'
		mov	bx, ax
		cmp	bx, 13h		; switch 20 cases
		jbe	short loc_4A31D
		jmp	loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A31D:				; CODE XREF: sub_4A239+DFj
		shl	bx, 1
		jmp	cs:off_4A418[bx] ; switch jump

loc_4A324:				; DATA XREF: ovr184:off_4A418o
		mov	byte ptr [si+0E7h], 1 ;	case 0xE
		jmp	loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A32C:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		mov	byte ptr [si+0E7h], 2 ;	case 0xB
		jmp	loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A334:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		mov	byte ptr [si+0E8h], 1 ;	case 0xA
		jmp	loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A33C:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		mov	byte ptr [si+0ECh], 0 ;	case 0x9
		jmp	loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A344:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		mov	ax, [bp+var_2]	; case 0x3
		add	ax, 3
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2Eh ; '.'
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0
		jnz	short loc_4A37D
		push	3A53h
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_4A37D:				; CODE XREF: sub_4A239+133j
		push	ds
		push	offset unk_4362B
		push	ss
		lea	ax, [bp+var_5A]
		push	ax
		push	ds
		push	offset unk_4362A
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A39A:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		mov	ax, [bp+var_2]	; case 0x10
		add	ax, 3
		mov	[bp+var_4], ax
		push	[bp+var_4]
		call	sub_1CBD
		add	sp, 2
		mov	[si+0FAh], al
		jmp	short loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A3B4:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		push	0		; case 0x0
		call	sub_4268A
		add	sp, 2
		jmp	short loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A3C0:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		mov	ax, [bp+var_2]	; case 0x1
		add	ax, 3
		mov	[bp+var_6], ax
		push	[bp+var_6]
		call	sub_1CBD
		add	sp, 2
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Gameflow_PlayMidgame_4ABE0
		add	sp, 4
		jmp	short loc_4A400	; default
; ���������������������������������������������������������������������������

loc_4A3E0:				; CODE XREF: sub_4A239+E6j
					; DATA XREF: ovr184:off_4A418o
		mov	ax, [bp+var_2]	; case 0x13
		add	ax, 3
		mov	[bp+var_8], ax
		push	[bp+var_8]
		call	sub_1CBD
		add	sp, 2
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Gameflow_PlayConversation_4AAAB
		add	sp, 4
		jmp	short $+2

loc_4A400:				; CODE XREF: sub_4A239+E1j
					; sub_4A239+E6j ...
		push	[bp+var_2]	; default
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2

loc_4A40B:				; CODE XREF: sub_4A239+92j
					; sub_4A239+A6j
		inc	di

loc_4A40C:				; CODE XREF: sub_4A239+7Fj
		cmp	di, [bp+arg_4]
		jge	short loc_4A414
		jmp	loc_4A2BB
; ���������������������������������������������������������������������������

loc_4A414:				; CODE XREF: sub_4A239+1D6j
		pop	di
		pop	si
		leave
		retf
sub_4A239	endp

; ���������������������������������������������������������������������������
off_4A418	dw offset loc_4A3B4	; DATA XREF: sub_4A239+E6r
		dw offset loc_4A3C0	; jump table for switch	statement
		dw offset loc_4A400
		dw offset loc_4A344
		dw offset loc_4A400
		dw offset loc_4A400
		dw offset loc_4A400
		dw offset loc_4A400
		dw offset loc_4A400
		dw offset loc_4A33C
		dw offset loc_4A334
		dw offset loc_4A32C
		dw offset loc_4A400
		dw offset loc_4A400
		dw offset loc_4A324
		dw offset loc_4A400
		dw offset loc_4A39A
		dw offset loc_4A400
		dw offset loc_4A400
		dw offset loc_4A3E0

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Lit dans GAMEFLOW.IFF la FORM MISS de la mission
; [partie+0FAh] (INFO, EFCT) : script en partie+7, longueur partie+6.
; ==============================================================================================
Gameflow_LoadMissionScript_4A440	proc far		; CODE XREF: sub_41F29J

var_AA		= word ptr -0AAh
var_4D		= dword	ptr -4Dh
var_49		= dword	ptr -49h
var_45		= dword	ptr -45h
var_3D		= dword	ptr -3Dh
var_38		= byte ptr -38h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0AAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_AA], 556h
		mov	[bp+var_49], 100h
		mov	[bp+var_4D], 0
		mov	[bp+var_AA], 56Eh
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_30], ax
		movsx	eax, ax
		mov	[bp+var_45], eax
		push	1
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_3C491
		add	sp, 2
		mov	[bp+var_1], 0
		jmp	loc_4A5A8
; ���������������������������������������������������������������������������

loc_4A4B2:				; CODE XREF: Gameflow_LoadMissionScript_4A440+195j
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		add	sp, 2
		or	ax, ax
		jnz	short loc_4A4C6
		jmp	loc_4A59B
; ���������������������������������������������������������������������������

loc_4A4C6:				; CODE XREF: Gameflow_LoadMissionScript_4A440+81j
		mov	eax, [bp+var_3D]
		cmp	eax, dword_4362C
		jnz	short loc_4A4D6
		mov	ax, 1
		jmp	short loc_4A4D8
; ���������������������������������������������������������������������������

loc_4A4D6:				; CODE XREF: Gameflow_LoadMissionScript_4A440+8Fj
		xor	ax, ax

loc_4A4D8:				; CODE XREF: Gameflow_LoadMissionScript_4A440+94j
		or	ax, ax
		jnz	short loc_4A4DF
		jmp	loc_4A59B
; ���������������������������������������������������������������������������

loc_4A4DF:				; CODE XREF: Gameflow_LoadMissionScript_4A440+9Aj
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4A57F
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	dl, [si+0FAh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_4A575
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		push	0
		push	large 54434645h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4A56F
		mov	al, [bp+var_38]
		mov	[si+6],	al
		cmp	byte ptr [si+6], 3Ch ; '<'
		jbe	short loc_4A54D
		mov	byte ptr [si+6], 3Ch ; '<'

loc_4A54D:				; CODE XREF: Gameflow_LoadMissionScript_4A440+107j
		xor	di, di
		jmp	short loc_4A564
; ���������������������������������������������������������������������������

loc_4A551:				; CODE XREF: Gameflow_LoadMissionScript_4A440+12Bj
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	bx, di
		mov	[bx+si+7], al
		inc	di

loc_4A564:				; CODE XREF: Gameflow_LoadMissionScript_4A440+10Fj
		mov	al, [si+6]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_4A551
		jmp	short $+2

loc_4A56F:				; CODE XREF: Gameflow_LoadMissionScript_4A440+FBj
		mov	[bp+var_1], 1
		jmp	short loc_4A5D8
; ���������������������������������������������������������������������������

loc_4A575:				; CODE XREF: Gameflow_LoadMissionScript_4A440+DAj
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		jmp	short loc_4A58C
; ���������������������������������������������������������������������������

loc_4A57F:				; CODE XREF: Gameflow_LoadMissionScript_4A440+C3j
		push	2
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4A58C:				; CODE XREF: Gameflow_LoadMissionScript_4A440+13Dj
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_4A5A8
; ���������������������������������������������������������������������������

loc_4A59B:				; CODE XREF: Gameflow_LoadMissionScript_4A440+83j
					; Gameflow_LoadMissionScript_4A440+9Cj
		push	3
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4A5A8:				; CODE XREF: Gameflow_LoadMissionScript_4A440+6Fj
					; Gameflow_LoadMissionScript_4A440+159j
		cmp	[bp+var_2E], 0
		jnz	short loc_4A5BD
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_4A5D1
; ���������������������������������������������������������������������������

loc_4A5BD:				; CODE XREF: Gameflow_LoadMissionScript_4A440+16Cj
		mov	bx, [bp+var_2E]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_45]
		jg	short loc_4A5CF
		mov	ax, 1
		jmp	short loc_4A5D1
; ���������������������������������������������������������������������������

loc_4A5CF:				; CODE XREF: Gameflow_LoadMissionScript_4A440+188j
		xor	ax, ax

loc_4A5D1:				; CODE XREF: Gameflow_LoadMissionScript_4A440+17Bj
					; Gameflow_LoadMissionScript_4A440+18Dj
		or	ax, ax
		jnz	short loc_4A5D8
		jmp	loc_4A4B2
; ���������������������������������������������������������������������������

loc_4A5D8:				; CODE XREF: Gameflow_LoadMissionScript_4A440+133j
					; Gameflow_LoadMissionScript_4A440+193j
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_AA], 56Eh
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_LoadMissionScript_4A440	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Construit la scène [partie+0FCh] de la mission [partie+0FAh]
; : FORM SCEN (INFO), sprites SPRT (INFO, EFCT, REQU), visibilité par
; Gameflow_CheckSpriteRequirements_3604.
; ==============================================================================================
Gameflow_BuildScene_4A60B	proc far		; CODE XREF: sub_41F2EJ

var_B0		= word ptr -0B0h
var_53		= dword	ptr -53h
var_4F		= dword	ptr -4Fh
var_4B		= dword	ptr -4Bh
var_43		= dword	ptr -43h
var_3E		= byte ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0E9h], 0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_B0], 556h
		mov	[bp+var_4F], 100h
		mov	[bp+var_53], 0
		mov	[bp+var_B0], 56Eh
		mov	[bp+var_34], 0
		xor	ax, ax
		mov	[bp+var_36], ax
		movsx	eax, ax
		mov	[bp+var_4B], eax
		push	si
		call	sub_358C
		add	sp, 2
		push	1
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		mov	bx, [bp+var_B0]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_3C491
		add	sp, 2
		mov	[bp+var_1], 0
		jmp	loc_4A733
; ���������������������������������������������������������������������������

loc_4A68B:				; CODE XREF: Gameflow_BuildScene_4A60B+155j
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		add	sp, 2
		or	ax, ax
		jnz	short loc_4A69F
		jmp	loc_4A726
; ���������������������������������������������������������������������������

loc_4A69F:				; CODE XREF: Gameflow_BuildScene_4A60B+8Fj
		mov	eax, [bp+var_43]
		cmp	eax, dword_43631
		jnz	short loc_4A6AF
		mov	ax, 1
		jmp	short loc_4A6B1
; ���������������������������������������������������������������������������

loc_4A6AF:				; CODE XREF: Gameflow_BuildScene_4A60B+9Dj
		xor	ax, ax

loc_4A6B1:				; CODE XREF: Gameflow_BuildScene_4A60B+A2j
		or	ax, ax
		jz	short loc_4A726
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4A70A
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	dl, [si+0FAh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_4A700
		mov	[bp+var_1], 1
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4A763
; ���������������������������������������������������������������������������

loc_4A700:				; CODE XREF: Gameflow_BuildScene_4A60B+E5j
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4A717
; ���������������������������������������������������������������������������

loc_4A70A:				; CODE XREF: Gameflow_BuildScene_4A60B+CEj
		push	5
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4A717:				; CODE XREF: Gameflow_BuildScene_4A60B+FDj
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_4A733
; ���������������������������������������������������������������������������

loc_4A726:				; CODE XREF: Gameflow_BuildScene_4A60B+91j
					; Gameflow_BuildScene_4A60B+A8j
		push	6
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4A733:				; CODE XREF: Gameflow_BuildScene_4A60B+7Dj
					; Gameflow_BuildScene_4A60B+119j
		cmp	[bp+var_34], 0
		jnz	short loc_4A748
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_4A75C
; ���������������������������������������������������������������������������

loc_4A748:				; CODE XREF: Gameflow_BuildScene_4A60B+12Cj
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_4A75A
		mov	ax, 1
		jmp	short loc_4A75C
; ���������������������������������������������������������������������������

loc_4A75A:				; CODE XREF: Gameflow_BuildScene_4A60B+148j
		xor	ax, ax

loc_4A75C:				; CODE XREF: Gameflow_BuildScene_4A60B+13Bj
					; Gameflow_BuildScene_4A60B+14Dj
		or	ax, ax
		jnz	short loc_4A763
		jmp	loc_4A68B
; ���������������������������������������������������������������������������

loc_4A763:				; CODE XREF: Gameflow_BuildScene_4A60B+F3j
					; Gameflow_BuildScene_4A60B+153j
		cmp	[bp+var_1], 0
		jnz	short loc_4A76C
		jmp	loc_4AA78
; ���������������������������������������������������������������������������

loc_4A76C:				; CODE XREF: Gameflow_BuildScene_4A60B+15Cj
		mov	[bp+var_2], 0
		jmp	loc_4A816
; ���������������������������������������������������������������������������

loc_4A773:				; CODE XREF: Gameflow_BuildScene_4A60B+238j
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		add	sp, 2
		or	ax, ax
		jnz	short loc_4A787
		jmp	loc_4A80E
; ���������������������������������������������������������������������������

loc_4A787:				; CODE XREF: Gameflow_BuildScene_4A60B+177j
		mov	eax, [bp+var_43]
		cmp	eax, dword_43636
		jnz	short loc_4A797
		mov	ax, 1
		jmp	short loc_4A799
; ���������������������������������������������������������������������������

loc_4A797:				; CODE XREF: Gameflow_BuildScene_4A60B+185j
		xor	ax, ax

loc_4A799:				; CODE XREF: Gameflow_BuildScene_4A60B+18Aj
		or	ax, ax
		jz	short loc_4A80E
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4A7F2
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	dl, [si+0FCh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_4A7E8
		mov	[bp+var_2], 1
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4A846
; ���������������������������������������������������������������������������

loc_4A7E8:				; CODE XREF: Gameflow_BuildScene_4A60B+1CDj
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4A7FF
; ���������������������������������������������������������������������������

loc_4A7F2:				; CODE XREF: Gameflow_BuildScene_4A60B+1B6j
		push	7
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4A7FF:				; CODE XREF: Gameflow_BuildScene_4A60B+1E5j
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_4A816
; ���������������������������������������������������������������������������

loc_4A80E:				; CODE XREF: Gameflow_BuildScene_4A60B+179j
					; Gameflow_BuildScene_4A60B+190j
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax

loc_4A816:				; CODE XREF: Gameflow_BuildScene_4A60B+165j
					; Gameflow_BuildScene_4A60B+201j
		cmp	[bp+var_34], 0
		jnz	short loc_4A82B
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_4A83F
; ���������������������������������������������������������������������������

loc_4A82B:				; CODE XREF: Gameflow_BuildScene_4A60B+20Fj
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_4A83D
		mov	ax, 1
		jmp	short loc_4A83F
; ���������������������������������������������������������������������������

loc_4A83D:				; CODE XREF: Gameflow_BuildScene_4A60B+22Bj
		xor	ax, ax

loc_4A83F:				; CODE XREF: Gameflow_BuildScene_4A60B+21Ej
					; Gameflow_BuildScene_4A60B+230j
		or	ax, ax
		jnz	short loc_4A846
		jmp	loc_4A773
; ���������������������������������������������������������������������������

loc_4A846:				; CODE XREF: Gameflow_BuildScene_4A60B+1DBj
					; Gameflow_BuildScene_4A60B+236j
		cmp	[bp+var_2], 0
		jnz	short loc_4A84F
		jmp	loc_4AA78
; ���������������������������������������������������������������������������

loc_4A84F:				; CODE XREF: Gameflow_BuildScene_4A60B+23Fj
		jmp	loc_4AA48
; ���������������������������������������������������������������������������

loc_4A852:				; CODE XREF: Gameflow_BuildScene_4A60B+46Aj
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		add	sp, 2
		or	ax, ax
		jnz	short loc_4A866
		jmp	loc_4AA0A
; ���������������������������������������������������������������������������

loc_4A866:				; CODE XREF: Gameflow_BuildScene_4A60B+256j
		mov	eax, [bp+var_43]
		cmp	eax, dword_4363B
		jnz	short loc_4A876
		mov	ax, 1
		jmp	short loc_4A878
; ���������������������������������������������������������������������������

loc_4A876:				; CODE XREF: Gameflow_BuildScene_4A60B+264j
		xor	ax, ax

loc_4A878:				; CODE XREF: Gameflow_BuildScene_4A60B+269j
		or	ax, ax
		jnz	short loc_4A87F
		jmp	loc_4AA0A
; ���������������������������������������������������������������������������

loc_4A87F:				; CODE XREF: Gameflow_BuildScene_4A60B+26Fj
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_3C491
		add	sp, 2
		mov	[bp+var_4], 0
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4A8C3
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_3], al
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4A8D0
; ���������������������������������������������������������������������������

loc_4A8C3:				; CODE XREF: Gameflow_BuildScene_4A60B+29Cj
		push	8
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4A8D0:				; CODE XREF: Gameflow_BuildScene_4A60B+2B6j
		push	0
		push	large 55514552h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4A95C
		mov	al, [bp+var_3E]
		mov	[bp+var_5], al
		mov	al, [bp+var_5]
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_8], ax
		xor	di, di
		jmp	short loc_4A919
; ���������������������������������������������������������������������������

loc_4A904:				; CODE XREF: Gameflow_BuildScene_4A60B+315j
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	bx, [bp+var_8]
		add	bx, di
		mov	[bx], al
		inc	di

loc_4A919:				; CODE XREF: Gameflow_BuildScene_4A60B+2F7j
		mov	al, [bp+var_5]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_4A904
		push	[bp+var_8]
		mov	al, [bp+var_5]
		push	ax
		push	si
		call	Gameflow_CheckSpriteRequirements_3604
		add	sp, 6
		or	al, al
		jz	short loc_4A947
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_34F6
		add	sp, 4
		mov	[bp+var_4], 1

loc_4A947:				; CODE XREF: Gameflow_BuildScene_4A60B+329j
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		push	[bp+var_8]
		call	sub_308
		add	sp, 2
		jmp	short loc_4A96D
; ���������������������������������������������������������������������������

loc_4A95C:				; CODE XREF: Gameflow_BuildScene_4A60B+2DCj
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_34F6
		add	sp, 4
		mov	[bp+var_4], 1

loc_4A96D:				; CODE XREF: Gameflow_BuildScene_4A60B+34Fj
		cmp	[bp+var_4], 0
		jnz	short loc_4A976
		jmp	loc_4A9FB
; ���������������������������������������������������������������������������

loc_4A976:				; CODE XREF: Gameflow_BuildScene_4A60B+366j
		push	0
		push	large 54434645h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4A9EE
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	Gameflow_FindSprite_35C9
		add	sp, 4
		mov	[bp-6],	ax
		mov	bx, [bp-6]
		mov	al, [bp+var_3E]
		mov	[bx+7],	al
		mov	byte ptr [bp+var_8+1], al
		mov	al, byte ptr [bp+var_8+1]
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	bx, [bp-6]
		mov	[bx+5],	ax
		xor	di, di
		jmp	short loc_4A9DB
; ���������������������������������������������������������������������������

loc_4A9C3:				; CODE XREF: Gameflow_BuildScene_4A60B+3D7j
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	bx, [bp-6]
		mov	bx, [bx+5]
		add	bx, di
		mov	[bx], al
		inc	di

loc_4A9DB:				; CODE XREF: Gameflow_BuildScene_4A60B+3B6j
		mov	al, byte ptr [bp+var_8+1]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_4A9C3
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4A9FB
; ���������������������������������������������������������������������������

loc_4A9EE:				; CODE XREF: Gameflow_BuildScene_4A60B+382j
		push	9
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4A9FB:				; CODE XREF: Gameflow_BuildScene_4A60B+368j
					; Gameflow_BuildScene_4A60B+3E1j
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_4AA48
; ���������������������������������������������������������������������������

loc_4AA0A:				; CODE XREF: Gameflow_BuildScene_4A60B+258j
					; Gameflow_BuildScene_4A60B+271j
		mov	eax, [bp+var_43]
		cmp	eax, dword_43640
		jnz	short loc_4AA1A
		mov	ax, 1
		jmp	short loc_4AA1C
; ���������������������������������������������������������������������������

loc_4AA1A:				; CODE XREF: Gameflow_BuildScene_4A60B+408j
		xor	ax, ax

loc_4AA1C:				; CODE XREF: Gameflow_BuildScene_4A60B+40Dj
		or	ax, ax
		jz	short loc_4AA3B
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[si+0E9h], al
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_4AA48
; ���������������������������������������������������������������������������

loc_4AA3B:				; CODE XREF: Gameflow_BuildScene_4A60B+413j
		push	0Ah
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4AA48:				; CODE XREF: Gameflow_BuildScene_4A60B:loc_4A84Fj
					; Gameflow_BuildScene_4A60B+3FDj ...
		cmp	[bp+var_34], 0
		jnz	short loc_4AA5D
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_4AA71
; ���������������������������������������������������������������������������

loc_4AA5D:				; CODE XREF: Gameflow_BuildScene_4A60B+441j
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_4AA6F
		mov	ax, 1
		jmp	short loc_4AA71
; ���������������������������������������������������������������������������

loc_4AA6F:				; CODE XREF: Gameflow_BuildScene_4A60B+45Dj
		xor	ax, ax

loc_4AA71:				; CODE XREF: Gameflow_BuildScene_4A60B+450j
					; Gameflow_BuildScene_4A60B+462j
		or	ax, ax
		jnz	short loc_4AA78
		jmp	loc_4A852
; ���������������������������������������������������������������������������

loc_4AA78:				; CODE XREF: Gameflow_BuildScene_4A60B+15Ej
					; Gameflow_BuildScene_4A60B+241j ...
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B0], 56Eh
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_BuildScene_4A60B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Joue la conversation numéro arg_2 (entrée de CONV.PAK) : bloc de 5 mots
; = (partie+398h nom, +3ACh prénom, +3C0h indicatif, [+0EAh] avions perdus pendant la mission,
; [+3D4h] total perdu), tampon partie+35Bh ; Conv_Construct_59B67 puis Conv_PlayScript_5AA4E.
; ==============================================================================================
Gameflow_PlayConversation_4AAAB	proc far		; CODE XREF: sub_41F33J sub_4A239+1BFp

var_78		= word ptr -78h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	byte_48A28, al
		mov	ax, si
		add	ax, 398h
		mov	[bp+var_A], ax
		mov	ax, si
		add	ax, 3ACh
		mov	[bp+var_8], ax
		mov	ax, si
		add	ax, 3C0h
		mov	[bp+var_6], ax
		mov	ax, [si+0EAh]
		mov	[bp+var_4], ax
		mov	ax, [si+3D4h]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 35Bh
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	sub_4222B
		add	sp, 8
		call	TextScrollDisplayB_ApplyHelperD_3F784
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	sub_42235
		add	sp, 2
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	2
		lea	ax, [bp+var_78]
		push	ax
		call	sub_42230
		add	sp, 4
		pop	si
		leave
		retf
Gameflow_PlayConversation_4AAAB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4AB39	proc far		; CODE XREF: sub_41F3DJ sub_4AB79+49p

var_14		= word ptr -14h
var_D		= byte ptr -0Dh
arg_0		= word ptr  6

; FUNCTION CHUNK AT 0A37 SIZE 00000002 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	large 0FFFFFFFFh
		push	large 7
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	[bp+arg_0]
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	[bp+var_D], 0
		lea	ax, [bp+var_14]
		push	ax
		push	word_433F2
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_4AB73
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short locret_4AB77
; ���������������������������������������������������������������������������

loc_4AB73:				; CODE XREF: sub_4AB39+32j
		mov	al, 0
		leave
		retf
sub_4AB39	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_4AB39

locret_4AB77:				; CODE XREF: sub_4AB39+38j
		leave
		retf
; END OF FUNCTION CHUNK	FOR sub_4AB39

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4AB79	proc far		; CODE XREF: sub_41F42J

var_6A		= word ptr -6Ah
var_D		= dword	ptr -0Dh
var_9		= dword	ptr -9
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_6A], 556h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 693h
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_4AB39
		add	sp, 2
		mov	[bp+var_3], al
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	al, [bp+var_3]
		leave
		retf
sub_4AB79	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en partie 2026-10-22. Aiguillage des cinématiques (36 cas) : appelle la fonction de
; cinématique avec (partie+3ACh prénom, +398h nom, +3C0h indicatif), ses arg_6 / arg_8 /
; arg_10.
; ==============================================================================================
Gameflow_PlayMidgame_4ABE0	proc far		; CODE XREF: sub_41F38J sub_4A239+19Fp

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		call	Music_Stop_28CDB
		add	sp, 2
		mov	al, [bp+arg_2]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 23h	; '#'   ; switch 36 cases
		jbe	short loc_4AC01
		jmp	loc_4AD2B	; default
; ���������������������������������������������������������������������������

loc_4AC01:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+1Cj
		shl	bx, 1
		jmp	cs:off_4AD3E[bx] ; switch jump

loc_4AC08:				; DATA XREF: ovr184:off_4AD3Eo
		call	sub_423B5	; case 0x0
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC10:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0x1
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	sub_42410
		add	sp, 6
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC2D:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		call	sub_42440	; case 0x2
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC35:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0x4
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	sub_42470
		add	sp, 6
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC52:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0xB
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	sub_424A0
		add	sp, 6
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC6F:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		call	sub_424D0	; case 0xD
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC77:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0xE
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	sub_42500
		add	sp, 6
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC94:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		call	sub_42530	; case 0xF
		jmp	loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AC9C:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0x10
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	sub_42560
		add	sp, 6
		jmp	short loc_4AD2D
; ���������������������������������������������������������������������������

loc_4ACB8:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0x13
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	sub_42590
		add	sp, 6
		jmp	short loc_4AD2D
; ���������������������������������������������������������������������������

loc_4ACD4:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		jmp	short loc_4AD2D	; case 0x14
; ���������������������������������������������������������������������������

loc_4ACD6:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		jmp	short loc_4AD2D	; case 0x1E
; ���������������������������������������������������������������������������

loc_4ACD8:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0x20
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	sub_425C0
		add	sp, 6
		jmp	short loc_4AD2D
; ���������������������������������������������������������������������������

loc_4ACF4:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		call	sub_425F0	; case 0x21
		jmp	short loc_4AD2D
; ���������������������������������������������������������������������������

loc_4ACFB:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ovr184:off_4AD3Eo
		mov	ax, si		; case 0x23
		add	ax, 3C0h
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	far ptr	sub_42620
		add	sp, 6
		push	0
		call	sub_4268A
		add	sp, 2
		mov	byte ptr [si+0E8h], 0
		mov	byte ptr [si+0E7h], 2
		jmp	short loc_4AD2D
; ���������������������������������������������������������������������������

loc_4AD2B:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+1Ej
					; Gameflow_PlayMidgame_4ABE0+23j
					; DATA XREF: ...
		jmp	short $+2	; default

loc_4AD2D:				; CODE XREF: Gameflow_PlayMidgame_4ABE0+2Dj
					; Gameflow_PlayMidgame_4ABE0+4Aj ...
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		pop	si
		pop	bp
		retf
Gameflow_PlayMidgame_4ABE0	endp

; ���������������������������������������������������������������������������
off_4AD3E	dw offset loc_4AC08	; DATA XREF: Gameflow_PlayMidgame_4ABE0+23r
		dw offset loc_4AC10	; jump table for switch	statement
		dw offset loc_4AC2D
		dw offset loc_4AD2B
		dw offset loc_4AC35
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AC52
		dw offset loc_4AD2B
		dw offset loc_4AC6F
		dw offset loc_4AC77
		dw offset loc_4AC94
		dw offset loc_4AC9C
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4ACB8
		dw offset loc_4ACD4
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4AD2B
		dw offset loc_4ACD6
		dw offset loc_4AD2B
		dw offset loc_4ACD8
		dw offset loc_4ACF4
		dw offset loc_4AD2B
		dw offset loc_4ACFB

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Commande 08h : joue le plan fixe numéro arg dans OPTIONS.IFF
; (FORM ESTB / SHOT : SHPS, PALS, TUNE).
; ==============================================================================================
Gameflow_PlayShot_4AD86	proc far		; CODE XREF: sub_41F47J

var_254		= word ptr -254h
var_252		= word ptr -252h
var_250		= word ptr -250h
var_24E		= word ptr -24Eh
var_24C		= word ptr -24Ch
var_24A		= word ptr -24Ah
var_246		= word ptr -246h
var_224		= word ptr -224h
var_1C7		= dword	ptr -1C7h
var_1C3		= dword	ptr -1C3h
var_1BF		= dword	ptr -1BFh
var_1B7		= dword	ptr -1B7h
var_1AE		= dword	ptr -1AEh
var_1AA		= word ptr -1AAh
var_1A8		= word ptr -1A8h
var_17C		= word ptr -17Ch
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= word ptr -176h
var_174		= word ptr -174h
var_172		= word ptr -172h
var_16E		= word ptr -16Eh
var_F6		= word ptr -0F6h
var_7E		= word ptr -7Eh
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2B		= dword	ptr -2Bh
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 254h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_495FC
		mov	ah, 0
		or	ax, ax
		jz	short loc_4AD9E
		jmp	loc_4B532
; ���������������������������������������������������������������������������

loc_4AD9E:				; CODE XREF: Gameflow_PlayShot_4AD86+13j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_7E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_0 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_7E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	ax, word_46F46
		mov	[bp+var_A], ax
		mov	[bp+var_17C], 0
		mov	[bp+var_17A], 0
		push	[bp+var_A]
		lea	ax, [bp+var_17C]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_178], 0
		mov	[bp+var_176], 18h
		mov	[bp+var_174], 13Fh
		mov	[bp+var_172], 97h ; '�'
		lea	ax, [bp+var_224]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_224], 556h
		mov	[bp+var_1C3], 100h
		mov	[bp+var_1C7], 0
		mov	[bp+var_224], 56Eh
		mov	[bp+var_1A8], 0
		xor	ax, ax
		mov	[bp+var_1AA], ax
		movsx	eax, ax
		mov	[bp+var_1BF], eax
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aOptions	; "options"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_7E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_224]
		push	ax
		mov	bx, [bp+var_224]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 42545345h
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		mov	[bp+var_B], 0
		jmp	short loc_4AEF8
; ���������������������������������������������������������������������������

loc_4AEB6:				; CODE XREF: Gameflow_PlayShot_4AD86+189j
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_1E], al
		mov	al, [bp+var_1E]
		cmp	al, [bp+arg_2]
		jnz	short loc_4AEEB
		mov	[bp+var_B], 1
		jmp	short loc_4AF11
; ���������������������������������������������������������������������������
		jmp	short loc_4AEF8
; ���������������������������������������������������������������������������

loc_4AEEB:				; CODE XREF: Gameflow_PlayShot_4AD86+15Bj
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_4AEF8:				; CODE XREF: Gameflow_PlayShot_4AD86+12Ej
					; Gameflow_PlayShot_4AD86+163j
		push	1
		push	large 544F4853h
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_4AEB6

loc_4AF11:				; CODE XREF: Gameflow_PlayShot_4AD86+161j
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AF27
		push	64h ; 'd'
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4AF27:				; CODE XREF: Gameflow_PlayShot_4AD86+192j
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_1], al
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1BF], eax
		lea	ax, [bp+var_17C]
		push	ax
		push	0
		push	0Fh
		lea	ax, [bp+var_246]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_E], 0
		push	0
		push	large 454E5554h
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4AF9F
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[si+0E9h], al
		mov	al, [si+0E9h]
		mov	ah, 0
		push	ax
		call	Music_SetGameflowMood_28C73
		add	sp, 2
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1BF], eax

loc_4AF9F:				; CODE XREF: Gameflow_PlayShot_4AD86+1EDj
		push	0
		push	large 53504853h
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_4AFBB
		jmp	loc_4B1CE
; ���������������������������������������������������������������������������

loc_4AFBB:				; CODE XREF: Gameflow_PlayShot_4AD86+230j
		jmp	loc_4B199
; ���������������������������������������������������������������������������

loc_4AFBE:				; CODE XREF: Gameflow_PlayShot_4AD86+443j
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_3C431
		add	sp, 2
		mov	eax, [bp+var_1B7]
		cmp	eax, dword_43645
		jnz	short loc_4AFDC
		mov	ax, 1
		jmp	short loc_4AFDE
; ���������������������������������������������������������������������������

loc_4AFDC:				; CODE XREF: Gameflow_PlayShot_4AD86+24Fj
		xor	ax, ax

loc_4AFDE:				; CODE XREF: Gameflow_PlayShot_4AD86+254j
		or	ax, ax
		jnz	short loc_4AFE5
		jmp	loc_4B0AA
; ���������������������������������������������������������������������������

loc_4AFE5:				; CODE XREF: Gameflow_PlayShot_4AD86+25Aj
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_4], ax
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_6], ax
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_8], ax
		mov	[bp+var_2B+3], 0

loc_4B01D:				; DATA XREF: Render_MeshPrimitive_283D0+729o
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	3
		lea	ax, [bp+var_2B+3]
		push	ax
		push	[bp+var_4]
		lea	ax, [bp+var_F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	[bp+var_8]
		push	[bp+var_6]
		lea	ax, [bp+var_2B+3]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		mov	[bp+var_23], 0
		mov	byte ptr [di+16h], 1
		push	di
		lea	ax, [bp+var_246]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_4B093
		cmp	[bp+var_2B+3], 0
		jz	short loc_4B093
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_2B+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4B093:				; CODE XREF: Gameflow_PlayShot_4AD86+2EDj
					; Gameflow_PlayShot_4AD86+2F4j
		mov	[bp+var_2B+3], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		jmp	loc_4B18F
; ���������������������������������������������������������������������������

loc_4B0AA:				; CODE XREF: Gameflow_PlayShot_4AD86+25Cj
		mov	eax, [bp+var_1B7]
		cmp	eax, dword_4364A
		jnz	short loc_4B0BB
		mov	ax, 1
		jmp	short loc_4B0BD
; ���������������������������������������������������������������������������

loc_4B0BB:				; CODE XREF: Gameflow_PlayShot_4AD86+32Ej
		xor	ax, ax

loc_4B0BD:				; CODE XREF: Gameflow_PlayShot_4AD86+333j
		or	ax, ax
		jnz	short loc_4B0C4
		jmp	loc_4B18F
; ���������������������������������������������������������������������������

loc_4B0C4:				; CODE XREF: Gameflow_PlayShot_4AD86+339j
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_4], ax
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_6], ax
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_8], ax
		mov	[bp+var_2B+3], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	3
		lea	ax, [bp+var_2B+3]
		push	ax
		push	[bp+var_4]
		lea	ax, [bp+var_F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	[bp+var_8]
		push	[bp+var_6]
		lea	ax, [bp+var_2B+3]
		push	ax
		push	0
		call	TriggeredAnimLayer_Construct_B068
		add	sp, 0Ah
		mov	di, ax
		mov	[bp+var_23], 0
		mov	byte ptr [di+16h], 1
		push	di
		lea	ax, [bp+var_246]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	byte ptr [di+1Dh], 1
		mov	[bp+var_E], di
		cmp	[bp+var_23], 0
		jz	short loc_4B17B
		cmp	[bp+var_2B+3], 0
		jz	short loc_4B17B
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_2B+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4B17B:				; CODE XREF: Gameflow_PlayShot_4AD86+3D5j
					; Gameflow_PlayShot_4AD86+3DCj
		mov	[bp+var_2B+3], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0

loc_4B18F:				; CODE XREF: Gameflow_PlayShot_4AD86+321j
					; Gameflow_PlayShot_4AD86+33Bj
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1BF], eax

loc_4B199:				; CODE XREF: Gameflow_PlayShot_4AD86:loc_4AFBBj
		cmp	[bp+var_1A8], 0
		jnz	short loc_4B1AF
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_4B1C5
; ���������������������������������������������������������������������������

loc_4B1AF:				; CODE XREF: Gameflow_PlayShot_4AD86+418j
		mov	bx, [bp+var_1A8]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BF]
		jg	short loc_4B1C3
		mov	ax, 1
		jmp	short loc_4B1C5
; ���������������������������������������������������������������������������

loc_4B1C3:				; CODE XREF: Gameflow_PlayShot_4AD86+436j
		xor	ax, ax

loc_4B1C5:				; CODE XREF: Gameflow_PlayShot_4AD86+427j
					; Gameflow_PlayShot_4AD86+43Bj
		or	ax, ax
		jnz	short loc_4B1CC
		jmp	loc_4AFBE
; ���������������������������������������������������������������������������

loc_4B1CC:				; CODE XREF: Gameflow_PlayShot_4AD86+441j
		jmp	short loc_4B1DB
; ���������������������������������������������������������������������������

loc_4B1CE:				; CODE XREF: Gameflow_PlayShot_4AD86+232j
		push	0Eh
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4B1DB:				; CODE XREF: Gameflow_PlayShot_4AD86:loc_4B1CCj
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	byte ptr [bp+var_12], 0
		mov	byte ptr [bp+var_12+1],	0
		mov	[bp+var_10], 0
		push	100h
		push	0
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FillRange_2CF08
		add	sp, 8
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	large 534C4150h
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_4B25B
		jmp	loc_4B383
; ���������������������������������������������������������������������������

loc_4B25B:				; CODE XREF: Gameflow_PlayShot_4AD86+4D0j
		jmp	loc_4B34E
; ���������������������������������������������������������������������������

loc_4B25E:				; CODE XREF: Gameflow_PlayShot_4AD86+5F8j
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_3C431
		add	sp, 2
		mov	eax, [bp+var_1B7]
		cmp	eax, dword_4364F
		jnz	short loc_4B27C
		mov	ax, 1
		jmp	short loc_4B27E
; ���������������������������������������������������������������������������

loc_4B27C:				; CODE XREF: Gameflow_PlayShot_4AD86+4EFj
		xor	ax, ax

loc_4B27E:				; CODE XREF: Gameflow_PlayShot_4AD86+4F4j
		or	ax, ax
		jnz	short loc_4B285
		jmp	loc_4B337
; ���������������������������������������������������������������������������

loc_4B285:				; CODE XREF: Gameflow_PlayShot_4AD86+4FAj
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_4], ax
		mov	[bp+var_2B+3], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2B+3]
		push	ax
		push	[bp+var_4]
		lea	ax, [bp+var_16E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_2B], 0
		lea	ax, [bp+var_2B+3]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_2E]
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_4B321
		cmp	[bp+var_2B+3], 0
		jz	short loc_4B321
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_2B+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4B321:				; CODE XREF: Gameflow_PlayShot_4AD86+57Bj
					; Gameflow_PlayShot_4AD86+582j
		mov	[bp+var_2B+3], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		jmp	short loc_4B344
; ���������������������������������������������������������������������������

loc_4B337:				; CODE XREF: Gameflow_PlayShot_4AD86+4FCj
		push	0Fh
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4B344:				; CODE XREF: Gameflow_PlayShot_4AD86+5AFj
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1BF], eax

loc_4B34E:				; CODE XREF: Gameflow_PlayShot_4AD86:loc_4B25Bj
		cmp	[bp+var_1A8], 0
		jnz	short loc_4B364
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_4B37A
; ���������������������������������������������������������������������������

loc_4B364:				; CODE XREF: Gameflow_PlayShot_4AD86+5CDj
		mov	bx, [bp+var_1A8]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BF]
		jg	short loc_4B378
		mov	ax, 1
		jmp	short loc_4B37A
; ���������������������������������������������������������������������������

loc_4B378:				; CODE XREF: Gameflow_PlayShot_4AD86+5EBj
		xor	ax, ax

loc_4B37A:				; CODE XREF: Gameflow_PlayShot_4AD86+5DCj
					; Gameflow_PlayShot_4AD86+5F0j
		or	ax, ax
		jnz	short loc_4B381
		jmp	loc_4B25E
; ���������������������������������������������������������������������������

loc_4B381:				; CODE XREF: Gameflow_PlayShot_4AD86+5F6j
		jmp	short loc_4B390
; ���������������������������������������������������������������������������

loc_4B383:				; CODE XREF: Gameflow_PlayShot_4AD86+4D2j
		push	10h
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4B390:				; CODE XREF: Gameflow_PlayShot_4AD86:loc_4B381j
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		mov	[bp+var_254], 0
		mov	[bp+var_252], 0
		mov	[bp+var_250], 0
		mov	[bp+var_24E], 0
		mov	[bp+var_24C], 13Fh
		mov	[bp+var_24A], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_254]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_254]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	0
		lea	ax, [bp+var_254]
		push	ax
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		call	Input_Flush_CDDC
		lea	ax, [bp+var_246]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		mov	[bp+var_1D], 0
		jmp	short loc_4B43B
; ���������������������������������������������������������������������������

loc_4B41F:				; CODE XREF: Gameflow_PlayShot_4AD86+6C4j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_4B42E
		mov	[bp+var_1D], 1
		jmp	short loc_4B44C
; ���������������������������������������������������������������������������

loc_4B42E:				; CODE XREF: Gameflow_PlayShot_4AD86+6A0j
		lea	ax, [bp+var_246]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_4B43B:				; CODE XREF: Gameflow_PlayShot_4AD86+697j
		push	[bp+var_E]
		call	sub_B0F6
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_4B41F

loc_4B44C:				; CODE XREF: Gameflow_PlayShot_4AD86+6A6j
		mov	al, [bp+var_1D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4B4A0
		xor	eax, eax
		mov	[bp+var_22], eax
		mov	dword ptr [bp+var_26], eax
		mov	al, [bp+var_1]
		mov	ah, 0
		movsx	eax, ax
		mov	[bp+var_2B+1], eax
		mov	eax, [bp+var_2B+1]
		mov	[bp+var_22], eax
		mov	eax, dword_47ABB
		mov	[bp-26h], eax
		lea	ax, [bp+var_26]
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah

loc_4B4A0:				; CODE XREF: Gameflow_PlayShot_4AD86+6CDj
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_254]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	0
		lea	ax, [bp+var_246]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		mov	[bp+var_224], 56Eh
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_224]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		lea	ax, [bp+var_17C]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_16E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_F6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_4B532:				; CODE XREF: Gameflow_PlayShot_4AD86+15j
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_PlayShot_4AD86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Si [partie+0ECh] : lit misn2op.iff (compte rendu écrit par STRIKE.EXE)
; : EXIT (code de sortie, renvoyé ; 5 = rien d'autre), recharge tmpsav.tmp, INFO (nom de
; mission), WPNS (armes restantes → [+261h]), JETS (avions perdus → [+0EAh], total [+3D4h],
; coût ×500 → [+287h]), STAT (succès, gain ajouté à l'argent [+27Bh], 3e valeur → [+3D6h]),
; KILL (par pilote, deux compteurs → [+29Fh]/[+2A1h] du pilote ; [+0EDh] = 1 si le joueur en
; a), DIED (noms de la table dseg 0ED8h → drapeau dseg 0EE6h = 0), SCOR (ajouté à [+3D8h]) ;
; puis dans GAMEFLOW MLST/DATA l'index de la mission → [+1FDh+index] = 1 si succès, 2 sinon ;
; argent −= coût des avions. [+0F9h] = FFh. GAMEFLOW_SYSTEM.md § 6.
; ==============================================================================================
Gameflow_ReadMissionResult_4B544	proc far		; CODE XREF: sub_41F4CJ

var_132		= word ptr -132h
var_D5		= dword	ptr -0D5h
var_D1		= dword	ptr -0D1h
var_CD		= dword	ptr -0CDh
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_8A		= word ptr -8Ah
var_3A		= word ptr -3Ah
var_2F		= byte ptr -2Fh
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_20		= word ptr -20h
var_1E		= byte ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_C		= word ptr -0Ch
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 132h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 1
		lea	ax, [bp+var_C]
		push	ax
		call	sub_C7A3
		add	sp, 2
		lea	ax, [bp+var_16]
		push	ax
		call	sub_C7A3
		add	sp, 2
		mov	[bp+var_1A], 0FFFFh
		cmp	byte ptr [si+0ECh], 0
		jnz	short loc_4B57B
		jmp	loc_4BB8A
; ���������������������������������������������������������������������������

loc_4B57B:				; CODE XREF: Gameflow_ReadMissionResult_4B544+32j
		lea	ax, [bp+var_132]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_132], 556h
		mov	[bp+var_D1], 100h
		mov	[bp+var_D5], 0
		mov	[bp+var_132], 56Eh
		mov	[bp+var_B6], 0
		xor	ax, ax
		mov	[bp+var_B8], ax
		movsx	eax, ax
		mov	[bp+var_CD], eax
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMisn2op	; "misn2op"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_8A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		mov	bx, [bp+var_132]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4E564E49h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		lea	ax, [bp+var_132]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large 54495845h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4B63F
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_4B63F:				; CODE XREF: Gameflow_ReadMissionResult_4B544+DFj
		cmp	[bp+var_2], 5
		jnz	short loc_4B648
		jmp	loc_4BB68
; ���������������������������������������������������������������������������

loc_4B648:				; CODE XREF: Gameflow_ReadMissionResult_4B544+FFj
		push	ds
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aTmpsav	; "tmpsav"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_8A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_8A]
		push	ax
		push	si
		call	sub_41FB2
		add	sp, 4
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4B6AF
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strupr
		add	sp, 2
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_4B6AF:				; CODE XREF: Gameflow_ReadMissionResult_4B544+142j
		mov	[bp+var_20], 0
		jmp	short loc_4B6C4
; ���������������������������������������������������������������������������

loc_4B6B6:				; CODE XREF: Gameflow_ReadMissionResult_4B544+184j
		mov	bx, [bp+var_20]
		shl	bx, 1
		mov	word ptr [bx+si+261h], 0
		inc	[bp+var_20]

loc_4B6C4:				; CODE XREF: Gameflow_ReadMissionResult_4B544+170j
		cmp	[bp+var_20], 9
		jl	short loc_4B6B6
		push	0
		push	large 534E5057h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_4B6E6
		jmp	loc_4B789
; ���������������������������������������������������������������������������

loc_4B6E6:				; CODE XREF: Gameflow_ReadMissionResult_4B544+19Dj
		jmp	short loc_4B746
; ���������������������������������������������������������������������������

loc_4B6E8:				; CODE XREF: Gameflow_ReadMissionResult_4B544+238j
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2E], ax
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	[bp+var_2F], 0
		xor	di, di
		jmp	short loc_4B730
; ���������������������������������������������������������������������������

loc_4B711:				; CODE XREF: Gameflow_ReadMissionResult_4B544+1EFj
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+2C8h]
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_4B72F
		mov	[bp+var_2F], 1
		jmp	short loc_4B735
; ���������������������������������������������������������������������������

loc_4B72F:				; CODE XREF: Gameflow_ReadMissionResult_4B544+1E3j
		inc	di

loc_4B730:				; CODE XREF: Gameflow_ReadMissionResult_4B544+1CBj
		cmp	di, 9
		jl	short loc_4B711

loc_4B735:				; CODE XREF: Gameflow_ReadMissionResult_4B544+1E9j
		cmp	[bp+var_2F], 0
		jz	short loc_4B746
		mov	bx, di
		shl	bx, 1
		mov	ax, [bp+var_2E]
		mov	[bx+si+261h], ax

loc_4B746:				; CODE XREF: Gameflow_ReadMissionResult_4B544:loc_4B6E6j
					; Gameflow_ReadMissionResult_4B544+1F5j
		test	word ptr [bp+var_C0], 1
		jz	short loc_4B765
		mov	eax, [bp+var_BC]
		dec	eax
		cmp	eax, [bp+var_CD]
		jnz	short loc_4B763
		inc	[bp+var_CD]
		jmp	short $+2

loc_4B763:				; CODE XREF: Gameflow_ReadMissionResult_4B544+216j
		jmp	short $+2

loc_4B765:				; CODE XREF: Gameflow_ReadMissionResult_4B544+208j
		mov	eax, [bp+var_CD]
		cmp	eax, [bp+var_BC]
		jl	short loc_4B776
		mov	ax, 1
		jmp	short loc_4B778
; ���������������������������������������������������������������������������

loc_4B776:				; CODE XREF: Gameflow_ReadMissionResult_4B544+22Bj
		xor	ax, ax

loc_4B778:				; CODE XREF: Gameflow_ReadMissionResult_4B544+230j
		or	ax, ax
		jnz	short loc_4B77F
		jmp	loc_4B6E8
; ���������������������������������������������������������������������������

loc_4B77F:				; CODE XREF: Gameflow_ReadMissionResult_4B544+236j
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_4B789:				; CODE XREF: Gameflow_ReadMissionResult_4B544+19Fj
		mov	word ptr [si+0EAh], 0
		push	0
		push	large 5354454Ah
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4B7DD
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+0EAh], ax
		mov	ax, [si+0EAh]
		add	[si+3D4h], ax
		mov	ax, [si+0EAh]
		mov	dx, 1F4h
		imul	dx
		movzx	eax, ax
		mov	[si+287h], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_4B7DD:				; CODE XREF: Gameflow_ReadMissionResult_4B544+262j
		push	0
		push	large 54415453h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4B833
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_18], ax
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_1C], ax
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[si+3D6h], al
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax
		jmp	short loc_4B840
; ���������������������������������������������������������������������������

loc_4B833:				; CODE XREF: Gameflow_ReadMissionResult_4B544+2B0j
		push	1Ch
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4B840:				; CODE XREF: Gameflow_ReadMissionResult_4B544+2EDj
		movzx	eax, [bp+var_1C]
		add	[si+27Bh], eax
		push	0
		push	large 4C4C494Bh
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_4B866
		jmp	loc_4B958
; ���������������������������������������������������������������������������

loc_4B866:				; CODE XREF: Gameflow_ReadMissionResult_4B544+31Dj
		jmp	loc_4B915
; ���������������������������������������������������������������������������

loc_4B869:				; CODE XREF: Gameflow_ReadMissionResult_4B544+407j
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2E], ax
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp-30h], ax
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_C7A3
		add	sp, 2
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_3A]
		push	ax
		call	CRT_Strupr
		add	sp, 2
		xor	di, di
		jmp	short loc_4B910
; ���������������������������������������������������������������������������

loc_4B8B6:				; CODE XREF: Gameflow_ReadMissionResult_4B544+3CFj
		push	8
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 28Bh
		push	dx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_27D3
		add	sp, 6
		or	ax, ax
		jnz	short loc_4B90F
		or	di, di
		jnz	short loc_4B8ED
		cmp	[bp+var_2E], 0
		jnz	short loc_4B8E8
		cmp	word ptr [bp-30h], 0
		jz	short loc_4B8ED

loc_4B8E8:				; CODE XREF: Gameflow_ReadMissionResult_4B544+39Cj
		mov	byte ptr [si+0EDh], 1

loc_4B8ED:				; CODE XREF: Gameflow_ReadMissionResult_4B544+396j
					; Gameflow_ReadMissionResult_4B544+3A2j
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, [bp+var_2E]
		mov	bx, ax
		add	[bx+si+29Fh], dx
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	dx, [bp-30h]
		mov	bx, ax
		add	[bx+si+2A1h], dx
		jmp	short loc_4B915
; ���������������������������������������������������������������������������

loc_4B90F:				; CODE XREF: Gameflow_ReadMissionResult_4B544+392j
		inc	di

loc_4B910:				; CODE XREF: Gameflow_ReadMissionResult_4B544+370j
		cmp	di, 8
		jl	short loc_4B8B6

loc_4B915:				; CODE XREF: Gameflow_ReadMissionResult_4B544:loc_4B866j
					; Gameflow_ReadMissionResult_4B544+3C9j
		test	word ptr [bp+var_C0], 1
		jz	short loc_4B934
		mov	eax, [bp+var_BC]
		dec	eax
		cmp	eax, [bp+var_CD]
		jnz	short loc_4B932
		inc	[bp+var_CD]
		jmp	short $+2

loc_4B932:				; CODE XREF: Gameflow_ReadMissionResult_4B544+3E5j
		jmp	short $+2

loc_4B934:				; CODE XREF: Gameflow_ReadMissionResult_4B544+3D7j
		mov	eax, [bp+var_CD]
		cmp	eax, [bp+var_BC]
		jl	short loc_4B945
		mov	ax, 1
		jmp	short loc_4B947
; ���������������������������������������������������������������������������

loc_4B945:				; CODE XREF: Gameflow_ReadMissionResult_4B544+3FAj
		xor	ax, ax

loc_4B947:				; CODE XREF: Gameflow_ReadMissionResult_4B544+3FFj
		or	ax, ax
		jnz	short loc_4B94E
		jmp	loc_4B869
; ���������������������������������������������������������������������������

loc_4B94E:				; CODE XREF: Gameflow_ReadMissionResult_4B544+405j
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_4B958:				; CODE XREF: Gameflow_ReadMissionResult_4B544+31Fj
		push	634h
		mov	ax, si
		add	ax, 0EFh ; '�'
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0
		push	large 44454944h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4B9F3
		mov	eax, [bp+var_C0]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	byte ptr [bp+var_2E+1],	al
		mov	word ptr [bp-30h], 0
		jmp	short loc_4B9DF
; ���������������������������������������������������������������������������

loc_4B99C:				; CODE XREF: Gameflow_ReadMissionResult_4B544+4A3j
		lea	ax, [bp+var_132]
		push	ax
		mov	ax, si
		add	ax, 0EFh ; '�'
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		xor	di, di
		jmp	short loc_4B9D7
; ���������������������������������������������������������������������������

loc_4B9B3:				; CODE XREF: Gameflow_ReadMissionResult_4B544+496j
		push	8
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+0ED8h]
		mov	ax, si
		add	ax, 0EFh ; '�'
		push	ax
		call	sub_2836
		add	sp, 6
		or	ax, ax
		jnz	short loc_4B9D6
		mov	byte ptr [di+0EE6h], 0
		jmp	short loc_4B9DC
; ���������������������������������������������������������������������������

loc_4B9D6:				; CODE XREF: Gameflow_ReadMissionResult_4B544+489j
		inc	di

loc_4B9D7:				; CODE XREF: Gameflow_ReadMissionResult_4B544+46Dj
		cmp	di, 7
		jl	short loc_4B9B3

loc_4B9DC:				; CODE XREF: Gameflow_ReadMissionResult_4B544+490j
		inc	word ptr [bp-30h]

loc_4B9DF:				; CODE XREF: Gameflow_ReadMissionResult_4B544+456j
		mov	al, byte ptr [bp+var_2E+1]
		mov	ah, 0
		cmp	ax, [bp-30h]
		jg	short loc_4B99C
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_4B9F3:				; CODE XREF: Gameflow_ReadMissionResult_4B544+43Cj
		push	0
		push	large 524F4353h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4BA31
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		add	[si+3D8h], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_CD], eax

loc_4BA31:				; CODE XREF: Gameflow_ReadMissionResult_4B544+4C6j
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	1
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		mov	bx, [bp+var_132]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_4BA7B
		push	1Fh
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4BA7B:				; CODE XREF: Gameflow_ReadMissionResult_4B544+528j
		push	0
		push	large 41544144h
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_4BAA1
		push	20h ; ' '
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4BAA1:				; CODE XREF: Gameflow_ReadMissionResult_4B544+54Ej
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_C7A3
		add	sp, 2
		mov	[bp+var_2C], 0
		jmp	short loc_4BAF0
; ���������������������������������������������������������������������������

loc_4BAB4:				; CODE XREF: Gameflow_ReadMissionResult_4B544+5E0j
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Strupr
		add	sp, 2
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_4BAED
		mov	ax, [bp+var_2C]
		mov	[bp+var_1A], ax
		jmp	short loc_4BB26
; ���������������������������������������������������������������������������

loc_4BAED:				; CODE XREF: Gameflow_ReadMissionResult_4B544+59Fj
		inc	[bp+var_2C]

loc_4BAF0:				; CODE XREF: Gameflow_ReadMissionResult_4B544+56Ej
		test	word ptr [bp+var_C0], 1
		jz	short loc_4BB0F
		mov	eax, [bp+var_BC]
		dec	eax
		cmp	eax, [bp+var_CD]
		jnz	short loc_4BB0D
		inc	[bp+var_CD]
		jmp	short $+2

loc_4BB0D:				; CODE XREF: Gameflow_ReadMissionResult_4B544+5C0j
		jmp	short $+2

loc_4BB0F:				; CODE XREF: Gameflow_ReadMissionResult_4B544+5B2j
		mov	eax, [bp+var_CD]
		cmp	eax, [bp+var_BC]
		jl	short loc_4BB20
		mov	ax, 1
		jmp	short loc_4BB22
; ���������������������������������������������������������������������������

loc_4BB20:				; CODE XREF: Gameflow_ReadMissionResult_4B544+5D5j
		xor	ax, ax

loc_4BB22:				; CODE XREF: Gameflow_ReadMissionResult_4B544+5DAj
		or	ax, ax
		jz	short loc_4BAB4

loc_4BB26:				; CODE XREF: Gameflow_ReadMissionResult_4B544+5A7j
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		cmp	[bp+var_1A], 0FFFFh
		jnz	short loc_4BB46
		push	21h ; '!'
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4BB46:				; CODE XREF: Gameflow_ReadMissionResult_4B544+5F3j
		cmp	[bp+var_18], 0
		jz	short loc_4BB56
		mov	bx, [bp+var_1A]
		mov	byte ptr [bx+si+1FDh], 1
		jmp	short loc_4BB5E
; ���������������������������������������������������������������������������

loc_4BB56:				; CODE XREF: Gameflow_ReadMissionResult_4B544+606j
		mov	bx, [bp+var_1A]
		mov	byte ptr [bx+si+1FDh], 2

loc_4BB5E:				; CODE XREF: Gameflow_ReadMissionResult_4B544+610j
		mov	eax, [si+287h]
		sub	[si+27Bh], eax

loc_4BB68:				; CODE XREF: Gameflow_ReadMissionResult_4B544+101j
		mov	[bp+var_132], 56Eh
		lea	ax, [bp+var_132]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_132]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_4BB8A:				; CODE XREF: Gameflow_ReadMissionResult_4B544+34j
		mov	byte ptr [si+0F9h], 0FFh
		mov	al, [bp+var_2]
		mov	[bp+var_1E], al
		mov	al, [bp+var_1E]
		pop	di
		pop	si
		leave
		retf
Gameflow_ReadMissionResult_4B544	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Départ en vol (appelée par Gameflow_MainLoop_3D2E si [partie+0F9h] ≠
; FEh) : passe à la mission suivante ([+0FAh] = [+0FBh], posé par la commande 0Dh ; [+0FBh] =
; FFh), retire de l'argent [+27Bh] les frais généraux [+27Fh] et les achats du catalogue
; [+283h] (ajoutés par Gameflow_Catalog_52662), remet [+283h] à 0, puis sauvegarde la partie
; dans tmpsav.tmp (Gameflow_SaveGameFile_4DAE8). GAMEFLOW_SYSTEM.md § 3.
; ==============================================================================================
Gameflow_SaveTmpState_4BBA0	proc far		; CODE XREF: sub_41F51J

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+0FBh]
		mov	[si+0FAh], al
		mov	byte ptr [si+0FBh], 0FFh
		mov	eax, [si+27Fh]
		add	eax, [si+283h]
		sub	[si+27Bh], eax
		mov	dword ptr [si+283h], 0
		push	ds
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aTmpsav	; "tmpsav"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_50]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_50]
		push	ax
		push	si
		call	sub_41FB7
		add	sp, 4
		pop	si
		leave
		retf
Gameflow_SaveTmpState_4BBA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Écrit op2misn.iff pour STRIKE.EXE (chunks MLST, DATA, PRTL ;
; mission [partie+0F9h], équipiers, armement). Chunk TEAM (tag dword_43695) : les noms
; d'équipiers non vides de partie+860, +880, +900 ($W, $L, $O posés par SELECT_WING /
; CHOOSE_WINGMAN), 8 octets chacun complétés par des 0 (CRT_Strncpy_Pad 8) ; STRIKE.EXE les
; met à la place des noms TEAMn de la liste CAST (PLAY_LoadCASTTeamNames_A9956). Chunks SNAM,
; CALL, NAME à côté (tags dword_4368B, dword_43690, dword_43686).
; ==============================================================================================
Gameflow_WriteMissionOrder_4BBF7	proc far		; CODE XREF: sub_41F56J

var_1EC		= word ptr -1ECh
var_18F		= dword	ptr -18Fh
var_18B		= dword	ptr -18Bh
var_187		= dword	ptr -187h
var_176		= dword	ptr -176h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_144		= word ptr -144h
var_E7		= dword	ptr -0E7h
var_E3		= dword	ptr -0E3h
var_DF		= dword	ptr -0DFh
var_CA		= word ptr -0CAh
var_C8		= word ptr -0C8h
var_9C		= word ptr -9Ch
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
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_E		= byte ptr -0Eh
var_C		= word ptr -0Ch
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1ECh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	byte ptr [si+0F9h], 0FEh ; '�'
		jnz	short loc_4BC11
		jmp	loc_4BD7E
; ���������������������������������������������������������������������������

loc_4BC11:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+15j
		lea	ax, [bp+var_1EC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_1EC], 556h
		mov	[bp+var_18B], 100h
		mov	[bp+var_18F], 0
		mov	[bp+var_1EC], 56Eh
		mov	[bp+var_170], 0
		xor	ax, ax
		mov	[bp+var_172], ax
		movsx	eax, ax
		mov	[bp+var_187], eax
		push	1
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		lea	ax, [bp+var_1EC]
		push	ax
		mov	bx, [bp+var_1EC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_4BC8E
		push	22h ; '"'
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4BC8E:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+88j
		push	0
		push	large 41544144h
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_4BCB4
		push	23h ; '#'
		push	5D6h
		call	Fatal_Error_310B
		add	sp, 4

loc_4BCB4:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+AEj
		mov	[bp+var_36], 0
		jmp	short loc_4BCD3
; ���������������������������������������������������������������������������

loc_4BCBB:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+E5j
		push	large 8
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		inc	[bp+var_36]

loc_4BCD3:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+C2j
		mov	al, [si+0F9h]
		mov	ah, 0
		cmp	ax, [bp+var_36]
		jge	short loc_4BCBB
		mov	eax, [bp+var_176]
		mov	[bp+var_187], eax
		push	0
		push	large 4C545250h
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_4BD4D
		mov	[bp+var_2], 1
		mov	[bp+var_36], 0
		jmp	short loc_4BD34
; ���������������������������������������������������������������������������

loc_4BD0C:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+146j
		push	large 8
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_1], al
		inc	[bp+var_36]

loc_4BD34:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+113j
		mov	al, [si+0F9h]
		mov	ah, 0
		cmp	ax, [bp+var_36]
		jge	short loc_4BD0C
		mov	[bp+var_E], 0
		mov	eax, [bp+var_176]
		mov	[bp+var_187], eax

loc_4BD4D:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+108j
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_1EC], 56Eh
		lea	ax, [bp+var_1EC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_1EC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	short loc_4BDA4
; ���������������������������������������������������������������������������

loc_4BD7E:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+17j
		push	635h
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_2], 1
		push	63Dh
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_1], 15h

loc_4BDA4:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+185j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aOp2misn	; "op2misn"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_9C]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_144], 556h
		mov	[bp+var_E3], 100h
		mov	[bp+var_E7], 0
		mov	[bp+var_144], 56Eh
		mov	[bp+var_C8], 0
		xor	ax, ax
		mov	[bp+var_CA], ax
		movsx	eax, ax
		mov	[bp+var_DF], eax
		mov	[bp+var_144], 67Bh
		push	0
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_ReadDispatch_3B57E
		add	sp, 6
		mov	al, 0
		push	large 0
		push	large [dword_43663]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_3C730
		add	sp, 0Ah
		lea	ax, [bp+var_144]
		push	ax
		call	sub_3C7C6
		add	sp, 2
		push	large 0
		push	large [dword_43668]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	large [bp+var_DF]
		push	large 8
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 8
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		push	large 0
		push	large [dword_4366D]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_4BEFC
; ���������������������������������������������������������������������������

loc_4BE96:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+308j
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+si+261h], 0
		jz	short loc_4BEFB
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+261h]
		mov	[bp+var_18], ax
		push	large [bp+var_DF]
		push	large 2
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 2
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+2C8h]
		mov	[bp+var_1A], ds
		mov	[bp+var_1C], ax
		push	large [bp+var_DF]
		push	large 8
		push	[bp+var_1A]
		push	[bp+var_1C]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 8

loc_4BEFB:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+2A8j
		inc	di

loc_4BEFC:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+29Dj
		cmp	di, 9
		jl	short loc_4BE96
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		cmp	byte ptr [si+0EEh], 0
		jnz	short loc_4BF18
		jmp	loc_4C136
; ���������������������������������������������������������������������������

loc_4BF18:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+31Cj
		push	large 0
		push	large [dword_43672]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_3C730
		add	sp, 0Ah
		lea	ax, [bp+var_144]
		push	ax
		call	sub_3C7C6
		add	sp, 2
		push	large 0
		push	large [dword_43677]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_3C730
		add	sp, 0Ah
		lea	ax, [bp+var_144]
		push	ax
		call	sub_3C7C6
		add	sp, 2
		push	large 0
		push	large [dword_4367C]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_4BF7A
; ���������������������������������������������������������������������������

loc_4BF75:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+386j
		mov	byte ptr [bp+di+var_38], 0
		inc	di

loc_4BF7A:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+37Cj
		cmp	di, 4
		jl	short loc_4BF75
		xor	di, di
		jmp	loc_4C04C
; ���������������������������������������������������������������������������

loc_4BF84:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+45Aj
		mov	bx, di
		shl	bx, 1
		cmp	byte ptr [bx+si+273h], 0FFh
		jnz	short loc_4BF92
		jmp	loc_4C04B
; ���������������������������������������������������������������������������

loc_4BF92:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+396j
		mov	al, byte ptr [bp+di+var_38]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4BF9E
		jmp	loc_4C04B
; ���������������������������������������������������������������������������

loc_4BF9E:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+3A2j
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+274h]
		mov	ah, 0
		shl	ax, 1
		mov	[bp+var_44], ax
		mov	ax, di
		inc	ax
		mov	[bp+var_46], ax
		jmp	short loc_4BFE6
; ���������������������������������������������������������������������������

loc_4BFB5:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+3F3j
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+273h]
		mov	bx, [bp+var_46]
		shl	bx, 1
		cmp	al, [bx+si+273h]
		jnz	short loc_4BFE3
		mov	bx, [bp+var_46]
		shl	bx, 1
		mov	al, [bx+si+274h]
		mov	ah, 0
		shl	ax, 1
		add	[bp+var_44], ax
		lea	ax, [bp+var_38]
		mov	bx, [bp+var_46]
		add	bx, ax
		mov	byte ptr [bx], 1

loc_4BFE3:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+3CFj
		inc	[bp+var_46]

loc_4BFE6:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+3BCj
		cmp	[bp+var_46], 4
		jl	short loc_4BFB5
		mov	ax, [bp+var_44]
		mov	[bp+var_48], ax
		push	large [bp+var_DF]
		push	large 2
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 2
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+273h]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	ax, [bx+2C8h]
		mov	[bp+var_4A], ds
		mov	[bp+var_4C], ax
		push	large [bp+var_DF]
		push	large 8
		push	[bp+var_4A]
		push	[bp+var_4C]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 8

loc_4C04B:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+398j
					; Gameflow_WriteMissionOrder_4BBF7+3A4j
		inc	di

loc_4C04C:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+38Aj
		cmp	di, 4
		jge	short loc_4C054
		jmp	loc_4BF84
; ���������������������������������������������������������������������������

loc_4C054:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+458j
		mov	[bp+var_3A], 3E8h
		push	large [bp+var_DF]
		push	large 2
		push	ss
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 2
		mov	ax, word_432FA
		mov	[bp+var_3C], ds
		mov	[bp+var_3E], ax
		push	large [bp+var_DF]
		push	large 8
		push	[bp+var_3C]
		push	[bp+var_3E]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 8
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		push	large 0
		push	large [dword_43681]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		mov	[bp+var_40], 1Eh
		push	large [bp+var_DF]
		push	large 2
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 2
		mov	[bp+var_42], 1Eh
		push	large [bp+var_DF]
		push	large 2
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 2
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_SeekAndRelease_3C857
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_SeekAndRelease_3C857
		add	sp, 2

loc_4C136:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+31Ej
		push	large 0
		push	large [dword_43686]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		mov	ax, si
		add	ax, 3ACh
		mov	[bp+var_1E], ds
		mov	[bp+var_20], ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	CRT_Strlen
		add	sp, 2
		movzx	eax, ax
		mov	[bp+var_24], eax
		push	large [bp+var_DF]
		push	large [bp+var_24]
		push	[bp+var_1E]
		push	[bp+var_20]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		mov	eax, [bp+var_24]
		add	[bp+var_DF], eax
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		push	large 0
		push	large [dword_4368B]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		mov	ax, si
		add	ax, 398h
		mov	[bp+var_26], ds
		mov	[bp+var_28], ax
		mov	ax, si
		add	ax, 398h
		push	ax
		call	CRT_Strlen
		add	sp, 2
		movzx	eax, ax
		mov	[bp+var_2C], eax
		push	large [bp+var_DF]
		push	large [bp+var_2C]
		push	[bp+var_26]
		push	[bp+var_28]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		mov	eax, [bp+var_2C]
		add	[bp+var_DF], eax
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		push	large 0
		push	large [dword_43690]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		mov	ax, si
		add	ax, 3C0h
		mov	[bp+var_2E], ds
		mov	[bp+var_30], ax
		mov	ax, si
		add	ax, 3C0h
		push	ax
		call	CRT_Strlen
		add	sp, 2
		movzx	eax, ax
		mov	[bp+var_34], eax
		push	large [bp+var_DF]
		push	large [bp+var_34]
		push	[bp+var_2E]
		push	[bp+var_30]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		mov	eax, [bp+var_34]
		add	[bp+var_DF], eax
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		push	large 0
		push	large [dword_43695]
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		cmp	byte ptr [si+35Ch], 0
		jz	short loc_4C2D7
		mov	ax, si
		add	ax, 35Ch
		mov	[bp+var_40], ax
		push	8
		push	[bp+var_40]
		lea	ax, [bp+var_3E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_36], 0
		lea	ax, [bp+var_3E]
		mov	[bp+var_42], ax
		mov	ax, [bp+var_42]
		mov	[bp+var_44], ds
		mov	[bp+var_46], ax
		push	large [bp+var_DF]
		push	large 8
		push	[bp+var_44]
		push	[bp+var_46]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 8

loc_4C2D7:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+691j
		cmp	byte ptr [si+370h], 0
		jz	short loc_4C32B
		mov	ax, si
		add	ax, 370h
		mov	[bp+var_40], ax
		push	8
		push	[bp+var_40]
		lea	ax, [bp+var_3E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_36], 0
		lea	ax, [bp+var_3E]
		mov	[bp+var_42], ax
		mov	ax, [bp+var_42]
		mov	[bp+var_44], ds
		mov	[bp+var_46], ax
		push	large [bp+var_DF]
		push	large 8
		push	[bp+var_44]
		push	[bp+var_46]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 8

loc_4C32B:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+6E5j
		cmp	byte ptr [si+384h], 0
		jz	short loc_4C37F
		mov	ax, si
		add	ax, 384h
		mov	[bp+var_40], ax
		push	8
		push	[bp+var_40]
		lea	ax, [bp+var_3E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_36], 0
		lea	ax, [bp+var_3E]
		mov	[bp+var_42], ax
		mov	ax, [bp+var_42]
		mov	[bp+var_44], ds
		mov	[bp+var_46], ax
		push	large [bp+var_DF]
		push	large 8
		push	[bp+var_44]
		push	[bp+var_46]
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_DF], 8

loc_4C37F:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+739j
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_SeekAndRelease_3C857
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	sub_3C86F
		add	sp, 2
		cmp	[bp+var_2], 0
		jz	short loc_4C3E8
		push	ds
		push	offset a_pak	; ".pak"
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	ds
		push	offset unk_4369A
		lea	ax, [bp+var_9C]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_9C]
		push	ax
		call	sub_6734
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4C3E8
		mov	al, [bp+var_1]
		mov	ah, 0
		push	ax
		call	PagedResourceC_RefreshAndFinalize_2FD7D
		add	sp, 2

loc_4C3E8:				; CODE XREF: Gameflow_WriteMissionOrder_4BBF7+7B3j
					; Gameflow_WriteMissionOrder_4BBF7+7E1j
		mov	[bp+var_144], 56Eh
		lea	ax, [bp+var_144]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_144]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_WriteMissionOrder_4BBF7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C40E	proc far		; CODE XREF: sub_41F1AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4C448
		mov	word ptr [si], 56Eh
		push	si
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		test	di, 1
		jz	short loc_4C446
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4C446:				; CODE XREF: sub_4C40E+2Bj
		jmp	short $+2

loc_4C448:				; CODE XREF: sub_4C40E+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4C40E	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C450	proc far		; CODE XREF: sub_41F15J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_DestructWrapper_3D231
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_4C450	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C463	proc far		; CODE XREF: sub_41F10J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4C490
		mov	word ptr [si], 693h
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		test	di, 1
		jz	short loc_4C490
		push	si
		call	sub_308
		add	sp, 2

loc_4C490:				; CODE XREF: sub_4C463+Dj
					; sub_4C463+22j
		pop	di
		pop	si
		pop	bp
		retf
sub_4C463	endp

ovr184		ends
