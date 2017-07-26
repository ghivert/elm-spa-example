module View.Header exposing (header)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Rocket exposing ((=>))
import Data exposing (..)
import View.Debug
import Helpers.Layout as Layout
import Helpers.Navigation as Navigation

button : List (Html.Attribute msg) -> List (Html msg) -> Html msg
button attributes content =
  Html.div []
    [ Html.button
      (List.append attributes
        [ Html.Attributes.style
          [ "padding" => "6px"
          , "cursor" => "pointer"
          , "border" => "none"
          , "font-size" => "14px"
          , "box-sizing" => "border-box"
          , "background-color" => "#fcfcfc"
          , "font-size" => "20px"
          , "outline" => "none"
          ]
        ])
      content
    ]

pagesSelector : Html Msg
pagesSelector =
  Layout.flexCenter <|
    List.map (Html.map Navigation)
      [ Navigation.arrowBack
      , Navigation.arrowForward
      , Layout.flex
        [ button
          [ Html.Events.onClick ReloadHomePage ]
          [ Html.text "Home" ]
        , button
          [ Html.Events.onClick <| ChangePage "/foo?page=4" ]
          [ Html.text "Settings" ]
        ]
      ]

header : Model -> Html Msg
header { debugInfos } =
  Html.div
    [ Html.Attributes.style
      [ "display" => "flex"
      , "justify-content" => "space-between"
      , "align-items" => "center"
      ]
    ]
    [ pagesSelector
    , View.Debug.switch debugInfos
    ]
