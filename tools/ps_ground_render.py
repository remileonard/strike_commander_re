"""Pacific Strike : dessin du sol vu de dessus, avec les règles de Render_TerrainPipelineMain_3362C (PACIFIC.EXE) :
couleur de base = celle du sommet le plus haut (comparaison non signée), triangles de couleur 0 non dessinés (la mer
est un fond, ici la couleur 166 de la palette) ; texture = octet +4 (1er triangle) ou +5 (2e) du 1er sommet de la case,
255 = aucune, image n de TXM\\TXMPACK.PAK, u, v fixes (1er triangle (2, 1), (63, 1), (63, 62) ; 2e (0, 1), (61, 62),
(0, 62)) ; sans texture, teinte = première + (éclairage × n + 128) ÷ 256 (règle de Strike Commander). L'éclairage
n'est pas appliqué aux textures (non lu). analysis/pacific/README.md § 7.2.

Usage : python3 tools/ps_ground_render.py <dossier contenant pacific/DATA> <ligne début> <ligne fin> <colonne début>
        <colonne fin> <points par case> <sortie.png>     (lignes et colonnes de sommets, 0 à 359)
"""
import os
sys_path = os.path.dirname(os.path.abspath(__file__))
import sys
sys.path.insert(0, sys_path)
import struct  # noqa: E402
import pkware_dcl  # noqa: E402
import tri_map  # noqa: E402
from PIL import Image
from terrain_viewer import read_palette  # noqa: E402
S=sys.argv[1]
pal,rang=read_palette(S+'/pacific/DATA/PALETTE/PALETTE.IFF')
txm=open(S+'/pacific/DATA/TXM/TXMPACK.PAK','rb').read()
tents=tri_map.read_pak(txm)
cache={}
def tex(n):
    if n not in cache:
        a,b=tents[n]
        cache[n]=None if b<=a else (struct.unpack_from('<2H',txm,a)+(txm[a+4:b],))
    return cache[n]
d=pkware_dcl.explode(open(S+'/pacific/DATA/TERRAIN/OAHU.ZIP','rb').read())
a,b=tri_map.read_pak(d)[1]; elv=d[a:b]; cells=tri_map.read_pak(elv)
N=20; G=18
def vert(R,C):  # global vertex row/col
    cr,vr=divmod(R,N); cc,vc=divmod(C,N)
    x,_=cells[cr*G+cc]; o=x+6*(vr*N+vc)
    h=struct.unpack_from('<h',elv,o)[0]; return h,elv[o+2],elv[o+3],elv[o+4],elv[o+5]
R0,R1,C0,C1=[int(v) for v in sys.argv[2:6]]
PX=int(sys.argv[6])  # pixels per case (1000 m)
W=(C1-C0)*PX; H=(R1-R0)*PX
img=Image.new('RGB',(W,H),tuple(pal[3*166:3*166+3])); px=img.load()
def shade(colour,light):
    first,n,_=rang[colour]; t=first+(light*n+128)//256; return tuple(pal[3*t:3*t+3])
for R in range(R0,R1):
    for C in range(C0,C1):
        v00=vert(R,C); v01=vert(R,C+1); v11=vert(R+1,C+1); v10=vert(R+1,C)
        for first in (True,False):
            tri=[(v00,(0,0)),(v01,(1,0)),(v11,(1,1))] if first else [(v00,(0,0)),(v11,(1,1)),(v10,(0,1))]
            uvs=[(2,1),(63,1),(63,62)] if first else [(0,1),(61,62),(0,62)]
            hv=None
            for vv,_ in tri:
                if hv is None or (vv[0]&0xFFFF)>=(hv[0]&0xFFFF): hv=vv
            colour=hv[2]
            if colour==0: continue
            tn=v00[3] if first else v00[4]
            T=tex(tn) if tn!=255 else None
            for yy in range(PX):
                for xx in range(PX):
                    fx=(xx+.5)/PX; fy=(yy+.5)/PX
                    if first and fx<fy: continue
                    if not first and fx>=fy: continue
                    # barycentric on unit square
                    if first: l=(1-fx, fx-fy, fy)
                    else: l=(1-fy, fx, fy-fx)
                    if T:
                        w,h,data=T
                        u=sum(l[k]*uvs[k][0] for k in range(3)); v=sum(l[k]*uvs[k][1] for k in range(3))
                        c=data[min(h-1,int(v))*w+min(w-1,int(u))]; col=tuple(pal[3*c:3*c+3])
                    else:
                        light=sum(l[k]*tri[k][0][1] for k in range(3)); col=shade(colour,int(light))
                    px[(C-C0)*PX+xx,(R-R0)*PX+yy]=col
img.save(sys.argv[7]); print(img.size)
