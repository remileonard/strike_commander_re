seg088		segment	byte public 'CODE' use16
		assume cs:seg088
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,1882 lignes. Vérifie l'angle d'inclinaison (bank) contre un seuil de 90° (0x5A00),
; compare l'objet à l'objet joueur (word_722E6), calcule des positions d'affichage HUD
; (sub_56E29) via un gros switch interne (commentaire IDA 'default') : candidat très fort pour
; le moteur de rendu de la symbologie du HUD/viseur (gunsight) — cadrans, réticule,
; indicateurs de tangage/roulis. Bien trop volumineuse pour une passe rapide.
; ==============================================================================================
HUD_RenderSymbologyMain	proc far		; CODE XREF: HUD_RenderSymbologyAlt+83Cp

var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= dword	ptr -132h
var_12E		= dword	ptr -12Eh
var_12A		= dword	ptr -12Ah
var_126		= dword	ptr -126h
var_122		= word ptr -122h
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
var_E6		= word ptr -0E6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_66		= word ptr -66h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= word ptr -50h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp

loc_3E747:				; DATA XREF: seg216:off_6A166o
		sub	sp, 13Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	ax, word ptr [bp+arg_C+2]
		mov	dx, word ptr [bp+arg_C]
		add	dx, 24h	; '$'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+arg_C+2]
		mov	dx, word ptr [bp+arg_C]
		add	dx, 28h	; '('
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax

loc_3E784:
		mov	ax, word ptr [bp+arg_C+2]

loc_3E787:
		mov	dx, word ptr [bp+arg_C]

loc_3E78A:
		add	dx, 2Ch	; ','
		mov	word ptr [bp+var_18+2],	ax

loc_3E790:
		mov	word ptr [bp+var_18], dx
		les	bx, [bp+var_18]

loc_3E796:
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+arg_C+2]
		mov	dx, word ptr [bp+arg_C]
		add	dx, 30h	; '0'
		mov	word ptr [bp+var_20+2],	ax
		mov	word ptr [bp+var_20], dx
		les	bx, [bp+var_20]

loc_3E7B0:
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	ax, 1209h

loc_3E7BB:
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	[bp+var_21], 0
		mov	[bp+var_22], 0
		cmp	word_722E6, si
		jnz	short loc_3E823
		push	word_722E6
		mov	bx, word_722E6
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		call	AI_ComputeGeometrySolution_57C67
		add	sp, 6
		mov	eax, [bp+var_26]
		or	eax, eax
		jge	short loc_3E7FE
		neg	eax

loc_3E7FE:				; CODE XREF: HUD_RenderSymbologyMain+B5j
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		cmp	[bp+var_2E], 5A00h
		jle	short loc_3E819
		mov	ax, 1
		jmp	short loc_3E81B
; ���������������������������������������������������������������������������

loc_3E819:				; CODE XREF: HUD_RenderSymbologyMain+CEj
		xor	ax, ax

loc_3E81B:				; CODE XREF: HUD_RenderSymbologyMain+D3j
		or	al, al
		jz	short loc_3E823
		mov	[bp+var_22], 1

loc_3E823:				; CODE XREF: HUD_RenderSymbologyMain+90j
					; HUD_RenderSymbologyMain+D9j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_3E830
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3E830:				; CODE XREF: HUD_RenderSymbologyMain+E7j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_40], ax
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3E85B
		les	bx, es:[bx]
		mov	al, es:[bx+4Ah]
		jmp	short loc_3E85D
; ���������������������������������������������������������������������������

loc_3E85B:				; CODE XREF: HUD_RenderSymbologyMain+10Cj
		mov	al, 17h

loc_3E85D:				; CODE XREF: HUD_RenderSymbologyMain+115j
		mov	ah, 0
		sub	ax, 8
		mov	bx, ax
		cmp	bx, 5		; switch 6 cases
		jbe	short loc_3E86C
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3E86C:				; CODE XREF: HUD_RenderSymbologyMain+123j
		shl	bx, 1
		jmp	cs:off_3F7BE[bx] ; switch jump

loc_3E873:				; DATA XREF: seg088:off_3F7BEo
		cmp	[bp+var_1C], 0	; case 0x2
		jnz	short loc_3E87F
		mov	ax, 1
		jmp	short loc_3E881
; ���������������������������������������������������������������������������

loc_3E87F:				; CODE XREF: HUD_RenderSymbologyMain+134j
		xor	ax, ax

loc_3E881:				; CODE XREF: HUD_RenderSymbologyMain+139j
		or	al, al
		jnz	short loc_3E888

loc_3E885:				; default
		jmp	loc_3F71E
; ���������������������������������������������������������������������������

loc_3E888:				; CODE XREF: HUD_RenderSymbologyMain+13Fj
		les	bx, [bp+arg_C]
		cmp	word ptr es:[bx+1Eh], 0
		jg	short loc_3E8B6
		cmp	byte_72358, 0
		jnz	short loc_3E89C
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3E89C:				; CODE XREF: HUD_RenderSymbologyMain+153j
		cmp	si, word_722E6
		jz	short loc_3E8A5
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3E8A5:				; CODE XREF: HUD_RenderSymbologyMain+15Cj
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_3E8B6
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3E8B6:				; CODE XREF: HUD_RenderSymbologyMain+14Cj
					; HUD_RenderSymbologyMain+16Dj
		call	DisplayCache_ComputeChecksum_5D43F
		mov	bx, 3E8h
		xor	dx, dx
		div	bx
		mov	[bp-46h], ax
		cmp	word_722E6, si
		jnz	short loc_3E8D1
		mov	di, word_7047D
		jmp	short loc_3E8D5
; ���������������������������������������������������������������������������

loc_3E8D1:				; CODE XREF: HUD_RenderSymbologyMain+185j
		mov	di, word_70479

loc_3E8D5:				; CODE XREF: HUD_RenderSymbologyMain+18Bj
		cmp	di, [bp-46h]
		jl	short loc_3E8DD
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3E8DD:				; CODE XREF: HUD_RenderSymbologyMain+194j
		mov	word ptr [bp+var_4A+2],	1
		jmp	loc_3EF0C
; ���������������������������������������������������������������������������

loc_3E8E5:				; CODE XREF: HUD_RenderSymbologyMain+7D4j
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+38h]
		cmp	ax, word ptr [bp+var_4A+2]
		jle	short loc_3E903
		mov	dx, es:[bx+36h]
		mov	ax, es:[bx+34h]
		mov	bx, word ptr [bp+var_4A+2]
		imul	bx, 23h
		add	ax, bx
		jmp	short loc_3E907
; ���������������������������������������������������������������������������

loc_3E903:				; CODE XREF: HUD_RenderSymbologyMain+1ABj
		xor	dx, dx
		xor	ax, ax

loc_3E907:				; CODE XREF: HUD_RenderSymbologyMain+1BDj
		mov	word ptr [bp+var_4A], dx
		mov	word ptr [bp+var_4E+2],	ax
		les	bx, [bp+var_4E+2]
		cmp	word ptr es:[bx+0Dh], 8
		jz	short loc_3E91A
		jmp	loc_3EF09
; ���������������������������������������������������������������������������

loc_3E91A:				; CODE XREF: HUD_RenderSymbologyMain+1D1j
		mov	word ptr [bp+var_4E], 0
		jmp	loc_3EEFA
; ���������������������������������������������������������������������������

loc_3E922:				; CODE XREF: HUD_RenderSymbologyMain+7C2j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 5Fh	; '_'
		mov	[bp+var_50], ax
		mov	word ptr [bp+var_54+2],	dx
		push	1
		push	1
		push	ax
		push	dx
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	di, ax
		lea	ax, [bp+var_E6]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+0Dh]
		mov	word ptr [bp+var_54], ax
		cmp	word ptr [bp+var_54], 0
		jz	short loc_3E9E4
		add	ax, 12h
		mov	word ptr [bp+var_58+2],	ax
		mov	ax, si
		add	ax, 12h
		mov	word ptr [bp+var_58], ax
		mov	bx, word ptr [bp+var_58+2]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_58]
		sub	eax, [bx]

loc_3E980:
		mov	[bp+var_FE], eax
		mov	bx, word ptr [bp+var_58+2]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_58]
		sub	eax, [bx+4]
		mov	[bp+var_FA], eax
		mov	bx, word ptr [bp+var_58+2]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_58]
		sub	eax, [bx+8]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_FE]

loc_3E9B0:
		mov	[bp+var_10A], eax

loc_3E9B5:
		mov	eax, [bp+var_FA]

loc_3E9BA:
		mov	[bp+var_106], eax

loc_3E9BF:
		mov	eax, [bp+var_F6]

loc_3E9C4:
		mov	[bp+var_102], eax
		mov	eax, [bp+var_10A]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_106]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_102]
		jmp	short loc_3EA0C
; ���������������������������������������������������������������������������

loc_3E9E4:				; CODE XREF: HUD_RenderSymbologyMain+220j
		push	si
		push	ss
		lea	ax, [bp+var_116]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_116]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_112]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_10E]

loc_3EA0C:				; CODE XREF: HUD_RenderSymbologyMain+29Ej
		mov	[bp+var_EA], eax
		push	large [bp+var_EA]
		push	large [bp+var_EE]
		push	large [bp+var_F2]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_64], 0
		cmp	eax, [bp+var_64]
		jz	short loc_3EA47
		mov	ax, 1
		jmp	short loc_3EA49
; ���������������������������������������������������������������������������

loc_3EA47:				; CODE XREF: HUD_RenderSymbologyMain+2FCj
		xor	ax, ax

loc_3EA49:				; CODE XREF: HUD_RenderSymbologyMain+301j
		or	al, al
		jz	short loc_3EA9B
		lea	ax, [bp+var_F2]
		push	ax
		call	UI_ApplyVectorLength_55B04
		pop	cx
		lea	ax, [bp+var_F2]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	[bp+var_66], ax
		mov	bx, [bp+var_66]
		mov	eax, [bp+var_F2]
		mov	[bx], eax
		mov	eax, [bp+var_EE]

loc_3EA80:
		mov	[bx+4],	eax
		mov	eax, [bp+var_EA]
		mov	[bx+8],	eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx

loc_3EA94:
		push	ax
		call	Matrix_ApplyToVectorY_57660
		pop	cx

loc_3EA9B:				; CODE XREF: HUD_RenderSymbologyMain+307j
		mov	ax, word ptr [bp+var_4A]
		mov	dx, word ptr [bp+var_4E+2]
		inc	dx
		mov	[bp-68h], ax
		mov	word ptr [bp+var_6C+2],	dx
		les	ax, [bp+var_6C+2]
		mov	word ptr [bp+var_6C], ax
		mov	bx, word ptr [bp+var_6C]

loc_3EAB1:
		mov	eax, es:[bx]

loc_3EAB5:
		mov	[di+12h], eax
		mov	eax, es:[bx+4]
		mov	[di+16h], eax
		mov	eax, es:[bx+8]
		mov	[di+1Ah], eax
		les	bx, [bp+var_4E+2]
		les	bx, es:[bx+0Fh]
		les	bx, es:[bx]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	word ptr [bp+var_7C+2],	ax
		mov	word ptr [bp+var_7C], dx
		push	0
		push	ax
		push	dx
		call	Particle_PoolWait
		add	sp, 6
		mov	word ptr [bp+var_80+2],	dx
		mov	word ptr [bp+var_80], ax
		cmp	[bp+var_80], 0
		jz	short loc_3EB37
		les	bx, [bp+var_80]
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_70], eax
		mov	eax, es:[bx+33h]
		sub	[bp+var_70], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_74], eax
		mov	eax, es:[bx+23h]
		sub	[bp+var_74], eax
		mov	eax, es:[bx+27h]
		mov	[bp+var_78], eax
		mov	eax, es:[bx+2Bh]
		sub	[bp+var_78], eax
		jmp	short loc_3EB40
; ���������������������������������������������������������������������������

loc_3EB37:				; CODE XREF: HUD_RenderSymbologyMain+3B6j
		push	0C01Ah
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_3EB40:				; CODE XREF: HUD_RenderSymbologyMain+3F1j
		mov	eax, [bp+var_70]
		mov	[bp+var_84], eax
		cmp	word ptr [bp+var_4E], 0
		jnz	short loc_3EB59
		les	bx, [bp+var_4E+2]
		cmp	word ptr es:[bx+13h], 1
		jz	short loc_3EB7B

loc_3EB59:				; CODE XREF: HUD_RenderSymbologyMain+409j
		cmp	word ptr [bp+var_4E], 2
		jz	short loc_3EB65
		cmp	word ptr [bp+var_4E], 5
		jnz	short loc_3EB7B

loc_3EB65:				; CODE XREF: HUD_RenderSymbologyMain+419j
		mov	eax, [bp+var_70]
		shl	eax, 1
		mov	[bp+var_88], eax
		mov	[bp+var_8C], eax
		add	[bp+var_84], eax

loc_3EB7B:				; CODE XREF: HUD_RenderSymbologyMain+413j
					; HUD_RenderSymbologyMain+41Fj
		mov	eax, [bp+var_84]

loc_3EB80:
		sub	[di+1Ah], eax
		les	bx, [bp+var_4E+2]

loc_3EB87:
		cmp	word ptr es:[bx+13h], 1

loc_3EB8C:
		jle	short loc_3EBBC
		mov	eax, [bp+var_74]
		sar	eax, 1
		mov	[bp+var_74], eax
		mov	ax, word ptr [bp+var_4A+2]
		and	ax, 3
		or	ax, ax
		jz	short loc_3EBAA
		cmp	ax, 1
		jz	short loc_3EBB4
		jmp	short loc_3EBBC
; ���������������������������������������������������������������������������

loc_3EBAA:				; CODE XREF: HUD_RenderSymbologyMain+45Dj
		mov	eax, [bp+var_74]

loc_3EBAE:
		sub	[di+12h], eax
		jmp	short loc_3EBBC
; ���������������������������������������������������������������������������

loc_3EBB4:				; CODE XREF: HUD_RenderSymbologyMain+462j
		mov	eax, [bp+var_74]
		add	[di+12h], eax

loc_3EBBC:				; CODE XREF: HUD_RenderSymbologyMain:loc_3EB8Cj
					; HUD_RenderSymbologyMain+464j ...
		cmp	word ptr [bp+var_4A+2],	3
		jl	short loc_3EBCA
		mov	eax, [bp+var_78]
		add	[di+16h], eax

loc_3EBCA:				; CODE XREF: HUD_RenderSymbologyMain+47Cj
		lea	ax, [bp+var_E6]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_8E], ax
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_90], ax
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_92], ax
		mov	bx, [bp+var_90]
		mov	eax, [bx]
		mov	bx, [bp+var_92]
		add	eax, [bx]
		mov	bx, [bp+var_8E]
		mov	[bx], eax
		mov	bx, [bp+var_90]
		mov	eax, [bx+4]
		mov	bx, [bp+var_92]
		add	eax, [bx+4]
		mov	bx, [bp+var_8E]
		mov	[bx+4],	eax
		mov	bx, [bp+var_90]
		mov	eax, [bx+8]
		mov	bx, [bp+var_92]
		add	eax, [bx+8]
		mov	bx, [bp+var_8E]
		mov	[bx+8],	eax
		or	di, di
		jnz	short loc_3EC44
		jmp	loc_3EEF7
; ���������������������������������������������������������������������������

loc_3EC44:				; CODE XREF: HUD_RenderSymbologyMain+4FBj
		push	di
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		mov	[bp+var_94], di
		push	[bp+var_94]
		mov	ax, word ptr [bp+arg_C]
		add	ax, 11h
		push	word ptr [bp+arg_C+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		mov	[di+63h], al
		cmp	word ptr [bp+var_54], 0
		jnz	short loc_3EC7D
		jmp	loc_3ED46
; ���������������������������������������������������������������������������

loc_3EC7D:				; CODE XREF: HUD_RenderSymbologyMain+534j
		push	si
		push	ss
		lea	ax, [bp+var_12E]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large [bp+var_126]
		push	large [bp+var_12A]
		push	large [bp+var_12E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A8], eax
		mov	[bp+var_A4], eax
		push	di

loc_3ECB2:
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	[bp+var_AA], ax
		mov	bx, [bp+var_AA]

loc_3ECC3:
		mov	eax, [bx]
		mov	edx, [bp+var_A4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_A4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_BA], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_A4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_136], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_132], eax
		lea	ax, [bp+var_13A]
		jmp	short loc_3ED59
; ���������������������������������������������������������������������������

loc_3ED46:				; CODE XREF: HUD_RenderSymbologyMain+536j
		push	si
		push	ss
		lea	ax, [bp+var_122]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp+var_122]

loc_3ED59:				; CODE XREF: HUD_RenderSymbologyMain+600j
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 4
		push	0
		mov	ax, di
		add	ax, 55h	; 'U'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_96], si
		push	[bp+var_96]
		mov	ax, di
		add	ax, 57h	; 'W'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	bx, [di+51h]
		mov	byte ptr [bx+39h], 0
		mov	[bp+var_98], si
		push	[bp+var_98]
		mov	ax, [di+51h]
		add	ax, 37h	; '7'
		push	ax
		call	SetReference16
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Fh], 14h
		cmp	word_722E6, si

loc_3EDB3:
		jnz	short loc_3EDBB

loc_3EDB5:
		inc	word_7047D
		jmp	short loc_3EDBF
; ���������������������������������������������������������������������������

loc_3EDBB:				; CODE XREF: HUD_RenderSymbologyMain:loc_3EDB3j
		inc	word_70479

loc_3EDBF:				; CODE XREF: HUD_RenderSymbologyMain+675j
		cmp	si, word_722E6
		jnz	short loc_3EDDA
		cmp	byte_72358, 0
		jz	short loc_3EDDA
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_3EDE1

loc_3EDDA:				; CODE XREF: HUD_RenderSymbologyMain+67Fj
					; HUD_RenderSymbologyMain+686j
		les	bx, [bp+arg_C]
		dec	word ptr es:[bx+1Eh]

loc_3EDE1:				; CODE XREF: HUD_RenderSymbologyMain+694j
		mov	[bp+var_21], 1
		cmp	byte_72A8E, 4
		jnz	short loc_3EE16
		cmp	si, word_722E6
		jnz	short loc_3EE16
		les	bx, [bp+var_4E+2]
		mov	eax, es:[bx+1]
		sar	eax, 8
		cmp	eax, 0
		jle	short loc_3EE0C
		push	0
		push	large 0
		jmp	loc_3EEB3
; ���������������������������������������������������������������������������

loc_3EE0C:				; CODE XREF: HUD_RenderSymbologyMain+6BEj
		push	0
		push	large 0
		push	0
		jmp	loc_3EEB5
; ���������������������������������������������������������������������������

loc_3EE16:				; CODE XREF: HUD_RenderSymbologyMain+6A6j
					; HUD_RenderSymbologyMain+6ACj
		mov	ax, si
		add	ax, 12h
		mov	word ptr [bp+var_A4+2],	ax
		mov	ax, word_72A8F
		add	ax, 14h
		mov	word ptr [bp+var_A4], ax
		mov	bx, word ptr [bp+var_A4+2]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_A4]
		sub	eax, [bx]
		mov	[bp+var_13A], eax
		mov	bx, word ptr [bp+var_A4+2]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_A4]
		sub	eax, [bx+4]
		mov	[bp+var_136], eax
		mov	bx, word ptr [bp+var_A4+2]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_A4]
		sub	eax, [bx+8]
		mov	[bp+var_132], eax
		mov	eax, [bp+var_13A]
		mov	[bp+var_12E], eax
		mov	eax, [bp+var_136]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_132]

loc_3EE7F:
		mov	[bp+var_126], eax
		push	eax

loc_3EE86:
		push	large [bp+var_12A]
		push	large [bp+var_12E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_AE+2], eax
		mov	[bp+var_B2+2], eax
		sar	eax, 8
		mov	[bp+var_A8], eax
		push	0
		push	eax

loc_3EEB3:				; CODE XREF: HUD_RenderSymbologyMain+6C5j
		push	1

loc_3EEB5:				; CODE XREF: HUD_RenderSymbologyMain+6CFj
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8
		push	0
		push	di
		push	si
		push	59CDh
		call	Mission_PlayerEventHandler
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 5Ah	; 'Z'
		mov	word ptr [bp+var_9C+2],	ax
		mov	word ptr [bp+var_9C], dx
		les	bx, [bp+var_9C]
		mov	eax, es:[bx]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_1C], eax

loc_3EEF7:				; CODE XREF: HUD_RenderSymbologyMain+4FDj
		inc	word ptr [bp+var_4E]

loc_3EEFA:				; CODE XREF: HUD_RenderSymbologyMain+1DBj
		les	bx, [bp+var_4E+2]
		mov	ax, es:[bx+13h]
		cmp	ax, word ptr [bp+var_4E]
		jle	short loc_3EF09
		jmp	loc_3E922
; ���������������������������������������������������������������������������

loc_3EF09:				; CODE XREF: HUD_RenderSymbologyMain+1D3j
					; HUD_RenderSymbologyMain+7C0j
		inc	word ptr [bp+var_4A+2]

loc_3EF0C:				; CODE XREF: HUD_RenderSymbologyMain+19Ej
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+38h]
		cmp	ax, word ptr [bp+var_4A+2]
		jle	short loc_3EF1B
		jmp	loc_3E8E5
; ���������������������������������������������������������������������������

loc_3EF1B:				; CODE XREF: HUD_RenderSymbologyMain+7D2j
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3EF1E:				; CODE XREF: HUD_RenderSymbologyMain+12Aj
					; DATA XREF: seg088:off_3F7BEo
		cmp	[bp+var_4], 0	; case 0x0
		jnz	short loc_3EF2A
		mov	ax, 1
		jmp	short loc_3EF2C
; ���������������������������������������������������������������������������

loc_3EF2A:				; CODE XREF: HUD_RenderSymbologyMain+7DFj
		xor	ax, ax

loc_3EF2C:				; CODE XREF: HUD_RenderSymbologyMain+7E4j
		or	al, al
		jnz	short loc_3EF33
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3EF33:				; CODE XREF: HUD_RenderSymbologyMain+7EAj
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	[bp-46h], ax
		les	bx, es:[bx+16h]
		shl	ax, 1
		add	bx, ax
		mov	di, es:[bx]
		call	DisplayCache_ComputeChecksum_5D43F
		mov	bx, 3E8h
		xor	dx, dx
		div	bx
		mov	word ptr [bp+var_4A+2],	ax
		cmp	word_722E6, si
		jnz	short loc_3EF63
		mov	ax, word_7047D
		jmp	short loc_3EF66
; ���������������������������������������������������������������������������

loc_3EF63:				; CODE XREF: HUD_RenderSymbologyMain+818j
		mov	ax, word_70479

loc_3EF66:				; CODE XREF: HUD_RenderSymbologyMain+81Dj
		mov	word ptr [bp+var_4A], ax
		mov	ax, word ptr [bp+var_4A]
		cmp	ax, word ptr [bp+var_4A+2]
		jl	short loc_3EF74
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3EF74:				; CODE XREF: HUD_RenderSymbologyMain+82Bj
		or	di, di
		jz	short loc_3EFA8
		cmp	si, word_722E6
		jnz	short loc_3EF93
		cmp	byte_72358, 0
		jz	short loc_3EF93
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx

loc_3EF8F:
		or	al, al
		jnz	short loc_3EFA8

loc_3EF93:				; CODE XREF: HUD_RenderSymbologyMain+838j
					; HUD_RenderSymbologyMain+83Fj
		push	1
		push	1
		push	di

loc_3EF98:
		push	571Ch
		call	Debris_InstantiateFromParent
		add	sp, 8
		mov	di, ax
		jmp	loc_3F06F
; ���������������������������������������������������������������������������

loc_3EFA8:				; CODE XREF: HUD_RenderSymbologyMain+832j
					; HUD_RenderSymbologyMain+84Dj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 4
		mov	word ptr [bp+var_4E+2],	ax
		mov	word ptr [bp+var_4E], dx
		push	1
		push	1
		push	ax
		push	dx
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	di, ax
		lea	ax, [bp+var_E6]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	ax, word ptr [bp+arg_8+2]
		mov	dx, word ptr [bp+arg_8]
		inc	dx
		mov	[bp+var_50], ax
		mov	word ptr [bp+var_54+2],	dx
		les	ax, [bp+var_54+2]
		mov	word ptr [bp+var_54], ax
		mov	bx, word ptr [bp+var_54]
		mov	eax, es:[bx]
		mov	[di+12h], eax
		mov	eax, es:[bx+4]
		mov	[di+16h], eax
		mov	eax, es:[bx+8]
		mov	[di+1Ah], eax
		lea	ax, [bp+var_E6]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_58+2],	ax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_58], ax
		mov	ax, si
		add	ax, 12h
		mov	word ptr [bp+var_5C+2],	ax
		mov	bx, word ptr [bp+var_58]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_5C+2]
		add	eax, [bx]
		mov	bx, word ptr [bp+var_58+2]
		mov	[bx], eax
		mov	bx, word ptr [bp+var_58]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_5C+2]
		add	eax, [bx+4]
		mov	bx, word ptr [bp+var_58+2]
		mov	[bx+4],	eax
		mov	bx, word ptr [bp+var_58]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_5C+2]
		add	eax, [bx+8]
		mov	bx, word ptr [bp+var_58+2]
		mov	[bx+8],	eax

loc_3F06F:				; CODE XREF: HUD_RenderSymbologyMain+861j
		or	di, di
		jnz	short loc_3F076
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F076:				; CODE XREF: HUD_RenderSymbologyMain+92Dj
		cmp	word_722E6, si
		jnz	short loc_3F082
		inc	word_7047D
		jmp	short loc_3F086
; ���������������������������������������������������������������������������

loc_3F082:				; CODE XREF: HUD_RenderSymbologyMain+936j
		inc	word_70479

loc_3F086:				; CODE XREF: HUD_RenderSymbologyMain+93Cj
		push	di

loc_3F087:
		push	59C3h

loc_3F08A:
		call	Container_KeyEquals
		add	sp, 4

loc_3F092:
		cmp	dword ptr [di+0Eh], 0
		jz	short loc_3F0A8
		les	bx, [di+0Eh]
		cmp	byte ptr es:[bx+4Eh], 1
		jnz	short loc_3F0A8
		mov	byte_6E4C6, 1

loc_3F0A8:				; CODE XREF: HUD_RenderSymbologyMain+953j
					; HUD_RenderSymbologyMain+95Dj
		mov	word ptr [bp+var_5C], di
		push	word ptr [bp+var_5C]
		mov	ax, word ptr [bp+arg_C]

loc_3F0B1:
		add	ax, 11h

loc_3F0B4:
		push	word ptr [bp+arg_C+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		mov	[di+63h], al
		push	si
		push	ss
		lea	ax, [bp+var_F2]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp+var_F2]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 4
		mov	ax, [bp+arg_6]
		mov	word ptr [bp+var_60+2],	ax
		push	ax
		mov	ax, di
		add	ax, 55h	; 'U'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	word ptr [bp+var_60], si
		push	word ptr [bp+var_60]
		mov	ax, di
		add	ax, 57h	; 'W'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	[bp+arg_6], 0
		jz	short loc_3F135
		mov	bx, [di+51h]
		mov	byte ptr [bx+39h], 1
		push	si
		push	[bp+arg_6]
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], al
		jmp	short loc_3F144
; ���������������������������������������������������������������������������

loc_3F135:				; CODE XREF: HUD_RenderSymbologyMain+9D0j
		mov	bx, [di+51h]
		mov	byte ptr [bx+39h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Fh], 14h

loc_3F144:				; CODE XREF: HUD_RenderSymbologyMain+9EFj
		mov	word ptr [bp+var_64+2],	si
		push	word ptr [bp+var_64+2]
		mov	ax, [di+51h]
		add	ax, 37h	; '7'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	si, word_722E6
		jnz	short loc_3F174
		cmp	byte_72358, 0
		jz	short loc_3F174
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_3F183

loc_3F174:				; CODE XREF: HUD_RenderSymbologyMain+A19j
					; HUD_RenderSymbologyMain+A20j
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	word ptr [bp+var_64], ax

loc_3F17F:
		mov	es:[bx+13h], ax

loc_3F183:				; CODE XREF: HUD_RenderSymbologyMain+A2Ej
		mov	[bp+var_21], 1
		cmp	byte_72A8E, 4

loc_3F18C:
		jnz	short loc_3F1B8

loc_3F18E:
		cmp	si, word_722E6
		jnz	short loc_3F1B8

loc_3F194:
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+1]
		sar	eax, 8
		cmp	eax, 0
		jle	short loc_3F1AE
		push	0
		push	large 0
		jmp	loc_3F24A
; ���������������������������������������������������������������������������

loc_3F1AE:				; CODE XREF: HUD_RenderSymbologyMain+A60j
		push	0
		push	large 0
		push	0
		jmp	loc_3F24C
; ���������������������������������������������������������������������������

loc_3F1B8:				; CODE XREF: HUD_RenderSymbologyMain:loc_3F18Cj
					; HUD_RenderSymbologyMain+A4Ej
		mov	ax, si
		add	ax, 12h

loc_3F1BD:
		mov	word ptr [bp+var_70+2],	ax
		mov	ax, word_72A8F

loc_3F1C3:
		add	ax, 14h

loc_3F1C6:
		mov	word ptr [bp+var_70], ax
		mov	bx, word ptr [bp+var_70+2]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_70]
		sub	eax, [bx]
		mov	[bp+var_10A], eax
		mov	bx, word ptr [bp+var_70+2]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_70]
		sub	eax, [bx+4]
		mov	[bp+var_106], eax
		mov	bx, word ptr [bp+var_70+2]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_70]
		sub	eax, [bx+8]
		mov	[bp+var_102], eax
		mov	eax, [bp+var_10A]
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_106]
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_102]
		mov	[bp+var_F6], eax
		push	eax
		push	large [bp+var_FA]
		push	large [bp+var_FE]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		sar	eax, 8
		mov	[bp+var_74], eax
		push	0
		push	eax

loc_3F24A:				; CODE XREF: HUD_RenderSymbologyMain+A67j
		push	1

loc_3F24C:				; CODE XREF: HUD_RenderSymbologyMain+A71j
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		cmp	byte ptr es:[bx+4Fh], 0
		jnz	short loc_3F265
		push	0
		jmp	short loc_3F268
; ���������������������������������������������������������������������������

loc_3F265:				; CODE XREF: HUD_RenderSymbologyMain+B1Bj
		push	[bp+arg_6]

loc_3F268:				; CODE XREF: HUD_RenderSymbologyMain+B1Fj
		push	di
		push	si
		push	59CDh
		call	Mission_PlayerEventHandler
		add	sp, 8
		cmp	si, word_722E6
		jnz	short loc_3F290
		cmp	byte_72358, 0
		jz	short loc_3F290
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_3F2A4

loc_3F290:				; CODE XREF: HUD_RenderSymbologyMain+B35j
					; HUD_RenderSymbologyMain+B3Cj
		les	bx, [bp+arg_C]

loc_3F293:
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_C+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponStation_DecrementCounter
		add	sp, 8

loc_3F2A4:				; CODE XREF: HUD_RenderSymbologyMain+B4Aj
		mov	ax, [di+10h]
		mov	dx, [di+0Eh]
		add	dx, 5Ah	; 'Z'
		mov	[bp+var_66], ax
		mov	[bp-68h], dx
		les	bx, [bp-68h]

loc_3F2B6:
		mov	eax, es:[bx]

loc_3F2BA:
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]

loc_3F2C2:
		mov	[bp+var_4], eax
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F2C9:				; CODE XREF: HUD_RenderSymbologyMain+12Aj
					; DATA XREF: seg088:off_3F7BEo
		les	bx, [bp+arg_C]	; case 0x1
		cmp	byte ptr es:[bx+44h], 0
		jnz	short loc_3F2EB
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		cmp	word ptr es:[bx+4Bh], 80h ; '�'
		jz	short loc_3F2EB
		cmp	byte ptr es:[bx+4Dh], 4
		jz	short loc_3F2EB
		jmp	loc_3F492
; ���������������������������������������������������������������������������

loc_3F2EB:				; CODE XREF: HUD_RenderSymbologyMain+B8Dj
					; HUD_RenderSymbologyMain+B9Bj ...
		mov	al, [bp+var_22]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3F2F7
		jmp	loc_3F492
; ���������������������������������������������������������������������������

loc_3F2F7:				; CODE XREF: HUD_RenderSymbologyMain+BAEj
		cmp	[bp+var_C], 0
		jnz	short loc_3F303
		mov	ax, 1
		jmp	short loc_3F305
; ���������������������������������������������������������������������������

loc_3F303:				; CODE XREF: HUD_RenderSymbologyMain+BB8j
		xor	ax, ax

loc_3F305:				; CODE XREF: HUD_RenderSymbologyMain+BBDj
		or	al, al
		jnz	short loc_3F30C
		jmp	loc_3F492
; ���������������������������������������������������������������������������

loc_3F30C:				; CODE XREF: HUD_RenderSymbologyMain+BC3j
		call	DisplayCache_ComputeChecksum_5D43F
		mov	bx, 3E8h
		xor	dx, dx
		div	bx
		mov	[bp-46h], ax
		cmp	word_722E6, si
		jnz	short loc_3F327
		mov	di, word_7047F
		jmp	short loc_3F32B
; ���������������������������������������������������������������������������

loc_3F327:				; CODE XREF: HUD_RenderSymbologyMain+BDBj
		mov	di, word_70481

loc_3F32B:				; CODE XREF: HUD_RenderSymbologyMain+BE1j
		cmp	di, [bp-46h]
		jl	short loc_3F333
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F333:				; CODE XREF: HUD_RenderSymbologyMain+BEAj
		cmp	word_722E6, si
		jnz	short loc_3F340
		add	word_7047F, 2
		jmp	short loc_3F345
; ���������������������������������������������������������������������������

loc_3F340:				; CODE XREF: HUD_RenderSymbologyMain+BF3j
		add	word_70481, 2

loc_3F345:				; CODE XREF: HUD_RenderSymbologyMain+BFAj
		cmp	si, word_722E6
		jnz	short loc_3F360
		cmp	byte_72358, 0
		jz	short loc_3F360
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_3F374

loc_3F360:				; CODE XREF: HUD_RenderSymbologyMain+C05j
					; HUD_RenderSymbologyMain+C0Cj
		les	bx, [bp+arg_C]
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_C+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponStation_DecrementCounter
		add	sp, 8

loc_3F374:				; CODE XREF: HUD_RenderSymbologyMain+C1Aj
		push	0
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	[bp+arg_6]
		push	si
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_4A]
		push	ax
		call	VROOMM_StubThunk_6C399
		add	sp, 16h
		mov	eax, [bp+var_4A]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_4E], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		cmp	word ptr es:[bx+4Bh], 80h ; '�'
		jnz	short loc_3F3B4

loc_3F3B1:
		jmp	loc_3F435
; ���������������������������������������������������������������������������

loc_3F3B4:				; CODE XREF: HUD_RenderSymbologyMain+C6Bj
		les	bx, [bp+arg_C]
		les	bx, es:[bx+18h]

loc_3F3BB:
		cmp	dword ptr es:[bx], 0

loc_3F3C0:
		jz	short loc_3F3CB

loc_3F3C2:
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3F3CD
; ���������������������������������������������������������������������������

loc_3F3CB:				; CODE XREF: HUD_RenderSymbologyMain:loc_3F3C0j
		xor	ax, ax

loc_3F3CD:				; CODE XREF: HUD_RenderSymbologyMain+C85j
		push	ax
		push	large [bp+arg_C]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	word ptr [bp+arg_8+2], dx
		mov	word ptr [bp+arg_8], ax
		cmp	[bp+arg_8], 0
		jz	short loc_3F435
		cmp	si, word_722E6
		jnz	short loc_3F402
		cmp	byte_72358, 0
		jz	short loc_3F402
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_3F416

loc_3F402:				; CODE XREF: HUD_RenderSymbologyMain+CA7j
					; HUD_RenderSymbologyMain+CAEj
		les	bx, [bp+arg_C]
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_C+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponStation_DecrementCounter
		add	sp, 8

loc_3F416:				; CODE XREF: HUD_RenderSymbologyMain+CBCj
		push	1
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	[bp+arg_6]
		push	si
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_54+2]
		push	ax
		call	VROOMM_StubThunk_6C399
		add	sp, 16h

loc_3F435:				; CODE XREF: HUD_RenderSymbologyMain:loc_3F3B1j
					; HUD_RenderSymbologyMain+CA1j
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6
		jnz	short loc_3F483
		cmp	byte_72358, 0
		jz	short loc_3F483
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jz	short loc_3F483
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		cmp	word ptr es:[bx+4Bh], 80h ; '�'
		jz	short loc_3F474
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+13h]
		inc	ax
		mov	word ptr [bp+var_54], ax
		mov	es:[bx+13h], ax

loc_3F474:				; CODE XREF: HUD_RenderSymbologyMain+D1Fj
		les	bx, [bp+var_4E]
		mov	ax, es:[bx+13h]
		inc	ax
		mov	word ptr [bp+var_58+2],	ax

loc_3F47F:
		mov	es:[bx+13h], ax

loc_3F483:				; CODE XREF: HUD_RenderSymbologyMain+CFCj
					; HUD_RenderSymbologyMain+D03j ...
		les	bx, [bp+arg_C]

loc_3F486:
		mov	byte ptr es:[bx+44h], 0
		mov	[bp+var_21], 1

loc_3F48F:				; default
		jmp	loc_3F71E
; ���������������������������������������������������������������������������

loc_3F492:				; CODE XREF: HUD_RenderSymbologyMain+BA4j
					; HUD_RenderSymbologyMain+BB0j ...
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		cmp	byte ptr es:[bx+4Dh], 5
		jz	short loc_3F4A2
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F4A2:				; CODE XREF: HUD_RenderSymbologyMain+D59j
		les	bx, [bp+arg_C]
		mov	byte ptr es:[bx+44h], 1
		mov	[bp+var_44], 0
		mov	eax, [bp+var_44]
		mov	es:[bx+51h], eax
		mov	[bp+var_C], 100h

loc_3F4C3:
		mov	[bp+var_21], 1
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F4FB
		push	5
		lea	ax, [bp+var_4A+2]
		push	ax
		push	word ptr es:[bx+0Dh]
		push	0
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp+var_FE]
		push	ax
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp+var_FE]
		jmp	short loc_3F51C
; ���������������������������������������������������������������������������

loc_3F4FB:				; CODE XREF: HUD_RenderSymbologyMain+D8Bj
		mov	eax, dword_707E0
		mov	[bp+var_FE], eax
		mov	eax, dword_707E4
		mov	[bp+var_FA], eax
		mov	eax, dword_707E8
		mov	[bp+var_F6], eax
		mov	dx, ss
		lea	ax, [bp+var_FE]

loc_3F51C:				; CODE XREF: HUD_RenderSymbologyMain+DB5j
		les	bx, [bp+arg_C]
		mov	eax, [bp+var_FE]
		mov	es:[bx+45h], eax
		mov	eax, [bp+var_FA]
		mov	es:[bx+49h], eax
		mov	eax, [bp+var_F6]
		mov	es:[bx+4Dh], eax
		push	1
		lea	ax, [bp+var_F2]
		push	ax
		mov	ax, word ptr [bp+arg_C+2]
		mov	dx, word ptr [bp+arg_C]
		add	dx, 45h	; 'E'
		mov	word ptr [bp+var_4A], ax
		mov	word ptr [bp+var_4E+2],	dx
		les	di, [bp+var_4E+2]
		mov	eax, es:[di]
		mov	[bp+var_10A], eax
		mov	eax, es:[di+4]
		mov	[bp+var_106], eax
		mov	eax, es:[di+8]
		mov	[bp+var_102], eax
		lea	ax, [bp+var_10A]
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_50]
		push	ax

loc_3F581:
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, dword ptr [bp+var_50]
		mov	[bp+var_4A+2], eax
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		les	bx, [bp+arg_C]
		mov	es:[bx+4Dh], eax
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F5A4:				; CODE XREF: HUD_RenderSymbologyMain+12Aj
					; DATA XREF: seg088:off_3F7BEo
		cmp	[bp+var_14], 0	; case 0x5
		jnz	short loc_3F5B0
		mov	ax, 1
		jmp	short loc_3F5B2
; ���������������������������������������������������������������������������

loc_3F5B0:				; CODE XREF: HUD_RenderSymbologyMain+E65j
		xor	ax, ax

loc_3F5B2:				; CODE XREF: HUD_RenderSymbologyMain+E6Aj
		or	al, al
		jnz	short loc_3F5B9
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F5B9:				; CODE XREF: HUD_RenderSymbologyMain+E70j
		call	DisplayCache_ComputeChecksum_5D43F
		mov	bx, 3E8h
		xor	dx, dx
		div	bx
		mov	[bp-46h], ax
		mov	ax, word_7047B
		cmp	ax, [bp-46h]
		jl	short loc_3F5D9
		cmp	word_722E6, si
		jz	short loc_3F5D9
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F5D9:				; CODE XREF: HUD_RenderSymbologyMain+E8Aj
					; HUD_RenderSymbologyMain+E90j
		push	0
		push	1
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		push	word ptr [bp+arg_0+2]
		push	ax
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_3F5FB
		jmp	loc_3F71E	; default
; ���������������������������������������������������������������������������

loc_3F5FB:				; CODE XREF: HUD_RenderSymbologyMain+EB2j
		cmp	word_722E6, si
		jz	short loc_3F605
		inc	word_7047B

loc_3F605:				; CODE XREF: HUD_RenderSymbologyMain+EBBj
		mov	ax, word ptr [bp+arg_8+2]
		mov	dx, word ptr [bp+arg_8]
		inc	dx
		mov	word ptr [bp+var_4A+2],	ax
		mov	word ptr [bp+var_4A], dx
		les	ax, [bp+var_4A]
		mov	word ptr [bp+var_4E+2],	ax
		mov	bx, word ptr [bp+var_4E+2]
		mov	eax, es:[bx]
		mov	[bp+var_F2], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_EE], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_EA], eax
		lea	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		lea	ax, [bp+var_F2]
		push	ax
		push	si
		push	di
		call	Particle_ComputeSpawnAtAttachPoint
		add	sp, 6
		mov	word ptr [bp+var_4E], si
		push	word ptr [bp+var_4E]
		mov	ax, di
		add	ax, 44h	; 'D'
		push	ax
		call	SetReference16
		add	sp, 4
		push	di
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		mov	[bp+var_50], di
		push	[bp+var_50]

loc_3F67F:
		mov	ax, word ptr [bp+arg_C]
		add	ax, 11h
		push	word ptr [bp+arg_C+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_3F691:
		cmp	si, word_722E6
		jnz	short loc_3F69E
		cmp	byte_72358, 0
		jnz	short loc_3F6BA

loc_3F69E:				; CODE XREF: HUD_RenderSymbologyMain+F51j
		les	bx, [di+0Eh]
		mov	ax, es:[bx+80h]
		mov	word ptr [bp+var_5C+2],	ax
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+13h]

loc_3F6B0:
		sub	ax, word ptr [bp+var_5C+2]

loc_3F6B3:
		mov	word ptr [bp+var_5C], ax

loc_3F6B6:
		mov	es:[bx+13h], ax

loc_3F6BA:				; CODE XREF: HUD_RenderSymbologyMain+F58j
		mov	[bp+var_21], 1

loc_3F6BE:
		push	0
		push	di
		push	si

loc_3F6C2:
		push	59CDh
		call	Mission_PlayerEventHandler
		add	sp, 8
		mov	ax, [di+10h]
		mov	dx, [di+0Eh]
		add	dx, 5Ah	; 'Z'
		mov	word ptr [bp+var_54+2],	ax
		mov	word ptr [bp+var_54], dx
		les	bx, [bp+var_54]
		mov	eax, es:[bx]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_14], eax
		cmp	si, word_722E6
		jnz	short loc_3F70C
		mov	bx, word_6E4B2
		mov	byte ptr [bx+21Fh], 1
		cmp	byte ptr [bx+21Ch], 0FFh
		jnz	short loc_3F70C
		mov	byte ptr [bx+21Ch], 0
		jmp	short $+2

loc_3F70C:				; CODE XREF: HUD_RenderSymbologyMain+FAFj
					; HUD_RenderSymbologyMain+FBFj
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_3F71E	; default
		push	si
		call	Pilot_NotifySubcomponentDestroy
		pop	cx

loc_3F71E:				; CODE XREF: HUD_RenderSymbologyMain+E9j
					; HUD_RenderSymbologyMain+125j ...
		les	bx, [bp+arg_C]	; default
		cmp	word ptr es:[bx+1Eh], 0
		jnz	short loc_3F770
		mov	di, 1
		jmp	short loc_3F767
; ���������������������������������������������������������������������������

loc_3F72D:				; CODE XREF: HUD_RenderSymbologyMain+102Aj
		les	bx, [bp+arg_C]
		cmp	es:[bx+38h], di
		jle	short loc_3F747
		mov	dx, es:[bx+36h]
		mov	ax, es:[bx+34h]
		mov	bx, di
		imul	bx, 23h
		add	ax, bx
		jmp	short loc_3F74B
; ���������������������������������������������������������������������������

loc_3F747:				; CODE XREF: HUD_RenderSymbologyMain+FF0j
		xor	dx, dx
		xor	ax, ax

loc_3F74B:				; CODE XREF: HUD_RenderSymbologyMain+1001j
		mov	[bp+var_40], dx
		mov	word ptr [bp+var_44+2],	ax
		les	bx, [bp+var_44+2]
		cmp	word ptr es:[bx+0Dh], 8
		jnz	short loc_3F766
		push	si
		push	dx
		push	ax
		call	VROOMM_StubThunk_6C39E
		add	sp, 6

loc_3F766:				; CODE XREF: HUD_RenderSymbologyMain+1015j
		inc	di

loc_3F767:				; CODE XREF: HUD_RenderSymbologyMain+FE7j
		les	bx, [bp+arg_C]
		cmp	es:[bx+38h], di
		jg	short loc_3F72D

loc_3F770:				; CODE XREF: HUD_RenderSymbologyMain+FE2j
		mov	eax, [bp+var_4]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		les	bx, [bp+arg_C]
		mov	es:[bx+24h], eax

loc_3F784:
		mov	eax, [bp+var_C]

loc_3F788:
		mov	[bp+var_36], eax

loc_3F78C:
		mov	eax, [bp+var_36]

loc_3F790:
		mov	es:[bx+28h], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	es:[bx+2Ch], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_3E], eax

loc_3F7AE:
		mov	eax, [bp+var_3E]
		mov	es:[bx+30h], eax
		mov	al, [bp+var_21]
		pop	di
		pop	si
		leave
		retf
HUD_RenderSymbologyMain	endp

; ���������������������������������������������������������������������������
off_3F7BE	dw offset loc_3EF1E	; DATA XREF: HUD_RenderSymbologyMain+12Ar
		dw offset loc_3F2C9	; jump table for switch	statement
		dw offset loc_3E873
		dw offset loc_3F71E
		dw offset loc_3F71E
		dw offset loc_3F5A4

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,83L — dispatch à 4 cas selon un type d'arme (+0x4F), appelle vtable[0x7C] avec des
; paramètres du viseur (+0xD) pour le cas 0 : rendu du réticule de tir selon le mode d'arme
; sélectionné (dispatché depuis le moteur HUD sub_3E744).
; ==============================================================================================
HUD_RenderReticleByWeaponType	proc far		; CODE XREF: AI_BehaviorSelector+1F3P
					; HUD_RenderSymbologyAlt+1105p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F84C
		mov	byte ptr es:[bx+0Fh], 0
		or	si, si
		jz	short loc_3F831	; default
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_3F831	; default
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		mov	al, es:[bx+4Fh]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_3F831	; default
		shl	bx, 1
		jmp	cs:off_3F851[bx] ; switch jump

loc_3F809:				; DATA XREF: seg088:off_3F851o
		les	bx, [bp+arg_0]	; case 0x0
		push	word ptr es:[bx+0Dh]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		jmp	short loc_3F82A
; ���������������������������������������������������������������������������

loc_3F81B:				; CODE XREF: HUD_RenderReticleByWeaponType+3Aj
					; DATA XREF: seg088:off_3F851o
		push	si		; case 0x2
		call	Debris_GetStateFlag
		jmp	short loc_3F829
; ���������������������������������������������������������������������������

loc_3F823:				; CODE XREF: HUD_RenderReticleByWeaponType+3Aj
					; DATA XREF: seg088:off_3F851o
		push	si		; case 0x3
		call	Debris_GetSubpartAttrib

loc_3F829:				; CODE XREF: HUD_RenderReticleByWeaponType+57j
		pop	cx

loc_3F82A:				; CODE XREF: HUD_RenderReticleByWeaponType+4Fj
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], al

loc_3F831:				; CODE XREF: HUD_RenderReticleByWeaponType+18j
					; HUD_RenderReticleByWeaponType+22j ...
		les	bx, [bp+arg_0]	; default
		mov	al, es:[bx+0Fh]
		push	ax
		push	word ptr es:[bx+0Dh]
		push	si
		push	large dword ptr	es:[bx]
		call	Targeting_SelectAndPrioritize
		add	sp, 0Ah
		jmp	short loc_3F84E
; ���������������������������������������������������������������������������

loc_3F84C:				; CODE XREF: HUD_RenderReticleByWeaponType+Fj
		xor	ax, ax

loc_3F84E:				; CODE XREF: HUD_RenderReticleByWeaponType+80j
		pop	si
		pop	bp
		retf
HUD_RenderReticleByWeaponType	endp

; ���������������������������������������������������������������������������
off_3F851	dw offset loc_3F809	; DATA XREF: HUD_RenderReticleByWeaponType+3Ar
		dw offset loc_3F809	; jump table for switch	statement
		dw offset loc_3F81B
		dw offset loc_3F823
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F87B
		push	word ptr es:[bx+0Dh]
		push	word ptr [bp+0Ah]
		push	large dword ptr	es:[bx]
		call	Proximity_TestOriented
		add	sp, 8
		jmp	short loc_3F87D
; ���������������������������������������������������������������������������

loc_3F87B:				; CODE XREF: seg088:1124j
		mov	al, 0

loc_3F87D:				; CODE XREF: seg088:1139j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — récupère une valeur via vtable[0x10] d'un sous-composant (+0x36) et la soustrait
; d'un accumulateur (+0x20) : décrément d'un compteur (probable munitions/carburant) selon un
; sous-système.
; ==============================================================================================
WeaponStation_DecrementCounter	proc far		; CODE XREF: HUD_RenderSymbologyMain+B5Ap
					; HUD_RenderSymbologyMain+C2Ap ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_4]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_3F8BD
		les	bx, [bp+var_4]
		mov	si, es:[bx+36h]
		or	si, si
		jz	short loc_3F8BD
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_3F8B1:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		sub	es:[bx+20h], eax

loc_3F8BD:				; CODE XREF: WeaponStation_DecrementCounter+17j
					; WeaponStation_DecrementCounter+22j
		pop	si
		leave
		retf
WeaponStation_DecrementCounter	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,2016 lignes. Structure quasi identique à sub_3E744 (mêmes offsets +0x24/28/2C/30, même
; seuil de bank 0x5A00, même test 'objet == joueur') : second moteur de rendu de symbologie
; HUD, variante probable pour le mode air-air/air-sol ou pour les cibles secondaires. Appelle
; sub_4114D (largage chaff/flare) et sub_40A33/sub_40D3B (résolution de stations d'armement).
; Bien trop volumineuse pour une passe rapide.
; ==============================================================================================
HUD_RenderSymbologyAlt	proc far		; CODE XREF: Camera_ResolvePositionVelocity_3DDC4+45P

var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= word ptr -58h
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
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp

loc_3F8C3:
		sub	sp, 96h
		push	si
		push	di
		mov	[bp+var_1], 0
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 24h	; '$'
		mov	word ptr [bp+var_A+2], ax
		mov	word ptr [bp+var_A], dx
		les	bx, [bp+var_A]
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 28h	; '('
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		les	bx, [bp+var_12]
		mov	eax, es:[bx]
		mov	[bp+var_E], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Ch	; ','
		mov	word ptr [bp+var_1A+2],	ax
		mov	word ptr [bp+var_1A], dx
		les	bx, [bp+var_1A]
		mov	eax, es:[bx]
		mov	[bp+var_16], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 30h	; '0'
		mov	word ptr [bp+var_22+2],	ax
		mov	word ptr [bp+var_22], dx
		les	bx, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6
		jnz	short loc_3F98F
		push	word_722E6
		mov	bx, word_722E6
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		call	AI_ComputeGeometrySolution_57C67
		add	sp, 6
		mov	eax, [bp+var_26]
		or	eax, eax
		jge	short loc_3F96A
		neg	eax

loc_3F96A:				; CODE XREF: HUD_RenderSymbologyAlt+A5j
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		cmp	[bp+var_2E], 5A00h
		jle	short loc_3F985
		mov	ax, 1
		jmp	short loc_3F987
; ���������������������������������������������������������������������������

loc_3F985:				; CODE XREF: HUD_RenderSymbologyAlt+BEj
		xor	ax, ax

loc_3F987:				; CODE XREF: HUD_RenderSymbologyAlt+C3j
		or	al, al
		jz	short loc_3F98F
		mov	[bp+var_1], 1

loc_3F98F:				; CODE XREF: HUD_RenderSymbologyAlt+80j
					; HUD_RenderSymbologyAlt+C9j
		les	bx, [bp+arg_0]

loc_3F992:
		cmp	dword ptr es:[bx+34h], 0
		jnz	short loc_3F99D
		jmp	loc_409E8
; ���������������������������������������������������������������������������

loc_3F99D:				; CODE XREF: HUD_RenderSymbologyAlt+D8j
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_3F9A8
		jmp	loc_409E8
; ���������������������������������������������������������������������������

loc_3F9A8:				; CODE XREF: HUD_RenderSymbologyAlt+E3j
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]

loc_3F9B3:
		imul	bx, 12h

loc_3F9B6:
		add	dx, bx

loc_3F9B8:
		mov	bx, word ptr [bp+arg_0]

loc_3F9BB:
		mov	es:[bx+1Ah], ax

loc_3F9BF:
		mov	es:[bx+18h], dx

loc_3F9C3:
		mov	eax, dword_70458

loc_3F9C7:
		sub	[bp+var_16], eax
		cmp	[bp+var_16], 0
		jge	short loc_3F9E2
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_16], eax

loc_3F9E2:				; CODE XREF: HUD_RenderSymbologyAlt+110j
		mov	eax, dword_70458
		sub	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jge	short loc_3FA01
		mov	[bp+var_36], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_E], eax

loc_3FA01:				; CODE XREF: HUD_RenderSymbologyAlt+12Fj
		mov	eax, dword_70458
		sub	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jge	short loc_3FA20
		mov	[bp+var_3A], 0
		mov	eax, [bp+var_3A]
		mov	[bp+var_6], eax

loc_3FA20:				; CODE XREF: HUD_RenderSymbologyAlt+14Ej
		mov	eax, dword_70458
		sub	[bp+var_1E], eax
		cmp	[bp+var_1E], 0
		jge	short loc_3FA3F
		mov	[bp+var_3E], 0
		mov	eax, [bp+var_3E]
		mov	[bp+var_1E], eax

loc_3FA3F:				; CODE XREF: HUD_RenderSymbologyAlt+16Dj
		mov	eax, [bp+arg_4]
		mov	[bp+var_52], eax
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+44h], 0
		jnz	short loc_3FA54
		jmp	loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FA54:				; CODE XREF: HUD_RenderSymbologyAlt+18Fj
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6C42F
		add	sp, 8
		or	al, al
		jnz	short loc_3FA6C
		jmp	loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FA6C:				; CODE XREF: HUD_RenderSymbologyAlt+1A7j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3FA78
		jmp	loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FA78:				; CODE XREF: HUD_RenderSymbologyAlt+1B3j
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_0+2]
		push	bx
		nop

loc_3FA85:
		push	cs
		call	near ptr WeaponStation_FindByTypeMask
		add	sp, 8
		or	ax, ax
		jnz	short loc_3FABB
		cmp	byte_72358, 0
		jnz	short loc_3FA9A
		jmp	loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FA9A:				; CODE XREF: HUD_RenderSymbologyAlt+1D5j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6
		jz	short loc_3FAAA
		jmp	loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FAAA:				; CODE XREF: HUD_RenderSymbologyAlt+1E5j
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al

loc_3FAB6:
		jnz	short loc_3FABB
		jmp	loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FABB:				; CODE XREF: HUD_RenderSymbologyAlt+1CEj
					; HUD_RenderSymbologyAlt:loc_3FAB6j
		les	bx, [bp+arg_0]

loc_3FABE:
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3FAD2
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3FAD4
; ���������������������������������������������������������������������������

loc_3FAD2:				; CODE XREF: HUD_RenderSymbologyAlt+207j
		xor	ax, ax

loc_3FAD4:				; CODE XREF: HUD_RenderSymbologyAlt+210j
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		xor	si, si
		cmp	[bp+var_56], 0
		jnz	short loc_3FAF3
		jmp	loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FAF3:				; CODE XREF: HUD_RenderSymbologyAlt+22Ej
		push	1
		push	large [bp+arg_0]
		push	dx
		push	ax
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large dword ptr	es:[bx+18h]
		push	ss
		lea	ax, [bp+var_5C+2]
		push	ax
		call	VROOMM_StubThunk_6C399
		add	sp, 16h
		mov	eax, [bp+var_5C+2]
		mov	[bp+var_E], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6
		jnz	short loc_3FB3F
		cmp	byte_72358, 0
		jz	short loc_3FB3F
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_3FB54

loc_3FB3F:				; CODE XREF: HUD_RenderSymbologyAlt+268j
					; HUD_RenderSymbologyAlt+26Fj
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr WeaponStation_DecrementCounter
		add	sp, 8
		jmp	short loc_3FB63
; ���������������������������������������������������������������������������

loc_3FB54:				; CODE XREF: HUD_RenderSymbologyAlt+27Dj
		les	bx, [bp+var_56]
		mov	ax, es:[bx+13h]
		inc	ax
		mov	word ptr [bp+var_5C], ax
		mov	es:[bx+13h], ax

loc_3FB63:				; CODE XREF: HUD_RenderSymbologyAlt+292j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3FB7A
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3FB7C
; ���������������������������������������������������������������������������

loc_3FB7A:				; CODE XREF: HUD_RenderSymbologyAlt+2AFj
		xor	ax, ax

loc_3FB7C:				; CODE XREF: HUD_RenderSymbologyAlt+2B8j
		push	ax
		push	large [bp+arg_0]

loc_3FB81:
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		cmp	[bp+var_56], 0
		jz	short loc_3FBFE
		push	1
		push	large [bp+arg_0]
		push	dx
		push	ax
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large dword ptr	es:[bx+18h]
		push	ss
		lea	ax, [bp+var_60]
		push	ax

loc_3FBB0:
		call	VROOMM_StubThunk_6C399
		add	sp, 16h
		les	bx, [bp+arg_0]

loc_3FBBB:
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6

loc_3FBC3:
		jnz	short loc_3FBEB
		cmp	byte_72358, 0
		jz	short loc_3FBEB
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jz	short loc_3FBEB
		les	bx, [bp+var_56]
		mov	ax, es:[bx+13h]
		inc	ax
		mov	word ptr [bp+var_64+2],	ax
		mov	es:[bx+13h], ax
		jmp	short loc_3FBFE
; ���������������������������������������������������������������������������

loc_3FBEB:				; CODE XREF: HUD_RenderSymbologyAlt:loc_3FBC3j
					; HUD_RenderSymbologyAlt+30Aj ...
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr WeaponStation_DecrementCounter
		add	sp, 8

loc_3FBFE:				; CODE XREF: HUD_RenderSymbologyAlt+191j
					; HUD_RenderSymbologyAlt+1A9j ...
		cmp	[bp+var_52], 0
		jnz	short loc_3FC08
		jmp	loc_409E8
; ���������������������������������������������������������������������������

loc_3FC08:				; CODE XREF: HUD_RenderSymbologyAlt+343j
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Bh]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jnz	short loc_3FC1C
		jmp	loc_3FCC9
; ���������������������������������������������������������������������������

loc_3FC1C:				; CODE XREF: HUD_RenderSymbologyAlt+357j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+56h], 0
		jz	short loc_3FC31
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponStation_ResolveStateB
		jmp	short loc_3FC3A
; ���������������������������������������������������������������������������

loc_3FC31:				; CODE XREF: HUD_RenderSymbologyAlt+364j
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr WeaponStation_ResolveStateA

loc_3FC3A:				; CODE XREF: HUD_RenderSymbologyAlt+36Fj
		add	sp, 4
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jnz	short loc_3FC4A
		jmp	loc_3FCC9
; ���������������������������������������������������������������������������

loc_3FC4A:				; CODE XREF: HUD_RenderSymbologyAlt+385j
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		cmp	[bp+var_56], 0
		jz	short loc_3FCC9
		les	bx, [bp+var_56]
		mov	al, es:[bx+11h]
		mov	byte ptr [bp+var_58], al
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+18h], 0
		jz	short loc_3FCC9
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3FC8D
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3FC8F
; ���������������������������������������������������������������������������

loc_3FC8D:				; CODE XREF: HUD_RenderSymbologyAlt+3C2j
		xor	ax, ax

loc_3FC8F:				; CODE XREF: HUD_RenderSymbologyAlt+3CBj
		cmp	ax, 800h
		jz	short loc_3FCC9
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3FCAB
		les	bx, es:[bx]
		mov	al, es:[bx+4Eh]
		jmp	short loc_3FCAD
; ���������������������������������������������������������������������������

loc_3FCAB:				; CODE XREF: HUD_RenderSymbologyAlt+3E0j
		mov	al, 1

loc_3FCAD:				; CODE XREF: HUD_RenderSymbologyAlt+3E9j
		mov	byte ptr [bp+var_5C+2],	al
		cmp	al, byte ptr [bp+var_58]
		jz	short loc_3FCC9

loc_3FCB5:
		push	0
		mov	ax, word ptr [bp+arg_0]

loc_3FCBA:
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_3FCC9:				; CODE XREF: HUD_RenderSymbologyAlt+359j
					; HUD_RenderSymbologyAlt+387j ...
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Ch]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jnz	short loc_3FCDD
		jmp	loc_3FDA5
; ���������������������������������������������������������������������������

loc_3FCDD:				; CODE XREF: HUD_RenderSymbologyAlt+418j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+56h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	es:[bx+56h], al
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3FD03
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3FD05
; ���������������������������������������������������������������������������

loc_3FD03:				; CODE XREF: HUD_RenderSymbologyAlt+438j
		xor	ax, ax

loc_3FD05:				; CODE XREF: HUD_RenderSymbologyAlt+441j
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+56h], 0
		jz	short loc_3FD9D
		cmp	byte ptr es:[bx+13h], 1
		jnz	short loc_3FD39
		mov	ax, es:[bx+6]
		cmp	ax, es:[bx]
		jz	short loc_3FD39
		cmp	[bp+var_56], 0
		jnz	short loc_3FD9D

loc_3FD39:				; CODE XREF: HUD_RenderSymbologyAlt+467j
					; HUD_RenderSymbologyAlt+470j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+55h], 1
		push	800h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponStation_ValidateReady
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3FD9D
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+55h], 0
		push	0F03h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponStation_ValidateReady
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3FD9D
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	es:[bx], ax
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		mov	byte ptr es:[bx+13h], 1

loc_3FD9D:				; CODE XREF: HUD_RenderSymbologyAlt+460j
					; HUD_RenderSymbologyAlt+477j ...
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+13h], 1

loc_3FDA5:				; CODE XREF: HUD_RenderSymbologyAlt+41Aj
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Bh]
		shr	ax, 4
		and	ax, 1
		or	al, al

loc_3FDB4:
		jnz	short loc_3FDB9

loc_3FDB6:
		jmp	loc_3FE89
; ���������������������������������������������������������������������������

loc_3FDB9:				; CODE XREF: HUD_RenderSymbologyAlt:loc_3FDB4j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]

loc_3FDC0:
		cmp	dword ptr es:[bx], 0

loc_3FDC5:
		jz	short loc_3FDD0

loc_3FDC7:
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3FDD2
; ���������������������������������������������������������������������������

loc_3FDD0:				; CODE XREF: HUD_RenderSymbologyAlt:loc_3FDC5j
		xor	ax, ax

loc_3FDD2:				; CODE XREF: HUD_RenderSymbologyAlt+50Ej
		cmp	ax, 800h
		jnz	short loc_3FDDA
		jmp	loc_3FE89
; ���������������������������������������������������������������������������

loc_3FDDA:				; CODE XREF: HUD_RenderSymbologyAlt+515j
		mov	si, 1
		jmp	short loc_3FE5A
; ���������������������������������������������������������������������������

loc_3FDDF:				; CODE XREF: HUD_RenderSymbologyAlt+5A3j
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jle	short loc_3FDF9
		mov	dx, es:[bx+36h]
		mov	ax, es:[bx+34h]
		mov	bx, si
		imul	bx, 23h
		add	ax, bx
		jmp	short loc_3FDFD
; ���������������������������������������������������������������������������

loc_3FDF9:				; CODE XREF: HUD_RenderSymbologyAlt+526j
		xor	dx, dx
		xor	ax, ax

loc_3FDFD:				; CODE XREF: HUD_RenderSymbologyAlt+537j
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3FE1A
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3FE1C
; ���������������������������������������������������������������������������

loc_3FE1A:				; CODE XREF: HUD_RenderSymbologyAlt+54Fj
		xor	ax, ax

loc_3FE1C:				; CODE XREF: HUD_RenderSymbologyAlt+558j
		les	bx, [bp+var_56]
		cmp	ax, es:[bx+0Dh]
		jnz	short loc_3FE59
		xor	di, di
		jmp	short loc_3FE3D
; ���������������������������������������������������������������������������

loc_3FE29:				; CODE XREF: HUD_RenderSymbologyAlt+584j
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr WeaponStation_DecrementCounter
		add	sp, 8
		inc	di

loc_3FE3D:				; CODE XREF: HUD_RenderSymbologyAlt+567j
		les	bx, [bp+var_56]
		cmp	es:[bx+13h], di
		jg	short loc_3FE29
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_56]
		call	VROOMM_StubThunk_6C39E
		add	sp, 6

loc_3FE59:				; CODE XREF: HUD_RenderSymbologyAlt+563j
		inc	si

loc_3FE5A:				; CODE XREF: HUD_RenderSymbologyAlt+51Dj
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], si
		jle	short loc_3FE66
		jmp	loc_3FDDF
; ���������������������������������������������������������������������������

loc_3FE66:				; CODE XREF: HUD_RenderSymbologyAlt+5A1j
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx+6]
		imul	bx, 12h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		mov	ax, es:[bx+6]
		mov	es:[bx], ax

loc_3FE89:				; CODE XREF: HUD_RenderSymbologyAlt:loc_3FDB6j
					; HUD_RenderSymbologyAlt+517j
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Bh]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_3FE9D
		jmp	loc_3FF5B
; ���������������������������������������������������������������������������

loc_3FE9D:				; CODE XREF: HUD_RenderSymbologyAlt+5D8j
		xor	si, si
		jmp	loc_3FF2C
; ���������������������������������������������������������������������������

loc_3FEA2:				; CODE XREF: HUD_RenderSymbologyAlt+675j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, si

loc_3FEAF:
		imul	bx, 12h
		add	dx, bx
		mov	word ptr [bp+var_56+2],	ax

loc_3FEB7:
		mov	word ptr [bp+var_56], dx
		les	bx, [bp+var_56]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3FECD
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_3FECF
; ���������������������������������������������������������������������������

loc_3FECD:				; CODE XREF: HUD_RenderSymbologyAlt+602j
		xor	ax, ax

loc_3FECF:				; CODE XREF: HUD_RenderSymbologyAlt+60Bj
		mov	di, ax
		test	di, 0F03h
		jnz	short loc_3FF2B
		jmp	short loc_3FF11
; ���������������������������������������������������������������������������

loc_3FED9:				; CODE XREF: HUD_RenderSymbologyAlt+669j
		mov	word ptr [bp+var_5C], 0
		jmp	short loc_3FEF2
; ���������������������������������������������������������������������������

loc_3FEE0:				; CODE XREF: HUD_RenderSymbologyAlt+63Cj
		push	large [bp+var_56]
		push	large [bp+arg_0]
		push	cs
		call	near ptr WeaponStation_DecrementCounter
		add	sp, 8
		inc	word ptr [bp+var_5C]

loc_3FEF2:				; CODE XREF: HUD_RenderSymbologyAlt+61Ej
		les	bx, [bp+var_5C+2]
		mov	ax, es:[bx+13h]
		cmp	ax, word ptr [bp+var_5C]
		jg	short loc_3FEE0
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_5C+2]
		call	VROOMM_StubThunk_6C39E
		add	sp, 6

loc_3FF11:				; CODE XREF: HUD_RenderSymbologyAlt+617j
		push	di
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	[bp+var_58], dx
		mov	word ptr [bp+var_5C+2],	ax
		cmp	[bp+var_5C+2], 0
		jnz	short loc_3FED9

loc_3FF2B:				; CODE XREF: HUD_RenderSymbologyAlt+615j
		inc	si

loc_3FF2C:				; CODE XREF: HUD_RenderSymbologyAlt+5DFj
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_3FF38
		jmp	loc_3FEA2
; ���������������������������������������������������������������������������

loc_3FF38:				; CODE XREF: HUD_RenderSymbologyAlt+673j
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx+6]
		imul	bx, 12h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		mov	ax, es:[bx+6]
		mov	es:[bx], ax

loc_3FF5B:				; CODE XREF: HUD_RenderSymbologyAlt+5DAj
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Ch]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_3FF83
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+3Ch], 0
		jz	short loc_3FF83
		push	1
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Countermeasure_DeployChaffFlare
		add	sp, 6

loc_3FF83:				; CODE XREF: HUD_RenderSymbologyAlt+6A9j
					; HUD_RenderSymbologyAlt+6B3j
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Ch]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_3FFAC
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+3Ah], 0
		jz	short loc_3FFAC
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Countermeasure_DeployChaffFlare
		add	sp, 6

loc_3FFAC:				; CODE XREF: HUD_RenderSymbologyAlt+6D2j
					; HUD_RenderSymbologyAlt+6DCj
		les	bx, [bp+var_52]

loc_3FFAF:
		mov	al, es:[bx+1Bh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_3FFBF
		jmp	loc_401C5
; ���������������������������������������������������������������������������

loc_3FFBF:				; CODE XREF: HUD_RenderSymbologyAlt+6FAj
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+18h]
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponStation_FindByTypeMask
		add	sp, 8
		or	ax, ax
		jnz	short loc_40002
		cmp	byte_72358, 0
		jnz	short loc_3FFE1
		jmp	loc_401C5
; ���������������������������������������������������������������������������

loc_3FFE1:				; CODE XREF: HUD_RenderSymbologyAlt+71Cj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6
		jz	short loc_3FFF1
		jmp	loc_401C5
; ���������������������������������������������������������������������������

loc_3FFF1:				; CODE XREF: HUD_RenderSymbologyAlt+72Cj
		push	word_706A0
		call	HUD_ResolveNodePosition_547B1
		pop	cx
		or	al, al
		jnz	short loc_40002
		jmp	loc_401C5
; ���������������������������������������������������������������������������

loc_40002:				; CODE XREF: HUD_RenderSymbologyAlt+715j
					; HUD_RenderSymbologyAlt+73Dj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40019
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_4001B
; ���������������������������������������������������������������������������

loc_40019:				; CODE XREF: HUD_RenderSymbologyAlt+74Ej
		xor	ax, ax

loc_4001B:				; CODE XREF: HUD_RenderSymbologyAlt+757j
		mov	word ptr [bp+var_56+2],	ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	word ptr [bp+var_56], dx
		mov	[bp+var_58], ax
		test	word ptr [bp+var_56+2],	800h
		jnz	short loc_4003B
		jmp	loc_400CA
; ���������������������������������������������������������������������������

loc_4003B:				; CODE XREF: HUD_RenderSymbologyAlt+776j
		les	bx, [bp+arg_0]
		mov	si, es:[bx+9]
		add	si, 12h
		mov	di, word_72A8F
		add	di, 14h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_96], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_92], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		push	eax
		push	large [bp+var_86]
		push	large [bp+var_8A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_60], eax
		mov	[bp-64h], eax
		sar	eax, 8

loc_400B3:
		mov	[bp+var_5C], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	eax
		push	2

loc_400C2:
		call	Weapon_HUDBox_TimerCaseI_5A906
		add	sp, 8

loc_400CA:				; CODE XREF: HUD_RenderSymbologyAlt+778j
		cmp	dword ptr [bp-58h], 0
		jnz	short loc_400D4
		jmp	loc_40191
; ���������������������������������������������������������������������������

loc_400D4:				; CODE XREF: HUD_RenderSymbologyAlt+80Fj
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Bh], 0
		jz	short loc_400E4
		mov	bx, es:[bx+0Dh]
		jmp	short loc_400E6
; ���������������������������������������������������������������������������

loc_400E4:				; CODE XREF: HUD_RenderSymbologyAlt+81Cj
		xor	bx, bx

loc_400E6:				; CODE XREF: HUD_RenderSymbologyAlt+822j
		push	large [bp+arg_0]
		push	large dword ptr	[bp-58h]
		push	bx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large dword ptr	es:[bx+18h]
		push	cs
		call	near ptr HUD_RenderSymbologyMain
		add	sp, 10h
		or	al, al
		jnz	short loc_40109
		jmp	loc_40191
; ���������������������������������������������������������������������������

loc_40109:				; CODE XREF: HUD_RenderSymbologyAlt+844j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 24h	; '$'
		mov	word ptr [bp+var_5C+2],	ax
		mov	word ptr [bp+var_5C], dx
		les	bx, [bp+var_5C]
		mov	eax, es:[bx]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_6], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 28h	; '('
		mov	word ptr [bp+var_64+2],	ax
		mov	word ptr [bp+var_64], dx
		les	bx, [bp+var_64]
		mov	eax, es:[bx]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_E], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Ch	; ','
		mov	word ptr [bp+var_6C+2],	ax
		mov	word ptr [bp+var_6C], dx
		les	bx, [bp+var_6C]
		mov	eax, es:[bx]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_16], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 30h	; '0'
		mov	word ptr [bp+var_74+2],	ax
		mov	word ptr [bp+var_74], dx
		les	bx, [bp+var_74]
		mov	eax, es:[bx]
		mov	[bp+var_7A+2], eax
		mov	eax, [bp+var_7A+2]
		mov	[bp+var_1E], eax

loc_40191:				; CODE XREF: HUD_RenderSymbologyAlt+811j
					; HUD_RenderSymbologyAlt+846j
		push	word ptr [bp+var_56+2]
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		or	ax, dx
		jnz	short loc_401D6
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx+6]

loc_401B3:
		imul	bx, 12h
		add	dx, bx

loc_401B8:
		mov	bx, word ptr [bp+arg_0]

loc_401BB:
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		jmp	short loc_401D6
; ���������������������������������������������������������������������������

loc_401C5:				; CODE XREF: HUD_RenderSymbologyAlt+6FCj
					; HUD_RenderSymbologyAlt+71Ej ...
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	2
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4

loc_401D6:				; CODE XREF: HUD_RenderSymbologyAlt+8E2j
					; HUD_RenderSymbologyAlt+903j
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Ch]
		and	ax, 1
		or	al, al
		jz	short loc_401F8
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_401F8:				; CODE XREF: HUD_RenderSymbologyAlt+922j
		cmp	byte_72363, 0
		jnz	short loc_40202
		jmp	loc_40483
; ���������������������������������������������������������������������������

loc_40202:				; CODE XREF: HUD_RenderSymbologyAlt+93Dj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_4020F
		jmp	loc_40483
; ���������������������������������������������������������������������������

loc_4020F:				; CODE XREF: HUD_RenderSymbologyAlt+94Aj
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40223
		les	bx, es:[bx]
		mov	al, es:[bx+4Fh]
		jmp	short loc_40225
; ���������������������������������������������������������������������������

loc_40223:				; CODE XREF: HUD_RenderSymbologyAlt+958j
		mov	al, 0

loc_40225:				; CODE XREF: HUD_RenderSymbologyAlt+961j
		or	al, al
		jnz	short loc_4024A
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40240
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40242
; ���������������������������������������������������������������������������

loc_40240:				; CODE XREF: HUD_RenderSymbologyAlt+975j
		xor	ax, ax

loc_40242:				; CODE XREF: HUD_RenderSymbologyAlt+97Ej
		cmp	ax, 800h
		jz	short loc_4024A
		jmp	loc_40483
; ���������������������������������������������������������������������������

loc_4024A:				; CODE XREF: HUD_RenderSymbologyAlt+967j
					; HUD_RenderSymbologyAlt+985j
		mov	byte ptr [bp+var_56+3],	0
		xor	si, si

loc_40250:				; CODE XREF: HUD_RenderSymbologyAlt+BA3j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+13h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4026D
		cmp	ax, 1
		jz	short loc_40288
		cmp	ax, 2
		jnz	short loc_4026A
		jmp	loc_40383
; ���������������������������������������������������������������������������

loc_4026A:				; CODE XREF: HUD_RenderSymbologyAlt+9A5j
		jmp	loc_40451
; ���������������������������������������������������������������������������

loc_4026D:				; CODE XREF: HUD_RenderSymbologyAlt+99Bj
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	byte ptr [bp+var_56+3],	1
		jmp	loc_40451
; ���������������������������������������������������������������������������

loc_40288:				; CODE XREF: HUD_RenderSymbologyAlt+9A0j
		or	si, si
		jz	short loc_402C5
		push	1
		push	1
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+42h]
		push	large dword ptr	es:[bx+3Eh]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	word ptr [bp+var_56], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_402C5:				; CODE XREF: HUD_RenderSymbologyAlt+9CAj
		or	si, si
		jnz	short loc_40306
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Dh]
		push	1
		push	1
		push	word ptr es:[bx+42h]
		push	large dword ptr	es:[bx+3Eh]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	[bp+var_58], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_40306:				; CODE XREF: HUD_RenderSymbologyAlt+A07j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_4036F
		cmp	byte_7235A, 0
		jz	short loc_4036F
		mov	bx, es:[bx+0Dh]
		mov	al, [bx+50h]
		mov	byte ptr [bp+var_5C+2],	al
		cmp	byte ptr [bp+var_5C+2],	0FFh
		jz	short loc_4032D
		cmp	byte ptr [bp+var_5C+2],	0
		jnz	short loc_40373

loc_4032D:				; CODE XREF: HUD_RenderSymbologyAlt+A65j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_4036F
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Dh]
		push	word ptr [bx+51h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40373
		jmp	short $+2

loc_4036F:				; CODE XREF: HUD_RenderSymbologyAlt+A4Ej
					; HUD_RenderSymbologyAlt+A55j ...
		mov	byte ptr [bp+var_56+3],	1

loc_40373:				; CODE XREF: HUD_RenderSymbologyAlt+A6Bj
					; HUD_RenderSymbologyAlt+AABj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_40380
		jmp	loc_40451
; ���������������������������������������������������������������������������

loc_40380:				; CODE XREF: HUD_RenderSymbologyAlt+ABBj
		jmp	loc_4044D
; ���������������������������������������������������������������������������

loc_40383:				; CODE XREF: HUD_RenderSymbologyAlt+9A7j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	eax, es:[bx+50h]
		mov	[bp+var_5C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	di, es:[bx+54h]
		or	si, si
		jz	short loc_403DB
		push	1
		push	2
		push	di
		push	eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	word ptr [bp+var_60+2],	ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_403DB:				; CODE XREF: HUD_RenderSymbologyAlt+AE6j
		or	si, si
		jnz	short loc_40418
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Dh]
		push	1
		push	2
		push	di
		push	large [bp+var_5C]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	word ptr [bp+var_60], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_40418:				; CODE XREF: HUD_RenderSymbologyAlt+B1Dj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_4043F
		cmp	byte_7235A, 0
		jz	short loc_4043F
		mov	bx, es:[bx+0Dh]
		mov	al, [bx+50h]
		mov	byte ptr [bp+var_64+2],	al
		cmp	byte ptr [bp+var_64+2],	0FFh
		jz	short loc_4043F
		cmp	byte ptr [bp+var_64+2],	0
		jnz	short loc_40443

loc_4043F:				; CODE XREF: HUD_RenderSymbologyAlt+B60j
					; HUD_RenderSymbologyAlt+B67j ...
		mov	byte ptr [bp+var_56+3],	1

loc_40443:				; CODE XREF: HUD_RenderSymbologyAlt+B7Dj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jnz	short loc_40451

loc_4044D:				; CODE XREF: HUD_RenderSymbologyAlt:loc_40380j
		mov	byte ptr [bp+var_56+3],	0

loc_40451:				; CODE XREF: HUD_RenderSymbologyAlt:loc_4026Aj
					; HUD_RenderSymbologyAlt+9C5j ...
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Dh], si
		jz	short loc_40466
		mov	al, byte ptr [bp+var_56+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40466
		jmp	loc_40250
; ���������������������������������������������������������������������������

loc_40466:				; CODE XREF: HUD_RenderSymbologyAlt+B98j
					; HUD_RenderSymbologyAlt+BA1j
		mov	al, byte ptr [bp+var_56+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40483
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_40483:				; CODE XREF: HUD_RenderSymbologyAlt+93Fj
					; HUD_RenderSymbologyAlt+94Cj ...
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_4049A
		les	bx, es:[bx]
		mov	al, es:[bx+4Fh]
		jmp	short loc_4049C
; ���������������������������������������������������������������������������

loc_4049A:				; CODE XREF: HUD_RenderSymbologyAlt+BCFj
		mov	al, 0

loc_4049C:				; CODE XREF: HUD_RenderSymbologyAlt+BD8j
		or	al, al
		jnz	short loc_404C1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_404B7
		les	bx, es:[bx]

loc_404B1:
		mov	ax, es:[bx+4Bh]

loc_404B5:
		jmp	short loc_404B9
; ���������������������������������������������������������������������������

loc_404B7:				; CODE XREF: HUD_RenderSymbologyAlt+BECj
		xor	ax, ax

loc_404B9:				; CODE XREF: HUD_RenderSymbologyAlt:loc_404B5j
		cmp	ax, 800h
		jz	short loc_404C1
		jmp	loc_407AE
; ���������������������������������������������������������������������������

loc_404C1:				; CODE XREF: HUD_RenderSymbologyAlt+BDEj
					; HUD_RenderSymbologyAlt+BFCj
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Bh]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_404E3
		mov	al, es:[bx+1Bh]
		shr	ax, 7
		and	ax, 1
		or	al, al
		jnz	short loc_404E3
		jmp	loc_407AE
; ���������������������������������������������������������������������������

loc_404E3:				; CODE XREF: HUD_RenderSymbologyAlt+C10j
					; HUD_RenderSymbologyAlt+C1Ej
		les	bx, [bp+var_52]
		mov	al, es:[bx+1Bh]
		shr	ax, 6
		and	ax, 1
		mov	byte ptr [bp+var_56+3],	al
		mov	byte ptr [bp+var_56+2],	0
		les	bx, [bp+arg_0]
		mov	di, es:[bx+0Dh]
		xor	si, si
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_40514:				; CODE XREF: HUD_RenderSymbologyAlt+EC4j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+13h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_40531
		cmp	ax, 1
		jz	short loc_4054C
		cmp	ax, 2
		jnz	short loc_4052E
		jmp	loc_40672
; ���������������������������������������������������������������������������

loc_4052E:				; CODE XREF: HUD_RenderSymbologyAlt+C69j
		jmp	loc_40772
; ���������������������������������������������������������������������������

loc_40531:				; CODE XREF: HUD_RenderSymbologyAlt+C5Fj
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	byte ptr [bp+var_56+2],	1
		jmp	loc_40772
; ���������������������������������������������������������������������������

loc_4054C:				; CODE XREF: HUD_RenderSymbologyAlt+C64j
		or	si, si
		jz	short loc_4057B
		mov	al, byte ptr [bp+var_56+3]
		push	ax
		push	1
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+42h]
		push	large dword ptr	es:[bx+3Eh]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	word ptr [bp+var_56], ax
		push	ax
		jmp	short loc_405A1
; ���������������������������������������������������������������������������

loc_4057B:				; CODE XREF: HUD_RenderSymbologyAlt+C8Ej
		mov	al, byte ptr [bp+var_56+3]
		push	ax
		push	1
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+42h]
		push	large dword ptr	es:[bx+3Eh]
		push	di
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	[bp+var_58], ax
		push	ax

loc_405A1:				; CODE XREF: HUD_RenderSymbologyAlt+CB9j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		or	si, si
		jnz	short loc_405F6
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Dh]

loc_405BE:
		mov	al, byte ptr [bp+var_56+3]
		push	ax

loc_405C2:
		push	1
		push	word ptr es:[bx+42h]

loc_405C8:
		push	large dword ptr	es:[bx+3Eh]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	word ptr [bp+var_5C+2],	ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_405F6:				; CODE XREF: HUD_RenderSymbologyAlt+CF5j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_4065F
		cmp	byte_7235A, 0
		jz	short loc_4065F
		mov	bx, es:[bx+0Dh]
		mov	al, [bx+50h]
		mov	byte ptr [bp+var_60+2],	al
		cmp	byte ptr [bp+var_60+2],	0FFh
		jz	short loc_4061D
		cmp	byte ptr [bp+var_60+2],	0
		jnz	short loc_40663

loc_4061D:				; CODE XREF: HUD_RenderSymbologyAlt+D55j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_4065F
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Dh]
		push	word ptr [bx+51h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40663
		jmp	short $+2

loc_4065F:				; CODE XREF: HUD_RenderSymbologyAlt+D3Ej
					; HUD_RenderSymbologyAlt+D45j ...
		mov	byte ptr [bp+var_56+2],	1

loc_40663:				; CODE XREF: HUD_RenderSymbologyAlt+D5Bj
					; HUD_RenderSymbologyAlt+D9Bj
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Dh], di
		jz	short loc_4066F
		jmp	loc_40772
; ���������������������������������������������������������������������������

loc_4066F:				; CODE XREF: HUD_RenderSymbologyAlt+DAAj
		jmp	loc_4076E
; ���������������������������������������������������������������������������

loc_40672:				; CODE XREF: HUD_RenderSymbologyAlt+C6Bj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	eax, es:[bx+50h]
		mov	[bp+var_60], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	ax, es:[bx+54h]
		mov	word ptr [bp+var_64+2],	ax
		or	si, si
		jz	short loc_406C3
		mov	al, byte ptr [bp+var_56+3]
		push	ax
		push	2
		push	word ptr [bp+var_64+2]
		push	large [bp+var_60]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h

loc_406B5:
		call	WorldObjects_Cluster_22795

loc_406BA:
		add	sp, 10h
		mov	word ptr [bp+var_64], ax
		push	ax

loc_406C1:
		jmp	short loc_406E7
; ���������������������������������������������������������������������������

loc_406C3:				; CODE XREF: HUD_RenderSymbologyAlt+DD8j
		mov	al, byte ptr [bp+var_56+3]
		push	ax
		push	2
		push	word ptr [bp+var_64+2]
		push	large [bp+var_60]
		push	di
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	word ptr [bp+var_68+2],	ax
		push	ax

loc_406E7:				; CODE XREF: HUD_RenderSymbologyAlt:loc_406C1j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		or	si, si
		jnz	short loc_4073A
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Dh]
		mov	al, byte ptr [bp+var_56+3]
		push	ax
		push	2
		push	word ptr [bp+var_64+2]
		push	large [bp+var_60]
		push	word ptr es:[bx+0Dh]
		push	word ptr es:[bx+9]
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	word ptr [bp+var_68], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_4073A:				; CODE XREF: HUD_RenderSymbologyAlt+E3Bj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_40761
		cmp	byte_7235A, 0
		jz	short loc_40761
		mov	bx, es:[bx+0Dh]
		mov	al, [bx+50h]
		mov	byte ptr [bp+var_6C+2],	al
		cmp	byte ptr [bp+var_6C+2],	0FFh
		jz	short loc_40761
		cmp	byte ptr [bp+var_6C+2],	0
		jnz	short loc_40765

loc_40761:				; CODE XREF: HUD_RenderSymbologyAlt+E82j
					; HUD_RenderSymbologyAlt+E89j ...
		mov	byte ptr [bp+var_56+2],	1

loc_40765:				; CODE XREF: HUD_RenderSymbologyAlt+E9Fj
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Dh], di
		jnz	short loc_40772

loc_4076E:				; CODE XREF: HUD_RenderSymbologyAlt:loc_4066Fj
		mov	byte ptr [bp+var_56+2],	0

loc_40772:				; CODE XREF: HUD_RenderSymbologyAlt:loc_4052Ej
					; HUD_RenderSymbologyAlt+C89j ...
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Dh], si
		jz	short loc_40787
		mov	al, byte ptr [bp+var_56+2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40787
		jmp	loc_40514
; ���������������������������������������������������������������������������

loc_40787:				; CODE XREF: HUD_RenderSymbologyAlt+EB9j
					; HUD_RenderSymbologyAlt+EC2j
		mov	al, byte ptr [bp+var_56+2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_40793
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_40793:				; CODE XREF: HUD_RenderSymbologyAlt+ECEj
		mov	word ptr [bp+var_5C], di
		push	word ptr [bp+var_5C]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_407AE:				; CODE XREF: HUD_RenderSymbologyAlt+BFEj
					; HUD_RenderSymbologyAlt+C20j
		les	bx, [bp+arg_0]

loc_407B1:
		cmp	word ptr es:[bx+0Dh], 0
		jnz	short loc_407BB
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_407BB:				; CODE XREF: HUD_RenderSymbologyAlt+EF6j
		push	word ptr es:[bx+42h]

loc_407BF:
		push	large dword ptr	es:[bx+3Eh]

loc_407C4:
		push	word ptr es:[bx+9]
		mov	bx, es:[bx+9]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		add	ax, 12h
		push	ax
		push	word ptr es:[bx+0Dh]
		call	Proximity_TestPoints
		add	sp, 0Ch
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4081B
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6
		jnz	short loc_40807
		cmp	byte_6D8AC, 0
		jnz	short loc_4081B

loc_40807:				; CODE XREF: HUD_RenderSymbologyAlt+F3Ej
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_4081B:				; CODE XREF: HUD_RenderSymbologyAlt+F31j
					; HUD_RenderSymbologyAlt+F45j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40832
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40834
; ���������������������������������������������������������������������������

loc_40832:				; CODE XREF: HUD_RenderSymbologyAlt+F67j
		xor	ax, ax

loc_40834:				; CODE XREF: HUD_RenderSymbologyAlt+F70j
		cmp	ax, 800h
		jz	short loc_4083C
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_4083C:				; CODE XREF: HUD_RenderSymbologyAlt+F77j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Dh], 0
		jnz	short loc_40849
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_40849:				; CODE XREF: HUD_RenderSymbologyAlt+F84j
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_4085E
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_4085E:				; CODE XREF: HUD_RenderSymbologyAlt+F99j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_722E6
		jz	short loc_4086E
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_4086E:				; CODE XREF: HUD_RenderSymbologyAlt+FA9j
		cmp	byte_72359, 0
		jnz	short loc_40878
		jmp	loc_409B8
; ���������������������������������������������������������������������������

loc_40878:				; CODE XREF: HUD_RenderSymbologyAlt+FB3j
		mov	[bp+var_60+2], 1000h
		mov	eax, [bp+var_60+2]
		mov	[bp+var_5C+2], eax
		mov	[bp+var_64+2], 1F400h
		mov	eax, [bp+var_64+2]
		mov	[bp+var_56], eax
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_64], dx
		mov	word ptr [bp+var_68+2],	ax
		les	bx, [bp+var_68+2]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	word ptr [bp+var_68], ax
		mov	word ptr [bp+var_6C+2],	dx
		les	bx, [bp+var_6C+2]

loc_408C2:
		mov	eax, es:[bx]
		sar	eax, 8
		mov	[bp+var_70+2], eax
		mov	eax, [bp+var_56]
		imul	eax, [bp+var_70+2]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	edx, eax
		mov	ecx, [bp+var_5C+2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_56], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Dh]
		add	si, 12h
		mov	di, es:[bx+9]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_96], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_92], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		push	eax
		push	large [bp+var_86]
		push	large [bp+var_8A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-76h], eax
		mov	[bp+var_74+2], eax
		cmp	eax, [bp+var_56]
		jl	short loc_40974
		mov	ax, 1
		jmp	short loc_40976
; ���������������������������������������������������������������������������

loc_40974:				; CODE XREF: HUD_RenderSymbologyAlt+10ADj
		xor	ax, ax

loc_40976:				; CODE XREF: HUD_RenderSymbologyAlt+10B2j
		or	al, al
		jz	short loc_4099A
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_7A+2],	dx
		mov	word ptr [bp+var_7A], ax
		les	bx, [bp+var_7A]
		mov	byte ptr es:[bx+0Ch], 1
		jmp	short loc_409B8
; ���������������������������������������������������������������������������

loc_4099A:				; CODE XREF: HUD_RenderSymbologyAlt+10B8j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_7E+2],	dx
		mov	word ptr [bp+var_7E], ax
		les	bx, [bp+var_7E]
		mov	byte ptr es:[bx+0Ch], 0

loc_409B8:				; CODE XREF: HUD_RenderSymbologyAlt+ED0j
					; HUD_RenderSymbologyAlt+EEBj ...
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Dh]
		push	large dword ptr	es:[bx+18h]
		push	cs
		call	near ptr HUD_RenderReticleByWeaponType
		add	sp, 6
		mov	word ptr [bp+var_56+2],	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Dh]
		cmp	ax, word ptr [bp+var_56+2]
		jnz	short loc_409DF
		mov	ax, 1
		jmp	short loc_409E1
; ���������������������������������������������������������������������������

loc_409DF:				; CODE XREF: HUD_RenderSymbologyAlt+1118j
		xor	ax, ax

loc_409E1:				; CODE XREF: HUD_RenderSymbologyAlt+111Dj
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], al

loc_409E8:				; CODE XREF: HUD_RenderSymbologyAlt+DAj
					; HUD_RenderSymbologyAlt+E5j ...
		mov	eax, [bp+var_6]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	es:[bx+28h], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+2Ch], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	es:[bx+30h], eax
		pop	di
		pop	si
		leave
		retf
HUD_RenderSymbologyAlt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,397L — parcourt un tableau de stations d'armement (index ×0x12), résout le type de
; munition (+0x4E) et son statut (+0x4B) : résolution de l'état des stations d'armement
; (hardpoints) pour l'affichage HUD/sélection d'arme.
; ==============================================================================================
WeaponStation_ResolveStateA	proc far		; CODE XREF: HUD_RenderSymbologyAlt+377p

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= byte ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40A66
		les	bx, es:[bx]
		mov	al, es:[bx+4Eh]
		jmp	short loc_40A68
; ���������������������������������������������������������������������������

loc_40A66:				; CODE XREF: WeaponStation_ResolveStateA+28j
		mov	al, 1

loc_40A68:				; CODE XREF: WeaponStation_ResolveStateA+31j
		mov	[bp+var_6], al
		mov	[bp+var_7], 1
		les	bx, [bp+arg_0]

loc_40A72:
		cmp	dword ptr es:[bx+18h], 0
		jnz	short loc_40A7D

loc_40A7A:
		jmp	loc_40B55
; ���������������������������������������������������������������������������

loc_40A7D:				; CODE XREF: WeaponStation_ResolveStateA+45j
		les	bx, es:[bx+18h]

loc_40A81:
		cmp	dword ptr es:[bx], 0

loc_40A86:
		jz	short loc_40A91
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40A93
; ���������������������������������������������������������������������������

loc_40A91:				; CODE XREF: WeaponStation_ResolveStateA:loc_40A86j
		xor	ax, ax

loc_40A93:				; CODE XREF: WeaponStation_ResolveStateA+5Cj
		mov	dx, ax
		cmp	dx, 800h
		jnz	short loc_40B00
		les	bx, [bp+arg_0]
		mov	al, es:[bx+55h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40AF2
		mov	byte ptr es:[bx+13h], 1

loc_40AAD:
		mov	byte ptr es:[bx+55h], 1

loc_40AB2:
		mov	ax, es:[bx+0Fh]

loc_40AB6:
		mov	[bp+var_A], ax

loc_40AB9:
		mov	ax, es:[bx+0Dh]

loc_40ABD:
		mov	[bp+var_C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]

loc_40AC4:
		add	ax, 0Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_E], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_40AEC:				; CODE XREF: WeaponStation_ResolveStateA+111j
		mov	[bp+var_7], 0
		jmp	short loc_40B55
; ���������������������������������������������������������������������������

loc_40AF2:				; CODE XREF: WeaponStation_ResolveStateA+73j
		mov	[bp+var_6], 1
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+55h], 0
		jmp	short loc_40B55
; ���������������������������������������������������������������������������

loc_40B00:				; CODE XREF: WeaponStation_ResolveStateA+66j
		cmp	dx, 10h
		jl	short loc_40B55
		cmp	dx, 20h	; ' '
		jg	short loc_40B55
		push	dx
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_40B55
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		cmp	byte ptr es:[bx+4Dh], 4
		jnz	short loc_40B46
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	byte ptr es:[bx+4Dh], 5
		jmp	short loc_40AEC
; ���������������������������������������������������������������������������

loc_40B46:				; CODE XREF: WeaponStation_ResolveStateA+100j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	byte ptr es:[bx+4Dh], 4

loc_40B55:				; CODE XREF: WeaponStation_ResolveStateA:loc_40A7Aj
					; WeaponStation_ResolveStateA+BDj ...
		cmp	[bp+var_7], 0
		jnz	short loc_40B5E
		jmp	loc_40D38
; ���������������������������������������������������������������������������

loc_40B5E:				; CODE XREF: WeaponStation_ResolveStateA+126j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+34h], 0
		jnz	short loc_40B6C
		jmp	loc_40D38
; ���������������������������������������������������������������������������

loc_40B6C:				; CODE XREF: WeaponStation_ResolveStateA+134j
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_40B77
		jmp	loc_40D38
; ���������������������������������������������������������������������������

loc_40B77:				; CODE XREF: WeaponStation_ResolveStateA+13Fj
		mov	ax, es:[bx]
		mov	word ptr [bp+var_12+2],	ax

loc_40B7D:				; CODE XREF: WeaponStation_ResolveStateA+192j
		les	bx, [bp+arg_0]
		push	es
		mov	si, word ptr [bp+arg_0]
		inc	word ptr es:[si]
		mov	ax, es:[si]
		pop	es
		cmp	es:[bx+1Ch], ax
		jg	short loc_40BA4
		mov	es, word ptr [bp+arg_0+2]
		mov	word ptr es:[bx], 0
		mov	eax, es:[bx+14h]
		mov	[bp+var_4], eax
		jmp	short loc_40BA8
; ���������������������������������������������������������������������������

loc_40BA4:				; CODE XREF: WeaponStation_ResolveStateA+15Cj
		add	word ptr [bp+var_4], 12h

loc_40BA8:				; CODE XREF: WeaponStation_ResolveStateA+16Fj
		push	large [bp+var_4]
		push	large [bp+arg_0]
		nop

loc_40BB1:
		push	cs
		call	near ptr WeaponStation_SelectForTarget
		add	sp, 8
		or	ax, dx
		jnz	short loc_40BC7
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		cmp	ax, word ptr [bp+var_12+2]
		jnz	short loc_40B7D

loc_40BC7:				; CODE XREF: WeaponStation_ResolveStateA+187j
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	es:[bx+18h], eax
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40BE7
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40BE9
; ���������������������������������������������������������������������������

loc_40BE7:				; CODE XREF: WeaponStation_ResolveStateA+1A9j
		xor	ax, ax

loc_40BE9:				; CODE XREF: WeaponStation_ResolveStateA+1B2j
		mov	dx, ax
		cmp	dx, 800h
		jnz	short loc_40C50
		cmp	[bp+var_6], 2
		jnz	short loc_40BFA
		jmp	loc_40CF3
; ���������������������������������������������������������������������������

loc_40BFA:				; CODE XREF: WeaponStation_ResolveStateA+1C2j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+13h], 2
		jnz	short loc_40C0D
		cmp	[bp+var_6], 0
		jnz	short loc_40C0D
		jmp	loc_40CF3
; ���������������������������������������������������������������������������

loc_40C0D:				; CODE XREF: WeaponStation_ResolveStateA+1CFj
					; WeaponStation_ResolveStateA+1D5j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Fh]
		mov	word ptr [bp+var_12], ax
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_14], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, word ptr [bp+var_12]
		mov	[bp+var_16], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		jmp	loc_40CF3
; ���������������������������������������������������������������������������
		jmp	loc_40CF3
; ���������������������������������������������������������������������������

loc_40C50:				; CODE XREF: WeaponStation_ResolveStateA+1BCj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40C67
		les	bx, es:[bx]
		mov	al, es:[bx+4Eh]
		jmp	short loc_40C69
; ���������������������������������������������������������������������������

loc_40C67:				; CODE XREF: WeaponStation_ResolveStateA+229j
		mov	al, 1

loc_40C69:				; CODE XREF: WeaponStation_ResolveStateA+232j
		mov	[bp+var_18], al
		cmp	[bp+var_18], 1
		jnz	short loc_40C81

loc_40C72:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+13h], 1
		jz	short loc_40C81

loc_40C7C:
		mov	byte ptr es:[bx+13h], 1

loc_40C81:				; CODE XREF: WeaponStation_ResolveStateA+23Dj
					; WeaponStation_ResolveStateA+247j
		mov	al, [bp+var_18]
		cmp	al, [bp+var_6]
		jz	short loc_40D07
		cmp	[bp+var_18], 0
		jz	short loc_40D07
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Fh]
		mov	[bp+var_1A], ax
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_1C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference

loc_40CB0:
		add	sp, 6
		mov	ax, [bp+var_1A]
		mov	[bp+var_1E], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]

loc_40CC3:
		push	ax

loc_40CC4:
		call	SetReference
		add	sp, 6
		mov	al, [bp+var_18]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_40CDD
		cmp	ax, 2
		jz	short loc_40CF3
		jmp	short loc_40D07
; ���������������������������������������������������������������������������

loc_40CDD:				; CODE XREF: WeaponStation_ResolveStateA+2A1j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+13h], 1
		push	es
		mov	si, word ptr [bp+arg_0]
		mov	ax, es:[si]
		pop	es
		mov	es:[bx+2], ax
		jmp	short loc_40D07
; ���������������������������������������������������������������������������

loc_40CF3:				; CODE XREF: WeaponStation_ResolveStateA+1C4j
					; WeaponStation_ResolveStateA+1D7j ...
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+13h], 2
		push	es
		mov	si, word ptr [bp+arg_0]
		mov	ax, es:[si]
		pop	es
		mov	es:[bx+4], ax

loc_40D07:				; CODE XREF: WeaponStation_ResolveStateA+254j
					; WeaponStation_ResolveStateA+25Aj ...
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40D1E
		les	bx, es:[bx]
		mov	al, es:[bx+4Fh]
		jmp	short loc_40D20
; ���������������������������������������������������������������������������

loc_40D1E:				; CODE XREF: WeaponStation_ResolveStateA+2E0j
		mov	al, 0

loc_40D20:				; CODE XREF: WeaponStation_ResolveStateA+2E9j
		or	al, al
		jnz	short loc_40D38
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_40D38:				; CODE XREF: WeaponStation_ResolveStateA+128j
					; WeaponStation_ResolveStateA+136j ...
		pop	si
		leave
		retf
WeaponStation_ResolveStateA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,278L — variante de sub_40A33 avec logique de résolution similaire : résolution de
; stations d'armement, second contexte d'affichage.
; ==============================================================================================
WeaponStation_ResolveStateB	proc far		; CODE XREF: HUD_RenderSymbologyAlt+36Cp

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+34h], 0
		jnz	short loc_40D54
		jmp	loc_40F03
; ���������������������������������������������������������������������������

loc_40D54:				; CODE XREF: WeaponStation_ResolveStateB+14j
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_40D5F
		jmp	loc_40F03
; ���������������������������������������������������������������������������

loc_40D5F:				; CODE XREF: WeaponStation_ResolveStateB+1Fj
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		les	bx, [bp+var_6]

loc_40D78:
		cmp	dword ptr es:[bx], 0
		jz	short loc_40D88
		les	bx, es:[bx]

loc_40D82:
		mov	al, es:[bx+4Eh]

loc_40D86:
		jmp	short loc_40D8A
; ���������������������������������������������������������������������������

loc_40D88:				; CODE XREF: WeaponStation_ResolveStateB+42j
		mov	al, 1

loc_40D8A:				; CODE XREF: WeaponStation_ResolveStateB:loc_40D86j
		mov	[bp+var_8], al

loc_40D8D:
		les	bx, [bp+arg_0]

loc_40D90:
		les	bx, es:[bx+18h]

loc_40D94:
		cmp	dword ptr es:[bx], 0
		jz	short loc_40DA4
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40DA6
; ���������������������������������������������������������������������������

loc_40DA4:				; CODE XREF: WeaponStation_ResolveStateB+5Ej
		xor	ax, ax

loc_40DA6:				; CODE XREF: WeaponStation_ResolveStateB+67j
		mov	[bp+var_A], ax
		mov	[bp+var_C], 2
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]

loc_40DB3:
		mov	[bp+var_10], ax

loc_40DB6:				; CODE XREF: WeaponStation_ResolveStateB+10Fj
		les	bx, [bp+arg_0]
		push	es
		mov	si, word ptr [bp+arg_0]

loc_40DBD:
		inc	word ptr es:[si]
		mov	ax, es:[si]

loc_40DC3:
		pop	es
		cmp	es:[bx+1Ch], ax
		jg	short loc_40DDD
		mov	es, word ptr [bp+arg_0+2]
		mov	word ptr es:[bx], 0
		mov	eax, es:[bx+14h]
		mov	[bp+var_6], eax
		jmp	short loc_40DE1
; ���������������������������������������������������������������������������

loc_40DDD:				; CODE XREF: WeaponStation_ResolveStateB+8Dj
		add	word ptr [bp+var_6], 12h

loc_40DE1:				; CODE XREF: WeaponStation_ResolveStateB+A0j
		cmp	[bp+var_6], 0
		jz	short loc_40E25
		les	bx, [bp+var_6]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40DFB
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40DFD
; ���������������������������������������������������������������������������

loc_40DFB:				; CODE XREF: WeaponStation_ResolveStateB+B5j
		xor	ax, ax

loc_40DFD:				; CODE XREF: WeaponStation_ResolveStateB+BEj
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 800h
		jnz	short loc_40E0D
		mov	[bp+var_C], 1
		jmp	short loc_40E25
; ���������������������������������������������������������������������������

loc_40E0D:				; CODE XREF: WeaponStation_ResolveStateB+CAj
		les	bx, [bp+var_6]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40E20
		les	bx, es:[bx]
		mov	al, es:[bx+4Eh]
		jmp	short loc_40E22
; ���������������������������������������������������������������������������

loc_40E20:				; CODE XREF: WeaponStation_ResolveStateB+DAj
		mov	al, 1

loc_40E22:				; CODE XREF: WeaponStation_ResolveStateB+E3j
		mov	[bp+var_C], al

loc_40E25:				; CODE XREF: WeaponStation_ResolveStateB+ABj
					; WeaponStation_ResolveStateB+D0j
		push	large [bp+var_6]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr WeaponStation_SelectForTarget
		add	sp, 8
		or	ax, dx
		jz	short loc_40E3F
		cmp	[bp+var_C], 2
		jnz	short loc_40E4D

loc_40E3F:				; CODE XREF: WeaponStation_ResolveStateB+FCj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		cmp	ax, [bp+var_10]
		jz	short loc_40E4D
		jmp	loc_40DB6
; ���������������������������������������������������������������������������

loc_40E4D:				; CODE XREF: WeaponStation_ResolveStateB+102j
					; WeaponStation_ResolveStateB+10Dj
		cmp	[bp+var_C], 2
		jz	short loc_40E57
		mov	[bp+var_1], 1

loc_40E57:				; CODE XREF: WeaponStation_ResolveStateB+116j
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	es:[bx+18h], eax
		cmp	[bp+var_8], 2
		jnz	short loc_40E70
		cmp	[bp+var_A], 800h
		jnz	short loc_40E7A

loc_40E70:				; CODE XREF: WeaponStation_ResolveStateB+12Cj
		les	bx, [bp+arg_0]

loc_40E73:
		cmp	byte ptr es:[bx+13h], 1

loc_40E78:
		jz	short loc_40ECB

loc_40E7A:				; CODE XREF: WeaponStation_ResolveStateB+133j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Fh]

loc_40E81:
		mov	[bp+var_12], ax

loc_40E84:
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_14], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]

loc_40E8F:
		add	ax, 0Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, [bp+var_12]
		mov	[bp+var_16], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+13h], 1
		push	es
		mov	si, word ptr [bp+arg_0]
		mov	ax, es:[si]
		pop	es
		mov	es:[bx+2], ax

loc_40ECB:				; CODE XREF: WeaponStation_ResolveStateB:loc_40E78j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+18h], 0
		jz	short loc_40EFB
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40EEA
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40EEC
; ���������������������������������������������������������������������������

loc_40EEA:				; CODE XREF: WeaponStation_ResolveStateB+1A4j
		xor	ax, ax

loc_40EEC:				; CODE XREF: WeaponStation_ResolveStateB+1ADj
		cmp	ax, 800h
		jnz	short loc_40EFB
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+55h], 1
		jmp	short loc_40F03
; ���������������������������������������������������������������������������

loc_40EFB:				; CODE XREF: WeaponStation_ResolveStateB+199j
					; WeaponStation_ResolveStateB+1B4j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+55h], 0

loc_40F03:				; CODE XREF: WeaponStation_ResolveStateB+16j
					; WeaponStation_ResolveStateB+21j ...
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40F36
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	es:[bx], ax
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		mov	byte ptr es:[bx+13h], 1

loc_40F36:				; CODE XREF: WeaponStation_ResolveStateB+1CFj
		pop	si
		leave
		retf
WeaponStation_ResolveStateB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,61L — parcourt les stations d'armement (+0x34, pas 0x23), teste la correspondance de
; type via un masque de bits (+0xD) : recherche d'une station d'armement compatible avec un
; type de cible.
; ==============================================================================================
WeaponStation_FindByTypeMask	proc far		; CODE XREF: Radar_Project3DToScreen+7F9P
					; HUD_RenderSymbologyAlt+1C6p ...

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		xor	dx, dx
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_40F8E
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_40F67
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_40F69
; ���������������������������������������������������������������������������

loc_40F67:				; CODE XREF: WeaponStation_FindByTypeMask+23j
		xor	ax, ax

loc_40F69:				; CODE XREF: WeaponStation_FindByTypeMask+2Cj
		mov	[bp+var_6], ax
		xor	cx, cx
		jmp	short loc_40F85
; ���������������������������������������������������������������������������

loc_40F70:				; CODE XREF: WeaponStation_FindByTypeMask:loc_40F8Cj
		les	bx, [bp+var_4]
		mov	ax, [bp+var_6]

loc_40F76:
		test	es:[bx+0Dh], ax
		jz	short loc_40F80
		add	dx, es:[bx+13h]

loc_40F80:				; CODE XREF: WeaponStation_FindByTypeMask+41j
		inc	cx

loc_40F81:
		add	word ptr [bp+var_4], 23h ; '#'

loc_40F85:				; CODE XREF: WeaponStation_FindByTypeMask+35j
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], cx

loc_40F8C:
		jg	short loc_40F70

loc_40F8E:				; CODE XREF: WeaponStation_FindByTypeMask+19j
		mov	ax, dx
		leave
		retf
WeaponStation_FindByTypeMask	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,49L — parcourt les stations d'armement, teste le masque de type et la quantité restante
; (+0x13 > 0) : recherche d'une station d'armement chargée et compatible — appelée directement
; par Flight_PhysicsTick_JDYN (sub_3314).
; ==============================================================================================
WeaponStation_FindLoadedCompatible	proc far		; CODE XREF: Targeting_AcquireBestThreat+11EP
					; Targeting_AcquireBestThreat+134P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_40FD4
		xor	dx, dx
		jmp	short loc_40FCB
; ���������������������������������������������������������������������������

loc_40FAF:				; CODE XREF: WeaponStation_FindLoadedCompatible+40j
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_4]
		test	es:[bx+0Dh], ax
		jz	short loc_40FC6
		cmp	word ptr es:[bx+13h], 0
		jle	short loc_40FC6

loc_40FC2:
		mov	al, 1
		jmp	short locret_40FD6
; ���������������������������������������������������������������������������

loc_40FC6:				; CODE XREF: WeaponStation_FindLoadedCompatible+27j
					; WeaponStation_FindLoadedCompatible+2Ej
		inc	dx
		add	word ptr [bp+var_4], 23h ; '#'

loc_40FCB:				; CODE XREF: WeaponStation_FindLoadedCompatible+1Bj
		les	bx, [bp+arg_0]
		cmp	es:[bx+38h], dx
		jg	short loc_40FAF

loc_40FD4:				; CODE XREF: WeaponStation_FindLoadedCompatible+17j
		mov	al, 0

locret_40FD6:				; CODE XREF: WeaponStation_FindLoadedCompatible+32j
		leave
		retf
WeaponStation_FindLoadedCompatible	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,126L — appelle sub_40F92 (station chargée type 2) puis vérifie des conditions
; supplémentaires sur le statut d'armement : validation complète de disponibilité d'une arme
; avant tir.
; ==============================================================================================
WeaponStation_ValidateReady	proc far		; CODE XREF: AI_FireWeaponTrigger+17P
					; HUD_RenderSymbologyAlt+48Ap ...

var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 0
		push	2
		push	large [bp+arg_0]
		push	cs
		call	near ptr WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_2], al
		or	di, di
		jnz	short loc_40FFE
		jmp	loc_410A5
; ���������������������������������������������������������������������������

loc_40FFE:				; CODE XREF: WeaponStation_ValidateReady+21j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+34h], 0
		jnz	short loc_4100C
		jmp	loc_410A5
; ���������������������������������������������������������������������������

loc_4100C:				; CODE XREF: WeaponStation_ValidateReady+2Fj
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_41017
		jmp	loc_410A5
; ���������������������������������������������������������������������������

loc_41017:				; CODE XREF: WeaponStation_ValidateReady+3Aj
		xor	si, si
		jmp	short loc_41099
; ���������������������������������������������������������������������������

loc_4101B:				; CODE XREF: WeaponStation_ValidateReady+CAj
		les	bx, [bp+arg_0]
		mov	es:[bx], si
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_41050
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_41052
; ���������������������������������������������������������������������������

loc_41050:				; CODE XREF: WeaponStation_ValidateReady+6Dj
		xor	ax, ax

loc_41052:				; CODE XREF: WeaponStation_ValidateReady+76j
		mov	dx, ax
		cmp	di, 3
		jnz	short loc_4106B
		cmp	[bp+var_2], 0
		jz	short loc_4106B
		cmp	dx, 2
		jnz	short loc_4106F

loc_41064:				; CODE XREF: WeaponStation_ValidateReady+95j
		mov	ax, 1
		jmp	short loc_41071
; ���������������������������������������������������������������������������
		jmp	short loc_4106F
; ���������������������������������������������������������������������������

loc_4106B:				; CODE XREF: WeaponStation_ValidateReady+7Fj
					; WeaponStation_ValidateReady+85j
		test	dx, di
		jnz	short loc_41064

loc_4106F:				; CODE XREF: WeaponStation_ValidateReady+8Aj
					; WeaponStation_ValidateReady+91j
		xor	ax, ax

loc_41071:				; CODE XREF: WeaponStation_ValidateReady+8Fj
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_41098
		push	dx
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C434
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx

loc_4108A:
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_410A5
		mov	[bp+var_1], 0

loc_41098:				; CODE XREF: WeaponStation_ValidateReady+A0j
		inc	si

loc_41099:				; CODE XREF: WeaponStation_ValidateReady+41j
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_410A5
		jmp	loc_4101B
; ���������������������������������������������������������������������������

loc_410A5:				; CODE XREF: WeaponStation_ValidateReady+23j
					; WeaponStation_ValidateReady+31j ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
WeaponStation_ValidateReady	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,91L — résout la station d'armement active (+0x34/+0x36) selon le type de cible référencé
; (vtable[0x4B]) : sélection de la station d'armement adaptée à la cible verrouillée.
; ==============================================================================================
WeaponStation_SelectForTarget	proc far		; CODE XREF: seg034:015BP
					; WeaponStation_ResolveStateA+17Fp ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch

loc_410B2:
		mov	[bp+var_4], 0
		cmp	[bp+arg_4], 0
		jnz	short loc_410C4
		jmp	loc_41145
; ���������������������������������������������������������������������������

loc_410C4:				; CODE XREF: WeaponStation_SelectForTarget+13j
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_410D7
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_410D9
; ���������������������������������������������������������������������������

loc_410D7:				; CODE XREF: WeaponStation_SelectForTarget+20j
		xor	ax, ax

loc_410D9:				; CODE XREF: WeaponStation_SelectForTarget+29j
		mov	cx, ax
		or	cx, cx
		jz	short loc_41145
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_8], eax
		mov	ax, es:[bx+36h]
		mov	dx, es:[bx+34h]
		mov	bx, es:[bx+38h]
		dec	bx
		imul	bx, 23h
		add	dx, bx
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		jmp	short loc_4113D
; ���������������������������������������������������������������������������

loc_41105:				; CODE XREF: WeaponStation_SelectForTarget+97j
		les	bx, [bp+var_8]
		cmp	word ptr es:[bx+13h], 0
		jle	short loc_4111F
		cmp	es:[bx+0Dh], cx
		jnz	short loc_4111F
		mov	eax, [bp+var_8]

loc_41119:				; CODE XREF: WeaponStation_SelectForTarget+8Bj
		mov	[bp+var_4], eax
		jmp	short loc_41145
; ���������������������������������������������������������������������������

loc_4111F:				; CODE XREF: WeaponStation_SelectForTarget+61j
					; WeaponStation_SelectForTarget+67j
		add	word ptr [bp+var_8], 23h ; '#'
		les	bx, [bp+var_C]
		cmp	word ptr es:[bx+13h], 0
		jle	short loc_41139
		cmp	es:[bx+0Dh], cx
		jnz	short loc_41139
		mov	eax, [bp+var_C]
		jmp	short loc_41119
; ���������������������������������������������������������������������������

loc_41139:				; CODE XREF: WeaponStation_SelectForTarget+7Fj
					; WeaponStation_SelectForTarget+85j
		sub	word ptr [bp+var_C], 23h ; '#'

loc_4113D:				; CODE XREF: WeaponStation_SelectForTarget+57j
		mov	ax, word ptr [bp+var_8]
		cmp	ax, word ptr [bp+var_C]
		jbe	short loc_41105

loc_41145:				; CODE XREF: WeaponStation_SelectForTarget+15j
					; WeaponStation_SelectForTarget+31j ...
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
WeaponStation_SelectForTarget	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,194L — largage de contre-mesures : instancie un modèle 'CHAFF' ou 'FLARE' (sub_38B70,
; cf. système de débris seg079) selon le paramètre, décrémente le compteur associé
; (+0x3C/+0x3A) : fonction de largage de leurres chaff/flare (contre-mesures anti-missile).
; ==============================================================================================
Countermeasure_DeployChaffFlare	proc far		; CODE XREF: HUD_RenderSymbologyAlt+6BDp
					; HUD_RenderSymbologyAlt+6E6p

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		cmp	[bp+arg_4], 0
		jz	short loc_41189
		push	1
		push	1
		push	ds
		push	offset aChaff	; "CHAFF"

loc_41173:
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	si, ax
		les	bx, [bp+arg_0]

loc_41183:
		dec	word ptr es:[bx+3Ch]

loc_41187:
		jmp	short loc_411A5
; ���������������������������������������������������������������������������

loc_41189:				; CODE XREF: Countermeasure_DeployChaffFlare+1Cj
		push	1
		push	1
		push	ds
		push	offset aFlare	; "FLARE"

loc_41191:
		push	571Ch

loc_41194:
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	si, ax
		les	bx, [bp+arg_0]
		dec	word ptr es:[bx+3Ah]

loc_411A5:				; CODE XREF: Countermeasure_DeployChaffFlare:loc_41187j
		or	si, si
		jnz	short loc_411AC
		jmp	loc_4130D
; ���������������������������������������������������������������������������

loc_411AC:				; CODE XREF: Countermeasure_DeployChaffFlare+5Aj
		les	bx, [bp+arg_0]
		mov	di, es:[bx+9]

loc_411B3:
		add	di, 12h
		mov	eax, [di]
		mov	[si+12h], eax
		mov	eax, [di+4]
		mov	[si+16h], eax
		mov	eax, [di+8]
		mov	[si+1Ah], eax
		cmp	[bp+arg_4], 0
		jnz	short loc_411D6
		jmp	loc_4127F
; ���������������������������������������������������������������������������

loc_411D6:				; CODE XREF: Countermeasure_DeployChaffFlare+84j
		mov	[bp+var_6], 0C00h
		push	word ptr es:[bx+9]
		mov	bx, es:[bx+9]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		neg	eax
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		neg	eax
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		neg	eax
		mov	[bp+var_C], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	di, si
		add	di, 12h
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		add	eax, [bp+var_14]
		mov	[di], eax
		mov	eax, [bx+4]
		add	eax, [bp+var_10]
		mov	[di+4],	eax

loc_41273:
		mov	eax, [bx+8]

loc_41277:
		add	eax, [bp+var_C]

loc_4127B:
		mov	[di+8],	eax

loc_4127F:				; CODE XREF: Countermeasure_DeployChaffFlare+86j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]

loc_41286:
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 32h	; '2'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_6], 0E6h ; '�'
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		mov	bx, es:[bx+9]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		lea	ax, [bp+var_14]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4
		push	si
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4

loc_4130D:				; CODE XREF: Countermeasure_DeployChaffFlare+5Cj
		pop	di
		pop	si
		leave

locret_41310:
		retf
Countermeasure_DeployChaffFlare	endp

seg088		ends
