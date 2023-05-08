FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  requirements.txt\
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm", "generate image.py"]
