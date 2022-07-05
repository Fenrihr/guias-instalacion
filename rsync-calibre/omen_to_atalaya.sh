#!/bin/bash
rsync -r -t -v --progress --delete -c -s '/home/francisco/Biblioteca Atalaya/' /run/user/1000/gvfs/smb-share:server=atalaya,share=lectura/calibredb/
