module Caesar
(
    encryptCaesar,
    decryptCaesar,
    shiftChar
) where

import Data.Char

shiftChar :: Int -> Char -> Char
shiftChar key ch
    | isLower ch =
        chr (((ord ch - ord 'a' + key) `mod` 26) + ord 'a')

    | isUpper ch =
        chr (((ord ch - ord 'A' + key) `mod` 26) + ord 'A')

    | otherwise =
        ch

encryptCaesar :: Int -> String -> String
encryptCaesar key =
    map (shiftChar key)

decryptCaesar :: Int -> String -> String
decryptCaesar key =
    map (shiftChar (-key))