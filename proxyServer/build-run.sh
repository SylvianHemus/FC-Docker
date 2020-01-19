#sudo docker kill $(sudo docker ps -q)
#./hooks/post_checkout

sudo docker ps -q --filter ancestor="freecad-proxy" | xargs -r sudo docker stop

sudo docker build . -t freecad-proxy
#sudo docker network create -d bridge fcnet

sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 80:80 freecad-proxy


echo IP address of docker containers are
sudo docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  $(sudo docker ps -q)
#sleep 10
#firefox $(sudo docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  $(sudo docker ps -q)) &
