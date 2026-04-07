# datascience_open

### kinase maschine learning

# Variables adjusted from dataset or tutorial to code

data/tutorial -> code
canonical_smiles -> smiles
standard_values -> pIC50
DATA -> HERE #stuff is here not in data
.hdf5 -> h5


# Better performance:

Cell before the training loop — X_train and X_test are now converted once before the loop instead of 3 times inside it.

Parameters cell — nb_epoch reduced from 50 → 20.

New cell (inserted after the pIC50 conversion, before fingerprints are computed) — samples 10,000 rows. When you're ready to train on the full 180k, just comment that line out.


# Some cleaning
Data cleaning cell — now drops rows where standard_value is null or ≤ 0 before computing log10, preventing -inf/NaN in pIC50. Also prints a confirmation of how many rows remain and how many NaN values exist.

Training cell — prints the first loss value per batch size. If you see NaN printed there, it confirms a data issue upstream. A real number (e.g. 4.23) means training is working and the graph should appear.


# Bug fixes commented by claude sonnet 4.6

- `filepath = DATA / "best_weights.weights.h5"` → `filepath = HERE / "best_weights.weights.h5"`: DATA is a file, not a folder.
- Model loading: `load_model("ANN_model.hdf5")` replaced with rebuilding the architecture and loading saved weights via `model.load_weights("best_weights.weights.h5")`, since only weights were saved (not the full model).
- evaluate/predict cells: replaced redundant `np.array(list((x_test))).astype(float)` with pre-computed `X_test`.


# second traing data
Tang, we (2024), “Prediction of pIC50 bioactive values based on knowledge priors and attention neural networks”, Mendeley Data, V1, doi: 10.17632/4pvs4w3dng.1