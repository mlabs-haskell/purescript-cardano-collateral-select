module Cardano.Collateral.UtxoMinAda
  ( adaOnlyUtxoMinAdaValue
  , utxoMinAdaValue
  ) where

import Prelude

import Cardano.Types.BigNum (maxValue) as BigNum
import Cardano.Types.Coin (Coin)
import Cardano.Types.TransactionOutput (TransactionOutput, minAdaForOutput)
import Cardano.Types.Value (lovelaceValueOf)
import Cardano.Collateral.FakeOutput (fakeOutputWithValue)
import Data.Newtype (unwrap)

utxoMinAdaValue
  :: Coin -> TransactionOutput -> Coin
utxoMinAdaValue coinsPerUtxoByte txOutput =
  minAdaForOutput txOutput (unwrap coinsPerUtxoByte)

adaOnlyUtxoMinAdaValue :: Coin -> Coin
adaOnlyUtxoMinAdaValue coinsPerUtxoByte =
  utxoMinAdaValue coinsPerUtxoByte <<<
    fakeOutputWithValue
    $ lovelaceValueOf BigNum.maxValue
