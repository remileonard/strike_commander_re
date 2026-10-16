ovr271		segment	para public 'OVERLAY' use16
		assume cs:ovr271
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). FORM LINS / chunk VLIN →
; VROOMM_StubThunk_6B940 (AircraftComponent_LoadWithDwordFieldsB_952D0, non lu). Ex-
; MissionText_ReleaseSubrecordA.
; ==============================================================================================
Poly_LoadLINS_94BF0	proc far		; CODE XREF: VROOMM_StubThunk_6B8E5J Poly_BuildFaceElements_94C80+7Cp

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 534E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_94C35
		push	0
		push	large 4E494C56h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_94C2E
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B940
		add	sp, 6

loc_94C2E:				; CODE XREF: Poly_LoadLINS_94BF0+2Fj
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_94C35:				; CODE XREF: Poly_LoadLINS_94BF0+1Aj
		pop	si
		pop	bp
		retf
Poly_LoadLINS_94BF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). FORM SPRS / chunk VSPR →
; VROOMM_StubThunk_6B970 (AircraftComponent_LoadWithDwordFieldsC_95590, non lu). Ex-
; MissionText_ReleaseSubrecordB.
; ==============================================================================================
Poly_LoadSPRS_94C38	proc far		; CODE XREF: VROOMM_StubThunk_6B8EAJ Poly_BuildFaceElements_94C80+A2p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_94C7D
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_64743

loc_94C62:
		add	sp, 8

loc_94C65:
		or	ax, ax

loc_94C67:
		jz	short loc_94C76
		push	si
		push	large [bp+arg_0]

loc_94C6E:
		call	VROOMM_StubThunk_6B970

loc_94C73:
		add	sp, 6

loc_94C76:				; CODE XREF: Poly_LoadSPRS_94C38:loc_94C67j
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_94C7D:				; CODE XREF: Poly_LoadSPRS_94C38+1Aj
		pop	si
		pop	bp
		retf
Poly_LoadSPRS_94C38	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). CONSTRUIT LES ÉLÉMENTS DE DESSIN
; (ex-MissionText_AllocateMultiBuffer). Pointeurs de remplissage dword_6E8D0 (éléments, +1Ch)
; et dword_6E8D4 (données de face, +12h), puis Poly_LoadTRIS_95FD0, Poly_LoadLINS_94BF0,
; Poly_LoadSPRS_94C38, Poly_LoadDETA_96140.
; ==============================================================================================
Poly_BuildFaceElements_94C80	proc far		; CODE XREF: VROOMM_StubThunk_6B8E0J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+26h], 0
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large dword ptr	es:[bx+1Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6E8D0+2,	dx
		mov	word ptr dword_6E8D0, ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large dword ptr	es:[bx+12h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6E8D4+2,	dx
		mov	word ptr dword_6E8D4, ax
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BA00
		add	sp, 6
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large dword ptr	es:[bx+12h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Poly_LoadLINS_94BF0
		add	sp, 6
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large dword ptr	es:[bx+12h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Poly_LoadSPRS_94C38
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BA30
		add	sp, 6
		pop	si
		pop	bp
		retf
Poly_BuildFaceElements_94C80	endp

ovr271		ends
