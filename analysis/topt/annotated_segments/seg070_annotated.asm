seg070		segment	para public 'CODE' use16
		assume cs:seg070
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3Eh, 66h, 0C7h, 6, 8Ch, 3Eh, 0, 0FFh, 0FFh, 7Fh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_283BC		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_0]
		mov	ax, [si]
		shl	ax, 1
		call	sub_282DE
		sub	ax, [si]
		mov	[bp+var_2], ax
		mov	ax, [si+2]
		shl	ax, 1
		call	sub_282DE
		sub	ax, [si+2]
		mov	[bp+var_4], ax
		mov	ax, [si+4]
		shl	ax, 1
		call	sub_282DE
		sub	ax, [si+4]
		mov	[bp+var_6], ax
		or	di, di
		jz	short loc_28400
		mov	ax, di
		jmp	short loc_2840C

loc_28400:
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_2840C:
		or	ax, ax
		jz	short loc_28425
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	ax, [bp+var_4]
		mov	[di+2], ax
		mov	ax, [bp+var_6]
		mov	[di+4], ax
		mov	ax, di
		jmp	short loc_28427

loc_28425:
		mov	ax, di

loc_28427:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_283BC		endp

; START OF FUNCTION CHUNK FOR sub_283BC
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_283BC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28435		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_1A], eax
		mov	eax, [si+4]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_16], eax
		mov	eax, [si+8]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_12], eax
		mov	eax, [bp+var_1A]
		or	eax, [bp+var_16]
		or	eax, [bp+var_12]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_284A2
		mov	[bp+var_4], 0
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf

loc_284A2:
		mov	[bp+var_9], 0
		mov	[bp+var_A], 0
		jmp	short loc_284C0

loc_284AC:
		mov	eax, [bp+var_8]
		shl	eax, 3
		mov	[bp+var_8], eax
		mov	al, [bp+var_9]
		add	al, 3
		mov	[bp+var_9], al

loc_284C0:
		cmp	[bp+var_8], 0FFh
		jbe	short loc_284AC
		cmp	[bp+var_9], 0
		jz	short loc_284FC
		mov	cl, [bp+var_9]
		mov	eax, [bp+var_1A]
		shl	eax, cl
		mov	[bp+var_1A], eax
		mov	cl, [bp+var_9]
		mov	eax, [bp+var_16]
		shl	eax, cl
		mov	[bp+var_16], eax
		mov	cl, [bp+var_9]
		mov	eax, [bp+var_12]
		shl	eax, cl
		mov	[bp+var_12], eax
		jmp	short loc_2854E

loc_284FC:
		mov	eax, [bp+var_8]
		shr	eax, 0Fh
		mov	di, ax
		mov	bl, 0
		jmp	short loc_28513

loc_2850A:
		shr	di, 2
		mov	al, bl
		inc	al
		mov	bl, al

loc_28513:
		or	di, di
		ja	short loc_2850A
		mov	al, bl
		add	al, bl
		mov	[bp+var_A], al
		cmp	[bp+var_A], 0
		jz	short loc_2854E
		mov	cl, [bp+var_A]
		mov	eax, [bp+var_1A]
		sar	eax, cl
		mov	[bp+var_1A], eax
		mov	cl, [bp+var_A]
		mov	eax, [bp+var_16]
		sar	eax, cl
		mov	[bp+var_16], eax
		mov	cl, [bp+var_A]
		mov	eax, [bp+var_12]
		sar	eax, cl
		mov	[bp+var_12], eax

loc_2854E:
		mov	eax, [bp+var_1A]
		imul	eax, [bp+var_1A]
		mov	edx, [bp+var_16]
		imul	edx, [bp+var_16]
		add	eax, edx
		mov	edx, [bp+var_12]
		imul	edx, [bp+var_12]
		add	eax, edx
		shr	eax, 8
		mov	[bp+var_E], eax
		push	large [bp+var_E]
		call	sub_2BA6D
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	cl, [bp+var_9]
		mov	eax, [bp+var_4]
		sar	eax, cl
		mov	[bp+var_4], eax
		mov	cl, [bp+var_A]
		mov	eax, [bp+var_4]
		shl	eax, cl
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_28435		endp

; START OF FUNCTION CHUNK FOR sub_28435
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28435

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_DotProduct3D_2375C
; (sub_2375C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_DotProduct3D_5505B (sub_5505B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, 47L, LUE (2026-09-24). PRODUIT SCALAIRE de deux
; vecteurs 3x i32 24.8 : (a0*b0 + a1*b1 + a2*b2) en 64 bits (imul / add / adc), puis shrd 8 ->
; resultat 24.8 ecrit dans *arg_0. Ex-'Targeting_ComputeGeometryHelperA'. Utilise par
; Targeting_AcquireBestThreat, Aircraft_ComputeSeekerSignature_3E2F1 (aspect arriere),
; Targeting_SelectAndPrioritize et le cluster matrice/rotation.
; ==============================================================================================
Math_DotProduct3D_285C4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si]
		mov	edx, [di]
		imul	edx
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		mov	edx, [di+4]
		imul	edx
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		mov	edx, [di+8]
		imul	edx
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_DotProduct3D_285C4		endp

; START OF FUNCTION CHUNK FOR Math_DotProduct3D_285C4
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR Math_DotProduct3D_285C4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28624		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si+4]
		mov	edx, [di+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+8]
		mov	edx, [di+4]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_E], ecx
		mov	eax, [si+8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si]
		mov	edx, [di+8]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_A], ecx
		mov	eax, [si]
		mov	edx, [di+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_6], ecx
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_286BD
		mov	ax, [bp+var_2]
		jmp	short loc_286CA

loc_286BD:
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2], ax

loc_286CA:
		or	ax, ax
		jz	short loc_286F3
		mov	bx, [bp+var_2]
		mov	eax, [bp+var_E]
		mov	[bx], eax
		mov	bx, [bp+var_2]
		mov	eax, [bp+var_A]
		mov	[bx+4], eax
		mov	bx, [bp+var_2]
		mov	eax, [bp+var_6]
		mov	[bx+8], eax
		mov	ax, [bp+var_2]
		jmp	short loc_286F6

loc_286F3:
		mov	ax, [bp+var_2]

loc_286F6:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_28624		endp

; START OF FUNCTION CHUNK FOR sub_28624
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28624

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28704		proc far

var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[bp+var_2C], eax
		mov	eax, [di+4]
		mov	[bp+var_28], eax
		mov	eax, [di+8]
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		nop
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_2C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_28]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_24]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_287AD
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_287BA

loc_287AD:
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_4], ax

loc_287BA:
		or	ax, ax
		jz	short loc_287E0
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_10]
		mov	[bx], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_18]
		mov	[bx+4], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_20]
		mov	[bx+8], eax
		jmp	short loc_287E0

loc_287E0:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_28704		endp

; START OF FUNCTION CHUNK FOR sub_28704
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28704

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_287EE		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	di, si
		push	[bp+arg_6]
		push	si
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	cs
		call	near ptr sub_28704
		add	sp, 8
		mov	eax, [di]
		sub	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	eax, [di+8]
		sub	eax, [bp+var_8]
		mov	[bp+var_14], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_28841
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_2884E

loc_28841:
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_4], ax

loc_2884E:
		or	ax, ax
		jz	short loc_28874
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_1C]
		mov	[bx], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_18]
		mov	[bx+4], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_14]
		mov	[bx+8], eax
		jmp	short loc_28874

loc_28874:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_287EE		endp

; START OF FUNCTION CHUNK FOR sub_287EE
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_287EE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28882		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_30], eax
		mov	eax, [di+4]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	[bp+var_28], eax
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_30]
		push	ax
		nop
		push	cs
		call	near ptr sub_28E75
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		nop
		push	cs
		call	near ptr sub_2954A
		add	sp, 6
		mov	eax, [bp+var_28]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_28435
		add	sp, 6
		cmp	[bp+var_18], 0
		jnz	short loc_28914
		mov	[bp+var_1C], 2D000h
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		jmp	short loc_2896C

loc_28914:
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_14]
		jle	short loc_2893D
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_27EC2
		add	sp, 8
		mov	eax, [bp+var_20]
		mov	[bp+var_4], eax
		jmp	short loc_2896C

loc_2893D:
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	sub_27E3C
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_4], eax
		cmp	[bp+var_28], 0
		jge	short loc_2896C
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax

loc_2896C:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_28882		endp

; START OF FUNCTION CHUNK FOR sub_28882
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28882

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28984		proc far

var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_6], si
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4A], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx+4]
		mov	[bp+var_46], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx+8]
		mov	[bp+var_42], eax
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_4A]
		push	ax
		nop
		push	cs
		call	near ptr sub_28E75
		add	sp, 8
		mov	[bp+var_42], 0
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	cs
		call	near ptr sub_28435
		add	sp, 6
		mov	eax, [si]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_E], eax
		mov	eax, [si+4]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_12], eax
		cmp	[bp+var_A], 0
		jnz	short loc_28A39
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_28A0F
		mov	ax, di
		jmp	short loc_28A1B

loc_28A0F:
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_28A1B:
		or	ax, ax
		jz	short loc_28A2A
		mov	dword ptr [di], 2D000h
		mov	ax, di
		jmp	short loc_28A2C

loc_28A2A:
		mov	ax, di

loc_28A2C:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
		jmp	loc_28B31

loc_28A39:
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_E]
		jge	short loc_28A46
		jmp	loc_28ADC

loc_28A46:
		cmp	dword ptr [si+4], 0
		jl	short loc_28A6C
		lea	ax, word ptr [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_27EC2
		add	sp, 8
		mov	eax, [bp+var_16]
		mov	[bp+var_4], eax
		jmp	short loc_28ADA

loc_28A6C:
		cmp	dword ptr [si], 0
		jl	short loc_28AA7
		lea	ax, word ptr [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1A]
		push	ax
		call	sub_27EC2
		add	sp, 8
		mov	eax, 0B400h
		sub	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_4], eax
		jmp	short loc_28ADA

loc_28AA7:
		lea	ax, word ptr [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_26]
		push	ax
		call	sub_27EC2
		add	sp, 8
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_4], eax

loc_28ADA:
		jmp	short loc_28B31

loc_28ADC:
		cmp	dword ptr [si], 0
		jl	short loc_28B01
		lea	ax, word ptr [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_32]
		push	ax
		call	sub_27E3C
		add	sp, 8
		mov	eax, [bp+var_32]
		mov	[bp+var_4], eax
		jmp	short loc_28B31

loc_28B01:
		lea	ax, word ptr [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	sub_27E3C
		add	sp, 8
		mov	eax, [bp+var_36]
		neg	eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_4], eax

loc_28B31:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_28984		endp

; START OF FUNCTION CHUNK FOR sub_28984
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28984

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28B49		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, si
		add	ax, 4
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	large [bp+var_A]
		call	sub_2B7B5
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_2B7FB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si+4], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+8], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_28B49		endp

; START OF FUNCTION CHUNK FOR sub_28B49
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28B49

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28C20		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_6], si
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	large [bp+var_A]
		call	sub_2B7B5
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_2B7FB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+8]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si+8], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_28C20		endp

; START OF FUNCTION CHUNK FOR sub_28C20
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28C20

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28CEF		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_6], si
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	large [bp+var_A]
		call	sub_2B7B5
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_2B7FB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+4], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_28CEF		endp

; START OF FUNCTION CHUNK FOR sub_28CEF
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28CEF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28DBE		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_E], eax
		mov	eax, [si+8]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_A], eax
		mov	[bp+var_1], 0
		mov	eax, [bp+var_12]
		or	eax, [bp+var_E]
		or	eax, [bp+var_A]
		mov	[bp+var_6], eax
		mov	eax, [bp+arg_2]
		shl	eax, 8
		mov	[bp+arg_2], eax
		cmp	[bp+var_6], 0
		jz	short loc_28E3E
		jmp	short loc_28E34

loc_28E20:
		mov	cl, [bp+arg_6]
		mov	eax, [bp+var_6]
		shl	eax, cl
		mov	[bp+var_6], eax
		mov	al, [bp+arg_6]
		add	[bp+var_1], al

loc_28E34:
		mov	eax, [bp+var_6]
		cmp	eax, [bp+arg_2]
		jl	short loc_28E20

loc_28E3E:
		cmp	[bp+var_1], 0
		jz	short loc_28E6C
		mov	eax, [si]
		mov	cl, [bp+var_1]
		shl	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		mov	cl, [bp+var_1]
		shl	eax, cl
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	cl, [bp+var_1]
		shl	eax, cl
		mov	[si+8], eax

loc_28E6C:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_28DBE		endp

; START OF FUNCTION CHUNK FOR sub_28DBE
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28DBE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28E75		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	eax, [si]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_E], eax
		mov	eax, [si+8]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_12]
		or	eax, [bp+var_E]
		or	eax, [bp+var_A]
		mov	[bp+var_6], eax
		mov	eax, [bp+arg_2]
		shl	eax, 8
		mov	[bp+arg_2], eax
		jmp	short loc_28EE4

loc_28ED0:
		mov	cl, [bp+arg_6]
		mov	eax, [bp+var_6]
		sar	eax, cl
		mov	[bp+var_6], eax
		mov	al, [bp+arg_6]
		add	[bp+var_1], al

loc_28EE4:
		mov	eax, [bp+var_6]
		cmp	eax, [bp+arg_2]
		jg	short loc_28ED0
		cmp	[bp+var_1], 0
		jz	short loc_28F1C
		mov	eax, [si]
		mov	cl, [bp+var_1]
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		mov	cl, [bp+var_1]
		sar	eax, cl
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	cl, [bp+var_1]
		sar	eax, cl
		mov	[si+8], eax

loc_28F1C:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_28E75		endp

; START OF FUNCTION CHUNK FOR sub_28E75
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28E75

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28F25		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large [si+8]
		push	large [si+4]
		push	large [si]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_28FAA
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8], eax

loc_28FAA:
		mov	ax, si
		pop	si
		leave
		retf
sub_28F25		endp

; START OF FUNCTION CHUNK FOR sub_28F25
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28F25

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Vector_Normalize3D_241B4 (sub_241B4 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Vector_Normalize3D_559BB
; (sub_559BB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, seg116 L1587-1640. Nom hérité 'TransformHelperB' FAUX : c'est une NORMALISATION
; 3D (pas une rotation). Math_VectorLength_ShiftDownIfLarge_55793(si,0x10,1) (mise à l'échelle
; si grand) ; Math_VectorLength3D_Scaled_54F57(si) -> longueur ; puis si[0]/=len, si[4]/=len,
; si[8]/=len -> vecteur unitaire (24.8, norme = 0x100). Utilisé par le cluster matrice
; (Matrix_ApplyToVectorX/Y/Z, 3x chacun = orthonormalisation) et par
; Aero_ComputeDragWithFeedback (direction de traînée).
; ==============================================================================================
Vector_Normalize3D_28FB2		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	large 10h
		push	si
		push	cs
		call	near ptr sub_28DBE
		add	sp, 8
		push	si
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_28435
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_29029
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8], eax

loc_29029:
		mov	ax, si
		pop	si
		leave
		retf
Vector_Normalize3D_28FB2		endp

; START OF FUNCTION CHUNK FOR Vector_Normalize3D_28FB2
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR Vector_Normalize3D_28FB2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Utility_Helper_24233
; (sub_24233 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Utility_Helper_55A37 (sub_55A37 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, référencée par sub_29A7D (rôle exact non détaillé, hors
; cluster identifié).
; ==============================================================================================
Utility_Helper_29031		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		neg	eax
		mov	[si], eax
		mov	eax, [si+4]
		neg	eax
		mov	[si+4], eax
		mov	eax, [si+8]
		neg	eax
		mov	[si+8], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Utility_Helper_29031		endp

; START OF FUNCTION CHUNK FOR Utility_Helper_29031
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Utility_Helper_29031

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Utility_Helper_55A62
; (sub_55A62 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_3844F (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_2905F		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ecx, [bp+arg_2]
		mov	eax, [si]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	eax, [si+8]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si+8], eax
		pop	si
		pop	bp
		retf
Utility_Helper_2905F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2909B		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_28F25
		add	sp, 2
		cmp	dword ptr [di], 100h
		jz	short loc_29103
		mov	[bp+var_2], di
		mov	eax, [si]
		mov	bx, [bp+var_2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	[bp+var_4], di
		mov	eax, [si+4]
		mov	bx, [bp+var_4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	[bp+var_6], di
		mov	eax, [si+8]
		mov	bx, [bp+var_6]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax

loc_29103:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2909B		endp

; START OF FUNCTION CHUNK FOR sub_2909B
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2909B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2910D		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], si
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_24], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_20], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[bp+var_1C], eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+4]
		mov	[bp+var_2C], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+8]
		mov	[bp+var_28], eax
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	cs
		call	near ptr sub_28E75
		add	sp, 8
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	cs
		call	near ptr sub_28E75
		add	sp, 8
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_28435
		add	sp, 6
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	cs
		call	near ptr sub_28435
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_291FE
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_291D5
		mov	ax, di
		jmp	short loc_291E1

loc_291D5:
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_291E1:
		or	ax, ax
		jz	short loc_291F0
		mov	dword ptr [di], 0
		mov	ax, di
		jmp	short loc_291F2

loc_291F0:
		mov	ax, di

loc_291F2:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_29232

loc_291FE:
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_285C4
		add	sp, 8
		lea	ax, [bp+var_18]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_27E3C
		add	sp, 8
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2910D		endp

; START OF FUNCTION CHUNK FOR sub_2910D

loc_29232:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2910D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29236		proc far

var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	di, si
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	eax, [di]
		mov	bx, [bp+var_6]
		sub	eax, [bx]
		mov	[bp+var_16], eax
		mov	eax, [di+4]
		mov	bx, [bp+var_6]
		sub	eax, [bx+4]
		mov	[bp+var_12], eax
		mov	eax, [di+8]
		mov	bx, [bp+var_6]
		sub	eax, [bx+8]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_1A], eax
		push	large [bp+var_1A]
		push	large [bp+var_1E]
		push	large [bp+var_22]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_A]
		mov	[bx], eax
		les	bx, word ptr [bp+var_4]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_29236		endp

; START OF FUNCTION CHUNK FOR sub_29236
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_29236

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_292D0		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	dword ptr [si+4], 0
		jz	short loc_29338
		mov	ax, si
		add	ax, 4
		mov	di, ax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		neg	eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	sub_27F48
		add	sp, 6
		mov	eax, [bp+var_18]
		mov	[bp+var_4], eax
		jmp	short loc_29372

loc_29338:
		cmp	dword ptr [si+8], 0
		jle	short loc_29351
		mov	[bp+var_1C], 0FFFFA600h
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		jmp	short loc_29372

loc_29351:
		cmp	dword ptr [si+8], 0
		jge	short loc_2936A
		mov	[bp+var_20], 5A00h
		mov	eax, [bp+var_20]
		mov	[bp+var_4], eax
		jmp	short loc_29372

loc_2936A:
		mov	[bp+var_4], 0

loc_29372:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_292D0		endp

; START OF FUNCTION CHUNK FOR sub_292D0
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_292D0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2938A		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		push	large [si+8]
		push	large [si+4]
		push	large [si]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jle	short loc_293FC
		lea	ax, word ptr [bp+var_8]
		push	ax
		mov	eax, [si]
		neg	eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_27EC2
		add	sp, 8
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		jmp	short loc_29404

loc_293FC:
		mov	[bp+var_4], 0

loc_29404:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2938A		endp

; START OF FUNCTION CHUNK FOR sub_2938A
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2938A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Utility_Helper_55DB4
; (sub_55DB4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_315B (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_2941A		proc far

var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[si], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[si+8], eax
		pop	si
		leave
		retf
Utility_Helper_2941A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29477		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+4], eax
		mov	eax, [bp+arg_A]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[si+8], eax
		pop	si
		leave
		retf
sub_29477		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Utility_Helper_246F0
; (sub_246F0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Utility_Helper_55E65 (sub_55E65 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, référencée par sub_2B0F2 (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_294D7		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si], eax
		mov	eax, [bp+arg_6]
		mov	[si+4], eax
		mov	eax, [bp+arg_A]
		mov	[si+8], eax
		pop	si
		pop	bp
		retf
Utility_Helper_294D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_294F8		proc far

var_3C		= word ptr -3Ch
var_28		= word ptr -28h
var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		mov	si, [bp+arg_0]
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3ED2h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8
		pop	si
		leave
		retf
sub_294F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2954A		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_4]
		mov	al, 0
		mov	[bp+var_2], al
		mov	[bp+var_1], al
		mov	eax, [si]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_E], eax
		mov	[bp+var_A], 0
		push	1
		push	large 10h
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_28DBE
		add	sp, 8
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_295B2
		push	1
		push	large 400h
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_28E75
		add	sp, 8
		mov	[bp+var_2], al

loc_295B2:
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_E]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		add	[bp+var_12], eax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		call	sub_28094
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_29609
		mov	cl, [bp+var_1]
		mov	eax, [bp+var_6]
		sar	eax, cl
		mov	[bp+var_6], eax
		jmp	short loc_2961D

loc_29609:
		cmp	[bp+var_2], 0
		jz	short loc_2961D
		mov	cl, [bp+var_2]
		mov	eax, [bp+var_6]
		shl	eax, cl
		mov	[bp+var_6], eax

loc_2961D:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2954A		endp

; START OF FUNCTION CHUNK FOR sub_2954A
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2954A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29633		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_29653
		neg	eax

loc_29653:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, si
		add	ax, 4
		mov	[bp+var_16], ax
		mov	bx, [bp+var_16]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_29681
		neg	eax

loc_29681:
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		sar	eax, 8
		mov	[bp+var_14], eax
		xor	dx, dx
		jmp	short loc_296B8

loc_2969D:
		mov	eax, [bp+var_8]
		sar	eax, 3
		mov	[bp+var_8], eax
		mov	eax, [bp+var_14]
		sar	eax, 3
		mov	[bp+var_14], eax
		add	dx, 3

loc_296B8:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jg	short loc_2969D
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_4]
		jg	short loc_2969D
		or	dx, dx
		jz	short loc_296E8
		mov	eax, [si]
		mov	cl, dl
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		mov	cl, dl
		sar	eax, cl
		mov	[si+4], eax

loc_296E8:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_29633		endp

; START OF FUNCTION CHUNK FOR sub_29633
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_29633

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_296F2		proc far

var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	ax, [bp+arg_6]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	ax, [bp+var_A]
		add	ax, 4
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr UI_ComputeScaledVectorHelper_298E5
		add	sp, 2
		mov	eax, [bp+arg_0]
		mov	[bp+var_10], eax
		mov	di, si
		mov	eax, [di]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		add	eax, [bp+var_14]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		cmp	word ptr [bp+var_10], 0
		jz	short loc_297B0
		mov	ax, word ptr [bp+var_10]
		jmp	short loc_297BD

loc_297B0:
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_10], ax

loc_297BD:
		or	ax, ax
		jz	short loc_297D8
		mov	bx, word ptr [bp+var_10]
		mov	eax, [bp+var_24]
		mov	[bx], eax
		mov	bx, word ptr [bp+var_10]
		mov	eax, [bp+var_2C]
		mov	[bx+4], eax
		jmp	short loc_297D8

loc_297D8:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_296F2		endp

; START OF FUNCTION CHUNK FOR sub_296F2
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_296F2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_297E6		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	di, si
		push	[bp+arg_6]
		push	si
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_296F2
		add	sp, 8
		mov	eax, [di]
		sub	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_2983D
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_2984A

loc_2983D:
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_4], ax

loc_2984A:
		or	ax, ax
		jz	short loc_29865
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_14]
		mov	[bx], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_1C]
		mov	[bx+4], eax
		jmp	short loc_29865

loc_29865:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_297E6		endp

; START OF FUNCTION CHUNK FOR sub_297E6
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_297E6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29873		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	large [si+4]
		push	large [si]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_298DD
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4], eax

loc_298DD:
		mov	ax, si
		pop	si
		leave
		retf
sub_29873		endp

; START OF FUNCTION CHUNK FOR sub_29873
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_29873

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UI_ComputeScaledVectorHelper_24AFE (sub_24AFE de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; UI_ComputeScaledVectorHelper_56215 (sub_56215 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée depuis seg027/seg089 (audio 3D),
; combine Math_VectorLength_ShiftDownIfLarge_55793 et
; Math_VectorLength3D_Scaled_Variant_55ED8.
; ==============================================================================================
UI_ComputeScaledVectorHelper_298E5		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		push	1
		push	large 10h
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	cs
		call	near ptr sub_28DBE
		add	sp, 8
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_2954A
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_2996B
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4], eax

loc_2996B:
		mov	ax, si
		pop	si
		leave
		retf
UI_ComputeScaledVectorHelper_298E5		endp

; START OF FUNCTION CHUNK FOR UI_ComputeScaledVectorHelper_298E5
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR UI_ComputeScaledVectorHelper_298E5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29973		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		neg	eax
		mov	[si], eax
		mov	eax, [si+4]
		neg	eax
		mov	[si+4], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_29973		endp

; START OF FUNCTION CHUNK FOR sub_29973
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_29973

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29996		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_29873
		add	sp, 2
		mov	[bp+var_2], di
		mov	eax, [si]
		mov	bx, [bp+var_2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	[bp+var_4], di
		mov	eax, [si+4]
		mov	bx, [bp+var_4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_29996		endp

; START OF FUNCTION CHUNK FOR sub_29996
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_29996

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_299E6		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	large 0
		push	large [si+4]
		push	large [si]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		push	large 0
		push	large [di+4]
		push	large [di]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_29A7B
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_29AE3

loc_29A7B:
		lea	ax, word ptr [bp+var_4]
		push	ax
		mov	[bp+var_1A], si
		mov	[bp+var_1C], di
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	bx, [bp+var_1C]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	bx, [bp+var_1A]
		mov	eax, [bx+4]
		mov	bx, [bp+var_1C]
		mov	edx, [bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		add	eax, [bp+var_20]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_27E3C
		add	sp, 8
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_299E6		endp

; START OF FUNCTION CHUNK FOR sub_299E6

loc_29AE3:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_299E6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29AE7		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	di, si
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	eax, [di]
		mov	bx, [bp+var_6]
		sub	eax, [bx]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		mov	ax, [bp+var_6]
		add	ax, 4
		mov	[bp+var_10], ax
		mov	eax, [di+4]
		mov	bx, [bp+var_10]
		sub	eax, [bx]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		push	large 0
		push	large [bp+var_1C]
		push	large [bp+var_20]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_24]
		mov	[bx], eax
		les	bx, word ptr [bp+var_4]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_29AE7		endp

; START OF FUNCTION CHUNK FOR sub_29AE7
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_29AE7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29B81		proc far

var_28		= word ptr -28h
var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	si, [bp+arg_0]
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp+var_28]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3EDDh
		call	CRT_Msg_NullPtrAssign
		add	sp, 6
		pop	si
		leave
		retf
sub_29B81		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Damage_ComputeHelperA_24DD7 (sub_24DD7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Damage_ComputeHelperA_5647A (sub_5647A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par
; Damage_SimulationTick (sub_2BF6C, seg060) — helper de calcul de dommages (rôle exact non
; détaillé).
; ==============================================================================================
Damage_ComputeHelperA_29BBE		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[si+28h], eax
		mov	[si+14h], eax
		mov	[si], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+2Ch], eax
		mov	[si+24h], eax
		mov	[si+20h], eax
		mov	[si+1Ch], eax
		mov	[si+18h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	[si+4], eax
		pop	si
		leave
		retf
Damage_ComputeHelperA_29BBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29C12		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Math_VectorTransformByMatrix3x3_2BBE5
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_29C12		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29C2E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+0Ch]
		mov	[si+4], eax
		mov	eax, [di+18h]
		mov	[si+8], eax
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	eax, [di+4]
		mov	[si+10h], eax
		mov	eax, [di+10h]
		mov	[si+14h], eax
		mov	eax, [di+1Ch]
		mov	[si+18h], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	[si+1Ch], eax
		mov	eax, [di+8]
		mov	[si+20h], eax
		mov	eax, [di+14h]
		mov	[si+24h], eax
		mov	eax, [di+20h]
		mov	[si+28h], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	[si+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_29C2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29CA3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+4], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+8], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+0Ch]
		mov	[si+0Ch], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+10h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+14h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+18h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+1Ch]
		mov	[si+1Ch], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+20h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+24h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+28h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+2Ch]
		mov	[si+2Ch], eax
		pop	si
		pop	bp
		retf
sub_29CA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A0B9		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	eax, [di]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	eax, [di]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	eax, [di]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], eax
		mov	eax, [di+0Ch]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		mov	eax, [di+0Ch]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], eax
		mov	eax, [di+0Ch]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], eax
		mov	eax, [di+18h]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	eax, [di+18h]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], eax
		mov	eax, [di+18h]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx+4]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx+8]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx+4]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx+8]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx+4]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx+8]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_2A0B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A3E4		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	eax, [si+0Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		mov	eax, [si+18h]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	eax, [di]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	eax, [si+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	eax, [si+10h]
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], eax
		mov	eax, [si+1Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], eax
		mov	eax, [di+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], eax
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], eax
		mov	eax, [si+14h]
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], eax
		mov	eax, [si+20h]
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], eax
		mov	eax, [di+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_2A3E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A480		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		leave
		retf
sub_2A480		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A4FF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2A51A
		push	24h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_2A52D

loc_2A51A:
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildFromAngle_2A535
		add	sp, 2

loc_2A52D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_2A4FF		endp

; START OF FUNCTION CHUNK FOR sub_2A4FF
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2A4FF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Matrix_BuildFromAngle_2574E (sub_2574E de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Matrix_BuildFromAngle_56D72 (sub_56D72 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par seg015 (UI
; cockpit) — probable construction de matrice de rotation à partir d'un angle.
; ==============================================================================================
Matrix_BuildFromAngle_2A535		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, dword_4C882
		mov	[si], eax
		mov	eax, dword_4C886
		mov	[si+4], eax
		mov	eax, dword_4C88A
		mov	[si+8], eax
		mov	eax, dword_4C88E
		mov	[si+0Ch], eax
		mov	eax, dword_4C892
		mov	[si+10h], eax
		mov	eax, dword_4C896
		mov	[si+14h], eax
		mov	eax, dword_4C89A
		mov	[si+18h], eax
		mov	eax, dword_4C89E
		mov	[si+1Ch], eax
		mov	eax, dword_4C8A2
		mov	[si+20h], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFromAngle_2A535		endp

; START OF FUNCTION CHUNK FOR Matrix_BuildFromAngle_2A535
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Matrix_BuildFromAngle_2A535

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A58B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2A5AA
		push	24h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_2A5FC

loc_2A5AA:
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[si+10h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[si+14h], eax
		push	si
		nop
		push	cs
		call	near ptr sub_2AEE8
		add	sp, 2

loc_2A5FC:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2A58B		endp

; START OF FUNCTION CHUNK FOR sub_2A58B
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2A58B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A606		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, dx
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		mov	ax, dx
		add	ax, 0Ch
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	bx, cx
		mov	eax, [bx+4]
		mov	[si+10h], eax
		mov	bx, cx
		mov	eax, [bx+8]
		mov	[si+14h], eax
		mov	ax, dx
		add	ax, 18h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[si+18h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[si+1Ch], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[si+20h], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2A606		endp

; START OF FUNCTION CHUNK FOR sub_2A606
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2A606

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; WorldObject_BuildOrientationMatrix_2589B (sub_2589B de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à WorldObject_BuildOrientationMatrix_56E8A (sub_56E8A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; seg116 L3964-4003 (relu 2026-09-05). Variante 'tableau' de Matrix_BuildFullOrientation_575B2
; : arg_0 = matrice cible, arg_2 = ptr vers 3 dword angles consecutifs. Appelle
; Matrix_BuildAxisX_ApplyToObject_574B3(m, ptr+0), _AxisY_57508(m, ptr+4), _AxisZ_5755D(m,
; ptr+8) : composition INCREMENTALE des 3 rotations d'axe (seuil 0.21875 deg) sur la matrice.
; Appelee par la methode vtable WorldObject_ComposeOrientationAngleArray_3CB0B (matrice a
; objet+0x2C), par Camera_ChaseComputeMain (seg085, angles depuis dword_707F8/FC/70800 ou
; [obj+0x51]->vtable[0x24]), et par le cluster de manoeuvre IA ovr232. C'est le mecanisme
; generique de rotation d'objet.
; ==============================================================================================
WorldObject_BuildOrientationMatrix_2A682		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_2AD05
		add	sp, 4
		mov	ax, di
		add	ax, 4
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_2AD68
		add	sp, 4
		mov	ax, di
		add	ax, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_2ADCB
		add	sp, 4
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_BuildOrientationMatrix_2A682		endp

; START OF FUNCTION CHUNK FOR WorldObject_BuildOrientationMatrix_2A682
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR WorldObject_BuildOrientationMatrix_2A682

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A6BF		proc far

var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_2A709
		jmp	loc_2A8D5

loc_2A709:
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_27C36
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_27C78
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	ax, si
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_46], eax
		mov	eax, [di+4]
		mov	[bp+var_42], eax
		mov	eax, [di+8]
		mov	[bp+var_3E], eax
		mov	eax, [si+0Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	eax, [si+10h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+10h], eax
		mov	ax, si
		add	ax, 10h
		mov	eax, [si+14h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+14h], eax
		mov	ax, si
		add	ax, 14h
		mov	ax, si
		add	ax, 18h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		add	[si+0Ch], eax
		mov	eax, [bp+var_4E]
		add	[si+10h], eax
		mov	eax, [bp+var_4A]
		add	[si+14h], eax
		mov	eax, [si+18h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+18h], eax
		mov	ax, si
		add	ax, 18h
		mov	eax, [si+1Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 1Ch
		mov	eax, [si+20h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 20h
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_46]
		sub	[si+18h], eax
		mov	eax, [bp+var_42]
		sub	[si+1Ch], eax
		mov	eax, [bp+var_3E]
		sub	[si+20h], eax

loc_2A8D5:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2A6BF		endp

; START OF FUNCTION CHUNK FOR sub_2A6BF
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2A6BF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A8DF		proc far

var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_2A929
		jmp	loc_2AAE8

loc_2A929:
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_27C36
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_27C78
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_46], eax
		mov	eax, [di+4]
		mov	[bp+var_42], eax
		mov	eax, [di+8]
		mov	[bp+var_3E], eax
		mov	eax, [si]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	ax, si
		add	ax, 18h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		sub	[si], eax
		mov	eax, [bp+var_4E]
		sub	[si+4], eax
		mov	eax, [bp+var_4A]
		sub	[si+8], eax
		mov	eax, [si+18h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+18h], eax
		mov	ax, si
		add	ax, 18h
		mov	eax, [si+1Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 1Ch
		mov	eax, [si+20h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 20h
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_46]
		add	[si+18h], eax
		mov	eax, [bp+var_42]
		add	[si+1Ch], eax
		mov	eax, [bp+var_3E]
		add	[si+20h], eax

loc_2AAE8:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2A8DF		endp

; START OF FUNCTION CHUNK FOR sub_2A8DF
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2A8DF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AAF2		proc far

var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_2AB3C
		jmp	loc_2ACFB

loc_2AB3C:
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_27C36
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_27C78
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_46], eax
		mov	eax, [di+4]
		mov	[bp+var_42], eax
		mov	eax, [di+8]
		mov	[bp+var_3E], eax
		mov	eax, [si]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	ax, si
		add	ax, 0Ch
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		add	[si], eax
		mov	eax, [bp+var_4E]
		add	[si+4], eax
		mov	eax, [bp+var_4A]
		add	[si+8], eax
		mov	eax, [si+0Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	eax, [si+10h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+10h], eax
		mov	ax, si
		add	ax, 10h
		mov	eax, [si+14h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+14h], eax
		mov	ax, si
		add	ax, 14h
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_46]
		sub	[si+0Ch], eax
		mov	eax, [bp+var_42]
		sub	[si+10h], eax
		mov	eax, [bp+var_3E]
		sub	[si+14h], eax

loc_2ACFB:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2AAF2		endp

; START OF FUNCTION CHUNK FOR sub_2AAF2
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2AAF2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AD05		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_2A6BF
		add	sp, 4
		mov	eax, [di]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_2AD5E
		push	si
		nop
		push	cs
		call	near ptr sub_2AE5E
		add	sp, 2

loc_2AD5E:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2AD05		endp

; START OF FUNCTION CHUNK FOR sub_2AD05
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2AD05

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AD68		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_2A8DF
		add	sp, 4
		mov	eax, [di]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_2ADC1
		push	si
		nop
		push	cs
		call	near ptr sub_2AEE8
		add	sp, 2

loc_2ADC1:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2AD68		endp

; START OF FUNCTION CHUNK FOR sub_2AD68
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2AD68

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2ADCB		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_2AAF2
		add	sp, 4
		mov	eax, [di]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_2AE24
		push	si
		nop
		push	cs
		call	near ptr sub_2AF76
		add	sp, 2

loc_2AE24:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2ADCB		endp

; START OF FUNCTION CHUNK FOR sub_2ADCB
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2ADCB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Matrix_BuildFullOrientation_26047 (sub_26047 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Matrix_BuildFullOrientation_575B2 (sub_575B2 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, seg116 L4776-4807 (relu
; 2026-09-05). Compose une matrice d'orientation 3D COMPLETE :
; Matrix_BuildAxisX_ApplyToObject_574B3(m, &ax) puis _AxisY_57508(m, &ay) puis _AxisZ_5755D(m,
; &az). Chaque _ApplyToObject lit l'angle en *ptr, et si |angle| >= 0x38 brut (= 56/256 =
; 0.21875 deg) appelle Matrix_BuildAxisX/Y/Z_56EC3 qui applique une rotation INCREMENTALE en
; place sur les lignes de la matrice cible (composition, pas reconstruction from-scratch).
; Utilisee via les methodes vtable WorldObject_ComposeOrientation3Angles_3CAE3 (matrice a
; objet+0x2C). C'est le chemin par lequel les vitesses angulaires de la physique tournent
; l'objet du monde chaque frame. Aussi ref. par Widget_AnchorTo3DPosition, sub_2C9F3, seg084.
; ==============================================================================================
Matrix_BuildFullOrientation_2AE2E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2AD05
		add	sp, 4
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_2AD68
		add	sp, 4
		push	[bp+arg_6]
		push	si
		push	cs
		call	near ptr sub_2ADCB
		add	sp, 4
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFullOrientation_2AE2E		endp

; START OF FUNCTION CHUNK FOR Matrix_BuildFullOrientation_2AE2E
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Matrix_BuildFullOrientation_2AE2E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AE5E		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_28624
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+18h], eax
		mov	eax, [bp+var_8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_4]
		mov	[si+20h], eax
		push	si
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_28624
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		pop	si
		leave
		retf
sub_2AE5E		endp

; START OF FUNCTION CHUNK FOR sub_2AE5E
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2AE5E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AEE8		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_28624
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+18h], eax
		mov	eax, [bp+var_8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_4]
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_28624
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4], eax
		mov	eax, [bp+var_10]
		mov	[si+8], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		pop	si
		leave
		retf
sub_2AEE8		endp

; START OF FUNCTION CHUNK FOR sub_2AEE8
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2AEE8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AF76		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_28624
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	eax, [bp+var_8]
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		mov	[si+8], eax
		push	si
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_28624
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		pop	si
		leave
		retf
sub_2AF76		endp

; START OF FUNCTION CHUNK FOR sub_2AF76
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2AF76

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B004		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_2AEE8
		add	sp, 2
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_2B004		endp

; START OF FUNCTION CHUNK FOR sub_2B004
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2B004

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B03A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	sub_2BF97
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	sub_2BF97
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_2AEE8
		add	sp, 2
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_2B03A		endp

; START OF FUNCTION CHUNK FOR sub_2B03A
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2B03A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B070		proc far

var_B4		= word ptr -0B4h
var_A0		= word ptr -0A0h
var_8C		= word ptr -8Ch
var_78		= word ptr -78h
var_64		= word ptr -64h
var_50		= word ptr -50h
var_3C		= word ptr -3Ch
var_28		= word ptr -28h
var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		mov	si, [bp+arg_0]
		push	3
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 1Ch
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 14h
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 10h
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp+var_B4]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3EE5h
		call	CRT_Msg_NullPtrAssign
		add	sp, 14h
		pop	si
		leave
		retf
sub_2B070		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B144		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_8]
		cmp	dword ptr [si], 0
		jl	short loc_2B172
		mov	eax, 16800h
		sub	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+arg_4], eax

loc_2B172:
		mov	cx, word ptr [bp+arg_4+1]
		cmp	cx, 168h
		jl	short loc_2B19C
		mov	ax, cx
		mov	bx, 168h
		cwd
		idiv	bx
		mov	cx, ax
		mov	ax, cx
		mov	dx, 168h
		imul	dx
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		sub	[bp+arg_4], eax

loc_2B19C:
		cmp	[bp+arg_4], 0B400h
		jle	short loc_2B1AE
		sub	[bp+arg_4], 16800h

loc_2B1AE:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2B144		endp

; START OF FUNCTION CHUNK FOR sub_2B144
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2B144

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B1C4		proc far

var_2A		= dword ptr -2Ah
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_20], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	cs
		call	near ptr sub_28F25
		add	sp, 2
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_27D5A
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_2A], eax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	cs
		call	near ptr sub_2B144
		add	sp, 0Ah
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2B1C4		endp

; START OF FUNCTION CHUNK FOR sub_2B1C4
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2B1C4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B284		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	di
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_1C], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	cs
		call	near ptr sub_28F25
		add	sp, 2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_27D5A
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		cmp	[bp+var_1C], 0
		jge	short loc_2B30B
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax

loc_2B30B:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2B284		endp

; START OF FUNCTION CHUNK FOR sub_2B284
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2B284

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B323		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_28882
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2B323		endp

; START OF FUNCTION CHUNK FOR sub_2B323
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2B323

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B355		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	dword ptr [si+20h], 0
		jnz	short loc_2B36A
		jmp	loc_2B45D

loc_2B36A:
		mov	eax, [si+10h]
		mov	[bp+var_30], eax
		mov	eax, [si+0Ch]
		neg	eax
		mov	[bp+var_2C], eax
		mov	[bp+var_28], 0
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_285C4
		add	sp, 8
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_28435
		add	sp, 6
		cmp	[bp+var_8], 0
		jnz	short loc_2B3BC
		mov	[bp+var_4], 0
		jmp	short loc_2B3EC

loc_2B3BC:
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	sub_27E3C
		add	sp, 8
		mov	eax, [bp+var_C]
		neg	eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax

loc_2B3EC:
		add	[bp+var_4], 5A00h
		cmp	dword ptr [si+20h], 0
		jge	short loc_2B447
		cmp	[bp+var_4], 0
		jle	short loc_2B422
		mov	eax, 0B400h
		sub	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		jmp	short loc_2B447

loc_2B422:
		cmp	[bp+var_4], 0
		jge	short loc_2B447
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_4]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_4], eax

loc_2B447:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_2B48F

loc_2B45D:
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_2B468
		mov	ax, di
		jmp	short loc_2B474

loc_2B468:
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_2B474:
		or	ax, ax
		jz	short loc_2B483
		mov	dword ptr [di], 0
		mov	ax, di
		jmp	short loc_2B485

loc_2B483:
		mov	ax, di

loc_2B485:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2B355		endp

; START OF FUNCTION CHUNK FOR sub_2B355

loc_2B48F:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2B355

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B493		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_28984
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2B493		endp

; START OF FUNCTION CHUNK FOR sub_2B493
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2B493

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B4C5		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	3
		push	large 100h
		push	di
		push	cs
		call	near ptr sub_28E75
		add	sp, 8
		push	di
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		cmp	dword ptr [di], 0
		jnz	short loc_2B4FB
		cmp	dword ptr [di+4], 0
		jnz	short loc_2B4FB
		jmp	loc_2B581

loc_2B4FB:
		mov	[bp+var_2], di
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[si+10h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[si+14h], eax
		mov	eax, [di+4]
		shl	eax, 5
		mov	[si], eax
		mov	eax, [di]
		neg	eax
		shl	eax, 5
		mov	[si+4], eax
		mov	dword ptr [si+8], 0
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	cs
		call	near ptr sub_28624
		add	sp, 8
		mov	eax, [bp+var_E]
		mov	[si+18h], eax
		mov	eax, [bp+var_A]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_6]
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_28FB2
		add	sp, 2
		jmp	short loc_2B5CC

loc_2B581:
		mov	dword ptr [si], 100h
		xor	eax, eax
		mov	[si+20h], eax
		mov	[si+18h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	[si+4], eax
		cmp	dword ptr [di+8], 0
		jle	short loc_2B5BC
		mov	dword ptr [si+14h], 100h
		mov	dword ptr [si+1Ch], 0FFFFFF00h
		jmp	short loc_2B5CC

loc_2B5BC:
		mov	dword ptr [si+14h], 0FFFFFF00h
		mov	dword ptr [si+1Ch], 100h

loc_2B5CC:
		pop	di
		pop	si
		leave
		retf
sub_2B4C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B5D0		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_2B5EF
		push	large 24h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_2B609

loc_2B5EF:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Ch
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_2B613
		add	sp, 4

loc_2B609:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_2B5D0		endp

; START OF FUNCTION CHUNK FOR sub_2B5D0
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2B5D0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B613		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_4C882
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C886
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C88A
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C88E
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C892
		mov	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C896
		mov	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C89A
		mov	es:[bx+18h], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C89E
		mov	es:[bx+1Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4C8A2
		mov	es:[bx+20h], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2B613		endp

; START OF FUNCTION CHUNK FOR sub_2B613
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2B613

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B68B		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 30h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_4C882, eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_4C886, eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	dword_4C88A, eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	dword_4C88E, eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	dword_4C892, eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	dword_4C896, eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	dword_4C89A, eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	dword_4C89E, eax
		mov	[bp+var_24], 100h
		mov	eax, [bp+var_24]
		mov	dword_4C8A2, eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	dword_4C8A6, eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		mov	dword_4C8AA, eax
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	dword_4C8AE, eax
		push	6AA0h
		push	cs
		call	near ptr sub_2A4FF
		add	sp, 2
		push	ds
		push	offset unk_4F4A4
		push	cs
sub_2B68B		endp
seg070		ends
