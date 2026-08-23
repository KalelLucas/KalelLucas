<?php
/**
 * index.php
 * Entry point: orquestra processamento + renderização.
 * PHP puro — nenhum echo de HTML direto. Só inclui templates e injeta valores.
 *
 * Fluxo:
 *   1. processa_compra() retorna dados (ou null)
 *   2. Se houver resultado, renderiza views/resultado.html num HTML de painel
 *   3. Carrega views/layout.html e injeta esse HTML em {{resultado}}
 *   4. Imprime o layout final
 */

require_once __DIR__ . '/classes/Template.php';
require_once __DIR__ . '/processa_compra.php';

// 1. Processa o formulário (se houver POST)
$resultado = processarCompra();

// 2. Se houver resultado, monta o HTML do painel a partir do template
$htmlResultado = '';
if ($resultado !== null) {
    $tplResultado = new Template(__DIR__ . '/views/resultado.html');
    $tplResultado->set('tipo_painel', $resultado['tipo'] === 'sucesso' ? 'sucesso' : 'erro');
    // Escapa HTML pra evitar XSS vindo do nome digitado pelo usuário
    $tplResultado->set('mensagem', htmlspecialchars($resultado['mensagem'], ENT_QUOTES, 'UTF-8'));
    $htmlResultado = $tplResultado->render();
}

// 3. Carrega o layout e injeta o resultado (vazio se não houver)
$layout = new Template(__DIR__ . '/views/layout.html');
$layout->set('resultado', $htmlResultado);

// 4. Saída final — único echo de toda a aplicação
echo $layout->render();
