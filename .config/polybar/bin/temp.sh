#!/bin/bash

# Fetch temperature (for example, from /sys/class/thermal/thermal_zone0/temp)
temp=$(cat /sys/class/thermal/thermal_zone0/temp)

#!/bin/bash

# Fetch temperature (for example, from /sys/class/thermal/thermal_zone0/temp)
temp=$(cat /sys/class/thermal/thermal_zone0/temp)

# Convert to Celsius (assuming temperature is in millidegrees)
temp_celsius=$((temp / 1000))

# Choose color based on temperature ranges for the icon
if [ $temp_celsius -lt 40 ]; then
    icon_color="%{F#00FF00}"  # Green for cool temperatures
elif [ $temp_celsius -ge 40 ] && [ $temp_celsius -lt 60 ]; then
    icon_color="%{F#FFFF00}"  # Yellow for moderate temperatures
elif [ $temp_celsius -ge 60 ] && [ $temp_celsius -lt 80 ]; then
    icon_color="%{F#FFA500}"  # Orange for hot temperatures
else
    icon_color="%{F#FF0000}"  # Red for very high temperatures
fi

# Output the icon with color and the temperature number
echo "${icon_color}%{F-} $temp_celsius°C"

