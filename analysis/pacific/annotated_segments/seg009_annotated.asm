seg009		segment	para public 'CODE' use16
		assume cs:seg009
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 61h, 6Eh, 3Ah, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6394		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		leave
		retf
sub_6394		endp

; START OF FUNCTION CHUNK FOR sub_6394
		xchg	bx, bx
		nop
; END OF FUNCTION CHUNK FOR sub_6394

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63B4		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 80000000h
		adc	edx, 0
		mov	eax, edx
		sar	edx, 10h
		leave
		retf
sub_63B4		endp

; START OF FUNCTION CHUNK FOR sub_63B4
		nop
; END OF FUNCTION CHUNK FOR sub_63B4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63D4		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	eax, [bp+arg_0]
		and	eax, eax
		jns	short loc_63ED
		nop
		nop
		inc	ecx
		neg	eax

loc_63ED:
		sub	edx, edx
		rol	eax, 10h
		mov	dx, ax
		sub	ax, ax
		mov	ebx, [bp+arg_4]
		and	ebx, ebx
		jns	short loc_6408
		nop
		nop
		dec	ecx
		neg	ebx

loc_6408:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_6425
		nop
		nop
		neg	eax

loc_6425:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_63D4		endp

; START OF FUNCTION CHUNK FOR sub_63D4
		xchg	bx, bx
; END OF FUNCTION CHUNK FOR sub_63D4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6430		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	ebx
		mov	edx, 1
		sub	eax, eax
		sub	ecx, ecx
		mov	ebx, [bp+arg_0]
		and	ebx, ebx
		jns	short loc_6452
		nop
		nop
		dec	ecx
		neg	ebx

loc_6452:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_646F
		nop
		nop
		neg	eax

loc_646F:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_6430		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6478		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 20000000h
		adc	edx, 0
		shld	edx, eax, 2
		mov	eax, edx
		sar	edx, 10h
		pop	ebx
		leave
		retf
sub_6478		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64A0		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	eax, [bp+arg_0]
		and	eax, eax
		jns	short loc_64B9
		nop
		nop
		inc	ecx
		neg	eax

loc_64B9:
		mov	edx, eax
		sar	edx, 2
		shl	eax, 1Eh
		mov	ebx, [bp+arg_4]
		and	ebx, ebx
		jns	short loc_64D4
		nop
		nop
		dec	ecx
		neg	ebx

loc_64D4:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_64F1
		nop
		nop
		neg	eax

loc_64F1:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_64A0		endp

; START OF FUNCTION CHUNK FOR sub_64A0
		xchg	bx, bx
; END OF FUNCTION CHUNK FOR sub_64A0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64FC		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 20000000h
		adc	edx, 0
		shld	edx, eax, 2
		mov	eax, edx
		sar	edx, 10h
		leave
		retf
sub_64FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6520		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	edx, 4000h
		xor	eax, eax
		mov	ebx, [bp+arg_0]
		and	ebx, ebx
		jns	short loc_6542
		nop
		nop
		dec	ecx
		neg	ebx

loc_6542:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_655F
		nop
		nop
		neg	eax

loc_655F:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_6520		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6568		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	eax, [bp+arg_0]
		and	eax, eax
		jns	short loc_6581
		nop
		nop
		inc	ecx
		neg	eax

loc_6581:
		mov	edx, eax
		sar	edx, 2
		shl	eax, 1Eh
		mov	ebx, [bp+arg_4]
		and	ebx, ebx
		jns	short loc_659C
		nop
		nop
		dec	ecx
		neg	ebx

loc_659C:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_65B9
		nop
		nop
		neg	eax

loc_65B9:
		shld	edx, eax, 10h
		pop	ebx
sub_6568		endp
seg009		ends
