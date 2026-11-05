ovr200		segment	para public 'OVERLAY' use16
		assume cs:ovr200
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_FindAndUnregister_9B700 (sub_9B700 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine une opération de conteneur, WeakRef_UnregisterByValue, Debris_FindAndRemoveByID,
; Handle_Destructor — recherche et désenregistrement complet d'un débris.
; ==============================================================================================
Debris_FindAndUnregister_71BD0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_71C59
		mov	word ptr [si], 26E2h
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_71BFE
		push	3
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+28h]
		add	sp, 6
		jmp	short loc_71BFE

loc_71BFE:
		mov	dword ptr [si+0Ah], 0
		push	3
		push	word ptr [si+1Eh]
		call	Container_Op_37121
		add	sp, 4
		mov	word ptr [si+1Eh], 0
		push	word ptr [si+26h]
		call	sub_33B
		pop	cx
		mov	word ptr [si+26h], 0
		push	si
		push	6495h
		call	WeakRef_UnregisterByValue
		add	sp, 4
		push	large [si+0Eh]
		push	6482h
		call	Debris_FindAndRemoveByID
		add	sp, 6
		push	0
		push	si
		call	sub_3D101
		add	sp, 4
		test	di, 1
		jz	short loc_71C59
		push	si
		call	sub_33B
		pop	cx

loc_71C59:
		pop	di
		pop	si
		pop	bp
		retf
Debris_FindAndUnregister_71BD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ContainerOpWrapperB_AA6B7 (sub_AA6B7 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ContainerOpWrapperB_9B78D (sub_9B78D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle une opération de conteneur (WorldObjects_RemoveAndDelete_223C5).
; ==============================================================================================
Debris_ContainerOpWrapperB_71C5D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_5C58D, 0
		push	[bp+arg_2]
		push	si
		push	large [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_71C8D
		push	si
		push	649Bh
		call	WorldObjects_RemoveAndDelete_3683C
		add	sp, 4

loc_71C8D:
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapperB_71C5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71C90		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_71C90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71C98		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_71C98		endp
ovr200		ends
