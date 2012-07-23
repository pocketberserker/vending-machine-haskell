module MoneyStack where

data MoneyStack =
  MoneyStack { ten :: Int
             , fifty :: Int
	     , hundred :: Int
	     , fiveHundred :: Int
	     , thousand :: Int} deriving (Show)

{-| function 'init'

>>> MoneyStack.init
MoneyStack {ten = 0, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0}
-}
init = undefined
