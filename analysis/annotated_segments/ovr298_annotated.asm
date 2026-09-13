ovr298		segment	para public 'OVERLAY' use16
		assume cs:ovr298
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (50 lignes).
; ==============================================================================================
Terrain_Helper6_9AD80	proc far		; CODE XREF: VROOMM_StubThunk_6BED0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_9AD81:
		mov	bp, sp

loc_9AD83:
		push	si
		push	di

loc_9AD85:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [di], 0
		jz	short loc_9ADC5

loc_9AD90:
		mov	[si+1],	di
		mov	bx, [si+1]

loc_9AD96:
		mov	ax, [bx+7]
		mov	[si+3],	ax
		mov	eax, [bx+8Ah]
		mov	[si+5],	eax
		mov	eax, [bx+92h]
		mov	[si+11h], eax
		mov	eax, [bx+8Eh]

loc_9ADB3:
		mov	[si+9],	eax

loc_9ADB7:
		mov	eax, [si+9]

loc_9ADBB:
		sar	eax, 1
		mov	[si+0Dh], eax
		mov	byte ptr [si], 1

loc_9ADC5:				; CODE XREF: Terrain_Helper6_9AD80+Ej
		pop	di
		pop	si
		pop	bp
		retf
Terrain_Helper6_9AD80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_FreeNear_Wrap (28 lignes).
; ==============================================================================================
Terrain_ReleaseFreeB_9ADC9	proc far		; CODE XREF: VROOMM_StubThunk_6BED5J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]

loc_9ADD2:
		or	ax, ax

loc_9ADD4:
		jz	short loc_9ADE3
		test	dx, 1
		jz	short loc_9ADE3
		push	ax
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9ADE3:				; CODE XREF: Terrain_ReleaseFreeB_9ADC9:loc_9ADD4j
					; Terrain_ReleaseFreeB_9ADC9+11j
		pop	bp

locret_9ADE4:
		retf
Terrain_ReleaseFreeB_9ADC9	endp

ovr298		ends
