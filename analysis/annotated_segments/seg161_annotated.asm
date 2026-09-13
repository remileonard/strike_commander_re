seg161		segment	byte public 'CODE' use16
		assume cs:seg161
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
word_5F7B4	dw 0			; DATA XREF: ModuleRegistry_Helper_5FE61+5w
					; ModuleRegistry_RegisterModule_5FF08+50w ...
word_5F7B6	dw 0			; DATA XREF: seg161:loc_5FBBEr
					; seg161:loc_5FBC9w ...
byte_5F7B8	db 40h dup(0)
word_5F7F8	dw 0			; DATA XREF: ModuleRegistry_HookTimerIRQ_5FCCA+21w
word_5F7FA	dw 0			; DATA XREF: ModuleRegistry_HookTimerIRQ_5FCCA+26w
		db 42h dup(0)
word_5F83E	dw 0			; DATA XREF: ModuleRegistry_RegisterModule_5FF08+62w
byte_5F840	db 88h dup(0)
word_5F8C8	dw 0			; DATA XREF: seg161:045Er
					; ModuleRegistry_ResetTables_5FC8D:loc_5FC93w	...
word_5F8CA	dw 0			; DATA XREF: seg161:0463r
					; ModuleRegistry_ResetTables_5FC8D:loc_5FC9Aw	...
dword_5F8CC	dd 0			; DATA XREF: seg161:0514r
					; ModuleRegistry_HookTimerIRQ_5FCCA+14w ...
word_5F8D0	dw 0			; DATA XREF: seg161:0437w
					; seg161:loc_5FBEEr ...
word_5F8D2	dw 0			; DATA XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+6w
					; ModuleRegistry_RecomputeGlobalTickRate_5FDD2+38r ...
word_5F8D4	dw 0			; DATA XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+Dw
					; ModuleRegistry_RecomputeGlobalTickRate_5FDD2+2Fr ...
word_5F8D6	dw 0			; DATA XREF: ModuleRegistry_ProgramPITFrequency_5FD3A+Fw seg161:09A1r
byte_5F8D8	db 84h dup(0)
word_5F95C	dw 0			; DATA XREF: ModuleRegistry_CleanupModuleSlot_5FE9F+8w
					; ModuleRegistry_CleanupModuleSlot_5FE9F:loc_5FEAEr	...
		db 4 dup(0)
word_5F962	dw 0			; DATA XREF: ModuleRegistry_ConfigureModuleExtended_60254:loc_60265w
					; ModuleRegistry_ConfigureModuleExtended_60254+56w ...
aTest		db 'Test',0             ; DATA XREF: seg161:04C6r seg161:04CFr
byte_5F969	db 203h	dup(0)
word_5FB6C	dw 0D3h			; DATA XREF: ModuleRegistry_QueryOrDispatch_6015A:loc_601CDr

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⭐ far, recherche un gestionnaire enregistré : cherche dans la table du module bx (0-15) une
; entrée dont le tag (mot) correspond à ax, en parcourant un tableau jusqu'au sentinelle
; 0xFFFF ; retourne l'adresse du gestionnaire (es:bx+2) si trouvé, sinon 0. Cœur du système de
; recherche du registre de modules.
; ==============================================================================================
ModuleRegistry_LookupHandler_5FB6E	proc far		; CODE XREF: ModuleRegistry_DispatchTrampoline_5FBA6+7p
					; ModuleRegistry_ConfigureModuleExtended_60254+36p
		cmp	bx, 10h
		jnb	short loc_5FB98
		shl	bx, 1
		shl	bx, 1
		les	bx, cs:[bx+128h]
		mov	cx, es
		or	cx, bx
		jz	short loc_5FB98

loc_5FB82:				; CODE XREF: ModuleRegistry_LookupHandler_5FB6E+21j
		mov	cx, es:[bx]
		cmp	cx, ax
		jz	short loc_5FB9F
		add	bx, 4
		cmp	cx, 0FFFFh
		jnz	short loc_5FB82
		mov	ax, 0
		mov	dx, 0
		retf
; ���������������������������������������������������������������������������

loc_5FB98:				; CODE XREF: ModuleRegistry_LookupHandler_5FB6E+3j
					; ModuleRegistry_LookupHandler_5FB6E+12j
		mov	ax, 0
		mov	dx, 0
		retf
; ���������������������������������������������������������������������������

loc_5FB9F:				; CODE XREF: ModuleRegistry_LookupHandler_5FB6E+19j
		mov	ax, es:[bx+2]

loc_5FBA3:
		mov	dx, es
		retf
ModuleRegistry_LookupHandler_5FB6E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⭐ far, trampoline de dispatch central : lit l'adresse de retour de son appelant sur la pile,
; appelle ModuleRegistry_LookupHandler_5FB6E, et si un gestionnaire est trouvé, réécrit
; l'adresse de retour de l'appelant pour rediriger l'exécution vers ce gestionnaire au lieu du
; code d'origine. C'est le point d'entrée commun de dizaines de « thunks d'opcode » (sub_603xx
; et apparentés) répartis dans toute la base — chacun pose un identifiant d'opcode dans AX
; puis saute ici. Mécanisme de type hook/plugin transparent.
; ==============================================================================================
ModuleRegistry_DispatchTrampoline_5FBA6	proc far		; CODE XREF: ModuleRegistry_QueryOrDispatch_6015A+99p
					; ModuleRegistry_QueryModuleField_60228+1Ep ...
		mov	bx, sp

loc_5FBA8:
		mov	bx, ss:[bx+4]
		push	cs
		call	near ptr ModuleRegistry_LookupHandler_5FB6E
		cmp	ax, 0
		jnz	short loc_5FBBA
		cmp	dx, 0
		jz	short locret_5FBBD

loc_5FBBA:				; CODE XREF: ModuleRegistry_DispatchTrampoline_5FBA6+Dj
		push	dx
		push	ax
		retf
; ���������������������������������������������������������������������������

locret_5FBBD:				; CODE XREF: ModuleRegistry_DispatchTrampoline_5FBA6+12j
		retf
ModuleRegistry_DispatchTrampoline_5FBA6	endp

; ���������������������������������������������������������������������������

loc_5FBBE:
		cmp	cs:word_5F7B6, 0
		jz	short loc_5FBC9
		jmp	loc_5FC70
; ���������������������������������������������������������������������������

loc_5FBC9:				; CODE XREF: seg161:0414j
		mov	cs:word_5F7B6, 1
		cld
		push	ax
		mov	word ptr cs:byte_5F969+1FFh, ss
		mov	word ptr cs:byte_5F969+201h, sp
		mov	ax, cs
		mov	ss, ax
		assume ss:seg161
		mov	sp, 3B8h
		pushad
		push	es
		push	ds
		mov	cs:word_5F8D0, 0

loc_5FBEE:				; CODE XREF: seg161:04A8j
		mov	si, cs:word_5F8D0
		shl	si, 1
		cmp	word ptr cs:[si+6Eh], 2
		jnz	short loc_5FC4D
		mov	ds, word ptr cs:[si+4Ch]
		shl	si, 1
		mov	ax, cs:[si+90h]
		mov	dx, cs:[si+92h]
		add	ax, cs:word_5F8C8
		adc	dx, cs:word_5F8CA
		cmp	dx, cs:[si+0D6h]
		jb	short loc_5FC28
		ja	short loc_5FC34
		cmp	ax, cs:[si+0D4h]
		jnb	short loc_5FC34

loc_5FC28:				; CODE XREF: seg161:046Dj
		mov	cs:[si+90h], ax
		mov	cs:[si+92h], dx
		jmp	short loc_5FC4D
; ���������������������������������������������������������������������������

loc_5FC34:				; CODE XREF: seg161:046Fj seg161:0476j
		sub	ax, cs:[si+0D4h]

loc_5FC39:
		sbb	dx, cs:[si+0D6h]
		mov	cs:[si+90h], ax
		mov	cs:[si+92h], dx
		call	dword ptr cs:[si+8]

loc_5FC4D:				; CODE XREF: seg161:044Bj seg161:0482j
		inc	cs:word_5F8D0
		cmp	cs:word_5F8D0, 10h
		jbe	short loc_5FBEE
		pop	ds
		pop	es
		popad
		mov	ss, word ptr cs:byte_5F969+1FFh
		assume ss:nothing
		mov	sp, word ptr cs:byte_5F969+201h
		mov	cs:word_5F7B6, 0
		pop	ax

loc_5FC70:				; CODE XREF: seg161:0416j
		push	ax
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		pop	ax
		cmp	word ptr cs:aTest, 6554h ; "Test"
		jnz	short loc_5FC89
		cmp	word ptr cs:aTest+2, 7473h
		jnz	short loc_5FC89
		iret
; ���������������������������������������������������������������������������

loc_5FC89:				; CODE XREF: seg161:04CDj seg161:04D6j ...
		sti
		int	3		; Trap to Debugger
		jmp	short loc_5FC89

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, désactive les interruptions, met à zéro les 3 tables internes du registre (17+34+34
; mots, offsets 0x6E/0x90/0xD4 du segment) — initialisation complète du système au premier
; enregistrement. Appelée par ModuleRegistry_RegisterModule_5FF08.
; ==============================================================================================
ModuleRegistry_ResetTables_5FC8D	proc far		; CODE XREF: ModuleRegistry_RegisterModule_5FF08+5Fp
		push	ds
		push	si
		push	di
		pushf
		cli
		cld

loc_5FC93:
		mov	cs:word_5F8C8, 0FFFFh

loc_5FC9A:
		mov	cs:word_5F8CA, 0FFFFh
		push	cs

loc_5FCA2:
		pop	es
		assume es:seg161
		mov	di, 6Eh	; 'n'
		mov	cx, 11h
		mov	ax, 0
		rep stosw
		mov	di, 90h	; '�'
		mov	cx, 22h	; '"'
		rep stosw
		mov	di, 0D4h ; '�'
		mov	cx, 22h	; '"'
		rep stosw
		popf
		pop	di
		pop	si

loc_5FCC1:
		pop	ds
		retf
ModuleRegistry_ResetTables_5FC8D	endp

; ���������������������������������������������������������������������������
		pushf
		call	cs:dword_5F8CC
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⭐ far, détourne le vecteur d'interruption matérielle IRQ0 (INT 8, minuteur PIT) : sauvegarde
; l'ancien vecteur (table des vecteurs d'interruption à 0000:0020) dans cs:dword_5F8CC, puis
; installe un nouveau gestionnaire à (cs):0x40E. Appelée par
; ModuleRegistry_RegisterModule_5FF08 lors du tout premier enregistrement.
; ==============================================================================================
ModuleRegistry_HookTimerIRQ_5FCCA	proc far		; CODE XREF: ModuleRegistry_RegisterModule_5FF08+6Ap
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	ax, 0

loc_5FCD2:
		mov	es, ax
		assume es:seg000

loc_5FCD4:
		mov	bx, word ptr es:loc_1D+3
		mov	es, word ptr es:loc_21+1
		assume es:nothing
		mov	word ptr cs:dword_5F8CC, bx
		mov	word ptr cs:dword_5F8CC+2, es
		mov	bx, 513h
		mov	cs:word_5F7F8, bx
		mov	cs:word_5F7FA, cs
		mov	ax, cs
		mov	ds, ax
		assume ds:seg161
		mov	dx, 40Eh
		mov	ax, 0
		mov	es, ax
		assume es:seg000
		mov	word ptr es:loc_1D+3, dx
		mov	word ptr es:loc_21+1, ds
		popf
		pop	di
		pop	si
		pop	ds
		assume ds:seg339
		retf
ModuleRegistry_HookTimerIRQ_5FCCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, restaure le vecteur d'interruption IRQ0 original sauvegardé par
; ModuleRegistry_HookTimerIRQ_5FCCA. Appelée par ModuleRegistry_UnregisterModule_5FFBD lors du
; dernier désenregistrement.
; ==============================================================================================
ModuleRegistry_UnhookTimerIRQ_5FD10	proc far		; CODE XREF: ModuleRegistry_UnregisterModule_5FFBD+3Ap
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_5F8D0, 0FFFFh
		mov	dx, word ptr cs:dword_5F8CC
		mov	ds, word ptr cs:dword_5F8CC+2
		mov	ax, 0
		mov	es, ax
		mov	word ptr es:loc_1D+3, dx

loc_5FD30:
		mov	word ptr es:loc_21+1, ds
		popf
		pop	di
		pop	si

loc_5FD38:
		pop	ds
		retf
ModuleRegistry_UnhookTimerIRQ_5FD10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, reprogramme la puce minuterie 8253/8254 (PIT) : envoie l'octet de commande 0x36 (port
; 0x43, mode 3 binaire) puis le diviseur de fréquence 16 bits (port 0x40) — change la cadence
; de tic du minuteur matériel. Appelée par ModuleRegistry_SetTickRateHz_5FD5D et
; ModuleRegistry_UnregisterModule_5FFBD (restauration à la fréquence par défaut).
; ==============================================================================================
ModuleRegistry_ProgramPITFrequency_5FD3A	proc far		; CODE XREF: ModuleRegistry_SetTickRateHz_5FD5D+1Fp
					; ModuleRegistry_UnregisterModule_5FFBD+33p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli

loc_5FD42:
		mov	al, 36h	; '6'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).

loc_5FD46:
		mov	ax, [bp+arg_0]
		mov	cs:word_5F8D6, ax
		jmp	short $+2
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		jmp	short $+2
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_ProgramPITFrequency_5FD3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, convertit une fréquence en Hz en diviseur PIT (formule standard base ~1.193 MHz) et
; l'applique via ModuleRegistry_ProgramPITFrequency_5FD3A.
; ==============================================================================================
ModuleRegistry_SetTickRateHz_5FD5D	proc far		; CODE XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+77p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		mov	ax, 0
		cmp	[bp+arg_0], 0D68Dh
		jnb	short loc_5FD7A
		mov	ax, [bp+arg_0]
		mov	bx, 20BCh
		mov	cx, 2710h
		mul	cx
		div	bx

loc_5FD7A:				; CODE XREF: ModuleRegistry_SetTickRateHz_5FD5D+Ej
		push	ax
		push	cs
		call	near ptr ModuleRegistry_ProgramPITFrequency_5FD3A
		add	sp, 2
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_SetTickRateHz_5FD5D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, configure les paramètres de cadence d'un module enregistré (4 arguments). Appelée par
; ModuleRegistry_ConfigureAndActivate_600DB.
; ==============================================================================================
ModuleRegistry_ConfigureModuleTiming_5FD87	proc far		; CODE XREF: ModuleRegistry_ConfigureAndActivate_600DB+23p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		mov	ax, [bp+arg_0]

loc_5FD90:
		mov	dx, [bp+arg_2]

loc_5FD93:
		mov	bx, [bp+arg_4]
		mov	cx, [bp+arg_6]
		or	cx, cx
		jnz	short loc_5FDA5

loc_5FD9D:
		or	dx, dx

loc_5FD9F:
		jz	short loc_5FDC9
		or	bx, bx

loc_5FDA3:
		jz	short loc_5FDC9

loc_5FDA5:				; CODE XREF: ModuleRegistry_ConfigureModuleTiming_5FD87+14j
		mov	bp, cx
		mov	cx, 20h	; ' '
		xor	di, di
		xor	si, si

loc_5FDAE:				; CODE XREF: ModuleRegistry_ConfigureModuleTiming_5FD87:loc_5FDC5j
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_5FDC5
		ja	short loc_5FDC0
		cmp	si, bx
		jb	short loc_5FDC5

loc_5FDC0:				; CODE XREF: ModuleRegistry_ConfigureModuleTiming_5FD87+33j
		sub	si, bx
		sbb	di, bp

loc_5FDC4:
		inc	ax

loc_5FDC5:				; CODE XREF: ModuleRegistry_ConfigureModuleTiming_5FD87+31j
					; ModuleRegistry_ConfigureModuleTiming_5FD87+37j
		loop	loc_5FDAE

loc_5FDC7:
		jmp	short loc_5FDCD
; ���������������������������������������������������������������������������

loc_5FDC9:				; CODE XREF: ModuleRegistry_ConfigureModuleTiming_5FD87:loc_5FD9Fj
					; ModuleRegistry_ConfigureModuleTiming_5FD87:loc_5FDA3j
		div	bx
		xor	dx, dx

loc_5FDCD:				; CODE XREF: ModuleRegistry_ConfigureModuleTiming_5FD87:loc_5FDC7j
		pop	di

loc_5FDCE:
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_ConfigureModuleTiming_5FD87	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, parcourt tous les modules actifs pour recalculer et appliquer la fréquence de tic
; globale (ModuleRegistry_SetTickRateHz_5FD5D). Appelée par sub_6008C.
; ==============================================================================================
ModuleRegistry_RecomputeGlobalTickRate_5FDD2	proc far		; CODE XREF: ModuleRegistry_ConfigureAndActivate_6008C+3Bp
		push	ds

loc_5FDD3:
		push	si
		push	di
		pushf
		cli
		cld
		mov	cs:word_5F8D2, 0FFFFh
		mov	cs:word_5F8D4, 0FFFFh
		mov	si, 0

loc_5FDE9:				; CODE XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+4Cj
		mov	bx, si
		shl	bx, 1
		cmp	word ptr cs:[bx+6Eh], 0
		jz	short loc_5FE1A
		shl	bx, 1
		mov	ax, cs:[bx+0D4h]
		mov	dx, cs:[bx+0D6h]
		cmp	dx, cs:word_5F8D4
		jb	short loc_5FE11
		ja	short loc_5FE1A
		cmp	ax, cs:word_5F8D2
		jnb	short loc_5FE1A

loc_5FE11:				; CODE XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+34j
		mov	cs:word_5F8D2, ax
		mov	cs:word_5F8D4, dx

loc_5FE1A:				; CODE XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+21j
					; ModuleRegistry_RecomputeGlobalTickRate_5FDD2+36j ...
		inc	si
		cmp	si, 10h
		jbe	short loc_5FDE9
		mov	ax, cs:word_5F8D2
		mov	dx, cs:word_5F8D4
		cmp	ax, cs:word_5F8C8
		jnz	short loc_5FE37

loc_5FE30:
		cmp	dx, cs:word_5F8CA
		jz	short loc_5FE5C

loc_5FE37:				; CODE XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+5Cj
		mov	cs:word_5F8D0, 0FFFFh
		mov	cs:word_5F8C8, ax
		mov	cs:word_5F8CA, dx
		push	ax
		push	cs
		call	near ptr ModuleRegistry_SetTickRateHz_5FD5D
		add	sp, 2
		push	cs
		pop	es
		assume es:seg161
		mov	di, 90h	; '�'
		mov	cx, 22h	; '"'
		mov	ax, 0
		rep stosw

loc_5FE5C:				; CODE XREF: ModuleRegistry_RecomputeGlobalTickRate_5FDD2+63j
		popf
		pop	di
		pop	si
		pop	ds
		retf
ModuleRegistry_RecomputeGlobalTickRate_5FDD2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé, voisin du cluster registre de
; modules).
; ==============================================================================================
ModuleRegistry_Helper_5FE61	proc far		; CODE XREF: Stopwatch_RegisterTickModule_67611:loc_67621P
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_5F7B4, 0
		mov	cs:word_5F7B6, 0
		cld
		mov	ax, cs
		mov	es, ax
		mov	di, 128h
		mov	cx, 20h	; ' '
		mov	ax, 0
		rep stosw
		mov	di, 168h
		mov	cx, 10h
		mov	ax, 0FFFFh
		rep stosw
		mov	di, 188h
		mov	cx, 10h
		mov	ax, 0
		rep stosw
		popf
		pop	di
		pop	si
		pop	ds
		retf
ModuleRegistry_Helper_5FE61	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ModuleRegistry_UnregisterModule_5FFBD, sub_60303 et
; ModuleRegistry_UnregisterAll_60000 — nettoyage complet d'un emplacement de module.
; ==============================================================================================
ModuleRegistry_CleanupModuleSlot_5FE9F	proc far		; CODE XREF: Stopwatch_StartOrStop_676F1:loc_67711P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	ds

loc_5FEA3:
		push	si
		push	di
		pushf
		cli
		mov	cs:word_5F95C, 0

loc_5FEAE:				; CODE XREF: ModuleRegistry_CleanupModuleSlot_5FE9F+5Dj
		mov	si, cs:word_5F95C
		shl	si, 1
		mov	dx, cs:[si+168h]
		shl	si, 1
		mov	ax, cs:[si+128h]
		or	ax, cs:[si+12Ah]
		jz	short loc_5FEF1
		cmp	dx, 0FFFFh
		jz	short loc_5FED5
		push	dx
		push	cs
		call	near ptr ModuleRegistry_UnregisterModule_5FFBD
		add	sp, 2

loc_5FED5:				; CODE XREF: ModuleRegistry_CleanupModuleSlot_5FE9F+2Cj
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs:word_5F95C
		push	cs
		call	near ptr ModuleRegistry_CleanupModuleReference_60303
		add	sp, 8

loc_5FEF1:				; CODE XREF: ModuleRegistry_CleanupModuleSlot_5FE9F+27j
		inc	cs:word_5F95C
		cmp	cs:word_5F95C, 10h
		jnz	short loc_5FEAE
		push	cs
		call	near ptr ModuleRegistry_UnregisterAll_60000
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_CleanupModuleSlot_5FE9F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, enregistre un nouveau module dans la table de 16 emplacements : trouve le premier
; emplacement libre, y stocke l'adresse du gestionnaire (far ptr fourni en argument),
; incrémente le compteur global. Au tout premier enregistrement, initialise tout le système
; (ModuleRegistry_ResetTables_5FC8D, ModuleRegistry_HookTimerIRQ_5FCCA) et configure le
; minuteur (ModuleRegistry_ConfigureAndActivate_600DB). Référencée par sub_60254 et sub_67611.
; ==============================================================================================
ModuleRegistry_RegisterModule_5FF08	proc far		; CODE XREF: ModuleRegistry_ConfigureModuleExtended_60254+46p
					; Stopwatch_RegisterTickModule_67611+1BP ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cx, ds
		mov	bx, 0

loc_5FF15:				; CODE XREF: ModuleRegistry_RegisterModule_5FF08+1Bj
		cmp	word ptr cs:[bx+6Eh], 0
		jz	short loc_5FF2B
		add	bx, 2
		cmp	bx, 20h	; ' '
		jb	short loc_5FF15
		mov	ax, 0FFFFh
		jmp	loc_5FFB7
; ���������������������������������������������������������������������������

loc_5FF2B:				; CODE XREF: ModuleRegistry_RegisterModule_5FF08+13j
		mov	ax, bx
		shr	ax, 1

loc_5FF2F:
		mov	word ptr cs:[bx+6Eh], 1
		mov	cs:[bx+4Ch], cx
		shl	bx, 1
		lds	si, [bp+arg_0]
		mov	cs:[bx+8], si
		mov	word ptr cs:[bx+0Ah], ds
		mov	word ptr cs:[bx+0D4h], 0FFFFh
		mov	word ptr cs:[bx+0D6h], 0FFFFh
		inc	cs:word_5F7B4
		cmp	cs:word_5F7B4, 1
		jnz	short loc_5FFB7
		push	ax
		push	cs
		call	near ptr ModuleRegistry_ResetTables_5FC8D
		mov	cs:word_5F83E, 1
		push	cs
		call	near ptr ModuleRegistry_HookTimerIRQ_5FCCA
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0D68Dh
		pop	bp
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 10h
		pop	bp
		push	cs
		call	near ptr ModuleRegistry_ConfigureAndActivate_6008C
		add	sp, 6
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 10h
		pop	bp
		push	cs
		call	near ptr ModuleRegistry_Helper_60018
		add	sp, 2
		pop	ax
		mov	bx, ax
		shl	bx, 1
		mov	word ptr cs:[bx+6Eh], 1

loc_5FFB7:				; CODE XREF: ModuleRegistry_RegisterModule_5FF08+20j
					; ModuleRegistry_RegisterModule_5FF08+5Bj
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_RegisterModule_5FF08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, désenregistre un emplacement de module ; au tout dernier désenregistrement, restaure la
; fréquence PIT par défaut et désinstalle le hook IRQ0 (ModuleRegistry_UnhookTimerIRQ_5FD10).
; ==============================================================================================
ModuleRegistry_UnregisterModule_5FFBD	proc far		; CODE XREF: ModuleRegistry_CleanupModuleSlot_5FE9F+30p
					; ModuleRegistry_UnregisterAll_60000+Ap	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	bx, [bp+arg_0]
		cmp	bx, 0FFFFh
		jz	short loc_5FFFA
		shl	bx, 1

loc_5FFCF:
		cmp	word ptr cs:[bx+6Eh], 0
		jz	short loc_5FFFA
		mov	word ptr cs:[bx+6Eh], 0
		dec	cs:word_5F7B4
		jnz	short loc_5FFFA
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	cs
		call	near ptr ModuleRegistry_ProgramPITFrequency_5FD3A
		add	sp, 2
		push	cs
		call	near ptr ModuleRegistry_UnhookTimerIRQ_5FD10

loc_5FFFA:				; CODE XREF: ModuleRegistry_UnregisterModule_5FFBD+Ej
					; ModuleRegistry_UnregisterModule_5FFBD+18j ...
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_UnregisterModule_5FFBD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, désenregistre les 16 emplacements du registre en boucle
; (ModuleRegistry_UnregisterModule_5FFBD).
; ==============================================================================================
ModuleRegistry_UnregisterAll_60000	proc far		; CODE XREF: ModuleRegistry_CleanupModuleSlot_5FE9F+60p
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	si, 0Fh

loc_60008:				; CODE XREF: ModuleRegistry_UnregisterAll_60000+11j
		push	si
		push	cs
		call	near ptr ModuleRegistry_UnregisterModule_5FFBD
		add	sp, 2
		dec	si
		jge	short loc_60008
		popf
		pop	di
		pop	si
		pop	ds
		retf
ModuleRegistry_UnregisterAll_60000	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
ModuleRegistry_Helper_60018	proc far		; CODE XREF: ModuleRegistry_RegisterModule_5FF08+9Dp
					; seg161:loc_60044p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	bx, [bp+arg_0]
		shl	bx, 1
		cmp	word ptr cs:[bx+6Eh], 1
		jnz	short loc_60034

loc_6002D:
		mov	word ptr cs:[bx+6Eh], 2

loc_60034:				; CODE XREF: ModuleRegistry_Helper_60018+13j
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_Helper_60018	endp

; ���������������������������������������������������������������������������
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	si, 0Fh

loc_60042:				; CODE XREF: seg161:089Bj
		push	si
		push	cs

loc_60044:
		call	near ptr ModuleRegistry_Helper_60018
		add	sp, 2
		dec	si
		jge	short loc_60042
		popf
		pop	di
		pop	si
		pop	ds
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
ModuleRegistry_Helper3_60052	proc far		; CODE XREF: seg161:08CEp
					; seg207:loc_676C7P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	bx, [bp+arg_0]
		shl	bx, 1
		cmp	word ptr cs:[bx+6Eh], 2
		jnz	short loc_6006E
		mov	word ptr cs:[bx+6Eh], 1

loc_6006E:				; CODE XREF: ModuleRegistry_Helper3_60052+13j
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_Helper3_60052	endp

; ���������������������������������������������������������������������������
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	si, 0Fh

loc_6007C:				; CODE XREF: seg161:08D5j
		push	si
		push	cs
		call	near ptr ModuleRegistry_Helper3_60052
		add	sp, 2
		dec	si
		jge	short loc_6007C
		popf
		pop	di
		pop	si
		pop	ds
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique une configuration de cadence puis recalcule la fréquence globale
; (ModuleRegistry_RecomputeGlobalTickRate_5FDD2). Appelée par
; ModuleRegistry_RegisterModule_5FF08 et ModuleRegistry_ConfigureAndActivate_600DB.
; ==============================================================================================
ModuleRegistry_ConfigureAndActivate_6008C	proc far		; CODE XREF: ModuleRegistry_RegisterModule_5FF08+8Cp
					; ModuleRegistry_ConfigureAndActivate_600DB+2Fp ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	ds
		push	si

loc_60091:
		push	di
		pushf

loc_60093:
		cli
		mov	bx, [bp+arg_0]

loc_60097:
		shl	bx, 1

loc_60099:
		mov	ax, cs:[bx+6Eh]
		push	ax

loc_6009F:
		mov	word ptr cs:[bx+6Eh], 1
		shl	bx, 1
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cs:[bx+0D4h], ax
		mov	cs:[bx+0D6h], dx
		mov	word ptr cs:[bx+90h], 0

loc_600BF:
		mov	word ptr cs:[bx+92h], 0
		push	cs
		call	near ptr ModuleRegistry_RecomputeGlobalTickRate_5FDD2
		pop	ax
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	cs:[bx+6Eh], ax
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_ConfigureAndActivate_6008C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, configure la cadence d'un module (ModuleRegistry_ConfigureModuleTiming_5FD87) puis
; l'active (sub_6008C). Référencée par sub_60254 et sub_67611.
; ==============================================================================================
ModuleRegistry_ConfigureAndActivate_600DB	proc far		; CODE XREF: ModuleRegistry_ConfigureModuleExtended_60254+67p
					; Stopwatch_RegisterTickModule_67611+2FP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0Fh
		pop	bp
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 4240h
		pop	bp
		push	cs
		call	near ptr ModuleRegistry_ConfigureModuleTiming_5FD87
		add	sp, 8
		push	dx
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr ModuleRegistry_ConfigureAndActivate_6008C
		add	sp, 6
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_ConfigureAndActivate_600DB	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		cmp	word ptr [bp+8], 0
		jnz	short loc_6012C
		mov	ax, 0D68Dh
		mov	dx, 0
		jmp	short loc_6013A
; ���������������������������������������������������������������������������

loc_6012C:				; CODE XREF: seg161:0972j
		mov	ax, 2710h
		mov	bx, 2E9Ch

loc_60132:
		mul	word ptr [bp+8]
		div	bx

loc_60137:
		mov	dx, 0

loc_6013A:				; CODE XREF: seg161:097Aj
		push	dx
		push	ax

loc_6013C:
		push	word ptr [bp+6]
		push	cs
		call	near ptr ModuleRegistry_ConfigureAndActivate_6008C
		add	sp, 6
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	ax, cs:word_5F8D6
		popf
		pop	di
		pop	si
		pop	ds
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 90 lignes, NON DÉTAILLÉE — combine ModuleRegistry_QueryModuleField_60228 et
; ModuleRegistry_DispatchTrampoline_5FBA6.
; ==============================================================================================
ModuleRegistry_QueryOrDispatch_6015A	proc far		; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+113P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_5F95C, 0

loc_60169:				; CODE XREF: ModuleRegistry_QueryOrDispatch_6015A+2Fj
		mov	si, cs:word_5F95C
		shl	si, 1
		shl	si, 1
		mov	ax, cs:[si+128h]
		or	ax, cs:[si+12Ah]
		jz	short loc_60190
		inc	cs:word_5F95C
		cmp	cs:word_5F95C, 10h
		jnz	short loc_60169
		mov	ax, 0FFFFh
		jmp	short loc_601FA
; ���������������������������������������������������������������������������

loc_60190:				; CODE XREF: ModuleRegistry_QueryOrDispatch_6015A+22j
		les	di, [bp+arg_0]
		assume es:nothing
		mov	ax, 0FFFFh
		cmp	word ptr es:[di+2], 6F43h
		jnz	short loc_601FA
		cmp	word ptr es:[di+4], 7970h
		jnz	short loc_601FA
		add	di, es:[di]
		mov	cs:[si+128h], di
		mov	word ptr cs:[si+12Ah], es
		push	cs:word_5F95C
		push	cs
		call	near ptr ModuleRegistry_QueryModuleField_60228
		add	sp, 2
		mov	es, dx
		mov	di, ax

loc_601C3:
		or	dx, ax

loc_601C5:
		mov	ax, 0FFFFh
		jz	short loc_601FA

loc_601CA:
		mov	dx, es:[di]

loc_601CD:
		cmp	dx, cs:word_5FB6C

loc_601D2:
		ja	short loc_601FA

loc_601D4:
		mov	ax, cs:word_5F95C
		mov	bx, ax
		push	ax
		push	ds
		mov	ax, seg	seg127
		push	ax
		mov	ax, 3DCh
		push	ax
		mov	ax, word_709D0
		push	ax
		mov	eax, dword_709CC
		push	eax
		push	bx
		mov	ax, 0A0h ; '�'
		push	cs
		call	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
		add	sp, 0Eh
		pop	ax

loc_601FA:				; CODE XREF: ModuleRegistry_QueryOrDispatch_6015A+34j
					; ModuleRegistry_QueryOrDispatch_6015A+42j ...
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_QueryOrDispatch_6015A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un emplacement de module s'il est actif. Référencée directement par
; TextRenderer_Main (via Heap_ValidateBlockDetailed context, cf. seg124-160).
; ==============================================================================================
ModuleRegistry_ReleaseSlotIfSet_60200	proc far		; CODE XREF: TextObject_CloseAndLog_5A856:loc_5A87CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	bx, [bp+arg_0]
		cmp	bx, 10h
		jnb	short loc_60222
		shl	bx, 1
		shl	bx, 1
		mov	word ptr cs:[bx+128h], 0
		mov	word ptr cs:[bx+12Ah], 0

loc_60222:				; CODE XREF: ModuleRegistry_ReleaseSlotIfSet_60200+Ej
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_ReleaseSlotIfSet_60200	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, retourne un champ (segment:offset) de l'emplacement de module bx, avec vérification de
; borne (0-15). Appelée par ModuleRegistry_QueryOrDispatch_6015A et sub_60254.
; ==============================================================================================
ModuleRegistry_QueryModuleField_60228	proc far		; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+125P
					; ModuleRegistry_QueryOrDispatch_6015A+5Fp ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], seg seg161
		pop	bp
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 99Ch
		pop	bp
		push	[bp+arg_0]
		mov	ax, 64h	; 'd'
		push	cs
		call	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
		add	sp, 6
		pop	bp
		retf
ModuleRegistry_QueryModuleField_60228	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x65 → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; TextRenderer_InputFieldHandler (sub_5A0F3, seg124).
; ==============================================================================================
ModuleRegistry_Opcode_65_6024E	proc far		; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+17AP
		mov	ax, 65h	; 'e'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_65_6024E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 100 lignes, NON DÉTAILLÉE — combine ModuleRegistry_QueryModuleField_60228,
; ModuleRegistry_LookupHandler_5FB6E, ModuleRegistry_RegisterModule_5FF08,
; ModuleRegistry_ConfigureAndActivate_600DB. Référencée directement par
; TextRenderer_InputFieldHandler (sub_5A0F3, seg124).
; ==============================================================================================
ModuleRegistry_ConfigureModuleExtended_60254	proc far		; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+1B4P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		cmp	[bp+arg_0], 10h
		jb	short loc_60265
		jmp	loc_602FD
; ���������������������������������������������������������������������������

loc_60265:				; CODE XREF: ModuleRegistry_ConfigureModuleExtended_60254+Cj
		mov	cs:word_5F962, 0FFFFh
		push	[bp+arg_0]
		push	cs
		call	near ptr ModuleRegistry_QueryModuleField_60228
		add	sp, 2
		mov	es, dx
		mov	di, ax
		mov	si, es:[di+14h]
		cmp	si, 0FFFFh
		jz	short loc_602C1
		mov	ax, 67h	; 'g'
		mov	bx, [bp+arg_0]
		push	cs
		call	near ptr ModuleRegistry_LookupHandler_5FB6E
		mov	bx, ax
		or	bx, dx

loc_60291:
		jz	short loc_602C1
		mov	es, dx
		mov	bx, ax
		push	es
		push	bx
		push	cs
		call	near ptr ModuleRegistry_RegisterModule_5FF08
		add	sp, 4
		mov	bx, [bp+arg_0]

loc_602A3:
		shl	bx, 1
		mov	cs:[bx+168h], ax
		mov	cs:word_5F962, ax
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	si
		push	ax
		push	cs
		call	near ptr ModuleRegistry_ConfigureAndActivate_600DB
		add	sp, 6

loc_602C1:				; CODE XREF: ModuleRegistry_ConfigureModuleExtended_60254+2Dj
					; ModuleRegistry_ConfigureModuleExtended_60254:loc_60291j
		push	[bp+arg_A]
		push	[bp+arg_8]

loc_602C7:
		push	[bp+arg_6]
		push	[bp+arg_4]

loc_602CD:
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 66h	; 'f'
		push	cs
		call	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
		add	sp, 0Ch
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	word ptr cs:[bx+188h], 1
		cmp	cs:word_5F962, 0FFFFh
		jz	short loc_602FD
		push	cs:word_5F962
		push	cs
		call	near ptr ModuleRegistry_Helper_60018
		add	sp, 2

loc_602FD:				; CODE XREF: ModuleRegistry_ConfigureModuleExtended_60254+Ej
					; ModuleRegistry_ConfigureModuleExtended_60254+9Bj
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
ModuleRegistry_ConfigureModuleExtended_60254	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, nettoie une référence de module en attente (désenregistre via
; ModuleRegistry_UnregisterModule_5FFBD si nécessaire) puis dispatche l'opcode 0x68.
; Référencée directement par TextObject_CloseAndLog (sub_5A856, seg124).
; ==============================================================================================
ModuleRegistry_CleanupModuleReference_60303	proc far		; CODE XREF: TextObject_CloseAndLog_5A856+1BP
					; ModuleRegistry_CleanupModuleSlot_5FE9F+4Cp
		mov	bx, sp
		mov	bx, ss:[bx+4]
		cmp	bx, 10h
		jnb	short locret_60335
		shl	bx, 1
		mov	dx, 0
		xchg	dx, cs:[bx+188h]
		cmp	dx, 0
		jz	short locret_60335
		mov	dx, cs:[bx+168h]
		cmp	dx, 0FFFFh
		jz	short loc_6032F
		push	dx
		push	cs
		call	near ptr ModuleRegistry_UnregisterModule_5FFBD
		add	sp, 2

loc_6032F:				; CODE XREF: ModuleRegistry_CleanupModuleReference_60303+22j
		mov	ax, 68h	; 'h'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������

locret_60335:				; CODE XREF: ModuleRegistry_CleanupModuleReference_60303+9j
					; ModuleRegistry_CleanupModuleReference_60303+18j
		retf
ModuleRegistry_CleanupModuleReference_60303	endp

; ���������������������������������������������������������������������������
		mov	ax, 78h	; 'x'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 79h	; 'y'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 86h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 7Ah	; 'z'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x7B → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par sub_ABBEF
; et sub_ABDEC (cluster non encore couvert, seg171+ probable).
; ==============================================================================================
ModuleRegistry_Opcode_7B_6034E	proc far		; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+19BP
					; AudioQueue_FinalizeAndRelease_ABDEC:loc_ABE44P
		mov	ax, 7Bh	; '{'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_7B_6034E	endp

; ���������������������������������������������������������������������������
		mov	ax, 85h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x7C → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par sub_ABDAF
; et sub_ABDEC.
; ==============================================================================================
ModuleRegistry_Opcode_7C_6035A	proc far		; CODE XREF: AudioQueue_OpcodeHelper_ABDAF+18P
					; AudioQueue_FinalizeAndRelease_ABDEC+1AP
		mov	ax, 7Ch	; '|'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_7C_6035A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x7D → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par sub_ABBEF
; et sub_ABDEC.
; ==============================================================================================
ModuleRegistry_Opcode_7D_60360	proc far		; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+1A4P
					; AudioQueue_FinalizeAndRelease_ABDEC:loc_ABE4DP
		mov	ax, 7Dh	; '}'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_7D_60360	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x7E → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée depuis seg125
; et sub_AB883.
; ==============================================================================================
ModuleRegistry_Opcode_7E_60366	proc far		; CODE XREF: seg125:02EFP
					; AudioQueue_OpcodeWrapper_AB883+13P ...
		mov	ax, 7Eh	; '~'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_7E_60366	endp

; ���������������������������������������������������������������������������
		mov	ax, 7Fh	; ''
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 80h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 81h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 82h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 83h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 84h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x96 → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_ReleaseSlot (sub_59F87, seg123).
; ==============================================================================================
ModuleRegistry_Opcode_96_60390	proc far		; CODE XREF: Sequencer_ReleaseSlot_59F87+1DP
		mov	ax, 96h	; '�'

loc_60393:
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_96_60390	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x97 → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_ProcessQueue (sub_59FF5, seg123).
; ==============================================================================================
ModuleRegistry_Opcode_97_60396	proc far		; CODE XREF: Sequencer_ProcessQueue_59FF5+A6P
		mov	ax, 97h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_97_60396	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x98 → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_AdvanceActiveSlot (sub_59F1D, seg123) — c'est l'appel « désactiver l'ancien
; emplacement ».
; ==============================================================================================
ModuleRegistry_Opcode_98_6039C	proc far		; CODE XREF: Sequencer_AdvanceActiveSlot_59F1D+5AP
		mov	ax, 98h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_98_6039C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x99 → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; TextRenderer_InputFieldHandler (sub_5A0F3, seg124).
; ==============================================================================================
ModuleRegistry_Opcode_99_603A2	proc far		; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+1D1P
		mov	ax, 99h	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_99_603A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x9A → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; TextRenderer_InputFieldHandler (sub_5A0F3, seg124).
; ==============================================================================================
ModuleRegistry_Opcode_9A_603A8	proc far		; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+23CP
		mov	ax, 9Ah	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_9A_603A8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x9B → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_ProcessQueue_59FF5 (seg123).
; ==============================================================================================
ModuleRegistry_Opcode_9B_603AE	proc far		; CODE XREF: Sequencer_ProcessQueue_59FF5+D3P
		mov	ax, 9Bh	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_9B_603AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x9C → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_ValidatePlacement (sub_5A62A, seg124).
; ==============================================================================================
ModuleRegistry_Opcode_9C_603B4	proc far		; CODE XREF: Sequencer_ValidatePlacement_5A62A+4AP
		mov	ax, 9Ch	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_9C_603B4	endp

; ���������������������������������������������������������������������������
		mov	ax, 9Dh	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 9Eh	; '�'

loc_603C3:
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0x9F → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_ValidatePlacement (sub_5A62A, seg124) — c'est cette même fonction qui vérifie « la
; coordonnée est-elle libre ».
; ==============================================================================================
ModuleRegistry_Opcode_9F_603C6	proc far		; CODE XREF: Sequencer_ValidatePlacement_5A62A+17P
		mov	ax, 9Fh	; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_9F_603C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0xAA → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée depuis seg121
; et Interrupt_TimerCase_595C2 (seg121).
; ==============================================================================================
ModuleRegistry_Opcode_AA_603CC	proc far		; CODE XREF: seg121:059FP
					; Interrupt_TimerCase_595C2+FFP ...
		mov	ax, 0AAh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_AA_603CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0xAB → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_AdvanceActiveSlot (sub_59F1D, seg123) — c'est l'appel « activer l'emplacement ».
; ==============================================================================================
ModuleRegistry_Opcode_AB_603D2	proc far		; CODE XREF: Sequencer_AdvanceActiveSlot_59F1D+42P
					; AudioQueue_ActivateSlotOpcode_AB16F+18P ...
		mov	ax, 0ABh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_AB_603D2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0xAD → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; sub_AB1AF.
; ==============================================================================================
ModuleRegistry_Opcode_AD_603D8	proc far		; CODE XREF: AudioQueue_DeactivateSlotOpcode_AB1AF+18P
					; AudioQueue_DeactivateSlotOpcode_AB1AF:loc_AB1E3P
		mov	ax, 0ADh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_AD_603D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0xAE → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Sequencer_AdvanceActiveSlot (sub_59F1D, seg123) — c'est l'appel « vérifier/sonder ».
; ==============================================================================================
ModuleRegistry_Opcode_AE_603DE	proc far		; CODE XREF: seg121:0605P seg121:0676P ...
		mov	ax, 0AEh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_AE_603DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0xAF → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; sub_AB1EF.
; ==============================================================================================
ModuleRegistry_Opcode_AF_603E4	proc far		; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+B3P
		mov	ax, 0AFh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_AF_603E4	endp

; ���������������������������������������������������������������������������
		mov	ax, 0B0h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode 0xB1 → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée par
; Weapon_HUDBox_TimerCaseD_59902 et TimerCaseE_599D3 (seg122).
; ==============================================================================================
ModuleRegistry_Opcode_B1_603F0	proc far		; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+9DP
					; Weapon_HUDBox_TimerCaseE_599D3+8BP ...
		mov	ax, 0B1h ; '�'

loc_603F3:
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_B1_603F0	endp

; ���������������������������������������������������������������������������

loc_603F6:
		mov	ax, 0B2h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������

loc_603FC:
		mov	ax, 0B3h ; '�'

loc_603FF:
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode → ModuleRegistry_DispatchTrampoline_5FBA6. Référencée depuis
; Interrupt_TimerDispatch_59436 (seg121).
; ==============================================================================================
ModuleRegistry_Opcode_UNKNOWN_60402	proc far		; CODE XREF: seg121:05DCP seg121:0652P
		mov	ax, 0B4h ; '�'

loc_60405:
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_UNKNOWN_60402	endp

; ���������������������������������������������������������������������������
		mov	ax, 0B5h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0B6h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0B7h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0B9h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, thunk d'opcode → ModuleRegistry_DispatchTrampoline_5FBA6 (adresse en fin de segment,
; valeur exacte non lue).
; ==============================================================================================
ModuleRegistry_Opcode_UNKNOWN_60420	proc far		; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+1F7P
		mov	ax, 0BAh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
ModuleRegistry_Opcode_UNKNOWN_60420	endp

; ���������������������������������������������������������������������������
		mov	ax, 0BBh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0BCh ; '�'

loc_6042F:
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������

loc_60432:
		mov	ax, 0BDh ; '�'

loc_60435:
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0BEh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0BFh ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0C0h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0C1h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
; ���������������������������������������������������������������������������

loc_60450:
		mov	ax, 0C2h ; '�'
		jmp	near ptr ModuleRegistry_DispatchTrampoline_5FBA6
seg161		ends
