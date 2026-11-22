ovr315		segment	para public 'OVERLAY' use16
		assume cs:ovr315
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. Chunk WDAT de Pacific Strike, 14 octets (STRIKE.EXE
; Weapon_LoadWDATChunk_A0700 : 22) : mot dégâts (+59h), mot rayon (+5Bh), octet catégorie de
; l'objet tiré (+5Dh ; 8 roquette, 9 bombe, 13 traçante dans les données), octet numéro d'arme
; converti en masque par Weapon_IdToMask_ADEA0 (+5Eh), u32 (+5Fh), u32 (+63h) ; rôle des deux
; u32 non relu. Erreur C01Fh si le chunk manque.
; ==============================================================================================
Weapon_LoadWDATChunk_B0360		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 54414457h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B03E3
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+59h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Bh], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Dh], al
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		push	ax
		call	sub_744D0
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Eh], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Fh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+63h], eax
		jmp	short loc_B03EC

loc_B03E3:
		push	0C01Fh
		call	sub_1DDFE
		pop	cx

loc_B03EC:
		pop	si
		pop	bp
		retf
Weapon_LoadWDATChunk_B0360		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Weapon_LoadWDATWrapper_A07ED (sub_A07ED de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_6C1CA et
; Weapon_LoadWDATChunk_A0700.
; ==============================================================================================
Weapon_LoadWDATWrapper_B03EF		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_7437A
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Weapon_LoadWDATChunk_B0360
		add	sp, 6
		pop	si
		pop	bp
		retf
Weapon_LoadWDATWrapper_B03EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 11 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantN_ConstructAndInit_A0810
; (sub_A0810 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27,
; sub_4338E), dispatch vtable [bx+8] — constructeur de variante de composant joueur.
; ==============================================================================================
PlayerComponentVariantN_ConstructAndInit_B0412		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B0465
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	word ptr [si], 23F6h
		mov	word ptr [si+5Ah], 0
		mov	word ptr [si+5Ch], 0
		push	large [bp+var_4]
		push	si
		call	Targeting_InitWithFlags
		add	sp, 6
		mov	ax, si
		jmp	short loc_B0467

loc_B0465:
		mov	ax, si

loc_B0467:
		mov	si, ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 36h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[si+6], eax
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+52h], ax
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantN_ConstructAndInit_B0412		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B049F		proc far

var_64		= dword ptr -64h
var_62		= dword ptr -62h
var_5A		= word ptr -5Ah
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_18		= dword ptr -18h
var_16		= dword ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	dx, [bp+arg_6]
		cmp	[si+5Ch], dx
		jnz	short loc_B04B7
		mov	al, 0
		jmp	loc_B070B

loc_B04B7:
		push	8
		push	ds
		push	offset aTERRAIN
		mov	bx, dx
		push	large [bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_B04D4
		mov	ax, 1
		jmp	short loc_B04D6

loc_B04D4:
		xor	ax, ax

loc_B04D6:
		or	al, al
		jnz	short loc_B04DD
		jmp	loc_B0709

loc_B04DD:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+5Eh], 40h
		jnz	short loc_B04EA
		jmp	loc_B0709

loc_B04EA:
		push	0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_2A], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_26], eax
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_22], eax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		or	al, al
		jnz	short loc_B0539
		jmp	loc_B05C8

loc_B0539:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+1Fh], 0FFFFh
		jnz	short loc_B0546
		jmp	loc_B05F3

loc_B0546:
		mov	eax, [si+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_36], eax
		mov	eax, [si+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_32], eax
		mov	eax, [si+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_2E], eax
		push	eax
		push	large [bp+var_32]
		push	large [bp+var_36]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	[bp+var_10], eax
		push	0
		push	eax
		push	0Fh
		call	sub_5EB62
		add	sp, 8
		sub	sp, 4
		mov	[bp+var_62], 0
		mov	ax, si
		add	ax, 12h
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Fh]
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah
		jmp	short loc_B05F3

loc_B05C8:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+21h], 0FFFFh
		jz	short loc_B05F3
		sub	sp, 4
		mov	[bp+var_62], 0
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word ptr es:[bx+21h]
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah

loc_B05F3:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1Bh], 0
		jz	short loc_B061E
		les	bx, es:[bx+1Bh]
		mov	ax, es:[bx+8]
		mov	word ptr [bp+var_14+2], ax
		movsx	eax, word ptr [bp+var_14+2]
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_10], eax

loc_B061E:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5Eh]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_10]
		mov	[bp+var_64], eax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_368C5
		add	sp, 0Ah
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_36], eax
		mov	eax, [di+4]
		mov	[bp+var_32], eax
		mov	eax, [di+8]
		mov	[bp+var_2E], eax
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_1A]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [si+1Ah]
		cmp	eax, [bp+var_1A]
		jge	short loc_B0692
		mov	ax, 1
		jmp	short loc_B0694

loc_B0692:
		xor	ax, ax

loc_B0694:
		or	al, al
		jz	short loc_B06A0
		mov	eax, [bp+var_1A]
		mov	[si+1Ah], eax

loc_B06A0:
		lea	ax, [bp+var_5A]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	eax, [bp+var_36]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_46], eax
		mov	[bp+var_1E], 0FFFFA600h
		lea	ax, word ptr [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		call	Missile_ComputeDirectionVector2D_5738D
		add	sp, 4
		lea	ax, [bp+var_5A]
		push	ax
		call	Matrix_ApplyToVectorZ_594AE
		pop	cx
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_B0709:
		mov	al, 1

loc_B070B:
		pop	di
		pop	si
		leave
		retf
sub_B049F		endp
ovr315		ends
