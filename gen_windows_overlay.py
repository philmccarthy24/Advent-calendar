import drawSvg as draw
import random

#this is the scad code to generate the grid
#translate([22,20.5]) advent_grid() {
#    square([40,60]);
#}
#module advent_grid() {
#    for(y = [0 : 1 : 4]) {
#        for(x = [0 : 1 : 4]) {
#            translate([x*55, y*80]) children();
#        }
#    }
#}

d = draw.Drawing(420, 297, origin=(0,-297))
g = draw.Group(transform='scale(1,-1)')

days = list(range(1, 26)) #26 exclusive
random.shuffle(days)

for y in range(5):
  for x in range(5):
    rectPos = (20.5+(x*80),22+(y*55)) 
    g.append(draw.Rectangle(rectPos[0],rectPos[1],60,40, stroke_width=1, stroke='black', fill='none'))
    #g.append(draw.Circle(rectPos[0]+50,rectPos[1]+10,8, fill='red'))
    g.append(draw.Text(str(days[(y*5) + x]),8, 0,0, text_anchor='middle', 
    transform=f'scale(1,-1) translate({rectPos[0]+54},{rectPos[1]+37})', fill='white'))

d.append(g)
d.setPixelScale(1)  # Set number of pixels per geometry unit
d.setRenderSize(w=5260,h=3720);
#d.saveSvg('windows_overlay.svg')
d.savePng('windows_overlay.png')