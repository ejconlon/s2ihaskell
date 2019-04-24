import Lib (someValue)

import Control.Monad (unless)

main :: IO ()
main = unless (someValue == 42) (error "The world has gone mad!")
