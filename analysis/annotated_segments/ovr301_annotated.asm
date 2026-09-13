ovr301		segment	para public 'OVERLAY' use16
		assume cs:ovr301
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine une opération de conteneur, WeakRef_UnregisterByValue,
; Debris_FindAndRemoveByID, Handle_Destructor — recherche et désenregistrement complet d'un
; débris.
; ==============================================================================================
Debris_FindAndUnregister_9B700	proc far		; CODE XREF: VROOMM_StubThunk_6BFBAJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B789
		mov	word ptr [si], 1ADCh
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_9B72E
		push	3
		push	large dword ptr	[si+0Ah]

loc_9B720:
		les	bx, [si+0Ah]

loc_9B723:
		mov	bx, es:[bx]
		call	dword ptr [bx+28h]
		add	sp, 6
		jmp	short $+2

loc_9B72E:				; CODE XREF: Debris_FindAndUnregister_9B700+18j
		mov	dword ptr [si+0Ah], 0
		push	3
		push	word ptr [si+1Eh]
		call	Container_Op_22BFC
		add	sp, 4
		mov	word ptr [si+1Eh], 0
		push	word ptr [si+26h]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+26h], 0
		push	si
		push	59BDh
		call	WeakRef_UnregisterByValue
		add	sp, 4

loc_9B762:
		push	large dword ptr	[si+0Eh]
		push	571Ch
		call	Debris_FindAndRemoveByID
		add	sp, 6
		push	0
		push	si
		call	Handle_Destructor
		add	sp, 4
		test	di, 1
		jz	short loc_9B789
		push	si

loc_9B783:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9B789:				; CODE XREF: Debris_FindAndUnregister_9B700+Dj
					; Debris_FindAndUnregister_9B700+80j
		pop	di
		pop	si
		pop	bp
		retf
Debris_FindAndUnregister_9B700	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle une opération de conteneur (Container_Op_223C5).
; ==============================================================================================
Debris_ContainerOpWrapperB_9B78D	proc far		; CODE XREF: VROOMM_StubThunk_6BFBFJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_9B78E:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_70447, 0
		push	[bp+arg_2]
		push	si
		push	large dword ptr	[si+0Eh]

loc_9B7A1:
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_9B7BD

loc_9B7B1:
		push	si
		push	59C3h
		call	Container_Op_223C5

loc_9B7BA:
		add	sp, 4

loc_9B7BD:				; CODE XREF: Debris_ContainerOpWrapperB_9B78D+22j
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapperB_9B78D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (10 lignes).
; ==============================================================================================
Debris_Helper_9B7C0	proc far		; CODE XREF: VROOMM_StubThunk_6BFB5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Debris_Helper_9B7C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (13 lignes).
; ==============================================================================================
Debris_Helper2_9B7C8	proc far		; CODE XREF: VROOMM_StubThunk_6BFB0J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp

locret_9B7D1:
		retf
Debris_Helper2_9B7C8	endp

ovr301		ends
