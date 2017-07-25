module View exposing (body, activePage)

import Html exposing (..)
import Html.Attributes
import Rocket exposing ((=>))
import Data exposing (..)

body : List (Html Msg) -> Html Msg
body =
  Html.div
    [ Html.Attributes.style
      [ "margin" => "auto"
      , "min-width" => "700px"
      , "max-width" => "1200px"
      , "padding" => "24px"
      ]
    ]

activePage : Model -> Html Msg
activePage ({ route } as model) =
  case route of
    Films ->
      notFound
    Film id ->
      notFound
    Vehicles ->
      notFound
    Vehicle id ->
      notFound
    Settings ->
      notFound
    NotFound ->
      notFound

notFound : Html Msg
notFound =
  Html.div []
    [ Html.h1 []
      [ Html.text "Home Page" ]
    ]
