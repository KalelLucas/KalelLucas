<?php
/**
 * config.php
 * Configurações centrais: taxas de desconto e nomes amigáveis.
 * Mudar um desconto aqui = mudar em todo o sistema, num só lugar.
 */

// Taxas de desconto por forma de pagamento
const TAXA_DESCONTO_CARTAO  = 0.00;  // Cartão de crédito: sem desconto
const TAXA_DESCONTO_BOLETO  = 0.08;   // Boleto: 8% de desconto
const TAXA_DESCONTO_DEPOSITO = 0.10; // Depósito: 10% de desconto

// Nomes amigáveis para aparecer na mensagem ao usuário
const NOMES_PAGAMENTO = [
    'cartaoCredito' => 'cartão de crédito',
    'boleto'        => 'boleto',
    'deposito'      => 'depósito',
];
