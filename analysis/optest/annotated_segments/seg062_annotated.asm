seg062		segment	byte public 'CODE' use16
		assume cs:seg062
		;org 5
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp

loc_28B78:				; DATA XREF: seg170:02B6o
		cmp	byte_495F5, 0
		jz	short loc_28B92
		cmp	word_4684F, 0
		jz	short loc_28B92
		push	word_4684F
		call	sub_4235E
		add	sp, 2

loc_28B92:				; CODE XREF: seg062:000Dj seg062:0014j
		cmp	byte_495F6, 0
		jz	short loc_28BAC
		cmp	word_4684D, 0
		jz	short loc_28BAC
		push	word_4684D
		call	sub_4230A
		add	sp, 2

loc_28BAC:				; CODE XREF: seg062:0027j seg062:002Ej
		cmp	byte_495F7, 0
		jz	short loc_28BC6
		cmp	word_46851, 0
		jz	short loc_28BC6
		push	word_46851
		call	sub_42F3F
		add	sp, 2

loc_28BC6:				; CODE XREF: seg062:0041j seg062:0048j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	byte_495F6, 0
		jz	short loc_28BF0
		cmp	word_4684D, 0
		jz	short loc_28BF0
		push	word ptr [bp+0Ch]
		push	large dword ptr	[bp+8]
		mov	al, [bp+6]
		push	ax
		push	word_4684D
		call	sub_8609
		add	sp, 0Ah

loc_28BF0:				; CODE XREF: seg062:0060j seg062:0067j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ch]
		cmp	byte_495F6, 0
		jz	short loc_28C4A
		cmp	word_4684D, 0
		jz	short loc_28C4A
		push	si
		mov	al, [bp+6]
		push	ax
		push	word_4684D
		call	sub_8822
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_28C35
		push	si
		push	large dword ptr	[bp+8]
		mov	al, [bp+6]
		push	ax
		push	word_4684D
		call	sub_8609
		add	sp, 0Ah
		jmp	short loc_28C4A
; ���������������������������������������������������������������������������

loc_28C35:				; CODE XREF: seg062:00ACj
		push	si
		push	large dword ptr	[bp+8]
		mov	al, [bp+6]
		push	ax
		push	word_4684D
		call	sub_8705
		add	sp, 0Ah

loc_28C4A:				; CODE XREF: seg062:008Ej seg062:0095j ...
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	byte_495F6, 0
		jz	short loc_28C71
		cmp	word_4684D, 0
		jz	short loc_28C71
		push	word ptr [bp+8]
		mov	al, [bp+6]
		push	ax
		push	word_4684D
		call	sub_87CD
		add	sp, 6

loc_28C71:				; CODE XREF: seg062:00E5j seg062:00ECj
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Si la musique est active : humeur musicale du déroulement word_4458B =
; arg si arg < word_4457E ; sinon erreur « Invalid tune requested » (sauf FFh). Commandes 18h
; et 24h (8).
; ==============================================================================================
Music_SetGameflowMood_28C73	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+2E4P
					; Gameflow_RunScriptPairs_36CF+38DP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cmp	byte_495F5, 0
		jz	short loc_28CA8
		cmp	word_4684F, 0
		jz	short loc_28CA8
		mov	si, [bp+arg_0]
		cmp	si, word_4457E
		jge	short loc_28C94
		mov	word_4458B, si
		jmp	short loc_28CA8
; ���������������������������������������������������������������������������

loc_28C94:				; CODE XREF: Music_SetGameflowMood_28C73+19j
		cmp	si, 0FFh
		jz	short loc_28CA8
		push	si
		push	3834h
		call	Fatal_Error_310B
		add	sp, 4
		jmp	short $+2

loc_28CA8:				; CODE XREF: Music_SetGameflowMood_28C73+9j
					; Music_SetGameflowMood_28C73+10j ...
		pop	si
		pop	bp
		retf
Music_SetGameflowMood_28C73	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_28CAB	proc far		; CODE XREF: sub_5E1A1:loc_5E238P
		push	bp
		mov	bp, sp
		cmp	word_4684F, 0
		jz	short loc_28CC1
		push	word_4684F
		call	sub_42372
		add	sp, 2

loc_28CC1:				; CODE XREF: sub_28CAB+8j
		pop	bp
		retf
sub_28CAB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_28CC3	proc far		; CODE XREF: sub_5E1A1+61AP
		push	bp
		mov	bp, sp
		cmp	word_4684F, 0
		jz	short loc_28CD9
		push	word_4684F
		call	sub_42377
		add	sp, 2

loc_28CD9:				; CODE XREF: sub_28CC3+8j
		pop	bp
		retf
sub_28CC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Music_Stop_5A9E6
; (sub_5A9E6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'Widget_Helper_5A9E6'. far. LUE 2026-10-06. Facade (appelee par
; STRIKE_EXE_MAIN_LOOP) : Music_StopWithFade_AB1EF(fondu = argument).
; ==============================================================================================
Music_Stop_28CDB	proc far		; CODE XREF: seg063:0309P Gameflow_PlayMidgame_4ABE0+9P

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	word_4684F, 0
		jz	short loc_28CF5
		mov	al, [bp+arg_0]
		push	ax
		push	word_4684F
		call	sub_4237C
		add	sp, 4

loc_28CF5:				; CODE XREF: Music_Stop_28CDB+8j
		pop	bp
		retf
Music_Stop_28CDB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_28CF7	proc far		; CODE XREF: seg063:05E3P
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_28CF7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Si la musique est active : joue le morceau arg de SOUND\gameflow.dat
; (sub_42363 → sub_5EEE6). Commande 26h.
; ==============================================================================================
Music_PlayGameflowTune_28CFC	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+3CFP
					; Gameflow_LoadGameFile_4DF4B+30DP

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_495F5, 0
		jz	short loc_28D22
		cmp	word_4684F, 0
		jz	short loc_28D22
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		push	3850h
		push	word_4684F
		call	sub_42363
		add	sp, 6

loc_28D22:				; CODE XREF: Music_PlayGameflowTune_28CFC+8j Music_PlayGameflowTune_28CFC+Fj
		pop	bp
		retf
Music_PlayGameflowTune_28CFC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Speech_LoadBank_5AAB2
; (sub_5AAB2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'Widget_Helper_5AAB2'. far. LUE 2026-10-06. Facade voix (byte_7236D, objet
; word_7099F) appelee par PilotProfile_LoadRADI_8DF49 :
; AudioQueue_LoadFromMultipleReaders_AB9D7.
; ==============================================================================================
Speech_LoadBank_28D24	proc far		; CODE XREF: sub_137FA+73P
					; sub_4E660+8CP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_495F5, 0
		jz	short loc_28D47
		cmp	word_4684F, 0
		jz	short loc_28D47
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_4684F
		call	sub_8EAD
		add	sp, 6

loc_28D47:				; CODE XREF: Speech_LoadBank_28D24+8j Speech_LoadBank_28D24+Fj
		pop	bp
		retf
Speech_LoadBank_28D24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_28D49	proc far		; CODE XREF: sub_137FA+115P
					; sub_4E660+99CP ...
		push	bp
		mov	bp, sp
		cmp	byte_495F5, 0
		jz	short loc_28D66
		cmp	word_4684F, 0
		jz	short loc_28D66
		push	word_4684F
		call	sub_9128
		add	sp, 2

loc_28D66:				; CODE XREF: sub_28D49+8j sub_28D49+Fj
		pop	bp
		retf
sub_28D49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_28D68	proc far		; CODE XREF: Gameflow_MainMenu_4F1A7:loc_4FDF3P

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		cmp	byte_495F5, 0
		jz	short loc_28D8F
		cmp	word_4684F, 0
		jz	short loc_28D8F
		push	word_4684F
		call	sub_921A
		add	sp, 2
		mov	[bp+var_1], al

loc_28D8F:				; CODE XREF: sub_28D68+Fj
					; sub_28D68+16j
		mov	al, [bp+var_1]
		leave
		retf
sub_28D68	endp

; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	byte_495F6, 0
		jz	short loc_28DB8
		cmp	word_4684D, 0
		jz	short loc_28DB8
		mov	byte_495F6, 0
		push	word_4684D
		call	sub_42319
		add	sp, 2

loc_28DB8:				; CODE XREF: seg062:022Ej seg062:0235j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	byte_495F6, 0
		jz	short loc_28DD7
		cmp	word_4684D, 0
		jz	short loc_28DD7
		push	word_4684D
		call	sub_42319
		add	sp, 2

loc_28DD7:				; CODE XREF: seg062:0252j seg062:0259j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	byte_495F7, 0
		jz	short loc_28DFC
		cmp	word_46851, 0
		jz	short loc_28DFC
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word_46851
		call	sub_42F44
		add	sp, 6

loc_28DFC:				; CODE XREF: seg062:0271j seg062:0278j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	byte ptr [bp-1], 0
		cmp	byte_495F7, 0
		jz	short loc_28E32
		cmp	word_46851, 0
		jz	short loc_28E32
		mov	al, [bp+0Ch]
		push	ax
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word_46851
		call	sub_29C6B
		add	sp, 0Ah
		mov	[bp-1],	al

loc_28E32:				; CODE XREF: seg062:029Dj seg062:02A4j
		mov	al, [bp-1]
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	byte_495F7, 0
		jz	short locret_28E5D
		cmp	word_46851, 0
		jz	short locret_28E5D
		mov	ax, [bp+6]
		mov	[bp-2],	ax
		mov	bx, word_46851
		mov	ax, [bp-2]
		mov	[bx+49h], ax

locret_28E5D:				; CODE XREF: seg062:02D4j seg062:02DBj
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	byte ptr [bp-1], 0
		cmp	byte_495F7, 0
		jz	short loc_28E8A
		cmp	word_46851, 0
		jz	short loc_28E8A
		mov	al, [bp+6]
		push	ax
		push	word_46851
		call	sub_29E4F
		add	sp, 4
		mov	[bp-1],	al

loc_28E8A:				; CODE XREF: seg062:02FEj seg062:0305j
		mov	al, [bp-1]
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	word_46851, 0
		jz	short loc_28EB9
		mov	bx, word_46851
		cmp	word ptr [bx+34h], 0
		jz	short loc_28EB9
		mov	bx, word_46851
		mov	bx, [bx+34h]
		push	word ptr [bx+4]
		call	sub_30BDC
		add	sp, 2
		jmp	short $+2

loc_28EB9:				; CODE XREF: seg062:0329j seg062:0333j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte_495F6, 0
		jz	short loc_28EDC
		cmp	word_4684D, 0
		jz	short loc_28EDC
		push	word_4684D
		call	sub_8A80
		add	sp, 2

loc_28EDC:				; CODE XREF: seg062:0357j seg062:035Ej
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_28EDF	proc far		; CODE XREF: seg062:05FCp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4684D, 0
		jz	short loc_28F45
		mov	bx, word_4684D
		mov	word ptr [bx], 3859h
		push	word_4684D
		call	sub_42314
		add	sp, 2
		push	seg seg062
		push	offset loc_29174
		push	1
		push	5
		push	11h
		mov	ax, word_4684D
		add	ax, 92h	; '�'
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	0Eh
		push	0Ah
		mov	ax, word_4684D
		add	ax, 6
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	word_4684D
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_28F45:				; CODE XREF: sub_28EDF+Cj
		mov	word_4684D, 0
		cmp	word_4684F, 0
		jz	short loc_28F74
		mov	bx, word_4684F
		mov	word ptr [bx], 13E1h
		push	word_4684F
		call	sub_4236D
		add	sp, 2
		push	word_4684F
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_28F74:				; CODE XREF: sub_28EDF+71j
		mov	word_4684F, 0
		cmp	word_46849, 0
		jnz	short loc_28F84
		jmp	loc_2905D
; ���������������������������������������������������������������������������

loc_28F84:				; CODE XREF: sub_28EDF+A0j
		mov	bx, word_46849
		mov	word ptr [bx], 13E5h
		push	word_46849
		call	sub_77FF
		add	sp, 2
		push	0
		mov	ax, word_46849
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	bx, word_46849
		cmp	byte ptr [bx+19h], 0
		jz	short loc_28FDC
		mov	bx, word_46849
		cmp	dword ptr [bx+14h], 0
		jz	short loc_28FDC
		push	0
		mov	bx, word_46849
		mov	al, [bx+18h]
		push	ax
		mov	ax, word_46849
		add	ax, 14h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_28FDC:				; CODE XREF: sub_28EDF+D2j
					; sub_28EDF+DDj
		mov	bx, word_46849
		mov	dword ptr [bx+14h], 0
		mov	bx, word_46849
		mov	byte ptr [bx+19h], 0
		mov	bx, word_46849
		mov	dword ptr [bx+1Ah], 0
		mov	bx, word_46849
		cmp	byte ptr [bx+0Fh], 0
		jz	short loc_2902F
		mov	bx, word_46849
		cmp	dword ptr [bx+0Ah], 0
		jz	short loc_2902F
		push	0
		mov	bx, word_46849
		mov	al, [bx+0Eh]
		push	ax
		mov	ax, word_46849
		add	ax, 0Ah
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2902F:				; CODE XREF: sub_28EDF+125j
					; sub_28EDF+130j
		mov	bx, word_46849
		mov	dword ptr [bx+0Ah], 0
		mov	bx, word_46849
		mov	byte ptr [bx+0Fh], 0
		mov	bx, word_46849
		mov	dword ptr [bx+10h], 0
		push	word_46849
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_2905D:				; CODE XREF: sub_28EDF+A2j
		mov	word_46849, 0
		cmp	word_4684B, 0
		jnz	short loc_2906D
		jmp	loc_29146
; ���������������������������������������������������������������������������

loc_2906D:				; CODE XREF: sub_28EDF+189j
		mov	bx, word_4684B
		mov	word ptr [bx], 13E5h
		push	word_4684B
		call	sub_77FF
		add	sp, 2
		push	0
		mov	ax, word_4684B
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	bx, word_4684B
		cmp	byte ptr [bx+19h], 0
		jz	short loc_290C5
		mov	bx, word_4684B
		cmp	dword ptr [bx+14h], 0
		jz	short loc_290C5
		push	0
		mov	bx, word_4684B
		mov	al, [bx+18h]
		push	ax
		mov	ax, word_4684B
		add	ax, 14h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_290C5:				; CODE XREF: sub_28EDF+1BBj
					; sub_28EDF+1C6j
		mov	bx, word_4684B
		mov	dword ptr [bx+14h], 0
		mov	bx, word_4684B
		mov	byte ptr [bx+19h], 0
		mov	bx, word_4684B
		mov	dword ptr [bx+1Ah], 0
		mov	bx, word_4684B
		cmp	byte ptr [bx+0Fh], 0
		jz	short loc_29118
		mov	bx, word_4684B
		cmp	dword ptr [bx+0Ah], 0
		jz	short loc_29118
		push	0
		mov	bx, word_4684B
		mov	al, [bx+0Eh]
		push	ax
		mov	ax, word_4684B
		add	ax, 0Ah
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29118:				; CODE XREF: sub_28EDF+20Ej
					; sub_28EDF+219j
		mov	bx, word_4684B
		mov	dword ptr [bx+0Ah], 0
		mov	bx, word_4684B
		mov	byte ptr [bx+0Fh], 0
		mov	bx, word_4684B
		mov	dword ptr [bx+10h], 0
		push	word_4684B
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_29146:				; CODE XREF: sub_28EDF+18Bj
		mov	word_4684B, 0
		pop	si
		pop	bp
		retf
sub_28EDF	endp

; ���������������������������������������������������������������������������

loc_2914F:				; DATA XREF: dseg:592Eo
		push	bp
		mov	bp, sp
		mov	word_46849, 0
		mov	word_4684B, 0
		mov	byte_46848, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29165:				; DATA XREF: dseg:59CAo
		push	bp
		mov	bp, sp
		push	6558h
		push	cs
		call	near ptr sub_28EDF
		add	sp, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29174:				; DATA XREF: sub_28EDF+25o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_291D9
		push	si
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [si+9], 0
		jz	short loc_291B2
		cmp	dword ptr [si+4], 0
		jz	short loc_291B2
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_291B2:				; CODE XREF: seg062:0620j seg062:0627j
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1
		jz	short loc_291D7
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_291D7:				; CODE XREF: seg062:065Aj
		jmp	short $+2

loc_291D9:				; CODE XREF: seg062:0611j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_291E1:				; DATA XREF: dseg:3859o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_42314
		add	sp, 2
		pop	si
		pop	bp
		retf
seg062		ends
