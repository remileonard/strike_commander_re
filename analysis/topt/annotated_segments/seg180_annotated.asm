seg180		segment	para public 'CODE' use16
		assume cs:seg180
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 0, 9Dh, 0CBh, 0, 0, 9Eh, 48h, 0, 9Ch, 80h, 0FCh, 4Fh, 74h, 6, 9Dh
		db 2Eh, 0FFh, 2Eh, 4, 0, 3Ch, 0E0h, 75h, 0Bh, 2Eh, 0A2h, 8, 0, 9Dh, 0F9h, 2Eh
		db 0FFh, 2Eh, 4, 0, 0FAh, 50h, 53h, 1Eh, 33h, 0DBh, 8Ah, 0D8h, 0B8h, 9Eh, 48h, 8Eh
		db 0D8h, 8Ch, 16h, 72h, 56h, 89h, 26h, 70h, 56h, 8Eh, 0D0h, 0B8h, 76h, 5Ah, 25h, 0FEh
		db 0FFh, 8Bh, 0E0h, 66h, 60h, 6, 0F7h, 6, 6Ch, 56h, 0FFh, 0FFh, 75h, 8, 0F7h, 6
		db 6Eh, 56h, 0FFh, 0FFh, 74h, 0Eh, 53h, 0FFh, 1Eh, 6Ch, 56h, 83h, 0C4h, 2, 2Eh, 0C6h
		db 6, 8, 0, 0, 0A1h, 74h, 56h, 3Dh, 0FFh, 0FFh, 74h, 6, 0C7h, 6, 6Ah, 56h
		db 1, 0, 7, 66h, 61h, 0FAh, 8Eh, 16h, 72h, 56h, 8Bh, 26h, 70h, 56h, 1Fh, 5Bh
		db 58h, 9Dh, 0F9h, 2Eh, 0FFh, 2Eh, 4, 0

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_DrainBufferBIOS_3FA5E (sub_3FA5E de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Keyboard_DrainBufferBIOS_6823A (sub_6823A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, vide le tampon clavier BIOS
; standard (int 16h, fonctions 0/1 CHECK/READ) en boucle jusqu'à ce qu'il soit vide — probable
; purge du tampon BIOS natif avant activation du gestionnaire personnalisé. Référencée par
; sub_28670.
; ==============================================================================================
Keyboard_DrainBufferBIOS_45C38		proc far
		push	ax

loc_45C39:
		mov	ah, 1
		int	16h
		jz	short loc_45C45
		xor	ah, ah
		int	16h
		jmp	short loc_45C39

loc_45C45:
		pop	ax
		retf
Keyboard_DrainBufferBIOS_45C38		endp

; START OF FUNCTION CHUNK FOR Keyboard_DrainBufferBIOS_45C38
		db 0
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
; END OF FUNCTION CHUNK FOR Keyboard_DrainBufferBIOS_45C38
seg180		ends
