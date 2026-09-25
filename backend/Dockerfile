FROM node:20.17.0-alpine AS builder
RUN apk update && apk upgrade --no-cache
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . .

FROM node:20.17.0-alpine AS production
RUN apk update && apk upgrade --no-cache
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js .
COPY --from=builder /app/package.json .
RUN rm -rf /usr/local/lib/node_modules/npm \
           /usr/local/lib/node_modules/corepack \
           /opt/yarn-v* \
           /usr/local/bin/npm \
           /usr/local/bin/npx \
           /usr/local/bin/corepack
RUN addgroup -S susegroup && \
    adduser -S suseuser -G susegroup && \
    chown -R suseuser:susegroup /app
USER suseuser
ENV PORT=5050
EXPOSE 5050
HEALTHCHECK --interval=30s \
            --timeout=5s \
            --start-period=10s \
            --retries=3 \
  CMD wget -qO- http://localhost:5050/health || exit 1
CMD ["node","server.js"]