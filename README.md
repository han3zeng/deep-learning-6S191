# MIT 6.S191 — Introduction to Deep Learning

My working repository for **MIT 6.S191: Introduction to Deep Learning**. I use it as a structured study record and an interview-preparation reference: each lab pairs course material with runnable TensorFlow and/or PyTorch notebooks, solutions supplied by the course, and selected notes or generated artifacts.

This is a learning workspace, not a production machine-learning library. The original lab material is from [MIT Deep Learning](https://introtodeeplearning.com/); my progress, notes, environment configuration, and experiment outputs live here.

## What I am practicing

- Building and training neural networks in TensorFlow/Keras and PyTorch
- Sequence modeling and RNN-based music generation
- CNN image classification and the trade-offs behind model evaluation
- Bias measurement and mitigation in facial-detection systems with VAEs and DB-VAEs
- LLM prompting, tokenization, parameter-efficient fine-tuning, and LLM-as-a-judge evaluation

## Repository guide

| Location | Contents | Status |
| --- | --- | --- |
| [`src/lab1/`](src/lab1/) | Framework introductions and character-level RNN music generation. Includes TensorFlow and PyTorch notebooks, course solutions, and generated `.wav` samples. | Completed |
| [`src/lab2/`](src/lab2/) | Computer-vision notebooks: MNIST classification with dense networks/CNNs and debiasing facial-detection systems using VAEs and DB-VAEs. TensorFlow and PyTorch variants are included. | Done |
| [`src/lab3/`](src/lab3/) | LLM fine-tuning notebook plus personal concept notes in [`takeaway.ipynb`](src/lab3/takeaway.ipynb). Covers style tuning of Liquid AI's LFM2-1.2B, LoRA, and evaluation with a judge model and Opik. | In progress |
## Notebook map

### Lab 1 — Foundations and music generation

- `TF_Part1_Intro.ipynb` / `PT_Part1_Intro.ipynb`: tensors, automatic differentiation, and basic neural networks in TensorFlow and PyTorch.
- `TF_Part2_Music_Generation.ipynb` / `PT_Part2_Music_Generation.ipynb`: character-level RNNs that generate music encoded in ABC notation.
- `output_0.wav` and `output_1.wav`: generated music samples.

### Lab 2 — Computer vision and responsible ML

- `TF_Part1_MNIST.ipynb` / `PT_Part1_MNIST.ipynb`: MNIST digit classification, comparing fully connected and convolutional models.
- `TF_Part2_Debiasing.ipynb` / `PT_Part2_Debiasing.ipynb`: facial-detection bias analysis and mitigation with variational autoencoders (VAEs) and debiasing VAEs (DB-VAEs).

### Lab 3 — LLM fine-tuning and evaluation

- `LLM_Finetuning.ipynb`: chat templates, BPE tokenization, causal language modeling, LoRA fine-tuning, and evaluation of style adherence.
- `takeaway.ipynb`: my notes on templates, tokenization, autoregressive language models, and fine-tuning.

## Run locally with Docker


```bash
docker build -t deep-learning-6s191 .
docker run --rm -it -p 8888:8888 \
  -v "$PWD/src":/usr/local/app/src \
  deep-learning-6s191
```

