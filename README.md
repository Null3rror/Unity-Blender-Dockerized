# Unity-Blender-Dockerized
Dockerised Unity Editor with Blender. 

## Usage
```
sudo chmod +x build.sh
./build.sh
```
## Publishing to DockerHub
1. Uncomment the `docker login` and `# docker push ${IMAGE_TO_PUBLISH}` in [build.sh](https://github.com/Null3rror/Unity-Blender-Dockerized/blob/master/build.sh)
<br>

## Pulling from DockerHub
```
docker pull null3rror/unity-editor-blender
```
