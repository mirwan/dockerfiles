# Configure the Xymon client settings.

# You MUST set the list of Xymon servers that this
# client reports to.
# It is good to use IP-addresses here instead of DNS
# names - DNS might not work if there's a problem.
#
# E.g. (a single Xymon server)
#   XYMONSERVERS="192.168.1.1"
# or (multiple servers)
#   XYMONSERVERS="10.0.0.1 192.168.1.1"

XYMONSERVERS="127.0.0.1"

# The defaults usually suffice for the rest of this file,
# but you can tweak the hostname that the client reports
# data with, and the OS name used (typically needed only on
# RHEL or RHAS servers).

# CLIENTHOSTNAME=""
# CLIENTOS="rhel3"

CLIENTHOSTNAME="{{ HOSTNAME }}"

