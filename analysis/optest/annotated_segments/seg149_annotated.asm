seg149		segment	byte public 'CODE' use16
		assume cs:seg149
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_3CD9E:				; DATA XREF: dseg:0562o dseg:069Fo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_3B8B6
		pop	cx
		cmp	dword ptr [si+5Dh], 0
		jnz	short loc_3CE09
		jmp	short loc_3CDD5
; ���������������������������������������������������������������������������

loc_3CDB5:				; CODE XREF: seg149:005Cj
		mov	eax, [si+61h]
		sar	eax, 1
		mov	[si+61h], eax
		cmp	dword ptr [si+61h], 0
		jnz	short loc_3CDD5
		push	1AE0h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4
		jmp	short loc_3CDEE
; ���������������������������������������������������������������������������

loc_3CDD5:				; CODE XREF: seg149:0023j seg149:0035j
		push	0
		push	2
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, [si+61h]
		jle	short loc_3CDB5

loc_3CDEE:				; CODE XREF: seg149:0043j
		push	3
		push	0
		push	2
		push	large dword ptr	[si+61h]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+5Fh], dx
		mov	[si+5Dh], ax

loc_3CE09:				; CODE XREF: seg149:0021j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_3CE25
		push	65h ; 'e'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3CE45

loc_3CE25:				; CODE XREF: seg149:0085j
		push	word ptr [bp+8]
		push	si
		call	StreamReader_ConstructVariantB_3B2F8
		add	sp, 4
		mov	word ptr [si], 556h
		mov	eax, [bp+0Ah]
		mov	[si+61h], eax
		mov	dword ptr [si+5Dh], 0

loc_3CE45:				; CODE XREF: seg149:0093j
		mov	ax, si
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
		jnz	short loc_3CE66
		push	65h ; 'e'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3CEAE

loc_3CE66:				; CODE XREF: seg149:00C6j
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	word ptr [si], 3B55h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg001
		mov	word ptr [si+2], 3Bh ; ';'
		mov	word ptr [si], 4939h
		push	0
		push	large 0
		push	large 0
		push	ax
		push	si
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		mov	word ptr [si], 556h
		mov	eax, [bp+0Ah]
		mov	[si+61h], eax
		mov	dword ptr [si+5Dh], 0

loc_3CEAE:				; CODE XREF: seg149:00D4j
		mov	ax, si
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ReleaseBuffer_65643 (sub_65643 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère le tampon (Memory_TypedFree_5C7B6), ferme le flux sous-jacent
; (StreamReader_Close_63BD5, seg190) et libère l'objet (sub_338). DECOUVERTE COMPLEMENTAIRE :
; cette fonction est AUSSI utilisee comme fonction de SCORE pour MVRS ID=0x1 (tag 0x2B4) -
; reutilisation d'un utilitaire generique SANS INITIALISER AL AVANT LE RETOUR (pas de 'mov
; al,...' avant le retf), contrairement a toutes les autres fonctions de score qui bornent
; explicitement leur resultat 0-9/0-10. Le 'score' resultant pour ID=0x1 est donc indetermine
; (valeur residuelle de AL) - suggere un emplacement vestigial jamais concu comme un vrai type
; de comportement MVRS.
; ==============================================================================================
StreamReader_ReleaseBuffer_3CEB3	proc far		; CODE XREF: sub_3B0B+1D7P
					; seg002:0D69P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3CEFB
		mov	word ptr [si], 556h
		cmp	dword ptr [si+5Dh], 0
		jz	short loc_3CEE3
		push	1A04h
		push	2
		mov	ax, si
		add	ax, 5Dh	; ']'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_3CEE3:				; CODE XREF: StreamReader_ReleaseBuffer_3CEB3+18j
		push	0
		push	si
		call	StreamReader_Close_3B445
		add	sp, 4
		test	di, 1
		jz	short loc_3CEFB
		push	si
		call	sub_308
		pop	cx

loc_3CEFB:				; CODE XREF: StreamReader_ReleaseBuffer_3CEB3+Dj
					; StreamReader_ReleaseBuffer_3CEB3+3Fj
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_ReleaseBuffer_3CEB3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_WriteTyped_6568F (sub_6568F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⭐ far, écriture typée à travers le flux tamponné —
; pendant en écriture de StreamReader_ReadTyped_63FA1 (seg190) : gère la position courante
; (+0x4D) et la capacité (+0x55), délègue à sub_65795 pour le débordement de capacité.
; Référencée massivement (seg188, seg193-194) — fonction centrale du système d'écriture typée
; par handle.
; ==============================================================================================
StreamReader_WriteTyped_3CEFF	proc far		; CODE XREF: seg063:00E7P
					; sub_293DB+53P ...

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
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+arg_A]
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_3CF28
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_3CF28:				; CODE XREF: StreamReader_WriteTyped_3CEFF+1Fj
		mov	[bp+var_10], 0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]
		cmp	eax, [si+55h]
		jle	short loc_3CF75
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		sub	eax, [si+55h]
		mov	[bp+var_10], eax
		push	large dword ptr	[si+55h]
		push	eax
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_WriteWithGrowth_3D005
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax

loc_3CF75:				; CODE XREF: StreamReader_WriteTyped_3CEFF+45j
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jnz	short loc_3CFD7
		push	large [bp+arg_6]
		mov	eax, [bp+var_8]
		add	eax, [si+51h]
		push	eax
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_3CFBC
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		jmp	short loc_3CFF9
; ���������������������������������������������������������������������������

loc_3CFBC:				; CODE XREF: StreamReader_WriteTyped_3CEFF+ADj
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3CFD2
		push	si
		call	StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3CFD2:				; CODE XREF: StreamReader_WriteTyped_3CEFF+C8j
		push	1A05h
		jmp	short loc_3CFF0
; ���������������������������������������������������������������������������

loc_3CFD7:				; CODE XREF: StreamReader_WriteTyped_3CEFF+7Ej
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3CFED
		push	si
		call	StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3CFED:				; CODE XREF: StreamReader_WriteTyped_3CEFF+E3j
		push	1A01h

loc_3CFF0:				; CODE XREF: StreamReader_WriteTyped_3CEFF+D6j
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3CFF9:				; CODE XREF: StreamReader_WriteTyped_3CEFF+BBj
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteTyped_3CEFF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_WriteWithGrowth_65795 (sub_65795 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 289 lignes, NON DÉTAILLÉE — la plus grosse
; fonction du segment, gros buffer local (0x1D octets + plusieurs dwords). Appelée par
; StreamReader_WriteTyped_6568F en cas de dépassement de capacité — probable écriture avec
; agrandissement automatique du tampon. Candidat pour session dédiée.
; ==============================================================================================
StreamReader_WriteWithGrowth_3D005	proc far		; CODE XREF: StreamReader_WriteTyped_3CEFF+68p

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
		mov	[bp+var_1D], 0
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_3D022
		mov	eax, [si+4Dh]
		mov	[bp+arg_A], eax

loc_3D022:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+13j
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
		jl	short loc_3D043
		jmp	loc_3D196
; ���������������������������������������������������������������������������

loc_3D043:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+39j
		mov	eax, [bp+var_8]
		sub	eax, [bp+arg_A]
		mov	[bp+var_4], eax
		push	large [bp+arg_6]
		push	large [bp+var_8]
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
		cmp	[bp+var_14], 0FFFFFFFFh
		jnz	short loc_3D0A1
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D08E
		push	si
		call	StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3D08E:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+7Ej
		push	1A06h

loc_3D091:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+14Aj
					; StreamReader_WriteWithGrowth_3D005+166j
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4
		mov	[bp+var_1D], 1
		jmp	loc_3D196
; ���������������������������������������������������������������������������

loc_3D0A1:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+71j
		mov	eax, [si+61h]
		mov	[bp+var_1C], eax
		cmp	eax, [bp+var_4]
		jle	short loc_3D0B7
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax

loc_3D0B7:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+A8j
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		sub	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		jmp	loc_3D18C
; ���������������������������������������������������������������������������

loc_3D0DE:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+18Ej
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
		cmp	[bp+var_18], 0FFFFFFFFh
		jz	short loc_3D152
		push	large [bp+var_1C]
		push	large [bp+var_10]
		push	large dword ptr	[si+5Dh]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_3D136
		sub	[bp+var_4], eax
		jmp	short loc_3D16E
; ���������������������������������������������������������������������������

loc_3D136:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+129j
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D14C
		push	si
		call	StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3D14C:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+13Cj
		push	1A08h
		jmp	loc_3D091
; ���������������������������������������������������������������������������

loc_3D152:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+100j
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D168
		push	si
		call	StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3D168:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+158j
		push	1A09h
		jmp	loc_3D091
; ���������������������������������������������������������������������������

loc_3D16E:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+12Fj
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_4]
		jle	short loc_3D180
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax

loc_3D180:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+171j
		mov	eax, [bp+var_1C]
		sub	[bp+var_C], eax
		sub	[bp+var_10], eax

loc_3D18C:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+D6j
		cmp	[bp+var_4], 0
		jz	short loc_3D196
		jmp	loc_3D0DE
; ���������������������������������������������������������������������������

loc_3D196:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+3Bj
					; StreamReader_WriteWithGrowth_3D005+99j ...
		mov	al, [bp+var_1D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D200
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
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_3D1DE
		mov	eax, [bp+arg_A]
		add	eax, [bp+arg_6]
		mov	[si+4Dh], eax
		mov	eax, [bp+arg_6]
		add	[si+55h], eax
		jmp	short loc_3D200
; ���������������������������������������������������������������������������

loc_3D1DE:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+1C1j
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D1F4
		push	si
		call	StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3D1F4:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+1E4j
		push	1A07h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3D200:				; CODE XREF: StreamReader_WriteWithGrowth_3D005+198j
					; StreamReader_WriteWithGrowth_3D005+1D7j
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteWithGrowth_3D005	endp

; ���������������������������������������������������������������������������

loc_3D20C:				; DATA XREF: dseg:0566o dseg:06A3o
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3D22C
		mov	word ptr [si], 48C8h
		mov	word ptr [si+2], 0
		jmp	short loc_3D22E
; ���������������������������������������������������������������������������

loc_3D22C:				; CODE XREF: seg149:048Fj
		mov	ax, si

loc_3D22E:				; CODE XREF: seg149:049Aj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée via vtable (DATA XREF seg339) —
; enveloppe appelant StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main
; (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_3D231	proc far		; CODE XREF: sub_4C450+8P
					; DATA XREF: dseg:0556o

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	StreamReader_Destruct_3B16F
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_3D231	endp

seg149		ends
