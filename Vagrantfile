# -*- mode: ruby -*-
# vi: set ft=ruby :
# Author: Newton Truong
# Credit: Gabe Lipson

## WARNING ##
# Don't move things around if you're not familiar with the scripts.
# Ordering of execution matter.

require 'vagrant'
Thread.abort_on_exception = true
Vagrant.configure("2") do |config|
  
  # Setup env variables in place
  config.vm.provision "shell", path: "./opts/install-aptitude-packages.sh"
  config.vm.provision "shell", inline: "cp /vagrant/opts/vagrant-env.sh /etc/profile.d/"

  config.vm.provision "shell",
    path: "./opts/docker-engine-upgrade.sh"

  # Pull docker containers into vm
  # config.vm.provision "docker" do |d|
  #   d.pull_images(
  #     "hello-world"
  #   ) 
  # end

  # Run docker compose yml
  # config.vm.provision("docker_compose", {
  #   rebuild: true,
  #   compose_version: "1.5.2",
  #   yml: "/app/docker-compose.yml"
  # })

  # Example run shell script
  # config.vm.provision "shell",
  #   path: "./build.sh"

  config.vm.define "gce", primary: true do |gce|
    gce.vm.box = "gce"

    gce.vm.provider :google do |google, override|
      google.google_project_id = ENV['PROJECT_ID']
      google.google_client_email = ENV['CLIENT_EMAIL']
      google.google_json_key_location = ENV['JSON_KEY_LOCATION']

      # Define the name of the instance.
      google.name = "dev-server"
      
      # Set the zone where the instance will be located. To find out available zones:
      # `gcloud compute zones list`.
      google.zone = "us-central1-b"
      
      # Set the machine type to use. To find out available types:
      # `gcloud compute machine-types list --zone asia-east1-c`.
      google.machine_type = "n1-standard-1"

      # Set the machine image to use. To find out available images:
      # `$ gcloud compute images list`.
      google.image = "ubuntu-1404-trusty-v20160406"

      google.disk_size = "50"
      google.disk_type = "pd-ssd"

      override.ssh.username = ""
      override.ssh.private_key_path = ""
    end
  end

  config.vm.define "amazon" do |amazon|
    amazon.vm.box = "dummy"

    amazon.vm.provider :aws do |aws, override|
      aws.access_key_id = ENV['ACCESS_KEY_ID']
      aws.secret_access_key = ENV['SECRET_ACCESS_KEY']
      aws.keypair_name = ENV['KEYPAIR_NAME']
      aws.security_groups = ["default"]
     
      # ubuntu Trusty 14.04 LTS
      aws.ami = "ami-9abea4fb"
      aws.region = "us-west-2"
      aws.instance_type = "m2.large"
      aws.tenancy = "default"
  
      override.ssh.username = "ubuntu"
      override.ssh.private_key_path = ENV['AWS_SSH_PRIVATE_KEY_PATH']
    end
  end

  config.vm.define "local" do |local|
    local.vm.box = "ubuntu/trusty64"

    local.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
  end

  config.vm.define "vmware" do |vmware|
    vmware.vm.box = "phusion/ubuntu-14.04-amd64"
   
    vmware.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "2048"
      v.vmx["numvcpus"] = "2"
    end
  end

end
