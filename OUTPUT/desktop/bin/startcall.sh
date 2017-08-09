## Options:
##   --verbose, -v  Verbose mode
##   --dial=number  Output filename


source easyoptions || exit
rm msd.gser
python fillmsd.py
./ffasn1dump msd.asn -I gser ECallMessage msd.gser -O aper msd.per
./linphonec -s "${dial}"


