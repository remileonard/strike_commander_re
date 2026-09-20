seg436		segment	para public 'OVERLAY' use16
		assume cs:seg436
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 128 lignes, LUE INTEGRALEMENT (2026-09-20). CHARGEUR DU CHUNK 'DATA' D'UN OBJET SWPN
; (defense fixe AA/SAM/navire ; ancien nom 'PlayerComponent_LoadFieldsWithRetryC' faux).
; Appelle IFF_LoadAngleParam puis lit 'DATA' (push large 41544144h) : valeur group C ->
; objet+0x36 (weapons_round, munitions), group C -> +0x3A (detection_range), group C -> +0x3E
; (effective_range : LA PORTEE utilisee par Targeting_AcquireBestThreat pour noter une defense
; fixe), word -> +0x42, group C -> +0x44, byte -> +0x48 (max_simultaneous_shots), pointeur far
; vers l'objet arme charge (stub VROOMM 6C394, nom de l'arme sur 8 caracteres) -> +0x49/+0x4B,
; group C -> +0x4D. Correspond a RSEntity::parseREAL_OBJT_SWPN_DATA de libRealSpace.
; ==============================================================================================
SwpnModel_LoadDataChunk_A0A00	proc far		; CODE XREF: VROOMM_StubThunk_6C5E0J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	large [bp+arg_0]
		call	IFF_LoadAngleParam

loc_A0A21:
		add	sp, 6
		push	0

loc_A0A26:
		push	large 41544144h
		push	si

loc_A0A2D:
		call	ResourceRecord_SeekAndRead_64743

loc_A0A32:
		add	sp, 8
		or	ax, ax
		jnz	short loc_A0A3C
		jmp	loc_A0AD0
; ���������������������������������������������������������������������������

loc_A0A3C:				; CODE XREF: SwpnModel_LoadDataChunk_A0A00+37j
		push	si

loc_A0A3D:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax

loc_A0A57:
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]

loc_A0A5D:
		mov	es:[bx+3Ah], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+3Eh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+42h], ax

loc_A0A83:
		push	si

loc_A0A84:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax

loc_A0A8B:
		pop	eax

loc_A0A8D:
		pop	cx

loc_A0A8E:
		les	bx, [bp+arg_0]

loc_A0A91:
		mov	es:[bx+44h], eax
		push	si

loc_A0A97:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+48h], al
		push	si
		push	large 0
		call	VROOMM_StubThunk_6C394
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4Bh], dx
		mov	es:[bx+49h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4Dh], eax
		jmp	short loc_A0AD9
; ���������������������������������������������������������������������������

loc_A0AD0:				; CODE XREF: SwpnModel_LoadDataChunk_A0A00+39j
		push	0C01Dh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A0AD9:				; CODE XREF: SwpnModel_LoadDataChunk_A0A00+CEj
		pop	si
		pop	bp
		retf
SwpnModel_LoadDataChunk_A0A00	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise une classe de base (sub_3C9BC), appelle
; PlayerComponent_SubHelperX_A0B8B, enregistre dans un conteneur (sub_6C00E).
; ==============================================================================================
PlayerComponentVariantO_ConstructAndInit_A0ADC	proc far		; CODE XREF: VROOMM_StubThunk_6C5E5J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si

loc_A0AE3:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax

loc_A0AEB:
		push	64h ; 'd'

loc_A0AED:
		call	CRT_Malloc16_Retry

loc_A0AF2:
		pop	cx

loc_A0AF3:
		mov	si, ax
		or	ax, ax

loc_A0AF7:
		jz	short loc_A0B2A
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si], 2AA0h
		mov	word ptr [si+51h], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+5Bh], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs

loc_A0B20:
		call	near ptr PlayerComponent_SubHelperX_A0B8B
		add	sp, 6
		mov	ax, si
		jmp	short loc_A0B2C
; ���������������������������������������������������������������������������

loc_A0B2A:				; CODE XREF: PlayerComponentVariantO_ConstructAndInit_A0ADC:loc_A0AF7j
		mov	ax, si

loc_A0B2C:				; CODE XREF: PlayerComponentVariantO_ConstructAndInit_A0ADC+4Cj
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantO_ConstructAndInit_A0ADC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_3A40B (ajout à liste membre, motif seg109) et
; Timer_SetAbsoluteAndResetPulses_4FAFC (seg110).
; ==============================================================================================
PlayerComponent_RegisterAndInitPulses_A0B40	proc far		; CODE XREF: VROOMM_StubThunk_6C5EAJ PlayerComponent_SubHelperX_A0B8B+4Bp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp

loc_A0B41:
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax

loc_A0B52:
		call	SetReference16
		add	sp, 4

loc_A0B5A:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+57h], eax
		mov	[bp+var_8], 0F424000h
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, si
		add	ax, 5Bh	; '['
		push	ax
		call	Timer_SetAbsoluteAndResetPulses_4FAFC
		add	sp, 4

loc_A0B84:
		or	byte ptr [si+4], 40h
		pop	si
		leave
		retf
PlayerComponent_RegisterAndInitPulses_A0B40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_37C89, Matrix_BuildFromAngle_56D72 (seg116) et
; PlayerComponent_RegisterAndInitPulses_A0B40.
; ==============================================================================================
PlayerComponent_SubHelperX_A0B8B	proc far		; CODE XREF: VROOMM_StubThunk_6C5EFJ
					; PlayerComponentVariantO_ConstructAndInit_A0ADC:loc_A0B20p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp

loc_A0B8E:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]
		mov	[si+50h], al
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+36h]
		mov	[si+53h], eax
		push	si
		push	cs
		call	near ptr PlayerComponent_RegisterAndInitPulses_A0B40
		pop	cx
		pop	si
		leave
		retf
PlayerComponent_SubHelperX_A0B8B	endp

seg436		ends
