# docker-tempmon

Alpine Linux ipmitool docker image running a monitoring script via supervisord.

**** NOTE: ****

This container shuts down nodes if the ambient temperature goes above 30 degrees!!!

*CHANGE TO YOUR NEEDS BEFORE RUNNING*

GitHub action is setup so this image is __updated every week__.

_docker run_:

```sh
mkdir -p log/supervisord
docker run --privileged --name tempmon -d \
    -v $(pwd)/log:/var/log \
    ghcr.io/cjcshadowsan/docker-tempmon:main
```

_ipmitool command_ examples:

```sh
docker exec -it tempmon ipmitool sdr
```
