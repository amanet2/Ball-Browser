docker buildx build --platform linux/amd64 -t gcr.io/prj-ballbrowser-test/ballbrowser-0 .
gcloud builds submit --tag gcr.io/prj-ballbrowser-test/ballbrowser-0
gcloud run deploy ballbrowser-0 --image gcr.io/prj-ballbrowser-test/ballbrowser-0 --platform managed --region us-central1 --port 8000 --allow-unauthenticated