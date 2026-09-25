seg085		segment	byte public 'CODE' use16
		assume cs:seg085
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_3CC4B:				; DATA XREF: seg216:off_6A14Eo
					; seg339:off_6ECAAo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CC53:				; DATA XREF: seg339:1C12o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CC5D:				; DATA XREF: seg339:1C1Ao
					; seg339:off_6ED56o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 5B8Ch
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CC68:				; DATA XREF: seg339:1C22o seg339:1CAEo ...
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		cmp	word ptr [si+2Ch], 0
		jnz	short loc_3CC83
		jmp	loc_3CD1D
; ���������������������������������������������������������������������������

loc_3CC83:				; CODE XREF: seg085:003Ej
		mov	si, [si+2Ch]
		add	si, 8
		mov	eax, [si]
		mov	edx, dword_7045E

loc_3CC91:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		mov	eax, [si+4]
		mov	edx, dword_7045E
		imul	edx

loc_3CCB1:
		shrd	eax, edx, 8

loc_3CCB6:
		mov	[bp-10h], eax

loc_3CCBA:
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [si+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		cmp	word ptr [bp-4], 0
		jz	short loc_3CCEA
		mov	ax, [bp-4]
		jmp	short loc_3CCF5
; ���������������������������������������������������������������������������

loc_3CCEA:				; CODE XREF: seg085:00A3j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3CCF5:				; CODE XREF: seg085:00A8j
		or	ax, ax
		jz	short loc_3CD15
		mov	bx, [bp-4]
		mov	eax, [bp-0Ch]
		mov	[bx], eax
		mov	eax, [bp-14h]
		mov	[bx+4],	eax
		mov	eax, [bp-1Ch]
		mov	[bx+8],	eax
		jmp	short $+2

loc_3CD15:				; CODE XREF: seg085:00B7j
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	short loc_3CD59
; ���������������������������������������������������������������������������

loc_3CD1D:				; CODE XREF: seg085:0040j
		cmp	word ptr [bp-4], 0
		jz	short loc_3CD28
		mov	ax, [bp-4]
		jmp	short loc_3CD33
; ���������������������������������������������������������������������������

loc_3CD28:				; CODE XREF: seg085:00E1j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3CD33:				; CODE XREF: seg085:00E6j
		or	ax, ax
		jz	short loc_3CD53
		mov	bx, [bp-4]
		mov	eax, dword_707F8
		mov	[bx], eax
		mov	eax, dword_707FC
		mov	[bx+4],	eax
		mov	eax, dword_70800
		mov	[bx+8],	eax
		jmp	short $+2

loc_3CD53:				; CODE XREF: seg085:00F5j
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_3CD59:				; CODE XREF: seg085:00DBj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3CD62:				; DATA XREF: seg339:1C2Ao
					; seg339:off_6ED66o ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_3CDBD
		mov	si, [si+2Ch]
		add	si, 8
		cmp	word ptr [bp-4], 0
		jz	short loc_3CD8B
		mov	ax, [bp-4]
		jmp	short loc_3CD96
; ���������������������������������������������������������������������������

loc_3CD8B:				; CODE XREF: seg085:0144j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3CD96:				; CODE XREF: seg085:0149j
		or	ax, ax
		jz	short loc_3CDB5
		mov	eax, [si]
		mov	bx, [bp-4]
		mov	[bx], eax

loc_3CDA3:
		mov	eax, [si+4]
		mov	[bx+4],	eax
		mov	eax, [si+8]
		mov	[bx+8],	eax
		jmp	short $+2

loc_3CDB5:				; CODE XREF: seg085:0158j
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	short loc_3CDF9
; ���������������������������������������������������������������������������

loc_3CDBD:				; CODE XREF: seg085:0138j
		cmp	word ptr [bp-4], 0
		jz	short loc_3CDC8
		mov	ax, [bp-4]
		jmp	short loc_3CDD3
; ���������������������������������������������������������������������������

loc_3CDC8:				; CODE XREF: seg085:0181j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3CDD3:				; CODE XREF: seg085:0186j
		or	ax, ax
		jz	short loc_3CDF3
		mov	bx, [bp-4]
		mov	eax, dword_707F8
		mov	[bx], eax
		mov	eax, dword_707FC
		mov	[bx+4],	eax
		mov	eax, dword_70800
		mov	[bx+8],	eax
		jmp	short $+2

loc_3CDF3:				; CODE XREF: seg085:0195j
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_3CDF9:				; CODE XREF: seg085:017Bj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3CE02:				; DATA XREF: seg339:1C1Eo seg339:1CAAo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CE0A:				; DATA XREF: seg339:1C26o seg339:1CB2o ...
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	word ptr [si+2Ch], 0
		jnz	short loc_3CE21
		jmp	loc_3CEB2
; ���������������������������������������������������������������������������

loc_3CE21:				; CODE XREF: seg085:01DCj
		mov	eax, [di]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		mov	[bp-8],	eax
		mov	eax, [di+4]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [di+8]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	eax, [bp-8]
		mov	[bp-24h], eax

loc_3CE7F:
		mov	eax, [bp-10h]

loc_3CE83:
		mov	[bp-20h], eax

loc_3CE87:
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax

loc_3CE8F:
		mov	bx, [si+2Ch]

loc_3CE92:
		mov	eax, [bp-24h]
		mov	[bx+8],	eax
		mov	eax, [bp-20h]
		mov	[bx+0Ch], eax

loc_3CEA2:
		mov	eax, [bp-1Ch]
		mov	[bx+10h], eax
		mov	ax, [si+2Ch]
		add	ax, 8
		jmp	short $+2

loc_3CEB2:				; CODE XREF: seg085:01DEj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3CEB6:				; DATA XREF: seg339:1C2Eo seg339:1CBAo ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]

loc_3CEC1:
		cmp	word ptr [si+2Ch], 0

loc_3CEC5:
		jz	short loc_3CEE9
		mov	eax, [di]

loc_3CECA:
		mov	bx, [si+2Ch]

loc_3CECD:
		mov	[bx+8],	eax

loc_3CED1:
		mov	eax, [di+4]

loc_3CED5:
		mov	[bx+0Ch], eax
		mov	eax, [di+8]
		mov	[bx+10h], eax
		mov	ax, [si+2Ch]
		add	ax, 8
		jmp	short $+2

loc_3CEE9:				; CODE XREF: seg085:loc_3CEC5j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CEED:				; DATA XREF: seg339:off_6ECA2o
					; seg339:off_6ED2Eo ...
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+6]
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+44h]
		add	sp, 6
		lea	ax, [bp-4]
		push	ax
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-0Ch]
		push	ax
		push	si
		call	WorldObject_TranslateBy_37D54
		add	sp, 8
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — teste l'état détruit (sub_3800A) ; si vivant, notifie la caméra de suivi associée
; (+0x2C, vtable[0x3C]) : notification de mise à jour à la caméra de suivi attachée à un
; objet.
; ==============================================================================================
Camera_NotifyFollowTarget	proc far		; CODE XREF: seg095:0049P seg104:01D4P
					; DATA XREF: ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	WorldObject_TestAliveAndUpdateChildren_3800A
		pop	cx
		or	al, al
		jz	short loc_3CF47
		cmp	word ptr [si+2Ch], 0
		jz	short loc_3CF43
		push	word ptr [si+2Ch]
		mov	bx, [si+2Ch]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		jmp	short $+2

loc_3CF43:				; CODE XREF: Camera_NotifyFollowTarget+16j
		mov	al, 1
		jmp	short loc_3CF49
; ���������������������������������������������������������������������������

loc_3CF47:				; CODE XREF: Camera_NotifyFollowTarget+10j
		mov	al, 0

loc_3CF49:				; CODE XREF: Camera_NotifyFollowTarget+28j
		pop	si
		pop	bp
		retf
Camera_NotifyFollowTarget	endp

; ���������������������������������������������������������������������������

loc_3CF4C:				; DATA XREF: seg339:26C0o seg339:288Co ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CF54:				; DATA XREF: seg339:26D8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 3
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CF5E:				; DATA XREF: seg339:off_6F71Co
					; seg339:26F8o	...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		cmp	word ptr [si+51h], 0
		jz	short loc_3CF90
		push	word ptr [si+51h]
		push	large dword ptr	[bp-4]
		mov	bx, [si+51h]

loc_3CF80:
		mov	bx, [bx]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	short loc_3CFCC
; ���������������������������������������������������������������������������

loc_3CF90:				; CODE XREF: seg085:0334j
		cmp	word ptr [bp-4], 0
		jz	short loc_3CF9B
		mov	ax, [bp-4]
		jmp	short loc_3CFA6
; ���������������������������������������������������������������������������

loc_3CF9B:				; CODE XREF: seg085:0354j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3CFA6:				; CODE XREF: seg085:0359j
		or	ax, ax
		jz	short loc_3CFC6
		mov	bx, [bp-4]
		mov	eax, dword_707F8

loc_3CFB1:
		mov	[bx], eax

loc_3CFB4:
		mov	eax, dword_707FC
		mov	[bx+4],	eax
		mov	eax, dword_70800
		mov	[bx+8],	eax
		jmp	short $+2

loc_3CFC6:				; CODE XREF: seg085:0368j
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_3CFCC:				; CODE XREF: seg085:034Ej
		mov	dx, [bp+8]

loc_3CFCF:
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3CFD5:				; DATA XREF: seg339:off_6F720o
					; seg339:off_6F7ACo ...
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		cmp	word ptr [si+51h], 0
		jz	short loc_3CFFC
		push	ax
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+28h]
		add	sp, 4
		jmp	short $+2

loc_3CFFC:				; CODE XREF: seg085:03A9j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3CFFF:				; DATA XREF: seg339:265Co seg339:26E8o ...
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		cmp	word ptr [si+51h], 0
		jnz	short loc_3D01A
		jmp	loc_3D0B4
; ���������������������������������������������������������������������������

loc_3D01A:				; CODE XREF: seg085:03D5j
		mov	si, [si+51h]
		add	si, 8
		mov	eax, [si]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		mov	eax, [si+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [si+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		cmp	word ptr [bp-4], 0
		jz	short loc_3D081
		mov	ax, [bp-4]
		jmp	short loc_3D08C
; ���������������������������������������������������������������������������

loc_3D081:				; CODE XREF: seg085:043Aj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3D08C:				; CODE XREF: seg085:043Fj
		or	ax, ax
		jz	short loc_3D0AC
		mov	bx, [bp-4]

loc_3D093:
		mov	eax, [bp-0Ch]
		mov	[bx], eax
		mov	eax, [bp-14h]
		mov	[bx+4],	eax
		mov	eax, [bp-1Ch]
		mov	[bx+8],	eax
		jmp	short $+2

loc_3D0AC:				; CODE XREF: seg085:044Ej
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	short loc_3D0F0
; ���������������������������������������������������������������������������

loc_3D0B4:				; CODE XREF: seg085:03D7j
		cmp	word ptr [bp-4], 0
		jz	short loc_3D0BF
		mov	ax, [bp-4]
		jmp	short loc_3D0CA
; ���������������������������������������������������������������������������

loc_3D0BF:				; CODE XREF: seg085:0478j
		push	0Ch

loc_3D0C1:
		call	CRT_Malloc16_Retry
		pop	cx

loc_3D0C7:
		mov	[bp-4],	ax

loc_3D0CA:				; CODE XREF: seg085:047Dj
		or	ax, ax

loc_3D0CC:
		jz	short loc_3D0EA
		mov	bx, [bp-4]
		mov	eax, dword_707F8
		mov	[bx], eax
		mov	eax, dword_707FC
		mov	[bx+4],	eax
		mov	eax, dword_70800
		mov	[bx+8],	eax
		jmp	short $+2

loc_3D0EA:				; CODE XREF: seg085:loc_3D0CCj
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_3D0F0:				; CODE XREF: seg085:0472j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3D0F9:				; DATA XREF: seg339:off_6F710o
					; seg339:off_6F79Co ...
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	word ptr [si+51h], 0
		jnz	short loc_3D110
		jmp	loc_3D1A1
; ���������������������������������������������������������������������������

loc_3D110:				; CODE XREF: seg085:04CBj
		mov	eax, [di]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		mov	[bp-8],	eax
		mov	eax, [di+4]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [di+8]
		mov	edx, dword_70462
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	eax, [bp-8]
		mov	[bp-24h], eax
		mov	eax, [bp-10h]
		mov	[bp-20h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		mov	bx, [si+51h]

loc_3D181:
		mov	eax, [bp-24h]

loc_3D185:
		mov	[bx+8],	eax
		mov	eax, [bp-20h]

loc_3D18D:
		mov	[bx+0Ch], eax

loc_3D191:
		mov	eax, [bp-1Ch]
		mov	[bx+10h], eax
		mov	ax, [si+51h]
		add	ax, 8
		jmp	short $+2

loc_3D1A1:				; CODE XREF: seg085:04CDj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3D1A5:				; DATA XREF: seg339:off_6F724o
					; seg339:off_6F7B0o ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax

loc_3D1B7:
		cmp	word ptr [si+51h], 0

loc_3D1BB:
		jz	short loc_3D1D7
		push	word ptr [si+51h]

loc_3D1C0:
		push	large dword ptr	[bp-4]
		mov	bx, [si+51h]
		mov	bx, [bx]

loc_3D1C9:
		call	dword ptr [bx+2Ch]
		add	sp, 6
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	short loc_3D213
; ���������������������������������������������������������������������������

loc_3D1D7:				; CODE XREF: seg085:loc_3D1BBj
		cmp	word ptr [bp-4], 0
		jz	short loc_3D1E2
		mov	ax, [bp-4]
		jmp	short loc_3D1ED
; ���������������������������������������������������������������������������

loc_3D1E2:				; CODE XREF: seg085:059Bj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3D1ED:				; CODE XREF: seg085:05A0j
		or	ax, ax
		jz	short loc_3D20D
		mov	bx, [bp-4]
		mov	eax, dword_707F8
		mov	[bx], eax
		mov	eax, dword_707FC
		mov	[bx+4],	eax
		mov	eax, dword_70800
		mov	[bx+8],	eax
		jmp	short $+2

loc_3D20D:				; CODE XREF: seg085:05AFj
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_3D213:				; CODE XREF: seg085:0595j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3D21C:				; DATA XREF: seg339:2678o
					; seg339:off_6F7B4o ...
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		cmp	word ptr [si+51h], 0
		jz	short loc_3D243
		push	ax
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short $+2

loc_3D243:				; CODE XREF: seg085:05F0j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3D246:				; DATA XREF: seg339:off_6F714o
					; seg339:off_6F7A0o ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		cmp	word ptr [si+51h], 0
		jz	short loc_3D2A1
		mov	si, [si+51h]
		add	si, 8
		cmp	word ptr [bp-4], 0
		jz	short loc_3D26F
		mov	ax, [bp-4]
		jmp	short loc_3D27A
; ���������������������������������������������������������������������������

loc_3D26F:				; CODE XREF: seg085:0628j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_3D27A:				; CODE XREF: seg085:062Dj
		or	ax, ax
		jz	short loc_3D299
		mov	eax, [si]
		mov	bx, [bp-4]
		mov	[bx], eax
		mov	eax, [si+4]
		mov	[bx+4],	eax
		mov	eax, [si+8]
		mov	[bx+8],	eax
		jmp	short $+2

loc_3D299:				; CODE XREF: seg085:063Cj
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	short loc_3D2DD
; ���������������������������������������������������������������������������

loc_3D2A1:				; CODE XREF: seg085:061Cj
		cmp	word ptr [bp-4], 0
		jz	short loc_3D2AC
		mov	ax, [bp-4]
		jmp	short loc_3D2B7
; ���������������������������������������������������������������������������

loc_3D2AC:				; CODE XREF: seg085:0665j
		push	0Ch

loc_3D2AE:
		call	CRT_Malloc16_Retry

loc_3D2B3:
		pop	cx
		mov	[bp-4],	ax

loc_3D2B7:				; CODE XREF: seg085:066Aj
		or	ax, ax
		jz	short loc_3D2D7

loc_3D2BB:
		mov	bx, [bp-4]

loc_3D2BE:
		mov	eax, dword_707F8

loc_3D2C2:
		mov	[bx], eax

loc_3D2C5:
		mov	eax, dword_707FC

loc_3D2C9:
		mov	[bx+4],	eax
		mov	eax, dword_70800

loc_3D2D1:
		mov	[bx+8],	eax

loc_3D2D5:
		jmp	short $+2

loc_3D2D7:				; CODE XREF: seg085:0679j
		mov	dx, [bp-2]
		mov	ax, [bp-4]

loc_3D2DD:				; CODE XREF: seg085:065Fj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3D2E6:				; DATA XREF: seg339:off_6F718o
					; seg339:off_6F7A4o ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	word ptr [si+51h], 0
		jz	short loc_3D319
		mov	eax, [di]
		mov	bx, [si+51h]
		mov	[bx+8],	eax
		mov	eax, [di+4]
		mov	[bx+0Ch], eax
		mov	eax, [di+8]
		mov	[bx+10h], eax
		mov	ax, [si+51h]
		add	ax, 8
		jmp	short $+2

loc_3D319:				; CODE XREF: seg085:06B5j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE INTEGRALEMENT (2026-09-25). Ex-'Camera_ComputeMountedPosition' (FAUX). INTEGRATION
; DU MOUVEMENT de l'objet monde, methode +0x14 (pour l'avion : loc_3E115, vtable seg339
; off_6F880). (1) POSITION : WorldObject_TranslateBy_37D54(objet, vitesse du corps (+0x51 ->
; +8) * dword_7045E). (2) ORIENTATION : Omega = corps->vtable+0x2C (pour JDYN : thunk
; loc_3B6DC -> loc_46B74 = copie de JDYN+4/+8/+0x0C, la vitesse angulaire) ;
; objet->vtable+0x30(Omega * dword_70458) (avion :
; WorldObject_ComposeOrientationAngleArray_3CB0B, rotation de l'orientation par ces
; increments) ; puis avec theta = Omega.c1 * dt : Omega.c2' = Omega.c2 cos + Omega.c0 sin,
; Omega.c0' = Omega.c0 cos - Omega.c2 sin (Math_CosRaw_580A7 / Math_SinRaw_58063 /
; Math_FixedMultiply_58034) ; corps->vtable+0x30(Omega') (JDYN : loc_3B6C5 -> loc_46BC0, ecrit
; JDYN+4/+8/+0x0C). Sans corps : vecteur nul (dword_707F8..70800). Deux pas de temps
; differents : dword_7045E pour la position, dword_70458 pour la rotation (relation non
; tracee).
; ==============================================================================================
WorldObject_IntegrateBodyMotion_3D31D	proc far		; CODE XREF: seg087:0250P
					; DATA XREF: seg339:off_6F6DCo	...

var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
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
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+51h], 0
		jz	short loc_3D3A9
		mov	di, [si+51h]
		add	di, 8
		mov	eax, [di]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_50], eax

loc_3D392:
		mov	eax, [bp+var_10]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_48], eax
		mov	dx, ss
		lea	ax, [bp+var_50]
		jmp	short loc_3D3C6
; ���������������������������������������������������������������������������

loc_3D3A9:				; CODE XREF: WorldObject_IntegrateBodyMotion_3D31D+Fj
		mov	eax, dword_707F8
		mov	[bp+var_50], eax
		mov	eax, dword_707FC
		mov	[bp+var_4C], eax
		mov	eax, dword_70800
		mov	[bp+var_48], eax

loc_3D3C1:
		mov	dx, ss

loc_3D3C3:
		lea	ax, [bp+var_50]

loc_3D3C6:				; CODE XREF: WorldObject_IntegrateBodyMotion_3D31D+8Aj
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	si
		call	WorldObject_TranslateBy_37D54
		add	sp, 8
		cmp	word ptr [si+51h], 0
		jz	short loc_3D3FB
		push	word ptr [si+51h]
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 6
		mov	dx, ss
		lea	ax, [bp+var_5C]
		jmp	short loc_3D418
; ���������������������������������������������������������������������������

loc_3D3FB:				; CODE XREF: WorldObject_IntegrateBodyMotion_3D31D+C2j
		mov	eax, dword_707F8
		mov	[bp+var_5C], eax
		mov	eax, dword_707FC
		mov	[bp+var_58], eax
		mov	eax, dword_70800
		mov	[bp+var_54], eax
		mov	dx, ss
		lea	ax, [bp+var_5C]

loc_3D418:				; CODE XREF: WorldObject_IntegrateBodyMotion_3D31D+DCj
		mov	eax, [bp+var_54]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_5C]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_58]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_54]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]

loc_3D483:
		mov	[bp+var_68], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_60], eax
		lea	di, [bp+var_20]
		mov	eax, [di]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		push	eax
		call	Math_SinRaw_58063
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_44], eax

loc_3D4BF:
		push	large [bp+var_40]
		call	Math_CosRaw_580A7
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_40], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		push	large [bp+var_44]
		push	large [bp+var_1C]
		call	Math_FixedMultiply_58034
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		add	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		push	large [bp+var_44]
		push	large [bp+var_3C]
		call	Math_FixedMultiply_58034
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		sub	[bp+var_1C], eax
		lea	ax, [bp+var_68]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+30h]
		add	sp, 4
		mov	eax, [bp+var_1C]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_54], eax
		cmp	word ptr [si+51h], 0
		jz	short loc_3D562
		lea	ax, [bp+var_5C]
		push	ax
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short $+2

loc_3D562:				; CODE XREF: WorldObject_IntegrateBodyMotion_3D31D+22Fj
		pop	di
		pop	si
		leave
		retf
WorldObject_IntegrateBodyMotion_3D31D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,19L — positionne un flag (+0x53) si la cible référencée (+0xE) a un indicateur actif
; (+0x38) : activation conditionnelle du mode caméra suiveuse selon l'état de la cible.
; ==============================================================================================
Camera_EnableFollowIfActive	proc far		; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+173P
					; Gauge_ComputeAndRenderNeedle_9D910:loc_9DCEEP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [si+0Eh]
		cmp	byte ptr es:[bx+38h], 0
		jz	short loc_3D57B
		mov	byte ptr [si+53h], 1

loc_3D57B:				; CODE XREF: Camera_EnableFollowIfActive+Fj
		pop	si
		pop	bp
		retf
Camera_EnableFollowIfActive	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 437 L. NOM PRÉCÉDENT (Camera_ChaseComputeMain) FAUX — ce n'est PAS le calcul de la
; caméra de poursuite. Relu 2026-09-06 : MAJ par frame d'un émetteur ancré sur l'avion. Abort
; si obj[+0x53]==0 / es:[[obj+0x0A]+8]==0 / word_70483==0. Charge S = { *(entity+0x3A),
; *(entity+0x3E), *(entity+0x42) } = le vec3 écrit par le chunk IFF SMOK du modèle
; (JDYN_LoadAngleAndChunk_9D189, ovr310 : SeekAndRead('SMOK') -> u8 +0x39 puis 3× u32
; +0x3A/+0x3E/+0x42 ; F-16 = (0,-3584,0) = (0,-14,0) en 24.8). Calcule 2 points =
; obj.pos(+0x12) + orientation·S [+ pos_ancre×dword_7045E/256], orientation = ligne obj+0x38
; (branche S.x!=0&&S.z!=0) ou matrice obj+0x2C / de l'ancre. Passe les 2 points + obj[+0x54] +
; word_70483 à Elements_SpawnAlongSegment_4D1C9. Appelée depuis Camera_ExternalUpdate
; (sub_3D9B4) et sub_3DA0B. Rôle exact de SMOK non confirmé.
; ==============================================================================================
Emitter_UpdateFromEntitySMOKVec_3D57E	proc far		; CODE XREF: Camera_ExternalUpdate_3D9B4+28p
					; WorldObject_UpdateWithAIEntity_3D9FB:loc_3DACEp	...

var_F0		= dword	ptr -0F0h
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
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
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_3D581:
		sub	sp, 0E8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+53h], 0
		jnz	short loc_3D593
		jmp	loc_3D9B0
; ���������������������������������������������������������������������������

loc_3D593:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+10j
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_3D5A0
		jmp	loc_3D9B0
; ���������������������������������������������������������������������������

loc_3D5A0:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+1Dj
		cmp	word_70483, 0
		jnz	short loc_3D5AA
		jmp	loc_3D9B0
; ���������������������������������������������������������������������������

loc_3D5AA:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+27j
		cmp	word ptr [si+51h], 0
		jz	short loc_3D62B

loc_3D5B0:
		mov	di, [si+51h]

loc_3D5B3:
		add	di, 8

loc_3D5B6:
		mov	eax, [di]

loc_3D5B9:
		mov	edx, dword_7045E

loc_3D5BE:
		imul	edx

loc_3D5C1:
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax

loc_3D5D2:
		mov	eax, [di+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_50], eax
		mov	dx, ss
		lea	ax, [bp+var_58]
		jmp	short loc_3D648
; ���������������������������������������������������������������������������

loc_3D62B:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+30j
		mov	eax, dword_707F8
		mov	[bp+var_58], eax
		mov	eax, dword_707FC
		mov	[bp+var_54], eax
		mov	eax, dword_70800
		mov	[bp+var_50], eax
		mov	dx, ss
		lea	ax, [bp+var_58]

loc_3D648:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+ABj
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_1C+2],	ax
		mov	word ptr [bp+var_1C], dx
		les	di, [bp+var_1C]
		mov	eax, es:[di]
		mov	[bp+var_64], eax
		mov	eax, es:[di+4]
		mov	[bp+var_60], eax
		mov	eax, es:[di+8]
		mov	[bp+var_5C], eax
		cmp	[bp+var_64], 0
		jnz	short loc_3D680
		mov	ax, 1
		jmp	short loc_3D682
; ���������������������������������������������������������������������������

loc_3D680:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+FBj
		xor	ax, ax

loc_3D682:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+100j
		or	al, al
		jnz	short loc_3D689
		jmp	loc_3D7CD
; ���������������������������������������������������������������������������

loc_3D689:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+106j
		cmp	[bp+var_5C], 0
		jnz	short loc_3D695
		mov	ax, 1
		jmp	short loc_3D697
; ���������������������������������������������������������������������������

loc_3D695:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+110j
		xor	ax, ax

loc_3D697:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+115j
		or	al, al
		jnz	short loc_3D69E
		jmp	loc_3D7CD
; ���������������������������������������������������������������������������

loc_3D69E:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+11Bj
		mov	di, si
		add	di, 38h	; '8'
		mov	eax, [di]
		mov	edx, [bp+var_60]
		imul	edx

loc_3D6AD:
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [di+4]

loc_3D6C2:
		mov	edx, [bp+var_60]

loc_3D6C6:
		imul	edx

loc_3D6C9:
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_68], eax
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_70]
		mov	[bp+var_7C], eax
		mov	eax, [di+4]
		add	eax, [bp+var_6C]
		mov	[bp+var_78], eax
		mov	eax, [di+8]
		add	eax, [bp+var_68]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_58]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_48]
		add	eax, [bp+var_54]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_44]
		add	eax, [bp+var_50]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_98], eax

loc_3D7AF:
		mov	eax, [bp+var_A0]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_3C], eax

loc_3D7C1:
		mov	eax, [bp+var_98]
		mov	[bp+var_38], eax
		jmp	loc_3D98A
; ���������������������������������������������������������������������������

loc_3D7CD:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+108j
					; Emitter_UpdateFromEntitySMOKVec_3D57E+11Dj
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	word ptr [bp+var_20+2],	ax
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		cmp	word ptr [si+51h], 0
		jz	short loc_3D805
		push	word ptr [si+51h]
		push	ss
		lea	ax, [bp+var_94]
		push	ax
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	dx, ss
		lea	ax, [bp+var_94]
		jmp	short loc_3D826
; ���������������������������������������������������������������������������

loc_3D805:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+269j
		mov	eax, dword_707F8
		mov	[bp+var_94], eax
		mov	eax, dword_707FC
		mov	[bp+var_90], eax
		mov	eax, dword_70800
		mov	[bp+var_8C], eax
		mov	dx, ss
		lea	ax, [bp+var_94]

loc_3D826:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+285j
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		call	WorldObject_BuildOrientationMatrix_56E8A
		add	sp, 4
		mov	eax, [bp+var_64]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_98], eax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_64]
		mov	[bp+var_AC], eax
		mov	eax, [di+4]
		add	eax, [bp+var_60]
		mov	[bp+var_A8], eax
		mov	eax, [di+8]
		add	eax, [bp+var_5C]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B8]

loc_3D8B3:
		mov	[bp+var_4C], eax

loc_3D8B7:
		mov	eax, [bp+var_B4]

loc_3D8BC:
		mov	[bp+var_48], eax

loc_3D8C0:
		mov	eax, [bp+var_B0]
		mov	[bp+var_44], eax
		lea	ax, [bp+var_88]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_A0]
		mov	[bp+var_C4], eax
		mov	eax, [di+4]
		add	eax, [bp+var_9C]
		mov	[bp+var_C0], eax
		mov	eax, [di+8]
		add	eax, [bp+var_98]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_D0]
		add	eax, [bp+var_58]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_CC]
		add	eax, [bp+var_54]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_C8]
		add	eax, [bp+var_50]
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_38], eax

loc_3D98A:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+24Cj
		sub	sp, 4
		mov	eax, dword_70458
		mov	[bp+var_F0], eax
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		mov	al, [si+54h]
		mov	ah, 0
		push	ax
		push	word_70483
		call	Elements_SpawnAlongSegment_4D1C9
		add	sp, 0Ch

loc_3D9B0:				; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+12j
					; Emitter_UpdateFromEntitySMOKVec_3D57E+1Fj ...
		pop	di
		pop	si
		leave
		retf
Emitter_UpdateFromEntitySMOKVec_3D57E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — teste l'état détruit puis délègue soit à un point de montage caméra (+0x51,
; vtable[0x3C]) soit au calcul complet (sub_3D57E) : mise à jour de la caméra externe (avec ou
; sans point de montage fixe).
; ==============================================================================================
Camera_ExternalUpdate_3D9B4	proc far		; CODE XREF: seg089:078AP
					; seg089:loc_41B6FP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	WorldObject_IsAlive_3CBB7

loc_3D9C1:
		pop	cx

loc_3D9C2:
		or	al, al
		jz	short loc_3D9E4

loc_3D9C6:
		cmp	word ptr [si+51h], 0
		jz	short loc_3D9DA
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		jmp	short $+2

loc_3D9DA:				; CODE XREF: Camera_ExternalUpdate_3D9B4+16j
		push	si
		push	cs
		call	near ptr Emitter_UpdateFromEntitySMOKVec_3D57E
		pop	cx
		mov	al, 1
		jmp	short loc_3D9E6
; ���������������������������������������������������������������������������

loc_3D9E4:				; CODE XREF: Camera_ExternalUpdate_3D9B4+10j
		mov	al, 0

loc_3D9E6:				; CODE XREF: Camera_ExternalUpdate_3D9B4+2Ej
		pop	si
		pop	bp
		retf
Camera_ExternalUpdate_3D9B4	endp

; ���������������������������������������������������������������������������

loc_3D9E9:				; DATA XREF: seg339:off_6F6E4o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3D9F1:				; DATA XREF: seg339:off_6F6FCo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 4
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, slot +0x10 de la classe d'objet monde dont la vtable commence en seg339:0x2618 (posée
; par WorldObject_ConstructWithAIEntity_9D2CC). Appelée pour chaque objet par
; WorldObjects_UpdateAllAndRemoveDead_221F2. Séquence : (1) WorldObject_IsAlive_3CBB7 ; si 0 →
; renvoie 0 (l'objet sera retiré). (2) Si byte_6D558 (pilotage automatique) == 0 : appelle
; AIEntity_MasterTick_5ACC (slot +0xC de l'entité pointée par +0x55) ; si l'octet +0x59 == 0,
; appelle ensuite le slot +8 de l'entité (loc_4F85, pas lu) et passe son résultat au slot
; +0x40 de l'objet à +0x51 (pas identifié). (3) Si byte_6D558 != 0 : pas de tick IA, seulement
; slot +8 puis slot +0x40. (4) Emitter_UpdateFromEntitySMOKVec_3D57E(objet), renvoie 1
; (vivant). Anciennement Camera_LookAtSecondaryTarget (nom de caméra sans rapport avec le
; corps).
; ==============================================================================================
WorldObject_UpdateWithAIEntity_3D9FB	proc far		; CODE XREF: Camera_ResolvePositionVelocity_3DDC4:loc_3DDCFP
					; DATA XREF: seg339:off_6F6D8o

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	WorldObject_IsAlive_3CBB7
		pop	cx
		or	al, al
		jnz	short loc_3DA13
		jmp	loc_3DAD6
; ���������������������������������������������������������������������������

loc_3DA13:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+13j
		cmp	byte_6D558, 0
		jz	short loc_3DA57
		cmp	dword ptr [si+55h], 0
		jz	short loc_3DA33
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3DA37
; ���������������������������������������������������������������������������

loc_3DA33:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+24j
		xor	dx, dx
		xor	ax, ax

loc_3DA37:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+36j
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	word ptr [si+51h], 0
		jz	short loc_3DA55
		push	dx
		push	ax
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 6
		jmp	short loc_3DACC
; ���������������������������������������������������������������������������

loc_3DA55:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+46j
		jmp	short loc_3DACC
; ���������������������������������������������������������������������������

loc_3DA57:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+1Dj
		cmp	byte ptr [si+59h], 0
		jz	short loc_3DA78
		cmp	dword ptr [si+55h], 0
		jz	short loc_3DA76
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_3DACC
; ���������������������������������������������������������������������������

loc_3DA76:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+67j
		jmp	short loc_3DACC
; ���������������������������������������������������������������������������

loc_3DA78:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+60j
		cmp	dword ptr [si+55h], 0
		jz	short loc_3DA91
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_3DA91:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+82j
		cmp	dword ptr [si+55h], 0
		jz	short loc_3DAAA
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3DAAE
; ���������������������������������������������������������������������������

loc_3DAAA:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+9Bj
		xor	dx, dx
		xor	ax, ax

loc_3DAAE:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+ADj
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		cmp	word ptr [si+51h], 0
		jz	short loc_3DACC
		push	dx
		push	ax
		push	word ptr [si+51h]
		mov	bx, [si+51h]

loc_3DAC2:
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 6
		jmp	short $+2

loc_3DACC:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+58j
					; WorldObject_UpdateWithAIEntity_3D9FB:loc_3DA55j	...
		push	si
		push	cs

loc_3DACE:
		call	near ptr Emitter_UpdateFromEntitySMOKVec_3D57E
		pop	cx

loc_3DAD2:
		mov	al, 1
		jmp	short loc_3DAD8
; ���������������������������������������������������������������������������

loc_3DAD6:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+15j
		mov	al, 0

loc_3DAD8:				; CODE XREF: WorldObject_UpdateWithAIEntity_3D9FB+D9j
		pop	si
		leave
		retf
WorldObject_UpdateWithAIEntity_3D9FB	endp

; ���������������������������������������������������������������������������

loc_3DADB:				; DATA XREF: seg339:off_6F5BCo
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,49L — destructeur (type 0x2504) notifiant un sous-composant (+0x35) puis nettoyage
; générique (sub_6C009) : destructeur de composant caméra externe simple.
; ==============================================================================================
Camera_DestructSimple	proc far		; CODE XREF: seg083:1058P seg104:0178P
					; DATA XREF: ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3DB45
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2504h
		cmp	word ptr es:[bx+35h], 0
		jz	short loc_3DB16
		push	3
		push	word ptr es:[bx+35h]
		mov	bx, es:[bx+35h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_3DB16:				; CODE XREF: Camera_DestructSimple+1Ej
		push	0
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_3DB45
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_3DB45:				; CODE XREF: Camera_DestructSimple+Fj
					; Camera_DestructSimple+46j
		pop	si
		leave
		retf
Camera_DestructSimple	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — positionne un flag (+4 bit2) : marqueur 'caméra à recalculer'.
; ==============================================================================================
Camera_MarkRecalc	proc far		; CODE XREF: Camera_AttachSubcomponent+16p
					; Decoy_ConstructInstance_9C85A+4BP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+4], 4
		pop	si
		pop	bp
		retf
Camera_MarkRecalc	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — attache un sous-composant (sub_37C89) puis marque le recalcul (sub_3DB48) :
; attachement d'un sous-composant caméra avec invalidation du cache.
; ==============================================================================================
Camera_AttachSubcomponent	proc far		; CODE XREF: seg104:00D2P Decoy_AttachAndStartLifetime_9C90B+FP ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		push	si
		push	cs
		call	near ptr Camera_MarkRecalc
		pop	cx
		pop	si
		pop	bp
		retf
Camera_AttachSubcomponent	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — destructeur (type 0x1BDE) notifiant (+0x2C, vtable[0xC]) puis nettoyage
; (sub_6BFBA) : destructeur de caméra de suivi.
; ==============================================================================================
Camera_DestructFollow	proc far		; CODE XREF: seg095:01C3P seg104:03CCP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3DBB6
		mov	word ptr [si], 1BDEh
		cmp	word ptr [si+2Ch], 0
		jz	short loc_3DB9E
		push	3
		push	word ptr [si+2Ch]
		mov	bx, [si+2Ch]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_3DB9E:				; CODE XREF: Camera_DestructFollow+17j
		push	0
		push	si
		call	VROOMM_StubThunk_6BFBA
		add	sp, 4
		test	di, 1
		jz	short loc_3DBB6
		push	si
		call	CRT_FreeNear_Wrap

loc_3DBB5:
		pop	cx

loc_3DBB6:				; CODE XREF: Camera_DestructFollow+Dj
					; Camera_DestructFollow+3Aj
		pop	di
		pop	si
		pop	bp
		retf
Camera_DestructFollow	endp

; ���������������������������������������������������������������������������

loc_3DBBA:				; DATA XREF: seg339:2534o
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,55L — destructeur (type 0x252C) similaire, notifie (+0x36, vtable[0xC]) : destructeur
; d'un second type de composant caméra.
; ==============================================================================================
Camera_DestructTypeB	proc far		; CODE XREF: Camera_DestructTypeC+3Ep
					; Targeting_DestructComponent+1FP ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_3DBC8:
		mov	si, [bp+arg_4]

loc_3DBCB:
		cmp	[bp+arg_0], 0
		jz	short loc_3DC24

loc_3DBD2:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 252Ch
		cmp	word ptr es:[bx+36h], 0
		jz	short loc_3DBF5
		push	3
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_3DBF5:				; CODE XREF: Camera_DestructTypeB+1Ej
		push	0
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_3DC24
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_3DC24:				; CODE XREF: Camera_DestructTypeB+Fj
					; Camera_DestructTypeB+46j
		pop	si
		leave
		retf
Camera_DestructTypeB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,16L — remet à zéro deux flags d'état (+0x53/+0x54) et positionne le flag de recalcul (+4
; bit2) : reset de l'état de la caméra externe (invalidation complète).
; ==============================================================================================
Camera_ResetState	proc far		; CODE XREF: Camera_InitAttachedWithTarget_3DC3D+3Fp
					; WorldObject_ConstructWithAIEntity_9D2CC+2EP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+53h], 0
		mov	byte ptr [si+54h], 0
		or	byte ptr [si+4], 4
		pop	si
		pop	bp
		retf
Camera_ResetState	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — attache un sous-composant (sub_37C89), copie un identifiant de cible (+0x35),
; reset (sub_3DC27), copie un flag depuis la cible référencée (+0xE→+0x54) : initialisation de
; la caméra externe attachée avec copie de paramètres cible.
; ==============================================================================================
Camera_InitAttachedWithTarget_3DC3D	proc far		; CODE XREF: Camera_InitWithSecondaryTarget+Dp Targeting_InitWithFlags+CP ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]
		mov	[si+50h], al
		push	si
		push	cs
		call	near ptr Camera_ResetState
		pop	cx
		les	bx, [si+0Eh]
		mov	al, es:[bx+39h]
		mov	[si+54h], al
		pop	si
		leave
		retf
Camera_InitAttachedWithTarget_3DC3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,51L — destructeur (type 0x26A4) notifiant le point de montage (+0x51, vtable[0xC]) :
; destructeur du composant caméra avec point de montage.
; ==============================================================================================
Camera_DestructWithMount	proc far		; CODE XREF: Camera_DestructSecondaryTarget+32p
					; Targeting_DestructWithWeakRefs+2EP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3DCD0
		mov	word ptr [si], 26A4h
		cmp	word ptr [si+51h], 0
		jz	short loc_3DCB8
		push	3
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]

loc_3DCB3:
		add	sp, 4
		jmp	short $+2

loc_3DCB8:				; CODE XREF: Camera_DestructWithMount+17j
		push	0
		push	si
		call	WorldObject_BaseDestruct

loc_3DCC0:
		add	sp, 4

loc_3DCC3:
		test	di, 1
		jz	short loc_3DCD0
		push	si

loc_3DCCA:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_3DCD0:				; CODE XREF: Camera_DestructWithMount+Dj
					; Camera_DestructWithMount+3Aj
		pop	di
		pop	si
		pop	bp
		retf
Camera_DestructWithMount	endp

; ���������������������������������������������������������������������������

loc_3DCD4:				; DATA XREF: seg339:off_6F5A8o
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — destructeur (type 0x24F0) notifiant un sous-composant far (+0x46, vtable[4]) :
; destructeur d'un troisième type de composant caméra (référence far).
; ==============================================================================================
Camera_DestructTypeC	proc far		; CODE XREF: Camera_DestructCompoundA+2EP
					; DATA XREF: seg339:off_6F5A0o

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3DD40
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 24F0h
		cmp	dword ptr es:[bx+46h], 0
		jz	short loc_3DD12
		push	3
		push	large dword ptr	es:[bx+46h]
		les	bx, es:[bx+46h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short $+2

loc_3DD12:				; CODE XREF: Camera_DestructTypeC+1Fj
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr Camera_DestructTypeB
		add	sp, 6
		test	si, 1
		jz	short loc_3DD40
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_3DD40:				; CODE XREF: Camera_DestructTypeC+Fj
					; Camera_DestructTypeC+48j
		pop	si
		leave
		retf
Camera_DestructTypeC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,15L — remet à zéro un flag (+0x59) et positionne le flag de recalcul (+4 bit6) : reset
; partiel de l'état caméra (mode cible secondaire).
; ==============================================================================================
Camera_ResetSecondaryFlag	proc far		; CODE XREF: Camera_InitWithSecondaryTarget+15p
					; Camera_ConstructWithSecondaryFlag_9D3BA+41P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+59h], 0
		or	byte ptr [si+4], 40h
		pop	si
		pop	bp
		retf
Camera_ResetSecondaryFlag	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,23L — attache (sub_3DC3D) puis reset (sub_3DD43) : initialisation complète de la caméra
; avec cible secondaire.
; ==============================================================================================
Camera_InitWithSecondaryTarget	proc far		; CODE XREF: Camera_InitAndGetHandle+CP
					; WorldObject_ConstructWithAIEntity_9D2CC+45P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Camera_InitAttachedWithTarget_3DC3D
		add	sp, 6
		push	si
		push	cs
		call	near ptr Camera_ResetSecondaryFlag
		pop	cx
		pop	si
		pop	bp
		retf
Camera_InitWithSecondaryTarget	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — destructeur (type 0x2618) notifiant une référence far (+0x55, vtable[4]) :
; destructeur du composant caméra avec cible secondaire.
; ==============================================================================================
Camera_DestructSecondaryTarget	proc far		; CODE XREF: Camera_DestructCompoundB+24P
					; DATA XREF: seg339:off_6F6E0o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3DDB6
		mov	word ptr [si], 2618h
		cmp	dword ptr [si+55h], 0
		jz	short loc_3DD9F
		push	3
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short $+2

loc_3DD9F:				; CODE XREF: Camera_DestructSecondaryTarget+18j
		push	0
		push	si
		push	cs
		call	near ptr Camera_DestructWithMount
		add	sp, 4
		test	di, 1
		jz	short loc_3DDB6
		push	si

loc_3DDB0:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_3DDB6:				; CODE XREF: Camera_DestructSecondaryTarget+Dj
					; Camera_DestructSecondaryTarget+3Cj
		pop	di
		pop	si
		pop	bp
		retf
Camera_DestructSecondaryTarget	endp

seg085		ends
