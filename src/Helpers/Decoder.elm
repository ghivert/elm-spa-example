module Helpers.Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, string, int)
import Json.Decode.Extra as Decode exposing ((|:), optionalField)

type alias Error =
  { fields : Maybe String
  , message : Maybe String
  , code : Maybe Int
  }

decodeError : Decoder Error
decodeError =
  Decode.succeed Error
    |: optionalField "fields" string
    |: optionalField "message" string
    |: optionalField "code" int
