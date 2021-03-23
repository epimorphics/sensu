VERSION?=6.2.5
REPO?=epimorphics/sensu

all: image

Dockerfile:
	echo "FROM sensu/sensu:${VERSION}" > $@
	echo "RUN apk add py3-pip" >> $@
	
image: Dockerfile
	@docker build -t ${REPO}:${VERSION} .

publish:
	@docker push ${REPO}:${VERSION}

clean:
	@rm -f Dockerfile
