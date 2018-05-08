#!/usr/bin/env stack
-- stack --resolver lts-11.1 --install-ghc runghc --package random
{-# LANGUAGE TypeApplications #-}
import Data.Complex (Complex(..), magnitude)
import Control.Monad (replicateM, forM_)
import System.Random (randomIO)
import Text.Printf (printf)

approximate :: Int -> IO Double
approximate count = do
    let randomPoint = (:+) <$> randomIO <*> randomIO @Double
        randomPoints = flip replicateM randomPoint
    inCircle <- (length . filter (\z -> magnitude z <= 1)) <$> randomPoints count
    pure $ 4 * (fromIntegral inCircle / fromIntegral count)

main = forM_ [1 .. 100000] $ \n -> printf "%6d %f\n" n =<< approximate n
