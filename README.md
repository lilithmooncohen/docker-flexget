This is a Dockerfile setup for Flexget.

To run:

```
sudo docker run -d --net="host" --name flexget -v /local/path/to/flexget/folder:/root/.flexget ryanckoch/docker_flexget
```

