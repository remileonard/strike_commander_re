seg450		segment	para public 'OVERLAY' use16
		assume cs:seg450
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise une classe de base (sub_3C9BC), appelle
; TextLabel_InitRandomTimer_A6048.
; ==============================================================================================
TextLabel_ConstructAndInit_A5F20	proc far		; CODE XREF: VROOMM_StubThunk_6CC1FJ

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp

loc_A5F21:
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Bh ; '['
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A5F69
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx

loc_A5F44:
		mov	word ptr [si], 30EEh

loc_A5F48:
		mov	[bp+var_8], 0

loc_A5F50:
		mov	eax, [bp+var_8]
		mov	[si+51h], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr TextLabel_InitRandomTimer_A6048
		add	sp, 6
		mov	ax, si
		jmp	short loc_A5F6B
; ���������������������������������������������������������������������������

loc_A5F69:				; CODE XREF: TextLabel_ConstructAndInit_A5F20+1Bj
		mov	ax, si

loc_A5F6B:				; CODE XREF: TextLabel_ConstructAndInit_A5F20+47j
		mov	si, ax
		mov	ax, word ptr [bp+arg_0+2]

loc_A5F70:
		mov	dx, word ptr [bp+arg_0]

loc_A5F73:
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx

loc_A5F7C:
		mov	eax, [bp+var_C]

loc_A5F80:
		mov	[si+6],	eax

loc_A5F84:
		mov	ax, si
		pop	si
		leave
		retf
TextLabel_ConstructAndInit_A5F20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 94 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743,
; ReadFinalField_64B51 (×2), ReadFieldGroupC_64A7E (×3), ReadFieldGroupB_64A54 (seg193),
; gestion d'erreur, sub_3C942 (init classe de base).
; ==============================================================================================
TextLabel_LoadFieldsFromIFF_A5F89	proc far		; CODE XREF: VROOMM_StubThunk_6CC1AJ

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_A5F8D:
		mov	si, [bp+arg_4]
		push	0

loc_A5F92:
		push	large 'OFNI'

loc_A5F98:
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A600A
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]

loc_A5FC1:
		mov	es:[bx+37h], eax
		push	si

loc_A5FC7:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax

loc_A5FCE:
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]

loc_A5FD4:
		mov	es:[bx+3Bh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+3Fh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+43h], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx

loc_A6001:
		les	bx, [bp+arg_0]
		mov	es:[bx+45h], al
		jmp	short loc_A6013
; ���������������������������������������������������������������������������

loc_A600A:				; CODE XREF: TextLabel_LoadFieldsFromIFF_A5F89+1Aj
		push	0B004h

loc_A600D:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A6013:				; CODE XREF: TextLabel_LoadFieldsFromIFF_A5F89+7Fj
		push	si

loc_A6014:
		push	large [bp+arg_0]
		call	IFF_LoadAngleParam
		add	sp, 6
		pop	si

loc_A6021:
		pop	bp
		retf
TextLabel_LoadFieldsFromIFF_A5F89	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
TextLabel_Helper_A6023	proc far		; CODE XREF: VROOMM_StubThunk_6CC24J TextLabel_InitRandomTimer_A6048+Cp

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]

loc_A602D:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+56h], eax
		or	byte ptr [si+4], 1

loc_A6041:
		mov	byte ptr [si+5Ah], 0
		pop	si
		leave
		retf
TextLabel_Helper_A6023	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TextLabel_Helper_A6023, sub_37C89, Timer_SetAbsolute_4F9A2 (seg110),
; Math_RandomChance_54E4F (seg115) — probable initialisation d'un minuteur avec déclenchement
; aléatoire pour l'affichage du libellé de texte.
; ==============================================================================================
TextLabel_InitRandomTimer_A6048	proc far		; CODE XREF: VROOMM_StubThunk_6CC29J TextLabel_ConstructAndInit_A5F20+3Fp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr TextLabel_Helper_A6023
		pop	cx
		push	large [bp+arg_2]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 37h	; '7'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax

loc_A6083:
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax

loc_A6089:
		call	Timer_SetAbsolute_4F9A2
		add	sp, 4

loc_A6091:
		and	byte ptr [si+4], 0FDh
		les	bx, [si+0Eh]
		mov	ax, es:[bx+43h]
		call	Math_RandomChance_54E4F
		or	al, al
		jz	short loc_A60A9
		mov	byte ptr [si+5Ah], 1

loc_A60A9:				; CODE XREF: TextLabel_InitRandomTimer_A6048+5Bj
		pop	si
		leave
		retf
TextLabel_InitRandomTimer_A6048	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 119 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743, allocateurs
; typés (Memory_TypedFreeWrapperC_5C6F3, Memory_TypedAllocDispatchB_5C832 ×3),
; ResourceRecord_ReadDwordFieldB_64AFF, Text_ComputeMaxLineHeight_5E706,
; Text_ComputeMaxLineWidth_5E6BF (seg146-147) — mesure et alloue l'espace d'affichage d'un
; texte multi-lignes chargé depuis le format IFF.
; ==============================================================================================
TextLabel_MeasureAndAllocate_A60AC	proc far		; CODE XREF: VROOMM_StubThunk_6CC2EJ MissionText_LoadAndFormatFromIFF_A636C+287p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0

loc_A60BC:
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A60D2
		jmp	loc_A617B
; ���������������������������������������������������������������������������

loc_A60D2:				; CODE XREF: TextLabel_MeasureAndAllocate_A60AC+21j
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_4]
		mov	[si+6],	eax

loc_A6112:
		push	0
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_A6123:
		add	sp, 0Ah

loc_A6126:
		push	dx

loc_A6127:
		push	ax

loc_A6128:
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF

loc_A612E:
		add	sp, 6
		push	0

loc_A6133:
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Text_ComputeMaxLineHeight_5E706
		mov	[bp+var_A], ax
		push	0

loc_A6151:
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Text_ComputeMaxLineWidth_5E6BF
		mov	[bp+var_C], ax
		mov	ax, [bp+var_A]
		add	ax, [bp+var_C]
		sar	ax, 2
		mov	[si+0Ah], ax
		jmp	short loc_A6184
; ���������������������������������������������������������������������������

loc_A617B:				; CODE XREF: TextLabel_MeasureAndAllocate_A60AC+23j
		push	0B005h

loc_A617E:
		call	VROOMM_StubThunk_6B70F

loc_A6183:
		pop	cx

loc_A6184:				; CODE XREF: TextLabel_MeasureAndAllocate_A60AC+CDj
		pop	di
		pop	si
		leave
		retf
TextLabel_MeasureAndAllocate_A60AC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue un tampon (sub_658, taille variable +5 octets).
; ==============================================================================================
TextLabel_AllocateBuffer_A6188	proc far		; CODE XREF: VROOMM_StubThunk_6CC33J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_A618C:
		mov	si, [bp+arg_0]

loc_A618F:
		or	si, si
		jnz	short loc_A61A1

loc_A6193:
		push	2Ah ; '*'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A61CB

loc_A61A1:				; CODE XREF: TextLabel_AllocateBuffer_A6188+9j
		mov	ax, si
		inc	ax
		mov	ax, si
		add	ax, 5
		mov	ax, si
		add	ax, 9
		mov	ax, si
		add	ax, 0Dh
		mov	ax, si
		add	ax, 11h
		mov	ax, si
		add	ax, 1Bh
		mov	byte ptr [si+20h], 0

loc_A61C1:
		mov	word ptr [si+23h], 0
		mov	word ptr [si+25h], 0

loc_A61CB:				; CODE XREF: TextLabel_AllocateBuffer_A6188+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextLabel_AllocateBuffer_A6188	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 226 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743 (×3),
; ReadFieldGroupA_64A19 (×2), ReadFinalField_64B51 (×4), ReadFieldGroupB_64A54 (×2, seg193),
; alloue (sub_658) — chargement étendu de champs de texte depuis le format IFF.
; ==============================================================================================
TextLabel_LoadFieldsExtended_A61D0	proc far		; CODE XREF: VROOMM_StubThunk_6CC38J MissionText_LoadAndFormatFromIFF_A636C+260p

var_2C		= dword	ptr -2Ch
var_27		= dword	ptr -27h
var_23		= dword	ptr -23h
var_1F		= dword	ptr -1Fh
var_1B		= dword	ptr -1Bh
var_17		= byte ptr -17h
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= byte ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A61D3:
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax

loc_A61F1:
		jnz	short loc_A61F6

loc_A61F3:
		jmp	loc_A62C2
; ���������������������������������������������������������������������������

loc_A61F6:				; CODE XREF: TextLabel_LoadFieldsExtended_A61D0:loc_A61F1j
		push	large 19h

loc_A61F9:
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	di

loc_A61FF:
		call	ResourceRecord_ReadFieldGroupA_64A19

loc_A6204:
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_2C]
		mov	[si], al
		mov	eax, [bp+var_1F]
		mov	[si+5],	eax
		mov	al, [bp+var_17]
		mov	ah, 0
		mov	[si+15h], ax
		mov	al, [bp+var_16]
		mov	ah, 0
		mov	[si+17h], ax
		mov	ax, [si+17h]
		sub	ax, [si+15h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[si+11h], eax
		mov	ax, si

loc_A6244:
		add	ax, 5
		mov	[bp+var_8], ax
		mov	eax, [si+11h]
		mov	edx, eax
		mov	bx, [bp+var_8]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+11h], eax
		mov	eax, [bp+var_27]
		mov	[si+0Dh], eax

loc_A626E:
		mov	eax, [bp+var_23]

loc_A6272:
		sub	eax, [bp+var_27]

loc_A6276:
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax

loc_A627E:
		mov	[si+9],	eax
		mov	ax, si

loc_A6284:
		add	ax, 5
		mov	[bp+var_12], ax
		mov	eax, [si+9]
		mov	edx, eax

loc_A6291:
		mov	bx, [bp+var_12]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+9],	eax
		mov	eax, [bp+var_1B]
		mov	[si+1Bh], eax
		mov	eax, [bp+var_2C+1]
		mov	[si+1],	eax
		mov	al, [bp+var_15]
		mov	[si+19h], al
		mov	al, [bp+var_14]
		mov	[si+1Ah], al

loc_A62C2:				; CODE XREF: TextLabel_LoadFieldsExtended_A61D0:loc_A61F3j
		push	0

loc_A62C4:
		push	large 4D494E41h
		push	di

loc_A62CB:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_A62D3:
		or	ax, ax
		jz	short loc_A6315
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+27h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+28h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51

loc_A62F1:
		pop	cx
		mov	[si+29h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1Fh], al
		push	di

loc_A6300:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_A6306:
		mov	[si+21h], ax

loc_A6309:
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54

loc_A630F:
		pop	cx
		mov	[si+23h], ax

loc_A6313:
		jmp	short loc_A631D
; ���������������������������������������������������������������������������

loc_A6315:				; CODE XREF: TextLabel_LoadFieldsExtended_A61D0+105j
		mov	al, 0FFh
		mov	[si+29h], al
		mov	[si+27h], al

loc_A631D:				; CODE XREF: TextLabel_LoadFieldsExtended_A61D0:loc_A6313j
		push	0
		push	large 49524353h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A6368

loc_A6332:
		mov	al, [di+72h]
		mov	[si+20h], al
		mov	al, [si+20h]
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx

loc_A6344:
		mov	[si+25h], ax
		cmp	word ptr [si+25h], 0
		jz	short loc_A6368
		mov	al, [si+20h]
		mov	ah, 0
		movsx	eax, ax
		push	eax
		push	ds
		mov	ax, si
		add	ax, 25h	; '%'
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_A6368:				; CODE XREF: TextLabel_LoadFieldsExtended_A61D0+160j
					; TextLabel_LoadFieldsExtended_A61D0+17Bj
		pop	di
		pop	si
		leave
		retf
TextLabel_LoadFieldsExtended_A61D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 392 lignes, NON DÉTAILLÉE — la plus grosse fonction du segment : construit un
; StreamReader (StreamReader_ConstructVariantA_63A39, seg190), combine
; ResourceRecord_InitAndValidate_645CD, ReadFieldGroupB_64A54 (×3), la recherche de sous-
; enregistrement (ResourceRecord_SeekAndReadB_647B2, ComputeRecordBounds_646DB,
; AllocateAndDecode_64C21, seg193), TextLabel_LoadFieldsExtended_A61D0,
; TextLabel_MeasureAndAllocate_A60AC, ResourceRecord_ReleaseAndClear_64D25 (×3),
; ResourceRecord_ReadPayload_64DB3 — probable chargement complet et formatage d'un texte de
; mission (dialogue/briefing) depuis le format IFF compressé. Candidat prioritaire pour
; session dédiée si le contenu exact doit être confirmé.
; ==============================================================================================
MissionText_LoadAndFormatFromIFF_A636C	proc far		; CODE XREF: VROOMM_StubThunk_6CC3DJ

var_104		= word ptr -104h
var_B4		= word ptr -0B4h
var_57		= dword	ptr -57h
var_53		= dword	ptr -53h
var_4F		= dword	ptr -4Fh
var_47		= dword	ptr -47h
var_3E		= dword	ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A636F:
		sub	sp, 104h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	word ptr [si+8], ds
		mov	word ptr [si+6], 30DAh
		lea	ax, [bp+var_B4]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_B4], 2C8h
		mov	[bp+var_53], 100h
		mov	[bp+var_57], 0
		mov	[bp+var_B4], 2E0h
		mov	[bp+var_38], 0
		xor	ax, ax
		mov	[bp+var_3A], ax
		movsx	eax, ax
		mov	[bp+var_4F], eax
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aObjects	; "OBJECTS"
		lea	ax, [bp+var_104]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	large 4B4F4D53h
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jnz	short loc_A63F3

loc_A63F0:
		jmp	loc_A6656
; ���������������������������������������������������������������������������

loc_A63F3:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+82j
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B4]
		push	ax

loc_A6400:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A640F
		jmp	loc_A6572
; ���������������������������������������������������������������������������

loc_A640F:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+9Ej
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+0Bh], ax
		lea	ax, [bp+var_B4]
		push	ax

loc_A6422:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+0Fh], ax
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+13h], ax
		push	seg seg327
		push	offset VROOMM_StubThunk_6CC33
		push	1
		push	word ptr [si+0Bh]
		push	large 2A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+0Dh], ax
		push	seg seg327
		push	offset VROOMM_StubThunk_6CC15
		push	11h
		push	word ptr [si+0Fh]
		push	large 0C0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+11h], ax

loc_A6471:
		cmp	word ptr [si+0Dh], 0
		jz	short loc_A647D
		cmp	word ptr [si+11h], 0
		jnz	short loc_A6486

loc_A647D:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+109j
		push	0B006h

loc_A6480:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A6486:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+10Fj
		push	1

loc_A6488:
		push	0
		push	2
		mov	ax, [si+13h]

loc_A648F:
		shl	ax, 2

loc_A6492:
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+2Bh], dx
		mov	[si+29h], ax
		mov	eax, [si+29h]
		mov	[si+2Dh], eax
		mov	word ptr [si+31h], 0
		mov	ax, [si+13h]
		imul	ax, 30h
		movzx	eax, ax
		mov	[bp+var_4], eax
		push	30E3h
		push	1
		push	0
		push	2
		push	eax
		push	5C44h

loc_A64D2:
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		mov	[si+17h], ax
		mov	[si+15h], dx
		mov	byte ptr [si+19h], 2
		mov	byte ptr [si+1Ah], 1

loc_A64F4:
		mov	dword ptr [si+1Bh], 0

loc_A64FC:
		mov	eax, [bp+var_4]

loc_A6500:
		mov	[si+1Bh], eax
		push	0
		mov	al, [si+19h]
		push	ax
		push	large dword ptr	[si+15h]
		push	5C44h

loc_A6511:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		xor	di, di
		jmp	short loc_A653A
; ���������������������������������������������������������������������������

loc_A6523:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+1D1j
		push	30h ; '0'
		push	ds
		push	offset word_72A30
		push	large [bp+var_C]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		inc	di
		add	word ptr [bp+var_C], 30h ; '0'

loc_A653A:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+1B5j
		cmp	[si+13h], di
		jg	short loc_A6523
		push	0
		mov	al, [si+19h]
		push	ax
		push	large dword ptr	[si+15h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[si+23h], dx
		mov	[si+21h], ax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 0FFD0h
		mov	[si+27h], ax
		mov	[si+25h], dx
		mov	word ptr [si+1Fh], 0
		mov	byte ptr [si+0Ah], 1

loc_A6572:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+A0j
		push	0

loc_A6574:
		push	large 45505954h
		lea	ax, [bp+var_B4]

loc_A657E:
		push	ax

loc_A657F:
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_A658E
		jmp	loc_A664A
; ���������������������������������������������������������������������������

loc_A658E:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+21Dj
		mov	di, [si+0Dh]
		mov	si, [si+11h]
		jmp	short loc_A6611
; ���������������������������������������������������������������������������

loc_A6596:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+2D0j
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_646DB
		pop	cx
		or	ax, ax
		jz	short loc_A6609
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		cmp	[bp+var_47], 4B4F4D53h
		jnz	short loc_A65BF
		mov	ax, 1
		jmp	short loc_A65C1
; ���������������������������������������������������������������������������

loc_A65BF:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+24Cj
		xor	ax, ax

loc_A65C1:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+251j
		or	ax, ax
		jz	short loc_A65D7

loc_A65C5:
		lea	ax, [bp+var_B4]
		push	ax
		push	di
		push	cs
		call	near ptr TextLabel_LoadFieldsExtended_A61D0
		add	sp, 4
		add	di, 2Ah	; '*'
		jmp	short loc_A65FC
; ���������������������������������������������������������������������������

loc_A65D7:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+257j
		cmp	[bp+var_47], 50414853h
		jnz	short loc_A65E6
		mov	ax, 1
		jmp	short loc_A65E8
; ���������������������������������������������������������������������������

loc_A65E6:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+273j
		xor	ax, ax

loc_A65E8:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+278j
		or	ax, ax
		jz	short loc_A65FC
		lea	ax, [bp+var_B4]
		push	ax
		push	si
		push	cs
		call	near ptr TextLabel_MeasureAndAllocate_A60AC
		add	sp, 4
		add	si, 0Ch

loc_A65FC:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+269j
					; MissionText_LoadAndFormatFromIFF_A636C+27Ej
		lea	ax, [bp+var_B4]
		push	ax

loc_A6601:
		call	ResourceRecord_ReleaseAndClear_64D25

loc_A6606:
		pop	cx

loc_A6607:
		jmp	short loc_A6611
; ���������������������������������������������������������������������������

loc_A6609:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+237j
		mov	eax, [bp+var_3E]

loc_A660D:
		mov	[bp+var_4F], eax

loc_A6611:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+228j
					; MissionText_LoadAndFormatFromIFF_A636C:loc_A6607j
		cmp	[bp+var_38], 0
		jnz	short loc_A6624
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_A6638
; ���������������������������������������������������������������������������

loc_A6624:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+2A9j
		mov	bx, [bp+var_38]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4F]
		jg	short loc_A6636
		mov	ax, 1
		jmp	short loc_A6638
; ���������������������������������������������������������������������������

loc_A6636:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+2C3j
		xor	ax, ax

loc_A6638:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+2B6j
					; MissionText_LoadAndFormatFromIFF_A636C+2C8j
		or	ax, ax
		jnz	short loc_A663F
		jmp	loc_A6596
; ���������������������������������������������������������������������������

loc_A663F:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+2CEj
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_A664A:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+21Fj
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		jmp	short loc_A665E
; ���������������������������������������������������������������������������

loc_A6656:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C:loc_A63F0j
		push	0B007h
		call	VROOMM_StubThunk_6B70F

loc_A665E:				; CODE XREF: MissionText_LoadAndFormatFromIFF_A636C+2E8j
		pop	cx
		mov	[bp+var_B4], 2E0h
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_B4]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si

locret_A6681:
		leave
		retf
MissionText_LoadAndFormatFromIFF_A636C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue un petit tampon (sub_658).
; ==============================================================================================
TextLabel_AllocateSmallBuffer_A6683	proc far		; CODE XREF: VROOMM_StubThunk_6CC15J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A669C
		push	0Ch

loc_A6690:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A66B3

loc_A669C:				; CODE XREF: TextLabel_AllocateSmallBuffer_A6683+9j
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0

loc_A66B3:				; CODE XREF: TextLabel_AllocateSmallBuffer_A6683+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextLabel_AllocateSmallBuffer_A6683	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_3CAAA et libération de l'objet (sub_338).
; ==============================================================================================
TextLabel_ReleaseAndDestruct_A66B8	proc far		; CODE XREF: VROOMM_StubThunk_6CC10J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_A66C3:
		or	si, si
		jz	short loc_A66E1
		push	0
		push	si
		call	WorldObject_BaseDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_A66E1
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_A66E1:				; CODE XREF: TextLabel_ReleaseAndDestruct_A66B8+Dj
					; TextLabel_ReleaseAndDestruct_A66B8+1Ej
		pop	di
		pop	si
		pop	bp
		retf
TextLabel_ReleaseAndDestruct_A66B8	endp

seg450		ends
