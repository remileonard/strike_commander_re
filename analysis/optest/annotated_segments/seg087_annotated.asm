seg087		segment	byte public 'CODE' use16
		assume cs:seg087
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_2ECF0:				; CODE XREF: seg007:022FJ
					; DATA XREF: dseg:139Co
		push	bp
		mov	bp, sp
		push	si

loc_2ECF4:				; DATA XREF: seg170:038Eo
		mov	si, [bp+6]
		cmp	byte ptr [si+7], 0
		jz	short loc_2ED04
		push	si
		call	TextRenderer_EncodeCharB_2E977
		pop	cx

loc_2ED04:				; CODE XREF: seg087:000Bj
		pop	si
		pop	bp
		retf
seg087		ends
