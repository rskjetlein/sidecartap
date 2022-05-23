# sidecartap
Based on the corelight project container monitoring, vxlan[^1]

![sidecartap](https://docs.google.com/drawings/d/e/2PACX-1vT8ydyw3Rp9n8XdgZz8QuFC_iW8ZgUXV_Z2F6gz63E25SVuWk3Qcpvqc9CgmIII-X3yVn8abO_eUO7C/pub?w=480&h=360)

Environment variables needs to be set:
* SENSOR 
* INTERFACE
* VNI

###### Sensor<br>
    name or ip address
    name is resolved podname
    ip address is not resolved

###### Interface
    name of the interface in pod to listen to
    eg. eth0
###### Vni
    Vni identity 0 - 0xffffff


Example deployment:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: sidecarcapture
  name: sidecarcapture
spec:
  selector:
    matchLabels:
      run: sidecarcapture
  template:
    metadata:
      labels:
        run: sidecarcapture
    spec:
      containers:
      - image: sidecartap
        imagePullPolicy: Always
        name: vxlan
        env:
        - name: VNI
          value: "499"
        - name: INTERFACE
          value: eth0
        - name: SENSOR
          value: sensor
```


[^1]: https://github.com/corelight/container-monitoring/tree/main/monitoring
