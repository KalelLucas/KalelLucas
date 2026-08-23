<?php
/**
 * processa_compra.php
 * Controller: recebe o POST, instancia a Compra, monta a mensagem.
 * Retorna um array com os dados — NÃO gera HTML (isso é com os templates).
 * PHP puro, sem nenhum echo.
 */

require_once __DIR__ . '/classes/Compra.php';

function processarCompra(): ?array
{
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        return null;
    }

    $nome           = $_POST['txtNome']        ?? '';
    $valorCompra    = $_POST['txtValorCompra'] ?? 0;
    $formaPagamento = $_POST['cmbPag']         ?? '';

    $compra = new Compra($nome, $valorCompra, $formaPagamento);

    if (!$compra->isPagamentoValido()) {
        return [
            'tipo'     => 'erro',
            'mensagem' => 'Forma de pagamento inválida.',
        ];
    }

    $nomePagamento = $compra->getNomeFormaPagamento();
    $desconto      = $compra->getDesconto();
    $valorFinal    = $compra->getValorFinal();   // <-- bug corrigido

    if ($desconto > 0) {
        $mensagem = sprintf(
            "Olá %s, sua compra de R$ %.2f foi realizada com %s. " .
            "Seu desconto é de R$ %.2f e o valor final é R$ %.2f.",
            $compra->getNome(),
            $compra->getValorCompra(),
            $nomePagamento,
            $desconto,
            $valorFinal
        );
    } else {
        $mensagem = sprintf(
            "Olá %s, sua compra de R$ %.2f foi realizada com %s. " .
            "Não há desconto. Valor final: R$ %.2f.",
            $compra->getNome(),
            $compra->getValorCompra(),
            $nomePagamento,
            $valorFinal
        );
    }

    return [
        'tipo'     => 'sucesso',
        'mensagem' => $mensagem,
    ];
}
