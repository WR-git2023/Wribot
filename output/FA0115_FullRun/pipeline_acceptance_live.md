# Pipeline Final Acceptance Run

- Paper ID: FA0115
- Title: OCR-Anchor Reranking: When Best-of-N Selection Fails Due to Candidate Homogeneity
- Output directory: C:\Users\Administrator\Desktop\AI communication\Experimental evaluation\output\FA0115_FullRun
- Last updated: 2026-03-20T02:05:58
- Pipeline status: ok

## Stage Status

- open_source: ok (started=2026-03-20T01:47:35, completed=2026-03-20T01:48:39)
- reproduction: ok (started=2026-03-20T01:48:39, completed=2026-03-20T01:53:14)
- logic: ok (started=2026-03-20T01:53:14, completed=2026-03-20T01:54:46)
- literature: ok (started=2026-03-20T01:54:46, completed=2026-03-20T01:56:18)
- review: ok (started=2026-03-20T01:56:18, completed=2026-03-20T02:05:58)

## Scores

- Open-source score: 85
- Reproduction score/status: 58
- Logic score: 58
- Literature score: 55
- Final score: 63
- Final verdict: weak_accept

## Artifact Paths

- Acceptance DOCX: C:\Users\Administrator\Desktop\AI communication\Experimental evaluation\output\FA0115_FullRun\pipeline_acceptance_live.docx
- Reproduction report DOCX: C:\Users\Administrator\Desktop\AI communication\Experimental evaluation\output\FA0115_FullRun\reproduction_report.docx
- Reproduction report PDF: C:\Users\Administrator\Desktop\AI communication\Experimental evaluation\output\FA0115_FullRun\reproduction_report.pdf

## Recent Timeline

- 2026-03-20T01:54:46 | literature | start | running | comparing related work via codex
- 2026-03-20T01:56:18 | literature | fallback | ok | codex stage literature failed: timed out after 90s
- 2026-03-20T01:56:18 | literature | finish | ok | literature_score=55
- 2026-03-20T01:56:18 | review | start | running | launching codex + opencode reviewers
- 2026-03-20T01:56:18 | review | reviewer_code_audit_start | running | backend=codex model=gpt-5.3-codex
- 2026-03-20T01:58:20 | review | reviewer_code_audit_fallback | ok | codex stage review_code_audit failed: timed out after 120s
- 2026-03-20T01:58:20 | review | reviewer_code_audit | ok | backend=codex verdict=approve_with_reservations confidence=0.62
- 2026-03-20T01:58:20 | review | reviewer_repro_verifier_start | running | backend=opencode model=opencode/mimo-v2-omni-free
- 2026-03-20T02:00:22 | review | reviewer_repro_verifier_fallback | ok | opencode stage review_repro_verifier failed: timed out after 120s
- 2026-03-20T02:00:22 | review | reviewer_repro_verifier | ok | backend=opencode verdict=approve_with_reservations confidence=0.62
- 2026-03-20T02:00:22 | review | reviewer_method_reviewer_start | running | backend=codex model=gpt-5.3-codex
- 2026-03-20T02:02:24 | review | reviewer_method_reviewer_fallback | ok | codex stage review_method_reviewer failed: timed out after 120s
- 2026-03-20T02:02:24 | review | reviewer_method_reviewer | ok | backend=codex verdict=approve_with_reservations confidence=0.62
- 2026-03-20T02:02:24 | review | reviewer_literature_reviewer_start | running | backend=opencode model=opencode/mimo-v2-omni-free
- 2026-03-20T02:04:25 | review | reviewer_literature_reviewer_fallback | ok | opencode stage review_literature_reviewer failed: timed out after 120s
- 2026-03-20T02:04:25 | review | reviewer_literature_reviewer | ok | backend=opencode verdict=approve_with_reservations confidence=0.62
- 2026-03-20T02:04:26 | review | aggregate_start | running | backend=codex model=gpt-5.3-codex
- 2026-03-20T02:05:57 | review | aggregate_fallback | ok | codex stage review_aggregate failed: timed out after 90s
- 2026-03-20T02:05:57 | review | finish | ok | final_verdict=weak_accept confidence=63
- 2026-03-20T02:05:58 | pipeline | finish | ok | all requested stages completed
