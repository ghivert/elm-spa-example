module Helpers.ParamsDumper exposing (..)

import Html exposing (Html)
import Html.Attributes
import Rocket exposing ((=>))
import Params exposing (Params)

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

dump : Params -> Html msg
dump params =
  Html.div
    [ Html.Attributes.style
      [ "white-space" => "pre"
      , "font-family" => "monospace"
      ]
    ]
    [ colorText "#C376DA" "type alias "
    , colorText "#D19A66" "Params =\n"
    , colorText "#C376DA" "  { "

    , colorText "#5DA6E2" "page "
    , colorText "#C376DA" ":"
    , colorText "#98C379" (" \"" ++ toString params.page ++ "\"\n")

    , dumpField "color" (toString params.color)

    , colorText "#C376DA" "  }"
    ]
