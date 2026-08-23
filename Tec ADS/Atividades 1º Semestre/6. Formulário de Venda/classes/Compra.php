<?php
/**
 * Compra.php
 * Model: encapsula a lógica de negócio de uma compra.
 * PHP puro — nenhum echo, nenhum HTML aqui.
 */

require_once __DIR__ . '/../config.php';

class Compra
{
    private string $nome;
    private float  $valorCompra;
    private string $formaPagamento;

    public function __construct($nome, $valorCompra, $formaPagamento)
    {
        $this->nome           = trim((string) $nome);
        $this->valorCompra    = (float) $valorCompra;
        $this->formaPagamento = (string) $formaPagamento;
    }

    public function getNome(): string           { return $this->nome; }
    public function getValorCompra(): float      { return $this->valorCompra; }
    public function getFormaPagamento(): string  { return $this->formaPagamento; }

    /**
     * Retorna a taxa de desconto conforme a forma de pagamento.
     * null = forma de pagamento inválida.
     */
    public function getTaxaDesconto(): ?float
    {
        return match ($this->formaPagamento) {
            'cartaoCredito' => TAXA_DESCONTO_CARTAO,
            'boleto'         => TAXA_DESCONTO_BOLETO,
            'deposito'       => TAXA_DESCONTO_DEPOSITO,
            default          => null,
        };
    }

    public function isPagamentoValido(): bool
    {
        return $this->getTaxaDesconto() !== null;
    }

    public function getDesconto(): float
    {
        $taxa = $this->getTaxaDesconto();
        return $taxa === null ? 0.0 : $this->valorCompra * $taxa;
    }

    /** Valor final já com desconto aplicado (corrige o bug do código original). */
    public function getValorFinal(): float
    {
        return $this->valorCompra - $this->getDesconto();
    }

    public function getNomeFormaPagamento(): string
    {
        return NOMES_PAGAMENTO[$this->formaPagamento] ?? '';
    }
}
