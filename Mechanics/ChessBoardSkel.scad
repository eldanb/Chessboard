wallWidth = 1.2;
paperHeight = 0.5;
boardHeight = wallWidth+3.1+paperHeight;
scheduleSize = 20;
scheduleCount = 8;
boardMargin = 3;
midScheduleBlank = 5;
epsilon = 0.1;
frameHeight = 20;
reedHolesOnly = false;

totalBoardSide = scheduleCount*scheduleSize + 2 * wallWidth + 2*boardMargin;


module boardTop() {
    difference() {
        union() {
            // Frame
            difference() {
                cube([totalBoardSide, totalBoardSide, boardHeight]);
                translate([wallWidth, wallWidth, wallWidth]) {
                    cube([totalBoardSide-2*wallWidth, 
                                totalBoardSide-2*wallWidth, boardHeight-wallWidth + epsilon]);
                }
            }
            
            // Grid
            for(i=[0:scheduleCount*2]) {
                translate([wallWidth + boardMargin + (i)*scheduleSize/2 - wallWidth/2, 0, wallWidth]) {
                    cube([wallWidth, totalBoardSide, boardHeight-wallWidth-paperHeight]); 
                }
                
                translate([0, wallWidth + boardMargin + (i)*scheduleSize/2 - wallWidth/2, wallWidth]) {
                    cube([totalBoardSide, wallWidth, boardHeight-wallWidth-paperHeight]); 
                }
            }
        }
        
        // Schedule holes and gaps
        for(i=[0:scheduleCount-1]) {
            for(j=[0:scheduleCount-1]) {
               translate([wallWidth + boardMargin + i * scheduleSize, wallWidth + boardMargin + j * scheduleSize, 0]) {
                   translate([(scheduleSize-midScheduleBlank)/2,
                              (scheduleSize-midScheduleBlank)/2,
                              wallWidth]) {
                        cube([midScheduleBlank, midScheduleBlank, boardHeight]);
                   }

                   translate([(2*scheduleSize-midScheduleBlank)/2,
                              (2*scheduleSize-midScheduleBlank)/2,
                              wallWidth]) {
                        cube([midScheduleBlank, midScheduleBlank, boardHeight]);
                   }

                  reedOrigin = scheduleSize/2-5;  
                  if(reedHolesOnly) {
                      translate([reedOrigin, reedOrigin, -epsilon]) {
                          cylinder(wallWidth+2*epsilon, 1, 0.8, $fn=10);
                      } 
                      translate([reedOrigin+15, reedOrigin+15, -epsilon]) {
                          cylinder(wallWidth+2*epsilon, 1, 0.8, $fn=10);
                      }
                  }   
           
                  // Led
                  translate([scheduleSize-wallWidth-2.5, 3, -epsilon]) {
                      cylinder(wallWidth+2*epsilon, 1.7, 1.7, $fn=10);
                  }               

               } 
            }
        }
    }
}

module boardFrame() {
    difference() {
        cube([totalBoardSide + 2*wallWidth, totalBoardSide + 2*wallWidth, frameHeight]);
        translate([wallWidth*2, wallWidth*2, wallWidth]) { 
            cube([totalBoardSide-2*wallWidth, totalBoardSide-2*wallWidth, frameHeight]);
        }
        translate([wallWidth, wallWidth, frameHeight - boardHeight]) { 
            cube([totalBoardSide, totalBoardSide, frameHeight]);
        }

    }
}
    


//boardFrame();
//translate([wallWidth, wallWidth, frameHeight - boardHeight]) {
   boardTop();
//}