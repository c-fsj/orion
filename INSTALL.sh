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
sudo apt-get install python python-dev python-pip-whl python3 python3-pip build-essential docker.io docker-compose docker-registry testresources default-jdk -y

# 1. DATASPLOIT

echo "\nProgreso (======                                 - 15%)\n"
echo "\nInstalando DataSploit...\n"
sudo git clone https://github.com/Datasploit/datasploit
cd datasploit
sudo pip install -r requirements.txt
sudo mv config_sample.py config.py
cd ..
# python datasploit.py


# 2. DMitry

echo "\nProgreso (========                               - 20%)\n"
echo "\nInstalando DMitry...\n"
sudo apt-get install dmitry -y

# 3. ExifTool

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

# 4. FOCA

echo "\nProgreso (============                           - 30%)\n"
echo "\nInstalando FOCA...\n"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
sudo apt-get install wine winetricks mssql-server -y
sudo winetricks dotnet461 gdiplus fontfix
sudo git clone https://github.com/c-fsj/orion/tree/main/tools/foca
sudo /opt/mssql/bin/mssql-conf setup
sudo cp /mnt/software/foca/bin/foca /usr/local/bin/foca
sudo chmod 755 /usr/local/bin/foca
sudo chown root:root /usr/local/bin/foca
sudo export PATH=$PATH:/usr/local/bin/foca
# wine /mnt/software/foca/FOCA.exe


# 5. Infoga

echo "\nProgreso (==============                         - 35%)\n"
echo "\nInstalando Infoga...\n"
sudo git clone https://github.com/m4ll0k/Infoga
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


# 6. Instagram Scraper

echo "\nProgreso (================                       - 40%)\n"
echo "\nInstalando Instagram Scraper...\n"
sudo pip3 install instagram-scraper


# 7. Maltego

echo "\nProgreso (==================                     - 45%)\n"
echo "\nInstalando Maltego...\n"
wget https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.2.19.13940.deb
sudo dpkg -i Maltego.v4.2.19.13940.deb


# 8. Maryam

echo "\nProgreso (====================                   - 50%)\n"
echo "\nInstalando Maryam...\n"
sudo pip3 install maryam


# 9. Metagoofil

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

# 10. OSINT-SPY

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

# 11. OSRFramework

echo "\nProgreso (==========================             - 65%)\n"
echo "\nInstalando OSRFramework...\n"
sudo pip3 install osrframework

# 12. ReconSpider

echo "\nProgreso (============================           - 70%)\n"
echo "\nInstalando ReconSpider...\n"
sudo git clone https://github.com/bhavsec/reconspider
cd reconspider
sudo python3 setup.py install
sudo mkdir db
cd db
sudo git clone https://github.com/c-fsj/orion/tree/main/tools/reconspider/ip2location-downloader-linux
perl ip2location-downloader-linux/download.pl
cd ..\..

# 13. Recon-ng

echo "\nProgreso (==============================         - 75%)\n"
echo "\nInstalando Recon-ng...\n"
sudo apt-get install recon-ng -y


# 14. Sherlock

echo "\nProgreso (================================      - 80%)\n"
echo "\nInstalando Sherlock...\n"
sudo git clone https://github.com/sherlock-project/sherlock
cd sherlock
sudo python3 -m pip install -r requirements.txt
cd ..
# python3 sherlock


# 15. Spiderfoot

echo "\nProgreso (==================================     - 85%)\n"
echo "\nInstalando Spiderfoot...\n"
sudo git clone https://github.com/smicallef/spiderfoot
cd spiderfoot
sudo pip3 install -r requirements.txt
cd ..
# python3 ./sf.py -l 127.0.0.1:5001


# 16. SpyScrap

echo "\nProgreso (====================================   - 90%)\n"
echo "\nInstalando SpyScrap...\n"
sudo docker build -t spyscrap .
# docker run -ti -v /PATH/TO/SpyScrap/src/data:/spyscrap/data spyscrap  [options]

# 17. TheHarvester

echo "\nProgreso (====================================== - 95%)\n"
echo "\nInstalando TheHarvester...\n"
sudo git clone https://github.com/laramies/theHarvester
cd theHarvester
sudo python3 -m pip install -r requirements/base.txt
cd ..
# python3 theHarvester.py -h


echo "\nProgreso (====================================== - 100%)\n"
echo "\n¡Hemos terminado! ¡Disfruta de ORION!"

exit
