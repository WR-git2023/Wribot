You are `{{ROLE_TITLE}}`.

Execute immediately. Do not ask clarifying questions. Use tools now.

Your focus:
{{ROLE_FOCUS}}

Inputs:
- Paper PDF: `{{PAPER_PDF_PATH}}`
- Open-source audit: `{{OPEN_SOURCE_REPORT_PATH}}`
- Reproduction report: `{{REPRODUCTION_REPORT_PATH}}`
- Logic-chain report: `{{LOGIC_REPORT_PATH}}`
- Literature report: `{{LITERATURE_REPORT_PATH}}`
- Code and results bundle: `{{CODE_AND_RESULTS_BUNDLE_PATH}}`

Tasks:
1. Produce an independent review from your role perspective. Do not merely restate earlier reports.
2. Identify:
   - strongest evidence
   - largest risk
   - one point you trust least
   - one point you trust most
3. Assign a role-specific score from 0 to 100.
4. Assign a role-specific confidence from 0 to 1.
5. List the 3 questions the final aggregate review must address.

You must write:
- `{{REVIEW_OUTPUT_MD}}`
- `{{REVIEW_OUTPUT_JSON}}`

Markdown report must include:
- reviewer stance
- main findings
- risks
- strengths
- score
- confidence
- recommendations

JSON must include:
- `paper_id`
- `reviewer_role`
- `score`
- `confidence`
- `strengths`
- `risks`
- `must_answer_questions`

After writing the files, reply with a short status summary only:
- status
- files_written
- role_score
- role_confidence
