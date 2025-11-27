#!/bin/bash

mkdir -p /tmp/renv_packaging
cd /tmp/renv_packaging

mkdir -p renv-pkg/DEBIAN
mkdir -p renv-pkg/opt/renv/bin
mkdir -p renv-pkg/opt/renv/packages

/bin/cp -rf /mnt/renv/net8.0/* renv-pkg/opt/renv/bin/
/bin/cp -rf /mnt/renv/packages/REnv.zip renv-pkg/opt/renv/packages/

cat /mnt/renv/metadata.txt > renv-pkg/DEBIAN/control 
cat /mnt/renv/postinst.sh > renv-pkg/DEBIAN/postinst
cat /mnt/renv/postrm.sh > renv-pkg/DEBIAN/postrm

chmod +x renv-pkg/DEBIAN/postinst
chmod +x renv-pkg/DEBIAN/postrm

dpkg-deb --build renv-pkg
mv renv-pkg.deb renv_1.0.0_amd64.deb

# dpkg -i /tmp/renv_packaging/renv_1.0.0_amd64.deb