ovr205		segment	para public 'OVERLAY' use16
		assume cs:ovr205
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à World_OpenAndParseFile_A75D0 (sub_A75D0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; CHARGEUR DU FICHIER MONDE nomme par le chunk MISN/WRLD/FILE. Appele via stub sub_6CDCD
; depuis MissionScenario_LoadMainRecord_A8331 (seg456) avec le nom 8 octets lu dans le chunk
; FILE (ex. 'MAURITAN'). Fait : StreamReader_ConstructVariantA ; Path_ResolveDataFile(path,
; 'MISSIONS', nom, '.IFF') -> ..\..\DATA\MISSIONS\<nom>.IFF ;
; ResourceRecord_InitAndValidate(path, 'WRLD') (exige FORM racine WRLD) ;
; World_ParseWrldForm_A767F(&sr) ; cleanup (rewind_all, ReleaseBuffer). Si le chunk FILE est
; absent, MissionScenario appelle directement sub_6CDC8 -> A767F sur le flux de la mission
; (monde inline). Detail : analysis/DATA_MODEL.md §6.6b.
; ==============================================================================================
World_OpenAndParseFile_73350		proc far

var_F8		= word ptr -0F8h
var_A8		= word ptr -0A8h
var_4B		= dword ptr -4Bh
var_47		= dword ptr -47h
var_43		= dword ptr -43h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_A8], 9B5h
		mov	[bp+var_47], 100h
		mov	[bp+var_4B], 0
		mov	[bp+var_A8], 9CDh
		mov	[bp+var_2C], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		movsx	eax, ax
		mov	[bp+var_43], eax
		push	seg seg180
		push	0
		push	ds
		push	[bp+arg_0]
		push	ds
		push	offset aMISSIONS
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		push	large 444C5257h
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_InitAndValidate_53B4C
		add	sp, 8
		or	ax, ax
		jz	short loc_733DD
		lea	ax, [bp+var_A8]
		push	ax
		nop
		push	cs
		call	near ptr sub_733FF
		pop	cx
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_733DD:
		mov	[bp+var_A8], 9CDh
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		leave
		retf
World_OpenAndParseFile_73350		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_733FF		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_5C58C, 0
		jz	short loc_73444
		mov	byte_5C58D, 1
		mov	byte_5C5B6, 0
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_5C5AE, eax
		mov	byte_5C5B2, 0
		mov	byte_5C5B3, 0
		mov	word_5C5B4, 1
		push	si
		nop
		push	cs
		call	near ptr sub_739B5
		pop	cx
		jmp	loc_73565

loc_73444:
		cmp	word_601BB, 0
		jnz	short loc_73454
		push	649Bh
		call	Container_Construct
		pop	cx

loc_73454:
		nop
		push	cs
		call	near ptr sub_73ADC
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_7347D
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_7347D:
		push	0
		push	large 5A524F48h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_734B8
		push	si
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_5C603, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_5C607, eax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_734B8:
		push	large 1FA00h
		push	637Ah
		call	sub_33E3B
		add	sp, 6
		push	si
		nop
		push	cs
		call	near ptr TextScrollDisplayB_TickHelper_739BA
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_73568
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_738A2
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_739B5
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr World_LoadLGHTChunk_738A7
		pop	cx
		push	ds
		push	offset unk_601D9
		call	sub_5951F
		add	sp, 4
		push	0
		push	large 4C414353h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_73560
		push	si
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_5C592, eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, dword_5C592
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	dword_5C58E, eax
		mov	eax, dword_5C596
		mov	edx, dword_5C592
		imul	edx
		shrd	eax, edx, 8
		mov	dword_5C596, eax

loc_73560:
		mov	byte_5C58C, 1

loc_73565:
		pop	si
		leave
		retf
sub_733FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_73568		proc far

var_112		= word ptr -112h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 112h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_73595
		jmp	loc_7389F

loc_73595:
		push	si
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	63DEh
		call	sub_58F31
		add	sp, 4
		xor	si, si
		jmp	loc_73897

loc_735B6:
		mov	ax, 0Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_735C9
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_735FD

loc_735C9:
		cmp	byte_60160, 3
		jnz	short loc_735E8
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_735F0

loc_735E8:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_735F0:
		mov	bx, 0Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_735FD:
		mov	word ptr [bp+var_E], ax
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_12]
		mov	byte ptr es:[bx+0FFh], 0FFh
		mov	ax, si
		add	ax, 10h
		cmp	ax, 0FFFFh
		jnz	short loc_73639
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_7366D

loc_73639:
		cmp	byte_60160, 3
		jnz	short loc_73658
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_73660

loc_73658:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_73660:
		mov	bx, si
		add	bx, 10h
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_7366D:
		mov	word ptr [bp+var_E], ax
		mov	ax, 0Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_73683
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_736B7

loc_73683:
		cmp	byte_60160, 3
		jnz	short loc_736A2
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_736AA

loc_736A2:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_736AA:
		mov	bx, 0Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_736B7:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_12]
		mov	byte ptr es:[bx+0FFh], 0FFh
		cmp	si, 0FFFFh
		jnz	short loc_736E4
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_73715

loc_736E4:
		cmp	byte_60160, 3
		jnz	short loc_73703
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7370B

loc_73703:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_7370B:
		mov	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_73715:
		mov	word ptr [bp+var_E], ax
		mov	ax, si
		add	ax, 10h
		cmp	ax, 0FFFFh
		jnz	short loc_7372B
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_7375F

loc_7372B:
		cmp	byte_60160, 3
		jnz	short loc_7374A
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_73752

loc_7374A:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_73752:
		mov	bx, si
		add	bx, 10h
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_7375F:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_12]
		mov	byte ptr es:[bx+0FFh], 0FFh
		mov	ax, 1Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_73791
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_737C5

loc_73791:
		cmp	byte_60160, 3
		jnz	short loc_737B0
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_737B8

loc_737B0:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_737B8:
		mov	bx, 1Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_737C5:
		mov	word ptr [bp+var_E], ax
		cmp	si, 0FFFFh
		jnz	short loc_737D6
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_73807

loc_737D6:
		cmp	byte_60160, 3
		jnz	short loc_737F5
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_737FD

loc_737F5:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_737FD:
		mov	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_73807:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_12]
		mov	byte ptr es:[bx+0FFh], 0FFh
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		mov	word ptr [bp+var_E], ax
		mov	ax, 1Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_73843
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_73877

loc_73843:
		cmp	byte_60160, 3
		jnz	short loc_73862
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7386A

loc_73862:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_7386A:
		mov	bx, 1Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_73877:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_12]
		mov	byte ptr es:[bx+0FFh], 0FFh
		inc	si

loc_73897:
		cmp	si, 8
		jge	short loc_7389F
		jmp	loc_735B6

loc_7389F:
		pop	si
		leave
		retf
sub_73568		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_738A2		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_738A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à World_LoadLGHTChunk_BC1F7 (sub_BC1F7 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à World_LoadLGHTChunk_A7A10 (sub_A7A10 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14.
; LECTEUR DU CHUNK 'LGHT' du FORM WRLD (appelé par World_ParseWrldForm_A767F), objet jeu de
; lumières 5A9Ah. uint16 poids ambiant → LightSet_SetAmbientWeight_2B24F (+7) ; uint16
; pourcentage, borné à 100 puis × 255 ÷ 100 → LightSet_SetIntensityPercent_2B228 (+9 ; ce
; dernier borne à son tour à 100 : ≥ 40 % donne 1,0) ; puis jusqu'à la fin du chunk,
; enregistrements de 10 o : uint16 poids, 3 int16 direction (<< 8 ; ordre fichier X, Z, Y),
; uint8 normaliser, 1 octet non référencé ici → LightSet_AddLight_2B2DB.
; Ex-'MissionLoader_LoadPosition_A7A10'.
; ==============================================================================================
World_LoadLGHTChunk_738A7		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	large 5448474Ch
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_738CA
		jmp	loc_739B1

loc_738CA:
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_C], ax
		push	ax
		push	6567h
		call	LightSet_SetAmbientWeight_34116
		add	sp, 4
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, ax
		cmp	dx, 64h
		jge	short loc_738F0
		jmp	short loc_738F3

loc_738F0:
		mov	ax, 64h

loc_738F3:
		mov	dx, ax
		movsx	eax, dx
		imul	eax, eax, 0FFh
		mov	ebx, 64h
		cdq
		idiv	ebx
		push	ax
		push	6567h
		call	LightSet_SetIntensityPercent_340EF
		add	sp, 4
		jmp	short loc_7397E

loc_73919:
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	al, [bp+var_2]
		push	ax
		sub	sp, 4
		mov	ax, [bp+var_4]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	ax, [bp+var_6]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	ax, [bp+var_8]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_24], eax
		push	[bp+var_A]
		push	6567h
		call	LightSet_AddLight_341A2
		add	sp, 12h

loc_7397E:
		test	word ptr [di+72h], 1
		jz	short loc_73999
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_73997
		inc	dword ptr [di+65h]
		jmp	short loc_73999

loc_73997:
		jmp	short loc_73999

loc_73999:
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_739A8
		mov	ax, 1
		jmp	short loc_739AA

loc_739A8:
		xor	ax, ax

loc_739AA:
		or	ax, ax
		jnz	short loc_739B1
		jmp	loc_73919

loc_739B1:
		pop	di
		pop	si
		leave
		retf
World_LoadLGHTChunk_738A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_739B5		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_739B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_511CC (sub_511CC de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_3F737 (sub_3F737 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_67F13 (sub_67F13 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A (même
; appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_739BA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	64A5h
		call	sub_58D9D
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_739BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_739CD		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5C58C, 0
		jz	short loc_73A1A
		push	6495h
		call	WeakRef_TableDestruct
		pop	cx
		push	637Ah
		call	sub_33EEB
		pop	cx
		push	64A5h
		call	sub_58DFC
		pop	cx
		push	6567h
		call	Collection_ClearAndFree
		pop	cx
		nop
		push	cs
		call	near ptr sub_74361
		push	649Bh
		call	Container_Clear
		pop	cx
		push	ds
		push	offset unk_601D9
		call	sub_5951A
		add	sp, 4
		mov	byte_5C58C, 0

loc_73A1A:
		pop	bp
		retf
sub_739CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_73A1C		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_73A1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionLoader_ReleaseRosterAndDestruct_BC7D7 (sub_BC7D7 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à MissionLoader_ReleaseRosterAndDestruct_A7F16
; (sub_A7F16 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle MissionLoader_AssignUnitRoster_A7D46 puis libère l'objet (sub_338).
; ==============================================================================================
MissionLoader_ReleaseRosterAndDestruct_73A21		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_73A41
		push	cs
		call	near ptr sub_739CD
		test	di, 1
		jz	short loc_73A41
		push	si
		call	sub_33B
		pop	cx

loc_73A41:
		pop	di
		pop	si
		pop	bp
		retf
MissionLoader_ReleaseRosterAndDestruct_73A21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_73A45		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_5F552, 2
		jnz	short loc_73A61
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		jmp	short loc_73A61

loc_73A61:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		cmp	byte_5F552, 2
		jnz	short loc_73AB3
		push	5822h
		call	sub_5830
		pop	cx
		mov	[bp+var_2], ax
		push	1
		push	5822h
		call	sub_595C
		add	sp, 4
		push	large 20000h
		push	5822h
		call	sub_5856
		add	sp, 6
		cmp	[bp+var_2], 0
		jnz	short loc_73AB1
		push	5822h
		call	sub_5844
		pop	cx
		jmp	short loc_73AB3

loc_73AB1:
		jmp	short loc_73AB3

loc_73AB3:
		push	64A5h
		call	sub_58DC0
		pop	cx
		mov	[bp+var_4], ax
		mov	dword_5B3DD, 0
		mov	word_5C5AC, 0
		push	63DEh
		call	VGA_LoadPalette
		pop	cx
		mov	ax, [bp+var_4]
		leave
		retf
sub_73A45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_73ADC		proc far

var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
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
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		cmp	byte_5C60B, 0
		jz	short loc_73AEC
		jmp	loc_7435F

loc_73AEC:
		push	1
		push	0
		push	2
		push	large 1Eh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_73B31
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2D94h
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_73B37

loc_73B31:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_73B37:
		mov	word_6005A, dx
		mov	word ptr dword_60058, ax
		push	1
		push	0
		push	2
		push	large 20h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_73B83
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2D1Ch
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		jmp	short loc_73B89

loc_73B83:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_73B89:
		mov	word_6005E, dx
		mov	word ptr dword_6005C, ax
		push	1
		push	0
		push	2
		push	large 1Eh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	ax, dx
		jz	short loc_73BDA
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2D94h
		mov	word ptr es:[bx], 2CF4h
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		jmp	short loc_73BE0

loc_73BDA:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]

loc_73BE0:
		mov	word_60062, dx
		mov	word ptr dword_60060, ax
		push	1
		push	0
		push	2
		push	large 24h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		or	ax, dx
		jz	short loc_73C42
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx+1Ch], 2CC4h
		and	byte ptr es:[bx+22h], 0FDh
		and	byte ptr es:[bx+22h], 0FEh
		mov	word ptr es:[bx], 2CC8h
		mov	word ptr es:[bx+1Ch], 2CF0h
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]
		jmp	short loc_73C48

loc_73C42:
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]

loc_73C48:
		mov	word_60066, dx
		mov	word ptr dword_60064, ax
		push	1
		push	0
		push	2
		push	large 1Eh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		or	ax, dx
		jz	short loc_73C94
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2C9Ch
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]
		jmp	short loc_73C9A

loc_73C94:
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]

loc_73C9A:
		mov	word_6006A, dx
		mov	word ptr dword_60068, ax
		push	1
		push	0
		push	2
		push	large 2Ch
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		or	ax, dx
		jz	short loc_73CEF
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2C68h
		mov	dword ptr es:[bx+1Ch], 0
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]
		jmp	short loc_73CF5

loc_73CEF:
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]

loc_73CF5:
		mov	word_6006E, dx
		mov	word ptr dword_6006C, ax
		push	1
		push	0
		push	2
		push	large 34h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		or	ax, dx
		jz	short loc_73D65
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2C68h
		mov	dword ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx+2Ch], 2CC4h
		and	byte ptr es:[bx+32h], 0FDh
		and	byte ptr es:[bx+32h], 0FEh
		mov	word ptr es:[bx], 2C30h
		mov	word ptr es:[bx+2Ch], 2C64h
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	short loc_73D6B

loc_73D65:
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]

loc_73D6B:
		mov	word_60072, dx
		mov	word ptr dword_60070, ax
		push	1
		push	0
		push	2
		push	large 2Eh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		or	ax, dx
		jz	short loc_73DC5
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2C68h
		mov	dword ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx], 2BFCh
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]
		jmp	short loc_73DCB

loc_73DC5:
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]

loc_73DCB:
		mov	word_60076, dx
		mov	word ptr dword_60074, ax
		push	1
		push	0
		push	2
		push	large 34h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		or	ax, dx
		jz	short loc_73E3B
		les	bx, [bp+var_24]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_24]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2C68h
		mov	dword ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx+2Ch], 2CC4h
		and	byte ptr es:[bx+32h], 0FDh
		and	byte ptr es:[bx+32h], 0FEh
		mov	word ptr es:[bx], 2BC4h
		mov	word ptr es:[bx+2Ch], 2BF8h
		mov	dx, [bp+var_22]
		mov	ax, [bp+var_24]
		jmp	short loc_73E41

loc_73E3B:
		mov	dx, [bp+var_22]
		mov	ax, [bp+var_24]

loc_73E41:
		mov	word_6007A, dx
		mov	word ptr dword_60078, ax
		push	1
		push	0
		push	2
		push	large 2Eh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_26], dx
		mov	[bp+var_28], ax
		or	ax, dx
		jz	short loc_73E9B
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 2D6Ch
		mov	word ptr es:[bx], 2C68h
		mov	dword ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx], 2B90h
		mov	dx, [bp+var_26]
		mov	ax, [bp+var_28]
		jmp	short loc_73EA1

loc_73E9B:
		mov	dx, [bp+var_26]
		mov	ax, [bp+var_28]

loc_73EA1:
		mov	word_6007E, dx
		mov	word ptr dword_6007C, ax
		push	1
		push	0
		push	2
		push	large 22h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		or	ax, dx
		jz	short loc_73EED
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2B68h
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]
		jmp	short loc_73EF3

loc_73EED:
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]

loc_73EF3:
		mov	word_6002E, dx
		mov	word ptr dword_6002C, ax
		push	1
		push	0
		push	2
		push	large 24h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_2E], dx
		mov	[bp+var_30], ax
		or	ax, dx
		jz	short loc_73F3F
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2B18h
		mov	dx, [bp+var_2E]
		mov	ax, [bp+var_30]
		jmp	short loc_73F45

loc_73F3F:
		mov	dx, [bp+var_2E]
		mov	ax, [bp+var_30]

loc_73F45:
		mov	word_60032, dx
		mov	word ptr dword_60030, ax
		push	1
		push	0
		push	2
		push	large 22h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		or	ax, dx
		jz	short loc_73F96
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2B68h
		mov	word ptr es:[bx], 2AF0h
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]
		jmp	short loc_73F9C

loc_73F96:
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]

loc_73F9C:
		mov	word_60036, dx
		mov	word ptr dword_60034, ax
		push	1
		push	0
		push	2
		push	large 28h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_36], dx
		mov	[bp+var_38], ax
		or	ax, dx
		jz	short loc_73FFE
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx+20h], 2AC0h
		and	byte ptr es:[bx+27h], 0FDh
		and	byte ptr es:[bx+27h], 0FEh
		mov	word ptr es:[bx], 2AC4h
		mov	word ptr es:[bx+20h], 2AECh
		mov	dx, [bp+var_36]
		mov	ax, [bp+var_38]
		jmp	short loc_74004

loc_73FFE:
		mov	dx, [bp+var_36]
		mov	ax, [bp+var_38]

loc_74004:
		mov	word_6003A, dx
		mov	word ptr dword_60038, ax
		push	1
		push	0
		push	2
		push	large 22h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		or	ax, dx
		jz	short loc_74050
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2A98h
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]
		jmp	short loc_74056

loc_74050:
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]

loc_74056:
		mov	word_6003E, dx
		mov	word ptr dword_6003C, ax
		push	1
		push	0
		push	2
		push	large 34h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_3E], dx
		mov	[bp+var_40], ax
		or	ax, dx
		jz	short loc_740AB
		les	bx, [bp+var_40]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_40]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2A64h
		mov	dword ptr es:[bx+20h], 0
		mov	dx, [bp+var_3E]
		mov	ax, [bp+var_40]
		jmp	short loc_740B1

loc_740AB:
		mov	dx, [bp+var_3E]
		mov	ax, [bp+var_40]

loc_740B1:
		mov	word_60042, dx
		mov	word ptr dword_60040, ax
		push	1
		push	0
		push	2
		push	large 3Ch
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_42], dx
		mov	[bp+var_44], ax
		or	ax, dx
		jz	short loc_74121
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2A64h
		mov	dword ptr es:[bx+20h], 0
		mov	word ptr es:[bx+34h], 2AC0h
		and	byte ptr es:[bx+3Bh], 0FDh
		and	byte ptr es:[bx+3Bh], 0FEh
		mov	word ptr es:[bx], 2A2Ch
		mov	word ptr es:[bx+34h], 2A60h
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]
		jmp	short loc_74127

loc_74121:
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]

loc_74127:
		mov	word_60046, dx
		mov	word ptr dword_60044, ax
		push	1
		push	0
		push	2
		push	large 36h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_46], dx
		mov	[bp+var_48], ax
		or	ax, dx
		jz	short loc_74181
		les	bx, [bp+var_48]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_48]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2A64h
		mov	dword ptr es:[bx+20h], 0
		mov	word ptr es:[bx], 29F8h
		mov	dx, [bp+var_46]
		mov	ax, [bp+var_48]
		jmp	short loc_74187

loc_74181:
		mov	dx, [bp+var_46]
		mov	ax, [bp+var_48]

loc_74187:
		mov	word_6004A, dx
		mov	word ptr dword_60048, ax
		push	1
		push	0
		push	2
		push	large 3Ch
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_4A], dx
		mov	[bp+var_4C], ax
		or	ax, dx
		jz	short loc_741F7
		les	bx, [bp+var_4C]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_4C]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2A64h
		mov	dword ptr es:[bx+20h], 0
		mov	word ptr es:[bx+34h], 2AC0h
		and	byte ptr es:[bx+3Bh], 0FDh
		and	byte ptr es:[bx+3Bh], 0FEh
		mov	word ptr es:[bx], 29C0h
		mov	word ptr es:[bx+34h], 29F4h
		mov	dx, [bp+var_4A]
		mov	ax, [bp+var_4C]
		jmp	short loc_741FD

loc_741F7:
		mov	dx, [bp+var_4A]
		mov	ax, [bp+var_4C]

loc_741FD:
		mov	word_6004E, dx
		mov	word ptr dword_6004C, ax
		push	1
		push	0
		push	2
		push	large 36h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_4E], dx
		mov	[bp+var_50], ax
		or	ax, dx
		jz	short loc_74257
		les	bx, [bp+var_50]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_50]
		mov	word ptr es:[bx], 2B40h
		mov	word ptr es:[bx], 2A64h
		mov	dword ptr es:[bx+20h], 0
		mov	word ptr es:[bx], 298Ch
		mov	dx, [bp+var_4E]
		mov	ax, [bp+var_50]
		jmp	short loc_7425D

loc_74257:
		mov	dx, [bp+var_4E]
		mov	ax, [bp+var_50]

loc_7425D:
		mov	word_60052, dx
		mov	word ptr dword_60050, ax
		push	1
		push	0
		push	2
		push	large 0Fh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_52], dx
		mov	[bp+var_54], ax
		or	ax, dx
		jz	short loc_742A9
		les	bx, [bp+var_54]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_54]
		mov	word ptr es:[bx], 293Ch
		mov	word ptr es:[bx], 2964h
		mov	dx, [bp+var_52]
		mov	ax, [bp+var_54]
		jmp	short loc_742AF

loc_742A9:
		mov	dx, [bp+var_52]
		mov	ax, [bp+var_54]

loc_742AF:
		mov	word_5FFB6, dx
		mov	word ptr dword_5FFB4, ax
		push	1
		push	0
		push	2
		push	large 12h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_56], dx
		mov	[bp+var_58], ax
		or	ax, dx
		jz	short loc_742FB
		les	bx, [bp+var_58]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_58]
		mov	word ptr es:[bx], 293Ch
		mov	word ptr es:[bx], 2914h
		mov	dx, [bp+var_56]
		mov	ax, [bp+var_58]
		jmp	short loc_74301

loc_742FB:
		mov	dx, [bp+var_56]
		mov	ax, [bp+var_58]

loc_74301:
		mov	word_5FFBA, dx
		mov	word ptr dword_5FFB8, ax
		push	1
		push	0
		push	2
		push	large 11h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_5A], dx
		mov	[bp+var_5C], ax
		or	ax, dx
		jz	short loc_7434D
		les	bx, [bp+var_5C]
		mov	word ptr es:[bx], 2D44h
		push	dx
		push	bx
		call	sub_30547
		add	sp, 4
		les	bx, [bp+var_5C]
		mov	word ptr es:[bx], 293Ch
		mov	word ptr es:[bx], 28ECh
		mov	dx, [bp+var_5A]
		mov	ax, [bp+var_5C]
		jmp	short loc_74353

loc_7434D:
		mov	dx, [bp+var_5A]
		mov	ax, [bp+var_5C]

loc_74353:
		mov	word_5FFBE, dx
		mov	word ptr dword_5FFBC, ax
		mov	byte_5C60B, 1

loc_7435F:
		leave
		retf
sub_73ADC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74361		proc far

var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		mov	al, byte_5C60B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_74373
		jmp	loc_745E5

loc_74373:
		mov	eax, dword_60058
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_6005C
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60060
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60064
		mov	[bp+var_10], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60068
		mov	[bp+var_14], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_6006C
		mov	[bp+var_18], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60070
		mov	[bp+var_1C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60074
		mov	[bp+var_20], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60078
		mov	[bp+var_24], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_6007C
		mov	[bp+var_28], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_6002C
		mov	[bp+var_2C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60030
		mov	[bp+var_30], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60034
		mov	[bp+var_34], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60038
		mov	[bp+var_38], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_6003C
		mov	[bp+var_3C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60040
		mov	[bp+var_40], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60044
		mov	[bp+var_44], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60048
		mov	[bp+var_48], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_6004C
		mov	[bp+var_4C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_60050
		mov	[bp+var_50], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_5FFB4
		mov	[bp+var_54], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_5FFB8
		mov	[bp+var_58], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, dword_5FFBC
		mov	[bp+var_5C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	byte_5C60B, 0

loc_745E5:
		leave
		retf
sub_74361		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_745E7		proc far
		push	bp
		mov	bp, sp
		mov	dword_5C603, 4E2000h
		mov	dword_5C607, 3E800h
		pop	bp
		retf
sub_745E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_745FE		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_745FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74603		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		add	ax, 24h
		push	[bp+arg_2]
		push	ax
		lea	ax, [bp+arg_4]
		push	ss
		push	ax
		mov	cx, 10h
		call	CRT_Fmemcpy
		pop	bp
		retf
sub_74603		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7461F		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_7461F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74624		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_74624		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7462B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		add	ax, 20h
		push	[bp+arg_2]
		push	ax
		lea	ax, [bp+arg_4]
		push	ss
		push	ax
		mov	cx, 0Ch
		call	CRT_Fmemcpy
		pop	bp
		retf
sub_7462B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74647		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_74647		endp
ovr205		ends
