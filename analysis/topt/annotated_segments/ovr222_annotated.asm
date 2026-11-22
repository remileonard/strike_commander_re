ovr222		segment	para public 'OVERLAY' use16
		assume cs:ovr222
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9C70		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		push	31h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_B9C9B
		push	di
		call	sub_2A4FF
		add	sp, 2
		mov	ax, di
		jmp	short loc_B9C9D

loc_B9C9B:
		mov	ax, di

loc_B9C9D:
		mov	[si+26h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		add	sp, 2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_B9C70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9CB6		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		push	31h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_B9CE8
		push	[bp+var_2]
		call	sub_2A4FF
		add	sp, 2
		mov	ax, [bp+var_2]
		jmp	short loc_B9CEB

loc_B9CE8:
		mov	ax, [bp+var_2]

loc_B9CEB:
		mov	[si+26h], ax
		cmp	word ptr [si+26h], 0
		jz	short loc_B9D22
		mov	ax, si
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si+26h]
		mov	[bx+24h], eax
		mov	eax, [di+4]
		mov	bx, [si+26h]
		mov	[bx+28h], eax
		mov	eax, [di+8]
		mov	bx, [si+26h]
		mov	[bx+2Ch], eax
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 1

loc_B9D22:
		mov	ax, [si+24h]
		add	ax, 12h
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		sub	[si+12h], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+4]
		sub	[si+16h], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+8]
		sub	[si+1Ah], eax
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_B9D79
		push	word ptr [si+1Eh]
		call	sub_25A93
		add	sp, 2

loc_B9D79:
		pop	di
		pop	si
		leave
		retf
sub_B9CB6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9D7D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_25FAC
		add	sp, 2
		mov	di, ax
		mov	eax, [di]
		mov	[si+12h], eax
		mov	eax, [di+4]
		mov	[si+16h], eax
		mov	eax, [di+8]
		mov	[si+1Ah], eax
		push	word ptr [si+26h]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+26h], 0
		mov	word ptr [si+24h], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_B9D7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9DC0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_B9E00
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_B9DFB
		push	di
		call	sub_1109C
		add	sp, 2
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_B9DFD

loc_B9DFB:
		mov	ax, di

loc_B9DFD:
		mov	[si+1Eh], ax

loc_B9E00:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_B9E34
		mov	bx, [bp+arg_2]
		mov	[bx+24h], si
		push	si
		push	[bp+arg_2]
		push	cs
		call	near ptr sub_B9C70
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	word ptr [si+1Eh]
		call	List_AppendTail_25970
		add	sp, 4
		push	si
		call	sub_25EE5
		add	sp, 2

loc_B9E34:
		pop	di
		pop	si
		leave
		retf
sub_B9DC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Debris_ContainerOpWrapper_C2578 (sub_C2578 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_ContainerOpWrapper_9B62B (sub_9B62B de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle une opération de
; conteneur (Container_RemoveAndDeleteObject_22DE5).
; ==============================================================================================
Debris_ContainerOpWrapper_B9E38		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_B9E53
		push	[bp+arg_2]
		push	word ptr [si+1Eh]
		call	sub_25B51
		add	sp, 4

loc_B9E53:
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapper_B9E38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9E56		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_B9EA5
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_B9EA0
		push	di
		call	sub_1109C
		add	sp, 2
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_B9EA2

loc_B9EA0:
		mov	ax, di

loc_B9EA2:
		mov	[si+1Eh], ax

loc_B9EA5:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_B9EBF
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	word ptr [si+1Eh]
		call	List_AppendTail_25970
		add	sp, 4

loc_B9EBF:
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	sub_24FC5
		add	sp, 4
		push	si
		call	sub_25EE5
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_B9E56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9EDA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	bx, [di]
		call	dword ptr [bx+24h]
		add	sp, 2
		push	di
		push	[bp+arg_4]
		call	sub_24B7F
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_B9F0C
		push	di
		push	word ptr [si+1Eh]
		call	sub_25C6E
		add	sp, 4

loc_B9F0C:
		pop	di
		pop	si
		pop	bp
		retf
sub_B9EDA		endp
ovr222		ends
