use klyx_extension_api as klyx;
use std::{env, fs::File, io::Write, path::Path};

struct MyExtension;

impl klyx::Extension for MyExtension {
    fn new() -> Self {
        klyx::show_toast("Hello, I am a test extension", klyx::ToastDuration::Long);
        // Read the env variable "PWD"
        let pwd = env::var("PWD").expect("PWD not set");

        // Resolve the path to the file inside the preopened dir
        let file_path = Path::new(&pwd).join("hello.txt");

        // Create and write to the file
        let mut file = File::create(&file_path).expect("Failed to create file");
        file.write_all(b"Hello, WASI with PWD!\n").expect("Failed to write");

        println!("Wrote to file: {}", file_path.display());
        Self
    }

    fn uninstall(&mut self) {
        klyx::show_toast("Uninstalling...", klyx::ToastDuration::Short);
    }
}

klyx::register_extension!(MyExtension);
