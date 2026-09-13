seg207		segment	byte public 'CODE' use16
		assume cs:seg207
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658). Référencée via le thunk loc_67817 (tag 5DC2h) — constructeur d'un
; objet chronomètre.
; ==============================================================================================
Stopwatch_Construct_675EF	proc far		; CODE XREF: seg207:023Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_675F3:
		mov	si, [bp+arg_0]

loc_675F6:
		or	si, si

loc_675F8:
		jnz	short loc_67608

loc_675FA:
		push	2

loc_675FC:
		call	CRT_Malloc16_Retry

loc_67601:
		pop	cx

loc_67602:
		mov	si, ax

loc_67604:
		or	ax, ax

loc_67606:
		jz	short loc_6760C

loc_67608:				; CODE XREF: Stopwatch_Construct_675EF:loc_675F8j
		mov	word ptr [si], 0FFFFh

loc_6760C:				; CODE XREF: Stopwatch_Construct_675EF:loc_67606j
		mov	ax, si
		pop	si
		pop	bp
		retf
Stopwatch_Construct_675EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, enregistre un module de comptage de tics (loc_676E7) dans le registre de modules à
; créneaux temporisés (ModuleRegistry_RegisterModule_5FF08, seg161) avec une cadence de 60
; tics (ModuleRegistry_ConfigureAndActivate_600DB), avec avertissement d'échec
; (Runtime_FatalErrorHandler, tag 4121h). Référencée par sub_8F47A — confirme que le registre
; de modules du seg161 est utilisé au-delà du seul séquenceur de contre-mesures.
; ==============================================================================================
Stopwatch_RegisterTickModule_67611	proc far		; CODE XREF: InputSystem_InitAll_8F47A+1AP

arg_0		= word ptr  6

		push	bp

loc_67612:
		mov	bp, sp

loc_67614:
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_711CC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6765F

loc_67621:
		call	ModuleRegistry_Helper_5FE61

loc_67626:
		push	seg seg207

loc_67629:
		push	offset Stopwatch_TickCallback_676E7
		call	ModuleRegistry_RegisterModule_5FF08

loc_67631:
		add	sp, 4
		mov	[si], ax

loc_67636:
		cmp	word ptr [si], 0FFFFh
		jz	short loc_67651
		push	large 3Ch ; '<'
		push	word ptr [si]
		call	ModuleRegistry_ConfigureAndActivate_600DB
		add	sp, 6

loc_67648:
		push	word ptr [si]

loc_6764A:
		call	ModuleRegistry_Helper_60018
		jmp	short loc_67659
; ���������������������������������������������������������������������������

loc_67651:				; CODE XREF: Stopwatch_RegisterTickModule_67611+28j
		push	4121h
		call	Runtime_FatalErrorHandler_5F700

loc_67659:				; CODE XREF: Stopwatch_RegisterTickModule_67611+3Ej
		pop	cx

loc_6765A:
		mov	byte_711CC, 1

loc_6765F:				; CODE XREF: Stopwatch_RegisterTickModule_67611+Ej
		pop	si

loc_67660:
		pop	bp
		retf
Stopwatch_RegisterTickModule_67611	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Stopwatch_RegisterTickModule_67611 (ModuleRegistry_RegisterModule_5FF08,
; ConfigureAndActivate_600DB, ModuleRegistry_Helper_60018).
; ==============================================================================================
Stopwatch_RegisterTickModuleVariant_67662	proc far		; CODE XREF: TextRenderer_Main+97CP
					; ConfigOption_ConstructFull_66762+38P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp

loc_67663:
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, 0FFFFh
		cmp	byte_711CC, 0
		jz	short loc_6769A

loc_67673:
		push	large [bp+arg_2]

loc_67677:
		call	ModuleRegistry_RegisterModule_5FF08

loc_6767C:
		add	sp, 4

loc_6767F:
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_6769A
		push	large [bp+arg_6]
		push	ax
		call	ModuleRegistry_ConfigureAndActivate_600DB
		add	sp, 6
		push	si
		call	ModuleRegistry_Helper_60018
		pop	cx

loc_6769A:				; CODE XREF: Stopwatch_RegisterTickModuleVariant_67662+Fj
					; Stopwatch_RegisterTickModuleVariant_67662+22j
		mov	ax, si
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModuleVariant_67662	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, désenregistre le module de tic (ModuleRegistry_UnregisterModule_5FFBD, seg161) si
; actif. Référencée par sub_27F0E et le destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_6769F	proc far		; CODE XREF: Dialog_Close+61P
					; seg201:loc_667E0P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_676A2:
		mov	ax, [bp+arg_0]
		cmp	byte_711CC, 0
		jz	short loc_676B5
		push	[bp+arg_2]
		call	ModuleRegistry_UnregisterModule_5FFBD
		pop	cx

loc_676B5:				; CODE XREF: Stopwatch_UnregisterTickModule_6769F+Bj
		pop	bp
		retf
Stopwatch_UnregisterTickModule_6769F	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		cmp	byte_711CC, 0
		jz	short loc_676CD
		push	word ptr [bp+8]

loc_676C7:
		call	ModuleRegistry_Helper3_60052
		pop	cx

loc_676CD:				; CODE XREF: seg207:00E2j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_676CF:
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		cmp	byte_711CC, 0
		jz	short loc_676E5
		push	word ptr [bp+8]

loc_676DF:
		call	ModuleRegistry_Helper_60018

loc_676E4:
		pop	cx

loc_676E5:				; CODE XREF: seg207:00FAj
		pop	bp

locret_676E6:
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, callback de tic enregistré dans le registre de modules — incrémente le compteur global
; de tics (dword_711CD) à chaque appel.
; ==============================================================================================
Stopwatch_TickCallback_676E7:				; DATA XREF: Stopwatch_RegisterTickModule_67611:loc_67629o
		push	bp

loc_676E8:
		mov	bp, sp

loc_676EA:
		inc	dword_711CD
		pop	bp

locret_676F0:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 138 lignes, NON DÉTAILLÉE — combine ModuleRegistry_CleanupModuleSlot_5FE9F et
; sub_338 — démarre ou arrête le chronomètre (enregistrement/désenregistrement complet).
; ==============================================================================================
Stopwatch_StartOrStop_676F1	proc far		; CODE XREF: seg207:loc_6782Dp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_676F2:
		mov	bp, sp

loc_676F4:
		push	si
		push	di

loc_676F6:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si

loc_676FE:
		jnz	short loc_67703
		jmp	loc_67799
; ���������������������������������������������������������������������������

loc_67703:				; CODE XREF: Stopwatch_StartOrStop_676F1:loc_676FEj
		cmp	byte_711CC, 0
		jnz	short loc_6770D
		jmp	loc_6778C
; ���������������������������������������������������������������������������

loc_6770D:				; CODE XREF: Stopwatch_StartOrStop_676F1+17j
		push	ds
		push	offset aBye	; "bye!"

loc_67711:
		call	ModuleRegistry_CleanupModuleSlot_5FE9F
		add	sp, 4
		mov	ah, 2
		int	1Ah		; CLOCK	- READ REAL TIME CLOCK (AT,XT286,CONV,PS)
					; Return: CH = hours in	BCD
					; CL = minutes in BCD
					; DH = seconds in BCD
		mov	al, ch

loc_6771F:
		shr	al, 4
		mov	dl, 0Ah
		mul	dl

loc_67726:
		and	ch, 0Fh
		add	ch, al
		mov	al, cl
		shr	al, 4
		mov	dl, 0Ah
		mul	dl
		and	cl, 0Fh
		add	cl, al
		mov	al, dh
		shr	al, 4
		mov	dl, 0Ah
		mul	dl

loc_67742:
		and	dh, 0Fh
		add	dh, al
		mov	ah, 2Dh
		int	21h		; DOS -	SET CURRENT TIME
					; CH = hours, CL = minutes, DH = seconds, DL = hundredths of seconds
					; Return: AL = 00h if no error / = FFh if bad value sent to routine
		mov	ah, 4

loc_6774D:				; CLOCK	- READ DATE FROM REAL TIME CLOCK (AT,XT286,CONV,PS)
		int	1Ah		; Return: DL = day in BCD
					; DH = month in	BCD
					; CL = year in BCD
					; CH = century (19h or 20h)
		push	dx

loc_67750:
		mov	ax, cx

loc_67752:
		and	ax, 0F0F0h
		sub	cx, ax

loc_67757:
		shr	ax, 4
		mov	bx, 0Ah

loc_6775D:
		mul	bx
		add	cx, ax
		mov	al, ch

loc_67763:
		xor	ch, ch
		mov	ah, 64h	; 'd'
		mul	ah
		add	cx, ax
		pop	dx
		mov	al, dh
		shr	al, 4
		mov	ah, 0Ah

loc_67773:
		mul	ah
		and	dh, 0Fh
		add	dh, al
		mov	al, dl

loc_6777C:
		shr	al, 4
		mov	ah, 0Ah
		mul	ah
		and	dl, 0Fh
		add	dl, al
		mov	ah, 2Bh
		int	21h		; DOS -	SET CURRENT DATE
					; DL = day, DH = month,	CX = year
					; Return: AL = 00h if no error /= FFh if bad value sent	to routine

loc_6778C:				; CODE XREF: Stopwatch_StartOrStop_676F1+19j
		test	di, 1
		jz	short loc_67799
		push	si

loc_67793:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_67799:				; CODE XREF: Stopwatch_StartOrStop_676F1+Fj
					; Stopwatch_StartOrStop_676F1+9Fj
		pop	di
		pop	si
		pop	bp
		retf
Stopwatch_StartOrStop_676F1	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si], 0
		jz	short loc_677B8
		mov	eax, dword_711CD
		sub	eax, [si+1]
		add	[si+5],	eax
		mov	byte ptr [si], 0

loc_677B8:				; CODE XREF: seg207:01C7j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_677C2:
		cmp	byte ptr [si], 0
		jz	short loc_677D6
		mov	eax, [si+5]

loc_677CB:
		add	eax, dword_711CD
		sub	eax, [si+1]
		jmp	short loc_677DA
; ���������������������������������������������������������������������������

loc_677D6:				; CODE XREF: seg207:01E5j
		mov	eax, [si+5]

loc_677DA:				; CODE XREF: seg207:01F4j
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si

loc_677E6:
		mov	si, [bp+6]

loc_677E9:				; CODE XREF: seg207:021Aj
		mov	eax, [bp+8]

loc_677ED:
		add	eax, [si+1]

loc_677F1:
		sub	eax, dword_711CD
		cmp	eax, 0
		ja	short loc_677E9

loc_677FC:
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, réinitialise le chronomètre (rôle exact non détaillé, aucun appel externe visible).
; ==============================================================================================
Stopwatch_Reset_677FF	proc far		; CODE XREF: PaletteScreen_ComputeCurvePointA_A12FB+5AP

arg_0		= word ptr  6

		push	bp

loc_67800:
		mov	bp, sp
		push	si

loc_67803:
		mov	si, [bp+arg_0]

loc_67806:				; CODE XREF: Stopwatch_Reset_677FF+13j
		mov	eax, [si]

loc_67809:
		add	eax, [si+4]

loc_6780D:
		cmp	eax, dword_711CD
		jnb	short loc_67806

loc_67814:
		pop	si
		pop	bp
		retf
Stopwatch_Reset_677FF	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant
; Stopwatch_Construct_675EF(tag=5DC2h).
; ==============================================================================================
Stopwatch_ConstructThunk_67817:				; DATA XREF: seg339:off_71F56o
		push	bp
		mov	bp, sp
		push	5DC2h
		push	cs
		call	near ptr Stopwatch_Construct_675EF

loc_67821:
		pop	cx
		pop	bp

locret_67823:
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant
; Stopwatch_StartOrStop_676F1(tag=5DC2h, mode=2).
; ==============================================================================================
Stopwatch_StartOrStopThunk_67824:				; DATA XREF: seg339:off_72004o
		push	bp
		mov	bp, sp

loc_67827:
		push	2

loc_67829:
		push	5DC2h
		push	cs

loc_6782D:
		call	near ptr Stopwatch_StartOrStop_676F1

loc_67830:
		add	sp, 4

loc_67833:
		pop	bp

locret_67834:
		retf
seg207		ends
