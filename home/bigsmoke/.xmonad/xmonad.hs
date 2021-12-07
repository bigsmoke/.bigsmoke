import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog

-- TODO: Add the below > 0.17.0
--import XMonad.Hooks.StatusBar
--import XMonad.Hooks.StatusBar.PP


-- TODO: Add `$ ewmhFullScreen` before `$ewmh`
main :: IO ()
main = xmonad . ewmh =<< xmobar myConfig

myConfig = def
    { modMask = mod4Mask  -- Rebind Mod to the Super (Windows) key
    , terminal = "alacritty"
    , normalBorderColor = "#444444"
    , focusedBorderColor = "#9c7e65"
    }
   `additionalKeys`
     [ ((mod4Mask, xK_Print), unGrab *> spawn "scrot -s"    )
     , ((mod4Mask, xK_s), spawn "xscreensaver-command -lock")
     ]
