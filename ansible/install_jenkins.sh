#!/bin/bash

rpm -q java-17-amazon-corretto || sudo dnf install -y java-17-amazon-corretto
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
sudo dnf upgrade -y
sudo dnf install -y fontconfig
sudo dnf install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
