use clap::Parser;
use color_eyre::eyre::Result;

#[derive(Parser, Debug)]
#[clap(author = "anntnzrb", version)]
struct Args {
    /// do not toggle me
    #[arg(short = 'z')]
    woo: bool,

    /// optional thing
    thing: Option<String>,
}

fn do_something() {
    let args = Args::parse();

    if args.woo {
        todo!("Easter egg?\n\t-> {args:?}");
    }

    args.thing
        .map_or_else(|| println!("I am using... Nix!"), |x| println!("I... {x}?"));
}

fn main() -> Result<()> {
    color_eyre::install()?;

    do_something();

    Ok(())
}
