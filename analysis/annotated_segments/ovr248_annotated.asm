ovr248		segment	para public 'OVERLAY' use16
		assume cs:ovr248
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que Camera_UpdateAndNotify_7AFCA (seg239).
; ==============================================================================================
Camera_UpdateAndNotifyB_861E0	proc far		; CODE XREF: VROOMM_StubThunk_6B1B5J

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	5146h
		call	Camera_CopyState
		add	sp, 4
		mov	bx, [si+80h]
		mov	ax, [bx+4]
		add	ax, 29h	; ')'
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		push	si
		call	Camera_UpdateViewportClip
		pop	cx
		mov	word_724AC, 0
		mov	al, byte_72369
		mov	ah, 0
		or	ax, ax
		jz	short loc_8623E
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, 0A000h
		jge	short loc_86243

loc_8623E:				; CODE XREF: Camera_UpdateAndNotifyB_861E0+41j
		mov	byte_6EB46, 0

loc_86243:				; CODE XREF: Camera_UpdateAndNotifyB_861E0+5Cj
		push	si
		push	59C3h
		call	WorldObjects_CallSlot4OnAllThenRecompute_2214F
		add	sp, 4
		mov	byte_6EB46, 1
		push	53FAh
		call	Widget_RefreshTextConditional
		pop	cx
		push	53FAh
		call	Collection_NotifyAllDestroy
		pop	cx
		push	large 0
		mov	bx, [si+80h]
		mov	al, [bx+17h]
		push	ax
		push	large dword ptr	[bx+13h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4
		pop	si
		leave
		retf
Camera_UpdateAndNotifyB_861E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 628 lignes, NON DÉTAILLÉE — combine longueur vectorielle,
; Matrix_LocalToWorld_58828, Vector_PrescaleBelow256_55B04, Vector_TransformHelperB_559BB
; (seg116-117) — grande fonction de calcul de solution de ciblage IA. Candidat pour session
; dédiée.
; ==============================================================================================
AITargeting_ComputeFullSolution_862A5	proc far		; CODE XREF: VROOMM_StubThunk_6B1B0J

var_154		= dword	ptr -154h
var_14A		= dword	ptr -14Ah
var_146		= dword	ptr -146h
var_142		= dword	ptr -142h
var_13E		= dword	ptr -13Eh
var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= dword	ptr -132h
var_12E		= dword	ptr -12Eh
var_12A		= dword	ptr -12Ah
var_126		= dword	ptr -126h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= dword	ptr -11Ah
var_116		= dword	ptr -116h
var_112		= dword	ptr -112h
var_10E		= dword	ptr -10Eh
var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= dword	ptr -102h
var_FE		= dword	ptr -0FEh
var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= dword	ptr -0F2h
var_EE		= dword	ptr -0EEh
var_EA		= dword	ptr -0EAh
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+80h]
		mov	bx, [bx+4]
		mov	ax, [bx+19h]
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	di, [bx+20h]
		mov	cx, di
		add	cx, 4
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		mov	[bp+var_A], 0
		mov	ax, [di+5Ch]
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_862F9
		jmp	loc_863B2
; ���������������������������������������������������������������������������

loc_862F9:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+4Fj
		mov	bx, [bp+var_C]
		mov	eax, [bx+20h]
		shl	eax, 2
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[bp+var_6], eax
		mov	cx, [bp+var_C]
		add	cx, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_16], ax
		mov	bx, cx
		mov	eax, [bx]
		mov	bx, [bp+var_16]
		sub	eax, [bx]
		mov	[bp+var_C6], eax
		mov	bx, cx
		mov	eax, [bx+4]
		mov	bx, [bp+var_16]
		sub	eax, [bx+4]
		mov	[bp+var_C2], eax
		mov	bx, cx
		mov	eax, [bx+8]
		mov	bx, [bp+var_16]
		sub	eax, [bx+8]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_C6]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_CE]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_CA]
		mov	[bp+var_B2], eax
		push	eax
		push	large [bp+var_B6]
		push	large [bp+var_BA]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[bp+var_A], eax

loc_863B2:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+51j
		mov	al, [di+95h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 7		; switch 8 cases
		jbe	short loc_863C2
		jmp	loc_86553	; default
; ���������������������������������������������������������������������������

loc_863C2:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+118j
		shl	bx, 1
		jmp	cs:off_8692E[bx] ; switch jump

loc_863C9:				; DATA XREF: ovr248:off_8692Eo
		push	[bp+var_2]	; case 0x0
		push	ss
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6B0A3
		add	sp, 6
		mov	eax, [bp+var_DE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_DA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_B2], eax
		mov	ax, di
		add	ax, 10h
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		lea	ax, [bp+var_BA]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		lea	ax, [bp+var_BA]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		cmp	[bp+var_C], 0
		jnz	short loc_8642A
		jmp	loc_86852
; ���������������������������������������������������������������������������

loc_8642A:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+180j
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_6]
		jl	short loc_86439
		mov	ax, 1
		jmp	short loc_8643B
; ���������������������������������������������������������������������������

loc_86439:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+18Dj
		xor	ax, ax

loc_8643B:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+192j
		or	al, al
		jnz	short loc_86442
		jmp	loc_86852
; ���������������������������������������������������������������������������

loc_86442:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+198j
		mov	eax, [bp+var_A]
		sub	eax, [bp+var_6]
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		mov	[bp+var_6], eax
		mov	bx, [si+80h]
		mov	eax, [bx+1Dh]
		mov	[bp+var_2A], eax
		shl	eax, 8
		cmp	eax, [bp+var_6]
		jge	short loc_86471
		mov	ax, 1
		jmp	short loc_86473
; ���������������������������������������������������������������������������

loc_86471:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+1C5j
		xor	ax, ax

loc_86473:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+1CAj
		or	al, al
		jz	short loc_86493
		mov	bx, [si+80h]
		mov	eax, [bx+1Dh]
		mov	[bp+var_2E], eax
		shl	eax, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_6], eax

loc_86493:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+1D0j
		mov	eax, [bp+var_BA]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_96], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_B6]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_B2]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_14A], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_142], eax
		lea	ax, [bp+var_14A]
		push	ax
		sub	sp, 4
		mov	eax, [si+1Ch]
		add	eax, [bp+var_142]
		mov	[bp+var_AE], eax
		mov	[bp+var_154], eax
		push	si
		call	Camera_FrustumClipTest
		add	sp, 8
		mov	eax, [bp+var_14A]
		add	[si+14h], eax
		mov	eax, [bp+var_146]
		add	[si+18h], eax
		mov	eax, [bp+var_142]
		add	[si+1Ch], eax
		jmp	loc_86852
; ���������������������������������������������������������������������������

loc_86553:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+11Aj
					; AITargeting_ComputeFullSolution_862A5+11Fj
					; DATA XREF: ...
		cmp	[bp+var_C], 0	; default
		jnz	short loc_8655C
		jmp	loc_866B1
; ���������������������������������������������������������������������������

loc_8655C:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+2B2j
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_6]
		jl	short loc_8656B
		mov	ax, 1
		jmp	short loc_8656D
; ���������������������������������������������������������������������������

loc_8656B:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+2BFj
		xor	ax, ax

loc_8656D:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+2C4j
		or	al, al
		jnz	short loc_86574
		jmp	loc_86852
; ���������������������������������������������������������������������������

loc_86574:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+2CAj
		lea	ax, [bp+var_BA]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		lea	ax, [bp+var_BA]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	bx, [si+80h]
		mov	eax, [bx+1Dh]
		mov	[bp+var_36], eax
		shl	eax, 8
		cmp	eax, [bp+var_A]
		jge	short loc_865A5
		mov	ax, 1
		jmp	short loc_865A7
; ���������������������������������������������������������������������������

loc_865A5:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+2F9j
		xor	ax, ax

loc_865A7:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+2FEj
		or	al, al
		jz	short loc_865D2
		mov	bx, [si+80h]
		mov	eax, [bx+1Dh]
		mov	[bp+var_3A], eax
		shl	eax, 8
		mov	edx, [bp+var_A]
		sub	edx, eax
		mov	[bp+var_3E], edx
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		add	[bp+var_6], eax

loc_865D2:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+304j
		mov	cx, [bp+var_C]
		add	cx, 12h
		mov	eax, [bp+var_BA]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_B6]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_B2]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_E2], eax
		mov	bx, cx
		mov	eax, [bx]
		sub	eax, [bp+var_EA]
		mov	[bp+var_F6], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_E6]
		mov	[bp+var_F2], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_E2]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_F6]
		mov	[bp+var_102], eax
		mov	eax, [bp+var_F2]
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_EE]
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_102]
		mov	[si+14h], eax
		mov	eax, [bp+var_FE]
		mov	[si+18h], eax
		mov	eax, [bp+var_FA]
		mov	[si+1Ch], eax
		jmp	loc_86852
; ���������������������������������������������������������������������������

loc_866B1:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+2B4j
		mov	cx, di
		add	cx, 1Ch
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_BA], eax
		mov	eax, [bx+4]
		mov	[bp+var_B6], eax
		mov	eax, [bx+8]
		mov	[bp+var_B2], eax
		jmp	loc_86852
; ���������������������������������������������������������������������������

loc_866D5:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+11Fj
					; DATA XREF: ovr248:off_8692Eo
		push	[bp+var_2]	; case 0x4
		push	ss
		lea	ax, [bp+var_10E]
		push	ax
		call	VROOMM_StubThunk_6B0A3
		add	sp, 6
		mov	eax, [bp+var_10E]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_10A]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_106]
		mov	[bp+var_B2], eax
		lea	ax, [bp+var_BA]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		lea	ax, [bp+var_BA]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	ax, di
		add	ax, 10h
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	[bp+var_5E], 0F3h ; '�'
		mov	eax, [di+40h]
		mov	edx, [bp+var_5E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_66], eax
		mov	[bp+var_6], eax
		mov	[bp+var_6A], 1400h
		cmp	eax, [bp+var_6A]
		jge	short loc_86768
		mov	ax, 1
		jmp	short loc_8676A
; ���������������������������������������������������������������������������

loc_86768:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+4BCj
		xor	ax, ax

loc_8676A:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+4C1j
		or	al, al
		jz	short loc_8677E
		mov	[bp+var_6E], 1400h
		mov	eax, [bp+var_6E]
		mov	[bp+var_6], eax

loc_8677E:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+4C7j
		mov	bx, [si+80h]
		mov	eax, [bx+1Dh]
		mov	[bp+var_72], eax
		shl	eax, 8
		cmp	eax, [bp+var_6]
		jge	short loc_86799
		mov	ax, 1
		jmp	short loc_8679B
; ���������������������������������������������������������������������������

loc_86799:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+4EDj
		xor	ax, ax

loc_8679B:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+4F2j
		or	al, al
		jz	short loc_867BB
		mov	bx, [si+80h]
		mov	eax, [bx+1Dh]
		mov	[bp+var_76], eax
		shl	eax, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_6], eax

loc_867BB:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+4F8j
		mov	eax, [bp+var_BA]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_B6]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_86], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_B2]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_116], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_112], eax
		mov	eax, [bp+var_11A]
		add	[si+14h], eax
		mov	eax, [bp+var_116]
		add	[si+18h], eax
		mov	eax, [bp+var_112]
		add	[si+1Ch], eax

loc_86852:				; CODE XREF: AITargeting_ComputeFullSolution_862A5+182j
					; AITargeting_ComputeFullSolution_862A5+19Aj ...
		mov	eax, [bp+var_BA]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_11E], eax
		mov	ax, di
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_126]
		mov	[si+2Ch], eax
		mov	eax, [bp+var_122]
		mov	[si+30h], eax
		mov	eax, [bp+var_11E]
		mov	[si+34h], eax
		mov	ax, si
		add	ax, 38h	; '8'
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	ss
		lea	ax, [bp+var_132]
		push	ax
		call	Vector_CrossProduct3D_550B7
		add	sp, 8
		mov	eax, [bp+var_132]
		mov	[si+20h], eax
		mov	eax, [bp+var_12E]
		mov	[si+24h], eax
		mov	eax, [bp+var_12A]
		mov	[si+28h], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	ss
		lea	ax, [bp+var_13E]
		push	ax
		call	Vector_CrossProduct3D_550B7
		add	sp, 8
		mov	eax, [bp+var_13E]
		mov	[si+38h], eax
		mov	eax, [bp+var_13A]
		mov	[si+3Ch], eax
		mov	eax, [bp+var_136]
		mov	[si+40h], eax
		mov	ax, si
		add	ax, 38h	; '8'
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
AITargeting_ComputeFullSolution_862A5	endp

; ���������������������������������������������������������������������������
off_8692E	dw offset loc_863C9	; DATA XREF: AITargeting_ComputeFullSolution_862A5+11Fr
		dw offset loc_86553	; jump table for switch	statement
		dw offset loc_86553
		dw offset loc_86553
		dw offset loc_866D5
		dw offset loc_866D5
		dw offset loc_86553
		dw offset loc_866D5

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
AITargeting_Helper3_8693E	proc far		; CODE XREF: VROOMM_StubThunk_6B1BAJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0Bh
		pop	bp
		retf
AITargeting_Helper3_8693E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (21 lignes).
; ==============================================================================================
AITargeting_Helper4_86948	proc far		; CODE XREF: VROOMM_StubThunk_6B1BFJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0
		jz	short loc_86962
		push	word ptr [si+11h]
		mov	bx, [si+11h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]
		pop	cx

loc_86962:				; CODE XREF: AITargeting_Helper4_86948+Bj
		pop	si
		pop	bp
		retf
AITargeting_Helper4_86948	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et Rect_BlitOverlapRegionVariant_62E16 (seg182).
; ==============================================================================================
HUDSymbol_BlitOverlapRegion_86965	proc far		; CODE XREF: VROOMM_StubThunk_6B1C4J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0
		jz	short loc_869B0
		push	word ptr [si+11h]
		mov	bx, [si+11h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+18h]
		pop	cx
		push	0
		mov	al, byte_7252C
		push	ax
		push	large [dword_72528]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		add	ax, 2B00h
		push	dx
		push	ax
		mov	ax, [si+4]
		add	ax, 29h	; ')'
		push	ax
		mov	ax, [si+4]
		add	ax, 29h	; ')'
		push	ax
		call	Rect_BlitOverlapRegionVariant_62E16
		add	sp, 8

loc_869B0:				; CODE XREF: HUDSymbol_BlitOverlapRegion_86965+Bj
		pop	si
		pop	bp
		retf
HUDSymbol_BlitOverlapRegion_86965	endp

ovr248		ends
