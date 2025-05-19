# Generation &nbsp;/&nbsp; Generative Models with SMILES or SELFIES Output

<!--
The description & support tags are consumed by the generate_docs() script
in the openad-website repo, to generate the 'Available Services' page:
https://openad.accelerate.science/docs/model-service/available-services
-->

<!-- support:apple_silicon:false -->
<!-- support:gcloud:true -->

<!-- description -->
This OpenAD service provides access to generative algorithms that output SMILES or SELFIES.

- [Regression Transformer, 2023](https://github.com/IBM/regression-transformer). Uses transformers for both regression and generation. Generates SELFIES based on desired properties.
- [PaccMann, 2020](https://paccmann.github.io/). Uses autoencoders to generate molecules to target cancer based on omics profiles.
- [TorchDrug, 2021](https://torchdrug.ai/). Offers two kinds of graph-based networks to generate SMILES: [GCPN](https://proceedings.neurips.cc/paper_files/paper/2018/file/d60678e8f2ba9c540798ebbde31177e8-Paper.pdf) and [GraphAF](https://arxiv.org/pdf/2001.09382).
- [MOSES, 2020](https://github.com/molecularsets/moses). [GuacaMol, 2019](https://github.com/BenevolentAI/guacamol). And more.

These generative algorithms were previously offered in [the open source library, GT4SD](https://github.com/GT4SD/gt4sd-core).  
<!-- /description -->

For instructions on how to deploy and use this service in OpenAD, please refer to the [OpenAD docs](https://openad.accelerate.science/docs/model-service/deploying-models).

<br>

## Deployment Options

- ❌ [Deployment via container + compose.yaml](https://openad.accelerate.science/docs/model-service/deploying-models#deployment-via-container-composeyaml-recommended)
- ✅ [Deployment via container](https://openad.accelerate.science/docs/model-service/deploying-models#deployment-via-container)
- ✅ [Local deployment using a Python virtual environment](https://openad.accelerate.science/docs/model-service/deploying-models#local-deployment-using-a-python-virtual-environment)
- ✅ [Cloud deployment to Google Cloud Run](https://openad.accelerate.science/docs/model-service/deploying-models#cloud-deployment-to-google-cloud-run)
- ❌ [Cloud deployment to Red Hat OpenShift](https://openad.accelerate.science/docs/model-service/deploying-models#cloud-deployment-to-red-hat-openshift)
- ✅ [Cloud deployment to SkyPilot on AWS](https://openad.accelerate.science/docs/model-service/deploying-models/#cloud-deployment-to-skypilot-on-aws)
