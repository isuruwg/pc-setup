# Take a screenshot
# scrot /tmp/screen_locked.png

# Pixellate it 10x
# mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

# Lock screen displaying this image.
# i3lock -i /tmp/screen_locked.png
i3lock -c 000000

# Turn the screen off after a short delay
sleep 1 
xset dpms force off

