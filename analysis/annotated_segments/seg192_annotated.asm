seg192		segment	byte public 'CODE' use16
		assume cs:seg192
		;org 3
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — méthode « Read » de FileStream : délègue à
; File_ReadOrDelegateToPaged_630E7 (seg185) avec le handle interne (+2). Appelée par
; FileStream_ReadRaw_63747 (seg189).
; ==============================================================================================
FileStream_Method_Read_64353	proc far		; CODE XREF: FileStream_ReadRaw_63747:loc_63762P
					; DATA XREF: seg339:off_70FF6o

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_64387
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	File_ReadOrDelegateToPaged_630E7
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_64387:				; CODE XREF: FileStream_Method_Read_64353+16j
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave

locret_64392:
		retf
FileStream_Method_Read_64353	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — méthode « Write » de FileStream : délègue à
; File_WriteOrDelegateToPaged_631E3 (seg185).
; ==============================================================================================
FileStream_Method_Write_64393:				; DATA XREF: seg339:off_70FDAo
					; seg339:off_70FFAo
		push	bp
		mov	bp, sp
		sub	sp, 4

loc_64399:
		push	si

loc_6439A:
		mov	si, [bp+6]

loc_6439D:
		mov	dword ptr [bp-4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_643CB
		push	word ptr [si+2]
		push	large dword ptr	[bp+0Ch]
		push	large dword ptr	[bp+10h]
		push	large dword ptr	[bp+8]
		call	File_WriteOrDelegateToPaged_631E3
		or	ax, dx
		jz	short loc_643CB
		mov	eax, [bp+10h]
		mov	[bp-4],	eax

loc_643CB:				; CODE XREF: seg192:0059j seg192:0071j
		mov	eax, [bp-4]

loc_643CF:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — méthode « Seek » de FileStream : délègue à
; File_SeekWithRetry_63482 (seg187).
; ==============================================================================================
FileStream_Method_Seek_643D7:				; DATA XREF: seg339:off_70FDEo
					; seg339:off_70FFEo
		push	bp

loc_643D8:
		mov	bp, sp
		sub	sp, 4
		push	si

loc_643DE:
		mov	si, [bp+6]

loc_643E1:
		mov	dword ptr [bp-4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_64407

loc_643EF:
		push	word ptr [si+2]

loc_643F2:
		push	large dword ptr	[bp+8]

loc_643F6:
		mov	al, [bp+0Ch]
		push	ax
		call	File_SeekWithRetry_63482
		push	dx
		push	ax
		pop	eax
		mov	[bp-4],	eax

loc_64407:				; CODE XREF: seg192:009Dj
		mov	eax, [bp-4]
		shld	edx, eax, 10h
		pop	si

locret_64411:
		leave

locret_64412:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable — méthode « Open » de FileStream : File_CreateWithRetry_630BA
; (seg184) ou File_OpenWithRetry_63434 (seg186) selon le mode. Appelée par le thunk
; FileStream_Method_OpenAndInit_63616 (seg189).
; ==============================================================================================
FileStream_Method_Open_64413	proc far		; CODE XREF: seg189:loc_63625P
					; DATA XREF: seg339:off_71002o

var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_64414:
		mov	bp, sp

loc_64416:
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]

loc_6441D:
		mov	ax, [bp+arg_2]

loc_64420:
		mov	cx, [bp+arg_4]

loc_64423:
		mov	dl, 0
		cmp	word ptr [si+2], 0
		jnz	short loc_6446D
		or	cl, cl
		jnz	short loc_64438
		push	ds
		push	ax
		call	File_CreateWithRetry_630BA
		jmp	short loc_64450
; ���������������������������������������������������������������������������

loc_64438:				; CODE XREF: FileStream_Method_Open_64413+1Aj
		mov	[bp+var_2], 2
		cmp	cl, 1
		jnz	short loc_64445
		mov	[bp+var_2], 0

loc_64445:				; CODE XREF: FileStream_Method_Open_64413+2Cj
		push	ds
		push	ax
		mov	al, [bp+var_2]
		push	ax

loc_6444B:
		call	File_OpenWithRetry_63434

loc_64450:				; CODE XREF: FileStream_Method_Open_64413+23j
		mov	[si+2],	ax

loc_64453:
		cmp	word ptr [si+2], 0FFFFh

loc_64457:
		jz	short loc_6445E
		mov	ax, 1
		jmp	short loc_64460
; ���������������������������������������������������������������������������

loc_6445E:				; CODE XREF: FileStream_Method_Open_64413:loc_64457j
		xor	ax, ax

loc_64460:				; CODE XREF: FileStream_Method_Open_64413+49j
		mov	dl, al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6446D
		mov	word ptr [si+2], 0

loc_6446D:				; CODE XREF: FileStream_Method_Open_64413+16j
					; FileStream_Method_Open_64413+53j
		mov	al, dl
		pop	si
		leave
		retf
FileStream_Method_Open_64413	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — méthode « Close » de FileStream :
; File_CloseWithRetry_63463 (seg186), réinitialise le handle, retourne le statut.
; ==============================================================================================
FileStream_Method_Close_64472:				; DATA XREF: seg339:off_70FE6o
					; seg339:3F56o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_6448C
		push	word ptr [si+2]
		call	File_CloseWithRetry_63463
		mov	word ptr [si+2], 0

loc_6448C:				; CODE XREF: seg192:012Dj
		mov	ax, [si+2]
		neg	ax

loc_64491:
		sbb	ax, ax

loc_64493:
		inc	ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — calcule la taille du fichier via 3 appels
; LSEEK (File_SeekWithRetry_63482 : position courante, fin, retour).
; ==============================================================================================
FileStream_Method_GetSize_64497:				; DATA XREF: seg339:off_70FEAo
					; seg339:off_7100Ao
		push	bp
		mov	bp, sp
		sub	sp, 8

loc_6449D:
		push	si

loc_6449E:
		mov	si, [bp+6]

loc_644A1:
		mov	dword ptr [bp-8], 0
		cmp	word ptr [si+2], 0
		jz	short loc_644E7
		push	word ptr [si+2]
		push	large 0
		push	0
		call	File_SeekWithRetry_63482
		push	dx
		push	ax
		pop	eax
		mov	[bp-4],	eax
		push	word ptr [si+2]
		push	large 0
		push	2
		call	File_SeekWithRetry_63482

loc_644D1:
		push	dx
		push	ax
		pop	eax
		mov	[bp-8],	eax
		push	word ptr [si+2]
		push	large dword ptr	[bp-4]
		push	0
		call	File_SeekWithRetry_63482

loc_644E7:				; CODE XREF: seg192:015Dj
		mov	eax, [bp-8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — dispatch vtable [bx+0xC] avec position 0
; depuis la fin (méthode Seek stylisée « aller à la fin »).
; ==============================================================================================
FileStream_Method_SeekToEnd_644F3:				; DATA XREF: seg339:off_7100Eo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	1
		push	large 0

loc_644FF:
		push	si

loc_64500:
		mov	bx, [si]

loc_64502:
		call	dword ptr [bx+0Ch]
		add	sp, 8

loc_64508:
		pop	si
		pop	bp
		retf
seg192		ends
