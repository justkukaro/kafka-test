::rem window batch

::rem run mykafka instance
docker build -t mykafka ./mykafka/
docker-compose -f ./mykafka/docker-compose.yml up -d
