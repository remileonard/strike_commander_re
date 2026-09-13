seg440		segment	para public 'OVERLAY' use16
		assume cs:seg440
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_3C942 (initialisation de classe de base).
; ==============================================================================================
PlayerComponent_InitBaseClass_A1030	proc far		; CODE XREF: VROOMM_StubThunk_6C6D0J

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

loc_A1043:
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	IFF_LoadAngleParam
		add	sp, 6
		pop	bp

locret_A1053:
		retf
PlayerComponent_InitBaseClass_A1030	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise une classe de base (sub_3C9BC), appelle sub_6B630 et
; sub_45C0D (fonction précédemment signalée comme possible duplicat non vérifié, cf. notes
; méthodologiques du projet), enregistre dans un conteneur (sub_6C00E).
; ==============================================================================================
PlayerComponentVariantS_ConstructAndInit_A1054	proc far		; CODE XREF: VROOMM_StubThunk_6C6D5J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax

loc_A1063:
		push	0E7h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A109D
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si], 2C1Ch
		push	ds
		mov	ax, si

loc_A1080:
		add	ax, 51h	; 'Q'
		push	ax
		call	VROOMM_StubThunk_6B630
		add	sp, 4
		push	large [bp+var_4]
		push	si
		call	Camera_InitAttachedWithTarget_Dup1
		add	sp, 6
		mov	ax, si
		jmp	short loc_A109F
; ���������������������������������������������������������������������������

loc_A109D:				; CODE XREF: PlayerComponentVariantS_ConstructAndInit_A1054+1Cj
		mov	ax, si

loc_A109F:				; CODE XREF: PlayerComponentVariantS_ConstructAndInit_A1054+47j
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantS_ConstructAndInit_A1054	endp

seg440		ends
