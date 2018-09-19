FROM golang:1.10-stretch

RUN set -xe && \
	rm /etc/localtime && \
	ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
	echo 'Asia/Tokyo' > /etc/timezone


RUN set -xe && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		git-core cpanminus make && \
	rm -rf /var/lib/apt/lists/*

RUN set -xe && \
	cd /opt && \
	git clone --depth 1 https://github.com/mackerelio/mackerel-agent-plugins.git && \
	cd /opt/mackerel-agent-plugins && \
	make deps
