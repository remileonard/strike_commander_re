seg074		segment	byte public 'CODE' use16
		assume cs:seg074
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,2938 lignes — la plus grosse fonction de toute la base. Déclenche le streaming de
; secteur terrain (sub_33735), configure la caméra (mêmes globals dword_7220A/E/212 que le
; pipeline objet sub_2FEE2), fixe les bornes de clipping (dword_6EB14/18, partagées avec
; sub_2FEE2), résout la texture terrain (sub_5C832), puis itère sur la grille de sommets du
; secteur (segment GS) en les transformant/soumettant au rendu. Pipeline principal de rendu du
; terrain — l'équivalent 'terrain' de la fonction de rendu d'objets sub_2FEE2 (seg069).
; Priorité absolue pour une session d'analyse dédiée.
; ==============================================================================================
Render_TerrainPipelineMain	proc far		; CODE XREF: Terrain_TileBoundaryTest+78P

var_584		= byte ptr -584h
var_582		= byte ptr -582h
var_580		= byte ptr -580h
var_57E		= word ptr -57Eh
var_57C		= word ptr -57Ch
var_57A		= word ptr -57Ah
var_578		= dword	ptr -578h
var_570		= word ptr -570h
var_330		= word ptr -330h
var_EC		= dword	ptr -0ECh
var_E8		= word ptr -0E8h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_A0		= word ptr -0A0h
var_98		= word ptr -98h
var_96		= word ptr -96h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	584h, 0
		push	si
		push	di
		push	ds

loc_345DD:				; DATA XREF: seg216:0316o
		mov	[bp+var_EC], 12345678h

loc_345E6:
		mov	[bp+var_578], 12345678h
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	Terrain_SectorStreamMain
		add	sp, 4
		mov	eax, dword_6E33D
		mov	dword_72C2C, eax
		movzx	eax, word_7223E
		shl	eax, 8
		mov	[bp+var_4], eax
		movzx	eax, word_72240
		shl	eax, 8

loc_3461E:
		mov	[bp+var_8], eax
		movzx	eax, word_72242
		shl	eax, 8
		mov	[bp+var_C], eax
		movzx	eax, word_72244
		shl	eax, 8
		mov	[bp+var_10], eax
		movsx	eax, word_721FE
		shl	eax, 8
		mov	[bp+var_14], eax
		movsx	eax, word_72200
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	ecx, [si+9]
		mov	eax, dword_72216
		imul	ecx
		mov	[bp+var_40], eax
		mov	eax, dword_72222
		imul	ecx
		mov	[bp+var_3C], eax
		mov	eax, dword_7222E
		imul	ecx
		mov	[bp+var_38], eax

loc_3467F:
		mov	eax, dword_7221A
		imul	ecx
		mov	[bp+var_4C], eax
		mov	eax, dword_72226
		imul	ecx

loc_34691:
		mov	[bp+var_48], eax
		mov	eax, dword_72232
		imul	ecx
		mov	[bp+var_44], eax
		shl	ecx, 8
		mov	ax, [si+3Fh]
		cwde
		imul	ecx
		sub	eax, dword_7220A
		mov	[bp+var_34], eax
		mov	ax, [si+41h]
		cwde
		imul	ecx
		sub	eax, dword_7220E
		mov	[bp+var_30], eax
		mov	eax, 0
		sub	eax, dword_72212
		mov	[bp+var_2C], eax
		mov	ax, 5166h
		push	ax

loc_346D9:
		lea	ax, [bp+var_34]

loc_346DC:
		push	ax
		call	Math_ApplyRotationHelperA_58768

loc_346E2:
		add	sp, 4
		mov	eax, [si+5]
		mov	dword_6EB14, eax
		mov	eax, [si+1]
		mov	dword_6EB18, eax
		mov	ax, [si+17h]
		mov	[bp+var_4E], ax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large dword ptr	[si+19h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68, ax
		mov	word ptr dword_6EA68+2,	dx
		mov	gs, dx
		mov	di, si
		mov	si, [di+25h]
		mov	[bp+var_56], 0

loc_34723:				; CODE XREF: Render_TerrainPipelineMain+286j
		mov	eax, [bp+var_34]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax

loc_34733:
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	bx, [bp+var_56]
		add	bx, [di+3Dh]
		mov	ax, [bx]
		mov	[bp+var_54], ax
		mov	bx, [bp+var_56]
		add	bx, [di+3Bh]
		mov	dx, [bx]
		mov	[bp+var_50], dx
		add	ax, dx
		dec	ax
		mov	[bp+var_52], ax
		mov	[bp+var_58], 0

loc_3475C:				; CODE XREF: Render_TerrainPipelineMain+25Ej
		mov	byte ptr gs:[si+10h], 1
		mov	bx, [bp+var_4E]
		mov	ecx, [bx]
		mov	gs:[si+11h], ecx
		mov	eax, [bp+var_28]
		mov	gs:[si], eax
		mov	eax, [bp+var_20]
		mov	gs:[si+8], eax
		mov	edx, [bp+var_24]

loc_34781:
		mov	gs:[si+4], edx

loc_34786:
		cmp	[bp+var_54], 0
		jz	short loc_347F4

loc_3478C:
		mov	ax, [bp+var_58]
		cmp	ax, [bp+var_50]

loc_34792:
		jl	short loc_347F4
		cmp	ax, [bp+var_52]
		jg	short loc_347F4
		mov	bx, cx
		shr	ecx, 10h
		mov	es, cx
		mov	ax, es:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7221E
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_72236
		imul	ecx
		add	gs:[si+8], eax
		mov	eax, dword_7222A
		imul	ecx
		add	eax, gs:[si+4]
		mov	gs:[si+4], eax

loc_347D1:
		mov	edx, eax
		or	byte ptr gs:[si+10h], 80h

loc_347D9:
		and	byte ptr gs:[si+10h], 0FEh
		mov	al, 2

loc_347E0:
		cmp	edx, dword_6EB18
		jge	short loc_34808
		mov	al, 4
		cmp	edx, dword_6EB14
		jl	short loc_34808
		mov	al, 0
		jmp	short loc_34808
; ���������������������������������������������������������������������������

loc_347F4:				; CODE XREF: Render_TerrainPipelineMain+1B4j
					; Render_TerrainPipelineMain:loc_34792j	...
		mov	al, 4
		cmp	edx, dword_6EB14
		jl	short loc_34808
		mov	al, 2
		cmp	edx, dword_6EB18
		jg	short loc_34808
		mov	al, 0

loc_34808:				; CODE XREF: Render_TerrainPipelineMain+20Fj
					; Render_TerrainPipelineMain+218j ...
		or	gs:[si+10h], al
		add	[bp+var_4E], 4
		add	si, 15h
		mov	eax, [bp+var_40]
		add	[bp+var_28], eax
		mov	eax, [bp+var_3C]
		add	[bp+var_24], eax

loc_34823:
		mov	eax, [bp+var_38]

loc_34827:
		add	[bp+var_20], eax

loc_3482B:
		inc	[bp+var_58]
		mov	ax, [bp+var_58]
		cmp	ax, [di+11h]
		jb	loc_3475C
		mov	eax, [bp+var_4C]
		sub	[bp+var_34], eax
		mov	eax, [bp+var_48]
		sub	[bp+var_30], eax
		mov	eax, [bp+var_44]
		sub	[bp+var_2C], eax
		add	[bp+var_56], 2
		mov	ax, [bp+var_56]
		shr	ax, 1
		cmp	ax, [di+11h]
		jb	loc_34723
		mov	eax, dword_6E33D
		mov	dword_72C30, eax
		mov	si, [di+29h]
		mov	cx, [di+27h]

loc_3486E:				; CODE XREF: Render_TerrainPipelineMain+2A0j
		mov	byte ptr gs:[si+10h], 0
		add	si, 11h
		loop	loc_3486E
		mov	eax, dword_6EB0C
		mov	dword_6EB08, eax
		mov	cx, [di+2Dh]
		mov	[bp+var_56], cx
		mov	di, [di+2Fh]

loc_34889:				; CODE XREF: Render_TerrainPipelineMain+2136j
		mov	[bp+var_584], 0
		or	byte ptr gs:[di+15h], 3Fh
		mov	[bp+var_582], 0
		mov	si, gs:[di+2]
		mov	al, gs:[si+10h]
		mov	si, gs:[di+4]
		and	al, gs:[si+10h]
		mov	si, gs:[di+6]
		and	al, gs:[si+10h]
		test	al, 1
		jnz	loc_36706
		and	al, 6
		jnz	loc_36706
		test	byte ptr gs:[si+10h], 80h
		jnz	short loc_34920
		lfs	bx, gs:[si+11h]
		mov	ax, fs:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7221E
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_7222A
		imul	ecx

loc_348E2:
		add	gs:[si+4], eax
		mov	eax, dword_72236
		imul	ecx
		add	gs:[si+8], eax
		or	byte ptr gs:[si+10h], 80h
		mov	dl, gs:[si+10h]
		mov	eax, gs:[si+4]
		cmp	eax, dword_6EB18
		jl	short loc_3490D
		or	dl, 2
		jmp	short loc_3491C
; ���������������������������������������������������������������������������

loc_3490D:				; CODE XREF: Render_TerrainPipelineMain+330j
		cmp	eax, dword_6EB14
		jge	short loc_34919
		or	dl, 4
		jmp	short loc_3491C
; ���������������������������������������������������������������������������

loc_34919:				; CODE XREF: Render_TerrainPipelineMain+33Cj
		and	dl, 0F9h

loc_3491C:				; CODE XREF: Render_TerrainPipelineMain+335j
					; Render_TerrainPipelineMain+341j
		mov	gs:[si+10h], dl

loc_34920:				; CODE XREF: Render_TerrainPipelineMain+2EBj
		mov	si, gs:[di+4]
		test	byte ptr gs:[si+10h], 80h
		jnz	short loc_34988
		lfs	bx, gs:[si+11h]
		mov	ax, fs:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7221E
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_7222A
		imul	ecx
		add	gs:[si+4], eax
		mov	eax, dword_72236
		imul	ecx
		add	gs:[si+8], eax
		or	byte ptr gs:[si+10h], 80h
		mov	dl, gs:[si+10h]
		mov	eax, gs:[si+4]
		cmp	eax, dword_6EB18
		jl	short loc_34975
		or	dl, 2
		jmp	short loc_34984
; ���������������������������������������������������������������������������

loc_34975:				; CODE XREF: Render_TerrainPipelineMain+398j
		cmp	eax, dword_6EB14
		jge	short loc_34981
		or	dl, 4
		jmp	short loc_34984
; ���������������������������������������������������������������������������

loc_34981:				; CODE XREF: Render_TerrainPipelineMain+3A4j
		and	dl, 0F9h

loc_34984:				; CODE XREF: Render_TerrainPipelineMain+39Dj
					; Render_TerrainPipelineMain+3A9j
		mov	gs:[si+10h], dl

loc_34988:				; CODE XREF: Render_TerrainPipelineMain+353j
		mov	si, gs:[di+2]
		test	byte ptr gs:[si+10h], 80h
		jnz	short loc_349F0

loc_34993:
		lfs	bx, gs:[si+11h]
		mov	ax, fs:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7221E
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_7222A
		imul	ecx
		add	gs:[si+4], eax
		mov	eax, dword_72236
		imul	ecx
		add	gs:[si+8], eax
		or	byte ptr gs:[si+10h], 80h
		mov	dl, gs:[si+10h]
		mov	eax, gs:[si+4]
		cmp	eax, dword_6EB18
		jl	short loc_349DD
		or	dl, 2
		jmp	short loc_349EC
; ���������������������������������������������������������������������������

loc_349DD:				; CODE XREF: Render_TerrainPipelineMain+400j
		cmp	eax, dword_6EB14
		jge	short loc_349E9
		or	dl, 4
		jmp	short loc_349EC
; ���������������������������������������������������������������������������

loc_349E9:				; CODE XREF: Render_TerrainPipelineMain+40Cj
		and	dl, 0F9h

loc_349EC:				; CODE XREF: Render_TerrainPipelineMain+405j
					; Render_TerrainPipelineMain+411j
		mov	gs:[si+10h], dl

loc_349F0:				; CODE XREF: Render_TerrainPipelineMain+3BBj
		mov	si, di
		mov	bx, gs:[si+2]
		lfs	bx, gs:[bx+11h]
		mov	al, fs:[bx+3]
		mov	dx, fs:[bx]
		mov	bx, gs:[si+4]
		lfs	bx, gs:[bx+11h]
		cmp	dx, fs:[bx]
		ja	short loc_34A17
		mov	al, fs:[bx+3]
		mov	dx, fs:[bx]

loc_34A17:				; CODE XREF: Render_TerrainPipelineMain+438j
		mov	bx, gs:[si+6]
		lfs	bx, gs:[bx+11h]
		cmp	dx, fs:[bx]
		ja	short loc_34A2C
		mov	al, fs:[bx+3]
		mov	dx, fs:[bx]

loc_34A2C:				; CODE XREF: Render_TerrainPipelineMain+44Dj
		mov	gs:[si], al
		mov	byte_6EAE0, al
		mov	[bp+var_57E], di
		mov	si, di
		mov	ax, word ptr dword_6EB08
		add	ax, 27h	; '''
		cmp	ax, word_6EB10
		jnb	loc_366FD
		mov	[bp+var_580], 0
		mov	bx, gs:[si+2]
		lfs	bx, gs:[bx+11h]
		cmp	byte ptr gs:[si+1], 0
		jz	short loc_34A61
		mov	al, fs:[bx+4]
		jmp	short loc_34A65
; ���������������������������������������������������������������������������

loc_34A61:				; CODE XREF: Render_TerrainPipelineMain+483j
		mov	al, fs:[bx+5]

loc_34A65:				; CODE XREF: Render_TerrainPipelineMain+489j
		mov	bx, 0
		cmp	al, 0FFh
		jz	loc_34AED
		cmp	al, 0DFh ; '�'
		jb	short loc_34A77
		mov	[bp+var_580], 1

loc_34A77:				; CODE XREF: Render_TerrainPipelineMain+49Aj
		cmp	byte_6EB1C, 0
		jz	short loc_34AC1

loc_34A7E:				; CODE XREF: Render_TerrainPipelineMain+4EFj
		cmp	byte_6EB1D, 0
		jz	short loc_34AC7

loc_34A85:				; CODE XREF: Render_TerrainPipelineMain+4F3j
					; Render_TerrainPipelineMain+4F7j
		cmp	byte_6EB1E, 0
		jz	short loc_34AD1

loc_34A8C:				; CODE XREF: Render_TerrainPipelineMain:loc_34AD3j
					; Render_TerrainPipelineMain:loc_34AD7j
		cmp	byte_6EB1F, 0
		jz	short loc_34ADB

loc_34A93:				; CODE XREF: Render_TerrainPipelineMain+507j
					; Render_TerrainPipelineMain+50Bj
		cmp	byte_6EB20, 0
		jz	short loc_34AE5

loc_34A9A:				; CODE XREF: Render_TerrainPipelineMain+511j
					; Render_TerrainPipelineMain+515j
		xor	ah, ah
		cmp	ax, word_727BA
		mov	bx, word_727BE
		jb	short loc_34AB7
		sub	ax, word_727BA
		cmp	ax, word_727BC
		mov	bx, 0
		jnb	short loc_34AED
		mov	bx, word_727C0

loc_34AB7:				; CODE XREF: Render_TerrainPipelineMain+4CEj
		shl	ax, 1
		add	bx, ax
		shl	ax, 1
		add	bx, ax
		jmp	short loc_34AED
; ���������������������������������������������������������������������������

loc_34AC1:				; CODE XREF: Render_TerrainPipelineMain+4A6j
		cmp	al, 0D7h ; '�'
		jbe	short loc_34AED
		jmp	short loc_34A7E
; ���������������������������������������������������������������������������

loc_34AC7:				; CODE XREF: Render_TerrainPipelineMain+4ADj
		cmp	al, 0DFh ; '�'
		jnb	short loc_34A85
		cmp	al, 0D7h ; '�'
		jbe	short loc_34A85
		jmp	short loc_34AED
; ���������������������������������������������������������������������������

loc_34AD1:				; CODE XREF: Render_TerrainPipelineMain+4B4j
		cmp	al, 0F8h ; '�'

loc_34AD3:
		jnb	short loc_34A8C
		cmp	al, 0EBh ; '�'

loc_34AD7:
		jbe	short loc_34A8C

loc_34AD9:
		jmp	short loc_34AED
; ���������������������������������������������������������������������������

loc_34ADB:				; CODE XREF: Render_TerrainPipelineMain+4BBj
		cmp	al, 0E8h ; '�'
		jnb	short loc_34A93

loc_34ADF:
		cmp	al, 0DEh ; '�'
		jbe	short loc_34A93

loc_34AE3:
		jmp	short loc_34AED
; ���������������������������������������������������������������������������

loc_34AE5:				; CODE XREF: Render_TerrainPipelineMain+4C2j
		cmp	al, 0ECh ; '�'
		jnb	short loc_34A9A
		cmp	al, 0E7h ; '�'
		jbe	short loc_34A9A

loc_34AED:				; CODE XREF: Render_TerrainPipelineMain+494j
					; Render_TerrainPipelineMain+4DBj ...
		mov	word_6EAD2, bx
		or	bx, bx
		jz	short loc_34B5D
		xor	cx, cx
		mov	cl, [bx+5]
		cmp	byte ptr gs:[si+1], 0
		jz	short loc_34B2F
		mov	[bp+var_E0], 200h
		mov	[bp+var_DE], 100h
		mov	ax, cx
		dec	ax
		shl	ax, 8
		mov	[bp+var_BC], ax
		mov	[bp+var_BA], 100h
		mov	[bp+var_98], ax

loc_34B21:
		mov	ax, cx

loc_34B23:
		sub	ax, 2

loc_34B26:
		shl	ax, 8
		mov	[bp+var_96], ax
		jmp	short loc_34B5D
; ���������������������������������������������������������������������������

loc_34B2F:				; CODE XREF: Render_TerrainPipelineMain+529j
		mov	[bp+var_E0], 0
		mov	[bp+var_DE], 100h
		mov	ax, cx
		sub	ax, 3
		shl	ax, 8
		mov	[bp+var_BC], ax
		mov	ax, cx
		sub	ax, 2
		shl	ax, 8
		mov	[bp+var_BA], ax
		mov	[bp+var_98], 0
		mov	[bp+var_96], ax

loc_34B5D:				; CODE XREF: Render_TerrainPipelineMain+51Dj
					; Render_TerrainPipelineMain+557j
		mov	cx, 0
		lea	di, [bp+var_E8]

loc_34B64:				; CODE XREF: Render_TerrainPipelineMain+604j
		mov	bx, cx
		mov	ax, gs:[bx+si+8]
		mov	[di+1Ah], ax
		mov	ax, gs:[bx+si+0Eh]
		mov	[di+1Eh], ax
		mov	ax, gs:[bx+si+2]
		mov	[di+1Ch], ax
		mov	bx, ax
		mov	eax, gs:[bx]

loc_34B81:
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		mov	al, 0
		test	byte ptr gs:[bx+10h], 40h
		jz	short loc_34BBD
		movsx	eax, word ptr gs:[bx+0Ch]
		shl	eax, 8
		mov	[di], eax
		movsx	eax, word ptr gs:[bx+0Eh]
		shl	eax, 8
		mov	[di+4],	eax
		mov	al, 1

loc_34BBD:				; CODE XREF: Render_TerrainPipelineMain+5C8j
		mov	[di+20h], al
		mov	[di+21h], al
		lfs	bx, gs:[bx+11h]
		mov	ah, fs:[bx+2]
		xor	al, al
		mov	[di+0Ch], ax

loc_34BD1:
		add	di, 24h	; '$'
		add	cx, 2
		cmp	cx, 6
		jl	short loc_34B64
		mov	word_6EADC, 0
		mov	[bp+var_57A], 0
		lea	ax, [bp+var_E8]
		mov	[bp+var_57C], ax
		lea	di, [bp+var_330]
		and	di, 0FFFCh
		lea	si, [bp+var_A0]

loc_34BFC:				; CODE XREF: Render_TerrainPipelineMain+8C6j
		mov	bx, [bp+var_57A]
		mov	ax, [bp+var_57C]
		mov	dx, si
		mov	si, [bp+var_57E]
		mov	bx, gs:[bx+si+8]
		mov	si, dx
		mov	dx, 0
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_34D35
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]

loc_34C2E:
		cwde

loc_34C30:
		shl	eax, 8
		mov	[di+4],	eax

loc_34C38:
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_34C6A
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_34C94
; ���������������������������������������������������������������������������

loc_34C6A:				; CODE XREF: Render_TerrainPipelineMain+685j
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		jz	short loc_34C81
		mov	ecx, eax
		mov	eax, [di+0Eh]
		sub	eax, [bx+0Eh]
		jmp	short loc_34C94
; ���������������������������������������������������������������������������

loc_34C81:				; CODE XREF: Render_TerrainPipelineMain+69Cj
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		mov	ecx, eax
		mov	eax, [di+16h]
		sub	eax, [bx+16h]

loc_34C94:				; CODE XREF: Render_TerrainPipelineMain+692j
					; Render_TerrainPipelineMain+6A9j
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		cmp	word_6EAD2, 0
		jz	short loc_34CF2
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax

loc_34CCF:
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 0

loc_34CE3:
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34CF2:				; CODE XREF: Render_TerrainPipelineMain+6D4j
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 1
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+1Ch], 0

loc_34D27:
		mov	word ptr [di+1Ah], 0

loc_34D2C:
		add	di, 24h	; '$'

loc_34D2F:
		inc	word_6EADC
		jmp	short loc_34D37
; ���������������������������������������������������������������������������

loc_34D35:				; CODE XREF: Render_TerrainPipelineMain+642j
		mov	bx, ax

loc_34D37:				; CODE XREF: Render_TerrainPipelineMain+75Dj
		mov	si, [bp+var_57C]
		mov	dx, es
		mov	cx, ds
		mov	es, cx
		assume es:seg339
		mov	cx, 9
		rep movsd
		mov	es, dx
		assume es:nothing
		inc	word_6EADC
		mov	si, bx
		mov	ax, [bp+var_57C]
		add	ax, 24h	; '$'
		mov	bx, [bp+var_57A]
		cmp	bx, 4
		jnz	short loc_34D63
		lea	ax, [bp+var_E8]

loc_34D63:				; CODE XREF: Render_TerrainPipelineMain+787j
		push	si
		mov	si, [bp+var_57E]
		mov	bx, gs:[bx+si+0Eh]
		pop	si
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_34E8D
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4],	eax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_34DC4
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_34DEE
; ���������������������������������������������������������������������������

loc_34DC4:				; CODE XREF: Render_TerrainPipelineMain+7DFj
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		jz	short loc_34DDB
		mov	ecx, eax

loc_34DD1:
		mov	eax, [di+0Eh]

loc_34DD5:
		sub	eax, [bx+0Eh]
		jmp	short loc_34DEE
; ���������������������������������������������������������������������������

loc_34DDB:				; CODE XREF: Render_TerrainPipelineMain+7F6j
		mov	eax, [si+16h]
		sub	eax, [bx+16h]

loc_34DE3:
		mov	ecx, eax
		mov	eax, [di+16h]
		sub	eax, [bx+16h]

loc_34DEE:				; CODE XREF: Render_TerrainPipelineMain+7ECj
					; Render_TerrainPipelineMain+803j
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		cmp	word_6EAD2, 0
		jz	short loc_34E4C
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0

loc_34E1E:
		shrd	eax, edx, 10h

loc_34E23:
		add	ax, [bx+8]
		mov	[di+8],	ax

loc_34E29:
		movzx	eax, word ptr [si+0Ah]

loc_34E2E:
		movzx	edx, word ptr [bx+0Ah]

loc_34E33:
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34E4C:				; CODE XREF: Render_TerrainPipelineMain+82Ej
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 1
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EADC

loc_34E8D:				; CODE XREF: Render_TerrainPipelineMain+79Cj
		add	[bp+var_57C], 24h ; '$'
		add	[bp+var_57A], 2
		cmp	[bp+var_57A], 6
		jl	loc_34BFC
		mov	word_6EADE, 0
		mov	ax, word_6EADC
		mov	[bp+var_57A], ax
		mov	eax, dword_6EB18
		mov	dword_6EAD4, eax
		lea	si, [bp+var_330]
		and	si, 0FFFCh
		mov	word_6EAD8, si
		mov	bx, si
		add	bx, 24h	; '$'
		mov	di, bx
		add	di, 24h	; '$'
		mov	eax, [di+12h]
		mov	edx, [si+12h]
		cmp	eax, edx
		jge	short loc_34EDB
		mov	eax, edx

loc_34EDB:				; CODE XREF: Render_TerrainPipelineMain+900j
		mov	edx, [bx+12h]
		cmp	eax, edx
		jge	short loc_34EE7
		mov	eax, edx

loc_34EE7:				; CODE XREF: Render_TerrainPipelineMain+90Cj
		add	eax, 2EE00h
		mov	[bp+var_1C], eax
		lea	di, [bp+var_570]
		and	di, 0FFFCh
		mov	word_6EADA, di
		mov	cx, [bp+var_57A]

loc_34F01:				; CODE XREF: Render_TerrainPipelineMain+93Aj
		mov	eax, [si+12h]
		cmp	eax, dword_6EAD4
		jg	short loc_34F1A
		add	si, 24h	; '$'
		dec	cx
		jnz	short loc_34F01
		mov	si, word_6EAD8
		jmp	loc_351DD
; ���������������������������������������������������������������������������
		align 2

loc_34F1A:				; CODE XREF: Render_TerrainPipelineMain+934j
		mov	si, word_6EAD8

loc_34F1E:				; CODE XREF: Render_TerrainPipelineMain+BCEj
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_34F33
		mov	eax, [si+12h]
		cmp	eax, dword_6EAD4
		jg	short loc_34F33
		or	dl, 1

loc_34F33:				; CODE XREF: Render_TerrainPipelineMain+94Dj
					; Render_TerrainPipelineMain+958j
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_34F4C
		mov	eax, [bx+12h]
		cmp	eax, dword_6EAD4
		jg	short loc_34F4C
		or	dl, 2

loc_34F4C:				; CODE XREF: Render_TerrainPipelineMain+966j
					; Render_TerrainPipelineMain+971j
		mov	al, dl
		cmp	al, 1
		jl	loc_3518D
		cmp	al, 2
		jz	loc_3506D
		jg	loc_35179
		mov	eax, [si+12h]
		cmp	eax, dword_6EAD4
		jz	loc_3518D
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]

loc_34FE1:
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_3504D
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_3504D:				; CODE XREF: Render_TerrainPipelineMain+A2Bj
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EADE
		jmp	loc_3518D
; ���������������������������������������������������������������������������

loc_3506D:				; CODE XREF: Render_TerrainPipelineMain+980j
		mov	eax, [bx+12h]
		cmp	eax, dword_6EAD4
		jz	loc_35179
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h

loc_350D5:
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_3515C
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx

loc_3511F:
		imul	ecx

loc_35122:
		add	eax, 8000h

loc_35128:
		adc	edx, 0

loc_3512C:
		shrd	eax, edx, 10h
		add	ax, [bx+8]

loc_35134:
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_3515C:				; CODE XREF: Render_TerrainPipelineMain+B3Aj
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EADE

loc_35179:				; CODE XREF: Render_TerrainPipelineMain+984j
					; Render_TerrainPipelineMain+AA0j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		assume es:seg339
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EADE

loc_3518D:				; CODE XREF: Render_TerrainPipelineMain+97Aj
					; Render_TerrainPipelineMain+991j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_57A]
		cmp	ax, 2
		jnz	short loc_351A0
		mov	bx, word_6EAD8

loc_351A0:				; CODE XREF: Render_TerrainPipelineMain+BC4j
		dec	[bp+var_57A]
		jnz	loc_34F1E
		cmp	word_6EADE, 2
		mov	[bp+var_584], 1
		jle	loc_366FD
		mov	ax, word_6EAD8
		xchg	ax, word_6EADA
		mov	word_6EAD8, ax
		mov	ax, word_6EADE
		mov	word_6EADC, ax
		mov	[bp+var_57A], ax
		mov	word_6EADE, 0
		mov	si, word_6EAD8

loc_351D4:
		mov	bx, si
		add	bx, 24h	; '$'
		mov	di, word_6EADA

loc_351DD:				; CODE XREF: Render_TerrainPipelineMain+940j
		mov	eax, dword_6EB14
		mov	dword_6EAD4, eax
		mov	cx, [bp+var_57A]

loc_351E9:				; CODE XREF: Render_TerrainPipelineMain+C22j
		mov	eax, [si+12h]
		cmp	eax, dword_6EAD4
		jl	short loc_35202
		add	si, 24h	; '$'
		dec	cx
		jnz	short loc_351E9
		mov	si, word_6EAD8
		jmp	loc_354AE
; ���������������������������������������������������������������������������
		align 2

loc_35202:				; CODE XREF: Render_TerrainPipelineMain+C1Cj
		mov	si, word_6EAD8

loc_35206:				; CODE XREF: Render_TerrainPipelineMain+EB6j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_3521B
		mov	eax, [si+12h]
		cmp	eax, dword_6EAD4
		jl	short loc_3521B
		or	dl, 1

loc_3521B:				; CODE XREF: Render_TerrainPipelineMain+C35j
					; Render_TerrainPipelineMain+C40j
		mov	dh, [bx+21h]
		shl	dh, 1

loc_35220:
		or	dl, dh
		or	dh, dh
		jnz	short loc_35234
		mov	eax, [bx+12h]
		cmp	eax, dword_6EAD4
		jl	short loc_35234
		or	dl, 2

loc_35234:				; CODE XREF: Render_TerrainPipelineMain+C4Ej
					; Render_TerrainPipelineMain+C59j
		mov	al, dl
		cmp	al, 1
		jl	loc_35475
		cmp	al, 2
		jz	loc_35355
		jg	loc_35461
		mov	eax, [si+12h]
		cmp	eax, dword_6EAD4
		jz	loc_35475
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_35335
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx

loc_35320:
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]

loc_35332:
		mov	[di+0Ah], ax

loc_35335:				; CODE XREF: Render_TerrainPipelineMain+D13j
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EADE
		jmp	loc_35475
; ���������������������������������������������������������������������������

loc_35355:				; CODE XREF: Render_TerrainPipelineMain+C68j
		mov	eax, [bx+12h]
		cmp	eax, dword_6EAD4
		jz	loc_35461
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_35444
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]

loc_35424:
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx

loc_3542C:
		imul	ecx

loc_3542F:
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_35444:				; CODE XREF: Render_TerrainPipelineMain+E22j
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EADE

loc_35461:				; CODE XREF: Render_TerrainPipelineMain+C6Cj
					; Render_TerrainPipelineMain+D88j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EADE

loc_35475:				; CODE XREF: Render_TerrainPipelineMain+C62j
					; Render_TerrainPipelineMain+C79j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_57A]
		cmp	ax, 2
		jnz	short loc_35488
		mov	bx, word_6EAD8

loc_35488:				; CODE XREF: Render_TerrainPipelineMain+EACj
		dec	[bp+var_57A]
		jnz	loc_35206
		cmp	word_6EADE, 2
		mov	[bp+var_584], 2
		jle	loc_366FD
		mov	ax, word_6EAD8
		xchg	ax, word_6EADA
		mov	word_6EAD8, ax
		mov	ax, word_6EADE
		mov	word_6EADC, ax

loc_354AE:				; CODE XREF: Render_TerrainPipelineMain+C28j
		mov	di, word_6EADC
		mov	si, word_6EAD8
		mov	bx, 0FFh

loc_354B9:				; CODE XREF: Render_TerrainPipelineMain+F57j
		cmp	byte ptr [si+20h], 1
		jz	short loc_354EF
		mov	eax, [si+0Eh]
		imul	dword_72202
		idiv	dword ptr [si+12h]
		add	eax, [bp+var_14]
		mov	[si], eax
		mov	eax, [si+16h]
		imul	dword_72206
		idiv	dword ptr [si+12h]
		mov	edx, [bp+var_18]
		sub	edx, eax
		mov	[si+4],	edx
		mov	byte ptr [si+20h], 1

loc_354EF:				; CODE XREF: Render_TerrainPipelineMain+EE7j
		xor	dx, dx
		mov	ecx, [bp+var_10]
		mov	eax, [bp+var_C]
		sub	ecx, [si+4]
		shld	edx, ecx, 1
		sub	eax, [si]
		shld	edx, eax, 1
		mov	ecx, [si+4]
		mov	eax, [si]
		sub	ecx, [bp+var_8]
		shld	edx, ecx, 1
		sub	eax, [bp+var_4]
		shld	edx, eax, 1
		and	bl, dl
		or	[bp+var_582], dl
		add	si, 24h	; '$'
		dec	di
		jnz	short loc_354B9
		or	bl, bl
		mov	[bp+var_584], 3
		jnz	loc_366FD
		mov	ax, word_6EADC
		mov	[bp+var_57A], ax
		mov	word_6EADE, 0
		mov	eax, [bp+var_8]
		mov	dword_6EAD4, eax
		mov	si, word_6EAD8
		mov	bx, si
		add	bx, 24h	; '$'
		mov	di, word_6EADA
		test	[bp+var_582], 2
		jz	loc_358FE

loc_35565:				; CODE XREF: Render_TerrainPipelineMain+12EFj
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_3557A
		mov	eax, [si+4]
		cmp	eax, dword_6EAD4
		jl	short loc_3557A
		or	dl, 1

loc_3557A:				; CODE XREF: Render_TerrainPipelineMain+F94j
					; Render_TerrainPipelineMain+F9Fj
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_35593
		mov	eax, [bx+4]
		cmp	eax, dword_6EAD4
		jl	short loc_35593
		or	dl, 2

loc_35593:				; CODE XREF: Render_TerrainPipelineMain+FADj
					; Render_TerrainPipelineMain+FB8j
		mov	al, dl
		cmp	al, 1
		jl	loc_358AE
		cmp	al, 2
		jz	loc_35721
		jg	loc_3589A
		mov	eax, [si+4]
		cmp	eax, dword_6EAD4
		jz	loc_358AE
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+4],	eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx

loc_35632:
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_35701
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_35701:				; CODE XREF: Render_TerrainPipelineMain+10DFj
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EADE
		jmp	loc_358AE
; ���������������������������������������������������������������������������

loc_35721:				; CODE XREF: Render_TerrainPipelineMain+FC7j
		mov	eax, [bx+4]

loc_35725:
		cmp	eax, dword_6EAD4
		jz	loc_3589A
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+4],	eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0

loc_35821:
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_3587D
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_3587D:				; CODE XREF: Render_TerrainPipelineMain+125Bj
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EADE

loc_3589A:				; CODE XREF: Render_TerrainPipelineMain+FCBj
					; Render_TerrainPipelineMain+1154j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EADE

loc_358AE:				; CODE XREF: Render_TerrainPipelineMain+FC1j
					; Render_TerrainPipelineMain+FD8j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_57A]
		cmp	ax, 2
		jnz	short loc_358C1
		mov	bx, word_6EAD8

loc_358C1:				; CODE XREF: Render_TerrainPipelineMain+12E5j
		dec	[bp+var_57A]
		jnz	loc_35565
		cmp	word_6EADE, 2
		mov	[bp+var_584], 4
		jle	loc_366FD
		mov	ax, word_6EAD8
		xchg	ax, word_6EADA
		mov	word_6EAD8, ax
		mov	ax, word_6EADE
		mov	word_6EADC, ax
		mov	[bp+var_57A], ax
		mov	word_6EADE, 0
		mov	si, word_6EAD8
		mov	bx, si
		add	bx, 24h	; '$'
		mov	di, word_6EADA

loc_358FE:				; CODE XREF: Render_TerrainPipelineMain+F8Bj
		mov	eax, [bp+var_10]
		mov	dword_6EAD4, eax
		test	[bp+var_582], 8
		jz	loc_35CB0

loc_3590F:				; CODE XREF: Render_TerrainPipelineMain+1699j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_35924
		mov	eax, [si+4]
		cmp	eax, dword_6EAD4
		jg	short loc_35924
		or	dl, 1

loc_35924:				; CODE XREF: Render_TerrainPipelineMain+133Ej
					; Render_TerrainPipelineMain+1349j
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_3593D
		mov	eax, [bx+4]
		cmp	eax, dword_6EAD4
		jg	short loc_3593D
		or	dl, 2

loc_3593D:				; CODE XREF: Render_TerrainPipelineMain+1357j
					; Render_TerrainPipelineMain+1362j
		mov	al, dl
		cmp	al, 1
		jl	loc_35C58
		cmp	al, 2
		jz	loc_35ACB
		jg	loc_35C44
		mov	eax, [si+4]
		cmp	eax, dword_6EAD4
		jz	loc_35C58
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+4],	eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_35AAB
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_35AAB:				; CODE XREF: Render_TerrainPipelineMain+1489j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EADE
		jmp	loc_35C58
; ���������������������������������������������������������������������������

loc_35ACB:				; CODE XREF: Render_TerrainPipelineMain+1371j
		mov	eax, [bx+4]
		cmp	eax, dword_6EAD4
		jz	loc_35C44
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_6EAD4
		mov	[di+4],	eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_35C27
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_35C27:				; CODE XREF: Render_TerrainPipelineMain+1605j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EADE

loc_35C44:				; CODE XREF: Render_TerrainPipelineMain+1375j
					; Render_TerrainPipelineMain+14FEj
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EADE

loc_35C58:				; CODE XREF: Render_TerrainPipelineMain+136Bj
					; Render_TerrainPipelineMain+1382j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_57A]
		cmp	ax, 2
		jnz	short loc_35C6B
		mov	bx, word_6EAD8

loc_35C6B:				; CODE XREF: Render_TerrainPipelineMain+168Fj
		dec	[bp+var_57A]
		jnz	loc_3590F
		cmp	word_6EADE, 2
		mov	[bp+var_584], 5
		jle	loc_366FD
		mov	ax, word_6EAD8
		xchg	ax, word_6EADA
		mov	word_6EAD8, ax
		mov	ax, word_6EADE
		mov	word_6EADC, ax
		mov	[bp+var_57A], ax
		mov	word_6EADE, 0
		mov	eax, [bp+var_4]
		mov	dword_6EAD4, eax
		mov	si, word_6EAD8
		mov	bx, si
		add	bx, 24h	; '$'
		mov	di, word_6EADA

loc_35CB0:				; CODE XREF: Render_TerrainPipelineMain+1335j
		mov	eax, [bp+var_4]
		mov	dword_6EAD4, eax
		test	[bp+var_582], 1
		jz	loc_36058

loc_35CC1:				; CODE XREF: Render_TerrainPipelineMain+1A41j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_35CD5
		mov	eax, [si]
		cmp	eax, dword_6EAD4
		jl	short loc_35CD5
		or	dl, 1

loc_35CD5:				; CODE XREF: Render_TerrainPipelineMain+16F0j
					; Render_TerrainPipelineMain+16FAj
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_35CED
		mov	eax, [bx]
		cmp	eax, dword_6EAD4
		jl	short loc_35CED
		or	dl, 2

loc_35CED:				; CODE XREF: Render_TerrainPipelineMain+1708j
					; Render_TerrainPipelineMain+1712j
		mov	al, dl
		cmp	al, 1

loc_35CF1:
		jl	loc_36000

loc_35CF5:
		cmp	al, 2
		jz	loc_35E77

loc_35CFB:
		jg	loc_35FEC

loc_35CFF:
		mov	eax, [si]

loc_35D02:
		cmp	eax, dword_6EAD4

loc_35D07:
		jz	loc_36000
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EAD4
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4],	eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h

loc_35DF7:
		adc	edx, 0

loc_35DFB:
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_35E57
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_35E57:				; CODE XREF: Render_TerrainPipelineMain+1835j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EADE
		jmp	loc_36000
; ���������������������������������������������������������������������������

loc_35E77:				; CODE XREF: Render_TerrainPipelineMain+1721j
		mov	eax, [bx]
		cmp	eax, dword_6EAD4
		jz	loc_35FEC
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EAD4
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4],	eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx

loc_35EF2:
		mov	ecx, eax
		mov	eax, [si+12h]

loc_35EF9:
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_35FCF
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_35FCF:				; CODE XREF: Render_TerrainPipelineMain+19ADj
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EADE

loc_35FEC:				; CODE XREF: Render_TerrainPipelineMain:loc_35CFBj
					; Render_TerrainPipelineMain+18A9j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd

loc_35FFA:
		mov	si, dx
		inc	word_6EADE

loc_36000:				; CODE XREF: Render_TerrainPipelineMain:loc_35CF1j
					; Render_TerrainPipelineMain:loc_35D07j	...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_57A]
		cmp	ax, 2
		jnz	short loc_36013
		mov	bx, word_6EAD8

loc_36013:				; CODE XREF: Render_TerrainPipelineMain+1A37j
		dec	[bp+var_57A]
		jnz	loc_35CC1
		cmp	word_6EADE, 2
		mov	[bp+var_584], 6
		jle	loc_366FD
		mov	ax, word_6EAD8
		xchg	ax, word_6EADA
		mov	word_6EAD8, ax
		mov	ax, word_6EADE
		mov	word_6EADC, ax
		mov	[bp+var_57A], ax
		mov	word_6EADE, 0
		mov	eax, [bp+var_C]
		mov	dword_6EAD4, eax
		mov	si, word_6EAD8
		mov	bx, si
		add	bx, 24h	; '$'
		mov	di, word_6EADA

loc_36058:				; CODE XREF: Render_TerrainPipelineMain+16E7j
		mov	eax, [bp+var_C]
		mov	dword_6EAD4, eax
		test	[bp+var_582], 4
		jz	loc_363E5

loc_36069:				; CODE XREF: Render_TerrainPipelineMain+1DE9j
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_3607D
		mov	eax, [si]
		cmp	eax, dword_6EAD4
		jg	short loc_3607D
		or	dl, 1

loc_3607D:				; CODE XREF: Render_TerrainPipelineMain+1A98j
					; Render_TerrainPipelineMain+1AA2j
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_36095
		mov	eax, [bx]
		cmp	eax, dword_6EAD4
		jg	short loc_36095
		or	dl, 2

loc_36095:				; CODE XREF: Render_TerrainPipelineMain+1AB0j
					; Render_TerrainPipelineMain+1ABAj
		mov	al, dl
		cmp	al, 1
		jl	loc_363A8
		cmp	al, 2
		jz	loc_3621F
		jg	loc_36394
		mov	eax, [si]
		cmp	eax, dword_6EAD4
		jz	loc_363A8
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EAD4
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4],	eax

loc_360F4:
		mov	eax, [bx+12h]

loc_360F8:
		sub	eax, [si+12h]
		imul	ecx

loc_360FF:
		add	eax, 8000h

loc_36105:
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_361FF
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h

loc_361F0:
		adc	edx, 0

loc_361F4:
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_361FF:				; CODE XREF: Render_TerrainPipelineMain+1BDDj
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h	; '$'
		inc	word_6EADE
		jmp	loc_363A8
; ���������������������������������������������������������������������������

loc_3621F:				; CODE XREF: Render_TerrainPipelineMain+1AC9j
		mov	eax, [bx]
		cmp	eax, dword_6EAD4
		jz	loc_36394
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_6EAD4
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4],	eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h

loc_362F0:
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	word_6EAD2, 0
		jz	short loc_36377
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8],	ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_36377:				; CODE XREF: Render_TerrainPipelineMain+1D55j
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h	; '$'
		inc	word_6EADE

loc_36394:				; CODE XREF: Render_TerrainPipelineMain+1ACDj
					; Render_TerrainPipelineMain+1C51j
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_6EADE

loc_363A8:				; CODE XREF: Render_TerrainPipelineMain+1AC3j
					; Render_TerrainPipelineMain+1AD9j ...
		add	si, 24h	; '$'
		add	bx, 24h	; '$'
		mov	ax, [bp+var_57A]
		cmp	ax, 2
		jnz	short loc_363BB
		mov	bx, word_6EAD8

loc_363BB:				; CODE XREF: Render_TerrainPipelineMain+1DDFj
		dec	[bp+var_57A]
		jnz	loc_36069
		cmp	word_6EADE, 2
		mov	[bp+var_584], 7
		jle	loc_366FD
		mov	ax, word_6EADE
		xchg	ax, word_6EADC
		mov	word_6EADE, ax
		mov	ax, word_6EAD8
		xchg	ax, word_6EADA
		mov	word_6EAD8, ax

loc_363E5:				; CODE XREF: Render_TerrainPipelineMain+1A8Fj
		mov	cx, word_6EADC
		mov	si, word_6EAD8

loc_363ED:				; CODE XREF: Render_TerrainPipelineMain+1E5Ej
		mov	di, [si+1Ch]
		or	di, di

loc_363F2:
		jz	short loc_36431
		test	byte ptr gs:[di+10h], 40h
		jnz	short loc_36431
		or	byte ptr gs:[di+10h], 40h
		mov	eax, [si]

loc_36403:
		sar	eax, 8
		mov	gs:[di+0Ch], ax
		mov	eax, [si+4]
		sar	eax, 8
		mov	gs:[di+0Eh], ax
		mov	eax, [si+0Eh]
		mov	ebx, [si+12h]
		mov	gs:[di], eax
		mov	gs:[di+4], ebx
		mov	eax, [si+16h]
		mov	gs:[di+8], eax

loc_36431:				; CODE XREF: Render_TerrainPipelineMain:loc_363F2j
					; Render_TerrainPipelineMain+1E23j
		add	si, 24h	; '$'
		loop	loc_363ED
		lea	ax, [bp+var_7C]
		mov	dx, word_6EAD8
		push	di
		push	si
		push	cx
		push	es
		push	dx
		push	ax
		pop	di
		pop	si
		mov	cx, ds
		mov	es, cx
		mov	cx, 9
		rep movsd
		pop	es
		assume es:nothing
		pop	cx
		pop	si
		pop	di
		push	0
		push	large [bp+var_6A]
		mov	ax, [bp+var_70]
		shr	ax, 8
		push	ax
		mov	al, byte_6EAE0
		xor	ah, ah
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		xchg	al, ah
		xor	al, al
		mov	[bp+var_70], ax
		mov	si, word_6EAD8
		add	si, 24h	; '$'
		push	0
		push	large dword ptr	[si+12h]
		mov	ax, [si+0Ch]
		shr	ax, 8
		push	ax
		mov	al, byte_6EAE0
		xor	ah, ah
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		xchg	al, ah
		xor	al, al
		mov	[si+0Ch], ax
		mov	ax, word_6EADC
		sub	ax, 2
		mov	[bp+var_57A], ax
		les	di, dword_6EB08
		mov	bx, si
		add	bx, 24h	; '$'

loc_364B7:				; CODE XREF: Render_TerrainPipelineMain+211Aj
		push	bx
		push	es
		push	0
		push	large dword ptr	[bx+12h]
		mov	ax, [bx+0Ch]
		shr	ax, 8
		push	ax
		mov	al, byte_6EAE0
		xor	ah, ah
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		pop	es
		pop	bx
		xchg	al, ah
		xor	al, al
		mov	[bx+0Ch], ax
		mov	ecx, [bx+4]
		sub	ecx, [si+4]
		mov	eax, [si]
		sub	eax, [bp+var_7C]
		imul	ecx

loc_364F2:
		add	eax, 80h ; '�'

loc_364F8:
		adc	edx, 0

loc_364FC:
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	edx, [bx]
		sub	edx, [si]
		mov	eax, [si+4]
		sub	eax, [bp+var_78]
		imul	edx
		add	eax, 80h ; '�'
		adc	edx, 0
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_584], 8
		js	loc_366E7
		mov	eax, [bp+var_1C]
		mov	es:[di+2], eax
		mov	eax, [bp+var_7C]
		sar	eax, 8
		mov	es:[di+6], ax
		mov	eax, [bp+var_78]
		sar	eax, 8
		mov	es:[di+8], ax
		mov	eax, [si]
		sar	eax, 8
		mov	es:[di+0Ch], ax
		mov	eax, [si+4]
		sar	eax, 8
		mov	es:[di+0Eh], ax
		mov	eax, [bx]
		sar	eax, 8
		mov	es:[di+12h], ax
		mov	eax, [bx+4]
		sar	eax, 8
		mov	es:[di+14h], ax
		cmp	byte_6EB21, 1
		jz	short loc_365AA
		xor	dx, dx
		mov	ax, [bp+var_70]
		add	ax, [si+0Ch]
		adc	dx, 0
		add	ax, [bx+0Ch]
		adc	dx, 0
		mov	cx, 3
		div	cx
		mov	es:[di+0Ah], ax
		mov	es:[di+10h], ax
		mov	es:[di+16h], ax
		jmp	short loc_365BF
; ���������������������������������������������������������������������������

loc_365AA:				; CODE XREF: Render_TerrainPipelineMain+1FAEj
		mov	ax, [bp+var_70]
		mov	es:[di+0Ah], ax
		mov	ax, [si+0Ch]
		mov	es:[di+10h], ax
		mov	ax, [bx+0Ch]
		mov	es:[di+16h], ax

loc_365BF:				; CODE XREF: Render_TerrainPipelineMain+1FD2j
		mov	ax, word_726EE
		mov	dx, 18h
		mov	cx, word_6EAD2
		cmp	cx, 0
		jz	loc_366B1
		mov	es:[di+24h], cx
		mov	ax, [bp+var_74]
		mov	es:[di+18h], ax
		mov	ax, [bp+var_72]
		mov	es:[di+1Ah], ax
		mov	ax, [si+8]
		mov	es:[di+1Ch], ax
		mov	ax, [si+0Ah]
		mov	es:[di+1Eh], ax
		mov	ax, [bx+8]
		mov	es:[di+20h], ax
		mov	ax, [bx+0Ah]
		mov	es:[di+22h], ax
		mov	eax, [bp+var_6A]
		mov	edx, [si+12h]
		cmp	eax, edx
		jl	short loc_3660E
		mov	eax, edx

loc_3660E:				; CODE XREF: Render_TerrainPipelineMain+2033j
		mov	edx, [bx+12h]
		cmp	eax, edx
		jl	short loc_3661A
		mov	eax, edx

loc_3661A:				; CODE XREF: Render_TerrainPipelineMain+203Fj
		push	bx
		push	si
		push	di
		push	es
		push	eax
		push	541Ah
		call	Texture_ResolveMipCached
		add	sp, 6
		pop	es
		pop	di
		pop	si
		pop	bx
		shl	edx, 10h
		mov	dx, ax
		mov	ax, word_7251C
		cwde
		imul	edx
		add	eax, dword_72538
		mov	cx, word_72532
		sar	eax, cl
		mov	es:[di+26h], al
		mov	ax, word_72706
		mov	dx, 27h	; '''
		cmp	[bp+var_580], 0
		jz	short loc_366B1
		mov	eax, [bp+var_6E]
		mov	es:[di+27h], eax
		mov	eax, [bp+var_6A]
		mov	es:[di+2Bh], eax
		mov	eax, [bp+var_66]
		mov	es:[di+2Fh], eax
		mov	eax, [si+0Eh]
		mov	es:[di+33h], eax
		mov	eax, [si+12h]
		mov	es:[di+37h], eax
		mov	eax, [si+16h]
		mov	es:[di+3Bh], eax
		mov	eax, [bx+0Eh]
		mov	es:[di+3Fh], eax
		mov	eax, [bx+12h]
		mov	es:[di+43h], eax
		mov	eax, [bx+16h]
		mov	es:[di+47h], eax
		mov	ax, word_7272D
		mov	dx, 4Bh	; 'K'

loc_366B1:				; CODE XREF: Render_TerrainPipelineMain+1FF6j
					; Render_TerrainPipelineMain+2082j
		mov	es:[di], ax
		mov	cx, word_724AC
		cmp	cx, word_724AA
		jge	short loc_366DA
		shl	cx, 2
		mov	ax, es
		shl	eax, 10h
		mov	ax, di
		lfs	di, dword_724AE
		add	di, cx
		mov	fs:[di], eax
		mov	di, ax
		inc	word_724AC

loc_366DA:				; CODE XREF: Render_TerrainPipelineMain+20E6j
		add	di, dx
		cmp	di, word_6EB10
		mov	[bp+var_584], 9
		jnb	short loc_366F9

loc_366E7:				; CODE XREF: Render_TerrainPipelineMain+1F56j
		mov	si, bx
		add	bx, 24h	; '$'
		dec	[bp+var_57A]
		jnz	loc_364B7
		mov	[bp+var_584], 0

loc_366F9:				; CODE XREF: Render_TerrainPipelineMain+210Fj
		mov	word ptr dword_6EB08, di

loc_366FD:				; CODE XREF: Render_TerrainPipelineMain+46Cj
					; Render_TerrainPipelineMain+BDCj ...
		mov	di, [bp+var_57E]
		and	byte ptr gs:[di+15h], 0C0h

loc_36706:				; CODE XREF: Render_TerrainPipelineMain+2DCj
					; Render_TerrainPipelineMain+2E2j
		add	di, 16h
		dec	[bp+var_56]
		jnz	loc_34889
		mov	eax, dword_6E33D
		mov	dword_72C34, eax
		cmp	[bp+var_EC], 12345678h
		jz	short loc_36739
		cmp	[bp+var_578], 12345678h
		jz	short loc_36739

loc_3672E:
		push	1A32h
		call	Runtime_FatalErrorHandler_5F700
		add	sp, 2

loc_36739:				; CODE XREF: Render_TerrainPipelineMain+214Bj
					; Render_TerrainPipelineMain+2156j
		pop	ds
		pop	di
		pop	si
		leave
		retf
Render_TerrainPipelineMain	endp

seg074		ends
