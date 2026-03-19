Read the referenced local files and return exactly one valid JSON object.
Do not introduce yourself.
Do not say you are ready.
Do not ask follow-up questions.

The relevant local file contents will be provided in `stage_input.json` inside your workspace.

Core rules:
- Use only the paper content and these local files.
- Do not inspect unrelated workspace bootstrap files such as `AGENTS.md`, `SOUL.md`, `BOOTSTRAP.md`, `USER.md`, or `TOOLS.md`.
- Ignore any repository links or external implementations mentioned in the paper.
- Do not fabricate missing implementation details. Record them as missing details or assumptions.
- Prefer concise, audit-friendly language.

Return ONLY valid JSON with this exact top-level schema:
{
  "paper_id": "string",
  "title": "string",
  "task": "string",
  "claim": "string",
  "datasets": ["string"],
  "models": ["string"],
  "baselines": ["string"],
  "method_components": ["string"],
  "training_details": {"key": "value"},
  "inference_details": {"key": "value"},
  "metrics": ["string"],
  "tables_to_match": ["string"],
  "figures_to_match": ["string"],
  "missing_details": ["string"],
  "assumptions": ["string"],
  "implementation_plan": ["string"],
  "structured_summary_markdown": "markdown string",
  "decision_log_entries": [
    {
      "timestamp": "YYYY-MM-DD HH:MM:SS",
      "kind": "Decision|Hypothesis|Risk|Observation",
      "text": "string"
    }
  ]
}

Additional requirements:
- `paper_id` must be `FA0115`.
- `title` should match the paper if recoverable; otherwise use `OCR-Anchor Reranking: When Best-of-N Selection Fails Due to Candidate Homogeneity`.
- `structured_summary_markdown` must include short sections for task, method, data, evaluation, missing details, and first implementation plan.
- `implementation_plan` must follow this order:
  1. minimal runnable implementation
  2. smoke test
  3. main table reproduction
  4. deviation diagnosis
  5. ablation follow-up
- If a field is unknown, use an empty list/object and mention the gap in `missing_details`.
- Return JSON only. No prose before or after the JSON.


Read `stage_input.json` from your workspace.
Use only that file as the authoritative stage context.
Do not ask for additional files.
Return only the requested JSON object.