# Experimental Evaluation Pipeline

This folder is a standalone copy of the paper evaluation pipeline.

## Project Root

- Root: `C:\Users\Administrator\Desktop\AI communication\Experimental evaluation`
- Main launcher: `Run-PaperEval.ps1`
- Python entry: `scripts\paper_eval_pipeline.py`
- Runtime: `scripts\paper_eval_runtime.py`
- Prompt templates: `prompts\paper_eval\`
- Paper metadata index: `data\analemma_fars_papers.json`

## What This Project Does

This project runs the full paper evaluation pipeline with these stages:

1. code open-source and initial scoring
2. reproduction agent and environment
3. multimodal logic chain
4. literature comparison and optimization
5. multi-agent comprehensive review
6. final evaluation result

It also writes:

- a live acceptance document during the run
- a reproduction report in markdown, DOCX, and PDF
- final evaluation report and score JSON

## Requirements

Install Python dependencies:

```powershell
python -m pip install -r .\requirements.txt
```

The project also expects these CLIs to be available in your environment:

- `codex`
- `opencode`

## Quick Start

Open PowerShell in this folder and run:

```powershell
Set-Location "C:\Users\Administrator\Desktop\AI communication\Experimental evaluation"

.\Run-PaperEval.ps1 `
  -PaperPdf "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\paper.pdf" `
  -OutputDir ".\output\FA0115_Run"
```

## Dry Run

```powershell
.\Run-PaperEval.ps1 `
  -PaperPdf "C:\Users\Administrator\Desktop\AI communication\output\analemma_fars_20260318\spec_templates\FA0115\paper.pdf" `
  -OutputDir ".\output\FA0115_DryRun" `
  -DryRun
```

## Outputs

After a full run, the output directory will include:

- `pipeline_acceptance_live.docx`
- `pipeline_acceptance_live.md`
- `reproduction_report.md`
- `reproduction_report.docx`
- `reproduction_report.pdf`
- `final_evaluation_report.md`
- `final_confidence_score.json`
- `timeline.jsonl`
- `pipeline_run_summary.json`

## Notes

- The default paper metadata index is bundled locally in `data\analemma_fars_papers.json`.
- If a stage model call is too slow or invalid, the runtime falls back to deterministic local handling so the pipeline can still complete.
- The launcher prints the final artifact paths and the final scores after completion.
