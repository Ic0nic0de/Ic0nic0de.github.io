#!/bin/bash
dpkg-scanpackages ./debs > Packages -m
bzip2 -fks Packages
