#!/bin/sh

export PATH="/opt/renv/bin:$PATH"
set -e
PROFILE_D_FILE="/etc/profile.d/rsharp.sh"

case "$1" in
    configure)

        # --- 在这里添加您的初始化命令 ---
        dotnet /opt/renv/bin/R#.dll --reset
        dotnet /opt/renv/bin/R#.dll --setup
        dotnet /opt/renv/bin/R#.dll /linux-bash

        chmod +x /opt/renv/bin/R#

        echo "  -> add /opt/renv/bin into system environment PATH..."
        cat > "${PROFILE_D_FILE}" <<'EOF'
# Renvironmnet tools path configuration
# This file is managed by the renv-tools package.
if [ -d "/opt/renv/bin" ]; then
    export PATH="/opt/renv/bin:$PATH"
fi
EOF
        # /var/lib/dpkg/info/rsharp.postinst: 25: source: not found
        # source "${PROFILE_D_FILE}"

        dotnet /opt/renv/bin/R#.dll --install.packages /opt/renv/packages/REnv.zip
        dotnet /opt/renv/bin/R#.dll --install.packages /opt/renv/packages/graphQL.zip
        dotnet /opt/renv/bin/R#.dll --install.packages /opt/renv/packages/Markdown2PDF.zip
        dotnet /opt/renv/bin/R#.dll --install.packages /opt/renv/packages/ggplot.zip
        dotnet /opt/renv/bin/R#.dll --install.packages /opt/renv/packages/LLMs.zip

        ;;

    abort-upgrade|abort-remove|abort-deconfigure)
        ;;

    *)
        echo "postinst called with unknown argument \`$1'" >&2
        exit 1
        ;;
esac

exit 0