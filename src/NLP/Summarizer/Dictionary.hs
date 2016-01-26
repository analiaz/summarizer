module NLP.Summarizer.Dictionary where

import NLP.Summarizer.Term

import Data.Map (Map)
import Data.Text (Text)

data XElement = XElement

data Dictionary =
  Dictionary { unimportantWords :: [Term]
             , lineBreakRules :: [Text]
             , notALineBreakRules :: [Text]
             , depreciateValue :: [Text]
             , termFreqMultiplierRule :: [Text]
             , step1PrefixRules :: Map Text Text
             , step1SuffixRules :: Map Text Text
             , manualReplacementRules :: Map Text Text
             , prefixRules :: Map Text Text
             , suffixRules :: Map Text Text
             , synonymRules :: Map Text Text
             , language :: Text
             }

-- Create a dictionary based on language dependent XML
loadFromFile :: String -> IO Dictionary
loadFromFile lang = undefined

loadValueOnlySection :: XElement -> Text -> [Text]
loadValueOnlySection doc section = undefined

loadValueOnlyRule :: XElement -> Text -> Text -> [Text]
loadValueOnlyRule doc section container = undefined

loadKeyValueRule :: XElement -> Text -> Text -> Map Text Text
loadKeyValueRule doc section container = undefined
