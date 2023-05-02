#!/bin/bash

rm -f c_cuboid_v1_tg1.gcode
rm -f c_cuboid_done.gcode

cp -f c_cuboid.gcode c_cuboid_v1_tg1.gcode

let layers_end=9170
let layer_height=832
let temp_stop=260

# for your info
let temp_start=$temp_stop - 45

for i in {1..10}
do
    let line=$layers_end-$i*$layer_height
    let temp=$temp_stop-5*i+5
    echo "Adding temp $temp at line $line "

    sed -i "$line i M109 S$temp" c_cuboid_v1_tg1.gcode
    sed -i "$line i M104 S$temp" c_cuboid_v1_tg1.gcode
    sed -i "$line i ;===================================" c_cuboid_v1_tg1.gcode

done

cp -f c_cuboid_v1_tg1.gcode c_cuboid_done.gcode

rm -f c_cuboid_v1_tg1.gcode

echo "DONE"

