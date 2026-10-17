seg000		segment	byte public 'CODE' use16
		assume cs:seg000
		assume es:nothing, ss:dseg, ds:nothing,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


		public EntryPoint_RuntimeInit
; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntryPoint_RuntimeInit (start de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — Point d'entrée EXE : init
; runtime overlay manager Borland (calcul heap/pile, relocation bloc mémoire via INT21 4Ah,
; zero-init BSS), branche vers loc_2AD (init C runtime).
; ==============================================================================================
EntryPoint_RuntimeInit		proc near		; CODE XREF: seg099:002DJ
					; DATA XREF: seg170:00BEo
		mov	dx, seg	dseg
		mov	cs:word_2C9, dx	; DATA XREF: VROOMM_ScanMemoryArena_3FD83+26r
					; VROOMM_ScanMemoryArena_3FD83+2Ar
		mov	ah, 30h
		int	21h		; DOS -	GET DOS	VERSION
					; Return: AL = major version number (00h for DOS 1.x)
		mov	bp, ds:2

loc_10:					; DATA XREF: VROOMM_ScanMemoryArena_3FD83+39w
					; VROOMM_ScanMemoryArena_3FD83+15r
		mov	bx, ds:2Ch
		mov	ds, dx
		assume ds:dseg
		mov	word_4313E, ax
		mov	word_4313C, es	; DATA XREF: VROOMM_ScanMemoryArena_3FD83+41w
					; VROOMM_ScanMemoryArena_3FD83+4Bw
		mov	word_43138, bx	; DATA XREF: AIL_hook_timer_process_30540+Ar
					; AIL_hook_timer_process_30540+37w ...
		mov	word_43154, bp	; DATA XREF: AIL_hook_timer_process_30540+Fr
					; AIL_hook_timer_process_30540+3Cw ...
		call	CRT_SaveIntVectors
		mov	ax, word_43138
		mov	es, ax
		xor	ax, ax
		mov	bx, ax
		mov	di, ax
		mov	cx, 7FFFh
		cld

loc_37:					; CODE XREF: EntryPoint_RuntimeInit+3Fj
		repne scasb
		jcxz	short loc_9C
		inc	bx
		cmp	es:[di], al
		jnz	short loc_37
		or	ch, 80h
		neg	cx
		mov	word_43136, cx
		mov	cx, 1
		shl	bx, cl
		add	bx, 8
		and	bx, 0FFF8h
		mov	word_4313A, bx
		mov	dx, ds
		sub	bp, dx
		mov	di, word_43156
		cmp	di, 200h
		jnb	short loc_6E
		mov	di, 200h
		mov	word_43156, di

loc_6E:					; CODE XREF: EntryPoint_RuntimeInit+65j
		add	di, 6892h
		jb	short loc_9C
		add	di, word_48780
		jb	short loc_9C
		mov	cl, 4
		shr	di, cl
		inc	di
		cmp	bp, di
		jb	short loc_9C
		cmp	word_43156, 0
		jz	short loc_91
		cmp	word_48780, 0
		jnz	short loc_9F

loc_91:					; CODE XREF: EntryPoint_RuntimeInit+88j
		mov	di, 1000h
		cmp	bp, di
		ja	short loc_9F
		mov	di, bp
		jmp	short loc_9F
; ���������������������������������������������������������������������������

loc_9C:					; CODE XREF: EntryPoint_RuntimeInit+39j	EntryPoint_RuntimeInit+72j ...
		jmp	loc_2B1
; ���������������������������������������������������������������������������

loc_9F:					; CODE XREF: EntryPoint_RuntimeInit+8Fj	EntryPoint_RuntimeInit+96j ...
		mov	bx, di
		add	bx, dx
		mov	word_4314C, bx
		mov	word_43150, bx
		mov	ax, word_4313C
		sub	bx, ax
		mov	es, ax
		mov	ah, 4Ah	; 'J'
		push	di
		int	21h		; DOS -	2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
					; ES = segment address of block	to change
					; BX = new size	in paragraphs
		pop	di
		shl	di, cl
		cli
		mov	ss, dx
		mov	sp, di
		sti
		xor	ax, ax
		mov	es, cs:word_2C9
		mov	di, 5A04h
		mov	cx, 6892h
		sub	cx, di
		cld
		rep stosb
		cmp	word_48756, 14h
		jbe	short loc_120
		cmp	byte ptr word_4313E, 3
		jb	short loc_120
		ja	short loc_E9
		cmp	byte ptr word_4313E+1, 1Eh
		jb	short loc_120

loc_E9:					; CODE XREF: EntryPoint_RuntimeInit+E0j
		mov	ax, 5801h
		mov	bx, 2
		int	21h		; DOS -	3+ - GET/SET MEMORY ALLOCATION STRATEGY
					; AL = function	code: set allocation strategy
		jb	short loc_11D
		mov	ah, 67h	; 'g'
		mov	bx, word_48756
		int	21h		; DOS -	3.3+ - SET HANDLE COUNT
					; BX = desired number of handles (max 255)
		jb	short loc_11D
		mov	ah, 48h	; 'H'
		mov	bx, 1
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jb	short loc_11D
		inc	ax
		mov	word_43154, ax
		dec	ax
		mov	es, ax
		assume es:nothing
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		jb	short loc_11D
		mov	ax, 5801h
		mov	bx, 0
		int	21h		; DOS -	3+ - GET/SET MEMORY ALLOCATION STRATEGY
					; AL = function	code: set allocation strategy
		jnb	short loc_120

loc_11D:				; CODE XREF: EntryPoint_RuntimeInit+F1j	EntryPoint_RuntimeInit+FBj ...
		jmp	loc_2B1
; ���������������������������������������������������������������������������

loc_120:				; CODE XREF: EntryPoint_RuntimeInit+D7j	EntryPoint_RuntimeInit+DEj ...
		mov	ah, 0
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	word_43142, dx
		mov	word_43144, cx
		or	al, al
		jz	short loc_13C
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	bx, 70h	; 'p'
		mov	byte ptr es:[bx], 1

loc_13C:				; CODE XREF: EntryPoint_RuntimeInit+12Ej
		xor	bp, bp
		mov	es, cs:word_2C9
		assume es:nothing
		mov	si, 58C6h
		mov	di, 5992h
		call	CRT_RunAtexitTable_MinPrio
		push	word_43134
		push	word_43132
		push	word_43130
		call	sub_3166
		push	ax
		nop
		push	cs
		call	near ptr CRT_Exit
EntryPoint_RuntimeInit		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Ovl_CopyStubTable (sub_163 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — copie mémoire
; (memcpy-like via sub_264) 4EC8h→4F64h : init table du overlay manager.
; ==============================================================================================
Ovl_CopyStubTable		proc far		; CODE XREF: CRT_ExitSequence+26p
		mov	es, cs:word_2C9
		push	si
		push	di
		mov	si, 5992h
		mov	di, 5A04h
		call	CRT_RunInitTable_MaxPrio
		pop	di
		pop	si
		retf
Ovl_CopyStubTable		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_176		proc far		; CODE XREF: CRT_ExitSequence+34p
		push	si
		push	di
		mov	es, cs:word_2C9
		xor	ax, ax
		mov	si, ax
		mov	cx, 2Fh	; '/'
		nop

loc_185:				; CODE XREF: sub_176+16j
		add	al, es:[si]
		adc	ah, 0
		inc	si
		loop	loc_185
		sub	ax, 0D5Ch
		nop
		jz	short loc_19E
		mov	cx, 19h
		nop
		mov	dx, 2Fh	; '/'
		call	sub_2A9

loc_19E:				; CODE XREF: sub_176+1Cj
		pop	di
		pop	si
		retf
sub_176		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A1		proc near		; CODE XREF: CRT_ExitSequence+4Ep

arg_2		= byte ptr  4

		mov	bp, sp
		mov	ah, 4Ch	; 'L'
		mov	al, [bp+arg_2]
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
sub_1A1		endp			; AL = exit code

; ���������������������������������������������������������������������������
		mov	cx, 0Eh
		nop
		mov	dx, 48h	; 'H'
		jmp	loc_2B8

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_SaveIntVectors (sub_1B0 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — near — sauvegarde vecteurs
; INT 00h/04h/05h/06h (INT21 AH=35h) puis installe handler custom sur INT00h (divide-by-zero
; trap).
; ==============================================================================================
CRT_SaveIntVectors		proc near		; CODE XREF: EntryPoint_RuntimeInit+25p
		push	ds
		mov	ax, 3500h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_43120, bx
		mov	word ptr dword_43120+2,	es
		mov	ax, 3504h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_43124, bx
		mov	word ptr dword_43124+2,	es
		mov	ax, 3505h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_43128, bx
		mov	word ptr dword_43128+2,	es
		mov	ax, 3506h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_4312C, bx
		mov	word ptr dword_4312C+2,	es
		mov	ax, 2500h
		mov	dx, cs
		mov	ds, dx
		assume ds:seg000
		mov	dx, 1AAh
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		assume ds:dseg
		retn
CRT_SaveIntVectors		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_RestoreIntVectors (sub_1F3 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — restaure les vecteurs
; d'interruption sauvegardés par sub_1B0 (INT21 AH=25h), cleanup à l'exit.
; ==============================================================================================
CRT_RestoreIntVectors		proc far		; CODE XREF: CRT_ExitSequence+2Fp
		push	ds
		mov	ax, 2500h
		lds	dx, dword_43120
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2504h
		lds	dx, dword_43124
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2505h
		lds	dx, dword_43128
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2506h
		lds	dx, dword_4312C
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		retf
CRT_RestoreIntVectors		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_RunAtexitTable_MinPrio (sub_220 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — near — dispatcher table 6 octets/entrée : cherche l'entrée
; de priorité minimale non traitée et l'exécute ; boucle jusqu'à épuisement (exit-handlers
; ordonnés, type atexit).
; ==============================================================================================
CRT_RunAtexitTable_MinPrio		proc near		; CODE XREF: EntryPoint_RuntimeInit+149p CRT_RunAtexitTable_MinPrio+3Aj ...
		mov	ax, 100h
		mov	dx, di
		mov	bx, si

loc_22B:				; CODE XREF: CRT_RunAtexitTable_MinPrio+22j
		cmp	bx, di
		jz	short loc_248
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_243
		mov	cl, es:[bx+1]
		xor	ch, ch
		cmp	cx, ax
		jnb	short loc_243
		mov	ax, cx
		mov	dx, bx

loc_243:				; CODE XREF: CRT_RunAtexitTable_MinPrio+Fj CRT_RunAtexitTable_MinPrio+19j
		add	bx, 6
		jmp	short loc_22B
; ���������������������������������������������������������������������������

loc_248:				; CODE XREF: CRT_RunAtexitTable_MinPrio+9j
		cmp	dx, di
		jz	short locret_267
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_260
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunAtexitTable_MinPrio
; ���������������������������������������������������������������������������

loc_260:				; CODE XREF: CRT_RunAtexitTable_MinPrio+33j
		call	word ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunAtexitTable_MinPrio
; ���������������������������������������������������������������������������

locret_267:				; CODE XREF: CRT_RunAtexitTable_MinPrio+26j
		retn
CRT_RunAtexitTable_MinPrio		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_RunInitTable_MaxPrio (sub_264 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — near — variante de sub_220 cherchant la priorité MAXIMALE
; (init-handlers/constructeurs statiques, ordre croissant).
; ==============================================================================================
CRT_RunInitTable_MaxPrio		proc near		; CODE XREF: Ovl_CopyStubTable+Dp CRT_RunInitTable_MaxPrio+37j ...
		mov	ah, 0
		mov	dx, di
		mov	bx, si

loc_26E:				; CODE XREF: CRT_RunInitTable_MaxPrio+1Fj
		cmp	bx, di
		jz	short loc_289
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_284
		cmp	es:[bx+1], ah
		jb	short loc_284
		mov	ah, es:[bx+1]
		mov	dx, bx

loc_284:				; CODE XREF: CRT_RunInitTable_MaxPrio+Ej CRT_RunInitTable_MaxPrio+14j
		add	bx, 6
		jmp	short loc_26E
; ���������������������������������������������������������������������������

loc_289:				; CODE XREF: CRT_RunInitTable_MaxPrio+8j
		cmp	dx, di
		jz	short locret_2A8
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_2A1
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunInitTable_MaxPrio
; ���������������������������������������������������������������������������

loc_2A1:				; CODE XREF: CRT_RunInitTable_MaxPrio+30j
		call	word ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunInitTable_MaxPrio
; ���������������������������������������������������������������������������

locret_2A8:				; CODE XREF: CRT_RunInitTable_MaxPrio+23j
		retn
CRT_RunInitTable_MaxPrio		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_2A9		proc near		; CODE XREF: sub_176+25p seg000:02BDp
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		retn
sub_2A9		endp

; ���������������������������������������������������������������������������

loc_2B1:				; CODE XREF: EntryPoint_RuntimeInit:loc_9Cj
					; EntryPoint_RuntimeInit:loc_11Dj ...
		mov	cx, 1Eh
		nop
		mov	dx, offset aAbnormalProgra ; "Abnormal program termination\r\n"

loc_2B8:				; CODE XREF: seg000:01B1j
		mov	ds, cs:word_2C9
		call	sub_2A9
		mov	ax, 3
		push	ax

loc_2C4:				; DATA XREF: VROOMM_ScanMemoryArena_3FD83+1Dr
		nop
		push	cs

loc_2C6:				; DATA XREF: VROOMM_ScanMemoryArena_3FD83+21r
		call	near ptr CRT_Abort
; ���������������������������������������������������������������������������
word_2C9	dw 0			; DATA XREF: EntryPoint_RuntimeInit+3w EntryPoint_RuntimeInit+C2r ...
		db 2, 80h

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2CD		proc far		; CODE XREF: sub_7D52+447P
					; ConfigOption_ApplyAndDisplayB_3E1B3+34P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		or	ax, ax
		jge	short loc_2D9
		neg	ax

loc_2D9:				; CODE XREF: sub_2CD+8j
		pop	bp
		retf
sub_2CD		endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	word_48506, 20h	; ' '
		jnz	short loc_2EA
		mov	ax, 1
		jmp	short loc_306
; ���������������������������������������������������������������������������

loc_2EA:				; CODE XREF: seg000:02E3j
		mov	bx, word_48506
		mov	cl, 2
		shl	bx, cl
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		mov	[bx+6806h], ax
		mov	[bx+6804h], dx
		inc	word_48506
		xor	ax, ax

loc_306:				; CODE XREF: seg000:02E8j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_308		proc far		; CODE XREF: CRT_Doprnt_Core+1A8p seg001:03DEP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		call	Heap_FreeAndCoalesce_2C3FC
		pop	cx
		pop	bp
		retf
sub_308		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_316		proc far		; CODE XREF: seg073:002FP
					; sub_C359F+27P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, ds
		cmp	[bp+arg_2], ax
		jnz	short loc_32B
		push	[bp+arg_0]
		call	Heap_FreeAndCoalesce_2C3FC
		pop	cx
		jmp	short loc_338
; ���������������������������������������������������������������������������

loc_32B:				; CODE XREF: sub_316+8j
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	Runtime_HeapFreeHook_2CA25
		pop	cx
		pop	cx

loc_338:				; CODE XREF: sub_316+13j
		pop	bp
		retf
sub_316		endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_1. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_ExitSequence (sub_36B de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — near — séquence de fin de
; programme runtime C : exécute table de terminate-handlers (word_71A1E/off_71B22), restaure
; interruptions (sub_1F3/sub_176 checksum), exit conditionnel via sub_19E. Cœur de
; exit()/_exit().
; ==============================================================================================
CRT_ExitSequence		proc near		; CODE XREF: CRT_Exit+Ap CRT_Abort+Dp ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		or	si, si
		jnz	short loc_368
		jmp	short loc_358
; ���������������������������������������������������������������������������

loc_348:				; CODE XREF: CRT_ExitSequence+22j
		dec	word_48506
		mov	bx, word_48506
		mov	cl, 2
		shl	bx, cl
		call	dword ptr [bx+6804h]

loc_358:				; CODE XREF: CRT_ExitSequence+Bj
		cmp	word_48506, 0
		jnz	short loc_348
		nop
		push	cs
		call	near ptr Ovl_CopyStubTable
		call	off_4860A

loc_368:				; CODE XREF: CRT_ExitSequence+9j
		nop
		push	cs
		call	near ptr CRT_RestoreIntVectors
		nop
		push	cs
		call	near ptr sub_176
		cmp	[bp+arg_2], 0
		jnz	short loc_38D
		or	si, si
		jnz	short loc_384
		call	off_4860E
		call	off_48612

loc_384:				; CODE XREF: CRT_ExitSequence+3Fj
		push	[bp+arg_0]
		nop
		push	cs
		call	sub_1A1
		pop	cx

loc_38D:				; CODE XREF: CRT_ExitSequence+3Bj
		pop	si
		pop	bp
		retn	6
CRT_ExitSequence		endp ; sp = -2


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Exit (sub_3C2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper exit(code) → sub_36B(0,0,code).
; ==============================================================================================
CRT_Exit		proc far		; CODE XREF: EntryPoint_RuntimeInit+160p sub_30D3+1FP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	ax
		push	[bp+arg_0]
		call	CRT_ExitSequence
		pop	bp
		retf
CRT_Exit		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Abort (sub_3D1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper _exit/abort(code) flag=1 → sub_36B(1,0,code).
; ==============================================================================================
CRT_Abort		proc far		; CODE XREF: seg000:loc_2C6p
					; VROOMM_DemandLoadDispatch_4000C-3CF3Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 1
		push	ax
		xor	ax, ax
		push	ax
		push	[bp+arg_0]
		call	CRT_ExitSequence
		pop	bp
		retf
CRT_Abort		endp

; ���������������������������������������������������������������������������
		xor	ax, ax
		push	ax
		mov	ax, 1
		push	ax
		xor	ax, ax
		push	ax
		call	CRT_ExitSequence
		retf
; ���������������������������������������������������������������������������
		mov	ax, 1
		push	ax
		push	ax
		xor	ax, ax
		push	ax
		call	CRT_ExitSequence
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Fmemcpy (sub_3FD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; memcpy générique (rep movsw+movsb) : équivalent _fmemcpy.
; ==============================================================================================
CRT_Fmemcpy		proc far		; CODE XREF: ConfigOption_FormatValue_3E0C6+3BP
					; ConfigOption_FormatValueB_3E123+2DP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		lds	si, [bp+arg_0]
		les	di, [bp+arg_4]
		cld
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf	8
CRT_Fmemcpy		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3E9		proc far		; CODE XREF: sub_85A+10p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ah, 2Ah
		int	21h		; DOS -	GET CURRENT DATE
					; Return: DL = day, DH = month,	CX = year
					; AL = day of the week (0=Sunday, 1=Monday, etc.)
		mov	[si], cx
		mov	[si+2],	dx
		pop	si
		pop	bp
		retf
sub_3E9		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3FC		proc far		; CODE XREF: sub_85A+1Ap

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ah, 2Ch
		int	21h		; DOS -	GET CURRENT TIME
					; Return: CH = hours, CL = minutes, DH = seconds
					; DL = hundredths of seconds
		mov	[si], cx
		mov	[si+2],	dx
		pop	si
		pop	bp
		retf
sub_3FC		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_GetVect (sub_419 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper getvect() (INT21 AH=35h).
; ==============================================================================================
CRT_GetVect		proc far		; CODE XREF: JoystickCallback_RegisterInChain_3DD45+1FP

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 35h	; '5'
		mov	al, [bp+arg_0]
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		xchg	ax, bx
		mov	dx, es
		pop	bp
		retf
CRT_GetVect		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_SetVect (sub_428 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper setvect() (INT21 AH=25h).
; ==============================================================================================
CRT_SetVect		proc far		; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+49P
					; JoystickCallback_RegisterInChain_3DD45+36P

arg_0		= byte ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ah, 25h	; '%'
		mov	al, [bp+arg_0]
		push	ds
		lds	dx, [bp+arg_2]
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		pop	bp
		retf
CRT_SetVect		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_42F		proc far		; CODE XREF: sub_29B2+48p sub_29B2+70p ...
		pop	cx
		push	cs
		push	cx
		xor	cx, cx
		jmp	short loc_44C
sub_42F		endp

; ���������������������������������������������������������������������������
		pop	cx
		push	cs
		push	cx
		mov	cx, 1
		jmp	short loc_44C

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_LDiv32 (sub_448 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; division longue signée 32-bit logicielle avec gestion signe/arrondi : runtime helper
; ldiv/lxdiv.
; ==============================================================================================
CRT_LDiv32		proc far		; CODE XREF: CRT_Doscan_Core+BBp sub_29B2+35p	...

arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h

		pop	cx
		push	cs
		push	cx
		mov	cx, 2
		jmp	short loc_44C
; ���������������������������������������������������������������������������
		pop	cx
		push	cs
		push	cx
		mov	cx, 3

loc_44C:				; CODE XREF: sub_42F+5j seg000:043Cj ...
		push	bp
		push	si
		push	di
		mov	bp, sp
		mov	di, cx
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		mov	bx, [bp+arg_A]
		mov	cx, [bp+arg_C]
		or	cx, cx
		jnz	short loc_46B

loc_463:				; DATA XREF: sub_2EFEE+6r
		or	dx, dx
		jz	short loc_4D0
		or	bx, bx
		jz	short loc_4D0

loc_46B:				; CODE XREF: CRT_LDiv32+23j
		test	di, 1
		jnz	short loc_48D
		or	dx, dx
		jns	short loc_47F
		neg	dx
		neg	ax
		sbb	dx, 0
		or	di, 0Ch

loc_47F:				; CODE XREF: CRT_LDiv32+35j
		or	cx, cx
		jns	short loc_48D
		neg	cx
		neg	bx
		sbb	cx, 0
		xor	di, 4

loc_48D:				; CODE XREF: CRT_LDiv32+31j CRT_LDiv32+43j
		mov	bp, cx
		mov	cx, 20h	; ' '
		push	di
		xor	di, di
		xor	si, si

loc_497:				; CODE XREF: CRT_LDiv32:loc_4AEj
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_4AE
		ja	short loc_4A9
		cmp	si, bx
		jb	short loc_4AE

loc_4A9:				; CODE XREF: CRT_LDiv32+65j
		sub	si, bx
		sbb	di, bp
		inc	ax

loc_4AE:				; CODE XREF: CRT_LDiv32+63j CRT_LDiv32+69j
		loop	loc_497
		pop	bx
		test	bx, 2
		jz	short loc_4BD
		mov	ax, si
		mov	dx, di
		shr	bx, 1

loc_4BD:				; CODE XREF: CRT_LDiv32+77j
		test	bx, 4
		jz	short loc_4CA
		neg	dx
		neg	ax
		sbb	dx, 0

loc_4CA:				; CODE XREF: CRT_LDiv32+83j CRT_LDiv32+9Dj
		pop	di
		pop	si
		pop	bp
		retf	8
; ���������������������������������������������������������������������������

loc_4D0:				; CODE XREF: CRT_LDiv32+27j CRT_LDiv32+2Bj
		div	bx
		test	di, 2
		jz	short loc_4D9
		xchg	ax, dx

loc_4D9:				; CODE XREF: CRT_LDiv32+98j
		xor	dx, dx
		jmp	short loc_4CA
CRT_LDiv32		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_ClampMathIndex (sub_4E7 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — near — clamp d'un index
; (-48..+87) avec table lookup (4BECh) et flag d'erreur global (word_71C9A) : probable borne
; d'une table math (exp/log).
; ==============================================================================================
CRT_ClampMathIndex		proc near		; CODE XREF: seg000:051Ep CRT_Lseek+23p	...

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jl	short loc_4FD
		cmp	si, 58h	; 'X'
		jle	short loc_4F0

loc_4ED:				; CODE XREF: CRT_ClampMathIndex+25j
		mov	si, 57h	; 'W'

loc_4F0:				; CODE XREF: CRT_ClampMathIndex+Ej
		mov	word_48782, si
		mov	al, [si+5764h]
		cbw
		mov	si, ax
		jmp	short loc_50A
; ���������������������������������������������������������������������������

loc_4FD:				; CODE XREF: CRT_ClampMathIndex+9j
		neg	si
		cmp	si, 30h	; '0'
		jg	short loc_4ED
		mov	word_48782, 0FFFFh

loc_50A:				; CODE XREF: CRT_ClampMathIndex+1Ej
		mov	word_43140, si
		mov	ax, 0FFFFh
		pop	si
		pop	bp
		retn	2
CRT_ClampMathIndex		endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+4]
		push	si
		call	CRT_ClampMathIndex
		mov	ax, si
		pop	si
		pop	bp
		retn	2

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_IsAtty (sub_532 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; isatty() : IOCTL GET DEVICE INFO (INT21 AH=44h), teste bit device (0x80).
; ==============================================================================================
CRT_IsAtty		proc far		; CODE XREF: seg000:07B8p seg000:07F0p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4400h
		mov	bx, [bp+arg_0]
		int	21h		; DOS -	2+ - IOCTL - GET DEVICE	INFORMATION
					; BX = file or device handle
		xchg	ax, dx
		and	ax, 80h
		pop	bp
		retf
CRT_IsAtty		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_NormalizeSign32
; (sub_543 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — normalise le signe d'une paire dx:ax selon le signe d'un second opérande :
; brique de division/modulo signé 32-bit.
; ==============================================================================================
CRT_NormalizeSign32		proc far		; CODE XREF: sub_7D52+3D0P
					; sub_7D52+3E7P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	[bp+arg_2], 0
		jg	short loc_559
		jl	short loc_54A
		cmp	[bp+arg_0], 0
		jnb	short loc_559

loc_54A:				; CODE XREF: CRT_NormalizeSign32+9j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		neg	dx
		neg	ax
		sbb	dx, 0
		jmp	short loc_55F
; ���������������������������������������������������������������������������

loc_559:				; CODE XREF: CRT_NormalizeSign32+7j CRT_NormalizeSign32+Fj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_55F:				; CODE XREF: CRT_NormalizeSign32+1Ej
		pop	bp
		retf
CRT_NormalizeSign32		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Ltoa (sub_56B de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — near —
; conversion entier→chaîne (itoa/ultoa) avec base variable et signe optionnel : runtime C
; _ltoa.
; ==============================================================================================
CRT_Ltoa		proc near		; CODE XREF: seg000:05F4p CRT_Sprintf_Full+216p ...

var_22		= word ptr -22h
arg_0		= byte ptr  4
arg_2		= byte ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		push	es
		mov	di, [bp+arg_6]
		push	ds
		pop	es
		assume es:dseg
		mov	bx, [bp+arg_4]
		cmp	bx, 24h	; '$'
		ja	short loc_5CF
		cmp	bl, 2
		jb	short loc_5CF
		mov	ax, [bp+arg_8]
		mov	cx, [bp+arg_A]
		or	cx, cx
		jge	short loc_597
		cmp	[bp+arg_2], 0
		jz	short loc_597
		mov	byte ptr [di], 2Dh ; '-'
		inc	di
		neg	cx
		neg	ax
		sbb	cx, 0

loc_597:				; CODE XREF: CRT_Ltoa+23j CRT_Ltoa+29j
		lea	si, [bp+var_22]
		jcxz	short loc_5AB

loc_59C:				; CODE XREF: CRT_Ltoa+48j
		xchg	ax, cx
		sub	dx, dx
		div	bx
		xchg	ax, cx
		div	bx
		mov	[si], dl
		inc	si
		jcxz	short loc_5B2
		jmp	short loc_59C
; ���������������������������������������������������������������������������

loc_5AB:				; CODE XREF: CRT_Ltoa+39j CRT_Ltoa+53j
		sub	dx, dx
		div	bx
		mov	[si], dl
		inc	si

loc_5B2:				; CODE XREF: CRT_Ltoa+46j
		or	ax, ax
		jnz	short loc_5AB
		lea	cx, [bp+var_22]
		neg	cx
		add	cx, si
		cld

loc_5BE:				; CODE XREF: CRT_Ltoa+6Cj
		dec	si
		mov	al, [si]
		sub	al, 0Ah
		jnb	short loc_5C9
		add	al, 3Ah	; ':'
		jmp	short loc_5CC
; ���������������������������������������������������������������������������

loc_5C9:				; CODE XREF: CRT_Ltoa+62j
		add	al, [bp+arg_0]

loc_5CC:				; CODE XREF: CRT_Ltoa+66j
		stosb
		loop	loc_5BE

loc_5CF:				; CODE XREF: CRT_Ltoa+14j CRT_Ltoa+19j
		mov	al, 0
		stosb
		pop	es
		assume es:nothing
		mov	ax, [bp+arg_6]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Ch
CRT_Ltoa		endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		push	word ptr [bp+4]
		mov	ax, 0Ah
		push	ax
		mov	al, 0
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	CRT_Ltoa
		pop	bp
		retn	4

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Lseek (sub_605 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far — wrapper lseek() (INT21 AH=42h)
; avec gestion d'erreur via sub_4E7.
; ==============================================================================================
CRT_Lseek		proc far		; CODE XREF: Stdio_WriteTextMode+4Dp seg000:1F89p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		and	word ptr [bx+5738h], 0FDFFh
		mov	ah, 42h	; 'B'
		mov	al, [bp+arg_6]
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method:
					; 0-from beginnig,1-from current,2-from	end
		jb	short loc_61D
		jmp	short loc_622
; ���������������������������������������������������������������������������

loc_61D:				; CODE XREF: CRT_Lseek+1Ej
		push	ax
		call	CRT_ClampMathIndex
		cwd

loc_622:				; CODE XREF: CRT_Lseek+20j
		pop	bp
		retf
CRT_Lseek		endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, word ptr dword_498A4+2
		mov	dx, word ptr dword_498A4
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		mov	word ptr dword_498A4+2,	ax
		mov	word ptr dword_498A4, dx
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		mov	sp, bp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Malloc16_Retry
; (sub_658 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — allocation avec retry sur errno global (dword_72F54), appelle sub_5D22B :
; variante malloc courte 16-bit.
; ==============================================================================================
CRT_Malloc16_Retry		proc far		; CODE XREF: CRT_Doprnt_Dispatch+8Bp seg001:037BP	...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_660
		mov	ax, si
		jmp	short loc_663
; ���������������������������������������������������������������������������

loc_660:				; CODE XREF: CRT_Malloc16_Retry+Cj
		mov	ax, 1

loc_663:				; CODE XREF: CRT_Malloc16_Retry+10j
		mov	si, ax
		jmp	short loc_66B
; ���������������������������������������������������������������������������

loc_667:				; CODE XREF: CRT_Malloc16_Retry+32j
		call	dword_498A4

loc_66B:				; CODE XREF: CRT_Malloc16_Retry+17j
		push	si
		call	Runtime_StackOverflowCheck_2C319
		pop	cx
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_682
		mov	ax, word ptr dword_498A4
		or	ax, word ptr dword_498A4+2
		jnz	short loc_667

loc_682:				; CODE XREF: CRT_Malloc16_Retry+29j
		mov	ax, [bp+var_2]
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc16_Retry		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Malloc32_Retry
; (sub_694 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — variante 32-bit de sub_658 : normalise dx:ax à 1 si zéro, retry sur dword_72F54
; via sub_5D90E.
; ==============================================================================================
CRT_Malloc32_Retry		proc far		; CODE XREF: CRT_Doscan_Core+97p CRT_Doscan_Core+127p	...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_6A0
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	short loc_6A5
; ���������������������������������������������������������������������������

loc_6A0:				; CODE XREF: CRT_Malloc32_Retry+Cj
		xor	dx, dx
		mov	ax, 1

loc_6A5:				; CODE XREF: CRT_Malloc32_Retry+14j
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		jmp	short loc_6B1
; ���������������������������������������������������������������������������

loc_6AD:				; CODE XREF: CRT_Malloc32_Retry+45j
		call	dword_498A4

loc_6B1:				; CODE XREF: CRT_Malloc32_Retry+21j
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	PagedResourceB_Read_2C9FC
		pop	cx
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jnz	short loc_6D1
		mov	ax, word ptr dword_498A4
		or	ax, word ptr dword_498A4+2
		jnz	short loc_6AD

loc_6D1:				; CODE XREF: CRT_Malloc32_Retry+3Cj
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc32_Retry		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MulExtended32
; (sub_6E5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — multiplication étendue 16x16→32 avec accumulation croisée (ax*bx+cx*si) :
; helper mul 32-bit.
; ==============================================================================================
CRT_MulExtended32		proc near		; CODE XREF: CRT_Rand+Ep CRT_Doscan_Core+84p ...
		push	si
		xchg	ax, si
		xchg	ax, dx
		test	ax, ax
		jz	short loc_6E4
		mul	bx

loc_6E4:				; CODE XREF: CRT_MulExtended32+5j
		jcxz	short loc_6EB
		xchg	ax, cx
		mul	si
		add	ax, cx

loc_6EB:				; CODE XREF: CRT_MulExtended32:loc_6E4j
		xchg	ax, si
		mul	bx
		add	dx, si
		pop	si
		retn
CRT_MulExtended32		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6F2		proc far		; CODE XREF: sub_6B9C0+33BAP
					; sub_98210+2997P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_487E0, 0
		mov	word_487DE, ax
		pop	bp
		retf
sub_6F2		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Rand (sub_70D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; générateur pseudo-aléatoire congruentiel linéaire (constantes 4E35h/1, seed 32-bit
; word_71CF6/71CF8) : runtime rand().
; ==============================================================================================
CRT_Rand		proc far		; CODE XREF: seg014:0BE7P seg014:1DE6P ...
		mov	cx, word_487E0
		mov	bx, word_487DE
		mov	dx, 15Ah
		mov	ax, 4E35h
		call	CRT_MulExtended32
		add	ax, 1
		adc	dx, 0
		mov	word_487E0, dx
		mov	word_487DE, ax
		mov	ax, word_487E0
		cwd
		and	ax, 7FFFh
		retf
CRT_Rand		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Unlink (sub_733 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper unlink() (INT21 AH=41h) avec gestion erreur via sub_4E7.
; ==============================================================================================
CRT_Unlink		proc far		; CODE XREF: sub_BEFD9+C4P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 41h	; 'A'
		mov	dx, [bp+arg_0]
		int	21h		; DOS -	2+ - DELETE A FILE (UNLINK)
					; DS:DX	-> ASCIZ pathname of file to delete (no	wildcards allowed)
		jb	short loc_739
		xor	ax, ax
		jmp	short loc_73D
; ���������������������������������������������������������������������������

loc_739:				; CODE XREF: CRT_Unlink+Aj
		push	ax
		call	CRT_ClampMathIndex

loc_73D:				; CODE XREF: CRT_Unlink+Ej
		pop	bp
		retf
CRT_Unlink		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_SetjmpSave (sub_D8E
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — sauvegarde ES/IP/SS/DS dans une structure : probable setjmp().
; ==============================================================================================
CRT_SetjmpSave		proc far		; CODE XREF: CRT_InstallProtectedHandler+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], es
		mov	ax, [bp+4]
		mov	[si+2],	ax
		mov	word ptr [si+4], ss
		mov	word ptr [si+6], ds
		pop	si
		pop	bp
		retf
CRT_SetjmpSave		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_757		proc far		; CODE XREF: seg000:0846p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ah, 2Bh	; '+'
		mov	si, [bp+arg_0]
		mov	cx, [si]
		mov	dx, [si+2]
		int	21h		; DOS -	SET CURRENT DATE
					; DL = day, DH = month,	CX = year
					; Return: AL = 00h if no error /= FFh if bad value sent	to routine
		pop	si
		pop	bp
		retf
sub_757		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_76A		proc far		; CODE XREF: seg000:0850p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ah, 2Dh	; '-'
		mov	si, [bp+arg_0]
		mov	cx, [si]
		mov	dx, [si+2]
		int	21h		; DOS -	SET CURRENT TIME
					; CH = hours, CL = minutes, DH = seconds, DL = hundredths of seconds
					; Return: AL = 00h if no error / = FFh if bad value sent to routine
		pop	si
		pop	bp
		retf
sub_76A		endp

; ���������������������������������������������������������������������������
		mov	dx, 5
		cmp	dx, word_48756
		jnb	short loc_7B1

loc_786:				; CODE XREF: seg000:07AFj
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+5738h], 0
		mov	bx, dx
		mov	cl, 4
		shl	bx, cl
		mov	byte ptr [bx+55FAh], 0FFh
		mov	ax, dx
		shl	ax, cl
		add	ax, 55F6h
		mov	bx, dx
		shl	bx, cl
		mov	[bx+5604h], ax
		inc	dx
		cmp	dx, word_48756
		jb	short loc_786

loc_7B1:				; CODE XREF: seg000:0784j
		mov	al, byte_4861A
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_7C6
		and	word_48618, 0FDFFh

loc_7C6:				; CODE XREF: seg000:07BEj
		mov	ax, 200h
		push	ax
		test	word_48618, 200h
		jz	short loc_7D7
		mov	ax, 1
		jmp	short loc_7D9
; ���������������������������������������������������������������������������

loc_7D7:				; CODE XREF: seg000:07D0j
		xor	ax, ax

loc_7D9:				; CODE XREF: seg000:07D5j
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 55F6h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		mov	al, byte_4862A
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_7FE
		and	word_48628, 0FDFFh

loc_7FE:				; CODE XREF: seg000:07F6j
		mov	ax, 200h
		push	ax
		test	word_48628, 200h
		jz	short loc_80F
		mov	ax, 2
		jmp	short loc_811
; ���������������������������������������������������������������������������

loc_80F:				; CODE XREF: seg000:0808j
		xor	ax, ax

loc_811:				; CODE XREF: seg000:080Dj
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 5606h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		retn
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-4]
		push	ax
		mov	bx, [bp+6]
		push	word ptr [bx+2]
		push	word ptr [bx]
		nop
		push	cs
		call	near ptr sub_29B2
		add	sp, 8
		lea	ax, [bp-4]
		push	ax
		nop
		push	cs
		call	near ptr sub_757
		pop	cx
		lea	ax, [bp-8]
		push	ax
		nop
		push	cs
		call	near ptr sub_76A
		pop	cx
		xor	ax, ax
		mov	sp, bp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_85A		proc far		; CODE XREF: sub_6B9C0+33B1P
					; sub_98210+298EP

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_3E9
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_3FC
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_2899
		pop	cx
		pop	cx
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	si, si
		jz	short loc_89C
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		mov	[si+2],	ax
		mov	[si], dx

loc_89C:				; CODE XREF: sub_85A+35j
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_85A		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_CtypeLookup (sub_E4B de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — table lookup type de
; caractère (table 4971h), cas spécial 0xFFFF : ctype-like classification/toupper-tolower.
; ==============================================================================================
CRT_CtypeLookup		proc far		; CODE XREF: seg017:001AP
					; sub_4A239+CFP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	dx, 0FFFFh
		jnz	short loc_8B7
		mov	ax, 0FFFFh
		jmp	short loc_8D1
; ���������������������������������������������������������������������������

loc_8B7:				; CODE XREF: CRT_CtypeLookup+9j
		mov	al, dl
		mov	ah, 0
		mov	bx, ax
		test	byte ptr [bx+54E9h], 8
		jz	short loc_8CD
		mov	al, dl
		mov	ah, 0
		add	ax, 0FFE0h
		jmp	short loc_8D1
; ���������������������������������������������������������������������������

loc_8CD:				; CODE XREF: CRT_CtypeLookup+1Bj
		mov	al, dl
		mov	ah, 0

loc_8D1:				; CODE XREF: CRT_CtypeLookup+Ej CRT_CtypeLookup+24j
		pop	bp
		retf
CRT_CtypeLookup		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Doprnt_Core
; (sub_E77 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — 299 lignes, moteur vprintf/_doprnt (gestion varargs 2/4 octets selon flag),
; cœur du formatteur d'impression bas niveau.
; ==============================================================================================
CRT_Doprnt_Core		proc far		; CODE XREF: sub_28EDF+35P
					; sub_28EDF+50P ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	[bp+var_8], 1
		cmp	[bp+arg_0], 0
		jnz	short loc_8E9
		jmp	loc_A7F
; ���������������������������������������������������������������������������

loc_8E9:				; CODE XREF: CRT_Doprnt_Core+11j
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		test	[bp+arg_6], 1
		jz	short loc_913
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_926
		jmp	short loc_921
; ���������������������������������������������������������������������������

loc_913:				; CODE XREF: CRT_Doprnt_Core+21j
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_926

loc_921:				; CODE XREF: CRT_Doprnt_Core+3Ej
		mov	[bp+var_8], 0

loc_926:				; CODE XREF: CRT_Doprnt_Core+3Cj CRT_Doprnt_Core+4Cj
		test	[bp+arg_6], 10h
		jz	short loc_936
		mov	bx, [bp+arg_0]
		mov	ax, [bx-2]
		mov	[bp+arg_4], ax

loc_936:				; CODE XREF: CRT_Doprnt_Core+58j
		cmp	[bp+var_8], 0
		jnz	short loc_93F
		jmp	loc_A5F
; ���������������������������������������������������������������������������

loc_93F:				; CODE XREF: CRT_Doprnt_Core+67j
		mov	ax, [bp+arg_6]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_954
		and	[bp+var_C], 0FEFFh

loc_954:				; CODE XREF: CRT_Doprnt_Core+7Aj
		mov	ax, [bp+arg_4]
		dec	ax
		imul	[bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, ax
		mov	[bp+var_E], dx
		jmp	loc_A52
; ���������������������������������������������������������������������������

loc_966:				; CODE XREF: CRT_Doprnt_Core+189j
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h		; switch 16 cases
		mov	bx, offset word_A85

loc_972:				; CODE XREF: CRT_Doprnt_Core+AAj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_982
		add	bx, 2
		loop	loc_972
		jmp	loc_A47		; default
; ���������������������������������������������������������������������������

loc_982:				; CODE XREF: CRT_Doprnt_Core+A5j
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_986:				; DATA XREF: seg000:0AA5o
		mov	ax, 2		; case 0x0
		push	ax
		push	[bp+var_E]
		call	di

loc_98F:				; CODE XREF: CRT_Doprnt_Core+CBj
		pop	cx
		pop	cx
		jmp	loc_A4C
; ���������������������������������������������������������������������������

loc_994:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		mov	ax, 2		; case 0x1
		push	ax
		push	[bp+var_E]
		call	[bp+var_6]
		jmp	short loc_98F
; ���������������������������������������������������������������������������

loc_9A0:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	[bp+var_E]	; case 0x2
		mov	ax, 2
		push	ax
		call	di
		jmp	loc_A4C
; ���������������������������������������������������������������������������

loc_9AC:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		mov	ax, 2		; case 0x102
		push	ax
		push	[bp+var_E]
		call	di
		jmp	loc_A4C
; ���������������������������������������������������������������������������

loc_9B8:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	[bp+var_E]	; case 0x3
		mov	ax, 2
		push	ax
		call	[bp+var_6]
		jmp	loc_A4C
; ���������������������������������������������������������������������������

loc_9C5:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		mov	ax, 2		; case 0x103
		push	ax
		push	[bp+var_E]
		call	[bp+var_6]
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_9D1:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		mov	ax, 2		; case 0x20
		mov	bx, [bp+var_E]
		jmp	short loc_9DF
; ���������������������������������������������������������������������������

loc_9D9:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		mov	bx, [bp+var_E]	; case 0x120
		mov	ax, 2

loc_9DF:				; CODE XREF: CRT_Doprnt_Core+104j
		call	di
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_9E3:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		mov	ax, 2		; case 0x21
		mov	bx, [bp+var_E]
		jmp	short loc_9F1
; ���������������������������������������������������������������������������

loc_9EB:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		mov	bx, [bp+var_E]	; case 0x121
		mov	ax, 2

loc_9F1:				; CODE XREF: CRT_Doprnt_Core+116j
		call	[bp+var_6]
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_9F6:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	si		; case 0x80
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_A04:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	si		; case 0x81
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	[bp+var_6]
		pop	cx
		pop	si
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_A13:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	si		; case 0x82
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_A20:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	si		; case 0x83
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	[bp+var_6]
		pop	si
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_A2E:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	si		; case 0xA0
		mov	si, [bp+var_E]
		mov	ax, 2
		call	di
		pop	si
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_A3A:				; CODE XREF: CRT_Doprnt_Core:loc_982j
					; DATA XREF: seg000:0AA5o
		push	si		; case 0xA1
		mov	si, [bp+var_E]
		mov	ax, 2
		call	[bp+var_6]
		pop	si
		jmp	short loc_A4C
; ���������������������������������������������������������������������������

loc_A47:				; CODE XREF: CRT_Doprnt_Core+ACj
		nop			; default
		push	cs
		call	loc_2B1

loc_A4C:				; CODE XREF: CRT_Doprnt_Core+BEj CRT_Doprnt_Core+D6j ...
		mov	ax, [bp+arg_2]
		sub	[bp+var_E], ax

loc_A52:				; CODE XREF: CRT_Doprnt_Core+90j
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_A5F
		jmp	loc_966
; ���������������������������������������������������������������������������

loc_A5F:				; CODE XREF: CRT_Doprnt_Core+69j CRT_Doprnt_Core+187j
		test	[bp+arg_6], 8
		jz	short loc_A7F
		test	[bp+arg_6], 10h
		jz	short loc_A76
		mov	ax, [bp+arg_0]
		add	ax, 0FFFEh
		mov	[bp+arg_0], ax

loc_A76:				; CODE XREF: CRT_Doprnt_Core+198j
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_308
		pop	cx

loc_A7F:				; CODE XREF: CRT_Doprnt_Core+13j CRT_Doprnt_Core+191j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Core		endp

; ���������������������������������������������������������������������������
word_A85	dw	0,     1,     2,     3 ; DATA XREF: CRT_Doprnt_Core+9Co
		dw    20h,   21h,   80h,   81h ; value table for switch	statement
		dw    82h,   83h,  0A0h,  0A1h
		dw   102h,  103h,  120h,  121h
		dw offset loc_986	; jump table for switch	statement
		dw offset loc_994
		dw offset loc_9A0
		dw offset loc_9B8
		dw offset loc_9D1
		dw offset loc_9E3
		dw offset loc_9F6
		dw offset loc_A04
		dw offset loc_A13
		dw offset loc_A20
		dw offset loc_A2E
		dw offset loc_A3A
		dw offset loc_9AC
		dw offset loc_9C5
		dw offset loc_9D9
		dw offset loc_9EB

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Doscan_Core
; (sub_2EC9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — 380 lignes, moteur scanf/_doscan : switch 16 cas (codes 0x4-0x87/0xA4-0xA5)
; dispatchant les spécificateurs de format via callbacks [bp+var_4]/[bp+var_8], gestion
; near/far/pointeurs lointains : cœur de sscanf/fscanf.
; ==============================================================================================
CRT_Doscan_Core		proc far		; CODE XREF: sub_C0550+416P
					; sub_C0550+437P ...

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	di, [bp+arg_A]
		mov	[bp+var_A], 1
		lea	ax, [bp+arg_C]
		mov	[bp+var_2], ax
		test	di, 1
		jz	short loc_AFE
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_B16
		jmp	short loc_B11
; ���������������������������������������������������������������������������

loc_AFE:				; CODE XREF: CRT_Doscan_Core+1Aj
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_B16

loc_B11:				; CODE XREF: CRT_Doscan_Core+37j
		mov	[bp+var_A], 0

loc_B16:				; CODE XREF: CRT_Doscan_Core+35j CRT_Doscan_Core+4Aj
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_B21
		jmp	loc_C19
; ���������������������������������������������������������������������������

loc_B21:				; CODE XREF: CRT_Doscan_Core+57j
		mov	word ptr [bp+var_10], 0
		test	di, 10h
		jz	short loc_B31
		mov	word ptr [bp+var_10], 4

loc_B31:				; CODE XREF: CRT_Doscan_Core+65j
		test	di, 40h
		jnz	short loc_B3A
		jmp	loc_BBA
; ���������������������������������������������������������������������������

loc_B3A:				; CODE XREF: CRT_Doscan_Core+70j
		add	word ptr [bp+var_10], 2
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	CRT_MulExtended32
		add	ax, word ptr [bp+var_10]
		adc	dx, 0
		add	ax, [bp+arg_4]
		adc	dx, 0
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr CRT_Malloc32_Retry
		pop	cx
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, word ptr [bp+arg_0+2]
		jnz	short loc_B73

loc_B6C:				; CODE XREF: CRT_Doscan_Core+115j CRT_Doscan_Core+11Dj ...
		xor	dx, dx
		xor	ax, ax
		jmp	loc_D11
; ���������������������������������������������������������������������������

loc_B73:				; CODE XREF: CRT_Doscan_Core+A5j
		xor	ax, ax
		push	ax
		push	[bp+arg_4]
		mov	ax, 1
		xor	dx, dx
		push	ax
		push	dx
		call	near ptr CRT_LDiv32
		mov	[bp+var_12], ax
		mov	ax, word ptr [bp+arg_0]
		mov	word ptr [bp+var_10+2],	ax
		jmp	short loc_B94
; ���������������������������������������������������������������������������

loc_B8E:				; CODE XREF: CRT_Doscan_Core+D8j
		mov	ax, [bp+arg_4]
		add	[bp+var_12], ax

loc_B94:				; CODE XREF: CRT_Doscan_Core+C7j
		mov	ax, word ptr [bp+var_10]
		add	ax, word ptr [bp+var_10+2]
		cmp	ax, [bp+var_12]
		ja	short loc_B8E
		mov	ax, [bp+var_12]
		sub	ax, word ptr [bp+var_10+2]
		sub	ax, word ptr [bp+var_10]
		add	word ptr [bp+arg_0], ax
		les	bx, [bp+arg_0]
		mov	ax, word ptr [bp+var_10+2]
		mov	es:[bx], ax
		add	word ptr [bp+arg_0], 2
		jmp	short loc_BFF
; ���������������������������������������������������������������������������

loc_BBA:				; CODE XREF: CRT_Doscan_Core+72j
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	CRT_MulExtended32
		add	ax, word ptr [bp+var_10]
		adc	dx, 0
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		cmp	[bp+var_14], 0
		jb	short loc_BE4
		ja	short loc_B6C
		cmp	[bp+var_16], 0FFFFh
		jbe	short loc_BE4
		jmp	short loc_B6C
; ���������������������������������������������������������������������������

loc_BE4:				; CODE XREF: CRT_Doscan_Core+113j CRT_Doscan_Core+11Bj
		push	[bp+var_14]
		push	[bp+var_16]
		nop
		push	cs
		call	near ptr CRT_Malloc32_Retry
		pop	cx
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, word ptr [bp+arg_0+2]
		jnz	short loc_BFF
		jmp	loc_B6C
; ���������������������������������������������������������������������������

loc_BFF:				; CODE XREF: CRT_Doscan_Core+F3j CRT_Doscan_Core+135j
		test	di, 10h
		jz	short loc_C19
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		add	word ptr [bp+arg_0], 4

loc_C19:				; CODE XREF: CRT_Doscan_Core+59j CRT_Doscan_Core+13Ej
		and	di, 1A7h
		test	di, 80h
		jz	short loc_C27
		and	di, 0FEFFh

loc_C27:				; CODE XREF: CRT_Doscan_Core+15Cj
		cmp	[bp+var_A], 0
		jnz	short loc_C30
		jmp	loc_D0B
; ���������������������������������������������������������������������������

loc_C30:				; CODE XREF: CRT_Doscan_Core+166j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		jmp	loc_CED
; ���������������������������������������������������������������������������

loc_C3F:				; CODE XREF: CRT_Doscan_Core+23Aj CRT_Doscan_Core+243j
		mov	[bp+var_C], di
		mov	cx, 10h		; switch 16 cases
		mov	bx, offset word_D17

loc_C48:				; CODE XREF: CRT_Doscan_Core+18Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_C57
		add	bx, 2
		loop	loc_C48
		jmp	short loc_CD5	; default
; ���������������������������������������������������������������������������

loc_C57:				; CODE XREF: CRT_Doscan_Core+189j
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_C5B:				; DATA XREF: seg000:0D37o
		push	word ptr [bp+var_10+2] ; case 0x4
		push	word ptr [bp+var_10]
		call	[bp+var_4]

loc_C64:				; CODE XREF: CRT_Doscan_Core+1ACj
		pop	cx
		pop	cx
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_C68:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		push	word ptr [bp+var_10+2] ; case 0x5
		push	word ptr [bp+var_10]
		call	[bp+var_8]
		jmp	short loc_C64
; ���������������������������������������������������������������������������

loc_C73:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; CRT_Doscan_Core:loc_C80j
					; DATA XREF: ...
		push	word ptr [bp+var_10+2] ; case 0x6
		push	word ptr [bp+var_10]
		call	[bp+var_4]
		jmp	short loc_C8B
; ���������������������������������������������������������������������������

loc_C7E:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		jmp	short loc_C82	; case 0x7
; ���������������������������������������������������������������������������

loc_C80:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		jmp	short loc_C73	; case 0x24
; ���������������������������������������������������������������������������

loc_C82:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; CRT_Doscan_Core:loc_C7Ej
					; DATA XREF: ...
		push	word ptr [bp+var_10+2] ; case 0x25
		push	word ptr [bp+var_10]
		call	[bp+var_8]

loc_C8B:				; CODE XREF: CRT_Doscan_Core+1B7j
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_C8D:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		push	ds		; case 0x84
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_C99:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		push	ds		; case 0x85
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_CA5:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		push	ds		; case 0x86
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_CB1:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		push	ds		; case 0x87
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_CBD:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		push	ds		; case 0xA4
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_CC9:				; CODE XREF: CRT_Doscan_Core:loc_C57j
					; DATA XREF: seg000:0D37o
		push	ds		; case 0xA5
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_CDA
; ���������������������������������������������������������������������������

loc_CD5:				; CODE XREF: CRT_Doscan_Core+190j
		nop			; default
		push	cs
		call	loc_2B1

loc_CDA:				; CODE XREF: CRT_Doscan_Core+1A1j
					; CRT_Doscan_Core:loc_C8Bj ...
		mov	ax, [bp+arg_4]
		xor	dx, dx
		add	word ptr [bp+var_10], ax
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	word ptr [bp+var_10+2],	dx

loc_CED:				; CODE XREF: CRT_Doscan_Core+177j
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_D02
		jmp	loc_C3F
; ���������������������������������������������������������������������������

loc_D02:				; CODE XREF: CRT_Doscan_Core+238j
		jnz	short loc_D0B
		or	ax, ax
		jbe	short loc_D0B
		jmp	loc_C3F
; ���������������������������������������������������������������������������

loc_D0B:				; CODE XREF: CRT_Doscan_Core+168j
					; CRT_Doscan_Core:loc_D02j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_D11:				; CODE XREF: CRT_Doscan_Core+ABj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doscan_Core		endp

; ���������������������������������������������������������������������������
word_D17	dw	4,     5,     6,     7 ; DATA XREF: CRT_Doscan_Core+180o
		dw    24h,   25h,   84h,   85h ; value table for switch	statement
		dw    86h,   87h,  0A4h,  0A5h
		dw   106h,  107h,  124h,  125h
		dw offset loc_C5B	; jump table for switch	statement
		dw offset loc_C68
		dw offset loc_C73
		dw offset loc_C7E
		dw offset loc_C80
		dw offset loc_C82
		dw offset loc_C8D
		dw offset loc_C99
		dw offset loc_CA5
		dw offset loc_CB1
		dw offset loc_CBD
		dw offset loc_CC9
		dw offset loc_C73
		dw offset loc_C7E
		dw offset loc_C80
		dw offset loc_C82

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Doprnt_Dispatch
; (sub_1069 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — 257 lignes, gros switch (cases 0x81-0xA1) dispatchant sur spécificateurs de
; format via callbacks [bp+var_4]/[bp+var_8] : moteur _doprnt (dispatch %d/%s/%x/%ld etc,
; variantes near/far).
; ==============================================================================================
CRT_Doprnt_Dispatch		proc far		; CODE XREF: seg001:0305P seg001:031CP ...

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_A], 1
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		test	[bp+arg_6], 1
		jz	short loc_D91
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_DA9
		jmp	short loc_DA4
; ���������������������������������������������������������������������������

loc_D91:				; CODE XREF: CRT_Doprnt_Dispatch+1Bj
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_DA9

loc_DA4:				; CODE XREF: CRT_Doprnt_Dispatch+38j
		mov	[bp+var_A], 0

loc_DA9:				; CODE XREF: CRT_Doprnt_Dispatch+36j CRT_Doprnt_Dispatch+4Bj
		or	di, di
		jnz	short loc_DFD
		mov	ax, [bp+arg_2]
		imul	[bp+arg_4]
		mov	[bp+var_E], 0
		mov	[bp+var_10], ax
		test	[bp+arg_6], 10h
		jz	short loc_DCA
		add	[bp+var_10], 2
		adc	[bp+var_E], 0

loc_DCA:				; CODE XREF: CRT_Doprnt_Dispatch+69j
		cmp	[bp+var_E], 0
		jb	short loc_DDD
		ja	short loc_DD8
		cmp	[bp+var_10], 0FFFFh
		jbe	short loc_DDD

loc_DD8:				; CODE XREF: CRT_Doprnt_Dispatch+79j CRT_Doprnt_Dispatch+95j
		xor	ax, ax
		jmp	loc_EC3
; ���������������������������������������������������������������������������

loc_DDD:				; CODE XREF: CRT_Doprnt_Dispatch+77j CRT_Doprnt_Dispatch+7Fj
		push	[bp+var_10]
		nop
		push	cs
		call	near ptr CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_DEE
		jmp	short loc_DD8
; ���������������������������������������������������������������������������

loc_DEE:				; CODE XREF: CRT_Doprnt_Dispatch+93j
		test	[bp+arg_6], 10h
		jz	short loc_DFD
		mov	ax, [bp+arg_4]
		mov	[di], ax
		add	di, 2

loc_DFD:				; CODE XREF: CRT_Doprnt_Dispatch+54j CRT_Doprnt_Dispatch+9Cj
		and	[bp+arg_6], 1A7h
		test	[bp+arg_6], 80h
		jz	short loc_E0E
		and	[bp+arg_6], 0FEFFh

loc_E0E:				; CODE XREF: CRT_Doprnt_Dispatch+B0j
		cmp	[bp+var_A], 0
		jnz	short loc_E17
		jmp	loc_EC1
; ���������������������������������������������������������������������������

loc_E17:				; CODE XREF: CRT_Doprnt_Dispatch+BBj
		mov	[bp+var_E], di
		jmp	loc_EB4
; ���������������������������������������������������������������������������

loc_E1D:				; CODE XREF: CRT_Doprnt_Dispatch+167j
		mov	ax, [bp+arg_6]
		mov	[bp+var_C], ax
		mov	cx, 10h		; switch 16 cases
		mov	bx, offset word_EC9

loc_E29:				; CODE XREF: CRT_Doprnt_Dispatch+DDj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_E38
		add	bx, 2
		loop	loc_E29
		jmp	short loc_EA9	; default
; ���������������������������������������������������������������������������

loc_E38:				; CODE XREF: CRT_Doprnt_Dispatch+D8j
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_E3C:				; DATA XREF: seg000:0EE9o
		push	[bp+var_E]	; case 0x0
		call	[bp+var_4]

loc_E42:				; CODE XREF: CRT_Doprnt_Dispatch+F4j
		pop	cx
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E45:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	[bp+var_E]	; case 0x1
		call	[bp+var_8]
		jmp	short loc_E42
; ���������������������������������������������������������������������������

loc_E4D:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	[bp+var_E]	; case 0x2
		call	[bp+var_4]
		jmp	short loc_E5B
; ���������������������������������������������������������������������������

loc_E55:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	[bp+var_E]	; case 0x3
		call	[bp+var_8]

loc_E5B:				; CODE XREF: CRT_Doprnt_Dispatch+FCj
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E5D:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		mov	bx, [bp+var_E]	; case 0x20
		call	[bp+var_4]
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E65:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		mov	bx, [bp+var_E]	; case 0x21
		call	[bp+var_8]
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E6D:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	si		; case 0x80
		mov	si, [bp+var_E]
		call	[bp+var_4]
		pop	si
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E77:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	si		; case 0x81
		mov	si, [bp+var_E]
		call	[bp+var_8]
		pop	si
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E81:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	si		; case 0x82
		mov	si, [bp+var_E]
		call	[bp+var_4]
		pop	si
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E8B:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	si		; case 0x83
		mov	si, [bp+var_E]
		call	[bp+var_8]
		pop	si
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E95:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	si		; case 0xA0
		mov	si, [bp+var_E]
		call	[bp+var_4]
		pop	si
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_E9F:				; CODE XREF: CRT_Doprnt_Dispatch:loc_E38j
					; DATA XREF: seg000:0EE9o
		push	si		; case 0xA1
		mov	si, [bp+var_E]
		call	[bp+var_8]
		pop	si
		jmp	short loc_EAE
; ���������������������������������������������������������������������������

loc_EA9:				; CODE XREF: CRT_Doprnt_Dispatch+DFj
		nop			; default
		push	cs
		call	loc_2B1

loc_EAE:				; CODE XREF: CRT_Doprnt_Dispatch+ECj
					; CRT_Doprnt_Dispatch:loc_E5Bj ...
		mov	ax, [bp+arg_2]
		add	[bp+var_E], ax

loc_EB4:				; CODE XREF: CRT_Doprnt_Dispatch+C3j
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_EC1
		jmp	loc_E1D
; ���������������������������������������������������������������������������

loc_EC1:				; CODE XREF: CRT_Doprnt_Dispatch+BDj CRT_Doprnt_Dispatch+165j
		mov	ax, di

loc_EC3:				; CODE XREF: CRT_Doprnt_Dispatch+83j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Dispatch		endp

; ���������������������������������������������������������������������������
word_EC9	dw	0,     1,     2,     3 ; DATA XREF: CRT_Doprnt_Dispatch+CFo
		dw    20h,   21h,   80h,   81h ; value table for switch	statement
		dw    82h,   83h,  0A0h,  0A1h
		dw   102h,  103h,  120h,  121h
		dw offset loc_E3C	; jump table for switch	statement
		dw offset loc_E45
		dw offset loc_E4D
		dw offset loc_E55
		dw offset loc_E5D
		dw offset loc_E65
		dw offset loc_E6D
		dw offset loc_E77
		dw offset loc_E81
		dw offset loc_E8B
		dw offset loc_E95
		dw offset loc_E9F
		dw offset loc_E4D
		dw offset loc_E55
		dw offset loc_E5D
		dw offset loc_E65

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_F09		proc near		; CODE XREF: CRT_Sprintf_Full+24Dp CRT_Sprintf_Full+256p
		mov	al, dh
		call	sub_F10
		mov	al, dl
sub_F09		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_F10		proc near		; CODE XREF: sub_F09+2p
		aam	10h
		xchg	ah, al
		call	CRT_EmitHexDigit
		xchg	ah, al
sub_F10		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_EmitHexDigit
; (sub_122B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — ajuste en BCD (daa x2) et stocke le caractère (stosb) : émission d'un digit
; hexadécimal ASCII.
; ==============================================================================================
CRT_EmitHexDigit		proc near		; CODE XREF: sub_F10+4p
		add	al, 90h	; '�'
		daa
		adc	al, 40h	; '@'
		daa
		stosb
		retn
CRT_EmitHexDigit		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Sprintf_Full
; (sub_1233 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — 150+ octets de buffer local, multi-chunks : implémentation complète sprintf()
; (utilise sub_1263/sub_124D/sub_125A/off_6D0BA).
; ==============================================================================================
CRT_Sprintf_Full		proc near		; CODE XREF: CRT_Msg_NullPtrAssign+12p CRT_Msg_Sprintf1+18p ...

var_96		= word ptr -96h
var_45		= word ptr -45h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

; FUNCTION CHUNK AT 0F81 SIZE 00000423 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	[bp+var_12], 0
		mov	[bp+var_14], 50h ; 'P'
		mov	[bp+var_16], 0
		jmp	short loc_F81
CRT_Sprintf_Full		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strlen_ScasB
; (sub_124D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — strlen via repne scasb.
; ==============================================================================================
CRT_Strlen_ScasB		proc near		; CODE XREF: CRT_Sprintf_Full:loc_11E8p
					; CRT_Sprintf_Full:loc_1246p ...
		push	di
		mov	cx, 0FFFFh
		xor	al, al
		repne scasb
		not	cx
		dec	cx
		pop	di
		retn
CRT_Strlen_ScasB		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_F48		proc near		; CODE XREF: CRT_Sprintf_Full+3ABp CRT_Sprintf_Full+3BCp ...
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jnz	short locret_F80
sub_F48		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_FlushSprintfBuf
; (sub_1263 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — flush d'un buffer intermédiaire vers la sortie via callback (off_6D0BA) :
; helper de sub_1233.
; ==============================================================================================
CRT_FlushSprintfBuf		proc near		; CODE XREF: CRT_Sprintf_Full+81p CRT_Sprintf_Full+402p	...
		push	bx
		push	cx
		push	dx
		push	es
		lea	ax, [bp-96h]
		sub	di, ax
		lea	ax, [bp-96h]
		push	ax
		push	di
		push	word ptr [bp+8]
		call	off_4302A[bp]
		or	ax, ax
		jnz	short loc_F70
		mov	word ptr [bp-16h], 1

loc_F70:				; CODE XREF: CRT_FlushSprintfBuf+18j
		mov	word ptr [bp-14h], 50h ; 'P'
		add	[bp-12h], di
		lea	di, [bp-96h]
		pop	es
		pop	dx
		pop	cx
		pop	bx

locret_F80:				; CODE XREF: sub_F48+7j
		retn
CRT_FlushSprintfBuf		endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Sprintf_Full

loc_F81:				; CODE XREF: CRT_Sprintf_Full+18j
		push	es
		cld
		lea	di, [bp+var_96]
		mov	[bp+var_4], di

loc_F8A:				; CODE XREF: CRT_Sprintf_Full:loc_1371j
		mov	di, [bp+var_4]

loc_F8D:				; CODE XREF: CRT_Sprintf_Full:loc_1335j
		mov	si, [bp+arg_2]

loc_F90:				; CODE XREF: CRT_Sprintf_Full+7Fj CRT_Sprintf_Full+84j
		lodsb
		or	al, al
		jz	short loc_FA7
		cmp	al, 25h	; '%'
		jz	short loc_FAA

loc_F99:				; CODE XREF: CRT_Sprintf_Full+8Fj
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp+var_14]
		jg	short loc_F90
		call	CRT_FlushSprintfBuf
		jmp	short loc_F90
; ���������������������������������������������������������������������������

loc_FA7:				; CODE XREF: CRT_Sprintf_Full+72j
		jmp	loc_1384
; ���������������������������������������������������������������������������

loc_FAA:				; CODE XREF: CRT_Sprintf_Full+76j
		mov	[bp+var_10], si
		lodsb
		cmp	al, 25h	; '%'
		jz	short loc_F99
		mov	[bp+var_4], di
		xor	cx, cx
		mov	[bp+var_E], cx
		mov	[bp+var_2], cx
		mov	[bp+var_B], cl
		mov	[bp+var_8], 0FFFFh
		mov	[bp+var_A], 0FFFFh
		jmp	short loc_FCD
; ���������������������������������������������������������������������������

loc_FCC:				; CODE XREF: CRT_Sprintf_Full+D9j CRT_Sprintf_Full+E4j ...
		lodsb

loc_FCD:				; CODE XREF: CRT_Sprintf_Full+A9j
		xor	ah, ah
		mov	dx, ax
		mov	bx, ax
		sub	bl, 20h	; ' '
		cmp	bl, 60h	; '`'
		jnb	short loc_FEE
		mov	bl, [bx+57C9h]
		cmp	bx, 17h		; switch 24 cases
		jbe	short loc_FE7
		jmp	loc_1374	; default
; ���������������������������������������������������������������������������

loc_FE7:				; CODE XREF: CRT_Sprintf_Full+C1j
		shl	bx, 1
		jmp	cs:off_13A4[bx]	; switch jump
; ���������������������������������������������������������������������������

loc_FEE:				; CODE XREF: CRT_Sprintf_Full+B8j CRT_Sprintf_Full+D3j ...
		jmp	loc_1374	; default
; ���������������������������������������������������������������������������

loc_FF1:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		cmp	ch, 0		; case 0x1
		ja	short loc_FEE
		or	[bp+var_2], 1
		jmp	short loc_FCC
; ���������������������������������������������������������������������������

loc_FFC:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		cmp	ch, 0		; case 0x3
		ja	short loc_FEE
		or	[bp+var_2], 2
		jmp	short loc_FCC
; ���������������������������������������������������������������������������

loc_1007:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		cmp	ch, 0		; case 0x0
		ja	short loc_FEE
		cmp	[bp+var_B], 2Bh	; '+'
		jz	short loc_1015
		mov	[bp+var_B], dl

loc_1015:				; CODE XREF: CRT_Sprintf_Full+EFj
		jmp	short loc_FCC
; ���������������������������������������������������������������������������

loc_1017:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		and	[bp+var_2], 0FFDFh ; case 0x16
		jmp	short loc_1021
; ���������������������������������������������������������������������������

loc_101D:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		or	[bp+var_2], 20h	; case 0x17

loc_1021:				; CODE XREF: CRT_Sprintf_Full+FAj CRT_Sprintf_Full+198j	...
		mov	ch, 5
		jmp	short loc_FCC
; ���������������������������������������������������������������������������

loc_1025:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		cmp	ch, 0		; case 0x9
		ja	short loc_1077	; case 0x5
		test	[bp+var_2], 2
		jnz	short loc_105A
		or	[bp+var_2], 8
		mov	ch, 1
		jmp	short loc_FCC
; ���������������������������������������������������������������������������

loc_1039:				; CODE XREF: CRT_Sprintf_Full+13Fj CRT_Sprintf_Full+14Cj ...
		jmp	loc_1374	; default
; ���������������������������������������������������������������������������

loc_103C:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	di, [bp+arg_0]	; case 0x2
		mov	ax, ss:[di]
		add	[bp+arg_0], 2
		cmp	ch, 2
		jnb	short loc_105D
		or	ax, ax
		jns	short loc_1055
		neg	ax
		or	[bp+var_2], 2

loc_1055:				; CODE XREF: CRT_Sprintf_Full+12Cj
		mov	[bp+var_8], ax
		mov	ch, 3

loc_105A:				; CODE XREF: CRT_Sprintf_Full+10Ej CRT_Sprintf_Full+166j ...
		jmp	loc_FCC
; ���������������������������������������������������������������������������

loc_105D:				; CODE XREF: CRT_Sprintf_Full+128j
		cmp	ch, 4
		jnz	short loc_1039
		mov	[bp+var_A], ax
		inc	ch
		jmp	loc_FCC
; ���������������������������������������������������������������������������

loc_106A:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		cmp	ch, 4		; case 0x4
		jnb	short loc_1039
		mov	ch, 4
		inc	[bp+var_A]
		jmp	loc_FCC
; ���������������������������������������������������������������������������

loc_1077:				; CODE XREF: CRT_Sprintf_Full+C8j CRT_Sprintf_Full+107j
					; DATA XREF: ...
		xchg	ax, dx		; case 0x5
		sub	al, 30h	; '0'
		cbw
		cmp	ch, 2
		ja	short loc_1099
		mov	ch, 2
		xchg	ax, [bp+var_8]
		or	ax, ax
		jl	short loc_105A
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp+var_8], ax
		jmp	loc_FCC
; ���������������������������������������������������������������������������

loc_1099:				; CODE XREF: CRT_Sprintf_Full+15Dj
		cmp	ch, 4
		jnz	short loc_1039
		xchg	ax, [bp+var_A]
		or	ax, ax
		jz	short loc_105A
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp+var_A], ax
		jmp	loc_FCC
; ���������������������������������������������������������������������������

loc_10B5:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		or	[bp+var_2], 10h	; case 0x6
		jmp	loc_1021
; ���������������������������������������������������������������������������

loc_10BC:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		or	[bp+var_2], 100h ; case	0x7

loc_10C1:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		and	[bp+var_2], 0FFEFh ; case 0x8
		jmp	loc_1021
; ���������������������������������������������������������������������������

loc_10C8:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	bh, 8		; case 0xB
		jmp	short loc_10D6
; ���������������������������������������������������������������������������

loc_10CC:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	bh, 0Ah		; case 0xC
		jmp	short loc_10DA
; ���������������������������������������������������������������������������

loc_10D0:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	bh, 10h		; case 0xD
		mov	bl, 0E9h ; '�'
		add	bl, dl

loc_10D6:				; CODE XREF: CRT_Sprintf_Full+1A9j
		mov	[bp+var_B], 0

loc_10DA:				; CODE XREF: CRT_Sprintf_Full+1ADj
		mov	[bp+var_5], dl
		xor	dx, dx
		mov	[bp+var_6], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		jmp	short loc_10FA
; ���������������������������������������������������������������������������

loc_10EA:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	bh, 0Ah		; case 0xA
		mov	[bp+var_6], 1
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		cwd

loc_10FA:				; CODE XREF: CRT_Sprintf_Full+1C7j
		inc	di
		inc	di
		mov	[bp+arg_2], si
		test	[bp+var_2], 10h
		jz	short loc_110B
		mov	dx, ss:[di]
		inc	di
		inc	di

loc_110B:				; CODE XREF: CRT_Sprintf_Full+1E3j
		mov	[bp+arg_0], di
		lea	di, [bp+var_45]
		or	ax, ax
		jnz	short loc_1127
		or	dx, dx
		jnz	short loc_1127
		cmp	[bp+var_A], 0
		jnz	short loc_112B
		mov	byte ptr ss:[di], 0
		mov	ax, di
		jmp	short loc_113A
; ���������������������������������������������������������������������������

loc_1127:				; CODE XREF: CRT_Sprintf_Full+1F2j CRT_Sprintf_Full+1F6j
		or	[bp+var_2], 4

loc_112B:				; CODE XREF: CRT_Sprintf_Full+1FCj
		push	dx
		push	ax
		push	di
		mov	al, bh
		cbw
		push	ax
		mov	al, [bp+var_6]
		push	ax
		push	bx
		call	CRT_Ltoa

loc_113A:				; CODE XREF: CRT_Sprintf_Full+204j
		push	ss
		pop	es
		assume es:dseg
		mov	dx, [bp+var_A]
		or	dx, dx
		jge	short loc_1146
		jmp	loc_1238
; ���������������������������������������������������������������������������

loc_1146:				; CODE XREF: CRT_Sprintf_Full+220j
		jmp	loc_1246
; ���������������������������������������������������������������������������

loc_1149:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	[bp+var_5], dl	; case 0xE
		mov	[bp+arg_2], si
		lea	di, [bp-46h]
		mov	bx, [bp+arg_0]
		push	word ptr ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+arg_0], bx
		test	[bp+var_2], 20h
		jz	short loc_1174
		mov	dx, ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+arg_0], bx
		push	ss
		pop	es
		call	sub_F09
		mov	al, 3Ah	; ':'
		stosb

loc_1174:				; CODE XREF: CRT_Sprintf_Full+241j
		push	ss
		pop	es
		pop	dx
		call	sub_F09
		mov	byte ptr ss:[di], 0
		mov	[bp+var_6], 0
		and	[bp+var_2], 0FFFBh
		lea	cx, [bp-46h]
		sub	di, cx
		xchg	cx, di
		mov	dx, [bp+var_A]
		cmp	dx, cx
		jg	short loc_1196
		mov	dx, cx

loc_1196:				; CODE XREF: CRT_Sprintf_Full+271j
		jmp	loc_1238
; ���������������������������������������������������������������������������

loc_1199:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	[bp+arg_2], si	; case 0x10
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		add	[bp+arg_0], 2
		push	ss
		pop	es
		lea	di, [bp+var_45]
		xor	ah, ah
		mov	ss:[di], ax
		mov	cx, 1
		jmp	loc_127B
; ���������������������������������������������������������������������������

loc_11B9:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	[bp+arg_2], si	; case 0x11
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		test	[bp+var_2], 20h
		jnz	short loc_11D6
		mov	di, ss:[di]
		add	[bp+arg_0], 2
		push	ds
		pop	es
		or	di, di
		jmp	short loc_11E1
; ���������������������������������������������������������������������������

loc_11D6:				; CODE XREF: CRT_Sprintf_Full+2A6j
		les	di, ss:[di]
		assume es:nothing
		add	[bp+arg_0], 4
		mov	ax, es
		or	ax, di

loc_11E1:				; CODE XREF: CRT_Sprintf_Full+2B3j
		jnz	short loc_11E8
		push	ds
		pop	es
		assume es:dseg
		mov	di, 57C2h

loc_11E8:				; CODE XREF: CRT_Sprintf_Full:loc_11E1j
		call	CRT_Strlen_ScasB
		cmp	cx, [bp+var_A]
		jbe	short loc_11F3
		mov	cx, [bp+var_A]

loc_11F3:				; CODE XREF: CRT_Sprintf_Full+2CDj
		jmp	loc_127B
; ���������������������������������������������������������������������������

loc_11F6:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	[bp+arg_2], si	; case 0xF
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	cx, [bp+var_A]
		or	cx, cx
		jge	short loc_1209
		mov	cx, 6

loc_1209:				; CODE XREF: CRT_Sprintf_Full+2E3j
		push	di
		push	cx
		lea	bx, [bp+var_45]
		push	bx
		push	dx
		mov	ax, 1
		and	ax, [bp+var_2]
		push	ax
		mov	ax, [bp+var_2]
		test	ax, 100h
		jz	short loc_1228
		mov	ax, 8
		add	[bp+arg_0], 0Ah
		jmp	short loc_122F
; ���������������������������������������������������������������������������

loc_1228:				; CODE XREF: CRT_Sprintf_Full+2FCj
		add	[bp+arg_0], 8
		mov	ax, 6

loc_122F:				; CODE XREF: CRT_Sprintf_Full+305j
		push	ax
		call	sub_1ADD
		push	ss
		pop	es
		lea	di, [bp+var_45]

loc_1238:				; CODE XREF: CRT_Sprintf_Full+222j
					; CRT_Sprintf_Full:loc_1196j
		test	[bp+var_2], 8
		jz	short loc_1257
		mov	dx, [bp+var_8]
		or	dx, dx
		jle	short loc_1257

loc_1246:				; CODE XREF: CRT_Sprintf_Full:loc_1146j
		call	CRT_Strlen_ScasB
		cmp	byte ptr es:[di], 2Dh ;	'-'
		jnz	short loc_1250
		dec	cx

loc_1250:				; CODE XREF: CRT_Sprintf_Full+32Cj
		sub	dx, cx
		jle	short loc_1257
		mov	[bp+var_E], dx

loc_1257:				; CODE XREF: CRT_Sprintf_Full+31Cj CRT_Sprintf_Full+323j ...
		cmp	byte ptr es:[di], 2Dh ;	'-'
		jz	short loc_1268
		mov	al, [bp+var_B]
		or	al, al
		jz	short loc_1278
		dec	di
		mov	es:[di], al

loc_1268:				; CODE XREF: CRT_Sprintf_Full+33Aj
		cmp	[bp+var_E], 0
		jle	short loc_1278
		mov	cx, [bp+var_A]
		or	cx, cx
		jge	short loc_1278
		dec	[bp+var_E]

loc_1278:				; CODE XREF: CRT_Sprintf_Full+341j CRT_Sprintf_Full+34Bj ...
		call	CRT_Strlen_ScasB

loc_127B:				; CODE XREF: CRT_Sprintf_Full+295j
					; CRT_Sprintf_Full:loc_11F3j
		mov	si, di
		mov	di, [bp+var_4]
		mov	bx, [bp+var_8]
		mov	ax, 5
		and	ax, [bp+var_2]
		cmp	ax, 5
		jnz	short loc_12A1
		mov	ah, [bp+var_5]
		cmp	ah, 6Fh	; 'o'
		jnz	short loc_12A3
		cmp	[bp+var_E], 0
		jg	short loc_12A1
		mov	[bp+var_E], 1

loc_12A1:				; CODE XREF: CRT_Sprintf_Full+36Bj CRT_Sprintf_Full+379j
		jmp	short loc_12BE
; ���������������������������������������������������������������������������

loc_12A3:				; CODE XREF: CRT_Sprintf_Full+373j
		cmp	ah, 78h	; 'x'
		jz	short loc_12AD
		cmp	ah, 58h	; 'X'
		jnz	short loc_12BE

loc_12AD:				; CODE XREF: CRT_Sprintf_Full+385j
		or	[bp+var_2], 40h
		dec	bx
		dec	bx
		sub	[bp+var_E], 2
		jge	short loc_12BE
		mov	[bp+var_E], 0

loc_12BE:				; CODE XREF: CRT_Sprintf_Full:loc_12A1j
					; CRT_Sprintf_Full+38Aj	...
		add	cx, [bp+var_E]
		test	[bp+var_2], 2
		jnz	short loc_12D4
		jmp	short loc_12D0
; ���������������������������������������������������������������������������

loc_12CA:				; CODE XREF: CRT_Sprintf_Full+3B1j
		mov	al, 20h	; ' '
		call	sub_F48
		dec	bx

loc_12D0:				; CODE XREF: CRT_Sprintf_Full+3A7j
		cmp	bx, cx
		jg	short loc_12CA

loc_12D4:				; CODE XREF: CRT_Sprintf_Full+3A5j
		test	[bp+var_2], 40h
		jz	short loc_12E6
		mov	al, 30h	; '0'
		call	sub_F48
		mov	al, [bp+var_5]
		call	sub_F48

loc_12E6:				; CODE XREF: CRT_Sprintf_Full+3B8j
		mov	dx, [bp+var_E]
		or	dx, dx
		jle	short loc_1314
		sub	cx, dx
		sub	bx, dx
		mov	al, es:[si]
		cmp	al, 2Dh	; '-'
		jz	short loc_1300
		cmp	al, 20h	; ' '
		jz	short loc_1300
		cmp	al, 2Bh	; '+'
		jnz	short loc_1307

loc_1300:				; CODE XREF: CRT_Sprintf_Full+3D5j CRT_Sprintf_Full+3D9j
		lods	byte ptr es:[si]
		call	sub_F48
		dec	cx
		dec	bx

loc_1307:				; CODE XREF: CRT_Sprintf_Full+3DDj
		xchg	cx, dx
		jcxz	short loc_1312

loc_130B:				; CODE XREF: CRT_Sprintf_Full+3EFj
		mov	al, 30h	; '0'
		call	sub_F48
		loop	loc_130B

loc_1312:				; CODE XREF: CRT_Sprintf_Full+3E8j
		xchg	cx, dx

loc_1314:				; CODE XREF: CRT_Sprintf_Full+3CAj
		jcxz	short loc_1328
		sub	bx, cx

loc_1318:				; CODE XREF: CRT_Sprintf_Full:loc_1326j
		lods	byte ptr es:[si]
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp+var_14]
		jg	short loc_1326
		call	CRT_FlushSprintfBuf

loc_1326:				; CODE XREF: CRT_Sprintf_Full+400j
		loop	loc_1318

loc_1328:				; CODE XREF: CRT_Sprintf_Full:loc_1314j
		or	bx, bx
		jle	short loc_1335
		mov	cx, bx

loc_132E:				; CODE XREF: CRT_Sprintf_Full+412j
		mov	al, 20h	; ' '
		call	sub_F48
		loop	loc_132E

loc_1335:				; CODE XREF: CRT_Sprintf_Full+409j
		jmp	loc_F8D
; ���������������������������������������������������������������������������

loc_1338:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_13A4o
		mov	[bp+arg_2], si	; case 0x12
		mov	di, [bp+arg_0]
		test	[bp+var_2], 20h
		jnz	short loc_1350
		mov	di, ss:[di]
		add	[bp+arg_0], 2
		push	ds
		pop	es
		jmp	short loc_1357
; ���������������������������������������������������������������������������

loc_1350:				; CODE XREF: CRT_Sprintf_Full+422j
		les	di, ss:[di]
		assume es:nothing
		add	[bp+arg_0], 4

loc_1357:				; CODE XREF: CRT_Sprintf_Full+42Dj
		mov	ax, 50h	; 'P'
		sub	al, byte ptr [bp+var_14]
		add	ax, [bp+var_12]
		mov	es:[di], ax
		test	[bp+var_2], 10h
		jz	short loc_1371
		inc	di
		inc	di
		mov	word ptr es:[di], 0

loc_1371:				; CODE XREF: CRT_Sprintf_Full+447j
		jmp	loc_F8A
; ���������������������������������������������������������������������������

loc_1374:				; CODE XREF: CRT_Sprintf_Full+C3j CRT_Sprintf_Full+C8j ...
		mov	si, [bp+var_10]	; default
		mov	di, [bp+var_4]
		mov	al, 25h	; '%'

loc_137C:				; CODE XREF: CRT_Sprintf_Full+461j
		call	sub_F48
		lodsb
		or	al, al
		jnz	short loc_137C

loc_1384:				; CODE XREF: CRT_Sprintf_Full:loc_FA7j
		cmp	byte ptr [bp+var_14], 50h ; 'P'
		jge	short loc_138D
		call	CRT_FlushSprintfBuf

loc_138D:				; CODE XREF: CRT_Sprintf_Full+467j
		pop	es
		cmp	[bp+var_16], 0
		jz	short loc_1399
		mov	ax, 0FFFFh
		jmp	short loc_139C
; ���������������������������������������������������������������������������

loc_1399:				; CODE XREF: CRT_Sprintf_Full+471j
		mov	ax, [bp+var_12]

loc_139C:				; CODE XREF: CRT_Sprintf_Full+476j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	8
; END OF FUNCTION CHUNK	FOR CRT_Sprintf_Full
; ���������������������������������������������������������������������������
off_13A4	dw offset loc_1007	; DATA XREF: CRT_Sprintf_Full+C8r
		dw offset loc_FF1	; jump table for switch	statement
		dw offset loc_103C
		dw offset loc_FFC
		dw offset loc_106A
		dw offset loc_1077
		dw offset loc_10B5
		dw offset loc_10BC
		dw offset loc_10C1
		dw offset loc_1025
		dw offset loc_10EA
		dw offset loc_10C8
		dw offset loc_10CC
		dw offset loc_10D0
		dw offset loc_1149
		dw offset loc_11F6
		dw offset loc_1199
		dw offset loc_11B9
		dw offset loc_1338
		dw offset loc_1374
		dw offset loc_1374
		dw offset loc_1374
		dw offset loc_1017
		dw offset loc_101D

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_AllocaGuard
; (sub_16E6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — vérifie qu'une adresse est ≥ sp-0x200 (garde anti-débordement pile), sinon
; erreur (word_6D144=8) : alloca() avec protection.
; ==============================================================================================
CRT_AllocaGuard	proc near		; CODE XREF: seg000:142Dp Heap_ShrinkTail+35p ...

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, sp
		sub	dx, 200h
		cmp	ax, dx
		jnb	short loc_13EB
		mov	word_43148, ax
		xor	ax, ax
		jmp	short loc_13F4
; ���������������������������������������������������������������������������

loc_13EB:				; CODE XREF: CRT_AllocaGuard+Ej
		mov	word_43140, 8
		mov	ax, 0FFFFh

loc_13F4:				; CODE XREF: CRT_AllocaGuard+15j
		pop	bp
		retn
CRT_AllocaGuard	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_AllocaGrow
; (sub_1708 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — variante de sub_16E6 avec ajustement de taille (extension réelle de pile) :
; alloca(size).
; ==============================================================================================
CRT_AllocaGrow	proc near		; CODE XREF: seg000:143Cp Heap_GrowSegment+5p	...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, word_43148
		adc	dx, 0
		mov	cx, ax
		or	dx, dx
		jnz	short loc_141C
		add	cx, 200h
		jb	short loc_141C
		cmp	cx, sp
		jnb	short loc_141C
		xchg	ax, word_43148
		jmp	short loc_1425
; ���������������������������������������������������������������������������

loc_141C:				; CODE XREF: CRT_AllocaGrow+14j CRT_AllocaGrow+1Aj ...
		mov	word_43140, 8
		mov	ax, 0FFFFh

loc_1425:				; CODE XREF: CRT_AllocaGrow+24j
		pop	bp
		retn
CRT_AllocaGrow	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		call	CRT_AllocaGuard
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		cwd
		push	dx
		push	ax
		call	CRT_AllocaGrow
		pop	cx
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_FatalStackError (sub_1755 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — near — écrit un message
; d'erreur fatal fixe (chaînes à 4D32h/4D37h/4D3Ch) sur stderr puis saute vers loc_2AD :
; handler d'erreur fatale runtime (stack overflow probable).
; ==============================================================================================
CRT_FatalStackError	proc near		; CODE XREF: sub_1ADDj
					; DATA XREF: dseg:off_488DEo
		mov	dx, 582Ah
		jmp	short loc_144B
; ���������������������������������������������������������������������������
		mov	dx, 582Fh

loc_144B:				; CODE XREF: CRT_FatalStackError+3j
		mov	cx, 5
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		mov	cx, 27h	; '''
		mov	dx, 5834h
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		jmp	loc_2B1
CRT_FatalStackError	endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_2. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à PIT_ReadTick16
; (sub_1775 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — lit le timer PIT (port 40h/43h, canal 0) et retourne 16-bit inversé : lecture
; bas niveau du tick PIT (base des routines de profiling AI mentionnées dans le projet).
; ==============================================================================================
PIT_ReadTick16	proc near		; CODE XREF: seg000:loc_1480p
					; PIT_DelayLoop+7p ...
		pushf
		cli
		mov	al, 0
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		call	nullsub_2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bl, al
		call	nullsub_2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bh, al
		not	bx
		popf
		mov	ax, bx
		retn
PIT_ReadTick16	endp

; ���������������������������������������������������������������������������

loc_147D:				; DATA XREF: dseg:5976o
		push	si
		xor	si, si

loc_1480:				; CODE XREF: seg000:149Aj
		call	PIT_ReadTick16
		test	ax, 1
		jnz	short loc_1496
		mov	word_4887E, 0
		mov	word_4887C, 4A9h
		jmp	short loc_149C
; ���������������������������������������������������������������������������

loc_1496:				; CODE XREF: seg000:1486j
		inc	si
		cmp	si, 64h	; 'd'
		jl	short loc_1480

loc_149C:				; CODE XREF: seg000:1494j
		pop	si
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à PIT_DelayLoop (sub_17B0
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — boucle d'attente utilisant sub_1775 (PIT) et un delta 32-bit (word_71E14/16) :
; implémentation delay()/temporisation précise.
; ==============================================================================================
PIT_DelayLoop	proc far		; CODE XREF: seg063:059CP
					; sub_5E1A1+593P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		call	PIT_ReadTick16
		mov	si, ax
		xor	dx, dx
		mov	bx, [bp+arg_0]
		xor	cx, cx
		push	ax
		push	dx
		mov	dx, word_4887E
		mov	ax, word_4887C
		call	CRT_MulExtended32
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		mov	[bp+var_2], bx
		mov	[bp+var_4], cx
		jmp	short loc_14E7
; ���������������������������������������������������������������������������

loc_14CB:				; CODE XREF: PIT_DelayLoop+53j PIT_DelayLoop+5Aj
		cmp	bx, si
		jnb	short loc_14E5
		cmp	[bp+var_2], 1
		ja	short loc_14DD
		jb	short loc_14FA
		cmp	[bp+var_4], 0
		jb	short loc_14FA

loc_14DD:				; CODE XREF: PIT_DelayLoop+35j
		sub	[bp+var_4], 0
		sbb	[bp+var_2], 1

loc_14E5:				; CODE XREF: PIT_DelayLoop+2Fj
		mov	si, bx

loc_14E7:				; CODE XREF: PIT_DelayLoop+2Bj
		call	PIT_ReadTick16
		mov	bx, ax
		xor	dx, dx
		cmp	dx, [bp+var_2]
		jb	short loc_14CB
		jnz	short loc_14FA
		cmp	ax, [bp+var_4]
		jb	short loc_14CB

loc_14FA:				; CODE XREF: PIT_DelayLoop+37j PIT_DelayLoop+3Dj ...
		pop	si
		mov	sp, bp
		pop	bp
		retf
PIT_DelayLoop	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_InstallProtectedHandler (sub_1811 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — sauvegarde contexte (sub_D8E=setjmp) puis
; appelle sub_1839 avec 3 arguments : installation d'un handler protégé (structured
; exception).
; ==============================================================================================
CRT_InstallProtectedHandler	proc far		; CODE XREF: TextRenderer_EncodeCharA_2E94F+18P
					; TextRenderer_EncodeCharB_2E977+1DP ...

var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr CRT_SetjmpSave
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr CRT_Int86
		add	sp, 8
		mov	sp, bp
		pop	bp
		retf
CRT_InstallProtectedHandler	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Int86 (sub_1839 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; construit un trampoline sur pile (opcodes 0x55 0xCD = push bp; int), cas spécial
; interruptions 25h/26h (disk I/O), appelle le handler utilisateur avec tous les registres :
; implémentation int86()/intdos() bas niveau.
; ==============================================================================================
CRT_Int86	proc far		; CODE XREF: CRT_InstallProtectedHandler+1Ep
					; InputBinding_InitAndRegister_3E626+38P ...

var_14		= word ptr -14h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_B		= word ptr -0Bh
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		push	ds
		lea	cx, [bp+var_E]
		mov	word ptr [bp+var_4], cx
		mov	word ptr [bp+var_4+2], ss
		mov	byte ptr [bp+var_E], 55h ; 'U'
		mov	byte ptr [bp+var_E+1], 0CDh ; '�'
		mov	ax, [bp+arg_0]
		mov	[bp+var_C], al
		mov	[bp+var_B], 0CB5Dh
		cmp	al, 25h	; '%'
		jb	short loc_1565
		cmp	al, 26h	; '&'
		ja	short loc_1565
		mov	byte ptr [bp+var_B], 36h ; '6'
		mov	[bp+var_B+1], 68Fh
		mov	[bp+var_8], cx
		mov	[bp+var_6], 0CB5Dh

loc_1565:				; CODE XREF: CRT_Int86+27j CRT_Int86+2Bj
		mov	si, [bp+arg_6]
		push	word ptr [si]
		push	word ptr [si+6]
		mov	si, [bp+arg_2]
		mov	ax, [si]
		mov	bx, [si+2]
		mov	cx, [si+4]
		mov	dx, [si+6]
		mov	di, [si+0Ah]
		mov	si, [si+8]
		pop	ds
		pop	es
		call	[bp+var_4]
		pushf
		pushf
		push	si
		push	ds
		push	es
		mov	ds, [bp+var_14]
		mov	si, [bp+arg_6]
		pop	word ptr [si]
		pop	word ptr [si+6]
		mov	si, [bp+arg_4]
		pop	word ptr [si+8]
		pop	word ptr [si+0Eh]
		pop	word ptr [si+0Ch]
		and	word ptr [si+0Ch], 1
		mov	[si+0Ah], di
		mov	[si+6],	dx
		mov	[si+4],	cx
		mov	[si+2],	bx
		mov	[si], ax
		pop	ds
		jz	short loc_15BD
		push	ax
		push	ax
		call	CRT_ClampMathIndex
		pop	ax

loc_15BD:				; CODE XREF: CRT_Int86+8Ej
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Int86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Int86x (sub_18D5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; variante de sub_1839 avec trampoline différent (0x6E8B/0xDE/0xCD) : probable int86x()
; (registres segment supplémentaires).
; ==============================================================================================
CRT_Int86x	proc far		; CODE XREF: FontStyle_Destruct_2F413+32P

var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_7		= word ptr -7
var_4		= dword	ptr -4
arg_2		= word ptr  6
arg_4		= word ptr  8

; FUNCTION CHUNK AT 160A SIZE 0000005D BYTES

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		push	bp
		push	ds
		pushf
		lea	cx, [bp+var_12]
		mov	word ptr [bp+var_4], cx
		mov	word ptr [bp+var_4+2], ss
		mov	[bp+var_12], 6E8Bh
		mov	[bp+var_10], 0DEh ; '�'
		mov	[bp+var_F], 0CDh ; '�'
		mov	ax, [bp+arg_2]
		mov	[bp+var_E], al
		cmp	al, 25h	; '%'
		jb	short loc_160A
		cmp	al, 26h	; '&'
		ja	short loc_160A
		mov	[bp+var_D], 36h	; '6'
		mov	[bp+var_C], 68Fh
		mov	[bp+var_A], cx
		mov	[bp+var_8], 0CAh ; '�'
		mov	[bp+var_7], 2
		jmp	short loc_1613
CRT_Int86x	endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_3. PRESS KEYPAD "+" TO EXPAND]
; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Int86x

loc_160A:				; CODE XREF: CRT_Int86x+29j CRT_Int86x+2Dj
		mov	[bp+var_D], 0CAh ; '�'
		mov	[bp+var_C], 2

loc_1613:				; CODE XREF: CRT_Int86x+44j
		mov	di, [bp+arg_4]
		push	ds
		push	di
		mov	ax, [di]
		mov	bx, [di+2]
		mov	cx, [di+4]
		mov	dx, [di+6]
		push	word ptr [di+8]
		mov	si, [di+0Ah]
		mov	es, word ptr [di+10h]
		lds	di, [di+0Ch]
		call	[bp+var_4]
		push	ds
		push	di
		push	bp
		pushf
		mov	bp, sp
		lds	di, dword ptr [bp+arg_4]
		mov	[di], ax
		mov	[di+2],	bx
		mov	[di+4],	cx
		mov	[di+6],	dx
		mov	[di+0Ah], si
		mov	word ptr [di+10h], es
		pop	word ptr [di+12h]
		pop	word ptr [di+8]
		pop	word ptr [di+0Ch]
		pop	word ptr [di+0Eh]
		add	sp, 4
		push	cs
		call	near ptr nullsub_3
		pop	ds
		pop	bp
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR CRT_Int86x

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_ReallocShrink
; (sub_1979 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — gestionnaire heap : compare taille demandée à limite globale (word_71E1A),
; appelle sub_19D0 (coalesce/free) ou sub_1996 (shrink) : routine realloc/heap-shrink.
; ==============================================================================================
Heap_ReallocShrink	proc far		; CODE XREF: Heap_SplitBlock+2Ap seg000:18D8p
		push	si
		push	di
		mov	si, sp
		mov	bx, [si+8]
		sub	bx, 4
		jb	short loc_1681
		cmp	bx, word_48882
		jz	short loc_167E
		call	Heap_FreeCoalesce
		jmp	short loc_1681
; ���������������������������������������������������������������������������

loc_167E:				; CODE XREF: Heap_ReallocShrink+10j
		call	Heap_ShrinkTail

loc_1681:				; CODE XREF: Heap_ReallocShrink+Aj Heap_ReallocShrink+15j
		pop	di
		pop	si
		retf
Heap_ReallocShrink	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_ShrinkTail
; (sub_1996 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — gère la fin de bloc heap courant, met à jour pointeurs globaux
; (word_71E18/1A/1C) : helper interne heap manager.
; ==============================================================================================
Heap_ShrinkTail	proc near		; CODE XREF: Heap_ReallocShrink:loc_167Ep
		cmp	word_48880, bx
		jz	short loc_16AD
		mov	si, [bx+2]
		test	byte ptr [si], 1
		jz	short loc_1698
		mov	word_48882, si
		jmp	short loc_16B8
; ���������������������������������������������������������������������������

loc_1698:				; CODE XREF: Heap_ShrinkTail+Cj
		cmp	si, word_48880
		jz	short loc_16AB
		mov	bx, si
		call	Heap_FreelistUnlink
		mov	ax, [bx+2]
		mov	word_48882, ax
		jmp	short loc_16B8
; ���������������������������������������������������������������������������

loc_16AB:				; CODE XREF: Heap_ShrinkTail+18j
		mov	bx, si

loc_16AD:				; CODE XREF: Heap_ShrinkTail+4j
		xor	ax, ax
		mov	word_48880, ax
		mov	word_48882, ax
		mov	word_48884, ax

loc_16B8:				; CODE XREF: Heap_ShrinkTail+12j Heap_ShrinkTail+25j
		push	bx
		call	CRT_AllocaGuard
		pop	bx
		retn
Heap_ShrinkTail	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_FreeCoalesce
; (sub_19D0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — décrémente compteur de référence bloc et fusionne avec bloc suivant libre
; (coalescing) : free() interne du heap custom.
; ==============================================================================================
Heap_FreeCoalesce	proc near		; CODE XREF: Heap_ReallocShrink+12p Heap_SplitBlock_Commit+39p
		dec	word ptr [bx]
		cmp	bx, word_48880
		jz	short loc_16DE
		mov	si, [bx+2]
		mov	ax, [si]
		test	al, 1
		jnz	short loc_16DE
		add	ax, [bx]
		mov	[si], ax
		mov	di, [bx]
		add	di, bx
		mov	[di+2],	si
		mov	bx, si
		jmp	short loc_16E1
; ���������������������������������������������������������������������������

loc_16DE:				; CODE XREF: Heap_FreeCoalesce+6j Heap_FreeCoalesce+Fj
		call	Heap_FreelistInsert

loc_16E1:				; CODE XREF: Heap_FreeCoalesce+1Ej
		mov	di, [bx]
		add	di, bx
		mov	ax, [di]
		test	al, 1
		jz	short loc_16EC
		retn
; ���������������������������������������������������������������������������

loc_16EC:				; CODE XREF: Heap_FreeCoalesce+2Bj
		add	[bx], ax
		mov	si, di
		add	si, ax
		mov	[si+2],	bx
		mov	bx, di
Heap_FreeCoalesce	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_FreelistUnlink
; (sub_1A09 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — retire un bloc de la liste chaînée libre (unlink) : heap free-list management.
; ==============================================================================================
Heap_FreelistUnlink	proc near		; CODE XREF: Heap_ShrinkTail+1Cp Heap_Malloc+53p
		mov	di, [bx+6]
		cmp	bx, di
		jz	short loc_170C
		mov	word_48884, di
		mov	si, [bx+4]
		mov	[di+4],	si
		mov	[si+6],	di
		retn
; ���������������������������������������������������������������������������

loc_170C:				; CODE XREF: Heap_FreelistUnlink+5j
		mov	word_48884, 0
		retn
Heap_FreelistUnlink	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_FreelistInsert
; (sub_1A25 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — insère un bloc dans la liste chaînée libre circulaire double : heap free-list
; management.
; ==============================================================================================
Heap_FreelistInsert	proc near		; CODE XREF: Heap_FreeCoalesce:loc_16DEp
		mov	si, word_48884
		or	si, si
		jz	short loc_172B
		mov	di, [si+6]
		mov	[si+6],	bx
		mov	[di+4],	bx
		mov	[bx+6],	di
		mov	[bx+4],	si
		retn
; ���������������������������������������������������������������������������

loc_172B:				; CODE XREF: Heap_FreelistInsert+6j
		mov	word_48884, bx
		mov	[bx+4],	bx
		mov	[bx+6],	bx
		retn
Heap_FreelistInsert	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_Malloc (sub_1A48
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — malloc() : arrondit la taille (+5, pair, min 8), cherche un bloc libre assez grand (first-
; fit), sinon étend le heap ou split : allocateur mémoire principal du runtime custom.
; ==============================================================================================
Heap_Malloc	proc far		; CODE XREF: Heap_SplitBlock+7p seg000:18D1p
		push	si
		push	di
		mov	si, sp
		mov	ax, [si+8]
		or	ax, ax
		jz	short loc_1793
		add	ax, 5
		jb	short loc_177C
		and	ax, 0FFFEh
		cmp	ax, 8
		jnb	short loc_1751
		mov	ax, 8

loc_1751:				; CODE XREF: Heap_Malloc+16j
		cmp	word_48880, 0
		jz	short loc_1777
		mov	bx, word_48884
		or	bx, bx
		jz	short loc_176D
		mov	dx, bx

loc_1762:				; CODE XREF: Heap_Malloc+35j
		cmp	[bx], ax
		jnb	short loc_1780
		mov	bx, [bx+6]
		cmp	bx, dx
		jnz	short loc_1762

loc_176D:				; CODE XREF: Heap_Malloc+28j
		call	Heap_GrowExtended
		jmp	short loc_1793
; ���������������������������������������������������������������������������

loc_1772:				; CODE XREF: Heap_Malloc+51j
		call	Heap_SplitBlock_Alt
		jmp	short loc_1793
; ���������������������������������������������������������������������������

loc_1777:				; CODE XREF: Heap_Malloc+20j
		call	Heap_GrowSegment
		jmp	short loc_1793
; ���������������������������������������������������������������������������

loc_177C:				; CODE XREF: Heap_Malloc+Ej
		xor	ax, ax
		jmp	short loc_1793
; ���������������������������������������������������������������������������

loc_1780:				; CODE XREF: Heap_Malloc+2Ej
		mov	si, ax
		add	si, 8
		cmp	[bx], si
		jnb	short loc_1772
		call	Heap_FreelistUnlink
		inc	word ptr [bx]
		mov	ax, bx
		add	ax, 4

loc_1793:				; CODE XREF: Heap_Malloc+9j Heap_Malloc+3Aj	...
		pop	di
		pop	si
		retf
Heap_Malloc	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_GrowSegment
; (sub_1AA8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — étend le heap via sub_1708 (grow segment) : helper grow-heap de malloc.
; ==============================================================================================
Heap_GrowSegment	proc near		; CODE XREF: Heap_Malloc:loc_1777p
		push	ax
		xor	ax, ax
		push	ax
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx
		and	ax, 1
		jz	short loc_17AE
		xor	dx, dx
		push	dx
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx

loc_17AE:				; CODE XREF: Heap_GrowSegment+Dj
		pop	ax
		push	ax
		xor	bx, bx
		push	bx
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx
		cmp	ax, 0FFFFh
		jz	short loc_17D2
		mov	bx, ax
		mov	word_48880, bx
		mov	word_48882, bx
		pop	ax
		inc	ax
		mov	[bx], ax
		add	bx, 4
		mov	ax, bx
		retn
; ���������������������������������������������������������������������������

loc_17D2:				; CODE XREF: Heap_GrowSegment+26j
		pop	bx
		xor	ax, ax
		retn
Heap_GrowSegment	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_GrowExtended
; (sub_1AE8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — variante étendue de croissance heap (référencée par sub_1A48/sub_1A84).
; ==============================================================================================
Heap_GrowExtended	proc near		; CODE XREF: Heap_Malloc:loc_176Dp
		push	ax
		xor	bx, bx
		push	bx
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx
		cmp	ax, 0FFFFh
		jz	short loc_17FB
		mov	bx, ax
		mov	ax, word_48882
		mov	[bx+2],	ax
		mov	word_48882, bx
		pop	ax
		inc	ax
		mov	[bx], ax
		add	bx, 4
		mov	ax, bx
		retn
; ���������������������������������������������������������������������������

loc_17FB:				; CODE XREF: Heap_GrowExtended+Dj
		pop	ax
		xor	ax, ax
		retn
Heap_GrowExtended	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_SplitBlock_Alt
; (sub_1B11 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — split de bloc mémoire alternative (référencée par sub_1A48).
; ==============================================================================================
Heap_SplitBlock_Alt	proc near		; CODE XREF: Heap_Malloc:loc_1772p
		sub	[bx], ax
		mov	si, bx
		add	si, [bx]
		mov	di, si
		add	di, ax
		inc	ax
		mov	[si], ax
		mov	[si+2],	bx
		mov	[di+2],	si
		add	si, 4
		mov	ax, si
		retn
Heap_SplitBlock_Alt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_SplitBlock
; (sub_1B2A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — split de bloc mémoire avec calcul de reste, insère le reste libre (probable
; via sub_1B5F/sub_19D0).
; ==============================================================================================
Heap_SplitBlock	proc near		; CODE XREF: seg000:loc_18C8p

var_2		= word ptr -2

		mov	bp, sp
		push	bx
		push	ax
		push	cx
		push	ax
		push	cs
		call	near ptr Heap_Malloc
		pop	bx
		mov	bx, ax
		or	ax, ax
		jz	short loc_1849
		push	ds
		pop	es
		assume es:dseg
		cld
		mov	di, ax
		mov	si, [bp+var_2]
		mov	cx, [si]
		add	si, 4
		push	si
		sub	cx, 5
		shr	cx, 1
		rep movsw
		mov	[bp+var_2], ax
		push	cs
		call	near ptr Heap_ReallocShrink
		pop	bx
		mov	bx, [bp+var_2]

loc_1849:				; CODE XREF: Heap_SplitBlock+Fj
		add	sp, 6
		retn
Heap_SplitBlock	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_SplitBlock_Commit
; (sub_1B5F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — effectue le split concret d'un bloc heap (crée bloc libre restant, chaîne via
; sub_19D0).
; ==============================================================================================
Heap_SplitBlock_Commit	proc near		; CODE XREF: seg000:loc_18C3p
		mov	ax, dx
		add	dx, 8
		cmp	dx, cx
		ja	short loc_188B
		mov	dx, cx
		cmp	bx, word_48882
		jnz	short loc_186D
		mov	[bx], ax
		inc	word ptr [bx]
		add	ax, bx
		push	bx
		push	ax
		call	CRT_AllocaGuard
		pop	bx
		pop	bx
		jmp	short loc_188B
; ���������������������������������������������������������������������������

loc_186D:				; CODE XREF: Heap_SplitBlock_Commit+Fj
		mov	di, bx
		add	di, ax
		mov	[di+2],	bx
		sub	dx, ax
		sub	[bx], dx
		mov	si, di
		add	si, dx
		mov	[si+2],	di
		inc	dx
		mov	[di], dx
		mov	cx, bx
		mov	bx, di
		call	Heap_FreeCoalesce
		mov	bx, cx

loc_188B:				; CODE XREF: Heap_SplitBlock_Commit+7j Heap_SplitBlock_Commit+1Ej
		add	bx, 4
		retn
Heap_SplitBlock_Commit	endp

; ���������������������������������������������������������������������������
		push	si
		push	di
		push	bp
		mov	bp, sp
		mov	bx, [bp+0Ah]
		mov	ax, [bp+0Ch]
		or	ax, ax
		jz	short loc_18D6
		or	bx, bx
		jz	short loc_18CF
		sub	bx, 4
		mov	cx, [bx]
		dec	cx
		mov	dx, ax
		add	dx, 5
		and	dx, 0FFFEh
		cmp	dx, 8
		jnb	short loc_18B8
		mov	dx, 8

loc_18B8:				; CODE XREF: seg000:18B3j
		cmp	cx, dx
		jb	short loc_18C8
		ja	short loc_18C3
		add	bx, 4
		jmp	short loc_18CB
; ���������������������������������������������������������������������������

loc_18C3:				; CODE XREF: seg000:18BCj
		call	Heap_SplitBlock_Commit
		jmp	short loc_18CB
; ���������������������������������������������������������������������������

loc_18C8:				; CODE XREF: seg000:18BAj
		call	Heap_SplitBlock

loc_18CB:				; CODE XREF: seg000:18C1j seg000:18C6j
		mov	ax, bx
		jmp	short loc_18DE
; ���������������������������������������������������������������������������

loc_18CF:				; CODE XREF: seg000:18A0j
		push	ax
		push	cs
		call	near ptr Heap_Malloc
		jmp	short loc_18DD
; ���������������������������������������������������������������������������

loc_18D6:				; CODE XREF: seg000:189Cj
		push	bx
		push	cs
		call	near ptr Heap_ReallocShrink
		xor	ax, ax

loc_18DD:				; CODE XREF: seg000:18D4j
		pop	bx

loc_18DE:				; CODE XREF: seg000:18CDj
		pop	bp
		pop	di
		pop	si
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Heap_Validate (sub_1BF4
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — walk complet de la liste des blocs heap, vérifie chaînage et somme tailles libres/occupées
; : implémentation heapcheck()/validation debug du tas.
; ==============================================================================================
Heap_Validate	proc far		; CODE XREF: seg073:0076P
		push	si
		push	di
		push	bx
		push	cx
		push	dx
		mov	bx, word_48880
		or	bx, bx
		jz	short loc_1964
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx
		xor	cx, cx
		mov	dx, cx

loc_18FA:				; CODE XREF: Heap_Validate+53j
		test	byte ptr [bx], 1
		jnz	short loc_190C
		add	cx, [bx]
		cmp	bx, word_48882
		jz	short loc_1937
		test	byte ptr [si], 1
		jz	short loc_1972

loc_190C:				; CODE XREF: Heap_Validate+1Bj
		cmp	bx, word_48882
		jz	short loc_1937
		cmp	si, bx
		jbe	short loc_1972
		cmp	word ptr [bx], 8
		jb	short loc_1972
		cmp	si, word_48880
		jbe	short loc_1972
		cmp	si, word_48882
		ja	short loc_1972
		cmp	[si+2],	bx
		jnz	short loc_1972
		mov	bx, si
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx
		jmp	short loc_18FA
; ���������������������������������������������������������������������������

loc_1937:				; CODE XREF: Heap_Validate+23j Heap_Validate+2Ej
		mov	bx, word_48884
		or	bx, bx
		jz	short loc_1969

loc_193F:				; CODE XREF: Heap_Validate+80j
		mov	ax, [bx]
		test	al, 1
		jnz	short loc_1972
		add	dx, ax
		cmp	bx, word_48880
		jb	short loc_1972
		cmp	bx, word_48882
		jnb	short loc_1972
		mov	si, [bx+6]
		cmp	si, word_48884
		jz	short loc_1969
		cmp	si, bx
		jz	short loc_1972
		mov	bx, si
		jmp	short loc_193F
; ���������������������������������������������������������������������������

loc_1964:				; CODE XREF: Heap_Validate+Bj
		mov	ax, 1
		jmp	short loc_1975
; ���������������������������������������������������������������������������

loc_1969:				; CODE XREF: Heap_Validate+5Bj Heap_Validate+78j
		cmp	dx, cx
		jnz	short loc_1972
		mov	ax, 2
		jmp	short loc_1975
; ���������������������������������������������������������������������������

loc_1972:				; CODE XREF: Heap_Validate+28j Heap_Validate+32j ...
		mov	ax, 0FFFFh

loc_1975:				; CODE XREF: Heap_Validate+85j Heap_Validate+8Ej
		pop	dx
		pop	cx
		pop	bx
		pop	di
		pop	si
		retf
Heap_Validate	endp

; ���������������������������������������������������������������������������
		push	si
		push	di
		push	bp
		mov	bp, sp
		mov	ax, [bp+0Ah]
		sub	ax, 4
		mov	bx, word_48880
		or	bx, bx
		jz	short loc_19D8
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx

loc_1995:				; CODE XREF: seg000:19D6j
		cmp	bx, ax
		jz	short loc_19E7
		test	byte ptr [bx], 1
		jnz	short loc_19A9
		cmp	bx, word_48882
		jz	short loc_19E2
		test	byte ptr [si], 1
		jz	short loc_19DD

loc_19A9:				; CODE XREF: seg000:199Cj
		cmp	bx, word_48882
		jz	short loc_19E2
		cmp	si, bx
		jbe	short loc_19DD
		cmp	word ptr [bx], 8
		jb	short loc_19DD
		cmp	si, word_48880
		jbe	short loc_19DD
		cmp	si, word_48882
		ja	short loc_19DD
		cmp	si, bx
		jbe	short loc_19DD
		cmp	[si+2],	bx
		jnz	short loc_19DD
		mov	bx, si
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx
		jmp	short loc_1995
; ���������������������������������������������������������������������������

loc_19D8:				; CODE XREF: seg000:198Cj
		mov	ax, 1
		jmp	short loc_19F4
; ���������������������������������������������������������������������������

loc_19DD:				; CODE XREF: seg000:19A7j seg000:19B1j ...
		mov	ax, 0FFFFh
		jmp	short loc_19F4
; ���������������������������������������������������������������������������

loc_19E2:				; CODE XREF: seg000:19A2j seg000:19ADj
		mov	ax, 0FFFEh
		jmp	short loc_19F4
; ���������������������������������������������������������������������������

loc_19E7:				; CODE XREF: seg000:1997j
		test	byte ptr [bx], 1
		jnz	short loc_19F1
		mov	ax, 3
		jmp	short loc_19F4
; ���������������������������������������������������������������������������

loc_19F1:				; CODE XREF: seg000:19EAj
		mov	ax, 4

loc_19F4:				; CODE XREF: seg000:19DBj seg000:19E0j ...
		pop	bp
		pop	di
		pop	si
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	si
		push	di
		cmp	word_48880, 0
		jz	short loc_1A36
		mov	bx, word_48884
		or	bx, bx
		jz	short loc_1A31
		cld

loc_1A10:				; CODE XREF: seg000:1A2Fj
		mov	cx, [bx]
		sub	cx, 8
		shr	cx, 1
		lea	di, [bx+8]
		rep stosw
		mov	cx, [bx+6]
		cmp	cx, word_48884
		jz	short loc_1A31
		cmp	bx, cx
		jz	short loc_1A3B
		or	cx, cx
		jz	short loc_1A3B
		mov	bx, cx
		jmp	short loc_1A10
; ���������������������������������������������������������������������������

loc_1A31:				; CODE XREF: seg000:1A0Dj seg000:1A23j
		mov	ax, 2
		jmp	short loc_1A3E
; ���������������������������������������������������������������������������

loc_1A36:				; CODE XREF: seg000:1A05j
		mov	ax, 1
		jmp	short loc_1A3E
; ���������������������������������������������������������������������������

loc_1A3B:				; CODE XREF: seg000:1A27j seg000:1A2Bj
		mov	ax, 0FFFFh

loc_1A3E:				; CODE XREF: seg000:1A34j seg000:1A39j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	si
		push	di
		cmp	word_48880, 0
		jz	short loc_1A82
		mov	bx, word_48884
		or	bx, bx
		jz	short loc_1A7D
		cld

loc_1A5A:				; CODE XREF: seg000:1A7Bj
		mov	cx, [bx]
		sub	cx, 8
		shr	cx, 1
		lea	di, [bx+8]
		repe scasw
		jnz	short loc_1A87
		mov	cx, [bx+6]
		cmp	cx, word_48884
		jz	short loc_1A7D
		cmp	bx, cx
		jz	short loc_1A8C
		or	cx, cx
		jz	short loc_1A8C
		mov	bx, cx
		jmp	short loc_1A5A
; ���������������������������������������������������������������������������

loc_1A7D:				; CODE XREF: seg000:1A57j seg000:1A6Fj
		mov	ax, 2
		jmp	short loc_1A8F
; ���������������������������������������������������������������������������

loc_1A82:				; CODE XREF: seg000:1A4Fj
		mov	ax, 1
		jmp	short loc_1A8F
; ���������������������������������������������������������������������������

loc_1A87:				; CODE XREF: seg000:1A66j
		mov	ax, 0FFFDh
		jmp	short loc_1A8F
; ���������������������������������������������������������������������������

loc_1A8C:				; CODE XREF: seg000:1A73j seg000:1A77j
		mov	ax, 0FFFFh

loc_1A8F:				; CODE XREF: seg000:1A80j seg000:1A85j ...
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		push	si
		mov	bp, sp
		mov	bx, [bp+8]
		mov	si, [bx]
		or	si, si
		jz	short loc_1AB0
		sub	si, 4
		cmp	si, word_48882
		jz	short loc_1AD7
		add	si, [si]
		and	si, 0FFFEh
		jmp	short loc_1AB8
; ���������������������������������������������������������������������������

loc_1AB0:				; CODE XREF: seg000:1A9Ej
		mov	si, word_48880
		or	si, si
		jz	short loc_1AD2

loc_1AB8:				; CODE XREF: seg000:1AAEj
		mov	[bx], si
		add	word ptr [bx], 4
		mov	ax, [si]
		and	ax, 0FFFEh
		mov	[bx+2],	ax
		mov	ax, [si]
		and	ax, 1
		mov	[bx+4],	ax
		mov	ax, 2
		jmp	short loc_1ADA
; ���������������������������������������������������������������������������

loc_1AD2:				; CODE XREF: seg000:1AB6j
		mov	ax, 1
		jmp	short loc_1ADA
; ���������������������������������������������������������������������������

loc_1AD7:				; CODE XREF: seg000:1AA7j
		mov	ax, 5

loc_1ADA:				; CODE XREF: seg000:1AD0j seg000:1AD5j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_1ADD	proc near		; CODE XREF: CRT_Sprintf_Full+30Fp
		jmp	off_488DE
sub_1ADD	endp

; ���������������������������������������������������������������������������
		db 2 dup(0), 8Fh, 6, 6Ah, 58h, 8Fh, 6, 6Ch, 58h, 8Fh, 6
		db 6Eh,	58h, 2Eh, 8Ch, 1Eh, 0E1h, 1Ah, 89h, 36h, 70h, 58h
		db 89h,	3Eh, 72h, 58h, 0FCh, 8Eh, 6, 1Ch, 1, 0BEh, 80h
		db 0, 32h, 0E4h, 26h, 0ACh, 40h, 8Ch, 0C5h, 87h, 0D6h
		db 93h,	8Bh, 36h, 16h, 1, 2 dup(46h), 0B9h, 1, 0, 80h
		db 3Eh,	1Eh, 1,	3, 72h,	11h, 8Eh, 6, 18h, 1, 8Bh, 0FEh
		db 0B1h, 7Fh, 32h, 0C0h, 0F2h, 0AEh, 0E3h, 72h,	80h, 0F1h
		db 7Fh,	50h, 8Bh, 0C1h,	3, 0C3h, 40h, 25h, 0FEh, 0FFh
		db 8Bh,	0FCh, 2Bh, 0F8h, 72h, 60h, 8Bh,	0E7h, 6, 1Fh, 16h
		db 7, 51h, 49h,	0F3h, 0A4h, 32h, 0C0h, 0AAh, 8Eh, 0DDh
		db 87h,	0F2h, 87h, 0D9h, 8Bh, 0C3h, 8Bh, 0D0h, 43h, 0E8h
		db 1Dh,	0, 77h,	0Bh, 72h, 46h, 3Ch, 0Dh, 74h, 11h, 0E8h
		db 12h,	0, 77h,	0F5h, 3Ch, 20h,	74h, 8,	3Ch, 0Dh, 74h
		db 4, 3Ch, 9, 75h, 0E4h, 32h, 0C0h, 0EBh, 0E0h,	0Bh, 0C0h
		db 74h,	7, 42h,	0AAh, 0Ah, 0C0h, 75h, 1, 43h, 86h, 0E0h
		db 32h,	0C0h, 0F9h, 0E3h, 15h, 0ACh, 49h, 2Ch, 22h, 74h
		db 0Fh,	4, 22h,	3Ch, 5Ch, 75h, 7, 80h, 3Ch, 22h, 75h, 2
		db 0ACh, 49h, 0Bh, 0F6h, 0C3h, 2 dup(90h), 0E9h, 0Eh, 0E7h
		db 59h,	3, 0CAh, 2Eh, 8Eh, 1Eh,	0E1h, 1Ah, 89h,	1Eh, 66h
		db 58h,	43h, 3,	0DBh, 8Bh, 0F4h, 8Bh, 0ECh, 2Bh, 0EBh
		db 72h,	0E4h, 8Bh, 0E5h, 89h, 2Eh, 68h,	58h, 0E3h, 0Eh
		db 89h,	76h, 0,	83h, 0C5h, 2, 36h, 0ACh, 0Ah, 0C0h, 0E0h
		db 0FAh, 74h, 0F0h, 33h, 0C0h, 89h, 46h, 0, 2Eh, 8Eh, 1Eh
		db 0E1h, 1Ah, 8Bh, 36h,	70h, 58h, 8Bh, 3Eh, 72h, 58h, 0FFh
		db 36h,	6Eh, 58h, 0FFh,	36h, 6Ch, 58h, 0A1h, 66h, 58h
		db 0A3h, 10h, 1, 0A1h, 68h, 58h, 0A3h, 12h, 1, 0FFh, 26h
		db 6Ah,	58h, 56h, 57h, 8Bh, 0Eh, 16h, 1, 51h, 9Ah, 29h
		db 1
		dw seg seg076
; ���������������������������������������������������������������������������
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_1C31
		push	ds
		push	ds
		pop	es
		mov	ds, word_43138
		xor	si, si
		cld
		rep movsb
		pop	ds
		mov	di, ax
		push	es
		push	word_4313A
		call	Runtime_StackOverflowCheck_2C319
		pop	bx
		mov	bx, ax
		pop	es
		assume es:nothing
		mov	word_48894, ax
		or	ax, ax
		jnz	short loc_1C36

loc_1C31:				; CODE XREF: seg000:1C0Bj
		nop
		nop
		jmp	loc_2B1
; ���������������������������������������������������������������������������

loc_1C36:				; CODE XREF: seg000:1C2Fj
		xor	ax, ax
		mov	cx, 0FFFFh
		cmp	byte ptr [di], 0
		jz	short loc_1C4C

loc_1C40:				; CODE XREF: seg000:1C4Aj
		mov	[bx], di
		add	bx, 2
		repne scasb
		cmp	es:[di], al
		jnz	short loc_1C40

loc_1C4C:				; CODE XREF: seg000:1C3Ej
		mov	[bx], ax
		pop	di
		pop	si
		mov	ax, word_48894
		mov	word_43134, ax
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à PC_SoundOn (sub_1F18 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; programme le timer PIT canal 2 (port 42h/43h) à une fréquence donnée + active le gate
; speaker (port 61h) : fonction sound(freq).
; ==============================================================================================
PC_SoundOn	proc far		; CODE XREF: seg063:0592P
					; sub_5E1A1+589P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 34DDh
		mov	dx, 12h
		cmp	dx, bx
		jnb	short loc_1C81
		div	bx
		mov	bx, ax
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		test	al, 3
		jnz	short loc_1C79
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).

loc_1C79:				; CODE XREF: PC_SoundOn+18j
		mov	al, bl
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, bh
		out	42h, al		; Timer	8253-5 (AT: 8254.2).

loc_1C81:				; CODE XREF: PC_SoundOn+Ej
		pop	bp
		retf
PC_SoundOn	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_1C83	proc far		; CODE XREF: seg063:05A4P
					; sub_5E1A1+59BP ...
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FCh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retf
sub_1C83	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Write_TextMode
; (sub_1F4B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — wrapper write() avec test mode texte/binaire (CR/LF handling, flag bit1).
; ==============================================================================================
CRT_Write_TextMode	proc far		; CODE XREF: sub_6734+35P seg063:019BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr CRT_SetFileAttr
		pop	cx
		pop	cx
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_1CBB
		test	[bp+arg_2], 2
		jz	short loc_1CAE
		test	dx, 1
		jnz	short loc_1CB2

loc_1CAE:				; CODE XREF: CRT_Write_TextMode+1Cj
		xor	ax, ax
		jmp	short loc_1CBB
; ���������������������������������������������������������������������������

loc_1CB2:				; CODE XREF: CRT_Write_TextMode+22j
		mov	word_43140, 5
		mov	ax, 0FFFFh

loc_1CBB:				; CODE XREF: CRT_Write_TextMode+15j CRT_Write_TextMode+26j
		pop	bp
		retf
CRT_Write_TextMode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1CBD	proc far		; CODE XREF: seg000:1D34p sub_2B82+EDp ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	bp
		mov	si, [bp+arg_0]
		cld
		sub	ax, ax
		cwd
		mov	cx, 0Ah
		mov	bh, 0
		mov	di, 54E9h

loc_1CD2:				; CODE XREF: sub_1CBD+1Bj
		mov	bl, [si]
		inc	si
		test	byte ptr [bx+di], 1
		jnz	short loc_1CD2
		mov	bp, 0
		cmp	bl, 2Bh	; '+'
		jz	short loc_1CE8
		cmp	bl, 2Dh	; '-'
		jnz	short loc_1CEB
		inc	bp

loc_1CE8:				; CODE XREF: sub_1CBD+23j sub_1CBD+3Ej
		mov	bl, [si]
		inc	si

loc_1CEB:				; CODE XREF: sub_1CBD+28j
		cmp	bl, 39h	; '9'
		ja	short loc_1D1E
		sub	bl, 30h	; '0'
		jb	short loc_1D1E
		mul	cx
		add	ax, bx
		adc	dl, dh
		jz	short loc_1CE8
		jmp	short loc_1D11
; ���������������������������������������������������������������������������

loc_1CFF:				; CODE XREF: sub_1CBD+5Fj
		mov	di, dx
		mov	cx, 0Ah
		mul	cx
		xchg	ax, di
		xchg	dx, cx
		mul	dx
		xchg	ax, dx
		xchg	ax, di
		add	ax, bx
		adc	dx, cx

loc_1D11:				; CODE XREF: sub_1CBD+40j
		mov	bl, [si]
		inc	si
		cmp	bl, 39h	; '9'
		ja	short loc_1D1E
		sub	bl, 30h	; '0'
		jnb	short loc_1CFF

loc_1D1E:				; CODE XREF: sub_1CBD+31j sub_1CBD+36j ...
		dec	bp
		jl	short loc_1D28
		neg	dx
		neg	ax
		sbb	dx, 0

loc_1D28:				; CODE XREF: sub_1CBD+62j
		pop	bp
		pop	di
		pop	si
		pop	bp
		retf
sub_1CBD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_1CBD
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_SetFileAttr
; (sub_1F7E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — opération fichier bas niveau INT21 AH=43h (get/set attributs) avec gestion
; erreur via sub_4E7.
; ==============================================================================================
CRT_SetFileAttr	proc far		; CODE XREF: CRT_Write_TextMode+Bp

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		mov	ah, 43h	; 'C'
		mov	al, [bp+arg_2]
		mov	dx, [bp+arg_0]
		int	21h		; DOS -
		jb	short loc_1D4F
		xchg	ax, cx
		jmp	short loc_1D53
; ���������������������������������������������������������������������������

loc_1D4F:				; CODE XREF: CRT_SetFileAttr+10j
		push	ax
		call	CRT_ClampMathIndex

loc_1D53:				; CODE XREF: CRT_SetFileAttr+13j
		pop	bp
		retf
CRT_SetFileAttr	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_Fflush (sub_1F99 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — fflush() interne d'un FILE*
; : vérifie flag dirty (bit3), appelle sub_2BB9 (write) si besoin, met à jour pointeurs de
; buffer.
; ==============================================================================================
Stdio_Fflush	proc far		; CODE XREF: sub_1E36+20p Stdio_WriteTextMode+Ep	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		or	di, di
		jnz	short loc_1D68
		nop
		push	cs
		call	near ptr sub_1E36
		jmp	short loc_1DD0
; ���������������������������������������������������������������������������

loc_1D68:				; CODE XREF: Stdio_Fflush+Aj
		cmp	[di+0Eh], di
		jz	short loc_1D72

loc_1D6D:				; CODE XREF: Stdio_Fflush+79j
		mov	ax, 0FFFFh
		jmp	short loc_1DD2
; ���������������������������������������������������������������������������

loc_1D72:				; CODE XREF: Stdio_Fflush+16j
		cmp	word ptr [di], 0
		jl	short loc_1DA0
		test	word ptr [di+2], 8
		jnz	short loc_1D88
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_1DD0

loc_1D88:				; CODE XREF: Stdio_Fflush+27j
		mov	word ptr [di], 0
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_1DD0
		mov	ax, [di+8]
		mov	[di+0Ah], ax
		jmp	short loc_1DD0
; ���������������������������������������������������������������������������
		jmp	short loc_1DD0
; ���������������������������������������������������������������������������

loc_1DA0:				; CODE XREF: Stdio_Fflush+20j
		mov	ax, [di+6]
		add	ax, [di]
		inc	ax
		mov	si, ax
		sub	[di], si
		push	ax
		mov	ax, [di+8]
		mov	[di+0Ah], ax
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_WriteLowLevel
		add	sp, 6
		cmp	ax, si
		jz	short loc_1DD0
		test	word ptr [di+2], 200h
		jnz	short loc_1DD0
		or	word ptr [di+2], 10h
		jmp	short loc_1D6D
; ���������������������������������������������������������������������������

loc_1DD0:				; CODE XREF: Stdio_Fflush+11j Stdio_Fflush+31j ...
		xor	ax, ax

loc_1DD2:				; CODE XREF: Stdio_Fflush+1Bj
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Fflush	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1DD6	proc far		; CODE XREF: sub_4C58B+24P
					; sub_4F1A7+43P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 2Fh
		int	21h		; DOS -	GET DISK TRANSFER AREA ADDRESS
					; Return: ES:BX	-> DTA
		push	es
		push	bx
		mov	ah, 1Ah
		mov	dx, [bp+arg_2]
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		mov	ah, 4Eh	; 'N'
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_0]
		int	21h		; DOS -	2+ - FIND FIRST	ASCIZ (FINDFIRST)
					; CX = search attributes
					; DS:DX	-> ASCIZ filespec
					; (drive, path,	and wildcards allowed)
		pushf
		pop	cx
		xchg	ax, bx
		mov	ah, 1Ah
		pop	dx
		pop	ds
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		push	cx
		popf
		pop	ds
		jb	short loc_1E03
		xor	ax, ax
		jmp	short loc_1E07
; ���������������������������������������������������������������������������

loc_1E03:				; CODE XREF: sub_1DD6+27j
		push	bx
		call	CRT_ClampMathIndex

loc_1E07:				; CODE XREF: sub_1DD6+2Bj
		pop	bp
		retf
sub_1DD6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1E09	proc far		; CODE XREF: sub_4C58B+82P
					; sub_4F1A7+188P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 2Fh
		int	21h		; DOS -	GET DISK TRANSFER AREA ADDRESS
					; Return: ES:BX	-> DTA
		push	es
		push	bx
		mov	ah, 1Ah
		mov	dx, [bp+arg_0]
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		mov	ah, 4Fh
		int	21h		; DOS -	2+ - FIND NEXT ASCIZ (FINDNEXT)
					; [DTA]	= data block from
					; last AH = 4Eh/4Fh call
		pushf
		pop	cx
		xchg	ax, bx
		mov	ah, 1Ah
		pop	dx
		pop	ds
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		push	cx
		popf
		pop	ds
		jb	short loc_1E30
		xor	ax, ax
		jmp	short loc_1E34
; ���������������������������������������������������������������������������

loc_1E30:				; CODE XREF: sub_1E09+21j
		push	bx
		call	CRT_ClampMathIndex

loc_1E34:				; CODE XREF: sub_1E09+25j
		pop	bp
		retf
sub_1E09	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1E36	proc far		; CODE XREF: Stdio_Fflush+Ep

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	[bp+var_2], 0
		mov	di, word_48756
		mov	si, 55F6h
		jmp	short loc_1E60
; ���������������������������������������������������������������������������

loc_1E4C:				; CODE XREF: sub_1E36+2Fj
		test	word ptr [si+2], 3
		jz	short loc_1E5D
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		inc	[bp+var_2]

loc_1E5D:				; CODE XREF: sub_1E36+1Bj
		add	si, 10h

loc_1E60:				; CODE XREF: sub_1E36+14j
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	short loc_1E4C
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1E36	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strrchr_Like
; (sub_2070 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — recherche un caractère en fin de chaîne via sub_2B1C(strlen)+sub_2474 :
; strrchr-like.
; ==============================================================================================
CRT_Strrchr_Like	proc far		; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+45P
					; PagedMemory_ReadFormattedString_2AF2E+232P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		or	di, di
		jnz	short loc_1E80

loc_1E7C:				; CODE XREF: CRT_Strrchr_Like+1Bj
		xor	ax, ax
		jmp	short loc_1EA5
; ���������������������������������������������������������������������������

loc_1E80:				; CODE XREF: CRT_Strrchr_Like+Aj
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E7C
		push	di
		push	si
		push	[bp+arg_2]
		call	Stdio_Fread
		or	ax, ax
		jz	short loc_1EA2
		mov	bx, si
		mov	al, [bx+di-1]
		mov	ah, 0
		jmp	short loc_1EA5
; ���������������������������������������������������������������������������

loc_1EA2:				; CODE XREF: CRT_Strrchr_Like+27j
		mov	ax, 0FFFFh

loc_1EA5:				; CODE XREF: CRT_Strrchr_Like+Ej CRT_Strrchr_Like+30j
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strrchr_Like	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Stdio_CountNewlines
; (sub_20A9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — near — compte les occurrences de '\n' dans un buffer pour ajuster la longueur en mode
; texte (CR/LF) : helper interne stdio.
; ==============================================================================================
Stdio_CountNewlines	proc near		; CODE XREF: Stdio_WriteTextMode+26p seg000:2013p ...

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jge	short loc_1EC0
		mov	dx, [si+6]
		add	dx, [si]
		inc	dx
		mov	di, dx
		jmp	short loc_1ECB
; ���������������������������������������������������������������������������

loc_1EC0:				; CODE XREF: Stdio_CountNewlines+Bj
		mov	ax, [si]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		mov	di, ax

loc_1ECB:				; CODE XREF: Stdio_CountNewlines+15j
		test	word ptr [si+2], 40h
		jnz	short loc_1EFE
		mov	cx, [si+0Ah]
		cmp	word ptr [si], 0
		jge	short loc_1EF7
		jmp	short loc_1EE5
; ���������������������������������������������������������������������������

loc_1EDC:				; CODE XREF: Stdio_CountNewlines+41j
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_1EE5
		inc	di

loc_1EE5:				; CODE XREF: Stdio_CountNewlines+31j Stdio_CountNewlines+39j
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_1EDC
		jmp	short loc_1EFE
; ���������������������������������������������������������������������������

loc_1EEE:				; CODE XREF: Stdio_CountNewlines+53j
		mov	bx, cx
		inc	cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_1EF7
		inc	di

loc_1EF7:				; CODE XREF: Stdio_CountNewlines+2Fj Stdio_CountNewlines+4Bj
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_1EEE

loc_1EFE:				; CODE XREF: Stdio_CountNewlines+27j Stdio_CountNewlines+43j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retn	2
Stdio_CountNewlines	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Stdio_WriteTextMode
; (sub_2106 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — écriture bas niveau d'un buffer FILE* avec traduction CR/LF (sub_20A9) puis
; lseek/write (sub_605) : flush écriture d'un stream texte.
; ==============================================================================================
Stdio_WriteTextMode	proc far		; CODE XREF: Stdio_SetupFileStruct+5Cp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_1F21
		mov	ax, 0FFFFh
		jmp	short loc_1F6A
; ���������������������������������������������������������������������������

loc_1F21:				; CODE XREF: Stdio_WriteTextMode+14j
		cmp	di, 1
		jnz	short loc_1F36
		cmp	word ptr [si], 0
		jle	short loc_1F36
		push	si
		call	Stdio_CountNewlines
		cwd
		sub	[bp+arg_2], ax
		sbb	[bp+arg_4], dx

loc_1F36:				; CODE XREF: Stdio_WriteTextMode+1Ej Stdio_WriteTextMode+23j
		and	word ptr [si+2], 0FE5Fh
		mov	word ptr [si], 0
		mov	ax, [si+8]
		mov	[si+0Ah], ax
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		cmp	dx, 0FFFFh
		jnz	short loc_1F68
		cmp	ax, 0FFFFh
		jnz	short loc_1F68
		mov	ax, 0FFFFh
		jmp	short loc_1F6A
; ���������������������������������������������������������������������������

loc_1F68:				; CODE XREF: Stdio_WriteTextMode+56j Stdio_WriteTextMode+5Bj
		xor	ax, ax

loc_1F6A:				; CODE XREF: Stdio_WriteTextMode+19j Stdio_WriteTextMode+60j
		pop	di
		pop	si
		pop	bp
		retf
Stdio_WriteTextMode	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	ax, 1
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		cmp	dx, 0FFFFh
		jnz	short loc_1FA2
		cmp	ax, 0FFFFh
		jnz	short loc_1FA2
		jmp	loc_202A
; ���������������������������������������������������������������������������

loc_1FA2:				; CODE XREF: seg000:1F98j seg000:1F9Dj
		cmp	word ptr [si], 0
		jge	short loc_201F
		mov	al, [si+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5738h], 800h
		jz	short loc_2012
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		mov	[bp-6],	dx
		mov	[bp-8],	ax
		cmp	dx, 0FFFFh
		jnz	short loc_1FDE
		cmp	ax, 0FFFFh
		jz	short loc_2030

loc_1FDE:				; CODE XREF: seg000:1FD7j
		xor	ax, ax
		push	ax
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		cmp	dx, 0FFFFh
		jnz	short loc_2006
		cmp	ax, 0FFFFh
		jnz	short loc_2006
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		jmp	short loc_2030
; ���������������������������������������������������������������������������

loc_2006:				; CODE XREF: seg000:1FF7j seg000:1FFCj
		mov	ax, [bp-6]
		mov	dx, [bp-8]
		mov	[bp-2],	ax
		mov	[bp-4],	dx

loc_2012:				; CODE XREF: seg000:1FB5j
		push	si
		call	Stdio_CountNewlines
		cwd
		add	[bp-4],	ax
		adc	[bp-2],	dx
		jmp	short loc_202A
; ���������������������������������������������������������������������������

loc_201F:				; CODE XREF: seg000:1FA5j
		push	si
		call	Stdio_CountNewlines
		cwd
		sub	[bp-4],	ax
		sbb	[bp-2],	dx

loc_202A:				; CODE XREF: seg000:1F9Fj seg000:201Dj
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_2030:				; CODE XREF: seg000:1FDCj seg000:2004j
		pop	si
		mov	sp, bp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2035	proc far		; CODE XREF: sub_2B82+8p

var_2		= word ptr -2
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_2]
		push	ds
		pop	es
		assume es:dseg
		or	di, di
		jz	short loc_2060
		mov	al, 0
		mov	ah, [di]
		mov	cx, 0FFFFh
		cld
		repne scasb
		not	cx
		dec	cx
		jz	short loc_2060
		mov	di, word_48894
		or	di, di
		mov	[bp+var_2], di
		jnz	short loc_206B

loc_2060:				; CODE XREF: sub_2035+Fj sub_2035+1Ej	...
		xor	ax, ax
		jmp	short loc_208E
sub_2035	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_2064	proc far		; CODE XREF: CRT_FlushSprintfBuf+13p sub_2064+15j	...
		add	word ptr [bp-2], 2
		mov	di, [bp-2]

loc_206B:				; CODE XREF: sub_2035+29j
		mov	di, [di]
		or	di, di
		jz	short loc_2060
		mov	al, [di]
		or	al, al
		jz	short loc_2060
		cmp	ah, al
		jnz	short near ptr sub_2064
		mov	bx, cx
		cmp	byte ptr [bx+di], 3Dh ;	'='
		jnz	short near ptr sub_2064
		mov	si, [bp+6]
		repe cmpsb
		xchg	cx, bx
		jnz	short near ptr sub_2064
		inc	di
		mov	ax, di

loc_208E:				; CODE XREF: sub_2035+2Dj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2064	endp ; sp =  2


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Itoa_Signed10
; (sub_2235 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — wrapper sprintf %d signé base10 via sub_56B (itoa signé).
; ==============================================================================================
CRT_Itoa_Signed10	proc far		; CODE XREF: Widget_RenderComplexLayout_31810+77P
					; sub_51049+4DFP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		cmp	cx, 0Ah
		jnz	short loc_20A7
		mov	ax, bx
		cwd
		jmp	short loc_20AB
; ���������������������������������������������������������������������������

loc_20A7:				; CODE XREF: CRT_Itoa_Signed10+Cj
		mov	ax, bx
		xor	dx, dx

loc_20AB:				; CODE XREF: CRT_Itoa_Signed10+11j
		push	dx
		push	ax
		push	[bp+arg_2]
		push	cx
		mov	al, 1
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	CRT_Ltoa
		pop	bp
		retf
CRT_Itoa_Signed10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Itoa_Unsigned
; (sub_225D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — wrapper itoa non signé base10.
; ==============================================================================================
CRT_Itoa_Unsigned	proc far		; CODE XREF: Widget_RenderComplexLayout_31810+97P
					; Widget_RenderComplexLayout_31810+D1P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_6]
		mov	al, 0
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	CRT_Ltoa
		pop	bp
		retf
CRT_Itoa_Unsigned	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Itoa_BaseVariant
; (sub_2277 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — wrapper itoa base variable, signé uniquement si base=10.
; ==============================================================================================
CRT_Itoa_BaseVariant	proc far		; CODE XREF: Widget_RenderComplexLayout_31810+B4P
					; sub_52662+68FP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_6]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	[bp+arg_4]
		push	ax
		cmp	ax, 0Ah
		jnz	short loc_20F0
		mov	ax, 1
		jmp	short loc_20F2
; ���������������������������������������������������������������������������

loc_20F0:				; CODE XREF: CRT_Itoa_BaseVariant+13j
		xor	ax, ax

loc_20F2:				; CODE XREF: CRT_Itoa_BaseVariant+18j
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	CRT_Ltoa
		pop	bp
		retf
CRT_Itoa_BaseVariant	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Memmove (sub_229C
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — memmove (rep movsw+movsb) : équivalent _fmemcpy public.
; ==============================================================================================
CRT_Memmove	proc far		; CODE XREF: Stdio_Fread+E4p seg000:25C9p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	cx, [bp+arg_4]
		shr	cx, 1
		cld
		rep movsw
		jnb	short loc_2113
		movsb

loc_2113:				; CODE XREF: CRT_Memmove+15j
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Memmove	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Memset (sub_22BB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; memset (rep stosw+stosb, alignement pair géré).
; ==============================================================================================
CRT_Memset	proc far		; CODE XREF: CRT_Memset_Public+10p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	di
		push	ds
		pop	es
		mov	di, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	al, [bp+arg_4]
		mov	ah, al
		cld
		test	di, 1
		jz	short loc_2136
		jcxz	short loc_213D
		stosb
		dec	cx

loc_2136:				; CODE XREF: CRT_Memset+16j
		shr	cx, 1
		rep stosw
		jnb	short loc_213D
		stosb

loc_213D:				; CODE XREF: CRT_Memset+18j CRT_Memset+20j
		pop	di
		pop	bp
		retf
CRT_Memset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Memset_Public
; (sub_22E1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — wrapper memset avec retour du pointeur : implémentation publique memset().
; ==============================================================================================
CRT_Memset_Public	proc far		; CODE XREF: sub_2B82+C6p
					; Widget_RenderComplexLayout_31810+1AP ...

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr CRT_Memset
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
CRT_Memset_Public	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_215B	proc far		; CODE XREF: seg000:21B3p sub_2789+34p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		mov	ax, [bp+arg_0]
		cmp	ax, [bp+arg_2]
		jnb	short loc_2170
		std
		mov	ax, 1
		jmp	short loc_2173
; ���������������������������������������������������������������������������

loc_2170:				; CODE XREF: sub_215B+Dj
		cld
		xor	ax, ax

loc_2173:				; CODE XREF: sub_215B+13j
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		or	ax, ax
		jz	short loc_2186
		add	si, cx
		dec	si
		add	di, cx
		dec	di

loc_2186:				; CODE XREF: sub_215B+23j
		test	di, 1
		jz	short loc_2190
		jcxz	short loc_219F
		movsb
		dec	cx

loc_2190:				; CODE XREF: sub_215B+2Fj
		sub	si, ax
		sub	di, ax
		shr	cx, 1
		rep movsw
		jnb	short loc_219F
		add	si, ax
		add	di, ax
		movsb

loc_219F:				; CODE XREF: sub_215B+31j sub_215B+3Dj
		cld
		pop	di
		pop	si
		pop	bp
		retf
sub_215B	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+0Ah]
		push	si
		push	word ptr [bp+8]
		push	cs
		call	near ptr sub_215B
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_NullPtrAssign (sub_22FC de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — wrapper sprintf avec
; format fixe (pointeurs 2474h/aNullPointerAss+45h) : probable message runtime 'Null pointer
; assignment'.
; ==============================================================================================
CRT_Msg_NullPtrAssign	proc far		; CODE XREF: sub_30D3+15P sub_310B+46P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 2336h
		push	ax
		mov	ax, 5606h
		push	ax
		push	[bp+arg_0]
		lea	ax, [bp+arg_2]
		push	ax
		call	CRT_Sprintf_Full
		pop	bp
		retf
CRT_Msg_NullPtrAssign	endp ; sp = -8


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Stdio_Ungetc (sub_2313
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — décrémente le compteur d'ungetc puis appelle sub_232C : implémentation ungetc().
; ==============================================================================================
Stdio_Ungetc	proc far		; CODE XREF: Stdio_Fread+169p

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		dec	word ptr [si]
		push	si
		mov	al, [bp+arg_0]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		pop	si
		pop	bp
		retf
Stdio_Ungetc	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_Putc (sub_232C de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far — putc()/fputc() interne : écrit
; un octet dans le buffer FILE*, gère line-buffering (flush sur \n/\r via sub_1F99),
; unbuffered (sub_605), et erreurs matherr-like via sub_2CC7.
; ==============================================================================================
Stdio_Putc	proc far		; CODE XREF: Stdio_Ungetc+11p seg000:232Fp ...

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_2]
		mov	al, [bp+arg_0]
		mov	byte_498A8, al
		cmp	word ptr [di], 0FFFFh
		jge	short loc_223D
		inc	word ptr [di]
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_2215
		jmp	loc_231B
; ���������������������������������������������������������������������������

loc_2215:				; CODE XREF: Stdio_Putc+22j
		cmp	byte_498A8, 0Ah
		jz	short loc_2226
		cmp	byte_498A8, 0Dh
		jz	short loc_2226
		jmp	loc_231B
; ���������������������������������������������������������������������������

loc_2226:				; CODE XREF: Stdio_Putc+2Cj Stdio_Putc+33j
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_2234
		jmp	loc_231B
; ���������������������������������������������������������������������������

loc_2234:				; CODE XREF: Stdio_Putc+41j Stdio_Putc+61j ...
		mov	ax, 0FFFFh
		jmp	loc_2320
; ���������������������������������������������������������������������������
		jmp	loc_231B
; ���������������������������������������������������������������������������

loc_223D:				; CODE XREF: Stdio_Putc+11j
		test	word ptr [di+2], 90h
		jnz	short loc_224B
		test	word ptr [di+2], 2
		jnz	short loc_2251

loc_224B:				; CODE XREF: Stdio_Putc+54j
					; Stdio_Putc+12Aj
		or	word ptr [di+2], 10h
		jmp	short loc_2234
; ���������������������������������������������������������������������������

loc_2251:				; CODE XREF: Stdio_Putc+5Bj
		or	word ptr [di+2], 100h
		cmp	word ptr [di+6], 0
		jz	short loc_22A8
		cmp	word ptr [di], 0
		jz	short loc_226C
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_2234

loc_226C:				; CODE XREF: Stdio_Putc+71j
		mov	ax, [di+6]
		neg	ax
		mov	[di], ax
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	al, byte_498A8
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_2288
		jmp	loc_231B
; ���������������������������������������������������������������������������

loc_2288:				; CODE XREF: Stdio_Putc+95j
		cmp	byte_498A8, 0Ah
		jz	short loc_2299
		cmp	byte_498A8, 0Dh
		jz	short loc_2299
		jmp	loc_231B
; ���������������������������������������������������������������������������

loc_2299:				; CODE XREF: Stdio_Putc+9Fj Stdio_Putc+A6j
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_231B
		jmp	short loc_2234
; ���������������������������������������������������������������������������
		jmp	short loc_231B
; ���������������������������������������������������������������������������

loc_22A8:				; CODE XREF: Stdio_Putc+6Cj
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5738h], 800h
		jz	short loc_22CF
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_22CF:				; CODE XREF: Stdio_Putc+C8j
		cmp	byte_498A8, 0Ah
		jnz	short loc_22F7
		test	word ptr [di+2], 40h
		jnz	short loc_22F7
		mov	ax, 1
		push	ax
		mov	ax, 5876h
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jnz	short loc_2311

loc_22F7:				; CODE XREF: Stdio_Putc+E6j Stdio_Putc+EDj
		mov	ax, 1
		push	ax
		mov	ax, 6888h
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jz	short loc_231B

loc_2311:				; CODE XREF: Stdio_Putc+107j
		test	word ptr [di+2], 200h
		jnz	short loc_231B
		jmp	loc_224B
; ���������������������������������������������������������������������������

loc_231B:				; CODE XREF: Stdio_Putc+24j Stdio_Putc+35j ...
		mov	al, byte_498A8
		mov	ah, 0

loc_2320:				; CODE XREF: Stdio_Putc+49j
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Putc	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, 5606h
		push	ax
		push	word ptr [bp+6]
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_Fread (sub_2474 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — near — 263 lignes, fread() interne :
; boucle getc (sub_232C) ou copie bloc bufferisée selon mode, gère fin de buffer.
; ==============================================================================================
Stdio_Fread	proc near		; CODE XREF: CRT_Strrchr_Like+22p

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		test	word ptr [di+2], 8
		jz	short loc_2378
		jmp	short loc_236B
; ���������������������������������������������������������������������������

loc_2350:				; CODE XREF: Stdio_Fread+3Dj
		push	di
		mov	bx, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [bx]
		cbw
		push	ax
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		cmp	ax, 0FFFFh
		jnz	short loc_236B

loc_2366:				; CODE XREF: Stdio_Fread+6Bj
					; Stdio_Fread:loc_23E5j ...
		xor	ax, ax
		jmp	loc_24D6
; ���������������������������������������������������������������������������

loc_236B:				; CODE XREF: Stdio_Fread+18j Stdio_Fread+2Ej
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_2350
		jmp	loc_24D3
; ���������������������������������������������������������������������������

loc_2378:				; CODE XREF: Stdio_Fread+16j
		test	word ptr [di+2], 40h
		jnz	short loc_2382
		jmp	loc_2474
; ���������������������������������������������������������������������������

loc_2382:				; CODE XREF: Stdio_Fread+47j
		cmp	word ptr [di+6], 0
		jnz	short loc_238B
		jmp	loc_2430
; ���������������������������������������������������������������������������

loc_238B:				; CODE XREF: Stdio_Fread+50j
		mov	ax, [di+6]
		cmp	ax, [bp+arg_2]
		jnb	short loc_23EB
		cmp	word ptr [di], 0
		jz	short loc_23A3
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_2366

loc_23A3:				; CODE XREF: Stdio_Fread+60j
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5738h], 800h
		jz	short loc_23CA
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_23CA:				; CODE XREF: Stdio_Fread+7Bj
		push	[bp+arg_2]
		push	[bp+arg_4]
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, [bp+arg_2]
		jnz	short loc_23E5
		jmp	loc_24D3
; ���������������������������������������������������������������������������

loc_23E5:				; CODE XREF: Stdio_Fread+AAj
		jmp	loc_2366
; ���������������������������������������������������������������������������
		jmp	loc_24D3
; ���������������������������������������������������������������������������

loc_23EB:				; CODE XREF: Stdio_Fread+5Bj
		mov	ax, [di]
		add	ax, [bp+arg_2]
		jl	short loc_240F
		cmp	word ptr [di], 0
		jnz	short loc_2401
		mov	ax, 0FFFFh
		sub	ax, [di+6]
		mov	[di], ax
		jmp	short loc_240F
; ���������������������������������������������������������������������������

loc_2401:				; CODE XREF: Stdio_Fread+BFj
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_240F
		jmp	loc_2366
; ���������������������������������������������������������������������������

loc_240F:				; CODE XREF: Stdio_Fread+BAj Stdio_Fread+C9j ...
		push	[bp+arg_2]
		push	[bp+arg_4]
		push	word ptr [di+0Ah]
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6
		mov	ax, [di]
		add	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_2]
		add	[di+0Ah], ax
		jmp	loc_24D3
; ���������������������������������������������������������������������������

loc_2430:				; CODE XREF: Stdio_Fread+52j
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5738h], 800h
		jz	short loc_2457
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_2457:				; CODE XREF: Stdio_Fread+108j
		push	[bp+arg_2]
		push	[bp+arg_4]
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, [bp+arg_2]
		jz	short loc_24D3
		jmp	loc_2366
; ���������������������������������������������������������������������������
		jmp	short loc_24D3
; ���������������������������������������������������������������������������

loc_2474:				; CODE XREF: Stdio_Fread+49j
		cmp	word ptr [di+6], 0
		jz	short loc_24B8
		jmp	short loc_24AC
; ���������������������������������������������������������������������������

loc_247C:				; CODE XREF: Stdio_Fread+17Ej
		inc	word ptr [di]
		jge	short loc_2494
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	si, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [si]
		mov	[bx], al
		mov	ah, 0
		jmp	short loc_24A4
; ���������������������������������������������������������������������������

loc_2494:				; CODE XREF: Stdio_Fread+148j
		push	di
		mov	bx, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [bx]
		push	ax
		push	cs
		call	near ptr Stdio_Ungetc
		pop	cx
		pop	cx

loc_24A4:				; CODE XREF: Stdio_Fread+15Cj
		cmp	ax, 0FFFFh
		jnz	short loc_24AC
		jmp	loc_2366
; ���������������������������������������������������������������������������

loc_24AC:				; CODE XREF: Stdio_Fread+144j
					; Stdio_Fread+171j
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_247C
		jmp	short loc_24D3
; ���������������������������������������������������������������������������

loc_24B8:				; CODE XREF: Stdio_Fread+142j
		push	[bp+arg_2]
		push	[bp+arg_4]
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_WriteLowLevel
		add	sp, 6
		cmp	ax, [bp+arg_2]
		jz	short loc_24D3
		jmp	loc_2366
; ���������������������������������������������������������������������������

loc_24D3:				; CODE XREF: Stdio_Fread+3Fj Stdio_Fread+ACj ...
		mov	ax, [bp+var_2]

loc_24D6:				; CODE XREF: Stdio_Fread+32j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	6
Stdio_Fread	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_SetupFileStruct (sub_261C de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — 112 lignes,
; initialise les champs d'une structure FILE* (buffer, position, flags [si+2] bits 4/8) :
; setvbuf()/setup interne de flux (fdopen).
; ==============================================================================================
Stdio_SetupFileStruct	proc far		; CODE XREF: seg000:07E3p seg000:081Bp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		cmp	[si+0Eh], si
		jnz	short loc_24FA
		cmp	[bp+arg_4], 2
		jg	short loc_24FA
		cmp	di, 7FFFh
		jbe	short loc_2500

loc_24FA:				; CODE XREF: Stdio_SetupFileStruct+Ej Stdio_SetupFileStruct+14j	...
		mov	ax, 0FFFFh
		jmp	loc_25B2
; ���������������������������������������������������������������������������

loc_2500:				; CODE XREF: Stdio_SetupFileStruct+1Aj
		cmp	word_4889A, 0
		jnz	short loc_2515
		cmp	si, 5606h
		jnz	short loc_2515
		mov	word_4889A, 1
		jmp	short loc_2528
; ���������������������������������������������������������������������������

loc_2515:				; CODE XREF: Stdio_SetupFileStruct+27j Stdio_SetupFileStruct+2Dj
		cmp	word_48898, 0
		jnz	short loc_2528
		cmp	si, 55F6h
		jnz	short loc_2528
		mov	word_48898, 1

loc_2528:				; CODE XREF: Stdio_SetupFileStruct+35j Stdio_SetupFileStruct+3Cj ...
		cmp	word ptr [si], 0
		jz	short loc_2540
		mov	ax, 1
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		push	si
		nop
		push	cs
		call	near ptr Stdio_WriteTextMode
		add	sp, 8

loc_2540:				; CODE XREF: Stdio_SetupFileStruct+4Dj
		test	word ptr [si+2], 4
		jz	short loc_2550
		push	word ptr [si+8]
		call	Heap_FreeAndCoalesce_2C3FC
		pop	cx

loc_2550:				; CODE XREF: Stdio_SetupFileStruct+67j
		and	word ptr [si+2], 0FFF3h
		mov	word ptr [si+6], 0
		mov	ax, si
		add	ax, 5
		mov	[si+8],	ax
		mov	[si+0Ah], ax
		cmp	[bp+arg_4], 2
		jz	short loc_25B0
		or	di, di
		jbe	short loc_25B0
		mov	word ptr off_4860A+2, seg seg000
		mov	word ptr off_4860A, 2F2Ah
		cmp	[bp+arg_2], 0
		jnz	short loc_259A
		push	di
		call	Runtime_StackOverflowCheck_2C319
		pop	cx
		mov	[bp+arg_2], ax
		or	ax, ax
		jnz	short loc_2591
		jmp	loc_24FA
; ���������������������������������������������������������������������������

loc_2591:				; CODE XREF: Stdio_SetupFileStruct+AEj
		or	word ptr [si+2], 4
		jmp	short loc_259A
; ���������������������������������������������������������������������������
		jmp	loc_24FA
; ���������������������������������������������������������������������������

loc_259A:				; CODE XREF: Stdio_SetupFileStruct+A0j Stdio_SetupFileStruct+B7j
		mov	ax, [bp+arg_2]
		mov	[si+0Ah], ax
		mov	[si+8],	ax
		mov	[si+6],	di
		cmp	[bp+arg_4], 1
		jnz	short loc_25B0
		or	word ptr [si+2], 8

loc_25B0:				; CODE XREF: Stdio_SetupFileStruct+8Aj Stdio_SetupFileStruct+8Ej ...
		xor	ax, ax

loc_25B2:				; CODE XREF: Stdio_SetupFileStruct+1Fj
		pop	di
		pop	si
		pop	bp
		retf
Stdio_SetupFileStruct	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+6]
		mov	si, [bp+4]
		push	di
		push	word ptr [bp+8]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6
		add	[si], di
		mov	bx, [si]
		mov	byte ptr [bx], 0
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retn	6

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_Sprintf1 (sub_2945 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — wrapper sprintf
; (sub_1233) avec format fixe 291Dh : génère un message formaté standard (probable message
; d'erreur runtime).
; ==============================================================================================
CRT_Msg_Sprintf1	proc far		; CODE XREF: sub_CE2C+B2P sub_CE2C+CAP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 25B6h
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+arg_4]
		push	ax
		call	CRT_Sprintf_Full
		pop	bp
		retf
CRT_Msg_Sprintf1	endp ; sp = -8


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_Sprintf2 (sub_2962 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — variante de sub_2945,
; arguments passés différemment (sprintf format 291Dh) : sibling wrapper de génération de
; message.
; ==============================================================================================
CRT_Msg_Sprintf2	proc far		; CODE XREF: sub_310B+31P seg024:01ADP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 25B6h
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	CRT_Sprintf_Full
		pop	bp
		retf
CRT_Msg_Sprintf2	endp ; sp = -8


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strcat (sub_29E4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; concatène deux chaînes ASCIIZ (trouve fin via repne scasb x2, puis movsw/movsb) : strcat().
; ==============================================================================================
CRT_Strcat	proc far		; CODE XREF: sub_702F+31P
					; Widget_RenderComplexLayout_31810+1CBP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		mov	di, [bp+arg_0]
		push	ds
		pop	es
		mov	dx, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		lea	si, [di-1]
		mov	di, [bp+arg_2]
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		sub	di, cx
		xchg	si, di
		test	si, 1
		jz	short loc_2644
		movsb
		dec	cx

loc_2644:				; CODE XREF: CRT_Strcat+29j
		shr	cx, 1
		rep movsw
		jnb	short loc_264B
		movsb

loc_264B:				; CODE XREF: CRT_Strcat+31j
		xchg	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strcat	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strchr_WordAligned
; (sub_2A1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — recherche d'un caractère dans une chaîne avec alignement pair/impair
; (lodsb/lodsw) : strchr() optimisé mot.
; ==============================================================================================
CRT_Strchr_WordAligned	proc far		; CODE XREF: sub_4A239+124P
					; sub_4C58B+5EP ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	bl, [bp+arg_2]
		test	si, 1
		jz	short loc_266A
		lodsb
		cmp	al, bl
		jz	short loc_267F
		and	al, al
		jz	short loc_267B

loc_266A:				; CODE XREF: CRT_Strchr_WordAligned+Fj CRT_Strchr_WordAligned+29j
		lodsw
		cmp	al, bl
		jz	short loc_2680
		and	al, al
		jz	short loc_267B
		cmp	ah, bl
		jz	short loc_267F
		and	ah, ah
		jnz	short loc_266A

loc_267B:				; CODE XREF: CRT_Strchr_WordAligned+18j CRT_Strchr_WordAligned+21j
		xor	ax, ax
		jmp	short loc_2683
; ���������������������������������������������������������������������������

loc_267F:				; CODE XREF: CRT_Strchr_WordAligned+14j CRT_Strchr_WordAligned+25j
		inc	si

loc_2680:				; CODE XREF: CRT_Strchr_WordAligned+1Dj
		lea	ax, [si-2]

loc_2683:				; CODE XREF: CRT_Strchr_WordAligned+2Dj
		pop	si
		pop	bp
		retf
CRT_Strchr_WordAligned	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strncmp_Like
; (sub_2A53 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — comparaison de deux chaînes selon longueur de la seconde (repe cmpsb) :
; strncmp-like (bornée par arg_2).
; ==============================================================================================
CRT_Strncmp_Like	proc far		; CODE XREF: sub_9B09+85P
					; sub_C13D+114P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		xor	ax, ax
		mov	bx, ax
		mov	di, [bp+arg_2]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		mov	di, si
		mov	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, [di-1]
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strncmp_Like	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strcpy (sub_2A82 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; copie une chaîne ASCIIZ (strlen puis rep movsb) : strcpy().
; ==============================================================================================
CRT_Strcpy	proc far		; CODE XREF: sub_2B82+A2p sub_2B82+B1p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		cld
		mov	di, [bp+arg_2]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		mov	di, [bp+arg_0]
		rep movsb
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strcpy	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strdup (sub_2AA4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; alloue (sub_5D22B) et copie une chaîne (strlen+1 puis sub_229C) : strdup().
; ==============================================================================================
CRT_Strdup	proc far		; CODE XREF: sub_449C+9AP sub_4CDF+90P ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		inc	ax
		mov	[bp+var_2], ax
		push	ax
		call	Runtime_StackOverflowCheck_2C319
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2707
		push	[bp+var_2]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6

loc_2707:				; CODE XREF: CRT_Strdup+21j
		mov	ax, di
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Strdup	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Stricmp (sub_2ADC
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — comparaison de chaînes insensible à la casse (table de plage 617Ah = A-Z/a-z) : stricmp().
; ==============================================================================================
CRT_Stricmp	proc far		; CODE XREF: sub_4436+26P sub_449C+6DP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		xor	ax, ax
		mov	bx, ax
		mov	cx, 617Ah

loc_2726:				; CODE XREF: CRT_Stricmp+1Fj CRT_Stricmp+38j
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2749
		scasb
		jz	short loc_2726
		cmp	al, ch
		jb	short loc_273A
		cmp	al, cl
		ja	short loc_273A
		sub	al, 20h	; ' '

loc_273A:				; CODE XREF: CRT_Stricmp+23j CRT_Stricmp+27j
		cmp	bl, ch
		jb	short loc_2745
		cmp	bl, cl
		ja	short loc_2745
		sub	bl, 20h	; ' '

loc_2745:				; CODE XREF: CRT_Stricmp+2Dj CRT_Stricmp+31j
		cmp	al, bl
		jz	short loc_2726

loc_2749:				; CODE XREF: CRT_Stricmp+1Cj
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
CRT_Stricmp	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strlen (sub_2B1C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; strlen() (repne scasb).
; ==============================================================================================
CRT_Strlen	proc far		; CODE XREF: CRT_Strrchr_Like+13p CRT_Strdup+Ep	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	di
		mov	ax, ds
		mov	es, ax
		mov	di, [bp+arg_0]
		xor	ax, ax
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	ax, cx
		not	ax
		dec	ax
		pop	di
		pop	bp
		retf
CRT_Strlen	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17 par comparaison avec CRT_Strupr de STRIKE.EXE (même suite
; d'instructions, constantes inversées : retrait de 65, ajout de 97) : passe une chaîne en
; minuscules. Utilisée par TalkingHead_CopyLipText_97D8.
; ==============================================================================================
CRT_Strlwr_2769	proc far		; CODE XREF: TalkingHead_CopyLipText_97D8+28P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2780
; ���������������������������������������������������������������������������

loc_2775:				; CODE XREF: CRT_Strlwr_2769+1Aj
		sub	al, 41h	; 'A'
		cmp	al, 19h
		ja	short loc_2780
		add	al, 61h	; 'a'
		mov	[si-1],	al

loc_2780:				; CODE XREF: CRT_Strlwr_2769+Aj CRT_Strlwr_2769+10j
		lodsb
		and	al, al
		jnz	short loc_2775
		xchg	ax, dx
		pop	si
		pop	bp
		retf
CRT_Strlwr_2769	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2789	proc far		; CODE XREF: sub_59F54+39P
					; sub_BF164+8AP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	[bp+var_2], ax
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	si, ax
		cmp	si, [bp+arg_4]
		jbe	short loc_27B1
		mov	si, [bp+arg_4]

loc_27B1:				; CODE XREF: sub_2789+23j
		push	si
		mov	ax, di
		add	ax, [bp+var_2]
		push	ax
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_215B
		add	sp, 6
		mov	bx, [bp+var_2]
		add	bx, si
		mov	byte ptr [bx+di], 0
		mov	ax, di
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2789	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_27D3	proc far		; CODE XREF: sub_4B544+388P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		mov	di, [bp+arg_2]
		mov	si, di
		mov	ax, [bp+arg_4]
		mov	cx, ax
		jcxz	short loc_2806
		mov	bx, ax
		xor	al, al
		repne scasb
		sub	bx, cx
		mov	cx, bx
		mov	di, si
		mov	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, [di-1]
		xor	ah, ah
		mov	bh, ah
		sub	ax, bx

loc_2806:				; CODE XREF: sub_27D3+14j
		pop	di
		pop	si
		pop	bp
		retf
sub_27D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strncpy_Pad
; (sub_2B6D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — copie bornée avec padding (strlen source, rep movsb puis rep stosb pour
; compléter) : strncpy() avec remplissage.
; ==============================================================================================
CRT_Strncpy_Pad	proc far		; CODE XREF: sub_2B82+D7p
					; sub_2B82+160p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		mov	di, [bp+arg_2]
		mov	si, di
		xor	al, al
		mov	bx, [bp+arg_4]
		mov	cx, bx
		repne scasb
		sub	bx, cx
		mov	di, [bp+arg_0]
		xchg	cx, bx
		rep movsb
		mov	cx, bx
		rep stosb
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strncpy_Pad	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2836	proc far		; CODE XREF: sub_4B544+47FP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		cld
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		xor	ax, ax
		mov	bx, ax
		mov	dx, 617Ah

loc_284E:				; CODE XREF: sub_2836+22j sub_2836+3Bj
		jcxz	short loc_2873
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2873
		scasb
		loope	loc_284E
		cmp	al, dh
		jb	short loc_2864
		cmp	al, dl
		ja	short loc_2864
		sub	al, 20h	; ' '

loc_2864:				; CODE XREF: sub_2836+26j sub_2836+2Aj
		cmp	bl, dh
		jb	short loc_286F
		cmp	bl, dl
		ja	short loc_286F
		sub	bl, 20h	; ' '

loc_286F:				; CODE XREF: sub_2836+30j sub_2836+34j
		cmp	al, bl
		jz	short loc_284E

loc_2873:				; CODE XREF: sub_2836:loc_284Ej
					; sub_2836+1Fj
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
sub_2836	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strupr (sub_2B99 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; met en majuscule en place (soustrait 0x20 sur plage a-z) : strupr().
; ==============================================================================================
CRT_Strupr	proc far		; CODE XREF: seg025:05D0P
					; Widget_RenderComplexLayout_31810+FAP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2890
; ���������������������������������������������������������������������������

loc_2885:				; CODE XREF: CRT_Strupr+1Aj
		sub	al, 61h	; 'a'
		cmp	al, 19h
		ja	short loc_2890
		add	al, 41h	; 'A'
		mov	[si-1],	al

loc_2890:				; CODE XREF: CRT_Strupr+Aj CRT_Strupr+10j
		lodsb
		and	al, al
		jnz	short loc_2885
		xchg	ax, dx
		pop	si
		pop	bp
		retf
CRT_Strupr	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2899	proc far		; CODE XREF: sub_85A+28p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_2B82
		mov	ax, word_488C8
		mov	dx, word_488C6
		add	dx, 0A600h
		adc	ax, 12CEh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	si, [di]
		add	si, 0F844h
		mov	ax, si
		mov	cl, 2
		sar	ax, cl
		cwd
		push	ax
		push	dx
		mov	dx, 786h
		mov	ax, 1F80h
		pop	cx
		pop	bx
		call	CRT_MulExtended32
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		mov	ax, si
		and	ax, 3
		cwd
		push	ax
		push	dx
		mov	dx, 1E1h
		mov	ax, 3380h
		pop	cx
		pop	bx
		call	CRT_MulExtended32
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		test	si, 3
		jz	short loc_2905
		add	[bp+var_4], 5180h
		adc	[bp+var_2], 1

loc_2905:				; CODE XREF: sub_2899+61j
		xor	cx, cx
		mov	al, [di+3]
		cbw
		dec	ax
		mov	si, ax
		jmp	short loc_2918
; ���������������������������������������������������������������������������

loc_2910:				; CODE XREF: sub_2899+81j
		dec	si
		mov	al, [si+587Ch]
		cbw
		add	cx, ax

loc_2918:				; CODE XREF: sub_2899+75j
		or	si, si
		jg	short loc_2910
		mov	al, [di+2]
		cbw
		dec	ax
		add	cx, ax
		cmp	byte ptr [di+3], 2
		jle	short loc_2930
		test	word ptr [di], 3
		jnz	short loc_2930
		inc	cx

loc_2930:				; CODE XREF: sub_2899+8Ej sub_2899+94j
		mov	bx, [bp+arg_2]
		mov	al, [bx+1]
		mov	ah, 0
		push	ax
		mov	ax, cx
		mov	dx, 18h
		imul	dx
		pop	dx
		add	ax, dx
		mov	si, ax
		cmp	word_488CA, 0
		jz	short loc_2964
		mov	al, [bx+1]
		mov	ah, 0
		push	ax
		push	cx
		xor	ax, ax
		push	ax
		mov	ax, [di]
		add	ax, 0F84Eh
		push	ax
		call	sub_2D03
		or	ax, ax
		jz	short loc_2964
		dec	si

loc_2964:				; CODE XREF: sub_2899+B1j sub_2899+C8j
		mov	ax, si
		cwd
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	CRT_MulExtended32
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	ah, 0
		cwd
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 3Ch	; '<'
		pop	cx
		pop	bx
		call	CRT_MulExtended32
		mov	bx, [bp+arg_2]
		mov	bl, [bx+3]
		mov	bh, 0
		push	ax
		mov	ax, bx
		push	dx
		cwd
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		add	[bp+var_4], cx
		adc	[bp+var_2], bx
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2899	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_29B2	proc far		; CODE XREF: seg000:083Ap

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		nop
		push	cs
		call	near ptr sub_2B82
		mov	ax, word_488C8
		mov	dx, word_488C6
		add	dx, 0A600h
		adc	ax, 12CEh
		sub	[bp+arg_0], dx
		sbb	[bp+arg_2], ax
		mov	byte ptr [di+2], 0
		xor	ax, ax
		mov	dx, 3Ch	; '<'
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr CRT_LDiv32
		mov	[di+3],	al
		xor	ax, ax
		mov	dx, 3Ch	; '<'
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_42F
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 3Ch	; '<'
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr CRT_LDiv32
		mov	[di], al
		xor	ax, ax
		mov	dx, 3Ch	; '<'
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_42F
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 88F8h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_42F
		mov	cl, 2
		shl	ax, cl
		add	ax, 7BCh
		mov	[si], ax
		xor	ax, ax
		mov	dx, 88F8h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr CRT_LDiv32
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		cmp	[bp+arg_2], 0
		jl	short loc_2A9C
		jnz	short loc_2A69
		cmp	[bp+arg_0], 2250h
		jb	short loc_2A9C

loc_2A69:				; CODE XREF: sub_29B2+AEj
		sub	[bp+arg_0], 2250h
		sbb	[bp+arg_2], 0
		inc	word ptr [si]
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_42F
		add	[si], ax
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr CRT_LDiv32
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax

loc_2A9C:				; CODE XREF: sub_29B2+ACj sub_29B2+B5j
		cmp	word_488CA, 0
		jz	short loc_2ADD
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr CRT_LDiv32
		push	ax
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_42F
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, [si]
		add	ax, 0F84Eh
		push	ax
		call	sub_2D03
		or	ax, ax
		jz	short loc_2ADD
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0

loc_2ADD:				; CODE XREF: sub_29B2+EFj
					; sub_29B2+121j
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr CRT_LDiv32
		mov	[di+1],	al
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_42F
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0
		test	word ptr [si], 3
		jnz	short loc_2B42
		cmp	[bp+arg_2], 0
		jl	short loc_2B2C
		jg	short loc_2B22
		cmp	[bp+arg_0], 3Ch	; '<'
		jbe	short loc_2B2C

loc_2B22:				; CODE XREF: sub_29B2+168j
		sub	[bp+arg_0], 1
		sbb	[bp+arg_2], 0
		jmp	short loc_2B42
; ���������������������������������������������������������������������������

loc_2B2C:				; CODE XREF: sub_29B2+166j
					; sub_29B2+16Ej
		cmp	[bp+arg_2], 0
		jnz	short loc_2B42
		cmp	[bp+arg_0], 3Ch	; '<'
		jnz	short loc_2B42
		mov	byte ptr [si+3], 2
		mov	byte ptr [si+2], 1Dh
		jmp	short loc_2B7E
; ���������������������������������������������������������������������������

loc_2B42:				; CODE XREF: sub_29B2+160j
					; sub_29B2+178j ...
		mov	byte ptr [si+3], 0
		jmp	short loc_2B5D
; ���������������������������������������������������������������������������

loc_2B48:				; CODE XREF: sub_29B2+1BAj
					; sub_29B2+1C1j
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+587Ch]
		cbw
		cwd
		sub	[bp+arg_0], ax
		sbb	[bp+arg_2], dx
		inc	byte ptr [si+3]

loc_2B5D:				; CODE XREF: sub_29B2+194j
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+587Ch]
		cbw
		cwd
		cmp	dx, [bp+arg_2]
		jl	short loc_2B48
		jnz	short loc_2B75
		cmp	ax, [bp+arg_0]
		jb	short loc_2B48

loc_2B75:				; CODE XREF: sub_29B2+1BCj
		inc	byte ptr [si+3]
		mov	al, byte ptr [bp+arg_0]
		mov	[si+2],	al

loc_2B7E:				; CODE XREF: sub_29B2+18Ej
		pop	di
		pop	si
		pop	bp
		retf
sub_29B2	endp ; sp = -18h


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_2B82	proc far		; CODE XREF: sub_2899+Dp sub_29B2+Dp
					; DATA XREF: ...
		push	si
		push	di
		mov	ax, 58ACh
		push	ax
		nop
		push	cs
		call	near ptr sub_2035
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2C08
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 4
		jb	short loc_2C08
		mov	al, [di]
		cbw
		mov	bx, ax
		mov	al, [bx+54E9h]
		cbw
		test	ax, 0Ch
		jz	short loc_2C08
		mov	al, [di+1]
		cbw
		mov	bx, ax
		mov	al, [bx+54E9h]
		cbw
		test	ax, 0Ch
		jz	short loc_2C08
		mov	al, [di+2]
		cbw
		mov	bx, ax
		mov	al, [bx+54E9h]
		cbw
		test	ax, 0Ch
		jz	short loc_2C08
		cmp	byte ptr [di+3], 2Dh ; '-'
		jz	short loc_2BE8
		cmp	byte ptr [di+3], 2Bh ; '+'
		jz	short loc_2BE8
		mov	al, [di+3]
		cbw
		mov	bx, ax
		test	byte ptr [bx+54E9h], 2
		jz	short loc_2C08

loc_2BE8:				; CODE XREF: sub_2B82+51j sub_2B82+57j
		mov	al, [di+3]
		cbw
		mov	bx, ax
		mov	al, [bx+54E9h]
		cbw
		test	ax, 2
		jnz	short loc_2C3B
		mov	al, [di+4]
		cbw
		mov	bx, ax
		mov	al, [bx+54E9h]
		cbw
		test	ax, 2
		jnz	short loc_2C3B

loc_2C08:				; CODE XREF: sub_2B82+10j sub_2B82+1Cj ...
		mov	word_488CA, 1
		mov	word_488C8, 0
		mov	word_488C6, 4650h
		mov	ax, 58AFh
		push	ax
		push	word_488C2
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		mov	ax, 58B3h
		push	ax
		push	word_488C4
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		jmp	loc_2D00
; ���������������������������������������������������������������������������

loc_2C3B:				; CODE XREF: sub_2B82+74j sub_2B82+84j
		mov	ax, 4
		push	ax
		xor	ax, ax
		push	ax
		push	word_488C4
		nop
		push	cs
		call	near ptr CRT_Memset_Public
		add	sp, 6
		mov	ax, 3
		push	ax
		push	di
		push	word_488C2
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_488C2
		mov	byte ptr [bx+3], 0
		mov	ax, di
		add	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_1CBD
		pop	cx
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	CRT_MulExtended32
		mov	word_488C8, dx
		mov	word_488C6, ax
		mov	word_488CA, 0
		mov	si, 3
		jmp	short loc_2CF9
; ���������������������������������������������������������������������������

loc_2C91:				; CODE XREF: sub_2B82+17Cj
		mov	bx, si
		mov	al, [bx+di]
		cbw
		mov	bx, ax
		test	byte ptr [bx+54E9h], 0Ch
		jz	short loc_2CF8
		mov	ax, di
		add	ax, si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 3
		jb	short loc_2D00
		mov	bx, di
		mov	al, [bx+si+1]
		cbw
		mov	bx, ax
		mov	al, [bx+54E9h]
		cbw
		test	ax, 0Ch
		jz	short loc_2D00
		mov	bx, di
		mov	al, [bx+si+2]
		cbw
		mov	bx, ax
		mov	al, [bx+54E9h]
		cbw
		test	ax, 0Ch
		jz	short loc_2D00
		mov	ax, 3
		push	ax
		mov	ax, di
		add	ax, si
		push	ax
		push	word_488C4
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_488C4
		mov	byte ptr [bx+3], 0
		mov	word_488CA, 1
		jmp	short loc_2D00
; ���������������������������������������������������������������������������

loc_2CF8:				; CODE XREF: sub_2B82+11Bj
		inc	si

loc_2CF9:				; CODE XREF: sub_2B82+10Dj
		mov	bx, si
		cmp	byte ptr [bx+di], 0
		jnz	short loc_2C91

loc_2D00:				; CODE XREF: sub_2B82+B6j
					; sub_2B82+12Bj ...
		pop	di
		pop	si
		retf
sub_2B82	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2D03	proc near		; CODE XREF: sub_2899+C3p
					; sub_29B2+11Cp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		cmp	[bp+arg_2], 0
		jnz	short loc_2D39
		mov	si, [bp+arg_4]
		cmp	[bp+arg_4], 3Bh	; ';'
		jb	short loc_2D22
		mov	ax, [bp+arg_0]
		add	ax, 46h	; 'F'
		test	ax, 3
		jnz	short loc_2D22
		dec	si

loc_2D22:				; CODE XREF: sub_2D03+11j sub_2D03+1Cj
		mov	[bp+arg_2], 0
		jmp	short loc_2D2C
; ���������������������������������������������������������������������������

loc_2D29:				; CODE XREF: sub_2D03+32j
		inc	[bp+arg_2]

loc_2D2C:				; CODE XREF: sub_2D03+24j
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bx+5888h], si
		jbe	short loc_2D29
		jmp	short loc_2D5A
; ���������������������������������������������������������������������������

loc_2D39:				; CODE XREF: sub_2D03+8j
		mov	bx, [bp+arg_2]
		dec	bx
		shl	bx, 1
		mov	ax, [bx+5888h]
		add	[bp+arg_4], ax
		cmp	[bp+arg_2], 3
		jbe	short loc_2D5A
		mov	ax, [bp+arg_0]
		add	ax, 46h	; 'F'
		test	ax, 3
		jnz	short loc_2D5A
		inc	[bp+arg_4]

loc_2D5A:				; CODE XREF: sub_2D03+34j sub_2D03+47j ...
		cmp	[bp+arg_2], 4
		jb	short loc_2DDB
		jz	short loc_2D6A
		cmp	[bp+arg_2], 0Ah
		ja	short loc_2DDB
		jnz	short loc_2DD6

loc_2D6A:				; CODE XREF: sub_2D03+5Dj
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bp+arg_0], 10h
		jle	short loc_2D84
		cmp	[bp+arg_2], 4
		jnz	short loc_2D84
		mov	cx, [bx+5886h]
		add	cx, 7
		jmp	short loc_2D88
; ���������������������������������������������������������������������������

loc_2D84:				; CODE XREF: sub_2D03+70j sub_2D03+76j
		mov	cx, [bx+5888h]

loc_2D88:				; CODE XREF: sub_2D03+7Fj
		mov	bx, [bp+arg_0]
		add	bx, 7B2h
		test	bl, 3
		jz	short loc_2D95
		dec	cx

loc_2D95:				; CODE XREF: sub_2D03+8Fj
		mov	bx, [bp+arg_0]
		inc	bx
		sar	bx, 1
		sar	bx, 1
		add	bx, cx
		mov	ax, 16Dh
		mul	[bp+arg_0]
		add	ax, bx
		add	ax, 4
		xor	dx, dx
		mov	bx, 7
		div	bx
		sub	cx, dx
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_2], 4
		jnz	short loc_2DCA
		cmp	ax, cx
		ja	short loc_2DD6
		jnz	short loc_2DDB
		cmp	[bp+arg_6], 2
		jb	short loc_2DDB
		jmp	short loc_2DD6
; ���������������������������������������������������������������������������

loc_2DCA:				; CODE XREF: sub_2D03+B7j
		cmp	ax, cx
		jb	short loc_2DD6
		jnz	short loc_2DDB
		cmp	[bp+arg_6], 1
		ja	short loc_2DDB

loc_2DD6:				; CODE XREF: sub_2D03+65j sub_2D03+BBj ...
		mov	ax, 1
		jmp	short loc_2DDD
; ���������������������������������������������������������������������������

loc_2DDB:				; CODE XREF: sub_2D03+5Bj sub_2D03+63j ...
		xor	ax, ax

loc_2DDD:				; CODE XREF: sub_2D03+D6j
		pop	si
		pop	bp
		retn	8
sub_2D03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_WriteLowLevel (sub_2BB9 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — 166 lignes, écriture
; bas niveau DOS d'un buffer (utilisée par sub_1F99/sub_232C) : implémentation write() de bas
; niveau du runtime stdio.
; ==============================================================================================
Stdio_WriteLowLevel	proc far		; CODE XREF: Stdio_Fflush+64p
					; Stdio_Fread+18Fp

var_88		= word ptr -88h
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 88h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	di, word_48756
		jb	short loc_2E01
		mov	ax, 6
		push	ax
		call	CRT_ClampMathIndex
		jmp	loc_2EEA
; ���������������������������������������������������������������������������

loc_2E01:				; CODE XREF: Stdio_WriteLowLevel+13j
		mov	ax, [bp+arg_4]
		inc	ax
		cmp	ax, 2
		jnb	short loc_2E0F
		xor	ax, ax
		jmp	loc_2EEA
; ���������������������������������������������������������������������������

loc_2E0F:				; CODE XREF: Stdio_WriteLowLevel+26j
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+5738h], 800h
		jz	short loc_2E2E
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		push	di
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_2E2E:				; CODE XREF: Stdio_WriteLowLevel+37j
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+5738h], 4000h
		jnz	short loc_2E4A
		push	[bp+arg_4]
		push	si
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		jmp	loc_2EEA
; ���������������������������������������������������������������������������

loc_2E4A:				; CODE XREF: Stdio_WriteLowLevel+56j
		mov	bx, di
		shl	bx, 1
		and	word ptr [bx+5738h], 0FDFFh
		mov	[bp+var_6], si
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		jmp	short loc_2EAE
; ���������������������������������������������������������������������������

loc_2E5F:				; CODE XREF: Stdio_WriteLowLevel+D4j
		dec	[bp+var_2]
		mov	bx, [bp+var_6]
		inc	[bp+var_6]
		mov	al, [bx]
		mov	[bp+var_3], al
		cmp	al, 0Ah
		jnz	short loc_2E75
		mov	byte ptr [si], 0Dh
		inc	si

loc_2E75:				; CODE XREF: Stdio_WriteLowLevel+8Dj
		mov	al, [bp+var_3]
		mov	[si], al
		inc	si
		lea	ax, [bp+var_88]
		mov	dx, si
		sub	dx, ax
		cmp	dx, 80h	; '�'
		jl	short loc_2EB2
		sub	si, ax
		push	si
		push	ax
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		mov	dx, ax
		cmp	ax, si
		jz	short loc_2EAE
		cmp	dx, 0FFFFh
		jnz	short loc_2EA6

loc_2EA1:				; CODE XREF: Stdio_WriteLowLevel+FAj
		mov	ax, 0FFFFh
		jmp	short loc_2EE5
; ���������������������������������������������������������������������������

loc_2EA6:				; CODE XREF: Stdio_WriteLowLevel+BDj
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_2]
		jmp	short loc_2EE1
; ���������������������������������������������������������������������������

loc_2EAE:				; CODE XREF: Stdio_WriteLowLevel+7Bj Stdio_WriteLowLevel+B8j
		lea	si, [bp+var_88]

loc_2EB2:				; CODE XREF: Stdio_WriteLowLevel+A5j
		cmp	[bp+var_2], 0
		jnz	short loc_2E5F
		lea	ax, [bp+var_88]
		sub	si, ax
		mov	ax, si
		or	ax, ax
		jbe	short loc_2EE7
		push	si
		lea	ax, [bp+var_88]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		mov	dx, ax
		cmp	ax, si
		jz	short loc_2EE7
		cmp	dx, 0FFFFh
		jz	short loc_2EA1
		mov	ax, [bp+arg_4]

loc_2EE1:				; CODE XREF: Stdio_WriteLowLevel+CAj
		add	ax, dx
		sub	ax, si

loc_2EE5:				; CODE XREF: Stdio_WriteLowLevel+C2j
		jmp	short loc_2EEA
; ���������������������������������������������������������������������������

loc_2EE7:				; CODE XREF: Stdio_WriteLowLevel+E0j Stdio_WriteLowLevel+F5j
		mov	ax, [bp+arg_4]

loc_2EEA:				; CODE XREF: Stdio_WriteLowLevel+1Cj Stdio_WriteLowLevel+2Aj ...
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Stdio_WriteLowLevel	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_ErrorHandler (sub_2CC7 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — 44 lignes, gestion
; d'erreur de stream avec messages fixes (4D7Ch/5EA8h) : probable handler d'erreur
; matherr/ferror.
; ==============================================================================================
Stdio_ErrorHandler	proc far		; CODE XREF: Stdio_Putc+FEp
					; Stdio_Putc+118p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		test	word ptr [bx+5738h], 1
		jz	short loc_2F06
		mov	ax, 5
		push	ax
		jmp	short loc_2F25
; ���������������������������������������������������������������������������

loc_2F06:				; CODE XREF: Stdio_ErrorHandler+Ej
		mov	ah, 40h	; '@'
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		jb	short loc_2F24
		push	ax
		mov	bx, [bp+arg_0]
		shl	bx, 1
		or	word ptr [bx+5738h], 1000h
		pop	ax
		jmp	short loc_2F28
; ���������������������������������������������������������������������������

loc_2F24:				; CODE XREF: Stdio_ErrorHandler+23j
		push	ax

loc_2F25:				; CODE XREF: Stdio_ErrorHandler+14j
		call	CRT_ClampMathIndex

loc_2F28:				; CODE XREF: Stdio_ErrorHandler+32j
		pop	bp
		retf
Stdio_ErrorHandler	endp

; ���������������������������������������������������������������������������
		push	si
		push	di
		mov	di, 4
		mov	si, 55F6h
		jmp	short loc_2F46
; ���������������������������������������������������������������������������

loc_2F34:				; CODE XREF: seg000:2F48j
		test	word ptr [si+2], 3
		jz	short loc_2F42
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx

loc_2F42:				; CODE XREF: seg000:2F39j
		dec	di
		add	si, 10h

loc_2F46:				; CODE XREF: seg000:2F32j
		or	di, di
		jnz	short loc_2F34
		pop	di
		pop	si
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra1
; (sub_2D24 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster memoire/chaînes, à approfondir si besoin) probable variante
; memcmp/memmove additionnelle du runtime.
; ==============================================================================================
CRT_MemFamily_Extra1	proc far		; CODE XREF: sub_1EC4C+53P
					; sub_1F5A1+D4P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		les	di, [bp+arg_0]
		assume es:nothing
		lds	si, [bp+arg_4]
		mov	cx, [bp+arg_8]
		shr	cx, 1
		cld
		rep movsw
		jnb	short loc_2F65
		movsb

loc_2F65:				; CODE XREF: CRT_MemFamily_Extra1+15j
		mov	ds, dx
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra2
; (sub_2D48 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra2	proc far		; CODE XREF: sub_702F+29CP
					; Path_Build_C82C+1FP	...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		push	ds
		les	di, [bp+arg_0]
		mov	dx, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		push	es
		lea	si, [di-1]
		les	di, [bp+arg_4]
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		sub	di, cx
		push	es
		pop	ds
		pop	es
		xchg	si, di
		test	si, 1
		jz	short loc_2FA1
		movsb
		dec	cx

loc_2FA1:				; CODE XREF: CRT_MemFamily_Extra2+2Cj
		shr	cx, 1
		rep movsw
		jnb	short loc_2FA8
		movsb

loc_2FA8:				; CODE XREF: CRT_MemFamily_Extra2+34j
		xchg	ax, dx
		mov	dx, es
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra3
; (sub_2D87 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra3	proc far		; CODE XREF: sub_C86D+12P

arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		cld
		push	ds
		lds	si, [bp+arg_0]
		mov	bl, [bp+arg_4]
		test	si, 1
		jz	short loc_2FCB
		lodsb
		cmp	al, bl
		jz	short loc_2FE3
		and	al, al
		jz	short loc_2FDC

loc_2FCB:				; CODE XREF: CRT_MemFamily_Extra3+10j CRT_MemFamily_Extra3+2Aj
		lodsw
		cmp	al, bl
		jz	short loc_2FE4
		and	al, al
		jz	short loc_2FDC
		cmp	ah, bl
		jz	short loc_2FE3
		and	ah, ah
		jnz	short loc_2FCB

loc_2FDC:				; CODE XREF: CRT_MemFamily_Extra3+19j CRT_MemFamily_Extra3+22j
		pop	ds
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2FEA
; ���������������������������������������������������������������������������

loc_2FE3:				; CODE XREF: CRT_MemFamily_Extra3+15j CRT_MemFamily_Extra3+26j
		inc	si

loc_2FE4:				; CODE XREF: CRT_MemFamily_Extra3+1Ej
		lea	ax, [si-2]
		mov	dx, ds
		pop	ds

loc_2FEA:				; CODE XREF: CRT_MemFamily_Extra3+31j
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra5
; (sub_2DF4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra5	proc far		; CODE XREF: sub_6734+11P Path_Build_C82C+FP	...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		les	di, [bp+arg_4]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		push	ds
		mov	ax, es
		mov	ds, ax
		les	di, [bp+arg_0]
		rep movsb
		pop	ds
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra6
; (sub_2E1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra6	proc far		; CODE XREF: sub_632E+C5P sub_64EE+A5P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+arg_0]
		xor	ax, ax
		cmp	ax, word ptr [bp+arg_0+2]
		jnz	short loc_3028
		cmp	ax, di
		jz	short loc_3032

loc_3028:				; CODE XREF: CRT_MemFamily_Extra6+Cj
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	ax, cx
		not	ax
		dec	ax

loc_3032:				; CODE XREF: CRT_MemFamily_Extra6+10j
		pop	di
		pop	bp
		retf
CRT_MemFamily_Extra6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra7
; (sub_2E3C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra7	proc far		; CODE XREF: seg049:06BAP seg049:1274P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		cld
		les	di, [bp+arg_4]
		mov	si, di
		mov	ax, [bp+arg_8]
		mov	cx, ax
		jcxz	short loc_3067
		mov	bx, ax
		xor	al, al
		repne scasb
		sub	bx, cx
		mov	cx, bx
		mov	di, si
		lds	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, es:[di-1]
		xor	ah, ah
		mov	bh, ah
		sub	ax, bx

loc_3067:				; CODE XREF: CRT_MemFamily_Extra7+12j
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra8
; (sub_2E74 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra8	proc far		; CODE XREF: sub_14DB3+56P
					; sub_15147+20P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		les	di, [bp+arg_4]
		mov	si, di
		xor	al, al
		mov	bx, [bp+arg_8]
		mov	cx, bx
		repne scasb
		sub	bx, cx
		push	ds
		mov	di, es
		mov	ds, di
		les	di, [bp+arg_0]
		xchg	cx, bx
		rep movsb
		mov	cx, bx
		rep stosb
		pop	ds
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra8	endp

; ���������������������������������������������������������������������������
		db 52h,	75h, 6Eh, 74h, 69h, 6Dh, 65h, 20h, 6Fh,	76h, 65h
		db 72h,	6Ch, 61h, 79h, 20h, 65h, 2 dup(72h), 6Fh, 72h
		db 0Dh,	0Ah
; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR VROOMM_DemandLoadDispatch_4000C

loc_30B5:				; CODE XREF: seg166:0505J
					; VROOMM_DemandLoadDispatch_4000C:loc_40082J
		mov	cx, 17h
		mov	dx, 309Eh
		push	cs
		pop	ds
		assume ds:seg000
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		mov	ax, 4
		push	ax
		mov	ax, seg	dseg
		mov	ds, ax
		assume ds:dseg
		nop
		push	cs
		call	near ptr CRT_Abort
; END OF FUNCTION CHUNK	FOR VROOMM_DemandLoadDispatch_4000C
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_4. PRESS KEYPAD "+" TO EXPAND]
; ���������������������������������������������������������������������������

; Segment type:	Pure code
