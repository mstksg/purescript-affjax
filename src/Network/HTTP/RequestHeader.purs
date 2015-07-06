module Network.HTTP.RequestHeader where

import Prelude

import Network.HTTP.MimeType

data RequestHeader
  = Accept MimeType
  | ContentType MimeType
  | RequestHeader String String

instance eqRequestHeader :: Eq RequestHeader where
  eq (Accept m1) (Accept m2) = m1 == m2
  eq (ContentType m1) (ContentType m2) = m1 == m2
  eq (RequestHeader h1 v1) (RequestHeader h2 v2) = h1 == h2 && v1 == v2
  eq _ _ = false

instance showRequestHeader :: Show RequestHeader where
  show (Accept m) = "(Accept " ++ show m ++ ")"
  show (ContentType m) = "(ContentType " ++ show m ++ ")"
  show (RequestHeader h v) = "(RequestHeader " ++ show h ++ " " ++ show v ++ ")"

requestHeaderName :: RequestHeader -> String
requestHeaderName (Accept _) = "Accept"
requestHeaderName (ContentType _) = "Content-Type"
requestHeaderName (RequestHeader h _) = h

requestHeaderValue :: RequestHeader -> String
requestHeaderValue (Accept m) = mimeTypeToString m
requestHeaderValue (ContentType m) = mimeTypeToString m
requestHeaderValue (RequestHeader _ v) = v
