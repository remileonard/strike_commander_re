ovr305		segment	para public 'OVERLAY' use16
		assume cs:ovr305
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD8D0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_74384
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_74575
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_AD8D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 18 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_ConstructWithSecondaryFlag_9D3BA (sub_9D3BA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocation, WorldObject_BaseConstruct,
; Camera_ResetState/ResetSecondaryFlag/InitAndGetHandle.
; ==============================================================================================
Camera_ConstructWithSecondaryFlag_AD8FA		proc far

var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	63h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AD95E
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
		push	large [bp+var_4]
		push	si
		call	Camera_InitAndGetHandle
		add	sp, 6
		mov	ax, si
		jmp	short loc_AD960

loc_AD95E:
		mov	ax, si

loc_AD960:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		push	si
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+59h]
		les	bx, es:[bx+59h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+5Ah], eax
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+52h], ax
		push	si
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+5Dh]
		call	sub_74543
		add	sp, 6
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[si+5Fh], eax
		mov	ax, si
		pop	si
		leave
		retf
Camera_ConstructWithSecondaryFlag_AD8FA		endp
ovr305		ends
