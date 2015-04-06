FROM dockerfile/nodejs

COPY . /src

WORKDIR /src

RUN npm install

EXPOSE 80
CMD ["node", "/src/main.js"]
