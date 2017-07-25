module Ghibli.Species.Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, string)
import Json.Decode.Extra as Decode exposing ((|:), optionalField)
import Ghibli.Species exposing (Species)

decodeSpecies : Decoder Species
decodeSpecies =
  Decode.succeed Species
    |: optionalField "url" string
    |: optionalField "films" string
    |: optionalField "people" string
    |: optionalField "hair_color" string
    |: optionalField "eye_color" string
    |: optionalField "classification" string
    |: optionalField "name" string
    |: optionalField "id" string
