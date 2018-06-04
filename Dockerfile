FROM centos:7
MAINTAINER Renato Siqueira <renatoelysiqueira@gmail.com>

COPY repo.sh /tmp/
RUN chmod +x /tmp/repo.sh && ./tmp/repo.sh
RUN yum clean all && yum -y update && sleep 3 
 
RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install htop glances screen fail2ban-server wget sysstat net-tools

# Fixes issue with running systemD inside docker builds 
# From https://github.com/gdraheim/docker-systemctl-replacement
COPY systemctl.py /usr/bin/systemctl.py

RUN cp -f /usr/bin/systemctl /usr/bin/systemctl.original \
    && chmod +x /usr/bin/systemctl.py \
    && cp -f /usr/bin/systemctl.py /usr/bin/systemctl
    
RUN systemctl enable fail2ban.service
RUN chkconfig fail2ban on

RUN yum install -y --nogpg acl apr apr-util audit audit-libs authconfig autogen-libopts basesystem bash bind-libs-lite bind-license binutils biosdevname btrfs-progs bzip2-libs
RUN yum install -y --nogpg ca-certificates centos-logos centos-release chkconfig chrony compat-libtiff3 coreutils cpio cracklib cracklib-dicts cronie cronie-noanacron crontabs cryptsetup-libs cups-libs curl cyrus-imapd cyrus-imapd-utils cyrus-sasl
RUN yum install -y --nogpg cyrus-sasl-lib cyrus-sasl-plain dbus dbus-glib dbus-libs dbus-python dhclient dhcp dhcp-common dhcp-libs dialog diffutils dmidecode dnsmasq dracut dracut-config-rescue dracut-network e2fsprogs e2fsprogs-libs
RUN yum install -y ebtables elfutils-libelf elfutils-libs epel-release ethtool expat festival festival-lib festival-speechtools-libs festvox-slt-arctic-hts file file-libs filesystem findutils fipscheck fipscheck-lib firewalld
RUN yum install -y --nogpg flac-libs fontconfig fontpackages-filesystem freetype fxload gawk gdbm gdbm-devel gettext gettext-libs ghostscript ghostscript-fonts glib2 glibc glibc-common glibc-devel glibc-headers glib-networking gmp
RUN yum install -y --nogpg gnupg2 gnutls gobject-introspection gpgme gpm-libs grep groff-base grub2 grub2-efi grub2-tools grubby gsettings-desktop-schemas gsm gzip hardlink hdparm hostname httpd httpd-tools hwdata info initscripts
RUN yum install -y --nogpg iproute iprutils iptables iptables-services iptables-devel iputils irqbalance jansson jbigkit-libs json-c kbd kbd-misc kernel kernel-devel kernel-headers kernel-tools kernel-tools-libs kexec-tools keyutils-libs kpartx krb5-libs lcms2 less libacl libaio

RUN yum install -y --nogpg libao libassuan libasyncns libattr libblkid libcap libcap-ng libcom_err libcroco libcurl libdaemon libdb libdb-devel libdb-utils libdrm libedit libestr libffi libfontenc libgcc libgcrypt libgomp libgpg-error libgudev1 libICE libidn
RUN yum install -y --nogpg libjpeg-turbo libmnl libmodman libmount libndp libnetfilter_conntrack libnfnetlink libnl3 libnl3-cli libogg libpcap libpciaccess libpipeline libpng libproxy libpwquality libreport-filesystem libselinux libselinux-python libselinux-utils libsemanage libsepol libSM libsndfile
RUN yum install -y --nogpg libsoup libss libssh2 libstdc++ libsysfs libtasn1 libteam libtiff libtiff-devel libtiff-tools libtool-ltdl libunistring libusb libusbx libuser libutempter libuuid libverto libvorbis libX11 libX11-common libXau libxcb libXext libXfont libXi libxml2 libXpm libxslt
RUN yum install -y --nogpg libXt libXtst libzip linux-firmware lm_sensors-libs lockdev logrotate lua lvm2 lvm2-libs lzo mailcap mailman mailx make man-db mariadb mariadb-libs mariadb-server mdadm memtest86+ mgetty microcode_ctl ModemManager-glib mod_ssl mokutil mozjs17 mtools MySQL-python ncurses
RUN yum install -y --nogpg ncurses-base ncurses-libs net-snmp-agent-libs net-snmp-libs nettle net-tools newt newt-python nmap nmap-ncat nspr nss nss-softokn nss-softokn-freebl nss-sysinit nss-tools nss-util ntp ntpdate numactl-libs openldap openssh openssh-clients openssh-server openssl openssl-libs opus
RUN yum install -y --nogpg os-prober p11-kit p11-kit-trust pam parted passwd pciutils pciutils-libs pcre perl perl-Archive-Tar perl-Business-ISBN perl-Business-ISBN-Data perl-Carp perl-CGI perl-Compress-Raw-Bzip2 perl-Compress-Raw-Zlib perl-constant perl-Crypt-OpenSSL-Bignum perl-Crypt-OpenSSL-Random perl-Crypt-OpenSSL-RSA perl-Data-Dumper
RUN yum install -y --nogpg perl-Date-Manip perl-DBD-MySQL perl-DB_File perl-DBI perl-devel perl-Digest perl-Digest-HMAC perl-Digest-MD5 perl-Digest-SHA perl-Encode perl-Encode-Detect perl-Encode-Locale perl-Error perl-Exporter perl-ExtUtils-Install perl-ExtUtils-MakeMaker perl-ExtUtils-Manifest perl-ExtUtils-ParseXS perl-FCGI perl-File-Listing perl-File-Path perl-File-Temp
RUN yum install -y --nogpg perl-Filter perl-Getopt-Long perl-HTML-Parser perl-HTML-Tagset perl-HTTP-Cookies perl-HTTP-Daemon perl-HTTP-Date perl-HTTP-Message perl-HTTP-Negotiate perl-HTTP-Tiny perl-IO-Compress perl-IO-HTML perl-IO-Socket-INET6 perl-IO-Socket-IP perl-IO-Socket-SSL perl-IO-Zlib perl-libs perl-libwww-perl perl-LWP-MediaTypes perl-macros perl-Mail-DKIM
RUN yum install -y --nogpg perl-Mail-IMAPClient perl-Mail-SPF perl-MailTools perl-NetAddr-IP perl-Net-Daemon perl-Net-DNS perl-Net-HTTP perl-Net-LibIDN perl-Net-SMTP-SSL perl-Net-SSLeay perl-Package-Constants perl-parent perl-Parse-RecDescent perl-PathTools perl-PlRPC perl-Pod-Escapes perl-podlators perl-Pod-Perldoc perl-Pod-Simple
RUN yum install -y --nogpg perl-Pod-Usage perl-Scalar-List-Utils perl-Socket perl-Socket6 perl-Storable perl-Sys-Syslog perl-Test-Harness perl-Text-ParseWords perl-threads perl-threads-shared perl-TimeDate perl-Time-HiRes perl-Time-Local perl-URI perl-version perl-WWW-RobotRules php php-bcmath php-cli php-common php-gd php-imap php-mbstring php-mcrypt php-mysql
RUN yum install -y --nogpg php-pdo php-pear php-process php-soap php-tcpdf php-tidy php-xml pinentry pkgconfig plymouth plymouth-core-libs plymouth-scripts policycoreutils polkit polkit-pkla-compat poppler-data popt portreserve postfix postgresql-libs ppp procmail procps-ng psmisc pth pulseaudio-libs
RUN yum install -y --nogpg pygobject3-base pygpgme pyliblzma pyOpenSSL python python-backports python-backports-ssl_match_hostname python-configobj python-crypto python-decorator python-ecdsa python-iniparse python-libs python-lockfile python-pycurl python-pyudev python-setuptools python-six python-slip python-slip-dbus python-sqlalchemy python-tempita python-urlgrabber pytz pyxattr qrencode-libs readline rootfiles rpm
RUN yum install -y --nogpg rpm-build-libs rpm-libs rpm-python rsyslog sed selinux-policy selinux-policy-targeted setup shadow-utils shared-mime-info sharutils shim shim-unsigned slang snappy sox spamassassin spandsp spandsp-devel speex sqlite sudo syslinux systemd systemd-libs systemd-sysv systemtap-sdt-devel sysvinit-tools t1lib
RUN yum install -y --nogpg tar tcp_wrappers-libs teamd tftp-server tuned tzdata unixODBC urw-fonts ustr util-linux uuid uuid-perl vim-common vim-enhanced vim-filesystem vim-minimal virt-what vsftpd wavpack which wpa_supplicant
RUN yum install -y --nogpg xfsprogs xinetd xorg-x11-font-utils xz xz-libs yum yum-metadata-parser yum-plugin-fastestmirror zlib pv unzip certbot python2-certbot python2-certbot-apache

RUN yum install -y --nogpg acl aic94xx-firmware alsa-firmware alsa-lib alsa-tools-firmware apr apr-util asterisk11 asterisk11-addons asterisk11-devel asterisk11-perl asterisk11-sounds-es asterisk11-sounds-fr audit audit-libs authconfig autogen-libopts avahi avahi-autoipd avahi-libs basesystem bash bind-libs-lite bind-license binutils biosdevname btrfs-progs bzip2-libs ca-certificates centos-logos centos-release chkconfig
RUN yum install -y --nogpg chrony compat-libtiff3 coreutils cpio cracklib cracklib-dicts cronie cronie-noanacron crontabs cryptsetup-libs cups-libs curl cyrus-imapd cyrus-imapd-utils cyrus-sasl cyrus-sasl-lib cyrus-sasl-plain dahdi dahdi-linux dbus dbus-glib dbus-libs dbus-python device-mapper device-mapper-event device-mapper-event-libs device-mapper-libs device-mapper-persistent-data dhclient dhcp dhcp-common
RUN yum install -y --nogpg dhcp-libs dialog diffutils dmidecode dnsmasq dracut dracut-config-rescue dracut-network e2fsprogs e2fsprogs-libs ebtables issabel issabel-system issabel-framework issabel-addons issabel-agenda issabel-asterisk-sounds issabel-email_admin issabel-endpointconfig2 issabel-extras issabel-fax issabel-firstboot issabel-im issabel-my_extension issabel-pbx issabel-portknock issabel-reports
RUN yum install -y --nogpg issabel-security elfutils-libelf elfutils-libs epel-release ethtool expat festival festival-lib festival-speechtools-libs festvox-slt-arctic-hts file file-libs filesystem findutils fipscheck fipscheck-lib firewalld flac-libs fontconfig fontpackages-filesystem freePBX freetype fxload gawk gdbm gdbm-devel gettext gettext-libs ghostscript ghostscript-fonts glib2 glibc glibc-common glibc-devel glibc-headers glib-networking gmp
RUN yum install -y --nogpg gnupg2 gnutls gobject-introspection gpgme gpm-libs grep groff-base grub2 grub2-efi grub2-tools grubby gsettings-desktop-schemas gsm gzip hardlink hdparm hostname httpd httpd-tools hwdata hylafax iaxmodem iksemel info initscripts iproute iprutils iptables iptables-services iptables-devel iputils irqbalance
RUN yum install -y --nogpg ivtv-firmware iwl1000-firmware iwl100-firmware iwl105-firmware iwl135-firmware iwl2000-firmware iwl2030-firmware iwl3160-firmware iwl3945-firmware iwl4965-firmware iwl5000-firmware iwl5150-firmware iwl6000-firmware iwl6000g2a-firmware iwl6000g2b-firmware iwl6050-firmware iwl7260-firmware jansson jbigkit-libs json-c kbd kbd-misc kernel kernel-devel kernel-headers kernel-tools kernel-tools-libs
RUN yum install -y --nogpg kexec-tools keyutils-libs kpartx krb5-libs lcdissabel lcdproc lcms2 less libacl libaio liballogsmat libao libassuan libasyncns libattr libblkid libcap libcap-ng libc-client libcom_err libcroco libcurl libdaemon libdb libdb-devel libdb-utils libdrm libedit libertas-sd8686-firmware libertas-sd8787-firmware libertas-usb8388-firmware libestr libffi libfontenc libgcc libgcrypt
RUN yum install -y --nogpg libgomp libgpg-error libgsmat libgudev1 libICE libidn libjpeg-turbo libmcrypt libmnl libmodman libmount libndp libnetfilter_conntrack libnfnetlink libnl3 libnl3-cli libogg libopenr2 libpcap libpciaccess libpipeline libpng libpri libproxy libpwquality libreport-filesystem libselinux libselinux-python libselinux-utils libsemanage libsepol libSM libsndfile
RUN yum install -y --nogpg libsoup libsrtp libss libss7 libssh2 libstdc++ libsysfs libtasn1 libteam libtidy libtiff libtiff-devel libtiff-tools libtool-ltdl libunistring libusb libusbx libuser libutempter libuuid libverto libvorbis libwat libX11 libX11-common libXau libxcb libXext libXfont libXi libxml2 libXpm libxslt libXt libXtst libzip linux-firmware lm_sensors-libs lockdev logrotate lua lvm2
RUN yum install -y --nogpg lvm2-libs lzo mailcap mailman make man-db mariadb mariadb-libs mariadb-server mdadm memtest86+ mgetty microcode_ctl ModemManager-glib mod_ssl mokutil mozjs17 mtools MySQL-python mysql-to-mariadb-server ncurses ncurses-base ncurses-libs net-snmp-agent-libs net-snmp-libs nettle net-tools newt newt-python nmap nmap-ncat nspr nss nss-softokn nss-softokn-freebl nss-sysinit nss-tools nss-util ntp ntpdate numactl-libs openfire openldap
RUN yum install -y --nogpg openssh openssh-clients openssh-server openssl openssl-libs opus os-prober p11-kit p11-kit-trust pam parted passwd pciutils pciutils-libs pcre perl perl-Archive-Tar perl-Business-ISBN perl-Business-ISBN-Data perl-Carp perl-CGI perl-Compress-Raw-Bzip2 perl-Compress-Raw-Zlib perl-constant perl-Convert-BinHex perl-Crypt-OpenSSL-Bignum perl-Crypt-OpenSSL-Random perl-Crypt-OpenSSL-RSA perl-Data-Dumper perl-Date-Manip perl-DBD-MySQL
RUN yum install -y --nogpg perl-DB_File perl-DBI perl-devel perl-Digest perl-Digest-HMAC perl-Digest-MD5 perl-Digest-SHA perl-Encode perl-Encode-Detect perl-Encode-Locale perl-Error perl-Exporter perl-ExtUtils-Install perl-ExtUtils-MakeMaker perl-ExtUtils-Manifest perl-ExtUtils-ParseXS perl-FCGI perl-File-Listing perl-File-Path perl-File-Temp perl-Filter perl-Getopt-Long perl-HTML-Parser perl-HTML-Tagset perl-HTTP-Cookies perl-HTTP-Daemon perl-HTTP-Date perl-HTTP-Message perl-HTTP-Negotiate perl-HTTP-Tiny perl-IO-Compress perl-IO-HTML
RUN yum install -y --nogpg perl-IO-Socket-INET6 perl-IO-Socket-IP perl-IO-Socket-SSL perl-IO-Zlib perl-libs perl-libwww-perl perl-LWP-MediaTypes perl-macros perl-Mail-DKIM perl-Mail-IMAPClient perl-Mail-SPF perl-MailTools perl-MIME-tools perl-NetAddr-IP perl-Net-Daemon perl-Net-DNS perl-Net-HTTP perl-Net-LibIDN perl-Net-SMTP-SSL perl-Net-SSLeay perl-Package-Constants perl-parent perl-Parse-RecDescent perl-PathTools perl-PlRPC perl-Pod-Escapes perl-podlators perl-Pod-Perldoc perl-Pod-Simple perl-Pod-Usage perl-Scalar-List-Utils perl-Socket perl-Socket6 perl-Storable perl-Sys-Syslog
RUN yum install -y --nogpg perl-Test-Harness perl-Text-ParseWords perl-threads perl-threads-shared perl-TimeDate perl-Time-HiRes perl-Time-Local perl-URI perl-version perl-WWW-RobotRules php php-bcmath php-cli php-common php-gd php-IDNA_Convert php-imap php-jpgraph php-magpierss php-mbstring php-mcrypt php-mysql php-pdo php-pear php-pear-DB php-PHPMailer php-process php-simplepie php-Smarty php-soap php-tcpdf php-tidy php-xml pinentry pkgconfig plymouth plymouth-core-libs plymouth-scripts policycoreutils polkit polkit-pkla-compat poppler-data popt portreserve postfix postgresql-libs ppp procmail procps-ng psmisc pth pulseaudio-libs py-Asterisk
RUN yum install -y --nogpg pygobject3-base pygpgme pyliblzma pyOpenSSL python python-backports python-backports-ssl_match_hostname python-cjson python-configobj python-crypto python-daemon python-decorator python-ecdsa python-eventlet python-greenlet python-iniparse python-libs python-lockfile python-paramiko python-pycurl python-pyudev python-setuptools python-six python-slip python-slip-dbus python-sqlalchemy python-tempita python-urlgrabber pytz pyxattr
RUN yum install -y --nogpg qrencode-libs readline rhino rootfiles RoundCubeMail rpm rpm-build-libs rpm-libs rpm-python rsyslog sed selinux-policy selinux-policy-targeted setup shadow-utils shared-mime-info sharutils shim shim-unsigned slang snappy sox spamassassin spandsp spandsp-devel speex sqlite sudo syslinux systemd systemd-libs systemd-sysv systemtap-sdt-devel sysvinit-tools t1lib tar tcp_wrappers-libs teamd tftp-server tuned
RUN yum install -y --nogpg tzdata unixODBC urw-fonts ustr util-linux uuid uuid-perl vim-common vim-enhanced vim-filesystem vim-minimal virt-what vsftpd wanpipe-util wavpack which wpa_supplicant xfsprogs xinetd xorg-x11-font-utils xz xz-libs yum yum-metadata-parser yum-plugin-fastestmirror zlib gcc gcc-c++ automake unzip pv zip wget iptables-devel perl-Text-CSV_XS certbot python2-certbot python2-certbot-apache git

RUN ln -s /usr/lib/systemd/system/mariadb.service /usr/lib/systemd/system/mysqld.service \
    && echo "#\!/bin/bash" > /etc/init.d/mysqld \
    && sed -i 's|\\||' /etc/init.d/mysqld \
    && echo "service mariadb \$1" >> /etc/init.d/mysqld \
    && chmod +x /etc/init.d/mysqld

RUN systemctl.original enable mariadb.service httpd.service \
    && systemctl start httpd \
    && systemctl start mariadb \
    && '/usr/bin/mysqladmin' -u root password 'iSsAbEl.2o17' \
	&& mysql -piSsAbEl.2o17 -e "create database mya2billing;" \
    && mysql -piSsAbEl.2o17 -e "create database asteriskcdrdb; use asteriskcdrdb; create table cdr ( calldate datetime NOT NULL default '0000-00-00 00:00:00', clid varchar(80) NOT NULL default '', src varchar(80) NOT NULL default '', dst varchar(80) NOT NULL default '', dcontext varchar(80) NOT NULL default '', channel varchar(80) NOT NULL default '', dstchannel varchar(80) NOT NULL default '', lastapp varchar(80) NOT NULL default '', lastdata varchar(80) NOT NULL default '', duration int(11) NOT NULL default '0', billsec int(11) NOT NULL default '0', disposition varchar(45) NOT NULL default '', amaflags int(11) NOT NULL default '0', accountcode varchar(20) NOT NULL default '', uniqueid varchar(32) NOT NULL default '', userfield varchar(255) NOT NULL default '' ); " \
    && mysql -piSsAbEl.2o17 -e "GRANT ALL PRIVILEGES ON mya2billing.* TO root@localhost;" \
	&& mysql -piSsAbEl.2o17 -e "GRANT ALL PRIVILEGES ON asterisk.* TO asteriskuser@localhost;" \
    && mysql -piSsAbEl.2o17 -e "GRANT ALL PRIVILEGES ON asteriskcdrdb.* TO asteriskuser@localhost;"
    #&& adduser asterisk -m -c "Asterisk User"

RUN mkdir -p /var/www/db \
    && mkdir -p /var/log/asterisk/mod
RUN touch /var/www/db/fax.db /var/www/db/email.db /var/www/db/control_panel_design.db /var/log/asterisk/issabelpbx.log /var/lib/asterisk/moh
RUN chown -R asterisk.asterisk /var/www/html \
    && chown -R asterisk.asterisk /etc/asterisk \
    && chown -R asterisk.asterisk /var/lib/asterisk \
    && chown -R asterisk.asterisk /var/log/asterisk \    
    && sed -i 's@ulimit @#ulimit @' /usr/sbin/safe_asterisk

RUN systemctl stop mariadb 

RUN systemctl enable mariadb.service
COPY mya2billing_schema.sql /tmp/
COPY mya2billing_update.sql /tmp/
RUN systemctl start httpd \
    && systemctl start mariadb \
    && mysql -piSsAbEl.2o17 < /tmp/mya2billing_schema.sql \
    && mysql -piSsAbEl.2o17 < /tmp/mya2billing_update.sql \
    && yum -y install issabel issabel-a2billing issabel-a2billing-callback_daemon issabel-addons issabel-agenda issabel-asterisk-sounds issabel-email_admin issabel-endpointconfig2 issabel-extras issabel-fax issabel-firstboot issabel-framework issabel-im issabel-my_extension issabel-pbx issabel-portknock issabel-reports issabel-security issabel-system \
    && systemctl stop httpd \
    && systemctl stop mariadb
	
RUN systemctl start httpd \
    && systemctl start mariadb \
    && mv /etc/asterisk/extensions_custom.conf.sample /etc/asterisk/extensions_custom.conf \
    && yum -y install issabel-callcenter fop2 issabel-roomx \
    && systemctl stop httpd \
    && systemctl stop mariadb \
    && systemctl stop mysqld
	
RUN yum -y install webmin yum-versionlock \
    && yum versionlock systemd

RUN systemctl start httpd \
    && systemctl start mysqld \
	&& rm -f /etc/issabel.conf \ 
	&& mysql -piSsAbEl.2o17 -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('')" \
	&& issabel-admin-passwords --cli change 'iSsAbEl.2o17' 'issabel-4' \
    && systemctl stop httpd \
    && systemctl stop mysqld 

RUN systemctl stop dbus \
    && systemctl.original disable dbus avahi-daemon chronyd ntpd dkms mdmonitor issabel-firstboot a2b-callback-daemon \
    && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*; \
    rm -f /etc/dbus-1/system.d/*; \
    rm -f /etc/systemd/system/dbus-org.freedesktop.Avahi.service; \
    rm -f /etc/systemd/system/sockets.target.wants/*;

COPY postfix.main.cf /etc/postfix/main.cf
COPY postfix.master.cf /etc/postfix/master.cf

RUN chmod 6711 /usr/bin/procmail \
    && chown root:root /usr/bin/procmail \
    && touch /var/log/asterisk/full /var/log/secure /var/log/maillog /var/log/httpd/access_log /etc/httpd/logs/error_log /var/log/fail2ban.log \
    && chown -R asterisk.asterisk /var/www/db

RUN systemctl.original enable fail2ban.service mariadb.service 
RUN systemctl.original enable asterisk.service httpd.service issabeldialer.service
RUN systemctl.original enable sshd-keygen.service sshd.service

RUN rm -f /tmp/mya2billing_* \
    && echo "root:issabel" | chpasswd 

# Include Elastix Theme
COPY elastixneo /var/www/html/themes/

# Chan Dongle Install
RUN git clone https://github.com/wdoekes/asterisk-chan-dongle \
	&& cd asterisk-chan-dongle \
	&& ./bootstrap \
	&& ./configure --with-astversion=11 \
	&& make \
	&& make install

COPY dongle.conf /etc/asterisk/

# Patch Issabel BR
# https://raw.githubusercontent.com/ibinetwork/IssabelBR/master/patch-issabelbr.sh
RUN yum -y install wget mtr vim mlocate nmap tcpdump mc nano lynx rsync screen htop subversion deltarpm \
    && updatedb \
    && echo "Atualizando o Sistema..." \
    && yum -y update && yum -y upgrade \
    && echo "Instalando patch de idiomas, cdr e bilhetagem..." \
    && svn co https://github.com/ibinetwork/IssabelBR/trunk/ /usr/src/IssabelBR \
    && cp /var/www/html/modules/billing_report/index.php /var/www/html/modules/billing_report/index.php.bkp \
    && cp /var/www/html/modules/cdrreport/index.php /var/www/html/modules/cdrreport/index.php.bkp \
    && cp /var/www/html/modules/campaign_monitoring/index.php /var/www/html/modules/campaign_monitoring/index.php.bkp \
    && rsync --progress -r /usr/src/IssabelBR/web/ /var/www/html/ \
    && amportal restart

RUN echo "Instalando audio em Português Brasil" \
    && rsync --progress -r -u /usr/src/IssabelBR/audio/ /var/lib/asterisk/sounds/ \
    && sed -i '/language=pt_BR/d' /etc/asterisk/sip_general_custom.conf \
    && echo "language=pt_BR" >> /etc/asterisk/sip_general_custom.conf \
    && sed -i '/language=pt_BR/d' /etc/asterisk/iax_general_custom.conf \
    && echo "language=pt_BR" >> /etc/asterisk/iax_general_custom.conf \
    && sed -i '/defaultlanguage=pt_BR/d' /etc/asterisk/asterisk.conf \
    && echo "defaultlanguage=pt_BR" >> /etc/asterisk/asterisk.conf

RUN echo "Instalando codec g729" \
    && cp /usr/src/IssabelBR/codecs/codec_g729-ast110-gcc4-glibc-x86_64-pentium4.so /usr/lib64/asterisk/modules/codec_g729.so \
    && chmod 755 /usr/lib64/asterisk/modules/codec_g729.so

RUN echo "Instalando tratamento Hangup Cause" \
    && sed -i '/extensions_tratamento_hangupcause.conf/d' /etc/asterisk/extensions_override_issabel.conf \
    && sed -i '/extensions_tratamento_hangupcause.conf/d' /etc/asterisk/extensions_override_issabel.conf \
    && sed -i '/extensions_tratamento_hangupcause.conf/d' /etc/asterisk/extensions_override_issabelpbx.conf \
    && echo "#include /etc/asterisk/extensions_tratamento_hangupcause.conf" >> /etc/asterisk/extensions_override_issabelpbx.conf \
    && rsync --progress -r /usr/src/IssabelBR/etc/asterisk/ /etc/asterisk/ \
    && chown asterisk.asterisk /etc/asterisk/extensions_tratamento_hangupcause.conf

RUN rm -Rf /usr/src/IssabelBR

#COPY admin /var/www/html/admin // Se Voce tiver Problemas com o Modulo Call Center, me avise.

RUN chown -R asterisk.asterisk /var/www/db
RUN systemctl restart asterisk \
    && sleep 30 \
    && asterisk -rx "module load codec_g729"

RUN yum clean headers && yum clean packages
RUN chown -R mysql:mysql /var/lib/mysql

ENV container docker

EXPOSE 25 80 443 465 22 5038 5060/tcp 5060/udp 5061/tcp 5061/udp 8001 8003 8088 8089 10000-10100/tcp 10000-10100/udp

ENTRYPOINT ["/usr/bin/systemctl","default","--init"]