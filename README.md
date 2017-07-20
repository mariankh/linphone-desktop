OpenIVS is a prototype implementation of the NG112 compatible IVS.
A modified linphone is used for initiating the NG112 eCall and providing voice communication between the vehicle and OpenPSAP.​
Instructions are provided to how to setup the linphone on various platforms and then change the appropriate file to enable the NG112.

![Dialer screenshot](http://web.cut.ac.cy/iotlab/wp-content/uploads/sites/59/2017/04/20170620_104250.jpg)

# Getting started

Here are the general instructions to build linphone for desktop. The specific instructions for each build platform is described just below.

1. Install some build tools: CMake, Python, intltool, shtool
2. Prepare the build by running the prepare.py script.
3. Build the project using the appropriate build tool (make, ninja, Xcode, Visual Studio).

## Specific instructions for the Linux platform

1. Prepare the build in a terminal by running the following command in the current directory:
        ./prepare.py
2. Build the project in a terminal with:
        make


## Specific instructions for the Raspberry PI platform
1. Install Build tools using:

apt-get install cmake
apt-get install intltool
apt-get install shtool 

2. Prepare the build in a terminal by running the following command in the current directory:
        ./prepare.py
If errors persist regarding ./prepare.py with compilers set their path
./prepare.py -DCMAKE_C_COMPILER=/usr/bin/gcc-4.9 -DCMAKE_CXX_COMPILER=/usr/bin/g++-4.9



3. Build the project in a terminal with:
        make
        make install


## Specific instructions for the Windows platform

1. Open a Windows command line (cmd.exe) in the current directory and run:
        python prepare.py
2. Open the generated Visual Studio solution (WORK/cmake/Project.sln) and build it.

## Specific instructions for the Mac OS X platform

1. Open iTerm.app in the current directory and run:
        ./prepare.py
2. Build the project with:
        make

# Customizing your build

Some options can be given during the `prepare.py` step to customize the build. The basic usage of the `prepare.py` script is:

        ./prepare.py [options]

Here are the main options you can use.

## Building with debug symbols

Building with debug symbols is necessary if you want to be able to debug the application using some tools like GDB or the Visual Studio debugger. To do so, pass the `--debug` option to `prepare.py`:

        ./prepare.py --debug [other options]

## Generating an installation package (on Windows and Mac OS X platforms)

You might want to generate an installation package to ease the distribution of the application. To add the package generation step to the build just run:

        ./prepare.py --package [other options]

## Activate the build of all codecs

        ./prepare.py --all-codecs

## Using more advanced options

The `prepare.py` script is wrapper around CMake. Therefore you can give any CMake option to the `prepare.py` script.
To get a list of the options you can pass, you can run:

        ./prepare.py --list-cmake-variables

The options that enable you to configure what will be built are the ones beginning with "ENABLE_". So for example, you might want to build linphone without the opus codec support. To do so use:

        ./prepare.py -DENABLE_OPUS=NO

# Updating your build

Simply re-building using the appropriate tool corresponding to your platform (make, Visual Studio...) should be sufficient to update the build (after having updated the source code via git).
However if the compilation fails, you may need to rebuild everything from scratch using:

        ./prepare.py -C && ./prepare.py [options]

Then you re-build as usual.

# Enabling the NG112

Replace the file sal_op_call.c  in submodules/linphone/coreapi/bellesip_sal with the sal_op_call.c file available in linphonemodificationfiles folder
Re-build the project with:
        make

Copy the of the files from the  linphonemodificationfiles folder to the the /OUTPUT/desktop/bin folder and run

        bash startcall.sh --dial=500 

 To make a call to number 500.

# Details regarding the files provided


sal_op_call.c
The modified linphone file. To enable the NG112 functionality you need to replace this file with the one provided.

invitefile.txt
This is the template for the SIP invite

startcall.sh
Starts the call and takes as argument the number to be called. (e.g startcall.sh --dial=500

msd.gser
This includes the msd in a readable format

ffasn1dump
This is used to encode and decode the msd








