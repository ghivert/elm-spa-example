module Ghibli.Location.Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, string, int)
import Json.Decode.Extra as Decode exposing ((|:), optionalField)
import Ghibli.Location exposing (Location)

decodeLocation : Decoder Location
decodeLocation =
  Decode.succeed Location
    |: optionalField "url" int
    |: optionalField "films" string
    |: optionalField "residents" int
    |: optionalField "surface_water" string
    |: optionalField "terrain" int
    |: optionalField "climate" string
    |: optionalField "name" string
    |: optionalField "id" int
