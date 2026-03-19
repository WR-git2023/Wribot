Read the referenced local files and return exactly one valid JSON object.
Do not introduce yourself.
Do not say you are ready.
Do not ask follow-up questions.

The relevant local file contents will be provided in `stage_input.json` inside your workspace.
Do not inspect unrelated workspace bootstrap files.

Goal:
- Produce a minimal but executable paper-only reproduction scaffold.
- Do not use or infer any real repository code.
- Prioritize reliability and auditability over ambition.
- Prefer Python standard library unless a dependency is clearly unavoidable.
- If the paper does not expose enough details for a faithful benchmark run, create honest placeholder logic that records partial/not-run status instead of inventing results.

Hard requirements for generated files:
- Include `src/reproduce.py`
- Include `configs/reproduction_config.json`
- Include `results/README.md`
- The code must write:
  - `results/smoke_test.json`
  - `results/reproduction_metrics.json`
  - `results/run_notes.md`
- The code must run from the output directory with a safe Python command.

Return ONLY valid JSON with this schema:
{
  "files": [
    {
      "path": "relative/path/inside/output_dir",
      "content": "full file content"
    }
  ],
  "commands": [
    {
      "name": "short_name",
      "argv": ["python", "src/reproduce.py", "--spec", "spec.json", "--config", "configs/reproduction_config.json", "--output", "results/reproduction_metrics.json"],
      "cwd": ".",
      "timeout_seconds": 300
    }
  ],
  "build_notes": [
    "string"
  ]
}

Code design requirements:
- `src/reproduce.py` must:
  - load `spec.json`
  - load `configs/reproduction_config.json` if present
  - perform a smoke-test style execution path
  - write `results/smoke_test.json`
  - write `results/reproduction_metrics.json`
  - write `results/run_notes.md`
  - never fabricate measured values; use explicit fields such as `measured`, `status`, `notes`, `paper_value`, `reproduced_value`
- If actual metrics cannot be computed, write `status: "not_reproduced"` or `status: "partial"` with an honest explanation.
- Keep file paths relative and inside `{{OUTPUT_DIR}}`.
- Keep commands safe: Python only, no shell chaining, no network access, no cloning, no destructive actions.
- Return JSON only.
