seg009		segment	byte public 'CODE' use16
		assume cs:seg009
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_11BED:				; DATA XREF: seg339:0316o
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+0Ah]
		push	si
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	si, [si+4]
		mov	eax, [si]
		les	bx, [bp+6]
		mov	es:[bx+22h], eax
		mov	eax, [si+4]
		mov	es:[bx+26h], eax
		mov	eax, [si+8]
		mov	es:[bx+2Ah], eax
		push	0
		mov	ax, [bp+6]
		add	ax, 13h
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	dword_7205F, eax
		mov	eax, [si+4]
		mov	dword_72063, eax
		mov	eax, [si+8]
		mov	dword_72067, eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 15h
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-1Ch], eax
		mov	eax, es:[si+4]
		mov	[bp-18h], eax
		mov	eax, es:[si+8]
		mov	[bp-14h], eax
		les	bx, [bp+6]
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [bp-1Ch]
		sub	eax, [si]
		mov	dword_72053, eax
		mov	eax, [bp-18h]
		sub	eax, [si+4]
		mov	dword_72057, eax
		mov	eax, [bp-14h]
		sub	eax, [si+8]
		mov	dword_7205B, eax
		push	4FA3h
		push	4FAFh
		push	ss
		lea	ax, [bp-8]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	ax, [bp-7]
		mov	word_7208F, ax
		push	large [dword_7205B]
		push	large [dword_72057]
		push	large [dword_72053]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	[bp-10h], eax
		mov	dword_7209B, eax
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_11D03:				; DATA XREF: seg339:031Ao
		push	bp
		mov	bp, sp
		sub	sp, 136h
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11D29
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_11D29:				; CODE XREF: seg009:0139j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		push	ss
		lea	ax, [bp-32h]
		push	ax
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large dword ptr	[bp-2Ah]
		push	large dword ptr	[bp-2Eh]
		push	large dword ptr	[bp-32h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-4],	eax
		mov	[bp-8],	eax
		mov	dword ptr [bp-0Ch], 0A00h
		cmp	eax, [bp-0Ch]
		jle	short loc_11D81
		mov	ax, 1
		jmp	short loc_11D83
; ���������������������������������������������������������������������������

loc_11D81:				; CODE XREF: seg009:019Aj
		xor	ax, ax

loc_11D83:				; CODE XREF: seg009:019Fj
		or	al, al
		jz	short loc_11D93
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		jmp	loc_12086
; ���������������������������������������������������������������������������

loc_11D93:				; CODE XREF: seg009:01A5j
		les	bx, [bp+6]
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jnz	short loc_11DAF
		push	ds
		push	offset aTakeoff	; "TAKEOFF"
		push	59CDh
		call	EntityTracker_SelectByID
		add	sp, 6

loc_11DAF:				; CODE XREF: seg009:01BEj
		les	bx, [bp+6]
		mov	word ptr es:[bx+46h], 0
		mov	dword ptr [bp-10h], 0
		mov	eax, [bp-10h]
		mov	es:[bx+4Ch], eax
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp-3Eh], eax
		mov	eax, [si+4]
		mov	[bp-3Ah], eax
		mov	eax, [si+8]
		mov	[bp-36h], eax
		cmp	dword ptr [bp-3Eh], 0
		jnz	short loc_11DFF
		mov	ax, 1
		jmp	short loc_11E01
; ���������������������������������������������������������������������������

loc_11DFF:				; CODE XREF: seg009:0218j
		xor	ax, ax

loc_11E01:				; CODE XREF: seg009:021Dj
		or	al, al
		jz	short loc_11E23
		cmp	dword ptr [bp-3Ah], 0
		jle	short loc_11E11
		mov	ax, 1
		jmp	short loc_11E13
; ���������������������������������������������������������������������������

loc_11E11:				; CODE XREF: seg009:022Aj
		xor	ax, ax

loc_11E13:				; CODE XREF: seg009:022Fj
		or	al, al
		jz	short loc_11E23
		les	bx, [bp+6]
		mov	word ptr es:[bx+58h], 0
		jmp	loc_11EAE
; ���������������������������������������������������������������������������

loc_11E23:				; CODE XREF: seg009:0223j seg009:0235j
		cmp	dword ptr [bp-3Eh], 0
		jnz	short loc_11E2F
		mov	ax, 1
		jmp	short loc_11E31
; ���������������������������������������������������������������������������

loc_11E2F:				; CODE XREF: seg009:0248j
		xor	ax, ax

loc_11E31:				; CODE XREF: seg009:024Dj
		or	al, al
		jz	short loc_11E52
		cmp	dword ptr [bp-3Ah], 0
		jge	short loc_11E41
		mov	ax, 1
		jmp	short loc_11E43
; ���������������������������������������������������������������������������

loc_11E41:				; CODE XREF: seg009:025Aj
		xor	ax, ax

loc_11E43:				; CODE XREF: seg009:025Fj
		or	al, al
		jz	short loc_11E52
		les	bx, [bp+6]
		mov	word ptr es:[bx+58h], 0B4h ; '�'
		jmp	short loc_11EAE
; ���������������������������������������������������������������������������

loc_11E52:				; CODE XREF: seg009:0253j seg009:0265j
		cmp	dword ptr [bp-3Ah], 0
		jnz	short loc_11E5E
		mov	ax, 1
		jmp	short loc_11E60
; ���������������������������������������������������������������������������

loc_11E5E:				; CODE XREF: seg009:0277j
		xor	ax, ax

loc_11E60:				; CODE XREF: seg009:027Cj
		or	al, al

loc_11E62:
		jz	short loc_11E81

loc_11E64:
		cmp	dword ptr [bp-3Eh], 0
		jle	short loc_11E70

loc_11E6B:
		mov	ax, 1
		jmp	short loc_11E72
; ���������������������������������������������������������������������������

loc_11E70:				; CODE XREF: seg009:0289j
		xor	ax, ax

loc_11E72:				; CODE XREF: seg009:028Ej
		or	al, al

loc_11E74:
		jz	short loc_11E81

loc_11E76:
		les	bx, [bp+6]
		mov	word ptr es:[bx+58h], 10Eh
		jmp	short loc_11EAE
; ���������������������������������������������������������������������������

loc_11E81:				; CODE XREF: seg009:loc_11E62j
					; seg009:loc_11E74j
		cmp	dword ptr [bp-3Ah], 0
		jnz	short loc_11E8D
		mov	ax, 1
		jmp	short loc_11E8F
; ���������������������������������������������������������������������������

loc_11E8D:				; CODE XREF: seg009:02A6j
		xor	ax, ax

loc_11E8F:				; CODE XREF: seg009:02ABj
		or	al, al
		jz	short loc_11EAE
		cmp	dword ptr [bp-3Eh], 0
		jge	short loc_11E9F
		mov	ax, 1
		jmp	short loc_11EA1
; ���������������������������������������������������������������������������

loc_11E9F:				; CODE XREF: seg009:02B8j
		xor	ax, ax

loc_11EA1:				; CODE XREF: seg009:02BDj
		or	al, al
		jz	short loc_11EAE
		les	bx, [bp+6]
		mov	word ptr es:[bx+58h], 5Ah ; 'Z'

loc_11EAE:				; CODE XREF: seg009:0240j seg009:0270j ...
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-1Ch], dx
		mov	[bp-1Eh], ax
		mov	ax, [bp-1Ch]
		mov	dx, [bp-1Eh]
		add	dx, 2Bh	; '+'
		mov	[bp-20h], ax
		mov	[bp-22h], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, [bp-1Ah]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	byte ptr [bp-12h], 0
		lea	ax, [bp-0E6h]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [bp-0E6h], 2C8h
		mov	dword ptr [bp-85h], 100h
		mov	dword ptr [bp-89h], 0
		mov	word ptr [bp-0E6h], 2E0h
		mov	word ptr [bp-6Ah], 0
		xor	ax, ax
		mov	[bp-6Ch], ax
		movsx	eax, ax
		mov	[bp-81h], eax
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ss
		lea	ax, [bp-1Ah]
		push	ax
		push	ds
		push	offset aObjects	; "OBJECTS"
		lea	ax, [bp-136h]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp-136h]
		push	ax
		lea	ax, [bp-0E6h]
		push	ax
		mov	bx, [bp-0E6h]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_11F5D
		jmp	loc_1202C
; ���������������������������������������������������������������������������

loc_11F5D:				; CODE XREF: seg009:0378j
		push	0
		push	large 'LAER'    ; REAL

loc_11F65:
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2

loc_11F6F:
		add	sp, 8
		or	ax, ax
		jnz	short loc_11F79
		jmp	loc_1202C
; ���������������������������������������������������������������������������

loc_11F79:				; CODE XREF: seg009:0394j
		push	0
		push	large 'TJBO'    ; OBJT
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_11F95
		jmp	loc_1202C
; ���������������������������������������������������������������������������

loc_11F95:				; CODE XREF: seg009:03B0j
		push	0
		push	large 'PTEJ'    ; JETP
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_1202C
		push	0
		push	large 'FFOT'
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_12011
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+6]
		mov	es:[bx+52h], ax
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+6]
		mov	es:[bx+50h], ax
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+6]
		mov	es:[bx+54h], ax
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+6]
		mov	es:[bx+56h], ax
		jmp	short loc_1202C
; ���������������������������������������������������������������������������

loc_12011:				; CODE XREF: seg009:03E5j
		les	bx, [bp+6]
		mov	word ptr es:[bx+52h], 14h
		mov	word ptr es:[bx+50h], 96h ; '�'
		mov	word ptr es:[bx+54h], 1Eh
		mov	word ptr es:[bx+56h], 8

loc_1202C:				; CODE XREF: seg009:037Aj seg009:0396j ...
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+75h], 4
		les	bx, [bp+6]
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jnz	short loc_12059
		mov	dword ptr [bp-26h], 0F00h
		mov	eax, [bp-26h]
		sub	dword_706AB, eax

loc_12059:				; CODE XREF: seg009:0466j
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]

loc_12063:
		call	dword ptr [bx+0Ch]
		add	sp, 4

loc_12069:
		mov	word ptr [bp-0E6h], 2E0h
		lea	ax, [bp-0E6h]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp-0E6h]
		push	ax
		call	StreamReader_ReleaseBuffer_65643

loc_12086:				; CODE XREF: seg009:01B0j
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1208C:				; DATA XREF: seg339:031Eo
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	bx, es:[bx+46h]
		cmp	bx, 4		; switch 5 cases
		ja	short loc_120D0	; default
		shl	bx, 1
		jmp	cs:off_120DE[bx] ; switch jump

loc_120A2:				; DATA XREF: seg009:off_120DEo
		push	large dword ptr	[bp+6] ; case 0x0
		nop
		push	cs
		call	near ptr FlightState_ResetHud
		jmp	short loc_120D9
; ���������������������������������������������������������������������������

loc_120AD:				; CODE XREF: seg009:04BDj
					; DATA XREF: seg009:off_120DEo
		push	large dword ptr	[bp+6] ; case 0x1
		nop
		push	cs
		call	near ptr FlightState_EnterEmergency
		jmp	short loc_120D9
; ���������������������������������������������������������������������������

loc_120B8:				; CODE XREF: seg009:04BDj
					; DATA XREF: seg009:off_120DEo
		push	large dword ptr	[bp+6] ; case 0x2
		nop
		push	cs
		call	near ptr FlightState_FinalizeCounter
		jmp	short loc_120D9
; ���������������������������������������������������������������������������

loc_120C3:				; CODE XREF: seg009:04BDj
					; DATA XREF: seg009:off_120DEo
		push	large dword ptr	[bp+6] ; case 0x3
		nop
		push	cs
		call	near ptr FlightState_EnterLevelFlight
		jmp	short loc_120D9
; ���������������������������������������������������������������������������

loc_120CE:				; CODE XREF: seg009:04BDj
					; DATA XREF: seg009:off_120DEo
		jmp	short $+2	; case 0x4

loc_120D0:				; CODE XREF: seg009:04B9j
		push	large dword ptr	[bp+6] ; default
		call	VROOMM_StubThunk_6AB45

loc_120D9:				; CODE XREF: seg009:04CBj seg009:04D6j ...
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������
off_120DE	dw offset loc_120A2	; DATA XREF: seg009:04BDr
		dw offset loc_120AD	; jump table for switch	statement
		dw offset loc_120B8
		dw offset loc_120C3
		dw offset loc_120CE

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,329L — réinitialise plusieurs champs HUD/commande d'un objet (via chaîne +8→+7, offsets
; +0x1F/0x23/0x27) et vérifie une altitude (+0x4C) : handler de fin/init de manoeuvre
; (probable transition d'état de vol, ex: fin de décollage).
; ==============================================================================================
FlightState_ResetHud	proc far		; CODE XREF: seg009:04C8p

var_70		= dword	ptr -70h
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_51		= byte ptr -51h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+27h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4Ch]
		sar	eax, 8
		cmp	eax, 0
		jnz	short loc_12176
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+3Ah], eax
		mov	eax, [si+4]

loc_12168:
		mov	es:[bx+3Eh], eax
		mov	eax, [si+8]
		mov	es:[bx+42h], eax

loc_12176:				; CODE XREF: FlightState_ResetHud+6Bj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	byte ptr [bx+59h], 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	eax, dword_70458
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		add	es:[bx+4Ch], eax
		mov	ax, es:[bx+52h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 4Ch	; 'L'
		mov	word ptr [bp+var_1A+2],	ax
		mov	word ptr [bp+var_1A], dx
		les	bx, [bp+var_1A]
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_16]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		les	bx, [bp+arg_0]
		mov	es:[bx+48h], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_2E], eax
		mov	eax, es:[bx+48h]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	ax, es:[bx+58h]
		mov	[bp+var_44], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_12462

loc_1222D:				; CODE XREF: FlightState_ResetHud+150j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_44]
		jz	short loc_1223D
		add	bx, 2
		loop	loc_1222D
		jmp	loc_1237D	; default
; ���������������������������������������������������������������������������

loc_1223D:				; CODE XREF: FlightState_ResetHud+14Bj
		jmp	word ptr cs:[bx+8] ; switch jump

loc_12241:				; DATA XREF: seg009:088Ao
		les	bx, [bp+arg_0]	; case 0x0
		mov	eax, [bp+var_2E]
		add	es:[bx+3Eh], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_36+2],	ax
		mov	word ptr [bp+var_36], dx
		les	si, [bp+var_36]
		mov	eax, es:[si]

loc_12263:
		mov	es, word ptr [bp+arg_0+2]

loc_12266:
		mov	bx, es:[bx+11h]

loc_1226A:
		mov	[bx+12h], eax

loc_1226E:
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]

loc_12276:
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		jmp	loc_1237D	; default
; ���������������������������������������������������������������������������

loc_12291:				; CODE XREF: FlightState_ResetHud:loc_1223Dj
					; DATA XREF: seg009:088Ao
		les	bx, [bp+arg_0]	; case 0x5A
		mov	eax, [bp+var_2E]
		sub	es:[bx+3Ah], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_3A+2],	ax
		mov	word ptr [bp+var_3A], dx
		les	si, [bp+var_3A]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		jmp	loc_1237D	; default
; ���������������������������������������������������������������������������

loc_122E1:				; CODE XREF: FlightState_ResetHud:loc_1223Dj
					; DATA XREF: seg009:088Ao
		les	bx, [bp+arg_0]	; case 0xB4
		mov	eax, [bp+var_2E]
		sub	es:[bx+3Eh], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_3E+2],	ax
		mov	word ptr [bp+var_3E], dx
		les	si, [bp+var_3E]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		jmp	short loc_1237D	; default
; ���������������������������������������������������������������������������

loc_12330:				; CODE XREF: FlightState_ResetHud:loc_1223Dj
					; DATA XREF: seg009:088Ao
		les	bx, [bp+arg_0]	; case 0x10E
		mov	eax, [bp+var_2E]
		add	es:[bx+3Ah], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_42+2],	ax
		mov	word ptr [bp+var_42], dx
		les	si, [bp+var_42]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax

loc_1235D:
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]

loc_12365:
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax

loc_1237D:				; CODE XREF: FlightState_ResetHud+152j
					; FlightState_ResetHud+1A6j ...
		les	bx, [bp+arg_0]	; default
		mov	eax, es:[bx+48h]
		sar	eax, 8
		movsx	edx, word ptr es:[bx+50h]
		cmp	eax, edx
		jg	short loc_12397
		jmp	loc_1245F
; ���������������������������������������������������������������������������

loc_12397:				; CODE XREF: FlightState_ResetHud+2AAj
		inc	word ptr es:[bx+46h]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_5E], eax
		mov	eax, [si+4]
		mov	[bp+var_5A], eax
		mov	eax, [si+8]
		mov	[bp+var_56], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_48+2],	ax
		mov	word ptr [bp+var_48], dx
		les	si, [bp+var_48]
		mov	eax, es:[si]
		mov	[bp+var_6A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_66], eax
		mov	eax, es:[si+8]
		mov	[bp+var_62], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 48h	; 'H'
		mov	word ptr [bp+var_4C+2],	ax
		mov	word ptr [bp+var_4C], dx
		les	bx, [bp+var_4C]
		mov	eax, es:[bx]
		mov	[bp+var_50], eax
		sub	sp, 4
		mov	[bp+var_70], eax
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		push	word ptr [bx+51h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		push	ax
		call	Pilot_SteeringCommandToTarget
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	byte ptr [bx+59h], 0
		mov	[bp+var_51], 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bp+var_51]
		mov	[bx+20h], al

loc_1245F:				; CODE XREF: FlightState_ResetHud+2ACj
		pop	si
		leave

locret_12461:
		retf
FlightState_ResetHud	endp

; ���������������������������������������������������������������������������
word_12462	dw	0,   5Ah,  0B4h,  10Eh ; DATA XREF: FlightState_ResetHud+142o
					; value	table for switch statement
		dw offset loc_12241	; jump table for switch	statement
		dw offset loc_12291
		dw offset loc_122E1
		dw offset loc_12330

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,124L — même pattern de reset HUD (+0x23/+0x1F/+0x27=0, code HUD +0x1E=0xA) + positionne
; un flag pilote (+0x75 bit1) : handler d'entrée dans un état de vol (probable début de
; manoeuvre d'évitement/urgence).
; ==============================================================================================
FlightState_EnterEmergency	proc far		; CODE XREF: seg009:04D3p

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 30h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+27h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+75h], 2
		push	0
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_30], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_2C], eax
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_28], eax
		lea	ax, [bp+var_30]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_1C]
		push	ax

loc_12560:
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	eax, [bx+1Ah]

loc_12573:
		sub	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		cmp	[bp+var_24], 12C00h
		jle	short loc_1258E
		mov	ax, 1
		jmp	short loc_12590
; ���������������������������������������������������������������������������

loc_1258E:				; CODE XREF: FlightState_EnterEmergency+115j
		xor	ax, ax

loc_12590:				; CODE XREF: FlightState_EnterEmergency+11Aj
		or	al, al
		jz	short loc_125AD
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 5
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+46h]
		jmp	short locret_125C0
; ���������������������������������������������������������������������������

loc_125AD:				; CODE XREF: FlightState_EnterEmergency+120j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+54h]
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Altitude_HoldController
		add	sp, 6

locret_125C0:				; CODE XREF: FlightState_EnterEmergency+139j
		leave
		retf
FlightState_EnterEmergency	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,19L — nettoie 2 bits de flag pilote (+0x75 bits 2 et 1) et incrémente un compteur
; (+0x46) : finalisation d'état avec comptage d'occurrences.
; ==============================================================================================
FlightState_FinalizeCounter	proc far		; CODE XREF: seg009:04DEp

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+75h], 0FBh
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+75h], 0FDh
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+46h]
		pop	bp
		retf
FlightState_FinalizeCounter	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,89L — reset HUD (code +0x1E=5), nettoie flag pilote (+0x75 bit1), compare l'altitude
; courante (sub_57C3A) à un seuil (0x1100) : handler d'entrée en palier/maintien d'altitude.
; ==============================================================================================
FlightState_EnterLevelFlight	proc far		; CODE XREF: seg009:04E9p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+27h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 5
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+75h], 0FDh
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]

loc_12663:
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]

loc_12668:
		pop	cx
		push	ax
		push	ss

loc_1266B:
		lea	ax, [bp+var_8]
		push	ax
		call	Matrix_NosePitchAngle_57C3A
		add	sp, 6
		cmp	[bp+var_8], 1100h
		jle	short loc_12686
		mov	ax, 1
		jmp	short loc_12688
; ���������������������������������������������������������������������������

loc_12686:				; CODE XREF: FlightState_EnterLevelFlight+93j
		xor	ax, ax

loc_12688:				; CODE XREF: FlightState_EnterLevelFlight+98j
		or	al, al
		jz	short loc_126AA
		mov	[bp+var_C], 0FFFFF000h
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		jmp	short locret_126CA
; ���������������������������������������������������������������������������

loc_126AA:				; CODE XREF: FlightState_EnterLevelFlight+9Ej
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+46h]
		mov	[bp+var_10], 800h
		mov	eax, [bp+var_10]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax

locret_126CA:				; CODE XREF: FlightState_EnterLevelFlight+BCj
		leave
		retf
FlightState_EnterLevelFlight	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,166L — contrôleur de maintien d'altitude : calcule l'écart entre l'altitude courante
; (sub_57C3A) et une consigne (arg_4), applique un coefficient (+0x56) façon correction
; proportionnelle : loi de contrôle du tangage pour tenir une altitude cible.
; ==============================================================================================
Altitude_HoldController	proc far		; CODE XREF: FlightState_EnterEmergency+148p

var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_6], si
		movsx	eax, [bp+var_6]
		shl	eax, 8

loc_126E2:
		mov	[bp+var_4], eax

loc_126E6:
		les	bx, [bp+arg_0]

loc_126E9:
		push	word ptr es:[bx+11h]

loc_126ED:
		mov	bx, es:[bx+11h]

loc_126F1:
		mov	bx, [bx]

loc_126F3:
		call	dword ptr [bx+3Ch]
		pop	cx

loc_126F7:
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Matrix_NosePitchAngle_57C3A
		add	sp, 6
		mov	cx, word ptr [bp+var_A+1]
		sub	cx, si
		or	cx, cx
		jge	short loc_12714
		mov	ax, cx
		neg	ax
		jmp	short loc_12716
; ���������������������������������������������������������������������������

loc_12714:				; CODE XREF: Altitude_HoldController+40j
		mov	ax, cx

loc_12716:				; CODE XREF: Altitude_HoldController+46j
		mov	cx, ax
		mov	eax, [bp+var_A]
		sub	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+56h]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_4], edx
		mov	eax, [bp+var_4]
		sar	eax, 3
		mov	[bp+var_4], eax
		mov	ax, es:[bx+56h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_12762
		mov	ax, 1
		jmp	short loc_12764
; ���������������������������������������������������������������������������

loc_12762:				; CODE XREF: Altitude_HoldController+8Fj
		xor	ax, ax

loc_12764:				; CODE XREF: Altitude_HoldController+94j
		or	al, al
		jz	short loc_12789
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+56h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		jmp	short loc_127D0
; ���������������������������������������������������������������������������

loc_12789:				; CODE XREF: Altitude_HoldController+9Aj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+56h]
		neg	ax
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jle	short loc_127A9
		mov	ax, 1
		jmp	short loc_127AB
; ���������������������������������������������������������������������������

loc_127A9:				; CODE XREF: Altitude_HoldController+D6j
		xor	ax, ax

loc_127AB:				; CODE XREF: Altitude_HoldController+DBj
		or	al, al
		jz	short loc_127D0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+56h]
		neg	ax
		mov	[bp+var_18], ax
		movsx	eax, [bp+var_18]
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax

loc_127D0:				; CODE XREF: Altitude_HoldController+BBj
					; Altitude_HoldController+E1j
		mov	ax, word ptr [bp+var_4+1]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		shl	eax, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]

loc_127E7:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]

loc_127EE:
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		cmp	cx, 5
		jge	short loc_12801
		mov	ax, 1

loc_127FF:
		jmp	short loc_12803
; ���������������������������������������������������������������������������

loc_12801:				; CODE XREF: Altitude_HoldController+12Ej
		xor	ax, ax

loc_12803:				; CODE XREF: Altitude_HoldController:loc_127FFj
		pop	si
		leave
		retf
Altitude_HoldController	endp

seg009		ends
