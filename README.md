## Phantomjs and yslow in jenkins

This repo is used to setup `docker` image used for running performance test in jenkins.


```sh
$ docker-compose build
$ docker-compose up
```

And you will get `jenkins` up and running in `http://192.168.99.100:8080`, you can then add a new job with `executable shell`:

```sh
phantomjs /var/share/yslow.js -i grade -threshold "B" -f junit http://bookmarks-frontend.s3-website-us-west-2.amazonaws.com/ > yslow.xml
```
