import XMonad hiding ((|||))
-- import XMonad

import XMonad.Config.Xfce
import XMonad.Config.Kde
import XMonad.Config.Bluetile
import XMonad.Config.Gnome

import XMonad.Layout.BorderResize
import XMonad.Layout.BoringWindows
import XMonad.Layout.ButtonDecoration
import XMonad.Layout.Column
import XMonad.Layout.Decoration
import XMonad.Layout.DecorationAddons
import XMonad.Layout.DraggingVisualizer
import XMonad.Layout.Grid
import XMonad.Layout.ImageButtonDecoration
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.PositionStoreFloat
import XMonad.Layout.ResizeScreen
import XMonad.Layout.TwoPane
import XMonad.Layout.WindowSwitcherDecoration
import XMonad.Layout.ZoomRow

import XMonad.Actions.BluetileCommands
import XMonad.Actions.CycleWS
import XMonad.Actions.RotSlaves
import XMonad.Actions.CycleWindows
import XMonad.Actions.WindowMenu

import XMonad.Hooks.CurrentWorkspaceOnTop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.PositionStoreHooks
import XMonad.Hooks.Minimize
import XMonad.Hooks.ServerMode
import XMonad.Hooks.WorkspaceByPos

import XMonad.Util.EZConfig


import qualified XMonad.StackSet as W
import qualified Data.Map as M

import System.Exit
import Data.Monoid
import Control.Monad(when)

-- myConfig = kdeConfig
myConfig = xfceConfig

main = xmonad myConfig
    { modMask = mod1Mask -- use the TAB button as mod
    , manageHook = manageHook myConfig <+> myManageHook
    , terminal = myXterm
    , focusedBorderColor= "#00ff00"

    }

myManageHook = composeAll . concat $
    [ [ className   =? c --> doFloat           | c <- myFloats]
    , [ title       =? t --> doFloat           | t <- myOtherFloats]
    , [ className   =? c --> doF (W.shift "2") | c <- webApps]
    , [ className   =? c --> doF (W.shift "3") | c <- ircApps]
    ]
  where myFloats      = ["MPlayer", "Gimp", "yakuake", "systemsettings", "plasmashell", "Plasma", 
                         "krunner", "Kmix", "Klipper", "Plasmoidviewer", "zoom", 
                          "wrapper-2.0", "xfce", "xfrun4"]
        myOtherFloats = ["alsamixer", "plasma-desktop", "win7"]
        webApps       = ["Firefox-bin", "Opera"] -- open on desktop 2
        ircApps       = ["Ksirc"]                -- open on desktop 3

-- myXterm = "xterm -fa 'Fantasque Sans Mono' -fs 13.3"
myXterm = "konsole"

-- myHandleEventHook = minimizeEventHook

-- bluetileLayoutHook = avoidStruts $ minimize $ boringWindows $ (
--     named "Fullscreen" fullscreen |||
--     named "MyTwoPane" myTwoPane |||
--     named "MyTwoPaneMirrored" myTwoPaneMirrored |||
--     named "FlexColumn" flexColumn |||
--     named "FlexRow" flexRow |||
--     named "SingleRow" singleRow |||
--     named "SingleColumn" singleColumn |||
--     named "MyGrid" myGrid
--     )
-- where
-- fullscreen =  maximize $ resizeVerticalBottom (-4) (noBorders  Full)
-- myTwoPane = tilingDeco $ maximize $ TwoPane (3/100) (1/2)
-- myTwoPaneMirrored = tilingDeco $ maximize $ Mirror $ TwoPane (3/100) (1/2)
-- flexColumn =  tilingDeco $ maximize $ mouseResizableTile { draggerType=BordersDragger } 
-- flexRow = tilingDeco $ maximize $ mouseResizableTileMirrored { draggerType=BordersDragger }
-- singleRow = tilingDeco $ maximize $ zoomRow
-- singleColumn = tilingDeco $ maximize $ Column (1.0)
-- myGrid = tilingDeco $ maximize $ Grid


-- tilingDeco l = windowSwitcherDecorationWithImageButtons shrinkText defaultThemeWithImageButtons (draggingVisualizer l)
-- tilingDeco l = noFrillsDeco shrinkText defaultThemeWithButtons (draggingVisualizer l)

-- myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

-- myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
--     [
--     -- other additional keys
--       -- ((modm, xK_s), cycleRecentWindows [xK_Alt_L] xK_s xK_d)
--       ((mod1Mask, xK_Tab), cycleRecentWindows [xK_Alt_L] xK_Tab xK_Tab)
--     ]
-- 


-- baseConfig = xfceConfig
-- baseConfig = def
-- 
-- myConfig = baseConfig { 
--   manageHook = manageDocks <+> manageHook baseConfig,
--   handleEventHook = myHandleEventHook <+> handleEventHook baseConfig,
--   -- keys = myKeys <+> keys baseConfig,
--   -- layoutHook = bluetileLayoutHook,
--   focusedBorderColor= "#00ff00",
--   workspaces = myWorkspaces, 
--   terminal = myXterm
-- } `additionalKeys` myKeys

-- myKeys = 
   -- [
    -- other additional keys
    --  ((mod1Mask, xK_Tab), cycleRecentWindows [xK_Alt_L, xK_Alt_R] xK_Tab xK_Tab)
    --]
    -- ++
    -- [
    --   ((m .|. mod1Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
    --   | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
    --   , (f, m) <- [(W.view, 0), (W.shift,
    --       shiftMask)]
    -- ]


-- main = xmonad myConfig
