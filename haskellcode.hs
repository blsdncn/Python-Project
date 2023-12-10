import System.Environment

subtractFrom255 :: [Int] -> [Int]
subtractFrom255 [] = []
subtractFrom255 (x:xs) = (255 - x) : subtractFrom255 xs

main :: IO()
main = do
    input <- readFile "input.txt"
    let numbers = map read (words input) :: [Int]
        result = subtractFrom255 numbers
        resultStrings = map show result
        outputString = unwords resultStrings
    putStrLn outputString