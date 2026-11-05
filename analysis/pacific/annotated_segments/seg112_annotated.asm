seg112		segment	para public 'CODE' use16
		assume cs:seg112
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46192		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46192		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4619A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+1Ah]
		sar	eax, 8
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
sub_4619A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_461B1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_461C3
		mov	ax, si
		jmp	short loc_461CD

loc_461C3:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_461CD:
		or	ax, ax
		jz	short loc_461EC
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_461EE

loc_461EC:
		mov	ax, si

loc_461EE:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_461B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_461F7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_461F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_461FF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_46211
		mov	ax, si
		jmp	short loc_4621B

loc_46211:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4621B:
		or	ax, ax
		jz	short loc_4623A
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_4623C

loc_4623A:
		mov	ax, si

loc_4623C:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_461FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46245		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46245		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4624D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4625F
		mov	ax, si
		jmp	short loc_46269

loc_4625F:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_46269:
		or	ax, ax
		jz	short loc_46288
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_4628A

loc_46288:
		mov	ax, si

loc_4628A:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_4624D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46293		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46293		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4629B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 35BCh
		pop	bp
		retf
sub_4629B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Physics_IntegratePosition_46300 (sub_46300 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; seg101 L204-260. Intégrateur d'Euler. arg_0 = sous-objet A, arg_2 = vecteur accélération
; [A+0x14] EN REPÈRE CORPS. Lit accel, x dt (dword_70458), puis call [[[A+2]]+0x70](&vec) =
; transform CORPS->MONDE de l'accel mise à l'échelle, PUIS A.vitesse [A+8/0C/10] += vec. C'est
; ici que la boucle linéaire repasse du repère corps au repère monde. (Mal nommé : n'intègre
; pas la position mais la vitesse.)
; ==============================================================================================
Physics_IntegratePosition_462A6		proc far

var_C		= dword ptr -0Ch
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
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+74h]
		add	sp, 4
		mov	eax, [bp+var_C]
		add	[si+2], eax
		mov	eax, [bp+var_8]
		add	[si+6], eax
		mov	eax, [bp+var_4]
		add	[si+0Ah], eax
		pop	di
		pop	si
		leave
		retf
Physics_IntegratePosition_462A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46338		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+10h]
		pop	cx
		mov	cx, ax
		movsx	ebx, cx
		mov	si, [bp+var_2]
		mov	eax, [si]
		cdq
		idiv	ebx
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	eax, [si+4]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	eax, [si+8]
		cdq
		idiv	ebx
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		push	cs
		call	near ptr Physics_IntegratePosition_462A6
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_46338		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Apparié 2026-11-05 à Physics_ResolveWindVectorCached_4643B de STRIKE.EXE (vitesse en
; repère corps, cache par image) ; rend l'adresse du vecteur. Non relu ligne à ligne.
; ==============================================================================================
Physics_ResolveWindVectorCached_463B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 2
		mov	eax, [di]
		mov	dword_793EF, eax
		mov	eax, [di+4]
		mov	dword_793F3, eax
		mov	eax, [di+8]
		mov	dword_793F7, eax
		push	2CBFh
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+70h]
		add	sp, 4
		mov	byte_793EE, 1
		mov	ax, 2CBFh
		pop	di
		pop	si
		pop	bp
		retf
Physics_ResolveWindVectorCached_463B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Physics_ApplyForceAtPoint (sub_464BE de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-02.
; (sortie, corps, &echelle) : position monde de l'objet du corps (corps+2 -> +0x12) + vitesse
; du corps (+8/+0x0C/+0x10) x echelle. Position predite absolue (ex. a 4 s).
; ==============================================================================================
Physics_ApplyForceAtPoint		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		add	di, 2
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		mov	[bp+var_4], eax
		mov	di, [bp+arg_6]
		mov	eax, [bp+var_C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	si, [si+1Eh]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [si+4]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		add	[bp+var_18], eax
		mov	eax, [bp+var_8]
		add	[bp+var_14], eax
		mov	eax, [bp+var_4]
		add	[bp+var_10], eax
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_46497
		mov	ax, si
		jmp	short loc_464A1

loc_46497:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_464A1:
		or	ax, ax
		jz	short loc_464C0
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4], eax
		mov	eax, [bp+var_10]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_464C2

loc_464C0:
		mov	ax, si

loc_464C2:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Physics_ApplyForceAtPoint		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Physics_ApplyForceAtPointAlt (sub_46596 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; far,121L — variante de sub_464BE sur l'offset +0x14 (second vecteur de force) : application
; pondérée d'un second vecteur de force.
; ==============================================================================================
Physics_ApplyForceAtPointAlt		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		add	di, 0Eh
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		mov	[bp+var_4], eax
		mov	di, [bp+arg_6]
		mov	eax, [bp+var_C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+74h]
		add	sp, 4
		add	si, 2
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [si+4]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		add	[bp+var_18], eax
		mov	eax, [bp+var_8]
		add	[bp+var_14], eax
		mov	eax, [bp+var_4]
		add	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_465BD
		mov	ax, si
		jmp	short loc_465C7

loc_465BD:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_465C7:
		or	ax, ax
		jz	short loc_465E6
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4], eax
		mov	eax, [bp+var_10]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_465E8

loc_465E6:
		mov	ax, si

loc_465E8:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Physics_ApplyForceAtPointAlt		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Physics_AllocGroundConstraintVector (sub_466BC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; far,210L — alloue/reset un vecteur (4 octets si nul) si la composante verticale (+0x10) est
; négative : allocation conditionnelle d'un vecteur de correction (probable contrainte
; d'altitude/sol).
; ==============================================================================================
Physics_AllocGroundConstraintVector		proc far

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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	dword ptr [si+0Ah], 0
		jl	short loc_4662D
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4660F
		mov	ax, si
		jmp	short loc_46619

loc_4660F:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_46619:
		or	ax, ax
		jz	short loc_46628
		mov	dword ptr [si], 0
		mov	ax, si
		jmp	short loc_4662A

loc_46628:
		mov	ax, si

loc_4662A:
		jmp	loc_467B5

loc_4662D:
		mov	ax, si
		add	ax, 2
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax
		mov	bx, [si+1Eh]
		mov	eax, [bx+1Ah]
		mov	[bp+var_8], eax
		mov	di, [bp+arg_6]
		mov	eax, [di]
		sub	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jg	short loc_46672
		mov	[bp+var_C], 7D000h
		jmp	loc_467AB

loc_46672:
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	eax, [bp+var_4]
		sar	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_Tan_566DA
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jg	short loc_466C9
		mov	[bp+var_C], 0
		jmp	loc_467AB

loc_466C9:
		mov	ax, si
		add	ax, 2
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	[bp+var_24], 9CCh
		cmp	[bp+var_8], 100h
		jge	short loc_46742
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_24]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		jmp	short loc_4677A

loc_46742:
		mov	eax, [bp+var_20]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_24]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_4677A:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_28]
		add	[bp+var_C], eax

loc_467AB:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_C]
		mov	[bx], eax

loc_467B5:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Physics_AllocGroundConstraintVector		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Physics_ApplyGroundHeightConstraint (sub_46889 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,57L
; — interroge l'altitude du terrain (Terrain_QueryAltitudeAt, seg077) à la position d'un
; objet, applique une contrainte via sub_466BC : contrainte de hauteur sol pour la physique de
; vol (terrain-following / évitement de collision avec le sol) — connecte le moteur physique
; JDYN au système de terrain.
; ==============================================================================================
Physics_ApplyGroundHeightConstraint		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_4]
		push	0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_20], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	[bp+var_18], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		mov	ax, [si+1Eh]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Physics_AllocGroundConstraintVector
		add	sp, 8
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
Physics_ApplyGroundHeightConstraint		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46838		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46838		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46840		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46840		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46848		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46848		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46850		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46850		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46858		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_46858		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46862		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46862		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4686A		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	dword_793EF, eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_793F3, eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	dword_793F7, eax
sub_4686A		endp
seg112		ends
