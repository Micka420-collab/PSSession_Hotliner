# Lecture locale des variables d'environnement de clés API IA (masquées).
# Rien n'est envoyé ni écrit sur disque.
function Get-LocalAIKeys {
    $names = 'OPENAI_API_KEY','ANTHROPIC_API_KEY','AZURE_OPENAI_API_KEY'
    foreach ($n in $names) {
        $v = [Environment]::GetEnvironmentVariable($n,'User')
        if (-not $v) { $v = [Environment]::GetEnvironmentVariable($n,'Machine') }
        [pscustomobject]@{
            Variable = $n
            Définie  = [bool]$v
            Aperçu   = if ($v) { $v.Substring(0,4) + '…' + $v.Substring($v.Length-4) } else { '' }
        }
    }
}
