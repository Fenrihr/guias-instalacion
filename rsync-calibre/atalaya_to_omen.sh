#!/bin/bash
rsync -r -t -v --progress --delete -c -s /run/user/1000/gvfs/smb-share:server=atalaya,share=lectura/calibredb/ '/home/francisco/Biblioteca Atalaya/'
