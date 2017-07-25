module Ghibli.People.Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, string)
import Json.Decode.Extra as Decode exposing ((|:), optionalField)
import Ghibli.People exposing (People)

decodePeople : Decoder People
decodePeople =
  Decode.succeed People
    |: optionalField "url" string
    |: optionalField "species" string
    |: optionalField "films" string
    |: optionalField "hair_color" string
    |: optionalField "eye_color" string
    |: optionalField "age" string
    |: optionalField "gender" string
    |: optionalField "name" string
    |: optionalField "id" string
