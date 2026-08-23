<?php
/**
 * Template.php
 * Motor de templates MÍNIMO: carrega um arquivo HTML e substitui placeholders
 * {{chave}} por valores. Permite manter o HTML 100% separado do PHP.
 *
 * Não é um framework, é só str_replace com açúcar sintático — o suficiente
 * pra quem quer trabalhar com HTML/CSS/PHP puros no XAMPP.
 */
class Template
{
    private string $conteudo;

    public function __construct(string $caminho)
    {
        if (!file_exists($caminho)) {
            throw new RuntimeException("Template não encontrado: $caminho");
        }
        $this->conteudo = file_get_contents($caminho);
    }

    /** Substitui {{chave}} por $valor. Aceita string ou null (vira vazio). */
    public function set(string $chave, $valor): self
    {
        $valor = $valor === null ? '' : (string) $valor;
        $this->conteudo = str_replace('{{' . $chave . '}}', $valor, $this->conteudo);
        return $this;
    }

    /** Renderiza: retorna o HTML com placeholders substituídos. */
    public function render(): string
    {
        // Limpa qualquer placeholder que não tenha sido preenchido
        return preg_replace('/\{\{[^}]+\}\}/', '', $this->conteudo);
    }

    public function __toString(): string
    {
        return $this->render();
    }
}
