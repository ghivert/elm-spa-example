module Helpers.Navigation exposing (arrowBack, arrowForward)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Color
import FontAwesome as Icons
import Rocket exposing ((=>))
import Data exposing (..)

type Direction
  = Back
  | Forward

arrowSize : Int
arrowSize =
  38

arrow : Direction -> Html SpaNavigation
arrow direction =
  let
    directionMatcher back_ forward_ =
      case direction of
        Back -> back_
        Forward -> forward_
  in
    Html.div
      [ Html.Events.onClick <| directionMatcher BackPage ForwardPage
      , Html.Attributes.style [ "cursor" => "pointer", "padding" => "0 12px" ]
      ]
      [ (directionMatcher Icons.arrow_left Icons.arrow_right)
          (Color.rgb 30 30 30) arrowSize
      ]

arrowBack : Html SpaNavigation
arrowBack =
  arrow Back

arrowForward : Html SpaNavigation
arrowForward =
  arrow Forward
