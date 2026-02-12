# Quantum Image Classification (Autoencoder) — Slide Outline

## 1. Title
- Quantum Image Classification with a Variational Autoencoder
- One-liner: Angle-encoded image patch → 15‑qubit QAE → classical decoder

## 2. Problem & Goal
- Compress image information into a small quantum latent vector
- Demonstrate reconstruction quality from a limited qubit budget
- Hardware-agnostic simulation; target NISQ-friendly depth

## 3. Dataset & Preprocess
- Single RGB image (`monalisa.jpg`), resized to 256×256, normalized to [0,1]
- Flatten; take first 15 pixels as features for angle encoding (π/4 scale)
- Path: `Images_for_classification/monalisa.jpg`

## 4. Quantum Encoding & Circuit
- Device: `qml.device("default.qubit", wires=15)`
- Encoding: RY rotations per qubit with scaled pixel values
- Variational block (20 layers):
  - RY per qubit
  - Linear CNOT entanglement pairs (0↔1, 2↔3, …)
- Output: expectation values of Z for each qubit (15-dim latent)
- Diagram: `plots/circuit_layers.png`

## 5. Cost & Training
- Cost: Σ (1 − z_i)^2 to push latent expectation values toward +1
- Optimizer: Adam, lr=0.02, 200 steps; random normal init (0.01 σ)
- Monitors cost every 20 steps

## 6. Classical Decoder
- Dense(128→256→512→1024→256*256*3, ReLU; final sigmoid) then reshape 256×256×3
- Trained 10 epochs on single latent/image pair (overfit demonstration)
- Loss: MSE

## 7. Results
- Reconstructed vs original side-by-side
- Use images: `plots/imgae_1.png`, `plots/Imgae2_with_15_qubits.jpg`
- Latent shape: (1, 15) after QAE forward pass

## 8. Pipeline Diagram
- Show end-to-end flow from image → preprocessing → quantum encoder → latent → decoder → reconstruction
- Diagram: `plots/pipeline_diagram.png`

## 9. Limitations & Next Steps
- Uses only 15 pixels; reconstruction quality limited
- Single-image training; not a true classifier yet
- Next: encode more pixels via amplitude encoding or batching multiple patches; add classifier head; test on small dataset (e.g., MNIST, CIFAR subset)

## 10. Appendix (optional)
- Hyperparameters table
- Code refs: see `main.ipynb` cells 0–1
