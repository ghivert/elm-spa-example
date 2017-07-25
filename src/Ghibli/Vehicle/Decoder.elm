module Ghibli.Vehicle.Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, string)
import Json.Decode.Extra as Decode exposing ((|:), optionalField)
import Ghibli.Vehicle exposing (Vehicle)

decodeVehicle : Decoder Vehicle
decodeVehicle =
  Decode.succeed Vehicle
    |: optionalField "url" string
    |: optionalField "films" string
    |: optionalField "pilot" string
    |: optionalField "length" string
    |: optionalField "vehicle_class" string
    |: optionalField "description" string
    |: optionalField "name" string
    |: optionalField "id" string
