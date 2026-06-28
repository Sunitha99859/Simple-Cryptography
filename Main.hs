module Main where

import Caesar
import Vigenere

main :: IO ()
main = do
    putStrLn "===== Simple Cryptography ====="
    putStrLn "1. Caesar Encrypt"
    putStrLn "2. Caesar Decrypt"
    putStrLn "3. Vigenere Encrypt"
    putStrLn "4. Vigenere Decrypt"

    choice <- getLine

    case choice of

        "1" -> do
            putStrLn "Enter key:"
            keyInput <- getLine

            putStrLn "Enter plaintext:"
            text <- getLine

            let key = read keyInput :: Int
            putStrLn (encryptCaesar key text)

        "2" -> do
            putStrLn "Enter key:"
            keyInput <- getLine

            putStrLn "Enter ciphertext:"
            text <- getLine

            let key = read keyInput :: Int
            putStrLn (decryptCaesar key text)

        "3" -> do
            putStrLn "Enter keyword:"
            key <- getLine

            if null (filter (`elem` ['A'..'Z'] ++ ['a'..'z']) key)
            then putStrLn "Keyword must contain letters."
            else do
                putStrLn "Enter plaintext:"
                text <- getLine
                putStrLn (encryptVigenere key text)

        "4" -> do
            putStrLn "Enter keyword:"
            key <- getLine

            if null (filter (`elem` ['A'..'Z'] ++ ['a'..'z']) key)
            then putStrLn "Keyword must contain letters."
            else do
                putStrLn "Enter ciphertext:"
                text <- getLine
                putStrLn (decryptVigenere key text)

        _ ->
            putStrLn "Invalid option."