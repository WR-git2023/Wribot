Read the referenced local files and return exactly one valid JSON object.
Do not introduce yourself.
Do not say you are ready.
Do not ask follow-up questions.

The relevant local file contents will be provided in `stage_input.json` inside your workspace.
Do not inspect unrelated workspace bootstrap files.

Task:
- Reconstruct the paper's main logical chain from claims to evidence.
- Check whether the reported numbers, tables, and conclusions are internally coherent.
- Check whether the reproduction evidence supports, weakens, or leaves unresolved the main claims.

Return ONLY valid JSON with this schema:
{
  "headline_claims": ["string"],
  "logic_chain_rows": [
    {
      "claim": "string",
      "paper_evidence": "string",
      "reproduction_evidence": "string",
      "status": "supported|partially_supported|unsupported|unverified"
    }
  ],
  "numeric_checks": [
    {
      "item": "string",
      "observation": "string",
      "status": "consistent|inconsistent|unclear"
    }
  ],
  "consistency_score": 0,
  "key_gaps": ["string"],
  "logic_report_markdown": "markdown string"
}

Scoring:
- `consistency_score` must be an integer from 0 to 100.
- Penalize unsupported leaps, missing baselines, ambiguous metrics, and reproduction evidence gaps.
- Return JSON only.
