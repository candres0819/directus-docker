FROM node:10.15.0-jessie
LABEL fidelizacion-mccain@pragma.com.co
WORKDIR /usr/src/api
#RUN mkdir mccain-strapi
RUN echo "unsafe-perm = true" >> ~/.npmrc
RUN npm install -g strapi@3.0.0-alpha.18
ENV APP_NAME mccain-strapi
ENV DATABASE_CLIENT mysql
ENV DATABASE_HOST mccainmysqlpdn.cuzh9ckzbc6g.us-east-1.rds.amazonaws.com
ENV DATABASE_PORT 3306
ENV DATABASE_NAME Fidelizacion_mccain
ENV DATABASE_USERNAME mccainpdnadmin
ENV DATABASE_PASSWORD Mccain2018.
#ARG environment=production
#ENV NODE_ENV $environment
#COPY . /usr/src/api/mccain-strapi
RUN strapi new ${APP_NAME} --dbclient=$DATABASE_CLIENT --dbhost=$DATABASE_HOST --dbport=$DATABASE_PORT --dbname=$DATABASE_NAME --dbusername=$DATABASE_USERNAME --dbpassword=$DATABASE_PASSWORD
WORKDIR /usr/src/api/mccain-strapi
RUN npm i strapi-provider-upload-aws-s3 --save
#ADD database.json config/environments/production
#RUN npm install -g aws-sdk
#RUN npm install
EXPOSE 1337
ENTRYPOINT ["strapi", "start"]