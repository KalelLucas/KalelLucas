pub fn calcular_consumo(potencia_w: f64, horas_por_dia: f64) -> f64 {
    (potencia_w * horas_por_dia * 30.0) / 1000.0
}

pub fn calcular_custo(consumo_kwh: f64, tarifa: f64) -> f64 {
    consumo_kwh * tarifa
}