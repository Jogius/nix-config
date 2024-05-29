#!/usr/bin/env bash
#grim shot.png
#magick shot.png -blur 0x6 shot.png
#magick composite -gravity center logo.png shot.png locked.png

#echo "bla" >> /home/jogius/bla.txt

i3lock --blur 5 --image ~/nix-config/home-manager/logo.png --radius=350 --ring-width=13 --time-font="HyliaSerifBeta" --date-font="HyliaSerifBeta" --layout-font="HyliaSerifBeta" --verif-font="HyliaSerifBeta" --wrong-font="HyliaSerifBeta" --clock --time-pos="860:100" --time-size=100 --inside-color="00000000" --insidever-color="00000000" --insidewrong-color="00000000" --noinput-text="\\n\\n\\n\\n\\n\\n\\n\\nno input!"

exit

i3lock \
  --screenshots \
  --effect-blur 5x3 \
  --font 'HyliaSerifBeta' \
  --indicator-thickness 13 \
  --indicator-radius 350 \
  --text-color 00c1d5 \
  --text-clear-color fce300 \
  --text-caps-lock-color e46099 \
  --text-ver-color 00c1d5 \
  --text-wrong-color e18835 \
  --inside-color 00000000 \
  --inside-clear-color fce30020 \
  --inside-caps-lock-color fc036a20 \
  --inside-ver-color 00c1d520 \
  --inside-wrong-color e1883520 \
  --ring-color 00c1d5 \
  --ring-clear-color fce300 \
  --ring-caps-lock-color e46099 \
  --ring-ver-color 00c1d5 \
  --ring-wrong-color e18835 \
  --key-hl-color 026873 \
  --bs-hl-color e18835 \
  --effect-compose "/home/jogius/.config/swaylock/logo.png"


