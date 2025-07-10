#!/bin/sh

LAT="43.9303"
LON="10.9078"
URL="https://api.3bmeteo.com/mobilev3/api_previsioni/home_geo/$LAT/$LON/it/?format=json2&X-API-KEY=fhrwRdevqwq8r7q9UXTwP6lSX74g34jnQ6756tGo"

DATA=$(curl -s "$URL")

RAIN_NEXT_2HRS=$(echo "$FORECAST" | jq '[.hourly.precipitation[0:2][]] | add')

TEMP=$(echo "$DATA" | jq -r '.localita.previsione_giorno[0].previsione_oraria[0].temperatura.gradi') # e.g. 23.3 (C)
CODE=$(echo "$DATA" | jq -r '.localita.previsione_giorno[0].previsione_oraria[0].precipitazioni') # e.g. 2

# Map WMO code to icon 
case $CODE in
  0) ICON="" ;;      # Clear sky
  1) ICON="" ;;      # Mainly clear
  2) ICON="" ;;      # Partly cloudy
  3) ICON="" ;;      # Overcast
  45|48) ICON="" ;;  # Fog or depositing rime fog
  51|53|55) ICON="" ;;  # Drizzle: Light, moderate, dense
  56|57) ICON="?" ;;      # Freezing drizzle
  61|63|65) ICON="" ;;  # Rain: slight, moderate, heavy
  66|67) ICON="?" ;;      # Freezing rain
  71|73|75) ICON="󰖘" ;;  # Snowfall
  77) ICON="?" ;;         # Snow grains
  80|81|82) ICON="" ;;  # Rain showers
  85|86) ICON="?" ;;      # Snow showers
  95) ICON="󰖓" ;;        # Thunderstorm
  96|99) ICON="?" ;;      # Thunderstorm with hail
  *) ICON="" ;;         # Unknown
esac

# Format temp: round to nearest integer, add degree symbol
TEMP_LABEL="$(printf "%.0f°C" "$TEMP")"

LABEL="$TEMP_LABEL"
sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
