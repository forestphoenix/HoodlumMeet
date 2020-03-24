module Main where

import           Web.Scotty

main :: IO ()
main = undefined


{-
runTransaction $ do
    let (boardId, events) = createBoard name
    recordAny :: events
    readProjection boardId

runTransaction $ do
    createBoard name

runOnBoard store boardId $ createBoard name
-}

--runOnBoard :: FileStore -> MeetupBoard -> (MeetupBoard -> Maybe MeetupBoardState -> [AnyEvent]) -> IO MeetupBoardState
