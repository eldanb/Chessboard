// title      : OpenJSCAD.org Logo
// author     : Rene K. Mueller
// license    : MIT License
// revision   : 0.003
// tags       : Logo,Intersection,Sphere,Cube
// file       : logo.jscad

const foot_length = 15;
const foot_rad = 4;
const foot_cap_width = 1.5;
const screw_rad = 1.1;
const bolt_rad = 2.5;


function main () {
  return difference(
    cylinder({r: foot_rad, h: foot_length}),
    cylinder({r: screw_rad, h: foot_length}),
    cylinder({r: bolt_rad, fn: 6, h: foot_length}).translate([0, 0, foot_cap_width])
  )
}

