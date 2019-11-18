FROM codercom/code-server:v2
LABEL maintainer="simone.bembi@gmail.com"

USER root

RUN apt-get update && \
	apt-get install -y zsh gnupg gawk translate-shell gcc && \
	sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt-get update && \
	apt-get install -y yarn && \
    yarn global add typescript && \
    yarn global add parcel && \
	mkdir -p /opt/go && \
	wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz -O go.tar.gz && \
	tar -xvf go.tar.gz && \
	mv go /usr/local && \
	echo "export GOROOT=/usr/local/go" >> /home/coder/.zshrc && \
	echo "export GOPATH=$HOME/Go" >> /home/coder/.zshrc && \
	echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> /home/coder/.zshrc && \
	/usr/local/go/bin/go version && \
	/usr/local/go/bin/go env && \
	rm -rf /opt/go


USER coder