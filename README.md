# README #

# How to run 

clone this repository and change the input and output settings in config.yml, pay attention to the number, name and type of columns in the csv because they will probably not be the same as yours.

after cloning the repository and configuring it run in the terminal

`docker compose up -d`

you will need to specify the network for both containers

`docker network connect <your-network> <psql-container> `

`docker build -t <name-img-embulk> .`

run you image embulk and define a network

`docker run --network <your-network-name> <image-embulk>`



if everything is correct when opening your postgres database you will see the table with the inserted data.