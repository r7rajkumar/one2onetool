#!/bin/bash
########################################################
## Shell Script to Build Docker Image
########################################################
sudo groupadd docker
sudo usermod -aG docker ec2-user
cd /home/ec2-user/assignment/
echo "build the docker image"
sudo docker build -t xxxx/one2onetool:$DATE . >> /home/ec2-user/output
echo "built docker images and proceeding to delete existing container"
result=$( docker ps -q -f name=one2onetool )
if [[ $? -eq 0 ]]; then
echo "Container exists"
sudo docker container rm -f one2onetool
echo "Deleted the existing docker container"
else
echo "No such container"
fi
echo "Deploying the updated container"
sudo docker run -itd -p 3000:3000 --name one2onetool $OUTPUT
echo "Deploying the container"