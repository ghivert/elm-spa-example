module Main exposing (..)

import Html exposing (Html)
import Html.Attributes
import Navigation exposing (Location)
import Rocket exposing ((=>))
import View
import View.Header
import View.Debug
import Data exposing (..)
import Routing

main : Program Never Model Msg
main =
  Navigation.program (Navigation << NewLocation)
    { init = init
    , update = update
    , view = view
    , subscriptions = always Sub.none
    }

init : Location -> (Model, Cmd Msg)
init location =
  { location = location
  , route = Routing.parseLocation location
  , debugInfos = True
  } ! []

update : Msg -> Model -> (Model, Cmd Msg)
update msg ({ debugInfos } as model) =
  case msg of
    Navigation navigation ->
      handleNavigation model navigation
    ToggleDebugInfos ->
      { model | debugInfos = not debugInfos } ! []

handleNavigation : Model -> SpaNavigation -> (Model, Cmd Msg)
handleNavigation model navigation =
  case navigation of
    NewLocation location ->
      { model
        | location = location
        , route = Routing.parseLocation location
      } ! []
    ReloadHomePage ->
      model ! [ Navigation.newUrl "/" ]
    ChangePage url ->
      model ! [ Navigation.newUrl url ]
    BackPage ->
      model ! [ Navigation.back 1 ]
    ForwardPage ->
      model ! [ Navigation.forward 1 ]

view : Model -> Html Msg
view ({ location, debugInfos } as model) =
  View.body
    [ View.Header.header model
    , View.activePage model
    , debugInfosPanel model
    ]

debugInfosPanel : Model -> Html Msg
debugInfosPanel ({ debugInfos, location, route } as model) =
  Html.div
    [ Html.Attributes.style
      [ "transition" => "max-height .4s"
      , "overflow" => "hidden"
      , "max-height" => if debugInfos then "600px" else "0px"
      ]
    ]
    [ View.Debug.infoPanel model ]
