module Data exposing (..)

import Navigation exposing (Location)

type SpaNavigation
  = NewLocation Location
  | ReloadHomePage
  | ChangePage String
  | BackPage
  | ForwardPage

type Msg
  = Navigation SpaNavigation
  | ToggleDebugInfos

type alias Model =
  { location : Location
  , debugInfos : Bool
  }
