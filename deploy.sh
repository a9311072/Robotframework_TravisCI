sudo apt-get update \
	&& apt-get install -y build-essential libssl-dev libffi-dev python-dev \
		python-pip python-dev gcc phantomjs firefox \
		xvfb zip wget ca-certificates ntpdate \
		libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation \
	#&& rm -rf /var/lib/apt/lists/*
	

sudo wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz \
	&& tar xvzf geckodriver-*.tar.gz \
	&& rm geckodriver-*.tar.gz \
	&& mv geckodriver /usr/local/bin \
	&& chmod a+x /usr/local/bin/geckodriver
	
#sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
#	&& dpkg -i google-chrome*.deb \
#	&& rm google-chrome*.deb
	
#sudo wget https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_linux64.zip \
#	&& unzip chromedriver_linux64.zip \
#	&& rm chromedriver_linux64.zip \
#	&& mv chromedriver /usr/local/bin \
#	&& chmod +x /usr/local/bin/chromedriver