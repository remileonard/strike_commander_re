ovr280		segment	para public 'OVERLAY' use16
		assume cs:ovr280
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A5AE0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		call	HudIcon_ConstructDefault
		add	sp, 4
		push	si
		push	large [bp+arg_0]
		call	sub_73D2A
		add	sp, 6
		push	0
		push	large 55514553h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A5B47
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+17h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_A5B47:
		push	0
		push	large 49524353h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A5BC8
		mov	eax, [si+72h]
		mov	ebx, 2
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+1Ch]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], dx
		mov	es:[bx+1Eh], ax
		cmp	dword ptr es:[bx+1Eh], 0
		jnz	short loc_A5BAB
		push	6001h
		call	sub_1DDFE
		pop	cx

loc_A5BAB:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	large es:[bx+1Eh]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah

loc_A5BC8:
		pop	si
		pop	bp
		retf
sub_A5AE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 25 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftComponent_ConstructWidget_97447 (sub_97447 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Widget_ConstructComposite (116 lignes).
; ==============================================================================================
AircraftComponent_ConstructWidget_A5BCB		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	[bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		call	sub_2B212
		add	sp, 0Ah
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], eax
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_A5C5E
		cmp	word ptr es:[bx+1Ah], 0
		jge	short loc_A5C21
		mov	ax, es:[bx+1Ch]
		dec	ax
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax
		jmp	short loc_A5C2A

loc_A5C21:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+22h], 0

loc_A5C2A:
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_A5C4B
		les	bx, es:[bx+1Eh]
		push	es
		les	si, word ptr [bp+arg_0]
		mov	ax, es:[si+22h]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_A5C52

loc_A5C4B:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+22h]

loc_A5C52:
		mov	[bp+var_A], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]
		jmp	short loc_A5CB1

loc_A5C5E:
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx+1Ah], 0
		jge	short loc_A5C76
		mov	ax, es:[bx+2]
		dec	ax
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax
		jmp	short loc_A5C7F

loc_A5C76:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+22h], 0

loc_A5C7F:
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_A5CA0
		les	bx, es:[bx+1Eh]
		push	es
		les	si, word ptr [bp+arg_0]
		mov	ax, es:[si+22h]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_A5CA7

loc_A5CA0:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+22h]

loc_A5CA7:
		mov	[bp+var_C], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]

loc_A5CB1:
		mov	es:[bx+4], ax
		pop	si
		leave
		retf
AircraftComponent_ConstructWidget_A5BCB		endp
ovr280		ends
