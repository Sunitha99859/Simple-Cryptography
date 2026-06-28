module Main where

import Caesar

main :: IO ()
main = do
    putStrLn "===== Caesar Cipher ====="

    putStrLn "1. Encrypt"
    putStrLn "2. Decrypt"

    choice <- getLine

    if choice == "1"
    then do
        putStrLn "Enter key:"
        keyInput <- getLine

        putStrLn "Enter plaintext:"
        text <- getLine

        let key = read keyInput :: Int

        putStrLn "\nCiphertext:"
        putStrLn (encryptCaesar key text)

    else if choice == "2"
    then do
        putStrLn "Enter key:"
        keyInput <- getLine

        putStrLn "Enter ciphertext:"
        text <- getLine

        let key = read keyInput :: Int

        putStrLn "\nPlaintext:"
        putStrLn (decryptCaesar key text)

    else
        putStrLn "Invalid choice."