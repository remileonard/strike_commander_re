seg087		segment	byte public 'CODE' use16
		assume cs:seg087
		;org 7
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_3DEE7:				; DATA XREF: seg339:off_6F870o
		push	bp
		mov	bp, sp

loc_3DEEA:				; DATA XREF: seg216:off_6A15Eo
		mov	ax, [bp+6]
		push	word ptr [bp+8]
		push	ax
		call	Debris_NotifyChildValidate
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3DEFB:				; DATA XREF: seg339:27CCo
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		push	si
		call	Camera_ResolvePositionVelocity_3DDC4
		pop	cx
		mov	[bp-1],	al
		mov	al, [si+73h]
		and	ax, 1
		or	al, al
		jz	short loc_3DF1E
		mov	al, 0
		jmp	loc_3E112
; ���������������������������������������������������������������������������

loc_3DF1E:				; CODE XREF: seg087:0037j
		mov	al, [si+73h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_3DF2D
		jmp	loc_3E0CA
; ���������������������������������������������������������������������������

loc_3DF2D:				; CODE XREF: seg087:0048j
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_3DF36
		jmp	loc_3E0CA
; ���������������������������������������������������������������������������

loc_3DF36:				; CODE XREF: seg087:0051j
		mov	al, [si+73h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jnz	short loc_3DF46
		jmp	loc_3E080
; ���������������������������������������������������������������������������

loc_3DF46:				; CODE XREF: seg087:0061j
		mov	ax, [si+71h]
		cmp	ax, word_6F902
		jge	short loc_3DF52
		jmp	loc_3E074
; ���������������������������������������������������������������������������

loc_3DF52:				; CODE XREF: seg087:006Dj
		mov	ax, word_6F902
		sub	[si+71h], ax
		mov	al, [si+73h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_3DFC3
		cmp	byte ptr [si+62h], 0
		jge	short loc_3DF6E
		jmp	loc_3E007
; ���������������������������������������������������������������������������

loc_3DF6E:				; CODE XREF: seg087:0089j
		mov	al, [si+62h]
		cbw
		les	bx, [si+0Eh]
		mov	dx, es:[bx+56h]
		dec	dx
		cmp	ax, dx
		jnz	short loc_3DFA1
		cmp	word_70466, 5
		jbe	short loc_3DFA1
		cmp	si, word_722E6
		jnz	short loc_3DFA1
		cmp	byte_72A8E, 4
		jnz	short loc_3DFA1
		push	0
		push	large 0
		push	4
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8

loc_3DFA1:				; CODE XREF: seg087:009Cj seg087:00A3j ...
		dec	byte ptr [si+62h]
		cmp	word ptr [si+63h], 0
		jz	short loc_3E028

loc_3DFAA:				; CODE XREF: seg087:0125j
		push	0
		mov	bx, [si+63h]
		push	large dword ptr	[bx+0Ah]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_3E028
; ���������������������������������������������������������������������������

loc_3DFC1:
		jmp	short loc_3E007
; ���������������������������������������������������������������������������

loc_3DFC3:				; CODE XREF: seg087:0083j
		mov	al, [si+62h]
		cbw

loc_3DFC7:
		les	bx, [si+0Eh]
		mov	dx, es:[bx+56h]
		dec	dx

loc_3DFCF:
		cmp	ax, dx
		jge	short loc_3E007

loc_3DFD3:
		cmp	byte ptr [si+62h], 0
		jnz	short loc_3DFFC
		cmp	word_70466, 5
		jbe	short loc_3DFFC
		cmp	si, word_722E6
		jnz	short loc_3DFFC
		cmp	byte_72A8E, 4
		jnz	short loc_3DFFC
		push	0
		push	large 0
		push	5
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8

loc_3DFFC:				; CODE XREF: seg087:00F7j seg087:00FEj ...
		inc	byte ptr [si+62h]
		cmp	word ptr [si+63h], 0
		jz	short loc_3E028
		jmp	short loc_3DFAA
; ���������������������������������������������������������������������������

loc_3E007:				; CODE XREF: seg087:008Bj
					; seg087:loc_3DFC1j ...
		and	byte ptr [si+73h], 0F7h
		mov	al, [si+73h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+73h], 0FBh
		shl	al, 2
		or	[si+73h], al

loc_3E028:				; CODE XREF: seg087:00C8j seg087:00DFj ...
		cmp	byte ptr [si+62h], 0FFh
		jnz	short loc_3E036
		mov	word ptr [si+63h], 0
		jmp	loc_3E0CA
; ���������������������������������������������������������������������������

loc_3E036:				; CODE XREF: seg087:014Cj
		les	bx, [si+0Eh]
		mov	dx, es:[bx+54h]
		mov	al, [si+62h]
		cbw
		add	dx, ax
		mov	[bp-4],	dx
		push	word ptr [bp-4]
		push	word ptr [si+1Eh]
		call	Container_Op_22E27
		add	sp, 4
		mov	[si+63h], ax
		cmp	word ptr [si+63h], 0
		jz	short loc_3E0CA
		push	1
		mov	bx, [si+63h]
		push	large dword ptr	[bx+0Ah]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_3E0CA
; ���������������������������������������������������������������������������

loc_3E074:				; CODE XREF: seg087:006Fj
		mov	ax, [si+71h]
		add	ax, word ptr dword_70458
		mov	[si+71h], ax
		jmp	short loc_3E0CA
; ���������������������������������������������������������������������������

loc_3E080:				; CODE XREF: seg087:0063j
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 2
		and	ax, 1
		mov	dl, al
		or	dl, dl
		jz	short loc_3E0AC
		mov	al, [si+73h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_3E0C1

loc_3E0AC:				; CODE XREF: seg087:01BBj
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E0CA
		mov	al, [si+73h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_3E0CA

loc_3E0C1:				; CODE XREF: seg087:01CAj
		or	byte ptr [si+73h], 8
		mov	word ptr [si+71h], 0

loc_3E0CA:				; CODE XREF: seg087:004Aj seg087:0053j ...
		cmp	word ptr [si+65h], 0
		jz	short loc_3E10F
		mov	bx, [si+65h]
		mov	ax, [bx+0Ch]
		mov	dx, [bx+0Ah]
		mov	[bp-4],	ax
		mov	[bp-6],	dx
		push	ax
		push	dx
		les	bx, [bp-6]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		or	al, al
		jz	short loc_3E10F
		mov	al, [si+67h]
		inc	al
		mov	[si+67h], al
		cmp	al, 3
		jb	short loc_3E10F
		push	0
		push	large dword ptr	[bp-6]
		les	bx, [bp-6]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_3E10F:				; CODE XREF: seg087:01EEj seg087:020Fj ...
		mov	al, [bp-1]

loc_3E112:				; CODE XREF: seg087:003Bj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3E115:				; DATA XREF: seg339:off_6F880o
		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+6]
		mov	al, [si+73h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_3E12F
		jmp	loc_3E1F3
; ���������������������������������������������������������������������������

loc_3E12F:				; CODE XREF: seg087:024Aj
		push	si
		call	Camera_ComputeMountedPosition_3D31D
		pop	cx
		cmp	word_722E6, si
		jnz	short loc_3E15D
		cmp	byte_6E4CF, 0
		jz	short loc_3E15D
		mov	dword ptr [bp-4], 100h
		lea	ax, [bp-4]
		push	ax
		mov	ax, si
		add	ax, 68h	; 'h'
		push	ax
		call	Timer_SetAbsolute_4F9A2
		add	sp, 4

loc_3E15D:				; CODE XREF: seg087:025Aj seg087:0261j
		mov	di, si
		add	di, 68h	; 'h'
		mov	eax, [di]
		mov	[bp-0Ah], eax
		cmp	dword ptr [bp-0Ah], 0
		jle	short loc_3E175
		mov	ax, 1
		jmp	short loc_3E177
; ���������������������������������������������������������������������������

loc_3E175:				; CODE XREF: seg087:028Ej
		xor	ax, ax

loc_3E177:				; CODE XREF: seg087:0293j
		mov	[bp-5],	al
		mov	ax, si
		add	ax, 68h	; 'h'
		push	ax
		call	Timer_Tick_4F9E6
		pop	cx
		or	al, al
		jz	short loc_3E1E5
		movsx	eax, word ptr [si+6Dh]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	di, si
		add	di, 68h	; 'h'
		mov	eax, [di]
		mov	[bp-12h], eax
		mov	eax, [bp-0Eh]
		mov	edx, [bp-12h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Eh], eax
		lea	ax, [bp-0Eh]
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax

loc_3E1C1:
		call	Matrix_BuildAxisX_ApplyToObject_574B3
		add	sp, 4
		lea	ax, [bp-0Eh]
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax

loc_3E1D3:
		call	Matrix_BuildAxisZ_ApplyToObject_5755D
		add	sp, 4
		mov	ax, [si+6Dh]
		neg	ax
		mov	[si+6Dh], ax
		jmp	short loc_3E1F3
; ���������������������������������������������������������������������������

loc_3E1E5:				; CODE XREF: seg087:02A8j
		cmp	byte ptr [bp-5], 0
		jz	short loc_3E1F3
		push	0
		call	Video_SetHorizontalShake
		pop	cx

loc_3E1F3:				; CODE XREF: seg087:024Cj seg087:0303j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3E1F7:				; DATA XREF: seg339:off_6F8A0o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 6
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3E201:				; DATA XREF: seg339:283Co
		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		push	di
		mov	si, [bp+6]
		mov	bx, [bp+8]
		mov	dword ptr [bp-4], 2D00h
		or	bx, bx
		jnz	short loc_3E21E
		jmp	loc_3E2EB
; ���������������������������������������������������������������������������

loc_3E21E:				; CODE XREF: seg087:0339j
		cmp	bx, si
		jnz	short loc_3E225
		jmp	loc_3E2EB
; ���������������������������������������������������������������������������

loc_3E225:				; CODE XREF: seg087:0340j
		mov	di, bx
		add	di, 12h
		mov	ax, si
		add	ax, 12h
		mov	[bp-6],	ax
		mov	eax, [di]
		mov	bx, [bp-6]
		sub	eax, [bx]
		mov	[bp-2Eh], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp-2Ah], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp-26h], eax
		mov	eax, [bp-2Eh]
		mov	[bp-22h], eax
		mov	eax, [bp-2Ah]
		mov	[bp-1Eh], eax
		mov	eax, [bp-26h]
		mov	[bp-1Ah], eax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		lea	ax, [bp-22h]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	eax, [bp-1Eh]
		mov	[bp-0Ah], eax
		push	large dword ptr	[bp-1Ah]
		push	eax
		push	large dword ptr	[bp-22h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	[bp-12h], eax
		mov	eax, [bp-0Ah]
		mov	edx, eax
		mov	ecx, [bp-12h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-0Ah], eax
		lea	ax, [bp-4]

loc_3E2C4:
		push	ax
		push	ss

loc_3E2C6:
		lea	ax, [bp-16h]
		push	ax

loc_3E2CA:
		call	Math_CosDeg_5483F
		add	sp, 6

loc_3E2D2:
		mov	eax, [bp-0Ah]
		cmp	eax, [bp-16h]
		jl	short loc_3E2E1
		mov	ax, 1
		jmp	short loc_3E2E3
; ���������������������������������������������������������������������������

loc_3E2E1:				; CODE XREF: seg087:03FAj
		xor	ax, ax

loc_3E2E3:				; CODE XREF: seg087:03FFj
		or	al, al
		jz	short loc_3E2EB
		mov	al, 1
		jmp	short loc_3E2ED
; ���������������������������������������������������������������������������

loc_3E2EB:				; CODE XREF: seg087:033Bj seg087:0342j ...
		mov	al, 0

loc_3E2ED:				; CODE XREF: seg087:0409j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-20, completee 2026-09-24). Methode virtuelle +0x7C de la classe d'objet
; pilote (vtable seg339 0x6F86C, slot 0x6F8E8) : SIGNATURE IR vue par un chercheur, appelee
; (this = cible, arg = objet de reference du chercheur : missile en vol ou objet +0x0D du
; point d'emport). Sans reference : renvoie l'octet modele +0x12 (1er octet SIGN). Avec
; reference : v = |cible->vtable+0x4C| (vitesse, loc_3D246 = copie de [+0x51]+8) * 256 /
; 0x25A00 (= vitesse / 602) ; A = Math_DotProduct3D_5505B(vitesse reference, vitesse cible) >
; 0 (meme sens = chercheur dans le secteur arriere) ; sig = v*100 si A sinon v*50 ; sig +=
; 0xA00 (10, constante, PAS l'octet SIGN) ; si l'octet +0x1E de l'enregistrement de commandes
; ([+0x55]->vtable+8) est > 5 : sig += 100 si A sinon 50. Cet octet est le CRAN DE MANETTE DES
; GAZ (0-10) : WorldObject_UpdateWithAIEntity_3D9FB passe ce meme enregistrement a
; [+0x51]->vtable+0x40 = thunk loc_3B669 -> PhysicsTicks, qui lit es:[bx+1Eh] comme cran et
; teste cmp byte ptr [bp-2Ch],5 / jg pour la consommation post-combustion (0x4C au lieu de
; 0x33) : > 5 = POST-COMBUSTION. Renvoie (sig >> 8) dans AL : tronque a l'octet, donc repasse
; par 0 au-dela de 255 (arriere + PC : v > ~812).
; ==============================================================================================
Aircraft_ComputeSeekerSignature_3E2F1:				; DATA XREF: seg339:2838o
		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	di, di
		jnz	short loc_3E306
		jmp	loc_3E40E
; ���������������������������������������������������������������������������

loc_3E306:				; CODE XREF: seg087:0421j
		push	si
		push	ss
		lea	ax, [bp-2Ah]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large dword ptr	[bp-22h]
		push	large dword ptr	[bp-26h]
		push	large dword ptr	[bp-2Ah]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-4],	eax
		mov	dword ptr [bp-0Ch], 25A00h
		mov	eax, [bp-4]
		mov	edx, eax
		mov	ecx, [bp-0Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-4],	eax
		push	di
		push	ss
		lea	ax, [bp-36h]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-2Ah]
		push	ax
		lea	ax, [bp-36h]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	dword ptr [bp-16h], 0

loc_3E381:
		mov	eax, [bp-10h]

loc_3E385:
		cmp	eax, [bp-16h]
		jle	short loc_3E390

loc_3E38B:
		mov	ax, 1
		jmp	short loc_3E392
; ���������������������������������������������������������������������������

loc_3E390:				; CODE XREF: seg087:04A9j
		xor	ax, ax

loc_3E392:				; CODE XREF: seg087:04AEj
		mov	[bp-11h], al

loc_3E395:
		cmp	byte ptr [bp-11h], 0
		jz	short loc_3E3A5
		mov	eax, [bp-4]
		imul	eax, 64h
		jmp	short loc_3E3AD
; ���������������������������������������������������������������������������

loc_3E3A5:				; CODE XREF: seg087:04B9j
		mov	eax, [bp-4]
		imul	eax, 32h

loc_3E3AD:				; CODE XREF: seg087:04C3j
		mov	[bp-4],	eax
		add	dword ptr [bp-4], 0A00h
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp-1Ah], dx
		mov	[bp-1Ch], ax
		les	bx, [bp-1Ch]
		cmp	byte ptr es:[bx+1Eh], 5
		jle	short loc_3E3DE
		mov	ax, 1
		jmp	short loc_3E3E0
; ���������������������������������������������������������������������������

loc_3E3DE:				; CODE XREF: seg087:04F7j
		xor	ax, ax

loc_3E3E0:				; CODE XREF: seg087:04FCj
		mov	[bp-17h], al
		cmp	byte ptr [bp-17h], 0
		jz	short loc_3E401
		cmp	byte ptr [bp-11h], 0
		jz	short loc_3E3F9
		add	dword ptr [bp-4], 6400h
		jmp	short loc_3E401
; ���������������������������������������������������������������������������

loc_3E3F9:				; CODE XREF: seg087:050Dj
		add	dword ptr [bp-4], 3200h

loc_3E401:				; CODE XREF: seg087:0507j seg087:0517j
		mov	eax, [bp-4]
		sar	eax, 8
		mov	[bp-1Dh], al
		jmp	short loc_3E415
; ���������������������������������������������������������������������������

loc_3E40E:				; CODE XREF: seg087:0423j
		les	bx, [si+0Eh]
		mov	al, es:[bx+12h]

loc_3E415:				; CODE XREF: seg087:052Cj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3E419:				; DATA XREF: seg339:off_6F8F4o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	large dword ptr	[bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Eh
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,24L — si un composant référencé (+0x65) existe, notifie sa destruction (vtable+0xA,
; vtable[4]) et efface un flag (+0x67) : nettoyage/notification de destruction d'un sous-
; composant lié au pilotage.
; ==============================================================================================
Pilot_NotifySubcomponentDestroy	proc far		; CODE XREF: HUD_RenderSymbologyMain+FD4P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+65h], 0
		jz	short loc_3E466
		push	1
		mov	bx, [si+65h]
		push	large dword ptr	[bx+0Ah]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	byte ptr [si+67h], 0

loc_3E466:				; CODE XREF: Pilot_NotifySubcomponentDestroy+Bj
		pop	si
		pop	bp
		retf
Pilot_NotifySubcomponentDestroy	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,37L — récupère l'orientation via vtable[0x48], appelle sub_49242 (chaîne
; PhysicsTick/calibration déjà documentée dans le projet) avec les angles, puis réinitialise
; l'état neutre (Goal_ResetNeutralState) sur une cible référencée (+0x55) : commande de
; pilotage bas niveau reliant orientation caméra/vue et tick physique — point de jonction avec
; la chaîne sub_49242 déjà en cours d'investigation.
; ==============================================================================================
Pilot_LowLevelControlCommand	proc far		; CODE XREF: Pilot_IssueControlCommand_79DA0+16BP
					; UIScript_ParseAndEvaluate_7A054+3C6P ...

var_6		= dword	ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		sub	sp, 4
		mov	eax, [bp+arg_6]
		mov	[bp+var_6], eax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [si+51h]
		mov	bx, [si+51h]

loc_3E487:
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		push	ax

loc_3E48E:
		call	Pilot_SteeringCommandToTarget
		add	sp, 0Ah
		push	large dword ptr	[si+55h]
		call	Goal_ResetNeutralState
		add	sp, 4
		pop	si
		pop	bp
		retf
Pilot_LowLevelControlCommand	endp

; ���������������������������������������������������������������������������

loc_3E4A5:				; DATA XREF: seg339:24D0o
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3E4AC:				; DATA XREF: seg339:27D4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3E519
		mov	word ptr [si], 27BCh
		mov	ax, si
		add	ax, 6Fh	; 'o'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	2

loc_3E4D2:
		les	bx, [si+5Eh]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0
		push	2
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0
		push	si
		call	Camera_DestructCompoundB
		add	sp, 4
		test	di, 1
		jz	short loc_3E519
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_3E519:				; CODE XREF: seg087:05DCj seg087:0630j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3E51D:				; DATA XREF: seg339:24C8o
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_3E5A3
		les	bx, [bp+6]
		mov	word ptr es:[bx], 24C8h
		push	0
		push	2
		les	bx, es:[bx+4Eh]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0
		push	2
		les	bx, [bp+6]
		mov	eax, es:[bx+4Eh]
		mov	[bp-8],	eax
		lea	ax, [bp-8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0
		push	large dword ptr	[bp+6]
		call	Camera_DestructCompoundA
		add	sp, 6

loc_3E582:
		test	si, 1
		jz	short loc_3E5A3
		mov	eax, [bp+6]

loc_3E58C:
		mov	[bp-0Ch], eax
		push	0
		push	2
		lea	ax, [bp-0Ch]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_3E5A3:				; CODE XREF: seg087:064Cj seg087:06A6j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,178L — calcule un angle via sin/cos (sub_57C67/sub_57C3A) avec des constantes fixes
; (0x6D9/0x62C, probable dimensions d'écran), produit une série de projections
; trigonométriques successives : calcul de position d'une aiguille/élément graphique
; d'instrument de bord (cadran complexe), même famille que le seg019.
; ==============================================================================================
Gauge_ComputeNeedlePosition	proc far		; CODE XREF: Collision_SelectCandidates+B9P
					; seg103:loc_4A8C2P ...

var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
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

		push	bp
		mov	bp, sp
		sub	sp, 74h
		push	si
		mov	si, [bp+arg_4]

loc_3E5B0:
		mov	[bp+var_4], 6D9h

loc_3E5B8:
		mov	[bp+var_8], 62Ch

loc_3E5C0:
		mov	[bp+var_C], 0
		mov	[bp+var_10], 0FFFFD2A1h
		mov	[bp+var_14], 0FFFFD892h
		mov	[bp+var_18], 276Eh
		mov	[bp+var_1C], 2245h
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	AI_ComputeGeometrySolution_57C67
		add	sp, 6
		mov	eax, [bp+var_24]
		neg	eax
		mov	[bp+var_28], eax
		mov	[bp+var_20], eax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		call	AI_ApplyAngleBetweenVectors_57C3A
		add	sp, 6
		mov	eax, [bp+var_1C]
		add	eax, [bp+var_2C]
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		lea	ax, [bp+var_40]
		push	ax
		push	ss
		lea	ax, [bp+var_44]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_44]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_14]
		add	eax, [bp+var_20]
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax
		lea	ax, [bp+var_4C]
		push	ax
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_30]

loc_3E687:
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_18]
		add	eax, [bp+var_20]
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		lea	ax, [bp+var_58]
		push	ax
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		call	Math_CosDeg_5483F

loc_3E6B5:
		add	sp, 6
		mov	eax, [bp+var_34]

loc_3E6BC:
		mov	edx, [bp+var_5C]
		imul	edx

loc_3E6C3:
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_10]
		add	eax, [bp+var_2C]
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		lea	ax, [bp+var_64]
		push	ax
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_68]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_74]
		jle	short loc_3E723
		mov	[bp+var_74], eax

loc_3E723:				; CODE XREF: Gauge_ComputeNeedlePosition+177j
		mov	eax, [bp+var_38]
		cmp	eax, [bp+var_74]
		jle	short loc_3E731
		mov	[bp+var_74], eax

loc_3E731:				; CODE XREF: Gauge_ComputeNeedlePosition+185j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_74]
		mov	[bx], eax
		mov	dx, [bp+arg_2]

loc_3E73E:
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Gauge_ComputeNeedlePosition	endp

seg087		ends
