import XMonad
import XMonad.Actions.WindowGo
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.Grid
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig
import XMonad.Util.Run
import System.IO

myWorkspaces =
  [ "1:main"
  , "2"
  , "3"
  , "4"
  , "5"
  , "6"
  , "7"
  , "8:web"
  , "9:gvim"
  ]

myLayout = 
  onWorkspace "8:web" (Full ||| Mirror tiledThird ||| tiledHalf) $
  tiledThird ||| Mirror tiledThird ||| Full ||| Grid 

tiledHalf = Tall nmaster delta ratio
  where
    nmaster = 1
    ratio = 1/2
    delta = 3/100

tiledThird = Tall nmaster delta ratio
  where
    nmaster = 1
    ratio = 2/3
    delta = 3/100

myManageHook = composeAll
  [ className =? "Chromium" --> doShift "8:web"
  , className =? "Gvim" --> doShift "9:gvim"
  ]

myKeys = 
  [ ((mod4Mask, xK_f), runOrRaise "chromium" (className =? "Chromium"))
  , ((mod4Mask .|. shiftMask, xK_f), spawn "chromium --incognito")
  , ((mod4Mask .|. shiftMask, xK_l), spawn "slimlock")
  , ((mod4Mask, xK_n), raiseNext (className =? "URxvt"))
  , ((mod4Mask, xK_g), runOrRaise "gvim" (className =? "Gvim"))
  -- Run or kill alsamixer
  , ((mod4Mask, xK_a), ifWindows (title=? "alsamixer") 
                                 (mapM_ killWindow)
                                 (runInTerm "-title=alsamixer" "alsamixer"))

  ]

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    { modMask = mod4Mask -- Use Super instead of Alt
    , workspaces = myWorkspaces
    , terminal = "urxvt"
    , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ myLayout 
    , logHook = dynamicLogWithPP $ xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "lightblue" "" . shorten 60 
      , ppLayout = const ""
      }
    -- more changes
    }`additionalKeys` myKeys
