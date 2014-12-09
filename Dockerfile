FROM ubuntu:trusty
RUN echo 'PHPNG Docker'

RUN mkdir -p ~/tmp
WORKDIR ~/tmp

ENV CMAKE_PREFIX_PATH ~/tmp

RUN apt-get install -y wget

RUN wget http://launchpadlibrarian.net/140087283/libbison-dev_2.7.1.dfsg-1_amd64.deb
RUN wget http://launchpadlibrarian.net/140087282/bison_2.7.1.dfsg-1_amd64.deb
RUN dpkg -i libbison-dev_2.7.1.dfsg-1_amd64.deb
RUN dpkg -i bison_2.7.1.dfsg-1_amd64.deb
RUN wget http://repos.zend.com/zend.key -O- 2> /dev/null | apt-key add -
RUN echo “deb [arch=amd64] http://repos.zend.com/zend-server/early-access/phpng/ trusty zend” > /etc/apt/sources.list.d/phpng.list
RUN apt-get update
RUN apt-get install -yq git \
 mercurial \
 autoconf \
 automake \
 binutils-dev \
 build-essential \
 cmake \
 g++ \
 git \
 libboost-dev \
 libboost-filesystem-dev \
 libboost-program-options-dev \
 libboost-regex-dev \
 libboost-system-dev \
 libboost-thread-dev \
 libbz2-dev \
 libc-client-dev \
 libc-client2007e-dev \
 libcap-dev \
 libcurl4-openssl-dev \
 libdwarf-dev \
 libelf-dev \
 libexpat-dev \
 libgd2-xpm-dev \
 libgoogle-glog-dev \
 libgoogle-perftools-dev \
 libicu-dev \
 libjemalloc-dev \
 libmcrypt-dev \
 libmemcached-dev \
 libmysqlclient-dev \
 libncurses-dev \
 libonig-dev \
 libpcre3-dev \
 libreadline-dev \
 libtbb-dev \
 libtool \
 libxml2-dev \
 zlib1g-dev \
 libevent-dev \
 libmagickwand-dev \
 libxslt1-dev \
 ocaml-native-compilers \
 libssl-dev \
 libcurl3-dev \
 libdb5.1-dev \
 libjpeg-dev \
 libpng-dev \
 libXpm-dev \
 libfreetype6-dev \
 libgmp3-dev \
 libldap2-dev \
 libmhash-dev \
 freetds-dev \
 libz-dev \
 libmysqlclient15-dev \
 ncurses-dev \
 unixODBC-dev \
 libsqlite-dev \
 libaspell-dev \
 libreadline6-dev \
 librecode-dev \
 libsnmp-dev \
 libtidy-dev \
 libxslt-dev \
 libt1-dev \
 libgmp-dev \
 re2c \
 libpspell-dev \
 curl \
 apache2 \
 libapache2-mod-php5 \
 php5-mysql \
 php5-gd \
 php5-curl \
 php-pear \
 php-apc \
 php5

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

EXPOSE 80
