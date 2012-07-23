module VendingMachine where

import Control.Monad.State
import MoneyStack

{-| function 'insert'

>>> runState (insert 10) MoneyStack.init
(Nothing,MoneyStack {ten = 1, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0})
>>> runState (insert 50) MoneyStack.init
(Nothing,MoneyStack {ten = 0, fifty = 1, hundred = 0, fiveHundred = 0, thousand = 0})
>>> runState (insert 100) MoneyStack.init
(Nothing,MoneyStack {ten = 0, fifty = 0, hundred = 1, fiveHundred = 0, thousand = 0})
>>> runState (insert 500) MoneyStack.init
(Nothing,MoneyStack {ten = 0, fifty = 0, hundred = 0, fiveHundred = 1, thousand = 0})
>>> runState (insert 1000) MoneyStack.init
(Nothing,MoneyStack {ten = 0, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 1})
>>> runState (insert 10 >> insert 10) MoneyStack.init
(Nothing,MoneyStack {ten = 2, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0})

>>> runState (insert 10 >> insert 1) MoneyStack.init
(Just 1,MoneyStack {ten = 1, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0})
-}
insert 10 = state $ \s -> (Nothing, s { ten = ten s + 1})
insert 50 = state $ \s -> (Nothing, s { fifty = fifty s + 1})
insert 100 = state $ \s -> (Nothing, s { hundred = hundred s + 1})
insert 500 = state $ \s -> (Nothing, s { fiveHundred = fiveHundred s + 1})
insert 1000 = state $ \s -> (Nothing, s { thousand = thousand s + 1})
insert other = state $ \s -> (Just other, s)

{-| function 'payback'

>>> runState payback $ execState (insert 10) MoneyStack.init
([10],MoneyStack {ten = 0, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0})
>>> runState payback $ execState (insert 10 >> insert 1000) MoneyStack.init
([10,1000],MoneyStack {ten = 0, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0})
-}
payback :: State MoneyStack [Int]
payback = state $ \s -> (calc s, MoneyStack.init)
  where convert s (f, m) = take (f s) $ repeat m
        calc s = concat $ map (convert s)
	  [(ten, 10), (fifty, 50), (hundred, 100), (fiveHundred, 500), (thousand, 1000)]
