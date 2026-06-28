module Main where

import Caesar
import Vigenere
import Frequency
import Data.Char

main :: IO ()
main = do

    putStrLn ""
    putStrLn "===== Simple Cryptography ====="
    putStrLn "1. Caesar Encrypt"
    putStrLn "2. Caesar Decrypt"
    putStrLn "3. Vigenere Encrypt"
    putStrLn "4. Vigenere Decrypt"
    putStrLn "5. Caesar Frequency Analysis"

    choice <- getLine

    case choice of

        "1" -> do
            putStrLn "Enter key:"
            k <- fmap read getLine

            putStrLn "Enter plaintext:"
            txt <- getLine

            putStrLn "\nCiphertext:"
            putStrLn (encryptCaesar k txt)

        "2" -> do
            putStrLn "Enter key:"
            k <- fmap read getLine

            putStrLn "Enter ciphertext:"
            txt <- getLine

            putStrLn "\nPlaintext:"
            putStrLn (decryptCaesar k txt)

        "3" -> do
            putStrLn "Keyword:"
            key <- getLine

            if null (filter isAlpha key)
            then putStrLn "Invalid keyword."
            else do
                putStrLn "Plaintext:"
                txt <- getLine
                putStrLn "\nCiphertext:"
                putStrLn (encryptVigenere key txt)

        "4" -> do
            putStrLn "Keyword:"
            key <- getLine

            if null (filter isAlpha key)
            then putStrLn "Invalid keyword."
            else do
                putStrLn "Ciphertext:"
                txt <- getLine
                putStrLn "\nPlaintext:"
                putStrLn (decryptVigenere key txt)

        "5" -> do
            putStrLn "Enter ciphertext:"
            txt <- getLine

            putStrLn "\nPossible plaintexts:\n"

            mapM_
                (\(k,p) ->
                    putStrLn ("Key " ++ show k ++ " : " ++ p))
                (analyzeCaesar txt)

        _ ->
            putStrLn "Invalid option."