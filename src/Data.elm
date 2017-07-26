module Data exposing (..)

import Navigation exposing (Location)
import Params exposing (Params)

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
  , params : Params
  , debugInfos : Bool
  }

setLocation : Location -> Model -> Model
setLocation location model =
  { model | location = location }

setRoute : Route -> Model -> Model
setRoute route model =
  { model | route = route }

setParams : Params -> Model -> Model
setParams params model =
  { model | params = params }

asParamsIn : Model -> Params -> Model
asParamsIn model params =
  { model | params = params }
