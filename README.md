# MySQL + Flask Boilerplate Project

This repo contains a boilerplate setup for spinning up 2 docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the `webapp` user. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

## For setting up a Conda Web-Dev environment:

1. `conda create -n webdev python=3.9`
1. `conda activate webdev`
1. `pip install flask flask-mysql flask-restful cryptography flask-login`


## About this application 

StudyFind is catered towards anyone looking for a study space to easily find one close by. Study spaces can add basic information to their webpage to market themselves to any prospective visitors and visitors can leave an in-depth review of the place (ambience, cleanliness, quietness level). Anyone can add a new study space if one is not already in the database. 

Implemented a REST API to provide access to the data using MySQL and Python. Connected API to AppSmith using ngrok to create the UI pages. 

