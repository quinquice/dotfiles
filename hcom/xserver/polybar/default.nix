{ pkgs, style, machine, ... }:

# Created By @icanwalkonwater
# Edited and ported to Nix by Th0rgal

{
  home.packages = with pkgs; [ nerdfonts ];

  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;

  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
      pulseSupport = true;
    };

    script = "polybar -q -r top & polybar -q -r bottom &";

    config = with style.color; {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

      #====================BARS====================#

      "bar/top" = {
        bottom = false;
        fixed-center = true;

        width = "100%";
        height = 30;

        background = bg;
        foreground = fg;

        radius = 0;

        font-0 = "Fira Code:size=12;3";
        font-1 = "Fira Code:style=Bold:size=12;3";
        font-2 = "Fira Code:size=12;2";
        font-3 = "FontAwesome:style=Regular:size=12;3";

        # tray-position = "center";

        modules-left = "i3";
        modules-center = "title";
        modules-right = if machine.hasBattery then
          "battery wireless date"
        else
          "wireless date";

        locale = "en_US.UTF-8";
      };

      "settings" = {
        throttle-output = 5;
        throttle-output-for = 10;

        screenchange-reload = true;

        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        comppositing-underline = "over";
        compositing-border = "over";

        pseudo-transparency = "false";
      };

      #--------------------MODULES--------------------"

      "module/date" = {
        type = "internal/date";

        interval = "1.0";

        date = "%Y-%m-%d";
        time = "%H:%M:%S";

        format = " <label>";
        format-background = bright_blue;
        format-foreground = dark_bg;
        format-padding = 1;

        label = "%date% %time%";
      };

      "module/wireless" = {
        type = "internal/network";
        interface = machine.wireless_interface;

        label-connected = " %essid% %signal%";
        label-connected-foreground = dark_bg;
        format-connected-background = bright_cyan;
        format-connected-padding = 1;

        label-disconnected = " disconnected";
        label-disconnected-foreground = dark_bg;
        format-disconnected-background = bright_red;
        format-disconnected-padding = 1;
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = false;
        strip-wsnumbers = false;
        format = "<label-state> <label-mode>";
        format-background = bright_cyan;

        label-mode = "%mode%";
        label-mode-foreground = dark_bg;
        label-mode-padding = 1;

        label-unfocused = "%index%";
        label-unfocused-foreground = dark_bg;
        label-unfocused-padding = 1;

        label-focused = "%index%";
        label-focused-font = 2;
        label-focused-foreground = dark_bg;
        label-focused-padding = 1;

        label-visible = "%index%";
        label-visible-padding = 1;

        label-urgent = "%index%";
        label-urgent-background = bright_red;
        label-urgent-foreground = dark_bg;
        label-urgent-padding = 1;
      };

      "module/battery" = rec {
        type = "internal/battery";

        battery = "BAT0";
        adapter = "AC";

        format-charging = "<animation-charging> <label-charging>";
        format-discharging = "<ramp-capacity> <label-discharging>";
        format-full = "<ramp-capacity> <label-full>";

        format-charging-background = bright_green;
        format-discharging-background = format-charging-background;
        format-full-background = format-charging-background;
        format-charging-foreground = dark_bg;
        format-discharging-foreground = format-charging-foreground;
        format-full-foreground = format-charging-foreground;

        label-charging = "%percentage%%";
        label-discharging = "%percentage%%";
        label-full = "100%";
        format-charging-padding = 1;
        format-discharging-padding = format-charging-padding;
        format-full-padding = format-charging-padding;

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-framerate = 750;
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        label = "%title%";
        label-padding = 1;
        label-font = 3;
        label-maxlen = 70;
      };
    };
  };
}
