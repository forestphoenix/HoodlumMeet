{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE UndecidableInstances #-}
module ClassHelpers (
    module ReExport,
    Serialized,
) where

import           Data.Aeson  as ReExport (FromJSON, FromJSONKey, ToJSON,
                                          ToJSONKey)
import           Data.Aeson  (eitherDecode, encode)

import           EventSpring (ProjectionFor, Serialized, deserialize, serialize)

instance (Eq a, Show a, ToJSON a, FromJSON a, Typeable a) => Serialized a where
    serialize = encode
    deserialize = eitherDecode
