version=`grep app.version application.properties | awk -F "=" '{print $2}'`
scp -i ~/4bites.pem /home/ubuntu6500/Cinema-1.3.6/target/Cinema-$version.war ubuntu@ec2-50-17-107-213.compute-1.amazonaws.com:/home/ubuntu/cinema/Cinema-$version.war
ssh -i ~/4bites.pem  ubuntu@ec2-50-17-107-213.compute-1.amazonaws.com /home/ubuntu/cinema/deploy.sh $version
