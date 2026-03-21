from pywebio.input import input, NUMBER
from pywebio.output import put_text, put_html, clear

def calcular_consumo():
    clear()
    
    # Esconder o footer do PyWebIO
    put_html("""
    <style>
        .pywebio-footer { display: none !important; }
        body { background: #f0f4f8 !important; }
    </style>
    """)
    
    put_html("""
    <div style="text-align: center; margin-bottom: 30px;">
        <h1>⚡ Calculadora de Consumo de Energia</h1>
        <p style="color: #7f8c8d;">Calcule quanto de energia seu aparelho consome por mês</p>
    </div>
    """)
    
    # Entrada de dados
    nome = input("📱 Digite o nome do aparelho:", placeholder="Ex: Geladeira, TV, etc")
    potencia = input("⚡ Digite a potência em watts (W):", type=NUMBER, placeholder="Ex: 150, 500")
    horas = input("🕐 Digite as horas de uso por dia:", type=NUMBER, placeholder="Ex: 8, 10")
    
    # Cálculo
    consumo_mensal = (potencia * horas * 30) / 1000
    
    # Resultado com estilo
    put_html(f"""
    <div style="
        background: linear-gradient(135deg, #27ae60 0%, #229954 100%);
        color: white;
        padding: 30px;
        border-radius: 10px;
        margin-top: 30px;
        text-align: center;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    ">
        <h2>✨ Resultado Final</h2>
        <hr style="border: 1px solid rgba(255,255,255,0.3);">
        <p><strong>Aparelho:</strong> {nome}</p>
        <p><strong>Potência:</strong> {potencia} W</p>
        <p><strong>Uso diário:</strong> {horas} horas</p>
        <hr style="border: 1px solid rgba(255,255,255,0.3);">
        <h3>Consumo mensal: <span style="font-size: 32px;">{consumo_mensal:.2f} kWh</span></h3>
    </div>
    """)
    
    # Opção de calcular novamente
    put_html('<div style="margin-top: 30px; text-align: center;">')
    if input("Deseja calcular outro aparelho?", type="checkbox"):
        calcular_consumo()


if __name__ == "__main__":
    from pywebio import start_server
    
    # Versão local com interface web
    start_server(calcular_consumo, port=8080, debug=False)