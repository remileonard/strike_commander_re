seg156		segment	byte public 'CODE' use16
		assume cs:seg156
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_3E2E8:				; DATA XREF: Keyboard_InitSystem_3E458+21o
		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	dx, [bp+6]
		mov	byte_47A62, dl
		mov	ax, seg	seg165
		mov	es, ax
		assume es:seg165
		mov	al, es:byte_3F9DE
		mov	byte_47A63, al
		mov	ax, dx
		and	ax, 0FF7Fh
		mov	[bp-2],	ax
		mov	byte ptr [bp-8], 1
		mov	byte ptr [bp-6], 1
		test	dx, 80h
		jz	short loc_3E321
		mov	byte ptr [bp-6], 2
		mov	byte ptr [bp-8], 0
		jmp	short loc_3E32F
; ���������������������������������������������������������������������������

loc_3E321:				; CODE XREF: seg156:0035j
		mov	bx, [bp-2]
		cmp	byte ptr [bx+66F8h], 1
		jnz	short loc_3E32F
		mov	byte ptr [bp-6], 4

loc_3E32F:				; CODE XREF: seg156:003Fj seg156:0049j
		mov	al, [bp-6]
		mov	ah, 0
		test	word_47A8C, ax
		jnz	short loc_3E33D
		jmp	loc_3E3BE
; ���������������������������������������������������������������������������

loc_3E33D:				; CODE XREF: seg156:0058j
		cmp	word ptr [bp-2], 2Ah ; '*'
		jnz	short loc_3E351
		mov	ax, seg	seg165
		mov	es, ax
		mov	al, es:byte_3F9DE
		cbw
		or	ax, ax
		jnz	short loc_3E3BE

loc_3E351:				; CODE XREF: seg156:0061j
		mov	al, [bp-2]
		mov	[bp-5],	al
		mov	ax, seg	seg165
		mov	es, ax
		cmp	es:byte_3F9DE, 0
		jz	short loc_3E369
		mov	ax, 1
		jmp	short loc_3E36B
; ���������������������������������������������������������������������������

loc_3E369:				; CODE XREF: seg156:0082j
		xor	ax, ax

loc_3E36B:				; CODE XREF: seg156:0087j
		mov	[bp-4],	al
		mov	byte ptr [bp-3], 0
		cmp	byte_49750, 0
		jz	short loc_3E37D
		or	byte ptr [bp-3], 80h

loc_3E37D:				; CODE XREF: seg156:0097j
		cmp	byte_49771, 0
		jz	short loc_3E388
		or	byte ptr [bp-3], 40h

loc_3E388:				; CODE XREF: seg156:00A2j
		cmp	byte_49735, 0
		jz	short loc_3E393
		or	byte ptr [bp-3], 20h

loc_3E393:				; CODE XREF: seg156:00ADj
		cmp	byte_4976D, 0
		jz	short loc_3E39E
		or	byte ptr [bp-3], 10h

loc_3E39E:				; CODE XREF: seg156:00B8j
		cmp	byte_49742, 0
		jz	short loc_3E3A9
		or	byte ptr [bp-3], 8

loc_3E3A9:				; CODE XREF: seg156:00C3j
		cmp	byte_4974E, 0
		jz	short loc_3E3B4
		or	byte ptr [bp-3], 4

loc_3E3B4:				; CODE XREF: seg156:00CEj
		lea	ax, [bp-6]
		push	ax
		nop
		push	cs
		call	near ptr Keyboard_PushEventToQueue_3E4C1
		pop	cx

loc_3E3BE:				; CODE XREF: seg156:005Aj seg156:006Fj
		cmp	word ptr [bp-2], 2Ah ; '*'
		jnz	short loc_3E3D2
		mov	ax, seg	seg165
		mov	es, ax
		mov	al, es:byte_3F9DE
		cbw
		or	ax, ax
		jnz	short locret_3E3DC

loc_3E3D2:				; CODE XREF: seg156:00E2j
		mov	bx, [bp-2]
		mov	al, [bp-8]
		mov	[bx+66F8h], al

locret_3E3DC:				; CODE XREF: seg156:00F0j
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_RegisterOrInitHandlerTable_66BBA (sub_66BBA de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658) et initialise
; la table de gestionnaires par scan-code (sub_66F09, Keyboard_ClearHandlerTable_66C1E,
; Keyboard_InitSystem_66C34).
; ==============================================================================================
Keyboard_RegisterOrInitHandlerTable_3E3DE	proc far		; CODE XREF: sub_5E851+63P

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3E3F7
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3E413

loc_3E3F7:				; CODE XREF: Keyboard_RegisterOrInitHandlerTable_3E3DE+9j
		push	si
		call	Keyboard_AllocateHandlerMask_3E72D
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_3E442
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Keyboard_InitSystem_3E458
		add	sp, 8

loc_3E413:				; CODE XREF: Keyboard_RegisterOrInitHandlerTable_3E3DE+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_RegisterOrInitHandlerTable_3E3DE	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_3E431
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3E43D

loc_3E431:				; CODE XREF: seg156:0141j
		push	si
		call	Keyboard_AllocateHandlerMask_3E72D
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_3E442

loc_3E43D:				; CODE XREF: seg156:014Fj
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ClearHandlerTable_66C1E (sub_66C1E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; réinitialise la table de gestionnaires par scan-code (256 octets à 0x670000, tag 5D18h) via
; sub_22E1.
; ==============================================================================================
Keyboard_ClearHandlerTable_3E442	proc far		; CODE XREF: Keyboard_RegisterOrInitHandlerTable_3E3DE+22p
					; seg156:015Ap
		push	bp
		mov	bp, sp
		push	large 670000h
		push	66F8h
		call	CRT_Memset_Public
		add	sp, 6
		pop	bp
		retf
Keyboard_ClearHandlerTable_3E442	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_InitSystem_66C34 (sub_66C34 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — ⭐ far, initialisation du système clavier : configure le
; pointeur (dword_71176) et la capacité (word_7117A) de la file d'événements circulaire, puis
; installe Keyboard_ProcessScanCode_66AC4 comme gestionnaire pour les 255 scan-codes possibles
; (sub_66F61).
; ==============================================================================================
Keyboard_InitSystem_3E458	proc far		; CODE XREF: Keyboard_RegisterOrInitHandlerTable_3E3DE+2Fp

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_3E484
		mov	eax, [bp+arg_2]
		mov	dword_47A64, eax
		mov	ax, [bp+arg_6]
		mov	word_47A68, ax
		push	0FFh
		push	seg seg156
		push	offset loc_3E2E8
		call	Keyboard_ConfigureHandlerMask_3E785
		add	sp, 6

loc_3E484:				; CODE XREF: Keyboard_InitSystem_3E458+Bj
		pop	bp
		retf
Keyboard_InitSystem_3E458	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_UnregisterHandlerTable_66C62 (sub_66C62 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_66F61, sub_66F34 et libère
; l'objet (sub_338) — pendant destructeur de Keyboard_RegisterOrInitHandlerTable_66BBA.
; ==============================================================================================
Keyboard_UnregisterHandlerTable_3E486	proc far		; CODE XREF: sub_5E9CD+80P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3E4BD
		push	large 0FF0000h
		push	0
		call	Keyboard_ConfigureHandlerMask_3E785
		add	sp, 6
		push	0
		push	si
		call	sub_3E758
		add	sp, 4
		test	di, 1
		jz	short loc_3E4BD
		push	si
		call	sub_308
		pop	cx

loc_3E4BD:				; CODE XREF: Keyboard_UnregisterHandlerTable_3E486+Dj
					; Keyboard_UnregisterHandlerTable_3E486+2Ej
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_UnregisterHandlerTable_3E486	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_PushEventToQueue_66C9D (sub_66C9D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⭐ far, pousse un événement clavier dans une file
; circulaire : vérifie que la file n'est pas pleine (byte_7117E vs word_7117A), écrit
; l'événement (4 octets) à l'index courant (byte_7117D, via dword_71176), incrémente les
; compteurs avec retour à zéro circulaire. Appelée par Keyboard_ProcessScanCode_66AC4 — cœur
; du tampon d'événements clavier. CONFIRMÉ par le seg339 : message « keyboard stack overflow »
; — la file circulaire dispose bien d'une détection de dépassement documentée par une chaîne
; de debug dédiée.
; ==============================================================================================
Keyboard_PushEventToQueue_3E4C1	proc far		; CODE XREF: seg156:00DAp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, byte_47A6C
		mov	ah, 0
		cmp	ax, word_47A68
		jnb	short loc_3E513
		mov	al, [di]
		mov	ah, 0
		test	word_47A8C, ax
		jz	short loc_3E513
		mov	al, byte_47A6C
		inc	al
		mov	byte_47A6C, al
		mov	al, byte_47A6B
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_47A64
		assume es:nothing
		add	bx, ax
		mov	eax, [di]
		mov	es:[bx], eax
		inc	byte_47A6B
		mov	al, byte_47A6B
		mov	ah, 0
		cmp	ax, word_47A68
		jb	short loc_3E50F
		mov	byte_47A6B, 0

loc_3E50F:				; CODE XREF: Keyboard_PushEventToQueue_3E4C1+47j
		mov	al, 1
		jmp	short loc_3E515
; ���������������������������������������������������������������������������

loc_3E513:				; CODE XREF: Keyboard_PushEventToQueue_3E4C1+11j
					; Keyboard_PushEventToQueue_3E4C1+1Bj
		mov	al, 0

loc_3E515:				; CODE XREF: Keyboard_PushEventToQueue_3E4C1+50j
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_PushEventToQueue_3E4C1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_PeekOrPopEvent_66CF5 (sub_66CF5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 40 lignes, NON DÉTAILLÉE — probable
; lecture (pop) d'un événement depuis la file circulaire (pendant lecture de
; Keyboard_PushEventToQueue_66C9D).
; ==============================================================================================
Keyboard_PeekOrPopEvent_3E519	proc far		; CODE XREF: Keyboard_QueryHandlerTable_3E55D+6p
		push	bp
		mov	bp, sp
		cmp	byte_47A6C, 0
		jz	short loc_3E559
		mov	al, byte_47A6C
		add	al, 0FFh
		mov	byte_47A6C, al
		mov	al, byte_47A6A
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_47A64
		add	bx, ax
		mov	eax, es:[bx]
		mov	dword_4977F, eax
		inc	byte_47A6A
		mov	al, byte_47A6A
		mov	ah, 0
		cmp	ax, word_47A68
		jb	short loc_3E555
		mov	byte_47A6A, 0

loc_3E555:				; CODE XREF: Keyboard_PeekOrPopEvent_3E519+35j
		mov	al, 1
		jmp	short loc_3E55B
; ���������������������������������������������������������������������������

loc_3E559:				; CODE XREF: Keyboard_PeekOrPopEvent_3E519+8j
		mov	al, 0

loc_3E55B:				; CODE XREF: Keyboard_PeekOrPopEvent_3E519+3Ej
		pop	bp
		retf
Keyboard_PeekOrPopEvent_3E519	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_QueryHandlerTable_66D39 (sub_66D39 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 50 lignes, NON DÉTAILLÉE — combine Keyboard_PeekOrPopEvent_66CF5 et sub_22E1.
; ==============================================================================================
Keyboard_QueryHandlerTable_3E55D	proc far		; CODE XREF: Keyboard_Method_ReturnTypeTag_3E591+Bp seg156:02E1p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		jmp	short loc_3E574
; ���������������������������������������������������������������������������

loc_3E562:				; CODE XREF: Keyboard_QueryHandlerTable_3E55D+2Dj
		push	cs
		call	near ptr Keyboard_PeekOrPopEvent_3E519
		or	al, al
		jz	short loc_3E574
		mov	al, byte ptr dword_4977F
		mov	ah, 0
		test	[bp+arg_0], ax
		jnz	short loc_3E58C

loc_3E574:				; CODE XREF: Keyboard_QueryHandlerTable_3E55D+3j Keyboard_QueryHandlerTable_3E55D+Bj
		push	large 40000h
		push	675Fh
		call	CRT_Memset_Public
		add	sp, 6
		cmp	byte_47A6C, 0
		jnz	short loc_3E562

loc_3E58C:				; CODE XREF: Keyboard_QueryHandlerTable_3E55D+15j
		mov	ax, 675Fh
		pop	bp
		retf
Keyboard_QueryHandlerTable_3E55D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_Method_ReturnTypeTag_66D6D (sub_66D6D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, stub retournant une constante de type
; (5D7Fh).
; ==============================================================================================
Keyboard_Method_ReturnTypeTag_3E591	proc far		; CODE XREF: Keyboard_QueryAndDispatch_3E5C7+Fp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_3E55D
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		mov	[si], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_Method_ReturnTypeTag_3E591	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, 675Fh
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		call	sub_3E718
		push	word ptr [bp+6]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_3E55D
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_QueryAndDispatch_66DA3 (sub_66DA3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_66EF4 et
; Keyboard_Method_ReturnTypeTag... (Keyboard_QueryHandlerTable-related, sub_66D6D) — accesseur
; final du cluster clavier de ce segment.
; ==============================================================================================
Keyboard_QueryAndDispatch_3E5C7	proc far		; CODE XREF: sub_6994+14P sub_6BFB+57P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		call	sub_3E718
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr Keyboard_Method_ReturnTypeTag_3E591
		add	sp, 4
		pop	bp
		retf
Keyboard_QueryAndDispatch_3E5C7	endp

seg156		ends
