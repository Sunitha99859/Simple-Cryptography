module Vigenere
(
    encryptVigenere,
    decryptVigenere
) where

import Data.Char
import Caesar (shiftChar)

keyShift :: Char -> Int
keyShift ch =
    ord (toUpper ch) - ord 'A'

cleanKey :: String -> String
cleanKey =
    filter isAlpha

extendKey :: String -> String -> String
extendKey key text =
    take (length text) (cycle key)

encryptVigenere :: String -> String -> String
encryptVigenere key text =
    zipWith encryptChar text (extendKey (cleanKey key) text)

decryptVigenere :: String -> String -> String
decryptVigenere key text =
    zipWith decryptChar text (extendKey (cleanKey key) text)

encryptChar :: Char -> Char -> Char
encryptChar textChar keyChar
    | isAlpha textChar = shiftChar (keyShift keyChar) textChar
    | otherwise = textChar

decryptChar :: Char -> Char -> Char
decryptChar textChar keyChar
    | isAlpha textChar = shiftChar (-keyShift keyChar) textChar
    | otherwise = textChar