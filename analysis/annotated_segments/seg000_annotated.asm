seg000		segment	byte public 'CODE' use16
		assume cs:seg000
		assume es:nothing, ss:seg339, ds:nothing, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


		public EntryPoint_RuntimeInit
; ==============================================================================================
; Point d'entrée EXE : init runtime overlay manager Borland (calcul heap/pile, relocation bloc
; mémoire via INT21 4Ah, zero-init BSS), branche vers loc_2AD (init C runtime).
; ==============================================================================================
EntryPoint_RuntimeInit		proc near		; DATA XREF: seg216:off_69E9Eo
		mov	dx, seg	seg339
		mov	cs:word_2C4, dx
		mov	ah, 30h
		int	21h		; DOS -	GET DOS	VERSION
					; Return: AL = major version number (00h for DOS 1.x)

loc_C:					; CODE XREF: seg154:0038J
		mov	bp, ds:2
		mov	bx, ds:2Ch
		mov	ds, dx
		assume ds:seg339
		mov	word_6D142, ax
		mov	word_6D140, es

loc_1D:					; DATA XREF: ModuleRegistry_HookTimerIRQ_5FCCA:loc_5FCD4r
					; ModuleRegistry_HookTimerIRQ_5FCCA+37w ...
		mov	word_6D13C, bx

loc_21:					; DATA XREF: ModuleRegistry_HookTimerIRQ_5FCCA+Fr
					; ModuleRegistry_HookTimerIRQ_5FCCA+3Cw ...
		mov	word_6D158, bp
		call	CRT_SaveIntVectors
		mov	ax, word_6D13C
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
		mov	word_6D13A, cx
		mov	cx, 1
		shl	bx, cl
		add	bx, 8
		and	bx, 0FFF8h
		mov	word_6D13E, bx
		mov	dx, ds
		sub	bp, dx
		mov	di, word_6D4B4
		cmp	di, 200h
		jnb	short loc_6E
		mov	di, 200h
		mov	word_6D4B4, di

loc_6E:					; CODE XREF: EntryPoint_RuntimeInit+65j
		add	di, 5EAAh
		jb	short loc_9C
		add	di, word_71C98
		jb	short loc_9C
		mov	cl, 4
		shr	di, cl
		inc	di
		cmp	bp, di
		jb	short loc_9C
		cmp	word_6D4B4, 0
		jz	short loc_91
		cmp	word_71C98, 0
		jnz	short loc_9F

loc_91:					; CODE XREF: EntryPoint_RuntimeInit+88j
		mov	di, 1000h
		cmp	bp, di
		ja	short loc_9F
		mov	di, bp
		jmp	short loc_9F
; ���������������������������������������������������������������������������

loc_9C:					; CODE XREF: EntryPoint_RuntimeInit+39j	EntryPoint_RuntimeInit+72j ...
		jmp	loc_2AD
; ���������������������������������������������������������������������������

loc_9F:					; CODE XREF: EntryPoint_RuntimeInit+8Fj	EntryPoint_RuntimeInit+96j ...
		mov	bx, di
		add	bx, dx
		mov	word_6D150, bx
		mov	word_6D154, bx
		mov	ax, word_6D140
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
		mov	es, cs:word_2C4
		mov	di, 4F64h
		mov	cx, 5EAAh
		sub	cx, di
		cld
		rep stosb
		cmp	word_71C6E, 14h
		jbe	short loc_120
		cmp	byte ptr word_6D142, 3
		jb	short loc_120
		ja	short loc_E9
		cmp	byte ptr word_6D142+1, 1Eh
		jb	short loc_120

loc_E9:					; CODE XREF: EntryPoint_RuntimeInit+E0j
		mov	ax, 5801h
		mov	bx, 2
		int	21h		; DOS -	3+ - GET/SET MEMORY ALLOCATION STRATEGY
					; AL = function	code: set allocation strategy
		jb	short loc_11D
		mov	ah, 67h	; 'g'
		mov	bx, word_71C6E
		int	21h		; DOS -	3.3+ - SET HANDLE COUNT
					; BX = desired number of handles (max 255)
		jb	short loc_11D
		mov	ah, 48h	; 'H'
		mov	bx, 1
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jb	short loc_11D
		inc	ax
		mov	word_6D158, ax
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
		jmp	loc_2AD
; ���������������������������������������������������������������������������

loc_120:				; CODE XREF: EntryPoint_RuntimeInit+D7j	EntryPoint_RuntimeInit+DEj ...
		mov	ah, 0
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	word_6D146, dx
		mov	word_6D148, cx
		or	al, al
		jz	short loc_13C
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	bx, 70h	; 'p'
		mov	byte ptr es:[bx], 1

loc_13C:				; CODE XREF: EntryPoint_RuntimeInit+12Ej
		xor	bp, bp
		mov	es, cs:word_2C4
		assume es:nothing
		mov	si, 4D8Ah
		mov	di, 4EC8h
		call	CRT_RunAtexitTable_MinPrio
		push	word_6D138
		push	word_6D136
		push	word_6D134
		call	Program_InitVideoFontArgs
		push	ax
		nop
		push	cs
		call	near ptr CRT_Exit
EntryPoint_RuntimeInit		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — copie mémoire (memcpy-like via sub_264) 4EC8h→4F64h : init table du overlay manager.
; ==============================================================================================
Ovl_CopyStubTable		proc far		; CODE XREF: CRT_ExitSequence+26p
		mov	es, cs:word_2C4
		push	si
		push	di
		mov	si, 4EC8h
		mov	di, 4F64h
		call	CRT_RunInitTable_MaxPrio
		pop	di
		pop	si
		retf
Ovl_CopyStubTable		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — checksum 16-bit sur 47 octets de la table overlay ; si ≠0D5Ch → erreur fatale via
; sub_2A5.
; ==============================================================================================
Ovl_ChecksumStub		proc far		; CODE XREF: CRT_ExitSequence+34p
		push	si
		push	di
		mov	es, cs:word_2C4
		xor	ax, ax
		mov	si, ax
		mov	cx, 2Fh	; '/'

loc_184:				; CODE XREF: Ovl_ChecksumStub+15j
		add	al, es:[si]
		adc	ah, 0
		inc	si
		loop	loc_184
		sub	ax, 0D5Ch
		jz	short loc_19B
		mov	cx, 19h
		mov	dx, 2Fh	; '/'
		call	CRT_WriteStderrRaw

loc_19B:				; CODE XREF: Ovl_ChecksumStub+1Aj
		pop	di
		pop	si
		retf
Ovl_ChecksumStub		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — exit(code) : DOS INT21 AH=4Ch.
; ==============================================================================================
CRT_ExitDOS		proc near		; CODE XREF: CRT_ExitSequence+4Ep
		mov	bp, sp
		mov	ah, 4Ch	; 'L'
		mov	al, [bp+4]
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
CRT_ExitDOS		endp			; AL = exit code

; ���������������������������������������������������������������������������
		mov	cx, 0Eh
		mov	dx, 48h	; 'H'
		jmp	loc_2B3

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — sauvegarde vecteurs INT 00h/04h/05h/06h (INT21 AH=35h) puis installe handler custom
; sur INT00h (divide-by-zero trap).
; ==============================================================================================
CRT_SaveIntVectors		proc near		; CODE XREF: EntryPoint_RuntimeInit+25p
		push	ds
		mov	ax, 3500h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr aNullPointerAss+45h, bx
		mov	word ptr unk_6D126, es
		mov	ax, 3504h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_6D128, bx
		mov	word ptr dword_6D128+2,	es
		mov	ax, 3505h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_6D12C, bx
		mov	word ptr dword_6D12C+2,	es
		mov	ax, 3506h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_6D130, bx
		mov	word ptr dword_6D130+2,	es
		mov	ax, 2500h
		mov	dx, cs
		mov	ds, dx
		assume ds:seg000
		mov	dx, 1A7h
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		assume ds:seg339
		retn
CRT_SaveIntVectors		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — restaure les vecteurs d'interruption sauvegardés par sub_1B0 (INT21 AH=25h), cleanup à
; l'exit.
; ==============================================================================================
CRT_RestoreIntVectors		proc far		; CODE XREF: CRT_ExitSequence+2Fp
		push	ds
		mov	ax, 2500h
		lds	dx, dword ptr aNullPointerAss+45h
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2504h
		lds	dx, dword_6D128
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2505h
		lds	dx, dword_6D12C
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2506h
		lds	dx, dword_6D130
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		retf
CRT_RestoreIntVectors		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — dispatcher table 6 octets/entrée : cherche l'entrée de priorité minimale non traitée
; et l'exécute ; boucle jusqu'à épuisement (exit-handlers ordonnés, type atexit).
; ==============================================================================================
CRT_RunAtexitTable_MinPrio		proc near		; CODE XREF: EntryPoint_RuntimeInit+149p CRT_RunAtexitTable_MinPrio+3Aj ...
		mov	ax, 100h
		mov	dx, di
		mov	bx, si

loc_227:				; CODE XREF: CRT_RunAtexitTable_MinPrio+22j
		cmp	bx, di
		jz	short loc_244
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_23F
		mov	cl, es:[bx+1]
		xor	ch, ch
		cmp	cx, ax
		jnb	short loc_23F
		mov	ax, cx
		mov	dx, bx

loc_23F:				; CODE XREF: CRT_RunAtexitTable_MinPrio+Fj CRT_RunAtexitTable_MinPrio+19j
		add	bx, 6
		jmp	short loc_227
; ���������������������������������������������������������������������������

loc_244:				; CODE XREF: CRT_RunAtexitTable_MinPrio+9j
		cmp	dx, di
		jz	short locret_263
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_25C
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunAtexitTable_MinPrio
; ���������������������������������������������������������������������������

loc_25C:				; CODE XREF: CRT_RunAtexitTable_MinPrio+33j
		call	word ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunAtexitTable_MinPrio
; ���������������������������������������������������������������������������

locret_263:				; CODE XREF: CRT_RunAtexitTable_MinPrio+26j
		retn
CRT_RunAtexitTable_MinPrio		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — variante de sub_220 cherchant la priorité MAXIMALE (init-handlers/constructeurs
; statiques, ordre croissant).
; ==============================================================================================
CRT_RunInitTable_MaxPrio		proc near		; CODE XREF: Ovl_CopyStubTable+Dp CRT_RunInitTable_MaxPrio+37j ...
		mov	ah, 0
		mov	dx, di
		mov	bx, si

loc_26A:				; CODE XREF: CRT_RunInitTable_MaxPrio+1Fj
		cmp	bx, di
		jz	short loc_285
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_280
		cmp	es:[bx+1], ah
		jb	short loc_280
		mov	ah, es:[bx+1]
		mov	dx, bx

loc_280:				; CODE XREF: CRT_RunInitTable_MaxPrio+Ej CRT_RunInitTable_MaxPrio+14j
		add	bx, 6
		jmp	short loc_26A
; ���������������������������������������������������������������������������

loc_285:				; CODE XREF: CRT_RunInitTable_MaxPrio+8j
		cmp	dx, di
		jz	short locret_2A4
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_29D
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunInitTable_MaxPrio
; ���������������������������������������������������������������������������

loc_29D:				; CODE XREF: CRT_RunInitTable_MaxPrio+30j
		call	word ptr es:[bx+2]
		pop	es
		jmp	short CRT_RunInitTable_MaxPrio
; ���������������������������������������������������������������������������

locret_2A4:				; CODE XREF: CRT_RunInitTable_MaxPrio+23j
		retn
CRT_RunInitTable_MaxPrio		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — écrit sur handle 2 (stderr) via INT21 AH=40h : impression message d'erreur fatale.
; ==============================================================================================
CRT_WriteStderrRaw		proc near		; CODE XREF: Ovl_ChecksumStub+22p seg000:02B8p
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		retn
CRT_WriteStderrRaw		endp

; ���������������������������������������������������������������������������

loc_2AD:				; CODE XREF: EntryPoint_RuntimeInit:loc_9Cj
					; EntryPoint_RuntimeInit:loc_11Dj ...
		mov	cx, 1Eh
		mov	dx, (offset aNullPointerAss+27h)

loc_2B3:				; CODE XREF: seg000:01ADj
		mov	ds, cs:word_2C4
		call	CRT_WriteStderrRaw
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr CRT_Abort
; ���������������������������������������������������������������������������
word_2C4	dw 0			; DATA XREF: EntryPoint_RuntimeInit+3w EntryPoint_RuntimeInit+C2r ...
		db 2, 80h, 52h,	75h, 6Eh, 74h, 69h, 6Dh, 65h, 20h, 6Fh
		db 76h,	65h, 72h, 6Ch, 61h, 79h, 20h, 65h, 2 dup(72h)
		db 6Fh,	72h, 0Dh, 0Ah
; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR VROOMM_ApplyRelocationsMain_687E8

loc_2DF:				; CODE XREF: seg212:loc_68741J
					; VROOMM_ApplyRelocationsMain_687E8:loc_6885EJ
		mov	cx, 17h
		mov	dx, 2C8h
		push	cs
		pop	ds
		assume ds:seg000
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		mov	ax, 4
		push	ax
		mov	ax, seg	seg339
		mov	ds, ax
		assume ds:seg339
		nop
		push	cs
		call	near ptr CRT_Abort
; END OF FUNCTION CHUNK	FOR VROOMM_ApplyRelocationsMain_687E8
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_1. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — valeur absolue 16-bit (abs(ax)).
; ==============================================================================================
CRT_Abs16		proc far		; CODE XREF: ConfigOption_ApplyAndDisplayB_6698F+34P
					; ConfigOption_ApplyAndDisplayB_6698F+59P
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		or	ax, ax
		jge	short loc_309
		neg	ax

loc_309:				; CODE XREF: CRT_Abs16+8j
		pop	bp
		retf
CRT_Abs16		endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	word_71A1E, 20h	; ' '
		jnz	short loc_31A
		mov	ax, 1
		jmp	short loc_336
; ���������������������������������������������������������������������������

loc_31A:				; CODE XREF: seg000:0313j
		mov	bx, word_71A1E
		mov	cl, 2
		shl	bx, cl
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		mov	[bx+5E26h], ax
		mov	[bx+5E24h], dx
		inc	word_71A1E
		xor	ax, ax

loc_336:				; CODE XREF: seg000:0318j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — wrapper 1 argument vers sub_5D30E (probable free() near).
; ==============================================================================================
CRT_FreeNear_Wrap		proc far		; CODE XREF: CRT_Doprnt_Core+1A8p seg032:07D5P ...
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		call	Heap_FreeAndCoalesce_5D30E
		pop	cx
		pop	bp
		retf
CRT_FreeNear_Wrap		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — compare segment ds à l'argument pointeur ; dispatch vers sub_5D30E (1 arg, near) ou
; sub_5D937 (2 args, far) : free() polymorphe near/far.
; ==============================================================================================
CRT_Free_NearOrFar		proc far		; CODE XREF: Goal_FollowAllyExec+202P
					; seg134:0031P	...
		push	bp
		mov	bp, sp
		mov	ax, ds
		cmp	[bp+8],	ax
		jnz	short loc_35B
		push	word ptr [bp+6]
		call	Heap_FreeAndCoalesce_5D30E
		pop	cx
		jmp	short loc_368
; ���������������������������������������������������������������������������

loc_35B:				; CODE XREF: CRT_Free_NearOrFar+8j
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	Runtime_HeapFreeHook_5D937
		pop	cx
		pop	cx

loc_368:				; CODE XREF: CRT_Free_NearOrFar+13j
		pop	bp
		retf
CRT_Free_NearOrFar		endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_2. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — séquence de fin de programme runtime C : exécute table de terminate-handlers
; (word_71A1E/off_71B22), restaure interruptions (sub_1F3/sub_176 checksum), exit conditionnel
; via sub_19E. Cœur de exit()/_exit().
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
		jnz	short loc_398
		jmp	short loc_388
; ���������������������������������������������������������������������������

loc_378:				; CODE XREF: CRT_ExitSequence+22j
		dec	word_71A1E
		mov	bx, word_71A1E
		mov	cl, 2
		shl	bx, cl
		call	dword ptr [bx+5E24h]

loc_388:				; CODE XREF: CRT_ExitSequence+Bj
		cmp	word_71A1E, 0
		jnz	short loc_378
		nop
		push	cs
		call	near ptr Ovl_CopyStubTable
		call	off_71B22

loc_398:				; CODE XREF: CRT_ExitSequence+9j
		nop
		push	cs
		call	near ptr CRT_RestoreIntVectors
		nop
		push	cs
		call	near ptr Ovl_ChecksumStub
		cmp	[bp+arg_2], 0
		jnz	short loc_3BD
		or	si, si
		jnz	short loc_3B4
		call	off_71B26
		call	off_71B2A

loc_3B4:				; CODE XREF: CRT_ExitSequence+3Fj
		push	[bp+arg_0]
		nop
		push	cs
		call	CRT_ExitDOS
		pop	cx

loc_3BD:				; CODE XREF: CRT_ExitSequence+3Bj
		pop	si
		pop	bp
		retn	6
CRT_ExitSequence		endp ; sp = -2


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — wrapper exit(code) → sub_36B(0,0,code).
; ==============================================================================================
CRT_Exit		proc far		; CODE XREF: EntryPoint_RuntimeInit+160p Program_InitVideoFontArgs+24EP ...

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
; far — wrapper _exit/abort(code) flag=1 → sub_36B(1,0,code).
; ==============================================================================================
CRT_Abort		proc far		; CODE XREF: seg000:02C1p
					; VROOMM_ApplyRelocationsMain_687E8-684EFp

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
; far — memcpy générique (rep movsw+movsb) : équivalent _fmemcpy.
; ==============================================================================================
CRT_Fmemcpy		proc far		; CODE XREF: Camera_CopyState+7CP
					; UIScreen_BuildFormattedText_54CC9+7DP ...

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

; ==============================================================================================
; far — wrapper getvect() (INT21 AH=35h).
; ==============================================================================================
CRT_GetVect		proc far		; CODE XREF: JoystickCallback_RegisterInChain_664D5+1FP

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
; far — wrapper setvect() (INT21 AH=25h).
; ==============================================================================================
CRT_SetVect		proc far		; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461+49P
					; JoystickCallback_RegisterInChain_664D5+36P

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

; ���������������������������������������������������������������������������
		pop	cx
		push	cs
		push	cx
		xor	cx, cx
		jmp	short loc_456
; ���������������������������������������������������������������������������
		pop	cx
		push	cs
		push	cx
		mov	cx, 1
		jmp	short loc_456

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — division longue signée 32-bit logicielle avec gestion signe/arrondi : runtime helper
; ldiv/lxdiv.
; ==============================================================================================
CRT_LDiv32		proc far		; CODE XREF: CRT_Doscan_Core+BBp

arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h

		pop	cx
		push	cs
		push	cx
		mov	cx, 2
		jmp	short loc_456
; ���������������������������������������������������������������������������
		pop	cx
		push	cs
		push	cx
		mov	cx, 3

loc_456:				; CODE XREF: seg000:043Ej seg000:0446j ...
		push	bp
		push	si
		push	di
		mov	bp, sp
		mov	di, cx
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]

loc_463:				; DATA XREF: Video_ReadCRTCPortBase_5E7D6:loc_5E7DCr
		mov	bx, [bp+arg_A]
		mov	cx, [bp+arg_C]
		or	cx, cx
		jnz	short loc_475
		or	dx, dx
		jz	short loc_4DA
		or	bx, bx
		jz	short loc_4DA

loc_475:				; CODE XREF: CRT_LDiv32+23j
		test	di, 1
		jnz	short loc_497
		or	dx, dx
		jns	short loc_489
		neg	dx
		neg	ax
		sbb	dx, 0
		or	di, 0Ch

loc_489:				; CODE XREF: CRT_LDiv32+35j
		or	cx, cx
		jns	short loc_497
		neg	cx
		neg	bx
		sbb	cx, 0
		xor	di, 4

loc_497:				; CODE XREF: CRT_LDiv32+31j CRT_LDiv32+43j
		mov	bp, cx
		mov	cx, 20h	; ' '
		push	di
		xor	di, di
		xor	si, si

loc_4A1:				; CODE XREF: CRT_LDiv32:loc_4B8j
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_4B8
		ja	short loc_4B3
		cmp	si, bx
		jb	short loc_4B8

loc_4B3:				; CODE XREF: CRT_LDiv32+65j
		sub	si, bx
		sbb	di, bp
		inc	ax

loc_4B8:				; CODE XREF: CRT_LDiv32+63j CRT_LDiv32+69j
		loop	loc_4A1
		pop	bx
		test	bx, 2
		jz	short loc_4C7
		mov	ax, si
		mov	dx, di
		shr	bx, 1

loc_4C7:				; CODE XREF: CRT_LDiv32+77j
		test	bx, 4
		jz	short loc_4D4
		neg	dx
		neg	ax
		sbb	dx, 0

loc_4D4:				; CODE XREF: CRT_LDiv32+83j CRT_LDiv32+9Dj
		pop	di
		pop	si
		pop	bp
		retf	8
; ���������������������������������������������������������������������������

loc_4DA:				; CODE XREF: CRT_LDiv32+27j CRT_LDiv32+2Bj
		div	bx
		test	di, 2
		jz	short loc_4E3
		xchg	ax, dx

loc_4E3:				; CODE XREF: CRT_LDiv32+98j
		xor	dx, dx
		jmp	short loc_4D4
CRT_LDiv32		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — clamp d'un index (-48..+87) avec table lookup (4BECh) et flag d'erreur global
; (word_71C9A) : probable borne d'une table math (exp/log).
; ==============================================================================================
CRT_ClampMathIndex		proc near		; CODE XREF: seg000:0528p CRT_Lseek+23p	...

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jl	short loc_507
		cmp	si, 58h	; 'X'   ; DATA XREF: VROOMM_AllocateAndRelocate_6855F+26r
		jle	short loc_4FA	; DATA XREF: VROOMM_AllocateAndRelocate_6855F+2Ar

loc_4F7:				; CODE XREF: CRT_ClampMathIndex:loc_50Cj
		mov	si, 57h	; 'W'

loc_4FA:				; CODE XREF: CRT_ClampMathIndex+Ej
		mov	word_71C9A, si
		mov	al, [si+4BECh]	; DATA XREF: VROOMM_AllocateAndRelocate_6855F+39w

loc_502:				; DATA XREF: VROOMM_AllocateAndRelocate_6855F:loc_68574r
		cbw
		mov	si, ax
		jmp	short loc_514
; ���������������������������������������������������������������������������

loc_507:				; CODE XREF: CRT_ClampMathIndex+9j
		neg	si
		cmp	si, 30h	; '0'

loc_50C:				; DATA XREF: VROOMM_AllocateAndRelocate_6855F+41w
					; VROOMM_AllocateAndRelocate_6855F+4Bw
		jg	short loc_4F7
		mov	word_71C9A, 0FFFFh

loc_514:				; CODE XREF: CRT_ClampMathIndex+1Ej
		mov	word_6D144, si
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
; far — isatty() : IOCTL GET DEVICE INFO (INT21 AH=44h), teste bit device (0x80).
; ==============================================================================================
CRT_IsAtty		proc far		; CODE XREF: seg000:0DE1p seg000:0E19p

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
; far — normalise le signe d'une paire dx:ax selon le signe d'un second opérande : brique de
; division/modulo signé 32-bit.
; ==============================================================================================
CRT_NormalizeSign32		proc far		; CODE XREF: seg030:19E9P seg030:1A22P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	[bp+arg_2], 0
		jg	short loc_563
		jl	short loc_554
		cmp	[bp+arg_0], 0
		jnb	short loc_563

loc_554:				; CODE XREF: CRT_NormalizeSign32+9j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		neg	dx
		neg	ax
		sbb	dx, 0
		jmp	short loc_569
; ���������������������������������������������������������������������������

loc_563:				; CODE XREF: CRT_NormalizeSign32+7j CRT_NormalizeSign32+Fj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_569:				; CODE XREF: CRT_NormalizeSign32+1Ej
		pop	bp
		retf
CRT_NormalizeSign32		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — conversion entier→chaîne (itoa/ultoa) avec base variable et signe optionnel : runtime
; C _ltoa.
; ==============================================================================================
CRT_Ltoa		proc near		; CODE XREF: seg000:05FEp
					; CRT_Sprintf_Full+216p ...

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
		assume es:seg339
		mov	bx, [bp+arg_4]
		cmp	bx, 24h	; '$'
		ja	short loc_5D9
		cmp	bl, 2
		jb	short loc_5D9
		mov	ax, [bp+arg_8]
		mov	cx, [bp+arg_A]
		or	cx, cx
		jge	short loc_5A1
		cmp	[bp+arg_2], 0
		jz	short loc_5A1
		mov	byte ptr [di], 2Dh ; '-'
		inc	di
		neg	cx
		neg	ax
		sbb	cx, 0

loc_5A1:				; CODE XREF: CRT_Ltoa+23j CRT_Ltoa+29j
		lea	si, [bp+var_22]
		jcxz	short loc_5B5

loc_5A6:				; CODE XREF: CRT_Ltoa+48j
		xchg	ax, cx
		sub	dx, dx
		div	bx
		xchg	ax, cx
		div	bx
		mov	[si], dl
		inc	si
		jcxz	short loc_5BC
		jmp	short loc_5A6
; ���������������������������������������������������������������������������

loc_5B5:				; CODE XREF: CRT_Ltoa+39j CRT_Ltoa+53j
		sub	dx, dx
		div	bx
		mov	[si], dl
		inc	si

loc_5BC:				; CODE XREF: CRT_Ltoa+46j
		or	ax, ax
		jnz	short loc_5B5
		lea	cx, [bp+var_22]
		neg	cx
		add	cx, si
		cld

loc_5C8:				; CODE XREF: CRT_Ltoa+6Cj
		dec	si
		mov	al, [si]
		sub	al, 0Ah
		jnb	short loc_5D3
		add	al, 3Ah	; ':'
		jmp	short loc_5D6
; ���������������������������������������������������������������������������

loc_5D3:				; CODE XREF: CRT_Ltoa+62j
		add	al, [bp+arg_0]

loc_5D6:				; CODE XREF: CRT_Ltoa+66j
		stosb
		loop	loc_5C8

loc_5D9:				; CODE XREF: CRT_Ltoa+14j CRT_Ltoa+19j
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
; far — wrapper lseek() (INT21 AH=42h) avec gestion d'erreur via sub_4E7.
; ==============================================================================================
CRT_Lseek		proc far		; CODE XREF: Stdio_WriteTextMode+4Dp seg000:2189p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		and	word ptr [bx+4BC0h], 0FDFFh
		mov	ah, 42h	; 'B'
		mov	al, [bp+arg_6]
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method:
					; 0-from beginnig,1-from current,2-from	end
		jb	short loc_627
		jmp	short loc_62C
; ���������������������������������������������������������������������������

loc_627:				; CODE XREF: CRT_Lseek+1Ej
		push	ax
		call	CRT_ClampMathIndex
		cwd

loc_62C:				; CODE XREF: CRT_Lseek+20j
		pop	bp
		retf
CRT_Lseek		endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, word ptr dword_72F54+2
		mov	dx, word ptr dword_72F54
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		mov	word ptr dword_72F54+2,	ax
		mov	word ptr dword_72F54, dx
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		mov	sp, bp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — allocation avec retry sur errno global (dword_72F54), appelle sub_5D22B : variante
; malloc courte 16-bit.
; ==============================================================================================
CRT_Malloc16_Retry		proc far		; CODE XREF: CRT_Doprnt_Dispatch+8Bp
					; AI_Sensor_TargetVelocityCache+17BP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_66A
		mov	ax, si
		jmp	short loc_66D
; ���������������������������������������������������������������������������

loc_66A:				; CODE XREF: CRT_Malloc16_Retry+Cj
		mov	ax, 1

loc_66D:				; CODE XREF: CRT_Malloc16_Retry+10j
		mov	si, ax
		jmp	short loc_675
; ���������������������������������������������������������������������������

loc_671:				; CODE XREF: CRT_Malloc16_Retry+32j
		call	dword_72F54

loc_675:				; CODE XREF: CRT_Malloc16_Retry+17j
		push	si
		call	Runtime_StackOverflowCheck_5D22B
		pop	cx
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_68C
		mov	ax, word ptr dword_72F54
		or	ax, word ptr dword_72F54+2
		jnz	short loc_671

loc_68C:				; CODE XREF: CRT_Malloc16_Retry+29j
		mov	ax, [bp+var_2]
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc16_Retry		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — variante 32-bit de sub_658 : normalise dx:ax à 1 si zéro, retry sur dword_72F54 via
; sub_5D90E.
; ==============================================================================================
CRT_Malloc32_Retry		proc far		; CODE XREF: CRT_Doscan_Core+97p
					; CRT_Doscan_Core+127p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_6AA
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	short loc_6AF
; ���������������������������������������������������������������������������

loc_6AA:				; CODE XREF: CRT_Malloc32_Retry+Cj
		xor	dx, dx
		mov	ax, 1

loc_6AF:				; CODE XREF: CRT_Malloc32_Retry+14j
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		jmp	short loc_6BB
; ���������������������������������������������������������������������������

loc_6B7:				; CODE XREF: CRT_Malloc32_Retry+45j
		call	dword_72F54

loc_6BB:				; CODE XREF: CRT_Malloc32_Retry+21j
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	PagedResourceB_Read_5D90E
		pop	cx
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jnz	short loc_6DB
		mov	ax, word ptr dword_72F54
		or	ax, word ptr dword_72F54+2
		jnz	short loc_6B7

loc_6DB:				; CODE XREF: CRT_Malloc32_Retry+3Cj
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc32_Retry		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — multiplication étendue 16x16→32 avec accumulation croisée (ax*bx+cx*si) : helper mul
; 32-bit.
; ==============================================================================================
CRT_MulExtended32		proc near		; CODE XREF: CRT_Rand+Ep PIT_DelayLoop+1Cp ...
		push	si
		xchg	ax, si
		xchg	ax, dx
		test	ax, ax
		jz	short loc_6EE
		mul	bx

loc_6EE:				; CODE XREF: CRT_MulExtended32+5j
		jcxz	short loc_6F5
		xchg	ax, cx
		mul	si
		add	ax, cx

loc_6F5:				; CODE XREF: CRT_MulExtended32:loc_6EEj
		xchg	ax, si
		mul	bx
		add	dx, si
		pop	si
		retn
CRT_MulExtended32		endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	word_71CF8, 0
		mov	word_71CF6, ax
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — générateur pseudo-aléatoire congruentiel linéaire (constantes 4E35h/1, seed 32-bit
; word_71CF6/71CF8) : runtime rand().
; ==============================================================================================
CRT_Rand		proc far		; CODE XREF: Pilot_SkillCheck_B0+15P Pilot_SkillCheck_B7+15P ...
		mov	cx, word_71CF8
		mov	bx, word_71CF6
		mov	dx, 15Ah
		mov	ax, 4E35h
		call	CRT_MulExtended32
		add	ax, 1
		adc	dx, 0
		mov	word_71CF8, dx
		mov	word_71CF6, ax
		mov	ax, word_71CF8
		cwd
		and	ax, 7FFFh
		retf
CRT_Rand		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — wrapper unlink() (INT21 AH=41h) avec gestion erreur via sub_4E7.
; ==============================================================================================
CRT_Unlink		proc far		; CODE XREF: SaveGame_ReadFile_A1173:loc_A1225P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 41h	; 'A'
		mov	dx, [bp+arg_0]
		int	21h		; DOS -	2+ - DELETE A FILE (UNLINK)
					; DS:DX	-> ASCIZ pathname of file to delete (no	wildcards allowed)
		jb	short loc_743
		xor	ax, ax
		jmp	short loc_747
; ���������������������������������������������������������������������������

loc_743:				; CODE XREF: CRT_Unlink+Aj
		push	ax
		call	CRT_ClampMathIndex

loc_747:				; CODE XREF: CRT_Unlink+Ej
		pop	bp
		retf
CRT_Unlink		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — sprintf/vsprintf variadique (multi-chunks 0x776/0x925/0x9E8/0xBB2, buffer 42 octets
; local) : cœur du formatteur d'impression runtime C.
; ==============================================================================================
CRT_Sprintf_Core		proc near		; CODE XREF: CRT_Msg_Sprintf3+16p seg000:29DCp

var_2A		= word ptr -2Ah
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

; FUNCTION CHUNK AT 0776 SIZE 0000014A BYTES
; FUNCTION CHUNK AT 0925 SIZE 0000006D BYTES
; FUNCTION CHUNK AT 09E8 SIZE 0000016A BYTES
; FUNCTION CHUNK AT 0BB2 SIZE 00000006 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		jmp	short loc_776
CRT_Sprintf_Core		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — helper va_arg interne : lit un argument (near ou far selon flag bit 0x20) et avance
; le pointeur variadique, utilisé par sub_749.
; ==============================================================================================
CRT_VaArgHelper		proc near		; CODE XREF: CRT_Sprintf_Core:loc_8A3p
					; seg000:0912p	...
		mov	di, [bp+0Ch]
		test	byte ptr [bp-1], 20h
		jz	short loc_76D
		les	di, [di]
		add	word ptr [bp+0Ch], 4
		retn
; ���������������������������������������������������������������������������

loc_76D:				; CODE XREF: CRT_VaArgHelper+7j
		mov	di, [di]
		push	ds
		pop	es
		assume es:seg339
		add	word ptr [bp+0Ch], 2
		retn
CRT_VaArgHelper		endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Sprintf_Core

loc_776:				; CODE XREF: CRT_Sprintf_Core+12j
		push	es
		cld

loc_778:				; CODE XREF: CRT_Sprintf_Core:loc_8AFj
					; seg000:loc_922j ...
		mov	si, [bp+arg_6]

loc_77B:				; CODE XREF: CRT_Sprintf_Core+80j CRT_Sprintf_Core+84j
		lodsb
		or	al, al
		jz	short loc_7DE
		cmp	al, 25h	; '%'
		jz	short loc_7E1

loc_784:				; CODE XREF: CRT_Sprintf_Core+C1j
		cbw
		xchg	ax, di
		inc	[bp+var_6]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_7BA
		cbw
		or	di, di
		js	short loc_7CB
		cmp	byte ptr [di+4C4Ah], 1
		jnz	short loc_7CB

loc_7A0:				; CODE XREF: CRT_Sprintf_Core+6Fj
		xchg	ax, bx
		or	bl, bl
		js	short loc_7BD
		cmp	byte ptr [bx+4C4Ah], 1
		jnz	short loc_7BD
		inc	[bp+var_6]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		or	ax, ax
		jg	short loc_7A0

loc_7BA:				; CODE XREF: CRT_Sprintf_Core+49j
		jmp	loc_B11		; default
; ���������������������������������������������������������������������������

loc_7BD:				; CODE XREF: CRT_Sprintf_Core+5Aj CRT_Sprintf_Core+61j
		push	[bp+arg_4]
		push	bx
		call	[bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_6]
		jmp	short loc_77B
; ���������������������������������������������������������������������������

loc_7CB:				; CODE XREF: CRT_Sprintf_Core+4Ej CRT_Sprintf_Core+55j
		cmp	ax, di
		jz	short loc_77B
		push	[bp+arg_4]
		push	ax
		call	[bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_6]
		jmp	loc_B25		; case 0x0
; ���������������������������������������������������������������������������

loc_7DE:				; CODE XREF: CRT_Sprintf_Core+35j
		jmp	loc_B25		; case 0x0
; ���������������������������������������������������������������������������

loc_7E1:				; CODE XREF: CRT_Sprintf_Core+39j
		mov	[bp+var_A], 0FFFFh
		mov	[bp+var_1], 0

loc_7EA:				; CODE XREF: CRT_Sprintf_Core+CBj CRT_Sprintf_Core+D5j ...
		lodsb
		cbw
		mov	[bp+arg_6], si
		xchg	ax, di
		or	di, di
		jl	short loc_80D
		mov	bl, [di+4C4Ah]
		xor	bh, bh
		cmp	bx, 15h		; switch 22 cases
		jbe	short loc_802
		jmp	loc_B11		; default
; ���������������������������������������������������������������������������

loc_802:				; CODE XREF: CRT_Sprintf_Core+B4j
		shl	bx, 1
		jmp	cs:off_BB8[bx]	; switch jump

loc_809:				; DATA XREF: seg000:off_BB8o
		xchg	ax, di		; case 0x3
		jmp	loc_784
; ���������������������������������������������������������������������������

loc_80D:				; CODE XREF: CRT_Sprintf_Core+A9j
		jmp	loc_B25		; case 0x0
; ���������������������������������������������������������������������������

loc_810:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		or	[bp+var_1], 1	; case 0x4
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_816:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		sub	di, 30h	; '0'   ; case 0x5
		xchg	di, [bp+var_A]
		or	di, di
		jl	short loc_7EA
		mov	ax, 0Ah
		mul	di
		add	[bp+var_A], ax
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_82A:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		or	[bp+var_1], 8	; case 0xB
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_830:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		or	[bp+var_1], 4	; case 0xD
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_836:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		or	[bp+var_1], 2	; case 0xC
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_83C:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		and	[bp+var_1], 0DFh ; case	0x14
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_842:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		or	[bp+var_1], 20h	; case 0x15
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_848:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		mov	ax, [bp+var_6]	; case 0x11
		sub	dx, dx
		test	[bp+var_1], 1
		jz	short loc_8A3
		jmp	short loc_7EA
; ���������������������������������������������������������������������������

loc_855:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		mov	si, 8		; case 0xE
		jmp	short loc_866
; ���������������������������������������������������������������������������

loc_85A:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		mov	si, 0Ah		; case 0x7
		jmp	short loc_866
; ���������������������������������������������������������������������������

loc_85F:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		mov	si, 10h		; case 0x12
		jmp	short loc_866
; ���������������������������������������������������������������������������

loc_864:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		xor	si, si		; case 0x9

loc_866:				; CODE XREF: CRT_Sprintf_Core+10Fj CRT_Sprintf_Core+114j ...
		test	di, 20h
		jnz	short loc_875
		cmp	di, 58h	; 'X'
		jz	short loc_875
		or	[bp+var_1], 4

loc_875:				; CODE XREF: CRT_Sprintf_Core+121j CRT_Sprintf_Core+126j
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, [bp+var_A]
		and	ax, 7FFFh
		push	ax
		push	si
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	CRT_ScanInt_FromStream
		add	sp, 0Eh
		cmp	[bp+var_8], 0
		jle	short loc_8B2
		test	[bp+var_1], 1
		jnz	short loc_8AF
		inc	[bp+var_4]

loc_8A3:				; CODE XREF: CRT_Sprintf_Core+108j
		call	CRT_VaArgHelper
		stosw
		test	[bp+var_1], 4
		jz	short loc_8AF
		xchg	ax, dx
		stosw

loc_8AF:				; CODE XREF: CRT_Sprintf_Core+155j CRT_Sprintf_Core+162j
		jmp	loc_778
; ���������������������������������������������������������������������������

loc_8B2:				; CODE XREF: CRT_Sprintf_Core+14Fj
		jl	short loc_8B7
		jmp	loc_B25		; case 0x0
; ���������������������������������������������������������������������������

loc_8B7:				; CODE XREF: CRT_Sprintf_Core:loc_8B2j
		jmp	loc_B11		; default
; ���������������������������������������������������������������������������

loc_8BA:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		call	$+3		; case 0x13
		jmp	loc_B2C
; END OF FUNCTION CHUNK	FOR CRT_Sprintf_Core
; ���������������������������������������������������������������������������
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		and	word ptr [bp-0Ah], 7FFFh
		call	$+3
		jmp	loc_B52
; ���������������������������������������������������������������������������
		push	dx
		cmp	al, 3Ah	; ':'
		jz	short loc_8F1
		or	ax, ax
		jle	short loc_8EC
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]

loc_8EC:				; CODE XREF: seg000:08DEj
		pop	dx
		mov	bx, ds
		jmp	short loc_90C
; ���������������������������������������������������������������������������

loc_8F1:				; CODE XREF: seg000:08DAj
		call	$+3
		jmp	loc_B52
; ���������������������������������������������������������������������������
		pop	bx
		or	ax, ax
		jle	short loc_90C
		push	dx
		push	bx
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		pop	bx
		pop	dx

loc_90C:				; CODE XREF: seg000:08EFj seg000:08FAj
		test	byte ptr [bp-1], 1
		jnz	short loc_922
		call	CRT_VaArgHelper
		inc	word ptr [bp-4]
		xchg	ax, dx
		stosw
		test	byte ptr [bp-1], 20h
		jz	short loc_922
		xchg	ax, bx
		stosw

loc_922:				; CODE XREF: seg000:0910j seg000:091Ej
		jmp	loc_778
; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Sprintf_Core

loc_925:				; CODE XREF: CRT_Sprintf_Core+23Ej
		jmp	loc_B11		; default
; ���������������������������������������������������������������������������

loc_928:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		lea	ax, [bp+var_8]	; case 0xA
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, 7FFFh
		and	ax, [bp+var_A]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	Heap_ErrHandler2
		add	sp, 0Ch
		cmp	[bp+var_8], 0
		jle	short loc_984
		mov	al, [bp+var_1]
		cbw
		test	ax, 1
		jnz	short loc_97E
		call	CRT_VaArgHelper
		inc	[bp+var_4]
		test	[bp+var_1], 4
		jz	short loc_966
		mov	ax, 4
		jmp	short loc_973
; ���������������������������������������������������������������������������

loc_966:				; CODE XREF: CRT_Sprintf_Core+216j
		test	[bp+var_1], 8
		jz	short loc_971
		mov	ax, 8
		jmp	short loc_973
; ���������������������������������������������������������������������������

loc_971:				; CODE XREF: CRT_Sprintf_Core+221j
		xor	ax, ax

loc_973:				; CODE XREF: CRT_Sprintf_Core+21Bj CRT_Sprintf_Core+226j
		push	ax
		push	di
		call	Heap_ErrHandler3
		add	sp, 4
		jmp	loc_778
; ���������������������������������������������������������������������������

loc_97E:				; CODE XREF: CRT_Sprintf_Core+20Aj
		call	Heap_ErrHandler4
		jmp	loc_778
; ���������������������������������������������������������������������������

loc_984:				; CODE XREF: CRT_Sprintf_Core+201j
		call	Heap_ErrHandler4
		jl	short loc_925
		jmp	loc_B25		; case 0x0
; ���������������������������������������������������������������������������

loc_98C:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		call	$+3		; case 0xF
		jmp	loc_B2C
; END OF FUNCTION CHUNK	FOR CRT_Sprintf_Core
; ���������������������������������������������������������������������������
		test	byte ptr [bp-1], 1
		jnz	short loc_99E
		call	CRT_VaArgHelper
		inc	word ptr [bp-4]

loc_99E:				; CODE XREF: seg000:0996j
		and	word ptr [bp-0Ah], 7FFFh
		jz	short loc_9CE

loc_9A5:				; CODE XREF: seg000:09CCj
		test	byte ptr [bp-1], 1
		jnz	short loc_9AC
		stosb

loc_9AC:				; CODE XREF: seg000:09A9j
		inc	word ptr [bp-6]
		push	es
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	es
		assume es:nothing
		or	ax, ax
		jle	short loc_9CE
		or	al, al
		js	short loc_9C9
		xchg	ax, bx
		cmp	byte ptr [bx+4C4Ah], 1
		xchg	ax, bx
		jle	short loc_9CE

loc_9C9:				; CODE XREF: seg000:09BEj
		dec	word ptr [bp-0Ah]
		jg	short loc_9A5

loc_9CE:				; CODE XREF: seg000:09A3j seg000:09BAj ...
		push	es
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		pop	es
		dec	word ptr [bp-6]
		test	byte ptr [bp-1], 1
		jnz	short loc_9E5
		mov	al, 0
		stosb

loc_9E5:				; CODE XREF: seg000:09E0j
		jmp	loc_778
; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Sprintf_Core

loc_9E8:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		test	[bp+var_1], 1	; case 0x6
		jnz	short loc_9F1
		call	CRT_VaArgHelper

loc_9F1:				; CODE XREF: CRT_Sprintf_Core+2A3j
		mov	si, [bp+var_A]
		or	si, si
		jge	short loc_9FB
		mov	si, 1

loc_9FB:				; CODE XREF: CRT_Sprintf_Core+2ADj
		jz	short loc_A17

loc_9FD:				; CODE XREF: CRT_Sprintf_Core+2CCj
		inc	[bp+var_6]
		push	es
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		pop	es
		or	ax, ax
		jl	short loc_A23
		test	[bp+var_1], 1
		jnz	short loc_A14
		stosb

loc_A14:				; CODE XREF: CRT_Sprintf_Core+2C8j
		dec	si
		jg	short loc_9FD

loc_A17:				; CODE XREF: CRT_Sprintf_Core:loc_9FBj
		test	[bp+var_1], 1
		jnz	short loc_A20
		inc	[bp+var_4]

loc_A20:				; CODE XREF: CRT_Sprintf_Core+2D2j
		jmp	loc_778
; ���������������������������������������������������������������������������

loc_A23:				; CODE XREF: CRT_Sprintf_Core+2C2j
		jmp	loc_B11		; default
; ���������������������������������������������������������������������������

loc_A26:				; CODE XREF: CRT_Sprintf_Core+BBj
					; DATA XREF: seg000:off_BB8o
		sub	ax, ax		; case 0x10
		cld
		push	ss
		pop	es
		assume es:seg339
		lea	di, [bp+var_2A]
		mov	cx, 10h
		rep stosw
		lodsb
		and	[bp+var_1], 0EFh
		cmp	al, 5Eh	; '^'
		jnz	short loc_A41
		or	[bp+var_1], 10h
		lodsb

loc_A41:				; CODE XREF: CRT_Sprintf_Core+2F1j
		mov	ah, 0

loc_A43:				; CODE XREF: CRT_Sprintf_Core+317j CRT_Sprintf_Core+31Bj ...
		mov	dl, al
		mov	di, ax
		mov	cl, 3
		shr	di, cl
		mov	cx, 107h
		and	cl, dl
		shl	ch, cl
		or	byte ptr [bp+di+var_2A], ch

loc_A55:				; CODE XREF: CRT_Sprintf_Core+325j CRT_Sprintf_Core+335j
		lodsb
		cmp	al, 0
		jz	short loc_A80
		cmp	al, 5Dh	; ']'
		jz	short loc_A83
		cmp	al, 2Dh	; '-'
		jnz	short loc_A43
		cmp	dl, [si]
		ja	short loc_A43
		cmp	byte ptr [si], 5Dh ; ']'
		jz	short loc_A43
		lodsb
		sub	al, dl
		jz	short loc_A55
		add	dl, al

loc_A72:				; CODE XREF: CRT_Sprintf_Core+333j
		rol	ch, 1
		adc	di, 0
		or	byte ptr [bp+di+var_2A], ch
		dec	al
		jnz	short loc_A72
		jmp	short loc_A55
; ���������������������������������������������������������������������������

loc_A80:				; CODE XREF: CRT_Sprintf_Core+30Fj
		jmp	loc_B25		; case 0x0
; ���������������������������������������������������������������������������

loc_A83:				; CODE XREF: CRT_Sprintf_Core+313j
		mov	[bp+arg_6], si
		and	[bp+var_A], 7FFFh
		mov	si, [bp+var_A]
		test	[bp+var_1], 1
		jnz	short loc_A97
		call	CRT_VaArgHelper

loc_A97:				; CODE XREF: CRT_Sprintf_Core+349j CRT_Sprintf_Core+388j ...
		dec	si
		jl	short loc_AEA
		inc	[bp+var_6]
		push	es
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		pop	es
		assume es:nothing
		or	ax, ax
		jl	short loc_AFF
		xchg	ax, si
		mov	bx, si
		mov	cl, 3
		shr	si, cl
		mov	cx, 107h
		and	cl, bl
		shl	ch, cl
		test	byte ptr [bp+si+var_2A], ch
		xchg	ax, si
		xchg	ax, bx
		jz	short loc_AC7
		test	[bp+var_1], 10h
		jz	short loc_ACD
		jmp	short loc_AD6
; ���������������������������������������������������������������������������

loc_AC7:				; CODE XREF: CRT_Sprintf_Core+374j
		test	[bp+var_1], 10h
		jz	short loc_AD6

loc_ACD:				; CODE XREF: CRT_Sprintf_Core+37Aj
		test	[bp+var_1], 1
		jnz	short loc_A97
		stosb
		jmp	short loc_A97
; ���������������������������������������������������������������������������

loc_AD6:				; CODE XREF: CRT_Sprintf_Core+37Cj CRT_Sprintf_Core+382j
		push	es
		push	[bp+arg_4]
		push	ax
		call	[bp+arg_2]
		pop	cx
		pop	cx
		pop	es
		dec	[bp+var_6]
		inc	si
		cmp	si, [bp+var_A]
		jge	short loc_AF3

loc_AEA:				; CODE XREF: CRT_Sprintf_Core+34Fj
		test	[bp+var_1], 1
		jnz	short loc_AFC
		inc	[bp+var_4]

loc_AF3:				; CODE XREF: CRT_Sprintf_Core+39Fj
		test	[bp+var_1], 1
		jnz	short loc_AFC
		mov	al, 0
		stosb

loc_AFC:				; CODE XREF: CRT_Sprintf_Core+3A5j CRT_Sprintf_Core+3AEj
		jmp	loc_778
; ���������������������������������������������������������������������������

loc_AFF:				; CODE XREF: CRT_Sprintf_Core+35Fj
		inc	si
		cmp	si, [bp+var_A]
		jge	short loc_B11	; default
		test	[bp+var_1], 1
		jnz	short loc_B11	; default
		mov	al, 0
		stosb
		inc	[bp+var_4]

loc_B11:				; CODE XREF: CRT_Sprintf_Core:loc_7BAj
					; CRT_Sprintf_Core+B6j ...
		push	[bp+arg_4]	; default
		mov	ax, 0FFFFh
		push	ax
		call	[bp+arg_2]
		pop	cx
		pop	cx
		cmp	[bp+var_4], 1
		sbb	[bp+var_4], 0

loc_B25:				; CODE XREF: CRT_Sprintf_Core+92j
					; CRT_Sprintf_Core:loc_7DEj ...
		pop	es		; case 0x0
		mov	ax, [bp+var_4]
		jmp	loc_BB2
; ���������������������������������������������������������������������������

loc_B2C:				; CODE XREF: CRT_Sprintf_Core+174j CRT_Sprintf_Core+246j ...
		inc	[bp+var_6]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		or	ax, ax
		jle	short loc_B4D
		or	al, al
		js	short loc_B47
		xchg	ax, bx
		cmp	byte ptr [bx+4C4Ah], 1
		xchg	ax, bx
		jz	short loc_B2C

loc_B47:				; CODE XREF: CRT_Sprintf_Core+3F3j
					; CRT_Sprintf_Core:loc_B4Dj
		pop	cx
		add	cx, 3
		jmp	cx
; ���������������������������������������������������������������������������

loc_B4D:				; CODE XREF: CRT_Sprintf_Core+3EFj
		jz	short loc_B47
		pop	cx
		jmp	short loc_B11	; default
; END OF FUNCTION CHUNK	FOR CRT_Sprintf_Core
; ���������������������������������������������������������������������������

loc_B52:				; CODE XREF: seg000:08D4j seg000:08F4j
		sub	dx, dx
		mov	cx, 4

loc_B57:				; CODE XREF: seg000:0B9Fj
		dec	word ptr [bp-0Ah]
		jl	short loc_BA1
		push	dx
		push	cx
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	cx
		pop	dx
		or	ax, ax
		jle	short loc_BA3
		dec	cl
		jl	short loc_BA3
		mov	ch, al
		sub	ch, 30h	; '0'
		jb	short loc_BA3
		cmp	ch, 0Ah
		jb	short loc_B95
		sub	ch, 11h
		jb	short loc_BA3
		cmp	ch, 6
		jb	short loc_B92
		sub	ch, 20h	; ' '
		jb	short loc_BA3
		cmp	ch, 6
		jnb	short loc_BA3

loc_B92:				; CODE XREF: seg000:0B86j
		add	ch, 0Ah

loc_B95:				; CODE XREF: seg000:0B7Cj
		shl	dx, 1
		shl	dx, 1
		shl	dx, 1
		shl	dx, 1
		add	dl, ch
		jmp	short loc_B57
; ���������������������������������������������������������������������������

loc_BA1:				; CODE XREF: seg000:0B5Aj
		sub	ax, ax

loc_BA3:				; CODE XREF: seg000:0B6Cj seg000:0B70j ...
		cmp	cl, 4
		jz	short loc_BAE
		pop	cx
		add	cx, 3
		jmp	cx
; ���������������������������������������������������������������������������

loc_BAE:				; CODE XREF: seg000:0BA6j
		pop	cx
		jmp	loc_B11		; default
; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Sprintf_Core

loc_BB2:				; CODE XREF: CRT_Sprintf_Core+3E0j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn
; END OF FUNCTION CHUNK	FOR CRT_Sprintf_Core
; ���������������������������������������������������������������������������
off_BB8		dw offset loc_B25	; DATA XREF: CRT_Sprintf_Core+BBr
		dw offset loc_B25	; jump table for switch	statement
		dw offset loc_B25
		dw offset loc_809
		dw offset loc_810
		dw offset loc_816
		dw offset loc_9E8
		dw offset loc_85A
		dw offset loc_85A
		dw offset loc_864
		dw offset loc_928
		dw offset loc_82A
		dw offset loc_836
		dw offset loc_830
		dw offset loc_855
		dw offset loc_98C
		dw offset loc_A26
		dw offset loc_848
		dw offset loc_85F
		dw offset loc_8BA
		dw offset loc_83C
		dw offset loc_842

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — convertit un caractère ASCII en valeur numérique de base et vérifie < base(cl) :
; helper strtol/scanf digit-parser.
; ==============================================================================================
CRT_DigitToValue		proc near		; CODE XREF: CRT_ScanInt_FromStream+DDp CRT_ScanInt_FromStream+103p	...
		push	bx
		sub	bl, 30h	; '0'
		jb	short loc_C0C
		cmp	bl, 9
		jbe	short loc_C01
		cmp	bl, 2Ah	; '*'
		ja	short loc_BF9
		sub	bl, 7
		jmp	short loc_BFC
; ���������������������������������������������������������������������������

loc_BF9:				; CODE XREF: CRT_DigitToValue+Ej
		sub	bl, 27h	; '''

loc_BFC:				; CODE XREF: CRT_DigitToValue+13j
		cmp	bl, 9
		jbe	short loc_C0C

loc_C01:				; CODE XREF: CRT_DigitToValue+9j
		cmp	bl, cl
		jnb	short loc_C0C
		inc	sp
		inc	sp
		clc
		mov	bh, 0
		jmp	short locret_C0E
; ���������������������������������������������������������������������������

loc_C0C:				; CODE XREF: CRT_DigitToValue+4j CRT_DigitToValue+1Bj ...
		pop	bx
		stc

locret_C0E:				; CODE XREF: CRT_DigitToValue+26j
		retn
CRT_DigitToValue		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — parseur de nombre depuis un flux via callbacks getchar/putback
; ([bp+arg_0]/[bp+arg_2]) : implémentation scanf integer scanner (signe/base/overflow),
; utilise sub_BE4.
; ==============================================================================================
CRT_ScanInt_FromStream		proc near		; CODE XREF: CRT_Sprintf_Core+145p

var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		mov	[bp+var_6], 1

loc_C25:				; CODE XREF: CRT_ScanInt_FromStream+31j
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_C9B
		cbw
		xchg	ax, bx
		test	bl, 80h
		jnz	short loc_C42
		mov	di, 4971h
		test	byte ptr [bx+di], 1
		jnz	short loc_C25

loc_C42:				; CODE XREF: CRT_ScanInt_FromStream+29j
		xchg	ax, bx
		dec	[bp+arg_8]
		jl	short loc_CA2
		cmp	al, 2Bh	; '+'
		jz	short loc_C53
		cmp	al, 2Dh	; '-'
		jnz	short loc_C66
		inc	[bp+var_1]

loc_C53:				; CODE XREF: CRT_ScanInt_FromStream+3Bj
		dec	[bp+arg_8]
		jl	short loc_CA2
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_C9B

loc_C66:				; CODE XREF: CRT_ScanInt_FromStream+3Fj
		sub	si, si
		mov	di, si
		mov	cx, [bp+arg_6]
		jcxz	short loc_CBC
		cmp	cx, 24h	; '$'
		ja	short loc_CA2
		cmp	cl, 2
		jb	short loc_CA2
		cmp	al, 30h	; '0'
		jnz	short loc_CE8
		cmp	cl, 10h
		jnz	short loc_CE6
		dec	[bp+arg_8]
		jl	short loc_CB9
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		cmp	al, 78h	; 'x'
		jz	short loc_CE6
		cmp	al, 58h	; 'X'
		jz	short loc_CE6
		jmp	short loc_D0E
; ���������������������������������������������������������������������������

loc_C9B:				; CODE XREF: CRT_ScanInt_FromStream+22j CRT_ScanInt_FromStream+55j
		mov	[bp+var_6], 0FFFFh
		jmp	short loc_CA7
; ���������������������������������������������������������������������������

loc_CA2:				; CODE XREF: CRT_ScanInt_FromStream+37j CRT_ScanInt_FromStream+47j ...
		mov	[bp+var_6], 0

loc_CA7:				; CODE XREF: CRT_ScanInt_FromStream+91j
		push	[bp+arg_4]
		push	ax
		call	[bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]
		sub	ax, ax
		cwd
		jmp	loc_D60
; ���������������������������������������������������������������������������

loc_CB9:				; CODE XREF: CRT_ScanInt_FromStream+76j CRT_ScanInt_FromStream+B9j
		jmp	loc_D50
; ���������������������������������������������������������������������������

loc_CBC:				; CODE XREF: CRT_ScanInt_FromStream+5Ej
		cmp	al, 30h	; '0'
		mov	[bp+arg_6], 0Ah
		jnz	short loc_CE8
		dec	[bp+arg_8]
		jl	short loc_CB9
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		mov	[bp+arg_6], 8
		cmp	al, 78h	; 'x'
		jz	short loc_CE1
		cmp	al, 58h	; 'X'
		jnz	short loc_D0E

loc_CE1:				; CODE XREF: CRT_ScanInt_FromStream+CCj
		mov	[bp+arg_6], 10h

loc_CE6:				; CODE XREF: CRT_ScanInt_FromStream+71j CRT_ScanInt_FromStream+84j ...
		jmp	short loc_CFF
; ���������������������������������������������������������������������������

loc_CE8:				; CODE XREF: CRT_ScanInt_FromStream+6Cj CRT_ScanInt_FromStream+B4j
		mov	cx, [bp+arg_6]
		xchg	ax, bx
		call	CRT_DigitToValue
		xchg	ax, bx
		jb	short loc_CA2
		xchg	ax, si
		jmp	short loc_CFF
; ���������������������������������������������������������������������������

loc_CF5:				; CODE XREF: CRT_ScanInt_FromStream+107j
		xchg	ax, si
		mul	[bp+arg_6]
		add	si, ax
		adc	di, dx
		jnz	short loc_D2B

loc_CFF:				; CODE XREF: CRT_ScanInt_FromStream:loc_CE6j
					; CRT_ScanInt_FromStream+E4j
		dec	[bp+arg_8]
		jl	short loc_D50
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx

loc_D0E:				; CODE XREF: CRT_ScanInt_FromStream+8Aj CRT_ScanInt_FromStream+D0j
		mov	cx, [bp+arg_6]
		xchg	ax, bx
		call	CRT_DigitToValue
		xchg	ax, bx
		jnb	short loc_CF5
		jmp	short loc_D44
; ���������������������������������������������������������������������������

loc_D1A:				; CODE XREF: CRT_ScanInt_FromStream+133j
		xchg	ax, si
		mul	cx
		xchg	ax, di
		xchg	cx, dx
		mul	dx
		add	si, di
		adc	ax, cx
		xchg	ax, di
		adc	dl, dh
		jnz	short loc_D72

loc_D2B:				; CODE XREF: CRT_ScanInt_FromStream+EEj
		dec	[bp+arg_8]
		jl	short loc_D50
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	[bp+arg_0]
		pop	cx
		mov	cx, [bp+arg_6]
		xchg	ax, bx
		call	CRT_DigitToValue
		xchg	ax, bx
		jnb	short loc_D1A

loc_D44:				; CODE XREF: CRT_ScanInt_FromStream+109j
		push	[bp+arg_4]
		push	ax
		call	[bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]

loc_D50:				; CODE XREF: CRT_ScanInt_FromStream:loc_CB9j
					; CRT_ScanInt_FromStream+F3j ...
		mov	dx, di
		xchg	ax, si
		cmp	[bp+var_1], 0
		jz	short loc_D60
		neg	dx
		neg	ax
		sbb	dx, 0

loc_D60:				; CODE XREF: CRT_ScanInt_FromStream+A7j CRT_ScanInt_FromStream+148j	...
		mov	di, [bp+arg_A]
		mov	bx, [bp+var_4]
		add	[di], bx
		mov	di, [bp+arg_C]
		mov	bx, [bp+var_6]
		mov	[di], bx
		jmp	short loc_D88
; ���������������������������������������������������������������������������

loc_D72:				; CODE XREF: CRT_ScanInt_FromStream+11Aj
		mov	ax, 0FFFFh
		mov	dx, 7FFFh
		add	al, [bp+var_1]
		adc	ah, 0
		adc	dx, 0
		mov	[bp+var_6], 2
		jmp	short loc_D60
; ���������������������������������������������������������������������������

loc_D88:				; CODE XREF: CRT_ScanInt_FromStream+161j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn
CRT_ScanInt_FromStream		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — sauvegarde ES/IP/SS/DS dans une structure : probable setjmp().
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

; ���������������������������������������������������������������������������
		mov	dx, 5
		cmp	dx, word_71C6E
		jnb	short loc_DDA

loc_DAF:				; CODE XREF: seg000:0DD8j
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+4BC0h], 0
		mov	bx, dx
		mov	cl, 4
		shl	bx, cl
		mov	byte ptr [bx+4A82h], 0FFh
		mov	ax, dx
		shl	ax, cl
		add	ax, 4A7Eh
		mov	bx, dx
		shl	bx, cl
		mov	[bx+4A8Ch], ax
		inc	dx
		cmp	dx, word_71C6E
		jb	short loc_DAF

loc_DDA:				; CODE XREF: seg000:0DADj
		mov	al, byte_71B32
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_DEF
		and	word_71B30, 0FDFFh

loc_DEF:				; CODE XREF: seg000:0DE7j
		mov	ax, 200h
		push	ax
		test	word_71B30, 200h
		jz	short loc_E00
		mov	ax, 1
		jmp	short loc_E02
; ���������������������������������������������������������������������������

loc_E00:				; CODE XREF: seg000:0DF9j
		xor	ax, ax

loc_E02:				; CODE XREF: seg000:0DFEj
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 4A7Eh
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		mov	al, byte_71B42
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_E27
		and	word_71B40, 0FDFFh

loc_E27:				; CODE XREF: seg000:0E1Fj
		mov	ax, 200h
		push	ax
		test	word_71B40, 200h
		jz	short loc_E38
		mov	ax, 2
		jmp	short loc_E3A
; ���������������������������������������������������������������������������

loc_E38:				; CODE XREF: seg000:0E31j
		xor	ax, ax

loc_E3A:				; CODE XREF: seg000:0E36j
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 4A8Eh
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — table lookup type de caractère (table 4971h), cas spécial 0xFFFF : ctype-like
; classification/toupper-tolower.
; ==============================================================================================
CRT_CtypeLookup		proc far		; CODE XREF: Program_InitVideoFontArgs+C5P
					; Program_InitVideoFontArgs+E0P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	dx, 0FFFFh
		jnz	short loc_E5B
		mov	ax, 0FFFFh
		jmp	short loc_E75
; ���������������������������������������������������������������������������

loc_E5B:				; CODE XREF: CRT_CtypeLookup+9j
		mov	al, dl
		mov	ah, 0
		mov	bx, ax
		test	byte ptr [bx+4971h], 8
		jz	short loc_E71
		mov	al, dl
		mov	ah, 0
		add	ax, 0FFE0h
		jmp	short loc_E75
; ���������������������������������������������������������������������������

loc_E71:				; CODE XREF: CRT_CtypeLookup+1Bj
		mov	al, dl
		mov	ah, 0

loc_E75:				; CODE XREF: CRT_CtypeLookup+Ej CRT_CtypeLookup+24j
		pop	bp
		retf
CRT_CtypeLookup		endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — 299 lignes, moteur vprintf/_doprnt (gestion varargs 2/4 octets selon flag), cœur du
; formatteur d'impression bas niveau.
; ==============================================================================================
CRT_Doprnt_Core		proc far		; CODE XREF: seg106:0E74P
					; TextObjectCluster_DestructAll_5ABD1+31P ...

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
		jnz	short loc_E8D
		jmp	loc_1023
; ���������������������������������������������������������������������������

loc_E8D:				; CODE XREF: CRT_Doprnt_Core+11j
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		test	[bp+arg_6], 1
		jz	short loc_EB7
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_ECA
		jmp	short loc_EC5
; ���������������������������������������������������������������������������

loc_EB7:				; CODE XREF: CRT_Doprnt_Core+21j
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_ECA

loc_EC5:				; CODE XREF: CRT_Doprnt_Core+3Ej
		mov	[bp+var_8], 0

loc_ECA:				; CODE XREF: CRT_Doprnt_Core+3Cj CRT_Doprnt_Core+4Cj
		test	[bp+arg_6], 10h
		jz	short loc_EDA
		mov	bx, [bp+arg_0]
		mov	ax, [bx-2]
		mov	[bp+arg_4], ax

loc_EDA:				; CODE XREF: CRT_Doprnt_Core+58j
		cmp	[bp+var_8], 0
		jnz	short loc_EE3
		jmp	loc_1003
; ���������������������������������������������������������������������������

loc_EE3:				; CODE XREF: CRT_Doprnt_Core+67j
		mov	ax, [bp+arg_6]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_EF8
		and	[bp+var_C], 0FEFFh

loc_EF8:				; CODE XREF: CRT_Doprnt_Core+7Aj
		mov	ax, [bp+arg_4]
		dec	ax
		imul	[bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, ax
		mov	[bp+var_E], dx
		jmp	loc_FF6
; ���������������������������������������������������������������������������

loc_F0A:				; CODE XREF: CRT_Doprnt_Core+189j
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h		; switch 16 cases
		mov	bx, offset word_1029

loc_F16:				; CODE XREF: CRT_Doprnt_Core+AAj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_F26
		add	bx, 2
		loop	loc_F16
		jmp	loc_FEB		; default
; ���������������������������������������������������������������������������

loc_F26:				; CODE XREF: CRT_Doprnt_Core+A5j
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_F2A:				; DATA XREF: seg000:1049o
		mov	ax, 2		; case 0x0
		push	ax
		push	[bp+var_E]
		call	di

loc_F33:				; CODE XREF: CRT_Doprnt_Core+CBj
		pop	cx
		pop	cx
		jmp	loc_FF0
; ���������������������������������������������������������������������������

loc_F38:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		mov	ax, 2		; case 0x1
		push	ax
		push	[bp+var_E]
		call	[bp+var_6]
		jmp	short loc_F33
; ���������������������������������������������������������������������������

loc_F44:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	[bp+var_E]	; case 0x2
		mov	ax, 2
		push	ax
		call	di
		jmp	loc_FF0
; ���������������������������������������������������������������������������

loc_F50:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		mov	ax, 2		; case 0x102
		push	ax
		push	[bp+var_E]
		call	di
		jmp	loc_FF0
; ���������������������������������������������������������������������������

loc_F5C:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	[bp+var_E]	; case 0x3
		mov	ax, 2
		push	ax
		call	[bp+var_6]
		jmp	loc_FF0
; ���������������������������������������������������������������������������

loc_F69:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		mov	ax, 2		; case 0x103
		push	ax
		push	[bp+var_E]
		call	[bp+var_6]
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_F75:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		mov	ax, 2		; case 0x20
		mov	bx, [bp+var_E]
		jmp	short loc_F83
; ���������������������������������������������������������������������������

loc_F7D:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		mov	bx, [bp+var_E]	; case 0x120
		mov	ax, 2

loc_F83:				; CODE XREF: CRT_Doprnt_Core+104j
		call	di
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_F87:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		mov	ax, 2		; case 0x21
		mov	bx, [bp+var_E]
		jmp	short loc_F95
; ���������������������������������������������������������������������������

loc_F8F:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		mov	bx, [bp+var_E]	; case 0x121
		mov	ax, 2

loc_F95:				; CODE XREF: CRT_Doprnt_Core+116j
		call	[bp+var_6]
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_F9A:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	si		; case 0x80
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_FA8:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	si		; case 0x81
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	[bp+var_6]
		pop	cx
		pop	si
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_FB7:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	si		; case 0x82
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_FC4:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	si		; case 0x83
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	[bp+var_6]
		pop	si
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_FD2:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	si		; case 0xA0
		mov	si, [bp+var_E]
		mov	ax, 2
		call	di
		pop	si
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_FDE:				; CODE XREF: CRT_Doprnt_Core:loc_F26j
					; DATA XREF: seg000:1049o
		push	si		; case 0xA1
		mov	si, [bp+var_E]
		mov	ax, 2
		call	[bp+var_6]
		pop	si
		jmp	short loc_FF0
; ���������������������������������������������������������������������������

loc_FEB:				; CODE XREF: CRT_Doprnt_Core+ACj
		nop			; default
		push	cs
		call	loc_2AD

loc_FF0:				; CODE XREF: CRT_Doprnt_Core+BEj CRT_Doprnt_Core+D6j ...
		mov	ax, [bp+arg_2]
		sub	[bp+var_E], ax

loc_FF6:				; CODE XREF: CRT_Doprnt_Core+90j
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_1003
		jmp	loc_F0A
; ���������������������������������������������������������������������������

loc_1003:				; CODE XREF: CRT_Doprnt_Core+69j CRT_Doprnt_Core+187j
		test	[bp+arg_6], 8
		jz	short loc_1023
		test	[bp+arg_6], 10h
		jz	short loc_101A
		mov	ax, [bp+arg_0]
		add	ax, 0FFFEh
		mov	[bp+arg_0], ax

loc_101A:				; CODE XREF: CRT_Doprnt_Core+198j
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr CRT_FreeNear_Wrap
		pop	cx

loc_1023:				; CODE XREF: CRT_Doprnt_Core+13j CRT_Doprnt_Core+191j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Core		endp

; ���������������������������������������������������������������������������
word_1029	dw	0,     1,     2,     3 ; DATA XREF: CRT_Doprnt_Core+9Co
		dw    20h,   21h,   80h,   81h ; value table for switch	statement
		dw    82h,   83h,  0A0h,  0A1h
		dw   102h,  103h,  120h,  121h
		dw offset loc_F2A	; jump table for switch	statement
		dw offset loc_F38
		dw offset loc_F44
		dw offset loc_F5C
		dw offset loc_F75
		dw offset loc_F87
		dw offset loc_F9A
		dw offset loc_FA8
		dw offset loc_FB7
		dw offset loc_FC4
		dw offset loc_FD2
		dw offset loc_FDE
		dw offset loc_F50
		dw offset loc_F69
		dw offset loc_F7D
		dw offset loc_F8F

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — 257 lignes, gros switch (cases 0x81-0xA1) dispatchant sur spécificateurs de format via
; callbacks [bp+var_4]/[bp+var_8] : moteur _doprnt (dispatch %d/%s/%x/%ld etc, variantes
; near/far).
; ==============================================================================================
CRT_Doprnt_Dispatch	proc far		; CODE XREF: Program_InitVideoFontArgs+1BFP
					; Lexer_CountTokensAndFormat:loc_1C9EFP	...

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
		jz	short loc_10A3
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_10BB
		jmp	short loc_10B6
; ���������������������������������������������������������������������������

loc_10A3:				; CODE XREF: CRT_Doprnt_Dispatch+1Bj
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_10BB

loc_10B6:				; CODE XREF: CRT_Doprnt_Dispatch+38j
		mov	[bp+var_A], 0

loc_10BB:				; CODE XREF: CRT_Doprnt_Dispatch+36j CRT_Doprnt_Dispatch+4Bj
		or	di, di
		jnz	short loc_110F
		mov	ax, [bp+arg_2]
		imul	[bp+arg_4]
		mov	[bp+var_E], 0
		mov	[bp+var_10], ax
		test	[bp+arg_6], 10h
		jz	short loc_10DC
		add	[bp+var_10], 2
		adc	[bp+var_E], 0

loc_10DC:				; CODE XREF: CRT_Doprnt_Dispatch+69j
		cmp	[bp+var_E], 0
		jb	short loc_10EF
		ja	short loc_10EA
		cmp	[bp+var_10], 0FFFFh
		jbe	short loc_10EF

loc_10EA:				; CODE XREF: CRT_Doprnt_Dispatch+79j CRT_Doprnt_Dispatch+95j
		xor	ax, ax
		jmp	loc_11D5
; ���������������������������������������������������������������������������

loc_10EF:				; CODE XREF: CRT_Doprnt_Dispatch+77j CRT_Doprnt_Dispatch+7Fj
		push	[bp+var_10]
		nop
		push	cs
		call	near ptr CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_1100
		jmp	short loc_10EA
; ���������������������������������������������������������������������������

loc_1100:				; CODE XREF: CRT_Doprnt_Dispatch+93j
		test	[bp+arg_6], 10h
		jz	short loc_110F
		mov	ax, [bp+arg_4]
		mov	[di], ax
		add	di, 2

loc_110F:				; CODE XREF: CRT_Doprnt_Dispatch+54j CRT_Doprnt_Dispatch+9Cj
		and	[bp+arg_6], 1A7h
		test	[bp+arg_6], 80h
		jz	short loc_1120
		and	[bp+arg_6], 0FEFFh

loc_1120:				; CODE XREF: CRT_Doprnt_Dispatch+B0j
		cmp	[bp+var_A], 0
		jnz	short loc_1129
		jmp	loc_11D3
; ���������������������������������������������������������������������������

loc_1129:				; CODE XREF: CRT_Doprnt_Dispatch+BBj
		mov	[bp+var_E], di
		jmp	loc_11C6
; ���������������������������������������������������������������������������

loc_112F:				; CODE XREF: CRT_Doprnt_Dispatch+167j
		mov	ax, [bp+arg_6]
		mov	[bp+var_C], ax
		mov	cx, 10h		; switch 16 cases
		mov	bx, offset word_11DB

loc_113B:				; CODE XREF: CRT_Doprnt_Dispatch+DDj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_114A
		add	bx, 2
		loop	loc_113B
		jmp	short loc_11BB	; default
; ���������������������������������������������������������������������������

loc_114A:				; CODE XREF: CRT_Doprnt_Dispatch+D8j
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_114E:				; DATA XREF: seg000:11FBo
		push	[bp+var_E]	; case 0x0
		call	[bp+var_4]

loc_1154:				; CODE XREF: CRT_Doprnt_Dispatch+F4j
		pop	cx
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_1157:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	[bp+var_E]	; case 0x1
		call	[bp+var_8]
		jmp	short loc_1154
; ���������������������������������������������������������������������������

loc_115F:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	[bp+var_E]	; case 0x2
		call	[bp+var_4]
		jmp	short loc_116D
; ���������������������������������������������������������������������������

loc_1167:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	[bp+var_E]	; case 0x3
		call	[bp+var_8]

loc_116D:				; CODE XREF: CRT_Doprnt_Dispatch+FCj
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_116F:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		mov	bx, [bp+var_E]	; case 0x20
		call	[bp+var_4]
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_1177:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		mov	bx, [bp+var_E]	; case 0x21
		call	[bp+var_8]
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_117F:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	si		; case 0x80
		mov	si, [bp+var_E]
		call	[bp+var_4]
		pop	si
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_1189:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	si		; case 0x81
		mov	si, [bp+var_E]
		call	[bp+var_8]
		pop	si
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_1193:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	si		; case 0x82
		mov	si, [bp+var_E]
		call	[bp+var_4]
		pop	si
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_119D:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	si		; case 0x83
		mov	si, [bp+var_E]
		call	[bp+var_8]
		pop	si
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_11A7:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	si		; case 0xA0
		mov	si, [bp+var_E]
		call	[bp+var_4]
		pop	si
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_11B1:				; CODE XREF: CRT_Doprnt_Dispatch:loc_114Aj
					; DATA XREF: seg000:11FBo
		push	si		; case 0xA1
		mov	si, [bp+var_E]
		call	[bp+var_8]
		pop	si
		jmp	short loc_11C0
; ���������������������������������������������������������������������������

loc_11BB:				; CODE XREF: CRT_Doprnt_Dispatch+DFj
		nop			; default
		push	cs
		call	loc_2AD

loc_11C0:				; CODE XREF: CRT_Doprnt_Dispatch+ECj
					; CRT_Doprnt_Dispatch:loc_116Dj ...
		mov	ax, [bp+arg_2]
		add	[bp+var_E], ax

loc_11C6:				; CODE XREF: CRT_Doprnt_Dispatch+C3j
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_11D3
		jmp	loc_112F
; ���������������������������������������������������������������������������

loc_11D3:				; CODE XREF: CRT_Doprnt_Dispatch+BDj
					; CRT_Doprnt_Dispatch+165j
		mov	ax, di

loc_11D5:				; CODE XREF: CRT_Doprnt_Dispatch+83j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Dispatch	endp

; ���������������������������������������������������������������������������
word_11DB	dw	0,     1,     2,     3 ; DATA XREF: CRT_Doprnt_Dispatch+CFo
		dw    20h,   21h,   80h,   81h ; value table for switch	statement
		dw    82h,   83h,  0A0h,  0A1h
		dw   102h,  103h,  120h,  121h
		dw offset loc_114E	; jump table for switch	statement
		dw offset loc_1157
		dw offset loc_115F
		dw offset loc_1167
		dw offset loc_116F
		dw offset loc_1177
		dw offset loc_117F
		dw offset loc_1189
		dw offset loc_1193
		dw offset loc_119D
		dw offset loc_11A7
		dw offset loc_11B1
		dw offset loc_115F
		dw offset loc_1167
		dw offset loc_116F
		dw offset loc_1177

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — extrait le nibble haut (dh), convertit via sub_1222, puis restaure dl : helper
; conversion octet→2 nibbles.
; ==============================================================================================
CRT_ByteToNibbles	proc near		; CODE XREF: CRT_Sprintf_Full+24Dp
					; CRT_Sprintf_Full+256p
		mov	al, dh
		call	CRT_BcdConvert
		mov	al, dl
CRT_ByteToNibbles	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — conversion BCD (aam base 16) puis appelle sub_122B : helper hex-to-digit.
; ==============================================================================================
CRT_BcdConvert	proc near		; CODE XREF: CRT_ByteToNibbles+2p
		aam	10h
		xchg	ah, al
		call	CRT_EmitHexDigit
		xchg	ah, al
CRT_BcdConvert	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — ajuste en BCD (daa x2) et stocke le caractère (stosb) : émission d'un digit
; hexadécimal ASCII.
; ==============================================================================================
CRT_EmitHexDigit	proc near		; CODE XREF: CRT_BcdConvert+4p
		add	al, 90h	; '�'
		daa
		adc	al, 40h	; '@'
		daa
		stosb
		retn
CRT_EmitHexDigit	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — 150+ octets de buffer local, multi-chunks : implémentation complète sprintf()
; (utilise sub_1263/sub_124D/sub_125A/off_6D0BA).
; ==============================================================================================
CRT_Sprintf_Full	proc near		; CODE XREF: CRT_Msg_NullPtrAssign+12p CRT_Msg_Sprintf1+18p ...

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

; FUNCTION CHUNK AT 1293 SIZE 00000423 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	[bp+var_12], 0
		mov	[bp+var_14], 50h ; 'P'
		mov	[bp+var_16], 0
		jmp	short loc_1293
CRT_Sprintf_Full	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — strlen via repne scasb.
; ==============================================================================================
CRT_Strlen_ScasB	proc near		; CODE XREF: CRT_Sprintf_Full:loc_14FAp
					; CRT_Sprintf_Full:loc_1558p ...
		push	di
		mov	cx, 0FFFFh
		xor	al, al
		repne scasb
		not	cx
		dec	cx
		pop	di
		retn
CRT_Strlen_ScasB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — stocke un caractère avec décrément de compteur de largeur (padding) : helper
; d'écriture formatée pour sprintf.
; ==============================================================================================
CRT_EmitPaddedChar	proc near		; CODE XREF: CRT_Sprintf_Full+3ABp
					; CRT_Sprintf_Full+3BCp ...
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jnz	short locret_1292
CRT_EmitPaddedChar	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — flush d'un buffer intermédiaire vers la sortie via callback (off_6D0BA) : helper de
; sub_1233.
; ==============================================================================================
CRT_FlushSprintfBuf	proc near		; CODE XREF: CRT_Sprintf_Full+81p
					; CRT_Sprintf_Full+402p ...
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
		call	off_6D0BA[bp]
		or	ax, ax
		jnz	short loc_1282
		mov	word ptr [bp-16h], 1

loc_1282:				; CODE XREF: CRT_FlushSprintfBuf+18j
		mov	word ptr [bp-14h], 50h ; 'P'
		add	[bp-12h], di
		lea	di, [bp-96h]
		pop	es
		pop	dx
		pop	cx
		pop	bx

locret_1292:				; CODE XREF: CRT_EmitPaddedChar+7j
		retn
CRT_FlushSprintfBuf	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Sprintf_Full

loc_1293:				; CODE XREF: CRT_Sprintf_Full+18j
		push	es
		cld
		lea	di, [bp+var_96]
		mov	[bp+var_4], di

loc_129C:				; CODE XREF: CRT_Sprintf_Full:loc_1683j
		mov	di, [bp+var_4]

loc_129F:				; CODE XREF: CRT_Sprintf_Full:loc_1647j
		mov	si, [bp+arg_2]

loc_12A2:				; CODE XREF: CRT_Sprintf_Full+7Fj CRT_Sprintf_Full+84j
		lodsb
		or	al, al
		jz	short loc_12B9
		cmp	al, 25h	; '%'
		jz	short loc_12BC

loc_12AB:				; CODE XREF: CRT_Sprintf_Full+8Fj
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp+var_14]
		jg	short loc_12A2
		call	CRT_FlushSprintfBuf
		jmp	short loc_12A2
; ���������������������������������������������������������������������������

loc_12B9:				; CODE XREF: CRT_Sprintf_Full+72j
		jmp	loc_1696
; ���������������������������������������������������������������������������

loc_12BC:				; CODE XREF: CRT_Sprintf_Full+76j
		mov	[bp+var_10], si
		lodsb
		cmp	al, 25h	; '%'
		jz	short loc_12AB
		mov	[bp+var_4], di
		xor	cx, cx
		mov	[bp+var_E], cx
		mov	[bp+var_2], cx
		mov	[bp+var_B], cl
		mov	[bp+var_8], 0FFFFh
		mov	[bp+var_A], 0FFFFh
		jmp	short loc_12DF
; ���������������������������������������������������������������������������

loc_12DE:				; CODE XREF: CRT_Sprintf_Full+D9j CRT_Sprintf_Full+E4j ...
		lodsb

loc_12DF:				; CODE XREF: CRT_Sprintf_Full+A9j
		xor	ah, ah
		mov	dx, ax
		mov	bx, ax
		sub	bl, 20h	; ' '
		cmp	bl, 60h	; '`'
		jnb	short loc_1300
		mov	bl, [bx+4CD1h]
		cmp	bx, 17h		; switch 24 cases
		jbe	short loc_12F9
		jmp	loc_1686	; default
; ���������������������������������������������������������������������������

loc_12F9:				; CODE XREF: CRT_Sprintf_Full+C1j
		shl	bx, 1
		jmp	cs:off_16B6[bx]	; switch jump
; ���������������������������������������������������������������������������

loc_1300:				; CODE XREF: CRT_Sprintf_Full+B8j CRT_Sprintf_Full+D3j ...
		jmp	loc_1686	; default
; ���������������������������������������������������������������������������

loc_1303:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		cmp	ch, 0		; case 0x1
		ja	short loc_1300
		or	[bp+var_2], 1
		jmp	short loc_12DE
; ���������������������������������������������������������������������������

loc_130E:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		cmp	ch, 0		; case 0x3
		ja	short loc_1300
		or	[bp+var_2], 2
		jmp	short loc_12DE
; ���������������������������������������������������������������������������

loc_1319:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		cmp	ch, 0		; case 0x0
		ja	short loc_1300
		cmp	[bp+var_B], 2Bh	; '+'
		jz	short loc_1327
		mov	[bp+var_B], dl

loc_1327:				; CODE XREF: CRT_Sprintf_Full+EFj
		jmp	short loc_12DE
; ���������������������������������������������������������������������������

loc_1329:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		and	[bp+var_2], 0FFDFh ; case 0x16
		jmp	short loc_1333
; ���������������������������������������������������������������������������

loc_132F:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		or	[bp+var_2], 20h	; case 0x17

loc_1333:				; CODE XREF: CRT_Sprintf_Full+FAj
					; CRT_Sprintf_Full+198j ...
		mov	ch, 5
		jmp	short loc_12DE
; ���������������������������������������������������������������������������

loc_1337:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		cmp	ch, 0		; case 0x9
		ja	short loc_1389	; case 0x5
		test	[bp+var_2], 2
		jnz	short loc_136C
		or	[bp+var_2], 8
		mov	ch, 1
		jmp	short loc_12DE
; ���������������������������������������������������������������������������

loc_134B:				; CODE XREF: CRT_Sprintf_Full+13Fj
					; CRT_Sprintf_Full+14Cj ...
		jmp	loc_1686	; default
; ���������������������������������������������������������������������������

loc_134E:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	di, [bp+arg_0]	; case 0x2
		mov	ax, ss:[di]
		add	[bp+arg_0], 2
		cmp	ch, 2
		jnb	short loc_136F
		or	ax, ax
		jns	short loc_1367
		neg	ax
		or	[bp+var_2], 2

loc_1367:				; CODE XREF: CRT_Sprintf_Full+12Cj
		mov	[bp+var_8], ax
		mov	ch, 3

loc_136C:				; CODE XREF: CRT_Sprintf_Full+10Ej
					; CRT_Sprintf_Full+166j ...
		jmp	loc_12DE
; ���������������������������������������������������������������������������

loc_136F:				; CODE XREF: CRT_Sprintf_Full+128j
		cmp	ch, 4
		jnz	short loc_134B
		mov	[bp+var_A], ax
		inc	ch
		jmp	loc_12DE
; ���������������������������������������������������������������������������

loc_137C:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		cmp	ch, 4		; case 0x4
		jnb	short loc_134B
		mov	ch, 4
		inc	[bp+var_A]
		jmp	loc_12DE
; ���������������������������������������������������������������������������

loc_1389:				; CODE XREF: CRT_Sprintf_Full+C8j
					; CRT_Sprintf_Full+107j
					; DATA XREF: ...
		xchg	ax, dx		; case 0x5
		sub	al, 30h	; '0'
		cbw
		cmp	ch, 2
		ja	short loc_13AB
		mov	ch, 2
		xchg	ax, [bp+var_8]
		or	ax, ax
		jl	short loc_136C
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp+var_8], ax
		jmp	loc_12DE
; ���������������������������������������������������������������������������

loc_13AB:				; CODE XREF: CRT_Sprintf_Full+15Dj
		cmp	ch, 4
		jnz	short loc_134B
		xchg	ax, [bp+var_A]
		or	ax, ax
		jz	short loc_136C
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp+var_A], ax
		jmp	loc_12DE
; ���������������������������������������������������������������������������

loc_13C7:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		or	[bp+var_2], 10h	; case 0x6
		jmp	loc_1333
; ���������������������������������������������������������������������������

loc_13CE:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		or	[bp+var_2], 100h ; case	0x7

loc_13D3:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		and	[bp+var_2], 0FFEFh ; case 0x8
		jmp	loc_1333
; ���������������������������������������������������������������������������

loc_13DA:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	bh, 8		; case 0xB
		jmp	short loc_13E8
; ���������������������������������������������������������������������������

loc_13DE:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	bh, 0Ah		; case 0xC
		jmp	short loc_13EC
; ���������������������������������������������������������������������������

loc_13E2:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	bh, 10h		; case 0xD
		mov	bl, 0E9h ; '�'
		add	bl, dl

loc_13E8:				; CODE XREF: CRT_Sprintf_Full+1A9j
		mov	[bp+var_B], 0

loc_13EC:				; CODE XREF: CRT_Sprintf_Full+1ADj
		mov	[bp+var_5], dl
		xor	dx, dx
		mov	[bp+var_6], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		jmp	short loc_140C
; ���������������������������������������������������������������������������

loc_13FC:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	bh, 0Ah		; case 0xA
		mov	[bp+var_6], 1
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		cwd

loc_140C:				; CODE XREF: CRT_Sprintf_Full+1C7j
		inc	di
		inc	di
		mov	[bp+arg_2], si
		test	[bp+var_2], 10h
		jz	short loc_141D
		mov	dx, ss:[di]
		inc	di
		inc	di

loc_141D:				; CODE XREF: CRT_Sprintf_Full+1E3j
		mov	[bp+arg_0], di
		lea	di, [bp+var_45]
		or	ax, ax
		jnz	short loc_1439
		or	dx, dx
		jnz	short loc_1439
		cmp	[bp+var_A], 0
		jnz	short loc_143D
		mov	byte ptr ss:[di], 0
		mov	ax, di
		jmp	short loc_144C
; ���������������������������������������������������������������������������

loc_1439:				; CODE XREF: CRT_Sprintf_Full+1F2j
					; CRT_Sprintf_Full+1F6j
		or	[bp+var_2], 4

loc_143D:				; CODE XREF: CRT_Sprintf_Full+1FCj
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

loc_144C:				; CODE XREF: CRT_Sprintf_Full+204j
		push	ss
		pop	es
		assume es:seg339
		mov	dx, [bp+var_A]
		or	dx, dx
		jge	short loc_1458
		jmp	loc_154A
; ���������������������������������������������������������������������������

loc_1458:				; CODE XREF: CRT_Sprintf_Full+220j
		jmp	loc_1558
; ���������������������������������������������������������������������������

loc_145B:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	[bp+var_5], dl	; case 0xE
		mov	[bp+arg_2], si
		lea	di, [bp-46h]
		mov	bx, [bp+arg_0]
		push	word ptr ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+arg_0], bx
		test	[bp+var_2], 20h
		jz	short loc_1486
		mov	dx, ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+arg_0], bx
		push	ss
		pop	es
		call	CRT_ByteToNibbles
		mov	al, 3Ah	; ':'
		stosb

loc_1486:				; CODE XREF: CRT_Sprintf_Full+241j
		push	ss
		pop	es
		pop	dx
		call	CRT_ByteToNibbles
		mov	byte ptr ss:[di], 0
		mov	[bp+var_6], 0
		and	[bp+var_2], 0FFFBh
		lea	cx, [bp-46h]
		sub	di, cx
		xchg	cx, di
		mov	dx, [bp+var_A]
		cmp	dx, cx
		jg	short loc_14A8
		mov	dx, cx

loc_14A8:				; CODE XREF: CRT_Sprintf_Full+271j
		jmp	loc_154A
; ���������������������������������������������������������������������������

loc_14AB:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
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
		jmp	loc_158D
; ���������������������������������������������������������������������������

loc_14CB:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	[bp+arg_2], si	; case 0x11
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		test	[bp+var_2], 20h
		jnz	short loc_14E8
		mov	di, ss:[di]
		add	[bp+arg_0], 2
		push	ds
		pop	es
		or	di, di
		jmp	short loc_14F3
; ���������������������������������������������������������������������������

loc_14E8:				; CODE XREF: CRT_Sprintf_Full+2A6j
		les	di, ss:[di]
		assume es:nothing
		add	[bp+arg_0], 4
		mov	ax, es
		or	ax, di

loc_14F3:				; CODE XREF: CRT_Sprintf_Full+2B3j
		jnz	short loc_14FA
		push	ds
		pop	es
		assume es:seg339
		mov	di, 4CCAh

loc_14FA:				; CODE XREF: CRT_Sprintf_Full:loc_14F3j
		call	CRT_Strlen_ScasB
		cmp	cx, [bp+var_A]
		jbe	short loc_1505
		mov	cx, [bp+var_A]

loc_1505:				; CODE XREF: CRT_Sprintf_Full+2CDj
		jmp	loc_158D
; ���������������������������������������������������������������������������

loc_1508:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	[bp+arg_2], si	; case 0xF
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	cx, [bp+var_A]
		or	cx, cx
		jge	short loc_151B
		mov	cx, 6

loc_151B:				; CODE XREF: CRT_Sprintf_Full+2E3j
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
		jz	short loc_153A
		mov	ax, 8
		add	[bp+arg_0], 0Ah
		jmp	short loc_1541
; ���������������������������������������������������������������������������

loc_153A:				; CODE XREF: CRT_Sprintf_Full+2FCj
		add	[bp+arg_0], 8
		mov	ax, 6

loc_1541:				; CODE XREF: CRT_Sprintf_Full+305j
		push	ax
		call	Heap_ErrHandler1
		push	ss
		pop	es
		lea	di, [bp+var_45]

loc_154A:				; CODE XREF: CRT_Sprintf_Full+222j
					; CRT_Sprintf_Full:loc_14A8j
		test	[bp+var_2], 8
		jz	short loc_1569
		mov	dx, [bp+var_8]
		or	dx, dx
		jle	short loc_1569

loc_1558:				; CODE XREF: CRT_Sprintf_Full:loc_1458j
		call	CRT_Strlen_ScasB
		cmp	byte ptr es:[di], 2Dh ;	'-'
		jnz	short loc_1562
		dec	cx

loc_1562:				; CODE XREF: CRT_Sprintf_Full+32Cj
		sub	dx, cx
		jle	short loc_1569
		mov	[bp+var_E], dx

loc_1569:				; CODE XREF: CRT_Sprintf_Full+31Cj
					; CRT_Sprintf_Full+323j ...
		cmp	byte ptr es:[di], 2Dh ;	'-'
		jz	short loc_157A
		mov	al, [bp+var_B]
		or	al, al
		jz	short loc_158A
		dec	di
		mov	es:[di], al

loc_157A:				; CODE XREF: CRT_Sprintf_Full+33Aj
		cmp	[bp+var_E], 0
		jle	short loc_158A
		mov	cx, [bp+var_A]
		or	cx, cx
		jge	short loc_158A
		dec	[bp+var_E]

loc_158A:				; CODE XREF: CRT_Sprintf_Full+341j
					; CRT_Sprintf_Full+34Bj ...
		call	CRT_Strlen_ScasB

loc_158D:				; CODE XREF: CRT_Sprintf_Full+295j
					; CRT_Sprintf_Full:loc_1505j
		mov	si, di
		mov	di, [bp+var_4]
		mov	bx, [bp+var_8]
		mov	ax, 5
		and	ax, [bp+var_2]
		cmp	ax, 5
		jnz	short loc_15B3
		mov	ah, [bp+var_5]
		cmp	ah, 6Fh	; 'o'
		jnz	short loc_15B5
		cmp	[bp+var_E], 0
		jg	short loc_15B3
		mov	[bp+var_E], 1

loc_15B3:				; CODE XREF: CRT_Sprintf_Full+36Bj
					; CRT_Sprintf_Full+379j
		jmp	short loc_15D0
; ���������������������������������������������������������������������������

loc_15B5:				; CODE XREF: CRT_Sprintf_Full+373j
		cmp	ah, 78h	; 'x'
		jz	short loc_15BF
		cmp	ah, 58h	; 'X'
		jnz	short loc_15D0

loc_15BF:				; CODE XREF: CRT_Sprintf_Full+385j
		or	[bp+var_2], 40h
		dec	bx
		dec	bx
		sub	[bp+var_E], 2
		jge	short loc_15D0
		mov	[bp+var_E], 0

loc_15D0:				; CODE XREF: CRT_Sprintf_Full:loc_15B3j
					; CRT_Sprintf_Full+38Aj ...
		add	cx, [bp+var_E]
		test	[bp+var_2], 2
		jnz	short loc_15E6
		jmp	short loc_15E2
; ���������������������������������������������������������������������������

loc_15DC:				; CODE XREF: CRT_Sprintf_Full+3B1j
		mov	al, 20h	; ' '
		call	CRT_EmitPaddedChar
		dec	bx

loc_15E2:				; CODE XREF: CRT_Sprintf_Full+3A7j
		cmp	bx, cx
		jg	short loc_15DC

loc_15E6:				; CODE XREF: CRT_Sprintf_Full+3A5j
		test	[bp+var_2], 40h
		jz	short loc_15F8
		mov	al, 30h	; '0'
		call	CRT_EmitPaddedChar
		mov	al, [bp+var_5]
		call	CRT_EmitPaddedChar

loc_15F8:				; CODE XREF: CRT_Sprintf_Full+3B8j
		mov	dx, [bp+var_E]
		or	dx, dx
		jle	short loc_1626
		sub	cx, dx
		sub	bx, dx
		mov	al, es:[si]
		cmp	al, 2Dh	; '-'
		jz	short loc_1612
		cmp	al, 20h	; ' '
		jz	short loc_1612
		cmp	al, 2Bh	; '+'
		jnz	short loc_1619

loc_1612:				; CODE XREF: CRT_Sprintf_Full+3D5j
					; CRT_Sprintf_Full+3D9j
		lods	byte ptr es:[si]
		call	CRT_EmitPaddedChar
		dec	cx
		dec	bx

loc_1619:				; CODE XREF: CRT_Sprintf_Full+3DDj
		xchg	cx, dx
		jcxz	short loc_1624

loc_161D:				; CODE XREF: CRT_Sprintf_Full+3EFj
		mov	al, 30h	; '0'
		call	CRT_EmitPaddedChar
		loop	loc_161D

loc_1624:				; CODE XREF: CRT_Sprintf_Full+3E8j
		xchg	cx, dx

loc_1626:				; CODE XREF: CRT_Sprintf_Full+3CAj
		jcxz	short loc_163A
		sub	bx, cx

loc_162A:				; CODE XREF: CRT_Sprintf_Full:loc_1638j
		lods	byte ptr es:[si]
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp+var_14]
		jg	short loc_1638
		call	CRT_FlushSprintfBuf

loc_1638:				; CODE XREF: CRT_Sprintf_Full+400j
		loop	loc_162A

loc_163A:				; CODE XREF: CRT_Sprintf_Full:loc_1626j
		or	bx, bx
		jle	short loc_1647
		mov	cx, bx

loc_1640:				; CODE XREF: CRT_Sprintf_Full+412j
		mov	al, 20h	; ' '
		call	CRT_EmitPaddedChar
		loop	loc_1640

loc_1647:				; CODE XREF: CRT_Sprintf_Full+409j
		jmp	loc_129F
; ���������������������������������������������������������������������������

loc_164A:				; CODE XREF: CRT_Sprintf_Full+C8j
					; DATA XREF: seg000:off_16B6o
		mov	[bp+arg_2], si	; case 0x12
		mov	di, [bp+arg_0]
		test	[bp+var_2], 20h
		jnz	short loc_1662
		mov	di, ss:[di]
		add	[bp+arg_0], 2
		push	ds
		pop	es
		jmp	short loc_1669
; ���������������������������������������������������������������������������

loc_1662:				; CODE XREF: CRT_Sprintf_Full+422j
		les	di, ss:[di]
		assume es:nothing
		add	[bp+arg_0], 4

loc_1669:				; CODE XREF: CRT_Sprintf_Full+42Dj
		mov	ax, 50h	; 'P'
		sub	al, byte ptr [bp+var_14]
		add	ax, [bp+var_12]
		mov	es:[di], ax
		test	[bp+var_2], 10h
		jz	short loc_1683
		inc	di
		inc	di
		mov	word ptr es:[di], 0

loc_1683:				; CODE XREF: CRT_Sprintf_Full+447j
		jmp	loc_129C
; ���������������������������������������������������������������������������

loc_1686:				; CODE XREF: CRT_Sprintf_Full+C3j CRT_Sprintf_Full+C8j ...
		mov	si, [bp+var_10]	; default
		mov	di, [bp+var_4]
		mov	al, 25h	; '%'

loc_168E:				; CODE XREF: CRT_Sprintf_Full+461j
		call	CRT_EmitPaddedChar
		lodsb
		or	al, al
		jnz	short loc_168E

loc_1696:				; CODE XREF: CRT_Sprintf_Full:loc_12B9j
		cmp	byte ptr [bp+var_14], 50h ; 'P'
		jge	short loc_169F
		call	CRT_FlushSprintfBuf

loc_169F:				; CODE XREF: CRT_Sprintf_Full+467j
		pop	es
		cmp	[bp+var_16], 0
		jz	short loc_16AB
		mov	ax, 0FFFFh
		jmp	short loc_16AE
; ���������������������������������������������������������������������������

loc_16AB:				; CODE XREF: CRT_Sprintf_Full+471j
		mov	ax, [bp+var_12]

loc_16AE:				; CODE XREF: CRT_Sprintf_Full+476j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	8
; END OF FUNCTION CHUNK	FOR CRT_Sprintf_Full
; ���������������������������������������������������������������������������
off_16B6	dw offset loc_1319	; DATA XREF: CRT_Sprintf_Full+C8r
		dw offset loc_1303	; jump table for switch	statement
		dw offset loc_134E
		dw offset loc_130E
		dw offset loc_137C
		dw offset loc_1389
		dw offset loc_13C7
		dw offset loc_13CE
		dw offset loc_13D3
		dw offset loc_1337
		dw offset loc_13FC
		dw offset loc_13DA
		dw offset loc_13DE
		dw offset loc_13E2
		dw offset loc_145B
		dw offset loc_1508
		dw offset loc_14AB
		dw offset loc_14CB
		dw offset loc_164A
		dw offset loc_1686
		dw offset loc_1686
		dw offset loc_1686
		dw offset loc_1329
		dw offset loc_132F

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — vérifie qu'une adresse est ≥ sp-0x200 (garde anti-débordement pile), sinon erreur
; (word_6D144=8) : alloca() avec protection.
; ==============================================================================================
CRT_AllocaGuard	proc near		; CODE XREF: seg000:173Fp Heap_ShrinkTail+35p ...

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, sp
		sub	dx, 200h
		cmp	ax, dx
		jnb	short loc_16FD
		mov	word_6D14C, ax
		xor	ax, ax
		jmp	short loc_1706
; ���������������������������������������������������������������������������

loc_16FD:				; CODE XREF: CRT_AllocaGuard+Ej
		mov	word_6D144, 8
		mov	ax, 0FFFFh

loc_1706:				; CODE XREF: CRT_AllocaGuard+15j
		pop	bp
		retn
CRT_AllocaGuard	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — variante de sub_16E6 avec ajustement de taille (extension réelle de pile) :
; alloca(size).
; ==============================================================================================
CRT_AllocaGrow	proc near		; CODE XREF: seg000:174Ep Heap_GrowSegment+5p	...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, word_6D14C
		adc	dx, 0
		mov	cx, ax
		or	dx, dx
		jnz	short loc_172E
		add	cx, 200h
		jb	short loc_172E
		cmp	cx, sp
		jnb	short loc_172E
		xchg	ax, word_6D14C
		jmp	short loc_1737
; ���������������������������������������������������������������������������

loc_172E:				; CODE XREF: CRT_AllocaGrow+14j CRT_AllocaGrow+1Aj ...
		mov	word_6D144, 8
		mov	ax, 0FFFFh

loc_1737:				; CODE XREF: CRT_AllocaGrow+24j
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
; near — écrit un message d'erreur fatal fixe (chaînes à 4D32h/4D37h/4D3Ch) sur stderr puis
; saute vers loc_2AD : handler d'erreur fatale runtime (stack overflow probable).
; ==============================================================================================
CRT_FatalStackError	proc near		; CODE XREF: Heap_ErrHandler1j
					; DATA XREF: seg339:off_71E32o
		mov	dx, 4D32h
		jmp	short loc_175D
; ���������������������������������������������������������������������������

loc_175A:				; CODE XREF: Heap_ErrHandler2j	Heap_ErrHandler3j ...
		mov	dx, 4D37h

loc_175D:				; CODE XREF: CRT_FatalStackError+3j
		mov	cx, 5
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		mov	cx, 27h	; '''
		mov	dx, 4D3Ch
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		jmp	loc_2AD
CRT_FatalStackError	endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_3. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — lit le timer PIT (port 40h/43h, canal 0) et retourne 16-bit inversé : lecture bas
; niveau du tick PIT (base des routines de profiling AI mentionnées dans le projet).
; ==============================================================================================
PIT_ReadTick16	proc near		; CODE XREF: seg000:loc_1792p
					; PIT_DelayLoop+7p ...
		pushf
		cli
		mov	al, 0
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		call	nullsub_3
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bl, al
		call	nullsub_3
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bh, al
		not	bx
		popf
		mov	ax, bx
		retn
PIT_ReadTick16	endp

; ���������������������������������������������������������������������������

loc_178F:				; DATA XREF: seg339:4EBEo
		push	si
		xor	si, si

loc_1792:				; CODE XREF: seg000:17ACj
		call	PIT_ReadTick16
		test	ax, 1
		jnz	short loc_17A8
		mov	word_71E16, 0
		mov	word_71E14, 4A9h
		jmp	short loc_17AE
; ���������������������������������������������������������������������������

loc_17A8:				; CODE XREF: seg000:1798j
		inc	si
		cmp	si, 64h	; 'd'
		jl	short loc_1792

loc_17AE:				; CODE XREF: seg000:17A6j
		pop	si
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — boucle d'attente utilisant sub_1775 (PIT) et un delta 32-bit (word_71E14/16) :
; implémentation delay()/temporisation précise.
; ==============================================================================================
PIT_DelayLoop	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC+4CFP
					; Cockpit_LoadAndDrawCalibration_8FDC0+27FP

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
		mov	dx, word_71E16
		mov	ax, word_71E14
		call	CRT_MulExtended32
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		mov	[bp+var_2], bx
		mov	[bp+var_4], cx
		jmp	short loc_17F9
; ���������������������������������������������������������������������������

loc_17DD:				; CODE XREF: PIT_DelayLoop+53j PIT_DelayLoop+5Aj
		cmp	bx, si
		jnb	short loc_17F7
		cmp	[bp+var_2], 1
		ja	short loc_17EF
		jb	short loc_180C
		cmp	[bp+var_4], 0
		jb	short loc_180C

loc_17EF:				; CODE XREF: PIT_DelayLoop+35j
		sub	[bp+var_4], 0
		sbb	[bp+var_2], 1

loc_17F7:				; CODE XREF: PIT_DelayLoop+2Fj
		mov	si, bx

loc_17F9:				; CODE XREF: PIT_DelayLoop+2Bj
		call	PIT_ReadTick16
		mov	bx, ax
		xor	dx, dx
		cmp	dx, [bp+var_2]
		jb	short loc_17DD
		jnz	short loc_180C
		cmp	ax, [bp+var_4]
		jb	short loc_17DD

loc_180C:				; CODE XREF: PIT_DelayLoop+37j PIT_DelayLoop+3Dj ...
		pop	si
		mov	sp, bp
		pop	bp
		retf
PIT_DelayLoop	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — sauvegarde contexte (sub_D8E=setjmp) puis appelle sub_1839 avec 3 arguments :
; installation d'un handler protégé (structured exception).
; ==============================================================================================
CRT_InstallProtectedHandler	proc far		; CODE XREF: TextRenderer_EncodeCharA_5E27B+18P
					; TextRenderer_EncodeCharB_5E2A3+1DP ...

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
; far — construit un trampoline sur pile (opcodes 0x55 0xCD = push bp; int), cas spécial
; interruptions 25h/26h (disk I/O), appelle le handler utilisateur avec tous les registres :
; implémentation int86()/intdos() bas niveau.
; ==============================================================================================
CRT_Int86	proc far		; CODE XREF: CRT_InstallProtectedHandler+1Ep
					; InputBinding_InitAndRegister_66E02+38P ...

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
		jb	short loc_1877
		cmp	al, 26h	; '&'
		ja	short loc_1877
		mov	byte ptr [bp+var_B], 36h ; '6'
		mov	[bp+var_B+1], 68Fh
		mov	[bp+var_8], cx
		mov	[bp+var_6], 0CB5Dh

loc_1877:				; CODE XREF: CRT_Int86+27j CRT_Int86+2Bj
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
		jz	short loc_18CF
		push	ax
		push	ax
		call	CRT_ClampMathIndex
		pop	ax

loc_18CF:				; CODE XREF: CRT_Int86+8Ej
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Int86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — variante de sub_1839 avec trampoline différent (0x6E8B/0xDE/0xCD) : probable int86x()
; (registres segment supplémentaires).
; ==============================================================================================
CRT_Int86x	proc far		; CODE XREF: FontStyle_Destruct_5EB9E+32P

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

; FUNCTION CHUNK AT 191C SIZE 0000005D BYTES

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
		jb	short loc_191C
		cmp	al, 26h	; '&'
		ja	short loc_191C
		mov	[bp+var_D], 36h	; '6'
		mov	[bp+var_C], 68Fh
		mov	[bp+var_A], cx
		mov	[bp+var_8], 0CAh ; '�'
		mov	[bp+var_7], 2
		jmp	short loc_1925
CRT_Int86x	endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_4. PRESS KEYPAD "+" TO EXPAND]
; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR CRT_Int86x

loc_191C:				; CODE XREF: CRT_Int86x+29j CRT_Int86x+2Dj
		mov	[bp+var_D], 0CAh ; '�'
		mov	[bp+var_C], 2

loc_1925:				; CODE XREF: CRT_Int86x+44j
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
		call	near ptr nullsub_4
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
; far — gestionnaire heap : compare taille demandée à limite globale (word_71E1A), appelle
; sub_19D0 (coalesce/free) ou sub_1996 (shrink) : routine realloc/heap-shrink.
; ==============================================================================================
Heap_ReallocShrink	proc far		; CODE XREF: Heap_SplitBlock+2Ap seg000:1BEAp
		push	si
		push	di
		mov	si, sp
		mov	bx, [si+8]
		sub	bx, 4
		jb	short loc_1993
		cmp	bx, word_71E1A
		jz	short loc_1990
		call	Heap_FreeCoalesce
		jmp	short loc_1993
; ���������������������������������������������������������������������������

loc_1990:				; CODE XREF: Heap_ReallocShrink+10j
		call	Heap_ShrinkTail

loc_1993:				; CODE XREF: Heap_ReallocShrink+Aj Heap_ReallocShrink+15j
		pop	di
		pop	si
		retf
Heap_ReallocShrink	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — gère la fin de bloc heap courant, met à jour pointeurs globaux (word_71E18/1A/1C) :
; helper interne heap manager.
; ==============================================================================================
Heap_ShrinkTail	proc near		; CODE XREF: Heap_ReallocShrink:loc_1990p
		cmp	word_71E18, bx
		jz	short loc_19BF
		mov	si, [bx+2]
		test	byte ptr [si], 1
		jz	short loc_19AA
		mov	word_71E1A, si
		jmp	short loc_19CA
; ���������������������������������������������������������������������������

loc_19AA:				; CODE XREF: Heap_ShrinkTail+Cj
		cmp	si, word_71E18
		jz	short loc_19BD
		mov	bx, si
		call	Heap_FreelistUnlink
		mov	ax, [bx+2]
		mov	word_71E1A, ax
		jmp	short loc_19CA
; ���������������������������������������������������������������������������

loc_19BD:				; CODE XREF: Heap_ShrinkTail+18j
		mov	bx, si

loc_19BF:				; CODE XREF: Heap_ShrinkTail+4j
		xor	ax, ax
		mov	word_71E18, ax
		mov	word_71E1A, ax
		mov	word_71E1C, ax

loc_19CA:				; CODE XREF: Heap_ShrinkTail+12j Heap_ShrinkTail+25j
		push	bx
		call	CRT_AllocaGuard
		pop	bx
		retn
Heap_ShrinkTail	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — décrémente compteur de référence bloc et fusionne avec bloc suivant libre
; (coalescing) : free() interne du heap custom.
; ==============================================================================================
Heap_FreeCoalesce	proc near		; CODE XREF: Heap_ReallocShrink+12p Heap_SplitBlock_Commit+39p
		dec	word ptr [bx]
		cmp	bx, word_71E18
		jz	short loc_19F0
		mov	si, [bx+2]
		mov	ax, [si]
		test	al, 1
		jnz	short loc_19F0
		add	ax, [bx]
		mov	[si], ax
		mov	di, [bx]
		add	di, bx
		mov	[di+2],	si
		mov	bx, si
		jmp	short loc_19F3
; ���������������������������������������������������������������������������

loc_19F0:				; CODE XREF: Heap_FreeCoalesce+6j Heap_FreeCoalesce+Fj
		call	Heap_FreelistInsert

loc_19F3:				; CODE XREF: Heap_FreeCoalesce+1Ej
		mov	di, [bx]
		add	di, bx
		mov	ax, [di]
		test	al, 1
		jz	short loc_19FE
		retn
; ���������������������������������������������������������������������������

loc_19FE:				; CODE XREF: Heap_FreeCoalesce+2Bj
		add	[bx], ax
		mov	si, di
		add	si, ax
		mov	[si+2],	bx
		mov	bx, di
Heap_FreeCoalesce	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — retire un bloc de la liste chaînée libre (unlink) : heap free-list management.
; ==============================================================================================
Heap_FreelistUnlink	proc near		; CODE XREF: Heap_ShrinkTail+1Cp Heap_Malloc+53p
		mov	di, [bx+6]
		cmp	bx, di
		jz	short loc_1A1E
		mov	word_71E1C, di
		mov	si, [bx+4]
		mov	[di+4],	si
		mov	[si+6],	di
		retn
; ���������������������������������������������������������������������������

loc_1A1E:				; CODE XREF: Heap_FreelistUnlink+5j
		mov	word_71E1C, 0
		retn
Heap_FreelistUnlink	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — insère un bloc dans la liste chaînée libre circulaire double : heap free-list
; management.
; ==============================================================================================
Heap_FreelistInsert	proc near		; CODE XREF: Heap_FreeCoalesce:loc_19F0p
		mov	si, word_71E1C
		or	si, si
		jz	short loc_1A3D
		mov	di, [si+6]
		mov	[si+6],	bx
		mov	[di+4],	bx
		mov	[bx+6],	di
		mov	[bx+4],	si
		retn
; ���������������������������������������������������������������������������

loc_1A3D:				; CODE XREF: Heap_FreelistInsert+6j
		mov	word_71E1C, bx
		mov	[bx+4],	bx
		mov	[bx+6],	bx
		retn
Heap_FreelistInsert	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — malloc() : arrondit la taille (+5, pair, min 8), cherche un bloc libre assez grand
; (first-fit), sinon étend le heap ou split : allocateur mémoire principal du runtime custom.
; ==============================================================================================
Heap_Malloc	proc far		; CODE XREF: Heap_SplitBlock+7p seg000:1BE3p
		push	si
		push	di
		mov	si, sp
		mov	ax, [si+8]
		or	ax, ax
		jz	short loc_1AA5
		add	ax, 5
		jb	short loc_1A8E
		and	ax, 0FFFEh
		cmp	ax, 8
		jnb	short loc_1A63
		mov	ax, 8

loc_1A63:				; CODE XREF: Heap_Malloc+16j
		cmp	word_71E18, 0
		jz	short loc_1A89
		mov	bx, word_71E1C
		or	bx, bx
		jz	short loc_1A7F
		mov	dx, bx

loc_1A74:				; CODE XREF: Heap_Malloc+35j
		cmp	[bx], ax
		jnb	short loc_1A92
		mov	bx, [bx+6]
		cmp	bx, dx
		jnz	short loc_1A74

loc_1A7F:				; CODE XREF: Heap_Malloc+28j
		call	Heap_GrowExtended
		jmp	short loc_1AA5
; ���������������������������������������������������������������������������

loc_1A84:				; CODE XREF: Heap_Malloc+51j
		call	Heap_SplitBlock_Alt
		jmp	short loc_1AA5
; ���������������������������������������������������������������������������

loc_1A89:				; CODE XREF: Heap_Malloc+20j
		call	Heap_GrowSegment
		jmp	short loc_1AA5
; ���������������������������������������������������������������������������

loc_1A8E:				; CODE XREF: Heap_Malloc+Ej
		xor	ax, ax
		jmp	short loc_1AA5
; ���������������������������������������������������������������������������

loc_1A92:				; CODE XREF: Heap_Malloc+2Ej
		mov	si, ax
		add	si, 8
		cmp	[bx], si
		jnb	short loc_1A84
		call	Heap_FreelistUnlink
		inc	word ptr [bx]
		mov	ax, bx
		add	ax, 4

loc_1AA5:				; CODE XREF: Heap_Malloc+9j Heap_Malloc+3Aj	...
		pop	di
		pop	si
		retf
Heap_Malloc	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — étend le heap via sub_1708 (grow segment) : helper grow-heap de malloc.
; ==============================================================================================
Heap_GrowSegment	proc near		; CODE XREF: Heap_Malloc:loc_1A89p
		push	ax
		xor	ax, ax
		push	ax
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx
		and	ax, 1
		jz	short loc_1AC0
		xor	dx, dx
		push	dx
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx

loc_1AC0:				; CODE XREF: Heap_GrowSegment+Dj
		pop	ax
		push	ax
		xor	bx, bx
		push	bx
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx
		cmp	ax, 0FFFFh
		jz	short loc_1AE4
		mov	bx, ax
		mov	word_71E18, bx
		mov	word_71E1A, bx
		pop	ax
		inc	ax
		mov	[bx], ax
		add	bx, 4
		mov	ax, bx
		retn
; ���������������������������������������������������������������������������

loc_1AE4:				; CODE XREF: Heap_GrowSegment+26j
		pop	bx
		xor	ax, ax
		retn
Heap_GrowSegment	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — variante étendue de croissance heap (référencée par sub_1A48/sub_1A84).
; ==============================================================================================
Heap_GrowExtended	proc near		; CODE XREF: Heap_Malloc:loc_1A7Fp
		push	ax
		xor	bx, bx
		push	bx
		push	ax
		call	CRT_AllocaGrow
		pop	bx
		pop	bx
		cmp	ax, 0FFFFh
		jz	short loc_1B0D
		mov	bx, ax
		mov	ax, word_71E1A
		mov	[bx+2],	ax
		mov	word_71E1A, bx
		pop	ax
		inc	ax
		mov	[bx], ax
		add	bx, 4
		mov	ax, bx
		retn
; ���������������������������������������������������������������������������

loc_1B0D:				; CODE XREF: Heap_GrowExtended+Dj
		pop	ax
		xor	ax, ax
		retn
Heap_GrowExtended	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — split de bloc mémoire alternative (référencée par sub_1A48).
; ==============================================================================================
Heap_SplitBlock_Alt	proc near		; CODE XREF: Heap_Malloc:loc_1A84p
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
; near — split de bloc mémoire avec calcul de reste, insère le reste libre (probable via
; sub_1B5F/sub_19D0).
; ==============================================================================================
Heap_SplitBlock	proc near		; CODE XREF: seg000:loc_1BDAp

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
		jz	short loc_1B5B
		push	ds
		pop	es
		assume es:seg339
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

loc_1B5B:				; CODE XREF: Heap_SplitBlock+Fj
		add	sp, 6
		retn
Heap_SplitBlock	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — effectue le split concret d'un bloc heap (crée bloc libre restant, chaîne via
; sub_19D0).
; ==============================================================================================
Heap_SplitBlock_Commit	proc near		; CODE XREF: seg000:loc_1BD5p
		mov	ax, dx
		add	dx, 8
		cmp	dx, cx
		ja	short loc_1B9D
		mov	dx, cx
		cmp	bx, word_71E1A
		jnz	short loc_1B7F
		mov	[bx], ax
		inc	word ptr [bx]
		add	ax, bx
		push	bx
		push	ax
		call	CRT_AllocaGuard
		pop	bx
		pop	bx
		jmp	short loc_1B9D
; ���������������������������������������������������������������������������

loc_1B7F:				; CODE XREF: Heap_SplitBlock_Commit+Fj
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

loc_1B9D:				; CODE XREF: Heap_SplitBlock_Commit+7j Heap_SplitBlock_Commit+1Ej
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
		jz	short loc_1BE8
		or	bx, bx
		jz	short loc_1BE1
		sub	bx, 4
		mov	cx, [bx]
		dec	cx
		mov	dx, ax
		add	dx, 5
		and	dx, 0FFFEh
		cmp	dx, 8
		jnb	short loc_1BCA
		mov	dx, 8

loc_1BCA:				; CODE XREF: seg000:1BC5j
		cmp	cx, dx
		jb	short loc_1BDA
		ja	short loc_1BD5
		add	bx, 4
		jmp	short loc_1BDD
; ���������������������������������������������������������������������������

loc_1BD5:				; CODE XREF: seg000:1BCEj
		call	Heap_SplitBlock_Commit
		jmp	short loc_1BDD
; ���������������������������������������������������������������������������

loc_1BDA:				; CODE XREF: seg000:1BCCj
		call	Heap_SplitBlock

loc_1BDD:				; CODE XREF: seg000:1BD3j seg000:1BD8j
		mov	ax, bx
		jmp	short loc_1BF0
; ���������������������������������������������������������������������������

loc_1BE1:				; CODE XREF: seg000:1BB2j
		push	ax
		push	cs
		call	near ptr Heap_Malloc
		jmp	short loc_1BEF
; ���������������������������������������������������������������������������

loc_1BE8:				; CODE XREF: seg000:1BAEj
		push	bx
		push	cs
		call	near ptr Heap_ReallocShrink
		xor	ax, ax

loc_1BEF:				; CODE XREF: seg000:1BE6j
		pop	bx

loc_1BF0:				; CODE XREF: seg000:1BDFj
		pop	bp
		pop	di
		pop	si
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — walk complet de la liste des blocs heap, vérifie chaînage et somme tailles
; libres/occupées : implémentation heapcheck()/validation debug du tas.
; ==============================================================================================
Heap_Validate	proc far		; CODE XREF: seg134:loc_5CD28P
		push	si
		push	di
		push	bx
		push	cx
		push	dx
		mov	bx, word_71E18
		or	bx, bx
		jz	short loc_1C76
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx
		xor	cx, cx
		mov	dx, cx

loc_1C0C:				; CODE XREF: Heap_Validate+53j
		test	byte ptr [bx], 1
		jnz	short loc_1C1E
		add	cx, [bx]
		cmp	bx, word_71E1A
		jz	short loc_1C49
		test	byte ptr [si], 1
		jz	short loc_1C84

loc_1C1E:				; CODE XREF: Heap_Validate+1Bj
		cmp	bx, word_71E1A
		jz	short loc_1C49
		cmp	si, bx
		jbe	short loc_1C84
		cmp	word ptr [bx], 8
		jb	short loc_1C84
		cmp	si, word_71E18
		jbe	short loc_1C84
		cmp	si, word_71E1A
		ja	short loc_1C84
		cmp	[si+2],	bx
		jnz	short loc_1C84
		mov	bx, si
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx
		jmp	short loc_1C0C
; ���������������������������������������������������������������������������

loc_1C49:				; CODE XREF: Heap_Validate+23j Heap_Validate+2Ej
		mov	bx, word_71E1C
		or	bx, bx
		jz	short loc_1C7B

loc_1C51:				; CODE XREF: Heap_Validate+80j
		mov	ax, [bx]
		test	al, 1
		jnz	short loc_1C84
		add	dx, ax
		cmp	bx, word_71E18
		jb	short loc_1C84
		cmp	bx, word_71E1A
		jnb	short loc_1C84
		mov	si, [bx+6]
		cmp	si, word_71E1C
		jz	short loc_1C7B
		cmp	si, bx
		jz	short loc_1C84
		mov	bx, si
		jmp	short loc_1C51
; ���������������������������������������������������������������������������

loc_1C76:				; CODE XREF: Heap_Validate+Bj
		mov	ax, 1
		jmp	short loc_1C87
; ���������������������������������������������������������������������������

loc_1C7B:				; CODE XREF: Heap_Validate+5Bj Heap_Validate+78j
		cmp	dx, cx
		jnz	short loc_1C84
		mov	ax, 2
		jmp	short loc_1C87
; ���������������������������������������������������������������������������

loc_1C84:				; CODE XREF: Heap_Validate+28j Heap_Validate+32j ...
		mov	ax, 0FFFFh

loc_1C87:				; CODE XREF: Heap_Validate+85j Heap_Validate+8Ej
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
		mov	bx, word_71E18
		or	bx, bx
		jz	short loc_1CEA
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx

loc_1CA7:				; CODE XREF: seg000:1CE8j
		cmp	bx, ax
		jz	short loc_1CF9
		test	byte ptr [bx], 1
		jnz	short loc_1CBB
		cmp	bx, word_71E1A
		jz	short loc_1CF4
		test	byte ptr [si], 1
		jz	short loc_1CEF

loc_1CBB:				; CODE XREF: seg000:1CAEj
		cmp	bx, word_71E1A
		jz	short loc_1CF4
		cmp	si, bx
		jbe	short loc_1CEF
		cmp	word ptr [bx], 8
		jb	short loc_1CEF
		cmp	si, word_71E18
		jbe	short loc_1CEF
		cmp	si, word_71E1A
		ja	short loc_1CEF
		cmp	si, bx
		jbe	short loc_1CEF
		cmp	[si+2],	bx
		jnz	short loc_1CEF
		mov	bx, si
		mov	si, [bx]
		and	si, 0FFFEh
		add	si, bx
		jmp	short loc_1CA7
; ���������������������������������������������������������������������������

loc_1CEA:				; CODE XREF: seg000:1C9Ej
		mov	ax, 1
		jmp	short loc_1D06
; ���������������������������������������������������������������������������

loc_1CEF:				; CODE XREF: seg000:1CB9j seg000:1CC3j ...
		mov	ax, 0FFFFh
		jmp	short loc_1D06
; ���������������������������������������������������������������������������

loc_1CF4:				; CODE XREF: seg000:1CB4j seg000:1CBFj
		mov	ax, 0FFFEh
		jmp	short loc_1D06
; ���������������������������������������������������������������������������

loc_1CF9:				; CODE XREF: seg000:1CA9j
		test	byte ptr [bx], 1
		jnz	short loc_1D03
		mov	ax, 3
		jmp	short loc_1D06
; ���������������������������������������������������������������������������

loc_1D03:				; CODE XREF: seg000:1CFCj
		mov	ax, 4

loc_1D06:				; CODE XREF: seg000:1CEDj seg000:1CF2j ...
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
		cmp	word_71E18, 0
		jz	short loc_1D48
		mov	bx, word_71E1C
		or	bx, bx
		jz	short loc_1D43
		cld

loc_1D22:				; CODE XREF: seg000:1D41j
		mov	cx, [bx]
		sub	cx, 8
		shr	cx, 1
		lea	di, [bx+8]
		rep stosw
		mov	cx, [bx+6]
		cmp	cx, word_71E1C
		jz	short loc_1D43
		cmp	bx, cx
		jz	short loc_1D4D
		or	cx, cx
		jz	short loc_1D4D
		mov	bx, cx
		jmp	short loc_1D22
; ���������������������������������������������������������������������������

loc_1D43:				; CODE XREF: seg000:1D1Fj seg000:1D35j
		mov	ax, 2
		jmp	short loc_1D50
; ���������������������������������������������������������������������������

loc_1D48:				; CODE XREF: seg000:1D17j
		mov	ax, 1
		jmp	short loc_1D50
; ���������������������������������������������������������������������������

loc_1D4D:				; CODE XREF: seg000:1D39j seg000:1D3Dj
		mov	ax, 0FFFFh

loc_1D50:				; CODE XREF: seg000:1D46j seg000:1D4Bj
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
		cmp	word_71E18, 0
		jz	short loc_1D94
		mov	bx, word_71E1C
		or	bx, bx
		jz	short loc_1D8F
		cld

loc_1D6C:				; CODE XREF: seg000:1D8Dj
		mov	cx, [bx]
		sub	cx, 8
		shr	cx, 1
		lea	di, [bx+8]
		repe scasw
		jnz	short loc_1D99
		mov	cx, [bx+6]
		cmp	cx, word_71E1C
		jz	short loc_1D8F
		cmp	bx, cx
		jz	short loc_1D9E
		or	cx, cx
		jz	short loc_1D9E
		mov	bx, cx
		jmp	short loc_1D6C
; ���������������������������������������������������������������������������

loc_1D8F:				; CODE XREF: seg000:1D69j seg000:1D81j
		mov	ax, 2
		jmp	short loc_1DA1
; ���������������������������������������������������������������������������

loc_1D94:				; CODE XREF: seg000:1D61j
		mov	ax, 1
		jmp	short loc_1DA1
; ���������������������������������������������������������������������������

loc_1D99:				; CODE XREF: seg000:1D78j
		mov	ax, 0FFFDh
		jmp	short loc_1DA1
; ���������������������������������������������������������������������������

loc_1D9E:				; CODE XREF: seg000:1D85j seg000:1D89j
		mov	ax, 0FFFFh

loc_1DA1:				; CODE XREF: seg000:1D92j seg000:1D97j ...
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
		jz	short loc_1DC2
		sub	si, 4
		cmp	si, word_71E1A
		jz	short loc_1DE9
		add	si, [si]
		and	si, 0FFFEh
		jmp	short loc_1DCA
; ���������������������������������������������������������������������������

loc_1DC2:				; CODE XREF: seg000:1DB0j
		mov	si, word_71E18
		or	si, si
		jz	short loc_1DE4

loc_1DCA:				; CODE XREF: seg000:1DC0j
		mov	[bx], si
		add	word ptr [bx], 4
		mov	ax, [si]
		and	ax, 0FFFEh
		mov	[bx+2],	ax
		mov	ax, [si]
		and	ax, 1
		mov	[bx+4],	ax
		mov	ax, 2
		jmp	short loc_1DEC
; ���������������������������������������������������������������������������

loc_1DE4:				; CODE XREF: seg000:1DC8j
		mov	ax, 1
		jmp	short loc_1DEC
; ���������������������������������������������������������������������������

loc_1DE9:				; CODE XREF: seg000:1DB9j
		mov	ax, 5

loc_1DEC:				; CODE XREF: seg000:1DE2j seg000:1DE7j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; near — trampoline indirect vers off_71E32 : vecteur d'erreur mémoire configurable #1.
; ==============================================================================================
Heap_ErrHandler1	proc near		; CODE XREF: CRT_Sprintf_Full+30Fp
		jmp	off_71E32
Heap_ErrHandler1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; near — trampoline indirect vers off_71E34 : vecteur d'erreur mémoire configurable #2.
; ==============================================================================================
Heap_ErrHandler2	proc near		; CODE XREF: CRT_Sprintf_Core+1F7p
		jmp	off_71E34
Heap_ErrHandler2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; near — trampoline indirect vers off_71E36 : vecteur d'erreur mémoire configurable #3.
; ==============================================================================================
Heap_ErrHandler3	proc near		; CODE XREF: CRT_Sprintf_Core+22Cp
		jmp	off_71E36
Heap_ErrHandler3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; near — trampoline indirect vers off_71E38 : vecteur d'erreur mémoire configurable #4
; (utilisés par sub_749/sub_1233, le formatteur sprintf).
; ==============================================================================================
Heap_ErrHandler4	proc near		; CODE XREF: CRT_Sprintf_Core:loc_97Ep
					; CRT_Sprintf_Core:loc_984p
		jmp	off_71E38
Heap_ErrHandler4	endp

; ���������������������������������������������������������������������������
		db 2 dup(0), 8Fh, 6, 72h, 4Dh, 8Fh, 6, 74h, 4Dh, 8Fh, 6
		db 76h,	4Dh, 2Eh, 8Ch, 1Eh, 0FFh, 1Dh, 89h, 36h, 78h, 4Dh
		db 89h,	3Eh, 7Ah, 4Dh, 0FCh, 8Eh, 6, 90h, 0, 0BEh, 80h
		db 0, 32h, 0E4h, 26h, 0ACh, 40h, 8Ch, 0C5h, 87h, 0D6h
		db 93h,	8Bh, 36h, 8Ah, 0, 2 dup(46h), 0B9h, 1, 0, 80h
		db 3Eh,	92h, 0,	3, 72h,	11h, 8Eh, 6, 8Ch, 0, 8Bh, 0FEh
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
		db 0ACh, 49h, 0Bh, 0F6h, 0C3h, 2 dup(90h), 0E9h, 0ECh
		db 0E3h, 59h, 3, 0CAh, 2Eh, 8Eh, 1Eh, 0FFh, 1Dh, 89h, 1Eh
		db 6Eh,	4Dh, 43h, 3, 0DBh, 8Bh,	0F4h, 8Bh, 0ECh, 2Bh, 0EBh
		db 72h,	0E4h, 8Bh, 0E5h, 89h, 2Eh, 70h,	4Dh, 0E3h, 0Eh
		db 89h,	76h, 0,	83h, 0C5h, 2, 36h, 0ACh, 0Ah, 0C0h, 0E0h
		db 0FAh, 74h, 0F0h, 33h, 0C0h, 89h, 46h, 0, 2Eh, 8Eh, 1Eh
		db 0FFh, 1Dh, 8Bh, 36h,	78h, 4Dh, 8Bh, 3Eh, 7Ah, 4Dh, 0FFh
		db 36h,	76h, 4Dh, 0FFh,	36h, 74h, 4Dh, 0A1h, 6Eh, 4Dh
		db 0A3h, 84h, 0, 0A1h, 70h, 4Dh, 0A3h, 86h, 0, 0FFh, 26h
		db 72h,	4Dh

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — programme le timer PIT canal 2 (port 42h/43h) à une fréquence donnée + active le gate
; speaker (port 61h) : fonction sound(freq).
; ==============================================================================================
PC_SoundOn	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC+4C7P
					; Cockpit_LoadAndDrawCalibration_8FDC0+277P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 34DDh
		mov	dx, 12h
		cmp	dx, bx
		jnb	short loc_1F42
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
		jnz	short loc_1F3A
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

loc_1F3A:				; CODE XREF: PC_SoundOn+18j
		mov	al, bl
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, bh
		out	42h, al		; Timer	8253-5 (AT: 8254.2).

loc_1F42:				; CODE XREF: PC_SoundOn+Ej
		pop	bp
		retf
PC_SoundOn	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — coupe le haut-parleur PC (port 61h) : nosound().
; ==============================================================================================
PC_SoundOff	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC+4D5P
					; Cockpit_LoadAndDrawCalibration_8FDC0+285P
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
PC_SoundOff	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — wrapper write() avec test mode texte/binaire (CR/LF handling, flag bit1).
; ==============================================================================================
CRT_Write_TextMode	proc far		; CODE XREF: Config_LoadOrCreate+2FP
					; CRT_DisplayCalibrationMessage_8FC61+FP	...

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
		jz	short loc_1F7C
		test	[bp+arg_2], 2
		jz	short loc_1F6F
		test	dx, 1
		jnz	short loc_1F73

loc_1F6F:				; CODE XREF: CRT_Write_TextMode+1Cj
		xor	ax, ax
		jmp	short loc_1F7C
; ���������������������������������������������������������������������������

loc_1F73:				; CODE XREF: CRT_Write_TextMode+22j
		mov	word_6D144, 5
		mov	ax, 0FFFFh

loc_1F7C:				; CODE XREF: CRT_Write_TextMode+15j CRT_Write_TextMode+26j
		pop	bp
		retf
CRT_Write_TextMode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — opération fichier bas niveau INT21 AH=43h (get/set attributs) avec gestion erreur via
; sub_4E7.
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
		jb	short loc_1F93
		xchg	ax, cx
		jmp	short loc_1F97
; ���������������������������������������������������������������������������

loc_1F93:				; CODE XREF: CRT_SetFileAttr+10j
		push	ax
		call	CRT_ClampMathIndex

loc_1F97:				; CODE XREF: CRT_SetFileAttr+13j
		pop	bp
		retf
CRT_SetFileAttr	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — fflush() interne d'un FILE* : vérifie flag dirty (bit3), appelle sub_2BB9 (write) si
; besoin, met à jour pointeurs de buffer.
; ==============================================================================================
Stdio_Fflush	proc far		; CODE XREF: seg000:203Ap Stdio_WriteTextMode+Ep	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		or	di, di
		jnz	short loc_1FAC
		nop
		push	cs
		call	Stdio_InitHandleCounter
		jmp	short loc_2014
; ���������������������������������������������������������������������������

loc_1FAC:				; CODE XREF: Stdio_Fflush+Aj
		cmp	[di+0Eh], di
		jz	short loc_1FB6

loc_1FB1:				; CODE XREF: Stdio_Fflush+79j
		mov	ax, 0FFFFh
		jmp	short loc_2016
; ���������������������������������������������������������������������������

loc_1FB6:				; CODE XREF: Stdio_Fflush+16j
		cmp	word ptr [di], 0
		jl	short loc_1FE4
		test	word ptr [di+2], 8
		jnz	short loc_1FCC
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_2014

loc_1FCC:				; CODE XREF: Stdio_Fflush+27j
		mov	word ptr [di], 0
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_2014
		mov	ax, [di+8]
		mov	[di+0Ah], ax
		jmp	short loc_2014
; ���������������������������������������������������������������������������
		jmp	short loc_2014
; ���������������������������������������������������������������������������

loc_1FE4:				; CODE XREF: Stdio_Fflush+20j
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
		jz	short loc_2014
		test	word ptr [di+2], 200h
		jnz	short loc_2014
		or	word ptr [di+2], 10h
		jmp	short loc_1FB1
; ���������������������������������������������������������������������������

loc_2014:				; CODE XREF: Stdio_Fflush+11j Stdio_Fflush+31j ...
		xor	ax, ax

loc_2016:				; CODE XREF: Stdio_Fflush+1Bj
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Fflush	endp ; sp = -2


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — init compteur de handles de streams (word_71C6E) : helper d'ouverture FILE*.
; ==============================================================================================
Stdio_InitHandleCounter	proc near		; CODE XREF: Stdio_Fflush+Ep

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	[bp+var_2], 0
		mov	di, word_71C6E
Stdio_InitHandleCounter	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near — charge l'adresse d'une table statique (4A7Eh) : table des structures FILE*
; prédéfinies (stdin/stdout/stderr).
; ==============================================================================================
Stdio_LoadFileTable	proc near		; CODE XREF: CRT_FlushSprintfBuf+13p CRT_FlushSprintfBuf+13p
					; DATA XREF: ...
		mov	si, 4A7Eh
Stdio_LoadFileTable	endp

		jmp	short loc_2044
; ���������������������������������������������������������������������������

loc_2030:				; CODE XREF: seg000:2049j
		test	word ptr [si+2], 3
		jz	short loc_2041
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		inc	word ptr [bp-2]

loc_2041:				; CODE XREF: seg000:2035j
		add	si, 10h

loc_2044:				; CODE XREF: seg000:202Ej
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	short loc_2030
		mov	ax, [bp-2]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — empile 5 arguments en tail-call trampoline (prologue partagé, utilisé via off_6D0BA)
; : helper d'empilement pour callback I/O de sprintf.
; ==============================================================================================
Stdio_ArgTrampoline5	proc near		; CODE XREF: Terrain_LoadATRIChunk_998C0:loc_99911P
					; Terrain_LoadHeightmapFromIFFB_99CEF+4BP ...

arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]

loc_2063:				; CODE XREF: CRT_FlushSprintfBuf+13p
					; DATA XREF: seg339:off_6D0BAo
		push	[bp+arg_2]
Stdio_ArgTrampoline5	endp

		nop
		push	cs
		call	near ptr Path_Splitpath
		add	sp, 0Ah
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — recherche un caractère en fin de chaîne via sub_2B1C(strlen)+sub_2474 : strrchr-like.
; ==============================================================================================
CRT_Strrchr_Like	proc far		; CODE XREF: PagedMemory_ReadFormattedString_5BE40+45P
					; PagedMemory_ReadFormattedString_5BE40+232P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		or	di, di
		jnz	short loc_2080

loc_207C:				; CODE XREF: CRT_Strrchr_Like+1Bj
		xor	ax, ax
		jmp	short loc_20A5
; ���������������������������������������������������������������������������

loc_2080:				; CODE XREF: CRT_Strrchr_Like+Aj
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_207C
		push	di
		push	si
		push	[bp+arg_2]
		call	Stdio_Fread
		or	ax, ax
		jz	short loc_20A2
		mov	bx, si
		mov	al, [bx+di-1]
		mov	ah, 0
		jmp	short loc_20A5
; ���������������������������������������������������������������������������

loc_20A2:				; CODE XREF: CRT_Strrchr_Like+27j
		mov	ax, 0FFFFh

loc_20A5:				; CODE XREF: CRT_Strrchr_Like+Ej CRT_Strrchr_Like+30j
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strrchr_Like	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — compte les occurrences de '\n' dans un buffer pour ajuster la longueur en mode texte
; (CR/LF) : helper interne stdio.
; ==============================================================================================
Stdio_CountNewlines	proc near		; CODE XREF: Stdio_WriteTextMode+26p seg000:2213p ...

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jge	short loc_20C0
		mov	dx, [si+6]
		add	dx, [si]
		inc	dx
		mov	di, dx
		jmp	short loc_20CB
; ���������������������������������������������������������������������������

loc_20C0:				; CODE XREF: Stdio_CountNewlines+Bj
		mov	ax, [si]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		mov	di, ax

loc_20CB:				; CODE XREF: Stdio_CountNewlines+15j
		test	word ptr [si+2], 40h
		jnz	short loc_20FE
		mov	cx, [si+0Ah]
		cmp	word ptr [si], 0
		jge	short loc_20F7
		jmp	short loc_20E5
; ���������������������������������������������������������������������������

loc_20DC:				; CODE XREF: Stdio_CountNewlines+41j
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_20E5
		inc	di

loc_20E5:				; CODE XREF: Stdio_CountNewlines+31j Stdio_CountNewlines+39j
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_20DC
		jmp	short loc_20FE
; ���������������������������������������������������������������������������

loc_20EE:				; CODE XREF: Stdio_CountNewlines+53j
		mov	bx, cx
		inc	cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_20F7
		inc	di

loc_20F7:				; CODE XREF: Stdio_CountNewlines+2Fj Stdio_CountNewlines+4Bj
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_20EE

loc_20FE:				; CODE XREF: Stdio_CountNewlines+27j Stdio_CountNewlines+43j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retn	2
Stdio_CountNewlines	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — écriture bas niveau d'un buffer FILE* avec traduction CR/LF (sub_20A9) puis
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
		jz	short loc_2121
		mov	ax, 0FFFFh
		jmp	short loc_216A
; ���������������������������������������������������������������������������

loc_2121:				; CODE XREF: Stdio_WriteTextMode+14j
		cmp	di, 1
		jnz	short loc_2136
		cmp	word ptr [si], 0
		jle	short loc_2136
		push	si
		call	Stdio_CountNewlines
		cwd
		sub	[bp+arg_2], ax
		sbb	[bp+arg_4], dx

loc_2136:				; CODE XREF: Stdio_WriteTextMode+1Ej Stdio_WriteTextMode+23j
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
		jnz	short loc_2168
		cmp	ax, 0FFFFh
		jnz	short loc_2168
		mov	ax, 0FFFFh
		jmp	short loc_216A
; ���������������������������������������������������������������������������

loc_2168:				; CODE XREF: Stdio_WriteTextMode+56j Stdio_WriteTextMode+5Bj
		xor	ax, ax

loc_216A:				; CODE XREF: Stdio_WriteTextMode+19j Stdio_WriteTextMode+60j
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
		jnz	short loc_21A2
		cmp	ax, 0FFFFh
		jnz	short loc_21A2
		jmp	loc_222A
; ���������������������������������������������������������������������������

loc_21A2:				; CODE XREF: seg000:2198j seg000:219Dj
		cmp	word ptr [si], 0
		jge	short loc_221F
		mov	al, [si+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4BC0h], 800h
		jz	short loc_2212
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
		jnz	short loc_21DE
		cmp	ax, 0FFFFh
		jz	short loc_2230

loc_21DE:				; CODE XREF: seg000:21D7j
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
		jnz	short loc_2206
		cmp	ax, 0FFFFh
		jnz	short loc_2206
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		jmp	short loc_2230
; ���������������������������������������������������������������������������

loc_2206:				; CODE XREF: seg000:21F7j seg000:21FCj
		mov	ax, [bp-6]
		mov	dx, [bp-8]
		mov	[bp-2],	ax
		mov	[bp-4],	dx

loc_2212:				; CODE XREF: seg000:21B5j
		push	si
		call	Stdio_CountNewlines
		cwd
		add	[bp-4],	ax
		adc	[bp-2],	dx
		jmp	short loc_222A
; ���������������������������������������������������������������������������

loc_221F:				; CODE XREF: seg000:21A5j
		push	si
		call	Stdio_CountNewlines
		cwd
		sub	[bp-4],	ax
		sbb	[bp-2],	dx

loc_222A:				; CODE XREF: seg000:219Fj seg000:221Dj
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_2230:				; CODE XREF: seg000:21DCj seg000:2204j
		pop	si
		mov	sp, bp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — wrapper sprintf %d signé base10 via sub_56B (itoa signé).
; ==============================================================================================
CRT_Itoa_Signed10	proc far		; CODE XREF: seg026:0127P
					; Widget_RenderComplexLayout_60BA6+77P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		cmp	cx, 0Ah
		jnz	short loc_2248
		mov	ax, bx
		cwd
		jmp	short loc_224C
; ���������������������������������������������������������������������������

loc_2248:				; CODE XREF: CRT_Itoa_Signed10+Cj
		mov	ax, bx
		xor	dx, dx

loc_224C:				; CODE XREF: CRT_Itoa_Signed10+11j
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
; far — wrapper itoa non signé base10.
; ==============================================================================================
CRT_Itoa_Unsigned	proc far		; CODE XREF: Widget_RenderComplexLayout_60BA6+97P
					; Widget_RenderComplexLayout_60BA6+D1P ...

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
; far — wrapper itoa base variable, signé uniquement si base=10.
; ==============================================================================================
CRT_Itoa_BaseVariant	proc far		; CODE XREF: seg026:0352P
					; Widget_RenderComplexLayout_60BA6+B4P

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
		jnz	short loc_2291
		mov	ax, 1
		jmp	short loc_2293
; ���������������������������������������������������������������������������

loc_2291:				; CODE XREF: CRT_Itoa_BaseVariant+13j
		xor	ax, ax

loc_2293:				; CODE XREF: CRT_Itoa_BaseVariant+18j
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
; far — memmove (rep movsw+movsb) : équivalent _fmemcpy public.
; ==============================================================================================
CRT_Memmove	proc far		; CODE XREF: Stdio_Fread+E4p seg000:2930p ...

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
		jnb	short loc_22B4
		movsb

loc_22B4:				; CODE XREF: CRT_Memmove+15j
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Memmove	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — memset (rep stosw+stosb, alignement pair géré).
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
		jz	short loc_22D7
		jcxz	short loc_22DE
		stosb
		dec	cx

loc_22D7:				; CODE XREF: CRT_Memset+16j
		shr	cx, 1
		rep stosw
		jnb	short loc_22DE
		stosb

loc_22DE:				; CODE XREF: CRT_Memset+18j CRT_Memset+20j
		pop	di
		pop	bp
		retf
CRT_Memset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — wrapper memset avec retour du pointeur : implémentation publique memset().
; ==============================================================================================
CRT_Memset_Public	proc far		; CODE XREF: Controller_InitStructDefault+13P
					; seg050:0059P	...

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

; ==============================================================================================
; far — wrapper sprintf avec format fixe (pointeurs 2474h/aNullPointerAss+45h) : probable
; message runtime 'Null pointer assignment'.
; ==============================================================================================
CRT_Msg_NullPtrAssign	proc far		; CODE XREF: Program_InitVideoFontArgs+246P
					; seg115:04DEP	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 2474h
		push	ax
		mov	ax, 4A8Eh
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
; far — décrémente le compteur d'ungetc puis appelle sub_232C : implémentation ungetc().
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
; far — putc()/fputc() interne : écrit un octet dans le buffer FILE*, gère line-buffering
; (flush sur \n/\r via sub_1F99), unbuffered (sub_605), et erreurs matherr-like via sub_2CC7.
; ==============================================================================================
Stdio_Putc	proc far		; CODE XREF: Stdio_Ungetc+11p seg000:246Dp ...

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_2]
		mov	al, [bp+arg_0]
		mov	byte_72F58, al
		cmp	word ptr [di], 0FFFFh
		jge	short loc_237B
		inc	word ptr [di]
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_2353
		jmp	loc_2459
; ���������������������������������������������������������������������������

loc_2353:				; CODE XREF: Stdio_Putc+22j
		cmp	byte_72F58, 0Ah
		jz	short loc_2364
		cmp	byte_72F58, 0Dh
		jz	short loc_2364
		jmp	loc_2459
; ���������������������������������������������������������������������������

loc_2364:				; CODE XREF: Stdio_Putc+2Cj Stdio_Putc+33j
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_2372
		jmp	loc_2459
; ���������������������������������������������������������������������������

loc_2372:				; CODE XREF: Stdio_Putc+41j Stdio_Putc+61j ...
		mov	ax, 0FFFFh
		jmp	loc_245E
; ���������������������������������������������������������������������������
		jmp	loc_2459
; ���������������������������������������������������������������������������

loc_237B:				; CODE XREF: Stdio_Putc+11j
		test	word ptr [di+2], 90h
		jnz	short loc_2389
		test	word ptr [di+2], 2
		jnz	short loc_238F

loc_2389:				; CODE XREF: Stdio_Putc+54j
					; Stdio_Putc+12Aj
		or	word ptr [di+2], 10h
		jmp	short loc_2372
; ���������������������������������������������������������������������������

loc_238F:				; CODE XREF: Stdio_Putc+5Bj
		or	word ptr [di+2], 100h
		cmp	word ptr [di+6], 0
		jz	short loc_23E6
		cmp	word ptr [di], 0
		jz	short loc_23AA
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_2372

loc_23AA:				; CODE XREF: Stdio_Putc+71j
		mov	ax, [di+6]
		neg	ax
		mov	[di], ax
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	al, byte_72F58
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_23C6
		jmp	loc_2459
; ���������������������������������������������������������������������������

loc_23C6:				; CODE XREF: Stdio_Putc+95j
		cmp	byte_72F58, 0Ah
		jz	short loc_23D7
		cmp	byte_72F58, 0Dh
		jz	short loc_23D7
		jmp	loc_2459
; ���������������������������������������������������������������������������

loc_23D7:				; CODE XREF: Stdio_Putc+9Fj Stdio_Putc+A6j
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_2459
		jmp	short loc_2372
; ���������������������������������������������������������������������������
		jmp	short loc_2459
; ���������������������������������������������������������������������������

loc_23E6:				; CODE XREF: Stdio_Putc+6Cj
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4BC0h], 800h
		jz	short loc_240D
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

loc_240D:				; CODE XREF: Stdio_Putc+C8j
		cmp	byte_72F58, 0Ah
		jnz	short loc_2435
		test	word ptr [di+2], 40h
		jnz	short loc_2435
		mov	ax, 1
		push	ax
		mov	ax, 4D7Ch
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jnz	short loc_244F

loc_2435:				; CODE XREF: Stdio_Putc+E6j Stdio_Putc+EDj
		mov	ax, 1
		push	ax
		mov	ax, 5EA8h
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jz	short loc_2459

loc_244F:				; CODE XREF: Stdio_Putc+107j
		test	word ptr [di+2], 200h
		jnz	short loc_2459
		jmp	loc_2389
; ���������������������������������������������������������������������������

loc_2459:				; CODE XREF: Stdio_Putc+24j Stdio_Putc+35j ...
		mov	al, byte_72F58
		mov	ah, 0

loc_245E:				; CODE XREF: Stdio_Putc+49j
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Putc	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, 4A8Eh
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
; near — 263 lignes, fread() interne : boucle getc (sub_232C) ou copie bloc bufferisée selon
; mode, gère fin de buffer.
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
		jz	short loc_24B6
		jmp	short loc_24A9
; ���������������������������������������������������������������������������

loc_248E:				; CODE XREF: Stdio_Fread+3Dj
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
		jnz	short loc_24A9

loc_24A4:				; CODE XREF: Stdio_Fread+6Bj
					; Stdio_Fread:loc_2523j ...
		xor	ax, ax
		jmp	loc_2614
; ���������������������������������������������������������������������������

loc_24A9:				; CODE XREF: Stdio_Fread+18j Stdio_Fread+2Ej
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_248E
		jmp	loc_2611
; ���������������������������������������������������������������������������

loc_24B6:				; CODE XREF: Stdio_Fread+16j
		test	word ptr [di+2], 40h
		jnz	short loc_24C0
		jmp	loc_25B2
; ���������������������������������������������������������������������������

loc_24C0:				; CODE XREF: Stdio_Fread+47j
		cmp	word ptr [di+6], 0
		jnz	short loc_24C9
		jmp	loc_256E
; ���������������������������������������������������������������������������

loc_24C9:				; CODE XREF: Stdio_Fread+50j
		mov	ax, [di+6]
		cmp	ax, [bp+arg_2]
		jnb	short loc_2529
		cmp	word ptr [di], 0
		jz	short loc_24E1
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_24A4

loc_24E1:				; CODE XREF: Stdio_Fread+60j
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4BC0h], 800h
		jz	short loc_2508
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

loc_2508:				; CODE XREF: Stdio_Fread+7Bj
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
		jnz	short loc_2523
		jmp	loc_2611
; ���������������������������������������������������������������������������

loc_2523:				; CODE XREF: Stdio_Fread+AAj
		jmp	loc_24A4
; ���������������������������������������������������������������������������
		jmp	loc_2611
; ���������������������������������������������������������������������������

loc_2529:				; CODE XREF: Stdio_Fread+5Bj
		mov	ax, [di]
		add	ax, [bp+arg_2]
		jl	short loc_254D
		cmp	word ptr [di], 0
		jnz	short loc_253F
		mov	ax, 0FFFFh
		sub	ax, [di+6]
		mov	[di], ax
		jmp	short loc_254D
; ���������������������������������������������������������������������������

loc_253F:				; CODE XREF: Stdio_Fread+BFj
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_254D
		jmp	loc_24A4
; ���������������������������������������������������������������������������

loc_254D:				; CODE XREF: Stdio_Fread+BAj Stdio_Fread+C9j ...
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
		jmp	loc_2611
; ���������������������������������������������������������������������������

loc_256E:				; CODE XREF: Stdio_Fread+52j
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4BC0h], 800h
		jz	short loc_2595
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

loc_2595:				; CODE XREF: Stdio_Fread+108j
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
		jz	short loc_2611
		jmp	loc_24A4
; ���������������������������������������������������������������������������
		jmp	short loc_2611
; ���������������������������������������������������������������������������

loc_25B2:				; CODE XREF: Stdio_Fread+49j
		cmp	word ptr [di+6], 0
		jz	short loc_25F6
		jmp	short loc_25EA
; ���������������������������������������������������������������������������

loc_25BA:				; CODE XREF: Stdio_Fread+17Ej
		inc	word ptr [di]
		jge	short loc_25D2
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	si, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [si]
		mov	[bx], al
		mov	ah, 0
		jmp	short loc_25E2
; ���������������������������������������������������������������������������

loc_25D2:				; CODE XREF: Stdio_Fread+148j
		push	di
		mov	bx, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [bx]
		push	ax
		push	cs
		call	near ptr Stdio_Ungetc
		pop	cx
		pop	cx

loc_25E2:				; CODE XREF: Stdio_Fread+15Cj
		cmp	ax, 0FFFFh
		jnz	short loc_25EA
		jmp	loc_24A4
; ���������������������������������������������������������������������������

loc_25EA:				; CODE XREF: Stdio_Fread+144j
					; Stdio_Fread+171j
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_25BA
		jmp	short loc_2611
; ���������������������������������������������������������������������������

loc_25F6:				; CODE XREF: Stdio_Fread+142j
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
		jz	short loc_2611
		jmp	loc_24A4
; ���������������������������������������������������������������������������

loc_2611:				; CODE XREF: Stdio_Fread+3Fj Stdio_Fread+ACj ...
		mov	ax, [bp+var_2]

loc_2614:				; CODE XREF: Stdio_Fread+32j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	6
Stdio_Fread	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — 112 lignes, initialise les champs d'une structure FILE* (buffer, position, flags
; [si+2] bits 4/8) : setvbuf()/setup interne de flux (fdopen).
; ==============================================================================================
Stdio_SetupFileStruct	proc far		; CODE XREF: seg000:0E0Cp seg000:0E44p

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
		jnz	short loc_2638
		cmp	[bp+arg_4], 2
		jg	short loc_2638
		cmp	di, 7FFFh
		jbe	short loc_263E

loc_2638:				; CODE XREF: Stdio_SetupFileStruct+Ej Stdio_SetupFileStruct+14j	...
		mov	ax, 0FFFFh
		jmp	loc_26F0
; ���������������������������������������������������������������������������

loc_263E:				; CODE XREF: Stdio_SetupFileStruct+1Aj
		cmp	word_71E30, 0
		jnz	short loc_2653
		cmp	si, 4A8Eh
		jnz	short loc_2653
		mov	word_71E30, 1
		jmp	short loc_2666
; ���������������������������������������������������������������������������

loc_2653:				; CODE XREF: Stdio_SetupFileStruct+27j Stdio_SetupFileStruct+2Dj
		cmp	word_71E2E, 0
		jnz	short loc_2666
		cmp	si, 4A7Eh
		jnz	short loc_2666
		mov	word_71E2E, 1

loc_2666:				; CODE XREF: Stdio_SetupFileStruct+35j Stdio_SetupFileStruct+3Cj ...
		cmp	word ptr [si], 0
		jz	short loc_267E
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

loc_267E:				; CODE XREF: Stdio_SetupFileStruct+4Dj
		test	word ptr [si+2], 4
		jz	short loc_268E
		push	word ptr [si+8]
		call	Heap_FreeAndCoalesce_5D30E
		pop	cx

loc_268E:				; CODE XREF: Stdio_SetupFileStruct+67j
		and	word ptr [si+2], 0FFF3h
		mov	word ptr [si+6], 0
		mov	ax, si
		add	ax, 5
		mov	[si+8],	ax
		mov	[si+0Ah], ax
		cmp	[bp+arg_4], 2
		jz	short loc_26EE
		or	di, di
		jbe	short loc_26EE
		mov	word ptr off_71B22+2, seg seg000
		mov	word ptr off_71B22, 2D01h
		cmp	[bp+arg_2], 0
		jnz	short loc_26D8
		push	di
		call	Runtime_StackOverflowCheck_5D22B
		pop	cx
		mov	[bp+arg_2], ax
		or	ax, ax
		jnz	short loc_26CF
		jmp	loc_2638
; ���������������������������������������������������������������������������

loc_26CF:				; CODE XREF: Stdio_SetupFileStruct+AEj
		or	word ptr [si+2], 4
		jmp	short loc_26D8
; ���������������������������������������������������������������������������
		jmp	loc_2638
; ���������������������������������������������������������������������������

loc_26D8:				; CODE XREF: Stdio_SetupFileStruct+A0j Stdio_SetupFileStruct+B7j
		mov	ax, [bp+arg_2]
		mov	[si+0Ah], ax
		mov	[si+8],	ax
		mov	[si+6],	di
		cmp	[bp+arg_4], 1
		jnz	short loc_26EE
		or	word ptr [si+2], 8

loc_26EE:				; CODE XREF: Stdio_SetupFileStruct+8Aj Stdio_SetupFileStruct+8Ej ...
		xor	ax, ax

loc_26F0:				; CODE XREF: Stdio_SetupFileStruct+1Fj
		pop	di
		pop	si
		pop	bp
		retf
Stdio_SetupFileStruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — copie bornée d'un composant de chaîne : si trop long → sub_2B6D (strncpy tronqué),
; sinon sub_2A82 (strcpy) : helper de copie de champ, utilisé par le parseur de chemin
; sub_278A.
; ==============================================================================================
Path_CopyFieldBounded	proc near		; CODE XREF: Path_Splitpath+BFp Path_Splitpath+E6p ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_272D
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, [bp+arg_0]
		jb	short loc_2724
		push	[bp+arg_0]
		push	di
		push	si
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+si], 0
		jmp	short loc_272D
; ���������������������������������������������������������������������������

loc_2724:				; CODE XREF: Path_CopyFieldBounded+19j
		push	di
		push	si
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx

loc_272D:				; CODE XREF: Path_CopyFieldBounded+Dj Path_CopyFieldBounded+2Ej
		pop	di
		pop	si
		pop	bp
		retn	6
Path_CopyFieldBounded	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near — petit switch (4 cas) sur les derniers caractères pour détecter un séparateur
; d'extension ('.') : helper du parseur de chemin DOS.
; ==============================================================================================
Path_ExtSeparatorCheck	proc near		; CODE XREF: Path_Splitpath+A3p

var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si-1], 2Eh ; '.'
		jnz	short loc_2744
		dec	si

loc_2744:				; CODE XREF: Path_ExtSeparatorCheck+Ej
		dec	si
		mov	bx, si
		mov	al, [bx]
		cbw
		mov	[bp+var_2], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_277A

loc_2753:				; CODE XREF: Path_ExtSeparatorCheck+2Bj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_2762
		add	bx, 2
		loop	loc_2753
		jmp	short loc_2771	; default
; ���������������������������������������������������������������������������

loc_2762:				; CODE XREF: Path_ExtSeparatorCheck+26j
		jmp	word ptr cs:[bx+8] ; switch jump

loc_2766:				; DATA XREF: seg000:2782o
		cmp	byte ptr [si-2], 0 ; case 0x3A
		jnz	short loc_2771	; default

loc_276C:				; CODE XREF: Path_ExtSeparatorCheck:loc_2762j
					; DATA XREF: seg000:2782o
		mov	ax, 1		; case 0x0
		jmp	short loc_2773
; ���������������������������������������������������������������������������

loc_2771:				; CODE XREF: Path_ExtSeparatorCheck+2Dj Path_ExtSeparatorCheck+37j
		xor	ax, ax		; default

loc_2773:				; CODE XREF: Path_ExtSeparatorCheck+3Cj
		pop	si
		mov	sp, bp
		pop	bp
		retn	2
Path_ExtSeparatorCheck	endp

; ���������������������������������������������������������������������������
word_277A	dw	0,   2Fh,   3Ah,   5Ch ; DATA XREF: Path_ExtSeparatorCheck+1Do
					; value	table for switch statement
		dw offset loc_276C	; jump table for switch	statement
		dw offset loc_276C
		dw offset loc_2766
		dw offset loc_276C

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — 223 lignes, implémentation de _splitpath()/fnsplit() : parse un chemin DOS complet en
; composants drive:\dir\name.ext via switch sur séparateurs (':','\\','.','*'), utilise
; sub_26F4/sub_2733.
; ==============================================================================================
Path_Splitpath	proc far		; CODE XREF: seg000:2068p seg000:2915p

var_56		= word ptr -56h
var_54		= word ptr -54h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 56h
		push	si
		push	di
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_27A3
		mov	bx, [bp+arg_2]
		mov	byte ptr [bx], 0

loc_27A3:				; CODE XREF: Path_Splitpath+11j
		cmp	[bp+arg_4], 0
		jz	short loc_27AF
		mov	bx, [bp+arg_4]
		mov	byte ptr [bx], 0

loc_27AF:				; CODE XREF: Path_Splitpath+1Dj
		cmp	[bp+arg_6], 0
		jz	short loc_27BB
		mov	bx, [bp+arg_6]
		mov	byte ptr [bx], 0

loc_27BB:				; CODE XREF: Path_Splitpath+29j
		cmp	[bp+arg_8], 0
		jz	short loc_27C7
		mov	bx, [bp+arg_8]
		mov	byte ptr [bx], 0

loc_27C7:				; CODE XREF: Path_Splitpath+35j
		lea	si, [bp+var_56]
		jmp	short loc_27CF
; ���������������������������������������������������������������������������

loc_27CC:				; CODE XREF: Path_Splitpath+4Bj
		inc	[bp+arg_0]

loc_27CF:				; CODE XREF: Path_Splitpath+40j
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx], 20h ; ' '
		jz	short loc_27CC
		push	bx
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	di, ax
		cmp	ax, 50h	; 'P'
		jle	short loc_27E8
		mov	di, 50h	; 'P'

loc_27E8:				; CODE XREF: Path_Splitpath+59j
		mov	byte ptr [si], 0
		inc	si
		push	di
		push	[bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		add	si, di
		mov	byte ptr [si], 0
		xor	di, di

loc_2800:				; CODE XREF: Path_Splitpath+92j Path_Splitpath+AAj ...
		dec	si		; default
		mov	bx, si
		mov	al, [bx]
		cbw
		mov	[bp+var_4], ax
		mov	cx, 7		; switch 7 cases
		mov	bx, offset word_28E6

loc_280F:				; CODE XREF: Path_Splitpath+90j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_281E
		add	bx, 2
		loop	loc_280F
		jmp	short loc_2800	; default
; ���������������������������������������������������������������������������

loc_281E:				; CODE XREF: Path_Splitpath+8Bj
		jmp	word ptr cs:[bx+0Eh] ; switch jump

loc_2822:				; DATA XREF: seg000:28F4o
		or	di, di		; case 0x2E
		jnz	short loc_2832
		cmp	byte ptr [si+1], 0
		jnz	short loc_2832
		push	si
		call	Path_ExtSeparatorCheck
		mov	di, ax

loc_2832:				; CODE XREF: Path_Splitpath+9Aj Path_Splitpath+A0j
		or	di, di
		jnz	short loc_2800	; default
		test	[bp+var_2], 2
		jnz	short loc_2800	; default
		or	[bp+var_2], 2
		push	[bp+arg_8]
		push	si
		mov	ax, 4
		push	ax
		call	Path_CopyFieldBounded
		mov	byte ptr [si], 0
		jmp	short loc_2800	; default
; ���������������������������������������������������������������������������

loc_2851:				; CODE XREF: Path_Splitpath:loc_281Ej
					; DATA XREF: seg000:28F4o
		lea	ax, [bp+var_54]	; case 0x3A
		cmp	ax, si
		jnz	short loc_2800	; default

loc_2858:				; CODE XREF: Path_Splitpath:loc_281Ej
					; DATA XREF: seg000:28F4o
		or	di, di		; case 0x0
		jz	short loc_2879	; case 0x2F
		inc	si
		mov	bx, si
		cmp	byte ptr [bx], 0
		jz	short loc_2868
		or	[bp+var_2], 8

loc_2868:				; CODE XREF: Path_Splitpath+D8j
		push	[bp+arg_4]
		push	si
		mov	ax, 41h	; 'A'
		push	ax
		call	Path_CopyFieldBounded
		mov	byte ptr [si], 0
		dec	si
		jmp	short loc_28C0
; ���������������������������������������������������������������������������

loc_2879:				; CODE XREF: Path_Splitpath:loc_281Ej
					; Path_Splitpath+D0j
					; DATA XREF: ...
		or	di, di		; case 0x2F
		jnz	short loc_2800	; default
		inc	di
		inc	si
		mov	bx, si
		cmp	byte ptr [bx], 0
		jz	short loc_288A
		or	[bp+var_2], 4

loc_288A:				; CODE XREF: Path_Splitpath+FAj
		push	[bp+arg_6]
		push	si
		mov	ax, 8
		push	ax
		call	Path_CopyFieldBounded
		mov	byte ptr [si], 0
		dec	si
		cmp	byte ptr [si], 0
		jz	short loc_28C0
		cmp	byte ptr [si], 3Ah ; ':'
		jz	short loc_28A6
		jmp	loc_2800	; default
; ���������������������������������������������������������������������������

loc_28A6:				; CODE XREF: Path_Splitpath+117j
		lea	ax, [bp+var_54]
		cmp	ax, si
		jz	short loc_28B0
		jmp	loc_2800	; default
; ���������������������������������������������������������������������������

loc_28B0:				; CODE XREF: Path_Splitpath+121j
		jmp	short loc_28C0
; ���������������������������������������������������������������������������

loc_28B2:				; CODE XREF: Path_Splitpath:loc_281Ej
					; DATA XREF: seg000:28F4o
		or	di, di		; case 0x2A
		jz	short loc_28B9
		jmp	loc_2800	; default
; ���������������������������������������������������������������������������

loc_28B9:				; CODE XREF: Path_Splitpath+12Aj
		or	[bp+var_2], 1
		jmp	loc_2800	; default
; ���������������������������������������������������������������������������

loc_28C0:				; CODE XREF: Path_Splitpath+EDj
					; Path_Splitpath+112j ...
		cmp	byte ptr [si], 3Ah ; ':'
		jnz	short loc_28DD
		cmp	byte ptr [bp+var_56+1],	0
		jz	short loc_28CF
		or	[bp+var_2], 10h

loc_28CF:				; CODE XREF: Path_Splitpath+13Fj
		push	[bp+arg_2]
		lea	ax, [bp+var_56+1]
		push	ax
		mov	ax, 2
		push	ax
		call	Path_CopyFieldBounded

loc_28DD:				; CODE XREF: Path_Splitpath+139j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Path_Splitpath	endp

; ���������������������������������������������������������������������������
word_28E6	dw	0,   2Ah,   2Eh,   2Fh ; DATA XREF: Path_Splitpath+82o
		dw    3Ah,   3Fh,   5Ch	; value	table for switch statement
		dw offset loc_2858	; jump table for switch	statement
		dw offset loc_28B2
		dw offset loc_2822
		dw offset loc_2879
		dw offset loc_2851
		dw offset loc_28B2
		dw offset loc_2879
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr Path_Splitpath
		add	sp, 0Ah
		pop	bp
		retf
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
; far — wrapper sprintf (sub_1233) avec format fixe 291Dh : génère un message formaté standard
; (probable message d'erreur runtime).
; ==============================================================================================
CRT_Msg_Sprintf1	proc far		; CODE XREF: seg016:06DFP seg027:0B91P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 291Dh
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
; far — variante de sub_2945, arguments passés différemment (sprintf format 291Dh) : sibling
; wrapper de génération de message.
; ==============================================================================================
CRT_Msg_Sprintf2	proc far		; CODE XREF: String_ConstructWithFallback+1BP
					; Video_SetModeIfChanged_5E7EA+1BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 291Dh
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	CRT_Sprintf_Full
		pop	bp
		retf
CRT_Msg_Sprintf2	endp ; sp = -8

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+4]
		mov	bx, [si]
		inc	word ptr [si]
		mov	dl, [bx]
		mov	al, dl
		or	al, al
		jnz	short loc_2996
		mov	ax, 0FFFFh
		jmp	short loc_299A
; ���������������������������������������������������������������������������

loc_2996:				; CODE XREF: seg000:298Fj
		mov	al, dl
		mov	ah, 0

loc_299A:				; CODE XREF: seg000:2994j
		pop	si
		pop	bp
		retn
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		dec	word ptr [si]
		pop	si
		pop	bp
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — wrapper vers sub_749(sprintf) avec 2 formats fixes (299Dh/297Eh) : génération de
; message formaté standard.
; ==============================================================================================
CRT_Msg_Sprintf3	proc far		; CODE XREF: CRT_FormatAndValidateStream_8ED6E:loc_8EDA0P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		lea	ax, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+arg_0]
		push	ax
		mov	ax, 299Dh
		push	ax
		mov	ax, 297Eh
		push	ax
		call	CRT_Sprintf_Core
		add	sp, 0Ah
		pop	bp
		retf
CRT_Msg_Sprintf3	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		lea	ax, [bp+6]
		push	ax
		mov	ax, 299Dh
		push	ax
		mov	ax, 297Eh
		push	ax
		call	CRT_Sprintf_Core
		add	sp, 0Ah
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — concatène deux chaînes ASCIIZ (trouve fin via repne scasb x2, puis movsw/movsb) :
; strcat().
; ==============================================================================================
CRT_Strcat	proc far		; CODE XREF: Radio_LoadAndTriggerVoice+140P
					; TextRenderer_InputFieldHandler_5A0F3+32P ...

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
		jz	short loc_2A11
		movsb
		dec	cx

loc_2A11:				; CODE XREF: CRT_Strcat+29j
		shr	cx, 1
		rep movsw
		jnb	short loc_2A18
		movsb

loc_2A18:				; CODE XREF: CRT_Strcat+31j
		xchg	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strcat	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — recherche d'un caractère dans une chaîne avec alignement pair/impair (lodsb/lodsw) :
; strchr() optimisé mot.
; ==============================================================================================
CRT_Strchr_WordAligned	proc far		; CODE XREF: Radio_LoadAndTriggerVoice+15DP

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	bl, [bp+arg_2]
		test	si, 1
		jz	short loc_2A37
		lodsb
		cmp	al, bl
		jz	short loc_2A4C
		and	al, al
		jz	short loc_2A48

loc_2A37:				; CODE XREF: CRT_Strchr_WordAligned+Fj CRT_Strchr_WordAligned+29j
		lodsw
		cmp	al, bl
		jz	short loc_2A4D
		and	al, al
		jz	short loc_2A48
		cmp	ah, bl
		jz	short loc_2A4C
		and	ah, ah
		jnz	short loc_2A37

loc_2A48:				; CODE XREF: CRT_Strchr_WordAligned+18j CRT_Strchr_WordAligned+21j
		xor	ax, ax
		jmp	short loc_2A50
; ���������������������������������������������������������������������������

loc_2A4C:				; CODE XREF: CRT_Strchr_WordAligned+14j CRT_Strchr_WordAligned+25j
		inc	si

loc_2A4D:				; CODE XREF: CRT_Strchr_WordAligned+1Dj
		lea	ax, [si-2]

loc_2A50:				; CODE XREF: CRT_Strchr_WordAligned+2Dj
		pop	si
		pop	bp
		retf
CRT_Strchr_WordAligned	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — comparaison de deux chaînes selon longueur de la seconde (repe cmpsb) : strncmp-like
; (bornée par arg_2).
; ==============================================================================================
CRT_Strncmp_Like	proc far		; CODE XREF: Terrain_HeightmapAllocate+71P
					; Terrain_HeightmapAllocate+87P ...

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
; far — copie une chaîne ASCIIZ (strlen puis rep movsb) : strcpy().
; ==============================================================================================
CRT_Strcpy	proc far		; CODE XREF: Path_CopyFieldBounded+34p
					; Radio_LoadAndTriggerVoice:loc_1EFABP	...

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
; far — alloue (sub_5D22B) et copie une chaîne (strlen+1 puis sub_229C) : strdup().
; ==============================================================================================
CRT_Strdup	proc far		; CODE XREF: AudioQueue_ProcessAndDecode_AB8A1+11DP

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
		call	Runtime_StackOverflowCheck_5D22B
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2AD4
		push	[bp+var_2]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6

loc_2AD4:				; CODE XREF: CRT_Strdup+21j
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
; far — comparaison de chaînes insensible à la casse (table de plage 617Ah = A-Z/a-z) :
; stricmp().
; ==============================================================================================
CRT_Stricmp	proc far		; CODE XREF: StreamReader_ParseFormattedString_64217:loc_642A7P
					; AudioQueue_MainProcessEntry_ABBEF+57P

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

loc_2AF3:				; CODE XREF: CRT_Stricmp+1Fj CRT_Stricmp+38j
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2B16
		scasb
		jz	short loc_2AF3
		cmp	al, ch
		jb	short loc_2B07
		cmp	al, cl
		ja	short loc_2B07
		sub	al, 20h	; ' '

loc_2B07:				; CODE XREF: CRT_Stricmp+23j CRT_Stricmp+27j
		cmp	bl, ch
		jb	short loc_2B12
		cmp	bl, cl
		ja	short loc_2B12
		sub	bl, 20h	; ' '

loc_2B12:				; CODE XREF: CRT_Stricmp+2Dj CRT_Stricmp+31j
		cmp	al, bl
		jz	short loc_2AF3

loc_2B16:				; CODE XREF: CRT_Stricmp+1Cj
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
CRT_Stricmp	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — strlen() (repne scasb).
; ==============================================================================================
CRT_Strlen	proc far		; CODE XREF: CRT_Strrchr_Like+13p Path_CopyFieldBounded+12p ...

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
; near — prologue partagé (mov es=ds, cld, di=arg) : probable tête commune d'une famille
; memcmp/memchr (chunk suivant non capturé dans ce batch).
; ==============================================================================================
CRT_MemFamily_Prologue	proc near		; CODE XREF: CRT_StringLengthHelper_8ED1F+29P

arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		mov	di, [bp+arg_4]
CRT_MemFamily_Prologue	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far — comparaison bornée de deux chaînes avec calcul de longueur via scasb : memcmp/strncmp
; variante, utilisée via off_6D0BC.
; ==============================================================================================
CRT_Memcmp_Bounded	proc far		; CODE XREF: CRT_FlushSprintfBuf+13p
					; DATA XREF: seg339:off_6D0BCo
		mov	si, di
		mov	ax, [bp+0Ah]
		mov	cx, ax
		jcxz	short loc_2B69
		mov	bx, ax
		xor	al, al
		repne scasb
		sub	bx, cx
		mov	cx, bx
		mov	di, si
		mov	si, [bp+6]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, [di-1]
		xor	ah, ah
		mov	bh, ah
		sub	ax, bx

loc_2B69:				; CODE XREF: CRT_Memcmp_Bounded+7j
		pop	di
		pop	si
		pop	bp
		retf
CRT_Memcmp_Bounded	endp ; sp =  6


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — copie bornée avec padding (strlen source, rep movsb puis rep stosb pour compléter) :
; strncpy() avec remplissage.
; ==============================================================================================
CRT_Strncpy_Pad	proc far		; CODE XREF: Path_CopyFieldBounded+22p Path_Splitpath+69p ...

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

; ==============================================================================================
; far — met en majuscule en place (soustrait 0x20 sur plage a-z) : strupr().
; ==============================================================================================
CRT_Strupr	proc far		; CODE XREF: Widget_RenderComplexLayout_60BA6+FAP
					; StreamReader_ParseFormattedString_64217+27P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2BB0
; ���������������������������������������������������������������������������

loc_2BA5:				; CODE XREF: CRT_Strupr+1Aj
		sub	al, 61h	; 'a'
		cmp	al, 19h
		ja	short loc_2BB0
		add	al, 41h	; 'A'
		mov	[si-1],	al

loc_2BB0:				; CODE XREF: CRT_Strupr+Aj CRT_Strupr+10j
		lodsb
		and	al, al
		jnz	short loc_2BA5
		xchg	ax, dx
		pop	si
		pop	bp
		retf
CRT_Strupr	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — 166 lignes, écriture bas niveau DOS d'un buffer (utilisée par sub_1F99/sub_232C) :
; implémentation write() de bas niveau du runtime stdio.
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
		cmp	di, word_71C6E
		jb	short loc_2BD8
		mov	ax, 6
		push	ax
		call	CRT_ClampMathIndex
		jmp	loc_2CC1
; ���������������������������������������������������������������������������

loc_2BD8:				; CODE XREF: Stdio_WriteLowLevel+13j
		mov	ax, [bp+arg_4]
		inc	ax
		cmp	ax, 2
		jnb	short loc_2BE6
		xor	ax, ax
		jmp	loc_2CC1
; ���������������������������������������������������������������������������

loc_2BE6:				; CODE XREF: Stdio_WriteLowLevel+26j
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+4BC0h], 800h
		jz	short loc_2C05
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

loc_2C05:				; CODE XREF: Stdio_WriteLowLevel+37j
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+4BC0h], 4000h
		jnz	short loc_2C21
		push	[bp+arg_4]
		push	si
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		jmp	loc_2CC1
; ���������������������������������������������������������������������������

loc_2C21:				; CODE XREF: Stdio_WriteLowLevel+56j
		mov	bx, di
		shl	bx, 1
		and	word ptr [bx+4BC0h], 0FDFFh
		mov	[bp+var_6], si
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		jmp	short loc_2C85
; ���������������������������������������������������������������������������

loc_2C36:				; CODE XREF: Stdio_WriteLowLevel+D4j
		dec	[bp+var_2]
		mov	bx, [bp+var_6]
		inc	[bp+var_6]
		mov	al, [bx]
		mov	[bp+var_3], al
		cmp	al, 0Ah
		jnz	short loc_2C4C
		mov	byte ptr [si], 0Dh
		inc	si

loc_2C4C:				; CODE XREF: Stdio_WriteLowLevel+8Dj
		mov	al, [bp+var_3]
		mov	[si], al
		inc	si
		lea	ax, [bp+var_88]
		mov	dx, si
		sub	dx, ax
		cmp	dx, 80h	; '�'
		jl	short loc_2C89
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
		jz	short loc_2C85
		cmp	dx, 0FFFFh
		jnz	short loc_2C7D

loc_2C78:				; CODE XREF: Stdio_WriteLowLevel+FAj
		mov	ax, 0FFFFh
		jmp	short loc_2CBC
; ���������������������������������������������������������������������������

loc_2C7D:				; CODE XREF: Stdio_WriteLowLevel+BDj
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_2]
		jmp	short loc_2CB8
; ���������������������������������������������������������������������������

loc_2C85:				; CODE XREF: Stdio_WriteLowLevel+7Bj Stdio_WriteLowLevel+B8j
		lea	si, [bp+var_88]

loc_2C89:				; CODE XREF: Stdio_WriteLowLevel+A5j
		cmp	[bp+var_2], 0
		jnz	short loc_2C36
		lea	ax, [bp+var_88]
		sub	si, ax
		mov	ax, si
		or	ax, ax
		jbe	short loc_2CBE
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
		jz	short loc_2CBE
		cmp	dx, 0FFFFh
		jz	short loc_2C78
		mov	ax, [bp+arg_4]

loc_2CB8:				; CODE XREF: Stdio_WriteLowLevel+CAj
		add	ax, dx
		sub	ax, si

loc_2CBC:				; CODE XREF: Stdio_WriteLowLevel+C2j
		jmp	short loc_2CC1
; ���������������������������������������������������������������������������

loc_2CBE:				; CODE XREF: Stdio_WriteLowLevel+E0j Stdio_WriteLowLevel+F5j
		mov	ax, [bp+arg_4]

loc_2CC1:				; CODE XREF: Stdio_WriteLowLevel+1Cj Stdio_WriteLowLevel+2Aj ...
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Stdio_WriteLowLevel	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — 44 lignes, gestion d'erreur de stream avec messages fixes (4D7Ch/5EA8h) : probable
; handler d'erreur matherr/ferror.
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
		test	word ptr [bx+4BC0h], 1
		jz	short loc_2CDD
		mov	ax, 5
		push	ax
		jmp	short loc_2CFC
; ���������������������������������������������������������������������������

loc_2CDD:				; CODE XREF: Stdio_ErrorHandler+Ej
		mov	ah, 40h	; '@'
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		jb	short loc_2CFB
		push	ax
		mov	bx, [bp+arg_0]
		shl	bx, 1
		or	word ptr [bx+4BC0h], 1000h
		pop	ax
		jmp	short loc_2CFF
; ���������������������������������������������������������������������������

loc_2CFB:				; CODE XREF: Stdio_ErrorHandler+23j
		push	ax

loc_2CFC:				; CODE XREF: Stdio_ErrorHandler+14j
		call	CRT_ClampMathIndex

loc_2CFF:				; CODE XREF: Stdio_ErrorHandler+32j
		pop	bp
		retf
Stdio_ErrorHandler	endp

; ���������������������������������������������������������������������������
		push	si
		push	di
		mov	di, 4
		mov	si, 4A7Eh
		jmp	short loc_2D1D
; ���������������������������������������������������������������������������

loc_2D0B:				; CODE XREF: seg000:2D1Fj
		test	word ptr [si+2], 3
		jz	short loc_2D19
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx

loc_2D19:				; CODE XREF: seg000:2D10j
		dec	di
		add	si, 10h

loc_2D1D:				; CODE XREF: seg000:2D09j
		or	di, di
		jnz	short loc_2D0B
		pop	di
		pop	si
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — (cluster memoire/chaînes, à approfondir si besoin) probable variante memcmp/memmove
; additionnelle du runtime.
; ==============================================================================================
CRT_MemFamily_Extra1	proc far		; CODE XREF: Palette_ParseBlock+4CP
					; Interp_FractionalCompute+BEP ...

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
		jnb	short loc_2D3C
		movsb

loc_2D3C:				; CODE XREF: CRT_MemFamily_Extra1+15j
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
; far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra2	proc far		; CODE XREF: Path_BuildComposite+1BP
					; Path_BuildComposite:loc_2B061P	...

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
		jz	short loc_2D78
		movsb
		dec	cx

loc_2D78:				; CODE XREF: CRT_MemFamily_Extra2+2Cj
		shr	cx, 1
		rep movsw
		jnb	short loc_2D7F
		movsb

loc_2D7F:				; CODE XREF: CRT_MemFamily_Extra2+34j
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
; far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra3	proc far		; CODE XREF: Text_ParseInt:loc_1EDC6P
					; Path_ResolveDataFile+10P

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
		jz	short loc_2DA2
		lodsb
		cmp	al, bl
		jz	short loc_2DBA
		and	al, al
		jz	short loc_2DB3

loc_2DA2:				; CODE XREF: CRT_MemFamily_Extra3+10j CRT_MemFamily_Extra3+2Aj
		lodsw
		cmp	al, bl
		jz	short loc_2DBB
		and	al, al
		jz	short loc_2DB3
		cmp	ah, bl
		jz	short loc_2DBA
		and	ah, ah
		jnz	short loc_2DA2

loc_2DB3:				; CODE XREF: CRT_MemFamily_Extra3+19j CRT_MemFamily_Extra3+22j
		pop	ds
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2DC1
; ���������������������������������������������������������������������������

loc_2DBA:				; CODE XREF: CRT_MemFamily_Extra3+15j CRT_MemFamily_Extra3+26j
		inc	si

loc_2DBB:				; CODE XREF: CRT_MemFamily_Extra3+1Ej
		lea	ax, [si-2]
		mov	dx, ds
		pop	ds

loc_2DC1:				; CODE XREF: CRT_MemFamily_Extra3+31j
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra4	proc far		; CODE XREF: Roster_FindByNameAndFlag+28P
					; Roster_FindByNameOrder+28P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		cld
		xor	ax, ax
		mov	bx, ax
		les	di, [bp+arg_4]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		mov	di, si
		lds	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, es:[di-1]
		sub	ax, bx
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra5	proc far		; CODE XREF: seg024:072BP
					; String_ConstructFromPtr+4DP ...

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
; far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra6	proc far		; CODE XREF: DisplaySurface_Construct_5E819+35P
					; DisplaySurface_CloneOrResize_5E89E+19P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+arg_0]
		xor	ax, ax
		cmp	ax, word ptr [bp+arg_0+2]
		jnz	short loc_2E2F
		cmp	ax, di
		jz	short loc_2E39

loc_2E2F:				; CODE XREF: CRT_MemFamily_Extra6+Cj
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	ax, cx
		not	ax
		dec	ax

loc_2E39:				; CODE XREF: CRT_MemFamily_Extra6+10j
		pop	di
		pop	bp
		retf
CRT_MemFamily_Extra6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra7	proc far		; CODE XREF: Container_Op_2241B:loc_22461P
					; seg039:1018P	...

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
		jcxz	short loc_2E6E
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

loc_2E6E:				; CODE XREF: CRT_MemFamily_Extra7+12j
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra8	proc far		; CODE XREF: seg009:02FCP
					; Container_Op_2241B+1DP ...

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


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — boucle lodsb jusqu'à octet nul, restaure ds : strlen far / recherche fin de chaîne
; avec segment.
; ==============================================================================================
CRT_Strlen_Far	proc far		; CODE XREF: MissionScenario_DecodeFieldA_A9B14+14P
					; MissionScenario_DecodeFieldB_A9BD8+2DP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		push	ds
		lds	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2EBD
; ���������������������������������������������������������������������������

loc_2EB2:				; CODE XREF: CRT_Strlen_Far+1Bj
		sub	al, 61h	; 'a'
		cmp	al, 19h
		ja	short loc_2EBD
		add	al, 41h	; 'A'
		mov	[si-1],	al

loc_2EBD:				; CODE XREF: CRT_Strlen_Far+Bj CRT_Strlen_Far+11j
		lodsb
		and	al, al
		jnz	short loc_2EB2
		xchg	ax, dx
		mov	dx, ds
		pop	ds
		pop	si
		pop	bp
		retf
CRT_Strlen_Far	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — 380 lignes, moteur scanf/_doscan : switch 16 cas (codes 0x4-0x87/0xA4-0xA5)
; dispatchant les spécificateurs de format via callbacks [bp+var_4]/[bp+var_8], gestion
; near/far/pointeurs lointains : cœur de sscanf/fscanf.
; ==============================================================================================
CRT_Doscan_Core	proc far		; CODE XREF: Formation_GuidanceSolution+27CP
					; TerrainSector_ParseTriple_9A844+14P ...

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
		jz	short loc_2F02
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_2F1A
		jmp	short loc_2F15
; ���������������������������������������������������������������������������

loc_2F02:				; CODE XREF: CRT_Doscan_Core+1Aj
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2F1A

loc_2F15:				; CODE XREF: CRT_Doscan_Core+37j
		mov	[bp+var_A], 0

loc_2F1A:				; CODE XREF: CRT_Doscan_Core+35j CRT_Doscan_Core+4Aj
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_2F25
		jmp	loc_301D
; ���������������������������������������������������������������������������

loc_2F25:				; CODE XREF: CRT_Doscan_Core+57j
		mov	word ptr [bp+var_10], 0
		test	di, 10h
		jz	short loc_2F35
		mov	word ptr [bp+var_10], 4

loc_2F35:				; CODE XREF: CRT_Doscan_Core+65j
		test	di, 40h
		jnz	short loc_2F3E
		jmp	loc_2FBE
; ���������������������������������������������������������������������������

loc_2F3E:				; CODE XREF: CRT_Doscan_Core+70j
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
		jnz	short loc_2F77

loc_2F70:				; CODE XREF: CRT_Doscan_Core+115j
					; CRT_Doscan_Core+11Dj ...
		xor	dx, dx
		xor	ax, ax
		jmp	loc_3115
; ���������������������������������������������������������������������������

loc_2F77:				; CODE XREF: CRT_Doscan_Core+A5j
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
		jmp	short loc_2F98
; ���������������������������������������������������������������������������

loc_2F92:				; CODE XREF: CRT_Doscan_Core+D8j
		mov	ax, [bp+arg_4]
		add	[bp+var_12], ax

loc_2F98:				; CODE XREF: CRT_Doscan_Core+C7j
		mov	ax, word ptr [bp+var_10]
		add	ax, word ptr [bp+var_10+2]
		cmp	ax, [bp+var_12]
		ja	short loc_2F92
		mov	ax, [bp+var_12]
		sub	ax, word ptr [bp+var_10+2]
		sub	ax, word ptr [bp+var_10]
		add	word ptr [bp+arg_0], ax
		les	bx, [bp+arg_0]
		mov	ax, word ptr [bp+var_10+2]
		mov	es:[bx], ax
		add	word ptr [bp+arg_0], 2
		jmp	short loc_3003
; ���������������������������������������������������������������������������

loc_2FBE:				; CODE XREF: CRT_Doscan_Core+72j
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
		jb	short loc_2FE8
		ja	short loc_2F70
		cmp	[bp+var_16], 0FFFFh
		jbe	short loc_2FE8
		jmp	short loc_2F70
; ���������������������������������������������������������������������������

loc_2FE8:				; CODE XREF: CRT_Doscan_Core+113j
					; CRT_Doscan_Core+11Bj
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
		jnz	short loc_3003
		jmp	loc_2F70
; ���������������������������������������������������������������������������

loc_3003:				; CODE XREF: CRT_Doscan_Core+F3j
					; CRT_Doscan_Core+135j
		test	di, 10h
		jz	short loc_301D
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		add	word ptr [bp+arg_0], 4

loc_301D:				; CODE XREF: CRT_Doscan_Core+59j
					; CRT_Doscan_Core+13Ej
		and	di, 1A7h
		test	di, 80h
		jz	short loc_302B
		and	di, 0FEFFh

loc_302B:				; CODE XREF: CRT_Doscan_Core+15Cj
		cmp	[bp+var_A], 0
		jnz	short loc_3034
		jmp	loc_310F
; ���������������������������������������������������������������������������

loc_3034:				; CODE XREF: CRT_Doscan_Core+166j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		jmp	loc_30F1
; ���������������������������������������������������������������������������

loc_3043:				; CODE XREF: CRT_Doscan_Core+23Aj
					; CRT_Doscan_Core+243j
		mov	[bp+var_C], di
		mov	cx, 10h		; switch 16 cases
		mov	bx, offset word_311B

loc_304C:				; CODE XREF: CRT_Doscan_Core+18Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_305B
		add	bx, 2
		loop	loc_304C
		jmp	short loc_30D9	; default
; ���������������������������������������������������������������������������

loc_305B:				; CODE XREF: CRT_Doscan_Core+189j
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_305F:				; DATA XREF: seg000:off_313Bo
		push	word ptr [bp+var_10+2] ; case 0x4
		push	word ptr [bp+var_10]
		call	[bp+var_4]

loc_3068:				; CODE XREF: CRT_Doscan_Core+1ACj
		pop	cx
		pop	cx
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_306C:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		push	word ptr [bp+var_10+2] ; case 0x5
		push	word ptr [bp+var_10]
		call	[bp+var_8]
		jmp	short loc_3068
; ���������������������������������������������������������������������������

loc_3077:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; CRT_Doscan_Core:loc_3084j
					; DATA XREF: ...
		push	word ptr [bp+var_10+2] ; case 0x6
		push	word ptr [bp+var_10]
		call	[bp+var_4]
		jmp	short loc_308F
; ���������������������������������������������������������������������������

loc_3082:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		jmp	short loc_3086	; case 0x7
; ���������������������������������������������������������������������������

loc_3084:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		jmp	short loc_3077	; case 0x24
; ���������������������������������������������������������������������������

loc_3086:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; CRT_Doscan_Core:loc_3082j
					; DATA XREF: ...
		push	word ptr [bp+var_10+2] ; case 0x25
		push	word ptr [bp+var_10]
		call	[bp+var_8]

loc_308F:				; CODE XREF: CRT_Doscan_Core+1B7j
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_3091:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		push	ds		; case 0x84
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_309D:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		push	ds		; case 0x85
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_30A9:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		push	ds		; case 0x86
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_30B5:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		push	ds		; case 0x87
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_30C1:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		push	ds		; case 0xA4
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_30CD:				; CODE XREF: CRT_Doscan_Core:loc_305Bj
					; DATA XREF: seg000:off_313Bo
		push	ds		; case 0xA5
		push	si
		lds	si, [bp+var_10]
		call	[bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_30DE
; ���������������������������������������������������������������������������

loc_30D9:				; CODE XREF: CRT_Doscan_Core+190j
		nop			; default
		push	cs
		call	loc_2AD

loc_30DE:				; CODE XREF: CRT_Doscan_Core+1A1j
					; CRT_Doscan_Core:loc_308Fj ...
		mov	ax, [bp+arg_4]
		xor	dx, dx
		add	word ptr [bp+var_10], ax
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	word ptr [bp+var_10+2],	dx

loc_30F1:				; CODE XREF: CRT_Doscan_Core+177j
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_3106
		jmp	loc_3043
; ���������������������������������������������������������������������������

loc_3106:				; CODE XREF: CRT_Doscan_Core+238j
		jnz	short loc_310F
		or	ax, ax
		jbe	short loc_310F
		jmp	loc_3043
; ���������������������������������������������������������������������������

loc_310F:				; CODE XREF: CRT_Doscan_Core+168j
					; CRT_Doscan_Core:loc_3106j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_3115:				; CODE XREF: CRT_Doscan_Core+ABj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doscan_Core	endp

; ���������������������������������������������������������������������������
word_311B	dw	4,     5,     6,     7 ; DATA XREF: CRT_Doscan_Core+180o
		dw    24h,   25h,   84h,   85h ; value table for switch	statement
		dw    86h,   87h,  0A4h,  0A5h
		dw   106h,  107h,  124h,  125h
off_313B	dw offset loc_305F	; jump table for switch	statement
		dw offset loc_306C
		dw offset loc_3077
		dw offset loc_3082
		dw offset loc_3084
		dw offset loc_3086
		dw offset loc_3091
		dw offset loc_309D
		dw offset loc_30A9
		dw offset loc_30B5
		dw offset loc_30C1
		dw offset loc_30CD
		dw offset loc_3077
		dw offset loc_3082
		dw offset loc_3084
		dw offset loc_3086
seg000		ends
