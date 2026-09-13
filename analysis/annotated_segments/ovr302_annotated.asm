ovr302		segment	para public 'OVERLAY' use16
		assume cs:ovr302
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 147 lignes, NON DÉTAILLÉE — combine Particle_ListFreeAll et libération de blocs
; typés multiples — nettoyage complet du système de débris/particules.
; ==============================================================================================
Debris_ReleaseAllParticles_9B7E0	proc far		; CODE XREF: VROOMM_StubThunk_6C009J

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_9B7E1:
		mov	bp, sp

loc_9B7E3:
		sub	sp, 14h
		push	si

loc_9B7E7:
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_9B7F4
		jmp	loc_9B8DD
; ���������������������������������������������������������������������������

loc_9B7F4:				; CODE XREF: Debris_ReleaseAllParticles_9B7E0+Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 1B6Fh
		push	word ptr es:[bx+0Dh]
		call	CRT_FreeNear_Wrap
		pop	cx
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_9B83F

loc_9B811:
		push	large dword ptr	es:[bx+8]
		call	Particle_ListFreeAll
		add	sp, 4
		les	bx, [bp+arg_0]

loc_9B821:
		mov	eax, es:[bx+8]

loc_9B826:
		mov	[bp+var_4], eax
		push	0
		push	2

loc_9B82E:
		lea	ax, [bp+var_4]
		push	ax

loc_9B832:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_9B83F:				; CODE XREF: Debris_ReleaseAllParticles_9B7E0+2Fj
		push	0
		push	2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+19h]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0
		push	2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+21h]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0
		push	2

loc_9B881:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]

loc_9B889:
		mov	[bp+var_10], eax
		lea	ax, [bp+var_10]
		push	ax

loc_9B891:
		push	5C44h

loc_9B894:
		call	Memory_TypedFree_5C7B6

loc_9B899:
		add	sp, 8
		les	bx, [bp+arg_0]

loc_9B89F:
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_9B8BC
		push	3
		push	large dword ptr	es:[bx+15h]

loc_9B8AE:
		les	bx, es:[bx+15h]

loc_9B8B2:
		mov	bx, es:[bx]
		call	dword ptr [bx]

loc_9B8B7:
		add	sp, 6

loc_9B8BA:
		jmp	short $+2

loc_9B8BC:				; CODE XREF: Debris_ReleaseAllParticles_9B7E0+C5j
		test	si, 1
		jz	short loc_9B8DD

loc_9B8C2:
		mov	eax, [bp+arg_0]

loc_9B8C6:
		mov	[bp+var_14], eax
		push	0
		push	2
		lea	ax, [bp+var_14]

loc_9B8D1:
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_9B8DD:				; CODE XREF: Debris_ReleaseAllParticles_9B7E0+11j
					; Debris_ReleaseAllParticles_9B7E0+E0j
		pop	si
		leave
		retf
Debris_ReleaseAllParticles_9B7E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 204 lignes, NON DÉTAILLÉE — combine allocation, String_ConstructEmpty,
; CRT_Msg_Sprintf1, Debris_LoadAndInstantiate — chargement et instanciation de débris depuis
; un enregistrement.
; ==============================================================================================
Debris_LoadAndSpawnFromRecord_9B8E0	proc far		; CODE XREF: VROOMM_StubThunk_6C00EJ

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_9B8E1:
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_9B8F2
		jmp	loc_9BA25
; ���������������������������������������������������������������������������

loc_9B8F2:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+Dj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[di+6],	eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Fh], 0
		jg	short loc_9B916

loc_9B913:
		jmp	loc_9BA25
; ���������������������������������������������������������������������������

loc_9B916:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+31j
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_9B920:
		or	ax, ax
		jz	short loc_9B93C
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+9], 0
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		mov	ax, si
		jmp	short loc_9B93E
; ���������������������������������������������������������������������������

loc_9B93C:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+42j
		mov	ax, si

loc_9B93E:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+5Aj
		mov	[di+1Eh], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		xor	si, si
		jmp	short loc_9B971
; ���������������������������������������������������������������������������

loc_9B954:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+94j
		les	bx, [bp+var_12]
		add	bx, si
		cmp	byte ptr es:[bx], 0
		jz	short loc_9B96C
		mov	bx, word ptr [bp+var_12]
		add	bx, si
		mov	al, es:[bx]
		mov	byte ptr [bp+si+var_E],	al
		jmp	short loc_9B970
; ���������������������������������������������������������������������������

loc_9B96C:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+7Dj
		mov	byte ptr [bp+si+var_E],	20h ; ' '

loc_9B970:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+8Aj
		inc	si

loc_9B971:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+72j
		cmp	si, 4
		jl	short loc_9B954
		push	di
		push	1B68h
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Msg_Sprintf1

loc_9B983:
		add	sp, 6
		push	8

loc_9B988:
		lea	ax, [bp+var_E]
		push	ax
		push	word ptr [di+1Eh]

loc_9B98F:
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_9B997:
		mov	bx, [di+1Eh]
		mov	byte ptr [bx+8], 0

loc_9B99E:
		les	bx, [bp+arg_0]

loc_9B9A1:
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_14], ax
		mov	[bp+var_16], 0
		jmp	short loc_9BA19
; ���������������������������������������������������������������������������

loc_9B9AF:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+143j
		mov	ax, [bp+var_14]

loc_9B9B2:
		mov	[bp+var_18], ds

loc_9B9B5:
		mov	[bp+var_1A], ax

loc_9B9B8:
		push	1
		push	1

loc_9B9BC:
		push	[bp+var_18]
		push	ax
		push	571Ch

loc_9B9C3:
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	si, ax
		mov	dx, [bp+var_14]

loc_9B9D0:
		add	dx, 9
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+12h], eax
		mov	eax, [bx+4]

loc_9B9E0:
		mov	[si+16h], eax

loc_9B9E4:
		mov	eax, [bx+8]
		mov	[si+1Ah], eax
		mov	ax, si
		add	ax, 12h
		push	si
		mov	bx, [si]

loc_9B9F4:
		call	dword ptr [bx+8]
		pop	cx
		mov	ax, [bp+var_14]
		add	ax, 15h
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		push	si
		push	di
		call	VROOMM_StubThunk_6BF6F
		add	sp, 4
		inc	[bp+var_16]
		add	[bp+var_14], 39h ; '9'

loc_9BA19:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+CDj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Fh]

loc_9BA20:
		cmp	ax, [bp+var_16]
		jg	short loc_9B9AF

loc_9BA25:				; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+Fj
					; Debris_LoadAndSpawnFromRecord_9B8E0:loc_9B913j
		pop	di
		pop	si
		leave
		retf
Debris_LoadAndSpawnFromRecord_9B8E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (26 lignes).
; ==============================================================================================
Debris_Helper3_9BA29	proc far		; CODE XREF: VROOMM_StubThunk_6BFFAJ Debris_LoadFieldMix_9BA85+25p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]

loc_9BA2F:
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+0Dh], 0
		mov	byte ptr es:[bx+2], 1
		mov	byte ptr es:[bx+3], 0
		mov	word ptr es:[bx+4], 0
		mov	word ptr es:[bx+6], 0
		mov	dword ptr es:[bx+15h], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	dword ptr es:[bx+19h], 0
		mov	dword ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+27h], 0
		pop	bp

locret_9BA84:
		retf
Debris_Helper3_9BA29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 420 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_SeekAndRead_64743/ReadFieldGroupB_64A54 répétés.
; ==============================================================================================
Debris_LoadFieldMix_9BA85	proc far		; CODE XREF: VROOMM_StubThunk_6BFFFJ

var_2A		= word ptr -2Ah
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_9BA88:
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_4]

loc_9BA90:
		mov	ax, 1209h
		mov	bx, 5650h

loc_9BA96:
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl

loc_9BAA0:
		mov	byte_70447, 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr Debris_Helper3_9BA29
		add	sp, 4

loc_9BAB0:
		push	1
		push	0
		push	2
		push	large 17h
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_9BB0B

loc_9BACE:
		mov	[bp+var_8], 5DC00h

loc_9BAD6:
		mov	eax, [bp+var_8]
		les	bx, [bp+var_4]

loc_9BADD:
		mov	es:[bx+10h], eax

loc_9BAE2:
		xor	eax, eax

loc_9BAE5:
		mov	es:[bx+4], eax

loc_9BAEA:
		mov	es:[bx], eax
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		mov	word ptr es:[bx+14h], 0
		mov	byte ptr es:[bx+16h], 0
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_9BB11
; ���������������������������������������������������������������������������

loc_9BB0B:				; CODE XREF: Debris_LoadFieldMix_9BA85+47j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_9BB11:				; CODE XREF: Debris_LoadFieldMix_9BA85+84j
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		push	0
		push	large 474D4144h

loc_9BB24:
		push	si

loc_9BB25:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_9BB2D:
		or	ax, ax
		jz	short loc_9BB4D
		push	si

loc_9BB32:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		cmp	word ptr es:[bx+6], 0FFFFh
		jnz	short loc_9BB56
		mov	byte ptr es:[bx+3], 1
		jmp	short loc_9BB56
; ���������������������������������������������������������������������������

loc_9BB4D:				; CODE XREF: Debris_LoadFieldMix_9BA85+AAj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0Ah

loc_9BB56:				; CODE XREF: Debris_LoadFieldMix_9BA85+BFj
					; Debris_LoadFieldMix_9BA85+C6j
		push	0
		push	large 54475254h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9BB7B
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+11h], al
		jmp	short loc_9BB83
; ���������������������������������������������������������������������������

loc_9BB7B:				; CODE XREF: Debris_LoadFieldMix_9BA85+E4j
		les	bx, [bp+arg_0]

loc_9BB7E:
		mov	byte ptr es:[bx+11h], 0

loc_9BB83:				; CODE XREF: Debris_LoadFieldMix_9BA85+F4j
		push	0

loc_9BB85:
		push	large 4E474953h
		push	si
		call	ResourceRecord_SeekAndRead_64743

loc_9BB91:
		add	sp, 8

loc_9BB94:
		or	ax, ax

loc_9BB96:
		jz	short loc_9BBC4

loc_9BB98:
		push	si
		call	ResourceRecord_ReadFinalField_64B51

loc_9BB9E:
		pop	cx
		les	bx, [bp+arg_0]

loc_9BBA2:
		mov	es:[bx+12h], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]

loc_9BBB0:
		mov	es:[bx+13h], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], al

loc_9BBC2:
		jmp	short loc_9BBD6
; ���������������������������������������������������������������������������

loc_9BBC4:				; CODE XREF: Debris_LoadFieldMix_9BA85:loc_9BB96j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+13h], 0
		mov	byte ptr es:[bx+14h], 0

loc_9BBD6:				; CODE XREF: Debris_LoadFieldMix_9BA85:loc_9BBC2j
		push	0
		push	large 4C505845h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9BC23
		push	1
		push	0
		push	2
		push	large 0Ch
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+1Bh], dx
		mov	es:[bx+19h], ax
		cmp	dword ptr es:[bx+19h], 0
		jz	short loc_9BC23
		push	large 0Ch
		push	large dword ptr	es:[bx+19h]
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_9BC23:				; CODE XREF: Debris_LoadFieldMix_9BA85+164j
					; Debris_LoadFieldMix_9BA85+18Bj
		push	0
		push	large 52424544h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9BCAC
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+1Dh], ax
		mov	eax, [si+72h]
		add	eax, 0FFFFFFFEh
		mov	ebx, 1Ah
		cdq
		idiv	ebx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Fh], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+1Fh]
		imul	ax, 1Ah
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]

loc_9BC81:
		mov	es:[bx+23h], dx
		mov	es:[bx+21h], ax
		cmp	dword ptr es:[bx+21h], 0
		jz	short loc_9BCAC

loc_9BC91:
		mov	ax, es:[bx+1Fh]

loc_9BC95:
		imul	ax, 1Ah

loc_9BC98:
		movzx	eax, ax
		push	eax

loc_9BC9E:
		push	large dword ptr	es:[bx+21h]

loc_9BCA3:
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_9BCAC:				; CODE XREF: Debris_LoadFieldMix_9BA85+1B1j
					; Debris_LoadFieldMix_9BA85+20Aj
		push	0

loc_9BCAE:
		push	large 54534544h
		push	si

loc_9BCB5:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_9BCBD:
		or	ax, ax
		jz	short loc_9BD23
		mov	eax, [si+72h]
		mov	ebx, 0Eh
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+25h], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+25h]

loc_9BCE1:
		imul	ax, 0Eh
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+29h], dx
		mov	es:[bx+27h], ax
		cmp	dword ptr es:[bx+27h], 0
		jz	short loc_9BD23
		mov	ax, es:[bx+25h]
		imul	ax, 0Eh
		movzx	eax, ax
		push	eax
		push	large dword ptr	es:[bx+27h]
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_9BD23:				; CODE XREF: Debris_LoadFieldMix_9BA85+23Aj
					; Debris_LoadFieldMix_9BA85+281j
		push	0
		push	large 444C4843h
		push	si
		call	ResourceRecord_SeekAndRead_64743

loc_9BD31:
		add	sp, 8
		or	ax, ax
		jnz	short loc_9BD3B
		jmp	loc_9BDE5
; ���������������������������������������������������������������������������

loc_9BD3B:				; CODE XREF: Debris_LoadFieldMix_9BA85+2B1j
		mov	eax, [si+72h]
		mov	ebx, 20h ; ' '
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], ax
		push	seg stub302
		push	offset VROOMM_StubThunk_6BFF5
		push	1
		push	word ptr es:[bx+0Fh]
		push	large 390000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], ax
		mov	di, es:[bx+0Dh]
		mov	[bp+var_A], 0
		jmp	short loc_9BDD9
; ���������������������������������������������������������������������������

loc_9BD7D:				; CODE XREF: Debris_LoadFieldMix_9BA85:loc_9BDE3j
		push	large 20h ; ' '
		push	ss

loc_9BD81:
		lea	ax, [bp+var_2A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	8
		lea	ax, [bp+var_2A]
		push	ax

loc_9BD94:
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [di+8], 0

loc_9BDA1:
		mov	eax, [bp+var_22]
		mov	[di+9],	eax
		mov	eax, [bp+var_1E]
		mov	[di+0Dh], eax

loc_9BDB1:
		mov	eax, [bp+var_1A]
		mov	[di+11h], eax
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, di
		add	ax, 15h
		push	ax
		call	Matrix_BuildFullOrientation_575B2
		add	sp, 8

loc_9BDD3:
		add	di, 39h	; '9'
		inc	[bp+var_A]

loc_9BDD9:				; CODE XREF: Debris_LoadFieldMix_9BA85+2F6j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Fh]

loc_9BDE0:
		cmp	ax, [bp+var_A]

loc_9BDE3:
		jg	short loc_9BD7D

loc_9BDE5:				; CODE XREF: Debris_LoadFieldMix_9BA85+2B3j
		pop	di

loc_9BDE6:
		pop	si
		leave
		retf
Debris_LoadFieldMix_9BA85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupC_64A7E/ReadFieldGroupB_64A54/ReadFinalField_64B51 (117 lignes).
; ==============================================================================================
Debris_LoadFieldMixB_9BDE9	proc far		; CODE XREF: VROOMM_StubThunk_6C004J

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	0
		push	large 45545845h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9BE1C
		jmp	loc_9BEC9
; ���������������������������������������������������������������������������

loc_9BE1C:				; CODE XREF: Debris_LoadFieldMixB_9BDE9+2Ej
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax

loc_9BE24:
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+10h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+16h], al
		mov	word ptr es:[bx+14h], 0
		xor	di, di
		jmp	short loc_9BEC4
; ���������������������������������������������������������������������������

loc_9BE59:				; CODE XREF: Debris_LoadFieldMixB_9BDE9+DEj
		push	si
		call	VROOMM_StubThunk_6C04A
		pop	cx
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_9BEC3
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		inc	word ptr es:[bx+14h]
		mov	ax, es:[bx+4]
		or	ax, es:[bx+6]
		jnz	short loc_9BE99

loc_9BE82:
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]

loc_9BE88:
		mov	es:[bx+6], ax

loc_9BE8C:
		mov	es:[bx+4], dx
		mov	es:[bx+2], ax

loc_9BE94:
		mov	es:[bx], dx
		jmp	short loc_9BEC3
; ���������������������������������������������������������������������������

loc_9BE99:				; CODE XREF: Debris_LoadFieldMixB_9BDE9+97j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]

loc_9BEA0:
		les	bx, es:[bx+4]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		jmp	short $+2

loc_9BEC3:				; CODE XREF: Debris_LoadFieldMixB_9BDE9+82j
					; Debris_LoadFieldMixB_9BDE9+AEj
		inc	di

loc_9BEC4:				; CODE XREF: Debris_LoadFieldMixB_9BDE9+6Ej
		cmp	di, [bp+var_2]
		jl	short loc_9BE59

loc_9BEC9:				; CODE XREF: Debris_LoadFieldMixB_9BDE9+30j
		pop	di
		pop	si
		leave
		retf
Debris_LoadFieldMixB_9BDE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine LinkedListB_FindAndDispatch_5F5A4/Helper_5F6A9 (seg159).
; ==============================================================================================
Debris_ListFindAndDispatch_9BECD	proc far		; CODE XREF: VROOMM_StubThunk_6C018J

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si

loc_9BED4:
		mov	si, [bp+arg_0]
		jmp	short loc_9BF04
; ���������������������������������������������������������������������������

loc_9BED9:				; CODE XREF: Debris_ListFindAndDispatch_9BECD+4Bj
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+4], 0
		jz	short loc_9BEF6
		push	3
		push	large dword ptr	[bx+4]
		les	bx, [bx+4]
		mov	bx, es:[bx]

loc_9BEEF:
		call	dword ptr [bx]

loc_9BEF1:
		add	sp, 6
		jmp	short $+2

loc_9BEF6:				; CODE XREF: Debris_ListFindAndDispatch_9BECD+14j
		push	0

loc_9BEF8:
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6

loc_9BF04:				; CODE XREF: Debris_ListFindAndDispatch_9BECD+Aj
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_9BED9
		pop	si
		leave
		retf
Debris_ListFindAndDispatch_9BECD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation et LinkedListB_InsertAtTail_5F57F (seg159).
; ==============================================================================================
Debris_ListAllocateAndInsert_9BF1D	proc far		; CODE XREF: VROOMM_StubThunk_6C013J

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si

loc_9BF24:
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_6], eax
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9BF57
		mov	word ptr [di], 8DAh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 1B6Bh
		mov	eax, [bp+var_6]
		mov	[di+4],	eax
		mov	ax, di
		jmp	short loc_9BF59
; ���������������������������������������������������������������������������

loc_9BF57:				; CODE XREF: Debris_ListAllocateAndInsert_9BF1D+1Fj
		mov	ax, di

loc_9BF59:				; CODE XREF: Debris_ListAllocateAndInsert_9BF1D+38j
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_5F57F
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Debris_ListAllocateAndInsert_9BF1D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine String_ConstructEmpty et Formation_ComputeGeometryHelper_56D43.
; ==============================================================================================
Debris_ConstructEmptyWithFormation_9BF6A	proc far		; CODE XREF: VROOMM_StubThunk_6BFF5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	String_ConstructEmpty
		pop	cx
		mov	ax, si
		add	ax, 9
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	ax, si
		pop	si
		pop	bp
		retf
Debris_ConstructEmptyWithFormation_9BF6A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_FreeNear_Wrap.
; ==============================================================================================
Debris_ReleaseFree_9BF8E	proc far		; CODE XREF: VROOMM_StubThunk_6BFF0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]

loc_9BF94:
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_9BFAA
		test	dx, 1
		jz	short loc_9BFAA
		push	ax
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_9BFAA:				; CODE XREF: Debris_ReleaseFree_9BF8E+Bj
					; Debris_ReleaseFree_9BF8E+11j
		pop	bp
		retf
Debris_ReleaseFree_9BF8E	endp

ovr302		ends
