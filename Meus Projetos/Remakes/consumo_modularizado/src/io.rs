use std::io::{self, Write};

pub fn ler_float(prompt: &str) -> f64 {
    loop {
        print!("{}", prompt);
        io::stdout().flush().unwrap();

        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();

        match input.trim().replace(',', ".").parse::<f64>() {
            Ok(valor) if valor >= 0.0 => return valor,
            _ => println!("Entrada inválida. Digite um número válido."),
        }
    }
}

pub fn confirmar(prompt: &str) -> bool {
    loop {
        print!("{}", prompt);
        io::stdout().flush().unwrap();

        let mut resposta = String::new();
        io::stdin().read_line(&mut resposta).unwrap();

        match resposta.trim().to_lowercase().as_str() {
            "s" | "sim" => return true,
            "n" | "nao" | "não" => return false,
            _ => println!("Responda s/Sim ou n/Não."),
        }
    }
}
