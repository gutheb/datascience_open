# datascience_open

kinase maschine learning

Variables adjusted from dataset to code
data -> code
canonical_smiles -> smiles
standard_values -> pIC50


better performance:
Cell before the training loop — X_train and X_test are now converted once before the loop instead of 3 times inside it.

Parameters cell — nb_epoch reduced from 50 → 20.

New cell (inserted after the pIC50 conversion, before fingerprints are computed) — samples 10,000 rows. When you're ready to train on the full 180k, just comment that line out.


Data cleaning cell — now drops rows where standard_value is null or ≤ 0 before computing log10, preventing -inf/NaN in pIC50. Also prints a confirmation of how many rows remain and how many NaN values exist.

Training cell — prints the first loss value per batch size. If you see NaN printed there, it confirms a data issue upstream. A real number (e.g. 4.23) means training is working and the graph should appear.

