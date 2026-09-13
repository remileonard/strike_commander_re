seg126		segment	byte public 'CODE' use16
		assume cs:seg126
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 116 lignes, NON DÉTAILLÉE — résout/insère un nœud dans un registre global
; (dword_709BF, via sub_5BBCC ×7). Référencée par sub_5B421 et sub_5B987.
; ==============================================================================================
Registry_ResolveOrInsertNode_5AE5F	proc far		; CODE XREF: Registry_MainOperationVariant_5B421+F4p
					; PagedMemory_ReadByte_5B987+32P
					; DATA XREF: ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		cmp	dword_709BF, 0
		jnz	short loc_5AE96
		mov	eax, [bp+arg_0]
		mov	dword_709BF, eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		jmp	loc_5AF94
; ���������������������������������������������������������������������������

loc_5AE96:				; CODE XREF: Registry_ResolveOrInsertNode_5AE5F+Cj
		mov	eax, dword_709BF
		mov	[bp+var_8], eax
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		push	1
		push	large [dword_709BF]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jbe	short loc_5AEE9
		mov	eax, [bp+arg_0]
		mov	dword_709BF, eax
		jmp	short loc_5AF1F
; ���������������������������������������������������������������������������

loc_5AEE9:				; CODE XREF: Registry_ResolveOrInsertNode_5AE5F+7Ej
					; Registry_ResolveOrInsertNode_5AE5F+BEj
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+var_8]
		cmp	eax, dword_709BF
		jz	short loc_5AF1F
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jb	short loc_5AEE9

loc_5AF1F:				; CODE XREF: Registry_ResolveOrInsertNode_5AE5F+88j
					; Registry_ResolveOrInsertNode_5AE5F+B1j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]

loc_5AF94:				; CODE XREF: Registry_ResolveOrInsertNode_5AE5F+34j
		mov	es:[bx+8], eax
		leave
		retf
Registry_ResolveOrInsertNode_5AE5F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Registry_ResolveOrInsertNode (sub_5BBCC ×3). Référencée par sub_5B036.
; ==============================================================================================
Registry_ResolveNodeVariant_5AF9B	proc far		; CODE XREF: Registry_BuildOrUpdateEntry_5B036+F5p
					; Registry_MainOperation_5B26B+B0p ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+arg_0]
		jnz	short loc_5AFCE
		mov	dword_709BF, 0
		jmp	short locret_5B034
; ���������������������������������������������������������������������������

loc_5AFCE:				; CODE XREF: Registry_ResolveNodeVariant_5AF9B+26j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		cmp	eax, dword_709BF
		jnz	short loc_5AFF6
		mov	eax, [bp+var_C]
		mov	dword_709BF, eax

loc_5AFF6:				; CODE XREF: Registry_ResolveNodeVariant_5AF9B+51j
		push	1
		push	large [bp+var_8]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx+8], eax

locret_5B034:				; CODE XREF: Registry_ResolveNodeVariant_5AF9B+31j
		leave
		retf
Registry_ResolveNodeVariant_5AF9B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 219 lignes, NON DÉTAILLÉE — combine Registry_ResolveNodeVariant_5AF9B et de nombreux
; appels sub_5BBCC (×11). Référencée par sub_5B26B. Candidat pour session dédiée.
; ==============================================================================================
Registry_BuildOrUpdateEntry_5B036	proc far		; CODE XREF: Registry_MainOperation_5B26B+139p
					; Registry_MainOperationVariant_5B421+EAp

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_10]
		jnz	short loc_5B0B3
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_10]
		jnz	short loc_5B084
		jmp	locret_5B269
; ���������������������������������������������������������������������������

loc_5B084:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+49j
		mov	dword_709BF, eax
		push	1
		push	large [bp+var_10]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_5B0AC
		jmp	locret_5B269
; ���������������������������������������������������������������������������

loc_5B0AC:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+71j
		mov	eax, [bp+var_10]
		jmp	loc_5B265
; ���������������������������������������������������������������������������

loc_5B0B3:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+3Fj
		mov	al, 1
		mov	[bp+var_12], al
		mov	[bp+var_11], al
		push	1
		push	large [bp+var_10]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jnb	short loc_5B0E7
		mov	eax, [bp+var_10]
		cmp	eax, dword_709BF
		jnz	short loc_5B11D

loc_5B0E7:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+A4j
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jbe	short loc_5B113
		mov	eax, [bp+arg_0]
		cmp	eax, dword_709BF
		jnz	short loc_5B119

loc_5B113:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+D0j
		mov	[bp+var_12], 0
		jmp	short loc_5B11D
; ���������������������������������������������������������������������������

loc_5B119:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+DBj
		mov	[bp+var_11], 0

loc_5B11D:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+AFj
					; Registry_BuildOrUpdateEntry_5B036+E1j
		cmp	[bp+var_12], 0
		jnz	short loc_5B126
		jmp	locret_5B269
; ���������������������������������������������������������������������������

loc_5B126:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+EBj
		push	large [bp+arg_0]
		push	cs
		call	near ptr Registry_ResolveNodeVariant_5AF9B
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_5B18C
		push	1
		push	large [bp+var_10]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_5B14B:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+152j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_709BF
		jz	short loc_5B1DB
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_5B14B
		jmp	short loc_5B1DB
; ���������������������������������������������������������������������������

loc_5B18C:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+FFj
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_5B1A0:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+1A3j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		cmp	eax, dword_709BF
		jz	short loc_5B1DB
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		ja	short loc_5B1A0

loc_5B1DB:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+148j
					; Registry_BuildOrUpdateEntry_5B036+154j ...
		push	1
		push	large [bp+var_16]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_1A]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_1A]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_16]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_709BF
		jnz	short locret_5B269
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_1E]
		jnb	short locret_5B269
		mov	eax, [bp+arg_0]

loc_5B265:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+7Aj
		mov	dword_709BF, eax

locret_5B269:				; CODE XREF: Registry_BuildOrUpdateEntry_5B036+4Bj
					; Registry_BuildOrUpdateEntry_5B036+73j ...
		leave
		retf
Registry_BuildOrUpdateEntry_5B036	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 175 lignes, NON DÉTAILLÉE — orchestre Registry_ResolveNodeVariant_5AF9B et
; Registry_BuildOrUpdateEntry_5B036, avec gestion d'erreur (sub_6B70F ×3). Référencée depuis
; seg128.
; ==============================================================================================
Registry_MainOperation_5B26B	proc far		; CODE XREF: seg128:001DP

var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		mov	[bp+var_4], 0
		cmp	byte_709BE, 0
		jz	short loc_5B284
		jmp	loc_5B40D
; ���������������������������������������������������������������������������

loc_5B284:				; CODE XREF: Registry_MainOperation_5B26B+14j
		cmp	[bp+arg_4], 0
		jnz	short loc_5B294
		push	1504h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B294:				; CODE XREF: Registry_MainOperation_5B26B+1Ej
		mov	byte_709C3, 0
		add	[bp+arg_4], 1Fh
		and	[bp+arg_4], 0FFFFFFF0h
		mov	eax, dword_709BF
		mov	[bp+var_C], eax
		mov	[bp+var_D], 0
		cmp	dword_709BF, 0
		jz	short loc_5B2FB

loc_5B2B7:				; CODE XREF: Registry_MainOperation_5B26B+8Ej
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnb	short loc_5B2E3
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		jmp	short loc_5B2E7
; ���������������������������������������������������������������������������

loc_5B2E3:				; CODE XREF: Registry_MainOperation_5B26B+6Bj
		mov	[bp+var_D], 1

loc_5B2E7:				; CODE XREF: Registry_MainOperation_5B26B+76j
		mov	eax, [bp+var_C]
		cmp	eax, dword_709BF
		jz	short loc_5B2FB
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B2B7

loc_5B2FB:				; CODE XREF: Registry_MainOperation_5B26B+4Aj
					; Registry_MainOperation_5B26B+85j
		cmp	[bp+var_D], 0
		jnz	short loc_5B304
		jmp	loc_5B3FE
; ���������������������������������������������������������������������������

loc_5B304:				; CODE XREF: Registry_MainOperation_5B26B+94j
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnz	short loc_5B324
		or	dword ptr es:[bx], 1
		push	large [bp+var_C]
		push	cs
		call	near ptr Registry_ResolveNodeVariant_5AF9B
		add	sp, 4
		jmp	loc_5B3B2
; ���������������������������������������������������������������������������

loc_5B324:				; CODE XREF: Registry_MainOperation_5B26B+A4j
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		sub	eax, [bp+arg_4]
		mov	[bp+var_1A], eax
		mov	eax, es:[bx]
		add	eax, [bp+var_C]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_C]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx], eax
		push	1
		push	large [bp+var_12]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+arg_4]
		or	eax, 1
		les	bx, [bp+var_8]
		mov	es:[bx], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+4], eax
		push	1
		push	large [bp+var_16]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_12]
		mov	es:[bx+4], eax
		push	large [bp+var_C]
		push	cs
		call	near ptr Registry_BuildOrUpdateEntry_5B036
		add	sp, 4
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax

loc_5B3B2:				; CODE XREF: Registry_MainOperation_5B26B+B6j
		mov	eax, [bp+var_C]
		add	eax, [bp+arg_4]
		dec	eax
		shr	eax, 0Eh
		inc	ax
		mov	edx, [bp+var_C]
		add	edx, 10h
		shr	edx, 0Eh
		sub	ax, dx
		mov	si, ax
		cmp	si, 4
		jbe	short loc_5B3DF
		push	1513h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B3DF:				; CODE XREF: Registry_MainOperation_5B26B+169j
		movzx	eax, si
		shl	eax, 18h
		mov	edx, 1
		or	edx, eax
		or	[bp+var_C], edx
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_5B40D
; ���������������������������������������������������������������������������

loc_5B3FE:				; CODE XREF: Registry_MainOperation_5B26B+96j
		cmp	[bp+arg_8], 0
		jz	short loc_5B40D
		push	1503h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B40D:				; CODE XREF: Registry_MainOperation_5B26B+16j
					; Registry_MainOperation_5B26B+191j ...
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
Registry_MainOperation_5B26B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 109 lignes, NON DÉTAILLÉE — orchestre Registry_BuildOrUpdateEntry_5B036 et
; Registry_ResolveOrInsertNode_5AE5F, avec gestion d'erreur (sub_6B70F). Référencée depuis
; seg128.
; ==============================================================================================
Registry_MainOperationVariant_5B421	proc far		; CODE XREF: seg128:005BP

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_5B43D
		jmp	locret_5B52E
; ���������������������������������������������������������������������������

loc_5B43D:				; CODE XREF: Registry_MainOperationVariant_5B421+17j
		cmp	byte_709BE, 0
		jz	short loc_5B447
		jmp	locret_5B52E
; ���������������������������������������������������������������������������

loc_5B447:				; CODE XREF: Registry_MainOperationVariant_5B421+21j
		push	large [bp+arg_0]
		call	PagedMemory_ReleaseRange_5BD80
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B467
		mov	byte_709BE, 1
		push	1509h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B467:				; CODE XREF: Registry_MainOperationVariant_5B421+36j
		mov	byte_709C3, 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_8], eax
		push	eax
		nop
		push	cs
		call	near ptr Registry_ResolveNodeVariantB_5B530
		add	sp, 4
		push	1
		push	large [bp+var_8]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		and	dword ptr es:[bx], 0FFFFFFFEh
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jz	short loc_5B510
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		test	dword ptr es:[bx], 1
		jnz	short loc_5B510
		mov	eax, [bp+var_C]
		add	es:[bx], eax
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_10]
		mov	es:[bx+4], eax
		push	eax
		push	cs
		call	near ptr Registry_BuildOrUpdateEntry_5B036
		jmp	short loc_5B518
; ���������������������������������������������������������������������������

loc_5B510:				; CODE XREF: Registry_MainOperationVariant_5B421+98j
					; Registry_MainOperationVariant_5B421+B7j
		push	large [bp+var_8]
		push	cs
		call	near ptr Registry_ResolveOrInsertNode_5AE5F

loc_5B518:				; CODE XREF: Registry_MainOperationVariant_5B421+EDj
		add	sp, 4
		mov	[bp+var_14], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_14]
		mov	es:[bx], eax

locret_5B52E:				; CODE XREF: Registry_MainOperationVariant_5B421+19j
					; Registry_MainOperationVariant_5B421+23j
		leave
		retf
Registry_MainOperationVariant_5B421	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Registry_ResolveNodeVariant_5AF9B et sub_5BBCC ×4. Référencée par
; Registry_MainOperationVariant_5B421.
; ==============================================================================================
Registry_ResolveNodeVariantB_5B530	proc far		; CODE XREF: Registry_MainOperationVariant_5B421+60p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		mov	edx, [bp+arg_0]
		add	edx, eax
		mov	[bp+var_8], edx
		push	1
		push	edx
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		test	[bp+var_C], 1
		jnz	short locret_5B5D7
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		push	large [bp+var_8]
		push	cs
		call	near ptr Registry_ResolveNodeVariant_5AF9B
		add	sp, 4
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		add	es:[bx], eax

locret_5B5D7:				; CODE XREF: Registry_ResolveNodeVariantB_5B530+55j
		leave
		retf
Registry_ResolveNodeVariantB_5B530	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_5BBCC — référencée directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
Registry_LookupForTextRenderer_5B5D9	proc far		; CODE XREF: TextRenderer_Main:loc_27853P
					; Terrain_SectorIndexResolve+FP	...

var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, byte_709C3
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B5EC
		jmp	loc_5B67E
; ���������������������������������������������������������������������������

loc_5B5EC:				; CODE XREF: Registry_LookupForTextRenderer_5B5D9+Ej
		mov	al, byte_709BE
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B5F8
		jmp	loc_5B67E
; ���������������������������������������������������������������������������

loc_5B5F8:				; CODE XREF: Registry_LookupForTextRenderer_5B5D9+1Aj
		mov	eax, dword_709BF
		mov	[bp+var_8], eax
		mov	si, 4E20h
		mov	byte_709C3, 1
		xor	eax, eax
		mov	dword_709C8, eax
		mov	dword_709C4, eax
		cmp	dword_709BF, 0
		jz	short loc_5B67E

loc_5B61B:				; CODE XREF: Registry_LookupForTextRenderer_5B5D9+89j
		push	1
		push	large [bp+var_8]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, dword_709C8
		jbe	short loc_5B641
		mov	dword_709C8, eax

loc_5B641:				; CODE XREF: Registry_LookupForTextRenderer_5B5D9+62j
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		add	dword_709C4, eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		cmp	eax, dword_709BF
		jz	short loc_5B664
		mov	ax, si
		dec	si
		or	ax, ax
		jg	short loc_5B61B

loc_5B664:				; CODE XREF: Registry_LookupForTextRenderer_5B5D9+82j
		sub	dword_709C8, 10h
		or	si, si
		jg	short loc_5B67E
		mov	byte_709BE, 1
		xor	eax, eax
		mov	dword_709C4, eax
		mov	dword_709C8, eax

loc_5B67E:				; CODE XREF: Registry_LookupForTextRenderer_5B5D9+10j
					; Registry_LookupForTextRenderer_5B5D9+1Cj ...
		mov	eax, dword_709C4
		shld	edx, eax, 10h
		pop	si
		leave
		retf
Registry_LookupForTextRenderer_5B5D9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_5BBCC ×2. Référencée depuis seg128.
; ==============================================================================================
Registry_LookupVariant_5B68A	proc far		; CODE XREF: seg128:009FP

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_709C3
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B6F1
		mov	al, byte_709BE
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B6F1
		cmp	dword_709BF, 0
		jz	short loc_5B6E8
		push	1
		push	large [dword_709BF]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	1
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx+8]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		sub	eax, 10h
		mov	dword_709C8, eax
		jmp	short loc_5B6F1
; ���������������������������������������������������������������������������

loc_5B6E8:				; CODE XREF: Registry_LookupVariant_5B68A+1Ej
		mov	dword_709C8, 0

loc_5B6F1:				; CODE XREF: Registry_LookupVariant_5B68A+Dj
					; Registry_LookupVariant_5B68A+16j ...
		mov	eax, dword_709C8
		shld	edx, eax, 10h
		leave
		retf
Registry_LookupVariant_5B68A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 117 lignes, NON DÉTAILLÉE — appelle sub_5BBCC ×2. Référencée par sub_14279 (proche
; de UIScreen_Construct, seg114).
; ==============================================================================================
Registry_LookupForUIScreen_5B6FC	proc far		; CODE XREF: Program_InitVideoFontArgs+AAP
					; MissionScenario_ConstructAndBindUI_A81E0+3CP

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bl, [bp+arg_0]
		mov	eax, dword_709BF
		mov	[bp+var_14], eax
		movzx	eax, bl
		shl	eax, 8
		movzx	edx, bl
		or	eax, edx
		shl	edx, 8
		movzx	ebx, bl
		or	edx, ebx
		shl	edx, 10h
		or	eax, edx
		mov	[bp+var_10], eax
		cmp	dword_709BF, 0
		jnz	short loc_5B73E
		jmp	loc_5B7EE
; ���������������������������������������������������������������������������

loc_5B73E:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+3Dj
		mov	al, byte_709BE
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B74A
		jmp	loc_5B7EE
; ���������������������������������������������������������������������������

loc_5B74A:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+49j
					; Registry_LookupForUIScreen_5B6FC+EFj
		push	1
		push	large [bp+var_14]
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		sub	eax, 10h
		mov	[bp+var_1C], eax
		jmp	short loc_5B7D5
; ���������������������������������������������������������������������������

loc_5B77C:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+DEj
		cmp	[bp+var_1C], 0FFF0h
		jnb	short loc_5B790
		mov	eax, [bp+var_1C]
		shr	eax, 2
		jmp	short loc_5B793
; ���������������������������������������������������������������������������

loc_5B790:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+88j
		mov	ax, 3FFCh

loc_5B793:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+92j
		mov	si, ax
		push	4
		mov	eax, [bp+var_14]
		add	eax, [bp+var_C]
		sub	eax, [bp+var_1C]
		push	eax
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], ax
		movzx	eax, si
		shl	eax, 2
		sub	[bp+var_1C], eax
		jmp	short loc_5B7D1
; ���������������������������������������������������������������������������

loc_5B7C1:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+D7j
		les	bx, [bp+var_18]
		mov	eax, [bp+var_10]
		mov	es:[bx], eax
		dec	si
		add	word ptr [bp+var_18], 4

loc_5B7D1:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+C3j
		or	si, si
		ja	short loc_5B7C1

loc_5B7D5:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+7Ej
		cmp	[bp+var_1C], 0
		ja	short loc_5B77C
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		cmp	eax, dword_709BF
		jz	short loc_5B7EE
		jmp	loc_5B74A
; ���������������������������������������������������������������������������

loc_5B7EE:				; CODE XREF: Registry_LookupForUIScreen_5B6FC+3Fj
					; Registry_LookupForUIScreen_5B6FC+4Bj ...
		pop	si
		leave

locret_5B7F0:
		retf
Registry_LookupForUIScreen_5B6FC	endp

seg126		ends
