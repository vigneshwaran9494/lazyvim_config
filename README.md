# 🚀 Neovim Configuration

A modern Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim) with enhanced language support, development tools, and productivity features.

## ✨ Features

###  Core Features
- **LazyVim Base**: Built on the excellent LazyVim framework
- **Lazy Loading**: Fast startup with intelligent plugin loading
- **Modern UI**: Clean and intuitive interface
- **File Explorer**: Nvim-tree with enhanced icons and navigation
- **Fuzzy Finder**: Telescope with fzf integration for fast file searching
- **Terminal Integration**: ToggleTerm for seamless terminal access

###  Development Tools
- **LSP Support**: Full Language Server Protocol integration
- **Code Completion**: Intelligent autocompletion with nvim-cmp
- **Syntax Highlighting**: Enhanced with nvim-treesitter
- **Code Formatting**: Automatic formatting with conform.nvim
- **Linting**: Real-time linting with nvim-lint
- **Debugging**: Integrated debugging support with nvim-dap

###  Language Support

#### JavaScript/TypeScript
- **Enhanced LSP**: TypeScript and JavaScript language server
- **ESLint Integration**: Code linting and formatting
- **Prettier**: Code formatting
- **JSX/TSX Support**: Auto-closing tags and syntax highlighting
- **Testing**: Jest integration with neotest
- **Debugging**: Node.js debugging support

#### Web Development
- **React/JSX**: Full React development support
- **Tailwind CSS**: Intelligent CSS class completion
- **HTML/CSS**: Enhanced syntax highlighting and formatting
- **JSON Support**: JSON and JSONC file handling

#### React Native
- **Mobile Development**: React Native specific configurations
- **Platform Support**: iOS and Android debugging
- **Hot Reload**: Development workflow optimization

#### NestJS
- **Backend Development**: NestJS framework support
- **TypeScript**: Enhanced TypeScript features
- **Database Integration**: SQL language server support
- **API Development**: RESTful API development tools

### 🎨 UI/UX Features
- **Modern Theme**: Tokyo Night colorscheme
- **Status Line**: Enhanced status line with git integration
- **Git Integration**: Git signs and blame information
- **Indent Guides**: Visual indent guides
- **Scrollbar**: Custom scrollbar indicators

### 📝 Productivity Features
- **Snippets**: LuaSnip with friendly-snippets
- **Auto-completion**: Intelligent code completion
- **Code Actions**: Quick fixes and refactoring
- **File Navigation**: Enhanced file tree and fuzzy finder
- **Search**: Global search with Telescope

## ️ Installation

### Prerequisites
- Neovim 0.9.0 or higher
- Node.js (for JavaScript/TypeScript support)
- Git

### Setup
1. **Backup your existing Neovim config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Install dependencies**:
   ```bash
   # Install eslint_d for JavaScript/TypeScript linting
   npm install -g eslint_d
   
   # Install Prettier for code formatting
   npm install -g prettier
   ```

4. **Start Neovim**:
   ```bash
   nvim
   ```

##  Configuration

### Key Mappings

#### General Navigation
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags

#### LSP Commands
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

#### Terminal
- `<C-``>` - Toggle terminal

### Plugin Management
- `:Lazy` - Open plugin manager
- `:Lazy sync` - Install/update plugins
- `:Lazy clean` - Remove unused plugins

##  Plugin Structure

```
lua/plugins/
├── core.lua          # Core plugins (file explorer, fuzzy finder, terminal)
├── lsp.lua           # Language Server Protocol configuration
├── lang/
│   ├── js.lua        # JavaScript/TypeScript support
│   ├── ts.lua        # TypeScript specific features
│   ├── web.lua       # Web development tools
│   ├── nest.lua      # NestJS framework support
│   └── react-native.lua # React Native development
```

## 🎯 Language-Specific Features

### JavaScript/TypeScript
- **Inlay Hints**: Type information display
- **Auto Imports**: Automatic import management
- **Refactoring**: Safe refactoring tools
- **Error Detection**: Real-time error highlighting

### React/React Native
- **JSX Support**: Enhanced JSX syntax highlighting
- **Component Navigation**: Quick component navigation
- **Props Completion**: Intelligent props autocompletion

### NestJS
- **Decorator Support**: Enhanced decorator handling
- **Dependency Injection**: DI container support
- **Module Navigation**: Quick module navigation

## 🔍 Troubleshooting

### Common Issues

#### ESLint Errors
If you encounter `ENOENT: no such file or directory` for `eslint_d`:
```bash
npm install -g eslint_d
```

#### Plugin Installation
If plugins fail to install:
```bash
:Lazy sync
```

#### Performance Issues
- Ensure you're using Neovim 0.9.0+
- Check for conflicting plugins with `:Lazy`
- Monitor startup time with `:Lazy profile`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

##  Acknowledgments

- [LazyVim](https://github.com/LazyVim/LazyVim) - The excellent base framework
- [Folke](https://github.com/folke) - For the amazing LazyVim ecosystem
- All plugin authors and contributors

---

**Happy coding! 🚀**
