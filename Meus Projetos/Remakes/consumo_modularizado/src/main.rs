mod consumo;
mod io;

use consumo::{calcular_consumo, calcular_custo};
use io::{ler_float, confirmar};

fn main() {
    println!("Calculadora de Consumo de Energia (modularizada)");

    loop {
        let potencia = ler_float("Potência do aparelho (W): ");
        let horas_dia = ler_float("Horas por dia de uso: ");
        let tarifa = ler_float("Tarifa de energia (R$/kWh): ");

        let consumo = calcular_consumo(potencia, horas_dia);
        let custo = calcular_custo(consumo, tarifa);

        println!(
            "Consumo mensal: {:.2} kWh | Custo mensal: R$ {:.2}",
            consumo, custo
        );

        if !confirmar("Deseja calcular outro aparelho? (s/n): ") {
            break;
        }
    }

    println!("Tchau!");
}
