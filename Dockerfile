FROM java:8-jdk

# Run as non-root, eventually
RUN groupadd -r slamon && useradd -r -d /workspace -m -g slamon slamon
RUN apt-get -y update && apt-get -y install git && apt-get -y clean

WORKDIR /workspace
ADD .git ./.git
ADD settings.gradle ./settings.gradle
ADD gradle/ ./gradle/
ADD gradlew ./gradlew
ADD LICENSE ./LICENSE
ADD src/ ./src/
ADD build.gradle ./build.gradle
RUN chown -R slamon:slamon /workspace

USER slamon
RUN ./gradlew --version
RUN ./gradlew assemble testClasses
