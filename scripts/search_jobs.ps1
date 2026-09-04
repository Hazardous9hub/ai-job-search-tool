$env:Path += ";$env:USERPROFILE\.bun\bin"

$searches = @(
    @{ Query = "Data Analyst"; Location = "Hyderabad, Telangana, India" },
    @{ Query = "Business Analyst"; Location = "Hyderabad, Telangana, India" },
    @{ Query = "BI Analyst"; Location = "Hyderabad, Telangana, India" },
    @{ Query = "Product Analyst"; Location = "Hyderabad, Telangana, India" },
    @{ Query = "Data Scientist"; Location = "Hyderabad, Telangana, India" },
    @{ Query = "Data Analyst"; Location = "Remote" }
)

foreach ($search in $searches) {
    Write-Host "`n===== $($search.Query) | $($search.Location) =====" -ForegroundColor Cyan

    bun run .agents/skills/linkedin-search/cli/src/cli.ts search `
        --query $search.Query `
        --location $search.Location `
        --jobage 30 `
        --limit 10 `
        --format json
}