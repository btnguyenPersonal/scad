sizeSquare = 100;
sizeBorder = 50;
sizeBoardThickness = 10;
sizePiece = 40;
heightPawn = 50;
heightTallPiece = 100;
tolerance = 0.001;
colorMahogany = "#C04000";
colorWhite = "#FFFFFF";
colorBlack = "#000000";

color(colorMahogany)
translate([-1 * sizeBorder, -1 * sizeBorder, 0])
    cube([(8 * sizeSquare) + (2 * sizeBorder), (8 * sizeSquare) + (2 * sizeBorder), sizeBoardThickness]);

for (i = [0 : 7]) {
    for (j = [0 : 7]) {
        color(((j + i) % 2 == 0) ? colorBlack : colorWhite)
        translate([sizeSquare * j, sizeSquare * i, tolerance])
        cube([sizeSquare, sizeSquare, sizeBoardThickness]);
    }
}
 
// WHITE
for (i = [0 : 7]) {
    x = sizeSquare * i + sizeBorder;
    y = sizeSquare + sizeBorder;
    h = sizeBoardThickness - tolerance;
    c = colorWhite;
    color(c)
    translate([x, y, h])
    cylinder(h=heightPawn, r1=sizePiece/2, r2=0);
    color(c)
    translate([x, y, h + heightPawn])
    sphere(r=heightPawn / 4);
}
for (i = [0 : 7]) {
    color(colorWhite)
    translate([
        sizeSquare * i + sizeBorder,
        sizeBorder,
        sizeBoardThickness - tolerance
    ])
    cylinder(h=heightTallPiece, r1=sizePiece/2, r2=0);
}

//BLACK
for (i = [0 : 7]) {
    x = sizeSquare * i + sizeBorder;
    y = 6 * (sizeSquare) + sizeBorder;
    h = sizeBoardThickness - tolerance;
    c = colorBlack;
    color(c)
    translate([x, y, h])
    cylinder(h=heightPawn, r1=sizePiece/2, r2=0);
    color(c)
    translate([x, y, h + heightPawn])
    sphere(r=heightPawn / 4);
}
for (i = [0 : 7]) {
    color(colorBlack)
    translate([
        sizeSquare * i + sizeBorder,
        (7 * sizeSquare) + sizeBorder,
        sizeBoardThickness - tolerance
    ])
    cylinder(h=heightTallPiece, r1=sizePiece/2, r2=0);
}
