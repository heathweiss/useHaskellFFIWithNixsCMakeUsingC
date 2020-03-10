Create a c exe that imports the library created in the supplyHaskellFFIWithNixsCMake project.
The library is supplied by nix.

Will be build using cmake, but not using nix.

echo $CMAKE_PREFIX_PATH'
#include <message.h>