FROM prosody/prosody:latest

RUN apt-get update && apt-get install -y mercurial
RUN hg clone https://hg.prosody.im/prosody-modules/ /usr/lib/prosody-modules

COPY ./configuration/prosody.cfg.lua /etc/prosody/prosody.cfg.lua

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["prosody", "-F"]
