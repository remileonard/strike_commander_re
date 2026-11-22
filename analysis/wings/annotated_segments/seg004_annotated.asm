seg004		segment	para public 'CODE' use16
		assume cs:seg004
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 10h, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, ajoute un lecteur d'archive TRE ouvert à la table des archives (8 places, mots à
; DS:5298h ; nombre dans word_59E58). Rend 0 si la table est pleine.
; ==============================================================================================
Tre_RegisterArchive_4863		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	word_59E58, 8
		jge	short loc_4883
		mov	bx, word_59E58
		shl	bx, 1
		mov	ax, [bp+arg_0]
		mov	[bx+5298h], ax
		inc	word_59E58
		mov	ax, 1
		jmp	short loc_4885

loc_4883:
		xor	ax, ax

loc_4885:
		pop	bp
		retf
Tre_RegisterArchive_4863		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, retire un lecteur d'archive de la table (le dernier prend sa place).
; ==============================================================================================
Tre_UnregisterArchive_4887		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	short loc_48B7

loc_488E:
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5298h]
		cmp	ax, [bp+arg_0]
		jnz	short loc_48B6
		dec	word_59E58
		mov	bx, word_59E58
		shl	bx, 1
		mov	ax, [bx+5298h]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+5298h], ax
		mov	ax, 1
		jmp	short loc_48BF

loc_48B6:
		inc	dx

loc_48B7:
		cmp	dx, word_59E58
		jl	short loc_488E
		xor	ax, ax

loc_48BF:
		pop	bp
		retf
Tre_UnregisterArchive_4887		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (flux, nom). Si le nom se termine par « TRE » (stricmp des 3 derniers caractères avec la
; chaîne DS:13Ah), rend 0 : une archive n'est jamais cherchée dans une archive. Sinon, pour
; chaque archive ouverte de la table, Tre_FindEntry_49FD ; trouvé : le flux devient la tranche
; [position, position + taille) de l'archive (sub_5252A avec les champs +0ABh = position,
; +0AFh = taille de l'enregistrement trouvé) et rend 1. Appelée par
; StreamReader_OpenFromTreeOrDisk_526A2.
; ==============================================================================================
Tre_OpenEntryByName_48C1		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_2]
		xor	dx, dx
		or	di, di
		jz	short loc_48DB
		push	di
		call	CRT_Strlen
		pop	cx
		mov	dx, ax

loc_48DB:
		cmp	dx, 3
		jle	short loc_4955
		push	13Ah
		mov	ax, di
		add	ax, dx
		add	ax, 0FFFDh
		push	ax
		call	CRT_StrICmp_2D03
		add	sp, 4
		or	ax, ax
		jz	short loc_4955
		mov	[bp+var_2], 0
		jmp	short loc_494C

loc_48FE:
		mov	bx, [bp+var_2]
		shl	bx, 1
		mov	si, [bx+5298h]
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_4949
		push	di
		push	si
		nop
		push	cs
		call	near ptr Tre_FindEntry_49FD
		add	sp, 4
		or	ax, ax
		jz	short loc_4949
		mov	eax, [si+0ABh]
		mov	[bp+var_6], eax
		add	eax, [si+0AFh]
		mov	[bp+var_A], eax
		push	di
		push	eax
		push	large [bp+var_6]
		push	si
		push	[bp+arg_0]
		call	sub_5252A
		add	sp, 0Eh
		mov	al, 1
		jmp	short loc_4957

loc_4949:
		inc	[bp+var_2]

loc_494C:
		mov	ax, [bp+var_2]
		cmp	ax, word_59E58
		jl	short loc_48FE

loc_4955:
		mov	al, 0

loc_4957:
		pop	di
		pop	si
		leave
		retf
Tre_OpenEntryByName_48C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, détruit tous les lecteurs d'archive de la table (méthode +4 de leur table de méthodes)
; et vide la table.
; ==============================================================================================
Tre_CloseAllArchives_495B		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		jmp	short loc_4988

loc_4964:
		mov	bx, si
		shl	bx, 1
		mov	di, [bx+5298h]
		or	di, di
		jz	short loc_497D
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_497D

loc_497D:
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+5298h], 0
		inc	si

loc_4988:
		cmp	si, word_59E58
		jl	short loc_4964
		mov	word_59E58, 0
		pop	di
		pop	si
		pop	bp
		retf
Tre_CloseAllArchives_495B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (nom) : rend 1 dès qu'une archive montée contient le nom (Tre_FindEntry_49FD), 0 sinon.
; ==============================================================================================
Tre_ContainsName_4998		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	di, di
		xor	si, si
		jmp	short loc_49C5

loc_49A6:
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+5298h]
		mov	[bp+var_2], ax
		push	[bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr Tre_FindEntry_49FD
		add	sp, 4
		or	ax, ax
		jz	short loc_49C4
		inc	di
		jmp	short loc_49CB

loc_49C4:
		inc	si

loc_49C5:
		cmp	si, word_59E58
		jl	short loc_49A6

loc_49CB:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Tre_ContainsName_4998		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, se place au début de l'archive et lit 8 octets dans l'objet en +61h : u32 nombre
; d'enregistrements (+61h), puis u32 (+65h, fin de l'index dans BIGTRE.TRE).
; ==============================================================================================
Tre_ReadHeader_49D1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	si
		call	StreamReader_SeekVariant_5284E
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 8
		push	ds
		mov	ax, si
		add	ax, 61h
		push	ax
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
Tre_ReadHeader_49D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (archive, nom) : recherche par DICHOTOMIE dans l'index chargé (enregistrements de 74
; octets, imul 4Ah). Le nom cherché est d'abord mis en majuscules sur place (CRT_StrUpr_2F35).
; À chaque pas l'enregistrement du milieu est recopié en +69h (74 octets), puis
; CRT_StrICmp_2D03(nom, enregistrement+1) : 0 = trouvé (rend 1, l'enregistrement reste en +69h
; : nom en +6Ah, position u32 en +0ABh, taille u32 en +0AFh) ; < 0 = moitié basse ; > 0 =
; moitié haute. Pas de hachage : comparaison des noms en clair, l'index doit être trié par
; nom.
; ==============================================================================================
Tre_FindEntry_49FD		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jnz	short loc_4A20
		jmp	loc_4AD1

loc_4A20:
		push	[bp+arg_2]
		call	CRT_StrUpr_2F35
		pop	cx
		mov	di, [si+61h]
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		mov	ax, di
		sar	ax, 1
		imul	ax, ax, 4Ah
		jmp	loc_4AC2

loc_4A3C:
		mov	ax, [bp+var_8]
		mov	[bp+var_4], ax
		mov	ax, si
		add	ax, 69h
		mov	[bp+var_A], ax
		mov	cx, [bp+var_4]
		movsx	eax, cx
		mov	edx, [si+61h]
		imul	edx, edx, 4Ah
		cmp	eax, edx
		jge	short loc_4A77
		push	4Ah
		mov	ax, [si+5Dh]
		add	ax, cx
		push	word ptr [si+5Fh]
		push	ax
		push	ds
		push	[bp+var_A]
		call	sub_3609
		add	sp, 0Ah
		jmp	short loc_4A77

loc_4A77:
		mov	ax, [bp+arg_2]
		mov	[bp+var_C], ax
		mov	ax, si
		add	ax, 6Ah
		push	ax
		push	[bp+var_C]
		call	CRT_StrICmp_2D03
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_4A9B
		mov	[bp+var_2], 1
		jmp	short loc_4AD1

loc_4A9B:
		or	dx, dx
		jge	short loc_4AA6
		mov	ax, di
		inc	ax
		sar	ax, 1
		jmp	short loc_4AB4

loc_4AA6:
		mov	ax, [bp+var_8]
		add	ax, 4Ah
		mov	[bp+var_6], ax
		mov	ax, di
		sar	ax, 1
		inc	ax

loc_4AB4:
		sub	di, ax
		mov	ax, di
		sar	ax, 1
		movsx	eax, ax
		imul	eax, eax, 4Ah

loc_4AC2:
		mov	dx, [bp+var_6]
		add	dx, ax
		mov	[bp+var_8], dx
		or	di, di
		jle	short loc_4AD1
		jmp	loc_4A3C

loc_4AD1:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
Tre_FindEntry_49FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, ferme le fichier de l'archive, la retire de la table (Tre_UnregisterArchive_4887) et
; libère l'index (Tre_FreeIndex_4B8B).
; ==============================================================================================
Tre_CloseArchive_4AD8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_4AF7
		push	si
		call	sub_527AA
		pop	cx
		push	si
		push	cs
		call	near ptr Tre_UnregisterArchive_4887
		pop	cx

loc_4AF7:
		push	si
		nop
		push	cs
		call	near ptr Tre_FreeIndex_4B8B
		pop	cx
		pop	si
		pop	bp
		retf
Tre_CloseArchive_4AD8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, réserve nombre × 74 octets (sub_447E1) et lit l'index juste après l'en-tête de 8 octets
; ; message « No memory for buffer! » (DS:13Eh) ou « Error in treefile header! » (DS:155h) si
; la lecture est courte.
; ==============================================================================================
Tre_LoadIndex_4B01		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+5Dh], 0
		jnz	short loc_4B82
		push	1
		push	0
		push	2
		mov	eax, [si+61h]
		imul	eax, eax, 4Ah
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+5Fh], dx
		mov	[si+5Dh], ax
		cmp	dword ptr [si+5Dh], 0
		jnz	short loc_4B46
		push	13Eh
		push	si
		call	sub_59C00
		add	sp, 4

loc_4B46:
		push	large 0FFFFFFFFh
		mov	eax, [si+61h]
		imul	eax, eax, 4Ah
		push	eax
		push	large [si+5Dh]
		push	si
		call	StreamReader_ReadTyped_529F9
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		mov	eax, [si+61h]
		imul	eax, eax, 4Ah
		cmp	eax, [bp+var_4]
		jz	short loc_4B82
		push	155h
		push	si
		call	sub_59C00
		add	sp, 4

loc_4B82:
		mov	dx, [si+5Fh]
		mov	ax, [si+5Dh]
		pop	si
		leave
		retf
Tre_LoadIndex_4B01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'index chargé (+5Dh).
; ==============================================================================================
Tre_FreeIndex_4B8B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		mov	ax, si
		add	ax, 5Dh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr [si+5Dh], 0
		pop	si
		pop	bp
		retf
Tre_FreeIndex_4B8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (lecteur, nom de fichier) : ouvre le fichier en lecture
; (StreamReader_ReadDispatch_5274A, mode 1) ; ouvert : Tre_RegisterArchive_4863,
; Tre_ReadHeader_49D1, Tre_LoadIndex_4B01. Appelée par la lecture de la ligne de commande
; (sub_6A0EB) pour l'option « =NOM » : chaque argument qui commence par « = » monte l'archive
; nommée.
; ==============================================================================================
Tre_OpenArchive_4BB2		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		push	si
		call	StreamReader_ReadDispatch_5274A
		add	sp, 6
		mov	[bp+var_2], al
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_4BEA
		push	si
		push	cs
		call	near ptr Tre_RegisterArchive_4863
		pop	cx
		push	si
		push	cs
		call	near ptr Tre_ReadHeader_49D1
		pop	cx
		push	si
		push	cs
		call	near ptr Tre_LoadIndex_4B01
		pop	cx

loc_4BEA:
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
Tre_OpenArchive_4BB2		endp
seg004		ends
