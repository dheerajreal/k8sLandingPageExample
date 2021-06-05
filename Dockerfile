FROM nginx:alpine

COPY ./aerial /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]