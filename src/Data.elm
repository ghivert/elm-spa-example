module Data exposing (..)

import Navigation exposing (Location)

type SpaNavigation
  = NewLocation Location
  | ReloadHomePage
  | ChangePage String
  | BackPage
  | ForwardPage

type Route
  = Films
  | Film Int
  | Vehicles
  | Vehicle Int
  | Settings
  | NotFound

type Msg
  = Navigation SpaNavigation
  | ToggleDebugInfos

type alias Model =
  { location : Location
  , route : Route
  , debugInfos : Bool
  }
