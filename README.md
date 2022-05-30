
# CAREX - Trail of Bits - Echidna - Workshop

This project is a culmination of a week long Workshop, carried out in collaboration of Secureum and Trail of Bits, titled CAREX Echidna. 

The essence of the project is to test the ABDK Library for Solidity - ABDK 64.64 (https://github.com/abdk-consulting/abdk-libraries-solidity).

The library consists of mathematical functions operating with signed 64.64-bit fixed point numbers.

The goal of the project was to utilize, Echidna (https://github.com/crytic/echidna), a Smart Contract Fuzzer and get familiar with the tool and testing methodology.



## Screenshots

![App Screenshot](https://github.com/i01001/CAREX_Echidna_Workshop/blob/main/Echidna%20Test%20Screenshot.png)


## Features

- Over 200 Test functions and over 500 assert statements were coded
- Testing was carried out multiple times with 50K and 100k limits
- Incorporated many different mathematical, arithmetic properties and also cross used multiple functions as well 

- Test results run on Computer are on ./Results.md (https://github.com/i01001/CAREX_Echidna_Workshop/blob/main/Results.md)
- Test results from Echidna Github actions is located within ./Echidna_Github_Action_Logs (https://github.com/i01001/CAREX_Echidna_Workshop/tree/main/Echidna_Github_Action_Logs)
- Corpus-Magic files for coverage is located in ./corpus-magic (https://github.com/i01001/CAREX_Echidna_Workshop/tree/main/corpus-magic)

## Authors

- [@IkhlasMohammad](https://github.com/i01001)


## Testing Logic 

Each individual test function describes the logic of the function and the assertion. Over here the overview or themes are explained in terms of reasoning.

Please do note that all aspects / logics used are not mentioned here, more details would be within the comments of each test function within the Echidna-CAREX.sol (https://github.com/i01001/CAREX_Echidna_Workshop/blob/main/Echidna-CAREX.sol). 

In order to do a thorough testing, the following logic was used to verify:


### Add / Sub 
- Cross verifies the arithmetic matches up and is correct
- Verifies the return value is within the acceptavble limits (MAX & MIN)
- Check eddge cases of having 1 or more input as MAX or MIN value and trying it with different variables that may or may not trigger an error
- Checks based on the sign of the input, assess whether the output is having the correct sign
- Assess whether adding / subtracting a number from inputs is equivalent to doing the same on the output and whether there is a match
- Taking 3 inputs and then running the function twice for eg add((add(x, y)), z should be equivalent irrespective of the sequence of addition 
- Verify whether adding 2 inputs with second one being made negative is equivalent to doing the subtract function for the same inputs


### Neg / Inv / Abs 
- Neg - verifies whether the negative of all values exist except for MIN
- Neg function is the same as taking the power of 2 and then square root for negativ inputs
- Doing multiples of 2 values' neg and then dividing by one of the input is equivalent to the other input
- Checks the output sign should vary based on the orignal input sign
- Addition of 2 inputs with one of their negative is equivalent to abs of their sum with the other input's negative
- Assorted combination using input and then doing division, multiplication etc to verify the output / input values


### Power / Squareroot
- Checks the output with varying inputs of different values, combination of sign, extremen values such as (Max, Min, zero)
- Checks output being zero when x as input for pow is zero
- Verifying (pow(pow(x, y), z) == pow(x,mul(y,z))
- Verifying (mul(pow(x, y), pow(x, z)) == pow(x,mul(y,z))
- Verifying ((pow(div(x, y), z) == div(pow(x, z), pow(y, z)
- Verifying (div(pow(x, y), pow(x, z)) == pow(x,sub(y,z))


### Exponential / Log 
- Checks the log and Exponential for different values with special attention to values of significance 
- Verifies log_2(mul(x, y)) == add(log_2(x), log_2(y) Similarly for ln and others
- Verifies log_2(div(x, y)) == sub(log_2(x), log_2(y)
- Verifies log_2(pow(x, y)) == mul(log_2(x), (y))
- Verifies pow(2, log_2(x))) == x)
- Verifies (log_2(x) == log_2(y)) when inputs have the same value


### Div / Divu / Divi / Mul / Muli / Mulu
- Cross verifies the arithmetic matches up and is correct
- Verifies the return value is within the acceptavble limits (MAX & MIN)
- Check eddge cases of having 1 or more input as MAX or MIN value and trying it with different variables that may or may not trigger an error
- Also considers special cases when handling zero in denominator for division related functions
- Also tried to check of overflow by adding or subtracting the MAX inputs that were being used with the functions to see if an error or overflow / underflow would be allowed
- Verifies getting the inputs back from the return value for eg checks z / y is equivalent to x where z is mul(x, y)
- Checks based on the sign of the input, assess whether the output is having the correct sign
- Adding / Subtracting numbers to inputs and verifying if making a corresponding change (based on the function) gives the same result 
- Checks with inputs being zero as well
- Taking 3 inputs and then running the function twice for eg mul((mul(x, y)), z should be equivalent irrespective of the sequence of multiplication 
- Varies different input limit strategies to reduce precision issues that is more persistent in smaller numbers
- Flipping the signs on the inputs or taking the absolute and verifying the impact on the output
- Assess the output based on different combination of signs of the inputs 


### Avg / Gavg
- Assessing the output based on different combination of signs of the inputs, ranges as well as being zero
- Assess if abs of x being greater than y, the value of avg should be lower / higher than one and invcase if they have different signs then accordingly the signs on the output as well
- Using different arithmetic to verify for eg multiplying the average with 2 and getting the multiple of the 2 inputs
- Verifying the average of 2 inputs if they are the same is equivalent to taking the average of one of them
- Order in average does not make a difference and that they are equivalent
- Checking if the inputs are exact in value with opposite signs should give the average as zero
- Taking average is equivalent to doing the add function followed by division function


### Conversions - Uint / Int / Integers / Fixed point 
- Verifying the return values are within the acceptable range
- Verifying the sign on return, corresponds to the inputs and based on the conversion 
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
  ./echidna-test EchidnaTest.sol --contract Test --config config.yaml --seq-len 1
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
