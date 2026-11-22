seg161		segment	para public 'CODE' use16
		assume cs:seg161
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E8h, 31h, 0FDh, 59h

loc_40D94:
		db 8Ah, 46h, 0FEh, 5Eh, 0C9h, 0CBh

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
StreamReader_Destruct_40D9A		proc far

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
		push	word ptr [bx+5298h]
		push	large [si+4Dh]
		push	large [si+55h]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	52B5h
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F73C
		add	sp, 10h
		push	[bp+var_4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		push	si
		call	sub_30070
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		pop	si
		leave
		retf
StreamReader_Destruct_40D9A		endp

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
StreamReader_Helper_40DFD		proc far

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
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40E2D
		or	di, di
		jz	short loc_40E27
		push	di
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CRT_Strcpy
		jmp	short loc_40E36

loc_40E27:
		mov	byte ptr [si+0Ah], 0
		jmp	short loc_40E39

loc_40E2D:
		push	1912h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1

loc_40E36:
		add	sp, 4

loc_40E39:
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Helper_40DFD		endp

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
StreamReader_Helper_40E3D		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40E59
		mov	al, [bp+arg_2]
		mov	[si+4Ch], al
		jmp	short loc_40E65

loc_40E59:
		push	1913h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_40E65:
		pop	si
		pop	bp
		retf
StreamReader_Helper_40E3D		endp

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
StreamReader_Helper_40E68		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_40E7D
		mov	ax, [bp+arg_2]
		mov	[si+59h], ax
		jmp	short loc_40E89

loc_40E7D:
		push	1990h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_40E89:
		pop	si
		pop	bp
		retf
StreamReader_Helper_40E68		endp

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
StreamReader_ValidateAndDispatch_40E8C		proc far

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
		call	near ptr StreamReader_Helper_40DFD
		add	sp, 4
		mov	al, [bp+arg_4]
		push	ax
		push	si
		push	cs
		call	near ptr StreamReader_Helper_40E3D
		add	sp, 4
		pop	si
		pop	bp
		retf
StreamReader_ValidateAndDispatch_40E8C		endp

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
StreamReader_Helper_40EAD		proc far

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
StreamReader_Helper_40EAD		endp

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
StreamReader_ConstructVariantA_40ED4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_40EF0
		push	5Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_40F1E

loc_40EF0:
		mov	word ptr [si], 4511h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg123
		mov	word ptr [si+2], 7
		mov	word ptr [si], 52E9h
		mov	eax, dword_4DC7E
		mov	[bp+var_4], eax
		mov	[si+2], eax
		push	si
		push	cs
		call	near ptr StreamReader_Helper_40EAD
		pop	cx

loc_40F1E:
		mov	ax, si
		pop	si
		leave
		retf
StreamReader_ConstructVariantA_40ED4		endp

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
StreamReader_ConstructVariantB_40F23		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_40F3C
		push	5Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_40F69

loc_40F3C:
		mov	word ptr [si], 4511h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg123
		mov	word ptr [si+2], 7
		mov	word ptr [si], 52E9h
		push	si
		push	cs
		call	near ptr StreamReader_Helper_40EAD
		pop	cx
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_40E68
		add	sp, 4

loc_40F69:
		mov	ax, si
		pop	si
		pop	bp
		retf
StreamReader_ConstructVariantB_40F23		endp

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
StreamReader_ConstructVariantC_40F6E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_40F87
		push	5Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_40FB9

loc_40F87:
		mov	word ptr [si], 4511h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg123
		mov	word ptr [si+2], 7
		mov	word ptr [si], 52E9h
		push	si
		push	cs
		call	near ptr StreamReader_Helper_40EAD
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReadDispatch_411DE
		add	sp, 6

loc_40FB9:
		mov	ax, si
		pop	si
		pop	bp
		retf
StreamReader_ConstructVariantC_40F6E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40FBE		proc far

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
		call	near ptr StreamReader_Helper_40EAD
		pop	cx
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, [bp+arg_C]
		jnz	short loc_40FE8
		mov	al, [bp+var_1]
		mov	[si+0Ah], al

loc_40FE8:
		push	[bp+arg_C]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_40DFD
		add	sp, 4
		mov	[si+5Bh], di
		mov	al, [di+4Ch]
		mov	[si+4Ch], al
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		or	al, al
		jz	short loc_41051
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
		call	near ptr StreamReader_ReadDispatchB_411FD
		add	sp, 0Ch
		cmp	[bp+arg_C], 0
		jz	short loc_4104A
		mov	al, [si+4Ch]
		push	ax
		push	si
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_4104A:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_41051:
		pop	di
		pop	si
		leave
		retf
sub_40FBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41055		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Bh], 0
		jnz	short loc_41074
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_41074
		push	si
		nop
		push	cs
		call	near ptr sub_4123E
		pop	cx

loc_41074:
		cmp	word ptr [si+59h], 0
		jz	short loc_410A7
		cmp	word ptr [si+5Bh], 0
		jz	short loc_4108B
		mov	bx, [si+5Bh]
		mov	ax, [bx+59h]
		cmp	ax, [si+59h]
		jz	short loc_410A7

loc_4108B:
		cmp	word ptr [si+59h], 0
		jz	short loc_410A2
		push	3
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_410A2

loc_410A2:
		mov	word ptr [si+59h], 0

loc_410A7:
		pop	si
		pop	bp
		retf
sub_41055		endp

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
StreamReader_Close_410AA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_410DC
		mov	word ptr [si], 52E9h
		push	si
		push	cs
		call	near ptr sub_41055
		pop	cx
		mov	ax, si
		add	ax, 6
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		test	di, 1
		jz	short loc_410DC
		push	si
		call	sub_39C
		pop	cx

loc_410DC:
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Close_410AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_410E0		proc far

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
		jz	short loc_41100
		mov	word ptr [si], 526Eh
		mov	word ptr [si+2], 0
		jmp	short loc_41102

loc_41100:
		mov	ax, si

loc_41102:
		pop	si
		pop	bp
		retf
sub_410E0		endp

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
StreamReader_DispatchRead_41105		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_41127
		push	si
		mov	bx, [si]
		call	dword ptr [bx+10h]
		pop	cx
		mov	[si+59h], ax
		cmp	word ptr [si+59h], 0
		jnz	short loc_41133
		push	19E0h
		jmp	short loc_4112A

loc_41127:
		push	1990h

loc_4112A:
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_41133:
		pop	si
		pop	bp
		retf
StreamReader_DispatchRead_41105		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41136		proc far

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
		jnz	short loc_4115C
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	si
		call	sub_40B22
		add	sp, 4
		mov	[bp+var_2], al

loc_4115C:
		cmp	[bp+var_2], 0
		jnz	short loc_411D8
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		or	al, al
		jz	short loc_411D8
		cmp	word ptr [si+59h], 0
		jnz	short loc_41179
		push	si
		push	cs
		call	near ptr StreamReader_DispatchRead_41105
		pop	cx

loc_41179:
		cmp	word ptr [si+59h], 0
		jz	short loc_411CC
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
		jz	short loc_411C7
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
		jmp	short loc_411D8

loc_411C7:
		push	1910h
		jmp	short loc_411CF

loc_411CC:
		push	19E0h

loc_411CF:
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_411D8:
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_41136		endp

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
StreamReader_ReadDispatch_411DE		proc far

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
		call	near ptr StreamReader_ValidateAndDispatch_40E8C
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_41136
		pop	cx
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatch_411DE		endp

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
StreamReader_ReadDispatchB_411FD		proc far

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
		call	near ptr StreamReader_Helper_40E68
		add	sp, 4
		cmp	word ptr [si+5Bh], 0
		jz	short loc_41235
		mov	al, 1
		jmp	short loc_4123B

loc_41235:
		push	si
		push	cs
		call	near ptr sub_41136
		pop	cx

loc_4123B:
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatchB_411FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4123E		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	word ptr [si+5Bh], 0
		jnz	short loc_4127F
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_4127B
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		or	al, al
		jnz	short loc_4127B
		push	1980h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4
		jmp	short loc_4127F

loc_4127B:
		mov	[bp+var_2], 1

loc_4127F:
		cmp	word ptr [si+59h], 0
		jz	short loc_41296
		push	3
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_41296

loc_41296:
		mov	word ptr [si+59h], 0
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_4123E		endp

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
StreamReader_ValidateState_412A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si+59h], 0
		jz	short loc_412C2
		mov	bx, [si+59h]
		cmp	word ptr [bx+2], 0
		jz	short loc_412BE
		mov	ax, 1
		jmp	short loc_412C0

loc_412BE:
		xor	ax, ax

loc_412C0:
		mov	dl, al

loc_412C2:
		mov	al, dl
		pop	si
		pop	bp
		retf
StreamReader_ValidateState_412A1		endp

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
StreamReader_CheckBufferValid_412C7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+4Dh]
		cmp	eax, [si+55h]
		jl	short loc_412DD
		mov	ax, 1
		jmp	short loc_412DF

loc_412DD:
		xor	ax, ax

loc_412DF:
		pop	si
		pop	bp
		retf
StreamReader_CheckBufferValid_412C7		endp

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
StreamReader_SeekVariant_412E2		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jl	short loc_412FD
		mov	eax, [si+55h]
		cmp	eax, [bp+arg_2]
		jge	short loc_41302

loc_412FD:
		push	1941h
		jmp	short loc_4134D

loc_41302:
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
		jz	short loc_41335
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_41356

loc_41335:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4134A
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_4153A
		pop	cx
		jmp	short loc_4134A

loc_4134A:
		push	1914h

loc_4134D:
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_41356:
		pop	si
		leave
		retf
StreamReader_SeekVariant_412E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41359		proc far

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
		jl	short loc_413C2
		mov	eax, [si+55h]
		cmp	eax, [bp+var_4]
		jl	short loc_413C2
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
		jz	short loc_413AD
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_413CE

loc_413AD:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_413C2
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_4153A
		pop	cx
		jmp	short loc_413C2

loc_413C2:
		push	1943h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_413CE:
		pop	si
		leave
		retf
sub_41359		endp

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
StreamReader_RefillBuffer_413D1		proc far

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
		jz	short loc_4140E
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_4142F

loc_4140E:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_41423
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_4153A
		pop	cx
		jmp	short loc_41423

loc_41423:
		push	1940h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_4142F:
		pop	si
		leave
		retf
StreamReader_RefillBuffer_413D1		endp

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
StreamReader_PrepareForRead_41432		proc far

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
		jz	short loc_41469
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_4148A

loc_41469:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4147E
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_4153A
		pop	cx
		jmp	short loc_4147E

loc_4147E:
		push	1940h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_4148A:
		pop	si
		leave
		retf
StreamReader_PrepareForRead_41432		endp

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
StreamReader_ReadTyped_4148D		proc far

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
		jnz	short loc_414AE
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_414AE:
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
		jz	short loc_414FB
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		push	si
		push	cs
		call	near ptr StreamReader_CheckBufferValid_412C7
		pop	cx
		or	al, al
		jz	short loc_4151C
		push	si
		push	cs
		call	near ptr StreamReader_RefillBuffer_413D1
		pop	cx
		jmp	short loc_4151C

loc_414FB:
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_412A1
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_41510
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_4153A
		pop	cx
		jmp	short loc_41510

loc_41510:
		push	1920h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_4151C:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_ReadTyped_4148D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41528		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_41528		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41532		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_41532		endp

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
StreamReader_ReportError_4153A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	1911h
		push	ax
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4
		pop	bp
		retf
StreamReader_ReportError_4153A		endp

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
StreamReader_GetCapacity_4154E		proc far

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
StreamReader_GetCapacity_4154E		endp

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
StreamReader_GetCapacity_41561		proc far

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
StreamReader_GetCapacity_41561		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41574		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_4DC7E, eax
		pop	bp
sub_41574		endp
seg161		ends
