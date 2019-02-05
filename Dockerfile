# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM kibana:6.5.4
USER root
ENV PATH /usr/share/kibana/bin:$PATH

RUN yum install -y git

RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash -
RUN yum install -y nodejs
RUN cd /usr/share/kibana/ && \
	git clone https://github.com/dlumbrer/kbn_network.git network_vis -b 6-dev && \
	cd network_vis && \
	rm -rf images/ && \
	npm install


EXPOSE 5601

CMD ["kibana"]




