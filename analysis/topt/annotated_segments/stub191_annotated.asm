stub191		segment	para public 'CODE' use16
		assume cs:stub191
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47980	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6B10h		; fileoff
		dw 2185h		; codesize
		dw 20Ch		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479A0	proc far
		jmp	sub_57F72
sub_479A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479A5	proc far
		jmp	sub_55E10
sub_479A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479AA	proc far
		jmp	Gameflow_CheckLossConversations_56325
sub_479AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479AF	proc far
		jmp	Gameflow_ShowKillMarks_5638A
sub_479AF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479B4	proc far
		jmp	Gameflow_ShowKillMarksAlt_56D57
sub_479B4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479B9	proc far
		jmp	Gameflow_KillBoard_5779B
sub_479B9	endp
		db 0, 0
stub191		ends
