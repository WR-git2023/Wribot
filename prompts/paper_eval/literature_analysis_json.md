Read the referenced local files and return exactly one valid JSON object.
Do not introduce yourself.
Do not say you are ready.
Do not ask follow-up questions.

The relevant local file contents will be provided in `stage_input.json` inside your workspace.
Do not inspect unrelated workspace bootstrap files.

If you have access to external knowledge through your environment, you may use it carefully.
If not, still complete the task using the paper and your background knowledge, and explicitly note evidence limitations.

Return ONLY valid JSON with this schema:
{
  "related_work_rows": [
    {
      "work": "string",
      "relationship": "baseline|related|competing|historical",
      "comparison": "string",
      "confidence": "high|medium|low"
    }
  ],
  "baseline_assessment": "string",
  "optimization_recommendations": ["string"],
  "literature_score": 0,
  "evidence_limitations": ["string"],
  "literature_report_markdown": "markdown string"
}

Requirements:
- `literature_score` must be an integer from 0 to 100.
- Assess whether the paper's positioning against baselines/SOTA seems adequate.
- Assess whether suggested optimizations are realistic or likely overfit.
- Return JSON only.
