ovr310		segment	para public 'OVERLAY' use16
		assume cs:ovr310
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle JDYN_LoadChunk — chargeur de modèle JDYN (format 3D).
; ==============================================================================================
JDYN_LoadChunkWrapper_9D0C0	proc far		; CODE XREF: VROOMM_StubThunk_6C1C0J

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
		call	VROOMM_StubThunk_6BFFF
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 35h	; '5'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	JDYN_LoadChunkAndConstruct_3A49C
		add	sp, 6
		pop	si
		pop	bp
		retf
JDYN_LoadChunkWrapper_9D0C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, Debris_BodyReset, Camera_AttachSubcomponent.
; ==============================================================================================
Debris_ConstructWithCameraAttach_9D0FA	proc far		; CODE XREF: VROOMM_StubThunk_6C1C5J

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9D155
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	ax
		call	Debris_BodyReset

loc_9D13A:
		pop	cx
		mov	word ptr [si+2Ch], 0
		mov	word ptr [si], 1BDEh
		push	large [bp+var_4]
		push	si
		call	Camera_AttachSubcomponent
		add	sp, 6
		mov	ax, si
		jmp	short loc_9D157
; ���������������������������������������������������������������������������

loc_9D155:				; CODE XREF: Debris_ConstructWithCameraAttach_9D0FA+1Bj
		mov	ax, si

loc_9D157:				; CODE XREF: Debris_ConstructWithCameraAttach_9D0FA+59j
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		or	si, si
		jz	short loc_9D184
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+35h]
		mov	bx, es:[bx+35h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax

loc_9D181:
		mov	[si+2Ch], ax

loc_9D184:				; CODE XREF: Debris_ConstructWithCameraAttach_9D0FA+6Ej
		mov	ax, si
		pop	si

locret_9D187:
		leave
		retf
Debris_ConstructWithCameraAttach_9D0FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine IFF_LoadAngleParam et JDYN_LoadChunk — chargement combiné IFF/JDYN d'un
; paramètre d'angle.
; ==============================================================================================
JDYN_LoadAngleAndChunk_9D189	proc far		; CODE XREF: VROOMM_StubThunk_6C1CAJ
					; Camera_Helper_9D286:loc_9D2A1p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_9D18D:
		mov	si, [bp+arg_4]
		push	si

loc_9D191:
		push	large [bp+arg_0]
		call	IFF_LoadAngleParam
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]

loc_9D1A1:
		add	ax, 36h	; '6'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	JDYN_LoadChunkAndConstruct_3A49C
		add	sp, 6
		push	0
		push	large 4B4F4D53h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9D211
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+39h], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
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
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+42h], eax
		mov	byte ptr es:[bx+38h], 1

loc_9D211:				; CODE XREF: JDYN_LoadAngleAndChunk_9D189+3Aj
		pop	si
		pop	bp
		retf
JDYN_LoadAngleAndChunk_9D189	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, WorldObject_BaseConstruct, Camera_InitAttachedWithTarget.
; ==============================================================================================
Camera_ConstructAttachedWithTarget_9D214	proc far		; CODE XREF: VROOMM_StubThunk_6C1CFJ

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	55h ; 'U'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9D252
		push	ax

loc_9D232:
		call	WorldObject_BaseConstruct
		pop	cx

loc_9D238:
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h

loc_9D241:
		push	large [bp+var_4]
		push	si

loc_9D246:
		call	Camera_InitAttachedWithTarget_3DC3D
		add	sp, 6
		mov	ax, si
		jmp	short loc_9D254
; ���������������������������������������������������������������������������

loc_9D252:				; CODE XREF: Camera_ConstructAttachedWithTarget_9D214+1Bj
		mov	ax, si

loc_9D254:				; CODE XREF: Camera_ConstructAttachedWithTarget_9D214+3Cj
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6

loc_9D263:
		or	si, si

loc_9D265:
		jz	short loc_9D281
		push	si
		les	bx, [bp+arg_0]

loc_9D26B:
		push	word ptr es:[bx+36h]

loc_9D26F:
		mov	bx, es:[bx+36h]

loc_9D273:
		mov	bx, [bx]

loc_9D275:
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+51h], ax

loc_9D281:				; CODE XREF: Camera_ConstructAttachedWithTarget_9D214:loc_9D265j
		mov	ax, si
		pop	si
		leave
		retf
Camera_ConstructAttachedWithTarget_9D214	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (37 lignes).
; ==============================================================================================
Camera_Helper_9D286	proc far		; CODE XREF: VROOMM_StubThunk_6C1D4J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs

loc_9D2A1:
		call	near ptr JDYN_LoadAngleAndChunk_9D189
		add	sp, 6
		push	large [bp+arg_0]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]

loc_9D2B4:
		add	sp, 4
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 46h	; 'F'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6C165
		add	sp, 6
		pop	bp
		retf
Camera_Helper_9D286	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, WorldObject_BaseConstruct, Camera_ResetState,
; Camera_InitWithSecondaryTarget.
; ==============================================================================================
Camera_ConstructWithSecondaryTarget_9D2CC	proc far		; CODE XREF: VROOMM_StubThunk_6C1D9J

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Ah ; 'Z'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9D31D
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h
		push	si
		call	Camera_ResetState
		pop	cx
		mov	dword ptr [si+55h], 0
		mov	word ptr [si], 2618h
		push	large [bp+var_4]
		push	si
		call	Camera_InitWithSecondaryTarget
		add	sp, 6
		mov	ax, si
		jmp	short loc_9D31F
; ���������������������������������������������������������������������������

loc_9D31D:				; CODE XREF: Camera_ConstructWithSecondaryTarget_9D2CC+1Bj
		mov	ax, si

loc_9D31F:				; CODE XREF: Camera_ConstructWithSecondaryTarget_9D2CC+4Fj
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		or	si, si

loc_9D330:
		jz	short loc_9D36F
		push	si
		les	bx, [bp+arg_0]

loc_9D336:
		push	large dword ptr	es:[bx+46h]
		les	bx, es:[bx+46h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+55h], eax
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+8]

loc_9D366:
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+51h], ax

loc_9D36F:				; CODE XREF: Camera_ConstructWithSecondaryTarget_9D2CC:loc_9D330j
		mov	ax, si
		pop	si
		leave
		retf
Camera_ConstructWithSecondaryTarget_9D2CC	endp

ovr310		ends
