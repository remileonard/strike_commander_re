ovr272		segment	para public 'OVERLAY' use16
		assume cs:ovr272
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 516 lignes, NON DÉTAILLÉE — combine allocateurs typés et ReadDwordFieldB_64AFF
; répété — même motif que MissionRecord_LoadWithDwordFields_89850 (seg254). Candidat pour
; session dédiée.
; ==============================================================================================
AircraftComponent_LoadWithDwordFields_94D40	proc far		; CODE XREF: VROOMM_StubThunk_6B910J

var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword	ptr -1Eh
var_19		= byte ptr -19h
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_19], 0
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		add	es:[bx+26h], di
		mov	eax, [si+72h]
		mov	[bp+var_28], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_2C+2],	dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_24], eax
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 1
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_1E], eax
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	large [bp+var_24]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	large [bp+var_24]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_30+2],	dx
		mov	word ptr [bp+var_30], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_34], eax
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_36], dx
		mov	[bp+var_38], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		push	large dword ptr	es:[bx+1Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+26h]
		sub	si, di
		jmp	loc_9527A
; ���������������������������������������������������������������������������

loc_94E38:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+543j
		les	bx, [bp+var_30]
		mov	al, es:[bx+1]
		mov	ah, 0
		imul	ax, 12h
		mov	dx, [bp+var_36]
		mov	bx, [bp+var_38]
		add	bx, ax
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], bx
		mov	bx, word ptr [bp+var_30]
		mov	al, es:[bx+2]
		mov	ah, 0
		imul	ax, 12h
		mov	bx, [bp+var_38]
		add	bx, ax

loc_94E63:
		mov	word ptr [bp+var_14+2],	dx

loc_94E66:
		mov	word ptr [bp+var_14], bx
		mov	bx, word ptr [bp+var_30]

loc_94E6C:
		mov	al, es:[bx+3]

loc_94E70:
		mov	ah, 0

loc_94E72:
		imul	ax, 12h

loc_94E75:
		mov	bx, [bp+var_38]
		add	bx, ax
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], bx
		mov	bx, word ptr [bp+var_30]
		mov	al, es:[bx+1]
		mov	ah, 0
		imul	ax, 18h
		mov	dx, word ptr [bp+var_34+2]
		mov	bx, word ptr [bp+var_34]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_30]
		mov	al, es:[bx+2]
		mov	ah, 0
		imul	ax, 18h
		mov	bx, word ptr [bp+var_34]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, word ptr [bp+var_30]
		mov	al, es:[bx+3]
		mov	ah, 0
		imul	ax, 18h
		mov	bx, word ptr [bp+var_34]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	ax, word ptr dword_6E8D0
		xor	dx, dx
		sub	ax, [bp+var_3C]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_30]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9		; switch 10 cases
		ja	short loc_94F57	; default
		shl	bx, 1
		jmp	cs:off_952AE[bx] ; switch jump

loc_94EFC:				; DATA XREF: ovr272:off_952AEo
		push	large [bp+var_30] ; case 0x0
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetupSolidColor
		add	sp, 14h
		push	17h
		push	ds
		push	offset word_72372
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudParamsInit
		add	sp, 14h
		add	word ptr dword_6E8D0, 17h
		add	word ptr dword_6E8D4, 27h ; '''
		jmp	loc_95275
; ���������������������������������������������������������������������������

loc_94F57:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B3j
					; AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ...
		push	large [bp+var_30] ; default
		push	large [bp+var_C]
		push	large [bp+var_8]

loc_94F63:
		push	large [bp+var_4]

loc_94F67:
		push	large [dword_6E8D4]

loc_94F6C:
		call	Mesh_FaceSetupSolidColorWrap
		add	sp, 14h
		push	17h
		push	ds
		push	offset word_723A3
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudParamsInit
		add	sp, 14h
		add	word ptr dword_6E8D0, 17h
		add	word ptr dword_6E8D4, 27h ; '''
		jmp	loc_95275
; ���������������������������������������������������������������������������

loc_94FB2:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ovr272:off_952AEo
		push	large [bp+var_30] ; case 0x2
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetupTexturedColor
		add	sp, 14h
		push	1Ah
		push	ds
		push	offset word_72389
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudParamsInit
		add	sp, 14h
		add	word ptr dword_6E8D0, 1Ah
		add	word ptr dword_6E8D4, 2Ah ; '*'
		jmp	loc_95275
; ���������������������������������������������������������������������������

loc_9500D:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ovr272:off_952AEo
		push	large [bp+var_30] ; case 0x4
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetupDamageTint
		add	sp, 14h
		push	1Ch
		push	ds
		push	offset word_723BA
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudSetupFlag
		add	sp, 14h
		add	word ptr dword_6E8D0, 1Ch

loc_95060:
		add	word ptr dword_6E8D4, 29h ; ')'
		jmp	loc_95275
; ���������������������������������������������������������������������������

loc_95068:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ovr272:off_952AEo
		mov	al, [bp+var_19]	; case 0x3

loc_9506B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_950B7
		les	bx, [bp+var_30]
		mov	al, es:[bx+4]
		cbw
		push	ax
		push	541Ah
		call	Table_LookupByRange
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_950AA
		push	0
		push	large 0
		push	0C8h ; '�'
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+85h], al
		jmp	short loc_950B3
; ���������������������������������������������������������������������������

loc_950AA:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+34Aj
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+85h], 0

loc_950B3:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+368j
		mov	[bp+var_19], 1

loc_950B7:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+32Fj
		push	large [bp+var_30]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetupDamageTintAlt
		add	sp, 14h
		push	18h
		push	ds
		push	offset word_723D6
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudCopyChannels
		add	sp, 14h
		add	word ptr dword_6E8D0, 18h
		add	word ptr dword_6E8D4, 28h ; '('
		jmp	loc_95275
; ���������������������������������������������������������������������������

loc_95112:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ovr272:off_952AEo
		push	large [bp+var_30] ; case 0x6
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetup
		add	sp, 14h
		push	1Eh
		push	ds
		push	offset word_723EE
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudParamsInit
		add	sp, 14h
		add	word ptr dword_6E8D0, 1Eh
		jmp	loc_95270
; ���������������������������������������������������������������������������

loc_95168:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ovr272:off_952AEo
		push	large [bp+var_30] ; case 0x7
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetupVariant
		add	sp, 14h
		push	24h ; '$'
		push	ds
		push	offset word_7240C
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudSetupVariant
		add	sp, 14h
		add	word ptr dword_6E8D0, 24h ; '$'
		add	word ptr dword_6E8D4, 29h ; ')'
		jmp	loc_95275
; ���������������������������������������������������������������������������

loc_951C3:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ovr272:off_952AEo
		push	large [bp+var_30] ; case 0x8
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetupDamageTintAlt2
		add	sp, 14h
		push	20h ; ' '
		push	ds
		push	offset word_72430
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Mesh_GouraudCopyChannelsFinal
		add	sp, 14h
		add	word ptr dword_6E8D0, 20h ; ' '
		add	word ptr dword_6E8D4, 28h ; '('
		jmp	short loc_95275
; ���������������������������������������������������������������������������

loc_9521D:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7j
					; DATA XREF: ovr272:off_952AEo
		push	large [bp+var_30] ; case 0x9
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Mesh_FaceSetup
		add	sp, 14h
		push	24h ; '$'
		push	ds
		push	offset word_72450
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_18]
		push	large [bp+var_14]
		push	large [bp+var_10]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]

loc_95263:
		call	Mesh_GouraudParamsInit

loc_95268:
		add	sp, 14h
		add	word ptr dword_6E8D0, 24h ; '$'

loc_95270:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+425j
		add	word ptr dword_6E8D4, 26h ; '&'

loc_95275:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+214j
					; AircraftComponent_LoadWithDwordFields_94D40+26Fj ...
		inc	si

loc_95276:
		add	word ptr [bp+var_30], 8

loc_9527A:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+F5j
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_95286
		jmp	loc_94E38
; ���������������������������������������������������������������������������

loc_95286:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+541j
		cmp	[bp+var_1F], 0
		jz	short loc_952AA
		cmp	[bp+var_24], 0
		jz	short loc_952AA
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_952AA:				; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+54Aj
					; AircraftComponent_LoadWithDwordFields_94D40+551j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadWithDwordFields_94D40	endp

; ���������������������������������������������������������������������������
off_952AE	dw offset loc_94EFC	; DATA XREF: AircraftComponent_LoadWithDwordFields_94D40+1B7r
		dw offset loc_94F57	; jump table for switch	statement
		dw offset loc_94FB2
		dw offset loc_95068
		dw offset loc_9500D
		dw offset loc_95068
		dw offset loc_95112
		dw offset loc_95168
		dw offset loc_951C3
		dw offset loc_9521D
ovr272		ends
