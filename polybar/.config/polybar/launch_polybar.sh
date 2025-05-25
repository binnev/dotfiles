# Terminate already running bars
polybar-msg cmd quit

# Spawn the bar(s) on every connected monitor
for m in $(polybar -m | cut -d ":" -f1); do 
  MONITOR=$m polybar --reload top &
done