seg096		segment	byte public 'CODE' use16
		assume cs:seg096
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_4536C:				; DATA XREF: seg339:off_6EEA2o
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
