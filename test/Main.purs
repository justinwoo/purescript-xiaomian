module Test.Main where

import Prelude

import Effect (Effect)
import ExpectInferred (expectInferred)
import Type.Prelude (Proxy(..), RProxy, SProxy)
import Xiaomian as X

test :: Unit
test = do
  let
    expected = Proxy :: Proxy (RProxy ( a :: SProxy "a", b :: SProxy "b", c :: SProxy "c" ))
    actual = X.getKeysRow { a: 1, b: 2, c: 3 }
  expectInferred expected actual

test2 :: Unit
test2 = do
  let
    expected = Proxy :: Proxy ({ a :: SProxy "a", b :: SProxy "b", c :: SProxy "c" })
    actual = X.getKeysRecord { a: 1, b: 2, c: 3 }
  expectInferred expected actual

test3 :: Unit
test3 = do
  let
    expected = Proxy :: Proxy ({ a :: SProxy "a", b :: SProxy "b", c :: SProxy "c" })
    actual = X.getKeysRecord' (Proxy :: Proxy { a :: Int, b :: Int, c :: Int })
  expectInferred expected actual

main :: Effect Unit
main = pure unit
