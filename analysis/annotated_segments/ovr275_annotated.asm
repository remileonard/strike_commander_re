ovr275		segment	para public 'OVERLAY' use16
		assume cs:ovr275
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 666 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_SeekAndRead_64743/SeekAndReadB_647B2 répétés.
; ==============================================================================================
AircraftComponent_LoadFieldSequence_95800	proc far		; CODE XREF: VROOMM_StubThunk_6B9A0J

var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= byte ptr -4Ah
var_49		= byte ptr -49h
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_2F		= byte ptr -2Fh
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1D		= byte ptr -1Dh
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
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		xor	eax, eax
		mov	[bp+var_1C], eax
		mov	[bp+var_18], eax
		mov	[bp+var_14], eax
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9585D
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax

loc_9585D:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+45j
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_95875
		jmp	loc_959D6
; ���������������������������������������������������������������������������

loc_95875:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+70j
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9588D
		jmp	loc_959CF
; ���������������������������������������������������������������������������

loc_9588D:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+88j
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		mov	eax, [si+72h]
		mov	[bp+var_52], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		mov	eax, [bp+var_56]
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 2
		mov	[bp+var_49], 1
		mov	[bp+var_48], 0
		mov	eax, [bp+var_52]
		mov	[bp+var_48], eax
		push	0
		mov	al, [bp+var_4A]
		push	ax
		push	large [bp+var_4E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		push	0
		mov	al, [bp+var_4A]
		push	ax
		push	large [bp+var_4E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_5A+2],	dx
		mov	word ptr [bp+var_5A], ax
		xor	dx, dx
		jmp	short loc_95993
; ���������������������������������������������������������������������������

loc_9591E:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+195j
		les	bx, [bp+var_5A]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9		; switch 10 cases
		ja	short loc_95933	; default
		shl	bx, 1
		jmp	cs:off_95E07[bx] ; switch jump

loc_95933:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Aj
					; AircraftComponent_LoadFieldSequence_95800:loc_9593Fj
					; DATA XREF: ...
		add	[bp+var_C], 27h	; ''' ; default
		add	[bp+var_8], 17h
		jmp	short loc_9598E
; ���������������������������������������������������������������������������

loc_9593F:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		jmp	short loc_95933	; case 0x1
; ���������������������������������������������������������������������������

loc_95941:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		add	[bp+var_C], 2Ah	; '*' ; case 0x2
		add	[bp+var_8], 1Ah
		jmp	short loc_9598E
; ���������������������������������������������������������������������������

loc_9594D:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		add	[bp+var_C], 29h	; ')' ; case 0x4
		add	[bp+var_8], 1Ch
		jmp	short loc_9598E
; ���������������������������������������������������������������������������

loc_95959:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		add	[bp+var_C], 28h	; '(' ; case 0x3

loc_9595E:
		add	[bp+var_8], 18h

loc_95963:
		jmp	short loc_9598E
; ���������������������������������������������������������������������������

loc_95965:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		add	[bp+var_C], 26h	; '&' ; case 0x6
		add	[bp+var_8], 1Eh
		jmp	short loc_9598E
; ���������������������������������������������������������������������������

loc_95971:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		add	[bp+var_C], 29h	; ')' ; case 0x7
		jmp	short loc_95989
; ���������������������������������������������������������������������������

loc_95978:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		add	[bp+var_C], 28h	; '(' ; case 0x8
		add	[bp+var_8], 20h	; ' '
		jmp	short loc_9598E
; ���������������������������������������������������������������������������

loc_95984:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+12Ej
					; DATA XREF: ovr275:off_95E07o
		add	[bp+var_C], 26h	; '&' ; case 0x9

loc_95989:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+176j
		add	[bp+var_8], 24h	; '$'

loc_9598E:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+13Dj
					; AircraftComponent_LoadFieldSequence_95800+14Bj ...
		inc	dx
		add	word ptr [bp+var_5A], 8

loc_95993:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+11Cj
		cmp	dx, di
		jl	short loc_9591E
		cmp	[bp+var_49], 0
		jz	short loc_959BB
		cmp	[bp+var_4E], 0
		jz	short loc_959BB
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_959BB:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+19Bj
					; AircraftComponent_LoadFieldSequence_95800+1A2j
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0

loc_959CF:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+8Aj
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_959D6:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+72j
		push	0
		push	large 534E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_959EE
		jmp	loc_95B14
; ���������������������������������������������������������������������������

loc_959EE:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+1E9j
		push	0
		push	large 4E494C56h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_95A06
		jmp	loc_95B0D
; ���������������������������������������������������������������������������

loc_95A06:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+201j
		mov	eax, [si+72h]
		mov	ebx, 7
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		mov	eax, [si+72h]
		mov	[bp+var_52], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		mov	eax, [bp+var_56]
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 2
		mov	[bp+var_49], 1
		mov	[bp+var_48], 0
		mov	eax, [bp+var_52]
		mov	[bp+var_48], eax
		push	0
		mov	al, [bp+var_4A]
		push	ax
		push	large [bp+var_4E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx

loc_95A6F:
		push	ax
		push	si

loc_95A71:
		call	ResourceRecord_ReadDwordFieldB_64AFF

loc_95A76:
		add	sp, 6
		push	0
		mov	al, [bp+var_4A]
		push	ax
		push	large [bp+var_4E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_5A+2],	dx
		mov	word ptr [bp+var_5A], ax
		xor	dx, dx
		jmp	short loc_95AD0
; ���������������������������������������������������������������������������

loc_95A98:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+2D3j
		les	bx, [bp+var_5A]
		mov	al, es:[bx]
		cbw
		cmp	ax, 2
		jz	short loc_95AB5
		cmp	ax, 3
		jz	short loc_95AC1
		add	[bp+var_10], 0Bh
		add	[bp+var_14], 13h
		jmp	short loc_95ACB
; ���������������������������������������������������������������������������

loc_95AB5:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+2A2j
		add	[bp+var_10], 0Eh
		add	[bp+var_14], 16h
		jmp	short loc_95ACB
; ���������������������������������������������������������������������������

loc_95AC1:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+2A7j
		add	[bp+var_10], 0Ch
		add	[bp+var_14], 14h

loc_95ACB:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+2B3j
					; AircraftComponent_LoadFieldSequence_95800+2BFj
		inc	dx
		add	word ptr [bp+var_5A], 7

loc_95AD0:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+296j
		cmp	dx, [bp+var_2]
		jl	short loc_95A98
		cmp	[bp+var_49], 0
		jz	short loc_95AF9
		cmp	[bp+var_4E], 0
		jz	short loc_95AF9
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_95AF9:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+2D9j
					; AircraftComponent_LoadFieldSequence_95800+2E0j
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0

loc_95B0D:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+203j
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_95B14:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+1EBj
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_95B2C
		jmp	loc_95C4C
; ���������������������������������������������������������������������������

loc_95B2C:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+327j
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_95B44
		jmp	loc_95C45
; ���������������������������������������������������������������������������

loc_95B44:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+33Fj
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	eax, [si+72h]
		mov	[bp+var_52], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h

loc_95B69:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_95B71:
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		mov	eax, [bp+var_56]
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 2
		mov	[bp+var_49], 1
		mov	[bp+var_48], 0
		mov	eax, [bp+var_52]
		mov	[bp+var_48], eax
		push	0
		mov	al, [bp+var_4A]
		push	ax
		push	large [bp+var_4E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		push	0
		mov	al, [bp+var_4A]
		push	ax
		push	large [bp+var_4E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_5A+2],	dx
		mov	word ptr [bp+var_5A], ax
		xor	dx, dx
		jmp	short loc_95C08
; ���������������������������������������������������������������������������

loc_95BD6:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+40Bj
		les	bx, [bp+var_5A]
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jz	short loc_95BEB
		cmp	ax, 2
		jz	short loc_95BF9
		cmp	ax, 3
		jz	short loc_95C03

loc_95BEB:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+3DFj
					; AircraftComponent_LoadFieldSequence_95800+3F7j
		add	[bp+var_18], 0Ah
		add	[bp+var_1C], 11h
		jmp	short loc_95C03
; ���������������������������������������������������������������������������
		jmp	short loc_95BEB
; ���������������������������������������������������������������������������

loc_95BF9:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+3E4j
		add	[bp+var_18], 0Dh
		add	[bp+var_1C], 14h

loc_95C03:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+3E9j
					; AircraftComponent_LoadFieldSequence_95800+3F5j
		inc	dx
		add	word ptr [bp+var_5A], 8

loc_95C08:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+3D4j
		cmp	dx, [bp+var_4]
		jl	short loc_95BD6
		cmp	[bp+var_49], 0
		jz	short loc_95C31
		cmp	[bp+var_4E], 0
		jz	short loc_95C31
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_95C31:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+411j
					; AircraftComponent_LoadFieldSequence_95800+418j
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0

loc_95C45:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+341j
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_95C4C:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+329j
		mov	[bp+var_1D], 2
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_22], eax
		push	0
		push	2

loc_95C61:
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax

loc_95C6D:
		add	sp, 6

loc_95C70:
		mov	[bp+var_26], eax

loc_95C74:
		cmp	[bp+var_26], 30D40h
		jge	short loc_95C96
		cmp	[bp+var_22], 6DDD0h
		jg	short loc_95C92
		cmp	[bp+var_26], 17318h
		jge	short loc_95C96

loc_95C92:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+486j
		mov	[bp+var_1D], 3

loc_95C96:				; CODE XREF: AircraftComponent_LoadFieldSequence_95800+47Cj
					; AircraftComponent_LoadFieldSequence_95800+490j
		mov	eax, [bp+var_C]
		add	eax, [bp+var_10]
		add	eax, [bp+var_18]
		mov	[bp+var_2A], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		imul	ax, 18h

loc_95CB0:
		movzx	eax, ax

loc_95CB4:
		mov	edx, [bp+var_2A]
		add	edx, eax

loc_95CBB:
		mov	[bp+var_2E], edx

loc_95CBF:
		mov	al, [bp+var_1D]

loc_95CC2:
		mov	[bp+var_2F], al

loc_95CC5:
		push	1828h
		push	1
		push	0
		push	ax
		push	edx
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_34+2],	dx
		mov	word ptr [bp+var_34], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_34]
		mov	es:[bx+12h], eax
		mov	al, [bp+var_2F]
		mov	es:[bx+16h], al
		mov	byte ptr es:[bx+17h], 1
		mov	dword ptr es:[bx+18h], 0
		mov	eax, [bp+var_2E]
		mov	es:[bx+18h], eax
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	large dword ptr	es:[bx+12h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		add	ax, word ptr [bp+var_2A]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		mov	ax, es:[bx+2]
		imul	ax, 12h
		movzx	eax, ax
		mov	[bp+var_38], eax
		push	1828h
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_3C+2],	dx
		mov	word ptr [bp+var_3C], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_3C]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 1

loc_95D70:
		mov	dword ptr es:[bx+0Eh], 0
		mov	eax, [bp+var_38]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		add	eax, [bp+var_1C]
		mov	[bp+var_40], eax
		push	1828h
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_44+2],	dx
		mov	word ptr [bp+var_44], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_44]

loc_95DB5:
		mov	es:[bx+1Ch], eax
		mov	byte ptr es:[bx+20h], 2

loc_95DBF:
		mov	byte ptr es:[bx+21h], 1
		mov	dword ptr es:[bx+22h], 0
		mov	eax, [bp+var_40]
		mov	es:[bx+22h], eax
		push	1
		push	0
		push	2
		mov	ax, di
		add	ax, [bp+var_2]
		add	ax, [bp+var_4]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ah], dx
		mov	es:[bx+28h], ax
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadFieldSequence_95800	endp

; ���������������������������������������������������������������������������
off_95E07	dw offset loc_95933	; DATA XREF: AircraftComponent_LoadFieldSequence_95800+12Er
		dw offset loc_9593F	; jump table for switch	statement
		dw offset loc_95941
		dw offset loc_95959
		dw offset loc_9594D
		dw offset loc_95959
		dw offset loc_95965
		dw offset loc_95971
		dw offset loc_95978
		dw offset loc_95984
ovr275		ends
