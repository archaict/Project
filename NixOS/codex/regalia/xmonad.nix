{ config, pkgs, lib, ... }:

{
    xsession.windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = pkgs.writeText "xmonad.hs" ''



    -- ┌──────────────────────────────────────────────────────────┐ --
    -- │                        ✖ import ✖                        │ --
    -- └──────────────────────────────────────────────────────────┘ --
          -- Base
        import XMonad
        import System.Directory
        import System.IO (hPutStrLn)
        import System.Exit (exitSuccess)
        import qualified XMonad.StackSet as W

            -- Actions
        import XMonad.Actions.CopyWindow (kill1, killAllOtherCopies)
        import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
        import XMonad.Actions.MouseResize
        import XMonad.Actions.Promote
        import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
        import qualified XMonad.Actions.TreeSelect as TS
        import XMonad.Actions.WindowGo (runOrRaise)
        import XMonad.Actions.WithAll (sinkAll, killAll)
        import qualified XMonad.Actions.Search as S

            -- Data
        import Data.Char (isSpace, toUpper)
        import Data.Monoid
        import Data.Maybe (isJust)
        import Data.Tree
        import qualified Data.Map as M

            -- Hooks
        import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
        import XMonad.Hooks.EwmhDesktops
        import XMonad.Hooks.FadeInactive
        import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
        import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
        import XMonad.Hooks.ServerMode
        import XMonad.Hooks.SetWMName
        import XMonad.Hooks.WorkspaceHistory

            -- Layouts
        import XMonad.Layout.SimplestFloat
        import XMonad.Layout.Spiral
        import XMonad.Layout.ResizableTile
        import XMonad.Layout.Tabbed
        import XMonad.Layout.ThreeColumns

            -- Layouts modifiers
        import XMonad.Layout.LayoutModifier
        import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
        import XMonad.Layout.Magnifier
        import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
        import XMonad.Layout.Renamed
        import XMonad.Layout.ShowWName
        import XMonad.Layout.Simplest
        import XMonad.Layout.Spacing
        import XMonad.Layout.SubLayouts
        import XMonad.Layout.WindowNavigation
        import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
        import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
        import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

            -- Prompt
        import XMonad.Prompt
        import XMonad.Prompt.Input
        import XMonad.Prompt.FuzzyMatch
        import XMonad.Prompt.Shell
        import XMonad.Prompt.XMonad
        import Control.Arrow (first)

           -- Text
        import Text.Printf

           -- Utilities
        import XMonad.Util.EZConfig (additionalKeysP)
        import XMonad.Util.NamedScratchpad
        import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
        import XMonad.Util.SpawnOnce

   --  ┌──────────────────────────────────────────────────────────┐ --
   --  │                        ✖ config ✖                        │ --
   --  └──────────────────────────────────────────────────────────┘ --

        myFont        = "xft: Iosevka Bold:regular:size=11:antialias=true:hinting=true"

        myTerminal    = "kitty"
        myBrowser     = "firefox "
        myEditor      = myTerminal ++ " -e vim "

        myBorderWidth = 0         -- BORDER --
        altMask       = mod1Mask
        myModMask     = mod4Mask
        myFocusColor  = "${config.colors.yellow}"
        myNormColor   = "${config.colors.background}"

   --  ┌──────────────────────────────────────────────────────────┐ --
   --  │                         ✖ exes ✖                         │ --
   --  └──────────────────────────────────────────────────────────┘ --


        windowCount :: X (Maybe String)
        windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

        myStartupHook :: X ()
        myStartupHook = do
                  spawnOnce "nitrogen --restore &"
                  spawnOnce "polybar -r top &"
                  spawnOnce "pkill picom && pkill picom && picom -b"
                  setWMName "LG3D"

        main :: IO ()
        main = do
            home <- getHomeDirectory
            xmonad $ ewmh def
                { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageDocks
                , handleEventHook    = serverModeEventHookCmd
                                       <+> serverModeEventHook
                                       <+> serverModeEventHookF "XMONAD_PRINT" (io . putStrLn)
                                       <+> docksEventHook
                , modMask            = myModMask
                , terminal           = myTerminal
                , startupHook        = myStartupHook
                , layoutHook         = showWName' myShowWNameTheme $ myLayoutHook
                , workspaces         = myWorkspaces
                , borderWidth        = myBorderWidth
                , normalBorderColor  = myNormColor
                , focusedBorderColor = myFocusColor
                } `additionalKeysP` myKeys home

   --  ┌──────────────────────────────────────────────────────────┐ --
   --  │                        ✖ prompt ✖                        │ --
   --  └──────────────────────────────────────────────────────────┘ --

        arcXPConfig :: XPConfig
        arcXPConfig = def
              { font                = myFont
              , bgColor             = "${config.colors.background}"
              , fgColor             = "${config.colors.foreground}"
              , bgHLight            = "${config.colors.foreground}"
              , fgHLight            = "${config.colors.background}"
              , borderColor         = "${config.colors.background}"
              , promptBorderWidth   = 0
              , promptKeymap        = arcXPKeymap
              , position            = Top
              , historySize         = 256
              , historyFilter       = id
              , defaultText         = []
              , autoComplete        = Just 100000
              , showCompletionOnTab = False
              , searchPredicate     = fuzzyMatch
              , defaultPrompter     = id $ map toUpper
              , alwaysHighlight     = True
              , maxComplRows        = Just 5
              }

        arcXPKeymap :: M.Map (KeyMask,KeySym) (XP ())
        arcXPKeymap = M.fromList $
             map (first $ (,) controlMask)      -- control + <key>
             [ (xK_z, killBefore)               -- kill line backwards
             , (xK_k, killAfter)                -- kill line forwards
             , (xK_a, startOfLine)              -- move to the beginning of the line
             , (xK_e, endOfLine)                -- move to the end of the line
             , (xK_m, deleteString Next)        -- delete a character foward
             , (xK_b, moveCursor Prev)          -- move cursor forward
             , (xK_f, moveCursor Next)          -- move cursor backward
             , (xK_BackSpace, killWord Prev)    -- kill the previous word
             , (xK_y, pasteString)              -- paste a string
             , (xK_g, quit)                     -- quit out of prompt
             , (xK_bracketleft, quit)
             ]
             ++
             map (first $ (,) altMask)          -- meta key + <key>
             [ (xK_BackSpace, killWord Prev)    -- kill the prev word
             , (xK_f, moveWord Next)            -- move a word forward
             , (xK_b, moveWord Prev)            -- move a word backward
             , (xK_d, killWord Next)            -- kill the next word
             , (xK_n, moveHistory W.focusUp')   -- move up thru history
             , (xK_p, moveHistory W.focusDown') -- move down thru history
             ]
             ++
             map (first $ (,) 0) -- <key>
             [ (xK_Return, setSuccess True >> setDone True)
             , (xK_KP_Enter, setSuccess True >> setDone True)
             , (xK_BackSpace, deleteString Prev)
             , (xK_Delete, deleteString Next)
             , (xK_Left, moveCursor Prev)
             , (xK_Right, moveCursor Next)
             , (xK_Home, startOfLine)
             , (xK_End, endOfLine)
             , (xK_Down, moveHistory W.focusUp')
             , (xK_Up, moveHistory W.focusDown')
             , (xK_Escape, quit)
             ]

   --  ┌──────────────────────────────────────────────────────────┐ --
   --  │                        ✖ layout ✖                        │ --
   --  └──────────────────────────────────────────────────────────┘ --

        mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
        mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

        tall     = renamed [Replace "tall"]
                   $ windowNavigation
                   $ limitWindows 12
                   $ mySpacing 4
                   $ ResizableTall 1 (1/8) (1/2) []
        monocle  = renamed [Replace "monocle"]
                   $ windowNavigation
                   $ addTabs shrinkText myTabTheme
                   $ limitWindows 20 Full

        myTabTheme = def { fontName            = myFont
                         , activeColor         = "${config.colors.foreground}"
                         , inactiveColor       = "${config.colors.background}"
                         , activeBorderColor   = "${config.colors.foreground}"
                         , inactiveBorderColor = "${config.colors.background}"
                         , activeTextColor     = "${config.colors.background}"
                         , inactiveTextColor   = "${config.colors.foreground}"
                         }

        myShowWNameTheme :: SWNConfig
        myShowWNameTheme = def
            { swn_font              = "xft:Iosevka:bold:size=40"
            , swn_fade              = 0.4
            , swn_bgcolor           = "${config.colors.background}"
            , swn_color             = "${config.colors.foreground}"
            }

        myLayoutHook = avoidStruts $ mouseResize $ windowArrange
                       $ myDefaultLayout
                     where
                       myDefaultLayout =     tall
                                         ||| monocle

        myWorkspaces = ["01", "02", "03", "04"]

        xmobarEscape :: String -> String
        xmobarEscape = concatMap doubleLts
          where
                doubleLts '<' = "<<"
                doubleLts x   = [x]

        myClickableWorkspaces :: [String]
        myClickableWorkspaces = clickable . (map xmobarEscape)
                       $ ["01", "02", "03", "04"]
                        where
                clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                              (i,ws) <- zip [1..4] l,
                              let n = i ]

        myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
        myManageHook = composeAll
             [ className =? "Mozilla Firefox"                     --> doShift ( myWorkspaces !! 1 )
             , className =? "VirtualBox Manager"                  --> doShift ( myWorkspaces !! 3 )
             , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
             ]

        myLogHook :: X ()
        myLogHook = fadeInactiveLogHook fadeAmount
            where fadeAmount = 1.0

   --  ┌──────────────────────────────────────────────────────────┐ --
   --  │                       ✖ bindings ✖                       │ --
   --  └──────────────────────────────────────────────────────────┘ --

        -- KeyBindings
        myKeys :: String -> [([Char], X ())]
        myKeys home =
            -- Xmonad
                [ ("M-C-r", spawn "xmonad --recompile")
                , ("M-S-r", spawn "xmonad --restart")
                , ("M-S-q", io exitSuccess)

            -- Run Prompt
                , ("M-<Space>" , shellPrompt arcXPConfig) -- Xmonad Shell Prompt

            -- Programs
                , ("M-<Return>" , spawn "kitty --single-instance")
                , ("M-e"        , spawn "mpv $(xclip -out -selection clipboard")
                , ("M-c"        , spawn "firefox https://web.whatsapp.com")
                , ("M-i"        , spawn "firefox")
                , ("M-o"        , spawn "kitty --session .config/kitty/kitten.conf")
                , ("M-9"        , spawn "polybar -r top &")
                , ("M-0"        , spawn "pkill polybar")
                , ("M-8"        , spawn "scrot")

            -- Kill windows
                , ("M-w" , kill1)       -- Kill the currently focused client

            -- Workspaces
                , ("M-a" , windows  (W.greedyView "01"))
                , ("M-s" , windows  (W.greedyView "02"))
                , ("M-d" , windows  (W.greedyView "03"))
                , ("M-p" , windows  (W.greedyView "04"))

                , ("M-S-a" , windows  (W.shift "01"))
                , ("M-S-s" , windows  (W.shift "02"))
                , ("M-S-d" , windows  (W.shift "03"))
                , ("M-S-p" , windows  (W.shift "04"))


            -- Floating windows
                , ("M-S-f" , sendMessage (T.Toggle "floats")) -- Toggles my 'floats' layout
                , ("M-t"   , withFocused $ windows . W.sink)  -- Push floating window back to tile
                , ("M-S-t" , sinkAll)                         -- Push ALL floating windows to tile

           -- Increase/decrease spacing (gaps)
             --, ("M-<Up>"    ,     decWindowSpacing 4)       -- Decrease window spacing
             --, ("M-<Down>"  ,   incWindowSpacing 4)         -- Increase window spacing
             --, ("M-S-<Up>"  ,   decScreenSpacing 4)         -- Decrease screen spacing
             --, ("M-S-<Down>", incScreenSpacing 4)           -- Increase screen spacing

            -- Windows navigation
                , ("M-m"           , windows W.focusMaster)   -- Move focus to the master window
                , ("M-j"           , windows W.focusDown)     -- Move focus to the next window
                , ("M-k"           , windows W.focusUp)       -- Move focus to the prev window
                , ("M-S-m"         , windows W.swapMaster)    -- Swap the focused window and the master window
                , ("M-S-j"         , windows W.swapDown)      -- Swap focused window with next window
                , ("M-S-k"         , windows W.swapUp)        -- Swap focused window with prev window
                , ("M-<Backspace>" , promote)                 -- Moves focused window to master
                , ("M-S-<Tab>"     , rotSlavesDown)           -- Rotate all windows except master
                , ("M-C-<Tab>"     , rotAllDown)              -- Rotate all the windows

            -- Layouts
                , ("M-f", sendMessage NextLayout)             -- Switch to next layout

            -- Window resizing
                , ("M-h"    , sendMessage Shrink)             -- Shrink horiz window width
                , ("M-l"    , sendMessage Expand)             -- Expand horiz window width

                , ("M-M1-h" , sendMessage Shrink)             -- Shrink horiz window width
                , ("M-M1-l" , sendMessage Expand)             -- Expand horiz window width
                , ("M-M1-j" , sendMessage MirrorShrink)       -- Shrink vert window width
                , ("M-M1-k" , sendMessage MirrorExpand)       -- Exoand vert window width

            -- Multimedia Keys
                , ("<XF86MonBrightnessUp>"   , spawn "light -A 1")
                , ("<XF86MonBrightnessDown>" , spawn "light -U 1")

                , ("M-<XF86AudioMute>"        , spawn (myTerminal ++ "mpc toggle"))
                , ("M-<XF86AudioLowerVolume>" , spawn (myTerminal ++ "mpc prev"))
                , ("M-<XF86AudioRaiseVolume>" , spawn (myTerminal ++ "mpc next"))

                , ("<XF86AudioMute>"          , spawn "pactl set-sink-mute 0 toggle")
                , ("<XF86AudioLowerVolume>"   , spawn "pactl set-sink-volume 0 -5%")
                , ("<XF86AudioRaiseVolume>"   , spawn "pactl set-sink-volume 0 +5%")

                , ("<Print>", spawn "scrotd 0")

                ]

        '';
      };
    };
 }
