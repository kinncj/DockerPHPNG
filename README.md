### Docker PHPNG

#### Usage

```
sudo docker run -d -p 80:80 kinncj/docker_phpng:v1.0.8 [php installer http://path/to/your/config.json]
```

#### Examples

###### Without configuration
```
sudo docker run -d -p 80:80 kinncj/docker_phpng:v1.0.8
```

###### With configuration
```
sudo docker run -d -p 80:80 kinncj/docker_phpng:v1.0.8 php installer https://raw.githubusercontent.com/kinncj/DockerPHPNG/master/config.json
```

#### Configuration file sample

[https://raw.githubusercontent.com/kinncj/DockerPHPNG/master/config.json](https://raw.githubusercontent.com/kinncj/DockerPHPNG/master/config.json)
