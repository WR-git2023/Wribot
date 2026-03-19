from __future__ import annotations

import argparse
import json
from datetime import datetime
from pathlib import Path


def load_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, payload):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--spec", required=True)
    parser.add_argument("--config", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    spec = load_json(Path(args.spec))
    config = load_json(Path(args.config))
    output_path = Path(args.output)
    results_dir = output_path.parent
    results_dir.mkdir(parents=True, exist_ok=True)

    smoke = {
        "timestamp": datetime.now().isoformat(timespec="seconds"),
        "status": "ok",
        "paper_id": spec.get("paper_id"),
        "checked_inputs": {
            "spec_exists": Path(args.spec).exists(),
            "config_exists": Path(args.config).exists(),
        },
        "notes": [
            "Executed local fallback scaffold.",
            "No hidden repository code or private experiment assets were used.",
        ],
    }
    write_json(results_dir / "smoke_test.json", smoke)

    metrics = []
    for metric in spec.get("metrics", []) or ["paper_metric_unspecified"]:
        metrics.append(
            {
                "metric": metric,
                "paper_value": "see paper tables",
                "reproduced_value": None,
                "measured": False,
                "status": "partial",
                "notes": "Fallback scaffold executed without full dataset/model assets.",
            }
        )

    summary = {
        "timestamp": datetime.now().isoformat(timespec="seconds"),
        "paper_id": spec.get("paper_id"),
        "status": "partial",
        "measured": False,
        "config": config,
        "metrics": metrics,
        "summary": "The fallback scaffold ran successfully, but headline benchmark values were not measured locally.",
    }
    write_json(output_path, summary)
    (results_dir / "run_notes.md").write_text(
        "# Run Notes\n\n"
        "- Mode: local fallback scaffold\n"
        "- Result: executable smoke-test completed\n"
        "- Limitation: headline metrics were not measured without the original hidden implementation and assets\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
