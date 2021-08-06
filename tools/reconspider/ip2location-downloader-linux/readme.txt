###############################################################################
# README if you have problem to validate the SSL certificate
#
# Step 1: Download PositiveSSL Trusted Root CA Certificate from 
#         https://www.ip2location.com/downloads/positivessl.ca-bundle
#
# Step 2: Configure environment variable HTTPS_CA_FILE
#
#    Linux:
#    In the terminal running download.pl
#    %> export HTTPS_CA_FILE=<path>positivessl.ca-bundle
#
#    Windows:
#    In the command prompt running "perl download.pl" or download.exe
#    c:\> set HTTPS_CA_FILE=<path>positivessl.ca-bundle
#
# Step 3: Run the download.pl to use the Trusted Root CA for SSL connection
#
###############################################################################