#!/bin/bash

app_name=nginx-rtmp
app_version=latest

dokcer build -t ncc0706/${app_name}:${app_version}