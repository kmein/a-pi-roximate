#!/usr/bin/env stack
-- stack --resolver lts-11.1 --install-ghc runghc --package random
import Control.Monad (replicateM, forM_)
import System.Random (randomIO)
import Text.Printf (printf)

radius = 20.0

data Point = Point Double Double

dist (Point x y) = sqrt (x^2 + y^2)

approximate :: Int -> IO Double
approximate count = do
    let scale r (Point x y) = Point (r * x) (r * y)
        randomPoint = scale radius <$> (Point <$> randomIO <*> randomIO)
        randomPoints = flip replicateM randomPoint
    inCircle <- (length . filter (\p -> dist p <= radius)) <$> randomPoints count
    pure $ 4 * (fromIntegral inCircle / fromIntegral count)

main = forM_ [1 .. 100000] $ \n -> printf "%6d %f\n" n =<< approximate n
