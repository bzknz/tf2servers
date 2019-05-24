# RSA Fortress config

## Base setup (Ubuntu 18.04)

Create a user account with sudo privileges and log in as this user.

Clone the repo into `~/tf2servers`

```bash
# Install required packages
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install curl mailutils util-linux tmux lib32z1 lib32ncurses5 libbz2-1.0:i386 lib32gcc1 lib32stdc++6 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386

# Install Steam
cd ~/tf2servers
mkdir steamcmd && cd steamcmd
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
tar zxf steamcmd_linux.tar.gz
rm steamcmd_linux.tar.gz
cp ./steamclient.so ~/.steam/sdk32/ # needed?
cd ..

# Install TF2 for each server
./update.sh
```

## Pub server setup

```bash
# MetaMod
cd ~/tf2servers/pub
wget https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-linux.tar.gz
tar -C tf2/tf -xzf mmsource-1.10.7-git968-linux.tar.gz
rm mmsource-1.10.7-git968-linux.tar.gz

# SourceMod
cd ~/tf2servers/pub
wget https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6275-linux.tar.gz
tar -C tf2/tf -xzf sourcemod-1.9.0-git6275-linux.tar.gz
rm sourcemod-1.9.0-git6275-linux.tar.gz
cd tf2/tf/addons/sourcemod/plugins
mv nextmap.smx disabled/
mv funvotes.smx disabled/
mv funcommands.smx disabled/
ln -s ~/tf2servers/pub/tf2/tf/cfg/mapcycle.txt ~/tf2servers/pub/tf2/tf/addons/sourcemod/configs/adminmenu_maplist.ini

# NativeVotes
cd ~/tf2servers/pub/tf2/tf/addons/sourcemod/plugins
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156557&d=1469986519"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156558&d=1469986519"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156414&d=1469403994"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156415&d=1469404008"
```

## Mix server setup

```bash
# MetaMod
cd ~/tf2servers/mix
wget https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-linux.tar.gz
tar -C tf2/tf -xzf mmsource-1.10.7-git968-linux.tar.gz
rm mmsource-1.10.7-git968-linux.tar.gz

# SourceMod
cd ~/tf2servers/mix
wget https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6275-linux.tar.gz
tar -C tf2/tf -xzf sourcemod-1.9.0-git6275-linux.tar.gz
rm sourcemod-1.9.0-git6275-linux.tar.gz
cd tf2/tf/addons/sourcemod/plugins/
mv nextmap.smx disabled/
mv funvotes.smx disabled/
mv funcommands.smx disabled/
ln -s ~/tf2servers/mix/tf2/tf/cfg/mapcycle.txt ~/tf2servers/mix/tf2/tf/addons/sourcemod/configs/adminmenu_maplist.ini

# SOAP-TF2DM
cd ~/tf2servers/mix
wget https://codeload.github.com/Lange/SOAP-TF2DM/zip/master
unzip master
cp -r SOAP-TF2DM-master/addons/* tf2/tf/addons/
cp -r SOAP-TF2DM-master/cfg/* tf2/tf/cfg/
rm -R SOAP-TF2DM-master/
rm master
# Map spawn points (they might exist in a later update of SOAP-TF2DM)
cd tf2/tf/addons/sourcemod/configs/soap/
cp cp_reckoner_rc3.cfg cp_reckoner_rc4a.cfg
cp cp cp_prolands_b6.cfg cp_prolands_rc2t.cfg
cp koth_product_rc9.cfg koth_product_rcx.cfg
cp cp_propaganda_b14.cfg cp_propaganda_b15.cfg

# MedicStats
cd ~/tf2servers/mix
wget http://sourcemod.krus.dk/medicstats.zip
unzip medicstats.zip
mv medicstats.smx tf2/tf/addons/sourcemod/plugins/
rm medicstats.zip

# SupStats2
cd ~/tf2servers/mix
wget http://sourcemod.krus.dk/supstats2.zip
mv supstats2.smx tf2/tf/addons/sourcemod/plugins/
rm supstats2.zip

# LogsTF
# Generate API key: http://logs.tf/uploader
# Add the API key to server.cfg:
# logstf_apikey <apiKey>
cd ~/tf2servers/mix
wget http://sourcemod.krus.dk/logstf.zip
unzip logstf.zip
mv logstf.smx tf2/tf/addons/sourcemod/plugins/
rm logstf.zip

# sourcemod-curl-extension (for LogsTF)
# https://forums.alliedmods.net/showthread.php?t=152216
cd ~/tf2servers/mix
wget http://csgottt.com/curl.zip
unzip curl.zip
cp -r extensions/* tf2/tf/addons/sourcemod/extensions/
cp -r plugins/* tf2/tf/addons/sourcemod/plugins/
cp -r scripting/* tf2/tf/addons/sourcemod/scripting/
rm -r extensions/ plugins/ scripting/ curl.zip
mv tf2/tf/addons/sourcemod/plugins/curl_self_test.smx tf2/tf/addons/sourcemod/plugins/disabled/

# Pause plugin (5 sec countdown on unpause, restores ÜberCharge)
# https://www.reddit.com/r/truetf2/comments/9us0yi/updated_pause_plugin_from_rglgg_to_fix_medics/
cd ~/tf2servers/mix
wget https://cdn.discordapp.com/attachments/480167194987331584/508842853389041665/pause.smx
mv pause.smx tf2/tf/addons/sourcemod/plugins/

# AFK plugin
cd ~/tf2servers/mix
wget http://sourcemod.krus.dk/afk.zip
unzip afk.zip
mv afk.smx tf2/tf/addons/sourcemod/plugins/
rm afk.zip

# Restore score
cd ~/tf2servers/mix
wget http://sourcemod.krus.dk/restorescore.zip
unzip restorescore.zip
mv restorescore.smx tf2/tf/addons/sourcemod/plugins/
rm restorescore.zip

# SwapTeam (move to spec)
cd ~/tf2servers/mix
curl "https://forums.alliedmods.net/attachment.php?attachmentid=110181&d=1348956706" --output swapteam.zip
unzip swapteam.zip
cp -r sourcemod/* tf2/tf/addons/sourcemod/
rm -R sourcemod/
rm swapteam.zip

# NativeVotes
cd ~/tf2servers/mix/tf2/tf/addons/sourcemod/plugins
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156557&d=1469986519"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156558&d=1469986519"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156414&d=1469403994"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156415&d=1469404008"

# ETF2L config
cd ~/tf2servers/mix
wget http://etf2l.org/configs/etf2l_configs.zip
unzip etf2l_configs.zip -d tf2/tf/cfg/
rm etf2l_configs.zip

# Custom maps
cd tf2/tf/maps
wget http://fakkelbrigade.eu/maps/cp_cardinal_rc1a.bsp
wget http://fakkelbrigade.eu/maps/cp_follower.bsp
wget http://fakkelbrigade.eu/maps/cp_granary_pro_rc8.bsp
wget http://fakkelbrigade.eu/maps/cp_logjam_rc10a.bsp
wget http://fakkelbrigade.eu/maps/cp_prolands_rc2t.bsp
wget http://fakkelbrigade.eu/maps/cp_propaganda_b15.bsp
wget http://fakkelbrigade.eu/maps/cp_reckoner_rc4a.bsp
wget http://fakkelbrigade.eu/maps/koth_bagel_rc2a.bsp
wget http://fakkelbrigade.eu/maps/koth_product_rcx.bsp
```

## MGE/Ultiduo server setup

```bash
# MetaMod
cd ~/tf2servers/mge
wget https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-linux.tar.gz
tar -C tf2/tf -xzf mmsource-1.10.7-git968-linux.tar.gz
rm mmsource-1.10.7-git968-linux.tar.gz

# SourceMod
cd ~/tf2servers/mix
wget https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6275-linux.tar.gz
tar -C tf2/tf -xzf sourcemod-1.9.0-git6275-linux.tar.gz
rm sourcemod-1.9.0-git6275-linux.tar.gz
cd tf2/tf/addons/sourcemod/plugins/
mv nextmap.smx disabled/
mv funvotes.smx disabled/
mv funcommands.smx disabled/
ln -s ~/tf2servers/mix/tf2/tf/cfg/mapcycle.txt ~/tf2servers/mix/tf2/tf/addons/sourcemod/configs/adminmenu_maplist.ini

# MGEMod
cd ~/tf2servers/mge
wget https://codeload.github.com/Lange/MGEMod/zip/master
unzip master
cp MGEMod-master/maps/* tf2/tf/maps/
cp -r MGEMod-master/addons/* tf2/tf/addons/
rm -R MGEMod-master/
rm master
cd tf2/tf/maps
wget http://fakkelbrigade.eu/maps/mge_oihguv_sucks_a12.bsp

# NativeVotes
cd ~/tf2servers/mge/tf2/tf/addons/sourcemod/plugins
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156557&d=1469986519"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156558&d=1469986519"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156414&d=1469403994"
curl -JLO "https://forums.alliedmods.net/attachment.php?attachmentid=156415&d=1469404008"

# Ultiduo
cd ~/tf2servers/mge/tf2/tf/cfg
wget http://etf2l.org/configs/etf2l_configs.zip
unzip etf2l_configs.zip
rm etf2l_configs.zip
cd ../maps
wget http://fakkelbrigade.eu/maps/koth_ultiduo_r_b7.bsp
wget http://fakkelbrigade.eu/maps/ultiduo_baloo_v2.bsp
wget http://fakkelbrigade.eu/maps/ultiduo_grove_b4.bsp
wget http://fakkelbrigade.eu/maps/ultiduo_gullywash_b2.bsp
wget http://fakkelbrigade.eu/maps/ultiduo_seclusion_b3.bsp
```

## Service files

```bash
sudo cp ./pub/tf2pub.service /etc/systemd/system/tf2pub.service
sudo cp ./mix/tf2mix.service /etc/systemd/system/tf2mix.service
sudo cp ./mge/tf2mge.service /etc/systemd/system/tf2mge.service
sudo systemctl daemon-reload
sudo systemctl enable tf2pub.service
sudo systemctl start tf2pub.service
sudo systemctl enable tf2mix.service
sudo systemctl start tf2mix.service
sudo systemctl enable tf2mge.service
sudo systemctl start tf2mge.service
```

## Cron

Add this to root's crontab (`sudo crontab -e`):

`0 5 * * * systemctl restart tf2pub.service tf2mix.service tf2mge.service`

## Resources

- https://developer.valvesoftware.com/wiki/List_of_TF2_console_commands_and_variables
- https://wiki.teamfortress.com/wiki/Linux_dedicated_server
- http://fakkelbrigade.eu/maps/

### NativeVotes

- https://forums.alliedmods.net/showpost.php?p=2439346&postcount=239
- https://forums.alliedmods.net/showpost.php?p=2441108&postcount=245
