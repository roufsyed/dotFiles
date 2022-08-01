# enable vertical scrolling
exec --no-startup-id synclient VertEdgeScroll=1 TapButton1=1 TapButton2=1 TapButton3=1

# Dont know what this is 
exec --no-startup-id /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1

# wallpaper
exec_always --no-startup-id feh --bg-scale ~/Pictures/mac-os-catalina-morning.jpg

# disable title bar and set border pixel 1
default_border pixel 1
default_floating_border pixel 1
hide_edge_borders smart

# lock desktop
bindsym $alt+shift+x exec i3lock 

# Make the currently focused window a scratchpad
bindsym $alt+Shift+minus move scratchpad

# Show the first scratchpad window
bindsym $alt+minus scratchpad show

# mod+` and mod+tab to mark and goto respectively
# use 'xev' command in terminal to know key names
bindsym $alt+m exec i3-input -F 'mark %s' -l 1 -P 'Mark: '
bindsym $alt+Tab exec i3-input -F '[con_mark="%s"] focus' -l 1 -P 'Goto: '

set $alt Mod1
set $window Mod4

font pango:UbuntuMono Nerd Font 0

# client border color
# class         border    bg     text  indicator child_border
client.focused #32cd32 #32cd32 #ffffff #32cd32    #32cd32

# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
# exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Sreen brightness controls [Dell latitude config]
# bindsym XF86MonBrightnessUp exec xbacklight -inc 2 # increase screen brightness
# bindsym XF86MonBrightnessown exec xbacklight -dec 2 # decrease screen brightness

# Lenovo brightness controls [Pre req: light] [Thinkpad config]
bindsym XF86MonBrightnessUp exec --no-startup-id light -A 2 # increase screen brightness
bindsym XF86MonBrightnessDown exec --no-startup-id light -U 2 # decrease screen brightness

# Touchpad controls
bindsym XF86TouchpadToggle exec /some/path/toggletouchpad.sh # toggle touchpad

# Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# Use Mouse+$alt to drag floating windows to their wanted position
floating_modifier $alt

# kill focused window
bindsym $alt+q kill

# start dmenu (a program launcher)
bindsym $alt+d exec --no-startup-id dmenu_run -l 100

# pop up window in fullscreen
popup_during_fullscreen smart

# change focus
bindsym $alt+h focus left
bindsym $alt+j focus down
bindsym $alt+k focus up
bindsym $alt+l focus right

# move focused window
bindsym $alt+Shift+h move left
bindsym $alt+Shift+j move down
bindsym $alt+Shift+k move up
bindsym $alt+Shift+l move right

# split in horizontal orientation
bindsym $alt+v split h

# split in vertical orientation
bindsym $alt+b split v

# enter fullscreen mode for the focused container
bindsym $alt+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $alt+s layout stacking
bindsym $alt+w layout tabbed
bindsym $alt+e layout toggle split

# toggle tiling / floating
bindsym $alt+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $alt+space focus mode_toggle

# focus the parent container
bindsym $alt+a focus parent

# focus the child container
bindsym $alt+z focus child


# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1:Terminal"
set $ws2 "2:Editor"
set $ws3 "3:Brave"
set $ws4 "4:File"
set $ws5 "5:Utility"
set $ws6 "6:Docs"
set $ws7 "7:Software-center"
set $ws8 "8:Communication"
set $ws9 "9:Git-cola"
set $ws10 "10:Media"

# Assign Workspaces:
assign [title = "alacTerm"] $ws1
assign [title = "nvim@alac"] $ws2
assign [instance="brave-browser"] $ws3
assign [class="Org.gnome.Nautilus"] $ws4
assign [title = "bpyt"] $ws5
assign [class="geary"] $ws5
assign [instance = "calendar.google.com"] $ws5
assign [instance = "kleki.com"] $ws5
assign [instance = "libreoffice"] $ws6
assign [instance = "obsidian"] $ws6
assign [instance = "acrobat.adobe.com__link_home"] $ws6
assign [class="Org.gnome.software"] $ws7
assign [class="Gnome-power-statistics"] $ws7
assign [instance = "web.whatsapp.com"] $ws8
assign [instance = "web.telegram.org__k"] $ws8
assign [instance = "keep.google.com"] $ws8
assign [class="Signal"] $ws8
assign [instance="discord.com__channels_@me"] $ws8
assign [class="git-cola"] $ws9
assign [class="vlc"] $ws10
assign [instance = "open.spotify.com__collection_track"] $ws10
assign [class="qBittorrent"] $ws10

# Variables to for alacrtitty and nvim with specific title
set $alacritty alacritty -t "alacTerm"
set $nvim alacritty -t "nvim@alac" -e "nvim"

# Autostart apps on system startup
exec --no-startup-id $alacritty
exec --no-startup-id $nvim
exec --no-startup-id brave-browser

# switch to workspace
bindsym $alt+1 workspace number $ws1
bindsym $alt+2 workspace number $ws2
bindsym $alt+3 workspace number $ws3
bindsym $alt+4 workspace number $ws4
bindsym $alt+5 workspace number $ws5
bindsym $alt+6 workspace number $ws6
bindsym $alt+7 workspace number $ws7
bindsym $alt+8 workspace number $ws8
bindsym $alt+9 workspace number $ws9
bindsym $alt+0 workspace number $ws10

# move focused container to workspace
bindsym $alt+Shift+1 move container to workspace number $ws1
bindsym $alt+Shift+2 move container to workspace number $ws2
bindsym $alt+Shift+3 move container to workspace number $ws3
bindsym $alt+Shift+4 move container to workspace number $ws4
bindsym $alt+Shift+5 move container to workspace number $ws5
bindsym $alt+Shift+6 move container to workspace number $ws6
bindsym $alt+Shift+7 move container to workspace number $ws7
bindsym $alt+Shift+8 move container to workspace number $ws8
bindsym $alt+Shift+9 move container to workspace number $ws9
bindsym $alt+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $alt+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $alt+Shift+r restart

# exit i3 (logs you out of your X session)
# bindsym $alt+Shift+e exec "i3-nagbar -t worning -m 'Do you really want to logout?' -B 'Yes' 'i3-msg exit'"
bindsym $alt+Shift+e exec i3-msg exit

# resize window (you can also use the mouse for that)
mode "resize" {
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym j resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $alt+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $alt+r mode "default"
}

bindsym $alt+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
        # mode hide
        position bottom
        # output primary
        # tray_output HDMI2
        font pango:UbuntuMono Nerd Font 11
        separator_symbol |
        colors {
                focused_workspace  #2b72a8  #2b72a8     #000000
        }
}

# floating window config
for_window [class=Alacritty] floating enable, resize set 800px 450px, move position center
for_window [title=nvim@alac] Fullscreen toggle
for_window [class=Org.gnome.Nautilus] floating enable, resize set 800px 500px, move position center
for_window [class=Signal] floating enable, resize set 800px 500px, move position center
for_window [class=Geary] floating enable, resize set 900px 500px, move position center
for_window [class=Gnome-calculator] floating enable, resize set 500px 300px, move position center
# for_window [title=nvim@alac] floating enable, resize set 1355px 735px, move position center

# bindsym $alt+Return exec gnome-terminal --class floating_term
bindsym $alt+Return exec --no-startup-id $alacritty; workspace $ws1
bindsym $alt+shift+t exec --no-startup-id alacritty -e bpytop; workspace $ws5
bindsym $alt+shift+d exec --no-startup-id brave-browser --app="https://kleki.com/"; workspace $ws5

# bindsym to launch some more apps using window key
bindsym $window+b exec --no-startup-id brave-browser; workspace $ws3
bindsym $window+c exec --no-startup-id brave-browser --app="https://calendar.google.com/calendar/u/0/r"; workspace $ws5
bindsym $window+d exec --no-startup-id brave-browser --app="https://discord.com/channels/@me"; workspace $ws8
bindsym $window+e exec --no-startup-id $nvim; workspace $ws2
bindsym $window+f exec --no-startup-id nautilus; workspace $ws4
bindsym $window+g exec --no-startup-id git-cola; workspace $ws9
bindsym $window+k exec --no-startup-id brave-browser --app="https://keep.google.com/"; workspace $ws8
bindsym $window+m exec --no-startup-id brave-browser --app="https://open.spotify.com/collection/track"; workspace $ws10
bindsym $window+o exec --no-startup-id obsidian; workspace $ws6
bindsym $window+p exec --no-startup-id brave-browser --app="https://acrobat.adobe.com/link/home/"; workspace $ws8
bindsym $window+q exec --no-startup-id qbittorrent-arnatious.qbittorrent; workspace $ws10
bindsym $window+s exec --no-startup-id signal-desktop; workspace $ws8
bindsym $window+t exec --no-startup-id brave-browser --app="https://web.telegram.org/k/"; workspace $ws8
bindsym $window+u exec --no-startup-id snap-store.ubuntu-software; workspace $ws6
bindsym $window+w exec --no-startup-id brave-browser --app="https://web.whatsapp.com/"; workspace $ws8
bindsym $window+y exec --no-startup-id brave-browser --app="https://youtube.com"; workspace $ws10
