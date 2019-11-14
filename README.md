# operator-sdk-builder

Author: Brian Tomlinson <darthlukan@gmail.com | btomlins@redhat.com>


## Description

This is a Dockerfile I'm using to experiment with building Operator images using the [operator-sdk](https://github.com/operator-framework/operator-sdk) in a Tekton
pipeline.


## Usage

Run locally:

```
$ podman build . -t $REGISTRY/operator-sdk-builder:$TAG
$ podman run -it $REGISTRY/operator-sdk-builder:$TAG /bin/bash
```

Run in a Tekton `Task`:

```
...<snip>...
  steps:
    - name: build operator
      image: ${REGISTRY}/operator-sdk-builder:${TAG}
      command: ["/bin/bash"]
      args:
        - "-c"
        - operator-sdk build /path/to/operator ${REGISTRY}/${OPERATOR_NAME}:${TAG} --builder=podman
...<snip>...
```


## License

Apache-2.0, see LICENSE file.
