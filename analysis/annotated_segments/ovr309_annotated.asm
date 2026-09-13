ovr309		segment	para public 'OVERLAY' use16
		assume cs:ovr309
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine AI_ComputeGeometryHelper_56E29, WorldObject_ApplyOrientationVariantA_5776A
; (seg116), opération de conteneur.
; ==============================================================================================
WorldObject_ApplyOrientationAndFilter_9D020	proc far		; CODE XREF: VROOMM_StubThunk_6C190J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6BF65
		add	sp, 4

loc_9D033:
		cmp	word ptr [si+26h], 0
		jz	short loc_9D051
		mov	ax, si

loc_9D03B:
		add	ax, 2Ch	; ','
		push	ax
		push	word ptr [si+26h]
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_9D051:				; CODE XREF: WorldObject_ApplyOrientationAndFilter_9D020+17j
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	WorldObject_ApplyOrientationVariantA_5776A
		add	sp, 4
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_9D083
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_9D083:				; CODE XREF: WorldObject_ApplyOrientationAndFilter_9D020+51j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9D092
		push	word ptr [si+1Eh]
		call	Container_Op_22C8C
		pop	cx

loc_9D092:				; CODE XREF: WorldObject_ApplyOrientationAndFilter_9D020+67j
		pop	si
		pop	bp
		retf
WorldObject_ApplyOrientationAndFilter_9D020	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle AI_ComputeGeometryHelper_56E29.
; ==============================================================================================
AI_ComputeGeometryWrapper_9D095	proc far		; CODE XREF: VROOMM_StubThunk_6C195J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]

loc_9D09F:
		call	dword ptr [bx+78h]
		pop	cx
		push	ax
		mov	ax, si

loc_9D0A6:
		add	ax, 2Ch	; ','
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		push	si
		call	VROOMM_StubThunk_6BF6A
		pop	cx
		pop	si
		pop	bp
		retf
AI_ComputeGeometryWrapper_9D095	endp

ovr309		ends
