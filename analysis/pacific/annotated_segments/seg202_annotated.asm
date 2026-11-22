seg202		segment	para public 'CODE' use16
		assume cs:seg202
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_Destruct_3B16F (sub_3B16F de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à StreamReader_Destruct_638FF (sub_638FF de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, destructeur de la
; classe « lecteur de flux tamponné » : détruit des sous-objets (sub_5E9A9/sub_5E95A),
; dispatch vtable (DisplayContext_Method_PassThrough_5F458) et libère un membre
; (Member_ClearAndFree_5EA03). Référencée dans le cluster environnant.
; ==============================================================================================
StreamReader_Destruct_6BE00		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		mov	al, [si+4Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+4A48h]
		push	large [si+4Dh]
		push	large [si+55h]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	4A65h
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765B4
		add	sp, 10h
		push	[bp+var_4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_765AF
		add	sp, 4
		push	si
		call	sub_7667F
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765E5
		pop	cx
		pop	si
		leave
		retf
StreamReader_Destruct_6BE00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_Helper_3B1D2 (sub_3B1D2 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à StreamReader_Helper_63962 (sub_63962 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; StreamReader_ValidateState_63DB5, sub_2A82 (externe) et
; Runtime_FatalErrorHandlerWithTag_UNRESOLVED (sub_5F4A9). Appelée par sub_639F1 et sub_63B23.
; ==============================================================================================
StreamReader_Helper_6BE63		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6BE93
		or	di, di
		jz	short loc_6BE8D
		push	di
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CRT_Strcpy
		jmp	short loc_6BE9C

loc_6BE8D:
		mov	byte ptr [si+0Ah], 0
		jmp	short loc_6BE9F

loc_6BE93:
		push	1912h
		push	si
		call	sub_76675

loc_6BE9C:
		add	sp, 4

loc_6BE9F:
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Helper_6BE63		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_Helper_3B212 (sub_3B212 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à StreamReader_Helper_639A2 (sub_639A2 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; StreamReader_ValidateState_63DB5 et Runtime_FatalErrorHandlerWithTag (sub_5F4A9). Appelée
; par sub_639F1.
; ==============================================================================================
StreamReader_Helper_6BEA3		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6BEBF
		mov	al, [bp+arg_2]
		mov	[si+4Ch], al
		jmp	short loc_6BECB

loc_6BEBF:
		push	1913h
		push	si
		call	sub_76675
		add	sp, 4

loc_6BECB:
		pop	si
		pop	bp
		retf
StreamReader_Helper_6BEA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_Helper_3B23D (sub_3B23D de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à StreamReader_Helper_639CD (sub_639CD de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Runtime_FatalErrorHandlerWithTag (sub_5F4A9). Appelée par sub_63A88 et sub_63D2D.
; ==============================================================================================
StreamReader_Helper_6BECE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_6BEE3
		mov	ax, [bp+arg_2]
		mov	[si+59h], ax
		jmp	short loc_6BEEF

loc_6BEE3:
		push	1990h
		push	si
		call	sub_76675
		add	sp, 4

loc_6BEEF:
		pop	si
		pop	bp
		retf
StreamReader_Helper_6BECE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_ValidateAndDispatch_3B261 (sub_3B261 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à StreamReader_ValidateAndDispatch_639F1 (sub_639F1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine StreamReader_Helper_63962 et StreamReader_Helper_639A2. Appelée par sub_63D0E.
; ==============================================================================================
StreamReader_ValidateAndDispatch_6BEF2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BE63
		add	sp, 4
		mov	al, [bp+arg_4]
		push	ax
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BEA3
		add	sp, 4
		pop	si
		pop	bp
		retf
StreamReader_ValidateAndDispatch_6BEF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_Helper_3B282 (sub_3B282 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à StreamReader_Helper_63A12 (sub_63A12 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelée par sub_63A39
; (constructeur, seg009), sub_63A88 (seg195), sub_63AD3 (sub_A713E) et sub_63B23 (sub_33346) —
; helper commun d'initialisation, largement utilisé par des sous-systèmes très divers.
; ==============================================================================================
StreamReader_Helper_6BF13		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+55h], eax
		mov	[si+51h], eax
		mov	[si+4Dh], eax
		mov	word ptr [si+5Bh], 0
		mov	word ptr [si+59h], 0
		mov	byte ptr [si+0Ah], 0
		pop	si
		pop	bp
		retf
StreamReader_Helper_6BF13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ConstructVariantA_3B2A9 (sub_3B2A9 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_ConstructVariantA_63A39 (sub_63A39 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) et initialise (StreamReader_Helper_63A12). Référencée directement depuis
; seg009 (cœur du jeu/boucle principale).
; ==============================================================================================
StreamReader_ConstructVariantA_6BF3A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6BF56
		push	5Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6BF84

loc_6BF56:
		mov	word ptr [si], 372h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg173
		mov	word ptr [si+2], 2
		mov	word ptr [si], 37Ah
		mov	eax, dword_7B17E
		mov	[bp+var_4], eax
		mov	[si+2], eax
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BF13
		pop	cx

loc_6BF84:
		mov	ax, si
		pop	si
		leave
		retf
StreamReader_ConstructVariantA_6BF3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ConstructVariantB_3B2F8 (sub_3B2F8 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_ConstructVariantB_63A88 (sub_63A88 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise (StreamReader_Helper_63A12, StreamReader_Helper_639CD).
; Référencée depuis seg195.
; ==============================================================================================
StreamReader_ConstructVariantB_6BF89		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6BFA2
		push	5Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6BFCF

loc_6BFA2:
		mov	word ptr [si], 372h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg173
		mov	word ptr [si+2], 2
		mov	word ptr [si], 37Ah
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BF13
		pop	cx
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BECE
		add	sp, 4

loc_6BFCF:
		mov	ax, si
		pop	si
		pop	bp
		retf
StreamReader_ConstructVariantB_6BF89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ConstructVariantC_3B343 (sub_3B343 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_ConstructVariantC_63AD3 (sub_63AD3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise (StreamReader_Helper_63A12, sub_63D0E). Référencée par
; sub_A713E.
; ==============================================================================================
StreamReader_ConstructVariantC_6BFD4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6BFED
		push	5Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6C01F

loc_6BFED:
		mov	word ptr [si], 372h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg173
		mov	word ptr [si+2], 2
		mov	word ptr [si], 37Ah
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BF13
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReadDispatch_6C244
		add	sp, 6

loc_6C01F:
		mov	ax, si
		pop	si
		pop	bp
		retf
StreamReader_ConstructVariantC_6BFD4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C024		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+0Ah]
		mov	[bp+var_1], al
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BF13
		pop	cx
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, [bp+arg_C]
		jnz	short loc_6C04E
		mov	al, [bp+var_1]
		mov	[si+0Ah], al

loc_6C04E:
		push	[bp+arg_C]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BE63
		add	sp, 4
		mov	[si+5Bh], di
		mov	al, [di+4Ch]
		mov	[si+4Ch], al
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		or	al, al
		jz	short loc_6C0B7
		mov	eax, [di+51h]
		add	[bp+arg_4], eax
		add	[bp+arg_8], eax
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	word ptr [di+59h]
		mov	bx, [di+59h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReadDispatchB_6C263
		add	sp, 0Ch
		cmp	[bp+arg_C], 0
		jz	short loc_6C0B0
		mov	al, [si+4Ch]
		push	ax
		push	si
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_6C0B0:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_6C0B7:
		pop	di
		pop	si
		leave
		retf
sub_6C024		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C0BB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Bh], 0
		jnz	short loc_6C0DA
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_6C0DA
		push	si
		nop
		push	cs
		call	near ptr sub_6C2A4
		pop	cx

loc_6C0DA:
		cmp	word ptr [si+59h], 0
		jz	short loc_6C10D
		cmp	word ptr [si+5Bh], 0
		jz	short loc_6C0F1
		mov	bx, [si+5Bh]
		mov	ax, [bx+59h]
		cmp	ax, [si+59h]
		jz	short loc_6C10D

loc_6C0F1:
		cmp	word ptr [si+59h], 0
		jz	short loc_6C108
		push	3
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_6C108

loc_6C108:
		mov	word ptr [si+59h], 0

loc_6C10D:
		pop	si
		pop	bp
		retf
sub_6C0BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_Close_3B445 (sub_3B445 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à StreamReader_Close_63BD5 (sub_63BD5 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, ferme et libère le flux
; (StreamReader_CloseUnderlying_63B97, Member_ClearAndFree_5EA03, sub_338). Référencée
; directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_Close_6C110		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6C142
		mov	word ptr [si], 37Ah
		push	si
		push	cs
		call	near ptr sub_6C0BB
		pop	cx
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_765E5
		pop	cx
		test	di, 1
		jz	short loc_6C142
		push	si
		call	sub_3B2
		pop	cx

loc_6C142:
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Close_6C110		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C146		proc far

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
		jz	short loc_6C166
		mov	word ptr [si], 4A1Eh
		mov	word ptr [si+2], 0
		jmp	short loc_6C168

loc_6C166:
		mov	ax, si

loc_6C168:
		pop	si
		pop	bp
		retf
sub_6C146		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DispatchRead_3B4A0 (sub_3B4A0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DispatchRead_63C30 (sub_63C30 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x10]
; avec gestion d'erreur (Runtime_FatalErrorHandlerWithTag, sub_5F4A9). Appelée par sub_63C61.
; ==============================================================================================
StreamReader_DispatchRead_6C16B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_6C18D
		push	si
		mov	bx, [si]
		call	dword ptr [bx+10h]
		pop	cx
		mov	[si+59h], ax
		cmp	word ptr [si+59h], 0
		jnz	short loc_6C199
		push	19E0h
		jmp	short loc_6C190

loc_6C18D:
		push	1990h

loc_6C190:
		push	si
		call	sub_76675
		add	sp, 4

loc_6C199:
		pop	si
		pop	bp
		retf
StreamReader_DispatchRead_6C16B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C19C		proc far

var_3		= byte ptr -3
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	byte ptr [si+4Ch], 1
		jnz	short loc_6C1C2
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	si
		call	sub_6BB88
		add	sp, 4
		mov	[bp+var_2], al

loc_6C1C2:
		cmp	[bp+var_2], 0
		jnz	short loc_6C23E
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		or	al, al
		jz	short loc_6C23E
		cmp	word ptr [si+59h], 0
		jnz	short loc_6C1DF
		push	si
		push	cs
		call	near ptr StreamReader_DispatchRead_6C16B
		pop	cx

loc_6C1DF:
		cmp	word ptr [si+59h], 0
		jz	short loc_6C232
		mov	al, [si+4Ch]
		push	ax
		push	si
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_6C22D
		xor	eax, eax
		mov	[si+51h], eax
		mov	[si+4Dh], eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+55h], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	[bp+var_2], 1
		jmp	short loc_6C23E

loc_6C22D:
		push	1910h
		jmp	short loc_6C235

loc_6C232:
		push	19E0h

loc_6C235:
		push	si
		call	sub_76675
		add	sp, 4

loc_6C23E:
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_6C19C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_ReadDispatch_3B57E (sub_3B57E de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_ReadDispatch_63D0E (sub_63D0E de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; StreamReader_ValidateAndDispatch_639F1 et StreamReader_ReadBlock_63C61. Appelée par
; sub_63AD3.
; ==============================================================================================
StreamReader_ReadDispatch_6C244		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_ValidateAndDispatch_6BEF2
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_6C19C
		pop	cx
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatch_6C244		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_ReadDispatchB_3B59D (sub_3B59D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_ReadDispatchB_63D2D (sub_63D2D de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; StreamReader_Helper_639CD et StreamReader_ReadBlock_63C61. Appelée par sub_63B23.
; ==============================================================================================
StreamReader_ReadDispatchB_6C263		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+4Dh], 0
		mov	eax, [bp+arg_4]
		mov	[si+51h], eax
		mov	eax, [bp+arg_8]
		sub	eax, [bp+arg_4]
		mov	[si+55h], eax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_6BECE
		add	sp, 4
		cmp	word ptr [si+5Bh], 0
		jz	short loc_6C29B
		mov	al, 1
		jmp	short loc_6C2A1

loc_6C29B:
		push	si
		push	cs
		call	near ptr sub_6C19C
		pop	cx

loc_6C2A1:
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatchB_6C263		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C2A4		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	word ptr [si+5Bh], 0
		jnz	short loc_6C2E5
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_6C2E1
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		or	al, al
		jnz	short loc_6C2E1
		push	1980h
		push	si
		call	sub_76675
		add	sp, 4
		jmp	short loc_6C2E5

loc_6C2E1:
		mov	[bp+var_2], 1

loc_6C2E5:
		cmp	word ptr [si+59h], 0
		jz	short loc_6C2FC
		push	3
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_6C2FC

loc_6C2FC:
		mov	word ptr [si+59h], 0
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_6C2A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_ValidateState_3B625 (sub_3B625 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_ValidateState_63DB5 (sub_63DB5 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, fonction de garde utilisée
; dans tout le cluster StreamReader (rôle exact non détaillé — vérification d'état avant
; opération). Référencée directement par sub_27355 (proche de TextRenderer).
; ==============================================================================================
StreamReader_ValidateState_6C307		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si+59h], 0
		jz	short loc_6C328
		mov	bx, [si+59h]
		cmp	word ptr [bx+2], 0
		jz	short loc_6C324
		mov	ax, 1
		jmp	short loc_6C326

loc_6C324:
		xor	ax, ax

loc_6C326:
		mov	dl, al

loc_6C328:
		mov	al, dl
		pop	si
		pop	bp
		retf
StreamReader_ValidateState_6C307		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_CheckBufferValid_3B64B (sub_3B64B de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_CheckBufferValid_63DDB (sub_63DDB de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelée par
; Handle_ReadAndOffsetField-style StreamReader_ReadTyped_63FA1 pour vérifier la validité du
; tampon après une lecture.
; ==============================================================================================
StreamReader_CheckBufferValid_6C32D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+4Dh]
		cmp	eax, [si+55h]
		jl	short loc_6C343
		mov	ax, 1
		jmp	short loc_6C345

loc_6C343:
		xor	ax, ax

loc_6C345:
		pop	si
		pop	bp
		retf
StreamReader_CheckBufferValid_6C32D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_SeekVariant_3B666 (sub_3B666 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à StreamReader_SeekVariant_63DF6
; (sub_63DF6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 90 lignes, NON DÉTAILLÉE — dispatch vtable [bx+0xC],
; StreamReader_ValidateState_63DB5, sub_6404E. Référencée par sub_641EB.
; ==============================================================================================
StreamReader_SeekVariant_6C348		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jl	short loc_6C363
		mov	eax, [si+55h]
		cmp	eax, [bp+arg_2]
		jge	short loc_6C368

loc_6C363:
		push	1941h
		jmp	short loc_6C3B3

loc_6C368:
		push	0
		mov	eax, [bp+arg_2]
		add	eax, [si+51h]
		push	eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6C39B
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_6C3BC

loc_6C39B:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C3B0
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6C3B0

loc_6C3B0:
		push	1914h

loc_6C3B3:
		push	si
		call	sub_76675
		add	sp, 4

loc_6C3BC:
		pop	si
		leave
		retf
StreamReader_SeekVariant_6C348		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C3BF		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+4Dh]
		add	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jl	short loc_6C428
		mov	eax, [si+55h]
		cmp	eax, [bp+var_4]
		jl	short loc_6C428
		push	1
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6C413
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_6C434

loc_6C413:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C428
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6C428

loc_6C428:
		push	1943h
		push	si
		call	sub_76675
		add	sp, 4

loc_6C434:
		pop	si
		leave
		retf
sub_6C3BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RefillBuffer_3B755 (sub_3B755 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à StreamReader_RefillBuffer_63EE5
; (sub_63EE5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, recharge le tampon depuis le flux sous-jacent (dispatch vtable [bx+0xC]),
; StreamReader_ValidateState_63DB5, sub_6404E. Appelée par StreamReader_ReadTyped_63FA1 en cas
; de dépassement de tampon.
; ==============================================================================================
StreamReader_RefillBuffer_6C437		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	eax, [si+51h]
		add	eax, [si+55h]
		push	eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6C474
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_6C495

loc_6C474:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C489
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6C489

loc_6C489:
		push	1940h
		push	si
		call	sub_76675
		add	sp, 4

loc_6C495:
		pop	si
		leave
		retf
StreamReader_RefillBuffer_6C437		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_PrepareForRead_3B7B6 (sub_3B7B6 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_PrepareForRead_63F46 (sub_63F46 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, prépare le flux avant lecture (dispatch
; vtable [bx+0xC], StreamReader_ValidateState_63DB5, sub_6404E). Référencée par
; Music_LoadTimbreFromLibrary_5A577 (seg124).
; ==============================================================================================
StreamReader_PrepareForRead_6C498		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large [si+51h]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6C4CF
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_6C4F0

loc_6C4CF:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C4E4
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6C4E4

loc_6C4E4:
		push	1940h
		push	si
		call	sub_76675
		add	sp, 4

loc_6C4F0:
		pop	si
		leave
		retf
StreamReader_PrepareForRead_6C498		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ReadTyped_3B811 (sub_3B811 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à StreamReader_ReadTyped_63FA1
; (sub_63FA1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⭐ far, lecture typée à travers le flux tamponné : gère la position courante (+0x4D)
; et le tampon (+0x51), dispatch vers l'objet flux sous-jacent (+0x59, méthode virtuelle «
; Read »), avec repli sur StreamReader_RefillBuffer_63EE5/CheckBufferValid_63DDB selon le
; résultat. Référencée massivement (Handle_ReadWordField_63511, Handle_ReadByteField_63534,
; seg188, et de nombreux autres segments) — fonction centrale du système de lecture typée par
; handle.
; ==============================================================================================
StreamReader_ReadTyped_6C4F3		proc far

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
		mov	eax, [bp+arg_A]
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_6C514
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_6C514:
		push	large [bp+arg_6]
		mov	eax, [bp+var_8]
		add	eax, [si+51h]
		push	eax
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6C561
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		push	si
		push	cs
		call	near ptr StreamReader_CheckBufferValid_6C32D
		pop	cx
		or	al, al
		jz	short loc_6C582
		push	si
		push	cs
		call	near ptr StreamReader_RefillBuffer_6C437
		pop	cx
		jmp	short loc_6C582

loc_6C561:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_6C307
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C576
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6C5A0
		pop	cx
		jmp	short loc_6C576

loc_6C576:
		push	1920h
		push	si
		call	sub_76675
		add	sp, 4

loc_6C582:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_ReadTyped_6C4F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C58E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_6C58E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C598		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_6C598		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_ReportError_3B8BE (sub_3B8BE de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_ReportError_6404E (sub_6404E de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe
; Runtime_FatalErrorHandlerWithTag (sub_5F4A9, tag 1911h) — signale une erreur du flux
; tamponné.
; ==============================================================================================
StreamReader_ReportError_6C5A0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	1911h
		push	ax
		call	sub_76675
		add	sp, 4
		pop	bp
		retf
StreamReader_ReportError_6C5A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_GetCapacity_3B8D2 (sub_3B8D2 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_GetCapacity_64062 (sub_64062 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, retourne la capacité du tampon
; (+0x55, 32 bits). Référencée directement par sub_27355 et sub_27F9E (proches de
; TextRenderer).
; ==============================================================================================
StreamReader_GetCapacity_6C5B4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+55h]
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
StreamReader_GetCapacity_6C5B4		endp

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
StreamReader_GetCapacity_6C5C7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
StreamReader_GetCapacity_6C5C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C5DA		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_7B17E, eax
		pop	bp
		retf
sub_6C5DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C5E7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
sub_6C5E7		endp

; START OF FUNCTION CHUNK FOR sub_6C5E7
		db 0E8h
; END OF FUNCTION CHUNK FOR sub_6C5E7
seg202		ends
