seg193		segment	byte public 'CODE' use16
		assume cs:seg193
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — constructeur : calcule un offset d'en-tête
; (StreamReader_ComputeHeaderOffset_64088), formate une chaîne (sub_2945, tag 3FCEh),
; initialise un sous-objet (CachedObject_DestructSubobjects_5E95A) et détruit un flux existant
; (StreamReader_Destruct_638FF).
; ==============================================================================================
ResourceRecord_Construct_6450B:				; DATA XREF: seg339:02E0o
					; seg339:off_70755o ...
		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si

loc_64513:
		mov	si, [bp+6]

loc_64516:
		xor	dx, dx

loc_64518:
		cmp	word ptr [si+7Ch], 0
		jz	short loc_64524

loc_6451E:
		mov	dx, [si+7Ch]

loc_64521:
		add	dx, 6

loc_64524:				; CODE XREF: seg193:001Cj
		mov	ax, si
		add	ax, 6Dh	; 'm'
		push	ax
		push	dx
		push	si
		call	StreamReader_ComputeHeaderOffset_64088
		pop	cx
		push	ax
		push	3FCEh
		lea	ax, [bp-80h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp-80h]
		push	ax
		mov	ax, si

loc_64548:
		add	ax, 6
		push	ax

loc_6454C:
		call	CachedObject_DestructSubobjects_5E95A

loc_64551:
		add	sp, 4
		push	si
		call	StreamReader_Destruct_638FF
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — combine sub_64D25 et
; StreamReader_CloseHook_63D6E.
; ==============================================================================================
ResourceRecord_RefreshPosition_6455E:				; DATA XREF: seg339:02E8o
					; seg339:off_7075Do ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		xor	ax, ax
		mov	[si+7Ah], ax
		movsx	eax, ax
		mov	[si+65h], eax
		xor	eax, eax
		mov	[si+76h], eax
		mov	[si+72h], eax
		mov	[si+69h], eax
		mov	al, 0
		mov	[si+71h], al
		mov	[si+6Dh], al
		mov	word ptr [si+7Ch], 0

loc_6458E:
		mov	dword ptr [si+8Ch], 0FFFFFFFFh

loc_64597:
		mov	dword ptr [si+90h], 0

loc_645A0:
		mov	al, 1

loc_645A2:
		pop	si

loc_645A3:
		pop	bp

locret_645A4:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x14] et sub_64C21. Appelée par sub_645CD.
; ==============================================================================================
ResourceRecord_Helper_645A5	proc far		; CODE XREF: seg009:0494P
					; IFF_LoadModelMain+F93P ...

arg_0		= word ptr  6

		push	bp

loc_645A6:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_645B5
; ���������������������������������������������������������������������������

loc_645AE:				; CODE XREF: ResourceRecord_Helper_645A5+14j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_645B5:				; CODE XREF: ResourceRecord_Helper_645A5+7j
		cmp	word ptr [si+7Ah], 0
		jg	short loc_645AE
		mov	dword ptr [si+65h], 0
		push	si
		call	StreamReader_CloseHook_63D6E
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_Helper_645A5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_64C21 et ResourceRecord_Helper_645A5.
; ==============================================================================================
ResourceRecord_InitAndValidate_645CD	proc far		; CODE XREF: PilotProfile_LoadFromPROF_73B4F+77P
					; Font_LoadDefinitionFromIFF_7E1B4+56P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_645D1:
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_645E2:
		or	al, al

loc_645E4:
		jz	short loc_64602
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_4]
		jnz	short loc_645FC
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_AllocateAndDecode_64C21
		pop	cx

loc_645F7:
		mov	ax, 1
		jmp	short loc_64604
; ���������������������������������������������������������������������������

loc_645FC:				; CODE XREF: ResourceRecord_InitAndValidate_645CD+21j
		push	si
		push	cs
		call	near ptr ResourceRecord_Helper_645A5
		pop	cx

loc_64602:				; CODE XREF: ResourceRecord_InitAndValidate_645CD:loc_645E4j
		xor	ax, ax

loc_64604:				; CODE XREF: ResourceRecord_InitAndValidate_645CD+2Dj
		pop	si
		pop	bp
		retf
ResourceRecord_InitAndValidate_645CD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+65h], eax
		pop	si

loc_64623:
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		jmp	short loc_64635
; ���������������������������������������������������������������������������

loc_6462E:				; CODE XREF: seg193:0160j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_64635:				; CODE XREF: seg193:012Cj
		cmp	word ptr [si+7Ah], 0
		jle	short loc_64662
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6464A
		push	si

loc_64642:
		nop

loc_64643:
		push	cs
		call	near ptr ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_6465E
; ���������������������������������������������������������������������������

loc_6464A:				; CODE XREF: seg193:013Fj
		mov	eax, [si+65h]

loc_6464E:
		mov	bx, [si+7Ch]

loc_64651:
		cmp	eax, [bx+0Fh]
		jl	short loc_6465C
		mov	ax, 1
		jmp	short loc_6465E
; ���������������������������������������������������������������������������

loc_6465C:				; CODE XREF: seg193:0155j
		xor	ax, ax

loc_6465E:				; CODE XREF: seg193:0148j seg193:015Aj
		or	ax, ax
		jnz	short loc_6462E

loc_64662:				; CODE XREF: seg193:0139j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_6468D
		jmp	short loc_6467B
; ���������������������������������������������������������������������������

loc_64674:				; CODE XREF: seg193:0181j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_6467B:				; CODE XREF: seg193:0172j
		mov	bx, [si+7Ch]
		cmp	word ptr [bx], 0
		jnz	short loc_64674
		mov	dword ptr [si+65h], 0Ch
		jmp	short loc_64695
; ���������������������������������������������������������������������������

loc_6468D:				; CODE XREF: seg193:0170j
		mov	dword ptr [si+65h], 0

loc_64695:				; CODE XREF: seg193:018Bj
		pop	si
		pop	bp

locret_64697:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit des champs d'en-tête via StreamReader_ReadTyped_63FA1. Appelée par sub_64BC1.
; ==============================================================================================
ResourceRecord_ReadHeaderFields_64698	proc far		; CODE XREF: ResourceRecord_ComputeAlignedBounds_64BC1+17p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_64699:
		mov	bp, sp
		sub	sp, 2
		push	si

loc_6469F:
		mov	si, [bp+arg_0]
		mov	ax, si

loc_646A4:
		add	ax, 72h	; 'r'
		mov	[bp+var_2], ax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ds
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx]
		xchg	ah, al
		xchg	ax, [bx+2]
		xchg	ah, al
		mov	[bx], ax
		mov	eax, [si+72h]

loc_646D3:
		shld	edx, eax, 10h

loc_646D8:
		pop	si
		leave
		retf
ResourceRecord_ReadHeaderFields_64698	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_64BC1 et sub_64B9B — calcule les bornes d'un enregistrement (début/fin).
; Appelée par loc_649F0 et sub_647B2.
; ==============================================================================================
ResourceRecord_ComputeRecordBounds_646DB	proc far		; CODE XREF: seg124:068DP
					; ResourceRecord_SeekAndReadB_647B2+1Bp ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_646DE:
		push	si
		mov	si, [bp+arg_0]
		push	si

loc_646E3:
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx
		cmp	dword ptr [si+6Dh], 4D524F46h

loc_646F1:
		jnz	short loc_646F8

loc_646F3:
		mov	ax, 1
		jmp	short loc_646FA
; ���������������������������������������������������������������������������

loc_646F8:				; CODE XREF: ResourceRecord_ComputeRecordBounds_646DB:loc_646F1j
		xor	ax, ax

loc_646FA:				; CODE XREF: ResourceRecord_ComputeRecordBounds_646DB+1Bj
		or	ax, ax

loc_646FC:
		jz	short loc_6470A
		push	si
		nop

loc_64700:
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_64B9B

loc_64704:
		pop	cx
		mov	ax, 1
		jmp	short loc_6470C
; ���������������������������������������������������������������������������

loc_6470A:				; CODE XREF: ResourceRecord_ComputeRecordBounds_646DB:loc_646FCj
		xor	ax, ax

loc_6470C:				; CODE XREF: ResourceRecord_ComputeRecordBounds_646DB+2Dj
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBounds_646DB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de ResourceRecord_ComputeRecordBounds_646DB (mêmes appels
; sub_64BC1/sub_64B9B). Appelée par sub_6482B.
; ==============================================================================================
ResourceRecord_ComputeRecordBoundsB_6470F	proc far		; CODE XREF: ResourceRecord_SeekAndReadC_6482B+15p

arg_0		= word ptr  6

		push	bp

loc_64710:
		mov	bp, sp
		push	si

loc_64713:
		mov	si, [bp+arg_0]
		push	si

loc_64717:
		nop
		push	cs

loc_64719:
		call	near ptr ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx

loc_6471D:
		cmp	dword ptr [si+6Dh], 20544143h
		jnz	short loc_6472C
		mov	ax, 1
		jmp	short loc_6472E
; ���������������������������������������������������������������������������

loc_6472C:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_6470F+16j
		xor	ax, ax

loc_6472E:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_6470F+1Bj
		or	ax, ax
		jz	short loc_6473E
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_64B9B
		pop	cx
		mov	ax, 1
		jmp	short loc_64740
; ���������������������������������������������������������������������������

loc_6473E:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_6470F+21j
		xor	ax, ax

loc_64740:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_6470F+2Dj
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBoundsB_6470F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 100 lignes, NON DÉTAILLÉE — combine sub_64BF8 (positionnement), sub_64BC1 (bornes)
; et sub_64DB3 (lecture).
; ==============================================================================================
ResourceRecord_SeekAndRead_64743	proc far		; CODE XREF: seg009:03DBP seg010:067FP ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_64758
		push	si
		nop

loc_64753:
		push	cs
		call	near ptr ResourceRecord_SeekToStart_64BF8
		pop	cx

loc_64758:				; CODE XREF: ResourceRecord_SeekAndRead_64743+Cj
		xor	di, di
		jmp	short loc_64785
; ���������������������������������������������������������������������������

loc_6475C:				; CODE XREF: ResourceRecord_SeekAndRead_64743+67j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_64772
		mov	ax, 1
		jmp	short loc_64774
; ���������������������������������������������������������������������������

loc_64772:				; CODE XREF: ResourceRecord_SeekAndRead_64743+28j
		xor	ax, ax

loc_64774:				; CODE XREF: ResourceRecord_SeekAndRead_64743+2Dj
		or	ax, ax
		jz	short loc_6477D
		mov	di, 1
		jmp	short loc_647AC
; ���������������������������������������������������������������������������

loc_6477D:				; CODE XREF: ResourceRecord_SeekAndRead_64743+33j
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_64785:				; CODE XREF: ResourceRecord_SeekAndRead_64743+17j
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_64794
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_64DB3

loc_64791:
		pop	cx

loc_64792:
		jmp	short loc_647A8
; ���������������������������������������������������������������������������

loc_64794:				; CODE XREF: ResourceRecord_SeekAndRead_64743+46j
		mov	eax, [si+65h]

loc_64798:
		mov	bx, [si+7Ch]

loc_6479B:
		cmp	eax, [bx+0Fh]

loc_6479F:
		jl	short loc_647A6
		mov	ax, 1

loc_647A4:
		jmp	short loc_647A8
; ���������������������������������������������������������������������������

loc_647A6:				; CODE XREF: ResourceRecord_SeekAndRead_64743:loc_6479Fj
		xor	ax, ax

loc_647A8:				; CODE XREF: ResourceRecord_SeekAndRead_64743:loc_64792j
					; ResourceRecord_SeekAndRead_64743:loc_647A4j
		or	ax, ax
		jz	short loc_6475C

loc_647AC:				; CODE XREF: ResourceRecord_SeekAndRead_64743+38j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRead_64743	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 99 lignes, NON DÉTAILLÉE — combine sub_64BF8,
; ResourceRecord_ComputeRecordBounds_646DB, sub_64C21, sub_64DB3.
; ==============================================================================================
ResourceRecord_SeekAndReadB_647B2	proc far		; CODE XREF: seg009:038AP seg009:03A6P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_647C7
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_64BF8
		pop	cx

loc_647C7:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+Cj
		xor	di, di
		jmp	short loc_647FE
; ���������������������������������������������������������������������������

loc_647CB:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+71j
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_646DB
		pop	cx
		or	ax, ax
		jz	short loc_647F6
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_647E4
		mov	ax, 1
		jmp	short loc_647E6
; ���������������������������������������������������������������������������

loc_647E4:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+2Bj
		xor	ax, ax

loc_647E6:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+30j
		or	ax, ax
		jz	short loc_647F6
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		jmp	short loc_64825
; ���������������������������������������������������������������������������

loc_647F6:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+21j
					; ResourceRecord_SeekAndReadB_647B2+36j
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_647FE:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+17j
		cmp	word ptr [si+7Ch], 0

loc_64802:
		jnz	short loc_6480D
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_64821
; ���������������������������������������������������������������������������

loc_6480D:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2:loc_64802j
		mov	eax, [si+65h]

loc_64811:
		mov	bx, [si+7Ch]

loc_64814:
		cmp	eax, [bx+0Fh]
		jl	short loc_6481F
		mov	ax, 1
		jmp	short loc_64821
; ���������������������������������������������������������������������������

loc_6481F:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+66j
		xor	ax, ax

loc_64821:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+59j
					; ResourceRecord_SeekAndReadB_647B2+6Bj
		or	ax, ax
		jz	short loc_647CB

loc_64825:				; CODE XREF: ResourceRecord_SeekAndReadB_647B2+42j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadB_647B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 92 lignes, NON DÉTAILLÉE — combine sub_64BF8,
; ResourceRecord_ComputeRecordBoundsB_6470F, sub_64CA3, sub_64DB3.
; ==============================================================================================
ResourceRecord_SeekAndReadC_6482B	proc far		; CODE XREF: seg124:0676P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_64BF8
		pop	cx
		xor	di, di
		jmp	short loc_64871
; ���������������������������������������������������������������������������

loc_6483E:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+6Bj
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBoundsB_6470F
		pop	cx
		or	ax, ax
		jz	short loc_64869
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_64857
		mov	ax, 1
		jmp	short loc_64859
; ���������������������������������������������������������������������������

loc_64857:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+25j
		xor	ax, ax

loc_64859:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+2Aj
		or	ax, ax
		jz	short loc_64869
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_AllocateAndDecodeB_64CA3
		pop	cx
		jmp	short loc_64898
; ���������������������������������������������������������������������������

loc_64869:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+1Bj
					; ResourceRecord_SeekAndReadC_6482B+30j
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_64871:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+11j
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_64880
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_64894
; ���������������������������������������������������������������������������

loc_64880:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+4Aj
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_64892
		mov	ax, 1

loc_64890:
		jmp	short loc_64894
; ���������������������������������������������������������������������������

loc_64892:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+60j
		xor	ax, ax

loc_64894:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+53j
					; ResourceRecord_SeekAndReadC_6482B:loc_64890j
		or	ax, ax
		jz	short loc_6483E

loc_64898:				; CODE XREF: ResourceRecord_SeekAndReadC_6482B+3Cj
		mov	ax, di

loc_6489A:
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadC_6482B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, rôle exact non détaillé (voisin du cluster de lecture d'enregistrement).
; ==============================================================================================
ResourceRecord_Helper_6489E	proc far		; CODE XREF: seg193:03DCp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_648A2:
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+8Ch], eax
		mov	eax, [si+72h]
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[si+90h], eax
		pop	si
		pop	bp
		retf
ResourceRecord_Helper_6489E	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+94h], ax
		mov	ax, [bp+0Ah]
		mov	[si+96h], ax
		push	si
		push	cs
		call	near ptr ResourceRecord_Helper_6489E
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 89 lignes, NON DÉTAILLÉE — probable lecture d'une structure complète depuis le flux.
; ==============================================================================================
ResourceRecord_ReadStructured_648E3	proc far		; CODE XREF: seg193:04B8p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+0A0h], 0
		mov	eax, [si+65h]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0FFFFFFFFh
		mov	eax, [si+90h]
		cmp	eax, [bp+arg_2]
		jle	short loc_64934

loc_64911:
		mov	eax, [bp+arg_2]
		shl	eax, 2
		mov	edx, [si+8Ch]
		add	edx, eax

loc_64921:
		mov	[si+65h], edx
		push	si

loc_64926:
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFieldGroupC_64A7E
		push	dx

loc_6492C:
		push	ax

loc_6492D:
		pop	eax
		pop	cx

loc_64930:
		mov	[bp+var_8], eax

loc_64934:				; CODE XREF: ResourceRecord_ReadStructured_648E3+2Cj
		cmp	[bp+var_8], 0FFFFFFFFh
		jz	short loc_64970
		mov	eax, [bp+var_8]

loc_6493F:
		mov	[si+65h], eax

loc_64943:
		mov	eax, [si+65h]

loc_64947:
		mov	[si+9Ch], eax
		push	si
		nop
		push	cs

loc_6494F:
		call	near ptr ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax

loc_64954:
		pop	eax
		pop	cx
		mov	[si+0A0h], eax
		mov	eax, [si+9Ch]
		add	eax, [si+0A0h]
		mov	[si+0A4h], eax
		mov	ax, 1
		jmp	short loc_6497A
; ���������������������������������������������������������������������������

loc_64970:				; CODE XREF: ResourceRecord_ReadStructured_648E3+56j
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		xor	ax, ax

loc_6497A:				; CODE XREF: ResourceRecord_ReadStructured_648E3+8Bj
		pop	si
		leave
		retf
ResourceRecord_ReadStructured_648E3	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	cx, [bp+8]
		mov	dx, [bp+0Ah]

loc_6498A:
		mov	dword ptr [si+0A0h], 0

loc_64993:
		cmp	[si+94h], cx

loc_64997:
		jl	short loc_6499F

loc_64999:
		cmp	[si+96h], dx

loc_6499D:
		jge	short loc_649A3

loc_6499F:				; CODE XREF: seg193:loc_64997j
		xor	ax, ax

loc_649A1:
		jmp	short loc_649BE
; ���������������������������������������������������������������������������

loc_649A3:				; CODE XREF: seg193:loc_6499Dj
		mov	ax, dx

loc_649A5:
		imul	word ptr [si+94h]
		movsx	eax, ax
		movsx	edx, cx
		add	eax, edx
		push	eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadStructured_648E3
		add	sp, 6

loc_649BE:				; CODE XREF: seg193:loc_649A1j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule une nouvelle position en avançant de (compte × 4 octets) — saut par-dessus un
; tableau de références.
; ==============================================================================================
ResourceRecord_AdvanceByArrayCount_649C1	proc far		; CODE XREF: seg194:0651P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+8Ch], eax

loc_649D1:
		mov	[si+98h], eax
		movsx	eax, [bp+arg_2]
		mov	[si+90h], eax
		mov	eax, [si+90h]
		shl	eax, 2
		add	[si+65h], eax
		pop	si
		pop	bp
		retf
ResourceRecord_AdvanceByArrayCount_649C1	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — si un indicateur (+0x4C) est posé, calcule
; les bornes de l'enregistrement (ResourceRecord_ComputeRecordBounds_646DB) et stocke la
; position de fin (+0x88).
; ==============================================================================================
ResourceRecord_Method_ResolveOptionalField_649F0:				; DATA XREF: seg339:02ECo
					; seg339:off_70761o ...
		push	bp

loc_649F1:
		mov	bp, sp

loc_649F3:
		push	si
		mov	si, [bp+6]

loc_649F7:
		cmp	byte ptr [si+4Ch], 0
		jz	short loc_64A16

loc_649FD:
		mov	word ptr [si+86h], 1
		push	si

loc_64A04:
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_646DB
		pop	cx
		or	ax, ax
		jz	short loc_64A16
		mov	eax, [si+76h]

loc_64A11:
		mov	[si+88h], eax

loc_64A16:				; CODE XREF: seg193:04FBj seg193:050Bj
		pop	si

loc_64A17:
		pop	bp

locret_64A18:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un groupe de champs via StreamReader_ReadTyped_63FA1 (×3).
; ==============================================================================================
ResourceRecord_ReadFieldGroupA_64A19	proc far		; CODE XREF: seg010:06A1P
					; Kneeboard_EntryConstructText+BCP ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp

loc_64A1C:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]

loc_64A23:
		push	large dword ptr	[si+65h]

loc_64A27:
		push	large [bp+arg_6]
		push	large [bp+arg_2]

loc_64A2F:
		push	si
		call	StreamReader_ReadTyped_63FA1
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax

loc_64A40:
		mov	eax, [bp+arg_6]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupA_64A19	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un groupe de champs via StreamReader_ReadTyped_63FA1.
; ==============================================================================================
ResourceRecord_ReadFieldGroupB_64A54	proc far		; CODE XREF: seg009:03ECP seg009:03FEP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+65h]
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		add	dword ptr [si+65h], 2
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupB_64A54	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un groupe de champs via StreamReader_ReadTyped_63FA1. Référencée par sub_8DF49.
; ==============================================================================================
ResourceRecord_ReadFieldGroupC_64A7E	proc far		; CODE XREF: ResourceRecord_ReadStructured_648E3+45p
					; ResourceRecord_ReadStructured_648E3:loc_6494Fp	...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss

loc_64A90:
		lea	ax, [bp+var_4]
		push	ax

loc_64A94:
		push	si

loc_64A95:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_64A9D:
		add	dword ptr [si+65h], 4

loc_64AA2:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupC_64A7E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un champ 32 bits via StreamReader_ReadTyped_63FA1. Référencée par sub_7E1B4
; (chargeur de modèle 3D probable).
; ==============================================================================================
ResourceRecord_ReadDwordField_64AAE	proc far		; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+34EP
					; Font_LoadDefinitionFromIFF_7E1B4+3C8P

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	eax, [bp+var_4]

loc_64AD1:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadDwordField_64AAE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ResourceRecord_ReadFinalField_64B51. Référencée par sub_8DF49.
; ==============================================================================================
ResourceRecord_ReadViaHelper_64AD9	proc far		; CODE XREF: PilotProfile_LoadRADI_8DF49+17EP
					; PilotProfile_LoadRADI_8DF49+191P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di

loc_64AE3:				; CODE XREF: ResourceRecord_ReadViaHelper_64AD9+1Ej
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	dx, di
		inc	di
		les	bx, [bp+arg_2]

loc_64AF0:
		add	bx, dx
		mov	es:[bx], al
		or	al, al
		jnz	short loc_64AE3
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_ReadViaHelper_64AD9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un champ 32 bits via StreamReader_ReadTyped_63FA1. Référencée par sub_7E1B4.
; ==============================================================================================
ResourceRecord_ReadDwordFieldB_64AFF	proc far		; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+2A6P
					; HUDSymbol_LoadConfigFromIFF_85F65+157P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+72h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+76h]
		sub	edx, eax
		sub	edx, [si+65h]
		mov	[bp+var_4], edx

loc_64B22:
		push	large dword ptr	[si+65h]
		push	edx
		push	large [bp+arg_2]

loc_64B2C:
		push	si
		call	StreamReader_ReadTyped_63FA1
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_8], eax
		mov	eax, [si+76h]

loc_64B41:
		mov	[si+65h], eax
		mov	eax, [bp+var_8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadDwordFieldB_64AFF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un champ final via StreamReader_ReadTyped_63FA1. Référencée par sub_3C942.
; ==============================================================================================
ResourceRecord_ReadFinalField_64B51	proc far		; CODE XREF: IFF_LoadAngleParam+3AP
					; IFF_LoadInfoChunk+36P ...

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp

loc_64B52:
		mov	bp, sp

loc_64B54:
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		push	ss
		lea	ax, [bp-1]
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	al, [bp+var_1]
		mov	ah, 0
		pop	si
		leave
		retf
ResourceRecord_ReadFinalField_64B51	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	large dword ptr	[bp+0Ch]
		push	large dword ptr	[bp+10h]
		push	large dword ptr	[bp+8]
		push	ax

loc_64B91:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un champ 32 bits depuis la position courante (+0x65) via
; StreamReader_ReadTyped_63FA1 et avance la position de 4 octets. Fonction fondamentale du
; cluster (lecture séquentielle typée).
; ==============================================================================================
ResourceRecord_ReadDwordAdvance_64B9B	proc far		; CODE XREF: ResourceRecord_ComputeRecordBounds_646DB+26p
					; ResourceRecord_ComputeRecordBoundsB_6470F+26p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_64BA2:
		push	large dword ptr	[si+65h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 6Dh	; 'm'
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		pop	bp
		retf
ResourceRecord_ReadDwordAdvance_64B9B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, sauvegarde la position (+0x69), lit un champ (ResourceRecord_ReadDwordAdvance_64B9B),
; lit l'en-tête (ResourceRecord_ReadHeaderFields_64698), calcule une fin alignée (+0x76) avec
; correction de parité (+0x72).
; ==============================================================================================
ResourceRecord_ComputeAlignedBounds_64BC1	proc far		; CODE XREF: Cinematic_LoadCameraDef+68P
					; ResourceRecord_ComputeRecordBounds_646DB+Ap	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_64B9B
		pop	cx
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadHeaderFields_64698
		pop	cx
		mov	ax, [si+72h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, [si+72h]
		add	edx, eax

loc_64BF1:
		mov	[si+76h], edx
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeAlignedBounds_64BC1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, positionne (+0x65) au début de l'enregistrement courant (+0x7C) avec un décalage fixe
; (+0xC), ou à 0 si aucun enregistrement courant.
; ==============================================================================================
ResourceRecord_SeekToStart_64BF8	proc far		; CODE XREF: ResourceRecord_SeekAndRead_64743+11p
					; ResourceRecord_SeekAndReadB_647B2+11p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0

loc_64C03:
		jnz	short loc_64C0F
		mov	dword ptr [si+65h], 0
		jmp	short loc_64C1E
; ���������������������������������������������������������������������������

loc_64C0F:				; CODE XREF: ResourceRecord_SeekToStart_64BF8:loc_64C03j
		mov	bx, [si+7Ch]
		mov	eax, [bx+2]
		add	eax, 0Ch
		mov	[si+65h], eax

loc_64C1E:				; CODE XREF: ResourceRecord_SeekToStart_64BF8+15j
		pop	si
		pop	bp
		retf
ResourceRecord_SeekToStart_64BF8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 84 lignes, NON DÉTAILLÉE — alloue (sub_658), décode (sub_2B6D, externe), gestion
; d'erreur (Runtime_FatalErrorHandlerWithTag, sub_5F4A9).
; ==============================================================================================
ResourceRecord_AllocateAndDecode_64C21	proc far		; CODE XREF: IFF_LoadModelMain+EBP
					; seg124:06B4P	...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_64C22:
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di

loc_64C29:
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h	; 'i'
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_64C44:
		or	ax, ax

loc_64C46:
		jz	short loc_64C85

loc_64C48:
		mov	ax, [bp+var_2]
		mov	[di], ax

loc_64C4D:
		mov	bx, [bp+var_4]
		mov	eax, [bx]

loc_64C53:
		mov	[di+2],	eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_4]
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax
		mov	ax, di
		jmp	short loc_64C87
; ���������������������������������������������������������������������������

loc_64C85:				; CODE XREF: ResourceRecord_AllocateAndDecode_64C21:loc_64C46j
		mov	ax, di

loc_64C87:				; CODE XREF: ResourceRecord_AllocateAndDecode_64C21+62j
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_64C9C
		push	0B0E0h

loc_64C93:
		push	si

loc_64C94:
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_64C9C:				; CODE XREF: ResourceRecord_AllocateAndDecode_64C21+6Dj
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
ResourceRecord_AllocateAndDecode_64C21	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 81 lignes, NON DÉTAILLÉE — variante de ResourceRecord_AllocateAndDecode_64C21.
; ==============================================================================================
ResourceRecord_AllocateAndDecodeB_64CA3	proc far		; CODE XREF: ResourceRecord_SeekAndReadC_6482B+38p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_64CA4:
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h	; 'i'
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_64D07
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2],	eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax

loc_64CF0:
		call	CRT_Strncpy_Pad

loc_64CF5:
		add	sp, 6

loc_64CF8:
		mov	bx, [bp+var_4]

loc_64CFB:
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax

loc_64D03:
		mov	ax, di
		jmp	short loc_64D09
; ���������������������������������������������������������������������������

loc_64D07:				; CODE XREF: ResourceRecord_AllocateAndDecodeB_64CA3+25j
		mov	ax, di

loc_64D09:				; CODE XREF: ResourceRecord_AllocateAndDecodeB_64CA3+62j
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_64D1E
		push	0B0E0h

loc_64D15:
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_64D1E:				; CODE XREF: ResourceRecord_AllocateAndDecodeB_64CA3+6Dj
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave

locret_64D24:
		retf
ResourceRecord_AllocateAndDecodeB_64CA3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère (sub_338) et réinitialise l'état de l'enregistrement courant.
; ==============================================================================================
ResourceRecord_ReleaseAndClear_64D25	proc far		; CODE XREF: Cinematic_LoadCameraDef+21FP
					; JDYN_LoadChunkAndConstruct_3A49C+52EP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_64D28:
		push	si

loc_64D29:
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_64D55

loc_64D32:
		mov	dx, [si+7Ch]

loc_64D35:
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		mov	ax, [bx]
		mov	[si+7Ch], ax
		or	dx, dx
		jz	short loc_64D52
		push	dx
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_64D52:				; CODE XREF: ResourceRecord_ReleaseAndClear_64D25+22j
		dec	word ptr [si+7Ah]

loc_64D55:				; CODE XREF: ResourceRecord_ReleaseAndClear_64D25+Bj
		pop	si
		pop	bp
		retf
ResourceRecord_ReleaseAndClear_64D25	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ResourceRecord_ReleaseAndClear_64D25 conditionnellement.
; ==============================================================================================
ResourceRecord_ResetIfSet_64D58	proc far		; CODE XREF: seg124:073CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		pop	bp
		retf
ResourceRecord_ResetIfSet_64D58	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	eax, [bp+8]
		mov	[si+82h], eax
		mov	eax, [si+72h]
		cdq
		idiv	dword ptr [bp+8]
		mov	[si+7Eh], eax
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_64D93:
		push	large dword ptr	[si+65h]

loc_64D97:
		mov	eax, [si+7Eh]

loc_64D9B:
		imul	eax, [si+82h]
		push	eax
		push	ds
		push	word ptr [bp+8]
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit la charge utile d'un enregistrement (appelle StreamReader_GetCapacity_64062) —
; fonction de lecture de contenu, cœur du décodage d'enregistrement. Référencée massivement
; dans ce cluster. CONFIRMÉ IFF/FORM-CHUNK (voir seg339).
; ==============================================================================================
ResourceRecord_ReadPayload_64DB3	proc far		; CODE XREF: Cinematic_LoadCameraDef+1FBP
					; seg124:0726P	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, [si+65h]
		jg	short loc_64DD0
		mov	ax, 1
		jmp	short loc_64DD2
; ���������������������������������������������������������������������������

loc_64DD0:				; CODE XREF: ResourceRecord_ReadPayload_64DB3+16j
		xor	ax, ax

loc_64DD2:				; CODE XREF: ResourceRecord_ReadPayload_64DB3+1Bj
		pop	si
		pop	bp
		retf
ResourceRecord_ReadPayload_64DB3	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+6]
		push	large 0FFFFFFFFh
		push	large 1
		push	ss
		lea	ax, [bp-1]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_63FA1
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		cmp	eax, 1
		jz	short loc_64E01
		mov	ax, 1
		jmp	short locret_64E03
; ���������������������������������������������������������������������������

loc_64E01:				; CODE XREF: seg193:08FAj
		xor	ax, ax

locret_64E03:				; CODE XREF: seg193:08FFj
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF implicite, fin de segment) — accesseur simple de
; type/tag d'enregistrement.
; ==============================================================================================
ResourceRecord_Method_GetType_64E05:				; DATA XREF: seg339:02F0o
					; seg339:off_70765o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]

loc_64E0B:
		push	large 80h ; '�'
		push	0

loc_64E13:
		call	FileStream_Construct_635AE
		add	sp, 6
		pop	bp
		retf
seg193		ends
