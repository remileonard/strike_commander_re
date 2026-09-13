seg100		segment	byte public 'CODE' use16
		assume cs:seg100
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,16L — wrapper direct vers IFF_LoadAngleParam (sub_3C942, seg084) : chargement d'un
; paramètre angulaire IFF, appelé depuis le chargeur de modèle principal.
; ==============================================================================================
IFF_LoadAngleParam_Wrapper	proc far		; CODE XREF: IFF_LoadModelMain+C7DP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_460E9:				; DATA XREF: seg216:03E6o
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	IFF_LoadAngleParam
		add	sp, 6
		pop	bp
		retf
IFF_LoadAngleParam_Wrapper	endp

; ���������������������������������������������������������������������������

loc_460FC:				; DATA XREF: seg339:off_6F4ACo
		push	bp
		mov	bp, sp
		mov	al, 11h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46103:				; DATA XREF: seg339:off_6F4A8o
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	51h ; 'Q'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4613C
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si], 2D34h
		push	large dword ptr	[bp-4]
		push	si
		nop
		push	cs
		call	near ptr Camera_InitAttachedWithTarget_Dup2
		add	sp, 6
		mov	ax, si
		jmp	short loc_4613E
; ���������������������������������������������������������������������������

loc_4613C:				; CODE XREF: seg100:003Ej
		mov	ax, si

loc_4613E:				; CODE XREF: seg100:005Aj
		mov	si, ax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Bh	; '+'
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		mov	eax, [bp-8]
		mov	[si+6],	eax
		mov	ax, si

loc_46159:
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4615C:
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]

loc_46162:
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — identique à sub_3DC3D/sub_45C0D : second duplicat overlay de l'initialisation de
; caméra externe attachée (VROOMM).
; ==============================================================================================
Camera_InitAttachedWithTarget_Dup2	proc far		; CODE XREF: seg100:0052p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]
		mov	[si+50h], al
		pop	si
		leave
		retf
Camera_InitAttachedWithTarget_Dup2	endp

; ���������������������������������������������������������������������������

loc_461A4:				; DATA XREF: seg339:2D68o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 11h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_461AE:				; DATA XREF: seg339:2D38o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_461B6:				; DATA XREF: seg339:off_6FDF4o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_461C0:				; DATA XREF: seg339:off_6FDFCo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_461E9
		push	0
		push	si
		call	WorldObject_BaseDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_461E9

loc_461E0:
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_461E9:				; CODE XREF: seg100:00EDj seg100:00FEj
		pop	di
		pop	si
		pop	bp
		retf
seg100		ends
