## Aider-node-yarn

Use Aider from Docker to build apps with Python, or NodeJS/Yarn technologies!
(Yarn support not yet included!)

Example:
`docker run -it --volume $(pwd):/home/aider/app -p 3000:3000 aider-node-yarn:latest --model sonnet --api-key anthropic=[YOUR-API-KEY]`

This will connect port 3000 locally on your machine to the Docker image running aider while allowing aider to write all files to the current directory. 

Next ask aider to...
`Build a NextJS web app with a CRUD interface that allows users to create quizes. Each quiz should have a set of questions which can also be entered via the CRUD interfsace. Each question should have a set of answers that can be maintained.`

Finally, watch aider do its thing! You may need to connect it to an instance of MongoDB (or whatever DB persistence technology it chooses by default) running in another Docker container. See the docker-compose for an example of how to connect aider to a MongoDB container.

This is a work in progress!!
