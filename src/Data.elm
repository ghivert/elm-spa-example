module Data exposing (..)

import Navigation exposing (Location)
import RouteParser.QueryString as Queries
import Params exposing (Params, toParams)

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

setRouteParams : RouteParams -> Model -> Model
setRouteParams { route, params } model =
  model
    |> setRoute route
    |> setParams params

ensureCorrectParams : RouteParams -> Location -> Model -> Model
ensureCorrectParams { route, params } { search } model =
  case route of
    NotFound ->
      search
        |> Queries.parse
        |> toParams
        |> asParamsIn model
    _ ->
      model
