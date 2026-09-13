seg431		segment	para public 'OVERLAY' use16
		assume cs:seg431
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub transmettant simplement son argument. Référencée via jmp depuis un stub VROOMM
; (sub_6C350).
; ==============================================================================================
TimedTrigger_PassThroughArg_9DE50	proc far		; CODE XREF: VROOMM_StubThunk_6C350J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
TimedTrigger_PassThroughArg_9DE50	endp

seg431		ends
