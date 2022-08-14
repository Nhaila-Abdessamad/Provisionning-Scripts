 #!/bin/bash


sudo yum update -y
sudo yum install -y git
sudo git clone https://github.com/mehdi-lamrani/spark-movie.git

sudo yum install java -y
sudo wget https://dlcdn.apache.org/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3.tgz
sudo tar -xvf spark-3.3.0-bin-hadoop3.tgz 
sudo rm -rf spark-3.3.0-bin-hadoop3.tgz 
sudo mv spark-3.3.0-bin-hadoop3/ spark-3.3.0


sudo echo "export PS1=\"\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\\$\[\e[m\] \" " >> .bashrc
# sudo echo "export SPARK_HOME=/home/ec2-user" >> .bashrc
sudo echo "export PATH=$PATH:$SPARK_HOME/home/ec2-user/spark-3.3.0/bin" >> .bashrc
sudo . .bashrc


sudo pip3 install CherryPy
sudo pip3 install Flask
sudo pip3 install Cython
sudo pip3 install pandas

sudo pip3 install findspark


# sudo sed -i "s/localhost/$(curl http://checkip.amazonaws.com)/g" /home/ec2-user/spark-movie/static/index.js

cd spark-movie

spark-submit server.py /home/ec2-user/spark-movie/ml-latest/movies.csv /home/ec2-user/spark-movie/ml-latest/ratings.csv


# curl -H "Accept: application/json; Content-Type: application/json" -X GET http://15.236.96.253:5432/331/ratings/top/10 | python -m json.tool

# curl -H "Content-Type: application/json" -X GET http://15.236.96.253:5432/12/ratings/858

# curl -H "Accept: text/csv; Content-Type: application/json" -X POST http://15.236.96.253:5432/331/ratings -F 'file=@ml-latest/new-ratings.csv'
