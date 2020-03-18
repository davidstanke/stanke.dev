FROM gcr.io/cloud-builders/curl
COPY pr_status_post.sh /bin
RUN chmod +x /bin/pr_status_post.sh
ENTRYPOINT ["/bin/pr_status_post.sh"]