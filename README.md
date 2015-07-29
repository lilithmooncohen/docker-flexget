This is a Dockerfile setup for Flexget.

To run:

```
sudo docker run -d --name flexget -v /local/path/to/flexget/folder:/root/.flexget -v /etc/localtime:/etc/localtime:ro ryanckoch/flexget
```

