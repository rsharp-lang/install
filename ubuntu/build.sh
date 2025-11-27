mkdir -p /tmp/renv_packaging
cd /tmp/renv_packaging

mkdir -p renv-pkg/DEBIAN
mkdir -p renv-pkg/opt/renv/bin

/bin/cp -rf /mnt/renv/net8.0/* renv-pkg/opt/renv/bin/

cat > renv-pkg/DEBIAN/control << EOF
Package: rsharp
Version: 1.0.0
Section: utils
Priority: optional
Architecture: amd64
Depends: dotnet-sdk-8.0 (>= 8.0.110)
Maintainer: xieguigang <xieguigang@metabolomics.ac.cn>
Description: R# runtime environment 
  This package contains a set of command-line tools for managing
  a specific R environment. It installs the necessary executables
  into /opt/renv/bin.
EOF 

dpkg-deb --build renv-pkg
mv renv-pkg.deb renv_1.0.0_amd64.deb

# dpkg -i renv_1.0.0_amd64.deb