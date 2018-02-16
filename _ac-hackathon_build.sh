#! /bin/sh

# Applied Cyber Hackathon Scan-Build Wrapper Script
# =================================================
# This script runs tools which configure the project to build on your machine.
# It then runs a custom version of scan-build; scan-build runs static analysis
# on the code as it complies. The output is saved to a log file in this working
# directory, each scan's log file is indexed by the datetime that the scan was
# started.

autoreconf -i -v -f
./configure
datetime_startrun=$(date +"%Y%m%d%H%M%S")

# Please note that scan-build has many interesting flags to run deeper analysis
# of programs. These flags are not enabled by default, so participants are
# encouraged to run `scan-build -h` and look through what the tool has to
# offer. You can enable these flags by editing the line below.
scan-build -o /vagrant_data/scan make 2>&1 | tee -a "${datetime_startrun}_scan.log"
