seg125		segment	byte public 'CODE' use16
		assume cs:seg125
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_ApplyLayoutHelper_5A88F'. far. LUE 2026-10-06. Arrete tout : musique avec fondu
; (Music_StopAndResetCombat_AA831), tous les effets (SoundFX_StopAllEntry_AB583), la voix
; (Speech_StopPlayback_AB883), chacun s'il est actif (byte_7236B / 7236C / 7236D).
; ==============================================================================================
Sound_StopAll_5A88F	proc far		; CODE XREF: MissionScenario_ConstructAndBindUI_A81E0+12P
		push	bp
		mov	bp, sp
		cmp	byte_7236B, 0
		jz	short loc_5A8AA
		cmp	word_7099D, 0
		jz	short loc_5A8AA
		push	word_7099D
		call	VROOMM_StubThunk_6CFBE
		pop	cx

loc_5A8AA:				; CODE XREF: Sound_StopAll_5A88F+8j Sound_StopAll_5A88F+Fj
		cmp	byte_7236C, 0
		jz	short loc_5A8C2
		cmp	word_7099B, 0
		jz	short loc_5A8C2
		push	word_7099B
		call	VROOMM_StubThunk_6D01A
		pop	cx

loc_5A8C2:				; CODE XREF: Sound_StopAll_5A88F+20j
					; Sound_StopAll_5A88F+27j
		cmp	byte_7236D, 0
		jz	short loc_5A8DA
		cmp	word_7099F, 0
		jz	short loc_5A8DA
		push	word_7099F
		call	VROOMM_StubThunk_6D05F
		pop	cx

loc_5A8DA:				; CODE XREF: Sound_StopAll_5A88F+38j
					; Sound_StopAll_5A88F+3Fj
		pop	bp
		retf
Sound_StopAll_5A88F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Weapon_HUDBox_TimerCaseH_5A8DC'. far. LUE 2026-10-06. Facade publique (si effets actifs,
; byte_7236C, objet word_7099B) : SoundFX_Play3D_59902(effet, distance, emetteur).
; ==============================================================================================
SoundFX_Play_5A8DC	proc far		; CODE XREF: Debris_SpawnOrchestrator+1B9P
					; seg087:00B9P	...

arg_0		= byte ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		cmp	byte_7236C, 0
		jz	short loc_5A904
		cmp	word_7099B, 0
		jz	short loc_5A904
		push	[bp+arg_6]
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_7099B
		call	SoundFX_Play3D_59902
		add	sp, 0Ah

loc_5A904:				; CODE XREF: SoundFX_Play_5A8DC+8j SoundFX_Play_5A8DC+Fj
		pop	bp
		retf
SoundFX_Play_5A8DC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Weapon_HUDBox_TimerCaseI_5A906'. far. LUE 2026-10-06. Facade : demarre l'effet s'il ne
; joue pas, sinon met a jour son volume selon la distance.
; ==============================================================================================
SoundFX_PlayOrUpdate_5A906	proc far		; CODE XREF: Cockpit_DetectPlayerMissile+192P
					; HUD_RenderSymbologyAlt:loc_400C2P

arg_0		= byte ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_6]
		cmp	byte_7236C, 0
		jz	short loc_5A95B
		cmp	word_7099B, 0
		jz	short loc_5A95B
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_7099B
		call	SoundFX_IsPlaying_59AD7
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5A946
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_7099B
		call	SoundFX_Play3D_59902
		jmp	short loc_5A958
; ���������������������������������������������������������������������������

loc_5A946:				; CODE XREF: SoundFX_PlayOrUpdate_5A906+2Aj
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_7099B
		call	SoundFX_UpdateVolume3D_599D3

loc_5A958:				; CODE XREF: SoundFX_PlayOrUpdate_5A906+3Ej
		add	sp, 0Ah

loc_5A95B:				; CODE XREF: SoundFX_PlayOrUpdate_5A906+Cj
					; SoundFX_PlayOrUpdate_5A906+13j
		pop	si
		pop	bp
		retf
SoundFX_PlayOrUpdate_5A906	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Weapon_HUDBox_TimerCaseJ_5A95E'. far. LUE 2026-10-06. Facade :
; SoundFX_StopEffect_59A8A(effet, emetteur).
; ==============================================================================================
SoundFX_Stop_5A95E	proc far		; CODE XREF: Resource_InitTwoChannels+7P
					; Resource_InitTwoChannels+13P ...

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_7236C, 0
		jz	short loc_5A982
		cmp	word_7099B, 0
		jz	short loc_5A982
		push	[bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_7099B
		call	SoundFX_StopEffect_59A8A
		add	sp, 6

loc_5A982:				; CODE XREF: SoundFX_Stop_5A95E+8j SoundFX_Stop_5A95E+Fj
		pop	bp
		retf
SoundFX_Stop_5A95E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'TextObject_AllocateVariantA_5A984' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). ★ far — SÉLECTEUR DE PISTE MUSICALE (moteur XMIDI/AIL).
; Anciennement mal étiquetée Music_RequestTune_5A984. Signature (tune_id: word) : borne
; tune_id contre word_7084C (nb de pistes max) ; si valide, écrit dans word_70859 (piste
; couramment jouée, init 0xFFFF) ; si invalide (sauf sentinelle 0xFF, probablement 'aucune
; piste'/stop) → log "Invalid tune requested: %d" (aInvalidTuneReq, seg339) via sub_5F700.
; Appelée depuis au moins 10 sites dans des segments très divers (seg114 UI,
; ovr230/239/240/243/316 logique mission) avec des tune_id différents selon le contexte (0x08
; à 0x15 identifiés) — voir MUSIC_SYSTEM.md pour la table complète des déclencheurs. Piste de
; mission de base : lue depuis le chunk IFF TUNE (MissionScenario_LoadMainRecord_A8331) dans
; byte_706A2, jouée à l'ouverture d'écran par sub_53896 (UIScreen_Construct).
; ==============================================================================================
Music_RequestTune_5A984	proc far		; CODE XREF: STRIKE_EXE_MAIN_LOOP+1BP
					; World_OnObjectDestroyed_53A94:loc_53CC1P	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_7236B, 0
		jz	short loc_5A9B8
		cmp	word_7099D, 0
		jz	short loc_5A9B8
		mov	dx, [bp+arg_0]
		cmp	dx, word_7084C
		jge	short loc_5A9A4
		mov	word_70859, dx
		jmp	short loc_5A9B8
; ���������������������������������������������������������������������������

loc_5A9A4:				; CODE XREF: Music_RequestTune_5A984+18j
		cmp	dx, 0FFh
		jz	short loc_5A9B8
		push	dx
		push	38F2h
		call	Runtime_FatalErrorHandler_5F700
		add	sp, 4
		jmp	short $+2

loc_5A9B8:				; CODE XREF: Music_RequestTune_5A984+8j Music_RequestTune_5A984+Fj ...
		pop	bp
		retf
Music_RequestTune_5A984	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5A9BA'. far. LUE 2026-10-06. Facade : Music_PauseChannels_AB16F.
; ==============================================================================================
Music_Pause_5A9BA	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC:loc_8EF4BP
		push	bp
		mov	bp, sp
		cmp	word_7099D, 0
		jz	short loc_5A9CE
		push	word_7099D
		call	VROOMM_StubThunk_6CFD2
		pop	cx

loc_5A9CE:				; CODE XREF: Music_Pause_5A9BA+8j
		pop	bp
		retf
Music_Pause_5A9BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5A9D0'. far. LUE 2026-10-06. Facade : Music_ResumeChannels_AB1AF.
; ==============================================================================================
Music_Resume_5A9D0	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC:loc_8F42CP
		push	bp
		mov	bp, sp
		cmp	word_7099D, 0
		jz	short loc_5A9E4
		push	word_7099D
		call	VROOMM_StubThunk_6CFD7
		pop	cx

loc_5A9E4:				; CODE XREF: Music_Resume_5A9D0+8j
		pop	bp
		retf
Music_Resume_5A9D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5A9E6'. far. LUE 2026-10-06. Facade (appelee par STRIKE_EXE_MAIN_LOOP) :
; Music_StopWithFade_AB1EF(fondu = argument).
; ==============================================================================================
Music_Stop_5A9E6	proc far		; CODE XREF: Config_ReadCalibration:loc_270D5P
					; STRIKE_EXE_MAIN_LOOP+1F1P ...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	word_7099D, 0
		jz	short loc_5AA00
		mov	al, [bp+arg_0]
		push	ax
		push	word_7099D
		call	VROOMM_StubThunk_6CFDC
		add	sp, 4

loc_5AA00:				; CODE XREF: Music_Stop_5A9E6+8j
		pop	bp
		retf
Music_Stop_5A9E6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Weapon_HUDBox_InstantiateInstance_5AA02'. far. LUE 2026-10-06. Piste de depart (appelee
; par Cockpit_LoadAndDrawCalibration_8FDC0) : si Music_CombatIntensitySelector_59302 ne
; choisit rien : ennemis proches (Music_ScanNearbyEnemies_590E0) -> 4 si byte_70869 sinon 0x13
; ; sinon piste de la mission byte_706A2 (chunk TUNE) ; Music_RequestTune_5A984.
; ==============================================================================================
Music_SelectStartTune_5AA02	proc far		; CODE XREF: Config_ReadCalibration:loc_27100P
					; Cockpit_LoadAndDrawCalibration_8FDC0+2C2P
		push	bp
		mov	bp, sp
		cmp	word_7099D, 0
		jz	short loc_5AA47
		push	word_7099D
		call	Music_CombatIntensitySelector_59302
		pop	cx
		cmp	ax, 0FFFFh
		jnz	short loc_5AA47
		push	0
		push	word_7099D
		call	Music_ScanNearbyEnemies_590E0
		add	sp, 4
		or	al, al
		jz	short loc_5AA3C
		cmp	byte_70869, 0
		jz	short loc_5AA38
		push	4
		jmp	short loc_5AA42
; ���������������������������������������������������������������������������

loc_5AA38:				; CODE XREF: Music_SelectStartTune_5AA02+30j
		push	13h
		jmp	short loc_5AA42
; ���������������������������������������������������������������������������

loc_5AA3C:				; CODE XREF: Music_SelectStartTune_5AA02+29j
		mov	al, byte_706A2
		mov	ah, 0
		push	ax

loc_5AA42:				; CODE XREF: Music_SelectStartTune_5AA02+34j
					; Music_SelectStartTune_5AA02+38j
		push	cs
		call	near ptr Music_RequestTune_5A984
		pop	cx

loc_5AA47:				; CODE XREF: Music_SelectStartTune_5AA02+8j
					; Music_SelectStartTune_5AA02+17j
		pop	bp
		retf
Music_SelectStartTune_5AA02	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Weapon_HUDBox_UpdateAndRenderVariant_5AA49'. far. LUE 2026-10-06. Appelee par
; Combat_TeamOpposedCheckAndDispatch_53A94 a la destruction d'un objet :
; Music_SelectTuneCandidate_5923A(musique, 1, objet detruit).
; ==============================================================================================
Music_OnObjectDestroyed_5AA49	proc far		; CODE XREF: World_OnObjectDestroyed_53A94+1F2P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7236B, 0
		jz	short loc_5AA6F
		cmp	word_7099D, 0
		jz	short loc_5AA6F
		push	[bp+arg_0]
		push	1
		push	word_7099D
		call	Music_SelectTuneCandidate_5923A
		add	sp, 6
		mov	dl, al

loc_5AA6F:				; CODE XREF: Music_OnObjectDestroyed_5AA49+Aj
					; Music_OnObjectDestroyed_5AA49+11j
		mov	al, dl
		pop	bp
		retf
Music_OnObjectDestroyed_5AA49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5AA73'. far. LUE 2026-10-06. Desactive les effets (byte_7236C = 0) apres
; avoir arrete tous les canaux.
; ==============================================================================================
SoundFX_Disable_5AA73	proc far		; CODE XREF: Config_ReadCalibration+19FP
		push	bp
		mov	bp, sp
		cmp	byte_7236C, 0
		jz	short loc_5AA93
		cmp	word_7099B, 0
		jz	short loc_5AA93
		mov	byte_7236C, 0
		push	word_7099B
		call	VROOMM_StubThunk_6D029
		pop	cx

loc_5AA93:				; CODE XREF: SoundFX_Disable_5AA73+8j SoundFX_Disable_5AA73+Fj
		pop	bp
		retf
SoundFX_Disable_5AA73	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5AA95'. far. LUE 2026-10-06. Arrete tous les canaux d'effets
; (SoundFX_StopAllChannels_AB770).
; ==============================================================================================
SoundFX_StopAll_5AA95	proc far		; CODE XREF: Config_ReadCalibration+138P
		push	bp
		mov	bp, sp
		cmp	byte_7236C, 0
		jz	short loc_5AAB0
		cmp	word_7099B, 0
		jz	short loc_5AAB0
		push	word_7099B
		call	VROOMM_StubThunk_6D029
		pop	cx

loc_5AAB0:				; CODE XREF: SoundFX_StopAll_5AA95+8j SoundFX_StopAll_5AA95+Fj
		pop	bp
		retf
SoundFX_StopAll_5AA95	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5AAB2'. far. LUE 2026-10-06. Facade voix (byte_7236D, objet word_7099F)
; appelee par PilotProfile_LoadRADI_8DF49 : AudioQueue_LoadFromMultipleReaders_AB9D7.
; ==============================================================================================
Speech_LoadBank_5AAB2	proc far		; CODE XREF: UIScreen_ClearAndLoadResource_869C0+187P
					; PilotProfile_LoadRADI_8DF49+145P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_7236D, 0
		jz	short loc_5AAD5
		cmp	word_7099F, 0
		jz	short loc_5AAD5
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_7099F
		call	VROOMM_StubThunk_6D064
		add	sp, 6

loc_5AAD5:				; CODE XREF: Speech_LoadBank_5AAB2+8j Speech_LoadBank_5AAB2+Fj
		pop	bp
		retf
Speech_LoadBank_5AAB2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5AAD7'. far. LUE 2026-10-06. Facade voix appelee par Audio_LoadSpeechClip
; : AudioQueue_MainProcessEntry_ABBEF (lecture VOC via AIL_play_VOC_file_6034E).
; ==============================================================================================
Speech_PlayClip_5AAD7	proc far		; CODE XREF: Cockpit_LoadBettyPack+33P
					; Audio_LoadSpeechClip+3CP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7236D, 0
		jz	short loc_5AB05
		cmp	word_7099F, 0
		jz	short loc_5AB05
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_7099F
		call	VROOMM_StubThunk_6D095
		add	sp, 0Ah
		mov	dl, al

loc_5AB05:				; CODE XREF: Speech_PlayClip_5AAD7+Aj
					; Speech_PlayClip_5AAD7+11j
		mov	al, dl
		pop	bp
		retf
Speech_PlayClip_5AAD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5AB09'. far. LUE 2026-10-06. Ecrit l'argument dans le champ +0x49 de
; l'objet voix (role non trace).
; ==============================================================================================
Speech_SetField49_5AB09	proc far		; CODE XREF: Cockpit_LoadBettyPack+41P

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	byte_7236D, 0
		jz	short locret_5AB2A
		cmp	word_7099F, 0
		jz	short locret_5AB2A
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		mov	bx, word_7099F
		mov	[bx+49h], ax

locret_5AB2A:				; CODE XREF: Speech_SetField49_5AB09+Bj
					; Speech_SetField49_5AB09+12j
		leave
		retf
Speech_SetField49_5AB09	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Widget_Helper_5AB2C'. far. LUE 2026-10-06. Facade voix appelee par
; RadioQueue_RegisterMessage : AudioQueue_OpcodeHelper_ABDAF (statut de lecture VOC).
; ==============================================================================================
Speech_QueryStatus_5AB2C	proc far		; CODE XREF: Radio_PlayerSpottedCallout+104P
					; RadioQueue_RegisterMessage+6FP

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_7236D, 0
		jz	short loc_5AB51
		cmp	word_7099F, 0
		jz	short loc_5AB51
		mov	al, [bp+arg_0]
		push	ax
		push	word_7099F
		call	VROOMM_StubThunk_6D09A
		add	sp, 4
		mov	dl, al

loc_5AB51:				; CODE XREF: Speech_QueryStatus_5AB2C+Aj
					; Speech_QueryStatus_5AB2C+11j
		mov	al, dl
		pop	bp
		retf
Speech_QueryStatus_5AB2C	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	word_7099F, 0
		jz	short loc_5AB77
		mov	bx, word_7099F
		cmp	word ptr [bx+34h], 0
		jz	short loc_5AB77
		mov	bx, [bx+34h]
		push	word ptr [bx+4]
		call	AIL_stop_digital_playback_60366
		pop	cx
		jmp	short $+2

loc_5AB77:				; CODE XREF: seg125:02DDj seg125:02E7j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Weapon_HUDBox_FullUpdateCycle_5AB79'. far. LUE 2026-10-06. Mise a jour son de chaque
; frame : SoundFX_Tick_59CFA, tick de la voix (AudioQueue_FinalizeAndRelease_ABDEC), et
; Music_CombatIntensitySelector_59302 une frame sur 16 ('test word_70466, 0Fh').
; ==============================================================================================
Sound_FrameUpdate_5AB79	proc far		; CODE XREF: Config_ReadCalibration+1A7P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_7236C, 0
		jz	short loc_5AB97
		cmp	word_7099B, 0
		jz	short loc_5AB97
		push	word_7099B
		call	SoundFX_Tick_59CFA
		pop	cx

loc_5AB97:				; CODE XREF: Sound_FrameUpdate_5AB79+Bj
					; Sound_FrameUpdate_5AB79+12j
		cmp	byte_7236D, 0
		jz	short loc_5ABAF
		cmp	word_7099F, 0
		jz	short loc_5ABAF
		push	word_7099F
		call	VROOMM_StubThunk_6D09F
		pop	cx

loc_5ABAF:				; CODE XREF: Sound_FrameUpdate_5AB79+23j
					; Sound_FrameUpdate_5AB79+2Aj
		cmp	byte_7236B, 0
		jz	short loc_5ABCF
		cmp	word_7099D, 0
		jz	short loc_5ABCF
		test	word_70466, 0Fh
		jnz	short loc_5ABCF
		push	word_7099D
		call	Music_CombatIntensitySelector_59302
		pop	cx

loc_5ABCF:				; CODE XREF: Sound_FrameUpdate_5AB79+3Bj
					; Sound_FrameUpdate_5AB79+42j ...
		pop	bp
		retf
Sound_FrameUpdate_5AB79	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 190 lignes, NON DÉTAILLÉE — destructeur global du cluster objets-texte : ferme deux
; objets texte (Music_ShutdownDriver_5A856 ×2) et libère plusieurs buffers
; (sub_5C7B6/sub_338). Référencée en interne (thunk vtable loc_5ADEF).
; ==============================================================================================
TextObjectCluster_DestructAll_5ABD1	proc far		; CODE XREF: seg125:0576p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_7099B, 0
		jz	short loc_5AC33
		mov	bx, word_7099B
		mov	word ptr [bx], 1382h
		push	bx
		call	VROOMM_StubThunk_6D024
		pop	cx
		push	seg seg125
		push	offset TextObject_ScalarDeletingDtor_5ADFC
		push	large 10005h
		push	11h
		mov	ax, word_7099B
		add	ax, 92h	; '�'
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADA5
		push	large 1000Eh
		push	0Ah
		mov	ax, word_7099B
		add	ax, 6
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	word_7099B
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_5AC33:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+Bj
		mov	word_7099B, 0
		cmp	word_7099D, 0
		jz	short loc_5AC5B
		mov	bx, word_7099D
		mov	word ptr [bx], 1386h
		push	bx
		call	VROOMM_StubThunk_6CFCD
		pop	cx
		push	word_7099D
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_5AC5B:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+6Dj
		mov	word_7099D, 0
		cmp	word_70997, 0
		jnz	short loc_5AC6B
		jmp	loc_5AD16
; ���������������������������������������������������������������������������

loc_5AC6B:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+95j
		mov	bx, word_70997
		mov	word ptr [bx], 13A2h
		push	bx
		call	Music_ShutdownDriver_5A856
		pop	cx
		push	0
		mov	ax, word_70997
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	bx, word_70997
		cmp	byte ptr [bx+19h], 0
		jz	short loc_5ACB6
		cmp	dword ptr [bx+14h], 0
		jz	short loc_5ACB6
		push	0
		mov	al, [bx+18h]
		push	ax
		mov	ax, word_70997
		add	ax, 14h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5ACB6:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+C2j
					; TextObjectCluster_DestructAll_5ABD1+C9j
		mov	bx, word_70997
		mov	dword ptr [bx+14h], 0
		mov	byte ptr [bx+19h], 0
		mov	dword ptr [bx+1Ah], 0
		cmp	byte ptr [bx+0Fh], 0
		jz	short loc_5ACF5
		cmp	dword ptr [bx+0Ah], 0
		jz	short loc_5ACF5
		push	0
		mov	al, [bx+0Eh]
		push	ax
		mov	ax, word_70997
		add	ax, 0Ah
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5ACF5:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+101j
					; TextObjectCluster_DestructAll_5ABD1+108j
		mov	bx, word_70997
		mov	dword ptr [bx+0Ah], 0
		mov	byte ptr [bx+0Fh], 0
		mov	dword ptr [bx+10h], 0
		push	bx
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_5AD16:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+97j
		mov	word_70997, 0
		cmp	word_70999, 0
		jnz	short loc_5AD26
		jmp	loc_5ADD1
; ���������������������������������������������������������������������������

loc_5AD26:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+150j
		mov	bx, word_70999
		mov	word ptr [bx], 13A2h
		push	bx
		call	Music_ShutdownDriver_5A856
		pop	cx
		push	0
		mov	ax, word_70999
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	bx, word_70999
		cmp	byte ptr [bx+19h], 0
		jz	short loc_5AD71
		cmp	dword ptr [bx+14h], 0
		jz	short loc_5AD71
		push	0
		mov	al, [bx+18h]
		push	ax
		mov	ax, word_70999
		add	ax, 14h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5AD71:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+17Dj
					; TextObjectCluster_DestructAll_5ABD1+184j
		mov	bx, word_70999
		mov	dword ptr [bx+14h], 0
		mov	byte ptr [bx+19h], 0
		mov	dword ptr [bx+1Ah], 0
		cmp	byte ptr [bx+0Fh], 0
		jz	short loc_5ADB0
		cmp	dword ptr [bx+0Ah], 0
		jz	short loc_5ADB0
		push	0
		mov	al, [bx+0Eh]
		push	ax
		mov	ax, word_70999
		add	ax, 0Ah
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5ADB0:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+1BCj
					; TextObjectCluster_DestructAll_5ABD1+1C3j
		mov	bx, word_70999
		mov	dword ptr [bx+0Ah], 0
		mov	byte ptr [bx+0Fh], 0
		mov	dword ptr [bx+10h], 0
		push	bx
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_5ADD1:				; CODE XREF: TextObjectCluster_DestructAll_5ABD1+152j
		mov	word_70999, 0
		pop	bp
		retf
TextObjectCluster_DestructAll_5ABD1	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), initialise les globales d'état du cluster
; objets-texte (word_70997/70999, byte_70996).
; ==============================================================================================
TextObjectCluster_InitState_5ADD9:				; DATA XREF: seg339:4E76o
		push	bp
		mov	bp, sp
		mov	word_70997, 0
		mov	word_70999, 0
		mov	byte_70996, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant
; TextObjectCluster_DestructAll_5ABD1(0x5C06).
; ==============================================================================================
TextObjectCluster_DtorThunk_5ADEF:				; DATA XREF: seg339:off_71FE0o
		push	bp
		mov	bp, sp
		push	5C06h
		push	cs
		call	near ptr TextObjectCluster_DestructAll_5ABD1
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée comme donnée par TextObjectCluster_DestructAll_5ABD1 — destructeur scalar-
; deleting d'un objet texte individuel : avance/désactive son créneau de séquenceur
; (Music_ChannelStopSequence_59F1D), libère son buffer (sub_5C7B6, type 5C44h), réinitialise
; ses champs, libère l'objet lui-même si demandé (sub_338).
; ==============================================================================================
TextObject_ScalarDeletingDtor_5ADFC:				; DATA XREF: TextObjectCluster_DestructAll_5ABD1+1Fo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_5AE5B
		push	si
		call	Music_ChannelStopSequence_59F1D
		pop	cx
		cmp	byte ptr [si+9], 0
		jz	short loc_5AE38
		cmp	dword ptr [si+4], 0
		jz	short loc_5AE38
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5AE38:				; CODE XREF: seg125:0596j seg125:059Dj
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1

loc_5AE50:
		jz	short loc_5AE5B
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_5AE5B:				; CODE XREF: seg125:0589j
					; seg125:loc_5AE50j
		pop	di
		pop	si
		pop	bp
		retf
seg125		ends
