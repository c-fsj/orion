#!/bin/bash

echo "\n###########################################"
echo "# INSTALADOR DE SOFTWARE OSINT PARA ORION #"
echo "###########################################\n"
echo "\nProgreso (                                       - 0%)\n"

# Creación de carpeta de software

echo "\nProgreso (==                                     - 5%)\n"
echo "\nCreando el directorio /mnt/software...\n"
sudo mkdir /mnt/software
sudo chmod -R 777 /mnt/software
echo "\nViajando al nuevo directorio...\n"
cd /mnt/software


# Preparando el entorno

echo "\nProgreso (====                                   - 10%)\n"
echo "\nInstalando librerías...\n"
sudo apt-get update
sudo apt-get install python python-dev python-pip-whl python3 python3-pip build-essential docker.io docker-compose docker-registry default-jdk git -y
sudo git clone https://github.com/c-fsj/orion


# 1. DMitry

echo "\nProgreso (========                               - 20%)\n"
echo "\nInstalando DMitry...\n"
sudo apt-get install dmitry -y


# 2. ExifTool

echo "\nProgreso (==========                             - 25%)\n"
echo "\nInstalando ExifTool...\n"
wget https://exiftool.org/Image-ExifTool-12.29.tar.gz
sudo chmod 777 Image-ExifTool-12.29.tar.gz
tar -xvzf Image-ExifTool-12.29.tar.gz
cd Image-ExifTool-12.29
sudo perl Makefile.PL
sudo make test
sudo make install
cd ..


# 3. FOCA

echo "\nProgreso (============                           - 30%)\n"
echo "\nInstalando FOCA...\n"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
sudo apt-get install wine winetricks mssql-server -y
winetricks dotnet461 gdiplus fontfix
cp -R /mnt/software/orion/tools/foca /mnt/software
sudo /opt/mssql/bin/mssql-conf setup
sudo cp /mnt/software/foca/bin/foca /usr/local/bin/foca
sudo chmod 755 /usr/local/bin/foca
sudo chown root:root /usr/local/bin/foca
sudo export PATH=$PATH:/usr/local/bin/foca


# 4. Infoga

echo "\nProgreso (==============                         - 35%)\n"
echo "\nInstalando Infoga...\n"
sudo git clone https://github.com/m4ll0k/Infoga
sudo chmod 755 Infoga
sudo chown orion:orion Infoga
cd Infoga
sudo pip3 install setuptools
sudo python setup.py install
cd ..
echo '#!/bin/bash' > /mnt/software/Infoga/infoga && echo 'python3 /mnt/software/Infoga/infoga.py' >> /mnt/software/Infoga/infoga
sudo cp /mnt/software/Infoga/infoga /usr/local/bin/infoga
sudo chmod 755 /usr/local/bin/infoga
sudo chown root:root /usr/local/bin/infoga
export PATH=$PATH:/usr/local/bin/infoga
# python infoga.py


# 5. Instagram Scraper

echo "\nProgreso (================                       - 40%)\n"
echo "\nInstalando Instagram Scraper...\n"
sudo pip3 install instagram-scraper


# 6. Maltego

echo "\nProgreso (==================                     - 45%)\n"
echo "\nInstalando Maltego...\n"
wget https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.2.19.13940.deb
sudo dpkg -i Maltego.v4.2.19.13940.deb


# 7. Maryam

echo "\nProgreso (====================                   - 50%)\n"
echo "\nInstalando Maryam...\n"
sudo pip3 install maryam


# 8. Metagoofil

echo "\nProgreso (======================                 - 55%)\n"
echo "\nInstalando Metagoofil...\n"
sudo git clone https://github.com/opsdisk/metagoofil
cd metagoofil
sudo pip install -r requirements.txt
cd ..
echo '#!/bin/bash' > /mnt/software/metagoofil/metagoofil && echo 'python3 /mnt/software/metagoofil/metagoofil.py' >> /mnt/software/metagoofil/metagoofil
sudo cp /mnt/software/metagoofil/metagoofil /usr/local/bin/metagoofil
sudo chmod 755 /usr/local/bin/metagoofil
sudo chown root:root /usr/local/bin/metagoofil
export PATH=$PATH:/usr/local/bin/metagoofil


# 9. OSINT-SPY

echo "\nProgreso (========================               - 60%)\n"
echo "\nInstalando OSINT-SPY...\n"
sudo git clone https://github.com/SharadKumar97/OSINT-SPY
cd OSINT-SPY
sudo pip install -r requirements.txt
cd ..
echo '#!/bin/bash' > /mnt/software/OSINT-SPY/osint-spy && echo 'python3 /mnt/software/OSINT-SPY/osint-spy.py' >> /mnt/software/OSINT-SPY/osint-spy
sudo cp /mnt/software/OSINT-SPY/osint-spy /usr/local/bin/osint-spy
sudo chmod 755 /usr/local/bin/osint-spy
sudo chown root:root /usr/local/bin/osint-spy
export PATH=$PATH:/usr/local/bin/osint-spy


# 10. OSRFramework

echo "\nProgreso (==========================             - 65%)\n"
echo "\nInstalando OSRFramework...\n"
pip3 install osrframework


# 11. ReconSpider

echo "\nProgreso (============================           - 70%)\n"
echo "\nInstalando ReconSpider...\n"
sudo git clone https://github.com/bhavsec/reconspider
cd reconspider
sudo python3 setup.py install
sudo mkdir db
cd db
cp -R /mnt/software/orion/tools/reconspider/ip2location-downloader-linux /mnt/software/reconspider/db
perl ip2location-downloader-linux/download.pl
cd ..\..
echo '#!/bin/bash' > /mnt/software/reconspider/reconspider && echo 'python3 /mnt/software/reconspider/reconspider.py' >> /mnt/software/reconspider/reconspider
sudo cp /mnt/software/reconspider/reconspider /usr/local/bin/reconspider
sudo chmod 755 /usr/local/bin/reconspider
sudo chown root:root /usr/local/bin/reconspider
export PATH=$PATH:/usr/local/bin/reconspider


# 12. Recon-ng

echo "\nProgreso (==============================         - 75%)\n"
echo "\nInstalando Recon-ng...\n"
sudo apt-get install recon-ng -y


# 13. Sherlock

echo "\nProgreso (================================      - 80%)\n"
echo "\nInstalando Sherlock...\n"
sudo git clone https://github.com/sherlock-project/sherlock
cd sherlock
sudo python3 -m pip install -r requirements.txt
cd ..
echo '#!/bin/bash' > /mnt/software/sherlock/sherlock/sherlock && echo 'python3 /mnt/software/sherlock/sherlock/sherlock.py' >> /mnt/software/sherlock/sherlock/sherlock
sudo cp /mnt/software/sherlock/sherlock/sherlock /usr/local/bin/sherlock
sudo chmod 755 /usr/local/bin/sherlock
sudo chown root:root /usr/local/bin/sherlock
export PATH=$PATH:/usr/local/bin/sherlock
# python3 sherlock


# 14. Spiderfoot

echo "\nProgreso (==================================     - 85%)\n"
echo "\nInstalando Spiderfoot...\n"
sudo git clone https://github.com/smicallef/spiderfoot
cd spiderfoot
sudo pip3 install -r requirements.txt
cd ..
echo '#!/bin/bash' > /mnt/software/spiderfoot/spiderfoot/spiderfoot && echo 'python3 /mnt/software/spiderfoot/sf.py' >> /mnt/software/spiderfoot/spiderfoot/spiderfoot
sudo cp /mnt/software/spiderfoot/spiderfoot/spiderfoot /usr/local/bin/spiderfoot
sudo chmod 755 /usr/local/bin/spiderfoot
sudo chown root:root /usr/local/bin/spiderfoot
export PATH=$PATH:/usr/local/bin/spiderfoot
sudo rm /mnt/software/spiderfoot/sf.py
sudo cp /mnt/software/orion/tools/spiderfoot/sf.py /mnt/software/spiderfoot/sf.py
sudo chmod 755 /mnt/software/spiderfoot/sf.py
sudo chown root:root /mnt/software/spiderfoot/sf.py

# 15. SpyScrap

echo "\nProgreso (====================================   - 90%)\n"
echo "\nInstalando SpyScrap...\n"
sudo git clone https://github.com/RuthGnz/SpyScrap
cd SpyScrap
sudo docker build -t spyscrap .
cd ..
echo '#!/bin/bash' > /mnt/software/SpyScrap/spyscrap && echo 'sudo docker run -ti -v /src/data:/spyscrap/data spyscrap' >> /mnt/software/SpyScrap/spyscrap
sudo cp /mnt/software/SpyScrap/spyscrap /usr/local/bin/spyscrap
sudo chmod 755 /usr/local/bin/spyscrap
sudo chown root:root /usr/local/bin/spyscrap
export PATH=$PATH:/usr/local/bin/spyscrap


# 16. TheHarvester

echo "\nProgreso (====================================== - 95%)\n"
echo "\nInstalando TheHarvester...\n"
sudo git clone https://github.com/laramies/theHarvester
sudo chmod 755 theHarvester
sudo chown orion:orion theHarvester
cd theHarvester
sudo python3 -m pip install -r requirements/base.txt
cd ..
echo '#!/bin/bash' > /mnt/software/theHarvester/theharvester && echo 'python3 /mnt/software/theHarvester/theHarvester.py' >> /mnt/software/theHarvester/theharvester
sudo cp /mnt/software/theHarvester/theharvester /usr/local/bin/theharvester
sudo chmod 755 /usr/local/bin/theharvester
sudo chown root:root /usr/local/bin/theharvester
export PATH=$PATH:/usr/local/bin/theharvester
sudo rm /mnt/software/theHarvester/theHarvester/lib/core.py
sudo cp /mnt/software/orion/tools/theHarvester/lib/core.py /mnt/software/theHarvester/theHarvester/lib/core.py
sudo chmod 744 /mnt/software/theHarvester/theHarvester/lib/core.py
sudo chown root:root /mnt/software/theHarvester/theHarvester/lib/core.py

# 17. Tor Browser

sudo add-apt-repository ppa:micahflee/ppa
sudo apt update
sudo apt install torbrowser-launcher

echo "\nProgreso (====================================== - 100%)\n"
echo "\n¡Hemos terminado! ¡Disfruta de ORION!"

exit
