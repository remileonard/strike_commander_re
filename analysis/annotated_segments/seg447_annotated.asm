seg447		segment	para public 'OVERLAY' use16
		assume cs:seg447
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,seg447 — LECTEUR DU CHUNK 'DYNM' (interne) = MASSE de l'avion. Dans la hierarchie JETP
; -> FORM DYNM(externe) -> {DYNM(masse), THRS, JDYN}. PlayerComponent_SubHelper_A4A88(si) met
; a zero [si+2] (flag) et [si+8/0xC/0x10] (vecteur, CG/inertie a confirmer), puis
; seek_chunk('DYNM') ('MNYD') + ReadFieldGroupC (u32) -> [si+4] = masse (24.8). Erreur 0xA001
; si chunk absent. Detail : analysis/DATA_MODEL.md §6.2.
; ==============================================================================================
AircraftDynamics_ReadMassChunk_A4A20	proc far		; CODE XREF: VROOMM_StubThunk_6CAC0J
					; PlayerComponent_LoadFieldsWithRetryEWrapper_A4A75:loc_A4A80p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_A4A24:
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelper_A4A88
		pop	cx

loc_A4A42:
		push	0
		push	large 'MNYD'    ; DYNM
		push	di

loc_A4A4B:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A4A68
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+4],	eax
		jmp	short loc_A4A71
; ���������������������������������������������������������������������������

loc_A4A68:				; CODE XREF: AircraftDynamics_ReadMassChunk_A4A20+35j
		push	0A001h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A4A71:				; CODE XREF: AircraftDynamics_ReadMassChunk_A4A20+46j
		pop	di
		pop	si
		pop	bp
		retf
AircraftDynamics_ReadMassChunk_A4A20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle AircraftDynamics_ReadMassChunk_A4A20 (lecteur du chunk DYNM/masse).
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryEWrapper_A4A75	proc far		; CODE XREF: VROOMM_StubThunk_6CAD4J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		push	cs

loc_A4A80:
		call	near ptr AircraftDynamics_ReadMassChunk_A4A20
		add	sp, 4
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryEWrapper_A4A75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par PlayerComponent_LoadFieldsWithRetryE_A4A20/E_A4AA6.
; ==============================================================================================
PlayerComponent_SubHelper_A4A88	proc far		; CODE XREF: VROOMM_StubThunk_6CACAJ AircraftDynamics_ReadMassChunk_A4A20+1Ep	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelper_A4A88	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelper_A4A88 (variante).
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryEVariant_A4AA6	proc far		; CODE XREF: VROOMM_StubThunk_6CACFJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr PlayerComponent_SubHelper_A4A88
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+2],	ax
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryEVariant_A4AA6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_Helper_A4ABC	proc far		; CODE XREF: VROOMM_StubThunk_6CAC5J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+4]
		mov	[si+4],	eax
		add	di, 8
		mov	eax, [di]
		mov	[si+8],	eax
		mov	eax, [di+4]
		mov	[si+0Ch], eax
		mov	eax, [di+8]
		mov	[si+10h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_Helper_A4ABC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'objet (sub_338).
; ==============================================================================================
PlayerComponent_ReleaseVariant_A4AED	proc far		; CODE XREF: VROOMM_StubThunk_6CAD9J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_A4B0B
		mov	word ptr [si], 223Ah
		test	ax, 1
		jz	short loc_A4B0B
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A4B0B:				; CODE XREF: PlayerComponent_ReleaseVariant_A4AED+Cj
					; PlayerComponent_ReleaseVariant_A4AED+15j
		pop	si
		pop	bp
		retf
PlayerComponent_ReleaseVariant_A4AED	endp

seg447		ends
