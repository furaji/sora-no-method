#![feature(non_ascii_idents)]

struct 天体;

impl 天体 {
    fn new() -> Self {
        天体 {}
    }

    fn メソッド(&self) {
        println!("天体のメソッド");
    }
}

fn main() {
    天体::new().メソッド();
}
