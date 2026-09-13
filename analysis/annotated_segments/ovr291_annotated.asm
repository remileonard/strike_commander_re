ovr291		segment	para public 'OVERLAY' use16
		assume cs:ovr291
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,599L — PARSEUR DE LA GEOMETRIE DES OVERLAYS '.TRI' (pistes/aires d'aerodrome posees a
; plat sur le terrain). Appelee via stub sub_6BD30 depuis Model_RenderMain (sub_31E87, seg070)
; = chemin de RENDU DE MODELE, pas le pipeline terrain. Lit depuis un IndexedRecordReader
; (arg_2) positionne par AdvanceIndex(arg_4) sur une entree de la mini-archive .TRI. En-tete =
; 8 octets, 4x u16 LE : [+0]=numvertice (->di+6), [+2]=nbpoly (->di+14h), [+4]=param2
; (->di+16h, ensuite eleve au carre -> lecture d'une grille param2^2), [+6]=param3 (taille
; d'un tableau d'index param3 x u16 lu ensuite). SOMMET = 13 octets : i32 X @+0, i32 Z @+4,
; i32 Y @+8, 1 octet pad @+0xC (imul 0Dh L324110/324118, add var_3E,0Dh L324221). POLYGONE =
; 16 octets (shl 4 L324121, add var_4C,10h L324383) : u8 flag @+0, u16 idx0 @+1, u16 idx1 @+3,
; u16 idx2 @+5 (resolus *30 = stride du record de sortie), u8 type @+7, u16 color @+8 (champ
; 'color' cote donnees ; sert aussi d'index texture via lookup word_7254E/word_72550 ; si
; 0x0E<=v<=0x11 -> double-face), 6 octets UV @+0xA (copies via sub_3FD cx=6). Record de sortie
; : stride 0x1E (30) octets. Cf. analysis/DATA_MODEL.md §6.8bis. NB : l'ancienne annotation
; 'IndexedRecordReader_ScanAndReadTyped' etait trompeuse. || Coords sommet = int32 FIXED-POINT
; 24.8 (valeur/256 = pieds monde, meme systeme que SCNE/JDYN/HOME) ; poly+0x08 = 'color'. ||
; TABLE param3 + GRILLE (queue, loc_99519..loc_9961A) : APRES les polygones viennent [param3 x
; u16] = table de listes, rangee telle quelle en [di+1Ch] et CONSERVEE ; puis [param2^2 x u16]
; = grille, lue dans un buffer TEMPORAIRE. Chaque case de la grille = index (en mots) dans la
; table param3 : g = grille[c] (shl bx,1 puis add -> &param3Table[g], loc_995C5) ; si
; param3Table[g] == 0xFFFF -> case vide, pointeur NULL dans le tableau resultat [di+18h]
; (param2^2 x 4 o) ; sinon la case pointe sur &param3Table[g], ou param3Table[g] = count suivi
; de count indices de polygone. Buffer grille brut libere en fin (CRT_FreeNear_Wrap loc_9961A)
; ; seuls survivent la table param3 ([di+1Ch]) et le tableau de param2^2 pointeurs ([di+18h]).
; Verifie sur ALASKA.TRI : 3 regions, chacune numvertice=192 nbpoly=118 param2=1 param3=119,
; param3Table = [118, 0,1,2,...,117] (count=nbpoly puis tous les indices en ordre),
; grille=[0]. param2=1 => 1 case = tous les polys => dessiner 0..nbpoly-1 dans l'ordre ;
; param2>1 => index spatial de culling, dessiner l'union des listes des cases visibles.
; Position du flux sauvee au debut (var_4, loc_99163) et restauree en fin
; (StreamReader_SeekVariant) : chaque entree .TRI se parse independamment, ne pas lire ces 2
; tables ne decale rien. Format TRIANGLES SEUL cote Strike Commander (record poly fixe 16 o, 3
; indices, avance 0x10 sans condition) ; le mix triangle/quad existe dans Pacific Strike
; (RealSpace modifie), pas ici.
; ==============================================================================================
TRI_ParseOverlayGeometry_99120	proc far		; CODE XREF: VROOMM_StubThunk_6BD30J

var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_6]
		mov	[di+2],	ax
		push	[bp+arg_4]

loc_99134:
		push	[bp+arg_2]

loc_99137:
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [bp+arg_2]

loc_99142:
		mov	ax, [bx+6Dh]

loc_99145:
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_99153
		mov	eax, [bx+61h]
		jmp	short loc_9915A
; ���������������������������������������������������������������������������

loc_99153:				; CODE XREF: TRI_ParseOverlayGeometry_99120+2Bj
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_9915A:				; CODE XREF: TRI_ParseOverlayGeometry_99120+31j
		cmp	eax, 0
		jg	short loc_99163
		jmp	loc_99634
; ���������������������������������������������������������������������������

loc_99163:				; CODE XREF: TRI_ParseOverlayGeometry_99120+3Ej
		push	[bp+arg_2]
		call	StreamReader_GetPosition_64075
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_2]
		push	large dword ptr	[bx+65h]
		push	bx
		call	StreamReader_SeekVariant_63DF6
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 8

loc_9918A:
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	ax, [bp+var_8]
		mov	[di+16h], ax
		mov	ax, [bp+var_C]
		mov	[di+6],	ax
		mov	ax, [bp+var_A]
		mov	[di+14h], ax
		mov	ax, [di+6]
		imul	ax, 1Eh
		mov	dx, [di+14h]
		imul	dx, 1Eh
		add	ax, dx
		movzx	eax, ax
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[di+8],	eax
		mov	byte ptr [di+0Ch], 2
		mov	byte ptr [di+0Dh], 1
		mov	dword ptr [di+0Eh], 0
		mov	eax, [bp+var_10]
		mov	[di+0Eh], eax
		push	0
		mov	al, [di+0Ch]
		push	ax
		push	large dword ptr	[di+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		push	0
		mov	al, [di+0Ch]
		push	ax
		push	large dword ptr	[di+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx

loc_9922F:
		mov	word ptr dword_6EA68, ax
		mov	ax, [bp+var_18]

loc_99235:
		mov	[bp+var_1A], ax
		mov	[di+4],	ax
		mov	ax, [di+6]
		imul	ax, 1Eh
		mov	dx, [bp+var_18]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, [bp+var_1C]
		mov	[di+12h], ax
		mov	ax, [di+6]
		imul	ax, 0Dh
		mov	word ptr [bp+var_24+2],	ax
		mov	ax, [di+14h]
		shl	ax, 4
		mov	word ptr [bp+var_24], ax
		mov	si, word ptr [bp+var_24+2]
		add	si, word ptr [bp+var_24]
		movsx	eax, si
		mov	[bp+var_32], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_99282:
		mov	word ptr [bp+var_36+2],	dx
		mov	word ptr [bp+var_36], ax

loc_99288:
		mov	eax, [bp+var_36]
		mov	[bp+var_2E], eax

loc_99290:
		mov	[bp+var_2A], 2

loc_99294:
		mov	[bp+var_29], 1
		mov	[bp+var_28], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_28], eax
		push	0
		mov	al, [di+0Ch]
		push	ax
		push	large dword ptr	[di+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		push	large 0FFFFFFFFh
		movsx	eax, si
		push	eax
		push	0
		mov	al, [bp+var_2A]
		push	ax
		push	large [bp+var_2E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	ax, [di+4]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax
		push	0
		mov	al, [bp+var_2A]
		push	ax
		push	large [bp+var_2E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_3E+2],	dx
		mov	word ptr [bp+var_3E], ax
		mov	[bp+var_40], 0
		jmp	short loc_9937A
; ���������������������������������������������������������������������������

loc_9931E:				; CODE XREF: TRI_ParseOverlayGeometry_99120:loc_99380j
		mov	eax, [bp+var_3E]
		mov	[bp+var_44], eax
		les	si, [bp+var_44]
		mov	eax, es:[si]
		mov	[bp+var_6A], eax

loc_99331:
		mov	eax, es:[si+4]
		mov	[bp+var_66], eax
		mov	eax, es:[si+8]
		mov	[bp+var_62], eax
		les	bx, [bp+var_3A]
		mov	eax, [bp+var_6A]
		mov	es:[bx+11h], eax

loc_9934F:
		mov	eax, [bp+var_66]

loc_99353:
		mov	es:[bx+15h], eax
		mov	eax, [bp+var_62]
		mov	es:[bx+19h], eax
		les	bx, [bp+var_3E]
		mov	al, es:[bx+0Ch]
		les	bx, [bp+var_3A]
		mov	es:[bx+1Dh], al
		inc	[bp+var_40]
		add	word ptr [bp+var_3A], 1Eh
		add	word ptr [bp+var_3E], 0Dh

loc_9937A:				; CODE XREF: TRI_ParseOverlayGeometry_99120+1FCj
		mov	ax, [di+6]
		cmp	ax, [bp+var_40]

loc_99380:
		jg	short loc_9931E
		mov	ax, [di+12h]

loc_99385:
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_48+2],	dx
		mov	word ptr [bp+var_48], ax
		mov	eax, [bp+var_3E]
		mov	[bp+var_4C], eax
		mov	ax, [di+4]
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax
		mov	[bp+var_40], 0
		jmp	loc_994EA
; ���������������������������������������������������������������������������

loc_993A8:				; CODE XREF: TRI_ParseOverlayGeometry_99120+3D2j
		les	bx, [bp+var_4C]
		mov	al, es:[bx+7]
		les	bx, [bp+var_48]
		mov	es:[bx], al
		les	bx, [bp+var_4C]
		mov	ax, es:[bx+1]
		imul	ax, 1Eh
		mov	dx, word ptr [bp+var_3A+2]
		mov	bx, word ptr [bp+var_3A]
		add	bx, ax
		mov	[bp+var_4E], dx
		mov	[bp+var_50], bx
		mov	ax, [bp+var_50]
		mov	[bp+var_52], ax
		mov	ax, [bp+var_52]
		les	bx, [bp+var_48]
		mov	es:[bx+1], ax
		les	bx, [bp+var_4C]
		mov	ax, es:[bx+3]
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_3A]
		add	bx, ax
		mov	[bp+var_54], dx
		mov	[bp+var_56], bx
		mov	ax, [bp+var_56]
		mov	[bp+var_58], ax
		mov	ax, [bp+var_58]
		les	bx, [bp+var_48]
		mov	es:[bx+3], ax
		les	bx, [bp+var_4C]
		mov	ax, es:[bx+5]
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_3A]
		add	bx, ax

loc_99411:
		mov	[bp+var_5A], dx

loc_99414:
		mov	[bp+var_5C], bx
		mov	ax, [bp+var_5C]

loc_9941A:
		mov	[bp+var_5E], ax

loc_9941D:
		mov	ax, [bp+var_5E]

loc_99420:
		les	bx, [bp+var_48]

loc_99423:
		mov	es:[bx+5], ax

loc_99427:
		mov	word ptr es:[bx+7], 0
		mov	word ptr es:[bx+9], 0

loc_99433:
		mov	word ptr es:[bx+0Bh], 0
		mov	word ptr es:[bx+0Dh], 0

loc_9943F:
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+11h], 0
		les	bx, [bp+var_4C]
		mov	dx, es:[bx+8]
		cmp	dx, word_7254A
		jnb	short loc_99466
		mov	ax, dx
		imul	ax, 6
		push	ax

loc_9945E:
		mov	ax, word_7254E
		pop	dx

loc_99462:
		add	ax, dx
		jmp	short loc_99480
; ���������������������������������������������������������������������������

loc_99466:				; CODE XREF: TRI_ParseOverlayGeometry_99120+336j
		sub	dx, word_7254A
		cmp	dx, word_7254C
		jnb	short loc_9947E
		mov	ax, dx
		imul	ax, 0Ch
		push	ax
		mov	ax, word_72550
		pop	dx
		add	ax, dx
		jmp	short loc_99480
; ���������������������������������������������������������������������������

loc_9947E:				; CODE XREF: TRI_ParseOverlayGeometry_99120+34Ej
		xor	ax, ax

loc_99480:				; CODE XREF: TRI_ParseOverlayGeometry_99120+344j
					; TRI_ParseOverlayGeometry_99120+35Cj
		les	bx, [bp+var_48]
		mov	es:[bx+14h], ax
		mov	ax, word ptr [bp+var_48]
		add	ax, 16h
		push	word ptr [bp+var_48+2]
		push	ax
		mov	ax, word ptr [bp+var_4C]
		add	ax, 0Ah
		push	word ptr [bp+var_4C+2]
		push	ax
		mov	cx, 6
		call	CRT_Fmemcpy
		les	bx, [bp+var_48]
		push	es
		les	si, [bp+var_4C]
		mov	al, es:[si]
		pop	es
		mov	es:[bx+1Ch], al
		mov	es, word ptr [bp+var_48+2]
		mov	byte ptr es:[bx+1Dh], 0
		cmp	word ptr es:[bx+14h], 0
		jnz	short loc_994C6
		mov	byte ptr es:[bx+1Dh], 1

loc_994C6:				; CODE XREF: TRI_ParseOverlayGeometry_99120+39Fj
		les	bx, [bp+var_4C]
		mov	dx, es:[bx+8]
		cmp	dx, 0Eh
		jb	short loc_994DF
		cmp	dx, 11h
		ja	short loc_994DF
		les	bx, [bp+var_48]
		mov	byte ptr es:[bx+1Dh], 1

loc_994DF:				; CODE XREF: TRI_ParseOverlayGeometry_99120+3B0j
					; TRI_ParseOverlayGeometry_99120+3B5j
		inc	[bp+var_40]
		add	word ptr [bp+var_48], 1Eh
		add	word ptr [bp+var_4C], 10h

loc_994EA:				; CODE XREF: TRI_ParseOverlayGeometry_99120+285j
		mov	ax, [di+14h]
		cmp	ax, [bp+var_40]
		jle	short loc_994F5
		jmp	loc_993A8
; ���������������������������������������������������������������������������

loc_994F5:				; CODE XREF: TRI_ParseOverlayGeometry_99120+3D0j
		cmp	[bp+var_29], 0
		jz	short loc_99519
		cmp	[bp+var_2E], 0
		jz	short loc_99519
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_99517:
		jmp	short $+2

loc_99519:				; CODE XREF: TRI_ParseOverlayGeometry_99120+3D9j
					; TRI_ParseOverlayGeometry_99120+3E0j
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	1
		push	0
		push	2

loc_99533:
		mov	ax, [bp+var_6]
		shl	ax, 1

loc_99538:
		movzx	eax, ax

loc_9953C:
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[di+1Eh], dx
		mov	[di+1Ch], ax
		push	large 0FFFFFFFFh
		mov	ax, [bp+var_6]
		shl	ax, 1

loc_99557:
		movzx	eax, ax

loc_9955B:
		push	eax
		push	large dword ptr	[di+1Ch]

loc_99561:
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	ax, [di+16h]
		imul	word ptr [di+16h]
		mov	[bp+var_1E], ax
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_20], ax

loc_99581:
		push	large 0FFFFFFFFh
		mov	ax, [bp+var_1E]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	ds
		push	[bp+var_20]

loc_99593:
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		push	1
		push	0
		push	2
		mov	ax, [bp+var_1E]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[di+1Ah], dx
		mov	[di+18h], ax
		xor	cx, cx
		jmp	short loc_99615
; ���������������������������������������������������������������������������

loc_995C5:				; CODE XREF: TRI_ParseOverlayGeometry_99120+4F8j
		mov	ax, [di+1Eh]
		mov	dx, [di+1Ch]
		mov	bx, cx
		shl	bx, 1
		mov	si, [bp+var_20]
		add	si, bx
		mov	bx, [si]
		shl	bx, 1
		add	dx, bx
		mov	word ptr [bp+var_24+2],	ax
		mov	word ptr [bp+var_24], dx
		les	bx, [bp+var_24]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_995FF
		les	bx, [di+18h]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	ax, word ptr [bp+var_24+2]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_99614
; ���������������������������������������������������������������������������

loc_995FF:				; CODE XREF: TRI_ParseOverlayGeometry_99120+4C7j
		les	bx, [di+18h]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	word ptr es:[bx+2], 0

loc_9960F:
		mov	word ptr es:[bx], 0

loc_99614:				; CODE XREF: TRI_ParseOverlayGeometry_99120+4DDj
		inc	cx

loc_99615:				; CODE XREF: TRI_ParseOverlayGeometry_99120+4A3j
		cmp	cx, [bp+var_1E]
		jl	short loc_995C5

loc_9961A:
		push	[bp+var_20]
		call	CRT_FreeNear_Wrap
		pop	cx
		push	large [bp+var_4]
		push	[bp+arg_2]
		call	StreamReader_SeekVariant_63DF6
		add	sp, 6
		jmp	short loc_99639
; ���������������������������������������������������������������������������

loc_99634:				; CODE XREF: TRI_ParseOverlayGeometry_99120+40j
		mov	word ptr [di+16h], 0

loc_99639:				; CODE XREF: TRI_ParseOverlayGeometry_99120+512j
		mov	dword_6EA68, 0
		pop	di
		pop	si
		leave
		retf
TRI_ParseOverlayGeometry_99120	endp

ovr291		ends
