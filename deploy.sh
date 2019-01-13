#!/usr/bin/env bash
hugo && rsync -avz --delete --exclude="/.well-known" public/ kilkenny:~/litvinenko.info