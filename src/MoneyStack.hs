module MoneyStack where

data MoneyStack =
  MoneyStack { ten :: Int
             , fifty :: Int
	     , hundred :: Int
	     , fiveHundred :: Int
	     , thousand :: Int} deriving (Show)
