Read the referenced local files and return exactly one valid JSON object.
Do not introduce yourself.
Do not say you are ready.
Do not ask follow-up questions.

The relevant local file contents will be provided in `stage_input.json` inside your workspace.
Do not inspect unrelated workspace bootstrap files.

Task:
- Evaluate the paper repository openness and initial reproduction friendliness.
- Use the deterministic evidence in `stage_input.json` as the ground truth for accessibility, host, HTTP status, and high-level metadata signals.
- Produce a concise but auditable report.

Return ONLY valid JSON with this schema:
{
  "paper_id": "string",
  "title": "string",
  "code_url": "string",
  "repo_access": true,
  "open_source_level": "fully_open|partially_open|unavailable_or_closed",
  "initial_open_source_score": 0,
  "evidence": ["string"],
  "reproduction_implications": ["string"],
  "report_markdown": "markdown string"
}

Requirements:
- `initial_open_source_score` must be an integer from 0 to 100.
- Do not claim repository details that are absent from `stage_input.json`.
- `report_markdown` should include:
  - conclusion
  - evidence
  - rationale
  - reproduction implications
- Return JSON only.
