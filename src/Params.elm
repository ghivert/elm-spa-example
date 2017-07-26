module Params exposing (..)

import Dict exposing (Dict)
import ParseInt exposing (parseInt)
import Maybe.Extra as Maybe

type alias Params =
  { page : Maybe Int
  , color : Maybe String
  }

emptyParams : Params
emptyParams =
  { page = Nothing
  , color = Nothing
  }

setPage : Maybe Int -> Params -> Params
setPage page params =
  { params | page = page }

setColor : Maybe String -> Params -> Params
setColor color params =
  { params | color = color }

toParams : Dict String (List String) -> Params
toParams queries =
  emptyParams
    |> setPage
      (extractQuery "page" queries
        |> Maybe.map parseInt
        |> Maybe.map Result.toMaybe
        |> Maybe.join)
    |> setColor (extractQuery "color" queries)

extractQuery : String -> Dict String (List String) -> Maybe String
extractQuery id queries =
  queries
    |> Dict.get id
    |> Maybe.map List.reverse
    |> Maybe.map List.head
    |> Maybe.join
