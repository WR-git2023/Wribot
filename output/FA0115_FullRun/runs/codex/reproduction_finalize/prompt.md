Read the referenced local files and return exactly one valid JSON object.
Do not introduce yourself.
Do not say you are ready.
Do not ask follow-up questions.

The relevant local file contents will be provided in `stage_input.json` inside your workspace.

Use only what is actually present in those files.
Do not inspect unrelated workspace bootstrap files.
Do not fabricate successful reproduction if the execution artifacts do not support it.

Return ONLY valid JSON with this schema:
{
  "final_reproduction_status": "Fully reproduced|Partially reproduced|Trend reproduced|Not reproduced",
  "comparison_rows": [
    {
      "metric": "string",
      "paper_value": "string",
      "reproduced_value": "string",
      "delta": "string",
      "trend_match": "yes|no|partial",
      "notes": "string"
    }
  ],
  "key_findings": ["string"],
  "report_sections": {
    "implementation": "markdown string",
    "execution": "markdown string",
    "risks": "markdown string",
    "next_steps": "markdown string"
  },
  "bundle_sections": {
    "results": "markdown string"
  },
  "decision_log_entries": [
    {
      "timestamp": "YYYY-MM-DD HH:MM:SS",
      "kind": "Result|Failure|Fix|Decision",
      "text": "string"
    }
  ]
}

Decision rules:
- Use `Fully reproduced` only if execution artifacts credibly support the main reported result.
- Use `Trend reproduced` when the direction of the main claim is supported but the numbers are not matched.
- Use `Partially reproduced` when the pipeline runs and some non-trivial evidence exists, but main claims remain incomplete.
- Use `Not reproduced` when execution stayed at smoke-test/scaffold level or evidence is insufficient.
- Return JSON only.


Read `stage_input.json` from your workspace.
Use only that file as the authoritative stage context.
Do not ask for additional files.
Return only the requested JSON object.