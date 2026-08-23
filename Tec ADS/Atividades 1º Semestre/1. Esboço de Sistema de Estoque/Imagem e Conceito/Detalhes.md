# Zoneamento e Estrutura do Layout

Para garantir uma experiência de usuário intuitiva e eficiente, o sistema foi estruturado em **três zonas funcionais distintas**, seguindo o padrão de leitura ocidental (da esquerda para a direita) e hierarquia de ações.

## 1. Zona de Controle (Sidebar Lateral)
*   **Posicionamento:** Lateral Esquerda (Fixa).
*   **Largura:** 300px.
*   **Função:** Atua como o "painel de comando" do sistema. Por estar sempre visível, concentra as ferramentas de busca, filtros, menus de navegação e o histórico.
*   **Justificativa UX:** Manter a navegação fixa reduz o esforço cognitivo do usuário, que não precisa rolar a página para acessar ferramentas essenciais ou adicionar novos itens.

## 2. Zona de Trabalho (Área Central)
*   **Posicionamento:** Centro/Direita (Rolável).
*   **Comportamento:** Ocupa o espaço restante.
*   **Função:** Exibição do estoque em formato de grade (Grid). É a área de leitura e análise de dados.
*   **Justificativa UX:** O fundo rolável permite visualizar grandes volumes de dados, enquanto o fundo escuro divide visualmente esta área da área de ferramentas, focando a atenção nos cartões de produto (ilhas de luz).

## 3. Zona de Ação (Rodapé Fixo)
*   **Posicionamento:** Inferior (Fixo).
*   **Altura:** 120px.
*   **Função:** Área de "Drop Zone" (Arrastar e Soltar). Dividida em "Entrada" e "Saída".
*   **Justificativa UX:** Fixar esta área na parte inferior evita que o usuário precise subir e descer a página para realizar movimentações de estoque. A divisão esquerda/direita (Sol/Mar) cria uma metáfora visual intuitiva para Adicionar/Remover itens.

---

### Resumo da Hierarquia Visual

| Elemento | Nível | Visibilidade |
| :--- | :--- | :--- |
| **Cartões de Produto** | Primário | Alta (Fundo claro, central) |
| **Botões de Ação (Rodapé)** | Secundário | Média (Fundo escuro, destaque cor) |
| **Sidebar/Menus** | Terciário | Baixa (Fundo escuro, discreto) |