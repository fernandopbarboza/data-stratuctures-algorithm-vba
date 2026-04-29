
'/*
'- Tema: Palindrome Number
'- Pergunta: Dado um número inteiro x, escreva uma função que retorne true se x for um número palíndromo e false caso contrário.
'Um inteiro é um palíndromo quando lido da esquerda para a direita e da direita para a esquerda é o mesmo.
'Você consegue resolver esse problema sem converter o número inteiro para uma string?
'*/

'/*
'- Solução/Código
'*/

Public Function IsPalindrome(ByVal x As Long) As Boolean

'Essa versão é melhor pois:
' - Utiliza Zero Alocação de Memória: Não convertem o número para String/Texto em nenhum momento.
' - Possui O(log₁₀(n)) de Complexidade de Tempo: O laço while roda apenas pela metade do tamanho do número, tornando a execução incrivelmente rápida.

    ' Casos base: negativos ou terminados em 0 (mas diferentes de 0)
    If x < 0 Or (x Mod 10 = 0 And x <> 0) Then
        IsPalindrome = False
        Exit Function
    End If
    
    Dim revertedHalf As Long
    revertedHalf = 0
    
    ' Inverte a metade do número
    While x > revertedHalf
        revertedHalf = (revertedHalf * 10) + (x Mod 10)
        x = x \ 10 ' O uso da "\" garante uma divisão estritamente inteira no VBA
    Wend
    
    ' Retorna Verdadeiro se as metades baterem (com ou sem o dígito central)
    IsPalindrome = (x = revertedHalf) Or (x = (revertedHalf \ 10))
    
End Function

'/*
'- Resposta/Explicação
'Durante a entrevista, não basta apenas escrever o código; você precisa pensar em voz alta para que o entrevistador entenda sua linha de raciocínio. A sua explicação deve seguir esta estrutura:'

'1. Abordagem Inicial e Casos Base (Edge Cases):
'"A primeira coisa que devemos notar é que números negativos nunca serão palíndromos devido ao sinal de menos. Por exemplo, -121 lido de trás para frente é 121-."
'"Além disso, qualquer número que termine em 0 (exceto o próprio 0) não pode ser um palíndromo, pois o primeiro dígito do número teria que ser 0 também, o que não faz sentido em inteiros (ex: 10, 120)."

'2. A Lógica Central (Evitando o Overflow):
'"Para resolver sem converter para string, poderíamos inverter o número inteiro matematicamente. No entanto, inverter um número grande pode causar um problema de overflow (estourar o limite de memória do tipo inteiro)."
'"Para evitar isso e otimizar o algoritmo, minha estratégia é inverter apenas a metade direita do número. Se o número for um palíndromo, a metade direita invertida será exatamente igual à metade esquerda."

'3. Execução do Laço (while):
'"Vou criar uma variável revertedHalf iniciando em 0. Vou extrair o último dígito do número original usando x % 10 e adicioná-lo à minha variável invertida."
'"Para mover o dígito, multiplico o revertedHalf atual por 10. Em seguida, divido o número original por 10 (x / 10) para remover o dígito que acabei de processar."
'"Como saber quando cheguei na metade? Como o x está diminuindo e o revertedHalf está crescendo, o laço para assim que o x for menor ou igual ao revertedHalf."

'4. A Verificação Final (Ímpar vs. Par):
'"Quando o laço terminar, se o tamanho do número original for par, o x será exatamente igual ao revertedHalf."
'"Se o tamanho do número for ímpar (como 12321), o laço vai parar quando x for 12 e revertedHalf for 123. Como o dígito do meio não importa para o palíndromo, eu simplesmente divido o revertedHalf por 10 para descartá-lo antes de comparar com o x."

'5. Complexidade (O "Checkmate" da Entrevista):
'Para fechar a resposta com chave de ouro, você deve declarar a eficiência da sua solução antes mesmo de o entrevistador perguntar:


'Complexidade de Tempo:
'"O tempo de execução é O(log₁₀(n)), pois dividimos a entrada por 10 a cada iteração, processando apenas a metade dos dígitos."

'Complexidade de Espaço: 
'"A complexidade de espaço é O(1) (constante), pois usamos apenas uma variável auxiliar para armazenar o número invertido, não importando o tamanho da entrada.
'*/