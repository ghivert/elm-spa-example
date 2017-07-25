module View.Debug exposing (..)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Navigation exposing (Location)
import Rocket exposing ((=>))
import Data exposing (..)
import Helpers.LocationDumper

infoPanel : Location -> Html Msg
infoPanel location =
  Html.div
    [ Html.Attributes.style
      [ "border" => "1px solid #dadada"
      , "padding" => "0 24px 24px 24px"
      , "box-sizing" => "border-box"
      ]
    ]
    [ Html.h1 [] [ Html.text "Debug infos" ]
    , Html.details [ Html.Attributes.attribute "open" "" ]
      [ Html.summary
        [ Html.Attributes.style
          [ "outline" => "none"
          , "cursor" => "pointer"
          , "font-size" => "1.5em"
          , "font-weight" => "bold"
          , "padding-bottom" => "12px"
          ]
        ]
        [ Html.text "Location object" ]
      , Html.div
        [ Html.Attributes.style
          [ "background-color" => "#f8f8f8"
          , "padding" => "24px"
          ]
        ]
        [ Helpers.LocationDumper.dump location ]
      ]
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
