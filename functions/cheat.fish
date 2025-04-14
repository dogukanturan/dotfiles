function cheat
    if test (count $argv) -eq 0
        echo "Usage: cheat <command> [topic]"
        return 1
    end

    set query (string join / $argv)
    curl -s "https://cheat.sh/$query" | less -R
end

