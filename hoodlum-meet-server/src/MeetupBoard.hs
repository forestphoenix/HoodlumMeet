module MeetupBoard where

import qualified Data.Map.Strict as M
import qualified Data.Set        as S
import           Data.Time       (LocalTime)
import           EventSpring

import           ClassHelpers
import           Model

newtype MeetupBoard = MeetupBoard Meetup
    deriving (Eq, Show, Generic, Typeable)

instance ToJSON MeetupBoard
instance FromJSON MeetupBoard
instance Hashable MeetupBoard
instance ProjId MeetupBoard

data MeetupBoardState = MeetupBoardState {
    _miTimeAcceptance   :: M.Map (Participant, LocalTime) Acceptance,
    _miParticipantNames :: M.Map Participant ParticipantName,
    _miSuggestedTimes   :: S.Set LocalTime
} deriving (Eq, Show, Generic, Typeable)

instance ToJSON MeetupBoardState
instance FromJSON MeetupBoardState
instance Projection MeetupBoardState
type instance ProjectionFor MeetupBoard = MeetupBoardState


meetupBoardProjector :: Projector MeetupBoard
meetupBoardProjector = undefined

createBoard :: MeetupBoard -> MeetupName -> Command MeetupBoard [AnyEvent]
createBoard (MeetupBoard meetup) meetupName = Command (MeetupBoard meetup) $ const [AnyEvent $ MeetupCreated meetup meetupName]
