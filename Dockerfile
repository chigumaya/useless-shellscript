# docker build -t useless . 
FROM	debian:stable-slim
RUN	apt update -y && \
	apt install -y bash dash zsh ksh && \
	apt install -y bc dc m4 && \
	apt install -y make imagemagick librsvg2-bin && \
	apt install -y fonts-noto-cjk wamerican && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
WORKDIR /work
COPY --parents * /work/
