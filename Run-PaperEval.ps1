param(
    [Parameter(Mandatory = $true)]
    [string]$PaperPdf,

    [string]$OutputDir = "",

    [string[]]$Stages = @("open_source", "reproduction", "logic", "literature", "review"),

    [string]$PaperIndexJson = ".\data\analemma_fars_papers.json",

    [string]$CodeUrl = "",

    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$ScriptPath = Join-Path $PSScriptRoot "scripts\run_paper_eval_pipeline.ps1"

if (-not (Test-Path $ScriptPath)) {
    throw "Pipeline wrapper not found: $ScriptPath"
}

& $ScriptPath `
    -PaperPdf $PaperPdf `
    -OutputDir $OutputDir `
    -Stages $Stages `
    -PaperIndexJson $PaperIndexJson `
    -CodeUrl $CodeUrl `
    -DryRun:$DryRun
