## Options:
##   --verbose, -v  Verbose mode
##   --dial=number  Output filename


source easyoptions || exit
./ffasn1dump msd.asn -I gser ECallMessage msd.gser -O aper msd.per
./linphonec -s "${dial}"


