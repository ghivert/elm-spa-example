module Main exposing (..)

import Html exposing (Html)
import Html.Attributes
import Navigation exposing (Location)
import Rocket exposing ((=>))
import View
import View.Debug
import Data exposing (..)

main : Program Never Model Msg
main =
  Navigation.program (Navigation << NewLocation)
    { init = init
    , update = update
    , view = view
    , subscriptions = always Sub.none
    }

init : Location -> ( Model, Cmd Msg )
init location =
  { location = location
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
      { model | location = location } ! []
    ReloadHomePage ->
      model ! [ Navigation.newUrl "/" ]
    ChangePage url ->
      model ! [ Navigation.newUrl url ]
    BackPage ->
      model ! [ Navigation.back 1 ]
    ForwardPage ->
      model ! [ Navigation.forward 1 ]

view : Model -> Html Msg
view { location, debugInfos } =
  Html.div
    [ Html.Attributes.style
      [ "margin" => "auto"
      , "min-width" => "700px"
      , "max-width" => "1200px"
      , "padding" => "12px"
      ]
    ]
    [ Html.div
      [ Html.Attributes.style
        [ "display" => "flex"
        , "justify-content" => "space-between"
        , "align-items" => "center"
        ]
      ]
      [ View.pagesSelector
      , View.Debug.switch debugInfos
      ]
    , Html.div []
      [ Html.h1 [] [ Html.text "Home Page" ]
      , debugInfosPanel debugInfos location
      ]
    ]

debugInfosPanel : Bool -> Location -> Html Msg
debugInfosPanel debugInfos location =
  if debugInfos then
    View.Debug.infoPanel location
  else
    Html.text ""
