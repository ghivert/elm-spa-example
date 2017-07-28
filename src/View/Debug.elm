module View.Debug exposing (..)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Rocket exposing ((=>))
import Data exposing (..)
import Params exposing (Params)
import Navigation exposing (Location)
import Data.Dumper as Dumper

infoRoute : Route -> Html msg
infoRoute route =
  Html.div []
    [ Html.text <| toString route ]

infoPanel : Model -> Html Msg
infoPanel { location, route, params } =
  Html.div
    [ Html.Attributes.style
      [ "border" => "1px solid #dadada"
      , "padding" => "0 24px 24px 24px"
      , "box-sizing" => "border-box"
      ]
    ]
    [ Html.h1 [] [ Html.text "Debug infos" ]
    , debugSection "Location object" <| dumpLocation location
    , debugSection "Route object" <| dumpRoute route
    , debugSection "Params object" <| dumpParams params
    ]

debugSection : String -> Html msg -> Html msg
debugSection label content =
  Html.details
    [ Html.Attributes.attribute "open" ""
    , Html.Attributes.style
      [ "padding-top" => "12px" ]
    ]
    [ Html.summary
      [ Html.Attributes.style
        [ "outline" => "none"
        , "cursor" => "pointer"
        , "font-size" => "1.5em"
        , "font-weight" => "bold"
        , "padding-bottom" => "12px"
        ]
      ]
      [ Html.text label ]
    , content
    ]

switch : Bool -> Html Msg
switch debugInfos =
  Html.div
    [ Html.Attributes.style
      [ "display" => "flex"
      , "width" => "240px"
      , "height" => "34px"
      , "align-items" => "center"
      ]
    ]
    [ Html.div
      [ Html.Attributes.style
        [ "flex" => "3"
        , "font-weight" => "300"
        , "white-space" => "nowrap"
        ]
      ]
      [ Html.text "Toggle Debug Infos" ]
    , Html.div
      [ Html.Attributes.style
        [ "background-color" => if debugInfos then "#0096FB" else "#cccccc"
        , "width" => "60px"
        , "height" => "34px"
        , "border-radius" => "50px"
        , "position" => "relative"
        , "cursor" => "pointer"
        , "flex" => "1"
        ]
      , Html.Events.onClick ToggleDebugInfos
      ]
      [ Html.div
        [ Html.Attributes.style
          [ "box-sizing" => "border-box"
          , "background-color" => "#ffffff"
          , "width" => "26px"
          , "height" => "26px"
          , "border-radius" => "50px"
          , "position" => "absolute"
          , "top" => "4px"
          , "left" => "4px"
          , "transition" => ".4s"
          , "transform" => if debugInfos then "translateX(26px)" else ""
          ]
        ]
        []
      ]
    ]


-- Dumpers
dumpLocation : Location -> Html msg
dumpLocation =
  Dumper.dumpRecord "Location"
    [ "href"     => .href     >> Dumper.dumpString
    , "host"     => .host     >> Dumper.dumpString
    , "hostname" => .hostname >> Dumper.dumpString
    , "protocol" => .protocol >> Dumper.dumpString
    , "origin"   => .origin   >> Dumper.dumpString
    , "port_"    => .port_    >> Dumper.dumpString
    , "pathname" => .pathname >> Dumper.dumpString
    , "search"   => .search   >> Dumper.dumpString
    , "hash"     => .hash     >> Dumper.dumpString
    ]

dumpParams : Params -> Html msg
dumpParams =
  Dumper.dumpRecord "Params"
    [ "page " => .page  >> Dumper.dumpMaybe Dumper.dumpInt
    , "color" => .color >> Dumper.dumpMaybe Dumper.dumpColor
    ]

dumpRoute : Route -> Html msg
dumpRoute =
  Dumper.dumpUnion "Route" <<
    routeDumper

routeDumper : Route -> (String, Html msg)
routeDumper route =
  case route of
    Films ->
      "Films" => Html.text ""
    Film id ->
      "Film" => Dumper.dumpInt id
    Vehicles ->
      "Vehicles" => Html.text ""
    Vehicle id ->
      "Vehicle" => Dumper.dumpInt id
    Settings ->
      "Settings" => Html.text ""
    NotFound ->
      "NotFound" => Html.text ""
