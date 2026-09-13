ovr260		segment	para public 'OVERLAY' use16
		assume cs:ovr260
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (41 lignes).
; ==============================================================================================
UIWidget_ReleaseWrapper_8DEC0	proc far		; CODE XREF: VROOMM_StubThunk_6B630J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_8DEEB
		push	1
		push	0
		push	2
		push	large 96h ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_8DF41

loc_8DEEB:				; CODE XREF: UIWidget_ReleaseWrapper_8DEC0+8j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 38Ch
		mov	dword ptr es:[bx+2], 0
		mov	byte ptr es:[bx+6], 2
		mov	byte ptr es:[bx+7], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx+0Dh], 0
		mov	byte ptr es:[bx+51h], 0
		mov	word ptr es:[bx+86h], 0
		mov	dword ptr es:[bx+82h], 0
		mov	word ptr es:[bx+90h], 0
		mov	dword ptr es:[bx+92h], 0

loc_8DF41:				; CODE XREF: UIWidget_ReleaseWrapper_8DEC0+29j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
UIWidget_ReleaseWrapper_8DEC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 353 lignes - chargeur complet du sous-chunk RADI (radio/communications) du profil
; pilote PROF, structure confirmee par recoupement avec RSProf.cpp : valide RADI (tag
; 0x49444152, ResourceRecord_SeekAndReadB_647B2, pose un flag has-RADI a +0xC), puis ASKS (tag
; 0x534B5341), SPCH (tag 0x48435053, lit un octet unique a +0x51 - avec chargement
; conditionnel d'un fichier audio INTEL/SPEECH/.PAK si une condition memoire globale est
; remplie), INFO (tag 0x4F464E49, lit un id puis deux chaines via
; PilotProfile_ResolveNamedPropertyNode-adjacent ResourceRecord_ReadDwordFieldB_64AFF aux
; offsets +0x52 et +0x72 - correspond a {id, name, callsign}), OPTS (tag 0x5354504F, lit un
; nombre d'entrees plafonne a 8 puis un tableau d'octets a +0x88), et MSGS (tag 0x5347534D,
; alloue dynamiquement un tampon type tag 0x5C44 pour stocker des messages indexes).
; Anciennement mal nommee AITargeting_LoadCalibrationRecord (aucun rapport avec le ciblage
; IA). Candidat pour session dediee si la structure exacte de ASKS/MSGS (chaines/cles) doit
; etre tracee completement.
; ==============================================================================================
PilotProfile_LoadRADI_8DF49	proc far		; CODE XREF: VROOMM_StubThunk_6B63FJ

var_7A		= word ptr -7Ah
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 7Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		push	0
		push	large 49444152h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_8DF6C
		jmp	loc_8E2AB
; ���������������������������������������������������������������������������

loc_8DF6C:				; CODE XREF: PilotProfile_LoadRADI_8DF49+1Ej
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1
		mov	[bp+var_1], 0
		push	0
		push	large 534B5341h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8DF90
		jmp	loc_8E03A
; ���������������������������������������������������������������������������

loc_8DF90:				; CODE XREF: PilotProfile_LoadRADI_8DF49+42j
		cmp	byte_721D0, 0
		jz	short loc_8DFBE
		cmp	dword_721CB, 0
		jz	short loc_8DFBE
		push	0
		mov	al, byte_721CF
		push	ax
		mov	eax, dword_721CB
		mov	[bp+var_6], eax
		lea	ax, [bp+var_6]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8DFBE:				; CODE XREF: PilotProfile_LoadRADI_8DF49+4Cj
					; PilotProfile_LoadRADI_8DF49+54j
		mov	dword_721CB, 0
		mov	byte_721D0, 0
		mov	dword_721D1, 0
		mov	eax, [di+72h]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	dword_721CB, eax
		mov	byte_721CF, 2
		mov	byte_721D0, 1
		mov	dword_721D1, 0
		mov	eax, [bp+var_A]
		mov	dword_721D1, eax
		push	0
		mov	al, byte_721CF
		push	ax
		push	large [dword_721CB]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8E03A:				; CODE XREF: PilotProfile_LoadRADI_8DF49+44j
		push	0
		push	large 48435053h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E096
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+51h], al
		cmp	dword_72C38, 3567E0h
		jl	short loc_8E096
		push	ds
		push	offset a_pak_5	; ".PAK"
		push	ds
		push	offset aSpeech_0 ; "SPEECH"
		push	ds
		push	offset aIntel_1	; "INTEL"
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		les	bx, [bp+arg_0]
		mov	al, es:[bx+51h]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		call	Widget_Helper_5AAB2

loc_8E093:
		add	sp, 4

loc_8E096:				; CODE XREF: PilotProfile_LoadRADI_8DF49+104j
					; PilotProfile_LoadRADI_8DF49+11Dj
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743

loc_8E0A4:
		add	sp, 8
		or	ax, ax
		jz	short loc_8E0E2
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[bp+var_1], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	ax, word ptr [bp+arg_0]
		add	ax, 52h	; 'R'
		push	word ptr [bp+arg_0+2]
		push	ax
		push	di
		call	ResourceRecord_ReadViaHelper_64AD9
		add	sp, 6
		mov	ax, word ptr [bp+arg_0]
		add	ax, 72h	; 'r'
		push	word ptr [bp+arg_0+2]
		push	ax
		push	di
		call	ResourceRecord_ReadViaHelper_64AD9
		add	sp, 6

loc_8E0E2:				; CODE XREF: PilotProfile_LoadRADI_8DF49+160j
		push	0
		push	large 5354504Fh
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E131
		les	bx, [bp+arg_0]
		mov	ax, [di+72h]
		mov	es:[bx+86h], ax
		cmp	word ptr es:[bx+86h], 8
		jle	short loc_8E111
		mov	word ptr es:[bx+86h], 8

loc_8E111:				; CODE XREF: PilotProfile_LoadRADI_8DF49+1BFj
		xor	si, si
		jmp	short loc_8E127
; ���������������������������������������������������������������������������

loc_8E115:				; CODE XREF: PilotProfile_LoadRADI_8DF49+1E6j
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		add	bx, si
		mov	es:[bx+88h], al
		inc	si

loc_8E127:				; CODE XREF: PilotProfile_LoadRADI_8DF49+1CAj
		les	bx, [bp+arg_0]
		cmp	es:[bx+86h], si
		jg	short loc_8E115

loc_8E131:				; CODE XREF: PilotProfile_LoadRADI_8DF49+1ACj
		push	0
		push	large 5347534Dh
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8E149
		jmp	loc_8E2A4
; ���������������������������������������������������������������������������

loc_8E149:				; CODE XREF: PilotProfile_LoadRADI_8DF49+1FBj
		cmp	[bp+var_1], 0
		jnz	short loc_8E152
		jmp	loc_8E223
; ���������������������������������������������������������������������������

loc_8E152:				; CODE XREF: PilotProfile_LoadRADI_8DF49+204j
		cmp	dword_721D5, 0
		jz	short loc_8E15F
		mov	ax, 1
		jmp	short loc_8E161
; ���������������������������������������������������������������������������

loc_8E15F:				; CODE XREF: PilotProfile_LoadRADI_8DF49+20Fj
		xor	ax, ax

loc_8E161:				; CODE XREF: PilotProfile_LoadRADI_8DF49+214j
		or	ax, ax
		jz	short loc_8E1A0
		mov	eax, dword_721D5
		mov	[bp+var_12], eax
		mov	al, byte_721D9
		mov	[bp+var_13], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+2], eax
		mov	al, [bp+var_13]
		mov	es:[bx+6], al
		mov	byte ptr es:[bx+7], 0

loc_8E18B:
		mov	dword ptr es:[bx+8], 0
		mov	eax, dword_721DB

loc_8E198:
		mov	es:[bx+8], eax

loc_8E19D:
		jmp	loc_8E298
; ���������������������������������������������������������������������������

loc_8E1A0:				; CODE XREF: PilotProfile_LoadRADI_8DF49+21Aj
		cmp	dword ptr [di+72h], 0
		jg	short loc_8E1AA
		jmp	loc_8E298
; ���������������������������������������������������������������������������

loc_8E1AA:				; CODE XREF: PilotProfile_LoadRADI_8DF49+25Cj
		mov	eax, [di+72h]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	dword_721D5, eax
		mov	byte_721D9, 3
		mov	byte_721DA, 1
		mov	dword_721DB, 0
		mov	eax, [bp+var_18]
		mov	dword_721DB, eax
		mov	eax, dword_721D5
		mov	[bp+var_20], eax
		mov	al, byte_721D9
		mov	[bp+var_21], al
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_20]
		mov	es:[bx+2], eax
		mov	al, [bp+var_21]
		mov	es:[bx+6], al
		mov	byte ptr es:[bx+7], 0
		mov	dword ptr es:[bx+8], 0
		mov	eax, dword_721DB
		jmp	short loc_8E26E
; ���������������������������������������������������������������������������

loc_8E223:				; CODE XREF: PilotProfile_LoadRADI_8DF49+206j
		cmp	dword ptr [di+72h], 0
		jle	short loc_8E298
		mov	eax, [di+72h]
		mov	[bp+var_26], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_2A+2],	dx
		mov	word ptr [bp+var_2A], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_2A]
		mov	es:[bx+2], eax
		mov	byte ptr es:[bx+6], 3
		mov	byte ptr es:[bx+7], 1
		mov	dword ptr es:[bx+8], 0
		mov	eax, [bp+var_26]

loc_8E26E:				; CODE XREF: PilotProfile_LoadRADI_8DF49+2D8j
		mov	es:[bx+8], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		push	ax
		push	large dword ptr	es:[bx+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8E298:				; CODE XREF: PilotProfile_LoadRADI_8DF49:loc_8E19Dj
					; PilotProfile_LoadRADI_8DF49+25Ej ...
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AITargeting_AllocateWithErrorCheck_8E2AF
		add	sp, 4

loc_8E2A4:				; CODE XREF: PilotProfile_LoadRADI_8DF49+1FDj
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8E2AB:				; CODE XREF: PilotProfile_LoadRADI_8DF49+20j
		pop	di
		pop	si
		leave
		retf
PilotProfile_LoadRADI_8DF49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et gestion d'erreur (90 lignes).
; ==============================================================================================
AITargeting_AllocateWithErrorCheck_8E2AF	proc far		; CODE XREF: VROOMM_StubThunk_6B635J PilotProfile_LoadRADI_8DF49+355p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		push	ax
		push	large dword ptr	es:[bx+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		xor	dx, dx
		jmp	short loc_8E2F6
; ���������������������������������������������������������������������������

loc_8E2E6:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+4Aj
		mov	ax, dx
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	word ptr es:[bx+0Fh], 0
		inc	dx

loc_8E2F6:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+35j
		cmp	dx, 21h	; '!'
		jb	short loc_8E2E6
		xor	si, si
		jmp	short loc_8E344
; ���������������������������������������������������������������������������

loc_8E2FF:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+9Dj
		les	bx, [bp+var_4]
		add	bx, si
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		inc	si
		cmp	dx, 21h	; '!'
		jnb	short loc_8E31E
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	es:[bx+0Fh], si
		jmp	short loc_8E336
; ���������������������������������������������������������������������������

loc_8E31E:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+60j
		push	7013h
		jmp	short loc_8E330
; ���������������������������������������������������������������������������

loc_8E323:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+93j
		movsx	eax, si
		cmp	eax, [bp+var_8]
		jl	short loc_8E336
		push	7014h

loc_8E330:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+72j
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_8E336:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+6Dj
					; AITargeting_AllocateWithErrorCheck_8E2AF+7Cj
		mov	ax, si
		inc	si
		les	bx, [bp+var_4]
		add	bx, ax
		cmp	byte ptr es:[bx], 0
		jnz	short loc_8E323

loc_8E344:				; CODE XREF: AITargeting_AllocateWithErrorCheck_8E2AF+4Ej
		movsx	eax, si
		cmp	eax, [bp+var_8]
		jl	short loc_8E2FF
		pop	si
		leave
		retf
AITargeting_AllocateWithErrorCheck_8E2AF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 104 lignes - point d'entree de chargement PROF avec verification de version : construit
; un StreamReader, valide le chunk PROF (tag 0x464F5250), recherche le sous-chunk VERS (tag
; 0x53524556) et exige la valeur exacte 0x200 (version 2.0) - erreur 0x7015 si
; absent/different, erreur 0x7016 si PROF absent. Si la version est correcte, dispatche vers
; un chargeur polymorphe via un appel de vtable (call dword ptr [bx]) plutot que de parser
; directement _AI_/RADI/ATRB lui-meme - probable point d'entree generique reutilise par
; plusieurs types d'objets ayant chacun leur propre implementation de suite du chargement.
; Anciennement nommee AITargeting_OpenConfigFile.
; ==============================================================================================
PilotProfile_LoadFromPROF_VersionGate_8E351	proc far		; CODE XREF: VROOMM_StubThunk_6B63AJ

var_F8		= word ptr -0F8h
var_9B		= dword	ptr -9Bh
var_97		= dword	ptr -97h
var_93		= dword	ptr -93h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	dx, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], dx
		push	seg seg215
		push	offset a_iff	; ".IFF"
		mov	bx, dx
		push	large dword ptr	[bx+6]
		push	ds
		push	offset aIntel_2	; "INTEL"
		lea	ax, [bp+var_50]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_F8], 2C8h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 2E0h
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	large 464F5250h
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jz	short loc_8E423
		xor	si, si
		push	0
		push	large 53524556h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E3FE
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	si, ax

loc_8E3FE:				; CODE XREF: PilotProfile_LoadFromPROF_VersionGate_8E351+9Ej
		cmp	si, 200h
		jz	short loc_8E40D
		push	7015h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_8E40D:				; CODE XREF: PilotProfile_LoadFromPROF_VersionGate_8E351+B1j
		lea	ax, [bp+var_F8]
		push	ax
		push	large [bp+arg_0]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_8E42C
; ���������������������������������������������������������������������������

loc_8E423:				; CODE XREF: PilotProfile_LoadFromPROF_VersionGate_8E351+83j
		push	7016h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_8E42C:				; CODE XREF: PilotProfile_LoadFromPROF_VersionGate_8E351+D0j
		mov	[bp+var_F8], 2E0h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
PilotProfile_LoadFromPROF_VersionGate_8E351	endp

ovr260		ends
