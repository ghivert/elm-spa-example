module Helpers.RouteDumper exposing (..)

import Html exposing (Html)
import Html.Attributes
import Data exposing (Route(..))
import Rocket exposing ((=>))

colorText : String -> String -> Html msg
colorText color_ text_ =
  Html.span
    [ Html.Attributes.style
      [ "color" => color_ ]
    ]
    [ Html.text text_ ]

dumpField : String -> String -> Html msg
dumpField name field =
  Html.div []
    [ colorText "#C376DA" "  , "
    , colorText "#5DA6E2" (name ++ " ")
    , colorText "#C376DA" ":"
    , colorText "#98C379" (" \"" ++ field ++ "\"\n")
    ]

dump : Route -> Html msg
dump route =
  Html.div
    [ Html.Attributes.style
      [ "white-space" => "pre"
      , "font-family" => "monospace"
      ]
    ]
    [ colorText "#C376DA" "type "
    , colorText "#D19A66" "Route =\n"
    , colorText "#C376DA" "  "
    , routeToString route
    ]

routeToString : Route -> Html msg
routeToString route =
  case route of
    Films ->
      colorText "#D19A66" "Films"
    Film id ->
      Html.div []
        [ colorText "#D19A66" "Film"
        , colorText "#D19A66" (toString id)
        ]
    Vehicles ->
      colorText "#D19A66" "Vehicles"
    Vehicle id ->
      Html.div []
        [ colorText "#D19A66" "Film"
        , colorText "#D19A66" (toString id)
        ]
    Settings ->
      colorText "#D19A66" "Settings"
    NotFound ->
      colorText "#D19A66" "NotFountd"
