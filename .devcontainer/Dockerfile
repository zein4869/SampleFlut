# Image cơ bản Ubuntu với Node để chạy Flutter Web
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Cài các gói cần thiết
RUN apt-get update && apt-get install -y \
  curl git unzip xz-utils zip libglu1-mesa \
  && rm -rf /var/lib/apt/lists/*

# Cài Flutter SDK stable
RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

# Thêm vào PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Chạy flutter doctor để chuẩn bị
RUN flutter doctor -v

# Tạo user vscode (để tương thích Codespace)
USER vscode
WORKDIR /workspaces
