seg096		segment	byte public 'CODE' use16
		assume cs:seg096
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far (label), LUE 2026-10-12. Slot +0x3C du corps SURF (vtable 0x1DB6) : mov al,1 / retf — ne
; fait rien. Le slot +0x40 (loc_45376) rappelle +0x3C. Comportement de l'objet SURF non établi
; (ce qui le déplace éventuellement n'a pas été cherché).
; ==============================================================================================
SurfBody_TickNoOp_4536C:				; DATA XREF: seg339:off_6EEA2o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45376:				; DATA XREF: seg339:off_6EEA6o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]

loc_45380:
		call	dword ptr [bx+3Ch]
		pop	cx
		pop	si
		pop	bp
		retf
seg096		ends
