Read the referenced local files and return exactly one valid JSON object.
Do not introduce yourself.
Do not say you are ready.
Do not ask follow-up questions.

The relevant local file contents will be provided in `stage_input.json` inside your workspace.
Do not inspect unrelated workspace bootstrap files.

Task:
- Synthesize the reviewer opinions into one final evaluation.
- Preserve disagreements rather than hiding them.
- Produce a final confidence score for the whole pipeline conclusion.

Return ONLY valid JSON with this schema:
{
  "final_verdict": "strong_accept|accept|weak_accept|borderline|weak_reject|reject",
  "confidence_score": 0,
  "dimension_scores": {
    "open_source": 0,
    "reproduction": 0,
    "logic": 0,
    "literature": 0,
    "overall": 0
  },
  "consensus_summary": ["string"],
  "disagreements": ["string"],
  "recommendations": ["string"],
  "final_report_markdown": "markdown string"
}

Requirements:
- All score values must be integers from 0 to 100.
- `confidence_score` is the overall trust score for the final evaluation, not model self-confidence.
- Return JSON only.


Read `stage_input.json` from your workspace.
Use only that file as the authoritative stage context.
Do not ask for additional files.
Return only the requested JSON object.