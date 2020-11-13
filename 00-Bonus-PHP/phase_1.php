<?php
// Exo 1.1 Calculatrice

echo "<h1>Exercice 1.1</h1>\n";

function calculatrice($x, $y, $op)
{
    //vérifie que les paramètres $x et $y sont des entiers
    if (is_integer($x) && is_integer($y))
    {
        //on rempli un tableau avec les signes que notre fonction prend en compte
        $signes = ['+', '-', '*', '/'];

        //on test si le paramètre $op est l'un des signes du tableau de signes, si c'est le cas array_search renvoie un entier
        if (is_integer(array_search($op, $signes)))
        {
            //on affiche les paramètres
            echo $x." ";
            echo $op." ";
            echo $y." ";

            //on fait un switch sur $op pour savoir quelle opération on doit faire sur $x et $y
            switch ($op)
            {
                //addition
                case '+':
                    //on affiche le résultat de l'addition entre $x et $y
                    echo "= ".($x + $y);
                break;
        
                //soustraction
                case '-':
                    //on affiche le résultat de la soustraction entre $x et $y
                    echo "= ".($x - $y);
                break;
        
                //multiplication
                case '*':
                    //on affiche le résultat de la multiplication entre $x et $y
                    echo "= ".($x * $y);
                break;
        
                //division
                case '/':
                    //on test si $y n'est pas égale à zéro, les divisions par zéro sont impossibles
                    if ($y != 0)
                    {
                        //on affiche le résultat de la division entre $x et $y
                        echo "= ".($x / $y);
                    }
                break;
                
                //cas défaut du switch, inutile ici car avant de faire le switch on vérifie que le signe est un cas traité
                default:
                    //message qui ne s'affichera jamais
                    echo "heu...";
                break;
            }
            echo "\n<br>\n";
        }
        else //le paramètre $op n'est pas un signe reconnu
        {
            //affichage d'un message d'erreur
            echo "Le troisième paramètre n'est pas un opérateur reconnu.\n<br>\n";
        }
    }
    else //soit $x, soit $y n'est pas un entier
    {
        //si $x n'est pas un entier
        if (!is_integer($x))
        {
            //affichage d'un message d'erreur
            echo "Le premier paramètre n'est pas un entier.\n<br>\n";
        }

        //si $y n'est pas un entier
        if (!is_integer($y))
        {
            //affichage d'un message d'erreur
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

//code corrigé
$a = [];

for ($i=1; $i < 26; $i++) 
{
    $a[] = $i;
}

//création d'une chaîne de caractères $str qui affichera le contenu de $a
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
    //$C0 est l'argent placé initialement
    //$n le nombre d'année de la durée du placement
    //$i le taux en pourcentage que rapporte le placement par an

    //on affiche la somme d'argent placée à l'année 0
    echo "Placement initial : ".$C0."€\n<br>\n";
    //on crée une variable $Cn qui contiendra l'argent du placement en fonction de sa durée, on lui donne la valeur à l'année 0 donc $C0
    $Cn = $C0;
    //on fait tourner une boucle de l'année 1 à l'année $n pour calculer l'état du placement année après année
    for ($k = 1; $k < $n+1; $k++)
    {
        //on ajoute les intérêts du placement
        $Cn = $Cn * (1+($i/100));
        //on affiche l'état du placement à l'année $k
        echo "Placement après ".$k." an(s) : ".$Cn."€\n<br>\n";
    }
}

$Somme = 100000;

echo "<h2>Solution A</h2>\n";

Placement($Somme, 5, 4);

echo "<h2>Solution B</h2>\n";

Placement($Somme, 4, 5);
