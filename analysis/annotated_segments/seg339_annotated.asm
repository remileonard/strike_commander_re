seg339		segment	para public '' use16
		assume cs:seg339
unk_6D0B0	db    0			; DATA XREF: Program_InitVideoFontArgs+60o
					; Render_MeshPrimitive_216F6+727o ...
		db    0
word_6D0B2	dw 0			; DATA XREF: VROOMM_Helper_68384+23w
word_6D0B4	dw 6F42h		; DATA XREF: VROOMM_Helper_68384+27w
byte_6D0B6	db 72h			; DATA XREF: VROOMM_Helper_68384:loc_683CCr
					; VROOMM_CheckDOSVersionAndOpen_68405:loc_6840Dw
		db  6Ch	; l
		db  61h	; a
		db  6Eh	; n
off_6D0BA	dw offset loc_2063+1	; DATA XREF: CRT_FlushSprintfBuf+13r
off_6D0BC	dw offset CRT_Memcmp_Bounded	; DATA XREF: VROOMM_Helper3_686AA:loc_686EEr
off_6D0BE	dw offset Stdio_LoadFileTable	; DATA XREF: VROOMM_AllocateAndRelocate_6855F:loc_68600w
					; VROOMM_ApplyRelocationsMain_687E8+28w ...
off_6D0C0	dw offset Stdio_LoadFileTable+2	; DATA XREF: VROOMM_CheckImageHasTrailer_68863:loc_6886Fr
aCopyright1991B	db 'Copyright 1991 Borland Intl.',0 ; DATA XREF: VROOMM_Helper_68384:loc_683C6o
					; VROOMM_CheckCopyright_683F9:loc_683FAo	...
aNullPointerAss	db 'Null pointer assignment',0Dh,0Ah
		db 'Divide error',0Dh,0Ah
		db 'Abnormal program termination',0Dh,0Ah,0
		db    0
unk_6D126	db    0			; DATA XREF: CRT_SaveIntVectors+Aw
		db    0
dword_6D128	dd 0			; DATA XREF: CRT_SaveIntVectors+13w CRT_RestoreIntVectors+Fr ...
dword_6D12C	dd 0			; DATA XREF: CRT_SaveIntVectors+20w CRT_RestoreIntVectors+1Ar ...
dword_6D130	dd 0			; DATA XREF: CRT_SaveIntVectors+2Dw CRT_RestoreIntVectors+25r ...
word_6D134	dw 0			; DATA XREF: EntryPoint_RuntimeInit+154r
word_6D136	dw 0			; DATA XREF: EntryPoint_RuntimeInit+150r
word_6D138	dw 0			; DATA XREF: EntryPoint_RuntimeInit+14Cr
word_6D13A	dw 0			; DATA XREF: EntryPoint_RuntimeInit+46w
word_6D13C	dw 0			; DATA XREF: EntryPoint_RuntimeInit:loc_1Dw EntryPoint_RuntimeInit+28r ...
word_6D13E	dw 0			; DATA XREF: EntryPoint_RuntimeInit+55w
word_6D140	dw 0			; DATA XREF: EntryPoint_RuntimeInit+19w	EntryPoint_RuntimeInit+ABr ...
word_6D142	dw 0			; DATA XREF: EntryPoint_RuntimeInit+16w	EntryPoint_RuntimeInit+D9r ...
word_6D144	dw 0			; DATA XREF: CRT_ClampMathIndex:loc_514w
					; CRT_AllocaGuard:loc_16FDw ...
word_6D146	dw 0			; DATA XREF: EntryPoint_RuntimeInit+124w
word_6D148	dw 0			; DATA XREF: EntryPoint_RuntimeInit+128w
		db 0AAh	; �
		db  5Eh	; ^
word_6D14C	dw 5EAAh		; DATA XREF: CRT_AllocaGuard+10w CRT_AllocaGrow+9r	...
		align 4
word_6D150	dw 0			; DATA XREF: EntryPoint_RuntimeInit+A3w	VROOMM_PatchIntTrampoline_688F5+26r
		align 4
word_6D154	dw 0			; DATA XREF: EntryPoint_RuntimeInit+A7w
					; VROOMM_ReadAndParseHeader_684DF:loc_68530r
word_6D156	dw 0			; DATA XREF: VROOMM_ReadAndParseHeader_684DF:loc_68533r
word_6D158	dw 0			; DATA XREF: EntryPoint_RuntimeInit:loc_21w EntryPoint_RuntimeInit+107w	...
word_6D15A	dw 4Fh			; DATA XREF: VROOMM_ReadAndParseHeader_684DF+7Bw
seg_6D15C	dw seg seg047		; DATA XREF: VROOMM_ApplyRelocationsMain_687E8w
off_6D15E	dd VROOMM_StubThunk_6AA48		; DATA XREF: VROOMM_AllocateAndRelocate_6855F+52w
					; VROOMM_AllocateAndFinalize_6879E:loc_687E0r	...
word_6D162	dw 4Fh			; DATA XREF: VROOMM_AllocateAndRelocate_6855Fr
seg_6D164	dw seg seg047		; DATA XREF: VROOMM_AllocateAndRelocate_6855F+Ar
					; VROOMM_AllocateAndRelocate_6855F+56r ...
word_6D166	dw 4Dh			; DATA XREF: VROOMM_AllocateAndRelocate_6855F+Er
					; VROOMM_PatchFarJumpTable_6887B+14r ...
seg_6D168	dw seg stub227		; DATA XREF: VROOMM_Helper_68384+2Br
					; VROOMM_Helper_68384+32r ...
word_6D16A	dw 2Ah			; DATA XREF: VROOMM_AllocateAndFinalize_6879E+1w
seg_6D16C	dw seg stub227		; DATA XREF: VROOMM_AllocateAndRelocate_6855F:loc_68563w
					; VROOMM_AllocateAndRelocate_6855F+6Cr ...
off_6D16E	dd VROOMM_StubThunk_6AA25		; DATA XREF: VROOMM_ReadAndParseHeader_684DF:loc_684F8o
off_6D172	dd VROOMM_StubThunk_6AA20
		dd VROOMM_StubThunk_6AA39
		dd VROOMM_StubThunk_6AA3E
aIntel_0	db 'INTEL',0            ; DATA XREF: PilotProfile_LoadFromPROF_73B4F+1Bo
					; PilotProfile_LoadNUMSCompanionFile_73FB4+47o ...
dword_6D184	dd 0			; DATA XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+268w
					; AircraftDamageComponent_Method_NoOp_74F84+3w
unk_6D188	db    0			; DATA XREF: PilotProfile_LoadFromPROF_73B4F+42Co
		db    0
		db    0
		db    0
		db    0
unk_6D18D	db    0
		db    0
		db    0
off_6D190	dd Goal_ExecuteAction_A8AC		; DATA XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+1Eo
algn_6D194:
		align 8
off_6D198	dd Goal_WanderRandom		; DATA XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+28o
		align 8
off_6D1A0	dd AI_BehaviorStateMachine_WeightedOptionSelector_9D05		; DATA XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+32o
		align 8
off_6D1A8	dd Goal_MoraleReaction_878F		; DATA XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+3Co
		align 8
unk_6D1B0	db    0			; DATA XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+4Fo
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_6D1B8	db    0			; DATA XREF: AIEntity_Construct_74B43+1AFo
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dd AIEntity_CreateByType_12B4E
		dd VROOMM_StubThunk_6AB0C
		dd loc_4F85
		dd AIEntity_MasterTick_5ACC
off_6D1D0	dd Goal_SetObjective_A307
off_6D1D4	dd loc_8142
		dd AI_ProximityRadioCalloutTrigger_A002
		dd AI_PropagateAircraftFlagsAndFollowGate_A1DF
		dd loc_1297E
		dd loc_129D7
		dd VROOMM_StubThunk_6AAE4
		dd loc_4F6A
		dd loc_11AC4
		dd loc_11B16
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AADF
off_6D200	dd MVRS_ID21_ScorePlaceholder_4F54
		dd MVRS_ID21_ApplyStoreNavCommand_1195A
		dd MVRS_ID21_TickApplyGuidance_11A04
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AADA
		dd VROOMM_StubThunk_6ABE9
		dd VROOMM_StubThunk_6ABEE
		dd VROOMM_StubThunk_6ABE4
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAD5
		dd MVRS_ID19_ScoreFuelOrResource_4ECD
		dd MVRS_ID19_ApplyReturnToBase_118C3
off_6D230	dd loc_1191D
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAD0
		dd MVRS_ID16_ScoreThreatSensor_4E2A
off_6D240	dd MVRS_ID16_ApplyPersistence_11809
off_6D244	dd loc_1186E
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AACB
		dd MVRS_ID15b_ScoreIntercept_4CD1
		dd MVRS_ID15b_ApplyPersistence_11763
		dd loc_117B4
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAC6
		dd MVRS_ID13_ScoreScissorsRollaway_4A99
		dd MVRS_ID14b_ApplySetTimer_1138F
		dd MVRS_ID14b_TickManeuverSequence_113FD
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAC1
		dd MVRS_ID12_ScorePlaceholder_4A71
		dd MVRS_ID12_ApplyTrivialDelegate_11369
		dd MVRS_ID13_TickTrivialDelegate_1137E
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AABC
		dd MVRS_ID11_ScorePlaceholder_4A49
off_6D290	dd MVRS_ID11_ApplyTrivialDelegate_11343
		dd loc_11358
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAB7
		dd MVRS_ID10_ScorePlaceholder_4A2A
		dd MVRS_ID10_ApplyTrivialDelegate_1131D
		dd loc_11332
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAB2
		dd MVRS_ID9_ScorePlaceholder_4A02
		dd MVRS_ID9_ApplyTrivialDelegate_112F7
		dd loc_1130C
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAAD
		dd MVRS_ID9_ScorePlaceholder_49DA
		dd MVRS_ID8_ApplyTrivialDelegate_1115D
off_6D2D0	dd loc_111AE
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAA8
		dd MVRS_ID7_ScoreManeuverFuelGated_47D4
		dd MVRS_ID7_ApplyFuelGatedTimer_10AF2
		dd loc_10BD9
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AAA3
		dd MVRS_ID6_ScoreSensorGatedSubmode_45BE
		dd MVRS_ID6_ApplySetTimer_1060A
		dd loc_10673
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AA9E
		dd MVRS_ID5_ScoreSubmodeManeuver_434E
		dd MVRS_ID6_ApplySetTimer_100B6
		dd MVRS_ID6_TimerTickAndSubmodeSwitch_1011F
off_6D310	dd MVRS_SharedDefaultTickNoOp_ED16
off_6D314	dd VROOMM_StubThunk_6AA99
		dd MVRS_ID4_ScoreAngularExtended_41DD
off_6D31C	dd MVRS_ID4_ApplyInterceptSolution_FCE1
off_6D320	dd loc_FE39
off_6D324	dd MVRS_SharedDefaultTickNoOp_ED16
off_6D328	dd VROOMM_StubThunk_6AA94
off_6D32C	dd MVRS_ID3_ScoreAngularSimple_4128
		dd MVRS_ID3_ApplyGenericTimer_F6C2
off_6D334	dd MVRS_ID4_TrackingStateMachine_F72B
off_6D338	dd MVRS_SharedDefaultTickNoOp_ED16
off_6D33C	dd VROOMM_StubThunk_6AA8F
off_6D340	dd MVRS_ID3_ScoreGeneric_3FCB
		dd MVRS_ID3_ApplyBreakDirection_F2C8
		dd loc_F3B6
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AA8A
		dd MVRS_SharedContextSyncAndID2Score_EC22
		dd VROOMM_StubThunk_6AB4F
		dd loc_26F6F
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd VROOMM_StubThunk_6AA85
		dd MVRS_ID1_ScoreAngularGuarded_3E90
		dd loc_EEA0
		dd loc_F0C3
		dd MVRS_SharedDefaultTickNoOp_ED16
		dd StreamReader_DestructWrapper_659C1
		dd StreamReader_ReleaseBuffer_65643
		dd StreamReader_Method_ReturnTrue_6403C
		dd StreamReader_Method_GrowBuffer_6552E
		dd StreamReader_ConstructMinimal_6599C
		dd StreamReader_ReadDispatch_63D0E
		dd ResourceRecord_Construct_6450B
		dd VROOMM_StubThunk_6AA80
		dd ResourceRecord_RefreshPosition_6455E
		dd ResourceRecord_Method_ResolveOptionalField_649F0
		dd ResourceRecord_Method_GetType_64E05
		dd StreamReader_ReadDispatch_63D0E
		dd VROOMM_StubThunk_6AB40
		dd MVRS_SharedContextSyncAndID2Score_EC22
		dd VROOMM_StubThunk_6AB4F
		dd loc_26F6F
		dd MVRS_SharedDefaultTickNoOp_ED16
word_6D3BC	dw 0			; DATA XREF: seg003:0E1Cw seg003:0E38r ...
dword_6D3BE	dd 0			; DATA XREF: seg004:loc_A2FCw
					; seg010:04F9w	...
		dd GenericSmallObject_Destructor_B8C1
		dd loc_11BED
		dd loc_11D03
		dd loc_1208C
off_6D3D2	dd MVRS_SharedDefaultTickNoOp_ED16
		dd GenericSmallObject_Destructor_B90A
		dd VROOMM_StubThunk_6ABA3
		dd VROOMM_StubThunk_6ABA8
off_6D3E2	dd VROOMM_StubThunk_6AB9E
		dd MVRS_SharedDefaultTickNoOp_ED16
aLandgear_0	db 'LANDGEAR',0         ; DATA XREF: AITargeting_RenderThreatList_75746+10Fo
aLandingGearDam	db 'Landing Gear Damaged',0 ; DATA XREF: AITargeting_RenderThreatList_75746+14Bo
aLanding	db 'LANDING',0          ; DATA XREF: AITargeting_UpdateAndRender_75C18+95o
aTakeoff	db 'TAKEOFF',0          ; DATA XREF: seg009:01C1o
		dd PilotProfile_LoadATRB_12E47
off_6D41C	dd AIEntity_CreateByType_12B4E
off_6D420	dd loc_130A3
		dd loc_4F85
		dd loc_141D3
		dd VROOMM_StubThunk_6AA2A
		dd VROOMM_StubThunk_6AA25
		dd VROOMM_StubThunk_6AA20
		dd loc_4F80
		dd VROOMM_StubThunk_6B63F
		dd AIEntity_CreateByType_12B4E
		dd SubObject_NotifyEvent
		dd loc_4F85
		dd VROOMM_StubThunk_6AA4D
		dd VROOMM_StubThunk_6AA2A
		dd VROOMM_StubThunk_6AA25
		dd VROOMM_StubThunk_6AA20
		dd loc_4F80
byte_6D460	db 1			; DATA XREF: Player_MainUpdate:loc_13A7Ar
					; Cockpit_ReadControlsFrame_8F720:loc_8F83Dw	...
byte_6D461	db 0			; DATA XREF: Player_MainUpdate:loc_13DEBr
					; Cockpit_ApplyViewRecord_84EC0+106r ...
byte_6D462	db 0			; DATA XREF: Player_MainUpdate:loc_13F44r
					; Cockpit_ReadControlsFrame_8F720+133w ...
aFlapsOn	db 'Flaps ON',0         ; DATA XREF: Player_MainUpdate+4C2o
aFlapsOff	db 'Flaps OFF',0        ; DATA XREF: Player_MainUpdate+4E0o
aBrakesOn	db 'Brakes ON',0        ; DATA XREF: Player_MainUpdate+529o
aBrakesOff	db 'Brakes OFF',0       ; DATA XREF: Player_MainUpdate+547o
		align 2
word_6D48C	dw 1			; DATA XREF: MAIN_GAME_TICK+B4r
word_6D48E	dw 4			; DATA XREF: MAIN_GAME_TICK+B0r
		db    0
unk_6D491	db    0			; DATA XREF: MAIN_GAME_TICK+D2o
		db    0
		db    0
unk_6D494	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_6D4B4	dw 1800h		; DATA XREF: EntryPoint_RuntimeInit+5Dr	EntryPoint_RuntimeInit+6Aw ...
aMisn1a		db 'MISN-1A',0
aFonts		db 'FONTS',0            ; DATA XREF: Program_InitVideoFontArgs+38o
aSmFont		db 'SM-FONT',0          ; DATA XREF: Program_InitVideoFontArgs+34o
a_shp		db '.SHP',0             ; DATA XREF: Program_InitVideoFontArgs+30o
aThankYouForPla	db 0Ah
		db 'Thank You for playing Strike Commander.',0Ah,0
		align 2
		dd VROOMM_StubThunk_6BBE5
		dd loc_2DE0B
		dd VROOMM_StubThunk_6BBEA
		dd VROOMM_StubThunk_6AC2F
		dd VROOMM_StubThunk_6BBEF
off_6D510	dd VROOMM_StubThunk_6AC48
		dd VROOMM_StubThunk_6AC4D
		dd VROOMM_StubThunk_6BC30
off_6D51C	dd VROOMM_StubThunk_6AC2A
off_6D520	dd VROOMM_StubThunk_6AC52
		dd VROOMM_StubThunk_6AC57
		dd TrackedObject_FrameStep_2DF0D
		dd VROOMM_StubThunk_6AC25
off_6D530	dd TrackedObject_NotifyWorldObjects_2DFE4
off_6D534	dd VROOMM_StubThunk_6BC26
		dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6BC30
off_6D540	dd VROOMM_StubThunk_6BC35
		dd loc_2DEF2
		dd loc_2DF03
		dd TrackedObject_FrameStep_2DF0D
		dd VROOMM_StubThunk_6AC20
		dd TrackedObject_NotifyWorldObjects_2DFE4
byte_6D558	db 0			; DATA XREF: WorldObject_UpdateWithAIEntity_3D9FB:loc_3DA13r
					; UIScript_ParseAndEvaluate_7A054:loc_7A456w	...
byte_6D559	db 1			; DATA XREF: Expr_VM_Interpreter_51106+A2Aw
					; UIScreen_RenderOrLayoutList_54503:loc_5451Br	...
aAutopilt	db 'AUTOPILT',0         ; DATA XREF: UIScript_ParseAndEvaluate_7A054+408o
		align 2
unk_6D564	db    0			; DATA XREF: MissionRecord_LoadEntityDatabase_7B035+2DCo
		db    0
		db    1
		db    0
		db    2
		db    0
		db    3
		db    0
		db    4
		db    0
		db    5
		db    0
		db    6
		db    0
		db    7
		db    0
unk_6D574	db 0FFh			; DATA XREF: MissionRecord_LoadEntityDatabase_7B035+2EEo
		db 0FFh
		db    1
		db    0
		db    2
		db    0
		db    1
		db    0
		db    3
		db    0
		db    4
		db    0
		db    5
unk_6D581	db    0
		db    6
		db    0
a_pak_2		db '.PAK',0             ; DATA XREF: MissionRecord_LoadEntityDatabase_7B035+9Fo
		dd VROOMM_StubThunk_6BC26
		dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6BC30
		dd VROOMM_StubThunk_6ADA0
		dd loc_2DEF2
		dd VROOMM_StubThunk_6ADB4
		dd VROOMM_StubThunk_6ADB9
		dd VROOMM_StubThunk_6AC20
		dd TrackedObject_NotifyWorldObjects_2DFE4
		align 2
aEject		db 'EJECT',0            ; DATA XREF: MissionRecord_LoadEntityDatabase_7B035+A3o
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+92o
a_pak_3		db '.PAK',0             ; DATA XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+8Eo
		dd VROOMM_StubThunk_6BC26
		dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6BC30
		dd VROOMM_StubThunk_6ADF0
		dd loc_2DEF2
		dd VROOMM_StubThunk_6ADF5
		dd VROOMM_StubThunk_6ADB9
		dd VROOMM_StubThunk_6AC20
		dd TrackedObject_NotifyWorldObjects_2DFE4
		align 2
byte_6D5DE	db 0			; DATA XREF: GlyphObject_Helper8_7EC45:loc_7ED86r
					; GlyphObject_Helper8_7EC45:loc_7EDB5w	...
aMission	db 'Mission:',0         ; DATA XREF: Expr_ResolveBuiltinCallSite_7E81D+2Fo
aLeader		db 'Leader:',0          ; DATA XREF: Expr_ResolveBuiltinCallSite_7E81D+6Eo
aWingman	db 'Wingman:',0         ; DATA XREF: Expr_ResolveBuiltinCallSite_7E81D+F8o
aSolo		db 'SOLO',0
aUnknown?	db 'UNKNOWN?',0
aTakeOff	db 'Take off',0
aLanding_0	db 'Landing',0
aFlyToPreciseWa	db 'Fly to',0Ah
		db 'Precise Way',0
aFlyToWayPoint	db 'Fly to',0Ah
		db 'Way Point',0
aFlyToWayArea	db 'Fly to',0Ah
		db 'Way Area',0
aDestroyTarget	db 'Destroy',0Ah
		db 'Target',0
aDefendAlly	db 'Defend',0Ah
		db 'Ally',0
aDefendPoint	db 'Defend',0Ah
		db 'Point',0
aFollowLeader	db 'Follow',0Ah
		db 'Leader',0
aObjective	db 'Objective:',0       ; DATA XREF: GlyphObject_ComputeClipRegion_7E9C9+88o
aNotes		db 'Notes:',0           ; DATA XREF: GlyphObject_ComputeClipRegion_7E9C9+D7o
aCockpits	db 'COCKPITS',0         ; DATA XREF: Lexer_LoadScriptFile_7F90F+6Fo
aNavmap		db 'NAVMAP',0           ; DATA XREF: Lexer_LoadScriptFile_7F90F+6Bo
		dd VROOMM_StubThunk_6AE20
		dd GlyphObject_ResolveAndCache_605CE
		dd GlyphObject_Method_SetFlagField_606D2
		dd GlyphObject_Method_ReturnZero_606E4
		dd GlyphObject_Method_CopyFlagField_606EE
		dd GlyphObject_Method_ReturnZeroB_60704
		dd GlyphObject_MeasureChar_6064A
		dd GlyphObject_Method_MeasureCharParam_60690
		dd GlyphObject_Method_MeasureRefCharA_60550
		dd GlyphObject_Method_MeasureRefCharB_6058F
aCockpits_0	db 'COCKPITS',0         ; DATA XREF: Font_OpenDefinitionFile_7FD64+13o
aPlaques	db 'PLAQUES',0          ; DATA XREF: Font_OpenDefinitionFile_7FD64+Fo
dword_6D6DD	dd 51414C50h		; DATA XREF: Font_OpenDefinitionFile_7FD64+5Fr
		align 2
		dd VROOMM_StubThunk_6AED0
		dd GlyphObject_ResolveAndCache_605CE
		dd GlyphObject_Method_SetFlagField_606D2
		dd GlyphObject_Method_ReturnZero_606E4
off_6D6F2	dd GlyphObject_Method_CopyFlagField_606EE
off_6D6F6	dd GlyphObject_Method_ReturnZeroB_60704
		dd GlyphObject_MeasureChar_6064A
off_6D6FE	dd GlyphObject_Method_MeasureCharParam_60690
off_6D702	dd GlyphObject_Method_MeasureRefCharA_60550
		dd GlyphObject_Method_MeasureRefCharB_6058F
		dd VROOMM_StubThunk_6AF71
		dd VROOMM_StubThunk_6AF76
off_6D712	dd VROOMM_StubThunk_6B107
off_6D716	dd VROOMM_StubThunk_6AF3A
off_6D71A	dd VROOMM_StubThunk_6AF7B
		dd VROOMM_StubThunk_6AF80
off_6D722	dd TrackedObject_FrameStep_2DF0D
off_6D726	dd Camera_Entry_GetSubject_14859
		dd loc_1490E
		dd VROOMM_StubThunk_6B102
off_6D732	dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6B107
		dd VROOMM_StubThunk_6AF35
		dd Camera_AttachedNoOffsetCompute_14867
		dd Camera_Entry_GetState_1_14904
		dd TrackedObject_FrameStep_2DF0D
		dd Camera_Entry_GetSubject_14859
		dd loc_1490E
		dd VROOMM_StubThunk_6B01E
		dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6B107
		dd VROOMM_StubThunk_6AF30
		dd VROOMM_StubThunk_6B023
		dd VROOMM_StubThunk_6B028
		dd TrackedObject_FrameStep_2DF0D
		dd Camera_Entry_GetSubject_14859
		dd loc_1490E
byte_6D776	db 0			; DATA XREF: HUDSymbol_Helper7_84337+2Er
					; HUDSymbol_Helper7_84337+4Bw
dword_6D777	dd 0			; DATA XREF: HUDSymbol_ConstructWithFullMatrix_83DD7+C3w
					; HUDSymbol_ComputeApproachDisplay_83FC9:loc_84156w	...
dword_6D77B	dd 0			; DATA XREF: HUDSymbol_ConstructWithFullMatrix_83DD7+DEw
					; HUDSymbol_ComputeApproachDisplay_83FC9+1A6w ...
		dd VROOMM_StubThunk_6B046
off_6D783	dd VROOMM_StubThunk_6BC2B
off_6D787	dd VROOMM_StubThunk_6B107
off_6D78B	dd VROOMM_StubThunk_6AFBA
		dd VROOMM_StubThunk_6B04B
off_6D793	dd VROOMM_StubThunk_6B050
		dd TrackedObject_FrameStep_2DF0D
		dd Camera_Entry_GetSubject_14859
		dd loc_1490E
		dd VROOMM_StubThunk_6AFF6
		dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6B107
		dd VROOMM_StubThunk_6AFB5
		dd VROOMM_StubThunk_6AFFB
		dd VROOMM_StubThunk_6B000
		dd TrackedObject_FrameStep_2DF0D
		dd Camera_Entry_GetSubject_14859
		dd VROOMM_StubThunk_6B005
		dd VROOMM_StubThunk_6AFCE
		dd VROOMM_StubThunk_6BC2B
off_6D7CF	dd VROOMM_StubThunk_6AFD3
off_6D7D3	dd VROOMM_StubThunk_6AFB0
		dd VROOMM_StubThunk_6AFD8
		dd VROOMM_StubThunk_6AFE2
		dd TrackedObject_FrameStep_2DF0D
		dd Camera_Entry_GetSubject_14859
		dd loc_1490E
		align 2
		dd VROOMM_StubThunk_6B0E9
		dd VROOMM_StubThunk_6B0E4
		dd loc_26F6F
		dd loc_26F6F
		dd VROOMM_StubThunk_6B0E9
		dd VROOMM_StubThunk_6B0E4
		dd loc_1F328
		dd loc_1F302
		dd VROOMM_StubThunk_6B0DF
off_6D810	dd VROOMM_StubThunk_6B0DA
off_6D814	dd VROOMM_StubThunk_6B20E
		dd Camera_ExternalView_VtSlotC_14FD7
		dd VROOMM_StubThunk_6B213
		dd Camera_ExternalViewComputeMain_1519E
		dd VROOMM_StubThunk_6B218
		dd VROOMM_StubThunk_6B12F
		dd VROOMM_StubThunk_6B134
off_6D830	dd VROOMM_StubThunk_6B107
		dd VROOMM_StubThunk_6B0D5
		dd Camera_Entry_VtSlot_Finalize_14EBF
		dd Camera_Entry_GetState_COCKPIT_14EF0
		dd TrackedObject_FrameStep_2DF0D
		dd Camera_Entry_GetSubject_14859
		dd loc_1490E
		dd VROOMM_StubThunk_6B11B
		dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6B107
		dd VROOMM_StubThunk_6B0D0
		dd Camera_OrbitTrackCompute_1493A
		dd Camera_Entry_GetState_CHASE_14EB5
		dd TrackedObject_FrameStep_2DF0D
		dd Camera_Entry_GetSubject_14859
		dd loc_1490E
		dd VROOMM_StubThunk_6B179
		dd VROOMM_StubThunk_6B17E
		dd VROOMM_StubThunk_6B183
		dd VROOMM_StubThunk_6B1BF
		dd VROOMM_StubThunk_6B1C4
		dd VROOMM_StubThunk_6B174
		dd VROOMM_StubThunk_6B16A
		dd VROOMM_StubThunk_6BC2B
		dd VROOMM_StubThunk_6BC30
		dd VROOMM_StubThunk_6B160
		dd VROOMM_StubThunk_6B1B0
		dd VROOMM_StubThunk_6B1BA
		dd VROOMM_StubThunk_6B1B5
		dd VROOMM_StubThunk_6AC20
		dd TrackedObject_NotifyWorldObjects_2DFE4
byte_6D8AC	db 0			; DATA XREF: seg015:047Fw seg015:0569w ...
byte_6D8AD	db 0			; DATA XREF: Cockpit_DetectPlayerMissile+5Ar
					; Cockpit_DetectPlayerMissile:loc_16039w	...
byte_6D8AE	db 0			; DATA XREF: Cockpit_DetectPlayerMissile+ADr
					; Cockpit_DetectPlayerMissile:loc_1608Cw	...
byte_6D8AF	db 0			; DATA XREF: Cockpit_DetectPlayerMissile+E2r
					; Cockpit_DetectPlayerMissile+EBw ...
byte_6D8B0	db 0			; DATA XREF: Cockpit_DetectPlayerMissile+123r
					; Cockpit_DetectPlayerMissile+12Cw ...
a____DataCockpi	db '..\..\data\cockpits\',0 ; DATA XREF: Cockpit_LoadBettyPack+16o
aBetty		db 'betty',0            ; DATA XREF: Cockpit_LoadBettyPack+12o
a_pak		db '.pak',0             ; DATA XREF: Cockpit_LoadBettyPack+Eo
aEyesLockedOnTa	db 'Eyes locked on target',0 ; DATA XREF: seg015:05E9o
aTargetTracking	db 'Target tracking OFF',0 ; DATA XREF: seg015:0608o
aTargetTracki_0	db 'Target tracking OFF',0 ; DATA XREF: seg015:0635o
aTargetTracki_1	db 'Target tracking OFF',0 ; DATA XREF: Radar_ToggleTracking+21o
		align 2
aCockpits_1	db 'COCKPITS',0         ; DATA XREF: UIScreen_ClearAndLoadResource_869C0+172o
aBetty_0	db 'BETTY',0            ; DATA XREF: UIScreen_ClearAndLoadResource_869C0+16Eo
a_pak_4		db '.PAK',0             ; DATA XREF: UIScreen_ClearAndLoadResource_869C0+16Ao
		dd VROOMM_StubThunk_6B575
		dd VROOMM_StubThunk_6B25A
		dd VROOMM_StubThunk_6B25F
		dd loc_1618B
		dd loc_16626
aCommMode	db 'Comm Mode:',0       ; DATA XREF: seg016:05E1o
word_6D957	dw 0			; DATA XREF: seg016:058Fw seg016:0599r ...
aRadio		db 'RADIO',0            ; DATA XREF: seg016:003Eo
aSelectFrequenc	db 'Select Frequency',0
aRadio_0	db 'RADIO',0            ; DATA XREF: seg016:04B8o
aNoReceivers	db 'NO RECEIVERS',0     ; DATA XREF: seg016:06B4o
aDFs		db '%d %Fs',0
		dd VROOMM_StubThunk_6B29A
		dd VROOMM_StubThunk_6B295
off_6D992	dd VROOMM_StubThunk_6B0E9
		dd VROOMM_StubThunk_6B0E4
		dd loc_1FC8F
		dd loc_1FE81
		dd VROOMM_StubThunk_6B0E9
		dd VROOMM_StubThunk_6B0E4
		dd loc_174EE
		dd loc_17598
		dd VROOMM_StubThunk_6B0E9
		dd VROOMM_StubThunk_6B0E4
		dd loc_26F6F
		dd UI_DrawWidgetLabel
		dd VROOMM_StubThunk_6B0E9
		dd VROOMM_StubThunk_6B0E4
		dd loc_17432
		dd loc_174CA
		dd VROOMM_StubThunk_6B290
off_6D9D6	dd VROOMM_StubThunk_6B0E9
off_6D9DA	dd VROOMM_StubThunk_6B0E4
		dd loc_1F561
off_6D9E2	dd loc_1FA28
aObjects_0	db 'OBJECTS',0          ; DATA XREF: MissionRecord_LoadAndDecodeMain_88206+15o
aHud		db 'HUD',0              ; DATA XREF: MissionRecord_LoadAndDecodeMain_88206+11o
aGear		db 'GEAR',0             ; DATA XREF: MissionRecord_LoadWithStringConstruct_88CAD:loc_89106o
aFlaps_0	db 'FLAPS',0            ; DATA XREF: MissionRecord_LoadWithStringConstruct_88CAD+4DFo
aBrake		db 'BRAKE',0            ; DATA XREF: MissionRecord_LoadWithStringConstruct_88CAD+565o
aFonts_1	db 'FONTS',0            ; DATA XREF: MissionRecord_LoadFieldGroupSequence_8939A+88o
a_shp_1		db '.SHP',0             ; DATA XREF: MissionRecord_LoadFieldGroupSequence_8939A+7Fo
		dd String_Assign
off_6DA12	dd loc_1B608
		dd loc_1A796
		dd loc_1B692
		dd VROOMM_StubThunk_6B356
off_6DA22	dd String_Assign
		dd loc_1B608
		dd loc_1A719
		dd loc_1B692
		dd VROOMM_StubThunk_6B351
		dd String_Assign
		dd loc_1B608
		dd loc_1A698
		dd loc_1B692
		dd VROOMM_StubThunk_6B34C
		dd String_Assign
		dd loc_1B608
		dd loc_1A65A
		dd loc_1B692
		dd VROOMM_StubThunk_6B347
		dd String_Assign
		dd loc_1B608
		dd loc_1A61A
		dd loc_1B692
		dd VROOMM_StubThunk_6B342
		dd String_Assign
		dd loc_1B608
		dd loc_1A5D9
		dd loc_1B692
off_6DA82	dd VROOMM_StubThunk_6B33D
		dd String_Assign
		dd loc_1B608
		dd loc_1A4D7
		dd loc_1B692
		dd VROOMM_StubThunk_6B338
		dd String_Assign
		dd loc_1B608
		dd loc_1A482
		dd loc_1B692
		dd VROOMM_StubThunk_6B333
		dd String_Assign
		dd loc_1B608
		dd loc_1A42D
		dd loc_1B692
		dd VROOMM_StubThunk_6B32E
		dd String_Assign
		dd loc_1B608
		dd loc_1A3D8
		dd loc_1B692
off_6DAD2	dd VROOMM_StubThunk_6B329
		dd String_Assign
off_6DADA	dd loc_1B608
off_6DADE	dd loc_1A36A
off_6DAE2	dd loc_1B692
		dd VROOMM_StubThunk_6B324
		dd String_Assign
		dd loc_1B608
off_6DAF2	dd loc_1A286
		dd loc_1B692
		dd VROOMM_StubThunk_6B31F
		dd String_Assign
		dd loc_1B608
		dd loc_1A175
		dd loc_1B692
		dd VROOMM_StubThunk_6B31A
off_6DB12	dd String_Assign
off_6DB16	dd loc_1B608
off_6DB1A	dd loc_1A0EA
		dd loc_1B692
		dd VROOMM_StubThunk_6B315
		dd String_Assign
		dd loc_1B608
		dd loc_1A0A1
		dd loc_1B692
		dd VROOMM_StubThunk_6B310
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		db  30h	; 0
		db  30h	; 0
		db    0
		dd loc_1A06A
		dd loc_199F7
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B3D8
		dd loc_1A06A
		dd loc_19978
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B3D3
		dd loc_1A06A
off_6DB83	dd loc_198F4
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B3CE
		dd loc_1A87D
		dd loc_197D7
		dd loc_19807
		dd VROOMM_StubThunk_6B3C9
		dd String_Assign
		dd loc_1B81D
		dd VROOMM_StubThunk_6B3C4
		dd loc_1B692
		dd loc_1A87D
		dd loc_1969E
		dd loc_196DB
		dd VROOMM_StubThunk_6B3BF
		dd loc_1A06A
		dd loc_1967E
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B3BA
		dd loc_1A87D
		dd loc_193BE
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B3B5
		dd loc_1A06A
off_6DBE3	dd loc_1A077
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B470
		dd loc_1A87D
		dd loc_1A077
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B3B0
		align 2
		dd loc_1A06A
		dd loc_191A0
		dd loc_1938D
		dd VROOMM_StubThunk_6B443
		dd loc_1A06A
		dd loc_18E25
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B43E
		dd loc_1A06A
		dd loc_185EC
		dd loc_18E04
		dd VROOMM_StubThunk_6B439
		dd loc_1A06A
		dd loc_1839D
		dd loc_185CB
		dd VROOMM_StubThunk_6B434
		dd loc_1A06A
		dd loc_17DE4
		dd loc_182BD
		dd VROOMM_StubThunk_6B42F
		dd loc_1A06A
		dd loc_17A33
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B42A
		dd loc_1A06A
		dd loc_1782D
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B425
		dd loc_1A06A
		dd loc_175BC
		dd UI_NotifyRefresh
		dd VROOMM_StubThunk_6B420
		dd UI_ComputeScaledRect
		dd loc_1B3F2
		db 0EEh	; �
		db  0Bh
		db 0F4h	; �
		db  0Bh
		db 0FAh	; �
		db  0Bh
		db    0
		db  0Ch
		db    6
		db  0Ch
		db  0Ch
		db  0Ch
		db  12h
		db  0Ch
		db  18h
		db  0Ch
		db  1Eh
		db  0Ch
		db  24h	; $
		db  0Ch
		db  2Ah	; *
		db  0Ch
aMil0		db 'MIL 0',0
aMil1		db 'MIL 1',0
aMil2		db 'MIL 2',0
aMil3		db 'MIL 3',0
aMil4		db 'MIL 4',0
aMil5		db 'MIL 5',0
aAft1		db 'AFT 1',0
aAft2		db 'AFT 2',0
aAft3		db 'AFT 3',0
aAft4		db 'AFT 4',0
aAft5		db 'AFT 5',0
aCD		db 'C %d',0
aRS		db 'R %s',0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  20h
aNone_0		db 'NONE',0
aDAim9m		db '%d AIM-9M',0
aDAim9j		db '%d AIM-9J',0
aDAim120	db '%d AIM-120',0
aDAgm65d	db '%d AGM-65D',0
aDLau3		db '%d LAU3',0
aDMk20		db '%d MK20',0
aDMk82		db '%d MK82',0
aDDurandal	db '%d Durandal',0
aDGbu15		db '%d GBU-15',0
aDVulcan	db '%d Vulcan',0
aNav		db 'NAV',0
aIR		db 'I-R',0
aCcip		db 'CCIP',0
aCcrp		db 'CCRP',0
aEO		db 'E-O',0
aStrf		db 'STRF',0
aSrm		db 'SRM',0
aMrm		db 'MRM',0
aDgft		db 'DGFT',0
aInRng		db 'IN RNG',0
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db    0
aSg		db '%sG',0
aSg_0		db '%sG',0
aSm		db '%sM',0
aD02ld_Ld	db 'D%02ld.%ld',0
aA02ldLd	db 'A%02ld,%ld',0
		db    0
		dd UI_ComputeScaledRect
		dd UI_ComputeAnchoredRect
		dd loc_1B0B5
		dd loc_1A923
		dd loc_1B17E
		dd loc_1AE61
		dd loc_1A923
		dd loc_1AF1F
off_6DDCE	dd loc_1A88F
off_6DDD2	dd loc_1AB82
off_6DDD6	dd String_Assign
		dd loc_1B608
off_6DDDE	dd VROOMM_StubThunk_6B3C4
off_6DDE2	dd loc_1B7A4
		dd String_Assign
		dd loc_1B608
		dd VROOMM_StubThunk_6B3C4
		dd loc_1B72D
		dd loc_1A88F
		dd loc_1A923
		dd loc_26F6F
		dd loc_26F6F
		dd loc_1B4C3
		dd loc_1B4D0
off_6DE0E	dd loc_1B4DD
off_6DE12	dd loc_1B4EA
off_6DE16	dd Widget_ComputeAndStoreBounds_60883
		dd Widget_Method_SetBoundsA_60A40
		dd Widget_Method_SetBoundsB_60A62
		dd Widget_Method_ReleaseAttrAndBounds_608CC
		dd String_Assign
		dd loc_1B608
		dd VROOMM_StubThunk_6B3C4
		dd loc_1B692
		db    0
		db    5
		db  0Ah
		db  0Fh
		db  14h
		db  19h
		db  1Eh
		db  23h	; #
		db  28h	; (
		db  2Dh	; -
		db  32h	; 2
		db  37h	; 7
		db  3Ch	; <
		db  41h	; A
		db  46h	; F
		db  4Bh	; K
		db  50h	; P
		db  55h	; U
		db  5Ah	; Z
		db  55h	; U
		db  50h	; P
		db  4Bh	; K
		db  46h	; F
		db  41h	; A
		db  3Ch	; <
		db  25h	; %
		db  64h	; d
		db    0
		dd loc_1A06A
		dd loc_1B8C8
		dd loc_1B95E
		dd VROOMM_StubThunk_6B540
word_6DE62	dw 0			; DATA XREF: UIWidget_FindActiveByCode_8D284+25r
					; UIWidget_LoadDefinitionFromIFF_8D66C+Ew	...
word_6DE64	dw 0FFFFh		; DATA XREF: UIWidget_ErrorCheckWrapper_8DA61+5Dr
					; UIWidget_ErrorCheckWrapper_8DA61:loc_8DAECr	...
		dd loc_1B4C3
		dd loc_1B4D0
		dd loc_1B4DD
		dd loc_1B4EA
		dd Widget_ComputeAndStoreBounds_60883
		dd Widget_Method_SetBoundsA_60A40
		dd Widget_Method_SetBoundsB_60A62
		dd Widget_Method_ReleaseAttrAndBounds_608CC
		dd VROOMM_StubThunk_6B575
		dd VROOMM_StubThunk_6B57A
		dd VROOMM_StubThunk_6B57F
		dd loc_26F6F
		dd loc_26F6F
aLd		db '%ld',0
		dd VROOMM_StubThunk_6B575
		dd VROOMM_StubThunk_6B57A
		dd VROOMM_StubThunk_6B57F
		dd loc_1E207
		dd loc_1E2FB
		dd VROOMM_StubThunk_6B575
		dd VROOMM_StubThunk_6B57A
		dd VROOMM_StubThunk_6B57F
		dd loc_1CFA7
		dd loc_1D929
aAir		db 'AIR',0              ; DATA XREF: seg030:0B5Eo seg030:10B7o
aAir360		db 'AIR 360',0          ; DATA XREF: seg030:0B70o seg030:10BDo
aGnd		db 'GND',0              ; DATA XREF: seg030:1530o seg030:15F7o
aGnd360		db 'GND 360',0          ; DATA XREF: seg030:1542o seg030:15FDo
word_6DEDE	dw 0			; DATA XREF: seg030:0B03w seg030:0B0Dr ...
word_6DEE0	dw 0			; DATA XREF: seg030:14D5w seg030:14DFr ...
aRadar		db 'RADAR',0            ; DATA XREF: seg030:00A4o
aRadar_0	db 'RADAR',0            ; DATA XREF: seg030:0A26o
aStt		db 'STT',0              ; DATA XREF: seg030:11C4o
aAl02d		db 'AL%02d',0
aHd03d		db 'HD%03d',0
aSp03dk		db 'SP%03dK',0
aAs03d		db 'AS%03d',0
aRadar_1	db 'RADAR',0            ; DATA XREF: seg030:1303o
aPlayer		db 'PLAYER',0           ; DATA XREF: seg030:13B8o
aRadar_2	db 'RADAR',0            ; DATA XREF: seg030:13F8o
aDx		db '%dx',0
word_6DF26	dw 0			; DATA XREF: RadioQueue_RemoveSlot+2Bw
					; RadioQueue_RemoveSlot+31r ...
byte_6DF28	db 0FFh			; DATA XREF: RadioQueue_FindOldestSlot+14r
					; RadioQueue_FindOldestSlot+23r ...
byte_6DF29	db 0			; DATA XREF: RadioQueue_FindOldestSlot+Dr
					; RadioQueue_RegisterMessage+86r ...
dword_6DF2A	dd 0			; DATA XREF: Radio_LoadAndTriggerVoice:loc_1EFD5w
					; RadioQueue_ExpireTimer+15w ...
dword_6DF2E	dd 0			; DATA XREF: RadioQueue_RegisterMessage:loc_1ECA0r
					; Radio_LoadAndTriggerVoice:loc_1EFDDw	...
byte_6DF32	db 0			; DATA XREF: Radio_LoadAndTriggerVoice:loc_1EFE3w
					; Radio_LoadAndTriggerVoice+194w ...
byte_6DF33	db 0FFh			; DATA XREF: Radio_LoadAndTriggerVoice+19Aw
					; Audio_LoadSpeechClip+2Cr
aSS		db '%s: %s',0
a?		db '?',0
aD		db '%d',0
aIntel		db 'INTEL',0            ; DATA XREF: Audio_LoadSpeechClip+1Bo
aSpeech		db 'SPEECH',0           ; DATA XREF: Audio_LoadSpeechClip+17o
a_pak_0		db '.PAK',0             ; DATA XREF: Audio_LoadSpeechClip+13o
aRadio_1	db 'RADIO',0            ; DATA XREF: seg031:090Co
aIntel_1	db 'INTEL',0            ; DATA XREF: PilotProfile_LoadRADI_8DF49+128o
aSpeech_0	db 'SPEECH',0           ; DATA XREF: PilotProfile_LoadRADI_8DF49+124o
a_pak_5		db '.PAK',0             ; DATA XREF: PilotProfile_LoadRADI_8DF49+120o
aIntel_2	db 'INTEL',0            ; DATA XREF: PilotProfile_LoadFromPROF_VersionGate_8E351+1Fo
		dd loc_1FC71
unk_6DF74	db  41h	; A		; DATA XREF: seg034:0128o
		db  43h	; C
		db  4Dh	; M
		db    0
aNorm		db 'NORM',0             ; DATA XREF: seg034:012Eo
aGun		db 'GUN',0
aNone		db 'NONE',0
aSwdm		db 'SWDM',0
aSwdj		db 'SWDJ',0
aMvrk		db 'MVRK',0
aLau3		db 'LAU3',0
aMk20		db 'MK20',0
aMk82		db 'MK82',0
aDrdl		db 'DRDL',0
aGb15		db 'GB15',0
aA120		db 'A120',0
aCI		db 'C:%i',0
aFI		db 'F:%i',0
aFuel		db 'FUEL',0             ; DATA XREF: seg034:05EDo
aFuel_1		db 'FUEL:',0
		dd VROOMM_StubThunk_6B575
		dd VROOMM_StubThunk_6B57A
off_6DFD0	dd VROOMM_StubThunk_6B57F
		dd loc_2046B
		dd loc_204A0
		dd VROOMM_StubThunk_6B575
off_6DFE0	dd VROOMM_StubThunk_6B57A
off_6DFE4	dd VROOMM_StubThunk_6B57F
		dd loc_1FF95
		dd loc_1FFDF
word_6DFF0	dw 0			; DATA XREF: Video_SetHorizontalShake+1Cr
					; Video_SetHorizontalShake+25w
aErrors_txt	db 'errors.txt',0
word_6DFFD	dw 0FFFFh		; DATA XREF: Runtime_NullPointerAssignHandler_8EE3F:loc_8EE72r
byte_6DFFF	db 0			; DATA XREF: Runtime_NullPointerAssignHandler_8EE3F+Fr
					; Runtime_NullPointerAssignHandler_8EE3F:loc_8EE55w
		db  30h	; 0
		db  78h	; x
		db    0
		db  25h	; %
		db  58h	; X
		db    0
aFile		db 'FILE',0
		db  0Ah
aPleaseTypeScTo	db 'Please type SC to run Strike Commander.',0Ah,0
		db  0Ah
aStrikeComman_0	db 'Strike Commander has encountered an Error that it cannot recover '
		db 'from.',0Ah
		db 'This should be a very rare occurrence and we recommend that you t'
		db 'ry to',0Ah
		db 'play the game again from your last saved position.',0Ah
		db 0Ah
		db 'If the error persists, please write down the error code and call',0Ah
		db 'Origin Customer Service and report the error to them.',0Ah
		db 0Ah
		db 'Error Code: %X-%X',0Ah,0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dd loc_21E2C
		dd loc_21E38
		dd loc_21E40
		dd loc_21E48
		dd loc_21E50
		dd loc_21E5A
		dd Handle_Destructor
		dd loc_21E88
aDefault	db 'DEFAULT!',0
word_6E1BD	dw 0			; DATA XREF: WorldObjects_UpdateFrame_ResetCounters_221C2+7w
					; WorldObjects_UpdateAllAndRemoveDead_221F2:loc_22207w	...
		align 2
byte_6E1C0	db 0			; DATA XREF: Mission_TriggerEvaluator+Bw
					; Camera_ComputeViewMatrix+3E6r ...
byte_6E1C1	db 0			; DATA XREF: Cockpit_ViewPanTransitionMain_15B67+Er
					; Cockpit_ViewPanTransitionMain_15B67:loc_15B81w	...
word_6E1C2	dw 0			; DATA XREF: Cinematic_LoadCameraDef:loc_23EC3w
					; Font_ApplyStyleAndMeasure_87718:loc_87787r	...
aChasePlane	db 'Chase Plane',0      ; DATA XREF: Mission_TriggerEvaluator+1A0o
aExternalView	db 'External View',0    ; DATA XREF: Mission_TriggerEvaluator+1CCo
aTargetView	db 'Target View',0      ; DATA XREF: Mission_TriggerEvaluator+1F8o
aVictimViewOn	db 'Victim View ON',0   ; DATA XREF: Mission_TriggerEvaluator+260o
aVictimViewOff	db 'Victim View OFF',0  ; DATA XREF: Mission_TriggerEvaluator+27Do
aWeaponCameraOn	db 'Weapon Camera ON',0 ; DATA XREF: Mission_TriggerEvaluator+2AEo
aWeaponCameraOf	db 'Weapon Camera OFF',0 ; DATA XREF: Mission_TriggerEvaluator+2CBo
aVictimCamera	db 'Victim Camera',0    ; DATA XREF: Radar_TargetTypeFilter+B7o
aWeaponCamera	db 'Weapon Camera',0    ; DATA XREF: Mission_PlayerEventHandler+D4o
		dd EntityTracker_Destruct
		dd loc_240A6
		dd loc_24CAA
		dd loc_2918F
		dd loc_2414F
		dd loc_24184
		dd loc_24227
		dd loc_24E8D
		dd loc_2429F
		dd loc_24233
		dd loc_24C42
		dd loc_24BFE
		dd loc_2918F
		dd loc_2414F
		dd loc_24184
		dd loc_24227
		dd loc_24C03
		dd loc_2429F
		dd loc_24233
		dd loc_2422E
		dd loc_26F6F
		dd loc_26F6F
		dd loc_2918F
		dd loc_26F6F
		dd loc_26F6F
		dd loc_26F6F
		dd loc_26F6F
		dd loc_26F6F
		dd loc_26F6F
		dd loc_26F6F
		dd loc_26F6F
		dd loc_2918F
		dd loc_2414F
		dd loc_24184
		dd loc_24227
		dd loc_26F6F
		dd loc_2429F
		dd loc_24233
off_6E2E0	dd loc_2422E
		dd loc_24B41
		dd loc_2918F
		dd loc_2414F
		dd loc_24184
		dd loc_24227
		dd loc_24B85
		dd loc_2429F
		dd loc_24233
		dd loc_24B02
off_6E308	dd unk_691D0		; DATA XREF: seg046:00C7r seg046:0272r ...
dword_6E30C	dd 0			; DATA XREF: Render_SampleTexture+6r
					; Render_TriangleRasterizer+20w
word_6E310	dw 0			; DATA XREF: Render_SampleTexture+Cr
					; Render_SampleTexture+18r ...
word_6E312	dw 0			; DATA XREF: Render_TriangleRasterizer+2Dw
word_6E314	dw 0			; DATA XREF: seg046:loc_25F6Ar
					; seg046:040Ar	...
word_6E316	dw 0			; DATA XREF: seg046:loc_25F60r
					; seg046:0400r	...
word_6E318	dw 0			; DATA XREF: seg046:0225r seg046:0332r ...
word_6E31A	dw 0			; DATA XREF: Render_TriangleEdgeSetup+4Dr
					; Render_TriangleEdgeSetup+1DCr ...
word_6E31C	dw 0			; DATA XREF: seg046:021Br seg046:03BAr ...
word_6E31E	dw 0			; DATA XREF: Render_TriangleEdgeSetup+44r
					; Render_TriangleEdgeSetup:loc_26944r	...
dword_6E320	dd 0			; DATA XREF: seg046:loc_263E4r
					; seg046:061Cr	...
word_6E324	dw 0			; DATA XREF: seg046:00CBr seg046:012Ar ...
word_6E326	dw 0			; DATA XREF: seg046:0081r
					; seg046:loc_25F66r ...
word_6E328	dw 0			; DATA XREF: seg046:016Ar
					; seg046:loc_261EAr ...
word_6E32A	dw 0			; DATA XREF: seg046:008Fr seg046:023Ar ...
word_6E32C	dw 0			; DATA XREF: seg046:0092r seg046:023Dr ...
word_6E32E	dw 0			; DATA XREF: seg046:007Er seg046:0221r ...
word_6E330	dw 0			; DATA XREF: Render_TriangleRasterizer+455w
word_6E332	dw 0			; DATA XREF: seg046:0096r seg046:0241r ...
word_6E334	dw 0			; DATA XREF: seg046:009Ar seg046:0245r ...
algn_6E336:
		align 4
byte_6E338	db 0			; DATA XREF: TextRenderer_Main+Cr
					; TextRenderer_Main+996w ...
byte_6E339	db 1			; DATA XREF: TextRenderer_Main:loc_2766Cw
					; TextRenderer_Main:loc_276B6w	...
byte_6E33A	db 1			; DATA XREF: TextRenderer_Main:loc_27674w
					; TextRenderer_Main:loc_276BEw	...
byte_6E33B	db 0			; DATA XREF: Targeting_AcquireBestThreat:loc_3344r
					; AI_BehaviorSelector:loc_8F8Dr ...
byte_6E33C	db 0			; DATA XREF: Player_MainUpdate:loc_13194r
					; Player_MainUpdate:loc_13209r	...
dword_6E33D	dd 0			; DATA XREF: seg047:0057w PIT_ReadHighPrecision+8r ...
word_6E341	dw 0			; DATA XREF: TextRenderer_Main+748w
					; TextRenderer_Main+783r ...
word_6E343	dw 0			; DATA XREF: seg030:1054r
					; seg030:loc_1E1F7r ...
byte_6E345	db 0			; DATA XREF: Program_InitVideoFontArgs+232r
					; Config_ReadCalibration+Ar	...
		dd TextRenderer_EncodeCharIfFlagged_5E61C
		dd loc_272DC
		dd PagedResourceC_Method_PassThrough_5F4D8
		dd loc_27F90
aSc_cfg		db 'sc.cfg',0
aRoland		db 'roland',0
aAdlib		db 'adlib',0
aSb		db 'sb',0
aPas		db 'pas',0
aCombat		db 'combat',0
aCrackthe_nut	db 'crackthe.nut',0     ; DATA XREF: TextRenderer_Main+988o
aChkexit	db 'chkexit',0          ; DATA XREF: Input_CalibrationHandler+83o
a_shp_0		db '.shp',0             ; DATA XREF: Input_CalibrationHandler+7Fo
		dd VROOMM_StubThunk_6C73F
		dd VROOMM_StubThunk_6C744
		dd VROOMM_StubThunk_6C749
		dd VROOMM_StubThunk_6C771
		dd VROOMM_StubThunk_6C7CB
		dd VROOMM_StubThunk_6C7D0
		dd VROOMM_StubThunk_6C80C
		dd VROOMM_StubThunk_6C7DA
		dd VROOMM_StubThunk_6C7E4
		dd VROOMM_StubThunk_6C7E9
		dd VROOMM_StubThunk_6C7EE
		dd VROOMM_StubThunk_6C7F3
		dd loc_28469
		dd VROOMM_StubThunk_6C73F
		dd VROOMM_StubThunk_6C744
		dd VROOMM_StubThunk_6C749
off_6E3D2	dd VROOMM_StubThunk_6C771
		dd VROOMM_StubThunk_6C7CB
		dd VROOMM_StubThunk_6C7D0
		dd VROOMM_StubThunk_6C80C
		dd VROOMM_StubThunk_6C7DA
		dd VROOMM_StubThunk_6C7E4
		dd VROOMM_StubThunk_6C7E9
		dd VROOMM_StubThunk_6C7EE
		dd VROOMM_StubThunk_6CA3A
		dd loc_284CC
		dd VROOMM_StubThunk_6C73F
		dd VROOMM_StubThunk_6C744
		dd VROOMM_StubThunk_6C749
		dd VROOMM_StubThunk_6C771
		dd VROOMM_StubThunk_6C7CB
off_6E40E	dd VROOMM_StubThunk_6C7D0
off_6E412	dd VROOMM_StubThunk_6CA3F
off_6E416	dd VROOMM_StubThunk_6C7DA
		dd VROOMM_StubThunk_6C7E4
off_6E41E	dd VROOMM_StubThunk_6C7E9
off_6E422	dd VROOMM_StubThunk_6C7EE
off_6E426	dd VROOMM_StubThunk_6CA3A
		dd loc_2852F
		dd loc_28592
		dd loc_285A1
		dd loc_285B0
		dd loc_285BF
		dd loc_285CE
		dd StreamReader_Method_ReturnTrue_6403C
		dd StreamReader_Method_GrowBuffer_6552E
		dd StreamReader_ConstructMinimal_6599C
		dd StreamReader_ReadDispatch_63D0E
		dd loc_285FD
		dd StreamReader_Destruct_638FF
		dd loc_2860C
		dd StreamReader_Method_ReturnTrue_6403C
		dd StreamReader_Method_PassThrough_64046
		dd StreamReader_AllocateInternal_63C0B
		dd StreamReader_ReadDispatch_63D0E
byte_6E46E	db 0			; DATA XREF: InputSystem_InitAll_8F47A+Br
					; InputSystem_InitAll_8F47A+158w ...
word_6E46F	dw 0			; DATA XREF: seg015:05A6r
					; Widget_MainHandler+10r ...
word_6E471	dw 0			; DATA XREF: Player_MainUpdate+D92r
					; Mouse_InitAndRead+1Bw ...
word_6E473	dw 0			; DATA XREF: Player_MainUpdate+D32r
					; Mouse_InitAndRead+23w ...
word_6E475	dw 1			; DATA XREF: Input_ReadJoystickAxisMax_7ADFC+1Br
					; Joystick_GetAxisMaxWrapper_8EEA0+17w
dword_6E477	dd 0			; DATA XREF: Input_JoyTimestampValid:loc_28645r
					; Input_JoyTimestampValid+19r ...
word_6E47B	dw 5			; DATA XREF: Input_ReadAxis2Deadzone:loc_288DDr
					; Input_ReadAxis2Deadzone+141w ...
word_6E47D	dw 5			; DATA XREF: Input_ReadCombinedAxes:loc_28AA9r
					; Input_ReadCombinedAxes+19Aw ...
byte_6E47F	db 0			; DATA XREF: Input_ReadAxis2Deadzone+6Cr
					; Input_ReadAxis2Deadzone:loc_28943w	...
byte_6E480	db 0			; DATA XREF: Input_ReadCombinedAxes+76r
					; Input_ReadCombinedAxes+A7w ...
		align 2
aFonts_0	db 'FONTS',0            ; DATA XREF: Input_CalibrationHandler+87o
					; Config_LoadAndApplySettings_8EEBC+F4o ...
unk_6E488	db  6Ah	; j		; DATA XREF: Config_LoadAndApplySettings_8EEBC+41o
		db  6Fh	; o
		db  79h	; y
byte_6E48B	db 23h			; DATA XREF: Config_LoadAndApplySettings_8EEBC+34w
					; Cockpit_LoadAndDrawCalibration_8FDC0+57w
a_dat_0		db '.dat',0
aPalette_0	db 'PALETTE',0
aJoycalib	db 'joycalib',0         ; DATA XREF: Config_LoadAndApplySettings_8EEBC+F0o
a_shp_2		db '.shp',0             ; DATA XREF: Config_LoadAndApplySettings_8EEBC+ECo
aMouse		db 'mouse',0            ; DATA XREF: InputSystem_InitAll_8F47A+C3o
a_shp_3		db '.shp',0             ; DATA XREF: InputSystem_InitAll_8F47A+BFo
word_6E4B2	dw 0			; DATA XREF: Player_MainUpdate+2Br
					; Player_MainUpdate+837r ...
byte_6E4B4	db 0			; DATA XREF: Mission_TriggerEvaluator+2Ar
					; RadioFlags_ResetBank+3w	...
byte_6E4B5	db 0			; DATA XREF: RadioFlags_ResetBank:loc_28EB9w
					; STRIKE_EXE_MAIN_LOOP+30r ...
byte_6E4B6	db 0			; DATA XREF: RadioFlags_ResetBank+Dw
					; Debris_SpawnOrchestrator+89r ...
byte_6E4B7	db 2			; DATA XREF: RadioFlags_ResetBank+12w
					; STRIKE_EXE_MAIN_LOOP+34r ...
byte_6E4B8	db 0			; DATA XREF: Player_MainUpdate+8Dw
					; Player_MainUpdate+6F8w ...
byte_6E4B9	db 0			; DATA XREF: Player_MainUpdate:loc_13800w
					; RadioFlags_ResetBank+1Cw ...
byte_6E4BA	db 0			; DATA XREF: Radio_CombatChatterDispatch:loc_BEFBr
					; Radio_CombatChatterDispatch+B1w	...
byte_6E4BB	db 0			; DATA XREF: Radio_CombatChatterDispatch+18Ew
					; Radio_CombatChatterDispatch:loc_C018r ...
byte_6E4BC	db 0			; DATA XREF: seg004:1F43w RadioFlags_ShiftHistory+6r ...
byte_6E4BD	db 0			; DATA XREF: seg004:loc_A094w
					; RadioFlags_ShiftHistory+Cr	...
byte_6E4BE	db 0			; DATA XREF: RadioFlags_ShiftHistory+12r
					; RadioFlags_ShiftHistory+68w ...
byte_6E4BF	db 0			; DATA XREF: RadioFlags_ShiftHistory+18r
					; RadioFlags_ShiftHistory+65w ...
byte_6E4C0	db 0			; DATA XREF: AI_BehaviorSelector+258w
					; RadioFlags_ShiftHistory+1Er ...
byte_6E4C1	db 0			; DATA XREF: AI_TopLevelThink:loc_81A2w
					; RadioFlags_ShiftHistory+24r ...
byte_6E4C2	db 0			; DATA XREF: RadioFlags_ShiftHistory+2Ar
					; RadioFlags_ShiftHistory+5Cw ...
byte_6E4C3	db 0			; DATA XREF: seg004:2096w
					; RadioFlags_ShiftHistory+30r ...
byte_6E4C4	db 0			; DATA XREF: RadioFlags_ShiftHistory+36r
					; RadioFlags_ShiftHistory+56w ...
byte_6E4C5	db 0			; DATA XREF: Goal_ExecuteAction_A8AC+7Cw
					; Goal_ExecuteAction_A8AC+133w ...
byte_6E4C6	db 0			; DATA XREF: RadioFlags_ShiftHistory:loc_28F50r
					; RadioFlags_ShiftHistory+53w ...
byte_6E4C7	db 0			; DATA XREF: Player_MainUpdate+873w
					; Player_MainUpdate+AFAw ...
byte_6E4C8	db 0			; DATA XREF: RadioFlags_ShiftHistory+9w
byte_6E4C9	db 0			; DATA XREF: Radio_CombatChatterDispatch+49r RadioFlags_ShiftHistory+Fw
byte_6E4CA	db 0			; DATA XREF: Radio_CombatChatterDispatch:loc_BFE9r
					; RadioFlags_ShiftHistory+15w
byte_6E4CB	db 0			; DATA XREF: Radio_CombatChatterDispatch:loc_BFA9r
					; Radio_CombatChatterDispatch:loc_C14Er ...
byte_6E4CC	db 0			; DATA XREF: Radio_PlayerSpottedCallout:loc_BE1Br
					; Mission_TriggerEvaluator+6Er ...
byte_6E4CD	db 0			; DATA XREF: seg004:0721r
					; seg004:loc_8BE5r ...
byte_6E4CE	db 0			; DATA XREF: Radio_CombatChatterDispatch+DCr
					; RadioFlags_ShiftHistory+2Dw
byte_6E4CF	db 0			; DATA XREF: Cockpit_ViewPanTransitionMain_15B67+1Fr
					; Cockpit_ViewPanTransitionMain_15B67+49w ...
byte_6E4D0	db 1			; DATA XREF: RadioFlags_ResetBank+35w
					; Collision_MainLoop+160w ...
byte_6E4D1	db 0			; DATA XREF: Radio_CombatChatterDispatch+126r
					; RadioFlags_ShiftHistory+33w
byte_6E4D2	db 0			; DATA XREF: Radio_CombatChatterDispatch+14Er
					; RadioFlags_ShiftHistory+39w
byte_6E4D3	db 0			; DATA XREF: RadioFlags_ShiftHistory:loc_28F47w
byte_6E4D4	db 0			; DATA XREF: Radio_CombatChatterDispatch+2A9w
					; Goal_TransferToWingman+90w	...
byte_6E4D5	db 0			; DATA XREF: Radio_CombatChatterDispatch+2C1w
					; AI_MessageDispatcher+497w ...
byte_6E4D6	db 0			; DATA XREF: Radio_CombatChatterDispatch+2D5w
					; AI_MessageDispatcher+4ABw ...
byte_6E4D7	db 0			; DATA XREF: AI_TopLevelThink+Br RadioFlags_ResetBank+2Bw ...
byte_6E4D8	db 0			; DATA XREF: Radio_CombatChatterDispatch:loc_C054r
					; RadioFlags_ShiftHistory+45w
unk_6E4D9	db  50h	; P		; DATA XREF: MissionScenario_LoadFromIFF_A8C44+ECo
		db  43h	; C
		db  49h	; I
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
aAirhead	db 'AIRHEAD',0          ; DATA XREF: MissionScenario_LoadFromIFF_A8C44+135o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
aSutek		db 'SUTEK',0            ; DATA XREF: MissionScenario_LoadFromIFF_A8C44:loc_A8DC2o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  6Fh	; o
		db  70h	; p
		db  74h	; t
		db  69h	; i
		db  6Fh	; o
		db  6Eh	; n
		db  73h	; s
unk_6E511	db  2Eh	; .
		db  63h	; c
		db  66h	; f
		db  67h	; g
		db    0
		db  6Fh	; o
		db  70h	; p
		db  74h	; t
		db  64h	; d
		db  66h	; f
		db  6Ch	; l
		db  74h	; t
		db  2Eh	; .
		db  63h	; c
		db  66h	; f
		db  67h	; g
unk_6E521	db    0
aFlitopt	db 'flitopt',0          ; DATA XREF: ResourceFile_LoadTypeA_90097+11o
a_shp_4		db '.shp',0             ; DATA XREF: ResourceFile_LoadTypeA_90097+Do
		dd VROOMM_StubThunk_6C73F
		dd VROOMM_StubThunk_6C744
		dd VROOMM_StubThunk_6C749
		dd VROOMM_StubThunk_6C771
		dd VROOMM_StubThunk_6C7CB
		dd VROOMM_StubThunk_6C7D0
		dd VROOMM_StubThunk_6CA8A
		dd VROOMM_StubThunk_6C7DA
		dd VROOMM_StubThunk_6C7E4
		dd VROOMM_StubThunk_6C7E9
		dd VROOMM_StubThunk_6C7EE
		dd VROOMM_StubThunk_6CA8F
		dd VROOMM_StubThunk_6B780
		align 2
aMainopt	db 'mainopt',0          ; DATA XREF: Cockpit_LoadAndInitFull_90D20+77o
a_shp_5		db '.shp',0             ; DATA XREF: Cockpit_LoadAndInitFull_90D20+73o
		align 2
aDetlopt	db 'detlopt',0          ; DATA XREF: ResourceFile_LoadTypeB_91D29+11o
a_shp_6		db '.shp',0             ; DATA XREF: ResourceFile_LoadTypeB_91D29+Do
aRestart	db 'restart',0          ; DATA XREF: ResourceFile_LoadTypeC_9277C+11o
a_shp_7		db '.shp',0             ; DATA XREF: ResourceFile_LoadTypeC_9277C+Do
aDoYouWantTo	db 'do you want to:',0
aExitGame	db 'EXIT GAME',0
aYouHaveEjected	db 'YOU HAVE EJECTED.',0
aYouHaveDied_	db 'YOU HAVE DIED.',0
aYouHaveLanded_	db 'YOU HAVE LANDED.',0
aGameopt	db 'gameopt',0          ; DATA XREF: ResourceFile_LoadTypeD_92E60+11o
a_shp_8		db '.shp',0             ; DATA XREF: ResourceFile_LoadTypeD_92E60+Do
aCockopt	db 'cockopt',0          ; DATA XREF: ResourceFile_LoadTypeE_93295+11o
a_shp_9		db '.shp',0             ; DATA XREF: ResourceFile_LoadTypeE_93295:loc_932A2o
aCamropt	db 'camropt',0          ; DATA XREF: ResourceFile_LoadTypeF_93BA5+11o
a_shp_10	db '.shp',0             ; DATA XREF: ResourceFile_LoadTypeF_93BA5+Do
aAudiopt	db 'audiopt',0          ; DATA XREF: ResourceFile_LoadTypeG_9416A+11o
a_shp_11	db '.shp',0             ; DATA XREF: ResourceFile_LoadTypeG_9416A+Do
		dd loc_290D8
off_6E610	dd loc_290DD
		dd loc_290E2
		dd loc_290E9
		dd loc_290F0
off_6E620	dd loc_290FA
off_6E624	dd loc_29104
		dd loc_2910B
		dd loc_29110
		dd loc_29188
off_6E634	dd Object_DestructGeneric_29115
		dd Object_DestructGeneric_29036
		dd loc_29070
		dd loc_290D1
		dd loc_4E857
		dd loc_4E8A2
		dd loc_4E8C2
		dd loc_2D942
		dd loc_2D9A9
		dd loc_2DA60
		dd VROOMM_StubThunk_6B8B0
		dd loc_2D449
		dd loc_2D4D8
		dd Widget_DestructWithLabel
		dd loc_2D226
		dd loc_2C94D
		dd VROOMM_StubThunk_6BB50
		dd loc_2C92D
		dd loc_2BC9D
byte_6E680	db 0			; DATA XREF: Cinematic_SplineCompute:loc_243C7r
					; Cinematic_SplineCompute+281r ...
		align 2
byte_6E682	db 1			; DATA XREF: seg055:0F5Er seg055:17C5r ...
byte_6E683	db 1			; DATA XREF: seg055:1060r seg055:1363r ...
byte_6E684	db 0			; DATA XREF: seg055:06DAr seg055:07E7r ...
		dd loc_2AAC9
		dd loc_2AC02
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_2AC0F
		dd loc_24EE2
		dd loc_29695
		dd loc_2AAAC
		dd Mesh_FacePrepareIndirect
		dd loc_2A81A
		dd loc_295EC
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_2AAA5
		dd loc_24EE2
		dd loc_29695
		dd loc_2A6A9
		dd loc_2A3FD
		dd loc_2A5B3
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_2A5C0
		dd loc_24EE2
		dd loc_29695
		dd loc_2A3E0
		dd Mesh_FacePrepareIndirect
		dd loc_2A1C2
		dd loc_295EC
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_2A340
off_6E711	dd loc_24EE2
off_6E715	dd loc_29695
		dd loc_29689
off_6E71D	dd loc_2A006
off_6E721	dd loc_295EC
off_6E725	dd loc_295F1
		dd loc_2962D
off_6E72D	dd loc_2968E
		dd loc_2A1BB
		dd loc_24EE2
		dd loc_29695
		dd loc_29E95
		dd Mesh_FacePrepareIndirect
		dd loc_29C73
		dd loc_29D82
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_29D8F
		dd loc_24EE2
		dd loc_29695
		dd loc_29D96
		dd Mesh_FacePrepareIndirect
		dd loc_29857
		dd loc_295EC
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_298EE
		dd loc_24EE2
		dd loc_29695
		dd loc_29760
		dd loc_29977
		dd loc_295EC
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_29A06
		dd loc_24EE2
		dd loc_29695
		dd loc_29953
		dd loc_26F6F
		dd loc_295EC
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_26F6F
		dd loc_24EE2
		dd loc_29695
		dd loc_29689
		dd loc_2978F
		dd loc_295EC
		dd loc_295F1
		dd loc_2962D
		dd loc_2968E
		dd loc_29830
		dd loc_24EE2
		dd loc_29695
		dd loc_29760
		align 2
aNoFarMemForEle	db 'No far mem for element list.',0Ah,0
aSort_queue	db 'sort_queue',0
		align 2
a____Data	db '..\..\DATA\',0      ; DATA XREF: Path_ResolveDataFile+2Do
asc_6E834	db '\',0                ; DATA XREF: Path_ResolveDataFile+56o
		dd loc_2B5D9
		dd Collection_Destruct
		dd loc_2BB13
		dd loc_2918F
		dd loc_2B634
		dd loc_2B654
		dd loc_2B6A8
		dd loc_2BB63
		dd loc_2B6EF
		dd loc_2B6B4
		dd loc_2BA8D
		dd loc_2BABC
		dd loc_2918F
		dd loc_2B634
		dd loc_2B654
		dd loc_2B6A8
		dd loc_2BB0C
		dd loc_2B6EF
		dd loc_2B6B4
		dd loc_2BA8D
		dd loc_26F6F
		dd loc_2918F
		dd loc_2B634
		dd loc_2B654
		dd loc_2B6A8
		dd loc_26F6F
		dd loc_2B6EF
		dd loc_2B6B4
		dd loc_2B6AF
		dd loc_2BBF3
		dd loc_2918F
		dd loc_2B634
		dd loc_2B654
		dd loc_2B6A8
		dd loc_2BC43
		dd loc_2B6EF
		dd loc_2B6B4
		dd loc_2B6AF
byte_6E8CE	db 0			; DATA XREF: Damage_SelectWeightedComponent:loc_2BD3Er
					; Cockpit_ReadControlsFrame_8F720+C0w
		align 2
dword_6E8D0	dd 0			; DATA XREF: MissionText_AllocateMultiBuffer_94C80+2Bw
					; AircraftComponent_LoadWithDwordFields_94D40+188r ...
dword_6E8D4	dd 0			; DATA XREF: MissionText_AllocateMultiBuffer_94C80+4Cw
					; AircraftComponent_LoadWithDwordFields_94D40+1CCr ...
aPolyapprPS	db 'PolyAppr p',27h,'s',0Ah,0
		dd loc_2DDEA
		dd Damage_SimulationTick
		dd loc_2BDCF
		dd loc_2BDE8
		dd loc_2BDF8
		dd loc_2BDC1
		dd loc_290FA
		dd loc_2C8E8
		dd loc_2910B
		dd loc_2BE3B
		dd loc_2C8E1
		dd VROOMM_StubThunk_6BB5A
		dd loc_2D4DF
		dd loc_290DD
		dd loc_290E2
off_6E922	dd loc_290E9
		dd loc_290F0
		dd loc_290FA
		dd loc_2D21F
		dd loc_2910B
		dd loc_29110
		dd loc_2D4D1
		dd loc_2D879
		dd loc_2DD6A
		dd loc_2DDA6
		dd loc_2D8BE
		dd loc_2CB5B
		dd loc_290DD
		dd loc_290E2
		dd loc_290E9
		dd loc_290F0
		dd loc_290FA
		dd loc_2D21F
		dd loc_2910B
		dd loc_29110
		dd loc_2C9EC
		dd Widget_DestructComposite
		dd loc_2CB5B
		dd loc_290DD
		dd loc_290E2
		dd loc_290E9
		dd loc_290F0
		dd loc_290FA
		dd loc_2DAE7
		dd loc_2910B
		dd loc_29110
		dd loc_2DAE0
		dd loc_2DA67
dword_6E9A6	dd 0			; DATA XREF: Radar_Project3DToScreen+D1r
					; Radar_Project3DToScreen+154r ...
dword_6E9AA	dd 0			; DATA XREF: seg020:loc_18040r
					; seg020:0B4Fr	...
dword_6E9AE	dd 0			; DATA XREF: Camera_FrustumClipTest+F7r
					; seg065:096Eo	...
aCamera		db 'CAMERA',0
		align 2
dword_6E9BA	dd 0FFFFFFFFh		; DATA XREF: Texture_SelectMipLevel+6Aw
					; Texture_ResolveMipCached+16r ...
dword_6E9BE	dd 0FFFFFFFFh		; DATA XREF: Texture_ResolveMipCached+37r
					; Texture_ResolveMipCached+54w ...
dword_6E9C2	dd 0			; DATA XREF: Texture_ResolveMipCached:loc_2EB52w
					; Texture_ResolveMipCached:loc_2EC36r	...
aPalette	db 'PALETTE',0          ; DATA XREF: TextureLoader_OpenAndDecode_9800A+16o
					; TextureLoader_OpenAndLoadSubrecord_98670+16o
aNoMemForFadePa	db 'No mem for fade palettes.',0Ah,0
		align 2
		dd Render_DispatchFlatOrPerspective
		dd loc_2F890
aAccpack	db 'ACCPACK',0          ; DATA XREF: TextureLoader_OpenAndLoadFull_98A60+104o
aAcc_list	db 'ACC_LIST',0         ; DATA XREF: TextureLoader_OpenAndLoadFull_98A60+20o
aSD		db '%s%d',0
word_6EA08	dw 0			; DATA XREF: Render_ObjectPipelineMain:loc_2FF3Bw
					; Render_ObjectPipelineMain+287r ...
byte_6EA0A	db 0			; DATA XREF: Render_ObjectPipelineMain+62w
					; Render_ObjectPipelineMain+6Cr ...
dword_6EA0B	dd 0			; DATA XREF: Render_ObjectPipelineMain+4BBw
					; Render_ObjectPipelineMain+51Er ...
word_6EA0F	dw 0			; DATA XREF: Render_ObjectPipelineMain:loc_3009Dw
					; Render_ObjectPipelineMain+311w ...
word_6EA11	dw 0			; DATA XREF: Render_ObjectPipelineMain+4AAw
					; Render_ObjectPipelineMain:loc_3053Dw	...
byte_6EA13	db 0			; DATA XREF: Render_ObjectPipelineMain+19E4w
					; Render_ObjectPipelineMain+1A15r ...
byte_6EA14	db 1			; DATA XREF: Render_ObjectPipelineMain+65r
					; Render_ObjectPipelineMain+19FEr ...
byte_6EA15	db 0			; DATA XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+ADr
					; Terrain_ComputeVisibilityAndAltitude_98CF0+2E1r ...
off_6EA16	dd loc_26F6F
		dd TerrainTile_DestructSimple
off_6EA1E	dd loc_33139
off_6EA22	dd loc_33143
off_6EA26	dd loc_31BB5
		dd loc_325BB
		dd loc_33139
		dd loc_33143
		dd loc_3262A
		dd VROOMM_StubThunk_6BDC5
		dd loc_33139
		dd loc_33143
a_elv		db '.ELV',0
a_med		db '.MED',0
a_low		db '.LOW',0
a_tri		db '.TRI',0
a_obj		db '.OBJ',0
		dd loc_334F0
		dd TerrainTile_ListDestruct
		align 2
dword_6EA68	dd 0			; DATA XREF: Model_ResetTransformCache+30w
					; Model_ResetTransformCache:loc_31D32w	...
byte_6EA6C	db 1			; DATA XREF: Cockpit_ReadControlsFrame_8F720+C3r
					; TerrainSector_LoadFieldMix_99FF4:loc_9A115r	...
aTxmpack	db 'TXMPACK',0          ; DATA XREF: Terrain_SectorIndexResolve+78o
					; TerrainSector_LoadFieldMix_99FF4+8Eo
byte_6EA75	db 0			; DATA XREF: Terrain_SectorResolveChecked+8r
					; Terrain_ReleaseSectorAndTile_99AA0+19r ...
aSD_0		db '%s%d',0
aNoMemForVertic	db 'No mem for vertices and triangles in MAPGRI-I.CPP.',0Ah,0
aNoMemForDrawte	db 'No mem for DrawTerrainTriangles.',0Ah,0
		align 2
word_6EAD2	dw 0			; DATA XREF: Render_TerrainPipelineMain:loc_34AEDw
					; Render_TerrainPipelineMain+6CFr ...
dword_6EAD4	dd 0			; DATA XREF: Render_TerrainPipelineMain+8DBw
					; Render_TerrainPipelineMain+92Fr ...
word_6EAD8	dw 0			; DATA XREF: Render_TerrainPipelineMain+8E7w
					; Render_TerrainPipelineMain+93Cr ...
word_6EADA	dw 0			; DATA XREF: Render_TerrainPipelineMain+923w
					; Render_TerrainPipelineMain+BE3w ...
word_6EADC	dw 0			; DATA XREF: Render_TerrainPipelineMain+606w
					; Render_TerrainPipelineMain:loc_34D2Fw	...
word_6EADE	dw 0			; DATA XREF: Render_TerrainPipelineMain+8CAw
					; Render_TerrainPipelineMain+A90w ...
byte_6EAE0	db 0			; DATA XREF: Render_TerrainPipelineMain+459w
					; Render_TerrainPipelineMain+1E8Ar ...
		align 2
aTerrainVertexO	db 'Terrain Vertex overrun - mem trashed!',0
dword_6EB08	dd 0			; DATA XREF: Render_ObjectPipelineMain:loc_2FF29r
					; Render_ObjectPipelineMain+1A67r ...
dword_6EB0C	dd 0			; DATA XREF: Render_TerrainPipelineMain+2A2r
					; TerrainSector_AllocateMultiBuffer_9A215:loc_9A436w	...
word_6EB10	dw 0			; DATA XREF: Render_ObjectPipelineMain:loc_2FF2Fr
					; Render_ObjectPipelineMain+1CB7r ...
word_6EB12	dw 0			; DATA XREF: TerrainSector_AllocateMultiBuffer_9A215:loc_9A444w
dword_6EB14	dd 0			; DATA XREF: Render_ObjectPipelineMain+12Er
					; Render_ObjectPipelineMain+7B6r ...
dword_6EB18	dd 0			; DATA XREF: Render_ObjectPipelineMain:loc_3001Ar
					; Render_ObjectPipelineMain+4B7r ...
byte_6EB1C	db 1			; DATA XREF: Render_TerrainPipelineMain:loc_34A77r
					; Cockpit_ReadControlsFrame_8F720+CDw ...
byte_6EB1D	db 1			; DATA XREF: Render_TerrainPipelineMain:loc_34A7Er
					; Cockpit_ReadControlsFrame_8F720+E0w
byte_6EB1E	db 1			; DATA XREF: Render_TerrainPipelineMain:loc_34A85r
					; Cockpit_ReadControlsFrame_8F720+F2w
byte_6EB1F	db 1			; DATA XREF: Render_TerrainPipelineMain:loc_34A8Cr
					; Cockpit_ReadControlsFrame_8F720+E6w
byte_6EB20	db 1			; DATA XREF: Render_TerrainPipelineMain:loc_34A93r
					; Cockpit_ReadControlsFrame_8F720+ECw
byte_6EB21	db 1			; DATA XREF: Render_TerrainPipelineMain+1FA9r
					; Cockpit_ReadControlsFrame_8F720+DAw
off_6EB22	dd loc_368FE
off_6EB26	dd loc_3686E
dword_6EB2A	dd 0			; DATA XREF: Picking_TestAndMarkBitfield+2Dr
					; TerrainSector_LoadIndexedRecord_9A95A+100r ...
off_6EB2E	dd loc_36FA1
off_6EB32	dd VROOMM_StubThunk_6BE7A
off_6EB36	dd loc_36F97
		dd loc_36FF7
aTerr4u		db 'TERR%4u',0
byte_6EB46	db 1			; DATA XREF: Terrain_UpdateLODPerFrame:loc_375F0r
					; Terrain_UpdateLODPerFrame:loc_37730r	...
		align 2
unk_6EB48	db  2Eh	; .		; DATA XREF: Terrain_BuildAndLoadTilePath_9AECE:loc_9AF1Co
		db  5Ch	; \
		db    0
a_pak_6		db '.PAK',0             ; DATA XREF: Terrain_BuildAndLoadTilePath_9AECE+48o
aTerrain_0	db 'TERRAIN',0
		dd loc_21E2C
		dd loc_3781E
		dd VROOMM_StubThunk_6BF05
		dd loc_21E48
		dd loc_37782
		dd loc_21E5A
		dd VROOMM_StubThunk_6BF2D
		dd loc_21E88
		dd VROOMM_StubThunk_6BF00
		dd VROOMM_StubThunk_6BF19
		dd Debris_ManagerDestruct
aObjects	db 'OBJECTS',0          ; DATA XREF: seg009:0350o
					; IFF_LoadModelMain+A7o ...
		dd loc_37CF4
		dd Debris_NotifyChildValidate
		dd loc_37D2E
		dd loc_37DD1
		dd WorldObject_TestAliveAndUpdateChildren_3800A
off_6EBA0	dd loc_38046
off_6EBA4	dd VROOMM_StubThunk_6BFBA
		dd VROOMM_StubThunk_6BFB5
off_6EBAC	dd VROOMM_StubThunk_6BF65
off_6EBB0	dd VROOMM_StubThunk_6BF6A
off_6EBB4	dd Debris_BodyDetach
		dd loc_37E12
		dd loc_37E23
		dd loc_381DB
		dd loc_3805E
		dd loc_38085
		dd loc_381B3
		dd loc_3809B
		dd loc_381BB
		dd loc_38127
		dd loc_381CB
		dd loc_380E1
		dd loc_381C3
		dd loc_3816D
		dd loc_381D3
		dd loc_3804E
		dd loc_38056
		dd loc_37E34
		dd loc_37E3F
		dd loc_37F99
		dd loc_38090
		dd WorldObject_GetSignatureByte0_381E5
		dd VROOMM_StubThunk_6BFB0
		dd Debris_CombinePhysicsBodies
		dd loc_38342
		db  25h	; %
unk_6EC19	db  58h	; X
		db    0
off_6EC1B	dd VROOMM_StubThunk_6BFF0
off_6EC1F	dd VROOMM_StubThunk_6C009
		dd loc_3837E
off_6EC27	dd loc_38377
off_6EC2B	dd Debris_SpawnOrchestrator
off_6EC2F	dd loc_383DF
		align 2
byte_6EC34	db 0			; DATA XREF: Explosion_CreateFireball+1DCw
					; seg080:05F0r	...
aBigspher	db 'BIGSPHER',0         ; DATA XREF: Explosion_CreateFireball:loc_38E23o
		dd loc_26F6F
		dd loc_26F6F
off_6EC46	dd loc_26F6F
		dd loc_26F6F
off_6EC4E	dd loc_3A23B
		dd loc_39507
		dd loc_39538
		dd loc_3953F
		dd loc_39570
off_6EC62	dd loc_3A23B
off_6EC66	dd loc_39366
off_6EC6A	dd loc_39397
off_6EC6E	dd loc_394CF
off_6EC72	dd loc_39500
off_6EC76	dd VROOMM_StubThunk_6C040
		dd loc_3966E
		dd loc_3969F
		dd loc_397E4
		dd loc_39848
		dd loc_3A23B
		dd loc_37CF4
		dd Debris_NotifyChildValidate
		dd loc_37D2E
		dd loc_37DD1
		dd Camera_NotifyFollowTarget
off_6ECA2	dd loc_3CEED
off_6ECA6	dd Camera_DestructFollow
off_6ECAA	dd loc_3CC4B
off_6ECAE	dd VROOMM_StubThunk_6BF65
off_6ECB2	dd VROOMM_StubThunk_6BF6A
off_6ECB6	dd Debris_BodyDetach
		dd loc_37E12
		dd loc_37E23
		dd loc_3CC53
		dd loc_3805E
		dd loc_3CC5D
		dd loc_3CE02
		dd loc_3CC68
		dd loc_3CE0A
		dd loc_3CD62
		dd loc_3CEB6
		dd loc_380E1
		dd loc_381C3
		dd loc_3816D
		dd loc_381D3
off_6ECF2	dd loc_3804E
off_6ECF6	dd loc_38056
off_6ECFA	dd loc_37E34
off_6ECFE	dd loc_37E3F
off_6ED02	dd loc_37F99
off_6ED06	dd loc_38090
		dd WorldObject_GetSignatureByte0_381E5
		dd VROOMM_StubThunk_6BFB0
off_6ED12	dd Debris_CombinePhysicsBodies
		dd loc_38342
off_6ED1A	dd loc_37CF4
off_6ED1E	dd loc_451A1
off_6ED22	dd loc_37D2E
		dd loc_37DD1
off_6ED2A	dd Decoy_TickLifetime_451B5
off_6ED2E	dd loc_3CEED
off_6ED32	dd loc_45326
		dd loc_3CC4B
		dd VROOMM_StubThunk_6BF65
		dd VROOMM_StubThunk_6BF6A
off_6ED42	dd Debris_BodyDetach
off_6ED46	dd loc_37E12
off_6ED4A	dd loc_37E23
off_6ED4E	dd loc_45197
off_6ED52	dd loc_45319
off_6ED56	dd loc_3CC5D
		dd loc_3CE02
		dd loc_3CC68
		dd loc_3CE0A
off_6ED66	dd loc_3CD62
		dd loc_3CEB6
off_6ED6E	dd loc_380E1
		dd loc_381C3
		dd loc_3816D
		dd loc_381D3
		dd loc_3804E
		dd loc_38056
		dd loc_37E34
		dd loc_37E3F
		dd loc_37F99
		dd loc_38090
		dd Decoy_GetFadingSignature0_451F1
		dd VROOMM_StubThunk_6BFB0
		dd Debris_CombinePhysicsBodies
off_6EDA2	dd loc_38342
off_6EDA6	dd Decoy_GetFadingSignature1_45285
off_6EDAA	dd Ctor_CompositeObjectA_4F5A4
off_6EDAE	dd Ctor_CompositeObjectB_4F69E
off_6EDB2	dd Ctor_CompositeObjectC_4F7D6
off_6EDB6	dd FlightPhysics_TickCandidate_4F4EE
		dd loc_3A9DE
		dd loc_47209
		dd loc_3A9F0
		dd loc_3AC4F
		dd loc_3AC43
		dd loc_3AC37
off_6EDD2	dd loc_46BF3
off_6EDD6	dd loc_46C9F
off_6EDDA	dd loc_46B74
off_6EDDE	dd loc_46BC0
off_6EDE2	dd loc_46BE6
off_6EDE6	dd loc_3AC2B
		dd loc_3AC1F
		dd loc_47E64
		dd loc_3AC13
off_6EDF6	dd loc_47E6C
		dd loc_3ABFC
off_6EDFE	dd loc_3ABE5
off_6EE02	dd loc_3ABCE
off_6EE06	dd loc_3ABB7
off_6EE0A	dd loc_461ED
off_6EE0E	dd loc_46902
off_6EE12	dd loc_4690A
off_6EE16	dd loc_4620B
		dd loc_46251
		dd loc_3ABA0
off_6EE22	dd loc_3AB89
		dd loc_3AB72
		dd loc_3AB5B
		dd loc_3AB44
off_6EE32	dd loc_46912
off_6EE36	dd loc_3AB2D
off_6EE3A	dd loc_3AB16
off_6EE3E	dd loc_3AAFF
off_6EE42	dd loc_46922
off_6EE46	dd loc_3AAE8
off_6EE4A	dd loc_3AAD1
off_6EE4E	dd loc_3AABA
		dd loc_3AAA3
		dd loc_3AA8C
		dd loc_3AA75
		dd loc_3AA5E
off_6EE62	dd loc_3AA47
off_6EE66	dd VROOMM_StubThunk_6C639
off_6EE6A	dd VROOMM_StubThunk_6C63E
off_6EE6E	dd VROOMM_StubThunk_6C643
off_6EE72	dd loc_3AC5B
off_6EE76	dd loc_461ED
		dd loc_46902
		dd loc_4690A
		dd loc_4620B
		dd loc_46251
		dd loc_46259
		dd loc_4629F
off_6EE92	dd loc_462A7
off_6EE96	dd loc_462ED
off_6EE9A	dd loc_462F5
off_6EE9E	dd loc_46912
off_6EEA2	dd loc_4536C
off_6EEA6	dd loc_45376
off_6EEAA	dd loc_4691A
off_6EEAE	dd loc_46922
		dd loc_4692C
		dd VROOMM_StubThunk_6C4F2
		dd VROOMM_StubThunk_6C4F7
		dd VROOMM_StubThunk_6C4FC
off_6EEC2	dd loc_3AC8A
off_6EEC6	dd loc_461ED
off_6EECA	dd loc_46902
off_6EECE	dd loc_4690A
off_6EED2	dd loc_4620B
off_6EED6	dd loc_46251
		dd loc_46259
off_6EEDE	dd loc_4629F
		dd loc_462A7
		dd loc_462ED
		dd loc_462F5
		dd loc_46912
off_6EEF2	dd loc_421A7
		dd loc_42436
off_6EEFA	dd loc_4691A
		dd loc_46922
		dd loc_4692C
off_6EF06	dd VROOMM_StubThunk_6CB32
		dd VROOMM_StubThunk_6CB37
off_6EF0E	dd VROOMM_StubThunk_6CB3C
off_6EF12	dd FlightControl_ComputeAngularAccel
off_6EF16	dd loc_472B0
off_6EF1A	dd loc_472C2
off_6EF1E	dd loc_3ACC3
off_6EF22	dd loc_3ADF0
off_6EF26	dd loc_3ADE4
		dd loc_3ADD8
		dd loc_3ADCC
		dd loc_3ADC0
off_6EF36	dd loc_3ADB4
		dd loc_3ADA8
off_6EF3E	dd loc_3AD91
off_6EF42	dd loc_3AD7A
off_6EF46	dd loc_3AD63
off_6EF4A	dd loc_3AD4C
off_6EF4E	dd loc_461ED
off_6EF52	dd loc_46902
off_6EF56	dd loc_4690A
		dd loc_4620B
		dd loc_46251
		dd loc_46259
off_6EF66	dd loc_4629F
off_6EF6A	dd loc_462A7
off_6EF6E	dd loc_462ED
		dd loc_462F5
		dd loc_46912
		dd loc_3AD35
		dd loc_3AD1E
		dd loc_3AD07
		dd loc_46922
		dd loc_4692C
		dd VROOMM_StubThunk_6C4BB
		dd VROOMM_StubThunk_6C4C0
off_6EF96	dd VROOMM_StubThunk_6C4C5
		dd GuidedBombBody_GuidanceTick_41F2B
off_6EF9E	dd loc_4200C
off_6EFA2	dd loc_472C2
off_6EFA6	dd loc_3ADFC
off_6EFAA	dd loc_3AF49
		dd loc_3AF3D
off_6EFB2	dd loc_3AF31
off_6EFB6	dd loc_3AF25
		dd loc_3AF19
		dd loc_3AF0D
		dd loc_3AF01
off_6EFC6	dd loc_3AEEA
		dd loc_3AED3
off_6EFCE	dd loc_3AEBC
off_6EFD2	dd loc_3AEA5
		dd loc_461ED
off_6EFDA	dd loc_46902
		dd loc_4690A
		dd loc_4620B
		dd loc_46251
		dd loc_46259
		dd loc_4629F
off_6EFF2	dd loc_462A7
off_6EFF6	dd loc_462ED
off_6EFFA	dd loc_462F5
off_6EFFE	dd loc_46912
off_6F002	dd loc_3AE8E
off_6F006	dd loc_3AE77
off_6F00A	dd loc_3AE60
off_6F00E	dd loc_46922
off_6F012	dd loc_4692C
off_6F016	dd VROOMM_StubThunk_6C56C
		dd VROOMM_StubThunk_6C571
off_6F01E	dd VROOMM_StubThunk_6C576
off_6F022	dd loc_3AF55
off_6F026	dd loc_461ED
		dd loc_46902
off_6F02E	dd loc_4690A
off_6F032	dd loc_4620B
		dd loc_46251
off_6F03A	dd loc_46259
off_6F03E	dd loc_4629F
		dd loc_462A7
off_6F046	dd loc_462ED
off_6F04A	dd loc_462F5
off_6F04E	dd loc_46912
off_6F052	dd MissileBody_GuidanceTick_42A4E
off_6F056	dd loc_42CE7
off_6F05A	dd loc_4691A
off_6F05E	dd loc_46922
off_6F062	dd loc_4692C
off_6F066	dd VROOMM_StubThunk_6CB55
off_6F06A	dd VROOMM_StubThunk_6CB5A
		dd VROOMM_StubThunk_6CB5F
off_6F072	dd loc_472CA
off_6F076	dd loc_472FD
		dd loc_47857
		dd loc_4785F
		dd loc_3AF9A
		dd loc_3B121
		dd loc_3B10A
		dd loc_3B0F3
off_6F092	dd loc_3B0DC
		dd loc_461ED
off_6F09A	dd loc_46902
off_6F09E	dd loc_4690A
off_6F0A2	dd loc_4620B
off_6F0A6	dd loc_46251
off_6F0AA	dd loc_46259
		dd loc_4629F
off_6F0B2	dd loc_462A7
off_6F0B6	dd loc_462ED
		dd loc_462F5
		dd loc_46912
off_6F0C2	dd loc_3B0C5
		dd loc_3B0AE
off_6F0CA	dd loc_3B097
		dd loc_46922
off_6F0D2	dd loc_3B080
off_6F0D6	dd loc_3B069
off_6F0DA	dd loc_3B052
off_6F0DE	dd loc_3B03B
off_6F0E2	dd loc_3B024
off_6F0E6	dd loc_3B00D
		dd loc_3AFF6
		dd loc_3AFDF
off_6F0F2	dd loc_26F6F
off_6F0F6	dd loc_26F6F
off_6F0FA	dd loc_26F6F
off_6F0FE	dd loc_26F6F
off_6F102	dd loc_26F6F
off_6F106	dd loc_47209
off_6F10A	dd loc_3B138
off_6F10E	dd loc_26F6F
off_6F112	dd loc_26F6F
		dd loc_26F6F
off_6F11A	dd loc_3B189
off_6F11E	dd loc_461ED
		dd loc_46902
		dd loc_4690A
		dd loc_4620B
		dd loc_46251
		dd loc_46259
		dd loc_4629F
off_6F13A	dd loc_462A7
off_6F13E	dd loc_462ED
off_6F142	dd loc_462F5
off_6F146	dd loc_46912
off_6F14A	dd loc_26F6F
		dd loc_26F6F
off_6F152	dd loc_3B172
off_6F156	dd loc_46922
		dd loc_4692C
off_6F15E	dd loc_26F6F
		dd loc_26F6F
off_6F166	dd loc_26F6F
off_6F16A	dd loc_46BF3
		dd loc_46C9F
		dd loc_46B74
		dd loc_46BC0
		dd loc_46BE6
		dd loc_26F6F
		dd loc_26F6F
		dd loc_46B6C
		dd loc_3B1A0
		dd loc_26F6F
		dd loc_26F6F
		dd loc_26F6F
off_6F19A	dd loc_3B264
off_6F19E	dd loc_461ED
off_6F1A2	dd loc_46902
off_6F1A6	dd loc_4690A
off_6F1AA	dd loc_4620B
off_6F1AE	dd loc_46251
off_6F1B2	dd loc_3B24D
off_6F1B6	dd loc_3B236
		dd loc_3B21F
		dd loc_3B208
		dd loc_3B1F1
		dd loc_46912
off_6F1CA	dd loc_26F6F
		dd loc_26F6F
off_6F1D2	dd loc_3B1DA
off_6F1D6	dd loc_46922
off_6F1DA	dd loc_4692C
off_6F1DE	dd VROOMM_StubThunk_6CB7D
off_6F1E2	dd VROOMM_StubThunk_6CB82
off_6F1E6	dd VROOMM_StubThunk_6CB87
		dd loc_46BF3
off_6F1EE	dd loc_46C9F
off_6F1F2	dd loc_46B74
off_6F1F6	dd loc_46BC0
off_6F1FA	dd loc_46BE6
off_6F1FE	dd loc_47867
off_6F202	dd loc_478B3
off_6F206	dd loc_47E64
off_6F20A	dd loc_3B27B
off_6F20E	dd loc_47E6C
off_6F212	dd loc_3B47C
off_6F216	dd loc_3B465
off_6F21A	dd loc_3B44E
off_6F21E	dd loc_3B437
off_6F222	dd loc_461ED
		dd loc_46902
		dd loc_4690A
		dd loc_4620B
off_6F232	dd loc_46251
off_6F236	dd loc_3B420
off_6F23A	dd loc_3B409
off_6F23E	dd loc_3B3F2
off_6F242	dd loc_3B3DB
off_6F246	dd loc_3B3C4
off_6F24A	dd loc_46912
		dd loc_3B3AD
off_6F252	dd loc_3B396
		dd loc_3B37F
off_6F25A	dd loc_46922
off_6F25E	dd loc_3B368
off_6F262	dd loc_3B351
off_6F266	dd loc_3B33A
off_6F26A	dd loc_3B323
		dd loc_3B30C
off_6F272	dd loc_3B2F5
off_6F276	dd loc_3B2DE
		dd loc_3B2C7
		dd loc_26F6F
off_6F282	dd loc_26F6F
off_6F286	dd loc_26F6F
off_6F28A	dd loc_26F6F
off_6F28E	dd loc_26F6F
off_6F292	dd loc_470AC
off_6F296	dd loc_3B493
off_6F29A	dd loc_26F6F
off_6F29E	dd loc_26F6F
off_6F2A2	dd loc_26F6F
off_6F2A6	dd loc_3B4E4
		dd loc_461ED
off_6F2AE	dd loc_46902
off_6F2B2	dd loc_4690A
		dd loc_4620B
		dd loc_46251
		dd loc_46259
off_6F2C2	dd loc_4629F
off_6F2C6	dd loc_462A7
off_6F2CA	dd loc_462ED
off_6F2CE	dd loc_462F5
off_6F2D2	dd loc_46912
off_6F2D6	dd loc_26F6F
off_6F2DA	dd loc_26F6F
off_6F2DE	dd loc_3B4CD
off_6F2E2	dd loc_46922
off_6F2E6	dd loc_4692C
		dd loc_26F6F
off_6F2EE	dd loc_26F6F
		dd loc_26F6F
off_6F2F6	dd VROOMM_StubThunk_6CAD9
off_6F2FA	dd loc_461ED
off_6F2FE	dd loc_46902
		dd loc_4690A
off_6F306	dd loc_4620B
		dd loc_46251
		dd loc_46259
off_6F312	dd loc_4629F
off_6F316	dd loc_462A7
off_6F31A	dd loc_462ED
off_6F31E	dd loc_462F5
off_6F322	dd loc_46912
off_6F326	dd loc_26F6F
		dd loc_26F6F
off_6F32E	dd loc_4691A
off_6F332	dd loc_46922
off_6F336	dd loc_4692C
		dd VROOMM_StubThunk_6CBD3
off_6F33E	dd VROOMM_StubThunk_6CBD8
off_6F342	dd VROOMM_StubThunk_6CBDD
off_6F346	dd loc_46BF3
off_6F34A	dd loc_46C9F
		dd loc_46B74
off_6F352	dd loc_46BC0
off_6F356	dd loc_46BE6
off_6F35A	dd loc_4A825
off_6F35E	dd PhysicsTicks
off_6F362	dd loc_498AD
off_6F366	dd loc_3B4FB
		dd VROOMM_StubThunk_6CBE2
		dd JDYN_UpdateDamageGains_494DD
off_6F372	dd loc_49050
off_6F376	dd loc_47FF8
off_6F37A	dd loc_491B7
off_6F37E	dd loc_4AF1C
off_6F382	dd loc_4B093
off_6F386	dd loc_3B86A
		dd loc_3B85E
off_6F38E	dd loc_3B852
		dd loc_3B846
off_6F396	dd loc_3B83A
		dd loc_3B82E
off_6F39E	dd loc_3B822
off_6F3A2	dd loc_3B816
off_6F3A6	dd loc_3B80A
off_6F3AA	dd loc_3B7FE
		dd loc_3B7F2
off_6F3B2	dd loc_3B7E6
off_6F3B6	dd loc_3B7DA
off_6F3BA	dd loc_3B7CE
off_6F3BE	dd loc_3B7C2
off_6F3C2	dd loc_3B7AB
off_6F3C6	dd loc_3B794
		dd loc_3B77D
off_6F3CE	dd loc_3B766
		dd loc_3B74F
off_6F3D6	dd loc_3B738
off_6F3DA	dd loc_3B721
off_6F3DE	dd loc_4620B
		dd loc_46251
		dd loc_3B70A
		dd loc_3B6F3
		dd loc_3B6DC
off_6F3F2	dd loc_3B6C5
off_6F3F6	dd loc_3B6AE
off_6F3FA	dd loc_3B697
off_6F3FE	dd loc_3B680
off_6F402	dd loc_3B669
off_6F406	dd loc_3B652
off_6F40A	dd loc_3B63B
off_6F40E	dd loc_3B624
off_6F412	dd loc_3B60D
off_6F416	dd loc_3B5F6
		dd loc_3B5DF
off_6F41E	dd loc_3B5C8
		dd loc_3B5B1
		dd loc_3B59A
		dd loc_3B583
aBigspher_1	db 'BIGSPHER',0         ; DATA XREF: Debris_ComputeRandomizedForces_9C9A0+55o
aFuselage	db 'FUSELAGE',0
aLwing_0	db 'LWING',0
aRwing_0	db 'RWING',0
aPlayer_1	db 'PLAYER',0           ; DATA XREF: Debris_AllocateFamily_9CB2C+3Bo
		align 2
off_6F454	dd Dtor_ScalarDeleting_4F2C1
off_6F458	dd VROOMM_StubThunk_6CCF5
		dd ClassStub_ReturnConst16h_4F2BA
off_6F460	dd Debris_SpawnOrchestrator
off_6F464	dd loc_383DF
off_6F468	dd loc_3C827
off_6F46C	dd VROOMM_StubThunk_6CC1F
		dd loc_4C050
off_6F474	dd Debris_SpawnOrchestrator
		dd loc_383DF
off_6F47C	dd loc_4BA49
off_6F480	dd loc_4B973
		dd loc_4BA42
		dd Debris_SpawnOrchestrator
off_6F48C	dd loc_383DF
off_6F490	dd loc_4BD88
		dd loc_4BCF4
		dd loc_4BD81
		dd Debris_SpawnOrchestrator
off_6F4A0	dd loc_4BDD3
		dd loc_3C86C
off_6F4A8	dd loc_46103
off_6F4AC	dd loc_460FC
		dd Debris_SpawnOrchestrator
off_6F4B4	dd VROOMM_StubThunk_6C0B0
		dd loc_4538E
off_6F4BC	dd VROOMM_StubThunk_6C675
off_6F4C0	dd loc_45387
		dd Debris_SpawnOrchestrator
		dd loc_383DF
		dd loc_43416
off_6F4D0	dd VROOMM_StubThunk_6C5E5
off_6F4D4	dd loc_4340F
off_6F4D8	dd Debris_SpawnOrchestrator
off_6F4DC	dd loc_383DF
off_6F4E0	dd loc_3C8B1
off_6F4E4	dd VROOMM_StubThunk_6C085
		dd DecoyModel_GetCategory_45190
		dd Debris_SpawnOrchestrator
off_6F4F0	dd loc_383DF
off_6F4F4	dd loc_41905
off_6F4F8	dd VROOMM_StubThunk_6C489
off_6F4FC	dd loc_418B3
off_6F500	dd Debris_SpawnOrchestrator
off_6F504	dd VROOMM_StubThunk_6C5AF
		dd BombModel_TestGuidedLockCone_41735
off_6F50C	dd BombModel_PredictImpact_41311
off_6F510	dd Countermeasure_DestructA
off_6F514	dd VROOMM_StubThunk_6C475
		dd loc_418B3
off_6F51C	dd Debris_SpawnOrchestrator
off_6F520	dd VROOMM_StubThunk_6C5AF
		dd BombModel_TestGuidedLockCone_41735
		dd BombModel_PredictImpact_41311
		dd loc_46036
off_6F530	dd loc_45FCA
off_6F534	dd loc_45FC3
		dd Debris_SpawnOrchestrator
off_6F53C	dd VROOMM_StubThunk_6C5AF
off_6F540	dd loc_42F71
off_6F544	dd loc_45CEA
off_6F548	dd loc_42D04
off_6F54C	dd VROOMM_StubThunk_6C535
off_6F550	dd loc_42CFD
off_6F554	dd Debris_SpawnOrchestrator
		dd VROOMM_StubThunk_6C5AF
		dd loc_42F71
off_6F560	dd loc_42E80
		dd loc_45BC2
		dd VROOMM_StubThunk_6C6D5
		dd loc_45BBB
off_6F570	dd Debris_SpawnOrchestrator
off_6F574	dd loc_383DF
		dd loc_3E51D
off_6F57C	dd VROOMM_StubThunk_6C290
		dd loc_3E4A5
		dd VROOMM_StubThunk_6C2C0
off_6F588	dd VROOMM_StubThunk_6C2F0
		dd Camera_DestructCompoundA
off_6F590	dd VROOMM_StubThunk_6C205
		dd loc_3DE1C
		dd Debris_SpawnOrchestrator
		dd loc_383DF
off_6F5A0	dd Camera_DestructTypeC
off_6F5A4	dd VROOMM_StubThunk_6C1D9
off_6F5A8	dd loc_3DCD4
off_6F5AC	dd Debris_SpawnOrchestrator
off_6F5B0	dd loc_383DF
off_6F5B4	dd Camera_DestructSimple
		dd VROOMM_StubThunk_6C1C5
off_6F5BC	dd loc_3DADB
off_6F5C0	dd Debris_SpawnOrchestrator
		dd loc_383DF
		dd loc_4EF1B
		dd VROOMM_StubThunk_6CCB9
off_6F5D0	dd loc_4EF66
off_6F5D4	dd Debris_SpawnOrchestrator
off_6F5D8	dd loc_4EF6D
off_6F5DC	dd Camera_DestructTypeB
		dd VROOMM_StubThunk_6C1CF
		dd loc_3DBBA
		dd Debris_SpawnOrchestrator
		dd loc_383DF
off_6F5F0	dd Targeting_DestructComponent
off_6F5F4	dd VROOMM_StubThunk_6C5AA
off_6F5F8	dd loc_4333C
off_6F5FC	dd Debris_SpawnOrchestrator
off_6F600	dd VROOMM_StubThunk_6C5AF
off_6F604	dd loc_42F71
off_6F608	dd loc_42E80
off_6F60C	dd loc_4D6A5
off_6F610	dd loc_4D6F0
off_6F614	dd loc_4D769
off_6F618	dd loc_4DEB2
		dd loc_4DECF
		dd loc_42F71
off_6F624	dd loc_4D770
		dd loc_3C8F6
		dd loc_3C996
off_6F630	dd loc_3C93B
		dd Debris_SpawnOrchestrator
off_6F638	dd loc_383DF
off_6F63C	dd loc_37CF4
off_6F640	dd Debris_NotifyChildValidate
off_6F644	dd loc_37D2E
		dd loc_37DD1
off_6F64C	dd WorldObject_IsAlive_3CBB7
off_6F650	dd loc_38046
off_6F654	dd WorldObject_BaseDestruct
		dd loc_3CC19
		dd VROOMM_StubThunk_6C190
off_6F660	dd VROOMM_StubThunk_6C195
off_6F664	dd Debris_BodyDetach
off_6F668	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6F66C	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6F670	dd WorldObject_MethodReturnTrue_3CAD9
off_6F674	dd loc_3805E
off_6F678	dd WorldObject_GetOrientationMatrix_3CB2D
		dd WorldObject_SetOrientationMatrix_3CB95
		dd loc_3809B
off_6F684	dd loc_381BB
off_6F688	dd loc_38127
		dd loc_381CB
off_6F690	dd loc_380E1
off_6F694	dd loc_381C3
off_6F698	dd loc_3816D
off_6F69C	dd loc_381D3
off_6F6A0	dd loc_3CC21
off_6F6A4	dd loc_3CC36
		dd loc_3CB5B
		dd loc_3CB78
		dd loc_3CBC6
		dd loc_3CB3A
off_6F6B8	dd WorldObject_GetSignatureByte0_381E5
		dd VROOMM_StubThunk_6BFB0
off_6F6C0	dd Debris_CombinePhysicsBodies
		dd loc_38342
off_6F6C8	dd loc_37CF4
off_6F6CC	dd Debris_NotifyChildValidate
off_6F6D0	dd loc_37D2E
off_6F6D4	dd loc_37DD1
off_6F6D8	dd WorldObject_UpdateWithAIEntity_3D9FB
off_6F6DC	dd WorldObject_IntegrateBodyMotion_3D31D
off_6F6E0	dd Camera_DestructSecondaryTarget
off_6F6E4	dd loc_3D9E9
		dd VROOMM_StubThunk_6C190
		dd VROOMM_StubThunk_6C195
off_6F6F0	dd Debris_BodyDetach
off_6F6F4	dd WorldObject_ComposeOrientation3Angles_3CAE3
		dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6F6FC	dd loc_3D9F1
		dd loc_3805E
off_6F704	dd WorldObject_GetOrientationMatrix_3CB2D
off_6F708	dd WorldObject_SetOrientationMatrix_3CB95
		dd loc_3CFFF
off_6F710	dd loc_3D0F9
off_6F714	dd loc_3D246
off_6F718	dd loc_3D2E6
off_6F71C	dd loc_3CF5E
off_6F720	dd loc_3CFD5
off_6F724	dd loc_3D1A5
		dd loc_3D21C
off_6F72C	dd loc_3CC21
off_6F730	dd loc_3CC36
off_6F734	dd loc_3CB5B
off_6F738	dd loc_3CB78
		dd loc_3CBC6
off_6F740	dd loc_3CB3A
		dd WorldObject_GetSignatureByte0_381E5
off_6F748	dd VROOMM_StubThunk_6BFB0
off_6F74C	dd Debris_CombinePhysicsBodies
off_6F750	dd loc_38342
off_6F754	dd loc_37CF4
off_6F758	dd Debris_NotifyChildValidate
off_6F75C	dd loc_37D2E
off_6F760	dd loc_37DD1
off_6F764	dd Camera_ExternalUpdate_3D9B4
		dd WorldObject_IntegrateBodyMotion_3D31D
off_6F76C	dd Camera_DestructWithMount
		dd loc_3CF4C
off_6F774	dd VROOMM_StubThunk_6C190
off_6F778	dd VROOMM_StubThunk_6C195
		dd Debris_BodyDetach
off_6F780	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6F784	dd WorldObject_ComposeOrientationAngleArray_3CB0B
		dd loc_3CF54
		dd loc_3805E
off_6F790	dd WorldObject_GetOrientationMatrix_3CB2D
off_6F794	dd WorldObject_SetOrientationMatrix_3CB95
		dd loc_3CFFF
off_6F79C	dd loc_3D0F9
off_6F7A0	dd loc_3D246
off_6F7A4	dd loc_3D2E6
		dd loc_3CF5E
off_6F7AC	dd loc_3CFD5
off_6F7B0	dd loc_3D1A5
off_6F7B4	dd loc_3D21C
off_6F7B8	dd loc_3CC21
		dd loc_3CC36
off_6F7C0	dd loc_3CB5B
off_6F7C4	dd loc_3CB78
		dd loc_3CBC6
off_6F7CC	dd loc_3CB3A
off_6F7D0	dd WorldObject_GetSignatureByte0_381E5
off_6F7D4	dd VROOMM_StubThunk_6BFB0
off_6F7D8	dd Debris_CombinePhysicsBodies
		dd loc_38342
		dd loc_37CF4
off_6F7E4	dd Debris_NotifyChildValidate
		dd loc_37D2E
		dd loc_37DD1
off_6F7F0	dd Camera_ResolvePositionVelocity_3DDC4
off_6F7F4	dd WorldObject_IntegrateBodyMotion_3D31D
off_6F7F8	dd Camera_DestructCompoundB
off_6F7FC	dd loc_3DEDF
off_6F800	dd VROOMM_StubThunk_6C190
off_6F804	dd VROOMM_StubThunk_6C195
off_6F808	dd Debris_BodyDetach
		dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6F810	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6F814	dd loc_3DDBA
		dd loc_3805E
		dd WorldObject_GetOrientationMatrix_3CB2D
off_6F820	dd WorldObject_SetOrientationMatrix_3CB95
off_6F824	dd loc_3CFFF
		dd loc_3D0F9
off_6F82C	dd loc_3D246
off_6F830	dd loc_3D2E6
off_6F834	dd loc_3CF5E
off_6F838	dd loc_3CFD5
		dd loc_3D1A5
off_6F840	dd loc_3D21C
off_6F844	dd loc_3CC21
off_6F848	dd loc_3CC36
off_6F84C	dd loc_3CB5B
off_6F850	dd loc_3CB78
off_6F854	dd loc_3CBC6
off_6F858	dd loc_3CB3A
off_6F85C	dd WorldObject_GetSignatureByte0_381E5
off_6F860	dd VROOMM_StubThunk_6BFB0
off_6F864	dd Debris_CombinePhysicsBodies
		dd loc_38342
off_6F86C	dd loc_37CF4
off_6F870	dd loc_3DEE7
off_6F874	dd loc_37D2E
off_6F878	dd loc_37DD1
		dd loc_3DEFB
off_6F880	dd loc_3E115
		dd loc_3E4AC
		dd VROOMM_StubThunk_6C350
		dd VROOMM_StubThunk_6C190
off_6F890	dd VROOMM_StubThunk_6C195
off_6F894	dd Debris_BodyDetach
		dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6F89C	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6F8A0	dd loc_3E1F7
off_6F8A4	dd loc_3805E
off_6F8A8	dd WorldObject_GetOrientationMatrix_3CB2D
off_6F8AC	dd WorldObject_SetOrientationMatrix_3CB95
off_6F8B0	dd loc_3CFFF
off_6F8B4	dd loc_3D0F9
off_6F8B8	dd loc_3D246
		dd loc_3D2E6
		dd loc_3CF5E
off_6F8C4	dd loc_3CFD5
		dd loc_3D1A5
off_6F8CC	dd loc_3D21C
off_6F8D0	dd loc_3CC21
off_6F8D4	dd loc_3CC36
off_6F8D8	dd loc_3CB5B
off_6F8DC	dd loc_3CB78
off_6F8E0	dd loc_3CBC6
off_6F8E4	dd loc_3CB3A
		dd Aircraft_ComputeSeekerSignature_3E2F1
		dd loc_3E201
off_6F8F0	dd Debris_CombinePhysicsBodies
off_6F8F4	dd loc_3E419
aLoweject	db 'LOWEJECT',0         ; DATA XREF: Debris_SpawnOrchestratorVariant_9D770+C9o
algn_6F901:
		align 2
word_6F902	dw 19h			; DATA XREF: seg087:0069r
					; seg087:loc_3DF52r
aChaff		db 'CHAFF',0            ; DATA XREF: Countermeasure_DeployChaffFlare+23o
aFlare		db 'FLARE',0            ; DATA XREF: Countermeasure_DeployChaffFlare+41o
aHardpt		db 'HARDPT#',0          ; DATA XREF: PlayerComponent_FormatAndDisplay_9F784+27o
aPod		db 'POD',0              ; DATA XREF: PlayerComponent_LoadAndApply_9EDD4:loc_9EEC6o
aGun_0		db 'GUN',0              ; DATA XREF: PlayerComponent_FormatAndDisplay_9F784+74o
off_6F920	dd loc_37CF4
off_6F924	dd Debris_NotifyChildValidate
		dd loc_37D2E
off_6F92C	dd loc_37DD1
off_6F930	dd loc_41AAF
off_6F934	dd WorldObject_IntegrateBodyMotion_3D31D
		dd loc_4199B
		dd loc_3CF4C
off_6F940	dd VROOMM_StubThunk_6C190
off_6F944	dd VROOMM_StubThunk_6C195
off_6F948	dd Debris_BodyDetach
off_6F94C	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6F950	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6F954	dd loc_418A9
off_6F958	dd loc_43325
off_6F95C	dd WorldObject_GetOrientationMatrix_3CB2D
off_6F960	dd WorldObject_SetOrientationMatrix_3CB95
off_6F964	dd loc_3CFFF
off_6F968	dd loc_3D0F9
off_6F96C	dd loc_3D246
off_6F970	dd loc_3D2E6
		dd loc_3CF5E
		dd loc_3CFD5
		dd loc_3D1A5
off_6F980	dd loc_3D21C
		dd loc_3CC21
		dd loc_3CC36
		dd loc_3CB5B
off_6F990	dd loc_3CB78
off_6F994	dd loc_3CBC6
off_6F998	dd loc_3CB3A
off_6F99C	dd WorldObject_GetSignatureByte0_381E5
off_6F9A0	dd VROOMM_StubThunk_6BFB0
off_6F9A4	dd Debris_CombinePhysicsBodies
off_6F9A8	dd loc_38342
off_6F9AC	dd loc_37CF4
off_6F9B0	dd Debris_NotifyChildValidate
off_6F9B4	dd loc_37D2E
off_6F9B8	dd loc_37DD1
		dd loc_43332
off_6F9C0	dd WorldObject_IntegrateBodyMotion_3D31D
off_6F9C4	dd Targeting_DestructWithWeakRefs
		dd loc_3CF4C
off_6F9CC	dd VROOMM_StubThunk_6C190
off_6F9D0	dd VROOMM_StubThunk_6C195
off_6F9D4	dd Debris_BodyDetach
		dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6F9DC	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6F9E0	dd loc_433AD
off_6F9E4	dd loc_43325
off_6F9E8	dd WorldObject_GetOrientationMatrix_3CB2D
		dd WorldObject_SetOrientationMatrix_3CB95
off_6F9F0	dd loc_3CFFF
off_6F9F4	dd loc_3D0F9
off_6F9F8	dd loc_3D246
off_6F9FC	dd loc_3D2E6
off_6FA00	dd loc_3CF5E
off_6FA04	dd loc_3CFD5
		dd loc_3D1A5
off_6FA0C	dd loc_3D21C
off_6FA10	dd loc_3CC21
off_6FA14	dd loc_3CC36
off_6FA18	dd loc_3CB5B
off_6FA1C	dd loc_3CB78
off_6FA20	dd loc_3CBC6
off_6FA24	dd loc_3CB3A
off_6FA28	dd WorldObject_GetSignatureByte0_381E5
off_6FA2C	dd VROOMM_StubThunk_6BFB0
off_6FA30	dd Debris_CombinePhysicsBodies
off_6FA34	dd loc_38342
		dd loc_37CF4
off_6FA3C	dd Debris_NotifyChildValidate
off_6FA40	dd loc_37D2E
off_6FA44	dd loc_37DD1
off_6FA48	dd loc_41A59
off_6FA4C	dd WorldObject_IntegrateBodyMotion_3D31D
off_6FA50	dd Countermeasure_DestructB
off_6FA54	dd loc_3CF4C
off_6FA58	dd VROOMM_StubThunk_6C190
off_6FA5C	dd VROOMM_StubThunk_6C195
off_6FA60	dd Debris_BodyDetach
off_6FA64	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6FA68	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6FA6C	dd loc_418A9
off_6FA70	dd loc_43325
off_6FA74	dd WorldObject_GetOrientationMatrix_3CB2D
off_6FA78	dd WorldObject_SetOrientationMatrix_3CB95
		dd loc_3CFFF
off_6FA80	dd loc_3D0F9
off_6FA84	dd loc_3D246
off_6FA88	dd loc_3D2E6
off_6FA8C	dd loc_3CF5E
off_6FA90	dd loc_3CFD5
off_6FA94	dd loc_3D1A5
off_6FA98	dd loc_3D21C
off_6FA9C	dd loc_3CC21
off_6FAA0	dd loc_3CC36
off_6FAA4	dd loc_3CB5B
off_6FAA8	dd loc_3CB78
off_6FAAC	dd loc_3CBC6
off_6FAB0	dd loc_3CB3A
off_6FAB4	dd WorldObject_GetSignatureByte0_381E5
		dd VROOMM_StubThunk_6BFB0
		dd Debris_CombinePhysicsBodies
off_6FAC0	dd loc_38342
off_6FAC4	dd loc_37CF4
off_6FAC8	dd Debris_NotifyChildValidate
off_6FACC	dd loc_37D2E
off_6FAD0	dd loc_37DD1
off_6FAD4	dd Missile_UpdateSeekerAndFuse_42458
off_6FAD8	dd WorldObject_IntegrateBodyMotion_3D31D
off_6FADC	dd loc_42D4F
off_6FAE0	dd loc_3CF4C
		dd VROOMM_StubThunk_6C190
		dd VROOMM_StubThunk_6C195
		dd Debris_BodyDetach
off_6FAF0	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6FAF4	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6FAF8	dd Missile_GetCategory_4244E
off_6FAFC	dd loc_43325
off_6FB00	dd WorldObject_GetOrientationMatrix_3CB2D
off_6FB04	dd WorldObject_SetOrientationMatrix_3CB95
off_6FB08	dd loc_3CFFF
off_6FB0C	dd loc_3D0F9
off_6FB10	dd loc_3D246
off_6FB14	dd loc_3D2E6
off_6FB18	dd loc_3CF5E
off_6FB1C	dd loc_3CFD5
off_6FB20	dd loc_3D1A5
off_6FB24	dd loc_3D21C
off_6FB28	dd loc_3CC21
off_6FB2C	dd loc_3CC36
off_6FB30	dd loc_3CB5B
off_6FB34	dd loc_3CB78
off_6FB38	dd loc_3CBC6
off_6FB3C	dd loc_3CB3A
off_6FB40	dd WorldObject_GetSignatureByte0_381E5
off_6FB44	dd loc_42618
		dd loc_4256C
off_6FB4C	dd loc_38342
off_6FB50	dd loc_37CF4
off_6FB54	dd Debris_NotifyChildValidate
off_6FB58	dd loc_37D2E
off_6FB5C	dd loc_37DD1
off_6FB60	dd loc_43491
off_6FB64	dd loc_38046
off_6FB68	dd loc_43C70
off_6FB6C	dd loc_3CC19
off_6FB70	dd VROOMM_StubThunk_6C190
		dd VROOMM_StubThunk_6C195
off_6FB78	dd Debris_BodyDetach
off_6FB7C	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6FB80	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6FB84	dd loc_43487
		dd loc_3805E
off_6FB8C	dd WorldObject_GetOrientationMatrix_3CB2D
off_6FB90	dd WorldObject_SetOrientationMatrix_3CB95
off_6FB94	dd loc_3809B
off_6FB98	dd loc_381BB
off_6FB9C	dd loc_38127
off_6FBA0	dd loc_381CB
off_6FBA4	dd loc_380E1
off_6FBA8	dd loc_381C3
off_6FBAC	dd loc_3816D
off_6FBB0	dd loc_381D3
off_6FBB4	dd loc_3CC21
off_6FBB8	dd loc_3CC36
off_6FBBC	dd loc_3CB5B
off_6FBC0	dd loc_3CB78
off_6FBC4	dd loc_3CBC6
off_6FBC8	dd loc_3CB3A
off_6FBCC	dd WorldObject_GetSignatureByte0_381E5
off_6FBD0	dd VROOMM_StubThunk_6BFB0
off_6FBD4	dd Debris_CombinePhysicsBodies
		dd loc_43CBB
aTerrain	db 'TERRAIN',0          ; DATA XREF: seg079:0080o
					; Gauge_ComputeAndRenderNeedle_9D910+49o ...
unk_6FBE4	db    0
dword_6FBE5	dd 0			; DATA XREF: Collision_PrepareObjectPair+C2r
					; Collision_PrepareObjectPair+ECr ...
dword_6FBE9	dd 0			; DATA XREF: Explosion_CreateFireball+43r
					; Collision_PrepareObjectPair+D1r ...
word_6FBED	dw 0			; DATA XREF: Collision_PrepareObjectPair+4Cw
					; Collision_PrepareObjectPair+63w ...
word_6FBEF	dw 0			; DATA XREF: Explosion_CreateFireball+35r
					; Collision_PrepareObjectPair+91w ...
unk_6FBF1	db    0
unk_6FBF2	db    0
		db  46h	; F
unk_6FBF4	db  55h	; U
		db  53h	; S
		db  45h	; E
unk_6FBF7	db  4Ch	; L
unk_6FBF8	db  41h	; A
		db  47h	; G
unk_6FBFA	db  45h	; E
		db    0
aBigspher_0	db 'BIGSPHER',0         ; DATA XREF: Collision_PrepareObjectPair+E6o
		align 2
off_6FC06	dd loc_37CF4
off_6FC0A	dd Debris_NotifyChildValidate
off_6FC0E	dd loc_37D2E
off_6FC12	dd loc_37DD1
off_6FC16	dd loc_45883
off_6FC1A	dd loc_458C8
off_6FC1E	dd loc_45A74
off_6FC22	dd VROOMM_StubThunk_6C67A
off_6FC26	dd VROOMM_StubThunk_6C190
off_6FC2A	dd VROOMM_StubThunk_6C195
off_6FC2E	dd Debris_BodyDetach
off_6FC32	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6FC36	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6FC3A	dd loc_453D9
off_6FC3E	dd loc_3805E
off_6FC42	dd WorldObject_GetOrientationMatrix_3CB2D
off_6FC46	dd WorldObject_SetOrientationMatrix_3CB95
off_6FC4A	dd loc_3CFFF
off_6FC4E	dd loc_3D0F9
off_6FC52	dd loc_3D246
off_6FC56	dd loc_3D2E6
off_6FC5A	dd loc_3CF5E
off_6FC5E	dd loc_3CFD5
off_6FC62	dd loc_3D1A5
off_6FC66	dd loc_3D21C
off_6FC6A	dd loc_3CC21
off_6FC6E	dd loc_3CC36
off_6FC72	dd loc_3CB5B
off_6FC76	dd loc_3CB78
off_6FC7A	dd loc_3CBC6
off_6FC7E	dd loc_3CB3A
off_6FC82	dd WorldObject_GetSignatureByte0_381E5
off_6FC86	dd VROOMM_StubThunk_6BFB0
		dd Debris_CombinePhysicsBodies
off_6FC8E	dd loc_453E3
aHDDDSD		db 'H: %d',0Ah
		db 'D: %d',0Ah
		db 'S: %d',0Ah,0
aPosXLdYLd	db 'POS X: %ld Y: %ld',0Ah,0
aDesXLdYLd	db 'DES X: %ld Y: %ld',0Ah,0
		align 2
off_6FCCC	dd loc_37CF4
off_6FCD0	dd Debris_NotifyChildValidate
off_6FCD4	dd loc_37D2E
off_6FCD8	dd loc_37DD1
off_6FCDC	dd loc_45AB9
off_6FCE0	dd loc_38046
off_6FCE4	dd loc_45C4D
off_6FCE8	dd loc_3CC19
off_6FCEC	dd VROOMM_StubThunk_6C190
off_6FCF0	dd VROOMM_StubThunk_6C195
off_6FCF4	dd Debris_BodyDetach
off_6FCF8	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6FCFC	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_6FD00	dd loc_45AAF
off_6FD04	dd loc_3805E
off_6FD08	dd WorldObject_GetOrientationMatrix_3CB2D
off_6FD0C	dd WorldObject_SetOrientationMatrix_3CB95
off_6FD10	dd loc_3809B
off_6FD14	dd loc_381BB
off_6FD18	dd loc_38127
off_6FD1C	dd loc_381CB
off_6FD20	dd loc_380E1
off_6FD24	dd loc_381C3
		dd loc_3816D
off_6FD2C	dd loc_381D3
		dd loc_3CC21
		dd loc_3CC36
off_6FD38	dd loc_3CB5B
		dd loc_3CB78
off_6FD40	dd loc_3CBC6
off_6FD44	dd loc_3CB3A
off_6FD48	dd WorldObject_GetSignatureByte0_381E5
off_6FD4C	dd VROOMM_StubThunk_6BFB0
off_6FD50	dd Debris_CombinePhysicsBodies
off_6FD54	dd loc_45B76
off_6FD58	dd loc_37CF4
off_6FD5C	dd Debris_NotifyChildValidate
off_6FD60	dd loc_37D2E
off_6FD64	dd loc_37DD1
off_6FD68	dd loc_45FA8
off_6FD6C	dd loc_38046
off_6FD70	dd loc_460B9
off_6FD74	dd VROOMM_StubThunk_6BFB5
		dd VROOMM_StubThunk_6BF65
off_6FD7C	dd VROOMM_StubThunk_6BF6A
off_6FD80	dd Debris_BodyDetach
off_6FD84	dd loc_37E12
		dd loc_37E23
off_6FD8C	dd loc_45F9E
off_6FD90	dd loc_3805E
off_6FD94	dd loc_38085
off_6FD98	dd loc_381B3
		dd loc_3809B
off_6FDA0	dd loc_381BB
off_6FDA4	dd loc_38127
off_6FDA8	dd loc_381CB
off_6FDAC	dd loc_380E1
off_6FDB0	dd loc_381C3
off_6FDB4	dd loc_3816D
off_6FDB8	dd loc_381D3
off_6FDBC	dd loc_3804E
off_6FDC0	dd loc_38056
		dd loc_37E34
off_6FDC8	dd loc_37E3F
		dd loc_37F99
off_6FDD0	dd loc_38090
off_6FDD4	dd WorldObject_GetSignatureByte0_381E5
off_6FDD8	dd VROOMM_StubThunk_6BFB0
off_6FDDC	dd Debris_CombinePhysicsBodies
off_6FDE0	dd loc_38342
off_6FDE4	dd loc_37CF4
		dd loc_461AE
off_6FDEC	dd loc_37D2E
off_6FDF0	dd loc_37DD1
off_6FDF4	dd loc_461B6
off_6FDF8	dd loc_38046
off_6FDFC	dd loc_461C0
off_6FE00	dd loc_3CC19
off_6FE04	dd VROOMM_StubThunk_6C190
off_6FE08	dd VROOMM_StubThunk_6C195
off_6FE0C	dd Debris_BodyDetach
off_6FE10	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_6FE14	dd WorldObject_ComposeOrientationAngleArray_3CB0B
		dd loc_461A4
off_6FE1C	dd loc_3805E
off_6FE20	dd WorldObject_GetOrientationMatrix_3CB2D
off_6FE24	dd WorldObject_SetOrientationMatrix_3CB95
off_6FE28	dd loc_3809B
off_6FE2C	dd loc_381BB
off_6FE30	dd loc_38127
off_6FE34	dd loc_381CB
off_6FE38	dd loc_380E1
		dd loc_381C3
off_6FE40	dd loc_3816D
off_6FE44	dd loc_381D3
off_6FE48	dd loc_3CC21
off_6FE4C	dd loc_3CC36
off_6FE50	dd loc_3CB5B
off_6FE54	dd loc_3CB78
off_6FE58	dd loc_3CBC6
off_6FE5C	dd loc_3CB3A
off_6FE60	dd WorldObject_GetSignatureByte0_381E5
off_6FE64	dd VROOMM_StubThunk_6BFB0
off_6FE68	dd Debris_CombinePhysicsBodies
off_6FE6C	dd loc_38342
word_6FE70	dw 0			; DATA XREF: GaugeWidget_FormatDisplayValue_A3CF6+120r
word_6FE72	dw 0			; DATA XREF: PaletteScreen_AcquireOwnership_A1240+6r PaletteScreen_AcquireOwnership_A1240+Dw ...
word_6FE74	dw 0			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A16E3r
					; PaletteScreen_BuildCustomGradient_A1626+2B8w ...
word_6FE76	dw 1			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+D4r
					; PaletteScreen_BuildCustomGradient_A1626:loc_A18F4w
word_6FE78	dw 2			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+E8r
					; PaletteScreen_BuildCustomGradient_A1626+2E1w
word_6FE7A	dw 3			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+FFr
					; PaletteScreen_BuildCustomGradient_A1626+2F7w
word_6FE7C	dw 4			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+113r
					; PaletteScreen_BuildCustomGradient_A1626+30Aw
word_6FE7E	dw 5			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A1750r
					; PaletteScreen_BuildCustomGradient_A1626+320w
word_6FE80	dw 6			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A1764r
					; PaletteScreen_BuildCustomGradient_A1626+333w
word_6FE82	dw 7			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+155r
					; PaletteScreen_BuildCustomGradient_A1626+349w
word_6FE84	dw 8			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A1792r
					; PaletteScreen_BuildCustomGradient_A1626+35Fw
word_6FE86	dw 9			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+183r
					; PaletteScreen_BuildCustomGradient_A1626+375w
word_6FE88	dw 0Ah			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+19Ar
					; PaletteScreen_BuildCustomGradient_A1626+38Bw
word_6FE8A	dw 0Bh			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A17D7r
					; PaletteScreen_BuildCustomGradient_A1626:loc_A19C7w
word_6FE8C	dw 0Ch			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+1C8r
					; PaletteScreen_BuildCustomGradient_A1626+3B7w
word_6FE8E	dw 0Dh			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+1DFr
					; PaletteScreen_BuildCustomGradient_A1626:loc_A19F3w
word_6FE90	dw 0Eh			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+1F6r
					; PaletteScreen_BuildCustomGradient_A1626+3E3w
word_6FE92	dw 0Fh			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A1833r
					; PaletteScreen_BuildCustomGradient_A1626+3F9w ...
word_6FE94	dw 0			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A165Fr
					; PaletteScreen_BuildCustomGradient_A1626+23Aw ...
word_6FE96	dw 0			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+4Dr
					; PaletteScreen_BuildCustomGradient_A1626:loc_A1873w	...
word_6FE98	dw 87h			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+64r
					; PaletteScreen_BuildCustomGradient_A1626+263w ...
word_6FE9A	dw 1			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+7Br
					; PaletteScreen_BuildCustomGradient_A1626+279w
word_6FE9C	dw 0Fh			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+92r
					; PaletteScreen_BuildCustomGradient_A1626:loc_A18B5w	...
word_6FE9E	dw 8			; DATA XREF: PaletteScreen_BuildCustomGradient_A1626+A9r
					; PaletteScreen_BuildCustomGradient_A1626+2A5w ...
word_6FEA0	dw 0			; DATA XREF: Palette_ReleaseBuffer_A1520:loc_A152Br
					; Palette_ReleaseBuffer_A1520+12w ...
dword_6FEA2	dd 0			; DATA XREF: Palette_ReleaseBuffer_A1520:loc_A1523r
					; Palette_ReleaseBuffer_A1520+18r ...
off_6FEA6	dd VROOMM_StubThunk_6C73F
off_6FEAA	dd VROOMM_StubThunk_6C744
off_6FEAE	dd VROOMM_StubThunk_6C749
off_6FEB2	dd VROOMM_StubThunk_6C771
off_6FEB6	dd VROOMM_StubThunk_6C7CB
off_6FEBA	dd VROOMM_StubThunk_6C7D0
off_6FEBE	dd VROOMM_StubThunk_6C7D5
off_6FEC2	dd VROOMM_StubThunk_6C7DA
off_6FEC6	dd VROOMM_StubThunk_6C7E4
off_6FECA	dd VROOMM_StubThunk_6C7E9
off_6FECE	dd VROOMM_StubThunk_6C7EE
off_6FED2	dd VROOMM_StubThunk_6C7F3
off_6FED6	dd VROOMM_StubThunk_6C730
word_6FEDA	dw 0			; DATA XREF: PaletteScreen_ConstructAndBindWidget_A2C30+9w
					; PaletteScreen_ConstructAndBindWidget_A2C30+17r ...
word_6FEDC	dw 0			; DATA XREF: TextRenderer_Main+7C3w
					; PaletteScreen_DrawWidgetVariantC_A23E7+Dr	...
aMgm04x_	db 'MGM%04X.$$$',0
aMgm04x__0	db 'MGM%04X.$$$',0
off_6FEF6	dd VROOMM_StubThunk_6C905
off_6FEFA	dd VROOMM_StubThunk_6C90A
off_6FEFE	dd VROOMM_StubThunk_6C900
off_6FF02	dd VROOMM_StubThunk_6C771
off_6FF06	dd VROOMM_StubThunk_6C91E
off_6FF0A	dd VROOMM_StubThunk_6C7D0
off_6FF0E	dd VROOMM_StubThunk_6C9A5
off_6FF12	dd VROOMM_StubThunk_6C7DA
		dd VROOMM_StubThunk_6C8E7
off_6FF1A	dd VROOMM_StubThunk_6C8EC
off_6FF1E	dd VROOMM_StubThunk_6C9AA
off_6FF22	dd VROOMM_StubThunk_6C7F3
off_6FF26	dd VROOMM_StubThunk_6C978
off_6FF2A	dd VROOMM_StubThunk_6C99B
off_6FF2E	dd VROOMM_StubThunk_6C9A0
off_6FF32	dd VROOMM_StubThunk_6C905
off_6FF36	dd VROOMM_StubThunk_6C90A
off_6FF3A	dd VROOMM_StubThunk_6C900
off_6FF3E	dd VROOMM_StubThunk_6C771
off_6FF42	dd VROOMM_StubThunk_6C91E
off_6FF46	dd VROOMM_StubThunk_6C7D0
off_6FF4A	dd VROOMM_StubThunk_6C928
off_6FF4E	dd VROOMM_StubThunk_6C7DA
off_6FF52	dd VROOMM_StubThunk_6C8E7
off_6FF56	dd VROOMM_StubThunk_6C8EC
off_6FF5A	dd VROOMM_StubThunk_6C923
off_6FF5E	dd VROOMM_StubThunk_6C7F3
off_6FF62	dd VROOMM_StubThunk_6C914
off_6FF66	dd VROOMM_StubThunk_6C73F
		dd VROOMM_StubThunk_6C744
off_6FF6E	dd VROOMM_StubThunk_6C749
off_6FF72	dd VROOMM_StubThunk_6C771
		dd VROOMM_StubThunk_6C7CB
off_6FF7A	dd VROOMM_StubThunk_6C7D0
off_6FF7E	dd VROOMM_StubThunk_6C9FA
off_6FF82	dd VROOMM_StubThunk_6C7DA
off_6FF86	dd VROOMM_StubThunk_6C7E4
off_6FF8A	dd VROOMM_StubThunk_6C7E9
off_6FF8E	dd VROOMM_StubThunk_6C7EE
off_6FF92	dd VROOMM_StubThunk_6C9FF
off_6FF96	dd VROOMM_StubThunk_6C9F5
byte_6FF9A	db 0			; DATA XREF: Physics_ResolveWindVectorCached_4643B+8r
					; Physics_ResolveWindVectorCached_4643B+3Ew ...
dword_6FF9B	dd 0			; DATA XREF: Physics_ResolveWindVectorCached_4643B+19w
					; Physics_ResolveWindVectorCached_4643B+5Cr ...
dword_6FF9F	dd 0			; DATA XREF: Physics_ResolveWindVectorCached_4643B+21w
					; Physics_ResolveWindVectorCached_4643B+63r ...
dword_6FFA3	dd 0			; DATA XREF: Physics_ResolveWindVectorCached_4643B+29w
					; Physics_ResolveWindVectorCached_4643B+6Br ...
algn_6FFA7:
		align 2
dword_6FFA8	dd 0			; DATA XREF: Aero_FlowAngle_AoA_469FE+9Bw
					; Aero_FlowAngle_AoA_469FE+A7r ...
byte_6FFAC	db 0			; DATA XREF: FlightControl_InvalidateRollPitchCache+6w Aero_FlowAngle_AoA_469FE+Ar ...
dword_6FFAD	dd 0			; DATA XREF: Aero_FlowAngle_Sideslip_46AB5+9Bw
					; Aero_FlowAngle_Sideslip_46AB5+A7r ...
byte_6FFB1	db 0			; DATA XREF: FlightControl_InvalidateRollPitchCache+Bw Aero_FlowAngle_Sideslip_46AB5+Ar ...
dword_6FFB2	dd 0			; DATA XREF: FlightControl_CacheNamedParam+23w
					; FlightControl_CacheNamedParam+2Fr ...
byte_6FFB6	db 0			; DATA XREF: FlightControl_CacheNamedParam+9r
					; FlightControl_CacheNamedParam+27w ...
dword_6FFB7	dd 0			; DATA XREF: Aero_DynamicPressure_46D13:loc_46D87w
					; Aero_DynamicPressure_46D13+80r ...
byte_6FFBB	db 0			; DATA XREF: Aero_DynamicPressure_46D13+Ar
					; Aero_DynamicPressure_46D13:loc_46D8Bw	...
byte_6FFBC	db 0			; DATA XREF: FlightControl_ComputeWindComponent+Br
					; FlightControl_ComputeWindComponent+F0w ...
dword_6FFBD	dd 0			; DATA XREF: FlightControl_ComputeWeightedCoeff+24w
					; FlightControl_ComputeWeightedCoeff+49r ...
dword_6FFC1	dd 0			; DATA XREF: FlightControl_ComputeWeightedCoeff+2Cw
					; FlightControl_ComputeWeightedCoeff+5Dr ...
dword_6FFC5	dd 0			; DATA XREF: FlightControl_ComputeWeightedCoeff+34w
					; FlightControl_ComputeWeightedCoeff+71r ...
byte_6FFC9	db 0			; DATA XREF: FlightControl_InvalidateCacheB+6w FlightControl_ComputeWeightedCoeff+Ar ...
dword_6FFCA	dd 0			; DATA XREF: FlightControl_ResolveParamCached+17w
					; FlightControl_ResolveParamCached+54r ...
dword_6FFCE	dd 0			; DATA XREF: FlightControl_ResolveParamCached+13w
					; FlightControl_ResolveParamCached+5Br ...
dword_6FFD2	dd 0			; DATA XREF: FlightControl_ResolveParamCached+1Fw
					; FlightControl_ResolveParamCached+63r ...
byte_6FFD6	db 0			; DATA XREF: FlightControl_InvalidateCacheB:loc_470BFw
					; FlightControl_ResolveParamCached+7r	...
dword_6FFD7	dd 0			; DATA XREF: seg089:0190r seg089:020Br ...
dword_6FFDB	dd 0			; DATA XREF: FlightControl_CacheTripleParam_477F0+17w
					; FlightControl_CacheTripleParam_477F0+41r ...
dword_6FFDF	dd 0			; DATA XREF: FlightControl_CacheTripleParam_477F0+1Fw
					; FlightControl_CacheTripleParam_477F0:loc_47838r	...
dword_6FFE3	dd 0			; DATA XREF: FlightControl_CacheTripleParam_477F0+13w
					; FlightControl_CacheTripleParam_477F0+50r ...
byte_6FFE7	db 0			; DATA XREF: FlightControl_InvalidateCacheC+6w FlightControl_CacheTripleParam_477F0+7r ...
dword_6FFE8	dd 0			; DATA XREF: Aero_ComputeForcesMain_4791E+51Fr
					; seg102:1606w
dword_6FFEC	dd 0			; DATA XREF: Aero_ComputeForcesMain_4791E+526r
					; seg102:1616w
dword_6FFF0	dd 0			; DATA XREF: Aero_ComputeForcesMain_4791E+52Er
					; seg102:1626w
byte_6FFF4	db 0			; DATA XREF: FlightControl_InvalidateMainCache+6w Aero_ComputeForcesMain_4791E+Cr ...
		align 2
a____DataAirden	db '..\..\data\airdens.tbl',0
		align 2
aFuel_0		db 'FUEL',0             ; DATA XREF: seg103:1578o seg103:158Ao ...
aRudder		db 'RUDDER',0           ; DATA XREF: seg103:15F9o
					; seg103:loc_495CDo ...
aElevator	db 'ELEVATOR',0         ; DATA XREF: seg103:167Co seg103:1690o ...
aAileron	db 'AILERON',0          ; DATA XREF: seg103:16FFo
					; seg103:loc_496D3o ...
aLwing		db 'LWING',0            ; DATA XREF: seg103:1782o seg103:17CFo ...
aRwing		db 'RWING',0            ; DATA XREF: seg103:1796o seg103:17ADo ...
aEngine		db 'ENGINE',0           ; DATA XREF: seg103:1868o seg103:187Co ...
aLandgear	db 'LANDGEAR',0         ; DATA XREF: seg103:2C14o
aFlaps		db 'FLAPS',0            ; DATA XREF: JDYN_JumpToPoint_49242+22Bo
					; seg103:2B27o
		align 2
off_7004E	dd loc_37CF4
off_70052	dd Debris_NotifyChildValidate
off_70056	dd loc_37D2E
off_7005A	dd loc_37DD1
off_7005E	dd loc_4BA94
off_70062	dd loc_3CEED
off_70066	dd loc_4BCA6
off_7006A	dd loc_3CC4B
off_7006E	dd VROOMM_StubThunk_6BF65
off_70072	dd VROOMM_StubThunk_6BF6A
off_70076	dd Debris_BodyDetach
off_7007A	dd loc_37E12
off_7007E	dd loc_37E23
off_70082	dd loc_4BC9C
off_70086	dd loc_3805E
off_7008A	dd loc_3CC5D
off_7008E	dd loc_3CE02
off_70092	dd loc_3CC68
off_70096	dd loc_3CE0A
		dd loc_3CD62
off_7009E	dd loc_3CEB6
off_700A2	dd loc_380E1
off_700A6	dd loc_381C3
off_700AA	dd loc_3816D
off_700AE	dd loc_381D3
off_700B2	dd loc_3804E
off_700B6	dd loc_38056
off_700BA	dd loc_37E34
off_700BE	dd loc_37E3F
off_700C2	dd loc_37F99
off_700C6	dd loc_38090
		dd WorldObject_GetSignatureByte0_381E5
off_700CE	dd VROOMM_StubThunk_6BFB0
off_700D2	dd Debris_CombinePhysicsBodies
off_700D6	dd loc_38342
off_700DA	dd loc_37CF4
off_700DE	dd Debris_NotifyChildValidate
off_700E2	dd loc_37D2E
off_700E6	dd loc_37DD1
off_700EA	dd loc_4BFC9
off_700EE	dd loc_38046
off_700F2	dd loc_4C015
off_700F6	dd loc_3CC19
off_700FA	dd VROOMM_StubThunk_6C190
off_700FE	dd VROOMM_StubThunk_6C195
off_70102	dd Debris_BodyDetach
off_70106	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_7010A	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_7010E	dd loc_4C00B
off_70112	dd loc_4BFFE
off_70116	dd WorldObject_GetOrientationMatrix_3CB2D
off_7011A	dd WorldObject_SetOrientationMatrix_3CB95
off_7011E	dd loc_3809B
off_70122	dd loc_381BB
off_70126	dd loc_38127
off_7012A	dd loc_381CB
off_7012E	dd loc_380E1
off_70132	dd loc_381C3
off_70136	dd loc_3816D
off_7013A	dd loc_381D3
off_7013E	dd loc_3CC21
off_70142	dd loc_3CC36
off_70146	dd loc_3CB5B
		dd loc_3CB78
off_7014E	dd loc_3CBC6
off_70152	dd loc_3CB3A
off_70156	dd WorldObject_GetSignatureByte0_381E5
off_7015A	dd VROOMM_StubThunk_6BFB0
off_7015E	dd loc_4BE51
off_70162	dd loc_38342
off_70166	dd loc_4C7ED
off_7016A	dd loc_21E2C
off_7016E	dd loc_4CDEC
off_70172	dd loc_21E40
off_70176	dd loc_21E48
off_7017A	dd loc_4CD9F
off_7017E	dd loc_4CE5A
off_70182	dd loc_4CE91
off_70186	dd loc_21E88
aSmokeman	db 'SMOKEMAN',0
aSmokeslots	db 'SmokeSlots',0
off_7019E	dd loc_37CF4
off_701A2	dd Debris_NotifyChildValidate
off_701A6	dd loc_37D2E
off_701AA	dd loc_37DD1
off_701AE	dd loc_4C057
off_701B2	dd loc_38046
off_701B6	dd VROOMM_StubThunk_6CC10
off_701BA	dd loc_3CC19
off_701BE	dd VROOMM_StubThunk_6C190
off_701C2	dd VROOMM_StubThunk_6C195
		dd Debris_BodyDetach
off_701CA	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_701CE	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_701D2	dd loc_4C15E
off_701D6	dd loc_3805E
off_701DA	dd WorldObject_GetOrientationMatrix_3CB2D
off_701DE	dd WorldObject_SetOrientationMatrix_3CB95
off_701E2	dd loc_3809B
off_701E6	dd loc_381BB
off_701EA	dd loc_38127
off_701EE	dd loc_381CB
off_701F2	dd loc_380E1
off_701F6	dd loc_381C3
off_701FA	dd loc_3816D
off_701FE	dd loc_381D3
off_70202	dd loc_3CC21
off_70206	dd loc_3CC36
off_7020A	dd loc_3CB5B
off_7020E	dd loc_3CB78
off_70212	dd loc_3CBC6
off_70216	dd loc_3CB3A
		dd WorldObject_GetSignatureByte0_381E5
off_7021E	dd VROOMM_StubThunk_6BFB0
off_70222	dd Debris_CombinePhysicsBodies
off_70226	dd loc_38342
off_7022A	dd loc_4EB84
		dd loc_290DD
off_70232	dd loc_290E2
off_70236	dd loc_290E9
off_7023A	dd loc_290F0
off_7023E	dd loc_290FA
off_70242	dd loc_4EC16
off_70246	dd loc_2910B
off_7024A	dd loc_29110
off_7024E	dd loc_4EB32
off_70252	dd loc_4EB39
off_70256	dd loc_37CF4
off_7025A	dd Debris_NotifyChildValidate
		dd loc_37D2E
off_70262	dd loc_37DD1
off_70266	dd loc_4E5AC
off_7026A	dd loc_4E758
off_7026E	dd loc_4E453
off_70272	dd VROOMM_StubThunk_6BFB5
off_70276	dd VROOMM_StubThunk_6BF65
		dd VROOMM_StubThunk_6BF6A
off_7027E	dd Debris_BodyDetach
off_70282	dd loc_37E12
off_70286	dd loc_37E23
off_7028A	dd loc_4E43C
off_7028E	dd loc_4E446
off_70292	dd loc_38085
off_70296	dd loc_381B3
off_7029A	dd loc_4E601
off_7029E	dd loc_4E6AD
off_702A2	dd loc_4ED48
off_702A6	dd loc_381CB
		dd loc_380E1
off_702AE	dd loc_381C3
off_702B2	dd loc_3816D
off_702B6	dd loc_381D3
off_702BA	dd loc_3804E
off_702BE	dd loc_38056
off_702C2	dd loc_37E34
off_702C6	dd loc_37E3F
off_702CA	dd loc_37F99
off_702CE	dd loc_38090
off_702D2	dd WorldObject_GetSignatureByte0_381E5
off_702D6	dd VROOMM_StubThunk_6BFB0
off_702DA	dd loc_4E0E5
off_702DE	dd loc_38342
off_702E2	dd loc_37CF4
off_702E6	dd Debris_NotifyChildValidate
off_702EA	dd loc_37D2E
off_702EE	dd loc_37DD1
off_702F2	dd loc_4F213
off_702F6	dd loc_38046
off_702FA	dd loc_4F28B
off_702FE	dd loc_3CC19
off_70302	dd VROOMM_StubThunk_6C190
off_70306	dd VROOMM_StubThunk_6C195
		dd Debris_BodyDetach
off_7030E	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_70312	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_70316	dd loc_4F281
off_7031A	dd loc_3805E
off_7031E	dd WorldObject_GetOrientationMatrix_3CB2D
off_70322	dd WorldObject_SetOrientationMatrix_3CB95
off_70326	dd loc_3809B
off_7032A	dd loc_381BB
off_7032E	dd loc_38127
off_70332	dd loc_381CB
off_70336	dd loc_380E1
off_7033A	dd loc_381C3
off_7033E	dd loc_3816D
off_70342	dd loc_381D3
off_70346	dd loc_3CC21
off_7034A	dd loc_3CC36
off_7034E	dd loc_3CB5B
off_70352	dd loc_3CB78
off_70356	dd loc_3CBC6
off_7035A	dd loc_3CB3A
off_7035E	dd WorldObject_GetSignatureByte0_381E5
off_70362	dd VROOMM_StubThunk_6BFB0
off_70366	dd Debris_CombinePhysicsBodies
off_7036A	dd loc_38342
		dd loc_4F13B
off_70372	dd loc_2BDCF
		dd loc_2BDE8
		dd loc_2BDF8
off_7037E	dd loc_2BDC1
off_70382	dd loc_290FA
off_70386	dd loc_4EF74
off_7038A	dd loc_2910B
off_7038E	dd loc_2BE3B
off_70392	dd loc_4F1B9
off_70396	dd loc_4F1C0
off_7039A	dd loc_4EED0
off_7039E	dd VROOMM_StubThunk_6CCAA
off_703A2	dd loc_4ED94
off_703A6	dd loc_37CF4
off_703AA	dd Debris_NotifyChildValidate
off_703AE	dd loc_37D2E
off_703B2	dd loc_37DD1
off_703B6	dd Trigger_TimedRangedSpawnOnce_4F351
off_703BA	dd WorldObject_IntegrateBodyMotion_3D31D
off_703BE	dd Dtor_ScalarDeleting_4F316
off_703C2	dd loc_3CF4C
off_703C6	dd VROOMM_StubThunk_6C190
off_703CA	dd VROOMM_StubThunk_6C195
off_703CE	dd Debris_BodyDetach
off_703D2	dd WorldObject_ComposeOrientation3Angles_3CAE3
off_703D6	dd WorldObject_ComposeOrientationAngleArray_3CB0B
off_703DA	dd ClassStub_ReturnConst16h_4F30C
off_703DE	dd loc_3805E
off_703E2	dd WorldObject_GetOrientationMatrix_3CB2D
off_703E6	dd WorldObject_SetOrientationMatrix_3CB95
off_703EA	dd loc_3CFFF
off_703EE	dd loc_3D0F9
off_703F2	dd loc_3D246
off_703F6	dd loc_3D2E6
off_703FA	dd loc_3CF5E
off_703FE	dd loc_3CFD5
off_70402	dd loc_3D1A5
off_70406	dd loc_3D21C
off_7040A	dd loc_3CC21
off_7040E	dd loc_3CC36
off_70412	dd loc_3CB5B
off_70416	dd loc_3CB78
off_7041A	dd loc_3CBC6
off_7041E	dd loc_3CB3A
off_70422	dd WorldObject_GetSignatureByte0_381E5
off_70426	dd VROOMM_StubThunk_6BFB0
off_7042A	dd Debris_CombinePhysicsBodies
off_7042E	dd loc_38342
unk_70432	db  54h	; T		; DATA XREF: Terrain_SectorIndexResolve:loc_3358Ao
					; TextureLoader_OpenAndLoadFull_98A60+24o ...
unk_70433	db  58h	; X
		db  4Dh	; M
		db    0
a_pak_1		db '.PAK',0             ; DATA XREF: Terrain_SectorIndexResolve:loc_33582o
					; TextureLoader_OpenAndLoadFull_98A60+100o ...
a_txm		db '.TXM',0             ; DATA XREF: TextCycler_LoadFromIndexedReader_A713E:loc_A7187o
aSD_1		db '%s%d',0
algn_70445:
		align 2
byte_70446	db 0			; DATA XREF: World_ParseWrldForm_A767F+Br
					; World_ParseWrldForm_A767F+225w ...
byte_70447	db 1			; DATA XREF: Player_MainUpdate:loc_1391Cw
					; EntityTracker_ApplySelection:loc_23CE6w	...
dword_70448	dd 0			; DATA XREF: seg014:05F2r seg014:062Ar ...
dword_7044C	dd 0			; DATA XREF: seg112:0A9Dw
					; Weapon_HUDBox_ComputeGeometry_58F42+77r ...
dword_70450	dd 0			; DATA XREF: seg030:0486r seg030:07B0r ...
dword_70454	dd 0			; DATA XREF: Formation_GuidanceSolution+996r
					; Formation_GuidanceSolution+9ADr ...
dword_70458	dd 0			; DATA XREF: seg003:0D10r seg003:14BCr ...
word_7045C	dw 1			; DATA XREF: Frame_UpdateTimingAndNotifyTrackedObjects_500F6:loc_50123w
					; UIScreen_RenderGraphVGA_509EE+48r
dword_7045E	dd 0			; DATA XREF: seg085:004Cr seg085:0069r ...
dword_70462	dd 0			; DATA XREF: seg085:01E4r seg085:0201r ...
word_70466	dw 0			; DATA XREF: AI_TopLevelThink:loc_81D4r
					; Player_MainUpdate:loc_1367Dr	...
dword_70468	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+100w
					; CombatTarget_WeaponActionSubsystem+104r ...
byte_7046C	db 0			; DATA XREF: CombatTarget_WeaponActionSubsystem:loc_4FCA5w
					; CombatTarget_WeaponActionSubsystem+31Fw ...
byte_7046D	db 0			; DATA XREF: CombatTarget_WeaponActionSubsystem:loc_4FC6Dw
					; CombatTarget_WeaponActionSubsystem+B9w ...
word_7046E	dw 1			; DATA XREF: CombatTarget_WeaponActionSubsystem+BEr
					; CombatTarget_WeaponActionSubsystem+C5w ...
unk_70470	db    1
byte_70471	db 0			; DATA XREF: Mission_TriggerEvaluator+3Cr
					; Mission_TriggerEvaluator:loc_2308Er	...
word_70472	dw 0			; DATA XREF: AI_EvalTargetAttribute+51r seg095:01A9r ...
word_70474	dw 0			; DATA XREF: AI_Sensor_InterceptFeasibleCached+8Ar seg003:0C64r ...
byte_70476	db 0			; DATA XREF: CombatTarget_WeaponActionSubsystem:loc_4FC62r
					; CombatTarget_WeaponActionSubsystem+76w ...
byte_70477	db 0			; DATA XREF: Cockpit_ViewPanTransitionMain_15B67:loc_15E79r
					; MissionLoader_SpawnEntity_A7B1E+134w
byte_70478	db 1			; DATA XREF: seg020:loc_17931w
					; UIScreen_ComputeDerivedFields_503EB:loc_503FEr	...
word_70479	dw 0			; DATA XREF: Debris_SpawnOrchestrator:loc_3868Bw
					; HUD_RenderSymbologyMain:loc_3E8D1r	...
word_7047B	dw 0			; DATA XREF: Debris_SpawnOrchestrator+64w
					; HUD_RenderSymbologyMain+E84r ...
word_7047D	dw 0			; DATA XREF: Debris_SpawnOrchestrator+4Bw
					; HUD_RenderSymbologyMain+187r ...
word_7047F	dw 0			; DATA XREF: Debris_SpawnOrchestrator+32w
					; HUD_RenderSymbologyMain+BDDr ...
word_70481	dw 0			; DATA XREF: Debris_SpawnOrchestrator:loc_38672w
					; HUD_RenderSymbologyMain:loc_3F327r	...
word_70483	dw 0			; DATA XREF: Emitter_UpdateFromEntitySMOKVec_3D57E:loc_3D5A0r
					; Emitter_UpdateFromEntitySMOKVec_3D57E+426r ...
dword_70485	dd 0			; DATA XREF: seg019:021Cr
					; Audio3D_StereoPan+13r ...
dword_70489	dd 0			; DATA XREF: Radar_Project3DToScreen+7D8r
					; seg024:0508r	...
dword_7048D	dd 0			; DATA XREF: Radar_Project3DToScreen+789r
					; seg019:02FDr	...
dword_70491	dd 0			; DATA XREF: Radar_Project3DToScreen+82Cr
					; Radar_Project3DToScreen+86Dr ...
word_70495	dw 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+11Aw
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+1E1w ...
byte_70497	db 0			; DATA XREF: Player_MainUpdate+7w
					; Player_MainUpdate:loc_139DDw	...
aTimeCompressio	db 'Time Compression %dx',0
aGamePaused	db 'game paused',0      ; DATA XREF: CombatTarget_WeaponActionSubsystem+20Eo
aTimeBurst	db 'Time Burst',0       ; DATA XREF: CombatTarget_WeaponActionSubsystem+3A9o
aMissions	db 'MISSIONS',0         ; DATA XREF: World_OpenAndParseFile_A75D0+4Bo
dword_704CD	dd 454E4F4Eh		; DATA XREF: PlayerComponent_ReadFieldAndDispatch_9DF2A:loc_9DF30o
					; PlayerComponent_LoadAndApply_9EDD4+14Do ...
dword_704D1	dd 0			; DATA XREF: MissionLoader_LoadFormation_A78F5+43r
dword_704D5	dd 4E5553h		; DATA XREF: MissionLoader_SpawnEntity_A7B1E+FFr
dword_704D9	dd 0			; DATA XREF: MissionLoader_SpawnEntity_A7B1E+10Ar
dword_704DD	dd 0			; DATA XREF: Camera_ComputeViewMatrix+60r
					; Camera_ComputeViewMatrix+75r ...
dword_704E1	dd 0			; DATA XREF: Camera_ComputeViewMatrix:loc_2E3CEr
					; World_ParseWrldForm_A767F:loc_A773Bw	...
		align 2
word_704E6	dw 0			; DATA XREF: Targeting_AcquireBestThreat+B67r
					; AI_TopLevelThink+1F0r ...
dword_704E8	dd 0			; DATA XREF: Damage_SimulationTick+96Cw
					; UIScreen_RenderGraphVGA_509EE+11Fr ...
dword_704EC	dd 0			; DATA XREF: Damage_SimulationTick+967w
					; UIScreen_RenderGraphVGA_509EE+11Ar ...
dword_704F0	dd 0			; DATA XREF: seg077:0362w
					; UIScreen_RenderGraphVGA_509EE+115r
aFpsSPrimitives	db 'FPS = %s Primitives:%d Objs:%d FM:%ld NM:%d Ticks:%d',0
aEmsUsedLdEmsLe	db 'EMS Used:%ld  EMS Left:%ld EMS BigBlock: %ld',0
aRndLdSkyLdPerL	db 'RND:%ld  SKY:%ld PER:%ld[%d:%ld,%ld] SRT:%ld DRW:%ld SLM:%ld',0
aUpdLdOblLdColL	db 'UPD:%ld   OBL:%ld COL:%ld PFR:%ld CAM:%ld',0
aColLdClrLdTerL	db 'COL:%ld   CLR:%ld TER:%ld OBJ:%ld HDL:%ld',0
aObjLdJetLdSmkL	db 'OBJ:%ld   JET:%ld SMK:%ld DBR:%ld OTH:%ld',0
aMisnDTerDPerDC	db 'MISN:%d Ter:%d, Per:%d, Clip:%d',0
aScoreLd	db 'SCORE: %ld',0
aAiSelectDPcoll	db 'AI: SELECT: %d, pCOLL: %d, gCOLL %d, STL: %d',0
aMoreDEvalDUsew	db '    MORE: %d, EVAL: %d, UseWeapon: %d',0
		align 2
aPlayer_0	db 'PLAYER',0           ; DATA XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+1Eo
					; MissionScenario_ConvertFieldValue_A8B8F+7o
algn_70697:
		align 2
aNetwork	db 'NETWORK',0          ; DATA XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+43o
word_706A0	dw 0			; DATA XREF: seg004:0811r seg004:0939r ...
byte_706A2	db 0FFh			; DATA XREF: STRIKE_EXE_MAIN_LOOP+15r
					; Weapon_HUDBox_InstantiateInstance_5AA02:loc_5AA3Cr	...
word_706A3	dw 0			; DATA XREF: Goal_IsComplete:loc_A82Er
					; AI_ComputeMorale_CD4A:loc_CEC4r ...
word_706A5	dw 0			; DATA XREF: Goal_IsComplete+15Fr
					; AI_ComputeMorale_CD4A+187r ...
word_706A7	dw 0			; DATA XREF: Goal_IsComplete+151r
					; AI_ComputeMorale_CD4A:loc_CEDAr ...
word_706A9	dw 0			; DATA XREF: Goal_IsComplete+155r
					; AI_ComputeMorale_CD4A+193r ...
dword_706AB	dd 0			; DATA XREF: seg009:0474w
					; UIScreen_RenderGraphVGA_509EE+2E6r ...
byte_706AF	db 0FFh			; DATA XREF: Player_MainUpdate+CBw
					; Expr_VM_Interpreter_51106+56w ...
dword_706B0	dd 0			; DATA XREF: Expr_VM_Interpreter_51106+B2Fw
byte_706B4	db 0			; DATA XREF: Expr_VM_Interpreter_51106+B24r
					; Expr_VM_Interpreter_51106+B2Bw
aVersionFI_ISS	db 'Version: f%i.%i%s -- %s',0
aStayOnTarget	db 'STAY ON TARGET',0   ; DATA XREF: UIScreen_RenderOrLayoutList_54503+42o
aEnemiesNear	db 'ENEMIES NEAR',0     ; DATA XREF: UIScreen_RenderOrLayoutList_54503+18Co
aOutOfFuel	db 'OUT OF FUEL',0      ; DATA XREF: UIScreen_RenderOrLayoutList_54503+1CEo
aEngineOut	db 'ENGINE OUT',0       ; DATA XREF: UIScreen_RenderOrLayoutList_54503+20Eo
aAlreadyNear	db 'ALREADY NEAR',0     ; DATA XREF: UIScreen_RenderOrLayoutList_54503+295o
algn_7070D:
		align 2
byte_7070E	db 0			; DATA XREF: MissionScenario_ConstructAndBindUI_A81E0+17r
					; MissionScenario_LoadFromIFF_A8C44:loc_A8C50w	...
aMissions_0	db 'MISSIONS',0         ; DATA XREF: MissionScenario_LoadMainRecord_A8331:loc_A83C1o
dword_70718	dd 54534E49h		; DATA XREF: HUD_ResolveNodePosition_547B1+Ar
					; MissionScenario_LoadMainRecord_A8331+44r ...
dword_7071C	dd 544E41h		; DATA XREF: HUD_ResolveNodePosition_547B1:loc_547C6r
					; MissionScenario_LoadMainRecord_A8331:loc_A8380r	...
unk_70720	db  2Eh	; .		; DATA XREF: MissionScenario_LoadFromIFF_A8C44+2Co
					; MissionScenario_ResolveAndBindExpressions_A8F22+27o
		db  5Ch	; \
		db    0
aOp2misn	db 'OP2MISN',0          ; DATA XREF: MissionScenario_LoadFromIFF_A8C44+28o
aMisn2op	db 'MISN2OP',0          ; DATA XREF: MissionScenario_ResolveAndBindExpressions_A8F22+23o
a_		db '.\',0               ; DATA XREF: MissionScenario_LoadMainRecord_A8331+68o
a_iff_0		db '.iff',0             ; DATA XREF: MissionScenario_LoadMainRecord_A8331+62o
aPlayer_2	db 'PLAYER',0
aOldMisnXVsX	db 'old MISN %X vs %X',0Ah,0
off_70755	dd ResourceRecord_Construct_6450B
off_70759	dd VROOMM_StubThunk_6CE15
off_7075D	dd ResourceRecord_RefreshPosition_6455E
off_70761	dd ResourceRecord_Method_ResolveOptionalField_649F0
off_70765	dd ResourceRecord_Method_GetType_64E05
off_70769	dd StreamReader_ReadDispatch_63D0E
off_7076D	dd ResourceRecord_Construct_6450B
off_70771	dd VROOMM_StubThunk_6CE10
off_70775	dd ResourceRecord_RefreshPosition_6455E
off_70779	dd ResourceRecord_Method_ResolveOptionalField_649F0
off_7077D	dd ResourceRecord_Method_GetType_64E05
off_70781	dd StreamReader_ReadDispatch_63D0E
		align 2
a20mm		db '20MM',0
aBilly		db 'BILLY',0            ; DATA XREF: PLAY_LoadCASTTeamNames_A9956+8Ao
off_70791	dd HitShape_ClassStub_ReturnConst43h_52F92
off_70795	dd HitShape_Radial2D_ContainsPoint_52F99
off_70799	dd HitShape_ClassStub_ReturnConst42h_52F8B
off_7079D	dd HitShape_Box_ContainsPoint_52F0F
off_707A1	dd HitShape_ClassStub_ReturnConst53h_52F08
off_707A5	dd HitShape_Sphere_ContainsPoint_52E91
off_707A9	dd loc_26F6F
		dd loc_26F6F
algn_707B1:
		align 2
dword_707B2	dd 0			; DATA XREF: Aero_FlowAngle_AoA_469FE:loc_46A4Br
					; Aero_FlowAngle_Sideslip_46AB5:loc_46B02r	...
dword_707B6	dd 0			; DATA XREF: seg103:37FAr seg115:06C5w
dword_707BA	dd 0			; DATA XREF: seg115:06D5w
dword_707BE	dd 0			; DATA XREF: Math_Tan_548AD+5Cr
					; Math_Tan_548AD:loc_5490Fr	...
unk_707C2	db    1			; DATA XREF: UIScreen_BuildFormattedText_54CC9+77o
unk_707C3	db    0
		db  0Ah
		db    0
unk_707C6	db  64h	; d
unk_707C7	db    0
unk_707C8	db 0E8h	; �
unk_707C9	db    3
		db  25h	; %
		db  64h	; d
unk_707CC	db    0
unk_707CD	db  25h	; %
		db  6Ch	; l
unk_707CF	db  64h	; d
unk_707D0	db    0
unk_707D1	db  25h	; %
unk_707D2	db  64h	; d
unk_707D3	db    0
dword_707D4	dd 0			; DATA XREF: Matrix_BuildFromAngle_56D72+7r HUD_EncodeHelperSub_57EDD+6r ...
dword_707D8	dd 0			; DATA XREF: Matrix_BuildFromAngle_56D72+Er HUD_EncodeHelperSub_57EDD+Er ...
dword_707DC	dd 0			; DATA XREF: Matrix_BuildFromAngle_56D72+16r
					; HUD_EncodeHelperSub_57EDD+17r ...
dword_707E0	dd 0			; DATA XREF: AI_IncomingThreatWarning:loc_54D8r
					; AI_Sensor_WeaponVelocityCache:loc_6530r ...
dword_707E4	dd 0			; DATA XREF: AI_IncomingThreatWarning+14Er
					; AI_Sensor_WeaponVelocityCache+CFr	...
dword_707E8	dd 0			; DATA XREF: AI_IncomingThreatWarning+156r
					; AI_Sensor_WeaponVelocityCache+D7r	...
dword_707EC	dd 0			; DATA XREF: Matrix_BuildFromAngle_56D72+36r
					; HUD_EncodeHelperSub_57EDD+3Br ...
dword_707F0	dd 0			; DATA XREF: Matrix_BuildFromAngle_56D72+3Er
					; HUD_EncodeHelperSub_57EDD+44r ...
dword_707F4	dd 0			; DATA XREF: Matrix_BuildFromAngle_56D72+46r
					; HUD_EncodeHelperSub_57EDD+4Dr ...
dword_707F8	dd 0			; DATA XREF: seg078:047Br seg078:04C1r ...
dword_707FC	dd 0			; DATA XREF: seg078:0482r seg078:04C8r ...
dword_70800	dd 0			; DATA XREF: seg078:048Ar seg078:04D0r ...
aSSS		db '(%s,%s,%s)',0
aSS_0		db '(%s,%s)',0
aSSSSSSSSS	db '(%s,%s,%s),(%s,%s,%s),(%s,%s,%s)',0
word_70838	dw 0			; DATA XREF: Render_DitheredLineMain_58B97+FDr
					; Render_DitheredLineMain_58B97+154r
word_7083A	dw 0			; DATA XREF: Render_DitheredLineSpan_58A7A+1Cr
					; Render_DitheredLineSpanVariant_58AFA+49r ...
word_7083C	dw 0			; DATA XREF: Render_DitheredLineSpan_58A7A+8r
					; Render_DitheredLineSpan_58A7A+2Fr ...
word_7083E	dw 0			; DATA XREF: Render_DitheredLineSpanVariant_58AFA+Ar
					; Render_DitheredLineSpanVariant_58AFA+2Er ...
word_70840	dw 0			; DATA XREF: Render_DitheredLineSpan_58A7A+2r
					; Render_DitheredLineSpan_58A7A+3Er ...
word_70842	dw 0			; DATA XREF: Render_DitheredLineSpanVariant_58AFA+2r
					; Render_DitheredLineSpanVariant_58AFA+3Dr ...
word_70844	dw 0			; DATA XREF: Render_DitheredLineSpanVariant_58AFA+50r
					; Render_DitheredLineSpanVariant_58AFA+87r ...
byte_70846	db 0F0h			; DATA XREF: Render_DitheredLineMain_58B97+E9r
algn_70847:
		align 2
byte_70848	db 0FFh			; DATA XREF: Render_DitheredLineMain_58B97:loc_58C7Br
		align 2
byte_7084A	db 0			; DATA XREF: seg121:loc_595B2w
					; Interrupt_TimerCase_595C2+13Aw ...
byte_7084B	db 0			; DATA XREF: TextRenderer_Main+829w
					; AudioQueue_UnregisterAndCleanup_AB44A+7r	...
word_7084C	dw 0			; DATA XREF: TextRenderer_Main+833w
					; TextObject_AllocateVariantA_5A984+14r ...
word_7084E	dw 0			; DATA XREF: Interrupt_TimerCase_595C2+134r
					; AudioQueue_ProcessAndAdvance_AAFA0+59w ...
word_70850	dw 0			; DATA XREF: AudioQueue_ProcessMain_AA84E+366w
					; AudioQueue_ProcessMain_AA84E:loc_AAC66r	...
word_70852	dw 0			; DATA XREF: TextRenderer_Main+83Cw
					; TextRenderer_Main+84Br ...
word_70854	dw 0			; DATA XREF: seg121:0582r
					; Interrupt_TimerCase_595C2+54r ...
word_70856	dw 0			; DATA XREF: Interrupt_TimerCase_595C2+15Cr
					; AudioQueue_ProcessAndAdvance_AAFA0+73w ...
byte_70858	db 0			; DATA XREF: seg121:loc_59420r
					; seg121:loc_5947Ew ...
word_70859	dw 0FFFFh		; DATA XREF: Weapon_HUDBox_UpdateAndRender_5923A+B9w
					; Weapon_HUDBox_Main_59302+41r ...
word_7085B	dw 0FFFFh		; DATA XREF: seg121:loc_594F4r
					; Interrupt_TimerCase_595C2:loc_595EDw	...
dword_7085D	dd 0			; DATA XREF: Interrupt_TimerCase_595C2+AAr
					; AudioQueue_ProcessMain_AA84E+38Bw ...
dword_70861	dd 0			; DATA XREF: Interrupt_TimerCase_595C2+88r
					; AudioQueue_ProcessMain_AA84E+2D9w ...
word_70865	dw 0FFFFh		; DATA XREF: AudioQueue_ProcessMain_AA84E:loc_AA86Br
					; AudioQueue_ProcessMain_AA84E+133r ...
word_70867	dw 0			; DATA XREF: AudioQueue_ProcessMain_AA84E:loc_AAA61r
					; AudioQueue_ProcessMain_AA84E:loc_AAA67r	...
byte_70869	db 0			; DATA XREF: TextRenderer_Main+82Ew
					; Weapon_HUDBox_UpdateAndRender_5923A:loc_592DFr	...
byte_7086A	db 0			; DATA XREF: Weapon_HUDBox_UpdateAndRender_5923A+2Dr
					; Weapon_HUDBox_UpdateAndRender_5923A:loc_59287r	...
		align 2
a_dat		db '.dat',0             ; DATA XREF: AudioQueue_ProcessMain_AA84E+34o
a_adl		db '.adl',0
a_rol		db '.rol',0
		align 2
byte_7087C	db 0			; DATA XREF: AudioQueue_AdvanceAndRelease_AB7A4+8r AudioQueue_AdvanceAndRelease_AB7A4+Fw ...
word_7087D	dw 0			; DATA XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10:loc_59B21r
					; Weapon_HUDBox_UpdateGeometryAndTimer_59B10+17w
word_7087F	dw 4000h		; DATA XREF: Weapon_HUDBox_MasterUpdate_59CFA+1CEr
					; Weapon_HUDBox_MasterUpdate_59CFA+202w
algn_70881:
		align 2
a_adl_0		db '.adl',0
a_rol_0		db '.rol',0
aSoundfx	db 'soundfx',0          ; DATA XREF: AudioQueue_LoadAndPlayEntry_AB592+35o
aNoMemForXmidiS	db 'No mem for XMIDI state table.',0
aSound		db 'SOUND',0            ; DATA XREF: TextRenderer_InputFieldHandler_5A0F3+44o
					; TextRenderer_InputFieldHandler_5A0F3+27Do ...
aStrikeCommande	db 'Strike Commander cannot locate the sound card(s) you have selecte'
		db 'd.',0Ah
		db 'Please run INSTALL and make sure your sound card settings are cor'
		db 'rect.',0Ah,0
a_drv		db '.drv',0
aNoMemoryForSou	db 'No memory for sound driver.',0Ah,0
aNoMemoryForTim	db 'No memory for timbre cache.',0Ah,0
aStrike		db 'strike',0
aScscscfy	db 'SCSCSCFY!',0        ; DATA XREF: TextObject_CloseAndLog_5A856+15o
byte_70994	db 0			; DATA XREF: AudioQueue_ReleaseAndCoalesce_ABAAD+8r
					; AudioQueue_ReleaseAndCoalesce_ABAAD:loc_ABB04w
		align 2
byte_70996	db 0			; DATA XREF: TextRenderer_Main:loc_278A7w
					; TextRenderer_Main:loc_27940w	...
word_70997	dw 0			; DATA XREF: TextRenderer_Main:loc_279E8w
					; TextRenderer_Main:loc_279EBr	...
word_70999	dw 0			; DATA XREF: TextRenderer_Main:loc_27B6Ew
					; TextRenderer_Main:loc_27B71r	...
word_7099B	dw 0			; DATA XREF: TextRenderer_Main:loc_27D67w
					; Widget_ApplyLayoutHelper_5A88F+22r ...
word_7099D	dw 0			; DATA XREF: TextRenderer_Main:loc_27CECw
					; Widget_ApplyLayoutHelper_5A88F+Ar	...
word_7099F	dw 0			; DATA XREF: TextRenderer_Main:loc_27DDDw
					; Widget_ApplyLayoutHelper_5A88F+3Ar ...
byte_709A1	db 0			; DATA XREF: Program_InitVideoFontArgs:loc_144B2w
					; Program_InitVideoFontArgs:loc_144CEw	...
aInvalidTuneReq	db 'Invalid tune requested: %d',0Ah,0
byte_709BE	db 0			; DATA XREF: Registry_MainOperation_5B26B+Fr
					; Registry_MainOperationVariant_5B421:loc_5B43Dr	...
dword_709BF	dd 0			; DATA XREF: Registry_ResolveOrInsertNode_5AE5F+6r
					; Registry_ResolveOrInsertNode_5AE5F+12w ...
byte_709C3	db 0			; DATA XREF: Registry_MainOperation_5B26B:loc_5B294w
					; Registry_MainOperationVariant_5B421:loc_5B467w	...
dword_709C4	dd 0			; DATA XREF: Registry_LookupForTextRenderer_5B5D9+36w
					; Registry_LookupForTextRenderer_5B5D9+6Fw ...
dword_709C8	dd 0			; DATA XREF: Registry_LookupForTextRenderer_5B5D9+32w
					; Registry_LookupForTextRenderer_5B5D9+5Dr ...
dword_709CC	dd 0			; DATA XREF: Sequencer_ValidatePlacement_5A62A:loc_5A698r
					; PagedMemory_LoadPage_5B813+3r	...
word_709D0	dw 0FFFFh		; DATA XREF: seg121:0569r seg121:05B6r ...
word_709D2	dw 0			; DATA XREF: PagedMemory_InitDriver_5B89D:loc_5B8C9w
					; PagedMemory_InitDriver_5B89D+30r ...
word_709D4	dw 0			; DATA XREF: PagedMemory_InitDriver_5B89D+57w
					; PagedMemory_InitDriver_5B89D+5Br ...
word_709D6	dw 0			; DATA XREF: PagedMemory_InitDriver_5B89D+86w
					; PagedMemory_InitDriver_5B89D+8Ar ...
dword_709D8	dd 0			; DATA XREF: PagedMemory_InitDriver_5B89D+65w
					; File_ReadViaPagedMemory_63294+6Cr ...
dword_709DC	dd 0			; DATA XREF: PagedMemory_InitDriver_5B89D+94w
					; PagedMemory_ResolveAddress_5BBCC+9Ar ...
dword_709E0	dd 0			; DATA XREF: PagedMemory_InitDriver_5B89D+3Aw
					; PagedMemory_ReadStruct_5B9F1+82r ...
aCurrentStateOf	db 'Current state of EMS heap:',0Ah,0
aSBlockAt08lxSi	db '%s block at %08lX, size = %lu ',0Ah,0
aAllocated	db 'Allocated',0
aFree		db 'Free',0
aTotalBytesFree	db 'Total bytes free: %lu',0Ah
		db 'Total bytes allocated: %lu',0Ah,0
algn_70A61:
		align 2
byte_70A62	db 0			; DATA XREF: seg128:00B7r seg128:00C2w ...
off_70A63	dd PagedMemory_Method_Init_5C13C
off_70A67	dd PagedMemory_Method_ReadDword_5C089
off_70A6B	dd PagedMemory_Method_WriteDwordIfSet_5C0B0
off_70A6F	dd PagedTextObject_Method_5C208
off_70A73	dd PagedMemory_Method_WriteByte_5C0ED
		dd PagedMemory_Method_Query_5C119
off_70A7B	dd PagedMemory_Method_ReturnTrue_5C126
off_70A7F	dd PagedTextObject_Method_ReadDefault_5C221
off_70A83	dd PagedTextObject_Method_ReturnType3_5C23A
off_70A87	dd PagedTextObject_Construct_5C1C9
off_70A8B	dd DisplayContext_Method_PassThrough_5F458
off_70A8F	dd PagedTextObject_DtorThunkA_5C244
off_70A93	dd DisplayContext_Method_PassThrough_5F458
off_70A97	dd PagedTextObject_ConstructVariant_5C250
off_70A9B	dd PagedResourceC_Method_PassThrough_5F4D8
off_70A9F	dd loc_26F6F
off_70AA3	dd loc_26F6F
		dd loc_26F6F
off_70AAB	dd loc_26F6F
off_70AAF	dd loc_26F6F
off_70AB3	dd loc_26F6F
off_70AB7	dd loc_26F6F
off_70ABB	dd loc_26F6F
off_70ABF	dd PagedTextObjectB_Construct_5C27E
off_70AC3	dd DisplayContext_Method_PassThrough_5F458
off_70AC7	dd PagedTextObjectB_DtorThunk_5C2B3
		align 2
byte_70ACC	db 0			; DATA XREF: seg129:0092r
					; PagedResourceB_Construct_5C34F+52r ...
aIllegalReIniti	db 'Illegal re-initialization of Far memory',0Ah,0
off_70AF6	dd PagedResourceB_Method_NoOp_5C347
off_70AFA	dd PagedResourceB_Method_Write_5C2CF
off_70AFE	dd PagedResourceB_Method_ReleaseIfSet_5C2E6
off_70B02	dd PagedResourceB_Method_Call3Args_5C309
off_70B06	dd PagedResourceB_Method_PassThrough_5C3FE
off_70B0A	dd PagedResourceB_Method_Init_5C324
off_70B0E	dd PagedResourceB_Method_ReturnZero_5C40C
off_70B12	dd PagedResourceB_Method_ReturnType2_5C331
off_70B16	dd PagedResourceB_Method_ReturnType2B_5C416
off_70B1A	dd PagedResourceB_ConstructThunk_5C3C9
off_70B1E	dd DisplayContext_Method_PassThrough_5F458
off_70B22	dd PagedResourceB_ConstructThunkAdjustor_5C420
unk_70B26	db  0Ah
unk_70B27	db    0
unk_70B28	db  0Ah
unk_70B29	db  25h	; %
unk_70B2A	db  73h	; s
		db  0Ah
unk_70B2C	db    0
unk_70B2D	db  0Ah
aError0x0103	db 'Error: 0x0103',0Ah,0
aFailedMemoryTy	db 'Failed Memory Type: %d (Near)',0Ah,0
aError0x0203	db 0Ah
		db 'Error: 0x0203',0Ah,0
aFailedMemory_0	db 'Failed Memory Type: %d (Far)',0Ah,0
		db  0Ah
aError0x0303	db 'Error: 0x0303',0Ah,0
aFailedMemory_1	db 'Failed Memory Type: %d (EMS)',0Ah,0
aBytesAskedForL	db 'Bytes asked for   : %ld',0Ah
		db 'Bytes available   : %ld',0Ah,0
unk_70BE9	db    0
byte_70BEA	db 0			; DATA XREF: Memory_AllocatorTableConstructor_5C9D3+2Ar
					; Memory_AllocatorTableConstructor_5C9D3:loc_5CA0Dw	...
aHandlerDAttach	db 'handler %d attached with %ld bytes available ',0Ah,0
aHandlerDOff	db 'handler %d off',0Ah,0
aIllegalReInsta	db 'Illegal re-instantiation of MemoryManger',0Ah,0
aMemoryOriginal	db 27h,'Memory: Original  Current     Used',0Ah
		db 27h,'NEAR       %5ld    %5ld    %5ld',0Ah
		db 27h,'FAR     %8ld %8ld %8ld',0Ah
		db 27h,'HIGH    %8ld %8ld %8ld',0Ah,0
byte_70CCA	db 0			; DATA XREF: seg134:0085r
					; PagedResourceC_Construct_5CD3A+52r ...
aIllegalReIni_0	db 'Illegal re-initialization of Near memory',0Ah,0
off_70CF5	dd PagedResourceC_Method_PassThrough_5F4D8
off_70CF9	dd PagedResourceC_Method_Allocate_5CCBB
		dd PagedResourceC_Method_ReleaseIfSet_5CCCE
off_70D01	dd PagedResourceC_Method_Call2Args_5CCF3
off_70D05	dd PagedResourceC_Method_PassThrough_5CDAE
		dd PagedResourceC_Method_GetValue_5CD0C
		dd PagedResourceC_Method_ReturnZero_5CDBC
off_70D11	dd PagedResourceC_Method_Init_5CD22
off_70D15	dd PagedResourceC_Method_ReturnTrue_5CDC6
off_70D19	dd PagedResourceC_ConstructThunk_5CDD0
off_70D1D	dd DisplayContext_Method_PassThrough_5F458
off_70D21	dd PagedResourceC_ConstructThunkAdjustor_5CDFE
		align 2
aFarHeapAllocat	db 'Far Heap Allocation error #%04X',0Ah,0
aFreeBlock02dAt	db '  Free block #%02d at %04X:0000, size = %ld',0Ah,0
aCurrentState_0	db 'Current state of heap:',0Ah,0
aSBlockAt04x000	db '%s block at %04X:0000, size = %ld',0Ah,0
aAllocated_0	db 'Allocated',0
aFree_0		db 'Free',0
aTotalBytesFr_0	db 'Total bytes free: %ld',0Ah
		db 'Total bytes allocated: %ld',0Ah,0
aSBlockAtDs04xS	db '%s block at DS:%04X, size = %u ',0Ah,0
aAllocated_1	db 'Allocated',0
aFree_1		db 'Free',0
word_70E20	dw 0			; DATA XREF: Runtime_StackCheckHelperA_5D104+33r
					; Runtime_StackCheckHelperA_5D104+3Aw ...
word_70E22	dw 0			; DATA XREF: Heap_ValidateBlockDetailed_5CFF8+8r
					; Runtime_StackCheckHelperA_5D104+2Bw
word_70E24	dw 0			; DATA XREF: Runtime_StackCheckHelperA_5D104:loc_5D133w
					; Runtime_StackOverflowCheck_5D22B+19r ...
byte_70E26	db 0			; DATA XREF: Runtime_StackCheckHelperA_5D104+7Bw
					; Runtime_StackOverflowCheck_5D22B+6r
byte_70E27	db 0			; DATA XREF: Heap_ValidateBlockDetailed_5CFF8:loc_5D00Br
					; Runtime_StackOverflowCheck_5D22B:loc_5D23Br	...
word_70E28	dw 0			; DATA XREF: seg135:0014r
					; PagedResourceB_TreeSearchRecursive_5D482+86r ...
aInvalidPointer	db 'Invalid pointer free',27h,'d at %04X:%04X, PSP = %0X',0Ah
		db 0Dh,0
		align 2
word_70E5C	dw 0			; DATA XREF: seg135:00B1r
					; PagedResourceB_TreeSearchRecursive_5D482:loc_5D53Br	...
word_70E5E	dw 0			; DATA XREF: seg135:01A9r seg135:01B9r ...
word_70E60	dw 0			; DATA XREF: seg027:019Fr
					; Widget_DrawTooltip+25r ...
word_70E62	dw 0			; DATA XREF: UI_RenderFormattedText+83r
					; UI_RenderFormattedText:loc_145AEr	...
off_70E64	dd CachedObject_Method_InitFromFields_5DFF4
off_70E68	dd CachedObject_BuildComposite_5E00C
off_70E6C	dd CachedObject_Method_CopyAndDispatch_5E09F
off_70E70	dd CachedObject_AllocateAndInit_5DFBE
		dd CachedObject_Method_CopyAndDispatchB_5E0E0
		dd CachedObject_Method_SetPositionAndDispatch_5E189
		dd CachedObject_BuildVariant_5E12A
off_70E80	dd CachedObject_Method_ReleaseCache_5E1CA
off_70E84	dd loc_26F6F
off_70E88	dd loc_26F6F
off_70E8C	dd loc_26F6F
off_70E90	dd CachedObject_Method_PassThrough_5E20E
off_70E94	dd CachedObject_Method_PassThroughB_5E216
off_70E98	dd CachedObject_Method_AddPositionAndDispatch_5E21E
off_70E9C	dd CachedObject_Method_SetPositionAndDispatchB_5E250
word_70EA0	dw 0			; DATA XREF: VGA_LoadPalette+17r
					; Video_ReadCRTCPortBase_5E7D6+Ew
word_70EA2	dw 0			; DATA XREF: String_ConstructWithFallback:loc_1B6FAr
					; String_ConstructWithFallback+17r ...
unk_70EA4	db    0
		db    0
byte_70EA6	db 0			; DATA XREF: TextRenderer_Main:loc_27686w
					; TextRenderer_Main:loc_276C5w	...
		align 2
word_70EA8	dw 0			; DATA XREF: seg047:0301r seg047:0307w ...
aProgramHaltedB	db 'Program halted by code.',0Ah,0
aError04x	db 0Ah
		db 'Error #%04x',0Ah,0
aError04xSubcla	db 0Ah
		db 'Error #%04x, subclass %04x',0Ah,0
byte_70EEE	db 0			; DATA XREF: Runtime_FatalErrorHandler_5F700+Br
					; Runtime_FatalErrorHandler_5F700+12w
algn_70EEF:
		align 2
off_70EF0	dd GlyphObject_ScalarDeletingDtorB_60783
off_70EF4	dd loc_26F6F
off_70EF8	dd loc_26F6F
off_70EFC	dd loc_26F6F
off_70F00	dd loc_26F6F
off_70F04	dd loc_26F6F
off_70F08	dd loc_26F6F
off_70F0C	dd loc_26F6F
off_70F10	dd loc_26F6F
off_70F14	dd loc_26F6F
off_70F18	dd GlyphObject_ScalarDeletingDtorA_6070E
off_70F1C	dd GlyphObject_ResolveAndCache_605CE
off_70F20	dd GlyphObject_Method_SetFlagField_606D2
off_70F24	dd GlyphObject_Method_ReturnZero_606E4
off_70F28	dd GlyphObject_Method_CopyFlagField_606EE
off_70F2C	dd GlyphObject_Method_ReturnZeroB_60704
off_70F30	dd GlyphObject_MeasureChar_6064A
off_70F34	dd GlyphObject_Method_MeasureCharParam_60690
off_70F38	dd GlyphObject_Method_MeasureRefCharA_60550
off_70F3C	dd GlyphObject_Method_MeasureRefCharB_6058F
word_70F40	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_610D2w
					; Render_DrawFilledEllipse_6106E:loc_611F2r	...
word_70F42	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_610E3w
					; Render_DrawFilledEllipse_6106E+132r ...
word_70F44	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+80w
					; Render_DrawFilledEllipse_6106E:loc_611D5r	...
word_70F46	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+54w
					; Render_DrawFilledEllipse_6106E+16Br ...
word_70F48	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+4Cw
					; Render_DrawFilledEllipse_6106E:loc_611ADr	...
word_70F4A	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+5Cw
					; Render_DrawFilledEllipse_6106E+171r ...
word_70F4C	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+46w
					; Render_DrawFilledEllipse_6106E+136r ...
word_70F4E	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_610D8w
					; Render_DrawFilledEllipse_6106E+12Fr ...
word_70F50	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_610E0w
					; Render_DrawFilledEllipse_6106E:loc_611D1r	...
word_70F52	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+160w
					; Render_DrawFilledEllipse_6106E+177r ...
word_70F54	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_611B5w
					; Render_DrawFilledEllipse_6106E+17Br ...
word_70F56	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+88w
					; Render_DrawFilledEllipse_6106E:loc_61147r	...
word_70F58	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_610F9w
					; Render_DrawFilledEllipse_6106E:loc_6114Ar	...
word_70F5A	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_61101w
					; Render_DrawFilledEllipse_6106E+BDr ...
word_70F5C	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+96w
					; Render_DrawFilledEllipse_6106E+C0r ...
word_70F5E	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+9Fw
					; Render_DrawFilledEllipse_6106E+E8r ...
word_70F60	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+A2w
					; Render_DrawFilledEllipse_6106E+ECr ...
word_70F62	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+AAw
					; Render_DrawFilledEllipse_6106E+1F6r ...
word_70F64	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+ADw
					; Render_DrawFilledEllipse_6106E:loc_61268r	...
word_70F66	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+B1w
					; Render_DrawFilledEllipse_6106E:loc_61188r	...
word_70F68	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+B7w
					; Render_DrawFilledEllipse_6106E+11Dr ...
word_70F6A	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_61140w
					; Render_DrawFilledEllipse_6106E+121r ...
word_70F6C	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E:loc_61143w
					; Render_DrawFilledEllipse_6106E+125r ...
word_70F6E	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+F0w
					; Render_DrawFilledEllipse_6106E+10Cw ...
word_70F70	dw 0			; DATA XREF: Render_DrawFilledEllipse_6106E+F3w
					; Render_DrawFilledEllipse_6106E+110w ...
word_70F72	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+64w
					; Render_DrawEllipseOutline_61612:loc_61740r	...
word_70F74	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+75w
					; Render_DrawEllipseOutline_61612:loc_61748r	...
word_70F76	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612:loc_61692w
					; Render_DrawEllipseOutline_61612:loc_6175Er	...
word_70F78	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612:loc_61666w
					; Render_DrawEllipseOutline_61612+150r ...
word_70F7A	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+4Cw
					; Render_DrawEllipseOutline_61612+140r ...
word_70F7C	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612:loc_6166Ew
					; Render_DrawEllipseOutline_61612+156r ...
word_70F7E	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+46w
					; Render_DrawEllipseOutline_61612:loc_6174Cr	...
word_70F80	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+6Aw
					; Render_DrawEllipseOutline_61612:loc_61744r	...
word_70F82	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+72w
					; Render_DrawEllipseOutline_61612+148r ...
word_70F84	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+88w
					; Render_DrawEllipseOutline_61612+D9r ...
word_70F86	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+8Bw
					; Render_DrawEllipseOutline_61612:loc_616EEr	...
word_70F88	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+93w
					; Render_DrawEllipseOutline_61612:loc_616CFr	...
word_70F8A	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+96w
					; Render_DrawEllipseOutline_61612:loc_616D2r	...
word_70F8C	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+9Fw
					; Render_DrawEllipseOutline_61612+E8r ...
word_70F8E	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+A2w
					; Render_DrawEllipseOutline_61612+ECr ...
word_70F90	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+AAw
					; Render_DrawEllipseOutline_61612+1FCr ...
word_70F92	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+ADw
					; Render_DrawEllipseOutline_61612+200r ...
word_70F94	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612:loc_616C3w
					; Render_DrawEllipseOutline_61612:loc_6172Cr	...
word_70F96	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+B7w
					; Render_DrawEllipseOutline_61612:loc_6172Fr	...
word_70F98	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+D2w
					; Render_DrawEllipseOutline_61612+121r ...
word_70F9A	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+D5w
					; Render_DrawEllipseOutline_61612+125r ...
word_70F9C	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612:loc_61702w
					; Render_DrawEllipseOutline_61612+10Cw ...
word_70F9E	dw 0			; DATA XREF: Render_DrawEllipseOutline_61612+F3w
					; Render_DrawEllipseOutline_61612+110w ...
word_70FA0	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+Fw
					; Render_DrawHorizontalLineClipped_61B8E+9Fr ...
word_70FA2	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+59w
					; Render_DrawHorizontalLineClipped_61B8E+77r ...
word_70FA4	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+15w
					; Render_DrawHorizontalLineClipped_61B8E+2Br ...
word_70FA6	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+61w
					; Render_DrawHorizontalLineClipped_61B8E+69r ...
word_70FA8	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+1Bw
					; Render_DrawHorizontalLineClipped_61B8E+21r ...
word_70FAA	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+27w
					; Render_DrawHorizontalLineClipped_61B8E:loc_61C7Cr
word_70FAC	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+42w
					; Render_DrawHorizontalLineClipped_61B8E:loc_61CA5r
word_70FAE	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E:loc_61BC3w
					; Render_DrawHorizontalLineClipped_61B8E+92r ...
word_70FB0	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E:loc_61BDEw
					; Render_DrawHorizontalLineClipped_61B8E+96r ...
word_70FB2	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E+7Dw
					; Render_DrawHorizontalLineClipped_61B8E:loc_61C49r	...
word_70FB4	dw 0			; DATA XREF: Render_DrawHorizontalLineClipped_61B8E:loc_61BFDw
					; Render_DrawHorizontalLineClipped_61B8E:loc_61C16r	...
dword_70FB6	dd 0			; DATA XREF: File_ReadOrDelegateToPaged_630E7+4Ew
					; File_ReadOrDelegateToPaged_630E7+9Fw ...
word_70FBA	dw 0			; DATA XREF: File_ReadOrDelegateToPaged_630E7:loc_63119w
					; File_ReadOrDelegateToPaged_630E7:loc_631B3w	...
off_70FBC	dd nullsub_5		; DATA XREF: File_ReadOrDelegateToPaged_630E7+CFr
					; File_WriteOrDelegateToPaged_631E3+95r ...
unk_70FC0	db    0
		db    0
unk_70FC2	db    0
unk_70FC3	db    0
unk_70FC4	db    0
		db    0
		db    0
unk_70FC7	db    0
unk_70FC8	db    0
		db    0
		db    0
		db    0
word_70FCC	dw 0			; DATA XREF: File_CreateWithRetry_630BA+12w
					; File_CreateWithRetry_630BA+19r ...
off_70FCE	dd nullsub_6		; DATA XREF: File_CreateWithRetry_630BA+15r
					; File_OpenWithRetry_63434:loc_6344Er	...
off_70FD2	dd FileStream_ScalarDeletingDtor_6363A
		dd FileStream_ReadLoop_6380D
off_70FDA	dd FileStream_Method_Write_64393
off_70FDE	dd FileStream_Method_Seek_643D7
off_70FE2	dd FileStream_Method_OpenAndInit_63616
off_70FE6	dd FileStream_Method_Close_64472
off_70FEA	dd FileStream_Method_GetSize_64497
off_70FEE	dd FileStream_Method_GetPosition_638BB
off_70FF2	dd FileStream_DestructPartial_638CE
off_70FF6	dd FileStream_Method_Read_64353
off_70FFA	dd FileStream_Method_Write_64393
off_70FFE	dd FileStream_Method_Seek_643D7
off_71002	dd FileStream_Method_Open_64413
		dd FileStream_Method_Close_64472
off_7100A	dd FileStream_Method_GetSize_64497
off_7100E	dd FileStream_Method_SeekToEnd_644F3
aL?s?x?		db 'l?s?x?',0           ; DATA XREF: StreamReader_ConstructVariantA_63A39:loc_63A71r
					; seg190:07ACw
		align 2
		dw seg seg160
aCreate		db 'CREATE',0
aRead		db 'READ',0
aAppend		db 'APPEND',0
aFilenameSLengt	db 0Ah
		db 'Filename=%s',0Ah
		db 'Length  =%ld',0Ah
		db 'Position=%ld',0Ah
		db 'Mode    =%s',0Ah,0
off_71063	dd StreamReader_Destruct_638FF
		dd StreamReader_Close_63BD5
		dd StreamReader_Method_ReturnTrue_6403C
		dd StreamReader_Method_PassThrough_64046
off_71073	dd StreamReader_AllocateInternal_63C0B
off_71077	dd StreamReader_ReadDispatch_63D0E
		align 2
word_7107C	dw 0			; DATA XREF: StreamReader_RegistryAdd_640B0+3r StreamReader_RegistryAdd_640B0+Ar ...
aFileSForm4sChu	db 'File=%s',0Ah
		db 'Form=%4s',0Ah
		db 'Chunk=%4s',0Ah,0
aNumpacksLdCurp	db 'NumPacks=%ld',0Ah
		db 'CurPack=%ld',0Ah
		db 'PackSize=%ld',0Ah
		db 'PackBase=%ld',0Ah
		db 'PackLoc=%ld',0Ah,0
off_710DA	dd IndexedRecordReader_Method_CloneState_65EC5
off_710DE	dd IndexedRecordReader_Destruct_659D0
off_710E2	dd StreamReader_Method_ReturnTrue_6403C
off_710E6	dd IndexedRecordReader_Method_ComputeCount_65B26
off_710EA	dd StreamReader_AllocateInternal_63C0B
off_710EE	dd StreamReader_ReadDispatch_63D0E
word_710F2	dw 0			; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73+6Bw
					; LZW_Decompress_66068+Dr	...
word_710F4	dw 0			; DATA XREF: LZW_Decompress_66068:loc_660A3w
					; LZW_Decompress_66068:loc_66118w	...
word_710F6	dw 0			; DATA XREF: seg197:loc_65F51r
					; seg197:009Ar	...
word_710F8	dw 0			; DATA XREF: LZW_Decompress_66068:loc_66097w
					; LZW_Decompress_66068:loc_660D6w	...
word_710FA	dw 0			; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73:loc_65BD5w
					; seg197:loc_65F34r ...
word_710FC	dw 0			; DATA XREF: LZW_Decompress_66068:loc_6609Dw
					; LZW_Decompress_66068+74w ...
word_710FE	dw 0			; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73:loc_65C18w
					; LZW_Decompress_66068+14r
word_71100	dw 0			; DATA XREF: LZW_Decompress_66068:loc_66105w
					; LZW_Decompress_66068+125r
byte_71102	db 0			; DATA XREF: LZW_Decompress_66068+87w
					; LZW_Decompress_66068+ACr ...
word_71103	dw 0			; DATA XREF: LZW_Decompress_66068+84w
					; LZW_Decompress_66068+B8r ...
word_71105	dw 0			; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73:loc_65C20w
					; LZW_Decompress_66068+8Br ...
seg_71107	dw seg seg339		; DATA XREF: LZW_Decompress_66068:loc_660FFw
					; LZW_Decompress_66068+FDw
word_71109	dw 0			; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73:loc_65C04w
					; IndexedRecordReader_ReadIndexTable_65B73+B8r ...
seg_7110B	dw seg seg339		; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73:loc_65C00w
word_7110D	dw 0			; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73+98w
					; seg197:0007r	...
word_7110F	dw 0			; DATA XREF: seg197:loc_65F30r
					; seg197:0065w	...
word_71111	dw 0			; DATA XREF: IndexedRecordReader_ReadIndexTable_65B73+65w
					; seg197:0018r	...
word_71113	dw 0			; DATA XREF: seg197:0035w seg197:00A4r
		db 0FFh
		db    1
		db 0FFh
		db    3
unk_71119	db 0FFh
unk_7111A	db    7
		db 0FFh
unk_7111C	db  0Fh
		db    0
off_7111E	dd JoystickManager_Destruct_6669A
off_71122	dd JoystickCallback_DestructThunk_666C5
off_71126	dd JoystickCallback_DestructFull_666E6
off_7112A	dd loc_6662F
off_7112E	dd Runtime_StackAdjustAndJump_66721
off_71132	dd JoystickCallback_Destruct_66420
byte_71136	db 0			; DATA XREF: ConfigOption_ConstructFull_66762+6r
					; ConfigOption_ConstructFull_66762:loc_667B5w	...
dword_71137	dd 0			; DATA XREF: ConfigOption_ConstructFull_66762+1Aw
					; ConfigOption_FormatValue_668A2+2Er ...
word_7113B	dw 0			; DATA XREF: ConfigOption_ConstructFull_66762+21w
					; ConfigOption_FormatValue_668A2:loc_668AEr	...
byte_7113D	db 0			; DATA XREF: ConfigOption_FormatValueB_668FF:loc_66916r
					; ConfigOption_FormatValueB_668FF+32w ...
byte_7113E	db 0			; DATA XREF: ConfigOption_FormatValue_668A2+21r
					; ConfigOption_FormatValue_668A2+40w ...
byte_7113F	db 0			; DATA XREF: ConfigOption_FormatValue_668A2+7r
					; ConfigOption_FormatValue_668A2+19r ...
word_71140	dw 0FFFFh		; DATA XREF: ConfigOption_ConstructFull_66762:loc_667A2w
					; ConfigOption_ConstructFull_66762:loc_667A5r	...
word_71142	dw 0			; DATA XREF: seg201:00F7r seg201:00FDr ...
byte_71144	db 0			; DATA XREF: seg201:loc_66825r
					; seg201:loc_6682Cw
aCouldnTInstall	db 'Couldn',27h,'t install josytick polling interrupt.',0Ah,0
algn_71173:
		align 2
byte_71174	db 0			; DATA XREF: seg202:loc_66ACDw
byte_71175	db 0			; DATA XREF: seg202:001Aw
dword_71176	dd 0			; DATA XREF: Keyboard_InitSystem_66C34+11w
					; Keyboard_PushEventToQueue_66C9D+2Dr ...
word_7117A	dw 0			; DATA XREF: Keyboard_InitSystem_66C34+18w
					; Keyboard_PushEventToQueue_66C9D+Dr	...
byte_7117C	db 0			; DATA XREF: Keyboard_PeekOrPopEvent_66CF5+12r
					; Keyboard_PeekOrPopEvent_66CF5+28w ...
byte_7117D	db 0			; DATA XREF: Keyboard_PushEventToQueue_66C9D+25r
					; Keyboard_PushEventToQueue_66C9D+3Aw ...
byte_7117E	db 0			; DATA XREF: Keyboard_PushEventToQueue_66C9D+8r
					; Keyboard_PushEventToQueue_66C9D+1Dr ...
		db    0
unk_71180	db    0
byte_71181	db 0			; DATA XREF: InputBinding_InitAndRegister_66E02:loc_66E4Ew
					; InputBinding_InitAndRegister_66E02+5Ew ...
aKeyboardStackO	db 'keyboard stack overflow',0
dword_7119A	dd 0			; DATA XREF: Keyboard_AllocateHandlerMask_66F09:loc_66F21w
					; Keyboard_InstallHandlerMask_66F50:loc_66F53r	...
word_7119E	dw 0			; DATA XREF: seg202:loc_66B10r
					; Keyboard_PushEventToQueue_66C9D+17r ...
word_711A0	dw 0			; DATA XREF: seg204:0062w seg204:0069r ...
word_711A2	dw 0			; DATA XREF: seg204:006Fw
					; TextScroll_ComputeParams_67048+1Fw ...
word_711A4	dw 0			; DATA XREF: seg204:loc_67038w
					; TextScroll_ComputeParams_67048+28w ...
word_711A6	dw 0			; DATA XREF: seg204:0075w
					; TextScroll_ComputeParams_67048+25w ...
word_711A8	dw 0			; DATA XREF: HandlerRegistry4Slot_Register_67517:loc_6751Er
					; HandlerRegistry4Slot_Register_67517:loc_6752Dr	...
word_711AA	dw 0			; DATA XREF: TextScrollDisplay_InitState_6733F+33w
					; TextScrollDisplay_Cleanup_67384+17r
word_711AC	dw 0			; DATA XREF: TextScrollDisplay_InitState_6733F+3Fw
					; TextScrollDisplay_Cleanup_67384+6r
word_711AE	dw 0			; DATA XREF: TextScrollDisplay_InitState_6733F+3Cw
					; TextScrollDisplay_Cleanup_67384:loc_67390r
aMouseStackOver	db 'mouse stack overflow',0
algn_711C5:
		align 2
word_711C6	dw 0			; DATA XREF: Input_ReadAxis2Deadzone+Fr
					; Input_ReadCombinedAxes:loc_28A81r	...
word_711C8	dw 0			; DATA XREF: Input_ReadAxis2Deadzone+13r
					; Input_ReadCombinedAxes+22r ...
byte_711CA	db 0			; DATA XREF: TextScrollDisplayB_Construct_675B4:loc_675D4w
					; TextScrollDisplayB_ApplyHelperA_67E9C+18r ...
		align 2
byte_711CC	db 0			; DATA XREF: Stopwatch_RegisterTickModule_67611+7r
					; Stopwatch_RegisterTickModule_67611:loc_6765Aw	...
dword_711CD	dd 0			; DATA XREF: Input_ReadAxis1Deadzone+2Er
					; Input_ReadAxis1Deadzone+4Cr ...
aCouldnTInitial	db 'Couldn',27h,'t initialize system timer.',0Ah,0
aBye		db 'bye!',0             ; DATA XREF: Stopwatch_StartOrStop_676F1+1Do
		align 2
byte_711FA	db 0			; DATA XREF: Joystick_ReadAndScaleAxes_67835:loc_67855r
					; Joystick_ReadAndScaleAxes_67835:loc_678DFw
		align 2
word_711FC	dw 0			; DATA XREF: TextScrollDisplayB_ConstructAndReset_67DF5:loc_67E21w
					; TextScrollDisplayB_InitAndRegister_67E34:loc_67E3Cr	...
word_711FE	dw 0			; DATA XREF: TextScrollDisplayB_InitAndRegister_67E34:loc_67E62w
					; TextScrollDisplayB_UpdateObjectState_67F8A+15r ...
word_71200	dw 0			; DATA XREF: Input_GetCalibratedXValue_67481+3r
					; Input_GetCalibratedYValue_67499:loc_6749Cr	...
word_71202	dw 0			; DATA XREF: seg210:0030w seg210:00C9r
word_71204	dw 0			; DATA XREF: seg210:loc_6810Cw
					; seg210:00C5r
word_71206	dw 0FFFFh		; DATA XREF: seg210:loc_68184r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71211	db    0
unk_71212	db    0
unk_71213	db    0
unk_71214	db    0
		db    0
		db    0
unk_71217	db    0
unk_71218	db    0
unk_71219	db    0
unk_7121A	db    0
		db    0
		db    0
unk_7121D	db    0
		db    0
unk_7121F	db    0
unk_71220	db    0
unk_71221	db    0
unk_71222	db    0
unk_71223	db    0
unk_71224	db    0
unk_71225	db    0
unk_71226	db    0
unk_71227	db    0
unk_71228	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7122E	db    0
		db    0
		db    0
unk_71231	db    0
		db    0
unk_71233	db    0
unk_71234	db    0
		db    0
		db    0
unk_71237	db    0
		db    0
		db    0
unk_7123A	db    0
		db    0
		db    0
		db    0
		db    0
unk_7123F	db    0
		db    0
unk_71241	db    0
unk_71242	db    0
unk_71243	db    0
unk_71244	db    0
		db    0
unk_71246	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7124D	db    0
		db    0
		db    0
unk_71250	db    0
		db    0
		db    0
unk_71253	db    0
unk_71254	db    0
unk_71255	db    0
unk_71256	db    0
unk_71257	db    0
unk_71258	db    0
		db    0
unk_7125A	db    0
		db    0
		db    0
		db    0
unk_7125E	db    0
unk_7125F	db    0
		db    0
unk_71261	db    0
unk_71262	db    0
unk_71263	db    0
unk_71264	db    0
		db    0
unk_71266	db    0
unk_71267	db    0
unk_71268	db    0
unk_71269	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7126F	db    0
		db    0
		db    0
unk_71272	db    0
unk_71273	db    0
unk_71274	db    0
		db    0
		db    0
unk_71277	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7127D	db    0
		db    0
unk_7127F	db    0
unk_71280	db    0
unk_71281	db    0
		db    0
unk_71283	db    0
unk_71284	db    0
unk_71285	db    0
unk_71286	db    0
unk_71287	db    0
unk_71288	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7128E	db    0
		db    0
		db    0
unk_71291	db    0
		db    0
unk_71293	db    0
unk_71294	db    0
		db    0
unk_71296	db    0
unk_71297	db    0
		db    0
unk_71299	db    0
		db    0
		db    0
unk_7129C	db    0
		db    0
		db    0
		db    0
		db    0
unk_712A1	db    0
unk_712A2	db    0
unk_712A3	db    0
unk_712A4	db    0
		db    0
		db    0
unk_712A7	db    0
		db    0
unk_712A9	db    0
		db    0
		db    0
		db    0
unk_712AD	db    0
		db    0
unk_712AF	db    0
unk_712B0	db    0
		db    0
		db    0
unk_712B3	db    0
unk_712B4	db    0
unk_712B5	db    0
unk_712B6	db    0
unk_712B7	db    0
unk_712B8	db    0
		db    0
unk_712BA	db    0
		db    0
		db    0
		db    0
unk_712BE	db    0
unk_712BF	db    0
		db    0
unk_712C1	db    0
		db    0
unk_712C3	db    0
unk_712C4	db    0
		db    0
unk_712C6	db    0
unk_712C7	db    0
unk_712C8	db    0
		db    0
unk_712CA	db    0
		db    0
unk_712CC	db    0
		db    0
		db    0
unk_712CF	db    0
		db    0
unk_712D1	db    0
unk_712D2	db    0
unk_712D3	db    0
unk_712D4	db    0
		db    0
unk_712D6	db    0
unk_712D7	db    0
unk_712D8	db    0
unk_712D9	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_712DF	db    0
		db    0
		db    0
		db    0
unk_712E3	db    0
unk_712E4	db    0
unk_712E5	db    0
unk_712E6	db    0
unk_712E7	db    0
unk_712E8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_712EE	db    0
		db    0
		db    0
unk_712F1	db    0
		db    0
unk_712F3	db    0
unk_712F4	db    0
		db    0
unk_712F6	db    0
unk_712F7	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_712FF	db    0
		db    0
unk_71301	db    0
		db    0
unk_71303	db    0
unk_71304	db    0
		db    0
		db    0
unk_71307	db    0
		db    0
unk_71309	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7130F	db    0
		db    0
unk_71311	db    0
		db    0
unk_71313	db    0
unk_71314	db    0
unk_71315	db    0
		db    0
unk_71317	db    0
unk_71318	db    0
		db    0
		db    0
		db    0
		db    0
unk_7131D	db    0
		db    0
		db    0
		db    0
unk_71321	db    0
		db    0
unk_71323	db    0
unk_71324	db    0
		db    0
unk_71326	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71331	db    0
		db    0
unk_71333	db    0
unk_71334	db    0
		db    0
unk_71336	db    0
unk_71337	db    0
unk_71338	db    0
unk_71339	db    0
unk_7133A	db    0
		db    0
unk_7133C	db    0
		db    0
unk_7133E	db    0
unk_7133F	db    0
		db    0
		db    0
unk_71342	db    0
unk_71343	db    0
unk_71344	db    0
unk_71345	db    0
unk_71346	db    0
unk_71347	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7134F	db    0
		db    0
unk_71351	db    0
		db    0
unk_71353	db    0
unk_71354	db    0
		db    0
unk_71356	db    0
unk_71357	db    0
unk_71358	db    0
unk_71359	db    0
		db    0
		db    0
unk_7135C	db    0
unk_7135D	db    0
		db    0
		db    0
		db    0
unk_71361	db    0
unk_71362	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71373	db    0
		db    0
unk_71375	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7137C	db    0
		db    0
		db    0
		db    0
		db    0
unk_71381	db    0
		db    0
unk_71383	db    0
unk_71384	db    0
		db    0
		db    0
unk_71387	db    0
		db    0
unk_71389	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7138F	db    0
		db    0
unk_71391	db    0
unk_71392	db    0
unk_71393	db    0
unk_71394	db    0
		db    0
unk_71396	db    0
unk_71397	db    0
unk_71398	db    0
		db    0
		db    0
		db    0
		db    0
unk_7139D	db    0
unk_7139E	db    0
unk_7139F	db    0
unk_713A0	db    0
unk_713A1	db    0
		db    0
unk_713A3	db    0
unk_713A4	db    0
unk_713A5	db    0
		db    0
		db    0
unk_713A8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_713B1	db    0
		db    0
unk_713B3	db    0
unk_713B4	db    0
		db    0
		db    0
unk_713B7	db    0
unk_713B8	db    0
unk_713B9	db    0
unk_713BA	db    0
		db    0
unk_713BC	db    0
		db    0
		db    0
unk_713BF	db    0
		db    0
unk_713C1	db    0
unk_713C2	db    0
		db    0
unk_713C4	db    0
		db    0
unk_713C6	db    0
unk_713C7	db    0
unk_713C8	db    0
unk_713C9	db    0
unk_713CA	db    0
		db    0
unk_713CC	db    0
		db    0
unk_713CE	db    0
unk_713CF	db    0
		db    0
unk_713D1	db    0
unk_713D2	db    0
unk_713D3	db    0
		db    0
unk_713D5	db    0
		db    0
		db    0
unk_713D8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_713E1	db    0
		db    0
unk_713E3	db    0
unk_713E4	db    0
		db    0
		db    0
unk_713E7	db    0
unk_713E8	db    0
unk_713E9	db    0
		db    0
		db    0
		db    0
unk_713ED	db    0
		db    0
unk_713EF	db    0
		db    0
		db    0
		db    0
unk_713F3	db    0
unk_713F4	db    0
		db    0
unk_713F6	db    0
unk_713F7	db    0
unk_713F8	db    0
		db    0
		db    0
		db    0
unk_713FC	db    0
		db    0
unk_713FE	db    0
unk_713FF	db    0
		db    0
unk_71401	db    0
		db    0
unk_71403	db    0
		db    0
unk_71405	db    0
		db    0
		db    0
unk_71408	db    0
unk_71409	db    0
		db    0
		db    0
unk_7140C	db    0
		db    0
		db    0
		db    0
		db    0
unk_71411	db    0
unk_71412	db    0
		db    0
unk_71414	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71421	db    0
		db    0
unk_71423	db    0
unk_71424	db    0
		db    0
unk_71426	db    0
unk_71427	db    0
unk_71428	db    0
unk_71429	db    0
		db    0
		db    0
		db    0
unk_7142D	db    0
unk_7142E	db    0
unk_7142F	db    0
		db    0
unk_71431	db    0
		db    0
unk_71433	db    0
unk_71434	db    0
		db    0
		db    0
unk_71437	db    0
unk_71438	db    0
		db    0
unk_7143A	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71444	db    0
		db    0
		db    0
		db    0
		db    0
unk_71449	db    0
		db    0
		db    0
unk_7144C	db    0
		db    0
		db    0
		db    0
		db    0
unk_71451	db    0
unk_71452	db    0
unk_71453	db    0
		db    0
		db    0
		db    0
unk_71457	db    0
		db    0
unk_71459	db    0
		db    0
		db    0
		db    0
unk_7145D	db    0
		db    0
unk_7145F	db    0
unk_71460	db    0
unk_71461	db    0
		db    0
unk_71463	db    0
unk_71464	db    0
		db    0
		db    0
		db    0
unk_71468	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71473	db    0
unk_71474	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7147A	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71481	db    0
		db    0
unk_71483	db    0
unk_71484	db    0
unk_71485	db    0
unk_71486	db    0
unk_71487	db    0
unk_71488	db    0
unk_71489	db    0
		db    0
		db    0
		db    0
		db    0
unk_7148E	db    0
unk_7148F	db    0
		db    0
unk_71491	db    0
		db    0
unk_71493	db    0
unk_71494	db    0
		db    0
unk_71496	db    0
		db    0
		db    0
unk_71499	db    0
		db    0
		db    0
unk_7149C	db    0
		db    0
		db    0
		db    0
		db    0
unk_714A1	db    0
unk_714A2	db    0
unk_714A3	db    0
unk_714A4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_714B1	db    0
		db    0
unk_714B3	db    0
unk_714B4	db    0
		db    0
		db    0
unk_714B7	db    0
		db    0
unk_714B9	db    0
unk_714BA	db    0
		db    0
		db    0
		db    0
		db    0
unk_714BF	db    0
		db    0
unk_714C1	db    0
unk_714C2	db    0
unk_714C3	db    0
unk_714C4	db    0
		db    0
		db    0
		db    0
unk_714C8	db    0
unk_714C9	db    0
unk_714CA	db    0
		db    0
unk_714CC	db    0
unk_714CD	db    0
		db    0
		db    0
unk_714D0	db    0
unk_714D1	db    0
unk_714D2	db    0
unk_714D3	db    0
unk_714D4	db    0
		db    0
unk_714D6	db    0
unk_714D7	db    0
unk_714D8	db    0
		db    0
		db    0
		db    0
		db    0
unk_714DD	db    0
unk_714DE	db    0
		db    0
		db    0
unk_714E1	db    0
		db    0
unk_714E3	db    0
unk_714E4	db    0
		db    0
		db    0
unk_714E7	db    0
		db    0
unk_714E9	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_714EF	db    0
		db    0
		db    0
		db    0
unk_714F3	db    0
unk_714F4	db    0
unk_714F5	db    0
		db    0
		db    0
		db    0
unk_714F9	db    0
unk_714FA	db    0
		db    0
unk_714FC	db    0
		db    0
		db    0
		db    0
		db    0
unk_71501	db    0
unk_71502	db    0
unk_71503	db    0
unk_71504	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7150D	db    0
		db    0
		db    0
unk_71510	db    0
unk_71511	db    0
		db    0
unk_71513	db    0
unk_71514	db    0
		db    0
unk_71516	db    0
unk_71517	db    0
unk_71518	db    0
unk_71519	db    0
		db    0
		db    0
		db    0
		db    0
unk_7151E	db    0
unk_7151F	db    0
		db    0
unk_71521	db    0
		db    0
unk_71523	db    0
unk_71524	db    0
unk_71525	db    0
		db    0
		db    0
		db    0
unk_71529	db    0
		db    0
		db    0
unk_7152C	db    0
		db    0
		db    0
		db    0
		db    0
unk_71531	db    0
unk_71532	db    0
unk_71533	db    0
unk_71534	db    0
		db    0
		db    0
		db    0
unk_71538	db    0
		db    0
unk_7153A	db    0
		db    0
		db    0
unk_7153D	db    0
		db    0
		db    0
		db    0
unk_71541	db    0
unk_71542	db    0
unk_71543	db    0
unk_71544	db    0
		db    0
unk_71546	db    0
unk_71547	db    0
		db    0
unk_71549	db    0
		db    0
		db    0
		db    0
unk_7154D	db    0
		db    0
unk_7154F	db    0
unk_71550	db    0
unk_71551	db    0
		db    0
unk_71553	db    0
unk_71554	db    0
unk_71555	db    0
		db    0
		db    0
		db    0
unk_71559	db    0
		db    0
		db    0
unk_7155C	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71562	db    0
unk_71563	db    0
unk_71564	db    0
		db    0
unk_71566	db    0
unk_71567	db    0
unk_71568	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7156E	db    0
		db    0
		db    0
unk_71571	db    0
		db    0
unk_71573	db    0
unk_71574	db    0
		db    0
		db    0
unk_71577	db    0
unk_71578	db    0
unk_71579	db    0
unk_7157A	db    0
		db    0
		db    0
		db    0
		db    0
unk_7157F	db    0
		db    0
unk_71581	db    0
unk_71582	db    0
		db    0
unk_71584	db    0
unk_71585	db    0
unk_71586	db    0
unk_71587	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71592	db    0
unk_71593	db    0
unk_71594	db    0
		db    0
		db    0
		db    0
unk_71598	db    0
		db    0
		db    0
		db    0
		db    0
unk_7159D	db    0
		db    0
unk_7159F	db    0
unk_715A0	db    0
unk_715A1	db    0
		db    0
unk_715A3	db    0
unk_715A4	db    0
		db    0
unk_715A6	db    0
unk_715A7	db    0
unk_715A8	db    0
unk_715A9	db    0
		db    0
		db    0
		db    0
		db    0
unk_715AE	db    0
unk_715AF	db    0
		db    0
unk_715B1	db    0
		db    0
unk_715B3	db    0
unk_715B4	db    0
unk_715B5	db    0
		db    0
		db    0
unk_715B8	db    0
		db    0
unk_715BA	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_715C1	db    0
unk_715C2	db    0
unk_715C3	db    0
unk_715C4	db    0
		db    0
unk_715C6	db    0
unk_715C7	db    0
unk_715C8	db    0
		db    0
		db    0
		db    0
		db    0
unk_715CD	db    0
		db    0
		db    0
unk_715D0	db    0
		db    0
		db    0
unk_715D3	db    0
unk_715D4	db    0
		db    0
unk_715D6	db    0
unk_715D7	db    0
unk_715D8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_715DE	db    0
unk_715DF	db    0
		db    0
unk_715E1	db    0
		db    0
unk_715E3	db    0
		db    0
unk_715E5	db    0
		db    0
		db    0
unk_715E8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_715F2	db    0
unk_715F3	db    0
unk_715F4	db    0
		db    0
		db    0
		db    0
unk_715F8	db    0
		db    0
unk_715FA	db    0
		db    0
		db    0
unk_715FD	db    0
		db    0
		db    0
unk_71600	db    0
		db    0
unk_71602	db    0
unk_71603	db    0
unk_71604	db    0
		db    0
unk_71606	db    0
unk_71607	db    0
unk_71608	db 0FFh
		db 0FFh
word_7160A	dw 0			; DATA XREF: Keyboard_ReportErrorIfActive_66EF4:loc_66EF7r
					; seg211:006Ew
word_7160C	dw 0			; DATA XREF: InputBinding_InitAndRegister_66E02:loc_66E0Dw
					; Keyboard_SetHandlerPointer_66EE7:loc_66EEEw	...
seg_7160E	dw seg seg339		; DATA XREF: seg211:loc_68200r
word_71610	dw 0			; DATA XREF: seg211:0037w seg211:007Cr
word_71612	dw 0			; DATA XREF: seg211:loc_681E3w
					; seg211:0078r
word_71614	dw 0FFFFh		; DATA XREF: seg211:loc_68216r
unk_71616	db    0
		db    0
unk_71618	db    0
		db    0
		db    0
		db    0
		db    0
unk_7161D	db    0
		db    0
		db    0
		db    0
unk_71621	db    0
unk_71622	db    0
unk_71623	db    0
unk_71624	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7162D	db    0
		db    0
		db    0
unk_71630	db    0
unk_71631	db    0
		db    0
unk_71633	db    0
unk_71634	db    0
unk_71635	db    0
unk_71636	db    0
unk_71637	db    0
unk_71638	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7163E	db    0
		db    0
		db    0
unk_71641	db    0
		db    0
unk_71643	db    0
unk_71644	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71651	db    0
unk_71652	db    0
unk_71653	db    0
unk_71654	db    0
		db    0
unk_71656	db    0
		db    0
unk_71658	db    0
		db    0
		db    0
		db    0
		db    0
unk_7165D	db    0
		db    0
		db    0
unk_71660	db    0
		db    0
		db    0
unk_71663	db    0
unk_71664	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71671	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71677	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71681	db    0
		db    0
		db    0
unk_71684	db    0
		db    0
unk_71686	db    0
unk_71687	db    0
unk_71688	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7168E	db    0
		db    0
		db    0
unk_71691	db    0
		db    0
unk_71693	db    0
unk_71694	db    0
unk_71695	db    0
		db    0
unk_71697	db    0
		db    0
unk_71699	db    0
		db    0
		db    0
unk_7169C	db    0
		db    0
		db    0
unk_7169F	db    0
		db    0
unk_716A1	db    0
unk_716A2	db    0
unk_716A3	db    0
unk_716A4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_716B1	db    0
		db    0
unk_716B3	db    0
unk_716B4	db    0
		db    0
unk_716B6	db    0
unk_716B7	db    0
unk_716B8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_716BE	db    0
		db    0
		db    0
unk_716C1	db    0
		db    0
unk_716C3	db    0
unk_716C4	db    0
unk_716C5	db    0
		db    0
		db    0
unk_716C8	db    0
		db    0
		db    0
		db    0
		db    0
unk_716CD	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_716D3	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_716D9	db    0
		db    0
		db    0
unk_716DC	db    0
		db    0
		db    0
		db    0
		db    0
unk_716E1	db    0
unk_716E2	db    0
unk_716E3	db    0
unk_716E4	db    0
		db    0
unk_716E6	db    0
unk_716E7	db    0
unk_716E8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_716EE	db    0
		db    0
		db    0
unk_716F1	db    0
		db    0
unk_716F3	db    0
unk_716F4	db    0
unk_716F5	db    0
		db    0
unk_716F7	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71703	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71711	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7171F	db    0
		db    0
unk_71721	db    0
		db    0
unk_71723	db    0
unk_71724	db    0
unk_71725	db    0
unk_71726	db    0
unk_71727	db    0
unk_71728	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7172E	db    0
		db    0
		db    0
unk_71731	db    0
		db    0
unk_71733	db    0
unk_71734	db    0
		db    0
		db    0
		db    0
unk_71738	db    0
		db    0
		db    0
		db    0
		db    0
unk_7173D	db    0
		db    0
		db    0
		db    0
unk_71741	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71751	db    0
		db    0
unk_71753	db    0
unk_71754	db    0
		db    0
unk_71756	db    0
unk_71757	db    0
unk_71758	db    0
unk_71759	db    0
		db    0
		db    0
		db    0
		db    0
unk_7175E	db    0
unk_7175F	db    0
		db    0
		db    0
		db    0
unk_71763	db    0
unk_71764	db    0
		db    0
		db    0
		db    0
unk_71768	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71771	db    0
		db    0
unk_71773	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71783	db    0
unk_71784	db    0
unk_71785	db    0
unk_71786	db    0
unk_71787	db    0
unk_71788	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7178E	db    0
		db    0
		db    0
unk_71791	db    0
unk_71792	db    0
unk_71793	db    0
unk_71794	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7179D	db    0
		db    0
		db    0
unk_717A0	db    0
unk_717A1	db    0
		db    0
		db    0
unk_717A4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_717B1	db    0
		db    0
unk_717B3	db    0
unk_717B4	db    0
		db    0
unk_717B6	db    0
unk_717B7	db    0
unk_717B8	db    0
		db    0
		db    0
		db    0
		db    0
unk_717BD	db    0
unk_717BE	db    0
		db    0
		db    0
unk_717C1	db    0
		db    0
unk_717C3	db    0
unk_717C4	db    0
		db    0
		db    0
unk_717C7	db    0
		db    0
unk_717C9	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_717CF	db    0
		db    0
unk_717D1	db    0
unk_717D2	db    0
unk_717D3	db    0
unk_717D4	db    0
unk_717D5	db    0
unk_717D6	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_717DD	db    0
		db    0
		db    0
unk_717E0	db    0
		db    0
		db    0
unk_717E3	db    0
unk_717E4	db    0
		db    0
unk_717E6	db    0
unk_717E7	db    0
unk_717E8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_717EE	db    0
unk_717EF	db    0
		db    0
unk_717F1	db    0
		db    0
unk_717F3	db    0
unk_717F4	db    0
		db    0
		db    0
		db    0
unk_717F8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71801	db    0
		db    0
unk_71803	db    0
		db    0
		db    0
		db    0
unk_71807	db    0
		db    0
unk_71809	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7180F	db    0
		db    0
		db    0
		db    0
unk_71813	db    0
unk_71814	db    0
unk_71815	db    0
unk_71816	db    0
unk_71817	db    0
unk_71818	db    0
unk_71819	db    0
		db    0
		db    0
unk_7181C	db    0
		db    0
unk_7181E	db    0
		db    0
		db    0
		db    0
unk_71822	db    0
unk_71823	db    0
unk_71824	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7182F	db    0
		db    0
unk_71831	db    0
		db    0
unk_71833	db    0
		db    0
		db    0
unk_71836	db    0
		db    0
unk_71838	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71841	db    0
		db    0
unk_71843	db    0
unk_71844	db    0
		db    0
unk_71846	db    0
unk_71847	db    0
unk_71848	db    0
unk_71849	db    0
		db    0
		db    0
		db    0
		db    0
unk_7184E	db    0
unk_7184F	db    0
		db    0
unk_71851	db    0
		db    0
unk_71853	db    0
unk_71854	db    0
		db    0
		db    0
		db    0
		db    0
unk_71859	db    0
		db    0
		db    0
unk_7185C	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71862	db    0
		db    0
		db    0
unk_71865	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71873	db    0
unk_71874	db    0
		db    0
unk_71876	db    0
unk_71877	db    0
unk_71878	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7187E	db    0
		db    0
		db    0
		db    0
		db    0
unk_71883	db    0
unk_71884	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71891	db    0
		db    0
unk_71893	db    0
		db    0
		db    0
unk_71896	db    0
unk_71897	db    0
		db    0
unk_71899	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7189F	db    0
		db    0
		db    0
		db    0
unk_718A3	db    0
unk_718A4	db    0
unk_718A5	db    0
unk_718A6	db    0
unk_718A7	db    0
unk_718A8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_718AE	db    0
		db    0
		db    0
		db    0
		db    0
unk_718B3	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_718C1	db    0
		db    0
unk_718C3	db    0
unk_718C4	db    0
		db    0
unk_718C6	db    0
unk_718C7	db    0
unk_718C8	db    0
unk_718C9	db    0
		db    0
		db    0
		db    0
unk_718CD	db    0
		db    0
unk_718CF	db    0
		db    0
		db    0
		db    0
		db    0
unk_718D4	db    0
unk_718D5	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_718DF	db    0
		db    0
		db    0
		db    0
unk_718E3	db    0
		db    0
		db    0
		db    0
		db    0
unk_718E8	db    0
unk_718E9	db    0
		db    0
		db    0
unk_718EC	db    0
		db    0
		db    0
		db    0
		db    0
unk_718F1	db    0
unk_718F2	db    0
unk_718F3	db    0
		db    0
		db    0
		db    0
unk_718F7	db    0
		db    0
unk_718F9	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_718FF	db    0
		db    0
unk_71901	db    0
		db    0
		db    0
unk_71904	db    0
unk_71905	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71911	db    0
unk_71912	db    0
unk_71913	db    0
unk_71914	db    0
		db    0
unk_71916	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7191D	db    0
		db    0
		db    0
unk_71920	db    0
unk_71921	db    0
		db    0
unk_71923	db    0
unk_71924	db    0
		db    0
		db    0
unk_71927	db    0
		db    0
unk_71929	db    0
		db    0
		db    0
unk_7192C	db    0
		db    0
		db    0
unk_7192F	db    0
		db    0
		db    0
unk_71932	db    0
unk_71933	db    0
unk_71934	db    0
unk_71935	db    0
		db    0
		db    0
unk_71938	db    0
		db    0
		db    0
		db    0
		db    0
unk_7193D	db    0
		db    0
unk_7193F	db    0
		db    0
unk_71941	db    0
		db    0
unk_71943	db    0
		db    0
		db    0
		db    0
		db    0
unk_71948	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71951	db    0
unk_71952	db    0
unk_71953	db    0
		db    0
		db    0
unk_71956	db    0
unk_71957	db    0
		db    0
unk_71959	db    0
		db    0
		db    0
		db    0
unk_7195D	db    0
		db    0
unk_7195F	db    0
unk_71960	db    0
		db    0
		db    0
unk_71963	db    0
unk_71964	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71973	db    0
		db    0
		db    0
		db    0
		db    0
unk_71978	db    0
		db    0
		db    0
		db    0
		db    0
unk_7197D	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71985	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71991	db    0
		db    0
unk_71993	db    0
unk_71994	db    0
		db    0
unk_71996	db    0
unk_71997	db    0
unk_71998	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7199E	db    0
unk_7199F	db    0
		db    0
		db    0
		db    0
unk_719A3	db    0
unk_719A4	db    0
		db    0
		db    0
		db    0
unk_719A8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_719B3	db    0
		db    0
unk_719B5	db    0
		db    0
		db    0
unk_719B8	db    0
		db    0
		db    0
		db    0
		db    0
unk_719BD	db    0
		db    0
		db    0
		db    0
unk_719C1	db    0
		db    0
unk_719C3	db    0
		db    0
		db    0
unk_719C6	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_719CF	db    0
		db    0
		db    0
		db    0
unk_719D3	db    0
unk_719D4	db    0
		db    0
		db    0
		db    0
unk_719D8	db    0
unk_719D9	db    0
		db    0
		db    0
unk_719DC	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_719E2	db    0
unk_719E3	db    0
		db    0
unk_719E5	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_719ED	db    0
		db    0
		db    0
unk_719F0	db    0
unk_719F1	db    0
		db    0
unk_719F3	db    0
unk_719F4	db    0
		db    0
		db    0
		db    0
unk_719F8	db    0
		db    0
		db    0
		db    0
		db    0
unk_719FD	db    0
		db    0
		db    0
		db    0
unk_71A01	db    0
		db    0
		db    0
unk_71A04	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71A13	db    0
unk_71A14	db    0
		db    0
		db 0FFh
		db 0FFh
word_71A18	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254:loc_68320w
word_71A1A	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254:loc_68327w
word_71A1C	dw 0			; DATA XREF: seg212:0908r seg212:090Fr
word_71A1E	dw 0			; DATA XREF: seg000:030Er
					; seg000:loc_31Ar ...
		db    0
unk_71A21	db  20h
unk_71A22	db  20h
unk_71A23	db  20h
		db  20h
unk_71A25	db  20h
		db  20h
		db  20h
unk_71A28	db  20h
		db  20h
		db  21h	; !
		db  21h	; !
		db  21h	; !
unk_71A2D	db  21h	; !
		db  21h	; !
		db  20h
unk_71A30	db  20h
unk_71A31	db  20h
		db  20h
unk_71A33	db  20h
unk_71A34	db  20h
		db  20h
unk_71A36	db  20h
		db  20h
		db  20h
unk_71A39	db  20h
		db  20h
		db  20h
unk_71A3C	db  20h
		db  20h
		db  20h
		db  20h
		db  20h
unk_71A41	db    1
unk_71A42	db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
unk_71A51	db    2
		db    2
unk_71A53	db    2
unk_71A54	db    2
unk_71A55	db    2
unk_71A56	db    2
unk_71A57	db    2
unk_71A58	db    2
		db    2
		db    2
		db  40h	; @
		db  40h	; @
		db  40h	; @
unk_71A5E	db  40h	; @
unk_71A5F	db  40h	; @
		db  40h	; @
		db  40h	; @
		db  14h
unk_71A63	db  14h
		db  14h
		db  14h
		db  14h
		db  14h
unk_71A68	db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  18h
unk_71A83	db  18h
unk_71A84	db  18h
unk_71A85	db  18h
		db  18h
		db  18h
		db    8
		db    8
		db    8
		db    8
		db    8
		db    8
		db    8
		db    8
		db    8
unk_71A91	db    8
		db    8
unk_71A93	db    8
		db    8
		db    8
		db    8
unk_71A97	db    8
		db    8
unk_71A99	db    8
		db    8
		db    8
unk_71A9C	db  40h	; @
		db  40h	; @
		db  40h	; @
unk_71A9F	db  40h	; @
		db  20h
		db    0
unk_71AA2	db    0
unk_71AA3	db    0
unk_71AA4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71AB1	db    0
		db    0
unk_71AB3	db    0
unk_71AB4	db    0
unk_71AB5	db    0
unk_71AB6	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71AC1	db    0
		db    0
		db    0
unk_71AC4	db    0
		db    0
unk_71AC6	db    0
unk_71AC7	db    0
unk_71AC8	db    0
unk_71AC9	db    0
		db    0
		db    0
unk_71ACC	db    0
		db    0
unk_71ACE	db    0
unk_71ACF	db    0
		db    0
unk_71AD1	db    0
unk_71AD2	db    0
unk_71AD3	db    0
unk_71AD4	db    0
		db    0
		db    0
unk_71AD7	db    0
unk_71AD8	db    0
unk_71AD9	db    0
		db    0
		db    0
		db    0
unk_71ADD	db    0
		db    0
unk_71ADF	db    0
unk_71AE0	db    0
		db    0
		db    0
		db    0
unk_71AE4	db    0
unk_71AE5	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71AF1	db    0
		db    0
unk_71AF3	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71B03	db    0
unk_71B04	db    0
		db    0
unk_71B06	db    0
unk_71B07	db    0
unk_71B08	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71B0E	db    0
		db    0
		db    0
		db    0
		db    0
unk_71B13	db    0
		db    0
unk_71B15	db    0
		db    0
		db    0
		db    0
unk_71B19	db    0
		db    0
		db    0
unk_71B1C	db    0
		db    0
		db    0
		db    0
		db    0
unk_71B21	db    0
off_71B22	dd nullsub_2		; DATA XREF: CRT_ExitSequence+29r Stdio_SetupFileStruct+96w	...
off_71B26	dd nullsub_2		; DATA XREF: CRT_ExitSequence+41r
off_71B2A	dd nullsub_2		; DATA XREF: CRT_ExitSequence+45r
		align 4
word_71B30	dw 209h			; DATA XREF: seg000:0DE9w seg000:0DF3r
byte_71B32	db 0			; DATA XREF: seg000:loc_DDAr
unk_71B33	db    0
unk_71B34	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Eh	; ~
unk_71B3D	db  4Ah	; J
		db    0
unk_71B3F	db    0
word_71B40	dw 20Ah			; DATA XREF: seg000:0E21w seg000:0E2Br
byte_71B42	db 1			; DATA XREF: seg000:0E12r
unk_71B43	db    0
unk_71B44	db    0
unk_71B45	db    0
unk_71B46	db    0
unk_71B47	db    0
unk_71B48	db    0
		db    0
		db    0
		db    0
		db  8Eh	; �
		db  4Ah	; J
unk_71B4E	db    0
		db    0
		db    2
unk_71B51	db    2
		db    2
unk_71B53	db    0
unk_71B54	db    0
		db    0
		db    0
		db    0
		db    0
unk_71B59	db    0
		db    0
		db    0
unk_71B5C	db  9Eh	; �
		db  4Ah	; J
		db    0
		db    0
		db  43h	; C
		db    2
unk_71B62	db    3
unk_71B63	db    0
unk_71B64	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AEh	; �
		db  4Ah	; J
		db    0
		db    0
		db  42h	; B
		db    2
		db    4
		db    0
		db    0
unk_71B75	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0BEh	; �
		db  4Ah	; J
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71B84	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71B91	db    0
unk_71B92	db    0
unk_71B93	db    0
unk_71B94	db    0
		db    0
unk_71B96	db    0
unk_71B97	db    0
unk_71B98	db    0
		db    0
		db    0
		db    0
		db    0
unk_71B9D	db    0
unk_71B9E	db    0
		db    0
unk_71BA0	db    0
		db    0
		db    0
unk_71BA3	db    0
unk_71BA4	db    0
unk_71BA5	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71BB4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71BBF	db    0
		db    0
unk_71BC1	db    0
unk_71BC2	db    0
unk_71BC3	db    0
unk_71BC4	db    0
		db    0
unk_71BC6	db    0
unk_71BC7	db    0
unk_71BC8	db    0
unk_71BC9	db    0
		db    0
		db    0
unk_71BCC	db    0
unk_71BCD	db    0
unk_71BCE	db    0
		db    0
unk_71BD0	db    0
unk_71BD1	db    0
unk_71BD2	db    0
unk_71BD3	db    0
unk_71BD4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71BE3	db    0
unk_71BE4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71BF4	db    0
		db    0
unk_71BF6	db    0
unk_71BF7	db    0
unk_71BF8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71BFE	db    0
		db    0
		db    0
		db    0
		db    0
unk_71C03	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71C11	db    0
unk_71C12	db    0
unk_71C13	db    0
unk_71C14	db    0
		db    0
		db    0
unk_71C17	db    0
		db    0
unk_71C19	db    0
		db    0
		db    0
		db    0
unk_71C1D	db    0
		db    0
unk_71C1F	db    0
unk_71C20	db    0
		db    0
		db    0
		db    0
unk_71C24	db    0
		db    0
unk_71C26	db    0
unk_71C27	db    0
unk_71C28	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71C2E	db    0
		db    0
		db    0
unk_71C31	db    0
		db    0
unk_71C33	db    0
		db    0
		db    0
unk_71C36	db    0
		db    0
		db    0
unk_71C39	db    0
		db    0
		db    0
unk_71C3C	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71C42	db    0
unk_71C43	db    0
unk_71C44	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71C51	db    0
unk_71C52	db    0
unk_71C53	db    0
unk_71C54	db    0
		db    0
unk_71C56	db    0
unk_71C57	db    0
unk_71C58	db    0
unk_71C59	db    0
		db    0
		db    0
		db    0
unk_71C5D	db    0
unk_71C5E	db    0
unk_71C5F	db    0
unk_71C60	db    0
		db    0
		db    0
unk_71C63	db    0
unk_71C64	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_71C6E	dw 14h			; DATA XREF: EntryPoint_RuntimeInit+D2r	EntryPoint_RuntimeInit+F5r ...
		db    1
unk_71C71	db  60h	; `
		db    2
unk_71C73	db  60h	; `
unk_71C74	db    2
		db  60h	; `
unk_71C76	db    4
		db 0A0h	; �
		db    2
		db 0A0h	; �
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_71C91	db    0
		db    0
		db    0
		db    0
unk_71C95	db    0
		db    0
		db    0
word_71C98	dw 0			; DATA XREF: EntryPoint_RuntimeInit+74r	EntryPoint_RuntimeInit+8Ar
word_71C9A	dw 0			; DATA XREF: CRT_ClampMathIndex:loc_4FAw
					; CRT_ClampMathIndex+27w
		db    0
		db  13h
		db    2
		db    2
		db    4
		db    5
		db    6
unk_71CA3	db    8
unk_71CA4	db    8
		db    8
		db  14h
		db  15h
		db    5
		db  13h
		db  0Eh
		db  16h
		db    5
		db  11h
		db    2
		db  1Eh
		db  29h	; )
unk_71CB1	db  2Ch	; ,
		db  28h	; (
unk_71CB3	db  28h	; (
		db  28h	; (
		db  28h	; (
unk_71CB6	db  28h	; (
		db  29h	; )
		db  2Ch	; ,
unk_71CB9	db  28h	; (
		db  28h	; (
		db  28h	; (
unk_71CBC	db    5
		db    5
		db  29h	; )
		db  17h
		db  17h
		db  0Eh
unk_71CC2	db  0Eh
unk_71CC3	db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
unk_71CCD	db  0Eh
		db  0Fh
unk_71CCF	db  2Ch	; ,
unk_71CD0	db  23h	; #
unk_71CD1	db    2
		db  2Ch	; ,
unk_71CD3	db  0Fh
unk_71CD4	db  2Ah	; *
		db  28h	; (
		db  28h	; (
		db  28h	; (
unk_71CD8	db  13h
		db  1Bh
		db  1Ch
		db    2
		db    2
		db    5
		db  0Fh
		db    2
		db  17h
unk_71CE1	db  28h	; (
		db  2Ah	; *
unk_71CE3	db  13h
unk_71CE4	db  2Ah	; *
		db  0Eh
		db  0Eh
unk_71CE7	db  0Eh
		db  0Eh
unk_71CE9	db  0Eh
		db  0Eh
		db  0Eh
		db  23h	; #
		db  0Eh
		db  1Ch
unk_71CEF	db  28h	; (
		db  17h
unk_71CF1	db  23h	; #
		db  25h	; %
unk_71CF3	db  13h
unk_71CF4	db  28h	; (
		db    0
word_71CF6	dw 1			; DATA XREF: seg000:0708w CRT_Rand+4r ...
word_71CF8	dw 0			; DATA XREF: seg000:0702w CRT_Randr ...
		db    0
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    1
		db    1
		db    1
		db    1
		db    1
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
unk_71D11	db    2
		db    2
unk_71D13	db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    1
		db    2
		db    2
		db    2
		db    2
		db    3
		db    2
unk_71D21	db    2
		db    2
unk_71D23	db    2
		db    4
		db    2
		db    2
unk_71D27	db    2
		db    2
unk_71D29	db    2
		db    5
		db    5
		db    5
		db    5
		db    5
unk_71D2F	db    5
		db    5
		db    5
unk_71D32	db    5
unk_71D33	db    5
unk_71D34	db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
unk_71D3D	db    2
		db    7
unk_71D3F	db  0Ah
unk_71D40	db  15h
		db  0Ah
		db  0Ch
unk_71D43	db    9
unk_71D44	db    2
		db    2
		db  0Bh
		db    2
unk_71D48	db  14h
		db  0Eh
		db    2
		db    2
		db    2
		db    2
		db    2
		db    8
		db    2
unk_71D51	db    2
		db  12h
unk_71D53	db    2
		db    2
unk_71D55	db  10h
		db    2
		db  10h
		db    2
		db    2
		db    2
		db    2
		db    2
		db    6
		db    7
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ch
unk_71D63	db    9
		db    2
		db    2
		db  0Dh
		db    2
		db  11h
		db  0Eh
		db  13h
		db    2
		db    2
		db  0Fh
		db    2
		db    8
		db    2
		db    2
		db  12h
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
aNull		db '(null)',0
		db    0
		db  14h
unk_71D83	db  14h
		db    1
		db  14h
		db  15h
		db  14h
unk_71D88	db  14h
		db  14h
		db  14h
		db    2
		db    0
		db  14h
		db    3
		db    4
		db  14h
		db    9
		db    5
		db    5
unk_71D94	db    5
		db    5
unk_71D96	db    5
unk_71D97	db    5
unk_71D98	db    5
		db    5
		db    5
		db  14h
		db  14h
		db  14h
unk_71D9E	db  14h
		db  14h
		db  14h
		db  14h
		db  14h
unk_71DA3	db  14h
		db  14h
		db  14h
		db  0Fh
		db  17h
		db  0Fh
		db    8
		db  14h
		db  14h
		db  14h
		db    7
		db  14h
		db  16h
		db  14h
		db  14h
unk_71DB2	db  14h
unk_71DB3	db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  0Dh
		db  14h
		db  14h
		db  14h
unk_71DBD	db  14h
		db  14h
unk_71DBF	db  14h
unk_71DC0	db  14h
		db  14h
		db  14h
unk_71DC3	db  14h
unk_71DC4	db  10h
unk_71DC5	db  0Ah
		db  0Fh
		db  0Fh
unk_71DC8	db  0Fh
unk_71DC9	db    8
		db  0Ah
		db  14h
unk_71DCC	db  14h
		db    6
		db  14h
		db  12h
		db  0Bh
unk_71DD1	db  0Eh
unk_71DD2	db  14h
unk_71DD3	db  14h
unk_71DD4	db  11h
		db  14h
unk_71DD6	db  0Ch
unk_71DD7	db  14h
unk_71DD8	db  14h
unk_71DD9	db  0Dh
		db  14h
		db  14h
		db  14h
		db  14h
unk_71DDE	db  14h
unk_71DDF	db  14h
		db  14h
unk_71DE1	db    0
aPrintScanfFloa	db 'print scanf : floating point formats not linked',0Dh,0Ah,0
word_71E14	dw 952h			; DATA XREF: seg000:17A0w PIT_DelayLoop+19r
word_71E16	dw 0			; DATA XREF: seg000:179Aw PIT_DelayLoop+15r
word_71E18	dw 0			; DATA XREF: Heap_ShrinkTailr
					; Heap_ShrinkTail:loc_19AAr ...
word_71E1A	dw 0			; DATA XREF: Heap_ReallocShrink+Cr Heap_ShrinkTail+Ew ...
word_71E1C	dw 0			; DATA XREF: Heap_ShrinkTail+31w Heap_FreelistUnlink+7w	...
		db    0
		db    0
		db    0
unk_71E21	db    0
		db    0
unk_71E23	db    0
unk_71E24	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Dh
		db    0
word_71E2E	dw 0			; DATA XREF: Stdio_SetupFileStruct:loc_2653r
					; Stdio_SetupFileStruct+44w
word_71E30	dw 0			; DATA XREF: Stdio_SetupFileStruct:loc_263Er
					; Stdio_SetupFileStruct+2Fw
off_71E32	dw offset CRT_FatalStackError	; DATA XREF: Heap_ErrHandler1r
off_71E34	dw offset loc_175A	; DATA XREF: Heap_ErrHandler2r
off_71E36	dw offset loc_175A	; DATA XREF: Heap_ErrHandler3r
off_71E38	dw offset loc_175A	; DATA XREF: Heap_ErrHandler4r
		db    1
		db  20h
off_71E3C	dd VROOMM_StubThunk_6AB11
		db    1
		db  20h
off_71E42	dd loc_8147
		db    1
		db  20h
		dd AI_ResetThreatScoreGlobal_A2F9
		db    1
		db  20h
off_71E4E	dd loc_11BE8
		db    1
		db  20h
off_71E54	dd VROOMM_StubThunk_6B055
		db    1
		db  20h
		dd loc_1F396
		db    1
		db  20h
off_71E60	dd loc_207F0
unk_71E64	db    1
		db  20h
		dd loc_233F2
		db    1
		db  20h
		dd loc_24E94
		db    1
		db  20h
		dd loc_27218
		db    1
		db  20h
off_71E78	dd loc_28C67
unk_71E7C	db    1
		db  20h
		dd loc_28FE1
unk_71E82	db    1
		db  20h
		dd VROOMM_StubThunk_6B7BC
		db    1
		db  20h
		dd loc_2AC16
		db    1
		db  20h
off_71E90	dd loc_2BC4A
		db    1
unk_71E95	db  20h
off_71E96	dd loc_2E6FD
		db    1
		db  20h
off_71E9C	dd loc_2F192
		db    1
		db  20h
off_71EA2	dd loc_2FEA8
		db    1
		db  20h
		dd loc_32559
		db    1
		db  20h
		dd loc_334D2
		db    1
		db  20h
		dd loc_34577
		db    1
unk_71EB9	db  20h
off_71EBA	dd VROOMM_StubThunk_6BE42
		db    1
		db  20h
off_71EC0	dd loc_369DC
unk_71EC4	db    1
unk_71EC5	db  20h
off_71EC6	dd loc_3834C
		db    1
		db  20h
off_71ECC	dd loc_3A224
unk_71ED0	db    1
unk_71ED1	db  20h
off_71ED2	dd loc_42440
		db    1
		db  20h
		dd loc_42D7E
		db    1
		db  20h
off_71EDE	dd loc_4518B
		db    1
		db  20h
		dd VROOMM_StubThunk_6C848
		db    1
		db  20h
		dd loc_46934
		db    1
		db  20h
off_71EF0	dd loc_47E74
unk_71EF4	db    1
unk_71EF5	db  20h
off_71EF6	dd loc_4B8F3
		db    1
		db  20h
off_71EFC	dd loc_4D62C
		db    1
		db  20h
off_71F02	dd UIScreen_InitDefaultParams_5066A
		db    1
		db  20h
		dd VROOMM_StubThunk_6CDDC
		db    1
		db  20h
off_71F0E	dd GeomNode_ResetGlobalCounter_547E1
		db    1
unk_71F13	db  20h
off_71F14	dd Math_InitConstants_54E83
unk_71F18	db    1
unk_71F19	db  20h
		dd Formation_ApplyGeometryAndCalibration_57F3B
unk_71F1E	db    1
unk_71F1F	db  20h
off_71F20	dd Interrupt_TimerInitState_597C2
unk_71F24	db    1
unk_71F25	db  20h
		dd TextObjectCluster_InitState_5ADD9
		db    1
		db  20h
		dd Memory_AllocatorTable_ConstructThunk_5CA80
		db    1
unk_71F31	db  20h
off_71F32	dd DisplaySurfaceClass_Construct_5EAC8
		db    1
		db  20h
		dd FontStyle_ConstructThunk_5EEBE
		db    1
unk_71F3D	db  20h
off_71F3E	dd JoystickManager_InitSingleton_6663D
		db    1
		db  20h
off_71F44	dd ConfigOption_InitGlobalState_66AAF
		db    1
		db  20h
		dd InputBinding_ConstructThunk_66FA4
		db    1
		db  20h
off_71F50	dd TextScroll_ResetFlag_6725D
unk_71F54	db    1
unk_71F55	db  20h
off_71F56	dd Stopwatch_ConstructThunk_67817
		db    1
		db  20h
off_71F5C	dd TextScrollDisplayB_Method_AllocateThunk_680CC
		db    1
		db    1
off_71F62	dd VROOMM_MainEntry_68B2F
		db    0
		db    2
		db 0A6h	; �
		db  0Dh
		db    0
		db    0
		db    1
		db  10h
		dd loc_178F
unk_71F72	db    0
unk_71F73	db  10h
		db    1
		db  1Eh
		db    0
		db    0
		db    1
		db  20h
off_71F7A	dd loc_1F406
		db    1
		db  20h
off_71F80	dd loc_20817
unk_71F84	db    1
		db  20h
		dd loc_23411
		db    1
		db  20h
		dd loc_272A5
		db    1
unk_71F91	db  20h
off_71F92	dd loc_28C8B
		db    1
		db  20h
		dd loc_29004
		db    1
		db  20h
		dd VROOMM_StubThunk_6B7C1
		db    1
unk_71FA3	db  20h
		dd loc_2E77B
		db    1
		db  20h
		dd loc_2F23B
		db    1
		db  20h
off_71FB0	dd loc_2FECF
		db    1
		db  20h
		dd loc_3257A
		db    1
		db  20h
off_71FBC	dd loc_334DF
unk_71FC0	db    1
unk_71FC1	db  20h
off_71FC2	dd loc_36A55
		db    1
unk_71FC7	db  20h
off_71FC8	dd loc_38365
		db    1
		db  20h
off_71FCE	dd loc_47F8C
		db    1
unk_71FD3	db  20h
off_71FD4	dd UIScreen_Close_50920
		db    1
		db  20h
		dd Interrupt_TimerCleanup_59817
		db    1
		db  20h
off_71FE0	dd TextObjectCluster_DtorThunk_5ADEF
unk_71FE4	db    1
		db  20h
off_71FE6	dd Memory_AllocatorTable_DestructThunk_5CA8D
		db    1
		db  20h
off_71FEC	dd DisplaySurfaceClass_Destruct_5EAE0
		db    1
		db  20h
off_71FF2	dd FontStyle_DestructThunk_5EECB
		db    1
		db  20h
		dd JoystickManager_RegisterSingleton_66672
		db    1
unk_71FFD	db  20h
off_71FFE	dd InputBinding_DestructThunk_66FB2
		db    1
		db  20h
off_72004	dd Stopwatch_StartOrStopThunk_67824
		db    1
		db  20h
		dd TextScrollDisplayB_Method_DestructThunk_680DA
		db    1
		db    1
off_72010	dd VROOMM_Helper2_683D7
word_72014	dw 0			; DATA XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+10Ew
dword_72016	dd 0			; DATA XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+FFw
word_7201A	dw 0			; DATA XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+11Cw
dword_7201C	dd 0			; DATA XREF: seg002:00A3r seg002:00EFr ...
dword_72020	dd 0			; DATA XREF: Targeting_AcquireBestThreat:loc_3BDEr
					; AI_ComputeFireSolutionQuality_91DF:loc_95AEr ...
dword_72024	dd 0			; DATA XREF: Targeting_AcquireBestThreat+608r
					; Targeting_AcquireBestThreat+66Cr ...
dword_72028	dd 0			; DATA XREF: Targeting_AcquireBestThreat:loc_3C30r
					; AI_ComputeFireSolutionQuality_91DF:loc_9604r ...
dword_7202C	dd 0			; DATA XREF: Targeting_AcquireBestThreat+63Fr
					; Targeting_AcquireBestThreat:loc_39A0r ...
dword_72030	dd 0			; DATA XREF: Targeting_AcquireBestThreat:loc_37F3r
					; PilotProfile_LoadNUMSCompanionFile_73FB4+23Ew
dword_72034	dd 0			; DATA XREF: seg002:loc_4571r
					; seg008:loc_10166r ...
byte_72038	db 0			; DATA XREF: Targeting_AcquireBestThreat+9C6r
					; Targeting_AcquireBestThreat:loc_3CF6r ...
dword_72039	dd 0			; DATA XREF: seg002:loc_4B54r
					; AI_Sensor_TargetInRange+3Cr	...
dword_7203D	dd 0			; DATA XREF: seg002:0752r seg002:0F6Ar ...
dword_72041	dd 0			; DATA XREF: AI_Sensor_WeaponVelocityCache+2Dw AI_Sensor_WeaponVelocityCache+E8w ...
dword_72045	dd 0			; DATA XREF: AI_Sensor_WeaponVelocityCache+3Dw AI_Sensor_WeaponVelocityCache+F0w ...
dword_72049	dd 0			; DATA XREF: AI_Sensor_WeaponVelocityCache+4Dw AI_Sensor_WeaponVelocityCache+F8w ...
dword_7204D	dd 0			; DATA XREF: seg003:0756r AI_Sensor_InterceptFeasibleCached+44w ...
algn_72051:
		align 2
byte_72052	db 0			; DATA XREF: AI_ProximityGeometricWarning_315B:loc_324Cw
					; AI_TopLevelThink:loc_8177w ...
dword_72053	dd 0			; DATA XREF: Missile_PhysicsTick+14Dw
					; Missile_PhysicsTick+330r ...
dword_72057	dd 0			; DATA XREF: Missile_PhysicsTick+159w
					; Missile_PhysicsTick+339r ...
dword_7205B	dd 0			; DATA XREF: seg002:loc_4B3Br
					; Missile_PhysicsTick+165w ...
dword_7205F	dd 0			; DATA XREF: Missile_PhysicsTick+50w
					; Missile_PhysicsTick+315r ...
dword_72063	dd 0			; DATA XREF: Missile_PhysicsTick+58w
					; Missile_PhysicsTick+31Er ...
dword_72067	dd 0			; DATA XREF: Missile_PhysicsTick+60w
					; Missile_PhysicsTick+327r ...
dword_7206B	dd 0			; DATA XREF: Missile_PhysicsTick+397w
dword_7206F	dd 0			; DATA XREF: Missile_PhysicsTick+39Fw
dword_72073	dd 0			; DATA XREF: Missile_PhysicsTick+3A7w
dword_72077	dd 0			; DATA XREF: Missile_PhysicsTick+18Fw
					; Missile_PhysicsTick+1E8r
dword_7207B	dd 0			; DATA XREF: Missile_PhysicsTick+198w
					; Missile_PhysicsTick+1F5r
dword_7207F	dd 0			; DATA XREF: Missile_PhysicsTick+1A1w
					; Missile_PhysicsTick+202r
dword_72083	dd 0			; DATA XREF: Missile_PhysicsTick+1CEw
					; Missile_PhysicsTick+1E4r
dword_72087	dd 0			; DATA XREF: Missile_PhysicsTick+1D7w
					; Missile_PhysicsTick+1F1r
dword_7208B	dd 0			; DATA XREF: Missile_PhysicsTick+1E0w
					; Missile_PhysicsTick+1FEr
word_7208F	dw 0			; DATA XREF: Missile_PhysicsTick+5E2w
					; seg009:00F4w
word_72091	dw 0			; DATA XREF: Missile_PhysicsTick+3C1w
word_72093	dw 0			; DATA XREF: seg002:loc_3EC3r
					; seg002:0085r	...
word_72095	dw 0			; DATA XREF: seg002:008Cr seg002:0097r ...
word_72097	dw 0			; DATA XREF: seg002:loc_487Er
					; seg002:0B06r	...
word_72099	dw 0			; DATA XREF: Missile_PhysicsTick+312w
dword_7209B	dd 0			; DATA XREF: seg002:009Fr
					; seg002:loc_3F7Br ...
dword_7209F	dd 0			; DATA XREF: Missile_PhysicsTick+80w
					; Missile_PhysicsTick:loc_E63Fr ...
dword_720A3	dd 0			; DATA XREF: Missile_PhysicsTick+88w Missile_PhysicsTick+96r ...
dword_720A7	dd 0			; DATA XREF: seg002:0F7Cr Missile_PhysicsTick+90w ...
dword_720AB	dd 0			; DATA XREF: Missile_PhysicsTick+27Fw
					; Missile_PhysicsTick+3CEr ...
dword_720AF	dd 0			; DATA XREF: Missile_PhysicsTick+288w
					; Missile_PhysicsTick+3C9r ...
dword_720B3	dd 0			; DATA XREF: Missile_PhysicsTick+291w
					; Missile_PhysicsTick+3C4r ...
dword_720B7	dd 0			; DATA XREF: seg002:061Ar
					; seg002:loc_44C5r ...
dword_720BB	dd 0			; DATA XREF: seg002:loc_449Br
					; seg002:0639r	...
dword_720BF	dd 0			; DATA XREF: Missile_PhysicsTick+4B3w
					; Missile_PhysicsTick+4DEr ...
byte_720C3	db 0			; DATA XREF: seg002:loc_3EB7r
					; seg002:loc_3FF2r ...
byte_720C4	db 0			; DATA XREF: Missile_PhysicsTick+372w
					; Missile_PhysicsTick:loc_E91Dw
dword_720C5	dd 0			; DATA XREF: seg002:048Br seg002:050Cr ...
dword_720C9	dd 0			; DATA XREF: seg002:0232r seg002:046Fr ...
dword_720CD	dd 0			; DATA XREF: seg002:loc_40BEr
					; seg002:loc_42FBr ...
dword_720D1	dd 0			; DATA XREF: seg002:0A73r seg002:0ABEr ...
dword_720D5	dd 0			; DATA XREF: seg002:0A87r seg002:0AD2r ...
dword_720D9	dd 0			; DATA XREF: seg002:loc_43D3r
					; seg002:loc_4653r ...
word_720DD	dw 0			; DATA XREF: seg002:03CDr seg002:0586r ...
byte_720DF	db 0			; DATA XREF: seg002:loc_3EF8r
					; seg002:loc_3F95r ...
byte_720E0	db 0			; DATA XREF: seg002:006Fr
					; seg002:loc_424Cr ...
byte_720E1	db 0			; DATA XREF: seg002:loc_4947r
					; seg002:0D12r	...
word_720E2	dw 0			; DATA XREF: TextScroll_DrawTypewriterFrame_87457+85r
					; TextScroll_DrawTypewriterFrameB_8781A+18w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72103	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72111	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72123	db    0
unk_72124	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72131	db    0
		db    0
		db    0
unk_72134	db    0
		db    0
unk_72136	db    0
unk_72137	db    0
unk_72138	db    0
		db    0
		db    0
		db    0
word_7213C	dw 0			; DATA XREF: seg031:098Bw
word_7213E	dw 0			; DATA XREF: seg031:0991w
dword_72140	dd 0			; DATA XREF: AV_SyncInit+Aw
					; RadioQueue_ExpireTimer+63r ...
dword_72144	dd 0			; DATA XREF: AV_SyncInit+10w
					; RadioQueue_ExpireTimer+5Er ...
		db    0
byte_72149	db 0			; DATA XREF: seg031:0997w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72151	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72163	db    0
unk_72164	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72194	db    0
		db    0
unk_72196	db    0
unk_72197	db    0
unk_72198	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7219E	db    0
		db    0
		db    0
		db    0
		db    0
unk_721A3	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_721B1	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_721C1	db    0
		db    0
unk_721C3	db    0
unk_721C4	db    0
		db    0
unk_721C6	db    0
unk_721C7	db    0
unk_721C8	db    0
unk_721C9	db    0
byte_721CA	db 0			; DATA XREF: seg015:0BB3r
					; RadioQueue_RemoveSlot:loc_1EA3Bw	...
dword_721CB	dd 0			; DATA XREF: Text_ComputeCumulativeWidth+Cr
					; seg031:loc_1F3CCw ...
byte_721CF	db 0			; DATA XREF: Text_ComputeCumulativeWidth+8r seg031:09A5w ...
byte_721D0	db 0			; DATA XREF: seg031:09AAw seg031:0A21r ...
dword_721D1	dd 0			; DATA XREF: Text_ComputeCumulativeWidth+28r
					; seg031:09AFw	...
dword_721D5	dd 0			; DATA XREF: seg031:09B8w seg031:09E3r ...
byte_721D9	db 0			; DATA XREF: seg031:09C1w seg031:09EDr ...
byte_721DA	db 0			; DATA XREF: seg031:09C6w seg031:09DCr ...
dword_721DB	dd 0			; DATA XREF: seg031:09CBw seg031:0A18w ...
		align 2
word_721E0	dw 0			; DATA XREF: Cinematic_LoadCameraDef:loc_23EB4r
					; TextRenderer_Main+2E8w ...
word_721E2	dw 0			; DATA XREF: seg036:0183w
word_721E4	dw 0			; DATA XREF: seg036:0189w
word_721E6	dw 0			; DATA XREF: TextRenderer_Main+32Cw
word_721E8	dw 0			; DATA XREF: TextRenderer_Main+332w
word_721EA	dw 0			; DATA XREF: TextRenderer_Main+338w
word_721EC	dw 0			; DATA XREF: TextRenderer_Main+33Ew
		db    0
byte_721EF	db 0			; DATA XREF: seg036:loc_207FFw
byte_721F0	db 0			; DATA XREF: seg015:010Fr
					; RadioQueue_ExpireTimer:loc_1F044r	...
word_721F1	dw 0			; DATA XREF: seg036:0194w
					; MissionText_DrawTypewriterSynced_975CC+F8r ...
word_721F3	dw 0			; DATA XREF: seg036:loc_2080Aw
					; Cockpit_DrawEncodedText_8FA4C+31r ...
		align 2
dword_721F6	dd 0			; DATA XREF: seg042:0BB2r
					; ParticleEmitter_ProximityTest+6Ar ...
		db    0
		db    0
		db    0
		db    0
word_721FE	dw 0			; DATA XREF: Cinematic_SplineCompute+146r
					; Cinematic_SplineCompute+21Dr ...
word_72200	dw 0			; DATA XREF: Cinematic_SplineCompute+181r
					; Cinematic_SplineCompute+258r ...
dword_72202	dd 0			; DATA XREF: Cinematic_SplineCompute:loc_243D6r
					; Cinematic_SplineCompute+1FFr ...
dword_72206	dd 0			; DATA XREF: Cinematic_SplineCompute+163r
					; Cinematic_SplineCompute+23Ar ...
dword_7220A	dd 0			; DATA XREF: Cinematic_SplineCompute+72r
					; seg061:024Dr	...
dword_7220E	dd 0			; DATA XREF: Cinematic_SplineCompute+7Br
					; seg061:025Br	...
dword_72212	dd 0			; DATA XREF: Cinematic_SplineCompute+84r
					; seg061:0269r	...
dword_72216	dd 0			; DATA XREF: Render_TerrainPipelineMain+88r
dword_7221A	dd 0			; DATA XREF: Render_TerrainPipelineMain:loc_3467Fr
dword_7221E	dd 0			; DATA XREF: Render_TerrainPipelineMain+1D3r
					; Render_TerrainPipelineMain+2FAr ...
dword_72222	dd 0			; DATA XREF: Render_TerrainPipelineMain+93r
dword_72226	dd 0			; DATA XREF: Render_TerrainPipelineMain+B4r
dword_7222A	dd 0			; DATA XREF: Render_TerrainPipelineMain+1EAr
					; Render_TerrainPipelineMain+305r ...
dword_7222E	dd 0			; DATA XREF: Widget_AnchorTo3DPosition+5Fr
					; Render_TerrainPipelineMain+9Er
dword_72232	dd 0			; DATA XREF: Widget_AnchorTo3DPosition+6Fr
					; Render_TerrainPipelineMain+BFr
dword_72236	dd 0			; DATA XREF: Widget_AnchorTo3DPosition+7Fr
					; Render_TerrainPipelineMain+1DEr ...
		db    0
		db    0
		db    0
		db    0
word_7223E	dw 0			; DATA XREF: Render_ObjectPipelineMain+Br
					; Render_TerrainPipelineMain+30r ...
word_72240	dw 0			; DATA XREF: Render_ObjectPipelineMain+1Ar
					; Render_TerrainPipelineMain+3Er ...
word_72242	dw 0			; DATA XREF: Render_ObjectPipelineMain+29r
					; Render_TerrainPipelineMain+4Cr ...
word_72244	dw 0			; DATA XREF: Render_ObjectPipelineMain+38r
					; Render_TerrainPipelineMain+5Ar ...
word_72246	dw 0			; DATA XREF: seg040:04EEw
word_72248	dw 0			; DATA XREF: seg040:04F4w
word_7224A	dw 0			; DATA XREF: Cinematic_LoadCameraDef+13w
word_7224C	dw 0			; DATA XREF: Cinematic_LoadCameraDef+19w
word_7224E	dw 0			; DATA XREF: Cinematic_LoadCameraDef+1Fw
word_72250	dw 0			; DATA XREF: Cinematic_LoadCameraDef+25w
		db    0
byte_72253	db 0			; DATA XREF: seg040:04FAw
word_72254	dw 0			; DATA XREF: seg042:0D97w seg042:0D9Dw ...
unk_72256	db    0
unk_72257	db    0
unk_72258	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7225E	db    0
		db    0
		db    0
		db    0
		db    0
unk_72263	db    0
		db    0
		db    0
		db    0
word_72267	dw 0			; DATA XREF: seg042:loc_24EAFw
					; seg042:0DB5w	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72271	db    0
		db    0
unk_72273	db    0
		db    0
		db    0
		db    0
unk_72277	db    0
		db    0
unk_72279	db    0
		db    0
		db    0
		db    0
word_7227D	dw 0			; DATA XREF: seg042:loc_24EC7w
					; seg042:loc_24ECDw ...
unk_7227F	db    0
		db    0
		db    0
		db    0
		db    0
unk_72284	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72292	dw 0			; DATA XREF: seg047:02FBw
					; seg047:loc_2725Bw ...
word_72294	dw 0			; DATA XREF: seg047:0304w
		db    0
dword_72297	dd 0			; DATA XREF: seg047:030Dw
byte_7229B	db 0			; DATA XREF: seg047:0316w
byte_7229C	db 0			; DATA XREF: seg047:031Bw
dword_7229D	dd 0			; DATA XREF: seg047:0320w
word_722A1	dw 0			; DATA XREF: seg047:0329w
		db    0
		db    0
		db    0
		db    0
word_722A7	dw 0			; DATA XREF: seg047:loc_2724Fw
		db    0
		db    0
		db    0
		db    0
word_722AD	dw 0			; DATA XREF: seg047:0335w
byte_722AF	db 0			; DATA XREF: seg047:loc_27261w
word_722B0	dw 0			; DATA XREF: seg047:0346w seg047:035Ew
word_722B2	dw 0			; DATA XREF: seg047:034Fw
word_722B4	dw 0			; DATA XREF: seg047:0358w
byte_722B6	db 0			; DATA XREF: Program_InitVideoFontArgs+25Dw
					; seg047:0364w
byte_722B7	db 0			; DATA XREF: Program_InitVideoFontArgs+25Ar
		db    0
unk_722B9	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_722BF	db    0
		db    0
unk_722C1	db    0
		db    0
unk_722C3	db    0
unk_722C4	db    0
		db    0
unk_722C6	db    0
unk_722C7	db    0
unk_722C8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_722CE	db    0
		db    0
byte_722D0	db 0			; DATA XREF: Player_MainUpdate:loc_1315Dr
					; Player_MainUpdate+9Br ...
byte_722D1	db 0			; DATA XREF: seg014:loc_148EFr
					; seg015:05A1r	...
		db    0
byte_722D3	db 0			; DATA XREF: Player_MainUpdate+64r
					; Player_MainUpdate+A2r ...
byte_722D4	db 0			; DATA XREF: Input_ReadJoystickButtons_7AC70:loc_7AC7Ar
		align 2
dword_722D6	dd 0			; DATA XREF: Input_ReadAxis2Deadzone+19r
					; Input_ReadAxis2Deadzone+49w ...
dword_722DA	dd 0			; DATA XREF: Input_ReadAxis2Deadzone+1Dr
					; Input_ReadAxis2Deadzone+41w ...
dword_722DE	dd 0			; DATA XREF: Input_ReadAxis1Deadzone:loc_28761r
					; Input_ReadAxis1Deadzone+50w ...
dword_722E2	dd 0			; DATA XREF: Input_ReadAxis1Deadzone+29r
					; Input_ReadAxis1Deadzone:loc_2877Fw	...
word_722E6	dw 0			; DATA XREF: Targeting_AcquireBestThreat+37r Targeting_AcquireBestThreat+78r ...
word_722E8	dw 0			; DATA XREF: RadioFlags_ShiftHistory+84r
					; RadioFlags_ShiftHistory:loc_28F93r	...
word_722EA	dw 0			; DATA XREF: RadioFlags_ShiftHistory+B1r
					; RadioFlags_ShiftHistory:loc_28FC0r	...
word_722EC	dw 0			; DATA XREF: Radio_CombatChatterDispatch+13Ar
					; Radio_CombatChatterDispatch+17Ar ...
word_722EE	dw 0			; DATA XREF: Goal_SelectTransition+13Er
					; Goal_SelectTransition+198r ...
dword_722F0	dd 0			; DATA XREF: ResourceFile_Helper_90923+3w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+1AEr ...
byte_722F4	db 0			; DATA XREF: ResourceFile_Helper_90923+Cw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+1B8r
byte_722F5	db 0			; DATA XREF: ResourceFile_Helper_90923+11w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+1A7r ...
dword_722F6	dd 0			; DATA XREF: ResourceFile_Helper_90923+16w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+1DAw
dword_722FA	dd 0			; DATA XREF: ResourceFile_Helper_90923+1Fw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+172r ...
byte_722FE	db 0			; DATA XREF: ResourceFile_Helper_90923+28w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+17Cr
byte_722FF	db 0			; DATA XREF: ResourceFile_Helper_90923+2Dw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+16Br ...
dword_72300	dd 0			; DATA XREF: ResourceFile_Helper_90923+32w
					; ResourceFile_ReleaseMultipleBlocks_90AD6:loc_90C74w
dword_72304	dd 0			; DATA XREF: ResourceFile_Helper_90923+3Bw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+136r ...
byte_72308	db 0			; DATA XREF: ResourceFile_Helper_90923+44w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+140r
byte_72309	db 0			; DATA XREF: ResourceFile_Helper_90923+49w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+12Fr ...
dword_7230A	dd 0			; DATA XREF: ResourceFile_Helper_90923+4Ew
					; ResourceFile_ReleaseMultipleBlocks_90AD6+162w
dword_7230E	dd 0			; DATA XREF: ResourceFile_Helper_90923+57w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+FAr ...
byte_72312	db 0			; DATA XREF: ResourceFile_Helper_90923+60w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+104r
byte_72313	db 0			; DATA XREF: ResourceFile_Helper_90923+65w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+F3r ...
dword_72314	dd 0			; DATA XREF: ResourceFile_Helper_90923+6Aw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+126w
dword_72318	dd 0			; DATA XREF: ResourceFile_Helper_90923+73w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+BEr ...
byte_7231C	db 0			; DATA XREF: ResourceFile_Helper_90923+7Cw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+C8r
byte_7231D	db 0			; DATA XREF: ResourceFile_Helper_90923+81w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+B7r ...
dword_7231E	dd 0			; DATA XREF: ResourceFile_Helper_90923+86w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+EAw
dword_72322	dd 0			; DATA XREF: ResourceFile_Helper_90923:loc_909B2w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+82r ...
byte_72326	db 0			; DATA XREF: ResourceFile_Helper_90923+98w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+8Cr
byte_72327	db 0			; DATA XREF: ResourceFile_Helper_90923+9Dw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+7Br ...
dword_72328	dd 0			; DATA XREF: ResourceFile_Helper_90923+A2w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+AEw
dword_7232C	dd 0			; DATA XREF: ResourceFile_Helper_90923+ABw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+46r ...
byte_72330	db 0			; DATA XREF: ResourceFile_Helper_90923+B4w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+50r
byte_72331	db 0			; DATA XREF: ResourceFile_Helper_90923+B9w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+3Fr ...
dword_72332	dd 0			; DATA XREF: ResourceFile_Helper_90923+BEw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+72w
dword_72336	dd 0			; DATA XREF: ResourceFile_Helper_90923+C7w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+Ar	...
byte_7233A	db 0			; DATA XREF: ResourceFile_Helper_90923+D0w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+14r
byte_7233B	db 0			; DATA XREF: ResourceFile_Helper_90923+D5w
					; ResourceFile_ReleaseMultipleBlocks_90AD6+3r	...
dword_7233C	dd 0			; DATA XREF: ResourceFile_Helper_90923+DAw
					; ResourceFile_ReleaseMultipleBlocks_90AD6+36w
byte_72340	db 0			; DATA XREF: seg015:loc_14FF8r
					; seg015:loc_15011w ...
byte_72341	db 0			; DATA XREF: ResourceFile_Helper_90923+E9w
byte_72342	db 0			; DATA XREF: ResourceFile_Helper_90923+EEw
word_72343	dw 0			; DATA XREF: ResourceFile_Helper_90923+E3w
byte_72345	db 0			; DATA XREF: ResourceFile_Helper_90923+F3w
byte_72346	db 0			; DATA XREF: ResourceFile_Helper_90923+F8w
byte_72347	db 0			; DATA XREF: ResourceFile_Helper_90923+FDw
byte_72348	db 0			; DATA XREF: ResourceFile_Helper_90923+102w
byte_72349	db 0			; DATA XREF: ResourceFile_Helper_90923+107w
byte_7234A	db 0			; DATA XREF: ResourceFile_Helper_90923+10Cw
byte_7234B	db 0			; DATA XREF: ResourceFile_Helper_90923+111w
					; Terrain_ComputeVisibilityAndAltitude_98CF0:loc_98D17r
word_7234C	dw 0			; DATA XREF: ResourceFile_Helper_90923+116w
word_7234E	dw 0			; DATA XREF: RadioQueue_ExpireTimer+3Cr
					; ResourceFile_Helper_90923+11Cw ...
word_72350	dw 0			; DATA XREF: Player_MainUpdate:loc_13BFFr
					; Player_MainUpdate:loc_13CDDr	...
word_72352	dw 0			; DATA XREF: seg015:loc_155A5r
					; seg015:06BCr	...
byte_72354	db 0			; DATA XREF: Aero_ComputeLiftAndSideForce_4812B+ABr
					; UIScreen_BuildWidgetTree_Recurse_53D92+195r ...
byte_72355	db 0			; DATA XREF: seg103:109Br
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53F34r	...
byte_72356	db 0			; DATA XREF: Collision_NarrowPhaseTest:loc_44AB0r
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53F3Fr	...
byte_72357	db 0			; DATA XREF: Player_MainUpdate+2F4w
					; ResourceFile_Helper_90923+13Dw ...
byte_72358	db 0			; DATA XREF: HUD_RenderSymbologyMain+14Er
					; HUD_RenderSymbologyMain+681r ...
byte_72359	db 0			; DATA XREF: HUD_RenderSymbologyAlt:loc_4086Er
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53F57r	...
byte_7235A	db 0			; DATA XREF: HUD_RenderSymbologyAlt+A50r
					; HUD_RenderSymbologyAlt+B62r ...
byte_7235B	db 0			; DATA XREF: seg030:loc_1D2EEr
					; seg030:0B54r	...
byte_7235C	db 0			; DATA XREF: seg030:loc_1DFF2r
					; seg030:197Fr	...
byte_7235D	db 0			; DATA XREF: Proximity_TestPoints+8Cr
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53F6Fr	...
byte_7235E	db 0			; DATA XREF: seg032:02A5r
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53F96r	...
word_7235F	dw 0			; DATA XREF: PilotProfile_RescaleSkillByDifficulty_12FC9+Cr
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53FA2r	...
byte_72361	db 0			; DATA XREF: seg027:0130r
					; ResourceFile_Helper_90923+16Bw
byte_72362	db 0			; DATA XREF: seg022:032Er seg022:045Ar ...
byte_72363	db 0			; DATA XREF: HUD_RenderSymbologyAlt:loc_401F8r
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53FBAr	...
byte_72364	db 0			; DATA XREF: Cockpit_ViewPanTransitionMain_15B67:loc_15BD0r
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53FC5r	...
byte_72365	db 0			; DATA XREF: Cockpit_ViewPanTransitionMain_15B67:loc_15E9Dr
					; UIScreen_BuildWidgetTree_Recurse_53D92:loc_53FD0r	...
byte_72366	db 0			; DATA XREF: Player_MainUpdate:loc_13949r
					; Player_MainUpdate+853w ...
byte_72367	db 0			; DATA XREF: Mission_TriggerEvaluator+299w
					; ResourceFile_Helper_90923+189w
byte_72368	db 0			; DATA XREF: Mission_TriggerEvaluator+24Bw
					; ResourceFile_Helper_90923:loc_90AB1w
byte_72369	db 0			; DATA XREF: Camera_UpdateAndNotifyB_861E0+3Ar
					; ResourceFile_Helper_90923+193w
byte_7236A	db 0			; DATA XREF: Mission_TriggerEvaluator+15r
					; ResourceFile_Helper_90923+198w ...
byte_7236B	db 0			; DATA XREF: Config_ReadCalibration:loc_270B0r
					; Config_ReadCalibration+14Cr ...
byte_7236C	db 0			; DATA XREF: Config_ReadCalibration:loc_27107r
					; Config_ReadCalibration+196w ...
byte_7236D	db 0			; DATA XREF: TextRenderer_Main+701w
					; TextRenderer_Main:loc_27D6Ar	...
byte_7236E	db 0			; DATA XREF: ResourceFile_Helper_90923+1ACw
word_7236F	dw 0			; DATA XREF: MissionText_DrawTypewriterSynced_975CC+39w
algn_72371:
		align 2
word_72372	dw 0			; DATA XREF: seg055:1A39w seg055:1A3Fw ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72389	dw 0			; DATA XREF: seg055:1A51w
					; seg055:loc_2AC37w ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_723A3	dw 0			; DATA XREF: seg055:1A69w seg055:1A6Fw ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_723B1	db    0
		db    0
		db    0
unk_723B4	db    0
		db    0
unk_723B6	db    0
unk_723B7	db    0
unk_723B8	db    0
		db    0
word_723BA	dw 0			; DATA XREF: seg055:1A87w seg055:1A8Dw ...
		db    0
		db    0
unk_723BE	db    0
		db    0
		db    0
unk_723C1	db    0
		db    0
unk_723C3	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_723D0	dw 0			; DATA XREF: seg055:1A99w seg055:1AAFw
		db    0
unk_723D3	db    0
unk_723D4	db    0
byte_723D5	db 0			; DATA XREF: seg055:1A9Fw seg055:1AA4w
word_723D6	dw 0			; DATA XREF: seg055:1AB5w seg055:1ABBw ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_723E4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_723EE	dw 0			; DATA XREF: seg055:1ACDw seg055:1AD3w ...
		db    0
unk_723F1	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72404	dw 0			; DATA XREF: seg055:1AE5w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_7240C	dw 0			; DATA XREF: seg055:1AEBw seg055:1AF1w ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72422	dw 0			; DATA XREF: seg055:1B03w
unk_72424	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_7242A	dw 0			; DATA XREF: seg055:1B09w seg055:1B1Fw
		db    0
		db    0
		db    0
byte_7242F	db 0			; DATA XREF: seg055:loc_2ACEFw
					; seg055:loc_2ACF4w
word_72430	dw 0			; DATA XREF: seg055:1B25w seg055:1B2Bw ...
		db    0
		db    0
		db    0
unk_72435	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72443	db    0
unk_72444	db    0
		db    0
word_72446	dw 0			; DATA XREF: seg055:1B3Dw
		align 10h
word_72450	dw 0			; DATA XREF: seg055:1B49w
					; seg055:loc_2AD2Fw ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72463	db    0
		db    0
		db    0
word_72466	dw 0			; DATA XREF: seg055:loc_2AD41w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_7246E	dw 0			; DATA XREF: seg055:1B67w
					; seg055:loc_2AD5Dw
		db    0
unk_72471	db    0
		db    0
byte_72473	db 0			; DATA XREF: seg055:1B6Dw seg055:1B72w
word_72474	dw 0			; DATA XREF: seg059:065Dw seg059:0663w ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72483	db    0
unk_72484	db    0
		db    0
		db    0
		db    0
word_72488	dw 0			; DATA XREF: seg059:0675w
					; seg059:loc_2BC6Bw ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72495	db    0
		db    0
		db    0
		db    0
word_72499	dw 0			; DATA XREF: seg059:068Dw seg059:0693w ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_724AA	dw 0			; DATA XREF: Damage_SimulationTick+5FEr
					; Damage_SimulationTick+906r ...
word_724AC	dw 0			; DATA XREF: Damage_SimulationTick+5FBr
					; Damage_SimulationTick+604r ...
dword_724AE	dd 0			; DATA XREF: Damage_SimulationTick+60Er
					; Damage_SimulationTick+916r ...
		db    0
		db    0
		db    0
		db    0
dword_724B6	dd 0			; DATA XREF: seg065:0913w seg065:09CAr ...
byte_724BA	db 0			; DATA XREF: seg065:091Cw seg065:09D4r
byte_724BB	db 0			; DATA XREF: seg065:loc_2E721w
					; seg065:09C3r	...
dword_724BC	dd 0			; DATA XREF: seg065:loc_2E726w
					; seg065:09F6w
dword_724C0	dd 0			; DATA XREF: seg065:loc_2E72Fw
					; seg065:098Er	...
byte_724C4	db 0			; DATA XREF: seg065:0938w seg065:0998r
byte_724C5	db 0			; DATA XREF: seg065:093Dw seg065:0987r ...
dword_724C6	dd 0			; DATA XREF: seg065:0942w seg065:09BAw
word_724CA	dw 0			; DATA XREF: seg066:0995w
		db    0
dword_724CD	dd 0			; DATA XREF: Input_CalibrationHandler+170r
					; seg066:099Bw	...
		db    0
		db    0
dword_724D3	dd 0			; DATA XREF: seg066:loc_2F1A4w
byte_724D7	db 0			; DATA XREF: seg066:09ADw
byte_724D8	db 0			; DATA XREF: seg066:09B2w
dword_724D9	dd 0			; DATA XREF: seg066:09B7w
dword_724DD	dd 0			; DATA XREF: seg066:loc_2F1C0w
byte_724E1	db 0			; DATA XREF: seg066:09C9w
byte_724E2	db 0			; DATA XREF: seg066:loc_2F1CEw
dword_724E3	dd 0			; DATA XREF: seg066:09D3w
dword_724E7	dd 0			; DATA XREF: seg066:09DCw
byte_724EB	db 0			; DATA XREF: seg066:09E5w
byte_724EC	db 0			; DATA XREF: seg066:09EAw
dword_724ED	dd 0			; DATA XREF: seg066:09EFw
dword_724F1	dd 0			; DATA XREF: seg066:09F8w
byte_724F5	db 0			; DATA XREF: seg066:0A01w
byte_724F6	db 0			; DATA XREF: seg066:0A06w
dword_724F7	dd 0			; DATA XREF: seg066:0A0Bw
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72503	db    0
unk_72504	db    0
byte_72505	db 0			; DATA XREF: Camera_ComputeViewMatrix+3DDr
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72515	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_7251C	dw 0			; DATA XREF: Render_ObjectPipelineMain+1C6Cr
					; Render_TerrainPipelineMain+205Fr
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72524	dw 0			; DATA XREF: Render_DamageTintResolve+33r
					; Render_DamageTintResolveAlt:loc_29DE8r	...
		align 4
dword_72528	dd 0			; DATA XREF: seg032:0742r
					; Mesh_FaceSetupTexturedColor+39r ...
byte_7252C	db 0			; DATA XREF: seg032:073Er
					; Mesh_FaceSetupTexturedColor+35r ...
byte_7252D	db 0			; DATA XREF: seg066:loc_2F222w
dword_7252E	dd 0			; DATA XREF: seg066:loc_2F227w
word_72532	dw 0			; DATA XREF: Render_ObjectPipelineMain+1C79r
					; Render_TerrainPipelineMain+206Cr
algn_72534:
		align 8
dword_72538	dd 0			; DATA XREF: Render_ObjectPipelineMain+1C74r
					; Render_TerrainPipelineMain+2067r
algn_7253C:
		align 8
dword_72540	dd 0			; DATA XREF: Cinematic_SplineCompute:loc_2448Ar
					; seg059:loc_2B822r ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_7254A	dw 0			; DATA XREF: seg068:0620w
					; seg068:loc_2FED5o ...
word_7254C	dw 0			; DATA XREF: seg068:061Dw
					; Terrain_ComputeVisibilityAndAltitude_98CF0+3B0r ...
word_7254E	dw 0			; DATA XREF: seg068:0628w
					; Terrain_ComputeVisibilityAndAltitude_98CF0+3A4r ...
word_72550	dw 0			; DATA XREF: seg068:0625w
					; Terrain_ComputeVisibilityAndAltitude_98CF0+3BCr ...
word_72552	dw 0			; DATA XREF: seg068:062Bw
					; seg068:loc_2FEC1w ...
		db    0
unk_72555	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72574	db    0
		db    0
unk_72576	db    0
unk_72577	db    0
unk_72578	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_7257E	db    0
		db    0
		db    0
		db    0
		db    0
unk_72583	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72594	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_7259E	dw 0			; DATA XREF: Model_RenderWithSubcomponents+FCr
					; Terrain_ComputeVisibilityAndAltitude_98CF0+2F0r ...
word_725A0	dw 0			; DATA XREF: Model_RenderWithSubcomponents+AEr
					; Terrain_ComputeVisibilityAndAltitude_98CF0+A3r ...
dword_725A2	dd 0			; DATA XREF: Model_RenderWithSubcomponents+94r
					; Model_RenderWithSubcomponents+E2r ...
byte_725A6	db 0			; DATA XREF: Model_RenderWithSubcomponents+90r
					; Model_RenderWithSubcomponents+DEr ...
byte_725A7	db 0			; DATA XREF: seg070:09BAw
					; seg070:loc_3257Dr ...
dword_725A8	dd 0			; DATA XREF: seg070:09BFw
					; seg070:loc_325B0w ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_725B4	db    0
		db    0
unk_725B6	db    0
unk_725B7	db    0
unk_725B8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_725BE	db    0
		db    0
		db    0
		db    0
		db    0
unk_725C3	db    0
unk_725C4	db    0
unk_725C5	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_725D9	db 0			; DATA XREF: TerrainSector_ParseTriple_9A844:loc_9A892w
unk_725DA	db    0			; DATA XREF: TerrainSector_ParseTriple_9A844+11o
		db    0
		db    0
		db    0
		db    0
		db    0
unk_725E0	db    0			; DATA XREF: TerrainSector_ParseTriple_9A844+2Ao
		db    0
		db    0
		db    0
		db    0
		db    0
unk_725E6	db    0			; DATA XREF: TerrainSector_ParseTriple_9A844+43o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_725F4	db    0
		db    0
unk_725F6	db    0
unk_725F7	db    0
unk_725F8	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_725FE	db    0
		db    0
		db    0
		db    0
		db    0
unk_72603	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72614	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72635	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72654	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_726B5	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_726C4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_726D3	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_726EE	dw 0			; DATA XREF: Render_ObjectPipelineMain+1B36r
					; Render_TerrainPipelineMain:loc_365BFr	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72706	dw 0			; DATA XREF: Render_TerrainPipelineMain+2077r
					; seg075:02BBw	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_7272D	dw 0			; DATA XREF: Render_TerrainPipelineMain+20D5r
					; seg075:loc_369FDw ...
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72734	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72743	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72778	dw 0			; DATA XREF: seg068:loc_2F89Dw
					; Render_DispatchFlatOrPerspective:loc_367F0w	...
word_7277A	dw 0			; DATA XREF: seg068:0014w
					; Render_DispatchFlatOrPerspective+11w
word_7277C	dw 0			; DATA XREF: Render_DispatchFlatOrPerspective+18w
					; Render_DispatchFlatOrPerspective+45r ...
word_7277E	dw 0			; DATA XREF: seg068:001Bw seg075:0156w ...
word_72780	dw 0			; DATA XREF: seg068:0022w seg075:015Dw ...
dword_72782	dd 0			; DATA XREF: seg068:002Aw seg075:01F5w
dword_72786	dd 0			; DATA XREF: seg068:loc_2F8C3w
					; seg075:01FEw
dword_7278A	dd 0			; DATA XREF: seg068:loc_2F8CCw
					; seg075:0207w
word_7278E	dw 0			; DATA XREF: seg068:0044w
					; Render_DispatchFlatOrPerspective+1Fw
word_72790	dw 0			; DATA XREF: seg068:004Bw
					; Render_DispatchFlatOrPerspective+26w
word_72792	dw 0			; DATA XREF: Render_DispatchFlatOrPerspective+2Dw
					; Render_DispatchFlatOrPerspective+48r ...
word_72794	dw 0			; DATA XREF: seg068:0052w seg075:0164w ...
word_72796	dw 0			; DATA XREF: seg068:0059w seg075:016Bw ...
dword_72798	dd 0			; DATA XREF: seg068:0061w seg075:021Ew
dword_7279C	dd 0			; DATA XREF: seg068:006Aw seg075:0227w
dword_727A0	dd 0			; DATA XREF: seg068:0073w
					; seg075:loc_36960w
word_727A4	dw 0			; DATA XREF: seg068:007Bw
					; Render_DispatchFlatOrPerspective+34w
word_727A6	dw 0			; DATA XREF: seg068:0082w
					; Render_DispatchFlatOrPerspective+3Bw
word_727A8	dw 0			; DATA XREF: Render_DispatchFlatOrPerspective+42w
					; Render_DispatchFlatOrPerspective+4Er ...
word_727AA	dw 0			; DATA XREF: seg068:0089w seg075:0172w ...
word_727AC	dw 0			; DATA XREF: seg068:0090w seg075:0179w ...
dword_727AE	dd 0			; DATA XREF: seg068:0098w seg075:0247w
dword_727B2	dd 0			; DATA XREF: seg068:loc_2F931w
					; seg075:0250w
dword_727B6	dd 0			; DATA XREF: seg068:loc_2F93Aw
					; seg075:0259w
word_727BA	dw 0			; DATA XREF: Terrain_SectorIndexResolve+28r
					; Terrain_SectorIndexResolve:loc_3354Ar	...
word_727BC	dw 0			; DATA XREF: Terrain_SectorIndexResolve:loc_3354Er
					; Terrain_SectorResolveChecked+34r ...
word_727BE	dw 0			; DATA XREF: Terrain_SectorIndexResolve+34r
					; Terrain_SectorResolveChecked+28r ...
word_727C0	dw 0			; DATA XREF: Terrain_SectorIndexResolve+4Cr
					; Terrain_SectorResolveChecked+40r ...
dword_727C2	dd 0			; DATA XREF: seg075:02F5w seg075:032Fr ...
byte_727C6	db 0			; DATA XREF: seg075:02FEw
					; seg075:loc_36A69r ...
byte_727C7	db 0			; DATA XREF: seg075:0303w seg075:0328r ...
dword_727C8	dd 0			; DATA XREF: seg075:0308w seg075:035Bw ...
word_727CC	dw 0			; DATA XREF: seg078:loc_3834Fw
					; seg078:loc_3835Dw
word_727CE	dw 0			; DATA XREF: seg078:071Aw
word_727D0	dw 0			; DATA XREF: seg078:loc_38357w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72803	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_7281A	dd 0			; DATA XREF: Explosion_CreateFireball+CEw
					; Explosion_CreateFireball+139r ...
dword_7281E	dd 0			; DATA XREF: Explosion_CreateFireball+DAw
					; Explosion_CreateFireball+145r ...
dword_72822	dd 0			; DATA XREF: Explosion_CreateFireball+E6w
					; Explosion_CreateFireball+151r ...
dword_72826	dd 0			; DATA XREF: seg080:0AE2w
					; Effect_GridProjectCorners+58w ...
dword_7282A	dd 0			; DATA XREF: seg080:0AF2w
					; Effect_GridProjectCorners+60w ...
dword_7282E	dd 0			; DATA XREF: seg080:0B02w
					; Effect_GridProjectCorners+68w ...
dword_72832	dd 0			; DATA XREF: seg080:0B1Cw
					; Effect_GridProjectCorners+70w ...
dword_72836	dd 0			; DATA XREF: seg080:0B25w
					; Effect_GridProjectCorners+78w ...
dword_7283A	dd 0			; DATA XREF: seg080:0B2Ew
					; Effect_GridProjectCorners+80w ...
dword_7283E	dd 0			; DATA XREF: GuidedBombBody_SteerToTarget_41BEF+Br seg089:0CBEw
dword_72842	dd 0			; DATA XREF: GuidedBombBody_SteerToTarget_41BEF+18r
					; seg089:0CC6w
dword_72846	dd 0			; DATA XREF: GuidedBombBody_SteerToTarget_41BEF+25r
					; seg089:0CCEw
dword_7284A	dd 0			; DATA XREF: GuidedBombBody_SteerToTarget_41BEF+Fr seg089:0C31w
dword_7284E	dd 0			; DATA XREF: GuidedBombBody_SteerToTarget_41BEF+1Cr
					; seg089:0C39w
dword_72852	dd 0			; DATA XREF: GuidedBombBody_SteerToTarget_41BEF+29r
					; seg089:0C41w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72875	db    0
		db    0
		db    0
		db    0
		db    0
dword_7287A	dd 0			; DATA XREF: MissileBody_SteerToTarget_42738+Br seg090:068Dw
dword_7287E	dd 0			; DATA XREF: MissileBody_SteerToTarget_42738+18r
					; seg090:0695w
dword_72882	dd 0			; DATA XREF: MissileBody_SteerToTarget_42738+25r
					; seg090:069Dw	...
dword_72886	dd 0			; DATA XREF: MissileBody_SteerToTarget_42738+Fr seg090:0622w ...
dword_7288A	dd 0			; DATA XREF: MissileBody_SteerToTarget_42738+1Cr
					; seg090:062Aw	...
dword_7288E	dd 0			; DATA XREF: MissileBody_SteerToTarget_42738+29r
					; seg090:0632w	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_728B5	db    0
dword_728B6	dd 0			; DATA XREF: seg094:003Cw seg094:0079r ...
dword_728BA	dd 0			; DATA XREF: seg094:0044w seg094:0086r ...
dword_728BE	dd 0			; DATA XREF: seg094:004Cw seg094:0093r ...
dword_728C2	dd 0			; DATA XREF: Explosion_CreateFireball:loc_38EADr
					; seg094:00A9w	...
dword_728C6	dd 0			; DATA XREF: Explosion_CreateFireball+D2r
					; seg094:00B1w	...
dword_728CA	dd 0			; DATA XREF: Explosion_CreateFireball+DEr
					; seg094:00B9w	...
dword_728CE	dd 0			; DATA XREF: seg094:0065w seg094:007Dr ...
dword_728D2	dd 0			; DATA XREF: seg094:006Dw seg094:008Ar ...
dword_728D6	dd 0			; DATA XREF: seg094:0075w seg094:0097r ...
dword_728DA	dd 0			; DATA XREF: seg094:00D4w seg094:00ECr ...
dword_728DE	dd 0			; DATA XREF: seg094:00DCw seg094:00F9r ...
dword_728E2	dd 0			; DATA XREF: seg094:00E4w seg094:0106r ...
dword_728E6	dd 0			; DATA XREF: seg094:0082w
dword_728EA	dd 0			; DATA XREF: seg094:008Fw
dword_728EE	dd 0			; DATA XREF: seg094:009Cw
dword_728F2	dd 0			; DATA XREF: seg094:00F1w
dword_728F6	dd 0			; DATA XREF: seg094:00FEw
dword_728FA	dd 0			; DATA XREF: seg094:010Bw
byte_728FE	db 0			; DATA XREF: PaletteScreen_ComputeCurvePointA_A12FB+27r
					; PaletteScreen_ComputeCurvePointA_A12FB+65r ...
byte_728FF	db 0			; DATA XREF: PaletteScreen_DrawCurveWithLabel_A24C7:loc_A2555r
					; PaletteScreen_DrawCurveWithLabelB_A2671+82r ...
word_72900	dw 0			; DATA XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A22D0r
					; PaletteScreen_ApplyTextStyleB_A2462+4Br ...
word_72902	dw 0			; DATA XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A22DBr
					; PaletteScreen_ApplyTextStyleB_A2462+52r ...
byte_72904	db 0			; DATA XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A22B7r
					; PaletteScreen_UpdateWidgetMain_A21AF:loc_A2370r
byte_72905	db 0			; DATA XREF: GaugeWidget_QueryAndFormat_A3C2C+1Dr
					; GaugeWidget_FormatDisplayValue_A3CF6:loc_A3DFDr
byte_72906	db 0			; DATA XREF: GaugeWidget_FormatDisplayValue_A3CF6:loc_A3E11r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72934	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72974	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_729B4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_729F4	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_72A0A	dd 0			; DATA XREF: Atmosphere_AirDensityAtAltitude_46DA3+10r
					; seg102:153Ew	...
byte_72A0E	db 0			; DATA XREF: Atmosphere_AirDensityAtAltitude_46DA3+Cr seg102:1547w ...
byte_72A0F	db 0			; DATA XREF: seg102:154Cw seg102:162Fr ...
dword_72A10	dd 0			; DATA XREF: seg102:1551w
					; seg102:loc_47FC2w ...
dword_72A14	dd 0			; DATA XREF: JDYN_JumpToPoint_49242+16Cr
					; seg103:1527w	...
dword_72A18	dd 0			; DATA XREF: Aero_ResetAccumulatorFlags75Bit5+ACr
					; seg103:1530w	...
dword_72A1C	dd 0			; DATA XREF: Aero_ComputeAoACommand_48862+32Dr
					; seg103:1539w	...
dword_72A20	dd 0			; DATA XREF: Aero_ComputeControlFlags75Bit5C+1D8r
					; seg103:1542w	...
dword_72A24	dd 0			; DATA XREF: Aero_ComputeLiftAndSideForce_4812B+11Er
					; seg103:154Bw	...
dword_72A28	dd 0			; DATA XREF: seg103:loc_49514w
					; seg103:1863w	...
dword_72A2C	dd 0			; DATA XREF: JDYN_IsEngineDestroyed_47FCD:loc_47FDCr
					; seg103:155Dw	...
word_72A30	dw 0			; DATA XREF: seg106:15DFw seg106:15E5w ...
		db    0
		db    0
		db    0
		db    0
word_72A36	dw 0			; DATA XREF: seg106:15F0w
word_72A38	dw 0			; DATA XREF: seg106:15F6w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_72A5C	db 0			; DATA XREF: seg106:15EBw
		align 4
dword_72A60	dd 0			; DATA XREF: seg112:0C61w
		db    0
dword_72A65	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem:loc_4FD78w
					; CombatTarget_WeaponActionSubsystem+381w ...
dword_72A69	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+190w
					; CombatTarget_WeaponActionSubsystem+300r ...
word_72A6D	dw 0			; DATA XREF: seg112:0C77w
		db    0
		db    0
		db    0
		db    0
word_72A73	dw 0			; DATA XREF: seg030:173Cr
					; CollisionGrid_InitAroundPlayer+55r ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72A8C	dw 0			; DATA XREF: CameraScript_ExecuteCOMP_781D0+14BBw
byte_72A8E	db 0			; DATA XREF: Player_MainUpdate+24r
					; Cockpit_LoadBettyPack+6r	...
word_72A8F	dw 0			; DATA XREF: Player_MainUpdate+B25r
					; Player_MainUpdate+B29r ...
		align 2
byte_72A92	db 0			; DATA XREF: Cockpit_ReadControlsFrame_8F720+165w
byte_72A93	db 0			; DATA XREF: Cockpit_ReadControlsFrame_8F720+15Fw
word_72A94	dw 0			; DATA XREF: Player_MainUpdate+4C6o
					; Player_MainUpdate+4E4o ...
		db    0
		db    0
		db    0
		db    0
dword_72A9A	dd 0			; DATA XREF: seg112:loc_50994r
					; seg112:0DB2r	...
byte_72A9E	db 0			; DATA XREF: seg112:0DAEr
byte_72A9F	db 0			; DATA XREF: seg112:0D9Dr seg112:0DD4w
dword_72AA0	dd 0			; DATA XREF: seg112:0DD9w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72B30	dw 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+211r
					; TextScroll_DrawTypewriterFrameB_8781A:loc_8782Fr
		align 4
byte_72B34	db 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+416w
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+16Cw ...
dword_72B35	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+41Ew
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+174w ...
dword_72B39	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem:loc_50013w
					; Frame_UpdateTimingAndNotifyTrackedObjects_500F6+178w ...
		db    0
		db    0
		db    0
		db    0
byte_72B41	db 0			; DATA XREF: seg015:loc_15A9Cr
					; CombatTarget_WeaponActionSubsystem+426w ...
word_72B42	dw 0			; DATA XREF: Collision_NarrowPhaseTest+8Br
word_72B44	dw 0			; DATA XREF: Collision_NarrowPhaseTest:loc_44A7Er
					; Collision_NarrowPhaseTest:loc_44AF5r	...
		db    0
		db    0
		db    0
		db    0
word_72B4A	dw 0			; DATA XREF: seg112:0CADw seg112:0CBBw
word_72B4C	dw 0			; DATA XREF: Damage_SimulationTick+19r
					; seg112:0CB8w
word_72B4E	dw 0			; DATA XREF: seg112:0CB5w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_72B57	dd 0			; DATA XREF: MissionLoader_SpawnEntity_A7B1E+120w
dword_72B5B	dd 0			; DATA XREF: MissionLoader_SpawnEntity_A7B1E+128w
dword_72B5F	dd 0			; DATA XREF: MissionLoader_SpawnEntity_A7B1E+130w
word_72B63	dw 0			; DATA XREF: seg112:0CCAw seg112:0CD0w
dword_72B65	dd 0			; DATA XREF: UIScreen_ComputeDerivedFields_503EB+12Bw
word_72B69	dw 0			; DATA XREF: UIScreen_ComputeDerivedFields_503EB:loc_50499w
					; seg112:0CF2w
word_72B6B	dw 0			; DATA XREF: UIScreen_ComputeDerivedFields_503EB:loc_505A1w
word_72B6D	dw 0			; DATA XREF: UIScreen_ComputeDerivedFields_503EB+239w
dword_72B6F	dd 0			; DATA XREF: UIScreen_ComputeDerivedFields_503EB:loc_50408r
					; seg112:0CD6w	...
byte_72B73	db 0			; DATA XREF: seg112:0CDFw seg112:0D47r ...
byte_72B74	db 0			; DATA XREF: seg112:0CE4w seg112:0D36r ...
dword_72B75	dd 0			; DATA XREF: seg112:0CE9w seg112:0D72w ...
		align 2
dword_72B7A	dd 0			; DATA XREF: seg065:0120w
					; UIScreen_RenderGraphVGA_509EE:loc_50B20r	...
dword_72B7E	dd 0			; DATA XREF: seg065:loc_2DF5Bw
					; UIScreen_RenderGraphVGA_509EE:loc_50B15r	...
dword_72B82	dd 0			; DATA XREF: seg065:loc_2DF7Aw
					; UIScreen_RenderGraphVGA_509EE+10Er ...
dword_72B86	dd 0			; DATA XREF: seg065:0190w
					; UIScreen_RenderGraphVGA_509EE+103r ...
dword_72B8A	dd 0			; DATA XREF: seg065:01A6w
					; UIScreen_RenderGraphVGA_509EE+F8r ...
dword_72B8E	dd 0			; DATA XREF: seg065:loc_2DFCFw
					; UIScreen_RenderGraphVGA_509EE+F4r ...
		db    0
		db    0
		db    0
		db    0
dword_72B96	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+434w
					; UIScreen_RenderGraphVGA_509EE+19Ar ...
dword_72B9A	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+44Aw
					; UIScreen_RenderGraphVGA_509EE+18Fr ...
dword_72B9E	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+463w
					; UIScreen_RenderGraphVGA_509EE+184r ...
dword_72BA2	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+479w
					; UIScreen_RenderGraphVGA_509EE+179r ...
dword_72BA6	dd 0			; DATA XREF: CombatTarget_WeaponActionSubsystem+4A3w
					; UIScreen_RenderGraphVGA_509EE+175r ...
dword_72BAA	dd 0			; DATA XREF: UIScreen_ReadNumericFields_500A6+15w
					; UIScreen_RenderGraphVGA_509EE+1F7r ...
dword_72BAE	dd 0			; DATA XREF: UIScreen_ReadNumericFields_500A6+2Bw
					; UIScreen_RenderGraphVGA_509EE+1ECr ...
dword_72BB2	dd 0			; DATA XREF: UIScreen_ReadNumericFields_500A6+41w
					; UIScreen_RenderGraphVGA_509EE+1E1r ...
dword_72BB6	dd 0			; DATA XREF: WorldObjects_UpdateAllAndRemoveDead_221F2+D2w
					; UIScreen_RenderGraphVGA_509EE+254r
dword_72BBA	dd 0			; DATA XREF: WorldObjects_UpdateAllAndRemoveDead_221F2+E9w
					; UIScreen_RenderGraphVGA_509EE+24Fr
dword_72BBE	dd 0			; DATA XREF: WorldObjects_UpdateAllAndRemoveDead_221F2+FAw
					; UIScreen_RenderGraphVGA_509EE+24Ar
dword_72BC2	dd 0			; DATA XREF: WorldObjects_UpdateAllAndRemoveDead_221F2+105w
					; UIScreen_RenderGraphVGA_509EE+245r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_72BD6	dd 0			; DATA XREF: UIScreen_RenderGraphVGA_509EE+2B0r
					; MAIN_GAME_TICK+EAw
dword_72BDA	dd 0			; DATA XREF: UIScreen_RenderGraphVGA_509EE+2ADr
					; MAIN_GAME_TICK+17Cw
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_72C24	dd 0			; DATA XREF: Terrain_UpdateLODPerFrame+1D2w
					; UIScreen_RenderGraphVGA_509EE:loc_50C96r
dword_72C28	dd 0			; DATA XREF: Terrain_UpdateLODPerFrame+1EEw
					; UIScreen_RenderGraphVGA_509EE:loc_50C93r
dword_72C2C	dd 0			; DATA XREF: Render_TerrainPipelineMain+2Cw
					; UIScreen_RenderGraphVGA_509EE:loc_50C8Er
dword_72C30	dd 0			; DATA XREF: Render_TerrainPipelineMain+28Ew
					; UIScreen_RenderGraphVGA_509EE+298r ...
dword_72C34	dd 0			; DATA XREF: Render_TerrainPipelineMain+213Ew
					; UIScreen_RenderGraphVGA_509EE+295r
dword_72C38	dd 0			; DATA XREF: TextRenderer_Main:loc_2785Cw
					; TextRenderer_Main+3E9r ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72C60	db    0			; DATA XREF: seg116:314Ao
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_72C90	db 0			; DATA XREF: Weapon_HUDBox_Main_59302:loc_5932Er
					; Weapon_HUDBox_Main_59302+3Cr ...
word_72C91	dw 0			; DATA XREF: seg121:loc_594B8w
					; seg121:loc_5952Er ...
word_72C93	dw 0			; DATA XREF: seg121:05CAr seg121:05D5r ...
word_72C95	dw 0			; DATA XREF: seg121:05D1r seg121:05FAr ...
dword_72C97	dd 0			; DATA XREF: seg121:08F5w seg121:099Fr ...
byte_72C9B	db 0			; DATA XREF: seg121:08FEw seg121:09A9r
byte_72C9C	db 0			; DATA XREF: seg121:0903w seg121:0998r ...
dword_72C9D	dd 0			; DATA XREF: seg121:0908w
					; seg121:loc_5989Bw
byte_72CA1	db 0			; DATA XREF: seg121:loc_59479w
					; Interrupt_TimerCase_595C2:loc_596CBw	...
		db    0
		db    0
		db    0
word_72CA5	dw 0			; DATA XREF: seg121:loc_59573r
					; seg121:06AEr	...
word_72CA7	dw 0			; DATA XREF: seg121:06AAr seg121:093Fw ...
dword_72CA9	dd 0			; DATA XREF: seg121:091Dw seg121:095Ar ...
byte_72CAD	db 0			; DATA XREF: seg121:0926w seg121:0964r
byte_72CAE	db 0			; DATA XREF: seg121:092Bw seg121:0953r ...
dword_72CAF	dd 0			; DATA XREF: seg121:loc_59800w
					; seg121:0986w
byte_72CB3	db 0			; DATA XREF: Interrupt_TimerCaseB_5974D+Ew
word_72CB4	dw 0			; DATA XREF: TextObject_Allocate_5A577+5Dw
					; TextObject_Allocate_5A577+66r ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_72D74	db 0			; DATA XREF: TextRenderer_Main:loc_2751Aw
					; TextRenderer_Main:loc_276CCw	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72D9A	dw 0			; DATA XREF: IndexedRecordReader_ReadEntry_65DA9+58w
					; IndexedRecordReader_AdvanceIndex_65E2C:loc_65E4Br
word_72D9C	dw 0			; DATA XREF: seg200:0270w seg200:0294w ...
word_72D9E	dw 0			; DATA XREF: seg200:0276w
word_72DA0	dw 0			; DATA XREF: seg200:027Cw
word_72DA2	dw 0			; DATA XREF: seg200:loc_66652w
					; seg200:029Aw	...
word_72DA4	dw 0			; DATA XREF: seg200:028Bw
word_72DA6	dw 0			; DATA XREF: ConfigOption_ApplyAndDisplayB_6698F:loc_66A03w
					; ConfigOption_ApplyAndDisplayB_6698F:loc_66A3Fr	...
byte_72DA8	db 0			; DATA XREF: ConfigOption_ApplyAndDisplayB_6698F+7Dw
					; seg201:0398w
byte_72DA9	db 0			; DATA XREF: seg201:loc_66ABDw
unk_72DAA	db    0			; DATA XREF: ConfigOption_ApplyAndDisplayB_6698F+81o
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72DB0	db    0			; DATA XREF: ConfigOption_ApplyAndDisplayB_6698F:loc_66A21o
		db    0
		db    0
		db    0
		db    0
		db    0
word_72DB6	dw 0			; DATA XREF: seg201:024Dw
					; ConfigOption_ApplyAndDisplayB_6698F:loc_669F4r	...
word_72DB8	dw 0			; DATA XREF: seg201:0110w
					; seg201:loc_66858w ...
byte_72DBA	db 0			; DATA XREF: seg201:0116w seg201:0154w
byte_72DBB	db 0			; DATA XREF: seg201:011Bw seg201:015Bw
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_72DD7	db 0			; DATA XREF: CombatTarget_WeaponActionSubsystem:loc_4FEAEr
					; CombatTarget_WeaponActionSubsystem:loc_4FF22r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_72DE2	db 0			; DATA XREF: seg014:loc_14E69r
					; HUDSymbol_ProcessJoystickAndFilter_843B5:loc_84510r
byte_72DE3	db 0			; DATA XREF: seg014:loc_14E31r
					; HUDSymbol_ProcessJoystickAndFilter_843B5:loc_844D3r
		db    0
byte_72DE5	db 0			; DATA XREF: Player_MainUpdate:loc_13174r
					; Player_MainUpdate:loc_13426r	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_72DF2	db 0			; DATA XREF: Player_MainUpdate:loc_131B2r
					; Player_MainUpdate:loc_1322Ar	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_72DFB	db 0			; DATA XREF: Player_MainUpdate:loc_139E2r
byte_72DFC	db 0			; DATA XREF: Player_MainUpdate:loc_13978r
		align 2
byte_72DFE	db 0			; DATA XREF: Player_MainUpdate+B9r
					; Player_MainUpdate+131r ...
		align 2
byte_72E00	db 0			; DATA XREF: Player_MainUpdate:loc_132ABr
					; Player_MainUpdate:loc_133DBr	...
byte_72E01	db 0			; DATA XREF: Player_MainUpdate:loc_13956r
		align 10h
byte_72E10	db 0			; DATA XREF: Player_MainUpdate:loc_140DDr
					; Input_ReadAxis2Deadzone:loc_28990r	...
		db    0
		db    0
byte_72E13	db 0			; DATA XREF: Player_MainUpdate:loc_13FCCr
					; Input_ReadAxis2Deadzone:loc_289BBr	...
byte_72E14	db 0			; DATA XREF: Input_ProcessFrame_7A9E0:loc_7AABBr
byte_72E15	db 0			; DATA XREF: Player_MainUpdate+E71r
					; Input_ReadAxis2Deadzone:loc_289CDr	...
		align 4
byte_72E18	db 0			; DATA XREF: Player_MainUpdate+F82r
					; Input_ReadAxis2Deadzone:loc_289A5r	...
		db    0
		db    0
		db    0
		db    0
byte_72E1D	db 0			; DATA XREF: Player_MainUpdate+7Br
					; Player_MainUpdate+32Dr ...
		db    0
		db    0
		db    0
byte_72E21	db 0			; DATA XREF: Player_MainUpdate+1B2r
					; Player_MainUpdate+2E2r ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_72E2F	dd 0			; DATA XREF: Keyboard_PeekOrPopEvent_66CF5+24w
					; Keyboard_QueryHandlerTable_66D39:loc_66D46r
		align 10h
word_72E40	dw 0			; DATA XREF: InputBinding_InitAndRegister_66E02:loc_66E9Dr
		db    0
		db    0
		db    0
		db    0
word_72E46	dw 0			; DATA XREF: seg204:005Fw
					; TextScroll_ComputeParams_67048:loc_67051w	...
byte_72E48	db 0			; DATA XREF: TextScroll_ApplyHelperC_671E4+3w
					; TextScroll_FormatAndApply_67204:loc_67212o	...
byte_72E49	db 0			; DATA XREF: Input_ReadMouseAndAxes_7AAF0+14Fr
word_72E4A	dw 0			; DATA XREF: TextScroll_ApplyHelperD_67222:loc_6722Ar
					; TextScroll_ApplyHelperD_67222+23w
word_72E4C	dw 0			; DATA XREF: TextScroll_ApplyHelperD_67222:loc_67235r
					; TextScroll_ApplyHelperD_67222+2Bw
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72E68	dw 0			; DATA XREF: TextScrollDisplay_RegisterEntries_673B9:loc_673E8w
					; Input_GetCalibratedXValue_67481:loc_67494r	...
word_72E6A	dw 0			; DATA XREF: TextScrollDisplay_RegisterEntries_673B9:loc_673ECw
					; Input_GetCalibratedYValue_67499:loc_674ACr	...
byte_72E6C	db 0			; DATA XREF: TextScrollDisplay_ComputeLayout_672AF+27w
					; TextScrollDisplay_ComputeLayout_672AF:loc_672DDw	...
word_72E6D	dw 0			; DATA XREF: TextScrollDisplay_ComputeLayout_672AF+36w
		align 2
byte_72E70	db 0			; DATA XREF: TextScrollDisplayB_Construct_675B4+31w
					; TextScrollDisplayB_ApplyHelperA_67E9C+Aw	...
		align 4
unk_72E74	db    0			; DATA XREF: Joystick_FormatCalibrationDisplay_67B3A+11o
		db    0
		db    0
		db    0
		db    0
		db    0
unk_72E7A	db    0			; DATA XREF: Joystick_FormatCalibrationDisplay_67B3A:loc_67B5Eo
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72E82	dw 0			; DATA XREF: seg201:loc_66889r
					; ConfigOption_FormatValue_668A2:loc_668B4r	...
word_72E84	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScale_6794D+6Er
					; Joystick_ApplyDeadzoneAndScale_6794D:loc_679D1r	...
word_72E86	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A50r
					; Joystick_ApplyDeadzoneAndScaleB_679E2+84r ...
word_72E88	dw 0			; DATA XREF: Joystick_LoadCalibrationExtremes_67C21+Ew
					; Joystick_InterpolateCalibrationPercent_67CB8+1Er ...
word_72E8A	dw 0			; DATA XREF: Joystick_LoadCalibrationExtremes_67C21:loc_67C3Aw
					; Joystick_InterpolateCalibrationPercent_67CB8:loc_67D02r	...
word_72E8C	dw 0			; DATA XREF: Joystick_InitCalibrationDefaults_67B92+18w
					; Joystick_ComputeCalibrationRatio_67C3F+Ew	...
word_72E8E	dw 0			; DATA XREF: Joystick_InitCalibrationDefaults_67B92+1Ew
					; Joystick_ComputeCalibrationRatio_67C3F:loc_67C58w	...
word_72E90	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_67971r
					; Joystick_ApplyDeadzoneAndScale_6794D:loc_6797Ar	...
word_72E92	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A06r
					; Joystick_ApplyDeadzoneAndScaleB_679E2+2Dr ...
word_72E94	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScale_6794D+49r
					; Joystick_ApplyDeadzoneAndScale_6794D+73r ...
word_72E96	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_67962r
					; Joystick_ApplyDeadzoneAndScale_6794D+1Br ...
word_72E98	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A2Br
					; Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A55r	...
word_72E9A	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_679F7r
					; Joystick_ApplyDeadzoneAndScaleB_679E2:loc_679FDr	...
word_72E9C	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_67987r
					; Joystick_ApplyDeadzoneAndScale_6794D+42r ...
word_72E9E	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A1Cr
					; Joystick_ApplyDeadzoneAndScaleB_679E2+42r ...
word_72EA0	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_67953r
					; Joystick_ApplyDeadzoneAndScale_6794D+Er	...
word_72EA2	dw 0			; DATA XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_679E8r
					; Joystick_ApplyDeadzoneAndScaleB_679E2:loc_679F0r	...
word_72EA4	dw 0			; DATA XREF: Joystick_ReadAndScaleAxes_67835:loc_6787Ar
					; Joystick_ReadAndScaleAxes_67835+83r ...
		align 10h
word_72EB0	dw 0			; DATA XREF: TextScrollDisplayB_UpdateObjectState_67F8A+35w
					; Cockpit_LoadAndInitFull_90D20+B00w
word_72EB2	dw 0			; DATA XREF: TextScrollDisplayB_UpdateObjectState_67F8A+3Bw
					; Cockpit_LoadAndInitFull_90D20+B07w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_72ECE	dw 0			; DATA XREF: TextScrollDisplayB_ConstructAndReset_67DF5+20w
word_72ED0	dw 0			; DATA XREF: TextScrollDisplayB_ConstructAndReset_67DF5+26w
word_72ED2	dw 0			; DATA XREF: TextScrollDisplayB_UpdateObjectState_67F8A+Er
					; TextScrollDisplayB_UpdateObjectStateB_67FF8:loc_67FFEr	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_72F54	dd 0			; DATA XREF: seg000:0637r seg000:064Aw ...
byte_72F58	db 0			; DATA XREF: Stdio_Putc+Bw
					; Stdio_Putc:loc_2353r ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
seg339		ends
