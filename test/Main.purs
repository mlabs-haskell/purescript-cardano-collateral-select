module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "Tests are implemented in CTL: https://github.com/Plutonomicon/cardano-transaction-lib/ (every Contract that uses scripts uses collateral selection)"
