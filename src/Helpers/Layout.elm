module Helpers.Layout exposing (..)

import Html exposing (Html)
import Html.Attributes
import Rocket exposing ((=>))

flex : List (Html msg) -> Html msg
flex =
  Html.div
    [ Html.Attributes.style
      [ "flex" => "1"
      , "display" => "flex"
      ]
    ]

flexCenter : List (Html msg) -> Html msg
flexCenter =
  Html.div
    [ Html.Attributes.style
      [ "display" => "flex"
      , "justify-content" => "center"
      , "align-items" => "center"
      , "flex" => "1"
      ]
    ]
