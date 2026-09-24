seg101		segment	byte public 'CODE' use16
		assume cs:seg101
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_461ED:				; DATA XREF: seg339:off_6EE0Ao
					; seg339:off_6EE76o ...
		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+0Ah]
		mov	si, dx
		add	si, 4
		mov	eax, [si]
		mov	bx, [bp+6]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4620B:				; DATA XREF: seg339:off_6EE16o
					; seg339:1DD2o	...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+0Ah]
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4621D
		mov	ax, si
		jmp	short loc_46227
; ���������������������������������������������������������������������������

loc_4621D:				; CODE XREF: seg101:0037j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_46227:				; CODE XREF: seg101:003Bj
		or	ax, ax
		jz	short loc_46246
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_46248
; ���������������������������������������������������������������������������

loc_46246:				; CODE XREF: seg101:0049j
		mov	ax, si

loc_46248:				; CODE XREF: seg101:0064j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46251:				; DATA XREF: seg339:1D6Ao seg339:1DD6o ...
		push	bp

loc_46252:
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46259:				; DATA XREF: seg339:1DDAo seg339:1E2Ao ...
		push	bp
		mov	bp, sp
		push	si

loc_4625D:
		mov	ax, [bp+0Ah]

loc_46260:
		mov	si, [bp+6]

loc_46263:
		or	si, si
		jz	short loc_4626B
		mov	ax, si
		jmp	short loc_46275
; ���������������������������������������������������������������������������

loc_4626B:				; CODE XREF: seg101:0085j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_46275:				; CODE XREF: seg101:0089j
		or	ax, ax
		jz	short loc_46294
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_46296
; ���������������������������������������������������������������������������

loc_46294:				; CODE XREF: seg101:0097j
		mov	ax, si

loc_46296:				; CODE XREF: seg101:00B2j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4629F:				; DATA XREF: seg339:1DDEo
					; seg339:off_6EEDEo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_462A7:				; DATA XREF: seg339:off_6EE92o
					; seg339:1E32o	...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+0Ah]
		mov	si, [bp+6]
		or	si, si
		jz	short loc_462B9
		mov	ax, si
		jmp	short loc_462C3
; ���������������������������������������������������������������������������

loc_462B9:				; CODE XREF: seg101:00D3j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_462C3:				; CODE XREF: seg101:00D7j
		or	ax, ax
		jz	short loc_462E2
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_462E4
; ���������������������������������������������������������������������������

loc_462E2:				; CODE XREF: seg101:00E5j
		mov	ax, si

loc_462E4:				; CODE XREF: seg101:0100j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_462ED:				; DATA XREF: seg339:off_6EE96o
					; seg339:1E36o	...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_462F5:				; DATA XREF: seg339:off_6EE9Ao
					; seg339:1E3Ao	...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 3748h
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg101 L204-260. Intégrateur d'Euler. arg_0 = sous-objet A, arg_2 = vecteur
; accélération [A+0x14] EN REPÈRE CORPS. Lit accel, x dt (dword_70458), puis call
; [[[A+2]]+0x70](&vec) = transform CORPS->MONDE de l'accel mise à l'échelle, PUIS A.vitesse
; [A+8/0C/10] += vec. C'est ici que la boucle linéaire repasse du repère corps au repère
; monde. (Mal nommé : n'intègre pas la position mais la vitesse.)
; ==============================================================================================
Physics_IntegratePosition_46300	proc far		; CODE XREF: Physics_ComputeAcceleration+9Fp
					; seg103:2882P	...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8

loc_46360:
		mov	[bp+var_4], eax
		lea	ax, [bp+var_C]
		push	ax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+70h]
		add	sp, 4
		mov	eax, [bp+var_C]
		add	[si+8],	eax
		mov	eax, [bp+var_8]
		add	[si+0Ch], eax
		mov	eax, [bp+var_4]
		add	[si+10h], eax
		pop	di
		pop	si
		leave
		retf
Physics_IntegratePosition_46300	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,74L — divise un vecteur (arg_2) par une masse résolue (vtable[0x10]) pour obtenir une
; accélération : calcul d'accélération à partir d'une force et de la masse (F=ma inversé).
; ==============================================================================================
Physics_ComputeAcceleration	proc far		; CODE XREF: FlightControl_ComputeAngularAccel+72P
					; seg102:0990P	...

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+10h]
		add	sp, 6
		mov	eax, [di]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [di+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		lea	ax, [bp+var_28]
		push	ax
		push	si
		push	cs
		call	near ptr Physics_IntegratePosition_46300
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Physics_ComputeAcceleration	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg101 L356-425. Cache frame (byte_6FF9A ; dword_6FF9B/9F/A3). Lit A.vitesse
; [A+0x08/0C/10] (repère MONDE) puis appelle [[[A+2]]+0x6C](magic 0x2EEB) qui la transforme EN
; REPÈRE CORPS (monde->corps, orientation inverse). Renvoie donc la VITESSE EN REPÈRE CORPS
; (c0=envergure, c1=nez, c2=normale) = base du calcul des angles d'écoulement alpha/beta et
; des directions portance/traînée. Copie dans un buffer 0xC.
; ==============================================================================================
Physics_ResolveWindVectorCached_4643B	proc far		; CODE XREF: Aero_FlowAngle_AoA_469FE+1DP
					; Aero_FlowAngle_Sideslip_46AB5+1DP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	al, byte_6FF9A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4647E
		mov	di, si
		add	di, 8
		mov	eax, [di]
		mov	dword_6FF9B, eax
		mov	eax, [di+4]
		mov	dword_6FF9F, eax
		mov	eax, [di+8]
		mov	dword_6FFA3, eax
		push	2EEBh
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+6Ch]
		add	sp, 4
		mov	byte_6FF9A, 1

loc_4647E:				; CODE XREF: Physics_ResolveWindVectorCached_4643B+Fj
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_46489
		mov	ax, si
		jmp	short loc_46493
; ���������������������������������������������������������������������������

loc_46489:				; CODE XREF: Physics_ResolveWindVectorCached_4643B+48j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_46493:				; CODE XREF: Physics_ResolveWindVectorCached_4643B+4Cj
		or	ax, ax
		jz	short loc_464B2
		mov	eax, dword_6FF9B
		mov	[si], eax
		mov	eax, dword_6FF9F
		mov	[si+4],	eax
		mov	eax, dword_6FFA3
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_464B4
; ���������������������������������������������������������������������������

loc_464B2:				; CODE XREF: Physics_ResolveWindVectorCached_4643B+5Aj
		mov	ax, si

loc_464B4:				; CODE XREF: Physics_ResolveWindVectorCached_4643B+75j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
Physics_ResolveWindVectorCached_4643B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,117L — met à l'échelle un vecteur de force (+8/0xC/0x10) par un scalaire (arg_6),
; l'ajoute à une position de référence (+0x2, +0x12) : application pondérée d'une force à un
; point d'application (moment/couple).
; ==============================================================================================
Physics_ApplyForceAtPoint	proc far		; CODE XREF: AI_VisibilityTest+6EP
					; Missile_PhysicsTick+182P ...

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		add	di, 8
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
		mov	si, [si+2]
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

loc_4654E:
		mov	eax, [bp+var_4]

loc_46552:
		add	[bp+var_10], eax

loc_46556:
		mov	si, [bp+arg_0]

loc_46559:
		or	si, si
		jz	short loc_46561
		mov	ax, si

loc_4655F:
		jmp	short loc_4656B
; ���������������������������������������������������������������������������

loc_46561:				; CODE XREF: Physics_ApplyForceAtPoint+9Dj
		push	0Ch

loc_46563:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4656B:				; CODE XREF: Physics_ApplyForceAtPoint:loc_4655Fj
		or	ax, ax
		jz	short loc_4658A
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4],	eax
		mov	eax, [bp+var_10]

loc_46582:
		mov	[si+8],	eax

loc_46586:
		mov	ax, si
		jmp	short loc_4658C
; ���������������������������������������������������������������������������

loc_4658A:				; CODE XREF: Physics_ApplyForceAtPoint+AFj
		mov	ax, si

loc_4658C:				; CODE XREF: Physics_ApplyForceAtPoint+CAj
		mov	dx, [bp+arg_2]

loc_4658F:
		mov	ax, [bp+arg_0]

loc_46592:
		pop	di
		pop	si

locret_46594:
		leave
		retf
Physics_ApplyForceAtPoint	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,121L — variante de sub_464BE sur l'offset +0x14 (second vecteur de force) : application
; pondérée d'un second vecteur de force.
; ==============================================================================================
Physics_ApplyForceAtPointAlt	proc far		; CODE XREF: seg103:3397P

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp

loc_46597:
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		add	di, 14h
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
		lea	ax, [bp+var_C]
		push	ax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+70h]
		add	sp, 4
		add	si, 8
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
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8

loc_4664E:
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_46687
		mov	ax, si
		jmp	short loc_46691
; ���������������������������������������������������������������������������

loc_46687:				; CODE XREF: Physics_ApplyForceAtPointAlt+EBj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx

loc_4668F:
		mov	si, ax

loc_46691:				; CODE XREF: Physics_ApplyForceAtPointAlt+EFj
		or	ax, ax
		jz	short loc_466B0
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4],	eax
		mov	eax, [bp+var_10]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_466B2
; ���������������������������������������������������������������������������

loc_466B0:				; CODE XREF: Physics_ApplyForceAtPointAlt+FDj
		mov	ax, si

loc_466B2:				; CODE XREF: Physics_ApplyForceAtPointAlt+118j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Physics_ApplyForceAtPointAlt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,210L — alloue/reset un vecteur (4 octets si nul) si la composante verticale (+0x10) est
; négative : allocation conditionnelle d'un vecteur de correction (probable contrainte
; d'altitude/sol).
; ==============================================================================================
Physics_AllocGroundConstraintVector	proc far		; CODE XREF: Physics_ApplyGroundHeightConstraint+6Ap

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		cmp	dword ptr [si+10h], 0
		jl	short loc_466F7
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_466D9
		mov	ax, si
		jmp	short loc_466E3
; ���������������������������������������������������������������������������

loc_466D9:				; CODE XREF: Physics_AllocGroundConstraintVector+17j
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_466E3:				; CODE XREF: Physics_AllocGroundConstraintVector+1Bj
		or	ax, ax
		jz	short loc_466F2
		mov	dword ptr [si],	0
		mov	ax, si
		jmp	short loc_466F4
; ���������������������������������������������������������������������������

loc_466F2:				; CODE XREF: Physics_AllocGroundConstraintVector+29j
		mov	ax, si

loc_466F4:				; CODE XREF: Physics_AllocGroundConstraintVector+34j
		jmp	loc_4687F
; ���������������������������������������������������������������������������

loc_466F7:				; CODE XREF: Physics_AllocGroundConstraintVector+10j
		mov	ax, si
		add	ax, 8
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax
		mov	bx, [si+2]
		mov	eax, [bx+1Ah]
		mov	[bp+var_8], eax
		mov	di, [bp+arg_6]
		mov	eax, [di]
		sub	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jg	short loc_4673C
		mov	[bp+var_C], 7D000h
		jmp	loc_46875
; ���������������������������������������������������������������������������

loc_4673C:				; CODE XREF: Physics_AllocGroundConstraintVector+73j
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp+var_4]

loc_46751:
		sar	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		lea	ax, [bp+var_18]
		push	ax
		push	ss

loc_46761:
		lea	ax, [bp+var_1C]

loc_46764:
		push	ax
		call	Math_Tan_548AD
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax

loc_46781:
		cmp	[bp+var_10], 0
		jg	short loc_46793

loc_46788:
		mov	[bp+var_C], 0
		jmp	loc_46875
; ���������������������������������������������������������������������������

loc_46793:				; CODE XREF: Physics_AllocGroundConstraintVector+CAj
		mov	ax, si
		add	ax, 8
		push	ax
		mov	ax, si
		add	ax, 8
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	[bp+var_24], 9CCh
		cmp	[bp+var_8], 100h
		jge	short loc_4680C
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
		jmp	short loc_46844
; ���������������������������������������������������������������������������

loc_4680C:				; CODE XREF: Physics_AllocGroundConstraintVector+100j
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

loc_46844:				; CODE XREF: Physics_AllocGroundConstraintVector+14Ej
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_10]
		imul	edx

loc_46853:
		shrd	eax, edx, 8

loc_46858:
		mov	[bp+var_C], eax

loc_4685C:
		lea	ax, [bp+var_4]
		push	ax
		push	ss

loc_46861:
		lea	ax, [bp+var_28]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_28]
		add	[bp+var_C], eax

loc_46875:				; CODE XREF: Physics_AllocGroundConstraintVector+7Dj
					; Physics_AllocGroundConstraintVector+D4j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_C]
		mov	[bx], eax

loc_4687F:				; CODE XREF: Physics_AllocGroundConstraintVector:loc_466F4j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Physics_AllocGroundConstraintVector	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,57L — interroge l'altitude du terrain (Terrain_QueryAltitudeAt, seg077) à la position
; d'un objet, applique une contrainte via sub_466BC : contrainte de hauteur sol pour la
; physique de vol (terrain-following / évitement de collision avec le sol) — connecte le
; moteur physique JDYN au système de terrain.
; ==============================================================================================
Physics_ApplyGroundHeightConstraint	proc far		; CODE XREF: seg002:0EB1P
					; Cockpit_DetectPlayerMissile+89P ...

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_4688A:
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
		lea	ax, [bp+var_20]
		push	ax
		mov	ax, [si+2]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
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
Physics_ApplyGroundHeightConstraint	endp

; ���������������������������������������������������������������������������

loc_46902:				; DATA XREF: seg339:off_6EE0Eo
					; seg339:1DCAo	...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4690A:				; DATA XREF: seg339:off_6EE12o
					; seg339:1DCEo	...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46912:				; DATA XREF: seg339:off_6EE32o
					; seg339:off_6EE9Eo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4691A:				; DATA XREF: seg339:off_6EEAAo
					; seg339:off_6EEFAo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46922:				; DATA XREF: seg339:off_6EE42o
					; seg339:off_6EEAEo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4692C:				; DATA XREF: seg339:1E02o seg339:1E52o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46934:				; DATA XREF: seg339:4E3Ao
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-4]
		mov	dword_6FF9B, eax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	dword_6FF9F, eax

loc_4695A:
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	dword_6FFA3, eax
		leave
		retf
seg101		ends
