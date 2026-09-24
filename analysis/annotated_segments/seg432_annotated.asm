seg432		segment	para public 'OVERLAY' use16
		assume cs:seg432
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-20). Convertit un identifiant d'arme (0 a 12, switch de 13 cas : 0->0,
; 1->0x1, 2->0x2, 3->0x4, ... bit = id-1) en masque de bit. Appelee par
; Weapon_LoadWDATChunk_A0700 sur le weapon_id du chunk WDAT (via le stub VROOMM 6C380). Ancien
; nom 'PlayerComponent_IndexToFlagMask' faux : les 13 cas sont les 13 weapon_ids (0=aucun,
; 1=AIM-9J, 2=AIM-9M, 3=AGM-65D, 4=LAU-3, 5=MK-20, 6=MK-82, 7=Durandal, 8=GBU-15, 9=AIM-120,
; 10=SA-2, 11=SA-6, 12=canon 20mm), pas des composants de dommages.
; ==============================================================================================
WeaponId_ToTypeMask_9DE60	proc far		; CODE XREF: VROOMM_StubThunk_6C380J

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		mov	al, [bp+arg_0]
		cbw
		mov	bx, ax
		cmp	bx, 0Ch		; switch 13 cases

loc_9DE6E:				; default
		ja	short loc_9DEB5
		shl	bx, 1

loc_9DE72:				; switch jump
		jmp	cs:off_9DEB9[bx]

loc_9DE77:				; DATA XREF: seg432:off_9DEB9o
		xor	dx, dx		; case 0x0
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DE7B:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 1		; case 0x1
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DE80:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 2		; case 0x2
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DE85:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 4		; case 0x3
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DE8A:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 8		; case 0x4
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DE8F:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 10h		; case 0x5

loc_9DE92:				; default
		jmp	short loc_9DEB5
; ���������������������������������������������������������������������������

loc_9DE94:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 20h	; ' '   ; case 0x6
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DE99:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 40h	; '@'   ; case 0x7
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DE9E:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 80h	; '�'   ; case 0x8

loc_9DEA1:				; default
		jmp	short loc_9DEB5
; ���������������������������������������������������������������������������

loc_9DEA3:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 100h	; case 0x9
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DEA8:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 200h	; case 0xA
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DEAD:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 400h	; case 0xB
		jmp	short loc_9DEB5	; default
; ���������������������������������������������������������������������������

loc_9DEB2:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72j
					; DATA XREF: seg432:off_9DEB9o
		mov	dx, 800h	; case 0xC

loc_9DEB5:				; CODE XREF: WeaponId_ToTypeMask_9DE60:loc_9DE6Ej
					; WeaponId_ToTypeMask_9DE60+19j ...
		mov	ax, dx		; default
		pop	bp
		retf
WeaponId_ToTypeMask_9DE60	endp

; ���������������������������������������������������������������������������
off_9DEB9	dw offset loc_9DE77	; DATA XREF: WeaponId_ToTypeMask_9DE60:loc_9DE72r
		dw offset loc_9DE7B	; jump table for switch	statement
		dw offset loc_9DE80
		dw offset loc_9DE85
		dw offset loc_9DE8A
		dw offset loc_9DE8F
		dw offset loc_9DE94
		dw offset loc_9DE99
		dw offset loc_9DE9E
		dw offset loc_9DEA3
		dw offset loc_9DEA8
		dw offset loc_9DEAD
		dw offset loc_9DEB2

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_2E74 (externe). Référencée par sub_9F4ED.
; ==============================================================================================
PlayerComponent_ApplyExternalCall_9DED3	proc far		; CODE XREF: VROOMM_StubThunk_6C38FJ PlayerComponent_FullReleaseAndLoad_9F4ED+67p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 4
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx

loc_9DEE8:
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+0Ch], 0
		les	bx, [bp+arg_4]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+0Dh]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], ax
		leave
		retf
PlayerComponent_ApplyExternalCall_9DED3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_ReadFieldGroupB_64A54 (seg193, lecture IFF) et sub_2B007.
; ==============================================================================================
PlayerComponent_ReadFieldAndDispatch_9DF2A	proc far		; CODE XREF: VROOMM_StubThunk_6C38AJ

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	8
		push	ds

loc_9DF30:
		push	offset dword_704CD

loc_9DF33:
		mov	ax, word ptr [bp+arg_0]

loc_9DF36:
		add	ax, 4

loc_9DF39:
		push	word ptr [bp+arg_0+2]
		push	ax

loc_9DF3D:
		call	CRT_MemFamily_Extra8

loc_9DF42:
		add	sp, 0Ah

loc_9DF45:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		mov	dword ptr es:[bx], 0
		mov	word ptr es:[bx+0Dh], 0
		mov	word ptr es:[bx+10h], 0
		pop	bp
		retf
PlayerComponent_ReadFieldAndDispatch_9DF2A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine PlayerComponent_ReadFieldAndDispatch_9DF2A, sub_2B007 et sub_3B876 — charge des
; données de composant depuis le format ResourceRecord/IFF. Appelée par sub_9EDD4.
; ==============================================================================================
PlayerComponent_LoadFromResourceRecord_9DF63	proc far		; CODE XREF: VROOMM_StubThunk_6C385J PlayerComponent_ReleaseAndReload_9DFC5+54p	...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_9DF67:
		mov	si, [bp+arg_4]

loc_9DF6A:
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx

loc_9DF72:
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], ax
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		push	word ptr [bp+arg_0+2]
		push	ax

loc_9DF93:
		call	String_ConstructFromFarPtrLen

loc_9DF98:
		add	sp, 6
		push	0

loc_9DF9D:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4

loc_9DFA3:
		push	word ptr [bp+arg_0+2]

loc_9DFA6:
		push	ax

loc_9DFA7:
		push	571Ch

loc_9DFAA:
		call	IFF_LoadModelMain
		add	sp, 8

loc_9DFB2:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	word ptr es:[bx+0Dh], 0
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFromResourceRecord_9DF63	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFreeWrapper_5C6F3 (seg131) et
; PlayerComponent_LoadFromResourceRecord_9DF63.
; ==============================================================================================
PlayerComponent_ReleaseAndReload_9DFC5	proc far		; CODE XREF: VROOMM_StubThunk_6C394J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_9DFED
		push	1
		push	0
		push	2
		push	large 12h
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_9DFE3:
		mov	word ptr [bp+arg_0+2], dx

loc_9DFE6:
		mov	word ptr [bp+arg_0], ax

loc_9DFE9:
		or	ax, dx
		jz	short loc_9E01F

loc_9DFED:				; CODE XREF: PlayerComponent_ReleaseAndReload_9DFC5+8j
		xor	eax, eax

loc_9DFF0:
		les	bx, [bp+arg_0]

loc_9DFF3:
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		mov	es:[bx+0Ch], al
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_LoadFromResourceRecord_9DF63
		add	sp, 6

loc_9E01F:				; CODE XREF: PlayerComponent_ReleaseAndReload_9DFC5+26j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
PlayerComponent_ReleaseAndReload_9DFC5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 317 lignes, NON DÉTAILLÉE — très grande frame locale (~0x80 octets de dwords),
; dispatch vtable [bx+0x18] et longueur vectorielle (sub_5828E). Référencée via jmp depuis un
; stub VROOMM (sub_6C42F). Candidat pour session dédiée.
; ==============================================================================================
PlayerComponent_ComputeGeometryComplex_9E027	proc far		; CODE XREF: VROOMM_StubThunk_6C42FJ

var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si

loc_9E02F:
		cmp	[bp+arg_4], 0
		jnz	short loc_9E039

loc_9E036:
		jmp	loc_9E284
; ���������������������������������������������������������������������������

loc_9E039:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+Dj
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_9E046
		jmp	loc_9E284
; ���������������������������������������������������������������������������

loc_9E046:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+1Aj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 45h	; 'E'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_50], eax

loc_9E060:
		mov	eax, es:[si+4]
		mov	[bp+var_4C], eax

loc_9E069:
		mov	eax, es:[si+8]

loc_9E06E:
		mov	[bp+var_48], eax

loc_9E072:
		mov	es, word ptr [bp+arg_4+2]
		les	bx, es:[bx]
		mov	eax, es:[bx+56h]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	[bp+var_10], 0
		cmp	word ptr es:[bx+4Bh], 40h ; '@'
		jnz	short loc_9E0FF
		les	bx, [bp+arg_0]
		mov	si, es:[bx+9]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_5C], eax
		mov	eax, [si+4]
		mov	[bp+var_58], eax

loc_9E0B1:
		mov	eax, [si+8]

loc_9E0B5:
		mov	[bp+var_54], eax

loc_9E0B9:
		mov	eax, [bp+var_48]

loc_9E0BD:
		mov	[bp+var_54], eax

loc_9E0C1:
		mov	eax, [bp+var_8]

loc_9E0C5:
		mov	ebx, 64h ; 'd'
		cdq
		idiv	ebx
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	ax, word ptr [bp+var_3E+1]
		mov	[bp+var_36], ax
		imul	ax, 64h

loc_9E0E1:
		mov	[bp+var_40], ax

loc_9E0E4:
		movsx	eax, [bp+var_40]
		shl	eax, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_10], eax
		sub	[bp+var_8], eax
		jmp	short loc_9E16E
; ���������������������������������������������������������������������������

loc_9E0FF:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+6Fj
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_9E131
		push	2
		lea	ax, [bp+var_48]
		push	ax
		push	word ptr es:[bx+0Dh]
		push	0
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp+var_68]
		jmp	short loc_9E14E
; ���������������������������������������������������������������������������

loc_9E131:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+E0j
		mov	eax, dword_707E0
		mov	[bp+var_68], eax
		mov	eax, dword_707E4
		mov	[bp+var_64], eax

loc_9E141:
		mov	eax, dword_707E8
		mov	[bp+var_60], eax
		mov	dx, ss
		lea	ax, [bp+var_68]

loc_9E14E:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+108j
		mov	eax, [bp+var_68]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_54], eax

loc_9E16E:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+D6j
		mov	eax, [bp+var_5C]

loc_9E172:
		sub	eax, [bp+var_50]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_58]
		sub	eax, [bp+var_4C]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_54]
		sub	eax, [bp+var_48]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_6C], eax
		push	eax
		push	large [bp+var_70]

loc_9E1B0:
		push	large [bp+var_74]

loc_9E1B4:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax

loc_9E1BD:
		add	sp, 0Ch
		mov	[bp+var_18], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		mov	eax, [bp+var_14]
		or	eax, eax
		jge	short loc_9E1DC
		neg	eax

loc_9E1DC:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+1B0j
		mov	[bp+var_1C], eax

loc_9E1E0:
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 51h	; 'Q'
		mov	word ptr [bp+var_28+2],	ax
		mov	word ptr [bp+var_28], dx
		les	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_24], eax
		cmp	[bp+var_24], 0
		jnz	short loc_9E212
		mov	ax, 1
		jmp	short loc_9E214
; ���������������������������������������������������������������������������

loc_9E212:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+1E4j
		xor	ax, ax

loc_9E214:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+1E9j
		or	al, al
		jz	short loc_9E22E
		mov	eax, [bp+var_14]
		add	eax, 0A00h
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	[bp+var_24], eax

loc_9E22E:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+1EFj
		mov	eax, [bp+var_14]

loc_9E232:
		cmp	eax, [bp+var_24]

loc_9E236:
		jge	short loc_9E23D

loc_9E238:
		mov	ax, 1
		jmp	short loc_9E23F
; ���������������������������������������������������������������������������

loc_9E23D:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027:loc_9E236j
		xor	ax, ax

loc_9E23F:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+214j
		or	al, al
		jz	short loc_9E24D

loc_9E243:
		mov	eax, [bp+var_14]
		mov	[bp+var_24], eax
		jmp	short loc_9E257
; ���������������������������������������������������������������������������

loc_9E24D:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+21Aj
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+44h], 0
		jmp	short loc_9E284
; ���������������������������������������������������������������������������

loc_9E257:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+224j
		mov	eax, [bp+var_24]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		les	bx, [bp+arg_0]
		mov	es:[bx+51h], eax
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_8]
		jge	short loc_9E27A
		mov	ax, 1
		jmp	short loc_9E27C
; ���������������������������������������������������������������������������

loc_9E27A:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+24Cj
		xor	ax, ax

loc_9E27C:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+251j
		or	al, al
		jz	short loc_9E284
		mov	al, 1
		jmp	short loc_9E286
; ���������������������������������������������������������������������������

loc_9E284:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027:loc_9E036j
					; PlayerComponent_ComputeGeometryComplex_9E027+1Cj ...
		mov	al, 0

loc_9E286:				; CODE XREF: PlayerComponent_ComputeGeometryComplex_9E027+25Bj
		pop	si
		leave
		retf
PlayerComponent_ComputeGeometryComplex_9E027	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 419 lignes, NON DÉTAILLÉE — combine AI_ComputeGeometryHelper_56E29 (seg116),
; HUD_ResolveNodePosition_547B1 (seg114), l'instanciation d'objet Effect_SpawnObject
; (sub_38B70, motif de Trigger_TimedRangedSpawnOnce_4F351, seg109), l'enregistrement de
; conteneur (sub_21F8D), la référence faible SetReference (sub_3A44E, mentionnée dans les
; notes du projet), l'ajout à liste membre (sub_3A40B ×2, dtor sub_3A3EC associé en seg109) et
; Weapon_HUDBox_TimerCaseH_5A8DC (seg125). Correspond très fortement au système de
; trigger/spawn temporisé du seg109, probablement son implémentation d'overlay réelle.
; Candidat prioritaire pour session dédiée.
; ==============================================================================================
TimedTrigger_SpawnAndBindGeometry_9E289	proc far		; CODE XREF: VROOMM_StubThunk_6C399J

var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= word ptr -68h
var_5C		= word ptr -5Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h
arg_14		= byte ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si

loc_9E291:
		push	di

loc_9E292:
		mov	di, [bp+arg_8]

loc_9E295:
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl

loc_9E2A5:
		mov	ax, word ptr [bp+arg_10+2]
		mov	dx, word ptr [bp+arg_10]
		add	dx, 28h	; '('
		mov	word ptr [bp+var_8+2], ax

loc_9E2B1:
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]

loc_9E2BB:
		mov	[bp+var_4], eax
		les	bx, [bp+arg_10]
		mov	byte ptr es:[bx+44h], 0
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_9E2D4
		jmp	loc_9E566
; ���������������������������������������������������������������������������

loc_9E2D4:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+46j
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_E], ax
		push	ax
		lea	ax, [bp+var_5C]
		push	ax

loc_9E2E3:
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0

loc_9E2F3:
		jz	short loc_9E2FE
		les	bx, es:[bx]
		mov	al, es:[bx+4Ah]
		jmp	short loc_9E300
; ���������������������������������������������������������������������������

loc_9E2FE:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289:loc_9E2F3j
		mov	al, 17h

loc_9E300:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+73j
		mov	ah, 0
		cmp	ax, 9
		jz	short loc_9E30A
		jmp	loc_9E566
; ���������������������������������������������������������������������������

loc_9E30A:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+7Cj
		cmp	[bp+var_4], 0
		jnz	short loc_9E316
		mov	ax, 1
		jmp	short loc_9E318
; ���������������������������������������������������������������������������

loc_9E316:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+86j
		xor	ax, ax

loc_9E318:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+8Bj
		or	al, al
		jnz	short loc_9E325
		cmp	[bp+arg_14], 0
		jnz	short loc_9E325
		jmp	loc_9E566
; ���������������������������������������������������������������������������

loc_9E325:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+91j
					; TimedTrigger_SpawnAndBindGeometry_9E289+97j
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	[bp+var_10], ax

loc_9E330:
		les	bx, es:[bx+16h]
		shl	ax, 1
		add	bx, ax

loc_9E338:
		mov	si, es:[bx]
		or	si, si

loc_9E33D:
		jz	short loc_9E36F
		cmp	di, word_722E6
		jnz	short loc_9E35A
		cmp	byte_72358, 0
		jz	short loc_9E35A
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_9E36F

loc_9E35A:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+BAj
					; TimedTrigger_SpawnAndBindGeometry_9E289+C1j
		push	1
		push	1
		push	si

loc_9E35F:
		push	571Ch

loc_9E362:
		call	Debris_InstantiateFromParent

loc_9E367:
		add	sp, 8
		mov	si, ax
		jmp	loc_9E42A
; ���������������������������������������������������������������������������

loc_9E36F:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289:loc_9E33Dj
					; TimedTrigger_SpawnAndBindGeometry_9E289+CFj
		mov	ax, word ptr [bp+arg_4+2]

loc_9E372:
		mov	dx, word ptr [bp+arg_4]
		add	dx, 4
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		push	1
		push	1
		push	ax
		push	dx
		push	571Ch
		call	ObjectPrototype_FindOrLoadAndInstantiate_38B70
		add	sp, 0Ah
		mov	si, ax
		lea	ax, [bp+var_5C]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_9E39E:
		mov	ax, word ptr [bp+arg_C+2]

loc_9E3A1:
		mov	dx, word ptr [bp+arg_C]

loc_9E3A4:
		inc	dx
		mov	word ptr [bp+var_18+2],	ax

loc_9E3A8:
		mov	word ptr [bp+var_18], dx
		les	dx, [bp+var_18]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[si+12h], eax

loc_9E3B8:
		mov	eax, es:[bx+4]
		mov	[si+16h], eax
		mov	eax, es:[bx+8]
		mov	[si+1Ah], eax
		lea	ax, [bp+var_5C]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	dx, si
		add	dx, 12h
		mov	ax, si

loc_9E3E3:
		add	ax, 12h

loc_9E3E6:
		mov	[bp+var_1A], ax
		mov	ax, di

loc_9E3EB:
		add	ax, 12h
		mov	[bp+var_1C], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	bx, [bp+var_1C]
		add	eax, [bx]
		mov	bx, dx
		mov	[bx], eax
		mov	bx, [bp+var_1A]
		mov	eax, [bx+4]
		mov	bx, [bp+var_1C]
		add	eax, [bx+4]
		mov	bx, dx
		mov	[bx+4],	eax
		mov	bx, [bp+var_1A]
		mov	eax, [bx+8]
		mov	bx, [bp+var_1C]
		add	eax, [bx+8]
		mov	bx, dx
		mov	[bx+8],	eax

loc_9E42A:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+E3j
		or	si, si
		jnz	short loc_9E431
		jmp	loc_9E566
; ���������������������������������������������������������������������������

loc_9E431:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+1A3j
		push	si
		push	59C3h
		call	List_AppendIfNonNull_21F8D
		add	sp, 4
		mov	[bp+var_1E], si
		push	[bp+var_1E]

loc_9E443:
		mov	ax, word ptr [bp+arg_10]
		add	ax, 11h
		push	word ptr [bp+arg_10+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	di
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]

loc_9E460:
		add	sp, 6
		lea	ax, [bp+var_68]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4
		mov	ax, [bp+arg_A]
		mov	[bp+var_20], ax
		push	ax
		mov	ax, si
		add	ax, 55h	; 'U'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_22], di
		push	[bp+var_22]
		mov	ax, si
		add	ax, 57h	; 'W'
		push	ax
		call	SetReference16
		add	sp, 4

loc_9E499:
		les	bx, [bp+arg_C]

loc_9E49C:
		mov	ax, es:[bx+13h]
		dec	ax

loc_9E4A1:
		mov	[bp+var_24], ax
		mov	es:[bx+13h], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx]
		cmp	byte ptr es:[bx+4Fh], 0

loc_9E4B3:
		jnz	short loc_9E4B9
		push	0

loc_9E4B7:
		jmp	short loc_9E4BC
; ���������������������������������������������������������������������������

loc_9E4B9:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289:loc_9E4B3j
		push	[bp+arg_A]

loc_9E4BC:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289:loc_9E4B7j
		push	si
		push	di
		push	59CDh

loc_9E4C1:
		call	Mission_PlayerEventHandler

loc_9E4C6:
		add	sp, 8
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 5Ah	; 'Z'
		mov	word ptr [bp+var_28+2],	ax
		mov	word ptr [bp+var_28], dx
		les	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 12h
		mov	dx, word_72A8F
		add	dx, 14h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_80], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_7C], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_6C], eax
		push	eax

loc_9E535:
		push	large [bp+var_70]
		push	large [bp+var_74]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		sar	eax, 8
		mov	[bp+var_30], eax
		push	si
		push	eax
		push	8

loc_9E55E:
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8

loc_9E566:				; CODE XREF: TimedTrigger_SpawnAndBindGeometry_9E289+48j
					; TimedTrigger_SpawnAndBindGeometry_9E289+7Ej ...
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]

loc_9E572:
		les	bx, [bp+arg_10]
		mov	es:[bx+28h], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
TimedTrigger_SpawnAndBindGeometry_9E289	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3. Référencée par sub_9F4ED.
; ==============================================================================================
PlayerComponent_ReleaseHelper_9E58E	proc far		; CODE XREF: VROOMM_StubThunk_6C3A8J PlayerComponent_FullReleaseAndLoad_9F4ED+E9p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp

loc_9E591:
		sub	sp, 10h
		push	si
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+0Dh]

loc_9E59C:
		les	bx, [bp+arg_0]

loc_9E59F:
		mov	es:[bx+0Dh], ax

loc_9E5A3:
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		inc	dx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx

loc_9E5B0:
		les	si, [bp+var_4]
		mov	eax, es:[si]

loc_9E5B7:
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		mov	es, word ptr [bp+arg_0+2]
		mov	eax, [bp+var_10]
		mov	es:[bx+1], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+5], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+9], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+13h]
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], ax
		les	bx, [bp+arg_4]
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], al
		les	bx, [bp+arg_4]
		mov	al, es:[bx+15h]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], al
		push	1
		push	0
		push	2
		push	large 10h
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], dx

loc_9E62E:
		mov	es:[bx+16h], ax

loc_9E632:
		xor	dx, dx

loc_9E634:
		jmp	short loc_9E649
; ���������������������������������������������������������������������������

loc_9E636:				; CODE XREF: PlayerComponent_ReleaseHelper_9E58E+BEj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0
		inc	dx

loc_9E649:				; CODE XREF: PlayerComponent_ReleaseHelper_9E58E:loc_9E634j
		cmp	dx, 8
		jl	short loc_9E636
		pop	si
		leave
		retf
PlayerComponent_ReleaseHelper_9E58E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_9E731. Référencée par sub_9F1D0/9F434/9F760.
; ==============================================================================================
PlayerComponent_Helper_9E651	proc far		; CODE XREF: VROOMM_StubThunk_6C39EJ PlayerComponent_LoadTripleField_9E682+1Ep	...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_4]
		or	ax, ax
		jz	short loc_9E668
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs

loc_9E662:
		call	near ptr PlayerComponent_ApplyExternalHelper_9E731

loc_9E665:
		add	sp, 6

loc_9E668:				; CODE XREF: PlayerComponent_Helper_9E651+8j
		les	bx, [bp+arg_0]

loc_9E66B:
		mov	word ptr es:[bx+0Dh], 0

loc_9E671:
		mov	dword ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+13h], 0
		pop	bp
		retf
PlayerComponent_Helper_9E651	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine PlayerComponent_Helper_9E651, ResourceRecord_ReadFinalField_64B51,
; ResourceRecord_ReadFieldGroupC_64A7E (×3, seg193) — lecture de 3 champs depuis le format
; IFF.
; ==============================================================================================
PlayerComponent_LoadTripleField_9E682	proc far		; CODE XREF: VROOMM_StubThunk_6C3A3J PlayerComponent_LoadMultiField_9F07F+F7p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

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
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_Helper_9E651

loc_9E6A3:
		add	sp, 6
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]

loc_9E6B0:
		mov	es:[bx+15h], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+1], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx

loc_9E6E1:
		push	ax

loc_9E6E2:
		pop	eax
		pop	cx

loc_9E6E5:
		les	bx, [bp+arg_0]
		mov	es:[bx+9], eax
		mov	al, [bp+arg_6]
		mov	es:[bx], al
		push	1
		push	0
		push	2
		push	large 10h
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], dx
		mov	es:[bx+16h], ax
		xor	dx, dx
		jmp	short loc_9E729
; ���������������������������������������������������������������������������

loc_9E716:				; CODE XREF: PlayerComponent_LoadTripleField_9E682+AAj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0
		inc	dx

loc_9E729:				; CODE XREF: PlayerComponent_LoadTripleField_9E682+92j
		cmp	dx, 8
		jl	short loc_9E716
		pop	si
		pop	bp
		retf
PlayerComponent_LoadTripleField_9E682	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_6BF74 (externe). Appelée par PlayerComponent_Helper_9E651.
; ==============================================================================================
PlayerComponent_ApplyExternalHelper_9E731	proc far		; CODE XREF: VROOMM_StubThunk_6C3B7J
					; PlayerComponent_Helper_9E651:loc_9E662p	...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]

loc_9E73B:
		cmp	byte ptr es:[bx+15h], 0
		jz	short loc_9E77C

loc_9E742:
		mov	eax, es:[bx+16h]

loc_9E747:
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_9E773
; ���������������������������������������������������������������������������

loc_9E74F:				; CODE XREF: PlayerComponent_ApplyExternalHelper_9E731+49j
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_9E76E
		push	word ptr es:[bx]
		push	[bp+arg_4]
		call	VROOMM_StubThunk_6BF74
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 0

loc_9E76E:				; CODE XREF: PlayerComponent_ApplyExternalHelper_9E731+25j
		inc	si
		add	word ptr [bp+var_4], 2

loc_9E773:				; CODE XREF: PlayerComponent_ApplyExternalHelper_9E731+1Cj
		les	bx, [bp+arg_0]
		cmp	es:[bx+13h], si
		jg	short loc_9E74F

loc_9E77C:				; CODE XREF: PlayerComponent_ApplyExternalHelper_9E731+Fj
		pop	si
		leave
		retf
PlayerComponent_ApplyExternalHelper_9E731	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 83 lignes, NON DÉTAILLÉE — combine sub_3914B, sub_38C12, dispatch vtable [bx+0x40],
; sub_6BF6F. Appelée par sub_9F4ED.
; ==============================================================================================
PlayerComponent_ComputeDerived_9E77F	proc far		; CODE XREF: VROOMM_StubThunk_6C3ADJ
					; PlayerComponent_FullReleaseAndLoad_9F4ED:loc_9F5EDp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	cx, [bp+arg_8]
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Fh], 0
		cmp	[bp+arg_4], 0
		jz	short locret_9E810
		or	cx, cx
		jz	short locret_9E810
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		xor	dx, dx
		jmp	short loc_9E80C
; ���������������������������������������������������������������������������

loc_9E7AB:				; CODE XREF: PlayerComponent_ComputeDerived_9E77F+8Fj
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0

loc_9E7B3:
		jz	short loc_9E7BE
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_9E7C0
; ���������������������������������������������������������������������������

loc_9E7BE:				; CODE XREF: PlayerComponent_ComputeDerived_9E77F:loc_9E7B3j
		xor	ax, ax

loc_9E7C0:				; CODE XREF: PlayerComponent_ComputeDerived_9E77F+3Dj
		les	bx, [bp+arg_0]

loc_9E7C3:
		cmp	ax, es:[bx+0Dh]
		jnz	short loc_9E807
		mov	eax, [bp+var_4]
		mov	es:[bx+0Fh], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 4
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]

loc_9E7EB:
		mov	es:[bx+1Ah], eax
		les	bx, [bp+var_8]

loc_9E7F3:
		mov	eax, es:[bx+4]

loc_9E7F8:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], eax
		mov	byte ptr es:[bx+22h], 0
		jmp	short locret_9E810
; ���������������������������������������������������������������������������

loc_9E807:				; CODE XREF: PlayerComponent_ComputeDerived_9E77F+48j
		inc	dx
		add	word ptr [bp+var_4], 12h

loc_9E80C:				; CODE XREF: PlayerComponent_ComputeDerived_9E77F+2Aj
		cmp	dx, cx
		jl	short loc_9E7AB

locret_9E810:				; CODE XREF: PlayerComponent_ComputeDerived_9E77F+1Aj
					; PlayerComponent_ComputeDerived_9E77F+1Ej ...
		leave
		retf
PlayerComponent_ComputeDerived_9E77F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 297 lignes, NON DÉTAILLÉE — référencée via jmp depuis un stub VROOMM (via
; sub_9F212). Candidat pour session dédiée.
; ==============================================================================================
PlayerComponent_ComputeComplex_9E812	proc far		; CODE XREF: VROOMM_StubThunk_6C3B2J
					; PlayerComponent_HelperVariantB_9F212:loc_9F235p

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	[bp+var_C], 0
		mov	[bp+var_10], 0
		mov	[bp+var_14], 0
		les	bx, [bp+arg_0]

loc_9E835:
		cmp	dword ptr es:[bx+0Fh], 0

loc_9E83B:
		jnz	short loc_9E840
		jmp	loc_9EA2A
; ���������������������������������������������������������������������������

loc_9E840:				; CODE XREF: PlayerComponent_ComputeComplex_9E812:loc_9E83Bj
		les	bx, es:[bx+0Fh]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_9E84E
		jmp	loc_9EA2A
; ���������������������������������������������������������������������������

loc_9E84E:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+37j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 0
		jg	short loc_9E85B
		jmp	loc_9EA2A
; ���������������������������������������������������������������������������

loc_9E85B:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+44j
		les	bx, es:[bx+0Fh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_9E86F
		les	bx, es:[bx]
		mov	al, es:[bx+4Ah]
		jmp	short loc_9E871
; ���������������������������������������������������������������������������

loc_9E86F:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+52j
		mov	al, 17h

loc_9E871:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+5Bj
		cmp	al, 0Dh

loc_9E873:
		jnz	short loc_9E878
		jmp	loc_9EA2A
; ���������������������������������������������������������������������������

loc_9E878:				; CODE XREF: PlayerComponent_ComputeComplex_9E812:loc_9E873j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Fh]
		les	bx, es:[bx]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx

loc_9E890:
		push	0
		push	ax

loc_9E893:
		push	dx

loc_9E894:
		call	Particle_PoolWait

loc_9E899:
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx

loc_9E89F:
		mov	word ptr [bp+var_8], ax

loc_9E8A2:
		cmp	[bp+var_8], 0
		jz	short loc_9E8E2
		les	bx, [bp+var_8]
		mov	eax, es:[bx+2Fh]

loc_9E8B1:
		mov	[bp+var_C], eax

loc_9E8B5:
		mov	eax, es:[bx+33h]

loc_9E8BA:
		sub	[bp+var_C], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+23h]
		sub	[bp+var_10], eax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	eax, es:[bx+2Bh]
		sub	[bp+var_14], eax

loc_9E8E2:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+95j
		cmp	[bp+arg_4], 0
		jnz	short loc_9E8EB

loc_9E8E8:
		jmp	loc_9EA2A
; ���������������������������������������������������������������������������

loc_9E8EB:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+D4j
		xor	di, di
		jmp	loc_9EA1E
; ���������������������������������������������������������������������������

loc_9E8F0:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+215j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		cmp	word ptr es:[bx], 0
		jz	short loc_9E906
		jmp	loc_9EA1D
; ���������������������������������������������������������������������������

loc_9E906:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+EFj
		push	1
		push	1
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		push	571Ch
		call	Debris_LoadAndInstantiateAlt
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_9E928
		jmp	loc_9EA0B
; ���������������������������������������������������������������������������

loc_9E928:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+111j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, di

loc_9E931:
		shl	ax, 1

loc_9E933:
		add	bx, ax
		mov	es:[bx], si
		push	5B8Ch
		push	si

loc_9E93C:
		mov	bx, [si]

loc_9E93E:
		call	dword ptr [bx+40h]
		add	sp, 4

loc_9E944:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		inc	dx
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		les	dx, [bp+var_18]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[si+12h], eax
		mov	eax, es:[bx+4]

loc_9E963:
		mov	[si+16h], eax
		mov	eax, es:[bx+8]
		mov	[si+1Ah], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		or	di, di
		jnz	short loc_9E986
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 1
		jz	short loc_9E9A3

loc_9E986:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+168j
		cmp	di, 2
		jz	short loc_9E990
		cmp	di, 5
		jnz	short loc_9E9A3

loc_9E990:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+177j
		mov	eax, [bp+var_C]
		shl	eax, 1
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		add	[bp+var_1C], eax

loc_9E9A3:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+172j
					; PlayerComponent_ComputeComplex_9E812+17Cj
		mov	eax, [bp+var_1C]
		sub	[si+1Ah], eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 1
		jle	short loc_9E9F0
		les	bx, es:[bx+0Fh]
		les	bx, es:[bx]
		cmp	word ptr es:[bx+4Bh], 8
		jnz	short loc_9E9CE
		mov	eax, [bp+var_10]
		sar	eax, 1
		mov	[bp+var_10], eax

loc_9E9CE:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+1AFj
		mov	ax, di
		and	ax, 3
		or	ax, ax
		jz	short loc_9E9DE
		cmp	ax, 1
		jz	short loc_9E9E8
		jmp	short loc_9E9F0
; ���������������������������������������������������������������������������

loc_9E9DE:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+1C3j
		mov	eax, [bp+var_10]

loc_9E9E2:
		sub	[si+12h], eax
		jmp	short loc_9E9F0
; ���������������������������������������������������������������������������

loc_9E9E8:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+1C8j
		mov	eax, [bp+var_10]

loc_9E9EC:
		add	[si+12h], eax

loc_9E9F0:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+1A1j
					; PlayerComponent_ComputeComplex_9E812+1CAj ...
		cmp	di, 3

loc_9E9F3:
		jl	short loc_9E9FD
		mov	eax, [bp+var_14]
		add	[si+16h], eax

loc_9E9FD:				; CODE XREF: PlayerComponent_ComputeComplex_9E812:loc_9E9F3j
		push	si
		push	[bp+arg_4]
		call	VROOMM_StubThunk_6BF6F
		add	sp, 4
		jmp	short loc_9EA1D
; ���������������������������������������������������������������������������

loc_9EA0B:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+113j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0

loc_9EA1D:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+F1j
					; PlayerComponent_ComputeComplex_9E812+1F7j
		inc	di

loc_9EA1E:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+DBj
		les	bx, [bp+arg_0]
		cmp	es:[bx+13h], di
		jle	short loc_9EA2A
		jmp	loc_9E8F0
; ���������������������������������������������������������������������������

loc_9EA2A:				; CODE XREF: PlayerComponent_ComputeComplex_9E812+2Bj
					; PlayerComponent_ComputeComplex_9E812+39j ...
		pop	di
		pop	si
		leave
		retf
PlayerComponent_ComputeComplex_9E812	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 269 lignes, NON DÉTAILLÉE — appelle sub_2E74 (externe), référencée 3 fois par
; sub_9F286. Candidat pour session dédiée.
; ==============================================================================================
PlayerComponent_ComputeComplexB_9EA2E	proc far		; CODE XREF: VROOMM_StubThunk_6C3BCJ PlayerComponent_OrchestrateComplex_9F286+99p	...

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp

loc_9EA31:
		sub	sp, 0Ah
		push	si
		push	di

loc_9EA36:
		mov	di, [bp+arg_8]

loc_9EA39:
		mov	[bp+var_2], 0

loc_9EA3E:
		cmp	[bp+arg_4], 0

loc_9EA43:
		jnz	short loc_9EA48

loc_9EA45:
		jmp	loc_9EB8A
; ���������������������������������������������������������������������������

loc_9EA48:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EA43j
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_9EA5B
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_9EA5D
; ���������������������������������������������������������������������������

loc_9EA5B:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+22j
		xor	ax, ax

loc_9EA5D:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+2Bj
		mov	si, ax
		les	bx, [bp+arg_0]

loc_9EA62:
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_9EA72
		cmp	es:[bx+0Dh], si
		jz	short loc_9EA72
		jmp	loc_9EB8A
; ���������������������������������������������������������������������������

loc_9EA72:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+39j
					; PlayerComponent_ComputeComplexB_9EA2E+3Fj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+15h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		jbe	short loc_9EA85
		jmp	loc_9EB21	; default
; ���������������������������������������������������������������������������

loc_9EA85:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+52j
		shl	bx, 1
		jmp	cs:off_9EBCD[bx] ; switch jump

loc_9EA8C:				; DATA XREF: seg432:off_9EBCDo
		mov	ax, si		; case 0x0
		cmp	ax, 800h

loc_9EA91:
		jz	short loc_9EA96
		jmp	loc_9EB1F	; default
; ���������������������������������������������������������������������������

loc_9EA96:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EA91j
		mov	dx, di
		jmp	loc_9EB21	; default
; ���������������������������������������������������������������������������
		jmp	loc_9EB1F	; default
; ���������������������������������������������������������������������������

loc_9EA9E:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+59j
					; DATA XREF: seg432:off_9EBCDo
		mov	ax, si		; case 0x4
		cmp	ax, 1

loc_9EAA3:				; case 0x80
		jz	short loc_9EB1A
		cmp	ax, 2
		jz	short loc_9EB1A	; case 0x80
		jmp	short loc_9EB1F	; default
; ���������������������������������������������������������������������������
		jmp	short loc_9EB1A	; case 0x80
; ���������������������������������������������������������������������������
		jmp	short loc_9EB1F	; default
; ���������������������������������������������������������������������������

loc_9EAB0:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+59j
					; DATA XREF: seg432:off_9EBCDo
		mov	ax, si		; case 0x1
		cmp	ax, 1
		jz	short loc_9EB1A	; case 0x80
		cmp	ax, 2
		jz	short loc_9EB1A	; case 0x80
		cmp	ax, 100h
		jz	short loc_9EB1A	; case 0x80
		jmp	short loc_9EB1F	; default
; ���������������������������������������������������������������������������
		jmp	short loc_9EB1A	; case 0x80
; ���������������������������������������������������������������������������
		jmp	short loc_9EB1F	; default
; ���������������������������������������������������������������������������

loc_9EAC7:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+59j
					; DATA XREF: seg432:off_9EBCDo
		mov	[bp+var_4], si	; case 0x2
		mov	cx, 9		; switch 9 cases
		mov	bx, offset word_9EBA9

loc_9EAD0:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+ADj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_9EADF
		add	bx, 2
		loop	loc_9EAD0
		jmp	short loc_9EB1F	; default
; ���������������������������������������������������������������������������

loc_9EADF:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+A8j
		jmp	word ptr cs:[bx+12h] ; switch jump
; ���������������������������������������������������������������������������
		jmp	short loc_9EB0B	; case 0x8
; ���������������������������������������������������������������������������

loc_9EAE5:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EADFj
					; DATA XREF: seg432:0D5Bo
		jmp	short loc_9EB0B	; case 0x8
; ���������������������������������������������������������������������������

loc_9EAE7:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EADFj
					; DATA XREF: seg432:0D5Bo
		jmp	short loc_9EB10	; case 0x4
; ���������������������������������������������������������������������������

loc_9EAE9:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EADFj
					; DATA XREF: seg432:0D5Bo
		jmp	short loc_9EB15	; case 0x10
; ���������������������������������������������������������������������������

loc_9EAEB:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EADFj
					; DATA XREF: seg432:0D5Bo
		jmp	short loc_9EB1A	; case 0x1
; ���������������������������������������������������������������������������
		jmp	short loc_9EB1F	; default
; ���������������������������������������������������������������������������

loc_9EAEF:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+59j
					; DATA XREF: seg432:off_9EBCDo
		mov	[bp+var_6], si	; case 0x3

loc_9EAF2:				; switch 6 cases
		mov	cx, 6
		mov	bx, offset word_9EB91

loc_9EAF8:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+D5j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_6]
		jz	short loc_9EB07
		add	bx, 2
		loop	loc_9EAF8
		jmp	short loc_9EB1F	; default
; ���������������������������������������������������������������������������

loc_9EB07:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+D0j
		jmp	word ptr cs:[bx+0Ch] ; switch jump

loc_9EB0B:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+B5j
					; PlayerComponent_ComputeComplexB_9EA2E:loc_9EAE5j
					; DATA XREF: ...
		mov	dx, 2		; case 0x8
		jmp	short loc_9EB21	; default
; ���������������������������������������������������������������������������

loc_9EB10:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EAE7j
					; PlayerComponent_ComputeComplexB_9EA2E:loc_9EB07j
					; DATA XREF: ...
		mov	dx, 3		; case 0x4
		jmp	short loc_9EB21	; default
; ���������������������������������������������������������������������������

loc_9EB15:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EAE9j
					; PlayerComponent_ComputeComplexB_9EA2E:loc_9EB07j
					; DATA XREF: ...
		mov	dx, 6		; case 0x10
		jmp	short loc_9EB21	; default
; ���������������������������������������������������������������������������

loc_9EB1A:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EAA3j
					; PlayerComponent_ComputeComplexB_9EA2E+7Aj ...
		mov	dx, 1		; case 0x80
		jmp	short loc_9EB21	; default
; ���������������������������������������������������������������������������

loc_9EB1F:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+65j
					; PlayerComponent_ComputeComplexB_9EA2E+6Dj ...
		xor	dx, dx		; default

loc_9EB21:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+54j
					; PlayerComponent_ComputeComplexB_9EA2E+6Aj ...
		les	bx, [bp+arg_0]	; default
		mov	ax, di
		add	ax, es:[bx+13h]
		cmp	ax, dx
		jg	short loc_9EB37
		add	es:[bx+13h], di
		mov	[bp+var_2], di
		jmp	short loc_9EB47
; ���������������������������������������������������������������������������

loc_9EB37:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+FEj
		les	bx, [bp+arg_0]
		mov	ax, dx

loc_9EB3C:
		sub	ax, es:[bx+13h]
		mov	[bp+var_2], ax
		mov	es:[bx+13h], dx

loc_9EB47:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E+107j
		cmp	[bp+var_2], 0
		jle	short loc_9EB8A
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], si
		mov	eax, [bp+arg_4]
		mov	es:[bx+0Fh], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 4
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		push	8
		push	ax
		push	dx
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+22h], 0

loc_9EB8A:				; CODE XREF: PlayerComponent_ComputeComplexB_9EA2E:loc_9EA45j
					; PlayerComponent_ComputeComplexB_9EA2E+41j ...
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
PlayerComponent_ComputeComplexB_9EA2E	endp

; ���������������������������������������������������������������������������
word_9EB91	dw	4,     8,   10h,   20h ; DATA XREF: PlayerComponent_ComputeComplexB_9EA2E+C7o
		dw    40h,   80h	; value	table for switch statement
off_9EB9D	dw offset loc_9EB10	; jump table for switch	statement
		dw offset loc_9EB0B
		dw offset loc_9EB15
		dw offset loc_9EB15
		dw offset loc_9EB10
		dw offset loc_9EB1A
word_9EBA9	dw	1,     2,     4,     8 ; DATA XREF: PlayerComponent_ComputeComplexB_9EA2E+9Fo
		dw    10h,   20h,   40h,   80h ; value table for switch	statement
		dw   100h
		dw offset loc_9EAEB	; jump table for switch	statement
		dw offset loc_9EAEB
		dw offset loc_9EAE7
		dw offset loc_9EAE5
		dw offset loc_9EAE9
		dw offset loc_9EAE9
		dw offset loc_9EAE7
		dw offset loc_9EAEB
		dw offset loc_9EAE5
off_9EBCD	dw offset loc_9EA8C	; DATA XREF: PlayerComponent_ComputeComplexB_9EA2E+59r
		dw offset loc_9EAB0	; jump table for switch	statement
		dw offset loc_9EAC7
		dw offset loc_9EAEF
		dw offset loc_9EA9E

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFreeWrapper_5C6F3 et PlayerComponent_Dispatch_9ED62. Référencée via
; jmp depuis un stub VROOMM (sub_6C43E).
; ==============================================================================================
PlayerComponent_ReleaseAndLoad_9EBD7	proc far		; CODE XREF: VROOMM_StubThunk_6C43EJ

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		push	large 58h ; 'X'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		or	ax, dx
		jz	short loc_9EC3B
		les	bx, [bp+var_6]
		mov	word ptr es:[bx+0Dh], 0
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+11h], 0
		push	[bp+var_2]
		push	dx
		push	bx
		nop
		push	cs
		call	near ptr PlayerComponent_Dispatch_9ED62

loc_9EC30:
		add	sp, 6

loc_9EC33:
		mov	dx, word ptr [bp+var_6+2]

loc_9EC36:
		mov	ax, word ptr [bp+var_6]

loc_9EC39:
		jmp	short loc_9EC41
; ���������������������������������������������������������������������������

loc_9EC3B:				; CODE XREF: PlayerComponent_ReleaseAndLoad_9EBD7+38j
		mov	dx, word ptr [bp+var_6+2]

loc_9EC3E:
		mov	ax, word ptr [bp+var_6]

loc_9EC41:				; CODE XREF: PlayerComponent_ReleaseAndLoad_9EBD7:loc_9EC39j
		les	bx, [bp+arg_0]

loc_9EC44:
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		leave
		retf
PlayerComponent_ReleaseAndLoad_9EBD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine PlayerComponent_SetReferenceHelper_9EC8A et PlayerComponent_Helper_9ED43.
; Référencée via jmp depuis un stub VROOMM (sub_6C3C6) et par plusieurs fonctions du cluster.
; ==============================================================================================
PlayerComponent_DispatchPair_9EC4D	proc far		; CODE XREF: VROOMM_StubThunk_6C3C6J PlayerComponent_Dispatch_9ED62+1Fp	...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PlayerComponent_SetReferenceHelper_9EC8A
		add	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PlayerComponent_Helper_9ED43
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+3Eh], 4E20h
		mov	word ptr es:[bx+42h], 3Ch ; '<'
		mov	byte ptr es:[bx+57h], 0
		pop	bp
		retf
PlayerComponent_DispatchPair_9EC4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_3A44E (SetReference, motif de référence faible) ×2. Référencée via jmp
; depuis un stub VROOMM (sub_6C402).
; ==============================================================================================
PlayerComponent_SetReferenceHelper_9EC8A	proc far		; CODE XREF: VROOMM_StubThunk_6C402J PlayerComponent_DispatchPair_9EC4D+12p	...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+6], ax
		mov	es:[bx+4], ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		mov	byte ptr es:[bx+13h], 1
		mov	byte ptr es:[bx+8], 0
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+28h], eax

loc_9ECBB:
		mov	es:[bx+24h], eax

loc_9ECC0:
		mov	es:[bx+2Ch], eax

loc_9ECC5:
		mov	byte ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+0Ch], 0
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference

loc_9ECE0:
		add	sp, 6

loc_9ECE3:
		les	bx, [bp+arg_0]

loc_9ECE6:
		mov	dword ptr es:[bx+14h], 0

loc_9ECEF:
		mov	dword ptr es:[bx+18h], 0
		mov	word ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx+1Eh], 0
		mov	byte ptr es:[bx+44h], 0
		mov	byte ptr es:[bx+55h], 0
		mov	byte ptr es:[bx+56h], 0
		mov	dword ptr es:[bx+51h], 0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	es:[bx+20h], eax
		push	0

loc_9ED2F:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 11h
		push	word ptr [bp+arg_0+2]
		push	ax

loc_9ED39:
		call	SetReference
		add	sp, 6
		leave
		retf
PlayerComponent_SetReferenceHelper_9EC8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible. Référencée via jmp depuis un stub VROOMM (sub_6C407) et
; par PlayerComponent_DispatchPair_9EC4D.
; ==============================================================================================
PlayerComponent_Helper_9ED43	proc far		; CODE XREF: VROOMM_StubThunk_6C407J PlayerComponent_DispatchPair_9EC4D+1Ep	...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+34h], 0

loc_9ED52:
		xor	ax, ax

loc_9ED54:
		mov	es:[bx+3Ch], ax
		mov	es:[bx+3Ah], ax

loc_9ED5C:
		mov	es:[bx+38h], ax

loc_9ED60:
		pop	bp
		retf
PlayerComponent_Helper_9ED43	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 68 lignes, NON DÉTAILLÉE — combine PlayerComponent_DispatchPair_9EC4D, sub_9EF74,
; ResourceRecord_SeekAndReadB_647B2 (seg193), sub_2AFE0, sub_9EFBE. Référencée via jmp depuis
; un stub VROOMM (sub_6C3D0).
; ==============================================================================================
PlayerComponent_Dispatch_9ED62	proc far		; CODE XREF: VROOMM_StubThunk_6C3D0J PlayerComponent_ReleaseAndLoad_9EBD7+56p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_9ED63:
		mov	bp, sp

loc_9ED65:
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_DispatchPair_9EC4D
		add	sp, 4
		push	si
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PlayerComponent_LoadSequence_9EF74
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9EDD1
		push	0
		push	large 4C494657h
		push	si

loc_9EDA3:
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_9EDD1
		mov	[bp+var_C], si
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax

loc_9EDB9:
		call	String_ConstructFromPtrLen
		add	sp, 4

loc_9EDC1:
		lea	ax, [bp+var_A]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PlayerComponent_ConstructFromStream_9EFBE
		add	sp, 6

loc_9EDD1:				; CODE XREF: PlayerComponent_Dispatch_9ED62+36j
					; PlayerComponent_Dispatch_9ED62+4Bj
		pop	si
		leave
		retf
PlayerComponent_Dispatch_9ED62	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 239 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743 (seg193),
; Memory_TypedFree_5C7B6, PlayerComponent_SetReferenceHelper_9EC8A,
; PlayerComponent_LoadFromResourceRecord_9DF63, sub_2E3C, sub_2DF4, sub_9F286. Candidat pour
; session dédiée.
; ==============================================================================================
PlayerComponent_LoadAndApply_9EDD4	proc far		; CODE XREF: VROOMM_StubThunk_6C3E4J PlayerComponent_LoadSequence_9EF74+37p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]

loc_9EDDF:
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+34h], 0
		jnz	short loc_9EDFD
		jmp	loc_9EF70
; ���������������������������������������������������������������������������

loc_9EDFD:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+24j
		push	0
		push	large 534E5057h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9EE15
		jmp	loc_9EF70
; ���������������������������������������������������������������������������

loc_9EE15:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+3Cj
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+14h], 0
		jz	short loc_9EE3C
		push	0
		push	2
		mov	eax, es:[bx+14h]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax

loc_9EE31:
		push	5C44h

loc_9EE34:
		call	Memory_TypedFree_5C7B6

loc_9EE39:
		add	sp, 8

loc_9EE3C:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+4Aj
		push	large [bp+arg_0]
		push	cs

loc_9EE41:
		call	near ptr PlayerComponent_SetReferenceHelper_9EC8A

loc_9EE44:
		add	sp, 4

loc_9EE47:
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx

loc_9EE56:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], ax

loc_9EE5D:
		cmp	word ptr es:[bx+1Ch], 0
		jg	short loc_9EE67
		jmp	loc_9EF70
; ���������������������������������������������������������������������������

loc_9EE67:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+8Ej
		push	1
		push	0
		push	2
		mov	ax, es:[bx+1Ch]
		inc	ax
		imul	ax, 12h
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], dx
		mov	es:[bx+14h], ax

loc_9EE91:
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_9EE9C
		jmp	loc_9EF70
; ���������������������������������������������������������������������������

loc_9EE9C:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+C3j
		mov	eax, es:[bx+14h]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_9EF00
; ���������������������������������������������������������������������������

loc_9EEA9:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+133j
		push	si
		push	large [bp+var_8]
		push	cs
		call	near ptr PlayerComponent_LoadFromResourceRecord_9DF63

loc_9EEB2:
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]

loc_9EEBC:
		les	bx, [bp+var_8]

loc_9EEBF:
		mov	es:[bx+0Dh], ax

loc_9EEC3:
		push	8
		push	ds

loc_9EEC6:				; "POD"
		push	offset aPod
		mov	ax, word ptr [bp+var_8]

loc_9EECC:
		add	ax, 4

loc_9EECF:
		push	word ptr [bp+var_8+2]

loc_9EED2:
		push	ax

loc_9EED3:
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_9EEE4

loc_9EEDF:
		mov	ax, 1
		jmp	short loc_9EEE6
; ���������������������������������������������������������������������������

loc_9EEE4:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+109j
		xor	ax, ax

loc_9EEE6:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+10Ej
		or	al, al
		jz	short loc_9EEFB
		les	bx, [bp+var_8]
		mov	ax, es:[bx+10h]

loc_9EEF1:
		imul	ax, 13h

loc_9EEF4:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], ax

loc_9EEFB:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+114j
		inc	di
		add	word ptr [bp+var_8], 12h

loc_9EF00:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+D3j
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], di
		jg	short loc_9EEA9
		inc	word ptr es:[bx+1Ch]
		mov	ax, es:[bx+9]
		les	bx, [bp+var_8]
		mov	es:[bx+0Dh], ax
		mov	dword ptr es:[bx], 0
		push	ds
		push	offset dword_704CD
		mov	ax, word ptr [bp+var_8]
		add	ax, 4
		push	word ptr [bp+var_8+2]
		push	ax

loc_9EF2E:
		call	CRT_MemFamily_Extra5

loc_9EF33:
		add	sp, 8

loc_9EF36:
		les	bx, [bp+var_8]

loc_9EF39:
		mov	byte ptr es:[bx+0Fh], 0

loc_9EF3E:
		mov	word ptr es:[bx+10h], 0

loc_9EF44:
		les	bx, [bp+arg_0]

loc_9EF47:
		mov	ax, es:[bx+1Ch]
		dec	ax
		mov	es:[bx+6], ax

loc_9EF50:
		mov	ax, es:[bx+6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], ax

loc_9EF5C:
		mov	byte ptr es:[bx+13h], 1
		mov	es:[bx], ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PlayerComponent_OrchestrateComplex_9F286
		add	sp, 4

loc_9EF70:				; CODE XREF: PlayerComponent_LoadAndApply_9EDD4+26j
					; PlayerComponent_LoadAndApply_9EDD4+3Ej ...
		pop	di
		pop	si
		leave
		retf
PlayerComponent_LoadAndApply_9EDD4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndReadB_647B2, sub_9F07F,
; PlayerComponent_LoadAndApply_9EDD4, ResourceRecord_ReleaseAndClear_64D25 (seg193).
; Référencée via jmp depuis un stub VROOMM (sub_6C3D5) et par PlayerComponent_Dispatch_9ED62.
; ==============================================================================================
PlayerComponent_LoadSequence_9EF74	proc far		; CODE XREF: VROOMM_StubThunk_6C3D5J PlayerComponent_Dispatch_9ED62+2Cp	...

var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 50414557h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		mov	[bp+var_1], al

loc_9EF92:
		cmp	[bp+var_1], 0
		jz	short loc_9EFB8
		push	si
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PlayerComponent_LoadMultiField_9F07F
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_LoadAndApply_9EDD4
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_9EFB8:				; CODE XREF: PlayerComponent_LoadSequence_9EF74+22j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
PlayerComponent_LoadSequence_9EF74	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 103 lignes, NON DÉTAILLÉE — combine sub_2B06C, StreamReader_ConstructVariantA_63A39
; (seg190), dispatch vtable [bx+0x14], PlayerComponent_LoadSequence_9EF74, gestion d'erreur
; (sub_6B70F), sub_645A5 (seg193), StreamReader_ReleaseBuffer_65643 (seg195). Référencée via
; jmp depuis un stub VROOMM (sub_6C3DA) et par PlayerComponent_Dispatch_9ED62.
; ==============================================================================================
PlayerComponent_ConstructFromStream_9EFBE	proc far		; CODE XREF: VROOMM_StubThunk_6C3DAJ PlayerComponent_Dispatch_9ED62+69p

var_FA		= word ptr -0FAh
var_9D		= dword	ptr -9Dh
var_99		= dword	ptr -99h
var_95		= dword	ptr -95h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_9EFC1:
		sub	sp, 0FAh

loc_9EFC5:
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	[bp+arg_4]

loc_9EFCF:
		push	ds
		push	offset aObjects	; "OBJECTS"
		lea	ax, [bp+var_52]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		mov	[bp+var_1], 0

loc_9EFE3:
		lea	ax, [bp+var_FA]

loc_9EFE7:
		push	ax

loc_9EFE8:
		call	StreamReader_ConstructVariantA_63A39
		pop	cx

loc_9EFEE:
		mov	[bp+var_FA], 2C8h
		mov	[bp+var_99], 100h
		mov	[bp+var_9D], 0
		mov	[bp+var_FA], 2E0h
		mov	[bp+var_7E], 0
		xor	ax, ax
		mov	[bp+var_80], ax
		movsx	eax, ax
		mov	[bp+var_95], eax
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		mov	bx, [bp+var_FA]
		call	dword ptr [bx+14h]

loc_9F031:
		add	sp, 6
		or	al, al

loc_9F036:
		jz	short loc_9F04B
		lea	ax, [bp+var_FA]
		push	ax

loc_9F03D:
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_LoadSequence_9EF74
		add	sp, 6
		mov	[bp+var_1], al

loc_9F04B:				; CODE XREF: PlayerComponent_ConstructFromStream_9EFBE:loc_9F036j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9F05D
		push	0C01Bh

loc_9F057:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9F05D:				; CODE XREF: PlayerComponent_ConstructFromStream_9EFBE+94j
		mov	[bp+var_FA], 2E0h
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_FA]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		leave
		retf
PlayerComponent_ConstructFromStream_9EFBE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 176 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743 (×2),
; ResourceRecord_ReadFieldGroupC_64A7E, ResourceRecord_ReadFieldGroupB_64A54, sub_9F82C,
; Memory_TypedFree_5C7B6, PlayerComponent_Helper_9ED43. Référencée via jmp depuis un stub
; VROOMM (sub_6C3DF) et par PlayerComponent_LoadSequence_9EF74.
; ==============================================================================================
PlayerComponent_LoadMultiField_9F07F	proc far		; CODE XREF: VROOMM_StubThunk_6C3DFJ PlayerComponent_LoadSequence_9EF74+2Bp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9F0C0
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+3Eh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+42h], ax

loc_9F0C0:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+1Ej
		push	0

loc_9F0C2:
		push	large 53545048h
		push	si

loc_9F0C9:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9F0D8
		jmp	loc_9F18A
; ���������������������������������������������������������������������������

loc_9F0D8:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+54j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+34h], 0
		jz	short loc_9F10E
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PlayerComponent_ReleaseHelperB_9F82C
		add	sp, 4
		push	0
		push	2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_9F10E:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+62j
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_Helper_9ED43
		add	sp, 4
		mov	eax, [si+72h]
		mov	ebx, 0Dh
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+38h], ax
		push	1
		push	0

loc_9F133:
		push	2
		mov	ax, es:[bx+38h]
		imul	ax, 23h

loc_9F13C:
		movzx	eax, ax
		push	eax

loc_9F142:
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], dx

loc_9F154:
		mov	es:[bx+34h], ax

loc_9F158:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_9F15E:
		cmp	[bp+var_8], 0
		jnz	short loc_9F16B

loc_9F165:
		mov	word ptr es:[bx+38h], 0

loc_9F16B:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+E4j
		xor	di, di
		jmp	short loc_9F181
; ���������������������������������������������������������������������������

loc_9F16F:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+109j
		push	di
		push	si
		push	large [bp+var_8]
		push	cs
		call	near ptr PlayerComponent_LoadTripleField_9E682
		add	sp, 8
		inc	di
		add	word ptr [bp+var_8], 23h ; '#'

loc_9F181:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+EEj
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], di
		jg	short loc_9F16F

loc_9F18A:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+56j
		push	0
		push	large 594F4344h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9F1BD
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+3Ch], ax
		push	si

loc_9F1AE:
		call	ResourceRecord_ReadFieldGroupB_64A54

loc_9F1B3:
		pop	cx
		les	bx, [bp+arg_0]

loc_9F1B7:
		mov	es:[bx+3Ah], ax
		jmp	short loc_9F1CC
; ���������������������������������������������������������������������������

loc_9F1BD:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+11Ej
		les	bx, [bp+arg_0]

loc_9F1C0:
		mov	word ptr es:[bx+3Ch], 0

loc_9F1C6:
		mov	word ptr es:[bx+3Ah], 0

loc_9F1CC:				; CODE XREF: PlayerComponent_LoadMultiField_9F07F+13Cj
		pop	di
		pop	si
		leave
		retf
PlayerComponent_LoadMultiField_9F07F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_Helper_9E651. Référencée via jmp depuis un stub VROOMM
; (sub_6C3C1) et par sub_9F286.
; ==============================================================================================
PlayerComponent_HelperVariantA_9F1D0	proc far		; CODE XREF: VROOMM_StubThunk_6C3C1J PlayerComponent_OrchestrateComplex_9F286+2Fp

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+34h], 0
		jz	short loc_9F20F
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_9F206
; ���������������������������������������������������������������������������

loc_9F1EF:				; CODE XREF: PlayerComponent_HelperVariantA_9F1D0+3Dj
		les	bx, [bp+arg_0]

loc_9F1F2:
		push	word ptr es:[bx+9]
		push	large [bp+var_4]
		push	cs
		call	near ptr PlayerComponent_Helper_9E651
		add	sp, 6
		inc	si
		add	word ptr [bp+var_4], 23h ; '#'

loc_9F206:				; CODE XREF: PlayerComponent_HelperVariantA_9F1D0+1Dj
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jg	short loc_9F1EF

loc_9F20F:				; CODE XREF: PlayerComponent_HelperVariantA_9F1D0+10j
		pop	si
		leave
		retf
PlayerComponent_HelperVariantA_9F1D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_ComputeComplex_9E812. Référencée via jmp depuis un stub VROOMM
; (sub_6C420) et par sub_9F92A.
; ==============================================================================================
PlayerComponent_HelperVariantB_9F212	proc far		; CODE XREF: VROOMM_StubThunk_6C420J PlayerComponent_UpdateFromCache_9F92A+2Dp

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_9F240
; ���������������������������������������������������������������������������

loc_9F229:				; CODE XREF: PlayerComponent_HelperVariantB_9F212+35j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]

loc_9F230:
		push	large [bp+var_4]
		push	cs

loc_9F235:
		call	near ptr PlayerComponent_ComputeComplex_9E812

loc_9F238:
		add	sp, 6
		inc	si

loc_9F23C:
		add	word ptr [bp+var_4], 23h ; '#'

loc_9F240:				; CODE XREF: PlayerComponent_HelperVariantB_9F212+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jg	short loc_9F229
		pop	si
		leave
		retf
PlayerComponent_HelperVariantB_9F212	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_ApplyExternalHelper_9E731. Référencée via jmp depuis un stub
; VROOMM (sub_6C425) et par sub_9F92A.
; ==============================================================================================
PlayerComponent_HelperVariantC_9F24C	proc far		; CODE XREF: VROOMM_StubThunk_6C425J PlayerComponent_UpdateFromCache_9F92A+53p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_9F24F:
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]

loc_9F256:
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_9F27A
; ���������������������������������������������������������������������������

loc_9F263:				; CODE XREF: PlayerComponent_HelperVariantC_9F24C+35j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_4]
		push	cs
		call	near ptr PlayerComponent_ApplyExternalHelper_9E731
		add	sp, 6
		inc	si
		add	word ptr [bp+var_4], 23h ; '#'

loc_9F27A:				; CODE XREF: PlayerComponent_HelperVariantC_9F24C+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jg	short loc_9F263
		pop	si
		leave
		retf
PlayerComponent_HelperVariantC_9F24C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 230 lignes, NON DÉTAILLÉE — combine PlayerComponent_HelperVariantA_9F1D0,
; PlayerComponent_ComputeComplexB_9EA2E (×3), dispatch vtable [bx+0x10]. Référencée via jmp
; depuis un stub VROOMM (sub_6C3E9) et par PlayerComponent_LoadAndApply_9EDD4. Candidat pour
; session dédiée.
; ==============================================================================================
PlayerComponent_OrchestrateComplex_9F286	proc far		; CODE XREF: VROOMM_StubThunk_6C3E9J PlayerComponent_LoadAndApply_9EDD4+196p

var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_9F29C
		jmp	loc_9F37F
; ���������������������������������������������������������������������������

loc_9F29C:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+11j
		cmp	dword ptr es:[bx+34h], 0
		jnz	short loc_9F2A7
		jmp	loc_9F37F
; ���������������������������������������������������������������������������

loc_9F2A7:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+1Cj
		mov	eax, es:[bx+14h]
		mov	[bp+var_C], eax

loc_9F2B0:
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr PlayerComponent_HelperVariantA_9F1D0
		add	sp, 4
		xor	di, di
		jmp	loc_9F373
; ���������������������������������������������������������������������������

loc_9F2C0:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+F6j
		les	bx, [bp+arg_0]

loc_9F2C3:
		mov	eax, es:[bx+34h]

loc_9F2C8:
		mov	[bp+var_10], eax
		mov	ax, es:[bx+36h]

loc_9F2D0:
		mov	dx, es:[bx+34h]

loc_9F2D4:
		mov	bx, es:[bx+38h]
		dec	bx
		imul	bx, 23h
		add	dx, bx
		mov	[bp-12h], ax
		mov	word ptr [bp+var_16+2],	dx

loc_9F2E4:
		les	bx, [bp+var_C]
		mov	si, es:[bx+10h]
		jmp	short loc_9F35B
; ���������������������������������������������������������������������������

loc_9F2ED:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+DFj
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_16+2]
		jz	short loc_9F345
		les	bx, [bp+var_10]
		mov	al, es:[bx+15h]
		les	bx, [bp+var_16+2]
		cmp	al, es:[bx+15h]
		jnz	short loc_9F345
		mov	ax, si
		and	ax, 1
		sub	si, ax
		mov	ax, si
		sar	ax, 1
		mov	word ptr [bp+var_16], ax
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_10]
		push	cs
		call	near ptr PlayerComponent_ComputeComplexB_9EA2E
		add	sp, 0Ah
		sub	si, ax
		add	word ptr [bp+var_10], 23h ; '#'
		push	word ptr [bp+var_16]
		push	large [bp+var_C]

loc_9F332:
		push	large [bp+var_16+2]
		push	cs

loc_9F337:
		call	near ptr PlayerComponent_ComputeComplexB_9EA2E

loc_9F33A:
		add	sp, 0Ah
		sub	si, ax

loc_9F33F:
		sub	word ptr [bp+var_16+2],	23h ; '#'
		jmp	short loc_9F35B
; ���������������������������������������������������������������������������

loc_9F345:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+6Fj
					; PlayerComponent_OrchestrateComplex_9F286+7Fj
		push	si

loc_9F346:
		push	large [bp+var_C]
		push	large [bp+var_10]
		push	cs

loc_9F34F:
		call	near ptr PlayerComponent_ComputeComplexB_9EA2E
		add	sp, 0Ah
		sub	si, ax
		add	word ptr [bp+var_10], 23h ; '#'

loc_9F35B:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+65j
					; PlayerComponent_OrchestrateComplex_9F286+BDj
		or	si, si
		jle	short loc_9F367
		mov	ax, word ptr [bp+var_10]
		cmp	ax, word ptr [bp+var_16+2]
		jbe	short loc_9F2ED

loc_9F367:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+D7j
		les	bx, [bp+var_C]
		mov	es:[bx+10h], si
		inc	di
		add	word ptr [bp+var_C], 12h

loc_9F373:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+37j
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], di
		jle	short loc_9F37F
		jmp	loc_9F2C0
; ���������������������������������������������������������������������������

loc_9F37F:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+13j
					; PlayerComponent_OrchestrateComplex_9F286+1Ej ...
		mov	[bp+var_4], 0
		xor	si, si
		jmp	loc_9F413
; ���������������������������������������������������������������������������

loc_9F38C:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+196j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+34h]
		mov	ax, si
		imul	ax, 23h
		add	bx, ax
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_9F412
		les	bx, [bp+arg_0]
		les	bx, es:[bx+34h]
		mov	ax, si
		imul	ax, 23h
		add	bx, ax

loc_9F3AF:
		les	bx, es:[bx+0Fh]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx

loc_9F3C0:
		cmp	[bp+var_C], 0
		jz	short loc_9F412

loc_9F3C7:
		les	bx, [bp+var_C]
		mov	di, es:[bx+36h]
		or	di, di
		jz	short loc_9F412
		push	di
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+10h]
		add	sp, 6
		les	bx, [bp+arg_0]

loc_9F3E3:
		les	bx, es:[bx+34h]
		mov	ax, si
		imul	ax, 23h
		add	bx, ax
		mov	ax, es:[bx+13h]
		mov	[bp-12h], ax
		movsx	eax, word ptr [bp-12h]
		mov	edx, [bp+var_10]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		add	[bp+var_4], eax

loc_9F412:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+119j
					; PlayerComponent_OrchestrateComplex_9F286+13Fj ...
		inc	si

loc_9F413:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+103j
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jle	short loc_9F41F
		jmp	loc_9F38C
; ���������������������������������������������������������������������������

loc_9F41F:				; CODE XREF: PlayerComponent_OrchestrateComplex_9F286+194j
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+20h], eax
		pop	di

loc_9F431:
		pop	si
		leave
		retf
PlayerComponent_OrchestrateComplex_9F286	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 99 lignes, NON DÉTAILLÉE — appelle PlayerComponent_Helper_9E651. Référencée via jmp
; depuis un stub VROOMM (sub_6C3EE).
; ==============================================================================================
PlayerComponent_HelperVariantD_9F434	proc far		; CODE XREF: VROOMM_StubThunk_6C3EEJ

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_9F437:
		sub	sp, 8
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_9F44A
		jmp	loc_9F4CF
; ���������������������������������������������������������������������������

loc_9F44A:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+11j
		cmp	dword ptr es:[bx+34h], 0
		jz	short loc_9F4CF

loc_9F452:
		mov	eax, es:[bx+14h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_9F4C6
; ���������������������������������������������������������������������������

loc_9F45F:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+99j
		les	bx, [bp+var_4]

loc_9F462:
		mov	word ptr es:[bx+10h], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_9F4B8
; ���������������������������������������������������������������������������

loc_9F478:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+8Bj
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_9F48B
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_9F48D
; ���������������������������������������������������������������������������

loc_9F48B:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+4Cj
		xor	ax, ax

loc_9F48D:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+55j
		les	bx, [bp+var_8]
		cmp	ax, es:[bx+0Dh]
		jnz	short loc_9F4B3
		mov	ax, es:[bx+13h]
		les	bx, [bp+var_4]
		add	es:[bx+10h], ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_8]
		push	cs
		call	near ptr PlayerComponent_Helper_9E651
		add	sp, 6

loc_9F4B3:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+60j
		inc	di

loc_9F4B4:
		add	word ptr [bp+var_8], 23h ; '#'

loc_9F4B8:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+42j
		les	bx, [bp+arg_0]

loc_9F4BB:
		cmp	es:[bx+38h], di
		jg	short loc_9F478

loc_9F4C1:
		inc	si

loc_9F4C2:
		add	word ptr [bp+var_4], 12h

loc_9F4C6:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+29j
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jg	short loc_9F45F

loc_9F4CF:				; CODE XREF: PlayerComponent_HelperVariantD_9F434+13j
					; PlayerComponent_HelperVariantD_9F434+1Cj
		pop	di
		pop	si
		leave
		retf
PlayerComponent_HelperVariantD_9F434	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_DispatchPair_9EC4D. Référencée via jmp depuis un stub VROOMM
; (sub_6C3CB).
; ==============================================================================================
PlayerComponent_HelperVariantE_9F4D3	proc far		; CODE XREF: VROOMM_StubThunk_6C3CBJ

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_DispatchPair_9EC4D
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+9], ax
		pop	bp
		retf
PlayerComponent_HelperVariantE_9F4D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 193 lignes, NON DÉTAILLÉE — combine Memory_TypedFreeWrapper_5C6F3 (×2),
; PlayerComponent_ApplyExternalCall_9DED3, PlayerComponent_ReleaseHelper_9E58E,
; PlayerComponent_ComputeDerived_9E77F, sub_3A44E (SetReference). Référencée via jmp depuis un
; stub VROOMM (sub_6C3F3).
; ==============================================================================================
PlayerComponent_FullReleaseAndLoad_9F4ED	proc far		; CODE XREF: VROOMM_StubThunk_6C3F3J
					; PlayerComponent_ReleaseAndReload_9F6EA:loc_9F742p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+1Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], ax
		cmp	word ptr es:[bx+1Ch], 0
		jz	short loc_9F576
		push	1
		push	0
		push	2
		mov	ax, es:[bx+1Ch]
		imul	ax, 12h
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], dx

loc_9F52E:
		mov	es:[bx+14h], ax

loc_9F532:
		mov	eax, es:[bx+14h]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+14h]
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_9F56D
; ���������������������������������������������������������������������������

loc_9F54B:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+87j
		push	large [bp+var_8]
		push	large [bp+var_4]

loc_9F553:
		push	cs
		call	near ptr PlayerComponent_ApplyExternalCall_9DED3

loc_9F557:
		add	sp, 8
		les	bx, [bp+var_4]

loc_9F55D:
		mov	ax, [bp+arg_8]
		mov	es:[bx+0Dh], ax
		inc	si
		add	word ptr [bp+var_4], 12h
		add	word ptr [bp+var_8], 12h

loc_9F56D:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+5Cj
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jg	short loc_9F54B

loc_9F576:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+1Aj
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+38h]
		les	bx, [bp+arg_0]
		mov	es:[bx+38h], ax
		cmp	word ptr es:[bx+38h], 0
		jz	short loc_9F605
		push	1
		push	0
		push	2
		mov	ax, es:[bx+38h]
		imul	ax, 23h
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], dx
		mov	es:[bx+34h], ax
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]

loc_9F5C0:
		mov	eax, es:[bx+34h]
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_9F5FC
; ���������������������������������������������������������������������������

loc_9F5CD:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+116j
		push	large [bp+var_8]

loc_9F5D1:
		push	large [bp+var_4]
		push	cs
		call	near ptr PlayerComponent_ReleaseHelper_9E58E
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Ch]

loc_9F5E3:
		push	large dword ptr	es:[bx+14h]
		push	large [bp+var_4]

loc_9F5EC:
		push	cs

loc_9F5ED:
		call	near ptr PlayerComponent_ComputeDerived_9E77F

loc_9F5F0:
		add	sp, 0Ah
		inc	si

loc_9F5F4:
		add	word ptr [bp+var_4], 23h ; '#'
		add	word ptr [bp+var_8], 23h ; '#'

loc_9F5FC:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+DEj
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jg	short loc_9F5CD

loc_9F605:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+9Cj
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+1Ch], 0
		jz	short loc_9F62E
		mov	ax, es:[bx+1Ch]
		dec	ax
		mov	es:[bx+6], ax
		jmp	short loc_9F637
; ���������������������������������������������������������������������������

loc_9F62E:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+134j
		les	bx, [bp+arg_0]

loc_9F631:
		mov	word ptr es:[bx+6], 0

loc_9F637:				; CODE XREF: PlayerComponent_FullReleaseAndLoad_9F4ED+13Fj
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+3Ch]

loc_9F63E:
		les	bx, [bp+arg_0]

loc_9F641:
		mov	es:[bx+3Ch], ax
		les	bx, [bp+arg_4]

loc_9F648:
		mov	ax, es:[bx+3Ah]
		les	bx, [bp+arg_0]
		mov	es:[bx+3Ah], ax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+3Eh]
		les	bx, [bp+arg_0]
		mov	es:[bx+3Eh], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+42h]
		les	bx, [bp+arg_0]
		mov	es:[bx+42h], ax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], eax
		mov	ax, es:[bx+6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], ax
		mov	byte ptr es:[bx+13h], 1
		mov	es:[bx], ax
		pop	si
		leave
		retf
PlayerComponent_FullReleaseAndLoad_9F4ED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFreeWrapper_5C6F3 et PlayerComponent_DispatchPair_9EC4D. Référencée
; via jmp depuis un stub VROOMM (sub_6C3FD).
; ==============================================================================================
PlayerComponent_ReleaseAndDispatch_9F698	proc far		; CODE XREF: VROOMM_StubThunk_6C3FDJ

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 58h ; 'X'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_9F6E2
		les	bx, [bp+var_4]

loc_9F6BF:
		mov	word ptr es:[bx+0Dh], 0

loc_9F6C5:
		mov	word ptr es:[bx+0Fh], 0

loc_9F6CB:
		mov	word ptr es:[bx+11h], 0
		push	dx
		push	bx
		push	cs
		call	near ptr PlayerComponent_DispatchPair_9EC4D
		add	sp, 4
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short locret_9F6E8
; ���������������������������������������������������������������������������

loc_9F6E2:				; CODE XREF: PlayerComponent_ReleaseAndDispatch_9F698+22j
		mov	dx, word ptr [bp+var_4+2]

loc_9F6E5:
		mov	ax, word ptr [bp+var_4]

locret_9F6E8:				; CODE XREF: PlayerComponent_ReleaseAndDispatch_9F698+48j
		leave
		retf
PlayerComponent_ReleaseAndDispatch_9F698	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFreeWrapper_5C6F3, PlayerComponent_DispatchPair_9EC4D,
; PlayerComponent_FullReleaseAndLoad_9F4ED. Référencée via jmp depuis un stub VROOMM
; (sub_6C3F8).
; ==============================================================================================
PlayerComponent_ReleaseAndReload_9F6EA	proc far		; CODE XREF: VROOMM_StubThunk_6C3F8J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_9F6ED:
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large 58h ; 'X'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		or	ax, dx
		jz	short loc_9F757
		les	bx, [bp+var_8]
		mov	word ptr es:[bx+0Dh], 0
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+11h], 0
		push	dx
		push	bx
		push	cs

loc_9F732:
		call	near ptr PlayerComponent_DispatchPair_9EC4D
		add	sp, 4

loc_9F738:
		push	si

loc_9F739:
		push	large [bp+var_4]

loc_9F73D:
		push	large [bp+var_8]
		push	cs

loc_9F742:
		call	near ptr PlayerComponent_FullReleaseAndLoad_9F4ED
		add	sp, 0Ah
		les	bx, [bp+var_8]
		mov	es:[bx+9], si
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		jmp	short loc_9F75D
; ���������������������������������������������������������������������������

loc_9F757:				; CODE XREF: PlayerComponent_ReleaseAndReload_9F6EA+2Ej
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]

loc_9F75D:				; CODE XREF: PlayerComponent_ReleaseAndReload_9F6EA+6Bj
		pop	si
		leave
		retf
PlayerComponent_ReleaseAndReload_9F6EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_Helper_9E651. Référencée via jmp depuis un stub VROOMM
; (sub_6C416) et par sub_9F784.
; ==============================================================================================
PlayerComponent_HelperVariantF_9F760	proc far		; CODE XREF: VROOMM_StubThunk_6C416J
					; PlayerComponent_FormatAndDisplay_9F784:loc_9F7E2p	...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		mov	ax, es:[bx+34h]
		mov	dx, [bp+arg_4]
		imul	dx, 23h
		add	ax, dx
		push	word ptr es:[bx+36h]
		push	ax
		push	cs
		call	near ptr PlayerComponent_Helper_9E651
		add	sp, 6
		pop	bp
		retf
PlayerComponent_HelperVariantF_9F760	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 87 lignes, NON DÉTAILLÉE — combine sub_3FD (formatage), sub_43D43,
; PlayerComponent_HelperVariantF_9F760 (×2), sub_43D9B, Weapon_HUDBox_TimerCaseJ_5A95E
; (seg125). Référencée via jmp depuis un stub VROOMM (sub_6C41B).
; ==============================================================================================
PlayerComponent_FormatAndDisplay_9F784	proc far		; CODE XREF: VROOMM_StubThunk_6C41BJ

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_6		= byte ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+34h], 0
		jnz	short loc_9F799
		jmp	loc_9F829
; ���������������������������������������������������������������������������

loc_9F799:				; CODE XREF: PlayerComponent_FormatAndDisplay_9F784+10j
		mov	si, es:[bx+9]
		mov	eax, [si+5Eh]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		push	ds
		push	offset aHardpt	; "HARDPT#"
		mov	cx, 8

loc_9F7B1:
		call	CRT_Fmemcpy
		mov	[bp+var_E], 1
		jmp	short loc_9F7EB
; ���������������������������������������������������������������������������

loc_9F7BD:				; CODE XREF: PlayerComponent_FormatAndDisplay_9F784+71j
		mov	al, byte ptr [bp+var_E]
		add	al, 30h	; '0'
		mov	[bp+var_6], al
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large [bp+var_4]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_9F7E8
		push	[bp+var_E]
		push	large [bp+arg_0]
		push	cs

loc_9F7E2:
		call	near ptr PlayerComponent_HelperVariantF_9F760
		add	sp, 6

loc_9F7E8:				; CODE XREF: PlayerComponent_FormatAndDisplay_9F784+54j
		inc	[bp+var_E]

loc_9F7EB:				; CODE XREF: PlayerComponent_FormatAndDisplay_9F784+37j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+38h]
		cmp	ax, [bp+var_E]
		jg	short loc_9F7BD
		push	ds
		push	offset aGun_0	; "GUN"
		push	large [bp+var_4]
		call	Roster_FindByNameOrder
		add	sp, 8
		or	al, al
		jz	short loc_9F829
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_HelperVariantF_9F760
		add	sp, 6
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	2
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4

loc_9F829:				; CODE XREF: PlayerComponent_FormatAndDisplay_9F784+12j
					; PlayerComponent_FormatAndDisplay_9F784+85j
		pop	si
		leave
		retf
PlayerComponent_FormatAndDisplay_9F784	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFree_5C7B6. Référencée via jmp depuis un stub VROOMM (sub_6C411) et
; par PlayerComponent_LoadMultiField_9F07F.
; ==============================================================================================
PlayerComponent_ReleaseHelperB_9F82C	proc far		; CODE XREF: VROOMM_StubThunk_6C411J PlayerComponent_LoadMultiField_9F07F+6Ap	...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8

loc_9F832:
		push	si

loc_9F833:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]

loc_9F83B:
		mov	[bp+var_4], eax

loc_9F83F:
		xor	si, si
		jmp	short loc_9F867
; ���������������������������������������������������������������������������

loc_9F843:				; CODE XREF: PlayerComponent_ReleaseHelperB_9F82C+42j
		push	0

loc_9F845:
		push	2
		les	bx, [bp+var_4]

loc_9F84A:
		mov	eax, es:[bx+16h]

loc_9F84F:
		mov	[bp+var_8], eax

loc_9F853:
		lea	ax, [bp+var_8]

loc_9F856:
		push	ax

loc_9F857:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		inc	si
		add	word ptr [bp+var_4], 23h ; '#'

loc_9F867:				; CODE XREF: PlayerComponent_ReleaseHelperB_9F82C+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jg	short loc_9F843
		pop	si
		leave
		retf
PlayerComponent_ReleaseHelperB_9F82C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 87 lignes, NON DÉTAILLÉE — combine PlayerComponent_ReleaseHelperB_9F82C,
; Memory_TypedFree_5C7B6 (×3), sub_3A432 (×3). Référencée via jmp depuis un stub VROOMM
; (sub_6C40C).
; ==============================================================================================
PlayerComponent_ReleaseFull_9F873	proc far		; CODE XREF: VROOMM_StubThunk_6C40CJ

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_9F887
		jmp	loc_9F927
; ���������������������������������������������������������������������������

loc_9F887:				; CODE XREF: PlayerComponent_ReleaseFull_9F873+Fj
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_ReleaseHelperB_9F82C
		add	sp, 4
		push	0
		push	2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0

loc_9F8B3:
		push	2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+14h]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	ax, word ptr [bp+arg_0]
		add	ax, 11h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Fh

loc_9F8E8:
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_9F927
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, [bp+var_C]
		push	ax
		push	5C44h

loc_9F91F:
		call	Memory_TypedFree_5C7B6

loc_9F924:
		add	sp, 8

loc_9F927:				; CODE XREF: PlayerComponent_ReleaseFull_9F873+11j
					; PlayerComponent_ReleaseFull_9F873+97j
		pop	si
		leave
		retf
PlayerComponent_ReleaseFull_9F873	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine DisplayCache_ComputeChecksum_5D43F (seg137),
; PlayerComponent_HelperVariantB_9F212, PlayerComponent_HelperVariantC_9F24C. Référencée via
; jmp depuis un stub VROOMM (sub_6C42A).
; ==============================================================================================
PlayerComponent_UpdateFromCache_9F92A	proc far		; CODE XREF: VROOMM_StubThunk_6C42AJ

arg_0		= dword	ptr  6

		push	bp

loc_9F92B:
		mov	bp, sp

loc_9F92D:
		les	bx, [bp+arg_0]

loc_9F930:
		cmp	word ptr es:[bx+9], 0
		jz	short loc_9F98B

loc_9F937:
		cmp	byte_72357, 0
		jz	short loc_9F965
		mov	al, es:[bx+57h]

loc_9F942:
		mov	ah, 0
		or	ax, ax

loc_9F946:
		jnz	short loc_9F965
		call	DisplayCache_ComputeChecksum_5D43F

loc_9F94D:
		cmp	ax, 1400h
		jbe	short loc_9F965
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_HelperVariantB_9F212
		add	sp, 4

loc_9F95D:
		les	bx, [bp+arg_0]

loc_9F960:
		mov	byte ptr es:[bx+57h], 1

loc_9F965:				; CODE XREF: PlayerComponent_UpdateFromCache_9F92A+12j
					; PlayerComponent_UpdateFromCache_9F92A:loc_9F946j	...
		mov	al, byte_72357

loc_9F968:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9F98B
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+57h], 0
		jz	short loc_9F98B
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr PlayerComponent_HelperVariantC_9F24C
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+57h], 0

loc_9F98B:				; CODE XREF: PlayerComponent_UpdateFromCache_9F92A+Bj
					; PlayerComponent_UpdateFromCache_9F92A+42j ...
		pop	bp
		retf
PlayerComponent_UpdateFromCache_9F92A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 121 lignes, NON DÉTAILLÉE — référencée via jmp depuis un stub VROOMM (sub_6C434) et
; par PlayerComponent_TopLevelEntry_9FA4E. Candidat pour session dédiée.
; ==============================================================================================
PlayerComponent_MainOrchestrator_9F98D	proc far		; CODE XREF: VROOMM_StubThunk_6C434J PlayerComponent_TopLevelEntry_9FA4E+4Ap

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		xor	cx, cx
		mov	[bp+var_4], 0
		cmp	si, 800h
		jnz	short loc_9F9D9
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+38h], 0
		jle	short loc_9F9BB
		mov	dx, es:[bx+36h]
		mov	ax, es:[bx+34h]
		jmp	short loc_9F9BF
; ���������������������������������������������������������������������������

loc_9F9BB:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D+22j
		xor	dx, dx
		xor	ax, ax

loc_9F9BF:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D+2Cj
		mov	word ptr [bp+var_4+2], dx

loc_9F9C2:
		mov	word ptr [bp+var_4], ax

loc_9F9C5:
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+13h], 0
		jg	short loc_9FA45
		mov	[bp+var_4], 0
		jmp	short loc_9FA45
; ���������������������������������������������������������������������������

loc_9F9D9:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D+18j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]

loc_9F9E1:
		mov	[bp+var_8], eax

loc_9F9E5:
		mov	ax, es:[bx+36h]

loc_9F9E9:
		mov	dx, es:[bx+34h]
		mov	bx, es:[bx+38h]
		dec	bx

loc_9F9F2:
		imul	bx, 23h

loc_9F9F5:
		add	dx, bx

loc_9F9F7:
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		jmp	short loc_9FA3D
; ���������������������������������������������������������������������������

loc_9F9FF:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D:loc_9FA43j
		les	bx, [bp+var_8]
		cmp	es:[bx+13h], cx
		jle	short loc_9FA1A
		cmp	es:[bx+0Dh], si
		jnz	short loc_9FA1A
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	cx, es:[bx+13h]

loc_9FA1A:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D+79j
					; PlayerComponent_MainOrchestrator_9F98D+7Fj
		add	word ptr [bp+var_8], 23h ; '#'
		les	bx, [bp+var_C]
		cmp	es:[bx+13h], cx
		jle	short loc_9FA39

loc_9FA27:
		cmp	es:[bx+0Dh], si
		jnz	short loc_9FA39

loc_9FA2D:
		mov	eax, [bp+var_C]

loc_9FA31:
		mov	[bp+var_4], eax

loc_9FA35:
		mov	cx, es:[bx+13h]

loc_9FA39:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D+98j
					; PlayerComponent_MainOrchestrator_9F98D+9Ej
		sub	word ptr [bp+var_C], 23h ; '#'

loc_9FA3D:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D+70j
		mov	ax, word ptr [bp+var_8]
		cmp	ax, word ptr [bp+var_C]

loc_9FA43:
		jbe	short loc_9F9FF

loc_9FA45:				; CODE XREF: PlayerComponent_MainOrchestrator_9F98D+40j
					; PlayerComponent_MainOrchestrator_9F98D+4Aj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si

locret_9FA4C:
		leave
		retf
PlayerComponent_MainOrchestrator_9F98D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 74 lignes, NON DÉTAILLÉE — appelle PlayerComponent_MainOrchestrator_9F98D.
; Référencée via jmp depuis un stub VROOMM (sub_6C439) — probable point d'entrée principal de
; ce module de gestion des composants du joueur.
; ==============================================================================================
PlayerComponent_TopLevelEntry_9FA4E	proc far		; CODE XREF: VROOMM_StubThunk_6C439J

var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	[bp+var_1], 0

loc_9FA59:
		xor	si, si

loc_9FA5B:
		jmp	short loc_9FAB2
; ���������������������������������������������������������������������������

loc_9FA5D:				; CODE XREF: PlayerComponent_TopLevelEntry_9FA4E+6Bj
		les	bx, [bp+arg_0]

loc_9FA60:
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, si
		imul	bx, 12h
		add	dx, bx
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		les	bx, [bp+var_6]
		cmp	dword ptr es:[bx], 0
		jz	short loc_9FA88
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_9FA8A
; ���������������������������������������������������������������������������

loc_9FA88:				; CODE XREF: PlayerComponent_TopLevelEntry_9FA4E+2Fj
		xor	ax, ax

loc_9FA8A:				; CODE XREF: PlayerComponent_TopLevelEntry_9FA4E+38j
		mov	dx, ax
		test	dx, 0F03h
		jnz	short loc_9FAB1
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_MainOrchestrator_9F98D
		add	sp, 6
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_9FAB1
		mov	[bp+var_1], 1
		jmp	short loc_9FABB
; ���������������������������������������������������������������������������

loc_9FAB1:				; CODE XREF: PlayerComponent_TopLevelEntry_9FA4E+42j
					; PlayerComponent_TopLevelEntry_9FA4E+5Bj
		inc	si

loc_9FAB2:				; CODE XREF: PlayerComponent_TopLevelEntry_9FA4E:loc_9FA5Bj
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jg	short loc_9FA5D

loc_9FABB:				; CODE XREF: PlayerComponent_TopLevelEntry_9FA4E+61j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
PlayerComponent_TopLevelEntry_9FA4E	endp

seg432		ends
