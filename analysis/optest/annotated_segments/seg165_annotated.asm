seg165		segment	byte public 'CODE' use16
		assume cs:seg165
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
off_3F9DA	dd unk_43020		; DATA XREF: InputBinding_InitAndRegister_3E626+B2o
					; seg165:0016r	...
byte_3F9DE	db 0			; DATA XREF: seg156:001Ar seg156:0068r ...
; ���������������������������������������������������������������������������

loc_3F9DF:				; DATA XREF: InputBinding_InitAndRegister_3E626+BBo
		pushf
		cmp	ah, 4Fh	; 'O'
		jz	short loc_3F9EB
		popf
		jmp	cs:off_3F9DA
; ���������������������������������������������������������������������������

loc_3F9EB:				; CODE XREF: seg165:0013j
		cmp	al, 0E0h ; '�'
		jnz	short loc_3F9FA
		mov	cs:byte_3F9DE, al
		popf
		stc
		jmp	cs:off_3F9DA
; ���������������������������������������������������������������������������

loc_3F9FA:				; CODE XREF: seg165:001Dj
		cli
		push	ax
		push	bx
		push	ds
		xor	bx, bx
		mov	bl, al
		mov	ax, seg	dseg
		mov	ds, ax
		mov	word_48100, ss
		mov	word_480FE, sp
		mov	ss, ax
		assume ss:dseg
		mov	ax, 54E4h
		and	ax, 0FFFEh
		mov	sp, ax
		pushad
		push	es
		test	word_480FA, 0FFFFh
		jnz	short loc_3FA2C
		test	seg_480FC, 0FFFFh
		jz	short loc_3FA3A

loc_3FA2C:				; CODE XREF: seg165:0052j
		push	bx
		call	dword ptr word_480FA
		add	sp, 2
		mov	cs:byte_3F9DE, 0

loc_3FA3A:				; CODE XREF: seg165:005Aj
		mov	ax, word_48102
		cmp	ax, 0FFFFh
		jz	short loc_3FA48
		mov	word_480F8, 1

loc_3FA48:				; CODE XREF: seg165:0070j
		pop	es
		popad
		cli
		mov	ss, word_48100
		assume ss:nothing
		mov	sp, word_480FE
		pop	ds
		pop	bx
		pop	ax
		popf
		stc
		jmp	cs:off_3F9DA

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_DrainBufferBIOS_6823A (sub_6823A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, vide le tampon clavier BIOS standard (int
; 16h, fonctions 0/1 CHECK/READ) en boucle jusqu'à ce qu'il soit vide — probable purge du
; tampon BIOS natif avant activation du gestionnaire personnalisé. Référencée par sub_28670.
; ==============================================================================================
Keyboard_DrainBufferBIOS_3FA5E	proc far		; CODE XREF: sub_3166+1B0P
					; sub_502B+34FP ...
		push	ax

loc_3FA5F:				; CODE XREF: Keyboard_DrainBufferBIOS_3FA5E+Bj
		mov	ah, 1
		int	16h		; KEYBOARD - CHECK BUFFER, DO NOT CLEAR
					; Return: ZF clear if character	in buffer
					; AH = scan code, AL = character
					; ZF set if no character in buffer
		jz	short loc_3FA6B
		xor	ah, ah
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		jmp	short loc_3FA5F
; ���������������������������������������������������������������������������

loc_3FA6B:				; CODE XREF: Keyboard_DrainBufferBIOS_3FA5E+5j
		pop	ax
		retf
Keyboard_DrainBufferBIOS_3FA5E	endp

seg165		ends
