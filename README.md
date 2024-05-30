# Dotfiles

Welcome to my dotfiles repository! This repository contains all my custom configurations for various tools and applications that I use. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage these configuration files and create symbolic links in the appropriate directories.

## How to use

### Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)

### Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/your-username/dotfiles.git
   cd dotfiles
   ```

2. Use stow to create symbolic links for the desired configurations. For example, to apply the bash configurations, use:

   ```bash
   stow bash
   ```
