FROM ubuntu:20.04
MAINTAINER akirocode

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git wget tar maven iceweasel fish gdebi 

#RUN wget 'https://az764295.vo.msecnd.net/stable/d0182c3417d225529c6d5ad24b7572815d0de9ac/code_1.23.1-1525968403_amd64.deb'
RUN wget 'https://az764295.vo.msecnd.net/stable/940b5f4bb5fa47866a54529ed759d95d09ee80be/code_1.52.0-1607640828_amd64.deb'
RUN gdebi --n code_1.52.0-1607640828_amd64.deb

RUN apt-get install -y libxss1 curl apt-utils

RUN curl -sL https://deb.nodesource.com/setup_10.x  | bash - ; \
    apt-get install -y nodejs

RUN npm install -g --save fp-ts ; \
    npm install -g typescript ; \
    npm install -g readline ; \
    npm install -g Promise ; \
    npm install -g ts-node
RUN apt-get install -y libxcb-dri3-0
RUN chsh -s /bin/bash root

CMD ["/usr/share/code/code", "--unity-launch", "--no-sandbox"]
