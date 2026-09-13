stub229		segment	para public 'CODE' use16
		assume cs:stub229
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AB20	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:07E6o
		dw 0			; memswap
		dd 1F30h		; fileoff
		dw 184h			; codesize
		dw 6			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_756D5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F30h, codesize=184h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6AB40	proc far		; DATA XREF: seg339:02F8o
		jmp	NotifiableRef_Destructor_756D5
VROOMM_StubThunk_6AB40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75612) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F30h, codesize=184h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6AB45	proc far		; CODE XREF: seg008:0950P seg008:0C2FP ...
		jmp	NotifiableRef_AttachTarget_75612
VROOMM_StubThunk_6AB45	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_755A0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F30h, codesize=184h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6AB4A	proc far		; CODE XREF: Goal_ExecuteAction_A8AC+2EAP
					; Goal_ExecuteAction_A8AC+3CFP ...
		jmp	PilotProfile_NamedPropertyNode_Construct_755A0
VROOMM_StubThunk_6AB4A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_756A4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F30h, codesize=184h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6AB4F	proc far		; CODE XREF: seg008:092BP seg008:0D52P ...
		jmp	NotifiableRef_SwapTarget_756A4
VROOMM_StubThunk_6AB4F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM redirigeant vers NotifiableRef_DetachTarget_75661 (ovr229, classe de
; reference notifiable). CONFIRME etre le mecanisme de 'notification de cible' appele dans
; AIEntity_MasterTick_5ACC, Entity_ProximityTest_ThreatGate_315B et probablement ailleurs dans
; le systeme IA - cette classe sert de wrapper de reference generique, pas exclusivement pour
; les noeuds MVRS.
; ==============================================================================================
VROOMM_StubThunk_6AB54	proc far		; CODE XREF: AI_ProximityGeometricWarning_315B+E9P AI_TriggerBehaviorUpdate+5EP ...
		jmp	NotifiableRef_DetachTarget_75661
VROOMM_StubThunk_6AB54	endp

stub229		ends
