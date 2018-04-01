{-# LANGUAGE BangPatterns #-}

import Data.Bits (shiftR)
import Numeric.LinearAlgebra 

n0 = 1 / (sqrt 2) :: Double

hadamard :: Int -> Matrix Double
hadamard n
  | n <= 1 = hIdent
  | otherwise = hadamard 1 `kronecker` hadamard (n - 1)

hIdent :: Matrix Double
hIdent = (2><2) [  n0,  n0
                ,  n0, -n0 ]

log2 :: Int -> Int
log2 x = go (-1) x
  where
    go !p q
      | q <= 0 = p
      | otherwise = go (p + 1) (q `shiftR` 1)
