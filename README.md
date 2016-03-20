# docker-emoncms
defines a docker container with emoncms installed

## Usage

1. [**Install docker**](https://docs.docker.com/installation/)
1. **Download and start the emoncms instance**  
`docker run --name emoncms -p 80:80 -d greyltc/emoncms`
1. **Test the emoncms server**  
Point your browser to:  
http://localhost/    
and you should see your emoncms server.
1. **[Optional] Stop the emoncms docker server instance**  
`docker stop emoncms`
1. **[Optional] Delete the emoncms docker server instance (after stopping it)**  
`docker rm emoncms`
1. **Profit.**
