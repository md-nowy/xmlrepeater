FROM debian:8

WORKDIR /app
COPY ./repeater.sh /app/repeater.sh

# path which wich will be modified
ENV file=""
# tag which is enclosing item in the array
ENV tag=""
# iteration times 
ENV i=""

CMD [ "bash", "-c", "/app/repeater.sh < ${file} ${tag} ${i}" ]
