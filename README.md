# docker-tempmon

Alpine Linux ipmitool docker image running a monitoring script via supervisord.

__**** NOTE: ****__

This container shuts down nodes if the ambient temperature goes above 30 degrees!!!

__CHANGE TO YOUR NEEDS BEFORE RUNNING__

GitHub action is setup so this image is __updated every week__.

_docker run_:

```sh
mkdir -p log/supervisord
docker run --privileged --name tempmon -d \
    -v $(pwd)/log:/var/log \
    -v /bin/systemctl:/bin/systemctl \ 
    -v /run/systemd/system:/run/systemd/system \ 
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \ 
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    ghcr.io/cjcshadowsan/docker-tempmon:main
```

_ipmitool command_ examples:

```sh
docker exec -it tempmon ipmitool sdr
```
