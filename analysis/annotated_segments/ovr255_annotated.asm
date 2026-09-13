ovr255		segment	para public 'OVERLAY' use16
		assume cs:ovr255
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin puis Memory_TypedFree_5C7B6 ×2.
; ==============================================================================================
MissionRecordField_ReleaseDouble_8B170	proc far		; CODE XREF: VROOMM_StubThunk_6B470J MissionRecordField_ReleaseSingleB_8C6ED+19p	...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_8B185
		jmp	loc_8B20D
; ���������������������������������������������������������������������������

loc_8B185:				; CODE XREF: MissionRecordField_ReleaseDouble_8B170+10j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_8B1BB
; ���������������������������������������������������������������������������

loc_8B19A:				; CODE XREF: MissionRecordField_ReleaseDouble_8B170+52j
		push	3
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		call	VROOMM_StubThunk_6B4E4
		add	sp, 6
		les	bx, [bp+var_4]
		mov	dword ptr es:[bx], 0
		inc	di
		add	word ptr [bp+var_4], 4

loc_8B1BB:				; CODE XREF: MissionRecordField_ReleaseDouble_8B170+28j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], di
		jg	short loc_8B19A
		push	0
		push	2
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		test	si, 1

loc_8B1F0:
		jz	short loc_8B20D
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, [bp+var_C]
		push	ax

loc_8B202:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8B20D:				; CODE XREF: MissionRecordField_ReleaseDouble_8B170+12j
					; MissionRecordField_ReleaseDouble_8B170:loc_8B1F0j
		pop	di
		pop	si
		leave
		retf
MissionRecordField_ReleaseDouble_8B170	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3.
; ==============================================================================================
MissionRecordField_ReleaseWrapper_8B211	proc far		; CODE XREF: VROOMM_StubThunk_6B46BJ MissionRecord_LoadFieldGroupMix_8B5A7+1B7p ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_8B214:
		mov	dx, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+4], 0
		mov	es:[bx+6], dx
		push	1
		push	0
		push	2
		mov	ax, dx
		shl	ax, 2
		movzx	eax, ax

loc_8B233:
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		mov	dx, es:[bx+0Ah]
		mov	ax, es:[bx+8]
		pop	bp
		retf
MissionRecordField_ReleaseWrapper_8B211	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (42 lignes).
; ==============================================================================================
MissionRecordField_Helper2_8B255	proc far		; CODE XREF: VROOMM_StubThunk_6B466J MissionRecordField_ReleaseAndThunk_8B2A3+83p	...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+6], 0
		jle	short loc_8B29C
		cmp	[bp+arg_4], 0
		jz	short loc_8B29C
		les	bx, es:[bx+8]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+4]
		shl	ax, 2
		add	bx, ax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		pop	es
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+4]
		dec	word ptr es:[bx+6]
		mov	dx, word ptr [bp+arg_4+2]
		mov	ax, word ptr [bp+arg_4]
		jmp	short loc_8B2A0
; ���������������������������������������������������������������������������

loc_8B29C:				; CODE XREF: MissionRecordField_Helper2_8B255+Cj
					; MissionRecordField_Helper2_8B255+13j
		xor	dx, dx
		xor	ax, ax

loc_8B2A0:				; CODE XREF: MissionRecordField_Helper2_8B255+45j
		pop	si
		pop	bp
		retf
MissionRecordField_Helper2_8B255	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 et un thunk voisin.
; ==============================================================================================
MissionRecordField_ReleaseAndThunk_8B2A3	proc far		; CODE XREF: VROOMM_StubThunk_6B48EJ MissionRecord_LoadWithDwordFieldsG_8BE83+18Ap

var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	al, [bp+arg_C]
		mov	[bp+var_9], al
		mov	al, [bp+arg_E]
		mov	[bp+var_A], al
		push	1
		push	0
		push	2
		push	large 28h ; '('
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_8B313
		mov	al, [bp+var_A]
		push	ax
		mov	al, [bp+var_9]
		push	ax
		lea	ax, [bp+arg_A]
		push	ax
		lea	ax, [bp+arg_8]
		push	ax
		lea	ax, [bp+arg_6]
		push	ax

loc_8B2EF:
		lea	ax, [bp+arg_4]
		push	ax
		push	large [bp+var_8]
		push	dx
		push	word ptr [bp+var_E]
		call	VROOMM_StubThunk_6B50C
		add	sp, 14h

loc_8B303:
		les	bx, [bp+var_E]

loc_8B306:
		mov	word ptr es:[bx], 0BD0h

loc_8B30B:
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_8B319
; ���������������������������������������������������������������������������

loc_8B313:				; CODE XREF: MissionRecordField_ReleaseAndThunk_8B2A3+36j
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_8B319:				; CODE XREF: MissionRecordField_ReleaseAndThunk_8B2A3+6Ej
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B338
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short locret_8B33C
; ���������������������������������������������������������������������������

loc_8B338:				; CODE XREF: MissionRecordField_ReleaseAndThunk_8B2A3+8Bj
		xor	dx, dx
		xor	ax, ax

locret_8B33C:				; CODE XREF: MissionRecordField_ReleaseAndThunk_8B2A3+93j
		leave
		retf
MissionRecordField_ReleaseAndThunk_8B2A3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 et un thunk voisin.
; ==============================================================================================
MissionRecordField_ReleaseAndThunkB_8B33E	proc far		; CODE XREF: VROOMM_StubThunk_6B498J MissionRecord_LoadFieldGroupMixC_8C088+19Dp ...

var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	al, [bp+arg_C]
		mov	[bp+var_9], al
		mov	al, [bp+arg_E]
		mov	[bp+var_A], al
		push	1
		push	0
		push	2
		push	large 28h ; '('
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_8B3AE
		mov	al, [bp+var_A]
		push	ax
		mov	al, [bp+var_9]
		push	ax
		lea	ax, [bp+arg_A]
		push	ax
		lea	ax, [bp+arg_8]
		push	ax
		lea	ax, [bp+arg_6]
		push	ax
		lea	ax, [bp+arg_4]
		push	ax
		push	large [bp+var_8]
		push	dx
		push	word ptr [bp+var_E]
		call	VROOMM_StubThunk_6B50C
		add	sp, 14h
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0BD0h
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_8B3B4
; ���������������������������������������������������������������������������

loc_8B3AE:				; CODE XREF: MissionRecordField_ReleaseAndThunkB_8B33E+36j
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_8B3B4:				; CODE XREF: MissionRecordField_ReleaseAndThunkB_8B33E+6Ej
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B3D3
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short locret_8B3D7
; ���������������������������������������������������������������������������

loc_8B3D3:				; CODE XREF: MissionRecordField_ReleaseAndThunkB_8B33E+8Bj
		xor	dx, dx
		xor	ax, ax

locret_8B3D7:				; CODE XREF: MissionRecordField_ReleaseAndThunkB_8B33E+93j
		leave
		retf
MissionRecordField_ReleaseAndThunkB_8B33E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (70 lignes).
; ==============================================================================================
MissionRecordField_ThunkOnly_8B3D9	proc far		; CODE XREF: VROOMM_StubThunk_6B448J

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, [bp+arg_E]
		push	ax
		mov	al, [bp+arg_C]
		push	ax
		lea	ax, [bp+arg_A]
		push	ax
		lea	ax, [bp+arg_8]
		push	ax
		lea	ax, [bp+arg_6]
		push	ax

loc_8B3F3:
		lea	ax, [bp+arg_4]

loc_8B3F6:
		push	ax

loc_8B3F7:
		push	large [bp+arg_0]
		push	large 0

loc_8B3FE:
		call	VROOMM_StubThunk_6B50C

loc_8B403:
		add	sp, 14h
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B425
		mov	dx, [bp+var_2]

loc_8B420:
		mov	ax, [bp+var_4]

loc_8B423:
		jmp	short locret_8B429
; ���������������������������������������������������������������������������

loc_8B425:				; CODE XREF: MissionRecordField_ThunkOnly_8B3D9+42j
		xor	dx, dx

loc_8B427:
		xor	ax, ax

locret_8B429:				; CODE XREF: MissionRecordField_ThunkOnly_8B3D9:loc_8B423j
		leave
		retf
MissionRecordField_ThunkOnly_8B3D9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (50 lignes).
; ==============================================================================================
MissionRecordField_ThunkOnly2_8B42B	proc far		; CODE XREF: VROOMM_StubThunk_6B44DJ

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp

loc_8B42E:
		sub	sp, 4
		mov	al, [bp+arg_A]

loc_8B434:
		push	ax
		mov	al, [bp+arg_8]
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		call	VROOMM_StubThunk_6B511
		add	sp, 10h
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B46D
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short locret_8B471
; ���������������������������������������������������������������������������

loc_8B46D:				; CODE XREF: MissionRecordField_ThunkOnly2_8B42B+38j
		xor	dx, dx
		xor	ax, ax

locret_8B471:				; CODE XREF: MissionRecordField_ThunkOnly2_8B42B+40j
		leave
		retf
MissionRecordField_ThunkOnly2_8B42B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (42 lignes).
; ==============================================================================================
MissionRecordField_ThunkOnly3_8B473	proc far		; CODE XREF: VROOMM_StubThunk_6B452J

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_A]
		push	[bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		call	VROOMM_StubThunk_6B4EE
		add	sp, 12h
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B4B2
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short locret_8B4B6
; ���������������������������������������������������������������������������

loc_8B4B2:				; CODE XREF: MissionRecordField_ThunkOnly3_8B473+35j
		xor	dx, dx
		xor	ax, ax

locret_8B4B6:				; CODE XREF: MissionRecordField_ThunkOnly3_8B473+3Dj
		leave
		retf
MissionRecordField_ThunkOnly3_8B473	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (51 lignes).
; ==============================================================================================
MissionRecordField_ThunkOnly4_8B4B8	proc far		; CODE XREF: VROOMM_StubThunk_6B457J

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	large [bp+arg_A]
		sub	sp, 4
		mov	si, [bp+arg_8]
		mov	ax, [si]
		mov	[bp+var_E], ax
		mov	ax, [si+2]
		mov	[bp+var_C], ax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		call	VROOMM_StubThunk_6B4FD
		add	sp, 14h
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B506
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_8B50A
; ���������������������������������������������������������������������������

loc_8B506:				; CODE XREF: MissionRecordField_ThunkOnly4_8B4B8+44j
		xor	dx, dx
		xor	ax, ax

loc_8B50A:				; CODE XREF: MissionRecordField_ThunkOnly4_8B4B8+4Cj
		pop	si
		leave
		retf
MissionRecordField_ThunkOnly4_8B4B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (53 lignes).
; ==============================================================================================
MissionRecordField_ThunkOnly5_8B50D	proc far		; CODE XREF: VROOMM_StubThunk_6B45CJ

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	large [bp+arg_A]
		sub	sp, 4
		mov	si, [bp+arg_8]
		mov	ax, [si]

loc_8B520:
		mov	[bp+var_E], ax
		mov	ax, [si+2]
		mov	[bp+var_C], ax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		call	VROOMM_StubThunk_6B507
		add	sp, 14h
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B55B
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_8B55F
; ���������������������������������������������������������������������������

loc_8B55B:				; CODE XREF: MissionRecordField_ThunkOnly5_8B50D+44j
		xor	dx, dx
		xor	ax, ax

loc_8B55F:				; CODE XREF: MissionRecordField_ThunkOnly5_8B50D+4Cj
		pop	si
		leave
		retf
MissionRecordField_ThunkOnly5_8B50D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (42 lignes).
; ==============================================================================================
MissionRecordField_ThunkOnly6_8B562	proc far		; CODE XREF: VROOMM_StubThunk_6B461J MissionRecord_LoadFieldGroupMix_8B5A7+1DBp ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_A]
		push	[bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		call	VROOMM_StubThunk_6B4F3
		add	sp, 12h
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_Helper2_8B255
		add	sp, 8
		or	ax, dx
		jz	short loc_8B5A1
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short locret_8B5A5
; ���������������������������������������������������������������������������

loc_8B5A1:				; CODE XREF: MissionRecordField_ThunkOnly6_8B562+35j
		xor	dx, dx
		xor	ax, ax

locret_8B5A5:				; CODE XREF: MissionRecordField_ThunkOnly6_8B562+3Dj
		leave
		retf
MissionRecordField_ThunkOnly6_8B562	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 298 lignes, NON DÉTAILLÉE — combine ReadFieldGroupB_64A54/ReadFieldGroupC_64A7E
; répétés.
; ==============================================================================================
MissionRecord_LoadFieldGroupMix_8B5A7	proc far		; CODE XREF: VROOMM_StubThunk_6B47AJ

var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8B5D9
		push	1
		push	0
		push	2
		push	large 1Ah
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8B5D9
		jmp	loc_8B828
; ���������������������������������������������������������������������������

loc_8B5D9:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+Fj
					; MissionRecord_LoadFieldGroupMix_8B5A7+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0BC0h

loc_8B600:
		mov	ax, word ptr [bp+arg_0]

loc_8B603:
		add	ax, 0Eh

loc_8B606:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 12h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 16h
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1

loc_8B61E:
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1
		mov	[bp+var_A], 0

loc_8B632:
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8B6C4
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_16], eax
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1E], eax
		shl	eax, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_12], eax
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], eax

loc_8B6C4:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+B5j
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8B6DC
		jmp	loc_8B7FC
; ���������������������������������������������������������������������������

loc_8B6DC:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+130j
		mov	eax, [si+72h]
		mov	[bp+var_2A], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_8B6F4:
		add	sp, 0Ch
		mov	word ptr [bp+var_2E+2],	dx
		mov	word ptr [bp+var_2E], ax
		mov	eax, [bp+var_2E]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1

loc_8B70D:
		mov	[bp+var_4], 0

loc_8B715:
		mov	eax, [bp+var_2A]
		mov	[bp+var_4], eax
		push	0
		mov	al, [bp+var_6]
		push	ax

loc_8B723:
		push	large [bp+var_A]

loc_8B727:
		push	5C44h

loc_8B72A:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah

loc_8B732:
		mov	word ptr [bp+var_36+2],	dx
		mov	word ptr [bp+var_36], ax
		cmp	[bp+var_36], 0
		jnz	short loc_8B742
		jmp	loc_8B7FC
; ���������������������������������������������������������������������������

loc_8B742:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+196j
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	[bp+var_3E], 0
		mov	[bp+var_3C], 0
		push	1
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseWrapper_8B211
		add	sp, 6
		or	ax, dx
		jz	short loc_8B78E
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr MissionRecordField_ThunkOnly6_8B562
		add	sp, 0Eh
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax

loc_8B78E:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+1BFj
		cmp	[bp+var_3A], 0
		jz	short loc_8B7FC
		les	bx, [bp+var_3A]
		mov	word ptr es:[bx+2Ah], 0
		push	large [bp+var_36]
		call	Struct_GetElementCountMinusOne_625CC
		mov	[bp+var_40], ax
		mov	si, 1
		jmp	short loc_8B7C1
; ���������������������������������������������������������������������������

loc_8B7AF:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+21Dj
		lea	ax, [bp+var_E]
		push	ax
		push	si
		push	large [bp+var_3A]
		call	Grid_SetElementPos
		add	sp, 8
		inc	si

loc_8B7C1:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+206j
		cmp	si, [bp+var_40]
		jle	short loc_8B7AF
		les	bx, [bp+var_3A]
		mov	ax, es:[bx+30h]
		dec	ax
		mov	[bp+var_46], ax
		movsx	ebx, [bp+var_46]
		mov	eax, [bp+var_12]
		cdq
		idiv	ebx
		mov	[bp+var_4A], eax
		mov	[bp+var_44], eax
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		les	bx, [bp+arg_0]

loc_8B7F2:
		mov	es:[bx+16h], eax
		mov	byte ptr es:[bx+0Ch], 1

loc_8B7FC:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+132j
					; MissionRecord_LoadFieldGroupMix_8B5A7+198j ...
		cmp	[bp+var_5], 0
		jz	short loc_8B828
		cmp	[bp+var_A], 0
		jz	short loc_8B828

loc_8B809:
		push	0

loc_8B80B:
		mov	al, [bp+var_6]
		push	ax

loc_8B80F:
		mov	eax, [bp+var_A]
		mov	[bp+var_32], eax
		lea	ax, [bp+var_32]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8B828:				; CODE XREF: MissionRecord_LoadFieldGroupMix_8B5A7+2Fj
					; MissionRecord_LoadFieldGroupMix_8B5A7+259j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadFieldGroupMix_8B5A7	endp

; ���������������������������������������������������������������������������

loc_8B831:				; CODE XREF: VROOMM_StubThunk_6B475J
		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		mov	si, [bp+0Ch]
		cmp	dword ptr [bp+6], 0
		jnz	short loc_8B863
		push	1
		push	0
		push	2
		push	large 1Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp+8],	dx
		mov	[bp+6],	ax
		or	ax, dx
		jnz	short loc_8B863
		jmp	loc_8BADF
; ���������������������������������������������������������������������������

loc_8B863:				; CODE XREF: ovr255:06D0j ovr255:06EEj
		les	bx, [bp+6]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0BB0h
		mov	ax, [bp+6]
		add	ax, 0Eh
		mov	ax, [bp+6]
		add	ax, 12h
		mov	ax, [bp+6]
		add	ax, 16h
		mov	ax, [bp+6]
		add	ax, 1Ah
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, [bp+6]
		mov	byte ptr es:[bx+0Dh], 1
		mov	dword ptr [bp-0Ah], 0
		mov	byte ptr [bp-6], 2
		mov	byte ptr [bp-5], 0
		mov	dword ptr [bp-4], 0
		mov	ax, [bp+0Ah]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8B916
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp-0Eh], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp-0Ch], ax

loc_8B902:
		push	si

loc_8B903:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp-12h], ax
		push	si

loc_8B90D:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8B913:
		mov	[bp-10h], ax

loc_8B916:				; CODE XREF: ovr255:077Cj
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8B92E
		jmp	loc_8BAB3
; ���������������������������������������������������������������������������

loc_8B92E:				; CODE XREF: ovr255:07B9j
		mov	eax, [si+72h]

loc_8B932:
		mov	[bp-16h], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-18h], dx
		mov	[bp-1Ah], ax
		mov	eax, [bp-1Ah]
		mov	[bp-0Ah], eax
		mov	byte ptr [bp-6], 3
		mov	byte ptr [bp-5], 1
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-16h]
		mov	[bp-4],	eax
		push	0
		mov	al, [bp-6]
		push	ax
		push	large dword ptr	[bp-0Ah]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
; ���������������������������������������������������������������������������
word_8B984	dw 5689h		; DATA XREF: VROOMM_AllocateAndRelocate_6855F+1Dr
word_8B986	dw 89E0h		; DATA XREF: VROOMM_AllocateAndRelocate_6855F+21r
aFFg		db 'F�f�~�',0
; ���������������������������������������������������������������������������
		jnz	short loc_8B994
		jmp	loc_8BAB3
; ���������������������������������������������������������������������������

loc_8B994:				; CODE XREF: ovr255:081Fj
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	word ptr [bp-2Ah], 0
		mov	word ptr [bp-28h], 0
		push	1
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr MissionRecordField_ReleaseWrapper_8B211
		add	sp, 6
		or	ax, dx
		jz	short loc_8B9E0
		push	ds
		les	bx, [bp+6]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp-2Ah]
		push	ax
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		push	word ptr [bp+8]
		push	bx
		push	cs
		call	near ptr MissionRecordField_ThunkOnly6_8B562
		add	sp, 0Eh
		mov	[bp-24h], dx
		mov	[bp-26h], ax

loc_8B9E0:				; CODE XREF: ovr255:0848j
		cmp	dword ptr [bp-26h], 0
		jnz	short loc_8B9EA
		jmp	loc_8BAB3
; ���������������������������������������������������������������������������

loc_8B9EA:				; CODE XREF: ovr255:0875j
		les	bx, [bp-26h]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+5]
		mov	bx, [bp+6]
		mov	es:[bx+0Eh], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+7]
		mov	bx, [bp+6]
		mov	es:[bx+10h], ax

loc_8BA12:
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Dh]
		mov	bx, [bp+6]
		add	es:[bx+0Eh], ax
		mov	bx, es:[bx+2]

loc_8BA24:
		mov	ax, [bx+0Fh]
		mov	bx, [bp+6]
		add	es:[bx+10h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+9]
		mov	bx, [bp+6]
		mov	es:[bx+12h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Bh]
		mov	bx, [bp+6]
		mov	es:[bx+14h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Dh]
		mov	bx, [bp+6]
		add	es:[bx+12h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Fh]
		mov	bx, [bp+6]
		add	es:[bx+14h], ax
		mov	ax, es:[bx+0Eh]
		add	ax, [bp-12h]
		mov	es:[bx+16h], ax

loc_8BA71:
		mov	ax, es:[bx+10h]

loc_8BA75:
		add	ax, [bp-10h]
		mov	es:[bx+18h], ax

loc_8BA7C:
		mov	ax, es:[bx+12h]

loc_8BA80:
		sub	ax, [bp-12h]

loc_8BA83:
		mov	es:[bx+1Ah], ax

loc_8BA87:
		mov	ax, es:[bx+14h]
		sub	ax, [bp-10h]
		mov	es:[bx+1Ch], ax
		mov	ax, [bp-0Eh]
		sub	es:[bx+0Eh], ax
		mov	ax, [bp-0Ch]
		sub	es:[bx+10h], ax
		mov	ax, [bp-0Eh]
		add	es:[bx+12h], ax
		mov	ax, [bp-0Ch]
		add	es:[bx+14h], ax
		mov	byte ptr es:[bx+0Ch], 1

loc_8BAB3:				; CODE XREF: ovr255:07BBj ovr255:0821j ...
		cmp	byte ptr [bp-5], 0
		jz	short loc_8BADF
		cmp	dword ptr [bp-0Ah], 0
		jz	short loc_8BADF
		push	0
		mov	al, [bp-6]
		push	ax
		mov	eax, [bp-0Ah]
		mov	[bp-1Eh], eax
		lea	ax, [bp-1Eh]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8BADF:				; CODE XREF: ovr255:06F0j ovr255:0947j ...
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 319 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadFieldGroupMix_8B5A7.
; ==============================================================================================
MissionRecord_LoadFieldGroupMixB_8BAE8	proc far		; CODE XREF: VROOMM_StubThunk_6B47FJ

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8BB1A
		push	1
		push	0
		push	2
		push	large 26h ; '&'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8BB1A
		jmp	loc_8BDB3
; ���������������������������������������������������������������������������

loc_8BB1A:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+Fj
					; MissionRecord_LoadFieldGroupMixB_8BAE8+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh

loc_8BB22:
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0BA0h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 12h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 16h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Eh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 22h	; '"'
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1

loc_8BB71:
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2

loc_8BB7D:
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		mov	word ptr es:[bx+12h], 0
		mov	word ptr es:[bx+14h], 0
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Dh]

loc_8BBA3:
		mov	bx, word ptr [bp+arg_0]

loc_8BBA6:
		mov	es:[bx+16h], ax

loc_8BBAA:
		mov	bx, es:[bx+2]

loc_8BBAE:
		mov	ax, [bx+0Fh]

loc_8BBB1:
		mov	bx, word ptr [bp+arg_0]

loc_8BBB4:
		mov	es:[bx+18h], ax
		mov	byte ptr es:[bx+1Dh], 0
		mov	byte ptr es:[bx+1Bh], 1
		mov	byte ptr es:[bx+1Ch], 1
		mov	byte ptr es:[bx+1Ah], 1
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8BC11
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], ax
		push	si

loc_8BBFE:
		call	ResourceRecord_ReadFieldGroupB_64A54

loc_8BC03:
		pop	cx
		mov	[bp+var_E], ax

loc_8BC07:
		push	si

loc_8BC08:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8BC0E:
		mov	[bp+var_C], ax

loc_8BC11:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+F7j
		push	0

loc_8BC13:
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8BC29
		jmp	loc_8BD87
; ���������������������������������������������������������������������������

loc_8BC29:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+13Cj
		mov	eax, [si+72h]
		mov	[bp+var_12], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		cmp	[bp+var_A], 0
		jz	short loc_8BC76

loc_8BC71:
		mov	ax, 1
		jmp	short loc_8BC78
; ���������������������������������������������������������������������������

loc_8BC76:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+187j
		xor	ax, ax

loc_8BC78:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+18Cj
		or	ax, ax
		jnz	short loc_8BC7F

loc_8BC7C:
		jmp	loc_8BD87
; ���������������������������������������������������������������������������

loc_8BC7F:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+192j
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	[bp+var_22], 0

loc_8BCA4:
		mov	[bp+var_20], 0
		push	1
		push	large [bp+arg_0]

loc_8BCAF:
		push	cs
		call	near ptr MissionRecordField_ReleaseWrapper_8B211
		add	sp, 6
		or	ax, dx
		jz	short loc_8BCE0
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr MissionRecordField_ThunkOnly6_8B562
		add	sp, 0Eh
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], ax

loc_8BCE0:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+1D0j
		cmp	[bp+var_1E], 0
		jnz	short loc_8BCEA
		jmp	loc_8BD87
; ���������������������������������������������������������������������������

loc_8BCEA:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+1FDj
		les	bx, [bp+var_1E]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	ax, [bx+5]
		mov	bx, word ptr [bp+arg_0]

loc_8BD00:
		mov	es:[bx+1Eh], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+7]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Dh]
		mov	bx, word ptr [bp+arg_0]
		add	es:[bx+1Eh], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Fh]
		mov	bx, word ptr [bp+arg_0]
		add	es:[bx+20h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+9]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Bh]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+24h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Dh]
		mov	bx, word ptr [bp+arg_0]
		add	es:[bx+22h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Fh]
		mov	bx, word ptr [bp+arg_0]
		add	es:[bx+24h], ax
		mov	ax, [bp+var_E]
		add	es:[bx+1Eh], ax
		mov	ax, [bp+var_C]
		add	es:[bx+20h], ax
		mov	ax, [bp+var_E]

loc_8BD77:
		sub	es:[bx+22h], ax
		mov	ax, [bp+var_C]
		sub	es:[bx+24h], ax
		mov	byte ptr es:[bx+0Ch], 1

loc_8BD87:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+13Ej
					; MissionRecord_LoadFieldGroupMixB_8BAE8:loc_8BC7Cj	...
		cmp	[bp+var_5], 0
		jz	short loc_8BDB3
		cmp	[bp+var_A], 0
		jz	short loc_8BDB3
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_1A], eax

loc_8BDA2:
		lea	ax, [bp+var_1A]
		push	ax
		push	5C44h

loc_8BDA9:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8BDB3:				; CODE XREF: MissionRecord_LoadFieldGroupMixB_8BAE8+2Fj
					; MissionRecord_LoadFieldGroupMixB_8BAE8+2A3j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadFieldGroupMixB_8BAE8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupB_64A54 ×2 (89 lignes).
; ==============================================================================================
MissionRecord_LoadFieldGroupSmall_8BDBC	proc far		; CODE XREF: VROOMM_StubThunk_6B484J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8BDEB
		push	1
		push	0
		push	2
		push	large 23h ; '#'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8BDEB
		jmp	loc_8BE7A
; ���������������������������������������������������������������������������

loc_8BDEB:				; CODE XREF: MissionRecord_LoadFieldGroupSmall_8BDBC+Cj
					; MissionRecord_LoadFieldGroupSmall_8BDBC+2Aj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0

loc_8BDFF:
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B90h

loc_8BE12:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 17h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Bh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Fh
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8BE7A
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8BE73:
		les	bx, [bp+arg_0]

loc_8BE76:
		mov	es:[bx+15h], ax

loc_8BE7A:				; CODE XREF: MissionRecord_LoadFieldGroupSmall_8BDBC+2Cj
					; MissionRecord_LoadFieldGroupSmall_8BDBC+A0j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		pop	bp

locret_8BE82:
		retf
MissionRecord_LoadFieldGroupSmall_8BDBC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 244 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadWithDwordFields_89850.
; ==============================================================================================
MissionRecord_LoadWithDwordFieldsG_8BE83	proc far		; CODE XREF: VROOMM_StubThunk_6B489J

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp

loc_8BE86:
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8BEB5
		push	1
		push	0
		push	2
		push	large 12h
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_8BEA8:
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8BEB5
		jmp	loc_8C07F
; ���������������������������������������������������������������������������

loc_8BEB5:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+Fj
					; MissionRecord_LoadWithDwordFieldsG_8BE83+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B80h
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0

loc_8BF04:
		mov	[bp+var_4], 0

loc_8BF0C:
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax

loc_8BF13:
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8BF3E
		jmp	loc_8C053
; ���������������������������������������������������������������������������

loc_8BF3E:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+B6j
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1

loc_8BF6F:
		mov	[bp+var_4], 0

loc_8BF77:
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		cmp	[bp+var_A], 0
		jz	short loc_8BF8B
		mov	ax, 1
		jmp	short loc_8BF8D
; ���������������������������������������������������������������������������

loc_8BF8B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+101j
		xor	ax, ax

loc_8BF8D:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+106j
		or	ax, ax
		jnz	short loc_8BF94
		jmp	loc_8C053
; ���������������������������������������������������������������������������

loc_8BF94:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+10Cj
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h

loc_8BFA1:
		call	Memory_TypedAllocDispatchB_5C832

loc_8BFA6:
		add	sp, 0Ah
		push	dx

loc_8BFAA:
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF

loc_8BFB1:
		add	sp, 6

loc_8BFB4:
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		push	2
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseWrapper_8B211
		add	sp, 6
		or	ax, dx
		jz	short loc_8C03B
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr MissionRecordField_ThunkOnly6_8B562
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		push	large 0
		push	large 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseAndThunk_8B2A3
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], dx
		mov	es:[bx+0Eh], ax
		mov	ax, es:[bx+0Eh]
		add	ax, 0Ah
		push	word ptr es:[bx+10h]
		push	ax
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy

loc_8C03B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+14Aj
		cmp	[bp+var_1A], 0
		jz	short loc_8C053

loc_8C042:
		les	bx, [bp+var_1A]

loc_8C045:
		mov	word ptr es:[bx+2Ah], 0

loc_8C04B:
		les	bx, [bp+arg_0]

loc_8C04E:
		mov	byte ptr es:[bx+0Ch], 1

loc_8C053:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+B8j
					; MissionRecord_LoadWithDwordFieldsG_8BE83+10Ej ...
		cmp	[bp+var_5], 0

loc_8C057:
		jz	short loc_8C07F
		cmp	[bp+var_A], 0
		jz	short loc_8C07F
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]

loc_8C071:
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8C07F:				; CODE XREF: MissionRecord_LoadWithDwordFieldsG_8BE83+2Fj
					; MissionRecord_LoadWithDwordFieldsG_8BE83:loc_8C057j	...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFieldsG_8BE83	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 314 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadFieldGroupMix_8B5A7.
; ==============================================================================================
MissionRecord_LoadFieldGroupMixC_8C088	proc far		; CODE XREF: VROOMM_StubThunk_6B493J

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8C0BA
		push	1
		push	0
		push	2

loc_8C09F:
		push	large 1Ch
		push	5C44h

loc_8C0A5:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8C0BA
		jmp	loc_8C323
; ���������������������������������������������������������������������������

loc_8C0BA:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+Fj
					; MissionRecord_LoadFieldGroupMixC_8C088+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B70h
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0

loc_8C111:
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8C13B
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ah], ax

loc_8C13B:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+A3j
		push	0
		push	large 50414853h
		push	si

loc_8C144:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax

loc_8C14E:
		jnz	short loc_8C153
		jmp	loc_8C2F7
; ���������������������������������������������������������������������������

loc_8C153:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088:loc_8C14Ej
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx

loc_8C171:
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1

loc_8C184:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]

loc_8C190:
		mov	[bp+var_4], eax

loc_8C194:
		cmp	[bp+var_A], 0
		jz	short loc_8C1A0

loc_8C19B:
		mov	ax, 1
		jmp	short loc_8C1A2
; ���������������������������������������������������������������������������

loc_8C1A0:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+111j
		xor	ax, ax

loc_8C1A2:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+116j
		or	ax, ax

loc_8C1A4:
		jnz	short loc_8C1A9

loc_8C1A6:
		jmp	loc_8C2F7
; ���������������������������������������������������������������������������

loc_8C1A9:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088:loc_8C1A4j
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		push	4
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseWrapper_8B211
		add	sp, 6
		or	ax, dx
		jnz	short loc_8C1E7
		jmp	loc_8C2DF
; ���������������������������������������������������������������������������

loc_8C1E7:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+15Aj
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr MissionRecordField_ThunkOnly6_8B562

loc_8C204:
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		push	large 0
		push	large 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseAndThunkB_8B33E
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], dx
		mov	es:[bx+0Eh], ax
		mov	ax, es:[bx+0Eh]
		add	ax, 0Ah
		push	word ptr es:[bx+10h]
		push	ax

loc_8C242:
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ds
		push	ax

loc_8C24B:
		mov	cx, 8
		call	CRT_Fmemcpy
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		push	large 0
		push	large 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseAndThunkB_8B33E
		add	sp, 10h

loc_8C271:
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], dx

loc_8C278:
		mov	es:[bx+12h], ax

loc_8C27C:
		mov	ax, es:[bx+12h]
		add	ax, 0Ah
		push	word ptr es:[bx+14h]
		push	ax
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ds
		push	ax
		mov	cx, 8

loc_8C294:
		call	CRT_Fmemcpy
		push	0
		les	bx, [bp+arg_0]

loc_8C29E:
		mov	bx, es:[bx+2]

loc_8C2A2:
		mov	al, [bx+2Bh]
		push	ax
		push	large 0
		push	large 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseAndThunkB_8B33E

loc_8C2B4:
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], dx
		mov	es:[bx+16h], ax
		mov	ax, es:[bx+16h]
		add	ax, 0Ah
		push	word ptr es:[bx+18h]
		push	ax
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy

loc_8C2DF:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+15Cj
		cmp	[bp+var_1A], 0
		jz	short loc_8C2F7
		les	bx, [bp+var_1A]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8C2F7:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+C8j
					; MissionRecord_LoadFieldGroupMixC_8C088:loc_8C1A6j	...
		cmp	[bp+var_5], 0
		jz	short loc_8C323
		cmp	[bp+var_A], 0
		jz	short loc_8C323

loc_8C304:
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8C323:				; CODE XREF: MissionRecord_LoadFieldGroupMixC_8C088+2Fj
					; MissionRecord_LoadFieldGroupMixC_8C088+273j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadFieldGroupMixC_8C088	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 225 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadFieldGroupMix_8B5A7.
; ==============================================================================================
MissionRecord_LoadFieldGroupMixD_8C32C	proc far		; CODE XREF: VROOMM_StubThunk_6B49DJ

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8C35E
		push	1
		push	0
		push	2
		push	large 19h
		push	5C44h

loc_8C349:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8C35E
		jmp	loc_8C528
; ���������������������������������������������������������������������������

loc_8C35E:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+Fj
					; MissionRecord_LoadFieldGroupMixD_8C32C+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B60h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 14h

loc_8C391:
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h

loc_8C39B:
		mov	cl, 1
		mov	byte_6E33B, cl

loc_8C3A1:
		mov	bx, word ptr [bp+arg_0]

loc_8C3A4:
		mov	byte ptr es:[bx+0Dh], 1

loc_8C3A9:
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		mov	word ptr es:[bx+10h], 0
		mov	word ptr es:[bx+12h], 0
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Dh]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+14h], ax
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Fh]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+16h], ax
		mov	byte ptr es:[bx+18h], 1
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8C418
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax

loc_8C418:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+DCj
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8C430
		jmp	loc_8C4FC
; ���������������������������������������������������������������������������

loc_8C430:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+FFj
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h

loc_8C443:
		call	Memory_TypedFreeWrapper_5C6F3

loc_8C448:
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax

loc_8C451:
		mov	eax, [bp+var_12]

loc_8C455:
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		cmp	[bp+var_A], 0
		jz	short loc_8C47D
		mov	ax, 1
		jmp	short loc_8C47F
; ���������������������������������������������������������������������������

loc_8C47D:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+14Aj
		xor	ax, ax

loc_8C47F:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+14Fj
		or	ax, ax
		jz	short loc_8C4FC
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax

loc_8C49A:
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		push	1
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseWrapper_8B211
		add	sp, 6
		or	ax, dx
		jz	short loc_8C4E4
		push	ds
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 5
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr MissionRecordField_ThunkOnly6_8B562
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax

loc_8C4E4:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+190j
		cmp	[bp+var_1A], 0
		jz	short loc_8C4FC
		les	bx, [bp+var_1A]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8C4FC:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+101j
					; MissionRecord_LoadFieldGroupMixD_8C32C+155j ...
		cmp	[bp+var_5], 0
		jz	short loc_8C528
		cmp	[bp+var_A], 0
		jz	short loc_8C528
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8C528:				; CODE XREF: MissionRecord_LoadFieldGroupMixD_8C32C+2Fj
					; MissionRecord_LoadFieldGroupMixD_8C32C+1D4j ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadFieldGroupMixD_8C32C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 208 lignes, NON DÉTAILLÉE — variante de MissionRecord_LoadWithDwordFields_89850.
; ==============================================================================================
MissionRecord_LoadWithDwordFieldsH_8C531	proc far		; CODE XREF: VROOMM_StubThunk_6B4A2J

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0

loc_8C540:
		jnz	short loc_8C563
		push	1
		push	0

loc_8C546:
		push	2
		push	large 0Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8C563
		jmp	loc_8C6E4
; ���������������������������������������������������������������������������

loc_8C563:				; CODE XREF: MissionRecord_LoadWithDwordFieldsH_8C531:loc_8C540j
					; MissionRecord_LoadWithDwordFieldsH_8C531+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0

loc_8C571:
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0B50h
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h

loc_8C594:
		mov	cl, 1

loc_8C596:
		mov	byte_6E33B, cl

loc_8C59A:
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1

loc_8C5A2:
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8C5EC
		jmp	loc_8C6B8
; ���������������������������������������������������������������������������

loc_8C5EC:				; CODE XREF: MissionRecord_LoadWithDwordFieldsH_8C531+B6j
		mov	eax, [si+72h]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		cmp	[bp+var_A], 0
		jz	short loc_8C639
		mov	ax, 1
		jmp	short loc_8C63B
; ���������������������������������������������������������������������������

loc_8C639:				; CODE XREF: MissionRecord_LoadWithDwordFieldsH_8C531+101j
		xor	ax, ax

loc_8C63B:				; CODE XREF: MissionRecord_LoadWithDwordFieldsH_8C531+106j
		or	ax, ax
		jz	short loc_8C6B8
		push	0

loc_8C641:
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		push	1
		push	large [bp+arg_0]
		push	cs
		call	near ptr MissionRecordField_ReleaseWrapper_8B211
		add	sp, 6
		or	ax, dx
		jz	short loc_8C6A0
		push	ds
		les	bx, [bp+arg_0]

loc_8C67E:
		mov	ax, es:[bx+2]

loc_8C682:
		add	ax, 5
		push	ax

loc_8C686:
		lea	ax, [bp+var_1E]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax

loc_8C68F:
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr MissionRecordField_ThunkOnly6_8B562

loc_8C697:
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax

loc_8C6A0:				; CODE XREF: MissionRecord_LoadWithDwordFieldsH_8C531+147j
		cmp	[bp+var_1A], 0

loc_8C6A5:
		jz	short loc_8C6B8
		les	bx, [bp+var_1A]
		mov	word ptr es:[bx+2Ah], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1

loc_8C6B8:				; CODE XREF: MissionRecord_LoadWithDwordFieldsH_8C531+B8j
					; MissionRecord_LoadWithDwordFieldsH_8C531+10Cj ...
		cmp	[bp+var_5], 0
		jz	short loc_8C6E4
		cmp	[bp+var_A], 0
		jz	short loc_8C6E4
		push	0
		mov	al, [bp+var_6]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8C6E4:				; CODE XREF: MissionRecord_LoadWithDwordFieldsH_8C531+2Fj
					; MissionRecord_LoadWithDwordFieldsH_8C531+18Bj ...
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
MissionRecord_LoadWithDwordFieldsH_8C531	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un bloc typé — famille de 8 fonctions similaires.
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C6ED	proc far		; CODE XREF: VROOMM_StubThunk_6B443J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8C731
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6
		test	si, 1
		jz	short loc_8C72F
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_8C731
; ���������������������������������������������������������������������������

loc_8C72F:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C6ED+23j
		jmp	short $+2

loc_8C731:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C6ED+Fj
					; MissionRecordField_ReleaseSingleB_8C6ED+40j
		pop	si
		leave
		retf
MissionRecordField_ReleaseSingleB_8C6ED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingleB_8C6ED.
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C734	proc far		; CODE XREF: VROOMM_StubThunk_6B43EJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0

loc_8C743:
		jz	short loc_8C778
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6

loc_8C753:
		test	si, 1
		jz	short loc_8C776
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_8C778
; ���������������������������������������������������������������������������

loc_8C776:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C734+23j
		jmp	short $+2

loc_8C778:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C734:loc_8C743j
					; MissionRecordField_ReleaseSingleB_8C734+40j
		pop	si

locret_8C779:
		leave
		retf
MissionRecordField_ReleaseSingleB_8C734	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingleB_8C6ED.
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C77B	proc far		; CODE XREF: VROOMM_StubThunk_6B439J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_8C77C:
		mov	bp, sp
		sub	sp, 4
		push	si

loc_8C782:
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8C7BF
		push	0

loc_8C78E:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6
		test	si, 1
		jz	short loc_8C7BD
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]

loc_8C7AF:
		push	ax
		push	5C44h

loc_8C7B3:
		call	Memory_TypedFree_5C7B6

loc_8C7B8:
		add	sp, 8
		jmp	short loc_8C7BF
; ���������������������������������������������������������������������������

loc_8C7BD:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C77B+23j
		jmp	short $+2

loc_8C7BF:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C77B+Fj
					; MissionRecordField_ReleaseSingleB_8C77B+40j
		pop	si
		leave
		retf
MissionRecordField_ReleaseSingleB_8C77B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingleB_8C6ED.
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C7C2	proc far		; CODE XREF: VROOMM_StubThunk_6B434J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8C806
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6
		test	si, 1
		jz	short loc_8C804
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_8C806
; ���������������������������������������������������������������������������

loc_8C804:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C7C2+23j
		jmp	short $+2

loc_8C806:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C7C2+Fj
					; MissionRecordField_ReleaseSingleB_8C7C2+40j
		pop	si
		leave
		retf
MissionRecordField_ReleaseSingleB_8C7C2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingleB_8C6ED.
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C809	proc far		; CODE XREF: VROOMM_StubThunk_6B42FJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8C84D
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6
		test	si, 1
		jz	short loc_8C84B
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h

loc_8C841:
		call	Memory_TypedFree_5C7B6

loc_8C846:
		add	sp, 8
		jmp	short loc_8C84D
; ���������������������������������������������������������������������������

loc_8C84B:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C809+23j
		jmp	short $+2

loc_8C84D:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C809+Fj
					; MissionRecordField_ReleaseSingleB_8C809+40j
		pop	si
		leave
		retf
MissionRecordField_ReleaseSingleB_8C809	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingleB_8C6ED.
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C850	proc far		; CODE XREF: VROOMM_StubThunk_6B42AJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8C894
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6

loc_8C86F:
		test	si, 1

loc_8C873:
		jz	short loc_8C892
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax

loc_8C87D:
		push	0

loc_8C87F:
		push	2
		lea	ax, [bp+var_4]

loc_8C884:
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_8C894
; ���������������������������������������������������������������������������

loc_8C892:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C850:loc_8C873j
		jmp	short $+2

loc_8C894:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C850+Fj
					; MissionRecordField_ReleaseSingleB_8C850+40j
		pop	si
		leave
		retf
MissionRecordField_ReleaseSingleB_8C850	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingleB_8C6ED.
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C897	proc far		; CODE XREF: VROOMM_StubThunk_6B425J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]

loc_8C8A1:
		cmp	[bp+arg_0], 0
		jz	short loc_8C8DB

loc_8C8A8:
		push	0

loc_8C8AA:
		push	large [bp+arg_0]
		nop
		push	cs

loc_8C8B0:
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6
		test	si, 1
		jz	short loc_8C8D9
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_8C8DB
; ���������������������������������������������������������������������������

loc_8C8D9:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C897+23j
		jmp	short $+2

loc_8C8DB:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C897+Fj
					; MissionRecordField_ReleaseSingleB_8C897+40j
		pop	si
		leave
		retf
MissionRecordField_ReleaseSingleB_8C897	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingleB_8C6ED (dernier de la série).
; ==============================================================================================
MissionRecordField_ReleaseSingleB_8C8DE	proc far		; CODE XREF: VROOMM_StubThunk_6B420J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8C922
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionRecordField_ReleaseDouble_8B170
		add	sp, 6
		test	si, 1
		jz	short loc_8C920
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_8C922
; ���������������������������������������������������������������������������

loc_8C920:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C8DE+23j
		jmp	short $+2

loc_8C922:				; CODE XREF: MissionRecordField_ReleaseSingleB_8C8DE+Fj
					; MissionRecordField_ReleaseSingleB_8C8DE+40j
		pop	si
		leave
		retf
MissionRecordField_ReleaseSingleB_8C8DE	endp

ovr255		ends
