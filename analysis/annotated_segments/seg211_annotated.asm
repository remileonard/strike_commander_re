seg211		segment	byte public 'CODE' use16
		assume cs:seg211
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
off_681B6	dd unk_6D0B0		; DATA XREF: InputBinding_InitAndRegister_66E02+B2o
					; seg211:0012r	...
byte_681BA	db 0			; DATA XREF: seg202:0016r
					; seg202:loc_66B24r ...
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, point d'entrée du gestionnaire d'interception clavier BIOS (sauvegarde des flags avant
; traitement).
; ==============================================================================================
Keyboard_BIOSInterceptEntry_681BB:				; DATA XREF: InputBinding_InitAndRegister_66E02+BBo
		pushf

; ==============================================================================================
; ⭐ far, installation matérielle réelle du gestionnaire clavier — gestionnaire d'interception
; BIOS (int 15h fonction 4Fh, « keyboard intercept », appelée par la routine d'interruption
; INT 9 du BIOS pour chaque scan-code) : filtre le préfixe de touche étendue 0xE0, bascule sur
; DS/SS=seg339 et une pile privée, puis appelle le pointeur word_7160C — exactement le
; pointeur écrit par Keyboard_SetHandlerPointer_66EE7 (seg203), qui installe
; Keyboard_ProcessScanCode_66AC4 (seg202). Pose word_7160A=1 (le flag « actif » testé par
; Keyboard_ReportErrorIfActive_66EF4). Referencée via vtable (DATA XREF seg216) et chaîne vers
; l'ancien gestionnaire (off_681B6) si non concerné. Clôt la découverte du système clavier
; commencée en seg202-203 : c'est le point d'accroche matériel réel.
; ==============================================================================================
Keyboard_BIOSInterceptHandler_681BC:				; DATA XREF: seg216:075Eo
		cmp	ah, 4Fh	; 'O'
		jz	short loc_681C7
		popf
		jmp	cs:off_681B6
; ���������������������������������������������������������������������������

loc_681C7:				; CODE XREF: seg211:000Fj
		cmp	al, 0E0h ; '�'
		jnz	short loc_681D6
		mov	cs:byte_681BA, al

loc_681CF:
		popf
		stc

loc_681D1:
		jmp	cs:off_681B6
; ���������������������������������������������������������������������������

loc_681D6:				; CODE XREF: seg211:0019j
		cli
		push	ax

loc_681D8:
		push	bx
		push	ds
		xor	bx, bx
		mov	bl, al
		mov	ax, seg	seg339

loc_681E1:
		mov	ds, ax

loc_681E3:
		mov	word_71612, ss
		mov	word_71610, sp
		mov	ss, ax
		assume ss:seg339
		mov	ax, 4966h
		and	ax, 0FFFEh

loc_681F3:
		mov	sp, ax

loc_681F5:
		pushad
		push	es

loc_681F8:
		test	word_7160C, 0FFFFh

loc_681FE:
		jnz	short loc_68208

loc_68200:
		test	seg_7160E, 0FFFFh

loc_68206:
		jz	short loc_68216

loc_68208:				; CODE XREF: seg211:loc_681FEj
		push	bx
		call	dword ptr word_7160C
		add	sp, 2
		mov	cs:byte_681BA, 0

loc_68216:				; CODE XREF: seg211:loc_68206j
		mov	ax, word_71614
		cmp	ax, 0FFFFh
		jz	short loc_68224
		mov	word_7160A, 1

loc_68224:				; CODE XREF: seg211:006Cj
		pop	es
		popad
		cli
		mov	ss, word_71612
		assume ss:nothing
		mov	sp, word_71610
		pop	ds
		pop	bx
		pop	ax

loc_68233:
		popf
		stc

loc_68235:
		jmp	cs:off_681B6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, vide le tampon clavier BIOS standard (int 16h, fonctions 0/1 CHECK/READ) en boucle
; jusqu'à ce qu'il soit vide — probable purge du tampon BIOS natif avant activation du
; gestionnaire personnalisé. Référencée par sub_28670.
; ==============================================================================================
Keyboard_DrainBufferBIOS_6823A	proc far		; CODE XREF: Input_NotifyModeChange+1BP
		push	ax

loc_6823B:				; CODE XREF: Keyboard_DrainBufferBIOS_6823A+Bj
		mov	ah, 1

loc_6823D:				; KEYBOARD - CHECK BUFFER, DO NOT CLEAR
		int	16h		; Return: ZF clear if character	in buffer
					; AH = scan code, AL = character
					; ZF set if no character in buffer

loc_6823F:
		jz	short loc_68247
		xor	ah, ah
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		jmp	short loc_6823B
; ���������������������������������������������������������������������������

loc_68247:				; CODE XREF: Keyboard_DrainBufferBIOS_6823A:loc_6823Fj
		pop	ax
		retf
Keyboard_DrainBufferBIOS_6823A	endp

seg211		ends
