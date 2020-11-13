<?php
    // -- Exo 1
    /**
     * @param $class
     * @return bool
     */
    function checkClass($class)
    {
        ////Cette fonction vérifie qu'un objet a une des classes acceptées prédéfinies

        //Récupération du nom de la classe de l'objet passé en paramètre
        $class_name = get_class($class);

        //Vérification si le paramètre est bien un objet (get_class renvoie faux dans ce cas)
        if ($class_name == false)
        {
            //On renvoie donc faux car le paramètre n'est pas un objet d'une classe autorisée
            return false;
        }
        else //Si le paramètre est un objet, on a donc récupéré le nom de sa classe
        {
            //On crée un tableau qui contient le nom des différentes classes acceptées
            $class_acceptees = ['Foo', 'User', 'Country'];

            //On utilise array_search pour savoir si le nom de la classe apparaît dans le tableau, si oui, il renvoie le numéro de la case, si non, il renvoie faux. Donc on vérifie si le résultat est un entier
            if (is_integer(array_search($class_name, $class_acceptees)))
            {
                //La classe de l'objet passé en paramètre fait parti des classes acceptées, on renvoie donc vrai
                return true;
            }
            else
            {
                //La classe de l'objet passé en paramètre ne fait pas parti des classes acceptées, on renvoie donc faux
                return false;
            }
        }
    }

    // -- Exo 2
    /**
     * @param $word
     * @return bool
     */
    function checkAnagramme($word)
    {
        ////Cette fonction vérifie si un mot passé en paramètre est un anagramme d'un autre
        ////un anagramme est un mot qui utilise les même lettres qu'un autre
        ////il n'y pas de répétition de lettres, donc les anagrammes d'un mot ont la même longueur que l'original

        //On enregistre le mot dont le paramètre doit être l'anagramme en minuscule dans une variable
        $anagram = strtolower("ravie");

        //On vérifie si le mot passé en paramètre fait la même longueur que $anagram
        if (strlen($word) == strlen($anagram))
        {
            //On transforme le mot passé en paramètre en une version avec tout les caractères en minuscule
            $word = strtolower($word);

            //On crée un tableau pour enregistrer tout les caractères de $anagram
            $anagramTab = [];
            //On fait tourner une boucle pour ranger chaque caractères de $anagram dans les cases du tableau $anagramTab
            for ($i = 0; $i < strlen($word); $i++)
            {
                $anagramTab[] = $anagram{$i};
            }

            //On fait tourner une boucle pour tester chaque lettres du mot passé en paramètre
            for ($i = 0; $i < strlen($word); $i++)
            {
                //On utilise array_search pour savoir si la lettre existe dans $anagramTab, si oui, on enregistre le numéro de la case du tableau dans $k, si non, $k est mis à faux.
                $k = array_search($word{$i}, $anagramTab);
                //On vérifie si $k est un entier (donc si la lettre existe dans $anagram)
                if (is_integer($k))
                {
                    //La lettre étant déjà présente dans le mot, on la retire du tableau, car elle ne pourra pas être utiliser deux fois
                    array_slice($anagramTab, $k, 1);
                }
                else //La lettre n'existe pas dans $anagram, ce n'est pas un anagramme
                {
                    //Les mots ne sont pas anagrammes l'un de l'autre, on retourne donc faux
                    return false;
                }
            }
        }
        else //Les mots sont d'une longueur différente
        {
            //Les mots ne sont pas anagrammes l'un de l'autre, on retourne donc faux
            return false;
        }

        //Si on sort de toutes les boucles, c'est que le mots sont anagrammes l'un de l'autre, on peut donc retourner vrai
        return true;
    }

    // -- Exo 4
    /**
     * @param $word
     * @return bool
     */
    function checkPalindrome($word) {
        ////Cette fonction vérifie si un mot passé en paramètre est un palindrome
        ////un palindrome est un mot dont l'ordre des lettres reste le même qu'on le lise de gauche à droite ou de droite à gauche 

        //On transforme le mot passé en paramètre en une version avec tout les caractères en minuscule
        $word = strtolower($word);

        //On fera des tests sur la moitié du mot, on effectue une division entière par 2 sur la longueur du mot passé en paramètre (en cas de longueur impaire, la lettre centrale ne sera pas testé car elle sera toujours égale à elle même)
        for ($i = 0; $i < intdiv(strlen($word), 2); $i++)
        {
            //On vérifie si la lettre du mot n'est pas égale à celle à la même position en lisant le mot de droite à gauche
            if ($word{$i} != $word{strlen($word)-1-$i})
            {
                //Les deux lettres sont différentes, donc le mot n'est pas un palindrome, on peut retourner faux
                return false;
            }
        }

        //Si on sort de la boucle, c'est que le mot est un palindrome, on peut donc retourner vrai
        return true;
    }

    // -- Exo 5
    /**
     * @param $word
     * @return string
     */
    function checkBlackBox($word) {
        ////Cette fonction crypte une chaîne de caractères en suivant une table de substitution et renvoie le résultat
        //////Deux méthodes peuvent être utilisées
        //////la méthode avec $convert qui utilise un tableau à deux dimensions
        //////la méthode avec $double qui utilise un tableau associatif

        //initialisation de la table de substitution

        //$convert est un tableau de substitution à deux dimensions
        //dans la première ligne on a les caractères à crypter
        //dans la seconde ligne on a les caractères de substitution
        $convert = [
            [
                'a', 'b', 'c', 'd', 'e',
                'f', 'g', 'h', 'i', 'j',
                'k', 'l', 'm', 'n', 'o',
                'p', 'q', 'r', 's', 't',
                'u', 'v', 'w', 'x', 'y',
                'z',
                '1', '2', '3', '4',
                '6',      '8', '9'
            ],
            [
                'b', 'c', 'd', 'e', 'f',
                'g', 'h', 'i', 'j', 'k',
                'l', 'm', 'n', 'o', 'p',
                'q', 'r', 's', 't', 'u',
                'v', 'w', 'x', 'y', 'z',
                'a',
                '87', '14', '21',  '2',
                '42',       '56', '63'
            ]];

        //$double est un tableau de substitution associatif
        //les clés du tableau sont les caractères à crypter
        //les valeurs du tableau sont les caractères de substitution
        $double = [
            'a' => 'b', 'b' => 'c', 'c' => 'd',
            'd' => 'e', 'e' => 'f', 'f' => 'g',
            'g' => 'h', 'h' => 'i', 'i' => 'j',
            'j' => 'k', 'k' => 'l', 'l' => 'm',
            'm' => 'n', 'n' => 'o', 'o' => 'p',
            'p' => 'q', 'q' => 'r', 'r' => 's',
            's' => 't', 't' => 'u', 'u' => 'v',
            'v' => 'w', 'w' => 'x', 'x' => 'y',
            'y' => 'z', 'z' => 'a',

            '1' => '87', '2' => '14', '3' => '21',
            '4' =>  '2', '6' => '42',
            '8' => '56', '9' => '63'
        ];

        //On initialise la variable qui contiendra la chaîne de caractères cryptée
        $password = "";

        //On fait autant de tour de boucle qu'il y a de caractères dans la chaîne passée en paramètre
        for ($i = 0; $i < strlen($word); $i++)
        {
            ////---- avec $convert ----////
            /* Avec array_search on cherche si le caractère existe dans la première ligne du tableau (on récupère dans $k, soit le numéro de la case du tableau, soit faux si le caractère n'existe pas dans la table) */
            $k = array_search($word{$i}, $convert[0]);
            /* On test si $k est un entier (donc si le caractère existe dans la table de substitution) */
            if (is_integer($k))
            {
                /* On concatène notre chaîne cryptée avec le caractère de substitution correspondant dans la seconde ligne du tableau */
                $password = $password.$convert[1][$k];
            }
            else /* $k n'est pas un entier (donc le caractère n'existe pas dans la table de substitution) */
            {
                /* On concatène notre chaîne cryptée avec le caractère par défaut 'a' */
                $password = $password."a";
            }
            ////----------------------////

            ////---- avec $double ----////
            // /* Avec array_key_exists on test si le caractère existe dans notre table de substitution */
            // if (array_key_exists($word{$i}, $double))
            // {
            //     /* On concatène notre chaîne cryptée avec le caractère de substitution */
            //     $password = $password.$double[$word{$i}];
            // }
            // else /* Le caractère n'existe pas dans notre table de substitution */
            // {
            //     /* On concatène notre chaîne cryptée avec le caractère par défaut 'a' */
            //     $password = $password."a";
            // }
            ////----------------------////
        }

        //On renvoie la chaîne de caractères cryptée complète
        return $password;
    }