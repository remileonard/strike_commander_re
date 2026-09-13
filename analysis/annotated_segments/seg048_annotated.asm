seg048		segment	byte public 'CODE' use16
		assume cs:seg048
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,63L — constructeur d'un objet volumineux (0x107 octets, police/texte), initialise
; position, tente un chargement de config (sub_26F2B) : constructeur d'objet de rendu de texte
; formaté avec configuration optionnelle.
; ==============================================================================================
TextObj_Construct	proc far		; CODE XREF: TextRenderer_Main+98p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp

loc_272EB:				; DATA XREF: seg216:023Eo
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		or	si, si
		jnz	short loc_27306
		push	107h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2734F

loc_27306:				; CODE XREF: TextObj_Construct+Dj
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si], ax
		mov	ax, [bp+arg_4]
		mov	[si+2],	ax
		mov	word ptr [si+4], 1
		or	di, di
		jz	short loc_27346
		push	ds
		push	di
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_27346
		push	1
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		mov	bx, [si+6]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_27346:				; CODE XREF: TextObj_Construct+3Cj
					; TextObj_Construct+4Aj
		mov	dword ptr [si+103h], 0

loc_2734F:				; CODE XREF: TextObj_Construct+1Cj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
TextObj_Construct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,192L — boucle d'interprétation d'un flux de commandes (table de pointeurs à +2, cache à
; +4/+0), lit la commande suivante via sub_63DB5/sub_64062 : interpréteur de flux de commandes
; de rendu (moteur SM-FONT, contrôle de mise en forme du texte).
; ==============================================================================================
TextObj_CommandInterp	proc far		; CODE XREF: TextRenderer_Main+2CCp

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_27358:
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di

loc_27362:
		mov	ax, [si+4]

loc_27365:
		cmp	ax, [si]

loc_27367:
		jge	short loc_2737B
		mov	ax, [si+4]

loc_2736C:
		inc	word ptr [si+4]
		shl	ax, 1

loc_27371:
		mov	bx, [si+2]
		add	bx, ax
		mov	di, [bx]
		jmp	loc_27471
; ���������������������������������������������������������������������������

loc_2737B:				; CODE XREF: TextObj_CommandInterp:loc_27367j
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jnz	short loc_2738E
		jmp	loc_27471
; ���������������������������������������������������������������������������

loc_2738E:				; CODE XREF: TextObj_CommandInterp+34j
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	eax, [si+103h]
		cmp	eax, [bp+var_4]
		jl	short loc_273B0
		jmp	loc_27471
; ���������������������������������������������������������������������������

loc_273B0:				; CODE XREF: TextObj_CommandInterp+56j
		push	eax
		push	large 0A0h ; '�'
		push	ds
		mov	ax, si
		add	ax, 63h	; 'c'
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ReadTyped_63FA1
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh

loc_273D1:
		mov	[bp+var_8], eax

loc_273D5:
		mov	di, si

loc_273D7:
		add	di, 63h	; 'c'
		xor	cx, cx

loc_273DC:
		mov	[bp+var_A], 0
		xor	dx, dx

loc_273E3:				; CODE XREF: TextObj_CommandInterp:loc_27465j
		mov	bx, si
		add	bx, dx
		mov	al, [bx+63h]
		cbw
		mov	bx, ax
		or	bx, bx
		jz	short loc_273F6
		cmp	bx, 1Bh
		jnz	short loc_27412

loc_273F6:				; CODE XREF: TextObj_CommandInterp+9Aj
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0
		or	dx, dx
		jnz	short loc_27404
		xor	di, di

loc_27404:				; CODE XREF: TextObj_CommandInterp+ABj
		mov	eax, [bp+var_4]
		mov	[si+103h], eax

loc_2740D:				; CODE XREF: TextObj_CommandInterp+E0j
		mov	cx, 1
		jmp	short loc_27457
; ���������������������������������������������������������������������������

loc_27412:				; CODE XREF: TextObj_CommandInterp+9Fj
		cmp	bx, 0Dh
		jz	short loc_2741C
		cmp	bx, 0Ah
		jnz	short loc_27431

loc_2741C:				; CODE XREF: TextObj_CommandInterp+C0j
		cmp	byte ptr [di], 0
		jz	short loc_27426
		mov	[bp+var_A], 1

loc_27426:				; CODE XREF: TextObj_CommandInterp+CAj
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0
		inc	dx
		jmp	short loc_27457
; ���������������������������������������������������������������������������

loc_27431:				; CODE XREF: TextObj_CommandInterp+C5j
		cmp	[bp+var_A], 0
		jnz	short loc_2740D
		or	di, di
		jnz	short loc_27442
		mov	di, si
		add	di, dx
		add	di, 63h	; 'c'

loc_27442:				; CODE XREF: TextObj_CommandInterp+E4j
		inc	dx
		mov	ax, dx
		movsx	eax, ax
		cmp	eax, [bp+var_8]
		jnz	short loc_27457
		mov	bx, si
		add	bx, dx

loc_27453:
		mov	byte ptr [bx+63h], 0

loc_27457:				; CODE XREF: TextObj_CommandInterp+BBj
					; TextObj_CommandInterp+DAj ...
		or	cx, cx

loc_27459:
		jnz	short loc_27468
		movsx	eax, dx

loc_2745F:
		cmp	eax, [bp+var_8]
		jge	short loc_27468

loc_27465:
		jmp	loc_273E3
; ���������������������������������������������������������������������������

loc_27468:				; CODE XREF: TextObj_CommandInterp:loc_27459j
					; TextObj_CommandInterp+10Ej
		movsx	eax, dx
		add	[si+103h], eax

loc_27471:				; CODE XREF: TextObj_CommandInterp+23j
					; TextObj_CommandInterp+36j ...
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
TextObj_CommandInterp	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,1158 lignes — la plus grosse fonction identifiée à ce jour. Utilise le système de police
; SM-FONT (chargé au démarrage, seg012) et le même cluster que sub_272E8/sub_27355. Candidat
; très fort pour le moteur de rendu de texte principal du jeu (menus, briefings, HUD) — bien
; trop volumineux pour une passe rapide, priorité haute pour une session dédiée.
; ==============================================================================================
TextRenderer_Main	proc far		; CODE XREF: Program_InitVideoFontArgs+52P

var_160		= word ptr -160h
var_15A		= word ptr -15Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword	ptr -4Eh
var_4A		= byte ptr -4Ah
var_49		= byte ptr -49h
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 160h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_6E338
		mov	ah, 0
		or	ax, ax
		jz	short loc_2748F
		jmp	loc_27E21
; ���������������������������������������������������������������������������

loc_2748F:				; CODE XREF: TextRenderer_Main+13j
		mov	byte ptr [si+25h], 1
		mov	byte ptr [si+1Dh], 3
		mov	byte ptr [bp+var_6], 3
		lea	ax, [bp+var_6]
		push	ax
		call	TextRenderer_EncodeCharA_5E27B
		pop	cx
		cmp	byte ptr [bp+var_6], 13h
		jz	short loc_274BB
		mov	byte ptr [bp+var_6], 13h
		lea	ax, [bp+var_6]
		push	ax
		call	TextRenderer_EncodeCharB_5E2A3
		pop	cx
		jmp	short loc_274C0
; ���������������������������������������������������������������������������

loc_274BB:				; CODE XREF: TextRenderer_Main+32j
		call	Video_ReadCRTCPortBase_5E7D6

loc_274C0:				; CODE XREF: TextRenderer_Main+42j
		push	0
		mov	ax, si
		add	ax, 4
		push	ax
		call	TextRenderer_GetOrInitFormatState_5D9FD
		add	sp, 4
		mov	[bp+var_7], 0
		mov	[bp+var_A], 0FFFFh
		mov	[bp+var_C], 0FFFFh
		mov	[bp+var_E], 0FFFFh
		mov	[bp+var_10], 0FFFFh
		mov	[bp+var_11], 0
		mov	[bp+var_14], 0FFFFh
		mov	[bp+var_16], 0FFFFh
		mov	[bp+var_18], 0FFFFh
		mov	[bp+var_1A], 0FFFFh
		push	12A6h
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_160]
		push	ax
		push	cs
		call	near ptr TextObj_Construct
		add	sp, 8
		mov	[bp+var_1C], 3

loc_2751A:				; CODE XREF: TextRenderer_Main:loc_27683j
		or	byte_72D74, 2

loc_2751F:				; CODE XREF: TextRenderer_Main+25Aj
		push	5C60h
		call	FontStyle_CombineFlags_5EC12
		pop	cx
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2752B:				; CODE XREF: TextRenderer_Main+2D6j
		mov	al, [di]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 2Bh	; '+'
		jnz	short loc_2753D
		jmp	loc_2768E
; ���������������������������������������������������������������������������

loc_2753D:				; CODE XREF: TextRenderer_Main+C1j
		cmp	ax, 2Dh	; '-'
		jz	short loc_2754D
		cmp	ax, 3Dh	; '='
		jnz	short loc_2754A
		jmp	loc_276D4
; ���������������������������������������������������������������������������

loc_2754A:				; CODE XREF: TextRenderer_Main+CEj
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2754D:				; CODE XREF: TextRenderer_Main+C9j
		mov	al, [di+1]
		cbw

loc_27551:
		push	ax

loc_27552:
		call	CRT_CtypeLookup

loc_27557:
		pop	cx
		mov	[bp+var_2], ax

loc_2755B:				; switch 11 cases
		mov	cx, 0Bh

loc_2755E:
		mov	bx, offset word_27E35

loc_27561:				; CODE XREF: TextRenderer_Main+F5j
		mov	ax, cs:[bx]

loc_27564:
		cmp	ax, [bp+var_2]

loc_27567:
		jz	short loc_27571
		add	bx, 2
		loop	loc_27561
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_27571:				; CODE XREF: TextRenderer_Main:loc_27567j
		jmp	word ptr cs:[bx+16h] ; switch jump

loc_27575:				; DATA XREF: seg048:off_27E4Bo
		mov	[bp+var_1C], 1	; case 0x31
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2757D:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	[bp+var_1C], 2	; case 0x32
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_27585:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	[bp+var_1C], 3	; case 0x33
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2758D:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	byte_709A1, 1	; case 0x52
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_27595:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	al, [di+2]	; case 0x4D
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_7], al
		cmp	byte ptr [di+3], 0
		jnz	short loc_275AC
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_275AC:				; CODE XREF: TextRenderer_Main+130j
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_58], ax
		shl	ax, 4
		add	ax, 208h
		mov	[bp+var_A], ax
		cmp	byte ptr [di+4], 0
		jnz	short loc_275C8
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_275C8:				; CODE XREF: TextRenderer_Main+14Cj
		mov	al, [di+4]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_C], ax
		cmp	byte ptr [di+5], 0
		jnz	short loc_275DB
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_275DB:				; CODE XREF: TextRenderer_Main+15Fj
		mov	al, [di+5]
		cbw
		add	ax, 0FFD0h

loc_275E2:
		mov	[bp+var_E], ax
		cmp	byte ptr [di+6], 0
		jnz	short loc_275EE
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_275EE:				; CODE XREF: TextRenderer_Main+172j
		mov	al, [di+6]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_10], ax
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_275FB:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	al, [di+2]	; case 0x44
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_11], al
		cmp	byte ptr [di+3], 0
		jnz	short loc_27612
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_27612:				; CODE XREF: TextRenderer_Main+196j
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_58], ax
		shl	ax, 4
		add	ax, 200h
		mov	[bp+var_14], ax
		cmp	byte ptr [di+4], 0
		jnz	short loc_2762E
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2762E:				; CODE XREF: TextRenderer_Main+1B2j
		mov	al, [di+4]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_16], ax
		cmp	[bp+var_16], 0
		jnz	short loc_27643
		mov	[bp+var_16], 0Ah

loc_27643:				; CODE XREF: TextRenderer_Main+1C5j
		cmp	byte ptr [di+5], 0
		jnz	short loc_2764C
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2764C:				; CODE XREF: TextRenderer_Main+1D0j
		mov	al, [di+5]
		cbw

loc_27650:
		add	ax, 0FFD0h
		mov	[bp+var_18], ax

loc_27656:
		cmp	byte ptr [di+6], 0
		jnz	short loc_2765F
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2765F:				; CODE XREF: TextRenderer_Main+1E3j
		mov	al, [di+6]
		cbw

loc_27663:
		add	ax, 0FFD0h
		mov	[bp+var_1A], ax
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2766C:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	byte_6E339, 0	; case 0x45
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_27674:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	byte_6E33A, 0	; case 0x54
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2767C:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	byte ptr [si+25h], 0 ; case 0x56
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_27683:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		jmp	loc_2751A	; case 0x57
; ���������������������������������������������������������������������������

loc_27686:				; CODE XREF: TextRenderer_Main:loc_27571j
					; DATA XREF: seg048:off_27E4Bo
		mov	byte_70EA6, 0	; case 0x4F
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_2768E:				; CODE XREF: TextRenderer_Main+C3j
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_4], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_27E25

loc_276A2:				; CODE XREF: TextRenderer_Main+236j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_276B2
		add	bx, 2
		loop	loc_276A2
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_276B2:				; CODE XREF: TextRenderer_Main+231j
		jmp	word ptr cs:[bx+8] ; switch jump

loc_276B6:				; DATA XREF: seg048:0B4Do
		mov	byte_6E339, 1	; case 0x45
		jmp	loc_2773D	; default
; ���������������������������������������������������������������������������

loc_276BE:				; CODE XREF: TextRenderer_Main:loc_276B2j
					; DATA XREF: seg048:0B4Do
		mov	byte_6E33A, 1	; case 0x54
		jmp	short loc_2773D	; default
; ���������������������������������������������������������������������������

loc_276C5:				; CODE XREF: TextRenderer_Main:loc_276B2j
					; DATA XREF: seg048:0B4Do
		mov	byte_70EA6, 1	; case 0x4F
		jmp	short loc_2773D	; default
; ���������������������������������������������������������������������������

loc_276CC:				; CODE XREF: TextRenderer_Main:loc_276B2j
					; DATA XREF: seg048:0B4Do
		and	byte_72D74, 0FDh ; case	0x57
		jmp	loc_2751F
; ���������������������������������������������������������������������������

loc_276D4:				; CODE XREF: TextRenderer_Main+D0j
		mov	ax, di
		inc	ax
		mov	[bp+var_58], ax
		push	ds
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_2773D	; default
		push	12Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_27718
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [di], 13A6h
		mov	dword ptr [di+0DDh], 0
		mov	dword ptr [di+0E1h], 0
		mov	ax, di
		jmp	short loc_2771A
; ���������������������������������������������������������������������������

loc_27718:				; CODE XREF: TextRenderer_Main+27Ej
		mov	ax, di

loc_2771A:				; CODE XREF: TextRenderer_Main+29Fj
		mov	di, ax
		push	[bp+var_58]
		push	ax
		call	StreamReader_OpenAndRegister_64321
		add	sp, 4
		or	al, al
		jnz	short loc_2773D	; default
		or	di, di
		jz	short loc_2773D	; default
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_2773D:				; CODE XREF: TextRenderer_Main+B1j
					; TextRenderer_Main:loc_2754Aj	...
		lea	ax, [bp+var_160] ; default
		push	ax
		push	cs
		call	near ptr TextObj_CommandInterp
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_27750
		jmp	loc_2752B
; ���������������������������������������������������������������������������

loc_27750:				; CODE XREF: TextRenderer_Main+2D4j
		mov	ax, si

loc_27752:
		add	ax, 5
		push	ax
		call	VROOMM_StubThunk_6B74A
		pop	cx

loc_2775C:
		mov	ax, word_70E62
		mov	word_721E0, ax

loc_27762:
		mov	byte_721F0, 0
		cmp	[bp+var_1C], 2
		jnz	short loc_277C7
		cmp	byte_721F0, 0
		jz	short loc_2777F
		push	0EEE0h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short $+2

loc_2777F:				; CODE XREF: TextRenderer_Main+2FBj
		mov	byte_721F0, 1
		mov	bx, word_721E0
		mov	ax, [bx+4]
		mov	[bp+var_1E], ax
		mov	ax, [bx+6]
		mov	[bp+var_20], ax
		mov	ax, [bx+8]
		mov	[bp+var_22], ax
		mov	ax, [bx+0Ah]
		mov	[bp+var_24], ax
		mov	ax, [bp+var_1E]
		mov	word_721E6, ax
		mov	ax, [bp+var_20]
		mov	word_721E8, ax
		mov	ax, [bp+var_22]
		mov	word_721EA, ax
		mov	ax, [bp+var_24]
		mov	word_721EC, ax
		push	0
		push	5132h
		call	TextRenderer_ApplyFormatChange_5E34D
		add	sp, 4
		jmp	short loc_2782E
; ���������������������������������������������������������������������������

loc_277C7:				; CODE XREF: TextRenderer_Main+2F4j
		cmp	[bp+var_1C], 3
		jnz	short loc_2782E
		cmp	byte_721F0, 0
		jz	short loc_277DF

loc_277D4:
		push	0EEE0h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short $+2

loc_277DF:				; CODE XREF: TextRenderer_Main+35Bj
		mov	byte_721F0, 2
		push	5130h
		call	EMS_AllocateBlock
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_2782E
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_26], bx
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
		cmp	[bp+var_26], 0
		jnz	short loc_2782E
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short $+2

loc_2782E:				; CODE XREF: TextRenderer_Main+34Ej
					; TextRenderer_Main+354j ...
		cmp	byte_6E339, 0
		jz	short loc_2784A
		push	large 0
		call	PagedMemory_ReadTextResource_5C14E
		pop	cx
		push	ax
		push	5C44h
		call	Memory_TypedFreeVariant_5C643
		add	sp, 6

loc_2784A:				; CODE XREF: TextRenderer_Main+3BCj
		push	5C44h
		call	TextRenderer_ReleaseCachedGlyph_5CA9E
		pop	cx

loc_27853:
		call	Registry_LookupForTextRenderer_5B5D9

loc_27858:
		push	dx
		push	ax

loc_2785A:
		pop	eax

loc_2785C:
		mov	dword_72C38, eax
		cmp	dword_72C38, 1D5780h
		jle	short loc_27870
		mov	ax, 1
		jmp	short loc_27872
; ���������������������������������������������������������������������������

loc_27870:				; CODE XREF: TextRenderer_Main+3F2j
		xor	ax, ax

loc_27872:				; CODE XREF: TextRenderer_Main+3F7j
		mov	[bp+var_27], al
		cmp	dword_72C38, 1A9860h
		jle	short loc_27885
		mov	ax, 1
		jmp	short loc_27887
; ���������������������������������������������������������������������������

loc_27885:				; CODE XREF: TextRenderer_Main+407j
		xor	ax, ax

loc_27887:				; CODE XREF: TextRenderer_Main+40Cj
		mov	[bp+var_28], al
		cmp	[bp+var_27], 0
		jnz	short loc_27893
		jmp	loc_279EB
; ���������������������������������������������������������������������������

loc_27893:				; CODE XREF: TextRenderer_Main+417j
		mov	al, [bp+var_7]
		cbw
		cmp	ax, 41h	; 'A'
		jnz	short loc_2789F
		jmp	loc_27940
; ���������������������������������������������������������������������������

loc_2789F:				; CODE XREF: TextRenderer_Main+423j
		cmp	ax, 52h	; 'R'
		jz	short loc_278A7
		jmp	loc_279EB
; ���������������������������������������������������������������������������

loc_278A7:				; CODE XREF: TextRenderer_Main+42Bj
		mov	byte_70996, 1
		push	84h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_278BE
		jmp	loc_279E6
; ���������������������������������������������������������������������������

loc_278BE:				; CODE XREF: TextRenderer_Main+442j
		mov	word ptr [di], 129Eh
		mov	ax, word_70EA8
		mov	[di+2],	ax
		mov	word_70EA8, di
		mov	word ptr [di], 13A2h
		mov	dword ptr [di+0Ah], 0
		mov	byte ptr [di+0Eh], 2
		mov	byte ptr [di+0Fh], 0
		mov	dword ptr [di+10h], 0
		mov	dword ptr [di+14h], 0
		mov	byte ptr [di+18h], 2
		mov	byte ptr [di+19h], 0
		mov	dword ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [di+1Eh], 2C8h
		mov	dword ptr [di+7Fh], 100h
		mov	dword ptr [di+7Bh], 0
		mov	word ptr [di+1Eh], 138Ah
		push	large 0FFFFFFFFh
		push	large 0FFFFFFFFh
		push	12ADh

loc_2792F:				; CODE XREF: TextRenderer_Main+56Cj
		push	di
		call	TextRenderer_InputFieldHandler_5A0F3
		add	sp, 0Ch
		mov	ax, di
		jmp	loc_279E8
; ���������������������������������������������������������������������������
		jmp	loc_279E6
; ���������������������������������������������������������������������������

loc_27940:				; CODE XREF: TextRenderer_Main+425j
		mov	byte_70996, 2
		mov	ax, [bp+var_A]
		mov	[bp+var_2A], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_2C], ax
		mov	ax, [bp+var_E]

loc_27954:
		mov	[bp+var_2E], ax

loc_27957:
		mov	ax, [bp+var_10]

loc_2795A:
		mov	[bp+var_30], ax
		push	84h ; '�'

loc_27960:
		call	CRT_Malloc16_Retry
		pop	cx

loc_27966:
		mov	di, ax
		or	ax, ax
		jz	short loc_279E6
		mov	word ptr [di], 129Eh
		mov	ax, word_70EA8
		mov	[di+2],	ax
		mov	word_70EA8, di
		mov	word ptr [di], 13A2h
		mov	dword ptr [di+0Ah], 0
		mov	byte ptr [di+0Eh], 2
		mov	byte ptr [di+0Fh], 0
		mov	dword ptr [di+10h], 0
		mov	dword ptr [di+14h], 0
		mov	byte ptr [di+18h], 2
		mov	byte ptr [di+19h], 0
		mov	dword ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [di+1Eh], 2C8h
		mov	dword ptr [di+7Fh], 100h
		mov	dword ptr [di+7Bh], 0
		mov	word ptr [di+1Eh], 138Ah
		push	[bp+var_30]
		push	[bp+var_2E]
		push	[bp+var_2C]
		push	[bp+var_2A]
		push	12B4h
		jmp	loc_2792F
; ���������������������������������������������������������������������������

loc_279E6:				; CODE XREF: TextRenderer_Main+444j
					; TextRenderer_Main+4C6j ...
		mov	ax, di

loc_279E8:				; CODE XREF: TextRenderer_Main+4C3j
		mov	word_70997, ax

loc_279EB:				; CODE XREF: TextRenderer_Main+419j
					; TextRenderer_Main+42Dj
		cmp	word_70997, 0
		jz	short loc_279FC
		mov	byte_7236B, 1
		mov	byte_7236C, 1

loc_279FC:				; CODE XREF: TextRenderer_Main+579j
		cmp	[bp+var_28], 0
		jnz	short loc_27A05
		jmp	loc_27B71
; ���������������������������������������������������������������������������

loc_27A05:				; CODE XREF: TextRenderer_Main+589j
		mov	al, [bp+var_11]
		cbw
		cmp	ax, 50h	; 'P'
		jnz	short loc_27A11
		jmp	loc_27ACB
; ���������������������������������������������������������������������������

loc_27A11:				; CODE XREF: TextRenderer_Main+595j
		cmp	ax, 53h	; 'S'
		jz	short loc_27A19
		jmp	loc_27B71
; ���������������������������������������������������������������������������

loc_27A19:				; CODE XREF: TextRenderer_Main+59Dj
		mov	ax, [bp+var_14]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_16]
		mov	[bp+var_34], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_36], ax
		mov	ax, [bp+var_1A]
		mov	[bp+var_38], ax
		push	84h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_27A43
		jmp	loc_27B6C
; ���������������������������������������������������������������������������

loc_27A43:				; CODE XREF: TextRenderer_Main+5C7j
		mov	word ptr [di], 129Eh
		mov	ax, word_70EA8
		mov	[di+2],	ax
		mov	word_70EA8, di

loc_27A51:
		mov	word ptr [di], 13A2h

loc_27A55:
		mov	dword ptr [di+0Ah], 0
		mov	byte ptr [di+0Eh], 2
		mov	byte ptr [di+0Fh], 0
		mov	dword ptr [di+10h], 0
		mov	dword ptr [di+14h], 0
		mov	byte ptr [di+18h], 2
		mov	byte ptr [di+19h], 0
		mov	dword ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [di+1Eh], 2C8h
		mov	dword ptr [di+7Fh], 100h
		mov	dword ptr [di+7Bh], 0
		mov	word ptr [di+1Eh], 138Ah
		push	[bp+var_38]
		push	[bp+var_36]
		push	[bp+var_34]
		push	[bp+var_32]
		push	12BAh

loc_27ABA:				; CODE XREF: TextRenderer_Main+6F2j
		push	di
		call	TextRenderer_InputFieldHandler_5A0F3
		add	sp, 0Ch
		mov	ax, di
		jmp	loc_27B6E
; ���������������������������������������������������������������������������
		jmp	loc_27B6C
; ���������������������������������������������������������������������������

loc_27ACB:				; CODE XREF: TextRenderer_Main+597j
		mov	ax, [bp+var_14]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_16]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_1A]
		mov	[bp+var_40], ax
		push	84h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_27B6C
		mov	word ptr [di], 129Eh
		mov	ax, word_70EA8
		mov	[di+2],	ax
		mov	word_70EA8, di
		mov	word ptr [di], 13A2h
		mov	dword ptr [di+0Ah], 0
		mov	byte ptr [di+0Eh], 2
		mov	byte ptr [di+0Fh], 0
		mov	dword ptr [di+10h], 0
		mov	dword ptr [di+14h], 0
		mov	byte ptr [di+18h], 2
		mov	byte ptr [di+19h], 0
		mov	dword ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Eh
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [di+1Eh], 2C8h
		mov	dword ptr [di+7Fh], 100h

loc_27B4D:
		mov	dword ptr [di+7Bh], 0

loc_27B55:
		mov	word ptr [di+1Eh], 138Ah
		push	[bp+var_40]
		push	[bp+var_3E]
		push	[bp+var_3C]
		push	[bp+var_3A]
		push	12BDh
		jmp	loc_27ABA
; ���������������������������������������������������������������������������

loc_27B6C:				; CODE XREF: TextRenderer_Main+5C9j
					; TextRenderer_Main+651j ...
		mov	ax, di

loc_27B6E:				; CODE XREF: TextRenderer_Main+64Ej
		mov	word_70999, ax

loc_27B71:				; CODE XREF: TextRenderer_Main+58Bj
					; TextRenderer_Main+59Fj
		cmp	word_70999, 0
		jz	short loc_27B7D
		mov	byte_7236D, 1

loc_27B7D:				; CODE XREF: TextRenderer_Main+6FFj
		cmp	[bp+arg_6], 0
		jnz	short loc_27B86
		jmp	loc_27C3D
; ���������������������������������������������������������������������������

loc_27B86:				; CODE XREF: TextRenderer_Main+70Aj
		push	2
		push	[bp+arg_6]
		call	TextRenderer_LoadResourceFile_661AF
		add	sp, 4
		mov	word ptr [bp+var_44+2],	dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 2
		mov	[bp+var_49], 1
		mov	[bp+var_48], 0
		lea	ax, [bp+var_4E]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_60507
		add	sp, 4
		mov	word_6E341, ax
		cmp	[bp+var_49], 0
		jz	short loc_27BE6
		cmp	[bp+var_4E], 0
		jz	short loc_27BE6
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_27BE6:				; CODE XREF: TextRenderer_Main+74Fj
					; TextRenderer_Main+756j
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		mov	bx, word_6E341
		mov	word ptr [bx+10h], 1
		mov	word ptr [bx+12h], 0
		push	2Dh ; '-'
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, word_6E341
		mov	[bx+14h], ax
		push	bx
		push	word_70E62
		push	0
		call	Widget_ApplyStyleAndAllocate_607E1
		add	sp, 6
		mov	word_6E343, ax
		push	0Fh
		push	ax
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	ax, word_6E343
		mov	word_6FEDC, ax

loc_27C3D:				; CODE XREF: TextRenderer_Main+70Cj
		mov	[bp+var_50], 0
		jmp	short loc_27C68
; ���������������������������������������������������������������������������

loc_27C44:				; CODE XREF: TextRenderer_Main+7F5j
		mov	al, byte ptr [bp+var_50]
		push	ax
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jz	short loc_27C65

loc_27C52:
		push	0
		push	[bp+var_50]
		mov	ax, si
		add	ax, 5
		push	ax

loc_27C5D:
		call	VROOMM_StubThunk_6B745

loc_27C62:
		add	sp, 6

loc_27C65:				; CODE XREF: TextRenderer_Main+7D9j
		inc	[bp+var_50]

loc_27C68:				; CODE XREF: TextRenderer_Main+7CBj
		cmp	[bp+var_50], 1
		jl	short loc_27C44
		mov	byte_70EA6, 1
		cmp	byte_7236B, 0
		jz	short loc_27CEF
		mov	ax, word_70997
		mov	[bp+var_52], ax
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_27CEA
		mov	word ptr [di], 129Eh
		mov	ax, word_70EA8
		mov	[di+2],	ax
		mov	word_70EA8, di
		mov	word ptr [di], 1386h
		mov	byte_7084B, 1
		mov	byte_70869, 0
		mov	word_7084C, 0
		mov	ax, [bp+var_52]
		mov	word_70852, ax
		push	ax
		push	5BE3h
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4
		push	word_70852
		push	5BF5h
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4
		push	di
		call	VROOMM_StubThunk_6CFB9
		pop	cx
		push	0FFFFh
		push	12C1h
		push	di
		call	VROOMM_StubThunk_6CFC3
		add	sp, 6
		mov	ax, di
		jmp	short loc_27CEC
; ���������������������������������������������������������������������������

loc_27CEA:				; CODE XREF: TextRenderer_Main+815j
		mov	ax, di

loc_27CEC:				; CODE XREF: TextRenderer_Main+871j
		mov	word_7099D, ax

loc_27CEF:				; CODE XREF: TextRenderer_Main+801j
		cmp	byte_7236C, 0
		jz	short loc_27D6A
		mov	ax, word_70997
		mov	[bp+var_54], ax
		push	0E7h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_27D65
		mov	word ptr [di], 129Eh
		mov	ax, word_70EA8
		mov	[di+2],	ax
		mov	word_70EA8, di
		mov	word ptr [di], 1382h
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADAA
		push	large 1000Eh
		push	0Ah
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg048
		push	offset loc_2840B
		push	large 10005h
		push	11h
		mov	ax, di
		add	ax, 92h	; '�'
		push	ax
		call	CRT_Doprnt_Dispatch

loc_27D52:
		add	sp, 0Ch
		push	[bp+var_54]

loc_27D58:
		push	di

loc_27D59:
		call	VROOMM_StubThunk_6D015
		add	sp, 4

loc_27D61:
		mov	ax, di
		jmp	short loc_27D67
; ���������������������������������������������������������������������������

loc_27D65:				; CODE XREF: TextRenderer_Main+892j
		mov	ax, di

loc_27D67:				; CODE XREF: TextRenderer_Main+8ECj
		mov	word_7099B, ax

loc_27D6A:				; CODE XREF: TextRenderer_Main+87Dj
		cmp	byte_7236D, 0
		jz	short loc_27DE0
		mov	ax, word_70999
		mov	[bp+var_56], ax
		push	4Bh ; 'K'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_27DDB
		mov	word ptr [di], 129Eh
		mov	ax, word_70EA8
		mov	[di+2],	ax
		mov	word_70EA8, di
		mov	word ptr [di], 137Eh
		push	seg seg048
		push	offset loc_28438
		push	large 10006h
		push	8
		mov	ax, di
		add	ax, 4
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	dword ptr [di+36h], 0
		mov	byte ptr [di+3Ah], 2
		mov	byte ptr [di+3Bh], 0
		mov	dword ptr [di+3Ch], 0
		push	[bp+var_56]
		push	di
		call	VROOMM_StubThunk_6D055
		add	sp, 4
		mov	ax, di
		jmp	short loc_27DDD
; ���������������������������������������������������������������������������

loc_27DDB:				; CODE XREF: TextRenderer_Main+90Cj
		mov	ax, di

loc_27DDD:				; CODE XREF: TextRenderer_Main+962j
		mov	word_7099F, ax

loc_27DE0:				; CODE XREF: TextRenderer_Main+8F8j
		cmp	byte_6E33A, 0
		jz	short loc_27DFE
		push	large 78h ; 'x'
		push	seg seg047
		push	offset loc_26F74
		push	5DC2h
		call	Stopwatch_RegisterTickModuleVariant_67662
		add	sp, 0Ah
		mov	[si+26h], ax

loc_27DFE:				; CODE XREF: TextRenderer_Main+96Ej
		push	ds
		push	offset aCrackthe_nut ; "crackthe.nut"
		call	Config_LoadOrCreate
		add	sp, 4
		mov	byte_6E33C, al
		mov	byte_6E338, 1
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	StreamReader_Close_63BD5
		add	sp, 4

loc_27E21:				; CODE XREF: TextRenderer_Main+15j
		pop	di
		pop	si
		leave
		retf
TextRenderer_Main	endp

; ���������������������������������������������������������������������������
word_27E25	dw    45h,   4Fh,   54h,   57h ; DATA XREF: TextRenderer_Main+228o
					; value	table for switch statement
		dw offset loc_276B6	; jump table for switch	statement
		dw offset loc_276C5
		dw offset loc_276BE
		dw offset loc_276CC
word_27E35	dw    31h,   32h,   33h,   44h ; DATA XREF: TextRenderer_Main:loc_2755Eo
		dw    45h,   4Dh,   4Fh,   52h ; value table for switch	statement
		dw    54h,   56h,   57h
off_27E4B	dw offset loc_27575	; jump table for switch	statement
		dw offset loc_2757D
		dw offset loc_27585
		dw offset loc_275FB
		dw offset loc_2766C
		dw offset loc_27595
		dw offset loc_27686
		dw offset loc_2758D
		dw offset loc_27674
		dw offset loc_2767C
		dw offset loc_27683

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,97L — calibration de vitesse CPU : vérifie le support SMARTDRV/detect (INT15 AH=12h
; BX=736Dh), exécute 5 boucles de multiplications chronométrées via sub_27144 (le lecteur PIT
; haute précision) : routine de calibration de la vitesse du processeur au démarrage —
; pertinente pour le problème de difficulté IA dépendante du matériel déjà noté dans le
; projet.
; ==============================================================================================
CPU_SpeedCalibration	proc far		; CODE XREF: CRT_DisplayCalibrationMessage_8FC61+1BP

var_10		= byte ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1

		push	bp
		mov	bp, sp

loc_27E64:
		sub	sp, 10h
		push	si
		push	di
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		push	ds
		int	15h
		sti
		mov	[bp+var_1], bl
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		xor	di, di
		jmp	short loc_27EA7
; ���������������������������������������������������������������������������

loc_27E88:				; CODE XREF: CPU_SpeedCalibration+49j
		xor	ax, ax
		xor	bx, bx
		xor	dx, dx
		xor	si, si
		mov	ax, 0A000h
		mov	ds, ax
		assume ds:nothing
		xor	si, si
		mov	cx, 4000h

loc_27E9A:				; CODE XREF: CPU_SpeedCalibration+43j
		lodsd
		imul	ecx
		shrd	eax, edx, 10h
		loop	loc_27E9A
		inc	di

loc_27EA7:				; CODE XREF: CPU_SpeedCalibration+25j
		cmp	di, 5
		jl	short loc_27E88
		cmp	[bp+var_1], 0
		jz	short loc_27EBA
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h

loc_27EBA:				; CODE XREF: CPU_SpeedCalibration+4Fj
		pop	ds
		assume ds:seg339
		popf
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_A], eax
		sub	eax, [bp+var_6]
		imul	eax, 3E8h
		mov	ebx, 1770h
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0D7h ; '�'
		jg	short loc_27EF3
		mov	[bp+var_10], 0
		jmp	short loc_27F07
; ���������������������������������������������������������������������������

loc_27EF3:				; CODE XREF: CPU_SpeedCalibration+8Aj
		cmp	[bp+var_E], 0FAh ; '�'
		jg	short loc_27F03
		mov	[bp+var_10], 1
		jmp	short loc_27F07
; ���������������������������������������������������������������������������

loc_27F03:				; CODE XREF: CPU_SpeedCalibration+9Aj
		mov	[bp+var_10], 2

loc_27F07:				; CODE XREF: CPU_SpeedCalibration+90j
					; CPU_SpeedCalibration+A0j
		mov	al, [bp+var_10]
		pop	di
		pop	si
		leave
		retf
CPU_SpeedCalibration	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,59L — ferme un dialogue/écran : libère les chaînes associées (word_6E343/341 via
; sub_338/vtable[0]), désactive les indicateurs de son (sub_6769F) : fermeture/nettoyage d'une
; boîte de dialogue.
; ==============================================================================================
Dialog_Close	proc far		; CODE XREF: seg047:03A7P seg048:0CB8p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_6E338, 0
		jz	short loc_27F8D
		cmp	word_6E343, 0
		jz	short loc_27F3C
		mov	ax, word_6E343
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		push	word_6E343
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_27F3C:				; CODE XREF: Dialog_Close+13j
		mov	word_6E343, 0
		cmp	word_6E341, 0
		jz	short loc_27F5C
		push	3
		push	word_6E341
		mov	bx, word_6E341
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_27F5C:				; CODE XREF: Dialog_Close+39j
		mov	word_6E341, 0

loc_27F62:
		cmp	byte_6E33A, 0
		jz	short loc_27F77
		push	word ptr [si+26h]
		push	5DC2h
		call	Stopwatch_UnregisterTickModule_6769F
		add	sp, 4

loc_27F77:				; CODE XREF: Dialog_Close+59j
		mov	ax, si
		add	ax, 5
		push	ax
		call	VROOMM_StubThunk_6B74F
		pop	cx
		call	StreamReader_DispatchWrite_64175
		mov	byte_6E338, 0

loc_27F8D:				; CODE XREF: Dialog_Close+Cj
		pop	si
		pop	bp
		retf
Dialog_Close	endp

; ���������������������������������������������������������������������������

loc_27F90:				; DATA XREF: seg339:12A2o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		push	cs
		call	near ptr Dialog_Close
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,478L — configure le mode d'entrée (clavier/joystick, byte_721F0), gère le mapping EMS
; (sub_2075B référencé) et l'INT15 AH=12h fonction 0x4355h (calibration périphérique) :
; gestionnaire de calibration de périphérique d'entrée (joystick/manche), à approfondir.
; ==============================================================================================
Input_CalibrationHandler	proc far		; CODE XREF: Config_ReadCalibration:loc_27065P

var_150		= word ptr -150h
var_F3		= dword	ptr -0F3h
var_EF		= dword	ptr -0EFh
var_EA		= word ptr -0EAh
var_9A		= word ptr -9Ah
var_74		= word ptr -74h
var_65		= word ptr -65h
var_4B		= byte ptr -4Bh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_1F		= byte ptr -1Fh
var_1E		= word ptr -1Eh
var_1B		= byte ptr -1Bh
var_1A		= dword	ptr -1Ah
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 150h
		push	si
		mov	[bp+var_4], 100h
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		cmp	byte_721F0, 2
		jnz	short loc_27FE1
		mov	ax, 1
		jmp	short loc_27FE3
; ���������������������������������������������������������������������������

loc_27FE1:				; CODE XREF: Input_CalibrationHandler+3Cj
		xor	ax, ax

loc_27FE3:				; CODE XREF: Input_CalibrationHandler+41j
		or	ax, ax
		jz	short loc_2800D
		cmp	byte_721F0, 2
		jnz	short loc_27FFD
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_27FFD:				; CODE XREF: Input_CalibrationHandler+4Ej
		xor	dx, dx
		mov	cl, 0
		mov	ch, 2
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		jmp	short loc_2801C
; ���������������������������������������������������������������������������

loc_2800D:				; CODE XREF: Input_CalibrationHandler+47j
		push	5196h
		push	word_70E62
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4

loc_2801C:				; CODE XREF: Input_CalibrationHandler+6Dj
		push	ds
		push	offset a_shp_0	; ".shp"
		push	ds
		push	offset aChkexit	; "chkexit"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_EA]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_150], 2C8h
		mov	[bp+var_EF], 100h

loc_2804F:
		mov	[bp+var_F3], 0
		mov	[bp+var_150], 138Ah
		push	1
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		mov	bx, [bp+var_150]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_2C+2],	dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_E], eax
		mov	[bp+var_A], 3
		mov	[bp+var_9], 1
		mov	[bp+var_8], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_8], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_24]
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_150]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	byte_72340, 1
		push	large [dword_724CD]
		push	0
		call	VROOMM_StubThunk_6C767
		add	sp, 6
		mov	[bp+var_10], 0FFFFh
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_65], 0
		jnz	short loc_28144
		mov	[bp+var_4B], 0
		jmp	short $+2

loc_28144:				; CODE XREF: Input_CalibrationHandler+19Ej
		push	large 30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax

loc_28151:
		jnz	short loc_28156

loc_28153:
		jmp	loc_281DB
; ���������������������������������������������������������������������������

loc_28156:				; CODE XREF: Input_CalibrationHandler:loc_28151j
		push	large 0B0031h

loc_2815C:
		push	large 0AF005Bh
		push	ax

loc_28163:
		call	VROOMM_StubThunk_6C76C

loc_28168:
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 12E2h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_14], eax
		mov	al, [bp+var_A]
		mov	[bp+var_15], al
		mov	eax, [bp+var_14]
		mov	[si+1Eh], eax
		mov	al, [bp+var_15]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_8]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 1
		mov	word ptr [si+0Eh], 1316h
		lea	ax, [bp+var_10]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 1
		mov	word ptr [si+0Eh], 134Ah
		mov	word ptr [si+2Eh], 2
		mov	ax, si
		jmp	short loc_281DD
; ���������������������������������������������������������������������������

loc_281DB:				; CODE XREF: Input_CalibrationHandler:loc_28153j
		mov	ax, si

loc_281DD:				; CODE XREF: Input_CalibrationHandler+23Bj
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_74]
		push	15h
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		push	large 30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_2820F
		jmp	loc_28294
; ���������������������������������������������������������������������������

loc_2820F:				; CODE XREF: Input_CalibrationHandler+26Cj
		push	large 0B0031h
		push	large 0AF00A4h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 12E2h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0

loc_28241:
		mov	eax, [bp+var_E]

loc_28245:
		mov	[bp+var_1A], eax
		mov	al, [bp+var_A]

loc_2824C:
		mov	[bp+var_1B], al

loc_2824F:
		mov	eax, [bp+var_1A]

loc_28253:
		mov	[si+1Eh], eax

loc_28257:
		mov	al, [bp+var_1B]

loc_2825A:
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0

loc_28261:
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_8]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 3
		mov	word ptr [si+0Eh], 1316h
		lea	ax, [bp+var_10]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 0
		mov	word ptr [si+0Eh], 134Ah
		mov	word ptr [si+2Eh], 4
		mov	ax, si
		jmp	short loc_28296
; ���������������������������������������������������������������������������

loc_28294:				; CODE XREF: Input_CalibrationHandler+26Ej
		mov	ax, si

loc_28296:				; CODE XREF: Input_CalibrationHandler+2F4j
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_74]
		push	31h ; '1'
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		push	[bp+var_74]
		push	1
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C996
		pop	cx
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		push	large 0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 870005h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		jmp	short loc_28324
; ���������������������������������������������������������������������������

loc_28315:				; CODE XREF: Input_CalibrationHandler+38Aj
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4

loc_28324:				; CODE XREF: Input_CalibrationHandler+375j
		cmp	[bp+var_10], 0FFFFh
		jz	short loc_28315
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_67F60
		cmp	byte_721F0, 2
		jnz	short loc_28346
		mov	ax, 1
		jmp	short loc_28348
; ���������������������������������������������������������������������������

loc_28346:				; CODE XREF: Input_CalibrationHandler+3A1j
		xor	ax, ax

loc_28348:				; CODE XREF: Input_CalibrationHandler+3A6j
		or	ax, ax
		jz	short loc_2836A
		xor	dx, dx

loc_2834E:
		mov	cl, 2

loc_28350:
		mov	ch, 1

loc_28352:
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		xor	dx, dx

loc_2835C:
		mov	cl, 2
		mov	ch, 0

loc_28360:
		mov	bx, 4355h

loc_28363:
		mov	ax, 1209h
		int	15h
		jmp	short loc_28379
; ���������������������������������������������������������������������������

loc_2836A:				; CODE XREF: Input_CalibrationHandler+3ACj
		push	word_70E62
		push	5196h
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4

loc_28379:				; CODE XREF: Input_CalibrationHandler+3CAj
		cmp	byte_721F0, 2
		jnz	short loc_28385
		mov	ax, 1
		jmp	short loc_28387
; ���������������������������������������������������������������������������

loc_28385:				; CODE XREF: Input_CalibrationHandler+3E0j
		xor	ax, ax

loc_28387:				; CODE XREF: Input_CalibrationHandler+3E5j
		or	ax, ax
		jz	short loc_283CC
		cmp	byte_721F0, 2
		jnz	short loc_283CC
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_1E], bx
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
		cmp	[bp+var_1E], 0
		jnz	short loc_283CC
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short $+2

loc_283CC:				; CODE XREF: Input_CalibrationHandler+3EBj
					; Input_CalibrationHandler+3F2j ...
		mov	al, byte ptr [bp+var_10]
		mov	[bp+var_1F], al
		push	2
		lea	ax, [bp+var_9A]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4
		cmp	[bp+var_9], 0
		jz	short loc_28405
		cmp	[bp+var_E], 0
		jz	short loc_28405
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_28405:				; CODE XREF: Input_CalibrationHandler+447j
					; Input_CalibrationHandler+44Ej
		mov	al, [bp+var_1F]
		pop	si
		leave
		retf
Input_CalibrationHandler	endp

; ���������������������������������������������������������������������������

loc_2840B:				; DATA XREF: TextRenderer_Main+8C5o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+8], 2
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0FFFFh
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28438:				; DATA XREF: TextRenderer_Main+923o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_28451

loc_28443:
		push	8
		call	CRT_Malloc16_Retry
		pop	cx

loc_2844B:
		mov	si, ax
		or	ax, ax
		jz	short loc_28464

loc_28451:				; CODE XREF: seg048:1161j
		mov	word ptr [si], 0

loc_28455:
		mov	word ptr [si+2], 0

loc_2845A:
		mov	word ptr [si+6], 0FFFFh

loc_2845F:
		mov	word ptr [si+4], 0FFFFh

loc_28464:				; CODE XREF: seg048:116Fj
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28469:				; DATA XREF: seg339:1312o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_284C8
		cmp	byte ptr [si+23h], 0
		jz	short loc_2849E
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_2849E
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2849E:				; CODE XREF: seg048:119Cj seg048:11A3j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_284C8
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_284C8:				; CODE XREF: seg048:1196j seg048:11DDj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_284CC:				; DATA XREF: seg339:1346o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2852B
		cmp	byte ptr [si+23h], 0
		jz	short loc_28501
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_28501
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_28501:				; CODE XREF: seg048:11FFj seg048:1206j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_2852B
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_2852B:				; CODE XREF: seg048:11F9j seg048:1240j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2852F:				; DATA XREF: seg339:137Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2858E
		cmp	byte ptr [si+23h], 0
		jz	short loc_28564
		cmp	dword ptr [si+1Eh], 0

loc_28549:
		jz	short loc_28564
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_28564:				; CODE XREF: seg048:1262j
					; seg048:loc_28549j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_2858E
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_2858E:				; CODE XREF: seg048:125Cj seg048:12A3j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28592:				; DATA XREF: seg339:137Eo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		call	VROOMM_StubThunk_6D05A
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_285A1:				; DATA XREF: seg339:1382o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		call	VROOMM_StubThunk_6D024
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_285B0:				; DATA XREF: seg339:1386o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		call	VROOMM_StubThunk_6CFCD
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_285BF:				; DATA XREF: seg339:138Ao
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		call	StreamReader_DestructWrapper_659C1
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_285CE:				; DATA XREF: seg339:138Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_285F9
		mov	word ptr [si], 138Ah
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		test	di, 1
		jz	short loc_285F9
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_285F9:				; CODE XREF: seg048:12FBj seg048:1310j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_285FD:				; DATA XREF: seg339:13A2o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		call	TextObject_CloseAndLog_5A856
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2860C:				; DATA XREF: seg339:13AAo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2863E
		mov	word ptr [si], 13A6h
		push	si
		call	StreamReader_CloseAndUnregister_642FF
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_63BD5
		add	sp, 4
		test	di, 1
		jz	short loc_2863E
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_2863E:				; CODE XREF: seg048:1339j seg048:1355j
		pop	di
		pop	si

loc_28640:
		pop	bp
		retf
seg048		ends
