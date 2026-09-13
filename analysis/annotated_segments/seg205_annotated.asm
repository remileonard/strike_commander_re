seg205		segment	byte public 'CODE' use16
		assume cs:seg205
		;org 7
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise via TextScrollDisplay_ComputeLayout_672AF.
; ==============================================================================================
TextScrollDisplay_Construct_67267	proc far		; CODE XREF: InputSystem_InitAll_8F47A+80P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_67280
		push	1

loc_67274:
		call	CRT_Malloc16_Retry
		pop	cx

loc_6727A:
		mov	si, ax
		or	ax, ax
		jz	short loc_67285

loc_67280:				; CODE XREF: TextScrollDisplay_Construct_67267+9j
		nop
		push	cs

loc_67282:
		call	near ptr TextScrollDisplay_ComputeLayout_672AF

loc_67285:				; CODE XREF: TextScrollDisplay_Construct_67267+17j
		mov	ax, si

loc_67287:
		pop	si
		pop	bp
		retf
TextScrollDisplay_Construct_67267	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextScrollDisplay_Cleanup_67384 puis libère l'objet (sub_338).
; ==============================================================================================
TextScrollDisplay_Destruct_6728A	proc far		; CODE XREF: InputSystem_ReleaseAll_8F5E0+49P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_6728F:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_672AB
		nop
		push	cs
		call	near ptr TextScrollDisplay_Cleanup_67384
		test	di, 1

loc_672A2:
		jz	short loc_672AB

loc_672A4:
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_672AB:				; CODE XREF: TextScrollDisplay_Destruct_6728A+Dj
					; TextScrollDisplay_Destruct_6728A:loc_672A2j
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplay_Destruct_6728A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 65 lignes, NON DÉTAILLÉE — calcule le layout d'affichage du défilement de texte.
; ==============================================================================================
TextScrollDisplay_ComputeLayout_672AF	proc far		; CODE XREF: TextScrollDisplay_Construct_67267:loc_67282p

var_28		= word ptr -28h
var_26		= word ptr -26h
var_18		= word ptr -18h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 0
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8

loc_672D0:
		cmp	[bp+var_28], 0FFFFh
		jnz	short loc_672DD
		mov	byte_72E6C, 1
		jmp	short loc_672E2
; ���������������������������������������������������������������������������

loc_672DD:				; CODE XREF: TextScrollDisplay_ComputeLayout_672AF+25j
		mov	byte_72E6C, 0

loc_672E2:				; CODE XREF: TextScrollDisplay_ComputeLayout_672AF+2Cj
		mov	ax, [bp+var_26]
		mov	word_72E6D, ax
		push	large 0
		nop
		push	cs
		call	near ptr TextScrollDisplay_RegisterEntries_673B9
		add	sp, 4

loc_672F3:
		push	large 100000h
		push	5DA0h

loc_672FC:
		call	CRT_Memset_Public
		add	sp, 6
		push	large 80000h

loc_6730A:
		push	5DB0h

loc_6730D:
		call	CRT_Memset_Public

loc_67312:
		add	sp, 6
		nop
		push	cs

loc_67317:
		call	near ptr TextScrollDisplay_InitState_6733F
		leave
		retf
TextScrollDisplay_ComputeLayout_672AF	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	word ptr [bp-18h], 0

loc_67327:
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-28h]
		push	ax

loc_6732F:
		lea	ax, [bp-18h]
		push	ax

loc_67333:
		push	33h ; '3'

loc_67335:
		call	CRT_Int86
		add	sp, 8
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_1839 (externe), TextScrollDisplay_RegisterEntries_673B9 et sub_22E1 (×2).
; ==============================================================================================
TextScrollDisplay_InitState_6733F	proc far		; CODE XREF: TextScrollDisplay_ComputeLayout_672AF:loc_67317p

var_28		= word ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_12], 11h
		mov	[bp+var_8], seg	seg210

loc_6734F:
		mov	[bp+var_18], 14h

loc_67354:
		mov	[bp+var_14], 3Fh ; '?'

loc_67359:
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax

loc_67361:
		lea	ax, [bp+var_18]
		push	ax

loc_67365:
		push	33h ; '3'

loc_67367:
		call	CRT_Int86
		add	sp, 8

loc_6736F:
		mov	ax, [bp+var_24]
		mov	word_711AA, ax

loc_67375:
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_22]
		mov	word_711AE, ax
		mov	word_711AC, dx
		leave
		retf
TextScrollDisplay_InitState_6733F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_1839. Appelée par TextScrollDisplay_Destruct_6728A.
; ==============================================================================================
TextScrollDisplay_Cleanup_67384	proc far		; CODE XREF: TextScrollDisplay_Destruct_6728A+11p

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	ax, word_711AC
		mov	[bp+var_12], ax

loc_67390:
		mov	ax, word_711AE

loc_67393:
		mov	[bp+var_8], ax
		mov	[bp+var_18], 14h
		mov	ax, word_711AA
		mov	[bp+var_14], ax

loc_673A1:
		lea	ax, [bp+var_8]

loc_673A4:
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf
TextScrollDisplay_Cleanup_67384	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_1839. Appelée par TextScrollDisplay_InitState_6733F.
; ==============================================================================================
TextScrollDisplay_RegisterEntries_673B9	proc far		; CODE XREF: Mouse_InitAndRead+9P
					; Input_ReadAxis2Deadzone+176P ...

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_673C4:
		mov	di, [bp+arg_2]
		mov	[bp+var_18], 4
		mov	[bp+var_14], si
		mov	[bp+var_12], di
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'

loc_673E0:
		call	CRT_Int86

loc_673E5:
		add	sp, 8

loc_673E8:
		mov	word_72E68, si

loc_673EC:
		mov	word_72E6A, di
		pop	di
		pop	si
		leave

locret_673F3:
		retf
TextScrollDisplay_RegisterEntries_673B9	endp

; ���������������������������������������������������������������������������

loc_673F4:
		push	bp
		mov	bp, sp
		sub	sp, 28h

loc_673FA:
		mov	word ptr [bp-18h], 7
		mov	ax, [bp+6]

loc_67402:
		mov	[bp-14h], ax
		mov	ax, [bp+8]

loc_67408:
		mov	[bp-12h], ax

loc_6740B:
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-28h]

loc_67412:
		push	ax
		lea	ax, [bp-18h]

loc_67416:
		push	ax

loc_67417:
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_67423:
		push	bp
		mov	bp, sp
		sub	sp, 28h

loc_67429:
		mov	word ptr [bp-18h], 8
		mov	ax, [bp+6]

loc_67431:
		mov	[bp-14h], ax
		mov	ax, [bp+8]
		mov	[bp-12h], ax
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-28h]

loc_67441:
		push	ax

loc_67442:
		lea	ax, [bp-18h]
		push	ax

loc_67446:
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave

locret_67451:
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp

loc_67455:
		sub	sp, 28h
		mov	word ptr [bp-18h], 0Fh

loc_6745D:
		mov	ax, [bp+6]
		mov	[bp-14h], ax

loc_67463:
		mov	ax, [bp+8]

loc_67466:
		mov	[bp-12h], ax
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-28h]
		push	ax

loc_67471:
		lea	ax, [bp-18h]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — retourne word_72E68 (axe X calibre). PLANTE volontairement (Runtime_FatalErrorHandler
; tag 4100h) si word_71200 != 0, c-a-d si le MODE SOURIS/VUE est actif. word_72E68/72E6A est
; une paire PARTAGEE gardee par word_71200 : en vol (==0) elle porte les axes joystick /
; touches curseur, lus par Player_MainUpdate pour le roulis (÷0x0A) ; en mode souris (==1)
; elle porte les coords souris (vue cockpit 3D), ecrites par Mouse_EventCallback_68109. Voir
; DATA_MODEL.md §6.2 'Entrees joueur'.
; ==============================================================================================
Input_GetCalibratedXValue_67481	proc far		; CODE XREF: Player_MainUpdate+D8DP
					; Mouse_InitAndRead+16P ...
		push	bp
		mov	bp, sp
		cmp	word_71200, 0
		jz	short loc_67494
		push	4100h
		call	Runtime_FatalErrorHandler_5F700
		pop	cx

loc_67494:				; CODE XREF: Input_GetCalibratedXValue_67481+8j
		mov	ax, word_72E68

loc_67497:
		pop	bp

locret_67498:
		retf
Input_GetCalibratedXValue_67481	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — variante Y de Input_GetCalibratedXValue_67481 : retourne word_72E6A (axe Y calibre),
; meme garde word_71200 (fatal si mode souris actif). Lu par Player_MainUpdate pour le tangage
; (÷3). Voir DATA_MODEL.md §6.2.
; ==============================================================================================
Input_GetCalibratedYValue_67499	proc far		; CODE XREF: Player_MainUpdate:loc_13E2DP
					; Mouse_InitAndRead+1EP ...
		push	bp
		mov	bp, sp

loc_6749C:
		cmp	word_71200, 0
		jz	short loc_674AC

loc_674A3:
		push	4100h
		call	Runtime_FatalErrorHandler_5F700
		pop	cx

loc_674AC:				; CODE XREF: Input_GetCalibratedYValue_67499+8j
		mov	ax, word_72E6A
		pop	bp
		retf
Input_GetCalibratedYValue_67499	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, 3
		int	33h		; - MS MOUSE - RETURN POSITION AND BUTTON STATUS
					; Return: BX = button status, CX = column, DX =	row
		mov	[bp-2],	cx
		mov	[bp-4],	dx

loc_674C2:
		mov	ax, 7
		mov	cx, [bp-2]
		mov	dx, [bp-2]
		int	33h		; - MS MOUSE - DEFINE HORIZONTAL CURSOR	RANGE
					; CX = minimum column, DX = maximum column
		mov	ax, 8
		mov	cx, [bp-4]
		mov	dx, [bp-4]
		int	33h		; - MS MOUSE - DEFINE VERTICAL CURSOR RANGE
					; CX = minimum row, DX = maximum row
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, 7

loc_674E0:
		mov	cx, 0
		mov	dx, 27Fh
		int	33h		; - MS MOUSE - DEFINE HORIZONTAL CURSOR	RANGE
					; CX = minimum column, DX = maximum column
		mov	ax, 8
		mov	cx, 0
		mov	dx, 0C7h ; '�'
		int	33h		; - MS MOUSE - DEFINE VERTICAL CURSOR RANGE
					; CX = minimum row, DX = maximum row
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) — état de défilement. Appelée par TextScroll_Construct_66FC4 (seg204).
; ==============================================================================================
TextScroll_AllocateState_674F5	proc far		; CODE XREF: TextScroll_Construct_66FC4+1AP
					; seg204:loc_67016P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_674F9:
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6750E

loc_67500:
		push	2

loc_67502:
		call	CRT_Malloc16_Retry

loc_67507:
		pop	cx
		mov	si, ax
		or	ax, ax

loc_6750C:
		jz	short loc_67512

loc_6750E:				; CODE XREF: TextScroll_AllocateState_674F5+9j
		mov	word ptr [si], 0FFFFh

loc_67512:				; CODE XREF: TextScroll_AllocateState_674F5:loc_6750Cj
		mov	ax, si

loc_67514:
		pop	si

loc_67515:
		pop	bp
		retf
TextScroll_AllocateState_674F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enregistre un gestionnaire dans une table à capacité de 4 emplacements (word_711A8,
; tables à 0x5DA0/0x5DB0), avec repli sur PagedResourceB_RegistryLookupForUIScreen (sub_5F508,
; seg158) si pleine. Référencée par TextScroll_RegisterHandler_671CA (seg204) et sub_67E34.
; ==============================================================================================
HandlerRegistry4Slot_Register_67517	proc far		; CODE XREF: TextScroll_RegisterHandler_671CA+10P
					; TextScrollDisplayB_InitAndRegister_67E34+5CP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_6751E:
		cmp	word_711A8, 4

loc_67523:
		jl	short loc_6752D
		push	0

loc_67527:
		call	PagedResourceC_RefreshAndFinalize_5F508
		pop	cx

loc_6752D:				; CODE XREF: HandlerRegistry4Slot_Register_67517:loc_67523j
		mov	ax, word_711A8

loc_67530:
		mov	[si], ax

loc_67532:
		mov	bx, word_711A8

loc_67536:
		shl	bx, 2
		mov	ax, [bp+arg_4]

loc_6753C:
		mov	dx, [bp+arg_2]
		mov	[bx+5DA2h], ax
		mov	[bx+5DA0h], dx
		mov	bx, word_711A8
		shl	bx, 1

loc_6754D:
		mov	ax, [bp+arg_6]

loc_67550:
		mov	[bx+5DB0h], ax
		inc	word_711A8

loc_67558:
		pop	si

loc_67559:
		pop	bp
		retf
HandlerRegistry4Slot_Register_67517	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, teste si un handle est valide (≠0xFFFF). Référencée depuis seg047 et seg049 (proches de
; TextRenderer_Main).
; ==============================================================================================
ResourceHandle_IsValid_6755B	proc far		; CODE XREF: seg047:038BP seg049:0651P ...

arg_0		= word ptr  6

		push	bp

loc_6755C:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_67562:
		cmp	word ptr [si], 0FFFFh
		jz	short loc_6756C
		mov	ax, 1
		jmp	short loc_6756E
; ���������������������������������������������������������������������������

loc_6756C:				; CODE XREF: ResourceHandle_IsValid_6755B+Aj
		xor	ax, ax

loc_6756E:				; CODE XREF: ResourceHandle_IsValid_6755B+Fj
		mov	ah, 0
		or	ax, ax

loc_67572:
		jz	short loc_675B1
		mov	cx, [si]

loc_67576:
		jmp	short loc_675A3
; ���������������������������������������������������������������������������

loc_67578:				; CODE XREF: ResourceHandle_IsValid_6755B+4Cj
		mov	bx, cx

loc_6757A:
		shl	bx, 2

loc_6757D:
		mov	ax, [bx+5DA6h]

loc_67581:
		mov	dx, [bx+5DA4h]
		mov	bx, cx

loc_67587:
		shl	bx, 2
		mov	[bx+5DA2h], ax
		mov	[bx+5DA0h], dx
		mov	bx, cx
		shl	bx, 1
		mov	ax, [bx+5DB2h]
		mov	bx, cx
		shl	bx, 1
		mov	[bx+5DB0h], ax
		inc	cx

loc_675A3:				; CODE XREF: ResourceHandle_IsValid_6755B:loc_67576j
		cmp	cx, word_711A8
		jl	short loc_67578
		dec	word_711A8

loc_675AD:
		mov	word ptr [si], 0FFFFh

loc_675B1:				; CODE XREF: ResourceHandle_IsValid_6755B:loc_67572j
		pop	si
		pop	bp
		retf
ResourceHandle_IsValid_6755B	endp

seg205		ends
