ovr337		segment	para public 'OVERLAY' use16
		assume cs:ovr337
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SmokeGen_SpawnInstance_A5F20 (sub_A5F20 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; méthode +4 de la classe SMKG : crée l'instance (CRT_Malloc16_Retry(0x5B),
; WorldObject_BaseConstruct, vtable 30EEh, +0x51 = 0), SmokeGen_InitInstance_A6048, instance
; +6 = modèle+0x2B.
; ==============================================================================================
SmokeGen_SpawnInstance_B8FE0		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B9029
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si], 2E98h
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+52h], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_B9108
		add	sp, 6
		mov	ax, si
		jmp	short loc_B902B

loc_B9029:
		mov	ax, si

loc_B902B:
		mov	si, ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 36h
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		mov	eax, [bp+var_C]
		mov	[si+6], eax
		mov	ax, si
		pop	si
		leave
		retf
SmokeGen_SpawnInstance_B8FE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SmokeGen_LoadFromIFF_A5F89 (sub_A5F89 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-12.
; LECTEUR DE LA CLASSE SMKG (générateur de fumée ; ex-TextLabel_LoadFieldsFromIFF, aucun
; rapport avec du texte ; chaîne 'SmokeSlots' juste avant la vtable d'instance 30EEh). Chunk
; INFO obligatoire (absent → erreur B004h) : uint8 → +0x36 type de fumée (index dans le jeu de
; fumées du monde, word_70483) ; int32 24.8 → +0x37 durée d'émission (s) ; int32 24.8 → +0x3B
; vitesse de montée des particules ; int32 24.8 → +0x3F intervalle entre deux particules (s) ;
; uint16 → +0x43 chance d'être actif à la création (Math_RandomChance_54E4F, échelle ~100) ;
; uint8 → +0x45 se supprime à la fin de la durée (≠0). Puis IFF_LoadAngleParam (chunks communs
; + ALGN). Classe : 70 o, vtable 23B8h, catégorie 18 (loc_4C050).
; ==============================================================================================
SmokeGen_LoadFromIFF_B9049		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B90CA
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+49h], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ah], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Eh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+52h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+56h], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+58h], al
		jmp	short loc_B90D3

loc_B90CA:
		push	0B004h
		call	sub_1DDFE
		pop	cx

loc_B90D3:
		push	si
		push	large [bp+arg_0]
		call	sub_3B14C
		add	sp, 6
		pop	si
		pop	bp
		retf
SmokeGen_LoadFromIFF_B9049		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextLabel_Helper_A6023 (sub_A6023 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (rôle exact non détaillé).
; ==============================================================================================
TextLabel_Helper_B90E3		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+57h], eax
		or	byte ptr [si+2], 1
		mov	byte ptr [si+5Bh], 0
		pop	si
		leave
		retf
TextLabel_Helper_B90E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9108		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr TextLabel_Helper_B90E3
		pop	cx
		push	large [bp+arg_2]
		push	si
		call	sub_36985
		add	sp, 6
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 4Ah
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		mov	ax, si
		add	ax, 52h
		push	ax
		call	Timer_SetAbsolute_50699
		add	sp, 4
		and	byte ptr [si+2], 0FDh
		les	bx, [si+0Eh]
		mov	ax, es:[bx+56h]
		call	Math_RandomChance_56C8A
		or	al, al
		jz	short loc_B9169
		mov	byte ptr [si+5Bh], 1

loc_B9169:
		pop	si
		leave
		retf
sub_B9108		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B916C		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B9192
		jmp	loc_B9250

loc_B9192:
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_4]
		mov	[si+6], eax
		push	3
		push	large [si]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+0Ah], eax
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_68060
		mov	[bp+var_A], ax
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	Text_ComputeMaxLineWidth_68019
		mov	[bp+var_C], ax
		mov	ax, [bp+var_A]
		add	ax, [bp+var_C]
		sar	ax, 2
		mov	[si+0Eh], ax
		jmp	short loc_B9259

loc_B9250:
		push	0B005h
		call	sub_1DDFE
		pop	cx

loc_B9259:
		pop	di
		pop	si
		leave
		retf
sub_B916C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextLabel_AllocateBuffer_A6188 (sub_A6188 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue un tampon (sub_658, taille variable +5
; octets).
; ==============================================================================================
TextLabel_AllocateBuffer_B925D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B9276
		push	2Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B92A0

loc_B9276:
		mov	ax, si
		inc	ax
		mov	ax, si
		add	ax, 5
		mov	ax, si
		add	ax, 9
		mov	ax, si
		add	ax, 0Dh
		mov	ax, si
		add	ax, 11h
		mov	ax, si
		add	ax, 1Bh
		mov	byte ptr [si+20h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+25h], 0

loc_B92A0:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextLabel_AllocateBuffer_B925D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B92A5		proc far

var_2C		= word ptr -2Ch
var_2B		= dword ptr -2Bh
var_27		= dword ptr -27h
var_23		= dword ptr -23h
var_1F		= dword ptr -1Fh
var_1B		= dword ptr -1Bh
var_17		= byte ptr -17h
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= byte ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B92CB
		jmp	loc_B9397

loc_B92CB:
		push	large 19h
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_2C]
		mov	[si], al
		mov	eax, [bp+var_1F]
		mov	[si+5], eax
		mov	al, [bp+var_17]
		mov	ah, 0
		mov	[si+15h], ax
		mov	al, [bp+var_16]
		mov	ah, 0
		mov	[si+17h], ax
		mov	ax, [si+17h]
		sub	ax, [si+15h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[si+11h], eax
		mov	ax, si
		add	ax, 5
		mov	[bp+var_8], ax
		mov	eax, [si+11h]
		mov	edx, eax
		mov	bx, [bp+var_8]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+11h], eax
		mov	eax, [bp+var_27]
		mov	[si+0Dh], eax
		mov	eax, [bp+var_23]
		sub	eax, [bp+var_27]
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[si+9], eax
		mov	ax, si
		add	ax, 5
		mov	[bp+var_12], ax
		mov	eax, [si+9]
		mov	edx, eax
		mov	bx, [bp+var_12]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+9], eax
		mov	eax, [bp+var_1B]
		mov	[si+1Bh], eax
		mov	eax, [bp+var_2B]
		mov	[si+1], eax
		mov	al, [bp+var_15]
		mov	[si+19h], al
		mov	al, [bp+var_14]
		mov	[si+1Ah], al

loc_B9397:
		push	0
		push	large 4D494E41h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B93EA
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+27h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+28h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+29h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+1Fh], al
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+21h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+23h], ax
		jmp	short loc_B93F2

loc_B93EA:
		mov	al, 0FFh
		mov	[si+29h], al
		mov	[si+27h], al

loc_B93F2:
		push	0
		push	large 49524353h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B943D
		mov	al, [di+72h]
		mov	[si+20h], al
		mov	al, [si+20h]
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+25h], ax
		cmp	word ptr [si+25h], 0
		jz	short loc_B943D
		mov	al, [si+20h]
		mov	ah, 0
		movsx	eax, ax
		push	eax
		push	ds
		mov	ax, si
		add	ax, 25h
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah

loc_B943D:
		pop	di
		pop	si
		leave
		retf
sub_B92A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 29 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SmokeSet_LoadFromIFF_A636C (sub_A636C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 392 L, LUE
; 2026-10-12. LECTEUR DU JEU DE FUMÉES (ex-MissionText_LoadAndFormatFromIFF : aucun rapport
; avec du texte). Appelé par World_LoadSmokeSet_A7CA1 avec le nom du chunk WRLD/SMOK (ex.
; 'SMOKESET'). Fichier OBJECTS\<nom>.IFF, racine FORM SMOK obligatoire (sinon erreur B007h).
; Chunk INFO : 3× uint16 → +0x0B nombre de modèles de fumée (tableau +0x0D, éléments de 0x2A =
; 42 o), +0x0F nombre de formes (tableau +0x11, éléments de 12 o), +0x13 nombre max de
; particules (réserve de +0x13 × 0x30 o, buffer circulaire +0x15/+0x21/+0x25) ; tableau vide →
; erreur B006h. Puis FORM TYPE : parcourt ses sous-FORM dans l'ordre ; FORM SMOK →
; SmokeSet_LoadSmokeModel_A61D0 (modèle suivant), FORM SHAP → SmokeSet_LoadShape_A60AC (forme
; suivante). L'index d'un modèle = son rang parmi les FORM SMOK.
; ==============================================================================================
SmokeSet_LoadFromIFF_B9441		proc far

var_104		= word ptr -104h
var_B4		= word ptr -0B4h
var_57		= dword ptr -57h
var_53		= dword ptr -53h
var_4F		= dword ptr -4Fh
var_47		= dword ptr -47h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 104h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[si+8], ds
		mov	word ptr [si+6], 2E84h
		lea	ax, [bp+var_B4]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_B4], 508h
		mov	[bp+var_53], 100h
		mov	[bp+var_57], 0
		mov	[bp+var_B4], 520h
		mov	[bp+var_38], 0
		xor	ax, ax
		mov	[bp+var_3A], ax
		movsx	eax, ax
		mov	[bp+var_4F], eax
		push	seg seg225
		push	0
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_104]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	large 4B4F4D53h
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_B94C8
		jmp	loc_B972B

loc_B94C8:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B94E4
		jmp	loc_B9647

loc_B94E4:
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+0Bh], ax
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+0Fh], ax
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+13h], ax
		push	seg stub337
		push	offset sub_75023
		push	1
		push	word ptr [si+0Bh]
		push	large 2A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+0Dh], ax
		push	seg stub337
		push	offset sub_75005
		push	11h
		push	word ptr [si+0Fh]
		push	large 100000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+11h], ax
		cmp	word ptr [si+0Dh], 0
		jz	short loc_B9552
		cmp	word ptr [si+11h], 0
		jnz	short loc_B955B

loc_B9552:
		push	0B006h
		call	sub_1DDFE
		pop	cx

loc_B955B:
		push	1
		push	0
		push	2
		mov	ax, [si+13h]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+29h], dx
		mov	[si+27h], ax
		mov	eax, [si+27h]
		mov	[si+2Bh], eax
		mov	word ptr [si+2Fh], 0
		mov	ax, [si+13h]
		imul	ax, ax, 42h
		movzx	eax, ax
		mov	[bp+var_4], eax
		push	2E8Dh
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapperB_65290
		add	sp, 0Eh
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		mov	[si+17h], ax
		mov	[si+15h], dx
		mov	byte ptr [si+19h], 2
		mov	byte ptr [si+1Ah], 1
		mov	dword ptr [si+1Bh], 0
		mov	eax, [bp+var_4]
		mov	[si+1Bh], eax
		push	0
		mov	al, [si+19h]
		push	ax
		push	large [si+15h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		xor	di, di
		jmp	short loc_B960F

loc_B95F8:
		push	42h
		push	ds
		push	offset word_7CE7A
		push	large [bp+var_C]
		call	sub_37C3
		add	sp, 0Ah
		inc	di
		add	word ptr [bp+var_C], 42h

loc_B960F:
		cmp	[si+13h], di
		jg	short loc_B95F8
		push	0
		mov	al, [si+19h]
		push	ax
		push	large [si+15h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[si+21h], dx
		mov	[si+1Fh], ax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 0FFBEh
		mov	[si+25h], ax
		mov	[si+23h], dx
		mov	word ptr [si+31h], 0
		mov	byte ptr [si+0Ah], 1

loc_B9647:
		push	0
		push	large 45505954h
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_B9663
		jmp	loc_B971F

loc_B9663:
		mov	di, [si+0Dh]
		mov	si, [si+11h]
		jmp	short loc_B96E6

loc_B966B:
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jz	short loc_B96DE
		lea	ax, [bp+var_B4]
		push	ax
		call	sub_6DC9A
		pop	cx
		cmp	[bp+var_47], 4B4F4D53h
		jnz	short loc_B9694
		mov	ax, 1
		jmp	short loc_B9696

loc_B9694:
		xor	ax, ax

loc_B9696:
		or	ax, ax
		jz	short loc_B96AC
		lea	ax, [bp+var_B4]
		push	ax
		push	di
		push	cs
		call	near ptr sub_B92A5
		add	sp, 4
		add	di, 2Ah
		jmp	short loc_B96D1

loc_B96AC:
		cmp	[bp+var_47], 50414853h
		jnz	short loc_B96BB
		mov	ax, 1
		jmp	short loc_B96BD

loc_B96BB:
		xor	ax, ax

loc_B96BD:
		or	ax, ax
		jz	short loc_B96D1
		lea	ax, [bp+var_B4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_B916C
		add	sp, 4
		add	si, 10h

loc_B96D1:
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		jmp	short loc_B96E6

loc_B96DE:
		mov	eax, [bp+var_3E]
		mov	[bp+var_4F], eax

loc_B96E6:
		cmp	[bp+var_38], 0
		jnz	short loc_B96F9
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_B970D

loc_B96F9:
		mov	bx, [bp+var_38]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4F]
		jg	short loc_B970B
		mov	ax, 1
		jmp	short loc_B970D

loc_B970B:
		xor	ax, ax

loc_B970D:
		or	ax, ax
		jnz	short loc_B9714
		jmp	loc_B966B

loc_B9714:
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_B971F:
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_B9733

loc_B972B:
		push	0B007h
		call	sub_1DDFE

loc_B9733:
		pop	cx
		mov	[bp+var_B4], 520h
		lea	ax, [bp+var_B4]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_B4]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
SmokeSet_LoadFromIFF_B9441		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9758		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B9771
		push	10h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B9788

loc_B9771:
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0

loc_B9788:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_B9758		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B978D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B97B6
		push	0
		push	si
		call	sub_3B2B9
		add	sp, 4
		test	di, 1
		jz	short loc_B97B6
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_B97B6

loc_B97B6:
		pop	di
		pop	si
		pop	bp
		retf
sub_B978D		endp
ovr337		ends
