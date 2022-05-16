FROM andrefernandes86/demo-apachestruts-attacker-web

RUN apt-get update -y
RUN apt-get install wget -y
RUN apt-get install curl -y

EXPOSE 80
COPY c1as.sh ./c1as.sh
ENTRYPOINT ["sh", "./c1as.sh"]
