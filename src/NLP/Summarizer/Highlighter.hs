module NLP.Summarizer.Highlighter where

import NLP.Summarizer.Article
import NLP.Summarizer.Arguments
import NLP.Summarizer.Sentence (score, selected, terms)

import Data.List (sortOn)

highlight :: SummarizerArguments -> Article -> Article
highlight args =
  if (displayPercent args == 0 && displayLines args == 0)
  then id
  else if (displayPercent args == 0)
       then selectNumberOfSentences (displayLines args)
       else selectSentencesByPercent (displayPercent args)

selectSentencesByPercent :: Int -> Article -> Article
selectSentencesByPercent percent article =
  let sentencesByScore = sortOn score (sentences article)
      totalWords = foldr (\s r -> length(terms s) + r) 0 (sentences article)
      maxWords = (fromIntegral totalWords) * ((fromIntegral percent) / 100)
      f (ss,n) s = if n >= maxWords
                      then (ss ++ [s], n)
                      else (ss ++ [s { selected = True }], n + 1)
      (sentences',_) = foldl f ([], 0) sentencesByScore
  in article { sentences = sentences' }

selectNumberOfSentences :: Int -> Article -> Article
selectNumberOfSentences lineCount article =
  let sentencesByScore = reverse (sortOn score (sentences article))
      (xs,ys) = splitAt lineCount sentencesByScore
      xs' = map (\s -> s { selected = True }) xs -- TODO: filter empty from xs
  in article { sentences = xs' ++ ys }
