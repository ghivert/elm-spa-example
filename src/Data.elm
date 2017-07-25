module Data exposing (..)

import Navigation exposing (Location)

type SpaNavigation
  = NewLocation Location
  | ReloadHomePage
  | ChangePage String
  | BackPage
  | ForwardPage

type alias Params =
  { page : Maybe Int
  , color : Maybe String
  }

type Route
  = Films
  | Film Int
  | Vehicles
  | Vehicle Int
  | Settings
  | NotFound

type alias RouteParams =
  { route : Route
  , params : Params
  }

type Msg
  = Navigation SpaNavigation
  | ToggleDebugInfos

type alias Model =
  { location : Location
  , route : Route
  , params : Params
  , debugInfos : Bool
  }
