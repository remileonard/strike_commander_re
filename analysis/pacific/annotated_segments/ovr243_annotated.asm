ovr243		segment	para public 'OVERLAY' use16
		assume cs:ovr243
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 15 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_ReadMouseAndAxes_7AAF0 (sub_7AAF0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 171 lignes, NON DÉTAILLÉE — combine Input_GetCalibratedYValue_67499/XValue_67481 (seg205),
; TextScroll_ApplyHelperC_671E4 (seg204), Mouse_InitAndRead — lecture combinée souris/axes
; calibrés.
; ==============================================================================================
Input_ReadMouseAndAxes_8A700		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7D3B8, 0
		jnz	short loc_8A714
		jmp	loc_8A879

loc_8A714:
		call	sub_6F5D8
		sub	ax, word_775E7
		movsx	eax, ax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 5
		jle	short loc_8A762
		sub	[bp+var_4], 5
		mov	ax, [si+142h]
		mov	[bp+var_6], ax

loc_8A738:
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_4], edx
		mov	ebx, 5Fh
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		jmp	short loc_8A77F

loc_8A762:
		cmp	[bp+var_4], 0FFFFFFFBh
		jge	short loc_8A777
		add	[bp+var_4], 5
		mov	ax, [si+140h]
		mov	[bp+var_8], ax
		jmp	short loc_8A738

loc_8A777:
		mov	[bp+var_4], 0

loc_8A77F:
		call	sub_6F5C0
		mov	dx, word_775E5
		sub	dx, ax
		movsx	eax, dx
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0Ah
		jle	short loc_8A7CF
		sub	[bp+var_C], 0Ah
		mov	ax, [si+146h]
		mov	[bp+var_E], ax

loc_8A7A5:
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	edx, [bp+var_C]
		imul	edx, eax
		mov	[bp+var_C], edx
		mov	ebx, 136h
		mov	eax, [bp+var_C]
		cdq
		idiv	ebx
		mov	[bp+var_C], eax
		jmp	short loc_8A7EC

loc_8A7CF:
		cmp	[bp+var_C], 0FFFFFFF6h
		jge	short loc_8A7E4
		add	[bp+var_C], 0Ah
		mov	ax, [si+144h]
		mov	[bp+var_10], ax
		jmp	short loc_8A7A5

loc_8A7E4:
		mov	[bp+var_C], 0

loc_8A7EC:
		movsx	eax, word ptr [si+150h]
		cmp	eax, [bp+var_4]
		jnz	short loc_8A7FE
		cmp	eax, [bp+var_C]
		jz	short loc_8A843

loc_8A7FE:
		mov	ax, word ptr [bp+var_4]
		mov	[si+148h], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+14Ah], ax
		cmp	word ptr [si+148h], 0
		jnz	short loc_8A823
		cmp	word ptr [si+14Ah], 0
		jnz	short loc_8A823
		push	si
		call	sub_73115
		pop	cx
		jmp	short loc_8A843

loc_8A823:
		mov	byte ptr [si+17Ch], 0
		mov	byte ptr [si+17Dh], 1
		mov	al, [si+17Bh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A843
		push	[bp+arg_2]
		push	si
		call	sub_73110
		add	sp, 4

loc_8A843:
		call	TextScroll_ApplyHelperC_6F323
		cmp	byte_7D394, 1
		jnz	short loc_8A85B
		cmp	byte_7D395, 1
		jnz	short loc_8A85B
		mov	ax, 1
		jmp	short loc_8A85D

loc_8A85B:
		xor	ax, ax

loc_8A85D:
		or	al, al
		jz	short loc_8A86B
		mov	byte ptr [si+17Ch], 1
		call	Mouse_InitAndRead

loc_8A86B:
		mov	ax, word ptr [bp+var_4]
		mov	[si+150h], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+152h], ax

loc_8A879:
		pop	si
		leave
		retf
Input_ReadMouseAndAxes_8A700		endp
ovr243		ends
