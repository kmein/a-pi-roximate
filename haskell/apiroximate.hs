#!/usr/bin/env stack
-- stack --resolver lts-11.1 --install-ghc runghc --package random
import Control.Monad (replicateM, forM_)
import System.Random (randomIO)
import Text.Printf (printf)

data Point = Point Double Double

dist (Point x y) = sqrt (x^2 + y^2)

approximate :: Int -> IO Double
approximate count = do
    let randomPoint = Point <$> randomIO <*> randomIO
        randomPoints = flip replicateM randomPoint
    inCircle <- (length . filter (\p -> dist p <= 1)) <$> randomPoints count
    pure $ 4 * (fromIntegral inCircle / fromIntegral count)

main = forM_ [1 .. 100000] $ \n -> printf "%6d %f\n" n =<< approximate n
