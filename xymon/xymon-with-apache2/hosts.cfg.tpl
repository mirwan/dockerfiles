#
# Master configuration file for Xymon
#
# This file defines several things:
#
# 1) By adding hosts to this file, you define hosts that are monitored by Xymon
# 2) By adding "page", "subpage", "group" definitions, you define the layout
#    of the Xymon webpages, and how hosts are divided among the various webpages
#    that Xymon generates.
# 3) Several other definitions can be done for each host, see the hosts.cfg(5)
#    man-page.
#
# You need to define at least the Xymon server itself here.

#0.0.0.0        .default.       # NOPROPRED:+apt,+libs

#group Servers
127.0.0.1       {{HOSTNAME}}    # bbd http://127.0.0.1/

#group Dialup
#0.0.0.0        notebook.bla.net # noconn dialup
