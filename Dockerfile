FROM node
WORKDIR /src
COPY . ./
RUN npm install -f && npm run build

FROM nginx:stable-alpine
COPY --from=0 /src/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]