seg041		segment	para public 'CODE' use16
		assume cs:seg041
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. Instrument GUNS : chunk GUNS = mot (+6Ah) puis 4 mots (+58h à +5Eh) ;
; SHAP (+60h) ; INFO lu comme Cockpit_LoadInstrument_97050. Pas de 3SPC.
; ==============================================================================================
Cockpit_LoadGunsInstrument_1BB54		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 534E5547h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_1BBB3
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+6Ah], ax
		mov	word ptr [si+54h], 0
		mov	word ptr [si+56h], 0
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+58h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+5Ah], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+5Ch], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+5Eh], ax

loc_1BBB3:
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_1BC29
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+60h], eax
		mov	byte ptr [si+64h], 3
		mov	byte ptr [si+65h], 1
		mov	dword ptr [si+66h], 0
		mov	eax, [bp+var_4]
		mov	[si+66h], eax
		push	0
		mov	al, [si+64h]
		push	ax
		push	large [si+60h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_1BC29:
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_1BC41
		jmp	loc_1BD26

loc_1BC41:
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+2Ch], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+2Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+30h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+32h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+34h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+36h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+24h], ax
		cmp	word ptr [si+24h], 0FFFFh
		jz	short loc_1BCBF
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+26h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+28h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+2Ah], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+38h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+3Ah], ax

loc_1BCBF:
		push	si
		call	UI_PositionListLabels
		pop	cx
		mov	ax, [si+2Ch]
		mov	[bp+var_A], ax
		mov	ax, [si+2Eh]
		mov	[bp+var_C], ax
		mov	ax, [si+30h]
		mov	[bp+var_E], ax
		mov	ax, [si+32h]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+8], ax
		mov	ax, [bp+var_C]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_E]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_10]
		mov	[si+0Eh], ax
		mov	ax, [si+2Ch]
		mov	[bp+var_12], ax
		mov	ax, [si+2Eh]
		mov	[bp+var_14], ax
		mov	ax, [si+30h]
		mov	[bp+var_16], ax
		mov	ax, [si+32h]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_12]
		mov	[si+16h], ax
		mov	ax, [bp+var_14]
		mov	[si+18h], ax
		mov	ax, [bp+var_16]
		mov	[si+1Ah], ax
Cockpit_LoadGunsInstrument_1BB54		endp
seg041		ends
