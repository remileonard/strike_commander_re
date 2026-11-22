seg439		segment	para public 'OVERLAY' use16
		assume cs:seg439
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-12. Ex-'PlayerComponent_LoadFieldsWithRetryD'. Lecteur de la classe PODR
; (nacelle de roquettes) : Object_LoadCommonAndAllegiance_3C942, Weapon_LoadWDATWrapper
; (WDAT), puis chunk DATA (obligatoire, sinon erreur C01Ch) : string → +0x5F nom de l'objet
; tiré (la roquette, instanciée par WeaponSystem_LaunchFromStation_3E744) ; uint8 → +0x5E
; recopié dans l'instance +0x2C (0 : la méthode +0x10 de l'instance renvoie faux, la nacelle
; disparaît) ; uint16 → +0x68 vitesse de départ (m/s, entier : << 8 dans la prédiction
; d'impact loc_45CEA).
; ==============================================================================================
PodModel_LoadDATAChunk_A0FB0	proc far		; CODE XREF: VROOMM_StubThunk_6C6A0J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	Object_LoadCommonAndAllegiance_3C942
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C5A0
		add	sp, 6
		push	0

loc_A0FD3:
		push	large 41544144h
		push	si

loc_A0FDA:
		call	ResourceRecord_SeekAndRead_64743

loc_A0FDF:
		add	sp, 8

loc_A0FE2:
		or	ax, ax

loc_A0FE4:
		jz	short loc_A1017
		push	si

loc_A0FE7:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Fh	; '_'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	String_ConstructFromFarPtrLen
		add	sp, 6
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]

loc_A1003:
		mov	es:[bx+5Eh], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+68h], ax
		jmp	short loc_A1020
; ���������������������������������������������������������������������������

loc_A1017:				; CODE XREF: PodModel_LoadDATAChunk_A0FB0:loc_A0FE4j
		push	0C01Ch
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A1020:				; CODE XREF: PodModel_LoadDATAChunk_A0FB0+65j
		pop	si
		pop	bp
		retf
PodModel_LoadDATAChunk_A0FB0	endp

seg439		ends
