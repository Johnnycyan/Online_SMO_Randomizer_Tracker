FROM node:22-alpine

# Pick up the eMudhra/emSign distrust (ca-certificates 20261020) in the system store too
RUN apk upgrade --no-cache ca-certificates-bundle

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY server.js ./

ENV PORT=3000

CMD ["node", "server.js"]
