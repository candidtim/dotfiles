wget http://apod.nasa.gov/apod/ -O /tmp/apod.html
grep -m 1 jpg /tmp/apod.html | sed -e 's/<//' -e 's/>//' -e 's/.*=//' -e 's/"//g' -e 's/^/http:\/\/apod.nasa.gov\/apod\//' > /tmp/pic_url
today=$(date "+%Y-%m-%d")
cp ~/Pictures/wallpaper.jpg ~/Pictures/wallpaper_$today.jpg
cat /tmp/pic_url | xargs -n 1 sh -c 'wget $0 -O ~/Pictures/wallpaper.jpg'
