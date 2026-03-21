#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Calculadora de Consumo de Energia
Calcula o consumo mensal e custo estimado de aparelhos eletrônicos
"""

# Tarifa média de energia elétrica (R$ por kWh)
TARIFA_KWH = 0.75

def main():
    print("=" * 60)
    print("⚡ CALCULADORA DE CONSUMO DE ENERGIA ⚡")
    print("=" * 60)
    print()
    
    while True:
        try:
            # Entrada de dados
            nome_aparelho = input("📱 Nome do aparelho: ").strip()
            if not nome_aparelho:
                print("❌ Por favor, digite o nome do aparelho!")
                continue
            
            potencia_str = input("⚡ Potência em watts (W): ").strip()
            potencia = float(potencia_str)
            
            tempo_str = input("🕐 Tempo de uso por dia (horas): ").strip()
            tempo = float(tempo_str)
            
            # Validações
            if potencia < 0 or tempo < 0:
                print("❌ Potência e tempo devem ser valores positivos!")
                continue
            
            # Cálculos
            consumo_mensal = (potencia * tempo * 30) / 1000
            custo_mensal = consumo_mensal * TARIFA_KWH
            
            # Exibir resultado formatado
            print()
            print("=" * 60)
            print("✨ RESULTADO FINAL ✨")
            print("=" * 60)
            print(f"Aparelho: {nome_aparelho}")
            print(f"Potência: {potencia:.1f} W")
            print(f"Uso diário: {tempo:.1f} horas")
            print("-" * 60)
            print(f"💡 Consumo estimado: {consumo_mensal:.2f} kWh/mês")
            print(f"💰 Custo estimado: R$ {custo_mensal:.2f}/mês")
            print("=" * 60)
            print()
            
            # Opção de calcular novamente
            novamente = input("Deseja calcular outro aparelho? (s/n): ").strip().lower()
            if novamente != 's':
                print("\n👋 Obrigado por usar a calculadora!")
                break
            print()
            
        except ValueError:
            print("❌ Por favor, digite valores numéricos válidos!")
            print()


if __name__ == "__main__":
    main()