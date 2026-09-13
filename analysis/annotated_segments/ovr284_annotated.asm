ovr284		segment	para public 'OVERLAY' use16
		assume cs:ovr284
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 183 lignes, NON DÉTAILLÉE — libère plusieurs blocs typés (Memory_TypedFree_5C7B6
; répété).
; ==============================================================================================
AircraftComponent_ReleaseMultiple_96750	proc far		; CODE XREF: VROOMM_StubThunk_6BB50J

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
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_96765
		jmp	loc_96913
; ���������������������������������������������������������������������������

loc_96765:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+10j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 15C4h
		xor	di, di
		jmp	short loc_967BF
; ���������������������������������������������������������������������������

loc_96771:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+72j
		les	bx, [bp+arg_0]
		add	bx, di
		cmp	byte ptr es:[bx+5Ch], 0
		jz	short loc_967A8
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_967A8:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+2Bj
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]

loc_967B0:
		add	bx, ax

loc_967B2:
		mov	word ptr es:[bx+2Eh], 0
		mov	word ptr es:[bx+2Ch], 0
		inc	di

loc_967BF:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+1Fj
		cmp	di, 8
		jl	short loc_96771
		push	0
		push	2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+28h]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+28h], 0
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6CD76
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+21h], 0
		jz	short loc_96836
		cmp	dword ptr es:[bx+1Ch], 0
		jz	short loc_96836
		push	0
		mov	al, es:[bx+20h]
		push	ax
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_96836:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+BBj
					; AircraftComponent_ReleaseMultiple_96750+C3j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+22h], 0
		cmp	byte ptr es:[bx+17h], 0
		jz	short loc_96880
		cmp	dword ptr es:[bx+12h], 0
		jz	short loc_96880
		push	0
		mov	al, es:[bx+16h]
		push	ax
		mov	eax, es:[bx+12h]
		mov	[bp+var_10], eax
		lea	ax, [bp+var_10]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_96880:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+105j
					; AircraftComponent_ReleaseMultiple_96750+10Dj
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+17h], 0
		mov	dword ptr es:[bx+18h], 0
		cmp	byte ptr es:[bx+0Dh], 0
		jz	short loc_968CA
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_968CA
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		mov	eax, es:[bx+8]
		mov	[bp+var_14], eax
		lea	ax, [bp+var_14]
		push	ax

loc_968BD:
		push	5C44h

loc_968C0:
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_968C8:
		jmp	short $+2

loc_968CA:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+14Fj
					; AircraftComponent_ReleaseMultiple_96750+157j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Object_DestructGeneric_29036
		add	sp, 6
		test	si, 1
		jz	short loc_96913
		mov	eax, [bp+arg_0]
		mov	[bp+var_18], eax
		push	0
		push	2
		lea	ax, [bp+var_18]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_96913:				; CODE XREF: AircraftComponent_ReleaseMultiple_96750+12j
					; AircraftComponent_ReleaseMultiple_96750+1A6j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_ReleaseMultiple_96750	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 729 lignes, NON DÉTAILLÉE — combine Descriptor_Construct,
; Calibration_ComputeHelper_56CE5 (seg116, ×2), Damage_UpdateHudIcon — construction et
; calibration d'un composant de dommages avec mise à jour d'icône HUD. Candidat prioritaire
; pour session dédiée.
; ==============================================================================================
AircraftComponent_ConstructAndCalibrate_96917	proc far		; CODE XREF: VROOMM_StubThunk_6BB55J

var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_57		= byte ptr -57h
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3D		= byte ptr -3Dh
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_33		= byte ptr -33h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		cmp	[bp+arg_0], 0
		jnz	short loc_96949
		push	1
		push	0
		push	2
		push	large 0A0h ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_96949
		jmp	loc_97071
; ���������������������������������������������������������������������������

loc_96949:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+Cj
					; AircraftComponent_ConstructAndCalibrate_96917+2Dj
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 155Ch
		push	ax
		push	large [bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Descriptor_Construct
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 183Ah
		mov	dword ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+0Fh], 2
		mov	byte ptr es:[bx+10h], 0
		mov	dword ptr es:[bx+11h], 0
		mov	dword ptr es:[bx+17h], 0
		mov	byte ptr es:[bx+1Bh], 2
		mov	byte ptr es:[bx+1Ch], 0
		mov	dword ptr es:[bx+1Dh], 0
		mov	word ptr es:[bx+21h], 11E8h

loc_969B6:
		mov	word ptr es:[bx+21h], 1836h

loc_969BC:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Dh	; '-'

loc_969C2:
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Calibration_ComputeHelper_56CE5
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Calibration_ComputeHelper_56CE5
		add	sp, 4
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+8Fh], ax
		mov	es:[bx+8Dh], ax
		xor	ax, ax
		mov	es:[bx+93h], ax
		mov	es:[bx+91h], ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 95h	; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 99h	; '�'
		or	byte ptr es:[bx+9Fh], 1
		mov	word ptr es:[bx+9Dh], 0
		mov	byte ptr es:[bx+27h], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Damage_UpdateHudIcon
		add	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		les	bx, [bp+var_A]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+9], ax
		les	bx, [bp+var_A]
		mov	ax, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], ax
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx+9Ah], 0
		jz	short loc_96A58
		jmp	loc_96B09
; ���������������������������������������������������������������������������

loc_96A58:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+13Cj
		mov	eax, [bp+arg_0]
		mov	es:[bx+9Ah], eax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 1Ch
		mov	word ptr [bp+var_E+2], ax
		mov	word ptr [bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		mov	al, es:[bx+4]
		mov	[bp+var_13], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+17h], eax
		mov	al, [bp+var_13]
		mov	es:[bx+1Bh], al
		mov	byte ptr es:[bx+1Ch], 0
		mov	dword ptr es:[bx+1Dh], 0
		les	bx, [bp+var_E]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]

loc_96AAF:
		mov	es:[bx+1Dh], eax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 8

loc_96ABD:
		mov	word ptr [bp+var_18+2],	ax

loc_96AC0:
		mov	word ptr [bp+var_18], dx

loc_96AC3:
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	al, es:[bx+4]
		mov	[bp+var_1D], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Bh], eax
		mov	al, [bp+var_1D]
		mov	es:[bx+0Fh], al
		mov	byte ptr es:[bx+10h], 0
		mov	dword ptr es:[bx+11h], 0
		les	bx, [bp+var_18]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+11h], eax
		jmp	loc_9704D
; ���������������������������������������������������������������������������

loc_96B09:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+13Ej
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 17h
		mov	word ptr [bp+var_22+2],	ax
		mov	word ptr [bp+var_22], dx
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx+1Ch], 0
		jnz	short loc_96B26
		jmp	loc_96D5E
; ���������������������������������������������������������������������������

loc_96B26:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+20Aj
		cmp	byte ptr es:[bx+20h], 3
		jz	short loc_96B30
		jmp	loc_96CB8
; ���������������������������������������������������������������������������

loc_96B30:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+214j
		les	bx, [bp+var_22]
		cmp	dword ptr es:[bx], 0
		jz	short loc_96B44
		cmp	byte ptr es:[bx+4], 3
		jz	short loc_96B44
		jmp	loc_96CB8
; ���������������������������������������������������������������������������

loc_96B44:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+221j
					; AircraftComponent_ConstructAndCalibrate_96917+228j
		push	1
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+20h]
		push	ax
		push	large dword ptr	es:[bx+1Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_2A+2],	dx
		mov	word ptr [bp+var_2A], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		push	dx
		push	ax
		push	large [bp+var_26]
		push	5C44h
		call	Memory_TypedAllocDispatch_5C7F0
		add	sp, 12h
		les	bx, [bp+var_22]
		cmp	dword ptr es:[bx], 0
		jz	short loc_96BBC
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+22h]
		jl	short loc_96BBC
		jmp	loc_96C5E
; ���������������������������������������������������������������������������

loc_96BBC:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+291j
					; AircraftComponent_ConstructAndCalibrate_96917+2A0j
		les	bx, [bp+var_22]

loc_96BBF:
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_96BED
		cmp	dword ptr es:[bx], 0
		jz	short loc_96BED
		push	0
		mov	al, es:[bx+4]
		push	ax
		mov	eax, es:[bx]
		mov	[bp+var_2E], eax
		lea	ax, [bp+var_2E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_96BED:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+2ADj
					; AircraftComponent_ConstructAndCalibrate_96917+2B4j
		les	bx, [bp+var_22]
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+5], 0
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_A]
		mov	eax, es:[bx+22h]
		mov	[bp+var_32], eax
		mov	al, es:[bx+20h]
		mov	[bp+var_33], al
		push	1
		push	0
		push	ax
		push	large [bp+var_32]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_38+2],	dx
		mov	word ptr [bp+var_38], ax
		les	bx, [bp+var_22]
		mov	eax, [bp+var_38]
		mov	es:[bx], eax
		mov	al, [bp+var_33]
		mov	es:[bx+4], al
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_32]
		mov	es:[bx+6], eax
		jmp	short $+2

loc_96C5E:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+2A2j
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		push	0
		les	bx, [bp+var_22]
		mov	al, es:[bx+4]
		push	ax
		push	large dword ptr	es:[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		push	large [bp+var_2A]
		push	dx
		push	ax
		push	5C44h
		call	Memory_TypedAllocDispatch_5C7F0
		add	sp, 12h
		push	0
		push	2
		lea	ax, [bp+var_2A]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	loc_96D5E
; ���������������������������������������������������������������������������

loc_96CB8:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+216j
					; AircraftComponent_ConstructAndCalibrate_96917+22Aj
		les	bx, [bp+var_22]
		cmp	dword ptr es:[bx], 0
		jz	short loc_96CDD
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+22h]
		jge	short loc_96CD4
		jmp	loc_96D5E
; ���������������������������������������������������������������������������

loc_96CD4:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+3B8j
		push	0
		push	2
		jmp	short loc_96D3D
; ���������������������������������������������������������������������������
		jmp	loc_96D5E
; ���������������������������������������������������������������������������

loc_96CDD:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+3A9j
		les	bx, [bp+var_A]
		mov	eax, es:[bx+22h]
		mov	[bp+var_3C], eax
		mov	al, es:[bx+20h]
		mov	[bp+var_3D], al
		push	1
		push	0
		push	ax
		push	large [bp+var_3C]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_42+2],	dx
		mov	word ptr [bp+var_42], ax
		les	bx, [bp+var_22]
		mov	eax, [bp+var_42]
		mov	es:[bx], eax
		mov	al, [bp+var_3D]
		mov	es:[bx+4], al
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_3C]
		mov	es:[bx+6], eax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+20h]
		push	ax

loc_96D3D:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+3C1j
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+22h]
		push	large dword ptr	es:[bx+1Ch]
		les	bx, [bp+var_22]
		push	large dword ptr	es:[bx]
		push	5C44h
		call	Memory_TypedAllocDispatch_5C7F0
		add	sp, 12h
		jmp	short $+2

loc_96D5E:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+20Cj
					; AircraftComponent_ConstructAndCalibrate_96917+39Ej ...
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Bh
		mov	word ptr [bp+var_46+2],	ax
		mov	word ptr [bp+var_46], dx
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx+8], 0
		jnz	short loc_96D7B
		jmp	loc_96FB3
; ���������������������������������������������������������������������������

loc_96D7B:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+45Fj
		cmp	byte ptr es:[bx+0Ch], 3
		jz	short loc_96D85
		jmp	loc_96F0D
; ���������������������������������������������������������������������������

loc_96D85:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+469j
		les	bx, [bp+var_46]
		cmp	dword ptr es:[bx], 0
		jz	short loc_96D99
		cmp	byte ptr es:[bx+4], 3
		jz	short loc_96D99
		jmp	loc_96F0D
; ���������������������������������������������������������������������������

loc_96D99:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+476j
					; AircraftComponent_ConstructAndCalibrate_96917+47Dj
		push	1
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_96DAF:
		add	sp, 0Ch

loc_96DB2:
		mov	word ptr [bp+var_4A+2],	dx

loc_96DB5:
		mov	word ptr [bp+var_4A], ax

loc_96DB8:
		push	0
		les	bx, [bp+var_A]

loc_96DBD:
		mov	al, es:[bx+0Ch]
		push	ax

loc_96DC2:
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4E+2],	dx
		mov	word ptr [bp+var_4E], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		push	dx
		push	ax
		push	large [bp+var_4A]
		push	5C44h
		call	Memory_TypedAllocDispatch_5C7F0
		add	sp, 12h
		les	bx, [bp+var_46]
		cmp	dword ptr es:[bx], 0
		jz	short loc_96E11
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+0Eh]
		jl	short loc_96E11
		jmp	loc_96EB3
; ���������������������������������������������������������������������������

loc_96E11:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+4E6j
					; AircraftComponent_ConstructAndCalibrate_96917+4F5j
		les	bx, [bp+var_46]
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_96E42
		cmp	dword ptr es:[bx], 0
		jz	short loc_96E42
		push	0
		mov	al, es:[bx+4]
		push	ax
		mov	eax, es:[bx]
		mov	[bp+var_52], eax
		lea	ax, [bp+var_52]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_96E42:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+502j
					; AircraftComponent_ConstructAndCalibrate_96917+509j
		les	bx, [bp+var_46]
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+5], 0
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+var_A]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_56], eax
		mov	al, es:[bx+0Ch]
		mov	[bp+var_57], al
		push	1
		push	0
		push	ax
		push	large [bp+var_56]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_5C+2],	dx
		mov	word ptr [bp+var_5C], ax
		les	bx, [bp+var_46]
		mov	eax, [bp+var_5C]
		mov	es:[bx], eax
		mov	al, [bp+var_57]
		mov	es:[bx+4], al
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_56]
		mov	es:[bx+6], eax

loc_96EB1:
		jmp	short $+2

loc_96EB3:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+4F7j
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		push	0
		les	bx, [bp+var_46]
		mov	al, es:[bx+4]
		push	ax
		push	large dword ptr	es:[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4A+2],	dx
		mov	word ptr [bp+var_4A], ax
		push	0
		push	2
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		push	large [bp+var_4E]
		push	dx
		push	ax
		push	5C44h
		call	Memory_TypedAllocDispatch_5C7F0
		add	sp, 12h
		push	0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	loc_96FB3
; ���������������������������������������������������������������������������

loc_96F0D:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+46Bj
					; AircraftComponent_ConstructAndCalibrate_96917+47Fj
		les	bx, [bp+var_46]
		cmp	dword ptr es:[bx], 0
		jz	short loc_96F32
		mov	eax, es:[bx+6]
		les	bx, [bp+var_A]
		cmp	eax, es:[bx+0Eh]
		jge	short loc_96F29
		jmp	loc_96FB3
; ���������������������������������������������������������������������������

loc_96F29:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+60Dj
		push	0
		push	2
		jmp	short loc_96F92
; ���������������������������������������������������������������������������
		jmp	loc_96FB3
; ���������������������������������������������������������������������������

loc_96F32:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+5FEj
		les	bx, [bp+var_A]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_60], eax
		mov	al, es:[bx+0Ch]
		mov	[bp+var_61], al
		push	1
		push	0
		push	ax
		push	large [bp+var_60]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_66+2],	dx
		mov	word ptr [bp+var_66], ax
		les	bx, [bp+var_46]
		mov	eax, [bp+var_66]
		mov	es:[bx], eax
		mov	al, [bp+var_61]
		mov	es:[bx+4], al
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_60]
		mov	es:[bx+6], eax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+0Ch]
		push	ax

loc_96F92:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+616j
		les	bx, [bp+var_A]
		push	large dword ptr	es:[bx+0Eh]
		push	large dword ptr	es:[bx+8]
		les	bx, [bp+var_46]

loc_96FA2:
		push	large dword ptr	es:[bx]

loc_96FA6:
		push	5C44h

loc_96FA9:
		call	Memory_TypedAllocDispatch_5C7F0

loc_96FAE:
		add	sp, 12h

loc_96FB1:
		jmp	short $+2

loc_96FB3:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+461j
					; AircraftComponent_ConstructAndCalibrate_96917+5F3j ...
		les	bx, [bp+var_A]

loc_96FB6:
		mov	eax, es:[bx+28h]
		mov	[bp+var_6A], eax
		push	0

loc_96FC1:
		les	bx, [bp+arg_0]

loc_96FC4:
		mov	al, es:[bx+1Bh]
		push	ax
		push	large dword ptr	es:[bx+17h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_6E+2],	dx
		mov	word ptr [bp+var_6E], ax
		xor	si, si
		jmp	short loc_97044
; ���������������������������������������������������������������������������

loc_96FE3:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+734j
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		push	ax
		push	large dword ptr	es:[bx+0Bh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		les	bx, [bp+var_A]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		les	bx, [bp+var_6A]
		mov	ax, word ptr [bp+var_6E]
		add	ax, es:[bx]
		push	word ptr [bp+var_6E+2]
		push	ax
		push	es
		les	ax, [bp+var_6E]
		mov	dx, es
		pop	es
		add	ax, es:[bx]
		mov	bx, ax
		mov	es, dx
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 0Ch
		inc	si
		add	word ptr [bp+var_6A], 2

loc_97044:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+6CAj
		les	bx, [bp+arg_0]
		cmp	es:[bx+15h], si
		jg	short loc_96FE3

loc_9704D:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+1EFj
		push	large [bp+arg_0]
		call	Damage_ResetAllFlags
		add	sp, 4
		push	large [bp+arg_0]
		call	Damage_ResetComponentFlags
		add	sp, 4
		push	large [bp+arg_0]
		call	Damage_ResolveComponentPositions
		add	sp, 4

loc_97071:				; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+2Fj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
AircraftComponent_ConstructAndCalibrate_96917	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 114 lignes, NON DÉTAILLÉE — combine Memory_TypedFree_5C7B6 répété et
; Object_DestructGeneric_29115.
; ==============================================================================================
AircraftComponent_ReleaseAndDestructGeneric_9707A	proc far		; CODE XREF: VROOMM_StubThunk_6BB5AJ

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_9708E
		jmp	loc_97192
; ���������������������������������������������������������������������������

loc_9708E:				; CODE XREF: AircraftComponent_ReleaseAndDestructGeneric_9707A+Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 183Ah
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]

loc_970A2:
		mov	eax, es:[bx+9Ah]
		cmp	eax, [bp+arg_0]
		jnz	short loc_970B8

loc_970AE:
		mov	dword ptr es:[bx+9Ah], 0

loc_970B8:				; CODE XREF: AircraftComponent_ReleaseAndDestructGeneric_9707A+32j
		push	2
		mov	ax, word ptr [bp+arg_0]

loc_970BD:
		add	ax, 8Dh	; '�'
		push	word ptr [bp+arg_0+2]

loc_970C3:
		push	ax
		call	VROOMM_StubThunk_6CD76
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1Ch], 0
		jz	short loc_970FF
		cmp	dword ptr es:[bx+17h], 0
		jz	short loc_970FF
		push	0
		mov	al, es:[bx+1Bh]
		push	ax
		mov	eax, es:[bx+17h]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_970FF:				; CODE XREF: AircraftComponent_ReleaseAndDestructGeneric_9707A+5Aj
					; AircraftComponent_ReleaseAndDestructGeneric_9707A+62j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+17h], 0
		mov	byte ptr es:[bx+1Ch], 0
		mov	dword ptr es:[bx+1Dh], 0
		cmp	byte ptr es:[bx+10h], 0
		jz	short loc_97149
		cmp	dword ptr es:[bx+0Bh], 0
		jz	short loc_97149
		push	0
		mov	al, es:[bx+0Fh]
		push	ax
		mov	eax, es:[bx+0Bh]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_97149:				; CODE XREF: AircraftComponent_ReleaseAndDestructGeneric_9707A+A4j
					; AircraftComponent_ReleaseAndDestructGeneric_9707A+ACj
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+10h], 0
		mov	dword ptr es:[bx+11h], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Object_DestructGeneric_29115
		add	sp, 6
		test	si, 1
		jz	short loc_97192
		mov	eax, [bp+arg_0]
		mov	[bp+var_10], eax
		push	0
		push	2
		lea	ax, [bp+var_10]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_97192:				; CODE XREF: AircraftComponent_ReleaseAndDestructGeneric_9707A+11j
					; AircraftComponent_ReleaseAndDestructGeneric_9707A+FBj
		pop	si
		leave
		retf
AircraftComponent_ReleaseAndDestructGeneric_9707A	endp

ovr284		ends
