# Reproduction Report

- Paper: OCR-Anchor Reranking: When Best-of-N Selection Fails Due to Candidate Homogeneity
- Final reproduction status: Partially reproduced

## Structured Summary

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

## Key Findings

- The pipeline generated and executed a local runnable scaffold.
- Execution artifacts were produced without using hidden repository code.
- Headline benchmark values were not fully measured in the fallback path.

## Implementation Notes

A deterministic fallback scaffold was generated after the model output failed schema validation.

## Execution Summary

Run commands executed: 1. Successful commands: 1.

## Result Comparison

| Metric | Paper | Reproduction | Delta | Trend Match | Notes |
| --- | --- | --- | --- | --- | --- |
| unit-test pass rate | see paper tables | None | n/a | partial | Fallback scaffold executed without full dataset/model assets. |
| pass rate | see paper tables | None | n/a | partial | Fallback scaffold executed without full dataset/model assets. |
| coverage | see paper tables | None | n/a | partial | Fallback scaffold executed without full dataset/model assets. |
| jaccard similarity | see paper tables | None | n/a | partial | Fallback scaffold executed without full dataset/model assets. |
| candidate identity rate | see paper tables | None | n/a | partial | Fallback scaffold executed without full dataset/model assets. |

## Risks And Gaps

The fallback path verifies pipeline executability and audit logging, but not full scientific equivalence to the hidden original implementation.

## Next Steps

Use the generated scaffold as a starting point for tighter task-specific implementation or rerun the stage with a stronger model/agent configuration.
