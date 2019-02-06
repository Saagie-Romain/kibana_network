FROM kibana:5.6.3
USER root
ENV PATH /usr/share/kibana/bin:$PATH

RUN apt-get update &&  apt-get install -y git

RUN apt-get install -y nodejs npm
RUN cd /usr/share/kibana/plugins && \
	git clone https://github.com/dlumbrer/kbn_network.git network_vis -b 5.6.x && \
	cd network_vis && \
	rm -rf images/ && \
	npm install


EXPOSE 5601

CMD ["kibana"]




