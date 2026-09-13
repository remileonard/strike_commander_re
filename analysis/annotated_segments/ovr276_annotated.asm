ovr276		segment	para public 'OVERLAY' use16
		assume cs:ovr276
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 227 lignes, NON DÉTAILLÉE — combine ReadFieldGroupB_64A54 ×2, gestion d'erreur.
; ==============================================================================================
AircraftComponent_LoadFieldGroupPair_95E20	proc far		; CODE XREF: VROOMM_StubThunk_6B9D0J

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		mov	[bp+var_2], 0
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_95E6F
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	di, ax
		cmp	dword ptr [si+72h], 2
		jle	short loc_95E61
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2], ax

loc_95E61:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+35j
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_95E78
; ���������������������������������������������������������������������������

loc_95E6F:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+25j
		push	6006h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_95E78:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+4Dj
		push	[bp+var_2]
		push	di
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6CD62
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	di, es:[bx+8Ah]
		mov	[bp+var_4], 0
		mov	ax, es:[bx+8Ch]
		mov	[bp+var_6], ax
		mov	[bp+var_8], 0
		jmp	loc_95FA0
; ���������������������������������������������������������������������������

loc_95EAB:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+1A7j
		push	si
		call	ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx

loc_95EB2:
		cmp	dword ptr [si+6Dh], 504D5854h
		jnz	short loc_95EC1

loc_95EBC:
		mov	ax, 1
		jmp	short loc_95EC3
; ���������������������������������������������������������������������������

loc_95EC1:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+9Aj
		xor	ax, ax

loc_95EC3:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+9Fj
		or	ax, ax
		jz	short loc_95F3A
		push	large 0Ch
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+86h]
		cmp	ax, [bp+var_4]
		ja	short loc_95EEE
		push	6007h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_95EEE:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+C3j
		mov	ax, word ptr [bp+var_10]
		imul	word ptr [bp+var_10+2]
		movzx	eax, ax
		mov	[bp+var_C], eax
		push	2
		push	large [bp+var_10]
		lea	ax, [bp+var_18]
		push	ax
		push	di
		call	VROOMM_StubThunk_6CD3A
		add	sp, 0Ah
		push	large [bp+var_C]
		push	0
		mov	al, [di+4]
		push	ax
		push	large dword ptr	[di]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		add	di, 6
		inc	[bp+var_4]
		jmp	short loc_95F94
; ���������������������������������������������������������������������������

loc_95F3A:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+A5j
		cmp	dword ptr [si+6Dh], 414D5854h
		jnz	short loc_95F49
		mov	ax, 1
		jmp	short loc_95F4B
; ���������������������������������������������������������������������������

loc_95F49:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+122j
		xor	ax, ax

loc_95F4B:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+127j
		or	ax, ax
		jz	short loc_95F94
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_95F60:
		les	bx, [bp+arg_0]

loc_95F63:
		mov	ax, es:[bx+88h]

loc_95F68:
		cmp	ax, [bp+var_8]
		ja	short loc_95F76

loc_95F6D:
		push	6008h

loc_95F70:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_95F76:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+14Bj
		push	large [bp+var_10]
		push	[bp+var_12]
		lea	ax, [bp+var_1A]
		push	ax
		push	si
		push	[bp+var_6]
		call	VROOMM_StubThunk_6CD53
		add	sp, 0Ch
		add	[bp+var_6], 0Ch
		inc	[bp+var_8]

loc_95F94:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+118j
					; AircraftComponent_LoadFieldGroupPair_95E20+12Dj
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_95FA0:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+88j
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_95FAF
		push	si
		call	ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_95FC3
; ���������������������������������������������������������������������������

loc_95FAF:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+184j
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]

loc_95FBA:
		jl	short loc_95FC1
		mov	ax, 1
		jmp	short loc_95FC3
; ���������������������������������������������������������������������������

loc_95FC1:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20:loc_95FBAj
		xor	ax, ax

loc_95FC3:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+18Dj
					; AircraftComponent_LoadFieldGroupPair_95E20+19Fj
		or	ax, ax
		jnz	short loc_95FCA
		jmp	loc_95EAB
; ���������������������������������������������������������������������������

loc_95FCA:				; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+1A5j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadFieldGroupPair_95E20	endp

ovr276		ends
