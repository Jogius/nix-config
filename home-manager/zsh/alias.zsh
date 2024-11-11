alias cdp="cd /home/jogius/Documents/projects"

runcpp() {
    # Check if a filename is provided
    if [ -z "$1" ]; then
        echo "Usage: runcpp <filename.cpp> [args...]"
        return 1
    fi
    
    # Extract the filename without the extension
    filename="${1%.cpp}"

    # Compile the C++ script to a binary
    g++ -o "$filename" "$1"
    
    # Check if compilation was successful
    if [ $? -ne 0 ]; then
        echo "Compilation failed."
        return 1
    fi

    echo "Compilation done. Running ..."

    # Run the binary with the remaining arguments (shift removes the first argument)
    shift
    ./"$filename" "$@"
}

alias kali="VirtualBoxVM --startvm kali"
alias squeak="nix run /home/jogius/Documents/hpi-studies/WiSe_24_25/SWA/squeak/#squeak"

