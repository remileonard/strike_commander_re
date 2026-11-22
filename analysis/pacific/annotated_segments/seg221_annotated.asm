seg221		segment	para public 'DATA' use16
		assume cs:seg221
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
byte_71380	db 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
		db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FDh, 0FDh, 0FDh
		db 0FDh, 0FDh, 0FDh, 0FDh, 0FCh, 0FCh, 0FCh, 0FCh, 0FCh, 0FBh, 0FBh, 0FBh, 0FBh, 0FBh, 0FAh, 0FAh
		db 0FAh, 0FAh, 0F9h, 0F9h, 0F9h, 0F9h, 0F8h, 0F8h, 0F8h, 0F8h, 0F7h, 0F7h, 0F7h, 0F6h, 0F6h, 0F6h
byte_713C0	db 0F6h, 0F5h, 0F5h, 0F5h, 0F4h, 0F4h, 0F4h, 0F3h, 0F3h, 0F3h, 0F2h, 0F2h, 0F2h, 0F1h, 0F1h, 0F0h
		db 0F0h, 0F0h, 0EFh, 0EFh, 0EEh, 0EEh, 0EEh, 0EDh, 0EDh, 0ECh, 0ECh, 0ECh, 0EBh, 0EBh, 0EAh, 0EAh
		db 0E9h, 0E9h, 0E8h, 0E8h, 0E8h, 0E7h, 0E7h, 0E6h, 0E6h, 0E5h, 0E5h, 0E4h, 0E4h, 0E3h, 0E3h, 0E2h
		db 0E2h, 0E1h, 0E0h, 0E0h, 0DFh, 0DFh, 0DEh, 0DEh, 0DDh, 0DDh, 0DCh, 0DCh, 0DBh, 0DAh, 0DAh, 0D9h
byte_71400	db 0D9h, 0D8h, 0D7h, 0D7h, 0D6h, 0D6h, 0D5h, 0D4h, 0D4h, 0D3h, 0D2h, 0D2h, 0D1h, 0D1h, 0D0h, 0CFh
		db 0CFh, 0CEh, 0CDh, 0CDh, 0CCh, 0CBh, 0CBh, 0CAh, 0C9h, 0C9h, 0C8h, 0C7h, 0C6h, 0C6h, 0C5h, 0C4h
		db 0C4h, 0C3h, 0C2h, 0C1h, 0C1h, 0C0h, 0BFh, 0BEh, 0BEh, 0BDh, 0BCh, 0BBh, 0BBh, 0BAh, 0B9h, 0B8h
		db 0B8h, 0B7h, 0B6h, 0B5h, 0B5h, 0B4h, 0B3h, 0B2h, 0B1h, 0B1h, 0B0h, 0AFh, 0AEh, 0ADh, 0ACh, 0ACh
byte_71440	db 0ABh, 0AAh, 0A9h, 0A8h, 0A7h, 0A7h, 0A6h, 0A5h, 0A4h, 0A3h, 0A2h, 0A1h, 0A1h, 0A0h, 9Fh, 9Eh
		db 9Dh, 9Ch, 9Bh, 9Ah, 9Ah, 99h, 98h, 97h, 96h, 95h, 94h, 93h, 92h, 91h, 90h, 90h
		db 8Fh, 8Eh, 8Dh, 8Ch, 8Bh, 8Ah, 89h, 88h, 87h, 86h, 85h, 84h, 83h, 82h, 81h, 80h
		db 7Fh, 7Fh, 7Eh, 7Dh, 7Ch, 7Bh, 7Ah, 79h, 78h, 77h, 76h, 75h, 74h, 73h, 72h, 71h
byte_71480	db 70h, 6Fh, 6Eh, 6Dh, 6Ch, 6Bh, 6Ah, 69h, 68h, 67h, 66h, 65h, 64h, 62h, 61h, 60h
		db 5Fh, 5Eh, 5Dh, 5Ch, 5Bh, 5Ah, 59h, 58h, 57h, 56h, 55h, 54h, 53h, 52h, 51h, 50h
		db 4Fh, 4Eh, 4Ch, 4Bh, 4Ah, 49h, 48h, 47h, 46h, 45h, 44h, 43h, 42h, 41h, 40h, 3Fh
		db 3Dh, 3Ch, 3Bh, 3Ah, 39h, 38h, 37h, 36h, 35h, 34h, 33h, 31h, 30h, 2Fh, 2Eh, 2Dh
byte_714C0	db 2Ch, 2Bh, 2Ah, 29h, 28h, 26h, 25h, 24h, 23h, 22h, 21h, 20h, 1Fh, 1Eh, 1Ch, 1Bh
		db 1Ah, 19h, 18h, 17h, 16h, 15h, 14h, 12h, 11h, 10h, 0Fh, 0Eh, 0Dh, 0Ch, 0Bh, 0Ah
		db 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, 5Ah, 0C6h, 59h, 8Dh, 59h, 54h
		db 59h, 1Ah, 59h, 0E1h, 58h, 0A8h, 58h, 6Eh, 58h, 35h, 58h, 0FCh, 57h, 0C2h, 57h, 89h
byte_71500	db 57h, 50h, 57h, 16h, 57h, 0DDh, 56h, 0A4h, 56h, 6Ah, 56h, 31h, 56h, 0F7h, 55h, 0BEh
		db 55h, 84h, 55h, 4Bh, 55h, 11h, 55h, 0D8h, 54h, 9Eh, 54h, 65h, 54h, 2Bh, 54h, 0F2h
		db 53h, 0B8h, 53h, 7Eh, 53h, 45h, 53h, 0Bh, 53h, 0D1h, 52h, 97h, 52h, 5Eh, 52h, 24h
		db 52h, 0EAh, 51h, 0B0h, 51h, 76h, 51h, 3Ch, 51h, 2, 51h, 0C8h, 50h, 8Eh, 50h, 54h
byte_71540	db 50h, 1Ah, 50h, 0E0h, 4Fh, 0A6h, 4Fh, 6Bh, 4Fh, 31h, 4Fh, 0F7h, 4Eh, 0BCh, 4Eh, 82h
		db 4Eh, 47h, 4Eh, 0Dh, 4Eh, 0D2h, 4Dh, 97h, 4Dh, 5Dh, 4Dh, 22h, 4Dh, 0E7h, 4Ch, 0ACh
		db 4Ch, 71h, 4Ch, 37h, 4Ch, 0FCh, 4Bh, 0C0h, 4Bh, 85h, 4Bh, 4Ah, 4Bh, 0Fh, 4Bh, 0D3h
		db 4Ah, 98h, 4Ah, 5Dh, 4Ah, 21h, 4Ah, 0E5h, 49h, 0AAh, 49h, 6Eh, 49h, 32h, 49h, 0F6h
byte_71580	db 48h, 0BAh, 48h, 7Eh, 48h, 42h, 48h, 6, 48h, 0CAh, 47h, 8Dh, 47h, 51h, 47h, 14h
		db 47h, 0D8h, 46h, 9Bh, 46h, 5Eh, 46h, 21h, 46h, 0E5h, 45h, 0A7h, 45h, 6Ah, 45h, 2Dh
		db 45h, 0F0h, 44h, 0B2h, 44h, 75h, 44h, 37h, 44h, 0F9h, 43h, 0BBh, 43h, 7Dh, 43h, 3Fh
		db 43h, 1, 43h, 0C3h, 42h, 84h, 42h, 46h, 42h, 7, 42h, 0C9h, 41h, 8Ah, 41h, 4Bh
byte_715C0	db 41h, 0Ch, 41h, 0CCh, 40h, 8Dh, 40h, 4Dh, 40h, 0Eh, 40h, 0CEh, 3Fh, 8Eh, 3Fh, 4Eh
		db 3Fh, 0Eh, 3Fh, 0CDh, 3Eh, 8Dh, 3Eh, 4Ch, 3Eh, 0Bh, 3Eh, 0CBh, 3Dh, 89h, 3Dh, 48h
		db 3Dh, 7, 3Dh, 0C5h, 3Ch, 83h, 3Ch, 42h, 3Ch, 0, 3Ch, 0BDh, 3Bh, 7Bh, 3Bh, 38h
		db 3Bh, 0F5h, 3Ah, 0B3h, 3Ah, 6Fh, 3Ah, 2Ch, 3Ah, 0E8h, 39h, 0A5h, 39h, 61h, 39h, 1Dh
byte_71600	db 39h, 0D8h, 38h, 94h, 38h, 4Fh, 38h, 0Ah, 38h, 0C5h, 37h, 80h, 37h, 3Ah, 37h, 0F4h
		db 36h, 0AEh, 36h, 68h, 36h, 21h, 36h, 0DAh, 35h, 93h, 35h, 4Ch, 35h, 4, 35h, 0BCh
		db 34h, 74h, 34h, 2Ch, 34h, 0E3h, 33h, 9Ah, 33h, 51h, 33h, 7, 33h, 0BDh, 32h, 73h
		db 32h, 29h, 32h, 0DEh, 31h, 93h, 31h, 48h, 31h, 0FCh, 30h, 0B0h, 30h, 63h, 30h, 16h
byte_71640	db 30h, 0C9h, 2Fh, 7Ch, 2Fh, 2Eh, 2Fh, 0DFh, 2Eh, 91h, 2Eh, 42h, 2Eh, 0F2h, 2Dh, 0A2h
		db 2Dh, 52h, 2Dh, 1, 2Dh, 0B0h, 2Ch, 5Eh, 2Ch, 0Ch, 2Ch, 0B9h, 2Bh, 66h, 2Bh, 13h
		db 2Bh, 0BEh, 2Ah, 6Ah, 2Ah, 14h, 2Ah, 0BFh, 29h, 68h, 29h, 11h, 29h, 0BAh, 28h, 62h
		db 28h, 9, 28h, 0B0h, 27h, 56h, 27h, 0FBh, 26h, 9Fh, 26h, 43h, 26h, 0E6h, 25h, 89h
byte_71680	db 25h, 2Ah, 25h, 0CBh, 24h, 6Bh, 24h, 0Ah, 24h, 0A8h, 23h, 45h, 23h, 0E2h, 22h, 7Dh
		db 22h, 17h, 22h, 0B1h, 21h, 49h, 21h, 0E0h, 20h, 76h, 20h, 0Ah, 20h, 9Eh, 1Fh, 30h
		db 1Fh, 0C0h, 1Eh, 50h, 1Eh, 0DDh, 1Dh, 69h, 1Dh, 0F4h, 1Ch, 7Dh, 1Ch, 4, 1Ch, 89h
		db 1Bh, 0Ch, 1Bh, 8Dh, 1Ah, 0Bh, 1Ah, 88h, 19h, 2, 19h, 79h, 18h, 0EDh, 17h, 5Eh
byte_716C0	db 17h, 0CCh, 16h, 36h, 16h, 9Dh, 15h, 0FFh, 14h, 5Dh, 14h, 0B6h, 13h, 9, 13h, 56h
		db 12h, 9Ch, 11h, 0DBh, 10h, 11h, 10h, 3Ch, 0Fh, 5Ch, 0Eh, 6Dh, 0Dh, 6Dh, 0Ch, 57h
		db 0Bh, 24h, 0Ah, 0C7h, 8, 2Ah, 7, 10h, 5, 0, 0, 0, 0, 1, 0, 2
		db 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 0Ah, 0, 0Bh
byte_71700	db 0, 0Ch, 0, 0Dh, 0, 0Eh, 0, 0Fh, 0, 10h, 0, 11h, 0, 13h, 0, 14h
		db 0, 15h, 0, 16h, 0, 17h, 0, 18h, 0, 19h, 0, 1Ah, 0, 1Ch, 0, 1Dh
		db 0, 1Eh, 0, 1Fh, 0, 20h, 0, 21h, 0, 22h, 0, 23h, 0, 25h, 0, 26h
		db 0, 27h, 0, 28h, 0, 29h, 0, 2Ah, 0, 2Bh, 0, 2Dh, 0, 2Eh, 0, 2Fh
byte_71740	db 0, 30h, 0, 31h, 0, 32h, 0, 34h, 0, 35h, 0, 36h, 0, 37h, 0, 38h
		db 0, 39h, 0, 3Bh, 0, 3Ch, 0, 3Dh, 0, 3Eh, 0, 3Fh, 0, 41h, 0, 42h
		db 0, 43h, 0, 44h, 0, 45h, 0, 46h, 0, 48h, 0, 49h, 0, 4Ah, 0, 4Bh
		db 0, 4Dh, 0, 4Eh, 0, 4Fh, 0, 50h, 0, 51h, 0, 53h, 0, 54h, 0, 55h
byte_71780	db 0, 56h, 0, 58h, 0, 59h, 0, 5Ah, 0, 5Bh, 0, 5Dh, 0, 5Eh, 0, 5Fh
		db 0, 60h, 0, 62h, 0, 63h, 0, 64h, 0, 66h, 0, 67h, 0, 68h, 0, 6Ah
		db 0, 6Bh, 0, 6Ch, 0, 6Dh, 0, 6Fh, 0, 70h, 0, 71h, 0, 73h, 0, 74h
		db 0, 76h, 0, 77h, 0, 78h, 0, 7Ah, 0, 7Bh, 0, 7Ch, 0, 7Eh, 0, 7Fh
byte_717C0	db 0, 81h, 0, 82h, 0, 83h, 0, 85h, 0, 86h, 0, 88h, 0, 89h, 0, 8Ah
		db 0, 8Ch, 0, 8Dh, 0, 8Fh, 0, 90h, 0, 92h, 0, 93h, 0, 95h, 0, 96h
		db 0, 98h, 0, 99h, 0, 9Bh, 0, 9Ch, 0, 9Eh, 0, 9Fh, 0, 0A1h, 0, 0A3h
		db 0, 0A4h, 0, 0A6h, 0, 0A7h, 0, 0A9h, 0, 0ABh, 0, 0ACh, 0, 0AEh, 0, 0AFh
byte_71800	db 0, 0B1h, 0, 0B3h, 0, 0B4h, 0, 0B6h, 0, 0B8h, 0, 0B9h, 0, 0BBh, 0, 0BDh
		db 0, 0BFh, 0, 0C0h, 0, 0C2h, 0, 0C4h, 0, 0C6h, 0, 0C8h, 0, 0C9h, 0, 0CBh
		db 0, 0CDh, 0, 0CFh, 0, 0D1h, 0, 0D3h, 0, 0D4h, 0, 0D6h, 0, 0D8h, 0, 0DAh
		db 0, 0DCh, 0, 0DEh, 0, 0E0h, 0, 0E2h, 0, 0E4h, 0, 0E6h, 0, 0E8h, 0, 0EAh
byte_71840	db 0, 0ECh, 0, 0EEh, 0, 0F0h, 0, 0F2h, 0, 0F5h, 0, 0F7h, 0, 0F9h, 0, 0FBh
		db 0, 0FDh, 0, 0, 1, 2, 1, 4, 1, 6, 1, 9, 1, 0Bh, 1, 0Dh
		db 1, 10h, 1, 12h, 1, 14h, 1, 17h, 1, 19h, 1, 1Ch, 1, 1Eh, 1, 21h
		db 1, 23h, 1, 26h, 1, 29h, 1, 2Bh, 1, 2Eh, 1, 31h, 1, 33h, 1, 36h
byte_71880	db 1, 39h, 1, 3Ch, 1, 3Eh, 1, 41h, 1, 44h, 1, 47h, 1, 4Ah, 1, 4Dh
		db 1, 50h, 1, 53h, 1, 56h, 1, 59h, 1, 5Dh, 1, 60h, 1, 63h, 1, 66h
		db 1, 6Ah, 1, 6Dh, 1, 71h, 1, 74h, 1, 77h, 1, 7Bh, 1, 7Fh, 1, 82h
		db 1, 86h, 1, 8Ah, 1, 8Dh, 1, 91h, 1, 95h, 1, 99h, 1, 9Dh, 1, 0A1h
byte_718C0	db 1, 0A5h, 1, 0AAh, 1, 0AEh, 1, 0B2h, 1, 0B6h, 1, 0BBh, 1, 0BFh, 1, 0C4h
		db 1, 0C9h, 1, 0CDh, 1, 0D2h, 1, 0D7h, 1, 0DCh, 1, 0E1h, 1, 0E6h, 1, 0EBh
		db 1, 0F1h, 1, 0F6h, 1, 0FBh, 1, 1, 2, 7, 2, 0Ch, 2, 12h, 2, 18h
		db 2, 1Eh, 2, 24h, 2, 2Bh, 2, 31h, 2, 38h, 2, 3Eh, 2, 45h, 2, 4Ch
byte_71900	db 2, 53h, 2, 5Bh, 2, 62h, 2, 6Ah, 2, 71h, 2, 79h, 2, 81h, 2, 89h
		db 2, 92h, 2, 9Ah, 2, 0A3h, 2, 0ACh, 2, 0B5h, 2, 0BFh, 2, 0C9h, 2, 0D2h
		db 2, 0DDh, 2, 0E7h, 2, 0F2h, 2, 0FDh, 2, 8, 3, 13h, 3, 1Fh, 3, 2Bh
		db 3, 38h, 3, 45h, 3, 52h, 3, 60h, 3, 6Eh, 3, 7Ch, 3, 8Bh, 3, 9Bh
byte_71940	db 3, 0AAh, 3, 0BBh, 3, 0CCh, 3, 0DDh, 3, 0F0h, 3, 2, 4, 16h, 4, 2Ah
		db 4, 3Fh, 4, 54h, 4, 6Bh, 4, 82h, 4, 9Bh, 4, 0B4h, 4, 0CEh, 4, 0EAh
		db 4, 6, 5, 25h, 5, 44h, 5, 65h, 5, 87h, 5, 0ABh, 5, 0D1h, 5, 0F9h
		db 5, 23h, 6, 50h, 6, 7Fh, 6, 0B0h, 6, 0E5h, 6, 1Dh, 7, 59h, 7, 98h
byte_71980	db 7, 0DCh, 7, 24h, 8, 72h, 8, 0C6h, 8, 21h, 9, 83h, 9, 0EEh, 9, 62h
		db 0Ah, 0E2h, 0Ah, 6Eh, 0Bh, 8, 0Ch, 0B4h, 0Ch, 74h, 0Dh, 4Ch, 0Eh, 41h, 0Fh, 59h
		db 10h, 9Ch, 11h, 14h, 13h, 0D1h, 14h, 0E7h, 16h, 73h, 19h, 0A2h, 1Ch, 0BAh, 20h, 30h
		db 26h, 0D4h, 2Dh, 4Ah, 39h, 63h, 4Ch, 96h, 72h, 2Eh, 0E5h, 0, 0, 0, 0, 0
seg221		ends
