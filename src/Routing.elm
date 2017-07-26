module Routing exposing (parseLocation)

import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), (<?>), map, top, s, int)
import Data exposing (Route(..))

parseRoute : Parser (Route -> a) a
parseRoute =
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
  case (UrlParser.parsePath parseRoute location) of
    Just route ->
      route
    Nothing ->
      NotFound
