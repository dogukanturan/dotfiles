function mklab --description "Create a lab directory and optionally open in VS Code"
    set lab_base ~/source/lab
    set opt_git false
    set opt_no_open false
    set opt_template ""
    set opt_list false
    set opt_delete ""
    set lab_name ""

    set i 1
    while test $i -le (count $argv)
        switch $argv[$i]
            case --base
                set i (math $i + 1)
                set lab_base $argv[$i]
            case --git
                set opt_git true
            case --no-open
                set opt_no_open true
            case --template
                set i (math $i + 1)
                set opt_template $argv[$i]
            case --list
                set opt_list true
            case --delete
                set i (math $i + 1)
                set opt_delete $argv[$i]
            case --help -h
                echo "Usage: mklab <name> [options]"
                echo ""
                echo "Options:"
                echo "  --base <path>         Base directory (default: ~/source/lab)"
                echo "  --git                 Initialize a git repository"
                echo "  --no-open             Skip VS Code open prompt"
                echo "  --template <type>     Scaffold template: node, python, go"
                echo "  --list                List existing lab directories"
                echo "  --delete <name>       Delete a lab directory"
                return 0
            case '*'
                set lab_name $argv[$i]
        end
        set i (math $i + 1)
    end

    if test $opt_list = true
        echo "Lab directories in $lab_base:"
        for d in $lab_base/*/
            echo "  "(basename $d)
        end
        return 0
    end

    if test -n "$opt_delete"
        set del_target "$lab_base/$opt_delete"
        if not test -d $del_target
            echo "Directory not found: $del_target"
            return 1
        end
        read --prompt "echo \"Delete '$del_target'? [y/N] \"" --local confirm
        if string match -qi "y" -- $confirm
            rm -rf $del_target
            echo "Deleted: $del_target"
        else
            echo "Aborted."
        end
        return 0
    end

    if test -z "$lab_name"
        echo "Usage: mklab <name> [options]"
        echo "Run 'mklab --help' for more information."
        return 1
    end

    set target "$lab_base/$lab_name"

    mkdir -p $target
    and cd $target
    or return 1

    echo "Created and entered: $target"

    if test $opt_git = true
        git init
    end

    switch $opt_template
        case node
            echo '{"name": "'$lab_name'", "version": "1.0.0"}' > package.json
            echo "node_modules/\n.env" > .gitignore
            echo "console.log('hello from $lab_name');" > index.js
            echo "Scaffolded: node template"
        case python
            echo "# $lab_name" > main.py
            echo "__pycache__/\n*.pyc\n.env\nvenv/" > .gitignore
            echo "Scaffolded: python template"
        case go
            echo 'package main\n\nimport "fmt"\n\nfunc main() {\n\tfmt.Println("hello from '$lab_name'")\n}' > main.go
            echo "Scaffolded: go template"
        case ''
        case '*'
            echo "Unknown template '$opt_template'. Available: node, python, go"
    end

    if test $opt_no_open = false
        read --prompt "echo 'Open in VS Code? [y/N] '" --local answer
        if string match -qi "y" -- $answer
            code .
        end
    end
end
