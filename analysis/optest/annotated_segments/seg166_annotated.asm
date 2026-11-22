seg166		segment	byte public 'CODE' use16
		assume cs:seg166
		;org 0Dh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
seg_3FA6D	dw seg seg170		; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+7r VROOMM_InstallIntHandler_3FBA8+4r ...
seg_3FA6F	dw seg dseg		; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+C4r
		db 50h,	41h, 54h, 48h, 3Dh
word_3FA76	dw 0			; DATA XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+Cw

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_OpenAndParseOverlayFile_68254 (sub_68254 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_LocateAndValidate_68254' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). far, ~230 lignes - POINT D'ENTREE PRINCIPAL du moteur bas
; niveau VROOMM. Ouvre le fichier .EXE du jeu (par defaut 'strike.exe', ou un nom fourni en
; argument) en cherchant dans les repertoires de la variable d'environnement PATH (via
; VROOMM_SearchPathAndOpen_68405/6844A). Lit et VALIDE L'EN-TETE DOS MZ (signature
; 0x5A4D='MZ'), calcule la position du bloc d'overlay dans le fichier, VALIDE UNE SIGNATURE
; D'OVERLAY 'BF'/'OV' (0x4246/0x564F) - confirmant le format d'en-tete d'overlay proprietaire
; Borland/VROOMM. Extrait la position/taille des donnees d'overlay et les stocke dans seg339
; (word_71A18/word_71A1A). Appelle VROOMM_InstallIntHandler_68384 pour installer le
; gestionnaire d'interruption, puis VROOMM_ScanMemoryArena_6855F pour detecter la memoire
; disponible.
; ==============================================================================================
VROOMM_OpenAndParseOverlayFile_3FA78	proc far		; CODE XREF: seg166:093Ep

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	ds
		mov	ds, cs:seg_3FA6D
		assume ds:seg170
		push	si
		push	di
		cld
		cmp	word_416A0, 0
		jnz	short loc_3FA91
		jmp	loc_3FB9D
; ���������������������������������������������������������������������������

loc_3FA91:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+14j
		call	VROOMM_SearchPathEnvAndOpen_3FC29
		jnb	short loc_3FAC2
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_3FAA8
		mov	[bp+arg_0], (offset aOpttest_exe - (offset off_416BE+2)) ; "opttest.exe"
		mov	[bp+arg_2], 416Ch

loc_3FAA8:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+24j
		call	VROOMM_SearchPathAndOpen_3FC1D
		jnb	short loc_3FAC2
		call	VROOMM_MatchPathPrefix_3FC6E
		jnb	short loc_3FAC2
		mov	ax, 0FFFEh
		jmp	loc_3FB9F
; ���������������������������������������������������������������������������

loc_3FAB8:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+59j
					; VROOMM_OpenAndParseOverlayFile_3FA78+69j ...
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		mov	ax, 0FFFFh
		jmp	loc_3FB9F
; ���������������������������������������������������������������������������

loc_3FAC2:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+1Cj
					; VROOMM_OpenAndParseOverlayFile_3FA78+33j ...
		mov	bx, ax
		mov	word_416B8, bx
		mov	cx, 14h
		call	VROOMM_ReadFileExact_3FCF3
		mov	cx, 0FFFDh
		jb	short loc_3FAB8
		xor	ax, ax
		xor	dx, dx
		cmp	[bp+var_14], 5A4Dh
		jz	short loc_3FAE3
		mov	cx, 0FFFCh
		jmp	short loc_3FAB8
; ���������������������������������������������������������������������������

loc_3FAE3:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+64j
		mov	ax, [bp+var_10]
		mov	cx, [bp+var_12]
		jcxz	short loc_3FAEC
		dec	ax

loc_3FAEC:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+71j
		mov	dx, 200h
		mul	dx
		add	ax, cx
		add	ax, 0Fh
		adc	dx, 0
		and	ax, 0FFF0h

loc_3FAFC:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+BBj
		push	dx
		push	ax
		mov	cx, dx
		mov	dx, ax
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		mov	cx, 10h
		call	VROOMM_ReadFileExact_3FCF3
		pop	ax
		pop	dx
		mov	cx, 0FFFDh
		jb	short loc_3FAB8
		add	ax, 10h
		adc	dx, 0
		cmp	[bp+var_14], 4246h
		mov	cx, 0FFFCh
		jz	short loc_3FB26
		jmp	short loc_3FAB8
; ���������������������������������������������������������������������������

loc_3FB26:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+AAj
		cmp	[bp+var_12], 564Fh
		jz	short loc_3FB35
		add	ax, [bp+var_10]
		adc	dx, [bp+var_E]
		jmp	short loc_3FAFC
; ���������������������������������������������������������������������������

loc_3FB35:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+B3j
		mov	word_416A4, ax
		mov	word_416A6, dx
		mov	es, cs:seg_3FA6F
		assume es:dseg
		mov	ax, [bp+var_10]
		mov	es:word_488D8, ax
		mov	ax, [bp+var_E]
		mov	es:word_488DA, ax
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		mov	word_416B8, 0
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_3FBA8
		mov	ax, [bp+arg_6]
		inc	ax
		mov	word_416B4, ax
		mov	word_416B0, ax
		mov	bx, [bp+arg_4]
		mov	word_416B6, bx
		call	VROOMM_ScanFreeMemoryBlocks_3FD03
		mov	bx, word_416B6
		sub	bx, word_416B4
		cmp	bx, word_416AA
		jnb	short loc_3FB86
		mov	cx, 0FFFBh
		jmp	loc_3FAB8
; ���������������������������������������������������������������������������

loc_3FB86:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+106j
		shr	bx, 1
		shr	bx, 1
		mov	word_416A8, bx
		call	VROOMM_ScanMemoryArena_3FD83
		jnb	short loc_3FB9D
		mov	bx, word_416B8
		mov	cx, 0FFFFh
		jmp	short loc_3FB9F
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_3FB9D:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+16j
					; VROOMM_OpenAndParseOverlayFile_3FA78+119j
		xor	ax, ax

loc_3FB9F:				; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+3Dj
					; VROOMM_OpenAndParseOverlayFile_3FA78+47j ...
		pop	di
		pop	si
		pop	ds
		assume ds:dseg
		mov	sp, bp
		pop	bp
		retf	8
VROOMM_OpenAndParseOverlayFile_3FA78	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_InstallIntHandler_68384 (sub_68384 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_Helper_68384' (nom de notre base) ; renommee par la session musique (archive
; handoff 2026-10-06). far - installe le VECTEUR D'INTERRUPTION DOS propre a VROOMM (INT 21h
; fonction 25h SET INTERRUPT VECTOR, sauvegarde l'ancien via fonction 35h GET INTERRUPT
; VECTOR) - c'est le point d'ancrage qui permet au moteur d'intercepter des appels pour
; charger les overlays a la demande. Ouvre aussi (ou ferme) le fichier d'overlay lui-meme (DOS
; INT 21h AH=3Dh).
; ==============================================================================================
VROOMM_InstallIntHandler_3FBA8	proc far		; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+E3p
					; seg166:01ADp
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:seg_3FA6D
		assume ds:seg170
		mov	al, byte ptr word_416A0+1
		mov	ah, 35h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		push	es
		push	bx
		push	ds
		mov	al, byte ptr word_416A0+1
		mov	dx, word_41602
		mov	ds, seg_41604
		assume ds:seg166
		mov	ah, 25h
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		assume ds:dseg
		pop	word_43022
		pop	word_43024
		cmp	word_430D8, 0
		jz	short loc_3FBEA
		mov	bx, word_430D8
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		mov	word_430D8, 0
		jmp	short loc_3FBF8
; ���������������������������������������������������������������������������

loc_3FBEA:				; CODE XREF: VROOMM_InstallIntHandler_3FBA8+30j
		lea	dx, a1991BorlandInt ; "1991 Borland Intl."
		mov	ah, 3Dh	; '='
		mov	al, byte_43026
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read, 1 -	write, 2 - read	& write
		mov	word_430D8, ax

loc_3FBF8:				; CODE XREF: VROOMM_InstallIntHandler_3FBA8+40j
		pop	ds
		pop	bp
		retf
VROOMM_InstallIntHandler_3FBA8	endp

; ���������������������������������������������������������������������������

loc_3FBFB:				; DATA XREF: dseg:5A00o
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:seg_3FA6D
		assume ds:seg170
		cmp	word_416B8, 0
		jz	short loc_3FC10
		nop
		push	cs
		call	near ptr VROOMM_InstallIntHandler_3FBA8

loc_3FC10:				; CODE XREF: seg166:01A9j
		push	cs
		call	off_41614
		push	cs
		call	off_41612
		pop	ds
		assume ds:dseg
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_SearchPathAndOpen_683F9 (sub_683F9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_CheckCopyright_683F9' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - essaie d'ouvrir le fichier directement (chemin fourni
; tel quel), sinon delegue a VROOMM_SearchPathEnvAndOpen_68405 pour chercher dans PATH.
; ==============================================================================================
VROOMM_SearchPathAndOpen_3FC1D	proc near		; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78:loc_3FAA8p
		push	ds
		lea	di, a1991BorlandInt ; "1991 Borland Intl."
		push	ds
		pop	es
		call	VROOMM_TryOpenFile_3FCCB
		pop	ds
		retn
VROOMM_SearchPathAndOpen_3FC1D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_SearchPathEnvAndOpen_68405 (sub_68405 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_CheckDOSVersionAndOpen_68405' (nom de notre base) ; renommee par la session
; musique (archive handoff 2026-10-06). near - implemente l'algorithme classique DOS de
; RECHERCHE DE FICHIER VIA LA VARIABLE D'ENVIRONNEMENT PATH : parcourt le bloc d'environnement
; (deux chaines ASCIIZ ignorees en tete, probable COMSPEC), cherche l'entree commencant par
; 'PATH=' (verifiee par VROOMM_MatchPathPrefix_6844A), construit un chemin complet
; (repertoire+'\'+nom de fichier) pour chaque repertoire liste, tente l'ouverture
; (VROOMM_TryOpenFile_684A7) jusqu'a succes.
; ==============================================================================================
VROOMM_SearchPathEnvAndOpen_3FC29	proc near		; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78:loc_3FA91p
		mov	ah, 30h
		int	21h		; DOS -	GET DOS	VERSION
					; Return: AL = major version number (00h for DOS 1.x)
		cmp	al, 3
		jb	short locret_3FC6D
		mov	byte_43026, 20h	; ' '
		push	ds
		mov	ax, seg	dseg
		mov	ds, ax
		mov	ds, word_43138
		xor	si, si
		cld

loc_3FC43:				; CODE XREF: VROOMM_SearchPathEnvAndOpen_3FC29+1Dj
					; VROOMM_SearchPathEnvAndOpen_3FC29+22j
		lodsb
		or	al, al
		jnz	short loc_3FC43
		lodsb
		or	al, al
		jnz	short loc_3FC43
		lodsw
		lea	di, a1991BorlandInt ; "1991 Borland Intl."
		mov	ax, seg	seg170
		mov	es, ax
		assume es:seg170
		mov	bx, di

loc_3FC59:				; CODE XREF: VROOMM_SearchPathEnvAndOpen_3FC29+38j
					; VROOMM_SearchPathEnvAndOpen_3FC29+3Cj
		lodsb
		stosb
		or	al, al
		jz	short loc_3FC67
		cmp	al, 5Ch	; '\'
		jnz	short loc_3FC59
		mov	bx, di
		jmp	short loc_3FC59
; ���������������������������������������������������������������������������

loc_3FC67:				; CODE XREF: VROOMM_SearchPathEnvAndOpen_3FC29+34j
		mov	di, bx
		call	VROOMM_TryOpenFile_3FCCB
		pop	ds

locret_3FC6D:				; CODE XREF: VROOMM_SearchPathEnvAndOpen_3FC29+6j
		retn
VROOMM_SearchPathEnvAndOpen_3FC29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_MatchPathPrefix_6844A (sub_6844A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_ReadHeader_6844A' (nom de notre base) ; renommee par la session musique (archive
; handoff 2026-10-06). near - compare les 5 premiers octets de l'entree d'environnement
; courante contre la chaine litterale 'PATH=' (donnee brute byte_6824D). Si correspondance,
; construit le chemin complet avec le repertoire trouve + nom de fichier, essaie l'ouverture.
; Sinon avance a l'entree d'environnement suivante.
; ==============================================================================================
VROOMM_MatchPathPrefix_3FC6E	proc near		; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+35p
		push	ds
		mov	ax, seg	dseg
		mov	ds, ax
		mov	ds, word_43138
		xor	si, si

loc_3FC7A:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+21j
		mov	di, 11h
		push	cs
		pop	es
		assume es:seg166
		mov	cx, 5
		cld
		repe cmpsb
		jz	short loc_3FC94
		dec	si

loc_3FC88:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+1Dj
		lodsb
		or	al, al
		jnz	short loc_3FC88
		cmp	al, [si]
		jnz	short loc_3FC7A

loc_3FC91:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+29j
		pop	ds
		stc
		retn
; ���������������������������������������������������������������������������

loc_3FC94:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+17j
					; VROOMM_MatchPathPrefix_3FC6E+59j
		cmp	byte ptr [si], 0
		jz	short loc_3FC91
		lea	di, a1991BorlandInt ; "1991 Borland Intl."
		mov	ax, seg	seg170
		mov	es, ax
		assume es:seg170
		xor	al, al

loc_3FCA4:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+42j
		mov	ah, al
		lodsb
		or	al, al
		jz	short loc_3FCB2
		cmp	al, 3Bh	; ';'
		jz	short loc_3FCB3
		stosb
		jmp	short loc_3FCA4
; ���������������������������������������������������������������������������

loc_3FCB2:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+3Bj
		dec	si

loc_3FCB3:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+3Fj
		cmp	ah, 3Ah	; ':'
		jz	short loc_3FCC0
		cmp	ah, 5Ch	; '\'
		jz	short loc_3FCC0
		mov	al, 5Ch	; '\'
		stosb

loc_3FCC0:				; CODE XREF: VROOMM_MatchPathPrefix_3FC6E+48j
					; VROOMM_MatchPathPrefix_3FC6E+4Dj
		push	ds
		push	si
		call	VROOMM_TryOpenFile_3FCCB
		pop	si
		pop	ds
		jb	short loc_3FC94
		pop	ds
		retn
VROOMM_MatchPathPrefix_3FC6E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_TryOpenFile_684A7 (sub_684A7 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_OpenFile_684A7' (nom de notre base) ; renommee par la session musique (archive
; handoff 2026-10-06). near - copie un nom de fichier optionnel (argument far) dans un buffer,
; puis appelle DOS INT 21h AH=3Dh (OPEN DISK FILE WITH HANDLE) avec le mode d'acces configure
; (byte_69DE6).
; ==============================================================================================
VROOMM_TryOpenFile_3FCCB	proc near		; CODE XREF: VROOMM_SearchPathAndOpen_3FC1D+7p
					; VROOMM_SearchPathEnvAndOpen_3FC29+40p ...
		lds	si, [bp+6]
		mov	ax, ds
		or	ax, si
		jz	short loc_3FCE2
		mov	cx, 0Ch

loc_3FCD7:				; CODE XREF: VROOMM_TryOpenFile_3FCCB+12j
		lodsb
		stosb
		or	al, al
		jz	short loc_3FCE2
		loop	loc_3FCD7
		sub	al, al
		stosb

loc_3FCE2:				; CODE XREF: VROOMM_TryOpenFile_3FCCB+7j
					; VROOMM_TryOpenFile_3FCCB+10j
		lea	dx, a1991BorlandInt ; "1991 Borland Intl."
		mov	ax, seg	seg170
		mov	ds, ax
		assume ds:seg170
		mov	ah, 3Dh	; '='
		mov	al, byte_41606
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read
		retn
VROOMM_TryOpenFile_3FCCB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_ReadFileExact_684CF (sub_684CF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_CloseFile_684CF' (nom de notre base) ;
; renommee par la session musique (archive handoff 2026-10-06). near - DOS INT 21h AH=3Fh
; (READ FROM FILE), verifie que le nombre d'octets lus correspond exactement a la demande
; (detecte une lecture partielle/EOF premature comme une erreur).
; ==============================================================================================
VROOMM_ReadFileExact_3FCF3	proc near		; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+53p
					; VROOMM_OpenAndParseOverlayFile_3FA78+92p
		push	ds
		lea	dx, [bp-14h]
		push	ss
		pop	ds
		assume ds:dseg
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jb	short locret_3FD02
		cmp	ax, cx

locret_3FD02:				; CODE XREF: VROOMM_ReadFileExact_3FCF3+Bj
		retn
VROOMM_ReadFileExact_3FCF3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_ScanFreeMemoryBlocks_684DF (sub_684DF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_ReadAndParseHeader_684DF' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - parcourt une table de descripteurs memoire (base
; seg339+0x6D16E, stride 8 octets, jusqu'a 0xC08/8=385 entrees) cherchant des blocs
; reutilisables/libres pour l'allocation d'overlay, calcule la meilleure correspondance de
; taille (bx = meilleur candidat).
; ==============================================================================================
VROOMM_ScanFreeMemoryBlocks_3FD03	proc near		; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+F7p
					; seg166:08FBp
		mov	ax, seg	dseg
		mov	es, ax
		assume es:dseg
		mov	ax, es:word_4313C
		add	ax, 10h
		mov	cs:word_3FA76, ax
		mov	ax, 416Ah
		mov	es, ax
		assume es:nothing
		xor	bx, bx
		xor	di, di
		lea	si, unk_430E0

loc_3FD20:				; CODE XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+74j
		test	word ptr [si+4], 2
		jz	short loc_3FD2D
		cmp	word ptr [si+2], 0
		jnz	short loc_3FD30

loc_3FD2D:				; CODE XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+22j
		jmp	short loc_3FD6E
; ���������������������������������������������������������������������������
		align 2

loc_3FD30:				; CODE XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+28j
		mov	ax, [si]
		push	es
		mov	es:12h,	ax
		mov	es, ax
		assume es:nothing
		cmp	byte ptr es:1Ah, 0FFh
		jnz	short loc_3FD4C
		pop	es
		mov	word ptr es:12h, 0
		jmp	short loc_3FD6E
; ���������������������������������������������������������������������������
		align 2

loc_3FD4C:				; CODE XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+3Cj
		pop	ax
		mov	word ptr es:18h, 4CEh
		mov	ax, word_430C4
		mov	dx, word_430C6
		add	es:4, ax
		adc	es:6, dx
		call	VROOMM_ComputeSegmentSpan_40215
		cmp	bx, dx
		jnb	short loc_3FD6E
		xchg	bx, dx

loc_3FD6E:				; CODE XREF: VROOMM_ScanFreeMemoryBlocks_3FD03:loc_3FD2Dj
					; VROOMM_ScanFreeMemoryBlocks_3FD03+46j ...
		add	si, 8
		cmp	si, 8D8h
		jnb	short loc_3FD79
		jmp	short loc_3FD20
; ���������������������������������������������������������������������������

loc_3FD79:				; CODE XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+72j
		xor	ax, ax
		add	bx, 2
		mov	word_430CA, bx
		retn
VROOMM_ScanFreeMemoryBlocks_3FD03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_ScanMemoryArena_6855F (sub_6855F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_AllocateAndRelocate_6855F' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - PARCOURT LA CHAINE MCB DOS (Memory Control Block, la
; structure standard DOS de gestion memoire par blocs de paragraphes) pour determiner la
; memoire totale disponible pour les overlays. Pour chaque bloc libre assez grand, appelle des
; sous-routines de decoupage/preparation (VROOMM_ReadRawSegment_6862C,
; VROOMM_ApplyRelocationsToBlock_68665, VROOMM_PatchFarCallStub_688D7).
; ==============================================================================================
VROOMM_ScanMemoryArena_3FD83	proc near		; CODE XREF: VROOMM_OpenAndParseOverlayFile_3FA78+116p
		mov	cx, word_430D2
		mov	word_430DC, cx
		mov	bx, cx
		mov	si, word_430D4
		mov	di, word_430D6
		push	ds

loc_3FD96:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+47j
		mov	ds, cx
		assume ds:seg000
		mov	cx, word ptr loc_10+2
		jcxz	short loc_3FDCC
		mov	es, cx
		assume es:nothing
		mov	ax, es:4
		mov	dx, es:6
		sub	ax, word ptr loc_3+1
		sbb	dx, word ptr loc_3+3
		mov	cx, 10h
		div	cx
		add	ax, si
		cmp	ax, di
		ja	short loc_3FDCC
		mov	word ptr loc_10, si
		mov	si, ax
		mov	cx, es
		mov	word ptr loc_19+3, cx
		mov	bx, ds
		jmp	short loc_3FD96
; ���������������������������������������������������������������������������

loc_3FDCC:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+19j
					; VROOMM_ScanMemoryArena_3FD83+37j
		mov	ds, bx
		mov	word ptr loc_19+3, 0
		pop	ds
		assume ds:dseg
		mov	word_430D0, si
		mov	ax, word_430D4
		sub	si, ax
		jnz	short loc_3FDE3
		jmp	short loc_3FE41
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_3FDE3:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+5Bj
		mov	cl, 4
		rol	si, cl
		mov	di, si
		and	di, 0Fh
		and	si, 0FFF0h
		mov	es, word_430DC
		assume es:nothing
		mov	dx, es:4
		mov	cx, es:6
		call	VROOMM_ReadRawSegment_3FE50
		jb	short locret_3FE42
		mov	ax, word_430DC
		push	ds

loc_3FE06:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+BBj
		mov	es, ax
		mov	cx, es:0Ah
		jcxz	short loc_3FE12
		call	VROOMM_ApplyRelocationsToBlock_3FE89

loc_3FE12:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+8Aj
		cmp	word ptr es:0Ch, 0
		jz	short loc_3FE1D
		call	VROOMM_PatchFarCallStub_400FB

loc_3FE1D:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+95j
		mov	ax, es:10h
		dec	ax
		mov	ds, ax
		mov	word_4302E, es
		push	es
		mov	ax, 0FFFFh
		mov	bx, ax
		mov	ds, cs:seg_3FA6D
		assume ds:seg170
		call	off_41616
		pop	es
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_3FE06
		pop	ds
		assume ds:dseg

loc_3FE41:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+5Dj
		clc

locret_3FE42:				; CODE XREF: VROOMM_ScanMemoryArena_3FD83+7Dj
		retn
VROOMM_ScanMemoryArena_3FD83	endp

; ���������������������������������������������������������������������������
		mov	cl, 4
		shr	ax, cl
		ror	dx, cl
		and	dx, 0F000h
		or	ax, dx
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_ReadRawSegment_6862C (sub_6862C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_SkipRelocationsA_6862C' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - positionne le pointeur de fichier (DOS INT 21h AH=42h
; LSEEK) puis lit des blocs de donnees brutes (DOS INT 21h AH=3Fh) directement dans la memoire
; allouee pour un segment d'overlay, par blocs de 0xFFF0 octets max (limite de segment 64Ko),
; en avancant le pointeur de segment de destination entre chaque bloc.
; ==============================================================================================
VROOMM_ReadRawSegment_3FE50	proc near		; CODE XREF: VROOMM_ScanMemoryArena_3FD83+7Ap
					; seg166:04EBp
		push	ax
		mov	bx, word_430D8
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		pop	ax
		push	ds
		mov	ds, ax
		jmp	short loc_3FE67
; ���������������������������������������������������������������������������

loc_3FE60:				; CODE XREF: VROOMM_ReadRawSegment_3FE50+35j
		mov	ax, ds
		add	ax, 0FFFh
		mov	ds, ax
		assume ds:nothing

loc_3FE67:				; CODE XREF: VROOMM_ReadRawSegment_3FE50+Ej
		mov	cx, 0FFF0h
		or	di, di
		jnz	short loc_3FE70
		mov	cx, si

loc_3FE70:				; CODE XREF: VROOMM_ReadRawSegment_3FE50+1Cj
		xor	dx, dx
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		jb	short loc_3FE87
		cmp	ax, cx
		jb	short loc_3FE87
		sub	si, ax
		sbb	di, 0
		mov	ax, si
		or	ax, di
		jnz	short loc_3FE60

loc_3FE87:				; CODE XREF: VROOMM_ReadRawSegment_3FE50+26j
					; VROOMM_ReadRawSegment_3FE50+2Aj
		pop	ds
		assume ds:dseg
		retn
VROOMM_ReadRawSegment_3FE50	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_ApplyRelocationsToBlock_68665 (sub_68665 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_SkipRelocationsB_68665' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - applique une TABLE DE RELOCATION (format standard EXE
; DOS : paires offset/segment) sur du code fraichement charge, patchant les adresses absolues
; embarquees selon le segment reel de chargement. Delegue a VROOMM_PatchFarJumpOpcode_686AA
; pour la reconnaissance/patch d'instructions specifiques.
; ==============================================================================================
VROOMM_ApplyRelocationsToBlock_3FE89	proc near		; CODE XREF: VROOMM_ScanMemoryArena_3FD83+8Cp
					; seg166:04F7p
		push	ds
		push	es
		mov	ax, es:8
		mov	si, ax
		and	si, 0Fh
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		mov	dx, es:10h
		add	ax, dx
		mov	ds, ax
		mov	es, dx
		shr	cx, 1
		cld

loc_3FEAA:				; CODE XREF: VROOMM_ApplyRelocationsToBlock_3FE89+40j
		lodsw
		mov	bx, ax
		mov	di, es:[bx]
		push	ds
		mov	ax, 416Ch
		mov	ds, ax
		assume ds:nothing
		mov	ax, di
		and	di, 0FFF8h
		mov	dx, [di]
		mov	es:[bx], dx
		test	ax, 1
		jz	short loc_3FEC8
		call	VROOMM_PatchFarJumpOpcode_3FECE

loc_3FEC8:				; CODE XREF: VROOMM_ApplyRelocationsToBlock_3FE89+3Aj
		pop	ds
		assume ds:dseg
		loop	loc_3FEAA
		pop	es
		pop	ds
		retn
VROOMM_ApplyRelocationsToBlock_3FE89	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_PatchFarJumpOpcode_686AA (sub_686AA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_Helper3_686AA' (nom de notre base) ;
; renommee par la session musique (archive handoff 2026-10-06). near - reconnait des sequences
; d'opcodes x86 specifiques (0xB8=MOV AX,imm16 et 0x50='PUSH AX', motif d'appel indirect via
; registre) dans le code fraichement charge et les associe a une entree de table de stubs
; (off_6D0BC) - mecanisme de PATCH D'ADRESSAGE POUR LES APPELS INTER-OVERLAY.
; ==============================================================================================
VROOMM_PatchFarJumpOpcode_3FECE	proc near		; CODE XREF: VROOMM_ApplyRelocationsToBlock_3FE89+3Cp
		push	cx
		mov	ds, dx
		mov	ah, es:[bx-1]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 0B8h ; '�'
		jnz	short loc_3FF2A
		mov	cx, ax
		mov	ah, es:[bx+2]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 50h	; 'P'
		jnz	short loc_3FF2A
		cmp	al, cl
		jnz	short loc_3FF2A
		mov	dx, ax
		mov	ah, es:[bx+3]
		mov	al, ah
		and	ax, 0F807h
		cmp	cx, ax
		jnz	short loc_3FF2A
		mov	ah, es:[bx+6]
		mov	al, ah
		and	ax, 0F807h
		cmp	ax, dx
		jnz	short loc_3FF2A
		mov	di, 20h	; ' '
		mov	cx, word_4302C
		mov	ax, es:[bx+4]

loc_3FF1A:				; CODE XREF: VROOMM_PatchFarJumpOpcode_3FECE+54j
		cmp	ax, [di+2]
		jz	short loc_3FF26
		add	di, 5
		loop	loc_3FF1A
		jmp	short loc_3FF2C
; ���������������������������������������������������������������������������

loc_3FF26:				; CODE XREF: VROOMM_PatchFarJumpOpcode_3FECE+4Fj
		mov	es:[bx+4], di

loc_3FF2A:				; CODE XREF: VROOMM_PatchFarJumpOpcode_3FECE+Fj
					; VROOMM_PatchFarJumpOpcode_3FECE+1Fj ...
		pop	cx
		retn
; ���������������������������������������������������������������������������

loc_3FF2C:				; CODE XREF: VROOMM_PatchFarJumpOpcode_3FECE+56j
		pop	cx
		retn
VROOMM_PatchFarJumpOpcode_3FECE	endp

; ���������������������������������������������������������������������������
		mov	si, es:8
		xor	di, di
		add	si, es:0Ah
		adc	di, 0
		mov	dx, es:4
		mov	cx, es:6
		mov	ax, es:10h
		call	VROOMM_ReadRawSegment_3FE50
		jb	short locret_3FF5B
		mov	cx, es:0Ah
		jcxz	short loc_3FF5A
		call	VROOMM_ApplyRelocationsToBlock_3FE89

loc_3FF5A:				; CODE XREF: seg166:04F5j
		clc

locret_3FF5B:				; CODE XREF: seg166:04EEj
		retn
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		test	bp, 1
		jz	short loc_3FF6A
		jmp	far ptr	loc_30B5
; ���������������������������������������������������������������������������

loc_3FF6A:				; CODE XREF: seg166:0503j
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	ds
		push	es
		mov	ax, seg	seg170
		mov	ds, ax
		assume ds:seg170
		sti
		les	bx, [bp+2]
		push	word ptr es:[bx]
		sub	word ptr [bp+2], 2
		jnz	short loc_3FF89
		call	VROOMM_DemandLoadDispatch_4000C
		jmp	short loc_3FFA1
; ���������������������������������������������������������������������������

loc_3FF89:				; CODE XREF: seg166:0522j
		add	bp, 6
		mov	ax, [bp+0]
		xchg	ax, [bp-6]
		mov	[bp+0],	ax
		call	VROOMM_DemandLoadDispatch_4000C
		mov	ax, [bp+0]
		xchg	ax, [bp-6]
		mov	[bp+0],	ax

loc_3FFA1:				; CODE XREF: seg166:0527j
		pop	bx
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:seg_3FA6D
		call	off_41616
		pop	es
		pop	ds
		assume ds:dseg
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		pop	bp
		iret

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_LoadOnDemandCore_6879E (sub_6879E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_AllocateAndFinalize_6879E' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - COEUR DE LA LOGIQUE DE CHARGEMENT A LA DEMANDE :
; incremente un compteur de chargement (word_6D16A), calcule si le segment demande est deja en
; memoire (VROOMM_ComputeAvailableOffset_689C9) ou doit etre charge/remplace (LRU - libere le
; segment le moins recemment utilise via VROOMM_EvictOldestBlock_6887B si necessaire).
; ==============================================================================================
VROOMM_LoadOnDemandCore_3FFC2	proc near		; CODE XREF: VROOMM_DemandLoadDispatch_4000C+21p
		push	es
		inc	word_430DA
		call	VROOMM_ComputeSegmentSpan_40215
		jmp	short loc_3FFFA
; ���������������������������������������������������������������������������

loc_3FFCC:				; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+3Ej
		popf
		push	dx
		jnb	short loc_3FFD3
		call	VROOMM_EvictOldestBlock_4009F

loc_3FFD3:				; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+Cj
		mov	es, word_430DC
		mov	ax, es:1Ch
		mov	word_430DC, ax
		cmp	byte ptr es:1Bh, 0
		jnz	short loc_3FFEE
		call	VROOMM_FinalizeLoadedSegment_40087
		call	VROOMM_ComputeParagraphCount_40209
		jmp	short loc_3FFF9
; ���������������������������������������������������������������������������

loc_3FFEE:				; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+22j
		dec	byte ptr es:1Bh
		call	VROOMM_CopyAndRelocateBlock_4014C
		call	VROOMM_UpdateFreeListOffset_4019D

loc_3FFF9:				; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+2Aj
		pop	dx

loc_3FFFA:				; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+8j
		call	VROOMM_ComputeAvailableOffset_401ED
		pushf
		cmp	dx, ax
		ja	short loc_3FFCC
		popf
		pop	es
		mov	ax, word_430D0
		mov	es:10h,	ax
		retn
VROOMM_LoadOnDemandCore_3FFC2	endp ; sp =  2


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_DemandLoadDispatch_687E8 (sub_687E8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_ApplyRelocationsMain_687E8' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - dispatche entre chargement immediat et differe selon
; l'etat du segment demande (drapeaux es:0x1A/es:0x1B), gere le compteur de recharge
; (seg_6D15C), et la boucle de recherche parmi les segments actuellement charges pour trouver
; ou placer le nouveau.
; ==============================================================================================
VROOMM_DemandLoadDispatch_4000C	proc near		; CODE XREF: seg166:0524p seg166:0535p ...

; FUNCTION CHUNK AT 30B5 SIZE 0000001D BYTES

		inc	word_430CC
		cmp	word ptr es:10h, 0
		jz	short loc_40027
		mov	byte ptr es:1Bh, 1
		or	byte ptr es:1Ah, 4
		jmp	short loc_40043
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_40027:				; CODE XREF: VROOMM_DemandLoadDispatch_4000C+Aj
		or	byte ptr es:1Ah, 8
		call	VROOMM_LoadOnDemandCore_3FFC2
		push	ds
		dec	ax
		mov	ds, ax
		mov	word_4302E, es
		pop	ds
		call	word ptr es:18h
		jb	short loc_40082
		call	VROOMM_UpdateFreeListOffset_4019D

loc_40043:				; CODE XREF: VROOMM_DemandLoadDispatch_4000C+18j
		call	VROOMM_MaybePatchCallSite_400DA
		mov	al, es:1Ah
		and	al, 3
		add	es:1Bh,	al
		push	es
		call	VROOMM_ComputeAvailableOffset_401ED
		mov	es, word_430DC

loc_40059:				; CODE XREF: VROOMM_DemandLoadDispatch_4000C+72j
		mov	cx, es:1Ch
		jcxz	short loc_40080
		cmp	ax, word_430C8
		jnb	short loc_40080
		push	cx
		push	ax
		cmp	byte ptr es:1Bh, 0
		jz	short loc_40074
		xor	ax, ax
		jmp	short loc_4007A
; ���������������������������������������������������������������������������

loc_40074:				; CODE XREF: VROOMM_DemandLoadDispatch_4000C+62j
		call	VROOMM_PatchIntCallStub_40119
		call	VROOMM_ComputeParagraphCount_40209

loc_4007A:				; CODE XREF: VROOMM_DemandLoadDispatch_4000C+66j
		pop	cx
		pop	es
		add	ax, cx
		jmp	short loc_40059
; ���������������������������������������������������������������������������

loc_40080:				; CODE XREF: VROOMM_DemandLoadDispatch_4000C+52j
					; VROOMM_DemandLoadDispatch_4000C+58j
		pop	es
		retn
; ���������������������������������������������������������������������������

loc_40082:				; CODE XREF: VROOMM_DemandLoadDispatch_4000C+32j
		jmp	far ptr	loc_30B5
VROOMM_DemandLoadDispatch_4000C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_FinalizeLoadedSegment_68863 (sub_68863 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_CheckImageHasTrailer_68863' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - appelle VROOMM_PatchFarCallStub_688F5 puis, si un
; marqueur particulier (0x4CA) est present, un gestionnaire externe additionnel (off_6D0C0) -
; finalise l'etat d'un segment nouvellement charge.
; ==============================================================================================
VROOMM_FinalizeLoadedSegment_40087	proc near		; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+24p
		call	VROOMM_PatchIntCallStub_40119
		cmp	word ptr es:18h, 4CEh
		jnz	short loc_40097
		call	word_43030

loc_40097:				; CODE XREF: VROOMM_FinalizeLoadedSegment_40087+Aj
		mov	word ptr es:10h, 0
		retn
VROOMM_FinalizeLoadedSegment_40087	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_EvictOldestBlock_6887B (sub_6887B de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_PatchFarJumpTable_6887B' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - implemente une politique D'EVICTION LRU (least-
; recently-used) : parcourt tous les blocs actuellement charges, en libere autant que
; necessaire pour faire de la place au nouveau chargement demande.
; ==============================================================================================
VROOMM_EvictOldestBlock_4009F	proc near		; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+Ep
		mov	ax, word_430DC
		xor	cx, cx

loc_400A4:				; CODE XREF: VROOMM_EvictOldestBlock_4009F+Fj
		inc	cx
		push	ax
		mov	es, ax
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_400A4
		mov	word_430DC, ax
		mov	ax, word_430D6
		mov	word_430D0, ax

loc_400B9:				; CODE XREF: VROOMM_EvictOldestBlock_4009F+32j
		pop	es
		push	cx
		mov	ax, word_430DC
		mov	es:1Ch,	ax
		mov	word_430DC, es
		call	VROOMM_ComputeParagraphCount_40209
		sub	word_430D0, ax
		call	VROOMM_CopyAndRelocateBlock_4014C
		pop	cx
		loop	loc_400B9
		mov	ax, word_430D4
		mov	word_430D0, ax
		retn
VROOMM_EvictOldestBlock_4009F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_MaybePatchCallSite_688B6 (sub_688B6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_ConditionalPatchTrampoline_688B6' (nom
; de notre base) ; renommee par la session musique (archive handoff 2026-10-06). near -
; verifie le type d'instruction au site d'appel (0xEA=JMP FAR direct) et delegue soit a
; VROOMM_PatchFarCallStub_688D7 (creation de stubs de saut far) soit a
; VROOMM_LookupOrRegisterOffset_68997.
; ==============================================================================================
VROOMM_MaybePatchCallSite_400DA	proc near		; CODE XREF: VROOMM_DemandLoadDispatch_4000C:loc_40043p
		cmp	word ptr es:0Ch, 0
		jnz	short loc_400E3
		retn
; ���������������������������������������������������������������������������

loc_400E3:				; CODE XREF: VROOMM_MaybePatchCallSite_400DA+6j
		cmp	byte ptr es:20h, 0EAh ;	'�'
		jz	short locret_40118
		mov	cx, es:2
		jcxz	short VROOMM_PatchFarCallStub_400FB
		mov	ax, es:10h
		mov	dx, es
		call	VROOMM_LookupOrRegisterOffset_401BB
VROOMM_MaybePatchCallSite_400DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_PatchFarCallStub_688D7 (sub_688D7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_PatchFarJumpTable_688D7' (nom de notre
; base) ; renommee par la session musique (archive handoff 2026-10-06). near - genere
; dynamiquement du CODE MACHINE X86 BRUT (ecrit l'opcode 0xEA = JMP FAR direct suivi de
; l'offset/segment cible) dans la table de stubs - c'est le mecanisme qui cree les thunks
; VROOMM_StubThunk_XXXX rencontres partout ailleurs dans le desassemblage.
; ==============================================================================================
VROOMM_PatchFarCallStub_400FB	proc near		; CODE XREF: VROOMM_ScanMemoryArena_3FD83+97p
					; VROOMM_MaybePatchCallSite_400DA+16j
		mov	bx, es:10h
		mov	cx, es:0Ch
		mov	di, 20h	; ' '
		cld

loc_40109:				; CODE XREF: VROOMM_PatchFarCallStub_400FB+1Bj
		mov	dx, es:[di+2]
		mov	al, 0EAh ; '�'
		stosb
		mov	ax, dx
		stosw
		mov	ax, bx
		stosw
		loop	loc_40109

locret_40118:				; CODE XREF: VROOMM_MaybePatchCallSite_400DA+Fj
		retn
VROOMM_PatchFarCallStub_400FB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_PatchIntCallStub_688F5 (sub_688F5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_PatchIntTrampoline_688F5' (nom de notre
; base) ; renommee par la session musique (archive handoff 2026-10-06). near - variante
; generant des STUBS BASES SUR INT (ecrit l'opcode 0xCD = INT n) plutot que des sauts far
; directs, pour les points d'entree necessitant le mecanisme d'interruption plutot qu'un jmp
; far.
; ==============================================================================================
VROOMM_PatchIntCallStub_40119	proc near		; CODE XREF: VROOMM_DemandLoadDispatch_4000C:loc_40074p
					; VROOMM_FinalizeLoadedSegment_40087p
		cmp	byte ptr es:20h, 0CDh ;	'�'
		jz	short locret_4014B
		mov	ax, es
		mov	dx, es:10h
		xor	cx, cx
		call	VROOMM_LookupOrRegisterOffset_401BB
		mov	es:2, cx
		mov	cx, es:0Ch
		mov	di, 20h	; ' '
		cld

loc_4013B:				; CODE XREF: VROOMM_PatchIntCallStub_40119+30j
		mov	dx, es:[di+1]
		mov	ax, word_430C0
		stosw
		mov	ax, dx
		stosw
		xor	al, al
		stosb
		loop	loc_4013B

locret_4014B:				; CODE XREF: VROOMM_PatchIntCallStub_40119+6j
		retn
VROOMM_PatchIntCallStub_40119	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_CopyAndRelocateBlock_68928 (sub_68928 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_MoveImageAndFixup_68928' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - copie un bloc de memoire (rep movsw, avec support de
; copie en sens inverse via std/cld pour les chevauchements) entre deux zones, utilise pendant
; la compaction/reorganisation des segments d'overlay charges.
; ==============================================================================================
VROOMM_CopyAndRelocateBlock_4014C	proc near		; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+31p
					; VROOMM_EvictOldestBlock_4009F+2Ep
		mov	ax, word_430D0
		mov	dx, es:10h
		mov	es:10h,	ax
		mov	cx, es:8
		inc	cx
		shr	cx, 1
		xor	si, si
		cld
		cmp	ax, dx
		jb	short loc_4016D
		mov	si, cx
		dec	si
		shl	si, 1
		std

loc_4016D:				; CODE XREF: VROOMM_CopyAndRelocateBlock_4014C+19j
		mov	di, si
		push	ds
		push	es
		mov	ds, dx
		mov	es, ax
		rep movsw
		cld
		dec	ax
		mov	ds, ax
		pop	es
		mov	word_4302E, es
		inc	ax
		pop	ds
		cmp	byte ptr es:20h, 0CDh ;	'�'
		jz	short locret_4019C
		call	VROOMM_FindOffsetInTable_401C7
		mov	cx, es:0Ch
		mov	di, 23h	; '#'
		cld

loc_40196:				; CODE XREF: VROOMM_CopyAndRelocateBlock_4014C+4Ej
		stosw
		add	di, 3
		loop	loc_40196

locret_4019C:				; CODE XREF: VROOMM_CopyAndRelocateBlock_4014C+3Cj
		retn
VROOMM_CopyAndRelocateBlock_4014C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_UpdateFreeListOffset_68979 (sub_68979 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_AdvanceLoadPointer_68979' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). near - met a jour le pointeur courant dans la table de blocs
; libres (off_6D15E) apres une operation d'allocation/liberation, cherchant le prochain
; emplacement disponible dans la table.
; ==============================================================================================
VROOMM_UpdateFreeListOffset_4019D	proc near		; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+34p
					; VROOMM_DemandLoadDispatch_4000C+34p
		call	VROOMM_ComputeParagraphCount_40209
		add	word_430D0, ax
		push	ds
		mov	ax, 416Ah

loc_401A8:				; CODE XREF: VROOMM_UpdateFreeListOffset_4019D+12j
		mov	ds, ax
		assume ds:nothing
		mov	ax, ds:1Ch
		or	ax, ax
		jnz	short loc_401A8
		mov	word ptr ds:1Ch, es
		mov	es:1Ch,	ax
		pop	ds
		assume ds:dseg
		retn
VROOMM_UpdateFreeListOffset_4019D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_LookupOrRegisterOffset_68997 (sub_68997 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_PatchRelocationEntry_68997' (nom de
; notre base) ; renommee par la session musique (archive handoff 2026-10-06). near - recherche
; (ou enregistre) un offset dans la table via VROOMM_FindOffsetInTable_689A3, echange une
; valeur en place si trouve.
; ==============================================================================================
VROOMM_LookupOrRegisterOffset_401BB	proc near		; CODE XREF: VROOMM_MaybePatchCallSite_400DA+1Ep
					; VROOMM_PatchIntCallStub_40119+11p
		call	VROOMM_FindOffsetInTable_401C7
		or	bx, bx
		jz	short locret_401C6
		xchg	cx, ss:[bx+2]

locret_401C6:				; CODE XREF: VROOMM_LookupOrRegisterOffset_401BB+5j
		retn
VROOMM_LookupOrRegisterOffset_401BB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_FindOffsetInTable_689A3 (sub_689A3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_FindRelocationSlot_689A3' (nom de notre
; base) ; renommee par la session musique (archive handoff 2026-10-06). near - recherche
; binaire/lineaire dans une table de correspondances (offset->segment) utilisee par le
; mecanisme de patch de relocation.
; ==============================================================================================
VROOMM_FindOffsetInTable_401C7	proc near		; CODE XREF: VROOMM_CopyAndRelocateBlock_4014C+3Ep VROOMM_LookupOrRegisterOffset_401BBp
		xor	bx, bx
		push	cx
		push	bp
		jmp	short loc_401D1
; ���������������������������������������������������������������������������

loc_401CD:				; CODE XREF: VROOMM_FindOffsetInTable_401C7+11j
					; VROOMM_FindOffsetInTable_401C7+16j ...
		shl	cx, 1
		mov	bp, cx

loc_401D1:				; CODE XREF: VROOMM_FindOffsetInTable_401C7+4j
		mov	cx, [bp+0]
		shr	cx, 1
		jz	short loc_401EA
		jb	short loc_401CD
		cmp	dx, [bp+4]
		jnz	short loc_401CD
		mov	[bp+4],	ax
		or	bx, bx
		jnz	short loc_401CD
		mov	bx, bp
		jmp	short loc_401CD
; ���������������������������������������������������������������������������

loc_401EA:				; CODE XREF: VROOMM_FindOffsetInTable_401C7+Fj
		pop	bp
		pop	cx
		retn
VROOMM_FindOffsetInTable_401C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VROOMM_ComputeAvailableOffset_689C9 (sub_689C9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'VROOMM_ComputeRemainingSpace_689C9' (nom de notre base) ; renommee par la session
; musique (archive handoff 2026-10-06). near - calcule l'espace disponible avant la prochaine
; limite de segment charge, utilise pour decider si un nouveau segment peut etre place sans
; collision avec un segment deja resident.
; ==============================================================================================
VROOMM_ComputeAvailableOffset_401ED	proc near		; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2:loc_3FFFAp
					; VROOMM_DemandLoadDispatch_4000C+46p
		mov	ax, word_430DC
		or	ax, ax
		jz	short loc_40200
		mov	es, ax
		mov	ax, es:10h
		sub	ax, word_430D0
		jnb	short locret_40208

loc_40200:				; CODE XREF: VROOMM_ComputeAvailableOffset_401ED+5j
		mov	ax, word_430D6
		sub	ax, word_430D0
		stc

locret_40208:				; CODE XREF: VROOMM_ComputeAvailableOffset_401ED+11j
		retn
VROOMM_ComputeAvailableOffset_401ED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_ComputeParagraphCount_689E5 (sub_689E5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_ComputeParagraphs_689E5' (nom de notre
; base) ; renommee par la session musique (archive handoff 2026-10-06). near - convertit une
; taille en octets (es:8) en nombre de PARAGRAPHES DOS (unite d'allocation memoire = 16
; octets), arrondi.
; ==============================================================================================
VROOMM_ComputeParagraphCount_40209	proc near		; CODE XREF: VROOMM_LoadOnDemandCore_3FFC2+27p
					; VROOMM_DemandLoadDispatch_4000C+6Bp ...
		mov	ax, es:8
		add	ax, 11h
		mov	cl, 4
		shr	ax, cl
		retn
VROOMM_ComputeParagraphCount_40209	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; VROOMM_ComputeSegmentSpan_689F1 (sub_689F1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'VROOMM_ComputeSizeFromHeader_689F1' (nom de
; notre base) ; renommee par la session musique (archive handoff 2026-10-06). near - calcule
; l'etendue totale en paragraphes d'un segment de donnees + code (es:8 = taille code, es:0xA =
; taille donnees), arrondis independamment puis sommes.
; ==============================================================================================
VROOMM_ComputeSegmentSpan_40215	proc near		; CODE XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+62p
					; VROOMM_LoadOnDemandCore_3FFC2+5p
		mov	cl, 4
		mov	ax, es:8
		add	ax, 11h
		shr	ax, cl
		mov	dx, es:0Ah
		add	dx, 0Fh
		shr	dx, cl
		add	dx, ax
		retn
VROOMM_ComputeSegmentSpan_40215	endp

; ���������������������������������������������������������������������������
		push	ds
		push	es
		mov	ds, cs:seg_3FA6D
		assume ds:seg170
		cmp	ax, word_416B4
		jb	short loc_4025D
		cmp	ax, word_416B6
		jnb	short loc_4025D
		dec	ax
		mov	es, ax
		mov	es, word ptr es:0Eh
		inc	ax
		mov	bx, word_416A0
		cmp	bx, es:0
		jnz	short loc_4025D
		cmp	ax, es:10h
		mov	ax, es
		jz	short loc_40260

loc_4025D:				; CODE XREF: seg166:07D8j seg166:07DEj ...
		xor	ax, ax
		stc

loc_40260:				; CODE XREF: seg166:07FBj
		pop	es
		pop	ds
		assume ds:dseg
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	byte ptr [bp-2], 0
		push	ds
		mov	ds, cs:seg_3FA6D
		assume ds:seg170
		push	si
		push	di
		mov	bx, bp
		mov	ax, word_416A0
		mov	dx, word_416B4
		jmp	short loc_40284
; ���������������������������������������������������������������������������

loc_40280:				; CODE XREF: seg166:082Fj seg166:0837j ...
		shl	si, 1
		mov	bx, si

loc_40284:				; CODE XREF: seg166:081Ej
		cmp	bx, cx
		jnb	short loc_402B2
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_402B2
		jb	short loc_40280
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_40280
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jnz	short loc_40280
		cmp	es:[di], ax
		jnz	short loc_40280
		mov	byte ptr [bp-2], 1
		mov	es:[di+2], di
		jmp	short loc_40280
; ���������������������������������������������������������������������������

loc_402B2:				; CODE XREF: seg166:0826j seg166:082Dj
		cmp	byte ptr [bp-2], 1
		jz	short loc_402BF
		jmp	short loc_402F4
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_402BB:				; CODE XREF: seg166:0866j seg166:086Ej ...
		shl	si, 1
		mov	bx, si

loc_402BF:				; CODE XREF: seg166:0856j
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_402F4
		jb	short loc_402BB
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_402BB
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jz	short loc_402BB
		cmp	es:0, ax
		jnz	short loc_402BB
		cmp	word ptr es:2, 0
		jnz	short loc_402BB
		xchg	di, es:2
		mov	ss:[bx+2], di
		jmp	short loc_402BB
; ���������������������������������������������������������������������������

loc_402F4:				; CODE XREF: seg166:0858j seg166:0864j
		pop	di
		pop	si
		pop	ds
		assume ds:dseg
		mov	sp, bp
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:seg_3FA6D
		assume ds:seg170
		mov	es, word ptr [bp+8]
		mov	cx, word_416A0
		cmp	cx, es:0
		jnz	short loc_40350
		cmp	word ptr es:10h, 0
		jz	short loc_40322
		cmp	byte ptr es:20h, 0CDh ;	'�'
		jnz	short loc_40349

loc_40322:				; CODE XREF: seg166:08B8j
		mov	word ptr [bp+8], 0
		push	si
		push	di
		call	VROOMM_DemandLoadDispatch_4000C
		pop	di
		pop	si
		mov	bx, [bp+6]
		push	es
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:seg_3FA6D
		call	off_41616
		pop	es

loc_40349:				; CODE XREF: seg166:08C0j
		mov	ax, es:10h
		mov	[bp+8],	ax

loc_40350:				; CODE XREF: seg166:08B0j
		pop	ds
		assume ds:dseg
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_40353:				; DATA XREF: dseg:598Eo
		push	ds
		push	si
		push	di
		mov	ax, seg	seg170
		mov	ds, ax
		assume ds:seg170
		call	VROOMM_ScanFreeMemoryBlocks_3FD03
		mov	bx, word_416AA
		mov	ax, seg	dseg
		mov	ds, ax
		assume ds:dseg
		mov	ax, seg	dseg
		mov	es, ax
		assume es:dseg
		cmp	bx, es:word_488DC
		jnb	short loc_4037A
		mov	bx, es:word_488DC
		jmp	short loc_4037C
; ���������������������������������������������������������������������������

loc_4037A:				; CODE XREF: seg166:0911j
		shl	bx, 1

loc_4037C:				; CODE XREF: seg166:0918j
		inc	bx
		push	bx
		mov	ax, 10h
		mul	bx
		push	dx
		push	ax
		call	PagedResourceB_Read_2C9FC
		pop	bx
		pop	bx
		pop	bx
		mov	cx, ax
		or	cx, dx
		jcxz	short loc_403A9
		inc	dx
		add	bx, dx
		push	dx
		push	bx
		xor	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr VROOMM_OpenAndParseOverlayFile_3FA78
		or	ax, ax
		jnz	short loc_403A9
		pop	di
		pop	si
		pop	ds
		retf
; ���������������������������������������������������������������������������

loc_403A9:				; CODE XREF: seg166:0931j seg166:0943j
		jmp	far ptr	loc_2B1
; ���������������������������������������������������������������������������
		retn
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_7. PRESS KEYPAD "+" TO EXPAND]
; ���������������������������������������������������������������������������

; Segment type:	Regular
