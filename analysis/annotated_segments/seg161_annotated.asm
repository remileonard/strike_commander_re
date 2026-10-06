seg161		segment	byte public 'CODE' use16
		assume cs:seg161
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
word_5F7B4	dw 0			; DATA XREF: AIL_startup_5FE61+5w
					; AIL_register_timer_5FF08+50w ...
word_5F7B6	dw 0			; DATA XREF: seg161:loc_5FBBEr
					; seg161:loc_5FBC9w ...
byte_5F7B8	db 40h dup(0)
word_5F7F8	dw 0			; DATA XREF: AIL_hook_timer_process_5FCCA+21w
word_5F7FA	dw 0			; DATA XREF: AIL_hook_timer_process_5FCCA+26w
		db 42h dup(0)
word_5F83E	dw 0			; DATA XREF: AIL_register_timer_5FF08+62w
byte_5F840	db 88h dup(0)
word_5F8C8	dw 0			; DATA XREF: seg161:045Er
					; AIL_init_DDA_arrays_5FC8D:loc_5FC93w	...
word_5F8CA	dw 0			; DATA XREF: seg161:0463r
					; AIL_init_DDA_arrays_5FC8D:loc_5FC9Aw	...
dword_5F8CC	dd 0			; DATA XREF: seg161:0514r
					; AIL_hook_timer_process_5FCCA+14w ...
word_5F8D0	dw 0			; DATA XREF: seg161:0437w
					; seg161:loc_5FBEEr ...
word_5F8D2	dw 0			; DATA XREF: AIL_program_timers_5FDD2+6w
					; AIL_program_timers_5FDD2+38r ...
word_5F8D4	dw 0			; DATA XREF: AIL_program_timers_5FDD2+Dw
					; AIL_program_timers_5FDD2+2Fr ...
word_5F8D6	dw 0			; DATA XREF: AIL_set_PIT_divisor_5FD3A+Fw seg161:09A1r
byte_5F8D8	db 84h dup(0)
word_5F95C	dw 0			; DATA XREF: AIL_shutdown_5FE9F+8w
					; AIL_shutdown_5FE9F:loc_5FEAEr	...
		db 4 dup(0)
word_5F962	dw 0			; DATA XREF: AIL_init_driver_60254:loc_60265w
					; AIL_init_driver_60254+56w ...
aTest		db 'Test',0             ; DATA XREF: seg161:04C6r seg161:04CFr
byte_5F969	db 203h	dup(0)
word_5FB6C	dw 0D3h			; DATA XREF: AIL_register_driver_6015A:loc_601CDr

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_LookupHandler_5FB6E'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). find_proc : cherche, dans la table
; de fonctions du pilote (paires numero/offset), le gestionnaire du numero demande.
; ==============================================================================================
AIL_find_proc_5FB6E	proc far		; CODE XREF: AIL_call_driver_5FBA6+7p
					; AIL_init_driver_60254+36p
		cmp	bx, 10h
		jnb	short loc_5FB98
		shl	bx, 1
		shl	bx, 1
		les	bx, cs:[bx+128h]
		mov	cx, es
		or	cx, bx
		jz	short loc_5FB98

loc_5FB82:				; CODE XREF: AIL_find_proc_5FB6E+21j
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

loc_5FB98:				; CODE XREF: AIL_find_proc_5FB6E+3j
					; AIL_find_proc_5FB6E+12j
		mov	ax, 0
		mov	dx, 0
		retf
; ���������������������������������������������������������������������������

loc_5FB9F:				; CODE XREF: AIL_find_proc_5FB6E+19j
		mov	ax, es:[bx+2]

loc_5FBA3:
		mov	dx, es
		retf
AIL_find_proc_5FB6E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_DispatchTrampoline_5FBA6'. far. Identifie 2026-10-06 par alignement avec
; le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). call_driver : point
; commun de tous les thunks d'API (numero de fonction dans AX) ; appelle AIL_find_proc_5FB6E
; et saute dans le pilote charge (ADLIB.ADV etc.).
; ==============================================================================================
AIL_call_driver_5FBA6	proc far		; CODE XREF: AIL_register_driver_6015A+99p
					; AIL_describe_driver_60228+1Ep ...
		mov	bx, sp

loc_5FBA8:
		mov	bx, ss:[bx+4]
		push	cs
		call	near ptr AIL_find_proc_5FB6E
		cmp	ax, 0
		jnz	short loc_5FBBA
		cmp	dx, 0
		jz	short locret_5FBBD

loc_5FBBA:				; CODE XREF: AIL_call_driver_5FBA6+Dj
		push	dx
		push	ax
		retf
; ���������������������������������������������������������������������������

locret_5FBBD:				; CODE XREF: AIL_call_driver_5FBA6+12j
		retf
AIL_call_driver_5FBA6	endp

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
; Ex-'ModuleRegistry_ResetTables_5FC8D'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). init_DDA_arrays : remise a zero des
; tables de periodes des 16 minuteries.
; ==============================================================================================
AIL_init_DDA_arrays_5FC8D	proc far		; CODE XREF: AIL_register_timer_5FF08+5Fp
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
AIL_init_DDA_arrays_5FC8D	endp

; ���������������������������������������������������������������������������
		pushf
		call	cs:dword_5F8CC
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_HookTimerIRQ_5FCCA'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). hook_timer_process : installe
; AIL_API_timer_ISR_5FBBE sur le vecteur INT 8.
; ==============================================================================================
AIL_hook_timer_process_5FCCA	proc far		; CODE XREF: AIL_register_timer_5FF08+6Ap
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
AIL_hook_timer_process_5FCCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_UnhookTimerIRQ_5FD10'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). unhook_timer_process : restaure le
; vecteur INT 8 d'origine.
; ==============================================================================================
AIL_unhook_timer_process_5FD10	proc far		; CODE XREF: AIL_release_timer_handle_5FFBD+3Ap
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
AIL_unhook_timer_process_5FD10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_ProgramPITFrequency_5FD3A'. far. Identifie 2026-10-06 par alignement avec
; le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). set_PIT_divisor :
; programme le diviseur du PIT 8253 (out 43h, 36h).
; ==============================================================================================
AIL_set_PIT_divisor_5FD3A	proc far		; CODE XREF: AIL_set_PIT_period_5FD5D+1Fp
					; AIL_release_timer_handle_5FFBD+33p

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
AIL_set_PIT_divisor_5FD3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_SetTickRateHz_5FD5D'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). set_PIT_period : convertit une
; periode en microsecondes en diviseur PIT (54925 us max).
; ==============================================================================================
AIL_set_PIT_period_5FD5D	proc far		; CODE XREF: AIL_program_timers_5FDD2+77p

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

loc_5FD7A:				; CODE XREF: AIL_set_PIT_period_5FD5D+Ej
		push	ax
		push	cs
		call	near ptr AIL_set_PIT_divisor_5FD3A
		add	sp, 2
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_set_PIT_period_5FD5D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_ConfigureModuleTiming_5FD87'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). ul_divide : division non
; signee 32 bits / 32 bits.
; ==============================================================================================
AIL_ul_divide_5FD87	proc far		; CODE XREF: AIL_set_timer_frequency_600DB+23p

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

loc_5FDA5:				; CODE XREF: AIL_ul_divide_5FD87+14j
		mov	bp, cx
		mov	cx, 20h	; ' '
		xor	di, di
		xor	si, si

loc_5FDAE:				; CODE XREF: AIL_ul_divide_5FD87:loc_5FDC5j
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_5FDC5
		ja	short loc_5FDC0
		cmp	si, bx
		jb	short loc_5FDC5

loc_5FDC0:				; CODE XREF: AIL_ul_divide_5FD87+33j
		sub	si, bx
		sbb	di, bp

loc_5FDC4:
		inc	ax

loc_5FDC5:				; CODE XREF: AIL_ul_divide_5FD87+31j
					; AIL_ul_divide_5FD87+37j
		loop	loc_5FDAE

loc_5FDC7:
		jmp	short loc_5FDCD
; ���������������������������������������������������������������������������

loc_5FDC9:				; CODE XREF: AIL_ul_divide_5FD87:loc_5FD9Fj
					; AIL_ul_divide_5FD87:loc_5FDA3j
		div	bx
		xor	dx, dx

loc_5FDCD:				; CODE XREF: AIL_ul_divide_5FD87:loc_5FDC7j
		pop	di

loc_5FDCE:
		pop	si
		pop	ds
		pop	bp
		retf
AIL_ul_divide_5FD87	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_RecomputeGlobalTickRate_5FDD2'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). program_timers : choisit
; la periode commune la plus courte des minuteries actives et reprogramme le PIT.
; ==============================================================================================
AIL_program_timers_5FDD2	proc far		; CODE XREF: AIL_set_timer_period_6008C+3Bp
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

loc_5FDE9:				; CODE XREF: AIL_program_timers_5FDD2+4Cj
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

loc_5FE11:				; CODE XREF: AIL_program_timers_5FDD2+34j
		mov	cs:word_5F8D2, ax
		mov	cs:word_5F8D4, dx

loc_5FE1A:				; CODE XREF: AIL_program_timers_5FDD2+21j
					; AIL_program_timers_5FDD2+36j ...
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

loc_5FE37:				; CODE XREF: AIL_program_timers_5FDD2+5Cj
		mov	cs:word_5F8D0, 0FFFFh
		mov	cs:word_5F8C8, ax
		mov	cs:word_5F8CA, dx
		push	ax
		push	cs
		call	near ptr AIL_set_PIT_period_5FD5D
		add	sp, 2
		push	cs
		pop	es
		assume es:seg161
		mov	di, 90h	; '�'
		mov	cx, 22h	; '"'
		mov	ax, 0
		rep stosw

loc_5FE5C:				; CODE XREF: AIL_program_timers_5FDD2+63j
		popf
		pop	di
		pop	si
		pop	ds
		retf
AIL_program_timers_5FDD2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Helper_5FE61'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_startup : initialisation de l'API
; (aucune minuterie active).
; ==============================================================================================
AIL_startup_5FE61	proc far		; CODE XREF: Stopwatch_RegisterTickModule_67611:loc_67621P
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
AIL_startup_5FE61	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_CleanupModuleSlot_5FE9F'. far. Identifie 2026-10-06 par alignement avec
; le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_shutdown(SignOff) :
; arrete tous les pilotes et minuteries.
; ==============================================================================================
AIL_shutdown_5FE9F	proc far		; CODE XREF: Stopwatch_StartOrStop_676F1:loc_67711P

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

loc_5FEAE:				; CODE XREF: AIL_shutdown_5FE9F+5Dj
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
		call	near ptr AIL_release_timer_handle_5FFBD
		add	sp, 2

loc_5FED5:				; CODE XREF: AIL_shutdown_5FE9F+2Cj
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 0
		pop	bp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs:word_5F95C
		push	cs
		call	near ptr AIL_shutdown_driver_60303
		add	sp, 8

loc_5FEF1:				; CODE XREF: AIL_shutdown_5FE9F+27j
		inc	cs:word_5F95C
		cmp	cs:word_5F95C, 10h
		jnz	short loc_5FEAE
		push	cs
		call	near ptr AIL_release_all_timers_60000
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_shutdown_5FE9F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_RegisterModule_5FF08'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_register_timer(callback) :
; reserve une des 16 minuteries pour une fonction appelee par l'interruption timer. Utilisee
; aussi par le jeu (Stopwatch_*, AudioQueue_RegisterTickModule_AA810).
; ==============================================================================================
AIL_register_timer_5FF08	proc far		; CODE XREF: AIL_init_driver_60254+46p
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

loc_5FF15:				; CODE XREF: AIL_register_timer_5FF08+1Bj
		cmp	word ptr cs:[bx+6Eh], 0
		jz	short loc_5FF2B
		add	bx, 2
		cmp	bx, 20h	; ' '
		jb	short loc_5FF15
		mov	ax, 0FFFFh
		jmp	loc_5FFB7
; ���������������������������������������������������������������������������

loc_5FF2B:				; CODE XREF: AIL_register_timer_5FF08+13j
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
		call	near ptr AIL_init_DDA_arrays_5FC8D
		mov	cs:word_5F83E, 1
		push	cs
		call	near ptr AIL_hook_timer_process_5FCCA
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
		call	near ptr AIL_set_timer_period_6008C
		add	sp, 6
		push	ax
		push	bp
		mov	bp, sp
		mov	word ptr [bp+2], 10h
		pop	bp
		push	cs
		call	near ptr AIL_start_timer_60018
		add	sp, 2
		pop	ax
		mov	bx, ax
		shl	bx, 1
		mov	word ptr cs:[bx+6Eh], 1

loc_5FFB7:				; CODE XREF: AIL_register_timer_5FF08+20j
					; AIL_register_timer_5FF08+5Bj
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_register_timer_5FF08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_UnregisterModule_5FFBD'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_release_timer_handle(timer).
; ==============================================================================================
AIL_release_timer_handle_5FFBD	proc far		; CODE XREF: AIL_shutdown_5FE9F+30p
					; AIL_release_all_timers_60000+Ap	...

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
		call	near ptr AIL_set_PIT_divisor_5FD3A
		add	sp, 2
		push	cs
		call	near ptr AIL_unhook_timer_process_5FD10

loc_5FFFA:				; CODE XREF: AIL_release_timer_handle_5FFBD+Ej
					; AIL_release_timer_handle_5FFBD+18j ...
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_release_timer_handle_5FFBD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_UnregisterAll_60000'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_release_all_timers : libere les
; 16 minuteries.
; ==============================================================================================
AIL_release_all_timers_60000	proc far		; CODE XREF: AIL_shutdown_5FE9F+60p
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	si, 0Fh

loc_60008:				; CODE XREF: AIL_release_all_timers_60000+11j
		push	si
		push	cs
		call	near ptr AIL_release_timer_handle_5FFBD
		add	sp, 2
		dec	si
		jge	short loc_60008
		popf
		pop	di
		pop	si
		pop	ds
		retf
AIL_release_all_timers_60000	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_Helper_60018'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_start_timer(timer) : etat 1 -> 2
; (active).
; ==============================================================================================
AIL_start_timer_60018	proc far		; CODE XREF: AIL_register_timer_5FF08+9Dp
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

loc_60034:				; CODE XREF: AIL_start_timer_60018+13j
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_start_timer_60018	endp

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
		call	near ptr AIL_start_timer_60018
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
; Ex-'ModuleRegistry_Helper3_60052'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_stop_timer(timer) : etat 2 -> 1.
; ==============================================================================================
AIL_stop_timer_60052	proc far		; CODE XREF: seg161:08CEp
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

loc_6006E:				; CODE XREF: AIL_stop_timer_60052+13j
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_stop_timer_60052	endp

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
		call	near ptr AIL_stop_timer_60052
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
; Ex-'ModuleRegistry_ConfigureAndActivate_6008C'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC).
; AIL_set_timer_period(timer, microsecondes).
; ==============================================================================================
AIL_set_timer_period_6008C	proc far		; CODE XREF: AIL_register_timer_5FF08+8Cp
					; AIL_set_timer_frequency_600DB+2Fp ...

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
		call	near ptr AIL_program_timers_5FDD2
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
AIL_set_timer_period_6008C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_ConfigureAndActivate_600DB'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC).
; AIL_set_timer_frequency(timer, Hz) : periode = 1 000 000 / Hz (AIL_ul_divide_5FD87(0xF4240,
; Hz)) puis AIL_set_timer_period_6008C.
; ==============================================================================================
AIL_set_timer_frequency_600DB	proc far		; CODE XREF: AIL_init_driver_60254+67p
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
		call	near ptr AIL_ul_divide_5FD87
		add	sp, 8
		push	dx
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr AIL_set_timer_period_6008C
		add	sp, 6
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_set_timer_frequency_600DB	endp

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
		call	near ptr AIL_set_timer_period_6008C
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
; Ex-'ModuleRegistry_QueryOrDispatch_6015A'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_register_driver(pilote) :
; enregistre l'image d'un pilote .ADV charge en memoire dans une des 16 entrees (table
; cs:+0x128) ; renvoie le handle ou -1.
; ==============================================================================================
AIL_register_driver_6015A	proc far		; CODE XREF: Sound_LoadDriverAndTimbreCache_5A0F3+113P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	ds
		push	si
		push	di
		pushf
		cli
		mov	cs:word_5F95C, 0

loc_60169:				; CODE XREF: AIL_register_driver_6015A+2Fj
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

loc_60190:				; CODE XREF: AIL_register_driver_6015A+22j
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
		call	near ptr AIL_describe_driver_60228
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
		call	near ptr AIL_call_driver_5FBA6
		add	sp, 0Eh
		pop	ax

loc_601FA:				; CODE XREF: AIL_register_driver_6015A+34j
					; AIL_register_driver_6015A+42j ...
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_register_driver_6015A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_ReleaseSlotIfSet_60200'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_release_driver_handle(H).
; ==============================================================================================
AIL_release_driver_handle_60200	proc far		; CODE XREF: Music_ShutdownDriver_5A856:loc_5A87CP

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

loc_60222:				; CODE XREF: AIL_release_driver_handle_60200+Ej
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_release_driver_handle_60200	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_QueryModuleField_60228'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_describe_driver(H) : fonction
; pilote 100 (0x64, AIL_DESC_DRVR), renvoie le descripteur du pilote (type, ports par
; defaut...).
; ==============================================================================================
AIL_describe_driver_60228	proc far		; CODE XREF: Sound_LoadDriverAndTimbreCache_5A0F3+125P
					; AIL_register_driver_6015A+5Fp ...

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
		call	near ptr AIL_call_driver_5FBA6
		add	sp, 6
		pop	bp
		retf
AIL_describe_driver_60228	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_65_6024E'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 65h / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (101 = AIL_DET_DEV dans AIL.INC) et y saute. Detection de la carte (pour
; l'AdLib : test des timers OPL, ADLIB_DRIVER.md §7).
; ==============================================================================================
AIL_detect_device_6024E	proc far		; CODE XREF: Sound_LoadDriverAndTimbreCache_5A0F3+17AP
		mov	ax, 65h	; 'e'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_detect_device_6024E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'ModuleRegistry_ConfigureModuleExtended_60254'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_init_driver(H, IO,
; IRQ, DMA, DRQ) : fonction pilote 102 (AIL_INIT_DRVR), puis enregistre une minuterie pour le
; service periodique du pilote (103, AIL_SERVE_DRVR) a la frequence qu'il demande.
; ==============================================================================================
AIL_init_driver_60254	proc far		; CODE XREF: Sound_LoadDriverAndTimbreCache_5A0F3+1B4P

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

loc_60265:				; CODE XREF: AIL_init_driver_60254+Cj
		mov	cs:word_5F962, 0FFFFh
		push	[bp+arg_0]
		push	cs
		call	near ptr AIL_describe_driver_60228
		add	sp, 2
		mov	es, dx
		mov	di, ax
		mov	si, es:[di+14h]
		cmp	si, 0FFFFh
		jz	short loc_602C1
		mov	ax, 67h	; 'g'
		mov	bx, [bp+arg_0]
		push	cs
		call	near ptr AIL_find_proc_5FB6E
		mov	bx, ax
		or	bx, dx

loc_60291:
		jz	short loc_602C1
		mov	es, dx
		mov	bx, ax
		push	es
		push	bx
		push	cs
		call	near ptr AIL_register_timer_5FF08
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
		call	near ptr AIL_set_timer_frequency_600DB
		add	sp, 6

loc_602C1:				; CODE XREF: AIL_init_driver_60254+2Dj
					; AIL_init_driver_60254:loc_60291j
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
		call	near ptr AIL_call_driver_5FBA6
		add	sp, 0Ch
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	word ptr cs:[bx+188h], 1
		cmp	cs:word_5F962, 0FFFFh
		jz	short loc_602FD
		push	cs:word_5F962
		push	cs
		call	near ptr AIL_start_timer_60018
		add	sp, 2

loc_602FD:				; CODE XREF: AIL_init_driver_60254+Ej
					; AIL_init_driver_60254+9Bj
		popf
		pop	di
		pop	si
		pop	ds
		pop	bp
		retf
AIL_init_driver_60254	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_CleanupModuleReference_60303'. far. Identifie 2026-10-06 par alignement
; avec le source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de
; procedures que seg161 ; numeros de fonctions pilote dans AIL.INC). AIL_shutdown_driver(H,
; SignOff) : fonction pilote 104 (0x68), libere sa minuterie.
; ==============================================================================================
AIL_shutdown_driver_60303	proc far		; CODE XREF: Music_ShutdownDriver_5A856+1BP
					; AIL_shutdown_5FE9F+4Cp
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
		call	near ptr AIL_release_timer_handle_5FFBD
		add	sp, 2

loc_6032F:				; CODE XREF: AIL_shutdown_driver_60303+22j
		mov	ax, 68h	; 'h'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������

locret_60335:				; CODE XREF: AIL_shutdown_driver_60303+9j
					; AIL_shutdown_driver_60303+18j
		retf
AIL_shutdown_driver_60303	endp

; ���������������������������������������������������������������������������
		mov	ax, 78h	; 'x'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 79h	; 'y'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 86h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 7Ah	; 'z'
		jmp	near ptr AIL_call_driver_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_7B_6034E'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 7Bh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (123 = AIL_P_VOC_FILE dans AIL.INC) et y saute. Lance un fichier VOC (son
; numerise) ; appele par le cluster AudioQueue_* (AudioQueue_MainProcessEntry_ABBEF).
; ==============================================================================================
AIL_play_VOC_file_6034E	proc far		; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+19BP
					; AudioQueue_FinalizeAndRelease_ABDEC:loc_ABE44P
		mov	ax, 7Bh	; '{'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_play_VOC_file_6034E	endp

; ���������������������������������������������������������������������������
		mov	ax, 85h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_7C_6035A'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 7Ch / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (124 = AIL_VOC_PB_STAT dans AIL.INC) et y saute.
; ==============================================================================================
AIL_VOC_playback_status_6035A	proc far		; CODE XREF: AudioQueue_OpcodeHelper_ABDAF+18P
					; AudioQueue_FinalizeAndRelease_ABDEC+1AP
		mov	ax, 7Ch	; '|'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_VOC_playback_status_6035A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_7D_60360'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 7Dh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (125 = AIL_START_D_PB dans AIL.INC) et y saute.
; ==============================================================================================
AIL_start_digital_playback_60360	proc far		; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+1A4P
					; AudioQueue_FinalizeAndRelease_ABDEC:loc_ABE4DP
		mov	ax, 7Dh	; '}'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_start_digital_playback_60360	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_7E_60366'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 7Eh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (126 = AIL_STOP_D_PB dans AIL.INC) et y saute. Suivent sans entree propre :
; AIL_pause_digital_playback (0x7F), AIL_resume_digital_playback (0x80),
; AIL_set_digital_playback_volume (0x81), AIL_digital_playback_volume (0x82),
; AIL_set_digital_playback_panpot (0x83), AIL_digital_playback_panpot (0x84).
; ==============================================================================================
AIL_stop_digital_playback_60366	proc far		; CODE XREF: seg125:02EFP
					; AudioQueue_OpcodeWrapper_AB883+13P ...
		mov	ax, 7Eh	; '~'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_stop_digital_playback_60366	endp

; ���������������������������������������������������������������������������
		mov	ax, 7Fh	; ''
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 80h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 81h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 82h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 83h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 84h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_96_60390'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 96h / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (150 = AIL_STATE_TAB_SIZE dans AIL.INC) et y saute. Taille de la table d'etat a
; allouer par sequence XMIDI ('No mem for XMIDI state table.').
; ==============================================================================================
AIL_state_table_size_60390	proc far		; CODE XREF: Music_ChannelInit_59F87+1DP
		mov	ax, 96h	; '�'

loc_60393:
		jmp	near ptr AIL_call_driver_5FBA6
AIL_state_table_size_60390	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_97_60396'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 97h / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (151 = AIL_REG_SEQ dans AIL.INC) et y saute. Enregistre une sequence XMIDI
; (pointeur sur le FORM XMID / CAT, numero de sequence, table d'etat) ; le pilote la jouera
; lui-meme (interpreteur XMIDI dans ADLIB.ADV, find_seq de XMIDI.ASM).
; ==============================================================================================
AIL_register_sequence_60396	proc far		; CODE XREF: Music_ChannelRegisterSequence_59FF5+A6P
		mov	ax, 97h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_register_sequence_60396	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_98_6039C'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 98h / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (152 = AIL_REL_SEQ_HND dans AIL.INC) et y saute.
; ==============================================================================================
AIL_release_sequence_handle_6039C	proc far		; CODE XREF: Music_ChannelStopSequence_59F1D+5AP
		mov	ax, 98h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_release_sequence_handle_6039C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_99_603A2'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 99h / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (153 = AIL_T_CACHE_SIZE dans AIL.INC) et y saute.
; ==============================================================================================
AIL_default_timbre_cache_size_603A2	proc far		; CODE XREF: Sound_LoadDriverAndTimbreCache_5A0F3+1D1P
		mov	ax, 99h	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_default_timbre_cache_size_603A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_9A_603A8'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 9Ah / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (154 = AIL_DEFINE_T_CACHE dans AIL.INC) et y saute. Fournit au pilote le cache
; de timbres alloue ('No memory for timbre cache.').
; ==============================================================================================
AIL_define_timbre_cache_603A8	proc far		; CODE XREF: Sound_LoadDriverAndTimbreCache_5A0F3+23CP
		mov	ax, 9Ah	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_define_timbre_cache_603A8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_9B_603AE'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 9Bh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (155 = AIL_T_REQ dans AIL.INC) et y saute. Renvoie le prochain timbre (banque,
; patch) dont la sequence a besoin et qui n'est pas encore installe ; le jeu le charge puis
; appelle AIL_install_timbre_603B4.
; ==============================================================================================
AIL_timbre_request_603AE	proc far		; CODE XREF: Music_ChannelRegisterSequence_59FF5+D3P
		mov	ax, 9Bh	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_timbre_request_603AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_9C_603B4'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 9Ch / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (156 = AIL_INSTALL_T dans AIL.INC) et y saute.
; ==============================================================================================
AIL_install_timbre_603B4	proc far		; CODE XREF: Music_InstallTimbre_5A62A+4AP
		mov	ax, 9Ch	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_install_timbre_603B4	endp

; ���������������������������������������������������������������������������
		mov	ax, 9Dh	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 9Eh	; '�'

loc_603C3:
		jmp	near ptr AIL_call_driver_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_9F_603C6'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 9Fh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (159 = AIL_T_STATUS dans AIL.INC) et y saute. Le timbre (banque, patch) est-il
; deja dans le cache ?
; ==============================================================================================
AIL_timbre_status_603C6	proc far		; CODE XREF: Music_InstallTimbre_5A62A+17P
		mov	ax, 9Fh	; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_timbre_status_603C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_AA_603CC'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0AAh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (170 = AIL_START_SEQ dans AIL.INC) et y saute.
; ==============================================================================================
AIL_start_sequence_603CC	proc far		; CODE XREF: seg121:059FP
					; Music_TuneTransitionResolve_595C2+FFP ...
		mov	ax, 0AAh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_start_sequence_603CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_AB_603D2'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0ABh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (171 = AIL_STOP_SEQ dans AIL.INC) et y saute.
; ==============================================================================================
AIL_stop_sequence_603D2	proc far		; CODE XREF: Music_ChannelStopSequence_59F1D+42P
					; AudioQueue_ActivateSlotOpcode_AB16F+18P ...
		mov	ax, 0ABh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_stop_sequence_603D2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_AD_603D8'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0ADh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (173 = AIL_RESUME_SEQ dans AIL.INC) et y saute.
; ==============================================================================================
AIL_resume_sequence_603D8	proc far		; CODE XREF: AudioQueue_DeactivateSlotOpcode_AB1AF+18P
					; AudioQueue_DeactivateSlotOpcode_AB1AF:loc_AB1E3P
		mov	ax, 0ADh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_resume_sequence_603D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_AE_603DE'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0AEh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (174 = AIL_SEQ_STAT dans AIL.INC) et y saute. 0 arretee, 1 en cours, 2 terminee
; (AIL.INC : SEQ_STOPPED/PLAYING/DONE).
; ==============================================================================================
AIL_sequence_status_603DE	proc far		; CODE XREF: seg121:0605P seg121:0676P ...
		mov	ax, 0AEh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_sequence_status_603DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_AF_603E4'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0AFh / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (175 = AIL_REL_VOL dans AIL.INC) et y saute.
; ==============================================================================================
AIL_relative_volume_603E4	proc far		; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+B3P
		mov	ax, 0AFh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_relative_volume_603E4	endp

; ���������������������������������������������������������������������������
		mov	ax, 0B0h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_B1_603F0'. far. Identifie 2026-10-06 par alignement avec le source
; public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures que
; seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0B1h / jmp
; call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la fonction
; de ce numero (177 = AIL_SET_REL_VOL dans AIL.INC) et y saute. Volume relatif de la sequence
; (0-100 %) avec duree de rampe en ms : c'est le FONDU. Suivent sans entree propre :
; AIL_set_relative_tempo (0xB2, loc_603F6), AIL_beat_count (0xB3, loc_603FC).
; ==============================================================================================
AIL_set_relative_volume_603F0	proc far		; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+9DP
					; Weapon_HUDBox_TimerCaseE_599D3+8BP ...
		mov	ax, 0B1h ; '�'

loc_603F3:
		jmp	near ptr AIL_call_driver_5FBA6
AIL_set_relative_volume_603F0	endp

; ���������������������������������������������������������������������������

loc_603F6:
		mov	ax, 0B2h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������

loc_603FC:
		mov	ax, 0B3h ; '�'

loc_603FF:
		jmp	near ptr AIL_call_driver_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_UNKNOWN_60402'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0B4h /
; jmp call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la
; fonction de ce numero (180 = AIL_BAR_CNT dans AIL.INC) et y saute. Numero de mesure courant
; de la sequence ; appele par le tick musical (Music_SequencerTickDispatch_59436). Suivent
; sans entree propre : AIL_branch_index (0xB5), AIL_controller_value (0xB6),
; AIL_set_controller_value (0xB7), AIL_channel_notes (0xB9).
; ==============================================================================================
AIL_measure_count_60402	proc far		; CODE XREF: seg121:05DCP seg121:0652P
		mov	ax, 0B4h ; '�'

loc_60405:
		jmp	near ptr AIL_call_driver_5FBA6
AIL_measure_count_60402	endp

; ���������������������������������������������������������������������������
		mov	ax, 0B5h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0B6h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0B7h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0B9h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Ex-'ModuleRegistry_Opcode_UNKNOWN_60420'. far. Identifie 2026-10-06 par alignement avec le
; source public AIL 2.0 (Miles Design, analysis/ail_sources/AIL.ASM, meme ordre de procedures
; que seg161 ; numeros de fonctions pilote dans AIL.INC). Thunk d'API AIL : 'mov ax, 0BAh /
; jmp call_driver' -> AIL_call_driver_5FBA6 cherche dans la table du pilote enregistre la
; fonction de ce numero (186 = AIL_SEND_CV_MSG dans AIL.INC) et y saute. Envoie un message
; MIDI de canal directement au pilote.
; ==============================================================================================
AIL_send_channel_voice_message_60420	proc far		; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+1F7P
		mov	ax, 0BAh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
AIL_send_channel_voice_message_60420	endp

; ���������������������������������������������������������������������������
		mov	ax, 0BBh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0BCh ; '�'

loc_6042F:
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������

loc_60432:
		mov	ax, 0BDh ; '�'

loc_60435:
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0BEh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0BFh ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0C0h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������
		mov	ax, 0C1h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
; ���������������������������������������������������������������������������

loc_60450:
		mov	ax, 0C2h ; '�'
		jmp	near ptr AIL_call_driver_5FBA6
seg161		ends
