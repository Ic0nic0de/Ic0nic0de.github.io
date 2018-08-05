#!/bin/bash
dpkg-scanpackages ./debs > Packages
--multiversion
bzip2 -fks Packages
