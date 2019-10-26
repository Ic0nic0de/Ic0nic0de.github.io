find . -name '.DS_Store' -type f -delete
./dpkg-scanpackages -m ./debs > Packages
bzip2 -c Packages > Packages.bz2
gzip  -c Packages > Packages.gz
