ovr309		segment	para public 'OVERLAY' use16
		assume cs:ovr309
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Aircraft_SetChildVisible_9DD30 (sub_9DD30 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-12. Ex-'TimedTrigger_NotifySingleListener'. (instance, rang n) : sous-objet
; attaché n° n (WorldObject_GetNthChild_22E27 sur la liste +0x1E = sous-objets CHLD) ; s'il
; existe, appelle sa méthode +4 avec 0 (masque/désactive). Renvoie 1 si le sous-objet existe.
; ==============================================================================================
Aircraft_SetChildVisible_ADDB0		proc far

var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		push	ax
		push	word ptr [si+1Eh]
		call	WorldObject_GetNthChild_1F208
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_ADDFB
		mov	eax, [si+0Ah]
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jz	short loc_ADDFB
		mov	[bp+var_1], 1
		push	0
		push	large [bp+var_6]
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_ADDFB:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Aircraft_SetChildVisible_ADDB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Aircraft_InitSpecialChild_9DD81 (sub_9DD81 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-12. Ex-'TimedTrigger_NotifyConditional'. À la création d'un avion
; (Camera_ConstructWithHandle_9D610) : si JINF champ 6 (modèle +0x59) ≠ 0, le sous-objet CHLD
; de rang JINF champ 7 (modèle +0x66) est mémorisé en +0x65 et sa méthode +4 appelée avec 0.
; La mise à jour (Aircraft_Update_3DEFB) le désactive définitivement après 3 images où sa
; méthode +8 est vraie (compteur +0x67).
; ==============================================================================================
Aircraft_InitSpecialChild_ADE01		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_ADE4C
		les	bx, [bp+arg_2]
		cmp	byte ptr es:[bx+6Ch], 0
		jz	short loc_ADE4C
		mov	ax, es:[bx+7Ah]
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+1Eh]
		call	WorldObject_GetNthChild_1F208
		add	sp, 4
		mov	[si+6Ah], ax
		cmp	word ptr [si+6Ah], 0
		jz	short loc_ADE4C
		push	0
		mov	bx, [si+6Ah]
		push	large [bx+0Ah]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_ADE4C:
		pop	si
		leave
		retf
Aircraft_InitSpecialChild_ADE01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADE4F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	al, es:[bx+66h]
		and	ax, 1
		and	byte ptr [si+67h], 0FEh
		or	[si+67h], al
		mov	al, [si+67h]
		and	ax, 1
		or	al, al
		jz	short loc_ADE75
		or	byte ptr [si+67h], 1

loc_ADE75:
		and	byte ptr [si+77h], 0FDh
		and	byte ptr [si+77h], 0FBh
		mov	byte ptr [si+68h], 0FFh
		pop	si
		pop	bp
		retf
sub_ADE4F		endp
ovr309		ends
