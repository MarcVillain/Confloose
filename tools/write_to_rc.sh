#!/bin/sh

write_to_rc()
{
    _write_to_rc()
    {
        tee -a ~/.bashrc ~/.bash_profile 2>&1 1>/dev/null
    }

    _write_to_rc <<< $(echo "# === Confloose === #")
    _write_to_rc <&0
    _write_to_rc <<< $(echo "# ================= #")
}
