ovr300		segment	para public 'OVERLAY' use16
		assume cs:ovr300
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation et Formation_ComputeGeometryHelper_56D43 (seg116).
; ==============================================================================================
Debris_ConstructWithFormation_9B4A0	proc far		; CODE XREF: VROOMM_StubThunk_6BF60J Debris_ConstructWithTorque_9B5BD+4Bp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_9B4A1:
		mov	bp, sp

loc_9B4A3:
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_9B4A8:
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		push	31h ; '1'

loc_9B4B0:
		call	CRT_Malloc16_Retry
		pop	cx

loc_9B4B6:
		mov	di, ax
		or	ax, ax
		jz	short loc_9B4C7

loc_9B4BC:
		push	ax

loc_9B4BD:
		call	Formation_ComputeGeometryHelper_56D43

loc_9B4C2:
		pop	cx

loc_9B4C3:
		mov	ax, di
		jmp	short loc_9B4C9
; ���������������������������������������������������������������������������

loc_9B4C7:				; CODE XREF: Debris_ConstructWithFormation_9B4A0+1Aj
		mov	ax, di

loc_9B4C9:				; CODE XREF: Debris_ConstructWithFormation_9B4A0+25j
		mov	[si+26h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]

loc_9B4D2:
		pop	cx

loc_9B4D3:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		pop	di
		pop	si
		pop	bp

locret_9B4DD:
		retf
Debris_ConstructWithFormation_9B4A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Formation_ComputeGeometryHelper_56D43, Matrix_WorldToLocal_58768 (seg117),
; opération de conteneur.
; ==============================================================================================
Debris_ConstructWithRotation_9B4DE	proc far		; CODE XREF: VROOMM_StubThunk_6BF65J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_9B4DF:
		mov	bp, sp
		push	si
		push	di

loc_9B4E3:
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax

loc_9B4EC:
		push	31h ; '1'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9B505
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	ax, di
		jmp	short loc_9B507
; ���������������������������������������������������������������������������

loc_9B505:				; CODE XREF: Debris_ConstructWithRotation_9B4DE+1Aj
		mov	ax, di

loc_9B507:				; CODE XREF: Debris_ConstructWithRotation_9B4DE+25j
		mov	[si+26h], ax
		cmp	word ptr [si+26h], 0
		jz	short loc_9B533
		mov	di, si

loc_9B512:
		add	di, 12h

loc_9B515:
		mov	eax, [di]

loc_9B518:
		mov	bx, [si+26h]

loc_9B51B:
		mov	[bx+24h], eax

loc_9B51F:
		mov	eax, [di+4]

loc_9B523:
		mov	[bx+28h], eax

loc_9B527:
		mov	eax, [di+8]

loc_9B52B:
		mov	[bx+2Ch], eax

loc_9B52F:
		or	byte ptr [bx+30h], 1

loc_9B533:				; CODE XREF: Debris_ConstructWithRotation_9B4DE+30j
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
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9B57A

loc_9B571:
		push	word ptr [si+1Eh]
		call	Container_Op_22D32
		pop	cx

loc_9B57A:				; CODE XREF: Debris_ConstructWithRotation_9B4DE+91j
		pop	di
		pop	si
		pop	bp
		retf
Debris_ConstructWithRotation_9B4DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Debris_ResolveForceBuffer.
; ==============================================================================================
Debris_ReleaseForceBufferWrapper_9B57E	proc far		; CODE XREF: VROOMM_StubThunk_6BF6AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_9B581:
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]

loc_9B592:
		mov	[si+12h], eax

loc_9B596:
		mov	eax, [di+4]

loc_9B59A:
		mov	[si+16h], eax

loc_9B59E:
		mov	eax, [di+8]

loc_9B5A2:
		mov	[si+1Ah], eax
		push	word ptr [si+26h]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+26h], 0

loc_9B5B4:
		mov	word ptr [si+24h], 0
		pop	di
		pop	si
		pop	bp
		retf
Debris_ReleaseForceBufferWrapper_9B57E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, String_ConstructEmpty, Container_KeyCompare, Debris_ComputeTorque —
; construction d'un débris avec calcul de couple physique.
; ==============================================================================================
Debris_ConstructWithTorque_9B5BD	proc far		; CODE XREF: VROOMM_StubThunk_6BF6FJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_9B5BE:
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_9B5F9
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9B5F4
		push	ax
		call	String_ConstructEmpty
		pop	cx

loc_9B5E3:
		mov	word ptr [di+9], 0
		xor	ax, ax

loc_9B5EA:
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_9B5F6
; ���������������������������������������������������������������������������

loc_9B5F4:				; CODE XREF: Debris_ConstructWithTorque_9B5BD+1Dj
		mov	ax, di

loc_9B5F6:				; CODE XREF: Debris_ConstructWithTorque_9B5BD+35j
		mov	[si+1Eh], ax

loc_9B5F9:				; CODE XREF: Debris_ConstructWithTorque_9B5BD+Fj
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9B627
		mov	bx, [bp+arg_2]
		mov	[bx+24h], si
		push	si
		push	bx
		push	cs
		call	near ptr Debris_ConstructWithFormation_9B4A0
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+1Eh]
		call	List_AppendTail_22C23
		add	sp, 4
		push	si

loc_9B621:
		call	Debris_ComputeTorque
		pop	cx

loc_9B627:				; CODE XREF: Debris_ConstructWithTorque_9B5BD+40j
		pop	di
		pop	si
		leave
		retf
Debris_ConstructWithTorque_9B5BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle une opération de conteneur (Container_Op_22DE5).
; ==============================================================================================
Debris_ContainerOpWrapper_9B62B	proc far		; CODE XREF: VROOMM_StubThunk_6BF74J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_9B632:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9B646
		push	[bp+arg_2]
		push	word ptr [si+1Eh]
		call	Container_Op_22DE5
		add	sp, 4

loc_9B646:				; CODE XREF: Debris_ContainerOpWrapper_9B62B+Bj
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapper_9B62B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Debris_ConstructWithTorque_9B5BD.
; ==============================================================================================
Debris_ConstructWithTorqueB_9B649	proc far		; CODE XREF: VROOMM_StubThunk_6BF79J

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

loc_9B663:
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_9B694
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9B68F
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [di+9], 0

loc_9B683:
		xor	ax, ax

loc_9B685:
		mov	[di+0Dh], ax

loc_9B688:
		mov	[di+0Bh], ax

loc_9B68B:
		mov	ax, di

loc_9B68D:
		jmp	short loc_9B691
; ���������������������������������������������������������������������������

loc_9B68F:				; CODE XREF: Debris_ConstructWithTorqueB_9B649+2Cj
		mov	ax, di

loc_9B691:				; CODE XREF: Debris_ConstructWithTorqueB_9B649:loc_9B68Dj
		mov	[si+1Eh], ax

loc_9B694:				; CODE XREF: Debris_ConstructWithTorqueB_9B649+1Ej
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9B6AC
		mov	ax, [bp+arg_2]

loc_9B69D:
		mov	[bp+var_2], ax

loc_9B6A0:
		push	ax

loc_9B6A1:
		push	word ptr [si+1Eh]

loc_9B6A4:
		call	List_AppendTail_22C23
		add	sp, 4

loc_9B6AC:				; CODE XREF: Debris_ConstructWithTorqueB_9B649+4Fj
		push	[bp+arg_2]

loc_9B6AF:
		push	[bp+arg_4]

loc_9B6B2:
		call	Container_Op_223F0

loc_9B6B7:
		add	sp, 4
		push	si

loc_9B6BB:
		call	Debris_ComputeTorque
		pop	cx
		pop	di
		pop	si
		leave

locret_9B6C4:
		retf
Debris_ConstructWithTorqueB_9B649	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Container_KeyEquals et une opération de conteneur.
; ==============================================================================================
Debris_ContainerCompareAndOp_9B6C5	proc far		; CODE XREF: VROOMM_StubThunk_6BF7EJ

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
		call	List_AppendIfNonNull_21F8D
		add	sp, 4

loc_9B6E3:
		cmp	word ptr [si+1Eh], 0

loc_9B6E7:
		jz	short loc_9B6F5
		push	di

loc_9B6EA:
		push	word ptr [si+1Eh]
		call	Container_Op_22EDF

loc_9B6F2:
		add	sp, 4

loc_9B6F5:				; CODE XREF: Debris_ContainerCompareAndOp_9B6C5:loc_9B6E7j
		pop	di

loc_9B6F6:
		pop	si

loc_9B6F7:
		pop	bp
		retf
Debris_ContainerCompareAndOp_9B6C5	endp

ovr300		ends
