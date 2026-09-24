seg030		segment	byte public 'CODE' use16
		assume cs:seg030
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,34L — divise par 2 un facteur de zoom (+0x1F) avec borne minimale (+0x1D/8), recalcule
; l'échelle finale (dword_70489) : zoom arrière (dézoom) de la carte/radar.
; ==============================================================================================
Radar_ZoomOut	proc far		; CODE XREF: seg030:0110p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		sar	word ptr [si+1Fh], 1
		mov	ax, [si+1Fh]
		mov	dx, [si+1Dh]
		sar	dx, 3
		cmp	ax, dx
		jge	short loc_1CF3F
		mov	ax, [si+1Dh]
		mov	[si+1Fh], ax

loc_1CF3F:				; CODE XREF: Radar_ZoomOut+18j
		movsx	eax, word ptr [si+1Fh]
		mov	[bp+var_4], eax
		mov	eax, dword_70489
		imul	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		sar	eax, 8
		mov	[si+21h], eax
		pop	si
		leave
		retf
Radar_ZoomOut	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — multiplie par 2 le facteur de zoom (+0x1F) avec borne maximale (+0x1D), recalcule
; l'échelle : zoom avant de la carte/radar.
; ==============================================================================================
Radar_ZoomIn	proc far		; CODE XREF: seg030:011Ep

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		shl	word ptr [si+1Fh], 1
		mov	ax, [si+1Fh]
		cmp	ax, [si+1Dh]
		jle	short loc_1CF82
		mov	ax, [si+1Dh]
		sar	ax, 3
		mov	[si+1Fh], ax

loc_1CF82:				; CODE XREF: Radar_ZoomIn+13j
		movsx	eax, word ptr [si+1Fh]
		mov	[bp+var_4], eax
		mov	eax, dword_70489
		imul	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		sar	eax, 8
		mov	[si+21h], eax
		pop	si
		leave
		retf
Radar_ZoomIn	endp

; ���������������������������������������������������������������������������

loc_1CFA7:				; DATA XREF: seg339:0E0Eo
		push	bp
		mov	bp, sp
		sub	sp, 192h
		push	si
		push	di
		mov	di, [bp+6]
		push	ds
		push	offset aRadar	; "RADAR"
		push	di
		call	Widget_GetNestedPropA
		pop	cx
		add	ax, 5Eh	; '^'
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		push	large dword ptr	[bx]
		call	Roster_FindByNameAndFlag

loc_1CFCF:
		add	sp, 8

loc_1CFD2:
		or	al, al
		jz	short loc_1CFD9

loc_1CFD6:
		jmp	loc_1D925
; ���������������������������������������������������������������������������

loc_1CFD9:				; CODE XREF: seg030:00C4j
		mov	al, byte_722D1
		mov	ah, 0
		mov	[bp-3],	al
		mov	ax, word_722E6
		mov	[bp-6],	ax
		mov	bx, [bp-6]
		les	bx, [bx+5Ah]
		mov	ax, es:[bx+0Dh]
		mov	[bp-8],	ax
		cmp	word ptr [bp-8], 0
		jnz	short loc_1CFFE
		mov	byte ptr [di+1Bh], 0

loc_1CFFE:				; CODE XREF: seg030:00E8j
		mov	byte ptr [bp-9], 0
		mov	al, [bp-3]
		mov	ah, 0
		cmp	ax, 1Ah
		jz	short loc_1D018
		cmp	ax, 1Bh
		jz	short loc_1D026
		cmp	ax, 25h	; '%'
		jz	short loc_1D033
		jmp	short loc_1D078
; ���������������������������������������������������������������������������

loc_1D018:				; CODE XREF: seg030:00FAj
		cmp	byte ptr [di+1Bh], 1
		jz	short loc_1D078
		push	di
		push	cs
		call	near ptr Radar_ZoomOut

loc_1D023:				; CODE XREF: seg030:0121j
		pop	cx
		jmp	short loc_1D074
; ���������������������������������������������������������������������������

loc_1D026:				; CODE XREF: seg030:00FFj
		cmp	byte ptr [di+1Bh], 1
		jz	short loc_1D078
		push	di
		push	cs
		call	near ptr Radar_ZoomIn
		jmp	short loc_1D023
; ���������������������������������������������������������������������������

loc_1D033:				; CODE XREF: seg030:0104j
		cmp	byte ptr [di+1Bh], 0
		jnz	short loc_1D051
		cmp	word ptr [bp-8], 0
		jz	short loc_1D051
		mov	byte ptr [di+1Bh], 1
		mov	dword ptr [bp-0Eh], 0
		mov	eax, [bp-0Eh]
		jmp	short loc_1D068
; ���������������������������������������������������������������������������

loc_1D051:				; CODE XREF: seg030:0127j seg030:012Dj
		mov	byte ptr [di+1Bh], 0
		mov	ax, [di+25h]
		mov	[bp-10h], ax
		movsx	eax, word ptr [bp-10h]
		shl	eax, 8
		mov	[bp-14h], eax

loc_1D068:				; CODE XREF: seg030:013Fj
		mov	[di+0Dh], eax
		mov	eax, [di+0Dh]
		mov	[di+9],	eax

loc_1D074:				; CODE XREF: seg030:0114j
		mov	byte ptr [bp-9], 1

loc_1D078:				; CODE XREF: seg030:0106j seg030:010Cj ...
		cmp	byte ptr [bp-9], 0
		jnz	short loc_1D0AC
		xor	si, si
		mov	eax, dword_70458
		sub	[di+9],	eax
		cmp	dword ptr [di+9], 0
		jg	short loc_1D094
		mov	ax, 1
		jmp	short loc_1D096
; ���������������������������������������������������������������������������

loc_1D094:				; CODE XREF: seg030:017Dj
		xor	ax, ax

loc_1D096:				; CODE XREF: seg030:0182j
		or	ax, ax
		jz	short loc_1D0A5
		mov	eax, [di+0Dh]
		mov	[di+9],	eax
		inc	si
		jmp	short $+2

loc_1D0A5:				; CODE XREF: seg030:0188j
		or	si, si
		jnz	short loc_1D0AC
		jmp	loc_1D925
; ���������������������������������������������������������������������������

loc_1D0AC:				; CODE XREF: seg030:016Cj seg030:0197j
		push	word ptr [bp-6]
		push	ss
		lea	ax, [bp-0A2h]
		push	ax
		mov	bx, [bp-6]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-0C6h]
		push	ax
		push	word ptr [bp-6]
		call	Debris_PositionWidget
		add	sp, 4
		lea	ax, [bp-0D2h]
		push	ax
		push	word ptr [bp-6]
		call	Debris_BodyGetPosition

loc_1D0DD:
		add	sp, 4

loc_1D0E0:
		mov	word ptr [di+0DBh], 0

loc_1D0E6:
		mov	word ptr [bp-16h], 0
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D0EE:				; CODE XREF: seg030:0A12j
		mov	ax, [bp-16h]
		mov	[bp-18h], ax
		push	ax
		mov	bx, [bp-18h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jnz	short loc_1D104
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D104:				; CODE XREF: seg030:01EFj
		push	word ptr [bp-18h]
		mov	bx, [bp-18h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_1D121
		push	word ptr [bp-18h]
		mov	bx, [bp-18h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_1D123
; ���������������������������������������������������������������������������

loc_1D121:				; CODE XREF: seg030:0201j
		mov	al, 17h

loc_1D123:				; CODE XREF: seg030:020Fj
		cmp	al, 6
		jz	short loc_1D12A
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D12A:				; CODE XREF: seg030:0215j
		mov	ax, [bp-18h]
		cmp	ax, [bp-6]
		jnz	short loc_1D135
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D135:				; CODE XREF: seg030:0220j
		cmp	byte ptr [di+1Bh], 1
		jnz	short loc_1D146
		mov	ax, [bp-18h]
		cmp	ax, [bp-8]
		jz	short loc_1D146
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D146:				; CODE XREF: seg030:0229j seg030:0231j
		push	word ptr [bp-18h]
		call	Debris_GetSubpartAttrib
		pop	cx
		or	al, al
		jnz	short loc_1D156
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D156:				; CODE XREF: seg030:0241j
		lea	ax, [bp-0DEh]
		push	ax
		push	word ptr [bp-18h]
		call	Debris_BodyGetPosition
		add	sp, 4
		mov	eax, [bp-0D2h]
		sub	[bp-0DEh], eax
		mov	eax, [bp-0CEh]
		sub	[bp-0DAh], eax
		mov	eax, [bp-0CAh]
		sub	[bp-0D6h], eax
		mov	eax, [bp-0DEh]
		mov	[bp-0EAh], eax
		mov	eax, [bp-0DAh]
		mov	[bp-0E6h], eax
		mov	eax, [bp-0D6h]
		mov	[bp-0E2h], eax
		mov	eax, [bp-0DEh]
		mov	[bp-0F6h], eax
		mov	eax, [bp-0DAh]
		mov	[bp-0F2h], eax
		mov	eax, [bp-0D6h]
		mov	[bp-0EEh], eax
		lea	ax, [bp-0C6h]
		push	ax
		lea	ax, [bp-0F6h]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	eax, [bp-0BAh]

loc_1D1D7:
		mov	[bp-102h], eax

loc_1D1DC:
		mov	eax, [bp-0B6h]

loc_1D1E1:
		mov	[bp-0FEh], eax
		mov	dword ptr [bp-0FAh], 0
		mov	eax, [bp-0FEh]
		mov	[bp-10Eh], eax
		mov	eax, [bp-102h]
		neg	eax
		mov	[bp-10Ah], eax
		mov	dword ptr [bp-106h], 0
		lea	ax, [bp-102h]
		push	ax
		lea	ax, [bp-10Eh]
		push	ax
		lea	ax, [bp-132h]
		push	ax
		call	Map_ApplyRotationTransform_56DC5
		add	sp, 6
		lea	ax, [bp-132h]
		push	ax
		lea	ax, [bp-0DEh]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		push	large dword ptr	[bp-0D6h]
		push	large dword ptr	[bp-0DAh]
		push	large dword ptr	[bp-0DEh]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-20h], eax
		mov	[bp-24h], eax
		sar	eax, 8
		mov	[bp-1Ch], eax
		cmp	byte ptr [di+1Bh], 1
		jz	short loc_1D26C
		jmp	loc_1D2EE
; ���������������������������������������������������������������������������

loc_1D26C:				; CODE XREF: seg030:0357j
		mov	[bp-2Ch], eax
		shl	eax, 8
		mov	[bp-30h], eax
		mov	eax, [bp-30h]
		mov	edx, eax
		mov	ecx, dword_70489
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-34h], eax
		mov	eax, [bp-34h]
		mov	[bp-38h], eax
		sar	eax, 8
		mov	[bp-28h], eax
		movsx	eax, word ptr [di+1Dh]
		cmp	eax, [bp-28h]
		jg	short loc_1D2B1
		jmp	loc_1D925
; ���������������������������������������������������������������������������

loc_1D2B1:				; CODE XREF: seg030:039Cj
		mov	si, [di+1Dh]
		sar	si, 3
		jmp	short loc_1D2BB
; ���������������������������������������������������������������������������

loc_1D2B9:				; CODE XREF: seg030:03B8j
		shl	si, 1

loc_1D2BB:				; CODE XREF: seg030:03A7j
		mov	ax, si
		add	ax, 0FFFEh
		movsx	eax, ax
		cmp	eax, [bp-28h]
		jl	short loc_1D2B9
		mov	[di+1Fh], si
		movsx	eax, si

loc_1D2D1:
		mov	[bp-3Ch], eax
		mov	eax, dword_70489

loc_1D2D9:
		imul	eax, [bp-3Ch]

loc_1D2DE:
		mov	[bp-40h], eax

loc_1D2E2:
		mov	[bp-44h], eax
		sar	eax, 8
		mov	[di+21h], eax

loc_1D2EE:				; CODE XREF: seg030:0359j
		mov	al, byte_7235B
		mov	ah, 0
		or	ax, ax
		jz	short loc_1D2FA
		jmp	loc_1D671
; ���������������������������������������������������������������������������

loc_1D2FA:				; CODE XREF: seg030:03E5j
		mov	eax, [di+21h]
		cmp	eax, [bp-1Ch]
		jge	short loc_1D307
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D307:				; CODE XREF: seg030:03F2j
		cmp	dword ptr [bp-0DAh], 0
		jg	short loc_1D312
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D312:				; CODE XREF: seg030:03FDj
		mov	dword ptr [bp-2Ch], 0
		mov	dword ptr [bp-28h], 100h
		mov	eax, [bp-0DEh]
		mov	[bp-34h], eax
		mov	eax, [bp-0DAh]
		mov	[bp-30h], eax
		lea	ax, [bp-2Ch]
		push	ax
		lea	ax, [bp-34h]
		push	ax
		push	ss
		lea	ax, [bp-38h]
		push	ax
		call	Map_ComputeBearingToPoint_56304
		add	sp, 8
		mov	si, [bp-37h]
		cmp	[di+29h], si
		jge	short loc_1D354
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D354:				; CODE XREF: seg030:043Fj
		cmp	byte ptr [di+1Bh], 1
		jz	short loc_1D35D
		jmp	loc_1D4F8
; ���������������������������������������������������������������������������

loc_1D35D:				; CODE XREF: seg030:0448j
		lea	ax, [bp-13Eh]
		push	ax
		push	word ptr [bp-8]
		call	Debris_BodyGetPosition
		add	sp, 4
		push	word ptr [bp-8]
		push	ss
		lea	ax, [bp-14Ah]
		push	ax
		mov	bx, [bp-8]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-16Eh]
		push	ax
		push	word ptr [bp-8]
		call	Debris_PositionWidget
		add	sp, 4
		mov	eax, [bp-136h]
		mov	edx, dword_70450
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-7Eh], eax
		mov	eax, [bp-7Eh]
		mov	[bp-7Ah], eax
		sar	eax, 8
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[di+33h], ax
		cmp	word ptr [di+33h], 0
		jge	short loc_1D3CC
		mov	word ptr [di+33h], 0

loc_1D3CC:				; CODE XREF: seg030:04B5j
		lea	ax, [bp-14Ah]
		push	ax
		push	ss
		lea	ax, [bp-82h]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6

loc_1D3DF:
		mov	eax, [bp-82h]
		mov	edx, dword_7048D
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-82h], eax
		mov	ax, [bp-81h]
		mov	[di+37h], ax
		lea	ax, [bp-162h]
		push	ax
		push	ss
		lea	ax, [bp-86h]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	ax, [bp-85h]
		mov	[di+35h], ax
		cmp	word ptr [di+35h], 0
		jge	short loc_1D422
		add	word ptr [di+35h], 168h

loc_1D422:				; CODE XREF: seg030:050Bj
		mov	eax, [bp-0EAh]
		neg	eax
		mov	[bp-186h], eax
		mov	eax, [bp-0E6h]
		neg	eax
		mov	[bp-182h], eax
		mov	eax, [bp-0E2h]
		neg	eax
		mov	[bp-17Eh], eax
		mov	eax, [bp-186h]
		mov	[bp-17Ah], eax
		mov	eax, [bp-182h]
		mov	[bp-176h], eax
		mov	eax, [bp-17Eh]
		mov	[bp-172h], eax
		mov	eax, [bp-14Ah]
		mov	[bp-192h], eax
		mov	eax, [bp-146h]
		mov	[bp-18Eh], eax
		mov	eax, [bp-142h]
		mov	[bp-18Ah], eax
		lea	ax, [bp-192h]
		push	ax
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-8Ah]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp-89h]
		mov	[di+39h], ax
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-90h]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	ax, [bp-8Fh]
		mov	[bp-8Ch], ax
		lea	ax, [bp-192h]
		push	ax
		push	ss
		lea	ax, [bp-96h]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	ax, [bp-95h]
		mov	[bp-92h], ax
		mov	bx, [bp-92h]
		sub	bx, [bp-8Ch]
		or	bx, bx
		jge	short loc_1D4EA
		add	bx, 168h

loc_1D4EA:				; CODE XREF: seg030:05D4j
		cmp	bx, 0B4h ; '�'
		jge	short loc_1D4F8
		mov	ax, [di+39h]

loc_1D4F3:
		neg	ax

loc_1D4F5:
		mov	[di+39h], ax

loc_1D4F8:				; CODE XREF: seg030:044Aj seg030:05DEj
		mov	bx, [di+4]

loc_1D4FB:
		mov	ax, [bx+3Fh]

loc_1D4FE:
		sub	ax, [bx+3Bh]
		inc	ax

loc_1D502:
		sar	ax, 1

loc_1D504:
		mov	dx, [bx+3Bh]

loc_1D507:
		add	dx, ax
		mov	[bp-3Ch], dx
		mov	ax, [bx+41h]
		mov	[bp-3Ah], ax
		mov	ax, [di+0DBh]
		shl	ax, 3
		mov	dx, di
		add	dx, ax
		add	dx, 3Bh	; ';'
		mov	[bp-3Eh], dx
		mov	ax, [di+27h]
		shl	ax, 1
		mov	dx, [bx+3Fh]
		sub	dx, [bx+3Bh]
		inc	dx
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	[bp-44h], ax
		movsx	eax, word ptr [bp-44h]
		shl	eax, 8
		mov	[bp-42h], eax
		cmp	dword ptr [bp-0DEh], 0
		jg	short loc_1D553
		neg	eax
		mov	[bp-42h], eax

loc_1D553:				; CODE XREF: seg030:063Aj
		mov	ax, [bp-3Ch]
		mov	[bp-46h], ax
		mov	[bp-48h], si
		movsx	eax, word ptr [bp-48h]
		shl	eax, 8
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]
		mov	edx, eax
		mov	ecx, [bp-42h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-50h], eax
		mov	eax, [bp-50h]
		mov	[bp-54h], eax
		movsx	eax, word ptr [bp-46h]
		shl	eax, 8
		mov	edx, [bp-54h]
		add	edx, eax
		mov	[bp-58h], edx
		mov	eax, [bp-58h]
		mov	[bp-5Ch], eax
		mov	ax, [bp-5Bh]
		mov	bx, [bp-3Eh]
		mov	[bx], ax
		mov	bx, [di+4]
		mov	ax, [bx+41h]
		sub	ax, [bx+3Dh]
		inc	ax
		movsx	ebx, ax
		mov	eax, [di+21h]
		cdq
		idiv	ebx
		mov	[bp-64h], eax
		shl	eax, 8

loc_1D5CE:
		mov	[bp-60h], eax

loc_1D5D2:
		mov	ax, [bp-3Ah]

loc_1D5D5:
		mov	[bp-66h], ax

loc_1D5D8:
		mov	eax, [bp-0DAh]

loc_1D5DD:
		mov	edx, eax
		mov	ecx, [bp-60h]

loc_1D5E4:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-6Ah], eax
		mov	eax, [bp-6Ah]

loc_1D5F7:
		mov	[bp-6Eh], eax

loc_1D5FB:
		movsx	eax, word ptr [bp-66h]
		shl	eax, 8
		sub	eax, [bp-6Eh]
		mov	[bp-72h], eax
		mov	[bp-76h], eax
		mov	ax, [bp-75h]
		mov	bx, [bp-3Eh]
		mov	[bx+2],	ax
		mov	ax, [bp-18h]
		cmp	ax, [bp-8]
		jnz	short loc_1D626
		mov	ax, 1
		jmp	short loc_1D628
; ���������������������������������������������������������������������������

loc_1D626:				; CODE XREF: seg030:070Fj
		xor	ax, ax

loc_1D628:				; CODE XREF: seg030:0714j
		mov	bx, [bp-3Eh]
		mov	[bx+4],	al
		mov	bx, [bp-18h]
		mov	al, [bx+50h]
		cbw
		mov	bx, [bp-3Eh]
		mov	[bx+5],	ax
		push	word ptr [bp-18h]
		mov	bx, [bp-18h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_1D64E
		jmp	loc_1D90B
; ���������������������������������������������������������������������������

loc_1D64E:				; CODE XREF: seg030:0739j
		mov	bx, [bp-18h]
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	bx, [bp-3Eh]
		jmp	loc_1D908
; ���������������������������������������������������������������������������
		jmp	loc_1D90B
; ���������������������������������������������������������������������������

loc_1D671:				; CODE XREF: seg030:03E7j
		mov	eax, [di+21h]
		cmp	eax, [bp-1Ch]
		jge	short loc_1D67E
		jmp	loc_1D90F
; ���������������������������������������������������������������������������

loc_1D67E:				; CODE XREF: seg030:0769j
		cmp	byte ptr [di+1Bh], 1
		jz	short loc_1D687
		jmp	loc_1D7A8
; ���������������������������������������������������������������������������

loc_1D687:				; CODE XREF: seg030:0772j
		lea	ax, [bp-13Eh]
		push	ax
		push	word ptr [bp-8]
		call	Debris_BodyGetPosition
		add	sp, 4
		push	word ptr [bp-8]
		push	ss
		lea	ax, [bp-14Ah]
		push	ax
		mov	bx, [bp-8]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-16Eh]
		push	ax
		push	word ptr [bp-8]
		call	Debris_PositionWidget
		add	sp, 4
		mov	eax, [bp-136h]
		mov	edx, dword_70450
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-2Ch], eax

loc_1D6D1:
		mov	eax, [bp-2Ch]
		mov	[bp-28h], eax
		sar	eax, 8
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[di+33h], ax
		cmp	word ptr [di+33h], 0
		jge	short loc_1D6F6

loc_1D6F1:
		mov	word ptr [di+33h], 0

loc_1D6F6:				; CODE XREF: seg030:07DFj
		lea	ax, [bp-14Ah]
		push	ax
		push	ss

loc_1D6FC:
		lea	ax, [bp-30h]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	eax, [bp-30h]
		mov	edx, dword_7048D
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-30h], eax
		mov	ax, [bp-2Fh]
		mov	[di+37h], ax
		lea	ax, [bp-162h]
		push	ax
		push	ss
		lea	ax, [bp-34h]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	ax, [bp-33h]
		mov	[di+35h], ax
		cmp	word ptr [di+35h], 0
		jge	short loc_1D746
		add	word ptr [di+35h], 168h

loc_1D746:				; CODE XREF: seg030:082Fj
		mov	eax, [bp-14Ah]
		neg	eax
		mov	[bp-17Ah], eax
		mov	eax, [bp-146h]
		neg	eax
		mov	[bp-176h], eax
		mov	eax, [bp-142h]
		neg	eax
		mov	[bp-172h], eax
		mov	eax, [bp-17Ah]
		mov	[bp-186h], eax
		mov	eax, [bp-176h]
		mov	[bp-182h], eax
		mov	eax, [bp-172h]
		mov	[bp-17Eh], eax
		lea	ax, [bp-186h]
		push	ax
		lea	ax, [bp-0F6h]
		push	ax
		push	ss
		lea	ax, [bp-38h]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp-37h]
		mov	[di+39h], ax

loc_1D7A8:				; CODE XREF: seg030:0774j
		mov	bx, [di+4]
		mov	ax, [bx+3Fh]
		sub	ax, [bx+3Bh]
		inc	ax
		sar	ax, 1
		mov	dx, [bx+3Bh]
		add	dx, ax
		mov	[bp-28h], dx
		mov	ax, [bx+41h]
		sub	ax, [bx+3Dh]
		inc	ax
		sar	ax, 1
		mov	dx, [bx+3Dh]
		add	dx, ax
		mov	[bp-26h], dx
		mov	ax, [di+0DBh]

loc_1D7D1:
		shl	ax, 3
		mov	dx, di
		add	dx, ax
		add	dx, 3Bh	; ';'
		mov	[bp-2Ah], dx
		mov	ax, [bx+3Fh]

loc_1D7E1:
		sub	ax, [bx+3Bh]

loc_1D7E4:
		inc	ax
		sar	ax, 1
		movsx	ebx, ax
		mov	eax, [di+21h]
		cdq
		idiv	ebx
		mov	[bp-32h], eax

loc_1D7F8:
		shl	eax, 8
		mov	[bp-2Eh], eax
		mov	ax, [bp-28h]
		mov	[bp-34h], ax
		mov	eax, [bp-0DEh]
		mov	edx, eax
		mov	ecx, [bp-2Eh]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-38h], eax
		mov	eax, [bp-38h]
		mov	[bp-3Ch], eax
		movsx	eax, word ptr [bp-34h]
		shl	eax, 8
		mov	edx, [bp-3Ch]
		add	edx, eax
		mov	[bp-40h], edx
		mov	eax, [bp-40h]
		mov	[bp-44h], eax
		mov	ax, [bp-43h]
		mov	bx, [bp-2Ah]
		mov	[bx], ax
		mov	bx, [di+4]
		mov	ax, [bx+41h]
		sub	ax, [bx+3Dh]
		inc	ax
		sar	ax, 1
		movsx	ebx, ax
		mov	eax, [di+21h]
		cdq
		idiv	ebx
		mov	[bp-4Ch], eax
		shl	eax, 8
		mov	[bp-48h], eax
		mov	ax, [bp-26h]
		mov	[bp-4Eh], ax
		mov	eax, [bp-0DAh]
		mov	edx, eax
		mov	ecx, [bp-48h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-52h], eax
		mov	eax, [bp-52h]
		mov	[bp-56h], eax
		movsx	eax, word ptr [bp-4Eh]
		shl	eax, 8
		sub	eax, [bp-56h]
		mov	[bp-5Ah], eax
		mov	[bp-5Eh], eax
		mov	ax, [bp-5Dh]
		mov	bx, [bp-2Ah]
		mov	[bx+2],	ax
		mov	ax, [bp-18h]
		cmp	ax, [bp-8]
		jnz	short loc_1D8C6
		mov	ax, 1
		jmp	short loc_1D8C8
; ���������������������������������������������������������������������������

loc_1D8C6:				; CODE XREF: seg030:09AFj
		xor	ax, ax

loc_1D8C8:				; CODE XREF: seg030:09B4j
		mov	bx, [bp-2Ah]
		mov	[bx+4],	al
		mov	bx, [bp-18h]
		mov	al, [bx+50h]

loc_1D8D4:
		cbw

loc_1D8D5:
		mov	bx, [bp-2Ah]

loc_1D8D8:
		mov	[bx+5],	ax
		push	word ptr [bp-18h]

loc_1D8DE:
		mov	bx, [bp-18h]
		mov	bx, [bx]

loc_1D8E3:
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_1D90B
		mov	bx, [bp-18h]
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]

loc_1D8F4:
		mov	bx, [bx]

loc_1D8F6:
		call	dword ptr [bx+48h]
		pop	cx

loc_1D8FA:
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5

loc_1D902:
		and	ax, 1

loc_1D905:
		mov	bx, [bp-2Ah]

loc_1D908:				; CODE XREF: seg030:075Bj
		mov	[bx+7],	al

loc_1D90B:				; CODE XREF: seg030:073Bj seg030:075Ej ...
		inc	word ptr [di+0DBh]

loc_1D90F:				; CODE XREF: seg030:01DBj seg030:01F1j ...
		lea	ax, [bp-16h]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_1D925
		jmp	loc_1D0EE
; ���������������������������������������������������������������������������

loc_1D925:				; CODE XREF: seg030:loc_1CFD6j
					; seg030:0199j	...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1D929:				; DATA XREF: seg339:0E12o
		push	bp
		mov	bp, sp
		sub	sp, 114h
		push	si
		push	di
		mov	si, [bp+6]
		push	ds
		push	offset aRadar_0	; "RADAR"
		push	si
		call	Widget_GetNestedPropA
		pop	cx
		add	ax, 5Eh	; '^'
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		push	large dword ptr	[bx]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jnz	short loc_1D95B
		jmp	loc_1DA85
; ���������������������������������������������������������������������������

loc_1D95B:				; CODE XREF: seg030:0A46j
		mov	di, [si+4]
		add	di, 2
		mov	cx, [di+8]
		sub	cx, [di+4]
		inc	cx
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		mov	[bp-4],	ax
		mov	ax, [di+4]
		mov	[bp-6],	ax
		mov	ax, [di+6]
		mov	[bp-8],	ax
		mov	bx, [si+4]
		mov	al, [bx+47h]
		mov	ah, 0
		mov	[bp-0Ah], ax
		mov	ax, cx
		sar	ax, 2
		mov	dx, cx
		sub	dx, ax
		mov	[bp-0Ch], dx
		mov	ax, [bp-4]
		sar	ax, 2
		mov	dx, [bp-4]
		sub	dx, ax
		mov	[bp-0Eh], dx
		mov	ax, [bp-0Ch]
		sar	ax, 2
		mov	dx, [bp-6]
		add	dx, ax
		mov	[bp-10h], dx
		mov	ax, [bp-0Eh]
		sar	ax, 2
		mov	dx, [bp-8]
		add	dx, ax
		mov	[bp-12h], dx
		mov	word ptr [bp-14h], 0
		jmp	short loc_1D9FA
; ���������������������������������������������������������������������������

loc_1D9C6:				; CODE XREF: seg030:0AEEj
		mov	ax, [bp-0Ch]
		call	Math_RandomScale_54DF4
		mov	[bp-20h], ax
		mov	ax, [bp-0Eh]
		call	Math_RandomScale_54DF4
		mov	[bp-22h], ax
		mov	al, [bp-0Ah]
		push	ax
		mov	ax, [bp-12h]
		add	ax, [bp-22h]
		push	ax
		mov	ax, [bp-10h]
		add	ax, [bp-20h]
		push	ax
		push	di

loc_1D9EF:
		call	Render_SetPixelClipped_61B58
		add	sp, 8

loc_1D9F7:
		inc	word ptr [bp-14h]

loc_1D9FA:				; CODE XREF: seg030:0AB4j
		cmp	word ptr [bp-14h], 7
		jl	short loc_1D9C6
		mov	eax, dword_70458
		imul	eax, 38h
		mov	[bp-18h], eax
		mov	[bp-1Ch], eax
		mov	ax, [bp-1Bh]
		add	word_6DEDE, ax
		mov	ax, [bp-4]
		add	ax, 4
		cmp	ax, word_6DEDE
		jge	short loc_1DA2D
		mov	ax, [bp-4]
		add	ax, 4
		sub	word_6DEDE, ax

loc_1DA2D:				; CODE XREF: seg030:0B11j
		mov	word ptr [bp-1Eh], 0Ch
		mov	bx, [si+4]
		mov	al, [bx+46h]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	bx, [si+4]
		mov	al, [bx+45h]
		push	ax
		push	bx
		call	Widget_Method_DispatchC_60861
		add	sp, 4
		push	word_6DEDE
		push	word ptr [bp-1Eh]
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		mov	al, byte_7235B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1DA7F
		push	ds
		push	offset aAir	; "AIR"

loc_1DA71:				; CODE XREF: seg030:0B73j
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		jmp	loc_1E203
; ���������������������������������������������������������������������������

loc_1DA7F:				; CODE XREF: seg030:0B5Bj
		push	ds
		push	offset aAir360	; "AIR 360"
		jmp	short loc_1DA71
; ���������������������������������������������������������������������������

loc_1DA85:				; CODE XREF: seg030:0A48j
		mov	ax, [si+4]
		add	ax, 2
		mov	[bp-4],	ax
		mov	al, byte_7235B
		mov	ah, 0
		or	ax, ax
		jz	short loc_1DA9A
		jmp	loc_1DF2B
; ���������������������������������������������������������������������������

loc_1DA9A:				; CODE XREF: seg030:0B85j
		push	si
		call	Widget_GetNestedPropB
		pop	cx
		mov	cx, ax
		mov	di, cx
		add	di, 78h	; 'x'
		mov	ax, [di]
		mov	[bp-0Ah], ax
		mov	ax, [di+2]
		mov	[bp-8],	ax
		mov	di, cx
		add	di, 7Ch	; '|'
		mov	ax, [di]
		mov	[bp-0Eh], ax
		mov	ax, [di+2]
		mov	[bp-0Ch], ax
		mov	bx, [si+4]
		mov	ax, [bx+3Fh]
		sub	ax, [bx+3Bh]
		inc	ax
		sar	ax, 1
		mov	dx, [bx+3Bh]
		add	dx, ax
		mov	[bp-12h], dx
		mov	ax, [bx+41h]
		sub	ax, [bx+3Dh]
		inc	ax
		sar	ax, 1
		mov	dx, [bx+3Dh]

loc_1DAE3:
		add	dx, ax
		mov	[bp-10h], dx
		mov	ax, [bx+3Bh]
		mov	[bp-16h], ax
		mov	ax, [bx+3Dh]

loc_1DAF1:
		mov	[bp-14h], ax
		push	large 30000h
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large dword ptr	[bp-16h]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	ax, [bp-12h]
		sub	[bp-0Ah], ax
		mov	ax, [bp-10h]
		sub	[bp-8],	ax
		mov	ax, [bp-12h]
		sub	[bp-0Eh], ax
		mov	ax, [bp-10h]
		sub	[bp-0Ch], ax
		mov	ax, [bp-0Eh]
		mov	[bp-20h], ax
		movsx	eax, word ptr [bp-20h]
		shl	eax, 8
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		mov	[bp-1Eh], eax
		mov	ax, [bp-0Ah]
		mov	[bp-26h], ax
		movsx	eax, word ptr [bp-26h]
		shl	eax, 8
		sub	[bp-1Eh], eax
		mov	ax, [bp-0Ch]
		mov	[bp-28h], ax
		movsx	eax, word ptr [bp-28h]
		shl	eax, 8
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		mov	[bp-1Ah], eax
		mov	ax, [bp-8]
		mov	[bp-2Eh], ax
		movsx	eax, word ptr [bp-2Eh]
		shl	eax, 8
		sub	[bp-1Ah], eax
		lea	ax, [bp-1Eh]
		push	ax
		call	Weapon_ComputeVectorLength_561AF
		pop	cx
		mov	eax, [bp-1Ah]
		mov	[bp-36h], eax
		mov	eax, [bp-1Eh]
		neg	eax
		mov	[bp-32h], eax
		mov	bx, [si+4]
		mov	ax, [bx+3Fh]
		sub	ax, [bx+3Bh]
		inc	ax
		mov	[bp-3Ch], ax
		movsx	eax, word ptr [bp-3Ch]
		shl	eax, 8
		mov	[bp-3Ah], eax
		mov	[bp-40h], eax
		mov	ebx, 7

loc_1DBD3:
		cdq

loc_1DBD5:
		idiv	ebx
		mov	[bp-40h], eax

loc_1DBDC:
		mov	eax, [bp-3Ah]

loc_1DBE0:
		mov	[bp-44h], eax

loc_1DBE4:
		imul	eax, 3
		mov	[bp-44h], eax
		sar	eax, 3

loc_1DBF0:
		mov	[bp-44h], eax
		mov	eax, [bp-1Eh]
		mov	[bp-4Ch], eax
		mov	eax, [bp-1Ah]
		mov	[bp-48h], eax

loc_1DC04:
		mov	eax, [bp-4Ch]
		mov	edx, [bp-40h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4Ch], eax
		mov	eax, [bp-48h]
		mov	edx, [bp-40h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-48h], eax
		mov	eax, [bp-4Ch]
		mov	[bp-54h], eax
		mov	eax, [bp-48h]
		mov	[bp-50h], eax
		mov	ax, [bp-12h]
		mov	[bp-5Ah], ax
		movsx	eax, word ptr [bp-5Ah]
		shl	eax, 8
		sub	eax, [bp-4Ch]
		mov	[bp-5Eh], eax
		mov	[bp-62h], eax
		mov	ax, [bp-61h]
		mov	[bp-58h], ax
		mov	ax, [bp-10h]
		mov	[bp-64h], ax
		movsx	eax, word ptr [bp-64h]
		shl	eax, 8
		sub	eax, [bp-48h]
		mov	[bp-68h], eax
		mov	[bp-6Ch], eax
		mov	ax, [bp-6Bh]
		mov	[bp-56h], ax
		mov	ax, [bp-12h]
		mov	[bp-72h], ax
		movsx	eax, word ptr [bp-72h]
		shl	eax, 8
		mov	edx, [bp-4Ch]
		add	edx, eax
		mov	[bp-76h], edx
		mov	eax, [bp-76h]
		mov	[bp-7Ah], eax
		mov	ax, [bp-79h]
		mov	[bp-70h], ax
		mov	ax, [bp-10h]
		mov	[bp-7Ch], ax
		movsx	eax, word ptr [bp-7Ch]
		shl	eax, 8
		mov	edx, [bp-48h]
		add	edx, eax
		mov	[bp-80h], edx
		mov	eax, [bp-80h]
		mov	[bp-84h], eax
		mov	ax, [bp-83h]
		mov	[bp-6Eh], ax
		mov	eax, [bp-1Eh]

loc_1DCD4:
		mov	[bp-4Ch], eax
		mov	eax, [bp-1Ah]

loc_1DCDC:
		mov	[bp-48h], eax
		mov	eax, [bp-4Ch]
		mov	edx, [bp-44h]
		imul	edx
		shrd	eax, edx, 8

loc_1DCF0:
		mov	[bp-4Ch], eax
		mov	eax, [bp-48h]

loc_1DCF8:
		mov	edx, [bp-44h]

loc_1DCFC:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-48h], eax
		mov	eax, [bp-4Ch]
		mov	[bp-8Ch], eax
		mov	eax, [bp-48h]
		mov	[bp-88h], eax
		mov	ax, [bp-12h]
		mov	[bp-92h], ax
		movsx	eax, word ptr [bp-92h]
		shl	eax, 8
		sub	eax, [bp-4Ch]
		mov	[bp-96h], eax
		mov	[bp-9Ah], eax
		mov	ax, [bp-99h]
		mov	[bp-90h], ax
		mov	ax, [bp-10h]
		mov	[bp-9Ch], ax
		movsx	eax, word ptr [bp-9Ch]
		shl	eax, 8
		sub	eax, [bp-48h]
		mov	[bp-0A0h], eax
		mov	[bp-0A4h], eax
		mov	ax, [bp-0A3h]
		mov	[bp-8Eh], ax
		mov	ax, [bp-12h]
		mov	[bp-0AAh], ax
		movsx	eax, word ptr [bp-0AAh]
		shl	eax, 8
		mov	edx, [bp-4Ch]
		add	edx, eax
		mov	[bp-0AEh], edx
		mov	eax, [bp-0AEh]
		mov	[bp-0B2h], eax
		mov	ax, [bp-0B1h]
		mov	[bp-0A8h], ax
		mov	ax, [bp-10h]
		mov	[bp-0B4h], ax
		movsx	eax, word ptr [bp-0B4h]
		shl	eax, 8
		mov	edx, [bp-48h]
		add	edx, eax
		mov	[bp-0B8h], edx
		mov	eax, [bp-0B8h]
		mov	[bp-0BCh], eax
		mov	ax, [bp-0BBh]
		mov	[bp-0A6h], ax
		mov	eax, [bp-36h]
		mov	edx, [bp-40h]
		imul	edx

loc_1DDD1:
		shrd	eax, edx, 8
		mov	[bp-0C4h], eax

loc_1DDDB:
		mov	eax, [bp-0C4h]
		mov	[bp-0C8h], eax
		mov	eax, [bp-32h]
		mov	edx, [bp-40h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0CCh], eax
		mov	eax, [bp-0CCh]
		mov	[bp-0D0h], eax
		mov	eax, [bp-0C8h]
		mov	[bp-0D8h], eax
		mov	eax, [bp-0D0h]
		mov	[bp-0D4h], eax
		mov	eax, [bp-0D8h]
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[bp-0DCh], eax
		mov	[bp-0E0h], eax
		mov	eax, [bp-0D4h]
		cdq
		idiv	ebx
		mov	[bp-0E4h], eax
		mov	[bp-0E8h], eax
		mov	eax, [bp-0E0h]
		mov	[bp-0F0h], eax
		mov	eax, [bp-0E8h]
		mov	[bp-0ECh], eax
		mov	ax, [bp-0EFh]
		mov	[bp-0F2h], ax
		mov	ax, [bp-0EBh]
		mov	[bp-0F4h], ax
		mov	ax, [bp-0F2h]
		mov	[bp-0C0h], ax
		mov	ax, [bp-0F4h]
		mov	[bp-0BEh], ax
		mov	ax, [bp-90h]
		sub	ax, [bp-0C0h]
		mov	[bp-0FAh], ax
		mov	ax, [bp-8Eh]
		sub	ax, [bp-0BEh]
		mov	[bp-0FCh], ax
		mov	ax, [bp-0FAh]
		mov	[bp-0F8h], ax
		mov	ax, [bp-0FCh]
		mov	[bp-0F6h], ax
		mov	ax, [bp-0A8h]
		sub	ax, [bp-0C0h]
		mov	[bp-102h], ax
		mov	ax, [bp-0A6h]
		sub	ax, [bp-0BEh]
		mov	[bp-104h], ax
		mov	ax, [bp-102h]
		mov	[bp-100h], ax
		mov	ax, [bp-104h]
		mov	[bp-0FEh], ax
		mov	al, [si+1Ch]
		push	ax
		push	large dword ptr	[bp-90h]
		push	large dword ptr	[bp-58h]
		push	word ptr [bp-4]

loc_1DEDA:
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, [si+1Ch]
		push	ax
		push	large dword ptr	[bp-0A8h]
		push	large dword ptr	[bp-70h]
		push	word ptr [bp-4]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, [si+1Ch]
		push	ax
		push	large dword ptr	[bp-0F8h]
		push	large dword ptr	[bp-90h]
		push	word ptr [bp-4]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, [si+1Ch]
		push	ax
		push	large dword ptr	[bp-100h]
		push	large dword ptr	[bp-0A8h]
		push	word ptr [bp-4]
		call	Render_FillClippedRect_61960
		jmp	short loc_1DF61
; ���������������������������������������������������������������������������

loc_1DF2B:				; CODE XREF: seg030:0B87j
		mov	bx, [si+4]
		mov	ax, [bx+3Bh]
		mov	[bp-0Ah], ax
		mov	ax, [bx+3Dh]
		mov	[bp-8],	ax
		push	large 40000h
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large dword ptr	[bp-0Ah]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52

loc_1DF61:				; CODE XREF: seg030:1019j
		add	sp, 0Ch
		mov	bx, word_6E343
		mov	al, [bx+17h]
		mov	[bp-5],	al
		mov	al, [si+1Ch]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		push	large 0Ah
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		movsx	eax, word ptr [si+1Fh]
		push	eax
		push	word ptr [si+4]
		call	Widget_SetLabelFormatted
		add	sp, 6
		push	large 19h
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		mov	al, [si+1Bh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1DFBD
		cmp	ax, 1
		jnz	short loc_1DFBA
		jmp	loc_1E0D3
; ���������������������������������������������������������������������������

loc_1DFBA:				; CODE XREF: seg030:10A5j
		jmp	loc_1E1F3
; ���������������������������������������������������������������������������

loc_1DFBD:				; CODE XREF: seg030:10A0j
		mov	al, byte_7235B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1DFCC
		push	ds
		push	offset aAir	; "AIR"
		jmp	short loc_1DFD0
; ���������������������������������������������������������������������������

loc_1DFCC:				; CODE XREF: seg030:10B4j
		push	ds
		push	offset aAir360	; "AIR 360"

loc_1DFD0:				; CODE XREF: seg030:10BAj
		push	word ptr [si+4]

loc_1DFD3:
		call	Widget_SetLabelRaw

loc_1DFD8:
		add	sp, 6
		cmp	word ptr [si+0DBh], 0
		jnz	short loc_1DFE5

loc_1DFE2:
		jmp	loc_1E1F3
; ���������������������������������������������������������������������������

loc_1DFE5:				; CODE XREF: seg030:10D0j
		mov	di, si

loc_1DFE7:
		add	di, 3Bh	; ';'
		mov	word ptr [bp-8], 0

loc_1DFEF:
		jmp	loc_1E0C4
; ���������������������������������������������������������������������������

loc_1DFF2:				; CODE XREF: seg030:11BDj
		cmp	byte_7235C, 0
		jz	short loc_1E065
		mov	ax, [di+5]
		cmp	ax, 0FFFFh
		jz	short loc_1E00C
		or	ax, ax
		jz	short loc_1E041
		cmp	ax, 1
		jz	short loc_1E04F
		jmp	short loc_1E05D
; ���������������������������������������������������������������������������

loc_1E00C:				; CODE XREF: seg030:10EFj
		cmp	byte ptr [di+7], 0
		jz	short loc_1E03D
		push	5

loc_1E014:				; CODE XREF: seg030:112Fj seg030:1139j ...
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_1E05D
; ���������������������������������������������������������������������������

loc_1E03D:				; CODE XREF: seg030:1100j
		push	0
		jmp	short loc_1E014
; ���������������������������������������������������������������������������

loc_1E041:				; CODE XREF: seg030:10F3j
		cmp	byte ptr [di+7], 0
		jz	short loc_1E04B
		push	6
		jmp	short loc_1E014
; ���������������������������������������������������������������������������

loc_1E04B:				; CODE XREF: seg030:1135j
		push	7
		jmp	short loc_1E014
; ���������������������������������������������������������������������������

loc_1E04F:				; CODE XREF: seg030:10F8j
		cmp	byte ptr [di+7], 0
		jz	short loc_1E059
		push	8
		jmp	short loc_1E014
; ���������������������������������������������������������������������������

loc_1E059:				; CODE XREF: seg030:1143j
		push	9
		jmp	short loc_1E014
; ���������������������������������������������������������������������������

loc_1E05D:				; CODE XREF: seg030:10FAj seg030:112Bj
		cmp	byte ptr [di+4], 0
		jz	short loc_1E0BE
		jmp	short loc_1E093
; ���������������������������������������������������������������������������

loc_1E065:				; CODE XREF: seg030:10E7j
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	byte ptr [di+4], 0
		jz	short loc_1E0BE

loc_1E093:				; CODE XREF: seg030:1153j
		push	large 20000h
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_1E0BE:				; CODE XREF: seg030:1151j seg030:1181j
		inc	word ptr [bp-8]
		add	di, 8

loc_1E0C4:				; CODE XREF: seg030:loc_1DFEFj
		mov	ax, [si+0DBh]
		cmp	ax, [bp-8]
		jle	short loc_1E0D0
		jmp	loc_1DFF2
; ���������������������������������������������������������������������������

loc_1E0D0:				; CODE XREF: seg030:11BBj
		jmp	loc_1E1F3
; ���������������������������������������������������������������������������

loc_1E0D3:				; CODE XREF: seg030:10A7j
		push	ds
		push	offset aStt	; "STT"

loc_1E0D7:
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		cmp	word ptr [si+0DBh], 0
		jnz	short loc_1E0EC
		jmp	loc_1E1F3
; ���������������������������������������������������������������������������

loc_1E0EC:				; CODE XREF: seg030:11D7j
		push	word ptr [si+33h]
		push	0E42h
		lea	ax, [bp-114h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_1E0FF:
		push	large 3Ch ; '<'

loc_1E102:
		push	word ptr [si+4]

loc_1E105:
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ss
		lea	ax, [bp-114h]
		push	ax
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		push	word ptr [si+35h]
		push	0E49h
		lea	ax, [bp-114h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	large 220033h
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ss
		lea	ax, [bp-114h]
		push	ax
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		push	word ptr [si+37h]
		push	0E50h
		lea	ax, [bp-114h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	large 280033h
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ss
		lea	ax, [bp-114h]
		push	ax
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		push	word ptr [si+39h]
		push	0E58h
		lea	ax, [bp-114h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	large 2E0033h

loc_1E1A1:
		push	word ptr [si+4]

loc_1E1A4:
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6

loc_1E1AC:
		push	ss

loc_1E1AD:
		lea	ax, [bp-114h]
		push	ax

loc_1E1B2:
		push	word ptr [si+4]

loc_1E1B5:
		call	Widget_SetLabelRaw
		add	sp, 6
		cmp	byte ptr [si+42h], 0
		jz	short loc_1E1EF
		push	1

loc_1E1C5:				; CODE XREF: seg030:12E1j
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]

loc_1E1CF:
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+3Dh]
		push	word ptr [si+3Bh]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_1E1F3
; ���������������������������������������������������������������������������

loc_1E1EF:				; CODE XREF: seg030:12B1j
		push	0Ah
		jmp	short loc_1E1C5
; ���������������������������������������������������������������������������

loc_1E1F3:				; CODE XREF: seg030:loc_1DFBAj
					; seg030:loc_1DFE2j ...
		mov	al, [bp-5]
		push	ax

loc_1E1F7:
		push	word_6E343

loc_1E1FB:
		call	Widget_Method_Dispatch8_6083F

loc_1E200:
		add	sp, 4

loc_1E203:				; CODE XREF: seg030:0B6Cj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E207:				; DATA XREF: seg339:0DFAo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		push	ds
		push	offset aRadar_1	; "RADAR"
		push	si
		call	Widget_GetNestedPropA
		pop	cx
		add	ax, 5Eh	; '^'
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		push	large dword ptr	[bx]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_1E238
		jmp	loc_1E2F7
; ���������������������������������������������������������������������������

loc_1E238:				; CODE XREF: seg030:1323j
		mov	al, byte_722D1
		mov	ah, 0
		mov	[bp-3],	al
		mov	dl, 0
		mov	ah, 0
		cmp	ax, 1Ah
		jz	short loc_1E250
		cmp	ax, 1Bh
		jz	short loc_1E275
		jmp	short loc_1E298
; ���������������������������������������������������������������������������

loc_1E250:				; CODE XREF: seg030:1337j
		mov	dl, 1
		mov	eax, [si+24h]
		sar	eax, 1
		mov	[si+24h], eax
		shl	word ptr [si+28h], 1
		cmp	word ptr [si+28h], 20h ; ' '
		jle	short loc_1E298
		mov	eax, [si+1Ch]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 1
		jmp	short loc_1E298
; ���������������������������������������������������������������������������

loc_1E275:				; CODE XREF: seg030:133Cj
		mov	dl, 1
		mov	eax, [si+24h]
		shl	eax, 1
		mov	[si+24h], eax
		sar	word ptr [si+28h], 1
		cmp	word ptr [si+28h], 1
		jge	short loc_1E298
		mov	eax, [si+20h]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 20h ; ' '

loc_1E298:				; CODE XREF: seg030:133Ej seg030:1354j ...
		or	dl, dl
		jnz	short loc_1E2C7
		xor	dx, dx
		mov	eax, dword_70458
		sub	[si+9],	eax

loc_1E2A6:
		cmp	dword ptr [si+9], 0
		jg	short loc_1E2B2

loc_1E2AD:
		mov	ax, 1
		jmp	short loc_1E2B4
; ���������������������������������������������������������������������������

loc_1E2B2:				; CODE XREF: seg030:139Bj
		xor	ax, ax

loc_1E2B4:				; CODE XREF: seg030:13A0j
		or	ax, ax
		jz	short loc_1E2C3
		mov	eax, [si+0Dh]
		mov	[si+9],	eax
		inc	dx
		jmp	short $+2

loc_1E2C3:				; CODE XREF: seg030:13A6j
		or	dx, dx
		jz	short loc_1E2F7

loc_1E2C7:				; CODE XREF: seg030:138Aj
		push	ds
		push	offset aPlayer	; "PLAYER"
		push	59C3h
		call	Container_Op_2241B

loc_1E2D3:
		add	sp, 6
		mov	di, ax
		mov	ax, si
		add	ax, 32h	; '2'
		push	ax
		push	di
		call	Debris_PositionWidget

loc_1E2E4:
		add	sp, 4
		mov	eax, [di+12h]
		mov	[si+2Ah], eax

loc_1E2EF:
		mov	eax, [di+16h]

loc_1E2F3:
		mov	[si+2Eh], eax

loc_1E2F7:				; CODE XREF: seg030:1325j seg030:13B5j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E2FB:				; DATA XREF: seg339:0DFEo
		push	bp

loc_1E2FC:
		mov	bp, sp

loc_1E2FE:
		sub	sp, 0E0h
		push	si
		push	di

loc_1E304:
		mov	di, [bp+6]
		push	ds
		push	offset aRadar_2	; "RADAR"
		push	di
		call	Widget_GetNestedPropA
		pop	cx
		add	ax, 5Eh	; '^'
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		push	large dword ptr	[bx]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jnz	short loc_1E32D
		jmp	loc_1E457
; ���������������������������������������������������������������������������

loc_1E32D:				; CODE XREF: seg030:1418j
		mov	si, [di+4]
		add	si, 2
		mov	cx, [si+8]
		sub	cx, [si+4]
		inc	cx
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		mov	[bp-4],	ax
		mov	ax, [si+4]
		mov	[bp-6],	ax
		mov	ax, [si+6]
		mov	[bp-8],	ax
		mov	bx, [di+4]
		mov	al, [bx+47h]
		mov	ah, 0
		mov	[bp-0Ah], ax
		mov	ax, cx
		sar	ax, 2
		mov	dx, cx
		sub	dx, ax
		mov	[bp-0Ch], dx
		mov	ax, [bp-4]
		sar	ax, 2
		mov	dx, [bp-4]
		sub	dx, ax
		mov	[bp-0Eh], dx
		mov	ax, [bp-0Ch]
		sar	ax, 2
		mov	dx, [bp-6]
		add	dx, ax
		mov	[bp-10h], dx
		mov	ax, [bp-0Eh]
		sar	ax, 2
		mov	dx, [bp-8]
		add	dx, ax
		mov	[bp-12h], dx
		mov	word ptr [bp-14h], 0
		jmp	short loc_1E3CC
; ���������������������������������������������������������������������������

loc_1E398:				; CODE XREF: seg030:14C0j
		mov	ax, [bp-0Ch]
		call	Math_RandomScale_54DF4
		mov	[bp-20h], ax

loc_1E3A3:
		mov	ax, [bp-0Eh]
		call	Math_RandomScale_54DF4

loc_1E3AB:
		mov	[bp-22h], ax
		mov	al, [bp-0Ah]
		push	ax
		mov	ax, [bp-12h]
		add	ax, [bp-22h]
		push	ax
		mov	ax, [bp-10h]
		add	ax, [bp-20h]
		push	ax
		push	si
		call	Render_SetPixelClipped_61B58
		add	sp, 8
		inc	word ptr [bp-14h]

loc_1E3CC:				; CODE XREF: seg030:1486j
		cmp	word ptr [bp-14h], 7
		jl	short loc_1E398

loc_1E3D2:
		mov	eax, dword_70458

loc_1E3D6:
		imul	eax, 38h

loc_1E3DA:
		mov	[bp-18h], eax
		mov	[bp-1Ch], eax
		mov	ax, [bp-1Bh]
		add	word_6DEE0, ax
		mov	ax, [bp-4]
		add	ax, 4
		cmp	ax, word_6DEE0
		jge	short loc_1E3FF
		mov	ax, [bp-4]
		add	ax, 4
		sub	word_6DEE0, ax

loc_1E3FF:				; CODE XREF: seg030:14E3j
		mov	word ptr [bp-1Eh], 0Ch
		mov	bx, [di+4]
		mov	al, [bx+46h]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	bx, [di+4]
		mov	al, [bx+45h]
		push	ax
		push	bx
		call	Widget_Method_DispatchC_60861
		add	sp, 4
		push	word_6DEE0
		push	word ptr [bp-1Eh]
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		mov	al, byte_7235B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1E451
		push	ds
		push	offset aGnd	; "GND"

loc_1E443:				; CODE XREF: seg030:1545j
		push	word ptr [di+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		jmp	loc_1EA32
; ���������������������������������������������������������������������������

loc_1E451:				; CODE XREF: seg030:152Dj
		push	ds
		push	offset aGnd360	; "GND 360"
		jmp	short loc_1E443
; ���������������������������������������������������������������������������

loc_1E457:				; CODE XREF: seg030:141Aj
		mov	ax, [di+4]
		add	ax, 29h	; ')'
		mov	[bp-4],	ax
		mov	bx, [di+4]
		mov	ax, [bx+3Bh]
		mov	[bp-8],	ax
		mov	ax, [bx+3Dh]
		mov	[bp-6],	ax
		push	0
		mov	al, [di+15h]
		push	ax
		push	large dword ptr	[di+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp-0Ah], dx
		mov	[bp-0Ch], ax
		xor	bx, bx
		cmp	byte_7235B, 0
		jz	short loc_1E494
		inc	bx

loc_1E494:				; CODE XREF: seg030:1581j
		push	bx
		push	large dword ptr	[bp-0Ch]
		push	large dword ptr	[bp-8]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_1E4A8:
		mov	bx, word_6E343
		mov	al, [bx+17h]
		mov	[bp-13h], al
		mov	al, [di+1Bh]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		push	large 0Ah
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	word ptr [di+28h]
		push	0E72h
		lea	ax, [bp-12h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	ss
		lea	ax, [bp-12h]
		push	ax
		push	word ptr [di+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		push	large 1Eh
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		mov	al, byte_7235B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1E50C
		push	ds
		push	offset aGnd	; "GND"
		jmp	short loc_1E510
; ���������������������������������������������������������������������������

loc_1E50C:				; CODE XREF: seg030:15F4j
		push	ds
		push	offset aGnd360	; "GND 360"

loc_1E510:				; CODE XREF: seg030:15FAj
		push	word ptr [di+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		mov	al, [bp-13h]
		push	ax
		push	word_6E343
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	ax, [di+4]
		add	ax, 2
		mov	[bp-4],	ax
		mov	bx, [di+4]
		mov	ax, [bx+3Fh]
		sub	ax, [bx+3Bh]
		inc	ax
		sar	ax, 1
		mov	dx, [bx+3Bh]
		add	dx, ax
		mov	[bp-18h], dx
		cmp	byte_7235B, 0
		jz	short loc_1E562
		mov	ax, [bx+41h]
		sub	ax, [bx+3Dh]
		inc	ax
		sar	ax, 1
		mov	dx, [bx+3Dh]
		add	dx, ax
		mov	[bp-16h], dx
		jmp	short loc_1E56B
; ���������������������������������������������������������������������������

loc_1E562:				; CODE XREF: seg030:163Dj
		mov	bx, [di+4]
		mov	ax, [bx+41h]
		mov	[bp-16h], ax

loc_1E56B:				; CODE XREF: seg030:1650j
		mov	bx, [di+4]
		mov	cx, [bx+41h]
		sub	cx, [bx+3Dh]
		inc	cx
		mov	ax, [bx+3Fh]
		sub	ax, [bx+3Bh]
		inc	ax
		mov	bx, ax
		cmp	cx, bx
		jle	short loc_1E584
		mov	cx, bx

loc_1E584:				; CODE XREF: seg030:1670j
		mov	[bp-1Eh], cx
		movsx	ebx, word ptr [bp-1Eh]
		mov	eax, [di+24h]
		cdq
		idiv	ebx
		mov	[bp-22h], eax
		mov	[bp-26h], eax
		sar	eax, 8

loc_1E5A1:
		mov	[bp-1Ch], eax
		mov	si, di

loc_1E5A7:
		add	si, 42h	; 'B'

loc_1E5AA:
		mov	eax, [si]
		mov	[bp-2Ah], eax

loc_1E5B1:
		lea	ax, [bp-2Ah]
		push	ax
		push	ss

loc_1E5B6:
		lea	ax, [bp-2Eh]
		push	ax
		call	Math_AcosDeg_5493E
		add	sp, 6
		mov	eax, [bp-2Eh]
		mov	[bp-2Ah], eax
		cmp	dword ptr [di+3Eh], 0
		jge	short loc_1E5D8
		neg	eax
		mov	[bp-2Ah], eax

loc_1E5D8:				; CODE XREF: seg030:16BFj
		push	large dword ptr	[bp-0Ch]
		mov	al, [di+1Bh]
		push	ax
		mov	eax, [bp-1Ch]
		mov	[bp-32h], eax
		shl	eax, 8
		mov	[bp-36h], eax

loc_1E5F0:
		lea	ax, [bp-36h]

loc_1E5F3:
		push	ax
		lea	ax, [bp-18h]

loc_1E5F7:
		push	ax

loc_1E5F8:
		mov	eax, [di+24h]

loc_1E5FC:
		sar	eax, 8
		mov	[bp-3Ah], eax

loc_1E604:
		lea	ax, [bp-3Ah]
		push	ax
		mov	si, di
		add	si, 2Ah	; '*'
		mov	eax, [si]
		mov	[bp-0E0h], eax
		mov	eax, [si+4]
		mov	[bp-0DCh], eax
		mov	dword ptr [bp-3Eh], 0
		mov	eax, [bp-3Eh]
		mov	[bp-0D8h], eax
		lea	ax, [bp-0E0h]
		push	ax
		lea	ax, [bp-2Ah]
		push	ax
		push	word ptr [bp-4]
		push	word_70474
		call	Terrain_ProcessAdjacentPatches
		add	sp, 14h
		mov	word ptr [bp-40h], 0
		mov	ax, word_72A73
		mov	[bp-42h], ax
		jmp	loc_1EA12
; ���������������������������������������������������������������������������

loc_1E655:				; CODE XREF: seg030:loc_1EA2Fj
		mov	si, [bp-40h]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-44h], dx
		mov	[bp-46h], ax
		cmp	dword ptr [bp-46h], 0
		jnz	short loc_1E66E
		jmp	loc_1EA12
; ���������������������������������������������������������������������������

loc_1E66E:				; CODE XREF: seg030:1759j
		les	bx, [bp-46h]
		cmp	byte ptr es:[bx+11h], 2
		jz	short loc_1E67B
		jmp	loc_1EA12
; ���������������������������������������������������������������������������

loc_1E67B:				; CODE XREF: seg030:1766j
		mov	cx, si
		add	cx, 12h
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp-4Eh], eax
		mov	eax, [bx+4]
		mov	[bp-4Ah], eax
		mov	eax, [bp-4Eh]
		sub	eax, [di+2Ah]
		mov	[bp-5Ah], eax
		mov	eax, [bp-1Ch]

loc_1E6A1:
		mov	[bp-62h], eax

loc_1E6A5:
		mov	eax, [bp-5Ah]
		cdq
		idiv	dword ptr [bp-62h]
		mov	[bp-66h], eax
		mov	[bp-6Ah], eax
		sar	eax, 8
		mov	[bp-5Eh], eax
		mov	eax, [bp-4Ah]
		sar	eax, 8
		mov	[bp-72h], eax
		mov	ax, di
		add	ax, 2Eh	; '.'

loc_1E6D0:
		mov	[bp-74h], ax

loc_1E6D3:
		mov	eax, [bp-72h]
		shl	eax, 8
		mov	bx, [bp-74h]
		sub	eax, [bx]
		mov	[bp-78h], eax
		mov	[bp-7Ch], eax
		mov	eax, [bp-1Ch]
		mov	[bp-80h], eax

loc_1E6F1:
		mov	eax, [bp-7Ch]
		cdq
		idiv	dword ptr [bp-80h]
		mov	[bp-84h], eax
		mov	[bp-88h], eax
		sar	eax, 8
		mov	[bp-6Eh], eax
		cmp	dword ptr [bp-5Eh], 0
		jnz	short loc_1E71E
		cmp	dword ptr [bp-6Eh], 0
		jnz	short loc_1E71E
		jmp	loc_1E875
; ���������������������������������������������������������������������������

loc_1E71E:				; CODE XREF: seg030:1802j seg030:1809j
		mov	eax, [bp-5Eh]
		mov	[bp-0ACh], eax
		shl	eax, 8
		mov	[bp-0B0h], eax
		mov	eax, [bp-0B0h]
		mov	[bp-0A8h], eax
		mov	eax, [bp-6Eh]
		mov	[bp-0B4h], eax
		shl	eax, 8
		mov	[bp-0B8h], eax
		mov	eax, [bp-0B8h]
		mov	[bp-0A4h], eax
		push	large 0
		push	eax
		push	large dword ptr	[bp-0A8h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0BCh], eax
		mov	[bp-0C0h], eax
		mov	[bp-52h], eax
		lea	ax, [bp-0A8h]
		push	ax
		call	Weapon_ComputeVectorLength_561AF
		pop	cx
		mov	eax, [bp-0A8h]
		mov	[bp-0C4h], eax
		cmp	dword ptr [bp-0C4h], 100h
		jle	short loc_1E7A3

loc_1E79A:
		mov	dword ptr [bp-0C4h], 100h

loc_1E7A3:				; CODE XREF: seg030:1888j
		cmp	dword ptr [bp-0C4h], 0FFFFFF00h
		jge	short loc_1E7B7
		mov	dword ptr [bp-0C4h], 0FFFFFF00h

loc_1E7B7:				; CODE XREF: seg030:189Cj
		mov	dword ptr [bp-0C8h], 100h
		lea	ax, [bp-0C8h]
		push	ax
		lea	ax, [bp-0C4h]
		push	ax
		push	ss
		lea	ax, [bp-0CCh]
		push	ax
		call	Math_AcosOfRatio_54A0E
		add	sp, 8
		mov	eax, [bp-0CCh]

loc_1E7DD:
		mov	[bp-56h], eax

loc_1E7E1:
		cmp	dword ptr [bp-6Eh], 0
		jge	short loc_1E7F9

loc_1E7E8:
		neg	eax
		mov	[bp-0D0h], eax

loc_1E7F0:
		mov	[bp-0D4h], eax
		mov	[bp-56h], eax

loc_1E7F9:				; CODE XREF: seg030:18D6j
		mov	eax, [bp-2Ah]
		add	[bp-56h], eax

loc_1E801:
		lea	ax, [bp-56h]

loc_1E804:
		push	ax
		push	ss
		lea	ax, [bp-8Ch]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp-52h]
		mov	edx, [bp-8Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-90h], eax
		mov	eax, [bp-90h]
		mov	[bp-94h], eax
		sar	eax, 8
		mov	[bp-5Eh], eax
		lea	ax, [bp-56h]
		push	ax
		push	ss
		lea	ax, [bp-98h]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp-52h]
		mov	edx, [bp-98h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-9Ch], eax
		mov	eax, [bp-9Ch]
		mov	[bp-0A0h], eax
		sar	eax, 8
		mov	[bp-6Eh], eax

loc_1E875:				; CODE XREF: seg030:180Bj
		movsx	eax, word ptr [bp-18h]
		add	eax, [bp-5Eh]
		mov	[bp-5Eh], eax
		movsx	eax, word ptr [bp-16h]
		sub	eax, [bp-6Eh]
		mov	[bp-6Eh], eax
		mov	al, byte_7235C
		mov	ah, 0
		or	ax, ax
		jz	short loc_1E89B
		jmp	loc_1E9C3
; ���������������������������������������������������������������������������

loc_1E89B:				; CODE XREF: seg030:1986j
		les	bx, [bp-46h]
		mov	eax, es:[bx+8]

loc_1E8A3:
		mov	[bp-0A4h], eax
		les	bx, [bp-0A4h]
		mov	ax, es:[bx+14h]
		mov	[bp-0A6h], ax

loc_1E8B4:
		cmp	word ptr [bp-0A6h], 0
		jnz	short loc_1E8BE
		jmp	loc_1E949
; ���������������������������������������������������������������������������

loc_1E8BE:				; CODE XREF: seg030:19A9j
		push	0
		push	word ptr [bp-0A2h]
		push	bx
		call	Particle_PoolWait
		add	sp, 6
		mov	[bp-0A8h], dx
		mov	[bp-0AAh], ax
		les	bx, [bp-0AAh]

loc_1E8D9:
		mov	eax, es:[bx+1Fh]

loc_1E8DE:
		mov	[bp-0B6h], eax
		mov	eax, es:[bx+23h]
		mov	[bp-0BAh], eax
		mov	eax, [bp-0B6h]

loc_1E8F2:
		sub	eax, [bp-0BAh]

loc_1E8F7:
		push	eax
		call	CRT_NormalizeSign32

loc_1E8FE:
		push	dx
		push	ax
		pop	eax

loc_1E902:
		add	sp, 4
		sar	eax, 8
		mov	[bp-0AEh], eax
		les	bx, [bp-0AAh]
		mov	eax, es:[bx+27h]
		mov	[bp-0BEh], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp-0C2h], eax
		mov	eax, [bp-0BEh]
		sub	eax, [bp-0C2h]
		push	eax
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		sar	eax, 8
		mov	[bp-0B2h], eax
		jmp	short loc_1E964
; ���������������������������������������������������������������������������

loc_1E949:				; CODE XREF: seg030:19ABj
		les	bx, [bp-0A4h]
		mov	eax, es:[bx+10h]
		sar	eax, 8
		mov	[bp-0AEh], eax
		mov	dword ptr [bp-0B2h], 0

loc_1E964:				; CODE XREF: seg030:1A37j
		cmp	dword ptr [bp-0AEh], 28h ; '('
		jg	short loc_1E974
		cmp	dword ptr [bp-0B2h], 28h ; '('
		jle	short loc_1E9B1

loc_1E974:				; CODE XREF: seg030:1A5Aj
		mov	al, [di+1Bh]
		push	ax
		mov	ax, [bp-6Eh]
		inc	ax
		push	ax
		mov	ax, [bp-5Eh]
		inc	ax
		push	ax
		push	word ptr [bp-6Eh]
		push	word ptr [bp-5Eh]
		push	word ptr [bp-4]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, [di+1Bh]
		push	ax
		mov	ax, [bp-6Eh]
		inc	ax
		push	ax
		push	word ptr [bp-5Eh]
		push	word ptr [bp-6Eh]

loc_1E9A2:
		mov	ax, [bp-5Eh]
		inc	ax
		push	ax

loc_1E9A7:				; CODE XREF: seg030:1AB1j
		push	word ptr [bp-4]

loc_1E9AA:
		call	Render_FillClippedRect_61960
		jmp	short loc_1EA0F
; ���������������������������������������������������������������������������

loc_1E9B1:				; CODE XREF: seg030:1A62j
		mov	al, [di+1Bh]
		push	ax
		push	word ptr [bp-6Eh]
		push	word ptr [bp-5Eh]
		push	word ptr [bp-6Eh]
		push	word ptr [bp-5Eh]
		jmp	short loc_1E9A7
; ���������������������������������������������������������������������������

loc_1E9C3:				; CODE XREF: seg030:1988j
		push	si
		mov	bx, [si]

loc_1E9C6:
		call	dword ptr [bx+34h]
		pop	cx

loc_1E9CA:
		mov	[bp-0A2h], al

loc_1E9CE:
		mov	al, [si+50h]

loc_1E9D1:
		mov	[bp-0A4h], al

loc_1E9D5:
		cmp	byte ptr [bp-0A2h], 14h
		jnz	short loc_1E9ED

loc_1E9DC:
		cmp	byte ptr [bp-0A4h], 0FFh
		jnz	short loc_1E9E8

loc_1E9E3:
		mov	bx, 5
		jmp	short loc_1E9FC
; ���������������������������������������������������������������������������

loc_1E9E8:				; CODE XREF: seg030:1AD1j
		mov	bx, 2
		jmp	short loc_1E9FC
; ���������������������������������������������������������������������������

loc_1E9ED:				; CODE XREF: seg030:1ACAj
		cmp	byte ptr [bp-0A4h], 0FFh
		jnz	short loc_1E9F9
		mov	bx, 4
		jmp	short loc_1E9FC
; ���������������������������������������������������������������������������

loc_1E9F9:				; CODE XREF: seg030:1AE2j
		mov	bx, 3

loc_1E9FC:				; CODE XREF: seg030:1AD6j seg030:1ADBj ...
		push	bx
		push	large dword ptr	[bp-0Ch]
		push	word ptr [bp-6Eh]
		push	word ptr [bp-5Eh]
		push	word ptr [bp-4]
		call	Render_MeasureOrDrawTextString_61F52

loc_1EA0F:				; CODE XREF: seg030:1A9Fj
		add	sp, 0Ch

loc_1EA12:				; CODE XREF: seg030:1742j seg030:175Bj ...
		cmp	word ptr [bp-40h], 0
		jnz	short loc_1EA20
		mov	bx, [bp-42h]
		mov	ax, [bx+0Bh]
		jmp	short loc_1EA26
; ���������������������������������������������������������������������������

loc_1EA20:				; CODE XREF: seg030:1B06j
		mov	bx, [bp-40h]
		mov	ax, [bx+2]

loc_1EA26:				; CODE XREF: seg030:1B0Ej
		mov	[bp-40h], ax
		cmp	word ptr [bp-40h], 0
		jz	short loc_1EA32

loc_1EA2F:
		jmp	loc_1E655
; ���������������������������������������������������������������������������

loc_1EA32:				; CODE XREF: seg030:153Ej seg030:1B1Dj
		pop	di
		pop	si
		leave
		retf
seg030		ends
