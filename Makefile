VERSION?=6.6.3
REPO?=293385631482.dkr.ecr.eu-west-1.amazonaws.com/epimorphics/sensu

all: image

Dockerfile: ${MAKEFILE}
	echo "FROM sensu/sensu:${VERSION}" > $@
	echo "RUN apk add py3-pip" >> $@
	
image: Dockerfile
	@docker build -t ${REPO}:${VERSION} .

publish:
	@docker push ${REPO}:${VERSION}

clean:
	@rm -f Dockerfile
