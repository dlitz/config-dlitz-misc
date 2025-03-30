            # Code duplicated between postinst and postrm scripts
            db_fget config-dlitz-wireguard-perms/statoverride applied-to-parent-dir
            applied_to_parent_dir="$RET"
            db_fget config-dlitz-wireguard-perms/statoverride applied-to-keys-dir
            applied_to_keys_dir="$RET"

            if [ "$applied_to_keys_dir" = true ] && \
                dpkg-statoverride --list /etc/wireguard/keys 2>&1 | grep -q 'root systemd-network 2750'
            then
                if [ -e /etc/wireguard/keys ]; then
                    chgrp root /etc/wireguard/keys
                    chmod g-s /etc/wireguard/keys
                    chmod 700 /etc/wireguard/keys
                fi
                dpkg-statoverride --remove /etc/wireguard/keys
                db_fset config-dlitz-wireguard-perms/statoverride applied-to-keys-dir false
            fi

            if [ "$applied_to_parent_dir" = true ] && \
                dpkg-statoverride --list /etc/wireguard 2>&1 | grep -q 'root systemd-network 710'
            then
                if [ -e /etc/wireguard ]; then
                    chgrp root /etc/wireguard
                    chmod 700 /etc/wireguard
                fi
                dpkg-statoverride --remove /etc/wireguard
                db_fset config-dlitz-wireguard-perms/statoverride applied-to-parent-dir false
            fi
