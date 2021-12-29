const panel_width = 40;
const panel_height = 168;
const panel_depth = 10;
const panel_thick = 1.5;

const display_width = 27;
const display_height = 8.5;


const screwPads = [
    [ 29.4, panel_width-5, 0],
    [ 29.4, panel_width-5-30, 0],
    [ 133.5+29.4, panel_width-5, 0],
    [ 133.5+29.4, panel_width-5-30, 0]
];

const buttonLocs = [
    [ 29.4 - 14 , panel_width-5-3.8, 0],
    [ 29.4 - 14 , panel_width-5-30+3.8, 0],

    [ 29.4 + 28 , panel_width-5-3.8, 0],
    [ 29.4 + 28 , panel_width-5-30+3.8, 0],
    [ 29.4 + 28 - 12.7 , panel_width-5-30+3.8 + 11.43, 0],
    [ 29.4 + 28 + 14 , panel_width-5-30+3.8 + 11.43, 0],
];

const screenLoc = [ 29.4 + 28 + 14 + 45 - display_height / 2,
                    (panel_width - display_width) / 2, 
                    0
                    ];
                    
function main() {
    let screws = screwPads.map((c) => cylinder({h: panel_depth+1, r: 1.5}).translate(c));
    let buttons = buttonLocs.map((c) => cylinder({h: panel_depth+1, r: 6.5}).translate(c));
    let screen = cube([display_height, display_width, panel_depth+1]).translate(screenLoc);

    let cavity = cube([
        panel_height - 2*panel_thick,
        panel_width - 2*panel_thick,
        panel_depth
    ]).translate([panel_thick, panel_thick, -panel_thick]);
    
    //return screws;
    return difference(
        [
            cube([panel_height, panel_width,  panel_depth]),
        ].concat(screws).concat(buttons).concat([screen, cavity])
    );
    
}
