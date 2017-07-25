module Routing exposing (parseLocation)

import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), map, top, s, int)
import Data exposing (Route(..))

matchers : Parser (Route -> a) a
matchers =
  UrlParser.oneOf
    [ map Films top
    , map Film (s "films" </> int)
    , map Films (s "films")
    , map Vehicle (s "vehicles" </> int)
    , map Vehicles (s "vehicles")
    , map Settings (s "settings")
    ]

parseLocation : Location -> Route
parseLocation location =
  case (UrlParser.parsePath matchers location) of
    Just route ->
      route
    Nothing ->
      NotFound
