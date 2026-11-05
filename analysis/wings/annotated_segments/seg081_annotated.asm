seg081		segment	para public 'CODE' use16
		assume cs:seg081
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 1Ch, 0FFh, 5Fh, 18h, 0EBh, 0EDh

loc_38067:
		db 8Bh, 0C7h, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3806D		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_3806D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38074		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_5900F
		add	sp, 6
		push	0
		push	large 4E474C41h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_380AD
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Bh], al
		jmp	short loc_380B5

loc_380AD:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+2Bh], 0

loc_380B5:
		pop	si
		pop	bp
		retf
sub_38074		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_380B8		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	large [bp+arg_0]
		push	0
		nop
		push	cs
		call	near ptr WorldObject_BaseConstructAttached
		add	sp, 6
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_5901E
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_380B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_BaseConstruct (sub_3C9BC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,47L —
; constructeur en cascade (types 0x10E4→0x1ADC→0x258C) : reset physique de débris (sub_37C4C),
; initialise un sous-objet UI (sub_56D43/sub_56D72), positionne un flag (+4 bit4) :
; constructeur d'objet composite complet (corps physique + rendu + UI), classe de base d'un
; objet du monde de jeu (avion/débris/armement).
; ==============================================================================================
WorldObject_BaseConstruct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_380F7
		push	52h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3813F

loc_380F7:
		mov	word ptr [si], 2772h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 26E2h
		push	si
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 27C8h
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_3B551
		pop	cx
		mov	byte ptr [si+51h], 0
		or	byte ptr [si+4], 10h

loc_3813F:
		mov	ax, si
		pop	si
		pop	bp
		retf
WorldObject_BaseConstruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_BaseConstructAttached (sub_3CA22 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,72L
; — variante de sub_3C9BC avec attachement à un parent (sub_37C89, cf. seg078) : constructeur
; d'objet composite attaché comme sous-composant d'un parent (ex: pièce détachable).
; ==============================================================================================
WorldObject_BaseConstructAttached		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_38160
		push	52h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_381C7

loc_38160:
		mov	word ptr [si], 2772h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 26E2h
		push	si
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 27C8h
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	sub_3747D
		add	sp, 6
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_3B551
		pop	cx
		mov	byte ptr [si+51h], 0
		or	byte ptr [si+4], 10h
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+2Bh]
		mov	[si+51h], al

loc_381C7:
		mov	ax, si
		pop	si
		leave
		retf
WorldObject_BaseConstructAttached		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_BaseDestruct (sub_3CAAA de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,38L —
; destructeur (type 0x258C) via sub_6BFBA, libère si demandé : destructeur de l'objet
; composite de base.
; ==============================================================================================
WorldObject_BaseDestruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_381F7
		mov	word ptr [si], 27C8h
		push	0
		push	si
		call	sub_58FCA
		add	sp, 4
		test	di, 1
		jz	short loc_381F7
		push	si
		call	sub_33B
		pop	cx

loc_381F7:
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_BaseDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_381FB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_381FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_2CA33 (sub_2CA33 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à StreamReader_DestructWrapper_659C1
; (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_38205		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	Debris_BodyDetach
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_38205		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38214		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFullOrientation_3BD91
		add	sp, 8
		push	si
		call	Debris_BodyDetach
		pop	cx
		pop	si
		pop	bp
		retf
sub_38214		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3823C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	WorldObject_BuildOrientationMatrix_3B669
		add	sp, 4
		push	si
		call	Debris_BodyDetach
		pop	cx
		pop	si
		pop	bp
		retf
sub_3823C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3825E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 2Dh
		pop	bp
		retf
sub_3825E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3826B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_38284
		push	si
		mov	bx, [si]
		call	dword ptr [bx+78h]
		pop	cx
		mov	ax, [si+26h]
		jmp	short loc_38289

loc_38284:
		mov	ax, si
		add	ax, 2Dh

loc_38289:
		pop	si
		pop	bp
		retf
sub_3826B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3828C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	[bp+arg_2]
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_3828C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_PositionWidget_36DB4 (sub_36DB4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_PositionWidget (sub_38068 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,21L — récupère la position
; (vtable[0x3C]) et notifie sub_56E29 : positionnement d'un widget/marqueur sur un objet
; physique.
; ==============================================================================================
Debris_PositionWidget_382A9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	[bp+arg_2]
		call	sub_3D00B
		add	sp, 4
		pop	si
		pop	bp
		retf
Debris_PositionWidget_382A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_382C6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	AI_ComputeGeometryHelper_3B608
		add	sp, 4
		push	si
		call	Debris_BodyDetach
		pop	cx
		pop	si
		pop	bp
		retf
sub_382C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_2CA33 (sub_2CA33 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à StreamReader_DestructWrapper_659C1
; (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_382E8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	WorldObject_TestAliveAndUpdateChildren_377FE
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_382E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_382F7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_38347
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_38347
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	word ptr [si+26h]
		call	AI_ComputeGeometryHelper_3B608
		add	sp, 4
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		push	word ptr [si+26h]
		call	WorldObject_ApplyOrientationVariantA_3BF79
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_38347:
		pop	si
		pop	bp
		retf
sub_382F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3834A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3834A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38352		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		push	ax
		push	ax
		call	WorldObject_ApplyOrientationVariantA_3BF49
		add	sp, 4
		pop	bp
		retf
sub_38352		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38367		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
sub_38367		endp
seg081		ends
