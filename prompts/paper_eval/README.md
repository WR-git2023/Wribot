# Paper Eval Pipeline

This folder contains the stage prompts used by the reliable paper evaluation pipeline.

The current implementation uses a strict contract:
- Model-first stage execution through isolated OpenClaw agents
- JSON-only stage outputs
- Local Python file writing and hard output validation
- Deterministic fallback generation when the model violates the JSON schema

## Stage Mapping

1. `reproduction_extract_json.md`
   Extracts a structured reproduction spec from paper-derived context.
2. `reproduction_build_json.md`
   Proposes runnable scaffold files and safe commands.
3. `reproduction_finalize_json.md`
   Converts execution artifacts into a reproduction report and comparison table.
4. `logic_chain_json.md`
   Builds the multimodal logic chain and scores logical consistency.
5. `literature_analysis_json.md`
   Compares related work, baseline/SOTA position, and optimization opportunities.
6. `review_role_json.md` + `review_aggregate_json.md`
   Runs isolated reviewer roles and a final aggregate chair review.

`open_source` is handled deterministically in Python and does not require a prompt.

## Runner

Main Python entry:
- `scripts/paper_eval_pipeline.py`

Runtime implementation:
- `scripts/paper_eval_runtime.py`

PowerShell wrapper:
- `scripts/run_paper_eval_pipeline.ps1`

## Example Commands

Dry run:

```powershell
python scripts\paper_eval_pipeline.py `
  --paper-pdf "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\paper.pdf" `
  --output-dir "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\Pipeline_DryRun" `
  --dry-run
```

Run only the open-source audit:

```powershell
python scripts\paper_eval_pipeline.py `
  --paper-pdf "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\paper.pdf" `
  --output-dir "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\Paper_CodeReproduction" `
  --stages open_source
```

Run the full pipeline through the PowerShell wrapper:

```powershell
.\scripts\run_paper_eval_pipeline.ps1 `
  -PaperPdf "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\paper.pdf" `
  -OutputDir "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\Paper_CodeReproduction"
```

## Reliability Model

- The pipeline inherits the bound model from the selected OpenClaw base agent, then creates fresh isolated agents for:
  - `reproduction`
  - `logic`
  - `literature`
  - `review_aggregate`
  - each reviewer role
- Every stage must generate required files or the stage is marked failed.
- If a model reply is non-JSON or schema-invalid, the runtime records that failure in `timeline.jsonl` and uses a deterministic fallback path so the pipeline can still complete.

Run logs are always written under:
- `runs/openclaw/<stage>/prompt.md`
- `runs/openclaw/<stage>/stdout_attempt_<n>.txt`
- `runs/openclaw/<stage>/stderr_attempt_<n>.txt`
- `runs/openclaw/<stage>/result.json`

This makes it easy to audit whether a stage completed through model output or through fallback handling.
