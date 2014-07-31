dockerfiles/thruk
===================

Dockerfile for thruk+apache2 w/ fcgid
* Based on testing .deb provided by lab.consol.de
* Expects livestatus host and port, thrukadmin password as environment variables passed at runtime:
	docker run -e LIVESTATUS_HOST=[IP] -e LIVESTATUS_PORT=[PORT] -e THRUK_PASSWORD=[some string] thruk
