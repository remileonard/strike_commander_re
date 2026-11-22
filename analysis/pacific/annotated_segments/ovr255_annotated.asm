ovr255		segment	para public 'OVERLAY' use16
		assume cs:ovr255
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. Un instrument : INFO = mots +2Ch, +2Eh, +30h, +32h (cadre, recopié en
; +8 et +16h), +34h, +36h (point), +24h ; si +24h ≠ 65 535 : +26h, +28h, +2Ah (second cadre
; avec +24h) et +38h, +3Ah (second point) ; sinon second cadre = (65 535, 0, largeur, hauteur
; de la 1re image). SHAP = PAK d'images (+54h). 3SPC = 5 u32 (+40h à +50h) ; sans 3SPC :
; erreur 7017h.
; ==============================================================================================
Cockpit_LoadInstrument_97050		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_97076
		jmp	loc_9715B

loc_97076:
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
		jz	short loc_970F4
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

loc_970F4:
		push	si
		call	UI_PositionListLabels
		pop	cx
		mov	ax, [si+2Ch]
		mov	[bp+var_2], ax
		mov	ax, [si+2Eh]
		mov	[bp+var_4], ax
		mov	ax, [si+30h]
		mov	[bp+var_6], ax
		mov	ax, [si+32h]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+8], ax
		mov	ax, [bp+var_4]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_6]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_8]
		mov	[si+0Eh], ax
		mov	ax, [si+2Ch]
		mov	[bp+var_A], ax
		mov	ax, [si+2Eh]
		mov	[bp+var_C], ax
		mov	ax, [si+30h]
		mov	[bp+var_E], ax
		mov	ax, [si+32h]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+16h], ax
		mov	ax, [bp+var_C]
		mov	[si+18h], ax
		mov	ax, [bp+var_E]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_10]
		mov	[si+1Ch], ax

loc_9715B:
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_971D1
		mov	eax, [di+72h]
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+54h], eax
		mov	byte ptr [si+58h], 3
		mov	byte ptr [si+59h], 1
		mov	dword ptr [si+5Ah], 0
		mov	eax, [bp+var_14]
		mov	[si+5Ah], eax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_971D1:
		push	0
		push	large 43505333h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_971E9
		jmp	loc_972AE

loc_971E9:
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+40h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+44h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+48h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+4Ch], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+50h], eax
		mov	word ptr [si+65h], 0
		mov	word ptr [si+67h], 0
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	large 0
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	1
		call	sub_68206
		mov	ax, [bp+var_1C]
		sub	ax, [bp+var_20]
		inc	ax
		mov	[si+69h], ax
		mov	ax, [bp+var_1A]
		sub	ax, [bp+var_1E]
		inc	ax
		mov	[si+6Bh], ax
		push	0
		mov	ax, si
		add	ax, 61h
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		cmp	word ptr [si+24h], 0FFFFh
		jnz	short loc_972B7
		cmp	word ptr [si+24h], 0
		jnz	short loc_97299
		mov	ax, 1
		jmp	short loc_9729B

loc_97299:
		xor	ax, ax

loc_9729B:
		mov	word ptr [si+26h], 0
		mov	ax, [si+69h]
		mov	[si+28h], ax
		mov	ax, [si+6Bh]
		mov	[si+2Ah], ax
		jmp	short loc_972B7

loc_972AE:
		push	7017h
		call	sub_1DDFE
		pop	cx

loc_972B7:
		pop	di
		pop	si
		leave
		retf
Cockpit_LoadInstrument_97050		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_972BB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_972CD
		jmp	loc_97382

loc_972CD:
		mov	word ptr [si], 0B7Eh
		mov	ax, si
		add	ax, 61h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		cmp	byte ptr [si+59h], 0
		jz	short loc_97303
		cmp	dword ptr [si+54h], 0
		jz	short loc_97303
		push	0
		mov	al, [si+58h]
		push	ax
		mov	ax, si
		add	ax, 54h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_97303

loc_97303:
		mov	dword ptr [si+54h], 0
		mov	byte ptr [si+59h], 0
		mov	dword ptr [si+5Ah], 0
		mov	ax, si
		add	ax, 61h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		cmp	byte ptr [si+59h], 0
		jz	short loc_97349
		cmp	dword ptr [si+54h], 0
		jz	short loc_97349
		push	0
		mov	al, [si+58h]
		push	ax
		mov	ax, si
		add	ax, 54h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_97349

loc_97349:
		mov	dword ptr [si+54h], 0
		mov	byte ptr [si+59h], 0
		mov	dword ptr [si+5Ah], 0
		mov	ax, si
		add	ax, 12h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	ax, si
		add	ax, 4
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_97382
		push	si
		call	sub_3B2
		pop	cx

loc_97382:
		pop	di
		pop	si
		pop	bp
		retf
sub_972BB		endp
ovr255		ends
