module Caesar
(
    encryptCaesar,
    decryptCaesar
) where

import Data.Char

shiftLower :: Int -> Char -> Char
shiftLower key ch =
    chr (((ord ch - ord 'a' + key) `mod` 26) + ord 'a')

shiftUpper :: Int -> Char -> Char
shiftUpper key ch =
    chr (((ord ch - ord 'A' + key) `mod` 26) + ord 'A')

shiftChar :: Int -> Char -> Char
shiftChar key ch
    | isLower ch = shiftLower key ch
    | isUpper ch = shiftUpper key ch
    | otherwise = ch

shiftText :: Int -> String -> String
shiftText key text =
    map (shiftChar key) text

encryptCaesar :: Int -> String -> String
encryptCaesar key text =
    shiftText key text

decryptCaesar :: Int -> String -> String
decryptCaesar key text =
    shiftText (-key) text