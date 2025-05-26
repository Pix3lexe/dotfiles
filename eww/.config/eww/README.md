# Eww configuration

Unfortunately you have to do some setting up for this widget to work. Will try to make this easier in later updates.

- If you want to set a wallpaper engine background, install [linux-wallpaperengine](https://github.com/Almamu/linux-wallpaperengine)
- Adjust `eww.yuck` for your display configuration:

1. Edit these booleans:

```yuck
(defvar dp1_enabled false) ; add booleans for your displays here
(defvar dp2_enabled false)
(defvar dp3_enabled false)
```

2. Edit these if statements for your displays

```yuck
    (button ; add the if statements for your displays here
      :onclick "bash -c '
        if [ ${dp1_enabled} = true ]; then
          linux-wallpaperengine --screen-root DP-1 --bg ${id_field} &
        fi
        if [ ${dp2_enabled} = true ]; then
          linux-wallpaperengine --screen-root DP-2 --bg ${id_field} &
        fi
        if [ ${dp3_enabled} = true ]; then
          linux-wallpaperengine --screen-root DP-3 --bg ${id_field} &
        fi
        wait
      '"
      "Apply"
    )
```

3. Make new checkboxes for your display that toggle the previously defined booleans

```yuck
      (box ; add checkboxes for your displays here that toggle the booleans
        :orientation "h"
        :spacing 4
        (checkbox
          :checked {dp1_enabled}
          :onchecked "eww update dp1_enabled=true"
          :onunchecked "eww update dp1_enabled=false"
        )
        (label :text "DP-1")
      )
```
