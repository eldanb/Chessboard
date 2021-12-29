// title      : OpenJSCAD.org Logo
// author     : Rene K. Mueller
// license    : MIT License
// revision   : 0.003
// tags       : Logo,Intersection,Sphere,Cube
// file       : logo.jscad

include("https://raw.githubusercontent.com/ojsc/opentype.jscad/master/dist/opentype.min.jscad");
include("https://raw.githubusercontent.com/ojsc/opentype.jscad/master/dist/fonts/purisa_ttf.jscad");
include("https://raw.githubusercontent.com/ojsc/opentype.jscad/master/dist/fonts/mainframe_spore_ttf.jscad");
include("https://raw.githubusercontent.com/ojsc/opentype.jscad/master/dist/fonts/emojisymbols_regular_woff.jscad");

const thickness = 1.5;
const total_height = 4;
const button_rad = 5;

function capWithShape(capShape) {
  const extrudedCapShape = union(capShape.map((pl) => 
     linear_extrude({ height: thickness }, pl)))

  return difference(
    [ cylinder({r: button_rad+thickness, h: total_height}),
      cylinder({ r: button_rad, 
                 h: total_height-thickness}),
      center(true, extrudedCapShape).translate([0,0,total_height-thickness+thickness/2])
    ]
  );
    
}

function main () {
  let fEmoji = Font3D.parse(emojisymbols_regular_woff_data.buffer);
  return capWithShape([
      Font3D.cagFromGlyph(fEmoji,805,8)
      //Font3D.cagFromGlyph(fEmoji,806,8)
      //Font3D.cagFromGlyph(fEmoji,510,15)
  ]);
}

