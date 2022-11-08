[![Docker Image CI](https://github.com/adeslatt/trimmomatic-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/adeslatt/trimmomatic-docker/actions/workflows/docker-image.yml)[![Docker](https://github.com/adeslatt/trimmomatic-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/adeslatt/trimmomatic-docker/actions/workflows/docker-publish.yml)
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

You can test the container by doing the following:

First, make a test directory (just to keep things clean)
```bash
mkdir test
cd test
```

## Test your docker image

First, let's test to see if the java install in the docker image was successful

```bash
docker run -it -v $PWD:$PWD -w $PWD trimmomatic java -version
```

If successfully installed, the output should look like this:
```bash
openjdk version "11.0.16" 2022-07-19
OpenJDK Runtime Environment (build 11.0.16+8-post-Ubuntu-0ubuntu122.04)
OpenJDK 64-Bit Server VM (build 11.0.16+8-post-Ubuntu-0ubuntu122.04, mixed mode, sharing)
```

Next, let's check out to see if the trimmomatic is functioning properly.

To do so, we need two test files.   Using from a course taught earlier, [Dry bench skills for the researcher](https://doi.org/10.5281/zenodo.7025773) some nice small test files are available for our use: 

Then download two test files
```bash
wget https://zenodo.org/record/7025773/files/test.20k_reads_1.fastq.gz
wget https://zenodo.org/record/7025773/files/test.20k_reads_2.fastq.gz
```

Next, referring to the provided manual, provide patterns for the input and the output by providing a template of sort to show the pattern for retrieval.

```bash
docker run -it -v $PWD:$PWD -w $PWD trimmomatic \
java -jar /usr/bin/trimmomatic-0.39.jar PE \
-threads 6 \
-phred33 \
-trimlog trimlog.out \
-basein  "test.20k_reads_1.fastq.gz" \
-baseout "test.20k_filtered.fastq.gz" \
ILLUMINACLIP:/usr/bin/TruSeq3-PE.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36
```

 
