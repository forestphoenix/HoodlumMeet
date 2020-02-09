module Events where

{-
-- TODO: Move into Entities
data Meetup

data Participant

data Acceptance = Accepted | Perhaps | Rejected

-- Acutal event start here...

data CreateMeetup = CreateMeetup Meetup MeetupName


data AddParticipant = AddParticipant Meetup Participant ParticipantName

data RenameParicipant = RenameParicipant Participant ParticipantName

data RemoveParticipant = RemoveParticipant Meetup Participant


data SuggestTime = SuggestTime Meetup DateTime

data RemoveTime = RemoveTime Meetup DateTime

data AcepptTime = AcceptTime Meetup Participant DateTime Acceptance
-}
