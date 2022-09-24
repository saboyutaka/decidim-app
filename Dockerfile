FROM decidim/decidim-dev:0.26.2

ENV BUNDLE_PATH /app/vendor/bundle
ENV SOLARGRAPH_CACHE /app/.solargraph

RUN mkdir -p /app/vendor/bundle && chown decidim:decidim /app/vendor/bundle \
  && mkdir -p /app/node_modules && chown decidim:decidim /app/node_modules \
