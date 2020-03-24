{-# LANGUAGE AllowAmbiguousTypes #-}

module Common (
    module Common,
    module ReExport)
where

import           Test.Hspec                as ReExport
import           Test.QuickCheck           as ReExport
import           Test.QuickCheck.Instances as ReExport ()
import           Test.QuickCheck.Poly      as ReExport

import           EventSpring               as ReExport

import qualified Data.List                 as L

import           Model

-- ! Run with a random history that satisfies the following criterion:
-- ! All events have to update the passed projection
--projectionProperty :: (Testable prop, ProjId projId) => Projector ev -> projId -> ([ev] -> prop) -> Property
--projectionProperty = undefined

-- ! Run a command with a given history
runWithHistory :: (Projection (ProjectionFor projId), ProjId projId) =>
  Projector projId -> [AnyEvent] -> Command projId a -> a
runWithHistory projector events (Command projId fn) = fn $ L.lookup projId projections
    where
        projections = foldr (\(AnyEvent ev) -> runEventAL projector ev) [] events

-- runWithRestrictedHistory :: (Projection proj, ProjId projId, ProjectionFor projId proj) =>
--   Projector ev -> projId -> Command projId a -> a
-- runWithRestrictedHistory =
