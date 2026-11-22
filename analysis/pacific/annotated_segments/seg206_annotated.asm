seg206		segment	para public 'CODE' use16
		assume cs:seg206
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6Bh, 83h, 0C4h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DE96		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_6C598
		pop	cx
		cmp	dword ptr [si+5Dh], 0
		jnz	short loc_6DF01
		jmp	short loc_6DECD

loc_6DEAD:
		mov	eax, [si+61h]
		sar	eax, 1
		mov	[si+61h], eax
		cmp	dword ptr [si+61h], 0
		jnz	short loc_6DECD
		push	1AE0h
		push	si
		call	sub_76675
		add	sp, 4
		jmp	short loc_6DEE6

loc_6DECD:
		push	0
		push	2
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, [si+61h]
		jle	short loc_6DEAD

loc_6DEE6:
		push	3
		push	0
		push	2
		push	large [si+61h]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+5Fh], dx
		mov	[si+5Dh], ax

loc_6DF01:
		pop	si
		pop	bp
		retf
sub_6DE96		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DF04		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6DF1D
		push	65h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6DF3D

loc_6DF1D:
		push	[bp+arg_2]
		push	si
		call	StreamReader_ConstructVariantB_6BF89
		add	sp, 4
		mov	word ptr [si], 508h
		mov	eax, [bp+arg_4]
		mov	[si+61h], eax
		mov	dword ptr [si+5Dh], 0

loc_6DF3D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6DF04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DF42		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6DF5E
		push	65h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6DFA6

loc_6DF5E:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	word ptr [si], 372h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg173
		mov	word ptr [si+2], 2
		mov	word ptr [si], 37Ah
		push	0
		push	large 0
		push	large 0
		push	ax
		push	si
		call	sub_6C024
		add	sp, 0Eh
		mov	word ptr [si], 508h
		mov	eax, [bp+arg_4]
		mov	[si+61h], eax
		mov	dword ptr [si+5Dh], 0

loc_6DFA6:
		mov	ax, si
		pop	si
		leave
		retf
sub_6DF42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
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
StreamReader_ReleaseBuffer_6DFAB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6DFF3
		mov	word ptr [si], 508h
		cmp	dword ptr [si+5Dh], 0
		jz	short loc_6DFDB
		push	1A04h
		push	2
		mov	ax, si
		add	ax, 5Dh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_6DFDB:
		push	0
		push	si
		call	StreamReader_Close_6C110
		add	sp, 4
		test	di, 1
		jz	short loc_6DFF3
		push	si
		call	sub_3B2
		pop	cx

loc_6DFF3:
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_ReleaseBuffer_6DFAB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_WriteTyped_3CEFF (sub_3CEFF de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à StreamReader_WriteTyped_6568F
; (sub_6568F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⭐ far, écriture typée à travers le flux tamponné — pendant en écriture de
; StreamReader_ReadTyped_63FA1 (seg190) : gère la position courante (+0x4D) et la capacité
; (+0x55), délègue à sub_65795 pour le débordement de capacité. Référencée massivement
; (seg188, seg193-194) — fonction centrale du système d'écriture typée par handle.
; ==============================================================================================
StreamReader_WriteTyped_6DFF7		proc far

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
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+arg_A]
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_6E020
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_6E020:
		mov	[bp+var_10], 0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]
		cmp	eax, [si+55h]
		jle	short loc_6E06D
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		sub	eax, [si+55h]
		mov	[bp+var_10], eax
		push	large [si+55h]
		push	eax
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_WriteWithGrowth_6E0FD
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax

loc_6E06D:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jnz	short loc_6E0CF
		push	large [bp+arg_6]
		mov	eax, [bp+var_8]
		add	eax, [si+51h]
		push	eax
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6E0B4
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		jmp	short loc_6E0F1

loc_6E0B4:
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E0CA
		push	si
		call	StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6E0CA

loc_6E0CA:
		push	1A05h
		jmp	short loc_6E0E8

loc_6E0CF:
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E0E5
		push	si
		call	StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6E0E5

loc_6E0E5:
		push	1A01h

loc_6E0E8:
		push	si
		call	sub_76675
		add	sp, 4

loc_6E0F1:
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteTyped_6DFF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_WriteWithGrowth_3D005 (sub_3D005 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_WriteWithGrowth_65795 (sub_65795 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 289 lignes, NON DÉTAILLÉE — la plus grosse
; fonction du segment, gros buffer local (0x1D octets + plusieurs dwords). Appelée par
; StreamReader_WriteTyped_6568F en cas de dépassement de capacité — probable écriture avec
; agrandissement automatique du tampon. Candidat pour session dédiée.
; ==============================================================================================
StreamReader_WriteWithGrowth_6E0FD		proc far

var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
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
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1D], 0
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_6E11A
		mov	eax, [si+4Dh]
		mov	[bp+arg_A], eax

loc_6E11A:
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_A]
		cmp	eax, [bp+var_8]
		jl	short loc_6E13B
		jmp	loc_6E28E

loc_6E13B:
		mov	eax, [bp+var_8]
		sub	eax, [bp+arg_A]
		mov	[bp+var_4], eax
		push	large [bp+arg_6]
		push	large [bp+var_8]
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jnz	short loc_6E199
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E186
		push	si
		call	StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6E186

loc_6E186:
		push	1A06h

loc_6E189:
		push	si
		call	sub_76675
		add	sp, 4
		mov	[bp+var_1D], 1
		jmp	loc_6E28E

loc_6E199:
		mov	eax, [si+61h]
		mov	[bp+var_1C], eax
		cmp	eax, [bp+var_4]
		jle	short loc_6E1AF
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax

loc_6E1AF:
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		sub	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		jmp	loc_6E284

loc_6E1D6:
		push	large [bp+var_1C]
		push	large [bp+var_C]
		push	large [si+5Dh]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 0FFFFFFFFh
		jz	short loc_6E24A
		push	large [bp+var_1C]
		push	large [bp+var_10]
		push	large [si+5Dh]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_6E22E
		sub	[bp+var_4], eax
		jmp	short loc_6E266

loc_6E22E:
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E244
		push	si
		call	StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6E244

loc_6E244:
		push	1A08h
		jmp	loc_6E189

loc_6E24A:
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E260
		push	si
		call	StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6E260

loc_6E260:
		push	1A09h
		jmp	loc_6E189

loc_6E266:
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_4]
		jle	short loc_6E278
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax

loc_6E278:
		mov	eax, [bp+var_1C]
		sub	[bp+var_C], eax
		sub	[bp+var_10], eax

loc_6E284:
		cmp	[bp+var_4], 0
		jz	short loc_6E28E
		jmp	loc_6E1D6

loc_6E28E:
		mov	al, [bp+var_1D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E2F8
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_6E2D6
		mov	eax, [bp+arg_A]
		add	eax, [bp+arg_6]
		mov	[si+4Dh], eax
		mov	eax, [bp+arg_6]
		add	[si+55h], eax
		jmp	short loc_6E2F8

loc_6E2D6:
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E2EC
		push	si
		call	StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6E2EC

loc_6E2EC:
		push	1A07h
		push	si
		call	sub_76675
		add	sp, 4

loc_6E2F8:
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteWithGrowth_6E0FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E304		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6E324
		mov	word ptr [si], 4A1Eh
		mov	word ptr [si+2], 0
		jmp	short loc_6E326

loc_6E324:
		mov	ax, si

loc_6E326:
		pop	si
		pop	bp
		retf
sub_6E304		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E329		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
sub_6E329		endp
seg206		ends
