module NLP.Summarizer.Arguments where

data SummarizerArguments =
  SummarizerArguments { dictionaryLanguage :: String
                      , inputFile :: String
                      , inputString :: String
                      , displayPercent :: Int
                      , displayLines :: Int }
