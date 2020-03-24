module Model where

import           Data.Time    (LocalTime)
import           Data.UUID    (UUID)

import           EventSpring

import           ClassHelpers

-- TODO: move into its own file
data Command projId out = Command projId (Maybe (ProjectionFor projId) -> out)


-- Value Types

newtype Meetup = Meetup UUID
    deriving (Eq, Show, Generic, Typeable)
instance ToJSON Meetup
instance FromJSON Meetup
instance Hashable Meetup

newtype Participant = Participant UUID
    deriving (Eq, Ord, Show, Generic, Typeable)
instance ToJSON Participant
instance ToJSONKey Participant
instance FromJSONKey Participant
instance FromJSON Participant
instance Hashable Participant

data Acceptance = Accepted | Perhaps | Rejected
    deriving (Eq, Show, Generic, Typeable)
instance ToJSON Acceptance
instance FromJSON Acceptance
instance Hashable Acceptance

newtype MeetupName = MeetupName Text
    deriving (Eq, Show, Generic, Typeable)
instance ToJSON MeetupName
instance FromJSON MeetupName
instance Hashable MeetupName

newtype ParticipantName = ParticipantName Text
    deriving (Eq, Show, Generic, Typeable)
instance ToJSON ParticipantName
instance FromJSON ParticipantName
instance Hashable ParticipantName

-- Events

data MeetupCreated = MeetupCreated Meetup MeetupName
    deriving (Eq, Show, Generic, Typeable)
instance ToJSON MeetupCreated
instance FromJSON MeetupCreated
instance Hashable MeetupCreated
instance Event MeetupCreated


data ParticipantAdded = ParticipantAdded Meetup Participant ParticipantName

data ParticipantRenamed = ParticipantRenamed Participant ParticipantName

data ParticipantRemoved = ParticipantRemoved Meetup Participant


data SuggestTime = SuggestTime Meetup LocalTime

data RemoveTime = RemoveTime Meetup LocalTime

data AcceptTime = AcceptTime Meetup Participant LocalTime Acceptance
