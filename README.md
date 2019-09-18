# Enigma Project #

Turing BE Mod 1

### Functionality ###

Currently, my Enigma class with encrypt and decrypt methods work successfully. Encrypt/decrypt command line interfaces successfully implemented as specified in the interaction pattern.

On branch `cracked2`, much of the cracking functionality is started, including the command line interface. However the algorithm to find the key is not working and needs to be refactored.

Enigma Class with encrypt and decrypt methods successfully implemented.

Score estimate: 3

### Object Oriented Programming ###

All my classes have single responsibilities and a shiftable.rb module creates shared methods for the encryption.rb and decryption.rb classes to use. Only 2 methods have more than 7 lines of code. No class is longer than 100 lines. To me, right now, variable names are clear in what they do.

Score estimate: 3

### Test Driven Development ###

My testing covers every method. I wrote tests first before implementing code, though at the beginning of this project as I was learning how to stub instance variables in tests, I tested around the parameters of what I expected instead of an exact output. After implementing `.instance_variable_set` I was able to better test my methods. Test names are either exactly the method they're testing or a clear explanation of what's being tested.


```
.......................

Fabulous run in 0.005141s, 4473.8378 runs/s, 6029.9554 assertions/s.

23 runs, 31 assertions, 0 failures, 0 errors, 0 skips
Coverage report generated for Unit Tests to /Users/alicepost/turing/1module/enigma/coverage. 199 / 199 LOC (100.0%) covered.
```

Score estimate: 4

### Version Control ###

I have 59 commits and counting. 11 Pull requests. All commit messages are for single pieces of functionality.

Score estimate: 3
