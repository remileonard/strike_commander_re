seg040		segment	byte public 'CODE' use16
		assume cs:seg040
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — parcourt une liste (sub_5F6A9), notifie chaque élément actif (flag +0x52 bit0) via
; vtable[0x18] : notification en masse d'éléments actifs d'une liste (probable liste de
; triggers de mission).
; ==============================================================================================
WorldObjects_NotifyMissionTriggers	proc far		; CODE XREF: UIScreen_ApplyFormFields_500F6+AP
					; DATA XREF: seg216:01FEo

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_22F3E
; ���������������������������������������������������������������������������

loc_22F22:				; CODE XREF: WorldObjects_NotifyMissionTriggers+3Dj
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_22F3E
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_22F3E
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+18h]
		pop	cx

loc_22F3E:				; CODE XREF: WorldObjects_NotifyMissionTriggers+10j
					; WorldObjects_NotifyMissionTriggers+1Aj ...
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_22F22
		pop	di
		pop	si
		leave
		retf
WorldObjects_NotifyMissionTriggers	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,381L — vérifie de nombreux flags globaux d'état de mission (difficulté word_70466, flags
; byte_6E4B4/B8/70471/6E4CC), calcule la distance du joueur à un point de référence
; (sub_46889) vs seuil 0x400, déclenche sub_23C82(code 4) si conditions réunies : évaluateur
; de déclencheur d'événement scripté de mission (trigger de zone/proximité).
; ==============================================================================================
Mission_TriggerEvaluator	proc far		; CODE XREF: UIScreen_StateMachineMain_4FBF1+490P

var_10		= dword	ptr -10h
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte_6E1C0, 0
		mov	byte_6E1C1, 0
		cmp	byte_7236A, 0
		jz	short loc_22FD3
		cmp	word_70466, 1

loc_22F74:
		jbe	short loc_22FD3

loc_22F76:
		cmp	word_722E6, 0
		jz	short loc_22FD3
		mov	al, byte_6E4B4
		mov	ah, 0

loc_22F82:
		or	ax, ax
		jnz	short loc_22FD3

loc_22F86:
		mov	al, byte_6E4B8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22FD3
		mov	al, byte_70471
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22FD3
		mov	bx, word_722E6
		push	word ptr [bx+51h]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	Physics_ApplyGroundHeightConstraint
		add	sp, 6
		cmp	[bp+var_4], 400h
		jle	short loc_22FBB
		mov	ax, 1
		jmp	short loc_22FBD
; ���������������������������������������������������������������������������

loc_22FBB:				; CODE XREF: Mission_TriggerEvaluator+61j
		xor	ax, ax

loc_22FBD:				; CODE XREF: Mission_TriggerEvaluator+66j
		or	al, al
		jnz	short loc_22FC8
		cmp	byte_6E4CC, 0
		jz	short loc_22FD3

loc_22FC8:				; CODE XREF: Mission_TriggerEvaluator+6Cj
		push	4
		push	si
		call	Kneeboard_SelectByStateCode
		add	sp, 4

loc_22FD3:				; CODE XREF: Mission_TriggerEvaluator+1Aj
					; Mission_TriggerEvaluator:loc_22F74j	...
		mov	[bp+var_6], 0
		jmp	loc_2307A
; ���������������������������������������������������������������������������

loc_22FDB:				; CODE XREF: Mission_TriggerEvaluator+138j
		mov	bx, [bp+var_6]
		mov	di, [bx+0Eh]
		or	di, di
		jnz	short loc_22FE8
		jmp	loc_2307A
; ���������������������������������������������������������������������������

loc_22FE8:				; CODE XREF: Mission_TriggerEvaluator+90j
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jnz	short loc_22FF5
		jmp	loc_2307A
; ���������������������������������������������������������������������������

loc_22FF5:				; CODE XREF: Mission_TriggerEvaluator+9Dj
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2307A
		push	[bp+var_6]
		call	Kneeboard_EntryDestruct
		pop	cx
		cmp	[si+12h], di
		jnz	short loc_2307A
		cmp	word ptr [si+0Fh], 0
		jz	short loc_2305F
		mov	bx, [si+0Fh]
		cmp	byte ptr [bx+4], 7
		jz	short loc_2305F
		cmp	byte ptr [bx+4], 0Bh
		jz	short loc_2305F
		push	bx
		call	Kneeboard_RenderEntry
		pop	cx
		mov	bx, [si+0Fh]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_2305F
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		pop	cx
		or	al, al
		jz	short loc_2305F
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+11h], al
		mov	[si+12h], di
		mov	word ptr [si+0Fh], 0
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		jmp	short loc_2307A
; ���������������������������������������������������������������������������

loc_2305F:				; CODE XREF: Mission_TriggerEvaluator+C2j
					; Mission_TriggerEvaluator+CBj ...
		push	4
		push	si
		call	Kneeboard_SelectByStateCode
		add	sp, 4
		or	al, al
		jz	short loc_23075

loc_2306E:
		mov	word ptr [si+0Fh], 0
		jmp	short loc_2307A
; ���������������������������������������������������������������������������

loc_23075:				; CODE XREF: Mission_TriggerEvaluator+119j
		mov	al, 0

loc_23077:
		jmp	loc_2322F
; ���������������������������������������������������������������������������

loc_2307A:				; CODE XREF: Mission_TriggerEvaluator+85j
					; Mission_TriggerEvaluator+92j ...
		lea	ax, [bp+var_6]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jz	short loc_2308E
		jmp	loc_22FDB
; ���������������������������������������������������������������������������

loc_2308E:				; CODE XREF: Mission_TriggerEvaluator+136j
		mov	al, byte_70471
		mov	ah, 0
		or	ax, ax
		jz	short loc_2309A
		jmp	loc_23172
; ���������������������������������������������������������������������������

loc_2309A:				; CODE XREF: Mission_TriggerEvaluator+142j
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, word_6E46F
		jz	short loc_230AC
		mov	al, byte_722D1
		mov	ah, 0
		jmp	short loc_230AE
; ���������������������������������������������������������������������������

loc_230AC:				; CODE XREF: Mission_TriggerEvaluator+150j
		xor	ax, ax

loc_230AE:				; CODE XREF: Mission_TriggerEvaluator+157j
		mov	[bp+var_7], al
		mov	ah, 0
		sub	ax, 3Bh	; ';'
		mov	bx, ax
		cmp	bx, 6		; switch 7 cases
		jbe	short loc_230C0
		jmp	loc_2315C	; default
; ���������������������������������������������������������������������������

loc_230C0:				; CODE XREF: Mission_TriggerEvaluator+168j
		shl	bx, 1
		jmp	cs:off_23233[bx] ; switch jump

loc_230C7:				; DATA XREF: seg040:off_23233o
		push	4		; case 0x0
		push	si
		call	Kneeboard_SelectByStateCode
		add	sp, 4
		jmp	loc_23172
; ���������������������������������������������������������������������������

loc_230D5:				; CODE XREF: Mission_TriggerEvaluator+16Fj
					; DATA XREF: seg040:off_23233o
		push	3		; case 0x1
		push	si
		call	Kneeboard_SelectByStateCode
		add	sp, 4
		or	al, al
		jnz	short loc_230E7
		jmp	loc_23172
; ���������������������������������������������������������������������������

loc_230E7:				; CODE XREF: Mission_TriggerEvaluator+18Fj
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aChasePlane ; "Chase Plane"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	short loc_23172
; ���������������������������������������������������������������������������

loc_23104:				; CODE XREF: Mission_TriggerEvaluator+16Fj
					; DATA XREF: seg040:off_23233o
		push	8		; case 0x5
		push	si
		call	Kneeboard_SelectByStateCode
		add	sp, 4
		or	al, al
		jz	short loc_23172
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aExternalView ; "External View"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	short loc_23172
; ���������������������������������������������������������������������������

loc_23130:				; CODE XREF: Mission_TriggerEvaluator+16Fj
					; DATA XREF: seg040:off_23233o
		push	9		; case 0x6
		push	si
		call	Kneeboard_SelectByStateCode
		add	sp, 4
		or	al, al
		jz	short loc_23172
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aTargetView ; "Target View"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	short loc_23172
; ���������������������������������������������������������������������������

loc_2315C:				; CODE XREF: Mission_TriggerEvaluator+16Aj
					; Mission_TriggerEvaluator+16Fj
					; DATA XREF: ...
		cmp	byte ptr [si+11h], 4 ; default
		jz	short loc_23172
		mov	al, [bp+var_7]
		push	ax
		push	word_6E4B2
		call	Radar_SelectEntryByKey

loc_2316F:
		add	sp, 4

loc_23172:				; CODE XREF: Mission_TriggerEvaluator+144j
					; Mission_TriggerEvaluator+17Fj ...
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, word_6E46F
		jz	short loc_23184
		mov	al, byte_722D1
		mov	ah, 0
		jmp	short loc_23186
; ���������������������������������������������������������������������������

loc_23184:				; CODE XREF: Mission_TriggerEvaluator+228j
		xor	ax, ax

loc_23186:				; CODE XREF: Mission_TriggerEvaluator+22Fj
		cmp	ax, 43h	; 'C'
		jz	short loc_23193
		cmp	ax, 44h	; 'D'
		jz	short loc_231E1
		jmp	loc_2322D
; ���������������������������������������������������������������������������

loc_23193:				; CODE XREF: Mission_TriggerEvaluator+236j
		mov	al, [si+15h]
		xor	al, 1
		mov	[si+15h], al
		mov	al, [si+15h]
		mov	byte_72368, al
		cmp	byte ptr [si+15h], 0
		jz	short loc_231C4
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aVictimViewOn ; "Victim View ON"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	short loc_2322D
; ���������������������������������������������������������������������������

loc_231C4:				; CODE XREF: Mission_TriggerEvaluator+252j
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aVictimViewOff ;	"Victim	View OFF"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	short loc_2322D
; ���������������������������������������������������������������������������

loc_231E1:				; CODE XREF: Mission_TriggerEvaluator+23Bj
		mov	al, [si+16h]
		xor	al, 1
		mov	[si+16h], al
		mov	al, [si+16h]
		mov	byte_72367, al
		cmp	byte ptr [si+16h], 0
		jz	short loc_23212
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aWeaponCameraOn ; "Weapon Camera	ON"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	short loc_2322D
; ���������������������������������������������������������������������������

loc_23212:				; CODE XREF: Mission_TriggerEvaluator+2A0j
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aWeaponCameraOf ; "Weapon Camera	OFF"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch

loc_2322D:				; CODE XREF: Mission_TriggerEvaluator+23Dj
					; Mission_TriggerEvaluator+26Fj ...
		mov	al, 1

loc_2322F:				; CODE XREF: Mission_TriggerEvaluator:loc_23077j
		pop	di
		pop	si
		leave
		retf
Mission_TriggerEvaluator	endp

; ���������������������������������������������������������������������������
off_23233	dw offset loc_230C7	; DATA XREF: Mission_TriggerEvaluator+16Fr
		dw offset loc_230D5	; jump table for switch	statement
		dw offset loc_2315C
		dw offset loc_2315C
		dw offset loc_2315C
		dw offset loc_23104
		dw offset loc_23130

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,106L — compare le type de deux objets (vtable[0x38]) et un flag d'état (+0x15/+0x?),
; utilisé pour filtrer les entrées radar valides : filtre de compatibilité cible pour
; sélection radar/verrouillage.
; ==============================================================================================
Radar_TargetTypeFilter	proc far		; CODE XREF: UIScreen_SetWidgetValue_50654+CP

var_10		= dword	ptr -10h
var_8		= word ptr -8
var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_2325F
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_2], ax
		jmp	short loc_23264
; ���������������������������������������������������������������������������

loc_2325F:				; CODE XREF: Radar_TargetTypeFilter+10j
		mov	[bp+var_2], 0

loc_23264:				; CODE XREF: Radar_TargetTypeFilter+1Cj
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_4], ax

loc_23273:
		cmp	byte ptr [si+15h], 0
		jnz	short loc_2327C
		jmp	loc_23307
; ���������������������������������������������������������������������������

loc_2327C:				; CODE XREF: Radar_TargetTypeFilter+36j
		cmp	[bp+var_2], 0
		jnz	short loc_23285

loc_23282:
		jmp	loc_23307
; ���������������������������������������������������������������������������

loc_23285:				; CODE XREF: Radar_TargetTypeFilter+3Fj
		cmp	[bp+arg_2], 0
		jz	short loc_23307
		cmp	byte ptr [si+11h], 7
		jz	short loc_23307
		cmp	byte ptr [si+11h], 0Bh
		jz	short loc_23307
		mov	ax, [bp+var_2]
		cmp	ax, word_722E6
		jnz	short loc_23307
		cmp	di, word_722E6
		jz	short loc_23307
		mov	ax, [bp+var_4]
		cmp	ax, word_722E6
		jz	short loc_23307
		cmp	byte ptr [si+11h], 7
		jz	short loc_23307
		mov	al, [si+11h]
		mov	[bp+var_6], al
		push	7
		push	si
		call	Kneeboard_RenderByCode
		add	sp, 4
		mov	[bp+var_8], ax
		mov	al, [bp+var_6]
		push	ax
		push	di
		push	[bp+arg_2]
		push	[bp+var_8]
		call	VROOMM_StubThunk_6AFDD
		add	sp, 8
		push	[bp+var_8]
		push	si
		call	Kneeboard_ApplySelection
		add	sp, 4
		or	al, al
		jz	short loc_23307
		sub	sp, 4
		mov	[bp+var_10], 200h
		push	ds
		push	offset aVictimCamera ; "Victim Camera"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch

loc_23307:				; CODE XREF: Radar_TargetTypeFilter+38j
					; Radar_TargetTypeFilter:loc_23282j	...
		pop	di
		pop	si
		leave
		retf
Radar_TargetTypeFilter	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,127L — ne s'active que si arg_2 est le joueur (word_722E6), exclut les états spéciaux
; (+0x11 == 0xB ou 7, probable détruit/hors-jeu) : handler d'événement de mission conditionné
; à une action du joueur (probable comptage de kill/objectif).
; ==============================================================================================
Mission_PlayerEventHandler	proc far		; CODE XREF: HUD_RenderSymbologyMain+780P
					; HUD_RenderSymbologyMain+B29P ...

var_3E		= dword	ptr -3Eh
var_36		= word ptr -36h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jnz	short loc_2331F
		jmp	loc_233EE
; ���������������������������������������������������������������������������

loc_2331F:				; CODE XREF: Mission_PlayerEventHandler+Fj
		mov	ax, [bp+arg_2]
		cmp	ax, word_722E6
		jz	short loc_2332B
		jmp	loc_233EE
; ���������������������������������������������������������������������������

loc_2332B:				; CODE XREF: Mission_PlayerEventHandler+1Bj
		push	[bp+arg_4]
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp+var_2], al
		cmp	byte ptr [si+11h], 0Bh
		jnz	short loc_23343
		jmp	loc_233EE
; ���������������������������������������������������������������������������

loc_23343:				; CODE XREF: Mission_PlayerEventHandler+33j
		cmp	byte ptr [si+11h], 7
		jnz	short loc_2334C
		jmp	loc_233EE
; ���������������������������������������������������������������������������

loc_2334C:				; CODE XREF: Mission_PlayerEventHandler+3Cj
		cmp	[bp+var_2], 9
		jz	short loc_2335B
		cmp	[bp+var_2], 8
		jz	short loc_2335B
		jmp	loc_233EE
; ���������������������������������������������������������������������������

loc_2335B:				; CODE XREF: Mission_PlayerEventHandler+45j
					; Mission_PlayerEventHandler+4Bj
		mov	al, [si+11h]
		mov	[bp+var_4], al
		mov	di, [si+12h]
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_12], eax
		mov	eax, [di+4]

loc_23372:
		mov	[bp+var_E], eax

loc_23376:
		mov	eax, [di+8]

loc_2337A:
		mov	[bp+var_A], eax
		mov	ax, [si+12h]
		add	ax, 20h	; ' '
		mov	[bp+var_6], ax
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		cmp	byte ptr [si+11h], 0Bh
		jz	short loc_233EE
		push	0Bh
		push	si
		call	Kneeboard_RenderByCode
		add	sp, 4
		mov	di, ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		mov	al, [bp+var_4]
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	di
		call	VROOMM_StubThunk_6AF85
		add	sp, 0Eh
		push	di
		push	si
		call	Kneeboard_ApplySelection
		add	sp, 4
		or	al, al
		jz	short loc_233EE
		sub	sp, 4
		mov	[bp+var_3E], 200h
		push	ds
		push	offset aWeaponCamera ; "Weapon Camera"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch

loc_233EE:				; CODE XREF: Mission_PlayerEventHandler+11j
					; Mission_PlayerEventHandler+1Dj ...
		pop	di
		pop	si
		leave
		retf
Mission_PlayerEventHandler	endp

; ���������������������������������������������������������������������������

loc_233F2:				; DATA XREF: seg339:4DB6o
		push	bp
		mov	bp, sp
		push	5166h
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word_72246, 0
		mov	word_72248, 0
		mov	byte_72253, 0
		pop	bp

locret_23410:
		retf
; ���������������������������������������������������������������������������

loc_23411:				; DATA XREF: seg339:4ED6o
		push	bp
		mov	bp, sp
		push	5196h
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	bp
		retf
seg040		ends
