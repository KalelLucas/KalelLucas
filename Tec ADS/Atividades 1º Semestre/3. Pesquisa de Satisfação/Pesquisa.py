# ============================================================
# PESQUISA DE OPINIÃO - TudoWeb Marketing
# ATIVIDADE AG8 - Estrutura FOR
# ============================================================

def main():
    # NÚMERO DE ENTREVISTADOS
    total = 50
    
    # CONTADORES
    excelente = 0
    bom = 0
    ruim = 0
    
    print("=" * 50)
    print("   PESQUISA DE SATISFAÇÃO - TUDOWEB")
    print("=" * 50)
    print(f"\nEntrevistas: {total} pessoas")
    print("1 = EXCELENTE | 2 = BOM | 3 = RUIM")
    print("-" * 50)
    
    # ====== ESTRUTURA DE REPETIÇÃO FOR ======
    for i in range(1, total + 1):
        
        print(f"\n--- Pessoa {i} de {total} ---")
        
        # Pede o NOME
        nome = input("Nome: ")
        
        # Pede a IDADE
        idade = input("Idade: ")
        
        # Pede a OPINIÃO com validação
        while True:
            opiniao = input("Opinião (1/2/3): ")
            
            # ====== ESTRUTURA DE DECISÃO ======
            if opiniao == "1":
                excelente += 1
                print(">> Registrado: EXCELENTE ✓")
                break
                
            elif opiniao == "2":
                bom += 1
                print(">> Registrado: BOM ✓")
                break
                
            elif opiniao == "3":
                ruim += 1
                print(">> Registrado: RUIM ✓")
                break
                
            else:
                print("!! ERRO: Digite 1, 2 ou 3 !!")
    
    # ====== RESULTADO FINAL ======
    print("\n" + "=" * 50)
    print("       📊 RESULTADO DA PESQUISA")
    print("=" * 50)
    print(f"\na) EXCELENTE: {excelente} respostas")
    print(f"b) RUIM:      {ruim} respostas")
    print(f"   BOM:       {bom} respostas")
    print("-" * 50)
    print(f"   TOTAL:     {total} entrevistados")
    print("=" * 50)

# Executa o programa
main()
