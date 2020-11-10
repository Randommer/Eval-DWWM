<?php
// Exo 1.1 Calculatrice

echo "<h1>Exercice 1.1</h1>\n";

function calculatrice($x, $y, $op)
{
    if (is_integer($x) && is_integer($y))
    {
        $signes = ['+', '-', '*', '/'];
        if (is_integer(array_search($op, $signes)))
        {
            echo $x." ";
            echo $op." ";
            echo $y." ";
            switch ($op) {
                case '+':
                    echo "= ".($x + $y);
                    break;
        
                case '-':
                    echo "= ".($x - $y);
                    break;
        
                case '*':
                    echo "= ".($x * $y);
                    break;
        
                case '/':
                    if ($y != 0)
                    {
                        echo "= ".($x / $y);
                    }
                    break;
                
                default:
                    echo "heu...";
                    break;
            }
            echo "\n<br>\n";
        }
        else
        {
            echo "Le troisième paramètre n'est pas un opérateur reconnu.\n<br>\n";
        }
    }
    else
    {
        if (!is_integer($x))
        {
            echo "Le premier paramètre n'est pas un entier.\n<br>\n";
        }
        if (!is_integer($y))
        {
            echo "Le deuxième paramètre n'est pas un entier.\n<br>\n";
        }
    }
}

echo "<p>\n";
echo "Appel de <code>calculatrice(1, 2 , '+')</code> :\n<br>\n";
calculatrice(1, 2 , '+');
echo "</p>\n";

echo "<p>\n";
echo "Appel de <code>calculatrice(2, 1 , '-')</code> :\n<br>\n";
calculatrice(2, 1 , '-');
echo "</p>\n";

echo "<p>\n";
echo "Appel de <code>calculatrice(2, 2 , '*')</code> :\n<br>\n";
calculatrice(2, 2 , '*');
echo "</p>\n";

echo "<p>\n";
echo "Appel de <code>calculatrice(4, 2 , '/')</code> :\n<br>\n";
calculatrice(4, 2 , '/');
echo "</p>\n";

echo "<p>\n";
echo "Appel de <code>calculatrice(2, 0 , '/')</code> :\n<br>\n";
calculatrice(2, 0 , '/');
echo "</p>\n";

// Exo 1.2

echo "<h1>Exercice 1.2</h1>\n";

$a = [];

for ($i=1; $i < 26; $i++) 
{
    $a[] = $i;
}

$str = "\$a = [ ".$a[0];
for ($i=1; $i < count($a); $i++) 
{
    //echo "\$a[".($i)."] : ".$a[$i]."\n<br>\n";
    $str = $str.", ".$a[$i];
}
$str = $str." ]\n<br>\n";
echo $str;

// Exo 1.3

echo "<h1>Exercice 1.3</h1>\n";

function Placement($C0, $n, $i)
{
    echo "Placement initial : ".$C0."€\n<br>\n";
    $Cn = $C0;
    for ($k = 1; $k < $n+1; $k++)
    {
        $Cn = $Cn * (1+($i/100));
        echo "Placement après ".$k." an(s) : ".$Cn."€\n<br>\n";
    }
}

$Somme = 100000;

echo "<h2>Solution A</h2>\n";

Placement($Somme, 5, 4);

echo "<h2>Solution B</h2>\n";

Placement($Somme, 4, 5);

echo "<h1>Zone Test</h1>\n";

function checkBlackBox($word) {
    $convert = [
        ['a', 'z', 'e', 'r', 't', 'y',  '3',  '6', 'p', 'q',  '9', '4',  '1', 'o', 'd', 's', 'v', 'g', 'k', 'j'],
        ['b', 'a', 'f', 's', 'u', 'z', '21', '42', 'q', 'r', '63', '2', '87', 'p', 'e', 't', 'w', 'h', 'l', 'k']];
    $password = "";
    for ($i = 0; $i < strlen($word); $i++)
    {
        $k = array_search($word{$i}, $convert[0]);
        if (is_integer($k))
        {
            $password = $password.$convert[1][$k];
        }
        else
        {
            $password = $password."a";
        }
    }
    return $password;
}

$str = "fakgvhebv";
echo $str."<br>\n";
$bool = checkBlackBox($str);
echo $bool;