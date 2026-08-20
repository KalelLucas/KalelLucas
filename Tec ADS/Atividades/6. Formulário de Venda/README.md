# Loja PHP Pura — HTML + CSS + PHP, cada um no seu arquivo

Stack: **HTML puro, CSS puro, PHP puro**. Sem JS, sem HTMX, sem framework,
sem npm, sem build. Roda direto no XAMPP.

## Estrutura

```
loja_pura/
├── assets/
│   └── estilo.css              ← CSS puro (todo o visual)
├── views/
│   ├── layout.html             ← HTML da página inteira, com {{resultado}}
│   └── resultado.html          ← Fragmento HTML do painel de resultado
├── classes/
│   ├── Template.php            ← Motor de templates (lê HTML, troca {{chaves}})
│   └── Compra.php              ← Model: lógica de negócio (PHP puro)
├── config.php                  ← Constantes: taxas de desconto
├── processa_compra.php         ← Controller: recebe POST, retorna dados
└── index.php                   ← Entry point: orquestra tudo
```

## Como funciona a separação

```
   POST  →  index.php  →  processa_compra.php  →  Compra.php  (cálculos)
                          ↓ retorna array com dados
                  index.php  →  Template->set()  →  views/resultado.html
                          ↓
                  index.php  →  Template->set()  →  views/layout.html
                          ↓
                          echo HTML final
```

- **HTML** não tem uma linha de PHP — só `{{placeholders}}` que o Template troca.
- **CSS** não tem uma linha de PHP nem JS — puro.
- **PHP** não tem um `echo "<html>"` — só `echo $template->render()` em `index.php`.

## Como rodar no XAMPP

1. Copie a pasta `loja_pura/` para `C:\xampp\htdocs\` (ou o caminho do seu XAMPP).
2. Inicie o Apache no painel do XAMPP.
3. Acesse <http://localhost/loja_pura/index.php>.
4. Preencha o formulário e clique em **Calcular**.

## Bugs corrigidos do código original

| Bug                                     | Correção                                  |
| --------------------------------------- | ----------------------------------------- |
| Boleto com 10% (deveria ser 8%)         | `TAXA_DESCONTO_BOLETO = 0.08`             |
| Depósito com 8% (deveria ser 10%)       | `TAXA_DESCONTO_DEPOSITO = 0.10`           |
| Mensagem não mostrava valor com desconto| Incluído `getValorFinal()` + `sprintf`     |

## Sobre WASM (não usado aqui)

WebAssembly só vale a pena quando há **computação pesada** no navegador.
Exemplos reais onde faria sentido:

- Processar/compactar imagem antes de fazer upload
- Criptografia client-side (ex: bcrypt, AES)
- Processar áudio/vídeo em tempo real
- Jogos ou simulações físicas
- Rodar bibliotecas C/Rust dentro do navegador (ex: FFmpeg.wasm, SQLite.wasm)

Para um cálculo de desconto (`valor * 0.1`), o overhead de carregar
um `.wasm` é desproporcional ao benefício. PHP resolve em 1 linha.

Se um dia você precisar de WASM, basta:
1. Compilar um `.wasm` (em C, Rust, etc.)
2. Servir como arquivo estático (XAMPP serve direto)
3. Carregar via `WebAssembly.instantiate()` em uma tag `<script>` mínima

...mas de novo: para esse projeto, **não precisa**.
