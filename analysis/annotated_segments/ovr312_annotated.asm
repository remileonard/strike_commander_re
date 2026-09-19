ovr312		segment	para public 'OVERLAY' use16
		assume cs:ovr312
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (20 lignes).
; ==============================================================================================
Camera_Helper3_9D490	proc far		; CODE XREF: VROOMM_StubThunk_6C230J Camera_InitAndGetHandleWrapper_9D4B5+16p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_9D493:
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+63h], 0
		mov	word ptr [si+65h], 0
		and	byte ptr [si+73h], 0FEh
		mov	word ptr [si+6Dh], 0FFFFh
		or	byte ptr [si+4], 8
		or	byte ptr [si+4], 40h
		pop	si
		pop	bp
		retf
Camera_Helper3_9D490	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Camera_InitAndGetHandle.
; ==============================================================================================
Camera_InitAndGetHandleWrapper_9D4B5	proc far		; CODE XREF: VROOMM_StubThunk_6C235J

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Camera_InitAndGetHandle
		add	sp, 6
		push	si
		push	cs
		call	near ptr Camera_Helper3_9D490
		pop	cx
		pop	si
		pop	bp
		retf
Camera_InitAndGetHandleWrapper_9D4B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, prend l'objet monde (arg near) et appelle AIAircraft_LoadProfileGuarded_73940 (via
; VROOMM_StubThunk_6AB07) avec l'entité IA stockée à +0x55 de cet objet. Appelée par
; AIAircraft_SpawnAndConditionalLoadProfile_53363 (via VROOMM_StubThunk_6C23A). Anciennement
; Camera_Helper4.
; ==============================================================================================
WorldObject_LoadAIProfileViaEntity_9D4D2	proc far		; CODE XREF: VROOMM_StubThunk_6C23AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		push	large dword ptr	[bx+55h]
		call	VROOMM_StubThunk_6AB07
		add	sp, 4
		pop	bp
		retf
WorldObject_LoadAIProfileViaEntity_9D4D2	endp

ovr312		ends
