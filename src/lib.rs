use klyx_extension_api as klyx;

pub struct MyExtension;

impl klyx::Extension for MyExtension {
    fn init() {
        klyx::android::show_toast("Hello from MyExtension.");
    }
}

klyx::register_extension!(MyExtension);
