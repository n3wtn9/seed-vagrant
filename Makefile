all: plugins

plugins:  
	vagrant plugin install \
		rb-readline \
		pry pry-byebug \
		github_api \
		vagrant-docker-compose \
		vagrant-aws \
		vagrant-scp
