seg082		segment	byte public 'CODE' use16
		assume cs:seg082
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_3A499
		push	word ptr [bp+0Ah]
		push	word ptr [si]
		call	VROOMM_StubThunk_6CACF
		add	sp, 4

loc_3A499:				; CODE XREF: seg082:001Aj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,577L — chargeur+constructeur du bloc dynamique IFF. enter_form('DYNM') puis seek_chunk
; d'UN sous-chunk : JDYN(struct 0xC5, avion) / MISS(0x3C) / GBMB(0x49) / DURD(0x47) /
; AGRV(0x3B) / SURF(0x29) / PARA(0x5B). Pour JDYN : malloc(0xC5), met en place des pointeurs
; intérieurs vers 2 sous-objets embarqués (A @+0x8E, B @+0xB1), construit A puis B via stubs
; VROOMM sub_6CACA/6CB0A/6CB73 -> variantes PlayerComponent (seg447-448). Les 'mov word ptr
; [si+X],NNNNh' ne sont PAS des patchs de coefficients : ce sont les tags de vtable /
; pointeurs de membre réécrits à chaque étape de la construction multi-base Borland C++. Le
; vrai chargement de champs est délégué à sub_6CBCE -> PlayerComponent_LoadFieldsWrapper_A5CEA
; -> LoadFieldsMassive_A5D18. Layout du chunk JDYN (28 champs) : voir analysis/DATA_MODEL.md
; §6.2.
; ==============================================================================================
JDYN_LoadChunkAndConstruct_3A49C	proc far		; CODE XREF: JDYN_LoadChunkWrapper_9D0C0+2FP
					; JDYN_LoadAngleAndChunk_9D189+1FP ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	di, [bp+arg_4]
		push	0
		push	large 'MNYD'    ; DYNM
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3A4BF
		jmp	loc_3A9D1
; ���������������������������������������������������������������������������

loc_3A4BF:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+1Ej
		push	0
		push	large 'NYDJ'    ; JDYN
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_3A4D7
		jmp	loc_3A63C
; ���������������������������������������������������������������������������

loc_3A4D7:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+36j
		mov	[bp+var_2], di
		push	0C5h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3A4EC
		jmp	loc_3A626
; ���������������������������������������������������������������������������

loc_3A4EC:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+4Bj
		add	ax, 8Eh	; '�'
		mov	[si], ax
		mov	ax, si
		add	ax, 0B1h ; '�'
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'
		mov	[si+0B1h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'
		mov	[si+1Eh], ax
		mov	ax, si
		add	ax, 0B1h ; '�'
		mov	[si+22h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'
		mov	[si+24h], ax
		mov	word ptr [si+8Ch], 0
		mov	word ptr [si+0AFh], 0
		mov	word ptr [si+8Eh], 223Ah
		mov	ax, si
		add	ax, 8Eh	; '�'
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+0B3h], 21CEh
		mov	bx, [si+0B1h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+0BDh], eax
		mov	[si+0B9h], eax
		mov	[si+0B5h], eax
		mov	ax, si
		add	ax, 0B5h ; '�'
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 20AEh
		mov	word ptr [bx], 20DEh
		push	si
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 21B2h
		push	si
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si]
		sub	word ptr [bx-2], 6Ah ; 'j'
		mov	word ptr [si+20h], 2042h
		mov	bx, [si+1Eh]
		mov	word ptr [bx], 205Eh
		mov	bx, [si]
		add	word ptr [bx-2], 6Ah ; 'j'
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	word ptr [si+26h], 1FB6h
		mov	bx, [si+24h]
		mov	word ptr [bx], 1FD6h
		mov	bx, [si+22h]
		mov	word ptr [bx+2], 2026h
		mov	bx, [si]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	word ptr [si+2], 228Ah
		mov	word ptr [si+20h], 22D6h
		mov	word ptr [si+26h], 22F2h
		mov	bx, [si]
		mov	word ptr [bx], 2312h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 2362h
		push	[bp+var_2]
		push	si
		call	VROOMM_StubThunk_6CBCE
		add	sp, 4
		mov	ax, si
		jmp	short loc_3A628
; ���������������������������������������������������������������������������

loc_3A626:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+4Dj
		mov	ax, si

loc_3A628:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+188j
		mov	si, ax
		or	si, si
		jz	short loc_3A631
		jmp	loc_3A9B8
; ���������������������������������������������������������������������������

loc_3A631:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+190j
					; JDYN_LoadChunkAndConstruct_3A49C+1C4j ...
		mov	ax, si

loc_3A633:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C:loc_3A9BAj
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		jmp	loc_3A9C9
; ���������������������������������������������������������������������������

loc_3A63C:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+38j
		push	0
		push	large 'SSIM'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_3A68E
		mov	[bp+var_4], di
		push	3Ch ; '<'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3A631
		mov	word ptr [si], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1F66h
		mov	word ptr [si+35h], 0
		mov	word ptr [si+37h], 0
		push	[bp+var_4]
		push	si
		call	VROOMM_StubThunk_6C553

loc_3A684:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+30Bj
					; JDYN_LoadChunkAndConstruct_3A49C+402j
		add	sp, 4
		mov	ax, si
		jmp	loc_3A9BA
; ���������������������������������������������������������������������������
		jmp	short loc_3A631
; ���������������������������������������������������������������������������

loc_3A68E:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+1B3j
		push	0
		push	large 'BMBG'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_3A6A6
		jmp	loc_3A761
; ���������������������������������������������������������������������������

loc_3A6A6:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+205j
		mov	[bp+var_6], di
		push	49h ; 'I'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3A6BA
		jmp	loc_3A750
; ���������������������������������������������������������������������������

loc_3A6BA:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+219j
		add	ax, 28h	; '('
		mov	[si], ax
		mov	ax, si
		add	ax, 28h	; '('
		mov	[si+4],	ax
		mov	word ptr [si+26h], 0
		mov	word ptr [si+28h], 223Ah
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		sub	word ptr [bx-2], 14h
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 14h
		mov	word ptr [si+6], 21CEh
		mov	bx, [si+4]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	word ptr [si+2], 1E56h
		mov	word ptr [si+6], 1E72h
		mov	bx, [si]
		mov	word ptr [bx], 1E8Eh
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1EDEh
		mov	word ptr [si+6], 1EFAh
		mov	word ptr [bx], 1F16h
		mov	word ptr [si+20h], 0
		mov	word ptr [si+22h], 0
		push	[bp+var_6]
		push	si
		call	VROOMM_StubThunk_6C4A2
		add	sp, 4
		mov	ax, si
		jmp	short loc_3A752
; ���������������������������������������������������������������������������

loc_3A750:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+21Bj
		mov	ax, si

loc_3A752:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+2B2j
		mov	si, ax
		or	si, si
		jnz	short loc_3A75B
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A75B:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+2BAj
		jmp	loc_3A9B8
; ���������������������������������������������������������������������������
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A761:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+207j
		push	0
		push	large 'DRUD'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_3A7AD
		mov	[bp+var_8], di
		push	47h ; 'G'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3A78A
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A78A:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+2E9j
		mov	word ptr [si], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1E06h
		mov	word ptr [si+45h], 0
		push	[bp+var_8]
		push	si
		call	VROOMM_StubThunk_6C4D9
		jmp	loc_3A684
; ���������������������������������������������������������������������������
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A7AD:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+2D8j
		push	0
		push	large 'VRGA'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_3A7C5
		jmp	loc_3A85D
; ���������������������������������������������������������������������������

loc_3A7C5:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+324j
		mov	[bp+var_A], di
		push	3Bh ; ';'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3A84C
		add	ax, 1Ah
		mov	[si], ax
		mov	ax, si
		add	ax, 1Ah
		mov	[si+4],	ax
		mov	word ptr [si+18h], 0
		mov	word ptr [si+1Ah], 223Ah
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 14h
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 14h
		mov	word ptr [si+6], 21CEh
		mov	bx, [si+4]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	word ptr [si+2], 1E56h
		mov	word ptr [si+6], 1E72h
		mov	bx, [si]
		mov	word ptr [bx], 1E8Eh
		push	[bp+var_A]
		push	si
		call	VROOMM_StubThunk_6CB2D
		add	sp, 4
		mov	ax, si
		jmp	short loc_3A84E
; ���������������������������������������������������������������������������

loc_3A84C:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+338j
		mov	ax, si

loc_3A84E:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+3AEj
		mov	si, ax
		or	si, si
		jnz	short loc_3A857
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A857:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+3B6j
		jmp	loc_3A9B8
; ���������������������������������������������������������������������������
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A85D:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+326j
		push	0
		push	large 'FRUS'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_3A8A4

loc_3A872:
		mov	[bp+var_C], di

loc_3A875:
		push	29h ; ')'
		call	CRT_Malloc16_Retry

loc_3A87C:
		pop	cx

loc_3A87D:
		mov	si, ax

loc_3A87F:
		or	ax, ax

loc_3A881:
		jnz	short loc_3A886

loc_3A883:
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A886:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C:loc_3A881j
		mov	word ptr [si], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1DB6h
		push	[bp+var_C]
		push	si
		call	VROOMM_StubThunk_6C625
		jmp	loc_3A684
; ���������������������������������������������������������������������������
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A8A4:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+3D4j
		push	0
		push	large 'ARAP'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_3A8BC
		jmp	loc_3A9C0
; ���������������������������������������������������������������������������

loc_3A8BC:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+41Bj
		mov	[bp+var_E], di
		push	5Bh ; '['
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3A8D0
		jmp	loc_3A9AD
; ���������������������������������������������������������������������������

loc_3A8D0:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+42Fj
		add	ax, 24h	; '$'
		mov	[si], ax
		mov	ax, si
		add	ax, 24h	; '$'
		mov	[si+4],	ax
		mov	ax, si
		add	ax, 47h	; 'G'
		mov	[si+14h], ax
		mov	ax, si
		add	ax, 24h	; '$'
		mov	[si+47h], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+45h], 0
		mov	word ptr [si+24h], 223Ah
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+49h], 21CEh
		mov	bx, [si+47h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+53h], eax
		mov	[si+4Fh], eax
		mov	[si+4Bh], eax
		mov	ax, si
		add	ax, 4Bh	; 'K'
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 1Eh
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 20AEh
		mov	word ptr [bx], 20DEh
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [si+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [si+14h]

loc_3A974:
		mov	word ptr [bx+2], 21B2h
		mov	ax, si
		add	ax, 4
		push	ax

loc_3A97F:
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	word ptr [si+2], 1CFAh
		mov	word ptr [si+6], 1D16h
		mov	bx, [si]
		mov	word ptr [bx], 1D4Ah
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 1D9Ah
		push	[bp+var_E]
		push	si
		call	VROOMM_StubThunk_6CD04
		add	sp, 4
		mov	ax, si
		jmp	short loc_3A9AF
; ���������������������������������������������������������������������������

loc_3A9AD:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+431j
		mov	ax, si

loc_3A9AF:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+50Fj
		mov	si, ax
		or	si, si
		jnz	short loc_3A9B8
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A9B8:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+192j
					; JDYN_LoadChunkAndConstruct_3A49C:loc_3A75Bj	...
		mov	ax, [si]

loc_3A9BA:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+1EDj
		jmp	loc_3A633
; ���������������������������������������������������������������������������
		jmp	loc_3A631
; ���������������������������������������������������������������������������

loc_3A9C0:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+41Dj
		push	0C010h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_3A9C9:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+19Dj
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		jmp	short loc_3A9D9
; ���������������������������������������������������������������������������

loc_3A9D1:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+20j
		push	0C011h
		call	VROOMM_StubThunk_6B70F

loc_3A9D9:				; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+533j
		pop	cx
		pop	di
		pop	si
		leave
		retf
JDYN_LoadChunkAndConstruct_3A49C	endp

; ���������������������������������������������������������������������������

loc_3A9DE:				; CODE XREF: seg082:0619j seg082:06BAj ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+0Ch]
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A9F0:				; CODE XREF: seg082:05EBj seg082:075Bj ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3AA43
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 0Eh
		mov	bx, [si]
		sub	word ptr [bx-2], 1Eh
		add	word ptr [bx-2], 1Eh
		test	di, 2
		jz	short loc_3AA34
		sub	word ptr [bx-2], 0FFC7h
		add	word ptr [bx-2], 0FFC7h
		push	0
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3AA34:				; CODE XREF: seg082:05A8j
		test	di, 1
		jz	short loc_3AA43
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3AA43:				; CODE XREF: seg082:058Dj seg082:05C8j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3AA47:				; DATA XREF: seg339:off_6EE62o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB9h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3A9F0
; ���������������������������������������������������������������������������

loc_3AA5E:				; DATA XREF: seg339:1DAEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax

loc_3AA70:
		jmp	far ptr	loc_47E64
; ���������������������������������������������������������������������������

loc_3AA75:				; DATA XREF: seg339:1DAAo
		mov	bx, sp
		mov	bx, ss:[bx+4]

loc_3AA7B:
		mov	ax, [bx-2]
		add	ax, 0FFB9h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3A9DE
; ���������������������������������������������������������������������������

loc_3AA8C:				; DATA XREF: seg339:1DA6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB9h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	FlightPhysics_TickCandidate_4F4EE
; ���������������������������������������������������������������������������

loc_3AAA3:				; DATA XREF: seg339:1DA2o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB9h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	Ctor_CompositeObjectC_4F7D6
; ���������������������������������������������������������������������������

loc_3AABA:				; DATA XREF: seg339:off_6EE4Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB9h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	Ctor_CompositeObjectB_4F69E
; ���������������������������������������������������������������������������

loc_3AAD1:				; DATA XREF: seg339:off_6EE4Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB9h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	Ctor_CompositeObjectA_4F5A4
; ���������������������������������������������������������������������������

loc_3AAE8:				; DATA XREF: seg339:off_6EE46o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47E6C
; ���������������������������������������������������������������������������

loc_3AAFF:				; DATA XREF: seg339:off_6EE3Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47E64
; ���������������������������������������������������������������������������

loc_3AB16:				; DATA XREF: seg339:off_6EE3Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3A9DE
; ���������������������������������������������������������������������������

loc_3AB2D:				; DATA XREF: seg339:off_6EE36o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	FlightPhysics_TickCandidate_4F4EE
; ���������������������������������������������������������������������������

loc_3AB44:				; DATA XREF: seg339:1D7Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46BE6
; ���������������������������������������������������������������������������

loc_3AB5B:				; DATA XREF: seg339:1D7Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46BC0
; ���������������������������������������������������������������������������

loc_3AB72:				; DATA XREF: seg339:1D76o
		mov	bx, sp
		mov	bx, ss:[bx+8]

loc_3AB78:
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46B74
; ���������������������������������������������������������������������������

loc_3AB89:				; DATA XREF: seg339:off_6EE22o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46C9F
; ���������������������������������������������������������������������������

loc_3ABA0:				; DATA XREF: seg339:1D6Eo
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46BF3
; ���������������������������������������������������������������������������

loc_3ABB7:				; DATA XREF: seg339:off_6EE06o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3A9F0
; ���������������������������������������������������������������������������

loc_3ABCE:				; DATA XREF: seg339:off_6EE02o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax

loc_3ABE0:
		jmp	far ptr	Ctor_CompositeObjectC_4F7D6
; ���������������������������������������������������������������������������

loc_3ABE5:				; DATA XREF: seg339:off_6EDFEo
		mov	bx, sp
		mov	bx, ss:[bx+4]

loc_3ABEB:
		mov	ax, [bx-2]

loc_3ABEE:
		add	ax, 0FFDCh

loc_3ABF1:
		mov	bx, sp

loc_3ABF3:
		add	ss:[bx+4], ax

loc_3ABF7:
		jmp	far ptr	Ctor_CompositeObjectB_4F69E
; ���������������������������������������������������������������������������

loc_3ABFC:				; DATA XREF: seg339:1D4Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	Ctor_CompositeObjectA_4F5A4
; ���������������������������������������������������������������������������

loc_3AC13:				; DATA XREF: seg339:1D42o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_3A9F0
; ���������������������������������������������������������������������������

loc_3AC1F:				; DATA XREF: seg339:1D3Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_3A9DE
; ���������������������������������������������������������������������������

loc_3AC2B:				; DATA XREF: seg339:off_6EDE6o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	FlightPhysics_TickCandidate_4F4EE
; ���������������������������������������������������������������������������

loc_3AC37:				; DATA XREF: seg339:1D1Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	Ctor_CompositeObjectC_4F7D6
; ���������������������������������������������������������������������������

loc_3AC43:				; DATA XREF: seg339:1D1Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	Ctor_CompositeObjectB_4F69E
; ���������������������������������������������������������������������������

loc_3AC4F:				; DATA XREF: seg339:1D16o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	Ctor_CompositeObjectA_4F5A4
; ���������������������������������������������������������������������������

loc_3AC5B:				; DATA XREF: seg339:off_6EE72o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3AC86
		mov	word ptr [si], 1DB6h
		push	0
		push	si

loc_3AC71:
		call	VROOMM_StubThunk_6CAD9

loc_3AC76:
		add	sp, 4

loc_3AC79:
		test	di, 1
		jz	short loc_3AC86
		push	si

loc_3AC80:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_3AC86:				; CODE XREF: seg082:07F8j seg082:080Dj
		pop	di

loc_3AC87:
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3AC8A:				; DATA XREF: seg339:off_6EEC2o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3ACBF
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		test	di, 1
		jz	short loc_3ACBF
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3ACBF:				; CODE XREF: seg082:0827j seg082:0844j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3ACC3:				; CODE XREF: seg082:08F0j seg082:0941j
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3AD03
		mov	bx, [si]
		sub	word ptr [bx-2], 14h
		add	word ptr [bx-2], 14h
		test	di, 2
		jz	short loc_3ACF4
		push	0
		mov	ax, si

loc_3ACE6:
		add	ax, 1Ah
		push	ax
		call	VROOMM_StubThunk_6CAD9

loc_3ACEF:
		add	sp, 4
		jmp	short $+2

loc_3ACF4:				; CODE XREF: seg082:0870j
		test	di, 1
		jz	short loc_3AD03
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3AD03:				; CODE XREF: seg082:0860j seg082:0888j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3AD07:				; DATA XREF: seg339:1ED2o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_472C2
; ���������������������������������������������������������������������������

loc_3AD1E:				; DATA XREF: seg339:1ECEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_472B0
; ���������������������������������������������������������������������������

loc_3AD35:				; DATA XREF: seg339:1ECAo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	FlightControl_ComputeAngularAccel
; ���������������������������������������������������������������������������

loc_3AD4C:				; DATA XREF: seg339:off_6EF4Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3ACC3
; ���������������������������������������������������������������������������

loc_3AD63:				; DATA XREF: seg339:off_6EF46o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp

loc_3AD71:
		add	ss:[bx+4], ax

loc_3AD75:
		jmp	VROOMM_StubThunk_6CB3C
; ���������������������������������������������������������������������������

loc_3AD7A:				; DATA XREF: seg339:off_6EF42o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB37
; ���������������������������������������������������������������������������

loc_3AD91:				; DATA XREF: seg339:off_6EF3Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB32
; ���������������������������������������������������������������������������

loc_3ADA8:				; DATA XREF: seg339:1E8Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_3ACC3
; ���������������������������������������������������������������������������

loc_3ADB4:				; DATA XREF: seg339:off_6EF36o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	loc_472C2
; ���������������������������������������������������������������������������

loc_3ADC0:				; DATA XREF: seg339:1E82o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	loc_472B0
; ���������������������������������������������������������������������������

loc_3ADCC:				; DATA XREF: seg339:1E7Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	FlightControl_ComputeAngularAccel
; ���������������������������������������������������������������������������

loc_3ADD8:				; DATA XREF: seg339:1E7Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh

loc_3ADDF:
		jmp	VROOMM_StubThunk_6CB3C
; ���������������������������������������������������������������������������

loc_3ADE4:				; DATA XREF: seg339:off_6EF26o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh

loc_3ADEB:
		jmp	VROOMM_StubThunk_6CB37
; ���������������������������������������������������������������������������

loc_3ADF0:				; DATA XREF: seg339:off_6EF22o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	VROOMM_StubThunk_6CB32
; ���������������������������������������������������������������������������

loc_3ADFC:				; CODE XREF: seg082:0A49j seg082:0A9Aj
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3AE5C
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		sub	word ptr [bx-2], 14h
		add	word ptr [bx-2], 14h
		add	word ptr [bx-2], 0Eh
		test	di, 2
		jz	short loc_3AE4D
		push	0
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3AE4D:				; CODE XREF: seg082:09C9j
		test	di, 1
		jz	short loc_3AE5C
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3AE5C:				; CODE XREF: seg082:0999j seg082:09E1j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3AE60:				; DATA XREF: seg339:off_6F00Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFD8h
		mov	bx, sp

loc_3AE6E:
		add	ss:[bx+4], ax
		jmp	far ptr	loc_472C2
; ���������������������������������������������������������������������������

loc_3AE77:				; DATA XREF: seg339:off_6F006o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFD8h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_4200C
; ���������������������������������������������������������������������������

loc_3AE8E:				; DATA XREF: seg339:off_6F002o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFD8h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	GuidedBombBody_GuidanceTick_41F2B
; ���������������������������������������������������������������������������

loc_3AEA5:				; DATA XREF: seg339:off_6EFD2o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFD8h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3ADFC
; ���������������������������������������������������������������������������

loc_3AEBC:				; DATA XREF: seg339:off_6EFCEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFD8h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6C4C5
; ���������������������������������������������������������������������������

loc_3AED3:				; DATA XREF: seg339:1F1Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFD8h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6C4C0
; ���������������������������������������������������������������������������

loc_3AEEA:				; DATA XREF: seg339:off_6EFC6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFD8h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6C4BB
; ���������������������������������������������������������������������������

loc_3AF01:				; DATA XREF: seg339:1F12o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_3ADFC
; ���������������������������������������������������������������������������

loc_3AF0D:				; DATA XREF: seg339:1F0Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	loc_472C2
; ���������������������������������������������������������������������������

loc_3AF19:				; DATA XREF: seg339:1F0Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	loc_4200C
; ���������������������������������������������������������������������������

loc_3AF25:				; DATA XREF: seg339:off_6EFB6o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	far ptr	GuidedBombBody_GuidanceTick_41F2B
; ���������������������������������������������������������������������������

loc_3AF31:				; DATA XREF: seg339:off_6EFB2o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	VROOMM_StubThunk_6C4C5
; ���������������������������������������������������������������������������

loc_3AF3D:				; DATA XREF: seg339:1EFEo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	VROOMM_StubThunk_6C4C0
; ���������������������������������������������������������������������������

loc_3AF49:				; DATA XREF: seg339:off_6EFAAo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	VROOMM_StubThunk_6C4BB
; ���������������������������������������������������������������������������

loc_3AF55:				; DATA XREF: seg339:off_6F022o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3AF96
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si

loc_3AF72:
		add	ax, 35h	; '5'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6CAD9

loc_3AF84:
		add	sp, 4
		test	di, 1
		jz	short loc_3AF96
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3AF96:				; CODE XREF: seg082:0AF2j seg082:0B1Bj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3AF9A:				; CODE XREF: seg082:0B83j seg082:0C80j
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3AFDB
		test	di, 2
		jz	short loc_3AFCC
		mov	bx, [si+2]
		sub	word ptr [bx-2], 0FFC7h
		add	word ptr [bx-2], 0FFC7h
		push	0
		mov	ax, si
		add	ax, 13h
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3AFCC:				; CODE XREF: seg082:0B3Dj
		test	di, 1
		jz	short loc_3AFDB
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3AFDB:				; CODE XREF: seg082:0B37j seg082:0B60j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3AFDF:				; DATA XREF: seg339:203Eo
		mov	bx, sp

loc_3AFE1:
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]

loc_3AFE8:
		add	ax, 0FFCAh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop

loc_3AFF2:
		nop
		jmp	loc_3AF9A
; ���������������������������������������������������������������������������

loc_3AFF6:				; DATA XREF: seg339:203Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFCAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47857
; ���������������������������������������������������������������������������

loc_3B00D:				; DATA XREF: seg339:off_6F0E6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFCAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_472FD
; ���������������������������������������������������������������������������

loc_3B024:				; DATA XREF: seg339:off_6F0E2o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFCAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_472CA
; ���������������������������������������������������������������������������

loc_3B03B:				; DATA XREF: seg339:off_6F0DEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFCAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB5F
; ���������������������������������������������������������������������������

loc_3B052:				; DATA XREF: seg339:off_6F0DAo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFCAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB5A
; ���������������������������������������������������������������������������

loc_3B069:				; DATA XREF: seg339:off_6F0D6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]

loc_3B072:
		add	ax, 0FFCAh
		mov	bx, sp

loc_3B077:
		add	ss:[bx+4], ax

loc_3B07B:
		jmp	VROOMM_StubThunk_6CB55
; ���������������������������������������������������������������������������

loc_3B080:				; DATA XREF: seg339:off_6F0D2o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_4785F
; ���������������������������������������������������������������������������

loc_3B097:				; DATA XREF: seg339:off_6F0CAo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47857
; ���������������������������������������������������������������������������

loc_3B0AE:				; DATA XREF: seg339:2016o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_472FD
; ���������������������������������������������������������������������������

loc_3B0C5:				; DATA XREF: seg339:off_6F0C2o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_472CA
; ���������������������������������������������������������������������������

loc_3B0DC:				; DATA XREF: seg339:off_6F092o
		mov	bx, sp

loc_3B0DE:
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]

loc_3B0E5:
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3AF9A
; ���������������������������������������������������������������������������

loc_3B0F3:				; DATA XREF: seg339:1FDEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB5F
; ���������������������������������������������������������������������������

loc_3B10A:				; DATA XREF: seg339:1FDAo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB5A
; ���������������������������������������������������������������������������

loc_3B121:				; DATA XREF: seg339:1FD6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB55
; ���������������������������������������������������������������������������

loc_3B138:				; CODE XREF: seg082:0D2Dj
					; DATA XREF: seg339:off_6F10Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3B16E
		test	di, 2
		jz	short loc_3B15F
		push	0
		mov	ax, si
		add	ax, 6
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3B15F:				; CODE XREF: seg082:0CDBj
		test	di, 1
		jz	short loc_3B16E
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3B16E:				; CODE XREF: seg082:0CD5j seg082:0CF3j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3B172:				; DATA XREF: seg339:off_6F152o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFFAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47209
; ���������������������������������������������������������������������������

loc_3B189:				; DATA XREF: seg339:off_6F11Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFFAh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3B138
; ���������������������������������������������������������������������������

loc_3B1A0:				; CODE XREF: seg082:0E08j
					; DATA XREF: seg339:20DAo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3B1D6
		test	di, 2
		jz	short loc_3B1C7
		push	0
		mov	ax, si
		add	ax, 12h
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3B1C7:				; CODE XREF: seg082:0D43j
		test	di, 1
		jz	short loc_3B1D6
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3B1D6:				; CODE XREF: seg082:0D3Dj seg082:0D5Bj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3B1DA:				; DATA XREF: seg339:off_6F1D2o
		mov	bx, sp
		mov	bx, ss:[bx+4]

loc_3B1E0:
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46B6C
; ���������������������������������������������������������������������������

loc_3B1F1:				; DATA XREF: seg339:2112o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46BE6
; ���������������������������������������������������������������������������

loc_3B208:				; DATA XREF: seg339:210Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46BC0
; ���������������������������������������������������������������������������

loc_3B21F:				; DATA XREF: seg339:210Ao
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46B74
; ���������������������������������������������������������������������������

loc_3B236:				; DATA XREF: seg339:off_6F1B6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46C9F
; ���������������������������������������������������������������������������

loc_3B24D:				; DATA XREF: seg339:off_6F1B2o
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46BF3
; ���������������������������������������������������������������������������

loc_3B264:				; DATA XREF: seg339:off_6F19Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3B1A0
; ���������������������������������������������������������������������������

loc_3B27B:				; CODE XREF: seg082:0E6Bj seg082:0FDBj
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3B2C3
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 0Eh
		test	di, 2
		jz	short loc_3B2B4
		sub	word ptr [bx-2], 0FFC7h
		add	word ptr [bx-2], 0FFC7h
		push	0
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3B2B4:				; CODE XREF: seg082:0E28j
		test	di, 1
		jz	short loc_3B2C3
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3B2C3:				; CODE XREF: seg082:0E18j seg082:0E48j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3B2C7:				; DATA XREF: seg339:21CAo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3B27B
; ���������������������������������������������������������������������������

loc_3B2DE:				; DATA XREF: seg339:off_6F276o
		mov	bx, sp

loc_3B2E0:
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax

loc_3B2F0:
		jmp	far ptr	loc_47E64
; ���������������������������������������������������������������������������

loc_3B2F5:				; DATA XREF: seg339:off_6F272o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_478B3
; ���������������������������������������������������������������������������

loc_3B30C:				; DATA XREF: seg339:21BEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47867
; ���������������������������������������������������������������������������

loc_3B323:				; DATA XREF: seg339:off_6F26Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB87
; ���������������������������������������������������������������������������

loc_3B33A:				; DATA XREF: seg339:off_6F266o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB82
; ���������������������������������������������������������������������������

loc_3B351:				; DATA XREF: seg339:off_6F262o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBDh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB7D
; ���������������������������������������������������������������������������

loc_3B368:				; DATA XREF: seg339:off_6F25Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]

loc_3B371:
		add	ax, 0FFE0h
		mov	bx, sp

loc_3B376:
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47E6C
; ���������������������������������������������������������������������������

loc_3B37F:				; DATA XREF: seg339:21A6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47E64
; ���������������������������������������������������������������������������

loc_3B396:				; DATA XREF: seg339:off_6F252o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_478B3
; ���������������������������������������������������������������������������

loc_3B3AD:				; DATA XREF: seg339:219Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_47867
; ���������������������������������������������������������������������������

loc_3B3C4:				; DATA XREF: seg339:off_6F246o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46BE6
; ���������������������������������������������������������������������������

loc_3B3DB:				; DATA XREF: seg339:off_6F242o
		mov	bx, sp
		mov	bx, ss:[bx+4]

loc_3B3E1:
		mov	ax, [bx-2]
		add	ax, 0FFE0h

loc_3B3E7:
		mov	bx, sp
		add	ss:[bx+4], ax

loc_3B3ED:
		jmp	far ptr	loc_46BC0
; ���������������������������������������������������������������������������

loc_3B3F2:				; DATA XREF: seg339:off_6F23Eo
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46B74
; ���������������������������������������������������������������������������

loc_3B409:				; DATA XREF: seg339:off_6F23Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46C9F
; ���������������������������������������������������������������������������

loc_3B420:				; DATA XREF: seg339:off_6F236o
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46BF3
; ���������������������������������������������������������������������������

loc_3B437:				; DATA XREF: seg339:off_6F21Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3B27B
; ���������������������������������������������������������������������������

loc_3B44E:				; DATA XREF: seg339:off_6F21Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB87
; ���������������������������������������������������������������������������

loc_3B465:				; DATA XREF: seg339:off_6F216o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB82
; ���������������������������������������������������������������������������

loc_3B47C:				; DATA XREF: seg339:off_6F212o
		mov	bx, sp

loc_3B47E:
		mov	bx, ss:[bx+4]

loc_3B482:
		mov	ax, [bx-2]
		add	ax, 0FFE0h

loc_3B488:
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CB7D
; ���������������������������������������������������������������������������

loc_3B493:				; CODE XREF: seg082:1088j
					; DATA XREF: seg339:off_6F296o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3B4C9
		test	di, 2
		jz	short loc_3B4BA
		push	0
		mov	ax, si
		add	ax, 16h
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3B4BA:				; CODE XREF: seg082:1036j
		test	di, 1
		jz	short loc_3B4C9
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3B4C9:				; CODE XREF: seg082:1030j seg082:104Ej
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3B4CD:				; DATA XREF: seg339:off_6F2DEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_470AC
; ���������������������������������������������������������������������������

loc_3B4E4:				; DATA XREF: seg339:off_6F2A6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEAh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3B493
; ���������������������������������������������������������������������������

loc_3B4FB:				; CODE XREF: seg082:1127j seg082:130Aj ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3B57F
		mov	bx, [si]
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si]
		sub	word ptr [bx-2], 6Ah ; 'j'
		add	word ptr [bx-2], 6Ah ; 'j'
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 6Eh ; 'n'
		test	di, 2
		jz	short loc_3B570
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		add	word ptr [bx-2], 0FFC7h
		push	0
		mov	ax, si
		add	ax, 8Eh	; '�'
		push	ax
		call	VROOMM_StubThunk_6CAD9
		add	sp, 4
		jmp	short $+2

loc_3B570:				; CODE XREF: seg082:10E2j
		test	di, 1
		jz	short loc_3B57F
		push	si

loc_3B577:
		call	CRT_FreeNear_Wrap

loc_3B57C:
		pop	cx
		jmp	short $+2

loc_3B57F:				; CODE XREF: seg082:1098j seg082:1104j
		pop	di
		pop	si
		pop	bp

locret_3B582:
		retf
; ���������������������������������������������������������������������������

loc_3B583:				; DATA XREF: seg339:237Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF4Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3B4FB
; ���������������������������������������������������������������������������

loc_3B59A:				; DATA XREF: seg339:2376o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF4Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_498AD
; ���������������������������������������������������������������������������

loc_3B5B1:				; DATA XREF: seg339:2372o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF4Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	PhysicsTicks
; ���������������������������������������������������������������������������

loc_3B5C8:				; DATA XREF: seg339:off_6F41Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF4Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_4A825
; ���������������������������������������������������������������������������

loc_3B5DF:				; DATA XREF: seg339:236Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF4Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CBDD
; ���������������������������������������������������������������������������

loc_3B5F6:				; DATA XREF: seg339:off_6F416o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF4Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CBD8
; ���������������������������������������������������������������������������

loc_3B60D:				; DATA XREF: seg339:off_6F412o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF4Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CBD3
; ���������������������������������������������������������������������������

loc_3B624:				; DATA XREF: seg339:off_6F40Eo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CBE2
; ���������������������������������������������������������������������������

loc_3B63B:				; DATA XREF: seg339:off_6F40Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_4B093
; ���������������������������������������������������������������������������

loc_3B652:				; DATA XREF: seg339:off_6F406o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_498AD
; ���������������������������������������������������������������������������

loc_3B669:				; DATA XREF: seg339:off_6F402o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]

loc_3B672:
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax

loc_3B67B:
		jmp	far ptr	PhysicsTicks
; ���������������������������������������������������������������������������

loc_3B680:				; DATA XREF: seg339:off_6F3FEo
		mov	bx, sp

loc_3B682:
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_4A825
; ���������������������������������������������������������������������������

loc_3B697:				; DATA XREF: seg339:off_6F3FAo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h

loc_3B6A3:
		mov	bx, sp

loc_3B6A5:
		add	ss:[bx+4], ax

loc_3B6A9:
		jmp	far ptr	loc_491B7
; ���������������������������������������������������������������������������

loc_3B6AE:				; DATA XREF: seg339:off_6F3F6o
		mov	bx, sp

loc_3B6B0:
		mov	bx, ss:[bx+4]

loc_3B6B4:
		mov	ax, [bx-2]

loc_3B6B7:
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46BE6
; ���������������������������������������������������������������������������

loc_3B6C5:				; DATA XREF: seg339:off_6F3F2o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46BC0
; ���������������������������������������������������������������������������

loc_3B6DC:				; DATA XREF: seg339:233Eo
		mov	bx, sp

loc_3B6DE:
		mov	bx, ss:[bx+8]

loc_3B6E2:
		mov	ax, [bx-2]

loc_3B6E5:
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46B74
; ���������������������������������������������������������������������������

loc_3B6F3:				; DATA XREF: seg339:233Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_46C9F
; ���������������������������������������������������������������������������

loc_3B70A:				; DATA XREF: seg339:2336o
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_46BF3
; ���������������������������������������������������������������������������

loc_3B721:				; DATA XREF: seg339:off_6F3DAo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_4AF1C
; ���������������������������������������������������������������������������

loc_3B738:				; DATA XREF: seg339:off_6F3D6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	far ptr	loc_49050
; ���������������������������������������������������������������������������

loc_3B74F:				; DATA XREF: seg339:2322o
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	far ptr	loc_47FF8
; ���������������������������������������������������������������������������

loc_3B766:				; DATA XREF: seg339:off_6F3CEo
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	loc_3B4FB
; ���������������������������������������������������������������������������

loc_3B77D:				; DATA XREF: seg339:231Ao
		mov	bx, sp
		mov	bx, ss:[bx+4]

loc_3B783:
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CBDD
; ���������������������������������������������������������������������������

loc_3B794:				; DATA XREF: seg339:off_6F3C6o
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax

loc_3B7A6:
		jmp	VROOMM_StubThunk_6CBD8
; ���������������������������������������������������������������������������

loc_3B7AB:				; DATA XREF: seg339:off_6F3C2o
		mov	bx, sp

loc_3B7AD:
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF72h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	VROOMM_StubThunk_6CBD3
; ���������������������������������������������������������������������������

loc_3B7C2:				; DATA XREF: seg339:off_6F3BEo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		nop
		nop
		jmp	loc_3B4FB
; ���������������������������������������������������������������������������

loc_3B7CE:				; DATA XREF: seg339:off_6F3BAo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	VROOMM_StubThunk_6CBE2
; ���������������������������������������������������������������������������

loc_3B7DA:				; DATA XREF: seg339:off_6F3B6o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	far ptr	loc_498AD
; ���������������������������������������������������������������������������

loc_3B7E6:				; DATA XREF: seg339:off_6F3B2o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh

loc_3B7ED:
		jmp	far ptr	PhysicsTicks
; ���������������������������������������������������������������������������

loc_3B7F2:				; DATA XREF: seg339:22FEo
		mov	bx, sp

loc_3B7F4:
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	far ptr	loc_4A825
; ���������������������������������������������������������������������������

loc_3B7FE:				; DATA XREF: seg339:off_6F3AAo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	VROOMM_StubThunk_6CBDD
; ���������������������������������������������������������������������������

loc_3B80A:				; DATA XREF: seg339:off_6F3A6o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	VROOMM_StubThunk_6CBD8
; ���������������������������������������������������������������������������

loc_3B816:				; DATA XREF: seg339:off_6F3A2o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	VROOMM_StubThunk_6CBD3
; ���������������������������������������������������������������������������

loc_3B822:				; DATA XREF: seg339:off_6F39Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		nop
		nop
		jmp	loc_3B4FB
; ���������������������������������������������������������������������������

loc_3B82E:				; DATA XREF: seg339:22EAo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	far ptr	loc_498AD
; ���������������������������������������������������������������������������

loc_3B83A:				; DATA XREF: seg339:off_6F396o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	far ptr	PhysicsTicks
; ���������������������������������������������������������������������������

loc_3B846:				; DATA XREF: seg339:22E2o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	far ptr	loc_4A825
; ���������������������������������������������������������������������������

loc_3B852:				; DATA XREF: seg339:off_6F38Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	VROOMM_StubThunk_6CBDD
; ���������������������������������������������������������������������������

loc_3B85E:				; DATA XREF: seg339:22DAo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	VROOMM_StubThunk_6CBD8
; ���������������������������������������������������������������������������

loc_3B86A:				; DATA XREF: seg339:off_6F386o
		mov	bx, sp

loc_3B86C:
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	VROOMM_StubThunk_6CBD3
seg082		ends
