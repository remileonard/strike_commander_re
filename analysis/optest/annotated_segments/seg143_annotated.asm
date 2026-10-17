seg143		segment	byte public 'CODE' use16
		assume cs:seg143
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à FileStream_Construct_635AE (sub_635AE de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, constructeur
; d'une classe « flux de fichier » : alloue (sub_658, 0x1C octets), pose deux tags vtable
; successifs (3F42h/3F22h), initialise 6 champs (dont +0x18 = position courante) puis appelle
; FileStream_Open_6368E. Référencée depuis seg193.
; ==============================================================================================
FileStream_Construct_3AE1E	proc far		; CODE XREF: seg147:0913P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3AE37
		push	1Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3AE81

loc_3AE37:				; CODE XREF: FileStream_Construct_3AE1E+9j
		mov	word ptr [si], 48C8h
		mov	word ptr [si+2], 0
		mov	word ptr [si], 48A8h
		mov	dword ptr [si+4], 0
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+14h], 0
		mov	dword ptr [si+10h], 0
		mov	dword ptr [si+18h], 0
		mov	dword ptr [si+0Ch], 0
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr FileStream_Open_3AEFE
		add	sp, 6

loc_3AE81:				; CODE XREF: FileStream_Construct_3AE1E+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
FileStream_Construct_3AE1E	endp

; ���������������������������������������������������������������������������

loc_3AE86:				; DATA XREF: dseg:48B8o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	al, [bp+0Ah]
		push	ax
		push	word ptr [bp+8]
		push	si
		call	FileStream_Method_Open_3BC83
		add	sp, 6
		mov	dword ptr [si+14h], 0
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3AEAA:				; DATA XREF: dseg:48A8o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3AEFA
		mov	word ptr [si], 48A8h
		cmp	dword ptr [si+4], 0
		jz	short loc_3AEDA
		push	1205h
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_3AEDA:				; CODE XREF: seg143:00B2j
		mov	word ptr [si], 48C8h
		cmp	word ptr [si+2], 0
		jz	short loc_3AEED
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		jmp	short $+2

loc_3AEED:				; CODE XREF: seg143:00D2j
		test	di, 1
		jz	short loc_3AEFA
		push	si
		call	sub_308
		pop	cx

loc_3AEFA:				; CODE XREF: seg143:00A7j seg143:00E1j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à FileStream_Open_6368E (sub_6368E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 137 lignes,
; NON DÉTAILLÉE — ouvre le fichier sous-jacent, alloue un buffer
; (Memory_TypedFree_5C7B6/Memory_TypedAllocDispatchC_5C86D/Memory_TypedFreeWrapper_5C6F3 ×2,
; gestion d'erreur sub_6B70F). Appelée par FileStream_Construct_635AE.
; ==============================================================================================
FileStream_Open_3AEFE	proc far		; CODE XREF: FileStream_Construct_3AE1E+5Dp

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si+2], 0
		jz	short loc_3AF17
		mov	ax, 1
		jmp	short loc_3AF19
; ���������������������������������������������������������������������������

loc_3AF17:				; CODE XREF: FileStream_Open_3AEFE+12j
		xor	ax, ax

loc_3AF19:				; CODE XREF: FileStream_Open_3AEFE+17j
		mov	ah, 0
		or	ax, ax
		jz	short loc_3AF22
		jmp	loc_3AFB1
; ���������������������������������������������������������������������������

loc_3AF22:				; CODE XREF: FileStream_Open_3AEFE+1Fj
		cmp	dword ptr [si+4], 0
		jz	short loc_3AF3E
		push	0
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_3AF3E:				; CODE XREF: FileStream_Open_3AEFE+29j
		push	0
		push	2
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, [bp+arg_2]
		jle	short loc_3AF86
		mov	[bp+var_1], 1
		mov	eax, [bp+arg_2]
		mov	[si+8],	eax
		push	1
		push	0
		push	2
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+6],	dx
		mov	[si+4],	ax
		mov	eax, [si+4]
		mov	[si+0Ch], eax
		jmp	short loc_3AFA1
; ���������������������������������������������������������������������������

loc_3AF86:				; CODE XREF: FileStream_Open_3AEFE+57j
		push	1
		push	0
		push	2
		push	large dword ptr	[si+8]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+6],	dx
		mov	[si+4],	ax

loc_3AFA1:				; CODE XREF: FileStream_Open_3AEFE+86j
		cmp	dword ptr [si+4], 0
		jnz	short loc_3AFB1
		push	1201h
		call	sub_30D3
		pop	cx

loc_3AFB1:				; CODE XREF: FileStream_Open_3AEFE+21j
					; FileStream_Open_3AEFE+A8j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
FileStream_Open_3AEFE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FileStream_ReadRaw_63747 (sub_63747 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, appelle File_ReadOrDelegateToPaged (sub_64353, seg185)
; — lecture brute depuis le fichier sous-jacent.
; ==============================================================================================
FileStream_ReadRaw_3AFB7	proc far		; CODE XREF: FileStream_ReadBuffered_3AFFF+2Dp

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	large dword ptr	[si+8]
		push	large [bp+arg_2]
		push	large dword ptr	[si+4]
		push	si
		call	FileStream_Method_Read_3BBC3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0FFFFFFFFh
		jz	short loc_3AFF9
		mov	[si+14h], eax
		mov	eax, [bp+arg_2]
		mov	[si+10h], eax
		mov	[bp+var_1], 1

loc_3AFF9:				; CODE XREF: FileStream_ReadRaw_3AFB7+30j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
FileStream_ReadRaw_3AFB7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FileStream_ReadBuffered_6378F (sub_6378F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 79 lignes, NON DÉTAILLÉE — appelle
; FileStream_ReadRaw_63747, probable gestion du buffer de lecture. Appelée par
; FileStream_ReadLoop_6380D.
; ==============================================================================================
FileStream_ReadBuffered_3AFFF	proc far		; CODE XREF: seg143:029Ap

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sub	eax, [si+10h]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jl	short loc_3B026
		mov	eax, [si+14h]
		cmp	eax, [bp+var_4]
		jg	short loc_3B048

loc_3B026:				; CODE XREF: FileStream_ReadBuffered_3AFFF+1Bj
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr FileStream_ReadRaw_3AFB7
		add	sp, 6
		or	al, al
		jz	short loc_3B040
		mov	[bp+var_4], 0
		jmp	short loc_3B048
; ���������������������������������������������������������������������������

loc_3B040:				; CODE XREF: FileStream_ReadBuffered_3AFFF+35j
		mov	eax, 0FFFFFFFFh
		jmp	short loc_3B075
; ���������������������������������������������������������������������������

loc_3B048:				; CODE XREF: FileStream_ReadBuffered_3AFFF+25j
					; FileStream_ReadBuffered_3AFFF+3Fj
		mov	ax, [si+6]
		mov	dx, [si+4]
		add	dx, word ptr [bp+var_4]
		mov	[si+0Eh], ax
		mov	[si+0Ch], dx
		mov	eax, [si+14h]
		sub	eax, [bp+var_4]
		mov	[bp+var_8], eax
		cmp	eax, [bp+arg_6]
		jle	short loc_3B071
		mov	eax, [bp+arg_6]
		mov	[bp+var_8], eax

loc_3B071:				; CODE XREF: FileStream_ReadBuffered_3AFFF+68j
		mov	eax, [bp+var_8]

loc_3B075:				; CODE XREF: FileStream_ReadBuffered_3AFFF+47j
		shld	edx, eax, 10h
		pop	si
		leave
		retf
FileStream_ReadBuffered_3AFFF	endp

; ���������������������������������������������������������������������������

loc_3B07D:				; DATA XREF: dseg:48ACo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	dword ptr [bp-8], 0
		cmp	dword ptr [bp+0Ch], 0FFFFFFFFh
		jnz	short loc_3B101
		mov	eax, [si+18h]
		mov	[bp+0Ch], eax
		jmp	short loc_3B101
; ���������������������������������������������������������������������������

loc_3B0A0:				; CODE XREF: seg143:02F6j
		push	large dword ptr	[bp+10h]
		push	large dword ptr	[bp+0Ch]
		push	si
		push	cs
		call	near ptr FileStream_ReadBuffered_3AFFF
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0
		jz	short loc_3B108
		cmp	dword ptr [bp-4], 0FFFFFFFFh
		jz	short loc_3B108
		push	word ptr [bp-4]
		push	large dword ptr	[si+0Ch]
		push	large dword ptr	[bp+8]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		mov	eax, [bp-4]
		add	[bp+0Ch], eax
		sub	[bp+10h], eax
		add	[bp-8],	eax
		mov	ax, [bp+8]
		mov	cx, ax
		shr	ax, 4
		add	[bp+0Ah], ax
		and	cx, 0Fh
		mov	[bp+8],	cx
		mov	ax, [bp-4]
		add	[bp+8],	ax

loc_3B101:				; CODE XREF: seg143:0284j seg143:028Ej
		cmp	dword ptr [bp+10h], 0
		jg	short loc_3B0A0

loc_3B108:				; CODE XREF: seg143:02ADj seg143:02B4j
		mov	eax, [bp+0Ch]
		mov	[si+18h], eax
		cmp	dword ptr [bp-4], 0FFFFFFFFh
		jnz	short loc_3B11F
		mov	dword ptr [bp-8], 0FFFFFFFFh

loc_3B11F:				; CODE XREF: seg143:0305j
		mov	eax, [bp-8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3B12B:				; DATA XREF: dseg:48C4o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	eax, [si+18h]
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3B13E:				; DATA XREF: dseg:48C8o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3B16B
		mov	word ptr [si], 48C8h
		cmp	word ptr [si+2], 0
		jz	short loc_3B15E
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx

loc_3B15E:				; CODE XREF: seg143:0345j
		test	di, 1
		jz	short loc_3B16B
		push	si
		call	sub_308
		pop	cx

loc_3B16B:				; CODE XREF: seg143:033Bj seg143:0352j
		pop	di
		pop	si
		pop	bp
		retf
seg143		ends
