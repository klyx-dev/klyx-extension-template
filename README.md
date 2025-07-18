# Klyx Extension Template

A template for creating Klyx extensions using Rust and WebAssembly.

## Overview

This template provides a starting point for building Klyx extensions. It includes:
- Rust project structure with WebAssembly target
- Extension configuration
- Build script for packaging
- Example extension implementation

## Prerequisites

- [Rust](https://rustup.rs/) (latest stable version)
- `wasm32-unknown-unknown` target: `rustup target add wasm32-unknown-unknown`
- `zip` command (usually pre-installed on Linux/macOS)

## Project Structure

```
klyx-extension-template/
├── src/
│   └── lib.rs              # Main extension code
├── extension.toml          # Extension metadata
├── Cargo.toml             # Rust project configuration
├── build.sh               # Build and packaging script
└── README.md              # This file
```

## Getting Started

### 1. Clone and Customize

1. Clone or download this template
2. Update `extension.toml` with your extension details:
   ```toml
   id = "your-extension-id"
   name = "Your Extension Name"
   version = "1.0.0"
   authors = ["Your Name <your.email@example.com>"]
   description = "Description of your extension"
   repository = "https://github.com/yourusername/your-extension"
   ```

3. Update `Cargo.toml` with your project name:
   ```toml
   [package]
   name = "your-extension-name"
   ```

### 2. Implement Your Extension

Edit `src/lib.rs` to implement your extension logic:

```rust
use klyx_extension_api as klyx;

pub struct YourExtension;

impl klyx::Extension for YourExtension {
    fn init() {
        // Your extension initialization code here
        klyx::android::show_toast("Hello from YourExtension!");
    }
}

klyx::register_extension!(YourExtension);
```

### 3. Build and Package

Run the build script to compile and package your extension:

```bash
./build.sh
```

This will:
- Clean previous builds
- Compile your Rust code to WebAssembly
- Package the WASM file and extension configuration into a zip file
- Place the result in the `output/` directory

The final package will be named `{extension-id}-{version}.zip` and contain:
- `extension.toml` (extension metadata)
- `src/your_extension_name.wasm` (compiled WebAssembly)

## Extension Configuration

The `extension.toml` file contains metadata about your extension:

| Field | Description |
|-------|-------------|
| `id` | Unique identifier for your extension |
| `name` | Display name of your extension |
| `version` | Version number (semantic versioning) |
| `schema_version` | Extension schema version (currently 1) |
| `authors` | List of authors |
| `description` | Brief description of functionality |
| `repository` | Source code repository URL |
| `requested_memory_size` | Memory allocation for WASM environment (MB) |

## API Reference

This template uses the `klyx_extension_api` crate. Check the [official repository](https://github.com/klyx-dev/klyx_extension_api) for the latest API reference.

## Troubleshooting

### Common Issues

**Build fails with "target not found"**
```bash
rustup target add wasm32-unknown-unknown
```

**Permission denied on build.sh**
```bash
chmod +x build.sh
```

**Missing zip command**
- Ubuntu/Debian: `apt install zip`
- macOS: `brew install zip`
- Windows: Use WSL or install zip manually

### Debugging

To debug WASM compilation issues:
```bash
cargo build --target wasm32-unknown-unknown --release --verbose
```

To inspect the generated WASM:
```bash
wasm-objdump -x target/wasm32-unknown-unknown/release/your_extension.wasm
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This template is provided under the MIT License. See the LICENSE file for details.

## Support

For questions about Klyx extension development:
- Open an issue in the Klyx repository
- Join the [community discussions](https://discord.gg/z9WWyJjtGy)

---

Happy extension building! 🚀
