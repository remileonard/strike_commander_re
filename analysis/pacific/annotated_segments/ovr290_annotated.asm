ovr290		segment	para public 'OVERLAY' use16
		assume cs:ovr290
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. byte_77BFD = 0, mesure la mémoire libre (sub_64B0E), compare à 10 000
; 000, puis byte_77BFD = 1 (aucun saut entre les deux dans ce listing) ; efface la table
; d'utilisation seg226 (sub_380B, 255 octets).
; ==============================================================================================
TerrainTextures_PrepareCache_A85B0		proc far
		push	bp
		mov	bp, sp
		mov	byte_77BFD, 0
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		cmp	eax, 989680h
		mov	byte_77BFD, 1
		push	large 0FF0000h
		push	seg seg226
		push	0
		call	sub_380B
		add	sp, 8
		pop	bp
		retf
TerrainTextures_PrepareCache_A85B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Réserve la place n de la table des textures du sol sans image :
; enregistrement +4 = n, +0Ch = 255 (pas chargée).
; ==============================================================================================
TerrainTextures_ReserveSlot_A85E2		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	cx, [bp+arg_0]
		mov	dx, cx
		cmp	dx, word_7CCEA
		jnb	short loc_A8606
		mov	ax, dx
		imul	ax, ax, 0Eh
		mov	edx, dword_7CCF0
		push	ax
		mov	ax, word_7CCEE
		pop	bx
		add	ax, bx
		jmp	short loc_A8627

loc_A8606:
		sub	dx, word_7CCEA
		cmp	dx, word_7CCEC
		jnb	short loc_A8623
		mov	ax, dx
		imul	ax, ax, 18h
		mov	edx, dword_7CCF4
		push	ax
		mov	ax, word_7CCF2
		pop	bx
		add	ax, bx
		jmp	short loc_A8627

loc_A8623:
		xor	dx, dx
		xor	ax, ax

loc_A8627:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_A864B
		mov	[bp+var_6], cx
		mov	ax, [bp+var_6]
		cwd
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		mov	byte ptr es:[bx+0Ch], 0FFh

loc_A864B:
		leave
		retf
TerrainTextures_ReserveSlot_A85E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Table des textures du sol (word_7CCEA : +0 simples, +2 animées, +4
; table pas de 14, +8 table pas de 24). Lit le FORM TXMS du terrain (dans <nom>.ZIP, ressource
; TERA) : INFO = 2 mots (les deux nombres, 255 et 255 pour OAHU) ; ouvre TXM\TXMPACK.PAK ;
; MAPS = enregistrements de 12 octets (mot numéro = place, sans soustraction ; nom 8 octets ;
; octet 11 = nombre d'images) ; 1 image → place = numéro ; bit 7 → animée ; sinon n images «
; %s%d » aux places numéro … numéro + n − 1. Numéro 255 sauté ; numéros ≤ 215 sautés si
; byte_77BF4 = 0 (1 au départ). Les images ne sont pas chargées ici : byte_77BFD (toujours 1
; dans ce listing, TerrainTextures_PrepareCache_A85B0) → TerrainTextures_ReserveSlot_A85E2 ;
; chargement à la demande par TerrainTextures_LoadOnDemand_324D1.
; ==============================================================================================
TerrainTextures_LoadTerrainList_A864D		proc far

var_E8		= word ptr -0E8h
var_DA		= word ptr -0DAh
var_D8		= word ptr -0D8h
var_CF		= byte ptr -0CFh
var_CE		= word ptr -0CEh
var_56		= word ptr -56h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0E8h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	cs
		call	near ptr TerrainTextures_PrepareCache_A85B0
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A8675
		jmp	loc_A885B

loc_A8675:
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A86A7
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], ax
		jmp	short loc_A86B0

loc_A86A7:
		push	0E006h
		call	sub_1DDFE
		pop	cx

loc_A86B0:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_751B0
		add	sp, 8
		push	ds
		push	offset aPAK
		push	ds
		push	offset aTXMPACK
		push	ds
		push	offset aTXM
		lea	ax, [bp+var_56]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_CE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	1
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		mov	bx, [bp+var_CE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 5350414Dh
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A8716
		jmp	loc_A8845

loc_A8716:
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_A8736
		jmp	loc_A8845

loc_A8736:
		mov	[bp+var_4], 0
		jmp	loc_A883A

loc_A873E:
		push	large 0Ch
		push	ss
		lea	ax, [bp+var_DA]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		cmp	[bp+var_CF], 1
		jnz	short loc_A87A5
		cmp	[bp+var_DA], 0FFh
		jz	short loc_A87A5
		cmp	byte_77BF4, 0
		jnz	short loc_A8771
		cmp	[bp+var_DA], 0D7h
		jg	short loc_A8771
		jmp	loc_A8837

loc_A8771:
		cmp	byte_77BFD, 0
		jz	short loc_A8784
		push	[bp+var_DA]
		push	cs
		call	near ptr TerrainTextures_ReserveSlot_A85E2
		pop	cx
		jmp	loc_A8837

loc_A8784:
		push	[bp+var_DA]
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	[bp+var_DA]
		push	large [bp+arg_0]
		call	sub_751B5
		add	sp, 0Ch
		jmp	loc_A8837

loc_A87A5:
		mov	al, [bp+var_CF]
		mov	ah, 0
		and	ax, 7Fh
		mov	[bp+var_6], ax
		test	[bp+var_CF], 80h
		jz	short loc_A87DB
		push	[bp+var_DA]
		lea	ax, [bp+var_CE]
		push	ax
		push	[bp+var_6]
		lea	ax, [bp+var_D8]
		push	ax
		push	[bp+var_DA]
		push	large [bp+arg_0]
		call	sub_751BA
		add	sp, 0Eh
		jmp	short loc_A8837

loc_A87DB:
		mov	di, 1
		jmp	short loc_A8832

loc_A87E0:
		push	di
		lea	ax, [bp+var_D8]
		push	ax
		push	14CEh
		lea	ax, [bp+var_E8]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	dx, di
		add	dx, [bp+var_DA]
		dec	dx
		cmp	byte_77BF4, 0
		jnz	short loc_A880A
		cmp	dx, 0D7h
		jle	short loc_A8831

loc_A880A:
		cmp	byte_77BFD, 0
		jz	short loc_A8819
		push	dx
		push	cs
		call	near ptr TerrainTextures_ReserveSlot_A85E2
		pop	cx
		jmp	short loc_A8831

loc_A8819:
		push	dx
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	dx
		push	large [bp+arg_0]
		call	sub_751B5
		add	sp, 0Ch

loc_A8831:
		inc	di

loc_A8832:
		cmp	di, [bp+var_6]
		jle	short loc_A87E0

loc_A8837:
		inc	[bp+var_4]

loc_A883A:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jge	short loc_A8845
		jmp	loc_A873E

loc_A8845:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_A885B:
		pop	di
		pop	si
		leave
		retf
TerrainTextures_LoadTerrainList_A864D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A885F		proc far

var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di]
		mov	ah, 0
		or	ax, ax
		jz	short loc_A8875
		jmp	loc_A8ACD

loc_A8875:
		mov	ax, [bp+arg_2]
		mov	[di+15h], ax
		mov	eax, [bp+arg_4]
		mov	[di+9], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[di+5], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_12], eax
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[di+1], eax
		mov	[bp+var_1A], 0
		mov	ax, [di+15h]
		imul	word ptr [di+15h]
		mov	[di+23h], ax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_2], ax
		mov	ax, [di+23h]
		imul	ax, ax, 15h
		movzx	eax, ax
		add	[bp+var_1A], eax
		mov	ax, [di+15h]
		mov	[di+27h], ax
		mov	ax, [di+27h]
		imul	word ptr [di+27h]
		mov	[di+27h], ax
		mov	ax, [di+27h]
		imul	ax, ax, 3
		mov	dx, [di+15h]
		shl	dx, 2
		sub	ax, dx
		inc	ax
		mov	[di+27h], ax
		mov	ax, [di+27h]
		shl	ax, 1
		mov	[di+27h], ax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_6], ax
		mov	ax, [di+27h]
		imul	ax, ax, 11h
		movzx	eax, ax
		add	[bp+var_1A], eax
		mov	ax, [di+15h]
		inc	ax
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+3Bh], ax
		mov	ax, [di+15h]
		inc	ax
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+3Dh], ax
		cmp	word ptr [di+3Bh], 0
		jz	short loc_A8941
		cmp	word ptr [di+3Dh], 0
		jnz	short loc_A894A

loc_A8941:
		push	0E007h
		call	sub_1DDFE
		pop	cx

loc_A894A:
		mov	ax, [di+23h]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+17h], ax
		cmp	word ptr [di+17h], 0
		jnz	short loc_A8969
		push	0E008h
		call	sub_1DDFE
		pop	cx

loc_A8969:
		mov	ax, [di+15h]
		dec	ax
		mov	[di+2Bh], ax
		mov	ax, [di+2Bh]
		imul	word ptr [di+2Bh]
		shl	ax, 1
		mov	[di+2Bh], ax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_4], ax
		mov	ax, [di+2Bh]
		imul	ax, ax, 16h
		movzx	eax, ax
		add	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[di+19h], eax
		mov	byte ptr [di+1Dh], 3
		mov	byte ptr [di+1Eh], 1
		mov	dword ptr [di+1Fh], 0
		mov	eax, [bp+var_1E]
		mov	[di+1Fh], eax
		push	0
		mov	al, [di+1Dh]
		push	ax
		push	large [di+19h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		push	0
		mov	al, [di+1Dh]
		push	ax
		push	large [di+19h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		mov	ax, [bp+var_2]
		add	ax, [bp+var_26]
		mov	[bp+var_28], ax
		mov	[di+25h], ax
		mov	ax, [bp+var_4]
		add	ax, [bp+var_26]
		mov	[bp+var_2A], ax
		mov	[di+2Fh], ax
		mov	ax, [bp+var_6]
		add	ax, [bp+var_26]
		mov	[bp+var_2C], ax
		mov	[di+29h], ax
		push	0
		mov	al, byte_7CCFA
		push	ax
		push	large dword_7CCF6
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_A8A86
		push	1
		push	0
		push	2
		push	large 9600h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_30+2], dx
		mov	word ptr [bp+var_30], ax
		mov	eax, [bp+var_30]
		mov	dword_7CCF6, eax
		mov	byte_7CCFA, 2
		mov	byte_7CCFB, 1
		mov	dword_7CCFC, 0
		mov	dword_7CCFC, 9600h

loc_A8A86:
		push	0
		mov	al, byte_7CCFA
		push	ax
		push	large dword_7CCF6
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77C1C, dx
		mov	word_77C1A, ax
		mov	eax, dword_7CCFC
		add	ax, word_77C1A
		add	ax, 0FF40h
		mov	word_77C20, dx
		mov	word_77C1E, ax
		mov	dword_77BF0, 0
		push	word ptr [di+15h]
		push	di
		nop
		push	cs
		call	near ptr sub_A8BD0
		add	sp, 4
		mov	byte ptr [di], 1

loc_A8ACD:
		pop	di
		pop	si
		leave
		retf
sub_A885F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TerrainSector_ReleaseTriple_9A467 (sub_9A467 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, libère 3 blocs (CRT_FreeNear_Wrap ×3).
; ==============================================================================================
TerrainSector_ReleaseTriple_A8AD1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_A8B0A
		push	word ptr [si+3Bh]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+3Bh], 0
		push	word ptr [si+3Dh]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+3Dh], 0
		push	word ptr [si+17h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+17h], 0
		mov	byte ptr [si], 0

loc_A8B0A:
		pop	si
		pop	bp
		retf
TerrainSector_ReleaseTriple_A8AD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainSector_ReleaseDouble_9A4A3 (sub_9A4A3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère 2 blocs typés et un bloc générique (96 lignes).
; ==============================================================================================
TerrainSector_ReleaseDouble_A8B0D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_A8B1F
		jmp	loc_A8BA6

loc_A8B1F:
		push	si
		push	cs
		call	near ptr TerrainSector_ReleaseTriple_A8AD1
		pop	cx
		cmp	byte ptr [si+36h], 0
		jz	short loc_A8B4B
		cmp	dword ptr [si+31h], 0
		jz	short loc_A8B4B
		push	0
		mov	al, [si+35h]
		push	ax
		mov	ax, si
		add	ax, 31h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A8B4B

loc_A8B4B:
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		cmp	byte ptr [si+1Eh], 0
		jz	short loc_A8B85
		cmp	dword ptr [si+19h], 0
		jz	short loc_A8B85
		push	0
		mov	al, [si+1Dh]
		push	ax
		mov	ax, si
		add	ax, 19h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A8B85

loc_A8B85:
		mov	dword ptr [si+19h], 0
		mov	byte ptr [si+1Eh], 0
		mov	dword ptr [si+1Fh], 0
		test	di, 1
		jz	short loc_A8BA6
		push	si
		call	sub_3B2
		pop	cx

loc_A8BA6:
		pop	di
		pop	si
		pop	bp
		retf
TerrainSector_ReleaseDouble_A8B0D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TerrainSector_Helper2_9A540 (sub_9A540 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, aucun appel externe visible (37 lignes).
; ==============================================================================================
TerrainSector_Helper2_A8BAA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[si+11h], dx
		jz	short loc_A8BCD
		cmp	dx, 1
		jle	short loc_A8BCD
		cmp	[si+15h], dx
		jl	short loc_A8BCD
		push	dx
		push	si
		nop
		push	cs
		call	near ptr sub_A8BD0
		add	sp, 4

loc_A8BCD:
		pop	si
		pop	bp
		retf
TerrainSector_Helper2_A8BAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A8BD0		proc far

var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= dword ptr -68h
var_64		= word ptr -64h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 82h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[si+11h], dx
		mov	ax, dx
		sar	ax, 1
		mov	[si+13h], ax
		mov	di, [si+11h]
		dec	di
		mov	ax, di
		imul	di
		shl	ax, 1
		mov	[si+2Dh], ax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large [si+19h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, [si+2Fh]
		mov	dx, word_77BF2
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		mov	ax, [si+25h]
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	ax, [si+11h]
		imul	di
		mov	cx, ax
		shl	ax, 1
		mov	cx, ax
		mov	ax, [si+29h]
		mov	dx, word_77BF2
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	ax, cx
		imul	ax, ax, 11h
		mov	bx, word ptr [bp+var_E]
		add	bx, ax
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], bx
		mov	ax, cx
		imul	ax, ax, 11h
		add	bx, ax
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], bx
		mov	[bp+var_2], 0
		jmp	loc_A8E99

loc_A8C65:
		xor	cx, cx
		jmp	loc_A8E87

loc_A8C6A:
		mov	eax, [bp+var_A]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_1C], ax
		mov	ax, [si+11h]
		imul	ax, ax, 15h
		mov	dx, word ptr [bp+var_A+2]
		mov	bx, word ptr [bp+var_A]
		add	bx, ax
		add	bx, 15h
		mov	[bp+var_1E], dx
		mov	[bp+var_20], bx
		mov	ax, [bp+var_20]
		mov	[bp+var_22], ax
		mov	ax, [si+11h]
		imul	ax, ax, 15h
		mov	bx, word ptr [bp+var_A]
		add	bx, ax
		mov	[bp+var_24], dx
		mov	[bp+var_26], bx
		mov	ax, [bp+var_26]
		mov	[bp+var_28], ax
		les	bx, [bp+var_6]
		mov	ax, [bp+var_1C]
		mov	es:[bx+2], ax
		mov	ax, [bp+var_22]
		mov	es:[bx+4], ax
		mov	ax, [bp+var_28]
		mov	es:[bx+6], ax
		mov	eax, [bp+var_E]
		mov	[bp+var_2C], eax
		mov	ax, word ptr [bp+var_2C]
		mov	[bp+var_2E], ax
		mov	ax, [bp+var_2E]
		mov	es:[bx+8], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_32], eax
		mov	ax, word ptr [bp+var_32]
		mov	[bp+var_34], ax
		mov	ax, [bp+var_34]
		mov	es:[bx+0Eh], ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 11h
		mov	[bp+var_36], ax
		mov	[bp+var_38], dx
		mov	ax, [bp+var_38]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_3A]
		mov	es:[bx+0Ah], ax
		mov	ax, di
		shl	ax, 1
		imul	ax, ax, 11h
		mov	dx, word ptr [bp+var_12+2]
		mov	bx, word ptr [bp+var_12]
		add	bx, ax
		add	bx, 11h
		mov	[bp+var_3C], dx
		mov	[bp+var_3E], bx
		mov	ax, [bp+var_3E]
		mov	[bp+var_40], ax
		mov	ax, [bp+var_40]
		mov	bx, [bp+var_6]
		mov	es:[bx+10h], ax
		mov	ax, di
		shl	ax, 1
		imul	ax, ax, 11h
		mov	bx, word ptr [bp+var_12]
		add	bx, ax
		mov	[bp+var_42], dx
		mov	[bp+var_44], bx
		mov	ax, [bp+var_44]
		mov	[bp+var_46], ax
		mov	ax, [bp+var_46]
		mov	bx, [bp+var_6]
		mov	es:[bx+0Ch], ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]
		add	dx, 11h
		mov	[bp+var_48], ax
		mov	[bp+var_4A], dx
		mov	ax, [bp+var_4A]
		mov	[bp+var_4C], ax
		mov	ax, [bp+var_4C]
		mov	es:[bx+12h], ax
		mov	byte ptr es:[bx+1], 0
		add	[bp+var_6], 16h
		mov	eax, [bp+var_A]
		mov	[bp+var_50], eax
		mov	ax, word ptr [bp+var_50]
		mov	[bp+var_52], ax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 15h
		mov	[bp+var_54], ax
		mov	[bp+var_56], dx
		mov	ax, [bp+var_56]
		mov	[bp+var_58], ax
		mov	ax, [si+11h]
		imul	ax, ax, 15h
		mov	dx, word ptr [bp+var_A+2]
		mov	bx, word ptr [bp+var_A]
		add	bx, ax
		add	bx, 15h
		mov	[bp+var_5A], dx
		mov	[bp+var_5C], bx
		mov	ax, [bp+var_5C]
		mov	[bp+var_5E], ax
		les	bx, [bp+var_6]
		mov	ax, [bp+var_52]
		mov	es:[bx+2], ax
		mov	ax, [bp+var_58]
		mov	es:[bx+4], ax
		mov	ax, [bp+var_5E]
		mov	es:[bx+6], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_62], eax
		mov	ax, word ptr [bp+var_62]
		mov	[bp+var_64], ax
		mov	ax, [bp+var_64]
		mov	es:[bx+8], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_68], eax
		mov	ax, word ptr [bp+var_68]
		mov	[bp+var_6A], ax
		mov	ax, [bp+var_6A]
		mov	es:[bx+0Eh], ax
		mov	ax, word ptr [bp+var_12+2]
		mov	dx, word ptr [bp+var_12]
		add	dx, 11h
		mov	[bp+var_6C], ax
		mov	[bp+var_6E], dx
		mov	ax, [bp+var_6E]
		mov	[bp+var_70], ax
		mov	ax, [bp+var_70]
		mov	es:[bx+0Ah], ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]
		add	dx, 22h
		mov	[bp+var_72], ax
		mov	[bp+var_74], dx
		mov	ax, [bp+var_74]
		mov	[bp+var_76], ax
		mov	ax, [bp+var_76]
		mov	es:[bx+10h], ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]
		add	dx, 33h
		mov	[bp+var_78], ax
		mov	[bp+var_7A], dx
		mov	ax, [bp+var_7A]
		mov	[bp+var_7C], ax
		mov	ax, [bp+var_7C]
		mov	es:[bx+0Ch], ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 11h
		mov	[bp+var_7E], ax
		mov	[bp+var_80], dx
		mov	ax, [bp+var_80]
		mov	[bp+var_82], ax
		mov	ax, [bp+var_82]
		mov	es:[bx+12h], ax
		mov	byte ptr es:[bx+1], 1
		add	[bp+var_6], 16h
		add	word ptr [bp+var_E], 22h
		add	word ptr [bp+var_12], 22h
		add	word ptr [bp+var_16], 22h
		add	word ptr [bp+var_A], 15h
		inc	cx

loc_A8E87:
		cmp	cx, di
		jge	short loc_A8E8E
		jmp	loc_A8C6A

loc_A8E8E:
		add	word ptr [bp+var_E], 22h
		add	word ptr [bp+var_A], 15h
		inc	[bp+var_2]

loc_A8E99:
		cmp	[bp+var_2], di
		jge	short loc_A8EA1
		jmp	loc_A8C65

loc_A8EA1:
		mov	dword_77BF0, 0
		pop	di
		pop	si
		leave
		retf
sub_A8BD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TerrainSector_ParseTriple_9A844 (sub_9A844 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle CRT_Doscan_Core (parsing type scanf)
; 3 fois.
; ==============================================================================================
TerrainSector_ParseTriple_A8EAE		proc far
		push	bp
		mov	bp, sp
		push	seg stub290
		push	offset sub_73FE5
		push	5
		push	large 3
		push	2
		push	ds
		push	offset unk_7CCD6
		call	sub_149D
		add	sp, 10h
		push	seg stub290
		push	offset sub_73FE0
		push	5
		push	large 3
		push	2
		push	ds
		push	offset unk_7CCDC
		call	sub_149D
		add	sp, 10h
		push	seg stub290
		push	offset sub_73FE0
		push	5
		push	large 3
		push	2
		push	ds
		push	offset unk_7CCE2
		call	sub_149D
		add	sp, 10h
		mov	byte_7CCD5, 1
		pop	bp
		retf
TerrainSector_ParseTriple_A8EAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A8F03		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_A8F20
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_A8F20:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_A8F03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A8F28		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_A8F45
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_A8F45:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_A8F28		endp
ovr290		ends
