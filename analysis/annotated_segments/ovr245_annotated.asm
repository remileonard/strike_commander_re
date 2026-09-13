ovr245		segment	para public 'OVERLAY' use16
		assume cs:ovr245
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 121L — SÉLECTIONNE ET APPLIQUE UN ENREGISTREMENT DE VUE COCKPIT
; (ex-'HUDSymbol_ConstructWithFullOrientation', NON DÉTAILLÉE). Args : (viewCtrl si, index
; arg_2). Si index == vue courante -> return. Sinon : sub_6B1FA / sub_6B1FF (notifications),
; Matrix_BuildFromAngle_56D72(si+0x143) (reset matrice de vue), puis record = [si+0x133] +
; arg_2*0x1D ; Matrix_BuildFullOrientation_575B2(si+0x143, record[+0x0B], record[+0x0D],
; record[+0x0F]) (3 angles i16 en degrés, <<8 -> axes X,Y,Z) ; si[+0x167] = record[+0x11]
; (i32), si[+0x16B] = record[+0x15], si[+0x16F] = record[+0x19] (= OFFSET DE L'ŒIL DU PILOTE,
; 24.8, identique pour tous les records du F-16 : (0, 2016, 400) = (0, 7.875, 1.5625) pieds) ;
; lit aussi record[+0x01] (FOV i16), record[+0x03] (dword=921), record[+0x07]/[+0x09] (u16),
; écrit dans [si+0x1E] (sous-objet viewport). Table [si+0x133] chargée par
; Cockpit_LoadViewTable_86B53. Voir CAMERA_SYSTEM.md §3bis.
; ==============================================================================================
Cockpit_ApplyViewRecord_84EC0	proc far		; CODE XREF: VROOMM_StubThunk_6B08AJ HUDSymbol_ApplyDualStyle_85078+2Fp	...

var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+125h]
		cmp	ax, [bp+arg_2]
		jnz	short loc_84ED7
		jmp	loc_84FDE
; ���������������������������������������������������������������������������

loc_84ED7:				; CODE XREF: Cockpit_ApplyViewRecord_84EC0+12j
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6B1FA
		add	sp, 4
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6B1FF
		add	sp, 4
		mov	ax, si
		add	ax, 143h
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	ax, [bp+arg_2]
		imul	ax, 1Dh
		mov	di, [si+133h]
		add	di, ax
		mov	ax, [di+0Fh]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, [di+0Dh]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, [di+0Bh]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 143h

loc_84F51:
		push	ax
		call	Matrix_BuildFullOrientation_575B2
		add	sp, 8
		mov	eax, [di+11h]
		mov	[si+167h], eax

loc_84F63:
		mov	eax, [di+15h]
		mov	[si+16Bh], eax
		mov	eax, [di+19h]
		mov	[si+16Fh], eax
		sub	sp, 4
		mov	ax, di
		add	ax, 3
		mov	[bp+var_14], ax
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_1E], eax
		sub	sp, 4
		mov	ax, [di+1]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_22], eax
		push	word ptr [si+1Eh]
		call	VROOMM_StubThunk_6BC08
		add	sp, 0Ah
		mov	ax, [di+7]
		mov	bx, [si+1Eh]
		mov	[bx+8],	ax
		mov	ax, [di+9]
		mov	[bx+0Ah], ax
		mov	ax, [bp+arg_2]
		mov	[si+125h], ax
		mov	byte ptr [si+21Fh], 1
		mov	al, byte_6D461
		mov	ah, 0
		or	ax, ax
		jnz	short loc_84FDE
		call	Mouse_InitAndRead
		xor	ax, ax
		mov	[si+191h], ax
		mov	[si+193h], ax

loc_84FDE:				; CODE XREF: Cockpit_ApplyViewRecord_84EC0+14j
					; Cockpit_ApplyViewRecord_84EC0+10Dj
		pop	di
		pop	si
		leave
		retf
Cockpit_ApplyViewRecord_84EC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (32 lignes).
; ==============================================================================================
HUDSymbol_Helper11_84FE2	proc far		; CODE XREF: VROOMM_StubThunk_6B080J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+13Fh]
		mov	ah, 0
		cmp	ax, 0FFFFh
		jz	short loc_8500A
		cmp	byte ptr [si+21Eh], 0
		jz	short loc_8500A
		mov	al, [si+21Dh]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[si+21Dh], al

loc_8500A:				; CODE XREF: HUDSymbol_Helper11_84FE2+10j
					; HUDSymbol_Helper11_84FE2+17j
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ApplyDualStyle_85078
		pop	cx
		pop	si
		pop	bp
		retf
HUDSymbol_Helper11_84FE2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (41 lignes).
; ==============================================================================================
HUDSymbol_Helper12_85014	proc far		; CODE XREF: VROOMM_StubThunk_6B09EJ HUDSymbol_ApplyDualStyle_85078+37p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		mov	eax, [bx+8]
		mov	[si+1B7h], eax
		mov	eax, [bx+0Ch]
		mov	[si+19Fh], eax
		mov	eax, [bx+10h]
		mov	[si+1A3h], eax
		mov	eax, [bx]
		mov	[si+19Bh], eax
		mov	ax, [bx+61h]
		mov	[si+195h], ax
		mov	eax, [bx+64h]
		mov	[si+197h], eax

loc_85051:
		mov	eax, [bx+68h]

loc_85055:
		mov	[si+1A7h], eax
		mov	eax, [bx+6Ch]

loc_8505E:
		mov	[si+1ABh], eax

loc_85063:
		mov	eax, [bx+70h]
		mov	[si+1AFh], eax
		mov	eax, [bx+74h]
		mov	[si+1B3h], eax
		pop	si
		pop	bp
		retf
HUDSymbol_Helper12_85014	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique deux styles de texte (TextFormat_ApplyStyleAttribute_5E2D0 ×2, seg143).
; ==============================================================================================
HUDSymbol_ApplyDualStyle_85078	proc far		; CODE XREF: VROOMM_StubThunk_6B085J HUDSymbol_Helper11_84FE2+2Bp

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+21Eh], 1
		cmp	byte ptr [si+21Dh], 0
		jz	short loc_850D0
		mov	al, [si+13Fh]
		mov	ah, 0
		cmp	ax, 0FFFFh
		jz	short loc_850D0
		mov	byte ptr [si+140h], 1
		mov	al, [si+13Fh]
		mov	ah, 0
		push	ax
		push	si
		push	cs
		call	near ptr Cockpit_ApplyViewRecord_84EC0
		add	sp, 4
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper12_85014
		pop	cx
		mov	ax, si
		add	ax, 2
		mov	[bp+var_2], ax
		push	ax
		mov	bx, [si+24h]
		mov	ax, [bx+13h]
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		jmp	short loc_85100
; ���������������������������������������������������������������������������

loc_850D0:				; CODE XREF: HUDSymbol_ApplyDualStyle_85078+14j
					; HUDSymbol_ApplyDualStyle_85078+1Fj
		mov	byte ptr [si+140h], 0
		push	0
		push	si
		push	cs
		call	near ptr Cockpit_ApplyViewRecord_84EC0
		add	sp, 4
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper12_85014
		pop	cx
		mov	ax, si
		add	ax, 2
		mov	[bp+var_4], ax
		push	ax
		mov	bx, [si+22h]
		mov	ax, [bx+13h]
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4

loc_85100:				; CODE XREF: HUDSymbol_ApplyDualStyle_85078+56j
		pop	si
		leave
		retf
HUDSymbol_ApplyDualStyle_85078	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Cockpit_PanElevationUpdate et Camera_PanTransitionExtended — mise à jour du
; panoramique caméra en élévation.
; ==============================================================================================
Cockpit_PanElevationFrame_85103	proc far		; CODE XREF: VROOMM_StubThunk_6B08FJ

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+1D7h]
		cmp	eax, [si+1DBh]
		jl	short loc_8511F
		mov	ax, 1
		jmp	short loc_85121
; ���������������������������������������������������������������������������

loc_8511F:				; CODE XREF: Cockpit_PanElevationFrame_85103+15j
		xor	ax, ax

loc_85121:				; CODE XREF: Cockpit_PanElevationFrame_85103+1Aj
		or	al, al
		jz	short loc_85180
		mov	di, si
		add	di, 1D7h
		mov	eax, [si+1D3h]

loc_85130:
		sub	eax, [di]

loc_85133:
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 1DBh
		mov	eax, [si+1D3h]
		sub	eax, [di]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Cockpit_PanElevationUpdate
		add	sp, 4
		jmp	short loc_851D1
; ���������������������������������������������������������������������������

loc_85180:				; CODE XREF: Cockpit_PanElevationFrame_85103+20j
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 1DBh
		mov	eax, [si+1D7h]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		sub	[bp+var_4], eax
		push	0
		push	0
		push	0
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Camera_PanTransitionExtended
		add	sp, 0Ah

loc_851D1:				; CODE XREF: Cockpit_PanElevationFrame_85103+7Bj
		pop	di
		pop	si
		leave
		retf
Cockpit_PanElevationFrame_85103	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Camera_PanTransitionExtended.
; ==============================================================================================
Camera_PanTransitionWrapper_851D5	proc far		; CODE XREF: VROOMM_StubThunk_6B094J

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 1D7h
		mov	eax, [si+1D3h]
		sub	eax, [di]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 1D3h
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		add	si, 1E1h
		mov	al, [si+2]
		push	ax
		mov	al, [si+1]
		push	ax
		mov	al, [si]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Camera_PanTransitionExtended
		add	sp, 0Ah
		pop	di
		pop	si
		leave
		retf
Camera_PanTransitionWrapper_851D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (48 lignes).
; ==============================================================================================
HUDSymbol_Helper13_8523B	proc far		; CODE XREF: VROOMM_StubThunk_6B099J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_8523E:
		sub	sp, 8
		push	si

loc_85242:
		mov	si, [bp+arg_0]

loc_85245:
		mov	eax, [si+1CFh]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax

loc_85263:
		add	[si+1D7h], eax
		mov	eax, [si+1D7h]
		cmp	eax, [si+1D3h]
		jle	short loc_85279
		mov	ax, 1
		jmp	short loc_8527B
; ���������������������������������������������������������������������������

loc_85279:				; CODE XREF: HUDSymbol_Helper13_8523B+37j
		xor	ax, ax

loc_8527B:				; CODE XREF: HUDSymbol_Helper13_8523B+3Cj
		or	al, al
		jz	short loc_85289
		mov	eax, [si+1D3h]
		mov	[si+1D7h], eax

loc_85289:				; CODE XREF: HUDSymbol_Helper13_8523B+42j
		pop	si
		leave
		retf
HUDSymbol_Helper13_8523B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 141 lignes, NON DÉTAILLÉE — alloue deux blocs (CRT_Malloc16_Retry ×2).
; ==============================================================================================
HUDSymbol_AllocateDualBuffer_8528C	proc far		; CODE XREF: VROOMM_StubThunk_6B0A3J

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_4]
		mov	bx, [si+20h]
		mov	ax, [bx+91h]
		or	ax, [bx+93h]
		jnz	short loc_852A6
		jmp	loc_8534B
; ���������������������������������������������������������������������������

loc_852A6:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+15j
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	ax, [bx+5Ch]
		mov	[bp+var_6], ax
		mov	ax, [si+20h]
		add	ax, 40h	; '@'
		mov	[bp+var_8], ax
		les	bx, [bx+91h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_85307
		push	0
		push	[bp+var_8]
		mov	bx, [si+20h]
		mov	bx, [bx+91h]
		push	word ptr es:[bx+0Dh]
		push	[bp+var_6]
		mov	bx, [si+20h]
		mov	bx, [bx+91h]
		push	large dword ptr	es:[bx]
		push	large [bp+var_4]
		mov	bx, [si+20h]
		mov	bx, [bx+91h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_85343
; ���������������������������������������������������������������������������

loc_85307:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+3Cj
		cmp	word ptr [bp+var_4], 0
		jz	short loc_85312
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_8531D
; ���������������������������������������������������������������������������

loc_85312:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+7Fj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_8531D:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+84j
		or	ax, ax
		jz	short loc_8533D
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_707E0
		mov	[bx], eax
		mov	eax, dword_707E4
		mov	[bx+4],	eax
		mov	eax, dword_707E8

loc_85337:
		mov	[bx+8],	eax

loc_8533B:
		jmp	short $+2

loc_8533D:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+93j
		mov	dx, word ptr [bp+var_4+2]

loc_85340:
		mov	ax, word ptr [bp+var_4]

loc_85343:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+79j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_8539F
; ���������������������������������������������������������������������������

loc_8534B:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+17j
		mov	si, word ptr [bp+arg_0]
		or	si, si
		jz	short loc_85356
		mov	ax, si

loc_85354:
		jmp	short loc_85360
; ���������������������������������������������������������������������������

loc_85356:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+C4j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_85360:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C:loc_85354j
		or	ax, ax
		jz	short loc_85397
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	[si+4],	eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_85399
; ���������������������������������������������������������������������������

loc_85397:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+D6j
		mov	ax, si

loc_85399:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+109j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_8539F:				; CODE XREF: HUDSymbol_AllocateDualBuffer_8528C+BDj
		pop	si
		leave
		retf
HUDSymbol_AllocateDualBuffer_8528C	endp

ovr245		ends
