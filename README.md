# Generation Inference Service

<!-- description -->
<!-- /description -->

## Using Docker locally to catalog models to OpenAD Toolkit

### Build the container locally
```shell
docker build . -t generation-inference-service:latest
```

### Run Docker container api
```shell
docker run -dit -p 8080:8080 generation-inference-service:latest
```
Change this `8080:8080` to another port if you have a service running on that port already e.g. `host-port:pod-port`

### Add model to openAD toolkit
```shell
catalog model service from remote 'http://localhost:8080' as 'gen_model'
```

Generation Service for Sky Server

1. Install Sky  with `pip install "skypilot-nightly[aws]"`

2. setup your aws command line

3. run `sky check`

4. run `sky serve up generation_service.yaml`
This will take about 10 minutes to deploy  it can be monitored through the controllers logs.
e.g. `sky serve logs sky-service-0af4  --controller`
