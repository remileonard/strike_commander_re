seg159		segment	para public 'CODE' use16
		assume cs:seg159
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 40h, 83h, 0C4h, 0Eh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à FileStream_Construct_3AE1E (sub_3AE1E de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à FileStream_Construct_635AE (sub_635AE de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, constructeur d'une
; classe « flux de fichier » : alloue (sub_658, 0x1C octets), pose deux tags vtable successifs
; (3F42h/3F22h), initialise 6 champs (dont +0x18 = position courante) puis appelle
; FileStream_Open_6368E. Référencée depuis seg193.
; ==============================================================================================
FileStream_Construct_40507		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_40520
		push	47h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4056A

loc_40520:
		mov	word ptr [si], 526Eh
		mov	word ptr [si+2], 0
		mov	word ptr [si], 524Ah
		mov	dword ptr [si+6], 0
		mov	dword ptr [si+0Ah], 0
		mov	dword ptr [si+16h], 0
		mov	dword ptr [si+12h], 0
		mov	dword ptr [si+1Ah], 0
		mov	dword ptr [si+0Eh], 0
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_407C5
		add	sp, 6

loc_4056A:
		mov	ax, si
		pop	si
		pop	bp
		retf
FileStream_Construct_40507		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4056F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+4], di
		mov	ax, [si+4]
		add	ax, 0Ah
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	bx, ax
		mov	dx, di
		add	dx, 0Ah
		cmp	bx, 28h
		jle	short loc_4059B
		add	ax, 0FFD8h
		add	dx, ax

loc_4059B:
		push	dx
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	CRT_Strupr_2E71
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	di
		push	si
		call	sub_4164F
		add	sp, 6
		mov	dword ptr [si+16h], 0
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf
sub_4056F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ReleaseBuffer_3CEB3 (sub_3CEB3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_ReleaseBuffer_65643 (sub_65643 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère le
; tampon (Memory_TypedFree_5C7B6), ferme le flux sous-jacent (StreamReader_Close_63BD5,
; seg190) et libère l'objet (sub_338). DECOUVERTE COMPLEMENTAIRE : cette fonction est AUSSI
; utilisee comme fonction de SCORE pour MVRS ID=0x1 (tag 0x2B4) - reutilisation d'un
; utilitaire generique SANS INITIALISER AL AVANT LE RETOUR (pas de 'mov al,...' avant le
; retf), contrairement a toutes les autres fonctions de score qui bornent explicitement leur
; resultat 0-9/0-10. Le 'score' resultant pour ID=0x1 est donc indetermine (valeur residuelle
; de AL) - suggere un emplacement vestigial jamais concu comme un vrai type de comportement
; MVRS.
; ==============================================================================================
StreamReader_ReleaseBuffer_405D2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4061A
		mov	word ptr [si], 524Ah
		cmp	dword ptr [si+6], 0
		jz	short loc_40602
		push	1205h
		push	2
		mov	ax, si
		add	ax, 6
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_40602:
		push	0
		push	si
		call	sub_416E2
		add	sp, 4
		test	di, 1
		jz	short loc_4061A
		push	si
		call	sub_39C
		pop	cx

loc_4061A:
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_ReleaseBuffer_405D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4061E		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+4]
		call	StreamReader_GetCapacity_4154E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		mov	bx, [si+4]
		mov	eax, [bx+51h]
		mov	[bp+var_14], eax
		les	bx, word_4CF9E
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jz	short loc_40669
		push	ds
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_41CD9
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jnz	short loc_40681

loc_40669:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		push	si
		call	FileStream_Method_Read_4158F
		add	sp, 0Eh
		jmp	loc_407C2

loc_40681:
		mov	eax, [bp+arg_6]
		add	eax, [bp+arg_A]
		sub	eax, [bp+var_14]
		cmp	eax, [bp+var_10]
		jle	short loc_406A3
		mov	eax, [bp+var_10]
		sub	eax, [bp+arg_6]
		add	eax, [bp+var_14]
		mov	[bp+arg_A], eax

loc_406A3:
		mov	eax, [bp+arg_A]
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0
		jge	short loc_406C6
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	19A0h
		push	5244h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 6

loc_406C6:
		lea	ax, word ptr [bp+arg_A]
		push	ax
		lea	ax, word ptr [bp+arg_6]
		push	ax
		lea	ax, word ptr [bp+arg_2]
		push	ax
		push	large [bp+var_4]
		call	sub_4181A
		add	sp, 0Ah
		cmp	[bp+arg_A], 0
		jnz	short loc_406E8
		jmp	loc_40780

loc_406E8:
		cmp	[bp+arg_A], 0FFC1h
		jl	short loc_406F5
		jmp	loc_40780

loc_406F5:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_A]
		jz	short loc_40704
		mov	ax, 1
		jmp	short loc_40706

loc_40704:
		xor	ax, ax

loc_40706:
		mov	cl, al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4073F
		mov	eax, [bp+arg_6]
		sub	eax, [bp+var_14]
		mov	ebx, 0FFC0h
		cdq
		idiv	ebx
		push	eax
		mov	eax, [bp+arg_6]
		add	eax, [bp+arg_A]
		dec	eax
		sub	eax, [bp+var_14]
		cdq
		idiv	ebx
		pop	edx
		cmp	edx, eax
		jnz	short loc_4073F
		mov	cl, 1

loc_4073F:
		or	cl, cl
		jz	short loc_40780
		push	large [bp+arg_6]
		push	si
		push	large [bp+var_4]
		call	sub_421E2
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_40780
		lea	ax, word ptr [bp+arg_A]
		push	ax
		lea	ax, word ptr [bp+arg_6]
		push	ax
		lea	ax, word ptr [bp+arg_2]
		push	ax
		push	large [bp+var_4]
		call	sub_4181A
		add	sp, 0Ah
		cmp	[bp+arg_A], 0
		jz	short loc_40780
		push	1209h
		call	sub_13451
		pop	cx

loc_40780:
		cmp	[bp+arg_A], 0
		jz	short loc_407B1
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		push	si
		call	FileStream_Method_Read_4158F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	edx, [bp+var_8]
		sub	edx, [bp+arg_A]
		add	edx, eax
		mov	[bp+var_C], edx
		jmp	short loc_407B9

loc_407B1:
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax

loc_407B9:
		mov	eax, [bp+var_C]
		shld	edx, eax, 10h

loc_407C2:
		pop	si
		leave
		retf
sub_4061E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_407C5		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		les	bx, word_4CF9E
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_407EE
		mov	dword ptr [si+0Ah], 0
		mov	[bp+var_1], 1
		jmp	loc_40893

loc_407EE:
		cmp	word ptr [si+2], 0
		jz	short loc_407F9
		mov	ax, 1
		jmp	short loc_407FB

loc_407F9:
		xor	ax, ax

loc_407FB:
		mov	ah, 0
		or	ax, ax
		jz	short loc_40804
		jmp	loc_40893

loc_40804:
		cmp	dword ptr [si+6], 0
		jz	short loc_40820
		push	0
		push	2
		mov	ax, si
		add	ax, 6
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_40820:
		push	0
		push	2
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, [bp+arg_2]
		jle	short loc_40868
		mov	[bp+var_1], 1
		mov	eax, [bp+arg_2]
		mov	[si+0Ah], eax
		push	1
		push	0
		push	2
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+8], dx
		mov	[si+6], ax
		mov	eax, [si+6]
		mov	[si+0Eh], eax
		jmp	short loc_40883

loc_40868:
		push	1
		push	0
		push	2
		push	large [si+0Ah]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+8], dx
		mov	[si+6], ax

loc_40883:
		cmp	dword ptr [si+6], 0
		jnz	short loc_40893
		push	1201h
		call	sub_13451
		pop	cx

loc_40893:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_407C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40899		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	large [si+0Ah]
		push	large [bp+arg_2]
		push	large [si+6]
		push	si
		push	cs
		call	near ptr sub_4061E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0FFFFFFFFh
		jz	short loc_408DA
		mov	[si+16h], eax
		mov	eax, [bp+arg_2]
		mov	[si+12h], eax
		mov	[bp+var_1], 1

loc_408DA:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_40899		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à FileStream_ReadBuffered_3AFFF (sub_3AFFF de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à FileStream_ReadBuffered_6378F
; (sub_6378F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 79 lignes, NON DÉTAILLÉE — appelle FileStream_ReadRaw_63747, probable gestion
; du buffer de lecture. Appelée par FileStream_ReadLoop_6380D.
; ==============================================================================================
FileStream_ReadBuffered_408E0		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sub	eax, [si+12h]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jl	short loc_40907
		mov	eax, [si+16h]
		cmp	eax, [bp+var_4]
		jg	short loc_40929

loc_40907:
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_40899
		add	sp, 6
		or	al, al
		jz	short loc_40921
		mov	[bp+var_4], 0
		jmp	short loc_40929

loc_40921:
		mov	eax, 0FFFFFFFFh
		jmp	short loc_40956

loc_40929:
		mov	ax, [si+8]
		mov	dx, [si+6]
		add	dx, word ptr [bp+var_4]
		mov	[si+10h], ax
		mov	[si+0Eh], dx
		mov	eax, [si+16h]
		sub	eax, [bp+var_4]
		mov	[bp+var_8], eax
		cmp	eax, [bp+arg_6]
		jle	short loc_40952
		mov	eax, [bp+arg_6]
		mov	[bp+var_8], eax

loc_40952:
		mov	eax, [bp+var_8]

loc_40956:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
FileStream_ReadBuffered_408E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4095E		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_A], 0
		jge	short loc_40983
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	19A1h
		push	5244h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 6

loc_40983:
		mov	eax, [si+0Ah]
		cmp	eax, [bp+arg_A]
		jl	short loc_40999
		les	bx, word_4CF9E
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_409B0

loc_40999:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_4061E
		add	sp, 0Eh
		jmp	loc_40A51

loc_409B0:
		mov	[bp+var_8], 0
		cmp	[bp+arg_6], 0FFFFFFFFh
		jnz	short loc_40A2A
		mov	eax, [si+1Ah]
		mov	[bp+arg_6], eax
		jmp	short loc_40A2A

loc_409C9:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	si
		push	cs
		call	near ptr FileStream_ReadBuffered_408E0
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_40A31
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_40A31
		push	word ptr [bp+var_4]
		push	large [si+0Eh]
		push	large [bp+arg_2]
		call	sub_3545
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		add	[bp+arg_6], eax
		sub	[bp+arg_A], eax
		add	[bp+var_8], eax
		mov	ax, word ptr [bp+arg_2]
		mov	cx, ax
		shr	ax, 4
		add	word ptr [bp+arg_2+2], ax
		and	cx, 0Fh
		mov	word ptr [bp+arg_2], cx
		mov	ax, word ptr [bp+var_4]
		add	word ptr [bp+arg_2], ax

loc_40A2A:
		cmp	[bp+arg_A], 0
		jg	short loc_409C9

loc_40A31:
		mov	eax, [bp+arg_6]
		mov	[si+1Ah], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jnz	short loc_40A48
		mov	[bp+var_8], 0FFFFFFFFh

loc_40A48:
		mov	eax, [bp+var_8]
		shld	edx, eax, 10h

loc_40A51:
		pop	si
		leave
		retf
sub_4095E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_GetCapacity_3B8D2 (sub_3B8D2 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à StreamReader_GetCapacity_64062
; (sub_64062 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, retourne la capacité du tampon (+0x55, 32 bits). Référencée directement par
; sub_27355 et sub_27F9E (proches de TextRenderer).
; ==============================================================================================
StreamReader_GetCapacity_40A54		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+1Ah]
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
StreamReader_GetCapacity_40A54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40A67		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large 80h
		push	0
		push	cs
		call	near ptr FileStream_Construct_40507
		add	sp, 6
		mov	di, ax
		mov	dx, si
		mov	bx, dx
		mov	ax, [bx+2]
		mov	[di+2], ax
		mov	ax, [bx+4]
		mov	[di+4], ax
		push	28h
		mov	ax, si
		add	ax, 1Eh
		push	ax
		mov	ax, di
		add	ax, 1Eh
		push	ax
sub_40A67		endp

; START OF FUNCTION CHUNK FOR sub_40A67
		db 9Ah
		inc	si
; END OF FUNCTION CHUNK FOR sub_40A67
seg159		ends
