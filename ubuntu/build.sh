mkdir -p ./packaging
cd ./packaging

mkdir -p renv-pkg/DEBIAN
mkdir -p renv-pkg/opt/renv/bin

/bin/cp -rf /mnt/renv/net8.0/* renv-pkg/opt/renv/bin/

cat "Package: rsharp
Version: 1.0.0
Section: utils
Priority: optional
Architecture: amd64
Depends: dotnet-sdk-8.0 (>= 8.0.110),
         libc6 (>= 2.39),
         libgcc-s1 (>= 14.2.0),
         libgssapi-krb5-2 (>= 1.21.3),
         libicu74 (>= 74.2),
         libssl3 (>= 3.0.13),
         libstdc++6 (>= 14.2.0),
         tzdata (>= 2024a),
         zlib1g (>= 1.3)
Maintainer: xieguigang <xieguigang@metabolomics.ac.cn>
Description: R# runtime environment 
  This package contains a set of command-line tools for managing
  a specific R environment. It installs the necessary executables
  into /opt/renv/bin.
" > renv-pkg/DEBIAN/control

dpkg-deb --build renv-pkg
mv renv-pkg.deb renv_1.0.0_amd64.deb

# dpkg -i renv_1.0.0_amd64.deb