[![](https://img.shields.io/docker/automated/diside/spring-mvc-start-archetype-docker.svg)](https://hub.docker.com/r/diside/spring-mvc-start-archetype-docker/tags)

This container is a maven runner to generate a project using the m2 repository package in the container for the archetype
[Spring Web MVC Maven Archetype starter](https://github.com/dilbertside/spring-mvc-start-archetype)

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
cd <your-poject>
docker run -it --rm -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven diside/spring-mvc-start-archetype-docker:latest sh -c "mvn -q clean package test -Ptest && ls target"
```
