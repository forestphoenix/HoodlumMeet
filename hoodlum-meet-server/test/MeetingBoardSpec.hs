{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving         #-}
module MeetingBoardSpec (spec) where

import           Common

import           MeetupBoard
import           Model

spec :: Spec
spec = do
    it "will do someting" $ property $ \meetup name ->
        runWithHistory meetupBoardProjector [] (createBoard (MeetupBoard meetup) name)
            === [AnyEvent $ MeetupCreated meetup name]

deriving instance Arbitrary Meetup
deriving instance Arbitrary Meetup
