import XMonad hiding ((|||))
-- import XMonad

import XMonad.Config.Xfce
import XMonad.Config.Kde
import XMonad.Config.Bluetile
import XMonad.Config.Gnome

import XMonad.Layout.BorderResize
import XMonad.Layout.BoringWindows
import XMonad.Layout.ButtonDecoration
import XMonad.Layout.ImageButtonDecoration
import XMonad.Layout.Decoration
import XMonad.Layout.DecorationAddons
import XMonad.Layout.DraggingVisualizer
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PositionStoreFloat
import XMonad.Layout.WindowSwitcherDecoration
import XMonad.Layout.ResizeScreen
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns

import XMonad.Actions.BluetileCommands
import XMonad.Actions.CycleWS
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


myXterm = "xterm -fa Menlo -fs 12.4"

myHandleEventHook = minimizeEventHook

bluetileLayoutHook = avoidStruts $ minimize $ boringWindows $ (
    named "Fullscreen" fullscreen |||
    named "Tiled1" tiled1 |||
    named "Tiled2" tiled2 |||
    named "Floating" floating
    )
-- where
fullscreen =  maximize $ resizeVerticalBottom (-4) (noBorders  Full)
tiled1 =  tilingDeco $ maximize $ mouseResizableTile { draggerType=BordersDragger } 

tiled2 = tilingDeco $ maximize $ mouseResizableTileMirrored { draggerType=BordersDragger } 
floating =  floatingDeco $ maximize $ borderResize $ positionStoreFloat

tilingDeco l = windowSwitcherDecorationWithImageButtons shrinkText defaultThemeWithImageButtons (draggingVisualizer l)
floatingDeco l = buttonDeco shrinkText defaultThemeWithButtons l

-- floating = floatingDeco $ maximize $ borderResize $ positionStoreFloat
-- tiled1 = tilingDeco $ maximize $ mouseResizableTileMirrored
-- tiled2 = tilingDeco $ maximize $ mouseResizableTile
-- fullscreen = tilingDeco $ maximize $ smartBorders Full
-- 
-- tilingDeco l = windowSwitcherDecorationWithButtons shrinkText defaultThemeWithButtons (draggingVisualizer l)
-- floatingDeco l = buttonDeco shrinkText defaultThemeWithButtons l
--

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

baseConfig = xfceConfig

myConfig = baseConfig { 
  manageHook = manageDocks <+> manageHook baseConfig,
  handleEventHook = myHandleEventHook <+> handleEventHook baseConfig,
  layoutHook = bluetileLayoutHook,
  focusedBorderColor= "#00ff00",
  workspaces = myWorkspaces, 
  terminal = myXterm
} `additionalKeys` myKeys

myKeys = 
    [
    -- other additional keys
    ]
    ++
    [
      ((m .|. mod1Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
      | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
      , (f, m) <- [(W.view, 0), (W.shift,
          shiftMask)]
    ]


main = xmonad myConfig
