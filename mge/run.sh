#!/bin/sh

BASE_DIR=/home/tf2user/tf2servers
SERVER_DIR=mge

$BASE_DIR/$SERVER_DIR/tf2/srcds_run \
    -pidfile $BASE_DIR/$SERVER_DIR/srcds.pid \
    -console \
    -game tf \
    +sv_pure 2 \
    +map mge_oihguv_sucks_a12 \
    -nobots \
    +maxplayers 24 \
    -ip 41.76.108.31 \
    -port 27017 \
    +clientport 27007 \
    -strictportbind \
    -nohltv \
    -autoupdate \
    -steam_dir $BASE_DIR/steamcmd \
    -steamcmd_script $BASE_DIR/$SERVER_DIR/tf2_ds.txt \
    +sv_shutdown_timeout_minutes 15
