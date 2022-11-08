# trimmomatic-docker
## Trimmomatic wget with v0.39

In this case, the conda install does not work -- instead, this Dockerfile gets the release.

[Trimmomatic v0.39](http://www.usadellab.org/cms/?page=trimmomatic)

[Trimmomatic User Manual v0.39](http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf)

To build your image from the command line:
* Can do this on [Google shell](https://shell.cloud.google.com) - docker is installed and available

```bash
docker build -t trimmomatic .
```

To test this tool from the command line 

Set up an environment variable capturing your current command line:
```bash
PWD=$(pwd)
```

Then mount and use your current directory and call the tool now encapsulated within the environment.

Any trimmomatic is a java application and running it requires the jar file which is unzipped in this docker -  command can be used to check.

```bash
docker run -it -v $PWD:$PWD -w $PWD 
```

Using this published release we have to follow the instructions to authenticate with GitHub by using your GitHub token. [Authenticating to the Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

1.  Create your own personal access token
2.  set an environment variable to your token
```bash
export CR_PAT=Your_Token
```
4.  Then on the command line you can 
```bash
 echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
 ```
 
 Then you can use the command to pull the image from the GitHub repository.
 
 
