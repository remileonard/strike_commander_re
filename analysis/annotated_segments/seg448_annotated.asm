seg448		segment	para public 'OVERLAY' use16
		assume cs:seg448
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, remet à zéro 3 champs (+4/+8/+0xC) et deux indicateurs globaux (byte_6FFAC/6FFB1) —
; réinitialisation d'un composant joueur.
; ==============================================================================================
PlayerComponent_ResetFields_A4B10	proc far		; CODE XREF: VROOMM_StubThunk_6CB0AJ PlayerComponent_ResetFieldsWrapper_A4B33+9p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_6FFAC, 0
		mov	byte_6FFB1, 0

loc_A4B21:
		xor	eax, eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		pop	si
		pop	bp
		retf
PlayerComponent_ResetFields_A4B10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_ResetFields_A4B10.
; ==============================================================================================
PlayerComponent_ResetFieldsWrapper_A4B33	proc far		; CODE XREF: VROOMM_StubThunk_6CB0FJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetFields_A4B10
		pop	cx
		mov	bx, [si]

loc_A4B42:
		mov	ax, [bp+arg_2]

loc_A4B45:
		mov	[bx+2],	ax
		pop	si
		pop	bp

locret_A4B4A:
		retf
PlayerComponent_ResetFieldsWrapper_A4B33	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_Helper_A4B4B	proc far		; CODE XREF: VROOMM_StubThunk_6CB05J PlayerComponent_LoadFieldsWithRetryK_A55D0+23p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A4B4C:
		mov	bp, sp
		push	si
		push	di

loc_A4B50:
		mov	si, [bp+arg_0]

loc_A4B53:
		mov	di, [bp+arg_2]

loc_A4B56:
		add	di, 4
		mov	eax, [di]
		mov	[si+4],	eax
		mov	eax, [di+4]
		mov	[si+8],	eax
		mov	eax, [di+8]
		mov	[si+0Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_Helper_A4B4B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise un sous-objet composite (sub_6CAC0, motif seg109) et appelle
; PlayerComponent_ResetFieldsB_A4B98.
; ==============================================================================================
PlayerComponentVariantT_ConstructAndInit_A4B74	proc far		; CODE XREF: VROOMM_StubThunk_6CB14J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]

loc_A4B82:
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_ResetFieldsB_A4B98
		add	sp, 4

loc_A4B94:
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponentVariantT_ConstructAndInit_A4B74	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_ResetFields_A4B10.
; ==============================================================================================
PlayerComponent_ResetFieldsB_A4B98	proc far		; CODE XREF: VROOMM_StubThunk_6CB00J PlayerComponentVariantT_ConstructAndInit_A4B74+1Ap	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr PlayerComponent_ResetFields_A4B10
		pop	cx
		pop	bp
		retf
PlayerComponent_ResetFieldsB_A4B98	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_HelperB_A4BA6	proc far		; CODE XREF: VROOMM_StubThunk_6CB1EJ PlayerComponent_LoadFieldsWithRetryG_A4F01+35p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+10h]
		mov	[si+10h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_HelperB_A4BA6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise un sous-objet composite (sub_6CAC0) et appelle
; PlayerComponent_LoadFieldsWithRetryF_A4BE1.
; ==============================================================================================
PlayerComponentVariantU_ConstructAndInit_A4BBD	proc far		; CODE XREF: VROOMM_StubThunk_6CB23J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr AircraftDynamics_ReadAtmoChunk_A4BE1
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponentVariantU_ConstructAndInit_A4BBD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg448. Lecteur du chunk 'ATMO' de la hierarchie FORM DYNM (erreur 0xA002 si absent).
; Zeroe [si+4/8/0xC] ; ResourceRecord_SeekAndRead('ATMO') + sub_64A7E (u32) -> [si+0x10]. Puis
; si dword_72A0A==0 : lit un bloc supplementaire et POSE dword_72A0A = id du modele
; d'atmosphere (global, partage par tous les avions ; seul le 1er avion le fixe). dword_72A0A
; sert de cle a Aero_ResolveAeroCoeffTable (courbe Cd/Cl vs vitesse-air, via registre de
; handlers Memory_TypedAllocDispatchB_5C832). Chaine : sub_A5280 -> sub_A4B98 ->
; AircraftDynamics_ReadAtmoChunk_A4BE1 -> sub_A52B8. Detail: DATA_MODEL.md 6.2.
; ==============================================================================================
AircraftDynamics_ReadAtmoChunk_A4BE1	proc far		; CODE XREF: VROOMM_StubThunk_6CB19J PlayerComponentVariantU_ConstructAndInit_A4BBD+1Ap	...

var_72		= word ptr -72h
var_15		= dword	ptr -15h
var_11		= dword	ptr -11h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		xor	eax, eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		mov	ax, si
		add	ax, 4
		push	0
		push	large 'OMTA'    ; ATMO
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A4C29
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+10h], eax
		jmp	short loc_A4C32
; ���������������������������������������������������������������������������

loc_A4C29:				; CODE XREF: AircraftDynamics_ReadAtmoChunk_A4BE1+35j
		push	0A002h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A4C32:				; CODE XREF: AircraftDynamics_ReadAtmoChunk_A4BE1+46j
		cmp	dword_72A0A, 0
		jz	short loc_A4C3D
		jmp	loc_A4CF7
; ���������������������������������������������������������������������������

loc_A4C3D:				; CODE XREF: AircraftDynamics_ReadAtmoChunk_A4BE1+57j
		lea	ax, [bp+var_72]
		push	ax

loc_A4C41:
		call	StreamReader_ConstructVariantA_63A39
		pop	cx

loc_A4C47:
		mov	[bp+var_72], 2C8h

loc_A4C4C:
		mov	[bp+var_11], 100h

loc_A4C54:
		mov	[bp+var_15], 0
		mov	[bp+var_72], 138Ah
		push	1
		push	2F46h
		lea	ax, [bp+var_72]
		push	ax
		mov	bx, [bp+var_72]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_72]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx

loc_A4C81:
		mov	[bp+var_4], eax

loc_A4C85:
		mov	[bp+var_8], eax
		push	1
		push	0

loc_A4C8D:
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	dword_72A0A, eax
		mov	byte_72A0E, 2
		mov	byte_72A0F, 1
		mov	dword_72A10, 0
		mov	eax, [bp+var_8]
		mov	dword_72A10, eax
		push	0
		mov	al, byte_72A0E
		push	ax
		push	large [dword_72A0A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		call	Handle_ReadAndOffsetField_63580
		add	sp, 6
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4

loc_A4CF7:				; CODE XREF: AircraftDynamics_ReadAtmoChunk_A4BE1+59j
		pop	di
		pop	si
		leave
		retf
AircraftDynamics_ReadAtmoChunk_A4BE1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 95 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACA).
; ==============================================================================================
PlayerComponentVariantV_ConstructAndInit_A4CFB	proc far		; CODE XREF: VROOMM_StubThunk_6CB32J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	3Bh ; ';'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A4D7A

loc_A4D10:
		add	ax, 1Ah

loc_A4D13:
		mov	[si], ax
		mov	ax, si

loc_A4D17:
		add	ax, 1Ah
		mov	[si+4],	ax

loc_A4D1D:
		mov	word ptr [si+18h], 0

loc_A4D22:
		mov	word ptr [si+1Ah], 223Ah
		mov	ax, si
		add	ax, 1Ah

loc_A4D2C:
		push	ax

loc_A4D2D:
		call	VROOMM_StubThunk_6CACA

loc_A4D32:
		pop	cx

loc_A4D33:
		mov	bx, [si]

loc_A4D35:
		sub	word ptr [bx-2], 14h
		mov	word ptr [si+2], 2042h

loc_A4D3E:
		mov	word ptr [bx], 205Eh

loc_A4D42:
		add	word ptr [bx-2], 14h

loc_A4D46:
		mov	word ptr [si+6], 21CEh

loc_A4D4B:
		mov	bx, [si+4]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	word ptr [si+2], 1E56h
		mov	word ptr [si+6], 1E72h
		mov	bx, [si]
		mov	word ptr [bx], 1E8Eh
		mov	ax, si
		jmp	short loc_A4D7C
; ���������������������������������������������������������������������������

loc_A4D7A:				; CODE XREF: PlayerComponentVariantV_ConstructAndInit_A4CFB+13j
		mov	ax, si

loc_A4D7C:				; CODE XREF: PlayerComponentVariantV_ConstructAndInit_A4CFB+7Dj
		mov	si, ax
		or	si, si
		jz	short loc_A4D86
		mov	ax, [si]
		jmp	short loc_A4D88
; ���������������������������������������������������������������������������

loc_A4D86:				; CODE XREF: PlayerComponentVariantV_ConstructAndInit_A4CFB+85j
		mov	ax, si

loc_A4D88:				; CODE XREF: PlayerComponentVariantV_ConstructAndInit_A4CFB+89j
		pop	si
		pop	bp
		retf
PlayerComponentVariantV_ConstructAndInit_A4CFB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 87 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACF).
; ==============================================================================================
PlayerComponentVariantW_ConstructAndInit_A4D8B	proc far		; CODE XREF: VROOMM_StubThunk_6CB37J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	3Bh ; ';'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_A4DAC
		jmp	loc_A4E2F
; ���������������������������������������������������������������������������

loc_A4DAC:				; CODE XREF: PlayerComponentVariantW_ConstructAndInit_A4D8B+1Cj
		add	ax, 1Ah
		mov	[si], ax
		mov	ax, si
		add	ax, 1Ah
		mov	[si+4],	ax
		mov	word ptr [si+18h], 0
		mov	word ptr [si+1Ah], 223Ah
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [si]
		sub	word ptr [bx-2], 14h
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 14h
		mov	word ptr [si+6], 21CEh
		mov	bx, [si+4]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	word ptr [si+2], 1E56h
		mov	word ptr [si+6], 1E72h

loc_A4E11:
		mov	bx, [si]
		mov	word ptr [bx], 1E8Eh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax

loc_A4E26:
		mov	ax, si
		add	ax, 8
		mov	ax, si
		jmp	short loc_A4E31
; ���������������������������������������������������������������������������

loc_A4E2F:				; CODE XREF: PlayerComponentVariantW_ConstructAndInit_A4D8B+1Ej
		mov	ax, si

loc_A4E31:				; CODE XREF: PlayerComponentVariantW_ConstructAndInit_A4D8B+A2j
		mov	si, ax
		or	si, si
		jz	short loc_A4E3B
		mov	ax, [si]
		jmp	short loc_A4E3D
; ���������������������������������������������������������������������������

loc_A4E3B:				; CODE XREF: PlayerComponentVariantW_ConstructAndInit_A4D8B+AAj
		mov	ax, si

loc_A4E3D:				; CODE XREF: PlayerComponentVariantW_ConstructAndInit_A4D8B+AEj
		pop	si
		leave
		retf
PlayerComponentVariantW_ConstructAndInit_A4D8B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 105 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACF), appelle PlayerComponent_LoadFieldsWithRetryG_A4F01.
; ==============================================================================================
PlayerComponentVariantX_ConstructAndInit_A4E40	proc far		; CODE XREF: VROOMM_StubThunk_6CB3CJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A4E41:
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di

loc_A4E48:
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	3Bh ; ';'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_A4E62
		jmp	loc_A4EE5
; ���������������������������������������������������������������������������

loc_A4E62:				; CODE XREF: PlayerComponentVariantX_ConstructAndInit_A4E40+1Dj
		add	ax, 1Ah
		mov	[di], ax
		mov	ax, di
		add	ax, 1Ah
		mov	[di+4],	ax
		mov	word ptr [di+18h], 0
		mov	word ptr [di+1Ah], 223Ah
		push	[bp+var_2]
		mov	ax, di
		add	ax, 1Ah
		push	ax
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [di]
		sub	word ptr [bx-2], 14h
		mov	word ptr [di+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 14h
		mov	word ptr [di+6], 21CEh
		mov	bx, [di+4]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[di+10h], eax
		mov	[di+0Ch], eax
		mov	[di+8],	eax
		mov	ax, di
		add	ax, 8
		mov	word ptr [di+2], 1E56h

loc_A4EC2:
		mov	word ptr [di+6], 1E72h
		mov	bx, [di]

loc_A4EC9:
		mov	word ptr [bx], 1E8Eh

loc_A4ECD:
		xor	eax, eax

loc_A4ED0:
		mov	[di+10h], eax

loc_A4ED4:
		mov	[di+0Ch], eax
		mov	[di+8],	eax
		mov	ax, di
		add	ax, 8
		mov	ax, di
		jmp	short loc_A4EE7
; ���������������������������������������������������������������������������

loc_A4EE5:				; CODE XREF: PlayerComponentVariantX_ConstructAndInit_A4E40+1Fj
		mov	ax, di

loc_A4EE7:				; CODE XREF: PlayerComponentVariantX_ConstructAndInit_A4E40+A3j
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryG_A4F01
		add	sp, 4
		or	di, di
		jz	short loc_A4EFB
		mov	ax, [di]
		jmp	short loc_A4EFD
; ���������������������������������������������������������������������������

loc_A4EFB:				; CODE XREF: PlayerComponentVariantX_ConstructAndInit_A4E40+B5j
		mov	ax, di

loc_A4EFD:				; CODE XREF: PlayerComponentVariantX_ConstructAndInit_A4E40+B9j
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantX_ConstructAndInit_A4E40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC5 (sous-objet composite) et PlayerComponent_HelperB_A4BA6.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryG_A4F01	proc far		; CODE XREF: VROOMM_StubThunk_6CB28J PlayerComponentVariantX_ConstructAndInit_A4E40+ADp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_A4F14

loc_A4F10:
		mov	ax, [di]
		jmp	short loc_A4F16
; ���������������������������������������������������������������������������

loc_A4F14:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryG_A4F01+Dj
		mov	ax, di

loc_A4F16:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryG_A4F01+11j
		push	ax
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		or	di, di

loc_A4F23:
		jz	short loc_A4F2C
		mov	ax, di
		add	ax, 4
		jmp	short loc_A4F2E
; ���������������������������������������������������������������������������

loc_A4F2C:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryG_A4F01:loc_A4F23j
		mov	ax, di

loc_A4F2E:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryG_A4F01+29j
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr PlayerComponent_HelperB_A4BA6
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryG_A4F01	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise sous-objet composite (sub_6CAC0), appelle
; PlayerComponent_LoadFieldsWithRetryF_A4BE1.
; ==============================================================================================
PlayerComponentVariantY_ConstructAndInit_A4F40	proc far		; CODE XREF: VROOMM_StubThunk_6CB2DJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A4F43:
		push	si

loc_A4F44:
		push	di
		mov	si, [bp+arg_0]

loc_A4F48:
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]

loc_A4F4E:
		call	VROOMM_StubThunk_6CAC0

loc_A4F53:
		add	sp, 4

loc_A4F56:
		push	di

loc_A4F57:
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr AircraftDynamics_ReadAtmoChunk_A4BE1
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponentVariantY_ConstructAndInit_A4F40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 80 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACA).
; ==============================================================================================
PlayerComponentVariantZ_ConstructAndInit_A4F68	proc far		; CODE XREF: VROOMM_StubThunk_6CB55J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	4Ah ; 'J'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A4FEF
		add	ax, 36h	; '6'

loc_A4F80:
		mov	[si], ax

loc_A4F82:
		mov	ax, si

loc_A4F84:
		add	ax, 13h
		mov	[si+36h], ax
		mov	ax, si
		add	ax, 13h
		mov	[si+2],	ax
		mov	word ptr [si+11h], 0
		mov	word ptr [si+34h], 0
		mov	word ptr [si+13h], 223Ah
		mov	ax, si
		add	ax, 13h
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si+2]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+38h], 21CEh
		mov	bx, [si+36h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+42h], eax

loc_A4FC7:
		mov	[si+3Eh], eax
		mov	[si+3Ah], eax

loc_A4FCF:
		mov	ax, si
		add	ax, 3Ah	; ':'
		mov	bx, [si+2]
		add	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+4], 1FB6h
		mov	word ptr [bx], 1FD6h
		mov	bx, [si]
		mov	word ptr [bx+2], 2026h
		mov	ax, si
		jmp	short loc_A4FF1
; ���������������������������������������������������������������������������

loc_A4FEF:				; CODE XREF: PlayerComponentVariantZ_ConstructAndInit_A4F68+13j
		mov	ax, si

loc_A4FF1:				; CODE XREF: PlayerComponentVariantZ_ConstructAndInit_A4F68+85j
		mov	si, ax
		or	si, si
		jz	short loc_A4FFC
		mov	ax, [si+2]
		jmp	short loc_A4FFE
; ���������������������������������������������������������������������������

loc_A4FFC:				; CODE XREF: PlayerComponentVariantZ_ConstructAndInit_A4F68+8Dj
		mov	ax, si

loc_A4FFE:				; CODE XREF: PlayerComponentVariantZ_ConstructAndInit_A4F68+92j
		pop	si
		pop	bp
		retf
PlayerComponentVariantZ_ConstructAndInit_A4F68	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 106 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACF).
; ==============================================================================================
PlayerComponentVariantAA_ConstructAndInit_A5001	proc far		; CODE XREF: VROOMM_StubThunk_6CB5AJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	4Ah ; 'J'

loc_A5013:
		call	CRT_Malloc16_Retry

loc_A5018:
		pop	cx
		mov	si, ax
		or	ax, ax

loc_A501D:
		jnz	short loc_A5022
		jmp	loc_A50AD
; ���������������������������������������������������������������������������

loc_A5022:				; CODE XREF: PlayerComponentVariantAA_ConstructAndInit_A5001:loc_A501Dj
		add	ax, 36h	; '6'
		mov	[si], ax
		mov	ax, si

loc_A5029:
		add	ax, 13h
		mov	[si+36h], ax
		mov	ax, si
		add	ax, 13h
		mov	[si+2],	ax
		mov	word ptr [si+11h], 0
		mov	word ptr [si+34h], 0

loc_A5041:
		mov	word ptr [si+13h], 223Ah

loc_A5046:
		push	[bp+var_2]
		mov	ax, si

loc_A504B:
		add	ax, 13h
		push	ax
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [si+2]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+38h], 21CEh
		mov	bx, [si+36h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+42h], eax
		mov	[si+3Eh], eax
		mov	[si+3Ah], eax
		mov	ax, si
		add	ax, 3Ah	; ':'
		mov	bx, [si+2]
		add	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+4], 1FB6h
		mov	word ptr [bx], 1FD6h

loc_A508E:
		mov	bx, [si]

loc_A5090:
		mov	word ptr [bx+2], 2026h
		xor	eax, eax

loc_A5098:
		mov	[bx+0Ch], eax
		mov	[bx+8],	eax
		mov	[bx+4],	eax
		mov	ax, [si]
		add	ax, 4
		mov	ax, si
		jmp	short loc_A50AF
; ���������������������������������������������������������������������������

loc_A50AD:				; CODE XREF: PlayerComponentVariantAA_ConstructAndInit_A5001+1Ej
		mov	ax, si

loc_A50AF:				; CODE XREF: PlayerComponentVariantAA_ConstructAndInit_A5001+AAj
		mov	si, ax
		or	si, si
		jz	short loc_A50BA
		mov	ax, [si+2]
		jmp	short loc_A50BC
; ���������������������������������������������������������������������������

loc_A50BA:				; CODE XREF: PlayerComponentVariantAA_ConstructAndInit_A5001+B2j
		mov	ax, si

loc_A50BC:				; CODE XREF: PlayerComponentVariantAA_ConstructAndInit_A5001+B7j
		pop	si
		leave
		retf
PlayerComponentVariantAA_ConstructAndInit_A5001	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 132 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACF), appelle PlayerComponent_LoadFieldsWithRetryH_A51B2.
; ==============================================================================================
PlayerComponentVariantAB_ConstructAndInit_A50BF	proc far		; CODE XREF: VROOMM_StubThunk_6CB5FJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A50C2:
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A50CA:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	4Ah ; 'J'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_A50E1
		jmp	loc_A516C
; ���������������������������������������������������������������������������

loc_A50E1:				; CODE XREF: PlayerComponentVariantAB_ConstructAndInit_A50BF+1Dj
		add	ax, 36h	; '6'
		mov	[di], ax
		mov	ax, di
		add	ax, 13h
		mov	[di+36h], ax
		mov	ax, di
		add	ax, 13h

loc_A50F3:
		mov	[di+2],	ax

loc_A50F6:
		mov	word ptr [di+11h], 0

loc_A50FB:
		mov	word ptr [di+34h], 0

loc_A5100:
		mov	word ptr [di+13h], 223Ah

loc_A5105:
		push	[bp+var_2]
		mov	ax, di
		add	ax, 13h
		push	ax
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [di+2]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [di+38h], 21CEh

loc_A5122:
		mov	bx, [di+36h]

loc_A5125:
		mov	word ptr [bx], 21EAh

loc_A5129:
		xor	eax, eax
		mov	[di+42h], eax

loc_A5130:
		mov	[di+3Eh], eax

loc_A5134:
		mov	[di+3Ah], eax
		mov	ax, di
		add	ax, 3Ah	; ':'
		mov	bx, [di+2]

loc_A5140:
		add	word ptr [bx-2], 0FFC7h
		mov	word ptr [di+4], 1FB6h
		mov	word ptr [bx], 1FD6h
		mov	bx, [di]
		mov	word ptr [bx+2], 2026h
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8],	eax
		mov	[bx+4],	eax
		mov	ax, [di]
		add	ax, 4
		mov	ax, di
		jmp	short loc_A516E
; ���������������������������������������������������������������������������

loc_A516C:				; CODE XREF: PlayerComponentVariantAB_ConstructAndInit_A50BF+1Fj
		mov	ax, di

loc_A516E:				; CODE XREF: PlayerComponentVariantAB_ConstructAndInit_A50BF+ABj
		mov	di, ax
		push	si
		push	ax
		nop

loc_A5173:
		push	cs

loc_A5174:
		call	near ptr PlayerComponent_LoadFieldsWithRetryH_A51B2
		add	sp, 4
		or	di, di

loc_A517C:
		jz	short loc_A5183

loc_A517E:
		mov	ax, [di+2]

loc_A5181:
		jmp	short loc_A5185
; ���������������������������������������������������������������������������

loc_A5183:				; CODE XREF: PlayerComponentVariantAB_ConstructAndInit_A50BF:loc_A517Cj
		mov	ax, di

loc_A5185:				; CODE XREF: PlayerComponentVariantAB_ConstructAndInit_A50BF:loc_A5181j
		pop	di
		pop	si

locret_A5187:
		leave
		retf
PlayerComponentVariantAB_ConstructAndInit_A50BF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_HelperC_A5189	proc far		; CODE XREF: VROOMM_StubThunk_6CB46J PlayerComponent_LoadFieldsWithRetryH_A51B2+39p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A518C:
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A5191:
		mov	di, [bp+arg_2]
		mov	eax, [di+0Ah]
		mov	[si+0Ah], eax
		mov	al, [di+0Eh]
		mov	[si+0Eh], al
		mov	al, [di+0Fh]
		mov	[si+0Fh], al
		mov	al, [di+10h]
		mov	[si+10h], al
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_HelperC_A5189	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC5, PlayerComponent_HelperB_A4BA6, PlayerComponent_HelperC_A5189.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryH_A51B2	proc far		; CODE XREF: VROOMM_StubThunk_6CB4BJ
					; PlayerComponentVariantAB_ConstructAndInit_A50BF:loc_A5174p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_A51C6
		mov	ax, [di+2]
		jmp	short loc_A51C8
; ���������������������������������������������������������������������������

loc_A51C6:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryH_A51B2+Dj
		mov	ax, di

loc_A51C8:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryH_A51B2+12j
		push	ax

loc_A51C9:
		push	word ptr [si+2]
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		or	di, di
		jz	short loc_A51DC
		mov	ax, [di]
		jmp	short loc_A51DE
; ���������������������������������������������������������������������������

loc_A51DC:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryH_A51B2+24j
		mov	ax, di

loc_A51DE:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryH_A51B2+28j
		push	ax
		push	word ptr [si]
		push	cs
		call	near ptr PlayerComponent_HelperB_A4BA6
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr PlayerComponent_HelperC_A5189
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryH_A51B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise sous-objet composite (sub_6CAC0), combine
; PlayerComponent_LoadFieldsWithRetryF_A4BE1 et PlayerComponent_LoadFieldsWithRetryI_A5224.
; ==============================================================================================
PlayerComponentVariantAC_ConstructAndInit_A51F5	proc far		; CODE XREF: VROOMM_StubThunk_6CB50J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A51F6:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A51FD:
		mov	di, [bp+arg_2]
		push	di

loc_A5201:
		push	word ptr [si+2]

loc_A5204:
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4

loc_A520C:
		push	di

loc_A520D:
		push	word ptr [si]
		push	cs

loc_A5210:
		call	near ptr AircraftDynamics_ReadAtmoChunk_A4BE1

loc_A5213:
		add	sp, 4
		push	di

loc_A5217:
		push	si
		nop
		push	cs
		call	near ptr AircraftDynamics_ReadThrustChunk_A5224
		add	sp, 4
		pop	di

loc_A5221:
		pop	si
		pop	bp

locret_A5223:
		retf
PlayerComponentVariantAC_ConstructAndInit_A51F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg449 (appele via sub_6CB41 VROOMM et sub_A51F5). LECTEUR DU CHUNK 'THRS' de la
; hierarchie JETP. ResourceRecord_SeekAndRead('THRS') ; sub_64A7E (ReadFieldGroupC u32) ->
; [si+0x0A] = POUSSEE MAX (24.8, N) ; puis 3x sub_64B51 (u8) -> [si+0x0E], [si+0x0F],
; [si+0x10] = 3 parametres (usage non trace, alimentent la courbe manette->poussee
; Aero_ComputeCoeffSaturating(&jdyn[0x22])). Detail : analysis/DATA_MODEL.md 6.2 item 5.
; ==============================================================================================
AircraftDynamics_ReadThrustChunk_A5224	proc far		; CODE XREF: VROOMM_StubThunk_6CB41J PlayerComponentVariantAC_ConstructAndInit_A51F5+25p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A5227:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 'SRHT'    ; THRS
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax

loc_A5242:
		jz	short loc_A5273
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0Ah], eax
		push	di

loc_A5254:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+0Eh], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+0Fh], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+10h], al
		jmp	short loc_A527C
; ���������������������������������������������������������������������������

loc_A5273:				; CODE XREF: AircraftDynamics_ReadThrustChunk_A5224:loc_A5242j
		push	0A003h

loc_A5276:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A527C:				; CODE XREF: AircraftDynamics_ReadThrustChunk_A5224+4Dj
		pop	di
		pop	si
		pop	bp

locret_A527F:
		retf
AircraftDynamics_ReadThrustChunk_A5224	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise sous-objet composite (sub_6CAC0), combine
; PlayerComponent_ResetFieldsB_A4B98, PlayerComponent_LoadFieldsWithRetryF_A4BE1,
; PlayerComponent_LoadFieldsWithRetryJ_A52B8.
; ==============================================================================================
PlayerComponentVariantAD_ConstructAndInit_A5280	proc far		; CODE XREF: VROOMM_StubThunk_6CB78J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A5281:
		mov	bp, sp

loc_A5283:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di

loc_A528C:
		push	word ptr [si]

loc_A528E:
		call	VROOMM_StubThunk_6CAC0

loc_A5293:
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetFieldsB_A4B98
		add	sp, 4
		push	di
		push	word ptr [si+10h]
		push	cs
		call	near ptr AircraftDynamics_ReadAtmoChunk_A4BE1
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr AircraftDynamics_ReadStblChunk_A52B8
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponentVariantAD_ConstructAndInit_A5280	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg449. Lecteur du chunk 'STBL' de la hierarchie FORM DYNM (erreur 0xA004 si absent).
; sub_A52FD (helper) puis ResourceRecord_SeekAndRead('STBL', FourCC ASM 0x4C425453) +
; sub_64A7E (u32) -> [si+0x12]. [si+0x12] = jdyn[0x12] = COEFF DE STABILITE / AUTORITE DE
; TANGAGE : echelle q' dans Aero_ComputeForcesMain (q' = q * jdyn[0x12] / 100). Detail:
; DATA_MODEL.md 6.2.
; ==============================================================================================
AircraftDynamics_ReadStblChunk_A52B8	proc far		; CODE XREF: VROOMM_StubThunk_6CB64J PlayerComponentVariantAD_ConstructAndInit_A5280+2Ep

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si

loc_A52C4:
		nop
		push	cs

loc_A52C6:
		call	near ptr PlayerComponent_HelperD_A52FD
		pop	cx

loc_A52CA:
		push	0
		push	large 4C425453h

loc_A52D2:
		push	di

loc_A52D3:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A52F0
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+12h], eax
		jmp	short loc_A52F9
; ���������������������������������������������������������������������������

loc_A52F0:				; CODE XREF: AircraftDynamics_ReadStblChunk_A52B8+25j
		push	0A004h

loc_A52F3:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A52F9:				; CODE XREF: AircraftDynamics_ReadStblChunk_A52B8+36j
		pop	di
		pop	si
		pop	bp

locret_A52FC:
		retf
AircraftDynamics_ReadStblChunk_A52B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_HelperD_A52FD	proc far		; CODE XREF: VROOMM_StubThunk_6CB73J
					; AircraftDynamics_ReadStblChunk_A52B8:loc_A52C6p	...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]

loc_A5307:
		mov	[bp+var_4], 0

loc_A530F:
		mov	eax, [bp+var_4]

loc_A5313:
		mov	[si+16h], eax
		mov	[bp+var_8], 0

loc_A531F:
		mov	eax, [bp+var_8]
		mov	[si+1Ah], eax
		pop	si
		leave
		retf
PlayerComponent_HelperD_A52FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 115 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACA), combine PlayerComponent_ResetFields_A4B10 et PlayerComponent_HelperD_A52FD.
; ==============================================================================================
PlayerComponentVariantAE_ConstructAndInit_A532A	proc far		; CODE XREF: VROOMM_StubThunk_6CB7DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	57h ; 'W'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_A5342

loc_A533F:
		jmp	loc_A53D2
; ���������������������������������������������������������������������������

loc_A5342:				; CODE XREF: PlayerComponentVariantAE_ConstructAndInit_A532A+13j
		add	ax, 20h	; ' '

loc_A5345:
		mov	[si], ax

loc_A5347:
		mov	ax, si
		add	ax, 43h	; 'C'

loc_A534C:
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 20h	; ' '
		mov	[si+43h], ax
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+41h], 0
		mov	word ptr [si+20h], 223Ah
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx

loc_A5372:
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h

loc_A5378:
		mov	word ptr [si+45h], 21CEh
		mov	bx, [si+43h]

loc_A5380:
		mov	word ptr [bx], 21EAh

loc_A5384:
		xor	eax, eax
		mov	[si+4Fh], eax

loc_A538B:
		mov	[si+4Bh], eax

loc_A538F:
		mov	[si+47h], eax

loc_A5393:
		mov	ax, si

loc_A5395:
		add	ax, 47h	; 'G'
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 20AEh
		mov	word ptr [bx], 20DEh
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetFields_A4B10
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 212Eh
		mov	word ptr [bx], 2162h

loc_A53C0:
		mov	bx, [si+10h]

loc_A53C3:
		mov	word ptr [bx+2], 21B2h
		push	si
		push	cs
		call	near ptr PlayerComponent_HelperD_A52FD
		pop	cx
		mov	ax, si
		jmp	short loc_A53D4
; ���������������������������������������������������������������������������

loc_A53D2:				; CODE XREF: PlayerComponentVariantAE_ConstructAndInit_A532A:loc_A533Fj
		mov	ax, si

loc_A53D4:				; CODE XREF: PlayerComponentVariantAE_ConstructAndInit_A532A+A6j
		mov	si, ax
		or	si, si
		jz	short loc_A53DE
		mov	ax, [si]
		jmp	short loc_A53E0
; ���������������������������������������������������������������������������

loc_A53DE:				; CODE XREF: PlayerComponentVariantAE_ConstructAndInit_A532A+AEj
		mov	ax, si

loc_A53E0:				; CODE XREF: PlayerComponentVariantAE_ConstructAndInit_A532A+B2j
		pop	si
		pop	bp
		retf
PlayerComponentVariantAE_ConstructAndInit_A532A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 130 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise sous-objet composite
; (sub_6CACF), combine PlayerComponent_ResetFields_A4B10 (×2) et
; PlayerComponent_HelperD_A52FD.
; ==============================================================================================
PlayerComponentVariantAF_ConstructAndInit_A53E3	proc far		; CODE XREF: VROOMM_StubThunk_6CB82J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	57h ; 'W'
		call	CRT_Malloc16_Retry

loc_A53FA:
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_A5404

loc_A5401:
		jmp	loc_A54B7
; ���������������������������������������������������������������������������

loc_A5404:				; CODE XREF: PlayerComponentVariantAF_ConstructAndInit_A53E3+1Cj
		add	ax, 20h	; ' '
		mov	[si], ax
		mov	ax, si

loc_A540B:
		add	ax, 43h	; 'C'
		mov	[si+10h], ax
		mov	ax, si

loc_A5413:
		add	ax, 20h	; ' '
		mov	[si+43h], ax
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+41h], 0

loc_A5423:
		mov	word ptr [si+20h], 223Ah
		push	[bp+var_2]
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax

loc_A5431:
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+45h], 21CEh
		mov	bx, [si+43h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax

loc_A544E:
		mov	[si+4Fh], eax

loc_A5452:
		mov	[si+4Bh], eax

loc_A5456:
		mov	[si+47h], eax
		mov	ax, si
		add	ax, 47h	; 'G'
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 20AEh
		mov	word ptr [bx], 20DEh
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetFields_A4B10
		pop	cx
		mov	bx, [si]

loc_A547A:
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 212Eh
		mov	word ptr [bx], 2162h

loc_A5487:
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 21B2h

loc_A548F:
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetFields_A4B10
		pop	cx
		mov	bx, [si+10h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8],	eax
		mov	[bx+4],	eax
		mov	ax, [si+10h]
		add	ax, 4
		push	si
		push	cs
		call	near ptr PlayerComponent_HelperD_A52FD
		pop	cx
		mov	ax, si
		jmp	short loc_A54B9
; ���������������������������������������������������������������������������

loc_A54B7:				; CODE XREF: PlayerComponentVariantAF_ConstructAndInit_A53E3:loc_A5401j
		mov	ax, si

loc_A54B9:				; CODE XREF: PlayerComponentVariantAF_ConstructAndInit_A53E3+D2j
		mov	si, ax
		or	si, si
		jz	short loc_A54C3
		mov	ax, [si]

loc_A54C1:
		jmp	short loc_A54C5
; ���������������������������������������������������������������������������

loc_A54C3:				; CODE XREF: PlayerComponentVariantAF_ConstructAndInit_A53E3+DAj
		mov	ax, si

loc_A54C5:				; CODE XREF: PlayerComponentVariantAF_ConstructAndInit_A53E3:loc_A54C1j
		pop	si
		leave
		retf
PlayerComponentVariantAF_ConstructAndInit_A53E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 152 lignes, NON DÉTAILLÉE — la plus grosse variante de constructeur du segment :
; alloue (sub_658), initialise sous-objet composite (sub_6CACF), combine
; PlayerComponent_ResetFields_A4B10 (×2), PlayerComponent_HelperD_A52FD et
; PlayerComponent_LoadFieldsWithRetryK_A55D0.
; ==============================================================================================
PlayerComponentVariantAG_ConstructAndInit_A54C8	proc far		; CODE XREF: VROOMM_StubThunk_6CB87J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	57h ; 'W'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_A54EA
		jmp	loc_A559D
; ���������������������������������������������������������������������������

loc_A54EA:				; CODE XREF: PlayerComponentVariantAG_ConstructAndInit_A54C8+1Dj
		add	ax, 20h	; ' '
		mov	[di], ax
		mov	ax, di
		add	ax, 43h	; 'C'

loc_A54F4:
		mov	[di+10h], ax

loc_A54F7:
		mov	ax, di

loc_A54F9:
		add	ax, 20h	; ' '
		mov	[di+43h], ax

loc_A54FF:
		mov	word ptr [di+1Eh], 0

loc_A5504:
		mov	word ptr [di+41h], 0

loc_A5509:
		mov	word ptr [di+20h], 223Ah
		push	[bp+var_2]
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [di]

loc_A5521:
		sub	word ptr [bx-2], 0FFC7h

loc_A5525:
		mov	word ptr [di+45h], 21CEh
		mov	bx, [di+43h]

loc_A552D:
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[di+4Fh], eax
		mov	[di+4Bh], eax
		mov	[di+47h], eax
		mov	ax, di
		add	ax, 47h	; 'G'
		mov	bx, [di]

loc_A5547:
		add	word ptr [bx-2], 0FFC7h

loc_A554B:
		sub	word ptr [bx-2], 0Eh

loc_A554F:
		mov	word ptr [di+2], 20AEh
		mov	word ptr [bx], 20DEh
		push	di
		push	cs
		call	near ptr PlayerComponent_ResetFields_A4B10
		pop	cx
		mov	bx, [di]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [di+2], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [di+10h]

loc_A5570:
		mov	word ptr [bx+2], 21B2h
		push	di
		push	cs

loc_A5577:
		call	near ptr PlayerComponent_ResetFields_A4B10

loc_A557A:
		pop	cx
		mov	bx, [di+10h]
		xor	eax, eax

loc_A5581:
		mov	[bx+0Ch], eax

loc_A5585:
		mov	[bx+8],	eax

loc_A5589:
		mov	[bx+4],	eax

loc_A558D:
		mov	ax, [di+10h]
		add	ax, 4
		push	di

loc_A5594:
		push	cs
		call	near ptr PlayerComponent_HelperD_A52FD
		pop	cx
		mov	ax, di
		jmp	short loc_A559F
; ���������������������������������������������������������������������������

loc_A559D:				; CODE XREF: PlayerComponentVariantAG_ConstructAndInit_A54C8+1Fj
		mov	ax, di

loc_A559F:				; CODE XREF: PlayerComponentVariantAG_ConstructAndInit_A54C8+D3j
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryK_A55D0
		add	sp, 4
		or	di, di
		jz	short loc_A55B3
		mov	ax, [di]
		jmp	short loc_A55B5
; ���������������������������������������������������������������������������

loc_A55B3:				; CODE XREF: PlayerComponentVariantAG_ConstructAndInit_A54C8+E5j
		mov	ax, di

loc_A55B5:				; CODE XREF: PlayerComponentVariantAG_ConstructAndInit_A54C8+E9j
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantAG_ConstructAndInit_A54C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_HelperE_A55B9	proc far		; CODE XREF: VROOMM_StubThunk_6CB69J
					; PlayerComponent_LoadFieldsWithRetryK_A55D0:loc_A5612p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A55C1:
		mov	di, [bp+arg_2]
		mov	eax, [di+12h]
		mov	[si+12h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_HelperE_A55B9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC5, PlayerComponent_Helper_A4B4B, PlayerComponent_HelperB_A4BA6,
; PlayerComponent_HelperE_A55B9.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryK_A55D0	proc far		; CODE XREF: VROOMM_StubThunk_6CB6EJ PlayerComponentVariantAG_ConstructAndInit_A54C8+DDp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_A55D4:
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_A55E3
		mov	ax, [di]
		jmp	short loc_A55E5
; ���������������������������������������������������������������������������

loc_A55E3:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryK_A55D0+Dj
		mov	ax, di

loc_A55E5:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryK_A55D0+11j
		push	ax
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		push	di

loc_A55F1:
		push	si
		push	cs
		call	near ptr PlayerComponent_Helper_A4B4B

loc_A55F6:
		add	sp, 4
		or	di, di
		jz	short loc_A5602
		mov	ax, [di+10h]
		jmp	short loc_A5604
; ���������������������������������������������������������������������������

loc_A5602:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryK_A55D0+2Bj
		mov	ax, di

loc_A5604:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryK_A55D0+30j
		push	ax
		push	word ptr [si+10h]

loc_A5608:
		push	cs

loc_A5609:
		call	near ptr PlayerComponent_HelperB_A4BA6
		add	sp, 4
		push	di
		push	si
		push	cs

loc_A5612:
		call	near ptr PlayerComponent_HelperE_A55B9

loc_A5615:
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryK_A55D0	endp

seg448		ends
