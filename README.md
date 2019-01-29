# Spring MVC Start Maven archetype docker runner

[![](https://img.shields.io/docker/automated/diside/spring-mvc-start-archetype-docker.svg)](https://hub.docker.com/r/diside/spring-mvc-start-archetype-docker/tags) [![](https://img.shields.io/docker/build/diside/spring-mvc-start-archetype-docker.svg)](https://hub.docker.com/r/diside/spring-mvc-start-archetype-docker) [![](https://images.microbadger.com/badges/image/diside/spring-mvc-start-archetype-docker:5.1.4.svg)](https://hub.docker.com/r/diside/spring-mvc-start-archetype-docker) [![](https://images.microbadger.com/badges/version/diside/spring-mvc-start-archetype-docker:5.1.4.svg)](https://hub.docker.com/r/diside/spring-mvc-start-archetype-docker/tags)

[](https://microbadger.com/images/diside/spring-mvc-start-archetype-docker)

This container is a maven runner to generate a project using the m2 repository packaged in the container for the archetype 
[Spring Web MVC Maven Archetype starter](https://github.com/dilbertside/spring-mvc-start-archetype)

## [See Docker Hub for updated list of tags](https://hub.docker.com/r/diside/spring-mvc-start-archetype-docker/tags)

## [Dockerfile reference](https://github.com/dilbertside/spring-mvc-start-archetype-docker/blob/master/Dockerfile)


# How to build locally

```bash
./publish.sh
```
# to run

Goto one directory which does not contain any pom.xml and run the following

## Project generation

```bash
docker run -it --rm -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven diside/spring-mvc-start-archetype-docker mvn archetype:generate -DarchetypeGroupId=com.github.dilbertside -DarchetypeArtifactId=spring-mvc-start-archetype -DarchetypeVersion=5.1.4
```

## Generated project compilation, test

```bash
cd <your-project>
docker run -it --rm -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven diside/spring-mvc-start-archetype-docker:latest sh -c "mvn -q clean package test -Ptest && ls target"
```

##  Build Docker images with [Google JIB project](https://github.com/GoogleContainerTools/jib)

```bash
cd <your-project>
docker run -it --rm -v "$(pwd)":/usr/src/mymaven -v /var/run/docker.sock:/var/run/docker.sock -w /usr/src/mymaven diside/spring-mvc-start-archetype-docker:latest sh -c "mvn compile -Dimage=diside/webapp:0.0.1 jib-maven-plugin:dockerBuild"
```
change `diside/webapp:0.0.1` with your own docker registry and naming convention.
