#!/bin/bash

sudo /bin/systemctl restart httpd.service

echo "***************************"
echo "* journalctl output       *"
echo "***************************"
sudo /bin/journalctl -u httpd.service --since today --no-pager

echo "********************"
echo "* systemctl status *"
echo "********************"
sudo /bin/systemctl status httpd.service -l --no-pager


echo "***************"
echo "* httpd -S    *"
echo "***************"

sudo /sbin/httpd -S


