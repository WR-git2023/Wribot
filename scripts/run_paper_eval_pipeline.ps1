param(
    [Parameter(Mandatory = $true)]
    [string]$PaperPdf,

    [string]$OutputDir = "",

    [string[]]$Stages = @("open_source", "reproduction", "logic", "literature", "review"),

    [string]$Agent = "main",

    [string]$PaperIndexJson = ".\data\analemma_fars_papers.json",

    [string]$CodeUrl = "",

    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$ScriptDir = $PSScriptRoot
$RepoRoot = Split-Path $ScriptDir -Parent
$PipelineScript = Join-Path $RepoRoot "scripts\paper_eval_pipeline.py"

if (-not (Test-Path $PipelineScript)) {
    throw "Pipeline script not found: $PipelineScript"
}

if (-not [System.IO.Path]::IsPathRooted($PaperPdf)) {
    $PaperPdf = Join-Path $RepoRoot $PaperPdf
}

if ($OutputDir -ne "" -and -not [System.IO.Path]::IsPathRooted($OutputDir)) {
    $OutputDir = Join-Path $RepoRoot $OutputDir
}

if (-not [System.IO.Path]::IsPathRooted($PaperIndexJson)) {
    $PaperIndexJson = Join-Path $RepoRoot $PaperIndexJson
}

if (-not (Test-Path $PaperPdf)) {
    throw "Paper PDF not found: $PaperPdf"
}

$pythonArgs = @(
    $PipelineScript,
    "--paper-pdf", $PaperPdf,
    "--agent", $Agent,
    "--paper-index-json", $PaperIndexJson
)

if ($OutputDir -ne "") {
    $pythonArgs += @("--output-dir", $OutputDir)
}

if ($CodeUrl -ne "") {
    $pythonArgs += @("--code-url", $CodeUrl)
}

if ($Stages.Count -gt 0) {
    $pythonArgs += "--stages"
    $pythonArgs += $Stages
}

if ($DryRun) {
    $pythonArgs += "--dry-run"
}

Write-Host "Running paper evaluation pipeline..."
Write-Host "PaperPdf: $PaperPdf"
if ($OutputDir -ne "") {
    Write-Host "OutputDir: $OutputDir"
}
Write-Host "Stages: $($Stages -join ', ')"
Write-Host "General backend: codex / gpt-5.3-codex"
Write-Host "Review backends: codex / gpt-5.3-codex + opencode / mimo-v2-omni-free"
Write-Host "Legacy Agent Arg: $Agent"
if ($DryRun) {
    Write-Host "Mode: dry-run"
}

python @pythonArgs
