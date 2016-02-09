#!/usr/bin/env bash
find .vagrant -name private_key | xargs ssh-add
