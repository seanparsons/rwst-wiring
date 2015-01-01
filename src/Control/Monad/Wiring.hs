{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}

module Control.Monad.Wiring(
  Wirable(..),
  main
) where

import Control.Monad.Wiring.TH
import Control.Monad

$(generateTupleElementWirables)

test :: (Wirable (Int, String, Double) Double) => (Int, String, Double) -> Double
test = wire

main :: IO ()
main = print $ test (1, "Cake", 2.0)