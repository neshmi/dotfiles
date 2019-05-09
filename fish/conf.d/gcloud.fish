if command -sq gcloud
  set PATH $PATH (gcloud info --format="value(installation.sdk_root)")/bin
end