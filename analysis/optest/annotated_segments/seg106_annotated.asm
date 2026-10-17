seg106		segment	byte public 'CODE' use16
		assume cs:seg106
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
word_3002A	dw 0			; DATA XREF: AIL_startup_306D7+5w
					; AIL_register_timer_3077E+50w ...
word_3002C	dw 0			; DATA XREF: seg106:0414r
					; seg106:loc_3043Fw ...
		db 40h dup(0)
word_3006E	dw 0			; DATA XREF: AIL_hook_timer_process_30540+21w
word_30070	dw 0			; DATA XREF: AIL_hook_timer_process_30540+26w
		db 42h dup(0)
word_300B4	dw 0			; DATA XREF: AIL_register_timer_3077E+62w
		db 88h dup(0)
word_3013E	dw 0			; DATA XREF: seg106:0464r AIL_init_DDA_arrays_30503+6w ...
word_30140	dw 0			; DATA XREF: seg106:0469r AIL_init_DDA_arrays_30503+Dw ...
dword_30142	dd 0			; DATA XREF: seg106:051Ar
					; AIL_hook_timer_process_30540+14w ...
word_30146	dw 0			; DATA XREF: seg106:043Dw
					; seg106:loc_30464r ...
word_30148	dw 0			; DATA XREF: AIL_program_timers_30648+6w
					; AIL_program_timers_30648+38r ...
word_3014A	dw 0			; DATA XREF: AIL_program_timers_30648+Dw
					; AIL_program_timers_30648+2Fr ...
word_3014C	dw 0			; DATA XREF: AIL_set_PIT_divisor_305B0+Fw seg106:09A7r
		db 84h dup(0)
word_301D2	dw 0			; DATA XREF: AIL_shutdown_30715+8w
					; AIL_shutdown_30715:loc_30724r	...
		align 8
word_301D8	dw 0			; DATA XREF: AIL_init_driver_30ACA:loc_30ADBw
					; AIL_init_driver_30ACA+56w ...
aTest		db 'Test',0             ; DATA XREF: seg106:04CCr seg106:04D5r
		db 203h	dup(0)
word_303E2	dw 0D3h			; DATA XREF: AIL_register_driver_309D0+73r

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_find_proc_5FB6E (sub_5FB6E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_LookupHandler_5FB6E'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). find_proc : cherche, dans la table
; de fonctions du pilote (paires numero/offset), le gestionnaire du numero demande.
; ==============================================================================================
AIL_find_proc_303E4	proc far		; CODE XREF: AIL_call_driver_3041C+7p
					; AIL_init_driver_30ACA+36p
		cmp	bx, 10h
		jnb	short loc_3040E
		shl	bx, 1
		shl	bx, 1
		les	bx, cs:[bx+12Eh]
		mov	cx, es
		or	cx, bx
		jz	short loc_3040E

loc_303F8:				; CODE XREF: AIL_find_proc_303E4+21j
		mov	cx, es:[bx]
		cmp	cx, ax
		jz	short loc_30415
		add	bx, 4
		cmp	cx, 0FFFFh
		jnz	short loc_303F8
		mov	ax, 0
		mov	dx, 0
		retf
; ���������������������������������������������������������������������������

loc_3040E:				; CODE XREF: AIL_find_proc_303E4+3j
					; AIL_find_proc_303E4+12j
		mov	ax, 0
		mov	dx, 0
		retf
; ���������������������������������������������������������������������������

loc_30415:				; CODE XREF: AIL_find_proc_303E4+19j
		mov	ax, es:[bx+2]
		mov	dx, es
		retf
AIL_find_proc_303E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à AIL_call_driver_5FBA6
; (sub_5FBA6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'ModuleRegistry_DispatchTrampoline_5FBA6'. far. Identifie 2026-10-06 par
; alignement avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme
; ordre de procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). call_driver :
; point commun de tous les thunks d'API (numero de fonction dans AX) ; appelle
; AIL_find_proc_5FB6E et saute dans le pilote charge (ADLIB.ADV etc.).
; ==============================================================================================
AIL_call_driver_3041C	proc far		; CODE XREF: AIL_register_driver_309D0+99p
					; AIL_describe_driver_30A9E+1Ep ...
		mov	bx, sp
		mov	bx, ss:[bx+4]
		push	cs
		call	near ptr AIL_find_proc_303E4
		cmp	ax, 0
		jnz	short loc_30430
		cmp	dx, 0
		jz	short locret_30433

loc_30430:				; CODE XREF: AIL_call_driver_3041C+Dj
		push	dx
		push	ax
		retf
; ���������������������������������������������������������������������������

locret_30433:				; CODE XREF: AIL_call_driver_3041C+12j
		retf
AIL_call_driver_3041C	endp

; ���������������������������������������������������������������������������
		cmp	cs:word_3002C, 0
		jz	short loc_3043F
		jmp	loc_304E6
; ���������������������������������������������������������������������������

loc_3043F:				; CODE XREF: seg106:041Aj
		mov	cs:word_3002C, 1
		cld
		push	ax
		mov	word ptr cs:byte_301DF+1FFh, ss
		mov	word ptr cs:byte_301DF+201h, sp
		mov	ax, cs
		mov	ss, ax
		assume ss:seg106
		mov	sp, 3BEh
		pushad
		push	es
		push	ds
		mov	cs:word_30146, 0

loc_30464:				; CODE XREF: seg106:04AEj
		mov	si, cs:word_30146
		shl	si, 1
		cmp	word ptr cs:[si+74h], 2
		jnz	short loc_304C3
		mov	ds, word ptr cs:[si+52h]
		shl	si, 1
		mov	ax, cs:[si+96h]
		mov	dx, cs:[si+98h]
		add	ax, cs:word_3013E
		adc	dx, cs:word_30140
		cmp	dx, cs:[si+0DCh]
		jb	short loc_3049E
		ja	short loc_304AA
		cmp	ax, cs:[si+0DAh]
		jnb	short loc_304AA

loc_3049E:				; CODE XREF: seg106:0473j
		mov	cs:[si+96h], ax
		mov	cs:[si+98h], dx
		jmp	short loc_304C3
; ���������������������������������������������������������������������������

loc_304AA:				; CODE XREF: seg106:0475j seg106:047Cj
		sub	ax, cs:[si+0DAh]
		sbb	dx, cs:[si+0DCh]
		mov	cs:[si+96h], ax
		mov	cs:[si+98h], dx
		call	dword ptr cs:[si+0Eh]

loc_304C3:				; CODE XREF: seg106:0451j seg106:0488j
		inc	cs:word_30146
		cmp	cs:word_30146, 10h
		jbe	short loc_30464
		pop	ds
		pop	es
		popad
		mov	ss, word ptr cs:byte_301DF+1FFh
		assume ss:nothing
		mov	sp, word ptr cs:byte_301DF+201h
		mov	cs:word_3002C, 0
		pop	ax

loc_304E6:				; CODE XREF: seg106:041Cj
		push	ax
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		pop	ax
		cmp	word ptr cs:aTest, 6554h ; "Test"
		jnz	short loc_304FF
		cmp	word ptr cs:aTest+2, 7473h
		jnz	short loc_304FF
		iret
; ���������������������������������������������������������������������������

loc_304FF:				; CODE XREF: seg106:04D3j seg106:04DCj ...
		sti
		int	3		; Trap to Debugger
		jmp	short loc_304FF

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_init_DDA_arrays_5FC8D (sub_5FC8D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_ResetTables_5FC8D'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). init_DDA_arrays : remise a zero des
; tables de periodes des 16 minuteries.
; ==============================================================================================
AIL_init_DDA_arrays_30503	proc far		; CODE XREF: AIL_register_timer_3077E+5Fp
		push	ds
		push	si
		push	di
		pushf
		cli
		cld
		mov	cs:word_3013E, 0FFFFh
		mov	cs:word_30140, 0FFFFh
		push	cs
		pop	es
		assume es:seg106
		mov	di, 74h	; 't'
		mov	cx, 11h
		mov	ax, 0
		rep stosw
		mov	di, 96h	; '�'
		mov	cx, 22h	; '"'
		rep stosw
		mov	di, 0DAh ; '�'
		mov	cx, 22h	; '"'
		rep stosw
		popf
		pop	di
		pop	si
		pop	ds
		retf
AIL_init_DDA_arrays_30503	endp

; ���������������������������������������������������������������������������
		pushf
		call	cs:dword_30142
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_hook_timer_process_5FCCA (sub_5FCCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_HookTimerIRQ_5FCCA'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). hook_timer_process : installe
; AIL_API_timer_ISR_5FBBE sur le vecteur INT 8.
; ==============================================================================================
AIL_hook_timer_process_30540	proc far		; CODE XREF: AIL_register_timer_3077E+6Ap
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	ax, 0
		mov	es, ax
		assume es:seg000
		mov	bx, word ptr es:loc_1D+3
		mov	es, word ptr es:loc_21+1
		assume es:nothing
		mov	word ptr cs:dword_30142, bx
		mov	word ptr cs:dword_30142+2, es
		mov	bx, 519h
		mov	cs:word_3006E, bx
		mov	cs:word_30070, cs
		mov	ax, cs
		mov	ds, ax
		assume ds:seg106
		mov	dx, 414h
		mov	ax, 0
		mov	es, ax
		assume es:seg000
		mov	word ptr es:loc_1D+3, dx
		mov	word ptr es:loc_21+1, ds
		popf
		pop	di
		pop	si
		pop	ds
		assume ds:dseg
		retf
AIL_hook_timer_process_30540	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AIL_unhook_timer_process_5FD10 (sub_5FD10 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'ModuleRegistry_UnhookTimerIRQ_5FD10'. far.
; Identifie 2026-10-06 par alignement avec le source public AIL 2.0 (Miles Design,
; analysis/ail_sources/AIL.ASM, meme ordre de procedures que seg161 ; numeros de fonctions
; pilote dans AIL.INC). unhook_timer_process : restaure le vecteur INT 8 d'origine.
; ==============================================================================================
AIL_unhook_timer_process_30586	proc far		; CODE XREF: AIL_release_timer_handle_30833+3Ap
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_30146, 0FFFFh
		mov	dx, word ptr cs:dword_30142
		mov	ds, word ptr cs:dword_30142+2
		mov	ax, 0
		mov	es, ax
		mov	word ptr es:loc_1D+3, dx
		mov	word ptr es:loc_21+1, ds
		popf
		pop	di
		pop	si
		pop	ds
		retf
AIL_unhook_timer_process_30586	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AIL_set_PIT_divisor_5FD3A (sub_5FD3A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — Ex-'ModuleRegistry_ProgramPITFrequency_5FD3A'. far.
; Identifie 2026-10-06 par alignement avec le source public AIL 2.0 (Miles Design,
; analysis/ail_sources/AIL.ASM, meme ordre de procedures que seg161 ; numeros de fonctions
; pilote dans AIL.INC). set_PIT_divisor : programme le diviseur du PIT 8253 (out 43h, 36h).
; ==============================================================================================
AIL_set_PIT_divisor_305B0	proc far		; CODE XREF: AIL_set_PIT_period_305D3+1Fp
					; AIL_release_timer_handle_30833+33p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	al, 36h	; '6'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, [bp+arg_0]
		mov	cs:word_3014C, ax
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
AIL_set_PIT_divisor_305B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AIL_set_PIT_period_5FD5D (sub_5FD5D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — Ex-'ModuleRegistry_SetTickRateHz_5FD5D'. far. Identifie
; 2026-10-06 par alignement avec le source public AIL 2.0 (Miles Design,
; analysis/ail_sources/AIL.ASM, meme ordre de procedures que seg161 ; numeros de fonctions
; pilote dans AIL.INC). set_PIT_period : convertit une periode en microsecondes en diviseur
; PIT (54925 us max).
; ==============================================================================================
AIL_set_PIT_period_305D3	proc far		; CODE XREF: AIL_program_timers_30648+77p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		mov	ax, 0
		cmp	[bp+arg_0], 0D68Dh
		jnb	short loc_305F0
		mov	ax, [bp+arg_0]
		mov	bx, 20BCh
		mov	cx, 2710h
		mul	cx
		div	bx

loc_305F0:				; CODE XREF: AIL_set_PIT_period_305D3+Ej
		push	ax
		push	cs
		call	near ptr AIL_set_PIT_divisor_305B0
		add	sp, 2
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_set_PIT_period_305D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à AIL_ul_divide_5FD87
; (sub_5FD87 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'ModuleRegistry_ConfigureModuleTiming_5FD87'. far. Identifie 2026-10-06 par
; alignement avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme
; ordre de procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). ul_divide :
; division non signee 32 bits / 32 bits.
; ==============================================================================================
AIL_ul_divide_305FD	proc far		; CODE XREF: AIL_set_timer_frequency_30951+23p

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
		mov	dx, [bp+arg_2]
		mov	bx, [bp+arg_4]
		mov	cx, [bp+arg_6]
		or	cx, cx
		jnz	short loc_3061B
		or	dx, dx
		jz	short loc_3063F
		or	bx, bx
		jz	short loc_3063F

loc_3061B:				; CODE XREF: AIL_ul_divide_305FD+14j
		mov	bp, cx
		mov	cx, 20h	; ' '
		xor	di, di
		xor	si, si

loc_30624:				; CODE XREF: AIL_ul_divide_305FD:loc_3063Bj
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_3063B
		ja	short loc_30636
		cmp	si, bx
		jb	short loc_3063B

loc_30636:				; CODE XREF: AIL_ul_divide_305FD+33j
		sub	si, bx
		sbb	di, bp
		inc	ax

loc_3063B:				; CODE XREF: AIL_ul_divide_305FD+31j
					; AIL_ul_divide_305FD+37j
		loop	loc_30624
		jmp	short loc_30643
; ���������������������������������������������������������������������������

loc_3063F:				; CODE XREF: AIL_ul_divide_305FD+18j
					; AIL_ul_divide_305FD+1Cj
		div	bx
		xor	dx, dx

loc_30643:				; CODE XREF: AIL_ul_divide_305FD+40j
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_ul_divide_305FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_program_timers_5FDD2 (sub_5FDD2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_RecomputeGlobalTickRate_5FDD2'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). program_timers : choisit
; la periode commune la plus courte des minuteries actives et reprogramme le PIT.
; ==============================================================================================
AIL_program_timers_30648	proc far		; CODE XREF: AIL_set_timer_period_30902+3Bp
		push	ds
		push	si
		push	di
		pushf
		cli
		cld
		mov	cs:word_30148, 0FFFFh
		mov	cs:word_3014A, 0FFFFh
		mov	si, 0

loc_3065F:				; CODE XREF: AIL_program_timers_30648+4Cj
		mov	bx, si
		shl	bx, 1
		cmp	word ptr cs:[bx+74h], 0
		jz	short loc_30690
		shl	bx, 1
		mov	ax, cs:[bx+0DAh]
		mov	dx, cs:[bx+0DCh]
		cmp	dx, cs:word_3014A
		jb	short loc_30687
		ja	short loc_30690
		cmp	ax, cs:word_30148
		jnb	short loc_30690

loc_30687:				; CODE XREF: AIL_program_timers_30648+34j
		mov	cs:word_30148, ax
		mov	cs:word_3014A, dx

loc_30690:				; CODE XREF: AIL_program_timers_30648+21j
					; AIL_program_timers_30648+36j ...
		inc	si
		cmp	si, 10h
		jbe	short loc_3065F
		mov	ax, cs:word_30148
		mov	dx, cs:word_3014A
		cmp	ax, cs:word_3013E
		jnz	short loc_306AD
		cmp	dx, cs:word_30140
		jz	short loc_306D2

loc_306AD:				; CODE XREF: AIL_program_timers_30648+5Cj
		mov	cs:word_30146, 0FFFFh
		mov	cs:word_3013E, ax
		mov	cs:word_30140, dx
		push	ax
		push	cs
		call	near ptr AIL_set_PIT_period_305D3
		add	sp, 2
		push	cs
		pop	es
		assume es:seg106
		mov	di, 96h	; '�'
		mov	cx, 22h	; '"'
		mov	ax, 0
		rep stosw

loc_306D2:				; CODE XREF: AIL_program_timers_30648+63j
		popf
		pop	di
		pop	si
		pop	ds
		retf
AIL_program_timers_30648	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_startup_5FE61 (sub_5FE61 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_Helper_5FE61'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_startup : initialisation de l'API
; (aucune minuterie active).
; ==============================================================================================
AIL_startup_306D7	proc far		; CODE XREF: Stopwatch_RegisterTickModule_3EE35+10P
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_3002A, 0
		mov	cs:word_3002C, 0
		cld
		mov	ax, cs
		mov	es, ax
		mov	di, 12Eh
		mov	cx, 20h	; ' '
		mov	ax, 0
		rep stosw
		mov	di, 16Eh
		mov	cx, 10h
		mov	ax, 0FFFFh
		rep stosw
		mov	di, 18Eh
		mov	cx, 10h
		mov	ax, 0
		rep stosw
		popf
		pop	di
		pop	si
		pop	ds
		retf
AIL_startup_306D7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_shutdown_5FE9F (sub_5FE9F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_CleanupModuleSlot_5FE9F'. far. Identifie 2026-10-06 par alignement avec
; le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_shutdown(SignOff) :
; arrete tous les pilotes et minuteries.
; ==============================================================================================
AIL_shutdown_30715	proc far		; CODE XREF: Stopwatch_StartOrStop_3EF15+20P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_301D2, 0

loc_30724:				; CODE XREF: AIL_shutdown_30715+5Dj
		mov	si, cs:word_301D2
		shl	si, 1
		mov	dx, cs:[si+16Eh]
		shl	si, 1
		mov	ax, cs:[si+12Eh]
		or	ax, cs:[si+130h]
		jz	short loc_30767
		cmp	dx, 0FFFFh
		jz	short loc_3074B
		push	dx
		push	cs
		call	near ptr AIL_release_timer_handle_30833
		add	sp, 2

loc_3074B:				; CODE XREF: AIL_shutdown_30715+2Cj
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs:word_301D2
		push	cs
		call	near ptr AIL_shutdown_driver_30B79
		add	sp, 8

loc_30767:				; CODE XREF: AIL_shutdown_30715+27j
		inc	cs:word_301D2
		cmp	cs:word_301D2, 10h
		jnz	short loc_30724
		push	cs
		call	near ptr AIL_release_all_timers_30876
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_shutdown_30715	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_register_timer_5FF08 (sub_5FF08 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_RegisterModule_5FF08'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_register_timer(callback) :
; reserve une des 16 minuteries pour une fonction appelee par l'interruption timer. Utilisee
; aussi par le jeu (Stopwatch_*, AudioQueue_RegisterTickModule_AA810).
; ==============================================================================================
AIL_register_timer_3077E	proc far		; CODE XREF: AIL_init_driver_30ACA+46p
					; Stopwatch_RegisterTickModule_3EE35+1BP ...

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

loc_3078B:				; CODE XREF: AIL_register_timer_3077E+1Bj
		cmp	word ptr cs:[bx+74h], 0
		jz	short loc_307A1
		add	bx, 2
		cmp	bx, 20h	; ' '
		jb	short loc_3078B
		mov	ax, 0FFFFh
		jmp	loc_3082D
; ���������������������������������������������������������������������������

loc_307A1:				; CODE XREF: AIL_register_timer_3077E+13j
		mov	ax, bx
		shr	ax, 1
		mov	word ptr cs:[bx+74h], 1
		mov	cs:[bx+52h], cx
		shl	bx, 1
		lds	si, [bp+arg_0]
		mov	cs:[bx+0Eh], si
		mov	word ptr cs:[bx+10h], ds
		mov	word ptr cs:[bx+0DAh], 0FFFFh
		mov	word ptr cs:[bx+0DCh], 0FFFFh
		inc	cs:word_3002A
		cmp	cs:word_3002A, 1
		jnz	short loc_3082D
		push	ax
		push	cs
		call	near ptr AIL_init_DDA_arrays_30503
		mov	cs:word_300B4, 1
		push	cs
		call	near ptr AIL_hook_timer_process_30540
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
		call	near ptr AIL_set_timer_period_30902
		add	sp, 6
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 10h
		pop	bp
		push	cs
		call	near ptr sub_3088E
		add	sp, 2
		pop	ax
		mov	bx, ax
		shl	bx, 1
		mov	word ptr cs:[bx+74h], 1

loc_3082D:				; CODE XREF: AIL_register_timer_3077E+20j
					; AIL_register_timer_3077E+5Bj
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_register_timer_3077E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_release_timer_handle_5FFBD (sub_5FFBD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_UnregisterModule_5FFBD'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_release_timer_handle(timer).
; ==============================================================================================
AIL_release_timer_handle_30833	proc far		; CODE XREF: AIL_shutdown_30715+30p
					; AIL_release_all_timers_30876+Ap	...

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
		jz	short loc_30870
		shl	bx, 1
		cmp	word ptr cs:[bx+74h], 0
		jz	short loc_30870
		mov	word ptr cs:[bx+74h], 0
		dec	cs:word_3002A
		jnz	short loc_30870
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	cs
		call	near ptr AIL_set_PIT_divisor_305B0
		add	sp, 2
		push	cs
		call	near ptr AIL_unhook_timer_process_30586

loc_30870:				; CODE XREF: AIL_release_timer_handle_30833+Ej
					; AIL_release_timer_handle_30833+18j ...
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_release_timer_handle_30833	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AIL_release_all_timers_60000 (sub_60000 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'ModuleRegistry_UnregisterAll_60000'. far.
; Identifie 2026-10-06 par alignement avec le source public AIL 2.0 (Miles Design,
; analysis/ail_sources/AIL.ASM, meme ordre de procedures que seg161 ; numeros de fonctions
; pilote dans AIL.INC). AIL_release_all_timers : libere les 16 minuteries.
; ==============================================================================================
AIL_release_all_timers_30876	proc far		; CODE XREF: AIL_shutdown_30715+60p
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	si, 0Fh

loc_3087E:				; CODE XREF: AIL_release_all_timers_30876+11j
		push	si
		push	cs
		call	near ptr AIL_release_timer_handle_30833
		add	sp, 2
		dec	si
		jge	short loc_3087E
		popf
		pop	di
		pop	si
		pop	ds
		retf
AIL_release_all_timers_30876	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3088E	proc far		; CODE XREF: AIL_register_timer_3077E+9Dp
					; seg106:089Ap	...

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
		cmp	word ptr cs:[bx+74h], 1
		jnz	short loc_308AA
		mov	word ptr cs:[bx+74h], 2

loc_308AA:				; CODE XREF: sub_3088E+13j
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
sub_3088E	endp

; ���������������������������������������������������������������������������
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	si, 0Fh

loc_308B8:				; CODE XREF: seg106:08A1j
		push	si
		push	cs
		call	near ptr sub_3088E
		add	sp, 2
		dec	si
		jge	short loc_308B8
		popf
		pop	di
		pop	si
		pop	ds
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_308C8	proc far		; CODE XREF: seg106:08D4p seg161:00DBP

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
		cmp	word ptr cs:[bx+74h], 2
		jnz	short loc_308E4
		mov	word ptr cs:[bx+74h], 1

loc_308E4:				; CODE XREF: sub_308C8+13j
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
sub_308C8	endp

; ���������������������������������������������������������������������������
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	si, 0Fh

loc_308F2:				; CODE XREF: seg106:08DBj
		push	si
		push	cs
		call	near ptr sub_308C8
		add	sp, 2
		dec	si
		jge	short loc_308F2
		popf
		pop	di
		pop	si
		pop	ds
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_set_timer_period_6008C (sub_6008C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_ConfigureAndActivate_6008C'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC).
; AIL_set_timer_period(timer, microsecondes).
; ==============================================================================================
AIL_set_timer_period_30902	proc far		; CODE XREF: AIL_register_timer_3077E+8Cp
					; AIL_set_timer_frequency_30951+2Fp ...

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
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, cs:[bx+74h]
		push	ax
		mov	word ptr cs:[bx+74h], 1
		shl	bx, 1
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cs:[bx+0DAh], ax
		mov	cs:[bx+0DCh], dx
		mov	word ptr cs:[bx+96h], 0
		mov	word ptr cs:[bx+98h], 0
		push	cs
		call	near ptr AIL_program_timers_30648
		pop	ax
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	cs:[bx+74h], ax
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_set_timer_period_30902	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AIL_set_timer_frequency_600DB (sub_600DB de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'ModuleRegistry_ConfigureAndActivate_600DB'.
; far. Identifie 2026-10-06 par alignement avec le source public AIL 2.0 (Miles Design,
; analysis/ail_sources/AIL.ASM, meme ordre de procedures que seg161 ; numeros de fonctions
; pilote dans AIL.INC). AIL_set_timer_frequency(timer, Hz) : periode = 1 000 000 / Hz
; (AIL_ul_divide_5FD87(0xF4240, Hz)) puis AIL_set_timer_period_6008C.
; ==============================================================================================
AIL_set_timer_frequency_30951	proc far		; CODE XREF: AIL_init_driver_30ACA+67p
					; Stopwatch_RegisterTickModule_3EE35+2FP ...

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
		call	near ptr AIL_ul_divide_305FD
		add	sp, 8
		push	dx
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr AIL_set_timer_period_30902
		add	sp, 6
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_set_timer_frequency_30951	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		cmp	word ptr [bp+8], 0
		jnz	short loc_309A2
		mov	ax, 0D68Dh
		mov	dx, 0
		jmp	short loc_309B0
; ���������������������������������������������������������������������������

loc_309A2:				; CODE XREF: seg106:0978j
		mov	ax, 2710h
		mov	bx, 2E9Ch
		mul	word ptr [bp+8]
		div	bx
		mov	dx, 0

loc_309B0:				; CODE XREF: seg106:0980j
		push	dx
		push	ax
		push	word ptr [bp+6]
		push	cs
		call	near ptr AIL_set_timer_period_30902
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
		mov	ax, cs:word_3014C
		popf
		pop	di
		pop	si
		pop	ds
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_register_driver_6015A (sub_6015A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_QueryOrDispatch_6015A'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_register_driver(pilote) :
; enregistre l'image d'un pilote .ADV charge en memoire dans une des 16 entrees (table
; cs:+0x128) ; renvoie le handle ou -1.
; ==============================================================================================
AIL_register_driver_309D0	proc far		; CODE XREF: sub_702F+124P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_301D2, 0

loc_309DF:				; CODE XREF: AIL_register_driver_309D0+2Fj
		mov	si, cs:word_301D2
		shl	si, 1
		shl	si, 1
		mov	ax, cs:[si+12Eh]
		or	ax, cs:[si+130h]
		jz	short loc_30A06
		inc	cs:word_301D2
		cmp	cs:word_301D2, 10h
		jnz	short loc_309DF
		mov	ax, 0FFFFh
		jmp	short loc_30A70
; ���������������������������������������������������������������������������

loc_30A06:				; CODE XREF: AIL_register_driver_309D0+22j
		les	di, [bp+arg_0]
		assume es:nothing
		mov	ax, 0FFFFh
		cmp	word ptr es:[di+2], 6F43h
		jnz	short loc_30A70
		cmp	word ptr es:[di+4], 7970h
		jnz	short loc_30A70
		add	di, es:[di]
		mov	cs:[si+12Eh], di
		mov	word ptr cs:[si+130h], es
		push	cs:word_301D2
		push	cs
		call	near ptr AIL_describe_driver_30A9E
		add	sp, 2
		mov	es, dx
		mov	di, ax
		or	dx, ax
		mov	ax, 0FFFFh
		jz	short loc_30A70
		mov	dx, es:[di]
		cmp	dx, cs:word_303E2
		ja	short loc_30A70
		mov	ax, cs:word_301D2
		mov	bx, ax
		push	ax
		push	ds
		mov	ax, seg	seg066
		push	ax
		mov	ax, 3EAh
		push	ax
		mov	ax, word_46AB2
		push	ax
		mov	eax, dword_46AAE
		push	eax
		push	bx
		mov	ax, 0A0h ; '�'
		push	cs
		call	near ptr AIL_call_driver_3041C
		add	sp, 0Eh
		pop	ax

loc_30A70:				; CODE XREF: AIL_register_driver_309D0+34j
					; AIL_register_driver_309D0+42j ...
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_register_driver_309D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_release_driver_handle_60200 (sub_60200 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_ReleaseSlotIfSet_60200'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_release_driver_handle(H).
; ==============================================================================================
AIL_release_driver_handle_30A76	proc far		; CODE XREF: sub_77FF+26P

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
		jnb	short loc_30A98
		shl	bx, 1
		shl	bx, 1
		mov	word ptr cs:[bx+12Eh], 0
		mov	word ptr cs:[bx+130h], 0

loc_30A98:				; CODE XREF: AIL_release_driver_handle_30A76+Ej
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_release_driver_handle_30A76	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_describe_driver_60228 (sub_60228 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_QueryModuleField_60228'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_describe_driver(H) : fonction
; pilote 100 (0x64, AIL_DESC_DRVR), renvoie le descripteur du pilote (type, ports par
; defaut...).
; ==============================================================================================
AIL_describe_driver_30A9E	proc far		; CODE XREF: sub_702F+138P
					; AIL_register_driver_309D0+5Fp ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], seg seg106
		pop	bp
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 9A2h
		pop	bp
		push	[bp+arg_0]
		mov	ax, 64h	; 'd'
		push	cs
		call	near ptr AIL_call_driver_3041C
		add	sp, 6
		pop	bp
		retf
AIL_describe_driver_30A9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30AC4	proc far		; CODE XREF: sub_702F+195P
		mov	ax, 65h	; 'e'
		jmp	near ptr AIL_call_driver_3041C
sub_30AC4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_init_driver_60254 (sub_60254 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_ConfigureModuleExtended_60254'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_init_driver(H, IO,
; IRQ, DMA, DRQ) : fonction pilote 102 (AIL_INIT_DRVR), puis enregistre une minuterie pour le
; service periodique du pilote (103, AIL_SERVE_DRVR) a la frequence qu'il demande.
; ==============================================================================================
AIL_init_driver_30ACA	proc far		; CODE XREF: sub_702F+1D7P

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
		jb	short loc_30ADB
		jmp	loc_30B73
; ���������������������������������������������������������������������������

loc_30ADB:				; CODE XREF: AIL_init_driver_30ACA+Cj
		mov	cs:word_301D8, 0FFFFh
		push	[bp+arg_0]
		push	cs
		call	near ptr AIL_describe_driver_30A9E
		add	sp, 2
		mov	es, dx
		mov	di, ax
		mov	si, es:[di+14h]
		cmp	si, 0FFFFh
		jz	short loc_30B37
		mov	ax, 67h	; 'g'
		mov	bx, [bp+arg_0]
		push	cs
		call	near ptr AIL_find_proc_303E4
		mov	bx, ax
		or	bx, dx
		jz	short loc_30B37
		mov	es, dx
		mov	bx, ax
		push	es
		push	bx
		push	cs
		call	near ptr AIL_register_timer_3077E
		add	sp, 4
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	cs:[bx+16Eh], ax
		mov	cs:word_301D8, ax
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	si
		push	ax
		push	cs
		call	near ptr AIL_set_timer_frequency_30951
		add	sp, 6

loc_30B37:				; CODE XREF: AIL_init_driver_30ACA+2Dj
					; AIL_init_driver_30ACA+3Dj
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 66h	; 'f'
		push	cs
		call	near ptr AIL_call_driver_3041C
		add	sp, 0Ch
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	word ptr cs:[bx+18Eh], 1
		cmp	cs:word_301D8, 0FFFFh
		jz	short loc_30B73
		push	cs:word_301D8
		push	cs
		call	near ptr sub_3088E
		add	sp, 2

loc_30B73:				; CODE XREF: AIL_init_driver_30ACA+Ej
					; AIL_init_driver_30ACA+9Bj
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_init_driver_30ACA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIL_shutdown_driver_60303 (sub_60303 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'ModuleRegistry_CleanupModuleReference_60303'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_shutdown_driver(H,
; SignOff) : fonction pilote 104 (0x68), libere sa minuterie.
; ==============================================================================================
AIL_shutdown_driver_30B79	proc far		; CODE XREF: sub_77FF+1BP
					; AIL_shutdown_30715+4Cp
		mov	bx, sp
		mov	bx, ss:[bx+4]
		cmp	bx, 10h
		jnb	short locret_30BAB
		shl	bx, 1
		mov	dx, 0
		xchg	dx, cs:[bx+18Eh]
		cmp	dx, 0
		jz	short locret_30BAB
		mov	dx, cs:[bx+16Eh]
		cmp	dx, 0FFFFh
		jz	short loc_30BA5
		push	dx
		push	cs
		call	near ptr AIL_release_timer_handle_30833
		add	sp, 2

loc_30BA5:				; CODE XREF: AIL_shutdown_driver_30B79+22j
		mov	ax, 68h	; 'h'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������

locret_30BAB:				; CODE XREF: AIL_shutdown_driver_30B79+9j
					; AIL_shutdown_driver_30B79+18j
		retf
AIL_shutdown_driver_30B79	endp

; ���������������������������������������������������������������������������
		mov	ax, 78h	; 'x'
		jmp	near ptr AIL_call_driver_3041C

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30BB2	proc far		; CODE XREF: seg011:01F1P
		mov	ax, 79h	; 'y'
		jmp	near ptr AIL_call_driver_3041C
sub_30BB2	endp

; ���������������������������������������������������������������������������
		mov	ax, 86h	; '�'
		jmp	near ptr AIL_call_driver_3041C

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30BBE	proc far		; CODE XREF: seg011:021FP seg011:0255P ...
		mov	ax, 7Ah	; 'z'
		jmp	near ptr AIL_call_driver_3041C
sub_30BBE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30BC4	proc far		; CODE XREF: sub_83FE+41P
					; sub_29C6B+1B9P ...
		mov	ax, 7Bh	; '{'
		jmp	near ptr AIL_call_driver_3041C
sub_30BC4	endp

; ���������������������������������������������������������������������������
		mov	ax, 85h	; '�'
		jmp	near ptr AIL_call_driver_3041C

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30BD0	proc far		; CODE XREF: sub_84CC+13P sub_8500+13P ...
		mov	ax, 7Ch	; '|'
		jmp	near ptr AIL_call_driver_3041C
sub_30BD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30BD6	proc far		; CODE XREF: seg011:01FFP sub_83FE+4FP ...
		mov	ax, 7Dh	; '}'
		jmp	near ptr AIL_call_driver_3041C
sub_30BD6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30BDC	proc far		; CODE XREF: VoicePlayer_Stop_7B5A+26P seg062:033FP ...
		mov	ax, 7Eh	; '~'
		jmp	near ptr AIL_call_driver_3041C
sub_30BDC	endp

; ���������������������������������������������������������������������������
		mov	ax, 7Fh	; ''
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 80h	; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 81h	; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 82h	; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 83h	; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 84h	; '�'
		jmp	near ptr AIL_call_driver_3041C

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C06	proc far		; CODE XREF: MusicChannel_Init_78A4+1EP
		mov	ax, 96h	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C06	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C0C	proc far		; CODE XREF: MusicChannel_RegisterSequence_7918+9FP MusicChannel_RegisterSequence_7918+C9P
		mov	ax, 97h	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C0C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C12	proc far		; CODE XREF: Music_ChannelStopSequence_783A+5AP
		mov	ax, 98h	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C12	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C18	proc far		; CODE XREF: sub_702F+1F4P
		mov	ax, 99h	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C18	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C1E	proc far		; CODE XREF: sub_702F+26EP
		mov	ax, 9Ah	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C24	proc far		; CODE XREF: MusicChannel_RegisterSequence_7918+ECP
		mov	ax, 9Bh	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C2A	proc far		; CODE XREF: sub_75AF+4EP
		mov	ax, 9Ch	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C2A	endp

; ���������������������������������������������������������������������������
		mov	ax, 9Dh	; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 9Eh	; '�'
		jmp	near ptr AIL_call_driver_3041C

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C3C	proc far		; CODE XREF: sub_75AF+17P
		mov	ax, 9Fh	; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C3C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, LUE 2026-10-17. Appel du pilote AIL n° 170 (sub_3041C) : même numéro que
; AIL_start_sequence_603CC de STRIKE.EXE. Démarre une séquence XMIDI (pilote, séquence).
; ==============================================================================================
AIL_start_sequence_30C42	proc far		; CODE XREF: sub_702F+3EFP
					; sub_8609+DCP	...
		mov	ax, 0AAh ; '�'
		jmp	near ptr AIL_call_driver_3041C
AIL_start_sequence_30C42	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, LUE 2026-10-17. Appel du pilote AIL n° 171 (sub_3041C) : même numéro que
; AIL_stop_sequence_603D2 de STRIKE.EXE. Arrête une séquence XMIDI. Utilisé par
; Music_ChannelStopSequence_783A et par la finale de mid1 sur le canal de musique.
; ==============================================================================================
AIL_stop_sequence_30C48	proc far		; CODE XREF: Music_ChannelStopSequence_783A+42P
					; sub_5F8FE+19P ...
		mov	ax, 0ABh ; '�'
		jmp	near ptr AIL_call_driver_3041C
AIL_stop_sequence_30C48	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C4E	proc far		; CODE XREF: sub_5F940+19P
					; sub_5F940+35P
		mov	ax, 0ADh ; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C4E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C54	proc far		; CODE XREF: sub_702F+40DP
					; Music_ChannelStopSequence_783A+19P	...
		mov	ax, 0AEh ; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C54	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C5A	proc far		; CODE XREF: sub_9128+98P
					; sub_5F982+B7P
		mov	ax, 0AFh ; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C5A	endp

; ���������������������������������������������������������������������������
		mov	ax, 0B0h ; '�'
		jmp	near ptr AIL_call_driver_3041C

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C66	proc far		; CODE XREF: sub_8609+C5P sub_8705+9AP ...
		mov	ax, 0B1h ; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C66	endp

; ���������������������������������������������������������������������������
		mov	ax, 0B2h ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0B3h ; '�'
		jmp	near ptr AIL_call_driver_3041C

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_30C78	proc far		; CODE XREF: seg013:00AEP seg013:011FP
		mov	ax, 0B4h ; '�'
		jmp	near ptr AIL_call_driver_3041C
sub_30C78	endp

; ���������������������������������������������������������������������������
		mov	ax, 0B5h ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0B6h ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0B7h ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0B9h ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0BAh ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0BBh ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0BCh ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0BDh ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0BEh ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0BFh ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0C0h ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0C1h ; '�'
		jmp	near ptr AIL_call_driver_3041C
; ���������������������������������������������������������������������������
		mov	ax, 0C2h ; '�'
		jmp	near ptr AIL_call_driver_3041C
seg106		ends
