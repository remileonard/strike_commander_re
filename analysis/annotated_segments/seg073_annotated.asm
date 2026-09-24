seg073		segment	byte public 'CODE' use16
		assume cs:seg073
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,148L — vérifie la mémoire libre (sub_5B5D9, seuil 0x249F0), calcule un index de secteur
; via des tables de bornes (word_727BA/BC/BE, pas 6/0Ch octets) : résolution d'index de
; secteur de terrain dans la grille globale (avec garde-fou mémoire).
; ==============================================================================================
Terrain_SectorIndexResolve	proc far		; CODE XREF: Terrain_SectorLoadOnDemand+2Ap

var_CE		= word ptr -0CEh
var_56		= word ptr -56h
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0CEh
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		pop	eax
		cmp	eax, 249F0h
		jnb	short loc_33531
		jmp	loc_33601
; ���������������������������������������������������������������������������

loc_33531:				; CODE XREF: Terrain_SectorIndexResolve+1Ej
		mov	[bp+var_4], si
		mov	dx, si
		cmp	dx, word_727BA
		jnb	short loc_3354A
		mov	ax, dx
		imul	ax, 6
		push	ax
		mov	ax, word_727BE
		pop	dx
		add	ax, dx
		jmp	short loc_33564
; ���������������������������������������������������������������������������

loc_3354A:				; CODE XREF: Terrain_SectorIndexResolve+2Cj
		sub	dx, word_727BA

loc_3354E:
		cmp	dx, word_727BC

loc_33552:
		jnb	short loc_33562
		mov	ax, dx

loc_33556:
		imul	ax, 0Ch
		push	ax
		mov	ax, word_727C0
		pop	dx
		add	ax, dx
		jmp	short loc_33564
; ���������������������������������������������������������������������������

loc_33562:				; CODE XREF: Terrain_SectorIndexResolve:loc_33552j
		xor	ax, ax

loc_33564:				; CODE XREF: Terrain_SectorIndexResolve+3Aj
					; Terrain_SectorIndexResolve+52j
		mov	si, ax
		or	si, si
		jnz	short loc_3356D
		jmp	loc_33601
; ���������������������������������������������������������������������������

loc_3356D:				; CODE XREF: Terrain_SectorIndexResolve+5Aj
		cmp	byte ptr [si+4], 0FFh
		jnz	short loc_33578
		mov	ax, 1
		jmp	short loc_3357A
; ���������������������������������������������������������������������������

loc_33578:				; CODE XREF: Terrain_SectorIndexResolve+63j
		xor	ax, ax

loc_3357A:				; CODE XREF: Terrain_SectorIndexResolve+68j
		or	al, al
		jnz	short loc_33581
		jmp	loc_33601
; ���������������������������������������������������������������������������

loc_33581:				; CODE XREF: Terrain_SectorIndexResolve+6Ej
		push	ds

loc_33582:				; ".PAK"
		push	offset a_pak_1
		push	ds
		push	offset aTxmpack	; "TXMPACK"
		push	ds

loc_3358A:
		push	offset unk_70432
		lea	ax, [bp+var_56]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_CE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx

loc_335A4:
		push	1
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		mov	bx, [bp+var_CE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	[bp+var_4]
		lea	ax, [bp+var_CE]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		or	al, al
		jz	short loc_335E7
		mov	byte ptr [bp+var_6], 0
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		push	si
		call	VROOMM_StubThunk_6CD44
		add	sp, 6
		mov	[bp+var_1], 1

loc_335E7:				; CODE XREF: Terrain_SectorIndexResolve+BDj
		lea	ax, [bp+var_CE]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_33601:				; CODE XREF: Terrain_SectorIndexResolve+20j
					; Terrain_SectorIndexResolve+5Cj ...
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Terrain_SectorIndexResolve	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,59L — vérifie si un secteur est déjà chargé (+4==0xFF) ou tente son chargement
; (sub_3350E) sinon résout son nom (sub_5C832) : chargeur de secteur de terrain à la demande.
; ==============================================================================================
Terrain_SectorLoadOnDemand	proc far		; CODE XREF: seg075:0180P seg075:0261P

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		or	si, si
		jz	short loc_33653
		cmp	byte ptr [si+4], 0FFh
		jnz	short loc_33628

loc_33623:
		mov	ax, 1
		jmp	short loc_3362A
; ���������������������������������������������������������������������������

loc_33628:				; CODE XREF: Terrain_SectorLoadOnDemand+1Aj
		xor	ax, ax

loc_3362A:				; CODE XREF: Terrain_SectorLoadOnDemand+1Fj
		or	al, al
		jz	short loc_33639
		push	word ptr [si]
		push	cs
		call	near ptr Terrain_SectorIndexResolve
		pop	cx
		or	al, al
		jz	short loc_33653

loc_33639:				; CODE XREF: Terrain_SectorLoadOnDemand+25j
		push	0
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h

loc_33645:
		call	Memory_TypedAllocDispatchB_5C832

loc_3364A:
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx

loc_33650:
		mov	word ptr [bp+var_4], ax

loc_33653:				; CODE XREF: Terrain_SectorLoadOnDemand+14j
					; Terrain_SectorLoadOnDemand+30j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Terrain_SectorLoadOnDemand	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,20L — incrémente un compteur de référence indexé (table à 0x553E) : incrément de
; compteur de référence d'un secteur de terrain.
; ==============================================================================================
Terrain_SectorRefInc	proc far		; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F:loc_99C83P
					; IndexedRecordReader_ScanAndReadTypedB_99B7F+117P

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	cl, [bp+arg_0]
		mov	al, cl
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+553Eh]
		inc	al
		mov	dl, cl
		mov	dh, 0
		mov	bx, dx
		mov	[bx+553Eh], al
		pop	bp
		retf
Terrain_SectorRefInc	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — décrémente le compteur de référence indexé, le borne à 0 : décrément de compteur
; de référence de secteur (libération conditionnelle).
; ==============================================================================================
Terrain_SectorRefDec	proc far		; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+61P
					; Terrain_ReleaseSectorAndTile_99AA0+74P

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	cl, [bp+arg_0]
		mov	al, cl
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+553Eh]

loc_3368A:
		add	al, 0FFh
		mov	dl, cl
		mov	dh, 0
		mov	bx, dx
		mov	[bx+553Eh], al
		mov	al, cl
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+553Eh], 1
		jnb	short loc_336AE

loc_336A3:
		mov	al, cl
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+553Eh], 0

loc_336AE:				; CODE XREF: Terrain_SectorRefDec+27j
		pop	bp
		retf
Terrain_SectorRefDec	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,90L — variante de sub_3350E avec vérification préalable du compteur de référence (table
; 0x553E) : résolution de secteur de terrain avec vérification de charge en cours.
; ==============================================================================================
Terrain_SectorResolveChecked	proc far		; CODE XREF: seg077:02B3P

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		cmp	byte_6EA75, 0
		jz	short loc_33731
		xor	si, si
		jmp	short loc_3372B
; ���������������������������������������������������������������������������

loc_336C3:				; CODE XREF: Terrain_SectorResolveChecked+7Fj
		cmp	byte ptr [si+553Eh], 0
		jnz	short loc_3372A
		mov	dx, si
		cmp	dx, word_727BA
		jnb	short loc_336E0
		mov	ax, dx
		imul	ax, 6
		push	ax
		mov	ax, word_727BE
		pop	dx
		add	ax, dx
		jmp	short loc_336FA
; ���������������������������������������������������������������������������

loc_336E0:				; CODE XREF: Terrain_SectorResolveChecked+20j
		sub	dx, word_727BA
		cmp	dx, word_727BC
		jnb	short loc_336F8
		mov	ax, dx
		imul	ax, 0Ch
		push	ax
		mov	ax, word_727C0
		pop	dx
		add	ax, dx
		jmp	short loc_336FA
; ���������������������������������������������������������������������������

loc_336F8:				; CODE XREF: Terrain_SectorResolveChecked+38j
		xor	ax, ax

loc_336FA:				; CODE XREF: Terrain_SectorResolveChecked+2Ej
					; Terrain_SectorResolveChecked+46j
		mov	di, ax
		or	di, di
		jz	short loc_3372A
		cmp	byte ptr [di+4], 0FFh
		jnz	short loc_3370B
		mov	ax, 1
		jmp	short loc_3370D
; ���������������������������������������������������������������������������

loc_3370B:				; CODE XREF: Terrain_SectorResolveChecked+54j
		xor	ax, ax

loc_3370D:				; CODE XREF: Terrain_SectorResolveChecked+59j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3372A
		push	di
		call	VROOMM_StubThunk_6CD3F
		pop	cx
		mov	[bp+var_2], si
		mov	ax, [bp+var_2]
		cwd
		mov	[di+2],	dx

loc_33724:
		mov	[di], ax
		mov	byte ptr [di+4], 0FFh

loc_3372A:				; CODE XREF: Terrain_SectorResolveChecked+18j
					; Terrain_SectorResolveChecked+4Ej ...
		inc	si

loc_3372B:				; CODE XREF: Terrain_SectorResolveChecked+11j
		cmp	si, 0FFh
		jl	short loc_336C3

loc_33731:				; CODE XREF: Terrain_SectorResolveChecked+Dj
		pop	di
		pop	si
		leave
		retf
Terrain_SectorResolveChecked	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,589L — grosse fonction du cluster terrain (même contexte que sub_336B0/sub_33B97) :
; candidat pour le calcul principal de génération/streaming de secteur de terrain, à
; approfondir.
; ==============================================================================================
Terrain_SectorStreamMain	proc far		; CODE XREF: Render_TerrainPipelineMain+20P

var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= word ptr -0C0h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_55		= byte ptr -55h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0D8h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_33741:
		xor	di, di

loc_33743:
		jmp	short loc_33760
; ���������������������������������������������������������������������������

loc_33745:				; CODE XREF: Terrain_SectorStreamMain+2Ej
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+3Bh]

loc_3374C:
		add	bx, ax

loc_3374E:
		mov	word ptr [bx], 0
		mov	ax, di

loc_33754:
		shl	ax, 1
		mov	bx, [si+3Dh]
		add	bx, ax
		mov	word ptr [bx], 0
		inc	di

loc_33760:				; CODE XREF: Terrain_SectorStreamMain:loc_33743j
		cmp	[si+11h], di
		jg	short loc_33745
		mov	eax, [si+9]
		mov	[bp+var_4], eax
		mov	di, [bp+arg_2]
		add	di, 2Ch	; ','
		mov	eax, [di]
		mov	[bp+var_CC], eax
		mov	eax, [di+4]
		mov	[bp+var_C8], eax

loc_33784:
		mov	eax, [di+8]

loc_33788:
		mov	[bp+var_C4], eax
		mov	di, [bp+arg_2]

loc_33790:
		add	di, 14h
		mov	eax, [di]

loc_33796:
		mov	[bp+var_D8], eax
		mov	eax, [di+4]
		mov	[bp+var_D4], eax
		mov	eax, [di+8]
		mov	[bp+var_D0], eax
		mov	di, [bp+arg_2]
		add	di, 60h	; '`'
		mov	eax, [di]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_CC]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		mov	di, si
		add	di, 3Fh	; '?'
		mov	ax, [di]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_14], eax
		mov	ax, [di+2]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_24], eax
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_2C], eax
		mov	al, [si+11h]

loc_33851:
		mov	[bp+var_31], al
		mov	eax, [bp+var_C]
		add	eax, [bp+var_8]
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		cmp	[bp+var_3A], 5A00h
		jg	short loc_33873
		mov	ax, 1
		jmp	short loc_33875
; ���������������������������������������������������������������������������

loc_33873:				; CODE XREF: Terrain_SectorStreamMain+137j
		xor	ax, ax

loc_33875:				; CODE XREF: Terrain_SectorStreamMain+13Cj
		or	al, al
		jnz	short loc_3387C
		jmp	loc_33B75
; ���������������������������������������������������������������������������

loc_3387C:				; CODE XREF: Terrain_SectorStreamMain+142j
		mov	eax, [bp+var_C]

loc_33880:
		sub	eax, [bp+var_8]

loc_33884:
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		cmp	[bp+var_42], 0FFFFA600h
		jl	short loc_3389B
		mov	ax, 1
		jmp	short loc_3389D
; ���������������������������������������������������������������������������

loc_3389B:				; CODE XREF: Terrain_SectorStreamMain+15Fj
		xor	ax, ax

loc_3389D:				; CODE XREF: Terrain_SectorStreamMain+164j
		or	al, al
		jnz	short loc_338A4
		jmp	loc_33B75
; ���������������������������������������������������������������������������

loc_338A4:				; CODE XREF: Terrain_SectorStreamMain+16Aj
		cmp	[bp+var_CC], 0
		jg	short loc_338B1
		mov	ax, 1
		jmp	short loc_338B3
; ���������������������������������������������������������������������������

loc_338B1:				; CODE XREF: Terrain_SectorStreamMain+175j
		xor	ax, ax

loc_338B3:				; CODE XREF: Terrain_SectorStreamMain+17Aj
		or	al, al
		jz	short loc_338BD
		mov	[bp+var_44], 0
		jmp	short loc_338C1
; ���������������������������������������������������������������������������

loc_338BD:				; CODE XREF: Terrain_SectorStreamMain+180j
		mov	[bp+var_44], 1

loc_338C1:				; CODE XREF: Terrain_SectorStreamMain+186j
		mov	eax, [bp+var_C8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_CC]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_48], eax
		cmp	[bp+var_48], 0
		jnz	short loc_338EA
		mov	ax, 1
		jmp	short loc_338EC
; ���������������������������������������������������������������������������

loc_338EA:				; CODE XREF: Terrain_SectorStreamMain+1AEj
		xor	ax, ax

loc_338EC:				; CODE XREF: Terrain_SectorStreamMain+1B3j
		or	al, al
		jz	short loc_33941
		mov	bl, 0
		cmp	[bp+var_C8], 0
		jge	short loc_338FF
		mov	ax, 1
		jmp	short loc_33901
; ���������������������������������������������������������������������������

loc_338FF:				; CODE XREF: Terrain_SectorStreamMain+1C3j
		xor	ax, ax

loc_33901:				; CODE XREF: Terrain_SectorStreamMain+1C8j
		or	al, al
		jz	short loc_3390E
		mov	al, [bp+var_31]
		mov	ah, 0
		sar	ax, 1
		mov	bl, al

loc_3390E:				; CODE XREF: Terrain_SectorStreamMain+1CEj
		mov	al, [bp+var_31]
		mov	ah, 0
		sar	ax, 1
		mov	dl, bl
		add	dl, al
		mov	[bp+var_55], dl
		mov	al, bl
		mov	ah, 0
		mov	di, ax
		jmp	short loc_33935
; ���������������������������������������������������������������������������

loc_33924:				; CODE XREF: Terrain_SectorStreamMain+207j
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	dx, di
		shl	dx, 1
		mov	bx, [si+3Dh]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_33935:				; CODE XREF: Terrain_SectorStreamMain+1EDj
		mov	al, [bp+var_55]
		mov	ah, 0
		cmp	ax, di
		jge	short loc_33924
		jmp	loc_33B93
; ���������������������������������������������������������������������������

loc_33941:				; CODE XREF: Terrain_SectorStreamMain+1B9j
		mov	eax, [bp+var_14]
		mov	[bp-58h], eax
		mov	al, [bp+var_31]
		mov	ah, 0
		dec	ax
		movsx	eax, ax
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_60], edx
		mov	eax, [bp+var_60]
		shl	eax, 8
		mov	edx, [bp-58h]
		add	edx, eax
		mov	[bp+var_64], edx
		mov	eax, [bp+var_64]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_D8]

loc_3397F:
		sub	eax, [bp-58h]
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_70]
		cdq
		idiv	[bp+var_74]
		mov	[bp+var_78], eax
		mov	[bp+var_68], eax
		mov	eax, [bp+var_10]
		sub	eax, [bp+var_D4]
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	edx, [bp+var_4C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]

loc_339D2:
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_8C]

loc_339DC:
		mov	edx, eax

loc_339DF:
		mov	ecx, [bp+var_48]

loc_339E3:
		sar	edx, 18h

loc_339E7:
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_94]
		cdq
		idiv	[bp+var_98]
		mov	[bp+var_9C], eax
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_68]
		add	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_4C]
		neg	eax
		mov	[bp+var_AC], eax
		mov	[bp+var_B0], eax

loc_33A3F:
		mov	eax, [bp+var_B0]
		mov	edx, eax

loc_33A47:
		mov	ecx, [bp+var_48]
		sar	edx, 18h

loc_33A4F:
		shl	eax, 8

loc_33A53:
		idiv	ecx
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_B8], eax
		xor	di, di
		jmp	loc_33B67
; ���������������������������������������������������������������������������

loc_33A73:				; CODE XREF: Terrain_SectorStreamMain+43Bj
		cmp	[bp+var_44], 0
		jnz	short loc_33AD5
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	[bp+var_BA], ax

loc_33A82:
		movsx	eax, [bp+var_BA]
		shl	eax, 8
		cmp	eax, [bp+var_B8]
		jge	short loc_33A98

loc_33A93:
		mov	ax, 1
		jmp	short loc_33A9A
; ���������������������������������������������������������������������������

loc_33A98:				; CODE XREF: Terrain_SectorStreamMain+35Cj
		xor	ax, ax

loc_33A9A:				; CODE XREF: Terrain_SectorStreamMain+361j
		or	al, al
		jz	short loc_33AA6

loc_33A9E:				; CODE XREF: Terrain_SectorStreamMain+3B1j
		mov	al, [bp+var_31]
		mov	ah, 0
		jmp	loc_33B51
; ���������������������������������������������������������������������������

loc_33AA6:				; CODE XREF: Terrain_SectorStreamMain+367j
		cmp	[bp+var_B8], 0
		jl	short loc_33AB3
		mov	ax, 1
		jmp	short loc_33AB5
; ���������������������������������������������������������������������������

loc_33AB3:				; CODE XREF: Terrain_SectorStreamMain+377j
		xor	ax, ax

loc_33AB5:				; CODE XREF: Terrain_SectorStreamMain+37Cj
		or	al, al
		jnz	short loc_33ABC
		jmp	loc_33B5C
; ���������������������������������������������������������������������������

loc_33ABC:				; CODE XREF: Terrain_SectorStreamMain+382j
		mov	ax, word ptr [bp+var_B8+1]
		mov	[bp+var_BE], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+3Dh]
		add	bx, ax
		mov	ax, [bp+var_BE]
		inc	ax
		jmp	loc_33B5A
; ���������������������������������������������������������������������������

loc_33AD5:				; CODE XREF: Terrain_SectorStreamMain+342j
		cmp	[bp+var_B8], 0
		jge	short loc_33AE2

loc_33ADD:
		mov	ax, 1
		jmp	short loc_33AE4
; ���������������������������������������������������������������������������

loc_33AE2:				; CODE XREF: Terrain_SectorStreamMain+3A6j
		xor	ax, ax

loc_33AE4:				; CODE XREF: Terrain_SectorStreamMain+3ABj
		or	al, al
		jnz	short loc_33A9E
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	[bp+var_BC], ax
		movsx	eax, [bp+var_BC]
		shl	eax, 8
		cmp	eax, [bp+var_B8]
		jl	short loc_33B07
		mov	ax, 1
		jmp	short loc_33B09
; ���������������������������������������������������������������������������

loc_33B07:				; CODE XREF: Terrain_SectorStreamMain+3CBj
		xor	ax, ax

loc_33B09:				; CODE XREF: Terrain_SectorStreamMain+3D0j
		or	al, al
		jz	short loc_33B5C
		mov	ax, word ptr [bp+var_B8+1]
		mov	[bp+var_BE], ax
		mov	[bp+var_C0], ax
		movsx	eax, [bp+var_C0]
		shl	eax, 8
		cmp	eax, [bp+var_B8]
		jge	short loc_33B2F
		mov	ax, 1
		jmp	short loc_33B31
; ���������������������������������������������������������������������������

loc_33B2F:				; CODE XREF: Terrain_SectorStreamMain+3F3j
		xor	ax, ax

loc_33B31:				; CODE XREF: Terrain_SectorStreamMain+3F8j
		or	al, al
		jz	short loc_33B39
		inc	[bp+var_BE]

loc_33B39:				; CODE XREF: Terrain_SectorStreamMain+3FEj
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+3Bh]

loc_33B40:
		add	bx, ax
		mov	ax, [bp+var_BE]
		mov	[bx], ax
		mov	al, [bp+var_31]
		mov	ah, 0
		sub	ax, [bp+var_BE]

loc_33B51:				; CODE XREF: Terrain_SectorStreamMain+36Ej
		mov	dx, di
		shl	dx, 1
		mov	bx, [si+3Dh]
		add	bx, dx

loc_33B5A:				; CODE XREF: Terrain_SectorStreamMain+39Dj
		mov	[bx], ax

loc_33B5C:				; CODE XREF: Terrain_SectorStreamMain+384j
					; Terrain_SectorStreamMain+3D6j
		mov	eax, [bp+var_A8]
		add	[bp+var_B8], eax
		inc	di

loc_33B67:				; CODE XREF: Terrain_SectorStreamMain+33Bj
		mov	al, [bp+var_31]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_33B73
		jmp	loc_33A73
; ���������������������������������������������������������������������������

loc_33B73:				; CODE XREF: Terrain_SectorStreamMain+439j
		jmp	short loc_33B93
; ���������������������������������������������������������������������������

loc_33B75:				; CODE XREF: Terrain_SectorStreamMain+144j
					; Terrain_SectorStreamMain+16Cj
		xor	di, di
		jmp	short loc_33B8A
; ���������������������������������������������������������������������������

loc_33B79:				; CODE XREF: Terrain_SectorStreamMain+45Cj
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	dx, di
		shl	dx, 1

loc_33B82:
		mov	bx, [si+3Dh]
		add	bx, dx

loc_33B87:
		mov	[bx], ax
		inc	di

loc_33B8A:				; CODE XREF: Terrain_SectorStreamMain+442j
		mov	al, [bp+var_31]

loc_33B8D:
		mov	ah, 0
		cmp	ax, di
		jg	short loc_33B79

loc_33B93:				; CODE XREF: Terrain_SectorStreamMain+209j
					; Terrain_SectorStreamMain:loc_33B73j
		pop	di
		pop	si
		leave
		retf
Terrain_SectorStreamMain	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,187L — divise une coordonnée par la taille de secteur (+9), calcule un index avec test
; de signe : résolution d'index de secteur avec gestion des coordonnées négatives.
; ==============================================================================================
Terrain_SectorIndexSigned	proc far		; CODE XREF: Terrain_TestAdjacentVisibility+3EP

var_9C		= word ptr -9Ch
var_6C		= word ptr -6Ch
var_53		= byte ptr -53h
var_52		= word ptr -52h
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 9Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax
		cmp	dword ptr [di],	0
		jge	short loc_33BD2
		mov	ax, 1
		jmp	short loc_33BD4
; ���������������������������������������������������������������������������

loc_33BD2:				; CODE XREF: Terrain_SectorIndexSigned+34j
		xor	ax, ax

loc_33BD4:				; CODE XREF: Terrain_SectorIndexSigned+39j
		or	al, al
		jz	short loc_33BE0

loc_33BD8:
		sub	[bp+var_8], 100h

loc_33BE0:				; CODE XREF: Terrain_SectorIndexSigned+3Fj
		mov	eax, [si+9]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		imul	eax, [bp+var_14]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_18], eax
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		cmp	dword ptr [di+4], 0
		jle	short loc_33C23
		mov	ax, 1
		jmp	short loc_33C25
; ���������������������������������������������������������������������������

loc_33C23:				; CODE XREF: Terrain_SectorIndexSigned+85j
		xor	ax, ax

loc_33C25:				; CODE XREF: Terrain_SectorIndexSigned+8Aj
		or	al, al
		jz	short loc_33C31
		add	[bp+var_4], 100h

loc_33C31:				; CODE XREF: Terrain_SectorIndexSigned+90j
		mov	eax, [si+9]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_4]

loc_33C3D:
		imul	eax, [bp+var_20]
		mov	[bp+var_4], eax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large dword ptr	[si+19h]
		push	5C44h

loc_33C53:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	ax, [si+2Fh]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_24+2],	dx
		mov	word ptr [bp+var_24], ax
		mov	cx, [si+9]
		movsx	ebx, cx
		mov	eax, [bp+var_8]
		cdq
		idiv	ebx
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_2C+1]
		mov	[bp+var_42], ax
		mov	ax, word ptr [bp+var_28+1]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_42]
		mov	word ptr [bp+var_48], ax
		mov	ax, [bp+var_44]
		mov	word ptr [bp+var_48+2],	ax
		mov	eax, [bp+var_48]
		mov	[bp+var_40], eax
		push	seg seg073
		push	offset loc_34595
		push	large 10002h
		push	0Ch
		lea	ax, [bp+var_6C]
		push	ax

loc_33CDA:
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg073
		push	offset loc_34595
		push	large 10003h
		push	0Ch
		lea	ax, [bp+var_9C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, [si+41h]
		sub	ax, word ptr [bp+var_40+2]
		mov	dx, [si+11h]
		dec	dx
		imul	dx
		mov	dx, word ptr [bp+var_40]
		sub	dx, [si+3Fh]
		add	dx, ax
		shl	dx, 1
		mov	[bp+var_52], dx
		mov	ax, [si+2Fh]
		mov	dx, word ptr dword_6EA68+2
		mov	bx, [bp+var_52]
		imul	bx, 16h
		add	ax, bx
		mov	word ptr [bp+var_24+2],	dx
		mov	word ptr [bp+var_24], ax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+2]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		mov	[bp+var_53], al

loc_33D41:
		mov	dword_6EA68, 0
		pop	di
		pop	si
		leave
		retf
Terrain_SectorIndexSigned	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,869 lignes. Fonction majeure du cluster terrain (structure similaire au reste du
; segment) : candidat très fort pour la fonction principale de streaming/génération de terrain
; (chargement des secteurs visibles, LOD, mémoire), bien trop volumineuse pour une passe
; rapide — priorité pour une session dédiée.
; ==============================================================================================
Terrain_StreamingMain	proc far		; CODE XREF: Camera_TransformIfVisible+3EP

var_1C6		= dword	ptr -1C6h
var_1C2		= dword	ptr -1C2h
var_1BE		= dword	ptr -1BEh
var_1BA		= dword	ptr -1BAh
var_1B6		= dword	ptr -1B6h
var_1B2		= dword	ptr -1B2h
var_1AE		= dword	ptr -1AEh
var_1AA		= dword	ptr -1AAh
var_1A6		= dword	ptr -1A6h
var_1A2		= dword	ptr -1A2h
var_19E		= dword	ptr -19Eh
var_19A		= dword	ptr -19Ah
var_196		= dword	ptr -196h
var_192		= dword	ptr -192h
var_18E		= dword	ptr -18Eh
var_18A		= dword	ptr -18Ah
var_186		= dword	ptr -186h
var_182		= dword	ptr -182h
var_17E		= dword	ptr -17Eh
var_17A		= dword	ptr -17Ah
var_176		= dword	ptr -176h
var_172		= dword	ptr -172h
var_16E		= dword	ptr -16Eh
var_16A		= dword	ptr -16Ah
var_166		= dword	ptr -166h
var_162		= dword	ptr -162h
var_15E		= dword	ptr -15Eh
var_15A		= dword	ptr -15Ah
var_156		= dword	ptr -156h
var_152		= dword	ptr -152h
var_14E		= dword	ptr -14Eh
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
var_E2		= word ptr -0E2h
var_E0		= dword	ptr -0E0h
var_DC		= word ptr -0DCh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= word ptr -0B6h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= word ptr -0A0h
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
var_6A		= word ptr -6Ah
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp

loc_33D51:
		sub	sp, 1C6h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_12]
		mov	eax, [bp+arg_6]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax
		cmp	[bp+arg_6], 0
		jge	short loc_33D8B
		mov	ax, 1
		jmp	short loc_33D8D
; ���������������������������������������������������������������������������

loc_33D8B:				; CODE XREF: Terrain_StreamingMain+36j
		xor	ax, ax

loc_33D8D:				; CODE XREF: Terrain_StreamingMain+3Bj
		or	al, al
		jz	short loc_33D99
		sub	[bp+var_8], 100h

loc_33D99:				; CODE XREF: Terrain_StreamingMain+41j
		mov	eax, [si+9]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		imul	eax, [bp+var_14]
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_A]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_18], eax
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax

loc_33DD0:
		cmp	[bp+arg_A], 0
		jle	short loc_33DDC

loc_33DD7:
		mov	ax, 1

loc_33DDA:
		jmp	short loc_33DDE
; ���������������������������������������������������������������������������

loc_33DDC:				; CODE XREF: Terrain_StreamingMain+87j
		xor	ax, ax

loc_33DDE:				; CODE XREF: Terrain_StreamingMain:loc_33DDAj
		or	al, al
		jz	short loc_33DEA

loc_33DE2:
		add	[bp+var_4], 100h

loc_33DEA:				; CODE XREF: Terrain_StreamingMain+92j
		mov	eax, [si+9]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_4]
		imul	eax, [bp+var_20]
		mov	[bp+var_4], eax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large dword ptr	[si+19h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	ax, [si+2Fh]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_24+2],	dx
		mov	word ptr [bp+var_24], ax
		mov	ax, [si+9]
		mov	[bp+var_2E], ax
		movsx	ebx, [bp+var_2E]
		mov	eax, [bp+var_8]
		cdq
		idiv	ebx
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_2C+1]
		mov	[bp+var_44], ax
		mov	ax, word ptr [bp+var_28+1]
		mov	[bp+var_46], ax
		mov	ax, [bp+var_44]
		mov	word ptr [bp+var_4A], ax
		mov	ax, [bp+var_46]
		mov	word ptr [bp+var_4A+2],	ax
		mov	eax, [bp+var_4A]

loc_33E81:
		mov	[bp+var_42], eax

loc_33E85:
		push	seg seg073
		push	offset loc_34595
		push	large 10002h
		push	0Ch
		lea	ax, [bp+var_12A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg073
		push	offset loc_34595
		push	large 10003h
		push	0Ch
		lea	ax, [bp+var_15A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, [si+11h]
		dec	ax
		mov	[bp+var_54], ax
		mov	ax, [si+3Fh]
		sub	word ptr [bp+var_42], ax
		cmp	word ptr [bp+var_42], 0
		jge	short loc_33ED2
		xor	ax, ax

loc_33ED0:
		jmp	short loc_33ED5
; ���������������������������������������������������������������������������

loc_33ED2:				; CODE XREF: Terrain_StreamingMain+17Ej
		mov	ax, word ptr [bp+var_42]

loc_33ED5:				; CODE XREF: Terrain_StreamingMain:loc_33ED0j
		mov	dx, [bp+var_54]
		dec	dx
		cmp	ax, dx
		jle	short loc_33EE3
		mov	ax, [bp+var_54]
		dec	ax
		jmp	short loc_33EF0
; ���������������������������������������������������������������������������

loc_33EE3:				; CODE XREF: Terrain_StreamingMain+18Dj
		cmp	word ptr [bp+var_42], 0
		jge	short loc_33EED
		xor	ax, ax
		jmp	short loc_33EF0
; ���������������������������������������������������������������������������

loc_33EED:				; CODE XREF: Terrain_StreamingMain+199j
		mov	ax, word ptr [bp+var_42]

loc_33EF0:				; CODE XREF: Terrain_StreamingMain+193j
					; Terrain_StreamingMain+19Dj
		mov	word ptr [bp+var_42], ax
		mov	ax, [si+41h]
		sub	ax, word ptr [bp+var_42+2]
		mov	word ptr [bp+var_42+2],	ax
		cmp	word ptr [bp+var_42+2],	0
		jge	short loc_33F06
		xor	ax, ax
		jmp	short loc_33F09
; ���������������������������������������������������������������������������

loc_33F06:				; CODE XREF: Terrain_StreamingMain+1B2j
		mov	ax, word ptr [bp+var_42+2]

loc_33F09:				; CODE XREF: Terrain_StreamingMain+1B6j
		mov	dx, [bp+var_54]
		dec	dx
		cmp	ax, dx
		jle	short loc_33F17
		mov	ax, [bp+var_54]
		dec	ax
		jmp	short loc_33F24
; ���������������������������������������������������������������������������

loc_33F17:				; CODE XREF: Terrain_StreamingMain+1C1j
		cmp	word ptr [bp+var_42+2],	0
		jge	short loc_33F21
		xor	ax, ax
		jmp	short loc_33F24
; ���������������������������������������������������������������������������

loc_33F21:				; CODE XREF: Terrain_StreamingMain+1CDj
		mov	ax, word ptr [bp+var_42+2]

loc_33F24:				; CODE XREF: Terrain_StreamingMain+1C7j
					; Terrain_StreamingMain+1D1j
		mov	word ptr [bp+var_42+2],	ax
		mov	dx, [si+11h]
		dec	dx
		imul	dx
		mov	dx, word ptr [bp+var_42]
		add	dx, ax
		shl	dx, 1
		mov	[bp+var_56], dx
		mov	ax, [si+2Fh]
		mov	dx, word ptr dword_6EA68+2
		mov	bx, [bp+var_56]
		imul	bx, 16h
		add	ax, bx
		mov	word ptr [bp+var_24+2],	dx
		mov	word ptr [bp+var_24], ax
		les	bx, [bp+var_24]
		mov	ax, es:[bx+2]

loc_33F53:
		xor	dx, dx
		sub	ax, [si+25h]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 15h
		cdq
		idiv	ebx
		mov	[bp+var_58], ax
		cwd
		idiv	word ptr [si+11h]
		mov	ax, [si+3Fh]
		add	ax, dx
		movsx	eax, ax
		mov	edx, [si+9]
		imul	edx, eax
		mov	[bp+var_5C], edx
		mov	eax, [bp+var_5C]
		shl	eax, 8

loc_33F8E:
		mov	[bp+var_60], eax

loc_33F92:
		mov	eax, [bp+var_60]

loc_33F96:
		mov	[bp+var_136], eax
		mov	ax, [bp+var_58]
		cwd
		idiv	word ptr [si+11h]
		mov	dx, [si+41h]
		sub	dx, ax
		movsx	eax, dx
		mov	edx, [si+9]
		imul	edx, eax
		mov	[bp+var_64], edx
		mov	eax, [bp+var_64]
		shl	eax, 8
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_132], eax
		mov	bx, word ptr [bp+var_24]

loc_33FCF:
		mov	bx, es:[bx+2]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_6A], ax
		movsx	eax, [bp+var_6A]
		shl	eax, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_12E], eax
		mov	eax, [bp+arg_6]
		sub	eax, [bp+var_8]
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		or	eax, eax
		jge	short loc_34013
		neg	eax

loc_34013:				; CODE XREF: Terrain_StreamingMain+2C0j
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_7E], eax
		mov	[bp+var_4E], eax

loc_34023:
		mov	eax, [bp+var_4]
		sub	eax, [bp+arg_A]

loc_3402B:
		mov	[bp+var_82], eax

loc_34030:
		mov	[bp+var_86], eax

loc_34035:
		mov	eax, [bp+var_86]
		or	eax, eax
		jge	short loc_34042
		neg	eax

loc_34042:				; CODE XREF: Terrain_StreamingMain+2EFj
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_8E], eax
		mov	[bp+var_52], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_136]
		jnz	short loc_34065
		mov	ax, 1
		jmp	short loc_34067
; ���������������������������������������������������������������������������

loc_34065:				; CODE XREF: Terrain_StreamingMain+310j
		xor	ax, ax

loc_34067:				; CODE XREF: Terrain_StreamingMain+315j
		or	al, al
		jnz	short loc_3406E
		jmp	loc_34411
; ���������������������������������������������������������������������������

loc_3406E:				; CODE XREF: Terrain_StreamingMain+31Bj
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_132]
		jnz	short loc_3407E
		mov	ax, 1
		jmp	short loc_34080
; ���������������������������������������������������������������������������

loc_3407E:				; CODE XREF: Terrain_StreamingMain+329j
		xor	ax, ax

loc_34080:				; CODE XREF: Terrain_StreamingMain+32Ej
		or	al, al
		jnz	short loc_34087
		jmp	loc_34411
; ���������������������������������������������������������������������������

loc_34087:				; CODE XREF: Terrain_StreamingMain+334j
		mov	eax, [bp+var_4E]

loc_3408B:
		cmp	eax, [bp+var_52]
		jle	short loc_34096

loc_34091:
		mov	ax, 1
		jmp	short loc_34098
; ���������������������������������������������������������������������������

loc_34096:				; CODE XREF: Terrain_StreamingMain+341j
		xor	ax, ax

loc_34098:				; CODE XREF: Terrain_StreamingMain+346j
		or	al, al
		jnz	short loc_3409F
		jmp	loc_34259
; ���������������������������������������������������������������������������

loc_3409F:				; CODE XREF: Terrain_StreamingMain+34Cj
		add	word ptr [bp+var_24], 16h
		mov	eax, [bp+var_136]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_156], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_152], eax
		mov	eax, [si+9]
		mov	[bp+var_92], eax
		shl	eax, 8
		mov	[bp+var_96], eax

loc_340D3:
		mov	eax, [bp+var_15A]
		add	eax, [bp+var_96]
		mov	[bp+var_9A], eax

loc_340E2:
		mov	[bp+var_9E], eax
		mov	[bp+var_14E], eax
		mov	eax, [bp+var_156]
		mov	[bp+var_14A], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+4]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_A0], ax
		movsx	eax, [bp+var_A0]
		shl	eax, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_146], eax

loc_34125:
		mov	eax, [bp+var_14E]
		mov	[bp+var_142], eax

loc_3412F:
		mov	eax, [si+9]
		mov	[bp+var_A8], eax
		shl	eax, 8
		mov	[bp+var_AC], eax

loc_34141:
		mov	eax, [bp+var_156]
		sub	eax, [bp+var_AC]
		mov	[bp+var_B0], eax
		mov	[bp+var_B4], eax
		mov	[bp+var_13E], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+6]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_B6], ax
		movsx	eax, [bp+var_B6]
		shl	eax, 8
		mov	[bp+var_BA], eax

loc_3417F:
		mov	eax, [bp+var_BA]
		mov	[bp+var_13A], eax

loc_34189:
		mov	eax, [bp+var_14E]

loc_3418E:
		sub	eax, [bp+var_15A]

loc_34193:
		mov	[bp+var_166], eax
		mov	eax, [bp+var_14A]
		sub	eax, [bp+var_156]
		mov	[bp+var_162], eax
		mov	eax, [bp+var_146]
		sub	eax, [bp+var_152]
		mov	[bp+var_15E], eax
		mov	eax, [bp+var_166]
		mov	[bp+var_172], eax
		mov	eax, [bp+var_162]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_15E]

loc_341CF:
		mov	[bp+var_16A], eax

loc_341D4:
		mov	eax, [bp+var_172]

loc_341D9:
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_16E]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_16A]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_142]
		sub	eax, [bp+var_15A]
		mov	[bp+var_17E], eax
		mov	eax, [bp+var_13E]
		sub	eax, [bp+var_156]
		mov	[bp+var_17A], eax
		mov	eax, [bp+var_13A]
		sub	eax, [bp+var_152]
		mov	[bp+var_176], eax

loc_3421F:
		mov	eax, [bp+var_17E]
		mov	[bp+var_18A], eax

loc_34229:
		mov	eax, [bp+var_17A]
		mov	[bp+var_186], eax
		mov	eax, [bp+var_176]
		mov	[bp+var_182], eax
		mov	eax, [bp+var_18A]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_186]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_182]
		jmp	loc_3440C
; ���������������������������������������������������������������������������

loc_34259:				; CODE XREF: Terrain_StreamingMain+34Ej
		mov	eax, [bp+var_136]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_156], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_152], eax
		mov	eax, [si+9]
		mov	[bp+var_BE], eax
		shl	eax, 8
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_15A]
		add	eax, [bp+var_C2]

loc_34293:
		mov	[bp+var_C6], eax
		mov	[bp+var_CA], eax
		mov	[bp+var_14E], eax
		mov	eax, [si+9]
		mov	[bp+var_CE], eax
		shl	eax, 8
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_156]
		sub	eax, [bp+var_D2]
		mov	[bp+var_D6], eax
		mov	[bp+var_DA], eax
		mov	[bp+var_14A], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+4]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_DC], ax
		movsx	eax, [bp+var_DC]
		shl	eax, 8
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_15A]
		mov	[bp+var_142], eax
		mov	eax, [bp+var_14A]
		mov	[bp+var_13E], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+6]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_E2], ax

loc_34326:
		movsx	eax, [bp+var_E2]
		shl	eax, 8
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_142]
		sub	eax, [bp+var_15A]
		mov	[bp+var_196], eax
		mov	eax, [bp+var_13E]
		sub	eax, [bp+var_156]
		mov	[bp+var_192], eax
		mov	eax, [bp+var_13A]
		sub	eax, [bp+var_152]
		mov	[bp+var_18E], eax
		mov	eax, [bp+var_196]
		mov	[bp+var_1A2], eax
		mov	eax, [bp+var_192]
		mov	[bp+var_19E], eax
		mov	eax, [bp+var_18E]
		mov	[bp+var_19A], eax
		mov	eax, [bp+var_1A2]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_19E]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_19A]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_14E]
		sub	eax, [bp+var_15A]
		mov	[bp+var_1AE], eax
		mov	eax, [bp+var_14A]
		sub	eax, [bp+var_156]
		mov	[bp+var_1AA], eax
		mov	eax, [bp+var_146]
		sub	eax, [bp+var_152]
		mov	[bp+var_1A6], eax
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1BA], eax
		mov	eax, [bp+var_1AA]
		mov	[bp+var_1B6], eax
		mov	eax, [bp+var_1A6]
		mov	[bp+var_1B2], eax
		mov	eax, [bp+var_1BA]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_1B6]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_1B2]

loc_3440C:				; CODE XREF: Terrain_StreamingMain+508j
		mov	[bp+var_116], eax

loc_34411:				; CODE XREF: Terrain_StreamingMain+31Dj
					; Terrain_StreamingMain+336j
		lea	ax, [bp+var_12A]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		lea	ax, [bp+var_11E]
		push	ax

loc_34421:
		call	Vector_NormalizeInPlace_5593A
		pop	cx

loc_34427:
		lea	ax, [bp+var_11E]
		push	ax
		lea	ax, [bp+var_12A]
		push	ax
		push	ss

loc_34432:
		lea	ax, [bp+var_1C6]

loc_34436:
		push	ax

loc_34437:
		call	Vector_CrossProduct3D_550B7
		add	sp, 8
		cmp	[bp+var_1BE], 0
		jge	short loc_3444C
		mov	ax, 1
		jmp	short loc_3444E
; ���������������������������������������������������������������������������

loc_3444C:				; CODE XREF: Terrain_StreamingMain+6F7j
		xor	ax, ax

loc_3444E:				; CODE XREF: Terrain_StreamingMain+6FCj
		or	al, al
		jz	short loc_3445D
		lea	ax, [bp+var_1C6]
		push	ax
		call	Utility_Helper_55A37
		pop	cx

loc_3445D:				; CODE XREF: Terrain_StreamingMain+702j
		mov	eax, [bp+var_1C6]
		mov	[di], eax
		mov	eax, [bp+var_1C2]
		mov	[di+4],	eax
		mov	eax, [bp+var_1BE]
		mov	[di+8],	eax
		mov	[bp+var_EA], 0

loc_34480:
		cmp	[bp+var_1BE], 0

loc_34486:
		jle	short loc_3448D

loc_34488:
		mov	ax, 1
		jmp	short loc_3448F
; ���������������������������������������������������������������������������

loc_3448D:				; CODE XREF: Terrain_StreamingMain:loc_34486j
		xor	ax, ax

loc_3448F:				; CODE XREF: Terrain_StreamingMain+73Dj
		or	al, al
		jnz	short loc_34496

loc_34493:
		jmp	loc_3454F
; ���������������������������������������������������������������������������

loc_34496:				; CODE XREF: Terrain_StreamingMain+743j
		mov	eax, [bp+var_1C6]
		mov	edx, eax
		mov	ecx, [bp+var_1BE]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_F2]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_1C2]
		mov	edx, eax
		mov	ecx, [bp+var_1BE]
		sar	edx, 18h

loc_344CE:
		shl	eax, 8

loc_344D2:
		idiv	ecx

loc_344D5:
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_FA]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_4E]
		mov	edx, [bp+var_EE]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_FE]
		mov	[bp+var_102], eax
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_52]
		imul	eax, -1
		mov	[bp+var_106], eax
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_10A]

loc_34520:
		mov	edx, [bp+var_F6]

loc_34525:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_112], eax
		add	[bp+var_EA], eax
		mov	eax, [bp+var_EA]
		imul	eax, -1
		mov	[bp+var_EA], eax

loc_3454F:				; CODE XREF: Terrain_StreamingMain:loc_34493j
		mov	eax, [bp+var_152]
		add	[bp+var_EA], eax
		mov	dword_6EA68, 0
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_EA]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Terrain_StreamingMain	endp

; ���������������������������������������������������������������������������

loc_34577:				; DATA XREF: seg339:4E04o
		push	bp
		mov	bp, sp
		push	seg seg073
		push	offset loc_345BB

loc_34580:
		push	large 10004h
		push	4
		push	5518h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_34595:				; DATA XREF: Terrain_SectorIndexSigned+134o
					; Terrain_SectorIndexSigned+14Eo ...
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		or	dx, dx
		jnz	short loc_345AD
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_345B7

loc_345AD:				; CODE XREF: seg073:109Dj
		mov	ax, dx
		add	ax, 4
		mov	ax, dx
		add	ax, 8

loc_345B7:				; CODE XREF: seg073:10ABj
		mov	ax, dx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_345BB:				; DATA XREF: seg073:107Do
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		or	dx, dx
		jnz	short loc_345D1
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax

loc_345CF:
		or	ax, ax

loc_345D1:				; CODE XREF: seg073:10C3j
		mov	ax, dx
		pop	bp
		retf
seg073		ends
