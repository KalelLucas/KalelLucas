// Importa módulos de entrada/saída (I/O) da biblioteca padrão.
// `Write` é necessário para forçar a saída no terminal imediatamente.
use std::io::{self, Write};

fn main() {
    // Título do programa exibido na abertura.
    println!("⚡ Calculadora de Consumo de Energia (Rust) ⚡");

    // Loop principal: repete até o usuário digitar 'n'.
    loop {
        // Lê o nome do aparelho do usuário.
        let nome_aparelho = ler_texto("Digite o nome do aparelho:");

        // Lê potência em watts (W) com validação de número.
        let potencia_w = ler_float("Digite a potência (W):");

        // Lê tempo de uso diário em horas com validação.
        let horas_dia = ler_float("Digite o tempo de uso diário (h):");

        // Calcula e exibe resultados.
        calcular_consumo(&nome_aparelho, potencia_w, horas_dia);

        // Pergunta se o usuário deseja fazer outra consulta.
        let resposta = ler_texto("Deseja calcular outro aparelho? (s/n):");
        if resposta.to_lowercase().trim() == "n" {
            println!("Obrigado por usar a calculadora. Até logo!");
            break; // sai do loop e encerra o programa
        }
    }
}

// Função para ler texto do teclado e retirar espaços extras.
fn ler_texto(pergunta: &str) -> String {
    let mut entrada = String::new();
    print!("{} ", pergunta);

    // Garantir que o prompt seja mostrado antes de ler a linha.
    io::stdout().flush().expect("Falha ao limpar stdout");

    io::stdin().read_line(&mut entrada).expect("Falha ao ler linha");
    entrada.trim().to_string()
}

// Função para ler um número decimal do teclado.
// Repete até o usuário digitar valor válido (float >= 0).
fn ler_float(pergunta: &str) -> f64 {
    loop {
        let texto = ler_texto(pergunta);

        // Parse string para f64, tratamos erros usando `match`.
        match texto.trim().parse::<f64>() {
            Ok(valor) if valor >= 0.0 => return valor,
            Ok(_) => println!("❌ Valor não pode ser negativo. Tente novamente."),
            Err(_) => println!("❌ Entrada inválida. Digite um número válido."),
        }
    }
}

// Função que realiza o cálculo do consumo e do custo e imprime o resultado.
fn calcular_consumo(nome_aparelho: &str, potencia_w: f64, horas_dia: f64) {
    // Fórmula principal do enunciado
    let consumo_mensal = (potencia_w * horas_dia * 30.0) / 1000.0;

    // Tarifa fixa de exemplo
    let tarifa_kwh = 0.75;

    // Calcula custo mensal
    let custo_mensal = consumo_mensal * tarifa_kwh;

    println!("\n--- Resultado ---");
    println!("Aparelho: {}", nome_aparelho);
    println!("Consumo estimado: {:.2} kWh/mês", consumo_mensal);
    println!("Custo estimado: R$ {:.2}/mês", custo_mensal);
    println!("------------------\n");
}