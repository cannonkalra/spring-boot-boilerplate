```sh
# Install SDK MAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install Java, Gradle, Spring Init
sdk install java 21.0.3-amzn
sdk install gradle 8.11.1
sdk install springboot 3.4.1

# Initializing a Spring Boot Project
spring init --build=gradle --type=gradle-project --java-version=21 --packaging=jar --group-id=com.c4n --artifact-id=app --dependencies=web,data-jpa,mariadb ./
```

```sh
docker build -t api-c4n .
docker run --rm -p 8000:8000 api-c4n
```
