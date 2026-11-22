ovr304		segment	para public 'OVERLAY' use16
		assume cs:ovr304
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD630		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_741CF
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 48h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39567
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_AD630		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ConstructWithCameraAttach_9D0FA (sub_9D0FA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocation, Debris_BodyReset, Camera_AttachSubcomponent.
; ==============================================================================================
Debris_ConstructWithCameraAttach_AD65A		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	2Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AD6B5
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 15EAh
		push	ax
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si+2Dh], 0
		mov	word ptr [si], 20ECh
		push	large [bp+var_4]
		push	si
		call	sub_3C3C3
		add	sp, 6
		mov	ax, si
		jmp	short loc_AD6B7

loc_AD6B5:
		mov	ax, si

loc_AD6B7:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		or	si, si
		jz	short loc_AD6E4
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+48h]
		mov	bx, es:[bx+48h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+2Dh], ax

loc_AD6E4:
		mov	ax, si
		pop	si
		leave
		retf
Debris_ConstructWithCameraAttach_AD65A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MobileObject_LoadDynamicsAndSmoke_9D189 (sub_9D189 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; lecteur commun des objets mobiles orientés (OMOB, EJEC…) (ex-JDYN_LoadAngleAndChunk) :
; IFF_LoadAngleParam (chunks communs + ALGN), dynamique JDYN_LoadChunkAndConstruct_3A49C →
; +0x36, puis chunk SMOK facultatif = TRAÎNÉE DE FUMÉE : uint8 → +0x39 type de fumée (index
; dans le jeu de fumées du monde ; recopié en instance +0x54 par
; Camera_InitAttachedWithTarget_3DC3D), 3× int32 24.8 → +0x3A/+0x3E/+0x42 point d'émission
; dans le repère de l'objet (F-16 : (0, −14, 0) en asm, soit 14 m derrière), +0x38 = 1
; (l'objet a une traînée). Consommateur : SmokeTrail_Tick_3D57E.
; ==============================================================================================
MobileObject_LoadDynamicsAndSmoke_AD6E9		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_3B14C
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 49h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39567
		add	sp, 6
		push	0
		push	large 4B4F4D53h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AD771
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ch], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Dh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+51h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+55h], eax
		mov	byte ptr es:[bx+4Bh], 1

loc_AD771:
		pop	si
		pop	bp
		retf
MobileObject_LoadDynamicsAndSmoke_AD6E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_ConstructAttachedWithTarget_9D214 (sub_9D214 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocation, WorldObject_BaseConstruct, Camera_InitAttachedWithTarget.
; ==============================================================================================
Camera_ConstructAttachedWithTarget_AD774		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AD7B2
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	large [bp+var_4]
		push	si
		call	sub_3C4B2
		add	sp, 6
		mov	ax, si
		jmp	short loc_AD7B4

loc_AD7B2:
		mov	ax, si

loc_AD7B4:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		or	si, si
		jz	short loc_AD7E1
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+52h], ax

loc_AD7E1:
		mov	ax, si
		pop	si
		leave
		retf
Camera_ConstructAttachedWithTarget_AD774		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD7E6		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr MobileObject_LoadDynamicsAndSmoke_AD6E9
		add	sp, 6
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 59h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_74315
		add	sp, 6
		pop	bp
		retf
sub_AD7E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_ConstructWithAIEntity_9D2CC (sub_9D2CC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; construit un objet monde de 0x5A octets (WorldObject_BaseConstruct, vtable 0x2618 après
; Camera_ResetState), puis écrit à +0x55 l'entité IA obtenue en appelant le slot 0 de l'objet
; à +0x46 du prototype (AIEntity_CreateByType_12B4E, avec l'objet neuf en argument) et à +0x51
; le résultat du slot +8 de l'objet à +0x36 du prototype. Anciennement
; Camera_ConstructWithSecondaryTarget.
; ==============================================================================================
WorldObject_ConstructWithAIEntity_AD81C		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AD86D
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	dword ptr [si+5Ah], 0
		mov	word ptr [si], 1FC4h
		push	large [bp+var_4]
		push	si
		call	Camera_InitWithSecondaryTarget
		add	sp, 6
		mov	ax, si
		jmp	short loc_AD86F

loc_AD86D:
		mov	ax, si

loc_AD86F:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		or	si, si
		jz	short loc_AD8BF
		push	si
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+59h]
		les	bx, es:[bx+59h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+5Ah], eax
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+52h], ax

loc_AD8BF:
		mov	ax, si
		pop	si
		leave
		retf
WorldObject_ConstructWithAIEntity_AD81C		endp
ovr304		ends
