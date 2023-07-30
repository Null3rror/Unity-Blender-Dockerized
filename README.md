# Unity-Blender-Dockerized
Dockerised Unity Editor with Blender


## Usage
```
sudo chmod +x build.sh
./build.sh
```

## Publishing to DockerHub
1. `docker login`
2. Uncomment the `# docker push ${IMAGE_TO_PUBLISH}` in [build.sh](https://github.com/Null3rror/Unity-Blender-Dockerized/blob/master/build.sh)
