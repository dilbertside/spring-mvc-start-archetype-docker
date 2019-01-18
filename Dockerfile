FROM maven:3.6.0-jdk-11-slim
ARG VERSION
ARG VERSION_BOM
MAINTAINER DBS "https://github.com/dilbertside"
LABEL Description="maven runner for https://github.com/dilbertside/spring-mvc-start-archetype" Vendor="OSS" Version="$VERSION"

COPY settings.xml /usr/share/maven/ref/
COPY pom.xml /tmp/pom.xml
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings.xml versions:set -DnewVersion="$VERSION" && \
    mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings.xml versions:set-property -Dproperty=spring-mvc-start.version -DnewVersion="$VERSION"
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings.xml dependency:resolve
ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
