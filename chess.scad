sizeSquare = 80;
sizeBorder = 50;
sizeBoardThickness = 10;
sizePiece = 40;
heightPawn = 50;
heightPawnBase = 10;
heightRook = 70;
heightRookCrown = 10;
heightRookBase = 10;
heightKnight = 30;
heightKnightNeck = 5;
heightKnightBase = 10;
heightKnightHeadThickness = 18;
heightKnightHead = 60;
heightBishop = 63;
heightBishopNeck = 5;
heightBishopBase = 10;
heightBishopCrown = 40;
heightBishopSlit = 3;
heightKing = 90;
heightKingBase = 10;
heightKingNeck = 5;
heightKingCrown = 25;
heightQueen = 90;
heightQueenBase = 10;
heightQueenNeck = 5;
heightQueenCrown = 25;
heightTallPiece = 100;
liftedSquareTolerance = 0.1;
tolerance = 0.001;
colorMahogany = "#C04000";
colorWhite = "#ffffff";
colorBlack = "#3e3e3e";
colorGreen = "#35654d";

color(colorMahogany)
translate([-1 * sizeBorder, -1 * sizeBorder, 0])
cube([(8 * sizeSquare) + (2 * sizeBorder), (8 * sizeSquare) + (2 * sizeBorder), sizeBoardThickness]);

for (i = [0 : 7]) {
    for (j = [0 : 7]) {
        color(((j + i) % 2 == 0) ? colorGreen : colorWhite)
        translate([sizeSquare * j, sizeSquare * i, liftedSquareTolerance])
        cube([sizeSquare, sizeSquare, sizeBoardThickness]);
    }
}

{
    // PAWNS
    for (j = [1, 6]) {
        for (i = [0 : 7]) {
            x = sizeSquare * i + sizeSquare / 2;
            y = (j * sizeSquare) + sizeSquare / 2;
            h = sizeBoardThickness - tolerance;
            c = j < 4 ? colorWhite : colorBlack;
            color(c)
            translate([x, y, h])
            cylinder(h=heightPawnBase, r=sizePiece/2);
            color(c)
            translate([x, y, h])
            cylinder(h=heightPawn, r1=sizePiece/3, r2=sizePiece/5);
            color(c)
            translate([x, y, h + heightPawn])
            sphere(r=heightPawn / 4);
        }
    }
    // ROOKS
    for (j = [0, 7]) {
        for (i = [0, 7]) {
            x = sizeSquare * i + sizeSquare / 2;
            y = (j * sizeSquare) + sizeSquare / 2;
            h = sizeBoardThickness - tolerance;
            c = j < 4 ? colorWhite : colorBlack;
            color(c)
            translate([x, y, h])
            cylinder(h=heightRookCrown, r=sizePiece/2);
            color(c)
            translate([x, y, h])
            cylinder(h=heightRook, r=sizePiece/3);
            color(c)
            translate([x, y, h + heightRook])
            cylinder(h=heightRookBase, r=sizePiece/2);
            difference() {
                color(c)
                translate([x, y, h + heightRook + heightRookCrown])
                cylinder(h=heightRookCrown, r=sizePiece/2);
                color(c)
                translate([x, y, h + heightRook + heightRookCrown + tolerance])
                cylinder(h=heightRookCrown * 1.8, r=sizePiece/2.8);
                color(c)
                translate([x, y, h + heightRook + (heightRookCrown * 1.8) + tolerance])
                cube([sizePiece, sizePiece / 4, heightRookCrown], center=true);
                color(c)
                translate([x, y, h + heightRook + (heightRookCrown * 1.8) + tolerance])
                cube([sizePiece / 4, sizePiece, heightRookCrown], center=true);
            }
        }
    }
    // KNIGHT
    for (j = [0, 7]) {
        for (i = [1, 6]) {
            x = sizeSquare * i + sizeSquare / 2;
            y = (j * sizeSquare) + sizeSquare / 2;
            h = sizeBoardThickness - tolerance;
            c = j < 4 ? colorWhite : colorBlack;
            color(c)
            translate([x, y, h])
            cylinder(h=heightKnightBase, r=sizePiece/2);
            color(c)
            translate([x, y, h])
            cylinder(h=heightKnight, r=sizePiece/3);
            color(c)
            translate([x, y, h + heightKnight])
            cylinder(h=heightKnightNeck, r=sizePiece/2);
            difference() {
                union() {
                    color(c)
                    translate([x, y, h + heightKnight + heightKnightNeck])
                    rotate_extrude(angle=360)
                    polygon(points=[
                        [sizePiece / 3, 0],
                        [sizePiece / 2, heightKnightHead * 0.2],
                        [sizePiece / 2.2, heightKnightHead * 0.3],
                        [sizePiece / 2.6, heightKnightHead * 0.45],
                        [sizePiece / 3.2, heightKnightHead * 0.5],
                    ]);
                    color(c)
                    translate([x, y + 3, h + heightKnight + heightKnightNeck])
                    rotate_extrude(angle=360)
                    polygon(points=[
                        [0, heightKnightHead * 0.45],
                        [sizePiece / 2, heightKnightHead * 0.45],
                        [sizePiece / 2.5, heightKnightHead * 1],
                    ]);
                }
                color(c)
                translate([
                    x,
                    y + heightKnightHead / 2 - heightKnightHeadThickness / 2,
                    h + heightKnight + heightKnightNeck + heightKnightHead / 2 + heightKnightHead * 0.4
                ])
                cube([heightKnightHead, heightKnightHead, heightKnightHead], center=true);
                color(c)
                translate([
                    x - heightKnightHead / 2 - heightKnightHeadThickness / 2,
                    y,
                    h + heightKnight + heightKnightNeck + heightKnightHead / 2 + heightKnightHead * 0.4
                ])
                cube([heightKnightHead, heightKnightHead, heightKnightHead], center=true);
                color(c)
                translate([
                    x + heightKnightHead / 2 + heightKnightHeadThickness / 2,
                    y,
                    h + heightKnight + heightKnightNeck + heightKnightHead / 2 + heightKnightHead * 0.4
                ])
                cube([heightKnightHead, heightKnightHead, heightKnightHead], center=true);
            }
            color(c)
            translate([
                x,
                y,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.4
            ])
            cylinder(h=3, r1=sizePiece/2.45, r2=sizePiece/2.6);

            color(c)
            translate([
                x,
                y,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.45
            ])
            cylinder(h=2, r1=sizePiece/2.6, r2=sizePiece/2.7);

            color(c)
            translate([
                x,
                y,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 2
            ])
            cylinder(h=2, r1=sizePiece/2.7, r2=sizePiece/2.8);

            color(c)
            translate([
                x,
                y,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 4
            ])
            cylinder(h=2, r1=sizePiece/2.8, r2=sizePiece/3);

            color(c)
            translate([
                x,
                y - 0.5,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 6
            ])
            cylinder(h=2, r1=sizePiece/2.9, r2=sizePiece/3.1);

            color(c)
            translate([
                x,
                y - 1,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 8
            ])
            cylinder(h=2, r1=sizePiece/3, r2=sizePiece/3.2);

            color(c)
            translate([
                x,
                y - 1.2,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 10
            ])
            cylinder(h=2, r1=sizePiece/3.2, r2=sizePiece/3.4);

            color(c)
            translate([
                x,
                y - 1.5,
                h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 12
            ])
            cylinder(h=8, r1=sizePiece/3.4, r2=sizePiece/4.1);

            difference() {

                color(c)
                translate([
                    x,
                    y + 10,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 19
                ])
                rotate([-10, 0, 0])
                cube([19, 40, 16], center=true);

                color(c)
                translate([
                    x + 10,
                    y + 24,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 31
                ])
                rotate([-10, 50, 0])
                cube([30, 45, 16], center=true);

                color(c)
                translate([
                    x - 10,
                    y + 24,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 31
                ])
                rotate([-10, -50, 0])
                cube([31, 45, 16], center=true);

                color(c)
                translate([
                    x + 45,
                    y + 24,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 31
                ])
                rotate([0, -40, 0])
                cube([92, 45, 16], center=true);

                color(c)
                translate([
                    x - 45,
                    y + 24,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 31
                ])
                rotate([0, 40, 0])
                cube([92, 45, 16], center=true);

                color(c)
                translate([
                    x,
                    y + 24,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 28
                ])
                rotate([-28, 0, 0])
                cube([92, 45, 16], center=true);

                color(c)
                translate([
                    x + 12,
                    y + 36,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 28
                ])
                rotate([-13, 90, 0])
                cube([92, 113, 16], center=true);

                color(c)
                translate([
                    x - 12,
                    y + 36,
                    h + heightKnight + heightKnightNeck + heightKnightHead * 0.45 + 28
                ])
                rotate([13, 90, 0])
                cube([92, 113, 16], center=true);
            }
        }
    }
    // BISHOPS
    for (j = [0, 7]) {
        for (i = [2, 5]) {
            x = sizeSquare * i + sizeSquare / 2;
            y = (j * sizeSquare) + sizeSquare / 2;
            h = sizeBoardThickness - tolerance;
            c = j < 4 ? colorWhite : colorBlack;
            color(c)
            translate([x, y, h])
            cylinder(h=heightBishopBase, r=sizePiece/2);
            color(c)
            translate([x, y, h])
            cylinder(h=heightBishop, r=sizePiece/3);
            color(c)
            translate([x, y, h + heightBishop])
            cylinder(h=heightBishopNeck, r=sizePiece/2);
            difference() {
                union() {
                    color(c)
                    translate([x, y, h + heightBishop + heightBishopNeck])
                    rotate_extrude(angle=360)
                    polygon(points=[
                        [sizePiece/3, 0],
                        [sizePiece/2.5, heightBishopCrown * 0.2],
                        [sizePiece/2.7, heightBishopCrown * 0.3],
                        [sizePiece/3, heightBishopCrown * 0.4],
                        [sizePiece/3.5, heightBishopCrown * 0.5],
                        [sizePiece/4, heightBishopCrown * 0.6],
                        [sizePiece/4.8, heightBishopCrown * 0.7],
                        [sizePiece/6, heightBishopCrown * 0.8],
                        [sizePiece/8, heightBishopCrown * 0.9],
                        [sizePiece/10, heightBishopCrown * 0.95],
                        [0, heightBishopCrown * 1]
                    ]);
                    color(c)
                    translate([x, y, h + heightBishop + heightBishopNeck + heightBishopCrown * 0.95])
                    sphere(r=sizePiece / 10);
                }
                if (j < 4) {
                    color(c)
                    translate([x, y + 10, h + heightBishop + heightBishopNeck + heightBishopCrown * 0.5])
                    rotate([30, 0, 0])
                    cylinder(h=heightBishopSlit, r=sizePiece/2);
                } else {
                    color(c)
                    translate([x, y - 10, h + heightBishop + heightBishopNeck + heightBishopCrown * 0.5])
                    rotate([-30, 0, 0])
                    cylinder(h=heightBishopSlit, r=sizePiece/2);
                }
            }
        }
    }
    // QUEEN
    for (j = [0, 7]) {
        for (i = [3]) {
            x = sizeSquare * i + sizeSquare / 2;
            y = (j * sizeSquare) + sizeSquare / 2;
            h = sizeBoardThickness - tolerance;
            c = j < 4 ? colorWhite : colorBlack;
            color(c)
            translate([x, y, h])
            cylinder(h=heightQueenBase, r=sizePiece/2);
            color(c)
            translate([x, y, h])
            cylinder(h=heightQueen, r=sizePiece/3);
            color(c)
            translate([x, y, h + heightQueen])
            cylinder(h=heightQueenNeck, r=sizePiece/2);
            difference() {
                union() {
                    color(c)
                    translate([x, y, h + heightQueen + heightQueenNeck])
                    rotate_extrude(angle=360)
                    polygon(points=[
                        [sizePiece/3, 0],
                        [sizePiece/2.9, heightQueenCrown * 0.2],
                        [sizePiece/2.7, heightQueenCrown * 0.4],
                        [sizePiece/2.6, heightQueenCrown * 0.6],
                        [sizePiece/2.4, heightQueenCrown * 0.8],
                        [0, heightQueenCrown * 1]
                    ]);
                    color(c)
                    translate([x, y, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.95])
                    sphere(r=sizePiece / 10);
                }
                color(c)
                translate([x, y + sizePiece / 2.2, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
                color(c)
                translate([x, y - sizePiece / 2.2, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
                color(c)
                translate([x + sizePiece / 2.2, y, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
                color(c)
                translate([x - sizePiece / 2.2, y, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
                color(c)
                translate([x - 12.55, y + 12.55, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
                color(c)
                translate([x + 12.55, y + 12.55, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
                color(c)
                translate([x + 12.55, y - 12.55, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
                color(c)
                translate([x - 12.55, y - 12.55, h + heightQueen + heightQueenNeck + heightQueenCrown * 0.8])
                sphere(r=sizePiece / 10);
            }
        }
    }
    // KING
    for (j = [0, 7]) {
        for (i = [4]) {
            x = sizeSquare * i + sizeSquare / 2;
            y = (j * sizeSquare) + sizeSquare / 2;
            h = sizeBoardThickness - tolerance;
            c = j < 4 ? colorWhite : colorBlack;
            color(c)
            translate([x, y, h])
            cylinder(h=heightKingBase, r=sizePiece/2);
            color(c)
            translate([x, y, h])
            cylinder(h=heightKing, r=sizePiece/3);
            color(c)
            translate([x, y, h + heightKing])
            cylinder(h=heightKingNeck, r=sizePiece/2);
            color(c)
            translate([x, y, h + heightKing + heightKingNeck])
            rotate_extrude(angle=360)
            polygon(points=[
                [sizePiece/3, 0],
                [sizePiece/2.9, heightKingCrown * 0.2],
                [sizePiece/2.7, heightKingCrown * 0.4],
                [sizePiece/2.6, heightKingCrown * 0.6],
                [sizePiece/2.4, heightKingCrown * 0.8],
                [0, heightKingCrown * 1]
            ]);
            color(c)
            translate([x, y, h + heightKing + heightKingNeck + heightKingCrown * 0.95])
            cube([sizePiece / 10, sizePiece / 10, 25], center=true);
            color(c)
            translate([x, y, h + heightKing + heightKingNeck + heightKingCrown * 0.95 + 7])
            cube([10, sizePiece / 10, sizePiece / 10], center=true);
        }
    }
}
