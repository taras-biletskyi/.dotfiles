This needs to be in a QMK repo in keyboards/crkbd/keymaps/mb_via(or any other custom)

I generate the map at https://config.qmk.fm/#/crkbd/r2g/LAYOUT_split_3x6_3

Convert json map from the website to C object for ease of use.
```sh
qmk json2c -o my_map.c the_first.json
```

Flash the keyboard; each half separately. There will be a promt in the terminal to press the reset/bootloader button each time, on each half.
```sh
qmk flash -kb crkbd/r2g -km mb_via
```
