ovr295		segment	para public 'OVERLAY' use16
		assume cs:ovr295
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ConstructWithFormation_9B4A0 (sub_9B4A0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine allocation et
; Formation_ComputeGeometryHelper_56D43 (seg116).
; ==============================================================================================
Debris_ConstructWithFormation_AA3A0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		push	31h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_AA3C7
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, di
		jmp	short loc_AA3C9

loc_AA3C7:
		mov	ax, di

loc_AA3C9:
		mov	[si+26h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
Debris_ConstructWithFormation_AA3A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA3DE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_AA3DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA3F4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		push	31h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_AA41B
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, di
		jmp	short loc_AA41D

loc_AA41B:
		mov	ax, di

loc_AA41D:
		mov	[si+26h], ax
		cmp	word ptr [si+26h], 0
		jz	short loc_AA44B
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	bx, [si+26h]
		mov	[bx+24h], eax
		mov	eax, [di+4]
		mov	[bx+28h], eax
		mov	eax, [di+8]
		mov	[bx+2Ch], eax
		or	byte ptr [bx+30h], 1
		jmp	short loc_AA454

loc_AA44B:
		push	0C020h
		call	sub_1DDFE
		pop	cx

loc_AA454:
		mov	di, [si+24h]
		add	di, 12h
		mov	eax, [di]
		sub	[si+12h], eax
		mov	eax, [di+4]
		sub	[si+16h], eax
		mov	eax, [di+8]
		sub	[si+1Ah], eax
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_AA49B
		push	word ptr [si+1Eh]
		call	Container_Op_1F113
		pop	cx

loc_AA49B:
		pop	di
		pop	si
		pop	bp
		retf
sub_AA3F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ReleaseForceBufferWrapper_9B57E (sub_9B57E de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; Debris_ResolveForceBuffer.
; ==============================================================================================
Debris_ReleaseForceBufferWrapper_AA49F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[si+12h], eax
		mov	eax, [di+4]
		mov	[si+16h], eax
		mov	eax, [di+8]
		mov	[si+1Ah], eax
		push	word ptr [si+26h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+26h], 0
		mov	word ptr [si+24h], 0
		pop	di
		pop	si
		pop	bp
		retf
Debris_ReleaseForceBufferWrapper_AA49F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ConstructWithTorque_9B5BD (sub_9B5BD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine allocation, String_ConstructEmpty,
; Container_KeyCompare, Debris_ComputeTorque — construction d'un débris avec calcul de couple
; physique.
; ==============================================================================================
Debris_ConstructWithTorque_AA4DE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_AA51A
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_AA515
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_AA517

loc_AA515:
		mov	ax, di

loc_AA517:
		mov	[si+1Eh], ax

loc_AA51A:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_AA548
		mov	bx, [bp+arg_2]
		mov	[bx+24h], si
		push	si
		push	bx
		push	cs
		call	near ptr Debris_ConstructWithFormation_AA3A0
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+1Eh]
		call	sub_1EFF9
		add	sp, 4
		push	si
		call	sub_36B53
		pop	cx

loc_AA548:
		pop	di
		pop	si
		leave
		retf
Debris_ConstructWithTorque_AA4DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Debris_ContainerOpWrapper_C2578 (sub_C2578 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_ContainerOpWrapper_9B62B (sub_9B62B de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle une opération de
; conteneur (Container_RemoveAndDeleteObject_22DE5).
; ==============================================================================================
Debris_ContainerOpWrapper_AA54C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_AA567
		push	[bp+arg_2]
		push	word ptr [si+1Eh]
		call	Container_RemoveAndDeleteObject_1F1C6
		add	sp, 4

loc_AA567:
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapper_AA54C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ConstructWithTorqueB_9B649 (sub_9B649 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, variante de Debris_ConstructWithTorque_9B5BD.
; ==============================================================================================
Debris_ConstructWithTorqueB_AA56A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_AA5B5
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_AA5B0
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_AA5B2

loc_AA5B0:
		mov	ax, di

loc_AA5B2:
		mov	[si+1Eh], ax

loc_AA5B5:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_AA5CD
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+1Eh]
		call	sub_1EFF9
		add	sp, 4

loc_AA5CD:
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	sub_1E642
		add	sp, 4
		push	si
		call	sub_36B53
		pop	cx
		pop	di
		pop	si
		leave
		retf
Debris_ConstructWithTorqueB_AA56A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ContainerCompareAndOp_9B6C5 (sub_9B6C5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine Container_KeyEquals et une opération
; de conteneur.
; ==============================================================================================
Debris_ContainerCompareAndOp_AA5E6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	bx, [di]
		call	dword ptr [bx+24h]
		pop	cx
		push	di
		push	[bp+arg_4]
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_AA616
		push	di
		push	word ptr [si+1Eh]
		call	sub_1F2C0
		add	sp, 4

loc_AA616:
		pop	di
		pop	si
		pop	bp
		retf
Debris_ContainerCompareAndOp_AA5E6		endp
ovr295		ends
