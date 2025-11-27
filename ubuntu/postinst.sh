#!/bin/sh

set -e

case "$1" in
    configure)

        # --- 在这里添加您的初始化命令 ---
        dotnet /opt/renv/bin/R#.dll --reset
        dotnet /opt/renv/bin/R#.dll --setup
        dotnet /opt/renv/bin/R#.dll /linux-bash

        chmod +x /opt/renv/bin/R#

        R# --install.packages /opt/renv/packages/REnv.zip

        ;;

    abort-upgrade|abort-remove|abort-deconfigure)
        ;;

    *)
        echo "postinst called with unknown argument \`$1'" >&2
        exit 1
        ;;
esac

exit 0