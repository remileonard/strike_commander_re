ovr247		segment	para public 'OVERLAY' use16
		assume cs:ovr247
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantP_85EB0	proc far		; CODE XREF: VROOMM_StubThunk_6B165J HUDSymbol_LoadConfigFromIFF_85F65+CFp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_85ECD
		push	82h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_85F2B

loc_85ECD:				; CODE XREF: HUDSymbol_ConstructVariantP_85EB0+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 7D8h
		mov	ax, [bp+arg_2]
		mov	[si+80h], ax
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+44h], eax
		mov	eax, [bp+arg_8]
		mov	[si+60h], eax
		mov	eax, [bp+arg_C]
		mov	[si], eax

loc_85F2B:				; CODE XREF: HUDSymbol_ConstructVariantP_85EB0+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantP_85EB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunks voisins uniquement (28 lignes).
; ==============================================================================================
HUDSymbol_Helper16_85F30	proc far		; CODE XREF: VROOMM_StubThunk_6B16AJ

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+80h]
		mov	ax, [bx+4]
		add	ax, 29h	; ')'
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	VROOMM_StubThunk_6BBF4
		add	sp, 4
		push	si
		call	VROOMM_StubThunk_6BBFE
		pop	cx
		or	byte ptr [si+52h], 1
		mov	al, [si+52h]
		and	ax, 1
		pop	si
		leave
		retf
HUDSymbol_Helper16_85F30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 155 lignes, NON DÉTAILLÉE — combine allocation et ReadFieldGroupA_64A19 (×2, seg193)
; — chargement de configuration de symbole HUD depuis IFF.
; ==============================================================================================
HUDSymbol_LoadConfigFromIFF_85F65	proc far		; CODE XREF: VROOMM_StubThunk_6B16FJ

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_24		= word ptr -24h
var_22		= byte ptr -22h
var_21		= word ptr -21h
var_1F		= byte ptr -1Fh
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_85F88
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_85F88
		jmp	loc_860C4
; ���������������������������������������������������������������������������

loc_85F88:				; CODE XREF: HUDSymbol_LoadConfigFromIFF_85F65+10j
					; HUDSymbol_LoadConfigFromIFF_85F65+1Ej
		push	si
		call	VROOMM_StubThunk_6B570
		pop	cx
		mov	word ptr [si], 7C0h
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+17h], 2
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_85FC3
		jmp	loc_86047
; ���������������������������������������������������������������������������

loc_85FC3:				; CODE XREF: HUDSymbol_LoadConfigFromIFF_85F65+59j
		push	large 14h
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_24]
		mov	[si+6],	al
		mov	al, byte ptr [bp+var_24+1]
		mov	[si+7],	al
		mov	al, [bp+var_22]
		mov	[si+3],	al
		mov	ax, [bp+var_21]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	[si+0Dh], eax
		mov	eax, [si+0Dh]
		mov	[si+9],	eax
		mov	al, [bp+var_1F]
		mov	[si+8],	al
		sub	sp, 4
		mov	eax, [bp+var_18]
		mov	[bp+var_2C], eax
		sub	sp, 4
		mov	ax, [bp+var_1A]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_30], eax
		push	large [bp+var_1E]
		push	si
		push	0
		push	cs
		call	near ptr HUDSymbol_ConstructVariantP_85EB0
		add	sp, 10h
		mov	[si+11h], ax
		mov	eax, [bp+var_14]
		mov	[si+1Dh], eax
		jmp	short loc_8604E
; ���������������������������������������������������������������������������

loc_86047:				; CODE XREF: HUDSymbol_LoadConfigFromIFF_85F65+5Bj
		mov	word ptr [si+11h], 0
		jmp	short loc_860C4
; ���������������������������������������������������������������������������

loc_8604E:				; CODE XREF: HUDSymbol_LoadConfigFromIFF_85F65+E0j
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_860C4
		mov	eax, [di+72h]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si+13h], eax
		mov	byte ptr [si+17h], 3
		mov	byte ptr [si+18h], 1
		mov	dword ptr [si+19h], 0
		mov	eax, [bp+var_C]
		mov	[si+19h], eax
		push	0
		mov	al, [si+17h]
		push	ax
		push	large dword ptr	[si+13h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_860C4:				; CODE XREF: HUDSymbol_LoadConfigFromIFF_85F65+20j
					; HUDSymbol_LoadConfigFromIFF_85F65+E7j ...
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
HUDSymbol_LoadConfigFromIFF_85F65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un bloc typé (Memory_TypedFree_5C7B6).
; ==============================================================================================
HUDSymbol_ReleaseBlock_860CA	proc far		; CODE XREF: VROOMM_StubThunk_6B174J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8613D
		mov	word ptr [si], 7C0h
		cmp	word ptr [si+11h], 0
		jz	short loc_860F6
		push	3
		push	word ptr [si+11h]
		mov	bx, [si+11h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_860F6:				; CODE XREF: HUDSymbol_ReleaseBlock_860CA+17j
		cmp	byte ptr [si+18h], 0
		jz	short loc_8611C
		cmp	dword ptr [si+13h], 0
		jz	short loc_8611C
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8611C:				; CODE XREF: HUDSymbol_ReleaseBlock_860CA+30j
					; HUDSymbol_ReleaseBlock_860CA+37j
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		test	di, 1
		jz	short loc_8613D
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_8613D:				; CODE XREF: HUDSymbol_ReleaseBlock_860CA+Dj
					; HUDSymbol_ReleaseBlock_860CA+6Aj
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseBlock_860CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (25 lignes).
; ==============================================================================================
HUDSymbol_Helper17_86141	proc far		; CODE XREF: VROOMM_StubThunk_6B179J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0
		jz	short loc_86163
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+11h]
		call	VROOMM_StubThunk_6BBF4
		add	sp, 4

loc_86163:				; CODE XREF: HUDSymbol_Helper17_86141+Ej
		pop	si
		leave
		retf
HUDSymbol_Helper17_86141	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (24 lignes).
; ==============================================================================================
HUDSymbol_Helper18_86166	proc far		; CODE XREF: VROOMM_StubThunk_6B17EJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6B57A
		pop	cx
		cmp	word ptr [si+11h], 0
		jz	short loc_86186
		push	word ptr [si+11h]
		mov	bx, [si+11h]
		mov	bx, [bx+50h]
		call	dword ptr [bx]
		pop	cx

loc_86186:				; CODE XREF: HUDSymbol_Helper18_86166+12j
		pop	si
		pop	bp
		retf
HUDSymbol_Helper18_86166	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (24 lignes).
; ==============================================================================================
HUDSymbol_Helper19_86189	proc far		; CODE XREF: VROOMM_StubThunk_6B183J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0
		jz	short loc_861A3
		push	word ptr [si+11h]
		mov	bx, [si+11h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_861A3:				; CODE XREF: HUDSymbol_Helper19_86189+Bj
		push	si
		call	VROOMM_StubThunk_6B57F
		pop	cx
		pop	si
		pop	bp
		retf
HUDSymbol_Helper19_86189	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin puis CRT_FreeNear_Wrap.
; ==============================================================================================
HUDSymbol_ReleaseAndFree_861AD	proc far		; CODE XREF: VROOMM_StubThunk_6B160J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_861D8
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_861D6
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_861D8
; ���������������������������������������������������������������������������

loc_861D6:				; CODE XREF: HUDSymbol_ReleaseAndFree_861AD+1Ej
		jmp	short $+2

loc_861D8:				; CODE XREF: HUDSymbol_ReleaseAndFree_861AD+Dj
					; HUDSymbol_ReleaseAndFree_861AD+27j
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseAndFree_861AD	endp

ovr247		ends
