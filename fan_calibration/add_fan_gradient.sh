#!/bin/bash

rm -f c_cuboid_v1_tg1.gcode
rm -f c_cuboid_fan_done.gcode

cp -f c_cuboid.gcode c_cuboid_v1_tg1.gcode

let steps=25

let layers_stop=9170
let layers_start=850
let layers_step=($layers_stop-$layers_start)/$steps

let fan_stop=255
let fan_start=$fan_stop-255
let fan_step=($fan_stop-$fan_start)/$steps

for (( i = 1; i <= $steps; i++ ))
do
    let line=$layers_stop-$i*$layers_step

    let fan=$fan_stop-i*$fan_step
    echo "Adding fan $fan at line $line "

    sed -i "$line i M106 S$fan" c_cuboid_v1_tg1.gcode
    sed -i "$line i ;===================================" c_cuboid_v1_tg1.gcode

done

cp -f c_cuboid_v1_tg1.gcode c_cuboid_fan_done.gcode

rm -f c_cuboid_v1_tg1.gcode

echo "DONE"

