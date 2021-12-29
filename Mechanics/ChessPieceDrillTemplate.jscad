// title      : OpenJSCAD.org Logo
// author     : Rene K. Mueller
// license    : MIT License
// revision   : 0.003
// tags       : Logo,Intersection,Sphere,Cube
// file       : logo.jscad

var interiorLen = 100
var exteriorLen = 5
var pieceRad = 8;
var magnetRad = 5;

function main () {
  return difference(
      union(
        cube({size: [interiorLen+2*exteriorLen, 
                     (pieceRad+2)*2, 3], 
              }),
        cube({size: [2, (pieceRad+2)*2, 8]})
          .translate([exteriorLen-2, 0, 3]),
    //    cube({size: [2, (pieceRad+2)*2, 8]})
      //    .translate([interiorLen+exteriorLen, 0, 3]),
         cylinder({r: pieceRad+2, h: 5+5})
          .translate([exteriorLen+interiorLen/2, pieceRad+2, 0])
     ),
        union(
            cylinder({r: pieceRad, h: 5+3}),
            cylinder({r: magnetRad, h: 5+5})
          ).translate([exteriorLen+interiorLen/2, pieceRad+2, 0])
          
     
  );
  
}
