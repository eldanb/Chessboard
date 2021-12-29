const wall_width = 1.7;
const total_height= 6.5;
const hover = 3;
const schedule_size = 20;

const screwPads = [
    [20, 14, 0],
    [20-9.5, 14+145, 0],
    [20-9.5+149, 14+145, 0],
    [20-9.5+149, 14+145-155, 0]
];

function screwPad() {
    return cube({size: [9, 9, hover+1], center: true}).translate([0, 0, (hover+1)/2]);
    
}

function screwClearance() {
    return union( 
    cylinder({r1: 1.5, r2: 1.5, start: [0, 0, -(hover+1)/2], end: [0, 0, (hover+1)/2]})
          .translate([0, 0, (hover+1)/2]),
    cube({size: [4, 4, total_height], center: true})
          .translate([0, 0, total_height/2+(hover+1)]));
    
}

function main() {
    const boardAdditive = [];

    for(let i=0; i<9; i++) {
        boardAdditive.push(
            cube([wall_width, (schedule_size * 8), total_height - hover])
                .translate([i*schedule_size, 0, hover])
            );
            
        boardAdditive.push(
            cube([wall_width, schedule_size * 8 + wall_width, total_height - hover])
                .rotateZ(-90)
                .translate([0, i*schedule_size, hover])
            );
    }
    
    screwPads.forEach(p => boardAdditive.push(screwPad().translate(p)));

    for(let x=0; x<9; x++) {
        for(let y=0; y<9; y++) {
            boardAdditive.push(
                cube([wall_width, wall_width, hover])
                    .translate([x*schedule_size, y*schedule_size - wall_width, 0])
                );
        }
    }
    
    const screwClearances = union(screwPads.map(p => screwClearance().translate(p)));
    
    boardAdditive.push(
            cube([wall_width*2, (schedule_size * 8), total_height - hover])
                .translate([-wall_width*2, 0, hover]),
            cube([wall_width*2, (schedule_size * 8), total_height - hover])
                .translate([8*schedule_size+wall_width, 0, hover]),
            cube([wall_width*2, schedule_size * 8 + wall_width, total_height - hover])
                .rotateZ(-90)
                .translate([0, -wall_width, hover]),
            cube([wall_width*2, schedule_size * 8 + wall_width, total_height - hover])
                .rotateZ(-90)
                .translate([0, schedule_size*8 + wall_width*2, hover])
            );
            
    return difference(union(boardAdditive), screwClearances);

}
