seg108		segment	byte public 'CODE' use16
		assume cs:seg108
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_4ED94:				; DATA XREF: seg339:off_703A2o
		push	bp

loc_4ED95:				; DATA XREF: seg216:0426o
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	dword ptr [bp+6], 0
		jnz	short loc_4EDCC
		push	1
		push	0
		push	2
		push	large 0B5h ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp+8],	dx
		mov	[bp+6],	ax
		or	ax, dx
		jnz	short loc_4EDCC
		jmp	loc_4EEC8
; ���������������������������������������������������������������������������

loc_4EDCC:				; CODE XREF: seg108:0016j seg108:0037j
		les	bx, [bp+6]
		mov	word ptr es:[bx], 155Ch
		push	word ptr [bp+8]
		push	bx
		call	Descriptor_Reset
		add	sp, 4
		les	bx, [bp+6]
		mov	word ptr es:[bx], 183Ah
		mov	dword ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+0Fh], 2
		mov	byte ptr es:[bx+10h], 0
		mov	dword ptr es:[bx+11h], 0
		mov	dword ptr es:[bx+17h], 0
		mov	byte ptr es:[bx+1Bh], 2
		mov	byte ptr es:[bx+1Ch], 0
		mov	dword ptr es:[bx+1Dh], 0
		mov	word ptr es:[bx+21h], 11E8h
		mov	word ptr es:[bx+21h], 1836h
		mov	ax, [bp+6]
		add	ax, 2Dh	; '-'
		push	word ptr [bp+8]
		push	ax
		call	Calibration_ComputeHelper_56CE5
		add	sp, 4
		mov	ax, [bp+6]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+8]
		push	ax
		call	Calibration_ComputeHelper_56CE5
		add	sp, 4
		les	bx, [bp+6]
		xor	ax, ax
		mov	es:[bx+8Fh], ax
		mov	es:[bx+8Dh], ax
		xor	ax, ax
		mov	es:[bx+93h], ax
		mov	es:[bx+91h], ax
		xor	ax, ax
		mov	es:[bx+15h], ax
		mov	es:[bx+9], ax
		or	byte ptr es:[bx+9Fh], 1
		mov	word ptr es:[bx], 32BEh
		mov	ax, [bp+6]
		add	ax, 0A0h ; '�'
		mov	ax, [bp+6]
		add	ax, 0A4h ; '�'
		mov	ax, [bp+6]
		add	ax, 0A8h ; '�'
		mov	ax, [bp+6]
		add	ax, 0ADh ; '�'
		mov	ax, [bp+6]
		add	ax, 0B1h ; '�'
		and	byte ptr es:[bx+9Fh], 0FEh
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-4]
		mov	es:[bx+0A0h], eax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	es:[bx+0A4h], eax

loc_4EEC8:				; CODE XREF: seg108:0039j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		leave
		retf
; ���������������������������������������������������������������������������

loc_4EED0:				; DATA XREF: seg339:off_7039Ao
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4EF18
		les	bx, [bp+6]
		mov	word ptr es:[bx], 32EAh
		push	0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6BB50
		add	sp, 6
		test	si, 1
		jz	short loc_4EF18
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4EF18:				; CODE XREF: seg108:014Fj seg108:016Bj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4EF1B:				; DATA XREF: seg339:2518o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4EF63
		les	bx, [bp+6]
		mov	word ptr es:[bx], 2518h
		push	0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_4EF63
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4EF63:				; CODE XREF: seg108:019Aj seg108:01B6j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4EF66:				; DATA XREF: seg339:off_6F5D0o
		push	bp
		mov	bp, sp
		mov	al, 0Eh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4EF6D:				; DATA XREF: seg339:off_6F5D8o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4EF74:				; DATA XREF: seg339:off_70386o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,212L — compare 5 valeurs cachées à des offsets élevés (+0xA0/0xA4/0xA8/0xAD/0xB1) selon
; un mode sélectionné (+0xAC) : détection de changement d'état sur un groupe de 5 paramètres
; de configuration/calibration surveillés.
; ==============================================================================================
Config_DetectMultiParamChange	proc far		; CODE XREF: seg108:04E1p

var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 36h
		mov	cx, [bp+arg_4]
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0A8h ; '�'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0ADh ; '�'
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0B1h ; '�'
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0A4h ; '�'
		mov	word ptr [bp+var_20+2],	ax
		mov	word ptr [bp+var_20], dx
		les	bx, [bp+var_20]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0A0h ; '�'
		mov	word ptr [bp+var_28+2],	ax
		mov	word ptr [bp+var_28], dx
		les	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_24], eax
		les	bx, [bp+arg_0]
		cmp	es:[bx+0ACh], cl
		jz	short loc_4F018
		jmp	loc_4F0C1
; ���������������������������������������������������������������������������

loc_4F018:				; CODE XREF: Config_DetectMultiParamChange+98j
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jz	short loc_4F027
		mov	ax, 1
		jmp	short loc_4F029
; ���������������������������������������������������������������������������

loc_4F027:				; CODE XREF: Config_DetectMultiParamChange+A5j
		xor	ax, ax

loc_4F029:				; CODE XREF: Config_DetectMultiParamChange+AAj
		or	al, al
		jnz	short loc_4F030
		jmp	loc_4F112
; ���������������������������������������������������������������������������

loc_4F030:				; CODE XREF: Config_DetectMultiParamChange+B0j
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jge	short loc_4F03F
		mov	ax, 1
		jmp	short loc_4F041
; ���������������������������������������������������������������������������

loc_4F03F:				; CODE XREF: Config_DetectMultiParamChange+BDj
		xor	ax, ax

loc_4F041:				; CODE XREF: Config_DetectMultiParamChange+C2j
		or	al, al
		jz	short loc_4F064
		mov	eax, [bp+var_14]
		add	[bp+var_4], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jle	short loc_4F05C
		mov	ax, 1
		jmp	short loc_4F05E
; ���������������������������������������������������������������������������

loc_4F05C:				; CODE XREF: Config_DetectMultiParamChange+DAj
		xor	ax, ax

loc_4F05E:				; CODE XREF: Config_DetectMultiParamChange+DFj
		or	al, al
		jz	short loc_4F089
		jmp	short loc_4F081
; ���������������������������������������������������������������������������

loc_4F064:				; CODE XREF: Config_DetectMultiParamChange+C8j
		mov	eax, [bp+var_14]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jge	short loc_4F07B
		mov	ax, 1
		jmp	short loc_4F07D
; ���������������������������������������������������������������������������

loc_4F07B:				; CODE XREF: Config_DetectMultiParamChange+F9j
		xor	ax, ax

loc_4F07D:				; CODE XREF: Config_DetectMultiParamChange+FEj
		or	al, al
		jz	short loc_4F089

loc_4F081:				; CODE XREF: Config_DetectMultiParamChange+E7j
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax

loc_4F089:				; CODE XREF: Config_DetectMultiParamChange+E5j
					; Config_DetectMultiParamChange+104j
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_14]
		jg	short loc_4F098
		mov	ax, 1
		jmp	short loc_4F09A
; ���������������������������������������������������������������������������

loc_4F098:				; CODE XREF: Config_DetectMultiParamChange+116j
		xor	ax, ax

loc_4F09A:				; CODE XREF: Config_DetectMultiParamChange+11Bj
		or	al, al
		jz	short loc_4F0B6
		cmp	cl, 5
		jg	short loc_4F0B6
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+9Fh], 0FEh
		jmp	short loc_4F112
; ���������������������������������������������������������������������������

loc_4F0B6:				; CODE XREF: Config_DetectMultiParamChange+121j
					; Config_DetectMultiParamChange+126j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+9Fh], 1
		jmp	short loc_4F112
; ���������������������������������������������������������������������������

loc_4F0C1:				; CODE XREF: Config_DetectMultiParamChange+9Aj
		les	bx, [bp+arg_0]
		mov	es:[bx+0ACh], cl
		cmp	cl, 5
		jg	short loc_4F0D8
		mov	eax, [bp+var_14]
		mov	[bp+var_C], eax
		jmp	short loc_4F112
; ���������������������������������������������������������������������������

loc_4F0D8:				; CODE XREF: Config_DetectMultiParamChange+151j
		mov	al, cl
		cbw
		add	ax, 0FFFAh
		mov	[bp+var_2A], ax
		movsx	eax, [bp+var_2A]
		shl	eax, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_24]
		add	[bp+var_C], eax

loc_4F112:				; CODE XREF: Config_DetectMultiParamChange+B2j
					; Config_DetectMultiParamChange+139j ...
		mov	eax, [bp+var_4]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		les	bx, [bp+arg_0]
		mov	es:[bx+0A8h], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	es:[bx+0ADh], eax
		leave
		retf
Config_DetectMultiParamChange	endp

; ���������������������������������������������������������������������������

loc_4F13B:				; DATA XREF: seg339:32BEo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	0
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		mov	al, es:[bx+16h]
		push	ax
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		xor	dx, dx
		jmp	short loc_4F19F
; ���������������������������������������������������������������������������

loc_4F17B:				; CODE XREF: seg108:0416j
		les	bx, [bp-4]
		cmp	dword ptr es:[bx+4], 0FFFFFFFEh
		jg	short loc_4F19A
		les	bx, [bp+6]
		mov	eax, es:[bx+0A8h]
		neg	eax
		les	bx, [bp-4]
		mov	es:[bx+4], eax

loc_4F19A:				; CODE XREF: seg108:03F4j
		inc	dx
		add	word ptr [bp-4], 18h

loc_4F19F:				; CODE XREF: seg108:03E9j
		les	bx, [bp+6]
		cmp	es:[bx+9], dx
		jg	short loc_4F17B
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	bx
		call	Damage_SimulationTick
		add	sp, 6
		leave
		retf
; ���������������������������������������������������������������������������

loc_4F1B9:				; DATA XREF: seg339:off_70392o
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4F1C0:				; DATA XREF: seg339:off_70396o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4F208
		les	bx, [bp+6]
		mov	word ptr es:[bx], 32BEh
		push	0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6BB5A
		add	sp, 6
		test	si, 1
		jz	short loc_4F208
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4F208:				; CODE XREF: seg108:043Fj seg108:045Bj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,10L — accesseur identité trivial.
; ==============================================================================================
Config_IdentityAccessor	proc far		; CODE XREF: PlayerComponent_SubHelperAJ_A6C4A+3EP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Config_IdentityAccessor	endp

; ���������������������������������������������������������������������������

loc_4F213:				; DATA XREF: seg339:off_702F2o
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_4F277
		cmp	word ptr [si+24h], 0
		jz	short loc_4F277
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_4F277
		mov	bx, [si+24h]
		mov	ax, [bx+55h]
		or	ax, [bx+57h]
		jz	short loc_4F257
		push	large dword ptr	[bx+55h]
		les	bx, [bx+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_4F25B
; ���������������������������������������������������������������������������

loc_4F257:				; CODE XREF: seg108:04B3j
		xor	dx, dx
		xor	ax, ax

loc_4F25B:				; CODE XREF: seg108:04C5j
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		les	bx, [bp-4]
		mov	al, es:[bx+1Eh]
		mov	[bp-6],	al
		push	ax
		push	large dword ptr	[si+0Ah]
		push	cs
		call	near ptr Config_DetectMultiParamChange
		add	sp, 6

loc_4F277:				; CODE XREF: seg108:0492j seg108:0498j ...
		push	si
		call	WorldObject_IsAlive_3CBB7
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4F281:				; DATA XREF: seg339:off_70316o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 0Eh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4F28B:				; DATA XREF: seg339:off_702FAo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_4F2B6
		mov	word ptr [si], 3232h
		push	0
		push	si
		call	WorldObject_BaseDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_4F2B6
		push	si

loc_4F2B0:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_4F2B6:				; CODE XREF: seg108:0508j seg108:051Dj
		pop	di
		pop	si
		pop	bp
		retf
seg108		ends
