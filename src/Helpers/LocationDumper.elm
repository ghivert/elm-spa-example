module Helpers.LocationDumper exposing (dump)

import Html exposing (Html)
import Html.Attributes
import Navigation exposing (Location)
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

dump : Location -> Html msg
dump location =
  Html.div
    [ Html.Attributes.style
      [ "white-space" => "pre"
      , "font-family" => "monospace"
      ]
    ]
    [ colorText "#C376DA" "type alias "
    , colorText "#D19A66" "Location =\n"
    , colorText "#C376DA" "  { "

    , colorText "#5DA6E2" "href "
    , colorText "#C376DA" ":"
    , colorText "#98C379" (" \"" ++ location.href ++ "\"\n")

    , dumpField "host"     location.host
    , dumpField "hostname" location.hostname
    , dumpField "protocol" location.protocol
    , dumpField "origin"   location.origin
    , dumpField "port_"    location.port_
    , dumpField "pathname" location.pathname
    , dumpField "search"   location.search
    , dumpField "hash"     location.hash

    , colorText "#C376DA" "  }"
    ]
