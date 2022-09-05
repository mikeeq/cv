FROM fedora:36

RUN dnf update -y && \
    dnf install -y \
      texlive-scheme-medium \
      texlive-fontawesome \
      texlive-geometry \
      texlive-hyperref \
      texlive-moresize \
      texlive-raleway \
      texlive-ly1 \
      texlive-chktex
