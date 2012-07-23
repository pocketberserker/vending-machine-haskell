module VendingMachine where

import Control.Monad.State
import MoneyStack

{-| function 'insert'

>>> runState (insert 10) MoneyStack.init
(Nothing,MoneyStack {ten = 1, fifty = 0, hundred = 0, fiveHundred = 0, thousand = 0})
-}
insert 10 = state $ \s -> (Nothing, s { ten = 1})
