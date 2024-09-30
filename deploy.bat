set APP_NAME=ballbrowser-0
set PROJECT_ID=prj-ballbrowser-test
set DOCKER_TAG=gcr.io/%PROJECT_ID%/%APP_NAME%

REM building the docker image on windows will compile for windows
REM the --platform linux/amd64 argument compiles for linux (what gCloud uses)
call docker buildx build --platform linux/amd64 -t %DOCKER_TAG% . || goto :error
call gcloud builds submit --tag %DOCKER_TAG% || goto :error
call gcloud run deploy %APP_NAME% --image %DOCKER_TAG% --platform managed --region us-central1 --port 8000 --allow-unauthenticated || goto :error

:error
exit /b 1