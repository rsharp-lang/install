#!/bin/sh
# postrm script for renv-tools

set -e
PROFILE_D_FILE="/etc/profile.d/rsharp.sh"

case "$1" in
    remove|purge)

        if [ -f "${PROFILE_D_FILE}" ]; then
            echo "  -> removes environment file ${PROFILE_D_FILE}..."
            rm -f "${PROFILE_D_FILE}"
        fi
        ;;

    upgrade|failed-upgrade|abort-install|abort-upgrade|disappear)
        ;;

    *)
        
        exit 1
        ;;
esac

exit 0