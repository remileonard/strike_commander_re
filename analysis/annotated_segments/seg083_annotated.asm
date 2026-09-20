seg083		segment	byte public 'CODE' use16
		assume cs:seg083
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,1699 lignes — la 2e plus grosse fonction de la base. Chargeur principal de modèles IFF
; 3D : détecte le VESA (INT15h), résout le chemin via Path_ResolveDataFile
; (OBJECTS\<nom>.IFF), vérifie le magic chunk 'REAL', lit le chunk 'OBJT' (sub_647B2).
; Correspond directement au format IFF déjà documenté dans le projet — c'est le point d'entrée
; principal du chargement de tout modèle 3D du jeu (avions, terrain, débris, armements),
; appelé par le système de débris (seg079) et vraisemblablement par tout le reste du pipeline
; de rendu. Priorité absolue pour une session d'analyse dédiée compte tenu de son rôle central
; et de son recoupement direct avec le format IFF déjà étudié. || AJOUT 2026-09-20 : DÉTERMINE
; LA CLASSE (ET LA CATÉGORIE vtable+8) DE L'OBJET selon le PREMIER chunk présent, testé dans
; l'ordre BOBJ, ORNT, TRCR, AFTB, MOBL, OMOB, GUID, ARMG, JETP, XMIT, WEAP, MISS, PODR, BOMB,
; DURD, DECY, SWPN, GRND, RNWY : chaque chunk alloue une taille de classe et écrit une suite
; de mots de vtable (constructeurs chaînés, la dernière gagne). Catégories : JETP=6, WEAP=7,
; MISS=8, BOMB/DURD=9, PODR=0xA, TRCR=0xD, AFTB=0xE, DECY=0x10, SWPN=0x13, GRND=0x14,
; XMIT=0x15. Voir analysis/AI_TICK_CALL_GRAPH.md.
; ==============================================================================================
IFF_LoadModelMain	proc far		; CODE XREF: ObjectPrototype_FindOrLoadAndInstantiate_38B70+2CP
					; Debris_LoadAndInstantiateAlt+2CP ...

var_16E		= word ptr -16Eh
var_11E		= word ptr -11Eh
var_C1		= dword	ptr -0C1h
var_BD		= dword	ptr -0BDh
var_B9		= dword	ptr -0B9h
var_B1		= dword	ptr -0B1h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
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
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp

loc_3B879:				; DATA XREF: seg216:035Eo
		sub	sp, 16Eh
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_11E], 2C8h

loc_3B8A2:
		mov	[bp+var_BD], 100h

loc_3B8AB:
		mov	[bp+var_C1], 0
		mov	[bp+var_11E], 2E0h
		mov	[bp+var_A2], 0
		xor	ax, ax
		mov	[bp+var_A4], ax
		movsx	eax, ax
		mov	[bp+var_B9], eax
		mov	eax, [bp+arg_2]
		mov	[bp+var_12], eax
		push	8
		push	large [bp+var_12]
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_MemFamily_Extra8

loc_3B8E7:
		add	sp, 0Ah

loc_3B8EA:
		mov	[bp+var_6], 0
		push	ss
		lea	ax, [bp+var_E]

loc_3B8F2:
		push	ax
		push	si
		call	Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0
		jz	short loc_3B90C
		jmp	loc_3C7EC
; ���������������������������������������������������������������������������

loc_3B90C:				; CODE XREF: IFF_LoadModelMain+91j
		mov	byte_70447, 0
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	offset aObjects	; "OBJECTS"
		lea	ax, [bp+var_16E]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_16E]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		mov	bx, [bp+var_11E]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+var_B1], 'LAER' ; REAL
		jnz	short loc_3B953
		mov	ax, 1
		jmp	short loc_3B955
; ���������������������������������������������������������������������������

loc_3B953:				; CODE XREF: IFF_LoadModelMain+D6j
		xor	ax, ax

loc_3B955:				; CODE XREF: IFF_LoadModelMain+DBj
		or	ax, ax
		jnz	short loc_3B95C
		jmp	loc_3C7E3
; ���������������������������������������������������������������������������

loc_3B95C:				; CODE XREF: IFF_LoadModelMain+E1j
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		push	0
		push	large 'TJBO'    ; OBJT

loc_3B96F:
		lea	ax, [bp+var_11E]

loc_3B973:
		push	ax

loc_3B974:
		call	ResourceRecord_SeekAndReadB_647B2

loc_3B979:
		add	sp, 8
		or	ax, ax

loc_3B97E:
		jnz	short loc_3B983
		jmp	loc_3C7B9
; ���������������������������������������������������������������������������

loc_3B983:				; CODE XREF: IFF_LoadModelMain:loc_3B97Ej
		push	0
		push	large 'JBOB'    ; BOBJ
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3BA03
		push	1
		push	0
		push	2
		push	large 35h ; '5'
		push	5C44h

loc_3B9A8:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], ax
		or	ax, dx
		jz	short loc_3B9EA
		les	bx, [bp+var_1E]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		lea	ax, [bp+var_11E]
		push	ax
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFF
		add	sp, 6

loc_3B9E2:
		mov	dx, word ptr [bp+var_1E+2]
		mov	ax, word ptr [bp+var_1E]
		jmp	short loc_3B9F0
; ���������������������������������������������������������������������������

loc_3B9EA:				; CODE XREF: IFF_LoadModelMain+142j
		mov	dx, word ptr [bp+var_1E+2]

loc_3B9ED:
		mov	ax, word ptr [bp+var_1E]

loc_3B9F0:				; CODE XREF: IFF_LoadModelMain+172j
					; IFF_LoadModelMain+206j ...
		mov	word ptr [bp+var_16+2],	dx

loc_3B9F3:
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		jmp	loc_3C767
; ���������������������������������������������������������������������������

loc_3BA03:				; CODE XREF: IFF_LoadModelMain+124j
		push	0
		push	large 'TNRO'    ; ORNT
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3BA88
		push	1
		push	0
		push	2
		push	large 36h ; '6'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		or	ax, dx
		jz	short loc_3BA7F
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 2578h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_22+2]
		push	bx

loc_3BA6E:
		call	IFF_LoadAngleParam
		add	sp, 6
		mov	dx, word ptr [bp+var_22+2]
		mov	ax, word ptr [bp+var_22]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BA7F:				; CODE XREF: IFF_LoadModelMain+1C2j
		mov	dx, word ptr [bp+var_22+2]
		mov	ax, word ptr [bp+var_22]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BA88:				; CODE XREF: IFF_LoadModelMain+1A4j
		push	0
		push	large 'RCRT'    ; TRCR
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3BAA4
		jmp	loc_3BB2D
; ���������������������������������������������������������������������������

loc_3BAA4:				; CODE XREF: IFF_LoadModelMain+229j
		push	1
		push	0

loc_3BAA8:
		push	2

loc_3BAAA:
		push	large 82h ; '�'

loc_3BAB0:
		push	5C44h

loc_3BAB3:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		or	ax, dx
		jz	short loc_3BB24
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 2578h

loc_3BAF0:
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 2540h
		mov	word ptr es:[bx], 255Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_26+2]
		push	bx
		call	VROOMM_StubThunk_6CC70
		add	sp, 6
		mov	dx, word ptr [bp+var_26+2]
		mov	ax, word ptr [bp+var_26]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BB24:				; CODE XREF: IFF_LoadModelMain+24Dj
		mov	dx, word ptr [bp+var_26+2]
		mov	ax, word ptr [bp+var_26]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BB2D:				; CODE XREF: IFF_LoadModelMain+22Bj
		push	0
		push	large 'BTFA'    ; AFTB
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3BBB7
		push	1
		push	0
		push	2
		push	large 36h ; '6'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_2A+2],	dx
		mov	word ptr [bp+var_2A], ax
		or	ax, dx
		jz	short loc_3BBAE
		les	bx, [bp+var_2A]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax

loc_3BB6F:
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx

loc_3BB7F:
		call	VROOMM_StubThunk_6BFFA

loc_3BB84:
		add	sp, 4
		les	bx, [bp+var_2A]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx], 2518h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_2A+2]
		push	bx

loc_3BB9D:
		call	VROOMM_StubThunk_6CCB4
		add	sp, 6

loc_3BBA5:
		mov	dx, word ptr [bp+var_2A+2]
		mov	ax, word ptr [bp+var_2A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BBAE:				; CODE XREF: IFF_LoadModelMain+2ECj
		mov	dx, word ptr [bp+var_2A+2]
		mov	ax, word ptr [bp+var_2A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BBB7:				; CODE XREF: IFF_LoadModelMain+2CEj
		push	0
		push	large 'LBOM'    ; MOBL
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3BC42
		push	1
		push	0
		push	2
		push	large 37h ; '7'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_2E+2],	dx
		mov	word ptr [bp+var_2E], ax
		or	ax, dx
		jz	short loc_3BC39
		les	bx, [bp+var_2E]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_2E]
		mov	word ptr es:[bx+35h], 0
		mov	word ptr es:[bx], 2504h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_2E+2]
		push	bx
		call	VROOMM_StubThunk_6C1C0
		add	sp, 6
		mov	dx, word ptr [bp+var_2E+2]
		mov	ax, word ptr [bp+var_2E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BC39:				; CODE XREF: IFF_LoadModelMain+376j
		mov	dx, word ptr [bp+var_2E+2]
		mov	ax, word ptr [bp+var_2E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BC42:				; CODE XREF: IFF_LoadModelMain+358j
		push	0
		push	large 'BOMO'    ; OMOB
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3BCD7
		push	1
		push	0
		push	2
		push	large 46h ; 'F'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_32+2],	dx

loc_3BC72:
		mov	word ptr [bp+var_32], ax

loc_3BC75:
		or	ax, dx

loc_3BC77:
		jz	short loc_3BCCE
		les	bx, [bp+var_32]

loc_3BC7C:
		mov	word ptr es:[bx], 1B6Fh

loc_3BC81:
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_32]

loc_3BC9F:
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_32+2]
		push	bx
		call	VROOMM_StubThunk_6C1CA
		add	sp, 6
		mov	dx, word ptr [bp+var_32+2]
		mov	ax, word ptr [bp+var_32]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BCCE:				; CODE XREF: IFF_LoadModelMain:loc_3BC77j
		mov	dx, word ptr [bp+var_32+2]
		mov	ax, word ptr [bp+var_32]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BCD7:				; CODE XREF: IFF_LoadModelMain+3E3j
		push	0
		push	large 'DIUG'    ; GUID

loc_3BCDF:
		lea	ax, [bp+var_11E]

loc_3BCE3:
		push	ax

loc_3BCE4:
		call	ResourceRecord_SeekAndReadB_647B2

loc_3BCE9:
		add	sp, 8
		or	ax, ax

loc_3BCEE:
		jnz	short loc_3BCF3
		jmp	loc_3BD7D
; ���������������������������������������������������������������������������

loc_3BCF3:				; CODE XREF: IFF_LoadModelMain:loc_3BCEEj
		push	1
		push	0
		push	2
		push	large 4Ah ; 'J'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_36+2],	dx
		mov	word ptr [bp+var_36], ax
		or	ax, dx
		jz	short loc_3BD74
		les	bx, [bp+var_36]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_36]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	dword ptr es:[bx+46h], 0
		mov	word ptr es:[bx], 24F0h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_36+2]
		push	bx
		call	VROOMM_StubThunk_6C1D4
		add	sp, 6
		mov	dx, word ptr [bp+var_36+2]
		mov	ax, word ptr [bp+var_36]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BD74:				; CODE XREF: IFF_LoadModelMain+499j
		mov	dx, word ptr [bp+var_36+2]
		mov	ax, word ptr [bp+var_36]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BD7D:				; CODE XREF: IFF_LoadModelMain+47Aj
		push	0

loc_3BD7F:				; ARMG
		push	large 'GMRA'

loc_3BD85:
		lea	ax, [bp+var_11E]
		push	ax

loc_3BD8A:
		call	ResourceRecord_SeekAndReadB_647B2

loc_3BD8F:
		add	sp, 8

loc_3BD92:
		or	ax, ax

loc_3BD94:
		jnz	short loc_3BD99

loc_3BD96:
		jmp	loc_3BE31
; ���������������������������������������������������������������������������

loc_3BD99:				; CODE XREF: IFF_LoadModelMain:loc_3BD94j
		push	1
		push	0
		push	2
		push	large 4Eh ; 'N'

loc_3BDA2:
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax

loc_3BDB3:
		or	ax, dx
		jz	short loc_3BE28
		les	bx, [bp+var_3A]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_3A]

loc_3BDDD:
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	dword ptr es:[bx+46h], 0
		mov	word ptr es:[bx], 24F0h
		mov	dword ptr es:[bx+4Ah], 0
		mov	word ptr es:[bx], 24DCh
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_3A+2]
		push	bx
		call	VROOMM_StubThunk_6C200
		add	sp, 6
		mov	dx, word ptr [bp+var_3A+2]
		mov	ax, word ptr [bp+var_3A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BE28:				; CODE XREF: IFF_LoadModelMain+53Fj
		mov	dx, word ptr [bp+var_3A+2]
		mov	ax, word ptr [bp+var_3A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BE31:				; CODE XREF: IFF_LoadModelMain:loc_3BD96j
		push	0
		push	large 'PTEJ'    ; JETP
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3BE4D
		jmp	loc_3BF07
; ���������������������������������������������������������������������������

loc_3BE4D:				; CODE XREF: IFF_LoadModelMain+5D2j
		push	1
		push	0
		push	2
		push	large 6Ah ; 'j'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_3E+2],	dx
		mov	word ptr [bp+var_3E], ax
		or	ax, dx
		jnz	short loc_3BE6E
		jmp	loc_3BEFE
; ���������������������������������������������������������������������������

loc_3BE6E:				; CODE XREF: IFF_LoadModelMain+5F3j
		les	bx, [bp+var_3E]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax

loc_3BE83:
		mov	es:[bx+33h], al

loc_3BE87:
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA

loc_3BE8E:
		add	sp, 4
		les	bx, [bp+var_3E]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0

loc_3BE9F:
		mov	word ptr es:[bx], 252Ch

loc_3BEA4:
		mov	byte ptr es:[bx+38h], 0

loc_3BEA9:
		mov	dword ptr es:[bx+46h], 0
		mov	word ptr es:[bx], 24F0h
		mov	dword ptr es:[bx+4Ah], 0
		mov	word ptr es:[bx], 24DCh
		mov	dword ptr es:[bx+4Eh], 0
		mov	word ptr es:[bx], 24C8h
		xor	eax, eax
		mov	es:[bx+5Eh], eax
		mov	es:[bx+5Ah], eax

loc_3BEE0:
		mov	es:[bx+62h], al
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_3E+2]
		push	bx
		call	VROOMM_StubThunk_6C260

loc_3BEF2:
		add	sp, 6
		mov	dx, word ptr [bp+var_3E+2]
		mov	ax, word ptr [bp+var_3E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BEFE:				; CODE XREF: IFF_LoadModelMain+5F5j
		mov	dx, word ptr [bp+var_3E+2]
		mov	ax, word ptr [bp+var_3E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BF07:				; CODE XREF: IFF_LoadModelMain+5D4j
		push	0
		push	large 'TIMX'    ; XMIT
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3BF91
		push	1
		push	0
		push	2
		push	large 36h ; '6'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_42+2],	dx
		mov	word ptr [bp+var_42], ax
		or	ax, dx
		jz	short loc_3BF88
		les	bx, [bp+var_42]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_42]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx], 24B4h
		lea	ax, [bp+var_11E]
		push	ax

loc_3BF73:
		push	word ptr [bp+var_42+2]
		push	bx
		call	VROOMM_StubThunk_6C6D0
		add	sp, 6
		mov	dx, word ptr [bp+var_42+2]

loc_3BF82:
		mov	ax, word ptr [bp+var_42]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BF88:				; CODE XREF: IFF_LoadModelMain+6C6j
		mov	dx, word ptr [bp+var_42+2]

loc_3BF8B:
		mov	ax, word ptr [bp+var_42]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3BF91:				; CODE XREF: IFF_LoadModelMain+6A8j
		push	0
		push	large 'PAEW'    ; WEAP
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3BFAD
		jmp	loc_3C02E
; ���������������������������������������������������������������������������

loc_3BFAD:				; CODE XREF: IFF_LoadModelMain+732j
		push	1
		push	0
		push	2
		push	large 5Eh ; '^'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2],	dx
		mov	word ptr [bp+var_46], ax
		or	ax, dx
		jz	short loc_3C025
		les	bx, [bp+var_46]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al

loc_3BFE4:
		push	dx
		push	bx

loc_3BFE6:
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4

loc_3BFEE:
		les	bx, [bp+var_46]

loc_3BFF1:
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 2540h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_46+2]
		push	bx
		call	VROOMM_StubThunk_6C5A5
		add	sp, 6
		mov	dx, word ptr [bp+var_46+2]
		mov	ax, word ptr [bp+var_46]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C025:				; CODE XREF: IFF_LoadModelMain+753j
		mov	dx, word ptr [bp+var_46+2]
		mov	ax, word ptr [bp+var_46]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C02E:				; CODE XREF: IFF_LoadModelMain+734j
		push	0
		push	large 'SSIM'    ; MISS
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C04A
		jmp	loc_3C0D0
; ���������������������������������������������������������������������������

loc_3C04A:				; CODE XREF: IFF_LoadModelMain+7CFj
		push	1
		push	0
		push	2
		push	large 65h ; 'e'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4A+2],	dx
		mov	word ptr [bp+var_4A], ax
		or	ax, dx
		jz	short loc_3C0C7
		les	bx, [bp+var_4A]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax

loc_3C073:
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA

loc_3C088:
		add	sp, 4
		les	bx, [bp+var_4A]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 2540h
		mov	word ptr es:[bx], 2498h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_4A+2]
		push	bx
		call	VROOMM_StubThunk_6C530
		add	sp, 6
		mov	dx, word ptr [bp+var_4A+2]
		mov	ax, word ptr [bp+var_4A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C0C7:				; CODE XREF: IFF_LoadModelMain+7F0j
		mov	dx, word ptr [bp+var_4A+2]
		mov	ax, word ptr [bp+var_4A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C0D0:				; CODE XREF: IFF_LoadModelMain+7D1j
		push	0
		push	large 'RDOP'    ; PODR
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C0EC
		jmp	loc_3C183
; ���������������������������������������������������������������������������

loc_3C0EC:				; CODE XREF: IFF_LoadModelMain+871j
		push	1
		push	0
		push	2
		push	large 6Ah ; 'j'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4E+2],	dx
		mov	word ptr [bp+var_4E], ax
		or	ax, dx
		jz	short loc_3C17A
		les	bx, [bp+var_4E]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_4E]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 2540h
		mov	word ptr es:[bx], 247Ch
		xor	eax, eax
		mov	es:[bx+63h], eax
		mov	es:[bx+5Fh], eax
		mov	es:[bx+67h], al
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_4E+2]
		push	bx
		call	VROOMM_StubThunk_6C6A0
		add	sp, 6
		mov	dx, word ptr [bp+var_4E+2]
		mov	ax, word ptr [bp+var_4E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C17A:				; CODE XREF: IFF_LoadModelMain+892j
		mov	dx, word ptr [bp+var_4E+2]
		mov	ax, word ptr [bp+var_4E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C183:				; CODE XREF: IFF_LoadModelMain+873j
		push	0

loc_3C185:
		push	large 'BMOB'
		lea	ax, [bp+var_11E]
		push	ax

loc_3C190:
		call	ResourceRecord_SeekAndReadB_647B2

loc_3C195:
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C19F
		jmp	loc_3C225
; ���������������������������������������������������������������������������

loc_3C19F:				; CODE XREF: IFF_LoadModelMain+924j
		push	1

loc_3C1A1:
		push	0

loc_3C1A3:
		push	2

loc_3C1A5:
		push	large 63h ; 'c'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_52+2],	dx
		mov	word ptr [bp+var_52], ax
		or	ax, dx
		jz	short loc_3C21C
		les	bx, [bp+var_52]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_52]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch

loc_3C1F3:
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 2540h
		mov	word ptr es:[bx], 2460h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_52+2]
		push	bx
		call	VROOMM_StubThunk_6C470
		add	sp, 6
		mov	dx, word ptr [bp+var_52+2]
		mov	ax, word ptr [bp+var_52]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C21C:				; CODE XREF: IFF_LoadModelMain+945j
		mov	dx, word ptr [bp+var_52+2]
		mov	ax, word ptr [bp+var_52]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C225:				; CODE XREF: IFF_LoadModelMain+926j
		push	0
		push	large 'DRUD'    ; DURD
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C241
		jmp	loc_3C2CC
; ���������������������������������������������������������������������������

loc_3C241:				; CODE XREF: IFF_LoadModelMain+9C6j
		push	1
		push	0
		push	2
		push	large 67h ; 'g'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_56+2],	dx
		mov	word ptr [bp+var_56], ax
		or	ax, dx
		jz	short loc_3C2C3
		les	bx, [bp+var_56]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA

loc_3C27F:
		add	sp, 4
		les	bx, [bp+var_56]

loc_3C285:
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 2540h
		mov	word ptr es:[bx], 2460h
		mov	word ptr es:[bx], 2444h
		lea	ax, [bp+var_11E]
		push	ax

loc_3C2AE:
		push	word ptr [bp+var_56+2]
		push	bx

loc_3C2B2:
		call	VROOMM_StubThunk_6C484

loc_3C2B7:
		add	sp, 6
		mov	dx, word ptr [bp+var_56+2]
		mov	ax, word ptr [bp+var_56]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C2C3:				; CODE XREF: IFF_LoadModelMain+9E7j
		mov	dx, word ptr [bp+var_56+2]
		mov	ax, word ptr [bp+var_56]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C2CC:				; CODE XREF: IFF_LoadModelMain+9C8j
		push	0
		push	large 'YCED'    ; DECY
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3C35C

loc_3C2E5:
		push	1
		push	0
		push	2
		push	large 3Bh ; ';'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_5A+2],	dx
		mov	word ptr [bp+var_5A], ax
		or	ax, dx
		jz	short loc_3C353
		les	bx, [bp+var_5A]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_5A]
		mov	word ptr es:[bx+35h], 0
		mov	word ptr es:[bx], 2504h
		mov	word ptr es:[bx], 2430h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_5A+2]
		push	bx
		call	VROOMM_StubThunk_6C080
		add	sp, 6
		mov	dx, word ptr [bp+var_5A+2]
		mov	ax, word ptr [bp+var_5A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C353:				; CODE XREF: IFF_LoadModelMain+A8Bj
		mov	dx, word ptr [bp+var_5A+2]
		mov	ax, word ptr [bp+var_5A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C35C:				; CODE XREF: IFF_LoadModelMain+A6Dj
		push	0
		push	large 'NPWS'    ; SWPN
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3C3E6
		push	1
		push	0
		push	2
		push	large 51h ; 'Q'
		push	5C44h

loc_3C381:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_5E+2],	dx
		mov	word ptr [bp+var_5E], ax
		or	ax, dx
		jz	short loc_3C3DD
		les	bx, [bp+var_5E]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax

loc_3C3A8:
		mov	es:[bx+33h], al

loc_3C3AC:
		push	dx
		push	bx

loc_3C3AE:
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_5E]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx], 241Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_5E+2]
		push	bx
		call	VROOMM_StubThunk_6C5E0
		add	sp, 6
		mov	dx, word ptr [bp+var_5E+2]
		mov	ax, word ptr [bp+var_5E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C3DD:				; CODE XREF: IFF_LoadModelMain+B1Bj
		mov	dx, word ptr [bp+var_5E+2]
		mov	ax, word ptr [bp+var_5E]

loc_3C3E3:
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C3E6:				; CODE XREF: IFF_LoadModelMain+AFDj
		push	0
		push	large 'DNRG'    ; GRND
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C402
		jmp	loc_3C483
; ���������������������������������������������������������������������������

loc_3C402:				; CODE XREF: IFF_LoadModelMain+B87j
		push	1
		push	0
		push	2
		push	large 46h ; 'F'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_62+2],	dx
		mov	word ptr [bp+var_62], ax
		or	ax, dx
		jz	short loc_3C47A
		les	bx, [bp+var_62]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_62]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 2408h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_62+2]
		push	bx
		call	VROOMM_StubThunk_6C670
		add	sp, 6
		mov	dx, word ptr [bp+var_62+2]
		mov	ax, word ptr [bp+var_62]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C47A:				; CODE XREF: IFF_LoadModelMain+BA8j
		mov	dx, word ptr [bp+var_62+2]
		mov	ax, word ptr [bp+var_62]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C483:				; CODE XREF: IFF_LoadModelMain+B89j
		push	0
		push	large 'YWNR'    ; RNWY
		lea	ax, [bp+var_11E]
		push	ax

loc_3C490:
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3C50D
		push	1
		push	0
		push	2

loc_3C4A2:
		push	large 36h ; '6'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_3C4AD:
		add	sp, 0Ch

loc_3C4B0:
		mov	word ptr [bp+var_66+2],	dx

loc_3C4B3:
		mov	word ptr [bp+var_66], ax

loc_3C4B6:
		or	ax, dx
		jz	short loc_3C504

loc_3C4BA:
		les	bx, [bp+var_66]

loc_3C4BD:
		mov	word ptr es:[bx], 1B6Fh

loc_3C4C2:
		xor	eax, eax

loc_3C4C5:
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_66]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx], 23F4h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_66+2]
		push	bx
		call	IFF_LoadAngleParam_Wrapper
		add	sp, 6
		mov	dx, word ptr [bp+var_66+2]
		mov	ax, word ptr [bp+var_66]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C504:				; CODE XREF: IFF_LoadModelMain+C42j
		mov	dx, word ptr [bp+var_66+2]
		mov	ax, word ptr [bp+var_66]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C50D:				; CODE XREF: IFF_LoadModelMain+C24j
		push	0
		push	large 'LPXE'    ; EXPL
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3C597
		push	1
		push	0
		push	2
		push	large 3Eh ; '>'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_6A+2],	dx
		mov	word ptr [bp+var_6A], ax
		or	ax, dx
		jz	short loc_3C58E
		les	bx, [bp+var_6A]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_6A]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx], 23E0h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_6A+2]
		push	bx
		call	IFF_RecordSubtype

loc_3C582:
		add	sp, 6
		mov	dx, word ptr [bp+var_6A+2]

loc_3C588:
		mov	ax, word ptr [bp+var_6A]

loc_3C58B:
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C58E:				; CODE XREF: IFF_LoadModelMain+CCCj
		mov	dx, word ptr [bp+var_6A+2]
		mov	ax, word ptr [bp+var_6A]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C597:				; CODE XREF: IFF_LoadModelMain+CAEj
		push	0
		push	large 'RBED'    ; DEBR
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3C627
		push	1

loc_3C5B2:
		push	0
		push	2

loc_3C5B6:
		push	large 3Bh ; ';'
		push	5C44h

loc_3C5BC:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_6E+2],	dx
		mov	word ptr [bp+var_6E], ax
		or	ax, dx
		jz	short loc_3C61E
		les	bx, [bp+var_6E]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_6E]
		mov	word ptr es:[bx+35h], 0
		mov	word ptr es:[bx], 2504h
		mov	word ptr es:[bx], 23CCh
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_6E+2]
		push	bx
		call	IFF_LoadInfoChunk
		add	sp, 6
		mov	dx, word ptr [bp+var_6E+2]
		mov	ax, word ptr [bp+var_6E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C61E:				; CODE XREF: IFF_LoadModelMain+D56j
		mov	dx, word ptr [bp+var_6E+2]
		mov	ax, word ptr [bp+var_6E]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C627:				; CODE XREF: IFF_LoadModelMain+D38j
		push	0
		push	large 474B4D53h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_3C6B1
		push	1
		push	0
		push	2
		push	large 46h ; 'F'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_72+2],	dx
		mov	word ptr [bp+var_72], ax
		or	ax, dx
		jz	short loc_3C6A8
		les	bx, [bp+var_72]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_72]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx], 23B8h
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_72+2]
		push	bx
		call	VROOMM_StubThunk_6CC1A
		add	sp, 6
		mov	dx, word ptr [bp+var_72+2]
		mov	ax, word ptr [bp+var_72]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C6A8:				; CODE XREF: IFF_LoadModelMain+DE6j
		mov	dx, word ptr [bp+var_72+2]
		mov	ax, word ptr [bp+var_72]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C6B1:				; CODE XREF: IFF_LoadModelMain+DC8j
		push	0

loc_3C6B3:
		push	large 43454A45h

loc_3C6B9:
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C6CD
		jmp	loc_3C75F
; ���������������������������������������������������������������������������

loc_3C6CD:				; CODE XREF: IFF_LoadModelMain+E52j
		push	1
		push	0
		push	2
		push	large 5Bh ; '['
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_76+2],	dx
		mov	word ptr [bp+var_76], ax
		or	ax, dx
		jz	short loc_3C756
		les	bx, [bp+var_76]
		mov	word ptr es:[bx], 1B6Fh
		xor	eax, eax
		mov	es:[bx+2Fh], eax
		mov	es:[bx+2Bh], eax
		mov	es:[bx+33h], al
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BFFA
		add	sp, 4
		les	bx, [bp+var_76]
		mov	word ptr es:[bx], 2578h
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx], 252Ch
		mov	byte ptr es:[bx+38h], 0
		mov	word ptr es:[bx], 23A4h
		xor	eax, eax
		mov	es:[bx+4Eh], eax
		mov	es:[bx+4Ah], eax
		mov	es:[bx+52h], al
		lea	ax, [bp+var_11E]
		push	ax
		push	word ptr [bp+var_76+2]
		push	bx
		call	VROOMM_StubThunk_6CCF0
		add	sp, 6
		mov	dx, word ptr [bp+var_76+2]
		mov	ax, word ptr [bp+var_76]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C756:				; CODE XREF: IFF_LoadModelMain+E73j
		mov	dx, word ptr [bp+var_76+2]
		mov	ax, word ptr [bp+var_76]
		jmp	loc_3B9F0
; ���������������������������������������������������������������������������

loc_3C75F:				; CODE XREF: IFF_LoadModelMain+E54j
		push	0C015h
		call	VROOMM_StubThunk_6B70F

loc_3C767:				; CODE XREF: IFF_LoadModelMain+18Aj
		pop	cx
		cmp	[bp+var_16], 0
		jz	short loc_3C7B0
		lea	ax, [bp+var_11E]
		push	ax
		push	large [bp+var_16]
		call	VROOMM_StubThunk_6C004
		add	sp, 6
		push	large [bp+var_16]
		push	si
		call	VROOMM_StubThunk_6C013
		add	sp, 6
		push	8
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, word ptr [bp+var_16]
		add	ax, 2Bh	; '+'
		push	word ptr [bp+var_16+2]
		push	ax

loc_3C79E:
		call	CRT_MemFamily_Extra8

loc_3C7A3:
		add	sp, 0Ah

loc_3C7A6:
		les	bx, [bp+var_16]

loc_3C7A9:
		mov	byte ptr es:[bx+33h], 0

loc_3C7AE:
		jmp	short loc_3C7B9
; ���������������������������������������������������������������������������

loc_3C7B0:				; CODE XREF: IFF_LoadModelMain+EF7j
		push	0C014h

loc_3C7B3:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_3C7B9:				; CODE XREF: IFF_LoadModelMain+10Aj
					; IFF_LoadModelMain:loc_3C7AEj
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		cmp	[bp+var_16], 0
		jz	short loc_3C7EC
		lea	ax, [bp+var_11E]
		push	ax
		call	VROOMM_StubThunk_6B8BA
		pop	cx
		les	bx, [bp+var_16]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax
		jmp	short loc_3C7EC
; ���������������������������������������������������������������������������

loc_3C7E3:				; CODE XREF: IFF_LoadModelMain+E3j
		push	0C016h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_3C7EC:				; CODE XREF: IFF_LoadModelMain+93j
					; IFF_LoadModelMain+F53j ...
		les	bx, [bp+var_16]
		mov	al, [bp+arg_6]
		mov	es:[bx+2], al
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_11E], 2E0h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		pop	si
		leave
		retf
IFF_LoadModelMain	endp

; ���������������������������������������������������������������������������

loc_3C827:				; DATA XREF: seg339:off_6F468o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_3C869
		push	0
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_3C869
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_3C869:				; CODE XREF: seg083:0FC6j seg083:0FDAj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3C86C:				; DATA XREF: seg339:23F4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_3C8AE
		push	0

loc_3C87F:
		push	large dword ptr	[bp+6]

loc_3C883:
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_3C8AE
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax

loc_3C8A1:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_3C8AE:				; CODE XREF: seg083:100Bj seg083:101Fj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3C8B1:				; DATA XREF: seg339:off_6F4E0o
		push	bp
		mov	bp, sp

loc_3C8B4:
		sub	sp, 4
		push	si

loc_3C8B8:
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_3C8F3

loc_3C8C2:
		push	0

loc_3C8C4:
		push	large dword ptr	[bp+6]
		call	Camera_DestructSimple
		add	sp, 6
		test	si, 1
		jz	short loc_3C8F3
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_3C8F3:				; CODE XREF: seg083:1050j seg083:1064j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3C8F6:				; DATA XREF: seg339:2578o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_3C938
		push	0
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_3C938
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h

loc_3C92E:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_3C938:				; CODE XREF: seg083:1095j seg083:10A9j
		pop	si
		leave
		retf
seg083		ends
