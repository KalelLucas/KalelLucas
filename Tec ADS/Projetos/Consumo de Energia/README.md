# ⚡ Calculadora de Consumo de Energia

![Python](https://img.shields.io/badge/Python-3.8+-blue?logo=python&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completo-success)
![Energy](https://img.shields.io/badge/Energy-Calculator-yellow?logo=electricity)

## 📋 Sobre o Projeto

Sistema simples e eficiente para calcular o consumo mensal de energia elétrica de aparelhos domésticos. Desenvolvido em Python puro, sem dependências externas, facilitando a execução em qualquer ambiente.

### 🎯 Objetivo

Ajudar usuários a compreender e estimar o consumo de energia de seus aparelhos eletrônicos, bem como o custo mensal associado.

---

## 🔧 Tecnologias Utilizadas

- ![Python](https://img.shields.io/badge/Python-3.8+-blue?logo=python&logoColor=white)
- 💻 Linha de comando (CLI)
- 📊 Cálculos de energia elétrica

---

## 📐 Fórmula Utilizada

```
Consumo Mensal (kWh) = (Potência × Horas/Dia × 30) / 1000

Custo Mensal (R$) = Consumo Mensal × Tarifa por kWh
```

**Onde:**
- **Potência**: Em watts (W)
- **Horas/Dia**: Tempo de uso diário em horas
- **Tarifa**: R$ 0,75 por kWh (valor aproximado)

---

## 🚀 Como Executar

### Pré-requisitos
- Python 3.8 ou superior instalado

### Passos

1. **Clone ou baixe o projeto:**
   ```bash
   git clone <url-do-repositorio>
   cd "Tec ADS/Projetos/Consumo de Energia"
   ```

2. **Execute o programa:**
   ```bash
   python3 app.py
   ```

3. **Siga as instruções na tela:**
   - Digite o nome do aparelho
   - Informe a potência em watts
   - Indique o tempo de uso diário em horas

4. **Veja os resultados:**
   - Consumo mensal em kWh
   - Custo estimado em reais

---

## 📸 Exemplo de Uso

```
============================================================
⚡ CALCULADORA DE CONSUMO DE ENERGIA ⚡
============================================================

📱 Nome do aparelho: Geladeira
⚡ Potência em watts (W): 150
🕐 Tempo de uso por dia (horas): 10

============================================================
✨ RESULTADO FINAL ✨
============================================================
Aparelho: Geladeira
Potência: 150.0 W
Uso diário: 10.0 horas
------------------------------------------------------------
💡 Consumo estimado: 45.00 kWh/mês
💰 Custo estimado: R$ 33.75/mês
============================================================
```

---

## 📝 Funcionalidades

✅ Cálculo de consumo mensal em kWh  
✅ Cálculo de custo estimado em R$  
✅ Validação de entrada (rejeita valores negativos)  
✅ Interface amigável com emojis  
✅ Opção de calcular múltiplos aparelhos  
✅ Funciona em qualquer Python 3.8+  
✅ Sem dependências externas  

---

## 💡 Exemplos de Consumo Típicos

| Aparelho | Potência | Uso/Dia | Consumo/Mês | Custo/Mês |
|----------|----------|---------|-------------|-----------|
| Geladeira | 150W | 10h | 45 kWh | R$ 33,75 |
| TV 32" LED | 80W | 4h | 9,6 kWh | R$ 7,20 |
| Chuveiro Elétrico | 5500W | 0,25h | 41,25 kWh | R$ 30,94 |
| Ar-condicionado | 1500W | 8h | 360 kWh | R$ 270,00 |
| Microondas | 1200W | 0,5h | 18 kWh | R$ 13,50 |

---

## 🎓 Caso de Uso - Educacional

Este projeto foi desenvolvido para fins educacionais com o objetivo de:

- 📚 Aprender conceitos de programação em Python
- 🔢 Compreender cálculos de energia elétrica
- 💰 Despertar consciência sobre consumo de energia
- ♻️ Contribuir para sustentabilidade energética

---

## 📧 Autor

**Kalel Lucas**  
Aluno de **Tecnologia em Análise e Desenvolvimento de Sistemas**  
Atividade de Python - ADS

---

## 📜 Licença

Este projeto está sob a licença MIT. Sinta-se livre para usar, modificar e distribuir!

---

## 🤝 Contribuições

Sugestões de melhorias são bem-vindas! Você pode:
- Adicionar suporte a diferentes tarifas por região
- Implementar interface gráfica
- Adicionar banco de dados de aparelhos
- Exportar relatórios em PDF

---

## ⚠️ Disclaimer

Os valores de consumo e custo são **estimados**. Os valores reais podem variar de acordo com:
- Modelo específico do aparelho
- Condições de uso
- Tarifa de energia da sua região
- Eficiência energética do equipamento

Consulte sua conta de energia para valores precisos!

---

**Desenvolvido com ❤️ para deixar a energia mais inteligente** ⚡

