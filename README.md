
# CAREX - Trail of Bits - Echidna - Workshop

This project is a culmination of a week long Workshop, carried out in collaboration of Secureum and Trail of Bits, titled CAREX Echidna. 

The essence of the project is to test the ABDK Library for Solidity - ABDK 64.64 (https://github.com/abdk-consulting/abdk-libraries-solidity).

The library consists of mathematical functions operating with signed 64.64-bit fixed point numbers.

The goal of the project was to utilize, Echidna (https://github.com/crytic/echidna), a Smart Contract Fuzzer and get familiar with the tool and testing methodology.



## Screenshots

![App Screenshot](https://github.com/i01001/CAREX_Echidna_Workshop/blob/main/Echidna%20Test%20Screenshot.png)


## Features

- Over 200 Test functions were written and many more assertions
- Testing was carried out multiple times with 50K and 100k limits
- Incorporated many different mathematical, arithmetic properties and also cross used multiple functions as well 

- Test results run on Computer are on ./Results.md (https://github.com/i01001/CAREX_Echidna_Workshop/blob/main/Results.md)
- Test results from Echidna Github actions is located within ./Echidna_Github_Action_Logs (https://github.com/i01001/CAREX_Echidna_Workshop/tree/main/Echidna_Github_Action_Logs)
- Corpus-Magic files for coverage is located in ./corpus-magic (https://github.com/i01001/CAREX_Echidna_Workshop/tree/main/corpus-magic)

## Authors

- [@IkhlasMohammad](https://github.com/i01001)


## Usage/Examples

Each Test Function has a description in the @notice explaining the assertion or test being carried out as well as the input parameters types explained. 

```javascript
  /**
 @notice Function verifies the divu((divu(x, y)), z) == (divu((divu(x, z)), y. For precision, taken abs difference to be less than 1. 
 @notice For all values above 8 for input
 @param x unsigned 256-bit integer number
 @param y unsigned 256-bit integer number
 @param z unsigned 256-bit integer number
*/
  function divu_check_16(
    uint256 x,
    uint256 y,
    uint256 z
  ) public {
    uint256 eighti = toUInt(eight);
    if (
      (z >= eighti) &&
      (y >= eighti) &&
      (x >= eighti) &&
      (z <= MAX_U256) &&
      (y <= MAX_U256) &&
      (x <= MAX_U256)
    ) {
      try this.divu(x, y) {
        uint256 t = toUInt(divu(x, y));
        try this.divu(t, z) {
          assert(
            abs(
              sub(divu(toUInt(divu(x, y)), z), (divu(toUInt(divu(x, z)), y)))
            ) <=
              one &&
              abs(
                sub(divu(toUInt(divu(x, y)), z), (divu(toUInt(divu(x, z)), y)))
              ) <=
              one
          );
          int128 w = divu(toUInt(divu(x, y)), z);

          assert((fromUInt(x) >= ((mul((mul(w, fromUInt(z))), fromUInt(y))))));
        } catch {}
      } catch {}
    }
  }
```


## Run Locally

Clone the project

```bash
  git clone https://github.com/i01001/CAREX_Echidna_Workshop
```

Go to the project directory

```bash
  cd CAREX_Echidna_Workshop
```


## Running Tests

To run tests, run the following command after cloning the repository. Changes can be done to config file as required

```bash
  ./echidna-test Echidna-CAREX.sol --contract Test --config config.yaml --seq-len 1
```



## Optimizations

I tried to use as many different mathematical properties to verify the library functions thoroughly.

Further optimization of certain asserts with precision margins can be further optimized and tests can be carried for even greater number of times. 

## Tech Stack

**Client:** Solidity, Echidna 




## Acknowledgements

 - A big Thank You to Secureum and Trail of Bits Team for organizing this workshop and letting me be a part of it!
 - Special Thanks to Mr Gustavo for reviewing, providing feeback and supporting through 1 on 1 conversation through DM and also through office hours



## Feedback

If you have any feedback, please reach out to me on my email ikhlaskhan007@gmail.com or on Discord i0001#3442

