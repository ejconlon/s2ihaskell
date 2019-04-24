import Lib (someValue)

import Control.Monad (unless)

main :: IO ()
main = do
    putStrLn "Starting test..."
    unless (someValue == 42) (error "The world has gone mad!")
    putStrLn "Finished test"
