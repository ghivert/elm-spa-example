module View exposing (..)

import Html exposing (..)
import Html.Attributes
import Html.Events
import Color exposing (Color)
import Rocket exposing ((=>))
import Data exposing (..)
import FontAwesome as Icons

flex : List (Html Msg) -> Html Msg
flex =
  Html.div
    [ Html.Attributes.style
      [ "display" => "flex"
      , "justify-content" => "center"
      , "align-items" => "center"
      , "flex" => "1"
      ]
    ]

button : List (Html.Attribute msg) -> List (Html msg) -> Html msg
button attributes content =
  Html.div
    []
    [ Html.button
      (List.append attributes
        [ Html.Attributes.style
          [ "padding" => "12px"
          , "cursor" => "pointer"
          , "border" => "1px solid #aaaaaa"
          , "font-size" => "14px"
          , "margin" => "0 12px"
          , "box-sizing" => "border-box"
          , "border-radius" => "6px"
          , "background-color" => "#fcfcfc"
          ]
        ])
      content
    ]

arrowSize : Int
arrowSize =
  38

pagesSelector : Html Msg
pagesSelector =
  flex <|
    List.map (Html.map Navigation)
      [ Html.div
        [ Html.Events.onClick BackPage
        , Html.Attributes.style
          [ "cursor" => "pointer"
          , "padding-right" => "12px"
          ]
        ]
        [ Icons.arrow_left (Color.rgb 30 30 30) arrowSize ]
      , Html.div
        [ Html.Events.onClick ForwardPage
        , Html.Attributes.style
          [ "cursor" => "pointer"
          , "padding-left" => "12px"
          ]
        ]
        [ Icons.arrow_right (Color.rgb 30 30 30) arrowSize ]
      , Html.div
        [ Html.Attributes.style
          [ "flex" => "1"
          , "display" => "flex"
          ]
        ]
        [ button
          [ Html.Events.onClick ReloadHomePage ]
          [ Html.text "Home page" ]
        , button
          [ Html.Events.onClick <| ChangePage "/options" ]
          [ Html.text "Options page" ]
        ]
      ]
