module Main where

import Test.DocTest

main :: IO ()
main = doctest ["--optghc=-isrc", "src/VendingMachine.hs"]
