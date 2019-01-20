FROM maven:3.6.0-jdk-8-slim
ARG VERSION=5.1.4
LABEL Description="maven runner for https://github.com/dilbertside/spring-mvc-start-archetype" Vendor="https://github.com/dilbertside" Version="$VERSION"

COPY settings.xml /usr/share/maven/ref/
#build local repo by making a dry run of the generator as mvn dependency:resolve and mvn dependency:resolve-plugins do not work (missing deps)
RUN cd /tmp && mvn --batch-mode -q -s /usr/share/maven/ref/settings.xml archetype:generate \
    -DarchetypeGroupId=com.github.dilbertside \
    -DarchetypeArtifactId=spring-mvc-start-archetype \
    -DarchetypeVersion=$VERSION \
    -DartifactId=dummy 
# store also generated project dependencies to local repo, to help build artefact with this container
RUN cd /tmp/dummy && \
    mvn -q --fail-never -s /usr/share/maven/ref/settings.xml package test -Ptest && \
    rm -rf /tmp/dummy
    
ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
