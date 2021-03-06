
# Echidna Test Results 



## Config settings used

```javascript
testLimit: 50000
testMode: assertion
corpusDir: "corpus-magic"
```


## Echidna Results


```bash
gitpod /workspace/Echidna-Testing (main) $ ./echidna-test EchidnaTest.sol --contract Test --config config.yaml --seq-len 1
Loaded total of 0 transactions from corpus-magic/coverage
Analyzing contract: /workspace/Echidna-Testing/EchidnaTest.sol:Test
fromInt_check_2(int256):  passed! 🎉
neg_check_2(int128):  passed! 🎉
muli_check_8():  passed! 🎉
abs_check_7(int128,int128):  passed! 🎉
divi_check_16(int256,int256,int256):  passed! 🎉
div_check_11():  passed! 🎉
sub_check_4(int128):  passed! 🎉
div_check_7():  passed! 🎉
ln_check_6(int128,int128):  passed! 🎉
div_check_14():  passed! 🎉
abs_check_9(int128,int128):  passed! 🎉
neg_check_12(int128,int128):  passed! 🎉
gavg_check_15(int128,int128):  passed! 🎉
avg_check_9(int128,int128):  passed! 🎉
sqrt_check_4(int128,uint256):  passed! 🎉
log_2_check_4(int128,int128):  passed! 🎉
mul_check_3():  passed! 🎉
divu_check_8(uint256):  passed! 🎉
gavg_check_3(int128,int128):  passed! 🎉
mulu_check_3():  passed! 🎉
avg_check_3(int128,int128):  passed! 🎉
exp_check_4(int128,int128):  passed! 🎉
pow_check_2(int128,uint256):  passed! 🎉
divu_check_7():  passed! 🎉
divi_check_14():  passed! 🎉
mul_check_5(int128):  passed! 🎉
neg_check_11(int128,int128):  passed! 🎉
neg_check_9():  passed! 🎉
gavg_check_11(int128,int128):  passed! 🎉
divu_check_14():  passed! 🎉
avg(int128,int128):  passed! 🎉
mulu_check_5(uint256):  passed! 🎉
divu_check_11(uint256):  passed! 🎉
avg_check_2(int128,int128):  passed! 🎉
exp_check_5(int128,int128):  passed! 🎉
divi_check_15(int256,int256):  passed! 🎉
div_check_18(int128,int128,int128):  passed! 🎉
divi_check_9(int256):  passed! 🎉
divi_check_13():  passed! 🎉
mul_check_9(int128):  passed! 🎉
neg_check_6(int128):  passed! 🎉
neg_check_4(int128,int128):  passed! 🎉
div(int128,int128):  passed! 🎉
exp_2_check_8():  passed! 🎉
add_check(int128,int128):  passed! 🎉
exp_check_2(int128,int128):  passed! 🎉
divi_check_17(int256,int256,int256):  passed! 🎉
mulu_check_7():  passed! 🎉
log_2_check_5(int128,int128):  passed! 🎉
sub_check_5():  passed! 🎉
log_2(int128):  passed! 🎉
divu_check_2():  passed! 🎉
mul_check_13(int128,int128,int128):  passed! 🎉
toInt_check_2(int128):  passed! 🎉
divi_check_12(int256):  passed! 🎉
inv_check_7(int128,int128):  passed! 🎉
add_check_9(int128,int128,int128):  passed! 🎉
add(int128,int128):  passed! 🎉
pow_check_6(int128,uint256,uint256):  passed! 🎉
inv_check_3():  passed! 🎉
mul_check(int128,int128):  passed! 🎉
exp_check_3(int128,int128):  passed! 🎉
ln_check_5(int128,int128):  passed! 🎉
toUInt_check_2(int128):  passed! 🎉
sqrt_check_7(int128):  passed! 🎉
abs_check_8(int128,int128):  passed! 🎉
mul_check_7():  passed! 🎉
pow_check_5(int128,int128,uint256):  passed! 🎉
mulu_check_2():  passed! 🎉
gavg_check_8(int128,int128):  passed! 🎉
div_check_5(int128):  passed! 🎉
mul_check_12(int128,int128):  passed! 🎉
inv_check_2(int128):  passed! 🎉
abs_check(int128):  passed! 🎉
divi_check_10():  passed! 🎉
neg(int128):  passed! 🎉
exp_2_check_3(int128,int128):  passed! 🎉
muli_check_3():  passed! 🎉
ln_check_7(int128):  passed! 🎉
pow_check(int128,uint256,int128):  passed! 🎉
exp_2_check(int128):  passed! 🎉
divi(int256,int256):  passed! 🎉
div_check_17(int128,int128,int128):  passed! 🎉
mulu_check_10(int128):  passed! 🎉
mul_check_6():  passed! 🎉
from128x128(int256):  passed! 🎉
abs_check_2():  passed! 🎉
log_2_check_8(int128):  passed! 🎉
add_check_2():  passed! 🎉
gavg_check_10(int128,int128):  passed! 🎉
div_check_4(int128):  passed! 🎉
to128x128_check(int128):  passed! 🎉
avg_check_6(int128,int128):  passed! 🎉
neg_check(int128):  passed! 🎉
gavg_check_12(int128,int128):  passed! 🎉
gavg_check_9(int128,int128):  passed! 🎉
divu_check_4(uint256):  passed! 🎉
sqrt_check_6(int128):  passed! 🎉
divu_check_15(uint256,uint256):  passed! 🎉
mul_check_10(int128):  passed! 🎉
divi_check_2():  passed! 🎉
mul_check_2():  passed! 🎉
gavg_check_5(int128,int128):  passed! 🎉
avg_check_5(int128,int128):  passed! 🎉
muli(int128,int256):  passed! 🎉
fromInt(int256):  passed! 🎉
mulu_check_4(int128):  passed! 🎉
fromInt_check(int256):  passed! 🎉
div_check_9(int128):  passed! 🎉
sqrt(int128):  passed! 🎉
to128x128_check_2(int128):  passed! 🎉
exp_check_6(int128):  passed! 🎉
divu_check_6():  passed! 🎉
abs_check_4():  passed! 🎉
add_check_3(int128):  passed! 🎉
add_check_10(int128,int128):  passed! 🎉
gavg_check_6(int128,int128):  passed! 🎉
inv_check_6(int128,int128):  passed! 🎉
gavg_check(int128,int128):  passed! 🎉
mul_check_4(int128):  passed! 🎉
gavg_check_7(int128,int128):  passed! 🎉
divu_check_3(uint256): failed!💥  
  Call sequence:
    divu_check_3(115792089237316195423570985008687907853269984665640564039457584007913127542784)

Event sequence: Panic(1), merror Revert 0x from: Test
exp_check_8():  passed! 🎉
divu_check_5():  passed! 🎉
muli_check_4(int128,int256,int128):  passed! 🎉
div_check_8():  passed! 🎉
gavg_check_2(int128,int128):  passed! 🎉
muli_check_7():  passed! 🎉
gavg_check_4(int128,int128):  passed! 🎉
inv_check_8(int128):  passed! 🎉
log_2_check_2(int128,int128):  passed! 🎉
inv(int128):  passed! 🎉
gavg_check_13(int128,int128):  passed! 🎉
neg_check_10():  passed! 🎉
log_2_check(int128):  passed! 🎉
mul_check_8():  passed! 🎉
avg_check_7(int128,int128):  passed! 🎉
toUInt_check(int128):  passed! 🎉
inv_check(int128):  passed! 🎉
add_check_7(int128):  passed! 🎉
div_check_12(int128):  passed! 🎉
divi_check_3(int256):  passed! 🎉
divu_check_10():  passed! 🎉
mulu_check_6():  passed! 🎉
toInt_check(int128):  passed! 🎉
divu_check_18(uint256,uint256,uint256):  passed! 🎉
log_2_check_7(int128):  passed! 🎉
div_check_19(int128,int128,int128):  passed! 🎉
divu_check_16(uint256,uint256,uint256):  passed! 🎉
toInt(int128):  passed! 🎉
add_check_4():  passed! 🎉
divi_check_6():  passed! 🎉
muli_check_11():  passed! 🎉
exp_2_check_6(int128):  passed! 🎉
div_check_2():  passed! 🎉
sub(int128,int128):  passed! 🎉
sub_check_2():  passed! 🎉
muli_check_5(int256):  passed! 🎉
muli_check(int128,int256):  passed! 🎉
add_check_5():  passed! 🎉
toUInt(int128):  passed! 🎉
fromUInt(uint256):  passed! 🎉
pow_check_3(int128,uint256,uint256):  passed! 🎉
mulu_check(int128,uint256):  passed! 🎉
add_check_8(int128,int128,int128):  passed! 🎉
pow(int128,uint256):  passed! 🎉
from128x128_check(int256):  passed! 🎉
exp(int128):  passed! 🎉
divi_check_11(int256):  passed! 🎉
mul(int128,int128):  passed! 🎉
div_check_13(int128):  passed! 🎉
divi_check_18(int256,int256,int256):  passed! 🎉
sqrt_check_2(int128,int128):  passed! 🎉
log_2_check_6(int128,int128):  passed! 🎉
avg_check_8(int128,int128):  passed! 🎉
abs_check_3():  passed! 🎉
ln_check(int128):  passed! 🎉
abs_check_5(int128,int128):  passed! 🎉
ln_check_2(int128,int128):  passed! 🎉
sub_check(int128,int128):  passed! 🎉
sub_check_8(int128,int128):  passed! 🎉
avg_check(int128,int128):  passed! 🎉
div_check_3():  passed! 🎉
exp_2_check_4(int128,int128):  passed! 🎉
muli_check_12(int128,int256):  passed! 🎉
fromUInt_check(uint256):  passed! 🎉
neg_check_5(int128,int128):  passed! 🎉
ln_check_3(int128,int128):  passed! 🎉
pow_check_4(int128,uint256,uint256):  passed! 🎉
mulu_check_8():  passed! 🎉
exp_2_check_5(int128,int128):  passed! 🎉
muli_check_10(int128):  passed! 🎉
divu_check_13():  passed! 🎉
add_check_6():  passed! 🎉
neg_check_8(int128,int128):  passed! 🎉
sub_check_7():  passed! 🎉
sqrt_check(int128,int128):  passed! 🎉
ln(int128):  passed! 🎉
div_check_6():  passed! 🎉
ln_check_8(int128):  passed! 🎉
from128x128_check_2(int256):  passed! 🎉
debug(string,int128):  passed! 🎉
exp_check(int128):  passed! 🎉
exp_check_7(int128):  passed! 🎉
log_2_check_3(int128,int128):  passed! 🎉
muli_check_6():  passed! 🎉
sqrt_check_3(int128,int128):  passed! 🎉
divi_check_4(int256):  passed! 🎉
inv_check_4():  passed! 🎉
div_check_10(int128):  passed! 🎉
avg_check_4(int128,int128):  passed! 🎉
abs(int128):  passed! 🎉
mulu_check_11():  passed! 🎉
divu_check():  passed! 🎉
divi_check_7():  passed! 🎉
abs_check_6(int128,int128):  passed! 🎉
exp_2_check_7():  passed! 🎉
divi_check():  passed! 🎉
mulu_check_12(int128,uint256):  passed! 🎉
div_check_16(int128,int128):  passed! 🎉
pow_check_7(int128,uint256):  passed! 🎉
neg_check_7(int128,int128):  passed! 🎉
sub_check_3():  passed! 🎉
ln_check_4(int128,int128):  passed! 🎉
sqrt_check_5(int128):  passed! 🎉
div_check_15():  passed! 🎉
sub_check_9(int128,int128):  passed! 🎉
to128x128(int128):  passed! 🎉
inv_check_5():  passed! 🎉
neg_check_3(int128):  passed! 🎉
sub_check_6():  passed! 🎉
add_check():  passed! 🎉
mulu_check_9(uint256):  passed! 🎉
fromUInt_check_2(uint256):  passed! 🎉
divi_check_5():  passed! 🎉
mulu(int128,uint256):  passed! 🎉
divu_check_12(uint256):  passed! 🎉
muli_check_2():  passed! 🎉
exp_2_check_2(int128,int128):  passed! 🎉
divu_check_17(uint256,uint256,uint256):  passed! 🎉
div_check(int128,int128):  passed! 🎉
gavg(int128,int128):  passed! 🎉
mul_check_11():  passed! 🎉
exp_2(int128):  passed! 🎉
divu(uint256,uint256):  passed! 🎉
gavg_check_14(int128,int128):  passed! 🎉
divu_check_9(uint256):  passed! 🎉
sub_check_10(int128,int128):  passed! 🎉
AssertionFailed(..):  passed! 🎉

Unique instructions: 34700
Unique codehashes: 1
Corpus size: 495
Seed: -2962161396586965879
```
    