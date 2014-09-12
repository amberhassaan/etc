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


myXterm = "xterm -fa Menlo -fs 13"

myHandleEventHook = minimizeEventHook

bluetileLayoutHook = avoidStruts $ minimize $ boringWindows $ (
    named "Fullscreen" fullscreen |||
    named "MyTwoPane" myTwoPane |||
    named "MyTwoPaneMirrored" myTwoPaneMirrored |||
    named "FlexColumn" flexColumn |||
    named "FlexRow" flexRow |||
    named "SingleRow" singleRow |||
    named "SingleColumn" singleColumn |||
    named "MyGrid" myGrid
    )
-- where
fullscreen =  maximize $ resizeVerticalBottom (-4) (noBorders  Full)
myTwoPane = tilingDeco $ maximize $ TwoPane (3/100) (1/2)
myTwoPaneMirrored = tilingDeco $ maximize $ Mirror $ TwoPane (3/100) (1/2)
flexColumn =  tilingDeco $ maximize $ mouseResizableTile { draggerType=BordersDragger } 
flexRow = tilingDeco $ maximize $ mouseResizableTileMirrored { draggerType=BordersDragger }
singleRow = tilingDeco $ maximize $ zoomRow
singleColumn = tilingDeco $ maximize $ Column (1.0)
myGrid = tilingDeco $ maximize $ Grid


tilingDeco l = windowSwitcherDecorationWithImageButtons shrinkText defaultThemeWithImageButtons (draggingVisualizer l)
-- tilingDeco l = noFrillsDeco shrinkText defaultThemeWithButtons (draggingVisualizer l)

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

-- myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
--     [
--     -- other additional keys
--       -- ((modm, xK_s), cycleRecentWindows [xK_Alt_L] xK_s xK_d)
--       ((mod1Mask, xK_Tab), cycleRecentWindows [xK_Alt_L] xK_Tab xK_Tab)
--     ]
-- 
baseConfig = xfceConfig

myConfig = baseConfig { 
  manageHook = manageDocks <+> manageHook baseConfig,
  handleEventHook = myHandleEventHook <+> handleEventHook baseConfig,
  -- keys = myKeys <+> keys baseConfig,
  layoutHook = bluetileLayoutHook,
  focusedBorderColor= "#00ff00",
  workspaces = myWorkspaces, 
  terminal = myXterm
} `additionalKeys` myKeys

myKeys = 
    [
    -- other additional keys
      ((mod1Mask, xK_Tab), cycleRecentWindows [xK_Alt_L, xK_Alt_R] xK_Tab xK_Tab)
    ]
    -- ++
    -- [
    --   ((m .|. mod1Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
    --   | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
    --   , (f, m) <- [(W.view, 0), (W.shift,
    --       shiftMask)]
    -- ]


main = xmonad myConfig
