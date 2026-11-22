ovr278		segment	para public 'OVERLAY' use16
		assume cs:ovr278
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3CC0		proc far

var_374		= dword ptr -374h
var_370		= dword ptr -370h
var_36C		= dword ptr -36Ch
var_368		= word ptr -368h
var_366		= word ptr -366h
var_364		= word ptr -364h
var_362		= word ptr -362h
var_360		= word ptr -360h
var_35E		= word ptr -35Eh
var_35C		= dword ptr -35Ch
var_358		= dword ptr -358h
var_354		= dword ptr -354h
var_350		= dword ptr -350h
var_34C		= dword ptr -34Ch
var_348		= dword ptr -348h
var_344		= dword ptr -344h
var_340		= dword ptr -340h
var_33C		= dword ptr -33Ch
var_338		= dword ptr -338h
var_334		= dword ptr -334h
var_330		= dword ptr -330h
var_32C		= dword ptr -32Ch
var_328		= dword ptr -328h
var_324		= dword ptr -324h
var_320		= dword ptr -320h
var_31C		= dword ptr -31Ch
var_318		= dword ptr -318h
var_314		= dword ptr -314h
var_310		= dword ptr -310h
var_30C		= dword ptr -30Ch
var_308		= dword ptr -308h
var_304		= dword ptr -304h
var_300		= dword ptr -300h
var_2FC		= dword ptr -2FCh
var_2F8		= dword ptr -2F8h
var_2F4		= dword ptr -2F4h
var_2F0		= dword ptr -2F0h
var_2EC		= dword ptr -2ECh
var_2E8		= dword ptr -2E8h
var_2E4		= dword ptr -2E4h
var_2E0		= dword ptr -2E0h
var_2DC		= dword ptr -2DCh
var_2D8		= dword ptr -2D8h
var_2D4		= dword ptr -2D4h
var_2D0		= dword ptr -2D0h
var_2CC		= word ptr -2CCh
var_2CA		= word ptr -2CAh
var_2C8		= word ptr -2C8h
var_2C6		= word ptr -2C6h
var_2C4		= word ptr -2C4h
var_2C2		= word ptr -2C2h
var_2C0		= word ptr -2C0h
var_2BE		= word ptr -2BEh
var_2BC		= word ptr -2BCh
var_2BA		= word ptr -2BAh
var_2B8		= word ptr -2B8h
var_2B4		= word ptr -2B4h
var_2B0		= word ptr -2B0h
var_2AC		= word ptr -2ACh
var_2A8		= word ptr -2A8h
var_2A4		= word ptr -2A4h
var_2A0		= word ptr -2A0h
var_29E		= word ptr -29Eh
var_29C		= word ptr -29Ch
var_29A		= word ptr -29Ah
var_280		= word ptr -280h
var_27E		= word ptr -27Eh
var_27C		= word ptr -27Ch
var_27A		= word ptr -27Ah
var_260		= word ptr -260h
var_25E		= word ptr -25Eh
var_25C		= word ptr -25Ch
var_25A		= word ptr -25Ah
var_240		= word ptr -240h
var_23E		= word ptr -23Eh
var_23C		= word ptr -23Ch
var_23A		= word ptr -23Ah
var_218		= word ptr -218h
var_204		= dword ptr -204h
var_200		= dword ptr -200h
var_1FC		= dword ptr -1FCh
var_1F8		= dword ptr -1F8h
var_1F4		= dword ptr -1F4h
var_1F0		= dword ptr -1F0h
var_1EC		= dword ptr -1ECh
var_1E8		= dword ptr -1E8h
var_1E4		= dword ptr -1E4h
var_1E0		= dword ptr -1E0h
var_1DC		= dword ptr -1DCh
var_1D8		= dword ptr -1D8h
var_1D4		= dword ptr -1D4h
var_1D0		= dword ptr -1D0h
var_1CC		= dword ptr -1CCh
var_1C8		= dword ptr -1C8h
var_1C4		= dword ptr -1C4h
var_1C0		= dword ptr -1C0h
var_1BC		= word ptr -1BCh
var_18C		= dword ptr -18Ch
var_188		= dword ptr -188h
var_184		= dword ptr -184h
var_180		= dword ptr -180h
var_17C		= dword ptr -17Ch
var_178		= dword ptr -178h
var_174		= word ptr -174h
var_150		= dword ptr -150h
var_14C		= dword ptr -14Ch
var_148		= dword ptr -148h
var_144		= dword ptr -144h
var_140		= dword ptr -140h
var_13C		= dword ptr -13Ch
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= dword ptr -130h
var_12C		= dword ptr -12Ch
var_128		= dword ptr -128h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= word ptr -11Ch
var_11A		= dword ptr -11Ah
var_116		= word ptr -116h
var_114		= dword ptr -114h
var_110		= word ptr -110h
var_10E		= dword ptr -10Eh
var_10A		= word ptr -10Ah
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_102		= dword ptr -102h
var_100		= dword ptr -100h
var_FE		= dword ptr -0FEh
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= word ptr -0F0h
var_EE		= word ptr -0EEh
var_EC		= word ptr -0ECh
var_EA		= word ptr -0EAh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_6		= dword ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 374h
		push	si
		push	di
		push	ds
		push	offset unk_7CB8A
		push	ds
		push	[bp+arg_A]
		mov	cx, 30h
		call	CRT_Fmemcpy
		mov	si, [bp+arg_E]
		mov	eax, [si]
		mov	dword_7CBBA, eax
		mov	eax, [si+4]
		mov	dword_7CBBE, eax
		mov	eax, [si+8]
		mov	dword_7CBC2, eax
		cmp	dword_7CB82, 0
		jnz	short loc_A3D04
		push	6452h
		nop
		push	cs
		call	near ptr sub_A588E
		pop	cx

loc_A3D04:
		push	6452h
		nop
		push	cs
		call	near ptr sub_A58BB
		pop	cx
		lea	ax, [bp+var_174]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		push	ds
		push	large offset unk_77996
		mov	cx, 0Ah
		call	CRT_Fmemcpy
		mov	[bp+var_12], 0
		mov	[bp+var_14], 0
		push	seg seg017
		push	offset sub_9532
		push	large 10005h
		push	0Ch
		lea	ax, word ptr [bp+var_1C8]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	large [bp+arg_6]
		les	bx, word ptr [bp+arg_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_A3DD7
		cmp	ax, 1
		jz	short loc_A3D74
		cmp	ax, 4
		jnz	short loc_A3D71
		jmp	loc_A3E48

loc_A3D71:
		jmp	loc_A3EBC

loc_A3D74:
		mov	[bp+var_6], 2
		mov	ax, word ptr [bp+arg_6+2]
		mov	dx, word ptr [bp+arg_6]
		add	dx, 4
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_1D4], eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_1D0], eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_1CC], eax
		mov	eax, [bp+var_1D4]
		mov	[bp+var_18C], eax
		mov	eax, [bp+var_1D0]
		mov	[bp+var_188], eax
		mov	eax, [bp+var_1CC]
		jmp	loc_A3EB7

loc_A3DD7:
		mov	[bp+var_6], 3
		mov	ax, word ptr [bp+arg_6+2]
		mov	dx, word ptr [bp+arg_6]
		add	dx, 10h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, word ptr [bp+arg_6]
		movsx	eax, word ptr es:[bx+4]
		mov	[bp+var_1E0], eax
		movsx	eax, word ptr es:[bx+6]
		mov	[bp+var_1DC], eax
		movsx	eax, word ptr es:[bx+8]
		mov	[bp+var_1D8], eax
		mov	eax, [bp+var_1E0]
		mov	[bp+var_1EC], eax
		mov	eax, [bp+var_1DC]
		mov	[bp+var_1E8], eax
		mov	eax, [bp+var_1D8]
		mov	[bp+var_1E4], eax
		mov	eax, [bp+var_1EC]
		mov	[bp+var_18C], eax
		mov	eax, [bp+var_1E8]
		mov	[bp+var_188], eax
		mov	eax, [bp+var_1E4]
		jmp	short loc_A3EB7

loc_A3E48:
		mov	[bp+var_6], 4
		mov	ax, word ptr [bp+arg_6+2]
		mov	dx, word ptr [bp+arg_6]
		add	dx, 10h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, word ptr [bp+arg_6]
		movsx	eax, word ptr es:[bx+4]
		mov	[bp+var_1F8], eax
		movsx	eax, word ptr es:[bx+6]
		mov	[bp+var_1F4], eax
		movsx	eax, word ptr es:[bx+8]
		mov	[bp+var_1F0], eax
		mov	eax, [bp+var_1F8]
		mov	[bp+var_204], eax
		mov	eax, [bp+var_1F4]
		mov	[bp+var_200], eax
		mov	eax, [bp+var_1F0]
		mov	[bp+var_1FC], eax
		mov	eax, [bp+var_204]
		mov	[bp+var_18C], eax
		mov	eax, [bp+var_200]
		mov	[bp+var_188], eax
		mov	eax, [bp+var_1FC]

loc_A3EB7:
		mov	[bp+var_184], eax

loc_A3EBC:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		cmp	word ptr [bx+26h], 0
		jz	short loc_A3ECE
		mov	ax, 1
		jmp	short loc_A3ED0

loc_A3ECE:
		xor	ax, ax

loc_A3ED0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3F18
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+2]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_180], eax
		mov	eax, [si+4]
		mov	[bp+var_17C], eax
		mov	eax, [si+8]
		mov	[bp+var_178], eax
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		jmp	short loc_A3F60

loc_A3F18:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_180], eax
		mov	eax, [si+4]
		mov	[bp+var_17C], eax
		mov	eax, [si+8]
		mov	[bp+var_178], eax

loc_A3F60:
		xor	di, di
		jmp	loc_A404A

loc_A3F65:
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+var_4]
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		les	ax, [bp+var_24]
		mov	[bp+var_26], ax
		mov	bx, di
		imul	bx, bx, 0Ch
		lea	ax, word ptr [bp+var_1C8]
		add	bx, ax
		mov	si, [bp+var_26]
		mov	eax, es:[si]
		mov	[bx], eax
		mov	bx, di
		imul	bx, bx, 0Ch
		lea	ax, word ptr [bp+var_1C4]
		add	bx, ax
		mov	eax, es:[si+4]
		mov	[bx], eax
		mov	bx, di
		imul	bx, bx, 0Ch
		lea	ax, word ptr [bp+var_1C0]
		add	bx, ax
		mov	eax, es:[si+8]
		mov	[bx], eax
		lea	ax, [bp+var_174]
		push	ax
		mov	ax, di
		imul	ax, ax, 0Ch
		lea	dx, word ptr [bp+var_1C8]
		add	ax, dx
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	bx, di
		imul	bx, bx, 0Ch
		lea	ax, word ptr [bp+var_1C8]
		add	bx, ax
		mov	eax, [bp+var_180]
		add	[bx], eax
		mov	bx, di
		imul	bx, bx, 0Ch
		lea	ax, word ptr [bp+var_1C4]
		add	bx, ax
		mov	eax, [bp+var_17C]
		add	[bx], eax
		mov	bx, di
		imul	bx, bx, 0Ch
		lea	ax, word ptr [bp+var_1C0]
		add	bx, ax
		mov	eax, [bp+var_178]
		add	[bx], eax
		mov	[bp+var_2A], 100h
		mov	bx, di
		imul	bx, bx, 0Ch
		lea	ax, word ptr [bp+var_1C0]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [bp+var_2A]
		jge	short loc_A4030
		mov	ax, 1
		jmp	short loc_A4032

loc_A4030:
		xor	ax, ax

loc_A4032:
		or	al, al
		jz	short loc_A4046
		inc	[bp+var_12]
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_10]
		add	bx, ax
		inc	word ptr [bx]
		jmp	short loc_A4049

loc_A4046:
		inc	[bp+var_14]

loc_A4049:
		inc	di

loc_A404A:
		cmp	di, [bp+var_6]
		jge	short loc_A4052
		jmp	loc_A3F65

loc_A4052:
		mov	ax, [bp+var_14]
		cmp	ax, [bp+var_6]
		jz	short loc_A4065
		mov	ax, [bp+var_12]
		cmp	ax, [bp+var_6]
		jz	short loc_A4065
		jmp	loc_A4114

loc_A4065:
		mov	ax, [bp+var_14]
		cmp	ax, [bp+var_6]
		jz	short loc_A4070
		jmp	loc_A50D3

loc_A4070:
		push	large [bp+arg_6]
		les	bx, word ptr [bp+arg_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	word ptr [bp+var_F4+2], dx
		mov	word ptr [bp+var_F4], ax
		cmp	[bp+var_F4], 0
		jnz	short loc_A4093
		jmp	loc_A50D3

loc_A4093:
		mov	eax, [bp+var_F4]
		mov	[bp+var_F8], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_A40B4
		mov	ax, 1
		jmp	short loc_A40B6

loc_A40B4:
		xor	ax, ax

loc_A40B6:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A40CE
		push	large [bp+var_F8]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_A40CE

loc_A40CE:
		mov	eax, dword_77959
		sar	eax, 8
		mov	ah, 0
		mov	word ptr [bp+var_FC+2], ax
		movsx	eax, word ptr [bp+var_FC+2]
		shl	eax, 8
		mov	[bp+var_FE], eax
		les	bx, word ptr [bp+var_F4]
		add	es:[bx+2], eax
		cmp	byte_7795D, 0
		jnz	short loc_A40FE
		jmp	loc_A50D3

loc_A40FE:
		mov	[bp+var_102], 7D00h
		mov	eax, [bp+var_102]
		add	es:[bx+2], eax
		jmp	loc_A50D3

loc_A4114:
		push	seg seg038
		push	offset sub_1B9B1
		push	large 10005h
		push	4
		lea	ax, [bp+var_218]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub278
		push	offset sub_73CD5
		push	large 10005h
		push	20h
		lea	ax, [bp+var_2B8]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_2C], 0
		mov	ax, word_7CB86
		add	ax, 0D2h
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A416C
		push	1271h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A416C

loc_A416C:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_34], eax
		add	word_7CB86, 0D2h
		mov	ax, word ptr [bp+var_34+2]
		mov	dx, word ptr [bp+var_34]
		mov	word ptr [bp+var_30+2], ax
		mov	word ptr [bp+var_30], dx
		mov	[bp+var_35], 0
		push	large [bp+arg_6]
		les	bx, word ptr [bp+arg_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	[bp+var_36], al
		cmp	[bp+var_36], 6
		jz	short loc_A41B8
		cmp	[bp+var_36], 8
		jz	short loc_A41B8
		cmp	[bp+var_36], 7
		jz	short loc_A41B8
		cmp	[bp+var_36], 9
		jz	short loc_A41B8
		jmp	loc_A42CB

loc_A41B8:
		mov	[bp+var_35], 1
		cmp	[bp+var_6], 3
		jnz	short loc_A4238
		mov	ax, word ptr [bp+arg_6+2]
		mov	dx, word ptr [bp+arg_6]
		add	dx, 20h
		mov	word ptr [bp+var_F4+2], ax
		mov	word ptr [bp+var_F4], dx
		les	bx, word ptr [bp+var_F4]
		mov	ax, es:[bx]
		mov	[bp+var_2A0], ax
		mov	ax, es:[bx+2]
		mov	[bp+var_29E], ax
		mov	ax, es:[bx+4]
		mov	[bp+var_29C], ax
		mov	ax, es:[bx+6]
		mov	[bp+var_29A], ax
		mov	ax, es:[bx+4]
		mov	[bp+var_280], ax
		mov	ax, es:[bx+6]
		mov	[bp+var_27E], ax
		mov	ax, es:[bx+8]
		mov	[bp+var_27C], ax
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_27A], ax
		mov	ax, es:[bx+8]
		mov	[bp+var_260], ax
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_25E], ax
		mov	ax, es:[bx]
		mov	[bp+var_25C], ax
		mov	ax, es:[bx+2]
		mov	[bp+var_25A], ax
		jmp	loc_A42CB

loc_A4238:
		mov	ax, word ptr [bp+arg_6+2]
		mov	dx, word ptr [bp+arg_6]
		add	dx, 24h
		mov	word ptr [bp+var_F4+2], ax
		mov	word ptr [bp+var_F4], dx
		les	bx, word ptr [bp+var_F4]
		mov	ax, es:[bx]
		mov	[bp+var_2A0], ax
		mov	ax, es:[bx+2]
		mov	[bp+var_29E], ax
		mov	ax, es:[bx+4]
		mov	[bp+var_29C], ax
		mov	ax, es:[bx+6]
		mov	[bp+var_29A], ax
		mov	ax, es:[bx+4]
		mov	[bp+var_280], ax
		mov	ax, es:[bx+6]
		mov	[bp+var_27E], ax
		mov	ax, es:[bx+8]
		mov	[bp+var_27C], ax
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_27A], ax
		mov	ax, es:[bx+8]
		mov	[bp+var_260], ax
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_25E], ax
		mov	ax, es:[bx+0Ch]
		mov	[bp+var_25C], ax
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_25A], ax
		mov	ax, es:[bx+0Ch]
		mov	[bp+var_240], ax
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_23E], ax
		mov	ax, es:[bx]
		mov	[bp+var_23C], ax
		mov	ax, es:[bx+2]
		mov	[bp+var_23A], ax

loc_A42CB:
		xor	di, di
		jmp	loc_A4373

loc_A42D0:
		mov	ax, di
		imul	ax, ax, 0Ch
		lea	dx, word ptr [bp+var_1C8]
		add	ax, dx
		mov	[bp+var_38], ax
		mov	ax, di
		imul	ax, ax, 0Ch
		lea	dx, [bp+var_1BC]
		add	ax, dx
		mov	[bp+var_3A], ax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2B8]
		add	bx, ax
		mov	si, [bp+var_38]
		mov	eax, [si]
		mov	[bx], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2B4]
		add	bx, ax
		mov	eax, [si+4]
		mov	[bx], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2B0]
		add	bx, ax
		mov	eax, [si+8]
		mov	[bx], eax
		mov	ax, di
		shl	ax, 5
		lea	dx, [bp+var_2B8]
		add	ax, dx
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2AC]
		add	bx, ax
		mov	si, [bp+var_3A]
		mov	eax, [si]
		mov	[bx], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A8]
		add	bx, ax
		mov	eax, [si+4]
		mov	[bx], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A4]
		add	bx, ax
		mov	eax, [si+8]
		mov	[bx], eax
		mov	ax, di
		shl	ax, 5
		lea	dx, [bp+var_2AC]
		add	ax, dx
		inc	di

loc_A4373:
		mov	ax, [bp+var_6]
		dec	ax
		cmp	ax, di
		jle	short loc_A437E
		jmp	loc_A42D0

loc_A437E:
		mov	di, [bp+var_6]
		imul	di, di, 0Ch
		lea	ax, word ptr [bp+var_1D4]
		add	di, ax
		mov	bx, [bp+var_6]
		shl	bx, 5
		lea	ax, word ptr [bp+var_2D8]
		add	bx, ax
		mov	eax, [di]
		mov	[bx], eax
		mov	bx, [bp+var_6]
		shl	bx, 5
		lea	ax, word ptr [bp+var_2D8]
		add	ax, 4
		add	bx, ax
		mov	eax, [di+4]
		mov	[bx], eax
		mov	bx, [bp+var_6]
		shl	bx, 5
		lea	ax, word ptr [bp+var_2D8]
		add	ax, 8
		add	bx, ax
		mov	eax, [di+8]
		mov	[bx], eax
		mov	ax, [bp+var_6]
		shl	ax, 5
		lea	dx, word ptr [bp+var_2D8]
		add	ax, dx
		mov	ax, [bp+var_6]
		shl	ax, 5
		lea	bx, word ptr [bp+var_2D8]
		add	bx, ax
		mov	eax, [bp+var_1C8]
		mov	[bx+0Ch], eax
		mov	ax, [bp+var_6]
		shl	ax, 5
		lea	bx, word ptr [bp+var_2D8]
		add	bx, ax
		mov	eax, [bp+var_1C4]
		mov	[bx+10h], eax
		mov	ax, [bp+var_6]
		shl	ax, 5
		lea	bx, word ptr [bp+var_2D8]
		add	bx, ax
		mov	eax, [bp+var_1C0]
		mov	[bx+14h], eax
		mov	ax, [bp+var_6]
		shl	ax, 5
		add	dx, 0Ch
		add	ax, dx
		xor	di, di
		jmp	loc_A44E9

loc_A4423:
		mov	[bp+var_3E], 100h
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A4]
		add	bx, ax
		mov	eax, [bx]
		mov	bx, di
		shl	bx, 5
		lea	dx, [bp+var_2B0]
		add	bx, dx
		cmp	eax, [bx]
		jnz	short loc_A4456
		mov	ax, 1
		jmp	short loc_A4458

loc_A4456:
		xor	ax, ax

loc_A4458:
		or	al, al
		jz	short loc_A4473
		mov	[bp+var_46], 0FFFFFF00h
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_4A]
		jmp	short loc_A44D6

loc_A4473:
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2A4]
		add	si, ax
		mov	ax, di
		shl	ax, 5
		lea	dx, [bp+var_2B0]
		add	ax, dx
		mov	[bp+var_4C], ax
		mov	eax, [si]
		mov	bx, [bp+var_4C]
		sub	eax, [bx]
		mov	[bp+var_50], eax
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B0]
		add	si, ax
		mov	eax, [bp+var_42]
		sub	eax, [si]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	edx, eax
		mov	ecx, [bp+var_50]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_4A], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_4A]

loc_A44D6:
		mov	eax, [bp+var_4A]
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_218]
		add	bx, dx
		mov	[bx], eax
		inc	di

loc_A44E9:
		cmp	di, [bp+var_6]
		jge	short loc_A44F1
		jmp	loc_A4423

loc_A44F1:
		xor	di, di
		jmp	short loc_A4550

loc_A44F5:
		mov	[bp+var_58], 0
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_218]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [bp+var_58]
		jl	short loc_A4516
		mov	ax, 1
		jmp	short loc_A4518

loc_A4516:
		xor	ax, ax

loc_A4518:
		or	al, al
		jz	short loc_A454F
		mov	[bp+var_5C], 100h
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_218]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [bp+var_5C]
		jg	short loc_A453D
		mov	ax, 1
		jmp	short loc_A453F

loc_A453D:
		xor	ax, ax

loc_A453F:
		or	al, al
		jz	short loc_A454F
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_10]
		add	bx, ax
		add	word ptr [bx], 2

loc_A454F:
		inc	di

loc_A4550:
		cmp	di, [bp+var_6]
		jl	short loc_A44F5
		xor	di, di
		jmp	loc_A4EED

loc_A455A:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_10]
		add	bx, ax
		mov	ax, [bx]
		or	ax, ax
		jz	short loc_A457C
		cmp	ax, 2
		jnz	short loc_A4571
		jmp	loc_A46CA

loc_A4571:
		cmp	ax, 3
		jnz	short loc_A4579
		jmp	loc_A4B74

loc_A4579:
		jmp	loc_A4EEC

loc_A457C:
		mov	si, di
		imul	si, si, 0Ch
		lea	ax, word ptr [bp+var_1C8]
		add	si, ax
		mov	eax, [si]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx], eax
		mov	eax, [si+4]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	eax, [si+8]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+8], eax
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+var_4]
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 0Ch
		mov	[bp+var_5E], ax
		mov	[bp+var_60], dx
		les	si, [bp+var_60]
		mov	eax, es:[si]
		mov	[bp+var_2D8], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2D4], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2D0], eax
		mov	eax, [bp+var_2D8]
		sub	eax, [bp+var_18C]
		mov	[bp+var_2E4], eax
		mov	eax, [bp+var_2D4]
		sub	eax, [bp+var_188]
		mov	[bp+var_2E0], eax
		mov	eax, [bp+var_2D0]
		sub	eax, [bp+var_184]
		mov	[bp+var_2DC], eax
		mov	eax, [bp+var_2E4]
		mov	[bp+var_2F0], eax
		mov	eax, [bp+var_2E0]
		mov	[bp+var_2EC], eax
		mov	eax, [bp+var_2DC]
		mov	[bp+var_2E8], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_2F0]
		mov	es:[bx+0Ch], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_2EC]
		mov	es:[bx+10h], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_2E8]
		mov	es:[bx+14h], eax
		cmp	[bp+var_35], 0
		jnz	short loc_A468E
		jmp	loc_A4EE9

loc_A468E:
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A0]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, [bp+var_2C]
		shl	bx, 2
		lea	dx, [bp+var_2CC]
		add	bx, dx
		mov	[bx], ax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29E]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, [bp+var_2C]
		shl	bx, 2
		lea	dx, [bp+var_2CA]
		add	bx, dx
		mov	[bx], ax
		jmp	loc_A4EE9
		jmp	loc_A4EE9

loc_A46CA:
		mov	si, di
		imul	si, si, 0Ch
		lea	ax, word ptr [bp+var_1C8]
		add	si, ax
		mov	eax, [si]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx], eax
		mov	eax, [si+4]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	eax, [si+8]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+8], eax
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+var_4]
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 0Ch
		mov	[bp+var_62], ax
		mov	[bp+var_64], dx
		les	si, [bp+var_64]
		mov	eax, es:[si]
		mov	[bp+var_2FC], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2F8], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2F4], eax
		mov	eax, [bp+var_2FC]
		sub	eax, [bp+var_18C]
		mov	[bp+var_308], eax
		mov	eax, [bp+var_2F8]
		sub	eax, [bp+var_188]
		mov	[bp+var_304], eax
		mov	eax, [bp+var_2F4]
		sub	eax, [bp+var_184]
		mov	[bp+var_300], eax
		mov	eax, [bp+var_308]
		mov	[bp+var_314], eax
		mov	eax, [bp+var_304]
		mov	[bp+var_310], eax
		mov	eax, [bp+var_300]
		mov	[bp+var_30C], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_314]
		mov	es:[bx+0Ch], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_310]
		mov	es:[bx+10h], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_30C]
		mov	es:[bx+14h], eax
		cmp	[bp+var_35], 0
		jz	short loc_A480F
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A0]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, [bp+var_2C]
		shl	bx, 2
		lea	dx, [bp+var_2CC]
		add	bx, dx
		mov	[bx], ax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29E]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, [bp+var_2C]
		shl	bx, 2
		lea	dx, [bp+var_2CA]
		add	bx, dx
		mov	[bx], ax

loc_A480F:
		inc	[bp+var_2C]
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B8]
		add	si, ax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2AC]
		add	bx, ax
		mov	eax, [bx]
		sub	eax, [si]
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_6C]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B8]
		add	si, ax
		mov	eax, [bp+var_74]
		add	eax, [si]
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx], eax
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B4]
		add	si, ax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A8]
		add	bx, ax
		mov	eax, [bx]
		sub	eax, [si]
		mov	[bp+var_84], eax
		mov	[bp+var_88], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_88]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_90], eax
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B4]
		add	si, ax
		mov	eax, [bp+var_90]
		add	eax, [si]
		mov	[bp+var_94], eax
		mov	[bp+var_98], eax
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_9C]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	[bp+var_A0], 100h
		mov	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+8], eax
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+var_4]
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 0Ch
		mov	[bp+var_A6], ax
		mov	[bp+var_A8], dx
		les	si, [bp+var_A8]
		mov	eax, es:[si]
		mov	[bp+var_320], eax
		mov	eax, es:[si+4]
		mov	[bp+var_31C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_318], eax
		mov	eax, [bp+var_320]
		sub	eax, [bp+var_18C]
		mov	[bp+var_32C], eax
		mov	eax, [bp+var_31C]
		sub	eax, [bp+var_188]
		mov	[bp+var_328], eax
		mov	eax, [bp+var_318]
		sub	eax, [bp+var_184]
		mov	[bp+var_324], eax
		mov	eax, [bp+var_32C]
		mov	[bp+var_338], eax
		mov	eax, [bp+var_328]
		mov	[bp+var_334], eax
		mov	eax, [bp+var_324]
		mov	[bp+var_330], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_338]
		mov	es:[bx+0Ch], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_334]
		mov	es:[bx+10h], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_330]
		mov	es:[bx+14h], eax
		cmp	[bp+var_35], 0
		jnz	short loc_A4A0C
		jmp	loc_A4EE9

loc_A4A0C:
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A0]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_10A], ax
		movsx	eax, [bp+var_10A]
		shl	eax, 8
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_F4], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29E]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_110], ax
		movsx	eax, [bp+var_110]
		shl	eax, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_FC], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29C]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_116], ax
		movsx	eax, [bp+var_116]
		shl	eax, 8
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_F8], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29A]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_11C], ax
		movsx	eax, [bp+var_11C]
		shl	eax, 8
		mov	[bp+var_120], eax
		mov	eax, [bp+var_120]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_F8]
		sub	eax, [bp+var_F4]
		mov	[bp+var_124], eax
		mov	[bp+var_128], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_128]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_130], eax
		add	eax, [bp+var_F4]
		mov	[bp+var_134], eax
		mov	[bp+var_138], eax
		mov	[bp+var_104], eax
		mov	eax, [bp+var_100]
		sub	eax, [bp+var_FC]
		mov	[bp+var_13C], eax
		mov	[bp+var_140], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_140]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_144], eax
		mov	eax, [bp+var_144]
		mov	[bp+var_148], eax
		add	eax, [bp+var_FC]
		mov	[bp+var_14C], eax
		mov	[bp+var_150], eax
		mov	[bp+var_108], eax
		mov	ax, word ptr [bp+var_104+1]
		mov	bx, [bp+var_2C]
		shl	bx, 2
		lea	dx, [bp+var_2CC]
		add	bx, dx
		mov	[bx], ax
		mov	ax, word ptr [bp+var_108+1]
		jmp	loc_A4EDB
		jmp	loc_A4EE9

loc_A4B74:
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B8]
		add	si, ax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2AC]
		add	bx, ax
		mov	eax, [bx]
		sub	eax, [si]
		mov	[bp+var_AC], eax
		mov	[bp+var_B0], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_B0]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_B8], eax
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B8]
		add	si, ax
		mov	eax, [bp+var_B8]
		add	eax, [si]
		mov	[bp+var_BC], eax
		mov	[bp+var_C0], eax
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_C4]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx], eax
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B4]
		add	si, ax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A8]
		add	bx, ax
		mov	eax, [bx]
		sub	eax, [si]
		mov	[bp+var_C8], eax
		mov	[bp+var_CC], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_CC]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_D4], eax
		mov	si, di
		shl	si, 5
		lea	ax, [bp+var_2B4]
		add	si, ax
		mov	eax, [bp+var_D4]
		add	eax, [si]
		mov	[bp+var_D8], eax
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E0]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	[bp+var_E4], 100h
		mov	eax, [bp+var_E4]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_E8]
		mov	dx, [bp+var_2C]
		imul	dx, dx, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, dx
		mov	es:[bx+8], eax
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+var_4]
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 0Ch
		mov	[bp+var_EA], ax
		mov	[bp+var_EC], dx
		les	si, [bp+var_EC]
		mov	eax, es:[si]
		mov	[bp+var_344], eax
		mov	eax, es:[si+4]
		mov	[bp+var_340], eax
		mov	eax, es:[si+8]
		mov	[bp+var_33C], eax
		mov	eax, [bp+var_344]
		sub	eax, [bp+var_18C]
		mov	[bp+var_350], eax
		mov	eax, [bp+var_340]
		sub	eax, [bp+var_188]
		mov	[bp+var_34C], eax
		mov	eax, [bp+var_33C]
		sub	eax, [bp+var_184]
		mov	[bp+var_348], eax
		mov	eax, [bp+var_350]
		mov	[bp+var_35C], eax
		mov	eax, [bp+var_34C]
		mov	[bp+var_358], eax
		mov	eax, [bp+var_348]
		mov	[bp+var_354], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_35C]
		mov	es:[bx+0Ch], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_358]
		mov	es:[bx+10h], eax
		mov	ax, [bp+var_2C]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_354]
		mov	es:[bx+14h], eax
		cmp	[bp+var_35], 0
		jnz	short loc_A4D79
		jmp	loc_A4EE9

loc_A4D79:
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_2A0]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_10A], ax
		movsx	eax, [bp+var_10A]
		shl	eax, 8
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_F4], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29E]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_110], ax
		movsx	eax, [bp+var_110]
		shl	eax, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_FC], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29C]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_116], ax
		movsx	eax, [bp+var_116]
		shl	eax, 8
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_F8], eax
		mov	bx, di
		shl	bx, 5
		lea	ax, [bp+var_29A]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_11C], ax
		movsx	eax, [bp+var_11C]
		shl	eax, 8
		mov	[bp+var_120], eax
		mov	eax, [bp+var_120]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_F8]
		sub	eax, [bp+var_F4]
		mov	[bp+var_124], eax
		mov	[bp+var_128], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_128]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_130], eax
		add	eax, [bp+var_F4]
		mov	[bp+var_134], eax
		mov	[bp+var_138], eax
		mov	[bp+var_104], eax
		mov	eax, [bp+var_100]
		sub	eax, [bp+var_FC]
		mov	[bp+var_13C], eax
		mov	[bp+var_140], eax
		mov	si, di
		shl	si, 2
		lea	ax, [bp+var_218]
		add	si, ax
		mov	eax, [bp+var_140]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_144], eax
		mov	eax, [bp+var_144]
		mov	[bp+var_148], eax
		add	eax, [bp+var_FC]
		mov	[bp+var_14C], eax
		mov	[bp+var_150], eax
		mov	[bp+var_108], eax
		mov	ax, word ptr [bp+var_104+1]
		mov	bx, [bp+var_2C]
		shl	bx, 2
		lea	dx, [bp+var_2CC]
		add	bx, dx
		mov	[bx], ax
		mov	ax, word ptr [bp+var_108+1]

loc_A4EDB:
		mov	bx, [bp+var_2C]
		shl	bx, 2
		lea	dx, [bp+var_2CA]
		add	bx, dx
		mov	[bx], ax

loc_A4EE9:
		inc	[bp+var_2C]

loc_A4EEC:
		inc	di

loc_A4EED:
		cmp	di, [bp+var_6]
		jge	short loc_A4EF5
		jmp	loc_A455A

loc_A4EF5:
		mov	ax, [bp+var_2CC]
		mov	[bp+var_368], ax
		mov	ax, [bp+var_2CA]
		mov	[bp+var_366], ax
		mov	ax, [bp+var_2C8]
		mov	[bp+var_364], ax
		mov	ax, [bp+var_2C6]
		mov	[bp+var_362], ax
		mov	ax, [bp+var_2C4]
		mov	[bp+var_360], ax
		mov	ax, [bp+var_2C2]
		mov	[bp+var_35E], ax
		xor	di, di
		jmp	loc_A4FCC

loc_A4F2A:
		mov	ax, di
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_30+2]
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	[bp+var_EE], dx
		mov	[bp+var_F0], bx
		les	si, [bp+var_F0]
		mov	eax, es:[si]
		mov	[bp+var_374], eax
		mov	eax, es:[si+4]
		mov	[bp+var_370], eax
		mov	eax, es:[si+8]
		mov	[bp+var_36C], eax
		mov	eax, [bp+var_180]
		sub	[bp+var_374], eax
		mov	eax, [bp+var_17C]
		sub	[bp+var_370], eax
		mov	eax, [bp+var_178]
		sub	[bp+var_36C], eax
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, word ptr [bp+var_374]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	ax, di
		imul	ax, ax, 2Ah
		les	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_374]
		mov	es:[bx], eax
		mov	ax, di
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_370]
		mov	es:[bx+4], eax
		mov	ax, di
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	eax, [bp+var_36C]
		mov	es:[bx+8], eax
		inc	di

loc_A4FCC:
		cmp	di, [bp+var_2C]
		jge	short loc_A4FD4
		jmp	loc_A4F2A

loc_A4FD4:
		push	ss
		lea	ax, [bp+var_368]
		push	ax
		push	[bp+arg_C]
		mov	ax, word ptr [bp+var_30]
		add	ax, 54h
		push	word ptr [bp+var_30+2]
		push	ax
		mov	ax, word ptr [bp+var_30]
		add	ax, 2Ah
		push	word ptr [bp+var_30+2]
		push	ax
		push	large [bp+var_30]
		push	large [bp+arg_6]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_A50D7
		add	sp, 1Ah
		cmp	[bp+var_2C], 3
		jle	short loc_A506C
		mov	ax, [bp+var_2CC]
		mov	[bp+var_368], ax
		mov	ax, [bp+var_2CA]
		mov	[bp+var_366], ax
		mov	ax, [bp+var_2C4]
		mov	[bp+var_364], ax
		mov	ax, [bp+var_2C2]
		mov	[bp+var_362], ax
		mov	ax, [bp+var_2C0]
		mov	[bp+var_360], ax
		mov	ax, [bp+var_2BE]
		mov	[bp+var_35E], ax
		push	ss
		lea	ax, [bp+var_368]
		push	ax
		push	[bp+arg_C]
		mov	ax, word ptr [bp+var_30]
		add	ax, 7Eh
		push	word ptr [bp+var_30+2]
		push	ax
		mov	ax, word ptr [bp+var_30]
		add	ax, 54h
		push	word ptr [bp+var_30+2]
		push	ax
		push	large [bp+var_30]
		push	large [bp+arg_6]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_A50D7
		add	sp, 1Ah

loc_A506C:
		cmp	[bp+var_2C], 4
		jle	short loc_A50D3
		mov	ax, [bp+var_2CC]
		mov	[bp+var_368], ax
		mov	ax, [bp+var_2CA]
		mov	[bp+var_366], ax
		mov	ax, [bp+var_2C0]
		mov	[bp+var_364], ax
		mov	ax, [bp+var_2BE]
		mov	[bp+var_362], ax
		mov	ax, [bp+var_2BC]
		mov	[bp+var_360], ax
		mov	ax, [bp+var_2BA]
		mov	[bp+var_35E], ax
		push	ss
		lea	ax, [bp+var_368]
		push	ax
		push	[bp+arg_C]
		mov	ax, word ptr [bp+var_30]
		add	ax, 0A8h
		push	word ptr [bp+var_30+2]
		push	ax
		mov	ax, word ptr [bp+var_30]
		add	ax, 7Eh
		push	word ptr [bp+var_30+2]
		push	ax
		push	large [bp+var_30]
		push	large [bp+arg_6]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_A50D7
		add	sp, 1Ah

loc_A50D3:
		pop	di
		pop	si
		leave
		retf
sub_A3CC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A50D7		proc far

var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= word ptr -40h
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
var_E		= word ptr -0Eh
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= word ptr  1Ah
arg_16		= dword ptr  1Ch

		push	bp
		mov	bp, sp
		sub	sp, 48h
		mov	byte_779A0, 1
		cmp	[bp+arg_8], 0
		jz	short loc_A50F7
		cmp	[bp+arg_C], 0
		jz	short loc_A50F7
		cmp	[bp+arg_10], 0
		jnz	short loc_A5100

loc_A50F7:
		push	0B00Bh
		call	sub_1DDFE
		pop	cx

loc_A5100:
		mov	[bp+var_1], 0
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		cmp	al, 4
		jnz	short loc_A511C
		mov	[bp+var_1], 1

loc_A511C:
		mov	[bp+var_12], 0
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 9
		jbe	short loc_A5140
		jmp	loc_A5726

loc_A5140:
		shl	bx, 1
		jmp	cs:off_A584C[bx]	; switch jump

loc_A5147:
		mov	ax, word_7CB86
		add	ax, 1Eh
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A5164
		push	127Fh
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A5164

loc_A5164:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_16], eax
		add	word_7CB86, 1Eh
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB50
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A51A0
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Ch]
		jmp	short loc_A51A7

loc_A51A0:
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]

loc_A51A7:
		mov	byte ptr [bp+var_E+1], al
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	FaceType0_Setup_26BF5
		jmp	loc_A5723

loc_A51C7:
		mov	ax, word_7CB86
		add	ax, 1Eh
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A51E4
		push	128Dh
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A51E4

loc_A51E4:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_1A], eax
		add	word_7CB86, 1Eh
		mov	ax, word ptr [bp+var_1A+2]
		mov	dx, word ptr [bp+var_1A]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB58
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A5220
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Ch]
		jmp	short loc_A5227

loc_A5220:
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]

loc_A5227:
		mov	byte ptr [bp+var_E+1], al
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	FaceType1_Setup_26DF3
		jmp	loc_A5723

loc_A5247:
		mov	ax, word_7CB86
		add	ax, 20h
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A5264
		push	129Bh
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A5264

loc_A5264:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_1E], eax
		add	word_7CB86, 20h
		mov	ax, word ptr [bp+var_1E+2]
		mov	dx, word ptr [bp+var_1E]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB54
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	FaceType2_Setup_26FE3
		add	sp, 14h
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A52C7
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+1Ch]

loc_A52BC:
		les	bx, word ptr [bp+var_6]

loc_A52BF:
		mov	es:[bx+1Ch], eax
		jmp	loc_A5726

loc_A52C7:
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+20h]
		jmp	short loc_A52BC

loc_A52D1:
		mov	ax, word_7CB86
		add	ax, 24h
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A52EE
		push	12A9h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A52EE

loc_A52EE:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_22], eax
		add	word_7CB86, 24h
		mov	ax, word ptr [bp+var_22+2]
		mov	dx, word ptr [bp+var_22]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB5C
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	sub_273F6
		add	sp, 14h
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A5382
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Eh]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+1Eh], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+22h]
		shr	ax, 2
		and	ax, 1
		and	ax, 1
		les	bx, word ptr [bp+var_6]
		and	byte ptr es:[bx+22h], 0FBh
		shl	al, 2
		or	es:[bx+22h], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Fh]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+1Fh], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]
		jmp	short loc_A53C4

loc_A5382:
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+22h]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+1Eh], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+27h]
		shr	ax, 2
		and	ax, 1
		and	ax, 1
		les	bx, word ptr [bp+var_6]
		and	byte ptr es:[bx+22h], 0FBh
		shl	al, 2
		or	es:[bx+22h], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+23h]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+1Fh], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+26h]

loc_A53C4:
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+20h], al
		jmp	loc_A5726

loc_A53CE:
		mov	ax, word_7CB86
		add	ax, 1Eh
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A53EB
		push	12B7h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A53EB

loc_A53EB:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_26], eax
		add	word_7CB86, 1Eh
		mov	ax, word ptr [bp+var_26+2]
		mov	dx, word ptr [bp+var_26]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB60
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	sub_27714
		add	sp, 14h
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A5452
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Ch]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+1Ch], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Dh]
		jmp	short loc_A5467

loc_A5452:
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+1Ch], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+21h]

loc_A5467:
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+1Dh], al
		jmp	loc_A5726

loc_A5471:
		mov	ax, word_7CB86
		add	ax, 2Ch
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A548E
		push	12C5h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A548E

loc_A548E:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_2A], eax
		add	word_7CB86, 2Ch
		mov	ax, word ptr [bp+var_2A+2]
		mov	dx, word ptr [bp+var_2A]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB64
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	sub_2690E
		add	sp, 14h
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_A54E1
		jmp	loc_A568C

loc_A54E1:
		jmp	loc_A568C
		jmp	loc_A568C

loc_A54E7:
		mov	ax, word_7CB86
		add	ax, 34h
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A5504
		push	12D3h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A5504

loc_A5504:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_2E], eax
		add	word_7CB86, 34h
		mov	ax, word ptr [bp+var_2E+2]
		mov	dx, word ptr [bp+var_2E]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB68
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	sub_27CDB
		add	sp, 14h
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A55A0
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+2Eh]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+2Eh], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+32h]
		shr	ax, 2
		and	ax, 1
		and	ax, 1
		les	bx, word ptr [bp+var_6]
		and	byte ptr es:[bx+32h], 0FBh
		shl	al, 2
		or	es:[bx+32h], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+2Fh]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+2Fh], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+30h]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+30h], al
		jmp	loc_A568C

loc_A55A0:
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+36h]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+2Eh], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+3Ah]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+30h], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+3Bh]
		shr	ax, 2
		and	ax, 1
		and	ax, 1
		les	bx, word ptr [bp+var_6]
		and	byte ptr es:[bx+32h], 0FBh
		shl	al, 2
		or	es:[bx+32h], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+37h]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+2Fh], al
		jmp	loc_A568C

loc_A55EC:
		mov	ax, word_7CB86
		add	ax, 2Eh
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A5609
		push	12E1h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A5609

loc_A5609:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_32], eax
		add	word_7CB86, 2Eh
		mov	ax, word ptr [bp+var_32+2]
		mov	dx, word ptr [bp+var_32]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB6C
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	sub_2806D
		add	sp, 14h
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A5670
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+2Ch]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+2Ch], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+2Dh]
		jmp	short loc_A5685

loc_A5670:
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+34h]
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+2Ch], al
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+35h]

loc_A5685:
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+2Dh], al

loc_A568C:
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+28h]
		add	sp, 4
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	ax, word ptr [bp+var_6]
		add	ax, 20h
		push	word ptr [bp+var_6+2]
		push	ax
		push	large [bp+arg_16]
		mov	cx, 0Ch
		call	CRT_Fmemcpy
		les	bx, word ptr [bp+var_6]
		mov	eax, [bp+var_12]
		jmp	loc_A52BF

loc_A56C2:
		mov	ax, word_7CB86
		add	ax, 36h
		mov	dx, word ptr dword_7CB82
		add	dx, 3E8h
		cmp	ax, dx
		jbe	short loc_A56DF
		push	12EFh
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_A56DF

loc_A56DF:
		mov	eax, dword ptr word_7CB86
		mov	[bp+var_36], eax
		add	word_7CB86, 36h
		mov	ax, word ptr [bp+var_36+2]
		mov	dx, word ptr [bp+var_36]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	2
		push	large dword_7CB70
		push	ax
		push	dx
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+var_6]
		call	sub_2690E

loc_A5723:
		add	sp, 14h

loc_A5726:
		les	bx, word ptr [bp+arg_8]
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
		and	byte ptr es:[bx+29h], 0FEh
		les	bx, word ptr [bp+arg_C]
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
		and	byte ptr es:[bx+29h], 0FEh
		les	bx, word ptr [bp+arg_10]
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
		and	byte ptr es:[bx+29h], 0FEh
		push	large [bp+var_6]
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		push	[bp+arg_14]
		push	large [bp+var_6]
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 6
		les	bx, word ptr [bp+var_6]
		or	byte ptr es:[bx+2], 1
		mov	word_77957, 0
		push	648Ah
		push	645Ah
		push	word ptr [bp+var_6+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+14h]
		add	sp, 8
		or	al, al
		jnz	short loc_A57B6
		jmp	loc_A5845

loc_A57B6:
		push	large [bp+var_6]
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	word ptr [bp+var_3A+2], dx
		mov	word ptr [bp+var_3A], ax
		cmp	[bp+var_3A], 0
		jz	short loc_A5845
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_A57F2
		mov	ax, 1
		jmp	short loc_A57F4

loc_A57F2:
		xor	ax, ax

loc_A57F4:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A580B
		push	large [bp+var_3E]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_A580B

loc_A580B:
		mov	eax, dword_77959
		sar	eax, 8
		mov	ah, 0
		mov	[bp+var_40], ax
		movsx	eax, [bp+var_40]
		shl	eax, 8
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+var_3A]
		add	es:[bx+2], eax
		cmp	byte_7795D, 0
		jz	short loc_A5845
		mov	[bp+var_48], 7D00h
		mov	eax, [bp+var_48]
		add	es:[bx+2], eax

loc_A5845:
		mov	byte_779A0, 0
		leave
		retf
sub_A50D7		endp

; START OF FUNCTION CHUNK FOR sub_A50D7
off_A584C	dw offset loc_A5147
		dw offset loc_A51C7
		dw offset loc_A5247
		dw offset loc_A5726
		dw offset loc_A52D1
		dw offset loc_A53CE
		dw offset loc_A5471
		dw offset loc_A54E7
		dw offset loc_A55EC
		dw offset loc_A56C2
; END OF FUNCTION CHUNK FOR sub_A50D7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A5860		proc far
		push	bp
		mov	bp, sp
		mov	dword_7CB82, 0
		mov	dword ptr word_7CB86, 0
		push	645Ah
		call	Damage_ComputeHelperA_58243
		pop	cx
		pop	bp
		retf
sub_A5860		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A5880		proc far
		push	bp
		mov	bp, sp
		push	6452h
		nop
		push	cs
		call	near ptr sub_A58DB
		pop	cx
		pop	bp
		retf
sub_A5880		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A588E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	0
		push	2
		push	large 3E8h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+2], dx
		mov	[si], ax
		push	si
		nop
		push	cs
		call	near ptr sub_A58BB
		pop	cx
		pop	si
		pop	bp
		retf
sub_A588E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A58BB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		mov	[si+4], eax
		pop	si
		pop	bp
		retf
sub_A58BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A58CC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 0Ch
		mov	ax, dx
		pop	bp
		retf
sub_A58CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A58DB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si], 0
		jz	short loc_A58F8
		push	0
		push	2
		push	si
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_A58F8:
		mov	dword ptr [si], 0
		mov	dword ptr [si+4], 0
		pop	si
		pop	bp
		retf
sub_A58DB		endp
ovr278		ends
