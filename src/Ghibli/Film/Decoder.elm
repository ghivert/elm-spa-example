module Ghibli.Film.Decoder exposing (..)

import Ghibli.Film exposing (Film)
import Json.Decode as Decode exposing (Decoder, string, int)
import Json.Decode.Extra exposing ((|:), optionalField)

decodeFilm : Decoder Film
decodeFilm =
  Decode.succeed Film
    |: optionalField "url" string
    |: optionalField "locations" string
    |: optionalField "species" string
    |: optionalField "people" string
    |: optionalField "rt_score" string
    |: optionalField "release_date" string
    |: optionalField "producer" string
    |: optionalField "director" string
    |: optionalField "description" string
    |: optionalField "title" string
    |: optionalField "id" int
