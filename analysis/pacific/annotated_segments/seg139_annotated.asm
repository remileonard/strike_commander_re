seg139		segment	para public 'CODE' use16
		assume cs:seg139
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0, 0C6h, 44h, 15h, 0

loc_5EB26:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EB2A		proc far
		push	bp
		mov	bp, sp
		cmp	word_79E6F, 0
		jz	short loc_5EB3E
		push	word_79E6F
		call	sub_75414
		pop	cx

loc_5EB3E:
		cmp	word_79E6D, 0
		jz	short loc_5EB4F
		push	word_79E6D
		call	sub_7546A
		pop	cx

loc_5EB4F:
		cmp	word_79E71, 0
		jz	short loc_5EB60
		push	word_79E71
		call	sub_754B4
		pop	cx

loc_5EB60:
		pop	bp
		retf
sub_5EB2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EB62		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_6]
		mov	[bp+var_1], 0
		cmp	byte_7CB1C, 0
		jz	short loc_5EBB4
		cmp	word_79E73, 0
		jz	short loc_5EBB4
		cmp	word_79E6D, 0
		jz	short loc_5EB9C
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_IsPlaying_5C85F
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5EBB4

loc_5EB9C:
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E73
		call	sub_5B04F
		add	sp, 0Ah
		mov	[bp+var_1], al

loc_5EBB4:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5EBF8
		cmp	byte_7CB1A, 0
		jz	short loc_5EBF8
		cmp	word_79E6D, 0
		jz	short loc_5EBF8
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_Play3D_5C68A
		add	sp, 0Ah
		cmp	word_79E73, 0
		jz	short loc_5EBF8
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E73
		call	sub_5B328
		add	sp, 6

loc_5EBF8:
		pop	si
		leave
		retf
sub_5EB62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EBFB		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_6]
		mov	[bp+var_1], 0
		cmp	byte_7CB1C, 0
		jz	short loc_5EC76
		cmp	word_79E73, 0
		jz	short loc_5EC76
		cmp	byte_7CB1A, 0
		jz	short loc_5EC40
		cmp	word_79E6D, 0
		jz	short loc_5EC40
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_IsPlaying_5C85F
		add	sp, 6
		or	al, al
		jz	short loc_5EC40
		mov	[bp+var_1], 0
		jmp	short loc_5EC76

loc_5EC40:
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E73
		call	sub_5B04F
		add	sp, 0Ah
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_5EC76
		cmp	word_79E6D, 0
		jz	short loc_5EC76
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_StopEffect_5C812
		add	sp, 6

loc_5EC76:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5ECE5
		cmp	byte_7CB1A, 0
		jz	short loc_5ECE5
		cmp	word_79E6D, 0
		jz	short loc_5ECE5
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_IsPlaying_5C85F
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5ECB8
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_Play3D_5C68A
		jmp	short loc_5ECCA

loc_5ECB8:
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_UpdateVolume3D_5C75B

loc_5ECCA:
		add	sp, 0Ah
		cmp	word_79E73, 0
		jz	short loc_5ECE5
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E73
		call	sub_5B328
		add	sp, 6

loc_5ECE5:
		pop	si
		leave
		retf
sub_5EBFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5ECE8		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		cmp	byte_7CB1C, 0
		jz	short loc_5ED0E
		cmp	word_79E73, 0
		jz	short loc_5ED0E
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E73
		call	sub_5B328
		add	sp, 6

loc_5ED0E:
		cmp	byte_7CB1A, 0
		jz	short loc_5ED2D
		cmp	word_79E6D, 0
		jz	short loc_5ED2D
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6D
		call	SoundFX_StopEffect_5C812
		add	sp, 6

loc_5ED2D:
		pop	si
		pop	bp
		retf
sub_5ECE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Si la musique est active (byte_7CB19, word_79E6F) : n < word_79D66 →
; word_79D77 = n ; n = 255 ignoré ; sinon erreur 0B02Bh.
; ==============================================================================================
Music_SetPendingTune_5ED30		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_7CB19, 0
		jz	short loc_5ED61
		cmp	word_79E6F, 0
		jz	short loc_5ED61
		mov	dx, [bp+arg_0]
		cmp	dx, word_79D66
		jge	short loc_5ED50
		mov	word_79D77, dx
		jmp	short loc_5ED61

loc_5ED50:
		cmp	dx, 0FFh
		jz	short loc_5ED61
		push	0B02Bh
		call	sub_1DDFE
		pop	cx
		jmp	short loc_5ED61

loc_5ED61:
		pop	bp
		retf
Music_SetPendingTune_5ED30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5ED63		proc far
		push	bp
		mov	bp, sp
		cmp	word_79E6F, 0
		jz	short loc_5ED77
		push	word_79E6F
		call	sub_75428
		pop	cx

loc_5ED77:
		pop	bp
		retf
sub_5ED63		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5ED79		proc far
		push	bp
		mov	bp, sp
		cmp	word_79E6F, 0
		jz	short loc_5ED8D
		push	word_79E6F
		call	sub_7542D
		pop	cx

loc_5ED8D:
		pop	bp
		retf
sub_5ED79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Music_Stop_28CDB
; (sub_28CDB de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à Music_Stop_5A9E6
; (sub_5A9E6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'Widget_Helper_5A9E6'. far. LUE 2026-10-06. Facade (appelee par
; STRIKE_EXE_MAIN_LOOP) : Music_StopWithFade_AB1EF(fondu = argument).
; ==============================================================================================
Music_Stop_5ED8F		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	word_79E6F, 0
		jz	short loc_5EDA9
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E6F
		call	sub_75432
		add	sp, 4

loc_5EDA9:
		pop	bp
		retf
Music_Stop_5ED8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_SelectStartTune_5AA02 (sub_5AA02 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_InstantiateInstance_5AA02'. far. LUE 2026-10-06. Piste de depart (appelee
; par Cockpit_LoadAndDrawCalibration_8FDC0) : si Music_CombatIntensitySelector_59302 ne
; choisit rien : ennemis proches (Music_ScanNearbyEnemies_590E0) -> 4 si byte_70869 sinon 0x13
; ; sinon piste de la mission byte_706A2 (chunk TUNE) ; Music_RequestTune_5A984.
; ==============================================================================================
Music_SelectStartTune_5EDAB		proc far
		push	bp
		mov	bp, sp
		cmp	word_79E6F, 0
		jz	short loc_5EDF0
		push	word_79E6F
		call	sub_5BBF8
		pop	cx
		cmp	ax, 0FFFFh
		jnz	short loc_5EDF0
		push	0
		push	word_79E6F
		call	sub_5B962
		add	sp, 4
		or	al, al
		jz	short loc_5EDE5
		cmp	byte_79D87, 0
		jz	short loc_5EDE1
		push	9
		jmp	short loc_5EDEB

loc_5EDE1:
		push	1
		jmp	short loc_5EDEB

loc_5EDE5:
		mov	al, byte_79B8E
		mov	ah, 0
		push	ax

loc_5EDEB:
		push	cs
		call	near ptr Music_SetPendingTune_5ED30
		pop	cx

loc_5EDF0:
		pop	bp
		retf
Music_SelectStartTune_5EDAB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EDF2		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CB19, 0
		jz	short loc_5EE01
		cmp	word_79E6F, 0

loc_5EE01:
		pop	bp
		retf
sub_5EDF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Speech_LoadBank_28D24
; (sub_28D24 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Speech_LoadBank_5AAB2 (sub_5AAB2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — Ex-'Widget_Helper_5AAB2'. far. LUE 2026-10-06. Facade voix
; (byte_7236D, objet word_7099F) appelee par PilotProfile_LoadRADI_8DF49 :
; AudioQueue_LoadFromMultipleReaders_AB9D7.
; ==============================================================================================
Speech_LoadBank_5EE03		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_7CB19, 0
		jz	short loc_5EE26
		cmp	word_79E6F, 0
		jz	short loc_5EE26
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_79E6F
		call	sub_5C1BF
		add	sp, 6

loc_5EE26:
		pop	bp
		retf
Speech_LoadBank_5EE03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à SoundFX_StopAll_5AA95
; (sub_5AA95 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'Widget_Helper_5AA95'. far. LUE 2026-10-06. Arrete tous les canaux d'effets
; (SoundFX_StopAllChannels_AB770).
; ==============================================================================================
SoundFX_StopAll_5EE28		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CB19, 0
		jz	short loc_5EE43
		cmp	word_79E6F, 0
		jz	short loc_5EE43
		push	word_79E6F
		call	sub_5C41D
		pop	cx

loc_5EE43:
		pop	bp
		retf
SoundFX_StopAll_5EE28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EE45		proc far
		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7CB19, 0
		jz	short loc_5EE64
		cmp	word_79E6F, 0
		jz	short loc_5EE64
		push	word_79E6F
		call	sub_5C50A
		pop	cx
		mov	dl, al

loc_5EE64:
		mov	al, dl
		pop	bp
		retf
sub_5EE45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Music_OnObjectDestroyed_5AA49 (sub_5AA49 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'Weapon_HUDBox_UpdateAndRenderVariant_5AA49'.
; far. LUE 2026-10-06. Appelee par Combat_TeamOpposedCheckAndDispatch_53A94 a la destruction
; d'un objet : Music_SelectTuneCandidate_5923A(musique, 1, objet detruit).
; ==============================================================================================
Music_OnObjectDestroyed_5EE68		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7CB19, 0
		jz	short loc_5EE8E
		cmp	word_79E6F, 0
		jz	short loc_5EE8E
		push	[bp+arg_0]
		push	1
		push	word_79E6F
		call	sub_5BB21
		add	sp, 6
		mov	dl, al

loc_5EE8E:
		mov	al, dl
		pop	bp
		retf
Music_OnObjectDestroyed_5EE68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à SoundFX_Disable_5AA73
; (sub_5AA73 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'Widget_Helper_5AA73'. far. LUE 2026-10-06. Desactive les effets (byte_7236C = 0)
; apres avoir arrete tous les canaux.
; ==============================================================================================
SoundFX_Disable_5EE92		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CB1A, 0
		jz	short loc_5EEB2
		cmp	word_79E6D, 0
		jz	short loc_5EEB2
		mov	byte_7CB1A, 0
		push	word_79E6D
		call	sub_75479
		pop	cx

loc_5EEB2:
		pop	bp
		retf
SoundFX_Disable_5EE92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EEB4		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CB1A, 0
		jz	short loc_5EECF
		cmp	word_79E6D, 0
		jz	short loc_5EECF
		push	word_79E6D
		call	sub_75479
		pop	cx

loc_5EECF:
		cmp	byte_7CB1C, 0
		jz	short loc_5EEE7
		cmp	word_79E73, 0
		jz	short loc_5EEE7
		push	word_79E73
		call	sub_5B3F3
		pop	cx

loc_5EEE7:
		pop	bp
		retf
sub_5EEB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EEE9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	word_79E71, 0
		jz	short loc_5EF05
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_79E71
		call	sub_754B9
		add	sp, 6

loc_5EF05:
		pop	bp
		retf
sub_5EEE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EF07		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7CB1B, 0
		jz	short loc_5EF39
		cmp	word_79E71, 0
		jz	short loc_5EF39
		mov	al, [bp+arg_8]
		push	ax
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_79E71
		call	sub_5E355
		add	sp, 0Ch
		mov	dl, al

loc_5EF39:
		mov	al, dl
		pop	bp
		retf
sub_5EF07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EF3D		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7CB1B, 0
		jz	short loc_5EF69
		cmp	word_79E71, 0
		jz	short loc_5EF69
		mov	al, [bp+arg_4]
		push	ax
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+arg_0]
		push	word_79E71
		call	sub_5E743
		add	sp, 8
		mov	dl, al

loc_5EF69:
		mov	al, dl
		pop	bp
		retf
sub_5EF3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EF6D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7CB1C, 0
		jz	short loc_5EF9F
		cmp	word_79E71, 0
		jz	short loc_5EF9F
		mov	al, [bp+arg_8]
		push	ax
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_79E71
		call	sub_5E355
		add	sp, 0Ch
		mov	dl, al

loc_5EF9F:
		mov	al, dl
		pop	bp
		retf
sub_5EF6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EFA3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_79E71, 0
		jz	short loc_5EFBD
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		mov	bx, word_79E71
		mov	[bx+26h], ax

loc_5EFBD:
		leave
		retf
sub_5EFA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EFBF		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	word_79E71, 0
		jz	short loc_5EFDD
		mov	al, [bp+arg_0]
		push	ax
		push	word_79E71
		call	AudioQueue_OpcodeHelper_5E9BC
		add	sp, 4
		mov	dl, al

loc_5EFDD:
		mov	al, dl
		pop	bp
		retf
sub_5EFBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EFE1		proc far
		push	bp
		mov	bp, sp
		cmp	word_79E71, 0
		jz	short loc_5F003
		mov	bx, word_79E71
		cmp	word ptr [bx+9], 0
		jz	short loc_5F003
		mov	bx, [bx+9]
		push	word ptr [bx+4]
		call	sub_1DB8F
		pop	cx
		jmp	short loc_5F003

loc_5F003:
		pop	bp
		retf
sub_5EFE1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F005		proc far

var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_17		= word ptr -17h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		push	di
		mov	si, word_7CEF9
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_5F025
		jmp	loc_5F1FC

loc_5F025:
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+24h], 0
		jz	short loc_5F052
		mov	di, si
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_24], eax
		mov	eax, [di+4]
		mov	[bp+var_20], eax
		mov	eax, [di+8]
		mov	[bp+var_1C], eax
		mov	di, [bp+var_2]
		add	di, 12h
		jmp	short loc_5F057

loc_5F052:
		mov	di, si
		add	di, 14h

loc_5F057:
		mov	eax, [di]
		add	[bp+var_24], eax
		mov	eax, [di+4]
		add	[bp+var_20], eax
		mov	eax, [di+8]
		add	[bp+var_1C], eax
		cmp	si, word_79E76
		jz	short loc_5F07B
		mov	word_79E76, si
		jmp	loc_5F1FC

loc_5F07B:
		or	si, si
		jnz	short loc_5F082
		jmp	loc_5F1FC

loc_5F082:
		mov	[bp+var_4], 0
		jmp	loc_5F1E6

loc_5F08A:
		mov	si, [bp+var_4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_5F0A3
		jmp	loc_5F1E6

loc_5F0A3:
		push	dx
		push	ax
		les	bx, word ptr [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jz	short loc_5F0B8
		jmp	loc_5F1E6

loc_5F0B8:
		cmp	si, [bp+var_2]
		jnz	short loc_5F0C0
		jmp	loc_5F1E6

loc_5F0C0:
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_5F0CD
		jmp	loc_5F1E6

loc_5F0CD:
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_30], eax
		mov	eax, [di+4]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		sub	[bp+var_3C], eax
		mov	eax, [bp+var_20]
		sub	[bp+var_38], eax
		mov	eax, [bp+var_1C]
		sub	[bp+var_34], eax
		push	large [bp+var_34]
		push	large [bp+var_38]
		push	large [bp+var_3C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		sar	eax, 8
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0C8h
		jl	short loc_5F14E
		jmp	loc_5F1E6

loc_5F14E:
		mov	eax, [bp+var_30]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_40], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_54]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_54]
		add	[bp+var_48], eax
		mov	eax, [bp+var_50]
		add	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		add	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_24]
		sub	[bp+var_60], eax
		mov	eax, [bp+var_20]
		sub	[bp+var_5C], eax
		mov	eax, [bp+var_1C]
		sub	[bp+var_58], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	dx, [bp+var_17]
		cmp	dx, 1Eh
		jle	short loc_5F1E6
		cmp	dx, 50h
		jle	short loc_5F1E2
		mov	al, 1
		jmp	short loc_5F1FE

loc_5F1E2:
		mov	al, 2
		jmp	short loc_5F1FE

loc_5F1E6:
		lea	ax, [bp+var_4]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_5F1FC
		jmp	loc_5F08A

loc_5F1FC:
		mov	al, 0

loc_5F1FE:
		pop	di
		pop	si
		leave
		retf
sub_5F005		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F202		proc far

var_2		= byte ptr -2
arg_0		= byte ptr  6
arg_2		= dword ptr  8
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_8]
		mov	dl, 0
		cmp	byte_7CB1C, 0
		jz	short loc_5F230
		cmp	word_79E73, 0
		jz	short loc_5F230
		push	si
		mov	al, [bp+arg_0]
		cbw
		push	ax
		push	word_79E73
		call	sub_5B12B
		add	sp, 6
		mov	dl, al

loc_5F230:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5F28B
		cmp	byte_7CB1A, 0
		jz	short loc_5F28B
		cmp	word_79E6D, 0
		jz	short loc_5F28B
		mov	al, [bp+arg_0]
		cbw
		cmp	ax, 9
		jnz	short loc_5F255
		mov	[bp+var_2], 9
		jmp	short loc_5F25E

loc_5F255:
		push	0D005h
		call	sub_1DDFE
		pop	cx

loc_5F25E:
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+var_2]
		push	ax
		push	word_79E6D
		call	SoundFX_Play3D_5C68A
		add	sp, 0Ah
		cmp	word_79E73, 0
		jz	short loc_5F28B
		push	si
		mov	al, [bp+var_2]
		push	ax
		push	word_79E73
		call	sub_5B328
		add	sp, 6

loc_5F28B:
		pop	si
		leave
		retf
sub_5F202		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F28E		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		push	cs
		call	near ptr sub_5F005
		mov	dl, al
		or	dl, dl
		jz	short loc_5F2CA
		cmp	byte_7CB1C, 0
		jz	short loc_5F2CA
		cmp	word_79E73, 0
		jz	short loc_5F2CA
		push	0
		cbw
		imul	ax, ax, 2EEh
		movsx	eax, ax
		push	eax
		push	0Ah
		push	word_79E73
		call	sub_5B04F
		add	sp, 0Ah

loc_5F2CA:
		cmp	byte_7CB1D, 0
		jz	short loc_5F339
		mov	[bp+var_1], 0
		cmp	byte_7CB1C, 0
		jz	short loc_5F30D
		cmp	word_79E73, 0
		jz	short loc_5F30D
		push	word_79E73
		call	sub_5B434
		pop	cx
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_5F30D
		cmp	word_79E6D, 0
		jz	short loc_5F30D
		push	0
		push	0Dh
		push	word_79E6D
		call	SoundFX_StopEffect_5C812
		add	sp, 6

loc_5F30D:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5F367
		cmp	byte_7CB1A, 0
		jz	short loc_5F367
		cmp	word_79E6D, 0
		jz	short loc_5F367
		mov	al, byte_7CB19
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5F367
		push	word_79E6D
		call	sub_5C90D
		pop	cx
		jmp	short loc_5F367

loc_5F339:
		cmp	word_79E73, 0
		jz	short loc_5F350
		push	0
		push	0Dh
		push	word_79E73
		call	sub_5B328
		add	sp, 6

loc_5F350:
		cmp	word_79E6D, 0
		jz	short loc_5F367
		push	0
		push	0Dh
		push	word_79E6D
		call	SoundFX_StopEffect_5C812
		add	sp, 6

loc_5F367:
		cmp	byte_7CB1A, 0
		jz	short loc_5F37F
		cmp	word_79E6D, 0
		jz	short loc_5F37F
		push	word_79E6D
		call	sub_5C898
		pop	cx

loc_5F37F:
		cmp	word_79E71, 0
		jz	short loc_5F390
		push	word_79E71
		call	sub_5E9F9
		pop	cx

loc_5F390:
		cmp	byte_7CB19, 0
		jz	short loc_5F3B0
		cmp	word_79E6F, 0
		jz	short loc_5F3B0
		test	word_7977C, 0Fh
		jnz	short loc_5F3B0
		push	word_79E6F
		call	sub_5BBF8
		pop	cx

loc_5F3B0:
		cmp	byte_7CB1C, 0
		jz	short loc_5F3C8
		cmp	word_79E73, 0
		jz	short loc_5F3C8
		push	word_79E73
		call	sub_5B206
		pop	cx

loc_5F3C8:
		leave
		retf
sub_5F28E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F3CA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, word_79E6B
		cmp	ax, word_79E67
		jz	short loc_5F3F0
		cmp	word_79E6B, 0
		jz	short loc_5F3F0
		push	3
		push	ax
		mov	bx, word_79E6B
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5F3F0

loc_5F3F0:
		cmp	word_79E6D, 0
		jz	short loc_5F40A
		push	3
		push	word_79E6D
		mov	bx, word_79E6D
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5F40A

loc_5F40A:
		mov	word_79E6D, 0
		cmp	word_79E6F, 0
		jz	short loc_5F42A
		push	3
		push	word_79E6F
		mov	bx, word_79E6F
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5F42A

loc_5F42A:
		mov	word_79E6F, 0
		cmp	word_79E67, 0
		jz	short loc_5F44A
		push	3
		push	word_79E67
		mov	bx, word_79E67
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5F44A

loc_5F44A:
		cmp	word_79E69, 0
		jz	short loc_5F464
		push	3
		push	word_79E69
		mov	bx, word_79E69
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5F464

loc_5F464:
		push	word_79E73
		call	sub_3B2
		pop	cx
		mov	word_79E73, 0
		xor	ax, ax
		mov	word_79E6B, ax
		mov	word_79E69, ax
		mov	word_79E67, ax
		pop	bp
		retf
sub_5F3CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F481		proc far
		push	bp
		mov	bp, sp
		mov	word_79E67, 0
		mov	word_79E69, 0
		mov	byte_79E66, 0
		pop	bp
		retf
sub_5F481		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F497		proc far
		push	bp
		mov	bp, sp
		push	6988h
		push	cs
sub_5F497		endp

; START OF FUNCTION CHUNK FOR sub_5F497
		db 0E8h, 29h
; END OF FUNCTION CHUNK FOR sub_5F497
seg139		ends
