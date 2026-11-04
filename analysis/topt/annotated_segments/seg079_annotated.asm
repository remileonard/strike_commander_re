seg079		segment	para public 'CODE' use16
		assume cs:seg079
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 7, 0, 0, 0, 0, 41h

loc_2EF46:
		db 83h, 0F9h, 6, 7Ch, 0EAh

loc_2EF4B:
		db 8Bh, 0C2h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EF4F		proc far

var_1E		= word ptr -1Eh
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_2EF19
		pop	cx
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		lea	ax, [bp+var_1E]
		push	ax
		call	TextRenderer_ReleaseCachedGlyph_2EE54
		pop	cx
		push	3
		push	si
		call	Memory_AllocatorSlot_Helper_2EEE6
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	3
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2EEE6
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		sub	edx, eax
		push	edx
		push	3
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2EEE6
		add	sp, 4
		push	dx
		push	ax
		push	3
		push	si
		call	Memory_AllocatorSlot_Helper_2EEE6
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	Memory_AllocatorSlot_Helper_2EEE6
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2EEE6
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		sub	edx, eax
		push	edx
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2EEE6
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	Memory_AllocatorSlot_Helper_2EEE6
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	si
		call	Memory_AllocatorSlot_Helper_2EEE6
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2EEE6
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		sub	edx, eax
		push	edx
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2EEE6
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	si
		call	Memory_AllocatorSlot_Helper_2EEE6
		add	sp, 4
		push	dx
		push	ax
		push	42DEh
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F73C
		add	sp, 28h
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		mov	ax, [bp+var_6]
		pop	si
		leave
sub_2EF4F		endp
seg079		ends
