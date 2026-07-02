FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=8080
COPY . .
RUN mkdir -p /app/data /app/uploads/field-photos && chmod -R 777 /app/data /app/uploads
EXPOSE 8080
CMD ["node", "server.js"]
