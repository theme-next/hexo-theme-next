quicklink({
    timeout: {{ theme.quicklink.timeout }},
    priority: {{ theme.quicklink.priority }},
    ignores: [uri => uri.includes('#'),uri => uri == '{{ url.replace('index.html', '') }}',{{ theme.quicklink.ignores }}]
});