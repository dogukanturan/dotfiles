# Environment Setup and Plugin Installation

This repository contains scripts to set up your development environment and install necessary plugins. Please follow the steps below to get started.


## Prerequisites

Ensure you have the following prerequisites installed:
- `git`
- `make`
- A compatible shell environment (e.g., zsh)


## Step 1: Environment Setup

First, you need to prepare your environment. Run the following command in your terminal:

```bash
make all
```

This command will:


## Step 2: Plugin Installation

After setting up the environment, you need to install various plugins. To do this, run the install_plugins.sh script:

```bash
./install_plugins.sh
```


## Clean Up
If you need to clean up your environment, you can run:

```bash
make clean
```

This will remove all the directories, files, and symbolic links that were created during the setup process.


## License
This project is licensed under the Apache License 2.0. See the LICENSE file for more details.


## Contributing
Contributions are welcome! Please submit a pull request or open an issue if you have suggestions or bug reports.