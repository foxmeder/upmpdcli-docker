#!/usr/bin/env bash
service upmpdcli start && tail -f /var/log/upmpd.log
