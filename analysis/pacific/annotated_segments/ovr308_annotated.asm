ovr308		segment	para public 'OVERLAY' use16
		assume cs:ovr308
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 29 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_ConstructWithHandle_9D610 (sub_9D610 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 164 lignes, NON DÉTAILLÉE — combine allocation, WorldObject_BaseConstruct,
; Camera_ResetState/ResetSecondaryFlag/GetHandle.
; ==============================================================================================
Camera_ConstructWithHandle_ADC50		proc far

var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	7Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_ADCDC
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	dword ptr [si+5Ah], 0
		mov	word ptr [si], 1FC4h
		push	si
		call	Camera_ResetSecondaryFlag
		pop	cx
		mov	dword ptr [si+5Fh], 0
		mov	word ptr [si], 217Ch
		push	si
		call	sub_3C700
		pop	cx
		mov	dword ptr [si+63h], 0
		mov	word ptr [si], 2210h
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+6Ch], eax
		mov	word ptr [si+73h], 0
		push	large [bp+var_4]
		push	si
		call	sub_743E5
		add	sp, 6
		mov	ax, si
		jmp	short loc_ADCDE

loc_ADCDC:
		mov	ax, si

loc_ADCDE:
		mov	si, ax
		or	si, si
		jnz	short loc_ADCE7
		jmp	loc_ADDA8

loc_ADCE7:
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+59h], 0
		jz	short loc_ADD1F
		push	si
		push	large es:[bx+59h]
		les	bx, es:[bx+59h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+5Ah], eax

loc_ADD1F:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+49h], 0
		jz	short loc_ADD40
		push	si
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], ax
		mov	[si+52h], ax

loc_ADD40:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+5Dh], 0
		jz	short loc_ADD67
		push	si
		push	large es:[bx+5Dh]
		call	sub_74543
		add	sp, 6
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[si+5Fh], eax

loc_ADD67:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+61h], 0
		jz	short loc_ADD8E
		push	si
		push	large es:[bx+61h]
		call	sub_7425F
		add	sp, 6
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[si+63h], eax

loc_ADD8E:
		push	large [bp+arg_0]
		push	si
		call	sub_7447A
		add	sp, 6
		push	large [bp+arg_0]
		push	si
		call	sub_74475
		add	sp, 6

loc_ADDA8:
		mov	ax, si
		pop	si
		leave
		retf
Camera_ConstructWithHandle_ADC50		endp
ovr308		ends
