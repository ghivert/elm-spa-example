module Routing exposing (parseLocation)

import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), (<?>), map, top, s, int, string)
import Data exposing (Route(..), Params, RouteParams)

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

parseParams : Parser (Params -> a) a
parseParams =
  map Params <|
    top
      <?> UrlParser.intParam "page"
      <?> UrlParser.stringParam "color"

parseRouteParams : Parser (RouteParams -> a) a
parseRouteParams =
  map RouteParams <|
    parseRoute </> parseParams

parseLocation : Location -> RouteParams
parseLocation location =
  case (UrlParser.parsePath parseRouteParams location) of
    Just route ->
      route
    Nothing ->
      { route = NotFound
      , params = Params Nothing Nothing
      }
