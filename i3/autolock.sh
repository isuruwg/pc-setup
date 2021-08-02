# Take a screenshot
# scrot /tmp/screen_locked.png

# Pixellate it 10x
# mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

# Lock screen displaying this image.
# i3lock -i /tmp/screen_locked.png
i3lock -c 000000

# Turn the screen off after a delay.
# sleep 300; pgrep i3lock & xset dpms force off
sleep 300 
if [[$(pgrep i3lock)]]; then
       	xset dpms force off
else
       	break
fi
