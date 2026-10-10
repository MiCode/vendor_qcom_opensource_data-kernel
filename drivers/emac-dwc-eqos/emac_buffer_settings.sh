#!/vendor/bin/sh
#Copyright (c) 2019, The Linux Foundation. All rights reserved.
#
#This program is free software; you can redistribute it and/or modify
#it under the terms of the GNU General Public License version 2 and
#only version 2 as published by the Free Software Foundation.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#
echo 67108864 > /proc/sys/net/core/rmem_max;
echo 67108864 > /proc/sys/net/core/wmem_max;
echo 4096 87380 33554432 > /proc/sys/net/ipv4/tcp_rmem;
echo 4096 87380 33554432 > /proc/sys/net/ipv4/tcp_wmem;
echo 50000000 > /proc/sys/net/ipv4/ipfrag_high_thresh;
echo 2 > /proc/sys/net/ipv4/ipfrag_time;
echo 0 > /proc/sys/net/ipv4/tcp_timestamps;

