ovr199		segment	para public 'OVERLAY' use16
		assume cs:ovr199
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ConstructWithFormation_AA3A0 (sub_AA3A0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Debris_ConstructWithFormation_9B4A0 (sub_9B4A0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; allocation et Formation_ComputeGeometryHelper_56D43 (seg116).
; ==============================================================================================
Debris_ConstructWithFormation_71950		proc far

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
		jz	short loc_71977
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	ax, di
		jmp	short loc_71979

loc_71977:
		mov	ax, di

loc_71979:
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
Debris_ConstructWithFormation_71950		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7198E		proc far

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
sub_7198E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_719A4		proc far

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
		jz	short loc_719CB
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	ax, di
		jmp	short loc_719CD

loc_719CB:
		mov	ax, di

loc_719CD:
		mov	[si+26h], ax
		cmp	word ptr [si+26h], 0
		jz	short loc_719FB
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
		jmp	short loc_71A04

loc_719FB:
		push	0C020h
		call	sub_9D47
		pop	cx

loc_71A04:
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
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_71A4B
		push	word ptr [si+1Eh]
		call	Container_Op_37262
		pop	cx

loc_71A4B:
		pop	di
		pop	si
		pop	bp
		retf
sub_719A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ReleaseForceBufferWrapper_AA49F (sub_AA49F de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Debris_ReleaseForceBufferWrapper_9B57E (sub_9B57E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Debris_ResolveForceBuffer.
; ==============================================================================================
Debris_ReleaseForceBufferWrapper_71A4F		proc far

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
		call	sub_33B
		pop	cx
		mov	word ptr [si+26h], 0
		mov	word ptr [si+24h], 0
		pop	di
		pop	si
		pop	bp
		retf
Debris_ReleaseForceBufferWrapper_71A4F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ConstructWithTorque_AA4DE (sub_AA4DE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_ConstructWithTorque_9B5BD (sub_9B5BD de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine allocation,
; String_ConstructEmpty, Container_KeyCompare, Debris_ComputeTorque — construction d'un débris
; avec calcul de couple physique.
; ==============================================================================================
Debris_ConstructWithTorque_71A8E		proc far

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
		jnz	short loc_71ACA
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_71AC5
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_71AC7

loc_71AC5:
		mov	ax, di

loc_71AC7:
		mov	[si+1Eh], ax

loc_71ACA:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_71AF8
		mov	bx, [bp+arg_2]
		mov	[bx+24h], si
		push	si
		push	bx
		push	cs
		call	near ptr Debris_ConstructWithFormation_71950
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+1Eh]
		call	sub_37148
		add	sp, 4
		push	si
		call	sub_3763E
		pop	cx

loc_71AF8:
		pop	di
		pop	si
		leave
		retf
Debris_ConstructWithTorque_71A8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ContainerOpWrapper_AA54C (sub_AA54C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Debris_ContainerOpWrapper_C2578 (sub_C2578 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Debris_ContainerOpWrapper_9B62B (sub_9B62B de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle une opération de conteneur (Container_RemoveAndDeleteObject_22DE5).
; ==============================================================================================
Debris_ContainerOpWrapper_71AFC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_71B17
		push	[bp+arg_2]
		push	word ptr [si+1Eh]
		call	Container_RemoveAndDeleteObject_37315
		add	sp, 4

loc_71B17:
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapper_71AFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ConstructWithTorqueB_AA56A (sub_AA56A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_ConstructWithTorqueB_9B649 (sub_9B649 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante de
; Debris_ConstructWithTorque_9B5BD.
; ==============================================================================================
Debris_ConstructWithTorqueB_71B1A		proc far

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
		jnz	short loc_71B65
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_71B60
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_71B62

loc_71B60:
		mov	ax, di

loc_71B62:
		mov	[si+1Eh], ax

loc_71B65:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_71B7D
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+1Eh]
		call	sub_37148
		add	sp, 4

loc_71B7D:
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	Container_Op_36867
		add	sp, 4
		push	si
		call	sub_3763E
		pop	cx
		pop	di
		pop	si
		leave
		retf
Debris_ConstructWithTorqueB_71B1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ContainerCompareAndOp_AA5E6 (sub_AA5E6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Debris_ContainerCompareAndOp_9B6C5 (sub_9B6C5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Container_KeyEquals et une opération de conteneur.
; ==============================================================================================
Debris_ContainerCompareAndOp_71B96		proc far

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
		call	List_AppendIfNonNull_363E4
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_71BC6
		push	di
		push	word ptr [si+1Eh]
		call	Container_Op_3740F
		add	sp, 4

loc_71BC6:
		pop	di
		pop	si
		pop	bp
		retf
Debris_ContainerCompareAndOp_71B96		endp
ovr199		ends
