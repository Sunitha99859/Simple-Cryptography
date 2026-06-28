module Vigenere
(
    encryptVigenere,
    decryptVigenere
) where

import Data.Char
import Caesar

keyShift :: Char -> Int
keyShift c =
    ord (toUpper c) - ord 'A'

cleanKey :: String -> String
cleanKey =
    filter isAlpha

encryptVigenere :: String -> String -> String
encryptVigenere key text =
    process text (cycle (cleanKey key))
  where
    process [] _ = []

    process (x:xs) ks

        | isAlpha x =
            let k = head ks
            in shiftChar (keyShift k) x : process xs (tail ks)

        | otherwise =
            x : process xs ks

decryptVigenere :: String -> String -> String
decryptVigenere key text =
    process text (cycle (cleanKey key))
  where
    process [] _ = []

    process (x:xs) ks

        | isAlpha x =
            let k = head ks
            in shiftChar (-keyShift k) x : process xs (tail ks)

        | otherwise =
            x : process xs ks