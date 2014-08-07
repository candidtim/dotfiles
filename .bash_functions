# Runs nautilus with given parameters and brings its window to the top
function nau() {
    nautilus "$@"
    ps aux | grep '[n]autilus' | awk '{print $2}' | xargs xdotool search --pid | tail -1 | xargs xdotool windowactivate
}
