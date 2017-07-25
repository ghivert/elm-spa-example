module Ghibli.Film exposing (..)

type alias Film =
  { url : Maybe String
  , locations : Maybe String
  , species : Maybe String
  , people : Maybe String
  , rt_score : Maybe String
  , release_date : Maybe String
  , producer : Maybe String
  , director : Maybe String
  , description : Maybe String
  , title : Maybe String
  , id : Maybe Int
  }
