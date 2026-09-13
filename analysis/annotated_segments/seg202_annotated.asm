seg202		segment	byte public 'CODE' use16
		assume cs:seg202
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_66AC4:				; DATA XREF: Keyboard_InitSystem_66C34+21o
		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	dx, [bp+6]

loc_66ACD:				; DATA XREF: seg216:0716o
		mov	byte_71174, dl
		mov	ax, seg	seg211

loc_66AD4:
		mov	es, ax
		assume es:seg211
		mov	al, es:byte_681BA
		mov	byte_71175, al
		mov	ax, dx
		and	ax, 0FF7Fh

loc_66AE2:
		mov	[bp-2],	ax

loc_66AE5:
		mov	byte ptr [bp-8], 1
		mov	byte ptr [bp-6], 1

loc_66AED:
		test	dx, 80h
		jz	short loc_66AFD
		mov	byte ptr [bp-6], 2
		mov	byte ptr [bp-8], 0
		jmp	short loc_66B0B
; ���������������������������������������������������������������������������

loc_66AFD:				; CODE XREF: seg202:0031j
		mov	bx, [bp-2]

loc_66B00:
		cmp	byte ptr [bx+5D18h], 1
		jnz	short loc_66B0B

loc_66B07:
		mov	byte ptr [bp-6], 4

loc_66B0B:				; CODE XREF: seg202:003Bj seg202:0045j
		mov	al, [bp-6]
		mov	ah, 0

loc_66B10:
		test	word_7119E, ax
		jnz	short loc_66B19

loc_66B16:
		jmp	loc_66B9A
; ���������������������������������������������������������������������������

loc_66B19:				; CODE XREF: seg202:0054j
		cmp	word ptr [bp-2], 2Ah ; '*'
		jnz	short loc_66B2D
		mov	ax, seg	seg211

loc_66B22:
		mov	es, ax

loc_66B24:
		mov	al, es:byte_681BA

loc_66B28:
		cbw

loc_66B29:
		or	ax, ax
		jnz	short loc_66B9A

loc_66B2D:				; CODE XREF: seg202:005Dj
		mov	al, [bp-2]

loc_66B30:
		mov	[bp-5],	al
		mov	ax, seg	seg211

loc_66B36:
		mov	es, ax
		cmp	es:byte_681BA, 0
		jz	short loc_66B45
		mov	ax, 1

loc_66B43:
		jmp	short loc_66B47
; ���������������������������������������������������������������������������

loc_66B45:				; CODE XREF: seg202:007Ej
		xor	ax, ax

loc_66B47:				; CODE XREF: seg202:loc_66B43j
		mov	[bp-4],	al

loc_66B4A:
		mov	byte ptr [bp-3], 0
		cmp	byte_72E00, 0

loc_66B53:
		jz	short loc_66B59

loc_66B55:
		or	byte ptr [bp-3], 80h

loc_66B59:				; CODE XREF: seg202:loc_66B53j
		cmp	byte_72E21, 0

loc_66B5E:
		jz	short loc_66B64

loc_66B60:
		or	byte ptr [bp-3], 40h

loc_66B64:				; CODE XREF: seg202:loc_66B5Ej
		cmp	byte_72DE5, 0
		jz	short loc_66B6F
		or	byte ptr [bp-3], 20h

loc_66B6F:				; CODE XREF: seg202:00A9j
		cmp	byte_72E1D, 0
		jz	short loc_66B7A
		or	byte ptr [bp-3], 10h

loc_66B7A:				; CODE XREF: seg202:00B4j
		cmp	byte_72DF2, 0
		jz	short loc_66B85
		or	byte ptr [bp-3], 8

loc_66B85:				; CODE XREF: seg202:00BFj
		cmp	byte_72DFE, 0
		jz	short loc_66B90
		or	byte ptr [bp-3], 4

loc_66B90:				; CODE XREF: seg202:00CAj
		lea	ax, [bp-6]

loc_66B93:
		push	ax
		nop
		push	cs

loc_66B96:
		call	near ptr Keyboard_PushEventToQueue_66C9D
		pop	cx

loc_66B9A:				; CODE XREF: seg202:loc_66B16j
					; seg202:006Bj
		cmp	word ptr [bp-2], 2Ah ; '*'
		jnz	short loc_66BAE

loc_66BA0:
		mov	ax, seg	seg211

loc_66BA3:
		mov	es, ax

loc_66BA5:
		mov	al, es:byte_681BA

loc_66BA9:
		cbw
		or	ax, ax
		jnz	short locret_66BB8

loc_66BAE:				; CODE XREF: seg202:00DEj
		mov	bx, [bp-2]
		mov	al, [bp-8]

loc_66BB4:
		mov	[bx+5D18h], al

locret_66BB8:				; CODE XREF: seg202:00ECj
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) et initialise la table de gestionnaires par scan-code (sub_66F09,
; Keyboard_ClearHandlerTable_66C1E, Keyboard_InitSystem_66C34).
; ==============================================================================================
Keyboard_RegisterOrInitHandlerTable_66BBA	proc far		; CODE XREF: InputSystem_InitAll_8F47A+5BP

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66BD3
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66BEF

loc_66BD3:				; CODE XREF: Keyboard_RegisterOrInitHandlerTable_66BBA+9j
		push	si
		call	Keyboard_AllocateHandlerMask_66F09
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_66C1E
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Keyboard_InitSystem_66C34
		add	sp, 8

loc_66BEF:				; CODE XREF: Keyboard_RegisterOrInitHandlerTable_66BBA+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_RegisterOrInitHandlerTable_66BBA	endp

; ���������������������������������������������������������������������������
		push	bp

loc_66BF5:
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_66C0D
		push	1

loc_66C01:
		call	CRT_Malloc16_Retry
		pop	cx

loc_66C07:
		mov	si, ax
		or	ax, ax
		jz	short loc_66C19

loc_66C0D:				; CODE XREF: seg202:013Dj
		push	si

loc_66C0E:
		call	Keyboard_AllocateHandlerMask_66F09

loc_66C13:
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_66C1E

loc_66C19:				; CODE XREF: seg202:014Bj
		mov	ax, si
		pop	si
		pop	bp

locret_66C1D:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, réinitialise la table de gestionnaires par scan-code (256 octets à 0x670000, tag 5D18h)
; via sub_22E1.
; ==============================================================================================
Keyboard_ClearHandlerTable_66C1E	proc far		; CODE XREF: Keyboard_RegisterOrInitHandlerTable_66BBA+22p
					; seg202:0156p
		push	bp

loc_66C1F:
		mov	bp, sp

loc_66C21:
		push	large 670000h

loc_66C27:
		push	5D18h
		call	CRT_Memset_Public
		add	sp, 6
		pop	bp
		retf
Keyboard_ClearHandlerTable_66C1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, initialisation du système clavier : configure le pointeur (dword_71176) et la
; capacité (word_7117A) de la file d'événements circulaire, puis installe
; Keyboard_ProcessScanCode_66AC4 comme gestionnaire pour les 255 scan-codes possibles
; (sub_66F61).
; ==============================================================================================
Keyboard_InitSystem_66C34	proc far		; CODE XREF: Keyboard_RegisterOrInitHandlerTable_66BBA+2Fp

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_66C60
		mov	eax, [bp+arg_2]
		mov	dword_71176, eax

loc_66C49:
		mov	ax, [bp+arg_6]
		mov	word_7117A, ax
		push	0FFh

loc_66C52:
		push	seg seg202
		push	offset loc_66AC4

loc_66C58:
		call	Keyboard_ConfigureHandlerMask_66F61
		add	sp, 6

loc_66C60:				; CODE XREF: Keyboard_InitSystem_66C34+Bj
		pop	bp
		retf
Keyboard_InitSystem_66C34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_66F61, sub_66F34 et libère l'objet (sub_338) — pendant destructeur de
; Keyboard_RegisterOrInitHandlerTable_66BBA.
; ==============================================================================================
Keyboard_UnregisterHandlerTable_66C62	proc far		; CODE XREF: InputSystem_ReleaseAll_8F5E0+78P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_66C66:
		push	di

loc_66C67:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_66C99
		push	large 0FF0000h
		push	0
		call	Keyboard_ConfigureHandlerMask_66F61
		add	sp, 6
		push	0
		push	si
		call	Keyboard_ReleaseHandlerMaskIfSet_66F34
		add	sp, 4
		test	di, 1
		jz	short loc_66C99
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_66C99:				; CODE XREF: Keyboard_UnregisterHandlerTable_66C62+Dj
					; Keyboard_UnregisterHandlerTable_66C62+2Ej
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_UnregisterHandlerTable_66C62	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, pousse un événement clavier dans une file circulaire : vérifie que la file n'est pas
; pleine (byte_7117E vs word_7117A), écrit l'événement (4 octets) à l'index courant
; (byte_7117D, via dword_71176), incrémente les compteurs avec retour à zéro circulaire.
; Appelée par Keyboard_ProcessScanCode_66AC4 — cœur du tampon d'événements clavier. CONFIRMÉ
; par le seg339 : message « keyboard stack overflow » — la file circulaire dispose bien d'une
; détection de dépassement documentée par une chaîne de debug dédiée.
; ==============================================================================================
Keyboard_PushEventToQueue_66C9D	proc far		; CODE XREF: seg202:loc_66B96p

arg_0		= word ptr  6

		push	bp

loc_66C9E:
		mov	bp, sp
		push	si

loc_66CA1:
		push	di

loc_66CA2:
		mov	di, [bp+arg_0]
		mov	al, byte_7117E

loc_66CA8:
		mov	ah, 0
		cmp	ax, word_7117A
		jnb	short loc_66CEF
		mov	al, [di]
		mov	ah, 0
		test	word_7119E, ax
		jz	short loc_66CEF
		mov	al, byte_7117E
		inc	al
		mov	byte_7117E, al
		mov	al, byte_7117D
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_71176
		assume es:nothing
		add	bx, ax
		mov	eax, [di]
		mov	es:[bx], eax
		inc	byte_7117D
		mov	al, byte_7117D
		mov	ah, 0
		cmp	ax, word_7117A
		jb	short loc_66CEB
		mov	byte_7117D, 0

loc_66CEB:				; CODE XREF: Keyboard_PushEventToQueue_66C9D+47j
		mov	al, 1
		jmp	short loc_66CF1
; ���������������������������������������������������������������������������

loc_66CEF:				; CODE XREF: Keyboard_PushEventToQueue_66C9D+11j
					; Keyboard_PushEventToQueue_66C9D+1Bj
		mov	al, 0

loc_66CF1:				; CODE XREF: Keyboard_PushEventToQueue_66C9D+50j
		pop	di
		pop	si
		pop	bp

locret_66CF4:
		retf
Keyboard_PushEventToQueue_66C9D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 40 lignes, NON DÉTAILLÉE — probable lecture (pop) d'un événement depuis la file
; circulaire (pendant lecture de Keyboard_PushEventToQueue_66C9D).
; ==============================================================================================
Keyboard_PeekOrPopEvent_66CF5	proc far		; CODE XREF: Keyboard_QueryHandlerTable_66D39:loc_66D3Fp
		push	bp
		mov	bp, sp
		cmp	byte_7117E, 0
		jz	short loc_66D35

loc_66CFF:
		mov	al, byte_7117E
		add	al, 0FFh
		mov	byte_7117E, al
		mov	al, byte_7117C
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_71176
		add	bx, ax
		mov	eax, es:[bx]
		mov	dword_72E2F, eax
		inc	byte_7117C

loc_66D21:
		mov	al, byte_7117C
		mov	ah, 0
		cmp	ax, word_7117A
		jb	short loc_66D31
		mov	byte_7117C, 0

loc_66D31:				; CODE XREF: Keyboard_PeekOrPopEvent_66CF5+35j
		mov	al, 1

loc_66D33:
		jmp	short loc_66D37
; ���������������������������������������������������������������������������

loc_66D35:				; CODE XREF: Keyboard_PeekOrPopEvent_66CF5+8j
		mov	al, 0

loc_66D37:				; CODE XREF: Keyboard_PeekOrPopEvent_66CF5:loc_66D33j
		pop	bp
		retf
Keyboard_PeekOrPopEvent_66CF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 50 lignes, NON DÉTAILLÉE — combine Keyboard_PeekOrPopEvent_66CF5 et sub_22E1.
; ==============================================================================================
Keyboard_QueryHandlerTable_66D39	proc far		; CODE XREF: Keyboard_Method_ReturnTypeTag_66D6D+Bp
					; seg202:loc_66D9Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_66D3C:
		jmp	short loc_66D50
; ���������������������������������������������������������������������������

loc_66D3E:				; CODE XREF: Keyboard_QueryHandlerTable_66D39+2Dj
		push	cs

loc_66D3F:
		call	near ptr Keyboard_PeekOrPopEvent_66CF5

loc_66D42:
		or	al, al

loc_66D44:
		jz	short loc_66D50

loc_66D46:
		mov	al, byte ptr dword_72E2F

loc_66D49:
		mov	ah, 0
		test	[bp+arg_0], ax
		jnz	short loc_66D68

loc_66D50:				; CODE XREF: Keyboard_QueryHandlerTable_66D39:loc_66D3Cj
					; Keyboard_QueryHandlerTable_66D39:loc_66D44j
		push	large 40000h

loc_66D56:
		push	5D7Fh
		call	CRT_Memset_Public
		add	sp, 6

loc_66D61:
		cmp	byte_7117E, 0
		jnz	short loc_66D3E

loc_66D68:				; CODE XREF: Keyboard_QueryHandlerTable_66D39+15j
		mov	ax, 5D7Fh
		pop	bp
		retf
Keyboard_QueryHandlerTable_66D39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub retournant une constante de type (5D7Fh).
; ==============================================================================================
Keyboard_Method_ReturnTypeTag_66D6D	proc far		; CODE XREF: Keyboard_QueryAndDispatch_66DA3:loc_66DB2p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_66D39
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		mov	[si], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_Method_ReturnTypeTag_66D6D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, 5D7Fh
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, combine sub_66EF4 et Keyboard_QueryHandlerTable_66D39.
; ==============================================================================================
Keyboard_QueryHandlerTableWrapper_66D91:
		push	bp

loc_66D92:
		mov	bp, sp

loc_66D94:
		call	Keyboard_ReportErrorIfActive_66EF4

loc_66D99:
		push	word ptr [bp+6]

loc_66D9C:
		push	cs

loc_66D9D:
		call	near ptr Keyboard_QueryHandlerTable_66D39
		pop	cx

loc_66DA1:
		pop	bp

locret_66DA2:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_66EF4 et Keyboard_Method_ReturnTypeTag... (Keyboard_QueryHandlerTable-
; related, sub_66D6D) — accesseur final du cluster clavier de ce segment.
; ==============================================================================================
Keyboard_QueryAndDispatch_66DA3	proc far		; CODE XREF: Input_NotifyModeChange+13P
					; Input_ReadAxis2Deadzone+53P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_66DA4:
		mov	bp, sp
		call	Keyboard_ReportErrorIfActive_66EF4
		push	[bp+arg_2]

loc_66DAE:
		push	[bp+arg_0]
		push	cs

loc_66DB2:
		call	near ptr Keyboard_Method_ReturnTypeTag_66D6D
		add	sp, 4
		pop	bp
		retf
Keyboard_QueryAndDispatch_66DA3	endp

seg202		ends
