seg189		segment	byte public 'CODE' use16
		assume cs:seg189
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, constructeur d'une classe « flux de fichier » : alloue (sub_658, 0x1C octets), pose
; deux tags vtable successifs (3F42h/3F22h), initialise 6 champs (dont +0x18 = position
; courante) puis appelle FileStream_Open_6368E. Référencée depuis seg193.
; ==============================================================================================
FileStream_Construct_635AE	proc far		; CODE XREF: seg193:loc_64E13P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp

loc_635B1:
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_635C7
		push	1Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_63611

loc_635C7:				; CODE XREF: FileStream_Construct_635AE+9j
		mov	word ptr [si], 3F42h
		mov	word ptr [si+2], 0
		mov	word ptr [si], 3F22h

loc_635D4:
		mov	dword ptr [si+4], 0
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+14h], 0

loc_635EC:
		mov	dword ptr [si+10h], 0
		mov	dword ptr [si+18h], 0

loc_635FC:
		mov	dword ptr [si+0Ch], 0

loc_63604:
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr FileStream_Open_6368E
		add	sp, 6

loc_63611:				; CODE XREF: FileStream_Construct_635AE+17j
		mov	ax, si

loc_63613:
		pop	si
		pop	bp
		retf
FileStream_Construct_635AE	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle (DATA XREF seg339) ouvrant le fichier (sub_64413, avec mode d'accès
; arg) et réinitialisant le champ +0x14, retourne succès (1).
; ==============================================================================================
FileStream_Method_OpenAndInit_63616:				; DATA XREF: seg339:off_70FE2o
		push	bp

loc_63617:
		mov	bp, sp

loc_63619:
		push	si

loc_6361A:
		mov	si, [bp+6]

loc_6361D:
		mov	al, [bp+0Ah]

loc_63620:
		push	ax

loc_63621:
		push	word ptr [bp+8]

loc_63624:
		push	si

loc_63625:
		call	FileStream_Method_Open_64413

loc_6362A:
		add	sp, 6

loc_6362D:
		mov	dword ptr [si+14h], 0
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — destructeur scalar-deleting de FileStream :
; libère le buffer (+4, Memory_TypedFree_5C7B6 tag 5C44h) si présent, ferme le fichier
; (dispatch vtable [bx+0x14]), libère l'objet si demandé (sub_338).
; ==============================================================================================
FileStream_ScalarDeletingDtor_6363A:				; DATA XREF: seg339:off_70FD2o
		push	bp
		mov	bp, sp
		push	si
		push	di

loc_6363F:
		mov	si, [bp+6]

loc_63642:
		mov	di, [bp+8]

loc_63645:
		or	si, si
		jz	short loc_6368A
		mov	word ptr [si], 3F22h

loc_6364D:
		cmp	dword ptr [si+4], 0
		jz	short loc_6366A

loc_63654:
		push	1205h
		push	2

loc_63659:
		mov	ax, si

loc_6365B:
		add	ax, 4
		push	ax
		push	5C44h

loc_63662:
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_6366A:				; CODE XREF: seg189:00B2j
		mov	word ptr [si], 3F42h
		cmp	word ptr [si+2], 0
		jz	short loc_6367D
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		jmp	short $+2

loc_6367D:				; CODE XREF: seg189:00D2j
		test	di, 1

loc_63681:
		jz	short loc_6368A

loc_63683:
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_6368A:				; CODE XREF: seg189:00A7j
					; seg189:loc_63681j
		pop	di
		pop	si
		pop	bp

locret_6368D:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 137 lignes, NON DÉTAILLÉE — ouvre le fichier sous-jacent, alloue un buffer
; (Memory_TypedFree_5C7B6/Memory_TypedAllocDispatchC_5C86D/Memory_TypedFreeWrapper_5C6F3 ×2,
; gestion d'erreur sub_6B70F). Appelée par FileStream_Construct_635AE.
; ==============================================================================================
FileStream_Open_6368E	proc far		; CODE XREF: FileStream_Construct_635AE+5Dp

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_6368F:
		mov	bp, sp

loc_63691:
		sub	sp, 2

loc_63694:
		push	si

loc_63695:
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0

loc_6369C:
		cmp	word ptr [si+2], 0

loc_636A0:
		jz	short loc_636A7

loc_636A2:
		mov	ax, 1
		jmp	short loc_636A9
; ���������������������������������������������������������������������������

loc_636A7:				; CODE XREF: FileStream_Open_6368E:loc_636A0j
		xor	ax, ax

loc_636A9:				; CODE XREF: FileStream_Open_6368E+17j
		mov	ah, 0
		or	ax, ax
		jz	short loc_636B2

loc_636AF:
		jmp	loc_63741
; ���������������������������������������������������������������������������

loc_636B2:				; CODE XREF: FileStream_Open_6368E+1Fj
		cmp	dword ptr [si+4], 0
		jz	short loc_636CE
		push	0
		push	2
		mov	ax, si
		add	ax, 4
		push	ax

loc_636C3:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_636CE:				; CODE XREF: FileStream_Open_6368E+29j
		push	0
		push	2

loc_636D2:
		push	5C44h

loc_636D5:
		call	Memory_TypedAllocDispatchC_5C86D

loc_636DA:
		push	dx
		push	ax
		pop	eax
		add	sp, 6

loc_636E1:
		cmp	eax, [bp+arg_2]

loc_636E5:
		jle	short loc_63716

loc_636E7:
		mov	[bp+var_1], 1
		mov	eax, [bp+arg_2]
		mov	[si+8],	eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_63703:
		add	sp, 0Ch
		mov	[si+6],	dx
		mov	[si+4],	ax
		mov	eax, [si+4]

loc_63710:
		mov	[si+0Ch], eax
		jmp	short loc_63731
; ���������������������������������������������������������������������������

loc_63716:				; CODE XREF: FileStream_Open_6368E:loc_636E5j
		push	1
		push	0
		push	2

loc_6371C:
		push	large dword ptr	[si+8]

loc_63720:
		push	5C44h

loc_63723:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_6372B:
		mov	[si+6],	dx

loc_6372E:
		mov	[si+4],	ax

loc_63731:				; CODE XREF: FileStream_Open_6368E+86j
		cmp	dword ptr [si+4], 0
		jnz	short loc_63741
		push	1201h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_63741:				; CODE XREF: FileStream_Open_6368E:loc_636AFj
					; FileStream_Open_6368E+A8j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
FileStream_Open_6368E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle File_ReadOrDelegateToPaged (sub_64353, seg185) — lecture brute depuis le
; fichier sous-jacent.
; ==============================================================================================
FileStream_ReadRaw_63747	proc far		; CODE XREF: FileStream_ReadBuffered_6378F:loc_637BCp

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si

loc_6374E:
		mov	si, [bp+arg_0]

loc_63751:
		mov	[bp+var_1], 0

loc_63755:
		push	large dword ptr	[si+8]
		push	large [bp+arg_2]

loc_6375D:
		push	large dword ptr	[si+4]
		push	si

loc_63762:
		call	FileStream_Method_Read_64353
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0FFFFFFFFh
		jz	short loc_63789
		mov	[si+14h], eax
		mov	eax, [bp+arg_2]
		mov	[si+10h], eax
		mov	[bp+var_1], 1

loc_63789:				; CODE XREF: FileStream_ReadRaw_63747+30j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
FileStream_ReadRaw_63747	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 79 lignes, NON DÉTAILLÉE — appelle FileStream_ReadRaw_63747, probable gestion du
; buffer de lecture. Appelée par FileStream_ReadLoop_6380D.
; ==============================================================================================
FileStream_ReadBuffered_6378F	proc far		; CODE XREF: seg189:029Ap

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp

loc_63792:
		sub	sp, 8
		push	si

loc_63796:
		mov	si, [bp+arg_0]

loc_63799:
		mov	eax, [bp+arg_2]

loc_6379D:
		sub	eax, [si+10h]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jl	short loc_637B6
		mov	eax, [si+14h]
		cmp	eax, [bp+var_4]

loc_637B4:
		jg	short loc_637D8

loc_637B6:				; CODE XREF: FileStream_ReadBuffered_6378F+1Bj
		push	large [bp+arg_2]
		push	si
		push	cs

loc_637BC:
		call	near ptr FileStream_ReadRaw_63747
		add	sp, 6

loc_637C2:
		or	al, al
		jz	short loc_637D0
		mov	[bp+var_4], 0
		jmp	short loc_637D8
; ���������������������������������������������������������������������������

loc_637D0:				; CODE XREF: FileStream_ReadBuffered_6378F+35j
		mov	eax, 0FFFFFFFFh

loc_637D6:
		jmp	short loc_63805
; ���������������������������������������������������������������������������

loc_637D8:				; CODE XREF: FileStream_ReadBuffered_6378F:loc_637B4j
					; FileStream_ReadBuffered_6378F+3Fj
		mov	ax, [si+6]
		mov	dx, [si+4]
		add	dx, word ptr [bp+var_4]
		mov	[si+0Eh], ax
		mov	[si+0Ch], dx
		mov	eax, [si+14h]
		sub	eax, [bp+var_4]
		mov	[bp+var_8], eax
		cmp	eax, [bp+arg_6]
		jle	short loc_63801
		mov	eax, [bp+arg_6]
		mov	[bp+var_8], eax

loc_63801:				; CODE XREF: FileStream_ReadBuffered_6378F+68j
		mov	eax, [bp+var_8]

loc_63805:				; CODE XREF: FileStream_ReadBuffered_6378F:loc_637D6j
		shld	edx, eax, 10h
		pop	si
		leave
		retf
FileStream_ReadBuffered_6378F	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — boucle de lecture principale : lit par blocs
; (FileStream_ReadBuffered_6378F) jusqu'à la taille demandée, met à jour la position courante
; (+0x18) et des statistiques (compteurs de secteurs). Méthode « Read » de la classe
; FileStream.
; ==============================================================================================
FileStream_ReadLoop_6380D:				; DATA XREF: seg339:3F26o
		push	bp
		mov	bp, sp
		sub	sp, 8

loc_63813:
		push	si

loc_63814:
		mov	si, [bp+6]

loc_63817:
		mov	dword ptr [bp-8], 0

loc_6381F:
		cmp	dword ptr [bp+0Ch], 0FFFFFFFFh

loc_63824:
		jnz	short loc_63891
		mov	eax, [si+18h]
		mov	[bp+0Ch], eax

loc_6382E:
		jmp	short loc_63891
; ���������������������������������������������������������������������������

loc_63830:				; CODE XREF: seg189:02F6j
		push	large dword ptr	[bp+10h]
		push	large dword ptr	[bp+0Ch]

loc_63838:
		push	si
		push	cs
		call	near ptr FileStream_ReadBuffered_6378F
		push	dx
		push	ax
		pop	eax

loc_63841:
		add	sp, 0Ah

loc_63844:
		mov	[bp-4],	eax

loc_63848:
		cmp	dword ptr [bp-4], 0

loc_6384D:
		jz	short loc_63898

loc_6384F:
		cmp	dword ptr [bp-4], 0FFFFFFFFh

loc_63854:
		jz	short loc_63898

loc_63856:
		push	word ptr [bp-4]

loc_63859:
		push	large dword ptr	[si+0Ch]

loc_6385D:
		push	large dword ptr	[bp+8]

loc_63861:
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		mov	eax, [bp-4]
		add	[bp+0Ch], eax

loc_63871:
		sub	[bp+10h], eax

loc_63875:
		add	[bp-8],	eax

loc_63879:
		mov	ax, [bp+8]
		mov	cx, ax

loc_6387E:
		shr	ax, 4
		add	[bp+0Ah], ax

loc_63884:
		and	cx, 0Fh
		mov	[bp+8],	cx
		mov	ax, [bp-4]
		add	[bp+8],	ax

loc_63891:				; CODE XREF: seg189:loc_63824j
					; seg189:loc_6382Ej
		cmp	dword ptr [bp+10h], 0
		jg	short loc_63830

loc_63898:				; CODE XREF: seg189:loc_6384Dj
					; seg189:loc_63854j
		mov	eax, [bp+0Ch]

loc_6389C:
		mov	[si+18h], eax
		cmp	dword ptr [bp-4], 0FFFFFFFFh
		jnz	short loc_638AF
		mov	dword ptr [bp-8], 0FFFFFFFFh

loc_638AF:				; CODE XREF: seg189:0305j
		mov	eax, [bp-8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — accesseur simple retournant la position
; courante (+0x18, 32 bits).
; ==============================================================================================
FileStream_Method_GetPosition_638BB:				; DATA XREF: seg339:off_70FEEo
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

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — variante de destructeur ne posant qu'un seul
; tag (3F42h), ferme le fichier (dispatch [bx+0x14]) et libère l'objet si demandé (sub_338).
; ==============================================================================================
FileStream_DestructPartial_638CE:				; DATA XREF: seg339:off_70FF2o
		push	bp
		mov	bp, sp

loc_638D1:
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_638FB
		mov	word ptr [si], 3F42h
		cmp	word ptr [si+2], 0
		jz	short loc_638EE
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx

loc_638EE:				; CODE XREF: seg189:0345j
		test	di, 1

loc_638F2:
		jz	short loc_638FB
		push	si

loc_638F5:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_638FB:				; CODE XREF: seg189:033Bj
					; seg189:loc_638F2j
		pop	di

loc_638FC:
		pop	si

loc_638FD:
		pop	bp
		retf
seg189		ends
