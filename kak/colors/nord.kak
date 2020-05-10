#
# nord.kak, by chriswalker
#

evaluate-commands %sh{
    polar_night_darkest='rgb:2e3440'
    polar_night_dark='rgb:3b4252'
    polar_night_light='rgb:434c5e'
    polar_night_lightest='rgb:4c566a'
    polar_night_comment='rgb:616e88'

    snow_storm_dark='rgb:d8dee9'
    snow_storm_mid='rgb:e5e9f0'
    snow_storm_light='rgb:eceff4'

    frost_darkest='rgb:5e81ac'
    frost_dark='rgb:81a1c1'
    frost_light='rgb:88c0d0'
    frost_lightest='rgb:8fbcbb'

    aurora_red='rgb:bf616a'
    aurora_orange='rgb:d08770'
    aurora_yellow='rgb:ebcb8b'
    aurora_green='rgb:a3be8c'
    aurora_magenta='rgb:b48ead'

    # Code
    echo "
        face global value ${frost_darkest}
        face global type ${frost_darkest}
        face global variable ${frost_light}
        face global module ${aurora_magenta}
        face global function ${frost_light}
        face global string ${aurora_green}
        face global keyword ${frost_dark}
        face global operator ${frost_light}
        face global attribute ${aurora_orange}
        face global comment ${polar_night_comment}+i
        face global meta ${frost_dark}
        face global builtin default+b #?
    "

    # Markup
    echo "
       face global title ${frost_lightest}
       face global header ${frost_light}
       face global bold ${aurora_orange}
       face global italic ${aurora_orange}
       face global mono ${aurora_green}
       face global block ${aurora_orange}
       face global link ${frost_darkest}
       face global bullet ${aurora_magenta}
       face global list ${aurora_magenta}
    "

    # Builtins
    echo "
        face global Default ${snow_storm_dark},${polar_night_darkest}

        face global PrimarySelection ${snow_storm_mid},${frost_darkest}+b
        face global SecondarySelection ${snow_storm_mid},${frost_dark}+fg

        face global PrimaryCursor ${polar_night_darkest},${snow_storm_dark}+b
        face global SecondaryCursor ${polar_night_darkest},${frost_light}+fg
        face global PrimaryCursorEol ${polar_night_darkest},${aurora_yellow}+fg
        face global SecondaryCursorEol ${polar_night_darkest},${aurora_yellow}+fg

        face global LineNumbers ${polar_night_lightest},${polar_night_darkest}
        face global LineNumberCursor ${snow_storm_dark},${polar_night_darkest}

        face global MenuForeground ${snow_storm_light},${polar_night_lightest}+b
        face global MenuBackground ${snow_storm_dark},${polar_night_dark}
        face global MenuInfo ${frost_light}

        face global Information ${snow_storm_light},${polar_night_light}

        face global Error ${aurora_red},${polar_night_dark}

        face global StatusLine ${snow_storm_dark},${polar_night_dark}
        face global StatusLineMode ${polar_night_darkest},${aurora_green}
        face global StatusLineInfo ${frost_light}
        face global StatusLineValue ${aurora_green}+b
        face global StatusCursor ${polar_night_darkest},${frost_light}

        face global Prompt ${polar_night_darkest},${frost_light}

        face global MatchingChar ${frost_light},${polar_night_darkest}+b

        face global BufferPadding ${polar_night_lightest},${polar_night_darkest}

        face global Whitespace ${polar_night_dark}+f
    "

    # Custom
    echo "
        face global Todo ${aurora_yellow}+fgb
        face global StatusFileName ${aurora_yellow},${polar_night_dark}+b
        face global crosshairs_line ${polar_night_dark}+d
    "
}
