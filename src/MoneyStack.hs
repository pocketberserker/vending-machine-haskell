module MoneyStack where

import Control.Monad.List ()

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
init =
  MoneyStack { ten = 0
             , fifty = 0
	     , hundred = 0
	     , fiveHundred = 0
	     , thousand = 0}

{-| function 'total'

>>> total MoneyStack {ten = 1, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0}
10
>>> total MoneyStack {ten = 1, fifty = 1, hundred = 1, fiveHundred = 1, thousand = 1}
1660
-}
total = sum . sequence
  [(*10) . ten, (*50) . fifty, (*100) . hundred, (*500) . fiveHundred, (*1000) . thousand]
