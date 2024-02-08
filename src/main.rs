use clap::Parser;

#[derive(Parser, Debug)]
#[clap(author = "anntnzrb", version)]
struct Args {
    /// do not toggle me
    #[arg(short = 'z')]
    woo: bool,

    /// optional thing
    thing: Option<String>,
}

fn main() {
    let args = Args::parse();

    if args.woo {
        println!("Easter egg?\n\t-> {args:?}");
    }

    match args.thing {
        Some(x) => println!("I... {x}?"),
        None => println!("I am using... Nix!"),
    }
}
