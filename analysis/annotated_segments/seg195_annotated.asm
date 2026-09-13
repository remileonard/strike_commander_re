seg195		segment	byte public 'CODE' use16
		assume cs:seg195
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — méthode de croissance dynamique du tampon
; interne : double la capacité (+0x61) en boucle jusqu'à couvrir la taille demandée
; (Memory_TypedAllocDispatchC_5C86D pour tester, Memory_TypedFreeWrapperC_5C6F3 pour
; réallouer, tag 5C44h), avec limite d'erreur (Runtime_FatalErrorHandlerWithTag, tag 1AE0h).
; ==============================================================================================
StreamReader_Method_GrowBuffer_6552E:				; DATA XREF: seg339:02D4o seg339:1396o
		push	bp

loc_6552F:
		mov	bp, sp
		push	si

loc_65532:
		mov	si, [bp+6]
		push	si

loc_65536:
		call	StreamReader_Method_PassThrough_64046
		pop	cx
		cmp	dword ptr [si+5Dh], 0

loc_65541:
		jnz	short loc_65599
		jmp	short loc_65565
; ���������������������������������������������������������������������������

loc_65545:				; CODE XREF: seg195:005Cj
		mov	eax, [si+61h]
		sar	eax, 1
		mov	[si+61h], eax
		cmp	dword ptr [si+61h], 0
		jnz	short loc_65565
		push	1AE0h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4
		jmp	short loc_6557E
; ���������������������������������������������������������������������������

loc_65565:				; CODE XREF: seg195:0023j seg195:0035j
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, [si+61h]
		jle	short loc_65545

loc_6557E:				; CODE XREF: seg195:0043j
		push	3
		push	0
		push	2
		push	large dword ptr	[si+61h]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+5Fh], dx
		mov	[si+5Dh], ax

loc_65599:				; CODE XREF: seg195:loc_65541j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_655A3:
		or	si, si
		jnz	short loc_655B5

loc_655A7:
		push	65h ; 'e'

loc_655A9:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_655B1:
		or	ax, ax
		jz	short loc_655D5

loc_655B5:				; CODE XREF: seg195:0085j
		push	word ptr [bp+8]
		push	si
		call	StreamReader_ConstructVariantB_63A88
		add	sp, 4
		mov	word ptr [si], 2C8h
		mov	eax, [bp+0Ah]
		mov	[si+61h], eax

loc_655CD:
		mov	dword ptr [si+5Dh], 0

loc_655D5:				; CODE XREF: seg195:0093j
		mov	ax, si

loc_655D7:
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_655F6
		push	65h ; 'e'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6563E

loc_655F6:				; CODE XREF: seg195:00C6j
		mov	ax, [bp+8]
		mov	[bp-2],	ax

loc_655FC:
		mov	word ptr [si], 39E3h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg160
		mov	word ptr [si+2], 0
		mov	word ptr [si], 3FB3h
		push	0
		push	large 0
		push	large 0
		push	ax

loc_65621:
		push	si
		call	StreamReader_ConstructAndBind_63B23

loc_65627:
		add	sp, 0Eh

loc_6562A:
		mov	word ptr [si], 2C8h
		mov	eax, [bp+0Ah]

loc_65632:
		mov	[si+61h], eax
		mov	dword ptr [si+5Dh], 0

loc_6563E:				; CODE XREF: seg195:00D4j
		mov	ax, si
		pop	si

locret_65641:
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère le tampon (Memory_TypedFree_5C7B6), ferme le flux sous-jacent
; (StreamReader_Close_63BD5, seg190) et libère l'objet (sub_338). DECOUVERTE COMPLEMENTAIRE :
; cette fonction est AUSSI utilisee comme fonction de SCORE pour MVRS ID=0x1 (tag 0x2B4) -
; reutilisation d'un utilitaire generique SANS INITIALISER AL AVANT LE RETOUR (pas de 'mov
; al,...' avant le retf), contrairement a toutes les autres fonctions de score qui bornent
; explicitement leur resultat 0-9/0-10. Le 'score' resultant pour ID=0x1 est donc indetermine
; (valeur residuelle de AL) - suggere un emplacement vestigial jamais concu comme un vrai type
; de comportement MVRS.
; ==============================================================================================
StreamReader_ReleaseBuffer_65643	proc far		; CODE XREF: seg009:04A1P
					; Input_CalibrationHandler+163P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6568B
		mov	word ptr [si], 2C8h
		cmp	dword ptr [si+5Dh], 0
		jz	short loc_65673
		push	1A04h
		push	2
		mov	ax, si
		add	ax, 5Dh	; ']'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_65673:				; CODE XREF: StreamReader_ReleaseBuffer_65643+18j
		push	0
		push	si
		call	StreamReader_Close_63BD5
		add	sp, 4
		test	di, 1
		jz	short loc_6568B
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_6568B:				; CODE XREF: StreamReader_ReleaseBuffer_65643+Dj
					; StreamReader_ReleaseBuffer_65643+3Fj
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_ReleaseBuffer_65643	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, écriture typée à travers le flux tamponné — pendant en écriture de
; StreamReader_ReadTyped_63FA1 (seg190) : gère la position courante (+0x4D) et la capacité
; (+0x55), délègue à sub_65795 pour le débordement de capacité. Référencée massivement
; (seg188, seg193-194) — fonction centrale du système d'écriture typée par handle.
; ==============================================================================================
StreamReader_WriteTyped_6568F	proc far		; CODE XREF: seg188:001DP seg188:003AP ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp

loc_65690:
		mov	bp, sp

loc_65692:
		sub	sp, 10h
		push	si

loc_65696:
		mov	si, [bp+arg_0]

loc_65699:
		mov	[bp+var_4], 0

loc_656A1:
		mov	eax, [bp+arg_A]

loc_656A5:
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_656B8
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_656B8:				; CODE XREF: StreamReader_WriteTyped_6568F+1Fj
		mov	[bp+var_10], 0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]

loc_656D0:
		cmp	eax, [si+55h]
		jle	short loc_65705
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		sub	eax, [si+55h]
		mov	[bp+var_10], eax
		push	large dword ptr	[si+55h]
		push	eax

loc_656F0:
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_WriteWithGrowth_65795
		push	dx
		push	ax

loc_656FC:
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax

loc_65705:				; CODE XREF: StreamReader_WriteTyped_6568F+45j
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jnz	short loc_65767
		push	large [bp+arg_6]
		mov	eax, [bp+var_8]
		add	eax, [si+51h]
		push	eax
		push	large [bp+arg_2]

loc_65721:
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx

loc_6572D:
		push	ax
		pop	eax

loc_65730:
		add	sp, 0Eh

loc_65733:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6574C
		mov	eax, [bp+var_8]

loc_65742:
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		jmp	short loc_65789
; ���������������������������������������������������������������������������

loc_6574C:				; CODE XREF: StreamReader_WriteTyped_6568F+ADj
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx

loc_65753:
		mov	ah, 0

loc_65755:
		or	ax, ax
		jnz	short loc_65762
		push	si

loc_6575A:
		call	StreamReader_ReportError_6404E
		pop	cx

loc_65760:
		jmp	short $+2

loc_65762:				; CODE XREF: StreamReader_WriteTyped_6568F+C8j
		push	1A05h
		jmp	short loc_65780
; ���������������������������������������������������������������������������

loc_65767:				; CODE XREF: StreamReader_WriteTyped_6568F+7Ej
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6577D
		push	si
		call	StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_6577D:				; CODE XREF: StreamReader_WriteTyped_6568F+E3j
		push	1A01h

loc_65780:				; CODE XREF: StreamReader_WriteTyped_6568F+D6j
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_65789:				; CODE XREF: StreamReader_WriteTyped_6568F+BBj
		mov	eax, [si+4Dh]

loc_6578D:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteTyped_6568F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 289 lignes, NON DÉTAILLÉE — la plus grosse fonction du segment, gros buffer local
; (0x1D octets + plusieurs dwords). Appelée par StreamReader_WriteTyped_6568F en cas de
; dépassement de capacité — probable écriture avec agrandissement automatique du tampon.
; Candidat pour session dédiée.
; ==============================================================================================
StreamReader_WriteWithGrowth_65795	proc far		; CODE XREF: StreamReader_WriteTyped_6568F+68p

var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]

loc_6579F:
		mov	[bp+var_1D], 0
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_657B2
		mov	eax, [si+4Dh]
		mov	[bp+arg_A], eax

loc_657B2:				; CODE XREF: StreamReader_WriteWithGrowth_65795+13j
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_A]
		cmp	eax, [bp+var_8]
		jl	short loc_657D3
		jmp	loc_65926
; ���������������������������������������������������������������������������

loc_657D3:				; CODE XREF: StreamReader_WriteWithGrowth_65795+39j
		mov	eax, [bp+var_8]
		sub	eax, [bp+arg_A]
		mov	[bp+var_4], eax
		push	large [bp+arg_6]

loc_657E3:
		push	large [bp+var_8]
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax

loc_657FA:
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jnz	short loc_65831
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6581E
		push	si
		call	StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_6581E:				; CODE XREF: StreamReader_WriteWithGrowth_65795+7Ej
		push	1A06h

loc_65821:				; CODE XREF: StreamReader_WriteWithGrowth_65795+14Aj
					; StreamReader_WriteWithGrowth_65795+166j
		push	si

loc_65822:
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4
		mov	[bp+var_1D], 1
		jmp	loc_65926
; ���������������������������������������������������������������������������

loc_65831:				; CODE XREF: StreamReader_WriteWithGrowth_65795+71j
		mov	eax, [si+61h]
		mov	[bp+var_1C], eax
		cmp	eax, [bp+var_4]
		jle	short loc_65847
		mov	eax, [bp+var_4]

loc_65843:
		mov	[bp+var_1C], eax

loc_65847:				; CODE XREF: StreamReader_WriteWithGrowth_65795+A8j
		push	word ptr [si+59h]
		mov	bx, [si+59h]

loc_6584D:
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx

loc_65857:
		sub	eax, [bp+var_1C]
		mov	[bp+var_10], eax

loc_6585F:
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		jmp	loc_6591C
; ���������������������������������������������������������������������������

loc_6586E:				; CODE XREF: StreamReader_WriteWithGrowth_65795:loc_65923j
		push	large [bp+var_1C]
		push	large [bp+var_C]
		push	large dword ptr	[si+5Dh]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_18], eax

loc_65890:
		cmp	[bp+var_18], 0FFFFFFFFh
		jz	short loc_658E2
		push	large [bp+var_1C]
		push	large [bp+var_10]
		push	large dword ptr	[si+5Dh]

loc_658A3:
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax

loc_658B2:
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_658C6
		sub	[bp+var_4], eax
		jmp	short loc_658FE
; ���������������������������������������������������������������������������

loc_658C6:				; CODE XREF: StreamReader_WriteWithGrowth_65795+129j
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_658DC

loc_658D3:
		push	si

loc_658D4:
		call	StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_658DC:				; CODE XREF: StreamReader_WriteWithGrowth_65795+13Cj
		push	1A08h
		jmp	loc_65821
; ���������������������������������������������������������������������������

loc_658E2:				; CODE XREF: StreamReader_WriteWithGrowth_65795+100j
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_658F8
		push	si

loc_658F0:
		call	StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_658F8:				; CODE XREF: StreamReader_WriteWithGrowth_65795+158j
		push	1A09h
		jmp	loc_65821
; ���������������������������������������������������������������������������

loc_658FE:				; CODE XREF: StreamReader_WriteWithGrowth_65795+12Fj
		mov	eax, [bp+var_1C]

loc_65902:
		cmp	eax, [bp+var_4]

loc_65906:
		jle	short loc_65910
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax

loc_65910:				; CODE XREF: StreamReader_WriteWithGrowth_65795:loc_65906j
		mov	eax, [bp+var_1C]
		sub	[bp+var_C], eax
		sub	[bp+var_10], eax

loc_6591C:				; CODE XREF: StreamReader_WriteWithGrowth_65795+D6j
		cmp	[bp+var_4], 0
		jz	short loc_65926

loc_65923:
		jmp	loc_6586E
; ���������������������������������������������������������������������������

loc_65926:				; CODE XREF: StreamReader_WriteWithGrowth_65795+3Bj
					; StreamReader_WriteWithGrowth_65795+99j ...
		mov	al, [bp+var_1D]
		mov	ah, 0
		or	ax, ax

loc_6592D:
		jnz	short loc_65990
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax

loc_65951:
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_6596E
		mov	eax, [bp+arg_A]

loc_6595C:
		add	eax, [bp+arg_6]
		mov	[si+4Dh], eax
		mov	eax, [bp+arg_6]
		add	[si+55h], eax
		jmp	short loc_65990
; ���������������������������������������������������������������������������

loc_6596E:				; CODE XREF: StreamReader_WriteWithGrowth_65795+1C1j
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_65984
		push	si
		call	StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_65984:				; CODE XREF: StreamReader_WriteWithGrowth_65795+1E4j
		push	1A07h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_65990:				; CODE XREF: StreamReader_WriteWithGrowth_65795:loc_6592Dj
					; StreamReader_WriteWithGrowth_65795+1D7j
		mov	eax, [si+4Dh]

loc_65994:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteWithGrowth_65795	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — constructeur minimal (alloue 4 octets,
; sub_658) posant le même tag vtable que FileStream (3F42h, seg189) — probable classe
; sœur/dérivée.
; ==============================================================================================
StreamReader_ConstructMinimal_6599C:				; DATA XREF: seg339:02D8o seg339:139Ao
		push	bp

loc_6599D:
		mov	bp, sp
		push	si
		mov	ax, [bp+6]

loc_659A3:
		push	4

loc_659A5:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_659AD:
		or	ax, ax
		jz	short loc_659BC
		mov	word ptr [si], 3F42h
		mov	word ptr [si+2], 0
		jmp	short loc_659BE
; ���������������������������������������������������������������������������

loc_659BC:				; CODE XREF: seg195:048Fj
		mov	ax, si

loc_659BE:				; CODE XREF: seg195:049Aj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_659C1	proc far		; CODE XREF: seg048:12E6P
					; DATA XREF: seg339:02C8o

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	StreamReader_Destruct_638FF
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_659C1	endp

seg195		ends
