# sidecartap

Based on the corelight project container monitoring, vxlan[^1]


Environment variables needs to be set:
* SENSOR
* INTERFACE
* VNI


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