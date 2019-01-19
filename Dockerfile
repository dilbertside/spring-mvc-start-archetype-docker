FROM maven:3.6.0-jdk-8-slim
ARG VERSION=5.1.2
LABEL Description="maven runner for https://github.com/dilbertside/spring-mvc-start-archetype" Vendor="https://github.com/dilbertside" Version="$VERSION"

COPY settings.xml /usr/share/maven/ref/
COPY pom.xml /tmp/pom.xml
RUN mvn -B -q -f /tmp/pom.xml -s /usr/share/maven/ref/settings.xml versions:set -DnewVersion="$VERSION" && \
    mvn -B -q -f /tmp/pom.xml -s /usr/share/maven/ref/settings.xml versions:set-property -Dproperty=spring-mvc-start-archetype.version -DnewVersion="$VERSION"
RUN mvn -B -q -f /tmp/pom.xml -s /usr/share/maven/ref/settings.xml dependency:resolve 
RUN mvn --batch-mode -q -s /usr/share/maven/ref/settings.xml archetype:generate \
    -DarchetypeGroupId=com.github.dilbertside \
    -DarchetypeArtifactId=spring-mvc-start-archetype \
    -DarchetypeVersion=$VERSION
ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
