seg435		segment	para public 'OVERLAY' use16
		assume cs:seg435
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 114 lignes, NON DÉTAILLÉE — lit une douzaine de champs depuis le format IFF
; (ResourceRecord_SeekAndRead_64743, ReadFieldGroupB_64A54 ×2, ReadFinalField_64B51 ×6,
; ReadFieldGroupC_64A7E ×3) et appelle directement PlayerComponent_IndexToFlagMask_9DE60
; (seg432) — confirme le lien direct avec le système d'index de composants de dommages.
; ==============================================================================================
PlayerComponent_LoadAllFields_A0700	proc far		; CODE XREF: VROOMM_StubThunk_6C5A0J PlayerComponent_ApplyFlagsAndLoad_A07ED+1Ap

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	0
		push	large 54414457h
		push	si

loc_A0720:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A072F

loc_A072C:
		jmp	loc_A07E1
; ���������������������������������������������������������������������������

loc_A072F:				; CODE XREF: PlayerComponent_LoadAllFields_A0700+2Aj
		push	si

loc_A0730:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+46h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+48h], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx

loc_A0752:
		les	bx, [bp+arg_0]
		mov	es:[bx+4Ah], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		push	ax
		call	VROOMM_StubThunk_6C380
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4Bh], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4Dh], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4Eh], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4Fh], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+50h], eax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+54h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+56h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Ah], eax
		jmp	short loc_A07EA
; ���������������������������������������������������������������������������

loc_A07E1:				; CODE XREF: PlayerComponent_LoadAllFields_A0700:loc_A072Cj
		push	0C01Fh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A07EA:				; CODE XREF: PlayerComponent_LoadAllFields_A0700+DFj
		pop	si
		pop	bp
		retf
PlayerComponent_LoadAllFields_A0700	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6C1CA et PlayerComponent_LoadAllFields_A0700.
; ==============================================================================================
PlayerComponent_ApplyFlagsAndLoad_A07ED	proc far		; CODE XREF: VROOMM_StubThunk_6C5A5J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_A07F1:
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C1CA
		add	sp, 6
		push	si

loc_A0802:
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_LoadAllFields_A0700
		add	sp, 6
		pop	si
		pop	bp
		retf
PlayerComponent_ApplyFlagsAndLoad_A07ED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27, sub_4338E),
; dispatch vtable [bx+8] — constructeur de variante de composant joueur.
; ==============================================================================================
PlayerComponentVariantN_ConstructAndInit_A0810	proc far		; CODE XREF: VROOMM_StubThunk_6C5AAJ

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Ah ; 'Z'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A0863
		push	ax
		call	WorldObject_BaseConstruct

loc_A0833:
		pop	cx
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h
		push	si
		call	Camera_ResetState
		pop	cx
		mov	word ptr [si], 28FCh
		mov	word ptr [si+55h], 0
		mov	word ptr [si+57h], 0
		push	large [bp+var_4]
		push	si
		call	Targeting_InitWithFlags
		add	sp, 6
		mov	ax, si
		jmp	short loc_A0865
; ���������������������������������������������������������������������������

loc_A0863:				; CODE XREF: PlayerComponentVariantN_ConstructAndInit_A0810+1Bj
		mov	ax, si

loc_A0865:				; CODE XREF: PlayerComponentVariantN_ConstructAndInit_A0810+51j
		mov	si, ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[si+6],	eax
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+51h], ax
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantN_ConstructAndInit_A0810	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 202 lignes, NON DÉTAILLÉE — combine sub_2E3C, sub_37BCA,
; Trigger_TimedRangedSpawnOnce-style test de portée (sub_378CA, seg109),
; Formation_ComputeGeometryHelper_56D43 (seg116), Missile_ComputeDirectionVector2D_5554E
; (seg116), Matrix_ApplyToVectorZ_576E5 (seg116) — probable calcul de réponse géométrique d'un
; composant à un impact (position/orientation après dommage). Candidat pour session dédiée.
; ==============================================================================================
PlayerComponent_ComputeImpactResponse_A089D	proc far		; CODE XREF: VROOMM_StubThunk_6C5AFJ

var_4C		= dword	ptr -4Ch
var_42		= word ptr -42h
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
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	8
		push	ds
		push	offset aTerrain	; "TERRAIN"
		mov	bx, [bp+arg_6]
		push	large dword ptr	[bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_A08C6
		mov	ax, 1
		jmp	short loc_A08C8
; ���������������������������������������������������������������������������

loc_A08C6:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+22j
		xor	ax, ax

loc_A08C8:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+27j
		or	al, al
		jnz	short loc_A08CF
		jmp	loc_A09EF
; ���������������������������������������������������������������������������

loc_A08CF:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+2Dj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+4Bh], 800h
		jnz	short loc_A08DD
		jmp	loc_A09EF
; ���������������������������������������������������������������������������

loc_A08DD:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+3Bj
		cmp	dword ptr es:[bx+19h], 0
		jz	short loc_A0905
		les	bx, es:[bx+19h]
		mov	ax, es:[bx+8]
		mov	[bp+var_6], ax

loc_A08F0:
		movsx	eax, [bp+var_6]

loc_A08F5:
		shl	eax, 8
		mov	[bp+var_A], eax

loc_A08FD:
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax

loc_A0905:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+46j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4Bh]
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_4C], eax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_70474
		call	Terrain_CheckAdjacentDistance
		add	sp, 0Ah
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_1E], eax
		mov	eax, [di+4]

loc_A0940:
		mov	[bp+var_1A], eax

loc_A0944:
		mov	eax, [di+8]

loc_A0948:
		mov	[bp+var_16], eax
		push	0

loc_A094E:
		lea	ax, [bp+var_1E]
		push	ax

loc_A0952:
		mov	ax, si

loc_A0954:
		add	ax, 12h
		push	ax
		push	word_70474

loc_A095C:
		push	ss

loc_A095D:
		lea	ax, [bp+var_E]

loc_A0960:
		push	ax

loc_A0961:
		call	Terrain_QueryAltitudeAt

loc_A0966:
		add	sp, 0Ch
		mov	eax, [si+1Ah]
		cmp	eax, [bp+var_E]
		jge	short loc_A0978
		mov	ax, 1
		jmp	short loc_A097A
; ���������������������������������������������������������������������������

loc_A0978:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+D4j
		xor	ax, ax

loc_A097A:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+D9j
		or	al, al
		jz	short loc_A0986
		mov	eax, [bp+var_E]
		mov	[si+1Ah], eax

loc_A0986:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+DFj
		lea	ax, [bp+var_42]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	eax, [bp+var_1E]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_2E], eax
		mov	[bp+var_12], 0FFFFA600h
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	Missile_ComputeDirectionVector2D_5554E
		add	sp, 4
		lea	ax, [bp+var_42]
		push	ax
		call	Matrix_ApplyToVectorZ_576E5
		pop	cx

loc_A09E2:
		lea	ax, [bp+var_42]
		push	ax

loc_A09E6:
		push	si

loc_A09E7:
		mov	bx, [si]
		call	dword ptr [bx+40h]

loc_A09EC:
		add	sp, 4

loc_A09EF:				; CODE XREF: PlayerComponent_ComputeImpactResponse_A089D+2Fj
					; PlayerComponent_ComputeImpactResponse_A089D+3Dj
		mov	al, 1
		pop	di
		pop	si

locret_A09F3:
		leave
		retf
PlayerComponent_ComputeImpactResponse_A089D	endp

seg435		ends
