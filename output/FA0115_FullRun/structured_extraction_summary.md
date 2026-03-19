## Task
ABSTRACT Best-of-N sampling has shown success in improving language model outputs for reasoning tasks.

## Claim
ABSTRACT Best-of-N sampling has shown success in improving language model outputs for reasoning tasks. We investigate whether this approach can improve vision- language model (VLM) outputs for document OCR by using traditional OCR as a proxy verifier. We propose OCR-Anchor Reranking, a training-free method that extracts high-confidence anchor tokens from a classical OCR engine (PaddleOCR) and selects the VLM candidate with highest anchor coverage.

## Data
- olmOCR-Bench
- containing 1,403 pages and 7,019 unit tests across 7 categories

## Method
- OCR-anchor extraction
- Coverage scoring
- Anchor coverage selection
- Consensus selection

## Evaluation
- Metric: unit-test pass rate
- Metric: pass rate
- Metric: coverage
- Metric: jaccard similarity
- Metric: candidate identity rate
- Table target: Table 1 presents the main results across all methods and categories. The key finding is that all selec-
- Table target: Table 1: Main results on olmOCR-Bench (unit-test pass rate %). All methods perform within a
- Table target: Table 2: Diagnostic statistics revealing the root cause of method failure. At low temperature, candi-

## Missing Details
- Exact preprocessing scripts and environment setup are not fully specified in the paper-only input.
- Dataset acquisition and experiment driver scripts are not directly available without repository access.
- Some implementation defaults must be approximated for a runnable scaffold.

## Initial Plan
- minimal runnable implementation
- smoke test
- main table reproduction
- deviation diagnosis
- ablation follow-up
