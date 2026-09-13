seg144		segment	byte public 'CODE' use16
		assume cs:seg144
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) et depuis seg047 — appelle
; TextRenderer_EncodeCharB_5E2A3 (seg142) si le champ +7 de l'objet est non nul.
; ==============================================================================================
TextRenderer_EncodeCharIfFlagged_5E61C:				; CODE XREF: seg047:loc_272E3J
					; DATA XREF: seg339:1296o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_5E623:
		cmp	byte ptr [si+7], 0
		jz	short loc_5E630
		push	si
		call	TextRenderer_EncodeCharB_5E2A3
		pop	cx

loc_5E630:				; CODE XREF: seg144:0017j
		pop	si
		pop	bp
		retf
seg144		ends
