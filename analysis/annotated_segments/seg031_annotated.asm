seg031		segment	byte public 'CODE' use16
		assume cs:seg031
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,69L — retire une entrée de la table de messages actifs (globals
; 0x5034/0x5054/0x5064/0x5084, max 8 slots), décrémente le compteur (word_6DF26), déplace la
; dernière entrée (swap-remove) : libération d'un slot de la file de messages radio actifs.
; ==============================================================================================
RadioQueue_RemoveSlot	proc far		; CODE XREF: seg031:095Fp
		push	bp
		mov	bp, sp
		push	si
		push	di

loc_1EA3B:				; DATA XREF: seg216:01B6o
		mov	byte_721CA, 0
		xor	cx, cx
		jmp	short loc_1EAB6
; ���������������������������������������������������������������������������

loc_1EA44:				; CODE XREF: RadioQueue_RemoveSlot+84j
		mov	bx, cx
		shl	bx, 2
		mov	eax, dword_70458
		sub	[bx+5034h], eax
		mov	bx, cx
		shl	bx, 2
		cmp	dword ptr [bx+5034h], 0
		jg	short loc_1EAB5
		mov	si, cx
		dec	word_6DF26
		jz	short loc_1EAB3
		mov	di, word_6DF26
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+5034h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5034h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+5054h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+5054h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+5066h]
		mov	dx, [bx+5064h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5066h], ax
		mov	[bx+5064h], dx
		mov	al, [di+5084h]
		mov	[si+5084h], al
		jmp	short loc_1EAB6
; ���������������������������������������������������������������������������

loc_1EAB3:				; CODE XREF: RadioQueue_RemoveSlot+2Fj
		jmp	short loc_1EAB6
; ���������������������������������������������������������������������������

loc_1EAB5:				; CODE XREF: RadioQueue_RemoveSlot+27j
		inc	cx

loc_1EAB6:				; CODE XREF: RadioQueue_RemoveSlot+Cj
					; RadioQueue_RemoveSlot+7Bj ...
		cmp	cx, word_6DF26
		jl	short loc_1EA44
		nop
		push	cs
		call	near ptr RadioQueue_ExpireTimer
		pop	di
		pop	si
		pop	bp
		retf
RadioQueue_RemoveSlot	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,90L — recherche/insère une entrée dans la même table de messages actifs (limite 8, timer
; décrémenté par dword_70458) : allocation/mise à jour d'un slot de message radio actif
; (gestion du timer de cooldown).
; ==============================================================================================
RadioQueue_AllocateSlot	proc far		; CODE XREF: Radio_PlayMessage+D9P seg016:0126P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp

loc_1EAC6:
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di

loc_1EACD:
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_1EAD7
		jmp	loc_1EB58
; ���������������������������������������������������������������������������

loc_1EAD7:				; CODE XREF: RadioQueue_AllocateSlot+Dj
		mov	si, word_6DF26
		cmp	si, 8
		jge	short loc_1EAE6

loc_1EAE0:
		inc	word_6DF26
		jmp	short loc_1EB20
; ���������������������������������������������������������������������������

loc_1EAE6:				; CODE XREF: RadioQueue_AllocateSlot+19j
		xor	cx, cx
		mov	si, cx
		shl	si, 2
		add	si, 5034h
		mov	eax, [si]
		mov	[bp+var_8], eax
		xor	dx, dx
		jmp	short loc_1EB18
; ���������������������������������������������������������������������������

loc_1EAFC:				; CODE XREF: RadioQueue_AllocateSlot+57j
		mov	bx, dx
		shl	bx, 2

loc_1EB01:
		mov	eax, [bx+5034h]
		cmp	eax, [bp+var_8]
		jge	short loc_1EB17
		mov	bx, dx
		shl	bx, 2
		mov	[bp+var_8], eax
		mov	cx, dx

loc_1EB17:				; CODE XREF: RadioQueue_AllocateSlot+45j
		inc	dx

loc_1EB18:				; CODE XREF: RadioQueue_AllocateSlot+35j
		cmp	dx, word_6DF26
		jl	short loc_1EAFC
		mov	si, cx

loc_1EB20:				; CODE XREF: RadioQueue_AllocateSlot+1Fj
		mov	[bp+var_4], 800h
		mov	eax, [bp+var_4]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5034h], eax
		mov	bx, si
		shl	bx, 1
		mov	[bx+5054h], di
		mov	bx, si
		shl	bx, 2
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bx+5066h], ax
		mov	[bx+5064h], dx
		mov	al, [bp+arg_6]
		mov	[si+5084h], al

loc_1EB58:				; CODE XREF: RadioQueue_AllocateSlot+Fj
		pop	di
		pop	si
		leave
		retf
RadioQueue_AllocateSlot	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — recherche une entrée par coordonnées (+0x5064/0x5066) et la retire (swap-remove) :
; suppression d'un message actif par position.
; ==============================================================================================
RadioQueue_RemoveByPos	proc far		; CODE XREF: SubObject_NotifyEvent+A5P
					; seg098:01DDP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	cx, cx
		jmp	short loc_1EBD3
; ���������������������������������������������������������������������������

loc_1EB65:				; CODE XREF: RadioQueue_RemoveByPos+7Bj
		mov	bx, cx
		shl	bx, 2
		mov	ax, [bx+5066h]
		mov	dx, [bx+5064h]
		cmp	ax, [bp+arg_2]
		jnz	short loc_1EBD2
		cmp	dx, [bp+arg_0]
		jnz	short loc_1EBD2
		mov	si, cx
		dec	word_6DF26
		jz	short loc_1EBD0
		mov	di, word_6DF26
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+5034h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5034h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+5054h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+5054h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+5066h]
		mov	dx, [bx+5064h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5066h], ax

loc_1EBC2:
		mov	[bx+5064h], dx
		mov	al, [di+5084h]

loc_1EBCA:
		mov	[si+5084h], al
		jmp	short loc_1EBD3
; ���������������������������������������������������������������������������

loc_1EBD0:				; CODE XREF: RadioQueue_RemoveByPos+26j
		jmp	short loc_1EBD3
; ���������������������������������������������������������������������������

loc_1EBD2:				; CODE XREF: RadioQueue_RemoveByPos+19j
					; RadioQueue_RemoveByPos+1Ej
		inc	cx

loc_1EBD3:				; CODE XREF: RadioQueue_RemoveByPos+7j
					; RadioQueue_RemoveByPos+72j ...
		cmp	cx, word_6DF26
		jl	short loc_1EB65
		pop	di
		pop	si
		pop	bp
		retf
RadioQueue_RemoveByPos	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,66L — recherche dans la table des 8 slots celui associé à un objet donné (si) avec le
; timer le plus ancien : sélection du slot de message radio le plus prioritaire/ancien pour
; une source donnée.
; ==============================================================================================
RadioQueue_FindOldestSlot	proc far		; CODE XREF: RadioQueue_RegisterMessage+1Ep

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	cx, 0FFFFh
		cmp	byte_6DF29, 0
		jz	short loc_1EC07
		mov	al, byte_6DF28

loc_1EBF4:
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	[bx+5054h], si
		jnz	short loc_1EC07
		mov	al, byte_6DF28
		mov	ah, 0
		jmp	short loc_1EC43
; ���������������������������������������������������������������������������

loc_1EC07:				; CODE XREF: RadioQueue_FindOldestSlot+12j
					; RadioQueue_FindOldestSlot+21j
		xor	dx, dx
		jmp	short loc_1EC3B
; ���������������������������������������������������������������������������

loc_1EC0B:				; CODE XREF: RadioQueue_FindOldestSlot+62j
		mov	bx, dx
		shl	bx, 1
		cmp	[bx+5054h], si
		jnz	short loc_1EC3A
		cmp	cx, 0FFFFh
		jz	short loc_1EC2A
		mov	bx, dx
		shl	bx, 2
		mov	eax, [bx+5034h]
		cmp	eax, [bp+var_4]
		jge	short loc_1EC3A

loc_1EC2A:				; CODE XREF: RadioQueue_FindOldestSlot+3Bj
		mov	bx, dx
		shl	bx, 2
		mov	eax, [bx+5034h]
		mov	[bp+var_4], eax
		mov	cx, dx

loc_1EC3A:				; CODE XREF: RadioQueue_FindOldestSlot+36j
					; RadioQueue_FindOldestSlot+4Bj
		inc	dx

loc_1EC3B:				; CODE XREF: RadioQueue_FindOldestSlot+2Cj
		cmp	dx, word_6DF26
		jl	short loc_1EC0B
		mov	ax, cx

loc_1EC43:				; CODE XREF: RadioQueue_FindOldestSlot+28j
		pop	si
		leave
		retf
RadioQueue_FindOldestSlot	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,154L — réserve un slot de message (sub_1EBDD), enregistre position/priorité, traite
; spécialement le cas où la source est le joueur (word_722E6) : enregistrement d'un nouveau
; message radio actif — cœur du système de chatter radio (lié à sub_CB45/sub_CC7A du seg006).
; ==============================================================================================
RadioQueue_RegisterMessage	proc far		; CODE XREF: AI_MessageDispatcher+1CP seg031:0946p ...

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+82h], 0
		mov	[bp+var_2], 0FFh
		push	word ptr es:[bx+0Dh]
		push	cs
		call	near ptr RadioQueue_FindOldestSlot
		pop	cx
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0FFFFh
		jnz	short loc_1EC74
		jmp	loc_1ED78
; ���������������������������������������������������������������������������

loc_1EC74:				; CODE XREF: RadioQueue_RegisterMessage+29j
		mov	bx, [bp+var_4]
		mov	al, [bx+5084h]
		mov	[bp+var_2], al
		shl	bx, 2
		mov	ax, [bx+5066h]
		mov	dx, [bx+5064h]
		les	bx, [bp+arg_0]
		mov	es:[bx+84h], ax
		mov	es:[bx+82h], dx
		mov	ax, es:[bx+0Dh]
		cmp	ax, word_722E6
		jnz	short loc_1ED1D

loc_1ECA0:
		cmp	dword_6DF2E, 0

loc_1ECA6:
		jz	short loc_1ECAD
		mov	ax, 1
		jmp	short loc_1ECAF
; ���������������������������������������������������������������������������

loc_1ECAD:				; CODE XREF: RadioQueue_RegisterMessage:loc_1ECA6j
		xor	ax, ax

loc_1ECAF:				; CODE XREF: RadioQueue_RegisterMessage+65j
		or	al, al
		jnz	short loc_1ECBF
		push	2
		call	Widget_Helper_5AB2C
		pop	cx
		or	al, al
		jz	short loc_1ECC6

loc_1ECBF:				; CODE XREF: RadioQueue_RegisterMessage+6Bj
					; RadioQueue_RegisterMessage+D0j
		mov	[bp+var_4], 0FFFFh
		jmp	short loc_1ED1D
; ���������������������������������������������������������������������������

loc_1ECC6:				; CODE XREF: RadioQueue_RegisterMessage+77j
		mov	al, byte ptr [bp+var_4]

loc_1ECC9:
		mov	byte_6DF28, al
		mov	al, byte_6DF29
		mov	ah, 0

loc_1ECD1:
		push	ax

loc_1ECD2:
		mov	al, [bp+var_2]
		push	ax

loc_1ECD6:
		push	large [bp+arg_0]
		les	bx, [bp+arg_0]

loc_1ECDD:
		push	large dword ptr	es:[bx+82h]
		nop

loc_1ECE4:
		push	cs
		call	near ptr Radio_LoadAndTriggerVoice
		add	sp, 0Ch
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1ED18

loc_1ECF1:
		mov	[bp+var_8], 700h
		mov	eax, [bp+var_8]
		mov	bx, [bp+var_4]
		shl	bx, 2
		mov	[bx+5034h], eax
		mov	al, byte ptr [bp+var_4]
		mov	byte_6DF28, al
		mov	al, byte_6DF29
		inc	al
		mov	byte_6DF29, al
		jmp	short loc_1ECBF
; ���������������������������������������������������������������������������

loc_1ED18:				; CODE XREF: RadioQueue_RegisterMessage+A9j
		mov	byte_6DF29, 0

loc_1ED1D:				; CODE XREF: RadioQueue_RegisterMessage+58j
					; RadioQueue_RegisterMessage+7Ej
		cmp	[bp+var_4], 0FFFFh
		jz	short loc_1ED78
		mov	si, [bp+var_4]
		dec	word_6DF26
		jz	short loc_1ED78
		mov	di, word_6DF26
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+5034h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5034h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+5054h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+5054h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+5066h]
		mov	dx, [bx+5064h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5066h], ax
		mov	[bx+5064h], dx
		mov	al, [di+5084h]
		mov	[si+5084h], al
		jmp	short $+2

loc_1ED78:				; CODE XREF: RadioQueue_RegisterMessage+2Bj
					; RadioQueue_RegisterMessage+DBj ...
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
RadioQueue_RegisterMessage	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,16L — calcule deux offsets temporels (dword_72140/72144) à partir d'une table
; (word_70E62) : synchronisation audio/vidéo (offset de lecture).
; ==============================================================================================
AV_SyncComputeOffset	proc far		; CODE XREF: AV_SyncInit:loc_1EDAEp
					; MissionText_DrawTypewriterSynced_975CC+98P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, word_70E62
		mov	ax, [bx+6]
		add	ax, [bp+arg_0]
		mov	word ptr dword_72140+2,	ax
		add	ax, 0Bh
		mov	word ptr dword_72144+2,	ax
		pop	bp
		retf
AV_SyncComputeOffset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,19L — initialise la synchro audio/vidéo puis appelle sub_1ED7F(0xBC) : initialisation de
; la synchronisation d'une séquence audio/animation.
; ==============================================================================================
AV_SyncInit	proc far		; CODE XREF: Subtitle_WidgetInit+23p
		push	bp
		mov	bp, sp
		mov	bx, word_70E62
		mov	ax, [bx+4]
		mov	word ptr dword_72140, ax
		mov	ax, [bx+8]
		mov	word ptr dword_72144, ax
		push	0BCh ; '�'
		push	cs

loc_1EDAE:
		call	near ptr AV_SyncComputeOffset
		pop	cx
		pop	bp

locret_1EDB3:
		retf
AV_SyncInit	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,65L — parse un nombre depuis une chaîne (sub_2D87=conversion chiffre) caractère par
; caractère : parseur d'entier depuis une chaîne (utilisé par le format de texte de
; briefing/dialogue).
; ==============================================================================================
Text_ParseInt	proc far		; CODE XREF: Radio_LoadAndTriggerVoice:loc_1EEA7p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_1EDB7:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		jmp	short loc_1EDF1
; ���������������������������������������������������������������������������

loc_1EDC0:				; CODE XREF: Text_ParseInt+48j
		push	0Ah

loc_1EDC2:
		push	large [bp+arg_0]

loc_1EDC6:
		call	CRT_MemFamily_Extra3
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx

loc_1EDD1:
		mov	word ptr [bp+var_4], ax

loc_1EDD4:
		cmp	[bp+var_4], 0
		jz	short loc_1EDEB
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		inc	dx
		mov	word ptr [bp+arg_0+2], ax
		mov	word ptr [bp+arg_0], dx
		dec	si
		jmp	short loc_1EDF1
; ���������������������������������������������������������������������������

loc_1EDEB:				; CODE XREF: Text_ParseInt+25j
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_1EE04
; ���������������������������������������������������������������������������

loc_1EDF1:				; CODE XREF: Text_ParseInt+Aj
					; Text_ParseInt+35j
		or	si, si
		jz	short loc_1EDFE
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1EDC0

loc_1EDFE:				; CODE XREF: Text_ParseInt+3Fj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_1EE04:				; CODE XREF: Text_ParseInt+3Bj
		pop	si
		leave
		retf
Text_ParseInt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — copie une chaîne jusqu'au saut de ligne (0x0A), détecte les doubles sauts de ligne
; (paragraphe) : découpage de texte en lignes/paragraphes pour l'affichage de briefing.
; ==============================================================================================
Text_SplitParagraphs	proc far		; CODE XREF: Radio_LoadAndTriggerVoice+60p

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	cx, [bp+arg_0]
		mov	[bp+var_1], 1
		xor	dx, dx
		jmp	short loc_1EE44
; ���������������������������������������������������������������������������

loc_1EE18:				; CODE XREF: Text_SplitParagraphs+46j
		les	bx, [bp+arg_2]
		add	bx, dx
		cmp	byte ptr es:[bx], 0Ah
		jnz	short loc_1EE35
		mov	bx, dx
		add	bx, word ptr [bp+arg_2]
		cmp	byte ptr es:[bx+1], 0
		jz	short loc_1EE4F
		mov	[bp+var_1], 0
		jmp	short loc_1EE4F
; ���������������������������������������������������������������������������

loc_1EE35:				; CODE XREF: Text_SplitParagraphs+1Aj
		les	bx, [bp+arg_2]
		add	bx, dx
		mov	al, es:[bx]
		mov	bx, cx
		add	bx, dx
		mov	[bx], al
		inc	dx

loc_1EE44:				; CODE XREF: Text_SplitParagraphs+Fj
		les	bx, [bp+arg_2]
		add	bx, dx
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1EE18

loc_1EE4F:				; CODE XREF: Text_SplitParagraphs+26j
					; Text_SplitParagraphs+2Cj
		mov	bx, cx
		add	bx, dx
		mov	byte ptr [bx], 0
		mov	al, [bp+var_1]
		leave
		retf
Text_SplitParagraphs	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,215L — appelle sub_1F285 (résolution audio) selon un index, orchestre le chargement d'un
; message vocal : chargement et déclenchement d'un message radio avec audio associé.
; ==============================================================================================
Radio_LoadAndTriggerVoice	proc far		; CODE XREF: RadioQueue_RegisterMessage+9Fp

var_C4		= word ptr -0C4h
var_A4		= word ptr -0A4h
var_24		= word ptr -24h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0C4h
		push	si
		mov	[bp+var_1], 1
		mov	al, [bp+arg_8]
		cbw
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Text_ComputeMessageWidth
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_1EE88
		jmp	loc_1EFF8
; ���������������������������������������������������������������������������

loc_1EE88:				; CODE XREF: Radio_LoadAndTriggerVoice+28j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 72h	; 'r'
		push	word ptr [bp+arg_0+2]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		push	[bp+arg_A]
		push	large [bp+var_6]
		push	cs

loc_1EEA7:
		call	near ptr Text_ParseInt

loc_1EEAA:
		add	sp, 6
		mov	[bp+var_8], dx

loc_1EEB0:
		mov	[bp+var_A], ax
		push	dx
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		push	cs
		call	near ptr Text_SplitParagraphs
		add	sp, 6

loc_1EEC1:
		mov	[bp+var_1], al
		mov	al, [bp+arg_8]

loc_1EEC7:
		cbw
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_24]
		push	ax

loc_1EED1:
		push	0E84h
		push	509Ah
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	loc_1EFB3
; ���������������������������������������������������������������������������

loc_1EEE2:				; CODE XREF: Radio_LoadAndTriggerVoice+16Bj
		mov	al, [si+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	cx, ax
		mov	al, [si+2]
		mov	[bp+var_F], al
		mov	al, [si+3]
		mov	[bp+var_10], al
		mov	byte ptr [si+1], 46h ; 'F'
		mov	byte ptr [si+2], 73h ; 's'
		mov	byte ptr [si+3], 0
		mov	word ptr [bp+var_14+2],	ds
		mov	word ptr [bp+var_14], 0E8Bh
		cmp	cx, 43h	; 'C'
		jnz	short loc_1EF23
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 72h	; 'r'
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx

loc_1EF23:				; CODE XREF: Radio_LoadAndTriggerVoice+B7j
		cmp	cx, 4Eh	; 'N'
		jnz	short loc_1EF37
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 52h	; 'R'
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx

loc_1EF37:				; CODE XREF: Radio_LoadAndTriggerVoice+CBj
		cmp	cx, 53h	; 'S'
		jnz	short loc_1EF49
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+92h]
		mov	[bp+var_14], eax

loc_1EF49:				; CODE XREF: Radio_LoadAndTriggerVoice+DFj
		cmp	cx, 23h	; '#'
		jnz	short loc_1EF70
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+90h]
		push	0E8Dh
		lea	ax, [bp+var_C4]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_C4]
		mov	word ptr [bp+var_14+2],	ss
		mov	word ptr [bp+var_14], ax

loc_1EF70:				; CODE XREF: Radio_LoadAndTriggerVoice+F1j
		push	large [bp+var_14]
		push	509Ah
		lea	ax, [bp+var_A4]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	al, [bp+var_F]
		mov	[si+2],	al
		mov	al, [bp+var_10]
		mov	[si+3],	al
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	CRT_Strcat

loc_1EFA0:
		add	sp, 4

loc_1EFA3:
		lea	ax, [bp+var_A4]
		push	ax
		push	509Ah

loc_1EFAB:
		call	CRT_Strcpy

loc_1EFB0:
		add	sp, 4

loc_1EFB3:				; CODE XREF: Radio_LoadAndTriggerVoice+84j
		push	25h ; '%'
		push	509Ah
		call	CRT_Strchr_WordAligned
		add	sp, 4

loc_1EFC0:
		mov	si, ax
		or	ax, ax
		jz	short loc_1EFC9
		jmp	loc_1EEE2
; ���������������������������������������������������������������������������

loc_1EFC9:				; CODE XREF: Radio_LoadAndTriggerVoice+169j
		mov	[bp+var_E], 400h

loc_1EFD1:
		mov	eax, [bp+var_E]

loc_1EFD5:
		mov	dword_6DF2A, eax
		mov	word ptr dword_6DF2E+2,	ds

loc_1EFDD:
		mov	word ptr dword_6DF2E, 509Ah

loc_1EFE3:
		mov	byte_6DF32, 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+51h]
		mov	byte_6DF32, al
		mov	al, [bp+arg_8]
		mov	byte_6DF33, al

loc_1EFF8:				; CODE XREF: Radio_LoadAndTriggerVoice+2Aj
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Radio_LoadAndTriggerVoice	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,88L — décrémente un timer global (dword_6DF2A, dword_6DF2E) via dword_70458 ; à
; expiration, déclenche potentiellement un son via sub_2075B(0x5130) : minuteur d'expiration
; d'un message/séquence audio en cours.
; ==============================================================================================
RadioQueue_ExpireTimer	proc far		; CODE XREF: RadioQueue_RemoveSlot+88p

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	dword_6DF2E, 0
		jnz	short loc_1F00F
		jmp	locret_1F0CB
; ���������������������������������������������������������������������������

loc_1F00F:				; CODE XREF: RadioQueue_ExpireTimer+Cj
		mov	eax, dword_70458
		sub	dword_6DF2A, eax
		cmp	dword_6DF2A, 0
		jl	short loc_1F023
		jmp	locret_1F0CB
; ���������������������������������������������������������������������������

loc_1F023:				; CODE XREF: RadioQueue_ExpireTimer+20j
		mov	dword_6DF2A, 0
		mov	dword_6DF2E, 0
		mov	byte_721CA, 1
		cmp	word_7234E, 2
		jnz	short loc_1F044
		jmp	locret_1F0CB
; ���������������������������������������������������������������������������

loc_1F044:				; CODE XREF: RadioQueue_ExpireTimer+41j
		cmp	byte_721F0, 2
		jnz	short loc_1F05A
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_1F05A:				; CODE XREF: RadioQueue_ExpireTimer+4Bj
		push	0
		push	large [dword_72144]
		push	large [dword_72140]
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		cmp	byte_721F0, 2
		jnz	short loc_1F0B3
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_2], bx
		push	1
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		xor	dx, dx
		mov	cl, 0
		mov	ch, 2
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		cmp	[bp+var_2], 0
		jnz	short loc_1F0B3
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short $+2

loc_1F0B3:				; CODE XREF: RadioQueue_ExpireTimer+79j
					; RadioQueue_ExpireTimer+A7j
		push	0
		push	large [dword_72144]
		push	large [dword_72140]
		push	word_70E62

loc_1F0C3:
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch

locret_1F0CB:				; CODE XREF: RadioQueue_ExpireTimer+Ej
					; RadioQueue_ExpireTimer+22j ...
		leave
		retf
RadioQueue_ExpireTimer	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — met en majuscule chaque caractère alphabétique d'une chaîne ASCIIZ (plage a-z) :
; conversion en majuscules (strupr) pour texte radio/UI.
; ==============================================================================================
Text_ToUpper	proc far		; CODE XREF: Audio_LoadSpeechClip+DCp

var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2

loc_1F0D3:
		jmp	short loc_1F0F3
; ���������������������������������������������������������������������������

loc_1F0D5:				; CODE XREF: Text_ToUpper+2Dj
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		cbw
		add	ax, 0FF9Fh
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 1Ah
		jnb	short loc_1F0F0
		mov	al, es:[bx]
		add	al, 0E0h ; '�'
		mov	es:[bx], al

loc_1F0F0:				; CODE XREF: Text_ToUpper+19j
		inc	word ptr [bp+arg_0]

loc_1F0F3:				; CODE XREF: Text_ToUpper:loc_1F0D3j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1F0D5
		leave
		retf
Text_ToUpper	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,114L — charge un clip vocal depuis 'INTEL\SPEECH\*.PAK' (sub_2B06C/sub_5AAD7) :
; chargement d'un fichier audio de dialogue/intel de mission.
; ==============================================================================================
Audio_LoadSpeechClip	proc far		; CODE XREF: seg031:08F2p

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		cmp	byte_6DF32, 0
		jnz	short loc_1F110
		jmp	loc_1F1BE
; ���������������������������������������������������������������������������

loc_1F110:				; CODE XREF: Audio_LoadSpeechClip+Dj
		push	ds
		push	offset a_pak_0	; ".PAK"
		push	ds
		push	offset aSpeech	; "SPEECH"
		push	ds
		push	offset aIntel	; "INTEL"
		lea	ax, [bp+var_50]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	2
		mov	al, byte_6DF33
		mov	ah, 0
		push	ax
		mov	al, byte_6DF32
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Widget_Helper_5AAD7
		add	sp, 8
		or	al, al
		jz	short loc_1F1B9
		cmp	byte_6DF29, 0
		jz	short loc_1F1B0
		mov	al, byte_6DF28
		mov	ah, 0
		mov	si, ax
		dec	word_6DF26
		jz	short loc_1F1A6
		mov	di, word_6DF26
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+5034h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5034h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+5054h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+5054h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+5066h]
		mov	dx, [bx+5064h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+5066h], ax
		mov	[bx+5064h], dx
		mov	al, [di+5084h]
		mov	[si+5084h], al
		jmp	short $+2

loc_1F1A6:				; CODE XREF: Audio_LoadSpeechClip+5Aj
		mov	byte_6DF29, 0
		mov	byte_6DF28, 0FFh

loc_1F1B0:				; CODE XREF: Audio_LoadSpeechClip+4Dj
		mov	dword_6DF2E, 0

loc_1F1B9:				; CODE XREF: Audio_LoadSpeechClip+46j
		mov	byte_6DF32, 0

loc_1F1BE:				; CODE XREF: Audio_LoadSpeechClip+Fj
		cmp	dword_6DF2E, 0
		jz	short loc_1F1FC

loc_1F1C6:
		push	[bp+arg_0]
		push	508Ch

loc_1F1CC:
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		push	large [dword_6DF2E]
		push	cs
		call	near ptr Text_ToUpper
		add	sp, 4
		push	1

loc_1F1E2:
		push	0
		push	large [dword_6DF2E]
		push	word ptr dword_72140+2
		push	508Ch
		push	ds
		push	offset word_72A94
		call	UI_RenderFormattedText
		add	sp, 10h

loc_1F1FC:				; CODE XREF: Audio_LoadSpeechClip+C6j
		pop	di
		pop	si
		leave
		retf
Audio_LoadSpeechClip	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 20 lignes - CONFIRME (information externe de Remi + lecture du code) : accesseur simple
; pour le systeme de menu radio des coequipiers. Prend (entite, index) en argument, verifie
; l'index contre le compteur OPTS (PilotProfile+0x86), retourne la lettre a cette position
; (PilotProfile+0x88+index) si valide, sinon 0xFF ('option absente'). OPTS (chunk du fichier
; PROF) contient une sequence de lettres minuscules representant les QUESTIONS/ORDRES qu'on
; peut poser a ce personnage par radio - chaque lettre correspond a un type de question fixe
; du jeu (voir Radio_EvaluateOptionAvailability_16433 pour le detail des 9 types reconnus 'e'
; a 'm'). Un personnage sans OPTS (Hammer, PNJ non-interactif) n'a donc aucune question
; disponible - coherent avec son statut non-radio.
; ==============================================================================================
Radio_GetOptionLetterByIndex_1F200	proc far		; CODE XREF: seg016:loc_16433P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_4]
		mov	cl, 0FFh
		les	bx, [bp+arg_0]
		cmp	es:[bx+86h], dx
		jbe	short loc_1F219
		add	bx, dx
		mov	cl, es:[bx+88h]

loc_1F219:				; CODE XREF: Radio_GetOptionLetterByIndex_1F200+10j
		mov	al, cl
		pop	bp
		retf
Radio_GetOptionLetterByIndex_1F200	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,58L — recherche du texte via sub_5C832 (police/glyphe) avec offset cumulé
; (dword_721CB/721D1) : calcul de largeur de texte cumulée (mise en page de dialogue).
; ==============================================================================================
Text_ComputeCumulativeWidth	proc far		; CODE XREF: seg016:03FEP

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	0
		mov	al, byte_721CF
		push	ax
		push	large [dword_721CB]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, word ptr dword_721D1
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		jmp	short loc_1F277
; ���������������������������������������������������������������������������

loc_1F251:				; CODE XREF: Text_ComputeCumulativeWidth+60j
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	[bp+var_A], ax
		add	word ptr [bp+var_4], 2
		cmp	ax, [bp+arg_0]
		jnz	short loc_1F26B
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short locret_1F283
; ���������������������������������������������������������������������������

loc_1F26B:				; CODE XREF: Text_ComputeCumulativeWidth+44j
					; Text_ComputeCumulativeWidth+58j
		les	bx, [bp+var_4]
		inc	word ptr [bp+var_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1F26B

loc_1F277:				; CODE XREF: Text_ComputeCumulativeWidth+32j
		mov	ax, word ptr [bp+var_4]
		cmp	ax, [bp+var_8]
		jb	short loc_1F251
		xor	dx, dx
		xor	ax, ax

locret_1F283:				; CODE XREF: Text_ComputeCumulativeWidth+4Cj
		leave
		retf
Text_ComputeCumulativeWidth	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,55L — table indexée (max 0x21 entrées, +0xF), résout un texte via sub_5C832 avec
; accumulation de largeur : calcul de la largeur totale d'un message pour son affichage
; (retour ligne).
; ==============================================================================================
Text_ComputeMessageWidth	proc far		; CODE XREF: Radio_LoadAndTriggerVoice+17p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	dx, [bp+arg_4]
		mov	[bp+var_4], 0
		cmp	dx, 21h	; '!'
		jnb	short loc_1F2D0
		mov	ax, dx
		shl	ax, 1

loc_1F2A0:
		les	bx, [bp+arg_0]

loc_1F2A3:
		add	bx, ax

loc_1F2A5:
		mov	si, es:[bx+0Fh]

loc_1F2A9:
		or	si, si
		jz	short loc_1F2D0
		push	0

loc_1F2AF:
		mov	bx, word ptr [bp+arg_0]

loc_1F2B2:
		mov	al, es:[bx+6]
		push	ax
		push	large dword ptr	es:[bx+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		add	word ptr [bp+var_4], si

loc_1F2D0:				; CODE XREF: Text_ComputeMessageWidth+15j
					; Text_ComputeMessageWidth+26j
		mov	dx, word ptr [bp+var_4+2]

loc_1F2D3:
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Text_ComputeMessageWidth	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,25L — initialise un widget (positionnement sub_168BC + sync sub_1ED97) : initialisation
; d'un widget de sous-titre/dialogue.
; ==============================================================================================
Subtitle_WidgetInit	proc far		; CODE XREF: seg015:0B0DP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	byte ptr [si+20h], 1
		mov	byte ptr [si+21h], 0
		mov	[si+2],	ax
		push	si
		call	UI_PositionListLabels
		pop	cx
		push	cs
		call	near ptr AV_SyncInit
		pop	si
		leave
		retf
Subtitle_WidgetInit	endp

; ���������������������������������������������������������������������������

loc_1F302:				; DATA XREF: seg339:0758o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		cmp	dword_6DF2E, 0
		jz	short loc_1F315
		mov	ax, 1
		jmp	short loc_1F317
; ���������������������������������������������������������������������������

loc_1F315:				; CODE XREF: seg031:08DEj
		xor	ax, ax

loc_1F317:				; CODE XREF: seg031:08E3j
		or	al, al
		jz	short loc_1F326
		mov	ax, dx
		add	ax, 12h
		push	ax
		push	cs
		call	near ptr Audio_LoadSpeechClip
		pop	cx

loc_1F326:				; CODE XREF: seg031:08E9j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1F328:				; DATA XREF: seg339:0754o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, word_722E6
		or	di, di
		jz	short loc_1F392
		push	ds
		push	offset aRadio_1	; "RADIO"
		push	large dword ptr	[di+5Eh]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F37C
		mov	dword ptr [bp-4], 0
		cmp	dword ptr [di+55h], 0
		jz	short loc_1F371
		mov	ax, [di+57h]
		mov	dx, [di+55h]
		add	dx, 1Ah
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		jmp	short $+2

loc_1F371:				; CODE XREF: seg031:092Ej
		push	large dword ptr	[bp-4]
		push	cs
		call	near ptr RadioQueue_RegisterMessage
		add	sp, 4

loc_1F37C:				; CODE XREF: seg031:091Fj
		cmp	dword_6DF2E, 0
		jz	short loc_1F389
		mov	ax, 1
		jmp	short loc_1F38B
; ���������������������������������������������������������������������������

loc_1F389:				; CODE XREF: seg031:0952j
		xor	ax, ax

loc_1F38B:				; CODE XREF: seg031:0957j
		mov	[si+20h], al
		push	cs
		call	near ptr RadioQueue_RemoveSlot

loc_1F392:				; CODE XREF: seg031:0909j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1F396:				; DATA XREF: seg339:4DAAo
		push	bp
		mov	bp, sp
		push	seg seg031
		push	offset loc_1F4A1

loc_1F39F:
		push	large 10008h
		push	4
		push	5034h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	dword_6DF2A, 0
		mov	word_7213C, 0
		mov	word_7213E, 0
		mov	byte_72149, 0

loc_1F3CC:
		mov	dword_721CB, 0
		mov	byte_721CF, 2
		mov	byte_721D0, 0
		mov	dword_721D1, 0
		mov	dword_721D5, 0
		mov	byte_721D9, 2
		mov	byte_721DA, 0
		mov	dword_721DB, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1F406:				; DATA XREF: seg339:off_71F7Ao
		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	byte_721DA, 0
		jz	short loc_1F43A
		cmp	dword_721D5, 0
		jz	short loc_1F43A
		push	0
		mov	al, byte_721D9
		push	ax
		mov	eax, dword_721D5
		mov	[bp-4],	eax
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_1F43A:				; CODE XREF: seg031:09E1j seg031:09E9j
		mov	dword_721D5, 0
		mov	byte_721DA, 0
		mov	dword_721DB, 0
		cmp	byte_721D0, 0
		jz	short loc_1F47F
		cmp	dword_721CB, 0
		jz	short loc_1F47F
		push	0
		mov	al, byte_721CF
		push	ax
		mov	eax, dword_721CB
		mov	[bp-8],	eax
		lea	ax, [bp-8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_1F47F:				; CODE XREF: seg031:0A26j seg031:0A2Ej
		mov	dword_721CB, 0
		mov	byte_721D0, 0
		mov	dword_721D1, 0
		push	508Ch
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		leave
		retf
; ���������������������������������������������������������������������������

loc_1F4A1:				; DATA XREF: seg031:096Co
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		or	dx, dx
		jnz	short loc_1F4B7
		push	4

loc_1F4AD:
		call	CRT_Malloc16_Retry
		pop	cx

loc_1F4B3:
		mov	dx, ax
		or	ax, ax

loc_1F4B7:				; CODE XREF: seg031:0A79j
		mov	ax, dx
		pop	bp
		retf
seg031		ends
