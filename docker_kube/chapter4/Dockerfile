FROM node:alpine

WORKDIR /usr/app

# prevent rebuilding node_modules again
COPY ./package.json ./ 

RUN npm install

# Copy the rest of the files
COPY ./ ./

CMD ["npm", "start"]