module Params exposing (Params, setPage, setColor, fromQueryString, toQueryString)

import Dict exposing (Dict)
import ParseInt exposing (parseInt)
import Maybe.Extra as Maybe
import RouteParser.QueryString as Queries
import Color exposing (Color)
import Color.Convert as Color

type alias Params =
  { page : Maybe Int
  , color : Maybe Color
  }

emptyParams : Params
emptyParams =
  { page = Nothing
  , color = Nothing
  }

setPage : Maybe Int -> Params -> Params
setPage page params =
  { params | page = page }

setColor : Maybe Color -> Params -> Params
setColor color params =
  { params | color = color }

fromQueries : Dict String (List String) -> Params
fromQueries queries =
  emptyParams
    |> setPage
      (extractQuery "page" queries
        |> Maybe.map parseInt
        |> Maybe.map Result.toMaybe
        |> Maybe.join)
    |> setColor
      (extractQuery "color" queries
        |> Maybe.map Color.hexToColor
        |> Maybe.map Result.toMaybe
        |> Maybe.join)

extractQuery : String -> Dict String (List String) -> Maybe String
extractQuery id =
  Dict.get id
    >> Maybe.map List.reverse
    >> Maybe.map List.head
    >> Maybe.join

fromQueryString : String -> Params
fromQueryString =
  Queries.parse >> fromQueries

toQueryString : Params -> List (String, String)
toQueryString { page, color } =
  Dict.empty
    |> insertIfExist "page"  (Maybe.map toString page)
    |> insertIfExist "color" (Maybe.map Color.colorToHex color)
    |> Dict.toList

insertIfExist : String -> Maybe String -> Dict String String -> Dict String String
insertIfExist key value dict =
  Maybe.unwrap dict (insertAt key dict) value

insertAt : String -> Dict String String -> String -> Dict String String
insertAt =
  flip << Dict.insert
